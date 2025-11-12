#!/bin/bash
if [ $# -eq 0 ]; then
    echo "ERREUR"
    exit 1
fi
file=$1

out="${2:-tableaux/tableau-fr.html}" # permet de spécifier un fichier de sortie en second argument, sinon on utilise un fichier par défaut
mkdir -p "$(dirname "$out")" # crée le répertoire de sortie s'il n'existe pas
{
    echo "<html><body><table border=\"1\">" > "$out" # début du tableau HTML
    echo "<tr><th>n</th><th>url</th><th>status</th><th>encoding</th><th>word count</th></tr>" >> "$out" # en-têtes du tableau
}
n=0
while read -r line; do # ce bloc lit chaque ligne du fichier
# et remplit le tableau HTML avec les informations récupérées
    n=$((n + 1))
    status=$(curl -o /dev/null -s -w "%{http_code}\n" "$line")
    encoding=$(curl -s -I "$line" | grep -i "charset" | cut -d= -f2)
    word_count=$(curl -s "$line" | wc -w)
  printf "<tr><td>%d</td><td>%s</td><td>%s</td><td>%s</td><td>%d</td></tr>\n" "$n" "$line" "$status" "$encoding" "$word_count" >> "$out"
done < "$file"