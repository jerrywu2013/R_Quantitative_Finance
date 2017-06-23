setwd("Desktop/R")

library(httr)
library(RCurl)
library(XML)
library(jsonlite)


url_gen = "https://www.google.com/fusiontables/exporttable?query=select%20*%20from%201vCr8B_cD1spkRkHHiTo_eNiZ6RuCdnrxUs_O-Ss"
stock_symbol = read.csv(url_gen)
colnames(stock_symbol) = c("company_code","company_desc","company_category")
(stock_symbol)

stock = function(id){
  url_gen = paste("http://finance.google.com/finance/info?client=ig&q=TPE:", id, sep="")
  html_code = htmlParse(url_gen)
  info = fromJSON(gsub("//","",xpathSApply(html_code,"/html/body/p",xmlValue)))
  return(info)
}

stock_symbol[1,]
stock_symbol[,1][1]
(stock_info = stock(stock_symbol[,1][1]))
stock_info$l





