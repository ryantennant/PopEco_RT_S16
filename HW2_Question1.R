## write a logistic growth function
exp.growth <- function(t, y, p) {
  N <- y[1]
  with(as.list(p), {
    dN.dt <- r * N
    return(list(dN.dt))
  })
}

p<- c('r'=0.25, 'K'=100)

y0<-c('N'=runif(1, min=0.01,max=.1))
t<-0:100
max(t)

sim<-ode(y=y0, times=t, func=log.growth, parm=p, method='lsoda')
sim<-as.data.frame(sim)

## plot my simulation
plot(N~time,dat=sim,type='l',col='green')

if you make a mistake like forget to name the y0 'N' make sure to rerun all functions
that the change might affect.

p.2<-c('r'=.25,'K'=50)

sim.2<-ode(y=y0, times=t, func=log.growth, parm=p.2, method='lsoda')
sim.2<-as.data.frame(sim.2)

plot(N~time,dat=sim.2,type='l',col='blue',ylim=c(0,100))
points(N~time,dat=sim,type='l',col='green')

p.3<-c('r'=.25,'K'=25)
sim.3<-ode(y=y0, times=t, func=log.growth, parm=p.3, method='lsoda')
sim.3<-as.data.frame(sim.3)

points(N~time,dat=sim.3,type='l',col='red')
