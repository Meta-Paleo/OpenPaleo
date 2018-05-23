```

PalaeontologiaElectronica_Scopus.csv
PalaeontologiaElectronica_Scopus.csv.png
PalaeontologiaElectronica_Scopus.txt



```

```r

library(readr)
library(tidyverse)
library(janitor)
scopus <- read_csv("PalaeontologiaElectronica_Scopus.raw.csv", col_names = TRUE)
scopus <- scopus %>% clean_names() %>% remove_empty(c("rows", "cols"))
scopus$cited_by[is.na(scopus$cited_by)] <- 0
scopus <- scopus %>% select(-doi)
scopus <- scopus %>% mutate(doi=eid)
scopus$is_oa <- 'True'
scopus$journal_name <- '13-Palaeontologia_Electronica'
write_tsv(scopus, "13-Palaeontologia_Electronica_Combined_Scopus_Unpaywall.tsv")

```

```bash

Rscript ../../../scripts/visually_explore_tsv_with_visdat_plots.R 13-Palaeontologia_Electronica_Combined_Scopus_Unpaywall.tsv 10 10 150

```
