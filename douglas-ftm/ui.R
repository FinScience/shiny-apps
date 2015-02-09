################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################
##                                                                            ##
##                        Text Mining of Facebook Posts                       ##
##                                                                            ##            
##                    App & Code by Maximilian H. Nierhoff                    ##
##                                                                            ##
##                           http://nierhoff.info                             ##
##                                                                            ##
##       Live version of this app: http://apps.nierhoff.info/douglas-ftm      ##
##                                                                            ##
##  Github: https://github.com/mhnierhoff/shiny-apps/tree/master/douglas-ftm  ##
##                                                                            ##
################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################  

suppressPackageStartupMessages(c(
        library(graph),
        library(NLP),
        library(tm),
        library(shinyIncubator),
        library(shinythemes),
        library(grid),
        library(pvclust),
        library(Rgraphviz),
        library(qdapTools),
        library(qdapRegex),
        library(magrittr),
        library(wordcloud),
        library(RColorBrewer),
        library(ggplot2),
        library(rJava),
        library(RCurl),
        library(bitops),
        library(BH),
        library(ape),
        library(topicmodels),       
        library(qdap)))


shinyUI(navbarPage("Facebook Text Mining", 
                 
                   theme = shinytheme("flatly"),
                   


############################### ~~~~~~~~1~~~~~~~~ ##############################                   

## NAVTAB 1 - Wordcloud and Word-Letter Ratio Plot

        tabPanel("Words",
                 
                 #tags$head(includeScript("./www/ga-douglas-ftm.js")),
                 
                 sidebarLayout(
                                  
                         sidebarPanel(
                                 radioButtons(inputId = "tdmwc",
                                              label = "Select Facebook page:",
                                              choices = pages),
                         
                                 tags$hr(),
                                 
                                 sliderInput("minfreqWord", 
                                             label = "Minimum frequency 
                                             of plotted words:",
                                             min = 10, max = 50, value = 20),
                                 
                                 tags$hr(),
                                 
                                 sliderInput("maxfreqWord", 
                                             "Maximum number 
                                             of plotted words:", 
                                             min = 1,  max = 200,  value = 100),
                                 
                         width = 3),
                         
                         mainPanel(
                                 
                                 tabsetPanel(
                                         
                                         tabPanel("Wordcloud",
                                                  
                                                  plotOutput("wordPlot")),
                                         
                                         tabPanel("Word-Letter Ratio",
                                                  
                                                  plotOutput("ratioPlot"))
                                ),
                                 
                        width = 6)
                )
        ),

############################### ~~~~~~~~2~~~~~~~~ ##############################


## NAVTAB 2 - Cluster Dendrogram

tabPanel("Cluster Dendrogram",
         
         sidebarLayout(
                 
                 sidebarPanel(
                         radioButtons(inputId = "tdmcd",
                                      label = "Select Facebook page:",
                                      choices = pages),
                         
                         tags$hr(),
                         
                         sliderInput("clusterNumber", 
                                     label = "Number of terms cluster:",
                                     min = 2, max = 10, value = 2),
                         
                         width = 3),
                 
                 mainPanel(
                         
                         plotOutput("clusterPlot"),
                         
                         width = 6)
                 
         )
),


############################### ~~~~~~~~3~~~~~~~~ ##############################

## NAVTAB 3 - Association Plot

tabPanel("Association Plot",
         
         sidebarLayout(
                 
                 sidebarPanel(
                         radioButtons(inputId = "tdmap",
                                      label = "Select Facebook page:",
                                      choices = pages),
                         
                         tags$hr(),
                         
                         sliderInput("lowfreqAssoc", 
                                     label = "Number of frequent terms:",
                                     min = 10, max = 70, value = 30),
                         
                         width = 3),
                 
                 mainPanel(
                         
                         plotOutput("assocPlot"),
                         
                         width = 6)
         )
),

############################### ~~~~~~~~4~~~~~~~~ ##############################

## NAVTAB 4 - Topic Modelling

tabPanel("Topic Modelling",
         
         sidebarLayout(
                 
                 sidebarPanel(
                         radioButtons(inputId = "tdmtm",
                                      label = "Select Facebook page:",
                                      choices = pages),
                         
                         tags$hr(),
                         
                         sliderInput("lowfreqAssoc", 
                                     label = "Number of frequent terms:",
                                     min = 10, max = 70, value = 30),
                         
                         width = 3),
                 
                 mainPanel(
                         
                         plotOutput("tmPlot"),
                         
                         width = 6)
         )
),

############################### ~~~~~~~~5~~~~~~~~ ##############################

## NAVTAB 5 - Term Frequency Plot & Table

        tabPanel("Term Frequency",
                
                sidebarLayout(
                        
                        sidebarPanel(
                                radioButtons(inputId = "tdmtf",
                                             label = "Select Facebook page:",
                                             choices = pages),
                                
                                tags$hr(),
                                
                                sliderInput("freqNumber", 
                                            label = "Minimum frequency of terms:",
                                            min = 10, max = 100, value = 25),
                                
                                width = 3),
                
                        mainPanel(
                        
                    
                                tabsetPanel(
                            
                            
                                        tabPanel("Chart",
                                     
                                     
                                                 plotOutput("freqPlot")),
                                
                            
                            
                                        tabPanel("Table",
                        
                                     
                                                 dataTableOutput("freqTable"))
                                
                                ),
                        
                        width = 6)
                
                )
        
        ),

############################### ~~~~~~~~A~~~~~~~~ ##############################

## About
       
        tabPanel("About",
                fluidRow(
                        column(1,
                               p("")),
                        column(10,
                               includeMarkdown("./about/expl.md")),
                        column(1,
                               p(""))
                        )
                ),
        
############################### ~~~~~~~~F~~~~~~~~ ##############################

## Footer

tags$hr(),

tags$span(style="color:grey", 
          tags$footer(("© 2015 - "), 
                      tags$a(
                              href="http://nierhoff.info",
                              target="_blank",
                              "Maximilian H. Nierhoff."), 
                      tags$br(),
                      ("Built with"), tags$a(
                              href="http://www.r-project.org/",
                              target="_blank",
                              "R,"),
                      tags$a(
                              href="http://shiny.rstudio.com",
                              target="_blank",
                              "Shiny"),
                      ("&"), tags$a(
                              href="http://www.rstudio.com/products/shiny/shiny-server",
                              target="_blank",
                              "Shiny Server."),
                      ("Hosted on"), tags$a(
                              href="https://www.digitalocean.com/?refcode=f34ade566630",
                              target="_blank",
                              "DigitalOcean."),
                      
                      align = "center"),
          
          tags$br()
          
)
)
)