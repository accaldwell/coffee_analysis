library(ggplot2)
library(plyr)
library(gridExtra)

## http://www.cookbook-r.com/Graphs/Plotting_means_and_error_bars_(ggplot2)/#Helper functions
## Summarizes data.
## Gives count, mean, standard deviation, standard error of the mean, and confidence interval (default 95%).
##   data: a data frame.
##   measurevar: the name of a column that contains the variable to be summariezed
##   groupvars: a vector containing names of columns that contain grouping variables
##   na.rm: a boolean that indicates whether to ignore NA's
##   conf.interval: the percent range of the confidence interval (default is 95%)
summarySE <- function(data=NULL, measurevar, groupvars=NULL, na.rm=FALSE,
                      conf.interval=.95, .drop=TRUE) {
  require(plyr)
  
  # New version of length which can handle NA's: if na.rm==T, don't count them
  length2 <- function (x, na.rm=FALSE) {
    if (na.rm) sum(!is.na(x))
    else       length(x)
  }
  # This does the summary. For each group's data frame, return a vector with
  # N, mean, and sd
  datac <- ddply(data, groupvars, .drop=.drop,
                 .fun = function(xx, col) {
                   c(N    = length2(xx[[col]], na.rm=na.rm),
                     mean = mean   (xx[[col]], na.rm=na.rm),
                     sd   = sd     (xx[[col]], na.rm=na.rm)
                   )
                 },
                 measurevar
  )
  
  # Rename the "mean" column    
  datac <- rename(datac, c("mean" = measurevar))
  
  datac$se <- datac$sd / sqrt(datac$N)  # Calculate standard error of the mean
  
  # Confidence interval multiplier for standard error
  # Calculate t-statistic for confidence interval: 
  # e.g., if conf.interval is .95, use .975 (above/below), and use df=N-1
  ciMult <- qt(conf.interval/2 + .5, datac$N-1)
  datac$ci <- datac$se * ciMult
  
  return(datac)
} 

shared_summary <- read.table('abund.subsample.filter.an.unique_list.wcount.groups.summary', header=T)

COF_meta <- read.delim("COF_meta_full.csv")

shared_wMeta <- merge(shared_summary, COF_meta, by="group")

#By Site

#plot1 <- ggplot(shared_wMeta, aes(x=group, y=chao, ymin=chao_lci, ymax=chao_hci, fill=Site)) + geom_bar(stat="identity") + geom_errorbar() + geom_point(aes(x=group, y=sobs)) + theme(axis.text.x=element_text(angle=-90, hjust=0)) + ggtitle("COF chao Richness Estimate (97% OTUs) w/ 95% CI, By Site")

#stat_shared <- summarySE(data=shared_wMeta_noSingles, measurevar="chao", groupvars="Site", na.rm=FALSE, conf.interval=.95)

#plot2 <- ggplot(stat_shared, aes(x = Site, y = chao, ymin=chao-se, ymax=chao+se, fill=Site)) + geom_bar(stat = "identity") + geom_errorbar() +theme(axis.text.x=element_text(angle=-90, hjust=0)) + ggtitle("COF chao Richness Estimate (97% OTUs), By Site (Mean w/ Std Err, no MAN/NEG)")

#pdf("COF_Chao_Site.pdf", width=12, height=15)

#grid.arrange(plot1, plot2)

#dev.off()

#by Sample Type

#plot1 <- ggplot(shared_wMeta, aes(x=group, y=chao, ymin=chao_lci, ymax=chao_hci, fill=SampleType)) + geom_bar(stat="identity") + geom_errorbar() + geom_point(aes(x=group, y=sobs)) + theme(axis.text.x=element_text(angle=-90, hjust=0)) + ggtitle("COF chao Richness Estimate (97% OTUs) w/ 95% CI, By SampleType")

#stat_shared <- summarySE(data=shared_wMeta, measurevar="chao", groupvars="SampleType", na.rm=FALSE, conf.interval=.95)

#plot2 <- ggplot(stat_shared, aes(x = SampleType, y = chao, ymin=chao-se, ymax=chao+se, fill=SampleType)) + geom_bar(stat = "identity") + geom_errorbar() + theme(axis.text.x=element_text(angle=-90, hjust=0)) + ggtitle("COF chao Richness Estimate (97% OTUs), By SampleType (Mean w/ Std Err)")

#pdf("COF_Chao_SampleType.pdf", width=12, height=15)

#grid.arrange(plot1, plot2)

#dev.off()

#by Site + Sample Type

plot1 <- ggplot(shared_wMeta, aes(x=group, y=chao, ymin=chao_lci, ymax=chao_hci, fill=Site.SampleType)) + geom_bar(stat="identity") + geom_errorbar() + geom_point(aes(x=group, y=sobs)) + theme(axis.text.x=element_text(angle=-90, hjust=0))

stat_shared <- summarySE(data=shared_wMeta, measurevar="chao", groupvars="Site.SampleType", na.rm=FALSE, conf.interval=.95)

plot2 <- ggplot(stat_shared, aes(x = Site.SampleType, y = chao, ymin=chao-se, ymax=chao+se, fill=Site.SampleType)) + geom_bar(stat = "identity") + geom_errorbar() + theme(axis.text.x=element_text(angle=-90, hjust=0))

pdf("Figure1_Chao_SiteSampleType.pdf", width=12, height=15)

grid.arrange(plot1, plot2)

dev.off()