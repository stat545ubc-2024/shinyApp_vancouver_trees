library(shiny)
library(DT)
library(datateachr)
library(tidyverse)

# Load dataset
data("vancouver_trees")

# Select only the relevant columns
vancouver_trees_filtered <- vancouver_trees %>%
  select(tree_id, species_name, common_name, on_street_block, on_street, neighbourhood_name)

# Define UI
ui <- fluidPage(
  
  # Application title
  titlePanel("Vancouver Trees Explorer"),
  
  # Sidebar layout with input and output definitions
  sidebarLayout(
    sidebarPanel(
      # Checkbox for sorting option (common_name only)
      checkboxInput("sort_common_name", "Sort by common_name", value = FALSE),
      
      # Dropdown for selecting neighborhoods
      selectInput(
        "neighbourhood", 
        "Select Neighbourhood(s):",
        choices = unique(vancouver_trees_filtered$neighbourhood_name),
        selected = NULL,
        multiple = TRUE
      ),
      
      # Text output for the number of results
      textOutput("filter_summary"),
      
      # Button to download the table as a CSV file
      downloadButton("download_table", "Download Filtered Table")
    ),
    
    mainPanel(
      # Interactive data table output
      DT::dataTableOutput("tree_table")
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  # Reactive expression to filter and sort data
  filtered_data <- reactive({
    data <- vancouver_trees_filtered
    
    # Filter by neighborhoods if selected
    if (!is.null(input$neighbourhood)) {
      data <- data %>% filter(neighbourhood_name %in% input$neighbourhood)
    }
    
    # Sort data if sorting is enabled
    if (input$sort_common_name) {
      data <- data %>% arrange(common_name)
    }
    
    data
  })
  
  # Render the interactive data table
  output$tree_table <- DT::renderDataTable({
    DT::datatable(filtered_data())
  })
  
  # Render the number of results found
  output$filter_summary <- renderText({
    n_rows <- nrow(filtered_data())
    if (is.null(input$neighbourhood)) {
      paste("We found", n_rows, "trees.")
    } else {
      paste("We found", n_rows, "trees in the selected neighbourhood(s).")
    }
  })
  
  # Download the filtered data as a CSV file
  output$download_table <- downloadHandler(
    filename = function() {
      paste("filtered_vancouver_trees", Sys.Date(), ".csv", sep = "")
    },
    content = function(file) {
      write.csv(filtered_data(), file, row.names = FALSE)
    }
  )
}

# Run the application 
shinyApp(ui = ui, server = server)
