#!/bin/bash

function comprimir () {
	if ! [ -d $1 ];then echo "El argumento debe ser un directorio" && return 1; fi

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
	

	
	tar -zcvf /home/matias/entorno/TP/archivosComprimidos.tar.gz *
}

comprimir $1
