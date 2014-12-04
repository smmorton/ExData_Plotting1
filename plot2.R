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
### Plot2
###

png(filename='plot2.png')
plot(df$Global_active_power,
     type='l',
     ylab='Global Active Power (kilowatts)',
     xlab='',
     xaxt="n"
     )
axis(side=1, at=c(0,1440,2880), labels=c('Thu','Fri','Sat'))
dev.off()
