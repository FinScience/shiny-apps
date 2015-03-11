
### Last Update


```r
Sys.time()
```

```
## [1] "2015-03-09 16:58:22 CET"
```

***

### Code

The code of this application can be found in this [Github repository][1].

### Data Set




The data sets have been directly retrived with an own Twitter application.

Related Twitter Accounts:

* [Unitymedia][2]

        Number of analyzed tweets after cleaning: 857

* [Telekom][3] 

        Number of analyzed tweets after cleaning: 892

* [Vodafone][4] 
        
        Number of analyzed tweets after cleaning: 913
        
* [o2][4] 
        
        Number of analyzed tweets after cleaning: 240
        
* [1&1][4] 
        
        Number of analyzed tweets after cleaning: 516

***

### Notices

This application is primarily a demo to show what is possible. 

In case of any questions related to this application, feel free to write [me a mail.][5]

***

### Used R Packages


```r
library(graph)
library(twitteR)
library(NLP)
library(tm)
library(shinyIncubator)
library(grid)
library(pvclust)
library(Rgraphviz)
library(qdapTools)
library(qdapRegex)
library(magrittr)
library(wordcloud)
library(RColorBUnitymediar)
library(ggplot2)
library(RCurl)
library(bitops)
library(shinyapps)
library(BH)
library(qdap)
library(SnowballC)
library(slam)
library(RWeka)
library(rJava) 
library(RWekajars)
library(memoise)
library(devtools)
library(rjson)
library(bit64)
library(httr)
library(plyr)
library(dendextend)
library(rJava)
library(topicmodels)
library(shinythemes)
```

***

### Last Session Info


```r
devtools::session_info()
```

```
## Session info --------------------------------------------------------------
```

```
##  setting  value                       
##  version  R version 3.1.2 (2014-10-31)
##  system   x86_64, darwin13.4.0        
##  ui       X11                         
##  language (EN)                        
##  collate  de_DE.UTF-8                 
##  tz       Europe/Berlin
```

```
## Packages ------------------------------------------------------------------
```

```
##  package    * version date       source                            
##  devtools   * 1.7.0   2015-01-17 CRAN (R 3.1.2)                    
##  digest     * 0.6.8   2014-12-31 CRAN (R 3.1.2)                    
##  evaluate   * 0.5.5   2014-04-29 CRAN (R 3.1.0)                    
##  formatR    * 1.0     2014-08-25 CRAN (R 3.1.1)                    
##  htmltools  * 0.2.8   2015-03-02 Github (rstudio/htmltools@cdea0fa)
##  knitr      * 1.9     2015-01-20 CRAN (R 3.1.2)                    
##  rmarkdown  * 0.5.1   2015-01-26 CRAN (R 3.1.2)                    
##  rstudioapi * 0.2     2014-12-31 CRAN (R 3.1.2)                    
##  stringr    * 0.6.2   2012-12-06 CRAN (R 3.1.2)                    
##  yaml       * 2.1.13  2014-06-12 CRAN (R 3.1.0)
```



[1]: https://github.com/mhnierhoff/shiny-apps/tree/master/unitymedia "Github Repo"

[2]: https://twitter.com/unitymedia "Unitymedia Twitter Account"

[3]: https://twitter.com/deutschetelekom "Telekom Twitter Account"

[4]: https://twitter.com/vodafone "Vodafone Twitter Account"

[5]: https://twitter.com/o2entdecken "o2 Twitter Account"

[6]: https://twitter.com/1und1 "1&1 Twitter Account"

[7]: http://nierhoff.info/#contact "Contact"

***