library(tidyverse)

top_songs <- billboard |>
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    values_to = "rank",
    values_drop_na = TRUE
  ) |>
  mutate(week = parse_number(week)) |>
  mutate(hit_number_one = min(rank) == 1, .by = track)

  write_rds(top_songs, file = "clean_data.rds")
  
