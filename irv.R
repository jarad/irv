

rerank <- function(d) {
  for (v in 1:nrow(d)) {
    d[v,] <- as.numeric(as.factor(as.numeric(d[v,])))
  }
  return(d)
}


irv <- function(d) {
  while(TRUE) {
    
    prop <- colMeans( d == 1)
    print(prop)
    cat("\n")
    
    if (any(prop>0.5)) {
      cat(names(d)[which(prop>0.5)], "wins!\n\n")
      break;
    }
    
    i <- which.min(prop)
    if (sum(prop[i]==prop)>1) {
      cat("There's a tie.")
      break;
    }
    cat("Eliminating", names(d)[i], "\n\n")
    d <- d[,-i]
      
    d <- rerank(d)
  }
  if (ncol(d) == 1)  break;
}

