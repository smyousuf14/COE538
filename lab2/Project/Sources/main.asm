;**************************************************************
;* This stationery serves as the framework for a              *
;* user application. For a more comprehensive program that    *
;* demonstrates the more advanced functionality of this       *
;* processor, please see the demonstration applications       *
;* located in the examples subdirectory of the                *
;* Freescale CodeWarrior for the HC12 Program directory       *
;**************************************************************

; export symbols
            XDEF Entry, _Startup            ; export 'Entry' symbol
            ABSENTRY Entry        ; for absolute assembly: mark this as application entry point



; Include derivative-specific definitions 
		INCLUDE 'derivative.inc' 

;********************************************
 ;*          Code Section                   *
;********************************************

; variable/data section

            ORG $3000


; Actual Program

            ORG $4000
            
           
Entry:
_Startup:
           BSET DDRP,%11111111 ; Config. Port P for output
           LDAA #%10000000 ; Prepare to drive PP7 high
           
MainLoop   STAA PTP ; Drive PP7
           LDX #$1FFF ; Initialize the loop counter
Delay      DEX ; Decrement the loop counter
           BNE Delay ; If not done, continue to loop
           EORA #%10000000 ; Toggle the MSB of AccA
           BRA MainLoop ; Go to MainLoop 


            