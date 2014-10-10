library(shiny)

shinyUI(navbarPage("",
    
    tabPanel("Overview", includeMarkdown("nGram.Rmd")),
                   
    tabPanel("Word Prediction",
        sidebarPanel(
        textInput("gramWord", "Enter up to three words:"),
                 submitButton("Predict")),
               
               mainPanel(
                 h4("Next Word Prediction"),
                 textOutput("newsWord"))),
      
      tabPanel("Sentence Builder",
            sidebarPanel(
                  textInput("gramSentence", "Enter up to three words:"),
                  submitButton("Build")),
                        
              mainPanel(
                  h4("Sentence Builder"), textOutput("newsSentence")))

))