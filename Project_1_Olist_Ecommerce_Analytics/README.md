# Olist E-Commerce Logistics Performance Analysis

## 📌 Business Problem

On major e-commerce platforms like Olist (Brazil), logistics is the lifeblood of operations—but it's also the primary source of friction that erodes customer satisfaction. Olist is facing declining review scores and volatile order cancellation rates without clear visibility into root causes.

As a Data Analyst, the challenge is to extract actionable insights from 100,000+ raw order records to answer critical business questions:

- **Customer tolerance threshold:** How many days of delivery delay cause review scores to completely collapse?
- **Cancellation ownership:** Are cancellations primarily driven by sellers' stock issues or by shipping partner failures?
- **Operational blind spots:** Which geographic regions suffer the "double impact" of high shipping costs and excessive delivery times?
- **Category risk exposure:** Which product categories are most prone to logistics failures and negative reviews?

---
## 🔍 Key Findings

| Finding | Business Impact |
| --- | --- |
| **R$ 1.359M in total revenue** was recorded across 99,224 orders, maintaining a stable platform-wide average review score of **4.09 stars**. | Establishes a solid baseline KPI framework to serve as a standard benchmark for all future growth campaigns and cost optimization strategies. |
| **70.07% of cancelled orders** on the system fall into the "Extremely Slow Preparation" category, taking **over 5 days** for sellers to finish packing items. | Confirms that the biggest operational bottleneck slowing down delivery times lies within the **Sellers'** internal processing, not the couriers' transit capacity. |
| The **"Approved - Not yet handed to shipper"** stage is the largest failure point in the operational funnel, with **409 orders canceled** here. | Customers actively cancel orders due to a loss of patience when storefronts hold orders for too long; the platform must enforce strict penalties if sellers fail to hand over goods to couriers within 48 hours. |
| The **`pc_gamer` category suffers the highest operational risk** across the platform, with a cancellation rate of **~11.1%**. | This high-value tech product segment faces severe issues with inventory management or supply chain; category managers must immediately audit the fulfillment capacity of major warehouses handling this group. |
| Review scores **freefall from ~4.3 stars** (on-time) **to ~3.2 stars** (with only a 1-2 day delay) and hit an absolute bottom of **~1.7 stars** (delayed over 7 days). | Customers are extremely sensitive to delays; the business needs to trigger an automated apology workflow paired with discount vouchers right from the first day of delay to halt the influx of 1-star reviews. |
| **São Paulo (SP)** achieves the fastest delivery (**~8 days**) with the cheapest shipping fee (**R$15**), while **Roraima (RR)** records a historic delay (**~28 days**) with a shipping fee 3 times more expensive (**R$44**). | Regional logistics inequity is suffocating market expansion in the North; the business must establish localized satellite warehouses (Fulfillment Centers) in this low-performing region to pre-stock top-selling products. |

---

## 📊 Power BI Dashboard
The Power BI dashboard includes the following interactive visuals:
| Page | Focus | Key Visuals |
|------|-------|-------------|
| 1 — Executive Summary |	Operational health & growth trends |	Slicers, KPI Cards (Revenue/Orders/Delivery rate), Line Chart (Trends), Donut Chart (Order status)
| 2 — Operation & Cancellation |	Operational risks & cancellation rate analysis |	Donut Chart (Fulfillment speed), Funnel Chart (Cancellation stages), Bar Chart (Top 5 high-risk categories)
| 3 — Customer Satisfaction |	Impact of delivery delays on satisfaction score |	KPI Cards (Negative review count), Combo Chart (Correlation between delay segments and average review score)
| 4 — Geographic Analysis |	Hunting for logistics outliers |	Scatter Plot (4-quadrant analysis of delivery days vs. shipping cost by State)

---
## 📁 Repository Structure

```
Project_1_Olist_Ecommerce_Analytics/
│
├── 📁 data/
│   ├── raw/                 # Original Olist CSV files (9 tables)
│   │   ├── olist_customers_dataset.csv
│   │   ├── olist_geolocation_dataset.csv
│   │   ├── olist_order_items_dataset.csv
│   │   ├── olist_order_payments_dataset.csv
│   │   ├── olist_order_reviews_dataset.csv
│   │   ├── olist_orders_dataset.csv
│   │   ├── olist_products_dataset.csv
│   │   ├── olist_sellers_dataset.csv
│   │   └── product_category_name_translation.csv
│   │
│   └── processed/                               # Transformed data from SQL
│       ├── delivery_performance_&_satisfaction.csv
│       ├── seller_processing_&_cancellations.csv
│       ├── cancellation_reasons_analysis.csv
│       └── geographical_shipping_&_delivery_trends.csv
│
├── 📁 sql/
│   ├── delivery_performance_&_satisfaction.sql
│   ├── seller_processing_&_cancellations.sql
│   ├── cancellation_reasons_analysis.sql
│   └── geographical_shipping_&_delivery_trends.sql
│
├── 📁 dashboard/
│   └── olist_delivery_performance_eda.pbix
│
├── 📄 README.md
├── 📄 requirements.txt
└── 📄 .gitignore
```

---

## 🛠️ Tech Stack

| Layer | Technology | Purpose |
|-------|------------|---------|
| **Data Processing** | Python (pandas, numpy, polars) | Data cleaning, ETL, transformation |
| **Database** | MySQL | Data warehousing, querying |
| **Visualization** | Power BI Desktop | Interactive dashboards, reporting |
| **Version Control** | Git + GitHub | Code management, collaboration |


---

## 📝 Key Recommendations

Based on the analysis findings:

1. **Set Delivery SLA Threshold:** Implement strict SLAs with shippers to ensure <3-day delivery window, especially for sensitive categories
2. **Seller Inventory Monitoring:** Develop real-time alerts for sellers whose "Approved - Not Yet Available" rate exceeds 10% — intervene with inventory support or temporary delisting
3. **Regional Logistics Strategy:**
   - **Northern states (AC, AM, AP, RR):** Partner with local last-mile providers, consider regional fulfillment centers
   - **High-density states (SP, MG, RJ):** Optimize routing algorithms, increase fleet capacity during peak seasons
4. **Category Risk Mitigation:** For high-risk categories (DVDs, Construction Tools, Kitchen Electronics), implement mandatory "Seller Inventory Confirmation" step before order approval
5. **Review Monitoring Dashboard:** Establish automated weekly alerts when average review score drops below 4.0 in any region/category

