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

## Summary of Insights with Recommendations
### Best Performing Campaign IDs
Out of 156 campaigns, the following campaign IDs performed the best in these metrics.
- Average CPC: ID 3033 at USD$0.08 per click
- Average CPM: ID 3202 at $1.23 per 1000 impressions 
- Average CTR: ID 2980 at 24.7%

### Impact of Channel Type on Clicks and Impressions: 
- Display and Video channels have the highest average number of clicks. However, reallocating more budget to Mobile could be advantageous due to its superior click-to-impression efficiency. This would ensure sustained click performance even when the media budget runs lower.
- Search Channels have the highest average impressions, but are least effective in driving clicks. Consider optimizing CTA strategies and refining communication to make ads more compelling for engagement.

### Impact of Search Tags on Clicks, based on Channel Type:
- On average, #The Power of X attracted the highest number of clicks across campaigns
- When split by channel type, most channels hover around 40-50 average clicks per search tag, which means no channel type is significantly worth less investing in.
- Video is most effective on #Embrace Your Individuality with X. To investigate the impact of Video further, find out whether users have more clicks with short or long-form content on Video.
- Display and Social drive the most clicks for #The Power of X. Since Display and Social are channels with higher reach, enhance creative quality to resonate more with the existing audience rather than specifically reach new users.
- Mobile is most effective on #The Ultimate Fashion Statement with X. Optimize ad to better fit on mobile, have more interactive mobile-friendly elements like CTA buttons and hashtags.

### Average CTR over time:
- Notably, there is a sharp peak in Sept 2022 to nearly 8% average CTR at its highest before declining to around 2% in the other months.
- Include more data to check for seasonality patterns across several years. If Sept does have a noticeably higher CTR than other months, it is beneficial to allocate more budget on Sept.
- Investigate creative, media cost, channel allocation in Sept to replicate performance in other months

### Assessment of Average CTR Performance:
- An authoritative source of average CTR in the jewelry space is not available. Instead, I use the [overall industry CTR benchmark](https://www.webfx.com/blog/marketing/whats-good-click-rate-ctr-industry/#:~:text=While%20a%20good%20CTR%20depends,the%20average%20CTR%20is%200.46%25) to categorize CTR into two groups: higher and lower than the benchmark.
- 76.5% of CTRs are below the average of 1.9%, indicating significant potential for optimization to achieve a higher CTR.
- After evaluating factors like channel type, day of the week, and keywords for their impact on CTR, no clear trends were identified that consistently characterize campaigns with higher CTRs.
- Alternatively, improving CTR in teh long run could also be achieved by reducing average CPC and CPM.

### Assessment of Average CPC and CPM:
- Both CPC and CPM are on average higher in May 2022, likely because the campaigns have just begun and are still being optimized for cost.
- Average CPC and CPM declines sharply and stabilizes in the next few months]
- Monitor cost in the starting months and lower media spend to optimize both metrics
