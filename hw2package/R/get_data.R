#' returns college basketball data
#'
#'   
#' 
#' @return college basketball data collected and manipulated from "http://kenpom.com/cbbga22.txt"
#'
#'
#' @export
#' 
#' @examples
#' get_data()
get_data <- function(){
  temp <- tempfile()
  download.file("http://kenpom.com/cbbga22.txt", temp)
  data <- read_fwf(temp)
  
  data <- data%>%
    rename( date = X1, away = X2, away_score = X3, home = X4, home_score = X5 )%>%
    mutate(point_diff = home_score - away_score)%>%
    select(-c(X6, X7))
  
  data$date <- mdy(data$date)
  
  unlink(temp)
  
  data
}