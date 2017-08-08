#devtools::install()
library(shiny)
library(timelinejs)

edges <- read_csv(system.file("data/edges-whois-co-1.csv", package = "timelinejs"))
edges$label <- sample(LETTERS, nrow(edges))
nodes <- read_csv(system.file("data/nodes-whois-co-1.csv", package = "timelinejs"))
nodes <- nodes %>% mutate(title = id)
opts <- list(
  data = list(
    nodesColorVar = "entity",
    nodesLabelVar = "title"
    #edgesLabelVar = "type"
  ),
  plugins = list(
    forceAtlas = FALSE,
    forceAtlasTime = 10
  ),
  sigma = list(
    drawEdgeLabels = TRUE,
    mouseWheelEnabled = TRUE,
    #edgeLabelThreshold = 0,
    enableEdgeHovering = TRUE
  )
)



ui = shinyUI(fluidPage(
  checkboxInput("drawEdgeLabels", "Draw Edge Labels", value = TRUE),
  checkboxInput("drawNodes", "Draw Nodes", value = TRUE),
  verbatimTextOutput("debug"),
  timelinejsOutput('sigma')
))

server = function(input, output) {
  output$debug <- renderPrint({
    input$timelinejs_clicked_node
  })

  output$sigma <- rendertimelinejs({
    if(is.null(input$drawEdges) || is.null(input$drawEdgeLabels))
    opts <- list(
      sigma = list(
        drawEdgeLabels = input$drawEdgeLabels,
        drawNodes = input$drawNodes
      )
    )
    timelinejs(edges, nodes = nodes, opts = opts, debug = TRUE)
  })
}

shinyApp(ui = ui, server = server)
