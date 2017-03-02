library(tidyverse)

source("settings.R")
source("create_XL.R")
source("create_XR.R")
source("create_Y.R")

system("../omicabelnomm -c XL --g XR -p Y -o flag_f -t 2 -f")
system("../omicabelnomm -c XL --g XR -p Y -o flag_d1 -t 2 -d 1.0")

all <- read_tsv("flag_f_dis.txt")
p1 <- read_tsv("flag_d1_dis.txt")

all %>% group_by(SNP) %>% summarise(N=n()) %>% arrange(N)

anti_join(all %>% filter(SNP=="snp17_1"),all %>% filter(SNP=="snp18_1"),by="Phe")

Y <- read_csv("Y.csv")
XL <- read_csv("XL.csv")
XR <- read_csv("XR.csv")

d  <- Y %>% inner_join(XL,by="id") %>% inner_join(XR,by="id")

summary(lm(ph18 ~ snp17_1 + cov1 + cov2 + cov3, data=d))
summary(lm(ph2 ~ snp133_1 + cov1 + cov2 + cov3, data=d))
