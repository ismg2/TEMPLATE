OUI='y'
NON='n'
fic="\ntemplate_cv/"

printf "Salut Ismail, j'espère que cette entrerprise sera la bonne !!! \n"
printf "\n Quel est le nom de cette entreprise stp ? \n " 
read -r b
printf "\n %s est l'entrerpise \n\n" "$b"
fic2=$fic$b;
mkdir $b;

cd ..
echo $fic2 >> .gitignore
cd template_cv/

cp cv1.tex $b;
cp cv1_english.tex $b;
cp photo.png $b;
printf "\n CV (fr et english) en latex copier dans le dossier %s \n" "$b"
cp LM.tex $b; 
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
  echo "On les ouvre pour que tu verifies ?"
  read -r choix2
  if [ "$choix2" == $OUI ];then
    open CV_Ismail_Guedira.pdf;
    open CV_Ismail_Guedira_en.pdf;
  else exit 0;
  fi
else echo "\n la reponse est oui du coup je t'ouvre le fichier \n"
  open cv1.tex
fi
exit 0;
#
  


#pdflatex cv1.tex && cp cv1.pdf CV_Ismail_Guedira.pdf && pdflatex cv1.tex && cp cv1_english.pdf CV_Ismail_Guedira_en.pdf