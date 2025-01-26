# Load necessary libraries
required_packages <- c("ggplot2", "dplyr")
new_packages <- required_packages[!(required_packages %in% installed.packages()[,"Package"])]
if(length(new_packages)) install.packages(new_packages)
lapply(required_packages, library, character.only = TRUE)

# Define export directory
desktop_path <- "C:/Users/Manuel/Desktop/UOC/DATAMANZ"
if (!dir.exists(desktop_path)) {
  dir.create(desktop_path, recursive = TRUE)
}

# Load data
car_data <- read.csv("data/carprice.csv", sep = ",", header = TRUE)
canada_data <- read.csv("data/CES11.csv", sep = ",", header = TRUE)

# Data visualization for car price clustering
car_plot <- ggplot(car_data, aes(x = Price, y = MPG.city)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", col = "red") +
  labs(title = "Car Price vs Fuel Efficiency",
       x = "Price ($)",
       y = "City MPG") +
  theme_minimal()
ggsave(filename = file.path(desktop_path, "car_clustering.png"), plot = car_plot, width = 8, height = 6)

# Data visualization for Canadian abortion clustering
canada_plot <- ggplot(canada_data, aes(x = province, fill = abortion)) +
  geom_bar() +
  labs(title = "Abortion Opinions by Province",
       x = "Province",
       y = "Count") +
  theme_minimal()
ggsave(filename = file.path(desktop_path, "abortion_clusters.png"), plot = canada_plot, width = 8, height = 6)

# Confirm saved files
list.files(desktop_path)
