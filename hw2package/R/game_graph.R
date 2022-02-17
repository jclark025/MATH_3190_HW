#' Returns a graph of a basketball team's point differential per game
#' 
#' 
#' 
#'
#' @param team college basketball team to search visualize
#' @param data a df containing college baskeball games
#'
#' @return a graph showing point differential by game
#'
#'
#' @export
#' 
#' @examples
#' game_graph("Southern Utah", basketball_2022)
#' 
game_graph <- function(team, data){
  
  data <- team_select(team, data)
  
  ##change point differential to perspective of selected team instead of home team
  data$point_diff <- ifelse(data$away == team, -data$point_diff, data$point_diff)
  
  ##add opponent variable
  data$opp <- ifelse(data$away == team, data$home, data$away)
  
  ##create variable for if they won
  data$Result <- as.factor(ifelse(data$point_diff > 0, "Win", "Loss"))
  
  data <- data %>%
    arrange(date)
  
  ggplot(data,aes(x = point_diff, y = opp, fill= Result) ) + geom_bar(stat = 'identity') + geom_vline(xintercept = 0) + 
    labs(x = "Point Differential",y = "Opponent", title = paste(team,"Point Difference by Game") )
  
}