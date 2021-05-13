# Shiny demo 
# May 12, 2021

#install packages
library(shiny)
library(ggplot2)
library(plotly)

# read dataset 
immunizations <- read.csv("immunizations.csv")

# --------- CREATE WIDGETS ---------- 

# choose county widget (this widget allows you to 
# choose which county you want to have the plot focus on)

select_values <- unique(immunizations$County)

choose_county_widget <- selectInput(
  inputId = "choose_county", 
  label = "Select a county to observe", 
  choices = select_values, 
  selected = "KING")





# enrollment size widget (this widget allows you to choose the
# range of enrollment size)
immunizations <- immunizations %>%
  filter(K_12_enrollment != "NA")

enrollment <- c(min(immunizations$K_12_enrollment), 
                max(immunizations$K_12_enrollment))

enrollment_size_widget <- sliderInput(inputId = "enrollment_size", 
                                 label = "Choose enrollment size", 
                                 min = enrollment[1], 
                                 max = enrollment[2], 
                                 value = enrollment)

# --------- CREATE PAGES ---------- 
bunnies <- 10 
page_one <- tabPanel(
  "Page 1",                   #title of the page, what will appear as the tab name
  sidebarLayout(             
    sidebarPanel( 
      # left side of the page 
      # insert widgets or text here -- their variable name(s), NOT the raw code
      choose_county_widget,
      enrollment_size_widget
    ),           
    mainPanel(                # typically where you place your plots + texts
      # insert chart and/or text here -- the variable name NOT the code
      plotlyOutput("scatter"),
      p("there were", bunnies, " bunnies in the yard")
    )))


# --------- DEFINING UI: PUTTING PAGES TOGETHER ---------- 
ui <- navbarPage(
  "Title",
  page_one
  #insert other pages here
)

