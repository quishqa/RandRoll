library(limaair)
library(maps)
library(mapdata)

start_date <- "01/02/2023"
end_date <- "07/02/2023"

aqs_codes <- c(112265, 112193)
pm25_code <- "N_PM25"

aqs_lat_lon <- senamhi_aqs[senamhi_aqs$code %in% aqs_codes, ]
pm25 <- download_senamhi_pol(aqs_codes, 
                             pm25_code,
                             start_date,
                             end_date)

png("map_two_aqs.png", res = 300, height = 5, width = 10,
    units = "in")
par(mfrow = c(1, 3))
map("worldHires", regions = "Peru",
    ylim = c(-12.5, -11.5), xlim = c(-77.5, -76.5))
points(aqs_lat_lon$lon[1], aqs_lat_lon$lat[1], col = "red" )
points(aqs_lat_lon$lon[2], aqs_lat_lon$lat[2], col = "blue" )
axis(1)
axis(2)
box()

plot(pm25[[1]]$date, pm25[[1]]$pm25, t = "l", lwd = 1.5, col = "red",
     ylab = "PM2.5", xlab = "2023", ylim = c(0, 45),
     main = unique(pm25[[1]]$aqs))

plot(pm25[[2]]$date, pm25[[2]]$pm25, t = "l", lwd = 1.5, col = "blue",
     ylab = "PM2.5", xlab = "2023", ylim = c(0, 45),
     main = unique(pm25[[2]]$aqs))
dev.off()