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
               #radioButtons("ptype", "Select plot type:",choices = c("Single Date","Animation")),
               #conditionalPanel("input.ptype == 'Single Date'",
#               dateInput("date_select", "Label", value = Sys.Date()-1, min = NULL, max = NULL, startview = "month", language = "en"),
#               ),
#               conditionalPanel("input.ptype == 'Animation'",
#                    dateRangeInput("date", "Date range:",
#                            start  = "2016-01-01",
#                            end    = Sys.Date()-1,
#                            min    = "2016-01-01",
#                            max    = Sys.Date()-1,
#                            format = "dd/mm/yy",
#                            separator = " - "),
#                    actionButton("animate","Start Animation")
#                    )
#               actionButton("animate","Start Animation"),

               sliderInput("Year", "Election year to be displayed:", 
               min=as.Date("01/05/16",format="%m/%d/%y"), max=Sys.Date()-1, value=Sys.Date()-1,animate=TRUE,timeFormat="%F")
     ),
     mainPanel(
          htmlOutput("distPlot"),
          verbatimTextOutput("date_O")
     )
)))