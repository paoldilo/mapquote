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
               radioButtons("ptype", "Select plot type:",choices = c("Single Date","Animation")),
               conditionalPanel("input.ptype == 'Single Date'",
                    dateInput("date_select", "Label", value = Sys.Date()-1, min = NULL, max = NULL, format = "dd/mm/yy", startview = "month", language = "en")
               ),
               conditionalPanel("input.ptype == 'Animation'",
                    dateRangeInput("date", "Date range:",
                            start  = "2016-01-01",
                            end    = Sys.Date()-1,
                            min    = "2016-01-01",
                            max    = Sys.Date()-1,
                            format = "dd/mm/yy",
                            separator = " - "),
                    actionButton("animate","Start Animation")
                    )
     ),
     mainPanel(
          htmlOutput("distPlot")
     )
)))