
<!-- README.md is generated from README.Rmd. Please edit that file -->

<br>

<img src='https://avatars.githubusercontent.com/u/106586419?s=400&u=69fb140fd7d3f204f361e85dba7398ac33d88a03&v=4' align='right' height='10%' width='10%'/></a>

# demsrc

<!-- badges: start -->
<!-- badges: end -->

The goal of demsrc is to return the remote url sources for global DEM
products.

## Installation

You can install the development version of demsrc from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Permian-Global-Research/demsrc")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(demsrc)
library(sf)
#> Linking to GEOS 3.10.2, GDAL 3.4.3, PROJ 8.2.1; sf_use_s2() is TRUE

nc_sf <- system.file("gpkg", "nc.gpkg", package = "sf") |>
  read_sf()


mpc_dtm_src(nc_sf, collection = "alos-dem")
#>  [1] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N036W085_DSM.tif"
#>  [2] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N036W084_DSM.tif"
#>  [3] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N036W083_DSM.tif"
#>  [4] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N036W082_DSM.tif"
#>  [5] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N036W081_DSM.tif"
#>  [6] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N036W080_DSM.tif"
#>  [7] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N036W079_DSM.tif"
#>  [8] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N036W078_DSM.tif"
#>  [9] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N036W077_DSM.tif"
#> [10] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N036W076_DSM.tif"
#> [11] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N035W085_DSM.tif"
#> [12] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N035W084_DSM.tif"
#> [13] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N035W083_DSM.tif"
#> [14] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N035W082_DSM.tif"
#> [15] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N035W081_DSM.tif"
#> [16] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N035W080_DSM.tif"
#> [17] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N035W079_DSM.tif"
#> [18] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N035W078_DSM.tif"
#> [19] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N035W077_DSM.tif"
#> [20] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N035W076_DSM.tif"
#> [21] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N034W085_DSM.tif"
#> [22] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N034W084_DSM.tif"
#> [23] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N034W083_DSM.tif"
#> [24] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N034W082_DSM.tif"
#> [25] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N034W081_DSM.tif"
#> [26] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N034W080_DSM.tif"
#> [27] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N034W079_DSM.tif"
#> [28] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N034W078_DSM.tif"
#> [29] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N034W077_DSM.tif"
#> [30] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N033W085_DSM.tif"
#> [31] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N033W084_DSM.tif"
#> [32] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N033W083_DSM.tif"
#> [33] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N033W082_DSM.tif"
#> [34] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N033W081_DSM.tif"
#> [35] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N033W080_DSM.tif"
#> [36] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N033W079_DSM.tif"
#> [37] "https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N033W078_DSM.tif"
```
