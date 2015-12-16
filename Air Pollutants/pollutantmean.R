pollutantmean <- function(directory, pollutant, id = 1:332) {
  ####################################
  # Validate & Set Mask
  ####################################
  stopifnot(pollutant == "sulfate" || pollutant == "nitrate")
  
  if (pollutant == "sulfate") {colMask <- c("NULL", "real", "NULL")}
  else                        {colMask <- c("NULL", "NULL", "real")}
  
  ####################################  
  # Get relevant file names
  ####################################  
  pollutantFiles <- list.files(directory, full.names = TRUE)[id]
  
  ####################################  
  # Get only the sought column in to 
  # variable foo
  #################################### 
  foo <- lapply(pollutantFiles, read.table, colClasses = colMask, header = TRUE, sep=",")

  ####################################  
  # Row bind all indexes of foo to 
  # focusData
  #################################### 
  focusData <- do.call("rbind", foo)
  
  ####################################  
  # Rename column to pollutant
  #################################### 
  names(focusData)[names(focusData)==pollutant] <- "pollutant"
  
  ####################################  
  # Find mean of pollutant
  # Ignore NA values
  ####################################   
  mean(focusData$pollutant, na.rm=TRUE)
}

pollutantmean("specdata","nitrate",c(1,2))