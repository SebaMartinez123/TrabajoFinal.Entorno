#!/bin/bash
function menu {
	echo =============
	echo !Buenos Días!
	echo =============
	echo Escriba el número de la opción que desee utilizar:
	echo 1- Generar imágen.
	echo 2- Descomprimir archivo.
	echo 3- Recortar imágen.
	echo 4- Comprimir archivo.
	echo 0- Cerrar programa. 
	read OPCION

	while [[ $OPCION != 0 ]]; do
		if [[ $OPCION == 1 ]]; then
			#generar.sh
			echo Opción 1 seleccionada.
		elif [[ $OPCION == 2 ]]; then
			#descomprimir.sh
			echo Opción 2 seleccionada.
		elif [[ $OPCION == 3 ]]; then
			#procesar.sh
			echo Opción 3 seleccionada.
		elif [[ $OPCION == 4 ]]; then
			#comprimir.sh
			echo Opción 4 seleccionada.
		else
			echo El número ingresado no corresponde.
		fi

		echo Si quiere seguir, ingrese el número de la opción que desee. De lo contrario, ingrese '0' si quiere salir del programa.
		read OPCION
	done
	echo !Adiós¡
}

menu
