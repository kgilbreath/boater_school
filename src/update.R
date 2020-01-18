
file_names <- c("Gilbreath, Kyle.xlsx", "Zink, Shayla.xlsx", "Clyde, Morgan.xlsx", 
        "Hodges, Justin.xlsx", "Edwards, Kathy.xlsx", 
        "Imperial, Jess.xlsx", "Ryan, Rebecca.xlsx")

names <- c("Kyle", "Shayla", "Morgan", "Justin", "Kathy", "Jess", "Rebecca")

file_names <- setNames(file_names, file_names)

df <- map_df(file_names, read_excel, sheet = 5, skip =1, .id = "id")
df$month <- month(df$Date)

full_staff_plot2 <- df %>%
  filter(month == current_month) %>%
  ggplot(aes(id, Hours, fill = Event)) +
  geom_col()

full_staff_plot2

#import_files <- lapply(file_names, read_excel, sheet = 5, skip = 1) %>%
  #bind_rows(.id = "id")