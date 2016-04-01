a <- 2+3
a=2+3
a


b<-a+a


X <- c(1,2,3,4)
x
X
y<-1:4
Z <- seq(from=1, to = 4, by = 1)
Z
y == X
?all.equal
all.equal
all.equal(X,y)
w <- round(3-2.9, 1)
w
w == 0.1





bogus.mean <- function(x,cheat){
  sum.of.x <- sum(x)
  n <- length(x)
  true.mean <- sum.of.x / n
  (1+cheat)*true.mean
}

bogus.mean(x = X, cheat = 0.2)

install.packages('deSolve')
library(deSolve)

?ode

exp.grwth <- function(t, y, p){
  N<-y[1]
  with(as.list(p), {
    dN.dt <- r * N
    return(list(dN.dt))
  })
}

p<- c('r' = 0.1)
y0 <- c('N' = 1)
t <- 1:25

sim <- ode(y = y0, time = t, func = exp.grwth, parms = p, method = 'lsoda')

plot (sim)
head(sim)

sim <- as.data.frame (sim)

plot(N~time,data = sim, type = 'l',lwd=100,col='yellow')
