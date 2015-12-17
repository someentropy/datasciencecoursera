corr <- function(directory, threshold = 0){
  
  # Find all files that meet the threshold
  caseFiles <- list.files(directory, full.names = TRUE)

  cr <- c()
  
  for (i in 1:length(caseFiles)) {
    fileData <- read.csv(caseFiles[i], colClasses = c("NULL", "real", "real"))[complete.cases(read.csv(caseFiles[i])), ]
    comp <- nrow(fileData)
    if (comp > threshold) {
      cr <- c(cr, cor(fileData$sulfate, fileData$nitrate) )
    } 
  }
  return(cr)
  
  
}

