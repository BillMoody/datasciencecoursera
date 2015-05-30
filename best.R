#!/usr/bin/Rscript
# Best

setwd("/home/bill/Coursera/r")

best <- function(state, outcome) {
  #colClasses = "character" eliminates factorss and levels
  df <- read.csv(file="outcome-of-care-measures.csv", head=TRUE,sep=",", colClasses = "character")

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

  ## Check that state and outcome are valid
  states <- unique(df$State)
  if(! state %in% states) {
       stop("Invalid State")
  }

  buf <- df[which(df$State == state),]
  min <- min(to_char(buf[,idx]), na.rm = TRUE)
  row <- which(to_char(buf[,idx]) == min)
  # cat ("State = ", s, " min = ", m , " row = ", r,  "\n")
  hosp <- buf[row,c(2,6,7,idx)] 
  sort.hosp <- hosp[order(hosp$Hospital.Name), ]    
  top <- sort.hosp[1,1]
  top
}

to_char <- function (x) {
  return ( suppressWarnings(as.numeric(as.character(x))) )
}

# “heart attack”, “heart failure”, or “pneumonia”.
#best("TX", "heart attack")
#best("TX", "heart failure")
#best("MD", "heart attack")
#best("MD", "pneumonia")
#
#best("BB", "heart attack")
#best("NY", "xxx")


