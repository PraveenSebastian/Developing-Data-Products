
# GoogleVis ---------------------------------------------------------------

#install.packages("googleVis")
library(googleVis)
suppressPackageStartupMessages(library(googleVis))
Fruits
M <- gvisMotionChart(Fruits, "Fruit", "Year", options = list(width=600, height=400))
plot(M)

G <- gvisGeoChart(Exports, locationvar = "Country", colorvar = "Profit", options = list(width=600, height=400))
plot(G)

print(Line, "chart")

Exports

G2 <- gvisGeoChart(Exports, locationvar = "Country", colorvar = "Profit", options = list(width=600, height=400, region= "150"))
plot(G2)

G3 <- gvisMerge(G, G2, horizontal = TRUE, tableOptions = "bgcolor=\"#CCCCCC\" cellspacing=10")
plot(G3)
