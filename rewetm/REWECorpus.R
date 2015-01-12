# REWE Corpus
library(twitteR)
library(NLP)
library(tm)
library(SnowballC)
library(slam)
library(RWeka)
library(rJava) 
library(RWekajars) 

load(file = "./dataset/REWE_tweets.rda")

REWE.df <- twListToDF(REWE_tweets)

## Build the corpus, and specify the source to be character vectors 
REWECorpus <- Corpus(VectorSource(REWE.df$text))

## Make it work with the new tm package
REWECorpus <- tm_map(REWECorpus,
                     content_transformer(function(x) iconv(x, to='UTF-8-MAC', sub='byte')),
                     mc.cores=1)

## Convert to lower case
REWECorpus <- tm_map(REWECorpus, content_transformer(tolower), lazy = TRUE)

## Remove punctuation
REWECorpus <- tm_map(REWECorpus, content_transformer(removePunctuation))

## Remove numbers
REWECorpus <- tm_map(REWECorpus, content_transformer(removeNumbers))

## Remove URLs
removeURL <- function(x) gsub("http[[:alnum:]]*", "", x) 
REWECorpus <- tm_map(REWECorpus, content_transformer(removeURL))

## Remove stopwords from corpus
REWECorpus <- tm_map(REWECorpus, removeWords, stopwords("german"))
REWECorpus <- tm_map(REWECorpus, removeWords, stopwords("english"))

## Final corpus
tdmREWE <- TermDocumentMatrix(REWECorpus)