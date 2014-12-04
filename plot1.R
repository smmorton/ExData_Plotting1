###
### get the data
### we will want only two days
###
df <- read.table('household_power_consumption.txt',
                 header=T, sep=';', na.strings='?',
                 colClasses=c(rep('character',2), rep('numeric',7))
                 )

# 1 Feb 2007
index <- grep('^1/2/2007', df$Date)
d1 <- df[index,]

# 2 Feb 2007
index <- grep('^2/2/2007', df$Date)
d2 <- df[index,]

# combine the two data frames
df <- rbind(d1,d2)
# df[,3:9] <- sapply( df[,3:9], as.numeric )
# sample the df and check the order
df[c(1,1439,1440,1441,1442,2880),]

###
### Plot1 
###
png(filename='plot1.png')
hist(df$Global_active_power,
     xlab='Global Active Power (kilowatts)',
     main='Global Active Power',
     col='red'
     )
dev.off()
