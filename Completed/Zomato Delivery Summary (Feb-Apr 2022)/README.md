# Zomato Delivery Summary Analysis (Feb-Apr 2022)
## Brief Statement
Zomato is an Indian multinational food delivery company. Using the dataset available in [Kaggle](https://www.kaggle.com/datasets/saurabhbadole/zomato-delivery-operations-analytics-dataset/data), I clean and analyze 40,786 deliveries recorded from Feb-Apr 2022, discovering patterns that affect KPI metrics, and giving recommendations to optimize future deliveries.

**Tools**: PostgreSQL, Tableau 

**Subjects Covered**: UPDATE/SET, ALTER TABLE, Agrregation with GROUP BY, WHERE, Views

Interactive Dashboard can be found in my [Tableau Public link](https://public.tableau.com/views/ZomatoDeliverySummaryFeb-Apr2022/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link).

### KPI metrics and Dimensions
1. Delivery Rating: Ratings assigned to the delivery person (assumed to be out of 5.0)
2. Delivery Duration: Time taken for delivery in minutes
3. Delivery Start Hour: Hour the order was picked up from the restaurant for delivery
4. Weather Conditions: Cloudy, Fog, Sandstorms, Stormy, Sunny, Windy
5. Road Traffic Density: Low, Medium, High, Jam
6. No. of Prior Deliveries in Same Trip: Range from 0-3
7. Vehicle Conditions: Range from 0-3 (not known what each score means)

## Summary of Insights
