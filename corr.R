#!/usr/bin/Rscript

corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files

  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0

  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!

  setwd(directory);
  files <- list.files(path = directory)

  tmp <- vector() 
 
  for (f in files) {
    buf <- read.csv(f, head=TRUE, sep=",")
    buf <- buf[complete.cases(buf),]    
    nobs <- nrow(buf)
    if (nobs > threshold) {
      c <- cor(buf$sulfate,buf$nitrate)
      tmp <- c(tmp,c)
    } 
  }

  if (length(tmp) > 0) {
    return (tmp)
  } else {
    return (0)
  } 
}

#dir="/home/bill/lab/specdata"
#corr(dir, 150)



