flights |>
  select(dep_time, sched_dep_time, dep_delay)

# dep_time = sched_dep_time + dep_delay

flights

flights |>
  select(dep_time, dep_delay, arr_time, arr_delay)

flights |>
  select(dep_time:arr_delay & !sched_dep_time & !sched_arr_time)

flights |>
  select(dep_time:arr_delay & !c(sched_dep_time, sched_arr_time))

# It only displays the columns once
flights |>
  select(flight, flight)

# Useful for removing columns without errors
variables <- c("year", "month", "day", "dep_delay", "arr_delay")

flights |>
  select(!any_of(variables))

# Can use argument ignore.case = FALSE to switch to case sensitive
flights |> select(contains("TIME"))

flights |> select(contains("TIME", ignore.case = FALSE))

flights |> 
  rename(air_time_min = air_time) |> 
  relocate(air_time_min)

flights |> 
  select(tailnum) |> 
  arrange(arr_delay)
# doesn't work because we've selected only one column (tailnum)





