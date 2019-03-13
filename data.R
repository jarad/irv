source("irv.R")

ranks <- read.tcsv("finalVoteDataScience.csv")
ranks[13,5] <- 5
ranks <- ranks[-10,]

irv(ranks)
irv(ranks[,-1]) # For second place.


round(colMeans(ranks),2)
