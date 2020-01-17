library(readxl)
library(tidyverse)
library(lubridate)


setwd("S:/Veterinary Science/Rescue and Response/Dispatch Training and Resources/Training Checklists/Staff")

path <- "S:/Veterinary Science/Rescue and Response/Dispatch Training and Resources/Training Checklists/Staff"

path

current_month <- 1

#Kyle's Field Time
gilbreath <- read_excel("Gilbreath, Kyle.xlsx", sheet = 5, skip = 1)
gilbreath$staff <- "Kyle"

#Shayla's Field Time
zink <- read_excel("Zink, Shayla.xlsx", sheet = 5, skip = 1)
zink$staff <- "Shayla"

#Justin's Field Time
hodges <- read_excel("Hodges, Justin.xlsx", sheet = 5, skip = 1)
hodges$staff <- "Justin"

#Morgan's Field Time
clyde <- read_excel("Clyde, Morgan.xlsx", sheet = 5, skip = 1)
clyde$staff <- "Morgan"

#Kathy's Field Time
edwards <- read_excel("Edwards, Kathy.xlsx", sheet = 5, skip = 1)
edwards$staff <- "Kathy"

#Jess' Field Time
imperial <- read_excel("Imperial, Jess.xlsx", sheet = 5, skip = 1)
imperial$staff <- "Jess"

#Rebecca's Field Time
ryan <- read_excel("Ryan, Rebecca.xlsx", sheet = 5, skip = 1)
ryan$staff <- "Rebecca"

#All Staff Time
full_staff <- bind_rows(gilbreath, zink, hodges, clyde, edwards, imperial, ryan)
full_staff$month <- month(full_staff$Date)
view(full_staff)

full_staff_plot <- full_staff %>%
  filter(month == current_month) %>%
  ggplot(aes(staff, Hours, fill = Event)) +
  geom_col()

full_staff_plot
