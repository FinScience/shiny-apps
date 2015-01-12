# toom Corpus
library(twitteR)
library(NLP)
library(tm)
library(SnowballC)
library(Snowball)
library(slam)
library(RWeka)
library(rJava) 
library(RWekajars) 

load(file = "toom_tweets.rda")

toom.df <- twListToDF(toom_tweets)

# build a corpus, and specify the source to be character vectors 
toomCorpus <- Corpus(VectorSource(toom.df$text))

# convert to lower case
toomCorpus <- tm_map(toomCorpus, content_transformer(tolower), lazy = TRUE)

# remove punctuation
toomCorpus <- tm_map(toomCorpus, content_transformer(removePunctuation))

# remove numbers
toomCorpus <- tm_map(toomCorpus, content_transformer(removeNumbers))

# remove URLs
removeURL <- function(x) gsub("http[[:alnum:]]*", "", x) 
toomCorpus <- tm_map(toomCorpus, content_transformer(removeURL))

# remove stopwords from corpus
toomCorpus <- tm_map(toomCorpus, removeWords, stopwords("german"))
toomCorpus <- tm_map(toomCorpus, removeWords, stopwords("english"))

# final corpus
tdmtoom <- TermDocumentMatrix(toomCorpus)