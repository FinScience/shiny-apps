################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################
##                                                                            ##
##                            Time on Site Analysis                           ##
##                                                                            ##            
##                    App & Code by Maximilian H. Nierhoff                    ##
##                                                                            ##
##                           http://nierhoff.info                             ##
##                                                                            ##
##      Live version of this app: https://apps.nierhoff.info/meinestadt       ##
##                                                                            ##
##   Github: https://github.com/mhnierhoff/shiny-apps/tree/master/meinestadt  ##
##                                                                            ##
################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################

library(zoo)
library(timeDate)
library(forecast)
library(lubridate)

dat <- read.csv("./data/tos.csv", 
                header = TRUE,
                sep=";",
                encoding = "UTF-8")

tos <- na.omit(dat)

tosa <- ts(tos, start=c(2014, yday("2014-09-09")), frequency=365.3)

write.csv(tosa, "./data/data.csv")