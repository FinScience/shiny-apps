################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################
##                                                                            ##
##                        Text Mining of Twitter Tweets                       ##
##                                                                            ##            
##                    App & Code by Maximilian H. Nierhoff                    ##
##                                                                            ##
##                           http://nierhoff.info                             ##
##                                                                            ##
##       Live version of this app: https://apps.nierhoff.info/unitymedia      ##
##                                                                            ##
##   Github: https://github.com/mhnierhoff/shiny-apps/tree/master/unitymedia  ##
##                                                                            ##
################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################  

suppressPackageStartupMessages(c(
        library(graph),
        library(twitteR),
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
        library(RCurl),
        library(bitops),
        library(dendextend),
        library(BH),        
        library(rJava),
        library(topicmodels),
        library(qdap)))


shinyUI(navbarPage("Twitter Text Mining", 
                 
                   theme = shinytheme("flatly"),
                   


############################### ~~~~~~~~1~~~~~~~~ ##############################                   

## NAVTAB 1 - Wordcloud and Word-Letter Ratio Plot

tabPanel("Words",
         
         tags$head(includeScript("./js/ga-unitymedia.js")),
         
         sidebarLayout(
                 
                 sidebarPanel(
                         radioButtons(inputId = "tdmwc",
                                      label = "Select a Twitter account:",
                                      choices = accounts),
                         
                         tags$hr(),
                         
                         sliderInput("minfreqWord", 
                                     label = "Minimum frequency 
                                             of plotted words:",
                                     min = 5, max = 100, value = 20),
                         
                         tags$hr(),
                         
                         sliderInput("maxfreqWord", 
                                     "Maximum number 
                                             of plotted words:", 
                                     min = 1,  max = 250,  value = 100),
                         
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
                                      label = "Select a Twitter account:",
                                      choices = accounts),
                         
                         tags$hr(),
                         
                         sliderInput("clusterNumber", 
                                     label = "Number of terms cluster:",
                                     min = 1, max = 5, value = 2),
                         
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
                                      label = "Select a Twitter account:",
                                      choices = accounts),
                         
                         tags$hr(),
                         
                         sliderInput("lowfreqAssoc", 
                                     label = "Number of frequent terms:",
                                     min = 15, max = 150, value = 55),
                         
                         width = 3),
                 
                 mainPanel(
                         
                         plotOutput("assocPlot"),
                         
                         width = 6)
         )
),

############################### ~~~~~~~~4~~~~~~~~ ##############################

## NAVTAB 4 - Term Frequency Plot & Table

tabPanel("Term Frequency",
         
         sidebarLayout(
                 
                 sidebarPanel(
                         radioButtons(inputId = "tdmtf",
                                      label = "Select a Twitter account:",
                                      choices = accounts),
                         
                         tags$hr(),
                         
                         sliderInput("freqNumber", 
                                     label = "Minimum frequency of terms:",
                                     min = 10, max = 200, value = 45),
                         
                         width = 3),
                 
                 mainPanel(
                         
                         plotOutput("freqPlot"),
                         
                         
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
                        includeMarkdown("./expl.md")),
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