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
library(thematic)

cat("---working dir:" , getwd(), "/n")
print(list.files())

thematic_shiny(font = "auto")

shinyUI(fluidPage(

  
   
    navbarPage("Emissions Analysis", theme = shinytheme("superhero"),
               tabPanel("Project Overview",
                        h1("Three Major Questions:", align="center"),
                        h4("1. How have CO2, N2O, and CH4 emissions changed per country?", align="center"),
                        h4("2. What is the relationship between the amount of emissions and the economic status of the country?", align="center"),
                        h4("3. Which sectors of business contribute the most emissions amongst all the countries?", align="center"),
                        p("The purpose of your project is to depict and inform the user of the levels of emissions pertaining to specific countries.
                          Emissions are one of the primary factors contributing to climates change, so it is important that the users learn of the harmful effects certain countries 
                          are permitting."),
                        p("The source of our data comes from the CORGIS Dataset Project 
                          Along with the levels of emissions per country, the user can also see the relationships between emissions and business sectors, as well as the Ratio of Emissions 
                          per GDP. Reviewing all of these factors pertaining to emisisons allows the user to get a accurate glimpse of the most contributable countries of emissions."),
                        h5("Source:"),
                        a("https://corgis-edu.github.io/corgis/csv/emissions/")
    ),
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
              tabPanel("Conclusion"
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
                        ),
               tabPanel("Theo",
                        mainPanel(
                          h1("Hi I'm Theo Covich")
                        ))
            
               
               )
               )
    

  

    
    )
)
