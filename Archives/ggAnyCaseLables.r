### ggplot convert labels to sentence case
### Authors: Nirmal Kannaiyan, Rajinder Gupta
### Date: 08.06.2022
### Version_1

library(snakecase)
ggAnyCaseLabel <- function(plot, case="title", ...) {

	### convert case
	plot$labels <- lapply(plot$labels, function(x) to_any_case(x, case=case))

	return(plot)

}


# example
# plot <- ggplot()+...
# ggAnyCaseLabel(plot)
