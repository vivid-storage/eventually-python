#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(reticulate)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Eventually Python"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      textInput("linkify", label = h3("Linkify this"), value = "Example github.com"), 
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tableOutput("python")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$python <- renderTable({
    source_python("linkify.py")
    linkify(input$linkify)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
