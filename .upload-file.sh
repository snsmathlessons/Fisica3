#!/bin/bash

PROJECT_NAME="FormularioFisica3"

CURRENT_BRANCH=$(if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then echo $TRAVIS_BRANCH; else echo $TRAVIS_PULL_REQUEST_BRANCH; fi)

if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
    curl --header "Content-Type: multipart/form-data" -F "file[]=@Formulario.pdf;filename=${PROJECT_NAME}-${CURRENT_BRANCH}.pdf" https://uz.sns.it/~trenta3/Fisica3/upload.php?key=${BALBO_KEY}
else
    echo "Siamo in una PR, non aggiorno"
fi

