$MOD51
ORG 00h

START:
        
        MOV P0, #038h      
        MOV P2, #1
        MOV P2, #0

        MOV P0, #00Eh      
        MOV P2, #1
        MOV P2, #0

        MOV P0, #006h      
        MOV P2, #1
        MOV P2, #0

        MOV P0, #001h      
        MOV P2, #1
        MOV P2, #0
        
       
        MOV P0, #080h     
        MOV P2, #1
        MOV P2, #0
        
        MOV P0, #0A9h      
        MOV P2, #3         
        MOV P2, #2         
        
        
        MOV P0, #0C0h      
        MOV P2, #1
        MOV P2, #0
        
        MOV P0, #0ACh      
        MOV P2, #3
        MOV P2, #2
        
        
        MOV P0, #081h      
        MOV P2, #1
        MOV P2, #0
        
        MOV P0, #0BDh      
        MOV P2, #3
        MOV P2, #2
        
        
        MOV P0, #0C1h     
        MOV P2, #1
        MOV P2, #0
        
        MOV P0, #0C0h      
        MOV P2, #3
        MOV P2, #2
        
      
        MOV P0, #082h     
        MOV P2, #1
        MOV P2, #0
        
        MOV P0, #020h      
        MOV P2, #3
        MOV P2, #2
        
        
        MOV P0, #0C2h      
        MOV P2, #1
        MOV P2, #0
        
        MOV P0, #0ADh      
        MOV P2, #3
        MOV P2, #2
        
   
        MOV P0, #083h     
        MOV P2, #1
        MOV P2, #0
        
        MOV P0, #0A0h      
        MOV P2, #3
        MOV P2, #2
        
        
        MOV P0, #0C3h      
        MOV P2, #1
        MOV P2, #0
        
        MOV P0, #0B1h      
        MOV P2, #3
        MOV P2, #2
        

        MOV P0, #084h      
        MOV P2, #1
        MOV P2, #0
        
        MOV P0, #0ABh      
        MOV P2, #3
        MOV P2, #2
        
    
        MOV P0, #0C4h      
        MOV P2, #1
        MOV P2, #0
        
        MOV P0, #0AFh      
        MOV P2, #3
        MOV P2, #2
        
       
        MOV P0, #085h      
        MOV P2, #1
        MOV P2, #0
        
        MOV P0, #0A2h      
        MOV P2, #3
        MOV P2, #2
        
HERE:   SJMP HERE

        END