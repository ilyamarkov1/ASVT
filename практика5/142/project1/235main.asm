$MOD51

        ORG     00H
        LJMP    START

        ORG     0BH
        LJMP    TIMER0_ISR


        ORG     100H
START:
        MOV     P0, #0FFH
        MOV     P1, #0F0H
        MOV     P2, #00H

        MOV     TMOD, #01H         
        MOV     TH0, #0B1H          
        MOV     TL0, #0E0H
        CLR     ET0                 
        SETB    EA

        
        MOV     P0, #038H
        MOV     P2, #1
        MOV     P2, #0

        MOV     P0, #00CH
        MOV     P2, #1
        MOV     P2, #0

        MOV     P0, #001H
        MOV     P2, #1
        MOV     P2, #0

        MOV     P0, #006H
        MOV     P2, #1
        MOV     P2, #0

        MOV     P0, #001H
        MOV     P2, #1
        MOV     P2, #0
        LCALL   LCD_DELAY


MAIN:
        LCALL   GET_KEY_DEBOUNCED_TIMER
        CJNE    A, #0FFH, SHOW_KEY
        SJMP    MAIN


SHOW_KEY:
        
        MOV     P0, #001H
        MOV     P2, #1
        MOV     P2, #0
        LCALL   LCD_DELAY

        
        MOV     P0, #080H
        MOV     P2, #1
        MOV     P2, #0
        LCALL   LCD_DELAY

        
        MOV     P0, A
        MOV     P2, #3
        MOV     P2, #2
        LCALL   LCD_DELAY


WAIT_RELEASE:
        LCALL   GET_KEY
        CJNE    A, #0FFH, WAIT_RELEASE

        
        LCALL   TIMER_DELAY_1S

        SJMP    MAIN



GET_KEY_DEBOUNCED_TIMER:
        LCALL   GET_KEY
        CJNE    A, #0FFH, KEY_PRESSED_TIMER
        RET

KEY_PRESSED_TIMER:
        PUSH    ACC

        
        LCALL   TIMER_DELAY_1S

        
        LCALL   GET_KEY
        POP     B
        CJNE    A, B, NOT_STABLE_TIMER

        MOV     A, B
        RET

NOT_STABLE_TIMER:
        MOV     A, #0FFH
        RET



TIMER_DELAY_20MS:
        MOV     TH0, #0B1H
        MOV     TL0, #0E0H
        CLR     TF0
        SETB    TR0

WAIT_TIMER:
        JNB     TF0, WAIT_TIMER
        CLR     TR0
        CLR     TF0
        RET


TIMER_DELAY_1S:
        MOV     R6, #50             
DELAY_1S_LOOP:
        LCALL   TIMER_DELAY_20MS
        DJNZ    R6, DELAY_1S_LOOP
        RET


TIMER0_ISR:
        CLR     TR0
        CLR     TF0
        RETI



GET_KEY:
        MOV     P1, #0F0H
        CLR     P1.0
        SETB    P1.1
        SETB    P1.2
        SETB    P1.3
        LCALL   KEY_DELAY
        MOV     A, P1
        ANL     A, #0F0H
        CJNE    A, #0F0H, FOUND0

        MOV     P1, #0F0H
        SETB    P1.0
        CLR     P1.1
        SETB    P1.2
        SETB    P1.3
        LCALL   KEY_DELAY
        MOV     A, P1
        ANL     A, #0F0H
        CJNE    A, #0F0H, FOUND1

        MOV     P1, #0F0H
        SETB    P1.0
        SETB    P1.1
        CLR     P1.2
        SETB    P1.3
        LCALL   KEY_DELAY
        MOV     A, P1
        ANL     A, #0F0H
        CJNE    A, #0F0H, FOUND2

        MOV     P1, #0F0H
        SETB    P1.0
        SETB    P1.1
        SETB    P1.2
        CLR     P1.3
        LCALL   KEY_DELAY
        MOV     A, P1
        ANL     A, #0F0H
        CJNE    A, #0F0H, FOUND3

        MOV     A, #0FFH
        RET


FOUND0:
        CJNE    A, #0E0H, F0_R2
        MOV     A, #'1'
        RET
F0_R2:  CJNE    A, #0D0H, F0_R3
        MOV     A, #'4'
        RET
F0_R3:  CJNE    A, #0B0H, F0_R4
        MOV     A, #'7'
        RET
F0_R4:  CJNE    A, #070H, F0_END
        MOV     A, #'*'
        RET
F0_END: MOV     A, #0FFH
        RET


FOUND1:
        CJNE    A, #0E0H, F1_R2
        MOV     A, #'2'
        RET
F1_R2:  CJNE    A, #0D0H, F1_R3
        MOV     A, #'5'
        RET
F1_R3:  CJNE    A, #0B0H, F1_R4
        MOV     A, #'8'
        RET
F1_R4:  CJNE    A, #070H, F1_END
        MOV     A, #'0'
        RET
F1_END: MOV     A, #0FFH
        RET


FOUND2:
        CJNE    A, #0E0H, F2_R2
        MOV     A, #'3'
        RET
F2_R2:  CJNE    A, #0D0H, F2_R3
        MOV     A, #'6'
        RET
F2_R3:  CJNE    A, #0B0H, F2_R4
        MOV     A, #'9'
        RET
F2_R4:  CJNE    A, #070H, F2_END
        MOV     A, #'#'
        RET
F2_END: MOV     A, #0FFH
        RET


FOUND3:
        CJNE    A, #0E0H, F3_R2
        MOV     A, #'A'
        RET
F3_R2:  CJNE    A, #0D0H, F3_R3
        MOV     A, #'B'
        RET
F3_R3:  CJNE    A, #0B0H, F3_R4
        MOV     A, #'C'
        RET
F3_R4:  CJNE    A, #070H, F3_END
        MOV     A, #'D'
        RET
F3_END: MOV     A, #0FFH
        RET



KEY_DELAY:
        MOV     R7, #20
K_DLY:
        DJNZ    R7, K_DLY
        RET


LCD_DELAY:
        MOV     R7, #0FFH
DLY:
        DJNZ    R7, DLY
        RET

        END