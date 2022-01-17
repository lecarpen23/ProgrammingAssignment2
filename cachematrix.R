## Put comments here that give an overall description of what your
## functions do

## creates a matrix with getters and setters in a list 

makeCacheMatrix <- function(x = matrix()){
  m <- NULL
  set <- function(y){
      x<<- y
      m <<- NULL
  }
  get <- function() {x}
  setInverse <- function(inverse) {m <<- inverse}
  getInverse <- function() {m}
  list (set = set, 
        get = get, 
        setInverse = setInverse, 
        getInverse = getInverse)
}


##gets the inverse from cache if it has already been solved for, if not it uses the solve function and sets the inverse 

cacheSolve <- function(x, ...){
  m <- x$getInverse()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  mat <- x$get()
  m <- solve(mat, ...)
  x$setInverse(m)
  m
}
