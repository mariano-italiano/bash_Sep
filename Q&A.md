# Usunięcie całej kolumny z pliku .csv bazując na numerze kolumny:
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
# 
