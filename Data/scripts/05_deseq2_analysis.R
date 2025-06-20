# Zet je werkdirectory (hier sla je de outputbestanden op van de analyse)
setwd("E:/casus")

# Installeer benodigde analysepakketten indien nodig — deze gebruik je voor differentiële genexpressie, visualisaties en GO-analyse
if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
BiocManager::install(c("DESeq2", "EnhancedVolcano", "pathview", "goseq", "org.Hs.eg.db", "biomaRt"))

# Laad alle benodigde libraries
library(DESeq2)
library(EnhancedVolcano)
library(pathview)
library(goseq)
library(org.Hs.eg.db)
library(biomaRt)
library(dplyr)

# Lees de getelde data in en rond af op hele getallen (vereist voor DESeq2)
counts <- read.table("count_matrix.txt", header = TRUE, sep = "\t", row.names = 1)
counts <- round(counts)

# Controleer of je matrix goed is ingeladen
print(dim(counts))

# Maak een dataframe met de groepstoewijzingen (treatment vs control)
treatment <- factor(c("RA", "RA", "RA", "RA", "Control", "Control", "Control", "Control"))
treatment_table <- data.frame(treatment)
rownames(treatment_table) <- colnames(counts)

# Maak een DESeqDataSet aan en voer de analyse uit
dds <- DESeqDataSetFromMatrix(countData = counts,
                              colData = treatment_table,
                              design = ~ treatment)
dds <- DESeq(dds)
resultaten <- results(dds)

# Sla de resultaten op voor verder gebruik
write.csv(resultaten, "Resultaten_casus.csv")