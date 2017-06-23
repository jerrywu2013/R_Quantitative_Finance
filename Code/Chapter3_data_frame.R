#Data Frames
tsmc <- c(100, 110, 120, 130)
foxconn <- c(80, 85, 90, 95)
tsmc_foxconn <- data.frame(tsmc, foxconn)
tsmc_foxconn


#Name that frame
colnames(tsmc_foxconn) <- c("A", "B")
tsmc_foxconn


#Data frame manipulation
tsmc_foxconn[1:3,]
tsmc_foxconn[1:3, 2]
tsmc_foxconn[1:3, 2, drop=FALSE]
tsmc_foxconn$A

subset(tsmc_foxconn, A > 110)
subset(tsmc_foxconn, B == 95)

#Present value
cash_flow <- 100
interest <- 10
periods <- 2

present_value <- cash_flow * (1 + interest / 100) ^ -periods 
present_value

#Fun Time
year <- c("2014", "2015", "2016", "2017")
dividends <- c(3, 4.5, 6, 7)
periods <- c(1, 2, 3, 4)
interest <- 5
tsmc_all <- data.frame(year, dividends, periods)
tsmc_all

