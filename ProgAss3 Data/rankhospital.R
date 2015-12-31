rankhospital <- function(state, outcome, num = "best") { 
    ## Read outcome data
    colMask <- c("NULL",	NA,	"NULL",	"NULL",	"NULL",	"NULL",	NA,	"NULL",	"NULL",	"NULL",	NA,	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	NA,	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	NA,	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL")
    bestOutcomeData <- read.csv(file="outcome-of-care-measures.csv",sep=",", colClasses = colMask, header = TRUE, stringsAsFactors = FALSE)

    ## Check that state and outcome are valid
    if (outcome != "heart attack" && outcome != "heart failure" && outcome != "pneumonia") {
        stop("invalid outcome")
    }
    if (!state %in% bestOutcomeData[,2]) {
        stop("invalid state")
    }
    
    ##  Set column index based on outcome
    outcomeIndex <- 3#  Default
    if (outcome == "heart failure") {
        outcomeIndex <- 4 
    }
    if (outcome == "pneumonia") {
        outcomeIndex <- 5
    }
    
    ##  Minimize data volume & validate ordinal ranking
    bestOutcomeData <- bestOutcomeData[bestOutcomeData[,2] == state, ]
    
    ##  Cast type for sought outcome values only
    suppressWarnings(bestOutcomeData[,outcomeIndex] <- as.double(bestOutcomeData[,outcomeIndex]))
    
    ## Remove rows with NA outcomes values from consideration
    bestOutcomeData <- bestOutcomeData[complete.cases(bestOutcomeData[,outcomeIndex]),]

    ##  Validate and handle [num] argument
    hospitalCntInState <- nrow(bestOutcomeData)

    if (num == "best") {
        num <- 1
    }
    if (num == "worst") {
        num <- hospitalCntInState
    }
    
    if (num > hospitalCntInState || num < 1) {
        return(NA)
    }
    
    ##  Return result
    return(bestOutcomeData[ order(bestOutcomeData[,outcomeIndex], bestOutcomeData[,1]), ]$Hospital.Name[num])
}

