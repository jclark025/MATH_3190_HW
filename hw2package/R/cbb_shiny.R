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
#' cbb_shiny()
cbb_shiny <- function(){
  setwd(system.file("shiny",package = "hw2package" ))
  source("ui.R")
  source("server.R")
  shinyApp(server = server, ui = ui)
}
