library(shiny)


# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
  

  # Generate a summary of the dataset
 
  
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
    
    p2 <- wordcloud(twitterUnigram.df[,2], twitterUnigram.df[,1], min.freq=500, max.words = 100,
                    random.color = TRUE)
    })
  
  output$newsCloud <- renderPlot({
    
    p1 <- wordcloud(newsUnigram.df[,2], newsUnigram.df[,1], min.freq=500, max.words = 100,
                    random.color = TRUE) 
      })  
  
  
  output$tolstoyCloud <- renderPlot({
    
    
    p3 <- wordcloud(tolstoyUnigram.df[,2], tolstoyUnigram.df[,1], min.freq=500, max.words = 100,
                    random.color = TRUE)
  
  })
  })










