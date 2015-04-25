#code to test matrix caching
#load source
source("cachematrix.R")
#test run
r = rnorm(1000000)
raw.mat = matrix(r, nrow=1000, ncol=1000)
## For curiosity see input matrix
raw.mat
temp <- makeCacheMatrix(raw.mat)

#firstinverse has to calculate orignal
start.t <- Sys.time()
firstinverse <- cacheSolve(temp) 
stop.t <- Sys.time()
dt1 <- stop.t-start.t
print (dt1)

#second inverse can use previous cached value
start.t <- Sys.time()
secondinverse <- cacheSolve(temp)
stop.t <- Sys.time()
dt2 <- stop.t-start.t
print (dt2)
## For curiosity see inverted matrix
#secondinverse

