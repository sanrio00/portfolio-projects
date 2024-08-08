# Zomato Delivery Summary Analysis (Feb-Apr 2022)
## Brief Overview
Zomato is an Indian multinational food delivery company. Using the dataset available in [Kaggle](https://www.kaggle.com/datasets/saurabhbadole/zomato-delivery-operations-analytics-dataset/data), I clean and analyze 40,786 deliveries recorded from Feb-Apr 2022, discovering patterns that affect KPI metrics, and giving recommendations to optimize future deliveries.

**Tools**: PostgreSQL, Tableau 

**Subjects Covered**: UPDATE/SET, ALTER TABLE, Aggregation with GROUP BY, WHERE, Views

SQL queries ([data cleaning](https://github.com/sanrio00/portfolio-projects/blob/main/Completed/Zomato%20Delivery%20Summary%20(Feb-Apr%202022)/sql_data_cleaning.sql) & [basic EDA](https://github.com/sanrio00/portfolio-projects/blob/main/Completed/Zomato%20Delivery%20Summary%20(Feb-Apr%202022)/sql_basic_EDA.sql)) can be found in the repository. Interactive Dashboard can be found in my [Tableau Public link](https://public.tableau.com/views/ZomatoDeliverySummaryFeb-Apr2022/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link).

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
- **Time of Day**: Average delivery durations are shortest in the early mornings (0800h-1000h) at around 20 mins, while late nights (1900h-2200h) experience the longest durations at around 30 mins.
- **Contributing Factors**: High traffic density, jam conditions, cloudy and foggy weather, and multiple prior deliveries in the same trip contribute the most to extended delivery durations.
- **Vehicle Impact**: 59% of deliveries were made using motorcycles, which had longer average durations than scooters, electric scooters and bicycles. However, the number of deliveries made with bicycles is not robust enough to accurately see the impact.

### Delivery Rating
- **Stability**: Delivery ratings are relatively stable, remaining within the 4.6-4.7 range, and are less affected by most factors.
- **Multiple Deliveries**: Both delivery duration and rating decline with an increasing number of prior deliveries in the same trip. For instance, trips with 2 prior deliveries have the lowest average rating of 4.42.

## Recommendations and next steps
### Operational Improvements
- **Avoid late night deliveries**: Minimize late-night deliveries, especially in heavy traffic conditions. Focus on scheduling more deliveries in the morning and during sunny weather.
- **Optimize Vehicle Usage**: Allocate more deliveries to scooter and electric scooters instead of motorcycles.
- **Route Optimization**: Prioritize direct deliveries as much as possible to avoid multiple deliveries, so consider working with drivers to optimize delivery routes.

### Data Recommendations
- **Expand Analysis**: Current pattern of delivery duration and rating is consistent from Feb-Apr 2022. Expand the analysis to include more months and years to check for any anomalies.
- **Include Distance Analysis**: Consider analyzing the distance to further optimize vehicle type usage. For example, long-distance deliveries over rough terrain may be better suited for motorcycles than scooters.
- **Data Integrity**: Numerous rows of data were erroneous such as entries with '0' for coordinates, and so were not included in this analysis. Investigate with the data team to ensure accurate data collection in the future.
- **Clarify Vehicle Condition Scores**: Ensure that the meaning of each score related to vehicle condition is clearly defined.
