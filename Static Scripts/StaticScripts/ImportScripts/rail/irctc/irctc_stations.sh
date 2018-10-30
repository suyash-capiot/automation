#!/bin/bash
export NOW=$(date +"%Y%m%d")
echo [$NOW]
mkdir -p $INBOUNDPATH/$PRODUCT/$SUPPLIER/$NOW
wget https://www.irctc.co.in/eticketing/StationListServlet.js -O $INBOUNDPATH/$PRODUCT/$SUPPLIER/$NOW/IrctcStationList.txt
sed -i 's/.*\[\([^]]*\)\].*/\1/g;s/,/\n/g;s/"//g' $INBOUNDPATH/$PRODUCT/$SUPPLIER/$NOW/IrctcStationList.txt
sqlplus -S $DB_CON <<EOF
 DELETE FROM STATICDATA_RAIL_STATION WHERE SUPPLIER_ID='IRCTC';
 exit;
EOF
sqlldr $DB_CON -control ./ctl/${SUPPLIER}_stations.ctl -log $INBOUNDPATH/$PRODUCT/$SUPPLIER/$NOW/${SUPPLIER}_stations.log -bad $INBOUNDPATH/$PRODUCT/$SUPPLIER/$NOW/${SUPPLIER}_stations.bad

