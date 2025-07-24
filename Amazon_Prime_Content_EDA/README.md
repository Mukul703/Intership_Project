Exploratory Data Analysis on Amazon Prime Video Content

Project Summary
This project performs Exploratory Data Analysis (EDA) on Amazon Prime Video’s content dataset to derive actionable insights for content strategy, audience engagement, and data-driven business planning.

In the competitive streaming landscape, understanding what resonates with viewers and identifying trends is critical for driving subscriptions and retention.

Business Objective
To uncover insights from Amazon Prime Video data that help:

Refine content strategy

Enhance viewer engagement

Support data-driven decisions to maximize subscriptions and retention

Tools Used
Google Colab Notebook (Python, Pandas, Matplotlib, Seaborn)

CSV data files (titles.csv, credits.csv)

📂 Data Source & Domain
Domain: OTT Streaming / Entertainment Analytics

Data Source: Public CSV datasets

Files:

titles.csv: Title details (type, genre, ratings, runtime)

credits.csv: Title credits (actors, directors, characters)

The datasets were merged using id, cleaned systematically, and prepared for EDA.

🧹 Data Preparation
Checked and handled null values using appropriate placeholders and medians.

Removed 168 duplicate rows.

Converted relevant columns (seasons, imdb_votes) to int64.

Ensured logical consistency in runtime, imdb_score, and tmdb_score.

Merged titles.csv and credits.csv to form a unified dataset for robust EDA.

📊 Data Visualization & Analysis
Univariate Analysis
Box Plot: Runtime distribution

Box Plot: IMDb score distribution

Count Plot: Content type (Movies vs TV Shows)

Histogram: Release year distribution

Bar Plot: Season-wise distribution

Bar Plot: Age certification distribution

Bar Plot: Top 5 production countries

Histogram: IMDb score distribution

Bivariate & Multivariate Analysis
Scatter Plot: TMDb popularity vs IMDb score

Violin Plot: IMDb scores across Movies vs TV Shows

Line Plot: Seasons vs Release Year

Correlation Heatmap: Feature relationships

Pair Plot: Visual exploration of numeric features

🔍 Key Insights
✅ Content Focus: Movies dominate the catalog, with TV shows focusing on short-format and mini-series.
✅ Genre Trends: Drama, Comedy, and Action are most common, reflecting strong viewer demand.
✅ Content Freshness: Significant content addition post-2010 keeps the catalog contemporary.
✅ Runtime Patterns: Most titles are 90–110 minutes, aligning with viewer preferences.
✅ Ratings Insights: IMDb ratings typically range 5.5–7, indicating moderate to good reception.
✅ Audience Targeting: Content primarily targets 13+ and 16+ segments.
✅ Regional Focus: US, UK, and India lead in content production, enabling regional strategies.
✅ Correlation Findings: IMDb votes moderately correlate with IMDb scores (~0.26–0.62), while TMDb popularity shows a weak correlation, emphasizing content quality over popularity.

📈 Actionable Strategy for Growth
Continue investing in high-demand genres while testing underrepresented categories.

Add recent content with optimal runtimes and prioritize teen/young adult segments.

Expand regional content in key markets to boost engagement.

Leverage high IMDb-rated titles for platform reputation and sustained interest.

Prioritize quality over popularity, ensuring discoverability and long-term value.

✅ Conclusion
This EDA on Amazon Prime Video’s dataset uncovered insights supporting content alignment with audience interests, quality improvement, and regional diversification to drive sustainable growth and viewer retention.

Future work can explore:

Underrepresented genre testing

Regional performance trends

Content lifecycle and churn analysis

🧠 What I Learned
Advanced EDA workflow management on Google Colab.

Effective data wrangling and null handling for real-world datasets.

Applying data visualization to extract clear business insights.

Understanding content strategy analysis for OTT platforms.
