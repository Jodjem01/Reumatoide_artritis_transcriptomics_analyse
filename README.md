
### Inleiding
Reumatoïde artritis (RA) is een auto-immuunziekte waarbij het eigen afweersysteem het lichaam aanvalt. Dit zorgt voor ontstekingen in de gewrichten en kan op termijn leiden tot schade aan bot en kraakbeen. Ongeveer 1% van de wereldbevolking heeft RA. Vrouwen krijgen het vaker dan mannen [(McInnes & Schett, 2011)](Documents/bronnen/pdf%20bronnen/mcinnes2011.pdf). De ziekte heeft veel invloed op het dagelijks leven en kan zonder behandeling leiden tot pijn, moeite met bewegen en uiteindelijk invaliditeit. RA ontstaat door een combinatie van erfelijke aanleg, omgevingsfactoren, veranderingen in het microbioom en epigenetische invloeden.

De laatste jaren wordt RNA-sequencing (RNA-seq), een techniek binnen de transcriptomics, steeds vaker gebruikt om genactiviteit te meten bij ziektes zoals RA. Door RA-patiënten te vergelijken met gezonde mensen kunnen onderzoekers ontdekken welke genen en processen een rol spelen in het ontstaan van RA [(Zhao et al., 2024)](Documents/bronnen/pdf%20bronnen/12864_2024_Article_10804.pdf). In dit onderzoek zijn bestaande RNA-seq data gebruikt (Pereira et al., 2020) om genen op te sporen die anders tot expressie komen bij RA en om te kijken welke biologische processen betrokken zijn.

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
