deg2rad <- function(angle){
  rad <- angle * pi / 180
  return(rad)
}

met2math <- function(winds){
  winds$u <- - winds$ws * sin(deg2rad(winds$wd))
  winds$v <- - winds$ws * cos(deg2rad(winds$wd))
  return(winds)
}

test_data <- data.frame(
  ws = rep(1, 4),
  wd = c(0, 90, 180, 270)
) 
