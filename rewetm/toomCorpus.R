# toom Corpus
library(twitteR)
library(NLP)
library(tm)
library(SnowballC)
library(slam)
library(RWeka)
library(rJava) 
library(RWekajars) 

load(file = "./dataset/toom_tweets.rda")

toom.df <- twListToDF(toom_tweets)

## Build the corpus, and specify the source to be character vectors 
toomCorpus <- Corpus(VectorSource(toom.df$text))

## Make it work with the new tm package
toomCorpus <- tm_map(toomCorpus,
                     content_transformer(function(x) iconv(x, to='UTF-8-MAC', sub='byte')),
                     mc.cores=1)

## Convert to lower case
toomCorpus <- tm_map(toomCorpus, content_transformer(tolower), lazy = TRUE)

## Remove punctuation
toomCorpus <- tm_map(toomCorpus, content_transformer(removePunctuation))

## Remove numbers
toomCorpus <- tm_map(toomCorpus, content_transformer(removeNumbers))

## Remove URLs
removeURL <- function(x) gsub("http[[:alnum:]]*", "", x) 
toomCorpus <- tm_map(toomCorpus, content_transformer(removeURL))

## Remove stopwords from corpus
toomCorpus <- tm_map(toomCorpus, removeWords, stopwords("german"))
toomCorpus <- tm_map(toomCorpus, removeWords, stopwords("english"))

## Final corpus
tdmtoom <- TermDocumentMatrix(toomCorpus)