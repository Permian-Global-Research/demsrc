
<!-- README.md is generated from README.Rmd. Please edit that file -->

<br>

# demsrc

<!-- badges: start -->

[![R-CMD-check](https://github.com/Permian-Global-Research/demsrc/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Permian-Global-Research/demsrc/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/Permian-Global-Research/demsrc/branch/main/graph/badge.svg)](https://app.codecov.io/gh/Permian-Global-Research/demsrc?branch=main)
<!-- badges: end -->
<img src='https://avatars.githubusercontent.com/u/106586419?s=400&u=69fb140fd7d3f204f361e85dba7398ac33d88a03&v=4' align='right' height='10%' width='10%'/></a>

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

Here we load a few packages…

``` r
library(demsrc)
library(terra)
library(sf)
```

And now we request the ALOS DEM urls for the Mount Hood area in Oregon
using the bounding box coordinates.

``` r
(mh <- mpc_dtm_src(c(-121.772, 45.321, -121.611, 45.419),
  collection = "alos-dem"
))
#> [1] "/vsicurl/https://ai4edataeuwest.blob.core.windows.net/alos-dem/AW3D30_global/ALPSMLC30_N045W122_DSM.tif?st=2024-10-10T15%3A42%3A58Z&se=2024-10-11T16%3A27%3A58Z&sp=rl&sv=2024-05-04&sr=c&skoid=9c8ff44a-6a2c-4dfb-b298-1c9212f64d9a&sktid=72f988bf-86f1-41af-91ab-2d7cd011db47&skt=2024-10-11T13%3A56%3A48Z&ske=2024-10-18T13%3A56%3A48Z&sks=b&skv=2024-05-04&sig=%2BCaU7tv0GVGz%2BcOa0vzXuHxRRi%2BBl579IPL0y0f12IQ%3D"

plot(rast(mh))
```

<img src="man/figures/README-Mt-Hood-example-1.png" width="100%" />

And now to get the COP30 DEM urls for the North Carolina dataset, using
and sf object as the area of interest.

``` r
nc_sf <- system.file("gpkg", "nc.gpkg", package = "sf") |>
  read_sf()

# show the first 3 urls:
mpc_dtm_src(nc_sf, collection = "cop-dem-glo-30")[1:3]
#> [1] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N36_00_W085_00_DEM.tif?st=2024-10-10T15%3A43%3A02Z&se=2024-10-11T16%3A28%3A02Z&sp=rl&sv=2024-05-04&sr=c&skoid=9c8ff44a-6a2c-4dfb-b298-1c9212f64d9a&sktid=72f988bf-86f1-41af-91ab-2d7cd011db47&skt=2024-10-11T09%3A18%3A22Z&ske=2024-10-18T09%3A18%3A22Z&sks=b&skv=2024-05-04&sig=fuQIhX5ole%2Fbi0gnyB4PHgJS39cOjgMilwXilQMEWDc%3D"
#> [2] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N36_00_W084_00_DEM.tif?st=2024-10-10T15%3A43%3A02Z&se=2024-10-11T16%3A28%3A02Z&sp=rl&sv=2024-05-04&sr=c&skoid=9c8ff44a-6a2c-4dfb-b298-1c9212f64d9a&sktid=72f988bf-86f1-41af-91ab-2d7cd011db47&skt=2024-10-11T09%3A18%3A22Z&ske=2024-10-18T09%3A18%3A22Z&sks=b&skv=2024-05-04&sig=fuQIhX5ole%2Fbi0gnyB4PHgJS39cOjgMilwXilQMEWDc%3D"
#> [3] "/vsicurl/https://elevationeuwest.blob.core.windows.net/copernicus-dem/COP30_hh/Copernicus_DSM_COG_10_N36_00_W083_00_DEM.tif?st=2024-10-10T15%3A43%3A02Z&se=2024-10-11T16%3A28%3A02Z&sp=rl&sv=2024-05-04&sr=c&skoid=9c8ff44a-6a2c-4dfb-b298-1c9212f64d9a&sktid=72f988bf-86f1-41af-91ab-2d7cd011db47&skt=2024-10-11T09%3A18%3A22Z&ske=2024-10-18T09%3A18%3A22Z&sks=b&skv=2024-05-04&sig=fuQIhX5ole%2Fbi0gnyB4PHgJS39cOjgMilwXilQMEWDc%3D"
```
