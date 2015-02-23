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

library(twitteR)
library(NLP)
library(tm)
library(SnowballC)
library(slam)
library(RWeka)
library(rJava) 
library(RWekajars)
library(memoise)

accounts <- list("REWE" = "REWE",
                 "toom" = "toom",
                 "BIPA" = "BIPA")

getTermMatrix <- memoise(function(account) {
        if(!(account %in% accounts))
                stop("Unknown account")
        
        tweets <- readLines(sprintf("./data/%s.csv", account))

## Build the corpus, and specify the source to be character vectors 
myCorpus <- Corpus(VectorSource(tweets))

## Make it work with the new tm package
myCorpus <- tm_map(myCorpus,
                   content_transformer(function(x) iconv(x, to="UTF-8", sub="byte")),
                   mc.cores=1)

## Convert to lower case
myCorpus <- tm_map(myCorpus, content_transformer(tolower), lazy = TRUE)

## Remove punctuation
myCorpus <- tm_map(myCorpus, content_transformer(removePunctuation))

## Remove numbers
myCorpus <- tm_map(myCorpus, content_transformer(removeNumbers))

## Remove URLs
removeURL <- function(x) gsub("http[[:alnum:]]*", "", x) 
myCorpus <- tm_map(myCorpus, content_transformer(removeURL))

## Remove stopwords from corpus
myCorpus <- tm_map(myCorpus, removeWords, c(stopwords("english"), "amp"))

## Final corpus
mytdm <- TermDocumentMatrix(myCorpus)

})