#!/usr/bin/Rscript

complete <- function(directory, id = 1:332) {
  setwd(directory);
  files <- list.files(path = directory)

  siz_array <- 1L
  id_array  <- 1L  
  idx <- 1L

  for (i in id) {
    #file <- paste0(i , ".csv")   
    buf <- read.csv(files[i], head=TRUE, sep=",")
    buf <- buf[complete.cases(buf),]
    siz <- nrow(buf)
    siz_array[idx] <- siz
    id_array[idx]  <-  i
    idx <- idx + 1
  }

  data <- data.frame(id=id_array,nobs=siz_array)
  print (data)
}

dir="/home/bill/lab/specdata"

complete(dir, 1)
complete(dir, c(2, 4, 8, 10, 12))
complete(dir, 30:25)
complete(dir, 3)

##################################
#        Date sulfate nitrate  ID
#1 2003-01-01      NA      NA 332
#2 2003-01-02      NA      NA 332
#3 2003-01-03      NA      NA 332
#4 2003-01-04      NA      NA 332
#5 2003-01-05      NA      NA 332
#6 2003-01-06      NA      NA 332
#> 


