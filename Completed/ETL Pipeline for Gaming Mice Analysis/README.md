# ETL Pipeline for Gaming Mice Analysis
## Business Background and Overview
Andy plans to start a business selling gaming mice on an e-commerce platform that would give him good margins. Before developing his product for the market, he needs to conduct market research to understand the brands of gaming mice in the market, as well as the features that are popular among his gamer audience.

Andy is not familiar with the gaming mice category. As such, he requires a reliable way to view competitor data without having to manually search the platform for new competitors all the time. He decides to construct an ETL pipeline that would gather the following information to a database:
- Product Name
- Price
- Rating
- Brand
- DPI (i.e. mouse sensitivity)
- Model
- Hand Orientation
- Scrape datetime (to record time and to track any changes over time)

_Please note that while the business background is fictitious, the data is real._
_The data extracted is legal, and only used for learning purposes (namely, to demonstrate the 'Extract' step of an ETL pipeline using web scraping)._

## Methodology
To gather the information of our competitor gaming mice, we decided to construct an ETL pipeline consisting of the following:
- **Extract:** We scrape the product names and their respective features from Newegg.com, and then appended the features(e.g. name, price, rating) onto a list before storing it on a Pandas DataFrame.
- **Transform:** 3 key steps were performed as part of data cleaning and to ensure that the DataFrame is ready for use:
    1. Replacing null values & renaming brands
    2. Checking for duplicates
    3. Reset Index & Standardizing snake_case Format
- **Load:** We inserted the completed DataFrame into a PostgreSQL database using SQLAlchemy, which has good support with PostgreSQL. PostgreSQL is chosen for its scalability and performance with larger datasets, and this is important when ETL pipelines become more complex.

More details for each step can be found in the links above.

## **ETL Process Map**
With future plans to scale up the pipeline as the e-commerce platform is updated with more entries, the proposed ETL process map is shown in the illustration below:


## Extraction

## Transformation
Final table definition
## Loading
## Conclusion and Further Improvements
