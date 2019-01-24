#!/bin/sh

#script gerado para rodar no Mac

BACKEND='../multiplataforma/environments/dev/'
SERVICE=${1//[^a-zA-Z]}

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 1
fi


if [ -d "$BACKEND" ]
then
  dir_atual=$(pwd)
  cd $BACKEND
  cp task-definition/app_default.json task-definition/app_$SERVICE.json
  LISTNER_PRIORITY=$(cat app_default.tf | grep listener_rule_priority | sed -e 's/"//g' | cut -f2 -d '=' | tail -1)
  cd $dir_atual
  VALUE_PRIORITY=$(($LISTNER_PRIORITY + 1))
  cp files/module.txt files/$SERVICE.txt

  sed -i "" "s/VALUE_PRIORITY/$VALUE_PRIORITY/g" files/$SERVICE.txt
  sed -i "" "s/NAME/$SERVICE/g" files/$SERVICE.txt
  cat files/$SERVICE.txt >> ../multiplataforma/environments/dev/app_default.tf

  rm files/$SERVICE.txt

else
  echo "diretorio nao existe"
fi
