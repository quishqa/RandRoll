library(qualR)

# Downloading O3 data for one week ----------------------------------------

start_date <- "06/01/2020"
end_date <- "12/01/2020"

rj_aqs <- monitor_ar_aqs

O3 <- lapply(rj_aqs$code, MonitorArRetrieve,
             start_date = start_date,
             end_date = end_date,
             param = "O3")



# Function plot data in list ----------------------------------------------

PlotFromList <- function(df, aqs_data=rj_aqs){
  code <- unique(df$aqs)
  title <- aqs_data$name[aqs_data$code == code]
  file_name <- paste0(code, "_o3.png")
  
  if (is.na(unique(df$O3)[1])){
    print("No data available")
  } else {
    png(file_name, height = 550, width = 760)
    plot(df$date, df$O3, t = "l", col = "Red", lwd = 2.5,
         main = title,
         xlab = " ",
         ylab = expression("O"[3] * " (" * mu * "g m"^-3 * ")"))
    dev.off()
  }
}


# Plotting  ---------------------------------------------------------------
lapply(O3, PlotFromList)


# Function to plot from data frame ----------------------------------------

all_aqs_o3 <- do.call(rbind, O3) # Merging all data in one data frame

PlotFromDataFrame <- function(df, code, aqs_data=rj_aqs){
  aqs <- subset(df, subset = aqs == code)
  title <- aqs_data$name[aqs_data$code == code]
  file_name <- paste0(code, "_df_o3.png")
  
  if (is.na(unique(aqs$O3)[1])){
    print("No data available")
  } else {
    png(file_name, height = 550, width = 760)
    plot(aqs$date, aqs$O3, t = "l", col = "green", lwd = 2.5,
         main = title,
         xlab = " ",
         ylab = expression("O"[3] * " (" * mu * "g m"^-3 * ")"))
    dev.off()
  }
}