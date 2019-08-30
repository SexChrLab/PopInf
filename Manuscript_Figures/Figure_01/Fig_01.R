# PCA Figure for manuscript
# 2019-04-26

### LOAD PACKAGES ###
library("car")
library("plotrix")
library("viridis")


### INPUTS ###
# Evec and eval files #
# 1. GTEx autosomes
G_A_evec_file <- read.table("INPUTS/gtex/merge_all_chr_reference_panel_unknown_set_SNPs_no_missing_plink_LDprune_Fix2.evec", header = FALSE)
G_A_eval_file <- read.table("INPUTS/gtex/merge_all_chr_reference_panel_unknown_set_SNPs_no_missing_plink_LDprune.eval", header = FALSE)

# 2. GTEx X
G_X_evec_file <- read.table("INPUTS/gtex/chrX_reference_panel_unknown_set_SNPs_merge_noPARS_noXTR_noMissing_plink_LDprune_Fix2.evec", header = FALSE)
G_X_eval_file <- read.table("INPUTS/gtex/chrX_reference_panel_unknown_set_SNPs_merge_noPARS_noXTR_noMissing_plink_LDprune.eval", header = FALSE)

# 3. TCGA autosomes
T_A_evec_file <- read.table("INPUTS/tcga/merge_all_chr_reference_panel_unknown_set_SNPs_no_missing_plink_LDprune_Fix2.evec", header = FALSE)
T_A_eval_file <- read.table("INPUTS/tcga/merge_all_chr_reference_panel_unknown_set_SNPs_no_missing_plink_LDprune.eval", header = FALSE)

# 4. TCGA X
T_X_evec_file <- read.table("INPUTS/tcga/chrX_reference_panel_unknown_set_SNPs_merge_noPARS_noXTR_noMissing_plink_LDprune_Fix2.evec", header = FALSE)
T_X_eval_file <- read.table("INPUTS/tcga/chrX_reference_panel_unknown_set_SNPs_merge_noPARS_noXTR_noMissing_plink_LDprune.eval", header = FALSE)

# Sample information files #
# 1. 1000 genomes
known_population_file <- read.table("INPUTS/ThousandGenomesSamples_AdmxRm_new.txt", header = FALSE, sep = "\t")

# 2. GTEx
G_unkownpop_file <- read.table("INPUTS/GTExSamples_forplot.txt", header = FALSE, sep = "\t")

# 3. TCGA
T_unkownpop_file <- read.table("INPUTS/LIHC_primary_data_exome_VCF_samples_short.txt", header = FALSE, sep = "\t")


### SET UP INITIAL DATA FRAMES ###
# 1. GTEx autosomes
G_A_known_sample_info_merge <- merge(known_population_file, G_A_evec_file,  by.x = "V1", by.y = "V1")
G_A_UnkownPop_data_WithInfo <- merge(G_unkownpop_file, G_A_evec_file, by.x = "V1", by.y = "V1")
G_A_evec_file_full <- rbind(G_A_known_sample_info_merge, G_A_UnkownPop_data_WithInfo)

# 2. GTEx X
G_X_known_sample_info_merge <- merge(known_population_file, G_X_evec_file,  by.x = "V1", by.y = "V1")
G_X_UnkownPop_data_WithInfo <- merge(G_unkownpop_file, G_X_evec_file, by.x = "V1", by.y = "V1")
G_X_evec_file_full <- rbind(G_X_known_sample_info_merge, G_X_UnkownPop_data_WithInfo)

# 3. TCGA autosomes
T_A_known_sample_info_merge <- merge(known_population_file, T_A_evec_file,  by.x = "V1", by.y = "V1")
T_A_UnkownPop_data_WithInfo <- merge(T_unkownpop_file, T_A_evec_file, by.x = "V1", by.y = "V1")
T_A_evec_file_full <- rbind(T_A_known_sample_info_merge, T_A_UnkownPop_data_WithInfo)

# 4. TCGA X
T_X_known_sample_info_merge <- merge(known_population_file, T_X_evec_file,  by.x = "V1", by.y = "V1")
T_X_UnkownPop_data_WithInfo <- merge(T_unkownpop_file, T_X_evec_file, by.x = "V1", by.y = "V1")
T_X_evec_file_full <- rbind(T_X_known_sample_info_merge, T_X_UnkownPop_data_WithInfo)


### CALCULATE PERCENT VARIANCE EXPLAINED FOR EACH PC ###
# 1. GTEx autosomes
G_A_eval_file$Perc_Var<- prop.table(G_A_eval_file$V1)*100

# 2. GTEx X
G_X_eval_file$Perc_Var<- prop.table(G_X_eval_file$V1)*100

# 1. TCGA autosomes
T_A_eval_file$Perc_Var<- prop.table(T_A_eval_file$V1)*100

# 2. TCGA X
T_X_eval_file$Perc_Var<- prop.table(T_X_eval_file$V1)*100


### PLOTTING ###
# Save as pdf
pdf("OUTPUT/FIGURE_01.pdf", 8,9)
# Set up colors
n_colors <- 5
plot_colors <- viridis(n_colors)

# Plot all 4 pcas on one page
#par(mfrow=c(2,2))

par(mar=c(4.25,4.25,3,1))

layout(matrix(c(1,2,3,4,5,5), 3, 2, byrow = TRUE), heights = c(1,1,.5))

# 1. GTEx autosomes
pc1 <- G_A_eval_file[1,2]
pc1 <- round(pc1, digits = 2)
axis_pc1 <- paste("PC1", " (",pc1,"%)",sep="")
pc2 <- G_A_eval_file[2,2]
pc2 <- round(pc2, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc2 <- paste("PC2"," (",pc2,"%)",sep="")
plot(G_A_evec_file_full[,4],G_A_evec_file_full[,5], xlab = axis_pc1, ylab = axis_pc2,
     col=c(plot_colors)[G_A_evec_file_full$V3.x], pch =c(20, 15)[G_A_evec_file_full$V2.x], asp = 1, 
     cex =c(1,1,1,1,1.5)[G_A_evec_file_full$V3.x], cex.lab = 1.5, cex.axis=1.5, main = "Autosomes", cex.main = 2)


# 2. GTEx X
pc1 <- G_X_eval_file[1,2]
pc1 <- round(pc1, digits = 2)
axis_pc1 <- paste("PC1", " (",pc1,"%)",sep="")
pc2 <- G_X_eval_file[2,2]
pc2 <- round(pc2, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc2 <- paste("PC2"," (",pc2,"%)",sep="")
plot(G_X_evec_file_full[,4],G_X_evec_file_full[,5], xlab = axis_pc1, ylab = axis_pc2,
     col=c(plot_colors)[G_X_evec_file_full$V3.x], pch =c(20, 15)[G_X_evec_file_full$V2.x], asp = 1, 
     cex =c(1,1,1,1,1.5)[G_X_evec_file_full$V3.x], cex.lab = 1.5, cex.axis=1.5, main = "X chromosome", cex.main = 2)

# 3. TCGA autosomes
pc1 <- T_A_eval_file[1,2]
pc1 <- round(pc1, digits = 2)
axis_pc1 <- paste("PC1", " (",pc1,"%)",sep="")
pc2 <- T_A_eval_file[2,2]
pc2 <- round(pc2, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc2 <- paste("PC2"," (",pc2,"%)",sep="")
plot(T_A_evec_file_full[,4],T_A_evec_file_full[,5], xlab = axis_pc1, ylab = axis_pc2,
     col=c(plot_colors)[T_A_evec_file_full$V3.x], pch =c(20, 15)[T_A_evec_file_full$V2.x], asp = 1, 
     cex =c(1,1,1,1,1.5)[T_A_evec_file_full$V3.x], cex.lab = 1.5, cex.axis=1.5)


# 4. TCGA X
pc1 <- T_X_eval_file[1,2]
pc1 <- round(pc1, digits = 2)
axis_pc1 <- paste("PC1", " (",pc1,"%)",sep="")
pc2 <- T_X_eval_file[2,2]
pc2 <- round(pc2, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc2 <- paste("PC2"," (",pc2,"%)",sep="")
plot(T_X_evec_file_full[,4],T_X_evec_file_full[,5], xlab = axis_pc1, ylab = axis_pc2,
     col=c(plot_colors)[T_X_evec_file_full$V3.x], pch =c(20, 15)[T_X_evec_file_full$V2.x], asp = 1, 
     cex =c(1,1,1,1,1.5)[T_X_evec_file_full$V3.x], cex.lab = 1.5, cex.axis=1.5)


# Generate the legend
plot(1, type="n", axes=FALSE, xlab="", ylab="")
mtext(side=3, "Key",cex=1.4)
legend('topleft', bty="n", legend = c(levels(G_A_evec_file_full$V3.x)), fill = c(plot_colors),
       cex = 1.6, ncol=2)
legend('topright', bty="n", legend = c(levels(G_A_evec_file_full$V2.x)),
       cex = 1.6, pch = c(0, 1)[G_A_evec_file_full$V2.x], ncol=2)


dev.off()

