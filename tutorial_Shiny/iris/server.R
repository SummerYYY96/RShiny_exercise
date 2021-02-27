library(shiny)
library(tidyverse)

# Define server logic required to draw a boxplot
shinyServer(function(input, output) {
  
  # Expression that generates a boxplot. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$boxPlot <- renderPlot({
    
    plotTrait <- as.name(input$trait) # convert string to name
    
    # set up the plot
    pl <- ggplot(data = iris,
                 aes(x=Species,
                     y= !! plotTrait, # !! to use the column names contained in plotTrait
                     fill=Species))
    
    # draw the boxplot for the specified trait
    pl + geom_boxplot()
  })
  
  output$vln_plot <- renderPlot({
    
    plotTrait <- as.name(input$trait) # convert string to name
    
    # set up the plot
    p <- ggplot(data = iris, aes(x=Species, y=!!plotTrait, fill=Species)) +
      geom_violin()
    
    # draw the boxplot for the specified trait
    p
  })
})