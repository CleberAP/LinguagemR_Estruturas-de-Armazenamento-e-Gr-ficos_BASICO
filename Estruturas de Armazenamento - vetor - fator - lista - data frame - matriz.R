

# 1. Vetor - todos os elementos devem ser do mesmo tipo
?c

cidades <- c("Campo Grande", "Corumbá", "Ladário", "Miranda")
cidades
cidades[0]
numero <- c(1,2,3,4)
numero[0]
cidades[3]
cidades[4] <- "Aquidauana" # Atualizando o valor de um índice existente
cidades
cidades[5] <- "Miranda" # Adicionando novo índice atribuindo um valor
cidades
cidades[2:4] # Acessando um intervalo
cidades[-4] # exibe todos exceto o índice apontado
cidades[6] <- "Whashington" # Adicionando novo índice e valor
cidades
cidades <- cidades[-6] # removendo o valor através do índice
cidades

cidades <- NULL # Limpa o vetor
cidades

estados.sigla <- c("MS", "MS", "MS", "MS", "MS", "MS")
estados.sigla
# ** ir ao final do script para ver as funções de alteração destes vetores

#***************************

# 2. Fator - Armazena valores categóricos (nominal ou ordinal)
?factor
siglas <- c("SP", "GO", "RS", "DF", "GO", "SP", "MS", "MT", "SP", "MS")
UF <- factor(siglas)
is.factor(UF)
UF
UF[1]
str(UF)

# 2.a. especificando níveis

UF <- factor(c("SP", "GO", "RS", "DF", "GO", "SP", "MS", "MT", "SP", "MS"), 
             labels = c("S","G","R","D","M", "T" ))
UF
UF[1]
str(UF)

UF <- factor(c("SP", "GO", "RS", "DF", "GO"), 
             labels = c("Paulistano","Goiano","Gaúcho","Candango"),
             levels = c("SP","GO","RS","DF"),
             ordered = TRUE)
UF

UF <- factor(c("SP", "GO", "RS", "GO", "DF", "GO"), 
             labels = c(1,3,6,23),
             levels = c("SP","GO","RS","DF"),
             ordered = TRUE)
UF


instrucao <- c("Médio", "Fundamental II", "Fundamental I", "Superior", 
               "Superior", "Fundamental II")

grau.instrucao <- factor(instrucao)
grau.instrucao

grau.instrucao <- factor(instrucao, ordered = TRUE)
grau.instrucao

grau.instrucao <- factor(instrucao,
                         levels = c("Fundamental II", "Superior", 
                                    "Fundamental I"),
                         ordered = TRUE)
grau.instrucao # Note que não especifiquei 'levels' igual a "Médio"
# então retorna valor <NA>

grau.instrucao <- factor(instrucao,
                         levels = c("Médio", "Fundamental II", "Superior", "Fundamental I"),
                         ordered = TRUE)
grau.instrucao

grau.instrucao <- factor(instrucao,
                         levels = c("fundamental II", "Superior", "Fundamental I"),
                         ordered = TRUE)
grau.instrucao # Note que ele é case sensitive.
# Alterei o primeiro elemento de 'levels' então alguns itens foram considerado <NA>

grau.instrucao <- factor(instrucao,
                         levels = c("Fundamental I", "Fundamental II", "Médio", "Superior"),
                         labels = c("Nível I", "Nível II", "Nível III", "Nível IV"),
                         ordered = TRUE)
grau.instrucao # Renomeou os itens de cada nível especificado com novo nome

#***************************

# 3. Lista - tipo de vetor, mas elementos podem ser diferentes
?list

lista <- list(cidades, estados.sigla, UF)
lista
lista$cidades
lista$UF
lista[1]

pessoa <- list(nome="João",
               sexo="M",
               idade=42,
               cidade="Campo Grande")
pessoa
str(pessoa)

# 3.a. acessando índices
pessoa[1]
pessoa[[1]]
pessoa[2]

# 3.a.1. acessando pelo nome da variável/campo
pessoa["sexo"]
pessoa[["sexo"]] # Acessa o elemento

sexo_da_pessoa <- pessoa[["sexo"]]
str(sexo_da_pessoa)
print(sexo_da_pessoa)
print(paste("Sexo da pessoa é: ", sexo_da_pessoa))

# 3.b. filtrando elementos da lista
pessoa[c('nome','idade')]
pessoa[c('nome','idade')][["nome"]]
pessoa[c('nome','idade')][["idade"]]

# 3.c. declarando lista com listar por campo. Idem a uma tabela.
# Não é muito usual
pessoas.lista <- list(nome=c("João", "Maria"),
               sexo=c("M", "F"),
               idade=c(42, 23),
               cidade=c("Campo Grande", "Miranda")
               )
pessoas.lista[['nome']]
pessoas.lista[['nome']][1]

# 3.d. declarando lista de pessoas
pessoa2 <- list(nome="Maria",
               sexo="F",
               idade=22,
               cidade="São Paulo")
pessoa3 <- list(nome="Ana",
                sexo="F",
                idade=32,
                cidade="Curitiba")

pessoas <- list(pessoa, pessoa2)
pessoas[[3]] <- pessoa3

pessoas[3]
pessoas <- NULL

pessoas

for (p in pessoas){
  print(p[["nome"]])
}


# 3.e. declarando uma lista de cidades
cidades.lista = list(cidade= cidades,
                     uf = estados.sigla)
cidades.lista
#***************************

# 4. Data frame - organiza em linhas e colunas. Pode ser formado por listas ou vetores
?data.frame

# 4.a. Criando um data frame com vetores
dfA <- data.frame(cidades, estados.sigla)
dfA
dfA[1]
dfA[2]
dfA[3] # índice não definido, sem atribuição de valores

dfA$cidades

# 4.b. Criando um data frame com lista
df.cidades <- data.frame(cidades.lista)
df.cidades

# 4.c. Filtrando valores do data frame por fatiamento simples
dfA[1,2] # linha e coluna
dfA[,1] # todas as linhas da primeira coluna
dfA[1,] # primeira linha e todas as colunas

# 4.d. Filtrando valores do data frame por fatiamento complexo
dfA[c(2:4), c(0,2)] # Seleciona linhas 2 até 4 apenas última coluna*
# * mais usual quando temos 3 ou mais colunas
# ...Então vamos alterar o Data Frame

names(dfA) # Verificando nome das colunas
populacao <- c(1500, 2000, 1800, 12500, 300) # Criando um vector com quantidade de população
dfA[3] <- populacao # Atribuindo o vector no índice 3 do data frame
dfA[3]
dfA
names(dfA)[3] <- "População"  # Alterando o nome da coluna de índice 3
dfA
names(dfA)[1:2] <- c("Município", "UF") # Alterando nome das colunas com índice 1 e 2
dfA
# Agora sim um bom exemplo de como podemos utilizar um filtro 
dfA[c(2:4), c(1,3)] # Seleciona linhas 2 até 4 apenas 1ª e 3ª coluna

# 4.e. Outras funções
dim(dfA) # número de linhas x colunas
str(dfA) # verifica os tipos de dados
dfA$cidades # Acessa uma coluna ...Se ela existir
dfA$Município
dfA["Município"]
str(dfA$Município) # Verificando o tipo de dados de uma coluna
dfA$Município[1] # Acessando o 1º registro da coluna especificada
names(dfA) # nomes das colunas
print(names(dfA))
names(dfA)[1] # nome de uma coluna específica
print(names(dfA)[1])


# 4.f. Filtrar por Estado
cidade.MS <- dfA[['UF']] == "MS"
cidade.MS

#install.packages("dplyr")
library(dplyr)

cidade.MS <- filter(dfA, dfA[['UF']] == "MS")
cidade.MS
cidades.MS[3]
?filter

filter()
dim(cidade.MS)


#***************************

# 5. Matriz - tipo de data frame, porém só aceita um tipo de dado

m <- matrix(seq(1:9), ncol = 3)
m

m2 <- matrix(seq(1:25),
             ncol = 5,
             byrow = TRUE,
             dimnames = list(c(seq(1:5)),
                             c('A','B','C','D','E')
             )
)
m2

# 5.a. Filtrando a matriz
m2[c(1:3), c("B","C")]

#***************************

# 6. Gráfico Histograma
dfA
hist(dfA$População, 
     main="População", 
     xlab="Eixo X", 
     ylab="Eixo Y", 
     col="grey",
     breaks=10)#,
     #max(dfA$População))
?hist

#***************************

# 7. Gráfico Boxplot
boxplot(dfA$População)

dfB <- dfA %>%
  filter(População <= 6000)

boxplot(dfB$População)

dfA
# Alterando valor da População da cidade São Paulo
dfA$População[4] <- 3500
dfA
#***************************

# 8. Table - uso com data frame
?base::table
# 8.1. Verificando a quantidade de ocorrências para cada coluna
table(dfA$Município)
table(dfA$UF)
table(dfA$UF, exclude="PR")
# 8.2. quantidade de registros
length(table(dfA$Município))
length(table(dfA$UF))

# 8.1. obter proporção das ocorrências pelo total de registros
prop.table(table(dfA$Município))
prop.table(table(dfA$UF))
prop.table(table(dfA$UF))*100 # convertendo em percentual

#***************************

# 9. Gráfico de Barras
library(ggplot2)
?ggplot

head(dfA)
str(dfA)

ggplot(dfA, aes(x=Município, y=População))+
  geom_bar(stat='identity')

ggplot(dfA, aes(x=UF, y=População))+
  geom_bar(stat='identity')


#***************************

# 10. Gráfico de Barras Invertidas
ggplot(dfA, aes(x=Município, y=População))+
  geom_bar(stat='identity')+
  coord_flip() # Muda para barra invertida

# 10.1. Adicionando rótulos de dados
ggplot(dfA, aes(x=Município, y=População))+
  geom_bar(stat='identity')+
  geom_text(aes(label=População))+
  coord_flip() # Muda para barra invertida

# 10.2. Adicionando rótulos de dados com alguns ajustes
ggplot(dfA, aes(x=Município, y=População))+
  geom_bar(stat='identity')+
  geom_text(aes(label=População), hjust=0, vjust=0.3, size=3)+ # vjust e size servem para alterar o tamanho e a posiçãoo dos rótulos das barras
  coord_flip() # Muda para barra invertida

# 10.3. Formatando título, margens da área do gráfico e outras configurações
#library(grid)
ggplot(dfA, aes(x=Município, y=População))+
  ggtitle("População por Município")+
  geom_bar(stat='identity')+
  geom_text(aes(label=População), hjust=0.5, vjust=0.5, size=3, color="blue")+ # vjust e size servem para alterar o tamanho e a posiçãoo dos rótulos das barras
  coord_flip()+ # Muda para barra invertida
  #theme(axis.title.x=element_text(vjust=-0.5))+
  #theme(axis.title.y=element_text(angle=90, vjust=-0.5))+
  theme(plot.margin = unit(c(0.3,0.2,0.2,0.5), "cm"))+
  #theme(axis.line = element_line(arrow = arrow()))+
  #theme(axis.line.x = element_line(arrow = arrow()))+
  theme(axis.line.x = element_line(size=1.25))+
  theme(plot.background=element_rect(color="black",
                                     fill = "grey90"))

# 10.4. Formatando legenda
ggplot(dfA, aes(x=Município, y=População, size=População))+
  ggtitle("População por Município")+
  geom_bar(stat='identity')+
  geom_text(aes(label=População), hjust=0.5, vjust=0.5, size=3, color="blue")+ # vjust e size servem para alterar o tamanho e a posiçãoo dos rótulos das barras
  coord_flip()+ # Muda para barra invertida
  theme(plot.background=element_rect(color="black",
                                     fill = "grey90"))
  
# sentido do relógio (TOP, RIGHT, BOTTOM, LEFT)

#***************************

# Função
set.vetor.cidades <- function(){
  vetor_aux <- c("Campo Grande", "Cuiabá", "Curitiba", "Aquidauana")
  vetor_aux[4] <- "São Paulo"
  vetor_aux[5] <- "Miranda"
  return(vetor_aux)
}

cidades <- NULL
cidades <- set.vetor.cidades()
cidades

set.vetor.estados.siglas <- function(){
  vetor_aux <- c("MS", "MT", "PR", "SP", "MS")
  return(vetor_aux)
}

estados.sigla <- set.vetor.estados.siglas()
estados.sigla
