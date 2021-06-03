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


thematic_shiny(font = "auto")

shinyUI(fluidPage(

  
   
    navbarPage("Emissions Analysis", theme = shinytheme("superhero"),
               tabPanel("Project Overview",
                        h1("Three Major Questions:", align="center", face = "bold"),
                        br(),
                        h4("1. How have CO2, N2O, and CH4 emissions changed per country?", align="center"),
                        h4("2. What is the relationship between the amount of emissions and the economic status of the country?", align="center"),
                        h4("3. Which sectors of business contribute the most emissions amongst all the countries?", align="center"),
                        br(),
                        p("The purpose of our project is to depict and inform the user of the levels of emissions pertaining to specific countries.
                          Emissions are one of the primary factors contributing to climates change, so it is important that the users learn of the harmful effects certain countries 
                          are permitting."),
                        p("The source of our data comes from the CORGIS Dataset Project. 
                          Along with the levels of emissions per country, the user can also see the relationships between emissions and business sectors, as well as the Ratio of Emissions 
                          per GDP. Reviewing all of these factors pertaining to emisisons allows the user to get a accurate glimpse of the most contributable countries of emissions."),
                        h5("Source:"),
                        a("https://corgis-edu.github.io/corgis/csv/emissions/"),
                        br(),
                        img(src = "factory.jpeg", style="display: block; margin-left: auto; margin-right: auto;")
    ),
               tabPanel("Emissions Rate by Country",
                        sidebarLayout(
                          sidebarPanel(
                            radioButtons("Etype", label = ("Emission Type"),
                                         choices = list("CO2" = "Emissions.Type.CO2", "N2O" = "Emissions.Type.N2O", "CH4" = "Emissions.Type.CH4"), 
                                         selected = "Emissions.Type.CO2"),
                            uiOutput("country2")
                
                            ),
                          mainPanel(
                            plotOutput("linegraph1"),
                            h2("Description"),
                            p("This line graph shows the amount of emissions per country measured in kilotons of CO2 since 1970. It includes data from various types pf greenhouse gas emissions such as CO2, N2O, and CH4.
                              For example, we can see that the CO2 emissions in the United States have fluctuated but shown an overall decline, while the CO2 emissions in China have shown 
                              a steady increase since 1970.")
                            
                            
                            
                          )
                        )
                      ),
               tabPanel("Emissions Ratio Per GDP",
                        sidebarLayout(
                          sidebarPanel(
                            uiOutput("country3")
                            
                          ),
                          mainPanel(
                            plotOutput("linegraph2"),
                            h2("Description:"),
                            p("This line graph depicts the amount of green house gas emissions per $1,000 of GDP over time. For example, we can see that in the United States, the 
                              emissions to GDP ratio has steadily declined since 1980, while China's emissions ratio has been increasing over the same time period.")
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
                            plotOutput("bargraph"),
                            h2("Description:"),
                            p("This bar graph illustrates CO2 emissions per country in various industries such as power, building electricity, transportation, and others. This is also measured in Kilotons of CO2. In all of the bar graphs, we can observe that the United States and China have overwhelmingly higher emissions than
                              any other countries. ")
                          )
                        )
                        ),
              tabPanel("Conclusion",
                      h1("Conclusion"),
                      p("The top two countries that produce the most emissions are the United States and China. The United States and China have an exponentially higher amount of pollutants being released over time than all of the other countries. We observed that as GDP increases in the United States emission rates decline as the country becomes advanced and most likely outsources emission heavy activities.
                      This can be seen in the Emissions Ratio per GDP graph as the United States uses the most initial emissions per a $1000 of GDP. As time goes on they slowly reduce their emissions ratio as they have moved on to outsourcing their production.
                      The impact this is going to have on Global Warming is very extreme. As the United States searches for other countries to produce their goods the countries are forced to use the cheapest energy source which will pollute more and then the cycle will continue as those countries expand."),
                      p("The data we are using is most likely accurate as it came from the European Commission's, EDGAR. EDGAR stands for the Emissions Database for Global Atmoshperic Research. This data is credible, however, it does not include any data from after 2012 and is not up to date. This data is unbiased, however certain countries may go to lengths to hide some of their data and recordings must be made as educated observations.
                      Based on the fact that this data is not collected in certain places and must be observed will affect the population of the earth as a whole as global warming moves faster than scientists think.
                      We would do three things to advance the project in the future. First, we would have collected more recent data. Second, we would have added all sectors of industry into one bargraph. Third, we would have used a better theme on the graphs."),
                      img(src = "map.svg", style="display: block; margin-left: auto; margin-right: auto;")
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
                 p("I am a local seattlelite and have lived here all my life. I am a sophomore at UW and am looking to major in Human Computer Interaction.")
                 
              
               )),
               tabPanel("Jack",
                        mainPanel(
                          h1("Hi I'm Jack Robbo"),
                          p("I'm a sophomore at UW. I've also lived here my whole life. I am currently majoring in Finance in the Foster School of Business but am thinking of a possible INFO minor.")
                        )
                        ),
               tabPanel("Theo",
                        mainPanel(
                          h1("Hi I'm Theo Covich"), 
                          p("I'm born and raised in Seattle, WA. I am majoring in Informatics and planning to declare Biomedical Informatics as my specific discipline.")
                        ))
            
               
               )
               )
    

  

    
    )
)
