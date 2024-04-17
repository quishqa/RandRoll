# Creating a sample data.frame
set.seed(9999)

pm25 <- runif(100, -1, 35)
co <- runif(100, -1, 5)

date <- seq(
  as.POSIXct("2023-01-01"),
  length.out = length(pm25),
  by = "day"
)

daily_pol <- data.frame(
  date = date,
  pm25 = pm25,
  co = co
)

day_over_who <- subset(dayly_pm25, pm25 > 15 & co > 4)
na_over_who <- subset(dayly_pm25, pm25 < 0)
