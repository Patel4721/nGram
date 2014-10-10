library(tm)
library(tau)
library(stringr)
library(reshape2)
library(stringi)
library(wordcloud)
library(ggplot2)

load("newsUnigram.Rdata")
load("newsBigram.Rdata")
load("newsTrigram.Rdata")
load("newsQuadgram.Rdata")

source("userDefinedFunctions.r")