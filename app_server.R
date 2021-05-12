# load packages 
library(ggplot2)
library(dplyr)
library(plotly)
library(shiny)

# load data
immunizations <- read.csv("immunizations.csv")

# ------- CLEAN DATA --------- 
# should have columns County, Percent_complete_for_all_immunizations and 
# K_12_enrollment
# na values dropped




# ------- INTERACTIVE VISUALIZAION PLOT ------- 
server <- function(input, output) {
  
  # further clean and/or manipulate the data based on the input from the widgets
  # any code that has input$ or output$ (ex. Your chart or a dataframe that 
  # will updated based on user input 
  # insert code for chart here
  

    # filters the dataset from the widgets 
    
 
    
    # create plot
    
  
}
