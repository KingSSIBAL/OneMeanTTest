#' OneMeanDream: Enhanced One-Sample t-Test with Diagnostics
#'
#' Performs one-sample t-tests using Wallace critical value approximation and 
#' Hastings p-value approximation. Includes comprehensive assumption checks 
#' (normality via Shapiro-Wilk, outlier detection) and diagnostic plots.
#'
#' @section Main Functions:
#' \itemize{
#'   \item \code{\link{oneMeanTTest}} - Perform one-sample t-test with diagnostics
#'   \item \code{\link{print.oneMeanTTest}} - Pretty print results
#' }
#'
#' @section Key Features:
#' \itemize{
#'   \item Wallace approximation for critical values
#'   \item 4-term Hastings approximation for p-values
#'   \item Shapiro-Wilk normality test
#'   \item 1.5 * IQR outlier detection
#'   \item Diagnostic plots (Q-Q plot, histogram, boxplot)
#'   \item Detailed interpretation of results
#' }
#'
#' @section Getting Started:
#' Load the package and run a basic test:
#' 
#' \code{library(OneMeanDream)}
#' 
#' \code{# Sample data}
#' \code{set.seed(123)}
#' \code{data <- data.frame(x = rnorm(30, mean = 10, sd = 2))}
#' 
#' \code{# Run test}
#' \code{result <- oneMeanTTest("x", mu = 10, ha = "not equal", alpha = 0.05, data = data)}
#' 
#' \code{# View results}
#' \code{print(result)}
#'
#' @keywords internal
"_PACKAGE"
