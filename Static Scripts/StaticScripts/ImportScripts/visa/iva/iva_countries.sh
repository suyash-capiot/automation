#!/bin/bash
sqlplus -S $DB_CON <<EOF
 DELETE FROM STATICDATA_VISA_COUNTRY WHERE SUPPLIER_ID='IVA';
 exit;
EOF
sqlldr $DB_CON -control ./ctl/${SUPPLIER}_countries.ctl -log $INBOUNDPATH/$PRODUCT/$SUPPLIER/${SUPPLIER}_countries.log -bad $INBOUNDPATH/$PRODUCT/$SUPPLIER/${SUPPLIER}_countries.bad
