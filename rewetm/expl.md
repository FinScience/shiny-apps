
### Last Update


```r
Sys.time()
```

```
## [1] "2015-02-23 17:19:30 CET"
```

***

### Code

The code of this application can be found in this [Github repository][1].

### Data Set




The data sets have been directly retrived with an own Twitter application.

Related Twitter Accounts:

* [REWE][2]

        Number of analyzed tweets after cleaning: 708

* [toom][3] 

        Number of analyzed tweets after cleaning: 531

* [BIPA][4] 
        
        Number of analyzed tweets after cleaning: 618

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
library(RColorBrewer)
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
library(ape)
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
##  package    * version    date       source                              
##  bit        * 1.1-12     2014-04-09 CRAN (R 3.1.0)                      
##  bit64      * 0.9-4      2014-04-09 CRAN (R 3.1.0)                      
##  colorspace * 1.2-4      2013-09-30 CRAN (R 3.1.0)                      
##  DBI        * 0.3.1      2014-09-24 CRAN (R 3.1.1)                      
##  devtools   * 1.7.0      2015-01-17 CRAN (R 3.1.2)                      
##  digest     * 0.6.8      2014-12-31 CRAN (R 3.1.2)                      
##  evaluate   * 0.5.5      2014-04-29 CRAN (R 3.1.0)                      
##  formatR    * 1.0        2014-08-25 CRAN (R 3.1.1)                      
##  ggplot2    * 1.0.0      2014-05-21 CRAN (R 3.1.2)                      
##  gtable     * 0.1.2      2012-12-05 CRAN (R 3.1.0)                      
##  htmltools  * 0.2.6      2014-09-08 CRAN (R 3.1.1)                      
##  httr       * 0.6.1.9000 2015-01-09 Github (hadley/httr@778ed3c)        
##  knitr      * 1.9        2015-01-20 CRAN (R 3.1.2)                      
##  MASS       * 7.3-39     2015-02-20 CRAN (R 3.1.2)                      
##  munsell    * 0.4.2      2013-07-11 CRAN (R 3.1.0)                      
##  plyr       * 1.8.1      2014-02-26 CRAN (R 3.1.0)                      
##  proto      * 0.3-10     2012-12-22 CRAN (R 3.1.0)                      
##  Rcpp       * 0.11.4     2015-01-24 CRAN (R 3.1.2)                      
##  reshape2   * 1.4.1      2014-12-06 CRAN (R 3.1.2)                      
##  rjson      * 0.2.15     2014-11-03 CRAN (R 3.1.2)                      
##  rmarkdown  * 0.5.1      2015-01-26 CRAN (R 3.1.2)                      
##  rstudioapi * 0.2        2014-12-31 CRAN (R 3.1.2)                      
##  scales     * 0.2.4      2014-04-22 CRAN (R 3.1.0)                      
##  stringr    * 0.6.2      2012-12-06 CRAN (R 3.1.2)                      
##  twitteR    * 1.1.8      2015-01-09 Github (geoffjentry/twitteR@964f2d0)
##  yaml       * 2.1.13     2014-06-12 CRAN (R 3.1.0)
```



[1]: https://github.com/mhnierhoff/shiny-apps/tree/master/rewetm "Github Repo"

[2]: https://twitter.com/rewe_supermarkt "REWE Twitter Account"

[3]: https://twitter.com/toomteam "toom team Twitter Account"

[4]: https://twitter.com/BIPA "BIPA Twitter Account"

[5]: http://nierhoff.info/#contact "Contact"

***
