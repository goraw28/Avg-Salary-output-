# Avg-Salary-output-

Loading the required libraries in R

Read the data from Google sheets where the input values are fed
#ip_sheet <- 'https://docs.google.com/spreadsheets/d/1VnqVxxB6T9M1U5_9tmoO533MdcJph_irInpCe_YP9LE/edit#gid=0'

Locate the output folders where we want the output to be stored
#op_path <- file.path(path_proj , "db_pipeline/Output/citywise_salary")

Give the code, to groupby citywise salaries and get their average

Create the output folder and read and write the csv files
