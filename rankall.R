#!/usr/bin/Rscript


setwd("/home/bill/Coursera/r")

rankall <- function(outcome, num = "best" ) {
  df <- read.csv(file="outcome-of-care-measures.csv", head=TRUE,sep=",",na.strings = "Not Available")

  df <- df[ order(df$State), ]

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

  for (state in states) {
    buf <- df[which(df$State == state), ]
    buf <- na.omit(buf[,c(2,7,idx)])

    rank <- 0
    if (num == "best") {
      rank <- 1
    }  else if (num == "worst" ) {
      rank <- nrow(buf)
    } else {
      rank <- num
    }

    buf <- buf[ order(buf$Rate, buf$Name), ]
    #print (buf) 
    buf <- buf[rank,]
    buf <- data.frame(state, buf$Name)
    print (buf)
  }
}


#rankall("heart attack", 20)
#rankall("pneumonia", "worst")
#rankall("heart failure", 1)



