### ggplot Theme for MNB Lab
### Authors: Nirmal Kannaiyan, Rajinder Gupta
### Date: 08.06.2022
### Version_1


theme_mnb <- function(font = "Helvetica", grid = F, legend.position = NULL , ...){
  
  font <- font
  ## Colors
  axisTitleColor  <- "#003153"  # prussian blue
  titleColor <- axisTitleColor
  axisColor <- "#9B9B9B"  #light-grey
  axisTextColor <- "#525252" # dark-grey... almost black!
  stripColor <- "#ECECEC"
  
  if(is.null(legend.position )){
    legend.position = "bottom"
  }
  
  theme <- theme(axis.title = element_text(size=12, face="bold", family = font, colour = axisTitleColor ),
                 axis.text = element_text(size = 12, family = font, colour = axisTextColor),
                 #axis.text.x = element_text(margin = margin(l = 3, r = 3, b = 3)),
                 strip.background = element_rect(fill=stripColor, linetype = NULL),   ## removes the grey box in facets
                 strip.text = element_text(size = 10, face = "bold", family = font, color = axisTextColor),
                 legend.position = legend.position,
                 legend.title =  element_text(size = 8, face = "bold", family = font, color = axisTitleColor ),
                 legend.text = element_text(size = 6, family = font, color = axisTextColor ),
                 title = element_text(size = 16, face = "bold", family = font, colour = titleColor, ),
                 axis.line = element_line(size = 0.5, colour = axisColor),
                 panel.background = element_blank(),
                 plot.title = element_text( hjust=0.5), # centers the title
                 plot.subtitle = element_text( hjust=0.5, size=4) # centers the title
  )
  
  #Grid lines
  #This removes all minor gridlines and adds major y gridlines. In many cases you will want to change this to remove y gridlines and add x gridlines. The cookbook shows you examples for doing so
  if (grid == T) {
    theme <- theme + theme( panel.grid.minor = ggplot2::element_blank(),
                            panel.grid.major.y = ggplot2::element_line(color="#cbcbcb", size=0.25),
                            panel.grid.major.x = ggplot2::element_blank()
    )
    
  }
  return(theme)
}
