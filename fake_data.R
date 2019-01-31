# Create fake voter data
n_voters <- 35
ranks <- matrix(NA, ncol=5, nrow=n_voters)
for (i in 1:n_voters) ranks[i,] <- sample(5)

ranks <- as.data.frame(ranks)
colnames(ranks) <- paste("candidate", LETTERS[1:5], sep="")
