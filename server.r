library(shiny)
library(shinyIncubator)

shinyServer(function(input, output) {
  
  output$newsSentence <- renderText({
    predictionNews <- input$gramSentence
    newsSb(predictionNews)
    })
  
  output$newsWord <- renderText({
    predictionNews <- input$gramWord
    newsQuad.f(predictionNews)
  })
  
  
  })










