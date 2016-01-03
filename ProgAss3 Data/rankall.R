rankall <- function(outcome, num = "best") { 
    ## Read outcome data
    colMask <- c("NULL",	NA,	"NULL",	"NULL",	"NULL",	"NULL",	NA,	"NULL",	"NULL",	"NULL",	NA,	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	NA,	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	NA,	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL")
    bestOutcomeData <- read.csv(file="outcome-of-care-measures.csv",sep=",", colClasses = colMask, header = TRUE, stringsAsFactors = FALSE)
    
    ## Check that outcome is valid
    if (outcome != "heart attack" && outcome != "heart failure" && outcome != "pneumonia") {
        stop("invalid outcome")
    }
    
    ##  Set column index based on outcome
    outcomeIndex <- 3  #  Default
    if (outcome == "heart failure") {
        outcomeIndex <- 4 
    }
    if (outcome == "pneumonia") {
        outcomeIndex <- 5
    }
    
    ##  Cast type for sought outcome values only
    suppressWarnings(bestOutcomeData[,outcomeIndex] <- as.double(bestOutcomeData[,outcomeIndex]))

    ## Remove rows with NA outcomes values from consideration
    bestOutcomeData <- bestOutcomeData[complete.cases(bestOutcomeData[,outcomeIndex]),]
    bestOutcomeData <- bestOutcomeData[,c(1,2,outcomeIndex)]
    names(bestOutcomeData)[3] = "Mortality"
    bestOutcomeData = split(bestOutcomeData, bestOutcomeData$State)
    
    bestOutcomeData = lapply(bestOutcomeData, function(x, num) {
        x = x[order(x$Mortality, x$Hospital.Name),]
        
        if (num == "best") {
            num <- 1
        }
        if (num == "worst") {
            num <- nrow(x)
        }
        return (x$Hospital.Name[num])
        
    }, num)
    
    return ( data.frame(hospital=unlist(bestOutcomeData), state=names(bestOutcomeData)) )
    #head(bestOutcomeData, 4)    

    
    
    ## For each state, find the hospital of the given rank
    ## Return a data frame with the hospital names and the ## (abbreviated) state name
}

