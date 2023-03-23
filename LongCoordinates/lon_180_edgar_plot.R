library(ncdf4)
library(fields)
library(viridis)

edgar <- nc_open("./v6.0_CH4_2018_TOTALS.0.1x0.1.nc")

lon <- ncvar_get(edgar, varid = "lon")
lat <- ncvar_get(edgar, varid = "lat")
ch4 <- ncvar_get(edgar, varid = "emi_ch4")

lon180 <- ((lon + 180) %% 360) - 180

nc_close(edgar)
ch4[ch4 <= 0] <- NA

image.plot(lon, lat, log(ch4),
           xlab = "Lon.", ylab= "Lat.",
           col = rev(viridis(200)))
map("world", add=T)

image.plot(lon180 , lat, log(ch4),
           xlab = "Lon.", ylab= "Lat.",
           col = rev(viridis(200)))
map("world", add=T)

log_ch4 <- log(ch4)
lon1 <- lon180[1:1800]
lon2 <- lon180[1801:3600]
rig <- log_ch4[1:1800,]
lef <- log_ch4[1801:3600,]


ch4_rev <- rbind(lef, rig)
lon_rev <- lon180[c(1801:3600,1:1800)]
image.plot(lon_rev, lat, log_ch4[c(1801:3600,1:1800),],
           xlab = "", ylab = "",
           col = rev(viridis(100)))
map('world', add = T, resolution = 0)
