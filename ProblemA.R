forestdataframe <- read.table("covtype.data", sep=',')
forestdata <- as.matrix(forestdataframe)
tpca <- prcomp(forestdata[, (1:54)])
tmp <- cumsum(tpca$sdev^2)
percentTotVar <- tmp / tmp[54]
plot(percentTotVar)

# As we can see from the plot, the first principal component accounts for
# 66 percent of the variance and the second principal component accounts for
# 96 percent. The instructions for this assignment ask about how many are "enough"
# because the precision we need depends on what we are trying to do. Given that
# the first two components account for most of the variance and we are analyzing
# the data for a class project, we think the that these principal components are
# enough. However, if we were a company such as Amazon or Google, perhaps we
# would want up to five principal compoments (as we would have more computational
# resources and customers who would rely on our precision).

plot(tpca$x[sample(1:580000, 10000),1], tpca$x[sample(1:580000, 10000),2], col = rep(48:54))

# We do not see the cover types separating here, so we know that the first
# two components are not sufficient in predicting the cover type. We cannot know with
# certainty that all of the principal components together would be sufficient in 
# predicting the principal components because we cannot plot these variables on a 
# 2 dimensional graph. We expect that we will not be able to predict cover
# type based on only PC1 and PC2 because there is so much overlap over cover type
# categories when considering only PC1 and PC2.
