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

**Tools used**: Python 3 (pandas, numpy, BeautifulSoup), SQLAlchemy

_Please note that while the business background is fictitious, the data is real._

_The data extracted is legal, and only used for learning purposes (namely, to demonstrate the 'Extract' step of an ETL pipeline using web scraping)._

## Methodology
To gather the information of our competitor gaming mice, we decided to construct an ETL pipeline consisting of the following:
- **Extract:** We scrape the product names and their respective features from Newegg.com (the e-commerce platform), and then appended the features(e.g. name, price, rating) onto a list before storing it on a Pandas DataFrame.
- **Transform:** 3 key steps were performed as part of data cleaning and to ensure that the DataFrame is ready for use:
    1. Replacing null values & renaming brands
    2. Checking for duplicates
    3. Reset Index & Standardizing snake_case Format
- **Load:** We inserted the completed DataFrame into a PostgreSQL database using SQLAlchemy, which has good support with PostgreSQL. PostgreSQL is chosen for its scalability and performance with larger datasets, and this is important when ETL pipelines become more complex.

More details for each step can be found in the links above.

## **ETL Process Map**
As the e-commerce platform is updated with more entries, there will be future plans to scale up the pipeline. 

The proposed ETL process is shown in the illustration map below:

## Extraction
The first part involved requesting the base url (page 1) and the other page urls (pages 2 to 6) and creating empty lists for each feature for storage later. 

The second part involved extracting the name, price, rating, brand, DPI, model number, hand orientation of every product using BeautifulSoup across the pages. This required looking into the HTML syntax and finding the appropriate class within the syntax. Upon extracting the correct feature, we appended them into its respective list. 

Each page consisted of around 30-40 gaming mice products, totalling to 217 products.

## Transformation
Upon printing the length of each feature list (name_list, price_list, rating_list, brand_list, dpi_list, model_number_list, hand_orientation_list), we found that rating, brand, DPI and hand orientation lists have missing elements and are shorter than the original length, which was 217.

The data is then structured into a list of dictionaries, with the product name as the key. Missing values were handled by assigning NaN where applicable, and were stored in a Pandas DataFrame.

To further clean up the dataset, the following steps were performed:
1. Similar brands are renamed to their original spelling
2. 1 duplicate was removed (216 products in the final DataFrame)
3. Index was reset and the columns were reordered

The table below shows the final table definition:

## Loading
## Conclusion and Further Improvements
