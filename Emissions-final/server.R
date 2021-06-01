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
data <- read.csv("./data/emissions.csv")


datasearch <- length(unique(data$Country))


top15power <- data %>% 
  select(Country, Year, Emissions.Sector.Power.Industry) %>% 
  filter(Year == "2012") %>% 
  arrange(desc(Emissions.Sector.Power.Industry)) %>% 
  slice(1:15)

top15Building <- data %>% 
  select(Country, Year, Emissions.Sector.Buildings) %>% 
  filter(Year == "2012") %>% 
  arrange(desc(Emissions.Sector.Buildings)) %>% 
  slice(1:15)

top15Transport <- data %>% 
  select(Country, Year, Emissions.Sector.Transport) %>% 
  filter(Year == "2012") %>% 
  arrange(desc(Emissions.Sector.Transport)) %>% 
  slice(1:15)

top15Other <- data %>% 
  select(Country, Year, Emissions.Sector.Other.Industry) %>% 
  filter(Year == "2012") %>% 
  arrange(desc(Emissions.Sector.Other.Industry)) %>% 
  slice(1:15)

shinyServer(function(input, output){
  emCountry <- reactive({
    data %>% 
      filter(Country == input$Country) 
    
  })
  
  output$linegraph1 <- renderPlot({
    if(input$Etype == "Emissions.Type.CO2"){
    ggplot(emCountry(), aes(x = Year, y = Emissions.Type.CO2))+
      geom_line()
    }
    else if(input$Etype == "Emissions.Type.N2O"){
      ggplot(emCountry(), aes(x = Year, y = Emissions.Type.N2O))+
        geom_line()
    }
    else {
      ggplot(emCountry(), aes(x = Year, y = Emissions.Type.CH4))+
        geom_line()
    }
  })
  emCountry1 <- reactive({
    data %>% 
      filter(Country == input$Country1)
  })
    
    output$linegraph2 <- renderPlot({
      ggplot(emCountry1(), aes(x = Year, y = Ratio.Per.GDP))+
        geom_line()
    })
  
    emSector <- reactive({
      data %>% 
        filter(Year == "2012") %>% 
        if(input$Sector == "Emissions.Sector.Power.Industry"){
          filter(Country %in% top15power)
        }
      else if(input$Sector == "Emissions.Sector.Buildings"){
        filter(Country %in% top15Building)
      }
      else if(input$Sector == "Emissions.Sector.Transport"){
        filter(Country %in% top15Transport)
      }
      else {
        filter(Country %in% top15Other)
      }
        
    })
    
    output$bargraph <- renderPlot({
      if(input$Sector == "Emissions.Sector.Power.Industry"){
        ggplot(emSector(), aes(x = Country, y = Emissions.Sector.Power.Industry))+
          geom_bar(stat = "identity", fill = "Purple", position = "dodge", width = 0.3)+
          theme(axis.text.x = element_text(angle = 75, hjust = 1))+
          labs(x = "Country", y = "Emissions per KiloTon of CO2")
      }
      else if(input$Sector == "Emissions.Sector.Buildings"){
        ggplot(emSector(), aes(x = Country, y = Emissions.Sector.Buildings))+
          geom_bar(stat = "identity", fill = "Purple", position = "dodge", width = 0.3)+
          theme(axis.text.x = element_text(angle = 75, hjust = 1))+
          labs(x = "Country", y = "Emissions per KiloTon of CO2")
      }
      else if(input$Sector == "Emissions.Sector.Transport"){
        ggplot(emSector(), aes(x = Country, y = Emissions.Sector.Transport))+
          geom_bar(stat = "identity", fill = "Purple", position = "dodge", width = 0.3)+
          theme(axis.text.x = element_text(angle = 75, hjust = 1))+
          labs(x = "Country", y = "Emissions per KiloTon of CO2")
      }
      else {
        ggplot(emSector(), aes(x = Country, y = Emissions.Sector.Other.Industry))+
          geom_bar(stat = "identity", fill = "Purple", position = "dodge", width = 0.3)+
          theme(axis.text.x = element_text(angle = 75, hjust = 1))+
          labs(x = "Country", y = "Emissions per KiloTon of CO2")
      }
    })
})


