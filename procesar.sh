#!/bin/bash

function procesar () {
	#Valida los argumentos
	if [ $# -ne 1 ]; then echo "Debe ingresar un solo argumento" && return 1; fi
	if ! [ -d $1 ]; then echo "El argumento debe ser una carpeta" && return 1; fi

		
	cd $1
	#Recorta las imágenes con nombre válido
	regex="^[A-Z][a-z](.*jpg)$"
	for archivo in *
	do
		if [[ $archivo =~ $regex ]]
		then
			convert $archivo -gravity center -resize 512x512+0+0 \-extent 512x512 $archivo
		fi
	done
}

procesar $1
