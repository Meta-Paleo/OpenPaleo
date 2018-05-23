
#!/usr/bin/env Rscript

# usage: /usr/local/bin/Rscript visually_explore_tsv_with_visdat_plots.R <arg1> <arg2> <arg3> <arg4>
# arg 1: <str> /path/to/csv/file
# arg 2: <int> plot width (10)
# arg 3: <int> plot height (10)
# arg 4: <int> plot resolution (150)

# auto-configure visdat package, if not available
options(warn=-1)
list.of.packages <- c("visdat", "readr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages, repos='https://cran.rstudio.com/')
suppressPackageStartupMessages(require(visdat))
suppressPackageStartupMessages(require(readr))

# read command-line arguments
args <- commandArgs(TRUE)
input.file <- args[1]; plot.width <- as.numeric(args[2])
plot.height <- as.numeric(args[3]); plot.resolution <- as.numeric(args[4])

# read tsv file with readr
data <- read_tsv(input.file, col_names = TRUE)

# plot visdat output in png format
output.file <- sub(".tsv", ".tsv.png", input.file)
png(output.file, width=plot.width, height=plot.height, units='in', res=plot.resolution)
vis_dat(data, sort_type = FALSE, palette = "default")
dev.off()


