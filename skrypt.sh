#!/bin/bash
case "$1" in
  --date)
    date
    ;;
  *)
    echo "Nieznana opcja: $1"
    ;;
esac
