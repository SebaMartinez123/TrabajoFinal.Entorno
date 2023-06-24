#!/bin/bash

function generarImagenes {	
	curl -L https://raw.githubusercontent.com/fernandezpablo85/name_suggestions/master/assets/dict.csv --output ArchivoNombres
	LINEAS=$(wc -l ArchivoNombres | cut -d' ' -f 1)
	

	if [[ -e images ]];then echo "La carpeta ya existe" && exit 1; else mkdir images; fi
	for i in $(seq 1 $1)
	do
		cd images
		curl -L https://source.unsplash.com/random/900%C3%97700/?person --output $RANDOM 
	sleep 1
	done
}

generarImagenes $1 
