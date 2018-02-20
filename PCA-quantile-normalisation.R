setwd("~/Desktop/Testdata/Mel/PCA_Mel/")
library(devtools)
#install_github("ggbiplot", "vqv")
#install_github('sinhrks/ggfortify')
library(ggfortify)
library(cluster)
require("gplots")
require("ggplot2")
require("RColorBrewer")

library("preprocessCore")
n <- 60
qual_col_pals = brewer.pal.info[brewer.pal.info$category == 'qual',]
col_vector = unlist(mapply(brewer.pal, qual_col_pals$maxcolors, rownames(qual_col_pals)))


data <- read.csv("BabyX-A-10-19-02-18.csv")
ncol(data)
df <- data[c(2:ncol(data))]
head(df)
source("~/Desktop/Testdata/Rscripts/quantile.R")


quants <- normalize.quantiles(as.matrix(df), copy = F)

data <- read.csv("BabyX-A-10-19-02-18.csv",header=T)
head(data)
rownames(data) <- data[,1]
data_mat <- data.matrix(data[,-1]) 
head(data_mat)
data_norm <- normalize.quantiles(data_mat, copy = TRUE)
head(data_norm)

log.data <-log(data_norm)
pca.data <-prcomp(data_norm,
                  center = TRUE,
                  scale. = TRUE)

ggplot(pca.data,aes(x=PC1,y=PC2))
autoplot(pca.data, data = data, colour = 'ID')+
  theme(legend.position="bottom", legend.direction="horizontal", legend.title = element_blank())
autoplot(pca.data,data=data,colour='ID', label=FALSE)+scale_color_manual(values=c("Red","Blue","Green","Purple","Brown","Orange","Black"))+
  scale_fill_manual(values=c("Red","Blue","Green","Purple","Brown","Orange","Black"))+theme_bw()+ylab("PC2")

