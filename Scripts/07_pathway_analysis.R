# 07_pathway_analysis.R

# Maak een genvector aan voor pathway analyse. Dit is vereist voor Pathview (log2FC-waarden per gen)
gene_vector <- resultaten$log2FoldChange
names(gene_vector) <- rownames(resultaten)

# Visualiseer de RA-pathway (hsa05323) met de expressiewaarden. Zo zie je welke genen in het pathway veranderd zijn.
pathview(
  gene.data = gene_vector,
  pathway.id = "hsa05323",
  species = "hsa",
  gene.idtype = "SYMBOL",
  limit = list(gene = 5)
)