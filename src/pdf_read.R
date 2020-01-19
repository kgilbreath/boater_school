library(pdftools)
library(tidyverse)

schedule <- pdf_text("Sausalito Rescue & Response Weekly Sched.pdf")
head(strsplit(schedule[[1]], "\r\n")[[1]])

oncall <- schedule[[1]] %>%
  str_split(pattern = "\n") %>%
  unlist() %>%
  str_subset(pattern = "^[^…].*(\\. ){5}") %>%
  str_c(collapse = "\n") %>%
  read_table(col_names = FALSE) %>%
  mutate(X2 = str_replace_all(X2, "(\\. )*", ""),
         X5 = rep(c("Neonatal", "Postnatal"), each = 10)) %>%
  set_names(value = c("rank", "cause_of_death", "deaths", "percent", "group"))
oncall