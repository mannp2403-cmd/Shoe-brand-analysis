# Shoe Brand Analysis — Multi-Brand Data Analytics Platform

## 📌 Project Overview

An end-to-end data analytics platform for the Indian shoe market covering **6 major global brands**: Nike, Adidas, Puma, Woodland, Columbia, and Skechers.

This project demonstrates a complete data analytics pipeline — from automated web scraping of live brand websites to SQL database design, Python EDA, and an interactive Power BI dashboard.

>  **All data is real and scraped live** — not from Kaggle or any pre-made dataset.

---

## 🏆 Key Findings

| Finding | Detail |
|---|---|
| 🥇 Market Leader | Puma — 186 shoes (33% of dataset) |
| 💰 Most Premium Brand | Columbia — avg price ₹11,164 |
| ⚡ Biggest Gender Gap | Nike — Men's shoes 104% more expensive than Women's |
| 🎯 Largest Price Segment | Mid-Range ₹3,000–₹6,000 = 35% of all products |
| 👟 Most Expensive Shoe | Puma FAST-R NITRO Elite — ₹23,999 |
| 💡 Cheapest Shoe | Nike Women — ₹795 |
| 📏 Most Popular Size | UK-7 and UK-8 across all brands |

---

## 📊 Dataset Summary

| Metric | Value |
|---|---|
| Total Shoes Scraped | 563 |
| Total Brands | 6 |
| Men's Shoes | 348 (61.8%) |
| Women's Shoes | 215 (38.2%) |
| Total Size Records | 3,215 |
| Total Style Codes | 558 |
| Price Range | ₹795 — ₹23,999 |
| Average Price | ₹7,905 |

---

## 🗂️ Project Structure
---

## 🛠️ Tools and Technologies

| Tool | Purpose |
|---|---|
| Python 3.x | Core programming language |
| Selenium WebDriver | Browser automation for dynamic websites |
| WebDriver Manager | Automatic ChromeDriver management |
| Pandas | Data manipulation and cleaning |
| NumPy | Numerical computations |
| Matplotlib | Data visualization |
| Seaborn | Statistical visualization |
| MySQL 8.0 | Relational database |
| MySQL Workbench | Database management GUI |
| Power BI Desktop | Interactive dashboard |
| Jupyter Notebook | Development environment |

---

## 📋 Phase 1 — Web Scraping

**Websites scraped:**

| Brand | Website | Difficulty | Key Challenge |
|---|---|---|---|
| Woodland | woodlandworldwide.com | ✅ Easy | Colors in shoe names |
| Columbia | columbiasportswear.co.in | ✅ Easy | Sold-out size filtering |
| Puma | in.puma.com | ⚠️ Medium | All data inside aria-label |
| Nike | nike.com/in | ⚠️ Hard | Price split across 2 elements |
| Adidas | adidas.co.in | 🔴 Hard | Lazy rendering — .text empty |
| Skechers | skechers.in | 🔴 Hard | Kasada bot protection |

**Technical challenges solved:**

- ✅ JavaScript rendering → Selenium with incremental scrolling
- ✅ Kasada bot protection → Headless Chrome + realistic user-agent
- ✅ Split prices (Nike) → Regex joining with re.findall()
- ✅ Lazy rendering (Adidas) → execute_script(textContent)
- ✅ UTF-8 encoding corruption → utf-8-sig read, utf-8 write
- ✅ Mixed EU/UK sizes → Custom standardization function
- ✅ Duplicate products → drop_duplicates() on ShoeName + Category

---

## 🗄️ Phase 2 — Database Design

**3 Normalized Tables (Third Normal Form — 3NF):**

**Table 1 — Shoe Master Data (563 rows)**

**Table 2 — Style and Colors (558 rows)**

**Table 3 — Size Records (3,215 rows)**


**22 SQL Queries:**
- 5 Table 1 queries → SELECT, WHERE, GROUP BY, ORDER BY
- 5 Table 2 queries → LIKE, COUNT, JOIN for color filtering
- 5 Table 3 queries → HAVING, size availability analysis
- 7 JOIN queries → correlated subqueries, multi-table JOINs

---

## 📈 Phase 3 — Exploratory Data Analysis

**11 Visualizations Created:**

1. Bar Chart — Brand distribution
2. Donut Chart — Men vs Women split
3. Histogram — Price distribution
4. Box Plot — Price by brand (outlier analysis)
5. Grouped Bar — Gender pricing gap
6. Pie Chart — Price segment distribution
7. Stacked Bar — Price segments by brand
8. Treemap — Color distribution
9. Heatmap — Correlation matrix
10. Bar Chart — Size popularity
11. Horizontal Bar — Top 10 most expensive shoes

**Key EDA Insights:**
- Puma leads with 33% market share — largest online catalog
- Columbia most premium brand (avg ₹11,164)
- Nike's 104% gender pricing gap — most significant finding
- Mid-Range segment (₹3K–6K) is most competitive with 35% of products
- UK-7 and UK-8 are most available sizes across all brands
- Color data only available for Woodland and Columbia

---

## 📊 Phase 4 — Power BI Dashboard

**Dashboard Features:**
- 🌑 Dark navy theme (background #0D1B3E)
- 📊 4 KPI Cards: Total Shoes, Brands, Avg Price, Max Price
- 🎛️ 4 Dropdown Slicers: Brand, Category, Price Segment, Color
- 📈 6 Charts: Bar, Donut, Pie, Horizontal Bar, Grouped Bar, Column
- 🔗 Many-to-Many relationships for cross-filtering
- ⚡ DAX measure for dynamic price segmentation

---

## 📂 Files Description

| File | Description |
|---|---|
| `Table1 (Final).csv` | Master shoe data — 563 shoes, 6 brands |
| `Table2_Cleaned.csv` | Style codes and color variants |
| `Table3 (final).xls.csv` | Size availability — 3,215 records |
| `SQL_Queries.sql` | All 22 SQL queries with comments |
| `Final_Dashboard.pbix` | Power BI dashboard (requires Power BI Desktop) |

---

## 👤 Author

**Mann Patel**
B.Tech — IT
G H Patel College of Engineering & Technology
CVM University, Vallabh Vidyanagar, Gujarat

---


---

## ⭐ If you found this project helpful, please give it a star!








