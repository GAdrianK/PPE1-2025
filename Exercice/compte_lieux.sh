#!/bin/bash

# Vérifie les arguments
if [ $# -ne 3 ]; then
  echo "Usage: $0 <année|*> <mois|*> <nombre>"
  exit 1
fi

ANNEE=$1
MOIS=$2
NB=$3

# Cherche tous les fichiers correspondant
FICHIERS=$(find data/$ANNEE/$MOIS -type f 2>/dev/null) #encore ici data peut changer
if [ -z "$FICHIERS" ]; then
  echo "Aucun fichier trouvé."
  exit 0
fi

# Compte les lieux les plus cités
grep -ho "<Location>[^<]*</Location>" $FICHIERS \
  | sed 's/<\/\?Location>//g' \
  | sort | uniq -c | sort -nr | head -n $N