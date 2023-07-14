#!/bin/bash

menu () {
	while true; do
		echo "|========================|"
		echo "|    MENU DE OPCIONES    |"
		echo "|========================|"
		echo "|1- Generar imágenes     |"
		echo "|2- Descomprimir imágenes|"
		echo "|3- Procesar imágenes    |"
		echo "|4- Comprimir imágenes   |"
		echo "|0- Salir                |"
		echo "|========================|"
		read -p "Selecciona una opción: " opcion

		case $opcion in
			1) echo "Ingrese número de imágenes a generar: "
				read input
				source generar.sh $input
				cd ..
				;;
			2) source descomprimir.sh images checksum.txt
				if [ $? -eq 0 ];then cd ..;fi
				;;
			3) source procesar.sh images
				if [ $? -eq 0 ];then cd ..;fi
				;;
			4) source comprimir.sh images
				if [ $? -eq 0 ];then cd ..;fi
				;;
			0) echo "Adiós"
				exit 0
				;;
			*)
				echo "Opción inválida. Por favor, ingresa un número válido."
				;;
		esac

		echo
	done
}

menu
