# UI front-end for Numerify Shiny app
library(shiny)

shinyUI(pageWithSidebar(
                headerPanel("Numerify"),
                
                sidebarPanel(
                        #textInput('text1','Enter the text you wish to numerify', 
                         #         value = 'abcdefghijklmnopqrstuvwxyz'),

                        uiOutput('resettable_input'),
                        tags$hr(),
                        actionButton('goButton','Numerify!'),
                        actionButton("reset_input", "Reset inputs"),
                        h4('What is Numerify?'),
                        h5('Numerify is an app which takes a block of text as input and outputs a 
                           "time series" of its letters and the corresponding letter frequency histogram. 
                           It does this by assigning the alphabetic character values a-z 
                           to the numbers 1-26, ignoring any non-alphabetic characters in the text block. 
                           For example, the string "abcd" would be converted to the vector [1,2,3,4] and the 
                           sentence "Hello world!" would be converted to the vector [8,5,12,12,15,23,15,18,12,4].'),
                        h4('How do I use it?'),
                        h5('The application consists of a text input box and two action buttons, "Numerify!" 
                           and "Reset inputs". The text input field initializes with a value of 
                           "abcdefghijklmnopqrstuvwxyz". Clicking on the "Reset inputs" button will clear the 
                           text input field and re-initialize with this value. 
                           You can type or cut-and-paste whatever text you like into the text box labeled 
                           "Enter the text you wish to numerify", then click the button "Numerify!" and see the 
                           results.'),
                        h4('Usage Tips'),
                        h5('Different languages have different word frequency histograms. Although an image is 
                            worth 1000 words, please avoid copying images into the text field, it makes 
                            Numerify grumpy and confused. ')
                ),
                
                mainPanel(
                        plotOutput('newPlot'),
                        textOutput('textVal')
                        )
                )
        )