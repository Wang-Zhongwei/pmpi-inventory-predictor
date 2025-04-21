# Marketplace Product Inventory Prediction
A data science project analyzing dairy product sales data from India to predict out-of-stock situations and optimize pricing strategies.

## Background
This dataset provides a large dataframe containing data on the sale of different kinds of dairy products from different factory suppliers (Brand) from different farms and different states across several years in India.  It includes information on the stock before and after the sale, the minimum reorder threshold, how much was ordered, the price per unit, total revenue from the order, date of the order, expiration date of the product, date the product was produced, and more. 
The dairy industry faces fluctuating demand throughout the year due to various factors. Out-of-stock (OOS) situations can significantly impact both suppliers and consumers. By analyzing year seasonality, price elasticity, and factory capacity, we aim to develop predictive models that can help optimize inventory management and pricing strategies.

## Problem Statement
Liters of milk sold fluctuate throughout the year for various reasons in India. In order to reduce the possibility of Out-Of-Stock (OOS) situations, we would like to explore forecasting future liters sold. We would examine the year seasonality, price elasticity, and factory capacity (Brand) for milk suppliers only. 

Seasonality is defined by holidays, consumer purchasing trends, and outlier fluctuations in the sale quantity (goods) by date sold. Price elasticity is a microeconomic term defining the optimal price range of a certain good. Too high a price and fewer consumers will want to purchase the product, ultimately reducing revenue. Too low a price and more consumers will purchase, risking OOS events and possibly reduced revenue again. The goal is a “sweet spot” price range to reduce OOS events and optimal revenue to create longevity in the market year over year.

For reference to price elasticity:

![formula-for-price-elasticity-of-demand](https://github.com/user-attachments/assets/4ab03ab2-d919-46ee-8218-83581bf14530)

We can view when the dairy supply is expected to decrease to a concerning level, at which price may be too high to show consistent demand, and how to stabilize the supply chain when considering shelf life and its various forms. We will create models to simulate these parameters, which would be best to suggest the best case scenario and the range of controls they need to stay within to create a stable supply of milk and avoid OOS. 


## Objectives
- Predict future sales quantities to prevent Out-of-Stock situations
- Determine optimal price points through price elasticity analysis
- Analyze seasonal patterns and their impact on sales

## KPIs
Success is defined as models that predict future sales and the optimal price point (price elasticity value). We can observe different states, brands, and products' future sales. We will create a time series plot of quantity sold with descriptions of the last few years' data. Ideally, we are aiming to initially produce a baseline model and then develop another model that is an improvement on it.

To quantify this, we’ll use MAPE (Mean Absolute Percentage Error).  This is a relative error measure that uses absolute values in calculating the percentages (such that positive and negative differences are treated the same and do not cancel).  Smaller MAPE is ideal when comparing with the actual sales, and we’ll find the MAPE for our different models when tested on the testing set. To improve the MAPE (hence, the improvement of the corresponding models) we want to narrow down what features we might want to focus on so that we have a starting point for future feature selection processes.


## Stakeholders
From a business standpoint, if our client were in the dairy business industry, their main concern would be creating a consistent supply chain to avoid OOS and identifying main points of weakness in their chain (example, seasonal high points of sales demand, price elasticity(which price is too high vs too low), max amount of revenue they can achieve, total profit vs how much loss money was incurred, etc.

More specifically, we might want to inform our clients (those in the dairy industry) on how the quantity sold (for milk) might change over time.  Clients would thus naturally be able to shift their production (or production approach at the very least) to accommodate the predicted amount they might be selling.  This, combined with the price elasticity calculations that come along with it, would certainly help our clients both maximize their profits while simultaneously more accurately predicting future inventory demands.

## Project Setup

## Data
The dataset includes information on:
- Multiple dairy products (focusing on milk)
- Various brands (Amul, Mother Dairy, Raj, Sudha)
- Different sales channels (Retail, Wholesale)
- Production and expiration dates
- Price points and quantities
- Storage conditions
- Farm sizes

## Approach

### Predictive Modeling Performance
- Feature Selection and Engineering:
  - Core features: price metrics, inventory levels, operational parameters
  - Created binary encodings for categorical variables
  - Generated temporal features from production dates
- Model Development:
  - Implemented XGBoost regression with optimized parameters
  - Used 80/20 train-test split
  - Evaluated performance using MAPE
- Time Series Analysis:
  - Analyzed monthly sales patterns
  - Compared model predictions against naive forecasts
  - Visualized historical vs predicted trends by brand

## Results

### Seasonality analysis
![seasonalityanalysis ](https://github.com/user-attachments/assets/df00156c-702a-4111-936a-c591ba748715)


### Price Elasticity Analysis
We conducted price elasticity calculations to determine the optimal price milk producers should sell their liters of milk. This calculation was based on the price elasticity calculation, looking at monthly sales and the average price sold during that month. The price elasticity results showed that for Amul, the price elasticity was inelastic (<1 value), meaning that no matter the price sold the customers will still purchase the milk in similar quantities. Mother Dairy, Raj, and Sudha had elastic results, with optimal price in Rupees between ₹40-60 (INR), depending on the results below. 

![price elasticity ](https://github.com/user-attachments/assets/626e44a7-6717-4c11-a824-911d779ad8f8)


### Predictive Modeling Performance
We constructed two sets of features based on the numerical columns in our milk data. Lag features, which capture the temporal correlation between adjacent months. Rolling features, which capture the seasonality of milk sales. We then implemented three different models. Classical linear regression, which may have high bias and low variance.The  XGBoost model, which has more predictors and should capture more features. Baseline, which is simply using data from last year as predictions for this year. We use the first ~3 years of data as our training set and the last 6 months as our testing set. According to our MAPE metric, linear regression (41.11%) outperforms the baseline (48.61%) by a few percent. The XGBoost results are not ideal (64.92%), but we see it does have peaks and troughs more in line with actual sales. It is more adaptable and shows future room for improvement. 
![milkforecast](https://github.com/user-attachments/assets/a5b601f7-a10c-485c-a920-fd05c2b618b6)


### Conclusions and Future Implications
We found through our analysis that price elasticity varies significantly by brand. When reviewing our models, we found that while the standard linear regression model had the best MAPE, XGBoost had the best adaptability. This encourages us to dive deeper into feature engineering. Our current modeling is mainly based on numerical features, which are easier to use in machine learning models. However, our dataset also contains multiple categorical features, which may shed additional light on our predictive modeling. As a preparation for our future work, we have constructed producer location, customer location, product type, brand, sales channel, as binary features. We look forward to including them and seeing whether they improve XGBoost predictions. We aim to further delve into the analysis of holiday and special event impacts. 

## Refrences
- [Dairy Goods Sales Dataset](https://www.kaggle.com/datasets/suraj520/dairy-goods-sales-dataset)
- [Milk Production by States/UTs | nddb.coop](https://www.nddb.coop/information/stats/milkprodstate) 
- [Price Elasticity - Definition, Formulas, Type of Demand](https://corporatefinanceinstitute.com/resources/economics/price-elasticity/)


## Team Members
This project is being developed for 2025 Spring Erdös Institute Data Science Boot Camp by:

- Kaili Cao
- Mary Reith
- Reggie Bain
- Tate Poole
- Zhongwei Wang

