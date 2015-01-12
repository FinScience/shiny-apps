# BIPA Corpus
library(twitteR)
library(NLP)
library(tm)
library(SnowballC)
library(Snowball)
library(slam)
library(RWeka)
library(rJava) 
library(RWekajars) 

load(file = "./dataset/BIPA_tweets.rda")

BIPA.df <- twListToDF(BIPA_tweets)

# build a corpus, and specify the source to be character vectors 
BIPACorpus <- Corpus(VectorSource(BIPA.df$text))

BIPACorpus <- tm_map(BIPACorpus,
                     content_transformer(function(x) iconv(x, to='UTF-8-MAC', sub='byte')),
                     mc.cores=1)

# convert to lower case
BIPACorpus <- tm_map(BIPACorpus, content_transformer(tolower), lazy = TRUE)

# remove punctuation
BIPACorpus <- tm_map(BIPACorpus, content_transformer(removePunctuation))

# remove numbers
BIPACorpus <- tm_map(BIPACorpus, content_transformer(removeNumbers))

# remove URLs
removeURL <- function(x) gsub("http[[:alnum:]]*", "", x) 
BIPACorpus <- tm_map(BIPACorpus, content_transformer(removeURL))

# remove stopwords from corpus
BIPACorpus <- tm_map(BIPACorpus, removeWords, stopwords("german"))
BIPACorpus <- tm_map(BIPACorpus, removeWords, stopwords("english"))

# final corpus
tdmBIPA <- TermDocumentMatrix(BIPACorpus)