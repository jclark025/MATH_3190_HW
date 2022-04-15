###Homework 2 server#####
basketball <- get_data()


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
  
  ##Principle component analysis
  
  x <- collapse_all()[,2:10]
  
  pca <- prcomp(  t(x)  )
  
  selectedx3 <- reactive({
    pca$x[,input$xpca]
  })
  selectedy3 <- reactive({
    pca$x[,input$ypca]
  })
  
  
  data3 <- reactive({cbind(selectedx3(), as.data.frame(selectedy3())  )})
  
  output$plot3 <- renderPlot({
    ggplot(data3(), aes(x = data3()[,1], y = data3()[,2])) + geom_point()+
      labs(x = paste0("PC", input$xpca),y=paste0("PC", input$ypca))
  })
  
  ##Umap
  data4 <- as.data.frame(umap(x)$layout)
  
  output$plot4 <- renderPlot({
    ggplot(data4, aes(x = data4[,1], y = data4[,2])) + geom_point()+labs(x ="X1", y = "X2")
  })
}

