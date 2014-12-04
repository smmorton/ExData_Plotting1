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
### Plot3
###

png(filename='plot3.png')
plot(df$Sub_metering_1,
     type='l',
     ylab='Energy sub metering',
     xlab='',
     xaxt="n"
     )
axis(side=1, at=c(0,1440,2880), labels=c('Thu','Fri','Sat'))
lines(df$Sub_metering_2, type='l', col='red')
lines(df$Sub_metering_3, type='l', col='blue')
legend('topright',
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'),
       lty=c(1,1,1)
       )
dev.off()

