$MOD51

        ORG 0000H
        LJMP START

        ORG 0030H

START:
        MOV TMOD, #12H

        MOV TH0, #0FCH
        MOV TL0, #0FCH
        CLR TF0
        SETB TR0

        MOV P1, #00H

MAIN:
        MOV P1, #07EH

        ACALL RAMP_UP

        ACALL RAMP_DOWN

        MOV P1, #03FH

        ACALL DELAY_250US_T1

        MOV P1, #00H

        ACALL DELAY_500US_T1

        SJMP MAIN


SYNC_T0:
        CLR TR0
        CLR TF0
        MOV TL0, #0FCH
        SETB TR0
        RET

WAIT_T0:
W10:
        JNB TF0, W10
        CLR TF0
        RET


RAMP_UP:
        ACALL SYNC_T0

        MOV R6, #07EH
        MOV R7, #18

UP_LOOP:
        ACALL WAIT_T0
        MOV A, R6
        ADD A, #07H
        MOV R6, A
        MOV P1, A

        DJNZ R7, UP_LOOP

        RET


RAMP_DOWN:
        ACALL SYNC_T0

        MOV R6, #0FCH

        MOV R7, #12

DOWN_FAST:
        ACALL WAIT_T0
        MOV A, R6
        CLR C
        SUBB A, #04H
        MOV R6, A
        MOV P1, A

        DJNZ R7, DOWN_FAST

        MOV R7, #5

DOWN_SLOW:
        ACALL WAIT_T0
        MOV A, R6
        CLR C
        SUBB A, #03H
        MOV R6, A
        MOV P1, A

        DJNZ R7, DOWN_SLOW

        RET

DELAY_250US_T1:
        CLR TR1
        CLR TF1
        MOV TH1, #0FFH
        MOV TL1, #019H
        SETB TR1

D250:
        JNB TF1, D250

        CLR TR1
        CLR TF1
        RET

DELAY_500US_T1:
        CLR TR1
        CLR TF1
        MOV TH1, #0FEH
        MOV TL1, #01FH
        SETB TR1

D500:
        JNB TF1, D500

        CLR TR1
        CLR TF1
        RET

        END