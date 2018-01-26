
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(datasets)
library(dplyr)

shinyServer(function(input, output) {
  
  data <- reactive({  
    agegp <- switch(input$agegp,
                   "25-34" = c(25:34),
                   "35-44" = c(35:44),
                   "45-54" = c(45:54),
                   "55-64" = c(55:64),
                   "65-74" = c(65:74),
                   "75+" = c(75:150))
    
    agegp(input$n)
    
    alcgp <- switch(input$alcgp,
                    "0-39g/day" = c(0:39),
                    "40-79" = c(40:79),
                    "80-119" = c(80:119),
                    "120+" = c(120:1000))
    alcgp(input$n)
    
    tobgp <- switch(input$tobgp,
                    "0-9g/day" = c(0:9),
                    "10-19" = c(10:19),
                    "20-29" = c(20:29),
                    "30+" = c(30:100))
    tobgp(input$n)
  })

  output$table <- renderDataTable({
    
    esoph_data <- transmute(esoph,
                      Age_Group= agegp,
                      Alcohol_Consumption= alcgp,
                      Tobacco_Consumption= tobgp,
                      Num_esophageal_cancer_cases= ncases,
                      Num_controlled_cases= ncontrols)
    
    esoph_data <- esoph_data  %>% filter(Age_Group == input$agegp & Alcohol_Consumption == input$alcgp &Tobacco_Consumption == input$tobgp) %>% select(Age_Group, Alcohol_Consumption,Tobacco_Consumption, Num_esophageal_cancer_cases, Num_controlled_cases)
  
    
    esoph_data

  })

})
