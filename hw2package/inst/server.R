###Homework 2 server#####

server <- function(input, output){
  output$plot <- renderPlot({
    plot(game_graph(input$team,  basketball))
  })
  output$table <- renderTable(
    team_select(input$team, basketball, chr = T)
  )
  output$plot2 <- renderPlot({
    plot(date_graph(input$team, basketball))
  })
  output$table2 <- renderTable(
    point_diff(input$team, basketball)
  )
}

