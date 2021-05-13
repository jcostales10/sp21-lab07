# Shiny demo 
# May 12, 2021

# load packages 
library(ggplot2)
library(dplyr)
library(plotly)
library(shiny)

# load data
immunizations <- read.csv("immunizations.csv")

# purpose: to determine if greater enrollment size affects immunization rates by
# county 


# ------- CLEAN DATA --------- 
# should have columns County, Percent_complete_for_all_immunizations and 
# K_12_enrollment
# na values dropped

immunizations_cleaned <- immunizations %>%
  select(County, Percent_complete_for_all_immunizations, K_12_enrollment) %>%
  drop_na()


# ------- INTERACTIVE VISUALIZAION PLOT ------- 
server <- function(input, output) {
  
  # further clean and/or manipulate the data based on the input from the widgets
  # any code that has input$ or output$ (ex. Your chart or a dataframe that 
  # will updated based on user input 
  # insert code for chart here
  

  output$scatter <- renderPlotly({     #scatter is the name of the plot 
    # filters the dataset from the widgets
    plot_data <- immunizations_cleaned %>%
      filter(County == input$choose_county) %>%
      filter(K_12_enrollment >= input$enrollment_size[1],
             K_12_enrollment <= input$enrollment_size[2])
    
    
    # create plot
    ggplot(plot_data) +
      geom_point(mapping = aes_string(x = plot_data$K_12_enrollment, 
                                      y = plot_data$Percent_complete_for_all_immunizations)) +
      labs(title = "Percent of complete immunizations by School Enrollment size within WA state", 
           x = "Number of Students (K - 12)",
           y = "Percent complete for all vacinations")
  })
  
}
