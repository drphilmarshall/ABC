## I declare the data to be this
N = 100
x.obs = rnorm(N) ## standard normal distribution

### In the simplest possible case, we shall assume we know the mean to be zero

### summary statistics
## Sample variance with known mean. This is a sufficient statistic (see below)
S1 = function(x) sum(x^2)/length(x)
dinvchisq = function(x, nu, tau2) (tau2*nu/2)^(nu/2) / gamma(nu/2) * exp(-0.5*nu*tau2/x) / x^(1+nu/2)

## a distance measurement
rho1 = function(s1, s2) abs(s1 - s2)



## an ABC using S1, rho1 and simple rejection
sim1.vars = runif(100000, 0, 5)
sim2.x = matrix(rnorm(N*length(sim1.vars), 0, sqrt(sim1.vars)), length(sim1.vars), N)
sim2.S1 = apply(sim2.x, 1, S1)
sim2.rho = rho1(sim2.S1, S1(x.obs))
eps = 0.5
accept = which(sim2.rho < eps)
hist(sim1.vars[accept], freq=F)
curve(dinvchisq(x, N, sum(x.obs^2)/N), add=T, col=4)
eps = 0.25
accept = which(sim2.rho < eps)
hist(sim1.vars[accept], freq=F)
curve(dinvchisq(x, N, sum(x.obs^2)/N), add=T, col=4)
eps = 0.1
accept = which(sim2.rho < eps)
hist(sim1.vars[accept], freq=F)
curve(dinvchisq(x, N, sum(x.obs^2)/N), add=T, col=4)
eps = 0.05
accept = which(sim2.rho < eps)
hist(sim1.vars[accept], freq=F, ylim=c(0,2.5))
curve(dinvchisq(x, N, sum(x.obs^2)/N), add=T, col=4)
eps = 0.01
accept = which(sim2.rho < eps)
hist(sim1.vars[accept], freq=F, ylim=c(0,2.5))
curve(dinvchisq(x, N, sum(x.obs^2)/N), add=T, col=4)




