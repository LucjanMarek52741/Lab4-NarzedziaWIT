#!/bin/bash
create_logs() {
  local count=$1
  for ((i=1; i<=count; i++)); do
    echo -e "Nazwa pliku: log$i.txt\nNazwa skryptu: skrypt.sh\nData: $(date)" > log$i.txt
  done
}

case "$1" in
  --date)
    date
    ;;
  --logs)
    count=${2:-100}
    create_logs $count
    ;;
  --help)
    echo "--date - wyświetla dzisiejszą datę"
    echo "--logs [liczba] - tworzy [liczba] plików logx.txt"
    ;;
  *)
    echo "Nieznana opcja: $1"
    ;;
esac
