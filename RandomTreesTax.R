# install.packages("readxl")

library(readxl)

# Load the Excel file
data = read_excel("C:/Users/admin/Desktop/Uploads GitHub/Oaks_Species_Section/OakSection.xlsx")

# Group the Oak (Quercus) species by section
sections = split(data$Quercus, data$Sektion)

# Function to sample three species from each section
sample_species = function(section) {
  sample(section, 3, replace = FALSE)
}

# Function to generate random species for each section
generate_random_species = function() {
  # Applying the function to each section
  random_species = lapply(sections, sample_species)
  
  # Print the random species for each section
  for (section_name in names(random_species)) {
    cat("Section:", section_name, "\n")
    cat("Species:", random_species[[section_name]], "\n\n")
  }
}

# Function to prompt user for continuation
continue_prompt = function() {
  cat("Do you want to generate random species again? (yes/no): ")
  response = readline()
  return(tolower(response) == "yes")
}

# Generate random species until user decides to stop
repeat {
  generate_random_species()
  
  if (!continue_prompt()) {
    break
  }
}
