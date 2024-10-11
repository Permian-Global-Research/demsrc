#' Get the Digital Elevation Model (DEM) tile url sources
#'
#' Get the Digital Elevation Model (DEM) tile url sources from the Microsoft
#' Planetary Computer STAC catalogue.
#'
#' @param aoi a spatial extent which can be provided as a numeric bounding box
#' or using a spatial object from either the \link[terra]{terra}, \link[sf]{sf}
#' or stars packages.
#' @param collection A character. one of: "cop-dem-glo-30", "cop-dem-glo-90",
#' "alos-dem", "nasadem".
#' @param vsicurl logical with default TRUE. If TRUE the '/vsicurl/' prefix is
#' appended
#' to returned urls which increases read speed for gdal. see
#' \url{https://gdal.org/user/virtual_file_systems.html#vsicurl-http-https-ftp-files-random-access}
#' for more information.
#' @param sign_items logical with default TRUE. If TRUE the STAC items are
#' signed this is now required for the planetary computer API.
#' @param subscription_key A character. The subscription key for the planetary
#' computer API. This can be set as an environment variable 'rsi_pc_key' (
#' the default for the \link[rsi]{rsi} package) or
#' 'MPC_TOKEN' (the default for the sits package). It isn't essential to set
#' this token but it should improve the performance of the API. See
#' \link[rsi]{sign_planetary_computer}
#'
#' @return A character vector of url paths.
#' @export
#'
#' @examples
#'
#' # define bbox with numeric
#' mpc_dtm_src(c(-121.772, 45.321, -121.611, 45.419))
#'
#' if (requireNamespace("sf", quietly = TRUE)) {
#'   nc_sf <- system.file("gpkg", "nc.gpkg", package = "sf") |>
#'     sf::read_sf()
#'   mpc_dtm_src(nc_sf, collection = "alos-dem")
#' }
#'
#' if (requireNamespace("terra", quietly = TRUE)) {
#'   fr <- system.file("ex/elev.tif", package = "terra") |>
#'     terra::rast()
#'   mpc_dtm_src(nc_sf, collection = "cop-dem-glo-90")
#' }
#'
mpc_dtm_src <- function(aoi,
                        collection = c(
                          "cop-dem-glo-30", "cop-dem-glo-90",
                          "alos-dem", "nasadem"
                        ),
                        vsicurl = TRUE,
                        sign_items = TRUE,
                        subscription_key = Sys.getenv("rsi_pc_key")) {
  collection <- rlang::arg_match(collection)

  stac_region <- rstac_bbox(aoi)

  s_obj <- rstac::stac("https://planetarycomputer.microsoft.com/api/stac/v1")
  rstac::get_request(s_obj)

  it_obj <- s_obj |>
    rstac::stac_search(
      collections = collection,
      bbox = stac_region
    ) |>
    rstac::get_request()

  if (isTRUE(sign_items)) it_obj <- sign_mpc(it_obj, subscription_key)

  # select either elevation or data, whicever present
  av_assets <- rstac::items_assets(it_obj)
  desired_assets <- c("data", "elevation")
  selected_asset <- intersect(av_assets, desired_assets)[1]

  urls <- rstac::assets_url(it_obj, selected_asset)

  if (isTRUE(vsicurl)) {
    urls <- sapply(
      urls, function(x) paste0("/vsicurl/", x),
      USE.NAMES = FALSE
    )
  }

  return(urls)
}
