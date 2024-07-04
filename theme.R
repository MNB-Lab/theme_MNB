
library(ggplot2)
library(ggpubr)

#' Custom Theme for ggplot2
#'
#' This function creates a custom theme for ggplot2 plots with specified legend position and base text size.
#'
#' @param legend.position Position of the legend. Default is "bottom".
#' @param baseTextSize Base size for text elements. Default is 8.
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
#' p + fnTheme(legend.position = "right", baseTextSize = 10)
fnTheme <- function(legend.position = "bottom", baseTextSize = 8, x.text.angle =0, ...) {

  # Additional arguments
  args <- list(...)

  # Create the custom theme
  custom_theme <- theme_pubr(legend = legend.position) +
    labs_pubr() +
    theme(
      axis.line = element_line(size = 0.5, color = "gray50"),
      axis.ticks = element_line(size = 0.5, color = "gray50"),
      axis.text = element_text(size = baseTextSize),
      axis.text.x = element_text(size = baseTextSize, angle = x.text.angle),
      axis.title = element_text(size = baseTextSize + 2, face = "bold"),
      plot.title = element_text(size = baseTextSize + 4, face = "bold"),
      plot.subtitle = element_text(size = baseTextSize + 2, face = "bold"),
      legend.title = if ("legend.title" %in% names(args)) args$legend.title else element_text(size = baseTextSize + 2),
      legend.text = element_text(size = baseTextSize),
      legend.key.size = unit(0.3, "cm"),
      ...
    )

  return(custom_theme)
}

