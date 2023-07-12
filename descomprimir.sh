#!/bin/bash

descomprimir () {
	cd `pwd`/$1

	for archivo in *.gz;do md5sum -c $archivo $2 && gunzip $archivo; done
}

descomprimir $1 $2
