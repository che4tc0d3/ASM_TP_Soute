global _start
section .data
     msg_enter db 'Entrez une valeur: ', 0
     msg db "1337", 0

section .bss
     value resb 4
 
 section .text
 
 _start:
     ;Show a msg asking a user to enter a number
     mov eax, 4
     mov ebx, 1
     mov ecx, msg_enter
     mov edx, 19
     int 0x80
 
     ; save the value in a variable
     mov eax, 3
     mov ebx, 0
     mov ecx, value
     mov edx, 3
     int 0x80
 
 
     ; Check 1st char of the value and compare it to 4 first
     mov al, [value]
     cmp al, '4'
     jne end
 
     ; Check 2nd char of our value and compare to 2 
     mov bl, [value+1]
     cmp bl, '2'
     jne end
 
     ; Check 3rd char of our value and verify there is nothing after
     mov cl, [value+2]
     cmp cl, 10
     jne end
 
 
 good:
     mov eax, 4
     mov ebx, 1
     mov ecx, msg
     mov edx, 4
     int 0x80
 
     mov eax, 0
     mov ebx, 0
     int 0x80
 
 end:
     mov eax, 1 ; sys_exit
     mov ebx, 1 ; code de sortie
     int 0x80
