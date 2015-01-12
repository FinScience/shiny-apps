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

api_key <- "eCR9mOumtYie7LQTdeETCF0p4"

api_secret <- "tReHmncLy0zHyHYDM8I4O2cSsddzaoExlh4olUTc1VCnkrOMVG"

access_token <- "140772912-bObXTkavM96mPmV7YPFtkzmW7VBsRq2qX9NabM7W"

access_token_secret <- "9pUpyhsEJ14ZrKtmgoFS5k5h9AVPd9IOdsWlSOV4Ry30e"

setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

