#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(ggplot2)
library(shiny)
library(dplyr)
library(tidyverse)
library(thematic)
data <- read.csv("./data/emissions.csv")


datasearch <- length(unique(data$Country))


thematic_shiny(font = "auto")

shinyServer(function(input, output){
  emCountry <- reactive({
    data %>% 
      filter(Country == input$Country) 
    
  })
  
  top15power <- (data %>% 
    select(Country, Year, Emissions.Sector.Power.Industry) %>% 
    filter(Year == "2012") %>% 
    arrange(desc(Emissions.Sector.Power.Industry)) %>% 
    slice(1:15))$Country
  
  top15Building <- (data %>% 
    select(Country, Year, Emissions.Sector.Buildings) %>% 
    filter(Year == "2012") %>% 
    arrange(desc(Emissions.Sector.Buildings)) %>% 
    slice(1:15))$Country
  
  top15Transport <- (data %>% 
    select(Country, Year, Emissions.Sector.Transport) %>% 
    filter(Year == "2012") %>% 
    arrange(desc(Emissions.Sector.Transport)) %>% 
    slice(1:15))$Country
  
  top15Other <- (data %>% 
    select(Country, Year, Emissions.Sector.Other.Industry) %>% 
    filter(Year == "2012") %>% 
    arrange(desc(Emissions.Sector.Other.Industry)) %>% 
    slice(1:15))$Country

  output$linegraph1 <- renderPlot({
    if(input$Etype == "Emissions.Type.CO2"){
    ggplot(emCountry(), aes(x = Year, y = Emissions.Type.CO2))+
      geom_line()+
        ggtitle(paste("Emissions rate for", input$Country))+
        theme(plot.title = element_text(size = 27, face = "bold"))+
        theme(axis.text = element_text(size = 14), axis.title = element_text(size = 16))
    }
    else if(input$Etype == "Emissions.Type.N2O"){
      ggplot(emCountry(), aes(x = Year, y = Emissions.Type.N2O))+
        geom_line()+
        ggtitle(paste("Emissions rate for", input$Country))+
        theme(plot.title = element_text(size = 27, face = "bold"))+
        theme(axis.text = element_text(size = 14), axis.title = element_text(size = 16))
    }
    else {
      ggplot(emCountry(), aes(x = Year, y = Emissions.Type.CH4))+
        geom_line()+h
        ggtitle(paste("Emissions rate for", input$Country))+
        theme(plot.title = element_text(size = 27, face = "bold"))+
        theme(axis.text = element_text(size = 14), axis.title = element_text(size = 16))
    }
  })
  emCountry1 <- reactive({
    data %>% 
      filter(Country == input$Country1)
  })
    
    output$linegraph2 <- renderPlot({
      ggplot(emCountry1(), aes(x = Year, y = Ratio.Per.GDP))+
        geom_line()+
        ggtitle(paste("Emissions ratio for", input$Country1))+
        theme(plot.title = element_text(size = 27, face = "bold"))+
        theme(axis.text = element_text(size = 14), axis.title = element_text(size = 16))
    })
    emSector <- reactive({
        
        if(input$Sector == "Emissions.Sector.Power.Industry"){
          data %>% 
            filter(Year == "2012") %>% 
            filter(Country %in% top15power)
        }
      else if(input$Sector == "Emissions.Sector.Buildings"){
        data %>% 
          filter(Year == "2012") %>% 
        filter(Country %in% top15Building)
        
      }
      else if(input$Sector == "Emissions.Sector.Transport"){
        data %>% 
          filter(Year == "2012", Country %in% top15Transport)
        
      }
      else {
        data %>% 
          filter(Year == "2012") %>% 
         filter(Country %in% top15Other)
      }
        
    })
    
    output$bargraph <- renderPlot({
      if(input$Sector == "Emissions.Sector.Power.Industry"){
        ggplot(emSector(), aes(x = Country, y = Emissions.Sector.Power.Industry))+
          geom_bar(stat = "identity", fill = "Purple", position = "dodge", width = 0.8)+
          theme(axis.text.x = element_text(angle = 75, hjust = 1))+
          labs(x = "Country", y = "Emissions per KiloTon of CO2")+
          ggtitle(paste("Top 15 Emissions Rates in the Power Industry"))+
          theme(plot.title = element_text(size = 27, face = "bold"))+
          theme(axis.text = element_text(size = 14), axis.title = element_text(size = 15))
      }
      else if(input$Sector == "Emissions.Sector.Buildings"){
        ggplot(emSector(), aes(x = Country, y = Emissions.Sector.Buildings))+
          geom_bar(stat = "identity", fill = "Purple", position = "dodge", width = 0.8)+
          theme(axis.text.x = element_text(angle = 75, hjust = 1))+
          labs(x = "Country", y = "Emissions per KiloTon of CO2")+
          ggtitle(paste("Top 15 Emissions Rates in the Building Industry"))+
          theme(plot.title = element_text(size = 27, face = "bold"))+
          theme(axis.text = element_text(size = 14), axis.title = element_text(size = 15))
      }
      else if(input$Sector == "Emissions.Sector.Transport"){
        ggplot(emSector(), aes(x = Country, y = Emissions.Sector.Transport))+
          geom_bar(stat = "identity", fill = "Purple", position = "dodge", width = 0.8)+
          theme(axis.text.x = element_text(angle = 75, hjust = 1))+
          labs(x = "Country", y = "Emissions per KiloTon of CO2")+
          ggtitle(paste("Top 15 Emissions Rates in the Transport Industry"))+
          theme(plot.title = element_text(size = 27, face = "bold"))+
          theme(axis.text = element_text(size = 14), axis.title = element_text(size = 15))
      }
      else{
        ggplot(emSector(), aes(x = Country, y = Emissions.Sector.Other.Industry))+
          geom_bar(stat = "identity", fill = "Purple", position = "dodge", width = 0.8)+
          theme(axis.text.x = element_text(angle = 75, hjust = 1))+
          labs(x = "Country", y = "Emissions per KiloTon of CO2")+
          ggtitle(paste("Top 15 Emissions Rates in Other Industries"))+
          theme(plot.title = element_text(size = 27, face = "bold"))+
          theme(axis.text = element_text(size = 14), axis.title = element_text(size = 15))
      }
    })
})


