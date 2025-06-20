# 06_volcano_plot.R

# Maak een volcanoplot aan om significante genen visueel weer te geven — log2 fold change op de x-as en adjusted p-value op de y-as
EnhancedVolcano(resultaten,
                lab = rownames(resultaten),
                x = 'log2FoldChange',
                y = 'padj',
                pCutoff = 0.05,
                FCcutoff = 1)