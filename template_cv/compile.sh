OUI='y'
NON='n'
fic="\ntemplate_cv/"

################################### On crée un dossier pour l'entreprise et on gitignore

printf "Salut Ismail, j'espère que cette entrerprise sera la bonne !!! \n"
printf "\n Quel est le nom de cette entreprise stp ? \n " 
read -r b
printf "\n %s est l'entrerpise \n\n" "$b"
fic2=$fic$b;
mkdir $b;

cd ..
echo $fic2 >> .gitignore
cd template_cv/


################################### On copie les CV en anglais et en francais on c jamais et on corrige/compile ####

cp TEX/cv1.tex $b;
cp TEX/cv1_english.tex $b;
cp photo.png $b;
printf "\n CV (fr et english) en latex copier dans le dossier %s \n" "$b"
printf "\n LM (en anglais) générique en latex copier dans le dossier %s \n" "$b"
printf "\n Tu veux modifier le CV pour rajouter le sujet du stage ? ( y or n) \n"
read -r choix1
if [ "$choix1" == $NON ];then
  echo "\n compilation !! \n"
  cd $b
  pdflatex -jobname=CV_Ismail_Guedira cv1.tex; 
  pdflatex -jobname=CV_Ismail_Guedira cv1.tex;  
  pdflatex -jobname=CV_Ismail_Guedira_en cv1_english.tex;
  pdflatex -jobname=CV_Ismail_Guedira_en cv1_english.tex;
  rm *.aux *.log *.bbl *.blg *.out;
  echo "On les ouvre pour que tu verifies ?"
  read -r choix2
  if [ "$choix2" == $OUI ];then
    open CV_Ismail_Guedira.pdf;
    open CV_Ismail_Guedira_en.pdf;
  fi
else echo "\n la reponse est oui du coup je t'ouvre le fichier \n"
  atom TEX/cv1.tex
  echo "/n bon j'attend apres je compile hein !!!"
  read -r compilation_cv
  if [ "$compilation_cv" == $OUI ]; then
    pdflatex -jobname=CV_Ismail_Guedira cv1.tex;
    pdflatex -jobname=CV_Ismail_Guedira_en cv1_english.tex;
    rm *.aux *.log *.bbl *.blg *.out;
  fi
fi

################## Gestion de la création d'une lettre de motivation dans notre dossier entreprise ################
cd ..;
printf "\n\n\n Maintenant passons a la lettre de motivation \n\n\n"
printf "\n  Candidature en francais  \n"
read -r choix3
if [ "$choix3" == $OUI];then # Version Francaise
  cp TEX/LM_fr.tex $b;
  atom $b/LM_fr.tex;
  printf "\nje te laisse la corriger et la compiler hein\n"
  printf "\n appuye sur (y) quand tu as finis que je la compiles dans le bon titre !! :D !!! \n"
  read -r compilation_f
  if [ "$compilation_f" == $OUI ]; then # Version Francaise
    pdflatex -jobname=LM_Ismail_Guedira LM_fr.tex
  fi
else # Version Anglais
  cp TEX/LM_en.tex $b; 
  atom $b/LM_en.tex; 
  printf "\nje te laisse la corriger et j'attend\n"
  printf "\nappuye sur (y) quand tu as finis que je la compiles dans le bon titre !! :D !!!\n"
  read -r compilation_f # Version Anglais
  if [ "$compilation_f" == $OUI ]; then
    pdflatex -jobname=CL_Ismail_Guedira LM_en.tex
  fi
fi

# clean up
cd $b
rm *.aux *.log *.bbl *.blg *.out;
cd ..

exit 0;
#