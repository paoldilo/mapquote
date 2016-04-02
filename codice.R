library(quantmod)
library(timeSeries)
library(zoo)
options("getSymbols.warning4.0"=FALSE)
#set dates
startingDate <- as.Date("01/01/16",format="%m/%d/%y")
today <- Sys.Date()
#endingDate <- format(today,"%m/%d/%y")
# start downloading symbols from stock quotes
usa_sp500 <- getSymbols("^GSPC",src="yahoo",auto.assign = F,from=startingDate,to=today)
# leave only the close column
usa_sp500 <- usa_sp500[,4]
names(usa_sp500) <- c("United States")
usa_sp500 <- as.data.frame(usa_sp500)
#convert closing prices to percentage difference
for (i in length(usa_sp500[,1]):2) usa_sp500[i,1]<- (usa_sp500[i,1]-usa_sp500[i-1,1])/usa_sp500[i-1,1]*100
usa_sp500[1,1]<- 0

america <- getSymbols(c("^GSPC","^BVSP","^MXX","^MERV"),src="yahoo",auto.assign = T,from=startingDate,to=today)
europe <- getSymbols(c("^FTSE","^GDAXI","^FCHI","^MCX","FTSEMIB.MI"),src="yahoo",auto.assign = T,from=startingDate,to=today)
asia <- getSymbols(c("^HSI","^N225","^BSESN","^AORD"),src="yahoo",auto.assign = T,from=startingDate,to=today)

usa_sp500 <- GSPC[,4]
mexico<- MXX[,4]
brasil <- BVSP[,4]
argentina <- MERV[,4]
uk <- FTSE[,4]
germany <- GDAXI[,4]
france <- FCHI[,4]
russia <- MCX[,4]
italy <- FTSEMIB.MI[,4]
china <- HSI[,4]
japan <- N225[,4]
india <- BSESN[,4]
australia <- AORD[,4]


as.zoo(merge(as.timeSeries(GSPC[,4]), as.timeSeries(MXX[,4])))

names(usa_sp500) <- c("United States")
usa_sp500 <- as.data.frame(usa_sp500)

names(brasil) <- c("Brasil")
brasil <- as.data.frame(brasil)
