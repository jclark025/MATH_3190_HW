#' Returns graph of cluster output from kmeans
#' 
#'
#' @param data df returned from the pca or umap functions
#' @param xlab the xlabel for the graph
#' @param ylab the ylabel for the graph
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
#' k_viz(df, "X label", "Y label")

k_viz2 <- function(data, xlab, ylab){
  
  ggplot(data, aes(x = data[,1], y = data[,2], color = as.factor(data[,3]) ) ) +
    geom_point() + labs(x = xlab, y = ylab, color = "Species")
}
