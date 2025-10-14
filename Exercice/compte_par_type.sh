#!/bin/bash

# Vérifie qu'on a bien 2 arguments
if [ $# -ne 2 ]; then
  echo "Usage: $0 <année> <type>"
  exit 1
fi

ANNEE=$1       # exemple : 2016
TYPE=$2        # exemple : Location

# On se place dans le dossier correspondant
DOSSIER="Dossier/$ANNEE" #ici pour moi ce serait donc /home/adriano/Documents/TAL/projet_prog/Exercice1/ann/$ANNEE 
#à modifier a sa guise
# Vérifie que le dossier existe
if [ ! -d "$DOSSIER" ]; then
  echo "Erreur : le dossier $DOSSIER n'existe pas"
  exit 1
fi

# Compte le nombre d'occurrences du type d'entité dans tous les fichiers
# On cherche les lignes contenant le mot exact TYPE (ex: <Location> ou "Location")
# On additionne le total
NOMBRE=$(grep -roh "$TYPE" "$DOSSIER" | wc -l)

# Affiche uniquement le nombre
echo "$NOMBRE"