# Walmart Sales Analysis

This project explores Walmart sales data across three branchesm three cities and multiple product lines. The analysis includes data cleaning, exploration using mySQL and visualizations using tableau dashboards.

## Problem Statement

Walmart aims to understand key patterns in its sales performance to identify when, where, and among whom business activity is strongest. By analyzing transactional, demographic, and temporal data, this project seeks to uncover insights that can guide data-driven decisions for improving customer engagement, increasing revenue, and optimizing product performance across regions and time periods.

## Dashboard Overview
<img width="1403" height="751" alt="WalmartSales_dashboard" src="https://github.com/user-attachments/assets/339f9a54-7718-43a1-b235-59887b9477ae" />


**Dashboard Insights:**
- Displays customer ratings by **day and time**, revealing that ratings peak on **Mondays and afternoons**.  
- Compares **revenue vs gross income** across **city, gender, and product line**, showing Naypyitaw and female customers contributing more revenue.  
- Highlights **revenue by product line**, with *Food and Beverages* and *Electronic Accessories* performing the best.  
- Shows **monthly revenue trends**, where sales dipped in February but rebounded in March.

---

## Key Insights
- **Top Performing City:** Naypyitaw generated the highest revenue (~110K), indicating stronger customer spending compared to other cities.  
- **Best Branch:** Branch C leads in both revenue and customer satisfaction (average rating 7.06).  
- **Product Line Trends:**  
  - *Electronic accessories* had the highest quantity sold (961), showing strong demand.  
  - *Food and beverages* generated the highest revenue but lower performance scores, suggesting high prices but weaker sales consistency.  
  - *Health and beauty* sold less but had high ratings and good performance, showing customer satisfaction.  
- **Customer Behavior:** Members spent slightly more than non-members, hinting that loyalty programs could be profitable.  
- **Sales Over Time:** January was the most profitable month, while February had the lowest revenue, possibly due to seasonal factors.  
- **Ratings Patterns:** Ratings peak in the **afternoon** and on **Mondays**, suggesting better customer experience at those times.  
- **Balanced Demographics:** Gender and customer type are evenly distributed, ensuring no bias in customer base.

## General Overview
- **Branches:** 3 (A, B, C)  
- **Cities:** Yangon, Naypyitaw, Mandalay  

### Transactions per Branch
| Branch | Transactions |
|--------|--------------|
| A      | 339          |
| B      | 329          |
| C      | 327          |


### Sales per City
| City       | Sales       |
|------------|------------|
| Naypyitaw  | 110,490.78 |
| Yangon     | 105,861.01 |
| Mandalay   | 104,534.61 |

### Average Customer Rating per Branch
| Branch | Avg. Rating |
|--------|------------|
| C      | 7.06       |
| A      | 7.02       |
| B      | 6.79       |

## Product Lines
- Food and beverages  
- Health and beauty  
- Sports and travel  
- Fashion accessories  
- Home and lifestyle  
- Electronic accessories  

### Most & Least Selling Product Lines
| Rank  | Product Line           | Quantity Sold |
|-------|----------------------|---------------|
| Most  | Electronic accessories| 961           |
| Least | Health and beauty     | 844           |

### Revenue by Product Line
| Product Line          | Revenue     |
|----------------------|------------|
| Food and beverages    | 56,144.84 |
| Health and beauty     | 48,854.38 |

### Gross Income per Product Line
| Product Line           | Gross Income |
|-----------------------|-------------|
| Food and beverages     | 2,673.56    |
| Fashion accessories    | 2,585.99    |
| Sports and travel      | 2,568.39    |
| Home and lifestyle     | 2,564.85    |
| Electronic accessories | 2,561.11    |
| Health and beauty      | 2,326.40    |

### Product Line Performance
| Product Line           | Avg Quantity | Performance |
|-----------------------|-------------|------------|
| Food and beverages     | 5.47        | Bad        |
| Health and beauty      | 5.59        | Good       |
| Sports and travel      | 5.53        | Good       |
| Fashion accessories    | 5.07        | Bad        |
| Home and lifestyle     | 5.69        | Good       |
| Electronic accessories | 5.69        | Good       |


## Revenue & Costs by Month
| Month    | Revenue      | COG        |
|---------|-------------|------------|
| January  | 116,291.87 | 110,754.16 |
| February | 95,727.38  | 91,168.93  |
| March    | 108,867.15 | 103,683.00 |


## Branch & City Insights
| Branch | City        | Revenue      |
|--------|------------|-------------|
| B      | Mandalay   | 104,534.61 |
| A      | Yangon     | 105,861.01 |
| C      | Naypyitaw  | 110,490.78 |

### Average Rating by Time of Day (per Branch)
| Branch | Morning | Afternoon | Evening |
|--------|---------|-----------|---------|
| A      | 7.01    | 7.19      | 6.87    |
| B      | 6.84    | 6.81      | 6.75    |
| C      | 6.97    | 7.07      | 7.10    |

### Average Rating by Day of Week
| Day       | Rating  |
|-----------|--------|
| Monday    | 7.13   |
| Friday    | 7.06   |
| Tuesday   | 7.00   |
| Sunday    | 6.99   |
| Saturday  | 6.90   |
| Thursday  | 6.89   |
| Wednesday | 6.76   |

---

## Customer Demographics
- **Customer Type:** Member (499), Normal (496)  
- **Gender:** Male (498), Female (497)  
- **Payment Methods:** Credit card, E-wallet, Cash  

### Customer Type vs Revenue
| Customer Type | Revenue      |
|---------------|-------------|
| Member        | 163,625.10 |
| Normal        | 157,261.29 |


## Business Recommendations

- **Boost Midweek Engagement:**  
  Introduce midweek promotions or loyalty rewards to increase customer activity on slower days (Tuesday–Thursday).

- **Capitalize on Afternoon Sales:**  
  Schedule targeted campaigns and flash sales during peak afternoon hours when satisfaction scores are highest.

- **Target Female Shoppers in Key Cities:**  
  Expand marketing efforts in Mandalay and Naypyitaw, where female shoppers drive strong revenue performance.

- **Grow Underperforming Product Lines:**  
  Offer bundle deals or discounts for Health and Beauty items to increase visibility and sales.

- **Investigate February Drop:**  
  Review marketing calendars, supply chain performance, and pricing strategies to identify causes for the February decline.

- **Enhance Customer Experience:**  
  Maintain quality service standards and feedback mechanisms during high-traffic periods to sustain high satisfaction ratings.

