################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################
##                                                                            ##
##                        Text Mining of Facebook Posts                       ##
##                                                                            ##            
##                    App & Code by Maximilian H. Nierhoff                    ##
##                                                                            ##
##                           http://nierhoff.info                             ##
##                                                                            ##
##       Live version of this app: http://apps.nierhoff.info/douglas-ftm      ##
##                                                                            ##
##  Github: https://github.com/mhnierhoff/shiny-apps/tree/master/douglas-ftm  ##
##                                                                            ##
################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################   

library(Rfacebook)

load("fb_oauth")

## Get n posts of the accounts
Douglas_posts <- getPage(page="DouglasDeutschland", 
                         token=fb_oauth, feed = FALSE, n=500)
Flaconi_posts <- getPage(page="flaconi.de", 
                         token=fb_oauth, feed = FALSE, n=500)
Pieper_posts <- getPage(page="Parfuemerie.Pieper", 
                         token=fb_oauth, feed = FALSE, n=500)
Parfumdreams_posts <- getPage(page="parfumdreams", 
                         token=fb_oauth, feed = FALSE, n=500)
iparfumerie_posts <- getPage(page="iparfumerie.de", 
                         token=fb_oauth, feed = FALSE, n=500)


## Save post message column as .csv file
write.csv(Douglas_posts[,3], file = "./data/douglas.csv")
write.csv(Flaconi_posts[,3], file = "./data/flaconi.csv")
write.csv(Pieper_posts[,3], file = "./data/pieper.csv")
write.csv(Parfumdreams_posts[,3], file = "./data/parfumdreams.csv")
write.csv(iparfumerie_posts[,3], file = "./data/iparfumerie.csv")

