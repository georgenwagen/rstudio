# 2.
libary(tidyverse)

ggplot(data = mpg,
       mapping = aes(x = displ, y = hwy)) + 
  geom_point() +
  geom_smooth(method = "lm")

# 3. opens up keyboard shorcut menu

# 4. the first one is saved due to the variable name set in ggsave
my_bar_plot <- ggplot(mpg, aes(x = class)) +
  geom_bar()
my_scatter_plot <- ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point()
ggsave(filename = "mpg-plot.png", plot = my_bar_plot)