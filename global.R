libs <- c("tm", "tau", "stringr", "reshape2", "stringi", "microbenchmark", "RWeka", 
          "wordcloud", "ggplot2", "shiny")
lapply(libs, require, character.only = TRUE)



load("twitterUnigram.Rdata")
load("twitterBigram.Rdata")
load("twitterTrigram.Rdata")
load("tolstoyUnigram.Rdata")
load("tolstoyBigram.Rdata")
load("tolstoyTrigram.Rdata")
load("newsUnigram.Rdata")
load("newsBigram.Rdata")
load("newsTrigram.Rdata")

source("twitterBigramBackoff.r")
source("twitterTrigramBackoff.r")
source("twitterSentenceBuilder.r")

source("tolstoyBigramBackoff.r")
source("tolstoyTrigramBackoff.r")
source("tolstoySentenceBuilder.r")

source("newsBigramBackoff.r")
source("newsTrigramBackoff.r")
source("newsSentenceBuilder.r")