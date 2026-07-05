global expo
extern overflow

section .text

expo:

    push ebp
    mov ebp, esp

    mov ebx, [ebp+8]
    mov ecx, [ebp+12]

    mov eax, 1

loop_exp:

    cmp ecx, 0
    je fim_exp

    cmp ecx, 0
    jl fim_exp

    imul eax, ebx

    jo overflow

    dec ecx
    jmp loop_exp

fim_exp:

    pop ebp
    ret