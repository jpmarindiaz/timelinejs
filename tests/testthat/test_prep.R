context("Options")

library(tidyverse)

test_that("Options",{

  expect_equal(parseOpts(),timelinejsOpts())
  opts <- NULL
  expect_equal(parseOpts(opts),timelinejsOpts())
  opts <- list(..a = 1)
  expect_equal(parseOpts(opts),c(timelinejsOpts(),opts))
  expect_equal(parseOpts(..a = 1),c(timelinejsOpts(),opts))
  expect_equal(parseOpts(opts, ..a = 2),c(timelinejsOpts(),list(..a = 2)))

  opts <- timelinejsOpts()


})

context("Clean Graph")


test_that("clean graph",{

  ed <- readr::read_csv(system.file("data/edges.csv", package = "timelinejs"))
  nd <- readr::read_csv(system.file("data/nodes.csv", package = "timelinejs"))

  expect_false(allEdgesNodesInNodes(ed,nd))

  # cleanGraph(edges, nodes = NULL,
  #            nodeSizeVar = NULL,
  #            nodeColorVar = NULL,
  #            palette = NULL,
  #            noSingleNodes = NULL)

  expect_error(cleanGraph(NULL), "No edges data.frame")

  expect_error(cleanGraphe(d, opts = NULL))

  opts <- list(data = list(edgesSourceVar = "src", edgesTargetVar = "tgt"))
  opts <- parseOpts(opts)
  edges <- data.frame(src = c(1,NA), tgt = c(2,1))

  l <- cleanGraph(edges, opts = opts)

  expect_warning(cleanGraph(edges, opts = opts),"Removing edges with NA")





})
