#' Simulate data from the diffusion model (simple wrapper for rtdists::rdiffusion).
#'

#' @param n is a desired number of observations.
#' @param a threshold separation. Amount of information that is considered for a decision. Large values indicate a conservative decisional style. Typical range: 0.5 < \code{a} < 2
#' @param v drift rate. Average slope of the information accumulation process. The drift gives information about the speed and direction of the accumulation of information. Large (absolute) values of drift indicate a good performance. If received information supports the response linked to the upper threshold the sign will be positive and vice versa. Typical range: -5 < \code{v} < 5
#' @param t0 non-decision time or response time constant (in seconds). Lower bound for the duration of all non-decisional processes (encoding and response execution). Typical range: 0.1 < \code{t0} < 0.5
#' @param z starting point. Indicator of an a priori bias in decision making. When the relative starting point \code{z} deviates from \code{0.5*a}, the amount of information necessary for a decision differs between response alternatives. Default is \code{0.5*a} (i.e., no bias).
#' @param d differences in speed of response execution (in seconds). Positive values indicate that response execution is faster for responses linked to the upper threshold than for responses linked to the lower threshold. Typical range: -0.1 < \code{d} < 0.1. Default is 0.
#' @param sz inter-trial-variability of starting point. Range of a uniform distribution with mean \code{z} describing the distribution of actual starting points from specific trials. Values different from 0 can predict fast errors (but can slow computation considerably). Typical range: 0 < \code{sz} < 0.5. Default is 0.
#' @param sv inter-trial-variability of drift rate. Standard deviation of a normal distribution with mean \code{v} describing the distribution of actual drift rates from specific trials. Values different from 0 can predict slow errors. Typical range: 0 < \code{sv} < 2. Default is 0.
#' @param st0 inter-trial-variability of non-decisional components. Range of a uniform distribution with mean \code{t0 + st0/2} describing the distribution of actual \code{t0} values across trials. Accounts for response times below \code{t0}. Reduces skew of predicted RT distributions. Values different from 0 can slow computation considerably. Typical range: 0 < \code{st0} < 0.2. Default is 0.
#' @param s diffusion constant; standard deviation of the random noise of the diffusion process (i.e., within-trial variability), scales \code{a}, \code{v}, and \code{sv}. Needs to be fixed to a constant in most applications. Default is 1. Note that the default used by Ratcliff and in other applications is often 0.1.
#' @param precision \code{numerical} scalar value. Precision of calculation. Corresponds roughly to the number of decimals of the predicted CDFs that are calculated accurately. Default is 3.
#' @param stop_on_error Should the diffusion functions return 0 if the parameters values are outside the allowed range (= \code{FALSE}) or produce an error in this case (= \code{TRUE}).

#' @return The simulated dataset.
#' @export
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



