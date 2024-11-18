# ABC Jewelry Marketing Campaign Analysis (May-Dec 2022)
## Brief Overview
ABC Jewelry is a fictitious jewelry brand. Using the dataset available in [Kaggle](https://www.kaggle.com/datasets/rahulchavan99/marketing-campaign-dataset/code), I clean the dataset and analyze 72,603 of campaign data. Presenting the results to the brand and marketing team, I discuss the ROI of the 7-month long campaign using several important KPI metrics, with a focus on Clickthrough Rate (CTR = click/impressions), along with actionable recommendations for future campaigns.

**Tools**: Python (pandas, matplotlib, seaborn)

**Subjects Covered**: Data wrangling, conversion, transformation, bar charts, time series graphs

[Jupyter Notebook](https://github.com/sanrio00/portfolio-projects/blob/b38ea42232faf3a029cedf8a04e23b770d590ffa/Completed/ABC%20Jewelry%20Marketing%20Campaign%20Analysis%20(May-Dec%202022)/marketing_ROI.ipynb) with my code can be found in the repository.

### KPI metrics
1. Impressions: Number of times users see the ad
2. Clicks: Number of times users click through the ad
3. Click-through Rate (CTR): Ratio of clicks on impressions, a measure of how effective the ad is in getting users to click.
4. Cost-per-click (CPC): Ratio of media cost to clicks, calculated using media cost divided by clicks.
5. Cost-per-mile (CPM): Ratio of media cost to impressions (1 mile = 1000 impressions)

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
![Average Impressions and Clicks](https://github.com/user-attachments/assets/4f919ca2-5d62-48b3-b5ed-c9e2b07ab3bf)
- Display and Video channels have the highest average number of clicks. However, reallocating more budget to Mobile could be advantageous due to its superior click-to-impression efficiency. This would ensure sustained click performance even when the media budget runs lower.
- Search Channels have the highest average impressions, but are least effective in driving clicks. Consider optimizing CTA strategies and refining communication to make ads more compelling for engagement.

### Impact of Search Tags on Clicks:
![Average Clicks by Search Tags](https://github.com/user-attachments/assets/58add491-c003-4366-b60b-4d7637429711)
- On average, #The Power of X attracted the highest number of clicks across campaigns

### Impact of Search Tags & Channel Type on Clicks:
![Average Clicks by Search Tag by Channel Type](https://github.com/user-attachments/assets/e9214acc-81d5-4a87-9ef1-8a404ddafe05)
- When split by channel type, most channels hover around 40-50 average clicks per search tag, suggesting no significant differences in channel effectiveness.
- Video is most effective on #Embrace Your Individuality with X. To investigate the impact of Video further, find out whether users have more clicks with short or long-form content on Video.
- Display and Social drive the most clicks for #The Power of X. Since Display and Social are channels with higher reach, enhance creative quality to resonate more with the existing audience rather than specifically reach new users.
- Mobile is most effective on #The Ultimate Fashion Statement with X. Optimize ads for mobile by including more interactive elements like CTA buttons and hashtags.

### Average CTR over time:
![Average CTR Over Time](https://github.com/user-attachments/assets/28a7d23d-7fe6-4ff9-86a3-7d2f03657451)
- Notably, there is a sharp peak in Sept 2022 to nearly 8% average CTR at its highest before declining to around 2% in the other months.
- Include more data to check for seasonality across years. If September consistently shows higher CTR, allocate more budget to that month.
- Investigate creative, media cost, channel allocation in Sept to replicate performance in other months

### Assessment of Average CTR Performance:
![Distribution of Higher   Lower CTR](https://github.com/user-attachments/assets/2a57c25d-89ca-4c72-a04b-424f93e3a0b5)
- An authoritative source of average CTR in the jewelry space is not available. Instead, I use the [overall industry CTR benchmark](https://www.webfx.com/blog/marketing/whats-good-click-rate-ctr-industry/#:~:text=While%20a%20good%20CTR%20depends,the%20average%20CTR%20is%200.46%25) to categorize CTR into two groups: higher and lower than the benchmark.
- 76.5% of CTRs are below the overall industry average of 1.9%, highlitng potential for optimization.

![High vs Low Clicks on Other Factors](https://github.com/user-attachments/assets/8d2a9fec-5a8b-47cd-a9e6-5df0f8ec9a4b)
- Looking into the relationship of other factors like channel type or keywords on CTR, no clear trends were identified.
- Alternatively, reducing average CPC and CPM could also improve CTR in the long term.

### Assessment of Average CPC and CPM over time:
![Average CPC and CPM Over Time](https://github.com/user-attachments/assets/211d03a2-abb8-4d50-ac3f-efb6f4f2aabb)
- Both CPC and CPM are on average higher in May 2022, likely because the campaigns have just begun and are still being optimized for cost. They stabilize after sharp declines in the following months.
- Monitor cost in the starting months and lower media spend to optimize both metrics.
