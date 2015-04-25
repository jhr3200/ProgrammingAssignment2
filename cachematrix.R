#######################################################################
##
## MakeCacheMatrix() reads a "matrix" object and inverts it
## Source("cachematrix.R")
##
## Calling sequence.
## Call makeCacheMatrix(any.matrix) to pouplate Mx and define functions
## Call CacheSolve(Mx) to calculate (return) inverse
##
## Test script in matrix_cache_test.r
##
########################################################################
makeCacheMatrix <- function(Mx = matrix()) {
  
  #set inverted matrix array to a null value
  Mi <- NULL
  
  # Create a function to load a matrix Mx with rawdata from matrix
  set <- function(any.matrix) {
    Mx <<- any.matrix 
    Mi <<- NULL#and reset inverse to null
  }
  ## Create a function to load the matrix data
  get <- function() Mx ## this just returns raw matrix
  ## Create a function to set values of inverse matrix
  setinv <- function(inverse) Mi <<- inverse ## this sets inverse Mi
  ## Create a function to get values of inverse matrix
  getinv <- function() Mi ## this just returns eteh inverted matrix Mi
  ## create vector list to return all these functions
  ## element names as follows
  ## setV = set
  ## getV= get
  ## setinV = setinv
  ## getinV = getinv
  list(setV = set, getV = get,setinV = setinv,getinV = getinv)
    
}



cacheSolve <- function(Mx, ...) {
  ## cacheSolve() reads in the matrix Mx and returns its inverse 
  ## If the matrix has allready been calculated it returns 
  ## the previously stored one
  ##
  ##else
  ##
  ## It calculates a new one using solve()
  ## and returns a new inverted matrix.

  Mi <- Mx$getinV()## load cashed inverse array
  
  if(!is.null(Mi)) {
    ##If its not a null string then return it as inverted array
    message("Got cached inverse matrix")
    return(Mi)
  }
  ## else it is so calculate
  matrixdata <- Mx$getV()
  Mi <- solve(matrixdata, ...)
  Mx$setinV(Mi)## store new calculated inverse in Mx
  message("Calculated inverse matrix")
  return (Mi)  
  
}
