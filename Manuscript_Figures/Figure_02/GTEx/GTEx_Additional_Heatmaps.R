#!/usr/bin/Rscript

### LOAD PACKAGES ###
library(gplots)

### GENERATE FILE WITH SAMPLES WITH CHROMOSOMAL VARIATION ###
samples_populations = matrix(nrow=149, ncol=25)
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
while (sample<150)
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

write.csv(samples_populations, "../GTEX_chromosomalVariation.csv")

### READ IN DATA ###
chromosomalVariation <- read.table("../GTEX_chromosomalVariation.csv", header = FALSE, sep = ",", as.is = TRUE)
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

# PICK OUT ONLY SAMPLES WITH VARIATION ACROSS THE CHROMOSOME
include_list <- data.matrix(chromosomalVariation[,1])
all_autosomes_edited <- subset(all_autosomes, all_autosomes[,1] %in% include_list)
chr1_edited <- subset(chr1, chr1[,1] %in% include_list)
chr2_edited <- subset(chr2, chr2[,1] %in% include_list)
chr3_edited <- subset(chr3, chr3[,1] %in% include_list)
chr4_edited <- subset(chr4, chr4[,1] %in% include_list)
chr5_edited <- subset(chr5, chr5[,1] %in% include_list)
chr6_edited <- subset(chr6, chr6[,1] %in% include_list)
chr7_edited <- subset(chr7, chr7[,1] %in% include_list)
chr8_edited <- subset(chr8, chr8[,1] %in% include_list)
chr9_edited <- subset(chr9, chr9[,1] %in% include_list)
chr10_edited <- subset(chr10, chr10[,1] %in% include_list)
chr11_edited <- subset(chr11, chr11[,1] %in% include_list)
chr12_edited <- subset(chr12, chr12[,1] %in% include_list)
chr13_edited <- subset(chr13, chr13[,1] %in% include_list)
chr14_edited <- subset(chr14, chr14[,1] %in% include_list)
chr15_edited <- subset(chr15, chr15[,1] %in% include_list)
chr16_edited <- subset(chr16, chr16[,1] %in% include_list)
chr17_edited <- subset(chr17, chr17[,1] %in% include_list)
chr18_edited <- subset(chr18, chr18[,1] %in% include_list)
chr19_edited <- subset(chr19, chr19[,1] %in% include_list)
chr20_edited <- subset(chr20, chr20[,1] %in% include_list)
chr21_edited <- subset(chr21, chr21[,1] %in% include_list)
chr22_edited <- subset(chr22, chr22[,1] %in% include_list)
chrX_edited <- subset(chrX, chrX[,1] %in% include_list)

### GENERATE THE TABLE TO COUNT VALUES FOR THE POPULATIONS WITH SHADING FOR CONFIDENCE ###
counting_values_chromosomalVariation = matrix(nrow=240, ncol=16)

# ALL AUTOSOMES
sample <- 2
while (sample<18)
{
  countingValuesRow <- 1
  countingValuesColumn <- sample-1
  
  africaCount <- 0
  europeAfricaCount <- 20
  eastAsiaCount <- 40
  europeCount <- 60
  europeSouthAsiaCount <- 80
  southAsiaCount <- 100
  AfricaSouthAsiaCount <- 120
  EastAsiaSouthAsiaCount <- 140
  europeEastAsiaCount <- 160
  AfricaEastAsiaCount <- 180
  fileColumn <- 2
  while (fileColumn<6)
  {
    if (all_autosomes_edited[sample, fileColumn] == " Europe" || all_autosomes_edited[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (all_autosomes_edited[sample, fileColumn] == " Africa" || all_autosomes_edited[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (all_autosomes_edited[sample, fileColumn] == " East_Asia" || all_autosomes_edited[sample, fileColumn] == "East_Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (all_autosomes_edited[sample, fileColumn] == " South_Asia" || all_autosomes_edited[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (all_autosomes_edited[sample, fileColumn] == " Africa-Europe" || all_autosomes_edited[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (all_autosomes_edited[sample, fileColumn] == " East_Asia-Europe" || all_autosomes_edited[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (all_autosomes_edited[sample, fileColumn] == "Europe-South_Asia" || all_autosomes_edited[sample, fileColumn] == "Europe South_Asia" || all_autosomes_edited[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (all_autosomes_edited[sample, fileColumn] == " Africa-East_Asia" || all_autosomes_edited[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (all_autosomes_edited[sample, fileColumn] == " Africa-South_Asia" || all_autosomes_edited[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (all_autosomes_edited[sample, fileColumn] == " East_Asia-South_Asia" || all_autosomes_edited[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_chromosomalVariation[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_chromosomalVariation[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_chromosomalVariation[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_chromosomalVariation[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 1
sample <- 2
while (sample<18)
{
  countingValuesRow <- 11
  countingValuesColumn <- sample-1
  
  africaCount <- 0
  europeAfricaCount <- 20
  eastAsiaCount <- 40
  europeCount <- 60
  europeSouthAsiaCount <- 80
  southAsiaCount <- 100
  AfricaSouthAsiaCount <- 120
  EastAsiaSouthAsiaCount <- 140
  europeEastAsiaCount <- 160
  AfricaEastAsiaCount <- 180
  fileColumn <- 2
  while (fileColumn<6)
  {
    if (chr1_edited[sample, fileColumn] == " Europe" || chr1_edited[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr1_edited[sample, fileColumn] == " Africa" || chr1_edited[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr1_edited[sample, fileColumn] == " East_Asia" || chr1_edited[sample, fileColumn] == "East_Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr1_edited[sample, fileColumn] == " South_Asia" || chr1_edited[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr1_edited[sample, fileColumn] == " Africa-Europe" || chr1_edited[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr1_edited[sample, fileColumn] == " East_Asia-Europe" || chr1_edited[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr1_edited[sample, fileColumn] == "Europe-South_Asia" || chr1_edited[sample, fileColumn] == "Europe South_Asia" || chr1_edited[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr1_edited[sample, fileColumn] == " Africa-East_Asia" || chr1_edited[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr1_edited[sample, fileColumn] == " Africa-South_Asia" || chr1_edited[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr1_edited[sample, fileColumn] == " East_Asia-South_Asia" || chr1_edited[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_chromosomalVariation[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_chromosomalVariation[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_chromosomalVariation[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_chromosomalVariation[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 2
sample <- 2
while (sample<18)
{
  countingValuesRow <- 21
  countingValuesColumn <- sample-1
  
  africaCount <- 0
  europeAfricaCount <- 20
  eastAsiaCount <- 40
  europeCount <- 60
  europeSouthAsiaCount <- 80
  southAsiaCount <- 100
  AfricaSouthAsiaCount <- 120
  EastAsiaSouthAsiaCount <- 140
  europeEastAsiaCount <- 160
  AfricaEastAsiaCount <- 180
  fileColumn <- 2
  while (fileColumn<6)
  {
    if (chr2_edited[sample, fileColumn] == " Europe" || chr2_edited[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr2_edited[sample, fileColumn] == " Africa" || chr2_edited[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr2_edited[sample, fileColumn] == " East_Asia" || chr2_edited[sample, fileColumn] == "East_Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr2_edited[sample, fileColumn] == " South_Asia" || chr2_edited[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr2_edited[sample, fileColumn] == " Africa-Europe" || chr2_edited[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr2_edited[sample, fileColumn] == " East_Asia-Europe" || chr2_edited[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr2_edited[sample, fileColumn] == "Europe-South_Asia" || chr2_edited[sample, fileColumn] == "Europe South_Asia" || chr2_edited[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr2_edited[sample, fileColumn] == " Africa-East_Asia" || chr2_edited[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr2_edited[sample, fileColumn] == " Africa-South_Asia" || chr2_edited[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr2_edited[sample, fileColumn] == " East_Asia-South_Asia" || chr2_edited[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_chromosomalVariation[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_chromosomalVariation[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_chromosomalVariation[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_chromosomalVariation[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 3
sample <- 2
while (sample<18)
{
  countingValuesRow <- 31
  countingValuesColumn <- sample-1
  
  africaCount <- 0
  europeAfricaCount <- 20
  eastAsiaCount <- 40
  europeCount <- 60
  europeSouthAsiaCount <- 80
  southAsiaCount <- 100
  AfricaSouthAsiaCount <- 120
  EastAsiaSouthAsiaCount <- 140
  europeEastAsiaCount <- 160
  AfricaEastAsiaCount <- 180
  fileColumn <- 2
  while (fileColumn<6)
  {
    if (chr3_edited[sample, fileColumn] == " Europe" || chr3_edited[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr3_edited[sample, fileColumn] == " Africa" || chr3_edited[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr3_edited[sample, fileColumn] == " East_Asia" || chr3_edited[sample, fileColumn] == "East_Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr3_edited[sample, fileColumn] == " South_Asia" || chr3_edited[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr3_edited[sample, fileColumn] == " Africa-Europe" || chr3_edited[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr3_edited[sample, fileColumn] == " East_Asia-Europe" || chr3_edited[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr3_edited[sample, fileColumn] == "Europe-South_Asia" || chr3_edited[sample, fileColumn] == "Europe South_Asia" || chr3_edited[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr3_edited[sample, fileColumn] == " Africa-East_Asia" || chr3_edited[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr3_edited[sample, fileColumn] == " Africa-South_Asia" || chr3_edited[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr3_edited[sample, fileColumn] == " East_Asia-South_Asia" || chr3_edited[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_chromosomalVariation[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_chromosomalVariation[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_chromosomalVariation[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_chromosomalVariation[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 4
sample <- 2
while (sample<18)
{
  countingValuesRow <- 41
  countingValuesColumn <- sample-1
  
  africaCount <- 0
  europeAfricaCount <- 20
  eastAsiaCount <- 40
  europeCount <- 60
  europeSouthAsiaCount <- 80
  southAsiaCount <- 100
  AfricaSouthAsiaCount <- 120
  EastAsiaSouthAsiaCount <- 140
  europeEastAsiaCount <- 160
  AfricaEastAsiaCount <- 180
  fileColumn <- 2
  while (fileColumn<6)
  {
    if (chr4_edited[sample, fileColumn] == " Europe" || chr4_edited[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr4_edited[sample, fileColumn] == " Africa" || chr4_edited[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr4_edited[sample, fileColumn] == " East_Asia" || chr4_edited[sample, fileColumn] == "East_Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr4_edited[sample, fileColumn] == " South_Asia" || chr4_edited[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr4_edited[sample, fileColumn] == " Africa-Europe" || chr4_edited[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr4_edited[sample, fileColumn] == " East_Asia-Europe" || chr4_edited[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr4_edited[sample, fileColumn] == "Europe-South_Asia" || chr4_edited[sample, fileColumn] == "Europe South_Asia" || chr4_edited[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr4_edited[sample, fileColumn] == " Africa-East_Asia" || chr4_edited[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr4_edited[sample, fileColumn] == " Africa-South_Asia" || chr4_edited[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr4_edited[sample, fileColumn] == " East_Asia-South_Asia" || chr4_edited[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_chromosomalVariation[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_chromosomalVariation[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_chromosomalVariation[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_chromosomalVariation[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 5
sample <- 2
while (sample<18)
{
  countingValuesRow <- 51
  countingValuesColumn <- sample-1
  
  africaCount <- 0
  europeAfricaCount <- 20
  eastAsiaCount <- 40
  europeCount <- 60
  europeSouthAsiaCount <- 80
  southAsiaCount <- 100
  AfricaSouthAsiaCount <- 120
  EastAsiaSouthAsiaCount <- 140
  europeEastAsiaCount <- 160
  AfricaEastAsiaCount <- 180
  fileColumn <- 2
  while (fileColumn<6)
  {
    if (chr5_edited[sample, fileColumn] == " Europe" || chr5_edited[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr5_edited[sample, fileColumn] == " Africa" || chr5_edited[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr5_edited[sample, fileColumn] == " East_Asia" || chr5_edited[sample, fileColumn] == "East_Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr5_edited[sample, fileColumn] == " South_Asia" || chr5_edited[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr5_edited[sample, fileColumn] == " Africa-Europe" || chr5_edited[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr5_edited[sample, fileColumn] == " East_Asia-Europe" || chr5_edited[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr5_edited[sample, fileColumn] == "Europe-South_Asia" || chr5_edited[sample, fileColumn] == "Europe South_Asia" || chr5_edited[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr5_edited[sample, fileColumn] == " Africa-East_Asia" || chr5_edited[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr5_edited[sample, fileColumn] == " Africa-South_Asia" || chr5_edited[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr5_edited[sample, fileColumn] == " East_Asia-South_Asia" || chr5_edited[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_chromosomalVariation[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_chromosomalVariation[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_chromosomalVariation[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_chromosomalVariation[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 6
sample <- 2
while (sample<18)
{
  countingValuesRow <- 61
  countingValuesColumn <- sample-1
  
  africaCount <- 0
  europeAfricaCount <- 20
  eastAsiaCount <- 40
  europeCount <- 60
  europeSouthAsiaCount <- 80
  southAsiaCount <- 100
  AfricaSouthAsiaCount <- 120
  EastAsiaSouthAsiaCount <- 140
  europeEastAsiaCount <- 160
  AfricaEastAsiaCount <- 180
  fileColumn <- 2
  while (fileColumn<6)
  {
    if (chr6_edited[sample, fileColumn] == " Europe" || chr6_edited[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr6_edited[sample, fileColumn] == " Africa" || chr6_edited[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr6_edited[sample, fileColumn] == " East_Asia" || chr6_edited[sample, fileColumn] == "East_Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr6_edited[sample, fileColumn] == " South_Asia" || chr6_edited[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr6_edited[sample, fileColumn] == " Africa-Europe" || chr6_edited[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr6_edited[sample, fileColumn] == " East_Asia-Europe" || chr6_edited[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr6_edited[sample, fileColumn] == "Europe-South_Asia" || chr6_edited[sample, fileColumn] == "Europe South_Asia" || chr6_edited[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr6_edited[sample, fileColumn] == " Africa-East_Asia" || chr6_edited[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr6_edited[sample, fileColumn] == " Africa-South_Asia" || chr6_edited[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr6_edited[sample, fileColumn] == " East_Asia-South_Asia" || chr6_edited[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_chromosomalVariation[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_chromosomalVariation[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_chromosomalVariation[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_chromosomalVariation[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 7
sample <- 2
while (sample<18)
{
  countingValuesRow <- 71
  countingValuesColumn <- sample-1
  
  africaCount <- 0
  europeAfricaCount <- 20
  eastAsiaCount <- 40
  europeCount <- 60
  europeSouthAsiaCount <- 80
  southAsiaCount <- 100
  AfricaSouthAsiaCount <- 120
  EastAsiaSouthAsiaCount <- 140
  europeEastAsiaCount <- 160
  AfricaEastAsiaCount <- 180
  fileColumn <- 2
  while (fileColumn<6)
  {
    if (chr7_edited[sample, fileColumn] == " Europe" || chr7_edited[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr7_edited[sample, fileColumn] == " Africa" || chr7_edited[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr7_edited[sample, fileColumn] == " East_Asia" || chr7_edited[sample, fileColumn] == "East_Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr7_edited[sample, fileColumn] == " South_Asia" || chr7_edited[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr7_edited[sample, fileColumn] == " Africa-Europe" || chr7_edited[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr7_edited[sample, fileColumn] == " East_Asia-Europe" || chr7_edited[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr7_edited[sample, fileColumn] == "Europe-South_Asia" || chr7_edited[sample, fileColumn] == "Europe South_Asia" || chr7_edited[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr7_edited[sample, fileColumn] == " Africa-East_Asia" || chr7_edited[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr7_edited[sample, fileColumn] == " Africa-South_Asia" || chr7_edited[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr7_edited[sample, fileColumn] == " East_Asia-South_Asia" || chr7_edited[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_chromosomalVariation[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_chromosomalVariation[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_chromosomalVariation[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_chromosomalVariation[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 8
sample <- 2
while (sample<18)
{
  countingValuesRow <- 81
  countingValuesColumn <- sample-1
  
  africaCount <- 0
  europeAfricaCount <- 20
  eastAsiaCount <- 40
  europeCount <- 60
  europeSouthAsiaCount <- 80
  southAsiaCount <- 100
  AfricaSouthAsiaCount <- 120
  EastAsiaSouthAsiaCount <- 140
  europeEastAsiaCount <- 160
  AfricaEastAsiaCount <- 180
  fileColumn <- 2
  while (fileColumn<6)
  {
    if (chr8_edited[sample, fileColumn] == " Europe" || chr8_edited[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr8_edited[sample, fileColumn] == " Africa" || chr8_edited[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr8_edited[sample, fileColumn] == " East_Asia" || chr8_edited[sample, fileColumn] == "East_Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr8_edited[sample, fileColumn] == " South_Asia" || chr8_edited[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr8_edited[sample, fileColumn] == " Africa-Europe" || chr8_edited[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr8_edited[sample, fileColumn] == " East_Asia-Europe" || chr8_edited[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr8_edited[sample, fileColumn] == "Europe-South_Asia" || chr8_edited[sample, fileColumn] == "Europe South_Asia" || chr8_edited[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr8_edited[sample, fileColumn] == " Africa-East_Asia" || chr8_edited[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr8_edited[sample, fileColumn] == " Africa-South_Asia" || chr8_edited[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr8_edited[sample, fileColumn] == " East_Asia-South_Asia" || chr8_edited[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_chromosomalVariation[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_chromosomalVariation[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_chromosomalVariation[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_chromosomalVariation[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 9
sample <- 2
while (sample<18)
{
  countingValuesRow <- 91
  countingValuesColumn <- sample-1
  
  africaCount <- 0
  europeAfricaCount <- 20
  eastAsiaCount <- 40
  europeCount <- 60
  europeSouthAsiaCount <- 80
  southAsiaCount <- 100
  AfricaSouthAsiaCount <- 120
  EastAsiaSouthAsiaCount <- 140
  europeEastAsiaCount <- 160
  AfricaEastAsiaCount <- 180
  fileColumn <- 2
  while (fileColumn<6)
  {
    if (chr9_edited[sample, fileColumn] == " Europe" || chr9_edited[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr9_edited[sample, fileColumn] == " Africa" || chr9_edited[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr9_edited[sample, fileColumn] == " East_Asia" || chr9_edited[sample, fileColumn] == "East_Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr9_edited[sample, fileColumn] == " South_Asia" || chr9_edited[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr9_edited[sample, fileColumn] == " Africa-Europe" || chr9_edited[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr9_edited[sample, fileColumn] == " East_Asia-Europe" || chr9_edited[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr9_edited[sample, fileColumn] == "Europe-South_Asia" || chr9_edited[sample, fileColumn] == "Europe South_Asia" || chr9_edited[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr9_edited[sample, fileColumn] == " Africa-East_Asia" || chr9_edited[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr9_edited[sample, fileColumn] == " Africa-South_Asia" || chr9_edited[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr9_edited[sample, fileColumn] == " East_Asia-South_Asia" || chr9_edited[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_chromosomalVariation[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_chromosomalVariation[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_chromosomalVariation[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_chromosomalVariation[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 10
sample <- 2
while (sample<18)
{
  countingValuesRow <- 101
  countingValuesColumn <- sample-1
  
  africaCount <- 0
  europeAfricaCount <- 20
  eastAsiaCount <- 40
  europeCount <- 60
  europeSouthAsiaCount <- 80
  southAsiaCount <- 100
  AfricaSouthAsiaCount <- 120
  EastAsiaSouthAsiaCount <- 140
  europeEastAsiaCount <- 160
  AfricaEastAsiaCount <- 180
  fileColumn <- 2
  while (fileColumn<6)
  {
    if (chr10_edited[sample, fileColumn] == " Europe" || chr10_edited[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr10_edited[sample, fileColumn] == " Africa" || chr10_edited[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr10_edited[sample, fileColumn] == " East_Asia" || chr10_edited[sample, fileColumn] == "East_Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr10_edited[sample, fileColumn] == " South_Asia" || chr10_edited[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr10_edited[sample, fileColumn] == " Africa-Europe" || chr10_edited[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr10_edited[sample, fileColumn] == " East_Asia-Europe" || chr10_edited[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr10_edited[sample, fileColumn] == "Europe-South_Asia" || chr10_edited[sample, fileColumn] == "Europe South_Asia" || chr10_edited[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr10_edited[sample, fileColumn] == " Africa-East_Asia" || chr10_edited[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr10_edited[sample, fileColumn] == " Africa-South_Asia" || chr10_edited[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr10_edited[sample, fileColumn] == " East_Asia-South_Asia" || chr10_edited[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_chromosomalVariation[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_chromosomalVariation[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_chromosomalVariation[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_chromosomalVariation[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 11
sample <- 2
while (sample<18)
{
  countingValuesRow <- 111
  countingValuesColumn <- sample-1
  
  africaCount <- 0
  europeAfricaCount <- 20
  eastAsiaCount <- 40
  europeCount <- 60
  europeSouthAsiaCount <- 80
  southAsiaCount <- 100
  AfricaSouthAsiaCount <- 120
  EastAsiaSouthAsiaCount <- 140
  europeEastAsiaCount <- 160
  AfricaEastAsiaCount <- 180
  fileColumn <- 2
  while (fileColumn<6)
  {
    if (chr11_edited[sample, fileColumn] == " Europe" || chr11_edited[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr11_edited[sample, fileColumn] == " Africa" || chr11_edited[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr11_edited[sample, fileColumn] == " East_Asia" || chr11_edited[sample, fileColumn] == "East_Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr11_edited[sample, fileColumn] == " South_Asia" || chr11_edited[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr11_edited[sample, fileColumn] == " Africa-Europe" || chr11_edited[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr11_edited[sample, fileColumn] == " East_Asia-Europe" || chr11_edited[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr11_edited[sample, fileColumn] == "Europe-South_Asia" || chr11_edited[sample, fileColumn] == "Europe South_Asia" || chr11_edited[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr11_edited[sample, fileColumn] == " Africa-East_Asia" || chr11_edited[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr11_edited[sample, fileColumn] == " Africa-South_Asia" || chr11_edited[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr11_edited[sample, fileColumn] == " East_Asia-South_Asia" || chr11_edited[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_chromosomalVariation[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_chromosomalVariation[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_chromosomalVariation[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_chromosomalVariation[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 12
sample <- 2
while (sample<18)
{
  countingValuesRow <- 121
  countingValuesColumn <- sample-1
  
  africaCount <- 0
  europeAfricaCount <- 20
  eastAsiaCount <- 40
  europeCount <- 60
  europeSouthAsiaCount <- 80
  southAsiaCount <- 100
  AfricaSouthAsiaCount <- 120
  EastAsiaSouthAsiaCount <- 140
  europeEastAsiaCount <- 160
  AfricaEastAsiaCount <- 180
  fileColumn <- 2
  while (fileColumn<6)
  {
    if (chr12_edited[sample, fileColumn] == " Europe" || chr12_edited[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr12_edited[sample, fileColumn] == " Africa" || chr12_edited[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr12_edited[sample, fileColumn] == " East_Asia" || chr12_edited[sample, fileColumn] == "East_Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr12_edited[sample, fileColumn] == " South_Asia" || chr12_edited[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr12_edited[sample, fileColumn] == " Africa-Europe" || chr12_edited[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr12_edited[sample, fileColumn] == " East_Asia-Europe" || chr12_edited[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr12_edited[sample, fileColumn] == "Europe-South_Asia" || chr12_edited[sample, fileColumn] == "Europe South_Asia" || chr12_edited[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr12_edited[sample, fileColumn] == " Africa-East_Asia" || chr12_edited[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr12_edited[sample, fileColumn] == " Africa-South_Asia" || chr12_edited[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr12_edited[sample, fileColumn] == " East_Asia-South_Asia" || chr12_edited[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_chromosomalVariation[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_chromosomalVariation[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_chromosomalVariation[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_chromosomalVariation[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 13
sample <- 2
while (sample<18)
{
  countingValuesRow <- 131
  countingValuesColumn <- sample-1
  
  africaCount <- 0
  europeAfricaCount <- 20
  eastAsiaCount <- 40
  europeCount <- 60
  europeSouthAsiaCount <- 80
  southAsiaCount <- 100
  AfricaSouthAsiaCount <- 120
  EastAsiaSouthAsiaCount <- 140
  europeEastAsiaCount <- 160
  AfricaEastAsiaCount <- 180
  fileColumn <- 2
  while (fileColumn<6)
  {
    if (chr13_edited[sample, fileColumn] == " Europe" || chr13_edited[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr13_edited[sample, fileColumn] == " Africa" || chr13_edited[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr13_edited[sample, fileColumn] == " East_Asia" || chr13_edited[sample, fileColumn] == "East_Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr13_edited[sample, fileColumn] == " South_Asia" || chr13_edited[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr13_edited[sample, fileColumn] == " Africa-Europe" || chr13_edited[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr13_edited[sample, fileColumn] == " East_Asia-Europe" || chr13_edited[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr13_edited[sample, fileColumn] == "Europe-South_Asia" || chr13_edited[sample, fileColumn] == "Europe South_Asia" || chr13_edited[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr13_edited[sample, fileColumn] == " Africa-East_Asia" || chr13_edited[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr13_edited[sample, fileColumn] == " Africa-South_Asia" || chr13_edited[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr13_edited[sample, fileColumn] == " East_Asia-South_Asia" || chr13_edited[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_chromosomalVariation[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_chromosomalVariation[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_chromosomalVariation[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_chromosomalVariation[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 14
sample <- 2
while (sample<18)
{
  countingValuesRow <- 141
  countingValuesColumn <- sample-1
  
  africaCount <- 0
  europeAfricaCount <- 20
  eastAsiaCount <- 40
  europeCount <- 60
  europeSouthAsiaCount <- 80
  southAsiaCount <- 100
  AfricaSouthAsiaCount <- 120
  EastAsiaSouthAsiaCount <- 140
  europeEastAsiaCount <- 160
  AfricaEastAsiaCount <- 180
  fileColumn <- 2
  while (fileColumn<6)
  {
    if (chr14_edited[sample, fileColumn] == " Europe" || chr14_edited[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr14_edited[sample, fileColumn] == " Africa" || chr14_edited[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr14_edited[sample, fileColumn] == " East_Asia" || chr14_edited[sample, fileColumn] == "East_Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr14_edited[sample, fileColumn] == " South_Asia" || chr14_edited[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr14_edited[sample, fileColumn] == " Africa-Europe" || chr14_edited[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr14_edited[sample, fileColumn] == " East_Asia-Europe" || chr14_edited[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr14_edited[sample, fileColumn] == "Europe-South_Asia" || chr14_edited[sample, fileColumn] == "Europe South_Asia" || chr14_edited[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr14_edited[sample, fileColumn] == " Africa-East_Asia" || chr14_edited[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr14_edited[sample, fileColumn] == " Africa-South_Asia" || chr14_edited[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr14_edited[sample, fileColumn] == " East_Asia-South_Asia" || chr14_edited[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_chromosomalVariation[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_chromosomalVariation[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_chromosomalVariation[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_chromosomalVariation[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 15
sample <- 2
while (sample<18)
{
  countingValuesRow <- 151
  countingValuesColumn <- sample-1
  
  africaCount <- 0
  europeAfricaCount <- 20
  eastAsiaCount <- 40
  europeCount <- 60
  europeSouthAsiaCount <- 80
  southAsiaCount <- 100
  AfricaSouthAsiaCount <- 120
  EastAsiaSouthAsiaCount <- 140
  europeEastAsiaCount <- 160
  AfricaEastAsiaCount <- 180
  fileColumn <- 2
  while (fileColumn<6)
  {
    if (chr15_edited[sample, fileColumn] == " Europe" || chr15_edited[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr15_edited[sample, fileColumn] == " Africa" || chr15_edited[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr15_edited[sample, fileColumn] == " East_Asia" || chr15_edited[sample, fileColumn] == "East_Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr15_edited[sample, fileColumn] == " South_Asia" || chr15_edited[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr15_edited[sample, fileColumn] == " Africa-Europe" || chr15_edited[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr15_edited[sample, fileColumn] == " East_Asia-Europe" || chr15_edited[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr15_edited[sample, fileColumn] == "Europe-South_Asia" || chr15_edited[sample, fileColumn] == "Europe South_Asia" || chr15_edited[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr15_edited[sample, fileColumn] == " Africa-East_Asia" || chr15_edited[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr15_edited[sample, fileColumn] == " Africa-South_Asia" || chr15_edited[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr15_edited[sample, fileColumn] == " East_Asia-South_Asia" || chr15_edited[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_chromosomalVariation[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_chromosomalVariation[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_chromosomalVariation[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_chromosomalVariation[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 16
sample <- 2
while (sample<18)
{
  countingValuesRow <- 161
  countingValuesColumn <- sample-1
  
  africaCount <- 0
  europeAfricaCount <- 20
  eastAsiaCount <- 40
  europeCount <- 60
  europeSouthAsiaCount <- 80
  southAsiaCount <- 100
  AfricaSouthAsiaCount <- 120
  EastAsiaSouthAsiaCount <- 140
  europeEastAsiaCount <- 160
  AfricaEastAsiaCount <- 180
  fileColumn <- 2
  while (fileColumn<6)
  {
    if (chr16_edited[sample, fileColumn] == " Europe" || chr16_edited[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr16_edited[sample, fileColumn] == " Africa" || chr16_edited[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr16_edited[sample, fileColumn] == " East_Asia" || chr16_edited[sample, fileColumn] == "East_Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr16_edited[sample, fileColumn] == " South_Asia" || chr16_edited[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr16_edited[sample, fileColumn] == " Africa-Europe" || chr16_edited[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr16_edited[sample, fileColumn] == " East_Asia-Europe" || chr16_edited[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr16_edited[sample, fileColumn] == "Europe-South_Asia" || chr16_edited[sample, fileColumn] == "Europe South_Asia" || chr16_edited[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr16_edited[sample, fileColumn] == " Africa-East_Asia" || chr16_edited[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr16_edited[sample, fileColumn] == " Africa-South_Asia" || chr16_edited[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr16_edited[sample, fileColumn] == " East_Asia-South_Asia" || chr16_edited[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_chromosomalVariation[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_chromosomalVariation[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_chromosomalVariation[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_chromosomalVariation[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 17
sample <- 2
while (sample<18)
{
  countingValuesRow <- 171
  countingValuesColumn <- sample-1
  
  africaCount <- 0
  europeAfricaCount <- 20
  eastAsiaCount <- 40
  europeCount <- 60
  europeSouthAsiaCount <- 80
  southAsiaCount <- 100
  AfricaSouthAsiaCount <- 120
  EastAsiaSouthAsiaCount <- 140
  europeEastAsiaCount <- 160
  AfricaEastAsiaCount <- 180
  fileColumn <- 2
  while (fileColumn<6)
  {
    if (chr17_edited[sample, fileColumn] == " Europe" || chr17_edited[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr17_edited[sample, fileColumn] == " Africa" || chr17_edited[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr17_edited[sample, fileColumn] == " East_Asia" || chr17_edited[sample, fileColumn] == "East_Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr17_edited[sample, fileColumn] == " South_Asia" || chr17_edited[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr17_edited[sample, fileColumn] == " Africa-Europe" || chr17_edited[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr17_edited[sample, fileColumn] == " East_Asia-Europe" || chr17_edited[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr17_edited[sample, fileColumn] == "Europe-South_Asia" || chr17_edited[sample, fileColumn] == "Europe South_Asia" || chr17_edited[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr17_edited[sample, fileColumn] == " Africa-East_Asia" || chr17_edited[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr17_edited[sample, fileColumn] == " Africa-South_Asia" || chr17_edited[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr17_edited[sample, fileColumn] == " East_Asia-South_Asia" || chr17_edited[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_chromosomalVariation[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_chromosomalVariation[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_chromosomalVariation[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_chromosomalVariation[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 18
sample <- 2
while (sample<18)
{
  countingValuesRow <- 181
  countingValuesColumn <- sample-1
  
  africaCount <- 0
  europeAfricaCount <- 20
  eastAsiaCount <- 40
  europeCount <- 60
  europeSouthAsiaCount <- 80
  southAsiaCount <- 100
  AfricaSouthAsiaCount <- 120
  EastAsiaSouthAsiaCount <- 140
  europeEastAsiaCount <- 160
  AfricaEastAsiaCount <- 180
  fileColumn <- 2
  while (fileColumn<6)
  {
    if (chr18_edited[sample, fileColumn] == " Europe" || chr18_edited[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr18_edited[sample, fileColumn] == " Africa" || chr18_edited[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr18_edited[sample, fileColumn] == " East_Asia" || chr18_edited[sample, fileColumn] == "East_Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr18_edited[sample, fileColumn] == " South_Asia" || chr18_edited[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr18_edited[sample, fileColumn] == " Africa-Europe" || chr18_edited[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr18_edited[sample, fileColumn] == " East_Asia-Europe" || chr18_edited[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr18_edited[sample, fileColumn] == "Europe-South_Asia" || chr18_edited[sample, fileColumn] == "Europe South_Asia" || chr18_edited[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr18_edited[sample, fileColumn] == " Africa-East_Asia" || chr18_edited[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr18_edited[sample, fileColumn] == " Africa-South_Asia" || chr18_edited[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr18_edited[sample, fileColumn] == " East_Asia-South_Asia" || chr18_edited[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_chromosomalVariation[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_chromosomalVariation[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_chromosomalVariation[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_chromosomalVariation[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 19
sample <- 2
while (sample<18)
{
  countingValuesRow <- 191
  countingValuesColumn <- sample-1
  
  africaCount <- 0
  europeAfricaCount <- 20
  eastAsiaCount <- 40
  europeCount <- 60
  europeSouthAsiaCount <- 80
  southAsiaCount <- 100
  AfricaSouthAsiaCount <- 120
  EastAsiaSouthAsiaCount <- 140
  europeEastAsiaCount <- 160
  AfricaEastAsiaCount <- 180
  fileColumn <- 2
  while (fileColumn<6)
  {
    if (chr19_edited[sample, fileColumn] == " Europe" || chr19_edited[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr19_edited[sample, fileColumn] == " Africa" || chr19_edited[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr19_edited[sample, fileColumn] == " East_Asia" || chr19_edited[sample, fileColumn] == "East_Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr19_edited[sample, fileColumn] == " South_Asia" || chr19_edited[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr19_edited[sample, fileColumn] == " Africa-Europe" || chr19_edited[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr19_edited[sample, fileColumn] == " East_Asia-Europe" || chr19_edited[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr19_edited[sample, fileColumn] == "Europe-South_Asia" || chr19_edited[sample, fileColumn] == "Europe South_Asia" || chr19_edited[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr19_edited[sample, fileColumn] == " Africa-East_Asia" || chr19_edited[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr19_edited[sample, fileColumn] == " Africa-South_Asia" || chr19_edited[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr19_edited[sample, fileColumn] == " East_Asia-South_Asia" || chr19_edited[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_chromosomalVariation[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_chromosomalVariation[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_chromosomalVariation[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_chromosomalVariation[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 20
sample <- 2
while (sample<18)
{
  countingValuesRow <- 201
  countingValuesColumn <- sample-1
  
  africaCount <- 0
  europeAfricaCount <- 20
  eastAsiaCount <- 40
  europeCount <- 60
  europeSouthAsiaCount <- 80
  southAsiaCount <- 100
  AfricaSouthAsiaCount <- 120
  EastAsiaSouthAsiaCount <- 140
  europeEastAsiaCount <- 160
  AfricaEastAsiaCount <- 180
  fileColumn <- 2
  while (fileColumn<6)
  {
    if (chr20_edited[sample, fileColumn] == " Europe" || chr20_edited[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr20_edited[sample, fileColumn] == " Africa" || chr20_edited[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr20_edited[sample, fileColumn] == " East_Asia" || chr20_edited[sample, fileColumn] == "East_Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr20_edited[sample, fileColumn] == " South_Asia" || chr20_edited[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr20_edited[sample, fileColumn] == " Africa-Europe" || chr20_edited[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr20_edited[sample, fileColumn] == " East_Asia-Europe" || chr20_edited[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr20_edited[sample, fileColumn] == "Europe-South_Asia" || chr20_edited[sample, fileColumn] == "Europe South_Asia" || chr20_edited[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr20_edited[sample, fileColumn] == " Africa-East_Asia" || chr20_edited[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr20_edited[sample, fileColumn] == " Africa-South_Asia" || chr20_edited[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr20_edited[sample, fileColumn] == " East_Asia-South_Asia" || chr20_edited[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_chromosomalVariation[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_chromosomalVariation[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_chromosomalVariation[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_chromosomalVariation[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 21
sample <- 2
while (sample<18)
{
  countingValuesRow <- 211
  countingValuesColumn <- sample-1
  
  africaCount <- 0
  europeAfricaCount <- 20
  eastAsiaCount <- 40
  europeCount <- 60
  europeSouthAsiaCount <- 80
  southAsiaCount <- 100
  AfricaSouthAsiaCount <- 120
  EastAsiaSouthAsiaCount <- 140
  europeEastAsiaCount <- 160
  AfricaEastAsiaCount <- 180
  fileColumn <- 2
  while (fileColumn<6)
  {
    if (chr21_edited[sample, fileColumn] == " Europe" || chr21_edited[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr21_edited[sample, fileColumn] == " Africa" || chr21_edited[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr21_edited[sample, fileColumn] == " East_Asia" || chr21_edited[sample, fileColumn] == "East_Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr21_edited[sample, fileColumn] == " South_Asia" || chr21_edited[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr21_edited[sample, fileColumn] == " Africa-Europe" || chr21_edited[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr21_edited[sample, fileColumn] == " East_Asia-Europe" || chr21_edited[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr21_edited[sample, fileColumn] == "Europe-South_Asia" || chr21_edited[sample, fileColumn] == "Europe South_Asia" || chr21_edited[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr21_edited[sample, fileColumn] == " Africa-East_Asia" || chr21_edited[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr21_edited[sample, fileColumn] == " Africa-South_Asia" || chr21_edited[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr21_edited[sample, fileColumn] == " East_Asia-South_Asia" || chr21_edited[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_chromosomalVariation[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_chromosomalVariation[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_chromosomalVariation[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_chromosomalVariation[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 22
sample <- 2
while (sample<18)
{
  countingValuesRow <- 221
  countingValuesColumn <- sample-1
  
  africaCount <- 0
  europeAfricaCount <- 20
  eastAsiaCount <- 40
  europeCount <- 60
  europeSouthAsiaCount <- 80
  southAsiaCount <- 100
  AfricaSouthAsiaCount <- 120
  EastAsiaSouthAsiaCount <- 140
  europeEastAsiaCount <- 160
  AfricaEastAsiaCount <- 180
  fileColumn <- 2
  while (fileColumn<6)
  {
    if (chr22_edited[sample, fileColumn] == " Europe" || chr22_edited[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr22_edited[sample, fileColumn] == " Africa" || chr22_edited[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr22_edited[sample, fileColumn] == " East_Asia" || chr22_edited[sample, fileColumn] == "East_Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr22_edited[sample, fileColumn] == " South_Asia" || chr22_edited[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr22_edited[sample, fileColumn] == " Africa-Europe" || chr22_edited[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr22_edited[sample, fileColumn] == " East_Asia-Europe" || chr22_edited[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr22_edited[sample, fileColumn] == "Europe-South_Asia" || chr22_edited[sample, fileColumn] == "Europe South_Asia" || chr22_edited[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr22_edited[sample, fileColumn] == " Africa-East_Asia" || chr22_edited[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr22_edited[sample, fileColumn] == " Africa-South_Asia" || chr22_edited[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr22_edited[sample, fileColumn] == " East_Asia-South_Asia" || chr22_edited[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_chromosomalVariation[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_chromosomalVariation[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_chromosomalVariation[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_chromosomalVariation[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR X
sample <- 2
while (sample<18)
{
  countingValuesRow <- 231
  countingValuesColumn <- sample-1
  
  africaCount <- 0
  europeAfricaCount <- 20
  eastAsiaCount <- 40
  europeCount <- 60
  europeSouthAsiaCount <- 80
  southAsiaCount <- 100
  AfricaSouthAsiaCount <- 120
  EastAsiaSouthAsiaCount <- 140
  europeEastAsiaCount <- 160
  AfricaEastAsiaCount <- 180
  fileColumn <- 2
  while (fileColumn<6)
  {
    if (chrX_edited[sample, fileColumn] == " Europe" || chrX_edited[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chrX_edited[sample, fileColumn] == " Africa" || chrX_edited[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chrX_edited[sample, fileColumn] == " East_Asia" || chrX_edited[sample, fileColumn] == "East_Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chrX_edited[sample, fileColumn] == " South_Asia" || chrX_edited[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chrX_edited[sample, fileColumn] == " Africa-Europe" || chrX_edited[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chrX_edited[sample, fileColumn] == " East_Asia-Europe" || chrX_edited[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chrX_edited[sample, fileColumn] == "Europe-South_Asia" || chrX_edited[sample, fileColumn] == "Europe South_Asia" || chrX_edited[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chrX_edited[sample, fileColumn] == " Africa-East_Asia" || chrX_edited[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chrX_edited[sample, fileColumn] == " Africa-South_Asia" || chrX_edited[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chrX_edited[sample, fileColumn] == " East_Asia-South_Asia" || chrX_edited[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_chromosomalVariation[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_chromosomalVariation[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_chromosomalVariation[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_chromosomalVariation[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_chromosomalVariation[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

### GENERATE FINAL COUNT TABLE FOR THE POPULATIONS WITH SHADING FOR CONFIDENCE ###
final_count_for_plotting_chromosomalVariation <- matrix(nrow=16, ncol=24)
sample = 1
while (sample<21)
{
  value = 1
  final_count_row = sample
  final_count_col = 1
  while (value<11)
  {
    if (!counting_values_chromosomalVariation[value, sample]=="0" && !counting_values_chromosomalVariation[value, sample]=="100" && 
        !counting_values_chromosomalVariation[value, sample]=="20" && !counting_values_chromosomalVariation[value, sample]=="120" && 
        !counting_values_chromosomalVariation[value, sample]=="40" && !counting_values_chromosomalVariation[value, sample]=="140" && 
        !counting_values_chromosomalVariation[value, sample]=="60" && !counting_values_chromosomalVariation[value, sample]=="160" && 
        !counting_values_chromosomalVariation[value, sample]=="80" && !counting_values_chromosomalVariation[value, sample]=="180")
    {
      final_count_for_plotting_chromosomalVariation[final_count_row,final_count_col] = counting_values_chromosomalVariation[value,sample]
    }
    value = value+1
  }
  value = 11
  final_count_col=2
  while (value<21)
  {
    if (!counting_values_chromosomalVariation[value, sample]=="0" && !counting_values_chromosomalVariation[value, sample]=="100" && 
        !counting_values_chromosomalVariation[value, sample]=="20" && !counting_values_chromosomalVariation[value, sample]=="120" && 
        !counting_values_chromosomalVariation[value, sample]=="40" && !counting_values_chromosomalVariation[value, sample]=="140" && 
        !counting_values_chromosomalVariation[value, sample]=="60" && !counting_values_chromosomalVariation[value, sample]=="160" && 
        !counting_values_chromosomalVariation[value, sample]=="80" && !counting_values_chromosomalVariation[value, sample]=="180")
    {
      final_count_for_plotting_chromosomalVariation[final_count_row,final_count_col] = counting_values_chromosomalVariation[value,sample]
    }
    value = value+1
  }
  value = 21
  final_count_col=3
  while (value<31)
  {
    if (!counting_values_chromosomalVariation[value, sample]=="0" && !counting_values_chromosomalVariation[value, sample]=="100" && 
        !counting_values_chromosomalVariation[value, sample]=="20" && !counting_values_chromosomalVariation[value, sample]=="120" && 
        !counting_values_chromosomalVariation[value, sample]=="40" && !counting_values_chromosomalVariation[value, sample]=="140" && 
        !counting_values_chromosomalVariation[value, sample]=="60" && !counting_values_chromosomalVariation[value, sample]=="160" && 
        !counting_values_chromosomalVariation[value, sample]=="80" && !counting_values_chromosomalVariation[value, sample]=="180")
    {
      final_count_for_plotting_chromosomalVariation[final_count_row,final_count_col] = counting_values_chromosomalVariation[value,sample]
    }
    value = value+1
  }
  value = 31
  final_count_col=4
  while (value<41)
  {
    if (!counting_values_chromosomalVariation[value, sample]=="0" && !counting_values_chromosomalVariation[value, sample]=="100" && 
        !counting_values_chromosomalVariation[value, sample]=="20" && !counting_values_chromosomalVariation[value, sample]=="120" && 
        !counting_values_chromosomalVariation[value, sample]=="40" && !counting_values_chromosomalVariation[value, sample]=="140" && 
        !counting_values_chromosomalVariation[value, sample]=="60" && !counting_values_chromosomalVariation[value, sample]=="160" && 
        !counting_values_chromosomalVariation[value, sample]=="80" && !counting_values_chromosomalVariation[value, sample]=="180")
    {
      final_count_for_plotting_chromosomalVariation[final_count_row,final_count_col] = counting_values_chromosomalVariation[value,sample]
    }
    value = value+1
  }
  value = 41
  final_count_col=5
  while (value<51)
  {
    if (!counting_values_chromosomalVariation[value, sample]=="0" && !counting_values_chromosomalVariation[value, sample]=="100" && 
        !counting_values_chromosomalVariation[value, sample]=="20" && !counting_values_chromosomalVariation[value, sample]=="120" && 
        !counting_values_chromosomalVariation[value, sample]=="40" && !counting_values_chromosomalVariation[value, sample]=="140" && 
        !counting_values_chromosomalVariation[value, sample]=="60" && !counting_values_chromosomalVariation[value, sample]=="160" && 
        !counting_values_chromosomalVariation[value, sample]=="80" && !counting_values_chromosomalVariation[value, sample]=="180")
    {
      final_count_for_plotting_chromosomalVariation[final_count_row,final_count_col] = counting_values_chromosomalVariation[value,sample]
    }
    value = value+1
  }
  value = 51
  final_count_col=6
  while (value<61)
  {
    if (!counting_values_chromosomalVariation[value, sample]=="0" && !counting_values_chromosomalVariation[value, sample]=="100" && 
        !counting_values_chromosomalVariation[value, sample]=="20" && !counting_values_chromosomalVariation[value, sample]=="120" && 
        !counting_values_chromosomalVariation[value, sample]=="40" && !counting_values_chromosomalVariation[value, sample]=="140" && 
        !counting_values_chromosomalVariation[value, sample]=="60" && !counting_values_chromosomalVariation[value, sample]=="160" && 
        !counting_values_chromosomalVariation[value, sample]=="80" && !counting_values_chromosomalVariation[value, sample]=="180")
    {
      final_count_for_plotting_chromosomalVariation[final_count_row,final_count_col] = counting_values_chromosomalVariation[value,sample]
    }
    value = value+1
  }
  value = 61
  final_count_col=7
  while (value<71)
  {
    if (!counting_values_chromosomalVariation[value, sample]=="0" && !counting_values_chromosomalVariation[value, sample]=="100" && 
        !counting_values_chromosomalVariation[value, sample]=="20" && !counting_values_chromosomalVariation[value, sample]=="120" && 
        !counting_values_chromosomalVariation[value, sample]=="40" && !counting_values_chromosomalVariation[value, sample]=="140" && 
        !counting_values_chromosomalVariation[value, sample]=="60" && !counting_values_chromosomalVariation[value, sample]=="160" && 
        !counting_values_chromosomalVariation[value, sample]=="80" && !counting_values_chromosomalVariation[value, sample]=="180")
    {
      final_count_for_plotting_chromosomalVariation[final_count_row,final_count_col] = counting_values_chromosomalVariation[value,sample]
    }
    value = value+1
  }
  value = 71
  final_count_col=8
  while (value<81)
  {
    if (!counting_values_chromosomalVariation[value, sample]=="0" && !counting_values_chromosomalVariation[value, sample]=="100" && 
        !counting_values_chromosomalVariation[value, sample]=="20" && !counting_values_chromosomalVariation[value, sample]=="120" && 
        !counting_values_chromosomalVariation[value, sample]=="40" && !counting_values_chromosomalVariation[value, sample]=="140" && 
        !counting_values_chromosomalVariation[value, sample]=="60" && !counting_values_chromosomalVariation[value, sample]=="160" && 
        !counting_values_chromosomalVariation[value, sample]=="80" && !counting_values_chromosomalVariation[value, sample]=="180")
    {
      final_count_for_plotting_chromosomalVariation[final_count_row,final_count_col] = counting_values_chromosomalVariation[value,sample]
    }
    value = value+1
  }
  value = 81
  final_count_col=9
  while (value<91)
  {
    if (!counting_values_chromosomalVariation[value, sample]=="0" && !counting_values_chromosomalVariation[value, sample]=="100" && 
        !counting_values_chromosomalVariation[value, sample]=="20" && !counting_values_chromosomalVariation[value, sample]=="120" && 
        !counting_values_chromosomalVariation[value, sample]=="40" && !counting_values_chromosomalVariation[value, sample]=="140" && 
        !counting_values_chromosomalVariation[value, sample]=="60" && !counting_values_chromosomalVariation[value, sample]=="160" && 
        !counting_values_chromosomalVariation[value, sample]=="80" && !counting_values_chromosomalVariation[value, sample]=="180")
    {
      final_count_for_plotting_chromosomalVariation[final_count_row,final_count_col] = counting_values_chromosomalVariation[value,sample]
    }
    value = value+1
  }
  value = 91
  final_count_col=10
  while (value<101)
  {
    if (!counting_values_chromosomalVariation[value, sample]=="0" && !counting_values_chromosomalVariation[value, sample]=="100" && 
        !counting_values_chromosomalVariation[value, sample]=="20" && !counting_values_chromosomalVariation[value, sample]=="120" && 
        !counting_values_chromosomalVariation[value, sample]=="40" && !counting_values_chromosomalVariation[value, sample]=="140" && 
        !counting_values_chromosomalVariation[value, sample]=="60" && !counting_values_chromosomalVariation[value, sample]=="160" && 
        !counting_values_chromosomalVariation[value, sample]=="80" && !counting_values_chromosomalVariation[value, sample]=="180")
    {
      final_count_for_plotting_chromosomalVariation[final_count_row,final_count_col] = counting_values_chromosomalVariation[value,sample]
    }
    value = value+1
  }
  value = 101
  final_count_col=11
  while (value<111)
  {
    if (!counting_values_chromosomalVariation[value, sample]=="0" && !counting_values_chromosomalVariation[value, sample]=="100" && 
        !counting_values_chromosomalVariation[value, sample]=="20" && !counting_values_chromosomalVariation[value, sample]=="120" && 
        !counting_values_chromosomalVariation[value, sample]=="40" && !counting_values_chromosomalVariation[value, sample]=="140" && 
        !counting_values_chromosomalVariation[value, sample]=="60" && !counting_values_chromosomalVariation[value, sample]=="160" && 
        !counting_values_chromosomalVariation[value, sample]=="80" && !counting_values_chromosomalVariation[value, sample]=="180")
    {
      final_count_for_plotting_chromosomalVariation[final_count_row,final_count_col] = counting_values_chromosomalVariation[value,sample]
    }
    value = value+1
  }
  value = 111
  final_count_col=12
  while (value<121)
  {
    if (!counting_values_chromosomalVariation[value, sample]=="0" && !counting_values_chromosomalVariation[value, sample]=="100" && 
        !counting_values_chromosomalVariation[value, sample]=="20" && !counting_values_chromosomalVariation[value, sample]=="120" && 
        !counting_values_chromosomalVariation[value, sample]=="40" && !counting_values_chromosomalVariation[value, sample]=="140" && 
        !counting_values_chromosomalVariation[value, sample]=="60" && !counting_values_chromosomalVariation[value, sample]=="160" && 
        !counting_values_chromosomalVariation[value, sample]=="80" && !counting_values_chromosomalVariation[value, sample]=="180")
    {
      final_count_for_plotting_chromosomalVariation[final_count_row,final_count_col] = counting_values_chromosomalVariation[value,sample]
    }
    value = value+1
  }
  value = 121
  final_count_col=13
  while (value<131)
  {
    if (!counting_values_chromosomalVariation[value, sample]=="0" && !counting_values_chromosomalVariation[value, sample]=="100" && 
        !counting_values_chromosomalVariation[value, sample]=="20" && !counting_values_chromosomalVariation[value, sample]=="120" && 
        !counting_values_chromosomalVariation[value, sample]=="40" && !counting_values_chromosomalVariation[value, sample]=="140" && 
        !counting_values_chromosomalVariation[value, sample]=="60" && !counting_values_chromosomalVariation[value, sample]=="160" && 
        !counting_values_chromosomalVariation[value, sample]=="80" && !counting_values_chromosomalVariation[value, sample]=="180")
    {
      final_count_for_plotting_chromosomalVariation[final_count_row,final_count_col] = counting_values_chromosomalVariation[value,sample]
    }
    value = value+1
  }
  value = 131
  final_count_col=14
  while (value<141)
  {
    if (!counting_values_chromosomalVariation[value, sample]=="0" && !counting_values_chromosomalVariation[value, sample]=="100" && 
        !counting_values_chromosomalVariation[value, sample]=="20" && !counting_values_chromosomalVariation[value, sample]=="120" && 
        !counting_values_chromosomalVariation[value, sample]=="40" && !counting_values_chromosomalVariation[value, sample]=="140" && 
        !counting_values_chromosomalVariation[value, sample]=="60" && !counting_values_chromosomalVariation[value, sample]=="160" && 
        !counting_values_chromosomalVariation[value, sample]=="80" && !counting_values_chromosomalVariation[value, sample]=="180")
    {
      final_count_for_plotting_chromosomalVariation[final_count_row,final_count_col] = counting_values_chromosomalVariation[value,sample]
    }
    value = value+1
  }
  value = 141
  final_count_col=15
  while (value<151)
  {
    if (!counting_values_chromosomalVariation[value, sample]=="0" && !counting_values_chromosomalVariation[value, sample]=="100" && 
        !counting_values_chromosomalVariation[value, sample]=="20" && !counting_values_chromosomalVariation[value, sample]=="120" && 
        !counting_values_chromosomalVariation[value, sample]=="40" && !counting_values_chromosomalVariation[value, sample]=="140" && 
        !counting_values_chromosomalVariation[value, sample]=="60" && !counting_values_chromosomalVariation[value, sample]=="160" && 
        !counting_values_chromosomalVariation[value, sample]=="80" && !counting_values_chromosomalVariation[value, sample]=="180")
    {
      final_count_for_plotting_chromosomalVariation[final_count_row,final_count_col] = counting_values_chromosomalVariation[value,sample]
    }
    value = value+1
  }
  value = 151
  final_count_col=16
  while (value<161)
  {
    if (!counting_values_chromosomalVariation[value, sample]=="0" && !counting_values_chromosomalVariation[value, sample]=="100" && 
        !counting_values_chromosomalVariation[value, sample]=="20" && !counting_values_chromosomalVariation[value, sample]=="120" && 
        !counting_values_chromosomalVariation[value, sample]=="40" && !counting_values_chromosomalVariation[value, sample]=="140" && 
        !counting_values_chromosomalVariation[value, sample]=="60" && !counting_values_chromosomalVariation[value, sample]=="160" && 
        !counting_values_chromosomalVariation[value, sample]=="80" && !counting_values_chromosomalVariation[value, sample]=="180")
    {
      final_count_for_plotting_chromosomalVariation[final_count_row,final_count_col] = counting_values_chromosomalVariation[value,sample]
    }
    value = value+1
  }
  value = 161
  final_count_col=17
  while (value<171)
  {
    if (!counting_values_chromosomalVariation[value, sample]=="0" && !counting_values_chromosomalVariation[value, sample]=="100" && 
        !counting_values_chromosomalVariation[value, sample]=="20" && !counting_values_chromosomalVariation[value, sample]=="120" && 
        !counting_values_chromosomalVariation[value, sample]=="40" && !counting_values_chromosomalVariation[value, sample]=="140" && 
        !counting_values_chromosomalVariation[value, sample]=="60" && !counting_values_chromosomalVariation[value, sample]=="160" && 
        !counting_values_chromosomalVariation[value, sample]=="80" && !counting_values_chromosomalVariation[value, sample]=="180")
    {
      final_count_for_plotting_chromosomalVariation[final_count_row,final_count_col] = counting_values_chromosomalVariation[value,sample]
    }
    value = value+1
  }
  value = 171
  final_count_col=18
  while (value<181)
  {
    if (!counting_values_chromosomalVariation[value, sample]=="0" && !counting_values_chromosomalVariation[value, sample]=="100" && 
        !counting_values_chromosomalVariation[value, sample]=="20" && !counting_values_chromosomalVariation[value, sample]=="120" && 
        !counting_values_chromosomalVariation[value, sample]=="40" && !counting_values_chromosomalVariation[value, sample]=="140" && 
        !counting_values_chromosomalVariation[value, sample]=="60" && !counting_values_chromosomalVariation[value, sample]=="160" && 
        !counting_values_chromosomalVariation[value, sample]=="80" && !counting_values_chromosomalVariation[value, sample]=="180")
    {
      final_count_for_plotting_chromosomalVariation[final_count_row,final_count_col] = counting_values_chromosomalVariation[value,sample]
    }
    value = value+1
  }
  value = 181
  final_count_col=19
  while (value<191)
  {
    if (!counting_values_chromosomalVariation[value, sample]=="0" && !counting_values_chromosomalVariation[value, sample]=="100" && 
        !counting_values_chromosomalVariation[value, sample]=="20" && !counting_values_chromosomalVariation[value, sample]=="120" && 
        !counting_values_chromosomalVariation[value, sample]=="40" && !counting_values_chromosomalVariation[value, sample]=="140" && 
        !counting_values_chromosomalVariation[value, sample]=="60" && !counting_values_chromosomalVariation[value, sample]=="160" && 
        !counting_values_chromosomalVariation[value, sample]=="80" && !counting_values_chromosomalVariation[value, sample]=="180")
    {
      final_count_for_plotting_chromosomalVariation[final_count_row,final_count_col] = counting_values_chromosomalVariation[value,sample]
    }
    value = value+1
  }
  value = 191
  final_count_col=20
  while (value<201)
  {
    if (!counting_values_chromosomalVariation[value, sample]=="0" && !counting_values_chromosomalVariation[value, sample]=="100" && 
        !counting_values_chromosomalVariation[value, sample]=="20" && !counting_values_chromosomalVariation[value, sample]=="120" && 
        !counting_values_chromosomalVariation[value, sample]=="40" && !counting_values_chromosomalVariation[value, sample]=="140" && 
        !counting_values_chromosomalVariation[value, sample]=="60" && !counting_values_chromosomalVariation[value, sample]=="160" && 
        !counting_values_chromosomalVariation[value, sample]=="80" && !counting_values_chromosomalVariation[value, sample]=="180")
    {
      final_count_for_plotting_chromosomalVariation[final_count_row,final_count_col] = counting_values_chromosomalVariation[value,sample]
    }
    value = value+1
  }
  value = 201
  final_count_col=21
  while (value<211)
  {
    if (!counting_values_chromosomalVariation[value, sample]=="0" && !counting_values_chromosomalVariation[value, sample]=="100" && 
        !counting_values_chromosomalVariation[value, sample]=="20" && !counting_values_chromosomalVariation[value, sample]=="120" && 
        !counting_values_chromosomalVariation[value, sample]=="40" && !counting_values_chromosomalVariation[value, sample]=="140" && 
        !counting_values_chromosomalVariation[value, sample]=="60" && !counting_values_chromosomalVariation[value, sample]=="160" && 
        !counting_values_chromosomalVariation[value, sample]=="80" && !counting_values_chromosomalVariation[value, sample]=="180")
    {
      final_count_for_plotting_chromosomalVariation[final_count_row,final_count_col] = counting_values_chromosomalVariation[value,sample]
    }
    value = value+1
  }
  value = 211
  final_count_col=22
  while (value<221)
  {
    if (!counting_values_chromosomalVariation[value, sample]=="0" && !counting_values_chromosomalVariation[value, sample]=="100" && 
        !counting_values_chromosomalVariation[value, sample]=="20" && !counting_values_chromosomalVariation[value, sample]=="120" && 
        !counting_values_chromosomalVariation[value, sample]=="40" && !counting_values_chromosomalVariation[value, sample]=="140" && 
        !counting_values_chromosomalVariation[value, sample]=="60" && !counting_values_chromosomalVariation[value, sample]=="160" && 
        !counting_values_chromosomalVariation[value, sample]=="80" && !counting_values_chromosomalVariation[value, sample]=="180")
    {
      final_count_for_plotting_chromosomalVariation[final_count_row,final_count_col] = counting_values_chromosomalVariation[value,sample]
    }
    value = value+1
  }
  value = 221
  final_count_col=23
  while (value<231)
  {
    if (!counting_values_chromosomalVariation[value, sample]=="0" && !counting_values_chromosomalVariation[value, sample]=="100" && 
        !counting_values_chromosomalVariation[value, sample]=="20" && !counting_values_chromosomalVariation[value, sample]=="120" && 
        !counting_values_chromosomalVariation[value, sample]=="40" && !counting_values_chromosomalVariation[value, sample]=="140" && 
        !counting_values_chromosomalVariation[value, sample]=="60" && !counting_values_chromosomalVariation[value, sample]=="160" && 
        !counting_values_chromosomalVariation[value, sample]=="80" && !counting_values_chromosomalVariation[value, sample]=="180")
    {
      final_count_for_plotting_chromosomalVariation[final_count_row,final_count_col] = counting_values_chromosomalVariation[value,sample]
    }
    value = value+1
  }
  value = 231
  final_count_col=24
  while (value<241)
  {
    if (!counting_values_chromosomalVariation[value, sample]=="0" && !counting_values_chromosomalVariation[value, sample]=="100" && 
        !counting_values_chromosomalVariation[value, sample]=="20" && !counting_values_chromosomalVariation[value, sample]=="120" && 
        !counting_values_chromosomalVariation[value, sample]=="40" && !counting_values_chromosomalVariation[value, sample]=="140" && 
        !counting_values_chromosomalVariation[value, sample]=="60" && !counting_values_chromosomalVariation[value, sample]=="160" && 
        !counting_values_chromosomalVariation[value, sample]=="80" && !counting_values_chromosomalVariation[value, sample]=="180")
    {
      final_count_for_plotting_chromosomalVariation[final_count_row,final_count_col] = counting_values_chromosomalVariation[value,sample]
    }
    value = value+1
  }
  sample = sample+1
}

# Generating the HeatMap
pfdfilename <- paste("../PopInf_GTEx_chromosomalVariation.pdf",sep="")
pdf(pfdfilename, 8,8)
plot(1, type="n", axes=FALSE, xlab="", ylab="", main = "Key")
# COLORING: Intermediates for Admix
legend("center",bty="n",legend=c("Africa","Africa-South Asia","Africa-Europe","East Asia","Europe-East Asia",
                                 "Europe","Europe-South Asia","South Asia","South Asia-East Asia"), 
       fill=c("#2C0136","#481567","#453781","#39568C","#2D708E","#1F968B","#29AF7F","#73D055","#B8DE29"), 
       cex=1)
colors_custom = palette(c("#2C0136","#453781","#39568C","#1F968B","#29AF7F",
                          "#73D055","#481567","#B8DE29","#2D708E"))
colors_custom = palette(c("#2C0136","#453781","#39568C","#1F968B","#29AF7F",
                          "#73D055","#481567","#B8DE29","#2D708E"))
breaks <- c(0,20,40,60,80,100,120,140,160,180)
heatmap.2(final_count_for_plotting_chromosomalVariation, Colv = FALSE, dendrogram="none", scale="none", 
          col=colors_custom, xlab="Chromosome",labRow=NA,
          ylab="Sample",trace="none",breaks=breaks,
          labCol= c("Autosomes", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", 
                    "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "X"), 
          cexCol = 0.8, main="Individuals with Variation across Chromosomes")
dev.off()
