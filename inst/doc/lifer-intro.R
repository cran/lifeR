## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, echo = FALSE------------------------------------------------------
library(lifeR)

## ----install, eval = FALSE----------------------------------------------------
#  install.packages("remotes")
#  remotes::install_github(repo = "jcoliver/lifeR")

## ----install-vignette, eval = FALSE-------------------------------------------
#  remotes::install_github(repo = "jcoliver/lifeR", build_vignettes = TRUE)

## ----example-1, eval = FALSE--------------------------------------------------
#  library(lifeR)
#  # To use the sample list included in this package
#  list_file <- system.file("extdata", "example-list.csv", package = "lifeR")
#  
#  # If you have your list file downloaded, replace the line above with one that
#  # indicates the location of your list file, e.g.
#  # list_file <- "~/Desktop/ebird_world_year_2021_list.csv"
#  
#  # Read the list of species into memory
#  user_list <- read.csv(file = list_file)
#  
#  # Extract the common names of species from your list
#  my_species <- SplitNames(x = user_list$Species)$Common
#  
#  # Read in eBird API key from a text file; replace the argument to file with
#  # the actual location of your eBird key file
#  key <- scan(file = "ebird-api-key.txt", what = "character")
#  
#  # A single center requires vector of coordinates
#  # Change these, unless you really want to go birding near McCall, Idaho
#  locs <- c(45, -116)
#  SitesReport(centers = locs,
#              ebird_key = key,
#              species_seen = my_species)

## ----example-2, eval = FALSE--------------------------------------------------
#  # For more than one location, centers can be a matrix or a data frame, here
#  # we use a matrix of two sites
#  loc_mat <- matrix(data = c(39.5, -118.8, 39, -119.1), nrow = 2, byrow = TRUE)
#  
#  # Instead of default "Center 1" and "Center 2", we can use custom names
#  loc_names <- c("Fallon", "Yerington")
#  
#  # Sites report now uses loc_names in the output
#  SitesReport(centers = loc_mat,
#              ebird_key = key,
#              species_seen = my_species,
#              center_names = loc_names)

## ----example-3, eval = FALSE--------------------------------------------------
#  loc_df <- data.frame(latitude = c(39.5, 39, 40),
#                       longitude = c(-118.8, -119.1, -118.6))
#  loc_names <- c("Fallon", "Yerington", "Humbolt Wildlife")
#  
#  # We can set the area to search by passing values to the dist argument
#  SitesReport(centers = loc_df,
#              ebird_key = key,
#              dist = 25,
#              species_seen = my_species,
#              center_names = loc_names,
#              report_filename = "Nevada-sites",
#              report_dir = "~/Desktop") # Saves report to desktop

