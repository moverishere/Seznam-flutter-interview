# This File is written in Czech language

# Cil
Popis a cil tohoto projektu najdete v TASK.MD.

# Spusteni
- Flutter SDK 3.22.2 (Stazeni z oficialniho websitu nebo pouzit FVM)
- Flutter pub get
- V projektu se musi generovat hive soubor 'comment_model.g.dart',
proto potrebujete pro tvorbu provolat flutter pub run build_runner build


# Postup vypracovani

1. Seznameni s Riverpod
2. https://material-foundation.github.io/material-theme-builder/ generovani theme
3. Architektura + GoRouter
4. Dio interceptor + logovani
5. Chystani pomocnych widgetu
6. Zalozeni repositories a provideru
7. Tvorba jednotlivych screenu

# Cas vypracovani
Na projektu jsem stravil cca 6.5 hodin.

## O projektu
Projekt byl vytvoren jako ukazka pochopeni zakladnich principu architektury, praci s hive storage, routovanim s goRouter a riverpod frameworkem. 
Behem vypracovani projektu jsem se snazil klast duraz spise na architekturu projektu nez na design. Pro jednotlive ukazky animaci bych mohl uvest moji jinou aplikaci: Campu.eu.
V tomto projektu muzete nalezt jednotlive slozky jako enums, extensions, mixins, controllers atd. ktere jsou prazdne. Kvuli omezenemu casu 
jsem to nechal jako ukazku kde dalsi veci muzou byt umisteni v pripade rozsireni projektu a zaroven feature first pristup je ukazkou jak by mohli vypadat (strukturou) dalsi business logiky a screeny.

## Navrh na zlepseni
- Zavedeni prekladu (umisteni lokalizace)
- Zbaveni duplicit a rozdeleni trid na vice widgetu (tlacil cas)
- Naplneni controlleru, kde je: osetreni erroru pri selhani endpointu, volani snackbaru/modalu v pripade warning/erroru. 
- Snackbar na nedostupne spojeni, pouzil bych connectivity plus package
- Rive animace (bohuzel jsem nestihal ukazat, na jinech projektech jsme to pouzivali)
- Tvorba Widgetbooku a napojeni na projekt
- testovani widgetu, unit testing, integration testing (Patrol package)



