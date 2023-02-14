
#' Create an {rstac} compatible search boundary box
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
#'
#' mpc_dtm_src(c( -121.772, 45.321, -121.611, 45.419))
#'
rstac_bbox <- function(x) {
  UseMethod("rstac_bbox")
}

#' @rdname rstac_bbox
#'
#' @export
rstac_bbox.sf<- function(x){
  sf_method(x)
}

#' @rdname rstac_bbox
#'
#' @export
rstac_bbox.sfc<- function(x){
  sf_method(x)
}

#' @rdname rstac_bbox
#'
#' @export
rstac_bbox.stars<- function(x){
  sf_method(x)
}


#' @rdname rstac_bbox
#'
#' @export
rstac_bbox.SpatRaster <- function(x,...){
  terra_method(x)
}

#' @rdname rstac_bbox
#'
#' @export
rstac_bbox.SpatVector <- function(x){
  terra_method(x)
}

#' @rdname rstac_bbox
#'
#' @export
rstac_bbox.numeric <- function(x){
  checkmate::assert_numeric(x, lower = -180, upper=180, len=4)
  checkmate::assert_numeric(x[1], lower = -180, upper=x[3])
  checkmate::assert_numeric(x[2], lower = -90, upper=x[4])
  names(x) <- c("xmin", "ymin", "xmax", "ymax")
  x
}


#' @noRd
sf_method <- function(x){
  x <- sf::st_transform(x, "EPSG:4326")  |>
    sf::st_bbox()
  x[c(1:4)]
}

#' @noRd
terra_method <- function(x){
  x <- terra::project(x, "EPSG:4326") |>
    terra::ext()
  x[c(1,3,2,4)]
}
