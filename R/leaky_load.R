#' Load a pretrained model from the class of leaky competing accumulator models (LCA).
#'
#' @param path The path where the downloaded models are.
#' @param competitors The number of competing processes.
#' @return The pretrained model as a Keras model.
#' @export
#' @examples
#' leaky_download()
#' deepinf = leaky_load(competitors=3)
leaky_load <- function(path='.',competitors=3) {

  filepath = file.path(path,paste0('leaky',competitors,'.hdf5'))
  deep_inf = keras::load_model_hdf5(filepath,compile=F)
  return(deep_inf)
}
