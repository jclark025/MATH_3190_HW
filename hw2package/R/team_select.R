#' Returns games played by a college basketball team
#' 
#' 
#' 
#'
#' @param team college basketball team to search for
#' @param data a df containing college baskeball games
#' @param chr returns dates as a character if == TRUE
#'
#' @return all games played by team
#'
#'
#' @export
#' 
#' @examples
#' team_select("Southern Utah", basketball_2022)


team_select <- function(team, data, chr = FALSE){
  if(chr == TRUE){
    data %>%
      filter(home == team | away == team) %>%
      arrange(date) %>%
      ##this preserves date format for shiny interface
      mutate(date = as.character(date))
  }
  else
    data %>%
    filter(home == team | away == team) %>%
    arrange(date) 
}
  