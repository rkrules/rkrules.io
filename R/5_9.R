library(tidyverse)
library(cowplot)
library(magick)

data <- tidytuesdayR::tt_load('2023-05-09')
cc_costs <- data$childcare_costs
counties <- data$counties

