################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################
##                                                                            ##
##                   Forecasting Models for Website Traffic                   ##
##                                                                            ##            
##                    App & Code by Maximilian H. Nierhoff                    ##
##                                                                            ##
##                           http://nierhoff.info                             ##
##                                                                            ##
##                    http://apps.nierhoff.info/bastei                        ##
##                                                                            ##
################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################

library(forecast)
library(lubridate)

dat <- read.csv("./dataset/Historical_Traffic.csv", 
                    header = TRUE,
                    sep=";")

aTR <- na.omit(dat) 

alexaTrafficRank <- ts(aTR, start=c(2014, yday("2014-07-16")), frequency=365.3)

write.csv(alexaTrafficRank, "data.csv")
