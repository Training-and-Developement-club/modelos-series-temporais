## Programa de Educação Continuada Poli-USP
## Engenharia Financeira
##
## EGF004 - Modelos de Previsão em Séries Temporais
## Paulo Henrique Freitas Guimarães

## Exercício 1


# Limpando a memória
rm(list=ls(all=TRUE))

# Dados de entrada
x = c(907, 926, 506, 741, 789, 889, 874, 510, 529, 420, 679, 872, 924, 607, 452, 729, 794, 844, 1010, 621)
y = c(11.20, 11.05, 8.64, 9.21, 9.42, 10.08, 9.45, 6.73, 7.24, 6.12, 7.63, 9.43, 9.46, 7.64, 6.92, 8.95, 9.33, 10.23, 11.77, 7.41)

dados_matrix = matrix(c(x, y), nrow = length(x), ncol = 2)
write.table(dados_matrix, "dados_ex1.txt",col.names = c("X","Y"))

dados_xy = read.table("dados_ex1.txt", head=T)
X = dados_xy$X
Y = dados_xy$Y

# Faz a regressão linear
regress = lm(Y ~ X)
# Resume e mostra a regressÃ£o linear
summary(regress)
# Média dos resíduos da regressão (próximo de 0 = bom)
mean(residuals(regress))
# Teste de Shapiro para visualizar se a hipótese nula é válida (dados normalmente distribuídos)
shapiro.test(residuals(regress))
