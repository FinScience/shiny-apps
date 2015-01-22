################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################
##                                                                            ##
##                        Text Mining of Facebook Posts                       ##
##                                                                            ##            
##                    App & Code by Maximilian H. Nierhoff                    ##
##                                                                            ##
##                           http://nierhoff.info                             ##
##                                                                            ##
##         Live version of this app: https://nierhoff.shinyapps.io/TTMA       ##
##                                                                            ##
##         Github Repo for this app: https://github.com/mhnierhoff/TTMA       ##
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
PointRouge_posts <- getPage(page="PointRougeDeutschland", 
                         token=fb_oauth, feed = FALSE, n=500)


## Save post message column as .csv file
write.csv(Douglas_posts[,3], file = "./douglas.csv")
write.csv(Flaconi_posts[,3], file = "./flaconi.csv")
write.csv(Pieper_posts[,3], file = "./pieper.csv")
write.csv(Parfumdreams_posts[,3], file = "./parfumdreams.csv")
write.csv(iparfumerie_posts[,3], file = "./iparfumerie.csv")
write.csv(PointRouge_posts[,3], file = "./pointrouge.csv")
