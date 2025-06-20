# 03_sort_index_bam.R

# Laad Rsamtools — dit gebruik je om BAM-bestanden te sorteren en te indexeren voor downstream analyse
library(Rsamtools)

# Lijst met sample-namen
samples <- c("RA1", "RA2", "RA3", "RA4", "CTRL1", "CTRL2", "CTRL3", "CTRL4")

# Sorteer de BAM-bestanden op alignments en maak een index (.BAI) aan zodat tools als IGV of featureCounts ze correct kunnen lezen
lapply(samples, function(s) {
  sorted_bam <- sortBam(file = paste0(s, '.BAM'), destination = paste0(s, '.sorted'))
  indexBam(sorted_bam)
})