#!/bin/bash

descomprimir () {
	IMAGENES_COMPRIMIRDAS=$1
	SUMA_VERIFICACION=$($2 | cut -d' ' -f 1)
	
	cd $IMAGENES_COMPRIMIDAS
	for archivo in *;do
		gunzip $archivo
	done
}

descomprimir $1 $2
