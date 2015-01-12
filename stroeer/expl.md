
### Last Update


```r
Sys.time()
```

```
## [1] "2015-01-10 14:12:40 CET"
```

***

### Data

The used data set was derived from own comparisons by the use of an own Alexa.com account.

The presented forecasts relate to the Alexa Traffic Rank metric. Here it is important to note that the lower the rank the better it is.

***

### Models

#### Auto.Arima
Fit best ARIMA model to univariate time series

**Description:**

Returns best ARIMA model according to either AIC, AICc or BIC value. The function conducts a search over possible model within the order constraints provided.

***

#### ETS
Exponential smoothing state space model

**Description:**

Returns ets model applied to y.

***

#### TBATS
TBATS model (Exponential smoothing state space model with Box-Cox transformation, ARMA errors, Trend and Seasonal components)

**Description:**

Fits a TBATS model applied to y, as described in De Livera, Hyndman & Snyder (2011). Parallel processing is used by default to speed up the computations.

***

#### StructTS
Forecasting using Structural Time Series models

**Description:**


Returns forecasts and other information for univariate structural time series models.

***

#### Holt-Winters
Forecasting using Holt-Winters objects

**Description:**

Returns forecasts and other information for univariate Holt-Winters time series models.

***

#### Theta
Theta method forecast

**Description:**

Returns forecasts and prediction intervals for a theta method forecast.

***

#### Random Walk
Random Walk Forecast

**Description:**

Returns forecasts and prediction intervals for a random walk with drift model applied to x.

***

#### Naive
Naive forecasts

**Description:**

```naive()``` returns forecasts and prediction intervals for an ARIMA(0,1,0) random walk model ap- plied to x. ```snaive()``` returns forecasts and prediction intervals from an ARIMA(0,0,0)(0,1,0)m model where m is the seasonal period.

***

#### Cubic Spline
Cubic Spline Forecast

**Description:**

Returns local linear forecasts and prediction intervals using cubic smoothing splines.

***

#### Mean
Mean Forecast

**Description:**

Returns forecasts and prediction intervals for an iid model applied to x. 

***

### Notices

This application is primarily a demo to show what is possible. In favor of the ease of use of this app, the individual models may not be maximally accurate.

In case of any questions related to this application, feel free to write [me a mail.][1]

***

### Used R Packages


```r
library(shiny)
library(shinyIncubator)
library(zoo)
library(timeDate)
library(datasets)
library(forecast)
library(knitr)
library(rmarkdown)
library(lubridate)
```

***

### Last Session Info


```r
sessionInfo()
```

```
## R version 3.1.2 (2014-10-31)
## Platform: x86_64-apple-darwin13.4.0 (64-bit)
## 
## locale:
## [1] de_DE.UTF-8/de_DE.UTF-8/de_DE.UTF-8/C/de_DE.UTF-8/de_DE.UTF-8
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## loaded via a namespace (and not attached):
## [1] digest_0.6.8    evaluate_0.5.5  formatR_1.0     htmltools_0.2.6
## [5] knitr_1.8       rmarkdown_0.4.2 stringr_0.6.2   tools_3.1.2    
## [9] yaml_2.1.13
```

***

### References

Hyndman RJ (2015). forecast: Forecasting functions for time series and linear models. R package version 5.8, http://github.com/robjhyndman/forecast.

Hyndman RJ and Khandakar Y (2008). “Automatic time series forecasting: the forecast package for R.” Journal of Statistical Software, 26(3), pp. 1–22. http://ideas.repec.org/a/jss/jstsof/27i03.html.

[1]: http://nierhoff.info/#contact "Contact"

***
