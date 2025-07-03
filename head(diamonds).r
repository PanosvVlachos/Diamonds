library(ggplot2)

head(diamonds)#install.packages("ggplot2")
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
pie(table(a$cut),xlab = "Cut", ylab = "Frequency", main = "BAR PLOT OF CUT", col="dodgerblue")
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
#CHECKING FOR NORMAL DISTRIBUTION
x = diamonds$price  # or diamonds$carat, etc.
hist(x, breaks = 50, probability = TRUE, 
     col = "lightblue", main = "Histogram with Normal Curve", xlab = "Price")
lines(density(x), col = "red", lwd = 2)

qqnorm(x)
qqline(x, col = "red", lwd = 2)

ks.test(x, "pnorm", mean(x), sd(x))

#%%
# USE MEADIAN- MAD (median absolute deviation) TO USE Z-SCOPE(NORMALIZE IT)
price <- diamonds$price
med <- median(price)
mad_val <- mad(price)

# Modified z-score formula
mod_z <- 0.6745 * (price - med) / mad_val

# Threshold: usually > 3.5 is considered an outlier
outliers <- which(abs(mod_z) > 3.5)
diamonds[outliers, ]
length(outliers)
#%%
# USE MEADIAN- MAD (median absolute deviation) TO USE Z-SCOPE(NORMALIZE IT)
carat<- diamonds$carat
med <- median(carat)
mad_val <- mad(carat)

# Modified z-score formula
mod_z <- 0.6745 * (carat - med) / mad_val

# Threshold: usually > 3.5 is considered an outlier
outliers <- which(abs(mod_z) > 3.5)
diamonds[outliers, ]
length(outliers)
#%%
#CLEANING THE DATA
diamonds_clean <- diamonds[abs(mod_z) <= 3.5, ]
dim(diamonds_clean)

