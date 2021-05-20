
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wCorr

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version-ago/wCorr)](https://www.r-pkg.org/badges/version-ago/wCorr)
[![CRAN
status](https://cranlogs.r-pkg.org/badges/wCorr)](https://cranlogs.r-pkg.org/badges/wCorr)
[![CRAN
status](https://cranlogs.r-pkg.org/badges/grand-total/wCorr)](https://cranlogs.r-pkg.org/badges/grand-total/wCorr)

<!-- badges: end -->

## Overview

The wCorr package can be used to calculate Pearson, Spearman,
polyserial, and polychoric correlations, in weighted or unweighted form.
The package implements the tetrachoric correlation as a specific case of
the polychoric correlation and biserial correlation as a specific case
of the polyserial correlation. When weights are used, the correlation
coefficients are calculated with so called sample weights or inverse
probability weights. Check out the Articles section to learn more about
the methodology used in the wCorr package, read
[here](https://american-institutes-for-research.github.io/wCorr/articles/wCorrFormulas.html)
and the use of applying two Boolean
[switches](https://american-institutes-for-research.github.io/wCorr/articles/wCorrArguments.html).

## Installation

``` r
# You can install the released version of wCorr from CRAN with:
install.packages("wCorr")
# And the development version from GitHub  with:
install.packages("devtools")
devtools::install_github("American-Institutes-for-Research/wCorr")
```
