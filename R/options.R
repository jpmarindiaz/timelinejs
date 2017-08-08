timelinejsOpts <- function(){
  list(
  )
}

parseOpts <- function(opts = NULL, ...){
  .dotOpts <- list(...)
  if(!is.empty(opts)){
    if(!is.empty(.dotOpts)){
      opts <- modifyList(opts,.dotOpts)
    }
    opts <- modifyList(timelinejsOpts(),opts)
  }else{
    if(!is.empty(.dotOpts)){
      opts <- modifyList(timelinejsOpts(),.dotOpts)
    }else{
      opts <- timelinejsOpts()
    }
  }
  opts
}
