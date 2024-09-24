( Détecteur de murs )
: HI ." Bonjour tout le monde" ;

: robot CR ."           _  " CR ."        __|_|__   " CR ."       |  o o  |  " CR
."      [|   !   |]  " CR    ."     __|  <=>  |__  " CR  ."    |  ^^^^^^^^   | " CR  ."    |  | robot |  |  " CR
."    |  |_______|  |    " CR ."    |__|       |__|    " CR
; 
 
robot CR
HI  CR

( my own return stack - ma propre pile de retour R )
VARIABLE R   
: >R  R ! ;
: R> R @ ;

( timer env. 1 sec )
: MS ( n -- n sec ) 34333 * FOR I DROP NEXT ;

( vide la pile )
: X 100 FOR DROP NEXT ;


CODE PAGE
    print('\033c')
END-CODE

( Modules )
" MotorAVmin.fth" LOAD
" MotorAV.fth" LOAD
" MotorAR.fth" LOAD 
" initlf1.fth" LOAD
" initlf2.fth" LOAD
" initlf3.fth" LOAD
" MotorStop.fth" LOAD
" TurnG90.fth" LOAD
" TurnD90.fth" LOAD
" Stop.fth" LOAD

( applications )
( WD-Détecteur de murs ) 

: TOP 4  FOR MOTORAR NEXT ; 
: TOPLF BEGIN INITLF2  0=  IF MOTORAVMIN THEN  INITLF3 1 =  IF MOTORAR TURNG90 MOTORAVMIN THEN INITLF2  0=  IF MOTORAVMIN THEN INITLF1 1 =  IF MOTORAR TURND90 MOTORAVMIN THEN INITLF2 1 =  IF MOTORSTOP ;; THEN AGAIN ;
: t INITLF1 ." jaune" . CR INITLF2 ." bleu" . CR INITLF3  ." vert" . CR  ;
: T TOPLF ;
WORDS CR
