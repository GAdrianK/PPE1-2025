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