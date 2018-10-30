#!/bin/bash
NOW=$(date +"%Y%m%d")
echo [$NOW]
var=$1
echo $var
cd $6/$4/
cd $1
ORACLE_HOME=$2; export ORACLE_HOME
./sqlplus $3 @$6/$4/sql/TripVilas_ImportCity.sql $var log=$5/$4/$NOW/TripVilas_ImportCity.log bad=$5/$4/$NOW/TripVilas_ImportCity.bad,errors=10000