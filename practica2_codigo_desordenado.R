
table01<- AAPL_data
table1 <- table0[,-c(2,3,4,6)]
table02<- GOOGL_data
table2 <- table02[,-c(2,3,4,6)]
table03<- MSFT_data
table3 <- table03[,-c(2,3,4,6)]
table04<- AMZN_data
table4 <- table04[,-c(2,3,4,6)]
table05<- FB_data
table5 <- table05[,-c(2,3,4,6)]

tableH<-Libro1prueba

bartlett.test(tableH$Close, tableH$Name)

library(lawstat)
flinger.test(tableH$Close~tableH$Name, tableH)
flinger.test

library(outliers)
cochran.test(tableH$Close~tableH$Name)



head(all_stocks_1yr)
str(all_stocks_5yr)
summary(all_stocks_5yr)

plot(table1$Date,table1$Close, main="Valor de Bolsa, AAPL", type ='l', ylab="Valor de Cierre", xlab="Fecha")
plot(table2$Date,table2$Close, main="Valor de Bolsa, GOOGL", type ='l', ylab="Valor de Cierre", xlab="Fecha")
plot(table3$Date,table3$Close, main="Valor de Bolsa, MSFT", type ='l', ylab="Valor de Cierre", xlab="Fecha")
plot(table4$Date,table4$Close, main="Valor de Bolsa, AMZN", type ='l', ylab="Valor de Cierre", xlab="Fecha")
plot(table5$Date,table5$Close, main="Valor de Bolsa, FB", type ='l', ylab="Valor de Cierre", xlab="Fecha")

plot(table0$Date, table0$AAPL, table0$GOOGL, type = 'l')

barplot(table00)

shapiro.test(table1$Close)$p.value
shapiro.test(table2$Close)$p.value
shapiro.test(table3$Close)$p.value
shapiro.test(table4$Close)$p.value
shapiro.test(table5$Close)$p.value

#tableP <- table0
#tableP[date >=2012-1-1 & edad < 2013-1-1] <- 2012

tableP <- table1
tableP <- tableP[c(table1$Close, table2$Close)]

table0<- data.frame(Date = table1$Date, AAPL = table1$Close, GOOGL = table2$Close, MSFT = table3$Close, AMZN = table4$Close, FB = table5$Close)
table00<- data.frame(AAPL = table1$Close, GOOGL = table2$Close, MSFT = table3$Close, AMZN = table4$Close, FB = table5$Close)
head(table0)
summary(table0)

data1<- read.csv("AAL_data.csv", header=T)
cor(table1$Close, table2$Close)
for (i in 1:6) {
  [tablei$close]
}
tablei$close

library(psych)
pairs.panels(table0[c(2,3,4,5,6)])

modelo1<-lm(table0$AAPL~table0$GOOGL+table0$MSFT+table0$FB)
summary(modelo1)
ANOVA<-aov(modelo1)
summary(ANOVA)

x=AirPassengers
plot(x)
library(forecast)
fm1=auto.arima(x)

p1=forecast(fm1, 12)
plot(p1, type ='l', ylab="Valor de Cierre", xlab="Fecha")



fm1=auto.arima(table0$AAPL)
p1=forecast(fm1, 260)
plot(p1, type ='l', ylab="Close AAPL", xlab="DATE")

fm2=auto.arima(table0$GOOGL)
p2=forecast(fm2, 260)
plot(p2, type ='l', ylab="Close GOOGL", xlab="DATE")

fm3=auto.arima(table0$MSFT)
p3=forecast(fm3, 260)
plot(p3, type ='l', ylab="Close MSFT", xlab="DATE")

fm4=auto.arima(table0$AMZN)
p4=forecast(fm4, 260)
plot(p4, type ='l', ylab="Close AMZN", xlab="DATE")

fm5=auto.arima(table0$FB)
p5=forecast(fm5, 260)
plot(p5, type ='l', ylab="Close FB", xlab="DATE")

head(table2)
head(table3)
head(table4)
head(table5)

set.seed(80)
table00.km<-kmeans(table00, centers = 4)
names(table00.km)
table00.km$cluster
plot(table00.km)
aggregate(table00, by=list(prueba.km$cluster), mean)

