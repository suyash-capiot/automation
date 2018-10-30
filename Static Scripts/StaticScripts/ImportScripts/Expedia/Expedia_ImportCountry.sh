#!/bin/bash
NOW=$(date +"%Y%m%d")
echo [$NOW]
cd $5/$4/
sed -i 1d $5/$4/$NOW/Country/*.txt
sort -u -t'|' -k1,1 $5/$4/$NOW/Country/*.txt >>ExpediaCountry.txt
cd $1
ORACLE_HOME=$2; export ORACLE_HOME
./sqlldr $3 control=$6/$4/ctl/Expedia_ImportCountry.ctl log=$5/$4/$NOW/ExpediaCountry.log bad=$5/$4/$NOW/ExpediaCountry.bad
