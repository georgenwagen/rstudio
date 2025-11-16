# Rows

flights |>
  filter(dest == "IAH") |> 
  group_by(year, month, day) |> 
  summarize(
    arr_delay = mean(arr_delay, na.rm = TRUE)
  )

# Flights that departed more than 2 hours late
flights |> 
  filter(dep_delay > 120)

# Flights that departed on January 1
flights |> 
  filter(month == 1 & day == 1)

# Flights that departed in January or February
flights |> 
  filter(month == 1 | month == 2)

# A shorter way to select flights that departed in January or February
flights |> 
  filter(month %in% c(1, 2))

flights |> 
  arrange(desc(dep_delay))

flights |> 
  distinct()

flights |> 
  distinct(origin, dest)

flights |> 
  distinct(origin, dest, .keep_all = TRUE)

flights |>
  count(origin, dest, sort = TRUE)

# Columns

flights |> 
  mutate(
    gain = dep_delay - arr_delay,
    speed = distance / air_time * 60,
    .before = 4
  )

# Select columns by name
flights |> 
  select(year, month, day)

# Select all columns between year and day (inclusive)
flights |> 
  select(year:day)

# Select all columns except those from year to day (inclusive)
flights |> 
  select(!year:day)

# Select columns where data type is <chr>
flights |> 
  select(where(is.character))

# Rename tailnum as tail_num
flights |> 
  select(tail_num = tailnum)

# Same thing but keeps the existing columns
flights |> 
  rename(tail_num = tailnum)

# Move columns to the front
flights |> 
  relocate(time_hour, air_time)
flights |> 
  relocate(year:dep_time, .after = time_hour)
flights |> 
  relocate(starts_with("arr"), .before = dep_time)

# Groups

flights |> 
  group_by(month)

flights |> 
  group_by(month) |> 
  summarize(
    avg_delay = mean(dep_delay)
  )
# Error, ignore missing values with na.rm = TRUE

flights |> 
  group_by(month) |> 
  summarize(
    avg_delay = mean(dep_delay, na.rm = TRUE),
    n = n() # Number of rows
  )

# flights that are most delayed upon arrival at each destination
flights |> 
  group_by(dest) |> 
  slice_max(arr_delay, n = 1, with_ties = FALSE) |> # Tied values are not omitted by default
  relocate(dest)

daily <- flights |>  
  group_by(year, month, day)
daily

daily_flights <- daily |> 
  summarize(n = n())

daily_flights <- daily |> 
  summarize(
    n = n(), 
    .groups = "drop_last"
  )

daily |> 
  ungroup()

daily |> 
  ungroup() |>
  summarize(
    avg_delay = mean(dep_delay, na.rm = TRUE), 
    flights = n()
  )

flights |> 
  summarize(
    delay = mean(dep_delay, na.rm = TRUE), 
    n = n(),
    .by = month
  )

flights |> 
  summarize(
    delay = mean(dep_delay, na.rm = TRUE), 
    n = n(),
    .by = c(origin, dest)
  )
