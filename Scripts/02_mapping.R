# 02_mapping.R

# (Optioneel) Bekijk documentatie en voorbeelden van Rsubread
browseVignettes('Rsubread')

# Bouw een index van het referentiegenoom (FASTA-bestand). Dit is een vereiste voor align() om je reads correct uit te lijnen.
buildindex(
  basename = "ref_human",  # naam voor het indexbestand
  reference = "C:/Users/Administrator/OneDrive - Van Hall Larenstein/Documenten/J2P4/Transcriptomics/casus/RA_data/GCF_000001405.40_GRCh38.p14_genomic.fna",
  memory = 8000,
  indexSplit = TRUE         # splits de index in meerdere delen (efficiënter)
)

# Pad naar de aangemaakte index
index_path <- "ref_human"

# Voer de mapping uit per sample. Je koppelt hier forward en reverse reads (paired-end) aan elkaar en genereert een .BAM-bestand met de uitgelijnde reads.
# Dit moet je doen voor elke sample individueel.
align(index = index_path, readfile1 = "RA_data/SRR4785819_1_subset40k.fastq", readfile2 = "RA_data/SRR4785819_2_subset40k.fastq", output_file = "RA1.BAM")
# Herhaal dit voor alle andere samples (RA2, RA3, CTRL1, enz.)