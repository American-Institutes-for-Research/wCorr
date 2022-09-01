wcor <- function(x,
                 y=NULL,
                 use= c("pairwise.complete.obs", "complete.obs"),
                 method = c("Pearson", "Spearman", "Polyserial", "Polychoric"),
                 weights=rep(1,nrow(x))) {
  method <- match.arg(method)
  use <- match.arg(use)
  if(is.null(y)) {
    n <- ncol(x)
    res <- matrix(NA, nrow=n, ncol=n, dimnames=list(colnames(x), colnames(x)))
    if(use=="complete.obs") {
      anymiss <- apply(x, 1, function(z) { any(is.na(z))})
      xi <- x[!anymiss, , drop=FALSE]
      wi <- weights[!anymiss]
    }
    for(i in 1:n) {
      for(j in i:n) {
        if(i == j) {
          res[i,j] <- 1
        } else {
          if(use=="pairwise.complete.obs") {
            anymiss <- apply(x[,c(i,j)], 1, function(z) { any(is.na(z))})
            xi <- x[!anymiss, , drop=FALSE]
            wi <- weights[!anymiss]
          }
          res[j, i] <- res[i, j] <- weightedCorr(xi[,i], xi[,j], method = method, weights = wi, ML=FALSE, fast=TRUE, extendedOutput=FALSE)
        }
      }
    }
    return(res)
  }
  # there is a y
  n <- ncol(x)
  m <- ncol(y)
  res <- matrix(NA, nrow=n, ncol=m, dimnames=list(colnames(x), colnames(y)))
  if(use=="complete.obs") {
    anymiss <- apply(x, 1, function(z) { any(is.na(z))}) | apply(y, 1, function(z) { any(is.na(z))})
    x <- x[!anymiss, ]
    y <- y[!anymiss, ]
    xi <- x
    yi <- y
    wi <- weights[!anymiss]
  }
  for(i in 1:n) {
    for(j in i:m) {
      if(use=="pairwise.complete.obs") {
        anymiss <- is.na(x[,i]) | is.na(y[,j])
        xi <- x[!anymiss, i, drop=FALSE]
        yj <- y[!anymiss, j, drop=FALSE]
        wi <- weights[!anymiss]
      }
      res[j, i] <- res[i, j] <- weightedCorr(xi, yj, method = method, weights=wi, ML=FALSE, fast=TRUE, extendedOutput=FALSE)
    }
  }
  return(res)
}
