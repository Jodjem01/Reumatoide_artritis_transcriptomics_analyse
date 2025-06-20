## Data en Scripts Goed Beheren

Als je onderzoek doet, is het belangrijk om je data en scripts netjes en duidelijk op te slaan. Zo voorkom je fouten, kun je makkelijk terugvinden wat je hebt gedaan en kunnen anderen je werk begrijpen of opnieuw uitvoeren.


### Waarom is dit belangrijk?

Een goede structuur zorgt ervoor dat je geen gegevens kwijtraakt of in de war raakt. Het helpt ook als je samenwerkt of als je later iets terug wilt zoeken. In de wetenschap is het belangrijk dat anderen je werk kunnen controleren.


### Mappenstructuur

We gebruiken een vaste mappenstructuur voor overzicht. In dit project ziet die er zo uit
```
/Transcriptomics-RA/
├── scripts/               # Alle R-scripts voor elke stap van de analyse
├── data/                  # Invoergegevens zoals FASTQ of count matrix
├── results/               # Resultaten zoals .csv-bestanden of figuren
├── data_stewardship/      # Uitleg over hoe de data is georganiseerd
```

## Zo weet iedereen meteen waar alles staat. Het voorkomt verwarring en zorgt dat scripts automatisch de juiste bestanden kunnen vinden.


### Namen van bestanden

Duidelijke bestandsnamen zijn gegeven volgens dit patroon: `nummer_onderdeel_omschrijving.ext`, bijvoorbeeld:

* `01_unzip_and_setup.R`
* `RA_counts_matrix.csv`
* `Results_case.csv`

## Op deze manier weet iedereen meteen wat een bestand doet en in welke volgorde ze horen. Dat is handig bij sorteren of automatisch verwerken.


### Versiebeheer

Versiebeheer betekent dat je bijhoudt wat er verandert in je bestanden. We gebruiken Git en GitHub:

* Je kunt zien 'wat' is veranderd, 'door wie' en 'wanneer'.
* Je kunt terug naar een vorige versie als er iets fout gaat.
* Je kunt aan verschillende versies tegelijk werken.


### Uitleg in je script

In elk script staan opmerkingen (met `#`) waarin wordt uitgelegd:

* Wat de code doet
* Waarom je iets doet
* Of er iets speciaals is (zoals paired-end bestanden)

Zo blijft het script duidelijk, ook als je er later weer mee aan de slag gaat of als iemand anders het gebruikt.


### De scripts worden gedeeld op:

* GitHub – om code te bewaren en te delen
* GitLab – alternatief met privéprojecten
* Zenodo - koppelt met GitHub en maakt je werk citeerbaar
* OSF.io – handig voor complete onderzoeksprojecten


### Data veilig opslaan

R is gebruikt voor de analyse en bewaarden de bestanden lokaal in een nette map. Alleen geschikte bestanden zijn gedeeld op GitHub. Grote of gevoelige bestanden zijn **niet** geüpload. Voor gevoelige data gebruik je:

* Versleutelde opslag (zoals VeraCrypt)
* Opslag op servers van school of werk (zoals SURFdrive of SharePoint)
* Geen openbare uploads zonder anonimisering


### Omgaan met gevoelige of persoonlijke data

Bij gevoelige data (zoals medische informatie):

* Gebruik alleen geanonimiseerde gegevens
* Zorg voor toestemming of goedkeuring
* Deel niets openbaar zonder toestemming

In dit project is alleen gebruik gemaakt van openbare RNA-seq data, zonder persoonsgegevens.


### Open data en publiceren

Open data:

* Zorgt voor openheid en vertrouwen
* Laat anderen je werk controleren of herhalen
* Helpt de wetenschap vooruit

Als het kan, publiceer je jouw dataset (of bewerkte versies zoals count matrices) op platforms zoals GEO, Figshare of Zenodo.

