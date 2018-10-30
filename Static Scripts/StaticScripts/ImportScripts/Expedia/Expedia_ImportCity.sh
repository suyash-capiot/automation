#!/bin/bash
NOW=$(date +"%Y%m%d")
echo [$NOW]
cd $5/$4/
sed -i 1d $5/$4/$NOW/City/*.txt
sort -u -t'|' -k1,1 $5/$4/$NOW/City/*.txt >>ExpediaCity.txt
cd $1
ORACLE_HOME=$2; export ORACLE_HOME
./sqlldr $3 control=$6/$4/ctl/Expedia_ImportCity.ctl log=$5/$4/$NOW/ExpediaCity.log bad=$5/$4/$NOW/ExpediaCity.bad