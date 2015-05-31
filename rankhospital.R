#!/usr/bin/Rscript


setwd("/home/bill/Coursera/r")

rankhospital <- function(state, outcome, num = "best" ) {
  df <- read.csv(file="outcome-of-care-measures.csv", head=TRUE,sep=",",na.strings = "Not Available")

  idx <- 0
  if (outcome ==  "heart attack") {
    idx <- 11 
  } else if (outcome == "heart failure") {
    idx <- 17
  } else if (outcome == "pneumonia" ) {
    idx <- 23
  } else {
    stop("Invalid Outcome")
  }

  names(df)[idx] <- "Rate"
  names(df)[2] <- "Name"

  ## Check that state and outcome are valid
  states <- unique(df$State)
  if(! state %in% states) {
       stop("Invalid State")
  }


  buf <- df[which(df$State == state), ]
  buf <- na.omit(buf[,c(2,idx)])
  buf <- buf[ order(buf$Rate, buf$Name), ]

  rank <- 0
  if (num == "best") {
     rank <- 1
  } else if (num == "worst" ) {
     rank <- nrow(buf)
  } else {
     rank <- num
  }

  buf <- as.matrix(buf[rank,1])
  buf
}

to_char <- function (x) {
  return ( suppressWarnings(as.numeric(as.character(x))) )
}

#rankhospital("TX", "heart failure", 4)
rankhospital("MD", "heart attack", "worst")
#rankhospital("MN", "heart attack", 5000)


