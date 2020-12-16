require(tidyverse)

#B is placebo, A is treatment
#input data
daysafter <- c(0,7,14,21,28,35,42,49,56,63,70,77,84,91,98,105,112,119)
eventsA <- c(0,0,21,37,39,41,42,42,43,44,47,48,48,49,49,50,50,50)
riskA <- c(0,21314,21230,21054,20481,19314,18377,17702,17186,15464,14038,12169,9591,6403,3374,1463,398,0)
eventsB <- c(0,0,25,55,73,97,123,143,166,192,212,235,249,257,267,274,275,275)
riskB <- c(0,21258,21170,20970,20366,19209,18218,17578,17025,15290,13876,11994,9471,6294,3301,1449,398,0)
#many records for person (for as long as they've been enrolled in the study)

#un-cumulative sum?
newA <- c(eventsA[1],diff(eventsA))
newA <- newA/riskA
newB <- c(eventsB[1],diff(eventsB))
newB <- newB/riskB
dataA <- cbind(daysafter,newA)
dataB <- cbind(daysafter,newB)
dataA <- as.data.frame(newA)
dataB <- as.data.frame(newB)

#EDA
gB <- ggplot(data = dataB,mapping = aes(x = daysafter, y = newB))+ geom_point() #placebo
gA <- ggplot(data = dataA,mapping = aes(x = daysafter, y = newA))+ geom_point() #vaccine
all <- cbind(dataA, dataB)

ggplot(data = all) + geom_point(aes(x = daysafter, y = newB), col = "#1b98e0") + geom_point((aes(x = daysafter, y = newA)))
#yay! survival-like curves
#second vaccine happens third week after first
#variability in treatment group at the end results from smaller sample size

#Next step: expand to many records per subject (figure out risk/event meaning)
#Put "1" in the week that the diagnosis occurs
