section .data
    message db "1337",0   ; message à afficher
section .text
    global _start        ; point d'entrée du programme

_start:
    ; Vérifier si le programme a reçu 42 en paramètre
    mov al, byte [esp+8]
    cmp al, '4'
    jne not_42

    ; Si 42 a été reçu, renvoyer 0 et quitter
    mov eax, 0
    mov ebx, 0
    int 0x80

not_42:
    ; Afficher 1337
    mov eax, 4        ; appeler la fonction système pour écrire sur la sortie standard
    mov ebx, 1        ; la sortie standard est le flux de sortie (STDOUT)
    mov ecx, message  ; passer le message à afficher
    mov edx, 4        ; la longueur du message en octets
    int 0x80          ; appeler le noyau

    ; Renvoyer 1 et quitter
    mov eax, 1
    mov ebx, 0
    int 0x80
    

