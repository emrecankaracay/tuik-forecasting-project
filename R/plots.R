# plots.R
# This script contains the plot helper function used in the main notebook.

plot_actual_vs_forecast <- function(data, forecast_column, title, file_name) {
  plot_data <- data |>
    dplyr::select(date, actual = export_volume_index, forecast = dplyr::all_of(forecast_column)) |>
    tidyr::pivot_longer(
      cols = c(actual, forecast),
      names_to = "Series",
      values_to = "Value"
    )
  
  p <- ggplot2::ggplot(plot_data, ggplot2::aes(x = date, y = Value, linetype = Series)) +
    ggplot2::geom_line(linewidth = 0.8, na.rm = TRUE) +
    ggplot2::labs(
      title = title,
      x = "Date",
      y = "Export Volume Index (2015=100)",
      linetype = "Series"
    ) +
    ggplot2::theme_minimal()
  
  print(p)
  
  ggplot2::ggsave(
    filename = paste0("outputs/figures/", file_name),
    plot = p,
    width = 10,
    height = 6,
    dpi = 300
  )
}