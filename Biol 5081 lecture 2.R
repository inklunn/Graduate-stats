# 4) Negative binomial - distribution of the number of trials needed to get a certain number of 
# successes. How many random people do we need on a plane to be fairly sure there's some medical 
# doctors (whereas the geometic is how many to be sure there's one)? 
# If a coin is repeatedly tossed, what is the probability the 3rd time a heads appears is on the 
# 9th trial? Rather than the spacing between neighbours, can think of this as the spacing of any 
# number of things in reference category. 

# Generalizes from the geometric. 
# Geometric is to the the 1st success, negative binomial is to get the rth success.
# Bolker basically says that this is not the way that ecologists think of the negative binomial - 
# rather, we like it because it's independent counts of successes, like poisson, 
# but allows for overdispersion. 

# ```{r Negative Binomial}
library(MASS)
# To carry our flycatcher example forward, negative binomial could be what is the number of 
# singing males we see over a week (as opposed to alarm calling or otherwise not singing). 
# n=# of sites we visit (or site-weeks), mu= mean, theta= measure of over dispersion. 
# If mu = theta, you have poisson distribution 
# (according to here: https://stats.stackexchange.com/questions/10419/what-is-theta-in-a-negative-binomial-regression-fitted-with-r)

# Make a histogram, using library MASS make a negative binomial variates simulation (n, mu, theta)
hist(MASS::rnegbin(100, mu=5, theta=10))

# Using library MASS, create negative binomial variates simulation (n, mu, theta)
MASS::rnegbin(100, mu=5, theta=10) 

# Make a plot of the density of NBV simulation
plot(density(MASS::rnegbin(100, mu=5, theta=10)))


# Binomial vs Negative Binomial
# Binomial - number of trials is fixed (n), number of successes is a random variable.
# Negative Binomial - number of successes is fixed (r), number of trials is the random variable (x)