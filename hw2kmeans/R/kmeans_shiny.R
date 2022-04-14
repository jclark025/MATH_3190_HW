#' Runs kmeans app on iris dataset
#' must have iris df loaded
#'
#' @param directory the file directory that contains ui and server
#'   
#' 
#' @return kmeans shiny app
#'
#'
#' @export
#' 
#' @examples
#' data(iris)
#' shiny_app("C:/Users/James/OneDrive/School/MATH_3190/github/hw2kmeans/inst")
shiny_app <- function(directory){
  setwd(system.file("shiny",package = "hw2kmeans" ))
  source("ui.R")
  source("server.R")
  shinyApp(server = server, ui = ui)
}
