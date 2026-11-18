#!/usr/bin/env bash
# Podstawy informatyki — szablon do uzupełnienia.
# Uruchomienie: bash src/analiza.sh dane
# Wynik: po jednej linii dla każdego pliku .log:
# nazwa_pliku;liczba_ERROR;STATUS

# TODO 1. Pobierz katalog z argumentu (lub ustaw dane jako domyślny).
# TODO 2. Sprawdź -d; jeśli go nie ma, błąd na stderr i exit 2.
# TODO 3. Pętla for po plikach *.log; obsłuż brak dopasowań.
# TODO 4. Zlicz ERROR w każdym pliku i ustal status przez if.
# TODO 5. Użyj printf, dokładnie trzy pola rozdzielone ;.


#!/usr/bin/env bash
DIR="${1:-dane}"
if [[ -d "$DIR" ]]; then
    cd ./"$DIR"
    for PLIK in *.log; do
        [[ -f "$PLIK" ]] || continue
        ILE=$(grep -c 'ERROR' "$PLIK")
        if [[ "$ILE" -ge 2 ]] then
            STATUS='ALARM'
        else
            STATUS='OK'
        fi
        printf '%s;%s_ERROR;STATUS %s\n' "$PLIK" "$ILE" "$STATUS"
    done
else
    echo 'Brak katalogu' >&2
    exit 2
fi

