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
library(googlesheets4)

dta_local <- read_sheet("https://docs.google.com/spreadsheets/d/11qTlIj6u-kMsoY680MFQrGV0mTPjA675wbg_YeJMalw", sheet = "Local")
# dta_state <- read_sheet("https://docs.google.com/spreadsheets/d/11qTlIj6u-kMsoY680MFQrGV0mTPjA675wbg_YeJMalw", sheet = "Statewide")
# dta_national <- read_sheet("https://docs.google.com/spreadsheets/d/11qTlIj6u-kMsoY680MFQrGV0mTPjA675wbg_YeJMalw", sheet = "National")

dta_local = dta_local[-1,]
# dta_state = dta_state[-1,]
# dta_national = dta_national[-1,]

dta_local <- dta_local %>%
  select(name, contact_name, contact_email, description, focus, lead, scope, partners, priority_pop, URL, addition) %>% 
  rename(`Initiative Name` = name,
         `Area of focus` = focus,
         `Org Lead` = lead,
         `Description` = description,
         `Geo scope` = scope,
         `Partners` = partners,
         `Priority population` = priority_pop,
         `Additional Info` = addition,
         `Contact name` = contact_name,
         `Contact email` = contact_email) %>% 
  arrange(`Initiative Name`)

# dta_state <- dta_state %>%
#   select(name, contact_name, contact_email, description, focus, lead, scope, partners, priority_pop, URL, addition) %>% 
#   rename(`Name` = name,
#          `Area of focus` = focus,
#          `Org Lead` = lead,
#          `Description` = description,
#          `Geo scope` = scope,
#          `Partners` = partners,
#          `Priority population` = priority_pop,
#          `Additional Info` = addition,
#          `Contact name` = contact_name,
#          `Contact email` = contact_email) %>% 
#   arrange(Name)
# 
# dta_national <- dta_national %>%
#   select(name, contact_name, contact_email, description, focus, lead, scope, partners, priority_pop, URL, addition) %>% 
#   rename(`Name` = name,
#          `Area of focus` = focus,
#          `Org Lead` = lead,
#          `Description` = description,
#          `Geo scope` = scope,
#          `Partners` = partners,
#          `Priority population` = priority_pop,
#          `Additional Info` = addition,
#          `Contact name` = contact_name,
#          `Contact email` = contact_email) %>% 
#   arrange(Name)

dta_initiative <- createWorkbook()
addWorksheet(dta_initiative, sheetName = "local", gridLines = T)
# addWorksheet(dta_initiative, sheetName = "state", gridLines = T)
# addWorksheet(dta_initiative, sheetName = "national", gridLines = T)

insertImage(dta_initiative, "local", file = "CSI-logo-A-contrast-2018.png", startRow = 1, startCol = 1, width = 6, height = 2)
writeDataTable(dta_initiative, x = dta_local, sheet = "local", startCol = 1, startRow = 12, colNames = T)
# writeDataTable(dta_initiative, x = dta_state, sheet = "state", startCol = 1, startRow = 1, colNames = T)
# writeDataTable(dta_initiative, x = dta_national, sheet = "national", startCol = 1, startRow = 1, colNames = T)

setColWidths(dta_initiative, sheet = "local", cols = 1:1, widths = "50")
# setColWidths(dta_initiative, sheet = "state", cols = 1:1, widths = "50")
# setColWidths(dta_initiative, sheet = "national", cols = 1:1, widths = "50")
saveWorkbook(dta_initiative, file = "final_initiatives.xlsx", overwrite = TRUE)
