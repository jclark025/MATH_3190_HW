#' Returns a df of observations with thier assigned cluster
#' 
#'
#' @param x the x variable to cluster on
#' @param y the y variable to cluster on
#' @param clust the number of clusters to create
#' @param n number of iterations for k-means to run
#'
#'
#' @return df with assigned cluster
#'
#'
#' @export
#' 
#' @examples
#' data(iris)
#' kmeans(iris$Sepal.Length, iris$Sepal.Width, 4, 10)

k_means <- function(x, y, clust, n){
  
  ##Set initial midpoints
  x_clust <- runif(clust, min = min(x), max = max(x))
  y_clust <- runif(clust, min = min(y), max = max(y))
  
  clusters <- data.frame(x_clust, y_clust)
  
  ##find the nearest cluster midpoint for each point
  data <- data.frame(x, y)
  
  ##initialize variables
  
  ##set as large value that no point could have a greater distance than
  data$min_dist <- 2 * (max(x)^2+max(y)^2)
  data$dist <- NA
  data$clust <- NA
  
  ##Itterate n many times
  for (j in 1:n){    
    
    ## Finds nearest midpoint for each point  
    for (i in 1:clust){
      ##Calculates distance 
      data$dist <- sqrt( (x-clusters$x_clust[i])^2+(y-clusters$y_clust[i])^2)
      
      ##redefine cluster if midpoint is closer    
      data$clust <- ifelse(data$dist < data$min_dist, i, data$clust)
      
      ##adjust min dist if needed
      data$min_dist <- ifelse(data$dist < data$min_dist, data$dist, data$min_dist)
      
      
    }
    
    ##Re-assign cluster centers
    clusters_new <- data %>%
      group_by(clust) %>%
      summarise(x_avg = mean(x), 
                y_avg = mean(y)) %>%
      arrange(clust)
    
    clusters$x_clust <- clusters_new$x_avg
    clusters$y_clust <- clusters_new$y_avg
    
  }
  data %>%
    select(x, y, min_dist, clust)
}