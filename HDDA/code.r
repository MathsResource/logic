hc = hclust( dist( t(x)))
plot(hc)

set.seed(1)
m = 10000
n = 24
nc = replicate(100,{
x = matrix(rnorm(m*n),m,n)
hc = hclust( dist( t(x)))
length(unique(cutree(hc,h=143)))
})
plot(table(nc)) ## look at the distribution
popsd(nc)



mds=cmdscale(dist(t(geneExpression)))
set.seed(10)
result=kmeans(t(geneExpression),5)
mypar(1,1)
plot(mds,bg=result$cl,pch=21)
table(sampleInfo$group,result$cluster)
table(sampleInfo$date,result$cluster)
##looks better if we re-order:
table(sampleInfo$date,result$cluster)[,c(4,1,5,3,2)]


### Week 3- heatmap Exercise 1

##load libraries
library(rafalib)
library(gplots)
library(matrixStats)
library(RColorBrewer)
##make colors
cols = colorRampPalette(rev(brewer.pal(11,"RdBu")))(25)
gcol=brewer.pal(3,"Dark2")
gcol=gcol[sampleInfo$g+1]

##make lables: remove 2005 since it's common to all
labcol= gsub("2005-","",sampleInfo$date)  

##pick highly variable genes:
sds =rowMads(geneExpression)
ind = order(sds,decreasing=TRUE)[1:25]

## make heatmap
heatmap.2(geneExpression[ind,],
          col=cols,
          trace="none",
          scale="row",
          labRow=geneAnnotation$CHR[ind],
          labCol=labcol,
          ColSideColors=gcol,
          key=FALSE)
    


### Week 3- heatmap Exercise 2

library(gplots)
library(matrixStats)
library(genefilter)
library(RColorBrewer)
cols = colorRampPalette(rev(brewer.pal(11,"RdBu")))(25)

ttest = rowttests(x,g)
sds = rowSds(x)
Indexes = list(t=order(ttest$p.value)[1:50], s=order(-sds)[1:50])
for(ind in Indexes){
 heatmap.2(x[ind,],
          col=cols,
          trace="none",
          scale="row",
          labCol=g,
          key=FALSE)
 }

###############################
Conditional Exercise 2

xs = seq(160,178)
pr =sapply(xs,function(x0) mean(y[x==x0]))
plot(xs,pr)
abline(h=0.5)
abline(v=168)
