complete <- function(directory, id = 1:332) {

  # Get file names
  caseFiles <- list.files(directory, full.names = TRUE)[id]

  # Frame size is equal to number of values in id
  tableRows <- length(id)
  
  # Declare data frame schema
  completeDf <- data.frame(id = integer(tableRows), nobs = integer(tableRows), stringsAsFactors = FALSE)
  
  # Independant loop counter
  loopCounter <- 1
  
  # Populate data frame
  for (i in id) {
    completeDf$id[loopCounter] <- i
    completeDf$nobs[loopCounter] <- nrow(read.csv(caseFiles[loopCounter])[complete.cases(read.csv(caseFiles[loopCounter])), ])
    loopCounter <- loopCounter +1
  }
  
  # Return data frame
  completeDf
}

