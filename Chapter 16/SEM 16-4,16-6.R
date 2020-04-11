library(wooldridge)
ds <- data('openness')
print(ds)
openness
firststage <- lm(open~log(pcinc)+log(land), data=openness)
summary(firststage)
openness$openhat <- fitted(firststage)
secondstage <- lm(inf~openhat+log(pcinc), data=openness)
summary(secondstage)
