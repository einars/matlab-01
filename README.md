# Kāda Matlab ieskaite skolā, izpildīta uz GNU Octave

Tev šo nevajag. Šis ir šablons, kurš ļauj man uzģenerēt HTML un PDF papīru, kurā automātiski tiek iekļauts krāsains Matlab/Octave kods, ievieto uzzīmētos grafikus un koda izpildes rezultātus.

/iesk-01.md ir 

## Ja šķiet, ka tomēr šo vajag, tev vajadzēs arī:

- GNU Octave, lai varētu palaist visus darbus zem `src/` mapes,

- babaška, https://babashka.org/ clojure interpreteris, kurš satur visu kopā, `scripts/build.clj`

- `md2html` markdown parseris no md4c markdown parsera bibliotēkas,

- `pygmentize` no Pygments sintakses krāsošanas bibliotēkas,

- `wkhtmltopdf`, lai izveidotu rezultējošo pdf.

Teicu taču, ka nevajag.

## Faili un mapītes

- /iesk-01.md — ieskaites teksts,
- scripts/run — ar šo es uzģenerēju gala dokumentu,
- src/ — uzdevumu risinājumi, grafiku zīmētāji etc,
- out/ — te nonāk rezultējošie faili.
