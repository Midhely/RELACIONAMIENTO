####################
#                  #
# Copiar todo esto #
#                  #
####################
# Hecho con gusto por _______________________________________

# Laboratorio - An·lisis de redes en R - Algebra matricial

# Objetivo: Explorar las funciones de algebra lineal con un caso hipotÈtico
# ------------------------------------------------------------------------------------------------------
# En este ejercicio vamos a:
# 1. Cargar nuestra matriz hipotÈtica de datos
# 2. Hacer diversas operaciones matriciales
# 3. Comprender el algoritmo base de las recomendaciones de AMAZON


#######################################
# LABORATORIO: Algebra matricial      #
#######################################


M = as.matrix(
  read.csv("https://raw.githubusercontent.com/PABalland/ON/master/amz.csv" , 
           sep = ",", 
           header = T, 
           row.names = 1))
M
dim(M)



# Es la estructura de red que AMAZON ocupa para hacer recomendaciones en base a tus compras actuales

M[1:6, 1]
# Ver sÛlo el vector de clientes que compran el producto "corbata" (producto de la columna 1)

M[1:6, 1:2]
#Ver sÛlo un fragmento de la base original, en relaciÛn a los dos productos que me interesan
#Puede ser ˙til para explorar clientes y productos

rowSums (M)
# Computar grado de centralidad

t(M)
# funciÛn ˙til para enfocarnos en productos y no sÛlo en clientes

M + M
# Suma de matrices


X = M + M
# Crear nuevo un objeto llamado x


M^2

M * M

M %*% t(M)
#multiplicaciÛn de matrices checar tamaÒos
#checar tamaÒo de la matriz -dim-

t(M) %*% M
#El algoritmo de recomendaciÛn de AMAZON, hace b·sicamente lo anterior.
# para tener el n˙mero de veces que 2 productos han sido comprados por el mismo cliente
#identificar productos que van frecuentemente juntos (co ocurrencias par)

P = t(M) %*% M
#similaridad de productos (de gustos) matriz de co ocurrencia de productos

diag (P) = 0
#no es una matriz identidad (como en la correlaciÛn) 

C = M %*% t(M)
#similaridad de clientes - matriz de co ocurrencia de clienes
C

diag (C) = 0
#no es una matriz identidad (como en la correlaciÛn) 
