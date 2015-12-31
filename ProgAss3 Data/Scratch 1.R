#   Set the working directory
setwd("C:/Users/markd_3zbz90v/Documents/GitHub/datasciencecoursera/ProgAss3 Data")

#   Read the outcome file
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

#   Column masking for Best()
#   See C:\Users\markd_3zbz90v\Documents\ProgAss3 Data\Column Masking.xlsx
colMask <- c("NULL",	NA,	"NULL",	"NULL",	"NULL",	"NULL",	NA,	"NULL",	"NULL",	"NULL",	NA,	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	NA,	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	NA,	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL",	"NULL")


bestOutcomeData <- read.csv(file="outcome-of-care-measures.csv",sep=",", colClasses = colMask, header = TRUE)