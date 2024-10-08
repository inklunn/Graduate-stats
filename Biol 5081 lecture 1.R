### Some simulations to look at two linear distributions

##starting with y = mx+b
# Effect size is m
m <- 1.5

# b is the intercept
b <- 0

# X is explanatory variable
# Normal distribution of 1000 Xs - mean of 0, SD of 1
x <- rnorm(1000)

# y is the response variable
y <- m*x+b

# m is 0 for y2
y2 <- 0*x+b

plot.new()

# Make a plot where density
plot(density(y), ylim = c(0, 1.75), xlim = c(-7,7),  col = "red")
lines(density(y2))
lm <- lm(y ~ x)
lm2 <- lm(y2 ~ x)
t.test(y, y2)
plot(x, y, col = "red")
(lines(x, y2))


#### adding error of various sizes!
# Adding simulated error, mean of 0, SD of 0.1
y3 <- m * x + b + rnorm(1000, 0, 0.1)

# Adding simulated error, mean of 0, SD of 1
y4 <- m * x + b + rnorm(1000, 0, 1)

# Adding simulated error, mean of 0, SD of 10
y5 <- m * x + b + rnorm(1000, 0, 10)

lm3 <- lm(y3 ~ x)
lm4 <- lm(y4 ~ x)
lm5 <- lm(y5 ~ x)

#  high r-squared is good, 1 is the highest (incredibly rare in actual data)



par(mfrow=c(2,2))
eq = paste0("y = ", round(lm$coefficients[2],1), "*x", "+",round(lm$coefficients[1],1), ", R^2=", round(summary(lm)$adj.r.squared, digits=3))
plot(x, y, col="red", main=eq)
abline(lm, col="black")
eq3 = paste0("y = ", round(lm3$coefficients[2],1), "*x", "+",round(lm3$coefficients[1],1), ", R^2=", round(summary(lm3)$adj.r.squared, digits=3))
plot(x, y3, col="purple", main=eq3)
abline(lm3, col="black")
eq4 = paste0("y = ", round(lm4$coefficients[2],1), "*x", "+",round(lm4$coefficients[1],1), ", R^2=", round(summary(lm4)$adj.r.squared, digits=3))
plot(x, y4, col="blue", main=eq4)
abline(lm4, col="black")
eq5 = paste0("y = ", round(lm5$coefficients[2],1), "*x", "+",round(lm5$coefficients[1],1), ", R^2=", round(summary(lm5)$adj.r.squared, digits=3))
plot(x, y5, col="grey", main=eq5)
abline(lm5, col="black")
dev.off()


plot(density(y), ylim=c(0, 0.5), xlim=c(-4,4),  col="red")
lines(density(y3), col="purple")
lines(density(y4), col="blue")
lines(density(y5), col="black")