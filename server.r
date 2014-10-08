library(shiny)
library(shinyIncubator)

shinyServer(function(input, output) {
  

  output$twitterSentence <- renderText({
    predictionTwitter <- input$grams
    twitterSb(predictionTwitter)
    })
  
  output$tolstoySentence <- renderText({
    predictionTolstoy <- input$grams
    tolstoySb(predictionTolstoy)
    })  
  
  output$newsSentence <- renderText({
    predictionNews <- input$grams
    newsSb(predictionNews)
    })
  
  output$twitterCloud <- renderPlot({
    
    wordcloud(twitterUnigram.df[,2], twitterUnigram.df[,1], min.freq=500, max.words = input$numWords, scale=c(4, .5),
              colors=brewer.pal(8, "Dark2")) 
    })
  
  output$newsCloud <- renderPlot({
    
    wordcloud(newsUnigram.df[,2], newsUnigram.df[,1], min.freq=500, max.words = 100, scale=c(4, .5),
                   colors=brewer.pal(8, "Dark2")) 
      })  
  
  output$tolstoyCloud <- renderPlot({
      wordcloud(tolstoyUnigram.df[,2], tolstoyUnigram.df[,1], scale=c(4, .5),
                min.freq=500, max.words=input$numWords,
                colors=brewer.pal(8, "Dark2")) 
  
  
  
  })
  })










