#!/bin/bash
# 
# Propósito: Automatiza a criação de usuários na AWS
# Utilização: Será usado dentro de um playbook ansible
# Formato do arquivo de entrada: username,group,temp_pass,tagKey,tagValue
# Autor: Izabel Rodrigues
# Esse arquivo é uma customização do arquivo original aws-iam-cria-usuario.sh e adiciona a tag da matricula a todo usuario criado
# Versão 2.0 - Linux
#
#------------------------------------------------------------------------------------------------------------------------------------
INPUT=$1
OLDIFS=$IFS
IFS=','
SEPARADOR=','
KEY='Key='
VALUE='Value='

[ ! -f $INPUT ] && { echo "$INPUT arquivo nao encontrado"; exit 99; }

while read -r user group temp_pass tagKey tagValue || [ -n "$user" ]
do
	if [ "$user" != "username" ]; then
		echo -e "\nCriando o usuário "$user
		aws iam create-user --user-name $user
		echo -e "\nAtribuindo senha ao usuário "$user
	        aws iam create-login-profile --password-reset-required --user-name $user --password $temp_pass
		echo -e "\nAtribuindo grupo ao usuário "$user
		aws iam add-user-to-group --group-name $group --user-name $user
		echo -e "\nAtribuindo a tag de Matricula ao usuario "$user" - matricula "$tagValue
		aws iam tag-user --user-name $user --tags $KEY$tagKey"$SEPARADOR"$VALUE$tagValue
	fi

done < $INPUT
IFS=$OLDIFS
#------------------------------------------------------------------------------------------------------------------------------------
