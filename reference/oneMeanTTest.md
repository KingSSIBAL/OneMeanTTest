# One-Sample t-Test with Wallace Critical Values and Hastings P-Values

Performs a comprehensive one-sample t-test using Wallace approximation
for critical values and 4-term Hastings approximation for p-values.
Includes normality testing, outlier detection, and diagnostic plots
(histogram, Q-Q plot, boxplot).

## Usage

``` r
oneMeanTTest(x, mu, ha, alpha, data, plot = TRUE)
```

## Arguments

- x:

  Character string. Name of the numeric column in `data` to test.

- mu:

  Numeric. Hypothesized population mean under the null hypothesis (H0:
  mu = mu0).

- ha:

  Character string. Alternative hypothesis. One of "less" (H1: mu \<
  mu0), "greater" (H1: mu \> mu0), or "not equal" (H1: mu != mu0).

- alpha:

  Numeric. Significance level (0 \< alpha \< 1). Must be explicitly
  provided.

- data:

  Data frame containing the column specified in `x`.

- plot:

  Logical. If TRUE (default), display diagnostic plots: Q-Q plot,
  histogram with normal curve, and boxplot.

## Value

List of class "oneMeanTTest" containing these fields:

- variable: Tested variable name

- n: Sample size (after removing NAs)

- sample_mean: Sample mean

- sample_sd: Sample standard deviation

- t_statistic: t-test statistic

- p_value: Hastings p-value

- confidence_interval: Confidence bounds

- decision: "REJECT" or "FAIL TO REJECT"

- is_normal: Normality assumption met?

- outliers: Detected outliers

## Details

Critical values use Wallace approximation: \$\$t\_\alpha = \sqrt{\nu
(\exp(c \cdot z\_\alpha^2 / \nu) - 1)}\$\$ where \\c =
((8\nu+3)/(8\nu+1))^2\\ and \\\nu = n-1\\.

P-values use 4-term Hastings approximation for computational efficiency.

## Assumptions

1.  Normality (Shapiro-Wilk test, p \> alpha)

2.  No outliers (1.5 \* IQR rule)

## Examples

``` r
# Example 1: Earnings data (suspected to be below $75k)
set.seed(181)
earnings_data <- data.frame(
  Earnings = round(rnorm(50, mean = 65, sd = 20), 0)
)
result <- oneMeanTTest("Earnings", mu = 75, ha = "less", 
                       alpha = 0.05, data = earnings_data)

print(result)
#> 
#>     One-Sample t-test
#> ------------------------------------------------------
#> Variable:    Earnings 
#> n:           50 
#> Mean:        65.82 
#> SD:          21.5792 
#> ------------------------------------------------------
#> Null Hyp:    mu = 75 
#> Alt Hyp:     mu < 75 
#> ------------------------------------------------------
#> ASSUMPTION CHECKS:
#> 1. Normality (Shapiro-Wilk): SATISFIED (p = 0.905 )
#> 2. Outliers (1.5 IQR Rule):  SATISFIED (0 outliers detected)
#> ------------------------------------------------------
#> t-stat:      -3.0081 
#> df:          49 
#> Crit Val:    -1.6765 
#> P-value:     0.001543 
#> ------------------------------------------------------
#> 95% CI:      [ -Inf ,  70.9364 ]
#> Decision:    REJECT the null hypothesis (Ho) 
#> 
#> Interpretation:
#> At alpha = 0.05, we REJECT the null hypothesis (Ho). The sample mean (65.82) is significantly less than 75.
#> We are 95% confident that the true population mean is less than 70.9364. 
#> 

# Example 2: Test scores (check if above 70)
set.seed(456)
scores <- data.frame(
  Score = round(runif(40, min = 50, max = 95), 1)
)
oneMeanTTest("Score", mu = 70, ha = "greater", 
             alpha = 0.05, data = scores, plot = FALSE)
#> 
#>     One-Sample t-test
#> ------------------------------------------------------
#> Variable:    Score 
#> n:           40 
#> Mean:        75.9425 
#> SD:          13.29 
#> ------------------------------------------------------
#> Null Hyp:    mu = 70 
#> Alt Hyp:     mu > 70 
#> ------------------------------------------------------
#> ASSUMPTION CHECKS:
#> 1. Normality (Shapiro-Wilk): NOT SATISFIED (p = 0.00915 ) - Consider Wilcoxon Test
#> 2. Outliers (1.5 IQR Rule):  SATISFIED (0 outliers detected)
#> ------------------------------------------------------
#> t-stat:      2.828 
#> df:          39 
#> Crit Val:    1.6849 
#> P-value:     0.00257 
#> ------------------------------------------------------
#> 95% CI:      [ 72.402 ,  Inf ]
#> Decision:    REJECT the null hypothesis (Ho) 
#> 
#> Interpretation:
#> At alpha = 0.05, we REJECT the null hypothesis (Ho). The sample mean (75.9425) is significantly greater than 70.
#> We are 95% confident that the true population mean is greater than 72.402. 
#> 

# Example 3: Temperature readings (two-tailed test)
temp_data <- data.frame(
  Temperature = c(98.2, 98.6, 97.8, 99.1, 98.4, 98.7, 97.9, 
                  98.5, 98.3, 98.8, 98.1, 98.6)
)
oneMeanTTest("Temperature", mu = 98.6, ha = "not equal", 
             alpha = 0.05, data = temp_data)

#> 
#>     One-Sample t-test
#> ------------------------------------------------------
#> Variable:    Temperature 
#> n:           12 
#> Mean:        98.4167 
#> SD:          0.3786 
#> ------------------------------------------------------
#> Null Hyp:    mu = 98.6 
#> Alt Hyp:     mu != 98.6 
#> ------------------------------------------------------
#> ASSUMPTION CHECKS:
#> 1. Normality (Shapiro-Wilk): SATISFIED (p = 0.996 )
#> 2. Outliers (1.5 IQR Rule):  SATISFIED (0 outliers detected)
#> ------------------------------------------------------
#> t-stat:      -1.6775 
#> df:          11 
#> Crit Val:    2.2016 
#> P-value:     0.09305 
#> ------------------------------------------------------
#> 95% CI:      [ 98.176 ,  98.6573 ]
#> Decision:    FAIL TO REJECT the null hypothesis (Ho) 
#> 
#> Interpretation:
#> At alpha = 0.05, we FAIL TO REJECT the null hypothesis (Ho). The sample mean (98.4167) is not significantly not equal to 98.6.
#> We are 95% confident that the true population mean is between 98.176 and 98.6573. 
#> 
```
