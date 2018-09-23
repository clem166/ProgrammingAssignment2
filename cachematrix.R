## Functions create a list of matrices and their inputs
## If matrix has been inversed before, it will grab the data instead of recalculating
## Establishing list of functions and matrix containing cached data

makeCacheMatrix = function (c = matrix()) {
  s <- NULL
  set <- function (d = matrix()) {
    c <<- d
    s <<- NULL
  }
  get <- function () c
  setinverse <- function(s1) s <<- s1
  getinverse <- function() s
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## Return a matrix that is the inverse of 'x'

cacheSolve = function(c, ...) {
  s = c$getinverse()
  if (!is.null(s)) {
    message("getting cached data")
    # print(is.null(s))
    #    print(s)
    return(s)
  }
  data= c$get()
  #  print(data)
  s = solve(data, ...)
  c$setinverse(s)
  s
}

