global mod
extern erro_div_zero

section .text

mod:

    push ebp
    mov ebp, esp

    cmp dword [ebp+12], 0
    je erro_div_zero

    mov eax, [ebp+8]

    cdq

    idiv dword [ebp+12]

    mov eax, edx

    pop ebp
    ret