#!/usr/bin/Rscript
setwd("/home/bill/Coursera/r")
dir="specdata"

source("pollutantmean.R");
source("complete.R");
source("corr.R");

print  ("--------- Part 1  -------")
p1="sulfate"
p2="nitrate"
pollutantmean(dir,p1,1:10)
pollutantmean(dir,p2,70:72)
pollutantmean(dir,p2,23)

print  ("--------- Part 2  -------")
complete(dir, 1)
complete(dir, c(2, 4, 8, 10, 12))
complete(dir, 30:25)
complete(dir, 3)

print  ("--------- Part 3  -------")
cr <- corr(dir, 150)
head(cr)
summary(cr)
print  ("------")

cr <- corr(dir, 400)
head(cr)
summary(cr)
print  ("------")

cr <- corr(dir, 5000)
head(cr)
summary(cr)
length(cr)
print  ("------")

cr <- corr(dir)
summary(cr)
length(cr)
print  ("------")



