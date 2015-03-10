################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################
##                                                                            ##
##                            Time on Site Analysis                           ##
##                                                                            ##            
##                    App & Code by Maximilian H. Nierhoff                    ##
##                                                                            ##
##                           http://nierhoff.info                             ##
##                                                                            ##
##   Live version of this app: http://apps.nierhoff.info/bplusd-interactive   ##
##                                                                            ##
##                                 Github Repo:                               ##
##   https://github.com/mhnierhoff/shiny-apps/tree/master/bplusd-interactive  ##
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

tosa <- ts(tos, start=c(2014, yday("2014-09-10")), frequency=365.3)

write.csv(tosa, "./data/data.csv")
