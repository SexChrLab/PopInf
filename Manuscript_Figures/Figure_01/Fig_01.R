# PCA Figure for manuscript
# 2020-03-20

### LOAD PACKAGES ###
library("car")
library("plotrix")
library("viridis")
library(RColorBrewer)


# Function: Get centroid coordinates and radii for each population cluster  #
circle_function <- function(continent, evec_file_full) {
  continent_of_choice <- continent
  continent_of_choice_data <- evec_file_full[evec_file_full$SampleInfo %in% continent_of_choice,]
  mean_x <- mean(continent_of_choice_data$V2)
  mean_y <- mean(continent_of_choice_data$V3)
  points(mean_x, mean_y, pch = 3, cex = 1)
  test <- sqrt( ((mean_x - (continent_of_choice_data$V2))^2) + ((mean_y - (continent_of_choice_data$V3))^2) )
  radius <- sqrt(sum((test-0)^2/(length(test)-1))) # this looks good
  draw.circle(mean_x, mean_y, radius, lty=2)
  draw.circle(mean_x, mean_y, radius*2, lty=2)
  draw.circle(mean_x, mean_y, radius*3, lty=2)
  #draw.circle(mean_x, mean_y, radius*6, lty=2)
}


### INPUTS ###
# Evec and eval files #
# 1. GTEx autosomes
G_A_evec_file <- read.table("INPUTS/gtex/merge_all_chr_reference_panel_unknown_set_SNPs_no_missing_plink_LDprune_Fix2.evec", header = FALSE)
G_A_eval_file <- read.table("INPUTS/gtex/merge_all_chr_reference_panel_unknown_set_SNPs_no_missing_plink_LDprune.eval", header = FALSE)
G_A_results_file <- read.table("INPUTS/gtex/autosomes_inferred_pop_report.txt", header = T, sep = "\t")

# 2. GTEx X
G_X_evec_file <- read.table("INPUTS/gtex/chrX_reference_panel_unknown_set_SNPs_merge_noPARS_noXTR_noMissing_plink_LDprune_Fix2.evec", header = FALSE)
G_X_eval_file <- read.table("INPUTS/gtex/chrX_reference_panel_unknown_set_SNPs_merge_noPARS_noXTR_noMissing_plink_LDprune.eval", header = FALSE)
G_X_results_file <- read.table("INPUTS/gtex/chrX_inferred_pop_report.txt", header = T, sep = "\t")

# 3. TCGA autosomes
T_A_evec_file <- read.table("INPUTS/tcga/merge_all_chr_reference_panel_unknown_set_SNPs_no_missing_plink_LDprune_Fix2.evec", header = FALSE)
T_A_eval_file <- read.table("INPUTS/tcga/merge_all_chr_reference_panel_unknown_set_SNPs_no_missing_plink_LDprune.eval", header = FALSE)
T_A_results_file <- read.table("INPUTS/tcga/autosomes_inferred_pop_report.txt", header = T, sep = "\t")

# 4. TCGA X
T_X_evec_file <- read.table("INPUTS/tcga/chrX_reference_panel_unknown_set_SNPs_merge_noPARS_noXTR_noMissing_plink_LDprune_Fix2.evec", header = FALSE)
T_X_eval_file <- read.table("INPUTS/tcga/chrX_reference_panel_unknown_set_SNPs_merge_noPARS_noXTR_noMissing_plink_LDprune.eval", header = FALSE)
T_X_results_file <- read.table("INPUTS/tcga/chrX_inferred_pop_report.txt", header = T, sep = "\t")

# Sample information files #
# 1. 1000 genomes
known_population_file <- read.table("INPUTS/ThousandGenomesSamples_AdmxRm_new.txt", header = FALSE, sep = "\t")

# 2. GTEx
G_unkownpop_file <- read.table("INPUTS/GTExSamples_forplot_autosomes_short.txt", header = FALSE, sep = "\t")
#G_unkownpop_file <- read.table("INPUTS/GTExSamples_forplot_test.txt", header = FALSE, sep = "\t")

# 3. TCGA
T_unkownpop_file <- read.table("INPUTS/LIHC_primary_data_exome_VCF_samples_autosomes_short.txt", header = FALSE, sep = "\t")


## Set up inputs for plotting ##
# 1. Grab relevant info from df and unkownpop_file to merge.
# 1.a GTEx autosomes
G_A_forplotting <- as.data.frame(G_unkownpop_file)
names(G_A_forplotting)[1]<-paste("Sample")
names(G_A_forplotting)[2]<-paste("Sex")
names(G_A_forplotting)[3]<-paste("SampleInfo")
G_A_forplottinginfo <- G_A_results_file[c("Sample", "Plot.Info")] # change to Plot Info
G_A_forplotting.unk <- merge(G_A_forplotting, G_A_forplottinginfo,  by = "Sample")
names(G_A_forplotting.unk)[4]<-paste("PlotInfo")

# 1.b GTEx X chromosome
G_X_forplotting <- as.data.frame(G_unkownpop_file)
names(G_X_forplotting)[1]<-paste("Sample")
names(G_X_forplotting)[2]<-paste("Sex")
names(G_X_forplotting)[3]<-paste("SampleInfo")
G_X_forplottinginfo <- G_X_results_file[c("Sample", "Plot.Info")] # change to Plot Info
G_X_forplotting.unk <- merge(G_X_forplotting, G_X_forplottinginfo,  by = "Sample")
names(G_X_forplotting.unk)[4]<-paste("PlotInfo")

# 1.c TCGA autosomes
T_A_forplotting <- as.data.frame(T_unkownpop_file)
names(T_A_forplotting)[1]<-paste("Sample")
names(T_A_forplotting)[2]<-paste("Sex")
names(T_A_forplotting)[3]<-paste("SampleInfo")
T_A_forplottinginfo <- T_A_results_file[c("Sample", "Plot.Info")] # change to Plot Info
T_A_forplotting.unk <- merge(T_A_forplotting, T_A_forplottinginfo,  by = "Sample")
names(T_A_forplotting.unk)[4]<-paste("PlotInfo")

# 1.d TCGA X chromosome
T_X_forplotting <- as.data.frame(T_unkownpop_file)
names(T_X_forplotting)[1]<-paste("Sample")
names(T_X_forplotting)[2]<-paste("Sex")
names(T_X_forplotting)[3]<-paste("SampleInfo")
T_X_forplottinginfo <- T_X_results_file[c("Sample", "Plot.Info")] # change to Plot Info
T_X_forplotting.unk <- merge(T_X_forplotting, T_X_forplottinginfo,  by = "Sample")
names(T_X_forplotting.unk)[4]<-paste("PlotInfo")

# 2. This is the reference panel info needed for plotting
forplotting.refpan <- as.data.frame(known_population_file)
forplotting.refpan <- cbind(forplotting.refpan, PlotInfo="Reference Samples")
names(forplotting.refpan)[1]<-paste("Sample")
names(forplotting.refpan)[2]<-paste("Sex")
names(forplotting.refpan)[3]<-paste("SampleInfo")

# 3. Merge plotting info with evector file
# 3.a GTEx autosomes 
G_A_known_sample_info_merge <- merge(forplotting.refpan, G_A_evec_file,  by.x = "Sample", by.y = "V1")
G_A_UnkownPop_data_WithInfo <- merge(G_A_forplotting.unk, G_A_evec_file, by.x = "Sample", by.y = "V1")
G_A_evec_file_full <- rbind(G_A_known_sample_info_merge, G_A_UnkownPop_data_WithInfo)

# 3.b GTEx X chr 
G_X_known_sample_info_merge <- merge(forplotting.refpan, G_X_evec_file,  by.x = "Sample", by.y = "V1")
G_X_UnkownPop_data_WithInfo <- merge(G_X_forplotting.unk, G_X_evec_file, by.x = "Sample", by.y = "V1")
G_X_evec_file_full <- rbind(G_X_known_sample_info_merge, G_X_UnkownPop_data_WithInfo)

# 3.c TCGA autosomes 
T_A_known_sample_info_merge <- merge(forplotting.refpan, T_A_evec_file,  by.x = "Sample", by.y = "V1")
T_A_UnkownPop_data_WithInfo <- merge(T_A_forplotting.unk, T_A_evec_file, by.x = "Sample", by.y = "V1")
T_A_evec_file_full <- rbind(T_A_known_sample_info_merge, T_A_UnkownPop_data_WithInfo)

# 3.d TCGA X chr 
T_X_known_sample_info_merge <- merge(forplotting.refpan, T_X_evec_file,  by.x = "Sample", by.y = "V1")
T_X_UnkownPop_data_WithInfo <- merge(T_X_forplotting.unk, T_X_evec_file, by.x = "Sample", by.y = "V1")
T_X_evec_file_full <- rbind(T_X_known_sample_info_merge, T_X_UnkownPop_data_WithInfo)


### CALCULATE PERCENT VARIANCE EXPLAINED FOR EACH PC ###
# 1. GTEx autosomes
G_A_eval_file$Perc_Var<- prop.table(G_A_eval_file$V1)*100

# 2. GTEx X
G_X_eval_file$Perc_Var<- prop.table(G_X_eval_file$V1)*100

# 3. TCGA autosomes
T_A_eval_file$Perc_Var<- prop.table(T_A_eval_file$V1)*100

# 4. TCGA X
T_X_eval_file$Perc_Var<- prop.table(T_X_eval_file$V1)*100


## SET UP COLOR KEY ##
## Make master color key ##
# With the known ref info make a master color key
ref.pops <- as.list(levels(known_population_file$V3)) 
ref.cols <- as.list(brewer.pal(n = length(ref.pops), name = "Set1"))
master.col.l<- list() # this will need to be outside the loop
popname.l <- list() # for legend

for (i in 1:length(ref.pops)) {
  popname1SD <- paste(ref.pops[[i]], " (1 sd)", sep = "") # add this to color list
  popname2SD <- paste(ref.pops[[i]], " (2 sd)", sep = "") # add this to color list
  popname3SD <- paste(ref.pops[[i]], " (3 sd)", sep = "") # add this to color list
  popnamemore3SD <- paste("Uncertain (", ref.pops[[i]], ")", sep = "") # add this to color list
  
  color1SD <- adjustcolor(ref.cols[[i]], alpha.f = 1)
  color2SD <- adjustcolor(ref.cols[[i]], alpha.f = .75)
  color3SD <- adjustcolor(ref.cols[[i]], alpha.f = .5)
  colormore3SD <- adjustcolor(ref.cols[[i]], alpha.f = .25)
  
  master.col.l[[popname1SD]] <- color1SD; master.col.l
  master.col.l[[popname2SD]] <- color2SD; master.col.l
  master.col.l[[popname3SD]] <- color3SD; master.col.l
  master.col.l[[popnamemore3SD]] <- colormore3SD; master.col.l
  
  popname.l[[popname1SD]] <- popname1SD; popname.l
  popname.l[[popname2SD]] <- popname2SD; popname.l
  popname.l[[popname3SD]] <- popname3SD; popname.l
  popname.l[[popnamemore3SD]] <- popnamemore3SD; popname.l
  
}

# Add admixed and reference sample colors to the list
master.col.l[["Admixed"]] <- "#333333"; master.col.l # this color will always be the same, so it is hard coded
master.col.l[["Reference Samples"]] <- "#D3D3D3"; master.col.l # this color will always be the same, so it is hard coded

# for lgend 
popname.l[["Admixed"]] <- "Admixed"; popname.l
popname.l[["Reference Samples"]] <- "Reference Samples"; popname.l
popname.convert <- unlist(popname.l, use.names=F) #for legend

# convert list back to character retaining names
master.col.convert <- unlist(master.col.l, use.names=T) # this will be done at the end right before plotting

## Plot ##
pdf("PopInfResultsDetailed.CMYKcolor.NEW.pdf", width = 12, height = 12, colormodel="cmyk")
par(mar=c(4.25,4.25,3,1))

layout(matrix(c(1,2,3,4,5,5), 3, 2, byrow = TRUE), heights = c(1,1,.5))

# 1. GTEx autosomes detailed
plotkey <- master.col.convert[c(levels(G_A_evec_file_full$PlotInfo))]

pc1 <- G_A_eval_file[1,2]
pc1 <- round(pc1, digits = 2)
axis_pc1 <- paste("PC1", " (",pc1,"%)",sep="")
pc2 <- G_A_eval_file[2,2]
pc2 <- round(pc2, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc2 <- paste("PC2"," (",pc2,"%)",sep="")
plot(G_A_evec_file_full$V2,G_A_evec_file_full$V3, xlab = axis_pc1, ylab = axis_pc2,
     col=c(plotkey)[G_A_evec_file_full$PlotInfo], pch =c(19, 15)[G_A_evec_file_full$Sex], asp = 1, 
     cex =2, cex.lab = 1.5, cex.axis=1.5, main = "Autosomes", cex.main = 2)

test_vector <- levels(G_A_known_sample_info_merge$SampleInfo)

for (i in 1:length(test_vector)) {
  circle_function(test_vector[i], G_A_evec_file_full)
}

# 2. GTEx x chromosome detailed
plotkey <- master.col.convert[c(levels(G_X_evec_file_full$PlotInfo))]

pc1 <- G_X_eval_file[1,2]
pc1 <- round(pc1, digits = 2)
axis_pc1 <- paste("PC1", " (",pc1,"%)",sep="")
pc2 <- G_X_eval_file[2,2]
pc2 <- round(pc2, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc2 <- paste("PC2"," (",pc2,"%)",sep="")
plot(G_X_evec_file_full$V2,G_X_evec_file_full$V3, xlab = axis_pc1, ylab = axis_pc2,
     col=c(plotkey)[G_X_evec_file_full$PlotInfo], pch =c(19, 15)[G_X_evec_file_full$Sex], asp = 1, 
     cex =2, cex.lab = 1.5, cex.axis=1.5, main = "X chromosome", cex.main = 2)

test_vector <- levels(G_A_known_sample_info_merge$SampleInfo)

for (i in 1:length(test_vector)) {
  circle_function(test_vector[i], G_X_evec_file_full)
}

# 3. TCGA autosomes detailed
plotkey <- master.col.convert[c(levels(T_A_evec_file_full$PlotInfo))]

pc1 <- T_A_eval_file[1,2]
pc1 <- round(pc1, digits = 2)
axis_pc1 <- paste("PC1", " (",pc1,"%)",sep="")
pc2 <- T_A_eval_file[2,2]
pc2 <- round(pc2, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc2 <- paste("PC2"," (",pc2,"%)",sep="")
plot(T_A_evec_file_full$V2,T_A_evec_file_full$V3, xlab = axis_pc1, ylab = axis_pc2,
     col=c(plotkey)[T_A_evec_file_full$PlotInfo], pch =c(19, 15)[T_A_evec_file_full$Sex], asp = 1, 
     cex =2, cex.lab = 1.5, cex.axis=1.5, main = "Autosomes", cex.main = 2)

test_vector <- levels(T_A_known_sample_info_merge$SampleInfo)

for (i in 1:length(test_vector)) {
  circle_function(test_vector[i], T_A_evec_file_full)
}

# 4. TCGA x chromosome detailed
plotkey <- master.col.convert[c(levels(T_X_evec_file_full$PlotInfo))]

pc1 <- T_X_eval_file[1,2]
pc1 <- round(pc1, digits = 2)
axis_pc1 <- paste("PC1", " (",pc1,"%)",sep="")
pc2 <- T_X_eval_file[2,2]
pc2 <- round(pc2, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc2 <- paste("PC2"," (",pc2,"%)",sep="")

plot(T_X_evec_file_full$V2,T_X_evec_file_full$V3, xlab = axis_pc1, ylab = axis_pc2,
     col=c(plotkey)[T_X_evec_file_full$PlotInfo], pch =c(19, 15)[T_X_evec_file_full$Sex], asp = 1, 
     cex =2, cex.lab = 1.5, cex.axis=1.5, main = "X chromosome", cex.main = 2)

test_vector <- levels(T_X_known_sample_info_merge$SampleInfo)

for (i in 1:length(test_vector)) {
  circle_function(test_vector[i], T_X_evec_file_full)
}

# Make legend
plot(1, type="n", axes=FALSE, xlab="", ylab="")
mtext(side=3, "Key",cex=1.4)
legend('topleft', bty="n", legend = c(popname.convert), fill = c(master.col.convert),
       title = "Inferred Ancestry",
       cex = 1.6, ncol=4)
legend('topright', bty="n", legend = c(levels(G_A_evec_file_full$Sex)),
       cex = 1.6, pch = c(0, 1)[G_A_evec_file_full$Sex], ncol=2,
       title = "Sex")

dev.off()

