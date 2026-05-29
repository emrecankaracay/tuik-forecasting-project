# TÜİK Forecasting Project

## 1. Project Overview

This project develops an R-based forecasting analysis using a time series data set obtained from the TÜİK Data Portal. The selected data set is the monthly Export Volume Index from the International Trade category.

The main objective is to forecast the next available monthly period after the latest TÜİK observation by applying and comparing several quantitative forecasting methods.

## 2. Data Source and TÜİK Connection

The data were accessed directly in R. First, the relevant TÜİK table was identified using the `tuikr` package through `tuikr::statistical_tables()`. Since direct access through `statistical_data()` returned an authorization error, the table URL obtained through `tuikr::statistical_tables()` was accessed programmatically in R using `httr::GET()`.

No manually downloaded, manually edited, copy-pasted, or externally prepared data file was used.

- TÜİK data set name: Monthly Volume Indices by Standard International Trade Classification
- TÜİK theme/category: International Trade
- TÜİK table name: Monthly Volume Indices by Standart International Trade Classification
- tuikr dataflow ID: NA - istab table accessed via `tuikr::statistical_tables()` and `httr::GET()`
- Selected variable: Export Volume Index — General
- Data frequency: Monthly
- Time coverage: 2013-01 / 2026-03
- Latest available observation: 2026-03
- Forecast target period: 2026-04
- Date of data access: 2026-05-29
- R package used for data access: `tuikr`
- Package source: https://github.com/emraher/tuikr

## 3. Research Objective

The research objective is to forecast Türkiye’s monthly Export Volume Index — General for the next available period. This variable is meaningful because it reflects changes in Türkiye’s export volume relative to the base year 2015=100.

The selected variable is suitable for forecasting because it is a monthly time series with repeated observations over ordered periods and enough historical data for applying alternative forecasting methods.

## 4. Use of TÜİK Data in R

The TÜİK data were used directly in R. The raw table was accessed programmatically and then cleaned within the R Markdown notebook.

The following R-based adjustments were made:

- The relevant TÜİK theme was selected as International Trade.
- The monthly volume indices table was identified through `tuikr::statistical_tables()`.
- The selected variable was filtered as Export Volume Index — General.
- The year variable was filled downward because the original TÜİK table reports the year once and leaves following monthly rows blank.
- The month variable was used to create a monthly date column.
- The selected series was sorted chronologically.
- Missing values, missing periods, and duplicate periods were checked.
- The cleaned data were transformed into an R time series object with monthly frequency.

## 5. Exploratory Time Series Analysis

The selected series covers the period from 2013-01 to 2026-03 and includes 159 monthly observations.

The data quality checks showed that:

- There are no missing monthly periods.
- There are no duplicate periods.
- There are no missing values in the selected variable.

The actual time series plot suggests that the Export Volume Index has a long-term upward movement with visible monthly fluctuations. Therefore, both trend and seasonality are important to consider in the forecasting stage.

## 6. Forecasting Methods Applied

The following forecasting methods were applied:

- Naïve Forecasting
- Moving Average
- Weighted Moving Average
- Exponential Smoothing
- Trend-Adjusted Exponential Smoothing
- Linear Trend Projection
- Seasonal Indices
- Additive Decomposition
- Multiplicative Decomposition
- Regression with Trend and Seasonal Dummy Variables

Since the selected data are monthly and all index values are positive, seasonal methods and decomposition methods are applicable.

## 7. Forecast Accuracy Comparison

The candidate forecasting methods were compared using the following required measures:

- Bias / Mean Error
- MAD
- MSE
- MAPE
- RSFE
- Tracking Signal
- Next-Period Forecast

The best-performing method based on MAPE was Multiplicative Decomposition.

Main result:

| Method | Bias | MAD | MSE | MAPE | RSFE | Tracking Signal | Next Period Forecast |
|---|---:|---:|---:|---:|---:|---:|---:|
| Multiplicative Decomposition | -0.012 | 8.39 | 132 | 6.88 | -1.96 | -0.234 | 155 |

The full comparison table is available in:

`outputs/tables/accuracy_comparison.csv`

## 8. Selection of the Superior Method

The superior method was selected by considering both numerical accuracy and suitability for the time series structure.

Multiplicative Decomposition was selected as the superior forecasting method because it produced the lowest MAPE among all candidate methods and also had a low tracking signal. This indicates that the model has relatively good forecast accuracy and limited systematic forecast bias.

This method is also suitable for the selected monthly export volume index because the series contains both trend and seasonal fluctuations. Since all index values are positive and seasonal movements may vary proportionally with the level of the series, the multiplicative structure is appropriate for this time series.

## 9. Final Next-Period Forecast

The final forecast was produced using the Multiplicative Decomposition method.

- Selected superior method: Multiplicative Decomposition
- Date of data access: 2026-05-29
- Latest available TÜİK observation: 2026-03
- Forecast target period: 2026-04
- Forecasted value: 155

The final forecast result is also available in:

`outputs/tables/final_forecast.csv`

## 10. Interpretation of Results

The forecasted value of approximately 155 means that the Export Volume Index — General is expected to be around 155 in 2026-04, where the base year 2015 is equal to 100.

This suggests that the export volume level is forecasted to remain above the base year level. However, the result should be interpreted as a short-term statistical forecast based only on the historical export volume index.

## 11. Limitations

This forecasting study has several limitations:

- The analysis uses only historical values of the export volume index.
- External variables such as exchange rates, global demand, energy prices, geopolitical events, and trade policy changes are not included.
- The series may be affected by structural breaks or extraordinary economic shocks.
- TÜİK data may be revised over time.
- Classical forecasting methods may not fully capture complex nonlinear patterns.

## 12. Reproducibility

The project is reproducible from the R Markdown notebook.

To reproduce the analysis:

1. Clone or download this repository.
2. Open `forecasting_project.Rmd` in RStudio.
3. Install the required R packages if necessary.
4. Run or knit the R Markdown file.
5. The output tables and figures will be generated automatically.

Main required packages:

- `tuikr`
- `tidyverse`
- `lubridate`
- `forecast`
- `zoo`
- `httr`
- `readxl`
- `rvest`
- `janitor`
- `ggplot2`
- `scales`

## 13. Repository Structure

```text
tuik-forecasting-project/
│
├── README.md
├── forecasting_project.Rmd
├── forecasting_project.html
├── outputs/
│   ├── tables/
│   │   ├── accuracy_comparison.csv
│   │   └── final_forecast.csv
│   └── figures/
│       ├── actual_series_plot.png
│       ├── naive_forecast_plot.png
│       ├── moving_average_plot.png
│       ├── weighted_moving_average_plot.png
│       ├── exponential_smoothing_plot.png
│       ├── trend_adjusted_smoothing_plot.png
│       ├── trend_projection_plot.png
│       ├── seasonal_indices_plot.png
│       ├── additive_decomposition_plot.png
│       ├── multiplicative_decomposition_plot.png
│       ├── regression_seasonal_dummy_plot.png
│       └── superior_method_plot.png
├── R/
├── renv.lock
└── .gitignore

## 14. Author

- Student name: Emrecan Karaçay
- Student number: 138721516
- Course name: Quantitative Analysis for Decision Making