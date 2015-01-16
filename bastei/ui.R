################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################
##                                                                            ##
##                   Forecasting Models for Website Traffic                   ##
##                                                                            ##            
##                    App & Code by Maximilian H. Nierhoff                    ##
##                                                                            ##
##                           http://nierhoff.info                             ##
##                                                                            ##
##                    http://apps.nierhoff.info/bastei                        ##
##                                                                            ##
################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################

library(shiny)
library(shinyIncubator)
library(zoo)
library(timeDate)
library(datasets)
library(forecast)
library(knitr)
library(rmarkdown)

############################### ~~~~~~~~~~~~~~~~~ ##############################

## Define UI 

shinyUI(fluidPage(
        
        tags$head(includeScript("ga-bastei.js")),
        
        
        # Application title
        titlePanel("Website Traffic Rank Forecasting"),
        
        sidebarLayout(

############################### ~~~~~~~~~~~~~~~~~ ##############################

## Sidebar with controls to select the dataset and forecast ahead duration
        
        sidebarPanel(
                
                wellPanel(
                tags$div(selectInput(inputId = "page", 
                                    label = "Select a website:",
                                    choices = c("Bastei.de",
                                                "Bastei Luebbe Academy",
                                                "Beam Ebooks",
                                                "Bookrix",
                                                "Daedalic",
                                                "PMV Raetsel",
                                                "Praesenta.de",
                                                "Raeder.de"),
                                    selected = "Bastei.de"),
                        align = "left")
                ),
                
                wellPanel(
                tags$div(selectInput(inputId = "model",
                                    label = "Select a forecasting model:",
                                    #br(),
                                    choices = c("ARIMA", "ETS", "TBATS", 
                                                "StructTS", "Holt-Winters", 
                                                "Theta", "Cubic Spline",
                                                "Random Walk", "Naive",
                                                "Mean"),
                                    selected = "ARIMA"),
                         align = "left")
                ),

                wellPanel(
                tags$div(numericInput("ahead", "Days to forecast ahead:", 30),
                         align = "left")   
                ),
                
############################### ~~~~~~~~~~~~~~~~~ ##############################                

## Option to download the Forecasting model plot & both decomposition plots
                
                
                p("By clicking on the button a plot of the selected 
                   forecasting model and both decomposition plots can 
                   be downloaded."),
                wellPanel(
                tags$div(downloadButton("downloadPlot", "Download Model Plot"),
                         align = "center")
                ),
                width = 3),
        
        
############################### ~~~~~~~~~~~~~~~~~ ##############################        

## Show Forecasting Plots

        mainPanel(
                
                tabsetPanel(
                        tabPanel("Model Plot", 
                                 plotOutput("fmplot"),
                                 tags$strong(textOutput("caption1"), 
                                          align = "center"),
                                 tags$div("Historical Data: Alexa.com | Metric: 
                                 Alexa Traffic Rank - Global", align="center",
                                 br(),
                                 "Forecast based on data from 
                                 27.06.2014 - 04.01.2015")),
                        
                        tabPanel("Forecasting Data",
                                 tags$div(textOutput("caption2"), 
                                          align = "left"),
                                 tags$br(),
                                 verbatimTextOutput("fmtable")),
                        
                        tabPanel("Decomposition Plots",
                                 tags$div(strong("STL Decomposition"), 
                                          align ="center"),
                                 plotOutput("STLdcomp"),
                                 textOutput("caption3"),
                                 tags$hr(),
                                 plotOutput("Ndcomp"),
                                 (textOutput("caption4")),
                                 tags$hr()),
                        
                        tabPanel("About", includeMarkdown("expl.md"))
                ),
                
                tags$hr(),
                tags$span(style="color:grey", 
                          tags$footer(("© 2015 - "), 
                                    tags$a(
                                    href="http://nierhoff.info",
                                    target="_blank",
                                    "Maximilian H. Nierhoff."), 
                            tags$br(),
                            ("Built with"), tags$a(
                                    href="http://cran.r-project.org",
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
                            
                            align = "center")),
                
                tags$br(),
                
        width = 6)
        )
        
))
