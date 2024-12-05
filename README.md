# Vancouver Trees Shiny App

### Click to see: [Original App - Main Explorer Only](https://shirlina.shinyapps.io/vancouver_tree_table/) 
 or with link: https://shirlina.shinyapps.io/vancouver_tree_table/
### Click to see: [Updated App - Includes Neighborhood Analysis](https://shirlina.shinyapps.io/vancouver_trees_updated/)
 or with link: https://shirlina.shinyapps.io/vancouver_trees_updated/

---

## Contents
- [Description](#description)
- [Key Updates](#key-updates)
- [Dataset Source](#dataset-source)
- [How to Run This App Locally](#how-to-run-this-app-locally)

---

## Description
The **Vancouver Trees Shiny App** is an interactive web application designed to explore data about trees in Vancouver. The app provides tools for filtering, sorting, and analyzing tree-related data. It is divided into two main views:

### 1. Main Explorer:
- **Interactive Filtering:** 
  - Select one or more neighborhoods to filter the tree data.
  - Use the dropdown menu to choose neighborhoods.
- **Sorting:** 
  - Use the checkbox to sort the table by `common_name` alphabetically.
- **Search:** 
  - Quickly locate specific rows using the built-in search functionality.
- **Download Filtered Data:**
  - Export the filtered data as a CSV file for offline analysis.
- **Dynamic Summary:**
  - Displays the number of trees matching the current filter.

### 2. Neighborhood Analysis (New in Updated Version):
- **Tree Species Selection:**
  - Select a specific tree species (common name) for analysis.
- **Neighborhood Bar Plot:**
  - View a bar plot of tree counts grouped by neighborhood for the selected species.
- **Street-Level Analysis:**
  - Enable detailed street-level analysis using the checkbox.
  - Select a specific neighborhood to see street-level distributions of the selected tree species.
- **Street Bar Plot and Table:**
  - Explore street-level counts of the selected species in a chosen neighborhood.

---

## Key Updates
### Original Version:
- **Live Link:** [Original App](https://shirlina.shinyapps.io/vancouver_tree_table/)
- Features:
  - Main Explorer for filtering, sorting, and downloading tree data.
  - Interactive table for viewing tree information.

### Updated Version:
- **Live Link:** [Updated App](https://shirlina.shinyapps.io/vancouver_trees_updated/)
- New Features:
  - Added **Neighborhood Analysis** page:
    - Select tree species for neighborhood-level analysis.
    - Visualize data with a bar plot of tree counts by neighborhood.
    - Enable street-level analysis with an additional checkbox.
    - Filter and analyze tree distributions within specific streets of a neighborhood.

---

## Dataset Source
The data used in this application is sourced from the **`datateachr`** R package.

- **Package:** [`datateachr`](https://github.com/UBC-MDS/datateachr)
- **Dataset:** `vancouver_trees`

This dataset includes detailed information about trees in Vancouver, such as species names, common names, locations, and neighborhoods.

---

## How to Run This App Locally
If you wish to run this application locally, follow the steps below:

1. **Clone this repository:**
   ```
   git clone https://github.com/yourusername/vancouver-trees-shiny-app.git
   ```

2. **Install packages if you haven't already:**
   ```
   install.packages(c("shiny", "DT", "datateachr", "tidyverse", "devtools"))
   devtools::install_github("UBC-MDS/datateachr")
   ```
   
3. **Run:**
   Open the `vancouver_tree_table` folder at the top of the repository, then open `app.R` file in RStudio and click "Run App" to launch the application.

