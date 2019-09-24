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

### GENERATE THE TABLE TO COUNT VALUES FOR THE POPULATIONS WITH SHADING FOR CONFIDENCE ###
counting_values_shading = matrix(nrow=240, ncol=403)

# ALL AUTOSOMES
sample <- 2
while (sample<405)
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
    if (all_autosomes[sample, fileColumn] == " Europe" || all_autosomes[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (all_autosomes[sample, fileColumn] == " Africa" || all_autosomes[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (all_autosomes[sample, fileColumn] == " East_Asia" || all_autosomes[sample, fileColumn] == "East_Asia" || all_autosomes[sample, fileColumn] == "East Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (all_autosomes[sample, fileColumn] == " South_Asia" || all_autosomes[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (all_autosomes[sample, fileColumn] == " Africa-Europe" || all_autosomes[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (all_autosomes[sample, fileColumn] == " East_Asia-Europe" || all_autosomes[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (all_autosomes[sample, fileColumn] == "Europe-South_Asia" || all_autosomes[sample, fileColumn] == "Europe South_Asia" || all_autosomes[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (all_autosomes[sample, fileColumn] == " Africa-East_Asia" || all_autosomes[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (all_autosomes[sample, fileColumn] == " Africa-South_Asia" || all_autosomes[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (all_autosomes[sample, fileColumn] == " East_Asia-South_Asia" || all_autosomes[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_shading[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_shading[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_shading[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_shading[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_shading[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_shading[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_shading[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_shading[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_shading[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_shading[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 1
sample <- 2
while (sample<405)
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
    if (chr1[sample, fileColumn] == " Europe" || chr1[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr1[sample, fileColumn] == " Africa" || chr1[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr1[sample, fileColumn] == " East_Asia" || chr1[sample, fileColumn] == "East_Asia" || chr1[sample, fileColumn] == "East Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr1[sample, fileColumn] == " South_Asia" || chr1[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr1[sample, fileColumn] == " Africa-Europe" || chr1[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr1[sample, fileColumn] == " East_Asia-Europe" || chr1[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr1[sample, fileColumn] == "Europe-South_Asia" || chr1[sample, fileColumn] == "Europe South_Asia" || chr1[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr1[sample, fileColumn] == " Africa-East_Asia" || chr1[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr1[sample, fileColumn] == " Africa-South_Asia" || chr1[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr1[sample, fileColumn] == " East_Asia-South_Asia" || chr1[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_shading[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_shading[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_shading[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_shading[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_shading[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_shading[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_shading[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_shading[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_shading[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_shading[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 2
sample <- 2
while (sample<405)
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
    if (chr2[sample, fileColumn] == " Europe" || chr2[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr2[sample, fileColumn] == " Africa" || chr2[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr2[sample, fileColumn] == " East_Asia" || chr2[sample, fileColumn] == "East_Asia" || chr2[sample, fileColumn] == "East Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr2[sample, fileColumn] == " South_Asia" || chr2[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr2[sample, fileColumn] == " Africa-Europe" || chr2[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr2[sample, fileColumn] == " East_Asia-Europe" || chr2[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr2[sample, fileColumn] == "Europe-South_Asia" || chr2[sample, fileColumn] == "Europe South_Asia" || chr2[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr2[sample, fileColumn] == " Africa-East_Asia" || chr2[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr2[sample, fileColumn] == " Africa-South_Asia" || chr2[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr2[sample, fileColumn] == " East_Asia-South_Asia" || chr2[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_shading[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_shading[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_shading[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_shading[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_shading[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_shading[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_shading[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_shading[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_shading[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_shading[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 3
sample <- 2
while (sample<405)
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
    if (chr3[sample, fileColumn] == " Europe" || chr3[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr3[sample, fileColumn] == " Africa" || chr3[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr3[sample, fileColumn] == " East_Asia" || chr3[sample, fileColumn] == "East_Asia" || chr3[sample, fileColumn] == "East Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr3[sample, fileColumn] == " South_Asia" || chr3[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr3[sample, fileColumn] == " Africa-Europe" || chr3[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr3[sample, fileColumn] == " East_Asia-Europe" || chr3[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr3[sample, fileColumn] == "Europe-South_Asia" || chr3[sample, fileColumn] == "Europe South_Asia" || chr3[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr3[sample, fileColumn] == " Africa-East_Asia" || chr3[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr3[sample, fileColumn] == " Africa-South_Asia" || chr3[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr3[sample, fileColumn] == " East_Asia-South_Asia" || chr3[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_shading[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_shading[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_shading[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_shading[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_shading[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_shading[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_shading[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_shading[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_shading[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_shading[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 4
sample <- 2
while (sample<405)
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
    if (chr4[sample, fileColumn] == " Europe" || chr4[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr4[sample, fileColumn] == " Africa" || chr4[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr4[sample, fileColumn] == " East_Asia" || chr4[sample, fileColumn] == "East_Asia" || chr4[sample, fileColumn] == "East Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr4[sample, fileColumn] == " South_Asia" || chr4[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr4[sample, fileColumn] == " Africa-Europe" || chr4[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr4[sample, fileColumn] == " East_Asia-Europe" || chr4[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr4[sample, fileColumn] == "Europe-South_Asia" || chr4[sample, fileColumn] == "Europe South_Asia" || chr4[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr4[sample, fileColumn] == " Africa-East_Asia" || chr4[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr4[sample, fileColumn] == " Africa-South_Asia" || chr4[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr4[sample, fileColumn] == " East_Asia-South_Asia" || chr4[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_shading[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_shading[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_shading[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_shading[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_shading[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_shading[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_shading[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_shading[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_shading[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_shading[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 5
sample <- 2
while (sample<405)
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
    if (chr5[sample, fileColumn] == " Europe" || chr5[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr5[sample, fileColumn] == " Africa" || chr5[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr5[sample, fileColumn] == " East_Asia" || chr5[sample, fileColumn] == "East_Asia" || chr5[sample, fileColumn] == "East Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr5[sample, fileColumn] == " South_Asia" || chr5[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr5[sample, fileColumn] == " Africa-Europe" || chr5[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr5[sample, fileColumn] == " East_Asia-Europe" || chr5[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr5[sample, fileColumn] == "Europe-South_Asia" || chr5[sample, fileColumn] == "Europe South_Asia" || chr5[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr5[sample, fileColumn] == " Africa-East_Asia" || chr5[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr5[sample, fileColumn] == " Africa-South_Asia" || chr5[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr5[sample, fileColumn] == " East_Asia-South_Asia" || chr5[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_shading[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_shading[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_shading[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_shading[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_shading[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_shading[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_shading[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_shading[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_shading[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_shading[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 6
sample <- 2
while (sample<405)
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
    if (chr6[sample, fileColumn] == " Europe" || chr6[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr6[sample, fileColumn] == " Africa" || chr6[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr6[sample, fileColumn] == " East_Asia" || chr6[sample, fileColumn] == "East_Asia" || chr6[sample, fileColumn] == "East Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr6[sample, fileColumn] == " South_Asia" || chr6[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr6[sample, fileColumn] == " Africa-Europe" || chr6[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr6[sample, fileColumn] == " East_Asia-Europe" || chr6[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr6[sample, fileColumn] == "Europe-South_Asia" || chr6[sample, fileColumn] == "Europe South_Asia" || chr6[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr6[sample, fileColumn] == " Africa-East_Asia" || chr6[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr6[sample, fileColumn] == " Africa-South_Asia" || chr6[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr6[sample, fileColumn] == " East_Asia-South_Asia" || chr6[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_shading[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_shading[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_shading[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_shading[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_shading[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_shading[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_shading[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_shading[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_shading[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_shading[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 7
sample <- 2
while (sample<405)
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
    if (chr7[sample, fileColumn] == " Europe" || chr7[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr7[sample, fileColumn] == " Africa" || chr7[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr7[sample, fileColumn] == " East_Asia" || chr7[sample, fileColumn] == "East_Asia" || chr7[sample, fileColumn] == "East Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr7[sample, fileColumn] == " South_Asia" || chr7[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr7[sample, fileColumn] == " Africa-Europe" || chr7[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr7[sample, fileColumn] == " East_Asia-Europe" || chr7[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr7[sample, fileColumn] == "Europe-South_Asia" || chr7[sample, fileColumn] == "Europe South_Asia" || chr7[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr7[sample, fileColumn] == " Africa-East_Asia" || chr7[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr7[sample, fileColumn] == " Africa-South_Asia" || chr7[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr7[sample, fileColumn] == " East_Asia-South_Asia" || chr7[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_shading[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_shading[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_shading[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_shading[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_shading[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_shading[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_shading[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_shading[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_shading[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_shading[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 8
sample <- 2
while (sample<405)
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
    if (chr8[sample, fileColumn] == " Europe" || chr8[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr8[sample, fileColumn] == " Africa" || chr8[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr8[sample, fileColumn] == " East_Asia" || chr8[sample, fileColumn] == "East_Asia" || chr8[sample, fileColumn] == "East Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr8[sample, fileColumn] == " South_Asia" || chr8[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr8[sample, fileColumn] == " Africa-Europe" || chr8[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr8[sample, fileColumn] == " East_Asia-Europe" || chr8[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr8[sample, fileColumn] == "Europe-South_Asia" || chr8[sample, fileColumn] == "Europe South_Asia" || chr8[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr8[sample, fileColumn] == " Africa-East_Asia" || chr8[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr8[sample, fileColumn] == " Africa-South_Asia" || chr8[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr8[sample, fileColumn] == " East_Asia-South_Asia" || chr8[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_shading[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_shading[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_shading[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_shading[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_shading[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_shading[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_shading[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_shading[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_shading[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_shading[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 9
sample <- 2
while (sample<405)
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
    if (chr9[sample, fileColumn] == " Europe" || chr9[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr9[sample, fileColumn] == " Africa" || chr9[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr9[sample, fileColumn] == " East_Asia" || chr9[sample, fileColumn] == "East_Asia" || chr9[sample, fileColumn] == "East Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr9[sample, fileColumn] == " South_Asia" || chr9[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr9[sample, fileColumn] == " Africa-Europe" || chr9[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr9[sample, fileColumn] == " East_Asia-Europe" || chr9[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr9[sample, fileColumn] == "Europe-South_Asia" || chr9[sample, fileColumn] == "Europe South_Asia" || chr9[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr9[sample, fileColumn] == " Africa-East_Asia" || chr9[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr9[sample, fileColumn] == " Africa-South_Asia" || chr9[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr9[sample, fileColumn] == " East_Asia-South_Asia" || chr9[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_shading[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_shading[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_shading[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_shading[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_shading[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_shading[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_shading[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_shading[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_shading[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_shading[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 10
sample <- 2
while (sample<405)
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
    if (chr10[sample, fileColumn] == " Europe" || chr10[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr10[sample, fileColumn] == " Africa" || chr10[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr10[sample, fileColumn] == " East_Asia" || chr10[sample, fileColumn] == "East_Asia" || chr10[sample, fileColumn] == "East Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr10[sample, fileColumn] == " South_Asia" || chr10[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr10[sample, fileColumn] == " Africa-Europe" || chr10[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr10[sample, fileColumn] == " East_Asia-Europe" || chr10[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr10[sample, fileColumn] == "Europe-South_Asia" || chr10[sample, fileColumn] == "Europe South_Asia" || chr10[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr10[sample, fileColumn] == " Africa-East_Asia" || chr10[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr10[sample, fileColumn] == " Africa-South_Asia" || chr10[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr10[sample, fileColumn] == " East_Asia-South_Asia" || chr10[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_shading[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_shading[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_shading[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_shading[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_shading[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_shading[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_shading[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_shading[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_shading[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_shading[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 11
sample <- 2
while (sample<405)
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
    if (chr11[sample, fileColumn] == " Europe" || chr11[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr11[sample, fileColumn] == " Africa" || chr11[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr11[sample, fileColumn] == " East_Asia" || chr11[sample, fileColumn] == "East_Asia" || chr11[sample, fileColumn] == "East Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr11[sample, fileColumn] == " South_Asia" || chr11[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr11[sample, fileColumn] == " Africa-Europe" || chr11[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr11[sample, fileColumn] == " East_Asia-Europe" || chr11[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr11[sample, fileColumn] == "Europe-South_Asia" || chr11[sample, fileColumn] == "Europe South_Asia" || chr11[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr11[sample, fileColumn] == " Africa-East_Asia" || chr11[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr11[sample, fileColumn] == " Africa-South_Asia" || chr11[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr11[sample, fileColumn] == " East_Asia-South_Asia" || chr11[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_shading[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_shading[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_shading[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_shading[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_shading[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_shading[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_shading[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_shading[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_shading[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_shading[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 12
sample <- 2
while (sample<405)
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
    if (chr12[sample, fileColumn] == " Europe" || chr12[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr12[sample, fileColumn] == " Africa" || chr12[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr12[sample, fileColumn] == " East_Asia" || chr12[sample, fileColumn] == "East_Asia" || chr12[sample, fileColumn] == "East Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr12[sample, fileColumn] == " South_Asia" || chr12[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr12[sample, fileColumn] == " Africa-Europe" || chr12[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr12[sample, fileColumn] == " East_Asia-Europe" || chr12[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr12[sample, fileColumn] == "Europe-South_Asia" || chr12[sample, fileColumn] == "Europe South_Asia" || chr12[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr12[sample, fileColumn] == " Africa-East_Asia" || chr12[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr12[sample, fileColumn] == " Africa-South_Asia" || chr12[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr12[sample, fileColumn] == " East_Asia-South_Asia" || chr12[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_shading[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_shading[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_shading[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_shading[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_shading[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_shading[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_shading[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_shading[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_shading[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_shading[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 13
sample <- 2
while (sample<405)
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
    if (chr13[sample, fileColumn] == " Europe" || chr13[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr13[sample, fileColumn] == " Africa" || chr13[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr13[sample, fileColumn] == " East_Asia" || chr13[sample, fileColumn] == "East_Asia" || chr13[sample, fileColumn] == "East Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr13[sample, fileColumn] == " South_Asia" || chr13[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr13[sample, fileColumn] == " Africa-Europe" || chr13[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr13[sample, fileColumn] == " East_Asia-Europe" || chr13[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr13[sample, fileColumn] == "Europe-South_Asia" || chr13[sample, fileColumn] == "Europe South_Asia" || chr13[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr13[sample, fileColumn] == " Africa-East_Asia" || chr13[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr13[sample, fileColumn] == " Africa-South_Asia" || chr13[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr13[sample, fileColumn] == " East_Asia-South_Asia" || chr13[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_shading[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_shading[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_shading[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_shading[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_shading[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_shading[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_shading[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_shading[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_shading[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_shading[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 14
sample <- 2
while (sample<405)
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
    if (chr14[sample, fileColumn] == " Europe" || chr14[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr14[sample, fileColumn] == " Africa" || chr14[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr14[sample, fileColumn] == " East_Asia" || chr14[sample, fileColumn] == "East_Asia" || chr14[sample, fileColumn] == "East Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr14[sample, fileColumn] == " South_Asia" || chr14[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr14[sample, fileColumn] == " Africa-Europe" || chr14[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr14[sample, fileColumn] == " East_Asia-Europe" || chr14[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr14[sample, fileColumn] == "Europe-South_Asia" || chr14[sample, fileColumn] == "Europe South_Asia" || chr14[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr14[sample, fileColumn] == " Africa-East_Asia" || chr14[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr14[sample, fileColumn] == " Africa-South_Asia" || chr14[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr14[sample, fileColumn] == " East_Asia-South_Asia" || chr14[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_shading[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_shading[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_shading[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_shading[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_shading[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_shading[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_shading[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_shading[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_shading[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_shading[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 15
sample <- 2
while (sample<405)
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
    if (chr15[sample, fileColumn] == " Europe" || chr15[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr15[sample, fileColumn] == " Africa" || chr15[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr15[sample, fileColumn] == " East_Asia" || chr15[sample, fileColumn] == "East_Asia" || chr15[sample, fileColumn] == "East Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr15[sample, fileColumn] == " South_Asia" || chr15[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr15[sample, fileColumn] == " Africa-Europe" || chr15[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr15[sample, fileColumn] == " East_Asia-Europe" || chr15[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr15[sample, fileColumn] == "Europe-South_Asia" || chr15[sample, fileColumn] == "Europe South_Asia" || chr15[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr15[sample, fileColumn] == " Africa-East_Asia" || chr15[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr15[sample, fileColumn] == " Africa-South_Asia" || chr15[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr15[sample, fileColumn] == " East_Asia-South_Asia" || chr15[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_shading[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_shading[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_shading[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_shading[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_shading[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_shading[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_shading[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_shading[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_shading[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_shading[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 16
sample <- 2
while (sample<405)
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
    if (chr16[sample, fileColumn] == " Europe" || chr16[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr16[sample, fileColumn] == " Africa" || chr16[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr16[sample, fileColumn] == " East_Asia" || chr16[sample, fileColumn] == "East_Asia" || chr16[sample, fileColumn] == "East Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr16[sample, fileColumn] == " South_Asia" || chr16[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr16[sample, fileColumn] == " Africa-Europe" || chr16[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr16[sample, fileColumn] == " East_Asia-Europe" || chr16[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr16[sample, fileColumn] == "Europe-South_Asia" || chr16[sample, fileColumn] == "Europe South_Asia" || chr16[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr16[sample, fileColumn] == " Africa-East_Asia" || chr16[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr16[sample, fileColumn] == " Africa-South_Asia" || chr16[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr16[sample, fileColumn] == " East_Asia-South_Asia" || chr16[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_shading[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_shading[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_shading[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_shading[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_shading[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_shading[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_shading[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_shading[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_shading[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_shading[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 17
sample <- 2
while (sample<405)
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
    if (chr17[sample, fileColumn] == " Europe" || chr17[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr17[sample, fileColumn] == " Africa" || chr17[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr17[sample, fileColumn] == " East_Asia" || chr17[sample, fileColumn] == "East_Asia" || chr17[sample, fileColumn] == "East Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr17[sample, fileColumn] == " South_Asia" || chr17[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr17[sample, fileColumn] == " Africa-Europe" || chr17[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr17[sample, fileColumn] == " East_Asia-Europe" || chr17[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr17[sample, fileColumn] == "Europe-South_Asia" || chr17[sample, fileColumn] == "Europe South_Asia" || chr17[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr17[sample, fileColumn] == " Africa-East_Asia" || chr17[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr17[sample, fileColumn] == " Africa-South_Asia" || chr17[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr17[sample, fileColumn] == " East_Asia-South_Asia" || chr17[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_shading[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_shading[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_shading[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_shading[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_shading[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_shading[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_shading[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_shading[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_shading[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_shading[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 18
sample <- 2
while (sample<405)
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
    if (chr18[sample, fileColumn] == " Europe" || chr18[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr18[sample, fileColumn] == " Africa" || chr18[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr18[sample, fileColumn] == " East_Asia" || chr18[sample, fileColumn] == "East_Asia" || chr18[sample, fileColumn] == "East Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr18[sample, fileColumn] == " South_Asia" || chr18[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr18[sample, fileColumn] == " Africa-Europe" || chr18[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr18[sample, fileColumn] == " East_Asia-Europe" || chr18[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr18[sample, fileColumn] == "Europe-South_Asia" || chr18[sample, fileColumn] == "Europe South_Asia" || chr18[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr18[sample, fileColumn] == " Africa-East_Asia" || chr18[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr18[sample, fileColumn] == " Africa-South_Asia" || chr18[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr18[sample, fileColumn] == " East_Asia-South_Asia" || chr18[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_shading[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_shading[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_shading[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_shading[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_shading[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_shading[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_shading[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_shading[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_shading[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_shading[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 19
sample <- 2
while (sample<405)
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
    if (chr19[sample, fileColumn] == " Europe" || chr19[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr19[sample, fileColumn] == " Africa" || chr19[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr19[sample, fileColumn] == " East_Asia" || chr19[sample, fileColumn] == "East_Asia" || chr19[sample, fileColumn] == "East Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr19[sample, fileColumn] == " South_Asia" || chr19[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr19[sample, fileColumn] == " Africa-Europe" || chr19[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr19[sample, fileColumn] == " East_Asia-Europe" || chr19[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr19[sample, fileColumn] == "Europe-South_Asia" || chr19[sample, fileColumn] == "Europe South_Asia" || chr19[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr19[sample, fileColumn] == " Africa-East_Asia" || chr19[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr19[sample, fileColumn] == " Africa-South_Asia" || chr19[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr19[sample, fileColumn] == " East_Asia-South_Asia" || chr19[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_shading[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_shading[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_shading[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_shading[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_shading[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_shading[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_shading[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_shading[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_shading[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_shading[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 20
sample <- 2
while (sample<405)
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
    if (chr20[sample, fileColumn] == " Europe" || chr20[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr20[sample, fileColumn] == " Africa" || chr20[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr20[sample, fileColumn] == " East_Asia" || chr20[sample, fileColumn] == "East_Asia" || chr20[sample, fileColumn] == "East Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr20[sample, fileColumn] == " South_Asia" || chr20[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr20[sample, fileColumn] == " Africa-Europe" || chr20[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr20[sample, fileColumn] == " East_Asia-Europe" || chr20[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr20[sample, fileColumn] == "Europe-South_Asia" || chr20[sample, fileColumn] == "Europe South_Asia" || chr20[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr20[sample, fileColumn] == " Africa-East_Asia" || chr20[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr20[sample, fileColumn] == " Africa-South_Asia" || chr20[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr20[sample, fileColumn] == " East_Asia-South_Asia" || chr20[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_shading[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_shading[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_shading[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_shading[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_shading[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_shading[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_shading[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_shading[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_shading[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_shading[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 21
sample <- 2
while (sample<405)
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
    if (chr21[sample, fileColumn] == " Europe" || chr21[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr21[sample, fileColumn] == " Africa" || chr21[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr21[sample, fileColumn] == " East_Asia" || chr21[sample, fileColumn] == "East_Asia" || chr21[sample, fileColumn] == "East Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr21[sample, fileColumn] == " South_Asia" || chr21[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr21[sample, fileColumn] == " Africa-Europe" || chr21[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr21[sample, fileColumn] == " East_Asia-Europe" || chr21[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr21[sample, fileColumn] == "Europe-South_Asia" || chr21[sample, fileColumn] == "Europe South_Asia" || chr21[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr21[sample, fileColumn] == " Africa-East_Asia" || chr21[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr21[sample, fileColumn] == " Africa-South_Asia" || chr21[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr21[sample, fileColumn] == " East_Asia-South_Asia" || chr21[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_shading[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_shading[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_shading[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_shading[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_shading[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_shading[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_shading[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_shading[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_shading[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_shading[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR 22
sample <- 2
while (sample<405)
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
    if (chr22[sample, fileColumn] == " Europe" || chr22[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chr22[sample, fileColumn] == " Africa" || chr22[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chr22[sample, fileColumn] == " East_Asia" || chr22[sample, fileColumn] == "East_Asia" || chr22[sample, fileColumn] == "East Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chr22[sample, fileColumn] == " South_Asia" || chr22[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chr22[sample, fileColumn] == " Africa-Europe" || chr22[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chr22[sample, fileColumn] == " East_Asia-Europe" || chr22[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chr22[sample, fileColumn] == "Europe-South_Asia" || chr22[sample, fileColumn] == "Europe South_Asia" || chr22[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chr22[sample, fileColumn] == " Africa-East_Asia" || chr22[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chr22[sample, fileColumn] == " Africa-South_Asia" || chr22[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chr22[sample, fileColumn] == " East_Asia-South_Asia" || chr22[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_shading[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_shading[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_shading[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_shading[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_shading[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_shading[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_shading[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_shading[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_shading[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_shading[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

# CHR X
sample <- 2
while (sample<405)
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
    if (chrX[sample, fileColumn] == " Europe" || chrX[sample, fileColumn] == "Europe") 
    {
      europeCount <- europeCount + 4
    }
    if (chrX[sample, fileColumn] == " Africa" || chrX[sample, fileColumn] == "Africa" ) 
    {
      africaCount <- africaCount + 4
    }
    if (chrX[sample, fileColumn] == " East_Asia" || chrX[sample, fileColumn] == "East_Asia" || chrX[sample, fileColumn] == "East Asia") 
    {
      eastAsiaCount <- eastAsiaCount + 4
    }
    if (chrX[sample, fileColumn] == " South_Asia" || chrX[sample, fileColumn] == "South_Asia") 
    {
      southAsiaCount <- southAsiaCount + 4
    }
    if (chrX[sample, fileColumn] == " Africa-Europe" || chrX[sample, fileColumn] == "Africa-Europe") 
    {
      europeAfricaCount <- europeAfricaCount + 4
    }
    if (chrX[sample, fileColumn] == " East_Asia-Europe" || chrX[sample, fileColumn] == "East_Asia-Europe") 
    {
      europeEastAsiaCount <- europeEastAsiaCount + 4
    }
    if (chrX[sample, fileColumn] == "Europe-South_Asia" || chrX[sample, fileColumn] == "Europe South_Asia" || chrX[sample, fileColumn] == " Europe South_Asia") 
    {
      europeSouthAsiaCount <- europeSouthAsiaCount + 4
    }
    if (chrX[sample, fileColumn] == " Africa-East_Asia" || chrX[sample, fileColumn] == "Africa-East_Asia") 
    {
      AfricaEastAsiaCount <- AfricaEastAsiaCount + 4
    }
    if (chrX[sample, fileColumn] == " Africa-South_Asia" || chrX[sample, fileColumn] == "Africa-South_Asia")
    {
      AfricaSouthAsiaCount <- AfricaSouthAsiaCount + 4
    }
    if (chrX[sample, fileColumn] == " East_Asia-South_Asia" || chrX[sample, fileColumn] == "East_Asia-South_Asia")
    {
      EastAsiaSouthAsiaCount <- EastAsiaSouthAsiaCount + 4
    }
    fileColumn <- fileColumn + 1
  }
  counting_values_shading[countingValuesRow,countingValuesColumn] <- europeCount
  counting_values_shading[countingValuesRow+1,countingValuesColumn] <- africaCount
  counting_values_shading[countingValuesRow+2,countingValuesColumn] <- eastAsiaCount
  counting_values_shading[countingValuesRow+3,countingValuesColumn] <- southAsiaCount
  counting_values_shading[countingValuesRow+4,countingValuesColumn] <- europeAfricaCount
  counting_values_shading[countingValuesRow+5,countingValuesColumn] <- europeEastAsiaCount
  counting_values_shading[countingValuesRow+6,countingValuesColumn] <- europeSouthAsiaCount
  counting_values_shading[countingValuesRow+7,countingValuesColumn] <- AfricaEastAsiaCount
  counting_values_shading[countingValuesRow+8,countingValuesColumn] <- AfricaSouthAsiaCount
  counting_values_shading[countingValuesRow+9,countingValuesColumn] <- EastAsiaSouthAsiaCount
  sample<-sample+1
}

### GENERATE FINAL COUNT TABLE FOR THE POPULATIONS WITH SHADING FOR CONFIDENCE ###
final_count_for_plotting_shading <- matrix(nrow=403, ncol=24)
sample = 1
while (sample<404)
{
  value = 1
  final_count_row = sample
  final_count_col = 1
  while (value<11)
  {
    if (!counting_values_shading[value, sample]=="0" && !counting_values_shading[value, sample]=="100" && 
        !counting_values_shading[value, sample]=="20" && !counting_values_shading[value, sample]=="120" && 
        !counting_values_shading[value, sample]=="40" && !counting_values_shading[value, sample]=="140" && 
        !counting_values_shading[value, sample]=="60" && !counting_values_shading[value, sample]=="160" && 
        !counting_values_shading[value, sample]=="80" && !counting_values_shading[value, sample]=="180")
    {
      final_count_for_plotting_shading[final_count_row,final_count_col] = counting_values_shading[value,sample]
    }
    value = value+1
  }
  value = 11
  final_count_col=2
  while (value<21)
  {
    if (!counting_values_shading[value, sample]=="0" && !counting_values_shading[value, sample]=="100" && 
        !counting_values_shading[value, sample]=="20" && !counting_values_shading[value, sample]=="120" && 
        !counting_values_shading[value, sample]=="40" && !counting_values_shading[value, sample]=="140" && 
        !counting_values_shading[value, sample]=="60" && !counting_values_shading[value, sample]=="160" && 
        !counting_values_shading[value, sample]=="80" && !counting_values_shading[value, sample]=="180")
    {
      final_count_for_plotting_shading[final_count_row,final_count_col] = counting_values_shading[value,sample]
    }
    value = value+1
  }
  value = 21
  final_count_col=3
  while (value<31)
  {
    if (!counting_values_shading[value, sample]=="0" && !counting_values_shading[value, sample]=="100" && 
        !counting_values_shading[value, sample]=="20" && !counting_values_shading[value, sample]=="120" && 
        !counting_values_shading[value, sample]=="40" && !counting_values_shading[value, sample]=="140" && 
        !counting_values_shading[value, sample]=="60" && !counting_values_shading[value, sample]=="160" && 
        !counting_values_shading[value, sample]=="80" && !counting_values_shading[value, sample]=="180")
    {
      final_count_for_plotting_shading[final_count_row,final_count_col] = counting_values_shading[value,sample]
    }
    value = value+1
  }
  value = 31
  final_count_col=4
  while (value<41)
  {
    if (!counting_values_shading[value, sample]=="0" && !counting_values_shading[value, sample]=="100" && 
        !counting_values_shading[value, sample]=="20" && !counting_values_shading[value, sample]=="120" && 
        !counting_values_shading[value, sample]=="40" && !counting_values_shading[value, sample]=="140" && 
        !counting_values_shading[value, sample]=="60" && !counting_values_shading[value, sample]=="160" && 
        !counting_values_shading[value, sample]=="80" && !counting_values_shading[value, sample]=="180")
    {
      final_count_for_plotting_shading[final_count_row,final_count_col] = counting_values_shading[value,sample]
    }
    value = value+1
  }
  value = 41
  final_count_col=5
  while (value<51)
  {
    if (!counting_values_shading[value, sample]=="0" && !counting_values_shading[value, sample]=="100" && 
        !counting_values_shading[value, sample]=="20" && !counting_values_shading[value, sample]=="120" && 
        !counting_values_shading[value, sample]=="40" && !counting_values_shading[value, sample]=="140" && 
        !counting_values_shading[value, sample]=="60" && !counting_values_shading[value, sample]=="160" && 
        !counting_values_shading[value, sample]=="80" && !counting_values_shading[value, sample]=="180")
    {
      final_count_for_plotting_shading[final_count_row,final_count_col] = counting_values_shading[value,sample]
    }
    value = value+1
  }
  value = 51
  final_count_col=6
  while (value<61)
  {
    if (!counting_values_shading[value, sample]=="0" && !counting_values_shading[value, sample]=="100" && 
        !counting_values_shading[value, sample]=="20" && !counting_values_shading[value, sample]=="120" && 
        !counting_values_shading[value, sample]=="40" && !counting_values_shading[value, sample]=="140" && 
        !counting_values_shading[value, sample]=="60" && !counting_values_shading[value, sample]=="160" && 
        !counting_values_shading[value, sample]=="80" && !counting_values_shading[value, sample]=="180")
    {
      final_count_for_plotting_shading[final_count_row,final_count_col] = counting_values_shading[value,sample]
    }
    value = value+1
  }
  value = 61
  final_count_col=7
  while (value<71)
  {
    if (!counting_values_shading[value, sample]=="0" && !counting_values_shading[value, sample]=="100" && 
        !counting_values_shading[value, sample]=="20" && !counting_values_shading[value, sample]=="120" && 
        !counting_values_shading[value, sample]=="40" && !counting_values_shading[value, sample]=="140" && 
        !counting_values_shading[value, sample]=="60" && !counting_values_shading[value, sample]=="160" && 
        !counting_values_shading[value, sample]=="80" && !counting_values_shading[value, sample]=="180")
    {
      final_count_for_plotting_shading[final_count_row,final_count_col] = counting_values_shading[value,sample]
    }
    value = value+1
  }
  value = 71
  final_count_col=8
  while (value<81)
  {
    if (!counting_values_shading[value, sample]=="0" && !counting_values_shading[value, sample]=="100" && 
        !counting_values_shading[value, sample]=="20" && !counting_values_shading[value, sample]=="120" && 
        !counting_values_shading[value, sample]=="40" && !counting_values_shading[value, sample]=="140" && 
        !counting_values_shading[value, sample]=="60" && !counting_values_shading[value, sample]=="160" && 
        !counting_values_shading[value, sample]=="80" && !counting_values_shading[value, sample]=="180")
    {
      final_count_for_plotting_shading[final_count_row,final_count_col] = counting_values_shading[value,sample]
    }
    value = value+1
  }
  value = 81
  final_count_col=9
  while (value<91)
  {
    if (!counting_values_shading[value, sample]=="0" && !counting_values_shading[value, sample]=="100" && 
        !counting_values_shading[value, sample]=="20" && !counting_values_shading[value, sample]=="120" && 
        !counting_values_shading[value, sample]=="40" && !counting_values_shading[value, sample]=="140" && 
        !counting_values_shading[value, sample]=="60" && !counting_values_shading[value, sample]=="160" && 
        !counting_values_shading[value, sample]=="80" && !counting_values_shading[value, sample]=="180")
    {
      final_count_for_plotting_shading[final_count_row,final_count_col] = counting_values_shading[value,sample]
    }
    value = value+1
  }
  value = 91
  final_count_col=10
  while (value<101)
  {
    if (!counting_values_shading[value, sample]=="0" && !counting_values_shading[value, sample]=="100" && 
        !counting_values_shading[value, sample]=="20" && !counting_values_shading[value, sample]=="120" && 
        !counting_values_shading[value, sample]=="40" && !counting_values_shading[value, sample]=="140" && 
        !counting_values_shading[value, sample]=="60" && !counting_values_shading[value, sample]=="160" && 
        !counting_values_shading[value, sample]=="80" && !counting_values_shading[value, sample]=="180")
    {
      final_count_for_plotting_shading[final_count_row,final_count_col] = counting_values_shading[value,sample]
    }
    value = value+1
  }
  value = 101
  final_count_col=11
  while (value<111)
  {
    if (!counting_values_shading[value, sample]=="0" && !counting_values_shading[value, sample]=="100" && 
        !counting_values_shading[value, sample]=="20" && !counting_values_shading[value, sample]=="120" && 
        !counting_values_shading[value, sample]=="40" && !counting_values_shading[value, sample]=="140" && 
        !counting_values_shading[value, sample]=="60" && !counting_values_shading[value, sample]=="160" && 
        !counting_values_shading[value, sample]=="80" && !counting_values_shading[value, sample]=="180")
    {
      final_count_for_plotting_shading[final_count_row,final_count_col] = counting_values_shading[value,sample]
    }
    value = value+1
  }
  value = 111
  final_count_col=12
  while (value<121)
  {
    if (!counting_values_shading[value, sample]=="0" && !counting_values_shading[value, sample]=="100" && 
        !counting_values_shading[value, sample]=="20" && !counting_values_shading[value, sample]=="120" && 
        !counting_values_shading[value, sample]=="40" && !counting_values_shading[value, sample]=="140" && 
        !counting_values_shading[value, sample]=="60" && !counting_values_shading[value, sample]=="160" && 
        !counting_values_shading[value, sample]=="80" && !counting_values_shading[value, sample]=="180")
    {
      final_count_for_plotting_shading[final_count_row,final_count_col] = counting_values_shading[value,sample]
    }
    value = value+1
  }
  value = 121
  final_count_col=13
  while (value<131)
  {
    if (!counting_values_shading[value, sample]=="0" && !counting_values_shading[value, sample]=="100" && 
        !counting_values_shading[value, sample]=="20" && !counting_values_shading[value, sample]=="120" && 
        !counting_values_shading[value, sample]=="40" && !counting_values_shading[value, sample]=="140" && 
        !counting_values_shading[value, sample]=="60" && !counting_values_shading[value, sample]=="160" && 
        !counting_values_shading[value, sample]=="80" && !counting_values_shading[value, sample]=="180")
    {
      final_count_for_plotting_shading[final_count_row,final_count_col] = counting_values_shading[value,sample]
    }
    value = value+1
  }
  value = 131
  final_count_col=14
  while (value<141)
  {
    if (!counting_values_shading[value, sample]=="0" && !counting_values_shading[value, sample]=="100" && 
        !counting_values_shading[value, sample]=="20" && !counting_values_shading[value, sample]=="120" && 
        !counting_values_shading[value, sample]=="40" && !counting_values_shading[value, sample]=="140" && 
        !counting_values_shading[value, sample]=="60" && !counting_values_shading[value, sample]=="160" && 
        !counting_values_shading[value, sample]=="80" && !counting_values_shading[value, sample]=="180")
    {
      final_count_for_plotting_shading[final_count_row,final_count_col] = counting_values_shading[value,sample]
    }
    value = value+1
  }
  value = 141
  final_count_col=15
  while (value<151)
  {
    if (!counting_values_shading[value, sample]=="0" && !counting_values_shading[value, sample]=="100" && 
        !counting_values_shading[value, sample]=="20" && !counting_values_shading[value, sample]=="120" && 
        !counting_values_shading[value, sample]=="40" && !counting_values_shading[value, sample]=="140" && 
        !counting_values_shading[value, sample]=="60" && !counting_values_shading[value, sample]=="160" && 
        !counting_values_shading[value, sample]=="80" && !counting_values_shading[value, sample]=="180")
    {
      final_count_for_plotting_shading[final_count_row,final_count_col] = counting_values_shading[value,sample]
    }
    value = value+1
  }
  value = 151
  final_count_col=16
  while (value<161)
  {
    if (!counting_values_shading[value, sample]=="0" && !counting_values_shading[value, sample]=="100" && 
        !counting_values_shading[value, sample]=="20" && !counting_values_shading[value, sample]=="120" && 
        !counting_values_shading[value, sample]=="40" && !counting_values_shading[value, sample]=="140" && 
        !counting_values_shading[value, sample]=="60" && !counting_values_shading[value, sample]=="160" && 
        !counting_values_shading[value, sample]=="80" && !counting_values_shading[value, sample]=="180")
    {
      final_count_for_plotting_shading[final_count_row,final_count_col] = counting_values_shading[value,sample]
    }
    value = value+1
  }
  value = 161
  final_count_col=17
  while (value<171)
  {
    if (!counting_values_shading[value, sample]=="0" && !counting_values_shading[value, sample]=="100" && 
        !counting_values_shading[value, sample]=="20" && !counting_values_shading[value, sample]=="120" && 
        !counting_values_shading[value, sample]=="40" && !counting_values_shading[value, sample]=="140" && 
        !counting_values_shading[value, sample]=="60" && !counting_values_shading[value, sample]=="160" && 
        !counting_values_shading[value, sample]=="80" && !counting_values_shading[value, sample]=="180")
    {
      final_count_for_plotting_shading[final_count_row,final_count_col] = counting_values_shading[value,sample]
    }
    value = value+1
  }
  value = 171
  final_count_col=18
  while (value<181)
  {
    if (!counting_values_shading[value, sample]=="0" && !counting_values_shading[value, sample]=="100" && 
        !counting_values_shading[value, sample]=="20" && !counting_values_shading[value, sample]=="120" && 
        !counting_values_shading[value, sample]=="40" && !counting_values_shading[value, sample]=="140" && 
        !counting_values_shading[value, sample]=="60" && !counting_values_shading[value, sample]=="160" && 
        !counting_values_shading[value, sample]=="80" && !counting_values_shading[value, sample]=="180")
    {
      final_count_for_plotting_shading[final_count_row,final_count_col] = counting_values_shading[value,sample]
    }
    value = value+1
  }
  value = 181
  final_count_col=19
  while (value<191)
  {
    if (!counting_values_shading[value, sample]=="0" && !counting_values_shading[value, sample]=="100" && 
        !counting_values_shading[value, sample]=="20" && !counting_values_shading[value, sample]=="120" && 
        !counting_values_shading[value, sample]=="40" && !counting_values_shading[value, sample]=="140" && 
        !counting_values_shading[value, sample]=="60" && !counting_values_shading[value, sample]=="160" && 
        !counting_values_shading[value, sample]=="80" && !counting_values_shading[value, sample]=="180")
    {
      final_count_for_plotting_shading[final_count_row,final_count_col] = counting_values_shading[value,sample]
    }
    value = value+1
  }
  value = 191
  final_count_col=20
  while (value<201)
  {
    if (!counting_values_shading[value, sample]=="0" && !counting_values_shading[value, sample]=="100" && 
        !counting_values_shading[value, sample]=="20" && !counting_values_shading[value, sample]=="120" && 
        !counting_values_shading[value, sample]=="40" && !counting_values_shading[value, sample]=="140" && 
        !counting_values_shading[value, sample]=="60" && !counting_values_shading[value, sample]=="160" && 
        !counting_values_shading[value, sample]=="80" && !counting_values_shading[value, sample]=="180")
    {
      final_count_for_plotting_shading[final_count_row,final_count_col] = counting_values_shading[value,sample]
    }
    value = value+1
  }
  value = 201
  final_count_col=21
  while (value<211)
  {
    if (!counting_values_shading[value, sample]=="0" && !counting_values_shading[value, sample]=="100" && 
        !counting_values_shading[value, sample]=="20" && !counting_values_shading[value, sample]=="120" && 
        !counting_values_shading[value, sample]=="40" && !counting_values_shading[value, sample]=="140" && 
        !counting_values_shading[value, sample]=="60" && !counting_values_shading[value, sample]=="160" && 
        !counting_values_shading[value, sample]=="80" && !counting_values_shading[value, sample]=="180")
    {
      final_count_for_plotting_shading[final_count_row,final_count_col] = counting_values_shading[value,sample]
    }
    value = value+1
  }
  value = 211
  final_count_col=22
  while (value<221)
  {
    if (!counting_values_shading[value, sample]=="0" && !counting_values_shading[value, sample]=="100" && 
        !counting_values_shading[value, sample]=="20" && !counting_values_shading[value, sample]=="120" && 
        !counting_values_shading[value, sample]=="40" && !counting_values_shading[value, sample]=="140" && 
        !counting_values_shading[value, sample]=="60" && !counting_values_shading[value, sample]=="160" && 
        !counting_values_shading[value, sample]=="80" && !counting_values_shading[value, sample]=="180")
    {
      final_count_for_plotting_shading[final_count_row,final_count_col] = counting_values_shading[value,sample]
    }
    value = value+1
  }
  value = 221
  final_count_col=23
  while (value<231)
  {
    if (!counting_values_shading[value, sample]=="0" && !counting_values_shading[value, sample]=="100" && 
        !counting_values_shading[value, sample]=="20" && !counting_values_shading[value, sample]=="120" && 
        !counting_values_shading[value, sample]=="40" && !counting_values_shading[value, sample]=="140" && 
        !counting_values_shading[value, sample]=="60" && !counting_values_shading[value, sample]=="160" && 
        !counting_values_shading[value, sample]=="80" && !counting_values_shading[value, sample]=="180")
    {
      final_count_for_plotting_shading[final_count_row,final_count_col] = counting_values_shading[value,sample]
    }
    value = value+1
  }
  value = 231
  final_count_col=24
  while (value<241)
  {
    if (!counting_values_shading[value, sample]=="0" && !counting_values_shading[value, sample]=="100" && 
        !counting_values_shading[value, sample]=="20" && !counting_values_shading[value, sample]=="120" && 
        !counting_values_shading[value, sample]=="40" && !counting_values_shading[value, sample]=="140" && 
        !counting_values_shading[value, sample]=="60" && !counting_values_shading[value, sample]=="160" && 
        !counting_values_shading[value, sample]=="80" && !counting_values_shading[value, sample]=="180")
    {
      final_count_for_plotting_shading[final_count_row,final_count_col] = counting_values_shading[value,sample]
    }
    value = value+1
  }
  sample = sample+1
}

### MAKING A HEATMAP ###
# Plot the collapsed population plot
pfdfilename <- paste("../PopInf_TCGA.pdf",sep="")
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
heatmap.2(final_count_for_plotting_shading,Colv=FALSE,dendrogram="none",scale="none",col=colors_custom,
          xlab="Chromsome",ylab="Sample", labRow=NA,
          labCol= c("Autosomes", "1", "2", "3", "4", "5", "6", "7", "8", "9", 
                    "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", 
                    "20", "21", "22", "X"),trace="none", breaks=breaks)
dev.off()
