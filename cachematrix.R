## A pair of functions that cache the inverse of a matrix

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {   
		s <- NULL
        set <- function(y) {
                x <<- y        #assign a value to an object in an environment that is different from the current environment
                s <<- NULL		#assign a value to an object in an environment that is different from the current environment
        }
        get <- function() x
        setsolve <- function(solve) s <<- solve		#assign a value to an object in an environment that is different from the current environment
        getsolve <- function() s
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.

cacheSolve <- function(x=matrix(), ...) {
        ## Return a matrix that is the inverse of 'x'
		
		matriz<-x$getmatrix()
		if(!is.null(matriz)){
		  message("getting cached data")
		  return(matriz)
		}
		matrix<-x$get()
		matriz<-solve(matrix, ...)
		x$setmatrix(matriz)
		matriz

}
