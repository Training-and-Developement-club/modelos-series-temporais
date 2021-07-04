## Programa de Educação Continuada Poli-USP
## Engenharia Financeira
##
## EGF004 - Modelos de Previsão em Séries Temporais
## Paulo Henrique Freitas Guimarães

## Exercício 4

# Importações
library(forecast)

# Limpando a memória
rm(list=ls(all=TRUE))

mi = 0
theta1 = 0.2
eps_100 = 0.01
sigma = 0.025

Y101 = mi + theta1 * eps_100
Y102 = mi
# Valores estimados para a101 e a102:
Y101
Y102

sigma_e1 = sigma
sigma_e2 = sqrt(1 + theta1^2)*sigma
# Desvio padrão dos erros:
sigma_e1
sigma_e2

Y1 = arima.sim(n=10000, list(ma=c(theta1)), sd=sigma_e1)
Y2 = arima.sim(n=10000, list(ma=c(theta1)), sd=sigma_e2)

par(mfrow=c(1, 2))
acf_sim1 = Acf(Y1)
acf_sim2 = Acf(Y2)

