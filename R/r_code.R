
library("tidyverse")
library("ggplot2")

# Read in the data

df <- read_csv("../BASH/data_consolidated/consolidated_output.csv")

summary(df)

# top 10 rows

head(df, 10)

