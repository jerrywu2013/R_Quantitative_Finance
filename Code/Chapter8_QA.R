library(quantmod)
TSMC <- getSymbols("2330.TW",src="yahoo",auto.assign=FALSE, 
                   from = as.Date("2016-09-01"), 
                   to = as.Date("2017-06-16"))


plot(Op(TSMC))
plot(Op(TSMC), xlab="Year", ylab="Index", main="TSMC Stock", type="b")

TSMC_Op<-na.omit(Op(TSMC))
TSMC_Op<-as.vector(TSMC_Op)
ts.plot(TSMC_Op)

##Log
plot(TSMC_Op)
TSMC_Op_log<-log(TSMC_Op)
ts.plot(TSMC_Op_log) 

##Diff
TSMC_Op_diff<-diff(TSMC_Op)
ts.plot(TSMC_Op_diff) 

#Diff(二階差分)
TSMC_Op_diff<-diff(TSMC_Op, diff=2)
ts.plot(TSMC_Op_diff) 
###################################
#Correlation analysis - Scatterplots

TSMC <- getSymbols("2330.TW",src="yahoo",auto.assign=FALSE, 
                   from = as.Date("2016-09-01"), 
                   to = as.Date("2017-06-16"))
foxconn<- getSymbols("2317.TW",src="yahoo",auto.assign=FALSE, 
                   from = as.Date("2016-09-01"), 
                   to = as.Date("2017-06-16"))

TSMC_Op<-na.omit(Op(TSMC))
TSMC_Op<-as.vector(TSMC_Op)
ts.plot(TSMC_Op)

foxconn_Op<-na.omit(Op(foxconn))
foxconn_Op<-as.vector(foxconn_Op)
ts.plot(foxconn_Op)

ts.plot(cbind(TSMC_Op,foxconn_Op))
plot(TSMC_Op,foxconn_Op)

diff_TSMC<-diff(log(TSMC_Op))
diff_foxconn<-diff(log(foxconn_Op))
diff_TSMC_foxconn<-cbind(diff_TSMC,diff_foxconn)
ts.plot(diff_TSMC_foxconn,col=c("blue","red"),ylab="diff")
legend("bottomright",colnames(diff_TSMC_foxconn),col=c("blue","red"),lty=1, cex=0.45)

####################################
#Correlation analysis – correlation coefficient

mean(TSMC_Op)
sd(TSMC_op)

mean(foxconn_Op)
sd(foxconn_Op)

TSMC_na<-na.omit(TSMC)
foxconn_na<-na.omit(foxconn)

cor_TSMC_foxconn<-cor(HLC(TSMC_na),HLC(foxconn_na))
pairs(cor_TSMC_foxconn)

cor.test(TSMC_na[,1],foxconn_na[,1])
####################################
#MA Model Estimation and Forecasting

x<-as.vector(TSMC_na[,1])

acf(x, plot=TRUE)
#acf(lynx) 加拿大山貓數量
acf(diff(x), plot=TRUE)
MA <- arima(x, order = c(0,0,2))
print(MA)

ts.plot(x)
MA_fit <- x - resid(MA)
points(MA_fit, type = "l", col = 2, lty = 2)

#Make a 1-step forecast based on MA
predict_MA <- predict(MA)
#Obtain the 1-step forecast using $pred[1]
predict_MA$pred[1] 
# Make a 1-step through 10-step forecast based on MA
predict(MA, n.ahead = 10)

# Plot
ts.plot(x)
MA_forecasts <- predict(MA, n.ahead = 10)$pred
MA_forecast_se <- predict(MA, n.ahead = 10)$se
points(MA_forecasts, type = "l", col = 2)
points(MA_forecasts - 2*MA_forecast_se, type = "l", col = 2, lty = 2)
points(MA_forecasts + 2*MA_forecast_se, type = "l", col = 2, lty = 2)
plot(forecast(MA), ylab="Stock Price", xlab="Time",
     main="Forecast for TSMCop_non-auto")


###
library(forecast)
x<-as.vector(TSMC_na[,1])
MA <- auto.arima(x, ic="aicc")
print(MA)

ts.plot(x)
MA_fit <- x - resid(MA)
points(MA_fit, type = "l", col = 2, lty = 2)

#Make a 1-step forecast based on MA
predict_MA <- predict(MA)
#Obtain the 1-step forecast using $pred[1]
predict_MA$pred[1] 
# Make a 1-step through 10-step forecast based on MA
predict(MA, n.ahead = 10)

# Plot
ts.plot(x)
MA_forecasts <- predict(MA, n.ahead = 10)$pred
MA_forecast_se <- predict(MA, n.ahead = 10)$se
points(MA_forecasts, type = "l", col = 2)
points(MA_forecasts - 2*MA_forecast_se, type = "l", col = 2, lty = 2)
points(MA_forecasts + 2*MA_forecast_se, type = "l", col = 2, lty = 2)
plot(forecast(MA), ylab="Stock Price", xlab="Time", main="Forecast for TSMCop")



