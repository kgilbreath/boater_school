library(readxl)
library(tidyverse)
library(lubridate)
library(data.table)


setwd("S:/Veterinary Science/Rescue and Response/Dispatch Training and Resources/Training Checklists/Staff")

path <- "S:/Veterinary Science/Rescue and Response/Dispatch Training and Resources/Training Checklists/Staff"

file_names <- list.files(path, pattern = "*.xlsx")

file_names <- setNames(file_names, file_names)

response_staff <- map_df(file_names, read_excel, sheet = 6, skip =1, .id = "id")
response_staff$id <- str_remove(response_staff$id, ".xlsx")
response_staff$month <- month(response_staff$Date)


#Function below, enter first date date of the month you are running as "YYYY-MM-DD"

field_plot <- function(b_month, field_type = NA) {
  e_month <- as.character(ceiling_date(as.Date("2020-02-01"), "month")-1)
  if(all(is.na(field_type))) {
    response_staff %>%
    filter(Date %between% c(b_month, e_month)) %>%
    ggplot(aes(id, Hours, fill = Event)) +
    geom_col() +
    ggtitle(paste("Field Time - ", 
                  month.abb[month(as.POSIXlt(b_month, format="%Y-%m-%d"))])) +
    theme(plot.title = element_text(hjust = 0.5)) +
    xlab("Staff Members") + ylab("Accumulated Hours") +
    labs(fill = "Field Type")
  }
  else{
    response_staff %>%
      filter(Date %between% c(b_month, e_month)) %>%
      filter(Event %in% field_type) %>%
      ggplot(aes(id, Hours, fill = Event)) +
      geom_col() +
      ggtitle(paste("Field Time - ", 
                    month.abb[month(as.POSIXlt(b_month, format="%Y-%m-%d"))])) +
      theme(plot.title = element_text(hjust = 0.5)) +
      xlab("Staff Members") + ylab("Accumulated Hours") +
      labs(fill = "Field Type")
  }
}