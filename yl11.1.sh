#!/bin/bash


# Kasutaja sisend

teenus=$1



# Kui kasutaja ei sisesta midagi

if [ -z "$teenus" ]; then

  echo "Palun sisesta teenuse nimi!"

  exit 1

fi


# Kontrollime teenuse staatust systemctl abil

if systemctl is-active --quiet "$teenus"; then

  echo "✅ $teenus on aktiivne ja töötab."

else

  echo "⚠️ Hoiatus: $teenus ei ole aktiivne!"

fi
