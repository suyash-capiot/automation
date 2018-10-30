#!/bin/sh

#if [ $3 ]; then
#	echo OK
#else
#	echo not ok
#	exit "ERROR: Incorrect parameters"
#fi

export envVar=$1
#export WLSPASSWORD=$2
#export WLSURL=$3

export JAVA_HOME=/opt/java/jdk1.8.0_73
export ANT_HOME=/opt/Oracle/Middleware/Oracle_Home/oracle_common/modules/org.apache.ant_1.9.2
export PATH=$JAVA_HOME/bin:$ANT_HOME/bin:$PATH

export MW_HOME=/opt/Oracle/Middleware/Oracle_Home
export CLASSPATH=/opt/apache-ant-1.9.6/bin/scripts/com.coxandkings.deploy.jar
echo "Sourcing Environment /opt/Oracle/Middleware/Oracle_Home/osb/tools/configjar/setenv.sh"
. /opt/Oracle/Middleware/Oracle_Home/osb/tools/configjar/setenv.sh
echo "Sourcing Environment /opt/Oracle/Middleware/Oracle_Home/wlserver/server/bin/setWLSEnv.sh"
. /opt/Oracle/Middleware/Oracle_Home/wlserver/server/bin/setWLSEnv.sh

export CLASSPATH=/opt/apache-ant-1.9.6/bin/scripts/com.coxandkings.deploy.jar:$CLASSPATH

echo File is "[$JENKINS_HOME/jobs/$JOB_NAME/builds/$BUILD_NUMBER/changelog.xml"
# cat $JENKINS_HOME/jobs/$JOB_NAME/builds/$BUILD_NUMBER/changelog.xml

export outfile=$JENKINS_HOME/jobs/$JOB_NAME/builds/$BUILD_NUMBER/c.xml
export tmpJARs=$JENKINS_HOME/jobs/$JOB_NAME/builds/$BUILD_NUMBER/JARs
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
#cat $outfile | grep -v SharedArtifacts | grep -v SharedSDArtifacts | awk '{print $5 " " $6}' | grep '^[M|A] ' | awk '{print $2}' | cut -f1 -d\/ > $sources

# If there are multiple checkins to a project, the 'sources' file would contain
# duplicate. Therefore, sort and extract unique names in sources file.
#sort $sources | uniq >> $sourcesunq
#rm $sources
#mv $sourcesunq $sources

echo $ENV_PROJECTS_SELECTED | sed 's# #\n#g'> $sources

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

echo "Creating artefacts directory at: [$WORKSPACE/JARs]"
mkdir $tmpJARs
mkdir $WORKSPACE/JARs
for i in `find $WORKSPACE/OSB/ -name "*.$envVar" `; do j=`echo $i | sed 's/.'$envVar'$//g'`;`mv $i  $j`; done
echo 'ant command is --- ant -f $WORKSPACE/Automation/osbDeployScript.xml -Dbasedir=$WORKSPACE/OSB -DjarDir=$tmpJARs -DsettingsFile=/$WORKSPACE/Automation/connParams-$envVar.properties -Dsrcfile=$sources'
ant -f $WORKSPACE/Automation/osbDeployScript.xml -Dbasedir=$WORKSPACE/OSB -DjarDir=$tmpJARs -DsettingsFile=$WORKSPACE/Automation/connParams-$envVar.properties -Dsrcfile=$sources
echo "JARs for this build are available at [$tmpJARs]"
echo "JARs being copied to [$WORKSPACE/JARs]"
cp -r $tmpJARs/*.jar $WORKSPACE/JARs
ls -1 $tmpJARs/*.jar >> $depfile.1
sed "s#$tmpJARs/##g" $depfile.1 > $depfile
sed 's#.jar$##g' $depfile > $rmfile

echo "srcfile : [$sources]"
echo "depfile : [$depfile]"
echo "rmfile  : [$rmfile]"

#echo "Invoking python to remove projects for deployment..."
#java weblogic.WLST $WORKSPACE/Automation/DeleteMultipleaOSB.py $sources $WLSUSER $WLSPASSWORD $WLSURL

#Deploying the config JAR
echo "ant -f $WORKSPACE/Automation/osbDeployScript.xml -Dbasedir=$WORKSPACE/OSB -Dsrcfile=$depfile -DjarDir=$tmpJARs -DsettingsFile=$WORKSPACE/Automation/connParams.properties write"
ant -f $WORKSPACE/Automation/osbDeployScript.xml -Dbasedir=$WORKSPACE/OSB -Dsrcfile=$depfile -DjarDir=$tmpJARs -DsettingsFile=$WORKSPACE/Automation/connParams-$envVar.properties write
