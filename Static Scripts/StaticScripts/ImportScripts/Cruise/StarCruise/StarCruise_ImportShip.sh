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
sed -i 1d /tmp/Static/Inbound/Cruise/StarCruise/$NOW/Ship/*.csv
cd /tmp/Static/Inbound/Cruise/StarCruise/
sort -u -t',' -k1,1 /tmp/Static/Inbound/Cruise/StarCruise/$NOW/Ship/*.csv >>StarCruise_ImportShip.csv
cd /opt/app/oracle/product/12.1.0.2/db_1/bin
ORACLE_HOME=/opt/app/oracle/product/12.1.0.2/db_1/; export ORACLE_HOME
./sqlldr C##STATICDATA/static123@cnkdev control=/tmp/Static/StaticScripts/ImportScripts/StarCruise/ctl/StarCruise_ImportShip.ctl 
log=/tmp/Static/Inbound/Cruise/StarCruise/$NOW/Ship/StarCruise_ImportShip.log bad=/tmp/Static/Inbound/Cruise/StarCruise/$NOW/Ship/StarCruise_ImportShip.bad