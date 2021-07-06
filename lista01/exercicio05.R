## Programa de Educação Continuada Poli-USP
## Engenharia Financeira
##
## EGF004 - Modelos de Previsão em Séries Temporais
## Paulo Henrique Freitas Guimarães

## Exercício 5


# Importações
library(forecast)

# Limpando a memória
rm(list=ls(all=TRUE))

# Gerando o modelo
phi = c(0, 0.2)
rc = rep(0, 30)
desvio_padrao = sqrt(0.02)
c = 0.01
rc[1] = c + rnorm(1)*desvio_padrao
rc[2] = c + rnorm(1)*desvio_padrao
rc[3] = c + phi[2]*rc[1] + rnorm(1)*desvio_padrao
for (i in 4:30)
{
  rc[i] = c + phi[2]*rc[i-2] + rnorm(1)*desvio_padrao
}
rc = ts(rc)
par(mfrow=c(1, 1))
plot(rc, type="s")


# Média de serie
mean(rc)
# Variância da serie
var(rc)


# Autocorrelações
par(mfrow=c(1, 2))
Acf(rc)
Pacf(rc)

eps100 = -0.01
eps099 = 0.02

Y101 = c + phi[2]*eps099
Y102 = c + phi[2]*eps100


# Previsão um e dois períodos a frente:
Y101
Y102

sigma_e1 = desvio_padrao
sigma_e2 = sqrt(1 + phi[2]^2) * desvio_padrao

# Erros de previsão
sigma_e1
sigma_e2

