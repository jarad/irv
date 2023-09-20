source("irv.R")

# To generate these files, run fake_data.R
d <- read.csv("test.csv")
d <- read.tcsv("testt.csv")

# Mean ranks (lower is better)
colMeans(d)

# Instant run-off voting
#  - iteratively, least first place votes gets eliminated
irv(d)
