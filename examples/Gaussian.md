# Toy Problem: Inferring the Mean and Variance of a 1D Gaussian

Setup:

* Dataset $d$: N sample values of $x_{obs}$ drawn from a Gaussian of mean $\mu_T$ and variance $\sigma^2_T$.
* Model $H$: a Gaussian density parameterized by $\mu$ and $sigma^2$.
* Sufficient statistics: the sample mean and variance.

The true posterior for this case is the [normal-inverse-gamma distribution ](http://en.wikipedia.org/wiki/Normal-inverse_gamma_distribution), with parameters given [here](http://en.wikipedia.org/wiki/Conjugate_prior).

I again implemented this with simple rejection in R, where the distance function is the maximum Euclidian distance of the two sufficient statistics.
* [GaussianWidth.R](https://github.com/drphilmarshall/ABC/blob/master/examples/Gaussian.R)

![foo][sim1m]
![foo][sim1v]
![foo][sim1mv]

These results came from $10^6$ (painful) simulations. The marginal histograms use eps=0.05, while the contours use eps=0.1 -- the rejection algorithm is clearly on the right track, but struggling compared with the one-parameter fit.

[sim1m]: https://github.com/drphilmarshall/ABC/blob/master/examples/Gaussian_Rsim1_mean.png
[sim1v]: https://github.com/drphilmarshall/ABC/blob/master/examples/Gaussian_Rsim1_var.png
[sim1mv]: https://github.com/drphilmarshall/ABC/blob/master/examples/Gaussian_Rsim1_2D.png
