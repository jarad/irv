library("tidyverse")

source("irv.R")

file <- "vote.csv"

tmp <- read_csv(file, col_names = FALSE, skip = 3) 

names(tmp) <- gsub(instructions, "", 
                   scan(file, what = character(), sep = ",", skip = 1, nlines = 1),
                   fixed = TRUE)

names(tmp) <- scan(file, what = character(), sep = ",", skip = 1, nlines = 1) %>%
  str_replace_all(fixed(instructions), "")

d <- tmp %>%
  select() # put in candidate names

vot <- create_vote(as.matrix(d), xtype = 1)
irv_method(vot)
