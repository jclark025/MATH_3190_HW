#' Returns winning percentage and win/loss record for a given college basketball team.
#' 
#' 
#' 
#'
#' @param team college basketball team to search for
#' @param data a df containing college baskeball games
#'
#' @return Winning percentage as well as total wins and losses
#'
#'
#' @export
#' 
#' @examples
#' win_per("Southern Utah", basketball_2022)
#' 

win_per <- function(team, data){
  team_data <- team_select(team, data)
  
  team_data %>%
    mutate(win = ifelse(
      (away == team & point_diff <0 ) | (home == team & point_diff > 0),
      1,0
    )) %>%
    summarise(win_per = sum(win)/ n(), wins = sum(win), losses = n() - wins)
}