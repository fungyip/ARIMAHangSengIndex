# install.packages("devtools")
# install.packages("Quandl")
# install.packages("forecast")

# library(devtools)

#Data Extraction from Quandl - Hang Seng Index
library(Quandl)
HSI = Quandl("YAHOO/INDEX_HSI" , start_date="1976-01-01",end_date="2016-12-31" , collapse="monthly",type= "ts")
plot(HSI)

HSI_data <- as.data.frame(HSI)
HSI_data_Close <- HSI_data$Close

#Add Time dimension
library(dse)
starttime=c(1976,1)
endtime=c(2016,12)
freq=12 #monthly data

HSI_Close <- ts(HSI_data_Close, start = starttime, end = endtime, frequency = freq)
plot(HSI_Close)

library(forecast)
fit <- auto.arima(HSI_Close)
summary(fit)
fitted(fit)
HSI_2017 <- forecast(fit, 13)
HSI_2017 <- HSI_2017$mean

HSI_2017_growth <- HSI_2017/lag(HSI_2017,-1) -1

#Function for percentage calculation 
percent <- function(x, digits = 2, format = "f", ...) {
  paste0(formatC(100 * x, format = format, digits = digits, ...), "%")
}

HSI_2017_growth <- percent(HSI_2017_growth)

