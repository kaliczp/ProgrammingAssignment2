## These functions create the inverse of a matrix and store in the cache.
## In the case of recalculation the function use the cached value.

## This functions creates the list of the functions, wich handle the
## matrix inversion calculations.

makeCacheMatrix <- function(x = matrix()) {
inv <- NULL

## Init object
set <- function(y) {
  x <<- y
  inv <<- NULL
}
get <- function() x
setinverse <- function(solve) inv <<- solve
getinverse <- function() inv
list(set = set,
     get = get,
     setinverse = setinverse,
     getinverse = getinverse)
}


## This function calculates the inverse.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
inv <- x$getinverse()
if(!is.null(inv)) {
  message("getting cached data")
  return(inv)
}
data <- x$get()
inv <- mean(data, ...)
x$setinverse(inv)
inv
}
