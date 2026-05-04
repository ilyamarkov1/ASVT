$MOD51	
ORG 0000H
SJMP START


SEND_CHAR:
    MOV SBUF, A
WAIT_TI:
    JNB TI, WAIT_TI
    CLR TI
    RET


START:
    MOV 30H, #'M'
    MOV 31H, #'a'
    MOV 32H, #'r'
    MOV 33H, #'k'
    MOV 34H, #'o'
    MOV 35H, #'v'
    MOV 36H, #' '
    MOV 37H, #'I'
    MOV 38H, #'l'
    MOV 39H, #'y'
    MOV 3AH, #'a'

    MOV 3BH, #' '
    MOV 3CH, #' '
    MOV 3DH, #' '
    MOV 3EH, #' '
    MOV 3FH, #' '
    MOV 40H, #' '
    MOV 41H, #' '
    MOV 42H, #' '
    MOV 43H, #' '


    MOV TMOD, #20H      
    MOV TH1,  #0FDH
    MOV TL1,  #0FDH
    MOV SCON, #50H      
    ANL PCON, #7FH           
    SETB TR1           


    MOV R0, #30H
    MOV R7, #20

TX_LOOP:
    MOV A, @R0
    ACALL SEND_CHAR
    INC R0
    DJNZ R7, TX_LOOP

HERE:
    SJMP HERE
END