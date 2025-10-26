# Journal de bord du projet encadré
## Création d'un fichier qui est mon journal de bord pour mon projet encadré, dans ce dernier j'ecrirai et je noterai mes avancées, mes réussites, mes echecs et les obstacles rencontrer. je galère a envoyer ca sur github

!/ usr / bin / bash #interprétareur bash  
if [ $ # - ne 1 ] #ce block permet de verifier la présence d'un unique argument,
then
echo " ce programme demande un argument " #message d'erreur si pas d'argument ou trop
exit #arret du prog
fi
FICHIER_URLS = $1 #ce block permet l'initialisation des variables, le premier argu $1 = nom du fichier contenant lrs URLS
OK =0 #compteur d'URLS valides 
NOK =0 #compteur de ligne non valides
while read -r LINE ; #ce block va nous permerttre de lire ligne par ligne, cette com permet de lire chaque ligne dans la variable ligne
do  
echo " la ligne : $LINE " #ça nous affiche la ligne Lue
if [[ $LINE =∼ ^ https ?:// ]] #ce bloque block permet de vérifier si l'URL est valide, cette ligne fait de la regex pour retrouver https
then 
echo " ressemble à une URL valide "
OK = $ ( expr $OK + 1) #ça nous permet d'augmenter l'incrémance de OK
else
echo " ne ressemble pas à une URL valide " 
NOK = $ ( expr $NOK + 1) #ça nous permet d'augmenter l'incrémance de NOK
fi
done < $FICHIER_URLS #spécifie que les lignes proviennent du fichier donné en argument
echo " $OK URLs et $NOK lignes douteuses " # récap des résultats

# Mini projet, très compliqué de tous imbriqué, j'ai du chercher sur internet beaucoup beaucoup de choses, et aussi pas mal de consignes pas très clair. Après pas mal d'heure je penses avoir reussi le projet, mais je n'en suis pas sure, ou en tout cas je ne sais pas si c'est les façon optimal
# ne sachant pas ou mettre certaine réponse je le fais ici
# pour cat, créer un sous procéssus, et donc les variables restent dans la boucle et ce n'est pas efficace
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
