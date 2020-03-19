#!/usr/bin/Rscript
# Authors: Angela Taravella and Anagha Deshpande
#usage: pca_inferred_ancestry_report.R evec_file eval_file reference_panel_info.txt unkpop_info.txt output_fileSetemName output_inferredPopReport_fileStemName


### LOAD PACKAGES ###
library("car")
library("plotrix")
library("RColorBrewer")
library("ggforce")


### DEFINE FUNCTIONS ###
# Function 1: Get centroid coordinates and radii for each population cluster  #
circle_function_noplot <- function(continent) {
  continent_of_choice <- continent
  continent_of_choice_data <- evec_file_full[evec_file_full$V3.x %in% continent_of_choice,]
  mean_x <- mean(continent_of_choice_data$V2.y)
  mean_y <- mean(continent_of_choice_data$V3.y)
  test <- sqrt( ((mean_x - (continent_of_choice_data$V2.y))^2) + ((mean_y - (continent_of_choice_data$V3.y))^2) )
  radius <- sqrt(sum((test-0)^2/(length(test)-1))) # this looks good
  my_list <- list("radius" = radius, "mean_x" = mean_x, "mean_y" = mean_y)
  return(my_list)
}


### SET UP COMMAND INPUTS ###
args = commandArgs(trailingOnly=TRUE)
evec = args[1]
eval = args[2]
pop = args[3]
unkpop = args[4]
out = args[5]
out_inferred_report = args[6]


# THIS IS FOR TESTING PURPOSES ONLY AND SHOULD BE DELETED WHEN NO LONGER NEEDED!!!
#evec_file <- read.table("gtex/merge_all_chr_reference_panel_unknown_set_SNPs_no_missing_plink_LDprune_Fix2.evec", header = FALSE)
#eval_file <- read.table("gtex/merge_all_chr_reference_panel_unknown_set_SNPs_no_missing_plink_LDprune.eval", header = FALSE)
#known_population_file <- read.table("ThousandGenomesSamples_RefPanel.txt", header = FALSE, sep = "\t")
#unkownpop_file <- read.table("GTExSamples.txt", header = FALSE, sep = "\t")


### READ IN DATA ###
evec_file <- read.table(evec, header = FALSE)
eval_file <- read.table(eval, header = FALSE)
known_population_file <- read.table(pop, header = FALSE, sep = "\t")
unkownpop_file <- read.table(unkpop, header = FALSE, sep = "\t")

print("All data has been imported into the program")


### SET UP INITIAL DATA FRAMES ###
known_sample_info_merge <- merge(known_population_file, evec_file,  by.x = "V1", by.y = "V1") 
UnkownPop_data_WithInfo <- merge(unkownpop_file, evec_file, by.x = "V1", by.y = "V1")
evec_file_full <- rbind(known_sample_info_merge, UnkownPop_data_WithInfo)


### CALCULATE PERCENT VARIANCE EXPLAINED FOR EACH PC ###
eval_file$Perc_Var<- prop.table(eval_file$V1)*100


### SET UP OUTPUT INFERRED POPULATION REPORT ###
inferredpopreport <- paste(out_inferred_report,".txt",sep="")


### INFERRED ANCESTRY REPORT ###
print("Inferred population report has started")
### Store relevant information in matricies ###
# Stores values of radius, mean X, and mean Y in a martrix called "mat_meanx_meany_rad"
test_vector <- levels(known_sample_info_merge$V3.x)
n <- length(test_vector)
mat_meanx_meany_rad <- matrix(ncol=4, nrow=n)
test_vector <- levels(known_population_file$V3)
for (i in 1:length(test_vector)) {
  my_list <- circle_function_noplot(test_vector[i])
  mat_meanx_meany_rad[i,] <- c(test_vector[i],my_list$mean_x,my_list$mean_y,my_list$radius)
}

# Find the mid point (X and Y coordinates) for each pairwise comparison and store in a matrix called "mat_meanx_meany_compares"
n_com <- factorial(length(test_vector))/((factorial((length(test_vector)-2)))*factorial(2))
mat_meanx_meany_compares <- matrix(ncol=4, nrow=n_com)
combination_num <- 0

for (i in 1:length(test_vector)) {
  num <- i + 1
  for (num in i:length(test_vector)) {
    if (num > length(test_vector)) {} # we will skip this index because it is past the length of our vector and uninformative (no data)
    else {
      if (test_vector[i] == test_vector[num]) {} #skip this comparison. This is a self-self comparison
      else {
        comparison <- c(test_vector[i], test_vector[num])
        # so now we have to get our values we need to find midpoints
        my_list <- circle_function_noplot(test_vector[i])
        test_mean_x_first <- my_list$mean_x
        test_mean_y_first <- my_list$mean_y
        
        my_list <- circle_function_noplot(test_vector[num])
        test_mean_x_second <- my_list$mean_x
        test_mean_y_second <- my_list$mean_y
        
        x_mid <- (test_mean_x_first+test_mean_x_second)/2
        y_mid <- (test_mean_y_first+test_mean_y_second)/2
        
        #points(x_mid,y_mid, col = "black", pch = 4)
        comparison_name <- paste(test_vector[i], test_vector[num], sep = "-")
        combination_num <- combination_num + 1
        mat_meanx_meany_compares[combination_num,] <- c(comparison_name,x_mid,y_mid,0)  # need a fourth column for merging with other matrix. I will add 0 to the 4th column
      }
    }
  }
}


### Generate inferred population report ###
# Below makes the empty data frame with the correct number of rows and columns 
# with informative information.
row_num <- length(UnkownPop_data_WithInfo[,1])
col_num <- length(test_vector) + 9 # CHANGE TO 9 TO ADD PLOT INFO COL
df <- data.frame(matrix(ncol = col_num, nrow = row_num))
vector_col_names <- c("Sample", "Confident Inferred Population: 1SD",
                      "Confident Inferred Population: 2SD",
                      "Confident Inferred Population: 3SD", "Admixed (Y/N)", 
                      "Admixed Populations", "Uncertain (Y/N)",
                      "Uncertain - Closest Population", "Plot Info"
                      )
for (i in 1:length(test_vector)) {
  col_name_cluster_i <- paste("Distance to cluster", test_vector[i], sep = " ")
  vector_col_names <- c(vector_col_names, col_name_cluster_i)
}
colnames(df) <- vector_col_names


# This is looping through each individual in UnkownPop_data_WithInfo (so each 
# unknown sample) and see if they are within 3 standard deviations to a known
# population. If not, the program will see how close that individual is to
# a mid point between 2 populations and if that is closer than any population's 
# centroid, it will be called as the two populations of that midpoint. If not, 
# then that individual will be called uncertain and then we will specify the 
# closest population centroid.

# Begin with a 0 iterator so that we can loop through all individuals
iterator <- 0
for (i in UnkownPop_data_WithInfo[,1]) {
  vector_to_add_df <- c()
  iterator <- iterator + 1
  sample_i <- paste(UnkownPop_data_WithInfo[iterator,1])
  pc_x <- UnkownPop_data_WithInfo[iterator,4]
  pc_y <-  UnkownPop_data_WithInfo[iterator,5]
  
  vector_to_add_df <- c(sample_i)
  
  inferred_pop_1SD <- c()
  inferred_pop_2SD <- c()
  inferred_pop_3SD <- c()
  
  admixed_y_n <- c()
  admixed_detail <- c()
  uncertain_y_n <- c()
  uncertain_detail <- c()
  
  plot_info <- c()
  
  test_all_for_ans_1SD <- FALSE
  test_all_for_ans_2SD <- FALSE
  test_all_for_ans_3SD <- FALSE
  
  for (cluster in 1:length(mat_meanx_meany_rad[,1])) {
    x <- as.numeric(mat_meanx_meany_rad[cluster,2])
    y <- as.numeric(mat_meanx_meany_rad[cluster,3])
    dist_i_to_cluster_centriod <- sqrt( ((x - pc_x)^2) + ((y - pc_y)^2) )
    
    sd_1 <- as.numeric(mat_meanx_meany_rad[cluster,4])
    if (dist_i_to_cluster_centriod <= sd_1) {
      test_all_for_ans_1SD <- TRUE
      inferred_pop_1SD <- paste(inferred_pop_1SD, mat_meanx_meany_rad[cluster,1], sep = "")
      admixed_y_n <- "N" # if a sample falls within 1 sd of a pop, then it is not admixed
      uncertain_y_n <- "N" # and it is not uncertain
      admixed_detail <- "-"
      uncertain_detail <- "-"
    }
    
    sd_2 <- as.numeric(mat_meanx_meany_rad[cluster,4]) * 2
    if (dist_i_to_cluster_centriod <= sd_2) {
      test_all_for_ans_2SD <- TRUE
      if (is.null(inferred_pop_2SD)) {
        inferred_pop_2SD <- paste(inferred_pop_2SD, mat_meanx_meany_rad[cluster,1], sep = "")
        admixed_y_n <- "N" # if a sample falls within 1 sd of a pop, then it is not admixed
        uncertain_y_n <- "N" # and it is not uncertain
        admixed_detail <- "-"
        uncertain_detail <- "-"
      } else {
        inferred_pop_2SD <- paste(inferred_pop_2SD, mat_meanx_meany_rad[cluster,1], sep = "-")
        admixed_y_n <- "Y" # if a sample falls within 2 sd of 2 pops, then it is admixed
        uncertain_y_n <- "N" 
        admixed_detail <- inferred_pop_2SD
        uncertain_detail <- "-"
      }
    }
    
    sd_3 <- as.numeric(mat_meanx_meany_rad[cluster,4]) * 3
    if (dist_i_to_cluster_centriod <= sd_3) {
      test_all_for_ans_3SD <- TRUE
      if (is.null(inferred_pop_3SD)) {
        inferred_pop_3SD <- paste(inferred_pop_3SD, mat_meanx_meany_rad[cluster,1], sep = "")
        admixed_y_n <- "N" # if a sample falls within 1 sd of a pop, then it is not admixed
        uncertain_y_n <- "N" # and it is not uncertain
        admixed_detail <- "-"
        uncertain_detail <- "-"
      } else {
        inferred_pop_3SD <- paste(inferred_pop_3SD, mat_meanx_meany_rad[cluster,1], sep = "-")
        admixed_y_n <- "Y" # if a sample falls within 3 sd of 2 pops, then it is admixed
        uncertain_y_n <- "N" 
        admixed_detail <- inferred_pop_3SD
        uncertain_detail <- "-"
      }
        
    }
    
  }
  
  # Plot info specification here.
  if(test_all_for_ans_1SD){
    plot_info <- paste(inferred_pop_1SD, " (1 sd)", sep = "")
  } else if (test_all_for_ans_2SD) {
    plot_info <- paste(inferred_pop_2SD, " (2 sd)", sep = "")
  } else {
    plot_info <- paste(inferred_pop_3SD, " (3 sd)", sep = "")
  }
 
  # If fall within 2 or 3 sd from 2 pops, then admixed
  if(!is.null(admixed_y_n) && admixed_y_n == "Y"){
    plot_info <- "Admixed"
  }
  
  if (!test_all_for_ans_1SD) {
    inferred_pop_1SD <- "-"
  }
  if (!test_all_for_ans_2SD) {
    inferred_pop_2SD <- "-"
  }
  if (!test_all_for_ans_3SD) {
    inferred_pop_3SD <- "-"
  }
  
  vector_to_add_df <- c(vector_to_add_df, inferred_pop_1SD, inferred_pop_2SD, inferred_pop_3SD)
  
  # If the individual does not fall within 3SD of any cluster, the script will 
  # compare the distance from the centroid of all reference populations with
  # distance from midpoints of all pairwise reference populations. 
  cat_points <- rbind(mat_meanx_meany_rad, mat_meanx_meany_compares)
  n_all <- length(cat_points[,1])
  com_all_pnts <- matrix(ncol=2, nrow=n_all)
  if (inferred_pop_3SD == "-"){
    for (test_all_pts in 1:length(cat_points[,1])) {
      if (cat_points[test_all_pts,4] != 0){
        x <- as.numeric(cat_points[test_all_pts,2])
        y <- as.numeric(cat_points[test_all_pts,3])
        dist_i_to_centroid <- sqrt( ((x - pc_x)^2) + ((y - pc_y)^2) )
        dist_i_to_pnt <- dist_i_to_centroid  # just centroid
      } else {
        x <- as.numeric(cat_points[test_all_pts,2])
        y <- as.numeric(cat_points[test_all_pts,3])
        dist_i_to_pnt <- sqrt( ((x - pc_x)^2) + ((y - pc_y)^2) )
      }
      # then here put finding the lowest value and getting the less_rest_inf_pop from com_all_pnts[index_num]. 
      com_all_pnts[test_all_pts,] <- c(cat_points[test_all_pts,1],format(as.numeric(dist_i_to_pnt), scientific=F))
    }
    index_num <- which(com_all_pnts == min(com_all_pnts)) - n_all

    #  Add info for if admixed or uncertain to df    
    if(com_all_pnts[index_num] %in% mat_meanx_meany_compares){
      admixed_y_n <- "Y"
      admixed_detail <- com_all_pnts[index_num]
      uncertain_y_n <- "N"
      uncertain_detail <- "-"
      plot_info <- "Admixed"
    } else {
      admixed_y_n <- "N"
      admixed_detail <- "-"
      uncertain_y_n <- "Y"
      uncertain_detail <- com_all_pnts[index_num]
      plot_info <- paste("Uncertain (", uncertain_detail, ")", sep = "")
    }
  } 
  
  vector_to_add_df <- c(vector_to_add_df, admixed_y_n, admixed_detail, uncertain_y_n, uncertain_detail, plot_info)
  
  for (cluster in 1:length(mat_meanx_meany_rad[,1])) {
    x <- as.numeric(mat_meanx_meany_rad[cluster,2])
    y <- as.numeric(mat_meanx_meany_rad[cluster,3])
    dist_i_to_cluster_centriod <- sqrt( ((x - pc_x)^2) + ((y - pc_y)^2) )
    cluster_dist_i <- format(round(dist_i_to_cluster_centriod, 5), nsmall = 5)
    vector_to_add_df <- c(vector_to_add_df, cluster_dist_i)
  }
  
  df[iterator, ] = vector_to_add_df
}

write.table(df, inferredpopreport, sep = "\t", quote = F, row.names = F)


### SET UP OUTPUT PDF ###
pfdfilename <- paste(out,".pdf",sep="")
pdf(pfdfilename, width = 8, height = 8) #save as pdf, with size 8x8


### PLOTTING ###
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


## Set up inputs for plotting ##
# 1. Grab relevant info from df and unkownpop_file to merge. 
forplotting <- as.data.frame(unkownpop_file)
names(forplotting)[1]<-paste("Sample")
names(forplotting)[2]<-paste("Sex")
names(forplotting)[3]<-paste("SampleInfo")
forplottinginfo <- df[c("Sample", "Plot Info")] # change to Plot Info
forplotting.unk <- merge(forplotting, forplottinginfo,  by = "Sample")
names(forplotting.unk)[4]<-paste("PlotInfo")

# 2. This is the reference panel info needed for plotting
forplotting.refpan <- as.data.frame(known_population_file)
forplotting.refpan <- cbind(forplotting.refpan, PlotInfo="Reference Samples")
names(forplotting.refpan)[1]<-paste("Sample")
names(forplotting.refpan)[2]<-paste("Sex")
names(forplotting.refpan)[3]<-paste("SampleInfo")

# 3. Merge plotting info with evector file
new_known_sample_info_merge <- merge(forplotting.refpan, evec_file,  by.x = "Sample", by.y = "V1")
new_UnkownPop_data_WithInfo <- merge(forplotting.unk, evec_file, by.x = "Sample", by.y = "V1")
new_evec_file_full <- rbind(new_known_sample_info_merge, new_UnkownPop_data_WithInfo)

## Plot PCAs ##
# 1. Output common legend
plot(1, type="n", axes=FALSE, xlab="", ylab="", main = "Key")
legend('topleft', bty="n", legend = c(popname.convert), fill = c(master.col.convert),
       cex = 1, title=expression(bold("Inferred Ancestry")), ncol = 3)
legend('bottomleft', bty="n", legend = c(levels(evec_file_full$V2.x)),
       cex = 1, pch = c(0, 1)[evec_file_full$V2.x], title=expression(bold("Genetic Sex")))
legend('bottomright', bty="n", legend = c("Cluster Centroid",
                                          "1, 2, and 3 Standard Deviations from Cluster Mean"#,
                                          #"Pair-wise Cluster Mid Points"
),
cex = 1, pch = c(3, 1, 4))

# 2. Plot PC 1 and 2 with centroid, and 1-3 standard deviations
# Get centroid and 1-3 sd cordinates to plot and store that info in
# data frame
circleinfo1sd <- data.frame(x0 = as.numeric(mat_meanx_meany_rad[,2]),
                            y0 = as.numeric(mat_meanx_meany_rad[,3]),
                            r = as.numeric(mat_meanx_meany_rad[,4]))
circleinfo2sd <- data.frame(x0 = as.numeric(mat_meanx_meany_rad[,2]),
                            y0 = as.numeric(mat_meanx_meany_rad[,3]),
                            r = as.numeric(mat_meanx_meany_rad[,4])*2)
circleinfo3sd <- data.frame(x0 = as.numeric(mat_meanx_meany_rad[,2]),
                            y0 = as.numeric(mat_meanx_meany_rad[,3]),
                            r = as.numeric(mat_meanx_meany_rad[,4])*3)

circleinfo <- rbind(circleinfo1sd, circleinfo2sd, circleinfo3sd)

# Get pc 1 and 2 variance explained (for x and y axis labeling)
pc1 <- eval_file[1,2]
pc1 <- round(pc1, digits = 2)
axis_pc1 <- paste("PC1", " (",pc1,"%)",sep="")
pc2 <- eval_file[2,2]
pc2 <- round(pc2, digits = 2) # round so number doesnt have a lot of decimal places
axis_pc2 <- paste("PC2"," (",pc2,"%)",sep="")
ggplot() + geom_point(aes(x=V2, y=V3, shape=Sex, color=PlotInfo), size = 2, data = new_evec_file_full) + 
  scale_color_manual(values = master.col.convert) + 
  scale_shape_manual(values=c(16, 15))+
  theme_classic() + 
  labs(x=axis_pc1, y=axis_pc2) + 
  labs(color = "Inferred Ancestry", shape = "Sex") + 
  geom_circle(aes(x0=x0, y0=y0, r=r), linetype = "dashed", data = circleinfo) +
  geom_point(aes(x=x0, y=y0), shape=3 , data = circleinfo1sd) +
  theme(legend.position="none", 
        #plot.margin=unit(c(1,1,1,1),"cm"),
        #axis.text.x=element_text(size=rel(1.5)),
        #axis.text.y=element_text(size=rel(1.5)),
        text = element_text(size=16)) + coord_fixed()

# 3. Plot PC 1-10 
# Plot the graphs of the first 10 PCs
i <- 1
a <- 0
pc1 <- 0
pc2 <- 0
while (i<10)
{
  j <- 4 + a
  z <- 5 + a
  pc1 <- eval_file[i,2]
  pc1 <- round(pc1, digits = 2)
  axis_pc1 <- paste("PC",i," (",pc1,"%)",sep="")
  pc2 <- eval_file[j,2]
  pc2 <- round(pc2, digits = 2) # round so number doesnt have a lot of decimal places
  axis_pc2 <- paste("PC",i+1," (",pc2,"%)",sep="")
  p <- ggplot() + geom_point(aes(x=evec_file_full[,j], y=evec_file_full[,z], shape=Sex, color=PlotInfo), size = 2, data = new_evec_file_full) + 
    scale_color_manual(values = master.col.convert) + 
    scale_shape_manual(values=c(16, 15))+
    theme_classic() + 
    labs(x=axis_pc1, y=axis_pc2) + 
    labs(color = "Inferred Ancestry", shape = "Sex") +
    theme(legend.position="none", 
          plot.margin=unit(c(1,1,1,1),"cm"),
          text = element_text(size=16),
          aspect.ratio=1
          )  #+ coord_fixed()
  print(p)
  i <- i+2
  a <- a + 1
  
}

dev.off()
