
<!-- README.md is generated from README.Rmd. Please edit that file -->

# semaforos

<!-- badges: start -->

[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![R-CMD-check](https://github.com/Bisaloo/semaforos/workflows/R-CMD-check/badge.svg)](https://github.com/Bisaloo/semaforos/actions)
<!-- badges: end -->

The semaforos R package provides easy access to historical data of
[**Semáforos Epidemiológicos**, which are part of the COVID-19 response
strategy of Mexico](https://coronavirus.gob.mx/semaforo/). The semáforos
define 4 levels of alert at the state level and are re-evaluated weekly.

![Explanation of the different
levels](man/figures/semaforos_explanation.png)

## Installation

You can install the development version of semaforos from GitHub:

``` r
remotes::install_github("Bisaloo/semaforos")
```

## Usage

``` r
library(semaforos)
```

``` r
sw <- semaforos_get(format = "wide")
head(sw)
#>                estado 2020-W22 2020-W23 2020-W24 2020-W25 2020-W26 2020-W27
#> 1      Aguascalientes     rojo     rojo  naranja  naranja  naranja  naranja
#> 2     Baja California     rojo     rojo     rojo     rojo     rojo     rojo
#> 3 Baja California Sur     rojo     rojo  naranja  naranja  naranja  naranja
#> 4            Campeche     rojo     rojo  naranja  naranja  naranja  naranja
#> 5             Chiapas     rojo     rojo     rojo     rojo  naranja     rojo
#> 6           Chihuahua     rojo     rojo  naranja  naranja  naranja  naranja
#>   2020-W28 2020-W29 2020-W30 2020-W31 2020-W32 2020-W33 2020-W34 2020-W35
#> 1  naranja  naranja  naranja  naranja  naranja     rojo     rojo  naranja
#> 2     rojo  naranja  naranja  naranja  naranja  naranja  naranja  naranja
#> 3  naranja     rojo     rojo     rojo     rojo     rojo     rojo  naranja
#> 4  naranja  naranja  naranja  naranja  naranja amarillo amarillo amarillo
#> 5     rojo  naranja  naranja  naranja  naranja  naranja  naranja amarillo
#> 6  naranja  naranja  naranja  naranja  naranja  naranja  naranja amarillo
#>   2020-W36 2020-W37 2020-W38 2020-W39 2020-W40 2020-W41 2020-W42 2020-W43
#> 1  naranja  naranja  naranja amarillo amarillo  naranja  naranja  naranja
#> 2  naranja  naranja  naranja amarillo amarillo amarillo amarillo  naranja
#> 3  naranja  naranja  naranja  naranja  naranja amarillo amarillo  naranja
#> 4 amarillo amarillo amarillo    verde    verde    verde    verde    verde
#> 5 amarillo amarillo amarillo amarillo amarillo amarillo amarillo amarillo
#> 6 amarillo amarillo amarillo amarillo amarillo  naranja  naranja     rojo
#>   2020-W44 2020-W45 2020-W46 2020-W47 2020-W48 2020-W49 2020-W50 2020-W51
#> 1  naranja  naranja  naranja  naranja  naranja  naranja  naranja  naranja
#> 2  naranja  naranja  naranja  naranja  naranja     rojo     rojo     rojo
#> 3  naranja  naranja  naranja amarillo amarillo  naranja  naranja  naranja
#> 4    verde    verde    verde    verde    verde    verde    verde    verde
#> 5 amarillo amarillo amarillo    verde    verde    verde    verde    verde
#> 6     rojo     rojo     rojo     rojo     rojo  naranja  naranja  naranja
#>   2020-W52 2020-W53 2021-W01 2021-W02 2021-W03 2021-W04
#> 1  naranja amarillo amarillo  naranja  naranja  naranja
#> 2     rojo     rojo     rojo  naranja  naranja  naranja
#> 3  naranja  naranja  naranja  naranja  naranja  naranja
#> 4    verde    verde    verde    verde    verde    verde
#> 5    verde    verde    verde amarillo amarillo amarillo
#> 6  naranja  naranja  naranja amarillo amarillo amarillo
```

``` r
sl <- semaforos_get(format = "long")
head(sl)
#>                estado year week color
#> 1      Aguascalientes 2020   22  rojo
#> 2     Baja California 2020   22  rojo
#> 3 Baja California Sur 2020   22  rojo
#> 4            Campeche 2020   22  rojo
#> 5             Chiapas 2020   22  rojo
#> 6           Chihuahua 2020   22  rojo
```

## Data source

The data is
[scraped](https://raw.githubusercontent.com/Bisaloo/semaforos/main/data-raw/semaforos.R)
weekly from [the Mexican government
website](https://datos.covid-19.conacyt.mx/#SemaFE) using the
[polite](https://dmi3kno.github.io/polite/) and the
[rvest](https://rvest.tidyverse.org/) packages.
