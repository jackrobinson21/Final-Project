#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


shinyUI(fluidPage(

   
    titlePanel("Emissions data Across Different Countries"),

  
    sidebarLayout(
        sidebarPanel(
            radioButtons("E-type", label = ("Emission Type"),
                         choices = list("CO2" = "Emissions.Type.CO2", "N2O" = "Emissions.Type.N2O", "CH4" = "Emissions.Type.CH4"), 
                         selected = "CO2"),
            selectInput("state", label = ("Select State"), 
                        choices = list("Afghanistan" = "Afghanistan", "Albania" = "Albania", "Algeria" = "Algeria", "Andorra" = "Andorra", "Angola" = "Angola", "Anguilla" = "Anguilla", "Antigua and Barbuda" = "Antigua and Barbuda", "Argentina" = "Argentina", "Armenia" = "Armenia", "Australia" = "Australia", "Austria" = "Austria", "Azerbaijan" = "Azerbaijan", "Bahamas" = "Bahamas",
                                       "Bahrain" = "Bahrain", "Bangladesh" = "Bangladesh", "Barbados" = "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bhutan", "Bosnia and Herzegovina", "Botswana", "Brazil", 
                        selected = "AL"),
        ),

        
        mainPanel(
            plotOutput("distPlot")
        )
    )
))
