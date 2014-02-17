library(ggplot2)

axes <- read.table("abund.subsample.filter.an.unique_list.wcount.thetayc.0.03.lt.nmds.axes", header=T)

COF_meta <- read.delim("COF_meta_full.csv")

axes_wMeta <- merge(axes, COF_meta, by="group")

#ggplot(axes_wMeta, aes(axis1, axis2, colour=Site1, label=group)) + geom_point(size=3) + ggtitle("PCoA, by Site") + geom_text(hjust=0, vjust=0) + geom_density2d(alpha=.5) + theme(legend.position="bottom") 

#ggplot(axes_wMeta, aes(axis1, axis2, colour=Site2, label=group)) + geom_point(size=3) + ggtitle("PCoA, by Sample Type") + geom_text(hjust=0, vjust=0) + theme(legend.position="bottom")

pdf("Figure2_NMDS_SiteSampleType.pdf", width=12, height=10)

ggplot(axes_wMeta, aes(axis1, axis2, colour=Site, shape=SampleType)) + geom_point(size=3) + theme(legend.position="bottom")

dev.off()