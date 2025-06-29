head(diamonds)
#%%
a=diamonds
#%%
levels(diamonds$cut)
#%%
class(a$carat)   = "numeric" 
class(a$price)   = "numeric"
#%%
summary(a)
#%%
hist(a$carat,xlim=c(0,3), xlab="Carat",ylab="Frequency",main="HISTOGRAM	OF CARAT",col="darkolivegreen1")
#%%
hist(a$price, xlim = c(0, 20000), xlab = "Price", ylab = "Frequency", main = "HISTOGRAM OF PRICE" )
#%%
barplot(table(a$color),xlab = "Color", ylab = "Frequency", main = "BAR PLOT OF COLOR", col="dodgerblue")
#%%
barplot(table(a$clarity),xlab = "Clarity", ylab = "Frequency", main = "BAR PLOT OF CLARITY", col="dodgerblue")
#%%
barplot(table(a$cut),xlab = "Cut", ylab = "Frequency", main = "BAR PLOT OF CUT", col="dodgerblue")
#%%
ggplot(color, price, outline=FALSE, xlab = "color", ylab = "Price", main = "Color VS Price")
#%%
ggplot(diamonds, aes(x = cut, y = price/carat)) +
  geom_boxplot(fill = "skyblue") +
  labs(title = "Price per Carat by Cut",
       y = "Price per Carat")
#%%
ggplot(diamonds, aes(x = clarity, y = price)) +
  geom_boxplot(fill = "skyblue") +
  labs(title = "Price per Carat by Clarity",
       y = "Price per Carat")
#%%

