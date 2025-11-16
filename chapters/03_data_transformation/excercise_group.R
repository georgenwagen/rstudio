flights |> 
  group_by(carrier, origin) |> 
  summarize(
    n(),
    total_arr_delay = sum(arr_delay, na.rm = TRUE),
    avg_delay = mean(dep_delay, na.rm = TRUE),
  ) |>
  arrange(desc(total_arr_delay))

flights |>
  group_by(dest) |>
  slice_max(dep_delay, n = 1) |>
  arrange(desc(dep_delay)) |>
  relocate(dest, dep_delay, flight)

flights |>
  group_by(hour) |>
  summarize(
    total = n(),
    mean(dep_delay, na.rm = TRUE)
)

flights |>
  group_by(day) |>
  slice_min(dep_delay, n = 1, with_ties = FALSE)
# negative n subtracts the rows to select. so for a group size of 100 and total rows 1000 it will select 900 rows

df <- tibble(
  x = 1:5,
  y = c("a", "b", "a", "a", "b"),
  z = c("K", "K", "L", "L", "K")
)

df |>
  group_by(y)

# arrange -> aaabb

df |>
  arrange(y)

# L, K

df |>
  group_by(y) |>
  summarize(mean_x = mean(x))

# a, k - 1; a, l - 3,5; b, k - 3

df |>
  group_by(y, z) |>
  summarize(mean_x = mean(x))

# a, k - 1; a, l - 3,5; b, k - 3,5

df |>
  group_by(y, z) |>
  summarize(mean_x = mean(x), .groups = "drop")

# Summary

df |>
  group_by(y, z) |>
  summarize(mean_x = mean(x))

# All the rows

df |>
  group_by(y, z) |>
  mutate(mean_x = mean(x))

