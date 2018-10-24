getwd()
setwd("C:/Users/praveen/Desktop/DataScience/DDP")
if(!file.exists("Week 3"))
{
  dir.create("Week 3")
}

#install.packages("mvtsplot")
library(mvtsplot)
export(mvtsplot)
importFrom(graphics, "Axis")
import(splines)
install.packages("graphics")

system("R CMD build newpackage" )
system("R CMD check newpackage")

library(utils)

