#########################################
#' @author Tasos Pardalis (tdalis on Github)
#' @description This short script takes the regional keys used by the weather dataset and matches them to GTrends geo variable
#' @details This is helpful for when we want to merge data from different sources and the region_key variable is the common variable amongst the different datasets
#########################################

# Set your working directory
setwd("/YourDirectory")

# import google regional level data
df <- read.csv("gtrends_data.csv")

# unique(df$geo)
library(plyr)
library(tidyverse)

# # Hamburg + Bremen + Lower Saxony
# DEU01 <- c("DE-HH", "DE-HB", "DE-NI")
# # Nordrhein-Westfalen (Dortmund)
# DEU02 <- c("DE-NW") 
# # Hessen (Frankfurt) + Rhineland-Palatinate + Saarland
# DEU03 <- c("DE-HE", "DE-RP", "DE-SL")
# # Baden-Wurttemberg (Stuttgard)
# DEU04 <- c("DE-BW")
# # Bayern (Munich)
# DEU05 <- c("DE-BY")
# # Berlin + Saxony
# DEU06 <- c("DE-BE", "DE-BB", "DE-ST")
# # Mecklenburg (Berlin)
# DEU07 <- c("DE-MV")
# # Thuringen (Leipzig)
# DEU08 <- c("DE-TH")
# # Frankfurt (am)
# # DEU00 <- c("DE-HE")

# Define region keys in a region_key vector element
region_key <- c("DEU01", "DEU01", "DEU01", "DEU02", "DEU03", "DEU03", "DEU03", "DEU04", "DEU05", "DEU06", "DEU06", "DEU06", "DEU07", "DEU08")

# define geo corresponding to each regional key above assigned in the "geo" vector element
geo <- c("DE-HH", "DE-HB", "DE-NI", "DE-NW", "DE-HE", "DE-RP", "DE-SL", "DE-BW", "DE-BY", "DE-BE", "DE-BB", "DE-ST", "DE-MV", "DE-TH")

# combine the region_key and geo columns to create the regions matrix
regions <- cbind(region_key, geo)

# merge the df of Gtrends with the regions matrix by the common variable "geo" to create the df_final
df_final <- merge(df, regions, "geo")

# Check that each region_key is in the data by checking the unique region keys
unique(df_final$region_key)

# Export df_final as a csv in your working directory or any directory of your choice
write.csv(df_final, "/YourDirectory/gdr_final.csv", row.names = FALSE)
