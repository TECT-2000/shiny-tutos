library(shiny)

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
      textOutput("value"),
      textOutput("rangeText")
      )
  )

)
server<-function(input,output){
  output$value<-renderText({
    paste("You have selected ",input$select)})
  output$rangeText<-renderText({
    paste("You have chosen a range that goes from",input$range[1]," to ", input$range[2])
  })
}

shinyApp(ui,server)