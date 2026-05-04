.686                  
.model flat,stdcall   
.stack 100h           

.data
    X db 87          
    Y db 60           
    Z db -2           
    M db ?            

.code
ExitProcess PROTO STDCALL :DWORD 

Start:
    mov al, X          
    mov cl, 2
    ror al, cl         
    mov bl, al         

    mov al, Y          
    mov cl, 2
    ror al, cl         
    mov cl, al         

    ; (X' - Y) 
    mov al, bl         
    sub al, Y          
    mov dl, al         

    ; (Z & Y')
    mov al, Z          
    and al, cl         

    add al, dl         
    mov M, al          

exit_program:
    mov al, M          
    invoke ExitProcess, eax 

end Start              