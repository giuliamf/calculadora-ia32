global divisao

section .text

divisao:

    push ebp
    mov ebp, esp

    mov eax, [ebp+8]

    cdq

    idiv dword [ebp+12]

    pop ebp
    ret