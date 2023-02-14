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

test_that("numeric-equal", {

  x <- rstac_bbox(c( -122.2, 46.1, -122.0, 46.2 ))

  expect_equal(x, c( -122.2, 46.1, -122.0, 46.2 ),ignore_attr = TRUE)
})

test_that("numeric-leng-err", {
  expect_error(rstac_bbox(c( -122.2, 46.1, -122.0, 46.2, 99)))
})

test_that("numeric-x-ext-err", {
  expect_error(rstac_bbox(c( 10, 46.1, -122.0, 46.2)))
})

test_that("numeric-y-ext-err", {
  expect_error(rstac_bbox(c( -122.2, 50, -122.0, 46.2)))
})

test_that("numeric-x-outaworld-err", {
  expect_error(rstac_bbox(c( -181, 46.1, 180, 46.2)))
})
test_that("numeric-x-outaworld-err", {
  expect_error(rstac_bbox(c( -122.2, -91, -122.0, 46.2)))
})

