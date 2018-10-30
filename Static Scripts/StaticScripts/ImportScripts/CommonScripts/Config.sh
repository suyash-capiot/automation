#!/bin/sh
export ORACLE_BIN=/opt/app/oracle/product/12.1.0.2/db_1/bin
export ORACLE_HOME=/opt/app/oracle/product/12.1.0.2/db_1/
export DB_CON=C##STATICDATA/static123@cnkdev
export URI=10.21.32.215:8002
export SQLScript=/tmp/Static/StaticScripts/ImportScripts/CommonScripts
export EXPORTSCRIPTS=/tmp/Static/StaticScripts/ExportScripts
export IMPORTSCRIPTS=/tmp/Static/StaticScripts/ImportScripts
export ACCO=/tmp/Static/Outbound/Accomodation
export INBOUND_PATH=/tmp/Static/Inbound/Accomodation