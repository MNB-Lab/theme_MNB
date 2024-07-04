# Author: Nirmal
# Date: 4th July 2024

library(ggplot2)
library(ggpubr)

#' Custom Theme for ggplot2
#'
#' This function creates a custom theme for ggplot2 plots with specified legend position and base text size.
#'
#' @param legend.position Position of the legend. Default is "bottom".
#' @param baseTextSize Base size for text elements. Default is 8.
#' @param vjustx numeric, for vjust on x axis, used when x.text.angle is not 0
#' @param hjustx numeric, for hjust on x axis, used when x.text.angle is not 0
#' @param x.text.angle numeric, angle for x axis text
#' @param legend.key.size default 0.4, numeric, in cm
#' @param ... Additional arguments to pass to the `theme` function.
#'
#' @return A `ggplot2` theme object.
#' @import ggplot2
#' @import ggpubr
#' @export
#'
#' @examples
#' # Example usage
#' library(ggplot2)
#' library(ggpubr)
#'
#' p <- ggplot(mtcars, aes(mpg, wt)) + geom_point() + ggtitle("Scatter plot of MPG vs WT")
#' p + fnTheme(legendfnTheme <- function(legend.position = "bottom", baseTextSize = 8, x.text.angle = 0, vjustx = NULL, hjustx = NULL, ...) {

# Additional arguments
fnTheme <- function(legend.position = "bottom", baseTextSize = 8, x.text.angle = 0, vjustx = NULL, hjustx = NULL, 
                    legend.key.size = 0.4, ...) {
  
  # Determine vjust and hjust based on x.text.angle
  vjust <- if (!is.null(vjustx)) vjustx else if (x.text.angle != 0) 0.5 else 0.5
  hjust <- if (!is.null(hjustx)) hjustx else if (x.text.angle != 0) 0.5 else 0.5
  
  # Create the custom theme
  custom_theme <- theme_pubr(legend = legend.position) +
    labs_pubr() +
    theme(
      axis.line = element_line(size = 0.5, color = "gray50"),
      axis.ticks = element_line(size = 0.5, color = "gray50"),
      axis.text = element_text(size = baseTextSize),
      axis.text.x = element_text(size = baseTextSize, angle = x.text.angle, vjust = vjust, hjust = hjust),
      axis.title = element_text(size = baseTextSize + 2, face = "bold"),
      plot.title = element_text(size = baseTextSize + 4, face = "bold"),
      plot.subtitle = element_text(size = baseTextSize + 2, face = "bold"),
      legend.title = element_text(size = baseTextSize + 2),
      legend.text = element_text(size = baseTextSize),
      legend.key.size = unit(legend.key.size, "cm"),
      ...
    )
  
  return(custom_theme)
}


