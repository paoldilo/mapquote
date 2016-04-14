
library(shiny)
library(rCharts)
shinyUI(fluidPage(
     titlePanel("Get 15 major stock indexes quotes on world map by date"),
     sidebarLayout(
          sidebarPanel(
               helpText("Select a  date on calendar to see major world stock indexes or press the play button underneath the slider to see the animation"),

               sliderInput("Year", "Date to be displayed:", 
                    min=as.Date("01/05/16",format="%m/%d/%y"), max=Sys.Date()-1, 
                    value=Sys.Date()-1,animate=animationOptions(interval = 2000, 
                    loop = FALSE), timeFormat="%F")
               
     ),
     mainPanel(
          h3("Stock indexes world map"),
          verbatimTextOutput("date_O"),
          htmlOutput("distPlot")
          
     )
)))