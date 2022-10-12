
#Plot 3
library(datasets)
df <- as.data.frame(read.table("household_power_consumption.txt", sep=";", header = TRUE))

#Creacion de base de datos
library(dplyr)
datos2<- df %>%  
  mutate(fecha=as.Date(df$Date, format="%d/%m/%Y"))%>%
  mutate(date.time=as.POSIXct(paste(df$Date, df$Time), format = "%d/%m/%Y %T"))%>%
  mutate(sub_1=as.numeric(Sub_metering_1))%>%
  mutate(sub_2=as.numeric(Sub_metering_2))%>%
  mutate(sub_3=as.numeric(Sub_metering_3))%>%
  filter(fecha=="2007-02-01"|fecha=="2007-02-02")
datos2<-as.data.frame(datos2)

png("plot3.png", width = 480, height = 480)


plot(datos2$date.time,datos2$sub_1, col = "black", type = "l", 
     xlab = "", 
     ylab = "Energy sub metering")
lines(datos2$date.time, datos2$sub_2, col = "red", type = "l")
lines(datos2$date.time, datos2$sub_3, col = "blue", type = "l")
legend('topright','groups',
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = 1,
       col=c('black','red','blue'))

dev.off()