library(quantmod)
TSMC <- getSymbols("2330.TW",src="yahoo",auto.assign=FALSE, 
                   from = as.Date("2017-03-01"), 
                   to = as.Date("2017-06-16"))

print(TSMC)
nrow(TSMC)
head(TSMC, 10)
tail(TSMC, 10)
########################################

TSMC["2017-06"]
TSMC["2017-05-01/"]
TSMC["/2017-05-01"]

########################################
#Extract and Transform OHLC Time-Series Columns

Op(TSMC)
Hi(TSMC)
Lo(TSMC)
Cl(TSMC)
Vo(TSMC)
Ad(TSMC)
HLC(TSMC)
OHLC(TSMC)

start(TSMC)
end(TSMC)


########################################
#Charts
chartSeries(TSMC["2017-03-01/2017-06-16"],theme="white")
chartSeries(TSMC["2017-03-01/2017-06-16"],theme="white", type = "matchsticks")
chartSeries(TSMC["2017-03-01/2017-06-16"],theme="white", type = "bars")
chartSeries(TSMC["2017-03-01/2017-06-16"],theme="white", type = "line")

plot(TSMC)
plot(TSMC[1:20], xlab="Year", ylab="Index", main="TSMC Stock", type="b")

########################################
TSMC <- getSymbols("2330.TW",src="yahoo",auto.assign=FALSE, 
                   from = as.Date("2015-03-01"), 
                   to = as.Date("2017-06-16"))

chartSeries(TSMC["2017-03-01/2017-06-16"],theme="white")
addMACD() 
addBBands() 

addDPO()
addEnvelope()
########################################

TSMC_TS <- ts(TSMC)
TSMC_TS
plot(TSMC_TS)

########################################

TSMC <- getSymbols("2330.TW",src="yahoo",auto.assign=FALSE, 
                   from = as.Date("2015-01-01"), 
                   to = as.Date("2017-06-16"))
#取開盤價
TSMC_op<-na.omit(Op(TSMC))
#轉換向量
TSMC_op_vec<-as.vector(TSMC_op[1:10])

#0104-0117股票開盤價
TSMC_TS_Op<- ts(TSMC_op_vec , start = 4, frequency = 1)
TSMC_TS_Op
plot(TSMC_TS_Op)

########################################
#Stock Trading

stock_tw <- getSymbols("2456.TW",src="yahoo",auto.assign=FALSE, 
                   from = as.Date("2015-12-30"), 
                   to = as.Date("2017-06-16"))

chartSeries(stock_tw["2015-12-30/2017-06-16"],theme='white')
ma_stock_tw <- na.omit(stock_tw["2015-12-30/2017-06-16"][,4])

ma_20 <- runMean(ma_stock_tw, n=20) 
ma_60 <- runMean(ma_stock_tw, n=60)
addTA(ma_20,on=1,col="blue")
addTA(ma_20,on=1,col="red")

strategy_ma <- ifelse(ma_20>ma_60,1,0)
strategy_ma_lag <- (strategy_ma)

return_ROC <- ROC(Cl(mo_stock_tw))*strategy_ma_lag
return_ROC <-return_ROC["2016-06-21/2017-06-16"]
return <- exp(cumsum(return_ROC))
plot(return)
