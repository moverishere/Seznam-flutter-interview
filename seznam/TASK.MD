# Entry projekt - Seznam Flutter Vývojář

Toto jsou instrukce pro kandidáty na flutter vývojáře v Seznamu. Jde o velmi malý projekt určený pro otestování základních dovedností. Pro úkol není relevantní design, pouze kód a druhotně UX. Projekt je navržen tak, aby byl zpracovatelný pro všechny úrovně od juniora po seniora, vypracujte jej dle vlastních schopností. Není očekáváno, že každý zvládne vše na 100%.


## Popis

Vytvořte repozitář na [GitHubu](https://github.com/) s Flutter aplikací pracující s [Placeholder API](https://jsonplaceholder.typicode.com/). Na tomto úkolu demonstrujte dobrou práci s Rest Api, Dartem a Flutterem. Primárně je třeba vypracovat **povinné zadání** a až poté doporučuji pracovat na bonusových bodech. Bonusové body nejsou povinné, ovšem mohou významně pomoci. Úkol lze pojmout jednoduše a vypracovat velmi rychle, zároveň je možné na něm prokázat porozumění architektuře a design patternům. Jak řešení, tak architekturu vyberte vhodně vůči projektu, ovšem zamyslete se i nad teoretickým rozšířením ("není vhodné vše overengineerovat, ale ukažte, že chápete softwarové principy").


## Povinné zadání

- Obrazovka umožňující procházet jednotlivé posty `/posts`
- Obrazovka s detailem postu, zobrazující jeho informace a komentáře `/posts/{id}/comments`
- Možnost přidat vlastní komentář k postu obsahující email a text. Forma dle vlastního výběru (obrazovka / bottom sheet / něco jiného...).
- Použití vhodného řešení stavu - [Riverpod](https://pub.dev/packages/flutter_riverpod) je silně doporučen, ale je možné si obhájit i jiné

  

## Bonusové body

- Animace jakékoliv formy (implicitní, explicitní, [Rive](https://pub.dev/packages/rive), [Lottie](https://pub.dev/packages/lottie),...) 
- Lokální ukládání vlastních komentářů - [Hive](https://pub.dev/packages/hive) silně doporučen, ale je možné si obhájit i jiné
- Použití interceptorů (například logování komunikace)
- Využití dalších endpointů (například pro práci s obrázky)
- Cokoliv dalšího, co vás napadne a chcete ukázat


## Tipy

- Pro animace je výborná knihovna [Flutter Animate](https://pub.dev/packages/flutter_animate)
- Pro neprimitivní tipy v Hive je vhodné použít type adaptéry
- Zamyslete se nad ošetřením erroru a načítáním dat

## Výstup

Výstupem by měl být Github repozitář, obsahující kód a **README.MD s instrukcemi pro spuštění aplikace**. Nezapomeňte uvést všechny potřebné kroky (například v případě použití generování souborů). README by také měl obsahovat stručný popis všeho, co jste použili a to zejména všeho nad rámec zadání. Formalita ani rozsah Readme není relevantní, ale snažte se obsáhnout vše a pokud možno stručně (Aby se to lépe kontrolovalo). Veškeré postřehy a komentáře můžete rovněž uvést do README.