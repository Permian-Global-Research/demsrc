library(sf)

nc_sf <- system.file("gpkg", "nc.gpkg", package = "sf") |>
  read_sf()

test_that("check-url-length", {
  expect_equal(length(mpc_dtm_src(nc_sf)), 37)
})
