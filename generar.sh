#!/bin/bash

generarImagenes () {



	#Chequea si existe el archivo con los nombres de personas y si no está lo descarga
	if ! [ -e ArchivoNombres ]; then curl -L https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv --output "ArchivoNombres"; fi

	#Calcula las lineas que tiene el archivo con los nombres
	LINEAS=$(wc -l ArchivoNombres | cut -d' ' -f 1)

	#Crea la carpeta donde se van a guardar las imagenes
	if [ -e images ]
	then
		rm -r images
		mkdir -p images
	else
		mkdir -p images
	fi

	
	#Chequea si se ingresaron argumentos y si el argumento es un número
	if [[ $# -eq 0 ]]; then echo "Tiene que pasar un argumento" && return 2; fi
	if [[ $1 == 0 ]]; then echo "No se generaron imágenes" && return 0; fi
	regex="[[:digit:]]"	
	if [[ $1 =~ $regex ]];then
			for i in $(seq 1 $1)
			do	
				#Se crea un límite para que el número aleatorio no sea mayor a las lineas del archivo de nombres
				LIMITE=$(($RANDOM % $LINEAS))

				#Se elige un nombre aleatorio del archivo y se le eliminan los espacios y numeros
				NOMBRE_RANDOM=$(sed -n "$LIMITE"p ArchivoNombres | cut -d',' -f 1 | tr -d ' ')
				cd images
				curl -L https://source.unsplash.com/random/900%C3%97700/?person --output "$NOMBRE_RANDOM.jpg"
				sleep 1
				cd ..
			done
	else
		echo "Debe pasar un número como argumento" && return 1
	fi
	
	#Comprime los archivos dentro de la carpeta creada
	gzip -r images	
	
	#Genera un archivo con la suma de verificación de todas las imágenes
	cd images
	for archivo in *; do
		md5sum $archivo >> checksum.txt
	done

}

generarImagenes $1 
