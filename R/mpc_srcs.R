#' Get the tile sources for Copernicus GLO-30, ALOS World 3D-30m, NASADEM HGT
#' v001 DTM using the planetary computer STAC catalogue.
#'
#' @param aoi an sf object to define where you want the data for.
#' @param collection Any of: "cop-dem-glo-30", "cop-dem-glo-90", "alos-dem", "nasadem".
#'
#' @return
#' @export
#'
#' @examples
#'
#' # define bbox with numeric
#' mpc_dtm_src(c( -121.772, 45.321, -121.611, 45.419))
#'
#' if (requireNamespace("sf", quietly = TRUE)){
#' nc_sf <- system.file("gpkg", "nc.gpkg", package = "sf") |>
#' read_sf()
#' mpc_dtm_src(nc_sf, collection = "alos-dem")
#' }
#'
#' if (requireNamespace("sf", quietly = TRUE)){
#' fr <- system.file("ex/elev.tif", package="terra") |>
#' rast()
#' mpc_dtm_src(nc_sf, collection = "cop-dem-glo-90")
#' }
#'
#'
mpc_dtm_src <- function(aoi, collection = c("cop-dem-glo-30", "cop-dem-glo-90", "alos-dem", "nasadem")){

  checkmate::assertChoice(
    x = collection[1],
    choices = c("cop-dem-glo-30", "cop-dem-glo-90", "alos-dem", "nasadem")
  )

  stac_region <- rstac_bbox(aoi)

  s_obj <- rstac::stac("https://planetarycomputer.microsoft.com/api/stac/v1")
  rstac::get_request(s_obj)

  it_obj <- s_obj  |>
    rstac::stac_search(collections = collection[1],
                       bbox = stac_region)  |>
    rstac::get_request()

  src_list <-rstac::assets_url(it_obj)

  src_list[grep(".tif$", src_list)]

}



