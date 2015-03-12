################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################
##                                                                            ##
##                        Text Mining of Twitter Tweets                       ##
##                                                                            ##            
##                    App & Code by Maximilian H. Nierhoff                    ##
##                                                                            ##
##                           http://nierhoff.info                             ##
##                                                                            ##
##       Live version of this app: https://apps.nierhoff.info/unitymedia      ##
##                                                                            ##
##   Github: https://github.com/mhnierhoff/shiny-apps/tree/master/unitymedia  ##
##                                                                            ##
################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################  

library(devtools)
library(rjson)
library(bit64)
library(httr)
library(twitteR)
library(plyr)

source("twitterApp.R")

## Get n tweets of the accounts
Unitymedia_tweets <- userTimeline("Unitymedia", n = 1500)
Telekom_tweets <- userTimeline("deutschetelekom", n = 1500)
Vodafone_tweets <- userTimeline("vodafone_de", n = 1500)
einsundeins_tweets <- userTimeline("1und1", n = 1500)

## Change list structure into data frame
Unitymedia.df <- twListToDF(Unitymedia_tweets)
Telekom.df <- twListToDF(Telekom_tweets)
Vodafone.df <- twListToDF(Vodafone_tweets)
einsundeins.df <- twListToDF(einsundeins_tweets)

## Save text column DF as .csv file for corpus
write.csv(Unitymedia.df[,1], file = "./data/Unitymedia.csv")
write.csv(Telekom.df[,1], file = "./data/Telekom.csv")
write.csv(Vodafone.df[,1], file = "./data/Vodafone.csv")
write.csv(einsundeins.df[,1], file = "./data/einsundeins.csv")
