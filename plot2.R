#Homework Week 1: Plot 2

#Read data
hpc<-read.delim("household_power_consumption.txt", na.strings = "?", header = TRUE, sep=";")

#Convert dates and times
hpc$Date<-as.Date(strptime(hpc$Date, "%d/%m/%Y"))

#Subset to appropriate dates
hpc<-hpc[hpc$Date %in% as.Date("2007-02-01"):as.Date("2007-02-02"),]

#Make Date-Time column
hpc$DateTime<-paste(hpc$Date, hpc$Time, sep = " ")
hpc$DateTime<-strptime(hpc$DateTime, "%Y-%m-%d %H:%M:%S")

#Make Plot 2
png("Plot2.png", width=480, height=480)
with(hpc,plot(DateTime, Global_active_power, ylab = "Global Active Power (killowatts)", xlab = " ", type = "l"))
dev.off()