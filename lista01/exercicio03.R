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

