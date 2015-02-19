
library(shiny)

data(Orange)
lm.1<-lm(circumference~age, data=Orange)
predict.lm.1<- function( age ) {
    as.vector(lm.1$coef[1])+as.vector(lm.1$coef[2])*age
}

shinyServer(function(input, output) {
   

    output$age <- renderPrint({input$age})
    
    output$circumference <- renderPrint({predict.lm.1(input$age)})
    
    output$Plot <- renderPlot({
        plot(circumference~age, data=Orange)
        abline(lm.1)
        abline(v=input$age, col="red", lwd=3)
        abline(h=predict.lm.1(input$age), col="blue", lty=2)
        
    })
  
})
