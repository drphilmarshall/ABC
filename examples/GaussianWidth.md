# Toy Problem: Inferring the Width of a 1D Gaussian

Is this the simplest possible parameter inference problem?

* Dataset $d$: N sample values of $x_{obs}$ drawn from a Gaussian of width $\sigma_T$.
* Model $H$: a Gaussian density parameterized by sigma (Warning! Unrealistic knowledge assertion!)
* Test statistic: $S = \frac{1}{N-1}\Sum (x-\bar{x})^2$

Use ABC to infer $Pr(\sigma|d,H)$ via consideration of $Pr(S(x_{obs}),S(x))

* [IPython Notebook Demo](http://nbviewer.ipython.org/github/drphilmarshall/ABC/blob/master/examples/GaussianWidth.ipynb)
