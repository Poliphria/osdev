[org 7c00h]

mov dx, 01F3h
call print_hex
jmp $

print_hex:
pusha ; push everything in registers to stack 
mov cx, 4   ; need to iterate four times 

char_iteration:
dec cx  ; decrement cx at start of loop
mov ax, dx  ; move dx into ax for bit masking
shr dx, 4   ; shift for next iteration

mov bx, HEX_OUT
add bx, 2
add bx, cx

and ax, 0fh    ; mask 4 least sig bits
cmp ax, 0ah ; check if ax is a letter or number, if it's less then 'a' then it's a hex number
jl set_num ; if number set the number
add ax, 57h    ; if it's a letter add 57h to it 

set_string: 
mov byte [bx], al ; now that we have the correct value, set it into bx
cmp cx, 0   ; check if counter is 0, if so then end
je end
jmp char_iteration

set_num:
add ax, 30h    ; for a number add 30h
jmp set_string ; ready to set string so jump

end: 
mov bx, HEX_OUT
call print_string
popa
ret

%include "print_string.asm"

HEX_OUT: 
db '0x0000', 0

TEST:
db 'hello', 0

; set padding and magic BIOS #
times 510-($-$$) db 0
dw 0aa55h