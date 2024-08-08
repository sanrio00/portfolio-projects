-- Find any duplicate in IDs
with cte as (
	select *, row_number() OVER(partition by "ID")-1 as duplicate
	from zomato_dataset zd)
select "ID"
from cte
where duplicate > 1;

-- Check for any repeat restaurants, with their counts
-- The multiple counts show that these restaurants have repeat deliveries with zomato
select "Restaurant_latitude", "Restaurant_longitude", count(*)
from zomato_dataset zd
group by "Restaurant_latitude", "Restaurant_longitude"
having count(*)>1;

-- From the previous query, there are 3,640 rows with 0 as Restaurant latitude & longitude
-- I do not know if the data is erroneously captured, so I marked these rows as removed in our analysis (but not permanently delete them as best practice)
-- Therefore, I excluded rows that have 0 restaurant latitude & longitude, but keep NULL values across the columns

-- Add a column for marking removal
alter table zomato_dataset add column is_removed boolean default false;

-- Update restaurant_latitude and restaurant_longitude rows to mark them as removed
-- Also excluded Delivery_person_Ratings = 6 
-- Likely an error in data since max rating is assumed to be 5.0, and there are no decimal scores above 5.0 before 6
update zomato_dataset
set "is_removed" = true
where ("Restaurant_latitude" = 0 and "Restaurant_longitude" = 0) or "Delivery_person_Ratings" = 6;

-- There are NULL values scattered across the columns but are otherwise legitimately captured data
-- I will update NaN values to NULL first to make them easier to handle
update zomato_dataset zd
set "Time_taken_min" = null
where "Time_taken_min" = 'NaN';

-- Update Delivery_person_Ratings column from string to numeric
ALTER TABLE zomato_dataset
ALTER COLUMN "Delivery_person_Ratings" TYPE numeric USING "Delivery_person_Ratings"::numeric;

-- Both time columns have erroneous float values (that are below 1) across other timestamps. 
-- Changed these values to null first before converting string to timestamp
update zomato_dataset
set "Time_Orderd" = null
where "Time_Orderd" < '1';

update zomato_dataset
set "Time_Order_picked" = null
where "Time_Order_picked" < '1';

-- There are out-of-range timestamps such as "24:05:00". Need to identify which ones and change
select "Time_Order_picked"
from zomato_dataset zd
where "Time_Order_picked" >= '24:00:00';

-- Because '9' comes after '2', SQL generates the results by 'alphebetical order'
-- Using LIKE to isolate timestamps more than 24h
select distinct "Time_Orderd"
from zomato_dataset zd
where "Time_Orderd" like '24%';

-- Update Time_Orderd and Time_Order_picked from string to time
-- Correcting string to time
alter table zomato_dataset
alter column "Time_Orderd" type time using "Time_Orderd"::time,
alter column "Time_Order_picked" type time using "Time_Order_picked"::time;