# Create fake voter data
n_voters <- 35
n_choices <- 4

ranks <- matrix(NA, ncol = n_choices, nrow = n_voters)
for (i in 1:n_voters) ranks[i,] <- sample(n_choices, prob = n_choices:1)

ranks <- as.data.frame(ranks)
colnames(ranks) <- paste("option", LETTERS[1:n_choices], sep="")

write.csv(ranks, file = "test.csv", row.names = FALSE)
write.table(t(ranks), file = "testt.csv", sep = ",", col.names = FALSE)
