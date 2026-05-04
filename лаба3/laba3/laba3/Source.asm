.686
.model flat, stdcall
.stack 100h

ExitProcess PROTO STDCALL :DWORD

.data
    array WORD 1, 2, 3, 4, 5, 6, 7, 8, 9, 14, 24, 23, 61, 22, 61, 22, 33, 44
    array_length EQU ($ - array) / TYPE array

    current    DWORD ?
    sum_result DWORD ?

.code

Start:          
    fldz               
    xor ecx, ecx        

sum_loop:
    cmp ecx, array_length
    jae done

    
    movzx edx, WORD PTR [array + ecx*2]

    mov ax, dx
    and ax, 000Fh
    cmp ax, 1101b
    jne skip_add_to_sum

    mov DWORD PTR [current], edx
    fiadd DWORD PTR [current]       

skip_add_to_sum:
    inc ecx
    jmp sum_loop

done:
    fistp DWORD PTR [sum_result]    

    push 0
    call ExitProcess

end Start