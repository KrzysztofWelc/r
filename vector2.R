v4 <- vector("numeric", length=9)
v4[1:4] <- 1:4
# po wprowadzeniu jednego stringa do vektora staje siê on character i  wszystkie inty staja siê char
v4[5] <- "xxxx"
v4[6:9] <- 6:9
class(v4[2])
class(v4)
v4
v4 <- as.numeric(v4)
bad <- is.na(v4)
#u do³u wusuwamy wartoœci fa³szywe z vektora
v4 <- v4[!bad]
v4