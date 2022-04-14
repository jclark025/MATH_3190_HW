#' Returns a row of college basketball total, home, and away stats
#' 
#'
#' @param team the team to search for
#' @param y a df containing college basketball data
#'
#'
#' @return df with college basketball stats
#'
#'
#' @export
#' 
#' @examples
#' basketball <- get_data()
#' team_collapse("Southern Utah", basketball)
team_collapse <- function(team, data){
  
  ##get scores in team perspective
  data$team_score <- ifelse(data$home == team, data$home_score, data$away_score)
  data$opp_score <- ifelse(data$home != team, data$home_score, data$away_score)
  
  ##binary for if home game
  data$home_game <- ifelse(data$home == team, 1,0)
  
  ##alter point diff and create win variable
  data$point_diff <- data$team_score - data$opp_score
  data$win <- ifelse(data$point_diff > 0, 1, 0)
  
  
  ##summarise the data
  data2 <- data %>%
    group_by(home_game) %>%
    summarise(win_per = mean(win), 
              points = mean(team_score),
              opp_points = mean(opp_score),
              point_diff = mean(point_diff),
              ID = team)
  
  data_total <- data %>%
    summarise(win_per = mean(win), 
              points = mean(team_score),
              opp_points = mean(opp_score),
              point_diff = mean(point_diff),
              ID = team)
  
  away <- data2[1,2:6]
  home <- data2[2,2:6]
  
  data3 <- inner_join(away, home, by = "ID", suffix = c("_away", "_home"))
  data4 <- inner_join(data_total, data3, by = "ID")
  
  data4 %>%
    relocate(ID)
}