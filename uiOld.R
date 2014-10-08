library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
  
  # Application title.
  headerPanel("Ngram Sentence Builder"),
  
  # Sidebar with controls to select a dataset and specify the number
  # of observations to view. The helpText function is also used to 
  # include clarifying text. Most notably, the inclusion of a 
  # submitButton defers the rendering of output until the user 
  # explicitly clicks the button (rather than doing it immediately
  # when inputs change). This is useful if the computations required
  # to render output are inordinately time-consuming.
  sidebarPanel(
  
    textInput("grams", "Enter one word with quotes"),
    helpText("Note: while the data view will show only the specified",
             "number of observations, the summary will still be based",
             "on the full dataset."),
    
    submitButton("Predict") 
    
  ),
  
  # Show a summary of the dataset and an HTML table with the requested
  # number of observations. Note the use of the h4 function to provide
  # an additional header above each output section.
  mainPanel(
    h4("Twitter Prediction"),
    textOutput("twitterSentence"),
   
    h4("News Prediction"),
    textOutput("newsSentence"),
   
    h4("Tostoy Prediction"),
    textOutput("tolstoySentence"),

    plotOutput("twitterCloud"),
    plotOutput("newsCloud"),
    plotOutput("tolstoyCloud")
    
    )
))