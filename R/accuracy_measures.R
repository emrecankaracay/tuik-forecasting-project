# accuracy_measures.R
# This script contains the forecast accuracy function used in the main notebook.

calculate_accuracy <- function(actual, forecast, method_name, next_forecast) {
  valid_index <- !is.na(actual) & !is.na(forecast)
  
  actual_valid <- actual[valid_index]
  forecast_valid <- forecast[valid_index]
  
  errors <- actual_valid - forecast_valid
  
  bias <- mean(errors)
  mad <- mean(abs(errors))
  mse <- mean(errors^2)
  mape <- mean(abs(errors / actual_valid)) * 100
  rsfe <- sum(errors)
  tracking_signal <- ifelse(mad == 0, NA, rsfe / mad)
  
  tibble::tibble(
    Method = method_name,
    Bias = bias,
    MAD = mad,
    MSE = mse,
    MAPE = mape,
    RSFE = rsfe,
    Tracking_Signal = tracking_signal,
    Next_Period_Forecast = as.numeric(next_forecast)
  )
}