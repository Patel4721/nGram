library(shiny)

shinyUI(navbarPage("Navbar!",
    
      tabPanel("Overview", dataTableOutput("table")),
                   
                   
      tabPanel("Ngram Sentence Builder",
            sidebarPanel(
                  helpText("Just a moment"),
                  textInput("grams", "Enter one or two words"),
                  submitButton("Predict")),
                        
              mainPanel(
                  h4("Twitter Prediction"),
                      textOutput("twitterSentence"),
                  h4("News Prediction"),
                       textOutput("newsSentence"),
                  h4("Tostoy Prediction"),
                        textOutput("tolstoySentence"))),
 

       tabPanel("Word Clouds",
              sidebarPanel(
                  
                helpText("A lot of data is being loaded ... Please be patient!"),
                  
                
                sliderInput("numWords", 
                            label = "Number of Words",
                            min = 0, max = 100, value = 50)),
                
              mainPanel(
                    plotOutput("twitterCloud"),
                    plotOutput("newsCloud"),
                    plotOutput("tolstoyCloud")
                    ))
      
      
))