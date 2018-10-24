Shiny Application Course Project
========================================================
author: Praveen Sebastian
date: 12/04/2018
autosize: true

Predicting number of assualt arrests from Urban Population
========================================================

You can view the shiny app on the below URL
<https://praveensebastian.shinyapps.io/trial/>.

- Uses the free data set 'USArrests' 
- 'Assault' on Y-Axis with 'UrbanPop' on X-Axis
- It is a linear model which includes a slider for accepting user defined value for 'UrbanPop'

Code for UI.R
========================================================
class: small-code

```r
library(shiny)

shinyUI(fluidPage(
  titlePanel("Predict number of Assault arrests from Urban Population"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderUrbanPopulation", "What is the numeric Percent of Urban Populaion you want to select?", 30, 100, value = 20)
      ),
   
    mainPanel(
      plotOutput("plot"),
      h3("Predicted assault arrests from Model "),
      textOutput("pred")
      
    )
  )

  ))
```

<!--html_preserve--><div class="container-fluid">
<h2>Predict number of Assault arrests from Urban Population</h2>
<div class="row">
<div class="col-sm-4">
<form class="well">
<div class="form-group shiny-input-container">
<label class="control-label" for="sliderUrbanPopulation">What is the numeric Percent of Urban Populaion you want to select?</label>
<input class="js-range-slider" id="sliderUrbanPopulation" data-min="30" data-max="100" data-from="20" data-step="1" data-grid="true" data-grid-num="10" data-grid-snap="false" data-prettify-separator="," data-prettify-enabled="true" data-keyboard="true" data-keyboard-step="1.42857142857143" data-data-type="number"/>
</div>
</form>
</div>
<div class="col-sm-8">
<div id="plot" class="shiny-plot-output" style="width: 100% ; height: 400px"></div>
<h3>Predicted assault arrests from Model </h3>
<div id="pred" class="shiny-text-output"></div>
</div>
</div>
</div><!--/html_preserve-->

Basic plot of number of assault arrests Vs Urban Population percent
========================================================

![plot of chunk unnamed-chunk-1](presentaion-figure/unnamed-chunk-1-1.png)

Code for server.R
========================================================
class: small-code

```r
library(shiny)

shinyServer(function(input, output) {
  
  model <- lm(Assault ~ UrbanPop, data = USArrests)
  
  
  modelpred <- reactive({
    
    UrbanPopInput <- input$sliderUrbanPopulation
    
    predict(model, newdata = data.frame(UrbanPop = UrbanPopInput))
  })
  
  
  output$plot <- renderPlot({
    UrbanPopInput <- input$sliderUrbanPopulation
    
    
    plot(USArrests$UrbanPop, USArrests$Assault, xlab = "Urban Population in numeric ",
         ylab = "Assualt Arrests in numeric ", bty = "n", pch = 16,
         xlim = c(30,100), ylim = c(45, 350))
   abline(model, col = "Green", lwd = 2) 
   legend(25,230, c("Model Prediction"), pch = 16, col = c("red"), bty = "n", cex = 1.2)
   
  })
  
  output$pred <- renderText({
    modelpred()
  })
  
})
```

