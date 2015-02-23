################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################
##                                                                            ##
##                        Text Mining of Twitter Tweets                       ##
##                                                                            ##            
##                    App & Code by Maximilian H. Nierhoff                    ##
##                                                                            ##
##                           http://nierhoff.info                             ##
##                                                                            ##
##         Live version of this app: https://apps.nierhoff.info/rewetm        ##
##                                                                            ##
##  Github Repo: https://github.com/mhnierhoff/shiny-apps/tree/master/rewetm  ##
##                                                                            ##
################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################  

library(devtools)
library(rjson)
library(bit64)
library(httr)
library(twitteR)
library(plyr)

source("twitterApp.R")

setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

## Get n tweets of the accounts
REWE_tweets <- userTimeline("REWE_Supermarkt", n = 750)
toom_tweets <- userTimeline("toomteam", n = 3200)
BIPA_tweets <- userTimeline("BIPA", n = 750)

## Change list structure into data frame
REWE.df <- twListToDF(REWE_tweets)
toom.df <- twListToDF(toom_tweets)
BIPA.df <- twListToDF(BIPA_tweets)

## Save text column DF as .csv file
write.csv(REWE.df[,1], file = "./data/REWE.csv")
write.csv(toom.df[,1], file = "./data/toom.csv")
write.csv(BIPA.df[,1], file = "./data/BIPA.csv")
