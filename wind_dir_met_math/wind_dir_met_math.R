deg2rad <- function(deg){
  rad <- deg * pi / 180
  return(rad)
}

rad2deg <- function(rad){
  deg <- rad * 180 / pi
  return(deg)
}

wind_components <- function(ws, wd){
  u <- -ws * sin(deg2rad(wd))
  v <- -ws * cos(deg2rad(wd))
  ans <- data.frame(u = u, v = v)
  return(ans)
}

wd_from_components <- function(u, v){
  wd <- rad2deg(atan2(-u, -v))
  wd[wd < 0] <- wd[wd < 0] + 360
  return(wd)
}

test_data <- data.frame(
  ws = rep(1, 4),
  wd = c(0, 90, 180, 270)
) 

test_data$u <- wind_components(test_data$ws, test_data$wd)$u
test_data$v <- wind_components(test_data$ws, test_data$wd)$v

test_uv <- data.frame(
  u = c(0, 0, 1, 1, -1, -1, 1, -1),
  v = c(1, -1, 1, -1, 1, -1, 0, 0),
  wd_ori = c(180, 0, 225, 315, 135, 45, 270, 90)
)

test_uv$wd <- wd_from_components(test_uv$u, test_uv$v)






