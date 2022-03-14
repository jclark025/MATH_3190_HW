###Homework 2 UI####
ui <- fluidPage(
  textInput(inputId = "team",
            label = "Select a Team", 
            value = "Southern Utah"
  ),
  headerPanel("Opponent Summary"),
  plotOutput("plot"),
  
  headerPanel("Game Data"),
  tableOutput("table"),
  
  headerPanel("Scoring Trends"),
  plotOutput("plot2"),
  
  headerPanel("Home/Away"),
  tableOutput("table2")
)

