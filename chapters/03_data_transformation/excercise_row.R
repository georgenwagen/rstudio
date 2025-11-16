flights |>
  filter(arr_delay >= 120 & dep_delay <= 120) |>
  filter(dest %in% c("IAH", "HOU")) |>
  filter(carrier %in% c("UA", "DL", "AA")) |>
  filter(month %in% c(7, 8, 9)) |>
  filter(dep_delay >= 60 & dep_delay - arr_delay > 30) 
  
flights_2 <- flights |>
  arrange(desc(dep_delay), hour, minute)

flights |>
  arrange(desc(distance/air_time))

flights |>
  distinct(day, month, year)
# Yes

flights_2 <- flights |>
  arrange(desc(distance))

flights_2 <- flights |>
  arrange(distance)


glimpse(flights_2)        


# Always filter before sorting with arrange