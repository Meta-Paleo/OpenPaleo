
#!/usr/bin/env Rscript

# usage: /usr/local/bin/Rscript oa_citations_stacked_density_plot.R <arg1> <arg2> <arg3> <arg4>
# arg 1: <str> /path/to/tsv/file
# arg 2: <int> plot width (15)
# arg 3: <int> plot height (10)
# arg 4: <int> plot resolution (150)

# auto-configure visdat package, if not available
options(warn=-1)
list.of.packages <- c("ggridges", "readr", "ggplot2", "tidyverse")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages, repos='https://cran.rstudio.com/')
suppressPackageStartupMessages(require(ggridges))
suppressPackageStartupMessages(require(readr))
suppressPackageStartupMessages(require(ggplot2))
suppressPackageStartupMessages(require(tidyverse))

# read command-line arguments
args <- commandArgs(TRUE)
input.file <- args[1]
plot.width <- as.numeric(args[2])
plot.height <- as.numeric(args[3]); plot.resolution <- as.numeric(args[4])

# read tsv file with readr
data <- read_tsv(input.file, col_names = TRUE)

# plot stacked density plot in png format
png("paleo_journals_citation_distribution_oa_status.png", width=plot.width, height=plot.height, units='in', res=plot.resolution)

ggplot(data, aes(x=cited_by, y=journal_name, fill=is_oa)) +
ggtitle("Paleo Journals: Citation Distribution Based On Open Access Status") +
geom_density_ridges(aes(point_color = journal_name, point_fill = journal_name, point_shape = is_oa),
	alpha = 0.4, jittered_points = TRUE, point_size=0.5, position = position_raincloud(adjust_vlines = TRUE)) 

dev.off()


