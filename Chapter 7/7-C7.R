library(wooldridge)
data('wage1')
View(wage1)

#i)
basis.lm <- lm(log(wage)~female*educ+exper+I(exper^2)+tenure+I(tenure^2), data=wage1)
summary(basis.lm)
#the gender differential at educ=12.5 is 
coef(basis.lm)["female"]+12.5*coef(basis.lm)["female:educ"]
#at educ = 0:
coef(basis.lm)["female"]
#it is about 7 pp greater at educ = 12.5

#ii)
q2.lm <- lm(log(wage)~female+educ+female:I(educ-12.5)+exper+I(exper^2)+tenure+I(tenure^2), data=wage1)
summary(q2.lm)
#we are now estimating the effect of female on the other covariates holding them constant, and for educ = 12.5
#the effect of female is now:
coef(q2.lm)["female"]
#which is identical to what we have received in i).

#iii)
# in the first regression, we found that female was not significant, but in the second one, we see that 
# female is significant at educ = 12.5. 
# In the first regression, it would have been unlikely to find a significant effect if there are no observations
# that have such a low value in the dataset. 