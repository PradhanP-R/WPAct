#' Package for searching names of plants and their synonyms mentioned in Wildlife (Protection) Act, 1972 (Amended as on date)'
#' @param Userdata Excel file with one sheet and 1 column with heading 'Name' following by rows with species names
#' @author Prakash Pradhan, Purnendu Paul and Md. Maimun Habib
#' @export
#' @examples
#' match_names("Userdata")
#'
match_names <- function() {
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

  # Load the data from the System File
  load("data/WPAdata.rda")
  Userdata<-read_excel(file.choose())
  #Load user data. It has to be replaced with User Excel
  #Userdata <- data.frame(Name = c("Passiflora indica", "Cryptomeria japonica", "Araucaria imbricata", "Alnus nepalensis", "Wilcoxia nerispina"))
  #as_tibble(Userdata)
  matches <- WPAdata %>%
  semi_join(Userdata, by = c("Scientific_Name" = "Name")) %>%
  select(Appendix, Scientific_Name)
  return(matches)
}
#Userdata <- read_excel("C:/Users/91790/Downloads/WPAplants/R/Test.xlsx", sheet = 1)
#match_names(Testdata)
#Test<-read_excel(file.choose())
#Userdata<-"C:/Users/91790/Downloads/WPAplants/R/Test.xlsx"
match_names()
