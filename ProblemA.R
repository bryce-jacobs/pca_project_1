covtype = read.table("/Users/megbobba/Desktop/covtype.data", sep=',')
tpca <- prcomp(covtype[, (1:54)])
tmp <- cumsum(tpca$sdev^2)
percentageOfTotalVariance <- tmp / tmp[54]
plot(percentageOfTotalVariance)
# As we can see from the plot, the first principal component accounts for 
# 66 percent of the variance and the second principal component accounts for
# 96 percent. Given that the first two components account for most of the 
# variance and we are analyzing the data for a class project, we think
# the that these principal components are enough. However, if we were a
# company such as Amazon or Google, perhaps we would want up to four.
