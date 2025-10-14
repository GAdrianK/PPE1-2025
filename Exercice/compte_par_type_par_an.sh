#!/bin/bash

# Vérifie qu'on a bien un argument (le type d'entité)
if [ $# -ne 1 ]; then
  echo "Usage: $0 <type>"
  exit 1
fi

TYPE=$1

# Liste des années à traiter
for ANNEE in 2016 2017 2018
do
  # Appelle le premier script et récupère son résultat
  NOMBRE=$(./compte_par_type.sh "$ANNEE" "$TYPE")
  
  # Affiche le résultat pour cette année
  echo "$ANNEE : $NOMBRE"
done