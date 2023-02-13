
#' Create an {rstac} compatible search boundary box
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
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
