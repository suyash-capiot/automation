#!/bin/bash

#Call Configuration File
. /home/oracle/Static/StaticScripts/ImportScripts/ClearCarRental/Config.sh

#---Import path from Config.sh file---
varOracle_bin=$ORACLE_BIN
varOracle_Home=$ORACLE_HOME
varDb_con=$DB_CON
varCommonScripts=$SQLScript
varImportPath=$IMPORTSCRIPTS
varExportPath=$EXPORTSCRIPTS
varURI=$URI
varInbound_path=$INBOUND_PATH
varOutbound_path=$CAR
Supplier_name=$1
#------connection-------
cd $ORACLE_BIN
ORACLE_HOME=$ORACLE_HOME; export ORACLE_HOME

varCity='ImportCity.sh'
varCountry='ImportCountry.sh'
varCarTypes='ImportCarTypes.sh'


#---import_car_City---


. $varImportPath/$Supplier_name/${Supplier_name}_${varCity} $varOracle_bin $varOracle_Home $varDb_con $Supplier_name $varInbound_path $varImportPath $varCommonScripts

#---import_car_Types---

. $varImportPath/$Supplier_name/${Supplier_name}_${varCarTypes} $varOracle_bin $varOracle_Home $varDb_con $Supplier_name $varInbound_path $varImportPath $varCommonScripts






