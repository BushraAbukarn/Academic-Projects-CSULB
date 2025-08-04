#Reading the CSV file
Diabetic <- read.csv(file = "C:/Users/bushr/OneDrive/Desktop/CBT_MBCT.csv", header = TRUE, sep = ",")

#1. Data transformation: categorization
Diabetic <- Diabetic %>%
  mutate(
    Group = factor(Group, levels = c(1, 0), labels = c("CBT", "MBCT")),
    Gender = factor(Gender, levels = c(1, 0), labels = c("Female", "Male")),
    Education = factor(Education, levels = c(0, 1, 2), labels = c("Low Education", "Intermediate Education", "High Education")),
    Type_diabetes = factor(Type_diabetes, levels = c(2, 1), labels = c("Type II", "Type I")),
    Comorbidities = factor(Comorbidities, levels = c(1, 0), labels = c("Yes", "No"))
  )

#2. Data cleaning: doping unnecessary columns
Diabetic <- Diabetic %>% select(-c(7:10, 12:15, 17))

#3. Reshaping Diabetic Dataset and Recoding BDI Scores by Month
Diabetic_Pivot <- Diabetic %>% 
  pivot_longer(cols = c('BDIpre', 'BDIpost', 'BDI9fu'),
               names_to='Month', 
               values_to = 'BDIscore') %>%
  mutate(
    Month = recode(Month, "BDIpre" = 0, "BDIpost" = 3, "BDI9fu" = 12))


#4. Summary Statistics of the response variable
summary(Diabetic_Pivot$BDIscore)

#5. Testing the normality of the value
#5.1 Histogram Plot
plotNormalHistogram(Diabetic_Pivot$BDIscore)

#5.2 Shapiro Test
shapiro.test(Diabetic_Pivot$BDIscore)

#6. Specifying reference category
Diabetic_Pivot$Group.rel <- relevel(as.factor(Diabetic_Pivot$Group), ref = "MBCT")
Diabetic_Pivot$Gender.rel <- relevel(as.factor(Diabetic_Pivot$Gender), ref = "Female")
Diabetic_Pivot$Education.rel <- relevel(as.factor(Diabetic_Pivot$Education), ref = "High Education")
Diabetic_Pivot$Type_diabetes.rel <- relevel(as.factor(Diabetic_Pivot$Type_diabetes), ref = "Type II")
Diabetic_Pivot$Comorbidities.rel <- relevel(as.factor(Diabetic_Pivot$Comorbidities), ref = "No")

#Cleaning extra column
Diabetic_Pivot <- Diabetic_Pivot %>% select(-c(2:3, 5:7))

#7. Fitting random slope and intercept model
summary(fitted.model <- lme(BDIscore ~ Group.rel + Gender.rel + Age + Education.rel + Type_diabetes.rel + 
                              Comorbidities.rel + Neuroticism + Month, 
                            random = ~ 1 + Month | ID, data = Diabetic_Pivot, control = lmeControl(opt = "optim")))


#8. Checking the Homoscedasticity 
plot(fitted.model, which = 3)


#9. Extract residuals
residuals <- resid(fitted.model)
#9.1 Checking the normality of residuals through Q-Q plot
qqnorm(residuals)
qqline(residuals, col = "red")


#10. Using the model to predict the BDI score of a 45-year-old female with type II diabetes, high education, no comorbidities, and a neuroticism level of 35 after MBCT treatment
new.data <- rbind(Diabetic_Pivot, data.frame(ID = "NA", Group.rel = "MBCT", 
                                             Gender.rel = "Female", Age = 45, Education.rel = "High Education", 
                                             Type_diabetes.rel = "Type II", Comorbidities.rel = "No", 
                                             Neuroticism = 35, Month = 3, BDIscore = NA))

pred <- predict(fitted.model, new.data, level = 0)
pred[length(pred)]
