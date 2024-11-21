library(shiny)
library(DT)
library(datateachr)
library(tidyverse)

# Load dataset
data("vancouver_trees")

# I only display the relevant columns from my perspective
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
      # Feature 1: Sorting by common_name
      # This feature allows users to sort the table by the common name of trees, making it easier to explore specific tree types alphabetically.
      checkboxInput("sort_common_name", "Sort by common_name", value = FALSE),
      
      # Dropdown for selecting neighborhoods
      # Feature 2: Filtering by neighborhood
      # This feature allows users to filter the data by selecting one or more neighborhoods, narrowing down to areas of their interest.
      selectInput(
        "neighbourhood", 
        "Select Neighbourhood(s):",
        choices = unique(vancouver_trees_filtered$neighbourhood_name),
        selected = NULL,
        multiple = TRUE
      ),
      
      # Text output for the number of results
      # Feature 3: Displaying the number of results
      # This feature shows the number of rows that match the user's selected filters, providing informative feedback on the filtering results.
      textOutput("filter_summary"),
      
      # Button to download the table as a CSV file
      # Feature 4: Allow for download
      # This feature allows the users to download the result table as a CSV file to their local computer. 
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
