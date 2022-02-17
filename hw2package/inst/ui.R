###Homework 2 UI####
ui <- fluidPage(
  textInput(inputId = "team",
            label = "Select a Team", 
            value = "Southern Utah"
            ),
  plotOutput("plot"),
  tableOutput("table")
)

