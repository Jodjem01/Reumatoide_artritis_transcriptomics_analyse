# 01_unzip_and_setup.R

# Zet de werkdirectory naar de juiste map waar je de zip- en referentiebestanden hebt opgeslagen
setwd("C:/Users/Administrator/OneDrive - Van Hall Larenstein/Documenten/J2P4/Transcriptomics/casus")

# Pak het zip-bestand met RNA-seq data uit in een submap 'RA_data'. Deze stap zorgt ervoor dat alle fastq-bestanden beschikbaar zijn voor mapping.
unzip("Data_RA_raw.zip", exdir = "RA_data")

# Installeer BiocManager als die nog niet geïnstalleerd is — hiermee kun je Bioconductor-pakketten installeren
install.packages("BiocManager")

# Installeer het pakket 'Rsubread', dit heb je nodig voor de stappen mapping en het genereren van de count matrix
BiocManager::install("Rsubread")

# Laad het Rsubread pakket in de R-omgeving
library(Rsubread)