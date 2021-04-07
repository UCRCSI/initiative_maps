---
title: ''
author: ''
date: "`r Sys.Date()`"
output:
  html_document:
    css: customstyles.css
    self_contained: yes
    toc: no
  pdf_document:
    toc: yes
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

# Initiatives Map

<style>
div.blue {background-color: #e6f0ff; border-radius: 5px; padding: 10px;}
</style>
<div class = "blue">

This directory is the product of the Center for Social Innovation's efforts to document the important initiatives.
<br>Please click through the page number below to browse or use the search bar for different initiatives by their names or project details.

</div>
***

<center>
[Download raw data](https://github.com/UCRCSI/initiative_maps/blob/main/final_initiatives.xlsx?raw=true)
</center>
```{r}
# Load Data ---------------------------------------------------------------
source("excel_generator.R")

dta_local %>%
     datatable(escape = T, rownames = T,
               options = list(
  initComplete = JS("
    function(settings, json) {
      $(this.api().table().header()).css({
        'background-color': '#3f3f3f',
        'color': '#ffffff'
      });
    }")
))

```