LOAD DATA
INFILE '/tmp/Static/Inbound/Accomodation/TripVilas/20170308/accommodation_xml_ezeego1.xml' "STR '</accommodation>'"
APPEND
INTO TABLE STATICDATA_ACCO
TRAILING NULLCOLS
(
DUMMY FILLER TERMINATED BY "<accommodation>",
PRODUCT_ID ENCLOSED BY "<propertyID>" AND "</propertyID>"
)