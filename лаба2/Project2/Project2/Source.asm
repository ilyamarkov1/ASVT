.686
.model flat,stdcall
.stack 100h

.data
  X dw 99C5h
  Y dw 2A6Ch
  Z dw 80CFh
  R dw ?

.code
ExitProcess PROTO STDCALL :DWORD
Start:

    xor Eax, Eax 
    xor Edx, Edx
    xor Ecx, Ecx
    xor Ebx, Ebx

    mov ax, [X]
    mov bx, [Y]
    mov cx, [Z]

    call exchange_bytes
    

    mov [X], ax
    mov [Y], bx
    mov [Z], cx

    add ax, bx     
    sub ax, cx     

    cmp ax, 012Bh
    jge call_sub1   
    jmp call_sub2   


exchange_bytes:
    
    rol ax, 8
    rol bx, 8
    rol cx, 8
    ret


subroutine1:
    sar ax, 1        
    sub ax, 0012h    
    ret


subroutine2:
    add ax, 388Ah
    ret


addr1:
    or ax, 0FF0h
    ret


addr2:
    neg ax           
    xor ax, 5555h    
    ret


call_sub1:
    call subroutine1
    jmp check_sign

call_sub2:
    call subroutine2
    jmp check_sign

check_sign:
    test ax, 8000h    
    jz call_addr1     
    jmp call_addr2    

call_addr1:
    call addr1
    jmp end_prog

call_addr2:
    call addr2
    jmp end_prog

end_prog:
    mov R, ax

    invoke ExitProcess, R
End Start