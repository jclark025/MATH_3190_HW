#' Returns graph of cluster output from kmeans
#' 
#'
#' @param data df returned from the kmeans function
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

k_viz <- function(data, xlab, ylab){
  ggplot(data, aes(x = data[,1], y = data[,2], color = as.factor(data[,4]) ) ) + geom_point() + 
    scale_color_discrete(name = "Cluster") + labs(x = xlab, 
                                                  y = ylab)
}