OUI='y'
NON='n'

echo "\n Salut ! Compilons ensemble du LATEX \n"
echo "\n Quel est le nom du fichier ??? (n'oublie pas de mettre le .tex ) \n "
read -r choix1
echo "\n Je le compile avec le meme nom ?"
read -r choix2
if [[ "$choix2" == $OUI ]]; then
  pdflatex "$choix1" ;
  pdflatex "$choix1" ; 
  rm *.aux *.out *.log *.fls *.lot *.synctex.gz *.lof *.fdb_latexmk
else echo "\n Quel est le nouveau nom ?\n"
  read -r $choix3
  pdflatex -jobname="$choix3" "$choix1";
  pdflatex -jobname="$choix3" "$choix1";
  rm *.aux *.out *.log *.fls *.lot *.synctex.gz *.lof *.fdb_latexmk
fi

