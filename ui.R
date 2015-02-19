library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Predicting Tree Circumference by Age"),
  
  # Sidebar with a slider input for number of bins
  sidebarPanel(
    h5("This shiny app allows you to predict the circumference (in mm) of an 
        orange tree based on the age (in days) of that tree.
       The model is based on the 'Orange' data found in the R datasets package.
        Simply use the slider below to select an age and the app will show you 
       the predicted circumference and plot the data, model, and indicated age 
       and circumference"),
      
      sliderInput("age", "Select Age of Tree in Days:",
                  min=120,
                  max=1500, 
                  step=10,
                  value=900)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
      h4("You entered:"),
    verbatimTextOutput("age"),
    h4("Predicted Circumference, in mm"),
    verbatimTextOutput("circumference"),
    
    plotOutput("Plot")
  )
))
