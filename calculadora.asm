global _start

extern soma
extern subtracao
extern multiplicacao
extern divisao
extern mod
extern expo

section .data

msgNome db "Digite seu nome: "
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

msgResultado db 10,"Resultado: "
tamResultado equ $-msgResultado

msgErro16 db 10,"ERRO: valor fora do intervalo de 16 bits",10
tamErro16 equ $-msgErro16

section .bss

nome resb 50
precisao resb 2
opcao resb 2
numBuffer resb 16
resultadoBuffer resb 16
num1 resd 1
num2 resd 1

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
    je executar_expo

    cmp al, '6'
    je executar_mod

    cmp al, '7'
    je fim

    jmp menu

executar_soma:

    push tamNum1
    push msgNum1
    call print_string
    add esp, 8

; Ler o primeiro número com base na precisão escolhida
    mov al, [precisao]

    cmp al, '0'
    je ler_num1_16

    jmp ler_num1_32

    ler_num1_16:

        call read_int16
        jmp guardar_num1

    ler_num1_32:

        call read_int32

    guardar_num1:

        mov [num1], eax
; Fim da leitura do primeiro número

    push tamNum2
    push msgNum2
    call print_string
    add esp, 8

; Ler o segundo número com base na precisão escolhida
    mov al, [precisao]

    cmp al, '0'
    je ler_num2_16

    jmp ler_num2_32

    ler_num2_16:

        call read_int16
        jmp guardar_num2

    ler_num2_32:

        call read_int32

    guardar_num2:

        mov [num2], eax
; Fim da leitura do segundo número

    push dword [num2]
    push dword [num1]
    call soma
    add esp, 8

    mov [num1], eax

    push tamResultado
    push msgResultado
    call print_string
    add esp, 8

    push dword [num1]
    call print_int
    add esp, 4

    jmp menu

executar_subtracao:

    push tamNum1
    push msgNum1
    call print_string
    add esp, 8

    mov al, [precisao]

    cmp al, '0'
    je ler_sub_num1_16

    jmp ler_sub_num1_32

    ler_sub_num1_16:

        call read_int16
        jmp guardar_sub_num1

    ler_sub_num1_32:

        call read_int32

    guardar_sub_num1:

        mov [num1], eax

        push tamNum2
        push msgNum2
        call print_string
        add esp, 8

        mov al, [precisao]

        cmp al, '0'
        je ler_sub_num2_16

        jmp ler_sub_num2_32

    ler_sub_num2_16:

        call read_int16
        jmp guardar_sub_num2

    ler_sub_num2_32:

        call read_int32

    guardar_sub_num2:

        mov [num2], eax

    push dword [num2]
    push dword [num1]
    call subtracao
    add esp, 8

    mov [num1], eax

    push tamResultado
    push msgResultado
    call print_string
    add esp, 8

    push dword [num1]
    call print_int
    add esp, 4

    jmp menu

executar_multiplicacao:

    push tamNum1
    push msgNum1
    call print_string
    add esp, 8

    mov al, [precisao]

    cmp al, '0'
    je ler_mul_num1_16

    jmp ler_mul_num1_32

    ler_mul_num1_16:

        call read_int16
        jmp guardar_mul_num1

    ler_mul_num1_32:

        call read_int32

    guardar_mul_num1:

        mov [num1], eax

        push tamNum2
        push msgNum2
        call print_string
        add esp, 8

        mov al, [precisao]

        cmp al, '0'
        je ler_mul_num2_16

        jmp ler_mul_num2_32

    ler_mul_num2_16:

        call read_int16
        jmp guardar_mul_num2

    ler_mul_num2_32:

        call read_int32

    guardar_mul_num2:

        mov [num2], eax

    push dword [num2]
    push dword [num1]
    call multiplicacao
    add esp, 8

    mov [num1], eax

    push tamResultado
    push msgResultado
    call print_string
    add esp, 8

    push dword [num1]
    call print_int
    add esp, 4

    jmp menu

executar_divisao:

    push tamNum1
    push msgNum1
    call print_string
    add esp, 8

    mov al, [precisao]

    cmp al, '0'
    je ler_div_num1_16

    jmp ler_div_num1_32

    ler_div_num1_16:

        call read_int16
        jmp guardar_div_num1

    ler_div_num1_32:

        call read_int32

    guardar_div_num1:

        mov [num1], eax

        push tamNum2
        push msgNum2
        call print_string
        add esp, 8

        mov al, [precisao]

        cmp al, '0'
        je ler_div_num2_16

        jmp ler_div_num2_32

    ler_div_num2_16:

        call read_int16
        jmp guardar_div_num2

    ler_div_num2_32:

        call read_int32

    guardar_div_num2:

        mov [num2], eax

    push dword [num2]
    push dword [num1]
    call divisao
    add esp, 8

    mov [num1], eax

    push tamResultado
    push msgResultado
    call print_string
    add esp, 8

    push dword [num1]
    call print_int
    add esp, 4

    jmp menu

executar_expo:

    push tamNum1
    push msgNum1
    call print_string
    add esp, 8

    mov al, [precisao]

    cmp al, '0'
    je ler_exp_num1_16

    jmp ler_exp_num1_32

    ler_exp_num1_16:

        call read_int16
        jmp guardar_exp_num1

    ler_exp_num1_32:

        call read_int32

    guardar_exp_num1:

        mov [num1], eax

        push tamNum2
        push msgNum2
        call print_string
        add esp, 8

        mov al, [precisao]

        cmp al, '0'
        je ler_exp_num2_16

        jmp ler_exp_num2_32

    ler_exp_num2_16:

        call read_int16
        jmp guardar_exp_num2

    ler_exp_num2_32:

        call read_int32

    guardar_exp_num2:

        mov [num2], eax

    push dword [num2]
    push dword [num1]
    call expo
    add esp, 8

    mov [num1], eax

    push tamResultado
    push msgResultado
    call print_string
    add esp, 8

    push dword [num1]
    call print_int
    add esp, 4

    jmp menu

executar_mod:

    push tamNum1
    push msgNum1
    call print_string
    add esp, 8

    mov al, [precisao]

    cmp al, '0'
    je ler_mod_num1_16

    jmp ler_mod_num1_32

    ler_mod_num1_16:

        call read_int16
        jmp guardar_mod_num1

    ler_mod_num1_32:

        call read_int32

    guardar_mod_num1:

        mov [num1], eax

        push tamNum2
        push msgNum2
        call print_string
        add esp, 8

        mov al, [precisao]

        cmp al, '0'
        je ler_mod_num2_16

        jmp ler_mod_num2_32

    ler_mod_num2_16:

        call read_int16
        jmp guardar_mod_num2

    ler_mod_num2_32:

        call read_int32

    guardar_mod_num2:

        mov [num2], eax

    push dword [num2]
    push dword [num1]
    call mod
    add esp, 8

    mov [num1], eax

    push tamResultado
    push msgResultado
    call print_string
    add esp, 8

    push dword [num1]
    call print_int
    add esp, 4

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


print_int:

    push ebp
    mov ebp, esp

    push ebx
    push ecx
    push edx
    push esi

    mov eax, [ebp+8]

    mov esi, resultadoBuffer
    add esi, 15

    mov byte [esi], 10

    mov ebx, 10

converter:

    dec esi

    xor edx, edx
    div ebx

    add dl, '0'
    mov [esi], dl

    test eax, eax
    jnz converter

    mov ecx, resultadoBuffer
    add ecx, 16

    sub ecx, esi

    push ecx
    push esi
    call print_string
    add esp, 8

    pop esi
    pop edx
    pop ecx
    pop ebx

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

read_int32:

    push ebp
    mov ebp, esp

    push 16
    push numBuffer
    call read_string
    add esp, 8

    push numBuffer
    call atoi
    add esp, 4

    pop ebp
    ret

read_int16:

    push ebp
    mov ebp, esp

    push 16
    push numBuffer
    call read_string
    add esp, 8

    push numBuffer
    call atoi
    add esp, 4

    cmp eax, 32767
    jg erro16

    cmp eax, -32768
    jl erro16

    pop ebp
    ret

erro16:

    push tamErro16
    push msgErro16
    call print_string
    add esp, 8

    jmp fim

atoi:

    push ebp
    mov ebp, esp

    mov esi, [ebp+8]

    xor eax, eax

loop_atoi:

    xor ebx, ebx
    mov bl, [esi]

    cmp bl, 10
    je fim_atoi

    cmp bl, 0
    je fim_atoi

    sub bl, '0'

    imul eax, eax, 10

    add eax, ebx

    inc esi

    jmp loop_atoi

fim_atoi:

    pop ebp
    ret