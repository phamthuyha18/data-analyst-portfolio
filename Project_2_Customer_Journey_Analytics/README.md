# E-Learning Platform Funnel & User Behavior Analysis

## Executive Summary

Across digital platforms, user conversion across the sales funnel is the primary growth driver—yet it is currently where revenue potential is continuously eroded. The platform faces a overall funnel drop-off rate of 79.8%, with only 1,010 completed purchases out of 5,000 initial homepage sessions.
  **Analytical Scope:** Diagnostic evaluation of 12,000+ raw session records (12,719 total sessions, 1,872 unique users) to identify UI/UX, behavioral, and marketing root causes driving funnel leakage.
  **Core Diagnosis:**
  - Funnel losses are heavily concentrated in the transition from Product Page to Cart (losing $2,388$ sessions / $59.89\%$ step drop-off).
  - On-page dwell times between converting ($97.0\text{s}$) and non-converting ($98.1\text{s}$) users are virtually identical, proving that surface-level UI/UX or technical bugs are not the primary issue. Conversion barriers are commercial/value-based.
  - Adding the first item to the cart yields a +20 percentage-point surge in purchase rate ($33\% \rightarrow 53\%$), confirming that initial cart activation is the single most critical leverage point.

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

## Deep-dive findings & insights

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
| Email | 20.06% | Warm Audience: Existing subscribers or retained customers familiar with the brand value proposition. | Highly stable channel; ideal for cross-selling and promotional campaigns. |
| Direct | 19.82% | Brand Aware: Organic visitors type URL directly or use bookmarks; serves as the organic baseline. | Reflects core brand equity and organic conversion momentum. |
| Social Media | 19.23% (Lowest) | Low Intent / Impulse: Discovery-based traffic with higher passive browsing and lower purchase readiness. | Targeting Audit Needed: Requires audience pre-qualification or dedicated social landing pages to reduce churn.|


**Section 4: Cart Size vs. Purchase Conversion Rate Analysis**

  - Evaluate the correlation between the number of items added to the cart and the purchase conversion rate (Purchased Rate %) to identify basket-building dynamics and conversion triggers.
  - The data reveals that the primary funnel leak occurs among users with zero items in their cart, representing 1,872 users with the lowest purchase rate of 33%. However, adding the first item triggers a +20 percentage-point surge in purchase rate (jumping to 53%), which remains consistently high across 1 to 5 items (49%–54%). This confirms that the platform's core conversion barrier lies in activating the initial "Add to Cart" (ATC) action rather than multi-item basket hesitation.

| Cart Item Count |	User Volume | Purchased Rate (%) |
|-----------------|-------------|--------------------|
|0	| 1,872 (42.3% of total) |	33% (Lowest) |
|1 |	490 |	53%	| 
|2 |	492 |	49%	|
|3 |	562 |	54% (Peak) |	
|4 |	491 |	50%	|
|5 |	472 |	49% |

---

## Power BI Dashboard

The interactive Power BI visual report is structured into five core analytical sections:

  **1. KPI Overview Header:** Highlights high-level performance metrics, including Total Sessions (12,719), Total Unique Users (1,872), and the Overall Funnel Conversion Rate (20.2%).

  **2. Funnel Volume & Retention Panel:** Features a Funnel Chart tracking absolute session counts across journey stages (Home: 5,000 → Product Page: 3,987 → Cart: 1,599 → Checkout: 1,123 → Confirmation: 1,010) paired with a Horizontal Bar Chart measuring cumulative retention percentages (100.00% → 79.74% → 31.98% → 22.46% → 20.20%).

  **3. On-Page Engagement Analysis:** Employs a Clustered Bar Chart comparing engagement duration between Retained users (97.0s) and Dropped-off users (98.1s) to evaluate user decision friction.

  **4. Cart Size & Conversion Correlation:** Utilizes a Line and Clustered Column Chart to analyze user volume distribution across item quantities alongside corresponding purchase conversion rates (peaking at 49%–54% for 1–3 cart items).

**5. Marketing Channel Breakdown:** Provides a performance panel detailing conversion rates across acquisition sources (Google: 21.64%, Email: 20.06%, Direct: 19.82%, Social Media: 19.23%).

---

## Tech Stack

| Layer | Technology | Purpose |
|-------|------------|---------|
| **Data Processing** | Python (pandas), SPSS | Data cleaning, Chi-square |
| **Database** | MySQL | Data warehousing, querying |
| **Visualization** | Power BI Desktop | Interactive dashboards, reporting |
| **Version Control** | Git + GitHub | Code management, collaboration |


---

## Strategic Recommendations & Action Plan
1. Short-Term Quick Wins (1–2 Weeks)
   - First-Item ATC Optimization: Prominently position sticky "Add to Cart" CTAs on mobile views and enable one-click "Quick Add" options on listing pages to cross the $0 \rightarrow 1$ item conversion threshold.
   - Social Proof Integration: Embed user ratings, customer reviews, and trust badges directly adjacent to product pricing on PDPs to reduce evaluation hesitation.
   - Pricing & Fee Transparency: Display shipping estimates and discounts upfront on the product page to eliminate unexpected costs during cart addition.
2. Medium-to-Long Term Initiatives
   - Marketing Budget Reallocation: Shift incremental advertising spend toward high-intent acquisition channels (Google Ads) while auditing ad copy and audience targeting on lower-performing channels (Social Media).
   - Automated Post-ATC Cross-Selling: Deploy dynamic "Frequently Bought Together" recommendation widgets post-ATC, leveraging the stable ~50% conversion plateau across multi-item baskets ($2\text{--}5$ items).
