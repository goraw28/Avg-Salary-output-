# objective : read data from google sheet Do manipulations and print data to folder for power bi

library(googlesheets4)
library(data.table)
library(dplyr)
install.packages("xlsx")
library(xlsx)
Sys.setenv('C:/Program Files/Java/jre1.8.0_121') 
require(xlsx)
write.xlsx(data, "data.xlsx")


path_proj <- "D:/R projects"

ip_sheet <- 'https://docs.google.com/spreadsheets/d/1VnqVxxB6T9M1U5_9tmoO533MdcJph_irInpCe_YP9LE/edit#gid=0'

op_path <- file.path(path_proj , "db_pipeline/Output/citywise_salary")

op_daily_data <- file.path(path_proj , "db_pipeline/Output/daily_data")

googlesheets4::gs4_auth()



df <- read_sheet(ip_sheet)

df_op <- df %>% group_by(City)%>%summarise(Average_Salary = mean(Salary))

curr_date <- Sys.Date()

filename <- file.path(paste0(curr_date,'_salary.csv') , set='')

write.csv(df_op , file.path(op_path,filename),row.names = FALSE)


#store each day data in that folder

curr_date <- Sys.Date()


dir.create(file.path(op_daily_data,curr_date))

write.csv(df_op , file.path(op_daily_data,curr_date,filename),row.names = FALSE)

write.xlsx(df_op, file.path(op_path,filename), sheetName = "Sheet1",
            col.names = TRUE, row.names = TRUE, append = FALSE)
