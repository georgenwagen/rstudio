# 1.
# Manufacturer, model, class, fl, drv, cyl, year, trans

# 2., 3., 4.
ggplot(
  mpg,
  aes(hwy, displ, color = cty, size = cty)
) +
  geom_point()


# 5.
ggplot(
  penguins,
  aes(bill_depth_mm, bill_length_mm, color = species)
) +
  geom_point() +
  geom_smooth(method = "lm")
# Coloring reveals a clear sign of a positive correlation between bill depth and length.

# 6.
# To fix it we need to name the shape in labs to "Species".
ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm, y = bill_depth_mm, 
    color = species, shape = species
  )
) +
  geom_point() +
  labs(color = "Species", shape = "Species")

# 7.
# You can answer to what proportion "qualitative" the penguins live on each island.
ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar(position = "fill")

# You can answer which islands are inhabited by a species of penguin.
ggplot(penguins, aes(x = species, fill = island)) +
  geom_bar(position = "fill")
