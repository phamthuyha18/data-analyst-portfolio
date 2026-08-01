# 📊 E-Learning Platform Funnel & User Behavior Analysis

## 📌 Executive Summary

On major e-commerce platforms, user conversion across the sales funnel is the lifeblood of business growth—but it is also the primary source of friction where revenue potential is continuously eroded. The platform is currently facing a high overall funnel drop-off rate of nearly 80%, with only 1,010 completed purchases out of 5,000 initial home sessions, leaving leadership without clear visibility into the specific UI/UX and behavioral root causes.

As a Data Analyst, the challenge is to extract actionable insights from 12,000+ raw session records to answer critical business questions:
* **Primary bottleneck location:** Which specific funnel transition accounts for the overwhelming majority of lost sessions and abandoned intent?
* **On-page decision friction:** Does the high churn on the product page stem from a lack of user interest or from friction encountered during the evaluation process?
* **Engagement behavior paradox:** How does engagement time on product pages differ between users who successfully add to cart versus those who drop off?
* **Traffic acquisition quality:** Are funnel losses primarily driven by low-quality targeting across marketing channels or by systemic product page UI/UX failures?

---

## Business Framing
| Funnel Stage | Session Count | Conversion Rate (%) | Drop-off Rate (%) |
|--------------|---------------|---------------------|-------------------|
| **home** | 5000 | 100.0 | 0.0 |
| **product_page** | 3987 | 79.7 | 20.3 |
| **cart** | 1599 | 32.0 | 68.0 |
| **checkout** | 1123 | 22.5 | 77.5 |
| **confirmation** | 1010 | 20.2 | 79.8 |

---

## 💡 Deep-dive findings & insights

**Section 1: Primary funnel bottleneck location**

- Out of 3,987 product_page sessions, only 1,599 reached cart—losing 2,388 sessions (59.89% drop-off rate at this single step). The transition from Product Page to Cart represents the single largest conversion leak across the entire funnel.

- This represents a critical revenue leakage point. Resolving the Product Page-to-Cart transition provides the single highest ROI potential for overall revenue recovery and will yield the most immediate, substantial growth in completed orders across the platform.


**Section 2: On-Page Decision Friction Analysis**
| Group | Avg time on product page |
|-------|--------------------------|
| Retained Group | 97.0 |
| Dropped-off | 98.1 |

  - Dropped-off users spent 98.10 seconds on page, slightly longer than the dwell time of retained users (97.00 seconds) - a variance of merely 1.1 seconds. The nearly identical dwell time indicates that dropped-off users consume page content, evaluate product information, and navigate the interface in virtually the exact same manner as converting users.

  - Non-converting users spend over 1.5 minutes exploring the page without exhibiting early bounces or exit frustration, surface-level UI/UX failures or technical site errors are **NOT the primary driver of low conversion.**

  - **The barrier to conversion is value-based rather than usability-based.** The high drop-off rate stems from commercial friction and decision hesitation—such as uncompetitive pricing, lack of compelling value propositions, missing social proof (reviews/ratings), or unexpected post-evaluation costs (e.g., shipping fees)—rather than interface usability issues.

**Section 3: Statistical Independence Testing (Chi-Square Analysis)**
  - To evaluate whether user purchase completion (purchase_flag) is statistically dependent on acquisition channel (Referral Source) or user platform (Device Type), a Chi-Square Test of Independence ($\chi^2$) was performed.

| Categorical Variable | Chi-square Test Result | Statistical Conclusion |
|----------------------|------------------------|------------------------|
|Referral Source | 0.02 | Have significant association: User intent, audience targeting quality, or traffic composition varies meaningfully across referral sources, directly impacting conversion likelihood. |
|Device Type | 0.9 | No Significant Association: Purchase completion rate is statistically uniform across hardware platforms. |

  - Granular Channel Performance Analysis:
| Marketing Channel | Conversion Rate (%) | Traffic Intent & Behavioral Characteristics | Strategic Positioning |
|-------------------|---------------------|---------------------------------------------|-----------------------|
| Google | 21.64% (Highest) | High Intent: Users actively searching for specific solutions/products; high readiness to buy. | Prime candidate for increased ad spend scaling due to superior conversion efficiency. |
| Email | 20.06% | Warm Audience: Existing subscribers or retained customers familiar with the brand value proposition. | Highly stable channel; ideal for cross-selling and promotional campaigns.
| Direct | 19.82% | Brand Aware: Organic visitors type URL directly or use bookmarks; serves as the organic baseline. | Reflects core brand equity and organic conversion momentum.
| Social Media | 19.23% (Lowest) | Low Intent / Impulse: Discovery-based traffic with higher passive browsing and lower purchase readiness. | Targeting Audit Needed: Requires audience pre-qualification or dedicated social landing pages to reduce churn.|


---

## 🖥️ Power BI Dashboard

The interactive Power BI visual report is structured into four core analytical panels:

1. **KPI Header Cards:** Highlights top-level performance indicators, including **Total Sessions (12,719)**, **Total Unique Users (1,872)**, and **Overall Conversion Rate (20.2%)**.
2. **User Count per Funnel Stage (Funnel Chart):** Tracks step-by-step session retention (*Home: 5,000 → Product Page: 3,987 → Cart: 1,599 → Checkout: 1,123 → Confirmation: 1,010*).
3. **Drop-off Rate (Horizontal Bar Chart):** Measures cumulative retention percentages at each funnel phase (*Home: 100.00% → Product Page: 79.74% → Cart: 31.98% → Checkout: 22.46% → Confirmation: 20.20%*).
4. **Time on Page & Channel Performance:** Side-by-side comparative analysis of engagement time between Retained vs. Dropped-off users, accompanied by conversion rate breakdowns per marketing channel.

---

## 🛠️ Tech Stack

| Layer | Technology | Purpose |
|-------|------------|---------|
| **Data Processing** | Python (pandas, numpy, polars) | Data cleaning, ETL, transformation |
| **Database** | MySQL | Data warehousing, querying |
| **Visualization** | Power BI Desktop | Interactive dashboards, reporting |
| **Version Control** | Git + GitHub | Code management, collaboration |


---

## 🚀 Key Recommendations

1. **Optimize Product Page UI/UX (High Priority):**
   * Implement a sticky, high-contrast **"Add to Cart"** button visible across mobile and desktop interfaces to lower conversion friction within the ~97-second window.
   * Add social proof elements (e.g., ratings, reviews, badges) and clarify pricing structures above the fold to capture purchase intent quickly.
2. **Streamline Secondary Drop-off Points (Medium Priority):**
   * Address the secondary drop-off during the **Cart → Checkout** stage (29.8% churn rate) by introducing dynamic cart drawers and guest checkout options.
3. **Scale Successful Traffic Channels:**
   * Maintain current ad spend on top-performing acquisition channels (**Google** at 21.64% CR) while testing customized onboarding landing pages for **Social Media** traffic.
