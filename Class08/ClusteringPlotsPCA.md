Clustering\_and\_PCA
================
Asha Goodman
2/6/2019

You can also download this file from the class website!

``` r
mydata <- read.csv("https://tinyurl.com/expression-CSV",
 row.names=1)
head(mydata)
```

    ##        wt1 wt2  wt3  wt4 wt5 ko1 ko2 ko3 ko4 ko5
    ## gene1  439 458  408  429 420  90  88  86  90  93
    ## gene2  219 200  204  210 187 427 423 434 433 426
    ## gene3 1006 989 1030 1017 973 252 237 238 226 210
    ## gene4  783 792  829  856 760 849 856 835 885 894
    ## gene5  181 249  204  244 225 277 305 272 270 279
    ## gene6  460 502  491  491 493 612 594 577 618 638

Time to do our PCA

``` r
pca <- prcomp(t(mydata), scale=TRUE)
summary(pca)
```

    ## Importance of components:
    ##                           PC1    PC2     PC3     PC4     PC5     PC6
    ## Standard deviation     9.6237 1.5198 1.05787 1.05203 0.88062 0.82545
    ## Proportion of Variance 0.9262 0.0231 0.01119 0.01107 0.00775 0.00681
    ## Cumulative Proportion  0.9262 0.9493 0.96045 0.97152 0.97928 0.98609
    ##                            PC7     PC8     PC9      PC10
    ## Standard deviation     0.80111 0.62065 0.60342 3.348e-15
    ## Proportion of Variance 0.00642 0.00385 0.00364 0.000e+00
    ## Cumulative Proportion  0.99251 0.99636 1.00000 1.000e+00

Cumulative is the sum of variance as you move from PC1 to PC8

See what is returned by the prcomp() function (Summary is different in that it produces quantification/qualitative data)

``` r
attributes(pca)
```

    ## $names
    ## [1] "sdev"     "rotation" "center"   "scale"    "x"       
    ## 
    ## $class
    ## [1] "prcomp"

``` r
plot(pca$x)
```

![](ClusteringPlotsPCA_files/figure-markdown_github/unnamed-chunk-4-1.png)

``` r
plot(pca$x[,1], pca$x[,2], xlab="PC1", ylab="PC2") 
```

![](ClusteringPlotsPCA_files/figure-markdown_github/unnamed-chunk-4-2.png)

``` r
plot(pca)
```

![](ClusteringPlotsPCA_files/figure-markdown_github/unnamed-chunk-4-3.png) Variance captured per PC. Always round your significant figures.

``` r
pca.var <- pca$sdev^2
plot(pca, col=pca.var)
```

![](ClusteringPlotsPCA_files/figure-markdown_github/unnamed-chunk-5-1.png)

``` r
pca.var.per <- round(pca.var/sum(pca.var)*100, 1) 
pca.var.per
```

    ##  [1] 92.6  2.3  1.1  1.1  0.8  0.7  0.6  0.4  0.4  0.0

``` r
barplot(pca.var.per, main="Scree Plot",
 xlab="Principal Component", ylab="Percent Variation")
```

![](ClusteringPlotsPCA_files/figure-markdown_github/unnamed-chunk-6-1.png) A vector of colors for wt and ko samples.

``` r
colvec <- as.factor( substr( colnames(mydata), 1, 2) )
plot(pca$x[,1], pca$x[,2], col=colvec, pch=16,
 xlab=paste0("PC1 (", pca.var.per[1], "%)"),
 ylab=paste0("PC2 (", pca.var.per[2], "%)")) 
```

![](ClusteringPlotsPCA_files/figure-markdown_github/unnamed-chunk-7-1.png)
