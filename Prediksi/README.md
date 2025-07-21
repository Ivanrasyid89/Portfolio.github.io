# 🚗 Jakarta Travel Time Prediction #
This project was organized by Yandex Hackathon, where I attended the "Linear Models in Machine Learning: Fundamentals, Applications, and Competition" course at the Digital Talent Development Center. In this project, I used the Python programming language, utilizing Google Colab, to predict travel times in Jakarta.

## 📊 Features Description ##
| Label | Feature Name                   | Description                                                                 |
|-------|--------------------------------|-----------------------------------------------------------------------------|
| X1    | `start_point`, `end_point`     | Districts of Jakarta from which and to which the trip is being made         |
| X2    | `time_of_day`                  | Time of day when the trip starts (e.g., Morning, Afternoon, Evening)        |
| X3    | `day_of_week`                  | Day of the week when the trip occurs (e.g., Monday, Tuesday)                |
| X4    | `traffic_condition`            | Traffic conditions during the trip (e.g., congested, normal)                |
| X5    | `event_count`                  | Number of events occurring near the route                                   |
| X6    | `is_holiday`                   | Whether the trip takes place on a public holiday (1 = Yes, 0 = No)          |
| X7    | `weather`                      | Weather conditions (e.g., Clear, Rainy, Cloudy)                              |
| X8    | `population_density`           | Population density in the districts along the route                         |
| X9    | `vehicle_density`              | Vehicle density in the districts along the route                            |
| X10   | `public_transport_availability`| Availability of public transport along the route                            |
| X11   | `historical_delay_factor`      | Total historical travel delay on the day of the trip                        |
| Y     | `travel_time`                  | ⏱️ Target variable: actual travel time in minutes                           |

## 🔧 Workflow ##
1. Data Preparation
   - Missing Values Check
   - Cleaning Data
2. Exploratory Data Analysis
   - Descriptive Statistics
   - Correlation Analysis
   - Distributions
   - Outlier Detection and Handling
   - ANOVA
   - Post-Hoc Analysis
3. Data Preprocessing
   - Split Data
   - Normalization
   - Label Encoding
4. Modeling
   - Linear Regression
   - Ridge Regression
   - Lasso Regression
   - ElasticNet
   - SGD Regression
5. Prediction

## 📈 Results ##

## 💡 Insights ##
