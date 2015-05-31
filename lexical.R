#!/usr/bin/Rscript
# Assignment 2

cached_inv_mtx <- NULL
cached_mtx <- NULL

cacheSolve <- function(mtx) {
  if (! is.null(cached_inv_mtx) && identical(mtx,cached_mtx)) {
    message("Cached")
    return (cached_inv_mtx)
  } else {
    message("Solving")
    inv <- solve(mtx)
    cached_mtx <<- mtx
    cached_inv_mtx <<- inv
    return(inv)
  }
}

makeCacheMatrix <- function(v,r) {
  matrix(v,r)
}

m1 <- makeCacheMatrix(c(0,66,7,13),2)
cacheSolve(m1);

m2 <- makeCacheMatrix(c(0,66,7,13),2)
cacheSolve(m2);

m3 <- makeCacheMatrix(c(0,99,7,75),2)
cacheSolve(m3);

m4 <- makeCacheMatrix(c(0,66,7,13),2)
cacheSolve(m4);

