$MOD51

SOC     BIT P3.6       
EOC     BIT P3.7        
BTN     BIT P3.2        

FLAG    EQU 30H         

ADCL    EQU 31H         
ADCH    EQU 32H         

SHIFT   EQU 1EH         

ORG 0000H
    LJMP START

ORG 0003H
    LJMP ISR_EX0

ORG 0030H

START:

    MOV FLAG, #00H      

    MOV P0, #0FFH     
    MOV P1, #0FFH       
    MOV P2, #080H       

    MOV P3, #08CH       

    SETB IT0         
    CLR IE0
    SETB EX0            
    SETB EA             

MAIN:
    SETB SOC
    CLR SOC

WAIT_EOC:
    JB EOC, WAIT_EOC    

    MOV A, P1
    MOV ADCL, A        

    MOV A, P0
    MOV ADCH, A        

    MOV A, FLAG
    JZ NORMAL_MODE

SHIFT_MODE:
    MOV A, ADCH
    CLR C
    SUBB A, #SHIFT     
    MOV P2, A          
    SJMP MAIN

NORMAL_MODE:
   
    MOV A, ADCH
    MOV P2, A
    SJMP MAIN

ISR_EX0:
    MOV A, FLAG
    XRL A, #01H         
    MOV FLAG, A

    CLR IE0
    RETI

END