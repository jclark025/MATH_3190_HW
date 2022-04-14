#######kmeans server#######
server <- function(input, output, session) {
  
  selectedx <- reactive({
    iris[,input$xcol]
  })
  selectedy <- reactive({
    iris[,input$ycol]
  })
  
  type <- iris$Species
  
  ##create clusters and assign to a data frame
  clusters <-reactive({
    kmeans(cbind(selectedx(), selectedy()), input$clusters)$cluster
  })
  
  data <- reactive({ as.data.frame(cbind(selectedx(), selectedy(), clusters(), as.data.frame(type) ) )
  })
  
  
  output$plot1 <- renderPlot({
    k_viz(data(), input$xcol, input$ycol, i = 1)
  })
  
  ###kNN
  
  selectedx2 <- reactive({
    iris[,input$xcol2]
  })
  selectedy2 <- reactive({
    iris[,input$ycol2]
  })
  
  ##create kNN predictions and assign to dat frame
  knn <- reactive({knn3(Species ~ ., data = iris , k = input$k)})
  preds <- reactive({predict(knn(), newdata = iris, type = "class")})
  
  data2 <- reactive({ as.data.frame(cbind(selectedx2(), selectedy2(), preds(), as.data.frame(type )) )
  })
  
  output$plot2 <- renderPlot({
    k_viz(data2(), input$xcol2, input$ycol2, i = 2)
  })
  
  ###Principle Component Analysis
  
  x <- iris[,1:4]
  
  pca <- prcomp(x)
  
  selectedx3 <- reactive({
    pca$x[,input$xpca]
  })
  selectedy3 <- reactive({
    pca$x[,input$ypca]
  })
  
  
  data3 <- reactive({cbind(selectedx3(), selectedy3(), as.data.frame(type) )})
  
  output$plot3 <- renderPlot({
    k_viz2(data3(), paste0("PC", input$xpca), paste0("PC", input$ypca))
  })
  
  
  ##Umap
  data4 <- cbind(umap(x)$layout, as.data.frame(type))

  output$plot4 <- renderPlot({
    k_viz2(data4, "X1", "X2")
  })
    
}