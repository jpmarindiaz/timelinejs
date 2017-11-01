

devtools::document()
devtools::install()

library(tidyverse)
library(timelinejs)


d <- read_csv(system.file("data/whitney-houston.csv", package = "timelinejs"))
timelinejs(d, debug = TRUE)



# A nice shiny app
library(shiny)
app <- shinyApp(
  ui = bootstrapPage(
    verbatimTextOutput("debug"),
    timelinejsOutput("timeline")
  ),
  server = function(input, output) {
    d <- read_csv(system.file("data/whitney-houston.csv", package = "timelinejs"))
    output$timeline <- renderTimelinejs({
      timelinejs(d, debug = TRUE)
    })
    output$debug <- renderPrint({
      "debug"
    })
  }
)
runApp(app)

