#######kmeans server#######
server <- function(input, output, session) {
  
  selectedx <- reactive({
    iris[,input$xcol]
  })
  selectedy <- reactive({
    iris[,input$ycol]
  })
  
  
  clusters <-reactive({
    kmeans(selectedx(), selectedy(), input$clusters, 10)
  })
  
  output$plot1 <- renderPlot({
    k_viz(clusters(), input$xcol, input$ycol)
  })
}