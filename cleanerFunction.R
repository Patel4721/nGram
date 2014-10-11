dataCleaner.f <-function(x){
text <- x

text <- tolower(text)
text <- gsub("/",   "", text)
text <- gsub("'", '', text)
text <- gsub("’", '', text)
text <- gsub("‘", '', text)
text <- gsub("′", '', text)
text <- gsub("”", '', text)
text <- gsub("“", '', text)
text <- gsub("@",   "", text)
text <- gsub("–", "", text)
text <- gsub("\\|", "", text)
text <- gsub("[!?,.]+", ".", text)
text <- gsub("…", "", text)
text <- gsub("[0-9]", "", text)
text <- gsub('[])(;:#%$^\\~{}[&+=@/"<>_]+', "", text)
text <- stripWhitespace(text)

# Here I am attempting to break paragraphs into sentences, but I am losing the fullstop.  
text <- unlist(strsplit(text, "\\.")) 
# This code here eliminates the white space at the very beginning and end of the sentence.  
text <- str_trim(text)
#I need to add periods to the end of each sentence. Strategy - write a function
#that counts the number of characters in each line.  Then, add a period to the nchar+1 position.  
text <- paste(text, ".", sep="")
x <<- text
}



# UNIGRAM DATAFRAME
# This code retains the period / fullstop. The next expression does not.
tokens <- unlist(strsplit(text, " ")) 
#tokens <- unlist(strsplit(text, "[^a-z]+"))

tokens <- tokens[tokens != ""]
uniCount <- sort(table(tokens), decreasing=T)
unigram.df <- data.frame(uniCount)
unigram.df$unigram <- row.names(unigram.df)
row.names(unigram.df) <- NULL

