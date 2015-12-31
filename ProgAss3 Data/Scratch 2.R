best <- function(state, outcome) {
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
    
    ##  First minimize data volume, then cast types 
    bestOutcomeData <- bestOutcomeData[bestOutcomeData[,2] == state, ]
    
    suppressWarnings(bestOutcomeData[,outcomeIndex] <- as.double(bestOutcomeData[,outcomeIndex]))
    
    ##  Return hospital name in that state with lowest 30-day death rate        
        #head(bestOutcomeData, 4)
    head(bestOutcomeData[ order(bestOutcomeData[,outcomeIndex], bestOutcomeData[,1]), ]$Hospital.Name, 1)
    #min(bestOutcomeData[,outcomeIndex])
}
best("MD", "pneumonia")