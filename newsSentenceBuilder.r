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


