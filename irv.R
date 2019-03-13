
rerank <- function(d) {
  for (v in 1:nrow(d)) {
    d[v,] <- as.numeric(as.factor(as.numeric(d[v,])))
  }
  return(d)
}

# From https://stackoverflow.com/questions/17288197/reading-a-csv-file-organized-horizontally
read.tcsv = function(file, header=TRUE, sep=",", ...) {
  
  n = max(count.fields(file, sep=sep), na.rm=TRUE)
  x = readLines(file)
  
  .splitvar = function(x, sep, n) {
    var = unlist(strsplit(x, split=sep))
    length(var) = n
    return(var)
  }
  
  x = do.call(cbind, lapply(x, .splitvar, sep=sep, n=n))
  x = apply(x, 1, paste, collapse=sep) 
  out = read.csv(text=x, sep=sep, header=header, ...)
  return(out)
  
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
      cat("There's a tie for lowest ranked candidate.")
      break;
    }
    cat("Eliminating", names(d)[i], "\n\n")
    d <- d[,-i]
      
    d <- rerank(d)
  }
  if (ncol(d) == 1)  break;
}

