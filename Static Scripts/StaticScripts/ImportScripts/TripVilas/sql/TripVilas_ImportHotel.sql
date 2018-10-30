col date_stp new_value date_stp noprint
select to_char(sysdate,'yyyymmdd') date_stp from dual;
CREATE DIRECTORY DIR_&date_stp AS '/tmp/Static/Inbound/Accomodation/TripVilas/&date_stp'; 
GRANT ALL ON DIRECTORY DIR_&date_stp TO PUBLIC;
Insert into STATICDATA_ACCO (SUPPLIER_ID,SUPPLIER_NAME,PRODUCT_ID,STREET1,COUNTRY_CODE,CITY_CODE) with t AS 
(SELECT XMLTYPE(bfilename('DIR_&date_stp','accommodation_xml_ezeego1.xml'),nls_charset_id('WE8ISO8859P1'))xmlcol from dual)
select distinct 'TRIPVILAS', 'TripVilas',
extractValue (value(x),'accommodation/propertyID')PRODUCT_ID,
extractValue (value(x),'accommodation/location/address/addressLine1')STREET1,
extractValue (value(x),'accommodation/location/address/country')COUNTRY_CODE,
extractValue (value(x),'accommodation/location/address/city')CITY_CODE 
from t, TABLE(XMLSequence(extract(t.xmlcol,'accommodations/accommodation')))x;
exit;
