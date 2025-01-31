# Financial Statement Preprocessing & Analysis (Year 2000-2024)
## Brief Overview
We aim to perform data cleaning & analysis on API-retrieved ([Financial Modelling Prep](https://financialmodelingprep.com/api/v3/stock/list?apikey=NSD2m35XyjrwOoYdtKbq1JPOHlABl8CW)) income statements of different companies from US-listed exchanges (i.e. NYSE, NASDAQ, AMEX).

These income statements consolidate revenue, profit and expense data (e.g. Gross Profit, Net Income, Operating Expenses) from year 2000-2024 to generate an overall Profit & Loss statement (P&L). 

The data insights are also presented on an Excel dashboard to give a summary on the general performance of the companies (split into Revenue, Profit, Expense). These insights include recommendations on what these companies should consider in the future to improve profitability and reduce expenses.

Synthetic datasets containing simulated financial metrics and stocks were also generated to complement the API-retrieved data from real stocks and be able to demonstrate various data wrangling steps.

**Tools**: Python (requests, pandas, numpy, matplotlib, seaborn), Excel (Power Query, Power Pivot, Pivot Table & Charts)

**Subjects Covered**: API calling, simulation, data wrangling, transformation

**Documents**: [**Merged DataFrame**](https://github.com/sanrio00/portfolio-projects/blob/main/Completed/Financial%20Statement%20Preprocessing%20%26%20Analysis/merged_df.csv), 
[**API Calling & Data Preprocessing Notebook**](https://github.com/sanrio00/portfolio-projects/blob/main/Completed/Financial%20Statement%20Preprocessing%20%26%20Analysis/api_calling_data_preprocessing.ipynb),[**Exploratory Data Analysis (EDA)**](https://github.com/sanrio00/portfolio-projects/blob/main/Completed/Financial%20Statement%20Preprocessing%20%26%20Analysis/eda.ipynb), 
[**Excel Dashboard**](https://1drv.ms/x/c/21f22e0d41f3e320/EdA4KLcROkdNtyCEL4mimhQBn5mgBkvwKamyAL9S2VWezA?e=PjQH5N)

## Financial Metrics Used
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
- Checked stock names using regex to make sure they are named correctly (e.g. no strange prefix at the front or suffix at the end)
- Filter out impossible years (e.g. if any row goes below year 2000 or goes above year 2024, filter out)
- Filter out impossible negative values (i.e. **Revenue, Operating Expenses, Cost of Revenue, Interest Expense, Depreciation & Amortization** cannot have negative values)
- Managed missing values in all columns by:
    - Revenue Growth: Fill in NaN based on revenue in the previous year
    - For all other metrics: Fill in NaN only when the respective metrics are available. For example, if Operating Expenses has NaN, only fill it up by using Gross Profit - Operating Income and if both metrics are available.
- Checking Actual vs Expected value of columns by creating a flag column
    - If EBITDA = Operating Income - D&A, the actual value might not follow this formula and this could be due to adjustments from real-world reporting or human error
    - We then dropped rows that do not match the actual calculation
 
After all of the 4 datasets have been cleaned, they are merged into a single DataFrame. Additional data cleaning such as dropping duplicates and removing rows with impossible negative values were also performed to ensure data integrity.

## 3. Exploratory Data Analysis
### Outliers & Frequency Distribution
Upon analyzing the dataset using boxplots and histogram, **Net Income Ratio and Gross Profit Ratio** predominantly fall within the interquartile range (i.e. 25%-75% of the maximum value). This is within expectations because both ratios are a proportion of revenue, which naturally restricts the range.

**Operating Income, Net Income, Operating Expenses and EBITDA** show small percentages of outliers and are likely natural variations of financial metrics.

While 12% of **Revenue Growth** data are identified as outliers (above 1.5 times of interquartile range), Revenue Growth rates tend to have high variability as a result of year-on-year expansions of the company. These outliers do not reflect an issue with the data and are thus kept.

The remaining metrics like Revenue and Cost of Revenue do not show outliers.

### Total Revenue and Revenue Growth Over Time
When tracking total revenue over time, total revenue remained almost unchanged from 2000-2018, which indicates minimal improvement in performance.

Two signficant spikes were observed from 2018-2019 and 2021-2022. This could be attributed to market recovery as businesses have expanded with more revenue.

However, 2023-2024 saw a sharp decline, bringing total revenue to just slightly above 2019 levels.

![Total Revenue and Revenue Growth Over Time](https://github.com/user-attachments/assets/be0d91c8-76f7-4195-ab57-118843dabcd8)

### Overall Top 5 vs Current Top 5 Companies by Revenue (2020-2024)
We also aim to analyze the performance of the Top 5 companies with the highest revenue from 2020 to 2024 to evaluate their potential for future growth.

If any company from the Current Top 5 overlap with the Overall Top 5 in recent years, it indicates their strong potential for sustained growth in the coming years.

![CurrentTop5_OverallTop5](https://github.com/user-attachments/assets/a54094bb-8d67-4db5-a6ea-189b76402308)

**MCK, COST, and MSFT** are consistently among the Current and Overall Top 5 companies by revenue, demonstrating steady annual growth from 2020 to 2024. This reflects resilient and sustainable performance in these 3 companies despite an overall lower revenue in the dataset in 2024.

Meanwhile, **UNH and BRK-B**, part of the Overall Top 5, reached their highest revenue in 2023 but dropped out of the Current Top 5 in 2024, indicating a possible decline in performance or competitive standing.

### Relationship between Net Income Ratio vs Gross Profit Ratio

![GrossProfitRatio_NetIncomeRatio](https://github.com/user-attachments/assets/130c2bb7-b850-4419-a6e4-33ba4417309b)

Generally, Gross Profit Ratio and Net Income Ratio display a weak positive correlation. As Gross Profit Ratio increases, Net Income Ratio increases minimally.

Majority of the data points cluster in the middle, which further supports this weak correlation.

Companies should aim to improve their cost efficiency to lower their Cost of Revenue, which then improves their Gross Profit Ratio and ultimately Net Income Ratio.

### Analyzing Profit over Time

![ProfitPerformance](https://github.com/user-attachments/assets/554d0d01-989e-4ecc-8cd1-ef2f1367a51a)

Gross Profit Ratio is consistently the highest, above Operating Expense Ratio and Net Income Ratio. This suggests stability in both profitability and expenditure relative to revenue across the years.

Operating Income Ratio also mirrors Net Income Ratio. It is expected that Net Income Ratio is the lowest because it accounts for additional expenses which reduce Net Income.

### Analyzing Expense over Time

![ExpenseDistributionOverYears](https://github.com/user-attachments/assets/49396ef2-ff86-4610-bb47-d0f4b4daa7e2)

Cost of Revenue is consistently the largest expense, higher than Operating Expenses and Depreciation & Amortization (D&A), This highlights the significance of production & procurement costs (Cost of Revenue) above admin, marketing and general expenses needed to sustain the general operations across companies (Operating Expenses).

The relatively low D&A also indicates minimal investment in assets prone to depreciation. 

Since 2019, noticeable fluctuations in the proportions of Cost of Revenue and Operating Expenses have emerged, while D&A has shown a slight increase.

### Gross Profit vs Cost of Revenue as a Proportion of Revenue

Since Cost of Revenue + Gross Profit = Revenue, it is useful to see whether the gross profit margin is healthy versus the cost of revenue. 

We divide Cost of Revenue & Gross Profit by a single average Revenue rather than per-revenue, which helps to reduce the year-on-year variability and observe the overall trend over time more consistently.

![image](https://github.com/user-attachments/assets/f75405d2-b484-4072-ad27-2040a487207c)

Overall, the Average Gross Profit manages to stay consistently above the Average Cost of Revenue, indicating high Gross Profit margins.

Average Gross Profit and Average Cost of Revenue appear to move together and remain largely stable until 2019, where slight fluctuations are observed and both metrics share an inverse relationship.

Companies could consider adopting cost management strategies such as renegotiating supplier contracts or diversify revenue streams to control cost of revenues and further stabilize gross profit margins.

## 4. Excel Dashboard & Analysis
We have summarized the dataset into 4 tabs: P&L, Revenue, Profit & Expense. The tabs are toggleable at the left side of the worksheet. Each tab is interactive with Year and Stock filters to adjust the specific performance of the years and companies.

### Profit & Loss Statement (P&L)
![image](https://github.com/user-attachments/assets/e90fac46-ed14-4b31-a930-24fc9d9b591d)
![image](https://github.com/user-attachments/assets/f6244d3c-643f-4784-9ea9-64ea72faf688)

The P&L statement of all companies are divided into Year-on-Year % Changes of each metric at the top and Absolute Figures based on total sums at the bottom.

1. All metrics from Revenue to Depreciation & Amortization (D&A) experienced minimal fluctuations from 2000 to 2018.
2. 2018-2019 saw a significant spike across all metrics, especially in Interest Expense where the increase was as high as 13 times of the previous year. This likely reflects a market recovery, where businesses expanded operations alongside revenue growth. This upward trend continued in 2019-2020 at a lower magnitude.
3. 2021-2022 saw another sharp increase, with Revenue and Cost of Revenue experiencing the largest percentage jumps by 55% and 62% respectively. This indicates that while companies are generating more revenue, operational costs have scaled up significantly as well. 
4. 2023-2024 saw the steepest decline with all metrics turning negatives. This could be due to economic downturns, or insufficient data for a full assessment of 2024.
5. In general, the economic landscape of the given year has the greatest influence of each metric's performance, with no metric operating independently of this trend.
6. Amid rising expenses, companies should focus improving cost efficiency to sustain revenue growth and profitability.

### Revenue
![image](https://github.com/user-attachments/assets/5c33d471-a479-4388-a435-32405c56669b)

1. On average, the US companies mostly remained stable, with a modest growth in revenue of 2%.
2. Two signficant spikes were observed from 2018-2019 and 2021-2022. This could be attributed to economic growth as businesses expanded alongside revenue growth.
3. However, 2023-2024 saw a sharp decline, bringing total revenue to just slightly above 2019 levels.
4. The period of 2022-2023 was likely marked by a strong economy with many business expanding their operations.
5. The Top 5 Companies steadily grew their revenues with each year. 
6. Despite a much lower total revenue in the industry in 2024, MCK, COST and MSFT have shown contrastingly stronger performance which suggests a resilient and sustainable growth. 
7. For companies to continue staying ahead of revenue trends, they should focus on sustainable growth strategies and innovation to secure greater increases in the coming years.

### Profit
![image](https://github.com/user-attachments/assets/ea375d34-f130-4c2d-81f5-4364d8c2172a)

1. Modest Net Income growth of 2% was observed from 2000-2024, which suggests limited overall growth during this period.
2. Revenue experienced a sudden surge in 2022-2023, accompanied by proportional increases in Operating Income, Gross Profit and Net Income.
3. The near-constant average Net Income Ratio and Gross Profit Ratio show that companies have maintaned stable margins despite revenue and profit fluctuations.
4. This suggests that profitability growth is strongly tied to revenue growth, which can create risks during economic downturns and competitive pressures which suppress revenue.
5. Similar to the suggestions for Revenue, companies should improve profitability through operational efficiency (e.g. automation) and cost control (e.g. reducing expenses) to reduce reliance on revenue alone.

### Expense
![image](https://github.com/user-attachments/assets/1cfab50c-e93e-491b-92e8-d815060214aa)

1. Cost of Revenue Growth has remained stable with a modest growth of 2% from 2000-2024. This is in spite of the most significant spike in 2022-2023. 
2. Cost of Revenue consistently surpassed than Operating Expenses and Depreciation & Amortization. This means that optimizing production & procurement costs (Cost of Revenue) are the most important to improve margins and profitability.
3. Gross Profit is also healthy relative to Cost of Revenue, with an inverse relationship between the two metrics. 
4. This stability indicates effective Gross Profit management, but it also suggests that companies have not significantly reduced their production cost base over time.
5. To more signifcantly optimize cost of revenue, companies should focus on improving production efficiency (e.g. relationship-building with more efficient suppliers).
6. To reduce operating expenses, strategic investments in automating administrative processes (e.g. cloud-based solutions to reduce IT costs) can be worthwhile in the long run.

## Future updates
We plan to implement cloud storage on AWS S3 to simulate storing and sharing financial data in a collaborative environment. Additionally, we could also consider developing an ETL pipeline using Apache Airflow to automate API requests on a yearly basis to enable regular updates.
