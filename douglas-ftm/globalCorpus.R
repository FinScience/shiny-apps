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
library(NLP)
library(tm)
library(SnowballC)
library(slam)
library(RWeka)
library(rJava) 
library(RWekajars)
library(memoise)

pages <- list("Douglas" = "douglas",
                 "Flaconi" = "flaconi",
                 "Pieper" = "pieper",
                 "Parfumdreams" = "parfumdreams",
                 "iparfumerie" = "iparfumerie")

getTermMatrix <- memoise(function(page) {
        if(!(page %in% pages))
                stop("Unknown page")
        
        posts <- readLines(sprintf("./%s.csv", page))

## Build the corpus, and specify the source to be character vectors 
myCorpus <- Corpus(VectorSource(posts))

## Make it work with the new tm package
myCorpus <- tm_map(myCorpus,
                   content_transformer(function(x) iconv(x, to="UTF-8-MAC", sub="byte")),
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
myCorpus <- tm_map(myCorpus, removeWords, c(stopwords("german"), "wwwpinterestcompin"))

## Final corpus
mytdm <- TermDocumentMatrix(myCorpus)

})