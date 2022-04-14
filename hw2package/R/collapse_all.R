#' returns collapsed data for college basketball
#' 
#'
#'
#'
#' @return df with collapsed basketball data for all teams
#'
#'
#' @export
#' 
#' @examples
#' 
#' collapse_all()
collapse_all <- function(){
  
  basketball <- get_data()
  
  teams <- unique(basketball$home)
  
  data2 <- NA
  
  for (i in teams){
    data <- team_collapse(i, basketball)
    data2 <- rbind(data2, data)
  }
  
  basketball2 <- data2[-1,]
  basketball2 %>%
    select(-point_diff, -point_diff_away, - point_diff_home)
}