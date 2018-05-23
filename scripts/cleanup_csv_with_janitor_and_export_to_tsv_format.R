
#!/usr/bin/env Rscript

# usage: /usr/local/bin/Rscript cleanup_csv_with_janitor_and_export_to_tsv_format.R <arg1> <arg2> <arg3>
# arg 1: /path/to/scopus.csv
# arg 2: /path/to/unpaywall.csv
# arg 3: formatted journal name  eg: 09-Acta_Palaeontologica_Polonica 

# auto-configure readr, tidyverse, and janitor packages, if not available
options(warn=-1)
list.of.packages <- c("readr", "tidyverse", "janitor")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages, repos='https://cran.rstudio.com/')
suppressPackageStartupMessages(require(readr))
suppressPackageStartupMessages(require(janitor))
suppressPackageStartupMessages(require(tidyverse))

# read command-line arguments
args <- commandArgs(TRUE)
scopus.input <- args[1] 
unpaywall.input <- args[2]
journal.name <- args[3]

# read Scopus data in csv format with readr
scopus <- read_csv(scopus.input, col_names = TRUE)

# clean colnames and discard empty rows and cols with janitor
scopus <- scopus %>% clean_names() %>% remove_empty(c("rows", "cols"))

# replace `NA` with `0` under citation counts column of Scopus data
scopus$cited_by[is.na(scopus$cited_by)] <- 0

# publisher info retained from unpaywall data
if("publisher" %in% colnames(scopus)){scopus <- scopus %>% select(-publisher)}

# read Unpaywall data in csv format with readr
unpaywall <- read_csv(unpaywall.input, col_names = TRUE)

# clean colnames and discard empty rows and cols with janitor
unpaywall <- unpaywall %>% clean_names() %>% remove_empty(c("rows", "cols"))

# replacing journal_name with formatted journal name
unpaywall$journal_name <- journal.name

# write Scopus data.frame in TSV format
scopus.input.file <- basename(scopus.input)
scopus.output.file <- paste0(journal.name, "_Scopus.tsv")
scopus.output <- sub(scopus.input.file, scopus.output.file, scopus.input)
write_tsv(scopus, path = scopus.output)

# write Unpaywall data.frame in TSV format
unpaywall.input.file <- basename(unpaywall.input)
unpaywall.output.file <- paste0(journal.name, "_Unpaywall.tsv")
unpaywall.output <- sub(unpaywall.input.file, unpaywall.output.file, unpaywall.input)
write_tsv(unpaywall, path = unpaywall.output)

# merge Scopus and Unpaywall data by "doi"
merged <- merge(scopus,unpaywall,by="doi")
merged.output.file <- paste0(journal.name, "_Combined_Scopus_Unpaywall.tsv")
merged.output <- sub(unpaywall.input.file, merged.output.file, unpaywall.input)
write_tsv(merged, path = merged.output)


