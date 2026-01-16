# 📊 Paisabazaar Credit Score EDA | Customer Credit Risk Insights

## 🔎 Project Overview
Paisabazaar handles large-scale customer credit and financial data, but it is not always clear which customer behaviors and financial attributes truly differentiate **Good**, **Standard**, and **Poor** credit profiles.

This project performs **Exploratory Data Analysis (EDA)** to identify the key factors linked with different credit score categories and support **more consistent credit assessment** and **risk-aware decision-making**.

---

## 🧩 Problem Statement
Paisabazaar has access to detailed customer credit and financial data, but lacks clear visibility into which customer behaviors and financial attributes differentiate good, average, and poor credit profiles.

This project explores and analyzes credit-related data to identify the key factors associated with different credit score categories, supporting more consistent credit assessment and risk-aware decision-making.

---

## 🎯 Business Objectives
- Analyze customer credit and financial data to understand how behavioral and financial attributes vary across different credit score categories  
- Identify the key factors linked with **Good, Standard, and Poor** credit profiles to support informed credit assessment  
- Provide data-driven insights to assist Paisabazaar’s credit and risk teams in improving credit evaluation and product recommendations  

---

## 📂 Dataset Summary
- **Rows:** 100,000  
- **Columns:** 28  
- **Target Variable:** `Credit_Score` *(Good / Standard / Poor)*  
- **Missing Values:** 0  
- **Duplicate Records:** 0  

---

## 🧹 Data Wrangling & Cleaning
The dataset was prepared for analysis through the following steps:
- Corrected data type inconsistencies (float ➝ int for count-based fields)
- Converted identifier columns (`Customer_ID`, `SSN`, `ID`) to object type
- Cleaned and standardized the multi-valued `Type_of_Loan` column
- Created an additional feature: `Num_Loan_Types`
- Validated dataset consistency after preprocessing (shape and dtypes)

---

## 📈 EDA Approach (UBM Framework)
The visualization workflow follows a structured **UBM** approach:

### ✅ U — Univariate Analysis
- Distribution of target and key numerical features  
- Customer segmentation overview  

### ✅ B — Bivariate Analysis
- Numerical vs Credit Score (boxplots)
- Categorical vs Credit Score (countplots / stacked charts)
- Numerical vs Numerical (scatter / density plots)

### ✅ M — Multivariate Analysis
- Correlation heatmap
- Pair plot
- Multi-feature segmentation visuals

---

## 📊 Visual Results (Screenshots)
> Replace the placeholders below with your actual chart images.

### 1) Credit Score Distribution
📌 *(Add your image here)*  
![Credit Score Distribution](images/credit_score_distribution.png)

---

### 2) Key Univariate Charts
📌 *(Add your image here)*  
![Univariate Charts](images/univariate_charts.png)

---

### 3) Key Bivariate Relationship Charts
📌 *(Add your image here)*  
![Bivariate Charts](images/bivariate_charts.png)

---

### 4) Correlation Heatmap
📌 *(Add your image here)*  
![Correlation Heatmap](images/heatmap.png)

---

### 5) Pair Plot (Multivariate View)
📌 *(Add your image here)*  
![Pair Plot](images/pairplot.png)

---

## 🔍 Key Insights
- Most customers fall under the **Standard** credit score category, making it the largest segment for improvement and optimization
- **Delayed payments** strongly differentiate poor credit profiles and act as a major risk indicator
- Customers with higher **outstanding debt** are more likely to fall into weaker credit score categories
- A higher **number of active loans** is commonly associated with **Poor** credit scores
- **Credit mix** shows strong separation: good mix aligns with better credit scores, while bad mix aligns with poor credit profiles
- **Income alone is not a reliable indicator**, as high-income outliers also appear in lower credit score groups

---

## ✅ Business Recommendations (Solution)
- Prioritize **repayment behavior signals** (delays, due-date patterns) while assessing credit risk
- Apply a **Debt Stress Check** using outstanding debt + loan exposure to reduce default risk
- Focus on uplifting the **Standard** segment using structured credit upgrades and risk-aware product recommendations

---

## 🏁 Conclusion
This EDA provides clear drivers behind credit score classification and supports Paisabazaar in improving **credit assessment consistency**, reducing **risk of defaults**, and enabling **data-driven product recommendations**.

---

## 🛠 Tools & Technologies
- Python  
- Pandas, NumPy  
- Matplotlib, Seaborn  
- Google Colab  

---

## 👤 Author
**Mukul**  
Data Analyst | SQL | Python | EDA | Power BI  

