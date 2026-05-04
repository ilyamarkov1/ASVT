$MOD51

ORG 0000h

START:
    CLR P1.0          

    MOV DPTR,#0A20h   
    MOV R1,#055h      
    MOV R3,#04h       

BLOCK:
    MOV R2,#00h       

TEST:
    MOV A,R1          
    MOVX @DPTR,A      
    MOVX A,@DPTR      

    XRL A,#055h       
    JNZ ERROR         

    INC DPTR          
    DJNZ R2,TEST      
    DJNZ R3,BLOCK     

OK:
    SJMP OK           

ERROR:
    SETB P1.0         

STOP:
    SJMP STOP

END