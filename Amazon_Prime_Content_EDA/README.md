# **Exploratory Data Analysis on Amazon Prime Video Content**

---

## **Project Summary**

Performed **Exploratory Data Analysis (EDA)** on Amazon Prime Video’s dataset to derive **actionable insights for content strategy, audience engagement, and data-driven planning**.

---

## **Business Objective**

To uncover insights that help:
- Refine **content strategy**
- Enhance **viewer engagement**
- Support **data-driven decisions** for maximizing subscriptions and retention

---

## **Tools Used**

- **Google Colab Notebook** (Python, Pandas, Matplotlib, Seaborn)
- **CSV data source** (`titles.csv`, `credits.csv`)

---

## **Data Source & Domain**

- **Domain:** OTT Streaming / Entertainment Analytics
- **Source:** Public CSV datasets
- Merged on `id` to create a unified analysis-ready dataset.

---

## **Data Preparation**

- Checked and handled **null values** systematically
- Removed **168 duplicate rows**
- Converted columns (`seasons`, `imdb_votes`) to `int64`
- Checked logical consistency in `runtime`, `imdb_score`, `tmdb_score`
- Merged datasets to form `prime_data` for EDA

---

## **Data Visualization & Analysis**

### **Univariate Analysis**
- Box Plot: Runtime distribution
- Box Plot: IMDb Score distribution
- Count Plot: Content Type (Movies/Shows)
- Histogram: Release Year
- Bar Plot: Season-wise distribution
- Bar Plot: Age Certification
- Bar Plot: Top 5 Production Countries
- Histogram: IMDb Score

### **Bivariate & Multivariate Analysis**
-  Scatter Plot: TMDb Popularity vs IMDb Score
-  Violin Plot: IMDb Scores across Movies/Shows
-  Line Plot: Seasons vs Release Year
-  Correlation Heatmap
-  Pair Plot for numeric features

---

## **Key Insights**

✅ Movies dominate, with TV shows focusing on short formats and mini-series  
✅ Drama, Comedy, Action are top genres  
✅ Post-2010, content additions increased significantly  
✅ Most runtimes: 90–110 minutes  
✅ IMDb ratings typically 5.5–7  
✅ Majority content targets 13+ and 16+ audiences  
✅ Top production regions: US, UK, India  
✅ IMDb votes moderately correlate with scores; TMDb popularity shows weak correlation

---

## **Actionable Strategy for Growth**

- Focus on **high-demand genres** while testing underrepresented categories
- Add **recent content** with viewer-aligned runtimes
- Prioritize **teen/young adult segments**
- Expand **regional content** for market growth
- Leverage **high IMDb-rated titles**
- Prioritize **quality over mere popularity**

---

## **Conclusion**

This EDA uncovered insights supporting **content alignment with audience interests, quality improvement, and regional diversification** for **sustainable growth and retention** on Amazon Prime Video.

Future work:
- Explore underrepresented genres
- Regional performance analysis
- Content lifecycle and churn trends

---

## **What I Learned**

- Advanced **EDA workflow using Google Colab**
- Effective **data wrangling & null handling**
- Visual storytelling for **business-focused insights**
- Understanding **OTT platform content strategy**

---
