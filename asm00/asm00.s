section .data
 
 
 section .text
     global _start
     _start:
 
     mov eax, 1 ; syscall number for exit
     mov ebx, 0
     int 0x80        
