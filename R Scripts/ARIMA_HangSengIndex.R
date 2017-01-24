# install.packages("devtools")
# install.packages("Quandl")
# install.packages("forecast")

# library(devtools)
library(Quandl)
HSI = Quandl("YAHOO/INDEX_HSI" , start_date="1976-01-01",end_date="2016-12-31" , collapse="monthly",type= "ts")
plot(HSI)

HSI_data <- as.data.frame(HSI)
HSI_data_Close <- HSI_data$Close

#initialize the time
starttime=c(1976,1)
endtime=c(2016,12)
#monthly data
freq=12

HSI_ts <- ts(HSI_data_Close, start = starttime, end = endtime, frequency = freq)
plot(HSI_ts)


library(forecast)
fit <- auto.arima(HSI_ts)
fitted(fit)
forecast(fit)
z<-forecast(fit)
plot(z)


