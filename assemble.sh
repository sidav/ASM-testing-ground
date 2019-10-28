#!/bin/bash

ext_trimmed_name=$(echo $1 | sed 's%.asm%%g')

printf 'Starting the assembly of '$ext_trimmed_name'.asm'
nasm -felf $ext_trimmed_name.asm -g -F dwarf -o $ext_trimmed_name.o

for i in {1..3}; do
	printf '.'
	sleep 0.5
done

echo

mkdir build

echo 'Using the GNU Linker (ld) on '$ext_trimmed_name'.o'
ld -m elf_i386 -s $ext_trimmed_name.o -o build/$ext_trimmed_name 

echo 'Removing the '$ext_trimmed_name'.o'
rm $ext_trimmed_name.o 

echo 'Build successful.'

