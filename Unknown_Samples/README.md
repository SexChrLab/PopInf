# Prepare Unknown Samples
This document will guide you through preparing your unknown sample VCF (variant call format) files for input into PopInf. This tutorial for preparing the unknown panel files can be used for any data set that you want. We provide test data in this folder.

## What you need to prepare the unknown panel
You will need the following to prepare the unknown panel:
1. High performance computer (the reference files will likely be very large if you are analyzing sites across the entire genome).
2. VCF files for the unknown panel.
3. Unknown individuals sample information to compile a sample list.

## Step 1: Separate your VCF files by chromosome
If your VCF files for the unknown panel are not already separated by chromosome, you can use the following commands to separate them. PopInf will only accept VCF files separated by chromosome.

```
for i in {1..22}
do
	vcftools --gzvcf /path/to/unknown_panel_VCF.vcf.gz --chr ${i} --recode --stdout | bgzip -c > /path/to/chr${i}_unknown_panel_VCF.vcf.gz
	tabix -p vcf /path/to/chr${i}_unknown_panel_VCF.vcf.gz
done

```

## Step 2: Prepare the sample information text file
To successfully run PopInf, you must have a text file containing the sample information for the unknown panel. The first column must specify the sample names. The second column must specify the biological sex of each sample. Finally, the third column must specify the population. Since this is the unknown panel, "UNK" will be acceptable in this column. See an example in `Sample_Information` folder.

The sample information text file for the test VCFs in this folder is located in the `Sample_Information` folder and the file name is `ThousandGenomesSamples_Admx_samples.txt`

Once these steps are complete, the unknown panel files are prepped and ready to be used in PopInf.
