$MOD52	
            ORG     0000H
            LJMP    START

            ORG     0003H          
            LJMP    KEY_INC_ISR    

            ORG     0013H          
            LJMP    KEY_DEC_ISR    

            ORG     002BH          
            LJMP    TIMER2_ISR

DUTY        EQU     30H            
STEP_CNT    EQU     31H            

PWM_OUT     BIT     090H           



START:
            MOV     P1, #0FFH     
            MOV     P3, #0FFH      

            MOV     DUTY, #50      
            MOV     STEP_CNT, #00

         
            MOV     RCAP2H, #0FDH
            MOV     RCAP2L, #0A8H
            MOV     TH2,    #0FDH
            MOV     TL2,    #0A8H

            MOV     T2CON, #00H    
            CLR     TF2

            SETB    IT0           
            SETB    IT1           
            SETB    EX0            
            SETB    EX1            

            SETB    ET2           
            SETB    EA             
            SETB    TR2            

MAIN:

            SJMP    MAIN

KEY_INC_ISR:
           
            MOV     DUTY, #60

            RETI

KEY_DEC_ISR:
           
            MOV     DUTY, #50

            RETI

TIMER2_ISR:
         
            CLR     TF2
            

            MOV     A, STEP_CNT
            CLR     C
            SUBB    A, DUTY
            JC      PWM_HIGH

PWM_LOW:
            CLR     PWM_OUT
            SJMP    NEXT_STEP

PWM_HIGH:
            SETB    PWM_OUT

NEXT_STEP:
            INC     STEP_CNT
            MOV     A, STEP_CNT
            CJNE    A, #100, ISR_EXIT
            MOV     STEP_CNT, #00

ISR_EXIT:
   
            RETI

            END