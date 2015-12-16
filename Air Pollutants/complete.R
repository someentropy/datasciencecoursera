complete <- function(directory, id = 1:332) {
  ####################################
  # Validate & Set Mask
  ####################################
  pollutantFiles <- list.files(directory, full.names = TRUE)[id]
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
}