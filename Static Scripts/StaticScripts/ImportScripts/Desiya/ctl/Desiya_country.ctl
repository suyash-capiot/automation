LOAD DATA
INFILE '/tmp/Static/Inbound/Accomodation/Desiya/DesiyaCountry.txt'
APPEND INTO TABLE STATICDATA_COUNTRY
FIELDS TERMINATED BY '|' optionally enclosed by '"'
trailing nullcols
(
SUPPLIER_ID CONSTANT 'DESIYA ',
SUPPLIER_NAME CONSTANT 'Desiya',
COUNTRY_CODE CONSTANT 'IN',
PRODUCT_ID FILLER,
PRODUCT_NAME FILLER, 
HotelClass FILLER,
Location FILLER,
CITY_CODE FILLER,
COUNTRY_NAME "upper(:COUNTRY_NAME)",
abc FILLER,
xyz FILLER,
Area FILLER,
ADDRESS FILLER CHAR(4000),
HotelOverview FILLER CHAR(8000),
ReviewRating FILLER,
ReviewCount FILLER,
Latitude FILLER,
Longitude FILLER,
DefaultCheckInTime FILLER,
DefaultCheckOutTime FILLER,
Hotel_Star FILLER,
HotelGroupID FILLER,
HotelGroupName FILLER,
ImagePath FILLER CHAR(1000),
HotelSearchKey FILLER,
Area_Seo_Id FILLER,
SecondaryAreaIds FILLER,
SecondaryAreaName FILLER,
NoOfFloors FILLER,
NoOfRooms FILLER,
STATE_CODE FILLER,
PinCode FILLER,
ThemeList FILLER,
CategoryList FILLER,
CityZone FILLER,
WeekDay_Rank FILLER,
WeekEnd_Rank FILLER
)
