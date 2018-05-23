#!/usr/bin/env Rscript

# usage: /usr/local/bin/Rscript visually_explore_csv_with_visdat_plots.R /path/to/file.csv width height resolution
# usage: /usr/local/bin/Rscript visually_explore_csv_with_visdat_plots.R /path/to/test.csv 10 10 150

# auto-configure visdat package, if not available
options(warn=-1)
list.of.packages <- c("visdat")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages, repos='https://cran.rstudio.com/')
suppressPackageStartupMessages(require(visdat))

# read command-line arguments
args <- commandArgs(TRUE)
input.file <- args[1]; plot.width <- as.numeric(args[2])
plot.height <- as.numeric(args[3]); plot.resolution <- as.numeric(args[4])

# read csv file, assign 'NA' to blanks
data <- read.csv(input.file, header=TRUE, na.strings="")

# plot visdat output in png format
output.file <- sub(".csv", ".csv.png", input.file)
png(output.file, width=plot.width, height=plot.height, units='in', res=plot.resolution)
vis_dat(data, sort_type = FALSE)
dev.off()
