################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################
##                                                                            ##
##                        Text Mining of Twitter Tweets                       ##
##                                                                            ##            
##                    App & Code by Maximilian H. Nierhoff                    ##
##                                                                            ##
##                           http://nierhoff.info                             ##
##                                                                            ##
##                    http://apps.nierhoff.info/rewetm                        ##
##                                                                            ##
################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################

library(devtools)
library(rjson)
library(bit64)
library(httr)
library(twitteR)

source("twitterApp.R")

setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

REWE_tweets <- userTimeline("REWE_Supermarkt", n = 3200)

toom_tweets <- userTimeline("toomteam", n = 3200)

BIPA_tweets <- userTimeline("BIPA", n = 3200)

save(REWE_tweets, file = "./dataset/REWE_tweets.rda")

save(toom_tweets, file = "./dataset/toom_tweets.rda")

save(BIPA_tweets, file = "./dataset/BIPA_tweets.rda")




