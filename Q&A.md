# 1. Usunięcie całej kolumny z pliku .csv bazując na numerze kolumny:
```
awk 'BEGIN {FS=","} {OFS=","; $1=""; print $0}' users.csv | sed -e 's/,,/,/g ; s/,$//g ; s/^,//g' > nowy.csv
```
gdzie:
- FS=",": separator (wejścia) kolumn w pliku .csv
- OFS=",": separator wyjścia dla zmodyfikowanego strumienia
- $2: numer usuwanej kolumny
- users.csv: nazwa procesowanego pliku

```
sed -e 's/,,/,/g s/,$//g ; s/^,//g'
```
- `s/,,/,/g`: zamiana podówjnych `,,` na pojedynczy
- `s/,$//g`: zamiana `,` znajdującego się na końcu linii (jeśli usuwamy ostatnią kolumnę)
- `s/^,//g`: zamiana `,` znajdującego się na początku linii (jeśli usuwamy pierwszą kolumnę)

# 2. Wstawianie zawartości pliku do innego pliku w konkretnej lini

plik1 - plik oryginalny, do którego chcemy "wrzucić" inny plik o nazwie skrypt.sh
```
awk 'NR==FNR{n=n s $0; s=ORS; next} { print } FNR==8{print n}' skrypt.sh plik1
```
- NR==FNR: ustawienie aktualnie procesowanego rekordu na zmienną FNR
- s=ORS: ustawienie zmiennej s na wartość dla separatora wyjścia dla rekord
- FNR==8: linia w której nastąpi wstawienie wartości z pliku skrypt.sh
