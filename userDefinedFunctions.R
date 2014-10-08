###################################################################
######        Twitter Functions                         ###########
###################################################################

twitterBi.f <- function(x){
  lower.x <- tolower(x)
  a <- grep(paste0(lower.x, '$'), twitterBigram.df[,"token.1"]) 
  bigram.a <- twitterBigram.df[a,] # Subset data
  bigram.a.ordered <- bigram.a[with(bigram.a, order(-biCount)),]
  b <- as.character(bigram.a$token.2[1]) #select bigram
  top.unigrams <- twitterUnigram.df[1:5, 2]
  ifelse(is.na(b), return(sample(top.unigrams, 1)), return(b))
}

twitterTri.f <- function (x){
  lower.x <- tolower(x)
  c <- colsplit(lower.x, " ", c("t1", "t2"))  
  a <- grep(paste0(lower.x, '$'), twitterTrigram.df[,"token.1.2"])       
  trigram.a <- twitterTrigram.df[a,] # Subset data
  trigram.a.ordered <- trigram.a[with(trigram.a, order(-triCount)),]
  ifelse(length(trigram.a.ordered$triCount) == 0, return(twitterBi.f(c$t2)), 
         return(as.character(trigram.a.ordered$token.3[1])))
}

twitterSb <- function(x){
  
  w3 <- twitterTri.f(x)
  
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
    c <- twitterTri.f(b)
    
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

newsSb <- function(x){
  
  w3 <- newsTri.f(x)
  
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
    c <- newsTri.f(b)
    
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

###################################################################
######        Tolstoy Functions                         ###########
###################################################################

tolstoyBi.f <- function(x){
  lower.x <- tolower(x)
  a <- grep(paste0(lower.x, '$'), tolstoyBigram.df[,"token.1"]) 
  bigram.a <- tolstoyBigram.df[a,] # Subset data
  bigram.a.ordered <- bigram.a[with(bigram.a, order(-biCount)),]
  b <- as.character(bigram.a$token.2[1]) #select bigram
  top.unigrams <- tolstoyUnigram.df[1:5, 2]
  ifelse(is.na(b), return(sample(top.unigrams, 1)), return(b))
}

tolstoyTri.f <- function (x){
  lower.x <- tolower(x)
  c <- colsplit(lower.x, " ", c("t1", "t2"))  
  a <- grep(paste0(lower.x, '$'), tolstoyTrigram.df[,"token.1.2"])       
  trigram.a <- tolstoyTrigram.df[a,] # Subset data
  trigram.a.ordered <- trigram.a[with(trigram.a, order(-triCount)),]
  ifelse(length(trigram.a.ordered$triCount) == 0, return(tolstoyBi.f(c$t2)), 
         return(as.character(trigram.a.ordered$token.3[1])))
}


tolstoySb <- function(x){
  
  w3 <- tolstoyTri.f(x)
  
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
    c <- tolstoyTri.f(b)
    
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




