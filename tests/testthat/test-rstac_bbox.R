library(sf)
library(terra)
library(stars)

f <- system.file("ex/elev.tif", package="terra")

nc_sf <- system.file("gpkg", "nc.gpkg", package = "sf") |>
  read_sf()

nc_ter <- system.file("gpkg", "nc.gpkg", package = "sf") |>
  vect()

test_that("sfbox-vs-vectbox", {
  expect_equal(rstac_bbox(nc_sf), rstac_bbox(nc_ter))
})


test_that("sfcbox-vs-vectbox", {
  expect_equal(rstac_bbox(st_as_sfc(nc_sf)), rstac_bbox(nc_ter))
})

test_that("starsbox-vs-spatrastbox", {

  f.s <-rstac_bbox(read_stars(f)) |> round(1)
  f.t <- rstac_bbox(rast(f)) |> round(1)
  expect_equal(f.s, f.t)
})

