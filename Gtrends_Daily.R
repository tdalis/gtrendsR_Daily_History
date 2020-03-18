#########################################################
#' @author Tasos Pardalis
#' @description Use gtrendsR to obtain Google Trends Data on a daily granularity for a period longer than 90 days
#' @details This R script is using the gtrendsR package to retrieve daily google trends interest over time data for selected keywords, regions, country 
#' and channel, for periods over 90 days. Google trends doesn't allow daily level data for calls with period longer than 90 days and this short script 
#' is the quick solution I came up with.
#' It's not a production level code but for the purposes of getting the data needed and testing the model before production is good. 
#########################################################

#set working directory
getwd()
setwd("/YourDirectory/GTrends")

###############################################

#Install libraries
library (gtrendsR)
library (dplyr)
#install.packages("tidyverse")
library(tidyverse)
#install.packages("lubridate")
library(lubridate)

#define the keywords
keywords1 <- c("dobendan", "erkältung", "bei erkältung","soledum", "bronchitis")
keywords2 <- c("cold", "cold and flu", "flu", "sinupret forte", "pollen")
keywords3 <- c("gelomyrtol", "grippostad", "lemsip", "beechams", "benylin")
keywords4 <- c("colds", "hot toddy", "na suchy kaszel", "sinupret", "syrop na kaszel")
keywords5 <- c("hosta", "hostmedicin", "forkylning", "mal di gola", "tosse")
keywords6 <- c("tosse secca", "rimedi tosse secca", "lungebetændelse", "verkouden", "verkoudheid")
keywords7 <- c("hayfever", "headache", "stomach ache", "dizzy", "nurofen")
#Set the geographical area
country <- c('DE')
region1 <- c('DE-BW', 'DE-BY', 'DE-BE', 'DE-BB', 'DE-HB')
region2 <- c('DE-HH', 'DE-HH', 'DE-HE', 'DE-MV', 'DE-NI')
region3 <- c('DE-NW','DE-RP','DE-SL', 'DE-TH','DE-ST')
#langauge <- c('DEU', 'ITA', 'UKI', 'POL', 'SWE', 'DNK', 'NED')
german <- c('de')
#set channels
channel <- "web"
#set the time windows
time1 <- ("2019-11-11 2020-01-31")
time2 <- ("2020-02-01 2020-03-17")
# time3 <- ("2013-06-30 2013-09-27")
# time4 <- ("2013-09-28 2013-12-26")
# time5 <- ("2013-12-27 2014-03-26")
# time6 <- ("2014-03-27 2014-06-24")
# time7 <- ("2014-06-25 2014-09-22")
# time8 <- ("2014-09-23 2014-12-21")
# time9 <- ("2014-12-22 2015-03-21")
# time10 <- ("2015-03-22 2015-06-19")
# time11 <- ("2015-06-20 2015-09-17")
# time12 <- ("2015-09-18 2015-12-16")
# time13 <- ("2015-12-17 2016-03-15")
# time14 <- ("2016-03-16 2016-06-13")
# time15 <- ("2016-06-14 2016-09-11")
# time16 <- ("2016-09-12 2016-12-10")
# time17 <- ("2016-12-11 2017-03-10")
# time18 <- ("2017-03-11 2017-06-08")
# time19 <- ("2017-06-09 2017-09-06")
# time20 <- ("2017-09-07 2017-12-05")
# time21 <- ("2017-12-06 2018-03-05")
# time22 <- ("2018-03-06 2018-06-03")
# time23 <- ("2018-06-04 2018-09-01")
# time24 <- ("2018-09-02 2018-11-30")
# time25 <- ("2018-12-01 2019-02-28")
# time26 <- ("2019-03-01 2019-05-29")
# time27 <- ("2019-05-30 2019-08-27")
# time28 <- ("2019-08-27 2019-11-10")

# craete a list with calls on country level for the 28 time intervals and the 7 keyword groups
trendsG_country <- list(c(gtrends(keyword = keywords1, geo = country, time = time1, hl = german)$interest_over_time),
                c(gtrends(keyword = keywords1, geo = country, time = time2, hl = german)$interest_over_time),
                c(gtrends(keyword = keywords2, geo = country, time = time1, hl = german)$interest_over_time),
                c(gtrends(keyword = keywords2, geo = country, time = time2, hl = german)$interest_over_time),
                c(gtrends(keyword = keywords3, geo = country, time = time1, hl = german)$interest_over_time),
                c(gtrends(keyword = keywords3, geo = country, time = time2, hl = german)$interest_over_time),
                c(gtrends(keyword = keywords4, geo = country, time = time1, hl = german)$interest_over_time),
                c(gtrends(keyword = keywords4, geo = country, time = time2, hl = german)$interest_over_time),
                c(gtrends(keyword = keywords5, geo = country, time = time1, hl = german)$interest_over_time),
                c(gtrends(keyword = keywords5, geo = country, time = time2, hl = german)$interest_over_time),
                c(gtrends(keyword = keywords6, geo = country, time = time1, hl = german)$interest_over_time),
                c(gtrends(keyword = keywords6, geo = country, time = time2, hl = german)$interest_over_time),
                c(gtrends(keyword = keywords7, geo = country, time = time1, hl = german)$interest_over_time),
                c(gtrends(keyword = keywords7, geo = country, time = time2, hl = german)$interest_over_time))

# craete a list with calls on region level for the 28 time intervals and the 7 keyword groups
trendsG_region <- list(c(gtrends(keyword = keywords1, geo = region1, time = time1, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords1, geo = region1, time = time2, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords1, geo = region2, time = time1, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords1, geo = region2, time = time2, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords1, geo = region3, time = time1, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords1, geo = region3, time = time2, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords2, geo = region1, time = time1, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords2, geo = region1, time = time2, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords2, geo = region2, time = time1, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords2, geo = region2, time = time2, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords2, geo = region3, time = time1, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords2, geo = region3, time = time2, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords3, geo = region1, time = time1, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords3, geo = region1, time = time2, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords3, geo = region2, time = time1, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords3, geo = region2, time = time2, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords3, geo = region3, time = time1, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords3, geo = region3, time = time2, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords4, geo = region1, time = time1, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords4, geo = region1, time = time2, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords4, geo = region2, time = time1, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords4, geo = region2, time = time2, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords4, geo = region3, time = time1, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords4, geo = region3, time = time2, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords5, geo = region1, time = time1, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords5, geo = region1, time = time2, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords5, geo = region2, time = time1, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords5, geo = region2, time = time2, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords5, geo = region3, time = time1, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords5, geo = region3, time = time2, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords6, geo = region1, time = time1, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords6, geo = region1, time = time2, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords6, geo = region2, time = time1, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords6, geo = region2, time = time2, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords6, geo = region3, time = time1, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords6, geo = region3, time = time2, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords7, geo = region1, time = time1, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords7, geo = region1, time = time2, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords7, geo = region2, time = time1, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords7, geo = region2, time = time2, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords7, geo = region3, time = time1, hl = german)$interest_over_time),
                       c(gtrends(keyword = keywords7, geo = region3, time = time2, hl = german)$interest_over_time))



# transform trendsG list to a dataframe
trends_countrydf <- do.call(rbind.data.frame, trendsG_country)

trends_regionsdf <- do.call(rbind.data.frame, trendsG_region)

# convert unix timestamps to dates
#install.packages("anytime")
library(anytime)

trends_countrydf$date <- anydate(trends_countrydf$date)

trends_regionsdf$date <- anydate(trends_regionsdf$date)
  
# export df to csv
write.csv(trends_countrydf, "/YourDirectory/country_level_daily.csv", row.names = FALSE)
write.csv(trends_regionsdf, "/YourDirectory/region_level_daily.csv", row.names = FALSE)