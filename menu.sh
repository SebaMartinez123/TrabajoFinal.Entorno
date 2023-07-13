#!/bin/bash

menu.sh() {
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
			1) read a
				source generar.sh
				;;
			2) read b c
				source descomprimir.sh  
				;;
			3) read d
				source procesar.sh
				;;
			4) source comprimir.sh
				;;
			0) exit 0 
				;;
			*)
				echo "Opción inválida. Por favor, ingresa un número válido."
				;;
		esac

		echo
	done
}

menu.sh
