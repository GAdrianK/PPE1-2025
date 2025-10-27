#!/bin/bash
if [ $# -eq 0 ]; then # Check if no arguments are provided
    echo "ERREUR" # Print error message if no arguments
    exit 1 # Exit with status 1
fi # Get the first argument as the file name

file=$1 # Assign the first argument to variable 'file'
n=0 # Initialize line counter

while read -r line;  # Read each line from the file
do # Process each line
    n=$((n + 1)) # Increment line counter
    echo -e "${n}\t${line}" # Print line number and line content #with a tab separator 
# le \t c'est pour faire une tabulation entre le numéro de ligne et le contenu de la ligne 
#et ca grace a -e ca permet d'interpréter les séquences d'échappement comme \t \n etc.
done < "$file" # Redirect input from the specified file

#!/bin/bash
if [ $# -eq 0 ]; then
    echo "ERREUR"
    exit 1
fi
file=$1
n=0
while read -r line; do
    n=$((n + 1))
    echo -e "${n}\t${line}"
done < "$file" # en mettant file au lieu de fr.txt on peut passer n'importe quel fichier en argument
status=$(curl -o /dev/null -s -w "%{http_code}\n" "$line") # -o /dev/null pour ne pas afficher le contenu de la page
# -s pour mode silencieux
# -w "%{http_code}\n" pour afficher uniquement le code de statut HTTP
# on utilise curl pour vérifier le code de statut HTTP de l'URL
encoding=$(curl -s -I "$line" | grep -i "charset" | cut -d= -f2)
# ou encoding=$(curl -s -I "$line" | grep -i "Content-Encoding" | awk '{print $2}' | tr -d '\r') qui sert à la même chose
# on récupère l'encodage de contenu de l'URL
# on utilise curl pour obtenir les en-têtes HTTP et grep pour trouver l'encodage

#!/bin/bash
if [ $# -eq 0 ]; then
    echo "ERREUR"
    exit 1
fi
file=$1
n=0
while read -r line; do
    n=$((n + 1))
    echo -e "${n}\t${line}"
    status=$(curl -o /dev/null -s -w "%{http_code}\n" "$line")
    encoding=$(curl -s -I "$line" | grep -i "charset" | cut -d= -f2)
    echo -e "\tStatus: ${status}\tEncoding: ${encoding}"
done < "$file"

#!/bin/bash
if [ $# -eq 0 ]; then
    echo "ERREUR"
    exit 1
fi
file=$1
n=0
while read -r line; do
    n=$((n + 1))
    status=$(curl -o /dev/null -s -w "%{http_code}\n" "$line")
    encoding=$(curl -s -I "$line" | grep -i "charset" | cut -d= -f2)
    nb_mots=$(curl -s "$line" | wc -w)
    echo -e "${n}\t${line}\tStatus: ${status}\tEncoding: ${encoding}\tWords: ${nb_mots}"
done < "$file"
#ceci ajoute le nombre de mots dans le contenu de l'URL en utilisant wc -w et curl pour récupérer le contenu de l'URL et compter les mots. 


#!/bin/bash
if [ $# -eq 0 ]; then
    echo "ERREUR"
    exit 1
fi
file=$1
n=0
while IFS= read -r line; do
    line=$(echo "$line" | tr -d '\r') # ça permet de supprimer les retours chariot éventuels
    n=$((n + 1))
    echo "Processing URL #${n}: ${line}"
    status=$(curl -L -o /dev/null -s -w "%{http_code}\n" "$line") # -o /dev/null pour ne pas afficher le contenu de la page
    # -s pour mode silencieux
    # -w "%{http_code}\n" pour afficher uniquement le code de statut HTTP
    # on utilise curl pour vérifier le code de statut HTTP de l'URL
    encodage=$(lynx -dump -source "$line" | grep -i "charset=" | head -n 1 | cut -d'"' -f2) # on utilise lynx pour récupérer le contenu de la page et grep pour trouver l'encodage
    nb_mots=$(curl -s -L -A "Mozilla/5.0" "$line" | wc -w) # ça permet de compter le nombre de mots
    #Mozilla/5.0 est un user-agent courant qui permet d'éviter d'être bloqué par certains sites web
    echo -e "numéro de ligne: ${n}\tURL: ${line}\tStatut: ${status}\tEncodage: ${encodage}\tNombre de mots: ${nb_mots}"
done < "$file"
#!/bin/bash
if [ $# -eq 0 ]; then
    echo "ERREUR"
    exit 1
fi
file=$1
n=0
while IFS= read -r line; do
    line=$(echo "$line" | tr -d '\r') # ça permet de supprimer les retours chariot éventuels
    n=$((n + 1))
    echo "Processing URL #${n}: ${line}"
    status=$(curl -L -o /dev/null -s -w "%{http_code}\n" "$line") # -o /dev/null pour ne pas afficher le contenu de la page
    # -s pour mode silencieux
    # -w "%{http_code}\n" pour afficher uniquement le code de statut HTTP
    # on utilise curl pour vérifier le code de statut HTTP de l'URL
    encodage=$(lynx -dump -source "$line" | grep -i "charset=" | head -n 1 | cut -d'"' -f2)
    nb_mots=$(curl -s -L -A "Mozilla/5.0" "$line" | wc -w) # ça permet de compter le nombre de mots
    #Mozilla/5.0 est un user-agent courant qui permet d'éviter d'être bloqué par certains sites web
    echo -e "numéro de ligne: ${n}\tURL: ${line}\tStatut: ${status}\tEncodage: ${encodage}\tNombre de mots: ${nb_mots}"
done < "$file"