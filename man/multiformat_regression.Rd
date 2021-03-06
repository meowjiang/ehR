% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/multiformat_regression.R
\name{multiformat_regression}
\alias{multiformat_regression}
\title{: Format a given list of regression objects for easy presentation.}
\usage{
multiformat_regression(type, formula_list, data, output_file = NA,
  title_list = NA, ndigit = 5, cluster_se_by = NA)
}
\arguments{
\item{type}{character string of regression type, one of: "ols", "logistic" [all equations must be for the same class of regression] (character)}

\item{formula_list}{a list() of character strings specifying regression equations (list of character)}

\item{data}{a data.table (or data.frame) containing (among others,) ALL the regression variables specified in all formulae (data.table)}

\item{output_file}{the file path (with ".csv" extension) to write the results to, if no value provided, no output file will be created (character)}

\item{title_list}{optional list of titles for each regression in the list to write atop output file (blank by default) (list of character)}

\item{ndigit}{level of precision in output, 5 by default (integer)}
}
\value{
matrix containing formatted results from the provided regression list (matrix)
}
\description{
: Given a list of formulae (as strings), type of regression, and data, run listed regressions, return formatted results, & optionally  write to file. OLS, OLS with clustered SE, and logistic regressions currently supported.
}
\examples{
dem_temp <- copy(dem)
dem_temp[, died:=0][!is.na(date_of_death), died:=1]
glm_reg_list <- list("died ~ age", "died ~ age + gender", "died ~ age + gender + race")
multiformat_regression(type = "logistic", formula_list = glm_reg_list, data = dem_temp)

dem_dia <- merge(x = dem, y = dia, by = "empi", all.y = TRUE)
dem_dia[, pt_dia_count := .N, by = "empi"]
pt_dem_dia <- unique(dem_dia, by = "empi")
lm_reg_list <- list("pt_dia_count ~ age", "pt_dia_count ~ age + gender", "pt_dia_count ~ age + gender + race")
multiformat_regression(type = "ols", formula_list = lm_reg_list, data=pt_dem_dia)
}
