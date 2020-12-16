require(tidyverse)

#input data
daysafter <- c(0,7,14,21,28,35,42,49,56,63,70,77,84,91,98,105,112,119)
eventsA <- c(0,0,21,37,39,41,42,42,43,44,47,48,48,49,49,50,50,50)
riskA <- c(0,21314,21230,21054,20481,19314,18377,17702,17186,15464,14038,12169,9591,6403,3374,1463,398,0)
eventsB <- c(0,0,25,55,73,97,123,143,166,192,212,235,249,257,267,274,275,275)
riskB <- c(0,21258,21170,20970,20366,19209,18218,17578,17025,15290,13876,11994,9471,6294,3301,1449,398,0)

#proportions
propA <- (eventsA/riskA)
propB <- (eventsB/riskB)

#un-cumulative sum?
newA <- c(eventsA[1],diff(eventsA))
newB <- c(eventsB[1],diff(eventsB))
dataA <- cbind(daysafter,newA)
dataB <- cbind(daysafter,newB)
dataA <- as.data.frame(newA)
dataB <- as.data.frame(newB)

#EDA
gB <- ggplot(data = dataB,mapping = aes(x = daysafter, y = newB))+ geom_point()
gA <- ggplot(data = dataA,mapping = aes(x = daysafter, y = newA))+ geom_point()

#yay! survival-like curves