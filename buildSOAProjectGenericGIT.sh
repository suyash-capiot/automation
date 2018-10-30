#export baseDir=$WORKSPACE/SOA
#export mdsDir=$WORKSPACE/apps
#export outDir=$WORKSPACE/JARs
#export projName=TransfersSearchFlow

export envVar=$1
export url=$2
export userName=$3
export password=$4

export MW_HOME=/opt/Oracle/Middleware/Oracle_Home
export OSB_HOME=$MW_HOME/osb
export SOA_HOME=$MW_HOME/soa
export WL_HOME=$MW_HOME/wlserver


. $OSB_HOME/tools/configjar/setenv.sh

export PATH=$MW_HOME/oracle_common/modules/org.apache.ant_1.9.2/bin:$MW_HOME/oracle_common/commons-cli/commons-cli/1.2.0/commons-cli-1.2.jar:$PATH
export CLASSPATH=$WORKSPACE/Automation/com.coxandkings.deploy.jar:$MW_HOME/oracle_common/commons-cli/commons-cli/1.2.0/commons-cli-1.2.jar:$CLASSPATH

#sh /opt/SourceCode/SOAMDSBuild.sh $basedir $mdsDir $outDir $projName

export outfile=$JENKINS_HOME/jobs/$JOB_NAME/builds/$BUILD_NUMBER/c.xml
#export tmpJARs=$JENKINS_HOME/jobs/$JOB_NAME/builds/$BUILD_NUMBER/JARs
export sources=$JENKINS_HOME/jobs/$JOB_NAME/builds/$BUILD_NUMBER/sources
export sourcesunq=$JENKINS_HOME/jobs/$JOB_NAME/builds/$BUILD_NUMBER/sourcesunq
export depfile=$JENKINS_HOME/jobs/$JOB_NAME/builds/$BUILD_NUMBER/depfile
export rmfile=$JENKINS_HOME/jobs/$JOB_NAME/builds/$BUILD_NUMBER/rmfile
cp $JENKINS_HOME/jobs/$JOB_NAME/builds/$BUILD_NUMBER/changelog.xml $outfile

perl -p -i -e 's/path\>/\n/g' $outfile

OLDIFS=$IFS
IFS='
'
touch $sources
cat $outfile | grep -v SharedArtifacts | grep -v SharedSDArtifacts | awk '{print $5 " " $6}' | grep '^[M|A] ' | awk '{print $2}' | cut -f1 -d\/ > $sources


# If there are multiple checkins to a project, the 'sources' file would contain
# duplicate. Therefore, sort and extract unique names in sources file.
sort $sources | uniq >> $sourcesunq
rm $sources
mv $sourcesunq $sources

w_count=`wc -w $sources | awk '{print $1}'`
echo "Current Working Directory is [`pwd`]"
env
if [ $w_count == 0 ]; then
	echo ERROR: No changed Sources
	exit 0
fi

echo "Start Changed Projects:"
echo $sources
echo "End Changed Projects:"

export IFS=$OLDIFS
env

mkdir $WORKSPACE/JARs
export baseDir=$WORKSPACE/SOA
export mdsDir=$WORKSPACE
export outDir=$WORKSPACE/JARs

#for i in `find $WORKSPACE/apps/ -name "*.$envVar" `; do j=`echo $i | sed 's/.DEV$//g'`;`mv $i  $j`; done
for i in `find $WORKSPACE/OSB/ -name "*.$envVar" `; do j=`echo $i | sed 's/.'$envVar'$//g'`;`mv $i  $j`; done

fileName=$sources

cat $fileName | while read LINE

do

echo " Project Name is  $LINE"

echo "========================"

echo  "$WORKSPACE/Automation/SOAMDSBuild.sh $baseDir $mdsDir $outDir $LINE"


echo "========================"

echo "Calling another script "


. $WORKSPACE/Automation/SOAMDSBuild.sh $baseDir $mdsDir $outDir $LINE



 #ant -f $SOA_HOME/bin/ant-sca-package.xml -DcompositeDir=$baseDir/$projName/SOA -DcompositeName=$projName -Drevision=1.0 -Dsoamds.apps.home=$mdsDir -Dscac.application.home=$baseDir -Ddeploy.composite.name=$outDir/sca_"$projName"_rev1.0.jar
 
# ant -f $SOA_HOME/bin/ant-sca-package.xml -DcompositeDir="$baseDir"/"$LINE"/SOA -DcompositeName=$LINE -Drevision=1.0 -Dsoamds.apps.home="$mdsDir"/apps -Dscac.application.home=$baseDir -Ddeploy.composite.name=$outDir/sca_"$LINE"_rev1.0.jar 
 
 echo "ant -f $SOA_HOME/bin/ant-sca-package.xml -DcompositeDir="$baseDir"/"$LINE"/SOA -DcompositeName=$LINE -Drevision=1.0 -Dsoamds.apps.home="$mdsDir"/apps -Dscac.application.home=$baseDir -Ddeploy.composite.name=$outDir/sca_"$LINE"_rev1.0.jar"
 
 echo "=========="
 
 ant -f $SOA_HOME/bin/ant-sca-package.xml -DcompositeDir="$baseDir"/"$LINE"/SOA -DcompositeName=$LINE -Drevision=1.0 -Dsoamds.apps.home="$mdsDir" -Dscac.application.home=$baseDir -Ddeploy.composite.name=$outDir/sca_"$LINE"_rev1.0.jar 
 
#ant -f $SOA_HOME/bin/ant-sca-deploy.xml -DserverURL=http://10.25.6.140:8001 -DsarLocation="$outDir"/"$LINE"_MDS.zip -Doverwrite=true -DfailOnError=true -Duser=weblogic -Dpassword=Capiot321

#ant -f $SOA_HOME/bin/ant-sca-deploy.xml -DserverURL=http://10.21.32.215:8001 -DsarLocation="$outDir"/"$LINE"_MDS.zip -Doverwrite=true -DfailOnError=true -Duser=weblogic -Dpassword=Admin123

echo "ant -f $SOA_HOME/bin/ant-sca-deploy.xml -DserverURL=$url -DsarLocation="$outDir"/"$LINE"_MDS.zip -Doverwrite=true -DfailOnError=true -Duser=$userName -Dpassword=$password"

echo "=========="

ant -f $SOA_HOME/bin/ant-sca-deploy.xml -DserverURL=$url -DsarLocation="$outDir"/"$LINE"_MDS.zip -Doverwrite=true -DfailOnError=true -Duser=$userName -Dpassword=$password

#ant -f $SOA_HOME/bin/ant-sca-deploy.xml -DserverURL=http://10.25.6.140:8001 -DsarLocation="$outDir"/sca_"$LINE"_rev1.0.jar -Doverwrite=true -DfailOnError=true -Duser=weblogic -Dpassword=Admin123

#ant -f $SOA_HOME/bin/ant-sca-deploy.xml -DserverURL=$url -DsarLocation="$outDir"/sca_"$LINE"_rev1.0.jar -Doverwrite=true -DfailOnError=true -Duser=weblogic -Dpassword=Admin123

echo "ant -f $SOA_HOME/bin/ant-sca-deploy.xml -DserverURL=$url -DsarLocation="$outDir"/sca_"$LINE"_rev1.0.jar -Doverwrite=true -DfailOnError=true -Duser=$userName -Dpassword=$password"

echo "=========="

ant -f $SOA_HOME/bin/ant-sca-deploy.xml -DserverURL=$url -DsarLocation="$outDir"/sca_"$LINE"_rev1.0.jar -Doverwrite=true -DfailOnError=true -Duser=$userName -Dpassword=$password

done
