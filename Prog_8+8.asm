section .text
global _start
_start:

    mov eax, 8       ;int eax = 4
    mov ebx, 8      ;int ebx = 4
    add eax, ebx    ;eax += ebx
    mov ecx,10
    jmp div

div:
    div ecx         ; eax/ecs -> eax = quotien et edx = reste
    add edx, 0x30   ;3 -> '3'
    push edx
    xor edx, edx
    inc esi
    cmp eax, 0      ; comparaison pour savoir si eax vaut 0 (qui est la condition d'arret si il n y a  plus    rien dans le quotien)
    jne div
    jmp print

print:
    mov eax , 4     ;Numéro de syscall write
    mov ebx, 1      ;int fd=1(file descriptor) : STDOUT
    mov ecx, esp    ;Char *buf = esp (esp qui est le haut de la stack)
    mov edx,1       ;int len = 1
    int 80h
    dec esi
    cmp esi,0
    pop eax         ; or add esp, 4 pour retirer 4 octecs du haut de la stack
    jne print
    jmp exit

exit:
    ;Syscall exit(0)
    mov eax, 1
    xor ebx,ebx     ;xor une valeur aec elle meme = 0
    int 80h
