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
First, we obtain the Top 200 stocks by market capitalization (named as price in the code) from US-listed exchanges using the [Financial Modelling Prep API](https://financialmodelingprep.com/api/v3/stock/list?apikey=NSD2m35XyjrwOoYdtKbq1JPOHlABl8CW). When making investment decisions, it is important to select relevant companies that reflect high growth and profitability potential in the market. Tracking companies by market cap (e.g. NFLX, TSLA, MSI) helps with this. 

Second, the real stock data is expanded with synthetic data to add more rows and increase it to a larger dataset. 4 datasets: Base, Partial, Historical & Sparse were generated using a custom function. Data preprocessing (see Data Preprocessing step) was done to check for duplicates, missing data, as well as calculations for all columns in each dataset before all 4 datasets were merged into a [single DataFrame](https://github.com/sanrio00/portfolio-projects/blob/main/Completed/Financial%20Statement%20Preprocessing%20%26%20Analysis/merged_df.csv).

Third, we have conducted EDA (see EDA step) to observe potential patterns in the dataset on-demand, identifying potential outliers and confirming various hypotheses before visualizing the important data in the Analysis step.

Lastly, in the Analysis step (see Analysis step), we have visualized the data on an interactive Excel dashboard, which details the P&L summary and the respective Revenue, Profit and Expense tabs. The P&L summary shows a yearly sum breakdown of each financial metric covering all real and synthetic companies in the dataset.

The remaining tabs cover a greater deep dive onto the related Revenue, Profit and Expense metrics, explain the trends across time, and include recommendations for how companies could optimize their financial performance further.

## Extract
There are 4 datasets: Base, Partial, Historical, Sparse. With the Base dataset, we create a synthetic dataset of 100,000 rows containing simulated financial metrics for various stocks across year 2000 to 2024. Using generate_random_tickers, we create unique stocks of random lengths and create stock-year combinations. We then simulate the other financial metrics proportionally based on the revenue. For example, cost of revenue is 40-70% of revenue. We then verified the data integrity by checking no duplicate stock-year combination exists (summarize this part, then add In other words, the Base dataset consists of income data of the Top 200 market cap stocks with synthetic data making up the rest). The other 3 datasets are derivatives of the Base dataset and are filled with errors on purpose to simulate data cleaning & merging in real life.

## Step 2: Data Preprocessing
to be filled

## Step 3: EDA
to be filled

## Step 4: Excel Dashboard & Analysis
to be filled

## Future updates
uploading onto the cloud to simulate storing financial data onto a shareable environment
creating a ETL pipeline with Apache Airflow to regularly automate the API requests year on year
