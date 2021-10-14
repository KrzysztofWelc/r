m3 <- matrix(1:10, nrow=2, ncol=5)
m4 <- 1:10

#ustawia wymiary obiektu m3 na 5 i 2
dim(m4) <- c(5,2)
attributes(m4)

m5 <- matrix(rep(1,4),nrow=2,ncol=2)
m6 <- matrix(rep(2,4),nrow=2,ncol=2)
m5 * m6
m5 %*% m6
