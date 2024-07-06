#!/bin/bash
create_logs() {
  local count=$1
  for ((i=1; i<=count; i++)); do
    echo -e "Nazwa pliku: log$i.txt\nNazwa skryptu: skrypt.sh\nData: $(date)" > log$i.txt
  done
}

create_errors() {
  local count=$1
  for ((i=1; i<=count; i++)); do
    mkdir -p error$i
    echo -e "Nazwa pliku: error$i.txt\nNazwa skryptu: skrypt.sh\nData: $(date)" > error$i/error$i.txt
  done
}

case "$1" in
  --date|-d)
    date
    ;;
  --logs|-l)
    count=${2:-100}
    create_logs $count
    ;;
  --help|-h)
    echo "--date -d - wyświetla dzisiejszą datę"
    echo "--logs -l [liczba] - tworzy [liczba] plików logx.txt"
    echo "--init - klonuje repozytorium i ustawia PATH"
    echo "--error -e [liczba] - tworzy [liczba] katalogów errorx/errorx.txt"
    ;;
  --init)
    git clone https://github.com/TwojeKonto/Lab4-Git.git
    export PATH=$PATH:$(pwd)/Lab4-Git
    ;;
  --error|-e)
    count=${2:-100}
    create_errors $count
    ;;
  *)
    echo "Nieznana opcja: $1"
    ;;
esac
