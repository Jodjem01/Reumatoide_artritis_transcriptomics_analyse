## Van Gen tot Gewricht: Een Transcriptomics-analyse van Reumatoïde Artritis

### Inleiding
Reumatoïde artritis (RA) is een auto-immuunziekte waarbij het eigen afweersysteem het lichaam aanvalt. Dit zorgt voor ontstekingen in de gewrichten en kan op termijn leiden tot schade aan bot en kraakbeen. Ongeveer 1% van de wereldbevolking heeft RA. Vrouwen krijgen het vaker dan mannen [(McInnes & Schett, 2011)](Documents/bronnen/pdf%20bronnen/mcinnes2011.pdf). De ziekte heeft veel invloed op het dagelijks leven en kan zonder behandeling leiden tot pijn, moeite met bewegen en uiteindelijk invaliditeit. RA ontstaat door een combinatie van erfelijke aanleg, omgevingsfactoren, veranderingen in het microbioom en epigenetische invloeden.

De laatste jaren wordt RNA-sequencing (RNA-seq), een techniek binnen de transcriptomics, steeds vaker gebruikt om genactiviteit te meten bij ziektes zoals RA. Door RA-patiënten te vergelijken met gezonde mensen kunnen onderzoekers ontdekken welke genen en processen een rol spelen in het ontstaan van RA [(Zhao et al., 2024)](Documents/bronnen/pdf%20bronnen/12864_2024_Article_10804.pdf). In dit onderzoek zijn bestaande RNA-seq data gebruikt om genen op te sporen die anders tot expressie komen bij RA en om te kijken welke biologische processen betrokken zijn.


### Materiaal en methoden

De RNA-seq dataset bestond uit acht bloedmonsters (vier RA-patiënten en vier gezonde controles). De ruwe FASTQ-bestanden zijn verwerkt volgens een gestandaardiseerde transcriptomics-workflow. De reads zijn eerst uitgelijnd op het humane referentiegenoom GRCh38 met het R-pakket Rsubread (allign()). Hierbij is gebruik gemaakt van de bijbehorende Ensembl-annotatie (GTF-bestand).

Na het uitlijnen zijn de gemapte reads per gen geteld met featureCounts. Op de ruwe countmatrix die hieruit kwam is een kwaliteitscontrole uitgevoerd. Genen met lage expressie over alle samples zijn verwijderd om achtergrondruis te verminderen.

Voor normalisatie en differentiële expressie analyse is DESeq2 gebruikt. DESeq2 past de median-of-ratios normalisatie methode toe om verschillen in sequencing-diepte aan te passen en te verbeteren. Genen werden beschouwd als significant als aan de volgende voorwaarden voldaan werd:


-	Adjusted p-value < 0,05
-	Absolute log2 fold change > 1

Pathway analyse is uitgevoerd met pathview, gericht op KEGG-routes die relevant zijn voor RA. Een GO-verrijkingsanalyse is uitgevoerd met goseq, waarbij compensatie voor genlengtebias is toegepast. Gen lengtes en relevante ID-conversies zijn verkregen via org.Hs.eg.db en biomaRt.

Alle gebruikte scripts zijn opgenomen in de map Scripts/ en de gegenereerde figuren tabellen en figuren in Results/. Een overzicht van de volledige workflow is toegevoegd als stroomschema in Assets/Workflow_Flowschema


### Resultaten
De resultaten zijn te vinden in de folder 'Results'. Er zijn een [Volcano plot](Results/VolcanoplotWC.png), [Top 10 upregulated genes (barplot)](Results/top%2010%20upregulated%20genes%20barplot.png), [Top 10 downregulated genes (barplot)](Results/top%2010%20downregulated%20genes%20barplot.png), [KEGG Pathway RA (hsa05323)](Results/hsa05323.pathview.png), [KEGG Pathway hsa04610](Results/hsa04610.pathview.png) en een [GO verrijkte processen (csv)](Results/GO_significante_resultaten.csv) gemaakt.

Een opvallend opgereguleerd gen was *ANKRD30BL*, dat codeert voor een eiwit met een ankyrin-repeat domein. Hoewel dit gen nog weinig onderzocht is bij RA, zijn zulke eiwitten vaak betrokken bij signaaloverdracht in cellen en kunnen ze een rol spelen bij ontstekingen. Ook *FAM47A* viel op; dit gen is nog weinig onderzocht, maar zou mogelijk betrokken kunnen zijn bij het regelen van genactiviteit.

Daarnaast was *IGHV4-31*, een variant van een immunoglobuline-gen, meer actief bij RA. Dit soort genen speelt waarschijnlijk een rol bij de productie van auto-antilichamen in RA [(Zhou et al., 2022)](Documents/bronnen/pdf%20bronnen/40744_2024_Article_650.pdf).

Onder de ondergereguleerde genen viel *LEF1-AS1* op, een RNA-molecuul dat het *LEF1*-gen kan beïnvloeden. *LEF1* is belangrijk voor de ontwikkeling van T-cellen. Minder activiteit van dit gen kan invloed hebben op het evenwicht van het immuunsysteem. Twee andere genen, *SLC7A5P2* en *MXRA7P1*, zijn pseudogenen. Deze zijn moeilijker te interpreteren, maar kunnen ook invloed hebben via bijvoorbeeld RNA-interferentie.

De GO-analyse liet zien dat vooral processen zoals “immuunsysteemactiviteit”, “cytokine-signaaloverdracht” en “T-celactivatie” verrijkt waren. Dit past bij wat al bekend is over RA, waarbij T-cellen, B-cellen en ontstekingsstoffen als IL-6 en TNF-α een rol spelen [(Zhang et al., 2023)](Documents/bronnen/pdf%20bronnen/40744_2024_Article_650.pdf). De KEGG-analyse bevestigde dat ontstekingsgenen in de RA-pathway actief zijn.


De differentiële genexpressie-analyse liet duidelijke verschillen zien tussen de RA patiënten en de gezonde controles. De verdeling van de significante genen is weergegeven in de [Volcano plot](Results/VolcanoplotWC.png), waar goed zichtbaar is welke genen zowel sterk veranderende expressie vertonen als statistisch significant zijn.
In [Top 10 downregulated genes (barplot)](Results/top%2010%20downregulated%20genes%20barplot.png) en  [Top 10 downregulated genes (barplot)](Results/top%2010%20downregulated%20genes%20barplot.png) vielen een aantal dingen op. Opvallend was de sterke opregulatie van ANKRD30BL en FAM47A. Dit zijn twee genen die nog weinig beschreven zijn in de context van RA, maar wel mogelijk een rol spelen in intracellulaire signaalregulatie. Daarnaast was IGHV4-31, een immunoglobulinevariatiegen, verhoogd aanwezig in RA-monsters. Dit past bij de verhoogde auto-antilichaam productie die kenmerkend is voor RA (Zhou et al., 2022).
Bij de ondergereguleerde genen viel LEFS-AS1 op, een RNA-molecuul dat het LEF1-gen kan beïnvloeden. LEF1 is belangrijk voor de ontwikkeling van T-cellen. Minder activiteit van dit gen kan invloed hebben op het evenwicht van het immuunsysteem. Twee andere genen, SLC7A5P2 en MXRA7P1, zijn pseudogenen. Deze zijn moeilijker te interpreteren, maar kunnen ook invloed hebben via bijvoorbeeld RNA-interferentie.
De [GO verrijkte processen (csv)](Results/GO_significante_resultaten.csv) liet sterke verrijking zien van processen die kenmerkend zijn voor RA. De belangrijkste categorieën waren onder andere cytokine-gemedieerde signaalroutes, immuunrespons en activatie van T-cellen. Deze processen weerspiegelen de centrale rol van cytokinen zoals IL-6 en TNF-alpha in de onstekingscascade van RA (Zhang et al., 2023).
De [KEGG Pathway RA (hsa05323)](Results/hsa05323.pathview.png) liet duidelijke activiteit zien in de reumatoïde artritis pathway (hsa05323). Verschillende ontstekingsfactoren, immunoglobuline genen en complement componenten werden verhoogd teruggevonden. Ook liet de [KEGG Pathway hsa04610](Results/hsa04610.pathview.png) (complement and coagulation cascades) versterkte signalen zien. Dit past bij de systemische ontstekingsactiviteit die kenmerkend is voor RA.

### Conclusie
Met behulp van RNA-sequencing en bio-informatica zijn genen en processen gevonden die een rol kunnen spelen bij RA. Bekende afweermechanismen werden bevestigd, maar ook nieuwe genen met mogelijk belang bij RA kwamen naar voren, zoals *ANKRD30BL* en *FAM47A*. Deze genen kunnen interessant zijn voor toekomstig onderzoek. Dit laat zien dat RNA-seq samen met functionele analyses zoals GO een waardevol hulpmiddel is om RA op moleculair niveau beter te begrijpen.
