v5 <- 1:5
v6 <- 6:10
v5 + v6
v5 - v6
v5 * v6
v5 / v6
v5 == v6
v5 >= 3

m1 <- cbind(v5,v6)
m2 <- rbind(v5,v6)

m1
m1[1,2]
m1[1,2, drop=FALSE]

m1[2:3,]