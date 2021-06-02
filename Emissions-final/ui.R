#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(shinydashboard)

cat("---working dir:" , getwd(), "/n")
print(list.files())

shinyUI(fluidPage(

  
   
    navbarPage("Emissions Anaylisis", theme = shinytheme("superhero"),
               tabPanel("Emissions Rate by Country",
                        sidebarLayout(
                          sidebarPanel(
                            radioButtons("Etype", label = ("Emission Type"),
                                         choices = list("CO2" = "Emissions.Type.CO2", "N2O" = "Emissions.Type.N2O", "CH4" = "Emissions.Type.CH4"), 
                                         selected = "Emissions.Type.CO2"),
                            selectInput("Country", label = ("Select Country"), 
                                        choices = unique(data$Country)),
                            selected = "Afghanistan"),
                          mainPanel(
                            plotOutput("linegraph1")
                            
                            
                          )
                        )
                      ),
               tabPanel("Emissions Ratio Per GDP",
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("Country1", label = ("Select Country"), 
                                        choices = unique(data$Country))
                            
                          ),
                          mainPanel(
                            plotOutput("linegraph2")
                          )
                        )),
               tabPanel("Sector Emissions",
                        sidebarLayout(
                          sidebarPanel(
                            radioButtons("Sector", label = ("Select Industry Sector"), 
                                        choices = list("Power" = "Emissions.Sector.Power.Industry", "Buildings" = "Emissions.Sector.Buildings", "Transport" = "Emissions.Sector.Transport",
                                                       "Other Sectors" = "Emissions.Sector.Other.Industry"),
                                        selected = "Emissions.Sector.Power.Industry")
                            
                          ),
                          mainPanel(
                            plotOutput("bargraph")
                          )
                        )
                        ),
               navbarMenu("About Us :)",
               tabPanel("David Ocshner",
                        mainPanel(
                          h1("Hi I'm Shmave"),
                          p("Hi, I'm a sophomore at UW. I am currently in the Foster School of Business but I am looking to minor in data anaylsis. ")
                        )),
               tabPanel("Benjamin ∆",
               mainPanel(
                 h1("Hi I'm Benjmain ∆"),
                 p("I am a local seattlelite and have lived here all my life. I am a sophomore at UW and am looking to major in Human Center Interaction.")
                 
              
               )),
               tabPanel("Jack",
                        mainPanel(
                          h1("Hi I'm Jack Robbo"),
                          p("I am the king of pussy, I like that shit raw baby yeaaahhhh austin powers style baby yeahhhhhh")
                        )
                        )
            
               
               )
               )
    

  

    
    )
)
