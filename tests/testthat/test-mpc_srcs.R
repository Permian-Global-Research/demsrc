test_that("mpc_dtm_src works", {
  testthat::skip_if_offline()
  nc_sf <- system.file("gpkg", "nc.gpkg", package = "sf") |>
    sf::read_sf()

  nc_urls <- mpc_dtm_src(nc_sf)

  expect_equal(length(nc_urls), 37)

  r <- terra::rast(nc_urls[1])
  testthat::expect_s4_class(r, "SpatRaster")

  mm <- terra::minmax(r, compute = TRUE)
  expect_equal(mm["max", ], 1084.415, tolerance = 0.1)
  expect_equal(mm["min", ], 180.1222, tolerance = 0.1)


  nc_urls_nokey <- mpc_dtm_src(nc_sf, subscription_key = "")
  expect_equal(length(nc_urls_nokey), 37)
})
