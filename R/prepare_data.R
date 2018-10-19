#' Prepare a dataset for prediction.
#'
#' @param df The dataset to be prepared.
#' @return The preprocessed dataset.
#' @export
#' @examples
#' df = leaky_sim(100)[[1]]
#' input = prepare_data(df)
prepare_data <- function(df) {
  return(keras::array_reshape(as.matrix(df),c(1,nrow(df),ncol(df))))
}
