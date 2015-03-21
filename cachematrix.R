## These functions create the inverse of a matrix and store in the cache.
## In the case of recalculation the function use the cached value.

## This functions creates the list of the functions, wich handle the
## matrix inversion calculations.

makeCacheMatrix <- function(x = matrix()) {
inverse <- NULL

## Init object
set <- function(y) {
  x <<- y
  inverse <<- NULL
}
get <- function() return(x)
setinverse <- function(inv) inverse <<- inv
getinverse <- function() return(inverse)
list(set = set,
     get = get,
     setinverse = setinverse,
     getinverse = getinverse)
}


## This function calculates the inverse.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
inverse <- x$getinverse()
if(!is.null(inverse)) {
  message("getting cached inverse matrix")
  return(inverse)
}
data <- x$get()
inverse <- solve(data, ...)
x$setinverse(inverse)
return(inverse)
}
