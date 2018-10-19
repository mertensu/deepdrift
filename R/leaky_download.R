#' Load the pretrained LCA models.
#'
#' @param path The path to store the downloaded models.
#' @return NULL.
#' @export
#' @examples
#' leaky_download()
leaky_download <- function(path='.') {
  link = 'https://raw.github.com/mertensu/deep-inference/master/leaky_model/model_checkpoints/trained_model.hdf5'
  dest = base::file.path(path,'leaky3.hdf5')
  utils::download.file(link,destfile = dest)
  message(paste0('Downloaded ','model_test.hdf5', ' into ',path))
  return(NULL)
}
