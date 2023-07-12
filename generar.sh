#!/bin/bash

generarImagenes () {
	if ! [ -e ArchivoNombres ]; then curl -L https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv --output "ArchivoNombres"; fi
	LINEAS=$(wc -l ArchivoNombres | cut -d' ' -f 1)

	if [ -e images ]
	then
		rm -r images
		mkdir -p images
	else
		mkdir -p images
	fi


	for i in $(seq 1 $1)
	do	
		LIMITE=$(($RANDOM % $LINEAS))
		NOMBRE_RANDOM=$(sed -n "$LIMITE"p ArchivoNombres | cut -d',' -f 1 | tr -d ' ')
		cd images
		curl -L https://source.unsplash.com/random/900%C3%97700/?person --output "$NOMBRE_RANDOM"
		sleep 1
		cd ..
	done
	
	gzip -r images	
	
	cd images
	for archivo in *; do
		md5sum $archivo >> sumaDeVerificacion.txt
	done
}

generarImagenes $1 
