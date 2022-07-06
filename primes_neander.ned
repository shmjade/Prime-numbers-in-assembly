	org 246
div: db 0
rest: db 0
primes0: db 0
primes1: db 0
primes2: db 0
cons_0: db 0
cons_n2: db 254
cons_n1: db 255

	org 00
;=======================================================
;                      primes0
;=======================================================
	LDA primes0
	JZ is_prime_0		; if(primes0==0), go to "end"
	JN not_prime0		; if(primes0<0), change primes0 to 0
	STA rest		; rest = primes0
	ADD cons_n1		
	JZ is_prime_0		; if(primes0-1=0), go to "end"
	ADD cons_n1		
	JZ is_prime_0		; if(primes0-2=0), go to "end"

; Check if it is pair
	LDA cons_n2
	STA div			; div = -2
loop_pair0:
	LDA rest		
	ADD div
	STA rest		; rest = rest-2
	JZ not_prime0		; it is pair (and it is not number 2), thus, it is not prime
	JN not_pair0		; if(rest-2<0), try 3, as 2 is not a divider of primes0
	JMP loop_pair0		; if(rest-2>0), subtract again

; It is not pair, check other possible dividers
not_pair0:
	LDA div
	ADD cons_n1
	STA div			; div = -2-1 = -3
	LDA primes0
	STA rest
; Division (subtractions)
loop_0:
	LDA rest		
	ADD div
	STA rest		; rest = rest + div
	JZ verify_equal_0	; if(rest+div==0), check if div==primes0 (if so, it is prime)
	JN try_next_0		; if(rest+div<0), try next, as div is not a divider of primes0
	JMP loop_0		; if(rest+div>0), subtract again
; Try another number: -3-2k, k>0
try_next_0:
	LDA div			
	ADD cons_n2
	STA div			; div-=2
	LDA primes0
	STA rest		; rest = primes0
	JMP loop_0		; try again sucessive subtractions with |div|
; Check if it is prime (|div|==primes[x])
verify_equal_0:
	LDA primes0
	ADD div
	JZ is_prime_0		;if(primes[x]+div==0), |div| and 1 are the only dividers of primes[x]
;if(primes[x]+div!=0), primes[x] has a divider that is not itself or 1, thus, it is not prime
not_prime0:
	LDA cons_0		
	STA primes0
;end of verification
is_prime_0:
;=======================================================
;                      primes1
;=======================================================
	LDA primes1
	JZ is_prime_1		; if(primes0==0), go to "end"
	JN not_prime1		; if(primes0<0), change primes0 to 0
	STA rest		; rest = primes0
	ADD cons_n1		
	JZ is_prime_1		; if(primes0-1=0), go to "end"
	ADD cons_n1		
	JZ is_prime_1		; if(primes0-2=0), go to "end"

; Check if it is pair
	LDA cons_n2
	STA div			; div = -2
loop_pair1:
	LDA rest		
	ADD div
	STA rest		; rest = rest-2
	JZ not_prime1		; it is pair (and it is not number 2), thus, it is not prime
	JN not_pair1		; if(rest-2<0), try 3, as 2 is not a divider of primes0
	JMP loop_pair1		; if(rest-2>0), subtract again

; It is not pair, check other possible dividers
not_pair1:
	LDA div
	ADD cons_n1
	STA div			; div = -2-1 = -3
	LDA primes1
	STA rest
; Division (subtractions)
loop_1:
	LDA rest		
	ADD div
	STA rest		; rest = rest + div
	JZ verify_equal_1	; if(rest+div==0), check if div==primes0 (if so, it is prime)
	JN try_next_1		; if(rest+div<0), try next, as div is not a divider of primes0
	JMP loop_1		; if(rest+div>0), subtract again
; Try another number: -3-2k, k>0
try_next_1:
	LDA div			
	ADD cons_n2
	STA div			; div-=2
	LDA primes1
	STA rest		; rest = primes0
	JMP loop_1		; try again sucessive subtractions with |div|
; Check if it is prime (|div|==primes[x])
verify_equal_1:
	LDA primes1
	ADD div
	JZ is_prime_1		;if(primes[x]+div==0), |div| and 1 are the only dividers of primes[x]
;if(primes[x]+div!=0), primes[x] has a divider that is not itself or 1, thus, it is not prime
not_prime1:
	LDA cons_0		
	STA primes1
;end of verification
is_prime_1:
;=======================================================
;                      primes2
;=======================================================
	LDA primes2
	JZ is_prime_2		; if(primes0==0), go to "end"
	JN not_prime2		; if(primes0<0), change primes0 to 0
	STA rest		; rest = primes0
	ADD cons_n1		
	JZ is_prime_2		; if(primes0-1=0), go to "end"
	ADD cons_n1		
	JZ is_prime_2		; if(primes0-2=0), go to "end"

; Check if it is pair
	LDA cons_n2
	STA div			; div = -2
loop_pair2:
	LDA rest		
	ADD div
	STA rest		; rest = rest-2
	JZ not_prime2		; it is pair (and it is not number 2), thus, it is not prime
	JN not_pair2		; if(rest-2<0), try 3, as 2 is not a divider of primes0
	JMP loop_pair2		; if(rest-2>0), subtract again

; It is not pair, check other possible dividers
not_pair2:
	LDA div
	ADD cons_n1
	STA div			; div = -2-1 = -3
	LDA primes2
	STA rest
; Division (subtractions)
loop_2:
	LDA rest		
	ADD div
	STA rest		; rest = rest + div
	JZ verify_equal_2	; if(rest+div==0), check if div==primes0 (if so, it is prime)
	JN try_next_2		; if(rest+div<0), try next, as div is not a divider of primes0
	JMP loop_2		; if(rest+div>0), subtract again
; Try another number: -3-2k, k>0
try_next_2:
	LDA div			
	ADD cons_n2
	STA div			; div-=2
	LDA primes2
	STA rest		; rest = primes0
	JMP loop_2		; try again sucessive subtractions with |div|
; Check if it is prime (|div|==primes[x])
verify_equal_2:
	LDA primes2
	ADD div
	JZ is_prime_2		;if(primes[x]+div==0), |div| and 1 are the only dividers of primes[x]
;if(primes[x]+div!=0), primes[x] has a divider that is not itself or 1, thus, it is not prime
not_prime2:
	LDA cons_0		
	STA primes2
;end of verification
is_prime_2:
	HLT