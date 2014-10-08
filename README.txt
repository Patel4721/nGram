I understand that I have a lot of files that are disorganized — I am currently working on cleaning them up.  At present, my goal is to get my Shiny App working online at ShinyApp.io.  I will work on resolving the inefficiencies with my files and the aesthetics and presentation of my Shiny App.  Right now, I need to get this working, and then I will be adding features and addressing the layout.

Here is where my current Shiny app is deployed

https://beperron.shinyapps.io/nGram/


1.  On the nGram tab, I want to have the word clouds placed horizontally across the screen.  At the top, I want a separate panel that allows the user to adjust the number of words of the word cloud with a slider (input).  I haven’t figured out how to do either, although I have spent A LOT of time playing with different code — no luck getting it solved.

2.  On the sentence builder portion of the app, I would like to not show anything in the output until the user submits the words.  Right now, once the data are loaded, it automatically puts in some output.  

3.  I am using three sets of user-defined functions for separate data files in the code — thus, I have one function for twitter data, another for news, and another for tolstoy.  I don’t know how to write a function that will allow me to apply them to each data set based on the user input.  In other words, these functions are doing the same thing to each data set, and I would like to optimize this code.  Any suggestions on how to do this?

4.  The overall model is a word prediction model based on n-grams, from natural language processing.  I have it built out to a tri-gram, but haven’t gone further.  Right now, the prediction of a word is based on the raw frequencies of the underlying n-gram.  The counts are basically each data file — e.g., newBigram.Rdata contains the bi-grams of the news stories.  The ideal computational strategy would involve computing probabilities from the frequencies, then applying a smoothing function (e.g., Good Turing smoother), and apply a back-off method if necessary (i.e., going from a higher n-gram to a lower n-gram).  

In this problem, I don’t understand how to ‘smooth’ the probabilities using something like a Good-Turing smoothing algorithm.  Also, I think I have my back-off method correct (i.e., Katz back off), but I would like some feedback on this.  I will attach a few papers on this topic area.  



 


