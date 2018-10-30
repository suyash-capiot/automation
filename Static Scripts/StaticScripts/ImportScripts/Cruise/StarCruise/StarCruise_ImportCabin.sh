#!/bin/bash
#echo [$1] #Oracle_bin
#echo [$2] #Oracle_Home
#echo [$3] #Db_con
#echo [$4] #Supplier_name
#echo [$5] #Inbound Path
#echo [$6] #ImportPath
NOW=$(date +"%Y%m%d")
echo [$NOW]
cd /tmp/Static/Inbound/Cruise/StarCruise/
sed -i 1d /tmp/Static/Inbound/Cruise/StarCruise/$NOW/Cabin/*.csv
cd /tmp/Static/Inbound/Cruise/StarCruise/
sort -t',' -k2,2 /tmp/Static/Inbound/Cruise/StarCruise/$NOW/Cabin/*.csv >>StarCruise_ImportCabin.csv
cd /opt/app/oracle/product/12.1.0.2/db_1/bin
ORACLE_HOME=/opt/app/oracle/product/12.1.0.2/db_1/; export ORACLE_HOME
./sqlldr C##STATICDATA/static123@cnkdev control=/tmp/Static/StaticScripts/ImportScripts/StarCruise/ctl/StarCruise_ImportCabin.ctl log=/tmp/Static/Inbound/Cruise/StarCruise/$NOW/Cabin/StarCruise_ImportCabin.log bad=/tmp/Static/Inbound/Cruise/StarCruise/$NOW/Cabin/StarCruise_ImportCabin.bad, errors=9999