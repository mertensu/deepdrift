#' Simulate data from the diffusion model (wrapper for rtdists::rdiffusion).
#'
#' @param trials The number of trials
#' @return The simulated dataset.
#' @examples
#' df = diffusion_sim(500, a = 1, v = 2, t0 = 0.5)
diffusion_sim = function(n, a, v, t0, z = 0.5 * a, d = 0, sz = 0, sv = 0,
                         st0 = 0, s = 1, precision = 3, stop_on_error = TRUE){

  df = rtdists::rdiffusion(n, a, v, t0, z = 0.5 * a, d, sz, sv ,
                              st0 , s , precision , stop_on_error)

  df[df$response=='lower','rt'] = df[df$response=='lower','rt'] * (-1)
  df$response = NULL

  return(df)
}



