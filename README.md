# gtrendsR_Daily_Long_History
Use gtrendsR to obtain Google Trends Data on a daily granularity for a period longer than 90 days

## Details
This R script is using the gtrendsR package to retrieve daily google trends interest over time data for selected keywords, regions, country and channel, for periods over 90 days. Google trends doesn't allow daily level data for calls with period longer than 90 days and this short script is the quick solution I came up with. 

## Author's note
It's not a production level code but for the purposes of getting the data needed and testing the model before production is good. 

## Contribute
If you wish to contribute to clean up the code and make it more flexible and more production level, your contributions are welcomed.

Please clone the repository on your machine and send a pull request for your contributions.

## Bugs
If something doesn't work or you have a question, please get in-touch tasos@tasospardalis.com

# The second R script is map_gt_regions.R

There are two R scripts in this repository. The first is to allow us to call daily Google Trends data over a long period of time. The second one is to map the GTrends "geo" variable with a region_key variable. The reason for taking such an approach is in case you want to merge your GTrends data with more data to enhance a model.