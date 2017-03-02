source("settings.R")
set.seed(44)

## Remove any existing output files
fn <- "XR.fvi"
if (file.exists(fn)) file.remove(fn)
fn <- "XR.fvd"
if (file.exists(fn)) file.remove(fn)

## Create the new files
## dim(XR) = (nr_gen_predictors * nr_snps) * nr_indiv
XR <- matrix(rnorm(m*n), ncol=m)

## Replace some elements with NAs
#for (i in 1:(n*m)){
#    if(sample(1:100,1) > 90) {
#        XR[i] <- 0/0
#    }
#}

colnames(XR) <- paste0("snp",
                       paste(ceiling(1:m/r), 1:r, sep="_")
                       )
rownames(XR) <- paste0("ind", 1:n)

XR_db <- matrix2databel(XR, filename="XR", type="FLOAT")

library(tidyverse)
write_csv(rownames_to_column(data.frame(XR),var="id"),"XR.csv")

