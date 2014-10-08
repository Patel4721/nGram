library(shiny)

#QUESTION:  I WANT TO HAVE A LAYOUT WITH A HORIZONTAL LINE DIVIDING THE SCREEN.  THE TOP 
#SECTION WILL ACCEPT THE USER INPUT, AND THE BOTTOM SECTION WILL REPORT THE PREDICTED SENTENCES.


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
 
#QUESTION: IN THIS SECTION, I WANT TO HAVE THREE WORD CLOUDS THAT ARE ALL CONTROLLED BY A SINGLE
#SET OF USER INPUTS.  THE USER INPUTS WILL BE SLIDERS, CONTROLLING THE MINIMUM FREQUENCY
#AND MAXIMUM NUMBER OF WORDS.  

#NOTE: I AM GOING TO CREATE DIFFERENT DATA FILES FOR THE WORD CLOUDS THAN THE PREDICITON FILES.  


                   tabPanel("Word Clouds",
                            mainPanel(
                              plotOutput("twitterCloud"),
                              plotOutput("newsCloud"),
                              plotOutput("tolstoyCloud")
                              )),
                   
                   navbarMenu("More", tabPanel("Table", dataTableOutput("table")))
))