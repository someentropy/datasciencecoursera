#Set Working Directory
setwd("C:/Users/markd_3zbz90v/Documents/specdata")
# Get the column list in to a variable
moo<-read.table("001.csv", colClasses = c("NULL", "real", "NULL"), header = TRUE, sep=",")
# Get the mean of the 1'st "column" of the list, where the element is not NA
mean(moo[1][is.na(moo[1])==FALSE])




pollutantFiles <- list.files("C:/Users/markd_3zbz90v/Documents/specdata")

for (i in 1:length(pollutantFiles))
{
  #print(pollutantFiles[i])
  pollutantValues <- read.table(pollutantFiles[i], colClasses = c("NULL", "real", "NULL"), header = TRUE, sep=",")
}
mean(pollutantValues[1][is.na(pollutantValues[1])==FALSE])

pollutantmean("C:/Users/markd_3zbz90v/Documents/specdata", "nitrate", 2:33)
pollutantmean("C:/Users/markd_3zbz90v/Documents/specdata", "sulfate", 2:33)

pollutantmean <- function(directory, pollutant, id = 1:332) {
  setwd("C:/Users/markd_3zbz90v/Documents/specdata")
## 'directory' is a character vector of length 1 indicating
## the location of the CSV files
  #pollutantFiles <- list.files(directory)
## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate" or "nitrate".
  stopifnot(pollutant == "sulfate" || pollutant == "nitrate")
  if (pollutant == "sulfate") {
    colMask <- c("NULL", "real", "NULL")
  }else{
    colMask <- c("NULL", "NULL", "real")
  }
  
## 'id' is an integer vector indicating the monitor ID numbers
## to be used
  pollutantFiles <- list.files(directory)
  #pollutantFiles[id]
  ######strtoi(sub(".csv","", pollutantFiles), base = 10L)
## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)
## NOTE: Do not round the result!
  for (i in id)
  {
    #print(pollutantFiles[i])
    pollutantValues <- read.table(pollutantFiles[i], colClasses = colMask, header = TRUE, sep=",")
  }
  mean(pollutantValues[1][is.na(pollutantValues[1])==FALSE])
  
}