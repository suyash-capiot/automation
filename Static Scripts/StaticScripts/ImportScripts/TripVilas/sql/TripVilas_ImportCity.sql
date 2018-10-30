col date_stp new_value date_stp noprint
select to_char(sysdate,'yyyymmdd') date_stp from dual;
Insert into STATICDATA_CITY (SUPPLIER_ID,SUPPLIER_NAME,COUNTRY_CODE,STATE_NAME,CITY_CODE)
with t AS (SELECT XMLTYPE(bfilename('DIR_&date_stp','accommodation_xml_ezeego1.xml'),nls_charset_id('WE8ISO8859P1'))xmlcol from dual)
select distinct 'TRIPVILAS', 'TripVilas'
,extractValue (value(x),'accommodation/location/address/country')COUNTRY_CODE
,extractValue (value(x),'accommodation/location/address/stateOrProvince')STATE_NAME
,extractValue (value(x),'accommodation/location/address/city')CITY_CODE
from t, TABLE(XMLSequence(extract(t.xmlcol,'accommodations/accommodation')))x;
exit;