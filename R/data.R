prepData <- function(events, opts = NULL){

  events[is.na(events)] <- ""

  media <- events %>%
    select(contains("media")) %>%
    rename_all(function(x) gsub("media_","",x))
  media <- transpose(media)

  start_date <- events %>% select(contains("start_date")) %>%
    rename_all(function(x) gsub("start_date_","",x))
  start_date <- transpose(start_date)

  end_date <- events %>% select(contains("end_date")) %>%
    rename_all(function(x) gsub("end_date_","",x))
  end_date <- transpose(end_date)

  text <- events %>% select(contains("text")) %>%
    rename_all(function(x) gsub("text_","",x))
  text <- transpose(text)

  l <- list(media = media, start_date = start_date, end_date = end_date, text = text)
  l <- keep(l, ~length(.) == nrow(events))
  eventsList <- pmap(l, list)
  list(events = eventsList)
}



