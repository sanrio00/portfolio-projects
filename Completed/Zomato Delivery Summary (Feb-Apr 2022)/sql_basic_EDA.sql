-- Based on the updated and cleaned data, I created a new view because the same view will be permanent, and can be used to do other sorts of transformations
create view zomato_dataset_rev as
select *
from zomato_dataset zd 
where "is_removed" = false;

-- Doing basic analysis on our KPIs: Delivery Duration and Delivery Ratings, as well as a few important factors
-- Delivery Duration: Most deliveries are quite evenly spread out with Top 5 deliveries between 25-29 min
SELECT 
    "Time_taken_min", 
    COUNT(*) AS no_of_deliveries, 
    ROUND((COUNT(*)::numeric / SUM(COUNT(*)) OVER ()) * 100, 2) AS proportion_percentage
FROM zomato_dataset_rev
GROUP BY "Time_taken_min"
ORDER BY no_of_deliveries desc;

-- Delivery Ratings: Most customers rated their deliveries above 4.5.
SELECT 
    "Delivery_person_Ratings", 
    COUNT(*) AS no_of_deliveries, 
    ROUND((COUNT(*)/ SUM(COUNT(*)) OVER ()) * 100, 2) AS proportion_percentage
FROM zomato_dataset_rev
where "Delivery_person_Ratings" is not null
GROUP BY "Delivery_person_Ratings"
ORDER BY no_of_deliveries desc;

-- Weather Conditions: All conditions are almost equally distrbuted. 
-- Fog and Cloudy conditions, which may affect visibility, have higher delivery times. Sunny has the shortest time taken. 
-- However, Delivery Ratings are not influenced by weather conditions
select "Weather_conditions", count(*), round(avg("Time_taken_min"),2) as "Time_taken_min", round(avg("Delivery_person_Ratings"),2) as "Delivery_person_Ratings"
from zomato_dataset_rev
where "Weather_conditions" is not NULL
group by "Weather_conditions"
order by "Time_taken_min" desc, "Delivery_person_Ratings" desc;

-- Road Traffic Density: Most deliveries had low traffic density. Interestingly, although High had the fewest deliveries, Jam came up as second highest
select "Road_traffic_density", count(*), round(avg("Time_taken_min"),2) as "Time_taken_min", round(avg("Delivery_person_Ratings"),2) as "Delivery_person_Ratings"
from zomato_dataset_rev
where "Road_traffic_density" is not NULL
group by "Road_traffic_density"
order by "Time_taken_min" desc, "Delivery_person_Ratings" desc;

-- No. of Prior Deliveries in Same Trip: Reducing the number of prior deliveries is important to reduce delivery duration and improve ratings
select "multiple_deliveries", count(*), round(avg("Time_taken_min"),2) as "Time_taken_min", round(avg("Delivery_person_Ratings"),2) as "Delivery_person_Ratings"
from zomato_dataset_rev
where "multiple_deliveries" is not NULL
group by "multiple_deliveries"
order by "Time_taken_min" desc, "Delivery_person_Ratings" desc;