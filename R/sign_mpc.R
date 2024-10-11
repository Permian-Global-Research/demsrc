#' Sign STAC items retrieved from the Planetary Computer
#'
#' @inheritParams rsi::sign_planetary_computer
#' @noRd
#' @keywords internal
#'
sign_mpc <- function(
    items,
    subscription_key = Sys.getenv("rsi_pc_key")) {
  demsrc_user_agent <- httr::user_agent(
    "demsrc (https://github.com/Permian-Global-Research/demsrc)"
  )
  # check for the variable used by sits if the rsi one isn't set
  if (subscription_key == "") subscription_key <- Sys.getenv("MPC_TOKEN")
  if (subscription_key == "") {
    rstac::items_sign(items, rstac::sign_planetary_computer(demsrc_user_agent))
  } else {
    rstac::items_sign(
      items,
      rstac::sign_planetary_computer(
        demsrc_user_agent,
        headers = c("Ocp-Apim-Subscription-Key" = subscription_key)
      )
    )
  }
}
