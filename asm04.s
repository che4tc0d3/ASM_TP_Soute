section .data
    msg_insert db "Entrer un nombre (parite): ", 0
    message_even db "Le nombre est pair", 10   ; message à afficher si le nombre est pair
    message_odd db 'Le nombre est impair', 10  ; message à afficher si le nombre est impair

section .bss

    valueinsert db 3
section .text
    global _start        ; point d'entrée du programme

_start:

    ;Demande un nombre au user
     mov eax, 4        ; appeler la fonction système pour écrire sur la sortie standard
     mov ebx, 1        ; la sortie standard est le flux de sortie (STDOUT)
     mov ecx, msg_insert  ; passer le message à afficher
     mov edx, 27       ; la longueur du message en octets
     int 0x80          ; appeler le noyau


    ;Lire la valeur entrer par le user et bien ajouter la destination 
      mov eax, 3
      mov ebx, 2
      mov ecx, valueinsert
      mov edx, 3
      int 0x80
 
      ;Comparaison de la valeur avec 42
      mov ax, [valueinsert]   ; Chargez la valeur à diviser dans le registre EAX
      mov bx,2 ; bx=2
      xor dx,dx ; dx=0
      div bx
      cmp dx, 0
      je even
      jmp odd

odd:
    ; Si le nombre est impair, afficher le message et renvoyer 1
    mov eax, 4        ; appeler la fonction système pour écrire sur la sortie standard
    mov ebx, 1        ; la sortie standard est le flux de sortie (STDOUT)
    mov ecx, message_odd  ; passer le message à afficher
    mov edx, 21       ; la longueur du message en octets
    int 0x80          ; appeler le noyau
    jmp end

even:
    ; Si le nombre est pair, afficher le message et renvoyer 0
    mov eax, 4        ; appeler la fonction système pour écrire sur la sortie standard
    mov ebx, 1        ; la sortie standard est le flux de sortie (STDOUT)
    mov ecx, message_even  ; passer le message à afficher
    mov edx, 20       ; la longueur du message en octets
    int 0x80          ; appeler le noyau

end:
    mov rax, 60 ; syscall number for exit
    mov rdi, 0
    int 0x80
