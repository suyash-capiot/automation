#!/bin/bash
echo $1
cd $2
ORACLE_HOME=$3; export ORACLE_HOME
DB_con=$4
echo $DB_con
sql=$5
echo $sql
./sqlplus $DB_con @$sql/Export_Product.sql $1


