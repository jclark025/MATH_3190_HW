#' Returns graph of cluster output from kmeans
#' 
#'
#' @param data df returned from the kmeans or knn function
#' @param xlab the xlabel for the graph
#' @param ylab the ylabel for the graph
#' @param i 1:kmeans 2:kNN
#'
#'
#' @return plot of clusters
#'
#'
#' @export
#' 
#' @examples
#' data(iris)
#' df <- kmeans(iris$Sepal.Length, iris$Sepal.Width, 4, 10)
#' k_viz(df, "X label", "Y label", 2)

k_viz <- function(data, xlab, ylab, i){
  
  graph_labs <- c("Cluster", "Predicted")
  
  ggplot(data, aes(x = data[,1], y = data[,2], shape = as.factor(data[,3]), color = as.factor(data[,4]) ) ) +
    geom_point() + labs(x = xlab, y = ylab, color = "Species", shape = graph_labs[i])
}
