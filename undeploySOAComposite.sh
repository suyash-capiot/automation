#export baseDir=$WORKSPACE/SOA
#export mdsDir=$WORKSPACE/apps
#export outDir=$WORKSPACE/JARs
#export projName=TransfersSearchFlow

#export envVar=$1
export url=$1
export userName=$2
export password=$3

export MW_HOME=/opt/Oracle/Middleware/Oracle_Home
export OSB_HOME=$MW_HOME/osb
export SOA_HOME=$MW_HOME/soa
export WL_HOME=$MW_HOME/wlserver


#. $OSB_HOME/tools/configjar/setenv.sh

export PATH=$MW_HOME/oracle_common/modules/org.apache.ant_1.9.2/bin:$PATH
export CLASSPATH=$MW_HOME/oracle_common/commons-cli/commons-cli/1.2.0/commons-cli-1.2.jar:$CLASSPATH

echo " environment variable CLASSPATH value "

echo " ====================================== "

echo " env variable : $CLASSPATH"

echo " ====================================== "

echo " environment variable PATH value "

echo " ====================================== "

echo " env variable : $PATH"

#sh /opt/SourceCode/SOAMDSBuild.sh $basedir $mdsDir $outDir $projName

#export outfile=$JENKINS_HOME/jobs/$JOB_NAME/builds/$BUILD_NUMBER/c.xml
#export tmpJARs=$JENKINS_HOME/jobs/$JOB_NAME/builds/$BUILD_NUMBER/JARs
export sources=$JENKINS_HOME/jobs/$JOB_NAME/builds/$BUILD_NUMBER/sources
#export sourcesunq=$JENKINS_HOME/jobs/$JOB_NAME/builds/$BUILD_NUMBER/sourcesunq
#export depfile=$JENKINS_HOME/jobs/$JOB_NAME/builds/$BUILD_NUMBER/depfile
#export rmfile=$JENKINS_HOME/jobs/$JOB_NAME/builds/$BUILD_NUMBER/rmfile
#cp $JENKINS_HOME/jobs/$JOB_NAME/builds/$BUILD_NUMBER/changelog.xml $outfile

#perl -p -i -e 's/path\>/\n/g' $outfile

OLDIFS=$IFS
IFS='
'

echo $ENV_PROJECTS_SELECTED | sed 's# #\n#g'> $sources

w_count=`wc -w $sources | awk '{print $1}'`
echo "Current Working Directory is [`pwd`]"
env

echo "Start Changed Projects:"
echo $sources
echo "End Changed Projects:"

export IFS=$OLDIFS
env

export baseDir=$WORKSPACE/SOA
export mdsDir=$WORKSPACE
export outDir=$WORKSPACE/JARs


fileName=$sources

cat $fileName | while read LINE

do

echo " Project Name is  $LINE"

echo "========================"
   ant -f $SOA_HOME/bin/ant-sca-deploy.xml undeploy -DserverURL=$url -DcompositeName=$LINE -Drevision=1.0 -Duser=$userName -Dpassword=$password
echo "=========="

done
