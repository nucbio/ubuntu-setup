setwd(Sys.getenv("HOME"))

repos = list(CRAN="https://cran.rstudio.com/")

## PAK (used to install packages from GitLab)
if (!requireNamespace("pak", quietly = TRUE))
    install.packages("pak", repos = repos)

## BIOCONDUCTOR PACKAGES
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager", repos = repos)
# devel version
BiocManager::install(ask = FALSE)
BiocManager::valid()              # checks for out of date packages

BiocManager::install(
  c(
    'GenomicRanges',
    'BiocGenerics',
    'TxDb.Scerevisiae.UCSC.sacCer3.sgdGene',
    'BSgenome.Scerevisiae.UCSC.sacCer3',
    'rtracklayer',
    'Rsamtools'
   ), ask = FALSE)     
BiocManager::install(ask = FALSE)              # update packages

## CRAN PACKAGES
install.packages(
  c(
    'devtools',       # development packange (also knitr, roxygen, markdown)
    'tidyverse',      # data manipulation
    'data.table',     # data manipulation
    'e1071',          # stat functions
    'corrplot',       # ggplot extension
    'cowplot',        # ggplot extension
    'RColorBrewer',   # ggplot extension
    'colorRamps',     # ggplot extension 
    'GGally',         # ggplot extension
    'languageserver'  # r for GUI tools
   ), dependencies = TRUE, repos = repos)
   
# Laboratory Packages
# Install the packages from GitLab
pak::pak(c(
  "gitlab::mglab/loci",
  "gitlab::mglab/seqtools",
  "gitlab::mglab/fiber"
))
