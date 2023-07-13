#!/bin/bash

comprimir () {
	if ! [ -d $1 ];then echo "Se deben crear las imágenes primero" && return 1; fi

	cd $1
	nombresValidos="^[A-Z][a-z](.*jpg)$"
	FinalizaConA="(.*a.jpg)$"
	for archivo in *.jpg
	do
		echo $archivo >> listaNombres.txt
		
		if [[ $archivo =~ $nombresValidos ]]; then echo $archivo >> listaNombresValidos.txt; fi

		if [[ $archivo =~ $FinalizaConA ]]; then echo $archivo >> listaFinalizaConA.txt; fi	
	done
	
	#Cuenta la cantidad de personas cuyo nombre finaliza con "a"
	if [ -e listaFinalizaConA.txt ]
	then
		CantidadFinalizaConA=$(wc -l listaFinalizaConA.txt | cut -d' ' -f 1)
	       	echo $CantidadFinalizaConA > CantidadFinalizaConA.txt
		rm listaFinalizaConA.txt
	else
	       	echo "0" > CantidadFinalizaConA.txt
	fi

	if [ -e checksum.txt ];then rm checksum.txt; fi
	
	cd ..
	
	
	tar -zcvf $(pwd)/archivosComprimidos.tar.gz $1/*

	rm -r $1

	echo "Archivos comprimidos con éxito"
}

comprimir $1
