; Compiled with 1.32.271
--------------------------------------------------------------------
startup: ; startup
0801 : 0b __ __ INV
0802 : 08 __ __ PHP
0803 : 0a __ __ ASL
0804 : 00 __ __ BRK
0805 : 9e __ __ INV
0806 : 32 __ __ INV
0807 : 30 36 __ BMI $083f ; (startup + 62)
0809 : 31 00 __ AND ($00),y 
080b : 00 __ __ BRK
080c : 00 __ __ BRK
080d : ba __ __ TSX
080e : 8e fb 12 STX $12fb ; (spentry + 0)
0811 : a2 17 __ LDX #$17
0813 : a0 16 __ LDY #$16
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 1a __ CPX #$1a
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 24 __ CPY #$24
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 b1 __ LDA #$b1
083d : 85 23 __ STA SP + 0 
083f : a9 9f __ LDA #$9f
0841 : 85 24 __ STA SP + 1 
0843 : 20 80 08 JSR $0880 ; (main.s4 + 0)
0846 : a9 4c __ LDA #$4c
0848 : 85 54 __ STA $54 
084a : a9 00 __ LDA #$00
084c : 85 13 __ STA P6 
084e : a9 19 __ LDA #$19
0850 : 85 16 __ STA P9 
0852 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
;  74, "/home/xahmol/git/UltimateDemo2026/src/main.c"
.s4:
0880 : 20 76 0b JSR $0b76 ; (screen_init.s4 + 0)
0883 : a9 0d __ LDA #$0d
0885 : 85 0e __ STA P1 
0887 : a9 3d __ LDA #$3d
0889 : 85 0d __ STA P0 
088b : 20 a7 16 JSR $16a7 ; (cwin_put_string@proxy + 0)
088e : 20 19 0e JSR $0e19 ; (cwin_cursor_newline.s4 + 0)
0891 : a9 00 __ LDA #$00
0893 : 8d 09 dc STA $dc09 
0896 : 8d 08 dc STA $dc08 
.l5:
0899 : 20 31 0e JSR $0e31 ; (uii_detect.s4 + 0)
089c : aa __ __ TAX
089d : d0 07 __ BNE $08a6 ; (main.s7 + 0)
.s6:
089f : ad 09 dc LDA $dc09 
08a2 : c9 0a __ CMP #$0a
08a4 : 90 f3 __ BCC $0899 ; (main.l5 + 0)
.s7:
08a6 : 20 31 0e JSR $0e31 ; (uii_detect.s4 + 0)
08a9 : aa __ __ TAX
08aa : d0 29 __ BNE $08d5 ; (main.s9 + 0)
.s8:
08ac : 85 12 __ STA P5 
08ae : a9 0e __ LDA #$0e
08b0 : 85 14 __ STA P7 
08b2 : a9 61 __ LDA #$61
08b4 : 85 13 __ STA P6 
08b6 : 20 c6 0d JSR $0dc6 ; (screen_result@proxy + 0)
08b9 : a9 00 __ LDA #$00
08bb : 85 10 __ STA P3 
08bd : a9 0f __ LDA #$0f
08bf : 85 11 __ STA P4 
08c1 : a9 0f __ LDA #$0f
08c3 : a2 25 __ LDX #$25
.s59:
08c5 : 86 12 __ STX P5 
08c7 : 85 13 __ STA P6 
08c9 : 20 6e 0e JSR $0e6e ; (screen_error_exit.s4 + 0)
08cc : a9 01 __ LDA #$01
08ce : 85 1b __ STA ACCU + 0 
08d0 : a9 00 __ LDA #$00
.s3:
08d2 : 85 1c __ STA ACCU + 1 
08d4 : 60 __ __ RTS
.s9:
08d5 : a9 01 __ LDA #$01
08d7 : 8d fc 12 STA $12fc ; (uii_target + 0)
08da : 8d b4 9f STA $9fb4 ; (cmd[0] + 1)
08dd : a9 02 __ LDA #$02
08df : 85 0f __ STA P2 
08e1 : a9 00 __ LDA #$00
08e3 : 85 10 __ STA P3 
08e5 : 8d b3 9f STA $9fb3 ; (cmd[0] + 0)
08e8 : a9 b3 __ LDA #$b3
08ea : 85 0d __ STA P0 
08ec : a9 9f __ LDA #$9f
08ee : 85 0e __ STA P1 
08f0 : 20 40 0f JSR $0f40 ; (uii_sendcommand.s4 + 0)
08f3 : 20 8b 0f JSR $0f8b ; (uii_readdata.s4 + 0)
08f6 : 20 bb 0f JSR $0fbb ; (uii_readstatus.s4 + 0)
08f9 : 20 19 10 JSR $1019 ; (uii_accept.s4 + 0)
08fc : ad 23 19 LDA $1923 ; (uii_status[0] + 0)
08ff : c9 30 __ CMP #$30
0901 : d0 12 __ BNE $0915 ; (main.s10 + 0)
.s56:
0903 : ad 24 19 LDA $1924 ; (uii_status[0] + 1)
0906 : c9 30 __ CMP #$30
0908 : d0 0b __ BNE $0915 ; (main.s10 + 0)
.s57:
090a : ad 22 17 LDA $1722 ; (uii_data[0] + 0)
090d : f0 06 __ BEQ $0915 ; (main.s10 + 0)
.s58:
090f : 20 e6 0e JSR $0ee6 ; (uci_to_upper@proxy + 0)
0912 : 4c 20 09 JMP $0920 ; (main.s12 + 0)
.s10:
0915 : a2 ff __ LDX #$ff
.l11:
0917 : e8 __ __ INX
0918 : bd f1 0e LDA $0ef1,x 
091b : 9d bd 9f STA $9fbd,x ; (detail[0] + 0)
091e : d0 f7 __ BNE $0917 ; (main.l11 + 0)
.s12:
0920 : a9 01 __ LDA #$01
0922 : 85 12 __ STA P5 
0924 : a9 9f __ LDA #$9f
0926 : 85 14 __ STA P7 
0928 : a9 bd __ LDA #$bd
092a : 85 13 __ STA P6 
092c : 20 c6 0d JSR $0dc6 ; (screen_result@proxy + 0)
092f : 20 eb 0f JSR $0feb ; (uii_get_hwinfo.s4 + 0)
0932 : ad 23 19 LDA $1923 ; (uii_status[0] + 0)
0935 : c9 30 __ CMP #$30
0937 : d0 26 __ BNE $095f ; (main.s13 + 0)
.s53:
0939 : ad 24 19 LDA $1924 ; (uii_status[0] + 1)
093c : c9 30 __ CMP #$30
093e : d0 1f __ BNE $095f ; (main.s13 + 0)
.s54:
0940 : 20 e6 0e JSR $0ee6 ; (uci_to_upper@proxy + 0)
0943 : aa __ __ TAX
0944 : f0 19 __ BEQ $095f ; (main.s13 + 0)
.s55:
0946 : a9 10 __ LDA #$10
0948 : 85 0e __ STA P1 
094a : a9 57 __ LDA #$57
094c : 85 0d __ STA P0 
094e : 20 ae 16 JSR $16ae ; (cwin_put_string@proxy + 0)
0951 : a9 bd __ LDA #$bd
0953 : 85 0d __ STA P0 
0955 : a9 9f __ LDA #$9f
0957 : 85 0e __ STA P1 
0959 : 20 a0 16 JSR $16a0 ; (cwin_put_string@proxy + 0)
095c : 20 19 0e JSR $0e19 ; (cwin_cursor_newline.s4 + 0)
.s13:
095f : a9 10 __ LDA #$10
0961 : 85 0e __ STA P1 
0963 : a9 62 __ LDA #$62
0965 : 85 0d __ STA P0 
0967 : 20 a7 16 JSR $16a7 ; (cwin_put_string@proxy + 0)
096a : 20 19 0e JSR $0e19 ; (cwin_cursor_newline.s4 + 0)
096d : 20 72 10 JSR $1072 ; (detect_reu.s4 + 0)
0970 : c9 10 __ CMP #$10
0972 : b0 03 __ BCS $0977 ; (main.s14 + 0)
0974 : 4c 4f 0b JMP $0b4f ; (main.s49 + 0)
.s14:
0977 : a9 11 __ LDA #$11
0979 : 85 14 __ STA P7 
097b : a9 eb __ LDA #$eb
097d : 85 13 __ STA P6 
097f : 20 8e 16 JSR $168e ; (screen_result@proxy + 0)
0982 : a9 12 __ LDA #$12
0984 : 85 0e __ STA P1 
0986 : a9 00 __ LDA #$00
0988 : 85 0d __ STA P0 
098a : 20 a7 16 JSR $16a7 ; (cwin_put_string@proxy + 0)
098d : 20 19 0e JSR $0e19 ; (cwin_cursor_newline.s4 + 0)
0990 : 20 17 12 JSR $1217 ; (turbo_detect.s4 + 0)
0993 : a9 f1 __ LDA #$f1
0995 : 85 10 __ STA P3 
0997 : a9 11 __ LDA #$11
0999 : 85 11 __ STA P4 
099b : a5 1b __ LDA ACCU + 0 
099d : d0 1c __ BNE $09bb ; (main.s16 + 0)
.s15:
099f : c6 12 __ DEC P5 
09a1 : a9 00 __ LDA #$00
09a3 : 85 13 __ STA P6 
09a5 : a9 13 __ LDA #$13
09a7 : 85 14 __ STA P7 
09a9 : 20 ce 0d JSR $0dce ; (screen_result.s4 + 0)
09ac : a9 15 __ LDA #$15
09ae : 85 10 __ STA P3 
09b0 : a9 13 __ LDA #$13
09b2 : 85 11 __ STA P4 
09b4 : a9 13 __ LDA #$13
09b6 : a2 39 __ LDX #$39
09b8 : 4c c5 08 JMP $08c5 ; (main.s59 + 0)
.s16:
09bb : c9 02 __ CMP #$02
09bd : d0 19 __ BNE $09d8 ; (main.s18 + 0)
.s17:
09bf : a9 ff __ LDA #$ff
09c1 : 85 4c __ STA T3 + 0 
09c3 : a9 11 __ LDA #$11
09c5 : a2 f7 __ LDX #$f7
.s19:
09c7 : 86 1b __ STX ACCU + 0 
09c9 : 85 1c __ STA ACCU + 1 
09cb : a9 bd __ LDA #$bd
09cd : 85 13 __ STA P6 
09cf : a9 9f __ LDA #$9f
09d1 : 85 14 __ STA P7 
09d3 : a0 ff __ LDY #$ff
09d5 : 4c 5b 0a JMP $0a5b ; (main.l20 + 0)
.s18:
09d8 : a9 00 __ LDA #$00
09da : 85 4c __ STA T3 + 0 
09dc : a6 1b __ LDX ACCU + 0 
09de : ca __ __ DEX
09df : f0 07 __ BEQ $09e8 ; (main.s29 + 0)
.s60:
09e1 : a9 11 __ LDA #$11
09e3 : a2 f1 __ LDX #$f1
09e5 : 4c c7 09 JMP $09c7 ; (main.s19 + 0)
.s29:
09e8 : 20 f0 12 JSR $12f0 ; (turbo_get.s3 + 0)
09eb : 29 0f __ AND #$0f
09ed : c9 0e __ CMP #$0e
09ef : d0 07 __ BNE $09f8 ; (main.s30 + 0)
.s48:
09f1 : a9 12 __ LDA #$12
09f3 : a2 f4 __ LDX #$f4
09f5 : 4c c7 09 JMP $09c7 ; (main.s19 + 0)
.s30:
09f8 : c9 0d __ CMP #$0d
09fa : d0 07 __ BNE $0a03 ; (main.s31 + 0)
.s47:
09fc : a9 13 __ LDA #$13
09fe : a2 5b __ LDX #$5b
0a00 : 4c c7 09 JMP $09c7 ; (main.s19 + 0)
.s31:
0a03 : c9 0c __ CMP #$0c
0a05 : d0 07 __ BNE $0a0e ; (main.s32 + 0)
.s46:
0a07 : a9 13 __ LDA #$13
0a09 : a2 62 __ LDX #$62
0a0b : 4c c7 09 JMP $09c7 ; (main.s19 + 0)
.s32:
0a0e : c9 0b __ CMP #$0b
0a10 : d0 07 __ BNE $0a19 ; (main.s33 + 0)
.s45:
0a12 : a9 13 __ LDA #$13
0a14 : a2 69 __ LDX #$69
0a16 : 4c c7 09 JMP $09c7 ; (main.s19 + 0)
.s33:
0a19 : c9 0a __ CMP #$0a
0a1b : d0 07 __ BNE $0a24 ; (main.s34 + 0)
.s44:
0a1d : a9 13 __ LDA #$13
0a1f : a2 70 __ LDX #$70
0a21 : 4c c7 09 JMP $09c7 ; (main.s19 + 0)
.s34:
0a24 : c9 09 __ CMP #$09
0a26 : d0 07 __ BNE $0a2f ; (main.s35 + 0)
.s43:
0a28 : a9 13 __ LDA #$13
0a2a : a2 77 __ LDX #$77
0a2c : 4c c7 09 JMP $09c7 ; (main.s19 + 0)
.s35:
0a2f : c9 08 __ CMP #$08
0a31 : d0 07 __ BNE $0a3a ; (main.s36 + 0)
.s42:
0a33 : a9 13 __ LDA #$13
0a35 : a2 7e __ LDX #$7e
0a37 : 4c c7 09 JMP $09c7 ; (main.s19 + 0)
.s36:
0a3a : c9 07 __ CMP #$07
0a3c : d0 07 __ BNE $0a45 ; (main.s37 + 0)
.s41:
0a3e : a9 13 __ LDA #$13
0a40 : a2 85 __ LDX #$85
0a42 : 4c c7 09 JMP $09c7 ; (main.s19 + 0)
.s37:
0a45 : c9 06 __ CMP #$06
0a47 : d0 07 __ BNE $0a50 ; (main.s38 + 0)
.s40:
0a49 : a9 13 __ LDA #$13
0a4b : a2 8c __ LDX #$8c
0a4d : 4c c7 09 JMP $09c7 ; (main.s19 + 0)
.s38:
0a50 : c9 05 __ CMP #$05
0a52 : d0 8d __ BNE $09e1 ; (main.s60 + 0)
.s39:
0a54 : a9 13 __ LDA #$13
0a56 : a2 93 __ LDX #$93
0a58 : 4c c7 09 JMP $09c7 ; (main.s19 + 0)
.l20:
0a5b : c8 __ __ INY
0a5c : b1 1b __ LDA (ACCU + 0),y 
0a5e : 99 bd 9f STA $9fbd,y ; (detail[0] + 0)
0a61 : d0 f8 __ BNE $0a5b ; (main.l20 + 0)
.s21:
0a63 : 20 ce 0d JSR $0dce ; (screen_result.s4 + 0)
0a66 : a9 13 __ LDA #$13
0a68 : 85 0e __ STA P1 
0a6a : a9 99 __ LDA #$99
0a6c : 85 0d __ STA P0 
0a6e : 20 a7 16 JSR $16a7 ; (cwin_put_string@proxy + 0)
0a71 : 20 19 0e JSR $0e19 ; (cwin_cursor_newline.s4 + 0)
0a74 : 20 b4 13 JSR $13b4 ; (audio_detect.s4 + 0)
0a77 : aa __ __ TAX
0a78 : d0 1c __ BNE $0a96 ; (main.s23 + 0)
.s22:
0a7a : c6 12 __ DEC P5 
0a7c : a9 14 __ LDA #$14
0a7e : 85 14 __ STA P7 
0a80 : a9 45 __ LDA #$45
0a82 : 85 13 __ STA P6 
0a84 : 20 83 16 JSR $1683 ; (screen_result@proxy + 0)
0a87 : a9 56 __ LDA #$56
0a89 : 85 10 __ STA P3 
0a8b : a9 14 __ LDA #$14
0a8d : 85 11 __ STA P4 
0a8f : a9 14 __ LDA #$14
0a91 : a2 7a __ LDX #$7a
0a93 : 4c c5 08 JMP $08c5 ; (main.s59 + 0)
.s23:
0a96 : ad 21 df LDA $df21 
0a99 : 85 4b __ STA T2 + 0 
0a9b : 85 0f __ STA P2 
0a9d : a9 b9 __ LDA #$b9
0a9f : 85 0d __ STA P0 
0aa1 : a9 9f __ LDA #$9f
0aa3 : 85 0e __ STA P1 
0aa5 : 20 99 14 JSR $1499 ; (fmt_dec.s4 + 0)
0aa8 : a9 bd __ LDA #$bd
0aaa : 85 0d __ STA P0 
0aac : a9 9f __ LDA #$9f
0aae : 85 0e __ STA P1 
0ab0 : a9 b9 __ LDA #$b9
0ab2 : 85 0f __ STA P2 
0ab4 : a9 9f __ LDA #$9f
0ab6 : 85 10 __ STA P3 
0ab8 : a2 ff __ LDX #$ff
.l24:
0aba : e8 __ __ INX
0abb : bd fe 0e LDA $0efe,x 
0abe : 9d bd 9f STA $9fbd,x ; (detail[0] + 0)
0ac1 : d0 f7 __ BNE $0aba ; (main.l24 + 0)
.s25:
0ac3 : 20 e9 14 JSR $14e9 ; (strcat.s4 + 0)
0ac6 : 20 83 16 JSR $1683 ; (screen_result@proxy + 0)
0ac9 : a9 0f __ LDA #$0f
0acb : 85 0f __ STA P2 
0acd : 20 19 0e JSR $0e19 ; (cwin_cursor_newline.s4 + 0)
0ad0 : a9 1c __ LDA #$1c
0ad2 : 85 0d __ STA P0 
0ad4 : a9 15 __ LDA #$15
0ad6 : 85 0e __ STA P1 
0ad8 : 20 66 0d JSR $0d66 ; (cwin_put_string.s4 + 0)
0adb : 20 99 16 JSR $1699 ; (cwin_cursor_newline@proxy + 0)
0ade : 20 19 0e JSR $0e19 ; (cwin_cursor_newline.s4 + 0)
0ae1 : a9 40 __ LDA #$40
0ae3 : 85 0d __ STA P0 
0ae5 : a9 15 __ LDA #$15
0ae7 : 85 0e __ STA P1 
0ae9 : 20 66 0d JSR $0d66 ; (cwin_put_string.s4 + 0)
0aec : a9 03 __ LDA #$03
0aee : 85 0f __ STA P2 
0af0 : 20 19 0e JSR $0e19 ; (cwin_cursor_newline.s4 + 0)
0af3 : a9 52 __ LDA #$52
0af5 : 85 0d __ STA P0 
0af7 : a9 15 __ LDA #$15
0af9 : 85 0e __ STA P1 
0afb : 20 66 0d JSR $0d66 ; (cwin_put_string.s4 + 0)
0afe : 20 19 0e JSR $0e19 ; (cwin_cursor_newline.s4 + 0)
0b01 : 24 4c __ BIT T3 + 0 
0b03 : 30 07 __ BMI $0b0c ; (main.s28 + 0)
.s26:
0b05 : a9 15 __ LDA #$15
0b07 : a2 7d __ LDX #$7d
0b09 : 4c 10 0b JMP $0b10 ; (main.s27 + 0)
.s28:
0b0c : a9 15 __ LDA #$15
0b0e : a2 6a __ LDX #$6a
.s27:
0b10 : 86 0d __ STX P0 
0b12 : 85 0e __ STA P1 
0b14 : 20 66 0d JSR $0d66 ; (cwin_put_string.s4 + 0)
0b17 : a5 4b __ LDA T2 + 0 
0b19 : 85 0f __ STA P2 
0b1b : 20 19 0e JSR $0e19 ; (cwin_cursor_newline.s4 + 0)
0b1e : a9 b5 __ LDA #$b5
0b20 : 85 0d __ STA P0 
0b22 : a9 9f __ LDA #$9f
0b24 : 85 0e __ STA P1 
0b26 : 20 99 14 JSR $1499 ; (fmt_dec.s4 + 0)
0b29 : a9 15 __ LDA #$15
0b2b : 85 0e __ STA P1 
0b2d : a9 90 __ LDA #$90
0b2f : 85 0d __ STA P0 
0b31 : 20 a0 16 JSR $16a0 ; (cwin_put_string@proxy + 0)
0b34 : a9 b5 __ LDA #$b5
0b36 : 85 0d __ STA P0 
0b38 : a9 9f __ LDA #$9f
0b3a : 85 0e __ STA P1 
0b3c : 20 66 0d JSR $0d66 ; (cwin_put_string.s4 + 0)
0b3f : 20 19 0e JSR $0e19 ; (cwin_cursor_newline.s4 + 0)
0b42 : 20 19 0e JSR $0e19 ; (cwin_cursor_newline.s4 + 0)
0b45 : 20 ac 15 JSR $15ac ; (screen_wait_key.s4 + 0)
0b48 : a9 00 __ LDA #$00
0b4a : 85 1b __ STA ACCU + 0 
0b4c : 4c d2 08 JMP $08d2 ; (main.s3 + 0)
.s49:
0b4f : a2 00 __ LDX #$00
0b51 : 86 12 __ STX P5 
0b53 : aa __ __ TAX
0b54 : f0 06 __ BEQ $0b5c ; (main.s50 + 0)
.s52:
0b56 : a9 11 __ LDA #$11
0b58 : a2 9d __ LDX #$9d
0b5a : 90 04 __ BCC $0b60 ; (main.s51 + 0)
.s50:
0b5c : a9 0e __ LDA #$0e
0b5e : a2 61 __ LDX #$61
.s51:
0b60 : 86 13 __ STX P6 
0b62 : 85 14 __ STA P7 
0b64 : 20 8e 16 JSR $168e ; (screen_result@proxy + 0)
0b67 : a9 b4 __ LDA #$b4
0b69 : 85 10 __ STA P3 
0b6b : a9 11 __ LDA #$11
0b6d : 85 11 __ STA P4 
0b6f : a9 11 __ LDA #$11
0b71 : a2 cb __ LDX #$cb
0b73 : 4c c5 08 JMP $08c5 ; (main.s59 + 0)
--------------------------------------------------------------------
screen_init: ; screen_init(const u8*)->void
;  13, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
0b76 : a9 00 __ LDA #$00
0b78 : 8d 16 17 STA $1716 ; (cw.sx + 0)
0b7b : 8d 17 17 STA $1717 ; (cw.sy + 0)
0b7e : 8d 1a 17 STA $171a ; (cw.cx + 0)
0b81 : 8d 1b 17 STA $171b ; (cw.cy + 0)
0b84 : a9 19 __ LDA #$19
0b86 : 8d 19 17 STA $1719 ; (cw.wy + 0)
0b89 : a9 1b __ LDA #$1b
0b8b : 8d 11 d0 STA $d011 
0b8e : a9 08 __ LDA #$08
0b90 : 8d 16 d0 STA $d016 
0b93 : ad 00 dd LDA $dd00 
0b96 : 29 fc __ AND #$fc
0b98 : 09 03 __ ORA #$03
0b9a : 8d 00 dd STA $dd00 
0b9d : a9 16 __ LDA #$16
0b9f : 8d 18 d0 STA $d018 
0ba2 : a9 00 __ LDA #$00
0ba4 : 8d 20 d0 STA $d020 
0ba7 : 8d 21 d0 STA $d021 
0baa : 85 43 __ STA T0 + 0 
0bac : 8d 1e 17 STA $171e ; (cw.sp + 0)
0baf : 8d 20 17 STA $1720 ; (cw.cp + 0)
0bb2 : a9 04 __ LDA #$04
0bb4 : 8d 1f 17 STA $171f ; (cw.sp + 1)
0bb7 : 85 44 __ STA T0 + 1 
0bb9 : a9 d8 __ LDA #$d8
0bbb : 8d 21 17 STA $1721 ; (cw.cp + 1)
0bbe : 85 46 __ STA T1 + 1 
0bc0 : a2 00 __ LDX #$00
0bc2 : 86 45 __ STX T1 + 0 
0bc4 : a9 28 __ LDA #$28
0bc6 : 8d 18 17 STA $1718 ; (cw.wx + 0)
.l8:
0bc9 : 85 1b __ STA ACCU + 0 
0bcb : a0 00 __ LDY #$00
.l9:
0bcd : a9 20 __ LDA #$20
0bcf : 91 43 __ STA (T0 + 0),y 
0bd1 : a9 01 __ LDA #$01
0bd3 : 91 45 __ STA (T1 + 0),y 
0bd5 : c8 __ __ INY
0bd6 : c4 1b __ CPY ACCU + 0 
0bd8 : 90 f3 __ BCC $0bcd ; (screen_init.l9 + 0)
.l6:
0bda : e8 __ __ INX
0bdb : ec 19 17 CPX $1719 ; (cw.wy + 0)
0bde : 90 2f __ BCC $0c0f ; (screen_init.s5 + 0)
.s7:
0be0 : a9 00 __ LDA #$00
0be2 : 85 0d __ STA P0 
0be4 : a9 0d __ LDA #$0d
0be6 : 85 0f __ STA P2 
0be8 : a9 05 __ LDA #$05
0bea : 85 10 __ STA P3 
0bec : a9 2c __ LDA #$2c
0bee : 85 0e __ STA P1 
0bf0 : 20 55 0c JSR $0c55 ; (header_line.s4 + 0)
0bf3 : e6 0d __ INC P0 
0bf5 : a9 0d __ LDA #$0d
0bf7 : 85 10 __ STA P3 
0bf9 : a9 0c __ LDA #$0c
0bfb : 85 0f __ STA P2 
0bfd : a9 2b __ LDA #$2b
0bff : 85 0e __ STA P1 
0c01 : 20 55 0c JSR $0c55 ; (header_line.s4 + 0)
0c04 : a9 00 __ LDA #$00
0c06 : 8d 1a 17 STA $171a ; (cw.cx + 0)
0c09 : a9 03 __ LDA #$03
0c0b : 8d 1b 17 STA $171b ; (cw.cy + 0)
.s3:
0c0e : 60 __ __ RTS
.s5:
0c0f : a5 43 __ LDA T0 + 0 
0c11 : 69 28 __ ADC #$28
0c13 : 85 43 __ STA T0 + 0 
0c15 : 90 03 __ BCC $0c1a ; (screen_init.s11 + 0)
.s10:
0c17 : e6 44 __ INC T0 + 1 
0c19 : 18 __ __ CLC
.s11:
0c1a : a5 45 __ LDA T1 + 0 
0c1c : 69 28 __ ADC #$28
0c1e : 85 45 __ STA T1 + 0 
0c20 : 90 02 __ BCC $0c24 ; (screen_init.s13 + 0)
.s12:
0c22 : e6 46 __ INC T1 + 1 
.s13:
0c24 : ad 18 17 LDA $1718 ; (cw.wx + 0)
0c27 : f0 b1 __ BEQ $0bda ; (screen_init.l6 + 0)
0c29 : d0 9e __ BNE $0bc9 ; (screen_init.l8 + 0)
--------------------------------------------------------------------
0c2b : __ __ __ BYT 68 41 52 44 57 41 52 45 20 64 45 54 45 43 54 49 : hARDWARE dETECTI
0c3b : __ __ __ BYT 4f 4e 20 20 20 56 30 2e 31 2e 30 2d 32 30 32 36 : ON   V0.1.0-2026
0c4b : __ __ __ BYT 30 35 30 33 2d 31 35 31 30 00                   : 0503-1510.
--------------------------------------------------------------------
header_line: ; header_line(u8,const u8*,u8)->void
;  41, "/home/xahmol/git/UltimateDemo2026/src/screen.c"
.s4:
0c55 : a0 00 __ LDY #$00
0c57 : 84 1b __ STY ACCU + 0 
0c59 : b1 0e __ LDA (P1),y ; (text + 0)
0c5b : f0 16 __ BEQ $0c73 ; (header_line.s5 + 0)
.s11:
0c5d : a5 0e __ LDA P1 ; (text + 0)
0c5f : 85 45 __ STA T2 + 0 
0c61 : a5 0f __ LDA P2 ; (text + 1)
0c63 : 85 46 __ STA T2 + 1 
0c65 : a2 00 __ LDX #$00
.l12:
0c67 : c8 __ __ INY
0c68 : d0 02 __ BNE $0c6c ; (header_line.s19 + 0)
.s18:
0c6a : e6 46 __ INC T2 + 1 
.s19:
0c6c : e8 __ __ INX
0c6d : b1 45 __ LDA (T2 + 0),y 
0c6f : d0 f6 __ BNE $0c67 ; (header_line.l12 + 0)
.s15:
0c71 : 86 1b __ STX ACCU + 0 
.s5:
0c73 : a5 0d __ LDA P0 ; (row + 0)
0c75 : 0a __ __ ASL
0c76 : aa __ __ TAX
0c77 : bd c0 16 LDA $16c0,x ; (mul40[0] + 0)
0c7a : 85 45 __ STA T2 + 0 
0c7c : 18 __ __ CLC
0c7d : 6d 1e 17 ADC $171e ; (cw.sp + 0)
0c80 : 85 47 __ STA T3 + 0 
0c82 : bd c1 16 LDA $16c1,x ; (mul40[0] + 1)
0c85 : 85 46 __ STA T2 + 1 
0c87 : 6d 1f 17 ADC $171f ; (cw.sp + 1)
0c8a : 85 48 __ STA T3 + 1 
0c8c : ad 20 17 LDA $1720 ; (cw.cp + 0)
0c8f : 18 __ __ CLC
0c90 : 65 45 __ ADC T2 + 0 
0c92 : 85 49 __ STA T4 + 0 
0c94 : ad 21 17 LDA $1721 ; (cw.cp + 1)
0c97 : 65 46 __ ADC T2 + 1 
0c99 : 85 4a __ STA T4 + 1 
0c9b : 38 __ __ SEC
0c9c : a9 28 __ LDA #$28
0c9e : e5 1b __ SBC ACCU + 0 
0ca0 : a8 __ __ TAY
0ca1 : a9 00 __ LDA #$00
0ca3 : e9 00 __ SBC #$00
0ca5 : aa __ __ TAX
0ca6 : 0a __ __ ASL
0ca7 : 98 __ __ TYA
0ca8 : 69 00 __ ADC #$00
0caa : 85 1c __ STA ACCU + 1 
0cac : 8a __ __ TXA
0cad : 69 00 __ ADC #$00
0caf : 4a __ __ LSR
0cb0 : 66 1c __ ROR ACCU + 1 
0cb2 : a0 00 __ LDY #$00
0cb4 : a6 10 __ LDX P3 ; (color + 0)
.l13:
0cb6 : a9 a0 __ LDA #$a0
0cb8 : 91 47 __ STA (T3 + 0),y 
0cba : 8a __ __ TXA
0cbb : 91 49 __ STA (T4 + 0),y 
0cbd : c8 __ __ INY
0cbe : c0 28 __ CPY #$28
0cc0 : d0 f4 __ BNE $0cb6 ; (header_line.l13 + 0)
.s14:
0cc2 : a9 00 __ LDA #$00
0cc4 : 85 1d __ STA ACCU + 2 
0cc6 : a5 1b __ LDA ACCU + 0 
0cc8 : f0 1f __ BEQ $0ce9 ; (header_line.s6 + 0)
.s16:
0cca : a0 00 __ LDY #$00
.l10:
0ccc : b1 0e __ LDA (P1),y ; (text + 0)
0cce : 4a __ __ LSR
0ccf : 4a __ __ LSR
0cd0 : 4a __ __ LSR
0cd1 : 4a __ __ LSR
0cd2 : 4a __ __ LSR
0cd3 : aa __ __ TAX
0cd4 : bd f2 16 LDA $16f2,x ; (p2smap[0] + 0)
0cd7 : 51 0e __ EOR (P1),y ; (text + 0)
0cd9 : 09 80 __ ORA #$80
0cdb : 99 d7 9f STA $9fd7,y ; (buf[0] + 0)
0cde : c8 __ __ INY
0cdf : c4 1b __ CPY ACCU + 0 
0ce1 : b0 04 __ BCS $0ce7 ; (header_line.s17 + 0)
.s9:
0ce3 : c0 28 __ CPY #$28
0ce5 : 90 e5 __ BCC $0ccc ; (header_line.l10 + 0)
.s17:
0ce7 : 84 1d __ STY ACCU + 2 
.s6:
0ce9 : a9 00 __ LDA #$00
0ceb : a6 1d __ LDX ACCU + 2 
0ced : 9d d7 9f STA $9fd7,x ; (buf[0] + 0)
0cf0 : 18 __ __ CLC
0cf1 : a5 1c __ LDA ACCU + 1 
0cf3 : 65 45 __ ADC T2 + 0 
0cf5 : 85 1b __ STA ACCU + 0 
0cf7 : a5 46 __ LDA T2 + 1 
0cf9 : 69 00 __ ADC #$00
0cfb : 85 1c __ STA ACCU + 1 
0cfd : ad 1e 17 LDA $171e ; (cw.sp + 0)
0d00 : 18 __ __ CLC
0d01 : 65 1b __ ADC ACCU + 0 
0d03 : 85 43 __ STA T1 + 0 
0d05 : ad 1f 17 LDA $171f ; (cw.sp + 1)
0d08 : 65 1c __ ADC ACCU + 1 
0d0a : 85 44 __ STA T1 + 1 
0d0c : ad 20 17 LDA $1720 ; (cw.cp + 0)
0d0f : 18 __ __ CLC
0d10 : 65 1b __ ADC ACCU + 0 
0d12 : 85 45 __ STA T2 + 0 
0d14 : ad 21 17 LDA $1721 ; (cw.cp + 1)
0d17 : 65 1c __ ADC ACCU + 1 
0d19 : 85 46 __ STA T2 + 1 
0d1b : a0 00 __ LDY #$00
0d1d : f0 07 __ BEQ $0d26 ; (header_line.l7 + 0)
.s8:
0d1f : 91 43 __ STA (T1 + 0),y 
0d21 : a5 10 __ LDA P3 ; (color + 0)
0d23 : 91 45 __ STA (T2 + 0),y 
0d25 : c8 __ __ INY
.l7:
0d26 : b9 d7 9f LDA $9fd7,y ; (buf[0] + 0)
0d29 : d0 f4 __ BNE $0d1f ; (header_line.s8 + 0)
.s3:
0d2b : 60 __ __ RTS
--------------------------------------------------------------------
0d2c : __ __ __ BYT 75 4c 54 49 4d 41 54 45 64 45 4d 4f 32 30 32 36 : uLTIMATEdEMO2026
0d3c : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
0d3d : __ __ __ BYT 77 41 49 54 49 4e 47 20 46 4f 52 20 75 4c 54 49 : wAITING FOR uLTI
0d4d : __ __ __ BYT 4d 41 54 45 20 46 49 52 4d 57 41 52 45 2e 2e 2e : MATE FIRMWARE...
0d5d : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
cwin_put_string@proxy: ; cwin_put_string@proxy
0d5e : a9 54 __ LDA #$54
0d60 : 85 0d __ STA P0 
0d62 : a9 0e __ LDA #$0e
0d64 : 85 0e __ STA P1 
--------------------------------------------------------------------
cwin_put_string: ; cwin_put_string(struct CharWin*,const u8*,u8)->void
;  64, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
0d66 : ad 1b 17 LDA $171b ; (cw.cy + 0)
0d69 : 0a __ __ ASL
0d6a : aa __ __ TAX
0d6b : bd c0 16 LDA $16c0,x ; (mul40[0] + 0)
0d6e : 6d 1a 17 ADC $171a ; (cw.cx + 0)
0d71 : 85 1b __ STA ACCU + 0 
0d73 : bd c1 16 LDA $16c1,x ; (mul40[0] + 1)
0d76 : 69 00 __ ADC #$00
0d78 : 85 1c __ STA ACCU + 1 
0d7a : ad 1e 17 LDA $171e ; (cw.sp + 0)
0d7d : 65 1b __ ADC ACCU + 0 
0d7f : 85 43 __ STA T1 + 0 
0d81 : ad 1f 17 LDA $171f ; (cw.sp + 1)
0d84 : 65 1c __ ADC ACCU + 1 
0d86 : 85 44 __ STA T1 + 1 
0d88 : ad 20 17 LDA $1720 ; (cw.cp + 0)
0d8b : 18 __ __ CLC
0d8c : 65 1b __ ADC ACCU + 0 
0d8e : 85 1b __ STA ACCU + 0 
0d90 : ad 21 17 LDA $1721 ; (cw.cp + 1)
0d93 : 65 1c __ ADC ACCU + 1 
0d95 : 85 1c __ STA ACCU + 1 
0d97 : a0 00 __ LDY #$00
0d99 : b1 0d __ LDA (P0),y ; (str + 0)
0d9b : f0 16 __ BEQ $0db3 ; (cwin_put_string.s5 + 0)
.l7:
0d9d : 4a __ __ LSR
0d9e : 4a __ __ LSR
0d9f : 4a __ __ LSR
0da0 : 4a __ __ LSR
0da1 : 4a __ __ LSR
0da2 : aa __ __ TAX
0da3 : bd 00 17 LDA $1700,x ; (p2smap[0] + 0)
0da6 : 51 0d __ EOR (P0),y ; (str + 0)
0da8 : 91 43 __ STA (T1 + 0),y 
0daa : a5 0f __ LDA P2 ; (color + 0)
0dac : 91 1b __ STA (ACCU + 0),y 
0dae : c8 __ __ INY
0daf : b1 0d __ LDA (P0),y ; (str + 0)
0db1 : d0 ea __ BNE $0d9d ; (cwin_put_string.l7 + 0)
.s5:
0db3 : 98 __ __ TYA
0db4 : 18 __ __ CLC
0db5 : 6d 1a 17 ADC $171a ; (cw.cx + 0)
0db8 : cd 18 17 CMP $1718 ; (cw.wx + 0)
0dbb : 90 05 __ BCC $0dc2 ; (cwin_put_string.s3 + 0)
.s6:
0dbd : a9 00 __ LDA #$00
0dbf : ee 1b 17 INC $171b ; (cw.cy + 0)
.s3:
0dc2 : 8d 1a 17 STA $171a ; (cw.cx + 0)
0dc5 : 60 __ __ RTS
--------------------------------------------------------------------
screen_result@proxy: ; screen_result@proxy
0dc6 : a9 5b __ LDA #$5b
0dc8 : 85 10 __ STA P3 
0dca : a9 0e __ LDA #$0e
0dcc : 85 11 __ STA P4 
--------------------------------------------------------------------
screen_result: ; screen_result(const u8*,u8,const u8*)->void
;  17, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
0dce : a9 01 __ LDA #$01
0dd0 : 85 0f __ STA P2 
0dd2 : 20 5e 0d JSR $0d5e ; (cwin_put_string@proxy + 0)
0dd5 : 20 b5 16 JSR $16b5 ; (cwin_put_string@proxy + 0)
0dd8 : a9 57 __ LDA #$57
0dda : 85 0d __ STA P0 
0ddc : a9 0e __ LDA #$0e
0dde : 85 0e __ STA P1 
0de0 : 20 66 0d JSR $0d66 ; (cwin_put_string.s4 + 0)
0de3 : a5 12 __ LDA P5 ; (ok + 0)
0de5 : d0 09 __ BNE $0df0 ; (screen_result.s7 + 0)
.s5:
0de7 : e6 0f __ INC P2 
0de9 : a9 0e __ LDA #$0e
0deb : a0 4d __ LDY #$4d
0ded : 4c f8 0d JMP $0df8 ; (screen_result.s6 + 0)
.s7:
0df0 : a9 05 __ LDA #$05
0df2 : 85 0f __ STA P2 
0df4 : a9 0e __ LDA #$0e
0df6 : a0 46 __ LDY #$46
.s6:
0df8 : 84 0d __ STY P0 
0dfa : 85 0e __ STA P1 
0dfc : 20 66 0d JSR $0d66 ; (cwin_put_string.s4 + 0)
0dff : a5 12 __ LDA P5 ; (ok + 0)
0e01 : f0 04 __ BEQ $0e07 ; (screen_result.s8 + 0)
.s9:
0e03 : a9 03 __ LDA #$03
0e05 : d0 02 __ BNE $0e09 ; (screen_result.s10 + 0)
.s8:
0e07 : a9 07 __ LDA #$07
.s10:
0e09 : 85 0f __ STA P2 
0e0b : 20 5e 0d JSR $0d5e ; (cwin_put_string@proxy + 0)
0e0e : a5 13 __ LDA P6 ; (detail + 0)
0e10 : 85 0d __ STA P0 
0e12 : a5 14 __ LDA P7 ; (detail + 1)
0e14 : 85 0e __ STA P1 
0e16 : 20 66 0d JSR $0d66 ; (cwin_put_string.s4 + 0)
--------------------------------------------------------------------
cwin_cursor_newline: ; cwin_cursor_newline(struct CharWin*)->void
;  44, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
0e19 : ad 1b 17 LDA $171b ; (cw.cy + 0)
0e1c : 18 __ __ CLC
0e1d : 69 01 __ ADC #$01
0e1f : a8 __ __ TAY
0e20 : a9 00 __ LDA #$00
0e22 : 8d 1a 17 STA $171a ; (cw.cx + 0)
0e25 : 2a __ __ ROL
0e26 : d0 08 __ BNE $0e30 ; (cwin_cursor_newline.s3 + 0)
.s6:
0e28 : cc 19 17 CPY $1719 ; (cw.wy + 0)
0e2b : b0 03 __ BCS $0e30 ; (cwin_cursor_newline.s3 + 0)
.s5:
0e2d : ee 1b 17 INC $171b ; (cw.cy + 0)
.s3:
0e30 : 60 __ __ RTS
--------------------------------------------------------------------
uii_detect: ; uii_detect()->u8
; 167, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
0e31 : ad 1d df LDA $df1d 
0e34 : c9 c9 __ CMP #$c9
0e36 : d0 0b __ BNE $0e43 ; (uii_detect.s5 + 0)
.s6:
0e38 : ad 1c df LDA $df1c 
0e3b : 09 04 __ ORA #$04
0e3d : 8d 1c df STA $df1c 
0e40 : a9 01 __ LDA #$01
0e42 : 60 __ __ RTS
.s5:
0e43 : a9 00 __ LDA #$00
.s3:
0e45 : 60 __ __ RTS
--------------------------------------------------------------------
0e46 : __ __ __ BYT 5b 20 6f 6b 20 5d 00                            : [ ok ].
--------------------------------------------------------------------
0e4d : __ __ __ BYT 5b 66 41 49 4c 5d 00                            : [fAIL].
--------------------------------------------------------------------
0e54 : __ __ __ BYT 20 20 00                                        :   .
--------------------------------------------------------------------
0e57 : __ __ __ BYT 20 3a 20 00                                     :  : .
--------------------------------------------------------------------
0e5b : __ __ __ BYT 75 63 69 20 20 00                               : uci  .
--------------------------------------------------------------------
0e61 : __ __ __ BYT 6e 4f 54 20 44 45 54 45 43 54 45 44 00          : nOT DETECTED.
--------------------------------------------------------------------
screen_error_exit: ; screen_error_exit(const u8*,const u8*)->void
;  32, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
0e6e : a9 02 __ LDA #$02
0e70 : 85 0f __ STA P2 
0e72 : 20 19 0e JSR $0e19 ; (cwin_cursor_newline.s4 + 0)
0e75 : 20 b5 16 JSR $16b5 ; (cwin_put_string@proxy + 0)
0e78 : 20 19 0e JSR $0e19 ; (cwin_cursor_newline.s4 + 0)
0e7b : a5 13 __ LDA P6 ; (hint + 1)
0e7d : 05 12 __ ORA P5 ; (hint + 0)
0e7f : f0 23 __ BEQ $0ea4 ; (screen_error_exit.s5 + 0)
.s6:
0e81 : a0 00 __ LDY #$00
0e83 : b1 12 __ LDA (P5),y ; (hint + 0)
0e85 : f0 1d __ BEQ $0ea4 ; (screen_error_exit.s5 + 0)
.s7:
0e87 : a9 07 __ LDA #$07
0e89 : 85 0f __ STA P2 
0e8b : a9 0e __ LDA #$0e
0e8d : 85 0e __ STA P1 
0e8f : a9 c3 __ LDA #$c3
0e91 : 85 0d __ STA P0 
0e93 : 20 66 0d JSR $0d66 ; (cwin_put_string.s4 + 0)
0e96 : a5 12 __ LDA P5 ; (hint + 0)
0e98 : 85 0d __ STA P0 
0e9a : a5 13 __ LDA P6 ; (hint + 1)
0e9c : 85 0e __ STA P1 
0e9e : 20 66 0d JSR $0d66 ; (cwin_put_string.s4 + 0)
0ea1 : 20 19 0e JSR $0e19 ; (cwin_cursor_newline.s4 + 0)
.s5:
0ea4 : 20 99 16 JSR $1699 ; (cwin_cursor_newline@proxy + 0)
0ea7 : a9 c9 __ LDA #$c9
0ea9 : 85 0d __ STA P0 
0eab : a9 0e __ LDA #$0e
0ead : 85 0e __ STA P1 
0eaf : 20 66 0d JSR $0d66 ; (cwin_put_string.s4 + 0)
0eb2 : 20 19 0e JSR $0e19 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
cwin_getch: ; cwin_getch()->void
; 147, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
0eb5 : 20 e4 ff JSR $ffe4 
0eb8 : c9 00 __ CMP #$00
0eba : f0 f9 __ BEQ $0eb5 ; (cwin_getch.s4 + 0)
0ebc : 85 1b __ STA ACCU + 0 
0ebe : a9 00 __ LDA #$00
0ec0 : 85 1c __ STA ACCU + 1 
.s3:
0ec2 : 60 __ __ RTS
--------------------------------------------------------------------
0ec3 : __ __ __ BYT 20 20 2d 3e 20 00                               :   -> .
--------------------------------------------------------------------
0ec9 : __ __ __ BYT 70 52 45 53 53 20 41 20 4b 45 59 20 2d 20 45 58 : pRESS A KEY - EX
0ed9 : __ __ __ BYT 49 54 20 54 4f 20 62 61 73 69 63 2e 00          : IT TO basic..
--------------------------------------------------------------------
uci_to_upper@proxy: ; uci_to_upper@proxy
0ee6 : a9 bd __ LDA #$bd
0ee8 : 85 0d __ STA P0 
0eea : a9 9f __ LDA #$9f
0eec : 85 0e __ STA P1 
0eee : 4c 29 10 JMP $1029 ; (uci_to_upper.s4 + 0)
--------------------------------------------------------------------
0ef1 : __ __ __ BYT 75 63 69 20 6f 4b 00                            : uci oK.
--------------------------------------------------------------------
0ef8 : __ __ __ BYT 72 65 75 20 20 00                               : reu  .
--------------------------------------------------------------------
0efe : __ __ __ BYT 56 00                                           : V.
--------------------------------------------------------------------
0f00 : __ __ __ BYT 6e 4f 20 75 4c 54 49 4d 41 54 45 20 63 4f 4d 4d : nO uLTIMATE cOMM
0f10 : __ __ __ BYT 41 4e 44 20 69 4e 54 45 52 46 41 43 45 20 46 4f : AND iNTERFACE FO
0f20 : __ __ __ BYT 55 4e 44 2e 00                                  : UND..
--------------------------------------------------------------------
0f25 : __ __ __ BYT 66 32 20 3e 20 75 63 69 20 73 45 54 54 49 4e 47 : f2 > uci sETTING
0f35 : __ __ __ BYT 53 20 3e 20 65 4e 41 42 4c 45 00                : S > eNABLE.
--------------------------------------------------------------------
uii_sendcommand: ; uii_sendcommand(u8*,u16)->void
; 173, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
0f40 : ad fc 12 LDA $12fc ; (uii_target + 0)
0f43 : a0 00 __ LDY #$00
0f45 : 91 0d __ STA (P0),y ; (bytes + 0)
.l5:
0f47 : ad 1c df LDA $df1c 
0f4a : 29 20 __ AND #$20
0f4c : d0 f9 __ BNE $0f47 ; (uii_sendcommand.l5 + 0)
.s6:
0f4e : ad 1c df LDA $df1c 
0f51 : 29 10 __ AND #$10
0f53 : d0 f2 __ BNE $0f47 ; (uii_sendcommand.l5 + 0)
.s7:
0f55 : c4 0f __ CPY P2 ; (count + 0)
0f57 : b0 0a __ BCS $0f63 ; (uii_sendcommand.s8 + 0)
.l12:
0f59 : b1 0d __ LDA (P0),y ; (bytes + 0)
0f5b : 8d 1d df STA $df1d 
0f5e : c8 __ __ INY
0f5f : c4 0f __ CPY P2 ; (count + 0)
0f61 : 90 f6 __ BCC $0f59 ; (uii_sendcommand.l12 + 0)
.s8:
0f63 : ad 1c df LDA $df1c 
0f66 : 09 01 __ ORA #$01
0f68 : 8d 1c df STA $df1c 
0f6b : ad 1c df LDA $df1c 
0f6e : 29 04 __ AND #$04
0f70 : f0 0a __ BEQ $0f7c ; (uii_sendcommand.l9 + 0)
.s11:
0f72 : ad 1c df LDA $df1c 
0f75 : 09 08 __ ORA #$08
0f77 : 8d 1c df STA $df1c 
0f7a : b0 cb __ BCS $0f47 ; (uii_sendcommand.l5 + 0)
.l9:
0f7c : ad 1c df LDA $df1c 
0f7f : 29 20 __ AND #$20
0f81 : d0 07 __ BNE $0f8a ; (uii_sendcommand.s3 + 0)
.s10:
0f83 : ad 1c df LDA $df1c 
0f86 : 29 10 __ AND #$10
0f88 : d0 f2 __ BNE $0f7c ; (uii_sendcommand.l9 + 0)
.s3:
0f8a : 60 __ __ RTS
--------------------------------------------------------------------
uii_readdata: ; uii_readdata()->void
; 179, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
0f8b : a9 00 __ LDA #$00
0f8d : 8d 22 17 STA $1722 ; (uii_data[0] + 0)
0f90 : a2 22 __ LDX #$22
0f92 : 86 1b __ STX ACCU + 0 
0f94 : a8 __ __ TAY
0f95 : f0 0d __ BEQ $0fa4 ; (uii_readdata.l5 + 0)
.s8:
0f97 : ad 1e df LDA $df1e 
0f9a : 91 1b __ STA (ACCU + 0),y 
0f9c : 98 __ __ TYA
0f9d : 18 __ __ CLC
0f9e : 69 01 __ ADC #$01
0fa0 : a8 __ __ TAY
0fa1 : 8a __ __ TXA
0fa2 : 69 00 __ ADC #$00
.l5:
0fa4 : aa __ __ TAX
0fa5 : 18 __ __ CLC
0fa6 : 69 17 __ ADC #$17
0fa8 : 85 1c __ STA ACCU + 1 
0faa : 2c 1c df BIT $df1c 
0fad : 10 07 __ BPL $0fb6 ; (uii_readdata.s6 + 0)
.s7:
0faf : e0 02 __ CPX #$02
0fb1 : d0 e4 __ BNE $0f97 ; (uii_readdata.s8 + 0)
.s9:
0fb3 : 98 __ __ TYA
0fb4 : d0 e1 __ BNE $0f97 ; (uii_readdata.s8 + 0)
.s6:
0fb6 : a9 00 __ LDA #$00
0fb8 : 91 1b __ STA (ACCU + 0),y 
.s3:
0fba : 60 __ __ RTS
--------------------------------------------------------------------
uii_readstatus: ; uii_readstatus()->void
; 180, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
0fbb : a9 00 __ LDA #$00
0fbd : 8d 23 19 STA $1923 ; (uii_status[0] + 0)
0fc0 : a2 23 __ LDX #$23
0fc2 : 86 1b __ STX ACCU + 0 
0fc4 : a8 __ __ TAY
0fc5 : f0 0d __ BEQ $0fd4 ; (uii_readstatus.l5 + 0)
.s8:
0fc7 : ad 1f df LDA $df1f 
0fca : 91 1b __ STA (ACCU + 0),y 
0fcc : 98 __ __ TYA
0fcd : 18 __ __ CLC
0fce : 69 01 __ ADC #$01
0fd0 : a8 __ __ TAY
0fd1 : 8a __ __ TXA
0fd2 : 69 00 __ ADC #$00
.l5:
0fd4 : aa __ __ TAX
0fd5 : 18 __ __ CLC
0fd6 : 69 19 __ ADC #$19
0fd8 : 85 1c __ STA ACCU + 1 
0fda : ad 1c df LDA $df1c 
0fdd : 29 40 __ AND #$40
0fdf : f0 07 __ BEQ $0fe8 ; (uii_readstatus.s6 + 0)
.s7:
0fe1 : e0 01 __ CPX #$01
0fe3 : d0 e2 __ BNE $0fc7 ; (uii_readstatus.s8 + 0)
.s9:
0fe5 : 98 __ __ TYA
0fe6 : d0 df __ BNE $0fc7 ; (uii_readstatus.s8 + 0)
.s6:
0fe8 : 91 1b __ STA (ACCU + 0),y 
.s3:
0fea : 60 __ __ RTS
--------------------------------------------------------------------
uii_get_hwinfo: ; uii_get_hwinfo(u8)->void
;  50, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
0feb : a9 00 __ LDA #$00
0fed : 85 10 __ STA P3 
0fef : 8d fd 9f STA $9ffd ; (cmd[0] + 0)
0ff2 : 8d ff 9f STA $9fff ; (cmd[0] + 2)
0ff5 : a9 03 __ LDA #$03
0ff7 : 85 0f __ STA P2 
0ff9 : a9 04 __ LDA #$04
0ffb : 8d fc 12 STA $12fc ; (uii_target + 0)
0ffe : a9 28 __ LDA #$28
1000 : 8d fe 9f STA $9ffe ; (cmd[0] + 1)
1003 : a9 00 __ LDA #$00
1005 : 8d ff 9f STA $9fff ; (cmd[0] + 2)
1008 : a9 fd __ LDA #$fd
100a : 85 0d __ STA P0 
100c : a9 9f __ LDA #$9f
100e : 85 0e __ STA P1 
1010 : 20 40 0f JSR $0f40 ; (uii_sendcommand.s4 + 0)
1013 : 20 8b 0f JSR $0f8b ; (uii_readdata.s4 + 0)
1016 : 20 bb 0f JSR $0fbb ; (uii_readstatus.s4 + 0)
--------------------------------------------------------------------
uii_accept: ; uii_accept()->void
; 174, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
1019 : ad 1c df LDA $df1c 
101c : 09 02 __ ORA #$02
101e : 8d 1c df STA $df1c 
.l5:
1021 : ad 1c df LDA $df1c 
1024 : 29 02 __ AND #$02
1026 : d0 f9 __ BNE $1021 ; (uii_accept.l5 + 0)
.s3:
1028 : 60 __ __ RTS
--------------------------------------------------------------------
uci_to_upper: ; uci_to_upper(u8*,u8)->u8
;  50, "/home/xahmol/git/UltimateDemo2026/src/main.c"
.s4:
1029 : a2 00 __ LDX #$00
102b : a0 00 __ LDY #$00
102d : ad 22 17 LDA $1722 ; (uii_data[0] + 0)
1030 : f0 1f __ BEQ $1051 ; (uci_to_upper.s6 + 0)
.l8:
1032 : c9 20 __ CMP #$20
1034 : 90 0d __ BCC $1043 ; (uci_to_upper.s9 + 0)
.s10:
1036 : a9 7e __ LDA #$7e
1038 : dd 22 17 CMP $1722,x ; (uii_data[0] + 0)
103b : 90 06 __ BCC $1043 ; (uci_to_upper.s9 + 0)
.s11:
103d : bd 22 17 LDA $1722,x ; (uii_data[0] + 0)
1040 : 91 0d __ STA (P0),y ; (dst + 0)
1042 : c8 __ __ INY
.s9:
1043 : e8 __ __ INX
1044 : e0 7f __ CPX #$7f
1046 : b0 09 __ BCS $1051 ; (uci_to_upper.s6 + 0)
.s5:
1048 : c0 18 __ CPY #$18
104a : b0 05 __ BCS $1051 ; (uci_to_upper.s6 + 0)
.s7:
104c : bd 22 17 LDA $1722,x ; (uii_data[0] + 0)
104f : d0 e1 __ BNE $1032 ; (uci_to_upper.l8 + 0)
.s6:
1051 : a9 00 __ LDA #$00
1053 : 91 0d __ STA (P0),y ; (dst + 0)
.s3:
1055 : 98 __ __ TYA
1056 : 60 __ __ RTS
--------------------------------------------------------------------
1057 : __ __ __ BYT 20 20 74 59 50 45 20 20 3a 20 00                :   tYPE  : .
--------------------------------------------------------------------
1062 : __ __ __ BYT 63 48 45 43 4b 49 4e 47 20 72 65 75 2e 2e 2e 00 : cHECKING reu....
--------------------------------------------------------------------
detect_reu: ; detect_reu()->u8
;  33, "/home/xahmol/git/UltimateDemo2026/src/detect.h"
.s4:
1072 : a9 00 __ LDA #$00
1074 : 8d ff 9f STA $9fff ; (c + 0)
1077 : a9 ff __ LDA #$ff
1079 : 8d 02 df STA $df02 
107c : a9 9f __ LDA #$9f
107e : 8d 03 df STA $df03 
1081 : a9 00 __ LDA #$00
1083 : 8d 04 df STA $df04 
1086 : 8d 05 df STA $df05 
1089 : 8d 06 df STA $df06 
108c : a2 01 __ LDX #$01
108e : 8e 07 df STX $df07 
1091 : 8d 08 df STA $df08 
1094 : 8d 0a df STA $df0a 
1097 : a2 90 __ LDX #$90
1099 : 8e 01 df STX $df01 
109c : a2 fe __ LDX #$fe
109e : 8e 02 df STX $df02 
10a1 : a2 9f __ LDX #$9f
10a3 : 8e 03 df STX $df03 
10a6 : 8d 04 df STA $df04 
10a9 : 8d 05 df STA $df05 
10ac : 8d 06 df STA $df06 
10af : a2 01 __ LDX #$01
10b1 : 8e 07 df STX $df07 
10b4 : 8d 08 df STA $df08 
10b7 : 8d 0a df STA $df0a 
10ba : a9 91 __ LDA #$91
10bc : 8d 01 df STA $df01 
10bf : ad fe 9f LDA $9ffe ; (d + 0)
10c2 : d0 52 __ BNE $1116 ; (detect_reu.s6 + 0)
.s5:
10c4 : a2 47 __ LDX #$47
10c6 : 8e ff 9f STX $9fff ; (c + 0)
10c9 : a2 ff __ LDX #$ff
10cb : 8e 02 df STX $df02 
10ce : a2 9f __ LDX #$9f
10d0 : 8e 03 df STX $df03 
10d3 : 8d 04 df STA $df04 
10d6 : 8d 05 df STA $df05 
10d9 : 8d 06 df STA $df06 
10dc : a2 01 __ LDX #$01
10de : 8e 07 df STX $df07 
10e1 : 8d 08 df STA $df08 
10e4 : 8d 0a df STA $df0a 
10e7 : a2 90 __ LDX #$90
10e9 : 8e 01 df STX $df01 
10ec : a2 fe __ LDX #$fe
10ee : 8e 02 df STX $df02 
10f1 : a2 9f __ LDX #$9f
10f3 : 8e 03 df STX $df03 
10f6 : 8d 04 df STA $df04 
10f9 : 8d 05 df STA $df05 
10fc : 8d 06 df STA $df06 
10ff : a2 01 __ LDX #$01
1101 : 8e 07 df STX $df07 
1104 : 8d 08 df STA $df08 
1107 : 8d 0a df STA $df0a 
110a : a9 91 __ LDA #$91
110c : 8d 01 df STA $df01 
110f : ad fe 9f LDA $9ffe ; (d + 0)
1112 : c9 47 __ CMP #$47
1114 : f0 03 __ BEQ $1119 ; (detect_reu.s7 + 0)
.s6:
1116 : a9 00 __ LDA #$00
.s3:
1118 : 60 __ __ RTS
.s7:
1119 : a0 01 __ LDY #$01
.l8:
111b : 8d ff 9f STA $9fff ; (c + 0)
111e : a9 ff __ LDA #$ff
1120 : 8d 02 df STA $df02 
1123 : a9 9f __ LDA #$9f
1125 : 8d 03 df STA $df03 
1128 : a9 00 __ LDA #$00
112a : 8d 04 df STA $df04 
112d : 8d 05 df STA $df05 
1130 : 8c 06 df STY $df06 
1133 : 8e 07 df STX $df07 
1136 : 8d 08 df STA $df08 
1139 : 8d 0a df STA $df0a 
113c : a2 90 __ LDX #$90
113e : 8e 01 df STX $df01 
1141 : 8d ff 9f STA $9fff ; (c + 0)
1144 : a2 ff __ LDX #$ff
1146 : 8e 02 df STX $df02 
1149 : a2 9f __ LDX #$9f
114b : 8e 03 df STX $df03 
114e : 8d 04 df STA $df04 
1151 : 8d 05 df STA $df05 
1154 : 8d 06 df STA $df06 
1157 : a2 01 __ LDX #$01
1159 : 8e 07 df STX $df07 
115c : 8d 08 df STA $df08 
115f : 8d 0a df STA $df0a 
1162 : a2 90 __ LDX #$90
1164 : 8e 01 df STX $df01 
1167 : a2 fe __ LDX #$fe
1169 : 8e 02 df STX $df02 
116c : a2 9f __ LDX #$9f
116e : 8e 03 df STX $df03 
1171 : 8d 04 df STA $df04 
1174 : 8d 05 df STA $df05 
1177 : 8c 06 df STY $df06 
117a : a2 01 __ LDX #$01
117c : 8e 07 df STX $df07 
117f : 8d 08 df STA $df08 
1182 : 8d 0a df STA $df0a 
1185 : a9 91 __ LDA #$91
1187 : 8d 01 df STA $df01 
118a : ad fe 9f LDA $9ffe ; (d + 0)
118d : c9 47 __ CMP #$47
118f : d0 06 __ BNE $1197 ; (detect_reu.s11 + 0)
.s9:
1191 : c8 __ __ INY
1192 : d0 87 __ BNE $111b ; (detect_reu.l8 + 0)
.s10:
1194 : a9 10 __ LDA #$10
1196 : 60 __ __ RTS
.s11:
1197 : 98 __ __ TYA
1198 : 4a __ __ LSR
1199 : 4a __ __ LSR
119a : 4a __ __ LSR
119b : 4a __ __ LSR
119c : 60 __ __ RTS
--------------------------------------------------------------------
119d : __ __ __ BYT 74 4f 4f 20 53 4d 41 4c 4c 20 28 4e 45 45 44 20 : tOO SMALL (NEED 
11ad : __ __ __ BYT 31 36 20 6d 62 29 00                            : 16 mb).
--------------------------------------------------------------------
11b4 : __ __ __ BYT 31 36 20 6d 62 20 72 65 75 20 49 53 20 52 45 51 : 16 mb reu IS REQ
11c4 : __ __ __ BYT 55 49 52 45 44 2e 00                            : UIRED..
--------------------------------------------------------------------
11cb : __ __ __ BYT 66 32 20 3e 20 63 36 34 20 53 45 54 54 49 4e 47 : f2 > c64 SETTING
11db : __ __ __ BYT 53 20 3e 20 72 65 75 20 3e 20 31 36 20 6d 62 00 : S > reu > 16 mb.
--------------------------------------------------------------------
11eb : __ __ __ BYT 31 36 20 6d 62 00                               : 16 mb.
--------------------------------------------------------------------
11f1 : __ __ __ BYT 74 55 52 42 4f 00                               : tURBO.
--------------------------------------------------------------------
11f7 : __ __ __ BYT 36 34 20 6d 68 5a 00                            : 64 mhZ.
--------------------------------------------------------------------
11fe : __ __ __ BYT 20 00                                           :  .
--------------------------------------------------------------------
1200 : __ __ __ BYT 63 48 45 43 4b 49 4e 47 20 54 55 52 42 4f 20 4d : cHECKING TURBO M
1210 : __ __ __ BYT 4f 44 45 2e 2e 2e 00                            : ODE....
--------------------------------------------------------------------
turbo_detect: ; turbo_detect()->u8
;  92, "/home/xahmol/git/UltimateDemo2026/include/turbo.h"
.s4:
1217 : ad 30 d0 LDA $d030 
121a : ae 31 d0 LDX $d031 
121d : e8 __ __ INX
121e : f0 1c __ BEQ $123c ; (turbo_detect.s6 + 0)
.s5:
1220 : a9 0f __ LDA #$0f
1222 : 20 54 12 JSR $1254 ; (turbo_set.s4 + 0)
1225 : 20 6f 12 JSR $126f ; (benchmark_delay.s4 + 0)
1228 : 20 6f 12 JSR $126f ; (benchmark_delay.s4 + 0)
122b : a5 1b __ LDA ACCU + 0 
122d : 85 44 __ STA T0 + 0 
122f : a5 1c __ LDA ACCU + 1 
1231 : 85 45 __ STA T0 + 1 
1233 : a9 00 __ LDA #$00
1235 : 20 54 12 JSR $1254 ; (turbo_set.s4 + 0)
1238 : a5 45 __ LDA T0 + 1 
123a : f0 05 __ BEQ $1241 ; (turbo_detect.s9 + 0)
.s6:
123c : a9 00 __ LDA #$00
.s3:
123e : 85 1b __ STA ACCU + 0 
1240 : 60 __ __ RTS
.s9:
1241 : a5 44 __ LDA T0 + 0 
1243 : c9 02 __ CMP #$02
1245 : b0 04 __ BCS $124b ; (turbo_detect.s7 + 0)
.s8:
1247 : a9 02 __ LDA #$02
1249 : 90 f3 __ BCC $123e ; (turbo_detect.s3 + 0)
.s7:
124b : c9 46 __ CMP #$46
124d : a9 00 __ LDA #$00
124f : 2a __ __ ROL
1250 : 49 01 __ EOR #$01
1252 : 90 ea __ BCC $123e ; (turbo_detect.s3 + 0)
--------------------------------------------------------------------
turbo_set: ; turbo_set(u8)->void
; 106, "/home/xahmol/git/UltimateDemo2026/include/turbo.h"
.s4:
1254 : a8 __ __ TAY
1255 : d0 0c __ BNE $1263 ; (turbo_set.s6 + 0)
.s5:
1257 : 8d 31 d0 STA $d031 
125a : ad 30 d0 LDA $d030 
125d : 29 fe __ AND #$fe
125f : 8d 30 d0 STA $d030 
1262 : 60 __ __ RTS
.s6:
1263 : ad 30 d0 LDA $d030 
1266 : 09 01 __ ORA #$01
1268 : 8d 30 d0 STA $d030 
126b : 8c 31 d0 STY $d031 
.s3:
126e : 60 __ __ RTS
--------------------------------------------------------------------
benchmark_delay: ; benchmark_delay(i16)->i16
;  87, "/home/xahmol/git/UltimateDemo2026/include/turbo.h"
.s4:
126f : 78 __ __ SEI
1270 : a9 00 __ LDA #$00
1272 : 8d 09 dc STA $dc09 
1275 : 8d 08 dc STA $dc08 
1278 : 8d fe 9f STA $9ffe ; (i + 0)
127b : f0 0e __ BEQ $128b ; (benchmark_delay.l5 + 0)
.s9:
127d : ad fe 9f LDA $9ffe ; (i + 0)
1280 : 18 __ __ CLC
1281 : 69 01 __ ADC #$01
1283 : 8d fe 9f STA $9ffe ; (i + 0)
1286 : ad ff 9f LDA $9fff ; (i + 1)
1289 : 69 00 __ ADC #$00
.l5:
128b : 8d ff 9f STA $9fff ; (i + 1)
128e : ac fe 9f LDY $9ffe ; (i + 0)
1291 : ad ff 9f LDA $9fff ; (i + 1)
1294 : 49 80 __ EOR #$80
1296 : c9 83 __ CMP #$83
1298 : d0 02 __ BNE $129c ; (benchmark_delay.s14 + 0)
.s13:
129a : c0 e8 __ CPY #$e8
.s14:
129c : b0 07 __ BCS $12a5 ; (benchmark_delay.s6 + 0)
.s7:
129e : a9 00 __ LDA #$00
12a0 : 8d fc 9f STA $9ffc ; (j + 0)
12a3 : 90 28 __ BCC $12cd ; (benchmark_delay.l8 + 0)
.s6:
12a5 : 58 __ __ CLI
12a6 : ad 09 dc LDA $dc09 
12a9 : aa __ __ TAX
12aa : 0a __ __ ASL
12ab : 85 1b __ STA ACCU + 0 
12ad : a9 00 __ LDA #$00
12af : 2a __ __ ROL
12b0 : 06 1b __ ASL ACCU + 0 
12b2 : 2a __ __ ROL
12b3 : a8 __ __ TAY
12b4 : 8a __ __ TXA
12b5 : 65 1b __ ADC ACCU + 0 
12b7 : 85 43 __ STA T0 + 0 
12b9 : 98 __ __ TYA
12ba : 69 00 __ ADC #$00
12bc : 06 43 __ ASL T0 + 0 
12be : 2a __ __ ROL
12bf : a8 __ __ TAY
12c0 : ad 08 dc LDA $dc08 
12c3 : 65 43 __ ADC T0 + 0 
12c5 : 85 1b __ STA ACCU + 0 
12c7 : 90 01 __ BCC $12ca ; (benchmark_delay.s16 + 0)
.s15:
12c9 : c8 __ __ INY
.s16:
12ca : 84 1c __ STY ACCU + 1 
.s3:
12cc : 60 __ __ RTS
.l8:
12cd : 8d fd 9f STA $9ffd ; (j + 1)
12d0 : ac fc 9f LDY $9ffc ; (j + 0)
12d3 : ad fd 9f LDA $9ffd ; (j + 1)
12d6 : 30 06 __ BMI $12de ; (benchmark_delay.s10 + 0)
.s12:
12d8 : d0 a3 __ BNE $127d ; (benchmark_delay.s9 + 0)
.s11:
12da : c0 c8 __ CPY #$c8
12dc : b0 9f __ BCS $127d ; (benchmark_delay.s9 + 0)
.s10:
12de : ea __ __ NOP
12df : ad fc 9f LDA $9ffc ; (j + 0)
12e2 : 18 __ __ CLC
12e3 : 69 01 __ ADC #$01
12e5 : 8d fc 9f STA $9ffc ; (j + 0)
12e8 : ad fd 9f LDA $9ffd ; (j + 1)
12eb : 69 00 __ ADC #$00
12ed : 4c cd 12 JMP $12cd ; (benchmark_delay.l8 + 0)
--------------------------------------------------------------------
turbo_get: ; turbo_get()->u8
; 124, "/home/xahmol/git/UltimateDemo2026/include/turbo.h"
.s3:
12f0 : ad 31 d0 LDA $d031 
12f3 : 60 __ __ RTS
--------------------------------------------------------------------
12f4 : __ __ __ BYT 34 38 20 6d 68 5a 00                            : 48 mhZ.
--------------------------------------------------------------------
spentry:
12fb : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
uii_target:
12fc : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
1300 : __ __ __ BYT 6e 4f 54 20 44 45 54 45 43 54 45 44 20 28 31 20 : nOT DETECTED (1 
1310 : __ __ __ BYT 6d 68 5a 29 00                                  : mhZ).
--------------------------------------------------------------------
1315 : __ __ __ BYT 74 55 52 42 4f 20 4d 4f 44 45 20 52 45 51 55 49 : tURBO MODE REQUI
1325 : __ __ __ BYT 52 45 44 20 2d 20 63 70 75 20 41 54 20 31 20 6d : RED - cpu AT 1 m
1335 : __ __ __ BYT 68 5a 2e 00                                     : hZ..
--------------------------------------------------------------------
1339 : __ __ __ BYT 65 4e 41 42 4c 45 20 54 55 52 42 4f 20 49 4e 20 : eNABLE TURBO IN 
1349 : __ __ __ BYT 75 4c 54 49 4d 41 54 45 20 46 49 52 4d 57 41 52 : uLTIMATE FIRMWAR
1359 : __ __ __ BYT 45 00                                           : E.
--------------------------------------------------------------------
135b : __ __ __ BYT 34 30 20 6d 68 5a 00                            : 40 mhZ.
--------------------------------------------------------------------
1362 : __ __ __ BYT 33 36 20 6d 68 5a 00                            : 36 mhZ.
--------------------------------------------------------------------
1369 : __ __ __ BYT 33 32 20 6d 68 5a 00                            : 32 mhZ.
--------------------------------------------------------------------
1370 : __ __ __ BYT 32 38 20 6d 68 5a 00                            : 28 mhZ.
--------------------------------------------------------------------
1377 : __ __ __ BYT 32 34 20 6d 68 5a 00                            : 24 mhZ.
--------------------------------------------------------------------
137e : __ __ __ BYT 32 30 20 6d 68 5a 00                            : 20 mhZ.
--------------------------------------------------------------------
1385 : __ __ __ BYT 31 36 20 6d 68 5a 00                            : 16 mhZ.
--------------------------------------------------------------------
138c : __ __ __ BYT 31 32 20 6d 68 5a 00                            : 12 mhZ.
--------------------------------------------------------------------
1393 : __ __ __ BYT 38 20 6d 68 5a 00                               : 8 mhZ.
--------------------------------------------------------------------
1399 : __ __ __ BYT 63 48 45 43 4b 49 4e 47 20 75 4c 54 49 4d 41 54 : cHECKING uLTIMAT
13a9 : __ __ __ BYT 45 20 61 55 44 49 4f 2e 2e 2e 00                : E aUDIO....
--------------------------------------------------------------------
audio_detect: ; audio_detect()->u8
;  91, "/home/xahmol/git/UltimateDemo2026/include/audio.h"
.s4:
13b4 : 78 __ __ SEI
13b5 : a2 00 __ LDX #$00
.l19:
13b7 : bd 08 17 LDA $1708,x ; (audio_ch_base[0] + 0)
13ba : 85 43 __ STA T0 + 0 
13bc : bd 09 17 LDA $1709,x ; (audio_ch_base[0] + 1)
13bf : 85 44 __ STA T0 + 1 
13c1 : a9 00 __ LDA #$00
13c3 : a8 __ __ TAY
13c4 : 91 43 __ STA (T0 + 0),y 
13c6 : a9 ff __ LDA #$ff
13c8 : a0 1f __ LDY #$1f
13ca : 91 43 __ STA (T0 + 0),y 
13cc : e8 __ __ INX
13cd : e8 __ __ INX
13ce : e0 0e __ CPX #$0e
13d0 : d0 e5 __ BNE $13b7 ; (audio_detect.l19 + 0)
.s5:
13d2 : a2 00 __ LDX #$00
.l6:
13d4 : ac 20 df LDY $df20 
13d7 : c8 __ __ INY
13d8 : f0 61 __ BEQ $143b ; (audio_detect.s18 + 0)
.s7:
13da : ca __ __ DEX
13db : d0 f7 __ BNE $13d4 ; (audio_detect.l6 + 0)
.s8:
13dd : 8d 3f df STA $df3f 
13e0 : 8e 21 df STX $df21 
13e3 : 8e 24 df STX $df24 
13e6 : 8e 25 df STX $df25 
13e9 : 8e 26 df STX $df26 
13ec : 8e 27 df STX $df27 
13ef : a9 01 __ LDA #$01
13f1 : 8d 29 df STA $df29 
13f4 : 8e 2a df STX $df2a 
13f7 : 8e 2b df STX $df2b 
13fa : a9 32 __ LDA #$32
13fc : 8d 2e df STA $df2e 
13ff : 8e 2f df STX $df2f 
1402 : 86 45 __ STX T1 + 0 
1404 : a9 05 __ LDA #$05
1406 : 8d 20 df STA $df20 
1409 : 8a __ __ TXA
140a : a8 __ __ TAY
.l9:
140b : aa __ __ TAX
.l10:
140c : ad 20 df LDA $df20 
140f : 29 01 __ AND #$01
1411 : d0 23 __ BNE $1436 ; (audio_detect.s17 + 0)
.s11:
1413 : ca __ __ DEX
1414 : d0 f6 __ BNE $140c ; (audio_detect.l10 + 0)
.s12:
1416 : c8 __ __ INY
1417 : c0 10 __ CPY #$10
1419 : a5 45 __ LDA T1 + 0 
141b : b0 10 __ BCS $142d ; (audio_detect.s13 + 0)
.s16:
141d : f0 ec __ BEQ $140b ; (audio_detect.l9 + 0)
.s15:
141f : a9 ff __ LDA #$ff
1421 : 8d 3f df STA $df3f 
1424 : a9 00 __ LDA #$00
1426 : 8d 20 df STA $df20 
1429 : 58 __ __ CLI
142a : a9 01 __ LDA #$01
.s3:
142c : 60 __ __ RTS
.s13:
142d : d0 f0 __ BNE $141f ; (audio_detect.s15 + 0)
.s14:
142f : 8d 20 df STA $df20 
1432 : 58 __ __ CLI
.s20:
1433 : a9 00 __ LDA #$00
1435 : 60 __ __ RTS
.s17:
1436 : 85 45 __ STA T1 + 0 
1438 : 4c 16 14 JMP $1416 ; (audio_detect.s12 + 0)
.s18:
143b : 58 __ __ CLI
143c : 4c 33 14 JMP $1433 ; (audio_detect.s20 + 0)
--------------------------------------------------------------------
143f : __ __ __ BYT 61 55 44 49 4f 00                               : aUDIO.
--------------------------------------------------------------------
1445 : __ __ __ BYT 6d 4f 44 55 4c 45 20 4e 4f 54 20 46 4f 55 4e 44 : mODULE NOT FOUND
1455 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1456 : __ __ __ BYT 75 4c 54 49 4d 41 54 45 20 61 55 44 49 4f 20 4d : uLTIMATE aUDIO M
1466 : __ __ __ BYT 4f 44 55 4c 45 20 4e 4f 54 20 44 45 54 45 43 54 : ODULE NOT DETECT
1476 : __ __ __ BYT 45 44 2e 00                                     : ED..
--------------------------------------------------------------------
147a : __ __ __ BYT 66 32 20 3e 20 63 36 34 2f 63 41 52 54 20 53 45 : f2 > c64/cART SE
148a : __ __ __ BYT 54 54 49 4e 47 53 20 3e 20 61 55 44 49 4f 00    : TTINGS > aUDIO.
--------------------------------------------------------------------
fmt_dec: ; fmt_dec(u8*,u8)->void
;  34, "/home/xahmol/git/UltimateDemo2026/src/main.c"
.s4:
1499 : a5 0f __ LDA P2 ; (val + 0)
149b : c9 64 __ CMP #$64
149d : b0 04 __ BCS $14a3 ; (fmt_dec.s7 + 0)
.s5:
149f : a0 00 __ LDY #$00
14a1 : 90 1d __ BCC $14c0 ; (fmt_dec.s6 + 0)
.s7:
14a3 : 85 1b __ STA ACCU + 0 
14a5 : a9 00 __ LDA #$00
14a7 : 85 1c __ STA ACCU + 1 
14a9 : 85 04 __ STA WORK + 1 
14ab : a9 64 __ LDA #$64
14ad : 85 03 __ STA WORK + 0 
14af : 20 fe 15 JSR $15fe ; (divmod + 0)
14b2 : 18 __ __ CLC
14b3 : a5 1b __ LDA ACCU + 0 
14b5 : 69 30 __ ADC #$30
14b7 : a0 00 __ LDY #$00
14b9 : 91 0d __ STA (P0),y ; (buf + 0)
14bb : a5 05 __ LDA WORK + 2 
14bd : 85 0f __ STA P2 ; (val + 0)
14bf : c8 __ __ INY
.s6:
14c0 : 84 43 __ STY T1 + 0 
14c2 : a9 00 __ LDA #$00
14c4 : c8 __ __ INY
14c5 : c8 __ __ INY
14c6 : 91 0d __ STA (P0),y ; (buf + 0)
14c8 : 85 1c __ STA ACCU + 1 
14ca : 85 04 __ STA WORK + 1 
14cc : a5 0f __ LDA P2 ; (val + 0)
14ce : 85 1b __ STA ACCU + 0 
14d0 : a9 0a __ LDA #$0a
14d2 : 85 03 __ STA WORK + 0 
14d4 : 20 fe 15 JSR $15fe ; (divmod + 0)
14d7 : 18 __ __ CLC
14d8 : a5 1b __ LDA ACCU + 0 
14da : 69 30 __ ADC #$30
14dc : a4 43 __ LDY T1 + 0 
14de : 91 0d __ STA (P0),y ; (buf + 0)
14e0 : 18 __ __ CLC
14e1 : a5 05 __ LDA WORK + 2 
14e3 : 69 30 __ ADC #$30
14e5 : c8 __ __ INY
14e6 : 91 0d __ STA (P0),y ; (buf + 0)
.s3:
14e8 : 60 __ __ RTS
--------------------------------------------------------------------
strcat: ; strcat(u8*,const u8*)->void
;  14, "/home/xahmol/oscar64/include/string.h"
.s4:
14e9 : a5 0d __ LDA P0 ; (dst + 0)
14eb : 85 1b __ STA ACCU + 0 
14ed : a5 0e __ LDA P1 ; (dst + 1)
14ef : 85 1c __ STA ACCU + 1 
14f1 : a0 00 __ LDY #$00
14f3 : b1 0d __ LDA (P0),y ; (dst + 0)
14f5 : f0 0f __ BEQ $1506 ; (strcat.s5 + 0)
.s6:
14f7 : 84 1b __ STY ACCU + 0 
14f9 : a4 0d __ LDY P0 ; (dst + 0)
.l7:
14fb : c8 __ __ INY
14fc : d0 02 __ BNE $1500 ; (strcat.s11 + 0)
.s10:
14fe : e6 1c __ INC ACCU + 1 
.s11:
1500 : b1 1b __ LDA (ACCU + 0),y 
1502 : d0 f7 __ BNE $14fb ; (strcat.l7 + 0)
.s8:
1504 : 84 1b __ STY ACCU + 0 
.s5:
1506 : a8 __ __ TAY
.l9:
1507 : b1 0f __ LDA (P2),y ; (src + 0)
1509 : 91 1b __ STA (ACCU + 0),y 
150b : aa __ __ TAX
150c : e6 0f __ INC P2 ; (src + 0)
150e : d0 02 __ BNE $1512 ; (strcat.s13 + 0)
.s12:
1510 : e6 10 __ INC P3 ; (src + 1)
.s13:
1512 : e6 1b __ INC ACCU + 0 
1514 : d0 02 __ BNE $1518 ; (strcat.s15 + 0)
.s14:
1516 : e6 1c __ INC ACCU + 1 
.s15:
1518 : 8a __ __ TXA
1519 : d0 ec __ BNE $1507 ; (strcat.l9 + 0)
.s3:
151b : 60 __ __ RTS
--------------------------------------------------------------------
151c : __ __ __ BYT 61 4c 4c 20 48 41 52 44 57 41 52 45 20 44 45 54 : aLL HARDWARE DET
152c : __ __ __ BYT 45 43 54 45 44 20 53 55 43 43 45 53 53 46 55 4c : ECTED SUCCESSFUL
153c : __ __ __ BYT 4c 59 21 00                                     : LY!.
--------------------------------------------------------------------
1540 : __ __ __ BYT 20 20 73 59 53 54 45 4d 20 53 55 4d 4d 41 52 59 :   sYSTEM SUMMARY
1550 : __ __ __ BYT 3a 00                                           : :.
--------------------------------------------------------------------
1552 : __ __ __ BYT 20 20 20 20 72 65 75 20 20 20 3a 20 31 36 20 6d :     reu   : 16 m
1562 : __ __ __ BYT 62 20 73 64 72 61 6d 00                         : b sdram.
--------------------------------------------------------------------
156a : __ __ __ BYT 20 20 20 20 74 55 52 42 4f 20 3a 20 36 34 20 6d :     tURBO : 64 m
157a : __ __ __ BYT 68 5a 00                                        : hZ.
--------------------------------------------------------------------
157d : __ __ __ BYT 20 20 20 20 74 55 52 42 4f 20 3a 20 34 38 20 6d :     tURBO : 48 m
158d : __ __ __ BYT 68 5a 00                                        : hZ.
--------------------------------------------------------------------
1590 : __ __ __ BYT 20 20 20 20 61 55 44 49 4f 20 3a 20 4d 4f 44 55 :     aUDIO : MODU
15a0 : __ __ __ BYT 4c 45 20 56 45 52 53 49 4f 4e 20 00             : LE VERSION .
--------------------------------------------------------------------
screen_wait_key: ; screen_wait_key(const u8*)->void
;  37, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
15ac : a9 15 __ LDA #$15
15ae : 85 0e __ STA P1 
15b0 : a9 d3 __ LDA #$d3
15b2 : 85 0d __ STA P0 
15b4 : 20 a7 16 JSR $16a7 ; (cwin_put_string@proxy + 0)
15b7 : a9 fe __ LDA #$fe
15b9 : 85 0d __ STA P0 
15bb : a9 11 __ LDA #$11
15bd : 85 0e __ STA P1 
15bf : 20 66 0d JSR $0d66 ; (cwin_put_string.s4 + 0)
15c2 : a9 15 __ LDA #$15
15c4 : 85 0e __ STA P1 
15c6 : a9 e3 __ LDA #$e3
15c8 : 85 0d __ STA P0 
15ca : 20 ae 16 JSR $16ae ; (cwin_put_string@proxy + 0)
15cd : 20 19 0e JSR $0e19 ; (cwin_cursor_newline.s4 + 0)
15d0 : 4c b5 0e JMP $0eb5 ; (cwin_getch.s4 + 0)
--------------------------------------------------------------------
15d3 : __ __ __ BYT 68 41 52 44 57 41 52 45 20 52 45 41 44 59 2e 00 : hARDWARE READY..
--------------------------------------------------------------------
15e3 : __ __ __ BYT 70 52 45 53 53 20 41 4e 59 20 4b 45 59 20 54 4f : pRESS ANY KEY TO
15f3 : __ __ __ BYT 20 43 4f 4e 54 49 4e 55 45 2e 00                :  CONTINUE..
--------------------------------------------------------------------
divmod: ; divmod
15fe : a5 1c __ LDA ACCU + 1 
1600 : d0 31 __ BNE $1633 ; (divmod + 53)
1602 : a5 04 __ LDA WORK + 1 
1604 : d0 1e __ BNE $1624 ; (divmod + 38)
1606 : 85 06 __ STA WORK + 3 
1608 : a2 04 __ LDX #$04
160a : 06 1b __ ASL ACCU + 0 
160c : 2a __ __ ROL
160d : c5 03 __ CMP WORK + 0 
160f : 90 02 __ BCC $1613 ; (divmod + 21)
1611 : e5 03 __ SBC WORK + 0 
1613 : 26 1b __ ROL ACCU + 0 
1615 : 2a __ __ ROL
1616 : c5 03 __ CMP WORK + 0 
1618 : 90 02 __ BCC $161c ; (divmod + 30)
161a : e5 03 __ SBC WORK + 0 
161c : 26 1b __ ROL ACCU + 0 
161e : ca __ __ DEX
161f : d0 eb __ BNE $160c ; (divmod + 14)
1621 : 85 05 __ STA WORK + 2 
1623 : 60 __ __ RTS
1624 : a5 1b __ LDA ACCU + 0 
1626 : 85 05 __ STA WORK + 2 
1628 : a5 1c __ LDA ACCU + 1 
162a : 85 06 __ STA WORK + 3 
162c : a9 00 __ LDA #$00
162e : 85 1b __ STA ACCU + 0 
1630 : 85 1c __ STA ACCU + 1 
1632 : 60 __ __ RTS
1633 : a5 04 __ LDA WORK + 1 
1635 : d0 1f __ BNE $1656 ; (divmod + 88)
1637 : a5 03 __ LDA WORK + 0 
1639 : 30 1b __ BMI $1656 ; (divmod + 88)
163b : a9 00 __ LDA #$00
163d : 85 06 __ STA WORK + 3 
163f : a2 10 __ LDX #$10
1641 : 06 1b __ ASL ACCU + 0 
1643 : 26 1c __ ROL ACCU + 1 
1645 : 2a __ __ ROL
1646 : c5 03 __ CMP WORK + 0 
1648 : 90 02 __ BCC $164c ; (divmod + 78)
164a : e5 03 __ SBC WORK + 0 
164c : 26 1b __ ROL ACCU + 0 
164e : 26 1c __ ROL ACCU + 1 
1650 : ca __ __ DEX
1651 : d0 f2 __ BNE $1645 ; (divmod + 71)
1653 : 85 05 __ STA WORK + 2 
1655 : 60 __ __ RTS
1656 : a9 00 __ LDA #$00
1658 : 85 05 __ STA WORK + 2 
165a : 85 06 __ STA WORK + 3 
165c : 84 02 __ STY $02 
165e : a0 10 __ LDY #$10
1660 : 18 __ __ CLC
1661 : 26 1b __ ROL ACCU + 0 
1663 : 26 1c __ ROL ACCU + 1 
1665 : 26 05 __ ROL WORK + 2 
1667 : 26 06 __ ROL WORK + 3 
1669 : 38 __ __ SEC
166a : a5 05 __ LDA WORK + 2 
166c : e5 03 __ SBC WORK + 0 
166e : aa __ __ TAX
166f : a5 06 __ LDA WORK + 3 
1671 : e5 04 __ SBC WORK + 1 
1673 : 90 04 __ BCC $1679 ; (divmod + 123)
1675 : 86 05 __ STX WORK + 2 
1677 : 85 06 __ STA WORK + 3 
1679 : 88 __ __ DEY
167a : d0 e5 __ BNE $1661 ; (divmod + 99)
167c : 26 1b __ ROL ACCU + 0 
167e : 26 1c __ ROL ACCU + 1 
1680 : a4 02 __ LDY $02 
1682 : 60 __ __ RTS
--------------------------------------------------------------------
screen_result@proxy: ; screen_result@proxy
1683 : a9 3f __ LDA #$3f
1685 : 85 10 __ STA P3 
1687 : a9 14 __ LDA #$14
1689 : 85 11 __ STA P4 
168b : 4c ce 0d JMP $0dce ; (screen_result.s4 + 0)
--------------------------------------------------------------------
screen_result@proxy: ; screen_result@proxy
168e : a9 f8 __ LDA #$f8
1690 : 85 10 __ STA P3 
1692 : a9 0e __ LDA #$0e
1694 : 85 11 __ STA P4 
1696 : 4c ce 0d JMP $0dce ; (screen_result.s4 + 0)
--------------------------------------------------------------------
cwin_cursor_newline@proxy: ; cwin_cursor_newline@proxy
1699 : a9 01 __ LDA #$01
169b : 85 0f __ STA P2 
169d : 4c 19 0e JMP $0e19 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
cwin_put_string@proxy: ; cwin_put_string@proxy
16a0 : a9 03 __ LDA #$03
16a2 : 85 0f __ STA P2 
16a4 : 4c 66 0d JMP $0d66 ; (cwin_put_string.s4 + 0)
--------------------------------------------------------------------
cwin_put_string@proxy: ; cwin_put_string@proxy
16a7 : a9 0f __ LDA #$0f
16a9 : 85 0f __ STA P2 
16ab : 4c 66 0d JMP $0d66 ; (cwin_put_string.s4 + 0)
--------------------------------------------------------------------
cwin_put_string@proxy: ; cwin_put_string@proxy
16ae : a9 01 __ LDA #$01
16b0 : 85 0f __ STA P2 
16b2 : 4c 66 0d JMP $0d66 ; (cwin_put_string.s4 + 0)
--------------------------------------------------------------------
cwin_put_string@proxy: ; cwin_put_string@proxy
16b5 : a5 10 __ LDA P3 
16b7 : 85 0d __ STA P0 
16b9 : a5 11 __ LDA P4 
16bb : 85 0e __ STA P1 
16bd : 4c 66 0d JMP $0d66 ; (cwin_put_string.s4 + 0)
--------------------------------------------------------------------
mul40:
16c0 : __ __ __ BYT 00 00 28 00 50 00 78 00 a0 00 c8 00 f0 00 18 01 : ..(.P.x.........
16d0 : __ __ __ BYT 40 01 68 01 90 01 b8 01 e0 01 08 02 30 02 58 02 : @.h.........0.X.
16e0 : __ __ __ BYT 80 02 a8 02 d0 02 f8 02 20 03 48 03 70 03 98 03 : ........ .H.p...
16f0 : __ __ __ BYT c0 03                                           : ..
--------------------------------------------------------------------
p2smap:
16f2 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
p2smap:
1700 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
audio_ch_base:
1708 : __ __ __ BYT 20 df 40 df 60 df 80 df a0 df c0 df e0 df       :  .@.`.........
--------------------------------------------------------------------
cw:
1716 : __ __ __ BSS	12
--------------------------------------------------------------------
uii_data:
1722 : __ __ __ BSS	513
--------------------------------------------------------------------
uii_status:
1923 : __ __ __ BSS	257
