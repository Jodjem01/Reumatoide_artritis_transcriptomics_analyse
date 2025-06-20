

### Inleiding
Reumatoïde artritis (RA) is een chronische auto-immuunziekte waarbij de gewrichten ontstoken raken. Dit kan leiden tot schade aan kraakbeen en bot. Ongeveer 1% van de mensen wereldwijd heeft RA, en vrouwen krijgen het vaker dan mannen ([(McInnes & Schett, 2011](Documents/bronnen/pdf%20bronnen/mcinnes2011.pdf); [Zhou et al., 2022)](Documents/bronnen/pdf%20bronnen/40744_2024_Article_650.pdf). Als de ziekte niet wordt behandeld, kan het zorgen voor veel pijn, moeite met bewegen en zelfs blijvende invaliditeit. Hoe RA ontstaat is ingewikkeld en wordt beïnvloed door erfelijke aanleg, veranderingen in de genen (epigenetica), de omgeving en het microbioom (Forbes et al., 2018; Chen et al., 2022).

Met moderne technieken zoals transcriptomics — en vooral RNA-sequencing (RNA-seq) — kunnen onderzoekers zien welke genen actief zijn in RA. RNA-seq vergelijkt de genactiviteit van RA-patiënten met gezonde mensen. Zo kunnen nieuwe genen en biologische routes worden ontdekt die iets te maken hebben met RA (Zhao et al., 2022; Zhang et al., 2024). Uit eerder onderzoek blijkt dat bepaalde afweer-gerelateerde genen bij RA-patiënten anders werken, bijvoorbeeld genen die te maken hebben met T-cellen en ontstekingsstoffen (Jin et al., 2024).

Ook helpt RNA-seq om te begrijpen waarom RA er bij sommige mensen anders uitziet dan bij anderen. Bijvoorbeeld door te kijken naar zogenaamde pseudogenen en lange niet-coderende RNA’s (Li et al., 2023). Deze kunnen een rol spelen bij het aan- of uitzetten van andere genen, wat belangrijk is bij auto-immuunziekten. Als je RNA-seq combineert met extra analyses zoals Gene Ontology of KEGG, kun je beter begrijpen welke processen in het lichaam veranderd zijn bij RA (Wang et al., 2022).

In dit onderzoek is gebruikgemaakt van bestaande RNA-seq data (Pereira et al., 2020). Met bioinformatica zijn de genen die anders tot uiting komen (DEGs) en de bijbehorende signaalroutes bij RA onderzocht.


### Materiaal en methoden
RNA-gegevens uit bloedmonsters zijn vergeleken met het menselijke referentiegenoom (GRCh38) met behulp van het R-pakket `Rsubread`. Daarna zijn de genen geteld met `featureCounts`, wat resulteerde in een ruwe matrix met gen-tellingen. In totaal zijn er acht monsters geanalyseerd (vier van RA-patiënten en vier van gezonde controles). Met DESeq2 is onderzocht welke genen duidelijk meer of minder actief waren. Genen werden als “significant verschillend” beschouwd bij een aangepaste p-waarde (padj) < 0,05 én een log2FoldChange groter dan 1 of kleiner dan -1.

Vervolgens is er pathway-analyse gedaan met het `pathview`-pakket, gericht op de KEGG-pathway voor RA (hsa05323). Ook is een GO-analyse (Gene Ontology) uitgevoerd met `goseq`, waarbij gecorrigeerd werd voor verschillen in genlengte. Hiervoor zijn gegevens over genlengtes en ID’s opgehaald via databases als `org.Hs.eg.db` en `biomaRt`.

### Resultaten
De resultaten zijn te vinden in de folder 'Results'. Er zijn een [Volcano plot](Results/VolcanoplotWC.png), [Top 10 upregulated genes (barplot)](Results/top%2010%20upregulated%20genes%20barplot.png), [Top 10 downregulated genes (barplot)](Results/top%2010%20downregulated%20genes%20barplot.png), [KEGG Pathway RA (hsa05323)](Results/hsa05323.pathview.png), [KEGG Pathway hsa04610](Results/hsa04610.pathview.png) en een [GO verrijkte processen (csv)](Results/GO_significante_resultaten.csv) gemaakt.

Een opvallend opgereguleerd gen was *ANKRD30BL*, dat codeert voor een eiwit met een ankyrin-repeat domein. Hoewel dit gen nog weinig onderzocht is bij RA, zijn zulke eiwitten vaak betrokken bij signaaloverdracht in cellen en kunnen ze een rol spelen bij ontstekingen (Jin et al., 2024). Ook *FAM47A* viel op; dit gen is nog weinig onderzocht, maar zou mogelijk betrokken kunnen zijn bij het regelen van genactiviteit.

Daarnaast was *IGHV4-31*, een variant van een immunoglobuline-gen, meer actief bij RA. Dit soort genen speelt waarschijnlijk een rol bij de productie van auto-antilichamen in RA (Zhou et al., 2022).

Onder de ondergereguleerde genen viel *LEF1-AS1* op, een RNA-molecuul dat het *LEF1*-gen kan beïnvloeden. *LEF1* is belangrijk voor de ontwikkeling van T-cellen. Minder activiteit van dit gen kan invloed hebben op het evenwicht van het immuunsysteem. Twee andere genen, *SLC7A5P2* en *MXRA7P1*, zijn pseudogenen. Deze zijn moeilijker te interpreteren, maar kunnen ook invloed hebben via bijvoorbeeld RNA-interferentie.

De GO-analyse liet zien dat vooral processen zoals “immuunsysteemactiviteit”, “cytokine-signaaloverdracht” en “T-celactivatie” verrijkt waren. Dit past bij wat al bekend is over RA, waarbij T-cellen, B-cellen en ontstekingsstoffen als IL-6 en TNF-α een rol spelen (Zhang et al., 2023). De KEGG-analyse bevestigde dat ontstekingsgenen in de RA-pathway actief zijn.

### Conclusie
Met behulp van RNA-sequencing en bio-informatica zijn genen en processen gevonden die een rol kunnen spelen bij RA. Bekende afweermechanismen werden bevestigd, maar ook nieuwe genen met mogelijk belang bij RA kwamen naar voren, zoals *ANKRD30BL* en *FAM47A*. Deze genen kunnen interessant zijn voor toekomstig onderzoek. Dit laat zien dat RNA-seq samen met functionele analyses zoals GO een waardevol hulpmiddel is om RA op moleculair niveau beter te begrijpen.
