global expo

section .text

expo:

    push ebp
    mov ebp, esp

    mov ebx, [ebp+8]     ; base
    mov ecx, [ebp+12]    ; expoente

    mov eax, 1

loop_exp:

    cmp ecx, 0
    je fim_exp

    imul eax, ebx

    dec ecx
    jmp loop_exp

fim_exp:

    pop ebp
    ret