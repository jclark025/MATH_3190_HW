#' Returns data frame of teams point diff home and away
#' 
#' 
#' 
#'
#' @param team college basketball team to search for
#' @param data a df containing college baskeball games
#'
#' @return point differential for selected team for both home and away games
#'
#'
#' @export
#' 
#' @examples
#' point_diff("Southern Utah", basketball_2022)

point_diff <- function(team, data){
team_select(team, data) %>%
  mutate(home_team = ifelse(home == team, "Home", "Away"),
         score = ifelse(home == team, home_score, away_score),
         opp_score = ifelse(home == team, away_score, home_score) ) %>%
  group_by(home_team) %>%
  summarise(avg_point_diff = mean(point_diff),
            avg_score = mean(score),
            avg_opp_score = mean(opp_score) )
}