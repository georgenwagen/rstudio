# 1.
ggplot(mpg, aes(x = class)) +
  geom_bar()
ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point()
ggsave("mpg-plot.png")
# The plot that is currently active is saved

# 2.
ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point()
ggsave("mpg-plot.pdf", device = "pdf")
# Change the file extension to .pdf and read docs for file compatibility using ?ggsave.
# You can also specify the device in this case "pdf", 
# "if NULL (default), the device is guessed based on the filename extension".