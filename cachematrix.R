## Matrix inverse is takes lost of computer resource
## To save this proceiing time and effort the following two functions has been created.

## The following functin named "makeCacheMatrix" craetes a matix and creates the inverse of it.

makeCacheMatrix <- function(x = matrix()) {
inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setInverse <- function(inverse) inv <<- inverse
        getInverse <- function() inv
        list(set = set,
             get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}


## The following function "cacheSolve" claculates the inverse of the matrix. If the inverse is already available it gets it from the cashe memory.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
 	inv <- x$getInverse()
        if (!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        mat <- x$get()
        inv <- solve(mat, ...)
        x$setInverse(inv)
        inv
}
