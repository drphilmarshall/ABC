## I declare the data to be this
N = 100
x.obs = rnorm(N) ## standard normal distribution



### summary statistics
## Sample mean and variance. These are sufficient.
S1 = function(x) c(mean(x), sum((x-mean(x))^2)/length(x))
exact = function(s1, n) c(s1[1], n, n/2, 0.5*n*s1[2])
pars = exact(S1(x.obs), N)
marg.mean = function(x, p) dt(sqrt(p[3]*p[2]/p[4])*(x-p[1]), 2*p[3]) * sqrt(p[3]*p[2]/p[4])
marg.var = function(x, p) p[4]^p[3]/gamma(p[3]) * x^(-p[3]-1) * exp(-p[4]/x)
post2d = function(x, s2, p) sqrt(p[2]/(s2*2*pi)) * p[4]^p[3]/gamma(p[3]) * s2^(-p[3]-1) * exp(-(2*p[4] + p[2]*(x-p[1])^2)/(2*s2))
post.means = expand.grid(seq(-1,1,0.01), seq(0.1,2.1,0.01))[,1]
post.vars = expand.grid(seq(-1,1,0.01), seq(0.1,2.1,0.01))[,2]
post.p = post2d(post.means, post.vars, pars)
post = list(x=unique(post.means), y=unique(post.vars), z=matrix(post.p, length(unique(post.means)), length(unique(post.vars))))
post.con = getdist.2d(post, sigmas=1:4)

## a distance measurement
rho1 = function(s1, s2) max(abs(s1 - s2))



## an ABC using S1, rho1 and simple rejection
sim1.nsim = 1000000
sim1.means = runif(sim1.nsim, -2.5, 2.5)
sim1.vars = runif(sim1.nsim, 0, 5)
sim1.x = matrix(rnorm(N*sim1.nsim, sim1.means, sqrt(sim1.vars)), sim1.nsim, N)
sim1.S1 = apply(sim1.x, 1, S1) # columns are S1 for each sim
sim1.rho = apply(sim1.S1, 2, rho1, s2=S1(x.obs))

eps = 0.5
accept = which(sim1.rho < eps)
hist(sim1.means[accept], freq=F)
curve(marg.mean(x, pars), add=T, col=4)
hist(sim1.vars[accept], freq=F)
curve(marg.var(x, pars), add=T, col=4)
h = whist2d(sim1.means[accept], sim1.vars[accept])
con = getdist.2d(h)
plot.getdist.2d(post.con, col=4, modecol=4, add=T)

eps = 0.25
accept = which(sim1.rho < eps)
hist(sim1.means[accept], freq=F)
curve(marg.mean(x, pars), add=T, col=4)
hist(sim1.vars[accept], freq=F)
curve(marg.var(x, pars), add=T, col=4)
h = whist2d(sim1.means[accept], sim1.vars[accept])
con = getdist.2d(h)
plot.getdist.2d(post.con, col=4, modecol=4, add=T)

eps = 0.1
accept = which(sim1.rho < eps)
hist(sim1.means[accept], freq=F)
curve(marg.mean(x, pars), add=T, col=4)
hist(sim1.vars[accept], freq=F)
curve(marg.var(x, pars), add=T, col=4)
h = whist2d(sim1.means[accept], sim1.vars[accept])
con = getdist.2d(h)
plot.getdist.2d(con, xlab='mean', ylab='variance', modecol=1, main='modes and 1 and 2 sigma contours')
plot.getdist.2d(post.con, col=4, modecol=4, add=T, lev=1:2)

eps = 0.05
accept = which(sim1.rho < eps)
hist(sim1.means[accept], freq=F, xlim=c(-0.1,0.5), ylim=c(0,4.5))
curve(marg.mean(x, pars), add=T, col=4)
hist(sim1.vars[accept], freq=F, ylim=c(0,3.5), xlim=c(0.5,1.6))
curve(marg.var(x, pars), add=T, col=4)
h = whist2d(sim1.means[accept], sim1.vars[accept])
con = getdist.2d(h)
plot.getdist.2d(post.con, col=4, modecol=4, add=T)

eps = 0.01
accept = which(sim1.rho < eps)
hist(sim1.means[accept], freq=F)
curve(marg.mean(x, pars), add=T, col=4)
hist(sim1.vars[accept], freq=F, ylim=c(0,2.5))
curve(marg.var(x, pars), add=T, col=4)




