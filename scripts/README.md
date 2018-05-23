Scripts used to analyse the data, including generating plots.


```bash

# visually inspect csv files with visdat package

$ for csv in ../data/journal_data/*/*.csv;

  do /usr/local/bin/Rscript visually_explore_csv_with_visdat_plots.R $csv 10 10 150; done;


# clean csv files with janitor package

$ for scopus in ../data/journal_data/*/*_Scopus.csv;

  do unpaywall=`echo $scopus | sed "s|Scopus|Unpaywall|g"`;
  
  journal=`echo $scopus | rev | cut -d '/' -f 2 | rev`; echo $journal;
  
  Rscript cleanup_csv_with_janitor_and_export_to_tsv_format.R $scopus $unpaywall $journal;
  
  done;


# visually inspect processed tsv files with visdat package

$ for tsv in ../data/journal_data/*/*.tsv;

  do /usr/local/bin/Rscript visually_explore_tsv_with_visdat_plots.R $csv 10 10 150; done;

```
