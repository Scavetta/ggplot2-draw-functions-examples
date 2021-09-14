# Comparing visuals of using many points for a curve.
# Rick Scavetta
# 14.08.2021

# Packages
library(tidyverse)
library(glue)

# Create function
# Draw a curve with a variable number of points (10^p) to connect small line segments
# Save to file
plot_func <- function(p) {
  
  ggplot() +
    xlim(-5, 5) + 
    stat_function(fun = ~ .x^2, geom = "line", n = 10^p) +
    ggtitle(glue("10^{p} points using geom_point"))
  
  ggsave(glue("plot_function_10^{p}pts.pdf"), height = 4, width = 4, units = "in")
  
}

# Draw 10^1 until 10^6 points conneced with geom_line to form a curve
# For stat_function the default number of points is n = 101
# Drawing a function with 10^2 points looks just as good as using 10^6 points!
1:6 %>% 
  walk(~ plot_func(.x))

# For a LOESS smooth, the default number of points is n = 80 and it also looks pretty good!
ggplot(mtcars, aes(mpg, wt)) +
  stat_smooth(se = FALSE, geom = "point")


