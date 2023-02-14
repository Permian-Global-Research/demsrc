
<!-- README.md is generated from README.Rmd. Please edit that file -->

<br>

<img src='https://avatars.githubusercontent.com/u/106586419?s=400&u=69fb140fd7d3f204f361e85dba7398ac33d88a03&v=4' align='right' height='10%' width='10%'/></a>

# demsrc

<!-- badges: start -->

[![R-CMD-check](https://github.com/Permian-Global-Research/demsrc/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Permian-Global-Research/demsrc/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/Permian-Global-Research/demsrc/branch/main/graph/badge.svg)](https://app.codecov.io/gh/Permian-Global-Research/demsrc?branch=main)
<!-- badges: end -->

The goal of demsrc is to return the remote url sources for global DEM
products. For now, the only main function is `mpc_dtm_src` which
accesses the collections via the [Microsoft Planetary Computer STAC
catalog](https://planetarycomputer.microsoft.com/catalog) using the
[{rstac} package](https://brazil-data-cube.github.io/rstac/)

## Installation

You can install the development version of demsrc from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Permian-Global-Research/demsrc")
```

## Example

Return the URLs for the desired DEM collection.

``` r
library(demsrc)
library(terra)
#> terra 1.6.51


(mh <- mpc_dtm_src(c( -121.772, 45.321, -121.611, 45.419), 
                   collection = "alos-dem"))
#> [1] "/vsicurl/https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N045W122_DSM.tif"

plot(rast(mh))
```

<img src="man/figures/README-Mt-Hood-example-1.png" width="100%" />

``` r
library(sf)
#> Linking to GEOS 3.10.2, GDAL 3.4.3, PROJ 8.2.1; sf_use_s2() is TRUE

nc_sf <- system.file("gpkg", "nc.gpkg", package = "sf") |>
  read_sf()


mpc_dtm_src(nc_sf, collection = "cop-dem-glo-30")
#>  [1] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N36_00_W085_00_DEM.tif"
#>  [2] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N36_00_W084_00_DEM.tif"
#>  [3] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N36_00_W083_00_DEM.tif"
#>  [4] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N36_00_W082_00_DEM.tif"
#>  [5] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N36_00_W081_00_DEM.tif"
#>  [6] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N36_00_W080_00_DEM.tif"
#>  [7] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N36_00_W079_00_DEM.tif"
#>  [8] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N36_00_W078_00_DEM.tif"
#>  [9] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N36_00_W077_00_DEM.tif"
#> [10] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N36_00_W076_00_DEM.tif"
#> [11] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N35_00_W085_00_DEM.tif"
#> [12] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N35_00_W084_00_DEM.tif"
#> [13] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N35_00_W083_00_DEM.tif"
#> [14] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N35_00_W082_00_DEM.tif"
#> [15] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N35_00_W081_00_DEM.tif"
#> [16] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N35_00_W080_00_DEM.tif"
#> [17] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N35_00_W079_00_DEM.tif"
#> [18] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N35_00_W078_00_DEM.tif"
#> [19] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N35_00_W077_00_DEM.tif"
#> [20] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N35_00_W076_00_DEM.tif"
#> [21] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N34_00_W085_00_DEM.tif"
#> [22] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N34_00_W084_00_DEM.tif"
#> [23] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N34_00_W083_00_DEM.tif"
#> [24] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N34_00_W082_00_DEM.tif"
#> [25] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N34_00_W081_00_DEM.tif"
#> [26] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N34_00_W080_00_DEM.tif"
#> [27] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N34_00_W079_00_DEM.tif"
#> [28] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N34_00_W078_00_DEM.tif"
#> [29] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N34_00_W077_00_DEM.tif"
#> [30] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N33_00_W085_00_DEM.tif"
#> [31] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N33_00_W084_00_DEM.tif"
#> [32] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N33_00_W083_00_DEM.tif"
#> [33] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N33_00_W082_00_DEM.tif"
#> [34] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N33_00_W081_00_DEM.tif"
#> [35] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N33_00_W080_00_DEM.tif"
#> [36] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N33_00_W079_00_DEM.tif"
#> [37] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N33_00_W078_00_DEM.tif"
```
