%macro print 2
    mov rax, 01
    mov rdi, 01
    mov rsi, %1
    mov rdx, %2
    Syscall
%endmacro

section .data
arr db 11h , 12h , 15h , 20h , 10h    ;static array of 5 elements
M1 db "The maximum no is...."
L1 equ $-M1
M2 db "The array is..."
L2 equ $-M2
count2 db 4
count3 db 2
count1 db 4
L3 db 2


section .bss
ans resb 2

section .text
global _start
_start:
    mov rsi, arr             ;output array
    
    loop:
        mov rax, 01
        mov rdi, 01        
        mov rdx, 2
        Syscall
        
        add rsi, 2
        dec byte[count1]
        jnz loop
    
    

    mov rsi, arr
    mov al, 00h
    
    label1:             ;comparing array elements and getting the maximum
    cmp [rsi], al
    jbe label2
    mov al, [rsi]
    
    label2:
    inc rsi
    dec byte[count2]
    jnz label1
    
    mov bl, al
    mov rbp, ans
    
    
    label3:               ;hex to ascii conversion step 1
    rol bl, 04
    mov dl, bl
    and dl, 0Fh
    cmp dl, 09h
    jbe label4
    add dl, 07h
    
    label4:               ;hex to ascii conversion step 2
    add dl, 30h
    mov [rbp], dl
    inc rbp
    dec byte[count3]
    jnz label3  
    
    print M1,L1
    print ans,L2
    
    mov rax, 60
    mov rdx, 0
    Syscall
    
    



