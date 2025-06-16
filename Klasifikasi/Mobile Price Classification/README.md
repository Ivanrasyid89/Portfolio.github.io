# Mobile Price Classification
## Overview
This project focuses on building a machine-learning model to classify mobile phones into different price ranges. The primary goal is to accurately predict the price range of a mobile phone based on its specifications. The project involves various stages including data preprocessing, exploratory data analysis (EDA), feature engineering, model building, and evaluation.

## Problem Statement
The smartphone company is highly competitive and pricing strategies play a crucial role in maximizing market share and profitability. Many customers consider price as a significant factor when purchasing a smartphone, and the ability to predict the price range of new models can guide product positioning and marketing strategies. A challenge arises in identifying how a smartphone's technical specifications (e.g., RAM, battery, processor) relate to its price range. By predicting the price range using these specifications, the company can improve targeted strategies for different market segments and offer better-priced products.

## Table of Contents
1. [Project Overview](#overview)
2. [Data](#data)
3. [Data Processing](#data-processing)
4. [Exploratory Data Analysis](#exploratory-data-analysis)
5. [Feature Engineering](#feature-engineering)
6. [Modeling](#modeling)
7. [Model Evaluation](#model-evaluation)
8. [Results](#results).
9. [Conclusion](#conclusion).

## Data
The dataset contains the specifications of mobile phones along with their price range category. It includes the following columns:
- battery_power: Battery power in mAh
- blue: Has Bluetooth or not
- clock_speed: Speed at which microprocessor executes instructions
- dual_sim: Supports dual SIM or not
- fc: Front camera megapixels
- four_g: Has 4G or not
- int_memory: Internal memory in GB
- m_dep: Mobile depth in cm
- mobile_wt: Weight of the mobile phone
- n_cores: Number of cores in processor
- pc: Primary camera megapixels
- px_height: Pixel resolution height
- px_width: Pixel resolution width
- ram: Random access memory in MB
- sc_h: Screen height of the mobile in cm
- sc_w: Screen width of the mobile in cm
- talk_time: Longest time that a single battery charge will last when you are
- three_g: Has 3G or not
- touch_screen: Has touch screen or not
- wifi: Has wifi or not
- price_range: This is the target variable with categories from 0 (low cost) to 3 (very high cost)

## Data Processing
### Data Cleaning
- Checked for missing values
- Handled outliers

## Exploratory Data Analysis
### Distribution of Features
![image](https://github.com/user-attachments/assets/eff82149-8801-4e26-8b4c-a6ac7e6ea623)
![image](https://github.com/user-attachments/assets/fdcacdbe-64d3-484d-9101-20f190ddad63)

### Distribution of Labels
![image](https://github.com/user-attachments/assets/63ad7dba-86c0-42be-9923-e1125c0e83d2)

### Correlation Matrix
![image](https://github.com/user-attachments/assets/da0b2937-06f3-4d63-ad54-deb931dfac5a)

## Feature Engineering
- Normalization: Scaled numerical features to have zero mean and unit variance
- Categorical Encoding: Encoded categorical features using one-hot encoding where applicable

## Modeling
### Model
- Logistic Regression
- Decision Tree
- Random Forest

### Hyperparameter Tuning
- Grid Search CV

## Model Evaluation
### Evaluation Metrics
- Accuracy
- Precision
- Recall
- F1-Score

## Results
| Model                        | Accuracy | Precision | Recall  | F1-Score | ROC AUC Score |
|------------------------------|----------|-----------|---------|----------|---------------|
| Logistic Regression | 0.9725   | 0.9725     | 0.9724   | 0.9724    | 0.9989         |
| Decision Tree      | 0.8425    | 0.8416     | 0.8431   | 0.8422    | 0.9535         |
| Random Forest      | 0.8325    | 0.8261     | 0.8332   | 0.8279    | 0.9556         |

- Based on the comparison of the three model accuracies above. The accuracy of Logistic Regression is higher than Decision Tree and Random Forest.
- Pricing of new products: When a company is about to launch a new product, this model can predict the price range based on its features. This will certainly help the company in making the right decision regarding the smartphone product that it will launch.
- Market Segmentation:  In the product launch process, companies are required to focus on the most dominant features such as “battery_power, px_height, px_width, and ram” in designing their products for different customers. In this case, the company should also consider the target customers such as low-end, middle-end, upper-middle-end, and high-end.

## Conclusion
The Logistic Regression model can be applied to predict the price range of mobile phones with 97.25% accuracy due to its excellent performance. The identification of dominant features can be used as a guideline in product development and pricing strategy. By understanding the important features, companies can make data-driven decisions for product optimization, customer segmentation, and increasing profits.
