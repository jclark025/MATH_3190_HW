#' Returns a graph of points scored by date
#' 
#' 
#' 
#'
#' @param team college basketball team to search for
#' @param data a df containing college baskeball games
#'
#' @return returns a ggplot graph of the points scored by selected team
#'
#'
#' @export
#' 
#' @examples
#' date_graph("Southern Utah", basketball_2022)

date_graph <- function(team, data){
  data <- team_select(team, data) %>%
    mutate(home_team = ifelse(home == team, "Home", "Away"),
           score = ifelse(home == team, home_score, away_score),
           opp_score = ifelse(home == team, away_score, home_score),
           Result = ifelse(
             (away == team & point_diff <0 ) | (home == team & point_diff > 0),
             "Win","Loss"
           ))
  
  ggplot(data, aes(x = date, y = score, fill = Result)) + geom_col() + labs(x = "Date",
                                                                           y = "Score",
                                                                           title = "Score by Date")
}