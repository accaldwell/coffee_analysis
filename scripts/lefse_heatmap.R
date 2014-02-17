library(ggplot2)

lefse_data <- read.table('/data/argonne2/manuscript-arg2_COF_motan8_ss3k/processed_lefse.tsv', header=F)

pdf("COFCafe_Lefse_Phyla.pdf", width=16, height=10)

ggplot(lefse_data, aes(x = V2, y = factor(V1, c("ORG", "TRN", "INT")), fill = V3)) + scale_fill_gradient2(low = "#ffffbf", mid = "#1a9641", high = "#2b83ba", midpoint = max(lefse_data$V3)/2, na.value = "grey50", guide = "colourbar", name = "OTU Count")  + geom_tile() + geom_text(aes(label = V3), size = 3) + theme(axis.text.x=element_text(angle=-90, hjust=0)) + ggtitle("LEfSe Discrimintory OTUs, Coffee Rhizosphere Only") + xlab("Phylum") + ylab("Sample")

dev.off()