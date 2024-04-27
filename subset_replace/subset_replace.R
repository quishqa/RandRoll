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

# Finding over the air quality standard for PM25
over_who_pm25 <- subset(daily_pol, subset = pm25 > 15)
nrow(over_who_pm25)

# Finding over the air quality standard for PM25 and select
# columns
over_who_pm25 <- subset(daily_pol,
                        subset = pm25 > 15,
                        select = c("date", "pm25"))

# Finding days over PM25 and CO air quality standard
day_over_who <- subset(daily_pol,
                       subset = pm25 > 15 & co > 4)
nrow(day_over_who)

# Cleaning negative data
daily_pol_clean <- replace(daily_pol,
                           daily_pol < 0,
                           NA)

daily_pol$pm25 <- replace(daily_pol$pm25,
                          daily_pol$pm25,
                          NA)


