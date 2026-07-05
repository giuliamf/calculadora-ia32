global mod

section .text

mod:

    push ebp
    mov ebp, esp

    mov eax, [ebp+8]

    cdq

    idiv dword [ebp+12]

    mov eax, edx

    pop ebp
    ret