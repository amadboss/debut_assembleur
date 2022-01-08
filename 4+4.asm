section .text
global _start
_start:

    mov eax, 4  ;int eax = 4
    mov ebx, 4;int ebx = 4
    add eax, ebx    ;eax += ebx
    add eax, 0x30   ;eax =+ 0x30
    push eax    ;met eax sur le haut de la stack

    mov eax , 4 ;Numéro de syscall write
    mov ebx, 1  ;int fd=1 : STDOUT
    mov ecx, esp    ;Char *buf = esp
    mov edx,1   ; int len = 1

    int 80h ; Syscall write(STDOUT)

    ;Syscall exit(0)
    mov eax, 1
    xor ebx,ebx ;xor une valeur aec elle meme = 0
    int 80h
