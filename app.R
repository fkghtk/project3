library(shiny)

ui <- fluidPage(
  titlePanel('Adequate Life Insurance Company'),
  
  sidebarLayout(
    sidebarPanel(
      helpText('LifeInsurance'),
      
      selectInput('LifeInsurance Company',
                  label = 'Company List',
                  choices = c('Samsung','Hanwha',
                              'HeungKook','Kyobo',
                              "Prudential",'Shinhan',
                              'DGB','KDB','MiraeAsset',
                              'KB','DongYang','OrangeLife',
                              'Hana','BNP','Pubon','ABL',
                              'MetLife','ChervLife','Laina',
                              'AIA','IBK','NH','KyoboLifePlanet'),
                  selected = 'Samsung')
                  ),
    
  mainPanel(
    plotOutput(outputId='distPlot'))
    )
  )

server <- function(input,output){
  
  output$distPlot <- renderPlot({
    x    <- insurance2$Company
    bins <- seq(min(x), max(x), length.out = insurance2X1 + 1)
    hist(x, Company = bins, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
  })
}

shinyApp(ui,server)