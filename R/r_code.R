
library("tidyverse")
library("ggplot2")
library("lubridate")


# Read in the data

df <- read_csv("../BASH/data_consolidated/consolidated_output.csv") #|> head(1000)

summary(df)

# top 10 rows

head(df, 10)

# Combine Fecha_Retiro and Hora_Retiro into a single datetime column
df$FHRetire <- as.POSIXct(strptime(paste(df$Fecha_Retiro, df$Hora_Retiro), "%d/%m/%Y %H:%M:%S"))

# Combine Fecha_Arribo and Hora_Arribo into a single datetime column
df$FHArrival <- as.POSIXct(strptime(paste(df$Fecha_Arribo, df$Hora_Arribo), "%d/%m/%Y %H:%M:%S"))

# add a column that calculates elapsed time in minutes between fecha_hora_retiro and fecha_hora_arribo
df <- df %>% mutate(route_time = difftime(FHArrival, FHRetire, units = "mins"))

# average route_time
mean(df$route_time, na.rm = TRUE)

# average route_time per gener (Genero_Usuario)
df %>% group_by(Genero_Usuario) %>% summarise(mean_route_time = mean(route_time, na.rm = TRUE))

# whats the average rout time per hour in a plot
df %>% group_by(hour = hour(FHRetire)) %>% summarise(mean_route_time = mean(route_time, na.rm = TRUE)) %>% ggplot(aes(x = hour, y = mean_route_time)) + geom_col()

# count rows per day of the week
df %>% 
  group_by(day = wday(FHRetire)) %>% 
  summarise(count = n()) %>% 
  ggplot(aes(x = day, y = count)) + 
  geom_col() +
  scale_x_continuous(breaks = 1:7, labels = c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"))

# what are the most common routes
df %>% 
  group_by(Ciclo_Estacion_Retiro, Ciclo_Estacion_Arribo) %>% 
  summarise(count = n()) %>% 
  arrange(desc(count)) %>% 
  head(10)

# how is the frequency among origin Ciclo_Estacion_Retiro and destination Ciclo_Estacion_Arribo
df %>% 
  group_by(ciclo_Estacion_Retiro, ciclo_Estacion_Arribo) %>% 
  summarise(count = n()) %>% 
  ggplot(aes(x = ciclo_Estacion_Retiro, y = ciclo_Estacion_Arribo, fill = count)) + 
  geom_tile() +
  scale_fill_gradient(low = "white", high = "steelblue")

# Make 5 more questions and answer them.

# add a column that labels if the origin and destination are the same as "same" or "different" if they aren't
df <- df %>% mutate(same = ifelse(Ciclo_Estacion_Retiro == Ciclo_Estacion_Arribo, "same", "different"))

# summarize by column "same" and count with percentage
df %>% 
  group_by(same) %>% 
  summarise(count = n()) %>% 
  mutate(percentage = count / sum(count))
# how many rides grouped by gender
df %>% 
  group_by(Genero_Usuario) %>% 
  summarise(count = n()) %>% 
  mutate(percentage = count / sum(count))

# top 10 stations with more rides
df %>% 
  group_by(Ciclo_Estacion_Retiro) %>% 
  summarise(count = n()) %>% 
  arrange(desc(count)) %>% 
  head(10)

# plot the age distribution
df %>% 
  ggplot(aes(x = Edad_Usuario)) + 
  geom_histogram(bins = 20)

# how many rides per bycicle
df %>% 
  group_by(Bici) %>% 
  summarise(count = n()) %>% 
  arrange(desc(count)) %>% 
  head(10)

# plot rides per month and day in continuous axis
df %>% 
  group_by(month = month(FHRetire), day = day(FHRetire)) %>% 
  summarise(count = n()) %>% 
  ggplot(aes(x = month + day / 30, y = count)) + 
  geom_line()
