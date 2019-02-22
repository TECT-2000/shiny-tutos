library(shiny)

ui<-fluidPage(
  titlePanel("My shiny App"),
  sidebarLayout(
    sidebarPanel(h2("Installation"),
                 p("shiny is available on CRAN, so you can install it in the usual way from your R console : 
                   ",code('install.packages("shiny")')),
                 br(),
                 br(),
                 br(),
                 br(),
                 img(src="rstudio.png",align="center",width=150,heigth=30),
                 p("Shiny is a product of ",a(href="https://www.rstudio.com/","Rstudio."))),
    mainPanel(
      h1("Introducing Shiny"),
      p("Shiny is a new package from Rstudio that makes it incredibly easy to build interactive web applications with R."),
      p('For an introduction and live examples, visit the',a('Shiny homepage',href="https://shiny.rstudio.com")),
      br(),
      br(),
      br(),
      br(),
      h2("Features"),
      tags$ul(
        tags$li('Build useful web applications with only a few lines of code -- no javascript required.'),
         tags$li("Shiny applications are automatically 'live' in the same way that ",tags$b('spreadsheets'),"are live. Outputs charge instantly as users modify inputs,without requirring a reload of the browser."))
      
    
    )
)
)

server<-function(input, output){
  
  
}

shinyApp(ui,server)