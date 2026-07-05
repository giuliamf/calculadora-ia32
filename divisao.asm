global divisao

extern erro_div_zero

section .text

divisao:

    push ebp
    mov ebp, esp

    cmp dword [ebp+12], 0
    je erro_div_zero

    mov eax, [ebp+8]

    cdq

    idiv dword [ebp+12]

    pop ebp
    ret