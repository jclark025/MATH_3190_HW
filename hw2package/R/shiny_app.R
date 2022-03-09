#' Runs college basketball shiny app
#' must have df named basketball in environment
#'
#' @param directory the file directory that contains ui and server
#'   
#' 
#' @return college basketball shiny app
#'
#'
#' @export
#' 
#' @examples
#' shiny_app("C:/Users/James/OneDrive/School/MATH_3190/github/hw2package/inst")
shiny_app <- function(directory){
  setwd(directory)
  source("ui.R")
  source("server.R")
  
  shinyApp(server = server, ui = ui)
}
