# ABC Jewelry Marketing Campaign Analysis (May-Dec 2022)
## Brief Overview
ABC Jewelry is a fictitious jewelry brand. Using the dataset available in [Kaggle](https://www.kaggle.com/datasets/rahulchavan99/marketing-campaign-dataset/code), I clean the dataset and analyze 72,603 of campaign data. Presenting the results to the brand and marketing team, I discuss the ROI of the 7-month long campaign using several important KPI metrics, with a focus on Clickthrough Rate (CTR, click/impressions). along with actionable recommendations for future campaigns.

**Tools**: Python (pandas, matplotlib, seaborn)

**Subjects Covered**: Data wrangling, conversion, transformation, bar charts, time series graphs

[Jupyter Notebook](https://github.com/sanrio00/portfolio-projects/blob/812931c0e1909d901e78b2dca871ed43812149f2/Completed/ABC%20Jewelry%20Marketing%20Campaign%20Analysis%20(May-Dec%202022)/marketing_ROI.ipynb) with my code can be found in the repository.

### KPI metrics
1. Impressions: Number of times users see the ad
2. Clicks: Number of times users click through the ad
3. Click-through Rate (CTR): Ratio of clicks on impressions, often a measure of click efficiency
4. Cost-per-click (CPC): Ratio of clicks on media cost
5. Cost-per-mile (CPM): Ratio of impressions on media cost (1 mile = 1000 impressions)

### Factors affecting KPI metrics
1. Channel Type - Display, Mobile, Search, Social, Video
2. Search Tags - Used to categorize ads to help users find relevant ads when they search for jewelry online (e.g. #The Power of X)
3. Keywords - Used to match queries when users query specific words in search engines (e.g. initial jewelry)

## Summary of Insights
**Best Performing Campaign IDs**: Out of 156 campaigns, the following campaign IDs performed the best in these metrics.
    -Average CPC: ID 3033 at USD$0.08 per click
    -Average CPM: ID 3202 at $1.23 per 1000 impressions 
    -Average CTR: ID 2980 at 24.7%
**Average Impressions and Click Performance by Channel Type**: 
    -Display and Video channels have the highest average number of clicks. However, reallocating more budget to Mobile could be advantageous due to its superior click-to-impression efficiency. This would ensure sustained click performance.
    -Search Channels generate the highest average impressions, but are least effective in driving clicks. Consider optimizing CTA strategies and refining communication to make ads more compelling for engagement.
    
