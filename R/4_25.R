library(tidyverse)
library(cowplot)
library(magick)

data <- tidytuesdayR::tt_load('2023-04-25')
winners <-data$winners
lm <- data$london_marathon
library(ggplot2)

winners |>
  select(Time,Year,Category) |>
  ggplot() +
  aes(x = Year, y = Time, color = factor(Category)) |>
  geom_line(size = 1.5, alpha = 0.8) +
  labs(title = "Marathon speed over years",
       subtitle = "London Marathon Data",
       x = "Year",
       y = "Hour:Min:Sec",
       color = "Category") +
  theme_bw()

winners |>
  select(Time,Year,Category) |>
  filter(Category == 'Wheelchair Women') |>
  ggplot() +
  aes(x = Year, y = Time, color = factor(Category)) |>
  geom_line(size = 1.5, alpha = 0.8) +
  labs(title = "Marathon speed over years",
       subtitle = "London Marathon Data",
       x = "Year",
       y = "Hour:Min:Sec",
       color = "Category") +
  theme_bw()

winners |>
  select(Nationality) |>
  ggplot()+
  geom_histogram()