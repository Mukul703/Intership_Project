# 📺 **Exploratory Data Analysis on Amazon Prime Video Content**

---

## ## Table of Contents
- [Objective](#objective)
- [Data Preparation](#data-preparation)
- [Visualization](#visualization)
- [Key Insights](#key-insights)
- [Conclusion](#conclusion)
- [What I Learned](#what-i-learned)

---

## ## Objective

Performed **Exploratory Data Analysis (EDA)** on Amazon Prime Video’s dataset to extract **actionable insights** supporting **content strategy, audience engagement, and data-driven decisions** to maximize subscriptions and retention.

**Tools Used:**
- Google Colab Notebook (Python, Pandas, Matplotlib, Seaborn)
- CSV data (`titles.csv`, `credits.csv`)

**Data Domain:** OTT Streaming / Entertainment Analytics

---

## ## Data Preparation

- **Merged** `titles.csv` and `credits.csv` on `id` to create a unified dataset for analysis.
- **Null Handling:**
  - Filled missing categorical fields with `'Unknown'` or `'Not applicable'`.
  - Filled missing numerical fields (`imdb_score`, `imdb_votes`, `tmdb_popularity`, `tmdb_score`) with median values.
  - Dropped rows with missing `imdb_id`.
- **Duplicates:** Removed 168 duplicate rows.
- **Data Type Conversion:** Converted `seasons`, `imdb_votes` to `int64`.
- **Logical Consistency Checks:** Ensured non-negative `runtime`, valid `imdb_score`, `tmdb_score` values.

The dataset was made **clean, consistent, and ready for EDA**.

---

## ## Visualization

### **Univariate Analysis**
- Box Plot: Runtime distribution
- Box Plot: IMDb Score distribution
- Count Plot: Content Type (Movies/Shows)
- Histogram: Release Year distribution
- Bar Plot: Season-wise distribution
- Bar Plot: Age Certification distribution
- Bar Plot: Top 5 Production Countries
- Histogram: IMDb Score distribution

### **Bivariate & Multivariate Analysis**
- Scatter Plot: TMDb Popularity vs IMDb Score
- Violin Plot: IMDb Scores across Movies/Shows
- Line Plot: Seasons vs Release Year
- Correlation Heatmap
- Pair Plot for numeric features

---

## ## Key Insights

- **Content Type:** Movies dominate the catalog; TV shows focus on short-format and mini-series.
- **Genres:** Drama, Comedy, Action are the most frequent.
- **Freshness:** Significant content additions post-2010.
- **Runtime:** Most titles range between 90–110 minutes.
- **Ratings:** IMDb ratings typically range between 5.5–7.
- **Target Audience:** Content primarily targets 13+ and 16+ age groups.
- **Regional Contribution:** US, UK, and India are leading producers.
- **Correlation:** IMDb votes moderately correlate with scores; TMDb popularity has a weak correlation.

---

## ## Conclusion

This **EDA project on Amazon Prime Video’s dataset** provided clear, actionable insights to:

- Align content offerings with **viewer interests**.
- Focus on **quality content** over popularity.
- Drive **sustainable subscription growth** and **viewer retention** through data-driven strategies.

Future exploration may include:
- Testing underrepresented genres for niche audiences.
- Analyzing regional content performance.
- Studying content lifecycle trends for churn reduction.

---

## ## What I Learned

- End-to-end **EDA workflow management in Google Colab**.
- Advanced **data wrangling, null handling, and cleaning techniques**.
- Effective **visual storytelling for business insights**.
- Strategic understanding of **content planning for OTT platforms**.

---

> *This project strengthens my data analyst portfolio by demonstrating my ability to derive business-relevant insights from real-world datasets using EDA techniques.*
