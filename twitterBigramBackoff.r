twitterBi.f <- function(x){
  lower.x <- tolower(x)
  a <- grep(paste0(lower.x, '$'), twitterBigram.df[,"token.1"]) 
  bigram.a <- twitterBigram.df[a,] # Subset data
  bigram.a.ordered <- bigram.a[with(bigram.a, order(-biCount)),]
  b <- as.character(bigram.a$token.2[1]) #select bigram
  top.unigrams <- twitterUnigram.df[1:5, 2]
  ifelse(is.na(b), return(sample(top.unigrams, 1)), return(b))
}