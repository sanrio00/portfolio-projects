# Zomato Delivery Summary Analysis (Feb-Apr 2022)
## Brief Statement
Zomato is an Indian multinational food delivery company. Using the dataset available in [Kaggle](https://www.kaggle.com/datasets/saurabhbadole/zomato-delivery-operations-analytics-dataset/data), I clean and analyze 40,786 deliveries recorded from Feb-Apr 2022, discovering patterns that affect KPI metrics, and giving recommendations to optimize future deliveries.

**Tools**: PostgreSQL, Tableau 

**Subjects Covered**: UPDATE/SET, ALTER TABLE, Aggregation with GROUP BY, WHERE, Views

SQL queries ([data cleaning](Zomato%20Delivery%20Summary%20(Feb-Apr%202022)/sql_data_cleaning.sql) & [basic EDA](Zomato%20Delivery%20Summary%20(Feb-Apr%202022)/sql_basic_EDA.sql)) can be found in the repository. Interactive Dashboard can be found in my [Tableau Public link](https://public.tableau.com/views/ZomatoDeliverySummaryFeb-Apr2022/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link).

### KPI metrics
1. Delivery Rating: Ratings assigned to the delivery person (assumed to be out of 5.0)
2. Delivery Duration: Time taken for delivery in minutes

### Factors affecting KPI metrics
1. Delivery Start Hour: Hour the order was picked up from the restaurant for delivery
2. Weather Conditions: Cloudy, Fog, Sandstorms, Stormy, Sunny, Windy
3. Road Traffic Density: Low, Medium, High, Jam
4. No. of Prior Deliveries in Same Trip: Range from 0-3
5. Vehicle Conditions: Range from 0-3 (not known what each score means)

## Summary of Insights
### Delivery Duration
- Average delivery durations tend to be the shortest in early mornings (0800h-1000h) at around 20 mins, while late nights (1900h-2200h) have the longest durations at around 30 mins.
- High and Jam Traffic Density, Cloudy and Fog Conditions, and multiple prior deliveries in the same trip contribute the most to delivery duration
- 59% of deliveries were made using motorcycles and had longer average durations than Scooter, Electric Scooter and Bicycle. However, the number of deliveries made with bicycles is not robust enough to accurately see the impact.

### Delivery Rating
- Delivery Rating is less affected by most factors, with the rating staying stable within 4.6-4.7 range.
- Both delivery duration and rating fell in performance with increasing prior deliveries in the same trip. 2 prior deliveries has the lowest rating at 4.42.

## Recommendations and next steps
- Avoid late night deliveries with heavy jam conditions. Plan more deliveries in the morning and during sunny weather.
- Allocate more deliveries to be made using Scooter, Electric Scooter instead of Motorcycles
- Make direct deliveries as much as possible to avoid multiple deliveries, so consider working with drivers to optimize delivery routes

## Data recommendations
- Current pattern of delivery duration and rating is stable in each month from Feb-Apr 2022. Expand analysis to include more months and years to examine whether there are any anomalies to this trend
- Expand analysis to include distance to further optimize vehicle type. For example, long-distance deliveries with rough terrain may be better done with motorcycles than scooters.
- Numerous rows of data were erroneous such as having 0 for the delivery coordinates, and so were not included in this analysis. Investigate with the data team behind this occurrence and ensure these coordinates can be backed up
- Clarify what each score of Vehicle Condition means
