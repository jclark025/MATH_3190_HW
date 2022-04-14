###Homework 2 UI####
ui <- fluidPage(
  textInput(inputId = "team",
            label = "Select a Team", 
            value = "Southern Utah"
  ),
  plotOutput("plot"),
  tableOutput("table"),
  plotOutput("plot2"),
  tableOutput("table2"),
  
  # Put a titlePanel here
  titlePanel("Principle Component Analysis"),
  
  sidebarLayout(
    # Sidebar. Put your inputs inside the sidebarPanel
    sidebarPanel(
      numericInput("xpca", "Principle Component",1, min = 1, max = 9),
      numericInput("ypca", "Principle Component",2, min = 1, max = 9)
    ),
    
    # Main panel. put your output plot here
    mainPanel(
      plotOutput('plot3')    )
  ),
  
  # Put a titlePanel here
  titlePanel("Umap"),
  
  # Main panel. put your output plot here
  mainPanel(
    plotOutput('plot4')    )
  
  
)

