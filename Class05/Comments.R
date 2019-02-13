#' ---
#' title: "Graphs for Lecture 5"
#' author: "Asha Goodman"
#' date: "Fri Jan 25 13:32:21 2019"
#' output: github_documents
#' ---

# Class 5 graphics and plots with R
#'To [webpages](https://rmarkdown.rstudio.com/articles_report_from_r_script.html)

# Section 2A: Line Plot
weight <- read.table("bimm143_05_rstats/weight_chart.txt", header = TRUE)
weight
plot(weight$Age, weight$Weight, type = "o", pch = 15, cex = 1.5, lwd = 1.5, ylim = c(2,10), xlab = "Age (months)", ylab = "Weight (kg)", main = "Some title")


# Section 2B: Barplot
feature <- read.table("bimm143_05_rstats/feature_counts.txt", header = TRUE, sep = "\t")
feature
par(mar = c(4, 10, 4,4 ) + 0.1)
barplot(feature$Count, horiz = TRUE, names.arg = feature$Feature, las = 2, main = "Some Other Title")

#Section 3
mfcounts <- read.table("bimm143_05_rstats/male_female_counts.txt", header = TRUE, sep = "\t")
mfcounts
barplot(mfcounts$Count, horiz = FALSE, names.arg = mfcounts$Sample, col = c("blue2","red2"), las=2)
mfc <- read.delim("bimm143_05_rstats/male_female_counts.txt")
mfc

#Section Next
genes <- read.delim("bimm143_05_rstats/up_down_expression.txt")
plot(genes$Condition1, genes$Condition2, col = genes$State)

#How many rows
nrow(genes)
genes$State
table(genes$State)

#Dynamic COlor
exp <- read.delim("bimm143_05_rstats/expression_methylation.txt")
exp
plot(exp$expression, exp$gene.meth)
