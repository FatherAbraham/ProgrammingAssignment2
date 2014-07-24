## example usage
## my_matrix <- matrix(c(1,2,12,13), nrow =2, ncol=2)
## testmatrix <- makeCacheMatrix(my_matrix)
## cacheSolve(testmatrix)

makeCacheMatrix <- function(x = numeric(), rows, cols) {
	m <- NULL
	set <- function(y) { 
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setsolve <- function() m
	list(set = set, get = get,
		setsolve = setsolve,
		getsolve = getsolve)
}

##operates the class makeCacheMatrix using the cacheSolve function methods, namely solve the (square, invertible) matrix


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'my_matrix'

	m <- x$getsolve()

	if(!is.null(m)) {
		message("getting cached matrix")
		return(m)
	}
	matr <- x$get()
	m <- solve(matr, ...)
	x$setsolve(m)
	m

}
