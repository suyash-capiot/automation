#!/bin/bash
NOW=$(date +"%Y%m%d")
echo [$NOW]
cd $5/$4/
sed -i 1d $5/$4/$NOW/*.txt
sort -u -t',' -k2,2 $5/$4/$NOW/*.txt >>DesiyaHotel.txt
cd $1
ORACLE_HOME=$2; export ORACLE_HOME
./sqlldr $3 control=$6/$4/ctl/Desiya.ctl log=$5/$4/$NOW/DesiyaHotel.log bad=$5/$4/$NOW/DesiyaHotel.bad, errors=43340