###Homework 2 server#####

server <- function(input, output){
  output$plot <- renderPlot({
    plot(game_graph(input$team,  basketball))
  })
  output$table <- renderTable(
  team_select(input$team, basketball, chr = T)
  )
}

