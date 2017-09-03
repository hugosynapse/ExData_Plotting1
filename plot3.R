#Homework Week 1: Plot 3

#Read data
hpc<-read.delim("household_power_consumption.txt", na.strings = "?", header = TRUE, sep=";")

#Convert dates and times
hpc$Date<-as.Date(strptime(hpc$Date, "%d/%m/%Y"))

#Subset to appropriate dates
hpc<-hpc[hpc$Date %in% as.Date("2007-02-01"):as.Date("2007-02-02"),]

#Make Date-Time column
hpc$DateTime<-paste(hpc$Date, hpc$Time, sep = " ")
hpc$DateTime<-strptime(hpc$DateTime, "%Y-%m-%d %H:%M:%S")

#Make Plot 3
png("Plot3.png", width=480, height=480)
with(hpc, plot(DateTime, Sub_metering_1, ylab = "Energy sub metering", xlab = " ", type = "l"))
with(hpc, lines(DateTime, Sub_metering_2, col="red"))
with(hpc, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = c(1,1,1))
dev.off()