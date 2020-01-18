library(readxl)
library(tidyverse)
library(lubridate)


setwd("S:/Veterinary Science/Rescue and Response/Dispatch Training and Resources/Training Checklists/Staff")

path <- "S:/Veterinary Science/Rescue and Response/Dispatch Training and Resources/Training Checklists/Staff"

file_names <- list.files(path, pattern = "*.xlsx")

file_names <- setNames(file_names, file_names)

response_staff <- map_df(file_names, read_excel, sheet = 5, skip =1, .id = "id")
response_staff$id <- str_remove(response_staff$id, ".xlsx")
response_staff$month <- month(response_staff$Date)

current_month <- 1

field_time_plot <- response_staff %>%
  filter(month == current_month) %>%
  ggplot(aes(id, Hours, fill = Event)) +
  geom_col() +
  ggtitle("Field Time by Current Month") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Staff Members") + ylab("Accumulated Hours") +
  labs(fill = "Field Type")

field_time_plot