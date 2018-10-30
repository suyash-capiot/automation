#!/bin/bash
var=$1
varOracle_bin=$2
varOracle_home=$3
varDb_con=$4
ExportScriptPath=$5
AccoPath=$6
echo $var
echo $varOracle_bin
echo $varOracle_home
echo $varDb_con
echo $AccoPath
pwd
#NOW=`$(date +"%Y%m%d")`
NOW=`date +"%Y%m%d"`
echo [$NOW]
mkdir -p $AccoPath/$NOW/$var
chmod -R 777 $AccoPath/$NOW/$var
cd $ExportScriptPath
pwd
. $ExportScriptPath/Product_Export.sh $var $varOracle_bin $varOracle_home $varDb_con $ExportScriptPath
echo $var Product complete

. $ExportScriptPath/Country_Export.sh $var $varDb_con $ExportScriptPath
echo $var Country complete

. $ExportScriptPath/City_Export.sh $var $varDb_con $ExportScriptPath
echo $var City complete
