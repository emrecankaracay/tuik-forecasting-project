# data_import.R
# This script documents the data access logic used in the main R Markdown notebook.
# The main analysis is performed in forecasting_project.Rmd.

# TÜİK data are accessed by identifying the relevant table through:
# tuikr::statistical_tables("17")
#
# Since statistical_data() returned HTTP 401 Unauthorized, the selected table URL
# was retrieved programmatically in R using httr::GET().
#
# No manually downloaded, manually edited, copy-pasted, or externally prepared
# data file is used in this project.