## Programa de Educação Continuada Poli-USP
## Engenharia Financeira
##
## EGF004 - Modelos de Previsão em Séries Temporais
## Paulo Henrique Freitas Guimarães

## Exercício 3


# Limpando a memória
rm(list=ls(all=TRUE))

# Item A
phi = c(0.1097, -0.004943, -0.1224, 0.02954, 0.06804)
A = matrix(c(phi[1], phi[2], phi[3], phi[4], phi[5], 
             1, 0, 0, 0, 0,
             0, 1, 0, 0, 0,
             0, 0, 1, 0, 0,
             0, 0, 0, 1, 0), byrow=T, nrow=5, ncol=5)
autovalores = eigen(A)$values
modulo_autovalores = abs(autovalores)
modulo_autovalores
# Como o módulo dos autovalores são menores que 1, o modelo é estável


# Item B
a = rep(0, 30)
a[3] = 1
c = 0.0047
r = rep(0, 30)
r[1] = c + a[1]
r[2] = c + phi[1]*r[1] + a[2]
r[3] = c + phi[1]*r[1] + phi[2]*r[2] + a[3]
r[4] = c + phi[1]*r[1] + phi[2]*r[2] + phi[3]*r[3] + a[4]
r[5] = c + phi[1]*r[1] + phi[2]*r[2] + phi[3]*r[3] + phi[4]*r[4] + a[5]
for (t in 6:30)
{
  r[t] = c + phi[1]*r[t-1] + phi[2]*r[t-2] + phi[3]*r[t-3] + phi[4]*r[t-4] + phi[5]*r[t-5] + a[t]
}
r = ts(r)
par(mfrow=c(1,1))
plot(r, type="s")


#Item C
desvio_padrao = 0.007
rc = rep(0, 10000)
rc[1] = c + rnorm(1)*desvio_padrao
rc[2] = c + phi[1]*rc[1] + rnorm(1)*desvio_padrao
rc[3] = c + phi[1]*rc[1] + phi[2]*rc[2] + rnorm(1)*desvio_padrao
rc[4] = c + phi[1]*rc[1] + phi[2]*rc[2] + phi[3]*rc[3] + rnorm(1)*desvio_padrao
rc[5] = c + phi[1]*rc[1] + phi[2]*rc[2] + phi[3]*rc[3] + phi[4]*rc[4] + rnorm(1)*desvio_padrao
for (t in 6:10000)
{
  rc[t] = c + phi[1]*rc[t-1] + phi[2]*rc[t-2] + phi[3]*rc[t-3] + phi[4]*rc[t-4] + rnorm(1)*desvio_padrao
}
rc = ts(rc)
par(mfrow=c(1,1))
plot(rc, type="s")

