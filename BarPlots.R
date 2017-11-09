#Author Shabhonam.caim@quadram.ac.uk
setwd("~/Desktop/Testdata/")
library(ggplot2)
Stack_data <- read.csv("tiny-test.csv")
png("Taxon.png",
    width = 5*3000,        # 5 x 300 pixels
    height = 5*3000,
    res = 600,            # 300 pixels per inch
    pointsize = 10)

library(reshape2)
df_long <- melt(Stack_data, id.vars = "ID", variable.name = "Phyla")


library(ggplot2)
#pdf("test.pdf")
ggplot(df_long, aes(x = ID, y = value, fill = Phyla)) + 
  geom_bar(stat = "identity")+theme(legend.position="bottom", legend.direction="horizontal", legend.title = element_blank())

dev.off()
