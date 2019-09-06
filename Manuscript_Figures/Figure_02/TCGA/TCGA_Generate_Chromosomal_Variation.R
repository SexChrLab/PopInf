#!/usr/bin/Rscript

### LOAD PACKAGES ###
library(gplots)

### READ IN DATA ###
all_autosomes <- read.table("autosomes_inferred_pop_report.txt", header = FALSE, sep = "\t", as.is = TRUE)
chrX <- read.table("chrX_inferred_pop_report.txt", header = FALSE, sep = "\t", as.is = TRUE)
chr1 <- read.table("chr1_inferred_pop_report.txt", header = FALSE, sep = "\t", as.is = TRUE)
chr2 <- read.table("chr2_inferred_pop_report.txt", header = FALSE, sep = "\t", as.is = TRUE)
chr3 <- read.table("chr3_inferred_pop_report.txt", header = FALSE, sep = "\t", as.is = TRUE)
chr4 <- read.table("chr4_inferred_pop_report.txt", header = FALSE, sep = "\t", as.is = TRUE)
chr5 <- read.table("chr5_inferred_pop_report.txt", header = FALSE, sep = "\t", as.is = TRUE)
chr6 <- read.table("chr6_inferred_pop_report.txt", header = FALSE, sep = "\t", as.is = TRUE)
chr7 <- read.table("chr7_inferred_pop_report.txt", header = FALSE, sep = "\t", as.is = TRUE)
chr8 <- read.table("chr8_inferred_pop_report.txt", header = FALSE, sep = "\t", as.is = TRUE)
chr9 <- read.table("chr9_inferred_pop_report.txt", header = FALSE, sep = "\t", as.is = TRUE)
chr10 <- read.table("chr10_inferred_pop_report.txt", header = FALSE, sep = "\t", as.is = TRUE)
chr11 <- read.table("chr11_inferred_pop_report.txt", header = FALSE, sep = "\t", as.is = TRUE)
chr12 <- read.table("chr12_inferred_pop_report.txt", header = FALSE, sep = "\t", as.is = TRUE)
chr13 <- read.table("chr13_inferred_pop_report.txt", header = FALSE, sep = "\t", as.is = TRUE)
chr14 <- read.table("chr14_inferred_pop_report.txt", header = FALSE, sep = "\t", as.is = TRUE)
chr15 <- read.table("chr15_inferred_pop_report.txt", header = FALSE, sep = "\t", as.is = TRUE)
chr16 <- read.table("chr16_inferred_pop_report.txt", header = FALSE, sep = "\t", as.is = TRUE)
chr17 <- read.table("chr17_inferred_pop_report.txt", header = FALSE, sep = "\t", as.is = TRUE)
chr18 <- read.table("chr18_inferred_pop_report.txt", header = FALSE, sep = "\t", as.is = TRUE)
chr19 <- read.table("chr19_inferred_pop_report.txt", header = FALSE, sep = "\t", as.is = TRUE)
chr20 <- read.table("chr20_inferred_pop_report.txt", header = FALSE, sep = "\t", as.is = TRUE)
chr21 <- read.table("chr21_inferred_pop_report.txt", header = FALSE, sep = "\t", as.is = TRUE)
chr22 <- read.table("chr22_inferred_pop_report.txt", header = FALSE, sep = "\t", as.is = TRUE)

### GENERATE FILE WITH SAMPLES WITH CHROMOSOMAL VARIATION ###
samples_populations = matrix(nrow=404, ncol=25)
samples_populations[1,1]="Sample"
samples_populations[1,2]="All Autosomes"
samples_populations[1,3]="Chr 1"
samples_populations[1,4]="Chr 2"
samples_populations[1,5]="Chr 3"
samples_populations[1,6]="Chr 4"
samples_populations[1,7]="Chr 5"
samples_populations[1,8]="Chr 6"
samples_populations[1,9]="Chr 7"
samples_populations[1,10]="Chr 8"
samples_populations[1,11]="Chr 9"
samples_populations[1,12]="Chr 10"
samples_populations[1,13]="Chr 11"
samples_populations[1,14]="Chr 12"
samples_populations[1,15]="Chr 13"
samples_populations[1,16]="Chr 14"
samples_populations[1,17]="Chr 15"
samples_populations[1,18]="Chr 16"
samples_populations[1,19]="Chr 17"
samples_populations[1,20]="Chr 18"
samples_populations[1,21]="Chr 19"
samples_populations[1,22]="Chr 20"
samples_populations[1,23]="Chr 21"
samples_populations[1,24]="Chr 22"
samples_populations[1,25]="Chr X"
sample <- 2
while (sample<405)
{
  column=1
  samples_populations[sample,1]=all_autosomes[sample,1]
  samples_populations[sample,2]=all_autosomes[sample,5]
  samples_populations[sample,3]=chr1[sample,5]
  samples_populations[sample,4]=chr2[sample,5]
  samples_populations[sample,5]=chr3[sample,5]
  samples_populations[sample,6]=chr4[sample,5]
  samples_populations[sample,7]=chr5[sample,5]
  samples_populations[sample,8]=chr6[sample,5]
  samples_populations[sample,9]=chr7[sample,5]
  samples_populations[sample,10]=chr8[sample,5]
  samples_populations[sample,11]=chr9[sample,5]
  samples_populations[sample,12]=chr10[sample,5]
  samples_populations[sample,13]=chr11[sample,5]
  samples_populations[sample,14]=chr12[sample,5]
  samples_populations[sample,15]=chr13[sample,5]
  samples_populations[sample,16]=chr14[sample,5]
  samples_populations[sample,17]=chr15[sample,5]
  samples_populations[sample,18]=chr16[sample,5]
  samples_populations[sample,19]=chr17[sample,5]
  samples_populations[sample,20]=chr18[sample,5]
  samples_populations[sample,21]=chr19[sample,5]
  samples_populations[sample,22]=chr20[sample,5]
  samples_populations[sample,23]=chr21[sample,5]
  samples_populations[sample,24]=chr22[sample,5]
  samples_populations[sample,25]=chrX[sample,5]
  sample=sample+1
}

write.csv(samples_populations, "../TCGA_chromosomalVariation.csv")
