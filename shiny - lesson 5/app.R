library(shiny)
library(maps)
library(mapproj)
source("helpers.R")

counties<-readRDS("data/counties.rds")

ui<-fluidPage(
  titlePanel("cenvusVis"),
  sidebarLayout(
    sidebarPanel(
      helpText("Create demographic maps with information from the 2010 US Census"),
      selectInput("select",h3('Choose a variable to display'),
                  choices=list('Percent White',"Percent Black",
                               "Percent Hispanic","Percent Asian"),selected="Percent White"),
      sliderInput("range",h3('Range of interest'),min = 0,max=100,value=c(0,100))
    ),
    mainPanel(
      plotOutput("map")
    )
  )
  
)
server<-function(input,output){
  output$map<-renderPlot({
    data<-switch (input$select,
                  "Percent White"=counties$white,
                  "Percent Black"=counties$black,
                  "Percent Hispanic"=counties$hispanic,
                  "Percent Asian"=counties$asian
    )
    color<-switch (input$select,
                   "Percent White"="darkgreen",
                   "Percent Black"="black",
                   "Percent Hispanic"="darkorange",
                   "Percent Asian"="darkviolet"
    )
    legend<-switch (input$select,
                    "Percent White"="% White",
                    "Percent Black"="% Black",
                    "Percent Hispanic"="% Hispanic",
                    "Percent Asian"="% Asian"
    )
    
    percent_map(data,color = color,legend.title=legend,max=input$range[2],min=input$range[1])
  })
}

shinyApp(ui,server)