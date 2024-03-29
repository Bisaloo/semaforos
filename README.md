
<!-- README.md is generated from README.Rmd. Please edit that file -->

# semaforos

<!-- badges: start -->

[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![Codecov test
coverage](https://codecov.io/gh/Bisaloo/semaforos/branch/main/graph/badge.svg)](https://codecov.io/gh/Bisaloo/semaforos?branch=main)
[![R-CMD-check](https://github.com/Bisaloo/semaforos/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Bisaloo/semaforos/actions/workflows/R-CMD-check.yaml)

<!-- badges: end -->

![](https://bisaloo.github.io/semaforos/articles/semaforos_files/figure-html/maps-ggplot-1.png)

The semaforos R package provides easy access to historical data of
[**Semáforos Epidemiológicos**, which are part of the COVID-19 response
strategy of Mexico](https://coronavirus.gob.mx/semaforo/). The
**Semáforos** define 4 degrees of alert at the State level and are
re-evaluated weekly.

*El paquete de R semaforos proporciona un facil acceso a los datos
historicos de los [**Semáforos Epidemiológicos**, los cuales forman
parte de la estrategia de respuesta del Gobierno Mexicano contra la
pandemia del COVID-19](https://coronavirus.gob.mx/semaforo/). Los
**Semáforos** poseen 4 grados de alerta que se aplican a cada Estado por
una semana.*

![Explanation of the different
levels](man/figures/semaforos_explanation.png)

## Installation

You can install the development version of this package from GitHub:

*Puedes instalar la ultima version de este paquete desde GitHub:*

``` r
remotes::install_github("Bisaloo/semaforos")
```

**The data can also be directly used by downloading the [csv
file](https://github.com/Bisaloo/semaforos/blob/main/inst/extdata/semaforos.csv)**.

*Tambien puedes descargar los datos directamente desde
[aqui](https://github.com/Bisaloo/semaforos/blob/main/inst/extdata/semaforos.csv).*

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
#>   2020-W52 2021-W01 2021-W02 2021-W03 2021-W04 2021-W05 2021-W06 2021-W07
#> 1  naranja amarillo amarillo  naranja  naranja  naranja  naranja  naranja
#> 2     rojo     rojo     rojo  naranja  naranja  naranja  naranja amarillo
#> 3  naranja  naranja  naranja  naranja  naranja  naranja  naranja  naranja
#> 4    verde    verde    verde    verde    verde amarillo amarillo amarillo
#> 5    verde    verde    verde amarillo amarillo amarillo amarillo    verde
#> 6  naranja  naranja  naranja amarillo amarillo  naranja  naranja amarillo
#>   2021-W08 2021-W09 2021-W10 2021-W11 2021-W12 2021-W13 2021-W14 2021-W15
#> 1  naranja  naranja amarillo amarillo amarillo amarillo amarillo amarillo
#> 2 amarillo amarillo amarillo amarillo amarillo amarillo amarillo amarillo
#> 3  naranja  naranja amarillo amarillo amarillo amarillo amarillo  naranja
#> 4 amarillo amarillo    verde    verde    verde    verde    verde    verde
#> 5    verde    verde    verde    verde    verde    verde    verde    verde
#> 6 amarillo amarillo amarillo amarillo amarillo  naranja  naranja  naranja
#>   2021-W16 2021-W17 2021-W18 2021-W19 2021-W20 2021-W21 2021-W22 2021-W23
#> 1 amarillo amarillo amarillo amarillo amarillo    verde    verde    verde
#> 2 amarillo amarillo amarillo amarillo amarillo amarillo amarillo amarillo
#> 3  naranja  naranja  naranja  naranja amarillo amarillo amarillo  naranja
#> 4    verde    verde    verde    verde    verde amarillo amarillo amarillo
#> 5    verde    verde    verde    verde    verde    verde    verde    verde
#> 6  naranja  naranja  naranja  naranja  naranja amarillo amarillo amarillo
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
[weekly](https://raw.githubusercontent.com/Bisaloo/semaforos/main/.github/workflows/cron.yml)
from [the Mexican federal government
website](https://datos.covid-19.conacyt.mx/#SemaFE) using the
[httr](https://httr.r-lib.org/) and the [xml2](https://xml2.r-lib.org/)
packages.

*Los datos son
[extraidos](https://raw.githubusercontent.com/Bisaloo/semaforos/main/data-raw/semaforos.R) [semanalmente](https://raw.githubusercontent.com/Bisaloo/semaforos/main/.github/workflows/cron.yml)
desde [el sitio web del gobierno
Mexicano](https://datos.covid-19.conacyt.mx/#SemaFE) con los paquetes
[httr](https://httr.r-lib.org/) y [xml2](https://xml2.r-lib.org/).*
