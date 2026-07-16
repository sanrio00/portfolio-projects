# Singapore Healthcare Datasets Analysis (2007-2023)
## Brief Overview
Using three publicly available datasets on Singapore's healthcare system, I clean and analyze trends in hospital admissions, outpatient attendances, and chronic disease risk factors among Singapore residents from 2007 to 2023, with a focus on demand trends and population health risks relevant to healthcare capacity planning.
 
**Tools**: Python (pandas, matplotlib, seaborn)
 
**Subjects Covered**: Data cleaning, data wrangling, exploratory data analysis, line charts, bar charts, multi-panel visualizations
 
[Jupyter Notebook](https://github.com/sanrio00/portfolio-projects/blob/main/Completed/Singapore%20Healthcare%20Datasets%20Analysis/Singapore%20Healthcare%20Datasets%20Analysis.ipynb) with my code can be found in the repository.
 
### Datasets Used
1. **Hospital Admissions, Public Sector Outpatient Attendances and Day Surgery Counts** - Monthly admission/attendance counts by facility type (2007-2023)
2. **Hospital Admission Rate by Gender and Age** - Annual admission rates per 1,000 residents, by gender, age group and hospital type
3. **Prevalence of Health Indicators for SG Adults** - Proportion of SG adults with chronic disease risk factors and healthy behaviors, by gender

## Summary of Insights with Recommendations
### Dataset 1: Hospital Admissions, Outpatient Attendances and Day Surgery Counts
![Average Admission Counts by Healthcare Facility Over Time](https://github.com/user-attachments/assets/8cd2c817-f9f6-4b09-a9d1-9035968c8c2e)
- Polyclinics and Specialist Outpatient Clinics have the largest average admission volumes, growing strongest from 2015 to 2019. Hospital admissions (Acute, Community, Psychiatric) climb more gently, with Acute Hospitals highest among the three.
- Polyclinics, Specialist Outpatient Clinics and Acute Hospitals all show a sharp drop in 2020, likely reflecting reduced care-seeking during COVID-19 lockdowns.
- **Recommendation**: Prioritise outpatient capacity expansion given its stronger pre-pandemic growth, and track post-2020 recovery to see if demand has returned to trend or settled lower.

### Dataset 2: Hospital Admission Rate by Gender and Age
![Average Admission Rate by Gender, Age Group, and Hospital Type](https://github.com/user-attachments/assets/49a83ae2-7d2f-4743-877f-19b4663a8661)
- **Gender**: Males consistently show higher admission rates than Females, with a stable gap over time.
- **Age**: 65+ residents consistently have the highest admission rates, with a stable gap over the other two age groups, pointing to rising pressure from an aging population.
- **Hospital Type & Age**: Acute Hospitals have the highest rates overall, with 65+ admitting over 4 times more than 15-64. Community Hospitals are similarly dominated by the elderly group. Notably, 15-64 year-olds admit into Psychiatric Hospitals more than the elderly.
- **Recommendation**: Prepare greater capacity for Acute and Community Hospital for the aging 65+ years segment. Additionally, look into mental health service accessibility for the working-age group sicne their Psychiatric admissions are higher.

### Dataset 3: Prevalence of Health Indicators for SG Adults
![Healthy Behavior vs Risk Factors Over Time, by Risk Factor and Gender](https://github.com/user-attachments/assets/78c96133-22a7-4907-ac67-10a4287d1613)
- Sufficient Physical Activity declined from 85.4% (2007) to 78.5% (2023). This shows that physical activity is not enough to offset the rising risk factors.
- Hypertension rose sharpest (19.8% in 2010 to 37% in 2022), alongside hyperlipidaemia. Binge Drinking more than doubled (4.3% to 10.3%). Daily Smoking, in contrast, declined steadily (13.3% to 8.8%), likely reflecting the success of the anti-smoking policy in Singapore.
- **Gender**: Males have higher rates across every risk factor, with the widest gaps in behavioral factors. Daily Smoking shows the largest gap (Males 19.51% vs Females 3.3%), while Obesity and Diabetes are more balanced. Males also report higher physical activity than Females, yet still carry a higher overall risk burden.
- **Recommendation**: Prioritise hypertension, hyperlipidaemia and binge drinking in public health campaigns. Target Males specifically in these health campaigns, given the stable gender gap in behavioral risk factors.
