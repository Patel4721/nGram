twitterTri.f <- function (x){
  lower.x <- tolower(x)
  c <- colsplit(lower.x, " ", c("t1", "t2"))  
  a <- grep(paste0(lower.x, '$'), twitterTrigram.df[,"token.1.2"])       
  trigram.a <- twitterTrigram.df[a,] # Subset data
  trigram.a.ordered <- trigram.a[with(trigram.a, order(-triCount)),]
  ifelse(length(trigram.a.ordered$triCount) == 0, return(twitterBi.f(c$t2)), 
         return(as.character(trigram.a.ordered$token.3[1])))
}