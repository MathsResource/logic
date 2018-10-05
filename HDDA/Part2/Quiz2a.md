#### K-means Exercises #1

(1 point possible)
Run kmeans with 4 centers for the blood RNA data:

<pre><code>
library(GSE5859Subset)
data(GSE5859Subset)
</code></pre>

Set the seed to 10, set.seed(10) right before running kmeans with 5 centers.

Explore the relationship of clusters and information in sampleInfo. Which of the following best described what you find:

* sampleInfo$group is driving the clusters as the 0s and 1s are in completely different clusters/  
* The year is driving the clusters  
* Date is driving the clusters  
* The clusters don't depend on any of the column of sampleInfo

