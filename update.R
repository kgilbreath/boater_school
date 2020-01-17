#test list.files
file_names_test <- list.files("/Users/Kyle/boater_school")

file_names <- c("Gilbreath, Kyle.xlsx", "Zink, Shayla.xlsx", "Clyde, Morgan.xlsx", 
        "Hodges, Justin.xlsx", "Edwards, Kathy.xlsx", 
        "Imperial, Jess.xlsx", "Ryan, Rebecca.xlsx")

names <- c("Kyle", "Shayla", "Morgan", "Justin", "Kathy", "Jess", "Rebecca")



import_files <- sapply(file_names)
                       