
#' @export
timelinejs <- function(d, title = NULL, era = NULL, scale = "human",
                       opts = NULL, debug = FALSE,
                       width = NULL, height = NULL, ...) {
  #opts <- parseOpts()
  opts <- parseOpts(opts = opts, ...)

  if(!scale %in% c("human","cosmological"))
    stop("Scale must be human or cosmological")

  data <- prepData(d)

  #writeLines(jsonlite::toJSON(data,auto_unbox = TRUE, na = "null"), "inst/htmlwidgets/tmp.json")

  # pass the data and settings using 'x'
  x <- list(
    data = data,
    settings = opts,
    debug = debug
  )
  if(debug){
    message("X")
    str(x)
  }

  attr(x, 'TOJSON_ARGS') <- list(auto_unbox = TRUE, na = "null")
  htmlwidgets::createWidget("timelinejs", x, width = width, height = height)
}

#' @export
timelinejsOutput <- function(outputId, width = "100%", height = "500px") {
  shinyWidgetOutput(outputId, "timelinejs", width, height, package = "timelinejs")
}

#' @export
renderTimelinejs <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, timelinejsOutput, env, quoted = TRUE)
}


