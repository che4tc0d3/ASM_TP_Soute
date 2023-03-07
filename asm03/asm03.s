global _start

section .data
      msg db "1337", 0
section .text

_start:


    ; Check 1st char of the value and compare it to 4 first
    mov al, byte [esp+8]
    cmp al, '4'
    jne end

    ; Check 2nd char of our value and compare to 2 
    mov bl, [esp+9]
    cmp bl, '2'
    jne end

    ; Check 3rd char of our value and verify there is nothing after
    mov cl, [esp+10]
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
