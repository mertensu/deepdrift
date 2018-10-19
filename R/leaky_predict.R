#' Predict parameters of the leaky competing accumulator model (LCA).
#'
#' @param df The dataset.
#' @param model The loaded Keras model.
#' @return The parameters of the LCA model (a,t0,...).
#' @export
#' @examples
#' leaky_download()
#' input = keras::array_reshape(as.matrix(data.frame(z=rnorm(100),x=0,y=0,z=0)),c(1,100,4))
#' deepinf = leaky_load(competitors=3)
#' leaky_predict(input, deepinf)
leaky_predict <- function(df,model) {

  out = model %>% stats::predict(df) %>% data.frame()
  colnames(out) = c('dI','I','kappa','beta','Z','NDT','V(dI)','V(I)','V(kappa)','V(beta)','V(Z)','V(NDT)')
  return(out)
}


