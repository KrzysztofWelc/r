v1 <- 3:0

v1[1]
v1[length(v1)]
v1[c(T,T,T,F)]
v1[3:1]
v1[-2]

v2 <- 10:14
v2[3:1]


v2 <- c(0/0, 1/0, 1/Inf, TRUE, as.numeric("abc"))
v3 <- as.logical(c("T", "False", "abc"))
class(v2)
class(v3)