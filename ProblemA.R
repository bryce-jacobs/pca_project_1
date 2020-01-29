forestdataframe <- read.table("covtype.data", sep=',')
forestdata <- as.matrix(forestdataframe)
tpca <- prcomp(forestdata[, (1:54)])
tmp <- cumsum(tpca$sdev^2)
percentageOfTotalVariance <- tmp / tmp[54]
plot(percentageOfTotalVariance)

#As we can see from the plot, the first principal component accounts for
#66 percent of the variance and the second principal component accounts for
#96 percent. The instructions for this assignment ask about how many are "enough"
#because the precision we need depends on what we are trying to do. Given that
#the first two components account for most of the variance and we are analyzing
#the data for a class project, we think the that these principal components are
#enough. However, if we were a company such as Amazon or Google, perhaps we
#would want up to four principal compoments (as we would have more computational
#resources and customers who would rely on our precision).

#We cannot see that the cover types are separating here, so we know that the first
#two components are not sufficient in predicting the cover type. We cannot know with
#certainty that all of the principal components together would be sufficient in 
#predicting the principal components because we cannot plot these variables on a 
#2 dimensional graph. 
