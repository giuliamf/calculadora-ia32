#!/bin/bash

echo "Compilando..."

nasm -f elf32 calculadora.asm -o calculadora.o || exit 1
nasm -f elf32 soma.asm -o soma.o || exit 1
nasm -f elf32 subtracao.asm -o subtracao.o || exit 1
nasm -f elf32 multiplicacao.asm -o multiplicacao.o || exit 1
nasm -f elf32 divisao.asm -o divisao.o || exit 1
nasm -f elf32 modulo.asm -o modulo.o || exit 1
nasm -f elf32 exponenciacao.asm -o exponenciacao.o || exit 1

echo "Linkando..."

i686-linux-gnu-ld \
calculadora.o \
soma.o \
subtracao.o \
multiplicacao.o \
divisao.o \
modulo.o \
exponenciacao.o \
-o calculadora || exit 1

echo "Build concluído!"