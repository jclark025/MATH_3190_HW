###kmeans ui####

ui <- fluidPage(
  
  # Put a titlePanel here
  titlePanel("k-means clustering"),
  
  sidebarLayout(
    # Sidebar. Put your inputs inside the sidebarPanel
    sidebarPanel(
      selectInput('xcol', 'X Variable', names(iris)),
      selectInput('ycol', 'Y Variable', names(iris),
                  selected=names(iris)[[2]]),
      numericInput('clusters', 'Cluster count', 3,
                   min = 1, max = 9)
    ),
    
    # Main panel. put your output plot here
    mainPanel(
      plotOutput('plot1')    )
  ),


# Put a titlePanel here
titlePanel("kNN"),

sidebarLayout(
  # Sidebar. Put your inputs inside the sidebarPanel
  sidebarPanel(
    selectInput('xcol2', 'X Variable', names(iris)),
    selectInput('ycol2', 'Y Variable', names(iris),
                selected=names(iris)[[2]]),
    numericInput('k', 'k neighbors', 3,
                 min = 1, max = 9)
  ),
  
  # Main panel. put your output plot here
  mainPanel(
    plotOutput('plot2')    )
),

# Put a titlePanel here
titlePanel("Principle Component Analysis"),

sidebarLayout(
  # Sidebar. Put your inputs inside the sidebarPanel
  sidebarPanel(
    numericInput("xpca", "Principle Component",1, min = 1, max = 4),
    numericInput("ypca", "Principle Component",2, min = 1, max = 4)
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

