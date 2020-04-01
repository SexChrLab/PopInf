#!/usr/bin/Rscript
### LOAD PACKAGES ###
if (!require("gplots")) {
  install.packages("gplots", dependencies = TRUE)
  library(gplots)
}
if (!require("RColorBrewer")) {
  install.packages("RColorBrewer", dependencies = TRUE)
  library(RColorBrewer)
}
library(gtools)
library(reshape2)
library(ggplot2)
library(ggpubr)
library(rlist)


### VARIABLES ###
# Path to inferred population report files. Will have 2 of these
pathtoresultsGTEx <- "/Users/angelataravella/Dropbox (ASU)/00_Lab_Research_Projects/PCA_tutorial_github/Main_analyses/For_Manuscript/01_GTEx/Results/Reports"
pathtoresultsTCGA <- "/Users/angelataravella/Dropbox (ASU)/00_Lab_Research_Projects/PCA_tutorial_github/Main_analyses/For_Manuscript/01_TCGA/Results/Reports"
# Path to reference panel sample list. This is the same as input for PopInf
pathtorefsampleinfo <- "/Users/angelataravella/Dropbox (ASU)/00_Lab_Research_Projects/PCA_tutorial_github/PopInf-master/Manuscript_Figures/Figure_01/INPUTS/ThousandGenomesSamples_AdmxRm_new_withdashes.txt"
# This is for the list of all the chromosomes that you intend to add to the 
# heatmap
chrstoanalyze <- c("All", "1", "2", "3", "4", "5", "6", "7", "8", "9", 
                   "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", 
                   "20", "21", "22", "X")
# File name for heat map with directory info
pfdfilename <- "/Users/angelataravella/Dropbox (ASU)/00_Lab_Research_Projects/PCA_tutorial_github/PopInf-master/Manuscript_Figures/Figure_02/Fig_02.pdf"


### FUNCTIONS ###
# 1. Get matrix for plotting. 
getmatforplot <- function(pathtoresults, chrstoanalyze) {
  ### READ IN DATA ###
  # Make a file list will all reslults text files from PopInf that you want to
  # add to the heat map
  resultsfiles <- list.files(path = pathtoresults,
                             pattern = "*.txt", full.names = T)
  # Order the list of files so that the chromosomes are in order from 1-end
  resultsfilessort <- mixedsort(resultsfiles)
  # Add information from all result files to this larger list
  allresults <- sapply(resultsfilessort, read.table, header = TRUE, sep="\t", as.is = TRUE)
  
  ### GENERATE THE TABLE TO ASSIGN VALUES TO EACH ASSIGNED INFERRED POPULATION ###
  # The number of rows in the matrix is equal to the number of samples in
  # the inferred ancestry report.
  nrowmat <- length(allresults[[1]])
  # We need a variable with the number of runs of PopInf (or number of chromosomes)
  # that will be plotted. This corresponds to the number of input files added to the
  # allresults list
  nchrtoanalyze <- dim(allresults) [2]
  
  # Make the matrix
  final_count_for_plotting_shading <- matrix(ncol=nchrtoanalyze, nrow=nrowmat)
  
  # We are going to fill in the plotting matrix, starting with the first
  # individual in each inferred ancestry report.
  
  # The Plot.Info column is the 9th column in the inferred ancestry report.
  fileColumn <- 9 
  # We need to iterate through all the samples (or the number of rows in the)
  # matrix. Since a while loop with ">" will be used we need to go to nrowmat+1 
  toiterate <- nrowmat+1 
  
  # Loop through all files in the list
  for (i in 1:nchrtoanalyze) {
    sample <- 1
    toiterate <- nrowmat+1 
    chrnum <- i 
    
    # While we are still analyzing all the samples in the inferred ancestry 
    # report, pull the Plot Info for that specific individual based on 
    # indexing the allresults list.
    while (sample<toiterate) 
    {
      #fileColumn <- 9 #Plot.Info add 13 after every chr
      popcalled <- allresults[[fileColumn]][sample]
      popnumber <- master.num.l[[popcalled]] # get corresponding number to popcalled
      final_count_for_plotting_shading[sample,chrnum] <- popnumber # add pop number to matrix
      sample<-sample+1 # move on to next sample
    }
    
    # move to the next files Plot.Info column. There are a total of 13 columns in 
    # PopInf's inferred ancestry report, so we'll need to skip 13 columns to get 
    # there.
    fileColumn <- fileColumn + 13
    
  }
  
  # Prep matrix for plotting
  # Sort by first col
  #final_count_for_plotting_shading_sort <- final_count_for_plotting_shading[order(final_count_for_plotting_shading[,1]), ]
  # Add col names to match chromosomes analyzed. This will make lable plotting 
  # easier.
  #colnames(final_count_for_plotting_shading_sort) <- chrstoanalyze
  # Use melt function to reshape data for plotting using ggplot2
  #final_count_for_plotting_shading_sort_melt <- melt(final_count_for_plotting_shading_sort)
  
  # things to return here
  #return(final_count_for_plotting_shading_sort_melt)
  return(final_count_for_plotting_shading)
}

# 2. Sort and melt matrix for plotting heatmaps
sortmeltmat <- function(yourmatrix){
  # Sort by first col
  yourmatrix_sort <- yourmatrix[order(yourmatrix[,1]), ]
  # Add col names to match chromosomes analyzed. This will make lable plotting 
  # easier.
  colnames(yourmatrix_sort) <- chrstoanalyze
  # Use melt function to reshape data for plotting using ggplot2
  yourmatrix_sort_melt <- melt(yourmatrix_sort)
  
  return(yourmatrix_sort_melt)
  
}

# 3. Get matrix of individials with variable population assignment 
getpopmat <- function(pathtoresults, chrstoanalyze) {
  ### READ IN DATA ###
  # Make a file list will all reslults text files from PopInf that you want to
  # add to the heat map
  resultsfiles <- list.files(path = pathtoresults,
                             pattern = "*.txt", full.names = T)
  # Order the list of files so that the chromosomes are in order from 1-end
  resultsfilessort <- mixedsort(resultsfiles)
  # Add information from all result files to this larger list
  allresults <- sapply(resultsfilessort, read.table, header = TRUE, sep="\t", as.is = TRUE)
  
  ### GENERATE THE TABLE TO ASSIGN VALUES TO EACH ASSIGNED INFERRED POPULATION ###
  # The number of rows in the matrix is equal to the number of samples in
  # the inferred ancestry report.
  nrowmat <- length(allresults[[1]])
  # We need a variable with the number of runs of PopInf (or number of chromosomes)
  # that will be plotted. This corresponds to the number of input files added to the
  # allresults list
  nchrtoanalyze <- dim(allresults) [2]
  
  # Make the matrix
  pops_mat <- matrix(ncol=nchrtoanalyze, nrow=nrowmat)
  
  # We are going to fill in the plotting matrix, starting with the first
  # individual in each inferred ancestry report.
  
  # The Plot.Info column is the 9th column in the inferred ancestry report.
  fileColumn <- 9 
  # We need to iterate through all the samples (or the number of rows in the)
  # matrix. Since a while loop with ">" will be used we need to go to nrowmat+1 
  toiterate <- nrowmat+1 
  
  # Loop through all files in the list
  for (i in 1:nchrtoanalyze) {
    sample <- 1
    toiterate <- nrowmat+1 
    chrnum <- i 
    
    # While we are still analyzing all the samples in the inferred ancestry 
    # report, pull the Plot Info for that specific individual based on 
    # indexing the allresults list.
    while (sample<toiterate) 
    {
      #fileColumn <- 9 #Plot.Info add 13 after every chr
      popcalled <- allresults[[fileColumn]][sample]
      popnumber <- master.pop.genpop.l[[popcalled]] # get corresponding number to popcalled
      pops_mat[sample,chrnum] <- popnumber # add pop number to matrix
      sample<-sample+1 # move on to next sample
    }
    
    # move to the next files Plot.Info column. There are a total of 13 columns in 
    # PopInf's inferred ancestry report, so we'll need to skip 13 columns to get 
    # there.
    fileColumn <- fileColumn + 13
    
  }
  
  return(pops_mat)
}

# 4. Convert pops_mat to number matrix using output from function 1 and 3
# getmatforplot, getmatforplotvariable
getmatforplotvariablenumbers <- function(fullnummat, fullpopmat) {
  rowswithmissmatches <- list()
  fullpopmat 
  for(r in 1:nrow(fullpopmat)) {
    fullpopmat[r,]
    
    for(c in 1:ncol(fullpopmat)) {
      if (c > 1) {
        if (as.character(fullpopmat[r, c]) == as.character(fullpopmat[r, c-1])) {
        } else  {
          rowswithmissmatches <- list.append(rowswithmissmatches, r)
        } 
      }
    }
  }
  
  unique(rowswithmissmatches)
  # sub set original number matrix by multiple rows (which we should get which ones to keep from above)
  rowswithmissmatchesun <- unlist(unique(rowswithmissmatches))
  varmatnumbers <- fullnummat[rowswithmissmatchesun, ]
  
  return(varmatnumbers)
}


## SET UP COLOR KEY ##
# With the known ref info make a master color key. This is all the potential 
# combinations of ancestry that PopInf call given the information from the
# reference panel populations.

# Reference sample file. This will be used in coloring the heatmap so that
# figure 1 and 2 are comparable.
known_population_file <- read.table(pathtorefsampleinfo, header = FALSE, sep = "\t")

ref.pops <- as.list(levels(known_population_file$V3)) 
ref.cols <- as.list(brewer.pal(n = length(ref.pops), name = "Set1"))
master.col.l<- list() # this will need to be outside the loop
popname.l <- list() # for legend
master.num.l <- list() # for numbering matrix

num1 <- 4
num2 <- 24
num3 <- 44
num4 <- 64

# num.col.l will be used for setting numbers (inferred population) to colors 
num.col.l <- list()

# master list of pop details and general pop name. This will be used for finding 
# individuals with variable population assignments
master.pop.genpop.l <- list()

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
  
  master.num.l[[popname1SD]] <- num1; master.num.l
  master.num.l[[popname2SD]] <- num2; master.num.l
  master.num.l[[popname3SD]] <- num3; master.num.l
  master.num.l[[popnamemore3SD]] <- num4; master.num.l
  
  popname.l[[popname1SD]] <- popname1SD; popname.l
  popname.l[[popname2SD]] <- popname2SD; popname.l
  popname.l[[popname3SD]] <- popname3SD; popname.l
  popname.l[[popnamemore3SD]] <- popnamemore3SD; popname.l
  
  num.col.l[[as.character(num1)]] <- color1SD; num.col.l
  num.col.l[[as.character(num2)]] <- color2SD; num.col.l
  num.col.l[[as.character(num3)]] <- color3SD; num.col.l
  num.col.l[[as.character(num4)]] <- colormore3SD; num.col.l
  
  master.pop.genpop.l[[popname1SD]] <- ref.pops[[i]]; master.pop.genpop.l
  master.pop.genpop.l[[popname2SD]] <- ref.pops[[i]]; master.pop.genpop.l
  master.pop.genpop.l[[popname3SD]] <- ref.pops[[i]]; master.pop.genpop.l
  master.pop.genpop.l[[popnamemore3SD]] <- ref.pops[[i]]; master.pop.genpop.l
  
  
  num1 <- num4 + 24
  num2 <- num4 + 44
  num3 <- num4 + 64
  num4 <- num4 + 84
}

# Add admixed and reference sample colors to the list
master.col.l[["Admixed"]] <- "#333333"; master.col.l # this color will always be the same, so it is hard coded

#master.num.l[["Admixed"]] <- num4+20 ; master.num.l 
master.num.l[["Admixed"]] <- 0 ; master.num.l # make this val 0 so it fall at the bottom of the plot

# for lgend 
popname.l[["Admixed"]] <- "Admixed"; popname.l
popname.convert <- unlist(popname.l, use.names=F) #for legend

# convert list back to character retaining names
master.col.convert <- unlist(master.col.l, use.names=T) # this will be used for the legend
#master.num.convert <- unlist(master.num.l, use.names=T) #dont think this is needed anymore

#num.col.l[[as.character(num4+20)]] <- "#333333" ; num.col.l 
num.col.l[[as.character(0)]] <- "#333333" ; num.col.l 

num.col.convert <- unlist(num.col.l, use.names=T) # this is used for coloring the plot

# add admixed to pop list
master.pop.genpop.l[["Admixed"]] <- "Admixed"; master.pop.genpop.l


### SET UP MATRICIES FOR PLOTTING ALL SAMPLES ###
# 1. GTEx all samples
# Get matrix with number data for each assign pop for all individuals
GTExmatrix <- getmatforplot(pathtoresultsGTEx, chrstoanalyze)
# Prep matrix for plotting
GTExmatrix_sort_melt <- sortmeltmat(GTExmatrix)

# 2. TCGA all samples
# Get matrix with number data for each assign pop for all individuals
TCGAmatrix <- getmatforplot(pathtoresultsTCGA, chrstoanalyze)
# Prep matrix for plotting
TCGAmatrix_sort_melt <- sortmeltmat(TCGAmatrix)


### SET UP MATRICIES FOR PLOTTING SAMPLES WITH VARIABLE ANCESTRY ###
# Steps to get variable heat maps 
# 3. GTEx samples with variable ancestry
# Get matrix with number data for each assign pop for all individuals
GTExmatrix <- getmatforplot(pathtoresultsGTEx, chrstoanalyze)
# get population matrix
GTExmatrixpops <- getpopmat(pathtoresultsGTEx, chrstoanalyze)
# get matrix with individuals with variable ancestry
GTExmatrixvarpops <- getmatforplotvariablenumbers(GTExmatrix, GTExmatrixpops)
# Prep matrix for plotting
GTExmatrixvarpops_sort_melt <- sortmeltmat(GTExmatrixvarpops)

# 4. TCGA samples with variable ancestry
# Get matrix with number data for each assign pop for all individuals
TCGAmatrix <- getmatforplot(pathtoresultsTCGA, chrstoanalyze)
# get population matrix
TCGAmatrixpops <- getpopmat(pathtoresultsTCGA, chrstoanalyze)
# get matrix with individuals with variable ancestry
TCGAmatrixvarpops <- getmatforplotvariablenumbers(TCGAmatrix, TCGAmatrixpops)
# Prep matrix for plotting
TCGAmatrixvarpops_sort_melt <- sortmeltmat(TCGAmatrixvarpops)


### PLOT HEAT MAPS ###
#pdf("Fig2.CMYKcolor.NEW.pdf", width = 12, height = 12, colormodel="cmyk")
pdf(pfdfilename, 8,8, colormodel="cmyk")
# Plot legend on separate page
plot(1, type="n", axes=FALSE, xlab="", ylab="", main = "Key")
legend("top",bty="n",legend=popname.convert, 
       fill=master.col.convert, 
       cex=.7, ncol = 3, 
       title=expression(bold("Inferred Ancestry")))

# Plot 1. GTEx all samples
GTExFull <- ggplot(GTExmatrix_sort_melt, aes(Var2, Var1, fill= factor(value))) + 
  geom_tile() + 
  scale_fill_manual(values=num.col.convert) +
  scale_y_continuous(expand = expand_scale(mult = c(0, .1))) +
  theme(axis.title.x = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.x = element_text(angle = 45, hjust = 1),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank(),
        panel.background = element_blank(),
        legend.position = "none")

# Plot 2. TCGA all samples
TCGAFull <- ggplot(TCGAmatrix_sort_melt, aes(Var2, Var1, fill= factor(value))) + 
  geom_tile() + 
  scale_fill_manual(values=num.col.convert) +
  scale_y_continuous(expand = expand_scale(mult = c(0, .1))) +
  theme(axis.title.x = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.x = element_text(angle = 45, hjust = 1),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank(),
        panel.background = element_blank(),
        legend.position = "none")

# Plot 3. GTEx samples with variable ancestry
GTExVariable <- ggplot(GTExmatrixvarpops_sort_melt, aes(Var2, Var1, fill= factor(value))) + 
  geom_tile() + 
  scale_fill_manual(values=num.col.convert) +
  scale_y_continuous(expand = expand_scale(mult = c(0, .1))) +
  theme(axis.title.x = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.x = element_text(angle = 45, hjust = 1),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank(),
        panel.background = element_blank(),
        legend.position = "none")

# Plot 4. TCGA samples with variable ancestry
TCGAVariable <- ggplot(TCGAmatrixvarpops_sort_melt, aes(Var2, Var1, fill= factor(value))) + 
  geom_tile() + 
  scale_fill_manual(values=num.col.convert) +
  scale_y_continuous(expand = expand_scale(mult = c(0, .1))) +
  theme(axis.title.x = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.x = element_text(angle = 45, hjust = 1),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank(),
        panel.background = element_blank(),
        legend.position = "none")

# Add all plots onto 1 page
ggarrange(GTExFull, GTExVariable, TCGAFull, TCGAVariable, 
          ncol = 2, nrow = 2, labels = c("A", "B", "C", "D"))

dev.off()
