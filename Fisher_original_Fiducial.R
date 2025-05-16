require(MASS)
require(dplyr)
require(ggplot2)

# Settings for simulating sample correlations
set.seed(123)
n <- 4
num_samples <- 10000
seq_values <- seq(-1, 1, by = 0.001)

# Function to simulate correlation-values
simulate_correlation <- function(p, n = n, num_samples = num_samples, lower_correlation, quantile = 0.95) {
  Sigma <- matrix(c(1, p, p, 1), ncol = 2)  # Covariance matrix
  i <- 0
  correlations <- replicate(num_samples, {
    sample <- mvrnorm(n, mu = c(0, 0), Sigma = Sigma)
    cor(sample[, 1], sample[, 2])
  })
  quantile(correlations, probs = quantile)
}


results <- data.frame(
  p = seq_values,
  r_quantile = sapply(seq_values, simulate_correlation, n = n, num_samples = num_samples)
)
## save results
write.csv(results, file = "results.csv", row.names = FALSE)

ggplot(results, aes(y = r_quantile, x = p)) +
  #geom_smooth(color = "black", size = 0.5, se = FALSE, span = 0) +
 # geom_line(color = "black", size = 0.5) +
  geom_point(size = 0.01, color = "darkgrey") +
  geom_smooth(method = "lm", formula = y ~ poly(x, 9), se = FALSE, size = 0.5, color = "black") +
  labs(
    title = expression("Relation between 0.95-quantile of " * r * " and " * rho),
    y = "0.95 quantile",
    x = expression(rho)
  ) +
  theme_minimal()
# Save the plot
ggsave("Pics/relation_quantile_p.png", width = 8, height = 6)

View(results)
