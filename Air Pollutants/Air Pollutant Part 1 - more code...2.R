pollutantmean <- function(directory, pollutant, id = 1:332) {
  ####################################
  # Validate pollutant value
  ####################################
    stopifnot(pollutant == "sulfate" || pollutant == "nitrate")
  
  ####################################
  # Set column mask based on 
  # pollutant type
  ####################################
    if (pollutant == "sulfate") {
      colMask <- c("NULL", "real", "NULL")
    }else{
      colMask <- c("NULL", "NULL", "real")
    }

  ####################################
  # Get file names
  ####################################
  pollutantFiles <- list.files(directory, full.names = TRUE)
 
  ####################################
  # Iterate through files and 
  # collect pollutant values
  ####################################
  #id
 
  for (i in id)
  {
    #print(i)
    #read.table(pollutantFiles[i], colClasses = colMask, header = TRUE, sep=",")
    pollutantValues <- append(pollutantValues, read.table(pollutantFiles[i], colClasses = colMask, header = TRUE, sep=","))
    #pollutantValues <- c(pollutantValues, read.table(pollutantFiles[i], colClasses = colMask, header = TRUE, sep=","))
  }
 typeof(pollutantValues)
  #length(pollutantValues$sulfate[is.na(pollutantValues$sulfate) == FALSE])

}
pollutantmean("specdata","sulfate",c(1,2))