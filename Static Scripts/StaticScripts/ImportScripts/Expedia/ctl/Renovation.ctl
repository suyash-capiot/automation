OPTIONS (SKIP=1)
LOAD DATA 
INFILE '/tmp/Static/Inbound/Accomodation/Expedia/PropertyRenovation/*.txt'
APPEND INTO TABLE Property_Renovations
FIELDS TERMINATED BY '|' optionally enclosed by '"'
Trailing nullcols
(
HOTEL_ID,
LANGUAGE_CODE FILLER ,
RENOVATION_DESCRIPTION CHAR(4000)
)

