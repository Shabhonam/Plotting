setwd("~/Desktop/Testdata/")
library(ggfortify)
library(cluster)
require("gplots")
require("ggplot2")
require("RColorBrewer")
data <- read.csv("NMDS_data_mel.csv")
head(data[, 1:7])

df <- data[c(2:ncol(data))]
pca_data <-prcomp(df)
write.csv(pca_data, "logdata.csv")


png("PCA_test.png",
    width = 5*300,        # 5 x 300 pixels
    height = 5*300,
    res = 300,            # 300 pixels per inch
    pointsize = 10)

autoplot(prcomp(df), data = data, colour = 'ID')+
  theme(legend.position="bottom", legend.direction="horizontal", legend.title = element_blank())
autoplot(fanny(df, 4), frame = TRUE,  )
dev.off()






