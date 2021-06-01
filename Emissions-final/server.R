#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(tidyverse)
data <- read.csv("./Emissions-final/data/emissions.csv")

countryEm <- reactive ({
    data %>% 
        
})



shinyServer(function(input, output) {

    output$countryPlot <- renderPlot({

   
    })

})
