LOAD DATA 
INFILE '/tmp/Static/Inbound/Accomodation/AbreuOnline/AbreuOnlineCountry.csv'
APPEND INTO TABLE STATICDATA_COUNTRY
FIELDS TERMINATED BY ',' optionally enclosed by '"'
Trailing nullcols
(
SUPPLIER_ID CONSTANT 'TOURGREECE',
SUPPLIER_NAME CONSTANT 'TourGreece',
COUNTRY_CODE CONSTANT 'GR',
COUNTRY_NAME CONSTANT 'Greece',
Hotelcode FILLER,
hotelname FILLER,
Area BOUNDFILLER,
Cat FILLER
)







