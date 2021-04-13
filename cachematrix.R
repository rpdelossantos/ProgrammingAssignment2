
## I am setting the x as input in matrix
## and set "e" which is the value solved as the null
## I just changed all the reference from "mean" to "evaluate"
makeCacheMatrix <- function(x = matrix()) {
   e <- NULL
  set <- function(y) {
    x <<- y
    e <<- NULL
  }
  get <- function() x
  setevaluate <- function(evaluate) evaluate <<- evaluate
  getevaluate <- function() evaluate
  list(set = set, get = get,
       setevaluate = setevaluate,
       getevaluate = getevaluate)
}


## 
## like what I did previously, I just changed "mean" to "evaluate" and "m" to "e"
cacheevaluate <- function(x, ...) {
        e <- x$getevaluate()
  if(!is.null(e)) {
    message("getting evaluate matrix")
    return(e)
  }
  data <- x$get()
  e <- evaluate(data, ...)
  x$setevaluate(e)
  e
}
