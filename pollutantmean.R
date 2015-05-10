#!/usr/bin/Rscript

pollutantmean <- function(directory, pollutant, id = 1:332) {

  setwd(directory);

  files <- list.files(path = directory)
 
  # ??? 
  # I want tmo to be a list()
  # tmp <- list() gives me a list of lists as I go thru the loop
  # tmp is just a number but it functions as an array  
  # ???
  tmp <- 1L 

  idx <- 1L
  for (i in id) {
    buf <- read.csv(files[i], head=TRUE, sep=",")
    len <- nrow(buf)
    for (j in 1:len) {
      n <- buf[j,pollutant]
      tmp[idx] <- n
      idx <- idx + 1
      #cat ("i=",i," j=",j," n=",n,"idx=",idx,"\n")
    }
  }
  mean(tmp, na.rm=TRUE)  
}

dir="/home/bill/lab/specdata"
p1="sulfate"
p2="nitrate"

pollutantmean(dir,p1,1:10)
pollutantmean(dir,p2,70:72)
pollutantmean(dir,p2,23)


##################################
#        Date sulfate nitrate  ID
#1 2003-01-01      NA      NA 332
#2 2003-01-02      NA      NA 332
#3 2003-01-03      NA      NA 332
#4 2003-01-04      NA      NA 332
#5 2003-01-05      NA      NA 332
#6 2003-01-06      NA      NA 332
#> 

