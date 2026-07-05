#!/bin/bash

echo "Compilando..."

nasm -f elf32 calculadora.asm -o calculadora.o || exit 1
nasm -f elf32 soma.asm -o soma.o || exit 1
nasm -f elf32 subtracao.asm -o subtracao.o || exit 1
nasm -f elf32 multiplicacao.asm -o multiplicacao.o || exit 1
nasm -f elf32 divisao.asm -o divisao.o || exit 1
nasm -f elf32 mod.asm -o mod.o || exit 1
nasm -f elf32 expo.asm -o expo.o || exit 1

echo "Linkando..."

i686-linux-gnu-ld \
calculadora.o \
soma.o \
subtracao.o \
multiplicacao.o \
divisao.o \
mod.o \
expo.o \
-o calculadora || exit 1

echo "Build concluído!"