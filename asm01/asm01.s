 section .data
     msg db "1337", 10
 section .text
     global _start
     _start:
 
        mov eax, 4          ;le numéro de l'appel système pour écrire (sys_write)
        mov ebx, 1          ;le descripteur de fichier pour la sortie standard (stdout)
        mov ecx, msg        ;l'adresse du message à afficher
        mov edx, 4          ;la longueur du message
        int 0x80            ;appeler le noyau Linux
 
 
        mov eax, 1 ; syscall number for exit
        mov ebx, 0
        int 0x80
 
 
