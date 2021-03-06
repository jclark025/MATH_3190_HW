% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/k_viz.R
\name{k_viz}
\alias{k_viz}
\title{Returns graph of cluster output from kmeans}
\usage{
k_viz(data, xlab, ylab, i)
}
\arguments{
\item{data}{df returned from the kmeans or knn function}

\item{xlab}{the xlabel for the graph}

\item{ylab}{the ylabel for the graph}

\item{i}{1:kmeans 2:kNN}
}
\value{
plot of clusters
}
\description{
Returns graph of cluster output from kmeans
}
\examples{
data(iris)
df <- kmeans(iris$Sepal.Length, iris$Sepal.Width, 4, 10)
k_viz(df, "X label", "Y label", 2)
}
