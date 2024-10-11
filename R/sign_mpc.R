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
    "demsrc (https://permian-global-research.github.io/demsrc/)"
  )
  # check for the variable used by sits if the rsi one isn't set
  if (subscription_key == "") subscription_key <- Sys.getenv("MPC_TOKEN")

  f <- sign_mpc_insist()

  f(items, subscription_key, demsrc_user_agent)
}

sign_mpc_insist <- function() {
  purrr::insistently(function(its, sk, agent) {
    if (sk == "") {
      rstac::items_sign(its, rstac::sign_planetary_computer(agent))
    } else {
      rstac::items_sign(
        its,
        rstac::sign_planetary_computer(
          agent,
          headers = c("Ocp-Apim-Subscription-Key" = sk)
        )
      )
    }
  })
}
