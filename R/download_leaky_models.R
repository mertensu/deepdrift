#' Load the pretrained LCA models.
#'
#' @param path The path to store the downloaded models.
#' @return The pretrained models.
#' @examples
#' download_leaky_models()
download_leaky_models <- function(path='.') {
  link = 'https://raw.github.com/mertensu/deep-inference/master/leaky_model/model_checkpoints/trained_model.hdf5'
  dest = file.path(path,'leaky3.hdf5')
  utils::download.file(link,destfile = dest)
  message(paste0('Downloaded ','model_test.hdf5', ' into ',path))
}
