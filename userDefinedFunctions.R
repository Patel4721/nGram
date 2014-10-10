
###################################################################
######        News Functions                           ###########
###################################################################
newsBi.f <- function(x){
  lower.x <- tolower(x)
  a <- grep(paste0(lower.x, '$'), newsBigram.df[,"token.1"]) 
  bigram.a <- newsBigram.df[a,] # Subset data
  bigram.a.ordered <- bigram.a[with(bigram.a, order(-biCount)),]
  b <- as.character(bigram.a$token.2[1]) #select bigram
  top.unigrams <- newsUnigram.df[1:5, 2]
  ifelse(is.na(b), return(sample(top.unigrams, 1)), return(b))
}

newsTri.f <- function (x){
  lower.x <- tolower(x)
  c <- colsplit(lower.x, " ", c("t1", "t2"))  
  a <- grep(paste0(lower.x, '$'), newsTrigram.df[,"token.1.2"])       
  trigram.a <- newsTrigram.df[a,] # Subset data
  trigram.a.ordered <- trigram.a[with(trigram.a, order(-triCount)),]
  ifelse(length(trigram.a.ordered$triCount) == 0, return(newsBi.f(c$t2)), 
         return(as.character(trigram.a.ordered$token.3[1])))
}

newsQuad.f <- function (x){
  lower.x <- tolower(x)
  c <- colsplit(lower.x, " ", c("t1", "t2"))
  a <- grep(paste0(lower.x, '$'), newsQuadgram.df[,"token.1.2.3"]) 
  quadgram.a <- newsQuadgram.df[a,] # Subset data
  quadgram.a.ordered <- quadgram.a[with(quadgram.a, order(-quadCount)),]
  ifelse(length(quadgram.a.ordered$quadCount) == 0, 
         return(newsTri.f(c$t2)), return(as.character(quadgram.a.ordered$token.4[1])))
  
}


newsSb <- function(x){
  
  w3 <- newsQuad.f(x)
  
  #Make a sentence by taking the predicted word and paste it on the end of the sentence
  sentence <- paste(x, w3, sep = " ")
  sentence.end <- length(grep("\\.", sentence))
  while(sentence.end == 0)
  {
    #Split the sentence into tokens so the last set of bigrams can be used as the input for predicting a new word        
    tokenize <- unlist(strsplit(sentence, " "))
    
    #Grab the last two words and save them in a vector 
    a <- tail(tokenize, 2)
    
    #Paste the words together with a space
    b <- paste(a[1], a[2], sep = " ")
    
    #Take the last two words and use that as an input
    c <- newsQuad.f(b)
    
    #Paste the results to the end of the sentence
    sentence <- paste(sentence, c, sep = " ")
    sentence.end <- length(grep("\\.", sentence))
    
  }
  
  #sentence
  cap.first.letter <- toupper(unlist(strsplit(sentence, ''))[1])    
  sentence.no.first.letter <- paste0(strsplit(sentence, '')[[1]][-1], collapse='')
  formatted.sentence <- paste(cap.first.letter, sentence.no.first.letter, sep = '')
  formatted.sentence
  
}





