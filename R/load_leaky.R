#' Load a pretrained model from the class of leaky competing accumulator models (LCA).
#'
#' @param path The path where the downloaded models are.
#' @param competitors The number of competing processes.
#' @return The pretrained model as a Keras model.
#' @examples
#' download_leaky_models()
#' deepinf = load_leaky(competitors=3)
load_leaky <- function(path='.',competitors=3) {

  filepath = file.path(path,paste0('leaky',competitors,'.hdf5'))
  deep_inf = keras::load_model_hdf5(filepath,compile=F)
  return(deep_inf)
}
