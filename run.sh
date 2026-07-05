#!/bin/bash

./build.sh || exit 1

echo ""
echo "Executando..."
echo ""

qemu-i386 ./calculadora