

devtools::document()
devtools::install()

library(tidyverse)
library(timelinejs)


d <- read_csv(system.file("data/whitney-houston.csv", package = "timelinejs"))

timelinejs(d, debug = TRUE)


