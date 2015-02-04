# ProjetImage
http://mrim.imag.fr/GINF53C4/PROJET/
<br>
http://mrim.imag.fr/GINF53C4/COURS/
<br>
Génération du modèle color_aeroplane.svm: <br>
./libsvm/svm-train -w+1 19 -b 1 train/svm/color_aeroplane.svm train/model/color_aeroplane.model
<br>
Génération de color_aeroplane.out : <br>
./libsvm/svm-predict -b 1 val/svm/color.svm model/color_aeroplane.model out/color_aeroplane.out