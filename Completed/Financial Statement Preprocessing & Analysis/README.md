# Financial Statement Preprocessing & Analysis (Year 2000-2024)
## Brief Overview
We aim to perform data cleaning & analysis on API-retrieved ([Financial Modelling Prep](https://financialmodelingprep.com/api/v3/stock/list?apikey=NSD2m35XyjrwOoYdtKbq1JPOHlABl8CW)) income statements of different companies from US-listed exchanges (i.e. NYSE, NASDAQ, AMEX).

These income statements consolidate revenue, profit and expense data (e.g. Gross Profit, Net Income, Operating Expenses) from year 2000-2024 to generate an overall Profit & Loss statement (P&L). 

The data insights are also presented on an Excel dashboard to give a summary on the general performance of the companies (split into Revenue, Profit, Expense). These insights include recommendations on what these companies should consider in the future to improve profitability and reduce expenses.

Synthetic datasets containing simulated financial metrics and stocks were also generated to complement the API-retrieved data from real stocks and be able to demonstrate various data wrangling steps.

**Tools**: Python (requests, pandas, numpy, matplotlib, seaborn), Excel (Power Query, Power Pivot, Pivot Table & Charts)

**Subjects Covered**: API calling, simulation, data wrangling, transformation

**Documents**: [**Merged DataFrame**](https://github.com/sanrio00/portfolio-projects/blob/main/Completed/Financial%20Statement%20Preprocessing%20%26%20Analysis/merged_df.csv), [**API Calling & Data Preprocessing Notebook**](https://github.com/sanrio00/portfolio-projects/blob/main/Completed/Financial%20Statement%20Preprocessing%20%26%20Analysis/api_calling_data_preprocessing.ipynb), [**Exploratory Data Analysis (EDA)**](https://github.com/sanrio00/portfolio-projects/blob/main/Completed/Financial%20Statement%20Preprocessing%20%26%20Analysis/eda.ipynb)

## Financial Metrics Used (may place at Extraction step)
**Revenue**: Revenue, Revenue Growth (%)

**Profit**: Operating Income, Gross Profit, Gross Profit Ratio, (%), Net Income, Net Income Ratio (%), EBITDA

**Expense**: Operating Expenses, Cost of Revenue, Interest Expense, Depreciation & Amortization (D&A)

## Methodology
We obtained the Top 200 stocks by market capitalization (named as price in the code) from US-listed exchanges using the [Financial Modelling Prep API](https://financialmodelingprep.com/api/v3/stock/list?apikey=NSD2m35XyjrwOoYdtKbq1JPOHlABl8CW). When making investment decisions, it is important to select relevant companies that reflect high growth and profitability potential in the market. Tracking companies by market cap (e.g. NFLX, TSLA, MSI) helps with this.

The following steps were then performed:

1. The real stock data was expanded with synthetic data to increase the size of the overall data and 4 datasets were generated using this method (see Simulate step). 

2. Data preprocessing (see Data Preprocessing step) was then conducted to check for duplicates, missing data, as well as calculations for all columns in each dataset before all 4 datasets were merged into a [single DataFrame](https://github.com/sanrio00/portfolio-projects/blob/main/Completed/Financial%20Statement%20Preprocessing%20%26%20Analysis/merged_df.csv).

3. Conducted EDA (see EDA step) to observe potential patterns in the dataset on-demand, identifying potential outliers and confirming various hypotheses before visualizing the important data in the Analysis step.

4. Visualized the data on an interactive Excel dashboard, which details the P&L summary and the respective Revenue, Profit and Expense tabs. The P&L summary shows a yearly sum breakdown of each financial metric covering all real and synthetic companies in the dataset.

The remaining tabs cover a greater deep dive onto the related Revenue, Profit and Expense metrics, explain the trends across time, and include recommendations for how companies could optimize their financial performance further.

## 1. Simulate
4 datasets: Base, Partial, Historical, Sparse were generated to simulate stocks and financial metrics across year 2000 to 2024.

The Base dataset was expanded from the 240 rows of real stock data using synthetic stocks of random length and unique stock-year combinations, totalling to 100,240 rows. In other words, the Base dataset consists of income data of the Top 200 market cap stocks with synthetic data making up the rest.

The other financial metrics, such as cost of revenue and gross profit, are simulated proportionally based on the revenue. For example, cost of revenue is 40-70% of revenue. We then verified the data integrity by checking no duplicate stock-year combination exists. 

The other 3 datasets are derivatives of the Base dataset and are filled with errors on purpose to effectively simulate needing to consolidate different data sources, much like in real life.

## 2. Data Preprocessing
To ensure that the datasets are ready for merging and analysis, the below steps were performed:
- Removed duplicate stock-year pairs (e.g. Stock JKHS has 2 rows with Year 2005)
- Checked for null columns
- Checked stock names using regex to make sure they are named correctly (e.g. no strange prefix or suffix at the end)
- Filter out impossible years (e.g. if any row goes below year 2000 or goes above year 2024, filter out)
- Filter out impossible negative values (i.e. **Revenue, Operating Expenses, Cost of Revenue, Interest Expense, Depreciation & Amortization** cannot have negative values)
- Managed missing values in all columns by:
    - Revenue Growth: Fill in NaN based on revenue in the previous year
    - For all other metrics: Fill in NaN only when the respective metrics are available. For example, if Operating Expenses has NaN, only fill it up by using Gross Profit - Operating Income and if both metrics are available.
- Checking Actual vs Expected value of columns by creating a flag column
    - If EBITDA = Operating Income - D&A, the actual value might not follow this formula and this could be due to adjustments from real-world reporting or human error
    - We then dropped rows that do not match the actual calculation
 
After all of the 4 datasets have been cleaned, they are merged into a single DataFrame. Additional data cleaning such as dropping duplicates and removing rows with impossible negative values were also performed to ensure data integrity.

## Step 3: EDA
to be filled

## Step 4: Excel Dashboard & Analysis
to be filled

## Future updates
uploading onto the cloud to simulate storing financial data onto a shareable environment
creating a ETL pipeline with Apache Airflow to regularly automate the API requests year on year
