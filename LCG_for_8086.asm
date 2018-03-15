x_var dw ?
c_const dw 0x000D
a_const dw 0x0007                             

;counter dw 0x0000; счётчик до повторения послед-ти
initial_ax dw 0x0001; случайное зерно

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

stop_shit:
    hlt
    jmp stop_shit
