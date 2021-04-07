---
title: ''
author: ''
date: ""
output:
  html_document:
    df_print: paged
    toc: TRUE
    toc_float: TRUE
    css: customstyles.css
always_allow_html: yes
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = FALSE,message = F,warning = F)
knitr::opts_chunk$set(out.width = "100%",fig.retina = 1)
library(tidyverse)
library(here)
library(plotly)
library(srvyr)
library(flextable)
library(officer)
library(here)
library(haven)
library(dplyr)
library(writexl)
library(openxlsx)
library(DT)
# 
# all_files <- list.files(here("dta/raw",""),".rds")
# all_files <- str_remove(all_files,".rds")
# all_files <- as.Date(all_files)
# all_files <- sort(all_files,decreasing = T)
# most_recentname <- all_files[1]
# most_recent <- all_files[1]
# most_recent <- paste(most_recent,".rds",sep ="")

```

```{r, fig.align="center", out.width = "400px"}
knitr::include_graphics("CSI-logo-A-contrast-2018.png")
```
</center>

# Overview

<style>
div.blue {background-color: #e6f0ff; border-radius: 5px; padding: 10px;}
</style>
<div class = "blue">

This directory is the product of the Center for Social Innovation's efforts to document the important initiatives.
<br>Please click through the page number below to browse or use the search bar for different initiatives by their names or project details.

</div>
***

<center>
[Download raw data as an Excel file](https://github.com/UCRCSI/initiative_maps/blob/main/final_initiatives.xlsx?raw=true)
</center>

# National

```{r national,results="asis"}
# Load Data ---------------------------------------------------------------
source("excel_generator.R")

dta_national %>%
     datatable(escape = T, 
               rownames = F,
               options = list(
                 autoWidth = T,
                 scrollX=TRUE,
                 pageLength = 1,
                 columnDefs = list(list(targets=c(0), visible=TRUE, width='400'),
                                   list(targets=c(1), visible=TRUE, width='200'),
                                   list(targets=c(3), visible=TRUE, width='800'),
                                   list(targets=c(4), visible=TRUE, width='400'),
                                   list(targets=c(6), visible=TRUE, width='400'),
                                   list(targets=c(7), visible=TRUE, width='400'),
                                   list(targets=c(8), visible=TRUE, width='800'),
                                   list(targets=c(10), visible=TRUE, width='400')),
                 # columnDefs = list(list(width = '400px', targets = c(0,3,4,7,10))),
                 initComplete = JS("function(settings, json) {$(this.api().table().header()).css({'background-color':
                                   '#3f3f3f','color':'#ffffff'});}")))
```

<br>
<br>
<br>

# Statewide

```{r state,results="asis"}
# Load Data ---------------------------------------------------------------
dta_state %>%
     datatable(escape = T, 
               rownames = F,
               options = list(
                 autoWidth = T,
                 scrollX=TRUE,
                 pageLength = 1,
                 columnDefs = list(list(targets=c(0), visible=TRUE, width='400'),
                                   list(targets=c(1), visible=TRUE, width='200'),
                                   list(targets=c(3), visible=TRUE, width='800'),
                                   list(targets=c(4), visible=TRUE, width='400'),
                                   list(targets=c(6), visible=TRUE, width='400'),
                                   list(targets=c(7), visible=TRUE, width='400'),
                                   list(targets=c(8), visible=TRUE, width='800'),
                                   list(targets=c(10), visible=TRUE, width='400')),
                 # columnDefs = list(list(width = '400px', targets = c(0,3,4,7,10))),
                 initComplete = JS("function(settings, json) {$(this.api().table().header()).css({'background-color':
                                   '#3f3f3f','color':'#ffffff'});}")))

```
<br>
<br>
<br>

# Local

```{r local,results="asis"}
# Load Data ---------------------------------------------------------------

dta_local %>%
     datatable(escape = T, 
               rownames = F,
               options = list(
                 autoWidth = T,
                 scrollX=TRUE,
                 pageLength = 1,
                 columnDefs = list(list(targets=c(0), visible=TRUE, width='400'),
                                   list(targets=c(1), visible=TRUE, width='200'),
                                   list(targets=c(3), visible=TRUE, width='800'),
                                   list(targets=c(4), visible=TRUE, width='400'),
                                   list(targets=c(6), visible=TRUE, width='400'),
                                   list(targets=c(7), visible=TRUE, width='400'),
                                   list(targets=c(8), visible=TRUE, width='800'),
                                   list(targets=c(10), visible=TRUE, width='400')),
                 # columnDefs = list(list(width = '400px', targets = c(0,3,4,7,10))),
                 initComplete = JS("function(settings, json) {$(this.api().table().header()).css({'background-color':
                                   '#3f3f3f','color':'#ffffff'});}")))
```
