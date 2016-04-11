#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(timeSeries)
suppressPackageStartupMessages(library(googleVis))
options("getSymbols.warning4.0"=FALSE)
source("")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
     #read the data from the fields
     selected_date <- reactive({
          input$date_select
          selected_date
     })
     
     
  output$distPlot <- renderGvis({
       #get only one row and convert it to dataframe
       dataToPlot <- as.data.frame(total[53,])
       dataToPlot <- as.data.frame(t(dataToPlot))
       dataToPlot <- cbind(row.names(dataToPlot),dataToPlot)
       names(dataToPlot)<- c("Country","Value")
       dataToPlot$Country<- sub("\\."," ",dataToPlot$Country)
       dataToPlot$Perc <- paste0(sprintf("%.2f", round(dataToPlot$Value,2)),"%")
       #plot with google Vis
        gvisGeoChart(dataToPlot, locationvar='Country', colorvar='Value',hovervar = 'Perc',
                           options=list(projection="kavrayskiy-vii",
                                        colorAxis="{values:[-4,0,4],
                                   colors:[\'red', \'white\', \'green']}",
                                        backgroundColor= '#81d4fa',
                                        datalessRegionColor= '#454545'))
  })
})