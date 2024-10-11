#' Create an \link[rstac]{rstac} compatible search boundary box
#'
#' @param x A numeric (length 4) to define the spatial bounds of the STAC API
#' query or one of the following rspatial objects: sf, sfc, stars, SpatVector,
#' SpatRaster
#'
#' @return A numeric of length 4 defining the xmin, ymin, xmax ymax coordinates
#' of the search extent in WGS84 (EPSG:4326).
#' @rdname rstac_bbox
#' @export
#' @examples
#' rstac_bbox(c(-121.772, 45.321, -121.611, 45.419))
#'
#' #' if (requireNamespace("sf", quietly = TRUE)) {
#'   nc_sf <- system.file("gpkg", "nc.gpkg", package = "sf") |>
#'     sf::read_sf()
#'   rstac_bbox(nc_sf)
#' }
#'
rstac_bbox <- function(x) {
  UseMethod("rstac_bbox")
}

#' @rdname rstac_bbox
#' @export
rstac_bbox.sf <- function(x) {
  sf_method(x)
}

#' @rdname rstac_bbox
#' @export
rstac_bbox.sfc <- function(x) {
  sf_method(x)
}

#' @rdname rstac_bbox
#' @export
rstac_bbox.stars <- function(x) {
  sf_method(x)
}


#' @rdname rstac_bbox
#' @export
rstac_bbox.SpatRaster <- function(x) {
  terra_method(x)
}

#' @rdname rstac_bbox
#' @export
rstac_bbox.SpatVector <- function(x) {
  terra_method(x)
}

#' @rdname rstac_bbox
#' @export
rstac_bbox.numeric <- function(x) {
  checkmate::assert_numeric(x, lower = -180, upper = 180, len = 4)
  checkmate::assert_numeric(x[1], lower = -180, upper = x[3])
  checkmate::assert_numeric(x[2], lower = -90, upper = x[4])
  names(x) <- c("xmin", "ymin", "xmax", "ymax")
  x
}


#' @noRd
#' @keywords internal
sf_method <- function(x) {
  x <- sf::st_transform(x, "EPSG:4326") |>
    sf::st_bbox()
  x[c(1:4)]
}

#' @noRd
#' @keywords internal
terra_method <- function(x) {
  x <- terra::project(x, "EPSG:4326") |>
    terra::ext()
  x[c(1, 3, 2, 4)]
}
