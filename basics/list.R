l1 <- list(id=1L, name="Kowalski", temp=36.6)
class(l1)
class(l1[[1]])
class(l1[[2]])


l1$name
l1["temp"]
arg <- "id"
l1$arg
l1[arg]
l1["arg"]
l1$i
l1[["i"]]
l1[["i", exact=FALSE]]