global _start

extern soma
extern subtracao
extern multiplicacao
extern divisao
extern modulo
extern exponenciacao

section .data

msgNome db "Bem-vindo. Digite seu nome: "
tamNome equ $-msgNome

msgOla db 10,"Hola, "
tamOla equ $-msgOla

msgCalc db ", bem-vindo ao programa de CALC IA-32",10
tamCalc equ $-msgCalc

msgPrecisao db 10,"Vai trabalhar com 16 ou 32 bits (digite 0 para 16 e 1 para 32): "
tamPrecisao equ $-msgPrecisao

msgMenu db 10,"ESCOLHA UMA OPCAO:",10
        db "1: SOMA",10
        db "2: SUBTRACAO",10
        db "3: MULTIPLICACAO",10
        db "4: DIVISAO",10
        db "5: EXPONENCIACAO",10
        db "6: MOD",10
        db "7: SAIR",10

tamMenu equ $-msgMenu

msgNum1 db 10,"Digite o primeiro numero: "
tamNum1 equ $-msgNum1

msgNum2 db 10,"Digite o segundo numero: "
tamNum2 equ $-msgNum2

section .bss

nome resb 50
precisao resb 2
opcao resb 2
numBuffer resb 16

section .text

_start:

    ; Pergunta nome

    push tamNome
    push msgNome
    call print_string
    add esp, 8

    push 50
    push nome
    call read_string
    add esp, 8

    ; Mensagem de boas-vindas

    push tamOla
    push msgOla
    call print_string
    add esp, 8

    push nome
    call strlen
    add esp, 4

    push eax
    push nome
    call print_string
    add esp, 8

    push tamCalc
    push msgCalc
    call print_string
    add esp, 8

    ; Escolha da precisão

    push tamPrecisao
    push msgPrecisao
    call print_string
    add esp, 8

    push 2
    push precisao
    call read_string
    add esp, 8

menu:

    push tamMenu
    push msgMenu
    call print_string
    add esp, 8

    push 2
    push opcao
    call read_string
    add esp, 8

    mov al, [opcao]

    cmp al, '1'
    je executar_soma

    cmp al, '2'
    je executar_subtracao

    cmp al, '3'
    je executar_multiplicacao

    cmp al, '4'
    je executar_divisao

    cmp al, '5'
    je executar_exponenciacao

    cmp al, '6'
    je executar_modulo

    cmp al, '7'
    je fim

    jmp menu

executar_soma:

    push tamNum1
    push msgNum1
    call print_string
    add esp, 8

    push 16
    push numBuffer
    call read_string
    add esp, 8

    push tamNum2
    push msgNum2
    call print_string
    add esp, 8

    push 16
    push numBuffer
    call read_string
    add esp, 8

    jmp menu

executar_subtracao:

    ; implementar depois
    jmp menu

executar_multiplicacao:

    ; implementar depois
    jmp menu

executar_divisao:

    ; implementar depois
    jmp menu

executar_exponenciacao:

    ; implementar depois
    jmp menu

executar_modulo:

    ; implementar depois
    jmp menu

fim:

    mov eax, 1
    xor ebx, ebx
    int 80h

read_string:

    push ebp
    mov ebp, esp

    mov eax, 3
    mov ebx, 0
    mov ecx, [ebp+8]
    mov edx, [ebp+12]

    int 80h

    pop ebp
    ret

strlen:

    push ebp
    mov ebp, esp

    mov esi, [ebp+8]

    xor eax, eax

loop_strlen:

    mov bl, [esi]

    cmp bl, 10
    je fim_strlen

    cmp bl, 0
    je fim_strlen

    inc eax
    inc esi

    jmp loop_strlen

fim_strlen:

    pop ebp
    ret

print_string:

    push ebp
    mov ebp, esp

    mov eax, 4
    mov ebx, 1
    mov ecx, [ebp+8]
    mov edx, [ebp+12]

    int 80h

    pop ebp
    ret