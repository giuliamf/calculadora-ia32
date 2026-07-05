global multiplicacao

section .text

multiplicacao:

    push ebp
    mov ebp, esp

    mov eax, [ebp+8]

    imul dword [ebp+12]

    pop ebp
    ret