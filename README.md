# Evaluation of the Swasthya Sathi Scheme in West Bengal

![Healthcare](https://img.shields.io/badge/Healthcare-Research-blue) ![Data Analysis](https://img.shields.io/badge/Data-Analysis-green) ![Public Policy](https://img.shields.io/badge/Public-Policy-orange)

This repository contains the analysis and findings from a comprehensive evaluation of the **Swasthya Sathi Scheme**, a health insurance initiative launched by the Government of West Bengal in 2016. The study assesses the scheme's effectiveness in improving healthcare accessibility and reducing the financial burden of hospitalisation for residents of West Bengal.


## Introduction
This project, completed as part of the course Applied Econometrics (ECON05DSE1A), evaluates the effectiveness of the **Swasthya Sathi Scheme**, a health insurance initiative launched by the Government of West Bengal in 2016. The scheme aims to provide affordable healthcare access to economically vulnerable groups, and this study assesses its implementation, awareness, accessibility, and user satisfaction.

The **Swasthya Sathi Scheme** offers cashless, paperless healthcare services through **Swasthya Sathi Smart Cards**, covering up to ₹5 lakh per family annually for treatments, including high-cost procedures, pre-existing conditions, and maternity care. Initially targeting economically vulnerable groups, the scheme was expanded in 2020 to cover all residents of West Bengal. This study focuses on identifying barriers to enrolment and usage, as well as evaluating the scheme's impact on healthcare accessibility and financial relief for residents of West Bengal.

## Objectives
The primary objectives of this study are:
1. **Assess awareness levels** about the Swasthya Sathi Scheme’s benefits among enrolled families.
2. **Examine enrolment rates** and the demographic factors influencing scheme participation.
3. **Analyse users' experiences** with the hospitalisation process under the scheme, including satisfaction with covered services and perceived accessibility improvements.
4. **Identify key barriers** to enrolment and usage, such as lack of awareness or perceived quality of care.


## Methodology
### Survey-Based Approach
- **Participants**: 129 participants from Kolkata, Howrah, and nearby districts in West Bengal were interviewed. Eligible participants had at least one family member hospitalised within the past two years.
- **Questionnaire Design**: The survey questionnaire was designed using CSPro (Census and Survey Processing System), ensuring a structured and efficient data collection process.
- **Data Collection**: Data were collected using a structured questionnaire, focusing on:
  - Enrolment process
  - Hospitalisation episodes
  - Awareness of the scheme
  - Financial assistance and decision-making
- **Statistical Analysis**: 
  - **Enrolment Rates**: Analysed using Kruskal-Wallis tests and logistic regression.
  - **User Experience**: Evaluated using Likert scale ratings and descriptive statistics.

### Key Metrics
- **Enrolment Rates**: Examined by demographic factors such as religion, caste, education, occupation, and income.
- **Awareness**: Assessed through factual and non-factual statements about the scheme's benefits.
- **User Satisfaction**: Measured across various aspects of hospitalisation, including admission, treatment, and release processes.


## Key Findings
The following are some of the key findings from the study. For a more comprehensive analysis, including additional insights, detailed statistical tests, and visualisations, please refer to the [full report](SSA_Evaluation_Report.pdf) in the repository.

### Enrolment Rates
- **High Enrolment Among Vulnerable Groups**: 
  - Below Poverty Line (BPL) families had a 95% enrolment rate, compared to 77% for non-BPL families.
  - Larger households (more than four members) showed significantly higher enrolment rates (94.44%) compared to smaller households (74% for households with less than four members).
- **Disparities by Religion and Education**:
  - Hindu respondents had an 85% enrolment rate, while only 50% of Muslim respondents were enrolled.
  - Highly educated individuals (graduates and postgraduates) had lower enrolment rates (64% and 50%, respectively) compared to those with primary or secondary education (90%).
- **Income Threshold**:
  - Enrolment rates dropped sharply for households earning above ₹35,000 per month, indicating that the scheme is more effective in targeting lower-income groups.

### Awareness
- **Core Benefits**:
  - A majority of respondents were aware of the scheme’s coverage for hospitalisation (93% correct responses) and maternity care (37% correct responses).
  - However, awareness of specific provisions, such as travel allowances (32% correct responses) and emergency care coverage (49% correct responses), was notably lower.
- **Misconceptions**:
  - A significant portion of respondents (30-40%) answered "Don’t Know" to questions about travel allowances, outpatient department (OPD) visits, and card usability outside West Bengal, indicating gaps in awareness.

### User Experience
- **Positive Feedback**:
  - 90% of cardholders reported a positive experience with the scheme.
  - 80% of respondents felt that hospitals provided clear and sufficient admission information.
- **Challenges**:
  - **Improper Fees**: 30% of cardholders were improperly asked to deposit fees, despite the scheme’s cashless nature.
  - **Limited Empanelment**: 70% of non-users cited the non-empanelment of their chosen hospitals or physicians as the primary reason for not using the card.
  - **Documentation Requirements**: 23% of respondents found the documentation process excessive.

### Barriers to Enrolment and Usage
- **Quality of Care**:
  - 53% of non-enrollees cited concerns about the quality of care provided under the scheme as their primary reason for not enrolling.
- **Enrolment Process**:
  - 29% of non-enrollees found the enrolment process difficult, suggesting a need for simplification.
- **Alternative Insurance**:
  - 16% of non-users already had private health insurance, which they preferred over the Swasthya Sathi scheme.
- **Scepticism**:
  - 47% of non-enrollees expressed dissatisfaction with the coverage of empanelled hospitals and physicians, indicating a lack of trust in the scheme’s network.


## Conclusion
The **Swasthya Sathi Scheme** has demonstrated significant potential in improving healthcare accessibility and reducing financial burdens for residents of West Bengal. However, the study highlights several areas for improvement:
- **Awareness**: Clearer communication strategies are needed to educate beneficiaries about specific provisions.
- **Service Delivery**: Addressing improper fee demands and expanding hospital empanelment are critical.
- **Inclusivity**: Targeted outreach efforts are necessary to increase participation among underrepresented groups.

Overall, the scheme represents a significant step toward universal healthcare in West Bengal, but its success depends on addressing these operational and structural challenges.


## Technologies Used
- **Questionnaire Design**: CSPro (Census and Survey Processing System)
- **Statistical Analysis**: R, Stata
- **Data Visualisation**: ggplot2, Excel
- **Survey Tools**: Structured questionnaires, paper-and-pen interviews


## File Structure
- `data/`: Contains the response dataset used in the analysis.
- `code/`: Contains the scripts and files used for data analysis and visualisation.
- `images/`: Contains visualisations and charts generated during the analysis.


## How to Use
This repository contains code and data for analysing the Swasthya Sathi Scheme. Follow these steps to use the resources:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/sovietscout/swasthya-sathi-evaluation.git
