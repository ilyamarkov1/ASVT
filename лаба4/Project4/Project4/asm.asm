.586
.MODEL flat, C

.DATA
currentX REAL4 ?

.CODE

EXTERN fun_c:NEAR
PUBLIC CalcY

CalcY PROC C

    push ebp
    mov ebp, esp

    push esi
    push edi

    mov esi, [ebp + 8]      
    mov edi, [ebp + 12]     
    mov ecx, [ebp + 16]    

    cmp ecx, 0
    jle cycle_end

    fld dword ptr [ebp + 20]
    fstp currentX           

cycle_start:

    fld currentX
    fstp dword ptr [esi]    

    push ecx

    push dword ptr currentX
    call fun_c
    add esp, 4

    fstp dword ptr [edi]    

    pop ecx

    fld currentX
    fadd dword ptr [ebp + 24]
    fstp currentX        

    add esi, 4
    add edi, 4

    loop cycle_start

cycle_end:

    pop edi
    pop esi

    mov esp, ebp
    pop ebp
    ret

CalcY ENDP

END