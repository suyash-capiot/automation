#!/bin/bash
echo [$1] #Oracle_bin
echo [$2] #Oracle_Home
echo [$3] #Db_con
echo [$4] #Supplier_name
echo [$5] #Inbound Path
echo [$6] #ImportPath

cd $5/$4/
cd $1
ORACLE_HOME=$2; export ORACLE_HOME
./sqlldr $3 control=$6/$4/ctl/Bonotel_Renovation.ctl log=$5/$4/Bonotel_Renovation.log bad=$5/$4/Bonotel_Renovation.bad

cd $6/$4
cd $1
ORACLE_HOME=$2; export ORACLE_HOME
./sqlplus $3 @$6/$4/Bonotel_Renovation.sql