# 08_go_analysis.R

# Maak een binaire vector met genen die significant zijn (padj < 0.05 en |log2FC| > 1)
sig_genen <- as.integer(resultaten$padj < 0.05 & abs(resultaten$log2FoldChange) > 1)
names(sig_genen) <- rownames(resultaten)

# Gebruik biomaRt om de lengte van het langste transcript van elk gen op te halen
ensembl <- useMart("ensembl", dataset = "hsapiens_gene_ensembl")
gene_info <- getBM(attributes = c("hgnc_symbol", "entrezgene_id", "transcript_length"),
                   filters = "hgnc_symbol",
                   values = rownames(resultaten),
                   mart = ensembl)

# Selecteer per gen de langste transcript en bijbehorende Entrez ID
gene_lengths <- gene_info %>%
  group_by(hgnc_symbol) %>%
  summarise(length = max(transcript_length, na.rm = TRUE),
            entrez = first(entrezgene_id)) %>%
  filter(!is.na(entrez))

# Maak een vector van lengtes per gen
length_vector <- gene_lengths$length
names(length_vector) <- gene_lengths$hgnc_symbol

# Behoud alleen de genen die in beide datasets voorkomen
common_genes <- intersect(names(sig_genen), names(length_vector))
sig_genen_filtered <- sig_genen[common_genes]
length_vector_filtered <- length_vector[common_genes]

# Verwijder NA's uit de vectors
valid <- !is.na(sig_genen_filtered) & !is.na(length_vector_filtered)
sig_genen_filtered <- sig_genen_filtered[valid]
length_vector_filtered <- length_vector_filtered[valid]

# Bereken de probability weighting function (PWF), die correctie uitvoert op basis van genlengte
pwf <- nullp(sig_genen_filtered, bias.data = length_vector_filtered, plot.fit = TRUE)

# Voer GO-enrichmentanalyse uit op basis van de PWF
GO_resultaat <- goseq(pwf, genome = "hg38", id = "geneSymbol")
GO_significant <- GO_resultaat[GO_resultaat$over_represented_pvalue < 0.05, ]

# Sla de significante GO-termen op als CSV-bestand
write.csv(GO_significant, "GO_significante_resultaten.csv")