#' Package for searching names of plants and their synonyms mentioned in Wildlife (Protection) Act, 1972 (Amended as on date)'
#' @param Test Excel file with one sheet and 1 column with heading 'Name' following by rows with species names
#' @author Prakash Pradhan, Purnendu Paul and Md. Maimun Habib
#' @export
#'
match_names <- function(Test) {
  if(!require(readxl)){
    install.packages("readxl")
    library(readxl)
  }
  if(!require(dplyr)){
    install.packages("dplyr")
    library(dplyr)
  }
  if(!require(stringr)){
    install.packages("stringr")
    library(stringr)
  }

  #library(readxl)
  #library(dplyr)
  #library(stringr)
  # Load the data from the System File
  load("data/WPAdata.rda")
  #load("data/Testdata.rda")
  #system.file('data', package = "WPAplsearch")
  #system.file("Testdata", package = "WPAplsearch")
  #files <- lapply(list.files(system.file('data', package = 'WPAplsearch'), full.names = TRUE), read_excel)
  # Load the data from the User Excel File
  #DataFrame <- read_excel("C:/Users/91790/Downloads/WPAplants/R/WPA_Plants.xlsx", sheet = 1)
  # Load the data from the User Excel File
  #Test <- read_excel("C:/Users/91790/Downloads/WPAplants/R/Test.xlsx", sheet = 1)
  #Test<-read_excel(file.choose())
  # Extract the names from the column 'Name' of Excel file Test
  #names_Test <- Test$Name
  # Check if the text in the 'Scientific_Name' column of Excel file df contains any of the names mentioned in 'Name' column of Excel file Test
  # and display only those names along with the corresponding 'Appendix' values
  matches <- WPAdata %>%
    semi_join(Test, by = c("Scientific_Name" = "Name")) %>%
    select(Appendix, Scientific_Name)
  return(matches)
}
#Testdata <- read_excel("C:/Users/91790/Downloads/WPAplants/R/Test.xlsx", sheet = 1)
#match_names(Testdata)
#Test<-read_excel(file.choose())
match_names(Test)
