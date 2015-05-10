#!/usr/bin/Rscript

complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files

  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases

  files <- list.files(path = directory)

  siz_vec <- vector()
  id_vec  <- vector()
  idx <- 1L

  for (i in id) {
    file <- paste0(directory,'/',files[i])
    buf <- read.csv(file, head=TRUE, sep=",")
    buf <- buf[complete.cases(buf),]
    siz <- nrow(buf)
    siz_vec[idx] <- siz
    id_vec[idx]  <-  i
    idx <- idx + 1
  }

  data <- data.frame(id=id_vec,nobs=siz_vec)
  return (data)
}


#dir="/home/bill/lab/specdata"
#complete(dir)
#complete(dir, 1)
#complete(dir, c(2, 4, 8, 10, 12))
#complete(dir, 30:25)
#complete(dir, 3)

