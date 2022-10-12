
#Plot 2
library(datasets)
df <- as.data.frame(read.table("household_power_consumption.txt", sep=";", header = TRUE))

#Creacion de base de datos
library(dplyr)
datos1<- df %>%  
  mutate(fecha=as.Date(df$Date, format="%d/%m/%Y"))%>%
  mutate(date.time=as.POSIXct(paste(df$Date, df$Time), format = "%d/%m/%Y %T"))%>%
  filter(fecha=="2007-02-01"|fecha=="2007-02-02")

  datos1<-as.data.frame(datos1)

png("plot2.png", width = 480, height = 480)
plot(datos1$date.time, 
     as.numeric(as.character(datos1$Global_active_power)), 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()