library(janitor)
library(tidyverse)
library(rvest)

tornado_url <- read_html("http://www.tornadohistoryproject.com/custom/27175199/table")

table <- tornado_url %>%
  html_nodes('#results') %>%
  html_table(header = TRUE) %>%
  .[[1]] %>%
  janitor::clean_names() %>%
  select(spc_number:lift_lon)
