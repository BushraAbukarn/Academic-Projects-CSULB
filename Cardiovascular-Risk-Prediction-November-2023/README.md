## ✨Cardiovascular Risk Prediction 
<img width="915" height="811" alt="image" src="https://github.com/user-attachments/assets/f1e109da-a402-4aed-a833-2d444ff278ca" />

## 🎯 Purpose
### The reason for choosing to talk about this topic: 
1. Cardiovascular diseases encompass a range of disorders that affect the heart and blood vessels.
2. Globally, Cardiovascular diseases are the leading cause of death, taking an estimated 17.9 million lives each year, as reported by the World Health Organization.
3. Numerous factors contribute to the risk of developing cardiovascular diseases. Analyzing the provided data through a regression analysis model allows us to identify which factors have the most significant impact.
4. Furthermore, regression analysis stands out as the most frequently used technique in machine learning. According to the National Library of Medicine, machine learning significantly improves the accuracy of predicting cardiovascular risk.

## 📊 Dataset Descriptionc
The dataset used for this project was sourced from Kaggle and is titled Cardiovascular Disease Dataset. It includes a wide range of health and lifestyle variables collected from patient records, such as:
- Demographic information (e.g., age, sex)
- Clinical measurements (e.g., BMI, blood pressure)
- Behavioral factors (e.g., physical activity, smoking, alcohol use)
- Mental health indicators (e.g., depression)

The dataset was already cleaned and free of missing values. 
For this project, I focused on a subset of variables believed to be most relevant to cardiovascular risk based on domain knowledge and initial correlation analysis. The predictors used were:
Exercise, Depression, Sex, Age Category, BMI, Smoking History, and Alcohol Consumption. 
This feature selection helped simplify the model, improve interpretability, and focus the analysis on lifestyle and behavioral risk factors.

## 🧪 Analysis & Methodology
To model the likelihood of cardiovascular disease occurrence, I employed three binary classification models:
- Logistic regression (logit link)
- Probit regression
- Complementary log-log (cloglog) regression
  
To validate the results, models were implemented in both RStudio and SAS.

Model performance was evaluated using the following information criteria:
- Akaike Information Criterion (AIC)
- Bayesian Information Criterion (BIC)
- Corrected Akaike Information Criterion (AICc)
  
The probit regression model consistently yielded the lowest AIC, BIC, and AICc values, indicating it provided the best fit among the three. As a result, the probit model was selected as the final model for interpretation and prediction.
## 🔍 Key Findings
Φ^-1(π) = -2.871117 -.267145 Exercise + .3113835 Depression + .412838 Male + .258597 Smoking - .009876 Alcohol – 2.72266 (25-29 years old) + .115133 (30-34 years old) - .106887 (35-39 years old) + .242569 (40-44 years old)  + .406810 (45-49 years old) + .553118 (50-54 years old) + .773307 (55-59 years old) + 1.029560 (60-64 years old) + .990837 (65-69 years old) + 1.350416 (70-74 years old) + 1.323566 (75-79 years old) + 1.572687 (80+ years old) + .014392 BMI.


Interpretation of Coefficients:
#### Sex: Males have a 0.412838 higher z-score of estimated probability of developing cardiovascular disease than female.
#### Exercise: Regular physical activity decreases the z-score by 0.267, indicating a protective effect.
#### Depression: Presence of depression increases the z-score by 0.311, showing a significant association with higher risk.
#### Smoking: Smokers have a 0.259 higher z-score than non-smokers, reflecting increased risk.
#### BMI: Each unit increase in BMI raises the z-score by 0.014, suggesting a modest positive relationship with cardiovascular risk.
#### Age: Older age categories are associated with substantially higher z-scores, particularly beyond age 55, indicating a strong age-related increase in risk.

These findings are consistent with clinical expectations and public health literature, reinforcing the role of lifestyle and mental health factors in cardiovascular disease risk.

## 💡 Recommendations
Using the final probit model, I estimated the probability of developing cardiovascular disease for a specific case:
A 55-year-old male who exercises regularly, does not smoke, drinks rarely, and reports positive mental well-being (no signs of depression) was predicted to have a 5.5% probability of developing cardiovascular disease.

This result underscores the protective effect of a healthy lifestyle. Based on the model findings, I recommend the following public health and individual-level actions:
- Encourage regular physical activity, especially in middle-aged and older adults.
- Promote smoking cessation and reduced alcohol consumption.
- Support mental health, as depression was a significant predictor.
- Increase awareness about how lifestyle changes can significantly reduce cardiovascular risk even in older populations.

These findings align with current medical literature and reinforce the importance of behavioral interventions in cardiovascular disease prevention.

