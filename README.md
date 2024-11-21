# Vancouver Trees Shiny App

### [View the Live Shiny App](https://shirlina.shinyapps.io/vancouver_tree_table/)

## Content
- [Description](#description)
- [Dataset Source](#dataset-source)
- [How to Run This App Locally](#how-to-run-this-app-locally)

---

## Description
The Vancouver Trees Shiny App is an interactive web application that enables users to explore data about trees in Vancouver. The app provides tools for filtering, sorting, and analyzing tree-related data, with functionality split into one main view:

### Data Table View:
1. **Interactive Filtering:**
   - Users can select one or more neighborhoods to filter the tree data.
   - Neighborhood options are displayed in a dropdown menu that supports multiple selections.

2. **Sorting:**
   - Users can enable sorting of the table by the `common_name` column using a checkbox.

3. **Search:**
   - Users can search for specific rows using the search bar provided in the interactive table.

4. **Download Data:**
   - Users can download the filtered and sorted data as a CSV file for offline analysis.

5. **Result Summary:**
   - A text summary dynamically displays the number of trees that match the current filters under the filter options.

---

## Dataset Source
The data utilized in this application is sourced from the `datateachr` package, which provides curated datasets for educational purposes.

- **Package:** `datateachr`
- **Dataset:** `vancouver_trees`

This dataset contains detailed information about trees in the city of Vancouver, including attributes like species name, common name, street address, and neighborhood.

---

## How to Run This App Locally
If you wish to run this application locally, follow the steps below:

1. **Clone this repository:**
   ```bash
   git clone https://github.com/yourusername/vancouver-trees-shiny-app.git

2. **Install packages if you haven't already:**
   ```bash
   install.packages(c("shiny", "DT", "datateachr", "tidyverse", "devtools"))
   devtools::install_github("UBC-MDS/datateachr")
   
3. **Run:**
   Open the app.R file in RStudio and click "Run App" to launch the application.

