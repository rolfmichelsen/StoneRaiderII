**********************
*      'DIG-IT'      *
*  MARCH-APRIL 1986  *
*   ROLF MICHELSEN   *
* (C) COPYRIGHT 1986 *
**********************

       SETDP $2400
       ORG   $2400
       PUT   $2400

SWI1   EQU   $0107
STAGE  EQU   $0640

TEGN   FCB   $00,$00,$00,$00,$00
       FCB   $00,$00,$00,$00,$0C
       FCB   $0C,$0C,$0C,$00,$0C
       FCB   $00,$00,$33,$33,$00
       FCB   $00,$00,$00,$00,$00
       FCB   $FF,$00,$00,$00,$00
       FCB   $00,$00,$00,$0C,$3F
       FCB   $30,$3F,$03,$3F,$0C
       FCB   $00,$33,$03,$0C,$0C
       FCB   $30,$33,$00,$00,$0C
       FCB   $3C,$0C,$0F,$3C,$0F
       FCB   $00,$00,$0C,$0C,$0C
       FCB   $00,$00,$00,$00,$00
       FCB   $0C,$30,$30,$30,$30
       FCB   $0C,$00,$00,$0C,$03
       FCB   $03,$03,$03,$0C,$00
       FCB   $00,$00,$33,$0C,$3F
       FCB   $0C,$33,$00,$00,$00
       FCB   $0C,$0C,$3F,$0C,$0C
       FCB   $00,$00,$00,$00,$00
       FCB   $00,$00,$0C,$30,$00
       FCB   $00,$00,$00,$3F,$00
       FCB   $00,$00,$00,$00,$00
       FCB   $00,$00,$00,$0C,$00
       FCB   $00,$03,$03,$0C,$0C
       FCB   $30,$30,$00,$00,$3F
       FCB   $33,$33,$33,$33,$3F
       FCB   $00,$00,$3C,$0C,$0C
       FCB   $0C,$0C,$3F,$00,$00
       FCB   $3F,$03,$3F,$30,$30
       FCB   $3F,$00,$00,$3F,$03
       FCB   $0F,$03,$03,$3F,$00
       FCB   $00,$30,$30,$30,$33
       FCB   $3F,$03,$00,$00,$3F
       FCB   $30,$3F,$03,$03,$3C
       FCB   $00,$00,$3F,$33,$30
       FCB   $3F,$33,$3F,$00,$00
       FCB   $3F,$33,$03,$03,$03
       FCB   $03,$00,$00,$3F,$33
       FCB   $3F,$33,$33,$3F,$00
       FCB   $00,$3F,$33,$3F,$03
       FCB   $33,$3F,$00,$00,$00
       FCB   $0C,$00,$0C,$00,$00
       FCB   $00,$00,$00,$0C,$00
       FCB   $0C,$30,$00,$00,$00
       FCB   $00,$03,$0C,$30,$0C
       FCB   $03,$00,$00,$00,$00
       FCB   $0F,$00,$0F,$00,$00
       FCB   $00,$00,$30,$0C,$03
       FCB   $0C,$30,$00,$00,$3F
       FCB   $03,$3F,$30,$00,$30
       FCB   $00,$7E,$BF,$BF,$BF
       FCB   $BF,$FF,$BF,$7E,$00
       FCB   $3F,$33,$33,$3F,$33
       FCB   $33,$00,$00,$3C,$33
       FCB   $3C,$33,$33,$3C,$00
       FCB   $00,$3F,$30,$30,$30
       FCB   $30,$3F,$00,$00,$3C
       FCB   $33,$33,$33,$33,$3C
       FCB   $00,$00,$3F,$30,$3C
       FCB   $30,$30,$3F,$00,$00
       FCB   $3F,$30,$3C,$30,$30
       FCB   $30,$00,$00,$3F,$30
       FCB   $30,$33,$33,$3F,$00
       FCB   $00,$33,$33,$3F,$33
       FCB   $33,$33,$00,$00,$3F
       FCB   $0C,$0C,$0C,$0C,$3F
       FCB   $00,$00,$3F,$0C,$0C
       FCB   $0C,$0C,$3C,$00,$00
       FCB   $30,$33,$3C,$33,$33
       FCB   $33,$00,$00,$30,$30
       FCB   $30,$30,$30,$3F,$00
       FCB   $00,$33,$3F,$3F,$33
       FCB   $33,$33,$00,$00,$3C
       FCB   $33,$33,$33,$33,$33
       FCB   $00,$00,$3F,$33,$33
       FCB   $33,$33,$3F,$00,$00
       FCB   $3C,$33,$33,$3C,$30
       FCB   $30,$00,$00,$0C,$33
       FCB   $33,$33,$33,$0F,$00
       FCB   $00,$3C,$33,$3C,$33
       FCB   $33,$33,$00,$00,$3F
       FCB   $30,$3F,$03,$03,$3F
       FCB   $00,$00,$3F,$0C,$0C
       FCB   $0C,$0C,$0C,$00,$00
       FCB   $33,$33,$33,$33,$33
       FCB   $3F,$00,$00,$33,$33
       FCB   $33,$33,$33,$0C,$00
       FCB   $00,$33,$33,$33,$3F
       FCB   $3F,$33,$00,$00,$33
       FCB   $33,$33,$0C,$33,$33
       FCB   $00,$00,$33,$33,$33
       FCB   $0C,$0C,$0C,$00,$00
       FCB   $3F,$03,$0C,$30,$30
       FCB   $3F,$00,$00,$00,$00
       FCB   $00,$00,$00,$0C,$00
       FCB   $00,$00,$00,$00,$00
       FCB   $00,$00,$00,$5E,$5E
       FCB   $FF,$5A,$7E,$5A,$42
       FCB   $3C,$0C,$33,$00,$00
       FCB   $00,$00,$00,$00,$00
       FCB   $00,$00,$00,$00,$00
       FCB   $00,$FF,$00,$30,$0C
       FCB   $03,$00,$00,$00,$00
CURSET FDB   $0000
STROUT LDA   ,X+
       BEQ   BACK
       BSR   CHROUT
       BRA   STROUT
BACK   RTS
CHROUT PSHS  X
       CMPA  #13
       BNE   LABEL1
       LDD   CURSET
       BRA   NL
LABEL1 LDB   #8
       MUL
       LDX   #TEGN-256
       LEAX  D,X
       LDD   CURSET
       BSR   PRINT
       INCA
       CMPA  #32
       BLO   STCUR
NL     CLRA
       INCB
       CMPB  #24
       BLO   STCUR
       DECB
STCUR  STD   CURSET
       PULS  X,PC
PRINT  PSHS  D,X,Y
       LDY   #3072
       LEAY  A,Y
       LDA   #32
       MUL
       LEAY  D,Y
       LDB   #8
LOOP1  LDA   ,X+
       STA   ,Y
       LEAY  32,Y
       DECB
       BNE   LOOP1
       PULS  D,X,Y,PC
@START CLR   $FF48
       LDA   #255
       STA   246
       LDX   #$9D3D
       STX   $10D
       LDX   #$B469
       STX   $110
       LDA   #1
       STA   $68
       JMP   GAME
GDATA1 FDB   $0004,$400E,$E00C
       FDB   $7010,$0BD0,$07E0
       FDB   $0DB0,$0FF0,$0FF0
       FDB   $0C30,$07E0,$0BD0
       FDB   $100E,$3007,$3802
       FDB   $1000
       FDB   $381C,$4422,$4422
       FDB   $4422,$4422,$4422
       FDB   $743A,$75BA,$75BA
       FDB   $7FFE,$FFFF,$FFFF
       FDB   $7FFE,$300C,$0FF0
       FDB   $0000
       FDB   $0000,$0000,$0000
       FDB   $0000,$0000,$0540
       FDB   $0380,$07C0,$0380
       FDB   $0540,$0000,$0000
       FDB   $0000,$0000,$0000
       FDB   $0000
       FDB   $0000,$0000,$0000
       FDB   $0000,$0920,$0540
       FDB   $0380,$0EE0,$0380
       FDB   $0540,$0920,$0000
       FDB   $0000,$0000,$0000
       FDB   $0000
       FDB   $0000,$0000,$2108
       FDB   $1110,$0920,$0000
       FDB   $0000,$3838,$0000
       FDB   $0000,$0920,$1110
       FDB   $2108,$0000,$0000
       FDB   $0000
       FDB   $8102,$4104,$2108
       FDB   $0000,$0000,$0000
       FDB   $0000,$E00E,$0000
       FDB   $0000,$0000,$0000
       FDB   $2108,$4104,$8102
       FDB   $0000
       RMB   32
       FDB   $C003,$F00F,$7C3E
       FDB   $7FFE,$3FFC,$3FFC
       FDB   $1FF8,$1FF8,$1FF8
       FDB   $1FF8,$3FFC,$3FFC
       FDB   $7FFE,$7C3E,$F00F
       FDB   $C003
       FDB   $0000,$0000,$0000
       FDB   $0000,$0000,$0000
       FDB   $0000,$0000,$0000
       FDB   $0000,$0000,$0000
       FDB   $0000,$0000,$0000
       FDB   $0000
       FDB   $AAAA,$5555,$AAAA
       FDB   $5555,$AAAA,$5555
       FDB   $AAAA,$5555,$AAAA
       FDB   $5555,$AAAA,$5555
       FDB   $AAAA,$5555,$AAAA
       FDB   $5555
       FDB   $FFFF,$FFFF,$FFFF
       FDB   $FFFF,$FFFF,$F81F
       FDB   $F81F,$F99F,$F99F
       FDB   $F81F,$F81F,$FFFF
       FDB   $FFFF,$FFFF,$FFFF
       FDB   $FFFF
       FDB   $0000,$0000,$0000
       FDB   $1FF8,$2FFC,$5FFE
       FDB   $BFFF,$BFFF,$5FFE
       FDB   $2FFC,$17F8,$0BF0
       FDB   $05E0,$02C0,$0180
       FDB   $0000
       FDB   $0FC0,$3B30,$CEFC
       FDB   $B23F,$A8BF,$8A8B
       FDB   $A0AF,$AA8B,$9ABC
       FDB   $A688,$9AAA,$A6AA
       FDB   $A9A8,$2AA8,$0920
       FDB   $0280
       FDB   $FEFE,$FEFE,$FEFE
       FDB   $0000,$EFEF,$EFEF
       FDB   $EFEF,$0000,$7F7F
       FDB   $7F7F,$7F7F,$0000
       FDB   $F7F7,$F7F7,$F7F7
       FDB   $0000
       FDB   $FFFF,$FFFF,$C003
       FDB   $D81B,$D81B,$C003
       FDB   $C003,$C003,$C003
       FDB   $C003,$C003,$D81B
       FDB   $D81B,$C003,$FFFF
       FDB   $FFFF
       FDB   $FFFF,$FFFF,$C003
       FDB   $D81B,$D81B,$C003
       FDB   $C003,$C003,$C003
       FDB   $C003,$C003,$D81B
       FDB   $D81B,$C003,$FFFF
       FDB   $FFFF
GDATA2 FDB   $2000,$7010,$3038
       FDB   $1018,$0B08,$07D0
       FDB   $0DE0,$0FB0,$0FF0
       FDB   $0CF0,$0730,$0BE0
       FDB   $10B0,$600E,$E007
       FDB   $4002
       FDB   $381C,$4422,$4422
       FDB   $4422,$743A,$743A
       FDB   $743A,$45A2,$45A2
       FDB   $7FFE,$FFFF,$FFFF
       FDB   $7FFE,$300C,$0FF0
       FDB   $0000
       FDB   $0000,$0000,$0000
       FDB   $0000,$0000,$0540
       FDB   $0380,$07C0,$0380
       FDB   $0540,$0000,$0000
       FDB   $0000,$0000,$0000
       FDB   $0000
       FDB   $0000,$0000,$0000
       FDB   $0000,$0920,$0540
       FDB   $0380,$0EE0,$0380
       FDB   $0540,$0920,$0000
       FDB   $0000,$0000,$0000
       FDB   $0000
       FDB   $0000,$0000,$2108
       FDB   $1110,$0920,$0000
       FDB   $0000,$3838,$0000
       FDB   $0000,$0920,$1110
       FDB   $2108,$0000,$0000
       FDB   $0000
       FDB   $8102,$4104,$2108
       FDB   $0000,$0000,$0000
       FDB   $0000,$E00E,$0000
       FDB   $0000,$0000,$0000
       FDB   $2108,$4104,$8102
       FDB   $0000
       RMB   32
       FDB   $C007,$FC3F,$FFFF
       FDB   $7FFE,$7FFE,$7FFE
       FDB   $3FFC,$3FFC,$3FFC
       FDB   $3FFC,$7FFE,$7FFE
       FDB   $7FFE,$FFFF,$FC3F
       FDB   $C007
       FDB   $0000,$0000,$0000
       FDB   $0000,$0000,$0000
       FDB   $0000,$0000,$0000
       FDB   $0000,$0000,$0000
       FDB   $0000,$0000,$0000
       FDB   $0000
       FDB   $AAAA,$5555,$AAAA
       FDB   $5555,$AAAA,$5555
       FDB   $AAAA,$5555,$AAAA
       FDB   $5555,$AAAA,$5555
       FDB   $AAAA,$5555,$AAAA
       FDB   $5555
       FDB   $FFFF,$FFFF,$FFFF
       FDB   $E007,$E007,$E7E7
       FDB   $E7E7,$E7E7,$E7E7
       FDB   $E7E7,$E7E7,$E007
       FDB   $E007,$FFFF,$FFFF
       FDB   $FFFF
       FDB   $0000,$0000,$0000
       FDB   $1FF8,$2FFC,$5FFE
       FDB   $BFFF,$BFFF,$5FFE
       FDB   $2FFC,$17F8,$0BF0
       FDB   $05E0,$02C0,$0180
       FDB   $0000
       FDB   $0FC0,$3B30,$CEFC
       FDB   $B23F,$A8BF,$8A8B
       FDB   $A0AF,$AA8B,$9ABC
       FDB   $A688,$9AAA,$A6AA
       FDB   $A9A8,$2AA8,$0920
       FDB   $0280
       FDB   $FEFE,$FEFE,$FEFE
       FDB   $0000,$EFEF,$EFEF
       FDB   $EFEF,$0000,$7F7F
       FDB   $7F7F,$7F7F,$0000
       FDB   $F7F7,$F7F7,$F7F7
       FDB   $0000
       FDB   $FFFF,$FFFF,$C003
       FDB   $D81B,$D81B,$C003
       FDB   $C003,$C003,$C003
       FDB   $C003,$C003,$D81B
       FDB   $D81B,$C003,$FFFF
       FDB   $FFFF
       FDB   $FFFF,$FFFF,$C003
       FDB   $D81B,$D81B,$C003
       FDB   $C003,$C003,$C003
       FDB   $C003,$C003,$D81B
       FDB   $D81B,$C003,$FFFF
       FDB   $FFFF
GDATA3 FDB   $1000,$3002,$1807
       FDB   $0806,$0BD8,$07E0
       FDB   $0DB0,$0FF0,$0FF0
       FDB   $0C30,$07E0,$0BD0
       FDB   $1010,$6018,$E01C
       FDB   $4008
       FDB   $381C,$4422,$4422
       FDB   $4422,$5C2E,$5C2E
       FDB   $5C2E,$45A2,$45A2
       FDB   $7FFE,$FFFF,$FFFF
       FDB   $7FFE,$300C,$0C30
       FDB   $03C0
       FDB   $0000,$0000,$0000
       FDB   $0000,$0000,$0540
       FDB   $0380,$07C0,$0380
       FDB   $0540,$0000,$0000
       FDB   $0000,$0000,$0000
       FDB   $0000
       FDB   $0000,$0000,$0000
       FDB   $0000,$0920,$0540
       FDB   $0380,$0EE0,$0380
       FDB   $0540,$0920,$0000
       FDB   $0000,$0000,$0000
       FDB   $0000
       FDB   $0000,$0000,$2108
       FDB   $1110,$0920,$0000
       FDB   $0000,$3838,$0000
       FDB   $0000,$0920,$1110
       FDB   $2108,$0000,$0000
       FDB   $0000
       FDB   $8102,$4104,$2108
       FDB   $0000,$0000,$0000
       FDB   $0000,$E00E,$0000
       FDB   $0000,$0000,$0000
       FDB   $2108,$4104,$8102
       FDB   $0000
       RMB   32
       FDB   $C003,$F00F,$7C3E
       FDB   $7FFE,$3FFC,$3FFC
       FDB   $1FF8,$1FF8,$1FF8
       FDB   $1FF8,$3FFC,$3FFC
       FDB   $7FFE,$7C3E,$F00F
       FDB   $C003
       FDB   $0000,$0000,$0000
       FDB   $0000,$0000,$0000
       FDB   $0000,$0000,$0000
       FDB   $0000,$0000,$0000
       FDB   $0000,$0000,$0000
       FDB   $0000
       FDB   $AAAA,$5555,$AAAA
       FDB   $5555,$AAAA,$5555
       FDB   $AAAA,$5555,$AAAA
       FDB   $5555,$AAAA,$5555
       FDB   $AAAA,$5555,$AAAA
       FDB   $5555
       FDB   $FFFF,$8001,$8001
       FDB   $9FF9,$9FF9,$9FF9
       FDB   $9FF9,$9FF9,$9FF9
       FDB   $9FF9,$9FF9,$9FF9
       FDB   $9FF9,$8001,$8001
       FDB   $FFFF
       FDB   $0000,$0000,$0000
       FDB   $1FF8,$2FFC,$5FFE
       FDB   $BFFF,$BFFF,$5FFE
       FDB   $2FFC,$17F8,$0BF0
       FDB   $05E0,$02C0,$0180
       FDB   $0000
       FDB   $0FC0,$3B30,$CEFC
       FDB   $B23F,$A8BF,$8A8B
       FDB   $A0AF,$AA8B,$9ABC
       FDB   $A688,$9AAA,$A6AA
       FDB   $A9A8,$2AA8,$0920
       FDB   $0280
       FDB   $FEFE,$FEFE,$FEFE
       FDB   $0000,$EFEF,$EFEF
       FDB   $EFEF,$0000,$7F7F
       FDB   $7F7F,$7F7F,$0000
       FDB   $F7F7,$F7F7,$F7F7
       FDB   $0000
       FDB   $FFFF,$FFFF,$C003
       FDB   $D81B,$D81B,$C003
       FDB   $C003,$C003,$C003
       FDB   $C003,$C003,$D81B
       FDB   $D81B,$C003,$FFFF
       FDB   $FFFF
       FDB   $FFFF,$FFFF,$C003
       FDB   $D81B,$D81B,$C003
       FDB   $C003,$C003,$C003
       FDB   $C003,$C003,$D81B
       FDB   $D81B,$C003,$FFFF
       FDB   $FFFF
GDATA4 FDB   $0004,$200E,$700C
       FDB   $3008,$08D0,$0DE0
       FDB   $07D0,$0DF0,$0FF0
       FDB   $0F30,$0CE0,$07D0
       FDB   $4B08,$F006,$6007
       FDB   $0002
       FDB   $381C,$4422,$4422
       FDB   $4422,$4422,$4422
       FDB   $5C2E,$5DAE,$5DAE
       FDB   $7FFE,$FFFF,$FFFF
       FDB   $7FFE,$300C,$0C30
       FDB   $03C0
       FDB   $0000,$0000,$0000
       FDB   $0000,$0000,$0540
       FDB   $0380,$07C0,$0380
       FDB   $0540,$0000,$0000
       FDB   $0000,$0000,$0000
       FDB   $0000
       FDB   $0000,$0000,$0000
       FDB   $0000,$0920,$0540
       FDB   $0380,$0EE0,$0380
       FDB   $0540,$0920,$0000
       FDB   $0000,$0000,$0000
       FDB   $0000
       FDB   $0000,$0000,$2108
       FDB   $1110,$0920,$0000
       FDB   $0000,$3838,$0000
       FDB   $0000,$0920,$1110
       FDB   $2108,$0000,$0000
       FDB   $0000
       FDB   $8102,$4104,$2108
       FDB   $0000,$0000,$0000
       FDB   $0000,$E00E,$0000
       FDB   $0000,$0000,$0000
       FDB   $2108,$4104,$8102
       FDB   $0000
       RMB   32
       FDB   $E007,$FC3F,$FFFF
       FDB   $7FFE,$7FFE,$7FFE
       FDB   $3FFC,$3FFC,$3FFC
       FDB   $3FFC,$7FFE,$7FFE
       FDB   $7FFE,$FFFF,$FC3F
       FDB   $E007
       FDB   $0000,$0000,$0000
       FDB   $0000,$0000,$0000
       FDB   $0000,$0000,$0000
       FDB   $0000,$0000,$0000
       FDB   $0000,$0000,$0000
       FDB   $0000
       FDB   $AAAA,$5555,$AAAA
       FDB   $5555,$AAAA,$5555
       FDB   $AAAA,$5555,$AAAA
       FDB   $5555,$AAAA,$5555
       FDB   $AAAA,$5555,$AAAA
       FDB   $5555
       FDB   $FFFF,$FFFF,$FFFF
       FDB   $E007,$E007,$E7E7
       FDB   $E7E7,$E7E7,$E7E7
       FDB   $E7E7,$E7E7,$E007
       FDB   $E007,$FFFF,$FFFF
       FDB   $FFFF
       FDB   $0000,$0000,$0000
       FDB   $1FF8,$2FFC,$5FFE
       FDB   $BFFF,$BFFF,$5FFE
       FDB   $2FFC,$17F8,$0BF0
       FDB   $05E0,$02C0,$0180
       FDB   $0000
       FDB   $0FC0,$3B30,$CEFC
       FDB   $B23F,$A8BF,$8A8B
       FDB   $A0AF,$AA8B,$9ABC
       FDB   $A688,$9AAA,$A6AA
       FDB   $A9A8,$2AA8,$0920
       FDB   $0280
       FDB   $FEFE,$FEFE,$FEFE
       FDB   $0000,$EFEF,$EFEF
       FDB   $EFEF,$0000,$7F7F
       FDB   $7F7F,$7F7F,$0000
       FDB   $F7F7,$F7F7,$F7F7
       FDB   $0000
       FDB   $FFFF,$FFFF,$C003
       FDB   $D81B,$D81B,$C003
       FDB   $C003,$C003,$C003
       FDB   $C003,$C003,$D81B
       FDB   $D81B,$C003,$FFFF
       FDB   $FFFF
       FDB   $FFFF,$FFFF,$C003
       FDB   $D81B,$D81B,$C003
       FDB   $C003,$C003,$C003
       FDB   $C003,$C003,$D81B
       FDB   $D81B,$C003,$FFFF
       FDB   $FFFF
MANR1  FDB   $0A80,$2AA8,$15C0
       FDB   $2DB0,$2DD8,$51A0
       FDB   $0FE0,$1A80,$1AC0
       FDB   $1AA0,$1FA0,$0FA0
       FDB   $0AC0,$0A80,$0FC0
       FDB   $0FE0
MANR2  FDB   $0A80,$2AA8,$15C0
       FDB   $2DB0,$2DD8,$51A0
       FDB   $0FE6,$0AFE,$0AFC
       FDB   $0AA0,$0AA9,$6AAB
       FDB   $6A2B,$4000,$0000
       FDB   $0000
MANL1  FDB   $0150,$1554,$03A8
       FDB   $0DB4,$1BB4,$058A
       FDB   $07F0,$0168,$0368
       FDB   $0568,$05F8,$05F0
       FDB   $0360,$0160,$03F0
       FDB   $07F0
MANL2  FDB   $0150,$1554,$03A8
       FDB   $0DB4,$1BB4,$058A
       FDB   $67F0,$7F50,$3F50
       FDB   $0550,$9550,$D556
       FDB   $D456,$0002,$0000
       FDB   $0000
HIRES  STA   $FFC6
       STA   $FFC9
       STA   $FFCB
       STA   $FFC0
       STA   $FFC3
       STA   $FFC5
SCR1   LDA   $FF22
       ANDA  #$07
       ORA   #$F8
       STA   $FF22
       CLR   SCREEN
       RTS
SCREEN RMB   1
FLASH  TST   SCREEN
       BNE   SCR1
       INC   SCREEN
       LDA   $FF22
       ANDA  #$07
       ORA   #$F0
       STA   $FF22
       RTS
PCLS   LDX   #3072
       CLRA
       CLRB
LOOP2  STD   ,X++
       CMPX  #9216
       BNE   LOOP2
       RTS
TDATA  FDB   $3FFF,$C00F,$F801
       FDB   $FF80,$0003,$FE1F
       FDB   $FFFC
       FDB   $3FE3,$F00F,$F807
       FDB   $E1C0,$0003,$FE1F
       FDB   $FFFC
       FDB   $3FE1,$F80F,$F80F
       FDB   $C060,$0003,$FE00
       FDB   $FF80
       FDB   $3FE1,$FC0F,$F81F
       FDB   $C060,$0003,$FE00
       FDB   $FF80
       FDB   $3FE1,$FE0F,$F83F
       FDB   $C000,$0003,$FE00
       FDB   $FF80
       FDB   $3DE1,$EE0F,$783B
       FDB   $C000,$0003,$DE00
       FDB   $F780
       FDB   $38E1,$C70E,$3871
       FDB   $C000,$0003,$8E00
       FDB   $E380
       FDB   $3DE1,$EF0F,$787B
       FDB   $C000,$0003,$DE00
       FDB   $F780
       FDB   $3761,$BB0D,$D86E
       FDB   $C000,$7FC3,$7600
       FDB   $DD80
       FDB   $2221,$1108,$8844
       FDB   $4FF8,$7FC2,$2200
       FDB   $8880
       FDB   $3761,$BB0D,$D86E
       FDB   $CFF8,$7FC3,$7600
       FDB   $DD80
       FDB   $3DE1,$EF0F,$787B
       FDB   $C3B8,$0003,$DE00
       FDB   $F780
       FDB   $38E1,$C70E,$3871
       FDB   $C318,$0003,$8E00
       FDB   $E380
       FDB   $3DE1,$EE0F,$783B
       FDB   $C3B8,$0003,$DE00
       FDB   $F780
       FDB   $3FE1,$FE0F,$F83F
       FDB   $C3F8,$0003,$FE00
       FDB   $FF80
       FDB   $3FE1,$FC0F,$F81F
       FDB   $C3F0,$0003,$FE00
       FDB   $FF80
       FDB   $3FE1,$F80F,$F80F
       FDB   $C3F0,$0003,$FE00
       FDB   $FF80
       FDB   $3FE3,$F00F,$F807
       FDB   $E7E0,$0003,$FE00
       FDB   $FF80
       FDB   $3FFF,$C00F,$F801
       FDB   $FF80,$0003,$FE00
       FDB   $FF80
DRWTTL LDY   #TDATA
LOOP4  LDA   #7
LOOP3  LDU   ,Y++
       STU   32,X
       STU   ,X++
       DECA
       BNE   LOOP3
       LEAX  50,X
       CMPY  #TDATA+266
       BLO   LOOP4
       RTS
BYTES  RMB   20
BONUS  RMB   1
POINTS RMB   3
DLEFT  RMB   1
BASE   RMB   2
YCOO   RMB   1
XCOO   RMB   1
DIR    RMB   2
XXXXX  RMB   1
SCORE  RMB   6
LIVES  RMB   1
MOVSTG LDB   #9
       LDY   #BONUS
LOOP5  LDA   ,X+
       STA   ,Y+
       DECB
       BNE   LOOP5
       LDY   #STAGE
LOOP6  LDA   ,X+
       PSHS  A
       LSRA
       LSRA
       LSRA
       LSRA
       STA   ,Y+
       PULS  A
       ANDA  #$0F
       STA   ,Y+
       CMPY  #STAGE+1000
       BNE   LOOP6
       RTS
FRDMOV PSHS  D
       LDA   SNDTYP
       CMPA  #1
       BHI   BACK11
       LDA   #2
       STA   SNDTYP
       LDD   #SND2A
       STD   SWI1
BACK11 PULS  D,PC
GEMFAL PSHS  D
       LDA   #3
       CMPA  SNDTYP
       BEQ   BACK12
       STA   SNDTYP
       LDD   #SND3A
       STD   SWI1
       LDA   #254
       STA   AMPL
BACK12 PULS  D,PC
EXPLOD PSHS  D
       LDA   #4
       STA   SNDTYP
       LDD   #SND4A
       STD   SWI1
       CLR   VOLUM
       LDD   #$B798
       STD   ROM
       PULS  D,PC
GEMTAK PSHS  D
       LDA   #5
       STA   SNDTYP
       LDA   #63
       STA   VOLUM
       LDD   #SND5A
       STD   SWI1
BACK13 PULS  D,PC
MAXSTG FCB   25
MUSIC3 FDB   $0810,$1010,$1308
       FDB   $1308,$1308,$1308
       FDB   $1308,$1308,$1308
       FDB   $1308,$1310,$1010
       FDB   $0810,$1010,$0A20
       FDB   $0310,$0A10,$0820
       FDB   $0810,$1010,$1308
       FDB   $1308,$1308,$1308
       FDB   $1308,$1308,$1308
       FDB   $1308,$1310,$1010
       FDB   $0A20,$0310,$0A10
       FDB   $0840,0
LIGHT  FDB   $01F0,$03E0,$07C0
       FDB   $0F80,$1F00,$3E00
       FDB   $1FF0,$0FF8,$01F0
       FDB   $03E0,$27C0,$3F80
       FDB   $3F00,$3E00,$3E00
       FDB   $3F00
TXTE   FCC   /CHEAT MODE/,0
       FCC   /##########/,0
       FCC   /1 NUMBER OF LIVES/
       FCC   0,/2 STARTING CAVE/
       FCC   0,/3 BONUS SPEED/,0
       FCC   /Q QUIT CHEAT MODE/
       FCC   0
SLMSD1 FDB   $0010,$0210,$0410,0
SLMSD2 FDB   $0610,$0410,$0210,0
EFLAG  RMB   1
SNDTYP RMB   1
SNDON  PSHS  D,U
       CLRB
       JSR   $BD41
       LDB   $FF23
       ORB   #$08
       STB   $FF23
       PULS  D,U,PC
SNDOFF PSHS  A
       LDA   $FF23
       ANDA  #$F7
       STA   $FF23
       PULS  A,PC
MSOUND PSHS  A
       ASLA
       ASLA
       PSHS  A
       LDA   $FF20
       ANDA  #$03
       ORA   ,S
       STA   $FF20
       LEAS  1,S
       PULS  A,PC
PITCH  PSHS  B
PITCHD DECB
       BNE   PITCHD
       PULS  B,PC
VOLUM  RMB   1
MAGSLM LDA   ,X
       ANDA  #$F0
       BNE   DROP
       LDA   -40,X
       ANDA  #$0F
       CMPA  #$0B
       BLO   BACK14
       CMPA  #$0C
       BHI   BACK14
       LDA   -40,X
       ANDA  #$70
       BEQ   BACK14
       LDA   #$1D
       STA   ,X
BACK14 RTS
DROP   LDA   #$0D
       STA   ,X
       LDA   40,X
       CMPA  #$08
       BNE   BACK14
       LDA   -40,X
       ANDA  #$0F
       CMPA  #$0B
       BEQ   STONE
       LDA   #$FB
       STA   40,X
       LDA   #$08
       STA   -40,X
       JMP   GEMFAL
STONE  LDA   #$FC
       STA   40,X
       LDA   #$08
       STA   -40,X
       JMP   EXPLOD

TXT1   FCC   /SCORE :/,0
       FCC   /BONUS :/,0
       FCC   /POINTS:/,0
       FCC   /LEFT  :/,0
PRTTOP LDX   #TXT1
       LDD   #$0000
       JSR   TXTOUT
       LDD   #$0008
       JSR   TXTOUT
       LDD   #$1600
       JSR   TXTOUT
       LDD   #$1608
       JSR   TXTOUT
       LDX   #MANR1
       LDY   #3086
       JSR   DRWGRP
       LDX   #MANL1
       LDY   #3091
       JMP   DRWGRP
CHRSET RMB   2
DRWGRP PSHS  A,X,Y,U
       LDA   #16
LOOP7  LDU   ,X++
       STU   ,Y
       LEAY  32,Y
       DECA
       BNE   LOOP7
       PULS  A,X,Y,U,PC
DIRBUF FCB   0
PRTNUM PSHS  D,X,Y
       LDY   #TEGN+128
       LDB   #8
       MUL
       LEAY  D,Y
       LDA   #8
LOOPB  LDB   ,Y+
       STB   ,X
       LEAX  32,X
       DECA
       BNE   LOOPB
       PULS  D,X,Y,PC
NUMBER LDA   ,Y+
       BSR   PRTNUM
       LEAX  1,X
       DECB
       BNE   NUMBER
       RTS
PSCORE LDX   #3079
       LDY   #SCORE
       LDB   #6
       BRA   NUMBER
ZEROSC LDD   #$0000
       STD   SCORE
       STD   SCORE+2
       STD   SCORE+4
       RTS
PPOINT LDX   #3101
       LDY   #POINTS
       LDB   #3
       BRA   NUMBER
PLIVES LDA   LIVES
       BSR   KONVRT
       LDB   #3
       LDX   #3216
LAB2   LDY   #BYTES
       BRA   NUMBER
PBONUS LDA   BONUS
       BSR   KONVRT
       LDB   #3
       LDX   #3335
       BRA   LAB2
PDLEFT LDA   DLEFT
       BSR   KONVRT
       LDB   #3
       LDX   #3357
       BRA   LAB2
QUOT   RMB   1
DIVID  RMB   1
DIVIS  RMB   1
DIV    PSHS  Y
       STD   DIVID
       CLRA
       CLR   QUOT
       LDB   DIVID
       LDY   #$0008
NSHIFT CMPY  #$0000
       BEQ   DIVEND
       LSLB
       ROLA
       LSL   QUOT
       LEAY  -1,Y
       CMPA  DIVIS
       BLO   NSHIFT
       SUBA  DIVIS
       INC   QUOT
       BRA   NSHIFT
DIVEND TFR   A,B
       LDA   QUOT
       PULS  Y,PC
KONVRT LDB   #100
       BSR   DIV
       STA   BYTES
       TFR   B,A
       LDB   #10
       BSR   DIV
       STA   BYTES+1
       STB   BYTES+2
       RTS
DEXPLD LDA   #$8B
       BRA   EXPLD
NEXPLD LDA   #$82
EXPLD  STA   BYTES+19
       LEAU  -41,U
       LDA   #3
LOOPC  LDB   #3
LOOPD  PSHS  B
       LDB   ,U+
       ANDB  #$0F
       CMPB  #$0D
       BHI   LAB3
       CMPB  #$0A
       BEQ   LAB3
       LDB   BYTES+19
       STB   -1,U
LAB3   PULS  B
       DECB
       BNE   LOOPD
       LEAU  37,U
       DECA
       BNE   LOOPC
       JMP   EXPLOD
TRIANG FCB   $00,$10,$20,$30,$40
       FCB   $50,$60,$70,$80,$90
       FCB   $A0,$B0,$C0,$D0,$E0
       FCB   $F0,$FF,$F0,$E0,$D0
       FCB   $C0,$B0,$A0,$90,$80
       FCB   $70,$60,$50,$40,$30
       FCB   $20,$10
DECAY  RMB   1
DURATN RMB   1
SPEED  RMB   2
POINT  RMB   3
FREQ   RMB   3
AMPL   RMB   1
NOTAB  FDB   8294,8787,9310,9863
       FDB   10450,11071,11730
       FDB   12427,13166,13949
       FDB   14778,15657
MUSIC1 FDB   $0A10,$1010
       FDB   $0A10,$0910,$0710
       FDB   $0910,$0A10,$1010
       FDB   $0510,$0A10,$0920
       FDB   $0710,$0560,0
MUSIC2 FDB   $0520,$0820,$0A10
       FDB   $0810,$0520,$0520
       FDB   $0820,$0A10,$0810
       FDB   $0520,$1020,$0A10
       FDB   $0810,$1020,$0A10
       FDB   $0810,$0520,$0820
       FDB   $0A10,$0810,$0520
       FDB   0
MELOD3 JSR   SNDON
       LDU   #MUSIC3
       LDA   #$F0
       STA   DECAY
       LDX   #$0080
       STX   SPEED
       BRA   MEL
MELOD1 JSR   SNDON
       LDU   #MUSIC1
       LDA   #$F8
       STA   DECAY
       LDX   #130
       STX   SPEED
MEL    BSR   PLAY
       JMP   SNDOFF
MELOD2 JSR   SNDON
       LDU   #MUSIC2
       LDA   #$FE
       STA   DECAY
       LDX   #100
       STX   SPEED
       BRA   MEL
PLAY   LDD   ,U
       BEQ   PLAYEN
       STB   DURATN
       ANDA  #$0F
       LDX   #NOTAB
       ASLA
       LDD   A,X
       STD   FREQ+1
       CLR   FREQ
       LDA   ,U++
PLAY0  ASL   FREQ+2
       ROL   FREQ+1
       ROL   FREQ
       SUBA  #16
       BHS   PLAY0
       LDA   #$FF
       STA   AMPL
       LDX   #TRIANG
PLAY2  LDY   SPEED
       BSR   SOUND
       LDA   AMPL
       LDB   DECAY
       MUL
       STA   AMPL
       DEC   DURATN
       BNE   PLAY2
       BRA   PLAY
SOUND  LDD   POINT+1
       ADDD  FREQ+1
       STD   POINT+1
       LDA   POINT
       ADCA  FREQ
       STA   POINT
       ANDA  #31
       LDA   A,X
       LDB   AMPL
       MUL
       ANDA  #$FC
       STA   $FF20
       LEAY  -1,Y
       BNE   SOUND
PLAYEN RTS
SND2A  CLR   VOLUM
       LDX   #$B798
       LDA   $FF23
       ORA   #$08
       STA   $FF23
LOOP33 LDA   ,X+
       ANDA  VOLUM
       STA   $FF20
       DEC   VOLUM
       BNE   LOOP33
       BRA   DISABL
SND3A  LDD   #$B435
       STA   $FF01
       STB   $FF03
       LDA   $FF23
       ORA   #$08
       STA   $FF23
       LDD   #$2800
       STD   FREQ
       CLR   FREQ+2
       LDX   #TRIANG
       LDU   #2
LOOP35 LDY   #1
       BSR   SOUND
       DEC   AMPL
       DEC   AMPL
       BEQ   DISABL
       LEAU  -1,U
       BNE   LOOP35
       RTI
ROM    RMB   2
SND4A  LDA   $FF23
       ORA   #$08
       STA   $FF23
       LDX   #SND4B
       STX   SWI1
       LDX   ROM
       LDA   ,X+
       ANDA  VOLUM
       STA   $FF20
       STX   ROM
GO     BRA   OFF
SND4B  LDA   $FF23
       ORA   #$08
       STA   $FF23
       LDX   #SND4A
       STX   SWI1
       LDX   ROM
       LDA   ,X+
       ANDA  VOLUM
       STA   $FF20
       STX   ROM
       DEC   VOLUM
       BNE   GO
DISABL CLR   SNDTYP
       LDX   #NSOUND
       STX   SWI1
       BRA   OFF
OFF    LDA   $FF23
       ANDA  #$F7
       STA   $FF23
NSOUND RTI
SND5A  JSR   SNDON
       LDA   VOLUM
       JSR   MSOUND
       LDX   #SND5B
       STX   SWI1
       BRA   OFF
SND5B  LDX   #SND5A
       STX   SWI1
       JSR   SNDON
       CLRA
       JSR   MSOUND
       DEC   VOLUM
       BNE   GO
       BRA   DISABL
WALLM  LDA   -1,X
       ANDA  #$0F
       CMPA  #$08
       BEQ   OKMOV
       RTS
OKMOV  LDA   #$8D
       STA   -1,X
       JMP   EXPLOD
LNGTXT FCC   /                 /
       FCC   /               /
       FCC   /** PRESS BUTTON A/
       FCC   /T ANY TIME TO STA/
       FCC   /RT GAME ** 'DIG-I/
       FCC   /T' WAS WRITTEN MA/
       FCC   /INLY IN MARCH AND/
       FCC   / APRIL 1986 BY RO/
       FCC   /LF MICHELSEN ON A/
       FCC   / DRAGON 64 ** YOU/
       FCC   /R MISSION IN THIS/
       FCC   / GAME IS TO GUIDE/
       FCC   / OUR HERO, MARIO,/
       FCC   / TROUGH A VAST NU/
       FCC   /MBER OF CAVES. IN/
       FCC   / EACH CAVE HE MUS/
       FCC   /T PICK UP A NUMBE/
       FCC   /R OF GEMS TO DISC/
       FCC   /OVER THE EXIT BEF/
       FCC   /ORE THE TIME RUNS/
       FCC   / OUT. A LOT OF MO/
       FCC   /NSTERS AND OBSTAC/
       FCC   /LES ARE LOCATED A/
       FCC   /ROUND THE CAVES T/
       FCC   /O MAKE THINGS A B/
       FCC   /IT HARDER. IN ADD/
       FCC   /ITION TO THE NORM/
       FCC   /AL OBSTACLES, THE/
       FCC   /RE IS ALSO A WIZ/
       FCC   /ARD WHO ENJOYS PR/
       FCC   /ACTISING HIS WIZA/
       FCC   /RDRY ON THE DIFFE/
       FCC   /RENT OBJECTS IN T/
       FCC   /HE GAME! ** USE T/
       FCC   /HE RIGHT HAND JOY/
       FCC   /STICK TO CONTROL /
       FCC   /POOR MARION AROUN/
       FCC   /D THE CAVES. YOU /
       FCC   /CAN PAUSE THE GAM/
       FCC   /E AT ANY TIME BY /
       FCC   /PRESSING THE SPAC/
       FCC   /E BAR. BREAK WILL/
       FCC   /MAKE YOU LOOSE ON/
       FCC   /E LIFE. (THIS IS /
       FCC   /USEFUL WHEN YOU A/
       FCC   /RE TRAPPED BEHIND/
       FCC   / BOULDERS!) TO QU/
       FCC   /IT THE GAME, PRES/
       FCC   /S 'Q'. IF YOU ARE/
       FCC   / BORED OF THE FIR/
       FCC   /ST CAVE AND ARE U/
       FCC   /NABLE TO GET ANY /
       FCC   /FURTHER, PRESS 'R/
       FCC   /' DURING THE TITL/
       FCC   /E SCREEN TO ACTIV/
       FCC   /ATE THE 'RANDOMIZ/
       FCC   /E MODE'. ** AT LA/
       FCC   /ST - SOME HINTS: /
       FCC   /THE MONSTERS WILL/
       FCC   / DIE IF THEY ARE /
       FCC   /HIT BY A FALLING /
       FCC   /OBJECT OR IF THEY/
       FCC   / TOUCH THE SLIME./
       FCC   / SOME MONSTERS WI/
       FCC   /LL TURN INTO GEMS/
       FCC   / WHEN THEY DIE! Y/
       FCC   /OU CAN MAKE HOLES/
       FCC   / IN SOME OF THE W/
       FCC   /ALLS BY KILLING A/
       FCC   / MOSTER. IF THE S/
       FCC   /LIME GROWS TO BIG/
       FCC   /, IT WILL DIE AND/
       FCC   / TURN INTO STONE./
       FCC   / IF YOU ARE ABLE /
       FCC   /TO BLOCK IT, IT W/
       FCC   /ILL TURN INTO GEM/
       FCC  /S!! THE SLIME CAN /
       FCC   /NOT EAT BOULDERS,/
       FCC   / GEMS, WALLS OR M/
       FCC   /ARIO. AT EVERY 50/
       FCC   /0 POINT YOU WILL /
       FCC   /RECEIVE A BONUS M/
       FCC   /AN - USE HIM WELL/
       FCC   /! ** I HOPE YOU W/
       FCC   /ILL ENJOY PLAYING/
       FCC   / THIS GAME FOR A /
       FCC   /LONG, LONG TIME! /
       FCC   /** PLEASE DON'T A/
       FCC   /CCEPT AN ILLEGAL /
       FCC   /COPY OF 'DIG-IT'./
       FCC   / **/
TXTEND FCC   /                 /
       FCC   /               /

TSTMAN LDB   #$10
       LDA   -40,X
       CMPA  #$06
       BEQ   FOUNDF
       LDB   #$20
       LDA   1,X
       CMPA  #$06
       BEQ   FOUNDF
       LDB   #$30
       LDA   40,X
       CMPA  #$06
       BEQ   FOUNDF
       LDB   #$40
       LDA   -1,X
       CMPA  #$06
       BEQ   FOUNDF
       ANDCC #$FE
       RTS
FOUNDF ORCC  #$01
       RTS
TSTFLT ANDA  #$0F
       CMPA  #$06
       BLO   NOMOVS
       CMPA  #$08
       BHI   NOMOVS
       ORCC  #$01
       RTS
NOMOVS ANDCC #$FE
       RTS
TSTUP  LEAU  -40,X
       LDA   ,U
       CMPA  #$9B
       BEQ   LAB15
       CMPA  #$9C
       BNE   LAB16
LAB15  LEAS  2,S
       TFR   X,U
       JMP   ,Y
LAB16  LDB   #$10
       LDA   ,U
       BRA   TSTFLT
TSTRGT LDB   #$20
       LDA   1,X
       BRA   TSTFLT
TSTDWN LDB   #$30
       LDA   40,X
       BRA   TSTFLT
TSTLFT LDB   #$40
       LDA   -1,X
       BRA   TSTFLT
SKULLM LDY   #DEXPLD
LAB4   SWI
       JSR   TSTMAN
       BCS   MOVES
       SWI
       LDA   ,X
       ANDA  #$F0
       CMPA  #$40
       BEQ   SLEFT
       CMPA  #$30
       BEQ   SDOWN
       CMPA  #$20
       BEQ   SRIGHT
SUP    JSR   TSTRGT
       BCS   MOVES
       JSR   TSTUP
       BCS   MOVES
       JSR   TSTLFT
       BCS   MOVES
       JSR   TSTDWN
       BCS   MOVES
       BRA   STANDS
SLEFT  JSR   TSTUP
       BCS   MOVES
       JSR   TSTLFT
       BCS   MOVES
       JSR   TSTDWN
       BCS   MOVES
       JSR   TSTRGT
       BCS   MOVES
       BRA   STANDS
SDOWN  JSR   TSTLFT
       BCS   MOVES
       JSR   TSTDWN
       BCS   MOVES
       JSR   TSTRGT
       BCS   MOVES
       JSR   TSTUP
       BCS   MOVES
       BRA   STANDS
SRIGHT JSR   TSTDWN
       BCS   MOVES
       JSR   TSTRGT
       BCS   MOVES
       JSR   TSTUP
       BCS   MOVES
       JSR   TSTLFT
       BCS   MOVES
STANDS CLRB
MOVES  SWI
       ORB   #$80
       TFR   X,U
       CMPB  #$90
       BNE   S1
       LEAU  -40,U
S1     CMPB  #$A0
       BNE   S2
       LEAU  1,U
S2     CMPB  #$B0
       BNE   S3
       LEAU  40,U
S3     CMPB  #$C0
       BNE   S4
       LEAU  -1,U
S4     SWI
       LDA   ,U
       ANDA  #$0F
       CMPA  #$02
       BLO   LAB13
       CMPA  #$08
       LBLO  DEXPLD
       LDA   #$88
       STA   ,X
LAB13  STB   ,U
       RTS
ALIENM LDY   #NEXPLD
       SWI
       JSR   TSTMAN
       BCS   MOVEA
       SWI
       LDA   ,X
       ANDA  #$F0
       CMPA  #$40
       BEQ   ALEFT
       CMPA  #$30
       BEQ   ADOWN
       CMPA  #$20
       BEQ   ARIGHT
AUP    JSR   TSTLFT
       BCS   MOVEA
       JSR   TSTUP
       BCS   MOVEA
       JSR   TSTRGT
       BCS   MOVEA
       JSR   TSTDWN
       BCS   MOVEA
       BRA   STANDA
ALEFT  JSR   TSTDWN
       BCS   MOVEA
       JSR   TSTLFT
       BCS   MOVEA
       JSR   TSTUP
       BCS   MOVEA
       JSR   TSTRGT
       BCS   MOVEA
       BRA   STANDA
ADOWN  JSR   TSTRGT
       BCS   MOVEA
       JSR   TSTDWN
       BCS   MOVEA
       JSR   TSTLFT
       BCS   MOVEA
       JSR   TSTUP
       BCS   MOVEA
       BRA   STANDA
ARIGHT JSR   TSTUP
       BCS   MOVEA
       JSR   TSTRGT
       BCS   MOVEA
       JSR   TSTDWN
       BCS   MOVEA
       JSR   TSTLFT
       BCS   MOVEA
STANDA CLRB
MOVEA  SWI
       ORB   #$81
       TFR   X,U
       CMPB  #$91
       BNE   A1
       LEAU  -40,U
A1     CMPB  #$A1
       BNE   A2
       LEAU  1,U
A2     CMPB  #$B1
       BNE   A3
       LEAU  40,U
A3     CMPB  #$C1
       BNE   A4
       LEAU  -1,U
A4     SWI
       LDA   ,U
       ANDA  #$0F
       CMPA  #$02
       BLO   LAB14
       CMPA  #$08
       LBLO  NEXPLD
       LDA   #$88
       STA   ,X
LAB14  STB   ,U
       RTS
TXT5   FCC   /BY: ROLF MICHELSE/
       FCC   /N/,0
TXT6   FCC   /(C) COPYRIGHT - /
       FCC   /1986/,0
TXT7   FCC   /HIGH  SCORES/,0
TXT8   FCC   /############/,0
HIGHS  FCC   /MARIO   000500/,0
       FCC   /MARIO   000500/,0
       FCC   /MARIO   000500/,0
       FCC   /MARIO   000500/,0
       FCC   /MARIO   000500/,0
JUMPS  FDB   SKULLM
       FDB   ALIENM
       FDB   EXP1
       FDB   EXP2
       FDB   EXP3
       FDB   EXP4
       FDB   MANM
       FDB   SLIMEM
       FDB   NOT
       FDB   NOT
       FDB   NOT
       FDB   GEMM
       FDB   BOULDM
       FDB   NOT
       FDB   NOT
       FDB   NOT
NOT    RTS
EXP1   LDA   #$83
       STA   ,X
       RTS
EXP2   LDA   #$84
       STA   ,X
       RTS
EXP3   LDA   #$85
       STA   ,X
       RTS
EXP4   LDA   #$88
       STA   ,X
       RTS
SFLAG1 RMB   1
SFLAG2 RMB   1
RAND   RMB   2
RND    LDD   RAND
       ADDA  RAND+1
       ASLB
       ROLA
       ADDA  RAND+1
       ASLB
       ROLA
       ADDD  RAND
       ADDD  #13849
       STD   RAND
       RTS
TEST   ANDA  #$0F
       CMPA  #$08
       BEQ   FNDGAP
       CMPA  #$09
       BEQ   FNDGAP
       ANDCC #$FE
       RTS
FNDGAP ORCC  #$01
       RTS
AROUND BSR   STUP
       BCS   GAPFND
       BSR   STRGT
       BCS   GAPFND
       BSR   STDWN
       BCS   GAPFND
       BSR   STLFT
GAPFND RTS
STUP   LDA   -40,X
       BRA   TEST
STRGT  LDA   1,X
       BRA   TEST
STDWN  LDA   40,X
       BRA   TEST
STLFT  LDA   -1,X
       BRA   TEST
SLIMEM SWI
       INC   SFLAG1
       LDA   #$87
       STA   ,X
       BSR   AROUND
       BCC   GAPFND
       CLR   SFLAG2
       BSR   RND
       SWI
       ANDA  #63
       CMPA  #4
       BLO   MOVSLM
       RTS
MOVSLM LDA   RAND+1
       ANDA  #$30
       BEQ   SLMUP
       CMPA  #$10
       BEQ   SLMRGT
       CMPA  #$20
       BEQ   SLMDWN
SLMLFT BSR   STLFT
       BCC   BACK2
       LEAU  -1,X
       BRA   MSLIM
SLMUP  BSR   STUP
       BCC   BACK2
       LEAU  -40,X
       BRA   MSLIM
SLMRGT BSR   STRGT
       BCC   BACK2
       LEAU  1,X
       BRA   MSLIM
SLMDWN BSR   STDWN
       BCC   BACK2
       LEAU  40,X
MSLIM  SWI
       LDA   #$87
       STA   ,U
BACK2  RTS
PUFF   RMB   1
ALIVE  RMB   1
MANM   SWI
       CLR   ALIVE
       LDD   $015A
       CMPA  #2
       BLO   MANLFT
       CMPA  #61
       BHI   MANRGT
       CMPB  #2
       BLO   MANUP
       CMPB  #61
       BHI   MANDWN
       RTS
MANLFT LDU   #MANL1
       STU   DIR
       LDB   #$40
       LEAU  -1,X
       BRA   MANMOV
MANRGT LDU   #MANR1
       STU   DIR
       LDB   #$20
       LEAU  1,X
       BRA   MANMOV
MANUP  LDB   #$10
       LEAU  -40,X
       BRA   MANMOV
MANDWN LDB   #$30
       LEAU  40,X
MANMOV SWI
       LDA   ,U
       ANDA  #$0F
       LBEQ  DEXPLD
       CMPA  #$06
       LBLO  NEXPLD
       CMPA  #$0A
       LBEQ  EXIT
       CMPA  #$0B
       LBEQ  GFOUND
       CMPA  #$0C
       LBEQ  BFOUND
       SWI
       CMPA  #$08
       BEQ   MOVE
       CMPA  #$09
       BEQ   MOVE
       RTS
MOVE   LDA   $FF00
       ANDA  #$01
       BEQ   BLKSQR
       CMPB  #$10
       BEQ   SCRUP
       CMPB  #$20
       BEQ   SCRRGT
       CMPB  #$30
       BEQ   SCRDWN
SCRLFT DEC   XCOO
       BRA   LABD
SCRUP  DEC   YCOO
       BRA   LABD
SCRRGT INC   XCOO
       BRA   LABD
SCRDWN INC   YCOO
LABD   SWI
       LDA   BASE
       LDB   YCOO
       CMPB  #4
       BHI   Q0
       TSTA
       BEQ   Q1
       INC   YCOO
       DEC   BASE
       BRA   LABE
Q0     CMPB  #6
       BLO   Q1
       CMPA  #$0E
       BEQ   Q1
       DEC   YCOO
       INC   BASE
       BRA   LABE
Q1     LDA   BASE+1
       LDB   XCOO
       CMPB  #6
       BHI   Q2
       TSTA
       BEQ   LABF
       INC   XCOO
       DEC   BASE+1
       BRA   LABE
Q2     CMPB  #9
       BLO   LABF
       CMPA  #$18
       BEQ   LABF
       DEC   XCOO
       INC   BASE+1
LABE   SWI
LABF   LDD   #$8886
       STA   ,X
       STB   ,U
       JMP   FRDMOV
BLKSQR LDA   #$88
       STA   ,U
BACK3  RTS
BFOUND TFR   B,A
       ANDA  #$10
       BNE   BACK3
       CMPB  #$20
       BNE   LAB9
       LEAY  1,U
       BRA   LABA
LAB9   LEAY  -1,U
LABA   LDA   ,Y
       ANDA  #$0F
       CMPA  #$08
       BNE   BACK3
       DEC   PUFF
       BNE   BACK3
       LDA   #10
       STA   PUFF
       LDA   #$8C
       STA   ,Y
       JSR   EXPLOD
       JMP   MOVE
GFOUND LDA   ,U
       ANDA  #$70
       BEQ   LAB1C
       RTS
LAB1C  PSHS  B,X
       LDD   POINTS
       ADDD  SCORE+3
       STD   SCORE+3
       LDA   POINTS+2
       ADDA  SCORE+5
       STA   SCORE+5
       JSR   TSTSCR
       TST   DLEFT
       BEQ   LABC
       DEC   DLEFT
LABC   JSR   PSCORE
       JSR   PDLEFT
       JSR   GEMTAK
       PULS  B,X
       JMP   MOVE
BACK9  RTS
BOULDM SWI
       LDY   #EXPLOD
       LDA   ,X
       ANDA  #$70
       BEQ   LAB2F
       BSR   TSTDIR
       BCS   MOVEB
LAB2F  SWI
       BSR   FNDDIR
       BCC   BACK4
MOVEB  SWI
       LDA   ,U
       ANDA  #$0F
       LBEQ  DEXPLD
       CMPA  #$01
       LBEQ  NEXPLD
       CMPA  #$05
       BHI   LAB12
       LDA   #$88
       STA   ,X
       RTS
LAB12  CMPA  #$06
       LBEQ  NEXPLD
       LDD   #$889C
       STA   ,X
       STB   ,U
BACK4  RTS
TSTDIR LDA   40,X
       ANDA  #$0F
       CMPA  #$07
       BLO   OKDIR
       CMPA  #$08
       BEQ   OKDIR
       JSR   ,Y
NODIR  LDA   ,X
       ANDA  #$0F
       STA   ,X
       ANDCC #$FE
       RTS
OKDIR  LEAU  40,X
       ORCC  #$01
       RTS
FNDDIR LEAU  40,X
       LDA   ,U
       ANDA  #$0F
       CMPA  #$08
       BEQ   OKDIR2
       CMPA  #$08
       BLO   NODIR2
       CMPA  #$0A
       BEQ   NODIR2
       CMPA  #$0D
       BHI   NODIR2
       CMPA  #$09
       BEQ   NODIR2
       LEAU  -1,X
       LDA   ,U
       ANDA  #$0F
       CMPA  #$08
       BNE   LAB10
       LDA   39,X
       ANDA  #$0F
       CMPA  #$08
       BEQ   OKDIR2
LAB10  LEAU  1,X
       LDA   ,U
       ANDA  #$0F
       CMPA  #$08
       BNE   NODIR2
       LDA   41,X
       ANDA  #$0F
       CMPA  #$08
       BNE   NODIR2
OKDIR2 JSR   ,Y
       ORCC  #$01
       RTS
NODIR2 ANDCC #$FE
BACK5  RTS
GEMM   SWI
       LDY   #GEMFAL
       LDA   ,X
       ANDA  #$70
       BEQ   LAB30
       BSR   TSTDIR
       BCS   MOVEG
LAB30  SWI
       BSR   FNDDIR
       BCC   BACK5
MOVEG  SWI
       LDA   ,U
       ANDA  #$0F
       LBEQ  DEXPLD
       CMPA  #$01
       LBEQ  NEXPLD
       CMPA  #$05
       BHI   LAB11
       LDA   #$88
       STA   ,X
       RTS
LAB11  CMPA  #$06
       LBEQ  NEXPLD
       LDD   #$889B
       STA   ,X
       STB   ,U
       RTS
COUNT  RMB   1
TXT2   FCC   /-- TIME OUT --/,0
TSTSCR PSHS  D,X,Y
       LDX   #SCORE+6
LOOP10 LDA   ,-X
       CMPA  #10
       BLO   LABB
       CLR   ,X
       INC   -1,X
LABB   CMPX  #SCORE
       BNE   LOOP10
       LDD   #$0000
       CMPD  SCORE+4
       BNE   LAB1A
       TST   SCORE+3
       BEQ   EXLIVE
       LDA   #5
       CMPA  SCORE+3
       BNE   LAB1A
EXLIVE LDA   LIVES
       CMPA  #255
       BEQ   LAB1A
       INC   LIVES
       JSR   PLIVES
LAB1A  PULS  D,X,Y,PC
EXIT   LEAS  4,S
       JSR   HIRES
       JSR   SNDON
       LDB   #1
LOOP15 TST   BONUS
       BEQ   LAB1B
       INC   SCORE+5
       INC   SCORE+5
       DEC   BONUS
       PSHS  B
       JSR   TSTSCR
       JSR   PSCORE
       JSR   PBONUS
       PULS  B
       LDA   #63
       JSR   MSOUND
       JSR   PITCH
       CLRA
       JSR   MSOUND
       JSR   PITCH
       INCB
       BRA   LOOP15
LAB1B  JSR   SNDOFF
       LDA   CCAVE
       CMPA  MAXSTG
       BEQ   LAB22
       INC   CCAVE
       BRA   LAB23
LAB22  LDA   #1
       STA   CCAVE
LAB23  LDX   #$0000
LOOP27 LEAX  -1,X
       BNE   LOOP27
       JMP   NCAVE
WSOUND PSHS  B
LOOP1C STB   $FF20
       INCB
       BNE   LOOP1C
       PULS  B,PC
WULF   JSR   SNDON
       LDA   #2
LOOP1D CLRB
LOOP1E BSR   WSOUND
       INCB
       BNE   LOOP1E
       DECA
       BNE   LOOP1D
       SUBB  #2
LOOP1F BSR   WSOUND
       DECB
       BNE   LOOP1F
       JMP   SNDOFF

TILF   RMB   1
TXT19  FCC   /** RANDOMIZE! **/
       FCC   0
TXT1A  FCC   /                /
       FCC   0
TXTOUT STD   CURSET
       JMP   STROUT
GAME   NOP
       LDA   #$55
       STA   $71
       LDD   #GAME
       STD   $72
TITLES JSR   PCLS
       JSR   HIRES
       CLR   TILF
       LDX   #4361
       JSR   DRWTTL
       LDX   #TXT5
       LDD   #$0704
       BSR   TXTOUT
       LDD   #$0614
       BSR   TXTOUT
       LDD   #$0A60
       BSR   TXTOUT
       LDD   #$0A68
       BSR   TXTOUT
       LDY   #5
       LDD   #$0970
LOOP1A PSHS  D,Y
       BSR   TXTOUT
       PULS  D,Y
       ADDD  #8
       LEAY  -1,Y
       BNE   LOOP1A
       LDX   #LNGTXT
       STX   BYTES+1
WRONG  LDY   #CODE
TSTKEY LDD   #$00B4
       STD   CURSET
       LDB   #32
       STB   BYTES
       LDX   BYTES+1
LOOP42 LDA   ,X+
       JSR   CHROUT
       DEC   BYTES
       BNE   LOOP42
       LEAX  -31,X
       CMPX  #TXTEND
       BLO   LAB2B
       LDX   #LNGTXT
LAB2B  STX   BYTES+1
       LDX   #$0350
LOOP43 LDA   $FF00
       ANDA  #$01
       BEQ   SGAME
       PSHS  Y
       JSR   $BBE5
       PULS  Y
       TSTA
       BNE   LAB2C
       LEAX  -1,X
       BNE   LOOP43
       BRA   TSTKEY
LAB2C  CMPA  #'R
       BNE   TSTPSW
       TST   TILF
       BNE   RESET
       INC   TILF
       LDX   #TXT19
LAB35  LDD   #$08A4
       JSR   TXTOUT
       BRA   WRONG
RESET  CLR   TILF
       LDX   #TXT1A
       BRA   LAB35
TSTPSW CMPA  ,Y+
       BNE   WRONG
       CMPY  #CODE+5
       LBEQ  CHEAT
       BRA   LOOP43
CODE   FCC   /STONE/
BLIVES FCB   3
BCAVE  FCB   1
BSPEED FCB   20
CCAVE  RMB   1
TXT9   FCC   /CAN YOU ESCAPE/,0
TXTA   FCC   /CAVE NO   ??/,0
CALC   LDX   #STAG1-509
       LDB   CCAVE
LOOP3C LEAX  509,X
       DECB
       BNE   LOOP3C
       RTS
SGAME  JSR   ZEROSC
       LDA   BLIVES
       STA   LIVES
       LDA   BCAVE
       STA   CCAVE
NCAVE  LDS   #$05FF
       TST   TILF
       BEQ   LAB36
       JSR   RND
SUB    CMPA  MAXSTG
       BLO   LAB37
       SUBA  MAXSTG
       BRA   SUB
LAB37  INCA
       STA   CCAVE
LAB36  LDX   #NOT
       STX   JUMPS+26
       JSR   PCLS
       LDD   #$0948
       LDX   #TXT9
       JSR   TXTOUT
       LDD   #$0A58
       JSR   TXTOUT
       LDA   CCAVE
       JSR   KONVRT
       LDX   #5906
       LDY   #BYTES+1
       LDB   #2
       JSR   NUMBER
       JSR   MELOD1
       LDA   CCAVE
       CMPA  #15      ;MAGISK
       BEQ   WIZOUT   ;SLIM
       CMPA  #22      ;MAGISK
       BNE   LAB34    ;VEGG
       LDX   #MAGSLM
       STX   JUMPS+26
       BRA   WIZOUT
LAB34  CMPA  #10      ;BEVEGELIG
       BNE   LAB33    ;MUR
       LDX   #WALLM
       STX   JUMPS+26
WIZOUT LDD   #$0780
       LDX   #TXT18
       JSR   TXTOUT
       LDX   #LIGHT
       LDY   #7695
       JSR   DRWGRP
       JSR   MELOD3
       JMP   START2
LAB33  JSR   CALC
       LEAX  9,X
       LDY   #500
LOOP47 LDA   ,X+
       TFR   A,B
       ANDA  #$0F
       CMPA  #$07
       BEQ   FSLIME
       ANDB  #$F0
       CMPB  #$70
       BEQ   FSLIME
       LEAY  -1,Y
       BNE   LOOP47
       BRA   START2
TXT17  FCC   /WATCH OUT FOR THE/
       FCC   / SLIME!/,0
TXT18  FCC   /THE WIZARD IS OUT/
       FCC   /!/,0
FSLIME LDX   #TXT17
       LDD   #$0480
       JSR   TXTOUT
       JSR   SNDON
       LDA   #$FF
       STA   DECAY
       LDD   #40
       STD   SPEED
       LDA   #10
       STA   BYTES
PLOOP  LDX   #GDATA1+224
       LDY   #7695
       JSR   DRWGRP
       LDU   #SLMSD1
       JSR   PLAY
       LDX   #GDATA2+224
       LDY   #7695
       JSR   DRWGRP
       LDU   #SLMSD2
       JSR   PLAY
       DEC   BYTES
       BNE   PLOOP
       JSR   SNDOFF
START2 CLR   SNDTYP
       LDX   #NSOUND
       STX   SWI1
       LDA   #$7E
       STA   SWI1-1
       JSR   CALC
       JSR   MOVSTG
       LDA   BSPEED
       STA   COUNT
       LDA   #10
       STA   PUFF
       STA   EFLAG
       LDD   #GDATA1
       STD   CHRSET
       LDD   #MANL1
       STD   DIR
       JSR   PCLS
       JSR   PRTTOP
       JSR   PSCORE
       JSR   PPOINT
       JSR   PLIVES
       JSR   PBONUS
       JSR   PDLEFT
GLOOP  JSR   $BD52
PRTMAZ TST   DIRBUF
       BNE   CLRBUF
       LDA   #32
       STA   DIRBUF
       LDD   $015A
       CMPA  #2
       BLO   LAB7
       CMPA  #61
       BHI   LAB7
       CMPB  #2
       BLO   LAB7
       CMPB  #61
       BHI   LAB7
CLRBUF CLR   DIRBUF
LAB7   LDX   #STAGE
       LDD   BASE
       ABX
       LDB   #40
       MUL
       LEAX  D,X
       TFR   X,U
       LDY   #3584
       LDA   #11
LOOPA  LDB   #16
LOOP9  PSHS  D
PRT    LDB   ,U
       ANDB  #$0F
       CMPB  #$06
       BNE   LAB1
PRTMAN LDX   DIR
       LDB   DIRBUF
       ABX
       BRA   GRPOUT
LAB1   LDX   CHRSET
       LDA   #32
       MUL
       LEAX  D,X
GRPOUT PSHS  Y,U
       LDA   #16
LOOP45 LDU   ,X++
       STU   ,Y
       LEAY  32,Y
       DECA
       BNE   LOOP45
       PULS  Y,U
NOPRT  PULS  D
       LEAU  1,U
       LEAY  2,Y
       DECB
       BNE   LOOP9
       LEAY  480,Y
       LEAU  24,U
       DECA
       BNE   LOOPA
       LDX   CHRSET
       LEAX  512,X
       STX   CHRSET
       CMPX  #GDATA4
       BHI   HIGH
       BRA   LAB2D
HIGH   LDX   #GDATA1
       STX   CHRSET
LAB2D  LDA   #1
       CLR   SFLAG1
       STA   SFLAG2
       STA   ALIVE
MOVALL LDX   #STAGE+41
LOOPE  LDB   ,X
       LSLB
       BCS   LAB2E
       LDB   ,X
       ANDB  #$0F
       LSLB
       LDY   #JUMPS
       JSR   (B,Y)
LAB2E  LDA   -81,X
       ANDA  #$7F
       STA   -81,X
       LEAX  1,X
       CMPX  #STAGE+1000
       BLO   LOOPE
       LEAX  -81,X
LOOP46 LDA   ,X
       ANDA  #$7F
       STA   ,X+
       CMPX  #STAGE+960
       BLO   LOOP46
SLMGEM LDA   CCAVE
       CMPA  #15      ;MAGISK
       BEQ   DECBON   ;SLIM
       TST   SFLAG1
       BEQ   DECBON
       TST   SFLAG2
       BEQ   SLMBOL
       CLR   SFLAG1
       LDX   #STAGE+40
LOOP11 LDA   ,X+
       ANDA  #$0F
       CMPA  #$07
       BNE   NESTE
       LDA   #$8B
       STA   -1,X
NESTE  CMPX  #STAGE+960
       BLO   LOOP11
       JSR   GEMFAL
       BRA   DECBON
SLMBOL LDA   SFLAG1
       CMPA  #150
       BLO   DECBON
       LDX   #STAGE+40
LOOP18 LDA   ,X+
       ANDA  #$0F
       CMPA  #$07
       BNE   LAB1E
       LDA   #$8C
       STA   -1,X
LAB1E  CMPX  #STAGE+960
       BLO   LOOP18
       JSR   EXPLOD
DECBON SWI
       LDA   BONUS
       BEQ   TSTEXT
       CMPA  #9
       BHI   LAB19
       JSR   FLASH
LAB19  DEC   COUNT
       BNE   TSTEXT
       LDA   BSPEED
       STA   COUNT
       DEC   BONUS
       JSR   PBONUS
       TST   BONUS
       BNE   TSTEXT
TOUT   JSR   HIRES
       LDX   #STAGE+40
LOOP14 LDA   ,X+
       ANDA  #$0F
       CMPA  #$06
       BNE   LAB1D
       LDA   #$82
       STA   -1,X
LAB1D  CMPX  #STAGE+960
       BLO   LOOP14
       LDX   #3072
       CLRA
       CLRB
LOOP17 STD   ,X++
       CMPX  #3584
       BLO   LOOP17
       LDX   #TXT2
       LDD   #$0904
       JSR   TXTOUT
TSTEXT TST   EFLAG
       BEQ   TSTBUT
       TST   DLEFT
       BNE   TSTBUT
       CLR   EFLAG
       LDX   #STAGE
LOOP13 LDA   ,X+
       ANDA  #$0F
       CMPA  #$0F
       BNE   NESTE2
       LDA   #$8A
       STA   -1,X
NESTE2 CMPX  #STAGE+1000
       BLO   LOOP13
       LDA   $FF23
       ORA   #$08
       STA   $FF23
       CLRA
LOOP37 TFR   A,B
LOOP36 STB   $FF20
       INCB
       BNE   LOOP36
       INCA
       BPL   LOOP37
       LDA   $FF23
       ANDA  #$F7
       STA   $FF23
TSTBUT LDA   $FF00
       ANDA  #$01
       BEQ   NLIVE
       JSR   $BBE5
       LBEQ  GLOOP
       CMPA  #32
       BEQ   PAUSE
       CMPA  #3
       BEQ   NLIVE2
       CMPA  #81
       LBNE  GLOOP
       JMP   TITLES
BLKTOP LDX   #3072
       LDD   #$0000
LOOP23 STD   ,X++
       CMPX  #3584
       BLO   LOOP23
       RTS
TXTB   FCC   /PAUSE - PRESS /
       FCC   /BUTTON/,0
PAUSE  BSR   BLKTOP
       LDD   #$0604
       LDX   #TXTB
       JSR   TXTOUT
LOOP26 LDA   $FF00
       ANDA  #$01
       BNE   LOOP26
       BSR   BLKTOP
       JSR   PRTTOP
       JSR   PSCORE
       JSR   PBONUS
       JSR   PLIVES
       JSR   PDLEFT
       JSR   PPOINT
       JMP   GLOOP
NLIVE  TST   ALIVE
       LBEQ  GLOOP
NLIVE2 JSR   HIRES
       DEC   LIVES
       BEQ   GAMEND
       JMP   START2
TXTC   FCC   /** GAME  OVER **/
       FCB   0
GAMEND JSR   PCLS
       LDD   #$0840
       LDX   #TXTC
       JSR   TXTOUT
       JSR   MELOD2
       LDB   #5
       LDY   #HIGHS+8
LOOP24 STY   BYTES
       LDX   #SCORE
LOOP2B LDA   ,X+
       ADDA  #48
       CMPA  ,Y+
       BHI   ENAME
       BLO   LAB24
       CMPX  #SCORE+6
       BLO   LOOP2B
LAB24  LDY   BYTES
       LEAY  15,Y
       DECB
       BNE   LOOP24
       JMP   TITLES
TXTD   FCC   /WHAT IS YOUR /
       FCC   /NAME?/,0
ENAME  LDD   BYTES
       CMPD  #HIGHS+68
       BEQ   ENAME2
       ADDD  #7
       STD   BYTES+2
       LDX   #HIGHS+75
LOOP2D LDA   -16,X
       STA   ,-X
       CMPX  BYTES+2
       BNE   LOOP2D
ENAME2 LDX   #SCORE
       LDY   BYTES
LOOP21 LDA   ,X+
       ADDA  #48
       STA   ,Y+
       CMPX  #SCORE+6
       BLO   LOOP21
       LEAY  -14,Y
       PSHS  Y
       LDX   #TXTD
       LDD   #$0790
       JSR   TXTOUT
       PULS  Y
       LDD   #$0DA0
       STD   CURSET
       LDB   #6
       STB   BYTES
LOOP28 LDA   $FF00
       ANDA  #$01
       BEQ   LOOP28
       LDA   #65
LOOP22 PSHS  A,Y
       JSR   CHROUT
       DEC   CURSET
       JSR   $BD52
       PULS  A,Y
       LDB   $FF00
       ANDB  #$01
       BNE   LAB20
       STA   ,Y+
       INC   CURSET
       JSR   SON2
       CLRA
LOOP2A PSHS  A
LOOP29 STA   $FF20
       INCA
       BNE   LOOP29
       PULS  A
       INCA
       BNE   LOOP2A
       JSR   SOFF2
       DEC   BYTES
       BNE   LOOP28
       JMP   TITLES
LAB20  LDB   $015A
       CMPB  #1
       BHI   LAB21
       CMPA  #65
       BNE   LAB25
       LDA   #$5E
LAB25  DECA
       BRA   VENT
LAB21  CMPB  #62
       BLO   LOOP22
       CMPA  #$5D
       BNE   LAB26
       LDA   #64
LAB26  INCA
       BRA   VENT
VENT   LDX   #$4000
LOOP2C LEAX  -1,X
       BNE   LOOP2C
       BRA   LOOP22
SON2   LDA   $FF23
       ORA   #$08
       STA   $FF23
       RTS
SOFF2  LDA   $FF23
       ANDA  #$F7
       STA   $FF23
       RTS
CHEAT  JSR   PCLS
       JSR   WULF
       LDX   #TXTE
       LDD   #$0B10
       JSR   TXTOUT
       LDD   #$0B18
       JSR   TXTOUT
       LDD   #$0538
       JSR   TXTOUT
       LDD   #$0550
       JSR   TXTOUT
       LDD   #$0568
       JSR   TXTOUT
       LDD   #$0580
       JSR   TXTOUT
       LDX   #4889
       LDA   BLIVES
       JSR   PRTTAL
       LDX   #5657
       LDA   BCAVE
       JSR   PRTTAL
       LDX   #6425
       LDA   BSPEED
       JSR   PRTTAL
KEY    JSR   $8006
       CMPA  #'Q
       LBEQ  TITLES
       CMPA  #'1
       BEQ   OPT1
       CMPA  #'2
       BEQ   OPT2
       CMPA  #'3
       BNE   KEY
OPT3   LDX   #6425
       LDD   #$1968
       BSR   ENTER
       TSTB
       BEQ   OPT3
       STB   BSPEED
       BRA   BEEP
OPT2   LDX   #5657
       LDD   #$1950
       BSR   ENTER
       TSTB
       BEQ   OPT2
       CMPB  MAXSTG
       BHI   OPT2
       STB   BCAVE
       BRA   BEEP
OPT1   LDX   #4889
       LDD   #$1938
       BSR   ENTER
       TSTB
       BEQ   OPT1
       STB   BLIVES
       BRA   BEEP
ENTER  STD   CURSET
       LDY   #$FFFF
       LDB   #8
LOOP2E STY   ,X
       LEAX  32,X
       DECB
       BNE   LOOP2E
       LDA   #2
       STA   BYTES
       LDX   #0
KEY2   JSR   $BBE5
       BEQ   KEY2
       CMPA  #'0
       BLO   KEY2
       CMPA  #'9
       BHI   KEY2
       SUBA  #48
       LEAX  A,X
       ADDA  #48
       JSR   CHROUT
       DEC   BYTES
       BEQ   BACKF
       TFR   X,D
       LDA   #10
       MUL
       TFR   D,X
       BRA   KEY2
BACKF  TFR   X,D
       RTS
BEEP   JSR   SNDON
       LDA   #100
       STA   BYTES
       LDB   #200
LOOP2F LDA   #63
       JSR   MSOUND
       JSR   PITCH
       CLRA
       JSR   MSOUND
       JSR   PITCH
       DEC   BYTES
       BNE   LOOP2F
       JSR   SNDOFF
       JMP   KEY
PRTTAL JSR   KONVRT
       LDY   #BYTES+1
       LDB   #2
       JMP   NUMBER

STAG1  EQU   *
