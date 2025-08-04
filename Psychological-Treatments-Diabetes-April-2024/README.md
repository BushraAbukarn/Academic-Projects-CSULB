## Longitudinal Analysis of Psychological Treatments for Diabetes
![image](https://github.com/user-attachments/assets/1582015f-9f60-48fa-a942-c476758648cc)

### Introduction
According to the National Diabetes Statistics Report, 38.4 million people in the United States have diabetes, representing 11.6% of the population. This large number underscores the seriousness of diabetes as a major public health concern, as it can lead to other severe health issues over time. Additionally, diabetes affects not only the physical well-being of patients but also takes a toll on their mental health, with a significant portion experiencing symptoms of depression.
This project is designed to examine the effectiveness of psychological treatments in alleviating depressive symptoms among individuals with diabetes. Specifically, it employs the linear mixed-effects regression model, an extension of linear regression that is particularly suited for analyzing longitudinal data. This model is ideal for evaluating the impact of treatments like Cognitive Behavioral Therapy (CBT) and Mindfulness-Based Cognitive Therapy (MBCT) across diverse patient populations over time. Furthermore, the model helps identify significant predictors of depression by assessing the statistical significance of their effects through hypothesis testing.

#### Diabetic
A chronic disease that affects the transformation of food into energy, breaking down most of the food in the body into sugar (glucose) and releasing it into the bloodstream.

![image](https://github.com/user-attachments/assets/57773d4a-dd2b-4ed0-a529-0f60014f64e1)

#### Cognitive Behavioral Therapy (CBT)
Focuses on identifying and challenging negative thought patterns directly, aiming to change them into more positive and adaptive ones through structured exercises and homework assignments.

#### Mindfulness-Based Cognitive Therapy (MBCT)
Integrates mindfulness practices with cognitive therapy techniques. It encourages individuals to observe their thoughts and emotions without judgment, and acceptance to prevent relapse and manage symptoms.

![image](https://github.com/user-attachments/assets/647155ba-51b0-4c0d-8ae3-619450dd7620)
_________________________________________________________________________________________________________________________________________________________________________________________________________________________________
### Dataset
The data is a longitudinal dataset sourced from the study titled "What Works Best for Whom." In this longitudinal dataset, patients were followed for a year of treatment, with Beck Depression Inventory (BDI) scores measured at three points: pre-treatment, post-treatment (after 3 months of treatment), and at a 9-month follow-up. Additionally, other variables were measured, including comorbidities, neuroticism, and more. 

![image](https://github.com/user-attachments/assets/6d8a2357-a3e2-46a6-8eb0-e378f6326631)
_________________________________________________________________________________________________________________________________________________________________________________________________________________________________
### Data Wrangling 
Data preparation included cleaning steps, such as dropping unnecessary columns, and modifications like pivoting to ready the dataset for analysis and visualization. This process transformed the data into a long format by converting the Beck Depression Inventory score variables ("BDIpre," "BDIpost," and "BDI9fu") into individual observations.

![image](https://github.com/user-attachments/assets/b7c16a4a-7c13-4747-b00b-1328180e0f34)

Here's how the dataset looks after manipulation
![image](https://github.com/user-attachments/assets/7c98a5cf-2686-4ec9-b4b5-24bf4c3a88ec)

_________________________________________________________________________________________________________________________________________________________________________________________________________________________________
### Summary Statistics 
The average score of the BDI is 18.84.

![image](https://github.com/user-attachments/assets/09947a44-63cd-4883-bcf0-906518fc51e6)

The histogram is unimodal and right-skewed, and the Shapiro-Wilk test yields a p-value less than 0.05, indicating that the BDI is not normally distributed. 

![image](https://github.com/user-attachments/assets/5566a241-98ff-462b-a7b0-52a892bc026e)

_________________________________________________________________________________________________________________________________________________________________________________________________________________________________
### Fitting the Model 
In this model, the response variable is the BDI score where the predictors include Group of treatment, Gender, Age, Education level, Type of diabetes, Comorbidities, and Neuroticism.

![image](https://github.com/user-attachments/assets/41e9701c-bd58-4dcf-9d18-f159046d3622)
![image](https://github.com/user-attachments/assets/567460ea-f395-4f27-a7e9-c05194084f5c)
![image](https://github.com/user-attachments/assets/c1c70b9e-87de-438d-8d23-67f1ef6a0dfe)
![image](https://github.com/user-attachments/assets/2381243b-9221-43b0-b124-9bc20a99b4d3)

The model identifies key predictors of the response variables by evaluating their statistical significance through hypothesis testing, with significant predictors defined as those having a p-value < 0.05. The significant predictors include gender, age, neuroticism level, and month.

Ê(BDI) = -21.578252 + .807103 CBT + 4.702615 Male + .294769 Age + 4.115252 Low Education + 3.097370 Intermediate Education + 2.875266 Diabetes Type I  - 2.089979 Comorbidities + .534734 Neuroticism - .406505 Month. σ = 7.07. 
- For males, the estimated average BDI score (Beck Depression Inventory) is 4.702615 points higher than for females. 
- Additionally, for every additional year of age, the estimated average BDI score increases by 29.4%. 
- Moreover, as the neuroticism level increases by one unit, the estimated average BDI score increases by 53.4%.
- Conversely, the estimated average BDI score decreases by 40.6% with each month of psychological treatment.

The range of standardized residuals is approximately [−2.24,2.59], with a median close to zero. This distribution of residuals is relatively symmetric around zero, which is a good indication of a well-fitted model.
The residual error of 7.07 suggests some variation remains unexplained at the individual level.
_________________________________________________________________________________________________________________________________________________________________________________________________________________________________
### Checking the Normality & Homoscedasticity
This is a residuals vs. fitted values plot for the Linear Mixed-Effect model, which shows the standardized residuals on the y-axis and the fitted values (predicted values) on the x-axis.

![image](https://github.com/user-attachments/assets/e4078b31-6880-4934-ad88-0466cb0fcc4c)

Overall, the plot suggests a reasonably good fit, with the residuals scattered randomly around zero, indicating that the model captures the main patterns in the data.

![image](https://github.com/user-attachments/assets/06bf1d55-c2f7-4d3e-a83f-5bb7e360096b)
_________________________________________________________________________________________________________________________________________________________________________________________________________________________________
### Prediction
Here I used the model to predict the BDI score of a 45-year-old female in the MBCT post-treatment period, dealing with type II diabetes, who has a high level of education and no comorbidities. Her neuroticism level is 35. The BDI score for this case is 9.18.

![image](https://github.com/user-attachments/assets/ef6ef0c3-2962-4802-ae6e-5d27125a9b86)
_________________________________________________________________________________________________________________________________________________________________________________________________________________________________
### Conclusion
Based on the results, I can conclude that psychological treatments significantly alleviate depressive symptoms in diabetic patients, reducing them by approximately 41% with each month of psychological treatment. However, we can also conclude that there is no significant difference between the CBT treatment and MBCT treatment for diabetic patients, as the p-value of the CBT treatment is greater than 5%. The "What Works Best for Whom" study found that both therapies, CBT and MBCT, helped reduce depression in diabetic patients, which supports the results we obtained.

![image](https://github.com/user-attachments/assets/6145f780-ae7f-4eaf-bbe4-c8b18ab0282c)
_________________________________________________________________________________________________________________________________________________________________________________________________________________________________
### Reference:
[1] National Institute of Diabetes and Digestive and Kidney Diseases. “Diabetes Statistics -
NIDDK.” National Institute of Diabetes and Digestive and Kidney Diseases, Jan. 2024,
www.niddk.nih.gov/health-information/health-statistics/diabetesstatistics#:~:text=Estimated%20prevalence%20of%20diabetes%20in.

[2] Life Line Screening. “What’s the Difference between Type 1 and Type 2 Diabetes?”
Www.lifelinescreening.com, www.lifelinescreening.com/health-education/diabetes/type-1-type2-diabetes?sourcecd=WNAT003.

[3] Egede, Leonard E., and Charles Ellis. “Diabetes and Depression: Global Perspectives.”
Diabetes Research and Clinical Practice, vol. 87, no. 3, Mar. 2010, pp. 302–312,
www.sciencedirect.com/science/article/abs/pii/S0168822710000471,
https://doi.org/10.1016/j.diabres.2010.01.024.
