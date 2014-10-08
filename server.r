library(shiny)

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
    
    wordcloud(twitterUnigram.df[,2], twitterUnigram.df[,1], min.freq=500, max.words = 100,
                    random.color = TRUE)
    })
  
  output$newsCloud <- renderPlot({
    
    wordcloud(newsUnigram.df[,2], newsUnigram.df[,1], min.freq=500, max.words = 100,
                    random.color = TRUE) 
      })  
  
  
  output$tolstoyCloud <- renderPlot({
  
    wordcloud(tolstoyUnigram.df[,2], tolstoyUnigram.df[,1], min.freq=500, max.words = 100,
                    random.color = TRUE)
  
  })
  })










