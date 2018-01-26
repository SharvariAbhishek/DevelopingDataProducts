
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Data from a case-control study of (o)esophageal cancer in Ille-et-Vilaine, France"),

  # Sidebar with a slider input for number of bins
    sidebarPanel(
      radioButtons("agegp", "Age Group",
                   list("25-34" = "25-34",
                        "35-44" = "35-44",
                        "45-54" = "45-54",
                        "55-64" = "55-64",
                        "65-74" = "65-74",
                        "75+" = "75+")),
      br(),
       
      radioButtons("alcgp", "Alcoholic Consumption amount in gm/day",
                   list("0-39g/day" = "0-39g/day",
                        "40-79" = "40-79",
                        "80-119" = "80-119",
                        "120+" = "120+")),
      br(),
      
      radioButtons("tobgp", "Tobacco Consumption amount in gm/day",
                   list("0-9g/day" = "0-9g/day",
                        "10-19" = "10-19",
                        "20-29" = "20-29",
                        "30+" = "30+"))
    ),
    # Show a plot of the generated distribution
    mainPanel(
      dataTableOutput('table')
    )
))
