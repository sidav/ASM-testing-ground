; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"    
    x_var dw ?
    c_const dw 0x000D
    a_const dw 0x0007                             
    
    ;counter dw 0x0000; счётчик до повторения послед-ти
    initial_ax dw 0x0001; случайное зерно    
ends                         


stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here   
    
    mov ax, initial_ax
main:
    mov x_var, ax
    call next_rnd
    ;inc counter 
    inc cx
    cmp ax, initial_ax
    je stop_shit
    jmp main  

next_rnd:
    mov ax, x_var 
    mov bx, a_const
    mul bx
    add ax, c_const
    mov x_var, ax       
    ret
    
    ;----------------------------------------        
    lea dx, pkey
    mov ah, 9
    int 21h        ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
    
    stop_shit:
        hlt
        jmp stop_shit
ends

end start ; set entry point and stop the assembler.
       