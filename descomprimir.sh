#!/bin/bash

descomprimir () {
	if ! [ $# -eq 2 ];then echo "Se deben ingresar dos argumentos" && return 2; fi
	if ! [ -d $1 ]; then echo "Primero se deben crear las imágenes" && return 2; fi
	if ! [ -f $1/$2 ]; then echo "$2 no es un archivo" && return 2; fi

	cd `pwd`/$1

	md5sum -c $2
	if [[ $? -eq 0 ]]
	then
      		for archivo in *.gz
		do	
			gunzip $archivo
		done
	echo "Imágenes descomprimidas con éxito"
	else
       		echo "La suma de verificación de uno de los archivos no coincide" && return 1
	fi
}

descomprimir $1 $2
