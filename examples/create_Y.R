source("settings.R")
set.seed(43)

## Remove any existing output files
fn <- "Y.fvi"
if (file.exists(fn)) file.remove(fn)
fn <- "Y.fvd"
if (file.exists(fn)) file.remove(fn)

## Create the new files
## dim(Y) = traits * nr_indiv
Y <- matrix(rnorm(t*n), ncol=t)

## Add some NAs
#for (i in 1:(t*n)) {
#    if(sample(1:100,1) > 90) {
#        Y[i] <- 0/0
#    }
#}

colnames(Y) <- paste0("ph", 1:t)
rownames(Y) <- paste0("ind", 1:n)
Y_db <- matrix2databel(Y, filename="Y", type="FLOAT")

library(tidyverse)
write_csv(rownames_to_column(data.frame(Y),var="id"),"Y.csv")
