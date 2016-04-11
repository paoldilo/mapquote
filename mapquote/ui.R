#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(rCharts)
shinyUI(fluidPage(
     titlePanel("Get stock indexes quotes on map"),
     sidebarLayout(
          sidebarPanel(
               helpText("Select a working date on calendar to see major world stock indexes"),
             dateInput("date_select", "Label", value = Sys.Date()-1, min = NULL, max = NULL, format = "yyyy-mm-dd", startview = "month", language = "en")
     ),
     mainPanel(
          htmlOutput("distPlot")
     )
)))