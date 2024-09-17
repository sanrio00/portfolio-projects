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

**Python libraries used**: 
- [Pandas](https://pandas.pydata.org/docs/user_guide/index.html) (to manipulate DataFrames)
- [Numpy](https://numpy.org/doc/stable/user/absolute_beginners.html) (to assign null values for missing elements)
- [BeautifulSoup](https://beautiful-soup-4.readthedocs.io/en/latest/) (for scraping HTML websites)
- [SQLAlchemy](https://www.sqlalchemy.org/) (to integrate Python with PostgreSQL)

_Please note that while the business background is fictitious, the data is real._

_The data extracted is legal, and only used for learning purposes (namely, to demonstrate the 'Extract' step of an ETL pipeline using web scraping)._

## Methodology
To gather the information of our competitor gaming mice, we decided to construct an ETL pipeline consisting of the following:
- [**Extract:**](#extraction) Each product’s features were extracted by parsing HTML using BeautifulSoup. For example, the rating and brand were located using classes, ensuring we gathered the correct attributes for each product.
- [**Transform:**](#transformation) 3 key steps were performed as part of data cleaning and to ensure that the DataFrame is ready for use:
    1. Replacing null values & renaming brands
    2. Checking for duplicates
    3. Reset Index & Standardizing snake_case Format
- [**Load:**](#loading) We inserted the completed DataFrame into a PostgreSQL database using SQLAlchemy, which has good support with PostgreSQL. PostgreSQL is chosen for its scalability and performance with larger datasets, and this is important when ETL pipelines become more complex.

More details for each step can be found in the links above.

## **ETL Process Map**
As the e-commerce platform is updated with more products, there will be future plans to scale up the pipeline.

Details of future improvements are discussed [here](#further-improvements).

The proposed ETL process is shown in the illustration map below:

![image](https://github.com/user-attachments/assets/1ce884c4-ce83-464c-a7c8-2fa0f3f6d57c)

## Extraction
We used BeautifulSoup to scrape product details from Newegg.com across multiple pages (page 1 through 6). Each page contained between 30 to 40 gaming mice products, resulting in a total of 217 products.

The extraction process involved identifying the relevant HTML elements for each feature and appending the extracted values to their corresponding lists for further processing.

## Transformation
Upon printing the length of each feature list (name_list, price_list, rating_list, brand_list, dpi_list, model_number_list, hand_orientation_list), we found that rating, brand, DPI and hand orientation lists have missing elements and are shorter than the original length, which was 217.

The data is then structured into a list of dictionaries, with each product representing one dictionary. Missing values were handled by assigning NaN where applicable, and were stored in a Pandas DataFrame.

To further clean up the dataset, the following steps were performed:
1. Similar brands are renamed to their original spelling
2. 1 duplicate row was dropped (216 products in the final DataFrame)
3. Index was reset and the columns were reordered
4. DataFrame was set in snake_case format (to make the df easier to work with and maintain)

The table below shows the final DataFrame definition:
| Header | Description | Note |
| ------ | ------ | ------|
| name | Name of product | Accept non-null values only |
| price | Price of product (including cents) | Accept non-negative values only |
| rating | Rating of product | Float values between 0 and 5 only |
| dpi | Maximum mouse sensitivity possible for the product | NA |
| model | Model number of product | NA |
| hand_orientation | Whether the product is left, right-handed or suitable for both hands | NA |
| scrape_datetime | Timestamp of when the product is scraped | Datetime only |

## Loading
After the DataFrame is prepared, we loaded it into a PostgreSQL database with the help of SQLAlchemy, which has robust support for PostgreSQL. 

Table constraints such as non-negative prices are implemented to ensure that the data streamed in fulfills these check conditions, minimizing dirty data.

## Conclusion
We have demonstrated a simple ETL pipeline to enable Andy to gather competitor data of gaming mice into an accessible database. 

This provides a value-add for Andy to query the most popular brands, compare price ranges or analyze feature trends. This allows Andy to adjust his offerings accordingly to give himself an edge in the gaming mice market.

## Further Improvements
**Data Validation Pipelines**: Besides table constraints, we will also consider introducing error handling (i.e. to handle unexpected HTML changes) and data validation pipelines (i.e. to ensure data scraped adheres to if-else guidelines before loading) to flag problematic data.

**Future Scalability**: The whole ETL process can be automated by using Apache Airflow or Dagster every time Newegg.com updates with a new page of products. This is important for scaling up the pipeline as the number of products increase, and reduces the need to manually execute the script.


