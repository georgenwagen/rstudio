ggplot(
  data = penguins,
  mapping = aes(x = bill_depth_mm, y = bill_length_mm,
                color = species, shape = species)
) +
geom_point(na.rm = TRUE) +
geom_smooth(method = "lm") +
labs(
  caption = "Data come from the palmerpenguins package."
)
