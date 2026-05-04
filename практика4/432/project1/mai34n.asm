$MOD51

        jmp start

        org 0bh
        reti

        org 20h

start:
        mov tmod,#01h          
        mov p1,#0h             

met1:
        mov a,#01h
        mov p1,a
        mov r2,#60             
        lcall delay_50ms

        mov a,#02h
        mov p1,a
        mov r2,#60             
        lcall delay_50ms

        mov a,#0Ch
        mov p1,a
        mov r2,#100            
        lcall delay_50ms

        mov a,#30h
        mov p1,a
        mov r2,#100            
        lcall delay_50ms

        mov a,#40h
        mov p1,a
        mov r2,#60             
        lcall delay_50ms

        mov a,#80h
        mov p1,a
        mov r2,#60             
        lcall delay_50ms

        jmp met1

delay_50ms:
        push 02                
        mov a,r2
        mov r3,a               

delay_loop:
        mov TL0,#0B0h          
        mov TH0,#3Ch           
        setb TR0               

wait_tf0:
        jnb TF0, wait_tf0     
        clr TF0                
        clr TR0                

        djnz r3, delay_loop    

        pop 02                 
        ret

        END