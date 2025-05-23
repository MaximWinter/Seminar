$\pi: \mathcal{X} \rightarrow [0, 1]$ and the consistency assumption, that $\pi (x) = 1$ is fulfilled for at least one $x \in X$. $1 - \pi (x)$ might be interpreted as an agents surprise that $X$ turns out to be $x$. A possibility distribution could be e.g. derived by intuition, an experts opinion or an assumed distribution.
A \textit{possibility measure} is defined as a set function that maps from $\mathcal{P} (\mathcal{X})$ to $[0,1]$

  \section{Different types of probability}

\subsection{Probability measure}

In this section, I will revisit some essential concepts from probability calculus in order to later highlight key differences from the established mathematical notion of probability. The underlying structure of the measure-theoretic construction of probability is based on specific types of set systems that exhibit useful structural properties — so-called $\sigma$-algebras. In measure theory, the symbol $\sigma$ typically denotes (at most) countably infinite.

\begin{definition}[Sigma-Algebra]
Let $\Omega$ be a set and $\mathcal{P}(\Omega)$ denote the power set over $\Omega$. Then $\mathcal{F} \subseteq \mathcal{P}(\Omega)$ is called a $\sigma$-Algebra if 
\begin{enumerate}
\item $\emptyset \in  \mathcal{F}$
  \item $A \in \mathcal{F} \Rightarrow A^C \in \mathcal{F}$
  \item $(A_n)_{n \in \mathbb{N}} \subseteq \mathcal{F} \Rightarrow \displaystyle\bigcup_{n \in \mathbb{N}} A_n \in \mathcal{F}$
  \end{enumerate}
holds. The tupel $(\Omega, \mathcal{F})$ is then called a {measurable space}.
\end{definition}

Therefore $\sigma$-algebras are non-empty collections of sets that contain the empty set and are closed under complementation and countable unions. Simplified, finite cases can often be seen as special cases of countably infinite ones by extending a finite index set $I = \{1, \dots, k \}$ to a countable one by defining $A_i = \emptyset \quad \text{for } i > k$ so that a finite union $\bigcup_{i=1}^{k} A_i$ can be rewritten as a countable union $\bigcup_{i=1}^{\infty} A_i,$ with $A_i = \emptyset$ for all $i > k$.

\begin{definition}[Measure]
Let $(\Omega, \mathcal{F})$ be a measurable space. A set-function $\mu : \mathcal{F} \rightarrow \mathbb{R}$ is called a {measure} if it fulfils
\begin{enumerate}
\item $\mu(\emptyset) = 0$ 
  \item $\mu(A) \geq 0 \quad \forall \, A \in \mathcal{F}$ \quad (Non-negativity)
\item For any sequences of pairwise disjunct sets $A_i \in \mathcal{F}, \, i \geq 1$: \newline
$\mu \big(\bigcup_{i=1}^{\infty} A_i \big) = \sum_{i=1}^{\infty} \mu(A_i)$ \quad ($\sigma$-additivity)
\end{enumerate}
The tupel $(\Omega, \mathcal{F}, \mu)$ is called a \textit{measure space}. Measures that are normed to $\mu(\Omega) = 1$ (normalization property) are called a \textit{probability measure} and will be noted with $\mathbb{P}$. In the context of probability calculus $(\Omega, \mathcal{F}, \mathbb{P})$ is called a probability space, $\Omega$ a \textit{sample space} and $\mathcal{F}$ an \textit{event space}.
\end{definition}

Among the unfortunate terminological choices in statistics, random variable is perhaps one of the most misleading since they are neither random, nor variables by nature. 


\begin{definition}[Random variable]
Let $(\Omega, \mathcal{F}, \mathbb{P})$ be a probability space and $(\Omega', \mathcal{F}')$ a measurable space. A function $X: \Omega \rightarrow \Omega'$ is a \textit{random variable} if 
$$ \{\omega \, | \,  \omega \in \Omega \, \land \, X(w) \in A \} = X^{-1} (A) \in \mathcal{F} \quad \forall A \in \mathcal{F}' \quad (\mathcal{F}-\mathcal{F}'-\text{measurability})$$
is satisfied. Using this definition the measurable space $(\Omega', \mathcal{F}')$ can be extended to a probability space through \mbox{$(\Omega, \mathcal{F}, \mathbb{P}) \xrightarrow{X} (\Omega', \mathcal{F}', \mathbb{P}_X)$} where the according \textit{push-forward-measure} $\mathbb{P}_X$ is defined through 
$$\mathbb{P}_X (A) := \mathbb{P}(X \in A) \overset{}{=} \mathbb{P} (\{\omega | \omega \in \Omega \land X(\omega) \in A \}) \overset{\text{}}{=} \mathbb{P}( \underbrace{X^{-1} (A)}_{\in \mathcal{F}}) \in [0,1] \quad \forall A \in \mathcal{F}'.$$
                                                                                                                                        \end{definition}
                                                                                                                                      
                                                                                                                                      \begin{definition}[Information]
                                                                                                                                      Let $(\Omega, \mathcal{F})$ be a measurable space. \textit{Information} can be characterized as a subset $\mathcal{A} \subseteq \mathcal{F}$ of events we are capable of evaluating as having occurred or not\cite{Hable2009DataBasedDU}.
                                                                                                                                      
                                                                                                                                      Let $(\Omega, \mathcal{F}, \mathbb{P})$ be a probability space, $(\Omega', \mathcal{F}')$ a measurable space and $X$ an \textit{observable} $\mathcal{F}-\mathcal{F}'-\text{measurable}$ random variable. Then $\mathcal{A}_X = \{X^{-1}({A}) \mid {A} \in {\mathcal{F}'}\} \subseteq \mathcal{F}$ represents through $X$ \textit{observable} information.
\end{definition}

\begin{example}[Colored dice I]
Consider a dice that is numbered and has coloured faces like this: $\Omega = \Big\{
  \raisebox{-3pt}{\drawdie[line hidden/.append style={fill=blue, opacity=0.47}]{1}},
  \raisebox{-3pt}{\drawdie[line hidden/.append style={fill=blue, opacity=0.47}]{2}},
  \raisebox{-3pt}{\drawdie[line hidden/.append style={fill=white, opacity=0.5}]{3}},
  \raisebox{-3pt}{\drawdie[line hidden/.append style={fill=green, opacity=0.6}]{4}},
  \raisebox{-3pt}{\drawdie[line hidden/.append style={fill=green, opacity=0.6}]{5}},
  \raisebox{-3pt}{\drawdie[line hidden/.append style={fill=green, opacity=0.6}]{6}}
  \Big\}$.

If we are interested in the face values we can simply map the faces to the according numbers $X: \Omega \rightarrow \{1, 2, 3, 4, 5, 6\}$. For each realization of $X$ we can exactly know which events did occur or not. If we instead map to colours by $Y: \Omega \rightarrow \{blue, white, green\}$ some information is lost. If e.g. a green face was rolled, we can not know which of the green sides $\Big\{
  \raisebox{-3pt}{\drawdie[line hidden/.append style={fill=green, opacity=0.6}]{4}},
  \raisebox{-3pt}{\drawdie[line hidden/.append style={fill=green, opacity=0.6}]{5}},
  \raisebox{-3pt}{\drawdie[line hidden/.append style={fill=green, opacity=0.6}]{6}}
  \Big\}$ was rolled based on the piece of information "it was \textit{green}". 
\end{example}



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
