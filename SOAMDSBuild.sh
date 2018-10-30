. $OSB_HOME/tools/configjar/setenv.sh

#export CLASSPATH=/opt/SourceCode/com.coxandkings.deploy.jar:$CLASSPATH

echo $1 $2 $3 $4

echo -========================== CLASSPATH    ============================== $CLASSPATH

echo " The actual parameters are"

echo "=========="

echo "ant -f $WORKSPACE/Automation/build.xml -Dsoa.proj.dir=$1/$4 -Dlocal.mds.dir=$2/apps -Dout.zip.dir=$3 createSOAProjectMDSZip"

ant -f $WORKSPACE/Automation/build.xml -Dsoa.proj.dir=$1/$4 -Dlocal.mds.dir=$2/apps -Dout.zip.dir=$3 createSOAProjectMDSZip


#ant -Dsoa.proj.dir=$1/$4 -Dlocal.mds.dir=$2 -Dout.zip.dir=$3 createSOAProjectMDSZip
