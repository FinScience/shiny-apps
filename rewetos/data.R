################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################
##                                                                            ##
##                   Forecasting Models for Website Traffic                   ##
##                                                                            ##            
##                    App & Code by Maximilian H. Nierhoff                    ##
##                                                                            ##
##                           http://nierhoff.info                             ##
##                                                                            ##
##                     http://apps.nierhoff.info/rewetos                      ##
##                                                                            ##
################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################


library(forecast)
library(lubridate)

aToS <- read.csv("./dataset/ToS.csv", 
                    header = TRUE,
                    sep=";") 

alexaTimeonSite <- ts(aToS, start=c(2014, yday("2014-07-01")), frequency=365.3)

write.csv(alexaTimeonSite, "data.csv")
