# 04_featureCounts.R

# Laad Rsubread (als dat nog niet gebeurd is)
library(Rsubread)

# Lijst met BAM-bestanden (ongesorteerde versies — deze werken ook)
bam_files <- c("RA1.BAM", "RA2.BAM", "RA3.BAM", "RA4.BAM", "CTRL1.BAM", "CTRL2.BAM", "CTRL3.BAM", "CTRL4.BAM")

# Genereer een countmatrix door reads te koppelen aan genannotaties (via GTF). Dit geeft per gen het aantal reads dat erop mapt.
count_matrix <- featureCounts(
  files = bam_files,
  annot.ext = "GCF_000001405.40_GRCh38.p14_genomic.gtf.gz",  # referentie-annotatiebestand
  isPairedEnd = TRUE,
  isGTFAnnotationFile = TRUE,
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE
)

# Sla de countmatrix op als CSV zodat je deze later kunt gebruiken in DESeq2
write.csv(count_matrix$counts, "RA_counts_matrix.csv")