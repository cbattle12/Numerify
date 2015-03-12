# shiny server file for Numerify App

library(shiny)

## create 'numerify' function which takes a character string and converts alphabetic 
## characters to numeric values, a-z -> 1:26
numerify <- function(s) {
         s <- strsplit(tolower(s),character(0))[[1]] # convert to lowercase, split into characters
         idx <- s %in% letters
         f <- factor(s[idx], levels = letters, ordered = T) # convert to factor with levels = letters 
         n <- as.numeric(f)
 }


shinyServer(
        function(input,output){
                
                ## set default input and link to reset button using uiOutput 
                output$resettable_input <- renderUI({
                        times <- input$reset_input
                        div(id=letters[(times %% length(letters)) + 1],
                            textInput("text1", "Enter the text you wish to numerify", 
                                      "abcdefghijklmnopqrstuvwxyz"))
                })
                
                ## make time series and histogram plots of the 'numerified' text input. 
                ## if the input field is empty set plot to NULL.
                output$newPlot <- renderPlot({ 
                        if (input$goButton == 0) {NULL}
                        else{
                        isolate(
                                if (input$text1 == '')
                                {NULL}
                                else{
                                x <- numerify(input$text1)
                                if (length(x) == 0) {NULL}
                                else{
                                        hBreaks = 0.5:26.5
                                        par(mfcol=c(2,1))
                                        plot(x, type = "l", yaxt = 'n', col = "salmon", lwd='3', 
                                                ylab = "Letter", main = 'Letter Series')
                                        axis(2, at = 1:26, labels=letters)
                                        hist(x, breaks = hBreaks, xaxt = 'n', col = "lightblue", 
                                                xlim = c(0.5,26.5), xlab = "Letter", 
                                                main = "Letter Frequency")
                                        axis(1, at = 1:26, labels=letters)
                                        }
                                }
                        )}}, height = 800, width = 651)
        }  
)
