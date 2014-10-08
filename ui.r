library(shiny)

shinyUI(navbarPage("Navbar!",
                   tabPanel("Ngram Sentence Builder",
                            sidebarPanel(
                             
                              helpText("A lot of data is being loaded ... Please be patient!"),
                              textInput("grams", "Enter one or two words"),
                             
                              
                              submitButton("Predict") 
                              
                            ),
                        
                            mainPanel(
                              
                              h4("Twitter Prediction"),
                              textOutput("twitterSentence"),
                              
                              h4("News Prediction"),
                              textOutput("newsSentence"),
                              
                              h4("Tostoy Prediction"),
                              textOutput("tolstoySentence")
                              )),
 

                   tabPanel("Word Clouds",
                            mainPanel(
                              plotOutput("twitterCloud"),
                              plotOutput("newsCloud"),
                              plotOutput("tolstoyCloud")
                              )),
                   
                   navbarMenu("More", tabPanel("Table", dataTableOutput("table")))
))