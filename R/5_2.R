library(tidyverse)
library(cowplot)
library(magick)
library(dplyr)

data <- tidytuesdayR::tt_load('2023-05-02')
plots_data <- data$plots
species_data <- data$species
surveys_data <- data$surveys

species_data |>
  select(meanwgt,species,granivore) |>
  ggplot() +
  aes(x = species, y = meanwgt, color = factor(granivore)) |>
  geom_point() +
  labs(title = "Granivore meanweight",
       subtitle = ".",
       x = "species",
       y = "meanwgt",
       color = "granivore") +
  theme_bw()

species_data |>
  select(meanhfl,species,granivore) |>
  ggplot() +
  aes(x = species, y = meanhfl,color = factor(granivore) ) |>
  geom_point() +
  labs(title = "Granivore meanhfl",
       subtitle = ".",
       x = "species",
       y = "meanhfl",
       color = "granivore") +
  theme_bw()

species_data |>
  select(meanhfl,species,meanwgt) |>
  ggplot() +
  aes(x = meanwgt, y = meanhfl ) |>
  geom_point() +
  labs(title = "Granivore meanhfl",
       subtitle = ".",
       x = "meanwgt",
       y = "meanhfl") +
  theme_bw()











plots_data_longterm <- surveys_data |>
  group_by(plot) |>
  summarize(treatment = case_when(
    all(treatment == "control") ~ "control",
    all(treatment == "exclosure") ~ "exclosure")) |>
  filter(!is.na(treatment))

species_data <- species_data |>
  filter(censustarget == 1, unidentified == 0)

survey_data <- summarize_individual_rodents(
  time = "date",
  length = "Longterm") |>
  filter(year > 1977) |>
  filter(species %in% unique(species_data$species))

write.csv(survey_data, "surveys.csv", row.names = FALSE, na = "")
write.csv(plots_data_longterm, "plots.csv", row.names = FALSE, na = "")
write.csv(species_data, "species.csv", row.names = FALSE, na = "")