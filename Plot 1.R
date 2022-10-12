
#Plot 1
library(datasets)
df <- as.data.frame(read.table("household_power_consumption.txt", sep=";", header = TRUE))

#Creacion de base de datos
library(dplyr)
datos<- df %>%  
  mutate(fecha=as.Date(df$Date, format="%d/%m/%Y"))%>%
  mutate(Global_active_power1=as.numeric(Global_active_power))%>%
  filter(fecha=="2007-02-01"|fecha=="2007-02-02")
  
datos<-as.data.frame(datos)


png("plot1.png", width = 480, height = 480)

hist(datos$Global_active_power1,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()