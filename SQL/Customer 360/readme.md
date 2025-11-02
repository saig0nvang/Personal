# RFM Customer Segmentation Analysis

This project implements customer segmentation using the RFM (Recency, Frequency, Monetary) model. The objective is to gain deeper insights into customer behavior groups, which helps the business deploy personalized marketing strategies, optimize costs, and enhance customer satisfaction.

---

### 🎯 Business Objectives

Customer 360 is a system for analyzing customer information, allowing the company to leverage multiple aspects to serve business operations. By applying the RFM model, this project aims to:

**Identify Key Customer Segments:** Classify customers into distinct groups such as "Champions," "Potential Loyalists," "At Risk," etc.
**Optimize Marketing Campaigns:** Increase campaign effectiveness by targeting the right customer groups with appropriate messages.
**Improve Customer Retention:** Develop suitable strategies to retain high-value customers and re-engage those at risk of churning.

---

### 🛠️ Technical Process

The analysis process was performed entirely in SQL and included the following main steps:

#### 1. Calculating RFM Values
A detailed table was created to calculate the three core metrics for each customer:
**Recency (R):** Calculated as the number of days from the customer's last purchase to the analysis date (e.g., '2022-09-01').

**Frequency (F):** Purchase frequency, normalized by the customer's "age" (time since registration) to ensure fairness between new and old customers.

**Monetary (M):** Total monetary value (GMV), also normalized by the customer's "age".
 

#### 2. RFM Scoring
Customers were scored from 1 to 5 for each metric based on the **Quintile**.
* A higher **Recency** score is given for more recent purchases.
* Higher **Frequency** and **Monetary** scores are given for greater frequency and spending.

#### 3. Phân khúc khách hàng (Segmentation)
The individual R, F, and M scores are combined into a consolidated RFM score, which is then mapped to pre-defined customer segments using a `CASE` statement, for example:
*`RFM Score = 555` -> **Champions** 
*`RFM Score = 451` -> **Potential Loyalist** 
*`RFM Score = 112` -> **Lost customers** 

---

### 📊 Visualization and Analysis:

*The segmented data from SQL was then visualized using Power BI to derive insights.*


---
