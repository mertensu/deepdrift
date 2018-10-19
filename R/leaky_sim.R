#' Simulate data from the class of leaky competing accumulator models (LCA).
#'
#' @param trials The number of trials
#' @return The simulated dataset and the actual parameters used for simulation (list).
#' @export
#' @examples
#' out_list = leaky_sim(1000)
leaky_sim = function(trials){

  stopping = FALSE
  repeat{

    # create true params
    delta_I = stats::runif(1,0.05,0.3)
    I = stats::runif(1,0.8,1.2)
    kappa = stats::runif(1,1,8)
    beta = stats::runif(1,1,8)
    Z = stats::runif(1,0.05,0.25)
    NDT = stats::runif(1,0.2,0.5)

    # df
    df = LCA4::LCA(I = c(I+delta_I,I,I),kappa = kappa,beta = beta,Z = Z,NDT = NDT,nTrials = trials)

    # minimal checks
    if(any(df$response==-1)) next  # check for non-finished simulations (i.e., maxT=5 is reached, these have response = -1)
    if(diff(range((df$rt))) < .4) next  # check for minimal range

    df[df$corr,'rt'] = df[df$corr,'rt'] * (-1)

    # print(table(df$response))
    df$corr = NULL

    ohe_feats = c('response')
    for (f in ohe_feats){
      df_all_dummy = keras::to_categorical(df[,f]) %>% data.frame %>% dplyr::select(-1)
      df[f] = NULL
      df = cbind(df, df_all_dummy)
    }

    if(ncol(df) != 4) next

    true_parameter = c(delta_I,I,kappa,beta,Z,NDT)
    stopping = TRUE
    if(stopping){
      break
    }
  }

  return(list(df,true_parameter))
}



