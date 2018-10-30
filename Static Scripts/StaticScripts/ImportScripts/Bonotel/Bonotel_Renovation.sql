merge into STATICDATA_ACCO t1
using PROPERTY_RENOVATIONS t2
on (t1.PRODUCT_ID=t2.HOTEL_ID)
when matched then update set t1.ACTION_TEXT=t2.RENOVATION_DESCRIPTION,ACTION='U',UPDATE_TYPE='Property_Renovation';
quit;
/