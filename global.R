library(tm)
library(tau)
library(stringr)
library(reshape2)
library(stringi)
library(wordcloud)
library(ggplot2)



load("twitterUnigram.Rdata")
load("twitterBigram.Rdata")
load("twitterTrigram.Rdata")
load("tolstoyUnigram.Rdata")
load("tolstoyBigram.Rdata")
load("tolstoyTrigram.Rdata")
load("newsUnigram.Rdata")
load("newsBigram.Rdata")
load("newsTrigram.Rdata")

source("userDefinedFunctions.r")