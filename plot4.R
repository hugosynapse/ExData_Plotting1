#Homework Week 1: Plot 4

#Read data
hpc<-read.delim("household_power_consumption.txt", na.strings = "?", header = TRUE, sep=";")

#Convert dates and times
hpc$Date<-as.Date(strptime(hpc$Date, "%d/%m/%Y"))

#Subset to appropriate dates
hpc<-hpc[hpc$Date %in% as.Date("2007-02-01"):as.Date("2007-02-02"),]

#Make Date-Time column
hpc$DateTime<-paste(hpc$Date, hpc$Time, sep = " ")
hpc$DateTime<-strptime(hpc$DateTime, "%Y-%m-%d %H:%M:%S")

#Make Plot 4
png("Plot4.png", width=480, height=480)
par(mfcol=c(2,2), mar=c(5,4,1,2), cex=0.62)
with(hpc,plot(DateTime, Global_active_power, ylab = "Global Active Power (killowatts)", xlab = " ", type = "l"))
with(hpc, plot(DateTime, Sub_metering_1, ylab = "Energy sub metering", xlab = " ", type = "l"))
with(hpc, lines(DateTime, Sub_metering_2, col="red"))
with(hpc, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = c(1,1,1), bty = "n")
with(hpc,plot(DateTime, Voltage, ylab = "Voltage", xlab = "datetime", type = "l"))
with(hpc,plot(DateTime, Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l"))
dev.off()