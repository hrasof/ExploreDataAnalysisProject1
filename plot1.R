Init <- function(workDirStr="C:/Users/hsofoian/Desktop/DataScience/Course 4 - Exploratory Data Analysis/Explor-Data-Analysis_CourseProj1"){
        setwd(workDirStr)      
}
Init()

# HPC - Houshold Power Consumption
HPC=read.table("C:/Users/hsofoian/Desktop/DataScience/Course 4 - Exploratory Data Analysis/data/household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)

names(HPC)
# [1] "Date"                 
# [2] "Time"                 
# [3] "Global_active_power"  
# [4] "Global_reactive_power"
# [5] "Voltage"              
# [6] "Global_intensity"     
# [7] "Sub_metering_1"       
# [8] "Sub_metering_2"       
# [9] "Sub_metering_3"  

# Date-time Conversion Functions to and from Character
HPC$Date=strptime(HPC$Date, format="%d/%m/%Y")   

#Convert to Numeric
HPC$Global_active_power=as.numeric(HPC$Global_active_power) # here
HPC$Global_reactive_power=as.numeric(HPC$Global_reactive_power)
HPC$Voltage=as.numeric(HPC$Voltage) # here
HPC$Global_intensity=as.numeric(HPC$Global_intensity) # here
HPC$Sub_metering_1=as.numeric(HPC$Sub_metering_1) # here
HPC$Sub_metering_2=as.numeric(HPC$Sub_metering_2) # here
HPC$Sub_metering_3=as.numeric(HPC$Sub_metering_3)

# Select Dates Range
SelectedHPC=subset(HPC,HPC$Date>as.POSIXlt("2007-01-31") & HPC$Date<as.POSIXlt("2007-02-03"))
# dim(SelectedHPC) --> rows 2880    col 9

# Check for "?"
# dim(SelectedHPC[which(SelectedHPC$Global_active_power !="?" | SelectedHPC$Voltage !="?" | 
#      SelectedHPC$Global_intensity !="?" | SelectedHPC$Sub_metering_1 !="?" | SelectedHPC$Sub_metering_2 !="?"), ])
# [1] 2880    9

# Create Plot 1
png(file="plot1.png",width=480,height=480)
hist(SelectedHPC$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()