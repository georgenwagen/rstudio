ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, 
                y = body_mass_g)
) + 
  geom_point(na.rm = TRUE, mapping = aes(color = bill_depth_mm)) +
  geom_smooth(na.rm = TRUE, method = "loess", span = 0.9, linewidth = 1.5)
