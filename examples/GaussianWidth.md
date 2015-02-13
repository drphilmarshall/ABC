# Toy Problem: Inferring the Width of a 1D Gaussian

Is this the simplest possible parameter inference problem?

* Dataset $d$: N sample values of $x_{obs}$ drawn from a Gaussian of width $\sigma_T$.
* Model $H$: a Gaussian density parameterized by sigma (Warning! Unrealistic knowledge assertion!)
* Test statistic: $S = \frac{1}{N-1}\Sum (x-\bar{x})^2$

Use ABC to infer $Pr(\sigma|d,H)$ via consideration of $Pr(S(x_{obs}),S(x))

* [IPython Notebook Demo](http://nbviewer.ipython.org/github/drphilmarshall/ABC/blob/master/examples/GaussianWidth.ipynb)


Let's simplify even further to start with, and assume we know the mean. Solving for the variance is a little easier mathematically than the standard deviation.

* Dataset $d$: N sample values of $x_{obs}$ drawn from a Gaussian of varaince $\sigma^2_T$.
* Model $H$: a Gaussian density parameterized by $sigma^2$ (Warning! Unrealistic knowledge assertion!)
* Test statistic: $S = \frac{1}{N}\Sum x^2$. NB: $N$ rather then $N-1$. This is a sufficient statistic for $sigma^2$, which means that recovering the true posterior with ABC should not be theoretically impossible.

The true posterior for this case is the scaled inverse-$\chi^2$ distribution with parameters $N$ and $S_{obs}$. So we have a point of reference. [wikipedia](https://en.wikipedia.org/wiki/Scaled_inverse_chi-squared_distribution)

I played with this in R, using the simple rejection algorithm described [here](https://en.wikipedia.org/wiki/Approximate_Bayesian_computation#The_ABC_rejection_algorithm).
* [GaussianWidth.R]
