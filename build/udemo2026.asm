; Compiled with 1.32.271
--------------------------------------------------------------------
zp_angle1:
00f7 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zp_angle2:
00f8 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zp_spd:
00f9 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zp_dirty:
00fa : __ __ __ BYT 00                                              : .
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
080e : 8e ff 10 STX $10ff ; (spentry + 0)
0811 : a2 93 __ LDX #$93
0813 : a0 c8 __ LDY #$c8
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 a7 __ CPX #$a7
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 a0 __ CPY #$a0
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 fb __ CPX #$fb
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 0a __ LDA #$0a
083d : 85 23 __ STA SP + 0 
083f : a9 bf __ LDA #$bf
0841 : 85 24 __ STA SP + 1 
0843 : 20 00 0a JSR $0a00 ; (main.s1 + 0)
0846 : a9 4c __ LDA #$4c
0848 : 85 54 __ STA $54 
084a : a9 00 __ LDA #$00
084c : 85 13 __ STA P6 
084e : a9 19 __ LDA #$19
0850 : 85 16 __ STA P9 
0852 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
; 100, "/home/xahmol/git/UltimateDemo2026/src/main.c"
.s1:
0a00 : a2 03 __ LDX #$03
0a02 : b5 53 __ LDA T0 + 0,x 
0a04 : 9d 0c bf STA $bf0c,x ; (main@stack + 0)
0a07 : ca __ __ DEX
0a08 : 10 f8 __ BPL $0a02 ; (main.s1 + 2)
.s4:
0a0a : a9 60 __ LDA #$60
0a0c : 8d 10 03 STA $0310 
0a0f : a9 10 __ LDA #$10
0a11 : 8d 02 a0 STA $a002 ; (BLIT_CODE[0] + 2)
0a14 : a9 03 __ LDA #$03
0a16 : 8d 03 a0 STA $a003 ; (BLIT_CODE[0] + 3)
0a19 : a9 36 __ LDA #$36
0a1b : 85 01 __ STA $01 
0a1d : a9 7f __ LDA #$7f
0a1f : 8d 0d dc STA $dc0d 
0a22 : a9 25 __ LDA #$25
0a24 : 8d 04 dc STA $dc04 
0a27 : a9 4d __ LDA #$4d
0a29 : 8d 05 dc STA $dc05 
0a2c : a9 81 __ LDA #$81
0a2e : 8d 0d dc STA $dc0d 
0a31 : a9 01 __ LDA #$01
0a33 : 8d 0e dc STA $dc0e 
0a36 : a9 d8 __ LDA #$d8
0a38 : 8d 18 03 STA $0318 
0a3b : a9 0e __ LDA #$0e
0a3d : 8d 19 03 STA $0319 
0a40 : a9 00 __ LDA #$00
0a42 : 85 16 __ STA P9 
0a44 : a9 11 __ LDA #$11
0a46 : 85 17 __ STA P10 
0a48 : 20 e3 0e JSR $0ee3 ; (screen_init.s4 + 0)
0a4b : a9 aa __ LDA #$aa
0a4d : 85 10 __ STA P3 
0a4f : a9 11 __ LDA #$11
0a51 : 85 11 __ STA P4 
0a53 : 20 ee 10 JSR $10ee ; (screen_info.s4 + 0)
0a56 : a9 00 __ LDA #$00
0a58 : 8d 09 dc STA $dc09 
0a5b : 8d 08 dc STA $dc08 
0a5e : 85 56 __ STA T3 + 0 
.l5:
0a60 : 20 cb 11 JSR $11cb ; (uii_detect.s4 + 0)
0a63 : aa __ __ TAX
0a64 : d0 07 __ BNE $0a6d ; (main.s7 + 0)
.s6:
0a66 : ad 09 dc LDA $dc09 
0a69 : c9 0a __ CMP #$0a
0a6b : 90 f3 __ BCC $0a60 ; (main.l5 + 0)
.s7:
0a6d : 20 cb 11 JSR $11cb ; (uii_detect.s4 + 0)
0a70 : aa __ __ TAX
0a71 : d0 3b __ BNE $0aae ; (main.s9 + 0)
.s8:
0a73 : 85 12 __ STA P5 
0a75 : a9 48 __ LDA #$48
0a77 : 85 10 __ STA P3 
0a79 : a9 12 __ LDA #$12
0a7b : 85 14 __ STA P7 
0a7d : a9 12 __ LDA #$12
0a7f : 85 11 __ STA P4 
0a81 : a9 4e __ LDA #$4e
0a83 : 85 13 __ STA P6 
0a85 : 20 ec 11 JSR $11ec ; (screen_result.s4 + 0)
0a88 : a9 00 __ LDA #$00
0a8a : 85 12 __ STA P5 
0a8c : a9 13 __ LDA #$13
0a8e : 85 13 __ STA P6 
0a90 : a9 12 __ LDA #$12
0a92 : a2 e2 __ LDX #$e2
.s72:
0a94 : 86 14 __ STX P7 
0a96 : 85 15 __ STA P8 
0a98 : 20 5b 12 JSR $125b ; (screen_error_exit.s4 + 0)
0a9b : a9 01 __ LDA #$01
0a9d : 85 1b __ STA ACCU + 0 
0a9f : a9 00 __ LDA #$00
.s3:
0aa1 : 85 1c __ STA ACCU + 1 
0aa3 : a2 03 __ LDX #$03
0aa5 : bd 0c bf LDA $bf0c,x ; (main@stack + 0)
0aa8 : 95 53 __ STA T0 + 0,x 
0aaa : ca __ __ DEX
0aab : 10 f8 __ BPL $0aa5 ; (main.s3 + 4)
0aad : 60 __ __ RTS
.s9:
0aae : a9 01 __ LDA #$01
0ab0 : 8d ff 12 STA $12ff ; (uii_target + 0)
0ab3 : 8d 15 bf STA $bf15 ; (cmd[0] + 1)
0ab6 : a9 02 __ LDA #$02
0ab8 : 85 0f __ STA P2 
0aba : a9 00 __ LDA #$00
0abc : 85 10 __ STA P3 
0abe : 8d 14 bf STA $bf14 ; (cmd[0] + 0)
0ac1 : a9 14 __ LDA #$14
0ac3 : 85 0d __ STA P0 
0ac5 : a9 bf __ LDA #$bf
0ac7 : 85 0e __ STA P1 
0ac9 : 20 25 13 JSR $1325 ; (uii_sendcommand.s4 + 0)
0acc : 20 a0 13 JSR $13a0 ; (uii_readdata.s4 + 0)
0acf : 20 d0 13 JSR $13d0 ; (uii_readstatus.s4 + 0)
0ad2 : 20 2e 14 JSR $142e ; (uii_accept.s4 + 0)
0ad5 : ad c9 95 LDA $95c9 ; (uii_status[0] + 0)
0ad8 : c9 30 __ CMP #$30
0ada : d0 12 __ BNE $0aee ; (main.s10 + 0)
.s69:
0adc : ad ca 95 LDA $95ca ; (uii_status[0] + 1)
0adf : c9 30 __ CMP #$30
0ae1 : d0 0b __ BNE $0aee ; (main.s10 + 0)
.s70:
0ae3 : ad c8 93 LDA $93c8 ; (uii_data[0] + 0)
0ae6 : f0 06 __ BEQ $0aee ; (main.s10 + 0)
.s71:
0ae8 : 20 3e 14 JSR $143e ; (uci_to_upper@proxy + 0)
0aeb : 4c f9 0a JMP $0af9 ; (main.s12 + 0)
.s10:
0aee : a2 ff __ LDX #$ff
.l11:
0af0 : e8 __ __ INX
0af1 : bd 78 14 LDA $1478,x 
0af4 : 9d 93 bf STA $bf93,x ; (detail[0] + 0)
0af7 : d0 f7 __ BNE $0af0 ; (main.l11 + 0)
.s12:
0af9 : a9 48 __ LDA #$48
0afb : 85 10 __ STA P3 
0afd : a9 12 __ LDA #$12
0aff : 85 11 __ STA P4 
0b01 : 20 e0 11 JSR $11e0 ; (screen_result@proxy + 0)
0b04 : 20 00 14 JSR $1400 ; (uii_get_hwinfo.s4 + 0)
0b07 : ad c9 95 LDA $95c9 ; (uii_status[0] + 0)
0b0a : c9 30 __ CMP #$30
0b0c : d0 2e __ BNE $0b3c ; (main.s13 + 0)
.s66:
0b0e : ad ca 95 LDA $95ca ; (uii_status[0] + 1)
0b11 : c9 30 __ CMP #$30
0b13 : d0 27 __ BNE $0b3c ; (main.s13 + 0)
.s67:
0b15 : 20 3e 14 JSR $143e ; (uci_to_upper@proxy + 0)
0b18 : aa __ __ TAX
0b19 : f0 21 __ BEQ $0b3c ; (main.s13 + 0)
.s68:
0b1b : a9 01 __ LDA #$01
0b1d : 85 0f __ STA P2 
0b1f : a9 14 __ LDA #$14
0b21 : 85 0e __ STA P1 
0b23 : a9 7f __ LDA #$7f
0b25 : 85 0d __ STA P0 
0b27 : 20 4a 11 JSR $114a ; (cwin_put_string.s4 + 0)
0b2a : a9 93 __ LDA #$93
0b2c : 85 0d __ STA P0 
0b2e : a9 03 __ LDA #$03
0b30 : 85 0f __ STA P2 
0b32 : a9 bf __ LDA #$bf
0b34 : 85 0e __ STA P1 
0b36 : 20 4a 11 JSR $114a ; (cwin_put_string.s4 + 0)
0b39 : 20 2a 11 JSR $112a ; (cwin_cursor_newline.s4 + 0)
.s13:
0b3c : a9 8a __ LDA #$8a
0b3e : 85 10 __ STA P3 
0b40 : a9 14 __ LDA #$14
0b42 : 85 11 __ STA P4 
0b44 : 20 ee 10 JSR $10ee ; (screen_info.s4 + 0)
0b47 : 20 9a 14 JSR $149a ; (detect_reu.s4 + 0)
0b4a : c9 10 __ CMP #$10
0b4c : b0 03 __ BCS $0b51 ; (main.s14 + 0)
0b4e : 4c b1 0e JMP $0eb1 ; (main.s62 + 0)
.s14:
0b51 : a9 15 __ LDA #$15
0b53 : 85 14 __ STA P7 
0b55 : a9 f9 __ LDA #$f9
0b57 : 85 13 __ STA P6 
0b59 : 20 3a 7c JSR $7c3a ; (screen_result@proxy + 0)
0b5c : a9 20 __ LDA #$20
0b5e : 85 10 __ STA P3 
0b60 : a9 16 __ LDA #$16
0b62 : 85 11 __ STA P4 
0b64 : 20 ee 10 JSR $10ee ; (screen_info.s4 + 0)
0b67 : 20 37 16 JSR $1637 ; (turbo_detect.s4 + 0)
0b6a : a9 0f __ LDA #$0f
0b6c : 85 10 __ STA P3 
0b6e : a9 17 __ LDA #$17
0b70 : 85 11 __ STA P4 
0b72 : a5 1b __ LDA ACCU + 0 
0b74 : d0 1b __ BNE $0b91 ; (main.s36 + 0)
.s15:
0b76 : c6 12 __ DEC P5 
0b78 : a9 15 __ LDA #$15
0b7a : 85 13 __ STA P6 
0b7c : a9 17 __ LDA #$17
0b7e : 85 14 __ STA P7 
0b80 : 20 ec 11 JSR $11ec ; (screen_result.s4 + 0)
0b83 : a9 2a __ LDA #$2a
0b85 : 85 10 __ STA P3 
0b87 : a9 17 __ LDA #$17
0b89 : 85 11 __ STA P4 
0b8b : 20 aa 12 JSR $12aa ; (screen_hint.s4 + 0)
0b8e : 4c 32 0c JMP $0c32 ; (main.s16 + 0)
.s36:
0b91 : c9 02 __ CMP #$02
0b93 : d0 14 __ BNE $0ba9 ; (main.s37 + 0)
.s61:
0b95 : a9 17 __ LDA #$17
0b97 : a2 4c __ LDX #$4c
.s38:
0b99 : 86 53 __ STX T0 + 0 
0b9b : 85 54 __ STA T0 + 1 
0b9d : a9 93 __ LDA #$93
0b9f : 85 13 __ STA P6 
0ba1 : a9 bf __ LDA #$bf
0ba3 : 85 14 __ STA P7 
0ba5 : a0 ff __ LDY #$ff
0ba7 : d0 7e __ BNE $0c27 ; (main.l39 + 0)
.s37:
0ba9 : c9 01 __ CMP #$01
0bab : f0 07 __ BEQ $0bb4 ; (main.s41 + 0)
.s73:
0bad : a9 17 __ LDA #$17
0baf : a2 0f __ LDX #$0f
0bb1 : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s41:
0bb4 : 20 53 17 JSR $1753 ; (turbo_get.s3 + 0)
0bb7 : 29 0f __ AND #$0f
0bb9 : c9 0e __ CMP #$0e
0bbb : d0 07 __ BNE $0bc4 ; (main.s42 + 0)
.s60:
0bbd : a9 17 __ LDA #$17
0bbf : a2 57 __ LDX #$57
0bc1 : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s42:
0bc4 : c9 0d __ CMP #$0d
0bc6 : d0 07 __ BNE $0bcf ; (main.s43 + 0)
.s59:
0bc8 : a9 17 __ LDA #$17
0bca : a2 5e __ LDX #$5e
0bcc : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s43:
0bcf : c9 0c __ CMP #$0c
0bd1 : d0 07 __ BNE $0bda ; (main.s44 + 0)
.s58:
0bd3 : a9 17 __ LDA #$17
0bd5 : a2 65 __ LDX #$65
0bd7 : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s44:
0bda : c9 0b __ CMP #$0b
0bdc : d0 07 __ BNE $0be5 ; (main.s45 + 0)
.s57:
0bde : a9 17 __ LDA #$17
0be0 : a2 6c __ LDX #$6c
0be2 : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s45:
0be5 : c9 0a __ CMP #$0a
0be7 : d0 07 __ BNE $0bf0 ; (main.s46 + 0)
.s56:
0be9 : a9 17 __ LDA #$17
0beb : a2 73 __ LDX #$73
0bed : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s46:
0bf0 : c9 09 __ CMP #$09
0bf2 : d0 07 __ BNE $0bfb ; (main.s47 + 0)
.s55:
0bf4 : a9 17 __ LDA #$17
0bf6 : a2 7a __ LDX #$7a
0bf8 : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s47:
0bfb : c9 08 __ CMP #$08
0bfd : d0 07 __ BNE $0c06 ; (main.s48 + 0)
.s54:
0bff : a9 17 __ LDA #$17
0c01 : a2 81 __ LDX #$81
0c03 : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s48:
0c06 : c9 07 __ CMP #$07
0c08 : d0 07 __ BNE $0c11 ; (main.s49 + 0)
.s53:
0c0a : a9 17 __ LDA #$17
0c0c : a2 88 __ LDX #$88
0c0e : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s49:
0c11 : c9 06 __ CMP #$06
0c13 : d0 07 __ BNE $0c1c ; (main.s50 + 0)
.s52:
0c15 : a9 17 __ LDA #$17
0c17 : a2 8f __ LDX #$8f
0c19 : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s50:
0c1c : c9 05 __ CMP #$05
0c1e : d0 8d __ BNE $0bad ; (main.s73 + 0)
.s51:
0c20 : a9 17 __ LDA #$17
0c22 : a2 96 __ LDX #$96
0c24 : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.l39:
0c27 : c8 __ __ INY
0c28 : b1 53 __ LDA (T0 + 0),y 
0c2a : 99 93 bf STA $bf93,y ; (detail[0] + 0)
0c2d : d0 f8 __ BNE $0c27 ; (main.l39 + 0)
.s40:
0c2f : 20 ec 11 JSR $11ec ; (screen_result.s4 + 0)
.s16:
0c32 : a9 9c __ LDA #$9c
0c34 : 85 10 __ STA P3 
0c36 : a9 17 __ LDA #$17
0c38 : 85 11 __ STA P4 
0c3a : 20 ee 10 JSR $10ee ; (screen_info.s4 + 0)
0c3d : 20 b7 17 JSR $17b7 ; (audio_detect.s4 + 0)
0c40 : aa __ __ TAX
0c41 : f0 03 __ BEQ $0c46 ; (main.s17 + 0)
0c43 : 4c b6 0d JMP $0db6 ; (main.s26 + 0)
.s17:
0c46 : a9 30 __ LDA #$30
0c48 : 85 10 __ STA P3 
0c4a : a9 18 __ LDA #$18
0c4c : 85 11 __ STA P4 
0c4e : a9 36 __ LDA #$36
0c50 : 85 13 __ STA P6 
0c52 : a9 18 __ LDA #$18
0c54 : 85 14 __ STA P7 
0c56 : a9 18 __ LDA #$18
0c58 : a2 47 __ LDX #$47
.s18:
0c5a : 86 53 __ STX T0 + 0 
0c5c : 85 54 __ STA T0 + 1 
0c5e : a9 00 __ LDA #$00
0c60 : 85 12 __ STA P5 
0c62 : 20 ec 11 JSR $11ec ; (screen_result.s4 + 0)
0c65 : a5 53 __ LDA T0 + 0 
0c67 : 85 10 __ STA P3 
0c69 : a5 54 __ LDA T0 + 1 
0c6b : 85 11 __ STA P4 
0c6d : 20 aa 12 JSR $12aa ; (screen_hint.s4 + 0)
.s19:
0c70 : 20 2a 11 JSR $112a ; (cwin_cursor_newline.s4 + 0)
0c73 : a9 2b __ LDA #$2b
0c75 : 85 10 __ STA P3 
0c77 : a9 20 __ LDA #$20
0c79 : 85 11 __ STA P4 
0c7b : 20 ee 10 JSR $10ee ; (screen_info.s4 + 0)
0c7e : 20 2a 11 JSR $112a ; (cwin_cursor_newline.s4 + 0)
0c81 : a9 af __ LDA #$af
0c83 : 85 10 __ STA P3 
0c85 : a9 20 __ LDA #$20
0c87 : 85 11 __ STA P4 
0c89 : 20 3f 20 JSR $203f ; (screen_wait_key.s4 + 0)
0c8c : 20 d0 20 JSR $20d0 ; (gears_run.s1 + 0)
0c8f : a5 56 __ LDA T3 + 0 
0c91 : f0 03 __ BEQ $0c96 ; (main.s20 + 0)
.s25:
0c93 : 20 8f 41 JSR $418f ; (modplay_start.s4 + 0)
.s20:
0c96 : 20 04 51 JSR $5104 ; (mandel_run.s4 + 0)
0c99 : 20 c2 55 JSR $55c2 ; (ball_run.s1 + 0)
0c9c : 20 d2 63 JSR $63d2 ; (vectors_run.s1 + 0)
0c9f : 20 d2 68 JSR $68d2 ; (plasma_run.s1 + 0)
0ca2 : 20 8d 6b JSR $6b8d ; (tunnel_run.s1 + 0)
0ca5 : a9 10 __ LDA #$10
0ca7 : 8d 02 a0 STA $a002 ; (BLIT_CODE[0] + 2)
0caa : a9 03 __ LDA #$03
0cac : 8d 03 a0 STA $a003 ; (BLIT_CODE[0] + 3)
0caf : 20 1c 71 JSR $711c ; (scroller_run.s4 + 0)
0cb2 : a5 56 __ LDA T3 + 0 
0cb4 : f0 03 __ BEQ $0cb9 ; (main.s21 + 0)
.s24:
0cb6 : 20 32 76 JSR $7632 ; (modplay_stop.s4 + 0)
.s21:
0cb9 : a9 00 __ LDA #$00
0cbb : 85 c6 __ STA $c6 
0cbd : 20 73 16 JSR $1673 ; (turbo_set.s4 + 0)
0cc0 : a9 6b __ LDA #$6b
0cc2 : 85 16 __ STA P9 
0cc4 : a9 76 __ LDA #$76
0cc6 : 85 17 __ STA P10 
0cc8 : 20 e3 0e JSR $0ee3 ; (screen_init.s4 + 0)
0ccb : 20 2a 11 JSR $112a ; (cwin_cursor_newline.s4 + 0)
0cce : a9 80 __ LDA #$80
0cd0 : 85 10 __ STA P3 
0cd2 : a9 76 __ LDA #$76
0cd4 : 85 11 __ STA P4 
0cd6 : 20 ee 10 JSR $10ee ; (screen_info.s4 + 0)
0cd9 : a9 01 __ LDA #$01
0cdb : 85 12 __ STA P5 
0cdd : 20 2a 11 JSR $112a ; (cwin_cursor_newline.s4 + 0)
0ce0 : a9 98 __ LDA #$98
0ce2 : 85 10 __ STA P3 
0ce4 : a9 76 __ LDA #$76
0ce6 : 85 14 __ STA P7 
0ce8 : a9 76 __ LDA #$76
0cea : 85 11 __ STA P4 
0cec : a9 9e __ LDA #$9e
0cee : 85 13 __ STA P6 
0cf0 : 20 ec 11 JSR $11ec ; (screen_result.s4 + 0)
0cf3 : a9 b4 __ LDA #$b4
0cf5 : 85 10 __ STA P3 
0cf7 : a9 76 __ LDA #$76
0cf9 : 85 14 __ STA P7 
0cfb : a9 76 __ LDA #$76
0cfd : 85 11 __ STA P4 
0cff : a9 ba __ LDA #$ba
0d01 : 85 13 __ STA P6 
0d03 : 20 ec 11 JSR $11ec ; (screen_result.s4 + 0)
0d06 : a9 d0 __ LDA #$d0
0d08 : 85 10 __ STA P3 
0d0a : a9 76 __ LDA #$76
0d0c : 85 14 __ STA P7 
0d0e : a9 76 __ LDA #$76
0d10 : 85 11 __ STA P4 
0d12 : a9 d6 __ LDA #$d6
0d14 : 85 13 __ STA P6 
0d16 : 20 ec 11 JSR $11ec ; (screen_result.s4 + 0)
0d19 : a9 e5 __ LDA #$e5
0d1b : 85 10 __ STA P3 
0d1d : a9 76 __ LDA #$76
0d1f : 85 14 __ STA P7 
0d21 : a9 76 __ LDA #$76
0d23 : 85 11 __ STA P4 
0d25 : a9 eb __ LDA #$eb
0d27 : 85 13 __ STA P6 
0d29 : 20 ec 11 JSR $11ec ; (screen_result.s4 + 0)
0d2c : a9 00 __ LDA #$00
0d2e : 85 10 __ STA P3 
0d30 : a9 77 __ LDA #$77
0d32 : 85 14 __ STA P7 
0d34 : a9 77 __ LDA #$77
0d36 : 85 11 __ STA P4 
0d38 : a9 06 __ LDA #$06
0d3a : 85 13 __ STA P6 
0d3c : 20 ec 11 JSR $11ec ; (screen_result.s4 + 0)
0d3f : a9 1a __ LDA #$1a
0d41 : 85 10 __ STA P3 
0d43 : a9 77 __ LDA #$77
0d45 : 85 14 __ STA P7 
0d47 : a9 77 __ LDA #$77
0d49 : 85 11 __ STA P4 
0d4b : a9 20 __ LDA #$20
0d4d : 85 13 __ STA P6 
0d4f : 20 ec 11 JSR $11ec ; (screen_result.s4 + 0)
0d52 : a9 32 __ LDA #$32
0d54 : 85 10 __ STA P3 
0d56 : a9 77 __ LDA #$77
0d58 : 85 14 __ STA P7 
0d5a : a9 77 __ LDA #$77
0d5c : 85 11 __ STA P4 
0d5e : a9 38 __ LDA #$38
0d60 : 85 13 __ STA P6 
0d62 : 20 ec 11 JSR $11ec ; (screen_result.s4 + 0)
0d65 : a5 56 __ LDA T3 + 0 
0d67 : f0 13 __ BEQ $0d7c ; (main.s22 + 0)
.s23:
0d69 : a9 e3 __ LDA #$e3
0d6b : 85 10 __ STA P3 
0d6d : a9 77 __ LDA #$77
0d6f : 85 14 __ STA P7 
0d71 : a9 1f __ LDA #$1f
0d73 : 85 11 __ STA P4 
0d75 : a9 4e __ LDA #$4e
0d77 : 85 13 __ STA P6 
0d79 : 20 ec 11 JSR $11ec ; (screen_result.s4 + 0)
.s22:
0d7c : 20 2a 11 JSR $112a ; (cwin_cursor_newline.s4 + 0)
0d7f : a9 65 __ LDA #$65
0d81 : 85 10 __ STA P3 
0d83 : a9 77 __ LDA #$77
0d85 : 85 11 __ STA P4 
0d87 : 20 ee 10 JSR $10ee ; (screen_info.s4 + 0)
0d8a : a9 82 __ LDA #$82
0d8c : 85 10 __ STA P3 
0d8e : a9 77 __ LDA #$77
0d90 : 85 11 __ STA P4 
0d92 : 20 ee 10 JSR $10ee ; (screen_info.s4 + 0)
0d95 : 20 2a 11 JSR $112a ; (cwin_cursor_newline.s4 + 0)
0d98 : a9 00 __ LDA #$00
0d9a : 85 10 __ STA P3 
0d9c : 85 11 __ STA P4 
0d9e : 20 3f 20 JSR $203f ; (screen_wait_key.s4 + 0)
0da1 : a9 00 __ LDA #$00
0da3 : 85 c6 __ STA $c6 
0da5 : a9 0e __ LDA #$0e
0da7 : 8d 20 d0 STA $d020 
0daa : a9 06 __ LDA #$06
0dac : 8d 21 d0 STA $d021 
0daf : a9 00 __ LDA #$00
0db1 : 85 1b __ STA ACCU + 0 
0db3 : 4c a1 0a JMP $0aa1 ; (main.s3 + 0)
.s26:
0db6 : ad 21 df LDA $df21 
0db9 : 85 55 __ STA T2 + 0 
0dbb : 85 0f __ STA P2 
0dbd : a9 8f __ LDA #$8f
0dbf : 85 0d __ STA P0 
0dc1 : a9 bf __ LDA #$bf
0dc3 : 85 0e __ STA P1 
0dc5 : 20 66 18 JSR $1866 ; (fmt_dec.s4 + 0)
0dc8 : a9 93 __ LDA #$93
0dca : 85 0d __ STA P0 
0dcc : a9 bf __ LDA #$bf
0dce : 85 0e __ STA P1 
0dd0 : a9 8f __ LDA #$8f
0dd2 : 85 0f __ STA P2 
0dd4 : a9 bf __ LDA #$bf
0dd6 : 85 10 __ STA P3 
0dd8 : a2 ff __ LDX #$ff
.l27:
0dda : e8 __ __ INX
0ddb : bd fd 12 LDA $12fd,x 
0dde : 9d 93 bf STA $bf93,x ; (detail[0] + 0)
0de1 : d0 f7 __ BNE $0dda ; (main.l27 + 0)
.s28:
0de3 : 20 b6 18 JSR $18b6 ; (strcat.s4 + 0)
0de6 : a9 18 __ LDA #$18
0de8 : 85 11 __ STA P4 
0dea : a9 30 __ LDA #$30
0dec : 85 10 __ STA P3 
0dee : 20 e0 11 JSR $11e0 ; (screen_result@proxy + 0)
0df1 : a5 55 __ LDA T2 + 0 
0df3 : d0 03 __ BNE $0df8 ; (main.s29 + 0)
0df5 : 4c 70 0c JMP $0c70 ; (main.s19 + 0)
.s29:
0df8 : a9 00 __ LDA #$00
0dfa : 8d 3e bf STA $bf3e ; (media_count + 0)
0dfd : a9 e9 __ LDA #$e9
0dff : 85 10 __ STA P3 
0e01 : a9 18 __ LDA #$18
0e03 : 85 11 __ STA P4 
0e05 : 20 ee 10 JSR $10ee ; (screen_info.s4 + 0)
0e08 : a9 00 __ LDA #$00
0e0a : 85 10 __ STA P3 
0e0c : 8d 12 bf STA $bf12 ; (cmd[0] + 0)
0e0f : a9 02 __ LDA #$02
0e11 : 85 0f __ STA P2 
0e13 : a9 01 __ LDA #$01
0e15 : 8d ff 12 STA $12ff ; (uii_target + 0)
0e18 : a9 17 __ LDA #$17
0e1a : 8d 13 bf STA $bf13 ; (cmd[0] + 1)
0e1d : a9 12 __ LDA #$12
0e1f : 85 0d __ STA P0 
0e21 : a9 bf __ LDA #$bf
0e23 : 85 0e __ STA P1 
0e25 : 20 25 13 JSR $1325 ; (uii_sendcommand.s4 + 0)
0e28 : 20 d0 13 JSR $13d0 ; (uii_readstatus.s4 + 0)
0e2b : 20 2e 14 JSR $142e ; (uii_accept.s4 + 0)
0e2e : 20 fa 18 JSR $18fa ; (modplay_load.s4 + 0)
0e31 : a5 1b __ LDA ACCU + 0 
0e33 : d0 45 __ BNE $0e7a ; (main.s33 + 0)
.s30:
0e35 : a9 3f __ LDA #$3f
0e37 : 85 13 __ STA P6 
0e39 : a9 bf __ LDA #$bf
0e3b : 85 16 __ STA P9 
0e3d : a9 bf __ LDA #$bf
0e3f : 85 14 __ STA P7 
0e41 : a9 3e __ LDA #$3e
0e43 : 85 15 __ STA P8 
0e45 : 20 41 1a JSR $1a41 ; (uii_scan_media.s4 + 0)
0e48 : ad 3e bf LDA $bf3e ; (media_count + 0)
0e4b : 85 15 __ STA P8 
0e4d : a9 16 __ LDA #$16
0e4f : 85 16 __ STA P9 
0e51 : a9 bf __ LDA #$bf
0e53 : 85 17 __ STA P10 
0e55 : 20 38 1c JSR $1c38 ; (uii_find_media_path.s4 + 0)
0e58 : a5 1b __ LDA ACCU + 0 
0e5a : f0 07 __ BEQ $0e63 ; (main.s31 + 0)
.s32:
0e5c : 20 fa 18 JSR $18fa ; (modplay_load.s4 + 0)
0e5f : a5 1b __ LDA ACCU + 0 
0e61 : d0 17 __ BNE $0e7a ; (main.s33 + 0)
.s31:
0e63 : a9 e3 __ LDA #$e3
0e65 : 85 10 __ STA P3 
0e67 : a9 1f __ LDA #$1f
0e69 : 85 11 __ STA P4 
0e6b : a9 00 __ LDA #$00
0e6d : 85 13 __ STA P6 
0e6f : a9 20 __ LDA #$20
0e71 : 85 14 __ STA P7 
0e73 : a9 20 __ LDA #$20
0e75 : a2 0a __ LDX #$0a
0e77 : 4c 5a 0c JMP $0c5a ; (main.s18 + 0)
.s33:
0e7a : 20 1f 1d JSR $1d1f ; (modplay_init.s4 + 0)
0e7d : a9 e3 __ LDA #$e3
0e7f : 85 10 __ STA P3 
0e81 : a9 1f __ LDA #$1f
0e83 : 85 11 __ STA P4 
0e85 : a5 1b __ LDA ACCU + 0 
0e87 : d0 09 __ BNE $0e92 ; (main.s35 + 0)
.s34:
0e89 : 85 12 __ STA P5 
0e8b : a9 1f __ LDA #$1f
0e8d : a2 f1 __ LDX #$f1
0e8f : 4c a7 0e JMP $0ea7 ; (main.s74 + 0)
.s35:
0e92 : a9 01 __ LDA #$01
0e94 : e6 56 __ INC T3 + 0 
0e96 : 85 12 __ STA P5 
0e98 : 8d 4b 9c STA $9c4b ; (modplay.stereo + 0)
0e9b : 8d 4d 9c STA $9c4d ; (modplay.loop_song + 0)
0e9e : a9 a0 __ LDA #$a0
0ea0 : 8d 4a 9c STA $9c4a ; (modplay.master_volume + 0)
0ea3 : a9 1f __ LDA #$1f
0ea5 : a2 e9 __ LDX #$e9
.s74:
0ea7 : 86 13 __ STX P6 
0ea9 : 85 14 __ STA P7 
0eab : 20 ec 11 JSR $11ec ; (screen_result.s4 + 0)
0eae : 4c 70 0c JMP $0c70 ; (main.s19 + 0)
.s62:
0eb1 : a2 00 __ LDX #$00
0eb3 : 86 12 __ STX P5 
0eb5 : aa __ __ TAX
0eb6 : f0 06 __ BEQ $0ebe ; (main.s63 + 0)
.s65:
0eb8 : a9 15 __ LDA #$15
0eba : a2 cb __ LDX #$cb
0ebc : 90 04 __ BCC $0ec2 ; (main.s64 + 0)
.s63:
0ebe : a9 12 __ LDA #$12
0ec0 : a2 4e __ LDX #$4e
.s64:
0ec2 : 86 13 __ STX P6 
0ec4 : 85 14 __ STA P7 
0ec6 : 20 3a 7c JSR $7c3a ; (screen_result@proxy + 0)
0ec9 : a9 e2 __ LDA #$e2
0ecb : 85 12 __ STA P5 
0ecd : a9 15 __ LDA #$15
0ecf : 85 13 __ STA P6 
0ed1 : a9 16 __ LDA #$16
0ed3 : a2 00 __ LDX #$00
0ed5 : 4c 94 0a JMP $0a94 ; (main.s72 + 0)
--------------------------------------------------------------------
nmi_handler: ; nmi_handler()->void
;  95, "/home/xahmol/git/UltimateDemo2026/src/main.c"
.s1:
0ed8 : 48 __ __ PHA
0ed9 : 8a __ __ TXA
0eda : 48 __ __ PHA
0edb : 98 __ __ TYA
0edc : 48 __ __ PHA
.s3:
0edd : 68 __ __ PLA
0ede : a8 __ __ TAY
0edf : 68 __ __ PLA
0ee0 : aa __ __ TAX
0ee1 : 68 __ __ PLA
0ee2 : 40 __ __ RTI
--------------------------------------------------------------------
screen_init: ; screen_init(const u8*)->void
;  13, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
0ee3 : a9 00 __ LDA #$00
0ee5 : 85 0d __ STA P0 
0ee7 : 85 43 __ STA T0 + 0 
0ee9 : 85 0e __ STA P1 
0eeb : 85 10 __ STA P3 
0eed : 20 88 0f JSR $0f88 ; (vic_setmode@proxy + 0)
0ef0 : a9 00 __ LDA #$00
0ef2 : 8d d0 83 STA $83d0 ; (cw.sx + 0)
0ef5 : 8d d1 83 STA $83d1 ; (cw.sy + 0)
0ef8 : 8d d4 83 STA $83d4 ; (cw.cx + 0)
0efb : 8d d5 83 STA $83d5 ; (cw.cy + 0)
0efe : a2 19 __ LDX #$19
0f00 : 8e d3 83 STX $83d3 ; (cw.wy + 0)
0f03 : 8d 20 d0 STA $d020 
0f06 : 8d 21 d0 STA $d021 
0f09 : 8d d8 83 STA $83d8 ; (cw.sp + 0)
0f0c : 8d da 83 STA $83da ; (cw.cp + 0)
0f0f : a9 04 __ LDA #$04
0f11 : 8d d9 83 STA $83d9 ; (cw.sp + 1)
0f14 : 85 44 __ STA T0 + 1 
0f16 : a9 d8 __ LDA #$d8
0f18 : 8d db 83 STA $83db ; (cw.cp + 1)
0f1b : 85 46 __ STA T1 + 1 
0f1d : a2 00 __ LDX #$00
0f1f : 86 45 __ STX T1 + 0 
0f21 : a9 28 __ LDA #$28
0f23 : 8d d2 83 STA $83d2 ; (cw.wx + 0)
.l8:
0f26 : 85 1b __ STA ACCU + 0 
0f28 : a0 00 __ LDY #$00
.l9:
0f2a : a9 20 __ LDA #$20
0f2c : 91 43 __ STA (T0 + 0),y 
0f2e : a9 01 __ LDA #$01
0f30 : 91 45 __ STA (T1 + 0),y 
0f32 : c8 __ __ INY
0f33 : c4 1b __ CPY ACCU + 0 
0f35 : 90 f3 __ BCC $0f2a ; (screen_init.l9 + 0)
.l6:
0f37 : e8 __ __ INX
0f38 : ec d3 83 CPX $83d3 ; (cw.wy + 0)
0f3b : 90 2f __ BCC $0f6c ; (screen_init.s5 + 0)
.s7:
0f3d : a9 00 __ LDA #$00
0f3f : 85 12 __ STA P5 
0f41 : a9 10 __ LDA #$10
0f43 : 85 14 __ STA P7 
0f45 : a9 05 __ LDA #$05
0f47 : 85 15 __ STA P8 
0f49 : a9 dd __ LDA #$dd
0f4b : 85 13 __ STA P6 
0f4d : 20 e2 0f JSR $0fe2 ; (header_line.s4 + 0)
0f50 : e6 12 __ INC P5 
0f52 : a5 16 __ LDA P9 ; (title + 0)
0f54 : 85 13 __ STA P6 
0f56 : a5 17 __ LDA P10 ; (title + 1)
0f58 : 85 14 __ STA P7 
0f5a : a9 0d __ LDA #$0d
0f5c : 85 15 __ STA P8 
0f5e : 20 e2 0f JSR $0fe2 ; (header_line.s4 + 0)
0f61 : a9 00 __ LDA #$00
0f63 : 8d d4 83 STA $83d4 ; (cw.cx + 0)
0f66 : a9 03 __ LDA #$03
0f68 : 8d d5 83 STA $83d5 ; (cw.cy + 0)
.s3:
0f6b : 60 __ __ RTS
.s5:
0f6c : a5 43 __ LDA T0 + 0 
0f6e : 69 28 __ ADC #$28
0f70 : 85 43 __ STA T0 + 0 
0f72 : 90 03 __ BCC $0f77 ; (screen_init.s11 + 0)
.s10:
0f74 : e6 44 __ INC T0 + 1 
0f76 : 18 __ __ CLC
.s11:
0f77 : a5 45 __ LDA T1 + 0 
0f79 : 69 28 __ ADC #$28
0f7b : 85 45 __ STA T1 + 0 
0f7d : 90 02 __ BCC $0f81 ; (screen_init.s13 + 0)
.s12:
0f7f : e6 46 __ INC T1 + 1 
.s13:
0f81 : ad d2 83 LDA $83d2 ; (cw.wx + 0)
0f84 : f0 b1 __ BEQ $0f37 ; (screen_init.l6 + 0)
0f86 : d0 9e __ BNE $0f26 ; (screen_init.l8 + 0)
--------------------------------------------------------------------
vic_setmode@proxy: ; vic_setmode@proxy
0f88 : a9 04 __ LDA #$04
0f8a : 85 0f __ STA P2 
0f8c : a9 18 __ LDA #$18
0f8e : 85 11 __ STA P4 
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  97, "/home/xahmol/oscar64/include/c64/vic.h"
.s4:
0f90 : a4 0d __ LDY P0 ; (mode + 0)
0f92 : c0 02 __ CPY #$02
0f94 : d0 09 __ BNE $0f9f ; (vic_setmode.s5 + 0)
.s10:
0f96 : a9 5b __ LDA #$5b
0f98 : 8d 11 d0 STA $d011 
.s8:
0f9b : a9 08 __ LDA #$08
0f9d : d0 0c __ BNE $0fab ; (vic_setmode.s7 + 0)
.s5:
0f9f : b0 36 __ BCS $0fd7 ; (vic_setmode.s6 + 0)
.s9:
0fa1 : a9 1b __ LDA #$1b
0fa3 : 8d 11 d0 STA $d011 
0fa6 : 98 __ __ TYA
0fa7 : f0 f2 __ BEQ $0f9b ; (vic_setmode.s8 + 0)
.s11:
0fa9 : a9 18 __ LDA #$18
.s7:
0fab : 8d 16 d0 STA $d016 
0fae : ad 00 dd LDA $dd00 
0fb1 : 29 fc __ AND #$fc
0fb3 : 85 1b __ STA ACCU + 0 
0fb5 : a5 0f __ LDA P2 ; (text + 1)
0fb7 : 0a __ __ ASL
0fb8 : 2a __ __ ROL
0fb9 : 29 01 __ AND #$01
0fbb : 2a __ __ ROL
0fbc : 49 03 __ EOR #$03
0fbe : 05 1b __ ORA ACCU + 0 
0fc0 : 8d 00 dd STA $dd00 
0fc3 : a5 0f __ LDA P2 ; (text + 1)
0fc5 : 29 3c __ AND #$3c
0fc7 : 0a __ __ ASL
0fc8 : 0a __ __ ASL
0fc9 : 85 1b __ STA ACCU + 0 
0fcb : a5 11 __ LDA P4 ; (font + 1)
0fcd : 29 38 __ AND #$38
0fcf : 4a __ __ LSR
0fd0 : 4a __ __ LSR
0fd1 : 05 1b __ ORA ACCU + 0 
0fd3 : 8d 18 d0 STA $d018 
.s3:
0fd6 : 60 __ __ RTS
.s6:
0fd7 : a9 3b __ LDA #$3b
0fd9 : 8d 11 d0 STA $d011 
0fdc : c0 03 __ CPY #$03
0fde : d0 c9 __ BNE $0fa9 ; (vic_setmode.s11 + 0)
0fe0 : f0 b9 __ BEQ $0f9b ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
header_line: ; header_line(u8,const u8*,u8)->void
;  33, "/home/xahmol/git/UltimateDemo2026/src/screen.c"
.s4:
0fe2 : a5 13 __ LDA P6 ; (text + 0)
0fe4 : 85 0d __ STA P0 
0fe6 : a5 14 __ LDA P7 ; (text + 1)
0fe8 : 85 0e __ STA P1 
0fea : 20 c1 10 JSR $10c1 ; (strlen.s4 + 0)
0fed : a5 12 __ LDA P5 ; (row + 0)
0fef : 0a __ __ ASL
0ff0 : aa __ __ TAX
0ff1 : ad d8 83 LDA $83d8 ; (cw.sp + 0)
0ff4 : 7d 00 7d ADC $7d00,x ; (mul40[0] + 0)
0ff7 : 85 46 __ STA T2 + 0 
0ff9 : ad d9 83 LDA $83d9 ; (cw.sp + 1)
0ffc : 7d 01 7d ADC $7d01,x ; (mul40[0] + 1)
0fff : 85 47 __ STA T2 + 1 
1001 : ad da 83 LDA $83da ; (cw.cp + 0)
1004 : 18 __ __ CLC
1005 : 7d 00 7d ADC $7d00,x ; (mul40[0] + 0)
1008 : 85 48 __ STA T3 + 0 
100a : ad db 83 LDA $83db ; (cw.cp + 1)
100d : 7d 01 7d ADC $7d01,x ; (mul40[0] + 1)
1010 : 85 49 __ STA T3 + 1 
1012 : 38 __ __ SEC
1013 : a9 28 __ LDA #$28
1015 : e5 1b __ SBC ACCU + 0 
1017 : a8 __ __ TAY
1018 : a9 00 __ LDA #$00
101a : e9 00 __ SBC #$00
101c : aa __ __ TAX
101d : 0a __ __ ASL
101e : 98 __ __ TYA
101f : 69 00 __ ADC #$00
1021 : 85 45 __ STA T1 + 0 
1023 : 8a __ __ TXA
1024 : 69 00 __ ADC #$00
1026 : 4a __ __ LSR
1027 : 66 45 __ ROR T1 + 0 
1029 : a0 00 __ LDY #$00
102b : a6 15 __ LDX P8 ; (color + 0)
.l8:
102d : a9 a0 __ LDA #$a0
102f : 91 46 __ STA (T2 + 0),y 
1031 : 8a __ __ TXA
1032 : 91 48 __ STA (T3 + 0),y 
1034 : c8 __ __ INY
1035 : c0 28 __ CPY #$28
1037 : d0 f4 __ BNE $102d ; (header_line.l8 + 0)
.s9:
1039 : a9 00 __ LDA #$00
103b : 85 4a __ STA T4 + 0 
103d : a5 1b __ LDA ACCU + 0 
103f : f0 1f __ BEQ $1060 ; (header_line.s5 + 0)
.s10:
1041 : a0 00 __ LDY #$00
.l7:
1043 : b1 13 __ LDA (P6),y ; (text + 0)
1045 : 4a __ __ LSR
1046 : 4a __ __ LSR
1047 : 4a __ __ LSR
1048 : 4a __ __ LSR
1049 : 4a __ __ LSR
104a : aa __ __ TAX
104b : bd d2 7c LDA $7cd2,x ; (p2smap[0] + 0)
104e : 51 13 __ EOR (P6),y ; (text + 0)
1050 : 09 80 __ ORA #$80
1052 : 99 c1 bf STA $bfc1,y ; (buf[0] + 0)
1055 : c8 __ __ INY
1056 : c4 1b __ CPY ACCU + 0 
1058 : b0 04 __ BCS $105e ; (header_line.s11 + 0)
.s6:
105a : c0 28 __ CPY #$28
105c : 90 e5 __ BCC $1043 ; (header_line.l7 + 0)
.s11:
105e : 84 4a __ STY T4 + 0 
.s5:
1060 : a5 45 __ LDA T1 + 0 
1062 : 85 0d __ STA P0 
1064 : a5 12 __ LDA P5 ; (row + 0)
1066 : 85 0e __ STA P1 
1068 : a5 15 __ LDA P8 ; (color + 0)
106a : 85 11 __ STA P4 
106c : a9 00 __ LDA #$00
106e : a6 4a __ LDX T4 + 0 
1070 : 9d c1 bf STA $bfc1,x ; (buf[0] + 0)
1073 : a9 c1 __ LDA #$c1
1075 : 85 0f __ STA P2 
1077 : a9 bf __ LDA #$bf
1079 : 85 10 __ STA P3 
--------------------------------------------------------------------
cwin_putat_string_raw: ; cwin_putat_string_raw(struct CharWin*,u8,u8,const u8*,u8)->void
; 103, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
107b : a5 0e __ LDA P1 ; (y + 0)
107d : 0a __ __ ASL
107e : aa __ __ TAX
107f : bd 00 7d LDA $7d00,x ; (mul40[0] + 0)
1082 : 65 0d __ ADC P0 ; (x + 0)
1084 : 85 1b __ STA ACCU + 0 
1086 : bd 01 7d LDA $7d01,x ; (mul40[0] + 1)
1089 : 69 00 __ ADC #$00
108b : 85 1c __ STA ACCU + 1 
108d : ad d8 83 LDA $83d8 ; (cw.sp + 0)
1090 : 65 1b __ ADC ACCU + 0 
1092 : 85 43 __ STA T1 + 0 
1094 : ad d9 83 LDA $83d9 ; (cw.sp + 1)
1097 : 65 1c __ ADC ACCU + 1 
1099 : 85 44 __ STA T1 + 1 
109b : ad da 83 LDA $83da ; (cw.cp + 0)
109e : 18 __ __ CLC
109f : 65 1b __ ADC ACCU + 0 
10a1 : 85 1b __ STA ACCU + 0 
10a3 : ad db 83 LDA $83db ; (cw.cp + 1)
10a6 : 65 1c __ ADC ACCU + 1 
10a8 : 85 1c __ STA ACCU + 1 
10aa : a6 11 __ LDX P4 ; (color + 0)
10ac : a0 00 __ LDY #$00
10ae : b1 0f __ LDA (P2),y ; (str + 0)
10b0 : f0 0a __ BEQ $10bc ; (cwin_putat_string_raw.s3 + 0)
.l5:
10b2 : 91 43 __ STA (T1 + 0),y 
10b4 : 8a __ __ TXA
10b5 : 91 1b __ STA (ACCU + 0),y 
10b7 : c8 __ __ INY
10b8 : b1 0f __ LDA (P2),y ; (str + 0)
10ba : d0 f6 __ BNE $10b2 ; (cwin_putat_string_raw.l5 + 0)
.s3:
10bc : 60 __ __ RTS
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
10bd : a5 12 __ LDA P5 
10bf : 85 0e __ STA P1 
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
;  12, "/home/xahmol/oscar64/include/string.h"
.s4:
10c1 : a9 00 __ LDA #$00
10c3 : 85 1b __ STA ACCU + 0 
10c5 : 85 1c __ STA ACCU + 1 
10c7 : a8 __ __ TAY
10c8 : b1 0d __ LDA (P0),y ; (str + 0)
10ca : f0 10 __ BEQ $10dc ; (strlen.s3 + 0)
.s6:
10cc : a2 00 __ LDX #$00
.l7:
10ce : c8 __ __ INY
10cf : d0 03 __ BNE $10d4 ; (strlen.s9 + 0)
.s8:
10d1 : e6 0e __ INC P1 ; (str + 1)
10d3 : e8 __ __ INX
.s9:
10d4 : b1 0d __ LDA (P0),y ; (str + 0)
10d6 : d0 f6 __ BNE $10ce ; (strlen.l7 + 0)
.s5:
10d8 : 86 1c __ STX ACCU + 1 
10da : 84 1b __ STY ACCU + 0 
.s3:
10dc : 60 __ __ RTS
--------------------------------------------------------------------
10dd : __ __ __ BYT 75 4c 54 49 4d 41 54 45 64 45 4d 4f 32 30 32 36 : uLTIMATEdEMO2026
10ed : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
screen_info: ; screen_info(const u8*)->void
;  23, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
10ee : a9 0f __ LDA #$0f
10f0 : 85 0f __ STA P2 
10f2 : 20 9a 7c JSR $7c9a ; (cwin_put_string@proxy + 0)
10f5 : 4c 2a 11 JMP $112a ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
10f8 : __ __ __ BYT 5b 20 6f 6b 20 5d 00                            : [ ok ].
--------------------------------------------------------------------
spentry:
10ff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1100 : __ __ __ BYT 68 41 52 44 57 41 52 45 20 64 45 54 45 43 54 49 : hARDWARE dETECTI
1110 : __ __ __ BYT 4f 4e 20 20 20 56 30 2e 31 2e 30 2d 32 30 32 36 : ON   V0.1.0-2026
1120 : __ __ __ BYT 30 35 33 31 2d 31 32 32 31 00                   : 0531-1221.
--------------------------------------------------------------------
cwin_cursor_newline: ; cwin_cursor_newline(struct CharWin*)->void
;  44, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
112a : ad d5 83 LDA $83d5 ; (cw.cy + 0)
112d : 18 __ __ CLC
112e : 69 01 __ ADC #$01
1130 : a8 __ __ TAY
1131 : a9 00 __ LDA #$00
1133 : 8d d4 83 STA $83d4 ; (cw.cx + 0)
1136 : 2a __ __ ROL
1137 : d0 08 __ BNE $1141 ; (cwin_cursor_newline.s3 + 0)
.s6:
1139 : cc d3 83 CPY $83d3 ; (cw.wy + 0)
113c : b0 03 __ BCS $1141 ; (cwin_cursor_newline.s3 + 0)
.s5:
113e : ee d5 83 INC $83d5 ; (cw.cy + 0)
.s3:
1141 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_put_string@proxy: ; cwin_put_string@proxy
1142 : a9 41 __ LDA #$41
1144 : 85 0d __ STA P0 
1146 : a9 12 __ LDA #$12
1148 : 85 0e __ STA P1 
--------------------------------------------------------------------
cwin_put_string: ; cwin_put_string(struct CharWin*,const u8*,u8)->void
;  64, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
114a : ad d5 83 LDA $83d5 ; (cw.cy + 0)
114d : 0a __ __ ASL
114e : aa __ __ TAX
114f : bd 00 7d LDA $7d00,x ; (mul40[0] + 0)
1152 : 6d d4 83 ADC $83d4 ; (cw.cx + 0)
1155 : 85 1b __ STA ACCU + 0 
1157 : bd 01 7d LDA $7d01,x ; (mul40[0] + 1)
115a : 69 00 __ ADC #$00
115c : 85 1c __ STA ACCU + 1 
115e : ad d8 83 LDA $83d8 ; (cw.sp + 0)
1161 : 65 1b __ ADC ACCU + 0 
1163 : 85 43 __ STA T1 + 0 
1165 : ad d9 83 LDA $83d9 ; (cw.sp + 1)
1168 : 65 1c __ ADC ACCU + 1 
116a : 85 44 __ STA T1 + 1 
116c : ad da 83 LDA $83da ; (cw.cp + 0)
116f : 18 __ __ CLC
1170 : 65 1b __ ADC ACCU + 0 
1172 : 85 1b __ STA ACCU + 0 
1174 : ad db 83 LDA $83db ; (cw.cp + 1)
1177 : 65 1c __ ADC ACCU + 1 
1179 : 85 1c __ STA ACCU + 1 
117b : a0 00 __ LDY #$00
117d : b1 0d __ LDA (P0),y ; (str + 0)
117f : f0 16 __ BEQ $1197 ; (cwin_put_string.s5 + 0)
.l7:
1181 : 4a __ __ LSR
1182 : 4a __ __ LSR
1183 : 4a __ __ LSR
1184 : 4a __ __ LSR
1185 : 4a __ __ LSR
1186 : aa __ __ TAX
1187 : bd da 7c LDA $7cda,x ; (p2smap[0] + 0)
118a : 51 0d __ EOR (P0),y ; (str + 0)
118c : 91 43 __ STA (T1 + 0),y 
118e : a5 0f __ LDA P2 ; (color + 0)
1190 : 91 1b __ STA (ACCU + 0),y 
1192 : c8 __ __ INY
1193 : b1 0d __ LDA (P0),y ; (str + 0)
1195 : d0 ea __ BNE $1181 ; (cwin_put_string.l7 + 0)
.s5:
1197 : 98 __ __ TYA
1198 : 18 __ __ CLC
1199 : 6d d4 83 ADC $83d4 ; (cw.cx + 0)
119c : cd d2 83 CMP $83d2 ; (cw.wx + 0)
119f : 90 05 __ BCC $11a6 ; (cwin_put_string.s3 + 0)
.s6:
11a1 : a9 00 __ LDA #$00
11a3 : ee d5 83 INC $83d5 ; (cw.cy + 0)
.s3:
11a6 : 8d d4 83 STA $83d4 ; (cw.cx + 0)
11a9 : 60 __ __ RTS
--------------------------------------------------------------------
11aa : __ __ __ BYT 77 41 49 54 49 4e 47 20 46 4f 52 20 75 4c 54 49 : wAITING FOR uLTI
11ba : __ __ __ BYT 4d 41 54 45 20 46 49 52 4d 57 41 52 45 2e 2e 2e : MATE FIRMWARE...
11ca : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
uii_detect: ; uii_detect()->u8
; 167, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
11cb : ad 1d df LDA $df1d 
11ce : c9 c9 __ CMP #$c9
11d0 : d0 0b __ BNE $11dd ; (uii_detect.s5 + 0)
.s6:
11d2 : ad 1c df LDA $df1c 
11d5 : 09 04 __ ORA #$04
11d7 : 8d 1c df STA $df1c 
11da : a9 01 __ LDA #$01
11dc : 60 __ __ RTS
.s5:
11dd : a9 00 __ LDA #$00
.s3:
11df : 60 __ __ RTS
--------------------------------------------------------------------
screen_result@proxy: ; screen_result@proxy
11e0 : a9 01 __ LDA #$01
11e2 : 85 12 __ STA P5 
11e4 : a9 93 __ LDA #$93
11e6 : 85 13 __ STA P6 
11e8 : a9 bf __ LDA #$bf
11ea : 85 14 __ STA P7 
--------------------------------------------------------------------
screen_result: ; screen_result(const u8*,u8,const u8*)->void
;  17, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
11ec : a9 01 __ LDA #$01
11ee : 85 0f __ STA P2 
11f0 : 20 42 11 JSR $1142 ; (cwin_put_string@proxy + 0)
11f3 : 20 9a 7c JSR $7c9a ; (cwin_put_string@proxy + 0)
11f6 : a9 44 __ LDA #$44
11f8 : 85 0d __ STA P0 
11fa : a9 12 __ LDA #$12
11fc : 85 0e __ STA P1 
11fe : 20 4a 11 JSR $114a ; (cwin_put_string.s4 + 0)
1201 : a5 12 __ LDA P5 ; (ok + 0)
1203 : d0 09 __ BNE $120e ; (screen_result.s7 + 0)
.s5:
1205 : e6 0f __ INC P2 
1207 : a9 12 __ LDA #$12
1209 : a0 3a __ LDY #$3a
120b : 4c 16 12 JMP $1216 ; (screen_result.s6 + 0)
.s7:
120e : a9 05 __ LDA #$05
1210 : 85 0f __ STA P2 
1212 : a9 10 __ LDA #$10
1214 : a0 f8 __ LDY #$f8
.s6:
1216 : 84 0d __ STY P0 
1218 : 85 0e __ STA P1 
121a : 20 4a 11 JSR $114a ; (cwin_put_string.s4 + 0)
121d : a5 12 __ LDA P5 ; (ok + 0)
121f : f0 04 __ BEQ $1225 ; (screen_result.s8 + 0)
.s9:
1221 : a9 03 __ LDA #$03
1223 : d0 02 __ BNE $1227 ; (screen_result.s10 + 0)
.s8:
1225 : a9 07 __ LDA #$07
.s10:
1227 : 85 0f __ STA P2 
1229 : 20 42 11 JSR $1142 ; (cwin_put_string@proxy + 0)
122c : a5 13 __ LDA P6 ; (detail + 0)
122e : 85 0d __ STA P0 
1230 : a5 14 __ LDA P7 ; (detail + 1)
1232 : 85 0e __ STA P1 
1234 : 20 4a 11 JSR $114a ; (cwin_put_string.s4 + 0)
1237 : 4c 2a 11 JMP $112a ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
123a : __ __ __ BYT 5b 66 41 49 4c 5d 00                            : [fAIL].
--------------------------------------------------------------------
1241 : __ __ __ BYT 20 20 00                                        :   .
--------------------------------------------------------------------
1244 : __ __ __ BYT 20 3a 20 00                                     :  : .
--------------------------------------------------------------------
1248 : __ __ __ BYT 75 63 69 20 20 00                               : uci  .
--------------------------------------------------------------------
124e : __ __ __ BYT 6e 4f 54 20 44 45 54 45 43 54 45 44 00          : nOT DETECTED.
--------------------------------------------------------------------
screen_error_exit: ; screen_error_exit(const u8*,const u8*)->void
;  32, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
125b : a9 02 __ LDA #$02
125d : 85 0f __ STA P2 
125f : 20 2a 11 JSR $112a ; (cwin_cursor_newline.s4 + 0)
1262 : a5 12 __ LDA P5 ; (msg + 0)
1264 : 85 0d __ STA P0 
1266 : a5 13 __ LDA P6 ; (msg + 1)
1268 : 85 0e __ STA P1 
126a : 20 4a 11 JSR $114a ; (cwin_put_string.s4 + 0)
126d : 20 2a 11 JSR $112a ; (cwin_cursor_newline.s4 + 0)
1270 : a5 15 __ LDA P8 ; (hint + 1)
1272 : 05 14 __ ORA P7 ; (hint + 0)
1274 : f0 11 __ BEQ $1287 ; (screen_error_exit.s5 + 0)
.s6:
1276 : a0 00 __ LDY #$00
1278 : b1 14 __ LDA (P7),y ; (hint + 0)
127a : f0 0b __ BEQ $1287 ; (screen_error_exit.s5 + 0)
.s7:
127c : a5 14 __ LDA P7 ; (hint + 0)
127e : 85 10 __ STA P3 
1280 : a5 15 __ LDA P8 ; (hint + 1)
1282 : 85 11 __ STA P4 
1284 : 20 aa 12 JSR $12aa ; (screen_hint.s4 + 0)
.s5:
1287 : a9 01 __ LDA #$01
1289 : 85 0f __ STA P2 
128b : 20 2a 11 JSR $112a ; (cwin_cursor_newline.s4 + 0)
128e : a9 c5 __ LDA #$c5
1290 : 85 0d __ STA P0 
1292 : a9 12 __ LDA #$12
1294 : 85 0e __ STA P1 
1296 : 20 4a 11 JSR $114a ; (cwin_put_string.s4 + 0)
1299 : 20 2a 11 JSR $112a ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
cwin_getch: ; cwin_getch()->void
; 147, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
129c : 20 e4 ff JSR $ffe4 
129f : c9 00 __ CMP #$00
12a1 : f0 f9 __ BEQ $129c ; (cwin_getch.s4 + 0)
12a3 : 85 1b __ STA ACCU + 0 
12a5 : a9 00 __ LDA #$00
12a7 : 85 1c __ STA ACCU + 1 
.s3:
12a9 : 60 __ __ RTS
--------------------------------------------------------------------
screen_hint: ; screen_hint(const u8*)->void
;  26, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
12aa : a9 07 __ LDA #$07
12ac : 85 0f __ STA P2 
12ae : a9 12 __ LDA #$12
12b0 : 85 0e __ STA P1 
12b2 : a9 bf __ LDA #$bf
12b4 : 85 0d __ STA P0 
12b6 : 20 4a 11 JSR $114a ; (cwin_put_string.s4 + 0)
12b9 : 20 9a 7c JSR $7c9a ; (cwin_put_string@proxy + 0)
12bc : 4c 2a 11 JMP $112a ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
12bf : __ __ __ BYT 20 20 2d 3e 20 00                               :   -> .
--------------------------------------------------------------------
12c5 : __ __ __ BYT 70 52 45 53 53 20 41 20 4b 45 59 20 2d 20 45 58 : pRESS A KEY - EX
12d5 : __ __ __ BYT 49 54 20 54 4f 20 62 61 73 69 63 2e 00          : IT TO basic..
--------------------------------------------------------------------
12e2 : __ __ __ BYT 66 32 20 3e 20 75 63 69 20 73 45 54 54 49 4e 47 : f2 > uci sETTING
12f2 : __ __ __ BYT 53 20 3e 20 65 4e 41 42 4c 45 00                : S > eNABLE.
--------------------------------------------------------------------
12fd : __ __ __ BYT 56 00                                           : V.
--------------------------------------------------------------------
uii_target:
12ff : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
1300 : __ __ __ BYT 6e 4f 20 75 4c 54 49 4d 41 54 45 20 63 4f 4d 4d : nO uLTIMATE cOMM
1310 : __ __ __ BYT 41 4e 44 20 69 4e 54 45 52 46 41 43 45 20 46 4f : AND iNTERFACE FO
1320 : __ __ __ BYT 55 4e 44 2e 00                                  : UND..
--------------------------------------------------------------------
uii_sendcommand: ; uii_sendcommand(u8*,u16)->void
; 173, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
1325 : ad ff 12 LDA $12ff ; (uii_target + 0)
1328 : a0 00 __ LDY #$00
132a : 84 1b __ STY ACCU + 0 
132c : 84 1c __ STY ACCU + 1 
132e : 91 0d __ STA (P0),y ; (bytes + 0)
.l5:
1330 : ad 1c df LDA $df1c 
1333 : 29 20 __ AND #$20
1335 : d0 f9 __ BNE $1330 ; (uii_sendcommand.l5 + 0)
.s6:
1337 : ad 1c df LDA $df1c 
133a : 29 10 __ AND #$10
133c : d0 f2 __ BNE $1330 ; (uii_sendcommand.l5 + 0)
.s7:
133e : a5 1c __ LDA ACCU + 1 
1340 : c5 10 __ CMP P3 ; (count + 1)
1342 : d0 04 __ BNE $1348 ; (uii_sendcommand.s16 + 0)
.s15:
1344 : a5 1b __ LDA ACCU + 0 
1346 : c5 0f __ CMP P2 ; (count + 0)
.s16:
1348 : b0 2e __ BCS $1378 ; (uii_sendcommand.s8 + 0)
.s12:
134a : a5 0d __ LDA P0 ; (bytes + 0)
134c : 65 1b __ ADC ACCU + 0 
134e : 85 43 __ STA T3 + 0 
1350 : a5 0e __ LDA P1 ; (bytes + 1)
1352 : 65 1c __ ADC ACCU + 1 
1354 : 85 44 __ STA T3 + 1 
1356 : a6 1b __ LDX ACCU + 0 
.l13:
1358 : a0 00 __ LDY #$00
135a : b1 43 __ LDA (T3 + 0),y 
135c : 8d 1d df STA $df1d 
135f : e6 43 __ INC T3 + 0 
1361 : d0 02 __ BNE $1365 ; (uii_sendcommand.s19 + 0)
.s18:
1363 : e6 44 __ INC T3 + 1 
.s19:
1365 : e8 __ __ INX
1366 : d0 02 __ BNE $136a ; (uii_sendcommand.s21 + 0)
.s20:
1368 : e6 1c __ INC ACCU + 1 
.s21:
136a : a5 1c __ LDA ACCU + 1 
136c : c5 10 __ CMP P3 ; (count + 1)
136e : 90 e8 __ BCC $1358 ; (uii_sendcommand.l13 + 0)
.s22:
1370 : d0 04 __ BNE $1376 ; (uii_sendcommand.s17 + 0)
.s14:
1372 : e4 0f __ CPX P2 ; (count + 0)
1374 : 90 e2 __ BCC $1358 ; (uii_sendcommand.l13 + 0)
.s17:
1376 : 86 1b __ STX ACCU + 0 
.s8:
1378 : ad 1c df LDA $df1c 
137b : 09 01 __ ORA #$01
137d : 8d 1c df STA $df1c 
1380 : ad 1c df LDA $df1c 
1383 : 29 04 __ AND #$04
1385 : f0 0a __ BEQ $1391 ; (uii_sendcommand.l9 + 0)
.s11:
1387 : ad 1c df LDA $df1c 
138a : 09 08 __ ORA #$08
138c : 8d 1c df STA $df1c 
138f : b0 9f __ BCS $1330 ; (uii_sendcommand.l5 + 0)
.l9:
1391 : ad 1c df LDA $df1c 
1394 : 29 20 __ AND #$20
1396 : d0 07 __ BNE $139f ; (uii_sendcommand.s3 + 0)
.s10:
1398 : ad 1c df LDA $df1c 
139b : 29 10 __ AND #$10
139d : d0 f2 __ BNE $1391 ; (uii_sendcommand.l9 + 0)
.s3:
139f : 60 __ __ RTS
--------------------------------------------------------------------
uii_readdata: ; uii_readdata()->void
; 179, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
13a0 : a9 00 __ LDA #$00
13a2 : 8d c8 93 STA $93c8 ; (uii_data[0] + 0)
13a5 : a2 c8 __ LDX #$c8
13a7 : 86 1b __ STX ACCU + 0 
13a9 : a8 __ __ TAY
13aa : f0 0d __ BEQ $13b9 ; (uii_readdata.l5 + 0)
.s8:
13ac : ad 1e df LDA $df1e 
13af : 91 1b __ STA (ACCU + 0),y 
13b1 : 98 __ __ TYA
13b2 : 18 __ __ CLC
13b3 : 69 01 __ ADC #$01
13b5 : a8 __ __ TAY
13b6 : 8a __ __ TXA
13b7 : 69 00 __ ADC #$00
.l5:
13b9 : aa __ __ TAX
13ba : 18 __ __ CLC
13bb : 69 93 __ ADC #$93
13bd : 85 1c __ STA ACCU + 1 
13bf : 2c 1c df BIT $df1c 
13c2 : 10 07 __ BPL $13cb ; (uii_readdata.s6 + 0)
.s7:
13c4 : e0 02 __ CPX #$02
13c6 : d0 e4 __ BNE $13ac ; (uii_readdata.s8 + 0)
.s9:
13c8 : 98 __ __ TYA
13c9 : d0 e1 __ BNE $13ac ; (uii_readdata.s8 + 0)
.s6:
13cb : a9 00 __ LDA #$00
13cd : 91 1b __ STA (ACCU + 0),y 
.s3:
13cf : 60 __ __ RTS
--------------------------------------------------------------------
uii_readstatus: ; uii_readstatus()->void
; 180, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
13d0 : a9 00 __ LDA #$00
13d2 : 8d c9 95 STA $95c9 ; (uii_status[0] + 0)
13d5 : a2 c9 __ LDX #$c9
13d7 : 86 1b __ STX ACCU + 0 
13d9 : a8 __ __ TAY
13da : f0 0d __ BEQ $13e9 ; (uii_readstatus.l5 + 0)
.s8:
13dc : ad 1f df LDA $df1f 
13df : 91 1b __ STA (ACCU + 0),y 
13e1 : 98 __ __ TYA
13e2 : 18 __ __ CLC
13e3 : 69 01 __ ADC #$01
13e5 : a8 __ __ TAY
13e6 : 8a __ __ TXA
13e7 : 69 00 __ ADC #$00
.l5:
13e9 : aa __ __ TAX
13ea : 18 __ __ CLC
13eb : 69 95 __ ADC #$95
13ed : 85 1c __ STA ACCU + 1 
13ef : ad 1c df LDA $df1c 
13f2 : 29 40 __ AND #$40
13f4 : f0 07 __ BEQ $13fd ; (uii_readstatus.s6 + 0)
.s7:
13f6 : e0 01 __ CPX #$01
13f8 : d0 e2 __ BNE $13dc ; (uii_readstatus.s8 + 0)
.s9:
13fa : 98 __ __ TYA
13fb : d0 df __ BNE $13dc ; (uii_readstatus.s8 + 0)
.s6:
13fd : 91 1b __ STA (ACCU + 0),y 
.s3:
13ff : 60 __ __ RTS
--------------------------------------------------------------------
uii_get_hwinfo: ; uii_get_hwinfo(u8)->void
;  53, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
1400 : a9 00 __ LDA #$00
1402 : 85 10 __ STA P3 
1404 : 8d e7 bf STA $bfe7 ; (cmd[0] + 0)
1407 : 8d e9 bf STA $bfe9 ; (cmd[0] + 2)
140a : a9 03 __ LDA #$03
140c : 85 0f __ STA P2 
140e : a9 04 __ LDA #$04
1410 : 8d ff 12 STA $12ff ; (uii_target + 0)
1413 : a9 28 __ LDA #$28
1415 : 8d e8 bf STA $bfe8 ; (cmd[0] + 1)
1418 : a9 00 __ LDA #$00
141a : 8d e9 bf STA $bfe9 ; (cmd[0] + 2)
141d : a9 e7 __ LDA #$e7
141f : 85 0d __ STA P0 
1421 : a9 bf __ LDA #$bf
1423 : 85 0e __ STA P1 
1425 : 20 25 13 JSR $1325 ; (uii_sendcommand.s4 + 0)
1428 : 20 a0 13 JSR $13a0 ; (uii_readdata.s4 + 0)
142b : 20 d0 13 JSR $13d0 ; (uii_readstatus.s4 + 0)
--------------------------------------------------------------------
uii_accept: ; uii_accept()->void
; 174, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
142e : ad 1c df LDA $df1c 
1431 : 09 02 __ ORA #$02
1433 : 8d 1c df STA $df1c 
.l5:
1436 : ad 1c df LDA $df1c 
1439 : 29 02 __ AND #$02
143b : d0 f9 __ BNE $1436 ; (uii_accept.l5 + 0)
.s3:
143d : 60 __ __ RTS
--------------------------------------------------------------------
uci_to_upper@proxy: ; uci_to_upper@proxy
143e : a9 93 __ LDA #$93
1440 : 85 0d __ STA P0 
1442 : a9 bf __ LDA #$bf
1444 : 85 0e __ STA P1 
--------------------------------------------------------------------
uci_to_upper: ; uci_to_upper(u8*,u8)->u8
;  71, "/home/xahmol/git/UltimateDemo2026/src/main.c"
.s4:
1446 : a0 00 __ LDY #$00
1448 : a2 00 __ LDX #$00
144a : ad c8 93 LDA $93c8 ; (uii_data[0] + 0)
144d : f0 23 __ BEQ $1472 ; (uci_to_upper.s6 + 0)
.l8:
144f : c9 20 __ CMP #$20
1451 : 90 11 __ BCC $1464 ; (uci_to_upper.s9 + 0)
.s10:
1453 : c9 7f __ CMP #$7f
1455 : b0 0d __ BCS $1464 ; (uci_to_upper.s9 + 0)
.s11:
1457 : c9 61 __ CMP #$61
1459 : 90 06 __ BCC $1461 ; (uci_to_upper.s14 + 0)
.s12:
145b : c9 7b __ CMP #$7b
145d : b0 02 __ BCS $1461 ; (uci_to_upper.s14 + 0)
.s13:
145f : e9 1f __ SBC #$1f
.s14:
1461 : 91 0d __ STA (P0),y ; (dst + 0)
1463 : c8 __ __ INY
.s9:
1464 : e8 __ __ INX
1465 : e0 7f __ CPX #$7f
1467 : b0 09 __ BCS $1472 ; (uci_to_upper.s6 + 0)
.s5:
1469 : c0 18 __ CPY #$18
146b : b0 05 __ BCS $1472 ; (uci_to_upper.s6 + 0)
.s7:
146d : bd c8 93 LDA $93c8,x ; (uii_data[0] + 0)
1470 : d0 dd __ BNE $144f ; (uci_to_upper.l8 + 0)
.s6:
1472 : a9 00 __ LDA #$00
1474 : 91 0d __ STA (P0),y ; (dst + 0)
.s3:
1476 : 98 __ __ TYA
1477 : 60 __ __ RTS
--------------------------------------------------------------------
1478 : __ __ __ BYT 75 63 69 20 6f 4b 00                            : uci oK.
--------------------------------------------------------------------
147f : __ __ __ BYT 20 20 74 59 50 45 20 20 3a 20 00                :   tYPE  : .
--------------------------------------------------------------------
148a : __ __ __ BYT 63 48 45 43 4b 49 4e 47 20 72 65 75 2e 2e 2e 00 : cHECKING reu....
--------------------------------------------------------------------
detect_reu: ; detect_reu()->u8
;  33, "/home/xahmol/git/UltimateDemo2026/src/detect.h"
.s4:
149a : a9 00 __ LDA #$00
149c : 8d e9 bf STA $bfe9 ; (c + 0)
149f : a9 e9 __ LDA #$e9
14a1 : 8d 02 df STA $df02 
14a4 : a9 bf __ LDA #$bf
14a6 : 8d 03 df STA $df03 
14a9 : a9 00 __ LDA #$00
14ab : 8d 04 df STA $df04 
14ae : 8d 05 df STA $df05 
14b1 : 8d 06 df STA $df06 
14b4 : a2 01 __ LDX #$01
14b6 : 8e 07 df STX $df07 
14b9 : 8d 08 df STA $df08 
14bc : 8d 0a df STA $df0a 
14bf : a2 90 __ LDX #$90
14c1 : 8e 01 df STX $df01 
14c4 : a2 e8 __ LDX #$e8
14c6 : 8e 02 df STX $df02 
14c9 : a2 bf __ LDX #$bf
14cb : 8e 03 df STX $df03 
14ce : 8d 04 df STA $df04 
14d1 : 8d 05 df STA $df05 
14d4 : 8d 06 df STA $df06 
14d7 : a2 01 __ LDX #$01
14d9 : 8e 07 df STX $df07 
14dc : 8d 08 df STA $df08 
14df : 8d 0a df STA $df0a 
14e2 : a9 91 __ LDA #$91
14e4 : 8d 01 df STA $df01 
14e7 : ad e8 bf LDA $bfe8 ; (d + 0)
14ea : d0 52 __ BNE $153e ; (detect_reu.s6 + 0)
.s5:
14ec : a2 47 __ LDX #$47
14ee : 8e e9 bf STX $bfe9 ; (c + 0)
14f1 : a2 e9 __ LDX #$e9
14f3 : 8e 02 df STX $df02 
14f6 : a2 bf __ LDX #$bf
14f8 : 8e 03 df STX $df03 
14fb : 8d 04 df STA $df04 
14fe : 8d 05 df STA $df05 
1501 : 8d 06 df STA $df06 
1504 : a2 01 __ LDX #$01
1506 : 8e 07 df STX $df07 
1509 : 8d 08 df STA $df08 
150c : 8d 0a df STA $df0a 
150f : a2 90 __ LDX #$90
1511 : 8e 01 df STX $df01 
1514 : a2 e8 __ LDX #$e8
1516 : 8e 02 df STX $df02 
1519 : a2 bf __ LDX #$bf
151b : 8e 03 df STX $df03 
151e : 8d 04 df STA $df04 
1521 : 8d 05 df STA $df05 
1524 : 8d 06 df STA $df06 
1527 : a2 01 __ LDX #$01
1529 : 8e 07 df STX $df07 
152c : 8d 08 df STA $df08 
152f : 8d 0a df STA $df0a 
1532 : a9 91 __ LDA #$91
1534 : 8d 01 df STA $df01 
1537 : ad e8 bf LDA $bfe8 ; (d + 0)
153a : c9 47 __ CMP #$47
153c : f0 03 __ BEQ $1541 ; (detect_reu.s7 + 0)
.s6:
153e : a9 00 __ LDA #$00
.s3:
1540 : 60 __ __ RTS
.s7:
1541 : a0 01 __ LDY #$01
.l8:
1543 : 8d e9 bf STA $bfe9 ; (c + 0)
1546 : a9 e9 __ LDA #$e9
1548 : 8d 02 df STA $df02 
154b : a9 bf __ LDA #$bf
154d : 8d 03 df STA $df03 
1550 : a9 00 __ LDA #$00
1552 : 8d 04 df STA $df04 
1555 : 8d 05 df STA $df05 
1558 : 8c 06 df STY $df06 
155b : 8e 07 df STX $df07 
155e : 8d 08 df STA $df08 
1561 : 8d 0a df STA $df0a 
1564 : a2 90 __ LDX #$90
1566 : 8e 01 df STX $df01 
1569 : 8d e9 bf STA $bfe9 ; (c + 0)
156c : a2 e9 __ LDX #$e9
156e : 8e 02 df STX $df02 
1571 : a2 bf __ LDX #$bf
1573 : 8e 03 df STX $df03 
1576 : 8d 04 df STA $df04 
1579 : 8d 05 df STA $df05 
157c : 8d 06 df STA $df06 
157f : a2 01 __ LDX #$01
1581 : 8e 07 df STX $df07 
1584 : 8d 08 df STA $df08 
1587 : 8d 0a df STA $df0a 
158a : a2 90 __ LDX #$90
158c : 8e 01 df STX $df01 
158f : a2 e8 __ LDX #$e8
1591 : 8e 02 df STX $df02 
1594 : a2 bf __ LDX #$bf
1596 : 8e 03 df STX $df03 
1599 : 8d 04 df STA $df04 
159c : 8d 05 df STA $df05 
159f : 8c 06 df STY $df06 
15a2 : a2 01 __ LDX #$01
15a4 : 8e 07 df STX $df07 
15a7 : 8d 08 df STA $df08 
15aa : 8d 0a df STA $df0a 
15ad : a9 91 __ LDA #$91
15af : 8d 01 df STA $df01 
15b2 : ad e8 bf LDA $bfe8 ; (d + 0)
15b5 : c9 47 __ CMP #$47
15b7 : d0 06 __ BNE $15bf ; (detect_reu.s11 + 0)
.s9:
15b9 : c8 __ __ INY
15ba : d0 87 __ BNE $1543 ; (detect_reu.l8 + 0)
.s10:
15bc : a9 10 __ LDA #$10
15be : 60 __ __ RTS
.s11:
15bf : 98 __ __ TYA
15c0 : 4a __ __ LSR
15c1 : 4a __ __ LSR
15c2 : 4a __ __ LSR
15c3 : 4a __ __ LSR
15c4 : 60 __ __ RTS
--------------------------------------------------------------------
15c5 : __ __ __ BYT 72 65 75 20 20 00                               : reu  .
--------------------------------------------------------------------
15cb : __ __ __ BYT 74 4f 4f 20 53 4d 41 4c 4c 20 28 4e 45 45 44 20 : tOO SMALL (NEED 
15db : __ __ __ BYT 31 36 20 6d 62 29 00                            : 16 mb).
--------------------------------------------------------------------
15e2 : __ __ __ BYT 31 36 20 6d 62 20 72 65 75 20 49 53 20 52 45 51 : 16 mb reu IS REQ
15f2 : __ __ __ BYT 55 49 52 45 44 2e 00                            : UIRED..
--------------------------------------------------------------------
15f9 : __ __ __ BYT 31 36 20 6d 62 00                               : 16 mb.
--------------------------------------------------------------------
mod_paused:
15ff : __ __ __ BSS	1
--------------------------------------------------------------------
1600 : __ __ __ BYT 66 32 20 3e 20 63 36 34 20 53 45 54 54 49 4e 47 : f2 > c64 SETTING
1610 : __ __ __ BYT 53 20 3e 20 72 65 75 20 3e 20 31 36 20 6d 62 00 : S > reu > 16 mb.
--------------------------------------------------------------------
1620 : __ __ __ BYT 63 48 45 43 4b 49 4e 47 20 54 55 52 42 4f 20 4d : cHECKING TURBO M
1630 : __ __ __ BYT 4f 44 45 2e 2e 2e 00                            : ODE....
--------------------------------------------------------------------
turbo_detect: ; turbo_detect()->u8
; 114, "/home/xahmol/git/UltimateDemo2026/include/turbo.h"
.s4:
1637 : ae 31 d0 LDX $d031 
163a : e8 __ __ INX
163b : f0 1c __ BEQ $1659 ; (turbo_detect.s6 + 0)
.s5:
163d : a9 0f __ LDA #$0f
163f : 20 73 16 JSR $1673 ; (turbo_set.s4 + 0)
1642 : 20 8e 16 JSR $168e ; (benchmark_delay.s4 + 0)
1645 : 20 8e 16 JSR $168e ; (benchmark_delay.s4 + 0)
1648 : a5 1b __ LDA ACCU + 0 
164a : 85 44 __ STA T0 + 0 
164c : a5 1c __ LDA ACCU + 1 
164e : 85 45 __ STA T0 + 1 
1650 : a9 00 __ LDA #$00
1652 : 20 73 16 JSR $1673 ; (turbo_set.s4 + 0)
1655 : a5 45 __ LDA T0 + 1 
1657 : f0 05 __ BEQ $165e ; (turbo_detect.s9 + 0)
.s6:
1659 : a9 00 __ LDA #$00
.s3:
165b : 85 1b __ STA ACCU + 0 
165d : 60 __ __ RTS
.s9:
165e : a5 44 __ LDA T0 + 0 
1660 : c9 02 __ CMP #$02
1662 : b0 04 __ BCS $1668 ; (turbo_detect.s7 + 0)
.s8:
1664 : a9 02 __ LDA #$02
1666 : 90 f3 __ BCC $165b ; (turbo_detect.s3 + 0)
.s7:
1668 : c9 46 __ CMP #$46
166a : a9 00 __ LDA #$00
166c : 2a __ __ ROL
166d : 49 01 __ EOR #$01
166f : 90 ea __ BCC $165b ; (turbo_detect.s3 + 0)
--------------------------------------------------------------------
turbo_set: ; turbo_set(u8)->void
; 131, "/home/xahmol/git/UltimateDemo2026/include/turbo.h"
.s4:
1673 : a8 __ __ TAY
1674 : d0 0c __ BNE $1682 ; (turbo_set.s6 + 0)
.s5:
1676 : 8d 31 d0 STA $d031 
1679 : ad 30 d0 LDA $d030 
167c : 29 fe __ AND #$fe
167e : 8d 30 d0 STA $d030 
1681 : 60 __ __ RTS
.s6:
1682 : ad 30 d0 LDA $d030 
1685 : 09 01 __ ORA #$01
1687 : 8d 30 d0 STA $d030 
168a : 8c 31 d0 STY $d031 
.s3:
168d : 60 __ __ RTS
--------------------------------------------------------------------
benchmark_delay: ; benchmark_delay(i16)->i16
;  99, "/home/xahmol/git/UltimateDemo2026/include/turbo.h"
.s4:
168e : 78 __ __ SEI
168f : a9 00 __ LDA #$00
1691 : 8d 09 dc STA $dc09 
1694 : 8d 08 dc STA $dc08 
1697 : 8d e8 bf STA $bfe8 ; (i + 0)
169a : f0 0e __ BEQ $16aa ; (benchmark_delay.l5 + 0)
.s9:
169c : ad e8 bf LDA $bfe8 ; (i + 0)
169f : 18 __ __ CLC
16a0 : 69 01 __ ADC #$01
16a2 : 8d e8 bf STA $bfe8 ; (i + 0)
16a5 : ad e9 bf LDA $bfe9 ; (i + 1)
16a8 : 69 00 __ ADC #$00
.l5:
16aa : 8d e9 bf STA $bfe9 ; (i + 1)
16ad : ac e8 bf LDY $bfe8 ; (i + 0)
16b0 : ad e9 bf LDA $bfe9 ; (i + 1)
16b3 : 49 80 __ EOR #$80
16b5 : c9 83 __ CMP #$83
16b7 : d0 02 __ BNE $16bb ; (benchmark_delay.s14 + 0)
.s13:
16b9 : c0 e8 __ CPY #$e8
.s14:
16bb : b0 07 __ BCS $16c4 ; (benchmark_delay.s6 + 0)
.s7:
16bd : a9 00 __ LDA #$00
16bf : 8d e6 bf STA $bfe6 ; (j + 0)
16c2 : 90 28 __ BCC $16ec ; (benchmark_delay.l8 + 0)
.s6:
16c4 : 58 __ __ CLI
16c5 : ad 09 dc LDA $dc09 
16c8 : aa __ __ TAX
16c9 : 0a __ __ ASL
16ca : 85 1b __ STA ACCU + 0 
16cc : a9 00 __ LDA #$00
16ce : 2a __ __ ROL
16cf : 06 1b __ ASL ACCU + 0 
16d1 : 2a __ __ ROL
16d2 : a8 __ __ TAY
16d3 : 8a __ __ TXA
16d4 : 65 1b __ ADC ACCU + 0 
16d6 : 85 43 __ STA T0 + 0 
16d8 : 98 __ __ TYA
16d9 : 69 00 __ ADC #$00
16db : 06 43 __ ASL T0 + 0 
16dd : 2a __ __ ROL
16de : a8 __ __ TAY
16df : ad 08 dc LDA $dc08 
16e2 : 65 43 __ ADC T0 + 0 
16e4 : 85 1b __ STA ACCU + 0 
16e6 : 90 01 __ BCC $16e9 ; (benchmark_delay.s16 + 0)
.s15:
16e8 : c8 __ __ INY
.s16:
16e9 : 84 1c __ STY ACCU + 1 
.s3:
16eb : 60 __ __ RTS
.l8:
16ec : 8d e7 bf STA $bfe7 ; (j + 1)
16ef : ac e6 bf LDY $bfe6 ; (j + 0)
16f2 : ad e7 bf LDA $bfe7 ; (j + 1)
16f5 : 30 06 __ BMI $16fd ; (benchmark_delay.s10 + 0)
.s12:
16f7 : d0 a3 __ BNE $169c ; (benchmark_delay.s9 + 0)
.s11:
16f9 : c0 c8 __ CPY #$c8
16fb : b0 9f __ BCS $169c ; (benchmark_delay.s9 + 0)
.s10:
16fd : ea __ __ NOP
16fe : ad e6 bf LDA $bfe6 ; (j + 0)
1701 : 18 __ __ CLC
1702 : 69 01 __ ADC #$01
1704 : 8d e6 bf STA $bfe6 ; (j + 0)
1707 : ad e7 bf LDA $bfe7 ; (j + 1)
170a : 69 00 __ ADC #$00
170c : 4c ec 16 JMP $16ec ; (benchmark_delay.l8 + 0)
--------------------------------------------------------------------
170f : __ __ __ BYT 74 55 52 42 4f 00                               : tURBO.
--------------------------------------------------------------------
1715 : __ __ __ BYT 6e 4f 54 20 44 45 54 45 43 54 45 44 20 28 31 20 : nOT DETECTED (1 
1725 : __ __ __ BYT 6d 68 5a 29 00                                  : mhZ).
--------------------------------------------------------------------
172a : __ __ __ BYT 65 4e 41 42 4c 45 20 54 55 52 42 4f 20 49 4e 20 : eNABLE TURBO IN 
173a : __ __ __ BYT 75 4c 54 49 4d 41 54 45 20 46 49 52 4d 57 41 52 : uLTIMATE FIRMWAR
174a : __ __ __ BYT 45 00                                           : E.
--------------------------------------------------------------------
174c : __ __ __ BYT 36 34 20 6d 68 5a 00                            : 64 mhZ.
--------------------------------------------------------------------
turbo_get: ; turbo_get()->u8
; 149, "/home/xahmol/git/UltimateDemo2026/include/turbo.h"
.s3:
1753 : ad 31 d0 LDA $d031 
1756 : 60 __ __ RTS
--------------------------------------------------------------------
1757 : __ __ __ BYT 34 38 20 6d 68 5a 00                            : 48 mhZ.
--------------------------------------------------------------------
175e : __ __ __ BYT 34 30 20 6d 68 5a 00                            : 40 mhZ.
--------------------------------------------------------------------
1765 : __ __ __ BYT 33 36 20 6d 68 5a 00                            : 36 mhZ.
--------------------------------------------------------------------
176c : __ __ __ BYT 33 32 20 6d 68 5a 00                            : 32 mhZ.
--------------------------------------------------------------------
1773 : __ __ __ BYT 32 38 20 6d 68 5a 00                            : 28 mhZ.
--------------------------------------------------------------------
177a : __ __ __ BYT 32 34 20 6d 68 5a 00                            : 24 mhZ.
--------------------------------------------------------------------
1781 : __ __ __ BYT 32 30 20 6d 68 5a 00                            : 20 mhZ.
--------------------------------------------------------------------
1788 : __ __ __ BYT 31 36 20 6d 68 5a 00                            : 16 mhZ.
--------------------------------------------------------------------
178f : __ __ __ BYT 31 32 20 6d 68 5a 00                            : 12 mhZ.
--------------------------------------------------------------------
1796 : __ __ __ BYT 38 20 6d 68 5a 00                               : 8 mhZ.
--------------------------------------------------------------------
179c : __ __ __ BYT 63 48 45 43 4b 49 4e 47 20 75 4c 54 49 4d 41 54 : cHECKING uLTIMAT
17ac : __ __ __ BYT 45 20 61 55 44 49 4f 2e 2e 2e 00                : E aUDIO....
--------------------------------------------------------------------
audio_detect: ; audio_detect()->u8
;  92, "/home/xahmol/git/UltimateDemo2026/include/audio.h"
.s4:
17b7 : 78 __ __ SEI
17b8 : a2 00 __ LDX #$00
17ba : 86 43 __ STX T0 + 0 
.l15:
17bc : bd e3 7c LDA $7ce3,x ; (audio_ch_base[0] + 1)
17bf : 85 44 __ STA T0 + 1 
17c1 : a9 00 __ LDA #$00
17c3 : bc e2 7c LDY $7ce2,x ; (audio_ch_base[0] + 0)
17c6 : 91 43 __ STA (T0 + 0),y 
17c8 : e8 __ __ INX
17c9 : e8 __ __ INX
17ca : e0 0e __ CPX #$0e
17cc : d0 ee __ BNE $17bc ; (audio_detect.l15 + 0)
.s16:
17ce : a9 ff __ LDA #$ff
17d0 : 8d 3f df STA $df3f 
17d3 : a2 00 __ LDX #$00
17d5 : ad 20 df LDA $df20 
17d8 : d0 08 __ BNE $17e2 ; (audio_detect.s14 + 0)
.l6:
17da : ca __ __ DEX
17db : f0 09 __ BEQ $17e6 ; (audio_detect.s7 + 0)
.s5:
17dd : ad 20 df LDA $df20 
17e0 : f0 f8 __ BEQ $17da ; (audio_detect.l6 + 0)
.s14:
17e2 : 58 __ __ CLI
.s17:
17e3 : a9 00 __ LDA #$00
.s3:
17e5 : 60 __ __ RTS
.s7:
17e6 : 8d 21 df STA $df21 
17e9 : a9 01 __ LDA #$01
17eb : 8d 24 df STA $df24 
17ee : 8e 25 df STX $df25 
17f1 : 8e 26 df STX $df26 
17f4 : 8e 27 df STX $df27 
17f7 : 8e 2e df STX $df2e 
17fa : 8e 29 df STX $df29 
17fd : 8d 2f df STA $df2f 
1800 : 8d 2a df STA $df2a 
1803 : 8e 2b df STX $df2b 
1806 : a9 05 __ LDA #$05
1808 : 8d 20 df STA $df20 
180b : a2 80 __ LDX #$80
180d : ad 20 df LDA $df20 
1810 : d0 08 __ BNE $181a ; (audio_detect.l10 + 0)
.l9:
1812 : ca __ __ DEX
1813 : f0 05 __ BEQ $181a ; (audio_detect.l10 + 0)
.s8:
1815 : ad 20 df LDA $df20 
1818 : f0 f8 __ BEQ $1812 ; (audio_detect.l9 + 0)
.l10:
181a : ac 20 df LDY $df20 
181d : 88 __ __ DEY
181e : d0 0c __ BNE $182c ; (audio_detect.s13 + 0)
.s11:
1820 : ca __ __ DEX
1821 : d0 f7 __ BNE $181a ; (audio_detect.l10 + 0)
.s12:
1823 : a9 ff __ LDA #$ff
1825 : 8d 3f df STA $df3f 
1828 : 58 __ __ CLI
1829 : a9 01 __ LDA #$01
182b : 60 __ __ RTS
.s13:
182c : 58 __ __ CLI
182d : a9 00 __ LDA #$00
182f : 60 __ __ RTS
--------------------------------------------------------------------
1830 : __ __ __ BYT 61 55 44 49 4f 00                               : aUDIO.
--------------------------------------------------------------------
1836 : __ __ __ BYT 6d 4f 44 55 4c 45 20 4e 4f 54 20 46 4f 55 4e 44 : mODULE NOT FOUND
1846 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1847 : __ __ __ BYT 66 32 20 3e 20 63 36 34 2f 63 41 52 54 20 53 45 : f2 > c64/cART SE
1857 : __ __ __ BYT 54 54 49 4e 47 53 20 3e 20 61 55 44 49 4f 00    : TTINGS > aUDIO.
--------------------------------------------------------------------
fmt_dec: ; fmt_dec(u8*,u8)->void
;  55, "/home/xahmol/git/UltimateDemo2026/src/main.c"
.s4:
1866 : a5 0f __ LDA P2 ; (val + 0)
1868 : c9 64 __ CMP #$64
186a : b0 04 __ BCS $1870 ; (fmt_dec.s7 + 0)
.s5:
186c : a0 00 __ LDY #$00
186e : 90 1d __ BCC $188d ; (fmt_dec.s6 + 0)
.s7:
1870 : 85 1b __ STA ACCU + 0 
1872 : a9 00 __ LDA #$00
1874 : 85 1c __ STA ACCU + 1 
1876 : 85 04 __ STA WORK + 1 
1878 : a9 64 __ LDA #$64
187a : 85 03 __ STA WORK + 0 
187c : 20 8d 78 JSR $788d ; (divmod + 0)
187f : 18 __ __ CLC
1880 : a5 1b __ LDA ACCU + 0 
1882 : 69 30 __ ADC #$30
1884 : a0 00 __ LDY #$00
1886 : 91 0d __ STA (P0),y ; (buf + 0)
1888 : a5 05 __ LDA WORK + 2 
188a : 85 0f __ STA P2 ; (val + 0)
188c : c8 __ __ INY
.s6:
188d : 84 43 __ STY T1 + 0 
188f : a9 00 __ LDA #$00
1891 : c8 __ __ INY
1892 : c8 __ __ INY
1893 : 91 0d __ STA (P0),y ; (buf + 0)
1895 : 85 1c __ STA ACCU + 1 
1897 : 85 04 __ STA WORK + 1 
1899 : a5 0f __ LDA P2 ; (val + 0)
189b : 85 1b __ STA ACCU + 0 
189d : a9 0a __ LDA #$0a
189f : 85 03 __ STA WORK + 0 
18a1 : 20 8d 78 JSR $788d ; (divmod + 0)
18a4 : 18 __ __ CLC
18a5 : a5 1b __ LDA ACCU + 0 
18a7 : 69 30 __ ADC #$30
18a9 : a4 43 __ LDY T1 + 0 
18ab : 91 0d __ STA (P0),y ; (buf + 0)
18ad : 18 __ __ CLC
18ae : a5 05 __ LDA WORK + 2 
18b0 : 69 30 __ ADC #$30
18b2 : c8 __ __ INY
18b3 : 91 0d __ STA (P0),y ; (buf + 0)
.s3:
18b5 : 60 __ __ RTS
--------------------------------------------------------------------
strcat: ; strcat(u8*,const u8*)->void
;  14, "/home/xahmol/oscar64/include/string.h"
.s4:
18b6 : a5 0d __ LDA P0 ; (dst + 0)
18b8 : 85 1b __ STA ACCU + 0 
18ba : a5 0e __ LDA P1 ; (dst + 1)
18bc : 85 1c __ STA ACCU + 1 
18be : a0 00 __ LDY #$00
18c0 : b1 0d __ LDA (P0),y ; (dst + 0)
18c2 : f0 0f __ BEQ $18d3 ; (strcat.s5 + 0)
.s6:
18c4 : 84 1b __ STY ACCU + 0 
18c6 : a4 0d __ LDY P0 ; (dst + 0)
.l7:
18c8 : c8 __ __ INY
18c9 : d0 02 __ BNE $18cd ; (strcat.s11 + 0)
.s10:
18cb : e6 1c __ INC ACCU + 1 
.s11:
18cd : b1 1b __ LDA (ACCU + 0),y 
18cf : d0 f7 __ BNE $18c8 ; (strcat.l7 + 0)
.s8:
18d1 : 84 1b __ STY ACCU + 0 
.s5:
18d3 : a8 __ __ TAY
.l9:
18d4 : b1 0f __ LDA (P2),y ; (src + 0)
18d6 : 91 1b __ STA (ACCU + 0),y 
18d8 : aa __ __ TAX
18d9 : e6 0f __ INC P2 ; (src + 0)
18db : d0 02 __ BNE $18df ; (strcat.s13 + 0)
.s12:
18dd : e6 10 __ INC P3 ; (src + 1)
.s13:
18df : e6 1b __ INC ACCU + 0 
18e1 : d0 02 __ BNE $18e5 ; (strcat.s15 + 0)
.s14:
18e3 : e6 1c __ INC ACCU + 1 
.s15:
18e5 : 8a __ __ TXA
18e6 : d0 ec __ BNE $18d4 ; (strcat.l9 + 0)
.s3:
18e8 : 60 __ __ RTS
--------------------------------------------------------------------
18e9 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 4d 55 53 49 43 2e 2e 2e : lOADING MUSIC...
18f9 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
modplay_load: ; modplay_load(u8*,u32)->u8
; 209, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s4:
18fa : 20 66 19 JSR $1966 ; (uii_open_file.s4 + 0)
18fd : ad c9 95 LDA $95c9 ; (uii_status[0] + 0)
1900 : c9 30 __ CMP #$30
1902 : d0 07 __ BNE $190b ; (modplay_load.s15 + 0)
.s5:
1904 : ad ca 95 LDA $95ca ; (uii_status[0] + 1)
1907 : c9 30 __ CMP #$30
1909 : f0 05 __ BEQ $1910 ; (modplay_load.s6 + 0)
.s15:
190b : a9 00 __ LDA #$00
.s3:
190d : 85 1b __ STA ACCU + 0 
190f : 60 __ __ RTS
.s6:
1910 : a9 00 __ LDA #$00
1912 : 85 48 __ STA T0 + 0 
1914 : 85 4b __ STA T0 + 3 
1916 : a8 __ __ TAY
1917 : aa __ __ TAX
1918 : a9 10 __ LDA #$10
191a : 85 4c __ STA T2 + 0 
.l7:
191c : 86 13 __ STX P6 
191e : 84 12 __ STY P5 
1920 : a5 48 __ LDA T0 + 0 
1922 : 85 11 __ STA P4 
1924 : a5 4b __ LDA T0 + 3 
1926 : 85 14 __ STA P7 
1928 : 20 f4 19 JSR $19f4 ; (uii_load_reu.s4 + 0)
192b : 18 __ __ CLC
192c : a5 11 __ LDA P4 
192e : 69 ff __ ADC #$ff
1930 : 85 48 __ STA T0 + 0 
1932 : a5 12 __ LDA P5 
1934 : 69 7f __ ADC #$7f
1936 : a8 __ __ TAY
1937 : a5 13 __ LDA P6 
1939 : 69 00 __ ADC #$00
193b : aa __ __ TAX
193c : a5 14 __ LDA P7 
193e : 69 00 __ ADC #$00
1940 : 85 4b __ STA T0 + 3 
1942 : ad c9 95 LDA $95c9 ; (uii_status[0] + 0)
1945 : c9 30 __ CMP #$30
1947 : d0 0b __ BNE $1954 ; (modplay_load.s10 + 0)
.s8:
1949 : ad ca 95 LDA $95ca ; (uii_status[0] + 1)
194c : c9 30 __ CMP #$30
194e : d0 04 __ BNE $1954 ; (modplay_load.s10 + 0)
.s9:
1950 : c6 4c __ DEC T2 + 0 
1952 : d0 c8 __ BNE $191c ; (modplay_load.l7 + 0)
.s10:
1954 : a5 4b __ LDA T0 + 3 
1956 : d0 0a __ BNE $1962 ; (modplay_load.s11 + 0)
.s12:
1958 : 8a __ __ TXA
1959 : d0 07 __ BNE $1962 ; (modplay_load.s11 + 0)
.s13:
195b : 98 __ __ TYA
195c : d0 04 __ BNE $1962 ; (modplay_load.s11 + 0)
.s14:
195e : c5 48 __ CMP T0 + 0 
1960 : b0 ab __ BCS $190d ; (modplay_load.s3 + 0)
.s11:
1962 : a9 01 __ LDA #$01
1964 : d0 a7 __ BNE $190d ; (modplay_load.s3 + 0)
--------------------------------------------------------------------
uii_open_file: ; uii_open_file(u8,u8*)->void
;  31, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
1966 : a9 f0 __ LDA #$f0
1968 : 85 0d __ STA P0 
196a : 20 cb 7c JSR $7ccb ; (strlen@proxy + 0)
196d : 18 __ __ CLC
196e : a5 1b __ LDA ACCU + 0 
1970 : 69 03 __ ADC #$03
1972 : 85 1b __ STA ACCU + 0 
1974 : 90 02 __ BCC $1978 ; (uii_open_file.s11 + 0)
.s10:
1976 : e6 1c __ INC ACCU + 1 
.s11:
1978 : 20 c9 79 JSR $79c9 ; (crt_malloc + 0)
197b : a5 1c __ LDA ACCU + 1 
197d : 05 1b __ ORA ACCU + 0 
197f : d0 01 __ BNE $1982 ; (uii_open_file.s5 + 0)
.s3:
1981 : 60 __ __ RTS
.s5:
1982 : a5 1c __ LDA ACCU + 1 
1984 : 85 47 __ STA T2 + 1 
1986 : a5 1b __ LDA ACCU + 0 
1988 : 85 46 __ STA T2 + 0 
198a : a9 00 __ LDA #$00
198c : a8 __ __ TAY
198d : 91 1b __ STA (ACCU + 0),y 
198f : a9 7c __ LDA #$7c
1991 : 85 0e __ STA P1 
1993 : a9 02 __ LDA #$02
1995 : c8 __ __ INY
1996 : 91 1b __ STA (ACCU + 0),y 
1998 : 98 __ __ TYA
1999 : c8 __ __ INY
199a : 91 1b __ STA (ACCU + 0),y 
199c : 20 c1 10 JSR $10c1 ; (strlen.s4 + 0)
199f : a5 1b __ LDA ACCU + 0 
19a1 : 05 1c __ ORA ACCU + 1 
19a3 : f0 23 __ BEQ $19c8 ; (uii_open_file.s6 + 0)
.s7:
19a5 : a9 00 __ LDA #$00
19a7 : 85 45 __ STA T1 + 0 
.l9:
19a9 : a9 7c __ LDA #$7c
19ab : 85 0e __ STA P1 
19ad : a6 45 __ LDX T1 + 0 
19af : 8a __ __ TXA
19b0 : 18 __ __ CLC
19b1 : 69 03 __ ADC #$03
19b3 : a8 __ __ TAY
19b4 : bd f0 7c LDA $7cf0,x ; (mod_file[0] + 0)
19b7 : 91 46 __ STA (T2 + 0),y 
19b9 : 20 c1 10 JSR $10c1 ; (strlen.s4 + 0)
19bc : e6 45 __ INC T1 + 0 
19be : a5 1c __ LDA ACCU + 1 
19c0 : d0 e7 __ BNE $19a9 ; (uii_open_file.l9 + 0)
.s8:
19c2 : a5 45 __ LDA T1 + 0 
19c4 : c5 1b __ CMP ACCU + 0 
19c6 : 90 e1 __ BCC $19a9 ; (uii_open_file.l9 + 0)
.s6:
19c8 : a9 01 __ LDA #$01
19ca : 8d ff 12 STA $12ff ; (uii_target + 0)
19cd : 20 cb 7c JSR $7ccb ; (strlen@proxy + 0)
19d0 : a5 46 __ LDA T2 + 0 
19d2 : 85 0d __ STA P0 
19d4 : a5 47 __ LDA T2 + 1 
19d6 : 85 0e __ STA P1 
19d8 : 18 __ __ CLC
19d9 : a5 1b __ LDA ACCU + 0 
19db : 69 03 __ ADC #$03
19dd : 85 0f __ STA P2 
19df : a5 1c __ LDA ACCU + 1 
19e1 : 69 00 __ ADC #$00
19e3 : 85 10 __ STA P3 
19e5 : 20 25 13 JSR $1325 ; (uii_sendcommand.s4 + 0)
19e8 : 20 c1 7a JSR $7ac1 ; (crt_free@proxy + 0)
19eb : 20 a0 13 JSR $13a0 ; (uii_readdata.s4 + 0)
19ee : 20 d0 13 JSR $13d0 ; (uii_readstatus.s4 + 0)
19f1 : 4c 2e 14 JMP $142e ; (uii_accept.s4 + 0)
--------------------------------------------------------------------
uii_load_reu: ; uii_load_reu(u32,u32)->void
;  46, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
19f4 : a9 00 __ LDA #$00
19f6 : 85 10 __ STA P3 
19f8 : 8d e0 bf STA $bfe0 ; (cmd[0] + 0)
19fb : 8d e8 bf STA $bfe8 ; (cmd[0] + 8)
19fe : 8d e9 bf STA $bfe9 ; (cmd[0] + 9)
1a01 : a9 0a __ LDA #$0a
1a03 : 85 0f __ STA P2 
1a05 : a9 01 __ LDA #$01
1a07 : 8d ff 12 STA $12ff ; (uii_target + 0)
1a0a : a9 21 __ LDA #$21
1a0c : 8d e1 bf STA $bfe1 ; (cmd[0] + 1)
1a0f : a9 ff __ LDA #$ff
1a11 : 8d e6 bf STA $bfe6 ; (cmd[0] + 6)
1a14 : a9 7f __ LDA #$7f
1a16 : 8d e7 bf STA $bfe7 ; (cmd[0] + 7)
1a19 : a5 11 __ LDA P4 ; (reu_addr + 0)
1a1b : 8d e2 bf STA $bfe2 ; (cmd[0] + 2)
1a1e : a5 12 __ LDA P5 ; (reu_addr + 1)
1a20 : 8d e3 bf STA $bfe3 ; (cmd[0] + 3)
1a23 : a5 13 __ LDA P6 ; (reu_addr + 2)
1a25 : 8d e4 bf STA $bfe4 ; (cmd[0] + 4)
1a28 : a5 14 __ LDA P7 ; (reu_addr + 3)
1a2a : 8d e5 bf STA $bfe5 ; (cmd[0] + 5)
1a2d : a9 e0 __ LDA #$e0
1a2f : 85 0d __ STA P0 
1a31 : a9 bf __ LDA #$bf
1a33 : 85 0e __ STA P1 
1a35 : 20 25 13 JSR $1325 ; (uii_sendcommand.s4 + 0)
1a38 : 20 a0 13 JSR $13a0 ; (uii_readdata.s4 + 0)
1a3b : 20 d0 13 JSR $13d0 ; (uii_readstatus.s4 + 0)
1a3e : 4c 2e 14 JMP $142e ; (uii_accept.s4 + 0)
--------------------------------------------------------------------
uii_scan_media: ; uii_scan_media(u8[]*,u8*)->void
;  75, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
1a41 : a9 00 __ LDA #$00
1a43 : a8 __ __ TAY
1a44 : 91 15 __ STA (P8),y ; (count + 0)
1a46 : a9 fd __ LDA #$fd
1a48 : 85 11 __ STA P4 
1a4a : a9 76 __ LDA #$76
1a4c : 85 12 __ STA P5 
1a4e : 20 8e 1b JSR $1b8e ; (uii_change_dir.s4 + 0)
1a51 : a9 00 __ LDA #$00
1a53 : 85 10 __ STA P3 
1a55 : 8d e8 bf STA $bfe8 ; (cmd[0] + 0)
1a58 : a9 02 __ LDA #$02
1a5a : 85 0f __ STA P2 
1a5c : a9 01 __ LDA #$01
1a5e : 8d ff 12 STA $12ff ; (uii_target + 0)
1a61 : a9 13 __ LDA #$13
1a63 : 8d e9 bf STA $bfe9 ; (cmd[0] + 1)
1a66 : a9 e8 __ LDA #$e8
1a68 : 85 0d __ STA P0 
1a6a : a9 bf __ LDA #$bf
1a6c : 85 0e __ STA P1 
1a6e : 20 25 13 JSR $1325 ; (uii_sendcommand.s4 + 0)
1a71 : 20 d0 13 JSR $13d0 ; (uii_readstatus.s4 + 0)
1a74 : 20 2e 14 JSR $142e ; (uii_accept.s4 + 0)
1a77 : ad c9 95 LDA $95c9 ; (uii_status[0] + 0)
1a7a : c9 30 __ CMP #$30
1a7c : d0 70 __ BNE $1aee ; (uii_scan_media.s3 + 0)
.s5:
1a7e : ad ca 95 LDA $95ca ; (uii_status[0] + 1)
1a81 : c9 30 __ CMP #$30
1a83 : d0 69 __ BNE $1aee ; (uii_scan_media.s3 + 0)
.s6:
1a85 : a9 01 __ LDA #$01
1a87 : 8d ff 12 STA $12ff ; (uii_target + 0)
1a8a : a9 00 __ LDA #$00
1a8c : 8d e6 bf STA $bfe6 ; (cmd[0] + 0)
1a8f : a9 14 __ LDA #$14
1a91 : 8d e7 bf STA $bfe7 ; (cmd[0] + 1)
1a94 : a9 e6 __ LDA #$e6
1a96 : 85 0d __ STA P0 
1a98 : a9 bf __ LDA #$bf
1a9a : 85 0e __ STA P1 
1a9c : 20 25 13 JSR $1325 ; (uii_sendcommand.s4 + 0)
1a9f : 2c 1c df BIT $df1c 
1aa2 : 10 4a __ BPL $1aee ; (uii_scan_media.s3 + 0)
.l8:
1aa4 : 20 a0 13 JSR $13a0 ; (uii_readdata.s4 + 0)
1aa7 : 20 2e 14 JSR $142e ; (uii_accept.s4 + 0)
1aaa : ad c8 93 LDA $93c8 ; (uii_data[0] + 0)
1aad : 29 10 __ AND #$10
1aaf : f0 38 __ BEQ $1ae9 ; (uii_scan_media.s7 + 0)
.s9:
1ab1 : ad c9 93 LDA $93c9 ; (uii_data[0] + 1)
1ab4 : f0 33 __ BEQ $1ae9 ; (uii_scan_media.s7 + 0)
.s10:
1ab6 : 20 2d 1c JSR $1c2d ; (_uii_lc.s4 + 0)
1ab9 : 85 49 __ STA T3 + 0 
1abb : ad ca 93 LDA $93ca ; (uii_data[0] + 2)
1abe : 20 2d 1c JSR $1c2d ; (_uii_lc.s4 + 0)
1ac1 : 85 4a __ STA T4 + 0 
1ac3 : ad cb 93 LDA $93cb ; (uii_data[0] + 3)
1ac6 : 20 2d 1c JSR $1c2d ; (_uii_lc.s4 + 0)
1ac9 : aa __ __ TAX
1aca : a5 49 __ LDA T3 + 0 
1acc : c9 73 __ CMP #$73
1ace : d0 03 __ BNE $1ad3 ; (uii_scan_media.s18 + 0)
1ad0 : 4c 82 1b JMP $1b82 ; (uii_scan_media.s11 + 0)
.s18:
1ad3 : c9 75 __ CMP #$75
1ad5 : d0 12 __ BNE $1ae9 ; (uii_scan_media.s7 + 0)
.s19:
1ad7 : a5 4a __ LDA T4 + 0 
1ad9 : c9 73 __ CMP #$73
1adb : d0 0c __ BNE $1ae9 ; (uii_scan_media.s7 + 0)
.s20:
1add : e0 62 __ CPX #$62
1adf : d0 08 __ BNE $1ae9 ; (uii_scan_media.s7 + 0)
.s12:
1ae1 : a0 00 __ LDY #$00
1ae3 : b1 15 __ LDA (P8),y ; (count + 0)
1ae5 : c9 05 __ CMP #$05
1ae7 : 90 06 __ BCC $1aef ; (uii_scan_media.s13 + 0)
.s7:
1ae9 : 2c 1c df BIT $df1c 
1aec : 30 b6 __ BMI $1aa4 ; (uii_scan_media.l8 + 0)
.s3:
1aee : 60 __ __ RTS
.s13:
1aef : aa __ __ TAX
1af0 : a9 2f __ LDA #$2f
1af2 : bc c8 7b LDY $7bc8,x ; (__multab16L + 0)
1af5 : 91 13 __ STA (P6),y ; (drives + 0)
1af7 : a9 00 __ LDA #$00
1af9 : 85 4b __ STA T5 + 0 
.l14:
1afb : a6 4b __ LDX T5 + 0 
1afd : bd c9 93 LDA $93c9,x ; (uii_data[0] + 1)
1b00 : f0 04 __ BEQ $1b06 ; (uii_scan_media.s15 + 0)
.s16:
1b02 : e0 0d __ CPX #$0d
1b04 : 90 52 __ BCC $1b58 ; (uii_scan_media.s17 + 0)
.s15:
1b06 : a0 00 __ LDY #$00
1b08 : b1 15 __ LDA (P8),y ; (count + 0)
1b0a : 0a __ __ ASL
1b0b : 2a __ __ ROL
1b0c : 2a __ __ ROL
1b0d : 2a __ __ ROL
1b0e : aa __ __ TAX
1b0f : 29 07 __ AND #$07
1b11 : 2a __ __ ROL
1b12 : a8 __ __ TAY
1b13 : 8a __ __ TXA
1b14 : 29 f0 __ AND #$f0
1b16 : 65 13 __ ADC P6 ; (drives + 0)
1b18 : 85 43 __ STA T0 + 0 
1b1a : 98 __ __ TYA
1b1b : 65 14 __ ADC P7 ; (drives + 1)
1b1d : 85 44 __ STA T0 + 1 
1b1f : a9 2f __ LDA #$2f
1b21 : a4 4b __ LDY T5 + 0 
1b23 : c8 __ __ INY
1b24 : 91 43 __ STA (T0 + 0),y 
1b26 : a0 00 __ LDY #$00
1b28 : b1 15 __ LDA (P8),y ; (count + 0)
1b2a : 0a __ __ ASL
1b2b : 2a __ __ ROL
1b2c : 2a __ __ ROL
1b2d : 2a __ __ ROL
1b2e : aa __ __ TAX
1b2f : 29 07 __ AND #$07
1b31 : 2a __ __ ROL
1b32 : a8 __ __ TAY
1b33 : 8a __ __ TXA
1b34 : 29 f0 __ AND #$f0
1b36 : 65 13 __ ADC P6 ; (drives + 0)
1b38 : 85 43 __ STA T0 + 0 
1b3a : 98 __ __ TYA
1b3b : 65 14 __ ADC P7 ; (drives + 1)
1b3d : 85 44 __ STA T0 + 1 
1b3f : a9 00 __ LDA #$00
1b41 : a4 4b __ LDY T5 + 0 
1b43 : c8 __ __ INY
1b44 : c8 __ __ INY
1b45 : 91 43 __ STA (T0 + 0),y 
1b47 : a8 __ __ TAY
1b48 : b1 15 __ LDA (P8),y ; (count + 0)
1b4a : 18 __ __ CLC
1b4b : 69 01 __ ADC #$01
1b4d : 91 15 __ STA (P8),y ; (count + 0)
1b4f : 2c 1c df BIT $df1c 
1b52 : 10 03 __ BPL $1b57 ; (uii_scan_media.s15 + 81)
1b54 : 4c a4 1a JMP $1aa4 ; (uii_scan_media.l8 + 0)
1b57 : 60 __ __ RTS
.s17:
1b58 : 20 2d 1c JSR $1c2d ; (_uii_lc.s4 + 0)
1b5b : aa __ __ TAX
1b5c : a0 00 __ LDY #$00
1b5e : b1 15 __ LDA (P8),y ; (count + 0)
1b60 : 0a __ __ ASL
1b61 : 2a __ __ ROL
1b62 : 2a __ __ ROL
1b63 : 2a __ __ ROL
1b64 : a8 __ __ TAY
1b65 : 29 07 __ AND #$07
1b67 : 2a __ __ ROL
1b68 : 85 44 __ STA T0 + 1 
1b6a : 98 __ __ TYA
1b6b : 29 f0 __ AND #$f0
1b6d : 65 13 __ ADC P6 ; (drives + 0)
1b6f : 85 43 __ STA T0 + 0 
1b71 : a5 44 __ LDA T0 + 1 
1b73 : 65 14 __ ADC P7 ; (drives + 1)
1b75 : 85 44 __ STA T0 + 1 
1b77 : 8a __ __ TXA
1b78 : a4 4b __ LDY T5 + 0 
1b7a : c8 __ __ INY
1b7b : 84 4b __ STY T5 + 0 
1b7d : 91 43 __ STA (T0 + 0),y 
1b7f : 4c fb 1a JMP $1afb ; (uii_scan_media.l14 + 0)
.s11:
1b82 : a5 4a __ LDA T4 + 0 
1b84 : c9 64 __ CMP #$64
1b86 : f0 03 __ BEQ $1b8b ; (uii_scan_media.s11 + 9)
1b88 : 4c e9 1a JMP $1ae9 ; (uii_scan_media.s7 + 0)
1b8b : 4c e1 1a JMP $1ae1 ; (uii_scan_media.s12 + 0)
--------------------------------------------------------------------
uii_change_dir: ; uii_change_dir(u8*)->void
;  25, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
1b8e : a5 11 __ LDA P4 ; (directory + 0)
1b90 : 85 0d __ STA P0 
1b92 : 20 bd 10 JSR $10bd ; (strlen@proxy + 0)
1b95 : 18 __ __ CLC
1b96 : a5 1b __ LDA ACCU + 0 
1b98 : 69 02 __ ADC #$02
1b9a : 85 1b __ STA ACCU + 0 
1b9c : 90 02 __ BCC $1ba0 ; (uii_change_dir.s11 + 0)
.s10:
1b9e : e6 1c __ INC ACCU + 1 
.s11:
1ba0 : 20 c9 79 JSR $79c9 ; (crt_malloc + 0)
1ba3 : a5 1c __ LDA ACCU + 1 
1ba5 : 05 1b __ ORA ACCU + 0 
1ba7 : d0 01 __ BNE $1baa ; (uii_change_dir.s5 + 0)
.s3:
1ba9 : 60 __ __ RTS
.s5:
1baa : a5 1c __ LDA ACCU + 1 
1bac : 85 46 __ STA T2 + 1 
1bae : a5 1b __ LDA ACCU + 0 
1bb0 : 85 45 __ STA T2 + 0 
1bb2 : a9 00 __ LDA #$00
1bb4 : a8 __ __ TAY
1bb5 : 91 1b __ STA (ACCU + 0),y 
1bb7 : a9 11 __ LDA #$11
1bb9 : c8 __ __ INY
1bba : 91 1b __ STA (ACCU + 0),y 
1bbc : a9 00 __ LDA #$00
1bbe : 85 47 __ STA T3 + 0 
1bc0 : 85 48 __ STA T3 + 1 
.l12:
1bc2 : 20 bd 10 JSR $10bd ; (strlen@proxy + 0)
1bc5 : a5 48 __ LDA T3 + 1 
1bc7 : c5 1c __ CMP ACCU + 1 
1bc9 : d0 5c __ BNE $1c27 ; (uii_change_dir.s9 + 0)
.s8:
1bcb : a5 47 __ LDA T3 + 0 
1bcd : c5 1b __ CMP ACCU + 0 
1bcf : 90 2d __ BCC $1bfe ; (uii_change_dir.s7 + 0)
.s6:
1bd1 : a5 12 __ LDA P5 ; (directory + 1)
1bd3 : 85 0e __ STA P1 
1bd5 : a9 01 __ LDA #$01
1bd7 : 8d ff 12 STA $12ff ; (uii_target + 0)
1bda : 20 c1 10 JSR $10c1 ; (strlen.s4 + 0)
1bdd : a5 45 __ LDA T2 + 0 
1bdf : 85 0d __ STA P0 
1be1 : a5 46 __ LDA T2 + 1 
1be3 : 85 0e __ STA P1 
1be5 : 18 __ __ CLC
1be6 : a5 1b __ LDA ACCU + 0 
1be8 : 69 02 __ ADC #$02
1bea : 85 0f __ STA P2 
1bec : a5 1c __ LDA ACCU + 1 
1bee : 69 00 __ ADC #$00
1bf0 : 85 10 __ STA P3 
1bf2 : 20 25 13 JSR $1325 ; (uii_sendcommand.s4 + 0)
1bf5 : 20 c1 7a JSR $7ac1 ; (crt_free@proxy + 0)
1bf8 : 20 d0 13 JSR $13d0 ; (uii_readstatus.s4 + 0)
1bfb : 4c 2e 14 JMP $142e ; (uii_accept.s4 + 0)
.s7:
1bfe : 85 43 __ STA T0 + 0 
1c00 : 18 __ __ CLC
1c01 : a5 12 __ LDA P5 ; (directory + 1)
1c03 : 65 48 __ ADC T3 + 1 
1c05 : 85 44 __ STA T0 + 1 
1c07 : a4 11 __ LDY P4 ; (directory + 0)
1c09 : b1 43 __ LDA (T0 + 0),y 
1c0b : aa __ __ TAX
1c0c : 18 __ __ CLC
1c0d : a5 45 __ LDA T2 + 0 
1c0f : 65 47 __ ADC T3 + 0 
1c11 : 85 43 __ STA T0 + 0 
1c13 : a5 46 __ LDA T2 + 1 
1c15 : 65 48 __ ADC T3 + 1 
1c17 : 85 44 __ STA T0 + 1 
1c19 : 8a __ __ TXA
1c1a : a0 02 __ LDY #$02
1c1c : 91 43 __ STA (T0 + 0),y 
1c1e : e6 47 __ INC T3 + 0 
1c20 : d0 a0 __ BNE $1bc2 ; (uii_change_dir.l12 + 0)
.s13:
1c22 : e6 48 __ INC T3 + 1 
1c24 : 4c c2 1b JMP $1bc2 ; (uii_change_dir.l12 + 0)
.s9:
1c27 : b0 a8 __ BCS $1bd1 ; (uii_change_dir.s6 + 0)
.s14:
1c29 : a5 47 __ LDA T3 + 0 
1c2b : 90 d1 __ BCC $1bfe ; (uii_change_dir.s7 + 0)
--------------------------------------------------------------------
_uii_lc: ; _uii_lc(u8)->u8
; 925, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.c"
.s4:
1c2d : c9 41 __ CMP #$41
1c2f : 90 06 __ BCC $1c37 ; (_uii_lc.s3 + 0)
.s5:
1c31 : c9 5b __ CMP #$5b
1c33 : b0 02 __ BCS $1c37 ; (_uii_lc.s3 + 0)
.s6:
1c35 : 09 20 __ ORA #$20
.s3:
1c37 : 60 __ __ RTS
--------------------------------------------------------------------
uii_find_media_path: ; uii_find_media_path(u8[]*,u8,u8*,u8*)->u8
;  82, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
1c38 : a9 00 __ LDA #$00
1c3a : a8 __ __ TAY
1c3b : 91 16 __ STA (P9),y ; (result + 0)
1c3d : a9 32 __ LDA #$32
1c3f : 85 0d __ STA P0 
1c41 : a9 7d __ LDA #$7d
1c43 : 85 0e __ STA P1 
1c45 : 20 c1 10 JSR $10c1 ; (strlen.s4 + 0)
1c48 : a5 15 __ LDA P8 ; (drv_count + 0)
1c4a : d0 03 __ BNE $1c4f ; (uii_find_media_path.s6 + 0)
1c4c : 4c e5 1c JMP $1ce5 ; (uii_find_media_path.s5 + 0)
.s6:
1c4f : a5 1b __ LDA ACCU + 0 
1c51 : 85 49 __ STA T2 + 0 
1c53 : 18 __ __ CLC
1c54 : 69 01 __ ADC #$01
1c56 : 85 4a __ STA T3 + 0 
1c58 : a9 00 __ LDA #$00
1c5a : 2a __ __ ROL
1c5b : 85 4b __ STA T3 + 1 
1c5d : a9 00 __ LDA #$00
1c5f : 85 4f __ STA T8 + 0 
.l7:
1c61 : 0a __ __ ASL
1c62 : 2a __ __ ROL
1c63 : 2a __ __ ROL
1c64 : 2a __ __ ROL
1c65 : a8 __ __ TAY
1c66 : 29 07 __ AND #$07
1c68 : 2a __ __ ROL
1c69 : aa __ __ TAX
1c6a : 98 __ __ TYA
1c6b : 29 f0 __ AND #$f0
1c6d : 65 13 __ ADC P6 ; (drives + 0)
1c6f : 85 0d __ STA P0 
1c71 : 8a __ __ TXA
1c72 : 65 14 __ ADC P7 ; (drives + 1)
1c74 : 85 4d __ STA T5 + 1 
1c76 : 85 0e __ STA P1 
1c78 : 20 c1 10 JSR $10c1 ; (strlen.s4 + 0)
1c7b : 18 __ __ CLC
1c7c : a5 1b __ LDA ACCU + 0 
1c7e : 65 49 __ ADC T2 + 0 
1c80 : c9 7f __ CMP #$7f
1c82 : b0 56 __ BCS $1cda ; (uii_find_media_path.s9 + 0)
.s8:
1c84 : a5 1b __ LDA ACCU + 0 
1c86 : 85 11 __ STA P4 
1c88 : 85 4e __ STA T6 + 0 
1c8a : a5 0d __ LDA P0 
1c8c : 85 0f __ STA P2 
1c8e : a5 4d __ LDA T5 + 1 
1c90 : 85 10 __ STA P3 
1c92 : a9 00 __ LDA #$00
1c94 : 85 12 __ STA P5 
1c96 : a9 97 __ LDA #$97
1c98 : 85 0e __ STA P1 
1c9a : a9 00 __ LDA #$00
1c9c : 85 0d __ STA P0 
1c9e : 20 f8 1c JSR $1cf8 ; (memcpy.s4 + 0)
1ca1 : a5 4a __ LDA T3 + 0 
1ca3 : 85 11 __ STA P4 
1ca5 : a5 4b __ LDA T3 + 1 
1ca7 : 85 12 __ STA P5 
1ca9 : 18 __ __ CLC
1caa : a9 00 __ LDA #$00
1cac : 65 4e __ ADC T6 + 0 
1cae : 85 0d __ STA P0 
1cb0 : a9 97 __ LDA #$97
1cb2 : 69 00 __ ADC #$00
1cb4 : 85 0e __ STA P1 
1cb6 : a9 32 __ LDA #$32
1cb8 : 85 0f __ STA P2 
1cba : a9 7d __ LDA #$7d
1cbc : 85 10 __ STA P3 
1cbe : 20 f8 1c JSR $1cf8 ; (memcpy.s4 + 0)
1cc1 : a9 00 __ LDA #$00
1cc3 : 85 11 __ STA P4 
1cc5 : a9 97 __ LDA #$97
1cc7 : 85 12 __ STA P5 
1cc9 : 20 8e 1b JSR $1b8e ; (uii_change_dir.s4 + 0)
1ccc : ad c9 95 LDA $95c9 ; (uii_status[0] + 0)
1ccf : c9 30 __ CMP #$30
1cd1 : d0 07 __ BNE $1cda ; (uii_find_media_path.s9 + 0)
.s10:
1cd3 : ad ca 95 LDA $95ca ; (uii_status[0] + 1)
1cd6 : c9 30 __ CMP #$30
1cd8 : f0 10 __ BEQ $1cea ; (uii_find_media_path.s11 + 0)
.s9:
1cda : e6 4f __ INC T8 + 0 
1cdc : a5 4f __ LDA T8 + 0 
1cde : c5 15 __ CMP P8 ; (drv_count + 0)
1ce0 : b0 03 __ BCS $1ce5 ; (uii_find_media_path.s5 + 0)
1ce2 : 4c 61 1c JMP $1c61 ; (uii_find_media_path.l7 + 0)
.s5:
1ce5 : a9 00 __ LDA #$00
.s3:
1ce7 : 85 1b __ STA ACCU + 0 
1ce9 : 60 __ __ RTS
.s11:
1cea : a0 ff __ LDY #$ff
.l12:
1cec : c8 __ __ INY
1ced : b9 00 97 LDA $9700,y ; (_uii_fp[0] + 0)
1cf0 : 91 16 __ STA (P9),y ; (result + 0)
1cf2 : d0 f8 __ BNE $1cec ; (uii_find_media_path.l12 + 0)
.s13:
1cf4 : a9 01 __ LDA #$01
1cf6 : d0 ef __ BNE $1ce7 ; (uii_find_media_path.s3 + 0)
--------------------------------------------------------------------
memcpy: ; memcpy(void*,const void*,i16)->void
;  30, "/home/xahmol/oscar64/include/string.h"
.s4:
1cf8 : a6 12 __ LDX P5 
1cfa : f0 10 __ BEQ $1d0c ; (memcpy.s4 + 20)
1cfc : a0 00 __ LDY #$00
1cfe : b1 0f __ LDA (P2),y 
1d00 : 91 0d __ STA (P0),y 
1d02 : c8 __ __ INY
1d03 : d0 f9 __ BNE $1cfe ; (memcpy.s4 + 6)
1d05 : e6 10 __ INC P3 
1d07 : e6 0e __ INC P1 
1d09 : ca __ __ DEX
1d0a : d0 f2 __ BNE $1cfe ; (memcpy.s4 + 6)
1d0c : a4 11 __ LDY P4 
1d0e : f0 0e __ BEQ $1d1e ; (memcpy.s3 + 0)
1d10 : 88 __ __ DEY
1d11 : f0 07 __ BEQ $1d1a ; (memcpy.s4 + 34)
1d13 : b1 0f __ LDA (P2),y 
1d15 : 91 0d __ STA (P0),y 
1d17 : 88 __ __ DEY
1d18 : d0 f9 __ BNE $1d13 ; (memcpy.s4 + 27)
1d1a : b1 0f __ LDA (P2),y 
1d1c : 91 0d __ STA (P0),y 
.s3:
1d1e : 60 __ __ RTS
--------------------------------------------------------------------
modplay_init: ; modplay_init(u32)->u8
; 227, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s4:
1d1f : a9 00 __ LDA #$00
1d21 : 8d bc 9b STA $9bbc ; (modplay.reu_base + 0)
1d24 : 8d bd 9b STA $9bbd ; (modplay.reu_base + 1)
1d27 : 8d be 9b STA $9bbe ; (modplay.reu_base + 2)
1d2a : 8d bf 9b STA $9bbf ; (modplay.reu_base + 3)
1d2d : a2 80 __ LDX #$80
1d2f : 8e 02 df STX $df02 
1d32 : a2 97 __ LDX #$97
1d34 : 8e 03 df STX $df03 
1d37 : 8d 04 df STA $df04 
1d3a : 8d 05 df STA $df05 
1d3d : 8d 06 df STA $df06 
1d40 : a9 3c __ LDA #$3c
1d42 : 8d 07 df STA $df07 
1d45 : a9 04 __ LDA #$04
1d47 : 8d 08 df STA $df08 
1d4a : a9 00 __ LDA #$00
1d4c : 8d 0a df STA $df0a 
1d4f : a9 91 __ LDA #$91
1d51 : 8d 01 df STA $df01 
1d54 : ad b8 9b LDA $9bb8 ; (hdr[0] + 1080)
1d57 : c9 4d __ CMP #$4d
1d59 : f0 03 __ BEQ $1d5e ; (modplay_init.s48 + 0)
1d5b : 4c be 1f JMP $1fbe ; (modplay_init.s5 + 0)
.s48:
1d5e : ad b9 9b LDA $9bb9 ; (hdr[0] + 1081)
1d61 : c9 2e __ CMP #$2e
1d63 : d0 03 __ BNE $1d68 ; (modplay_init.s49 + 0)
1d65 : 4c ad 1f JMP $1fad ; (modplay_init.s52 + 0)
.s49:
1d68 : c9 21 __ CMP #$21
1d6a : d0 0e __ BNE $1d7a ; (modplay_init.s6 + 0)
.s50:
1d6c : ad ba 9b LDA $9bba ; (hdr[0] + 1082)
1d6f : c9 4b __ CMP #$4b
1d71 : d0 07 __ BNE $1d7a ; (modplay_init.s6 + 0)
.s51:
1d73 : ad bb 9b LDA $9bbb ; (hdr[0] + 1083)
1d76 : c9 21 __ CMP #$21
1d78 : f0 1c __ BEQ $1d96 ; (modplay_init.s44 + 0)
.s6:
1d7a : ad b8 9b LDA $9bb8 ; (hdr[0] + 1080)
1d7d : c9 46 __ CMP #$46
1d7f : d0 19 __ BNE $1d9a ; (modplay_init.s7 + 0)
.s41:
1d81 : ad b9 9b LDA $9bb9 ; (hdr[0] + 1081)
1d84 : c9 4c __ CMP #$4c
1d86 : d0 12 __ BNE $1d9a ; (modplay_init.s7 + 0)
.s42:
1d88 : ad ba 9b LDA $9bba ; (hdr[0] + 1082)
1d8b : c9 54 __ CMP #$54
1d8d : d0 0b __ BNE $1d9a ; (modplay_init.s7 + 0)
.s43:
1d8f : ad bb 9b LDA $9bbb ; (hdr[0] + 1083)
1d92 : c9 34 __ CMP #$34
1d94 : d0 04 __ BNE $1d9a ; (modplay_init.s7 + 0)
.s44:
1d96 : a9 1f __ LDA #$1f
1d98 : d0 17 __ BNE $1db1 ; (modplay_init.s12 + 0)
.s7:
1d9a : a2 00 __ LDX #$00
.l8:
1d9c : bd b8 9b LDA $9bb8,x ; (hdr[0] + 1080)
1d9f : c9 20 __ CMP #$20
1da1 : b0 03 __ BCS $1da6 ; (modplay_init.s9 + 0)
1da3 : 4c a8 1f JMP $1fa8 ; (modplay_init.s40 + 0)
.s9:
1da6 : c9 7f __ CMP #$7f
1da8 : b0 f9 __ BCS $1da3 ; (modplay_init.l8 + 7)
.s10:
1daa : e8 __ __ INX
1dab : e0 04 __ CPX #$04
1dad : 90 ed __ BCC $1d9c ; (modplay_init.l8 + 0)
.s11:
1daf : a9 0f __ LDA #$0f
.s12:
1db1 : 8d c1 9b STA $9bc1 ; (modplay.num_samples + 0)
1db4 : ad 36 9b LDA $9b36 ; (hdr[0] + 950)
1db7 : 8d c0 9b STA $9bc0 ; (modplay.song_length + 0)
1dba : d0 09 __ BNE $1dc5 ; (modplay_init.s39 + 0)
.s62:
1dbc : a9 80 __ LDA #$80
.s13:
1dbe : 8d c0 9b STA $9bc0 ; (modplay.song_length + 0)
.s14:
1dc1 : a2 7f __ LDX #$7f
1dc3 : d0 09 __ BNE $1dce ; (modplay_init.l15 + 0)
.s39:
1dc5 : a9 80 __ LDA #$80
1dc7 : cd 36 9b CMP $9b36 ; (hdr[0] + 950)
1dca : b0 f5 __ BCS $1dc1 ; (modplay_init.s14 + 0)
1dcc : 90 f0 __ BCC $1dbe ; (modplay_init.s13 + 0)
.l15:
1dce : bd 38 9b LDA $9b38,x ; (hdr[0] + 952)
1dd1 : 9d c3 9b STA $9bc3,x ; (modplay.order_table[0] + 0)
1dd4 : ca __ __ DEX
1dd5 : 10 f7 __ BPL $1dce ; (modplay_init.l15 + 0)
.s16:
1dd7 : a2 00 __ LDX #$00
1dd9 : a0 00 __ LDY #$00
.l17:
1ddb : 98 __ __ TYA
1ddc : dd c3 9b CMP $9bc3,x ; (modplay.order_table[0] + 0)
1ddf : b0 04 __ BCS $1de5 ; (modplay_init.s18 + 0)
.s38:
1de1 : bd c3 9b LDA $9bc3,x ; (modplay.order_table[0] + 0)
1de4 : a8 __ __ TAY
.s18:
1de5 : e8 __ __ INX
1de6 : 10 f3 __ BPL $1ddb ; (modplay_init.l17 + 0)
.s19:
1de8 : 18 __ __ CLC
1de9 : 69 01 __ ADC #$01
1deb : 85 1c __ STA ACCU + 1 
1ded : 8d c2 9b STA $9bc2 ; (modplay.num_patterns + 0)
1df0 : a9 00 __ LDA #$00
1df2 : 06 1c __ ASL ACCU + 1 
1df4 : 2a __ __ ROL
1df5 : 06 1c __ ASL ACCU + 1 
1df7 : 2a __ __ ROL
1df8 : 85 1d __ STA ACCU + 2 
1dfa : ad c1 9b LDA $9bc1 ; (modplay.num_samples + 0)
1dfd : c9 1f __ CMP #$1f
1dff : d0 03 __ BNE $1e04 ; (modplay_init.s20 + 0)
1e01 : 4c 94 1f JMP $1f94 ; (modplay_init.s37 + 0)
.s20:
1e04 : a5 1c __ LDA ACCU + 1 
1e06 : 09 02 __ ORA #$02
1e08 : 85 1c __ STA ACCU + 1 
1e0a : a9 58 __ LDA #$58
1e0c : 85 1b __ STA ACCU + 0 
1e0e : ad c1 9b LDA $9bc1 ; (modplay.num_samples + 0)
1e11 : d0 66 __ BNE $1e79 ; (modplay_init.s31 + 0)
.s21:
1e13 : a9 00 __ LDA #$00
1e15 : 8d ff 15 STA $15ff ; (mod_paused + 0)
1e18 : 8d 43 9c STA $9c43 ; (modplay.order_pos + 0)
1e1b : 8d 45 9c STA $9c45 ; (modplay.row + 0)
1e1e : 8d 46 9c STA $9c46 ; (modplay.tick + 0)
1e21 : 8d 4c 9c STA $9c4c ; (modplay.active + 0)
1e24 : ad c3 9b LDA $9bc3 ; (modplay.order_table[0] + 0)
1e27 : 8d 44 9c STA $9c44 ; (modplay.pattern_num + 0)
1e2a : a9 01 __ LDA #$01
1e2c : 8d 4b 9c STA $9c4b ; (modplay.stereo + 0)
1e2f : 8d 4d 9c STA $9c4d ; (modplay.loop_song + 0)
1e32 : a9 06 __ LDA #$06
1e34 : 8d 47 9c STA $9c47 ; (modplay.ticks_per_row + 0)
1e37 : a9 7d __ LDA #$7d
1e39 : 8d 48 9c STA $9c48 ; (modplay.bpm + 0)
1e3c : a9 00 __ LDA #$00
1e3e : a2 c8 __ LDX #$c8
1e40 : 8e 4a 9c STX $9c4a ; (modplay.master_volume + 0)
.l22:
1e43 : ca __ __ DEX
1e44 : 9d 9e 9e STA $9e9e,x ; (modplay.channel[0].sample_num + 0)
1e47 : d0 fa __ BNE $1e43 ; (modplay_init.l22 + 0)
.s23:
1e49 : 85 46 __ STA T2 + 0 
.l24:
1e4b : a5 46 __ LDA T2 + 0 
1e4d : c9 01 __ CMP #$01
1e4f : f0 04 __ BEQ $1e55 ; (modplay_init.s30 + 0)
.s25:
1e51 : c9 02 __ CMP #$02
1e53 : d0 04 __ BNE $1e59 ; (modplay_init.s26 + 0)
.s30:
1e55 : a0 ff __ LDY #$ff
1e57 : d0 02 __ BNE $1e5b ; (modplay_init.l27 + 0)
.s26:
1e59 : a0 00 __ LDY #$00
.l27:
1e5b : a6 46 __ LDX T2 + 0 
1e5d : bd cd 7b LDA $7bcd,x ; (__multab50L + 0)
1e60 : aa __ __ TAX
1e61 : 98 __ __ TYA
1e62 : 9d a4 9e STA $9ea4,x ; (modplay.channel[0].pan + 0)
1e65 : e6 46 __ INC T2 + 0 
1e67 : a5 46 __ LDA T2 + 0 
1e69 : c9 04 __ CMP #$04
1e6b : b0 07 __ BCS $1e74 ; (modplay_init.s28 + 0)
.s29:
1e6d : ad 4b 9c LDA $9c4b ; (modplay.stereo + 0)
1e70 : f0 e7 __ BEQ $1e59 ; (modplay_init.s26 + 0)
1e72 : d0 d7 __ BNE $1e4b ; (modplay_init.l24 + 0)
.s28:
1e74 : a9 01 __ LDA #$01
.s3:
1e76 : 85 1b __ STA ACCU + 0 
1e78 : 60 __ __ RTS
.s31:
1e79 : a9 00 __ LDA #$00
1e7b : 85 43 __ STA T1 + 0 
1e7d : 85 44 __ STA T1 + 1 
1e7f : 85 45 __ STA T1 + 2 
1e81 : 85 1e __ STA ACCU + 3 
1e83 : a9 51 __ LDA #$51
1e85 : 85 4e __ STA T6 + 0 
1e87 : a9 9c __ LDA #$9c
1e89 : 85 4f __ STA T6 + 1 
1e8b : a9 94 __ LDA #$94
1e8d : 85 50 __ STA T7 + 0 
1e8f : a9 97 __ LDA #$97
1e91 : 85 51 __ STA T7 + 1 
1e93 : a2 00 __ LDX #$00
1e95 : 18 __ __ CLC
.l32:
1e96 : a5 1b __ LDA ACCU + 0 
1e98 : 65 43 __ ADC T1 + 0 
1e9a : a0 00 __ LDY #$00
1e9c : 84 48 __ STY T2 + 2 
1e9e : 91 4e __ STA (T6 + 0),y 
1ea0 : a5 1c __ LDA ACCU + 1 
1ea2 : 65 44 __ ADC T1 + 1 
1ea4 : c8 __ __ INY
1ea5 : 91 4e __ STA (T6 + 0),y 
1ea7 : a5 1d __ LDA ACCU + 2 
1ea9 : 65 45 __ ADC T1 + 2 
1eab : c8 __ __ INY
1eac : 91 4e __ STA (T6 + 0),y 
1eae : 8a __ __ TXA
1eaf : 69 00 __ ADC #$00
1eb1 : c8 __ __ INY
1eb2 : 91 4e __ STA (T6 + 0),y 
1eb4 : a0 16 __ LDY #$16
1eb6 : b1 50 __ LDA (T7 + 0),y 
1eb8 : 85 47 __ STA T2 + 1 
1eba : c8 __ __ INY
1ebb : b1 50 __ LDA (T7 + 0),y 
1ebd : 0a __ __ ASL
1ebe : 85 46 __ STA T2 + 0 
1ec0 : 26 47 __ ROL T2 + 1 
1ec2 : 26 48 __ ROL T2 + 2 
1ec4 : a0 04 __ LDY #$04
1ec6 : 91 4e __ STA (T6 + 0),y 
1ec8 : a5 47 __ LDA T2 + 1 
1eca : c8 __ __ INY
1ecb : 91 4e __ STA (T6 + 0),y 
1ecd : a5 48 __ LDA T2 + 2 
1ecf : c8 __ __ INY
1ed0 : 91 4e __ STA (T6 + 0),y 
1ed2 : a9 00 __ LDA #$00
1ed4 : c8 __ __ INY
1ed5 : 91 4e __ STA (T6 + 0),y 
1ed7 : a0 19 __ LDY #$19
1ed9 : b1 50 __ LDA (T7 + 0),y 
1edb : c9 41 __ CMP #$41
1edd : 90 02 __ BCC $1ee1 ; (modplay_init.s54 + 0)
.s33:
1edf : a9 40 __ LDA #$40
.s54:
1ee1 : a0 11 __ LDY #$11
1ee3 : 91 4e __ STA (T6 + 0),y 
1ee5 : a0 18 __ LDY #$18
1ee7 : b1 50 __ LDA (T7 + 0),y 
1ee9 : 29 0f __ AND #$0f
1eeb : a0 12 __ LDY #$12
1eed : 91 4e __ STA (T6 + 0),y 
1eef : a0 1a __ LDY #$1a
1ef1 : b1 50 __ LDA (T7 + 0),y 
1ef3 : 85 4a __ STA T3 + 1 
1ef5 : c8 __ __ INY
1ef6 : b1 50 __ LDA (T7 + 0),y 
1ef8 : 85 49 __ STA T3 + 0 
1efa : 0a __ __ ASL
1efb : a0 08 __ LDY #$08
1efd : 91 4e __ STA (T6 + 0),y 
1eff : a5 4a __ LDA T3 + 1 
1f01 : 2a __ __ ROL
1f02 : c8 __ __ INY
1f03 : 91 4e __ STA (T6 + 0),y 
1f05 : a9 00 __ LDA #$00
1f07 : 2a __ __ ROL
1f08 : c8 __ __ INY
1f09 : 91 4e __ STA (T6 + 0),y 
1f0b : a9 00 __ LDA #$00
1f0d : c8 __ __ INY
1f0e : 91 4e __ STA (T6 + 0),y 
1f10 : a0 1d __ LDY #$1d
1f12 : b1 50 __ LDA (T7 + 0),y 
1f14 : 85 4c __ STA T4 + 0 
1f16 : 65 49 __ ADC T3 + 0 
1f18 : 85 49 __ STA T3 + 0 
1f1a : 88 __ __ DEY
1f1b : b1 50 __ LDA (T7 + 0),y 
1f1d : 85 4d __ STA T4 + 1 
1f1f : 65 4a __ ADC T3 + 1 
1f21 : 85 4a __ STA T3 + 1 
1f23 : a9 00 __ LDA #$00
1f25 : 2a __ __ ROL
1f26 : 85 4b __ STA T3 + 2 
1f28 : a9 00 __ LDA #$00
1f2a : 06 49 __ ASL T3 + 0 
1f2c : 26 4a __ ROL T3 + 1 
1f2e : 26 4b __ ROL T3 + 2 
1f30 : a0 0f __ LDY #$0f
1f32 : 91 4e __ STA (T6 + 0),y 
1f34 : a5 49 __ LDA T3 + 0 
1f36 : a0 0c __ LDY #$0c
1f38 : 91 4e __ STA (T6 + 0),y 
1f3a : a5 4a __ LDA T3 + 1 
1f3c : c8 __ __ INY
1f3d : 91 4e __ STA (T6 + 0),y 
1f3f : a5 4b __ LDA T3 + 2 
1f41 : c8 __ __ INY
1f42 : 91 4e __ STA (T6 + 0),y 
1f44 : a5 4d __ LDA T4 + 1 
1f46 : f0 04 __ BEQ $1f4c ; (modplay_init.s36 + 0)
.s35:
1f48 : a9 01 __ LDA #$01
1f4a : d0 09 __ BNE $1f55 ; (modplay_init.s34 + 0)
.s36:
1f4c : a9 01 __ LDA #$01
1f4e : c5 4c __ CMP T4 + 0 
1f50 : a9 00 __ LDA #$00
1f52 : 2a __ __ ROL
1f53 : 49 01 __ EOR #$01
.s34:
1f55 : a0 10 __ LDY #$10
1f57 : 91 4e __ STA (T6 + 0),y 
1f59 : 18 __ __ CLC
1f5a : a5 46 __ LDA T2 + 0 
1f5c : 65 43 __ ADC T1 + 0 
1f5e : 85 43 __ STA T1 + 0 
1f60 : a5 47 __ LDA T2 + 1 
1f62 : 65 44 __ ADC T1 + 1 
1f64 : 85 44 __ STA T1 + 1 
1f66 : a5 48 __ LDA T2 + 2 
1f68 : 65 45 __ ADC T1 + 2 
1f6a : 85 45 __ STA T1 + 2 
1f6c : 90 02 __ BCC $1f70 ; (modplay_init.s57 + 0)
.s56:
1f6e : e8 __ __ INX
1f6f : 18 __ __ CLC
.s57:
1f70 : a5 50 __ LDA T7 + 0 
1f72 : 69 1e __ ADC #$1e
1f74 : 85 50 __ STA T7 + 0 
1f76 : 90 03 __ BCC $1f7b ; (modplay_init.s59 + 0)
.s58:
1f78 : e6 51 __ INC T7 + 1 
1f7a : 18 __ __ CLC
.s59:
1f7b : a5 4e __ LDA T6 + 0 
1f7d : 69 13 __ ADC #$13
1f7f : 85 4e __ STA T6 + 0 
1f81 : 90 02 __ BCC $1f85 ; (modplay_init.s61 + 0)
.s60:
1f83 : e6 4f __ INC T6 + 1 
.s61:
1f85 : e6 1e __ INC ACCU + 3 
1f87 : a5 1e __ LDA ACCU + 3 
1f89 : cd c1 9b CMP $9bc1 ; (modplay.num_samples + 0)
1f8c : b0 03 __ BCS $1f91 ; (modplay_init.s61 + 12)
1f8e : 4c 96 1e JMP $1e96 ; (modplay_init.l32 + 0)
1f91 : 4c 13 1e JMP $1e13 ; (modplay_init.s21 + 0)
.s37:
1f94 : a9 3c __ LDA #$3c
1f96 : 85 1b __ STA ACCU + 0 
1f98 : a5 1c __ LDA ACCU + 1 
1f9a : 69 03 __ ADC #$03
1f9c : 85 1c __ STA ACCU + 1 
1f9e : b0 03 __ BCS $1fa3 ; (modplay_init.s55 + 0)
1fa0 : 4c 79 1e JMP $1e79 ; (modplay_init.s31 + 0)
.s55:
1fa3 : e6 1d __ INC ACCU + 2 
1fa5 : 4c 79 1e JMP $1e79 ; (modplay_init.s31 + 0)
.s40:
1fa8 : a9 00 __ LDA #$00
1faa : 4c 76 1e JMP $1e76 ; (modplay_init.s3 + 0)
.s52:
1fad : ad ba 9b LDA $9bba ; (hdr[0] + 1082)
1fb0 : c9 4b __ CMP #$4b
1fb2 : d0 0a __ BNE $1fbe ; (modplay_init.s5 + 0)
.s53:
1fb4 : ad bb 9b LDA $9bbb ; (hdr[0] + 1083)
1fb7 : c9 2e __ CMP #$2e
1fb9 : d0 03 __ BNE $1fbe ; (modplay_init.s5 + 0)
1fbb : 4c 96 1d JMP $1d96 ; (modplay_init.s44 + 0)
.s5:
1fbe : ad b8 9b LDA $9bb8 ; (hdr[0] + 1080)
1fc1 : c9 34 __ CMP #$34
1fc3 : f0 03 __ BEQ $1fc8 ; (modplay_init.s45 + 0)
1fc5 : 4c 7a 1d JMP $1d7a ; (modplay_init.s6 + 0)
.s45:
1fc8 : ad b9 9b LDA $9bb9 ; (hdr[0] + 1081)
1fcb : c9 43 __ CMP #$43
1fcd : f0 03 __ BEQ $1fd2 ; (modplay_init.s46 + 0)
1fcf : 4c 9a 1d JMP $1d9a ; (modplay_init.s7 + 0)
.s46:
1fd2 : ad ba 9b LDA $9bba ; (hdr[0] + 1082)
1fd5 : c9 48 __ CMP #$48
1fd7 : d0 f6 __ BNE $1fcf ; (modplay_init.s45 + 7)
.s47:
1fd9 : ad bb 9b LDA $9bbb ; (hdr[0] + 1083)
1fdc : c9 4e __ CMP #$4e
1fde : d0 ef __ BNE $1fcf ; (modplay_init.s45 + 7)
1fe0 : 4c 96 1d JMP $1d96 ; (modplay_init.s44 + 0)
--------------------------------------------------------------------
1fe3 : __ __ __ BYT 6d 55 53 49 43 00                               : mUSIC.
--------------------------------------------------------------------
1fe9 : __ __ __ BYT 34 45 56 2e 4d 4f 44 00                         : 4EV.MOD.
--------------------------------------------------------------------
1ff1 : __ __ __ BYT 62 41 44 20 6d 6f 64 20 46 4f 52 4d 41 54 00    : bAD mod FORMAT.
--------------------------------------------------------------------
2000 : __ __ __ BYT 6e 4f 54 20 46 4f 55 4e 44 00                   : nOT FOUND.
--------------------------------------------------------------------
200a : __ __ __ BYT 70 4c 41 43 45 20 44 45 4d 4f 20 49 4e 20 49 44 : pLACE DEMO IN ID
201a : __ __ __ BYT 49 38 42 2f 55 4c 54 44 45 4d 4f 32 30 32 36 2f : I8B/ULTDEMO2026/
202a : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
202b : __ __ __ BYT 64 45 54 45 43 54 49 4f 4e 20 43 4f 4d 50 4c 45 : dETECTION COMPLE
203b : __ __ __ BYT 54 45 2e 00                                     : TE..
--------------------------------------------------------------------
screen_wait_key: ; screen_wait_key(const u8*)->void
;  37, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
203f : a9 01 __ LDA #$01
2041 : 85 0f __ STA P2 
2043 : a5 10 __ LDA P3 ; (msg + 0)
2045 : aa __ __ TAX
2046 : 05 11 __ ORA P4 ; (msg + 1)
2048 : f0 0a __ BEQ $2054 ; (screen_wait_key.s5 + 0)
.s13:
204a : a5 11 __ LDA P4 ; (msg + 1)
204c : 85 0e __ STA P1 
204e : a0 00 __ LDY #$00
2050 : b1 10 __ LDA (P3),y ; (msg + 0)
2052 : d0 06 __ BNE $205a ; (screen_wait_key.s6 + 0)
.s5:
2054 : a9 20 __ LDA #$20
2056 : 85 0e __ STA P1 
2058 : a2 94 __ LDX #$94
.s6:
205a : 86 0d __ STX P0 
205c : 20 4a 11 JSR $114a ; (cwin_put_string.s4 + 0)
205f : 20 2a 11 JSR $112a ; (cwin_cursor_newline.s4 + 0)
.l7:
2062 : a2 04 __ LDX #$04
.l8:
2064 : 2c 11 d0 BIT $d011 
2067 : 30 fb __ BMI $2064 ; (screen_wait_key.l8 + 0)
.l9:
2069 : 2c 11 d0 BIT $d011 
206c : 10 fb __ BPL $2069 ; (screen_wait_key.l9 + 0)
.s10:
206e : a9 00 __ LDA #$00
2070 : 8d 00 dc STA $dc00 
2073 : ad 01 dc LDA $dc01 
2076 : 85 43 __ STA T0 + 0 
2078 : a9 ff __ LDA #$ff
207a : 8d 00 dc STA $dc00 
207d : c5 43 __ CMP T0 + 0 
207f : d0 e1 __ BNE $2062 ; (screen_wait_key.l7 + 0)
.s11:
2081 : ca __ __ DEX
2082 : d0 e0 __ BNE $2064 ; (screen_wait_key.l8 + 0)
.l12:
2084 : 8e 00 dc STX $dc00 
2087 : ac 01 dc LDY $dc01 
208a : 84 43 __ STY T0 + 0 
208c : 8d 00 dc STA $dc00 
208f : c5 43 __ CMP T0 + 0 
2091 : f0 f1 __ BEQ $2084 ; (screen_wait_key.l12 + 0)
.s3:
2093 : 60 __ __ RTS
--------------------------------------------------------------------
2094 : __ __ __ BYT 70 52 45 53 53 20 41 4e 59 20 4b 45 59 20 54 4f : pRESS ANY KEY TO
20a4 : __ __ __ BYT 20 43 4f 4e 54 49 4e 55 45 2e 00                :  CONTINUE..
--------------------------------------------------------------------
20af : __ __ __ BYT 70 52 45 53 53 20 41 4e 59 20 4b 45 59 20 54 4f : pRESS ANY KEY TO
20bf : __ __ __ BYT 20 53 54 41 52 54 20 54 48 45 20 44 45 4d 4f 2e :  START THE DEMO.
20cf : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
gears_run: ; gears_run()->void
;   8, "/home/xahmol/git/UltimateDemo2026/src/gears.h"
.s1:
20d0 : a5 53 __ LDA T0 + 0 
20d2 : 8d ad bf STA $bfad ; (gears_run@stack + 0)
.s4:
20d5 : a9 00 __ LDA #$00
20d7 : 85 f9 __ STA $f9 ; (zp_spd + 0)
20d9 : 85 f7 __ STA $f7 ; (zp_angle1 + 0)
20db : a9 01 __ LDA #$01
20dd : 85 fa __ STA $fa ; (zp_dirty + 0)
20df : a9 1c __ LDA #$1c
20e1 : 85 f8 __ STA $f8 ; (zp_angle2 + 0)
20e3 : 20 a2 23 JSR $23a2 ; (hires_init.s4 + 0)
20e6 : 20 7a 24 JSR $247a ; (engine_init.s4 + 0)
20e9 : a9 00 __ LDA #$00
20eb : 20 73 16 JSR $1673 ; (turbo_set.s4 + 0)
20ee : a9 00 __ LDA #$00
20f0 : 85 0f __ STA P2 
20f2 : 85 10 __ STA P3 
20f4 : a9 e0 __ LDA #$e0
20f6 : 85 11 __ STA P4 
20f8 : a9 06 __ LDA #$06
20fa : 85 12 __ STA P5 
20fc : 20 c1 24 JSR $24c1 ; (tod_reset.s4 + 0)
20ff : 20 0c 24 JSR $240c ; (memset@proxy + 0)
2102 : a9 00 __ LDA #$00
2104 : 8d f3 bf STA $bff3 ; (sstack + 9)
2107 : 20 cc 24 JSR $24cc ; (draw_speed.s1 + 0)
210a : a9 00 __ LDA #$00
210c : 8d f0 bf STA $bff0 ; (sstack + 6)
210f : 20 20 2f JSR $2f20 ; (draw_message.s1 + 0)
2112 : a9 1c __ LDA #$1c
2114 : 8d f9 bf STA $bff9 ; (sstack + 15)
2117 : 8d fc bf STA $bffc ; (sstack + 18)
211a : a9 d0 __ LDA #$d0
211c : 8d f7 bf STA $bff7 ; (sstack + 13)
211f : a9 00 __ LDA #$00
2121 : 8d f8 bf STA $bff8 ; (sstack + 14)
2124 : a9 08 __ LDA #$08
2126 : 8d fa bf STA $bffa ; (sstack + 16)
2129 : 8d fb bf STA $bffb ; (sstack + 17)
212c : 8d fe bf STA $bffe ; (sstack + 20)
212f : a9 28 __ LDA #$28
2131 : 8d fd bf STA $bffd ; (sstack + 19)
2134 : a9 04 __ LDA #$04
2136 : 8d ff bf STA $bfff ; (sstack + 21)
2139 : 20 10 33 JSR $3310 ; (draw_gear.s1 + 0)
213c : a9 00 __ LDA #$00
213e : 8d f8 bf STA $bff8 ; (sstack + 14)
2141 : 8d f9 bf STA $bff9 ; (sstack + 15)
2144 : a9 78 __ LDA #$78
2146 : 8d f7 bf STA $bff7 ; (sstack + 13)
2149 : a9 10 __ LDA #$10
214b : 8d fa bf STA $bffa ; (sstack + 16)
214e : a9 04 __ LDA #$04
2150 : 8d fb bf STA $bffb ; (sstack + 17)
2153 : a9 2c __ LDA #$2c
2155 : 8d fc bf STA $bffc ; (sstack + 18)
2158 : a9 36 __ LDA #$36
215a : 8d fd bf STA $bffd ; (sstack + 19)
215d : a9 0a __ LDA #$0a
215f : 8d fe bf STA $bffe ; (sstack + 20)
2162 : a9 06 __ LDA #$06
2164 : 8d ff bf STA $bfff ; (sstack + 21)
2167 : 20 10 33 JSR $3310 ; (draw_gear.s1 + 0)
216a : a9 00 __ LDA #$00
.l20:
216c : 85 fa __ STA $fa ; (zp_dirty + 0)
.l5:
216e : a9 0f __ LDA #$0f
2170 : c5 f9 __ CMP $f9 ; (zp_spd + 0)
2172 : b0 0f __ BCS $2183 ; (gears_run.l12 + 0)
.s6:
2174 : a9 8f __ LDA #$8f
2176 : 20 73 16 JSR $1673 ; (turbo_set.s4 + 0)
2179 : a9 0f __ LDA #$0f
217b : 85 f9 __ STA $f9 ; (zp_spd + 0)
217d : 20 c1 24 JSR $24c1 ; (tod_reset.s4 + 0)
2180 : 4c af 22 JMP $22af ; (gears_run.l7 + 0)
.l12:
2183 : 2c 11 d0 BIT $d011 
2186 : 30 fb __ BMI $2183 ; (gears_run.l12 + 0)
.l13:
2188 : 2c 11 d0 BIT $d011 
218b : 10 fb __ BPL $2188 ; (gears_run.l13 + 0)
.s14:
218d : a5 fa __ LDA $fa ; (zp_dirty + 0)
218f : f0 25 __ BEQ $21b6 ; (gears_run.s15 + 0)
.s19:
2191 : a9 00 __ LDA #$00
2193 : 85 0f __ STA P2 
2195 : 85 10 __ STA P3 
2197 : a9 e0 __ LDA #$e0
2199 : 85 11 __ STA P4 
219b : a9 06 __ LDA #$06
219d : 85 12 __ STA P5 
219f : 20 0c 24 JSR $240c ; (memset@proxy + 0)
21a2 : a5 f9 __ LDA $f9 ; (zp_spd + 0)
21a4 : 8d f3 bf STA $bff3 ; (sstack + 9)
21a7 : 20 cc 24 JSR $24cc ; (draw_speed.s1 + 0)
21aa : a5 f9 __ LDA $f9 ; (zp_spd + 0)
21ac : 8d f0 bf STA $bff0 ; (sstack + 6)
21af : 20 20 2f JSR $2f20 ; (draw_message.s1 + 0)
21b2 : a9 00 __ LDA #$00
21b4 : 85 fa __ STA $fa ; (zp_dirty + 0)
.s15:
21b6 : a9 d0 __ LDA #$d0
21b8 : 8d f7 bf STA $bff7 ; (sstack + 13)
21bb : a9 00 __ LDA #$00
21bd : 8d f8 bf STA $bff8 ; (sstack + 14)
21c0 : a5 f8 __ LDA $f8 ; (zp_angle2 + 0)
21c2 : 8d f9 bf STA $bff9 ; (sstack + 15)
21c5 : a9 08 __ LDA #$08
21c7 : 8d fa bf STA $bffa ; (sstack + 16)
21ca : 8d fb bf STA $bffb ; (sstack + 17)
21cd : 8d fe bf STA $bffe ; (sstack + 20)
21d0 : a9 1c __ LDA #$1c
21d2 : 8d fc bf STA $bffc ; (sstack + 18)
21d5 : a9 28 __ LDA #$28
21d7 : 8d fd bf STA $bffd ; (sstack + 19)
21da : a9 04 __ LDA #$04
21dc : 8d ff bf STA $bfff ; (sstack + 21)
21df : 20 10 33 JSR $3310 ; (draw_gear.s1 + 0)
21e2 : a9 78 __ LDA #$78
21e4 : 8d f7 bf STA $bff7 ; (sstack + 13)
21e7 : a9 00 __ LDA #$00
21e9 : 8d f8 bf STA $bff8 ; (sstack + 14)
21ec : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
21ee : 8d f9 bf STA $bff9 ; (sstack + 15)
21f1 : a9 10 __ LDA #$10
21f3 : 8d fa bf STA $bffa ; (sstack + 16)
21f6 : a9 04 __ LDA #$04
21f8 : 8d fb bf STA $bffb ; (sstack + 17)
21fb : a9 2c __ LDA #$2c
21fd : 8d fc bf STA $bffc ; (sstack + 18)
2200 : a9 36 __ LDA #$36
2202 : 8d fd bf STA $bffd ; (sstack + 19)
2205 : a9 0a __ LDA #$0a
2207 : 8d fe bf STA $bffe ; (sstack + 20)
220a : a9 06 __ LDA #$06
220c : 8d ff bf STA $bfff ; (sstack + 21)
220f : 20 10 33 JSR $3310 ; (draw_gear.s1 + 0)
2212 : 78 __ __ SEI
2213 : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
2215 : 18 __ __ CLC
2216 : 69 01 __ ADC #$01
2218 : 29 3f __ AND #$3f
221a : 85 f7 __ STA $f7 ; (zp_angle1 + 0)
221c : a5 f8 __ LDA $f8 ; (zp_angle2 + 0)
221e : 38 __ __ SEC
221f : e9 02 __ SBC #$02
2221 : 29 3f __ AND #$3f
2223 : 85 53 __ STA T0 + 0 
2225 : 85 f8 __ STA $f8 ; (zp_angle2 + 0)
2227 : 58 __ __ CLI
2228 : a9 d0 __ LDA #$d0
222a : 8d f7 bf STA $bff7 ; (sstack + 13)
222d : a9 00 __ LDA #$00
222f : 8d f8 bf STA $bff8 ; (sstack + 14)
2232 : a5 53 __ LDA T0 + 0 
2234 : 8d f9 bf STA $bff9 ; (sstack + 15)
2237 : a9 08 __ LDA #$08
2239 : 8d fa bf STA $bffa ; (sstack + 16)
223c : 8d fb bf STA $bffb ; (sstack + 17)
223f : 8d fe bf STA $bffe ; (sstack + 20)
2242 : a9 1c __ LDA #$1c
2244 : 8d fc bf STA $bffc ; (sstack + 18)
2247 : a9 28 __ LDA #$28
2249 : 8d fd bf STA $bffd ; (sstack + 19)
224c : a9 04 __ LDA #$04
224e : 8d ff bf STA $bfff ; (sstack + 21)
2251 : 20 10 33 JSR $3310 ; (draw_gear.s1 + 0)
2254 : a9 78 __ LDA #$78
2256 : 8d f7 bf STA $bff7 ; (sstack + 13)
2259 : a9 00 __ LDA #$00
225b : 8d f8 bf STA $bff8 ; (sstack + 14)
225e : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
2260 : 8d f9 bf STA $bff9 ; (sstack + 15)
2263 : a9 10 __ LDA #$10
2265 : 8d fa bf STA $bffa ; (sstack + 16)
2268 : a9 04 __ LDA #$04
226a : 8d fb bf STA $bffb ; (sstack + 17)
226d : a9 2c __ LDA #$2c
226f : 8d fc bf STA $bffc ; (sstack + 18)
2272 : a9 36 __ LDA #$36
2274 : 8d fd bf STA $bffd ; (sstack + 19)
2277 : a9 0a __ LDA #$0a
2279 : 8d fe bf STA $bffe ; (sstack + 20)
227c : a9 06 __ LDA #$06
227e : 8d ff bf STA $bfff ; (sstack + 21)
2281 : 20 10 33 JSR $3310 ; (draw_gear.s1 + 0)
2284 : ad 09 dc LDA $dc09 
2287 : d0 03 __ BNE $228c ; (gears_run.s16 + 0)
2289 : 4c 6e 21 JMP $216e ; (gears_run.l5 + 0)
.s16:
228c : 20 c1 24 JSR $24c1 ; (tod_reset.s4 + 0)
228f : a4 f9 __ LDY $f9 ; (zp_spd + 0)
2291 : c0 0f __ CPY #$0f
2293 : b0 13 __ BCS $22a8 ; (gears_run.s17 + 0)
.s18:
2295 : c8 __ __ INY
2296 : 84 0d __ STY P0 
2298 : 84 f9 __ STY $f9 ; (zp_spd + 0)
229a : 98 __ __ TYA
229b : 20 73 16 JSR $1673 ; (turbo_set.s4 + 0)
229e : a5 0d __ LDA P0 
22a0 : 20 70 41 JSR $4170 ; (engine_update.s4 + 0)
22a3 : a9 01 __ LDA #$01
22a5 : 4c 6c 21 JMP $216c ; (gears_run.l20 + 0)
.s17:
22a8 : a9 10 __ LDA #$10
22aa : 85 f9 __ STA $f9 ; (zp_spd + 0)
22ac : 4c 6e 21 JMP $216e ; (gears_run.l5 + 0)
.l7:
22af : ad 09 dc LDA $dc09 
22b2 : c9 05 __ CMP #$05
22b4 : 90 11 __ BCC $22c7 ; (gears_run.l9 + 0)
.s8:
22b6 : a9 00 __ LDA #$00
22b8 : 8d 04 d4 STA $d404 
22bb : 8d 0b d4 STA $d40b 
22be : 8d 18 d4 STA $d418 
.s3:
22c1 : ad ad bf LDA $bfad ; (gears_run@stack + 0)
22c4 : 85 53 __ STA T0 + 0 
22c6 : 60 __ __ RTS
.l9:
22c7 : 2c 11 d0 BIT $d011 
22ca : 30 fb __ BMI $22c7 ; (gears_run.l9 + 0)
.l10:
22cc : 2c 11 d0 BIT $d011 
22cf : 10 fb __ BPL $22cc ; (gears_run.l10 + 0)
.s11:
22d1 : a9 d0 __ LDA #$d0
22d3 : 8d f7 bf STA $bff7 ; (sstack + 13)
22d6 : a9 00 __ LDA #$00
22d8 : 8d f8 bf STA $bff8 ; (sstack + 14)
22db : a5 f8 __ LDA $f8 ; (zp_angle2 + 0)
22dd : 8d f9 bf STA $bff9 ; (sstack + 15)
22e0 : a9 08 __ LDA #$08
22e2 : 8d fa bf STA $bffa ; (sstack + 16)
22e5 : 8d fb bf STA $bffb ; (sstack + 17)
22e8 : 8d fe bf STA $bffe ; (sstack + 20)
22eb : a9 1c __ LDA #$1c
22ed : 8d fc bf STA $bffc ; (sstack + 18)
22f0 : a9 28 __ LDA #$28
22f2 : 8d fd bf STA $bffd ; (sstack + 19)
22f5 : a9 04 __ LDA #$04
22f7 : 8d ff bf STA $bfff ; (sstack + 21)
22fa : 20 10 33 JSR $3310 ; (draw_gear.s1 + 0)
22fd : a9 78 __ LDA #$78
22ff : 8d f7 bf STA $bff7 ; (sstack + 13)
2302 : a9 00 __ LDA #$00
2304 : 8d f8 bf STA $bff8 ; (sstack + 14)
2307 : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
2309 : 8d f9 bf STA $bff9 ; (sstack + 15)
230c : a9 10 __ LDA #$10
230e : 8d fa bf STA $bffa ; (sstack + 16)
2311 : a9 04 __ LDA #$04
2313 : 8d fb bf STA $bffb ; (sstack + 17)
2316 : a9 2c __ LDA #$2c
2318 : 8d fc bf STA $bffc ; (sstack + 18)
231b : a9 36 __ LDA #$36
231d : 8d fd bf STA $bffd ; (sstack + 19)
2320 : a9 0a __ LDA #$0a
2322 : 8d fe bf STA $bffe ; (sstack + 20)
2325 : a9 06 __ LDA #$06
2327 : 8d ff bf STA $bfff ; (sstack + 21)
232a : 20 10 33 JSR $3310 ; (draw_gear.s1 + 0)
232d : 78 __ __ SEI
232e : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
2330 : 18 __ __ CLC
2331 : 69 01 __ ADC #$01
2333 : 29 3f __ AND #$3f
2335 : 85 f7 __ STA $f7 ; (zp_angle1 + 0)
2337 : a5 f8 __ LDA $f8 ; (zp_angle2 + 0)
2339 : 38 __ __ SEC
233a : e9 02 __ SBC #$02
233c : 29 3f __ AND #$3f
233e : 85 53 __ STA T0 + 0 
2340 : 85 f8 __ STA $f8 ; (zp_angle2 + 0)
2342 : 58 __ __ CLI
2343 : a9 d0 __ LDA #$d0
2345 : 8d f7 bf STA $bff7 ; (sstack + 13)
2348 : a9 00 __ LDA #$00
234a : 8d f8 bf STA $bff8 ; (sstack + 14)
234d : a5 53 __ LDA T0 + 0 
234f : 8d f9 bf STA $bff9 ; (sstack + 15)
2352 : a9 08 __ LDA #$08
2354 : 8d fa bf STA $bffa ; (sstack + 16)
2357 : 8d fb bf STA $bffb ; (sstack + 17)
235a : 8d fe bf STA $bffe ; (sstack + 20)
235d : a9 1c __ LDA #$1c
235f : 8d fc bf STA $bffc ; (sstack + 18)
2362 : a9 28 __ LDA #$28
2364 : 8d fd bf STA $bffd ; (sstack + 19)
2367 : a9 04 __ LDA #$04
2369 : 8d ff bf STA $bfff ; (sstack + 21)
236c : 20 10 33 JSR $3310 ; (draw_gear.s1 + 0)
236f : a9 78 __ LDA #$78
2371 : 8d f7 bf STA $bff7 ; (sstack + 13)
2374 : a9 00 __ LDA #$00
2376 : 8d f8 bf STA $bff8 ; (sstack + 14)
2379 : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
237b : 8d f9 bf STA $bff9 ; (sstack + 15)
237e : a9 10 __ LDA #$10
2380 : 8d fa bf STA $bffa ; (sstack + 16)
2383 : a9 04 __ LDA #$04
2385 : 8d fb bf STA $bffb ; (sstack + 17)
2388 : a9 2c __ LDA #$2c
238a : 8d fc bf STA $bffc ; (sstack + 18)
238d : a9 36 __ LDA #$36
238f : 8d fd bf STA $bffd ; (sstack + 19)
2392 : a9 0a __ LDA #$0a
2394 : 8d fe bf STA $bffe ; (sstack + 20)
2397 : a9 06 __ LDA #$06
2399 : 8d ff bf STA $bfff ; (sstack + 21)
239c : 20 10 33 JSR $3310 ; (draw_gear.s1 + 0)
239f : 4c af 22 JMP $22af ; (gears_run.l7 + 0)
--------------------------------------------------------------------
hires_init: ; hires_init()->void
; 246, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s4:
23a2 : 78 __ __ SEI
23a3 : a9 00 __ LDA #$00
23a5 : 85 0f __ STA P2 
23a7 : 85 10 __ STA P3 
23a9 : a9 30 __ LDA #$30
23ab : 85 01 __ STA $01 
23ad : a9 40 __ LDA #$40
23af : 85 11 __ STA P4 
23b1 : a9 1f __ LDA #$1f
23b3 : 85 12 __ STA P5 
23b5 : a9 10 __ LDA #$10
23b7 : a2 fa __ LDX #$fa
.l6:
23b9 : ca __ __ DEX
23ba : 9d 00 d0 STA $d000,x 
23bd : 9d fa d0 STA $d0fa,x 
23c0 : 9d f4 d1 STA $d1f4,x 
23c3 : 9d ee d2 STA $d2ee,x 
23c6 : d0 f1 __ BNE $23b9 ; (hires_init.l6 + 0)
.s5:
23c8 : a9 00 __ LDA #$00
23ca : 85 43 __ STA T1 + 0 
23cc : 85 0d __ STA P0 
23ce : a9 e0 __ LDA #$e0
23d0 : 85 44 __ STA T1 + 1 
23d2 : 85 0e __ STA P1 
23d4 : 20 14 24 JSR $2414 ; (memset.s4 + 0)
23d7 : a9 35 __ LDA #$35
23d9 : 85 01 __ STA $01 
23db : 20 30 24 JSR $2430 ; (mmap_trampoline.s4 + 0)
23de : 58 __ __ CLI
23df : 20 b4 7c JSR $7cb4 ; (vic_setmode@proxy + 0)
23e2 : a5 10 __ LDA P3 
23e4 : 8d dc 83 STA $83dc ; (Screen.data + 0)
23e7 : a5 11 __ LDA P4 
23e9 : 8d dd 83 STA $83dd ; (Screen.data + 1)
23ec : a9 28 __ LDA #$28
23ee : 8d e0 83 STA $83e0 ; (Screen.cwidth + 0)
23f1 : a9 19 __ LDA #$19
23f3 : 8d e1 83 STA $83e1 ; (Screen.cheight + 0)
23f6 : a9 40 __ LDA #$40
23f8 : 8d e2 83 STA $83e2 ; (Screen.width + 0)
23fb : a9 01 __ LDA #$01
23fd : 8d e3 83 STA $83e3 ; (Screen.width + 1)
2400 : a9 00 __ LDA #$00
2402 : 8d 20 d0 STA $d020 
2405 : 8d de 83 STA $83de ; (Screen.rdata + 0)
2408 : 8d df 83 STA $83df ; (Screen.rdata + 1)
.s3:
240b : 60 __ __ RTS
--------------------------------------------------------------------
memset@proxy: ; memset@proxy
240c : a9 60 __ LDA #$60
240e : 85 0d __ STA P0 
2410 : a9 f8 __ LDA #$f8
2412 : 85 0e __ STA P1 
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void
;  28, "/home/xahmol/oscar64/include/string.h"
.s4:
2414 : a5 0f __ LDA P2 
2416 : a6 12 __ LDX P5 
2418 : f0 0c __ BEQ $2426 ; (memset.s4 + 18)
241a : a0 00 __ LDY #$00
241c : 91 0d __ STA (P0),y 
241e : c8 __ __ INY
241f : d0 fb __ BNE $241c ; (memset.s4 + 8)
2421 : e6 0e __ INC P1 
2423 : ca __ __ DEX
2424 : d0 f6 __ BNE $241c ; (memset.s4 + 8)
2426 : a4 11 __ LDY P4 
2428 : f0 05 __ BEQ $242f ; (memset.s3 + 0)
242a : 88 __ __ DEY
242b : 91 0d __ STA (P0),y 
242d : d0 fb __ BNE $242a ; (memset.s4 + 22)
.s3:
242f : 60 __ __ RTS
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/xahmol/oscar64/include/c64/memmap.h"
.s4:
2430 : a9 45 __ LDA #$45
2432 : 8d fa ff STA $fffa 
2435 : a9 24 __ LDA #$24
2437 : 8d fb ff STA $fffb 
243a : a9 63 __ LDA #$63
243c : 8d fe ff STA $fffe 
243f : a9 24 __ LDA #$24
2441 : 8d ff ff STA $ffff 
.s3:
2444 : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
2445 : 48 __ __ PHA
2446 : 8a __ __ TXA
2447 : 48 __ __ PHA
2448 : a9 24 __ LDA #$24
244a : 48 __ __ PHA
244b : a9 5c __ LDA #$5c
244d : 48 __ __ PHA
244e : ba __ __ TSX
244f : bd 05 01 LDA $0105,x 
2452 : 48 __ __ PHA
2453 : a6 01 __ LDX $01 
2455 : a9 36 __ LDA #$36
2457 : 85 01 __ STA $01 
2459 : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
245c : 86 01 __ STX $01 
245e : 68 __ __ PLA
245f : aa __ __ TAX
2460 : 68 __ __ PLA
2461 : 40 __ __ RTI
2462 : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
2463 : 48 __ __ PHA
2464 : 8a __ __ TXA
2465 : 48 __ __ PHA
2466 : a9 24 __ LDA #$24
2468 : 48 __ __ PHA
2469 : a9 5c __ LDA #$5c
246b : 48 __ __ PHA
246c : ba __ __ TSX
246d : bd 05 01 LDA $0105,x 
2470 : 48 __ __ PHA
2471 : a6 01 __ LDX $01 
2473 : a9 36 __ LDA #$36
2475 : 85 01 __ STA $01 
2477 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
engine_init: ; engine_init()->void
; 332, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s4:
247a : a9 00 __ LDA #$00
247c : 8d 15 d4 STA $d415 
247f : a9 18 __ LDA #$18
2481 : 8d 16 d4 STA $d416 
2484 : a9 83 __ LDA #$83
2486 : 8d 17 d4 STA $d417 
2489 : a9 1f __ LDA #$1f
248b : 8d 18 d4 STA $d418 
248e : a9 05 __ LDA #$05
2490 : 8d 05 d4 STA $d405 
2493 : a9 f3 __ LDA #$f3
2495 : 8d 06 d4 STA $d406 
2498 : a9 a9 __ LDA #$a9
249a : 8d 00 d4 STA $d400 
249d : a9 02 __ LDA #$02
249f : 8d 01 d4 STA $d401 
24a2 : a9 21 __ LDA #$21
24a4 : 8d 04 d4 STA $d404 
24a7 : a9 05 __ LDA #$05
24a9 : 8d 0c d4 STA $d40c 
24ac : a9 f3 __ LDA #$f3
24ae : 8d 0d d4 STA $d40d 
24b1 : a9 52 __ LDA #$52
24b3 : 8d 07 d4 STA $d407 
24b6 : a9 05 __ LDA #$05
24b8 : 8d 08 d4 STA $d408 
24bb : a9 81 __ LDA #$81
24bd : 8d 0b d4 STA $d40b 
.s3:
24c0 : 60 __ __ RTS
--------------------------------------------------------------------
tod_reset: ; tod_reset()->void
; 277, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s4:
24c1 : 78 __ __ SEI
24c2 : a9 00 __ LDA #$00
24c4 : 8d 09 dc STA $dc09 
24c7 : 8d 08 dc STA $dc08 
24ca : 58 __ __ CLI
.s3:
24cb : 60 __ __ RTS
--------------------------------------------------------------------
draw_speed: ; draw_speed(u8)->void
; 194, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s1:
24cc : a2 05 __ LDX #$05
24ce : b5 53 __ LDA T1 + 0,x 
24d0 : 9d c3 bf STA $bfc3,x ; (draw_speed@stack + 0)
24d3 : ca __ __ DEX
24d4 : 10 f8 __ BPL $24ce ; (draw_speed.s1 + 2)
.s4:
24d6 : ad f3 bf LDA $bff3 ; (sstack + 9)
24d9 : 0a __ __ ASL
24da : aa __ __ TAX
24db : bd 65 7d LDA $7d65,x ; (speed_nums[0] + 0)
24de : 85 53 __ STA T1 + 0 
24e0 : 85 0d __ STA P0 
24e2 : bd 66 7d LDA $7d66,x ; (speed_nums[0] + 1)
24e5 : 85 54 __ STA T1 + 1 
24e7 : 85 0e __ STA P1 
24e9 : 20 c1 10 JSR $10c1 ; (strlen.s4 + 0)
24ec : a5 1b __ LDA ACCU + 0 
24ee : 0a __ __ ASL
24ef : a2 00 __ LDX #$00
24f1 : 90 02 __ BCC $24f5 ; (draw_speed.s9 + 0)
.s8:
24f3 : e8 __ __ INX
24f4 : 18 __ __ CLC
.s9:
24f5 : 65 1b __ ADC ACCU + 0 
24f7 : 85 43 __ STA T0 + 0 
24f9 : 8a __ __ TXA
24fa : 69 00 __ ADC #$00
24fc : 06 43 __ ASL T0 + 0 
24fe : 2a __ __ ROL
24ff : 06 43 __ ASL T0 + 0 
2501 : 2a __ __ ROL
2502 : aa __ __ TAX
2503 : 18 __ __ CLC
2504 : a5 43 __ LDA T0 + 0 
2506 : 69 28 __ ADC #$28
2508 : 85 43 __ STA T0 + 0 
250a : 90 01 __ BCC $250d ; (draw_speed.s11 + 0)
.s10:
250c : e8 __ __ INX
.s11:
250d : 86 44 __ STX T0 + 1 
250f : 38 __ __ SEC
2510 : a9 40 __ LDA #$40
2512 : e5 43 __ SBC T0 + 0 
2514 : a8 __ __ TAY
2515 : a9 01 __ LDA #$01
2517 : e5 44 __ SBC T0 + 1 
2519 : aa __ __ TAX
251a : 0a __ __ ASL
251b : 98 __ __ TYA
251c : 69 00 __ ADC #$00
251e : 85 56 __ STA T3 + 0 
2520 : 8a __ __ TXA
2521 : 69 00 __ ADC #$00
2523 : c9 80 __ CMP #$80
2525 : 6a __ __ ROR
2526 : 66 56 __ ROR T3 + 0 
2528 : 85 57 __ STA T3 + 1 
252a : a5 1b __ LDA ACCU + 0 
252c : f0 30 __ BEQ $255e ; (draw_speed.s5 + 0)
.s6:
252e : 85 55 __ STA T2 + 0 
2530 : a9 00 __ LDA #$00
2532 : 85 58 __ STA T4 + 0 
.l7:
2534 : a5 56 __ LDA T3 + 0 
2536 : 8d f0 bf STA $bff0 ; (sstack + 6)
2539 : a5 57 __ LDA T3 + 1 
253b : 8d f1 bf STA $bff1 ; (sstack + 7)
253e : a4 58 __ LDY T4 + 0 
2540 : b1 53 __ LDA (T1 + 0),y 
2542 : 38 __ __ SEC
2543 : e9 30 __ SBC #$30
2545 : 8d f2 bf STA $bff2 ; (sstack + 8)
2548 : 20 e0 25 JSR $25e0 ; (draw_glyph.s1 + 0)
254b : 18 __ __ CLC
254c : a5 56 __ LDA T3 + 0 
254e : 69 0c __ ADC #$0c
2550 : 85 56 __ STA T3 + 0 
2552 : 90 02 __ BCC $2556 ; (draw_speed.s13 + 0)
.s12:
2554 : e6 57 __ INC T3 + 1 
.s13:
2556 : e6 58 __ INC T4 + 0 
2558 : a5 58 __ LDA T4 + 0 
255a : c5 55 __ CMP T2 + 0 
255c : 90 d6 __ BCC $2534 ; (draw_speed.l7 + 0)
.s5:
255e : a9 0a __ LDA #$0a
2560 : 8d f2 bf STA $bff2 ; (sstack + 8)
2563 : 18 __ __ CLC
2564 : a5 56 __ LDA T3 + 0 
2566 : 69 06 __ ADC #$06
2568 : 85 56 __ STA T3 + 0 
256a : 8d f0 bf STA $bff0 ; (sstack + 6)
256d : a5 57 __ LDA T3 + 1 
256f : 69 00 __ ADC #$00
2571 : 85 57 __ STA T3 + 1 
2573 : 8d f1 bf STA $bff1 ; (sstack + 7)
2576 : 20 e0 25 JSR $25e0 ; (draw_glyph.s1 + 0)
2579 : a9 0b __ LDA #$0b
257b : 8d f2 bf STA $bff2 ; (sstack + 8)
257e : 18 __ __ CLC
257f : a5 56 __ LDA T3 + 0 
2581 : 69 0c __ ADC #$0c
2583 : 85 56 __ STA T3 + 0 
2585 : 8d f0 bf STA $bff0 ; (sstack + 6)
2588 : a5 57 __ LDA T3 + 1 
258a : 69 00 __ ADC #$00
258c : 85 57 __ STA T3 + 1 
258e : 8d f1 bf STA $bff1 ; (sstack + 7)
2591 : 20 e0 25 JSR $25e0 ; (draw_glyph.s1 + 0)
2594 : a9 0c __ LDA #$0c
2596 : 8d f2 bf STA $bff2 ; (sstack + 8)
2599 : 18 __ __ CLC
259a : a5 56 __ LDA T3 + 0 
259c : 69 0c __ ADC #$0c
259e : 8d f0 bf STA $bff0 ; (sstack + 6)
25a1 : a5 57 __ LDA T3 + 1 
25a3 : 69 00 __ ADC #$00
25a5 : 8d f1 bf STA $bff1 ; (sstack + 7)
25a8 : 20 e0 25 JSR $25e0 ; (draw_glyph.s1 + 0)
.s3:
25ab : a2 05 __ LDX #$05
25ad : bd c3 bf LDA $bfc3,x ; (draw_speed@stack + 0)
25b0 : 95 53 __ STA T1 + 0,x 
25b2 : ca __ __ DEX
25b3 : 10 f8 __ BPL $25ad ; (draw_speed.s3 + 2)
25b5 : 60 __ __ RTS
--------------------------------------------------------------------
25b6 : __ __ __ BYT 31 00                                           : 1.
--------------------------------------------------------------------
25b8 : __ __ __ BYT 32 00                                           : 2.
--------------------------------------------------------------------
25ba : __ __ __ BYT 33 00                                           : 3.
--------------------------------------------------------------------
25bc : __ __ __ BYT 34 00                                           : 4.
--------------------------------------------------------------------
25be : __ __ __ BYT 36 00                                           : 6.
--------------------------------------------------------------------
25c0 : __ __ __ BYT 38 00                                           : 8.
--------------------------------------------------------------------
25c2 : __ __ __ BYT 31 32 00                                        : 12.
--------------------------------------------------------------------
25c5 : __ __ __ BYT 31 36 00                                        : 16.
--------------------------------------------------------------------
25c8 : __ __ __ BYT 32 30 00                                        : 20.
--------------------------------------------------------------------
25cb : __ __ __ BYT 32 34 00                                        : 24.
--------------------------------------------------------------------
25ce : __ __ __ BYT 32 38 00                                        : 28.
--------------------------------------------------------------------
25d1 : __ __ __ BYT 33 32 00                                        : 32.
--------------------------------------------------------------------
25d4 : __ __ __ BYT 33 36 00                                        : 36.
--------------------------------------------------------------------
25d7 : __ __ __ BYT 34 30 00                                        : 40.
--------------------------------------------------------------------
25da : __ __ __ BYT 34 38 00                                        : 48.
--------------------------------------------------------------------
25dd : __ __ __ BYT 36 34 00                                        : 64.
--------------------------------------------------------------------
draw_glyph: ; draw_glyph(i16,i16,u8)->void
; 176, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s1:
25e0 : a2 04 __ LDX #$04
25e2 : b5 53 __ LDA T2 + 0,x 
25e4 : 9d ca bf STA $bfca,x ; (draw_glyph@stack + 0)
25e7 : ca __ __ DEX
25e8 : 10 f8 __ BPL $25e2 ; (draw_glyph.s1 + 2)
.s4:
25ea : ae f2 bf LDX $bff2 ; (sstack + 8)
25ed : bd d1 7b LDA $7bd1,x ; (__multab7L + 0)
25f0 : 18 __ __ CLC
25f1 : 69 85 __ ADC #$85
25f3 : 85 53 __ STA T2 + 0 
25f5 : a9 7d __ LDA #$7d
25f7 : 69 00 __ ADC #$00
25f9 : 85 54 __ STA T2 + 1 
25fb : a9 83 __ LDA #$83
25fd : 85 15 __ STA P8 
25ff : a9 dc __ LDA #$dc
2601 : 85 14 __ STA P7 
2603 : a9 44 __ LDA #$44
2605 : 85 18 __ STA P11 
2607 : a9 00 __ LDA #$00
2609 : 85 13 __ STA P6 
260b : 85 57 __ STA T6 + 0 
260d : 18 __ __ CLC
.l5:
260e : 69 57 __ ADC #$57
2610 : 0a __ __ ASL
2611 : 85 55 __ STA T4 + 0 
2613 : a2 00 __ LDX #$00
2615 : 86 56 __ STX T5 + 0 
.l6:
2617 : bd e8 88 LDA $88e8,x ; (bitshift[0] + 32)
261a : a4 57 __ LDY T6 + 0 
261c : 31 53 __ AND (T2 + 0),y 
261e : f0 30 __ BEQ $2650 ; (draw_glyph.s7 + 0)
.s9:
2620 : a5 55 __ LDA T4 + 0 
2622 : 85 12 __ STA P5 
2624 : 8d ea bf STA $bfea ; (sstack + 0)
2627 : a9 00 __ LDA #$00
2629 : 8d eb bf STA $bfeb ; (sstack + 1)
262c : 8d ed bf STA $bfed ; (sstack + 3)
262f : 8d ef bf STA $bfef ; (sstack + 5)
2632 : a9 02 __ LDA #$02
2634 : 8d ec bf STA $bfec ; (sstack + 2)
2637 : 8d ee bf STA $bfee ; (sstack + 4)
263a : 8a __ __ TXA
263b : 0a __ __ ASL
263c : 18 __ __ CLC
263d : 6d f0 bf ADC $bff0 ; (sstack + 6)
2640 : 85 10 __ STA P3 
2642 : 85 16 __ STA P9 
2644 : ad f1 bf LDA $bff1 ; (sstack + 7)
2647 : 69 00 __ ADC #$00
2649 : 85 11 __ STA P4 
264b : 85 17 __ STA P10 
264d : 20 6b 26 JSR $266b ; (bmu_bitblit.s1 + 0)
.s7:
2650 : e6 56 __ INC T5 + 0 
2652 : a6 56 __ LDX T5 + 0 
2654 : e0 05 __ CPX #$05
2656 : d0 bf __ BNE $2617 ; (draw_glyph.l6 + 0)
.s8:
2658 : e6 57 __ INC T6 + 0 
265a : a5 57 __ LDA T6 + 0 
265c : c9 07 __ CMP #$07
265e : 90 ae __ BCC $260e ; (draw_glyph.l5 + 0)
.s3:
2660 : a2 04 __ LDX #$04
2662 : bd ca bf LDA $bfca,x ; (draw_glyph@stack + 0)
2665 : 95 53 __ STA T2 + 0,x 
2667 : ca __ __ DEX
2668 : 10 f8 __ BPL $2662 ; (draw_glyph.s3 + 2)
266a : 60 __ __ RTS
--------------------------------------------------------------------
bmu_bitblit: ; bmu_bitblit(const struct Bitmap*,i16,i16,const struct Bitmap*,i16,i16,i16,i16,const u8*,enum BlitOp)->void
; 119, "/home/xahmol/oscar64/include/gfx/bitmap.h"
.s1:
266b : a2 0c __ LDX #$0c
266d : b5 53 __ LDA T11 + 0,x 
266f : 9d d3 bf STA $bfd3,x ; (bmu_bitblit@stack + 0)
2672 : ca __ __ DEX
2673 : 10 f8 __ BPL $266d ; (bmu_bitblit.s1 + 2)
.s4:
2675 : a5 10 __ LDA P3 ; (dx + 0)
2677 : 85 47 __ STA T2 + 0 
2679 : 18 __ __ CLC
267a : 6d ec bf ADC $bfec ; (sstack + 2)
267d : 85 45 __ STA T1 + 0 
267f : 29 07 __ AND #$07
2681 : aa __ __ TAX
2682 : bd e0 7d LDA $7de0,x ; (rmask[0] + 0)
2685 : 85 56 __ STA T14 + 0 
2687 : ad ed bf LDA $bfed ; (sstack + 3)
268a : 65 11 __ ADC P4 ; (dx + 1)
268c : 4a __ __ LSR
268d : 66 45 __ ROR T1 + 0 
268f : 4a __ __ LSR
2690 : 66 45 __ ROR T1 + 0 
2692 : 4a __ __ LSR
2693 : 66 45 __ ROR T1 + 0 
2695 : a5 11 __ LDA P4 ; (dx + 1)
2697 : 4a __ __ LSR
2698 : 66 47 __ ROR T2 + 0 
269a : 4a __ __ LSR
269b : 66 47 __ ROR T2 + 0 
269d : 4a __ __ LSR
269e : 66 47 __ ROR T2 + 0 
26a0 : 38 __ __ SEC
26a1 : a5 45 __ LDA T1 + 0 
26a3 : e5 47 __ SBC T2 + 0 
26a5 : 85 4d __ STA T6 + 0 
26a7 : a5 10 __ LDA P3 ; (dx + 0)
26a9 : 29 07 __ AND #$07
26ab : 85 45 __ STA T1 + 0 
26ad : aa __ __ TAX
26ae : bd f8 7c LDA $7cf8,x ; (lmask[0] + 0)
26b1 : 85 52 __ STA T12 + 0 
26b3 : 85 55 __ STA T13 + 0 
26b5 : ad ee bf LDA $bfee ; (sstack + 4)
26b8 : 85 4e __ STA T8 + 0 
26ba : a5 14 __ LDA P7 ; (sbm + 0)
26bc : 85 4f __ STA T9 + 0 
26be : a6 15 __ LDX P8 ; (sbm + 1)
26c0 : 86 50 __ STX T9 + 1 
26c2 : c9 dc __ CMP #$dc
26c4 : d0 4d __ BNE $2713 ; (bmu_bitblit.s111 + 0)
.s88:
26c6 : e0 83 __ CPX #$83
26c8 : d0 49 __ BNE $2713 ; (bmu_bitblit.s111 + 0)
.s72:
26ca : a9 dc __ LDA #$dc
26cc : 85 4f __ STA T9 + 0 
26ce : a9 83 __ LDA #$83
26d0 : 85 50 __ STA T9 + 1 
26d2 : ad eb bf LDA $bfeb ; (sstack + 1)
26d5 : c5 13 __ CMP P6 ; (dy + 1)
26d7 : d0 09 __ BNE $26e2 ; (bmu_bitblit.s87 + 0)
.s84:
26d9 : ad ea bf LDA $bfea ; (sstack + 0)
26dc : c5 12 __ CMP P5 ; (dy + 0)
.s85:
26de : b0 08 __ BCS $26e8 ; (bmu_bitblit.s73 + 0)
26e0 : 90 28 __ BCC $270a ; (bmu_bitblit.s75 + 0)
.s87:
26e2 : 45 13 __ EOR P6 ; (dy + 1)
26e4 : 10 f8 __ BPL $26de ; (bmu_bitblit.s85 + 0)
.s86:
26e6 : b0 22 __ BCS $270a ; (bmu_bitblit.s75 + 0)
.s73:
26e8 : a5 13 __ LDA P6 ; (dy + 1)
26ea : cd eb bf CMP $bfeb ; (sstack + 1)
26ed : d0 24 __ BNE $2713 ; (bmu_bitblit.s111 + 0)
.s83:
26ef : a5 12 __ LDA P5 ; (dy + 0)
26f1 : cd ea bf CMP $bfea ; (sstack + 0)
26f4 : d0 1f __ BNE $2715 ; (bmu_bitblit.s5 + 0)
.s74:
26f6 : a5 17 __ LDA P10 ; (sx + 1)
26f8 : c5 11 __ CMP P4 ; (dx + 1)
26fa : d0 08 __ BNE $2704 ; (bmu_bitblit.s82 + 0)
.s79:
26fc : a5 16 __ LDA P9 ; (sx + 0)
26fe : c5 10 __ CMP P3 ; (dx + 0)
.s80:
2700 : 90 08 __ BCC $270a ; (bmu_bitblit.s75 + 0)
2702 : b0 0f __ BCS $2713 ; (bmu_bitblit.s111 + 0)
.s82:
2704 : 45 11 __ EOR P4 ; (dx + 1)
2706 : 10 f8 __ BPL $2700 ; (bmu_bitblit.s80 + 0)
.s81:
2708 : 90 09 __ BCC $2713 ; (bmu_bitblit.s111 + 0)
.s75:
270a : a5 18 __ LDA P11 ; (op + 0)
270c : 29 08 __ AND #$08
270e : f0 03 __ BEQ $2713 ; (bmu_bitblit.s111 + 0)
2710 : 4c f9 2b JMP $2bf9 ; (bmu_bitblit.s76 + 0)
.s111:
2713 : a5 12 __ LDA P5 ; (dy + 0)
.s5:
2715 : 29 f8 __ AND #$f8
2717 : 85 1b __ STA ACCU + 0 ; (w + 0)
2719 : a5 13 __ LDA P6 ; (dy + 1)
271b : 85 1c __ STA ACCU + 1 ; (w + 1)
271d : ad e0 83 LDA $83e0 ; (Screen.cwidth + 0)
2720 : 85 51 __ STA T10 + 0 
2722 : 20 9e 77 JSR $779e ; (mul16by8 + 0)
2725 : ad dc 83 LDA $83dc ; (Screen.data + 0)
2728 : 18 __ __ CLC
2729 : 65 1b __ ADC ACCU + 0 ; (w + 0)
272b : 85 4a __ STA T4 + 0 
272d : ad dd 83 LDA $83dd ; (Screen.data + 1)
2730 : 65 1c __ ADC ACCU + 1 ; (w + 1)
2732 : aa __ __ TAX
2733 : a5 10 __ LDA P3 ; (dx + 0)
2735 : 29 f8 __ AND #$f8
2737 : 18 __ __ CLC
2738 : 65 4a __ ADC T4 + 0 
273a : 85 4a __ STA T4 + 0 
273c : 8a __ __ TXA
273d : 65 11 __ ADC P4 ; (dx + 1)
273f : aa __ __ TAX
2740 : a5 12 __ LDA P5 ; (dy + 0)
2742 : 29 07 __ AND #$07
2744 : 18 __ __ CLC
2745 : 65 4a __ ADC T4 + 0 
2747 : 85 53 __ STA T11 + 0 
2749 : 90 01 __ BCC $274c ; (bmu_bitblit.s94 + 0)
.s93:
274b : e8 __ __ INX
.s94:
274c : 86 54 __ STX T11 + 1 
274e : ad eb bf LDA $bfeb ; (sstack + 1)
2751 : 85 1c __ STA ACCU + 1 ; (w + 1)
2753 : ad ea bf LDA $bfea ; (sstack + 0)
2756 : 29 f8 __ AND #$f8
2758 : 85 1b __ STA ACCU + 0 ; (w + 0)
275a : a0 04 __ LDY #$04
275c : b1 4f __ LDA (T9 + 0),y 
275e : 20 9e 77 JSR $779e ; (mul16by8 + 0)
2761 : a0 00 __ LDY #$00
2763 : 84 57 __ STY T16 + 0 
2765 : b1 4f __ LDA (T9 + 0),y 
2767 : 18 __ __ CLC
2768 : 65 1b __ ADC ACCU + 0 ; (w + 0)
276a : 85 49 __ STA T3 + 0 
276c : c8 __ __ INY
276d : b1 4f __ LDA (T9 + 0),y 
276f : 65 1c __ ADC ACCU + 1 ; (w + 1)
2771 : aa __ __ TAX
2772 : a5 16 __ LDA P9 ; (sx + 0)
2774 : 29 f8 __ AND #$f8
2776 : 18 __ __ CLC
2777 : 65 49 __ ADC T3 + 0 
2779 : 85 49 __ STA T3 + 0 
277b : 8a __ __ TXA
277c : 65 17 __ ADC P10 ; (sx + 1)
277e : aa __ __ TAX
277f : ad ea bf LDA $bfea ; (sstack + 0)
2782 : 29 07 __ AND #$07
2784 : 18 __ __ CLC
2785 : 65 49 __ ADC T3 + 0 
2787 : 85 4a __ STA T4 + 0 
2789 : 90 01 __ BCC $278c ; (bmu_bitblit.s96 + 0)
.s95:
278b : e8 __ __ INX
.s96:
278c : 86 4b __ STX T4 + 1 
278e : a5 16 __ LDA P9 ; (sx + 0)
2790 : 29 07 __ AND #$07
2792 : 49 ff __ EOR #$ff
2794 : 38 __ __ SEC
2795 : 65 45 __ ADC T1 + 0 
2797 : 85 43 __ STA T0 + 0 
2799 : f0 0d __ BEQ $27a8 ; (bmu_bitblit.s6 + 0)
.s70:
279b : 30 0b __ BMI $27a8 ; (bmu_bitblit.s6 + 0)
.s71:
279d : 18 __ __ CLC
279e : a5 4a __ LDA T4 + 0 
27a0 : 69 f8 __ ADC #$f8
27a2 : 85 4a __ STA T4 + 0 
27a4 : b0 02 __ BCS $27a8 ; (bmu_bitblit.s6 + 0)
.s105:
27a6 : c6 4b __ DEC T4 + 1 
.s6:
27a8 : a9 18 __ LDA #$18
27aa : 85 58 __ STA T17 + 0 
27ac : a9 61 __ LDA #$61
27ae : 85 59 __ STA T18 + 0 
27b0 : a9 90 __ LDA #$90
27b2 : 85 5a __ STA T19 + 0 
27b4 : a9 e2 __ LDA #$e2
27b6 : 85 5b __ STA T20 + 0 
27b8 : a9 00 __ LDA #$00
27ba : 85 5c __ STA T21 + 0 
27bc : a9 08 __ LDA #$08
.s7:
27be : 85 5d __ STA T22 + 0 
27c0 : a5 18 __ LDA P11 ; (op + 0)
27c2 : 29 08 __ AND #$08
27c4 : 85 4c __ STA T5 + 0 
27c6 : a5 18 __ LDA P11 ; (op + 0)
27c8 : 29 10 __ AND #$10
27ca : 85 52 __ STA T12 + 0 
27cc : a5 55 __ LDA T13 + 0 
27ce : 85 45 __ STA T1 + 0 
27d0 : a5 43 __ LDA T0 + 0 
27d2 : 29 07 __ AND #$07
27d4 : 85 5f __ STA T24 + 0 
27d6 : a5 4d __ LDA T6 + 0 
27d8 : 85 5e __ STA T23 + 0 
27da : d0 06 __ BNE $27e2 ; (bmu_bitblit.s9 + 0)
.s8:
27dc : a5 56 __ LDA T14 + 0 
27de : 25 55 __ AND T13 + 0 
27e0 : 85 45 __ STA T1 + 0 
.s9:
27e2 : a9 a0 __ LDA #$a0
27e4 : 8d 00 a0 STA $a000 ; (BLIT_CODE[0] + 0)
27e7 : a5 5c __ LDA T21 + 0 
27e9 : 8d 01 a0 STA $a001 ; (BLIT_CODE[0] + 1)
27ec : a9 02 __ LDA #$02
27ee : 85 43 __ STA T0 + 0 
27f0 : a6 45 __ LDX T1 + 0 
27f2 : e8 __ __ INX
27f3 : d0 03 __ BNE $27f8 ; (bmu_bitblit.s10 + 0)
27f5 : 4c 93 2b JMP $2b93 ; (bmu_bitblit.s66 + 0)
.s10:
27f8 : a5 52 __ LDA T12 + 0 
27fa : f0 18 __ BEQ $2814 ; (bmu_bitblit.s11 + 0)
.s65:
27fc : a9 b1 __ LDA #$b1
27fe : 8d 02 a0 STA $a002 ; (BLIT_CODE[0] + 2)
2801 : a9 05 __ LDA #$05
2803 : 8d 03 a0 STA $a003 ; (BLIT_CODE[0] + 3)
2806 : a9 85 __ LDA #$85
2808 : 8d 04 a0 STA $a004 ; (BLIT_CODE[0] + 4)
280b : a9 0a __ LDA #$0a
280d : 8d 05 a0 STA $a005 ; (BLIT_CODE[0] + 5)
2810 : a9 06 __ LDA #$06
2812 : 85 43 __ STA T0 + 0 
.s11:
2814 : a5 4c __ LDA T5 + 0 
2816 : d0 05 __ BNE $281d ; (bmu_bitblit.s62 + 0)
.s12:
2818 : a5 43 __ LDA T0 + 0 
281a : 4c 78 28 JMP $2878 ; (bmu_bitblit.s92 + 0)
.s62:
281d : a5 5f __ LDA T24 + 0 
281f : d0 05 __ BNE $2826 ; (bmu_bitblit.s64 + 0)
.s63:
2821 : a5 43 __ LDA T0 + 0 
2823 : 4c 73 28 JMP $2873 ; (bmu_bitblit.s91 + 0)
.s64:
2826 : a9 b1 __ LDA #$b1
2828 : a6 43 __ LDX T0 + 0 
282a : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
282d : a9 03 __ LDA #$03
282f : 9d 01 a0 STA $a001,x ; (BLIT_CODE[0] + 1)
2832 : 9d 06 a0 STA $a006,x ; (BLIT_CODE[0] + 6)
2835 : 9d 0a a0 STA $a00a,x ; (BLIT_CODE[0] + 10)
2838 : a9 85 __ LDA #$85
283a : 9d 02 a0 STA $a002,x ; (BLIT_CODE[0] + 2)
283d : 9d 09 a0 STA $a009,x ; (BLIT_CODE[0] + 9)
2840 : a9 08 __ LDA #$08
2842 : 9d 03 a0 STA $a003,x ; (BLIT_CODE[0] + 3)
2845 : 9d 08 a0 STA $a008,x ; (BLIT_CODE[0] + 8)
2848 : a9 a5 __ LDA #$a5
284a : 9d 05 a0 STA $a005,x ; (BLIT_CODE[0] + 5)
284d : a9 02 __ LDA #$02
284f : 9d 0c a0 STA $a00c,x ; (BLIT_CODE[0] + 12)
2852 : a9 04 __ LDA #$04
2854 : 9d 0e a0 STA $a00e,x ; (BLIT_CODE[0] + 14)
2857 : a5 58 __ LDA T17 + 0 
2859 : 9d 04 a0 STA $a004,x ; (BLIT_CODE[0] + 4)
285c : a5 59 __ LDA T18 + 0 
285e : 09 08 __ ORA #$08
2860 : 9d 07 a0 STA $a007,x ; (BLIT_CODE[0] + 7)
2863 : a5 5a __ LDA T19 + 0 
2865 : 9d 0b a0 STA $a00b,x ; (BLIT_CODE[0] + 11)
2868 : a5 5b __ LDA T20 + 0 
286a : 09 04 __ ORA #$04
286c : 9d 0d a0 STA $a00d,x ; (BLIT_CODE[0] + 13)
286f : 8a __ __ TXA
2870 : 18 __ __ CLC
2871 : 69 0f __ ADC #$0f
.s91:
2873 : 85 0d __ STA P0 
2875 : 20 dd 2c JSR $2cdd ; (builddop_src@proxy + 0)
.s92:
2878 : 85 0d __ STA P0 
287a : a5 18 __ LDA P11 ; (op + 0)
287c : 85 0e __ STA P1 
287e : a5 45 __ LDA T1 + 0 
2880 : 49 ff __ EOR #$ff
2882 : 85 0f __ STA P2 
2884 : 20 20 2e JSR $2e20 ; (builddop_op.s4 + 0)
2887 : 85 43 __ STA T0 + 0 
2889 : a5 4d __ LDA T6 + 0 
288b : f0 63 __ BEQ $28f0 ; (bmu_bitblit.s13 + 0)
.s34:
288d : a9 a0 __ LDA #$a0
288f : a6 43 __ LDX T0 + 0 
2891 : e8 __ __ INX
2892 : e8 __ __ INX
2893 : 86 43 __ STX T0 + 0 
2895 : 86 0d __ STX P0 
2897 : 9d fe 9f STA $9ffe,x 
289a : 18 __ __ CLC
289b : a5 5d __ LDA T22 + 0 
289d : 65 5c __ ADC T21 + 0 
289f : 9d ff 9f STA $9fff,x 
28a2 : 85 5c __ STA T21 + 0 
28a4 : a5 4d __ LDA T6 + 0 
.s35:
28a6 : c9 02 __ CMP #$02
28a8 : 90 03 __ BCC $28ad ; (bmu_bitblit.s36 + 0)
28aa : 4c 76 2a JMP $2a76 ; (bmu_bitblit.s42 + 0)
.s36:
28ad : a5 56 __ LDA T14 + 0 
28af : f0 3f __ BEQ $28f0 ; (bmu_bitblit.s13 + 0)
.s37:
28b1 : a5 52 __ LDA T12 + 0 
28b3 : f0 1e __ BEQ $28d3 ; (bmu_bitblit.s38 + 0)
.s41:
28b5 : a9 b1 __ LDA #$b1
28b7 : a6 43 __ LDX T0 + 0 
28b9 : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
28bc : a9 05 __ LDA #$05
28be : 9d 01 a0 STA $a001,x ; (BLIT_CODE[0] + 1)
28c1 : a9 85 __ LDA #$85
28c3 : 9d 02 a0 STA $a002,x ; (BLIT_CODE[0] + 2)
28c6 : a9 0a __ LDA #$0a
28c8 : 9d 03 a0 STA $a003,x ; (BLIT_CODE[0] + 3)
28cb : 8a __ __ TXA
28cc : 18 __ __ CLC
28cd : 69 04 __ ADC #$04
28cf : 85 43 __ STA T0 + 0 
28d1 : 85 0d __ STA P0 
.s38:
28d3 : a5 4c __ LDA T5 + 0 
28d5 : d0 05 __ BNE $28dc ; (bmu_bitblit.s40 + 0)
.s39:
28d7 : a5 43 __ LDA T0 + 0 
28d9 : 4c df 28 JMP $28df ; (bmu_bitblit.s90 + 0)
.s40:
28dc : 20 dd 2c JSR $2cdd ; (builddop_src@proxy + 0)
.s90:
28df : 85 0d __ STA P0 
28e1 : a5 18 __ LDA P11 ; (op + 0)
28e3 : 85 0e __ STA P1 
28e5 : a5 56 __ LDA T14 + 0 
28e7 : 49 ff __ EOR #$ff
28e9 : 85 0f __ STA P2 
28eb : 20 20 2e JSR $2e20 ; (builddop_op.s4 + 0)
28ee : 85 43 __ STA T0 + 0 
.s13:
28f0 : a9 60 __ LDA #$60
28f2 : a6 43 __ LDX T0 + 0 
28f4 : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
28f7 : 18 __ __ CLC
28f8 : a5 51 __ LDA T10 + 0 
28fa : 69 ff __ ADC #$ff
28fc : 2a __ __ ROL
28fd : 2a __ __ ROL
28fe : 2a __ __ ROL
28ff : aa __ __ TAX
2900 : 29 f8 __ AND #$f8
2902 : 85 43 __ STA T0 + 0 
2904 : 8a __ __ TXA
2905 : 29 07 __ AND #$07
2907 : 2a __ __ ROL
2908 : 69 f8 __ ADC #$f8
290a : 85 44 __ STA T0 + 1 
290c : a5 4c __ LDA T5 + 0 
290e : d0 78 __ BNE $2988 ; (bmu_bitblit.s22 + 0)
.s14:
2910 : a5 18 __ LDA P11 ; (op + 0)
2912 : 29 20 __ AND #$20
2914 : d0 3d __ BNE $2953 ; (bmu_bitblit.l19 + 0)
.s15:
2916 : 85 47 __ STA T2 + 0 
.l16:
2918 : a5 53 __ LDA T11 + 0 
291a : 85 05 __ STA WORK + 2 
291c : 85 03 __ STA WORK + 0 
291e : a5 54 __ LDA T11 + 1 
2920 : 85 06 __ STA WORK + 3 
2922 : 85 04 __ STA WORK + 1 
2924 : a5 47 __ LDA T2 + 0 
2926 : 85 07 __ STA WORK + 4 
2928 : 20 00 a0 JSR $a000 ; (BLIT_CODE[0] + 0)
292b : e6 53 __ INC T11 + 0 
292d : d0 02 __ BNE $2931 ; (bmu_bitblit.s104 + 0)
.s103:
292f : e6 54 __ INC T11 + 1 
.s104:
2931 : a5 53 __ LDA T11 + 0 
2933 : 29 07 __ AND #$07
2935 : d0 0d __ BNE $2944 ; (bmu_bitblit.s17 + 0)
.s18:
2937 : 18 __ __ CLC
2938 : a5 53 __ LDA T11 + 0 
293a : 65 43 __ ADC T0 + 0 
293c : 85 53 __ STA T11 + 0 
293e : a5 54 __ LDA T11 + 1 
2940 : 65 44 __ ADC T0 + 1 
2942 : 85 54 __ STA T11 + 1 
.s17:
2944 : c6 4e __ DEC T8 + 0 
2946 : d0 d0 __ BNE $2918 ; (bmu_bitblit.l16 + 0)
.s3:
2948 : a2 0c __ LDX #$0c
294a : bd d3 bf LDA $bfd3,x ; (bmu_bitblit@stack + 0)
294d : 95 53 __ STA T11 + 0,x 
294f : ca __ __ DEX
2950 : 10 f8 __ BPL $294a ; (bmu_bitblit.s3 + 2)
2952 : 60 __ __ RTS
.l19:
2953 : a5 53 __ LDA T11 + 0 
2955 : 85 05 __ STA WORK + 2 
2957 : 85 03 __ STA WORK + 0 
2959 : 29 07 __ AND #$07
295b : aa __ __ TAX
295c : a5 54 __ LDA T11 + 1 
295e : 85 06 __ STA WORK + 3 
2960 : 85 04 __ STA WORK + 1 
2962 : b5 00 __ LDA $00,x 
2964 : 85 07 __ STA WORK + 4 
2966 : 20 00 a0 JSR $a000 ; (BLIT_CODE[0] + 0)
2969 : e6 53 __ INC T11 + 0 
296b : d0 02 __ BNE $296f ; (bmu_bitblit.s102 + 0)
.s101:
296d : e6 54 __ INC T11 + 1 
.s102:
296f : a5 53 __ LDA T11 + 0 
2971 : 29 07 __ AND #$07
2973 : d0 0d __ BNE $2982 ; (bmu_bitblit.s20 + 0)
.s21:
2975 : 18 __ __ CLC
2976 : a5 53 __ LDA T11 + 0 
2978 : 65 43 __ ADC T0 + 0 
297a : 85 53 __ STA T11 + 0 
297c : a5 54 __ LDA T11 + 1 
297e : 65 44 __ ADC T0 + 1 
2980 : 85 54 __ STA T11 + 1 
.s20:
2982 : c6 4e __ DEC T8 + 0 
2984 : d0 cd __ BNE $2953 ; (bmu_bitblit.l19 + 0)
2986 : f0 c0 __ BEQ $2948 ; (bmu_bitblit.s3 + 0)
.s22:
2988 : a5 4a __ LDA T4 + 0 
298a : 85 45 __ STA T1 + 0 
298c : a5 4b __ LDA T4 + 1 
298e : 85 46 __ STA T1 + 1 
2990 : a0 04 __ LDY #$04
2992 : b1 4f __ LDA (T9 + 0),y 
2994 : 18 __ __ CLC
2995 : 69 ff __ ADC #$ff
2997 : 2a __ __ ROL
2998 : 2a __ __ ROL
2999 : 2a __ __ ROL
299a : aa __ __ TAX
299b : 29 f8 __ AND #$f8
299d : 85 47 __ STA T2 + 0 
299f : 8a __ __ TXA
29a0 : 29 07 __ AND #$07
29a2 : 2a __ __ ROL
29a3 : 69 f8 __ ADC #$f8
29a5 : 85 48 __ STA T2 + 1 
29a7 : a5 57 __ LDA T16 + 0 
29a9 : f0 1d __ BEQ $29c8 ; (bmu_bitblit.l23 + 0)
.s28:
29ab : 38 __ __ SEC
29ac : a9 00 __ LDA #$00
29ae : e5 43 __ SBC T0 + 0 
29b0 : 85 43 __ STA T0 + 0 
29b2 : a9 00 __ LDA #$00
29b4 : e5 44 __ SBC T0 + 1 
29b6 : 85 44 __ STA T0 + 1 
29b8 : 38 __ __ SEC
29b9 : a9 00 __ LDA #$00
29bb : e5 47 __ SBC T2 + 0 
29bd : 85 47 __ STA T2 + 0 
29bf : a9 00 __ LDA #$00
29c1 : e5 48 __ SBC T2 + 1 
29c3 : 85 48 __ STA T2 + 1 
29c5 : 4c 1b 2a JMP $2a1b ; (bmu_bitblit.l29 + 0)
.l23:
29c8 : a5 4a __ LDA T4 + 0 
29ca : 85 03 __ STA WORK + 0 
29cc : a5 4b __ LDA T4 + 1 
29ce : 85 04 __ STA WORK + 1 
29d0 : a5 54 __ LDA T11 + 1 
29d2 : 85 06 __ STA WORK + 3 
29d4 : a5 53 __ LDA T11 + 0 
29d6 : 85 05 __ STA WORK + 2 
29d8 : 29 07 __ AND #$07
29da : a8 __ __ TAY
29db : b1 45 __ LDA (T1 + 0),y 
29dd : 85 07 __ STA WORK + 4 
29df : 20 00 a0 JSR $a000 ; (BLIT_CODE[0] + 0)
29e2 : e6 4a __ INC T4 + 0 
29e4 : d0 02 __ BNE $29e8 ; (bmu_bitblit.s98 + 0)
.s97:
29e6 : e6 4b __ INC T4 + 1 
.s98:
29e8 : a5 4a __ LDA T4 + 0 
29ea : 29 07 __ AND #$07
29ec : d0 0d __ BNE $29fb ; (bmu_bitblit.s24 + 0)
.s27:
29ee : 18 __ __ CLC
29ef : a5 4a __ LDA T4 + 0 
29f1 : 65 47 __ ADC T2 + 0 
29f3 : 85 4a __ STA T4 + 0 
29f5 : a5 4b __ LDA T4 + 1 
29f7 : 65 48 __ ADC T2 + 1 
29f9 : 85 4b __ STA T4 + 1 
.s24:
29fb : e6 53 __ INC T11 + 0 
29fd : d0 02 __ BNE $2a01 ; (bmu_bitblit.s100 + 0)
.s99:
29ff : e6 54 __ INC T11 + 1 
.s100:
2a01 : a5 53 __ LDA T11 + 0 
2a03 : 29 07 __ AND #$07
2a05 : d0 0d __ BNE $2a14 ; (bmu_bitblit.s25 + 0)
.s26:
2a07 : 18 __ __ CLC
2a08 : a5 53 __ LDA T11 + 0 
2a0a : 65 43 __ ADC T0 + 0 
2a0c : 85 53 __ STA T11 + 0 
2a0e : a5 54 __ LDA T11 + 1 
2a10 : 65 44 __ ADC T0 + 1 
2a12 : 85 54 __ STA T11 + 1 
.s25:
2a14 : c6 4e __ DEC T8 + 0 
2a16 : d0 b0 __ BNE $29c8 ; (bmu_bitblit.l23 + 0)
2a18 : 4c 48 29 JMP $2948 ; (bmu_bitblit.s3 + 0)
.l29:
2a1b : a5 4a __ LDA T4 + 0 
2a1d : 29 07 __ AND #$07
2a1f : d0 0d __ BNE $2a2e ; (bmu_bitblit.s30 + 0)
.s33:
2a21 : 18 __ __ CLC
2a22 : a5 4a __ LDA T4 + 0 
2a24 : 65 47 __ ADC T2 + 0 
2a26 : 85 4a __ STA T4 + 0 
2a28 : a5 4b __ LDA T4 + 1 
2a2a : 65 48 __ ADC T2 + 1 
2a2c : 85 4b __ STA T4 + 1 
.s30:
2a2e : a5 53 __ LDA T11 + 0 
2a30 : 29 07 __ AND #$07
2a32 : d0 0d __ BNE $2a41 ; (bmu_bitblit.s31 + 0)
.s32:
2a34 : 18 __ __ CLC
2a35 : a5 53 __ LDA T11 + 0 
2a37 : 65 43 __ ADC T0 + 0 
2a39 : 85 53 __ STA T11 + 0 
2a3b : a5 54 __ LDA T11 + 1 
2a3d : 65 44 __ ADC T0 + 1 
2a3f : 85 54 __ STA T11 + 1 
.s31:
2a41 : 18 __ __ CLC
2a42 : a5 53 __ LDA T11 + 0 
2a44 : 69 ff __ ADC #$ff
2a46 : 85 05 __ STA WORK + 2 
2a48 : 85 53 __ STA T11 + 0 
2a4a : a5 54 __ LDA T11 + 1 
2a4c : 69 ff __ ADC #$ff
2a4e : 85 54 __ STA T11 + 1 
2a50 : 85 06 __ STA WORK + 3 
2a52 : 18 __ __ CLC
2a53 : a5 4a __ LDA T4 + 0 
2a55 : 69 ff __ ADC #$ff
2a57 : 85 4a __ STA T4 + 0 
2a59 : 85 03 __ STA WORK + 0 
2a5b : a5 4b __ LDA T4 + 1 
2a5d : 69 ff __ ADC #$ff
2a5f : 85 4b __ STA T4 + 1 
2a61 : 85 04 __ STA WORK + 1 
2a63 : a5 05 __ LDA WORK + 2 
2a65 : 29 07 __ AND #$07
2a67 : a8 __ __ TAY
2a68 : b1 45 __ LDA (T1 + 0),y 
2a6a : 85 07 __ STA WORK + 4 
2a6c : 20 00 a0 JSR $a000 ; (BLIT_CODE[0] + 0)
2a6f : c6 4e __ DEC T8 + 0 
2a71 : d0 a8 __ BNE $2a1b ; (bmu_bitblit.l29 + 0)
2a73 : 4c 48 29 JMP $2948 ; (bmu_bitblit.s3 + 0)
.s42:
2a76 : a9 02 __ LDA #$02
2a78 : c5 5e __ CMP T23 + 0 
2a7a : a9 00 __ LDA #$00
2a7c : 6a __ __ ROR
2a7d : 85 49 __ STA T3 + 0 
2a7f : d0 19 __ BNE $2a9a ; (bmu_bitblit.s43 + 0)
.s61:
2a81 : a9 a2 __ LDA #$a2
2a83 : a6 43 __ LDX T0 + 0 
2a85 : e8 __ __ INX
2a86 : e8 __ __ INX
2a87 : 86 43 __ STX T0 + 0 
2a89 : 9d fe 9f STA $9ffe,x 
2a8c : 38 __ __ SEC
2a8d : a5 5e __ LDA T23 + 0 
2a8f : e9 01 __ SBC #$01
2a91 : 9d ff 9f STA $9fff,x 
2a94 : a5 5e __ LDA T23 + 0 
2a96 : c9 20 __ CMP #$20
2a98 : b0 0d __ BCS $2aa7 ; (bmu_bitblit.s45 + 0)
.s43:
2a9a : a5 5f __ LDA T24 + 0 
2a9c : d0 09 __ BNE $2aa7 ; (bmu_bitblit.s45 + 0)
.s44:
2a9e : a5 58 __ LDA T17 + 0 
2aa0 : a6 43 __ LDX T0 + 0 
2aa2 : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2aa5 : e6 43 __ INC T0 + 0 
.s45:
2aa7 : a5 43 __ LDA T0 + 0 
2aa9 : 85 55 __ STA T13 + 0 
2aab : a5 52 __ LDA T12 + 0 
2aad : f0 1c __ BEQ $2acb ; (bmu_bitblit.s46 + 0)
.s60:
2aaf : a9 b1 __ LDA #$b1
2ab1 : a6 43 __ LDX T0 + 0 
2ab3 : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2ab6 : a9 05 __ LDA #$05
2ab8 : 9d 01 a0 STA $a001,x ; (BLIT_CODE[0] + 1)
2abb : a9 85 __ LDA #$85
2abd : 9d 02 a0 STA $a002,x ; (BLIT_CODE[0] + 2)
2ac0 : a9 0a __ LDA #$0a
2ac2 : 9d 03 a0 STA $a003,x ; (BLIT_CODE[0] + 3)
2ac5 : 8a __ __ TXA
2ac6 : 18 __ __ CLC
2ac7 : 69 04 __ ADC #$04
2ac9 : 85 43 __ STA T0 + 0 
.s46:
2acb : a5 4c __ LDA T5 + 0 
2acd : d0 05 __ BNE $2ad4 ; (bmu_bitblit.s59 + 0)
.s47:
2acf : a5 43 __ LDA T0 + 0 
2ad1 : 4c db 2a JMP $2adb ; (bmu_bitblit.s89 + 0)
.s59:
2ad4 : a5 43 __ LDA T0 + 0 
2ad6 : 85 0d __ STA P0 
2ad8 : 20 dd 2c JSR $2cdd ; (builddop_src@proxy + 0)
.s89:
2adb : 85 0d __ STA P0 
2add : a5 18 __ LDA P11 ; (op + 0)
2adf : 85 0e __ STA P1 
2ae1 : a9 00 __ LDA #$00
2ae3 : 85 0f __ STA P2 
2ae5 : 20 20 2e JSR $2e20 ; (builddop_op.s4 + 0)
2ae8 : 24 49 __ BIT T3 + 0 
2aea : 10 1b __ BPL $2b07 ; (bmu_bitblit.s50 + 0)
.s48:
2aec : 85 43 __ STA T0 + 0 
2aee : aa __ __ TAX
2aef : a9 a0 __ LDA #$a0
2af1 : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2af4 : 18 __ __ CLC
2af5 : a5 5d __ LDA T22 + 0 
2af7 : 65 5c __ ADC T21 + 0 
2af9 : 9d 01 a0 STA $a001,x ; (BLIT_CODE[0] + 1)
.s49:
2afc : a6 43 __ LDX T0 + 0 
2afe : e8 __ __ INX
2aff : e8 __ __ INX
2b00 : 86 43 __ STX T0 + 0 
2b02 : 86 0d __ STX P0 
2b04 : 4c ad 28 JMP $28ad ; (bmu_bitblit.s36 + 0)
.s50:
2b07 : aa __ __ TAX
2b08 : a9 1f __ LDA #$1f
2b0a : c5 5e __ CMP T23 + 0 
2b0c : a9 00 __ LDA #$00
2b0e : 6a __ __ ROR
2b0f : 85 4d __ STA T6 + 0 
2b11 : f0 04 __ BEQ $2b17 ; (bmu_bitblit.s58 + 0)
.s51:
2b13 : a5 5f __ LDA T24 + 0 
2b15 : f0 06 __ BEQ $2b1d ; (bmu_bitblit.s52 + 0)
.s58:
2b17 : a5 58 __ LDA T17 + 0 
2b19 : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2b1c : e8 __ __ INX
.s52:
2b1d : a9 98 __ LDA #$98
2b1f : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2b22 : a9 08 __ LDA #$08
2b24 : 9d 02 a0 STA $a002,x ; (BLIT_CODE[0] + 2)
2b27 : a9 a8 __ LDA #$a8
2b29 : 9d 03 a0 STA $a003,x ; (BLIT_CODE[0] + 3)
2b2c : a5 59 __ LDA T18 + 0 
2b2e : 09 08 __ ORA #$08
2b30 : 9d 01 a0 STA $a001,x ; (BLIT_CODE[0] + 1)
2b33 : 8a __ __ TXA
2b34 : 18 __ __ CLC
2b35 : 69 04 __ ADC #$04
2b37 : 85 43 __ STA T0 + 0 
2b39 : 24 4d __ BIT T6 + 0 
2b3b : 30 3a __ BMI $2b77 ; (bmu_bitblit.s53 + 0)
.s54:
2b3d : a5 5a __ LDA T19 + 0 
2b3f : 9d 04 a0 STA $a004,x ; (BLIT_CODE[0] + 4)
2b42 : a5 5b __ LDA T20 + 0 
2b44 : 09 04 __ ORA #$04
2b46 : a8 __ __ TAY
2b47 : a5 4c __ LDA T5 + 0 
2b49 : d0 0d __ BNE $2b58 ; (bmu_bitblit.s57 + 0)
.s55:
2b4b : a9 02 __ LDA #$02
2b4d : 9d 05 a0 STA $a005,x ; (BLIT_CODE[0] + 5)
2b50 : 18 __ __ CLC
2b51 : a5 43 __ LDA T0 + 0 
2b53 : 69 02 __ ADC #$02
2b55 : 4c 69 2b JMP $2b69 ; (bmu_bitblit.s56 + 0)
.s57:
2b58 : a9 04 __ LDA #$04
2b5a : 9d 05 a0 STA $a005,x ; (BLIT_CODE[0] + 5)
2b5d : 9d 07 a0 STA $a007,x ; (BLIT_CODE[0] + 7)
2b60 : 98 __ __ TYA
2b61 : 9d 06 a0 STA $a006,x ; (BLIT_CODE[0] + 6)
2b64 : 18 __ __ CLC
2b65 : a5 43 __ LDA T0 + 0 
2b67 : 69 04 __ ADC #$04
.s56:
2b69 : aa __ __ TAX
2b6a : e8 __ __ INX
2b6b : e8 __ __ INX
2b6c : 86 43 __ STX T0 + 0 
2b6e : 98 __ __ TYA
2b6f : 9d fe 9f STA $9ffe,x 
2b72 : a9 06 __ LDA #$06
2b74 : 9d ff 9f STA $9fff,x 
.s53:
2b77 : a9 ca __ LDA #$ca
2b79 : a6 43 __ LDX T0 + 0 
2b7b : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2b7e : a9 d0 __ LDA #$d0
2b80 : 9d 01 a0 STA $a001,x ; (BLIT_CODE[0] + 1)
2b83 : e6 43 __ INC T0 + 0 
2b85 : a5 55 __ LDA T13 + 0 
2b87 : 38 __ __ SEC
2b88 : e5 43 __ SBC T0 + 0 
2b8a : 38 __ __ SEC
2b8b : e9 02 __ SBC #$02
2b8d : 9d 02 a0 STA $a002,x ; (BLIT_CODE[0] + 2)
2b90 : 4c fc 2a JMP $2afc ; (bmu_bitblit.s49 + 0)
.s66:
2b93 : 85 0d __ STA P0 
2b95 : a5 4c __ LDA T5 + 0 
2b97 : f0 51 __ BEQ $2bea ; (bmu_bitblit.s67 + 0)
.s68:
2b99 : a5 5f __ LDA T24 + 0 
2b9b : f0 4d __ BEQ $2bea ; (bmu_bitblit.s67 + 0)
.s69:
2b9d : a9 03 __ LDA #$03
2b9f : 8d 03 a0 STA $a003 ; (BLIT_CODE[0] + 3)
2ba2 : 8d 08 a0 STA $a008 ; (BLIT_CODE[0] + 8)
2ba5 : 8d 0c a0 STA $a00c ; (BLIT_CODE[0] + 12)
2ba8 : a9 b1 __ LDA #$b1
2baa : 8d 02 a0 STA $a002 ; (BLIT_CODE[0] + 2)
2bad : a9 85 __ LDA #$85
2baf : 8d 04 a0 STA $a004 ; (BLIT_CODE[0] + 4)
2bb2 : 8d 0b a0 STA $a00b ; (BLIT_CODE[0] + 11)
2bb5 : a9 08 __ LDA #$08
2bb7 : 8d 05 a0 STA $a005 ; (BLIT_CODE[0] + 5)
2bba : 8d 0a a0 STA $a00a ; (BLIT_CODE[0] + 10)
2bbd : a9 a5 __ LDA #$a5
2bbf : 8d 07 a0 STA $a007 ; (BLIT_CODE[0] + 7)
2bc2 : a9 02 __ LDA #$02
2bc4 : 8d 0e a0 STA $a00e ; (BLIT_CODE[0] + 14)
2bc7 : a9 04 __ LDA #$04
2bc9 : 8d 10 a0 STA $a010 ; (BLIT_CODE[0] + 16)
2bcc : a5 58 __ LDA T17 + 0 
2bce : 8d 06 a0 STA $a006 ; (BLIT_CODE[0] + 6)
2bd1 : a5 59 __ LDA T18 + 0 
2bd3 : 09 08 __ ORA #$08
2bd5 : 8d 09 a0 STA $a009 ; (BLIT_CODE[0] + 9)
2bd8 : a5 5a __ LDA T19 + 0 
2bda : 8d 0d a0 STA $a00d ; (BLIT_CODE[0] + 13)
2bdd : a5 5b __ LDA T20 + 0 
2bdf : 09 04 __ ORA #$04
2be1 : 8d 0f a0 STA $a00f ; (BLIT_CODE[0] + 15)
2be4 : a9 11 __ LDA #$11
2be6 : 85 43 __ STA T0 + 0 
2be8 : 85 0d __ STA P0 
.s67:
2bea : 18 __ __ CLC
2beb : a5 4d __ LDA T6 + 0 
2bed : 69 01 __ ADC #$01
2bef : 85 5e __ STA T23 + 0 
2bf1 : d0 03 __ BNE $2bf6 ; (bmu_bitblit.s67 + 12)
2bf3 : 4c f0 28 JMP $28f0 ; (bmu_bitblit.s13 + 0)
2bf6 : 4c a6 28 JMP $28a6 ; (bmu_bitblit.s35 + 0)
.s76:
2bf9 : 18 __ __ CLC
2bfa : a5 12 __ LDA P5 ; (dy + 0)
2bfc : 65 4e __ ADC T8 + 0 
2bfe : 85 47 __ STA T2 + 0 
2c00 : 29 f8 __ AND #$f8
2c02 : 85 1b __ STA ACCU + 0 ; (w + 0)
2c04 : a5 13 __ LDA P6 ; (dy + 1)
2c06 : 69 00 __ ADC #$00
2c08 : 85 1c __ STA ACCU + 1 ; (w + 1)
2c0a : ad e0 83 LDA $83e0 ; (Screen.cwidth + 0)
2c0d : 85 51 __ STA T10 + 0 
2c0f : 20 9e 77 JSR $779e ; (mul16by8 + 0)
2c12 : ad dc 83 LDA $83dc ; (Screen.data + 0)
2c15 : 18 __ __ CLC
2c16 : 65 1b __ ADC ACCU + 0 ; (w + 0)
2c18 : 85 4c __ STA T5 + 0 
2c1a : ad dd 83 LDA $83dd ; (Screen.data + 1)
2c1d : 65 1c __ ADC ACCU + 1 ; (w + 1)
2c1f : aa __ __ TAX
2c20 : a5 10 __ LDA P3 ; (dx + 0)
2c22 : 29 f8 __ AND #$f8
2c24 : 18 __ __ CLC
2c25 : 65 4c __ ADC T5 + 0 
2c27 : 85 4c __ STA T5 + 0 
2c29 : 8a __ __ TXA
2c2a : 65 11 __ ADC P4 ; (dx + 1)
2c2c : aa __ __ TAX
2c2d : a5 47 __ LDA T2 + 0 
2c2f : 29 07 __ AND #$07
2c31 : 18 __ __ CLC
2c32 : 65 4c __ ADC T5 + 0 
2c34 : 85 4c __ STA T5 + 0 
2c36 : 90 02 __ BCC $2c3a ; (bmu_bitblit.s107 + 0)
.s106:
2c38 : e8 __ __ INX
2c39 : 18 __ __ CLC
.s107:
2c3a : a5 4d __ LDA T6 + 0 
2c3c : 69 e1 __ ADC #$e1
2c3e : 2a __ __ ROL
2c3f : 2a __ __ ROL
2c40 : 2a __ __ ROL
2c41 : a8 __ __ TAY
2c42 : 29 f8 __ AND #$f8
2c44 : 85 43 __ STA T0 + 0 
2c46 : 98 __ __ TYA
2c47 : 29 07 __ AND #$07
2c49 : 2a __ __ ROL
2c4a : 69 f8 __ ADC #$f8
2c4c : 85 44 __ STA T0 + 1 
2c4e : 18 __ __ CLC
2c4f : a5 4c __ LDA T5 + 0 
2c51 : 65 43 __ ADC T0 + 0 
2c53 : 85 53 __ STA T11 + 0 
2c55 : 8a __ __ TXA
2c56 : 65 44 __ ADC T0 + 1 
2c58 : 85 54 __ STA T11 + 1 
2c5a : a5 56 __ LDA T14 + 0 
2c5c : 85 55 __ STA T13 + 0 
2c5e : a5 52 __ LDA T12 + 0 
2c60 : 85 56 __ STA T14 + 0 
2c62 : ad ea bf LDA $bfea ; (sstack + 0)
2c65 : 18 __ __ CLC
2c66 : 65 4e __ ADC T8 + 0 
2c68 : 85 47 __ STA T2 + 0 
2c6a : 29 f8 __ AND #$f8
2c6c : 85 1b __ STA ACCU + 0 ; (w + 0)
2c6e : ad eb bf LDA $bfeb ; (sstack + 1)
2c71 : 69 00 __ ADC #$00
2c73 : 85 1c __ STA ACCU + 1 ; (w + 1)
2c75 : ad e0 83 LDA $83e0 ; (Screen.cwidth + 0)
2c78 : 20 9e 77 JSR $779e ; (mul16by8 + 0)
2c7b : ad dc 83 LDA $83dc ; (Screen.data + 0)
2c7e : 18 __ __ CLC
2c7f : 65 1b __ ADC ACCU + 0 ; (w + 0)
2c81 : 85 4a __ STA T4 + 0 
2c83 : ad dd 83 LDA $83dd ; (Screen.data + 1)
2c86 : 65 1c __ ADC ACCU + 1 ; (w + 1)
2c88 : aa __ __ TAX
2c89 : a5 16 __ LDA P9 ; (sx + 0)
2c8b : 29 f8 __ AND #$f8
2c8d : 18 __ __ CLC
2c8e : 65 4a __ ADC T4 + 0 
2c90 : 85 4a __ STA T4 + 0 
2c92 : 8a __ __ TXA
2c93 : 65 17 __ ADC P10 ; (sx + 1)
2c95 : aa __ __ TAX
2c96 : a5 47 __ LDA T2 + 0 
2c98 : 29 07 __ AND #$07
2c9a : 18 __ __ CLC
2c9b : 65 4a __ ADC T4 + 0 
2c9d : 90 02 __ BCC $2ca1 ; (bmu_bitblit.s109 + 0)
.s108:
2c9f : e8 __ __ INX
2ca0 : 18 __ __ CLC
.s109:
2ca1 : 65 43 __ ADC T0 + 0 
2ca3 : 85 4a __ STA T4 + 0 
2ca5 : 8a __ __ TXA
2ca6 : 65 44 __ ADC T0 + 1 
2ca8 : 85 4b __ STA T4 + 1 
2caa : a9 01 __ LDA #$01
2cac : 85 57 __ STA T16 + 0 
2cae : a5 16 __ LDA P9 ; (sx + 0)
2cb0 : 29 07 __ AND #$07
2cb2 : 49 ff __ EOR #$ff
2cb4 : 38 __ __ SEC
2cb5 : 65 45 __ ADC T1 + 0 
2cb7 : 85 43 __ STA T0 + 0 
2cb9 : 10 0b __ BPL $2cc6 ; (bmu_bitblit.s77 + 0)
.s78:
2cbb : 18 __ __ CLC
2cbc : a5 4a __ LDA T4 + 0 
2cbe : 69 08 __ ADC #$08
2cc0 : 85 4a __ STA T4 + 0 
2cc2 : 90 02 __ BCC $2cc6 ; (bmu_bitblit.s77 + 0)
.s110:
2cc4 : e6 4b __ INC T4 + 1 
.s77:
2cc6 : a9 38 __ LDA #$38
2cc8 : 85 58 __ STA T17 + 0 
2cca : a9 e1 __ LDA #$e1
2ccc : 85 59 __ STA T18 + 0 
2cce : a9 b0 __ LDA #$b0
2cd0 : 85 5a __ STA T19 + 0 
2cd2 : a9 c2 __ LDA #$c2
2cd4 : 85 5b __ STA T20 + 0 
2cd6 : a9 f8 __ LDA #$f8
2cd8 : 85 5c __ STA T21 + 0 
2cda : 4c be 27 JMP $27be ; (bmu_bitblit.s7 + 0)
--------------------------------------------------------------------
builddop_src@proxy: ; builddop_src@proxy
2cdd : a5 5f __ LDA $5f 
2cdf : 85 0e __ STA P1 
2ce1 : a5 57 __ LDA $57 
2ce3 : 85 0f __ STA P2 
--------------------------------------------------------------------
builddop_src: ; builddop_src(u8,u8,bool)->u8
; 888, "/home/xahmol/oscar64/include/gfx/bitmap.c"
.s4:
2ce5 : a6 0d __ LDX P0 ; (ip + 0)
2ce7 : e8 __ __ INX
2ce8 : a4 0d __ LDY P0 ; (ip + 0)
2cea : e8 __ __ INX
2ceb : a5 0e __ LDA P1 ; (shift + 0)
2ced : d0 0c __ BNE $2cfb ; (builddop_src.s6 + 0)
.s5:
2cef : a9 b1 __ LDA #$b1
2cf1 : 99 00 a0 STA $a000,y ; (BLIT_CODE[0] + 0)
2cf4 : a9 03 __ LDA #$03
2cf6 : 99 01 a0 STA $a001,y ; (BLIT_CODE[0] + 1)
.s35:
2cf9 : 8a __ __ TXA
.s3:
2cfa : 60 __ __ RTS
.s6:
2cfb : a9 a5 __ LDA #$a5
2cfd : 99 00 a0 STA $a000,y ; (BLIT_CODE[0] + 0)
2d00 : a9 08 __ LDA #$08
2d02 : 99 01 a0 STA $a001,y ; (BLIT_CODE[0] + 1)
2d05 : a5 0f __ LDA P2 ; (reverse + 0)
2d07 : f0 03 __ BEQ $2d0c ; (builddop_src.s7 + 0)
2d09 : 4c 12 2e JMP $2e12 ; (builddop_src.s26 + 0)
.s7:
2d0c : a5 0e __ LDA P1 ; (shift + 0)
2d0e : c9 05 __ CMP #$05
2d10 : b0 06 __ BCS $2d18 ; (builddop_src.s8 + 0)
.s24:
2d12 : a9 4a __ LDA #$4a
.s25:
2d14 : 99 02 a0 STA $a002,y ; (BLIT_CODE[0] + 2)
2d17 : e8 __ __ INX
.s8:
2d18 : a9 85 __ LDA #$85
2d1a : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2d1d : 9d 04 a0 STA $a004,x ; (BLIT_CODE[0] + 4)
2d20 : a9 09 __ LDA #$09
2d22 : 9d 01 a0 STA $a001,x ; (BLIT_CODE[0] + 1)
2d25 : a9 b1 __ LDA #$b1
2d27 : 9d 02 a0 STA $a002,x ; (BLIT_CODE[0] + 2)
2d2a : a9 03 __ LDA #$03
2d2c : 9d 03 a0 STA $a003,x ; (BLIT_CODE[0] + 3)
2d2f : a9 08 __ LDA #$08
2d31 : 9d 05 a0 STA $a005,x ; (BLIT_CODE[0] + 5)
2d34 : 8a __ __ TXA
2d35 : 18 __ __ CLC
2d36 : 69 06 __ ADC #$06
2d38 : 85 1b __ STA ACCU + 0 
2d3a : 85 0d __ STA P0 ; (ip + 0)
2d3c : a5 0f __ LDA P2 ; (reverse + 0)
2d3e : d0 6a __ BNE $2daa ; (builddop_src.s17 + 0)
.s9:
2d40 : a5 0e __ LDA P1 ; (shift + 0)
2d42 : c9 05 __ CMP #$05
2d44 : 90 0b __ BCC $2d51 ; (builddop_src.s10 + 0)
.s13:
2d46 : a9 0a __ LDA #$0a
2d48 : 9d 06 a0 STA $a006,x ; (BLIT_CODE[0] + 6)
2d4b : e6 1b __ INC ACCU + 0 
2d4d : a6 0e __ LDX P1 ; (shift + 0)
2d4f : b0 2e __ BCS $2d7f ; (builddop_src.l14 + 0)
.s10:
2d51 : c9 02 __ CMP #$02
2d53 : 90 1f __ BCC $2d74 ; (builddop_src.s11 + 0)
.s12:
2d55 : c6 0e __ DEC P1 ; (shift + 0)
2d57 : a6 0d __ LDX P0 ; (ip + 0)
2d59 : a4 0e __ LDY P1 ; (shift + 0)
.l31:
2d5b : a9 6a __ LDA #$6a
2d5d : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2d60 : a9 46 __ LDA #$46
2d62 : 9d 01 a0 STA $a001,x ; (BLIT_CODE[0] + 1)
2d65 : a9 09 __ LDA #$09
2d67 : 9d 02 a0 STA $a002,x ; (BLIT_CODE[0] + 2)
2d6a : 8a __ __ TXA
2d6b : 18 __ __ CLC
2d6c : 69 03 __ ADC #$03
2d6e : aa __ __ TAX
2d6f : 88 __ __ DEY
2d70 : d0 e9 __ BNE $2d5b ; (builddop_src.l31 + 0)
.s32:
2d72 : 85 0d __ STA P0 ; (ip + 0)
.s11:
2d74 : a9 6a __ LDA #$6a
.s33:
2d76 : a6 0d __ LDX P0 ; (ip + 0)
2d78 : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2d7b : e8 __ __ INX
2d7c : 4c f9 2c JMP $2cf9 ; (builddop_src.s35 + 0)
.l14:
2d7f : a9 09 __ LDA #$09
2d81 : a4 1b __ LDY ACCU + 0 
2d83 : 99 01 a0 STA $a001,y ; (BLIT_CODE[0] + 1)
2d86 : 98 __ __ TYA
2d87 : 18 __ __ CLC
2d88 : 69 03 __ ADC #$03
2d8a : 85 1b __ STA ACCU + 0 
2d8c : e0 07 __ CPX #$07
2d8e : b0 0d __ BCS $2d9d ; (builddop_src.s15 + 0)
.s16:
2d90 : a9 26 __ LDA #$26
2d92 : 99 00 a0 STA $a000,y ; (BLIT_CODE[0] + 0)
2d95 : a9 0a __ LDA #$0a
2d97 : 99 02 a0 STA $a002,y ; (BLIT_CODE[0] + 2)
2d9a : e8 __ __ INX
2d9b : 90 e2 __ BCC $2d7f ; (builddop_src.l14 + 0)
.s15:
2d9d : a9 a5 __ LDA #$a5
2d9f : 99 00 a0 STA $a000,y ; (BLIT_CODE[0] + 0)
2da2 : a9 2a __ LDA #$2a
2da4 : 99 02 a0 STA $a002,y ; (BLIT_CODE[0] + 2)
2da7 : a5 1b __ LDA ACCU + 0 
2da9 : 60 __ __ RTS
.s17:
2daa : a4 0e __ LDY P1 ; (shift + 0)
2dac : c0 05 __ CPY #$05
2dae : b0 3d __ BCS $2ded ; (builddop_src.s21 + 0)
.s18:
2db0 : a9 4a __ LDA #$4a
2db2 : 9d 06 a0 STA $a006,x ; (BLIT_CODE[0] + 6)
2db5 : e6 1b __ INC ACCU + 0 
2db7 : c0 02 __ CPY #$02
2db9 : 90 1c __ BCC $2dd7 ; (builddop_src.s19 + 0)
.s20:
2dbb : a6 1b __ LDX ACCU + 0 
2dbd : 88 __ __ DEY
.l29:
2dbe : a9 66 __ LDA #$66
2dc0 : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2dc3 : a9 09 __ LDA #$09
2dc5 : 9d 01 a0 STA $a001,x ; (BLIT_CODE[0] + 1)
2dc8 : a9 4a __ LDA #$4a
2dca : 9d 02 a0 STA $a002,x ; (BLIT_CODE[0] + 2)
2dcd : 8a __ __ TXA
2dce : 18 __ __ CLC
2dcf : 69 03 __ ADC #$03
2dd1 : aa __ __ TAX
2dd2 : 88 __ __ DEY
2dd3 : d0 e9 __ BNE $2dbe ; (builddop_src.l29 + 0)
.s30:
2dd5 : 85 1b __ STA ACCU + 0 
.s19:
2dd7 : a9 a5 __ LDA #$a5
2dd9 : a6 1b __ LDX ACCU + 0 
2ddb : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2dde : a9 09 __ LDA #$09
2de0 : 9d 01 a0 STA $a001,x ; (BLIT_CODE[0] + 1)
2de3 : a9 6a __ LDA #$6a
2de5 : 9d 02 a0 STA $a002,x ; (BLIT_CODE[0] + 2)
2de8 : 8a __ __ TXA
2de9 : 18 __ __ CLC
2dea : 69 03 __ ADC #$03
2dec : 60 __ __ RTS
.s21:
2ded : c0 07 __ CPY #$07
2def : b0 1c __ BCS $2e0d ; (builddop_src.s22 + 0)
.s23:
2df1 : a6 0d __ LDX P0 ; (ip + 0)
.l34:
2df3 : a9 2a __ LDA #$2a
2df5 : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2df8 : a9 06 __ LDA #$06
2dfa : 9d 01 a0 STA $a001,x ; (BLIT_CODE[0] + 1)
2dfd : a9 09 __ LDA #$09
2dff : 9d 02 a0 STA $a002,x ; (BLIT_CODE[0] + 2)
2e02 : 8a __ __ TXA
2e03 : 69 03 __ ADC #$03
2e05 : c8 __ __ INY
2e06 : c0 07 __ CPY #$07
2e08 : aa __ __ TAX
2e09 : 90 e8 __ BCC $2df3 ; (builddop_src.l34 + 0)
.s28:
2e0b : 85 0d __ STA P0 ; (ip + 0)
.s22:
2e0d : a9 2a __ LDA #$2a
2e0f : 4c 76 2d JMP $2d76 ; (builddop_src.s33 + 0)
.s26:
2e12 : a5 0e __ LDA P1 ; (shift + 0)
2e14 : c9 05 __ CMP #$05
2e16 : b0 03 __ BCS $2e1b ; (builddop_src.s27 + 0)
2e18 : 4c 18 2d JMP $2d18 ; (builddop_src.s8 + 0)
.s27:
2e1b : a9 0a __ LDA #$0a
2e1d : 4c 14 2d JMP $2d14 ; (builddop_src.s25 + 0)
--------------------------------------------------------------------
builddop_op: ; builddop_op(u8,enum BlitOp,u8)->u8
; 965, "/home/xahmol/oscar64/include/gfx/bitmap.c"
.s4:
2e20 : a5 0e __ LDA P1 ; (op + 0)
2e22 : 29 20 __ AND #$20
2e24 : f0 04 __ BEQ $2e2a ; (builddop_op.s27 + 0)
.s28:
2e26 : a9 07 __ LDA #$07
2e28 : d0 02 __ BNE $2e2c ; (builddop_op.s29 + 0)
.s27:
2e2a : a9 0a __ LDA #$0a
.s29:
2e2c : 85 1c __ STA ACCU + 1 
2e2e : a5 0e __ LDA P1 ; (op + 0)
2e30 : 29 03 __ AND #$03
2e32 : a8 __ __ TAY
2e33 : a5 0e __ LDA P1 ; (op + 0)
2e35 : 29 04 __ AND #$04
2e37 : f0 03 __ BEQ $2e3c ; (builddop_op.s5 + 0)
2e39 : 4c ce 2e JMP $2ece ; (builddop_op.s18 + 0)
.s5:
2e3c : a5 0e __ LDA P1 ; (op + 0)
2e3e : 29 08 __ AND #$08
2e40 : d0 13 __ BNE $2e55 ; (builddop_op.s15 + 0)
.s6:
2e42 : a9 a5 __ LDA #$a5
2e44 : a6 0d __ LDX P0 ; (ip + 0)
2e46 : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2e49 : a5 1c __ LDA ACCU + 1 
.s7:
2e4b : e8 __ __ INX
2e4c : e8 __ __ INX
2e4d : 86 0d __ STX P0 ; (ip + 0)
2e4f : 9d ff 9f STA $9fff,x 
2e52 : 4c 65 2e JMP $2e65 ; (builddop_op.s16 + 0)
.s15:
2e55 : a5 0e __ LDA P1 ; (op + 0)
2e57 : 0a __ __ ASL
2e58 : 10 0b __ BPL $2e65 ; (builddop_op.s16 + 0)
.s17:
2e5a : a9 49 __ LDA #$49
2e5c : a6 0d __ LDX P0 ; (ip + 0)
2e5e : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2e61 : a9 ff __ LDA #$ff
2e63 : d0 e6 __ BNE $2e4b ; (builddop_op.s7 + 0)
.s16:
2e65 : 98 __ __ TYA
2e66 : f0 13 __ BEQ $2e7b ; (builddop_op.s8 + 0)
.s14:
2e68 : a5 1c __ LDA ACCU + 1 
2e6a : a6 0d __ LDX P0 ; (ip + 0)
2e6c : e8 __ __ INX
2e6d : e8 __ __ INX
2e6e : 86 0d __ STX P0 ; (ip + 0)
2e70 : 9d ff 9f STA $9fff,x 
2e73 : b9 fa 7b LDA $7bfa,y ; (blitops_op[0] + 0)
2e76 : 09 04 __ ORA #$04
2e78 : 9d fe 9f STA $9ffe,x 
.s8:
2e7b : a5 0f __ LDA P2 ; (mask + 0)
2e7d : f0 3f __ BEQ $2ebe ; (builddop_op.s9 + 0)
.s10:
2e7f : a9 85 __ LDA #$85
2e81 : a4 0d __ LDY P0 ; (ip + 0)
2e83 : 99 00 a0 STA $a000,y ; (BLIT_CODE[0] + 0)
2e86 : a9 09 __ LDA #$09
2e88 : 99 01 a0 STA $a001,y ; (BLIT_CODE[0] + 1)
2e8b : 98 __ __ TYA
2e8c : 18 __ __ CLC
2e8d : 69 08 __ ADC #$08
2e8f : 85 0d __ STA P0 ; (ip + 0)
2e91 : a5 0e __ LDA P1 ; (op + 0)
2e93 : 29 10 __ AND #$10
2e95 : f0 09 __ BEQ $2ea0 ; (builddop_op.s11 + 0)
.s13:
2e97 : a9 45 __ LDA #$45
2e99 : 99 02 a0 STA $a002,y ; (BLIT_CODE[0] + 2)
2e9c : a9 0a __ LDA #$0a
2e9e : d0 07 __ BNE $2ea7 ; (builddop_op.s12 + 0)
.s11:
2ea0 : a9 51 __ LDA #$51
2ea2 : 99 02 a0 STA $a002,y ; (BLIT_CODE[0] + 2)
2ea5 : a9 05 __ LDA #$05
.s12:
2ea7 : 99 03 a0 STA $a003,y ; (BLIT_CODE[0] + 3)
2eaa : a9 29 __ LDA #$29
2eac : 99 04 a0 STA $a004,y ; (BLIT_CODE[0] + 4)
2eaf : a5 0f __ LDA P2 ; (mask + 0)
2eb1 : 99 05 a0 STA $a005,y ; (BLIT_CODE[0] + 5)
2eb4 : a9 45 __ LDA #$45
2eb6 : 99 06 a0 STA $a006,y ; (BLIT_CODE[0] + 6)
2eb9 : a9 09 __ LDA #$09
2ebb : 99 07 a0 STA $a007,y ; (BLIT_CODE[0] + 7)
.s9:
2ebe : a9 91 __ LDA #$91
2ec0 : a6 0d __ LDX P0 ; (ip + 0)
2ec2 : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2ec5 : a9 05 __ LDA #$05
2ec7 : 9d 01 a0 STA $a001,x ; (BLIT_CODE[0] + 1)
2eca : e8 __ __ INX
2ecb : e8 __ __ INX
2ecc : 8a __ __ TXA
.s3:
2ecd : 60 __ __ RTS
.s18:
2ece : 98 __ __ TYA
2ecf : d0 04 __ BNE $2ed5 ; (builddop_op.s20 + 0)
.s19:
2ed1 : a5 0f __ LDA P2 ; (mask + 0)
2ed3 : d0 16 __ BNE $2eeb ; (builddop_op.s23 + 0)
.s20:
2ed5 : a5 0e __ LDA P1 ; (op + 0)
2ed7 : 29 40 __ AND #$40
2ed9 : f0 02 __ BEQ $2edd ; (builddop_op.s21 + 0)
.s22:
2edb : a9 ff __ LDA #$ff
.s21:
2edd : 85 1b __ STA ACCU + 0 
2edf : a9 a9 __ LDA #$a9
2ee1 : a6 0d __ LDX P0 ; (ip + 0)
2ee3 : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2ee6 : a5 1b __ LDA ACCU + 0 
2ee8 : 4c 4b 2e JMP $2e4b ; (builddop_op.s7 + 0)
.s23:
2eeb : a9 b1 __ LDA #$b1
2eed : a4 0d __ LDY P0 ; (ip + 0)
2eef : 99 00 a0 STA $a000,y ; (BLIT_CODE[0] + 0)
2ef2 : a9 05 __ LDA #$05
2ef4 : 99 01 a0 STA $a001,y ; (BLIT_CODE[0] + 1)
2ef7 : 06 0e __ ASL P1 ; (op + 0)
2ef9 : 30 0a __ BMI $2f05 ; (builddop_op.s26 + 0)
.s24:
2efb : a9 29 __ LDA #$29
2efd : 99 02 a0 STA $a002,y ; (BLIT_CODE[0] + 2)
2f00 : a5 0f __ LDA P2 ; (mask + 0)
2f02 : 4c 0e 2f JMP $2f0e ; (builddop_op.s25 + 0)
.s26:
2f05 : a9 09 __ LDA #$09
2f07 : 99 02 a0 STA $a002,y ; (BLIT_CODE[0] + 2)
2f0a : a5 0f __ LDA P2 ; (mask + 0)
2f0c : 49 ff __ EOR #$ff
.s25:
2f0e : 99 03 a0 STA $a003,y ; (BLIT_CODE[0] + 3)
2f11 : a9 91 __ LDA #$91
2f13 : 99 04 a0 STA $a004,y ; (BLIT_CODE[0] + 4)
2f16 : a9 05 __ LDA #$05
2f18 : 99 05 a0 STA $a005,y ; (BLIT_CODE[0] + 5)
2f1b : 98 __ __ TYA
2f1c : 18 __ __ CLC
2f1d : 69 06 __ ADC #$06
2f1f : 60 __ __ RTS
--------------------------------------------------------------------
draw_message: ; draw_message(u8)->void
; 234, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s1:
2f20 : a2 04 __ LDX #$04
2f22 : b5 53 __ LDA T1 + 0,x 
2f24 : 9d cd bf STA $bfcd,x ; (draw_message@stack + 0)
2f27 : ca __ __ DEX
2f28 : 10 f8 __ BPL $2f22 ; (draw_message.s1 + 2)
.s4:
2f2a : ad f0 bf LDA $bff0 ; (sstack + 6)
2f2d : 0a __ __ ASL
2f2e : aa __ __ TAX
2f2f : bd 00 7e LDA $7e00,x ; (step_msg[0] + 0)
2f32 : 85 56 __ STA T3 + 0 
2f34 : 85 0d __ STA P0 
2f36 : bd 01 7e LDA $7e01,x ; (step_msg[0] + 1)
2f39 : 85 57 __ STA T3 + 1 
2f3b : 85 0e __ STA P1 
2f3d : 20 c1 10 JSR $10c1 ; (strlen.s4 + 0)
2f40 : a9 00 __ LDA #$00
2f42 : 85 53 __ STA T1 + 0 
2f44 : 85 54 __ STA T1 + 1 
2f46 : a5 1b __ LDA ACCU + 0 
2f48 : f0 1b __ BEQ $2f65 ; (draw_message.s5 + 0)
.s6:
2f4a : a0 00 __ LDY #$00
.l7:
2f4c : b1 56 __ LDA (T3 + 0),y 
2f4e : 38 __ __ SEC
2f4f : e9 20 __ SBC #$20
2f51 : aa __ __ TAX
2f52 : bd 80 7e LDA $7e80,x ; (TinyFont[0] + 96)
2f55 : 4a __ __ LSR
2f56 : 4a __ __ LSR
2f57 : 38 __ __ SEC
2f58 : 65 53 __ ADC T1 + 0 
2f5a : 85 53 __ STA T1 + 0 
2f5c : 90 02 __ BCC $2f60 ; (draw_message.s9 + 0)
.s8:
2f5e : e6 54 __ INC T1 + 1 
.s9:
2f60 : c8 __ __ INY
2f61 : c4 1b __ CPY ACCU + 0 
2f63 : 90 e7 __ BCC $2f4c ; (draw_message.l7 + 0)
.s5:
2f65 : a5 0d __ LDA P0 
2f67 : 85 0e __ STA P1 
2f69 : a5 57 __ LDA T3 + 1 
2f6b : 85 0f __ STA P2 
2f6d : a5 1b __ LDA ACCU + 0 
2f6f : 85 10 __ STA P3 
2f71 : 38 __ __ SEC
2f72 : a9 40 __ LDA #$40
2f74 : e5 53 __ SBC T1 + 0 
2f76 : a8 __ __ TAY
2f77 : a9 01 __ LDA #$01
2f79 : e5 54 __ SBC T1 + 1 
2f7b : aa __ __ TAX
2f7c : 0a __ __ ASL
2f7d : 98 __ __ TYA
2f7e : 69 00 __ ADC #$00
2f80 : 85 53 __ STA T1 + 0 
2f82 : 8a __ __ TXA
2f83 : 69 00 __ ADC #$00
2f85 : c9 80 __ CMP #$80
2f87 : 6a __ __ ROR
2f88 : 66 53 __ ROR T1 + 0 
2f8a : 85 54 __ STA T1 + 1 
2f8c : a5 53 __ LDA T1 + 0 
2f8e : 29 07 __ AND #$07
2f90 : 85 55 __ STA T2 + 0 
2f92 : 85 0d __ STA P0 
2f94 : 20 7f 31 JSR $317f ; (bmu_text.s4 + 0)
2f97 : a5 53 __ LDA T1 + 0 
2f99 : 85 10 __ STA P3 
2f9b : a5 54 __ LDA T1 + 1 
2f9d : 85 11 __ STA P4 
2f9f : a9 00 __ LDA #$00
2fa1 : 85 13 __ STA P6 
2fa3 : 85 17 __ STA P10 
2fa5 : 8d ea bf STA $bfea ; (sstack + 0)
2fa8 : 8d eb bf STA $bfeb ; (sstack + 1)
2fab : 8d ef bf STA $bfef ; (sstack + 5)
2fae : a5 55 __ LDA T2 + 0 
2fb0 : 85 16 __ STA P9 
2fb2 : a9 a2 __ LDA #$a2
2fb4 : 85 12 __ STA P5 
2fb6 : a5 1b __ LDA ACCU + 0 
2fb8 : 8d ec bf STA $bfec ; (sstack + 2)
2fbb : a5 1c __ LDA ACCU + 1 
2fbd : 8d ed bf STA $bfed ; (sstack + 3)
2fc0 : a9 08 __ LDA #$08
2fc2 : 85 18 __ STA P11 
2fc4 : 8d ee bf STA $bfee ; (sstack + 4)
2fc7 : a9 e8 __ LDA #$e8
2fc9 : 85 14 __ STA P7 
2fcb : a9 7d __ LDA #$7d
2fcd : 85 15 __ STA P8 
2fcf : 20 6b 26 JSR $266b ; (bmu_bitblit.s1 + 0)
.s3:
2fd2 : a2 04 __ LDX #$04
2fd4 : bd cd bf LDA $bfcd,x ; (draw_message@stack + 0)
2fd7 : 95 53 __ STA T1 + 0,x 
2fd9 : ca __ __ DEX
2fda : 10 f8 __ BPL $2fd4 ; (draw_message.s3 + 2)
2fdc : 60 __ __ RTS
--------------------------------------------------------------------
2fdd : __ __ __ BYT 53 74 61 6e 64 61 72 64 20 31 20 4d 48 7a 20 43 : Standard 1 MHz C
2fed : __ __ __ BYT 36 34 20 73 70 65 65 64 00                      : 64 speed.
--------------------------------------------------------------------
2ff6 : __ __ __ BYT 54 75 72 62 6f 20 65 6e 67 61 67 65 64 3a 20 32 : Turbo engaged: 2
3006 : __ __ __ BYT 20 4d 48 7a 00                                  :  MHz.
--------------------------------------------------------------------
300b : __ __ __ BYT 33 20 4d 48 7a 20 2d 20 77 61 72 6d 69 6e 67 20 : 3 MHz - warming 
301b : __ __ __ BYT 75 70 00                                        : up.
--------------------------------------------------------------------
301e : __ __ __ BYT 34 20 4d 48 7a 20 2d 20 73 6d 6f 6f 74 68 20 61 : 4 MHz - smooth a
302e : __ __ __ BYT 6c 72 65 61 64 79 21 00                         : lready!.
--------------------------------------------------------------------
3036 : __ __ __ BYT 36 20 4d 48 7a 20 2d 20 74 68 69 73 20 66 65 65 : 6 MHz - this fee
3046 : __ __ __ BYT 6c 73 20 64 69 66 66 65 72 65 6e 74 00          : ls different.
--------------------------------------------------------------------
3053 : __ __ __ BYT 38 20 4d 48 7a 20 2d 20 74 68 69 6e 67 73 20 61 : 8 MHz - things a
3063 : __ __ __ BYT 72 65 20 6d 6f 76 69 6e 67 00                   : re moving.
--------------------------------------------------------------------
306d : __ __ __ BYT 31 32 20 4d 48 7a 20 2d 20 70 69 63 6b 69 6e 67 : 12 MHz - picking
307d : __ __ __ BYT 20 75 70 20 73 70 65 65 64 00                   :  up speed.
--------------------------------------------------------------------
3087 : __ __ __ BYT 31 36 20 4d 48 7a 20 2d 20 6e 6f 74 69 63 65 61 : 16 MHz - noticea
3097 : __ __ __ BYT 62 6c 79 20 66 61 73 74 00                      : bly fast.
--------------------------------------------------------------------
30a0 : __ __ __ BYT 32 30 20 4d 48 7a 20 2d 20 77 68 61 74 20 69 73 : 20 MHz - what is
30b0 : __ __ __ BYT 20 68 61 70 70 65 6e 69 6e 67 3f 00             :  happening?.
--------------------------------------------------------------------
30bc : __ __ __ BYT 32 34 20 4d 48 7a 20 2d 20 65 79 65 73 20 63 61 : 24 MHz - eyes ca
30cc : __ __ __ BYT 6e 20 62 61 72 65 6c 79 20 66 6f 6c 6c 6f 77 00 : n barely follow.
--------------------------------------------------------------------
30dc : __ __ __ BYT 32 38 20 4d 48 7a 20 2d 20 74 68 69 73 20 69 73 : 28 MHz - this is
30ec : __ __ __ BYT 20 69 6e 63 72 65 64 69 62 6c 65 21 00          :  incredible!.
--------------------------------------------------------------------
30f9 : __ __ __ BYT 33 32 20 4d 48 7a 20 2d 20 74 68 65 20 6d 61 63 : 32 MHz - the mac
3109 : __ __ __ BYT 68 69 6e 65 20 73 63 72 65 61 6d 73 00          : hine screams.
--------------------------------------------------------------------
3116 : __ __ __ BYT 33 36 20 4d 48 7a 20 2d 20 62 65 79 6f 6e 64 20 : 36 MHz - beyond 
3126 : __ __ __ BYT 69 6d 61 67 69 6e 61 74 69 6f 6e 00             : imagination.
--------------------------------------------------------------------
3132 : __ __ __ BYT 34 30 20 4d 48 7a 20 2d 20 68 6f 6c 64 20 6f 6e : 40 MHz - hold on
3142 : __ __ __ BYT 20 74 69 67 68 74 21 00                         :  tight!.
--------------------------------------------------------------------
314a : __ __ __ BYT 34 38 20 4d 48 7a 20 2d 20 6d 61 78 69 6d 75 6d : 48 MHz - maximum
315a : __ __ __ BYT 20 6f 76 65 72 64 72 69 76 65 21 00             :  overdrive!.
--------------------------------------------------------------------
3166 : __ __ __ BYT 36 34 20 4d 48 7a 20 20 55 4c 54 49 4d 41 54 45 : 64 MHz  ULTIMATE
3176 : __ __ __ BYT 20 53 50 45 45 44 21 21 00                      :  SPEED!!.
--------------------------------------------------------------------
bmu_text: ; bmu_text(const struct Bitmap*,u8,const u8*,u8)->i16
; 151, "/home/xahmol/oscar64/include/gfx/bitmap.h"
.s4:
317f : a9 00 __ LDA #$00
3181 : 8d e4 83 STA $83e4 ; (tworks[0] + 0)
3184 : 8d e5 83 STA $83e5 ; (tworks[0] + 1)
3187 : 8d e6 83 STA $83e6 ; (tworks[0] + 2)
318a : 8d e7 83 STA $83e7 ; (tworks[0] + 3)
318d : 8d e8 83 STA $83e8 ; (tworks[0] + 4)
3190 : 8d e9 83 STA $83e9 ; (tworks[0] + 5)
3193 : 8d ea 83 STA $83ea ; (tworks[0] + 6)
3196 : 8d eb 83 STA $83eb ; (tworks[0] + 7)
3199 : 85 1b __ STA ACCU + 0 
319b : 85 1c __ STA ACCU + 1 
319d : ad e8 7d LDA $7de8 ; (tbitmap.data + 0)
31a0 : 85 43 __ STA T1 + 0 
31a2 : ad e9 7d LDA $7de9 ; (tbitmap.data + 1)
31a5 : 85 44 __ STA T1 + 1 
31a7 : a5 10 __ LDA P3 ; (len + 0)
31a9 : d0 03 __ BNE $31ae ; (bmu_text.s7 + 0)
31ab : 4c bb 32 JMP $32bb ; (bmu_text.s5 + 0)
.s7:
31ae : a0 00 __ LDY #$00
.l8:
31b0 : 84 1d __ STY ACCU + 2 
31b2 : b1 0e __ LDA (P1),y ; (str + 0)
31b4 : 38 __ __ SEC
31b5 : e9 20 __ SBC #$20
31b7 : aa __ __ TAX
31b8 : 18 __ __ CLC
31b9 : a9 e0 __ LDA #$e0
31bb : 7d 20 7e ADC $7e20,x ; (TinyFont[0] + 0)
31be : 85 45 __ STA T6 + 0 
31c0 : bd 80 7e LDA $7e80,x ; (TinyFont[0] + 96)
31c3 : 29 03 __ AND #$03
31c5 : 69 7e __ ADC #$7e
31c7 : 85 46 __ STA T6 + 1 
31c9 : bd 80 7e LDA $7e80,x ; (TinyFont[0] + 96)
31cc : 4a __ __ LSR
31cd : 4a __ __ LSR
31ce : 85 1e __ STA ACCU + 3 
31d0 : 38 __ __ SEC
31d1 : 65 1b __ ADC ACCU + 0 
31d3 : 85 1b __ STA ACCU + 0 
31d5 : 90 02 __ BCC $31d9 ; (bmu_text.s19 + 0)
.s18:
31d7 : e6 1c __ INC ACCU + 1 
.s19:
31d9 : a9 00 __ LDA #$00
31db : 85 47 __ STA T7 + 0 
31dd : a5 1e __ LDA ACCU + 3 
31df : f0 73 __ BEQ $3254 ; (bmu_text.s9 + 0)
.s16:
31e1 : a6 0d __ LDX P0 ; (lx + 0)
31e3 : a0 00 __ LDY #$00
.l12:
31e5 : b1 45 __ LDA (T6 + 0),y 
31e7 : 0a __ __ ASL
31e8 : 2e e4 83 ROL $83e4 ; (tworks[0] + 0)
31eb : 0a __ __ ASL
31ec : 2e e5 83 ROL $83e5 ; (tworks[0] + 1)
31ef : 0a __ __ ASL
31f0 : 2e e6 83 ROL $83e6 ; (tworks[0] + 2)
31f3 : 0a __ __ ASL
31f4 : 2e e7 83 ROL $83e7 ; (tworks[0] + 3)
31f7 : 0a __ __ ASL
31f8 : 2e e8 83 ROL $83e8 ; (tworks[0] + 4)
31fb : 0a __ __ ASL
31fc : 2e e9 83 ROL $83e9 ; (tworks[0] + 5)
31ff : 0a __ __ ASL
3200 : 2e ea 83 ROL $83ea ; (tworks[0] + 6)
3203 : 0a __ __ ASL
3204 : 2e eb 83 ROL $83eb ; (tworks[0] + 7)
3207 : e8 __ __ INX
3208 : e0 08 __ CPX #$08
320a : d0 3e __ BNE $324a ; (bmu_text.s13 + 0)
.s14:
320c : ad e4 83 LDA $83e4 ; (tworks[0] + 0)
320f : a0 00 __ LDY #$00
3211 : 91 43 __ STA (T1 + 0),y 
3213 : ad e5 83 LDA $83e5 ; (tworks[0] + 1)
3216 : c8 __ __ INY
3217 : 91 43 __ STA (T1 + 0),y 
3219 : ad e6 83 LDA $83e6 ; (tworks[0] + 2)
321c : c8 __ __ INY
321d : 91 43 __ STA (T1 + 0),y 
321f : ad e7 83 LDA $83e7 ; (tworks[0] + 3)
3222 : c8 __ __ INY
3223 : 91 43 __ STA (T1 + 0),y 
3225 : ad e8 83 LDA $83e8 ; (tworks[0] + 4)
3228 : c8 __ __ INY
3229 : 91 43 __ STA (T1 + 0),y 
322b : ad e9 83 LDA $83e9 ; (tworks[0] + 5)
322e : c8 __ __ INY
322f : 91 43 __ STA (T1 + 0),y 
3231 : ad ea 83 LDA $83ea ; (tworks[0] + 6)
3234 : c8 __ __ INY
3235 : 91 43 __ STA (T1 + 0),y 
3237 : ad eb 83 LDA $83eb ; (tworks[0] + 7)
323a : c8 __ __ INY
323b : 91 43 __ STA (T1 + 0),y 
323d : 18 __ __ CLC
323e : a5 43 __ LDA T1 + 0 
3240 : 69 08 __ ADC #$08
3242 : 85 43 __ STA T1 + 0 
3244 : 90 02 __ BCC $3248 ; (bmu_text.s21 + 0)
.s20:
3246 : e6 44 __ INC T1 + 1 
.s21:
3248 : a2 00 __ LDX #$00
.s13:
324a : e6 47 __ INC T7 + 0 
324c : a4 47 __ LDY T7 + 0 
324e : c4 1e __ CPY ACCU + 3 
3250 : 90 93 __ BCC $31e5 ; (bmu_text.l12 + 0)
.s17:
3252 : 86 0d __ STX P0 ; (lx + 0)
.s9:
3254 : 0e e4 83 ASL $83e4 ; (tworks[0] + 0)
3257 : 0e e5 83 ASL $83e5 ; (tworks[0] + 1)
325a : 0e e6 83 ASL $83e6 ; (tworks[0] + 2)
325d : 0e e7 83 ASL $83e7 ; (tworks[0] + 3)
3260 : 0e e8 83 ASL $83e8 ; (tworks[0] + 4)
3263 : 0e e9 83 ASL $83e9 ; (tworks[0] + 5)
3266 : 0e ea 83 ASL $83ea ; (tworks[0] + 6)
3269 : 0e eb 83 ASL $83eb ; (tworks[0] + 7)
326c : e6 0d __ INC P0 ; (lx + 0)
326e : a5 0d __ LDA P0 ; (lx + 0)
3270 : c9 08 __ CMP #$08
3272 : d0 3d __ BNE $32b1 ; (bmu_text.s10 + 0)
.s11:
3274 : ad e4 83 LDA $83e4 ; (tworks[0] + 0)
3277 : a0 00 __ LDY #$00
3279 : 84 0d __ STY P0 ; (lx + 0)
327b : 91 43 __ STA (T1 + 0),y 
327d : ad e5 83 LDA $83e5 ; (tworks[0] + 1)
3280 : c8 __ __ INY
3281 : 91 43 __ STA (T1 + 0),y 
3283 : ad e6 83 LDA $83e6 ; (tworks[0] + 2)
3286 : c8 __ __ INY
3287 : 91 43 __ STA (T1 + 0),y 
3289 : ad e7 83 LDA $83e7 ; (tworks[0] + 3)
328c : c8 __ __ INY
328d : 91 43 __ STA (T1 + 0),y 
328f : ad e8 83 LDA $83e8 ; (tworks[0] + 4)
3292 : c8 __ __ INY
3293 : 91 43 __ STA (T1 + 0),y 
3295 : ad e9 83 LDA $83e9 ; (tworks[0] + 5)
3298 : c8 __ __ INY
3299 : 91 43 __ STA (T1 + 0),y 
329b : ad ea 83 LDA $83ea ; (tworks[0] + 6)
329e : c8 __ __ INY
329f : 91 43 __ STA (T1 + 0),y 
32a1 : ad eb 83 LDA $83eb ; (tworks[0] + 7)
32a4 : c8 __ __ INY
32a5 : 91 43 __ STA (T1 + 0),y 
32a7 : a5 43 __ LDA T1 + 0 
32a9 : 69 07 __ ADC #$07
32ab : 85 43 __ STA T1 + 0 
32ad : 90 02 __ BCC $32b1 ; (bmu_text.s10 + 0)
.s22:
32af : e6 44 __ INC T1 + 1 
.s10:
32b1 : a4 1d __ LDY ACCU + 2 
32b3 : c8 __ __ INY
32b4 : c4 10 __ CPY P3 ; (len + 0)
32b6 : b0 03 __ BCS $32bb ; (bmu_text.s5 + 0)
32b8 : 4c b0 31 JMP $31b0 ; (bmu_text.l8 + 0)
.s5:
32bb : a6 0d __ LDX P0 ; (lx + 0)
32bd : e0 08 __ CPX #$08
32bf : b0 1d __ BCS $32de ; (bmu_text.s6 + 0)
.l15:
32c1 : 0e e4 83 ASL $83e4 ; (tworks[0] + 0)
32c4 : 0e e5 83 ASL $83e5 ; (tworks[0] + 1)
32c7 : 0e e6 83 ASL $83e6 ; (tworks[0] + 2)
32ca : 0e e7 83 ASL $83e7 ; (tworks[0] + 3)
32cd : 0e e8 83 ASL $83e8 ; (tworks[0] + 4)
32d0 : 0e e9 83 ASL $83e9 ; (tworks[0] + 5)
32d3 : 0e ea 83 ASL $83ea ; (tworks[0] + 6)
32d6 : 0e eb 83 ASL $83eb ; (tworks[0] + 7)
32d9 : e8 __ __ INX
32da : e0 08 __ CPX #$08
32dc : 90 e3 __ BCC $32c1 ; (bmu_text.l15 + 0)
.s6:
32de : ad e4 83 LDA $83e4 ; (tworks[0] + 0)
32e1 : a0 00 __ LDY #$00
32e3 : 91 43 __ STA (T1 + 0),y 
32e5 : ad e5 83 LDA $83e5 ; (tworks[0] + 1)
32e8 : c8 __ __ INY
32e9 : 91 43 __ STA (T1 + 0),y 
32eb : ad e6 83 LDA $83e6 ; (tworks[0] + 2)
32ee : c8 __ __ INY
32ef : 91 43 __ STA (T1 + 0),y 
32f1 : ad e7 83 LDA $83e7 ; (tworks[0] + 3)
32f4 : c8 __ __ INY
32f5 : 91 43 __ STA (T1 + 0),y 
32f7 : ad e8 83 LDA $83e8 ; (tworks[0] + 4)
32fa : c8 __ __ INY
32fb : 91 43 __ STA (T1 + 0),y 
32fd : ad e9 83 LDA $83e9 ; (tworks[0] + 5)
3300 : c8 __ __ INY
3301 : 91 43 __ STA (T1 + 0),y 
3303 : ad ea 83 LDA $83ea ; (tworks[0] + 6)
3306 : c8 __ __ INY
3307 : 91 43 __ STA (T1 + 0),y 
3309 : ad eb 83 LDA $83eb ; (tworks[0] + 7)
330c : c8 __ __ INY
330d : 91 43 __ STA (T1 + 0),y 
.s3:
330f : 60 __ __ RTS
--------------------------------------------------------------------
draw_gear: ; draw_gear(i16,i16,u8,u8,u8,u8,u8,u8,u8,u8)->void
;  88, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s1:
3310 : a2 20 __ LDX #$20
3312 : b5 53 __ LDA T0 + 0,x 
3314 : 9d b0 bf STA $bfb0,x ; (draw_gear@stack + 0)
3317 : ca __ __ DEX
3318 : 10 f8 __ BPL $3312 ; (draw_gear.s1 + 2)
.s4:
331a : ad fd bf LDA $bffd ; (sstack + 19)
331d : 85 5d __ STA T5 + 0 
331f : ad fc bf LDA $bffc ; (sstack + 18)
3322 : 85 5e __ STA T6 + 0 
3324 : ad f9 bf LDA $bff9 ; (sstack + 15)
3327 : 85 5f __ STA T7 + 0 
3329 : ad fb bf LDA $bffb ; (sstack + 17)
332c : 85 60 __ STA T8 + 0 
332e : 4a __ __ LSR
332f : 85 61 __ STA T9 + 0 
3331 : a9 00 __ LDA #$00
3333 : 85 62 __ STA T10 + 0 
3335 : 85 63 __ STA T11 + 0 
3337 : 85 64 __ STA T11 + 1 
3339 : 85 65 __ STA T12 + 0 
333b : 85 66 __ STA T12 + 1 
333d : 85 53 __ STA T0 + 0 
333f : 85 54 __ STA T0 + 1 
3341 : 85 55 __ STA T1 + 0 
3343 : 85 56 __ STA T1 + 1 
3345 : ae ff bf LDX $bfff ; (sstack + 21)
3348 : 86 71 __ STX T20 + 0 
334a : ae fe bf LDX $bffe ; (sstack + 20)
334d : 86 72 __ STX T21 + 0 
334f : ae fa bf LDX $bffa ; (sstack + 16)
3352 : 86 73 __ STX T22 + 0 
3354 : ae f7 bf LDX $bff7 ; (sstack + 13)
3357 : 86 67 __ STX T13 + 0 
.l5:
3359 : 85 1b __ STA ACCU + 0 
335b : a9 00 __ LDA #$00
335d : 85 1c __ STA ACCU + 1 
335f : a5 60 __ LDA T8 + 0 
3361 : 20 9e 77 JSR $779e ; (mul16by8 + 0)
3364 : 18 __ __ CLC
3365 : a5 1b __ LDA ACCU + 0 
3367 : 65 5f __ ADC T7 + 0 
3369 : 29 3f __ AND #$3f
336b : 85 68 __ STA T14 + 0 
336d : 18 __ __ CLC
336e : 69 10 __ ADC #$10
3370 : 29 3f __ AND #$3f
3372 : aa __ __ TAX
3373 : bd 4b 80 LDA $804b,x ; (sin64[0] + 0)
3376 : 85 57 __ STA T2 + 0 
3378 : 0a __ __ ASL
3379 : a9 00 __ LDA #$00
337b : 85 04 __ STA WORK + 1 
337d : 69 ff __ ADC #$ff
337f : 49 ff __ EOR #$ff
3381 : 85 58 __ STA T2 + 1 
3383 : a5 57 __ LDA T2 + 0 
3385 : 0a __ __ ASL
3386 : 85 1b __ STA ACCU + 0 
3388 : a5 58 __ LDA T2 + 1 
338a : 2a __ __ ROL
338b : 06 1b __ ASL ACCU + 0 
338d : 2a __ __ ROL
338e : 85 1c __ STA ACCU + 1 
3390 : 20 4e 78 JSR $784e ; (divs16@proxy + 0)
3393 : a5 1b __ LDA ACCU + 0 
3395 : 85 69 __ STA T15 + 0 
3397 : a5 1c __ LDA ACCU + 1 
3399 : 85 6a __ STA T15 + 1 
339b : a6 68 __ LDX T14 + 0 
339d : bd 4b 80 LDA $804b,x ; (sin64[0] + 0)
33a0 : 85 59 __ STA T3 + 0 
33a2 : 85 1b __ STA ACCU + 0 
33a4 : 29 80 __ AND #$80
33a6 : 10 02 __ BPL $33aa ; (draw_gear.l5 + 81)
33a8 : a9 ff __ LDA #$ff
33aa : 85 5a __ STA T3 + 1 
33ac : 85 1c __ STA ACCU + 1 
33ae : a5 5d __ LDA T5 + 0 
33b0 : 20 9e 77 JSR $779e ; (mul16by8 + 0)
33b3 : 20 84 7c JSR $7c84 ; (divs16@proxy + 0)
33b6 : 18 __ __ CLC
33b7 : a5 1b __ LDA ACCU + 0 
33b9 : 69 58 __ ADC #$58
33bb : 85 6b __ STA T16 + 0 
33bd : a5 1c __ LDA ACCU + 1 
33bf : 69 00 __ ADC #$00
33c1 : 85 6c __ STA T16 + 1 
33c3 : a5 57 __ LDA T2 + 0 
33c5 : 85 1b __ STA ACCU + 0 
33c7 : a5 58 __ LDA T2 + 1 
33c9 : 85 1c __ STA ACCU + 1 
33cb : a5 5d __ LDA T5 + 0 
33cd : 20 9e 77 JSR $779e ; (mul16by8 + 0)
33d0 : 20 84 7c JSR $7c84 ; (divs16@proxy + 0)
33d3 : 18 __ __ CLC
33d4 : a5 1b __ LDA ACCU + 0 
33d6 : 65 67 __ ADC T13 + 0 
33d8 : 85 6d __ STA T17 + 0 
33da : a5 1c __ LDA ACCU + 1 
33dc : 69 00 __ ADC #$00
33de : 85 6e __ STA T17 + 1 
33e0 : a5 59 __ LDA T3 + 0 
33e2 : 85 1b __ STA ACCU + 0 
33e4 : a5 5a __ LDA T3 + 1 
33e6 : 85 1c __ STA ACCU + 1 
33e8 : a5 5e __ LDA T6 + 0 
33ea : 20 9e 77 JSR $779e ; (mul16by8 + 0)
33ed : 20 84 7c JSR $7c84 ; (divs16@proxy + 0)
33f0 : 18 __ __ CLC
33f1 : a5 1b __ LDA ACCU + 0 
33f3 : 69 58 __ ADC #$58
33f5 : 85 5b __ STA T4 + 0 
33f7 : a5 1c __ LDA ACCU + 1 
33f9 : 69 00 __ ADC #$00
33fb : 85 5c __ STA T4 + 1 
33fd : a5 57 __ LDA T2 + 0 
33ff : 85 1b __ STA ACCU + 0 
3401 : a5 58 __ LDA T2 + 1 
3403 : 85 1c __ STA ACCU + 1 
3405 : a5 5e __ LDA T6 + 0 
3407 : 20 9e 77 JSR $779e ; (mul16by8 + 0)
340a : 20 84 7c JSR $7c84 ; (divs16@proxy + 0)
340d : 18 __ __ CLC
340e : a5 1b __ LDA ACCU + 0 
3410 : 65 67 __ ADC T13 + 0 
3412 : 85 57 __ STA T2 + 0 
3414 : a5 1c __ LDA ACCU + 1 
3416 : 69 00 __ ADC #$00
3418 : 85 58 __ STA T2 + 1 
341a : 38 __ __ SEC
341b : a9 00 __ LDA #$00
341d : e5 59 __ SBC T3 + 0 
341f : 85 1b __ STA ACCU + 0 
3421 : a9 00 __ LDA #$00
3423 : 85 04 __ STA WORK + 1 
3425 : e5 5a __ SBC T3 + 1 
3427 : 06 1b __ ASL ACCU + 0 
3429 : 2a __ __ ROL
342a : 06 1b __ ASL ACCU + 0 
342c : 2a __ __ ROL
342d : 85 1c __ STA ACCU + 1 
342f : 20 4e 78 JSR $784e ; (divs16@proxy + 0)
3432 : a5 1b __ LDA ACCU + 0 
3434 : 85 59 __ STA T3 + 0 
3436 : a5 1c __ LDA ACCU + 1 
3438 : 85 5a __ STA T3 + 1 
343a : 05 1b __ ORA ACCU + 0 
343c : d0 12 __ BNE $3450 ; (draw_gear.s6 + 0)
.s12:
343e : 85 59 __ STA T3 + 0 
3440 : 85 5a __ STA T3 + 1 
3442 : a5 69 __ LDA T15 + 0 
3444 : 05 6a __ ORA T15 + 1 
3446 : d0 08 __ BNE $3450 ; (draw_gear.s6 + 0)
.s13:
3448 : a9 01 __ LDA #$01
344a : 85 69 __ STA T15 + 0 
344c : a9 00 __ LDA #$00
344e : 85 6a __ STA T15 + 1 
.s6:
3450 : a5 62 __ LDA T10 + 0 
3452 : d0 1d __ BNE $3471 ; (draw_gear.s11 + 0)
.s7:
3454 : 38 __ __ SEC
3455 : a5 5b __ LDA T4 + 0 
3457 : e5 69 __ SBC T15 + 0 
3459 : 85 65 __ STA T12 + 0 
345b : a5 5c __ LDA T4 + 1 
345d : e5 6a __ SBC T15 + 1 
345f : 85 66 __ STA T12 + 1 
3461 : 38 __ __ SEC
3462 : a5 57 __ LDA T2 + 0 
3464 : e5 59 __ SBC T3 + 0 
3466 : 85 63 __ STA T11 + 0 
3468 : a5 58 __ LDA T2 + 1 
346a : e5 5a __ SBC T3 + 1 
346c : 85 64 __ STA T11 + 1 
346e : 4c bf 34 JMP $34bf ; (draw_gear.s8 + 0)
.s11:
3471 : a5 53 __ LDA T0 + 0 
3473 : 8d ee bf STA $bfee ; (sstack + 4)
3476 : a5 54 __ LDA T0 + 1 
3478 : 8d ef bf STA $bfef ; (sstack + 5)
347b : a5 55 __ LDA T1 + 0 
347d : 8d f0 bf STA $bff0 ; (sstack + 6)
3480 : a5 56 __ LDA T1 + 1 
3482 : 8d f1 bf STA $bff1 ; (sstack + 7)
3485 : a9 03 __ LDA #$03
3487 : 8d f6 bf STA $bff6 ; (sstack + 12)
348a : a9 dc __ LDA #$dc
348c : 8d ea bf STA $bfea ; (sstack + 0)
348f : a9 83 __ LDA #$83
3491 : 8d eb bf STA $bfeb ; (sstack + 1)
3494 : a9 f0 __ LDA #$f0
3496 : 8d ec bf STA $bfec ; (sstack + 2)
3499 : a9 7d __ LDA #$7d
349b : 8d ed bf STA $bfed ; (sstack + 3)
349e : 38 __ __ SEC
349f : a5 57 __ LDA T2 + 0 
34a1 : e5 59 __ SBC T3 + 0 
34a3 : 8d f2 bf STA $bff2 ; (sstack + 8)
34a6 : a5 58 __ LDA T2 + 1 
34a8 : e5 5a __ SBC T3 + 1 
34aa : 8d f3 bf STA $bff3 ; (sstack + 9)
34ad : 38 __ __ SEC
34ae : a5 5b __ LDA T4 + 0 
34b0 : e5 69 __ SBC T15 + 0 
34b2 : 8d f4 bf STA $bff4 ; (sstack + 10)
34b5 : a5 5c __ LDA T4 + 1 
34b7 : e5 6a __ SBC T15 + 1 
34b9 : 8d f5 bf STA $bff5 ; (sstack + 11)
34bc : 20 b0 37 JSR $37b0 ; (bm_line.s1 + 0)
.s8:
34bf : a9 03 __ LDA #$03
34c1 : 8d f6 bf STA $bff6 ; (sstack + 12)
34c4 : a9 dc __ LDA #$dc
34c6 : 8d ea bf STA $bfea ; (sstack + 0)
34c9 : a9 83 __ LDA #$83
34cb : 8d eb bf STA $bfeb ; (sstack + 1)
34ce : a9 f0 __ LDA #$f0
34d0 : 8d ec bf STA $bfec ; (sstack + 2)
34d3 : a9 7d __ LDA #$7d
34d5 : 8d ed bf STA $bfed ; (sstack + 3)
34d8 : 38 __ __ SEC
34d9 : a5 57 __ LDA T2 + 0 
34db : e5 59 __ SBC T3 + 0 
34dd : 8d ee bf STA $bfee ; (sstack + 4)
34e0 : a5 58 __ LDA T2 + 1 
34e2 : e5 5a __ SBC T3 + 1 
34e4 : 8d ef bf STA $bfef ; (sstack + 5)
34e7 : 38 __ __ SEC
34e8 : a5 5b __ LDA T4 + 0 
34ea : e5 69 __ SBC T15 + 0 
34ec : 8d f0 bf STA $bff0 ; (sstack + 6)
34ef : a5 5c __ LDA T4 + 1 
34f1 : e5 6a __ SBC T15 + 1 
34f3 : 8d f1 bf STA $bff1 ; (sstack + 7)
34f6 : 38 __ __ SEC
34f7 : a5 6d __ LDA T17 + 0 
34f9 : e5 59 __ SBC T3 + 0 
34fb : 85 53 __ STA T0 + 0 
34fd : 8d f2 bf STA $bff2 ; (sstack + 8)
3500 : a5 6e __ LDA T17 + 1 
3502 : e5 5a __ SBC T3 + 1 
3504 : 85 54 __ STA T0 + 1 
3506 : 8d f3 bf STA $bff3 ; (sstack + 9)
3509 : 38 __ __ SEC
350a : a5 6b __ LDA T16 + 0 
350c : e5 69 __ SBC T15 + 0 
350e : 85 6f __ STA T19 + 0 
3510 : 8d f4 bf STA $bff4 ; (sstack + 10)
3513 : a5 6c __ LDA T16 + 1 
3515 : e5 6a __ SBC T15 + 1 
3517 : 85 70 __ STA T19 + 1 
3519 : 8d f5 bf STA $bff5 ; (sstack + 11)
351c : 20 b0 37 JSR $37b0 ; (bm_line.s1 + 0)
351f : a9 dc __ LDA #$dc
3521 : 8d ea bf STA $bfea ; (sstack + 0)
3524 : a9 83 __ LDA #$83
3526 : 8d eb bf STA $bfeb ; (sstack + 1)
3529 : a9 f0 __ LDA #$f0
352b : 8d ec bf STA $bfec ; (sstack + 2)
352e : a9 7d __ LDA #$7d
3530 : 8d ed bf STA $bfed ; (sstack + 3)
3533 : a5 53 __ LDA T0 + 0 
3535 : 8d ee bf STA $bfee ; (sstack + 4)
3538 : a5 54 __ LDA T0 + 1 
353a : 8d ef bf STA $bfef ; (sstack + 5)
353d : a5 6f __ LDA T19 + 0 
353f : 8d f0 bf STA $bff0 ; (sstack + 6)
3542 : a5 70 __ LDA T19 + 1 
3544 : 8d f1 bf STA $bff1 ; (sstack + 7)
3547 : a9 03 __ LDA #$03
3549 : 8d f6 bf STA $bff6 ; (sstack + 12)
354c : 18 __ __ CLC
354d : a5 6d __ LDA T17 + 0 
354f : 65 59 __ ADC T3 + 0 
3551 : 85 53 __ STA T0 + 0 
3553 : 8d f2 bf STA $bff2 ; (sstack + 8)
3556 : a5 6e __ LDA T17 + 1 
3558 : 65 5a __ ADC T3 + 1 
355a : 85 54 __ STA T0 + 1 
355c : 8d f3 bf STA $bff3 ; (sstack + 9)
355f : 18 __ __ CLC
3560 : a5 6b __ LDA T16 + 0 
3562 : 65 69 __ ADC T15 + 0 
3564 : 85 6b __ STA T16 + 0 
3566 : 8d f4 bf STA $bff4 ; (sstack + 10)
3569 : a5 6c __ LDA T16 + 1 
356b : 65 6a __ ADC T15 + 1 
356d : 85 6c __ STA T16 + 1 
356f : 8d f5 bf STA $bff5 ; (sstack + 11)
3572 : 20 b0 37 JSR $37b0 ; (bm_line.s1 + 0)
3575 : a9 03 __ LDA #$03
3577 : 8d f6 bf STA $bff6 ; (sstack + 12)
357a : 18 __ __ CLC
357b : a5 5b __ LDA T4 + 0 
357d : 65 69 __ ADC T15 + 0 
357f : 85 5b __ STA T4 + 0 
3581 : 8d f4 bf STA $bff4 ; (sstack + 10)
3584 : a5 5c __ LDA T4 + 1 
3586 : 65 6a __ ADC T15 + 1 
3588 : 85 5c __ STA T4 + 1 
358a : 8d f5 bf STA $bff5 ; (sstack + 11)
358d : 18 __ __ CLC
358e : a5 57 __ LDA T2 + 0 
3590 : 65 59 __ ADC T3 + 0 
3592 : 85 57 __ STA T2 + 0 
3594 : 8d f2 bf STA $bff2 ; (sstack + 8)
3597 : a5 58 __ LDA T2 + 1 
3599 : 65 5a __ ADC T3 + 1 
359b : 85 58 __ STA T2 + 1 
359d : 8d f3 bf STA $bff3 ; (sstack + 9)
35a0 : a9 dc __ LDA #$dc
35a2 : 8d ea bf STA $bfea ; (sstack + 0)
35a5 : a9 83 __ LDA #$83
35a7 : 8d eb bf STA $bfeb ; (sstack + 1)
35aa : a9 f0 __ LDA #$f0
35ac : 8d ec bf STA $bfec ; (sstack + 2)
35af : a9 7d __ LDA #$7d
35b1 : 8d ed bf STA $bfed ; (sstack + 3)
35b4 : a5 53 __ LDA T0 + 0 
35b6 : 8d ee bf STA $bfee ; (sstack + 4)
35b9 : a5 54 __ LDA T0 + 1 
35bb : 8d ef bf STA $bfef ; (sstack + 5)
35be : a5 6b __ LDA T16 + 0 
35c0 : 8d f0 bf STA $bff0 ; (sstack + 6)
35c3 : a5 6c __ LDA T16 + 1 
35c5 : 8d f1 bf STA $bff1 ; (sstack + 7)
35c8 : 20 b0 37 JSR $37b0 ; (bm_line.s1 + 0)
35cb : a9 dc __ LDA #$dc
35cd : 8d ea bf STA $bfea ; (sstack + 0)
35d0 : a9 83 __ LDA #$83
35d2 : 8d eb bf STA $bfeb ; (sstack + 1)
35d5 : a9 f0 __ LDA #$f0
35d7 : 8d ec bf STA $bfec ; (sstack + 2)
35da : a9 7d __ LDA #$7d
35dc : 8d ed bf STA $bfed ; (sstack + 3)
35df : a5 57 __ LDA T2 + 0 
35e1 : 8d ee bf STA $bfee ; (sstack + 4)
35e4 : a5 58 __ LDA T2 + 1 
35e6 : 8d ef bf STA $bfef ; (sstack + 5)
35e9 : a5 5b __ LDA T4 + 0 
35eb : 8d f0 bf STA $bff0 ; (sstack + 6)
35ee : a5 5c __ LDA T4 + 1 
35f0 : 8d f1 bf STA $bff1 ; (sstack + 7)
35f3 : a9 03 __ LDA #$03
35f5 : 8d f6 bf STA $bff6 ; (sstack + 12)
35f8 : 18 __ __ CLC
35f9 : a5 61 __ LDA T9 + 0 
35fb : 65 68 __ ADC T14 + 0 
35fd : 29 3f __ AND #$3f
35ff : 85 53 __ STA T0 + 0 
3601 : 18 __ __ CLC
3602 : 69 10 __ ADC #$10
3604 : 29 3f __ AND #$3f
3606 : aa __ __ TAX
3607 : bd 4b 80 LDA $804b,x ; (sin64[0] + 0)
360a : 85 1b __ STA ACCU + 0 
360c : 29 80 __ AND #$80
360e : 10 02 __ BPL $3612 ; (draw_gear.s8 + 339)
3610 : a9 ff __ LDA #$ff
3612 : 85 1c __ STA ACCU + 1 
3614 : a5 5e __ LDA T6 + 0 
3616 : 20 9e 77 JSR $779e ; (mul16by8 + 0)
3619 : 20 84 7c JSR $7c84 ; (divs16@proxy + 0)
361c : 18 __ __ CLC
361d : a5 1b __ LDA ACCU + 0 
361f : 65 67 __ ADC T13 + 0 
3621 : 85 57 __ STA T2 + 0 
3623 : 8d f2 bf STA $bff2 ; (sstack + 8)
3626 : a5 1c __ LDA ACCU + 1 
3628 : 69 00 __ ADC #$00
362a : 85 58 __ STA T2 + 1 
362c : 8d f3 bf STA $bff3 ; (sstack + 9)
362f : a6 53 __ LDX T0 + 0 
3631 : bd 4b 80 LDA $804b,x ; (sin64[0] + 0)
3634 : 85 1b __ STA ACCU + 0 
3636 : 29 80 __ AND #$80
3638 : 10 02 __ BPL $363c ; (draw_gear.s8 + 381)
363a : a9 ff __ LDA #$ff
363c : 85 1c __ STA ACCU + 1 
363e : a5 5e __ LDA T6 + 0 
3640 : 20 9e 77 JSR $779e ; (mul16by8 + 0)
3643 : 20 84 7c JSR $7c84 ; (divs16@proxy + 0)
3646 : 18 __ __ CLC
3647 : a5 1b __ LDA ACCU + 0 
3649 : 69 58 __ ADC #$58
364b : 85 59 __ STA T3 + 0 
364d : 8d f4 bf STA $bff4 ; (sstack + 10)
3650 : a5 1c __ LDA ACCU + 1 
3652 : 69 00 __ ADC #$00
3654 : 85 5a __ STA T3 + 1 
3656 : 8d f5 bf STA $bff5 ; (sstack + 11)
3659 : 20 b0 37 JSR $37b0 ; (bm_line.s1 + 0)
365c : a5 57 __ LDA T2 + 0 
365e : 85 53 __ STA T0 + 0 
3660 : a5 58 __ LDA T2 + 1 
3662 : 85 54 __ STA T0 + 1 
3664 : a5 59 __ LDA T3 + 0 
3666 : 85 55 __ STA T1 + 0 
3668 : a5 5a __ LDA T3 + 1 
366a : 85 56 __ STA T1 + 1 
366c : e6 62 __ INC T10 + 0 
366e : a5 62 __ LDA T10 + 0 
3670 : c5 73 __ CMP T22 + 0 
3672 : b0 03 __ BCS $3677 ; (draw_gear.s9 + 0)
3674 : 4c 59 33 JMP $3359 ; (draw_gear.l5 + 0)
.s9:
3677 : a5 57 __ LDA T2 + 0 
3679 : 8d ee bf STA $bfee ; (sstack + 4)
367c : a5 58 __ LDA T2 + 1 
367e : 8d ef bf STA $bfef ; (sstack + 5)
3681 : a5 59 __ LDA T3 + 0 
3683 : 8d f0 bf STA $bff0 ; (sstack + 6)
3686 : a5 5a __ LDA T3 + 1 
3688 : 8d f1 bf STA $bff1 ; (sstack + 7)
368b : a5 63 __ LDA T11 + 0 
368d : 8d f2 bf STA $bff2 ; (sstack + 8)
3690 : a5 64 __ LDA T11 + 1 
3692 : 8d f3 bf STA $bff3 ; (sstack + 9)
3695 : a5 65 __ LDA T12 + 0 
3697 : 8d f4 bf STA $bff4 ; (sstack + 10)
369a : a5 66 __ LDA T12 + 1 
369c : 8d f5 bf STA $bff5 ; (sstack + 11)
369f : a9 03 __ LDA #$03
36a1 : 8d f6 bf STA $bff6 ; (sstack + 12)
36a4 : a9 dc __ LDA #$dc
36a6 : 8d ea bf STA $bfea ; (sstack + 0)
36a9 : a9 83 __ LDA #$83
36ab : 8d eb bf STA $bfeb ; (sstack + 1)
36ae : a9 f0 __ LDA #$f0
36b0 : 8d ec bf STA $bfec ; (sstack + 2)
36b3 : a9 7d __ LDA #$7d
36b5 : 8d ed bf STA $bfed ; (sstack + 3)
36b8 : 20 b0 37 JSR $37b0 ; (bm_line.s1 + 0)
36bb : a5 71 __ LDA T20 + 0 
36bd : 85 03 __ STA WORK + 0 
36bf : 85 62 __ STA T10 + 0 
36c1 : a9 00 __ LDA #$00
36c3 : 85 5d __ STA T5 + 0 
36c5 : 85 1c __ STA ACCU + 1 
36c7 : 85 04 __ STA WORK + 1 
36c9 : a9 40 __ LDA #$40
36cb : 85 1b __ STA ACCU + 0 
36cd : 20 8d 78 JSR $788d ; (divmod + 0)
36d0 : a5 1b __ LDA ACCU + 0 
36d2 : 85 59 __ STA T3 + 0 
.l10:
36d4 : a9 dc __ LDA #$dc
36d6 : 8d ea bf STA $bfea ; (sstack + 0)
36d9 : a9 83 __ LDA #$83
36db : 8d eb bf STA $bfeb ; (sstack + 1)
36de : a9 f0 __ LDA #$f0
36e0 : 8d ec bf STA $bfec ; (sstack + 2)
36e3 : a9 7d __ LDA #$7d
36e5 : 8d ed bf STA $bfed ; (sstack + 3)
36e8 : a9 03 __ LDA #$03
36ea : 8d f6 bf STA $bff6 ; (sstack + 12)
36ed : a5 5d __ LDA T5 + 0 
36ef : 85 1b __ STA ACCU + 0 
36f1 : a9 00 __ LDA #$00
36f3 : 85 1c __ STA ACCU + 1 
36f5 : a5 59 __ LDA T3 + 0 
36f7 : 20 9e 77 JSR $779e ; (mul16by8 + 0)
36fa : 18 __ __ CLC
36fb : a5 1b __ LDA ACCU + 0 
36fd : 65 5f __ ADC T7 + 0 
36ff : 29 3f __ AND #$3f
3701 : 85 53 __ STA T0 + 0 
3703 : 18 __ __ CLC
3704 : 69 10 __ ADC #$10
3706 : 29 3f __ AND #$3f
3708 : aa __ __ TAX
3709 : bd 4b 80 LDA $804b,x ; (sin64[0] + 0)
370c : 85 55 __ STA T1 + 0 
370e : 85 1b __ STA ACCU + 0 
3710 : 29 80 __ AND #$80
3712 : 10 02 __ BPL $3716 ; (draw_gear.l10 + 66)
3714 : a9 ff __ LDA #$ff
3716 : 85 56 __ STA T1 + 1 
3718 : 85 1c __ STA ACCU + 1 
371a : a5 72 __ LDA T21 + 0 
371c : 20 9e 77 JSR $779e ; (mul16by8 + 0)
371f : 20 84 7c JSR $7c84 ; (divs16@proxy + 0)
3722 : 18 __ __ CLC
3723 : a5 1b __ LDA ACCU + 0 
3725 : 65 67 __ ADC T13 + 0 
3727 : 8d ee bf STA $bfee ; (sstack + 4)
372a : a5 1c __ LDA ACCU + 1 
372c : 69 00 __ ADC #$00
372e : 8d ef bf STA $bfef ; (sstack + 5)
3731 : a6 53 __ LDX T0 + 0 
3733 : bd 4b 80 LDA $804b,x ; (sin64[0] + 0)
3736 : 85 53 __ STA T0 + 0 
3738 : 85 1b __ STA ACCU + 0 
373a : 29 80 __ AND #$80
373c : 10 02 __ BPL $3740 ; (draw_gear.l10 + 108)
373e : a9 ff __ LDA #$ff
3740 : 85 54 __ STA T0 + 1 
3742 : 85 1c __ STA ACCU + 1 
3744 : a5 72 __ LDA T21 + 0 
3746 : 20 9e 77 JSR $779e ; (mul16by8 + 0)
3749 : 20 84 7c JSR $7c84 ; (divs16@proxy + 0)
374c : 18 __ __ CLC
374d : a5 1b __ LDA ACCU + 0 
374f : 69 58 __ ADC #$58
3751 : 8d f0 bf STA $bff0 ; (sstack + 6)
3754 : a5 1c __ LDA ACCU + 1 
3756 : 69 00 __ ADC #$00
3758 : 8d f1 bf STA $bff1 ; (sstack + 7)
375b : a5 55 __ LDA T1 + 0 
375d : 85 1b __ STA ACCU + 0 
375f : a5 56 __ LDA T1 + 1 
3761 : 85 1c __ STA ACCU + 1 
3763 : a5 5e __ LDA T6 + 0 
3765 : 20 9e 77 JSR $779e ; (mul16by8 + 0)
3768 : 20 84 7c JSR $7c84 ; (divs16@proxy + 0)
376b : 18 __ __ CLC
376c : a5 1b __ LDA ACCU + 0 
376e : 65 67 __ ADC T13 + 0 
3770 : 8d f2 bf STA $bff2 ; (sstack + 8)
3773 : a5 1c __ LDA ACCU + 1 
3775 : 69 00 __ ADC #$00
3777 : 8d f3 bf STA $bff3 ; (sstack + 9)
377a : a5 53 __ LDA T0 + 0 
377c : 85 1b __ STA ACCU + 0 
377e : a5 54 __ LDA T0 + 1 
3780 : 85 1c __ STA ACCU + 1 
3782 : a5 5e __ LDA T6 + 0 
3784 : 20 9e 77 JSR $779e ; (mul16by8 + 0)
3787 : 20 84 7c JSR $7c84 ; (divs16@proxy + 0)
378a : 18 __ __ CLC
378b : a5 1b __ LDA ACCU + 0 
378d : 69 58 __ ADC #$58
378f : 8d f4 bf STA $bff4 ; (sstack + 10)
3792 : a5 1c __ LDA ACCU + 1 
3794 : 69 00 __ ADC #$00
3796 : 8d f5 bf STA $bff5 ; (sstack + 11)
3799 : 20 b0 37 JSR $37b0 ; (bm_line.s1 + 0)
379c : e6 5d __ INC T5 + 0 
379e : c6 62 __ DEC T10 + 0 
37a0 : f0 03 __ BEQ $37a5 ; (draw_gear.s3 + 0)
37a2 : 4c d4 36 JMP $36d4 ; (draw_gear.l10 + 0)
.s3:
37a5 : a2 20 __ LDX #$20
37a7 : bd b0 bf LDA $bfb0,x ; (draw_gear@stack + 0)
37aa : 95 53 __ STA T0 + 0,x 
37ac : ca __ __ DEX
37ad : 10 f8 __ BPL $37a7 ; (draw_gear.s3 + 2)
37af : 60 __ __ RTS
--------------------------------------------------------------------
bm_line: ; bm_line(const struct Bitmap*,const struct ClipRect*,i16,i16,i16,i16,u8,enum LineOp)->void
; 116, "/home/xahmol/oscar64/include/gfx/bitmap.h"
.s1:
37b0 : a2 0e __ LDX #$0e
37b2 : b5 53 __ LDA T2 + 0,x 
37b4 : 9d db bf STA $bfdb,x ; (bm_line@stack + 0)
37b7 : ca __ __ DEX
37b8 : 10 f8 __ BPL $37b2 ; (bm_line.s1 + 2)
.s4:
37ba : ad f0 bf LDA $bff0 ; (sstack + 6)
37bd : 85 55 __ STA T3 + 0 
37bf : ad f1 bf LDA $bff1 ; (sstack + 7)
37c2 : 85 56 __ STA T3 + 1 
37c4 : ad f4 bf LDA $bff4 ; (sstack + 10)
37c7 : 85 53 __ STA T2 + 0 
37c9 : 38 __ __ SEC
37ca : e5 55 __ SBC T3 + 0 
37cc : 85 57 __ STA T4 + 0 
37ce : ad f5 bf LDA $bff5 ; (sstack + 11)
37d1 : 85 54 __ STA T2 + 1 
37d3 : e5 56 __ SBC T3 + 1 
37d5 : 85 58 __ STA T4 + 1 
37d7 : ad f6 bf LDA $bff6 ; (sstack + 12)
37da : 85 61 __ STA T10 + 0 
37dc : ad ec bf LDA $bfec ; (sstack + 2)
37df : 85 59 __ STA T5 + 0 
37e1 : ad ed bf LDA $bfed ; (sstack + 3)
37e4 : 85 5a __ STA T5 + 1 
37e6 : a0 00 __ LDY #$00
37e8 : b1 59 __ LDA (T5 + 0),y 
37ea : 85 43 __ STA T0 + 0 
37ec : c8 __ __ INY
37ed : b1 59 __ LDA (T5 + 0),y 
37ef : 85 44 __ STA T0 + 1 
37f1 : a0 04 __ LDY #$04
37f3 : b1 59 __ LDA (T5 + 0),y 
37f5 : 85 45 __ STA T1 + 0 
37f7 : ad ee bf LDA $bfee ; (sstack + 4)
37fa : 85 5d __ STA T7 + 0 
37fc : ad ef bf LDA $bfef ; (sstack + 5)
37ff : 85 5e __ STA T7 + 1 
3801 : ad f2 bf LDA $bff2 ; (sstack + 8)
3804 : 85 5b __ STA T6 + 0 
3806 : 38 __ __ SEC
3807 : e5 5d __ SBC T7 + 0 
3809 : 85 5f __ STA T8 + 0 
380b : ad f3 bf LDA $bff3 ; (sstack + 9)
380e : 85 5c __ STA T6 + 1 
3810 : c8 __ __ INY
3811 : e5 5e __ SBC T7 + 1 
3813 : 85 60 __ STA T8 + 1 
3815 : 30 07 __ BMI $381e ; (bm_line.s5 + 0)
.s82:
3817 : 05 5f __ ORA T8 + 0 
3819 : f0 03 __ BEQ $381e ; (bm_line.s5 + 0)
381b : 4c 48 3b JMP $3b48 ; (bm_line.s64 + 0)
.s5:
381e : a5 5e __ LDA T7 + 1 
3820 : 10 03 __ BPL $3825 ; (bm_line.s63 + 0)
3822 : 4c 94 39 JMP $3994 ; (bm_line.s3 + 0)
.s63:
3825 : c5 44 __ CMP T0 + 1 
3827 : d0 04 __ BNE $382d ; (bm_line.s62 + 0)
.s61:
3829 : a5 5d __ LDA T7 + 0 
382b : c5 43 __ CMP T0 + 0 
.s62:
382d : 90 f3 __ BCC $3822 ; (bm_line.s5 + 4)
.s6:
382f : a5 5c __ LDA T6 + 1 
3831 : 10 03 __ BPL $3836 ; (bm_line.s60 + 0)
3833 : 4c f1 3a JMP $3af1 ; (bm_line.s52 + 0)
.s60:
3836 : d1 59 __ CMP (T5 + 0),y 
3838 : d0 04 __ BNE $383e ; (bm_line.s59 + 0)
.s58:
383a : a5 5b __ LDA T6 + 0 
383c : c5 45 __ CMP T1 + 0 
.s59:
383e : b0 e2 __ BCS $3822 ; (bm_line.s5 + 4)
.s7:
3840 : a5 5c __ LDA T6 + 1 
3842 : c5 44 __ CMP T0 + 1 
3844 : d0 04 __ BNE $384a ; (bm_line.s57 + 0)
.s56:
3846 : a5 5b __ LDA T6 + 0 
3848 : c5 43 __ CMP T0 + 0 
.s57:
384a : 90 e7 __ BCC $3833 ; (bm_line.s6 + 4)
.s8:
384c : a5 5e __ LDA T7 + 1 
384e : d1 59 __ CMP (T5 + 0),y 
3850 : d0 04 __ BNE $3856 ; (bm_line.s54 + 0)
.s51:
3852 : a5 5d __ LDA T7 + 0 
3854 : c5 45 __ CMP T1 + 0 
.s54:
3856 : 90 4e __ BCC $38a6 ; (bm_line.s9 + 0)
.s50:
3858 : a5 57 __ LDA T4 + 0 
385a : 85 0f __ STA P2 
385c : a5 58 __ LDA T4 + 1 
385e : 85 10 __ STA P3 
3860 : a5 5f __ LDA T8 + 0 
3862 : 85 11 __ STA P4 
3864 : a5 60 __ LDA T8 + 1 
3866 : 85 12 __ STA P5 
3868 : 18 __ __ CLC
3869 : a5 5d __ LDA T7 + 0 
386b : 69 01 __ ADC #$01
386d : a8 __ __ TAY
386e : a5 5e __ LDA T7 + 1 
3870 : 69 00 __ ADC #$00
3872 : aa __ __ TAX
3873 : 98 __ __ TYA
3874 : 38 __ __ SEC
3875 : a0 04 __ LDY #$04
3877 : f1 59 __ SBC (T5 + 0),y 
3879 : 85 0d __ STA P0 
387b : 8a __ __ TXA
387c : c8 __ __ INY
387d : f1 59 __ SBC (T5 + 0),y 
387f : 85 0e __ STA P1 
3881 : 20 2a 3c JSR $3c2a ; (lmuldiv16s.s4 + 0)
3884 : 38 __ __ SEC
3885 : a5 55 __ LDA T3 + 0 
3887 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
3889 : 8d f0 bf STA $bff0 ; (sstack + 6)
388c : a5 56 __ LDA T3 + 1 
388e : e5 1c __ SBC ACCU + 1 ; (clip + 1)
3890 : 8d f1 bf STA $bff1 ; (sstack + 7)
3893 : a0 04 __ LDY #$04
3895 : b1 59 __ LDA (T5 + 0),y 
3897 : 38 __ __ SEC
3898 : e9 01 __ SBC #$01
389a : aa __ __ TAX
389b : c8 __ __ INY
389c : b1 59 __ LDA (T5 + 0),y 
389e : 8e ee bf STX $bfee ; (sstack + 4)
38a1 : e9 00 __ SBC #$00
38a3 : 8d ef bf STA $bfef ; (sstack + 5)
.s9:
38a6 : a0 02 __ LDY #$02
38a8 : b1 59 __ LDA (T5 + 0),y 
38aa : 85 43 __ STA T0 + 0 
38ac : c8 __ __ INY
38ad : b1 59 __ LDA (T5 + 0),y 
38af : 85 44 __ STA T0 + 1 
38b1 : a0 06 __ LDY #$06
38b3 : b1 59 __ LDA (T5 + 0),y 
38b5 : 85 45 __ STA T1 + 0 
38b7 : c8 __ __ INY
38b8 : a5 58 __ LDA T4 + 1 
38ba : 30 07 __ BMI $38c3 ; (bm_line.s10 + 0)
.s49:
38bc : 05 57 __ ORA T4 + 0 
38be : f0 03 __ BEQ $38c3 ; (bm_line.s10 + 0)
38c0 : 4c f9 39 JMP $39f9 ; (bm_line.s30 + 0)
.s10:
38c3 : ad f0 bf LDA $bff0 ; (sstack + 6)
38c6 : 85 55 __ STA T3 + 0 
38c8 : ad f1 bf LDA $bff1 ; (sstack + 7)
38cb : 10 03 __ BPL $38d0 ; (bm_line.s29 + 0)
38cd : 4c 94 39 JMP $3994 ; (bm_line.s3 + 0)
.s29:
38d0 : 85 56 __ STA T3 + 1 
38d2 : c5 44 __ CMP T0 + 1 
38d4 : d0 04 __ BNE $38da ; (bm_line.s28 + 0)
.s27:
38d6 : a5 55 __ LDA T3 + 0 
38d8 : c5 43 __ CMP T0 + 0 
.s28:
38da : 90 f1 __ BCC $38cd ; (bm_line.s10 + 10)
.s11:
38dc : ad f5 bf LDA $bff5 ; (sstack + 11)
38df : 10 03 __ BPL $38e4 ; (bm_line.s26 + 0)
38e1 : 4c 9f 39 JMP $399f ; (bm_line.s17 + 0)
.s26:
38e4 : d1 59 __ CMP (T5 + 0),y 
38e6 : d0 05 __ BNE $38ed ; (bm_line.s25 + 0)
.s24:
38e8 : ad f4 bf LDA $bff4 ; (sstack + 10)
38eb : c5 45 __ CMP T1 + 0 
.s25:
38ed : b0 de __ BCS $38cd ; (bm_line.s10 + 10)
.s12:
38ef : ad f5 bf LDA $bff5 ; (sstack + 11)
38f2 : 30 ed __ BMI $38e1 ; (bm_line.s11 + 5)
.s23:
38f4 : c5 44 __ CMP T0 + 1 
38f6 : d0 05 __ BNE $38fd ; (bm_line.s22 + 0)
.s21:
38f8 : ad f4 bf LDA $bff4 ; (sstack + 10)
38fb : c5 43 __ CMP T0 + 0 
.s22:
38fd : 90 e2 __ BCC $38e1 ; (bm_line.s11 + 5)
.s13:
38ff : a5 56 __ LDA T3 + 1 
3901 : d1 59 __ CMP (T5 + 0),y 
3903 : d0 04 __ BNE $3909 ; (bm_line.s19 + 0)
.s16:
3905 : a5 55 __ LDA T3 + 0 
3907 : c5 45 __ CMP T1 + 0 
.s19:
3909 : 90 50 __ BCC $395b ; (bm_line.s14 + 0)
.s15:
390b : a5 5f __ LDA T8 + 0 
390d : 85 0f __ STA P2 
390f : a5 60 __ LDA T8 + 1 
3911 : 85 10 __ STA P3 
3913 : a5 57 __ LDA T4 + 0 
3915 : 85 11 __ STA P4 
3917 : a5 58 __ LDA T4 + 1 
3919 : 85 12 __ STA P5 
391b : 18 __ __ CLC
391c : a5 55 __ LDA T3 + 0 
391e : 69 01 __ ADC #$01
3920 : a8 __ __ TAY
3921 : a5 56 __ LDA T3 + 1 
3923 : 69 00 __ ADC #$00
3925 : aa __ __ TAX
3926 : 98 __ __ TYA
3927 : 38 __ __ SEC
3928 : a0 06 __ LDY #$06
392a : f1 59 __ SBC (T5 + 0),y 
392c : 85 0d __ STA P0 
392e : 8a __ __ TXA
392f : c8 __ __ INY
3930 : f1 59 __ SBC (T5 + 0),y 
3932 : 85 0e __ STA P1 
3934 : 20 2a 3c JSR $3c2a ; (lmuldiv16s.s4 + 0)
3937 : ad ee bf LDA $bfee ; (sstack + 4)
393a : 38 __ __ SEC
393b : e5 1b __ SBC ACCU + 0 ; (clip + 0)
393d : 8d ee bf STA $bfee ; (sstack + 4)
3940 : ad ef bf LDA $bfef ; (sstack + 5)
3943 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
3945 : 8d ef bf STA $bfef ; (sstack + 5)
3948 : a0 06 __ LDY #$06
394a : b1 59 __ LDA (T5 + 0),y 
394c : 38 __ __ SEC
394d : e9 01 __ SBC #$01
394f : aa __ __ TAX
3950 : c8 __ __ INY
3951 : b1 59 __ LDA (T5 + 0),y 
3953 : 8e f0 bf STX $bff0 ; (sstack + 6)
3956 : e9 00 __ SBC #$00
3958 : 8d f1 bf STA $bff1 ; (sstack + 7)
.s14:
395b : ad ea bf LDA $bfea ; (sstack + 0)
395e : 85 0d __ STA P0 
3960 : ad eb bf LDA $bfeb ; (sstack + 1)
3963 : 85 0e __ STA P1 
3965 : ad ee bf LDA $bfee ; (sstack + 4)
3968 : 85 0f __ STA P2 
396a : ad ef bf LDA $bfef ; (sstack + 5)
396d : 85 10 __ STA P3 
396f : ad f0 bf LDA $bff0 ; (sstack + 6)
3972 : 85 11 __ STA P4 
3974 : ad f1 bf LDA $bff1 ; (sstack + 7)
3977 : 85 12 __ STA P5 
3979 : ad f2 bf LDA $bff2 ; (sstack + 8)
397c : 85 13 __ STA P6 
397e : ad f3 bf LDA $bff3 ; (sstack + 9)
3981 : 85 14 __ STA P7 
3983 : ad f4 bf LDA $bff4 ; (sstack + 10)
3986 : 85 15 __ STA P8 
3988 : ad f5 bf LDA $bff5 ; (sstack + 11)
398b : 85 16 __ STA P9 
398d : a5 61 __ LDA T10 + 0 
398f : 85 18 __ STA P11 
3991 : 20 e9 3c JSR $3ce9 ; (bmu_line.s4 + 0)
.s3:
3994 : a2 0e __ LDX #$0e
3996 : bd db bf LDA $bfdb,x ; (bm_line@stack + 0)
3999 : 95 53 __ STA T2 + 0,x 
399b : ca __ __ DEX
399c : 10 f8 __ BPL $3996 ; (bm_line.s3 + 2)
399e : 60 __ __ RTS
.s17:
399f : a5 5f __ LDA T8 + 0 
39a1 : 85 0f __ STA P2 
39a3 : a5 60 __ LDA T8 + 1 
39a5 : 85 10 __ STA P3 
39a7 : a5 57 __ LDA T4 + 0 
39a9 : 85 11 __ STA P4 
39ab : a5 58 __ LDA T4 + 1 
39ad : 85 12 __ STA P5 
39af : 38 __ __ SEC
39b0 : a5 43 __ LDA T0 + 0 
39b2 : ed f4 bf SBC $bff4 ; (sstack + 10)
39b5 : 85 0d __ STA P0 
39b7 : a5 44 __ LDA T0 + 1 
39b9 : ed f5 bf SBC $bff5 ; (sstack + 11)
39bc : 85 0e __ STA P1 
39be : 20 2a 3c JSR $3c2a ; (lmuldiv16s.s4 + 0)
39c1 : a0 02 __ LDY #$02
39c3 : b1 59 __ LDA (T5 + 0),y 
39c5 : 8d f4 bf STA $bff4 ; (sstack + 10)
39c8 : c8 __ __ INY
39c9 : b1 59 __ LDA (T5 + 0),y 
39cb : 8d f5 bf STA $bff5 ; (sstack + 11)
39ce : ad f2 bf LDA $bff2 ; (sstack + 8)
39d1 : 18 __ __ CLC
39d2 : 65 1b __ ADC ACCU + 0 ; (clip + 0)
39d4 : 8d f2 bf STA $bff2 ; (sstack + 8)
39d7 : ad f3 bf LDA $bff3 ; (sstack + 9)
39da : 65 1c __ ADC ACCU + 1 ; (clip + 1)
39dc : 8d f3 bf STA $bff3 ; (sstack + 9)
39df : a0 07 __ LDY #$07
39e1 : b1 59 __ LDA (T5 + 0),y 
39e3 : 10 03 __ BPL $39e8 ; (bm_line.s20 + 0)
39e5 : 4c 0b 39 JMP $390b ; (bm_line.s15 + 0)
.s20:
39e8 : a5 56 __ LDA T3 + 1 
39ea : d1 59 __ CMP (T5 + 0),y 
39ec : f0 03 __ BEQ $39f1 ; (bm_line.s18 + 0)
39ee : 4c 09 39 JMP $3909 ; (bm_line.s19 + 0)
.s18:
39f1 : a5 55 __ LDA T3 + 0 
39f3 : 88 __ __ DEY
39f4 : d1 59 __ CMP (T5 + 0),y 
39f6 : 4c 09 39 JMP $3909 ; (bm_line.s19 + 0)
.s30:
39f9 : ad f4 bf LDA $bff4 ; (sstack + 10)
39fc : 85 55 __ STA T3 + 0 
39fe : ad f5 bf LDA $bff5 ; (sstack + 11)
3a01 : 30 91 __ BMI $3994 ; (bm_line.s3 + 0)
.s48:
3a03 : 85 56 __ STA T3 + 1 
3a05 : c5 44 __ CMP T0 + 1 
3a07 : d0 04 __ BNE $3a0d ; (bm_line.s47 + 0)
.s46:
3a09 : a5 55 __ LDA T3 + 0 
3a0b : c5 43 __ CMP T0 + 0 
.s47:
3a0d : 90 85 __ BCC $3994 ; (bm_line.s3 + 0)
.s31:
3a0f : ad f1 bf LDA $bff1 ; (sstack + 7)
3a12 : 10 03 __ BPL $3a17 ; (bm_line.s45 + 0)
3a14 : 4c 97 3a JMP $3a97 ; (bm_line.s36 + 0)
.s45:
3a17 : d1 59 __ CMP (T5 + 0),y 
3a19 : d0 05 __ BNE $3a20 ; (bm_line.s44 + 0)
.s43:
3a1b : ad f0 bf LDA $bff0 ; (sstack + 6)
3a1e : c5 45 __ CMP T1 + 0 
.s44:
3a20 : 90 03 __ BCC $3a25 ; (bm_line.s32 + 0)
3a22 : 4c 94 39 JMP $3994 ; (bm_line.s3 + 0)
.s32:
3a25 : ad f1 bf LDA $bff1 ; (sstack + 7)
3a28 : 30 6d __ BMI $3a97 ; (bm_line.s36 + 0)
.s42:
3a2a : c5 44 __ CMP T0 + 1 
3a2c : d0 05 __ BNE $3a33 ; (bm_line.s41 + 0)
.s40:
3a2e : ad f0 bf LDA $bff0 ; (sstack + 6)
3a31 : c5 43 __ CMP T0 + 0 
.s41:
3a33 : 90 62 __ BCC $3a97 ; (bm_line.s36 + 0)
.s33:
3a35 : a5 56 __ LDA T3 + 1 
3a37 : d1 59 __ CMP (T5 + 0),y 
3a39 : d0 04 __ BNE $3a3f ; (bm_line.s38 + 0)
.s35:
3a3b : a5 55 __ LDA T3 + 0 
3a3d : c5 45 __ CMP T1 + 0 
.s38:
3a3f : b0 03 __ BCS $3a44 ; (bm_line.s34 + 0)
3a41 : 4c 5b 39 JMP $395b ; (bm_line.s14 + 0)
.s34:
3a44 : a5 5f __ LDA T8 + 0 
3a46 : 85 0f __ STA P2 
3a48 : a5 60 __ LDA T8 + 1 
3a4a : 85 10 __ STA P3 
3a4c : a5 57 __ LDA T4 + 0 
3a4e : 85 11 __ STA P4 
3a50 : a5 58 __ LDA T4 + 1 
3a52 : 85 12 __ STA P5 
3a54 : 18 __ __ CLC
3a55 : a5 55 __ LDA T3 + 0 
3a57 : 69 01 __ ADC #$01
3a59 : a8 __ __ TAY
3a5a : a5 56 __ LDA T3 + 1 
3a5c : 69 00 __ ADC #$00
3a5e : aa __ __ TAX
3a5f : 98 __ __ TYA
3a60 : 38 __ __ SEC
3a61 : a0 06 __ LDY #$06
3a63 : f1 59 __ SBC (T5 + 0),y 
3a65 : 85 0d __ STA P0 
3a67 : 8a __ __ TXA
3a68 : c8 __ __ INY
3a69 : f1 59 __ SBC (T5 + 0),y 
3a6b : 85 0e __ STA P1 
3a6d : 20 2a 3c JSR $3c2a ; (lmuldiv16s.s4 + 0)
3a70 : ad f2 bf LDA $bff2 ; (sstack + 8)
3a73 : 38 __ __ SEC
3a74 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
3a76 : 8d f2 bf STA $bff2 ; (sstack + 8)
3a79 : ad f3 bf LDA $bff3 ; (sstack + 9)
3a7c : e5 1c __ SBC ACCU + 1 ; (clip + 1)
3a7e : 8d f3 bf STA $bff3 ; (sstack + 9)
3a81 : a0 06 __ LDY #$06
3a83 : b1 59 __ LDA (T5 + 0),y 
3a85 : 38 __ __ SEC
3a86 : e9 01 __ SBC #$01
3a88 : aa __ __ TAX
3a89 : c8 __ __ INY
3a8a : b1 59 __ LDA (T5 + 0),y 
3a8c : 8e f4 bf STX $bff4 ; (sstack + 10)
3a8f : e9 00 __ SBC #$00
3a91 : 8d f5 bf STA $bff5 ; (sstack + 11)
3a94 : 4c 5b 39 JMP $395b ; (bm_line.s14 + 0)
.s36:
3a97 : a5 5f __ LDA T8 + 0 
3a99 : 85 0f __ STA P2 
3a9b : a5 60 __ LDA T8 + 1 
3a9d : 85 10 __ STA P3 
3a9f : a5 57 __ LDA T4 + 0 
3aa1 : 85 11 __ STA P4 
3aa3 : a5 58 __ LDA T4 + 1 
3aa5 : 85 12 __ STA P5 
3aa7 : 38 __ __ SEC
3aa8 : a5 43 __ LDA T0 + 0 
3aaa : ed f0 bf SBC $bff0 ; (sstack + 6)
3aad : 85 0d __ STA P0 
3aaf : a5 44 __ LDA T0 + 1 
3ab1 : ed f1 bf SBC $bff1 ; (sstack + 7)
3ab4 : 85 0e __ STA P1 
3ab6 : 20 2a 3c JSR $3c2a ; (lmuldiv16s.s4 + 0)
3ab9 : a0 02 __ LDY #$02
3abb : b1 59 __ LDA (T5 + 0),y 
3abd : 8d f0 bf STA $bff0 ; (sstack + 6)
3ac0 : c8 __ __ INY
3ac1 : b1 59 __ LDA (T5 + 0),y 
3ac3 : 8d f1 bf STA $bff1 ; (sstack + 7)
3ac6 : ad ee bf LDA $bfee ; (sstack + 4)
3ac9 : 18 __ __ CLC
3aca : 65 1b __ ADC ACCU + 0 ; (clip + 0)
3acc : 8d ee bf STA $bfee ; (sstack + 4)
3acf : ad ef bf LDA $bfef ; (sstack + 5)
3ad2 : 65 1c __ ADC ACCU + 1 ; (clip + 1)
3ad4 : 8d ef bf STA $bfef ; (sstack + 5)
3ad7 : a0 07 __ LDY #$07
3ad9 : b1 59 __ LDA (T5 + 0),y 
3adb : 10 03 __ BPL $3ae0 ; (bm_line.s39 + 0)
3add : 4c 44 3a JMP $3a44 ; (bm_line.s34 + 0)
.s39:
3ae0 : a5 56 __ LDA T3 + 1 
3ae2 : d1 59 __ CMP (T5 + 0),y 
3ae4 : f0 03 __ BEQ $3ae9 ; (bm_line.s37 + 0)
3ae6 : 4c 3f 3a JMP $3a3f ; (bm_line.s38 + 0)
.s37:
3ae9 : a5 55 __ LDA T3 + 0 
3aeb : 88 __ __ DEY
3aec : d1 59 __ CMP (T5 + 0),y 
3aee : 4c 3f 3a JMP $3a3f ; (bm_line.s38 + 0)
.s52:
3af1 : a5 57 __ LDA T4 + 0 
3af3 : 85 0f __ STA P2 
3af5 : a5 58 __ LDA T4 + 1 
3af7 : 85 10 __ STA P3 
3af9 : a5 5f __ LDA T8 + 0 
3afb : 85 11 __ STA P4 
3afd : a5 60 __ LDA T8 + 1 
3aff : 85 12 __ STA P5 
3b01 : 38 __ __ SEC
3b02 : a5 43 __ LDA T0 + 0 
3b04 : e5 5b __ SBC T6 + 0 
3b06 : 85 0d __ STA P0 
3b08 : a5 44 __ LDA T0 + 1 
3b0a : e5 5c __ SBC T6 + 1 
3b0c : 85 0e __ STA P1 
3b0e : 20 2a 3c JSR $3c2a ; (lmuldiv16s.s4 + 0)
3b11 : 18 __ __ CLC
3b12 : a5 1b __ LDA ACCU + 0 ; (clip + 0)
3b14 : 65 53 __ ADC T2 + 0 
3b16 : aa __ __ TAX
3b17 : a0 00 __ LDY #$00
3b19 : b1 59 __ LDA (T5 + 0),y 
3b1b : 8d f2 bf STA $bff2 ; (sstack + 8)
3b1e : c8 __ __ INY
3b1f : b1 59 __ LDA (T5 + 0),y 
3b21 : 8e f4 bf STX $bff4 ; (sstack + 10)
3b24 : 8d f3 bf STA $bff3 ; (sstack + 9)
3b27 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
3b29 : 65 54 __ ADC T2 + 1 
3b2b : 8d f5 bf STA $bff5 ; (sstack + 11)
3b2e : a0 05 __ LDY #$05
3b30 : b1 59 __ LDA (T5 + 0),y 
3b32 : 10 03 __ BPL $3b37 ; (bm_line.s55 + 0)
3b34 : 4c 58 38 JMP $3858 ; (bm_line.s50 + 0)
.s55:
3b37 : a5 5e __ LDA T7 + 1 
3b39 : d1 59 __ CMP (T5 + 0),y 
3b3b : f0 03 __ BEQ $3b40 ; (bm_line.s53 + 0)
3b3d : 4c 56 38 JMP $3856 ; (bm_line.s54 + 0)
.s53:
3b40 : a5 5d __ LDA T7 + 0 
3b42 : 88 __ __ DEY
3b43 : d1 59 __ CMP (T5 + 0),y 
3b45 : 4c 56 38 JMP $3856 ; (bm_line.s54 + 0)
.s64:
3b48 : a5 5c __ LDA T6 + 1 
3b4a : 10 03 __ BPL $3b4f ; (bm_line.s81 + 0)
3b4c : 4c 94 39 JMP $3994 ; (bm_line.s3 + 0)
.s81:
3b4f : c5 44 __ CMP T0 + 1 
3b51 : d0 04 __ BNE $3b57 ; (bm_line.s80 + 0)
.s79:
3b53 : a5 5b __ LDA T6 + 0 
3b55 : c5 43 __ CMP T0 + 0 
.s80:
3b57 : 90 f3 __ BCC $3b4c ; (bm_line.s64 + 4)
.s65:
3b59 : a5 5e __ LDA T7 + 1 
3b5b : 30 76 __ BMI $3bd3 ; (bm_line.s70 + 0)
.s78:
3b5d : d1 59 __ CMP (T5 + 0),y 
3b5f : d0 04 __ BNE $3b65 ; (bm_line.s77 + 0)
.s76:
3b61 : a5 5d __ LDA T7 + 0 
3b63 : c5 45 __ CMP T1 + 0 
.s77:
3b65 : b0 e5 __ BCS $3b4c ; (bm_line.s64 + 4)
.s66:
3b67 : a5 5e __ LDA T7 + 1 
3b69 : c5 44 __ CMP T0 + 1 
3b6b : d0 04 __ BNE $3b71 ; (bm_line.s75 + 0)
.s74:
3b6d : a5 5d __ LDA T7 + 0 
3b6f : c5 43 __ CMP T0 + 0 
.s75:
3b71 : 90 60 __ BCC $3bd3 ; (bm_line.s70 + 0)
.s67:
3b73 : a5 5c __ LDA T6 + 1 
3b75 : d1 59 __ CMP (T5 + 0),y 
3b77 : d0 04 __ BNE $3b7d ; (bm_line.s72 + 0)
.s69:
3b79 : a5 5b __ LDA T6 + 0 
3b7b : c5 45 __ CMP T1 + 0 
.s72:
3b7d : b0 03 __ BCS $3b82 ; (bm_line.s68 + 0)
3b7f : 4c a6 38 JMP $38a6 ; (bm_line.s9 + 0)
.s68:
3b82 : a5 57 __ LDA T4 + 0 
3b84 : 85 0f __ STA P2 
3b86 : a5 58 __ LDA T4 + 1 
3b88 : 85 10 __ STA P3 
3b8a : a5 5f __ LDA T8 + 0 
3b8c : 85 11 __ STA P4 
3b8e : a5 60 __ LDA T8 + 1 
3b90 : 85 12 __ STA P5 
3b92 : 18 __ __ CLC
3b93 : a5 5b __ LDA T6 + 0 
3b95 : 69 01 __ ADC #$01
3b97 : a8 __ __ TAY
3b98 : a5 5c __ LDA T6 + 1 
3b9a : 69 00 __ ADC #$00
3b9c : aa __ __ TAX
3b9d : 98 __ __ TYA
3b9e : 38 __ __ SEC
3b9f : a0 04 __ LDY #$04
3ba1 : f1 59 __ SBC (T5 + 0),y 
3ba3 : 85 0d __ STA P0 
3ba5 : 8a __ __ TXA
3ba6 : c8 __ __ INY
3ba7 : f1 59 __ SBC (T5 + 0),y 
3ba9 : 85 0e __ STA P1 
3bab : 20 2a 3c JSR $3c2a ; (lmuldiv16s.s4 + 0)
3bae : 38 __ __ SEC
3baf : a5 53 __ LDA T2 + 0 
3bb1 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
3bb3 : 8d f4 bf STA $bff4 ; (sstack + 10)
3bb6 : a5 54 __ LDA T2 + 1 
3bb8 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
3bba : 8d f5 bf STA $bff5 ; (sstack + 11)
3bbd : a0 04 __ LDY #$04
3bbf : b1 59 __ LDA (T5 + 0),y 
3bc1 : 38 __ __ SEC
3bc2 : e9 01 __ SBC #$01
3bc4 : aa __ __ TAX
3bc5 : c8 __ __ INY
3bc6 : b1 59 __ LDA (T5 + 0),y 
3bc8 : 8e f2 bf STX $bff2 ; (sstack + 8)
3bcb : e9 00 __ SBC #$00
3bcd : 8d f3 bf STA $bff3 ; (sstack + 9)
3bd0 : 4c a6 38 JMP $38a6 ; (bm_line.s9 + 0)
.s70:
3bd3 : a5 57 __ LDA T4 + 0 
3bd5 : 85 0f __ STA P2 
3bd7 : a5 58 __ LDA T4 + 1 
3bd9 : 85 10 __ STA P3 
3bdb : a5 5f __ LDA T8 + 0 
3bdd : 85 11 __ STA P4 
3bdf : a5 60 __ LDA T8 + 1 
3be1 : 85 12 __ STA P5 
3be3 : 38 __ __ SEC
3be4 : a5 43 __ LDA T0 + 0 
3be6 : e5 5d __ SBC T7 + 0 
3be8 : 85 0d __ STA P0 
3bea : a5 44 __ LDA T0 + 1 
3bec : e5 5e __ SBC T7 + 1 
3bee : 85 0e __ STA P1 
3bf0 : 20 2a 3c JSR $3c2a ; (lmuldiv16s.s4 + 0)
3bf3 : 18 __ __ CLC
3bf4 : a5 1b __ LDA ACCU + 0 ; (clip + 0)
3bf6 : 65 55 __ ADC T3 + 0 
3bf8 : aa __ __ TAX
3bf9 : a0 00 __ LDY #$00
3bfb : b1 59 __ LDA (T5 + 0),y 
3bfd : 8d ee bf STA $bfee ; (sstack + 4)
3c00 : c8 __ __ INY
3c01 : b1 59 __ LDA (T5 + 0),y 
3c03 : 8e f0 bf STX $bff0 ; (sstack + 6)
3c06 : 8d ef bf STA $bfef ; (sstack + 5)
3c09 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
3c0b : 65 56 __ ADC T3 + 1 
3c0d : 8d f1 bf STA $bff1 ; (sstack + 7)
3c10 : a0 05 __ LDY #$05
3c12 : b1 59 __ LDA (T5 + 0),y 
3c14 : 10 03 __ BPL $3c19 ; (bm_line.s73 + 0)
3c16 : 4c 82 3b JMP $3b82 ; (bm_line.s68 + 0)
.s73:
3c19 : a5 5c __ LDA T6 + 1 
3c1b : d1 59 __ CMP (T5 + 0),y 
3c1d : f0 03 __ BEQ $3c22 ; (bm_line.s71 + 0)
3c1f : 4c 7d 3b JMP $3b7d ; (bm_line.s72 + 0)
.s71:
3c22 : a5 5b __ LDA T6 + 0 
3c24 : 88 __ __ DEY
3c25 : d1 59 __ CMP (T5 + 0),y 
3c27 : 4c 7d 3b JMP $3b7d ; (bm_line.s72 + 0)
--------------------------------------------------------------------
lmuldiv16s: ; lmuldiv16s(i16,i16,i16)->i16
;  42, "/home/xahmol/oscar64/include/fixmath.h"
.s4:
3c2a : a9 00 __ LDA #$00
3c2c : 24 0e __ BIT P1 ; (a + 1)
3c2e : 10 0d __ BPL $3c3d ; (lmuldiv16s.s5 + 0)
.s10:
3c30 : 38 __ __ SEC
3c31 : e5 0d __ SBC P0 ; (a + 0)
3c33 : 85 0d __ STA P0 ; (a + 0)
3c35 : a9 00 __ LDA #$00
3c37 : e5 0e __ SBC P1 ; (a + 1)
3c39 : 85 0e __ STA P1 ; (a + 1)
3c3b : a9 01 __ LDA #$01
.s5:
3c3d : 85 43 __ STA T1 + 0 
3c3f : 24 10 __ BIT P3 ; (b + 1)
3c41 : 10 14 __ BPL $3c57 ; (lmuldiv16s.s6 + 0)
.s9:
3c43 : 38 __ __ SEC
3c44 : a9 00 __ LDA #$00
3c46 : e5 0f __ SBC P2 ; (b + 0)
3c48 : 85 0f __ STA P2 ; (b + 0)
3c4a : a9 00 __ LDA #$00
3c4c : e5 10 __ SBC P3 ; (b + 1)
3c4e : 85 10 __ STA P3 ; (b + 1)
3c50 : a9 00 __ LDA #$00
3c52 : c5 43 __ CMP T1 + 0 
3c54 : 2a __ __ ROL
3c55 : 85 43 __ STA T1 + 0 
.s6:
3c57 : 24 12 __ BIT P5 ; (c + 1)
3c59 : 10 14 __ BPL $3c6f ; (lmuldiv16s.s7 + 0)
.s8:
3c5b : 38 __ __ SEC
3c5c : a9 00 __ LDA #$00
3c5e : e5 11 __ SBC P4 ; (c + 0)
3c60 : 85 11 __ STA P4 ; (c + 0)
3c62 : a9 00 __ LDA #$00
3c64 : e5 12 __ SBC P5 ; (c + 1)
3c66 : 85 12 __ STA P5 ; (c + 1)
3c68 : a9 00 __ LDA #$00
3c6a : c5 43 __ CMP T1 + 0 
3c6c : 2a __ __ ROL
3c6d : 85 43 __ STA T1 + 0 
.s7:
3c6f : a9 00 __ LDA #$00
3c71 : 85 05 __ STA WORK + 2 
3c73 : 85 06 __ STA WORK + 3 
3c75 : a5 0d __ LDA P0 ; (a + 0)
3c77 : 38 __ __ SEC
3c78 : a0 08 __ LDY #$08
3c7a : 6a __ __ ROR
3c7b : 90 0f __ BCC $3c8c ; (lmuldiv16s.s7 + 29)
3c7d : aa __ __ TAX
3c7e : 18 __ __ CLC
3c7f : a5 05 __ LDA WORK + 2 
3c81 : 65 0f __ ADC P2 ; (b + 0)
3c83 : 85 05 __ STA WORK + 2 
3c85 : a5 06 __ LDA WORK + 3 
3c87 : 65 10 __ ADC P3 ; (b + 1)
3c89 : 85 06 __ STA WORK + 3 
3c8b : 8a __ __ TXA
3c8c : 66 06 __ ROR WORK + 3 
3c8e : 66 05 __ ROR WORK + 2 
3c90 : 88 __ __ DEY
3c91 : d0 e7 __ BNE $3c7a ; (lmuldiv16s.s7 + 11)
3c93 : 6a __ __ ROR
3c94 : 90 07 __ BCC $3c9d ; (lmuldiv16s.s7 + 46)
3c96 : 85 03 __ STA WORK + 0 
3c98 : a5 0e __ LDA P1 ; (a + 1)
3c9a : 18 __ __ CLC
3c9b : 90 db __ BCC $3c78 ; (lmuldiv16s.s7 + 9)
3c9d : 38 __ __ SEC
3c9e : 85 04 __ STA WORK + 1 
3ca0 : a2 08 __ LDX #$08
3ca2 : 26 04 __ ROL WORK + 1 
3ca4 : 26 05 __ ROL WORK + 2 
3ca6 : 26 06 __ ROL WORK + 3 
3ca8 : 90 0c __ BCC $3cb6 ; (lmuldiv16s.s7 + 71)
3caa : a5 05 __ LDA WORK + 2 
3cac : e5 11 __ SBC P4 ; (c + 0)
3cae : a8 __ __ TAY
3caf : a5 06 __ LDA WORK + 3 
3cb1 : e5 12 __ SBC P5 ; (c + 1)
3cb3 : 38 __ __ SEC
3cb4 : b0 0c __ BCS $3cc2 ; (lmuldiv16s.s7 + 83)
3cb6 : 38 __ __ SEC
3cb7 : a5 05 __ LDA WORK + 2 
3cb9 : e5 11 __ SBC P4 ; (c + 0)
3cbb : a8 __ __ TAY
3cbc : a5 06 __ LDA WORK + 3 
3cbe : e5 12 __ SBC P5 ; (c + 1)
3cc0 : 90 04 __ BCC $3cc6 ; (lmuldiv16s.s7 + 87)
3cc2 : 85 06 __ STA WORK + 3 
3cc4 : 84 05 __ STY WORK + 2 
3cc6 : ca __ __ DEX
3cc7 : d0 d9 __ BNE $3ca2 ; (lmuldiv16s.s7 + 51)
3cc9 : a5 04 __ LDA WORK + 1 
3ccb : 2a __ __ ROL
3ccc : 90 07 __ BCC $3cd5 ; (lmuldiv16s.s7 + 102)
3cce : 85 1c __ STA ACCU + 1 
3cd0 : a5 03 __ LDA WORK + 0 
3cd2 : 18 __ __ CLC
3cd3 : 90 c9 __ BCC $3c9e ; (lmuldiv16s.s7 + 47)
3cd5 : 85 1b __ STA ACCU + 0 
3cd7 : a5 43 __ LDA T1 + 0 
3cd9 : f0 0d __ BEQ $3ce8 ; (lmuldiv16s.s3 + 0)
3cdb : 38 __ __ SEC
3cdc : a9 00 __ LDA #$00
3cde : e5 1b __ SBC ACCU + 0 
3ce0 : 85 1b __ STA ACCU + 0 
3ce2 : a9 00 __ LDA #$00
3ce4 : e5 1c __ SBC ACCU + 1 
3ce6 : 85 1c __ STA ACCU + 1 
.s3:
3ce8 : 60 __ __ RTS
--------------------------------------------------------------------
bmu_line: ; bmu_line(const struct Bitmap*,i16,i16,i16,i16,u8,enum LineOp)->void
; 113, "/home/xahmol/oscar64/include/gfx/bitmap.h"
.s4:
3ce9 : a5 18 __ LDA P11 ; (op + 0)
3ceb : d0 02 __ BNE $3cef ; (bmu_line.s6 + 0)
.s5:
3ced : e6 18 __ INC P11 ; (op + 0)
.s6:
3cef : 38 __ __ SEC
3cf0 : a5 13 __ LDA P6 ; (x1 + 0)
3cf2 : e5 0f __ SBC P2 ; (x0 + 0)
3cf4 : 85 46 __ STA T2 + 0 
3cf6 : a5 14 __ LDA P7 ; (x1 + 1)
3cf8 : e5 10 __ SBC P3 ; (x0 + 1)
3cfa : 85 47 __ STA T2 + 1 
3cfc : 10 11 __ BPL $3d0f ; (bmu_line.s7 + 0)
.s52:
3cfe : 38 __ __ SEC
3cff : a9 00 __ LDA #$00
3d01 : e5 46 __ SBC T2 + 0 
3d03 : 85 46 __ STA T2 + 0 
3d05 : a9 00 __ LDA #$00
3d07 : e5 47 __ SBC T2 + 1 
3d09 : 85 47 __ STA T2 + 1 
3d0b : a9 01 __ LDA #$01
3d0d : d0 02 __ BNE $3d11 ; (bmu_line.s8 + 0)
.s7:
3d0f : a9 00 __ LDA #$00
.s8:
3d11 : 85 51 __ STA T11 + 0 
3d13 : 38 __ __ SEC
3d14 : a5 15 __ LDA P8 ; (y1 + 0)
3d16 : e5 11 __ SBC P4 ; (y0 + 0)
3d18 : 85 43 __ STA T0 + 0 
3d1a : a5 16 __ LDA P9 ; (y1 + 1)
3d1c : e5 12 __ SBC P5 ; (y0 + 1)
3d1e : 85 44 __ STA T0 + 1 
3d20 : 10 11 __ BPL $3d33 ; (bmu_line.s9 + 0)
.s51:
3d22 : 38 __ __ SEC
3d23 : a9 00 __ LDA #$00
3d25 : e5 43 __ SBC T0 + 0 
3d27 : 85 43 __ STA T0 + 0 
3d29 : a9 00 __ LDA #$00
3d2b : e5 44 __ SBC T0 + 1 
3d2d : 85 44 __ STA T0 + 1 
3d2f : a9 01 __ LDA #$01
3d31 : d0 02 __ BNE $3d35 ; (bmu_line.s10 + 0)
.s9:
3d33 : a9 00 __ LDA #$00
.s10:
3d35 : 85 52 __ STA T12 + 0 
3d37 : a5 44 __ LDA T0 + 1 
3d39 : c5 47 __ CMP T2 + 1 
3d3b : d0 04 __ BNE $3d41 ; (bmu_line.s50 + 0)
.s49:
3d3d : a5 43 __ LDA T0 + 0 
3d3f : c5 46 __ CMP T2 + 0 
.s50:
3d41 : b0 06 __ BCS $3d49 ; (bmu_line.s11 + 0)
.s48:
3d43 : a5 47 __ LDA T2 + 1 
3d45 : a6 46 __ LDX T2 + 0 
3d47 : 90 04 __ BCC $3d4d ; (bmu_line.s12 + 0)
.s11:
3d49 : a5 44 __ LDA T0 + 1 
3d4b : a6 43 __ LDX T0 + 0 
.s12:
3d4d : 86 48 __ STX T4 + 0 
3d4f : 85 49 __ STA T4 + 1 
3d51 : 38 __ __ SEC
3d52 : a5 43 __ LDA T0 + 0 
3d54 : e5 46 __ SBC T2 + 0 
3d56 : 85 4a __ STA T5 + 0 
3d58 : a5 44 __ LDA T0 + 1 
3d5a : e5 47 __ SBC T2 + 1 
3d5c : 85 4b __ STA T5 + 1 
3d5e : a5 4a __ LDA T5 + 0 
3d60 : 4a __ __ LSR
3d61 : b0 0c __ BCS $3d6f ; (bmu_line.s47 + 0)
.s13:
3d63 : a5 4b __ LDA T5 + 1 
3d65 : c9 80 __ CMP #$80
3d67 : 6a __ __ ROR
3d68 : 85 4b __ STA T5 + 1 
3d6a : 66 4a __ ROR T5 + 0 
3d6c : 4c 77 3d JMP $3d77 ; (bmu_line.s14 + 0)
.s47:
3d6f : 06 43 __ ASL T0 + 0 
3d71 : 26 44 __ ROL T0 + 1 
3d73 : 06 46 __ ASL T2 + 0 
3d75 : 26 47 __ ROL T2 + 1 
.s14:
3d77 : a0 00 __ LDY #$00
3d79 : b1 0d __ LDA (P0),y ; (bm + 0)
3d7b : 85 4d __ STA T7 + 0 
3d7d : c8 __ __ INY
3d7e : b1 0d __ LDA (P0),y ; (bm + 0)
3d80 : 85 4e __ STA T7 + 1 
3d82 : a0 04 __ LDY #$04
3d84 : b1 0d __ LDA (P0),y ; (bm + 0)
3d86 : aa __ __ TAX
3d87 : 0a __ __ ASL
3d88 : 85 4f __ STA T8 + 0 
3d8a : a9 a0 __ LDA #$a0
3d8c : 8d 00 a0 STA $a000 ; (BLIT_CODE[0] + 0)
3d8f : a9 a2 __ LDA #$a2
3d91 : 8d 02 a0 STA $a002 ; (BLIT_CODE[0] + 2)
3d94 : a9 a5 __ LDA #$a5
3d96 : 8d 04 a0 STA $a004 ; (BLIT_CODE[0] + 4)
3d99 : a9 0a __ LDA #$0a
3d9b : 8d 05 a0 STA $a005 ; (BLIT_CODE[0] + 5)
3d9e : a9 00 __ LDA #$00
3da0 : 2a __ __ ROL
3da1 : 06 4f __ ASL T8 + 0 
3da3 : 2a __ __ ROL
3da4 : 06 4f __ ASL T8 + 0 
3da6 : 2a __ __ ROL
3da7 : 85 50 __ STA T8 + 1 
3da9 : a5 52 __ LDA T12 + 0 
3dab : f0 0d __ BEQ $3dba ; (bmu_line.s15 + 0)
.s46:
3dad : 38 __ __ SEC
3dae : a9 00 __ LDA #$00
3db0 : e5 4f __ SBC T8 + 0 
3db2 : 85 4f __ STA T8 + 0 
3db4 : a9 00 __ LDA #$00
3db6 : e5 50 __ SBC T8 + 1 
3db8 : 85 50 __ STA T8 + 1 
.s15:
3dba : a5 11 __ LDA P4 ; (y0 + 0)
3dbc : 29 f8 __ AND #$f8
3dbe : 85 1b __ STA ACCU + 0 
3dc0 : a5 12 __ LDA P5 ; (y0 + 1)
3dc2 : 85 1c __ STA ACCU + 1 
3dc4 : 8a __ __ TXA
3dc5 : 20 9e 77 JSR $779e ; (mul16by8 + 0)
3dc8 : 18 __ __ CLC
3dc9 : a5 4d __ LDA T7 + 0 
3dcb : 65 1b __ ADC ACCU + 0 
3dcd : 85 4d __ STA T7 + 0 
3dcf : a5 4e __ LDA T7 + 1 
3dd1 : 65 1c __ ADC ACCU + 1 
3dd3 : aa __ __ TAX
3dd4 : a5 0f __ LDA P2 ; (x0 + 0)
3dd6 : 29 f8 __ AND #$f8
3dd8 : 18 __ __ CLC
3dd9 : 65 4d __ ADC T7 + 0 
3ddb : 85 4d __ STA T7 + 0 
3ddd : 8a __ __ TXA
3dde : 65 10 __ ADC P3 ; (x0 + 1)
3de0 : 85 4e __ STA T7 + 1 
3de2 : a5 46 __ LDA T2 + 0 
3de4 : 05 43 __ ORA T0 + 0 
3de6 : 29 80 __ AND #$80
3de8 : 85 4c __ STA T6 + 0 
3dea : a5 47 __ LDA T2 + 1 
3dec : 05 44 __ ORA T0 + 1 
3dee : 05 4c __ ORA T6 + 0 
3df0 : f0 02 __ BEQ $3df4 ; (bmu_line.s56 + 0)
.s55:
3df2 : a9 01 __ LDA #$01
.s56:
3df4 : 85 1c __ STA ACCU + 1 
3df6 : a5 11 __ LDA P4 ; (y0 + 0)
3df8 : 29 07 __ AND #$07
3dfa : 8d 01 a0 STA $a001 ; (BLIT_CODE[0] + 1)
3dfd : a6 48 __ LDX T4 + 0 
3dff : e8 __ __ INX
3e00 : 8e 03 a0 STX $a003 ; (BLIT_CODE[0] + 3)
3e03 : a5 0f __ LDA P2 ; (x0 + 0)
3e05 : 29 07 __ AND #$07
3e07 : aa __ __ TAX
3e08 : a5 18 __ LDA P11 ; (op + 0)
3e0a : c9 02 __ CMP #$02
3e0c : d0 20 __ BNE $3e2e ; (bmu_line.s16 + 0)
.s45:
3e0e : a9 49 __ LDA #$49
3e10 : 8d 06 a0 STA $a006 ; (BLIT_CODE[0] + 6)
3e13 : a9 ff __ LDA #$ff
3e15 : 8d 07 a0 STA $a007 ; (BLIT_CODE[0] + 7)
3e18 : a9 31 __ LDA #$31
3e1a : 8d 08 a0 STA $a008 ; (BLIT_CODE[0] + 8)
3e1d : a9 03 __ LDA #$03
3e1f : 8d 09 a0 STA $a009 ; (BLIT_CODE[0] + 9)
3e22 : 8d 0b a0 STA $a00b ; (BLIT_CODE[0] + 11)
3e25 : a9 91 __ LDA #$91
3e27 : 8d 0a a0 STA $a00a ; (BLIT_CODE[0] + 10)
3e2a : a9 0c __ LDA #$0c
3e2c : d0 21 __ BNE $3e4f ; (bmu_line.s19 + 0)
.s16:
3e2e : b0 03 __ BCS $3e33 ; (bmu_line.s17 + 0)
3e30 : 4c 1b 41 JMP $411b ; (bmu_line.s42 + 0)
.s17:
3e33 : c9 03 __ CMP #$03
3e35 : f0 04 __ BEQ $3e3b ; (bmu_line.s40 + 0)
.s18:
3e37 : a9 06 __ LDA #$06
3e39 : d0 14 __ BNE $3e4f ; (bmu_line.s19 + 0)
.s40:
3e3b : a9 51 __ LDA #$51
.s41:
3e3d : 8d 06 a0 STA $a006 ; (BLIT_CODE[0] + 6)
3e40 : a9 03 __ LDA #$03
3e42 : 8d 07 a0 STA $a007 ; (BLIT_CODE[0] + 7)
3e45 : 8d 09 a0 STA $a009 ; (BLIT_CODE[0] + 9)
3e48 : a9 91 __ LDA #$91
3e4a : 8d 08 a0 STA $a008 ; (BLIT_CODE[0] + 8)
3e4d : a9 0a __ LDA #$0a
.s19:
3e4f : 85 45 __ STA T1 + 0 
3e51 : a5 43 __ LDA T0 + 0 
3e53 : 05 44 __ ORA T0 + 1 
3e55 : f0 03 __ BEQ $3e5a ; (bmu_line.s20 + 0)
3e57 : 4c 29 3f JMP $3f29 ; (bmu_line.s28 + 0)
.s20:
3e5a : a5 46 __ LDA T2 + 0 
3e5c : 05 47 __ ORA T2 + 1 
3e5e : f0 75 __ BEQ $3ed5 ; (bmu_line.s21 + 0)
.s22:
3e60 : a9 0a __ LDA #$0a
3e62 : a4 45 __ LDY T1 + 0 
3e64 : 99 01 a0 STA $a001,y ; (BLIT_CODE[0] + 1)
3e67 : 99 05 a0 STA $a005,y ; (BLIT_CODE[0] + 5)
3e6a : a9 90 __ LDA #$90
3e6c : 99 02 a0 STA $a002,y ; (BLIT_CODE[0] + 2)
3e6f : a9 0c __ LDA #$0c
3e71 : 99 03 a0 STA $a003,y ; (BLIT_CODE[0] + 3)
3e74 : a9 a5 __ LDA #$a5
3e76 : 99 06 a0 STA $a006,y ; (BLIT_CODE[0] + 6)
3e79 : a9 03 __ LDA #$03
3e7b : 99 07 a0 STA $a007,y ; (BLIT_CODE[0] + 7)
3e7e : a9 69 __ LDA #$69
3e80 : 99 08 a0 STA $a008,y ; (BLIT_CODE[0] + 8)
3e83 : a5 51 __ LDA T11 + 0 
3e85 : f0 09 __ BEQ $3e90 ; (bmu_line.s23 + 0)
.s27:
3e87 : a9 06 __ LDA #$06
3e89 : 99 00 a0 STA $a000,y ; (BLIT_CODE[0] + 0)
3e8c : a9 26 __ LDA #$26
3e8e : d0 07 __ BNE $3e97 ; (bmu_line.s53 + 0)
.s23:
3e90 : a9 46 __ LDA #$46
3e92 : 99 00 a0 STA $a000,y ; (BLIT_CODE[0] + 0)
3e95 : a9 66 __ LDA #$66
.s53:
3e97 : 99 04 a0 STA $a004,y ; (BLIT_CODE[0] + 4)
3e9a : a9 02 __ LDA #$02
3e9c : 99 0b a0 STA $a00b,y ; (BLIT_CODE[0] + 11)
3e9f : a5 51 __ LDA T11 + 0 
3ea1 : f0 0e __ BEQ $3eb1 ; (bmu_line.s24 + 0)
.s26:
3ea3 : a9 f8 __ LDA #$f8
3ea5 : 99 09 a0 STA $a009,y ; (BLIT_CODE[0] + 9)
3ea8 : a9 b0 __ LDA #$b0
3eaa : 99 0a a0 STA $a00a,y ; (BLIT_CODE[0] + 10)
3ead : a9 c6 __ LDA #$c6
3eaf : d0 0c __ BNE $3ebd ; (bmu_line.s25 + 0)
.s24:
3eb1 : a9 08 __ LDA #$08
3eb3 : 99 09 a0 STA $a009,y ; (BLIT_CODE[0] + 9)
3eb6 : a9 90 __ LDA #$90
3eb8 : 99 0a a0 STA $a00a,y ; (BLIT_CODE[0] + 10)
3ebb : a9 e6 __ LDA #$e6
.s25:
3ebd : 99 0c a0 STA $a00c,y ; (BLIT_CODE[0] + 12)
3ec0 : a9 04 __ LDA #$04
3ec2 : 99 0d a0 STA $a00d,y ; (BLIT_CODE[0] + 13)
3ec5 : a9 85 __ LDA #$85
3ec7 : 99 0e a0 STA $a00e,y ; (BLIT_CODE[0] + 14)
3eca : a9 03 __ LDA #$03
3ecc : 99 0f a0 STA $a00f,y ; (BLIT_CODE[0] + 15)
3ecf : 98 __ __ TYA
3ed0 : 18 __ __ CLC
3ed1 : 69 10 __ ADC #$10
3ed3 : 85 45 __ STA T1 + 0 
.s21:
3ed5 : a9 ca __ LDA #$ca
3ed7 : a4 45 __ LDY T1 + 0 
3ed9 : 84 43 __ STY T0 + 0 
3edb : 99 00 a0 STA $a000,y ; (BLIT_CODE[0] + 0)
3ede : a9 d0 __ LDA #$d0
3ee0 : 99 01 a0 STA $a001,y ; (BLIT_CODE[0] + 1)
3ee3 : a9 c6 __ LDA #$c6
3ee5 : 99 03 a0 STA $a003,y ; (BLIT_CODE[0] + 3)
3ee8 : a9 0b __ LDA #$0b
3eea : 99 04 a0 STA $a004,y ; (BLIT_CODE[0] + 4)
3eed : a9 10 __ LDA #$10
3eef : 99 05 a0 STA $a005,y ; (BLIT_CODE[0] + 5)
3ef2 : a9 60 __ LDA #$60
3ef4 : 99 07 a0 STA $a007,y ; (BLIT_CODE[0] + 7)
3ef7 : e6 43 __ INC T0 + 0 
3ef9 : 38 __ __ SEC
3efa : a9 02 __ LDA #$02
3efc : e5 43 __ SBC T0 + 0 
3efe : 99 02 a0 STA $a002,y ; (BLIT_CODE[0] + 2)
3f01 : 38 __ __ SEC
3f02 : a9 fe __ LDA #$fe
3f04 : e5 43 __ SBC T0 + 0 
3f06 : 99 06 a0 STA $a006,y ; (BLIT_CODE[0] + 6)
3f09 : a5 49 __ LDA T4 + 1 
3f0b : 85 0b __ STA WORK + 8 
3f0d : a5 4d __ LDA T7 + 0 
3f0f : 85 03 __ STA WORK + 0 
3f11 : a5 4e __ LDA T7 + 1 
3f13 : 85 04 __ STA WORK + 1 
3f15 : a5 4a __ LDA T5 + 0 
3f17 : 85 05 __ STA WORK + 2 
3f19 : a5 4b __ LDA T5 + 1 
3f1b : 85 06 __ STA WORK + 3 
3f1d : bd e8 88 LDA $88e8,x ; (bitshift[0] + 32)
3f20 : 85 0a __ STA WORK + 7 
3f22 : a9 ff __ LDA #$ff
3f24 : 85 07 __ STA WORK + 4 
3f26 : 4c 00 a0 JMP $a000 ; (BLIT_CODE[0] + 0)
.s28:
3f29 : a5 46 __ LDA T2 + 0 
3f2b : 05 47 __ ORA T2 + 1 
3f2d : c9 01 __ CMP #$01
3f2f : a9 00 __ LDA #$00
3f31 : 6a __ __ ROR
3f32 : 85 1d __ STA ACCU + 2 
3f34 : f0 03 __ BEQ $3f39 ; (bmu_line.s29 + 0)
3f36 : 4c d4 40 JMP $40d4 ; (bmu_line.s35 + 0)
.s29:
3f39 : a9 00 __ LDA #$00
3f3b : 85 46 __ STA T2 + 0 
3f3d : 85 47 __ STA T2 + 1 
3f3f : 85 1b __ STA ACCU + 0 
3f41 : a5 52 __ LDA T12 + 0 
3f43 : f0 03 __ BEQ $3f48 ; (bmu_line.s30 + 0)
3f45 : 4c 69 40 JMP $4069 ; (bmu_line.s34 + 0)
.s30:
3f48 : a9 c8 __ LDA #$c8
3f4a : a4 45 __ LDY T1 + 0 
3f4c : 99 00 a0 STA $a000,y ; (BLIT_CODE[0] + 0)
3f4f : a9 c0 __ LDA #$c0
3f51 : 99 01 a0 STA $a001,y ; (BLIT_CODE[0] + 1)
3f54 : a9 08 __ LDA #$08
3f56 : 99 02 a0 STA $a002,y ; (BLIT_CODE[0] + 2)
3f59 : a9 d0 __ LDA #$d0
3f5b : 99 03 a0 STA $a003,y ; (BLIT_CODE[0] + 3)
3f5e : a9 a0 __ LDA #$a0
3f60 : 99 05 a0 STA $a005,y ; (BLIT_CODE[0] + 5)
3f63 : a9 00 __ LDA #$00
3f65 : 99 06 a0 STA $a006,y ; (BLIT_CODE[0] + 6)
3f68 : a9 a5 __ LDA #$a5
3f6a : 99 07 a0 STA $a007,y ; (BLIT_CODE[0] + 7)
3f6d : 99 0d a0 STA $a00d,y ; (BLIT_CODE[0] + 13)
3f70 : a9 03 __ LDA #$03
3f72 : 99 08 a0 STA $a008,y ; (BLIT_CODE[0] + 8)
3f75 : 99 0c a0 STA $a00c,y ; (BLIT_CODE[0] + 12)
3f78 : a9 69 __ LDA #$69
3f7a : 99 09 a0 STA $a009,y ; (BLIT_CODE[0] + 9)
3f7d : 99 0f a0 STA $a00f,y ; (BLIT_CODE[0] + 15)
3f80 : a9 85 __ LDA #$85
3f82 : 99 0b a0 STA $a00b,y ; (BLIT_CODE[0] + 11)
3f85 : 99 11 a0 STA $a011,y ; (BLIT_CODE[0] + 17)
3f88 : a9 04 __ LDA #$04
3f8a : 99 0e a0 STA $a00e,y ; (BLIT_CODE[0] + 14)
3f8d : 99 12 a0 STA $a012,y ; (BLIT_CODE[0] + 18)
3f90 : a5 1b __ LDA ACCU + 0 
3f92 : f0 04 __ BEQ $3f98 ; (bmu_line.s60 + 0)
.s61:
3f94 : a9 10 __ LDA #$10
3f96 : 90 02 __ BCC $3f9a ; (bmu_line.s62 + 0)
.s60:
3f98 : a9 0e __ LDA #$0e
.s62:
3f9a : 99 04 a0 STA $a004,y ; (BLIT_CODE[0] + 4)
3f9d : 38 __ __ SEC
3f9e : a5 4f __ LDA T8 + 0 
3fa0 : e9 01 __ SBC #$01
3fa2 : 99 0a a0 STA $a00a,y ; (BLIT_CODE[0] + 10)
3fa5 : a5 50 __ LDA T8 + 1 
3fa7 : e9 00 __ SBC #$00
3fa9 : 99 10 a0 STA $a010,y ; (BLIT_CODE[0] + 16)
3fac : 98 __ __ TYA
3fad : 18 __ __ CLC
3fae : 69 13 __ ADC #$13
3fb0 : 85 45 __ STA T1 + 0 
3fb2 : a8 __ __ TAY
3fb3 : 24 1d __ BIT ACCU + 2 
3fb5 : 30 03 __ BMI $3fba ; (bmu_line.s31 + 0)
3fb7 : 4c 5a 3e JMP $3e5a ; (bmu_line.s20 + 0)
.s31:
3fba : a9 a5 __ LDA #$a5
3fbc : 99 00 a0 STA $a000,y ; (BLIT_CODE[0] + 0)
3fbf : a9 05 __ LDA #$05
3fc1 : 99 01 a0 STA $a001,y ; (BLIT_CODE[0] + 1)
3fc4 : 99 06 a0 STA $a006,y ; (BLIT_CODE[0] + 6)
3fc7 : a9 38 __ LDA #$38
3fc9 : 99 02 a0 STA $a002,y ; (BLIT_CODE[0] + 2)
3fcc : a9 e9 __ LDA #$e9
3fce : 99 03 a0 STA $a003,y ; (BLIT_CODE[0] + 3)
3fd1 : a9 85 __ LDA #$85
3fd3 : 99 05 a0 STA $a005,y ; (BLIT_CODE[0] + 5)
3fd6 : a5 46 __ LDA T2 + 0 
3fd8 : 99 04 a0 STA $a004,y ; (BLIT_CODE[0] + 4)
3fdb : a5 1c __ LDA ACCU + 1 
3fdd : d0 2a __ BNE $4009 ; (bmu_line.s33 + 0)
.s32:
3fdf : a9 10 __ LDA #$10
3fe1 : 99 07 a0 STA $a007,y ; (BLIT_CODE[0] + 7)
3fe4 : a9 15 __ LDA #$15
3fe6 : 99 08 a0 STA $a008,y ; (BLIT_CODE[0] + 8)
3fe9 : a9 18 __ LDA #$18
3feb : 99 09 a0 STA $a009,y ; (BLIT_CODE[0] + 9)
3fee : a9 69 __ LDA #$69
3ff0 : 99 0a a0 STA $a00a,y ; (BLIT_CODE[0] + 10)
3ff3 : a5 43 __ LDA T0 + 0 
3ff5 : 99 0b a0 STA $a00b,y ; (BLIT_CODE[0] + 11)
3ff8 : a9 85 __ LDA #$85
3ffa : 99 0c a0 STA $a00c,y ; (BLIT_CODE[0] + 12)
3ffd : a9 05 __ LDA #$05
3fff : 99 0d a0 STA $a00d,y ; (BLIT_CODE[0] + 13)
4002 : 98 __ __ TYA
4003 : 18 __ __ CLC
4004 : 69 0e __ ADC #$0e
4006 : 4c 64 40 JMP $4064 ; (bmu_line.s54 + 0)
.s33:
4009 : a9 a5 __ LDA #$a5
400b : 99 07 a0 STA $a007,y ; (BLIT_CODE[0] + 7)
400e : 99 10 a0 STA $a010,y ; (BLIT_CODE[0] + 16)
4011 : 99 16 a0 STA $a016,y ; (BLIT_CODE[0] + 22)
4014 : a9 06 __ LDA #$06
4016 : 99 08 a0 STA $a008,y ; (BLIT_CODE[0] + 8)
4019 : 99 0c a0 STA $a00c,y ; (BLIT_CODE[0] + 12)
401c : 99 17 a0 STA $a017,y ; (BLIT_CODE[0] + 23)
401f : 99 1b a0 STA $a01b,y ; (BLIT_CODE[0] + 27)
4022 : a9 e9 __ LDA #$e9
4024 : 99 09 a0 STA $a009,y ; (BLIT_CODE[0] + 9)
4027 : a9 85 __ LDA #$85
4029 : 99 0b a0 STA $a00b,y ; (BLIT_CODE[0] + 11)
402c : 99 14 a0 STA $a014,y ; (BLIT_CODE[0] + 20)
402f : 99 1a a0 STA $a01a,y ; (BLIT_CODE[0] + 26)
4032 : a9 10 __ LDA #$10
4034 : 99 0d a0 STA $a00d,y ; (BLIT_CODE[0] + 13)
4037 : a9 1d __ LDA #$1d
4039 : 99 0e a0 STA $a00e,y ; (BLIT_CODE[0] + 14)
403c : a9 18 __ LDA #$18
403e : 99 0f a0 STA $a00f,y ; (BLIT_CODE[0] + 15)
4041 : a9 05 __ LDA #$05
4043 : 99 11 a0 STA $a011,y ; (BLIT_CODE[0] + 17)
4046 : 99 15 a0 STA $a015,y ; (BLIT_CODE[0] + 21)
4049 : a9 69 __ LDA #$69
404b : 99 12 a0 STA $a012,y ; (BLIT_CODE[0] + 18)
404e : 99 18 a0 STA $a018,y ; (BLIT_CODE[0] + 24)
4051 : a5 43 __ LDA T0 + 0 
4053 : 99 13 a0 STA $a013,y ; (BLIT_CODE[0] + 19)
4056 : a5 47 __ LDA T2 + 1 
4058 : 99 0a a0 STA $a00a,y ; (BLIT_CODE[0] + 10)
405b : a5 44 __ LDA T0 + 1 
405d : 99 19 a0 STA $a019,y ; (BLIT_CODE[0] + 25)
4060 : 98 __ __ TYA
4061 : 18 __ __ CLC
4062 : 69 1c __ ADC #$1c
.s54:
4064 : 85 45 __ STA T1 + 0 
4066 : 4c 60 3e JMP $3e60 ; (bmu_line.s22 + 0)
.s34:
4069 : a9 88 __ LDA #$88
406b : a4 45 __ LDY T1 + 0 
406d : 99 00 a0 STA $a000,y ; (BLIT_CODE[0] + 0)
4070 : a9 10 __ LDA #$10
4072 : 99 01 a0 STA $a001,y ; (BLIT_CODE[0] + 1)
4075 : a9 18 __ LDA #$18
4077 : 99 03 a0 STA $a003,y ; (BLIT_CODE[0] + 3)
407a : a9 a0 __ LDA #$a0
407c : 99 04 a0 STA $a004,y ; (BLIT_CODE[0] + 4)
407f : a9 07 __ LDA #$07
4081 : 99 05 a0 STA $a005,y ; (BLIT_CODE[0] + 5)
4084 : a9 a5 __ LDA #$a5
4086 : 99 06 a0 STA $a006,y ; (BLIT_CODE[0] + 6)
4089 : 99 0c a0 STA $a00c,y ; (BLIT_CODE[0] + 12)
408c : a9 03 __ LDA #$03
408e : 99 07 a0 STA $a007,y ; (BLIT_CODE[0] + 7)
4091 : 99 0b a0 STA $a00b,y ; (BLIT_CODE[0] + 11)
4094 : a9 69 __ LDA #$69
4096 : 99 08 a0 STA $a008,y ; (BLIT_CODE[0] + 8)
4099 : 99 0e a0 STA $a00e,y ; (BLIT_CODE[0] + 14)
409c : a9 85 __ LDA #$85
409e : 99 0a a0 STA $a00a,y ; (BLIT_CODE[0] + 10)
40a1 : 99 10 a0 STA $a010,y ; (BLIT_CODE[0] + 16)
40a4 : a9 04 __ LDA #$04
40a6 : 99 0d a0 STA $a00d,y ; (BLIT_CODE[0] + 13)
40a9 : 99 11 a0 STA $a011,y ; (BLIT_CODE[0] + 17)
40ac : a5 1b __ LDA ACCU + 0 
40ae : f0 04 __ BEQ $40b4 ; (bmu_line.s57 + 0)
.s58:
40b0 : a9 11 __ LDA #$11
40b2 : 90 02 __ BCC $40b6 ; (bmu_line.s59 + 0)
.s57:
40b4 : a9 0f __ LDA #$0f
.s59:
40b6 : 99 02 a0 STA $a002,y ; (BLIT_CODE[0] + 2)
40b9 : a5 4f __ LDA T8 + 0 
40bb : 99 09 a0 STA $a009,y ; (BLIT_CODE[0] + 9)
40be : a5 50 __ LDA T8 + 1 
40c0 : 99 0f a0 STA $a00f,y ; (BLIT_CODE[0] + 15)
40c3 : 98 __ __ TYA
40c4 : 18 __ __ CLC
40c5 : 69 12 __ ADC #$12
40c7 : 85 45 __ STA T1 + 0 
40c9 : a8 __ __ TAY
40ca : 24 1d __ BIT ACCU + 2 
40cc : 10 03 __ BPL $40d1 ; (bmu_line.s59 + 27)
40ce : 4c ba 3f JMP $3fba ; (bmu_line.s31 + 0)
40d1 : 4c 5a 3e JMP $3e5a ; (bmu_line.s20 + 0)
.s35:
40d4 : a9 a5 __ LDA #$a5
40d6 : a4 45 __ LDY T1 + 0 
40d8 : 99 00 a0 STA $a000,y ; (BLIT_CODE[0] + 0)
40db : a9 30 __ LDA #$30
40dd : 99 02 a0 STA $a002,y ; (BLIT_CODE[0] + 2)
40e0 : a5 1c __ LDA ACCU + 1 
40e2 : 69 05 __ ADC #$05
40e4 : 99 01 a0 STA $a001,y ; (BLIT_CODE[0] + 1)
40e7 : a5 1c __ LDA ACCU + 1 
40e9 : d0 26 __ BNE $4111 ; (bmu_line.s39 + 0)
.s36:
40eb : a9 1b __ LDA #$1b
40ed : 85 1b __ STA ACCU + 0 
40ef : a5 52 __ LDA T12 + 0 
40f1 : d0 02 __ BNE $40f5 ; (bmu_line.s38 + 0)
.s37:
40f3 : e6 1b __ INC ACCU + 0 
.s38:
40f5 : a5 1b __ LDA ACCU + 0 
40f7 : 99 03 a0 STA $a003,y ; (BLIT_CODE[0] + 3)
40fa : 98 __ __ TYA
40fb : 18 __ __ CLC
40fc : 69 04 __ ADC #$04
40fe : 85 45 __ STA T1 + 0 
4100 : a9 00 __ LDA #$00
4102 : c5 1c __ CMP ACCU + 1 
4104 : 2a __ __ ROL
4105 : 85 1b __ STA ACCU + 0 
4107 : a5 52 __ LDA T12 + 0 
4109 : f0 03 __ BEQ $410e ; (bmu_line.s38 + 25)
410b : 4c 69 40 JMP $4069 ; (bmu_line.s34 + 0)
410e : 4c 48 3f JMP $3f48 ; (bmu_line.s30 + 0)
.s39:
4111 : a9 21 __ LDA #$21
4113 : 85 1b __ STA ACCU + 0 
4115 : a5 52 __ LDA T12 + 0 
4117 : d0 dc __ BNE $40f5 ; (bmu_line.s38 + 0)
4119 : f0 d8 __ BEQ $40f3 ; (bmu_line.s37 + 0)
.s42:
411b : a8 __ __ TAY
411c : f0 05 __ BEQ $4123 ; (bmu_line.s43 + 0)
.s44:
411e : a9 11 __ LDA #$11
4120 : 4c 3d 3e JMP $3e3d ; (bmu_line.s41 + 0)
.s43:
4123 : a9 06 __ LDA #$06
4125 : 8d 06 a0 STA $a006 ; (BLIT_CODE[0] + 6)
4128 : 8d 09 a0 STA $a009 ; (BLIT_CODE[0] + 9)
412b : a9 07 __ LDA #$07
412d : 8d 07 a0 STA $a007 ; (BLIT_CODE[0] + 7)
4130 : 8d 0b a0 STA $a00b ; (BLIT_CODE[0] + 11)
4133 : a9 90 __ LDA #$90
4135 : 8d 08 a0 STA $a008 ; (BLIT_CODE[0] + 8)
4138 : a9 e6 __ LDA #$e6
413a : 8d 0a a0 STA $a00a ; (BLIT_CODE[0] + 10)
413d : a9 11 __ LDA #$11
413f : 8d 0c a0 STA $a00c ; (BLIT_CODE[0] + 12)
4142 : a9 03 __ LDA #$03
4144 : 8d 0d a0 STA $a00d ; (BLIT_CODE[0] + 13)
4147 : 8d 13 a0 STA $a013 ; (BLIT_CODE[0] + 19)
414a : 8d 15 a0 STA $a015 ; (BLIT_CODE[0] + 21)
414d : a9 d0 __ LDA #$d0
414f : 8d 0e a0 STA $a00e ; (BLIT_CODE[0] + 14)
4152 : a9 04 __ LDA #$04
4154 : 8d 0f a0 STA $a00f ; (BLIT_CODE[0] + 15)
4157 : a9 49 __ LDA #$49
4159 : 8d 10 a0 STA $a010 ; (BLIT_CODE[0] + 16)
415c : a9 ff __ LDA #$ff
415e : 8d 11 a0 STA $a011 ; (BLIT_CODE[0] + 17)
4161 : a9 31 __ LDA #$31
4163 : 8d 12 a0 STA $a012 ; (BLIT_CODE[0] + 18)
4166 : a9 91 __ LDA #$91
4168 : 8d 14 a0 STA $a014 ; (BLIT_CODE[0] + 20)
416b : a9 16 __ LDA #$16
416d : 4c 4f 3e JMP $3e4f ; (bmu_line.s19 + 0)
--------------------------------------------------------------------
engine_update: ; engine_update(u8)->void
; 359, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s4:
4170 : 0a __ __ ASL
4171 : aa __ __ TAX
4172 : bd 45 7d LDA $7d45,x ; (sid_freq[0] + 0)
4175 : 8d 00 d4 STA $d400 
4178 : bd 46 7d LDA $7d46,x ; (sid_freq[0] + 1)
417b : 85 1c __ STA ACCU + 1 
417d : 8d 01 d4 STA $d401 
4180 : bd 45 7d LDA $7d45,x ; (sid_freq[0] + 0)
4183 : 0a __ __ ASL
4184 : 26 1c __ ROL ACCU + 1 
4186 : 8d 07 d4 STA $d407 
4189 : a5 1c __ LDA ACCU + 1 
418b : 8d 08 d4 STA $d408 
.s3:
418e : 60 __ __ RTS
--------------------------------------------------------------------
modplay_start: ; modplay_start()->void
; 239, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s4:
418f : ad c0 9b LDA $9bc0 ; (modplay.song_length + 0)
4192 : d0 01 __ BNE $4195 ; (modplay_start.s5 + 0)
.s3:
4194 : 60 __ __ RTS
.s5:
4195 : a9 00 __ LDA #$00
4197 : 8d ff 15 STA $15ff ; (mod_paused + 0)
419a : 8d 43 9c STA $9c43 ; (modplay.order_pos + 0)
419d : 85 43 __ STA T0 + 0 
419f : 8d 45 9c STA $9c45 ; (modplay.row + 0)
41a2 : 8d 46 9c STA $9c46 ; (modplay.tick + 0)
41a5 : 8d 49 9c STA $9c49 ; (modplay.pattern_delay + 0)
41a8 : 8d 4e 9c STA $9c4e ; (modplay.skip_row_advance + 0)
41ab : ad c3 9b LDA $9bc3 ; (modplay.order_table[0] + 0)
41ae : 8d 44 9c STA $9c44 ; (modplay.pattern_num + 0)
41b1 : a9 06 __ LDA #$06
41b3 : 8d 47 9c STA $9c47 ; (modplay.ticks_per_row + 0)
41b6 : a9 7d __ LDA #$7d
41b8 : 8d 48 9c STA $9c48 ; (modplay.bpm + 0)
41bb : a9 01 __ LDA #$01
41bd : 8d 4c 9c STA $9c4c ; (modplay.active + 0)
41c0 : ad 4b 9c LDA $9c4b ; (modplay.stereo + 0)
41c3 : d0 17 __ BNE $41dc ; (modplay_start.l10 + 0)
.s7:
41c5 : a9 80 __ LDA #$80
41c7 : a6 43 __ LDX T0 + 0 
41c9 : bc cd 7b LDY $7bcd,x ; (__multab50L + 0)
.l8:
41cc : 99 a4 9e STA $9ea4,y ; (modplay.channel[0].pan + 0)
41cf : e6 43 __ INC T0 + 0 
41d1 : a5 43 __ LDA T0 + 0 
41d3 : c9 04 __ CMP #$04
41d5 : b0 1d __ BCS $41f4 ; (modplay_start.s9 + 0)
.s6:
41d7 : ad 4b 9c LDA $9c4b ; (modplay.stereo + 0)
41da : f0 e9 __ BEQ $41c5 ; (modplay_start.s7 + 0)
.l10:
41dc : a5 43 __ LDA T0 + 0 
41de : f0 04 __ BEQ $41e4 ; (modplay_start.s11 + 0)
.s13:
41e0 : c9 03 __ CMP #$03
41e2 : d0 04 __ BNE $41e8 ; (modplay_start.s14 + 0)
.s11:
41e4 : a2 00 __ LDX #$00
41e6 : f0 02 __ BEQ $41ea ; (modplay_start.s12 + 0)
.s14:
41e8 : a2 ff __ LDX #$ff
.s12:
41ea : a4 43 __ LDY T0 + 0 
41ec : b9 cd 7b LDA $7bcd,y ; (__multab50L + 0)
41ef : a8 __ __ TAY
41f0 : 8a __ __ TXA
41f1 : 4c cc 41 JMP $41cc ; (modplay_start.l8 + 0)
.s9:
41f4 : ad 48 9c LDA $9c48 ; (modplay.bpm + 0)
41f7 : 20 34 42 JSR $4234 ; (bpm_to_timer.s4 + 0)
41fa : a5 1b __ LDA ACCU + 0 
41fc : 85 43 __ STA T0 + 0 
41fe : a5 1c __ LDA ACCU + 1 
4200 : 85 44 __ STA T0 + 1 
4202 : 78 __ __ SEI
4203 : ad 14 03 LDA $0314 
4206 : 8d fe 7b STA $7bfe ; (mod_saved_irq[0] + 0)
4209 : ad 15 03 LDA $0315 
420c : 8d ff 7b STA $7bff ; (mod_saved_irq[0] + 1)
420f : a9 7f __ LDA #$7f
4211 : 8d 0d dc STA $dc0d 
4214 : a5 43 __ LDA T0 + 0 
4216 : 8d 04 dc STA $dc04 
4219 : a5 44 __ LDA T0 + 1 
421b : 8d 05 dc STA $dc05 
421e : a9 2f __ LDA #$2f
4220 : 8d 14 03 STA $0314 
4223 : a9 43 __ LDA #$43
4225 : 8d 15 03 STA $0315 
4228 : a9 81 __ LDA #$81
422a : 8d 0d dc STA $dc0d 
422d : a9 01 __ LDA #$01
422f : 8d 0e dc STA $dc0e 
4232 : 58 __ __ CLI
4233 : 60 __ __ RTS
--------------------------------------------------------------------
bpm_to_timer: ; bpm_to_timer(u8)->u16
;  76, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4234 : 85 03 __ STA WORK + 0 
4236 : aa __ __ TAX
4237 : d0 09 __ BNE $4242 ; (bpm_to_timer.s6 + 0)
.s5:
4239 : a9 f8 __ LDA #$f8
423b : 85 1b __ STA ACCU + 0 
423d : a9 4c __ LDA #$4c
423f : 85 1c __ STA ACCU + 1 
.s3:
4241 : 60 __ __ RTS
.s6:
4242 : a9 00 __ LDA #$00
4244 : 85 1e __ STA ACCU + 3 
4246 : 85 04 __ STA WORK + 1 
4248 : 85 05 __ STA WORK + 2 
424a : 85 06 __ STA WORK + 3 
424c : a9 90 __ LDA #$90
424e : 85 1b __ STA ACCU + 0 
4250 : a9 95 __ LDA #$95
4252 : 85 1c __ STA ACCU + 1 
4254 : a9 25 __ LDA #$25
4256 : 85 1d __ STA ACCU + 2 
--------------------------------------------------------------------
divmod32: ; divmod32
4258 : 84 02 __ STY $02 
425a : a0 20 __ LDY #$20
425c : a9 00 __ LDA #$00
425e : 85 07 __ STA WORK + 4 
4260 : 85 08 __ STA WORK + 5 
4262 : 85 09 __ STA WORK + 6 
4264 : 85 0a __ STA WORK + 7 
4266 : a5 05 __ LDA WORK + 2 
4268 : 05 06 __ ORA WORK + 3 
426a : d0 78 __ BNE $42e4 ; (divmod32 + 140)
426c : a5 04 __ LDA WORK + 1 
426e : d0 27 __ BNE $4297 ; (divmod32 + 63)
4270 : 18 __ __ CLC
4271 : 26 1b __ ROL ACCU + 0 
4273 : 26 1c __ ROL ACCU + 1 
4275 : 26 1d __ ROL ACCU + 2 
4277 : 26 1e __ ROL ACCU + 3 
4279 : 2a __ __ ROL
427a : 90 05 __ BCC $4281 ; (divmod32 + 41)
427c : e5 03 __ SBC WORK + 0 
427e : 38 __ __ SEC
427f : b0 06 __ BCS $4287 ; (divmod32 + 47)
4281 : c5 03 __ CMP WORK + 0 
4283 : 90 02 __ BCC $4287 ; (divmod32 + 47)
4285 : e5 03 __ SBC WORK + 0 
4287 : 88 __ __ DEY
4288 : d0 e7 __ BNE $4271 ; (divmod32 + 25)
428a : 85 07 __ STA WORK + 4 
428c : 26 1b __ ROL ACCU + 0 
428e : 26 1c __ ROL ACCU + 1 
4290 : 26 1d __ ROL ACCU + 2 
4292 : 26 1e __ ROL ACCU + 3 
4294 : a4 02 __ LDY $02 
4296 : 60 __ __ RTS
4297 : a5 1e __ LDA ACCU + 3 
4299 : d0 10 __ BNE $42ab ; (divmod32 + 83)
429b : a6 1d __ LDX ACCU + 2 
429d : 86 1e __ STX ACCU + 3 
429f : a6 1c __ LDX ACCU + 1 
42a1 : 86 1d __ STX ACCU + 2 
42a3 : a6 1b __ LDX ACCU + 0 
42a5 : 86 1c __ STX ACCU + 1 
42a7 : 85 1b __ STA ACCU + 0 
42a9 : a0 18 __ LDY #$18
42ab : 18 __ __ CLC
42ac : 26 1b __ ROL ACCU + 0 
42ae : 26 1c __ ROL ACCU + 1 
42b0 : 26 1d __ ROL ACCU + 2 
42b2 : 26 1e __ ROL ACCU + 3 
42b4 : 26 07 __ ROL WORK + 4 
42b6 : 26 08 __ ROL WORK + 5 
42b8 : 90 0c __ BCC $42c6 ; (divmod32 + 110)
42ba : a5 07 __ LDA WORK + 4 
42bc : e5 03 __ SBC WORK + 0 
42be : aa __ __ TAX
42bf : a5 08 __ LDA WORK + 5 
42c1 : e5 04 __ SBC WORK + 1 
42c3 : 38 __ __ SEC
42c4 : b0 0c __ BCS $42d2 ; (divmod32 + 122)
42c6 : 38 __ __ SEC
42c7 : a5 07 __ LDA WORK + 4 
42c9 : e5 03 __ SBC WORK + 0 
42cb : aa __ __ TAX
42cc : a5 08 __ LDA WORK + 5 
42ce : e5 04 __ SBC WORK + 1 
42d0 : 90 04 __ BCC $42d6 ; (divmod32 + 126)
42d2 : 86 07 __ STX WORK + 4 
42d4 : 85 08 __ STA WORK + 5 
42d6 : 88 __ __ DEY
42d7 : d0 d3 __ BNE $42ac ; (divmod32 + 84)
42d9 : 26 1b __ ROL ACCU + 0 
42db : 26 1c __ ROL ACCU + 1 
42dd : 26 1d __ ROL ACCU + 2 
42df : 26 1e __ ROL ACCU + 3 
42e1 : a4 02 __ LDY $02 
42e3 : 60 __ __ RTS
42e4 : a0 10 __ LDY #$10
42e6 : a5 1e __ LDA ACCU + 3 
42e8 : 85 08 __ STA WORK + 5 
42ea : a5 1d __ LDA ACCU + 2 
42ec : 85 07 __ STA WORK + 4 
42ee : a9 00 __ LDA #$00
42f0 : 85 1d __ STA ACCU + 2 
42f2 : 85 1e __ STA ACCU + 3 
42f4 : 18 __ __ CLC
42f5 : 26 1b __ ROL ACCU + 0 
42f7 : 26 1c __ ROL ACCU + 1 
42f9 : 26 07 __ ROL WORK + 4 
42fb : 26 08 __ ROL WORK + 5 
42fd : 26 09 __ ROL WORK + 6 
42ff : 26 0a __ ROL WORK + 7 
4301 : a5 07 __ LDA WORK + 4 
4303 : c5 03 __ CMP WORK + 0 
4305 : a5 08 __ LDA WORK + 5 
4307 : e5 04 __ SBC WORK + 1 
4309 : a5 09 __ LDA WORK + 6 
430b : e5 05 __ SBC WORK + 2 
430d : aa __ __ TAX
430e : a5 0a __ LDA WORK + 7 
4310 : e5 06 __ SBC WORK + 3 
4312 : 90 11 __ BCC $4325 ; (divmod32 + 205)
4314 : 86 09 __ STX WORK + 6 
4316 : 85 0a __ STA WORK + 7 
4318 : a5 07 __ LDA WORK + 4 
431a : e5 03 __ SBC WORK + 0 
431c : 85 07 __ STA WORK + 4 
431e : a5 08 __ LDA WORK + 5 
4320 : e5 04 __ SBC WORK + 1 
4322 : 85 08 __ STA WORK + 5 
4324 : 38 __ __ SEC
4325 : 88 __ __ DEY
4326 : d0 cd __ BNE $42f5 ; (divmod32 + 157)
4328 : 26 1b __ ROL ACCU + 0 
432a : 26 1c __ ROL ACCU + 1 
432c : a4 02 __ LDY $02 
432e : 60 __ __ RTS
--------------------------------------------------------------------
modplay_irq: ; modplay_irq
432f : ad 0d dc LDA $dc0d 
4332 : 29 01 __ AND #$01
4334 : d0 03 __ BNE $4339 ; (modplay_irq + 10)
4336 : 4c 31 ea JMP $ea31 
4339 : a5 07 __ LDA WORK + 4 
433b : 48 __ __ PHA
433c : a5 08 __ LDA WORK + 5 
433e : 48 __ __ PHA
433f : a5 09 __ LDA WORK + 6 
4341 : 48 __ __ PHA
4342 : a5 0a __ LDA WORK + 7 
4344 : 48 __ __ PHA
4345 : a5 0b __ LDA WORK + 8 
4347 : 48 __ __ PHA
4348 : a5 0c __ LDA $0c 
434a : 48 __ __ PHA
434b : a5 14 __ LDA P7 
434d : 48 __ __ PHA
434e : a5 15 __ LDA P8 
4350 : 48 __ __ PHA
4351 : a5 16 __ LDA P9 
4353 : 48 __ __ PHA
4354 : a5 17 __ LDA P10 
4356 : 48 __ __ PHA
4357 : a5 18 __ LDA P11 
4359 : 48 __ __ PHA
435a : a5 19 __ LDA IP + 0 
435c : 48 __ __ PHA
435d : a5 1a __ LDA IP + 1 
435f : 48 __ __ PHA
4360 : a5 1f __ LDA ADDR + 0 
4362 : 48 __ __ PHA
4363 : a5 20 __ LDA ADDR + 1 
4365 : 48 __ __ PHA
4366 : a5 21 __ LDA ADDR + 2 
4368 : 48 __ __ PHA
4369 : a5 22 __ LDA ADDR + 3 
436b : 48 __ __ PHA
436c : a5 23 __ LDA SP + 0 
436e : 48 __ __ PHA
436f : a5 24 __ LDA SP + 1 
4371 : 48 __ __ PHA
4372 : a5 25 __ LDA FP + 0 
4374 : 48 __ __ PHA
4375 : a5 26 __ LDA FP + 1 
4377 : 48 __ __ PHA
4378 : a5 27 __ LDA $27 
437a : 48 __ __ PHA
437b : a5 28 __ LDA $28 
437d : 48 __ __ PHA
437e : a5 29 __ LDA $29 
4380 : 48 __ __ PHA
4381 : a5 2a __ LDA $2a 
4383 : 48 __ __ PHA
4384 : a5 2b __ LDA $2b 
4386 : 48 __ __ PHA
4387 : a5 2c __ LDA $2c 
4389 : 48 __ __ PHA
438a : a5 2d __ LDA $2d 
438c : 48 __ __ PHA
438d : a5 2e __ LDA $2e 
438f : 48 __ __ PHA
4390 : a5 2f __ LDA $2f 
4392 : 48 __ __ PHA
4393 : a5 30 __ LDA $30 
4395 : 48 __ __ PHA
4396 : a5 31 __ LDA $31 
4398 : 48 __ __ PHA
4399 : a5 32 __ LDA $32 
439b : 48 __ __ PHA
439c : a5 33 __ LDA $33 
439e : 48 __ __ PHA
439f : a5 34 __ LDA $34 
43a1 : 48 __ __ PHA
43a2 : a5 35 __ LDA $35 
43a4 : 48 __ __ PHA
43a5 : a5 36 __ LDA $36 
43a7 : 48 __ __ PHA
43a8 : a5 37 __ LDA $37 
43aa : 48 __ __ PHA
43ab : a5 38 __ LDA $38 
43ad : 48 __ __ PHA
43ae : a5 39 __ LDA $39 
43b0 : 48 __ __ PHA
43b1 : a5 3a __ LDA $3a 
43b3 : 48 __ __ PHA
43b4 : a5 3b __ LDA $3b 
43b6 : 48 __ __ PHA
43b7 : a5 3c __ LDA $3c 
43b9 : 48 __ __ PHA
43ba : a5 3d __ LDA $3d 
43bc : 48 __ __ PHA
43bd : a5 3e __ LDA $3e 
43bf : 48 __ __ PHA
43c0 : a5 3f __ LDA $3f 
43c2 : 48 __ __ PHA
43c3 : a5 40 __ LDA $40 
43c5 : 48 __ __ PHA
43c6 : a5 41 __ LDA $41 
43c8 : 48 __ __ PHA
43c9 : a5 42 __ LDA $42 
43cb : 48 __ __ PHA
43cc : 20 65 44 JSR $4465 ; (modplay_tick.s1 + 0)
43cf : 68 __ __ PLA
43d0 : 85 42 __ STA $42 
43d2 : 68 __ __ PLA
43d3 : 85 41 __ STA $41 
43d5 : 68 __ __ PLA
43d6 : 85 40 __ STA $40 
43d8 : 68 __ __ PLA
43d9 : 85 3f __ STA $3f 
43db : 68 __ __ PLA
43dc : 85 3e __ STA $3e 
43de : 68 __ __ PLA
43df : 85 3d __ STA $3d 
43e1 : 68 __ __ PLA
43e2 : 85 3c __ STA $3c 
43e4 : 68 __ __ PLA
43e5 : 85 3b __ STA $3b 
43e7 : 68 __ __ PLA
43e8 : 85 3a __ STA $3a 
43ea : 68 __ __ PLA
43eb : 85 39 __ STA $39 
43ed : 68 __ __ PLA
43ee : 85 38 __ STA $38 
43f0 : 68 __ __ PLA
43f1 : 85 37 __ STA $37 
43f3 : 68 __ __ PLA
43f4 : 85 36 __ STA $36 
43f6 : 68 __ __ PLA
43f7 : 85 35 __ STA $35 
43f9 : 68 __ __ PLA
43fa : 85 34 __ STA $34 
43fc : 68 __ __ PLA
43fd : 85 33 __ STA $33 
43ff : 68 __ __ PLA
4400 : 85 32 __ STA $32 
4402 : 68 __ __ PLA
4403 : 85 31 __ STA $31 
4405 : 68 __ __ PLA
4406 : 85 30 __ STA $30 
4408 : 68 __ __ PLA
4409 : 85 2f __ STA $2f 
440b : 68 __ __ PLA
440c : 85 2e __ STA $2e 
440e : 68 __ __ PLA
440f : 85 2d __ STA $2d 
4411 : 68 __ __ PLA
4412 : 85 2c __ STA $2c 
4414 : 68 __ __ PLA
4415 : 85 2b __ STA $2b 
4417 : 68 __ __ PLA
4418 : 85 2a __ STA $2a 
441a : 68 __ __ PLA
441b : 85 29 __ STA $29 
441d : 68 __ __ PLA
441e : 85 28 __ STA $28 
4420 : 68 __ __ PLA
4421 : 85 27 __ STA $27 
4423 : 68 __ __ PLA
4424 : 85 26 __ STA FP + 1 
4426 : 68 __ __ PLA
4427 : 85 25 __ STA FP + 0 
4429 : 68 __ __ PLA
442a : 85 24 __ STA SP + 1 
442c : 68 __ __ PLA
442d : 85 23 __ STA SP + 0 
442f : 68 __ __ PLA
4430 : 85 22 __ STA ADDR + 3 
4432 : 68 __ __ PLA
4433 : 85 21 __ STA ADDR + 2 
4435 : 68 __ __ PLA
4436 : 85 20 __ STA ADDR + 1 
4438 : 68 __ __ PLA
4439 : 85 1f __ STA ADDR + 0 
443b : 68 __ __ PLA
443c : 85 1a __ STA IP + 1 
443e : 68 __ __ PLA
443f : 85 19 __ STA IP + 0 
4441 : 68 __ __ PLA
4442 : 85 18 __ STA P11 
4444 : 68 __ __ PLA
4445 : 85 17 __ STA P10 
4447 : 68 __ __ PLA
4448 : 85 16 __ STA P9 
444a : 68 __ __ PLA
444b : 85 15 __ STA P8 
444d : 68 __ __ PLA
444e : 85 14 __ STA P7 
4450 : 68 __ __ PLA
4451 : 85 0c __ STA $0c 
4453 : 68 __ __ PLA
4454 : 85 0b __ STA WORK + 8 
4456 : 68 __ __ PLA
4457 : 85 0a __ STA WORK + 7 
4459 : 68 __ __ PLA
445a : 85 09 __ STA WORK + 6 
445c : 68 __ __ PLA
445d : 85 08 __ STA WORK + 5 
445f : 68 __ __ PLA
4460 : 85 07 __ STA WORK + 4 
4462 : 4c 31 ea JMP $ea31 
--------------------------------------------------------------------
modplay_tick: ; modplay_tick()->void
; 285, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s1:
4465 : c6 24 __ DEC SP + 1 
4467 : a5 03 __ LDA WORK + 0 
4469 : 48 __ __ PHA
446a : a5 04 __ LDA WORK + 1 
446c : 48 __ __ PHA
446d : a5 05 __ LDA WORK + 2 
446f : 48 __ __ PHA
4470 : a5 06 __ LDA WORK + 3 
4472 : 48 __ __ PHA
4473 : a5 0d __ LDA P0 
4475 : 48 __ __ PHA
4476 : a5 0e __ LDA P1 
4478 : 48 __ __ PHA
4479 : a5 0f __ LDA P2 
447b : 48 __ __ PHA
447c : a5 10 __ LDA P3 
447e : 48 __ __ PHA
447f : a5 11 __ LDA P4 
4481 : 48 __ __ PHA
4482 : a5 12 __ LDA P5 
4484 : 48 __ __ PHA
4485 : a5 13 __ LDA P6 
4487 : 48 __ __ PHA
4488 : a5 1b __ LDA ACCU + 0 
448a : 48 __ __ PHA
448b : a5 1c __ LDA ACCU + 1 
448d : 48 __ __ PHA
448e : a5 1d __ LDA ACCU + 2 
4490 : 48 __ __ PHA
4491 : a5 1e __ LDA ACCU + 3 
4493 : 48 __ __ PHA
4494 : a5 43 __ LDA T0 + 0 
4496 : 48 __ __ PHA
4497 : a5 44 __ LDA T0 + 1 
4499 : 48 __ __ PHA
449a : a5 45 __ LDA T2 + 0 
449c : 48 __ __ PHA
449d : a5 46 __ LDA $46 
449f : 48 __ __ PHA
44a0 : a5 47 __ LDA $47 
44a2 : 48 __ __ PHA
44a3 : a5 48 __ LDA $48 
44a5 : 48 __ __ PHA
44a6 : a5 49 __ LDA $49 
44a8 : 48 __ __ PHA
44a9 : a5 4a __ LDA $4a 
44ab : 48 __ __ PHA
44ac : a5 4b __ LDA $4b 
44ae : 48 __ __ PHA
44af : a5 4c __ LDA $4c 
44b1 : 48 __ __ PHA
44b2 : a5 4d __ LDA $4d 
44b4 : 48 __ __ PHA
44b5 : a5 4e __ LDA $4e 
44b7 : 48 __ __ PHA
44b8 : a5 4f __ LDA $4f 
44ba : 48 __ __ PHA
44bb : a5 50 __ LDA $50 
44bd : 48 __ __ PHA
44be : a5 51 __ LDA $51 
44c0 : 48 __ __ PHA
.s4:
44c1 : ad 4c 9c LDA $9c4c ; (modplay.active + 0)
44c4 : d0 03 __ BNE $44c9 ; (modplay_tick.s5 + 0)
44c6 : 4c 5f 45 JMP $455f ; (modplay_tick.s3 + 0)
.s5:
44c9 : ad ff 15 LDA $15ff ; (mod_paused + 0)
44cc : d0 f8 __ BNE $44c6 ; (modplay_tick.s4 + 5)
.s6:
44ce : ad 46 9c LDA $9c46 ; (modplay.tick + 0)
44d1 : d0 19 __ BNE $44ec ; (modplay_tick.s25 + 0)
.s7:
44d3 : ad 48 9c LDA $9c48 ; (modplay.bpm + 0)
44d6 : 20 34 42 JSR $4234 ; (bpm_to_timer.s4 + 0)
44d9 : a5 1b __ LDA ACCU + 0 
44db : 8d 04 dc STA $dc04 
44de : a5 1c __ LDA ACCU + 1 
44e0 : 8d 05 dc STA $dc05 
44e3 : 20 ee 45 JSR $45ee ; (process_new_row.s1 + 0)
44e6 : ac 47 9c LDY $9c47 ; (modplay.ticks_per_row + 0)
44e9 : 4c 05 45 JMP $4505 ; (modplay_tick.s8 + 0)
.s25:
44ec : a9 00 __ LDA #$00
44ee : 85 0f __ STA P2 
44f0 : 20 80 4c JSR $4c80 ; (fx_tick.s4 + 0)
44f3 : e6 0f __ INC P2 
44f5 : 20 80 4c JSR $4c80 ; (fx_tick.s4 + 0)
44f8 : e6 0f __ INC P2 
44fa : 20 80 4c JSR $4c80 ; (fx_tick.s4 + 0)
44fd : e6 0f __ INC P2 
44ff : 20 80 4c JSR $4c80 ; (fx_tick.s4 + 0)
4502 : ac 46 9c LDY $9c46 ; (modplay.tick + 0)
.s8:
4505 : 88 __ __ DEY
4506 : 8c 46 9c STY $9c46 ; (modplay.tick + 0)
4509 : a9 00 __ LDA #$00
450b : 85 13 __ STA P6 
.l26:
450d : 20 fd 4e JSR $4efd ; (ua_update_channel.s1 + 0)
4510 : e6 13 __ INC P6 
4512 : a5 13 __ LDA P6 
4514 : c9 04 __ CMP #$04
4516 : 90 f5 __ BCC $450d ; (modplay_tick.l26 + 0)
.s9:
4518 : ad 46 9c LDA $9c46 ; (modplay.tick + 0)
451b : d0 42 __ BNE $455f ; (modplay_tick.s3 + 0)
.s10:
451d : ad 49 9c LDA $9c49 ; (modplay.pattern_delay + 0)
4520 : f0 05 __ BEQ $4527 ; (modplay_tick.s11 + 0)
.s24:
4522 : ce 49 9c DEC $9c49 ; (modplay.pattern_delay + 0)
4525 : b0 38 __ BCS $455f ; (modplay_tick.s3 + 0)
.s11:
4527 : ad 4e 9c LDA $9c4e ; (modplay.skip_row_advance + 0)
452a : f0 03 __ BEQ $452f ; (modplay_tick.s12 + 0)
452c : 4c bc 45 JMP $45bc ; (modplay_tick.s18 + 0)
.s12:
452f : ee 45 9c INC $9c45 ; (modplay.row + 0)
4532 : ad 45 9c LDA $9c45 ; (modplay.row + 0)
4535 : c9 40 __ CMP #$40
4537 : 90 26 __ BCC $455f ; (modplay_tick.s3 + 0)
.s13:
4539 : ee 43 9c INC $9c43 ; (modplay.order_pos + 0)
453c : a9 00 __ LDA #$00
453e : 8d 45 9c STA $9c45 ; (modplay.row + 0)
4541 : ad 43 9c LDA $9c43 ; (modplay.order_pos + 0)
4544 : cd c0 9b CMP $9bc0 ; (modplay.song_length + 0)
4547 : 90 0f __ BCC $4558 ; (modplay_tick.s14 + 0)
.s15:
4549 : ad 4d 9c LDA $9c4d ; (modplay.loop_song + 0)
454c : d0 05 __ BNE $4553 ; (modplay_tick.s17 + 0)
.s16:
454e : 8d 4c 9c STA $9c4c ; (modplay.active + 0)
4551 : b0 0c __ BCS $455f ; (modplay_tick.s3 + 0)
.s17:
4553 : a9 00 __ LDA #$00
4555 : 8d 43 9c STA $9c43 ; (modplay.order_pos + 0)
.s14:
4558 : aa __ __ TAX
4559 : bd c3 9b LDA $9bc3,x ; (modplay.order_table[0] + 0)
455c : 8d 44 9c STA $9c44 ; (modplay.pattern_num + 0)
.s3:
455f : 68 __ __ PLA
4560 : 85 51 __ STA $51 
4562 : 68 __ __ PLA
4563 : 85 50 __ STA $50 
4565 : 68 __ __ PLA
4566 : 85 4f __ STA $4f 
4568 : 68 __ __ PLA
4569 : 85 4e __ STA $4e 
456b : 68 __ __ PLA
456c : 85 4d __ STA $4d 
456e : 68 __ __ PLA
456f : 85 4c __ STA $4c 
4571 : 68 __ __ PLA
4572 : 85 4b __ STA $4b 
4574 : 68 __ __ PLA
4575 : 85 4a __ STA $4a 
4577 : 68 __ __ PLA
4578 : 85 49 __ STA $49 
457a : 68 __ __ PLA
457b : 85 48 __ STA $48 
457d : 68 __ __ PLA
457e : 85 47 __ STA $47 
4580 : 68 __ __ PLA
4581 : 85 46 __ STA $46 
4583 : 68 __ __ PLA
4584 : 85 45 __ STA T2 + 0 
4586 : 68 __ __ PLA
4587 : 85 44 __ STA T0 + 1 
4589 : 68 __ __ PLA
458a : 85 43 __ STA T0 + 0 
458c : 68 __ __ PLA
458d : 85 1e __ STA ACCU + 3 
458f : 68 __ __ PLA
4590 : 85 1d __ STA ACCU + 2 
4592 : 68 __ __ PLA
4593 : 85 1c __ STA ACCU + 1 
4595 : 68 __ __ PLA
4596 : 85 1b __ STA ACCU + 0 
4598 : 68 __ __ PLA
4599 : 85 13 __ STA P6 
459b : 68 __ __ PLA
459c : 85 12 __ STA P5 
459e : 68 __ __ PLA
459f : 85 11 __ STA P4 
45a1 : 68 __ __ PLA
45a2 : 85 10 __ STA P3 
45a4 : 68 __ __ PLA
45a5 : 85 0f __ STA P2 
45a7 : 68 __ __ PLA
45a8 : 85 0e __ STA P1 
45aa : 68 __ __ PLA
45ab : 85 0d __ STA P0 
45ad : 68 __ __ PLA
45ae : 85 06 __ STA WORK + 3 
45b0 : 68 __ __ PLA
45b1 : 85 05 __ STA WORK + 2 
45b3 : 68 __ __ PLA
45b4 : 85 04 __ STA WORK + 1 
45b6 : 68 __ __ PLA
45b7 : 85 03 __ STA WORK + 0 
45b9 : e6 24 __ INC SP + 1 
45bb : 60 __ __ RTS
.s18:
45bc : ad 4f 9c LDA $9c4f ; (modplay.next_order + 0)
45bf : c9 ff __ CMP #$ff
45c1 : f0 06 __ BEQ $45c9 ; (modplay_tick.s19 + 0)
.s23:
45c3 : 8d 43 9c STA $9c43 ; (modplay.order_pos + 0)
45c6 : 4c cc 45 JMP $45cc ; (modplay_tick.s27 + 0)
.s19:
45c9 : ad 43 9c LDA $9c43 ; (modplay.order_pos + 0)
.s27:
45cc : cd c0 9b CMP $9bc0 ; (modplay.song_length + 0)
45cf : 90 0d __ BCC $45de ; (modplay_tick.s20 + 0)
.s21:
45d1 : ad 4d 9c LDA $9c4d ; (modplay.loop_song + 0)
45d4 : d0 03 __ BNE $45d9 ; (modplay_tick.s22 + 0)
45d6 : 4c 4e 45 JMP $454e ; (modplay_tick.s16 + 0)
.s22:
45d9 : a9 00 __ LDA #$00
45db : 8d 43 9c STA $9c43 ; (modplay.order_pos + 0)
.s20:
45de : aa __ __ TAX
45df : bd c3 9b LDA $9bc3,x ; (modplay.order_table[0] + 0)
45e2 : 8d 44 9c STA $9c44 ; (modplay.pattern_num + 0)
45e5 : ad 50 9c LDA $9c50 ; (modplay.next_row + 0)
45e8 : 8d 45 9c STA $9c45 ; (modplay.row + 0)
45eb : 4c 5f 45 JMP $455f ; (modplay_tick.s3 + 0)
--------------------------------------------------------------------
process_new_row: ; process_new_row()->void
; 579, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s1:
45ee : 38 __ __ SEC
45ef : a5 23 __ LDA SP + 0 
45f1 : e9 0b __ SBC #$0b
45f3 : 85 23 __ STA SP + 0 
45f5 : b0 02 __ BCS $45f9 ; (process_new_row.s4 + 0)
45f7 : c6 24 __ DEC SP + 1 
.s4:
45f9 : a9 00 __ LDA #$00
45fb : 8d 4e 9c STA $9c4e ; (modplay.skip_row_advance + 0)
45fe : 8d 50 9c STA $9c50 ; (modplay.next_row + 0)
4601 : ad bc 9b LDA $9bbc ; (modplay.reu_base + 0)
4604 : 18 __ __ CLC
4605 : 69 3c __ ADC #$3c
4607 : 85 43 __ STA T0 + 0 
4609 : a9 ff __ LDA #$ff
460b : 8d 4f 9c STA $9c4f ; (modplay.next_order + 0)
460e : a9 ec __ LDA #$ec
4610 : 8d 02 df STA $df02 
4613 : a9 83 __ LDA #$83
4615 : 8d 03 df STA $df03 
4618 : ad bd 9b LDA $9bbd ; (modplay.reu_base + 1)
461b : 69 04 __ ADC #$04
461d : aa __ __ TAX
461e : ac be 9b LDY $9bbe ; (modplay.reu_base + 2)
4621 : 90 01 __ BCC $4624 ; (process_new_row.s9 + 0)
.s8:
4623 : c8 __ __ INY
.s9:
4624 : ad 44 9c LDA $9c44 ; (modplay.pattern_num + 0)
4627 : 0a __ __ ASL
4628 : 85 1c __ STA ACCU + 1 
462a : a9 00 __ LDA #$00
462c : 2a __ __ ROL
462d : 06 1c __ ASL ACCU + 1 
462f : 2a __ __ ROL
4630 : 85 1d __ STA ACCU + 2 
4632 : 8a __ __ TXA
4633 : 65 1c __ ADC ACCU + 1 
4635 : 85 44 __ STA T0 + 1 
4637 : 98 __ __ TYA
4638 : 65 1d __ ADC ACCU + 2 
463a : 85 45 __ STA T0 + 2 
463c : ad 45 9c LDA $9c45 ; (modplay.row + 0)
463f : 85 1b __ STA ACCU + 0 
4641 : a9 00 __ LDA #$00
4643 : 85 1c __ STA ACCU + 1 
4645 : 85 1d __ STA ACCU + 2 
4647 : a2 04 __ LDX #$04
.l5:
4649 : 06 1b __ ASL ACCU + 0 
464b : 26 1c __ ROL ACCU + 1 
464d : 26 1d __ ROL ACCU + 2 
464f : 2a __ __ ROL
4650 : ca __ __ DEX
4651 : d0 f6 __ BNE $4649 ; (process_new_row.l5 + 0)
.s6:
4653 : 18 __ __ CLC
4654 : a5 1b __ LDA ACCU + 0 
4656 : 65 43 __ ADC T0 + 0 
4658 : 8d 04 df STA $df04 
465b : a5 1c __ LDA ACCU + 1 
465d : 65 44 __ ADC T0 + 1 
465f : 8d 05 df STA $df05 
4662 : a5 1d __ LDA ACCU + 2 
4664 : 65 45 __ ADC T0 + 2 
4666 : 8d 06 df STA $df06 
4669 : a9 10 __ LDA #$10
466b : 8d 07 df STA $df07 
466e : 8e 08 df STX $df08 
4671 : 8e 0a df STX $df0a 
4674 : 86 4a __ STX T5 + 0 
4676 : 86 4b __ STX T7 + 0 
4678 : 86 10 __ STX P3 
467a : a9 91 __ LDA #$91
467c : 8d 01 df STA $df01 
467f : 18 __ __ CLC
4680 : a5 23 __ LDA SP + 0 
4682 : 69 06 __ ADC #$06
4684 : 85 11 __ STA P4 
4686 : a5 24 __ LDA SP + 1 
4688 : 69 00 __ ADC #$00
468a : 85 12 __ STA P5 
.l7:
468c : a6 4b __ LDX T7 + 0 
468e : bd ec 83 LDA $83ec,x ; (mod_row_buf[0] + 0)
4691 : 29 f0 __ AND #$f0
4693 : 85 48 __ STA T2 + 0 
4695 : bd ee 83 LDA $83ee,x ; (mod_row_buf[0] + 2)
4698 : 4a __ __ LSR
4699 : 4a __ __ LSR
469a : 4a __ __ LSR
469b : 4a __ __ LSR
469c : 05 48 __ ORA T2 + 0 
469e : a0 06 __ LDY #$06
46a0 : 91 23 __ STA (SP + 0),y 
46a2 : bd ed 83 LDA $83ed,x ; (mod_row_buf[0] + 1)
46a5 : c8 __ __ INY
46a6 : 91 23 __ STA (SP + 0),y 
46a8 : bd ec 83 LDA $83ec,x ; (mod_row_buf[0] + 0)
46ab : 29 0f __ AND #$0f
46ad : c8 __ __ INY
46ae : 91 23 __ STA (SP + 0),y 
46b0 : bd ee 83 LDA $83ee,x ; (mod_row_buf[0] + 2)
46b3 : 29 0f __ AND #$0f
46b5 : 85 49 __ STA T3 + 0 
46b7 : c8 __ __ INY
46b8 : 91 23 __ STA (SP + 0),y 
46ba : bd ef 83 LDA $83ef,x ; (mod_row_buf[0] + 3)
46bd : c8 __ __ INY
46be : 91 23 __ STA (SP + 0),y 
46c0 : a5 49 __ LDA T3 + 0 
46c2 : a4 4a __ LDY T5 + 0 
46c4 : 99 a5 9e STA $9ea5,y ; (modplay.channel[0].effect + 0)
46c7 : bd ef 83 LDA $83ef,x ; (mod_row_buf[0] + 3)
46ca : 99 a6 9e STA $9ea6,y ; (modplay.channel[0].eparam + 0)
46cd : 20 f9 46 JSR $46f9 ; (apply_note.s4 + 0)
46d0 : a5 10 __ LDA P3 
46d2 : 85 0f __ STA P2 
46d4 : 20 83 49 JSR $4983 ; (fx_row.s4 + 0)
46d7 : 18 __ __ CLC
46d8 : a5 4a __ LDA T5 + 0 
46da : 69 32 __ ADC #$32
46dc : 85 4a __ STA T5 + 0 
46de : 18 __ __ CLC
46df : a5 4b __ LDA T7 + 0 
46e1 : 69 04 __ ADC #$04
46e3 : 85 4b __ STA T7 + 0 
46e5 : e6 10 __ INC P3 
46e7 : a5 10 __ LDA P3 
46e9 : c9 04 __ CMP #$04
46eb : 90 9f __ BCC $468c ; (process_new_row.l7 + 0)
.s3:
46ed : 18 __ __ CLC
46ee : a5 23 __ LDA SP + 0 
46f0 : 69 0b __ ADC #$0b
46f2 : 85 23 __ STA SP + 0 
46f4 : 90 02 __ BCC $46f8 ; (process_new_row.s3 + 11)
46f6 : e6 24 __ INC SP + 1 
46f8 : 60 __ __ RTS
--------------------------------------------------------------------
apply_note: ; apply_note(u8,struct S#24044*)->void
; 194, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
46f9 : a5 10 __ LDA P3 ; (ch_idx + 0)
46fb : 0a __ __ ASL
46fc : 18 __ __ CLC
46fd : 65 10 __ ADC P3 ; (ch_idx + 0)
46ff : 0a __ __ ASL
4700 : 0a __ __ ASL
4701 : 0a __ __ ASL
4702 : 18 __ __ CLC
4703 : 65 10 __ ADC P3 ; (ch_idx + 0)
4705 : 0a __ __ ASL
4706 : 85 47 __ STA T3 + 0 
4708 : a0 00 __ LDY #$00
470a : b1 11 __ LDA (P4),y ; (n + 0)
470c : d0 03 __ BNE $4711 ; (apply_note.s14 + 0)
470e : 4c c1 47 JMP $47c1 ; (apply_note.s5 + 0)
.s14:
4711 : ad c1 9b LDA $9bc1 ; (modplay.num_samples + 0)
4714 : d1 11 __ CMP (P4),y ; (n + 0)
4716 : 90 f6 __ BCC $470e ; (apply_note.s4 + 21)
.s15:
4718 : 84 1c __ STY ACCU + 1 
471a : b1 11 __ LDA (P4),y ; (n + 0)
471c : a6 47 __ LDX T3 + 0 
471e : 9d 9e 9e STA $9e9e,x ; (modplay.channel[0].sample_num + 0)
4721 : 85 1b __ STA ACCU + 0 
4723 : a9 13 __ LDA #$13
4725 : 20 9e 77 JSR $779e ; (mul16by8 + 0)
4728 : 18 __ __ CLC
4729 : a9 3e __ LDA #$3e
472b : 65 1b __ ADC ACCU + 0 
472d : 85 1b __ STA ACCU + 0 
472f : a9 9c __ LDA #$9c
4731 : 65 1c __ ADC ACCU + 1 
4733 : 85 1c __ STA ACCU + 1 
4735 : a0 11 __ LDY #$11
4737 : b1 1b __ LDA (ACCU + 0),y 
4739 : a6 47 __ LDX T3 + 0 
473b : 9d a3 9e STA $9ea3,x ; (modplay.channel[0].volume + 0)
473e : 88 __ __ DEY
473f : b1 1b __ LDA (ACCU + 0),y 
4741 : 9d bf 9e STA $9ebf,x ; (modplay.channel[0].needs_loop + 0)
4744 : a0 01 __ LDY #$01
4746 : b1 1b __ LDA (ACCU + 0),y 
4748 : 85 44 __ STA T0 + 1 
474a : 9d c1 9e STA $9ec1,x ; (modplay.channel[0].smp_start + 1)
474d : c8 __ __ INY
474e : b1 1b __ LDA (ACCU + 0),y 
4750 : 85 45 __ STA T0 + 2 
4752 : 9d c2 9e STA $9ec2,x ; (modplay.channel[0].smp_start + 2)
4755 : c8 __ __ INY
4756 : b1 1b __ LDA (ACCU + 0),y 
4758 : 85 46 __ STA T0 + 3 
475a : 9d c3 9e STA $9ec3,x ; (modplay.channel[0].smp_start + 3)
475d : a0 00 __ LDY #$00
475f : b1 1b __ LDA (ACCU + 0),y 
4761 : 85 43 __ STA T0 + 0 
4763 : 9d c0 9e STA $9ec0,x ; (modplay.channel[0].smp_start + 0)
4766 : a0 04 __ LDY #$04
4768 : b1 1b __ LDA (ACCU + 0),y 
476a : 9d c4 9e STA $9ec4,x ; (modplay.channel[0].smp_length + 0)
476d : c8 __ __ INY
476e : b1 1b __ LDA (ACCU + 0),y 
4770 : 9d c5 9e STA $9ec5,x ; (modplay.channel[0].smp_length + 1)
4773 : c8 __ __ INY
4774 : b1 1b __ LDA (ACCU + 0),y 
4776 : 9d c6 9e STA $9ec6,x ; (modplay.channel[0].smp_length + 2)
4779 : c8 __ __ INY
477a : b1 1b __ LDA (ACCU + 0),y 
477c : 9d c7 9e STA $9ec7,x ; (modplay.channel[0].smp_length + 3)
477f : 18 __ __ CLC
4780 : c8 __ __ INY
4781 : b1 1b __ LDA (ACCU + 0),y 
4783 : 65 43 __ ADC T0 + 0 
4785 : 9d c8 9e STA $9ec8,x ; (modplay.channel[0].smp_loop_a + 0)
4788 : c8 __ __ INY
4789 : b1 1b __ LDA (ACCU + 0),y 
478b : 65 44 __ ADC T0 + 1 
478d : 9d c9 9e STA $9ec9,x ; (modplay.channel[0].smp_loop_a + 1)
4790 : c8 __ __ INY
4791 : b1 1b __ LDA (ACCU + 0),y 
4793 : 65 45 __ ADC T0 + 2 
4795 : 9d ca 9e STA $9eca,x ; (modplay.channel[0].smp_loop_a + 2)
4798 : c8 __ __ INY
4799 : b1 1b __ LDA (ACCU + 0),y 
479b : 65 46 __ ADC T0 + 3 
479d : 9d cb 9e STA $9ecb,x ; (modplay.channel[0].smp_loop_a + 3)
47a0 : 18 __ __ CLC
47a1 : c8 __ __ INY
47a2 : b1 1b __ LDA (ACCU + 0),y 
47a4 : 65 43 __ ADC T0 + 0 
47a6 : 9d cc 9e STA $9ecc,x ; (modplay.channel[0].smp_loop_b + 0)
47a9 : c8 __ __ INY
47aa : b1 1b __ LDA (ACCU + 0),y 
47ac : 65 44 __ ADC T0 + 1 
47ae : 9d cd 9e STA $9ecd,x ; (modplay.channel[0].smp_loop_b + 1)
47b1 : c8 __ __ INY
47b2 : b1 1b __ LDA (ACCU + 0),y 
47b4 : 65 45 __ ADC T0 + 2 
47b6 : 9d ce 9e STA $9ece,x ; (modplay.channel[0].smp_loop_b + 2)
47b9 : c8 __ __ INY
47ba : b1 1b __ LDA (ACCU + 0),y 
47bc : 65 46 __ ADC T0 + 3 
47be : 9d cf 9e STA $9ecf,x ; (modplay.channel[0].smp_loop_b + 3)
.s5:
47c1 : a0 01 __ LDY #$01
47c3 : b1 11 __ LDA (P4),y ; (n + 0)
47c5 : 85 0d __ STA P0 
47c7 : c8 __ __ INY
47c8 : b1 11 __ LDA (P4),y ; (n + 0)
47ca : 85 0e __ STA P1 
47cc : c8 __ __ INY
47cd : 05 0d __ ORA P0 
47cf : f0 6f __ BEQ $4840 ; (apply_note.s6 + 0)
.s10:
47d1 : b1 11 __ LDA (P4),y ; (n + 0)
47d3 : c9 03 __ CMP #$03
47d5 : f0 69 __ BEQ $4840 ; (apply_note.s6 + 0)
.s11:
47d7 : a6 47 __ LDX T3 + 0 
47d9 : bd 9e 9e LDA $9e9e,x ; (modplay.channel[0].sample_num + 0)
47dc : f0 1a __ BEQ $47f8 ; (apply_note.s18 + 0)
.s13:
47de : 85 1b __ STA ACCU + 0 
47e0 : a9 00 __ LDA #$00
47e2 : 85 1c __ STA ACCU + 1 
47e4 : a9 13 __ LDA #$13
47e6 : 20 9e 77 JSR $779e ; (mul16by8 + 0)
47e9 : a9 50 __ LDA #$50
47eb : 85 43 __ STA T0 + 0 
47ed : 18 __ __ CLC
47ee : a9 9c __ LDA #$9c
47f0 : 65 1c __ ADC ACCU + 1 
47f2 : 85 44 __ STA T0 + 1 
47f4 : a4 1b __ LDY ACCU + 0 
47f6 : b1 43 __ LDA (T0 + 0),y 
.s18:
47f8 : 85 0f __ STA P2 
47fa : 20 8b 48 JSR $488b ; (period_finetune.s4 + 0)
47fd : a5 1b __ LDA ACCU + 0 
47ff : 85 0d __ STA P0 
4801 : a6 47 __ LDX T3 + 0 
4803 : 9d 9f 9e STA $9e9f,x ; (modplay.channel[0].period + 0)
4806 : a5 1c __ LDA ACCU + 1 
4808 : 85 0e __ STA P1 
480a : 9d a0 9e STA $9ea0,x ; (modplay.channel[0].period + 1)
480d : 20 3a 49 JSR $493a ; (period_to_rate.s4 + 0)
4810 : a5 1b __ LDA ACCU + 0 
4812 : a6 47 __ LDX T3 + 0 
4814 : 9d a1 9e STA $9ea1,x ; (modplay.channel[0].rate + 0)
4817 : a5 1c __ LDA ACCU + 1 
4819 : 9d a2 9e STA $9ea2,x ; (modplay.channel[0].rate + 1)
481c : a0 00 __ LDY #$00
481e : b1 11 __ LDA (P4),y ; (n + 0)
4820 : 9d b5 9e STA $9eb5,x ; (modplay.channel[0].last_note + 0)
4823 : a0 03 __ LDY #$03
4825 : b1 11 __ LDA (P4),y ; (n + 0)
4827 : c9 03 __ CMP #$03
4829 : f0 15 __ BEQ $4840 ; (apply_note.s6 + 0)
.s12:
482b : a8 __ __ TAY
482c : a9 00 __ LDA #$00
482e : 9d ab 9e STA $9eab,x ; (modplay.channel[0].vib_pos + 0)
4831 : 9d af 9e STA $9eaf,x ; (modplay.channel[0].trm_pos + 0)
4834 : 9d b4 9e STA $9eb4,x ; (modplay.channel[0].arp_counter + 0)
4837 : a9 01 __ LDA #$01
4839 : 9d be 9e STA $9ebe,x ; (modplay.channel[0].needs_start + 0)
483c : 98 __ __ TYA
483d : 4c 42 48 JMP $4842 ; (apply_note.s16 + 0)
.s6:
4840 : b1 11 __ LDA (P4),y ; (n + 0)
.s16:
4842 : c9 03 __ CMP #$03
4844 : d0 44 __ BNE $488a ; (apply_note.s3 + 0)
.s7:
4846 : a0 01 __ LDY #$01
4848 : b1 11 __ LDA (P4),y ; (n + 0)
484a : 85 0d __ STA P0 
484c : c8 __ __ INY
484d : 11 11 __ ORA (P4),y ; (n + 0)
484f : f0 39 __ BEQ $488a ; (apply_note.s3 + 0)
.s8:
4851 : b1 11 __ LDA (P4),y ; (n + 0)
4853 : 85 0e __ STA P1 
4855 : a6 47 __ LDX T3 + 0 
4857 : bd 9e 9e LDA $9e9e,x ; (modplay.channel[0].sample_num + 0)
485a : f0 1a __ BEQ $4876 ; (apply_note.s17 + 0)
.s9:
485c : 85 1b __ STA ACCU + 0 
485e : a9 00 __ LDA #$00
4860 : 85 1c __ STA ACCU + 1 
4862 : a9 13 __ LDA #$13
4864 : 20 9e 77 JSR $779e ; (mul16by8 + 0)
4867 : a9 50 __ LDA #$50
4869 : 85 43 __ STA T0 + 0 
486b : 18 __ __ CLC
486c : a9 9c __ LDA #$9c
486e : 65 1c __ ADC ACCU + 1 
4870 : 85 44 __ STA T0 + 1 
4872 : a4 1b __ LDY ACCU + 0 
4874 : b1 43 __ LDA (T0 + 0),y 
.s17:
4876 : 85 0f __ STA P2 
4878 : 20 8b 48 JSR $488b ; (period_finetune.s4 + 0)
487b : 20 32 49 JSR $4932 ; (period_to_rate@proxy + 0)
487e : a5 1b __ LDA ACCU + 0 
4880 : a6 47 __ LDX T3 + 0 
4882 : 9d a7 9e STA $9ea7,x ; (modplay.channel[0].porta_target + 0)
4885 : a5 1c __ LDA ACCU + 1 
4887 : 9d a8 9e STA $9ea8,x ; (modplay.channel[0].porta_target + 1)
.s3:
488a : 60 __ __ RTS
--------------------------------------------------------------------
period_finetune: ; period_finetune(u16,u8)->u16
;  59, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
488b : a5 0f __ LDA P2 ; (finetune_raw + 0)
488d : c9 08 __ CMP #$08
488f : b0 03 __ BCS $4894 ; (period_finetune.s14 + 0)
4891 : 4c 29 49 JMP $4929 ; (period_finetune.s5 + 0)
.s14:
4894 : e9 10 __ SBC #$10
4896 : 85 0f __ STA P2 ; (finetune_raw + 0)
4898 : f0 06 __ BEQ $48a0 ; (period_finetune.s6 + 0)
.s7:
489a : a5 0e __ LDA P1 ; (period + 1)
489c : 05 0d __ ORA P0 ; (period + 0)
489e : d0 09 __ BNE $48a9 ; (period_finetune.s8 + 0)
.s6:
48a0 : a5 0d __ LDA P0 ; (period + 0)
48a2 : 85 1b __ STA ACCU + 0 
48a4 : a5 0e __ LDA P1 ; (period + 1)
48a6 : 4c 26 49 JMP $4926 ; (period_finetune.s3 + 0)
.s8:
48a9 : a5 0f __ LDA P2 ; (finetune_raw + 0)
48ab : 10 05 __ BPL $48b2 ; (period_finetune.s9 + 0)
.s13:
48ad : 38 __ __ SEC
48ae : a9 00 __ LDA #$00
48b0 : e5 0f __ SBC P2 ; (finetune_raw + 0)
.s9:
48b2 : a6 0d __ LDX P0 ; (period + 0)
48b4 : 86 1b __ STX ACCU + 0 
48b6 : a6 0e __ LDX P1 ; (period + 1)
48b8 : 86 1c __ STX ACCU + 1 
48ba : a2 00 __ LDX #$00
48bc : 86 1d __ STX ACCU + 2 
48be : 86 1e __ STX ACCU + 3 
48c0 : 20 d6 77 JSR $77d6 ; (mul32by8 + 0)
48c3 : a5 07 __ LDA WORK + 4 
48c5 : 85 1b __ STA ACCU + 0 
48c7 : a5 08 __ LDA WORK + 5 
48c9 : 85 1c __ STA ACCU + 1 
48cb : a5 09 __ LDA WORK + 6 
48cd : 85 1d __ STA ACCU + 2 
48cf : a5 0a __ LDA WORK + 7 
48d1 : 85 1e __ STA ACCU + 3 
48d3 : a9 00 __ LDA #$00
48d5 : 85 05 __ STA WORK + 2 
48d7 : 85 06 __ STA WORK + 3 
48d9 : a9 e9 __ LDA #$e9
48db : 85 03 __ STA WORK + 0 
48dd : a9 02 __ LDA #$02
48df : 85 04 __ STA WORK + 1 
48e1 : 20 12 79 JSR $7912 ; (mul32 + 0)
48e4 : a5 07 __ LDA WORK + 4 
48e6 : 85 1b __ STA ACCU + 0 
48e8 : a5 08 __ LDA WORK + 5 
48ea : 85 1c __ STA ACCU + 1 
48ec : a5 09 __ LDA WORK + 6 
48ee : 85 1d __ STA ACCU + 2 
48f0 : a5 0a __ LDA WORK + 7 
48f2 : 85 1e __ STA ACCU + 3 
48f4 : a9 a0 __ LDA #$a0
48f6 : 85 03 __ STA WORK + 0 
48f8 : a9 00 __ LDA #$00
48fa : 85 06 __ STA WORK + 3 
48fc : a9 86 __ LDA #$86
48fe : 85 04 __ STA WORK + 1 
4900 : a9 01 __ LDA #$01
4902 : 85 05 __ STA WORK + 2 
4904 : 20 7a 79 JSR $797a ; (divs32 + 0)
4907 : a5 0f __ LDA P2 ; (finetune_raw + 0)
4909 : 30 02 __ BMI $490d ; (period_finetune.s10 + 0)
.s12:
490b : d0 0e __ BNE $491b ; (period_finetune.s11 + 0)
.s10:
490d : 18 __ __ CLC
490e : a5 0d __ LDA P0 ; (period + 0)
4910 : 65 1b __ ADC ACCU + 0 
4912 : 85 1b __ STA ACCU + 0 
4914 : a5 0e __ LDA P1 ; (period + 1)
4916 : 65 1c __ ADC ACCU + 1 
4918 : 4c 26 49 JMP $4926 ; (period_finetune.s3 + 0)
.s11:
491b : 38 __ __ SEC
491c : a5 0d __ LDA P0 ; (period + 0)
491e : e5 1b __ SBC ACCU + 0 
4920 : 85 1b __ STA ACCU + 0 
4922 : a5 0e __ LDA P1 ; (period + 1)
4924 : e5 1c __ SBC ACCU + 1 
.s3:
4926 : 85 1c __ STA ACCU + 1 
4928 : 60 __ __ RTS
.s5:
4929 : aa __ __ TAX
492a : d0 03 __ BNE $492f ; (period_finetune.s5 + 6)
492c : 4c a0 48 JMP $48a0 ; (period_finetune.s6 + 0)
492f : 4c 9a 48 JMP $489a ; (period_finetune.s7 + 0)
--------------------------------------------------------------------
period_to_rate@proxy: ; period_to_rate@proxy
4932 : a5 1b __ LDA ACCU + 0 
4934 : 85 0d __ STA P0 
4936 : a5 1c __ LDA ACCU + 1 
4938 : 85 0e __ STA P1 
--------------------------------------------------------------------
period_to_rate: ; period_to_rate(u16)->u16
;  41, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
493a : a5 0e __ LDA P1 ; (period + 1)
493c : 05 0d __ ORA P0 ; (period + 0)
493e : f0 3e __ BEQ $497e ; (period_to_rate.s6 + 0)
.s5:
4940 : a5 0d __ LDA P0 ; (period + 0)
4942 : 85 1b __ STA ACCU + 0 
4944 : a5 0e __ LDA P1 ; (period + 1)
4946 : 85 1c __ STA ACCU + 1 
4948 : a9 00 __ LDA #$00
494a : 85 1d __ STA ACCU + 2 
494c : 85 1e __ STA ACCU + 3 
494e : 85 05 __ STA WORK + 2 
4950 : 85 06 __ STA WORK + 3 
4952 : a9 d4 __ LDA #$d4
4954 : 85 03 __ STA WORK + 0 
4956 : a9 30 __ LDA #$30
4958 : 85 04 __ STA WORK + 1 
495a : 20 12 79 JSR $7912 ; (mul32 + 0)
495d : a5 07 __ LDA WORK + 4 
495f : 85 1b __ STA ACCU + 0 
4961 : a5 08 __ LDA WORK + 5 
4963 : 85 1c __ STA ACCU + 1 
4965 : a5 09 __ LDA WORK + 6 
4967 : 85 1d __ STA ACCU + 2 
4969 : a5 0a __ LDA WORK + 7 
496b : 85 1e __ STA ACCU + 3 
496d : a9 00 __ LDA #$00
496f : 85 05 __ STA WORK + 2 
4971 : 85 06 __ STA WORK + 3 
4973 : a9 b6 __ LDA #$b6
4975 : 85 03 __ STA WORK + 0 
4977 : a9 1b __ LDA #$1b
4979 : 85 04 __ STA WORK + 1 
497b : 4c 58 42 JMP $4258 ; (divmod32 + 0)
.s6:
497e : 85 1b __ STA ACCU + 0 
4980 : 85 1c __ STA ACCU + 1 
.s3:
4982 : 60 __ __ RTS
--------------------------------------------------------------------
fx_row: ; fx_row(u8)->void
; 242, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4983 : a4 0f __ LDY P2 ; (ch_idx + 0)
4985 : be cd 7b LDX $7bcd,y ; (__multab50L + 0)
4988 : bd a6 9e LDA $9ea6,x ; (modplay.channel[0].eparam + 0)
498b : 85 1c __ STA ACCU + 1 
498d : 4a __ __ LSR
498e : 4a __ __ LSR
498f : 4a __ __ LSR
4990 : 4a __ __ LSR
4991 : 85 1b __ STA ACCU + 0 
4993 : bd a5 9e LDA $9ea5,x ; (modplay.channel[0].effect + 0)
4996 : c9 08 __ CMP #$08
4998 : d0 09 __ BNE $49a3 ; (fx_row.s5 + 0)
.s93:
499a : a4 1b __ LDY ACCU + 0 
499c : b9 2a 7c LDA $7c2a,y ; (__multab17L + 0)
499f : 9d a4 9e STA $9ea4,x ; (modplay.channel[0].pan + 0)
.s3:
49a2 : 60 __ __ RTS
.s5:
49a3 : a5 1c __ LDA ACCU + 1 
49a5 : 29 0f __ AND #$0f
49a7 : 85 43 __ STA T0 + 0 
49a9 : bd a5 9e LDA $9ea5,x ; (modplay.channel[0].effect + 0)
49ac : c9 08 __ CMP #$08
49ae : b0 03 __ BCS $49b3 ; (fx_row.s6 + 0)
49b0 : 4c ea 4b JMP $4bea ; (fx_row.s74 + 0)
.s6:
49b3 : c9 0c __ CMP #$0c
49b5 : d0 03 __ BNE $49ba ; (fx_row.s7 + 0)
49b7 : 4c dc 4b JMP $4bdc ; (fx_row.s73 + 0)
.s7:
49ba : b0 03 __ BCS $49bf ; (fx_row.s8 + 0)
49bc : 4c 5f 4b JMP $4b5f ; (fx_row.s57 + 0)
.s8:
49bf : c9 0e __ CMP #$0e
49c1 : f0 33 __ BEQ $49f6 ; (fx_row.s16 + 0)
.s9:
49c3 : 90 14 __ BCC $49d9 ; (fx_row.s15 + 0)
.s10:
49c5 : c9 0f __ CMP #$0f
49c7 : d0 d9 __ BNE $49a2 ; (fx_row.s3 + 0)
.s11:
49c9 : a5 1c __ LDA ACCU + 1 
49cb : f0 d5 __ BEQ $49a2 ; (fx_row.s3 + 0)
.s12:
49cd : c9 20 __ CMP #$20
49cf : b0 04 __ BCS $49d5 ; (fx_row.s13 + 0)
.s14:
49d1 : 8d 47 9c STA $9c47 ; (modplay.ticks_per_row + 0)
49d4 : 60 __ __ RTS
.s13:
49d5 : 8d 48 9c STA $9c48 ; (modplay.bpm + 0)
49d8 : 60 __ __ RTS
.s15:
49d9 : ae 43 9c LDX $9c43 ; (modplay.order_pos + 0)
49dc : e8 __ __ INX
49dd : 8e 4f 9c STX $9c4f ; (modplay.next_order + 0)
49e0 : a9 01 __ LDA #$01
49e2 : 8d 4e 9c STA $9c4e ; (modplay.skip_row_advance + 0)
49e5 : a6 1b __ LDX ACCU + 0 
49e7 : bd 1a 7c LDA $7c1a,x ; (__multab10L + 0)
49ea : 65 43 __ ADC T0 + 0 
49ec : c9 40 __ CMP #$40
49ee : 90 02 __ BCC $49f2 ; (fx_row.s96 + 0)
.s97:
49f0 : a9 00 __ LDA #$00
.s96:
49f2 : 8d 50 9c STA $9c50 ; (modplay.next_row + 0)
49f5 : 60 __ __ RTS
.s16:
49f6 : a5 1b __ LDA ACCU + 0 
49f8 : c9 07 __ CMP #$07
49fa : d0 08 __ BNE $4a04 ; (fx_row.s17 + 0)
.s56:
49fc : a5 43 __ LDA T0 + 0 
49fe : 29 07 __ AND #$07
4a00 : 9d ae 9e STA $9eae,x ; (modplay.channel[0].trm_wave + 0)
4a03 : 60 __ __ RTS
.s17:
4a04 : 86 46 __ STX T3 + 0 
4a06 : c9 07 __ CMP #$07
4a08 : 90 6d __ BCC $4a77 ; (fx_row.s34 + 0)
.s18:
4a0a : c9 0c __ CMP #$0c
4a0c : d0 0b __ BNE $4a19 ; (fx_row.s19 + 0)
.s33:
4a0e : a5 43 __ LDA T0 + 0 
4a10 : 9d b8 9e STA $9eb8,x ; (modplay.channel[0].tick_stop + 0)
4a13 : a9 00 __ LDA #$00
4a15 : 9d b9 9e STA $9eb9,x ; (modplay.channel[0].tick_cur + 0)
4a18 : 60 __ __ RTS
.s19:
4a19 : 90 25 __ BCC $4a40 ; (fx_row.s25 + 0)
.s20:
4a1b : c9 0d __ CMP #$0d
4a1d : f0 0b __ BEQ $4a2a ; (fx_row.s23 + 0)
.s21:
4a1f : c9 0e __ CMP #$0e
4a21 : f0 01 __ BEQ $4a24 ; (fx_row.s22 + 0)
4a23 : 60 __ __ RTS
.s22:
4a24 : a5 43 __ LDA T0 + 0 
4a26 : 8d 49 9c STA $9c49 ; (modplay.pattern_delay + 0)
4a29 : 60 __ __ RTS
.s23:
4a2a : a5 43 __ LDA T0 + 0 
4a2c : 9d b8 9e STA $9eb8,x ; (modplay.channel[0].tick_stop + 0)
4a2f : a9 00 __ LDA #$00
4a31 : 9d b9 9e STA $9eb9,x ; (modplay.channel[0].tick_cur + 0)
4a34 : bd be 9e LDA $9ebe,x ; (modplay.channel[0].needs_start + 0)
4a37 : 9d ba 9e STA $9eba,x ; (modplay.channel[0].cmd_backup + 0)
.s24:
4a3a : a9 00 __ LDA #$00
4a3c : 9d be 9e STA $9ebe,x ; (modplay.channel[0].needs_start + 0)
4a3f : 60 __ __ RTS
.s25:
4a40 : c9 0a __ CMP #$0a
4a42 : d0 0f __ BNE $4a53 ; (fx_row.s26 + 0)
.s32:
4a44 : bd a3 9e LDA $9ea3,x ; (modplay.channel[0].volume + 0)
4a47 : 18 __ __ CLC
4a48 : 65 43 __ ADC T0 + 0 
.s28:
4a4a : 20 6f 4c JSR $4c6f ; (clamp_vol.s4 + 0)
4a4d : a6 46 __ LDX T3 + 0 
.s95:
4a4f : 9d a3 9e STA $9ea3,x ; (modplay.channel[0].volume + 0)
4a52 : 60 __ __ RTS
.s26:
4a53 : b0 1a __ BCS $4a6f ; (fx_row.s27 + 0)
.s30:
4a55 : c9 09 __ CMP #$09
4a57 : f0 01 __ BEQ $4a5a ; (fx_row.s31 + 0)
4a59 : 60 __ __ RTS
.s31:
4a5a : a5 43 __ LDA T0 + 0 
4a5c : 9d b8 9e STA $9eb8,x ; (modplay.channel[0].tick_stop + 0)
4a5f : a9 00 __ LDA #$00
4a61 : 9d b9 9e STA $9eb9,x ; (modplay.channel[0].tick_cur + 0)
4a64 : bd be 9e LDA $9ebe,x ; (modplay.channel[0].needs_start + 0)
4a67 : 9d ba 9e STA $9eba,x ; (modplay.channel[0].cmd_backup + 0)
4a6a : a5 43 __ LDA T0 + 0 
4a6c : d0 cc __ BNE $4a3a ; (fx_row.s24 + 0)
4a6e : 60 __ __ RTS
.s27:
4a6f : bd a3 9e LDA $9ea3,x ; (modplay.channel[0].volume + 0)
4a72 : e5 43 __ SBC T0 + 0 
4a74 : 4c 4a 4a JMP $4a4a ; (fx_row.s28 + 0)
.s34:
4a77 : c9 04 __ CMP #$04
4a79 : d0 08 __ BNE $4a83 ; (fx_row.s35 + 0)
.s55:
4a7b : a5 43 __ LDA T0 + 0 
4a7d : 29 07 __ AND #$07
4a7f : 9d aa 9e STA $9eaa,x ; (modplay.channel[0].vib_wave + 0)
4a82 : 60 __ __ RTS
.s35:
4a83 : 90 65 __ BCC $4aea ; (fx_row.s46 + 0)
.s36:
4a85 : c9 05 __ CMP #$05
4a87 : d0 2f __ BNE $4ab8 ; (fx_row.s37 + 0)
.s43:
4a89 : bd 9e 9e LDA $9e9e,x ; (modplay.channel[0].sample_num + 0)
4a8c : d0 01 __ BNE $4a8f ; (fx_row.s44 + 0)
4a8e : 60 __ __ RTS
.s44:
4a8f : ad c1 9b LDA $9bc1 ; (modplay.num_samples + 0)
4a92 : dd 9e 9e CMP $9e9e,x ; (modplay.channel[0].sample_num + 0)
4a95 : b0 01 __ BCS $4a98 ; (fx_row.s45 + 0)
4a97 : 60 __ __ RTS
.s45:
4a98 : bd 9e 9e LDA $9e9e,x ; (modplay.channel[0].sample_num + 0)
4a9b : 85 1b __ STA ACCU + 0 
4a9d : a9 00 __ LDA #$00
4a9f : 85 1c __ STA ACCU + 1 
4aa1 : a9 13 __ LDA #$13
4aa3 : 20 9e 77 JSR $779e ; (mul16by8 + 0)
4aa6 : a9 50 __ LDA #$50
4aa8 : 85 44 __ STA T1 + 0 
4aaa : 18 __ __ CLC
4aab : a9 9c __ LDA #$9c
4aad : 65 1c __ ADC ACCU + 1 
4aaf : 85 45 __ STA T1 + 1 
4ab1 : a5 43 __ LDA T0 + 0 
4ab3 : a4 1b __ LDY ACCU + 0 
4ab5 : 91 44 __ STA (T1 + 0),y 
4ab7 : 60 __ __ RTS
.s37:
4ab8 : a5 43 __ LDA T0 + 0 
4aba : d0 07 __ BNE $4ac3 ; (fx_row.s39 + 0)
.s38:
4abc : ad 45 9c LDA $9c45 ; (modplay.row + 0)
4abf : 9d b6 9e STA $9eb6,x ; (modplay.channel[0].loop_row + 0)
4ac2 : 60 __ __ RTS
.s39:
4ac3 : bd b7 9e LDA $9eb7,x ; (modplay.channel[0].loop_count + 0)
4ac6 : f0 1a __ BEQ $4ae2 ; (fx_row.s40 + 0)
.s42:
4ac8 : 38 __ __ SEC
4ac9 : e9 01 __ SBC #$01
4acb : 9d b7 9e STA $9eb7,x ; (modplay.channel[0].loop_count + 0)
4ace : d0 01 __ BNE $4ad1 ; (fx_row.s41 + 0)
4ad0 : 60 __ __ RTS
.s41:
4ad1 : a9 01 __ LDA #$01
4ad3 : 8d 4e 9c STA $9c4e ; (modplay.skip_row_advance + 0)
4ad6 : ad 43 9c LDA $9c43 ; (modplay.order_pos + 0)
4ad9 : 8d 4f 9c STA $9c4f ; (modplay.next_order + 0)
4adc : bd b6 9e LDA $9eb6,x ; (modplay.channel[0].loop_row + 0)
4adf : 4c f2 49 JMP $49f2 ; (fx_row.s96 + 0)
.s40:
4ae2 : a5 43 __ LDA T0 + 0 
4ae4 : 9d b7 9e STA $9eb7,x ; (modplay.channel[0].loop_count + 0)
4ae7 : 4c d1 4a JMP $4ad1 ; (fx_row.s41 + 0)
.s46:
4aea : c9 02 __ CMP #$02
4aec : f0 4e __ BEQ $4b3c ; (fx_row.s54 + 0)
.s47:
4aee : 90 01 __ BCC $4af1 ; (fx_row.s48 + 0)
4af0 : 60 __ __ RTS
.s48:
4af1 : c9 01 __ CMP #$01
4af3 : f0 01 __ BEQ $4af6 ; (fx_row.s49 + 0)
4af5 : 60 __ __ RTS
.s49:
4af6 : bd a0 9e LDA $9ea0,x ; (modplay.channel[0].period + 1)
4af9 : d0 09 __ BNE $4b04 ; (fx_row.s52 + 0)
.s53:
4afb : a9 71 __ LDA #$71
4afd : dd 9f 9e CMP $9e9f,x ; (modplay.channel[0].period + 0)
4b00 : a4 46 __ LDY T3 + 0 
4b02 : b0 1e __ BCS $4b22 ; (fx_row.s50 + 0)
.s52:
4b04 : bd 9f 9e LDA $9e9f,x ; (modplay.channel[0].period + 0)
4b07 : 38 __ __ SEC
4b08 : e5 43 __ SBC T0 + 0 
4b0a : 85 0d __ STA P0 
4b0c : bd a0 9e LDA $9ea0,x ; (modplay.channel[0].period + 1)
4b0f : e9 00 __ SBC #$00
4b11 : 85 0e __ STA P1 
4b13 : 20 3f 4c JSR $4c3f ; (clamp_period.s4 + 0)
4b16 : a5 1b __ LDA ACCU + 0 
4b18 : a4 46 __ LDY T3 + 0 
4b1a : 99 9f 9e STA $9e9f,y ; (modplay.channel[0].period + 0)
4b1d : a5 1c __ LDA ACCU + 1 
4b1f : 99 a0 9e STA $9ea0,y ; (modplay.channel[0].period + 1)
.s50:
4b22 : b9 9f 9e LDA $9e9f,y ; (modplay.channel[0].period + 0)
4b25 : 85 0d __ STA P0 
4b27 : b9 a0 9e LDA $9ea0,y ; (modplay.channel[0].period + 1)
.s51:
4b2a : 85 0e __ STA P1 
4b2c : 20 3a 49 JSR $493a ; (period_to_rate.s4 + 0)
4b2f : a5 1b __ LDA ACCU + 0 
4b31 : a6 46 __ LDX T3 + 0 
4b33 : 9d a1 9e STA $9ea1,x ; (modplay.channel[0].rate + 0)
4b36 : a5 1c __ LDA ACCU + 1 
4b38 : 9d a2 9e STA $9ea2,x ; (modplay.channel[0].rate + 1)
4b3b : 60 __ __ RTS
.s54:
4b3c : bd 9f 9e LDA $9e9f,x ; (modplay.channel[0].period + 0)
4b3f : 18 __ __ CLC
4b40 : 65 43 __ ADC T0 + 0 
4b42 : 85 0d __ STA P0 
4b44 : bd a0 9e LDA $9ea0,x ; (modplay.channel[0].period + 1)
4b47 : 69 00 __ ADC #$00
4b49 : 85 0e __ STA P1 
4b4b : 20 3f 4c JSR $4c3f ; (clamp_period.s4 + 0)
4b4e : a5 1b __ LDA ACCU + 0 
4b50 : 85 0d __ STA P0 
4b52 : a6 46 __ LDX T3 + 0 
4b54 : 9d 9f 9e STA $9e9f,x ; (modplay.channel[0].period + 0)
4b57 : a5 1c __ LDA ACCU + 1 
4b59 : 9d a0 9e STA $9ea0,x ; (modplay.channel[0].period + 1)
4b5c : 4c 2a 4b JMP $4b2a ; (fx_row.s51 + 0)
.s57:
4b5f : c9 0a __ CMP #$0a
4b61 : f0 6e __ BEQ $4bd1 ; (fx_row.s71 + 0)
.s58:
4b63 : b0 5f __ BCS $4bc4 ; (fx_row.s59 + 0)
.s60:
4b65 : a5 1c __ LDA ACCU + 1 
4b67 : d0 01 __ BNE $4b6a ; (fx_row.s61 + 0)
4b69 : 60 __ __ RTS
.s61:
4b6a : bd c7 9e LDA $9ec7,x ; (modplay.channel[0].smp_length + 3)
4b6d : d0 29 __ BNE $4b98 ; (fx_row.s63 + 0)
.s68:
4b6f : bd c6 9e LDA $9ec6,x ; (modplay.channel[0].smp_length + 2)
4b72 : d0 0b __ BNE $4b7f ; (fx_row.s62 + 0)
.s69:
4b74 : bd c5 9e LDA $9ec5,x ; (modplay.channel[0].smp_length + 1)
4b77 : d0 06 __ BNE $4b7f ; (fx_row.s62 + 0)
.s70:
4b79 : dd c4 9e CMP $9ec4,x ; (modplay.channel[0].smp_length + 0)
4b7c : 90 01 __ BCC $4b7f ; (fx_row.s62 + 0)
4b7e : 60 __ __ RTS
.s62:
4b7f : bd c7 9e LDA $9ec7,x ; (modplay.channel[0].smp_length + 3)
4b82 : d0 14 __ BNE $4b98 ; (fx_row.s63 + 0)
.s64:
4b84 : bd c6 9e LDA $9ec6,x ; (modplay.channel[0].smp_length + 2)
4b87 : d0 0f __ BNE $4b98 ; (fx_row.s63 + 0)
.s65:
4b89 : a5 1c __ LDA ACCU + 1 
4b8b : dd c5 9e CMP $9ec5,x ; (modplay.channel[0].smp_length + 1)
4b8e : d0 05 __ BNE $4b95 ; (fx_row.s67 + 0)
.s66:
4b90 : a9 00 __ LDA #$00
4b92 : dd c4 9e CMP $9ec4,x ; (modplay.channel[0].smp_length + 0)
.s67:
4b95 : 90 01 __ BCC $4b98 ; (fx_row.s63 + 0)
4b97 : 60 __ __ RTS
.s63:
4b98 : bd c5 9e LDA $9ec5,x ; (modplay.channel[0].smp_length + 1)
4b9b : 38 __ __ SEC
4b9c : e5 1c __ SBC ACCU + 1 
4b9e : 9d c5 9e STA $9ec5,x ; (modplay.channel[0].smp_length + 1)
4ba1 : bd c6 9e LDA $9ec6,x ; (modplay.channel[0].smp_length + 2)
4ba4 : e9 00 __ SBC #$00
4ba6 : 9d c6 9e STA $9ec6,x ; (modplay.channel[0].smp_length + 2)
4ba9 : b0 03 __ BCS $4bae ; (fx_row.s99 + 0)
.s98:
4bab : de c7 9e DEC $9ec7,x ; (modplay.channel[0].smp_length + 3)
.s99:
4bae : bd c1 9e LDA $9ec1,x ; (modplay.channel[0].smp_start + 1)
4bb1 : 18 __ __ CLC
4bb2 : 65 1c __ ADC ACCU + 1 
4bb4 : 9d c1 9e STA $9ec1,x ; (modplay.channel[0].smp_start + 1)
4bb7 : b0 01 __ BCS $4bba ; (fx_row.s101 + 0)
4bb9 : 60 __ __ RTS
.s101:
4bba : fe c2 9e INC $9ec2,x ; (modplay.channel[0].smp_start + 2)
4bbd : f0 01 __ BEQ $4bc0 ; (fx_row.s100 + 0)
4bbf : 60 __ __ RTS
.s100:
4bc0 : fe c3 9e INC $9ec3,x ; (modplay.channel[0].smp_start + 3)
4bc3 : 60 __ __ RTS
.s59:
4bc4 : a9 01 __ LDA #$01
4bc6 : 8d 4e 9c STA $9c4e ; (modplay.skip_row_advance + 0)
4bc9 : a5 1c __ LDA ACCU + 1 
4bcb : 8d 4f 9c STA $9c4f ; (modplay.next_order + 0)
4bce : 4c f0 49 JMP $49f0 ; (fx_row.s97 + 0)
.s71:
4bd1 : a5 1b __ LDA ACCU + 0 
4bd3 : d0 03 __ BNE $4bd8 ; (fx_row.s94 + 0)
.s72:
4bd5 : 38 __ __ SEC
4bd6 : e5 43 __ SBC T0 + 0 
.s94:
4bd8 : 9d b3 9e STA $9eb3,x ; (modplay.channel[0].volslide + 0)
4bdb : 60 __ __ RTS
.s73:
4bdc : a9 40 __ LDA #$40
4bde : c5 1c __ CMP ACCU + 1 
4be0 : b0 03 __ BCS $4be5 ; (fx_row.s29 + 0)
4be2 : 4c 4f 4a JMP $4a4f ; (fx_row.s95 + 0)
.s29:
4be5 : a5 1c __ LDA ACCU + 1 
4be7 : 4c 4f 4a JMP $4a4f ; (fx_row.s95 + 0)
.s74:
4bea : c9 04 __ CMP #$04
4bec : f0 41 __ BEQ $4c2f ; (fx_row.s89 + 0)
.s75:
4bee : 90 23 __ BCC $4c13 ; (fx_row.s83 + 0)
.s76:
4bf0 : c9 06 __ CMP #$06
4bf2 : f0 dd __ BEQ $4bd1 ; (fx_row.s71 + 0)
.s77:
4bf4 : b0 07 __ BCS $4bfd ; (fx_row.s78 + 0)
.s82:
4bf6 : a9 00 __ LDA #$00
4bf8 : 9d be 9e STA $9ebe,x ; (modplay.channel[0].needs_start + 0)
4bfb : 90 d4 __ BCC $4bd1 ; (fx_row.s71 + 0)
.s78:
4bfd : bd a3 9e LDA $9ea3,x ; (modplay.channel[0].volume + 0)
4c00 : 9d b2 9e STA $9eb2,x ; (modplay.channel[0].trm_basvol + 0)
4c03 : a5 43 __ LDA T0 + 0 
4c05 : f0 03 __ BEQ $4c0a ; (fx_row.s79 + 0)
.s81:
4c07 : 9d b0 9e STA $9eb0,x ; (modplay.channel[0].trm_depth + 0)
.s79:
4c0a : a5 1b __ LDA ACCU + 0 
4c0c : d0 01 __ BNE $4c0f ; (fx_row.s80 + 0)
4c0e : 60 __ __ RTS
.s80:
4c0f : 9d b1 9e STA $9eb1,x ; (modplay.channel[0].trm_speed + 0)
4c12 : 60 __ __ RTS
.s83:
4c13 : a8 __ __ TAY
4c14 : d0 04 __ BNE $4c1a ; (fx_row.s84 + 0)
.s88:
4c16 : 9d b4 9e STA $9eb4,x ; (modplay.channel[0].arp_counter + 0)
4c19 : 60 __ __ RTS
.s84:
4c1a : a9 02 __ LDA #$02
4c1c : dd a5 9e CMP $9ea5,x ; (modplay.channel[0].effect + 0)
4c1f : b0 05 __ BCS $4c26 ; (fx_row.s87 + 0)
.s85:
4c21 : a9 00 __ LDA #$00
4c23 : 9d be 9e STA $9ebe,x ; (modplay.channel[0].needs_start + 0)
.s87:
4c26 : a5 1c __ LDA ACCU + 1 
4c28 : d0 01 __ BNE $4c2b ; (fx_row.s86 + 0)
4c2a : 60 __ __ RTS
.s86:
4c2b : 9d a9 9e STA $9ea9,x ; (modplay.channel[0].porta_speed + 0)
4c2e : 60 __ __ RTS
.s89:
4c2f : a5 43 __ LDA T0 + 0 
4c31 : f0 03 __ BEQ $4c36 ; (fx_row.s90 + 0)
.s92:
4c33 : 9d ac 9e STA $9eac,x ; (modplay.channel[0].vib_depth + 0)
.s90:
4c36 : a5 1b __ LDA ACCU + 0 
4c38 : d0 01 __ BNE $4c3b ; (fx_row.s91 + 0)
4c3a : 60 __ __ RTS
.s91:
4c3b : 9d ad 9e STA $9ead,x ; (modplay.channel[0].vib_speed + 0)
4c3e : 60 __ __ RTS
--------------------------------------------------------------------
clamp_period: ; clamp_period(u16)->u16
; 144, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4c3f : a5 0e __ LDA P1 ; (p + 1)
4c41 : d0 0f __ BNE $4c52 ; (clamp_period.s5 + 0)
.s11:
4c43 : a5 0d __ LDA P0 ; (p + 0)
4c45 : c9 71 __ CMP #$71
4c47 : b0 09 __ BCS $4c52 ; (clamp_period.s5 + 0)
.s10:
4c49 : a9 00 __ LDA #$00
4c4b : a0 71 __ LDY #$71
.s3:
4c4d : 84 1b __ STY ACCU + 0 
4c4f : 85 1c __ STA ACCU + 1 
4c51 : 60 __ __ RTS
.s5:
4c52 : a9 03 __ LDA #$03
4c54 : c5 0e __ CMP P1 ; (p + 1)
4c56 : f0 04 __ BEQ $4c5c ; (clamp_period.s8 + 0)
.s9:
4c58 : 90 08 __ BCC $4c62 ; (clamp_period.s7 + 0)
4c5a : b0 0c __ BCS $4c68 ; (clamp_period.s6 + 0)
.s8:
4c5c : a5 0d __ LDA P0 ; (p + 0)
4c5e : c9 59 __ CMP #$59
4c60 : 90 06 __ BCC $4c68 ; (clamp_period.s6 + 0)
.s7:
4c62 : a9 03 __ LDA #$03
4c64 : a0 58 __ LDY #$58
4c66 : d0 e5 __ BNE $4c4d ; (clamp_period.s3 + 0)
.s6:
4c68 : a5 0e __ LDA P1 ; (p + 1)
4c6a : a4 0d __ LDY P0 ; (p + 0)
4c6c : 4c 4d 4c JMP $4c4d ; (clamp_period.s3 + 0)
--------------------------------------------------------------------
clamp_vol: ; clamp_vol(i8)->u8
; 132, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4c6f : 85 1b __ STA ACCU + 0 
4c71 : aa __ __ TAX
4c72 : 10 03 __ BPL $4c77 ; (clamp_vol.s5 + 0)
.s7:
4c74 : a9 00 __ LDA #$00
.s3:
4c76 : 60 __ __ RTS
.s5:
4c77 : a9 40 __ LDA #$40
4c79 : c5 1b __ CMP ACCU + 0 
4c7b : 90 f9 __ BCC $4c76 ; (clamp_vol.s3 + 0)
.s6:
4c7d : a5 1b __ LDA ACCU + 0 
4c7f : 60 __ __ RTS
--------------------------------------------------------------------
fx_tick: ; fx_tick(u8)->void
; 433, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4c80 : a4 0f __ LDY P2 ; (ch_idx + 0)
4c82 : be cd 7b LDX $7bcd,y ; (__multab50L + 0)
4c85 : 86 45 __ STX T3 + 0 
4c87 : bd a5 9e LDA $9ea5,x ; (modplay.channel[0].effect + 0)
4c8a : c9 05 __ CMP #$05
4c8c : d0 05 __ BNE $4c93 ; (fx_tick.s6 + 0)
.s5:
4c8e : a0 01 __ LDY #$01
4c90 : 4c f5 4d JMP $4df5 ; (fx_tick.s34 + 0)
.s6:
4c93 : 85 47 __ STA T5 + 0 
4c95 : c9 05 __ CMP #$05
4c97 : b0 03 __ BCS $4c9c ; (fx_tick.s7 + 0)
4c99 : 4c d2 4d JMP $4dd2 ; (fx_tick.s31 + 0)
.s7:
4c9c : c9 0a __ CMP #$0a
4c9e : d0 03 __ BNE $4ca3 ; (fx_tick.s8 + 0)
4ca0 : 4c c3 4d JMP $4dc3 ; (fx_tick.s29 + 0)
.s8:
4ca3 : 90 4d __ BCC $4cf2 ; (fx_tick.s20 + 0)
.s9:
4ca5 : c9 0e __ CMP #$0e
4ca7 : d0 21 __ BNE $4cca ; (fx_tick.s3 + 0)
.s10:
4ca9 : bd a6 9e LDA $9ea6,x ; (modplay.channel[0].eparam + 0)
4cac : 4a __ __ LSR
4cad : 4a __ __ LSR
4cae : 4a __ __ LSR
4caf : 4a __ __ LSR
4cb0 : c9 0c __ CMP #$0c
4cb2 : f0 2d __ BEQ $4ce1 ; (fx_tick.s18 + 0)
.s11:
4cb4 : 90 15 __ BCC $4ccb ; (fx_tick.s15 + 0)
.s12:
4cb6 : c9 0d __ CMP #$0d
4cb8 : d0 10 __ BNE $4cca ; (fx_tick.s3 + 0)
.s13:
4cba : fe b9 9e INC $9eb9,x ; (modplay.channel[0].tick_cur + 0)
4cbd : bd b9 9e LDA $9eb9,x ; (modplay.channel[0].tick_cur + 0)
4cc0 : dd b8 9e CMP $9eb8,x ; (modplay.channel[0].tick_stop + 0)
4cc3 : d0 05 __ BNE $4cca ; (fx_tick.s3 + 0)
.s14:
4cc5 : a9 01 __ LDA #$01
4cc7 : 9d be 9e STA $9ebe,x ; (modplay.channel[0].needs_start + 0)
.s3:
4cca : 60 __ __ RTS
.s15:
4ccb : c9 09 __ CMP #$09
4ccd : d0 fb __ BNE $4cca ; (fx_tick.s3 + 0)
.s16:
4ccf : fe b9 9e INC $9eb9,x ; (modplay.channel[0].tick_cur + 0)
4cd2 : bd b9 9e LDA $9eb9,x ; (modplay.channel[0].tick_cur + 0)
4cd5 : dd b8 9e CMP $9eb8,x ; (modplay.channel[0].tick_stop + 0)
4cd8 : 90 f0 __ BCC $4cca ; (fx_tick.s3 + 0)
.s17:
4cda : a9 00 __ LDA #$00
4cdc : 9d b9 9e STA $9eb9,x ; (modplay.channel[0].tick_cur + 0)
4cdf : b0 e4 __ BCS $4cc5 ; (fx_tick.s14 + 0)
.s18:
4ce1 : fe b9 9e INC $9eb9,x ; (modplay.channel[0].tick_cur + 0)
4ce4 : bd b9 9e LDA $9eb9,x ; (modplay.channel[0].tick_cur + 0)
4ce7 : dd b8 9e CMP $9eb8,x ; (modplay.channel[0].tick_stop + 0)
4cea : 90 de __ BCC $4cca ; (fx_tick.s3 + 0)
.s19:
4cec : a9 00 __ LDA #$00
.s60:
4cee : 9d a3 9e STA $9ea3,x ; (modplay.channel[0].volume + 0)
4cf1 : 60 __ __ RTS
.s20:
4cf2 : c9 06 __ CMP #$06
4cf4 : f0 58 __ BEQ $4d4e ; (fx_tick.s26 + 0)
.s21:
4cf6 : c9 07 __ CMP #$07
4cf8 : d0 d0 __ BNE $4cca ; (fx_tick.s3 + 0)
.s22:
4cfa : bd ae 9e LDA $9eae,x ; (modplay.channel[0].trm_wave + 0)
4cfd : 85 0d __ STA P0 
4cff : bd af 9e LDA $9eaf,x ; (modplay.channel[0].trm_pos + 0)
4d02 : 85 0e __ STA P1 
4d04 : 20 d6 4e JSR $4ed6 ; (wave_value.s4 + 0)
4d07 : aa __ __ TAX
4d08 : a4 45 __ LDY T3 + 0 
4d0a : b9 b0 9e LDA $9eb0,y ; (modplay.channel[0].trm_depth + 0)
4d0d : 85 1b __ STA ACCU + 0 
4d0f : a9 00 __ LDA #$00
4d11 : 85 1c __ STA ACCU + 1 
4d13 : 8a __ __ TXA
4d14 : 20 9e 77 JSR $779e ; (mul16by8 + 0)
4d17 : a5 1c __ LDA ACCU + 1 
4d19 : 85 43 __ STA T0 + 0 
4d1b : a5 1b __ LDA ACCU + 0 
4d1d : 0a __ __ ASL
4d1e : 26 43 __ ROL T0 + 0 
4d20 : 0a __ __ ASL
4d21 : 26 43 __ ROL T0 + 0 
4d23 : a5 0e __ LDA P1 
4d25 : a4 45 __ LDY T3 + 0 
4d27 : 29 10 __ AND #$10
4d29 : d0 09 __ BNE $4d34 ; (fx_tick.s25 + 0)
.s23:
4d2b : 18 __ __ CLC
4d2c : a5 43 __ LDA T0 + 0 
4d2e : 79 b2 9e ADC $9eb2,y ; (modplay.channel[0].trm_basvol + 0)
4d31 : 4c 3a 4d JMP $4d3a ; (fx_tick.s24 + 0)
.s25:
4d34 : b9 b2 9e LDA $9eb2,y ; (modplay.channel[0].trm_basvol + 0)
4d37 : 38 __ __ SEC
4d38 : e5 43 __ SBC T0 + 0 
.s24:
4d3a : 20 6f 4c JSR $4c6f ; (clamp_vol.s4 + 0)
4d3d : a6 45 __ LDX T3 + 0 
4d3f : 9d a3 9e STA $9ea3,x ; (modplay.channel[0].volume + 0)
4d42 : bd b1 9e LDA $9eb1,x ; (modplay.channel[0].trm_speed + 0)
4d45 : 18 __ __ CLC
4d46 : 65 0e __ ADC P1 
4d48 : 29 3f __ AND #$3f
4d4a : 9d af 9e STA $9eaf,x ; (modplay.channel[0].trm_pos + 0)
4d4d : 60 __ __ RTS
.s26:
4d4e : bd aa 9e LDA $9eaa,x ; (modplay.channel[0].vib_wave + 0)
4d51 : 85 0d __ STA P0 
4d53 : bd ab 9e LDA $9eab,x ; (modplay.channel[0].vib_pos + 0)
4d56 : 85 0e __ STA P1 
4d58 : 20 d6 4e JSR $4ed6 ; (wave_value.s4 + 0)
4d5b : aa __ __ TAX
4d5c : a4 45 __ LDY T3 + 0 
4d5e : b9 ac 9e LDA $9eac,y ; (modplay.channel[0].vib_depth + 0)
4d61 : 85 1b __ STA ACCU + 0 
4d63 : a9 00 __ LDA #$00
4d65 : 85 1c __ STA ACCU + 1 
4d67 : 8a __ __ TXA
4d68 : 20 9e 77 JSR $779e ; (mul16by8 + 0)
4d6b : a5 1c __ LDA ACCU + 1 
4d6d : 06 1b __ ASL ACCU + 0 
4d6f : 2a __ __ ROL
4d70 : 85 43 __ STA T0 + 0 
4d72 : a9 00 __ LDA #$00
4d74 : 2a __ __ ROL
4d75 : 85 44 __ STA T0 + 1 
4d77 : a5 0e __ LDA P1 
4d79 : 85 46 __ STA T4 + 0 
4d7b : a4 45 __ LDY T3 + 0 
4d7d : 29 10 __ AND #$10
4d7f : d0 0f __ BNE $4d90 ; (fx_tick.s30 + 0)
.s27:
4d81 : b9 9f 9e LDA $9e9f,y ; (modplay.channel[0].period + 0)
4d84 : 65 43 __ ADC T0 + 0 
4d86 : 85 0d __ STA P0 
4d88 : b9 a0 9e LDA $9ea0,y ; (modplay.channel[0].period + 1)
4d8b : 65 44 __ ADC T0 + 1 
4d8d : 4c 9d 4d JMP $4d9d ; (fx_tick.s28 + 0)
.s30:
4d90 : b9 9f 9e LDA $9e9f,y ; (modplay.channel[0].period + 0)
4d93 : 38 __ __ SEC
4d94 : e5 43 __ SBC T0 + 0 
4d96 : 85 0d __ STA P0 
4d98 : b9 a0 9e LDA $9ea0,y ; (modplay.channel[0].period + 1)
4d9b : e5 44 __ SBC T0 + 1 
.s28:
4d9d : 85 0e __ STA P1 
4d9f : 20 3f 4c JSR $4c3f ; (clamp_period.s4 + 0)
4da2 : 20 32 49 JSR $4932 ; (period_to_rate@proxy + 0)
4da5 : a5 1b __ LDA ACCU + 0 
4da7 : a6 45 __ LDX T3 + 0 
4da9 : 9d a1 9e STA $9ea1,x ; (modplay.channel[0].rate + 0)
4dac : a5 1c __ LDA ACCU + 1 
4dae : 9d a2 9e STA $9ea2,x ; (modplay.channel[0].rate + 1)
4db1 : bd ad 9e LDA $9ead,x ; (modplay.channel[0].vib_speed + 0)
4db4 : 18 __ __ CLC
4db5 : 65 46 __ ADC T4 + 0 
4db7 : 29 3f __ AND #$3f
4db9 : 9d ab 9e STA $9eab,x ; (modplay.channel[0].vib_pos + 0)
4dbc : a5 47 __ LDA T5 + 0 
4dbe : c9 06 __ CMP #$06
4dc0 : f0 01 __ BEQ $4dc3 ; (fx_tick.s29 + 0)
4dc2 : 60 __ __ RTS
.s29:
4dc3 : bd a3 9e LDA $9ea3,x ; (modplay.channel[0].volume + 0)
4dc6 : 18 __ __ CLC
4dc7 : 7d b3 9e ADC $9eb3,x ; (modplay.channel[0].volslide + 0)
4dca : 20 6f 4c JSR $4c6f ; (clamp_vol.s4 + 0)
4dcd : a6 45 __ LDX T3 + 0 
4dcf : 4c ee 4c JMP $4cee ; (fx_tick.s60 + 0)
.s31:
4dd2 : c9 02 __ CMP #$02
4dd4 : d0 11 __ BNE $4de7 ; (fx_tick.s32 + 0)
.s59:
4dd6 : bd a9 9e LDA $9ea9,x ; (modplay.channel[0].porta_speed + 0)
4dd9 : 18 __ __ CLC
4dda : 7d 9f 9e ADC $9e9f,x ; (modplay.channel[0].period + 0)
4ddd : 85 0d __ STA P0 
4ddf : bd a0 9e LDA $9ea0,x ; (modplay.channel[0].period + 1)
4de2 : 69 00 __ ADC #$00
4de4 : 4c b1 4e JMP $4eb1 ; (fx_tick.s57 + 0)
.s32:
4de7 : b0 03 __ BCS $4dec ; (fx_tick.s33 + 0)
4de9 : 4c 83 4e JMP $4e83 ; (fx_tick.s51 + 0)
.s33:
4dec : a0 00 __ LDY #$00
4dee : c9 03 __ CMP #$03
4df0 : f0 03 __ BEQ $4df5 ; (fx_tick.s34 + 0)
4df2 : 4c 4e 4d JMP $4d4e ; (fx_tick.s26 + 0)
.s34:
4df5 : bd a7 9e LDA $9ea7,x ; (modplay.channel[0].porta_target + 0)
4df8 : 85 43 __ STA T0 + 0 
4dfa : bd a8 9e LDA $9ea8,x ; (modplay.channel[0].porta_target + 1)
4dfd : 85 44 __ STA T0 + 1 
4dff : 05 43 __ ORA T0 + 0 
4e01 : f0 58 __ BEQ $4e5b ; (fx_tick.s35 + 0)
.s36:
4e03 : bd a2 9e LDA $9ea2,x ; (modplay.channel[0].rate + 1)
4e06 : 85 1c __ STA ACCU + 1 
4e08 : c5 44 __ CMP T0 + 1 
4e0a : d0 09 __ BNE $4e15 ; (fx_tick.s37 + 0)
.s50:
4e0c : a5 43 __ LDA T0 + 0 
4e0e : dd a1 9e CMP $9ea1,x ; (modplay.channel[0].rate + 0)
4e11 : f0 48 __ BEQ $4e5b ; (fx_tick.s35 + 0)
.s61:
4e13 : a5 1c __ LDA ACCU + 1 
.s37:
4e15 : c5 44 __ CMP T0 + 1 
4e17 : d0 05 __ BNE $4e1e ; (fx_tick.s49 + 0)
.s48:
4e19 : bd a1 9e LDA $9ea1,x ; (modplay.channel[0].rate + 0)
4e1c : c5 43 __ CMP T0 + 0 
.s49:
4e1e : 90 42 __ BCC $4e62 ; (fx_tick.s45 + 0)
.s38:
4e20 : a5 1c __ LDA ACCU + 1 
4e22 : d0 11 __ BNE $4e35 ; (fx_tick.s43 + 0)
.s44:
4e24 : bd a9 9e LDA $9ea9,x ; (modplay.channel[0].porta_speed + 0)
4e27 : dd a1 9e CMP $9ea1,x ; (modplay.channel[0].rate + 0)
4e2a : 90 09 __ BCC $4e35 ; (fx_tick.s43 + 0)
.s39:
4e2c : a5 43 __ LDA T0 + 0 
4e2e : 9d a1 9e STA $9ea1,x ; (modplay.channel[0].rate + 0)
4e31 : a5 44 __ LDA T0 + 1 
4e33 : b0 0e __ BCS $4e43 ; (fx_tick.s40 + 0)
.s43:
4e35 : bd a1 9e LDA $9ea1,x ; (modplay.channel[0].rate + 0)
4e38 : 38 __ __ SEC
4e39 : fd a9 9e SBC $9ea9,x ; (modplay.channel[0].porta_speed + 0)
4e3c : 9d a1 9e STA $9ea1,x ; (modplay.channel[0].rate + 0)
4e3f : a5 1c __ LDA ACCU + 1 
4e41 : e9 00 __ SBC #$00
.s40:
4e43 : 9d a2 9e STA $9ea2,x ; (modplay.channel[0].rate + 1)
4e46 : c5 44 __ CMP T0 + 1 
4e48 : d0 05 __ BNE $4e4f ; (fx_tick.s47 + 0)
.s42:
4e4a : bd a1 9e LDA $9ea1,x ; (modplay.channel[0].rate + 0)
4e4d : c5 43 __ CMP T0 + 0 
.s47:
4e4f : b0 0a __ BCS $4e5b ; (fx_tick.s35 + 0)
.s41:
4e51 : a5 43 __ LDA T0 + 0 
4e53 : 9d a1 9e STA $9ea1,x ; (modplay.channel[0].rate + 0)
4e56 : a5 44 __ LDA T0 + 1 
4e58 : 9d a2 9e STA $9ea2,x ; (modplay.channel[0].rate + 1)
.s35:
4e5b : 98 __ __ TYA
4e5c : f0 03 __ BEQ $4e61 ; (fx_tick.s35 + 6)
4e5e : 4c c3 4d JMP $4dc3 ; (fx_tick.s29 + 0)
4e61 : 60 __ __ RTS
.s45:
4e62 : bd a9 9e LDA $9ea9,x ; (modplay.channel[0].porta_speed + 0)
4e65 : 7d a1 9e ADC $9ea1,x ; (modplay.channel[0].rate + 0)
4e68 : 85 1b __ STA ACCU + 0 
4e6a : 9d a1 9e STA $9ea1,x ; (modplay.channel[0].rate + 0)
4e6d : a5 1c __ LDA ACCU + 1 
4e6f : 69 00 __ ADC #$00
4e71 : 85 1c __ STA ACCU + 1 
4e73 : 9d a2 9e STA $9ea2,x ; (modplay.channel[0].rate + 1)
4e76 : a5 44 __ LDA T0 + 1 
4e78 : c5 1c __ CMP ACCU + 1 
4e7a : d0 d3 __ BNE $4e4f ; (fx_tick.s47 + 0)
.s46:
4e7c : a5 43 __ LDA T0 + 0 
4e7e : c5 1b __ CMP ACCU + 0 
4e80 : 4c 4f 4e JMP $4e4f ; (fx_tick.s47 + 0)
.s51:
4e83 : a8 __ __ TAY
4e84 : d0 10 __ BNE $4e96 ; (fx_tick.s55 + 0)
.s52:
4e86 : bd a6 9e LDA $9ea6,x ; (modplay.channel[0].eparam + 0)
4e89 : d0 01 __ BNE $4e8c ; (fx_tick.s53 + 0)
4e8b : 60 __ __ RTS
.s53:
4e8c : bd 9e 9e LDA $9e9e,x ; (modplay.channel[0].sample_num + 0)
4e8f : d0 01 __ BNE $4e92 ; (fx_tick.s54 + 0)
4e91 : 60 __ __ RTS
.s54:
4e92 : fe b4 9e INC $9eb4,x ; (modplay.channel[0].arp_counter + 0)
4e95 : 60 __ __ RTS
.s55:
4e96 : bd a0 9e LDA $9ea0,x ; (modplay.channel[0].period + 1)
4e99 : d0 08 __ BNE $4ea3 ; (fx_tick.s56 + 0)
.s58:
4e9b : a9 71 __ LDA #$71
4e9d : dd 9f 9e CMP $9e9f,x ; (modplay.channel[0].period + 0)
4ea0 : 90 01 __ BCC $4ea3 ; (fx_tick.s56 + 0)
4ea2 : 60 __ __ RTS
.s56:
4ea3 : bd 9f 9e LDA $9e9f,x ; (modplay.channel[0].period + 0)
4ea6 : 38 __ __ SEC
4ea7 : fd a9 9e SBC $9ea9,x ; (modplay.channel[0].porta_speed + 0)
4eaa : 85 0d __ STA P0 
4eac : bd a0 9e LDA $9ea0,x ; (modplay.channel[0].period + 1)
4eaf : e9 00 __ SBC #$00
.s57:
4eb1 : 85 0e __ STA P1 
4eb3 : 20 3f 4c JSR $4c3f ; (clamp_period.s4 + 0)
4eb6 : a5 1b __ LDA ACCU + 0 
4eb8 : 85 0d __ STA P0 
4eba : a6 45 __ LDX T3 + 0 
4ebc : 9d 9f 9e STA $9e9f,x ; (modplay.channel[0].period + 0)
4ebf : a5 1c __ LDA ACCU + 1 
4ec1 : 85 0e __ STA P1 
4ec3 : 9d a0 9e STA $9ea0,x ; (modplay.channel[0].period + 1)
4ec6 : 20 3a 49 JSR $493a ; (period_to_rate.s4 + 0)
4ec9 : a5 1b __ LDA ACCU + 0 
4ecb : a6 45 __ LDX T3 + 0 
4ecd : 9d a1 9e STA $9ea1,x ; (modplay.channel[0].rate + 0)
4ed0 : a5 1c __ LDA ACCU + 1 
4ed2 : 9d a2 9e STA $9ea2,x ; (modplay.channel[0].rate + 1)
4ed5 : 60 __ __ RTS
--------------------------------------------------------------------
wave_value: ; wave_value(u8,u8)->u8
; 156, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4ed6 : a5 0e __ LDA P1 ; (pos + 0)
4ed8 : 29 1f __ AND #$1f
4eda : a8 __ __ TAY
4edb : a5 0d __ LDA P0 ; (wave + 0)
4edd : 29 03 __ AND #$03
4edf : c9 01 __ CMP #$01
4ee1 : d0 07 __ BNE $4eea ; (wave_value.s5 + 0)
.s10:
4ee3 : 98 __ __ TYA
4ee4 : 0a __ __ ASL
4ee5 : 0a __ __ ASL
4ee6 : 0a __ __ ASL
4ee7 : 49 ff __ EOR #$ff
.s3:
4ee9 : 60 __ __ RTS
.s5:
4eea : aa __ __ TAX
4eeb : d0 04 __ BNE $4ef1 ; (wave_value.s6 + 0)
.s9:
4eed : b9 8b 80 LDA $808b,y ; (vib_sine[0] + 0)
4ef0 : 60 __ __ RTS
.s6:
4ef1 : c9 02 __ CMP #$02
4ef3 : d0 03 __ BNE $4ef8 ; (wave_value.s7 + 0)
.s8:
4ef5 : a9 ff __ LDA #$ff
4ef7 : 60 __ __ RTS
.s7:
4ef8 : 98 __ __ TYA
4ef9 : 0a __ __ ASL
4efa : 0a __ __ ASL
4efb : 0a __ __ ASL
4efc : 60 __ __ RTS
--------------------------------------------------------------------
ua_update_channel: ; ua_update_channel(u8)->void
;  86, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s1:
4efd : 38 __ __ SEC
4efe : a5 23 __ LDA SP + 0 
4f00 : e9 0c __ SBC #$0c
4f02 : 85 23 __ STA SP + 0 
4f04 : b0 02 __ BCS $4f08 ; (ua_update_channel.s1 + 11)
4f06 : c6 24 __ DEC SP + 1 
4f08 : a0 03 __ LDY #$03
4f0a : b9 53 00 LDA $0053,y 
4f0d : 91 23 __ STA (SP + 0),y 
4f0f : 88 __ __ DEY
4f10 : 10 f8 __ BPL $4f0a ; (ua_update_channel.s1 + 13)
.s4:
4f12 : ad 4a 9c LDA $9c4a ; (modplay.master_volume + 0)
4f15 : 85 1b __ STA ACCU + 0 
4f17 : a6 13 __ LDX P6 ; (ch + 0)
4f19 : 86 47 __ STX T1 + 0 
4f1b : bd cd 7b LDA $7bcd,x ; (__multab50L + 0)
4f1e : 85 43 __ STA T0 + 0 
4f20 : aa __ __ TAX
4f21 : a9 00 __ LDA #$00
4f23 : 85 1c __ STA ACCU + 1 
4f25 : bd a3 9e LDA $9ea3,x ; (modplay.channel[0].volume + 0)
4f28 : 20 9e 77 JSR $779e ; (mul16by8 + 0)
4f2b : a5 1c __ LDA ACCU + 1 
4f2d : 85 50 __ STA T6 + 0 
4f2f : a5 1b __ LDA ACCU + 0 
4f31 : 0a __ __ ASL
4f32 : 26 50 __ ROL T6 + 0 
4f34 : 0a __ __ ASL
4f35 : 26 50 __ ROL T6 + 0 
4f37 : a4 43 __ LDY T0 + 0 
4f39 : b9 be 9e LDA $9ebe,y ; (modplay.channel[0].needs_start + 0)
4f3c : d0 5f __ BNE $4f9d ; (ua_update_channel.s10 + 0)
.s5:
4f3e : a5 50 __ LDA T6 + 0 
4f40 : d9 bb 9e CMP $9ebb,y ; (modplay.channel[0].ua_vol + 0)
4f43 : f0 0f __ BEQ $4f54 ; (ua_update_channel.s6 + 0)
.s9:
4f45 : 06 47 __ ASL T1 + 0 
4f47 : a4 47 __ LDY T1 + 0 
4f49 : be e2 7c LDX $7ce2,y ; (audio_ch_base[0] + 0)
4f4c : 9d 01 df STA $df01,x 
4f4f : a4 43 __ LDY T0 + 0 
4f51 : 99 bb 9e STA $9ebb,y ; (modplay.channel[0].ua_vol + 0)
.s6:
4f54 : b9 a2 9e LDA $9ea2,y ; (modplay.channel[0].rate + 1)
4f57 : d9 bd 9e CMP $9ebd,y ; (modplay.channel[0].ua_rate + 1)
4f5a : d0 08 __ BNE $4f64 ; (ua_update_channel.s7 + 0)
.s8:
4f5c : b9 a1 9e LDA $9ea1,y ; (modplay.channel[0].rate + 0)
4f5f : d9 bc 9e CMP $9ebc,y ; (modplay.channel[0].ua_rate + 0)
4f62 : f0 23 __ BEQ $4f87 ; (ua_update_channel.s3 + 0)
.s7:
4f64 : b9 a1 9e LDA $9ea1,y ; (modplay.channel[0].rate + 0)
4f67 : 85 0e __ STA P1 
4f69 : a5 13 __ LDA P6 ; (ch + 0)
4f6b : 0a __ __ ASL
4f6c : aa __ __ TAX
4f6d : b9 a2 9e LDA $9ea2,y ; (modplay.channel[0].rate + 1)
4f70 : 85 0f __ STA P2 
4f72 : bc e2 7c LDY $7ce2,x ; (audio_ch_base[0] + 0)
4f75 : 99 0e df STA $df0e,y 
4f78 : a5 0e __ LDA P1 
4f7a : 99 0f df STA $df0f,y 
4f7d : a6 43 __ LDX T0 + 0 
4f7f : 9d bc 9e STA $9ebc,x ; (modplay.channel[0].ua_rate + 0)
4f82 : a5 0f __ LDA P2 
.s14:
4f84 : 9d bd 9e STA $9ebd,x ; (modplay.channel[0].ua_rate + 1)
.s3:
4f87 : a0 03 __ LDY #$03
4f89 : b1 23 __ LDA (SP + 0),y 
4f8b : 99 53 00 STA $0053,y 
4f8e : 88 __ __ DEY
4f8f : 10 f8 __ BPL $4f89 ; (ua_update_channel.s3 + 2)
4f91 : 18 __ __ CLC
4f92 : a5 23 __ LDA SP + 0 
4f94 : 69 0c __ ADC #$0c
4f96 : 85 23 __ STA SP + 0 
4f98 : 90 02 __ BCC $4f9c ; (ua_update_channel.s3 + 21)
4f9a : e6 24 __ INC SP + 1 
4f9c : 60 __ __ RTS
.s10:
4f9d : 84 51 __ STY T7 + 0 
4f9f : a5 13 __ LDA P6 ; (ch + 0)
4fa1 : 85 0d __ STA P0 
4fa3 : a9 00 __ LDA #$00
4fa5 : 99 be 9e STA $9ebe,y ; (modplay.channel[0].needs_start + 0)
4fa8 : b9 c0 9e LDA $9ec0,y ; (modplay.channel[0].smp_start + 0)
4fab : 85 0e __ STA P1 
4fad : b9 c1 9e LDA $9ec1,y ; (modplay.channel[0].smp_start + 1)
4fb0 : 85 0f __ STA P2 
4fb2 : b9 c2 9e LDA $9ec2,y ; (modplay.channel[0].smp_start + 2)
4fb5 : 85 10 __ STA P3 
4fb7 : b9 c3 9e LDA $9ec3,y ; (modplay.channel[0].smp_start + 3)
4fba : 85 11 __ STA P4 
4fbc : 06 47 __ ASL T1 + 0 
4fbe : a6 47 __ LDX T1 + 0 
4fc0 : bd e2 7c LDA $7ce2,x ; (audio_ch_base[0] + 0)
4fc3 : 85 4f __ STA T5 + 0 
4fc5 : 85 53 __ STA T8 + 0 
4fc7 : b9 a1 9e LDA $9ea1,y ; (modplay.channel[0].rate + 0)
4fca : 85 55 __ STA T9 + 0 
4fcc : a9 df __ LDA #$df
4fce : 85 54 __ STA T8 + 1 
4fd0 : b9 a2 9e LDA $9ea2,y ; (modplay.channel[0].rate + 1)
4fd3 : 85 56 __ STA T9 + 1 
4fd5 : b9 c4 9e LDA $9ec4,y ; (modplay.channel[0].smp_length + 0)
4fd8 : 85 43 __ STA T0 + 0 
4fda : b9 c5 9e LDA $9ec5,y ; (modplay.channel[0].smp_length + 1)
4fdd : 85 44 __ STA T0 + 1 
4fdf : b9 c6 9e LDA $9ec6,y ; (modplay.channel[0].smp_length + 2)
4fe2 : 85 45 __ STA T0 + 2 
4fe4 : b9 c7 9e LDA $9ec7,y ; (modplay.channel[0].smp_length + 3)
4fe7 : 85 46 __ STA T0 + 3 
4fe9 : b9 bf 9e LDA $9ebf,y ; (modplay.channel[0].needs_loop + 0)
4fec : d0 03 __ BNE $4ff1 ; (ua_update_channel.s13 + 0)
4fee : 4c 76 50 JMP $5076 ; (ua_update_channel.s11 + 0)
.s13:
4ff1 : a6 51 __ LDX T7 + 0 
4ff3 : bd c8 9e LDA $9ec8,x ; (modplay.channel[0].smp_loop_a + 0)
4ff6 : 85 47 __ STA T1 + 0 
4ff8 : bd c9 9e LDA $9ec9,x ; (modplay.channel[0].smp_loop_a + 1)
4ffb : 85 48 __ STA T1 + 1 
4ffd : bd ca 9e LDA $9eca,x ; (modplay.channel[0].smp_loop_a + 2)
5000 : 85 49 __ STA T1 + 2 
5002 : bd cb 9e LDA $9ecb,x ; (modplay.channel[0].smp_loop_a + 3)
5005 : 85 4a __ STA T1 + 3 
5007 : bd cc 9e LDA $9ecc,x ; (modplay.channel[0].smp_loop_b + 0)
500a : 85 4b __ STA T2 + 0 
500c : bd cd 9e LDA $9ecd,x ; (modplay.channel[0].smp_loop_b + 1)
500f : 85 4c __ STA T2 + 1 
5011 : bd ce 9e LDA $9ece,x ; (modplay.channel[0].smp_loop_b + 2)
5014 : 85 4d __ STA T2 + 2 
5016 : bd cf 9e LDA $9ecf,x ; (modplay.channel[0].smp_loop_b + 3)
5019 : 85 4e __ STA T2 + 3 
501b : a9 00 __ LDA #$00
501d : a6 4f __ LDX T5 + 0 
501f : 9d 00 df STA $df00,x 
5022 : a5 50 __ LDA T6 + 0 
5024 : 9d 01 df STA $df01,x 
5027 : b9 a4 9e LDA $9ea4,y ; (modplay.channel[0].pan + 0)
502a : 9d 02 df STA $df02,x 
502d : 20 b4 50 JSR $50b4 ; (ch_wr_sms.s4 + 0)
5030 : 20 d0 50 JSR $50d0 ; (ch_wr_be24@proxy + 0)
5033 : a5 0d __ LDA P0 
5035 : 0a __ __ ASL
5036 : aa __ __ TAX
5037 : a5 56 __ LDA T9 + 1 
5039 : bc e2 7c LDY $7ce2,x ; (audio_ch_base[0] + 0)
503c : 99 0e df STA $df0e,y 
503f : a5 55 __ LDA T9 + 0 
5041 : 99 0f df STA $df0f,y 
5044 : a5 47 __ LDA T1 + 0 
5046 : 85 0f __ STA P2 
5048 : a9 11 __ LDA #$11
504a : 85 0e __ STA P1 
504c : a5 48 __ LDA T1 + 1 
504e : 85 10 __ STA P3 
5050 : a5 49 __ LDA T1 + 2 
5052 : 85 11 __ STA P4 
5054 : a5 4a __ LDA T1 + 3 
5056 : 85 12 __ STA P5 
5058 : 20 e4 50 JSR $50e4 ; (ch_wr_be24.s4 + 0)
505b : a5 4b __ LDA T2 + 0 
505d : 85 0f __ STA P2 
505f : a9 15 __ LDA #$15
5061 : 85 0e __ STA P1 
5063 : a5 4c __ LDA T2 + 1 
5065 : 85 10 __ STA P3 
5067 : a5 4d __ LDA T2 + 2 
5069 : 85 11 __ STA P4 
506b : a5 4e __ LDA T2 + 3 
506d : 85 12 __ STA P5 
506f : 20 e4 50 JSR $50e4 ; (ch_wr_be24.s4 + 0)
5072 : a9 03 __ LDA #$03
5074 : d0 29 __ BNE $509f ; (ua_update_channel.s12 + 0)
.s11:
5076 : a6 4f __ LDX T5 + 0 
5078 : 9d 00 df STA $df00,x 
507b : a5 50 __ LDA T6 + 0 
507d : 9d 01 df STA $df01,x 
5080 : b9 a4 9e LDA $9ea4,y ; (modplay.channel[0].pan + 0)
5083 : 9d 02 df STA $df02,x 
5086 : 20 b4 50 JSR $50b4 ; (ch_wr_sms.s4 + 0)
5089 : 20 d0 50 JSR $50d0 ; (ch_wr_be24@proxy + 0)
508c : a5 0d __ LDA P0 
508e : 0a __ __ ASL
508f : aa __ __ TAX
5090 : a5 56 __ LDA T9 + 1 
5092 : bc e2 7c LDY $7ce2,x ; (audio_ch_base[0] + 0)
5095 : 99 0e df STA $df0e,y 
5098 : a5 55 __ LDA T9 + 0 
509a : 99 0f df STA $df0f,y 
509d : a9 01 __ LDA #$01
.s12:
509f : a0 00 __ LDY #$00
50a1 : 91 53 __ STA (T8 + 0),y 
50a3 : a5 50 __ LDA T6 + 0 
50a5 : a6 51 __ LDX T7 + 0 
50a7 : 9d bb 9e STA $9ebb,x ; (modplay.channel[0].ua_vol + 0)
50aa : a5 55 __ LDA T9 + 0 
50ac : 9d bc 9e STA $9ebc,x ; (modplay.channel[0].ua_rate + 0)
50af : a5 56 __ LDA T9 + 1 
50b1 : 4c 84 4f JMP $4f84 ; (ua_update_channel.s14 + 0)
--------------------------------------------------------------------
ch_wr_sms: ; ch_wr_sms(u8,u32)->void
;  40, "/home/xahmol/git/UltimateDemo2026/include/audio.c"
.s4:
50b4 : a5 0d __ LDA P0 ; (ch + 0)
50b6 : 0a __ __ ASL
50b7 : a8 __ __ TAY
50b8 : a9 01 __ LDA #$01
50ba : be e2 7c LDX $7ce2,y ; (audio_ch_base[0] + 0)
50bd : 9d 04 df STA $df04,x 
50c0 : a5 10 __ LDA P3 ; (addr + 2)
50c2 : 9d 05 df STA $df05,x 
50c5 : a5 0f __ LDA P2 ; (addr + 1)
50c7 : 9d 06 df STA $df06,x 
50ca : a5 0e __ LDA P1 ; (addr + 0)
50cc : 9d 07 df STA $df07,x 
.s3:
50cf : 60 __ __ RTS
--------------------------------------------------------------------
ch_wr_be24@proxy: ; ch_wr_be24@proxy
50d0 : a9 09 __ LDA #$09
50d2 : 85 0e __ STA P1 
50d4 : a5 43 __ LDA $43 
50d6 : 85 0f __ STA P2 
50d8 : a5 44 __ LDA $44 
50da : 85 10 __ STA P3 
50dc : a5 45 __ LDA $45 
50de : 85 11 __ STA P4 
50e0 : a5 46 __ LDA $46 
50e2 : 85 12 __ STA P5 
--------------------------------------------------------------------
ch_wr_be24: ; ch_wr_be24(u8,u8,u32)->void
;  52, "/home/xahmol/git/UltimateDemo2026/include/audio.c"
.s4:
50e4 : a5 0d __ LDA P0 ; (ch + 0)
50e6 : 0a __ __ ASL
50e7 : aa __ __ TAX
50e8 : bd e2 7c LDA $7ce2,x ; (audio_ch_base[0] + 0)
50eb : 65 0e __ ADC P1 ; (offset + 0)
50ed : 85 1b __ STA ACCU + 0 
50ef : a9 df __ LDA #$df
50f1 : 85 1c __ STA ACCU + 1 
50f3 : a5 11 __ LDA P4 ; (val + 2)
50f5 : a0 00 __ LDY #$00
50f7 : 91 1b __ STA (ACCU + 0),y 
50f9 : a5 10 __ LDA P3 ; (val + 1)
50fb : c8 __ __ INY
50fc : 91 1b __ STA (ACCU + 0),y 
50fe : a5 0f __ LDA P2 ; (val + 0)
5100 : c8 __ __ INY
5101 : 91 1b __ STA (ACCU + 0),y 
.s3:
5103 : 60 __ __ RTS
--------------------------------------------------------------------
mandel_run: ; mandel_run()->void
;   4, "/home/xahmol/git/UltimateDemo2026/src/mandel.h"
.s4:
5104 : a9 8f __ LDA #$8f
5106 : 20 73 16 JSR $1673 ; (turbo_set.s4 + 0)
5109 : a9 35 __ LDA #$35
510b : 85 01 __ STA $01 
510d : a9 1f __ LDA #$1f
510f : 85 12 __ STA P5 
5111 : a9 40 __ LDA #$40
5113 : 85 11 __ STA P4 
5115 : a9 00 __ LDA #$00
5117 : 85 0f __ STA P2 
5119 : 85 10 __ STA P3 
511b : a2 fa __ LDX #$fa
.l6:
511d : ca __ __ DEX
511e : 9d 00 c0 STA $c000,x 
5121 : 9d fa c0 STA $c0fa,x 
5124 : 9d f4 c1 STA $c1f4,x 
5127 : 9d ee c2 STA $c2ee,x 
512a : d0 f1 __ BNE $511d ; (mandel_run.l6 + 0)
.s5:
512c : 85 0d __ STA P0 
512e : a9 e0 __ LDA #$e0
5130 : 85 0e __ STA P1 
5132 : 20 14 24 JSR $2414 ; (memset.s4 + 0)
5135 : a9 04 __ LDA #$04
5137 : 85 0d __ STA P0 
5139 : a9 00 __ LDA #$00
513b : 85 10 __ STA P3 
513d : a9 e0 __ LDA #$e0
513f : 85 11 __ STA P4 
5141 : a9 01 __ LDA #$01
5143 : a2 fa __ LDX #$fa
.l8:
5145 : ca __ __ DEX
5146 : 9d 00 d8 STA $d800,x 
5149 : 9d fa d8 STA $d8fa,x 
514c : 9d f4 d9 STA $d9f4,x 
514f : 9d ee da STA $daee,x 
5152 : d0 f1 __ BNE $5145 ; (mandel_run.l8 + 0)
.s7:
5154 : a9 00 __ LDA #$00
5156 : 85 0e __ STA P1 
5158 : a9 c0 __ LDA #$c0
515a : 85 0f __ STA P2 
515c : 20 90 0f JSR $0f90 ; (vic_setmode.s4 + 0)
515f : a9 00 __ LDA #$00
5161 : 8d 21 d0 STA $d021 
5164 : 8d 20 d0 STA $d020 
5167 : a9 ab __ LDA #$ab
5169 : 85 13 __ STA P6 
516b : a9 80 __ LDA #$80
516d : 85 14 __ STA P7 
516f : 20 a4 51 JSR $51a4 ; (render.s1 + 0)
5172 : a9 b5 __ LDA #$b5
5174 : 85 0d __ STA P0 
5176 : a9 80 __ LDA #$80
5178 : 85 0e __ STA P1 
517a : 20 37 54 JSR $5437 ; (colorize_standard.s4 + 0)
517d : a9 00 __ LDA #$00
517f : 8d 09 dc STA $dc09 
5182 : 8d 08 dc STA $dc08 
.l9:
5185 : ad 09 dc LDA $dc09 
5188 : c9 05 __ CMP #$05
518a : 90 f9 __ BCC $5185 ; (mandel_run.l9 + 0)
.s10:
518c : a9 00 __ LDA #$00
518e : 85 0d __ STA P0 
5190 : 85 0e __ STA P1 
5192 : 85 10 __ STA P3 
5194 : a9 36 __ LDA #$36
5196 : 85 01 __ STA $01 
5198 : 20 88 0f JSR $0f88 ; (vic_setmode@proxy + 0)
519b : a9 00 __ LDA #$00
519d : 8d 20 d0 STA $d020 
51a0 : 8d 21 d0 STA $d021 
.s3:
51a3 : 60 __ __ RTS
--------------------------------------------------------------------
render: ; render(const struct S#29216*)->void
;  81, "/home/xahmol/git/UltimateDemo2026/src/mandel.c"
.s1:
51a4 : a2 05 __ LDX #$05
51a6 : b5 53 __ LDA T10 + 0,x 
51a8 : 9d da bf STA $bfda,x ; (render@stack + 0)
51ab : ca __ __ DEX
51ac : 10 f8 __ BPL $51a6 ; (render.s1 + 2)
.s4:
51ae : a9 40 __ LDA #$40
51b0 : 85 11 __ STA P4 
51b2 : a9 1f __ LDA #$1f
51b4 : 85 12 __ STA P5 
51b6 : a9 00 __ LDA #$00
51b8 : 85 0d __ STA P0 
51ba : a9 e0 __ LDA #$e0
51bc : 85 0e __ STA P1 
51be : a0 06 __ LDY #$06
51c0 : b1 13 __ LDA (P6),y ; (f + 0)
51c2 : c8 __ __ INY
51c3 : 11 13 __ ORA (P6),y ; (f + 0)
51c5 : d0 08 __ BNE $51cf ; (render.s24 + 0)
.s5:
51c7 : c8 __ __ INY
51c8 : b1 13 __ LDA (P6),y ; (f + 0)
51ca : c8 __ __ INY
51cb : 11 13 __ ORA (P6),y ; (f + 0)
51cd : f0 02 __ BEQ $51d1 ; (render.s6 + 0)
.s24:
51cf : a9 01 __ LDA #$01
.s6:
51d1 : 85 57 __ STA T12 + 0 
51d3 : a9 00 __ LDA #$00
51d5 : 85 0f __ STA P2 
51d7 : 85 10 __ STA P3 
51d9 : 20 14 24 JSR $2414 ; (memset.s4 + 0)
51dc : a9 00 __ LDA #$00
51de : 85 4d __ STA T6 + 0 
.l7:
51e0 : 29 07 __ AND #$07
51e2 : 85 43 __ STA T0 + 0 
51e4 : a5 4d __ LDA T6 + 0 
51e6 : 29 f8 __ AND #$f8
51e8 : 85 1b __ STA ACCU + 0 
51ea : 4a __ __ LSR
51eb : 4a __ __ LSR
51ec : 65 1b __ ADC ACCU + 0 
51ee : 4a __ __ LSR
51ef : 6a __ __ ROR
51f0 : 6a __ __ ROR
51f1 : aa __ __ TAX
51f2 : 29 c0 __ AND #$c0
51f4 : 6a __ __ ROR
51f5 : 05 43 __ ORA T0 + 0 
51f7 : 85 4e __ STA T7 + 0 
51f9 : 8a __ __ TXA
51fa : 29 1f __ AND #$1f
51fc : 09 e0 __ ORA #$e0
51fe : 85 4f __ STA T7 + 1 
5200 : a0 05 __ LDY #$05
5202 : b1 13 __ LDA (P6),y ; (f + 0)
5204 : 85 1b __ STA ACCU + 0 
5206 : a9 00 __ LDA #$00
5208 : 85 52 __ STA T9 + 0 
520a : 85 1c __ STA ACCU + 1 
520c : a5 4d __ LDA T6 + 0 
520e : 20 9e 77 JSR $779e ; (mul16by8 + 0)
5211 : a0 02 __ LDY #$02
5213 : b1 13 __ LDA (P6),y ; (f + 0)
5215 : 18 __ __ CLC
5216 : 65 1b __ ADC ACCU + 0 
5218 : 85 50 __ STA T8 + 0 
521a : c8 __ __ INY
521b : b1 13 __ LDA (P6),y ; (f + 0)
521d : 65 1c __ ADC ACCU + 1 
521f : 85 51 __ STA T8 + 1 
.l8:
5221 : a0 04 __ LDY #$04
5223 : b1 13 __ LDA (P6),y ; (f + 0)
5225 : 85 1b __ STA ACCU + 0 
5227 : a9 00 __ LDA #$00
5229 : 85 1c __ STA ACCU + 1 
522b : a5 52 __ LDA T9 + 0 
522d : 20 9e 77 JSR $779e ; (mul16by8 + 0)
5230 : a0 00 __ LDY #$00
5232 : b1 13 __ LDA (P6),y ; (f + 0)
5234 : 18 __ __ CLC
5235 : 65 1b __ ADC ACCU + 0 
5237 : 85 49 __ STA T3 + 0 
5239 : 85 53 __ STA T10 + 0 
523b : c8 __ __ INY
523c : b1 13 __ LDA (P6),y ; (f + 0)
523e : 65 1c __ ADC ACCU + 1 
5240 : 85 4a __ STA T3 + 1 
5242 : 85 54 __ STA T10 + 1 
5244 : a5 57 __ LDA T12 + 0 
5246 : d0 11 __ BNE $5259 ; (render.s23 + 0)
.s9:
5248 : 85 49 __ STA T3 + 0 
524a : 85 4a __ STA T3 + 1 
524c : 85 4b __ STA T4 + 0 
524e : 85 4c __ STA T4 + 1 
5250 : a5 50 __ LDA T8 + 0 
5252 : 85 55 __ STA T11 + 0 
5254 : a5 51 __ LDA T8 + 1 
5256 : 4c 74 52 JMP $5274 ; (render.s10 + 0)
.s23:
5259 : a5 50 __ LDA T8 + 0 
525b : 85 4b __ STA T4 + 0 
525d : a5 51 __ LDA T8 + 1 
525f : 85 4c __ STA T4 + 1 
5261 : a0 06 __ LDY #$06
5263 : b1 13 __ LDA (P6),y ; (f + 0)
5265 : 85 53 __ STA T10 + 0 
5267 : c8 __ __ INY
5268 : b1 13 __ LDA (P6),y ; (f + 0)
526a : 85 54 __ STA T10 + 1 
526c : c8 __ __ INY
526d : b1 13 __ LDA (P6),y ; (f + 0)
526f : 85 55 __ STA T11 + 0 
5271 : c8 __ __ INY
5272 : b1 13 __ LDA (P6),y ; (f + 0)
.s10:
5274 : 85 56 __ STA T11 + 1 
5276 : a9 00 __ LDA #$00
5278 : 85 58 __ STA T13 + 0 
.l11:
527a : a6 49 __ LDX T3 + 0 
527c : a5 4a __ LDA T3 + 1 
527e : 10 0a __ BPL $528a ; (render.s12 + 0)
.s22:
5280 : 38 __ __ SEC
5281 : a9 00 __ LDA #$00
5283 : e5 49 __ SBC T3 + 0 
5285 : aa __ __ TAX
5286 : a9 00 __ LDA #$00
5288 : e5 4a __ SBC T3 + 1 
.s12:
528a : 86 0d __ STX P0 
528c : 86 0f __ STX P2 
528e : 85 0e __ STA P1 
5290 : 85 10 __ STA P3 
5292 : 20 9e 53 JSR $539e ; (lmul16u.s4 + 0)
5295 : a5 1b __ LDA ACCU + 0 
5297 : 85 45 __ STA T2 + 0 
5299 : a5 1c __ LDA ACCU + 1 
529b : 85 46 __ STA T2 + 1 
529d : a5 1d __ LDA ACCU + 2 
529f : 85 47 __ STA T2 + 2 
52a1 : a5 1e __ LDA ACCU + 3 
52a3 : 85 48 __ STA T2 + 3 
52a5 : a6 4b __ LDX T4 + 0 
52a7 : a5 4c __ LDA T4 + 1 
52a9 : 10 0a __ BPL $52b5 ; (render.s13 + 0)
.s21:
52ab : 38 __ __ SEC
52ac : a9 00 __ LDA #$00
52ae : e5 4b __ SBC T4 + 0 
52b0 : aa __ __ TAX
52b1 : a9 00 __ LDA #$00
52b3 : e5 4c __ SBC T4 + 1 
.s13:
52b5 : 86 0d __ STX P0 
52b7 : 86 0f __ STX P2 
52b9 : 85 0e __ STA P1 
52bb : 85 10 __ STA P3 
52bd : 20 9e 53 JSR $539e ; (lmul16u.s4 + 0)
52c0 : 18 __ __ CLC
52c1 : a5 1b __ LDA ACCU + 0 
52c3 : 65 45 __ ADC T2 + 0 
52c5 : a5 1c __ LDA ACCU + 1 
52c7 : 65 46 __ ADC T2 + 1 
52c9 : a5 1d __ LDA ACCU + 2 
52cb : 65 47 __ ADC T2 + 2 
52cd : a5 1e __ LDA ACCU + 3 
52cf : 65 48 __ ADC T2 + 3 
52d1 : c9 04 __ CMP #$04
52d3 : 90 1b __ BCC $52f0 ; (render.s14 + 0)
.s20:
52d5 : a5 58 __ LDA T13 + 0 
52d7 : 4a __ __ LSR
52d8 : 4a __ __ LSR
52d9 : 85 1b __ STA ACCU + 0 
52db : a9 00 __ LDA #$00
52dd : 85 1c __ STA ACCU + 1 
52df : 85 04 __ STA WORK + 1 
52e1 : a9 03 __ LDA #$03
52e3 : 85 03 __ STA WORK + 0 
52e5 : 20 8d 78 JSR $788d ; (divmod + 0)
52e8 : 18 __ __ CLC
52e9 : a5 05 __ LDA WORK + 2 
52eb : 69 01 __ ADC #$01
52ed : 4c 4f 53 JMP $534f ; (render.s18 + 0)
.s14:
52f0 : a5 49 __ LDA T3 + 0 
52f2 : 85 0d __ STA P0 
52f4 : a5 4a __ LDA T3 + 1 
52f6 : 85 0e __ STA P1 
52f8 : a5 4b __ LDA T4 + 0 
52fa : 85 0f __ STA P2 
52fc : a5 4c __ LDA T4 + 1 
52fe : 85 10 __ STA P3 
5300 : 38 __ __ SEC
5301 : a5 45 __ LDA T2 + 0 
5303 : e5 1b __ SBC ACCU + 0 
5305 : a5 46 __ LDA T2 + 1 
5307 : e5 1c __ SBC ACCU + 1 
5309 : 85 43 __ STA T0 + 0 
530b : a5 47 __ LDA T2 + 2 
530d : e5 1d __ SBC ACCU + 2 
530f : 85 44 __ STA T0 + 1 
5311 : a5 48 __ LDA T2 + 3 
5313 : e5 1e __ SBC ACCU + 3 
5315 : a2 04 __ LDX #$04
.l15:
5317 : 4a __ __ LSR
5318 : 66 44 __ ROR T0 + 1 
531a : 66 43 __ ROR T0 + 0 
531c : ca __ __ DEX
531d : d0 f8 __ BNE $5317 ; (render.l15 + 0)
.s16:
531f : 18 __ __ CLC
5320 : a5 43 __ LDA T0 + 0 
5322 : 65 53 __ ADC T10 + 0 
5324 : 85 49 __ STA T3 + 0 
5326 : a5 44 __ LDA T0 + 1 
5328 : 65 54 __ ADC T10 + 1 
532a : 85 4a __ STA T3 + 1 
532c : 20 c5 53 JSR $53c5 ; (lmul4f12s.s4 + 0)
532f : a5 1b __ LDA ACCU + 0 
5331 : 0a __ __ ASL
5332 : a8 __ __ TAY
5333 : a5 1c __ LDA ACCU + 1 
5335 : 2a __ __ ROL
5336 : aa __ __ TAX
5337 : 98 __ __ TYA
5338 : 18 __ __ CLC
5339 : 65 55 __ ADC T11 + 0 
533b : 85 4b __ STA T4 + 0 
533d : 8a __ __ TXA
533e : 65 56 __ ADC T11 + 1 
5340 : 85 4c __ STA T4 + 1 
5342 : e6 58 __ INC T13 + 0 
5344 : a5 58 __ LDA T13 + 0 
5346 : c9 20 __ CMP #$20
5348 : b0 03 __ BCS $534d ; (render.s17 + 0)
534a : 4c 7a 52 JMP $527a ; (render.l11 + 0)
.s17:
534d : a9 00 __ LDA #$00
.s18:
534f : aa __ __ TAX
5350 : a5 52 __ LDA T9 + 0 
5352 : 29 03 __ AND #$03
5354 : 0a __ __ ASL
5355 : a8 __ __ TAY
5356 : b9 de 7b LDA $7bde,y ; (__shrtab192L + 0)
5359 : 85 1b __ STA ACCU + 0 
535b : 49 ff __ EOR #$ff
535d : 85 45 __ STA T2 + 0 
535f : a5 52 __ LDA T9 + 0 
5361 : 29 fc __ AND #$fc
5363 : 0a __ __ ASL
5364 : 85 49 __ STA T3 + 0 
5366 : a5 4f __ LDA T7 + 1 
5368 : 69 00 __ ADC #$00
536a : 85 4a __ STA T3 + 1 
536c : a4 4e __ LDY T7 + 0 
536e : b1 49 __ LDA (T3 + 0),y 
5370 : 25 45 __ AND T2 + 0 
5372 : 85 45 __ STA T2 + 0 
5374 : bd f8 7d LDA $7df8,x ; (cbytes[0] + 0)
5377 : 25 1b __ AND ACCU + 0 
5379 : 05 45 __ ORA T2 + 0 
537b : 91 49 __ STA (T3 + 0),y 
537d : e6 52 __ INC T9 + 0 
537f : a5 52 __ LDA T9 + 0 
5381 : c9 a0 __ CMP #$a0
5383 : b0 03 __ BCS $5388 ; (render.s19 + 0)
5385 : 4c 21 52 JMP $5221 ; (render.l8 + 0)
.s19:
5388 : e6 4d __ INC T6 + 0 
538a : a5 4d __ LDA T6 + 0 
538c : c9 c8 __ CMP #$c8
538e : b0 03 __ BCS $5393 ; (render.s3 + 0)
5390 : 4c e0 51 JMP $51e0 ; (render.l7 + 0)
.s3:
5393 : a2 05 __ LDX #$05
5395 : bd da bf LDA $bfda,x ; (render@stack + 0)
5398 : 95 53 __ STA T10 + 0,x 
539a : ca __ __ DEX
539b : 10 f8 __ BPL $5395 ; (render.s3 + 2)
539d : 60 __ __ RTS
--------------------------------------------------------------------
lmul16u: ; lmul16u(u16,u16)->u32
;   5, "/home/xahmol/oscar64/include/fixmath.h"
.s4:
539e : a9 00 __ LDA #$00
53a0 : 85 1d __ STA ACCU + 2 
53a2 : 85 1e __ STA ACCU + 3 
53a4 : a2 10 __ LDX #$10
53a6 : 46 0e __ LSR P1 
53a8 : 66 0d __ ROR P0 
53aa : 90 0d __ BCC $53b9 ; (lmul16u.s4 + 27)
53ac : 18 __ __ CLC
53ad : a5 1d __ LDA ACCU + 2 
53af : 65 0f __ ADC P2 
53b1 : 85 1d __ STA ACCU + 2 
53b3 : a5 1e __ LDA ACCU + 3 
53b5 : 65 10 __ ADC P3 
53b7 : 85 1e __ STA ACCU + 3 
53b9 : 66 1e __ ROR ACCU + 3 
53bb : 66 1d __ ROR ACCU + 2 
53bd : 66 1c __ ROR ACCU + 1 
53bf : 66 1b __ ROR ACCU + 0 
53c1 : ca __ __ DEX
53c2 : d0 e2 __ BNE $53a6 ; (lmul16u.s4 + 8)
.s3:
53c4 : 60 __ __ RTS
--------------------------------------------------------------------
lmul4f12s: ; lmul4f12s(i16,i16)->i16
;  18, "/home/xahmol/oscar64/include/fixmath.h"
.s4:
53c5 : 38 __ __ SEC
53c6 : a5 0d __ LDA P0 
53c8 : 6a __ __ ROR
53c9 : 85 1b __ STA ACCU + 0 
53cb : a9 00 __ LDA #$00
53cd : 85 1c __ STA ACCU + 1 
53cf : 90 0b __ BCC $53dc ; (lmul4f12s.s4 + 23)
53d1 : a8 __ __ TAY
53d2 : 18 __ __ CLC
53d3 : a5 1c __ LDA ACCU + 1 
53d5 : 65 0f __ ADC P2 
53d7 : 85 1c __ STA ACCU + 1 
53d9 : 98 __ __ TYA
53da : 65 10 __ ADC P3 
53dc : 6a __ __ ROR
53dd : 66 1c __ ROR ACCU + 1 
53df : 46 1b __ LSR ACCU + 0 
53e1 : 90 f9 __ BCC $53dc ; (lmul4f12s.s4 + 23)
53e3 : d0 ec __ BNE $53d1 ; (lmul4f12s.s4 + 12)
53e5 : a6 0e __ LDX P1 
53e7 : 86 1b __ STX ACCU + 0 
53e9 : a2 07 __ LDX #$07
53eb : 46 1b __ LSR ACCU + 0 
53ed : 90 0b __ BCC $53fa ; (lmul4f12s.s4 + 53)
53ef : a8 __ __ TAY
53f0 : 18 __ __ CLC
53f1 : a5 1c __ LDA ACCU + 1 
53f3 : 65 0f __ ADC P2 
53f5 : 85 1c __ STA ACCU + 1 
53f7 : 98 __ __ TYA
53f8 : 65 10 __ ADC P3 
53fa : 6a __ __ ROR
53fb : 66 1c __ ROR ACCU + 1 
53fd : 66 1b __ ROR ACCU + 0 
53ff : ca __ __ DEX
5400 : d0 eb __ BNE $53ed ; (lmul4f12s.s4 + 40)
5402 : 90 0a __ BCC $540e ; (lmul4f12s.s4 + 73)
5404 : a8 __ __ TAY
5405 : a5 1c __ LDA ACCU + 1 
5407 : e5 0f __ SBC P2 
5409 : 85 1c __ STA ACCU + 1 
540b : 98 __ __ TYA
540c : e5 10 __ SBC P3 
540e : 6a __ __ ROR
540f : 66 1c __ ROR ACCU + 1 
5411 : 66 1b __ ROR ACCU + 0 
5413 : 24 10 __ BIT P3 
5415 : 10 0b __ BPL $5422 ; (lmul4f12s.s4 + 93)
5417 : aa __ __ TAX
5418 : 38 __ __ SEC
5419 : a5 1c __ LDA ACCU + 1 
541b : e5 0d __ SBC P0 
541d : 85 1c __ STA ACCU + 1 
541f : 8a __ __ TXA
5420 : e5 0e __ SBC P1 
5422 : 4a __ __ LSR
5423 : 66 1c __ ROR ACCU + 1 
5425 : 66 1b __ ROR ACCU + 0 
5427 : 4a __ __ LSR
5428 : 66 1c __ ROR ACCU + 1 
542a : 66 1b __ ROR ACCU + 0 
542c : 4a __ __ LSR
542d : 66 1c __ ROR ACCU + 1 
542f : 66 1b __ ROR ACCU + 0 
5431 : 4a __ __ LSR
5432 : 66 1c __ ROR ACCU + 1 
5434 : 66 1b __ ROR ACCU + 0 
.s3:
5436 : 60 __ __ RTS
--------------------------------------------------------------------
colorize_standard: ; colorize_standard(const const struct S#29245[]*)->void
; 137, "/home/xahmol/git/UltimateDemo2026/src/mandel.c"
.s4:
5437 : a9 00 __ LDA #$00
5439 : 85 43 __ STA T0 + 0 
543b : 85 44 __ STA T1 + 0 
543d : 85 46 __ STA T2 + 0 
543f : 85 48 __ STA T3 + 0 
5441 : a9 e0 __ LDA #$e0
5443 : 85 45 __ STA T1 + 1 
5445 : a9 c0 __ LDA #$c0
5447 : 85 47 __ STA T2 + 1 
5449 : a9 d8 __ LDA #$d8
544b : 85 49 __ STA T3 + 1 
.l5:
544d : a9 00 __ LDA #$00
544f : 85 4a __ STA T4 + 0 
.l6:
5451 : 0a __ __ ASL
5452 : 0a __ __ ASL
5453 : 0a __ __ ASL
5454 : a2 00 __ LDX #$00
5456 : 90 02 __ BCC $545a ; (colorize_standard.s51 + 0)
.s50:
5458 : e8 __ __ INX
5459 : 18 __ __ CLC
.s51:
545a : 65 44 __ ADC T1 + 0 
545c : 85 4b __ STA T5 + 0 
545e : 8a __ __ TXA
545f : 65 45 __ ADC T1 + 1 
5461 : 85 4c __ STA T5 + 1 
5463 : a9 00 __ LDA #$00
5465 : 85 1c __ STA ACCU + 1 
5467 : 85 4d __ STA T10 + 0 
5469 : 85 4e __ STA T11 + 0 
546b : aa __ __ TAX
546c : a8 __ __ TAY
.l49:
546d : b1 4b __ LDA (T5 + 0),y 
546f : 85 1b __ STA ACCU + 0 
5471 : 0a __ __ ASL
5472 : 2a __ __ ROL
5473 : 29 01 __ AND #$01
5475 : 2a __ __ ROL
5476 : d0 04 __ BNE $547c ; (colorize_standard.s43 + 0)
.s7:
5478 : e8 __ __ INX
5479 : 4c 90 54 JMP $5490 ; (colorize_standard.s8 + 0)
.s43:
547c : c9 01 __ CMP #$01
547e : d0 05 __ BNE $5485 ; (colorize_standard.s44 + 0)
.s47:
5480 : e6 1c __ INC ACCU + 1 
5482 : 4c 90 54 JMP $5490 ; (colorize_standard.s8 + 0)
.s44:
5485 : c9 02 __ CMP #$02
5487 : f0 05 __ BEQ $548e ; (colorize_standard.s46 + 0)
.s45:
5489 : e6 4e __ INC T11 + 0 
548b : 4c 90 54 JMP $5490 ; (colorize_standard.s8 + 0)
.s46:
548e : e6 4d __ INC T10 + 0 
.s8:
5490 : a5 1b __ LDA ACCU + 0 
5492 : 29 30 __ AND #$30
5494 : 4a __ __ LSR
5495 : 4a __ __ LSR
5496 : 4a __ __ LSR
5497 : 4a __ __ LSR
5498 : d0 04 __ BNE $549e ; (colorize_standard.s38 + 0)
.s9:
549a : e8 __ __ INX
549b : 4c b2 54 JMP $54b2 ; (colorize_standard.s10 + 0)
.s38:
549e : c9 01 __ CMP #$01
54a0 : d0 05 __ BNE $54a7 ; (colorize_standard.s39 + 0)
.s42:
54a2 : e6 1c __ INC ACCU + 1 
54a4 : 4c b2 54 JMP $54b2 ; (colorize_standard.s10 + 0)
.s39:
54a7 : c9 02 __ CMP #$02
54a9 : f0 05 __ BEQ $54b0 ; (colorize_standard.s41 + 0)
.s40:
54ab : e6 4e __ INC T11 + 0 
54ad : 4c b2 54 JMP $54b2 ; (colorize_standard.s10 + 0)
.s41:
54b0 : e6 4d __ INC T10 + 0 
.s10:
54b2 : a5 1b __ LDA ACCU + 0 
54b4 : 29 0c __ AND #$0c
54b6 : 4a __ __ LSR
54b7 : 4a __ __ LSR
54b8 : d0 04 __ BNE $54be ; (colorize_standard.s33 + 0)
.s11:
54ba : e8 __ __ INX
54bb : 4c d2 54 JMP $54d2 ; (colorize_standard.s12 + 0)
.s33:
54be : c9 01 __ CMP #$01
54c0 : d0 05 __ BNE $54c7 ; (colorize_standard.s34 + 0)
.s37:
54c2 : e6 1c __ INC ACCU + 1 
54c4 : 4c d2 54 JMP $54d2 ; (colorize_standard.s12 + 0)
.s34:
54c7 : c9 02 __ CMP #$02
54c9 : f0 05 __ BEQ $54d0 ; (colorize_standard.s36 + 0)
.s35:
54cb : e6 4e __ INC T11 + 0 
54cd : 4c d2 54 JMP $54d2 ; (colorize_standard.s12 + 0)
.s36:
54d0 : e6 4d __ INC T10 + 0 
.s12:
54d2 : a5 1b __ LDA ACCU + 0 
54d4 : 29 03 __ AND #$03
54d6 : d0 04 __ BNE $54dc ; (colorize_standard.s28 + 0)
.s13:
54d8 : e8 __ __ INX
54d9 : 4c f0 54 JMP $54f0 ; (colorize_standard.s14 + 0)
.s28:
54dc : c9 01 __ CMP #$01
54de : d0 05 __ BNE $54e5 ; (colorize_standard.s29 + 0)
.s32:
54e0 : e6 1c __ INC ACCU + 1 
54e2 : 4c f0 54 JMP $54f0 ; (colorize_standard.s14 + 0)
.s29:
54e5 : c9 02 __ CMP #$02
54e7 : f0 05 __ BEQ $54ee ; (colorize_standard.s31 + 0)
.s30:
54e9 : e6 4e __ INC T11 + 0 
54eb : 4c f0 54 JMP $54f0 ; (colorize_standard.s14 + 0)
.s31:
54ee : e6 4d __ INC T10 + 0 
.s14:
54f0 : c8 __ __ INY
54f1 : c0 08 __ CPY #$08
54f3 : b0 03 __ BCS $54f8 ; (colorize_standard.s15 + 0)
54f5 : 4c 6d 54 JMP $546d ; (colorize_standard.l49 + 0)
.s15:
54f8 : 18 __ __ CLC
54f9 : a5 4d __ LDA T10 + 0 
54fb : 65 1c __ ADC ACCU + 1 
54fd : 85 4b __ STA T5 + 0 
54ff : a9 00 __ LDA #$00
5501 : 2a __ __ ROL
5502 : a8 __ __ TAY
5503 : a5 4b __ LDA T5 + 0 
5505 : 65 4e __ ADC T11 + 0 
5507 : 85 4b __ STA T5 + 0 
5509 : 98 __ __ TYA
550a : 69 00 __ ADC #$00
550c : 05 4b __ ORA T5 + 0 
550e : f0 02 __ BEQ $5512 ; (colorize_standard.s53 + 0)
.s52:
5510 : a9 01 __ LDA #$01
.s53:
5512 : 85 4b __ STA T5 + 0 
5514 : 8a __ __ TXA
5515 : f0 03 __ BEQ $551a ; (colorize_standard.s16 + 0)
5517 : 4c b9 55 JMP $55b9 ; (colorize_standard.s26 + 0)
.s16:
551a : a5 4b __ LDA T5 + 0 
551c : f0 22 __ BEQ $5540 ; (colorize_standard.s17 + 0)
.s19:
551e : a5 1c __ LDA ACCU + 1 
5520 : c5 4d __ CMP T10 + 0 
5522 : b0 04 __ BCS $5528 ; (colorize_standard.s20 + 0)
.s25:
5524 : a9 02 __ LDA #$02
5526 : 90 02 __ BCC $552a ; (colorize_standard.s21 + 0)
.s20:
5528 : a9 01 __ LDA #$01
.s21:
552a : 85 4b __ STA T5 + 0 
552c : a5 4d __ LDA T10 + 0 
552e : c5 4e __ CMP T11 + 0 
5530 : b0 06 __ BCS $5538 ; (colorize_standard.s22 + 0)
.s23:
5532 : a5 1c __ LDA ACCU + 1 
5534 : c5 4e __ CMP T11 + 0 
5536 : 90 04 __ BCC $553c ; (colorize_standard.s24 + 0)
.s22:
5538 : c6 4b __ DEC T5 + 0 
553a : b0 04 __ BCS $5540 ; (colorize_standard.s17 + 0)
.s24:
553c : a9 02 __ LDA #$02
.s48:
553e : 85 4b __ STA T5 + 0 
.s17:
5540 : 18 __ __ CLC
5541 : a5 4a __ LDA T4 + 0 
5543 : 65 43 __ ADC T0 + 0 
5545 : 0a __ __ ASL
5546 : 0a __ __ ASL
5547 : 85 1b __ STA ACCU + 0 
5549 : a9 00 __ LDA #$00
554b : 85 1c __ STA ACCU + 1 
554d : 85 04 __ STA WORK + 1 
554f : a9 41 __ LDA #$41
5551 : 85 03 __ STA WORK + 0 
5553 : 20 8d 78 JSR $788d ; (divmod + 0)
5556 : a6 1b __ LDX ACCU + 0 
5558 : bd e5 7b LDA $7be5,x ; (__multab12L + 0)
555b : 18 __ __ CLC
555c : 65 0d __ ADC P0 ; (pal + 0)
555e : 85 1b __ STA ACCU + 0 
5560 : a5 0e __ LDA P1 ; (pal + 1)
5562 : 69 00 __ ADC #$00
5564 : aa __ __ TAX
5565 : a4 4b __ LDY T5 + 0 
5567 : b9 e9 7b LDA $7be9,y ; (__multab3L + 0)
556a : 18 __ __ CLC
556b : 65 1b __ ADC ACCU + 0 
556d : 85 1b __ STA ACCU + 0 
556f : 90 01 __ BCC $5572 ; (colorize_standard.s55 + 0)
.s54:
5571 : e8 __ __ INX
.s55:
5572 : 86 1c __ STX ACCU + 1 
5574 : a0 00 __ LDY #$00
5576 : b1 1b __ LDA (ACCU + 0),y 
5578 : 0a __ __ ASL
5579 : 0a __ __ ASL
557a : 0a __ __ ASL
557b : 0a __ __ ASL
557c : c8 __ __ INY
557d : 11 1b __ ORA (ACCU + 0),y 
557f : 88 __ __ DEY
5580 : 91 46 __ STA (T2 + 0),y 
5582 : a0 02 __ LDY #$02
5584 : b1 1b __ LDA (ACCU + 0),y 
5586 : a0 00 __ LDY #$00
5588 : 91 48 __ STA (T3 + 0),y 
558a : e6 46 __ INC T2 + 0 
558c : d0 02 __ BNE $5590 ; (colorize_standard.s57 + 0)
.s56:
558e : e6 47 __ INC T2 + 1 
.s57:
5590 : e6 48 __ INC T3 + 0 
5592 : d0 02 __ BNE $5596 ; (colorize_standard.s59 + 0)
.s58:
5594 : e6 49 __ INC T3 + 1 
.s59:
5596 : e6 4a __ INC T4 + 0 
5598 : a5 4a __ LDA T4 + 0 
559a : c9 28 __ CMP #$28
559c : f0 03 __ BEQ $55a1 ; (colorize_standard.s18 + 0)
559e : 4c 51 54 JMP $5451 ; (colorize_standard.l6 + 0)
.s18:
55a1 : a5 44 __ LDA T1 + 0 
55a3 : 69 3f __ ADC #$3f
55a5 : 85 44 __ STA T1 + 0 
55a7 : a5 45 __ LDA T1 + 1 
55a9 : 69 01 __ ADC #$01
55ab : 85 45 __ STA T1 + 1 
55ad : e6 43 __ INC T0 + 0 
55af : a5 43 __ LDA T0 + 0 
55b1 : c9 19 __ CMP #$19
55b3 : f0 03 __ BEQ $55b8 ; (colorize_standard.s3 + 0)
55b5 : 4c 4d 54 JMP $544d ; (colorize_standard.l5 + 0)
.s3:
55b8 : 60 __ __ RTS
.s26:
55b9 : a5 4b __ LDA T5 + 0 
55bb : f0 83 __ BEQ $5540 ; (colorize_standard.s17 + 0)
.s27:
55bd : a9 03 __ LDA #$03
55bf : 4c 3e 55 JMP $553e ; (colorize_standard.s48 + 0)
--------------------------------------------------------------------
ball_run: ; ball_run()->void
;   3, "/home/xahmol/git/UltimateDemo2026/src/ball.h"
.s1:
55c2 : a2 0d __ LDX #$0d
55c4 : b5 53 __ LDA T0 + 0,x 
55c6 : 9d af bf STA $bfaf,x ; (ball_run@stack + 0)
55c9 : ca __ __ DEX
55ca : 10 f8 __ BPL $55c4 ; (ball_run.s1 + 2)
.s4:
55cc : a9 8f __ LDA #$8f
55ce : 20 73 16 JSR $1673 ; (turbo_set.s4 + 0)
55d1 : 20 7f 57 JSR $577f ; (ball_init.s4 + 0)
55d4 : a9 00 __ LDA #$00
55d6 : 85 55 __ STA T1 + 0 
55d8 : 85 56 __ STA T2 + 0 
55da : 85 57 __ STA T3 + 0 
55dc : 85 58 __ STA T4 + 0 
55de : 85 59 __ STA T5 + 0 
55e0 : a9 a8 __ LDA #$a8
55e2 : 85 5a __ STA T6 + 0 
55e4 : a9 fd __ LDA #$fd
55e6 : 85 5b __ STA T6 + 1 
.l5:
55e8 : 2c 11 d0 BIT $d011 
55eb : 30 fb __ BMI $55e8 ; (ball_run.l5 + 0)
.l6:
55ed : 2c 11 d0 BIT $d011 
55f0 : 10 fb __ BPL $55ed ; (ball_run.l6 + 0)
.s7:
55f2 : a9 00 __ LDA #$00
55f4 : 85 0f __ STA P2 
55f6 : 85 10 __ STA P3 
55f8 : 85 0d __ STA P0 
55fa : 20 45 7c JSR $7c45 ; (memset@proxy + 0)
55fd : a5 55 __ LDA T1 + 0 
55ff : 29 3f __ AND #$3f
5601 : aa __ __ TAX
5602 : bd 4b 80 LDA $804b,x ; (sin64[0] + 0)
5605 : 85 5c __ STA T7 + 0 
5607 : 29 80 __ AND #$80
5609 : 10 02 __ BPL $560d ; (ball_run.s7 + 27)
560b : a9 ff __ LDA #$ff
560d : 85 5d __ STA T7 + 1 
560f : bd 4b 80 LDA $804b,x ; (sin64[0] + 0)
5612 : 10 0d __ BPL $5621 ; (ball_run.s8 + 0)
.s10:
5614 : 38 __ __ SEC
5615 : a9 00 __ LDA #$00
5617 : e5 5c __ SBC T7 + 0 
5619 : 85 5c __ STA T7 + 0 
561b : a9 00 __ LDA #$00
561d : e5 5d __ SBC T7 + 1 
561f : 85 5d __ STA T7 + 1 
.s8:
5621 : a5 58 __ LDA T4 + 0 
5623 : 85 18 __ STA P11 
5625 : a5 57 __ LDA T3 + 0 
5627 : 29 3f __ AND #$3f
5629 : aa __ __ TAX
562a : bd 4b 80 LDA $804b,x ; (sin64[0] + 0)
562d : 85 60 __ STA T9 + 0 
562f : a5 56 __ LDA T2 + 0 
5631 : 29 3f __ AND #$3f
5633 : aa __ __ TAX
5634 : bd 4b 80 LDA $804b,x ; (sin64[0] + 0)
5637 : 85 53 __ STA T0 + 0 
5639 : 29 80 __ AND #$80
563b : 10 02 __ BPL $563f ; (ball_run.s8 + 30)
563d : a9 ff __ LDA #$ff
563f : 85 54 __ STA T0 + 1 
5641 : 20 d8 57 JSR $57d8 ; (draw_floor.s4 + 0)
5644 : a5 53 __ LDA T0 + 0 
5646 : 0a __ __ ASL
5647 : 85 1b __ STA ACCU + 0 
5649 : a5 54 __ LDA T0 + 1 
564b : 2a __ __ ROL
564c : 06 1b __ ASL ACCU + 0 
564e : 2a __ __ ROL
564f : aa __ __ TAX
5650 : 18 __ __ CLC
5651 : a5 1b __ LDA ACCU + 0 
5653 : 65 53 __ ADC T0 + 0 
5655 : 85 1b __ STA ACCU + 0 
5657 : 8a __ __ TXA
5658 : 65 54 __ ADC T0 + 1 
565a : 06 1b __ ASL ACCU + 0 
565c : 2a __ __ ROL
565d : 06 1b __ ASL ACCU + 0 
565f : 2a __ __ ROL
5660 : 06 1b __ ASL ACCU + 0 
5662 : 2a __ __ ROL
5663 : 06 1b __ ASL ACCU + 0 
5665 : 2a __ __ ROL
5666 : 85 1c __ STA ACCU + 1 
5668 : 20 84 7c JSR $7c84 ; (divs16@proxy + 0)
566b : 18 __ __ CLC
566c : a5 1b __ LDA ACCU + 0 
566e : 69 f0 __ ADC #$f0
5670 : 85 5e __ STA T8 + 0 
5672 : a5 1c __ LDA ACCU + 1 
5674 : 69 00 __ ADC #$00
5676 : 85 5f __ STA T8 + 1 
5678 : a5 60 __ LDA T9 + 0 
567a : 85 1b __ STA ACCU + 0 
567c : 29 80 __ AND #$80
567e : 10 02 __ BPL $5682 ; (ball_run.s8 + 97)
5680 : a9 ff __ LDA #$ff
5682 : 85 1c __ STA ACCU + 1 
5684 : a9 1e __ LDA #$1e
5686 : 20 9e 77 JSR $779e ; (mul16by8 + 0)
5689 : 20 84 7c JSR $7c84 ; (divs16@proxy + 0)
568c : a9 b4 __ LDA #$b4
568e : 20 9e 77 JSR $779e ; (mul16by8 + 0)
5691 : 20 5f 7c JSR $7c5f ; (divs16@proxy + 0)
5694 : 18 __ __ CLC
5695 : a5 1b __ LDA ACCU + 0 
5697 : 69 50 __ ADC #$50
5699 : 85 12 __ STA P5 
569b : a5 1c __ LDA ACCU + 1 
569d : 69 00 __ ADC #$00
569f : 85 13 __ STA P6 
56a1 : a9 50 __ LDA #$50
56a3 : 85 1b __ STA ACCU + 0 
56a5 : a9 46 __ LDA #$46
56a7 : 85 1c __ STA ACCU + 1 
56a9 : 20 5f 7c JSR $7c5f ; (divs16@proxy + 0)
56ac : 18 __ __ CLC
56ad : a5 1b __ LDA ACCU + 0 
56af : 69 48 __ ADC #$48
56b1 : 85 14 __ STA P7 
56b3 : a5 1c __ LDA ACCU + 1 
56b5 : 69 00 __ ADC #$00
56b7 : 85 15 __ STA P8 
56b9 : a9 a0 __ LDA #$a0
56bb : 85 1b __ STA ACCU + 0 
56bd : a9 05 __ LDA #$05
56bf : 85 1c __ STA ACCU + 1 
56c1 : 20 5f 7c JSR $7c5f ; (divs16@proxy + 0)
56c4 : a5 1b __ LDA ACCU + 0 
56c6 : 85 16 __ STA P9 
56c8 : a5 1c __ LDA ACCU + 1 
56ca : 85 17 __ STA P10 
56cc : a9 1c __ LDA #$1c
56ce : 85 1b __ STA ACCU + 0 
56d0 : a9 02 __ LDA #$02
56d2 : 85 1c __ STA ACCU + 1 
56d4 : 20 5f 7c JSR $7c5f ; (divs16@proxy + 0)
56d7 : a5 1b __ LDA ACCU + 0 
56d9 : 8d ea bf STA $bfea ; (sstack + 0)
56dc : a5 1c __ LDA ACCU + 1 
56de : 8d eb bf STA $bfeb ; (sstack + 1)
56e1 : 20 37 5c JSR $5c37 ; (draw_shadow.s4 + 0)
56e4 : a5 12 __ LDA P5 
56e6 : 8d ea bf STA $bfea ; (sstack + 0)
56e9 : a5 13 __ LDA P6 
56eb : 8d eb bf STA $bfeb ; (sstack + 1)
56ee : a5 59 __ LDA T5 + 0 
56f0 : 8d ee bf STA $bfee ; (sstack + 4)
56f3 : 18 __ __ CLC
56f4 : 69 02 __ ADC #$02
56f6 : 85 59 __ STA T5 + 0 
56f8 : a5 5c __ LDA T7 + 0 
56fa : 85 1b __ STA ACCU + 0 
56fc : a5 5d __ LDA T7 + 1 
56fe : 85 1c __ STA ACCU + 1 
5700 : a9 3c __ LDA #$3c
5702 : 20 9e 77 JSR $779e ; (mul16by8 + 0)
5705 : a9 7f __ LDA #$7f
5707 : 85 03 __ STA WORK + 0 
5709 : 20 89 78 JSR $7889 ; (divmod@proxy + 0)
570c : 38 __ __ SEC
570d : a9 64 __ LDA #$64
570f : e5 1b __ SBC ACCU + 0 
5711 : 85 1b __ STA ACCU + 0 
5713 : a9 00 __ LDA #$00
5715 : 85 1c __ STA ACCU + 1 
5717 : a9 b4 __ LDA #$b4
5719 : 20 9e 77 JSR $779e ; (mul16by8 + 0)
571c : 20 5f 7c JSR $7c5f ; (divs16@proxy + 0)
571f : 18 __ __ CLC
5720 : a5 1b __ LDA ACCU + 0 
5722 : 69 48 __ ADC #$48
5724 : 8d ec bf STA $bfec ; (sstack + 2)
5727 : a5 1c __ LDA ACCU + 1 
5729 : 69 00 __ ADC #$00
572b : 8d ed bf STA $bfed ; (sstack + 3)
572e : a9 40 __ LDA #$40
5730 : 85 1b __ STA ACCU + 0 
5732 : a9 0b __ LDA #$0b
5734 : 85 1c __ STA ACCU + 1 
5736 : 20 5f 7c JSR $7c5f ; (divs16@proxy + 0)
5739 : a5 1b __ LDA ACCU + 0 
573b : 8d ef bf STA $bfef ; (sstack + 5)
573e : a5 1c __ LDA ACCU + 1 
5740 : 8d f0 bf STA $bff0 ; (sstack + 6)
5743 : 20 d0 5d JSR $5dd0 ; (draw_ball.s1 + 0)
5746 : e6 58 __ INC T4 + 0 
5748 : e6 57 __ INC T3 + 0 
574a : e6 57 __ INC T3 + 0 
574c : e6 56 __ INC T2 + 0 
574e : e6 55 __ INC T1 + 0 
5750 : e6 55 __ INC T1 + 0 
5752 : e6 5a __ INC T6 + 0 
5754 : f0 03 __ BEQ $5759 ; (ball_run.s11 + 0)
5756 : 4c e8 55 JMP $55e8 ; (ball_run.l5 + 0)
.s11:
5759 : e6 5b __ INC T6 + 1 
575b : d0 f9 __ BNE $5756 ; (ball_run.s8 + 309)
.s9:
575d : a9 00 __ LDA #$00
575f : 85 0d __ STA P0 
5761 : 85 0e __ STA P1 
5763 : 85 10 __ STA P3 
5765 : a9 36 __ LDA #$36
5767 : 85 01 __ STA $01 
5769 : 20 88 0f JSR $0f88 ; (vic_setmode@proxy + 0)
576c : a9 00 __ LDA #$00
576e : 8d 20 d0 STA $d020 
5771 : 8d 21 d0 STA $d021 
.s3:
5774 : a2 0d __ LDX #$0d
5776 : bd af bf LDA $bfaf,x ; (ball_run@stack + 0)
5779 : 95 53 __ STA T0 + 0,x 
577b : ca __ __ DEX
577c : 10 f8 __ BPL $5776 ; (ball_run.s3 + 2)
577e : 60 __ __ RTS
--------------------------------------------------------------------
ball_init: ; ball_init()->void
; 293, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
577f : 78 __ __ SEI
5780 : a9 35 __ LDA #$35
5782 : 85 01 __ STA $01 
5784 : 20 30 24 JSR $2430 ; (mmap_trampoline.s4 + 0)
5787 : 58 __ __ CLI
5788 : a9 00 __ LDA #$00
578a : 85 0f __ STA P2 
578c : 85 10 __ STA P3 
578e : 85 43 __ STA T0 + 0 
5790 : 85 0d __ STA P0 
5792 : 20 45 7c JSR $7c45 ; (memset@proxy + 0)
5795 : a9 c0 __ LDA #$c0
5797 : 85 44 __ STA T0 + 1 
5799 : a9 00 __ LDA #$00
579b : 85 1f __ STA ADDR + 0 
579d : f0 02 __ BEQ $57a1 ; (ball_init.l7 + 0)
.s8:
579f : e6 44 __ INC T0 + 1 
.l7:
57a1 : a9 12 __ LDA #$12
57a3 : a0 00 __ LDY #$00
57a5 : 91 43 __ STA (T0 + 0),y 
57a7 : 18 __ __ CLC
57a8 : a5 44 __ LDA T0 + 1 
57aa : 69 18 __ ADC #$18
57ac : 85 20 __ STA ADDR + 1 
57ae : a9 0c __ LDA #$0c
57b0 : a4 43 __ LDY T0 + 0 
57b2 : 91 1f __ STA (ADDR + 0),y 
57b4 : 98 __ __ TYA
57b5 : 18 __ __ CLC
57b6 : 69 01 __ ADC #$01
57b8 : 85 43 __ STA T0 + 0 
57ba : b0 e3 __ BCS $579f ; (ball_init.s8 + 0)
.s9:
57bc : c9 e8 __ CMP #$e8
57be : d0 e1 __ BNE $57a1 ; (ball_init.l7 + 0)
.s6:
57c0 : a5 44 __ LDA T0 + 1 
57c2 : c9 c3 __ CMP #$c3
57c4 : d0 db __ BNE $57a1 ; (ball_init.l7 + 0)
.s5:
57c6 : a9 00 __ LDA #$00
57c8 : 85 0e __ STA P1 
57ca : 85 10 __ STA P3 
57cc : 20 a5 7c JSR $7ca5 ; (vic_setmode@proxy + 0)
57cf : a9 00 __ LDA #$00
57d1 : 8d 21 d0 STA $d021 
57d4 : 8d 20 d0 STA $d020 
.s3:
57d7 : 60 __ __ RTS
--------------------------------------------------------------------
draw_floor: ; draw_floor(u8)->void
; 137, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
57d8 : a9 00 __ LDA #$00
57da : 85 51 __ STA T3 + 0 
.l5:
57dc : a5 18 __ LDA P11 ; (floor_rot + 0)
57de : 85 11 __ STA P4 
57e0 : a9 b0 __ LDA #$b0
57e2 : 85 0d __ STA P0 
57e4 : a9 ff __ LDA #$ff
57e6 : 85 0e __ STA P1 
57e8 : a5 51 __ LDA T3 + 0 
57ea : 0a __ __ ASL
57eb : aa __ __ TAX
57ec : a9 e8 __ LDA #$e8
57ee : 85 12 __ STA P5 
57f0 : a9 bf __ LDA #$bf
57f2 : 85 13 __ STA P6 
57f4 : a9 e6 __ LDA #$e6
57f6 : 85 14 __ STA P7 
57f8 : a9 bf __ LDA #$bf
57fa : 85 15 __ STA P8 
57fc : bd e5 80 LDA $80e5,x ; (gz[0] + 0)
57ff : 85 0f __ STA P2 
5801 : bd e6 80 LDA $80e6,x ; (gz[0] + 1)
5804 : 85 10 __ STA P3 
5806 : 20 d4 59 JSR $59d4 ; (rotate_y.s4 + 0)
5809 : e6 0e __ INC P1 
580b : a9 50 __ LDA #$50
580d : 85 0d __ STA P0 
580f : a9 e4 __ LDA #$e4
5811 : 85 12 __ STA P5 
5813 : a9 bf __ LDA #$bf
5815 : 85 15 __ STA P8 
5817 : a9 bf __ LDA #$bf
5819 : 85 13 __ STA P6 
581b : a9 e2 __ LDA #$e2
581d : 85 14 __ STA P7 
581f : 20 d4 59 JSR $59d4 ; (rotate_y.s4 + 0)
5822 : ad e7 bf LDA $bfe7 ; (rz0 + 1)
5825 : 30 1a __ BMI $5841 ; (draw_floor.s8 + 0)
.s21:
5827 : d0 07 __ BNE $5830 ; (draw_floor.s6 + 0)
.s20:
5829 : ad e6 bf LDA $bfe6 ; (rz0 + 0)
582c : c9 0f __ CMP #$0f
582e : 90 11 __ BCC $5841 ; (draw_floor.s8 + 0)
.s6:
5830 : ad e3 bf LDA $bfe3 ; (rz1 + 1)
5833 : 30 0c __ BMI $5841 ; (draw_floor.s8 + 0)
.s19:
5835 : f0 03 __ BEQ $583a ; (draw_floor.s18 + 0)
5837 : 4c 46 59 JMP $5946 ; (draw_floor.s7 + 0)
.s18:
583a : ad e2 bf LDA $bfe2 ; (rz1 + 0)
583d : c9 0f __ CMP #$0f
583f : b0 f6 __ BCS $5837 ; (draw_floor.s19 + 2)
.s8:
5841 : e6 51 __ INC T3 + 0 
5843 : a5 51 __ LDA T3 + 0 
5845 : c9 07 __ CMP #$07
5847 : d0 93 __ BNE $57dc ; (draw_floor.l5 + 0)
.s9:
5849 : a9 00 __ LDA #$00
584b : 85 51 __ STA T3 + 0 
.l10:
584d : a5 18 __ LDA P11 ; (floor_rot + 0)
584f : 85 11 __ STA P4 
5851 : a9 a0 __ LDA #$a0
5853 : 85 0f __ STA P2 
5855 : a9 00 __ LDA #$00
5857 : 85 10 __ STA P3 
5859 : a5 51 __ LDA T3 + 0 
585b : 0a __ __ ASL
585c : aa __ __ TAX
585d : a9 e0 __ LDA #$e0
585f : 85 12 __ STA P5 
5861 : a9 bf __ LDA #$bf
5863 : 85 13 __ STA P6 
5865 : a9 de __ LDA #$de
5867 : 85 14 __ STA P7 
5869 : a9 bf __ LDA #$bf
586b : 85 15 __ STA P8 
586d : bd 00 81 LDA $8100,x ; (gx[0] + 0)
5870 : 85 0d __ STA P0 
5872 : bd 01 81 LDA $8101,x ; (gx[0] + 1)
5875 : 85 0e __ STA P1 
5877 : 20 d4 59 JSR $59d4 ; (rotate_y.s4 + 0)
587a : e6 10 __ INC P3 
587c : a9 40 __ LDA #$40
587e : 85 0f __ STA P2 
5880 : a9 dc __ LDA #$dc
5882 : 85 12 __ STA P5 
5884 : a9 bf __ LDA #$bf
5886 : 85 15 __ STA P8 
5888 : a9 bf __ LDA #$bf
588a : 85 13 __ STA P6 
588c : a9 da __ LDA #$da
588e : 85 14 __ STA P7 
5890 : 20 d4 59 JSR $59d4 ; (rotate_y.s4 + 0)
5893 : ad df bf LDA $bfdf ; (rz0 + 1)
5896 : 30 17 __ BMI $58af ; (draw_floor.s13 + 0)
.s17:
5898 : d0 07 __ BNE $58a1 ; (draw_floor.s11 + 0)
.s16:
589a : ad de bf LDA $bfde ; (rz0 + 0)
589d : c9 0f __ CMP #$0f
589f : 90 0e __ BCC $58af ; (draw_floor.s13 + 0)
.s11:
58a1 : ad db bf LDA $bfdb ; (rz1 + 1)
58a4 : 30 09 __ BMI $58af ; (draw_floor.s13 + 0)
.s15:
58a6 : d0 10 __ BNE $58b8 ; (draw_floor.s12 + 0)
.s14:
58a8 : ad da bf LDA $bfda ; (rz1 + 0)
58ab : c9 0f __ CMP #$0f
58ad : b0 09 __ BCS $58b8 ; (draw_floor.s12 + 0)
.s13:
58af : e6 51 __ INC T3 + 0 
58b1 : a5 51 __ LDA T3 + 0 
58b3 : c9 07 __ CMP #$07
58b5 : d0 96 __ BNE $584d ; (draw_floor.l10 + 0)
.s3:
58b7 : 60 __ __ RTS
.s12:
58b8 : ad e0 bf LDA $bfe0 ; (rx0 + 0)
58bb : 85 1b __ STA ACCU + 0 
58bd : ad e1 bf LDA $bfe1 ; (rx0 + 1)
58c0 : 85 1c __ STA ACCU + 1 
58c2 : a9 b4 __ LDA #$b4
58c4 : 20 9e 77 JSR $779e ; (mul16by8 + 0)
58c7 : ad de bf LDA $bfde ; (rz0 + 0)
58ca : 85 03 __ STA WORK + 0 
58cc : ad df bf LDA $bfdf ; (rz0 + 1)
58cf : 85 04 __ STA WORK + 1 
58d1 : 20 52 78 JSR $7852 ; (divs16 + 0)
58d4 : 18 __ __ CLC
58d5 : a5 1b __ LDA ACCU + 0 
58d7 : 69 50 __ ADC #$50
58d9 : 85 12 __ STA P5 
58db : a5 1c __ LDA ACCU + 1 
58dd : 69 00 __ ADC #$00
58df : 85 13 __ STA P6 
58e1 : ad de bf LDA $bfde ; (rz0 + 0)
58e4 : 85 03 __ STA WORK + 0 
58e6 : ad df bf LDA $bfdf ; (rz0 + 1)
58e9 : 85 04 __ STA WORK + 1 
58eb : 20 8f 7c JSR $7c8f ; (divmod@proxy + 0)
58ee : 18 __ __ CLC
58ef : a5 1b __ LDA ACCU + 0 
58f1 : 69 48 __ ADC #$48
58f3 : 85 14 __ STA P7 
58f5 : a5 1c __ LDA ACCU + 1 
58f7 : 69 00 __ ADC #$00
58f9 : 85 15 __ STA P8 
58fb : ad dc bf LDA $bfdc ; (rx1 + 0)
58fe : 85 1b __ STA ACCU + 0 
5900 : ad dd bf LDA $bfdd ; (rx1 + 1)
5903 : 85 1c __ STA ACCU + 1 
5905 : a9 b4 __ LDA #$b4
5907 : 20 9e 77 JSR $779e ; (mul16by8 + 0)
590a : ad da bf LDA $bfda ; (rz1 + 0)
590d : 85 03 __ STA WORK + 0 
590f : ad db bf LDA $bfdb ; (rz1 + 1)
5912 : 85 04 __ STA WORK + 1 
5914 : 20 52 78 JSR $7852 ; (divs16 + 0)
5917 : 18 __ __ CLC
5918 : a5 1b __ LDA ACCU + 0 
591a : 69 50 __ ADC #$50
591c : 85 16 __ STA P9 
591e : a5 1c __ LDA ACCU + 1 
5920 : 69 00 __ ADC #$00
5922 : 85 17 __ STA P10 
5924 : ad da bf LDA $bfda ; (rz1 + 0)
5927 : 85 03 __ STA WORK + 0 
5929 : ad db bf LDA $bfdb ; (rz1 + 1)
592c : 85 04 __ STA WORK + 1 
592e : 20 8f 7c JSR $7c8f ; (divmod@proxy + 0)
5931 : 18 __ __ CLC
5932 : a5 1b __ LDA ACCU + 0 
5934 : 69 48 __ ADC #$48
5936 : 8d ea bf STA $bfea ; (sstack + 0)
5939 : a5 1c __ LDA ACCU + 1 
593b : 69 00 __ ADC #$00
593d : 8d eb bf STA $bfeb ; (sstack + 1)
5940 : 20 99 5a JSR $5a99 ; (mc_line.s4 + 0)
5943 : 4c af 58 JMP $58af ; (draw_floor.s13 + 0)
.s7:
5946 : ad e8 bf LDA $bfe8 ; (rx0 + 0)
5949 : 85 1b __ STA ACCU + 0 
594b : ad e9 bf LDA $bfe9 ; (rx0 + 1)
594e : 85 1c __ STA ACCU + 1 
5950 : a9 b4 __ LDA #$b4
5952 : 20 9e 77 JSR $779e ; (mul16by8 + 0)
5955 : ad e6 bf LDA $bfe6 ; (rz0 + 0)
5958 : 85 03 __ STA WORK + 0 
595a : ad e7 bf LDA $bfe7 ; (rz0 + 1)
595d : 85 04 __ STA WORK + 1 
595f : 20 52 78 JSR $7852 ; (divs16 + 0)
5962 : 18 __ __ CLC
5963 : a5 1b __ LDA ACCU + 0 
5965 : 69 50 __ ADC #$50
5967 : 85 12 __ STA P5 
5969 : a5 1c __ LDA ACCU + 1 
596b : 69 00 __ ADC #$00
596d : 85 13 __ STA P6 
596f : ad e6 bf LDA $bfe6 ; (rz0 + 0)
5972 : 85 03 __ STA WORK + 0 
5974 : ad e7 bf LDA $bfe7 ; (rz0 + 1)
5977 : 85 04 __ STA WORK + 1 
5979 : 20 8f 7c JSR $7c8f ; (divmod@proxy + 0)
597c : 18 __ __ CLC
597d : a5 1b __ LDA ACCU + 0 
597f : 69 48 __ ADC #$48
5981 : 85 14 __ STA P7 
5983 : a5 1c __ LDA ACCU + 1 
5985 : 69 00 __ ADC #$00
5987 : 85 15 __ STA P8 
5989 : ad e4 bf LDA $bfe4 ; (rx1 + 0)
598c : 85 1b __ STA ACCU + 0 
598e : ad e5 bf LDA $bfe5 ; (rx1 + 1)
5991 : 85 1c __ STA ACCU + 1 
5993 : a9 b4 __ LDA #$b4
5995 : 20 9e 77 JSR $779e ; (mul16by8 + 0)
5998 : ad e2 bf LDA $bfe2 ; (rz1 + 0)
599b : 85 03 __ STA WORK + 0 
599d : ad e3 bf LDA $bfe3 ; (rz1 + 1)
59a0 : 85 04 __ STA WORK + 1 
59a2 : 20 52 78 JSR $7852 ; (divs16 + 0)
59a5 : 18 __ __ CLC
59a6 : a5 1b __ LDA ACCU + 0 
59a8 : 69 50 __ ADC #$50
59aa : 85 16 __ STA P9 
59ac : a5 1c __ LDA ACCU + 1 
59ae : 69 00 __ ADC #$00
59b0 : 85 17 __ STA P10 
59b2 : ad e2 bf LDA $bfe2 ; (rz1 + 0)
59b5 : 85 03 __ STA WORK + 0 
59b7 : ad e3 bf LDA $bfe3 ; (rz1 + 1)
59ba : 85 04 __ STA WORK + 1 
59bc : 20 8f 7c JSR $7c8f ; (divmod@proxy + 0)
59bf : 18 __ __ CLC
59c0 : a5 1b __ LDA ACCU + 0 
59c2 : 69 48 __ ADC #$48
59c4 : 8d ea bf STA $bfea ; (sstack + 0)
59c7 : a5 1c __ LDA ACCU + 1 
59c9 : 69 00 __ ADC #$00
59cb : 8d eb bf STA $bfeb ; (sstack + 1)
59ce : 20 99 5a JSR $5a99 ; (mc_line.s4 + 0)
59d1 : 4c 41 58 JMP $5841 ; (draw_floor.s8 + 0)
--------------------------------------------------------------------
rotate_y: ; rotate_y(i16,i16,u8,i16*,i16*)->void
; 128, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
59d4 : a5 11 __ LDA P4 ; (angle + 0)
59d6 : 29 3f __ AND #$3f
59d8 : aa __ __ TAX
59d9 : bd 4b 80 LDA $804b,x ; (sin64[0] + 0)
59dc : 85 45 __ STA T1 + 0 
59de : 85 03 __ STA WORK + 0 
59e0 : 29 80 __ AND #$80
59e2 : 10 02 __ BPL $59e6 ; (rotate_y.s4 + 18)
59e4 : a9 ff __ LDA #$ff
59e6 : 85 46 __ STA T1 + 1 
59e8 : 85 04 __ STA WORK + 1 
59ea : a5 0f __ LDA P2 ; (z + 0)
59ec : 38 __ __ SEC
59ed : e9 f0 __ SBC #$f0
59ef : 85 47 __ STA T2 + 0 
59f1 : 85 1b __ STA ACCU + 0 
59f3 : a5 10 __ LDA P3 ; (z + 1)
59f5 : e9 00 __ SBC #$00
59f7 : 85 48 __ STA T2 + 1 
59f9 : 85 1c __ STA ACCU + 1 
59fb : 20 0c 78 JSR $780c ; (mul16 + 0)
59fe : a5 05 __ LDA WORK + 2 
5a00 : 85 49 __ STA T3 + 0 
5a02 : a5 06 __ LDA WORK + 3 
5a04 : 85 4a __ STA T3 + 1 
5a06 : 18 __ __ CLC
5a07 : a5 11 __ LDA P4 ; (angle + 0)
5a09 : 69 10 __ ADC #$10
5a0b : 29 3f __ AND #$3f
5a0d : aa __ __ TAX
5a0e : bd 4b 80 LDA $804b,x ; (sin64[0] + 0)
5a11 : 85 43 __ STA T0 + 0 
5a13 : 85 03 __ STA WORK + 0 
5a15 : 29 80 __ AND #$80
5a17 : 10 02 __ BPL $5a1b ; (rotate_y.s4 + 71)
5a19 : a9 ff __ LDA #$ff
5a1b : 85 44 __ STA T0 + 1 
5a1d : 85 04 __ STA WORK + 1 
5a1f : a5 0d __ LDA P0 ; (x + 0)
5a21 : 85 1b __ STA ACCU + 0 
5a23 : a5 0e __ LDA P1 ; (x + 1)
5a25 : 85 1c __ STA ACCU + 1 
5a27 : 20 0c 78 JSR $780c ; (mul16 + 0)
5a2a : 18 __ __ CLC
5a2b : a5 05 __ LDA WORK + 2 
5a2d : 65 49 __ ADC T3 + 0 
5a2f : 85 1b __ STA ACCU + 0 
5a31 : a5 06 __ LDA WORK + 3 
5a33 : 65 4a __ ADC T3 + 1 
5a35 : 85 1c __ STA ACCU + 1 
5a37 : 20 84 7c JSR $7c84 ; (divs16@proxy + 0)
5a3a : a5 1b __ LDA ACCU + 0 
5a3c : a0 00 __ LDY #$00
5a3e : 91 12 __ STA (P5),y ; (rx + 0)
5a40 : a5 1c __ LDA ACCU + 1 
5a42 : c8 __ __ INY
5a43 : 91 12 __ STA (P5),y ; (rx + 0)
5a45 : 38 __ __ SEC
5a46 : a9 00 __ LDA #$00
5a48 : e5 0d __ SBC P0 ; (x + 0)
5a4a : 85 1b __ STA ACCU + 0 
5a4c : a9 00 __ LDA #$00
5a4e : e5 0e __ SBC P1 ; (x + 1)
5a50 : 85 1c __ STA ACCU + 1 
5a52 : a5 45 __ LDA T1 + 0 
5a54 : 85 03 __ STA WORK + 0 
5a56 : a5 46 __ LDA T1 + 1 
5a58 : 85 04 __ STA WORK + 1 
5a5a : 20 0c 78 JSR $780c ; (mul16 + 0)
5a5d : a5 05 __ LDA WORK + 2 
5a5f : 85 45 __ STA T1 + 0 
5a61 : a5 06 __ LDA WORK + 3 
5a63 : 85 46 __ STA T1 + 1 
5a65 : a5 47 __ LDA T2 + 0 
5a67 : 85 1b __ STA ACCU + 0 
5a69 : a5 48 __ LDA T2 + 1 
5a6b : 85 1c __ STA ACCU + 1 
5a6d : a5 43 __ LDA T0 + 0 
5a6f : 85 03 __ STA WORK + 0 
5a71 : a5 44 __ LDA T0 + 1 
5a73 : 85 04 __ STA WORK + 1 
5a75 : 20 0c 78 JSR $780c ; (mul16 + 0)
5a78 : 18 __ __ CLC
5a79 : a5 05 __ LDA WORK + 2 
5a7b : 65 45 __ ADC T1 + 0 
5a7d : 85 1b __ STA ACCU + 0 
5a7f : a5 06 __ LDA WORK + 3 
5a81 : 65 46 __ ADC T1 + 1 
5a83 : 85 1c __ STA ACCU + 1 
5a85 : 20 84 7c JSR $7c84 ; (divs16@proxy + 0)
5a88 : 18 __ __ CLC
5a89 : a5 1b __ LDA ACCU + 0 
5a8b : 69 f0 __ ADC #$f0
5a8d : a0 00 __ LDY #$00
5a8f : 91 14 __ STA (P7),y ; (rz + 0)
5a91 : a5 1c __ LDA ACCU + 1 
5a93 : 69 00 __ ADC #$00
5a95 : c8 __ __ INY
5a96 : 91 14 __ STA (P7),y ; (rz + 0)
.s3:
5a98 : 60 __ __ RTS
--------------------------------------------------------------------
mc_line: ; mc_line(i16,i16,i16,i16,u8)->void
;  89, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5a99 : 38 __ __ SEC
5a9a : a5 16 __ LDA P9 ; (x1 + 0)
5a9c : e5 12 __ SBC P5 ; (x0 + 0)
5a9e : 85 43 __ STA T3 + 0 
5aa0 : a5 17 __ LDA P10 ; (x1 + 1)
5aa2 : e5 13 __ SBC P6 ; (x0 + 1)
5aa4 : 85 44 __ STA T3 + 1 
5aa6 : 10 0d __ BPL $5ab5 ; (mc_line.s5 + 0)
.s37:
5aa8 : 38 __ __ SEC
5aa9 : a9 00 __ LDA #$00
5aab : e5 43 __ SBC T3 + 0 
5aad : 85 43 __ STA T3 + 0 
5aaf : a9 00 __ LDA #$00
5ab1 : e5 44 __ SBC T3 + 1 
5ab3 : 85 44 __ STA T3 + 1 
.s5:
5ab5 : ad ea bf LDA $bfea ; (sstack + 0)
5ab8 : 85 45 __ STA T4 + 0 
5aba : 38 __ __ SEC
5abb : e5 14 __ SBC P7 ; (y0 + 0)
5abd : 85 47 __ STA T5 + 0 
5abf : ad eb bf LDA $bfeb ; (sstack + 1)
5ac2 : 85 46 __ STA T4 + 1 
5ac4 : e5 15 __ SBC P8 ; (y0 + 1)
5ac6 : 85 48 __ STA T5 + 1 
5ac8 : 10 0d __ BPL $5ad7 ; (mc_line.s6 + 0)
.s36:
5aca : 38 __ __ SEC
5acb : a9 00 __ LDA #$00
5acd : e5 47 __ SBC T5 + 0 
5acf : 85 47 __ STA T5 + 0 
5ad1 : a9 00 __ LDA #$00
5ad3 : e5 48 __ SBC T5 + 1 
5ad5 : 85 48 __ STA T5 + 1 
.s6:
5ad7 : a5 13 __ LDA P6 ; (x0 + 1)
5ad9 : c5 17 __ CMP P10 ; (x1 + 1)
5adb : d0 08 __ BNE $5ae5 ; (mc_line.s35 + 0)
.s32:
5add : a5 12 __ LDA P5 ; (x0 + 0)
5adf : c5 16 __ CMP P9 ; (x1 + 0)
.s33:
5ae1 : 90 08 __ BCC $5aeb ; (mc_line.s31 + 0)
5ae3 : b0 0e __ BCS $5af3 ; (mc_line.s7 + 0)
.s35:
5ae5 : 45 17 __ EOR P10 ; (x1 + 1)
5ae7 : 10 f8 __ BPL $5ae1 ; (mc_line.s33 + 0)
.s34:
5ae9 : 90 08 __ BCC $5af3 ; (mc_line.s7 + 0)
.s31:
5aeb : a9 01 __ LDA #$01
5aed : 85 49 __ STA T6 + 0 
5aef : a9 00 __ LDA #$00
5af1 : f0 04 __ BEQ $5af7 ; (mc_line.s8 + 0)
.s7:
5af3 : a9 ff __ LDA #$ff
5af5 : 85 49 __ STA T6 + 0 
.s8:
5af7 : 85 4a __ STA T6 + 1 
5af9 : a5 15 __ LDA P8 ; (y0 + 1)
5afb : c5 46 __ CMP T4 + 1 
5afd : d0 08 __ BNE $5b07 ; (mc_line.s30 + 0)
.s27:
5aff : a5 14 __ LDA P7 ; (y0 + 0)
5b01 : c5 45 __ CMP T4 + 0 
.s28:
5b03 : 90 08 __ BCC $5b0d ; (mc_line.s26 + 0)
5b05 : b0 0e __ BCS $5b15 ; (mc_line.s9 + 0)
.s30:
5b07 : 45 46 __ EOR T4 + 1 
5b09 : 10 f8 __ BPL $5b03 ; (mc_line.s28 + 0)
.s29:
5b0b : 90 08 __ BCC $5b15 ; (mc_line.s9 + 0)
.s26:
5b0d : a9 01 __ LDA #$01
5b0f : 85 4b __ STA T7 + 0 
5b11 : a9 00 __ LDA #$00
5b13 : f0 04 __ BEQ $5b19 ; (mc_line.s10 + 0)
.s9:
5b15 : a9 ff __ LDA #$ff
5b17 : 85 4b __ STA T7 + 0 
.s10:
5b19 : 85 4c __ STA T7 + 1 
5b1b : 38 __ __ SEC
5b1c : a5 43 __ LDA T3 + 0 
5b1e : e5 47 __ SBC T5 + 0 
5b20 : 85 4d __ STA T8 + 0 
5b22 : a5 44 __ LDA T3 + 1 
5b24 : e5 48 __ SBC T5 + 1 
5b26 : 85 4e __ STA T8 + 1 
5b28 : 38 __ __ SEC
5b29 : a9 00 __ LDA #$00
5b2b : e5 47 __ SBC T5 + 0 
5b2d : 85 4f __ STA T9 + 0 
5b2f : a9 00 __ LDA #$00
5b31 : e5 48 __ SBC T5 + 1 
5b33 : 85 50 __ STA T9 + 1 
.l11:
5b35 : a5 12 __ LDA P5 ; (x0 + 0)
5b37 : 85 0d __ STA P0 
5b39 : a9 01 __ LDA #$01
5b3b : 85 11 __ STA P4 
5b3d : a5 13 __ LDA P6 ; (x0 + 1)
5b3f : 85 0e __ STA P1 
5b41 : a5 14 __ LDA P7 ; (y0 + 0)
5b43 : 85 0f __ STA P2 
5b45 : a5 15 __ LDA P8 ; (y0 + 1)
5b47 : 85 10 __ STA P3 
5b49 : 20 d4 5b JSR $5bd4 ; (mc_setpix.s4 + 0)
5b4c : a5 13 __ LDA P6 ; (x0 + 1)
5b4e : c5 17 __ CMP P10 ; (x1 + 1)
5b50 : d0 12 __ BNE $5b64 ; (mc_line.s12 + 0)
.s25:
5b52 : a5 12 __ LDA P5 ; (x0 + 0)
5b54 : c5 16 __ CMP P9 ; (x1 + 0)
5b56 : d0 0c __ BNE $5b64 ; (mc_line.s12 + 0)
.s23:
5b58 : a5 15 __ LDA P8 ; (y0 + 1)
5b5a : c5 46 __ CMP T4 + 1 
5b5c : d0 06 __ BNE $5b64 ; (mc_line.s12 + 0)
.s24:
5b5e : a5 14 __ LDA P7 ; (y0 + 0)
5b60 : c5 45 __ CMP T4 + 0 
5b62 : f0 63 __ BEQ $5bc7 ; (mc_line.s3 + 0)
.s12:
5b64 : a5 4d __ LDA T8 + 0 
5b66 : 0a __ __ ASL
5b67 : 85 1b __ STA ACCU + 0 
5b69 : a5 4e __ LDA T8 + 1 
5b6b : 2a __ __ ROL
5b6c : 85 1c __ STA ACCU + 1 
5b6e : a5 50 __ LDA T9 + 1 
5b70 : c5 1c __ CMP ACCU + 1 
5b72 : d0 08 __ BNE $5b7c ; (mc_line.s22 + 0)
.s19:
5b74 : a5 4f __ LDA T9 + 0 
5b76 : c5 1b __ CMP ACCU + 0 
.s20:
5b78 : 90 08 __ BCC $5b82 ; (mc_line.s18 + 0)
5b7a : b0 20 __ BCS $5b9c ; (mc_line.s13 + 0)
.s22:
5b7c : 45 1c __ EOR ACCU + 1 
5b7e : 10 f8 __ BPL $5b78 ; (mc_line.s20 + 0)
.s21:
5b80 : 90 1a __ BCC $5b9c ; (mc_line.s13 + 0)
.s18:
5b82 : 18 __ __ CLC
5b83 : a5 12 __ LDA P5 ; (x0 + 0)
5b85 : 65 49 __ ADC T6 + 0 
5b87 : 85 12 __ STA P5 ; (x0 + 0)
5b89 : a5 13 __ LDA P6 ; (x0 + 1)
5b8b : 65 4a __ ADC T6 + 1 
5b8d : 85 13 __ STA P6 ; (x0 + 1)
5b8f : 38 __ __ SEC
5b90 : a5 4d __ LDA T8 + 0 
5b92 : e5 47 __ SBC T5 + 0 
5b94 : 85 4d __ STA T8 + 0 
5b96 : a5 4e __ LDA T8 + 1 
5b98 : e5 48 __ SBC T5 + 1 
5b9a : 85 4e __ STA T8 + 1 
.s13:
5b9c : a5 1c __ LDA ACCU + 1 
5b9e : 30 0a __ BMI $5baa ; (mc_line.s14 + 0)
.s17:
5ba0 : c5 44 __ CMP T3 + 1 
5ba2 : d0 04 __ BNE $5ba8 ; (mc_line.s16 + 0)
.s15:
5ba4 : a5 1b __ LDA ACCU + 0 
5ba6 : c5 43 __ CMP T3 + 0 
.s16:
5ba8 : b0 8b __ BCS $5b35 ; (mc_line.l11 + 0)
.s14:
5baa : 18 __ __ CLC
5bab : a5 14 __ LDA P7 ; (y0 + 0)
5bad : 65 4b __ ADC T7 + 0 
5baf : 85 14 __ STA P7 ; (y0 + 0)
5bb1 : a5 15 __ LDA P8 ; (y0 + 1)
5bb3 : 65 4c __ ADC T7 + 1 
5bb5 : 85 15 __ STA P8 ; (y0 + 1)
5bb7 : 18 __ __ CLC
5bb8 : a5 4d __ LDA T8 + 0 
5bba : 65 43 __ ADC T3 + 0 
5bbc : 85 4d __ STA T8 + 0 
5bbe : a5 4e __ LDA T8 + 1 
5bc0 : 65 44 __ ADC T3 + 1 
5bc2 : 85 4e __ STA T8 + 1 
5bc4 : 4c 35 5b JMP $5b35 ; (mc_line.l11 + 0)
.s3:
5bc7 : 60 __ __ RTS
--------------------------------------------------------------------
mc_setpix@proxy: ; mc_setpix@proxy
5bc8 : a5 46 __ LDA $46 
5bca : 85 0d __ STA P0 
5bcc : a5 47 __ LDA $47 
5bce : 85 0e __ STA P1 
5bd0 : a5 18 __ LDA P11 
5bd2 : 85 11 __ STA P4 
--------------------------------------------------------------------
mc_setpix: ; mc_setpix(i16,i16,u8)->void
;  54, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5bd4 : a5 0e __ LDA P1 ; (mx + 1)
5bd6 : d0 5e __ BNE $5c36 ; (mc_setpix.s3 + 0)
.s9:
5bd8 : a5 0d __ LDA P0 ; (mx + 0)
5bda : c9 a0 __ CMP #$a0
5bdc : b0 58 __ BCS $5c36 ; (mc_setpix.s3 + 0)
.s5:
5bde : a5 10 __ LDA P3 ; (my + 1)
5be0 : d0 54 __ BNE $5c36 ; (mc_setpix.s3 + 0)
.s8:
5be2 : a5 0f __ LDA P2 ; (my + 0)
5be4 : c9 c8 __ CMP #$c8
5be6 : b0 4e __ BCS $5c36 ; (mc_setpix.s3 + 0)
.s6:
5be8 : a5 0d __ LDA P0 ; (mx + 0)
5bea : 29 03 __ AND #$03
5bec : 49 03 __ EOR #$03
5bee : 0a __ __ ASL
5bef : 85 1b __ STA ACCU + 0 
5bf1 : a5 11 __ LDA P4 ; (col + 0)
5bf3 : a6 1b __ LDX ACCU + 0 
5bf5 : f0 08 __ BEQ $5bff ; (mc_setpix.s7 + 0)
.l10:
5bf7 : 0a __ __ ASL
5bf8 : ca __ __ DEX
5bf9 : d0 fc __ BNE $5bf7 ; (mc_setpix.l10 + 0)
.s11:
5bfb : 85 11 __ STA P4 ; (col + 0)
5bfd : a6 1b __ LDX ACCU + 0 
.s7:
5bff : a5 0f __ LDA P2 ; (my + 0)
5c01 : 29 07 __ AND #$07
5c03 : 85 1c __ STA ACCU + 1 
5c05 : a5 0f __ LDA P2 ; (my + 0)
5c07 : 4a __ __ LSR
5c08 : 4a __ __ LSR
5c09 : 4a __ __ LSR
5c0a : 85 1b __ STA ACCU + 0 
5c0c : 0a __ __ ASL
5c0d : 0a __ __ ASL
5c0e : 65 1b __ ADC ACCU + 0 
5c10 : 4a __ __ LSR
5c11 : 6a __ __ ROR
5c12 : a8 __ __ TAY
5c13 : 29 80 __ AND #$80
5c15 : 6a __ __ ROR
5c16 : 05 1c __ ORA ACCU + 1 
5c18 : 85 1b __ STA ACCU + 0 
5c1a : 98 __ __ TYA
5c1b : 29 3f __ AND #$3f
5c1d : 85 1c __ STA ACCU + 1 
5c1f : a5 0d __ LDA P0 ; (mx + 0)
5c21 : 29 fc __ AND #$fc
5c23 : 0a __ __ ASL
5c24 : a8 __ __ TAY
5c25 : a5 1c __ LDA ACCU + 1 
5c27 : 69 e0 __ ADC #$e0
5c29 : 85 1c __ STA ACCU + 1 
5c2b : bd ed 7b LDA $7bed,x ; (__shltab3L + 0)
5c2e : 49 ff __ EOR #$ff
5c30 : 31 1b __ AND (ACCU + 0),y 
5c32 : 05 11 __ ORA P4 ; (col + 0)
5c34 : 91 1b __ STA (ACCU + 0),y 
.s3:
5c36 : 60 __ __ RTS
--------------------------------------------------------------------
draw_shadow: ; draw_shadow(i16,i16,i16,i16)->void
; 174, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5c37 : a5 17 __ LDA P10 ; (rx + 1)
5c39 : 30 06 __ BMI $5c41 ; (draw_shadow.s29 + 0)
.s31:
5c3b : d0 0c __ BNE $5c49 ; (draw_shadow.s5 + 0)
.s30:
5c3d : a5 16 __ LDA P9 ; (rx + 0)
5c3f : d0 08 __ BNE $5c49 ; (draw_shadow.s5 + 0)
.s29:
5c41 : a9 01 __ LDA #$01
5c43 : 85 16 __ STA P9 ; (rx + 0)
5c45 : a9 00 __ LDA #$00
5c47 : 85 17 __ STA P10 ; (rx + 1)
.s5:
5c49 : ad eb bf LDA $bfeb ; (sstack + 1)
5c4c : 30 07 __ BMI $5c55 ; (draw_shadow.s26 + 0)
.s28:
5c4e : d0 0f __ BNE $5c5f ; (draw_shadow.s6 + 0)
.s27:
5c50 : ad ea bf LDA $bfea ; (sstack + 0)
5c53 : d0 0a __ BNE $5c5f ; (draw_shadow.s6 + 0)
.s26:
5c55 : a9 01 __ LDA #$01
5c57 : 8d ea bf STA $bfea ; (sstack + 0)
5c5a : a9 00 __ LDA #$00
5c5c : 8d eb bf STA $bfeb ; (sstack + 1)
.s6:
5c5f : ad ea bf LDA $bfea ; (sstack + 0)
5c62 : 85 48 __ STA T2 + 0 
5c64 : 49 ff __ EOR #$ff
5c66 : 38 __ __ SEC
5c67 : 69 00 __ ADC #$00
5c69 : 85 4a __ STA T3 + 0 
5c6b : a9 00 __ LDA #$00
5c6d : ed eb bf SBC $bfeb ; (sstack + 1)
5c70 : 85 4b __ STA T3 + 1 
5c72 : ad eb bf LDA $bfeb ; (sstack + 1)
5c75 : 85 49 __ STA T2 + 1 
5c77 : c5 4b __ CMP T3 + 1 
5c79 : d0 07 __ BNE $5c82 ; (draw_shadow.s25 + 0)
.s22:
5c7b : a5 48 __ LDA T2 + 0 
5c7d : c5 4a __ CMP T3 + 0 
.s23:
5c7f : b0 08 __ BCS $5c89 ; (draw_shadow.s7 + 0)
5c81 : 60 __ __ RTS
.s25:
5c82 : 45 4b __ EOR T3 + 1 
5c84 : 10 f9 __ BPL $5c7f ; (draw_shadow.s23 + 0)
.s24:
5c86 : 90 01 __ BCC $5c89 ; (draw_shadow.s7 + 0)
5c88 : 60 __ __ RTS
.s7:
5c89 : 18 __ __ CLC
5c8a : a5 14 __ LDA P7 ; (sy + 0)
5c8c : 65 4a __ ADC T3 + 0 
5c8e : 85 4c __ STA T4 + 0 
5c90 : a5 15 __ LDA P8 ; (sy + 1)
5c92 : 65 4b __ ADC T3 + 1 
5c94 : 85 4d __ STA T4 + 1 
5c96 : a5 48 __ LDA T2 + 0 
5c98 : 85 03 __ STA WORK + 0 
5c9a : 85 1b __ STA ACCU + 0 
5c9c : a5 49 __ LDA T2 + 1 
5c9e : 85 04 __ STA WORK + 1 
5ca0 : 85 1c __ STA ACCU + 1 
5ca2 : 20 0c 78 JSR $780c ; (mul16 + 0)
5ca5 : a5 05 __ LDA WORK + 2 
5ca7 : 85 4e __ STA T5 + 0 
5ca9 : a5 06 __ LDA WORK + 3 
5cab : 85 4f __ STA T5 + 1 
5cad : a5 4d __ LDA T4 + 1 
5caf : f0 03 __ BEQ $5cb4 ; (draw_shadow.l21 + 0)
5cb1 : 4c 4f 5d JMP $5d4f ; (draw_shadow.l11 + 0)
.l21:
5cb4 : a5 4c __ LDA T4 + 0 
5cb6 : c9 c8 __ CMP #$c8
5cb8 : b0 f7 __ BCS $5cb1 ; (draw_shadow.s7 + 40)
.s9:
5cba : a5 4a __ LDA T3 + 0 
5cbc : 85 03 __ STA WORK + 0 
5cbe : 85 1b __ STA ACCU + 0 
5cc0 : a5 4b __ LDA T3 + 1 
5cc2 : 85 04 __ STA WORK + 1 
5cc4 : 85 1c __ STA ACCU + 1 
5cc6 : 20 0c 78 JSR $780c ; (mul16 + 0)
5cc9 : 38 __ __ SEC
5cca : a5 4e __ LDA T5 + 0 
5ccc : e5 05 __ SBC WORK + 2 
5cce : 85 0d __ STA P0 
5cd0 : a5 4f __ LDA T5 + 1 
5cd2 : e5 06 __ SBC WORK + 3 
5cd4 : 30 79 __ BMI $5d4f ; (draw_shadow.l11 + 0)
.s10:
5cd6 : 85 0e __ STA P1 
5cd8 : 20 76 5d JSR $5d76 ; (mc_isqrt.s4 + 0)
5cdb : a5 1b __ LDA ACCU + 0 
5cdd : 85 03 __ STA WORK + 0 
5cdf : a5 1c __ LDA ACCU + 1 
5ce1 : 85 04 __ STA WORK + 1 
5ce3 : a5 16 __ LDA P9 ; (rx + 0)
5ce5 : 85 1b __ STA ACCU + 0 
5ce7 : a5 17 __ LDA P10 ; (rx + 1)
5ce9 : 85 1c __ STA ACCU + 1 
5ceb : 20 0c 78 JSR $780c ; (mul16 + 0)
5cee : a5 05 __ LDA WORK + 2 
5cf0 : 85 1b __ STA ACCU + 0 
5cf2 : a5 06 __ LDA WORK + 3 
5cf4 : 85 1c __ STA ACCU + 1 
5cf6 : a5 48 __ LDA T2 + 0 
5cf8 : 85 03 __ STA WORK + 0 
5cfa : a5 49 __ LDA T2 + 1 
5cfc : 85 04 __ STA WORK + 1 
5cfe : 20 52 78 JSR $7852 ; (divs16 + 0)
5d01 : 18 __ __ CLC
5d02 : a5 12 __ LDA P5 ; (sx + 0)
5d04 : 65 1b __ ADC ACCU + 0 
5d06 : 85 50 __ STA T6 + 0 
5d08 : a5 13 __ LDA P6 ; (sx + 1)
5d0a : 65 1c __ ADC ACCU + 1 
5d0c : 85 51 __ STA T6 + 1 
5d0e : 38 __ __ SEC
5d0f : a5 12 __ LDA P5 ; (sx + 0)
5d11 : e5 1b __ SBC ACCU + 0 
5d13 : 85 47 __ STA T0 + 0 
5d15 : a5 13 __ LDA P6 ; (sx + 1)
5d17 : e5 1c __ SBC ACCU + 1 
5d19 : 85 0e __ STA P1 
5d1b : a9 00 __ LDA #$00
5d1d : 85 10 __ STA P3 
.l36:
5d1f : a5 51 __ LDA T6 + 1 
5d21 : c5 0e __ CMP P1 
5d23 : d0 08 __ BNE $5d2d ; (draw_shadow.s20 + 0)
.s17:
5d25 : a5 50 __ LDA T6 + 0 
5d27 : c5 47 __ CMP T0 + 0 
.s18:
5d29 : b0 08 __ BCS $5d33 ; (draw_shadow.s16 + 0)
5d2b : 90 22 __ BCC $5d4f ; (draw_shadow.l11 + 0)
.s20:
5d2d : 45 0e __ EOR P1 
5d2f : 10 f8 __ BPL $5d29 ; (draw_shadow.s18 + 0)
.s19:
5d31 : b0 1c __ BCS $5d4f ; (draw_shadow.l11 + 0)
.s16:
5d33 : a5 47 __ LDA T0 + 0 
5d35 : 85 0d __ STA P0 
5d37 : a5 4c __ LDA T4 + 0 
5d39 : 85 0f __ STA P2 
5d3b : a9 03 __ LDA #$03
5d3d : 85 11 __ STA P4 
5d3f : 20 d4 5b JSR $5bd4 ; (mc_setpix.s4 + 0)
5d42 : 18 __ __ CLC
5d43 : a5 0d __ LDA P0 
5d45 : 69 02 __ ADC #$02
5d47 : 85 47 __ STA T0 + 0 
5d49 : 90 d4 __ BCC $5d1f ; (draw_shadow.l36 + 0)
.s37:
5d4b : e6 0e __ INC P1 
5d4d : b0 d0 __ BCS $5d1f ; (draw_shadow.l36 + 0)
.l11:
5d4f : e6 4c __ INC T4 + 0 
5d51 : d0 02 __ BNE $5d55 ; (draw_shadow.s33 + 0)
.s32:
5d53 : e6 4d __ INC T4 + 1 
.s33:
5d55 : e6 4a __ INC T3 + 0 
5d57 : d0 02 __ BNE $5d5b ; (draw_shadow.s35 + 0)
.s34:
5d59 : e6 4b __ INC T3 + 1 
.s35:
5d5b : a5 49 __ LDA T2 + 1 
5d5d : c5 4b __ CMP T3 + 1 
5d5f : d0 07 __ BNE $5d68 ; (draw_shadow.s15 + 0)
.s12:
5d61 : a5 48 __ LDA T2 + 0 
5d63 : c5 4a __ CMP T3 + 0 
.s13:
5d65 : b0 07 __ BCS $5d6e ; (draw_shadow.s8 + 0)
5d67 : 60 __ __ RTS
.s15:
5d68 : 45 4b __ EOR T3 + 1 
5d6a : 10 f9 __ BPL $5d65 ; (draw_shadow.s13 + 0)
.s14:
5d6c : b0 07 __ BCS $5d75 ; (draw_shadow.s3 + 0)
.s8:
5d6e : a5 4d __ LDA T4 + 1 
5d70 : d0 dd __ BNE $5d4f ; (draw_shadow.l11 + 0)
5d72 : 4c b4 5c JMP $5cb4 ; (draw_shadow.l21 + 0)
.s3:
5d75 : 60 __ __ RTS
--------------------------------------------------------------------
mc_isqrt: ; mc_isqrt(u16)->i16
;  39, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5d76 : a5 0e __ LDA P1 ; (n + 1)
5d78 : 05 0d __ ORA P0 ; (n + 0)
5d7a : d0 05 __ BNE $5d81 ; (mc_isqrt.s5 + 0)
.s10:
5d7c : 85 1b __ STA ACCU + 0 
.s3:
5d7e : 85 1c __ STA ACCU + 1 
5d80 : 60 __ __ RTS
.s5:
5d81 : a5 0e __ LDA P1 ; (n + 1)
5d83 : 4a __ __ LSR
5d84 : 85 44 __ STA T1 + 1 
5d86 : a5 0d __ LDA P0 ; (n + 0)
5d88 : 6a __ __ ROR
5d89 : 85 43 __ STA T1 + 0 
5d8b : 05 44 __ ORA T1 + 1 
5d8d : d0 06 __ BNE $5d95 ; (mc_isqrt.l6 + 0)
.s9:
5d8f : a2 01 __ LDX #$01
5d91 : 86 1b __ STX ACCU + 0 
5d93 : d0 e9 __ BNE $5d7e ; (mc_isqrt.s3 + 0)
.l6:
5d95 : a5 43 __ LDA T1 + 0 
5d97 : 85 03 __ STA WORK + 0 
5d99 : 85 45 __ STA T2 + 0 
5d9b : a5 44 __ LDA T1 + 1 
5d9d : 85 04 __ STA WORK + 1 
5d9f : 85 46 __ STA T2 + 1 
5da1 : a5 0d __ LDA P0 ; (n + 0)
5da3 : 85 1b __ STA ACCU + 0 
5da5 : a5 0e __ LDA P1 ; (n + 1)
5da7 : 85 1c __ STA ACCU + 1 
5da9 : 20 8d 78 JSR $788d ; (divmod + 0)
5dac : 18 __ __ CLC
5dad : a5 1b __ LDA ACCU + 0 
5daf : 65 43 __ ADC T1 + 0 
5db1 : 85 43 __ STA T1 + 0 
5db3 : a5 1c __ LDA ACCU + 1 
5db5 : 65 44 __ ADC T1 + 1 
5db7 : 4a __ __ LSR
5db8 : 85 44 __ STA T1 + 1 
5dba : 66 43 __ ROR T1 + 0 
5dbc : c5 46 __ CMP T2 + 1 
5dbe : 90 d5 __ BCC $5d95 ; (mc_isqrt.l6 + 0)
.s11:
5dc0 : d0 06 __ BNE $5dc8 ; (mc_isqrt.s7 + 0)
.s8:
5dc2 : a5 43 __ LDA T1 + 0 
5dc4 : c5 45 __ CMP T2 + 0 
5dc6 : 90 cd __ BCC $5d95 ; (mc_isqrt.l6 + 0)
.s7:
5dc8 : a5 45 __ LDA T2 + 0 
5dca : 85 1b __ STA ACCU + 0 
5dcc : a5 46 __ LDA T2 + 1 
5dce : b0 ae __ BCS $5d7e ; (mc_isqrt.s3 + 0)
--------------------------------------------------------------------
draw_ball: ; draw_ball(i16,i16,u8,i16)->void
; 199, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s1:
5dd0 : a2 1c __ LDX #$1c
5dd2 : b5 53 __ LDA T3 + 0,x 
5dd4 : 9d c3 bf STA $bfc3,x ; (draw_ball@stack + 0)
5dd7 : ca __ __ DEX
5dd8 : 10 f8 __ BPL $5dd2 ; (draw_ball.s1 + 2)
.s4:
5dda : ad f0 bf LDA $bff0 ; (sstack + 6)
5ddd : 30 09 __ BMI $5de8 ; (draw_ball.s82 + 0)
.s84:
5ddf : d0 11 __ BNE $5df2 ; (draw_ball.s5 + 0)
.s83:
5de1 : ad ef bf LDA $bfef ; (sstack + 5)
5de4 : c9 03 __ CMP #$03
5de6 : b0 0a __ BCS $5df2 ; (draw_ball.s5 + 0)
.s82:
5de8 : a9 03 __ LDA #$03
5dea : 8d ef bf STA $bfef ; (sstack + 5)
5ded : a9 00 __ LDA #$00
5def : 8d f0 bf STA $bff0 ; (sstack + 6)
.s5:
5df2 : ad ef bf LDA $bfef ; (sstack + 5)
5df5 : 85 5d __ STA T9 + 0 
5df7 : 0a __ __ ASL
5df8 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5dfa : ad f0 bf LDA $bff0 ; (sstack + 6)
5dfd : 85 5e __ STA T9 + 1 
5dff : 2a __ __ ROL
5e00 : 06 1b __ ASL ACCU + 0 ; (cy + 0)
5e02 : 2a __ __ ROL
5e03 : aa __ __ TAX
5e04 : 18 __ __ CLC
5e05 : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5e07 : 65 5d __ ADC T9 + 0 
5e09 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5e0b : 8a __ __ TXA
5e0c : 65 5e __ ADC T9 + 1 
5e0e : 85 1c __ STA ACCU + 1 ; (cy + 1)
5e10 : a9 00 __ LDA #$00
5e12 : 85 04 __ STA WORK + 1 
5e14 : 20 7d 7c JSR $7c7d ; (divs16@proxy + 0)
5e17 : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5e19 : 85 5f __ STA T10 + 0 
5e1b : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5e1d : 85 60 __ STA T10 + 1 
5e1f : 38 __ __ SEC
5e20 : a9 00 __ LDA #$00
5e22 : e5 1b __ SBC ACCU + 0 ; (cy + 0)
5e24 : 85 61 __ STA T11 + 0 
5e26 : a9 00 __ LDA #$00
5e28 : 85 04 __ STA WORK + 1 
5e2a : e5 1c __ SBC ACCU + 1 ; (cy + 1)
5e2c : 85 62 __ STA T11 + 1 
5e2e : a5 5d __ LDA T9 + 0 
5e30 : 0a __ __ ASL
5e31 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5e33 : a5 5e __ LDA T9 + 1 
5e35 : 2a __ __ ROL
5e36 : 06 1b __ ASL ACCU + 0 ; (cy + 0)
5e38 : 2a __ __ ROL
5e39 : 06 1b __ ASL ACCU + 0 ; (cy + 0)
5e3b : 2a __ __ ROL
5e3c : aa __ __ TAX
5e3d : 18 __ __ CLC
5e3e : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5e40 : 65 5d __ ADC T9 + 0 
5e42 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5e44 : 8a __ __ TXA
5e45 : 65 5e __ ADC T9 + 1 
5e47 : 85 1c __ STA ACCU + 1 ; (cy + 1)
5e49 : 20 7d 7c JSR $7c7d ; (divs16@proxy + 0)
5e4c : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5e4e : 85 63 __ STA T12 + 0 
5e50 : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5e52 : 85 64 __ STA T12 + 1 
5e54 : 38 __ __ SEC
5e55 : a9 00 __ LDA #$00
5e57 : e5 1b __ SBC ACCU + 0 ; (cy + 0)
5e59 : 85 65 __ STA T13 + 0 
5e5b : a9 00 __ LDA #$00
5e5d : e5 1c __ SBC ACCU + 1 ; (cy + 1)
5e5f : 85 66 __ STA T13 + 1 
5e61 : a5 5d __ LDA T9 + 0 
5e63 : 85 03 __ STA WORK + 0 
5e65 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5e67 : a5 5e __ LDA T9 + 1 
5e69 : 85 04 __ STA WORK + 1 
5e6b : 85 1c __ STA ACCU + 1 ; (cy + 1)
5e6d : 20 0c 78 JSR $780c ; (mul16 + 0)
5e70 : a5 05 __ LDA WORK + 2 
5e72 : 85 67 __ STA T14 + 0 
5e74 : a5 06 __ LDA WORK + 3 
5e76 : 85 68 __ STA T14 + 1 
5e78 : 38 __ __ SEC
5e79 : a9 00 __ LDA #$00
5e7b : e5 5d __ SBC T9 + 0 
5e7d : 85 69 __ STA T15 + 0 
5e7f : a9 00 __ LDA #$00
5e81 : e5 5e __ SBC T9 + 1 
5e83 : 85 6a __ STA T15 + 1 
5e85 : a5 5e __ LDA T9 + 1 
5e87 : c5 6a __ CMP T15 + 1 
5e89 : d0 09 __ BNE $5e94 ; (draw_ball.s10 + 0)
.s7:
5e8b : a5 5d __ LDA T9 + 0 
5e8d : c5 69 __ CMP T15 + 0 
.s8:
5e8f : a9 00 __ LDA #$00
5e91 : 2a __ __ ROL
5e92 : 90 09 __ BCC $5e9d ; (draw_ball.s6 + 0)
.s10:
5e94 : 45 6a __ EOR T15 + 1 
5e96 : 10 f7 __ BPL $5e8f ; (draw_ball.s8 + 0)
.s9:
5e98 : a9 00 __ LDA #$00
5e9a : 2a __ __ ROL
5e9b : 49 01 __ EOR #$01
.s6:
5e9d : 85 6f __ STA T20 + 0 
5e9f : d0 03 __ BNE $5ea4 ; (draw_ball.s32 + 0)
5ea1 : 4c a3 60 JMP $60a3 ; (draw_ball.s11 + 0)
.s32:
5ea4 : ad ec bf LDA $bfec ; (sstack + 2)
5ea7 : 18 __ __ CLC
5ea8 : 65 69 __ ADC T15 + 0 
5eaa : 85 6b __ STA T16 + 0 
5eac : a5 69 __ LDA T15 + 0 
5eae : 85 6d __ STA T17 + 0 
5eb0 : a5 6a __ LDA T15 + 1 
5eb2 : 85 6e __ STA T17 + 1 
5eb4 : 6d ed bf ADC $bfed ; (sstack + 3)
5eb7 : 85 6c __ STA T16 + 1 
5eb9 : f0 03 __ BEQ $5ebe ; (draw_ball.l81 + 0)
5ebb : 4c 7c 60 JMP $607c ; (draw_ball.l50 + 0)
.l81:
5ebe : a5 6b __ LDA T16 + 0 
5ec0 : c9 c8 __ CMP #$c8
5ec2 : b0 f7 __ BCS $5ebb ; (draw_ball.s32 + 23)
.s34:
5ec4 : a5 6d __ LDA T17 + 0 
5ec6 : 85 03 __ STA WORK + 0 
5ec8 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5eca : a5 6e __ LDA T17 + 1 
5ecc : 85 04 __ STA WORK + 1 
5ece : 85 1c __ STA ACCU + 1 ; (cy + 1)
5ed0 : 20 0c 78 JSR $780c ; (mul16 + 0)
5ed3 : 38 __ __ SEC
5ed4 : a5 67 __ LDA T14 + 0 
5ed6 : e5 05 __ SBC WORK + 2 
5ed8 : 85 0d __ STA P0 
5eda : a5 68 __ LDA T14 + 1 
5edc : e5 06 __ SBC WORK + 3 
5ede : 30 db __ BMI $5ebb ; (draw_ball.s32 + 23)
.s80:
5ee0 : 85 0e __ STA P1 
5ee2 : 05 0d __ ORA P0 
5ee4 : f0 d5 __ BEQ $5ebb ; (draw_ball.s32 + 23)
.s35:
5ee6 : 20 76 5d JSR $5d76 ; (mc_isqrt.s4 + 0)
5ee9 : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5eeb : 85 43 __ STA T0 + 0 
5eed : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5eef : 85 44 __ STA T0 + 1 
5ef1 : a5 6e __ LDA T17 + 1 
5ef3 : c5 66 __ CMP T13 + 1 
5ef5 : d0 08 __ BNE $5eff ; (draw_ball.s79 + 0)
.s76:
5ef7 : a5 6d __ LDA T17 + 0 
5ef9 : c5 65 __ CMP T13 + 0 
.s77:
5efb : 90 08 __ BCC $5f05 ; (draw_ball.s75 + 0)
5efd : b0 1e __ BCS $5f1d ; (draw_ball.s36 + 0)
.s79:
5eff : 45 66 __ EOR T13 + 1 
5f01 : 10 f8 __ BPL $5efb ; (draw_ball.s77 + 0)
.s78:
5f03 : 90 18 __ BCC $5f1d ; (draw_ball.s36 + 0)
.s75:
5f05 : a9 00 __ LDA #$00
.s41:
5f07 : 85 47 __ STA T18 + 0 
5f09 : ad ea bf LDA $bfea ; (sstack + 0)
5f0c : 85 53 __ STA T3 + 0 
5f0e : a9 00 __ LDA #$00
5f10 : 85 51 __ STA T2 + 0 
5f12 : ad eb bf LDA $bfeb ; (sstack + 1)
5f15 : 85 54 __ STA T3 + 1 
5f17 : ad ee bf LDA $bfee ; (sstack + 4)
5f1a : 4c 69 5f JMP $5f69 ; (draw_ball.l86 + 0)
.s36:
5f1d : a5 6e __ LDA T17 + 1 
5f1f : c5 62 __ CMP T11 + 1 
5f21 : d0 08 __ BNE $5f2b ; (draw_ball.s74 + 0)
.s71:
5f23 : a5 6d __ LDA T17 + 0 
5f25 : c5 61 __ CMP T11 + 0 
.s72:
5f27 : 90 08 __ BCC $5f31 ; (draw_ball.s70 + 0)
5f29 : b0 0a __ BCS $5f35 ; (draw_ball.s37 + 0)
.s74:
5f2b : 45 62 __ EOR T11 + 1 
5f2d : 10 f8 __ BPL $5f27 ; (draw_ball.s72 + 0)
.s73:
5f2f : 90 04 __ BCC $5f35 ; (draw_ball.s37 + 0)
.s70:
5f31 : a9 01 __ LDA #$01
5f33 : d0 d2 __ BNE $5f07 ; (draw_ball.s41 + 0)
.s37:
5f35 : 24 6e __ BIT T17 + 1 
5f37 : 10 04 __ BPL $5f3d ; (draw_ball.s38 + 0)
.s69:
5f39 : a9 02 __ LDA #$02
5f3b : d0 ca __ BNE $5f07 ; (draw_ball.s41 + 0)
.s38:
5f3d : 24 60 __ BIT T10 + 1 
5f3f : 30 10 __ BMI $5f51 ; (draw_ball.s39 + 0)
.s68:
5f41 : a5 6e __ LDA T17 + 1 
5f43 : c5 60 __ CMP T10 + 1 
5f45 : d0 04 __ BNE $5f4b ; (draw_ball.s67 + 0)
.s66:
5f47 : a5 6d __ LDA T17 + 0 
5f49 : c5 5f __ CMP T10 + 0 
.s67:
5f4b : b0 04 __ BCS $5f51 ; (draw_ball.s39 + 0)
.s65:
5f4d : a9 03 __ LDA #$03
5f4f : 90 b6 __ BCC $5f07 ; (draw_ball.s41 + 0)
.s39:
5f51 : 24 64 __ BIT T12 + 1 
5f53 : 30 10 __ BMI $5f65 ; (draw_ball.s40 + 0)
.s64:
5f55 : a5 6e __ LDA T17 + 1 
5f57 : c5 64 __ CMP T12 + 1 
5f59 : d0 04 __ BNE $5f5f ; (draw_ball.s63 + 0)
.s62:
5f5b : a5 6d __ LDA T17 + 0 
5f5d : c5 63 __ CMP T12 + 0 
.s63:
5f5f : b0 04 __ BCS $5f65 ; (draw_ball.s40 + 0)
.s61:
5f61 : a9 04 __ LDA #$04
5f63 : 90 a2 __ BCC $5f07 ; (draw_ball.s41 + 0)
.s40:
5f65 : a9 05 __ LDA #$05
5f67 : d0 9e __ BNE $5f07 ; (draw_ball.s41 + 0)
.l86:
5f69 : 85 4f __ STA T1 + 0 
5f6b : 18 __ __ CLC
5f6c : 69 10 __ ADC #$10
5f6e : 29 3f __ AND #$3f
5f70 : aa __ __ TAX
5f71 : bd 4b 80 LDA $804b,x ; (sin64[0] + 0)
5f74 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5f76 : 29 80 __ AND #$80
5f78 : 10 02 __ BPL $5f7c ; (draw_ball.l86 + 19)
5f7a : a9 ff __ LDA #$ff
5f7c : 85 1c __ STA ACCU + 1 ; (cy + 1)
5f7e : a5 43 __ LDA T0 + 0 
5f80 : 85 03 __ STA WORK + 0 
5f82 : a5 44 __ LDA T0 + 1 
5f84 : 85 04 __ STA WORK + 1 
5f86 : 20 0c 78 JSR $780c ; (mul16 + 0)
5f89 : 20 6a 7c JSR $7c6a ; (divs16@proxy + 0)
5f8c : 18 __ __ CLC
5f8d : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5f8f : 65 53 __ ADC T3 + 0 
5f91 : a6 51 __ LDX T2 + 0 
5f93 : e8 __ __ INX
5f94 : e8 __ __ INX
5f95 : 86 51 __ STX T2 + 0 
5f97 : 9d cc 86 STA $86cc,x ; (letter_width[0] + 84)
5f9a : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5f9c : 65 54 __ ADC T3 + 1 
5f9e : 9d cd 86 STA $86cd,x ; (letter_width[0] + 85)
5fa1 : 18 __ __ CLC
5fa2 : a5 4f __ LDA T1 + 0 
5fa4 : 69 10 __ ADC #$10
5fa6 : e0 08 __ CPX #$08
5fa8 : d0 bf __ BNE $5f69 ; (draw_ball.l86 + 0)
.s42:
5faa : a9 00 __ LDA #$00
5fac : 85 4f __ STA T1 + 0 
.l43:
5fae : a4 4f __ LDY T1 + 0 
5fb0 : c8 __ __ INY
5fb1 : 84 55 __ STY T4 + 0 
5fb3 : 0a __ __ ASL
5fb4 : 85 57 __ STA T5 + 0 
.l85:
5fb6 : a5 55 __ LDA T4 + 0 
5fb8 : 0a __ __ ASL
5fb9 : 85 59 __ STA T6 + 0 
5fbb : aa __ __ TAX
5fbc : bd ce 86 LDA $86ce,x ; (mx[0] + 0)
5fbf : 85 5b __ STA T7 + 0 
5fc1 : bd cf 86 LDA $86cf,x ; (mx[0] + 1)
5fc4 : 85 5c __ STA T7 + 1 
5fc6 : a6 57 __ LDX T5 + 0 
5fc8 : bd ce 86 LDA $86ce,x ; (mx[0] + 0)
5fcb : 85 45 __ STA T8 + 0 
5fcd : bd cf 86 LDA $86cf,x ; (mx[0] + 1)
5fd0 : 85 46 __ STA T8 + 1 
5fd2 : a5 5c __ LDA T7 + 1 
5fd4 : c5 46 __ CMP T8 + 1 
5fd6 : d0 08 __ BNE $5fe0 ; (draw_ball.s60 + 0)
.s57:
5fd8 : a5 5b __ LDA T7 + 0 
5fda : c5 45 __ CMP T8 + 0 
.s58:
5fdc : 90 08 __ BCC $5fe6 ; (draw_ball.s56 + 0)
5fde : b0 1c __ BCS $5ffc ; (draw_ball.s44 + 0)
.s60:
5fe0 : 45 46 __ EOR T8 + 1 
5fe2 : 10 f8 __ BPL $5fdc ; (draw_ball.s58 + 0)
.s59:
5fe4 : 90 16 __ BCC $5ffc ; (draw_ball.s44 + 0)
.s56:
5fe6 : a5 5b __ LDA T7 + 0 
5fe8 : 9d ce 86 STA $86ce,x ; (mx[0] + 0)
5feb : a5 5c __ LDA T7 + 1 
5fed : 9d cf 86 STA $86cf,x ; (mx[0] + 1)
5ff0 : a5 45 __ LDA T8 + 0 
5ff2 : a6 59 __ LDX T6 + 0 
5ff4 : 9d ce 86 STA $86ce,x ; (mx[0] + 0)
5ff7 : a5 46 __ LDA T8 + 1 
5ff9 : 9d cf 86 STA $86cf,x ; (mx[0] + 1)
.s44:
5ffc : e6 55 __ INC T4 + 0 
5ffe : c8 __ __ INY
5fff : c0 04 __ CPY #$04
6001 : 90 b3 __ BCC $5fb6 ; (draw_ball.l85 + 0)
.s45:
6003 : e6 4f __ INC T1 + 0 
6005 : a5 4f __ LDA T1 + 0 
6007 : c9 03 __ CMP #$03
6009 : d0 a3 __ BNE $5fae ; (draw_ball.l43 + 0)
.s46:
600b : a5 53 __ LDA T3 + 0 
600d : e5 43 __ SBC T0 + 0 
600f : 85 4f __ STA T1 + 0 
6011 : a5 54 __ LDA T3 + 1 
6013 : e5 44 __ SBC T0 + 1 
6015 : 85 50 __ STA T1 + 1 
6017 : 18 __ __ CLC
6018 : a5 53 __ LDA T3 + 0 
601a : 65 43 __ ADC T0 + 0 
601c : 85 51 __ STA T2 + 0 
601e : a5 54 __ LDA T3 + 1 
6020 : 65 44 __ ADC T0 + 1 
6022 : 85 52 __ STA T2 + 1 
6024 : a5 47 __ LDA T18 + 0 
6026 : 85 53 __ STA T3 + 0 
6028 : a9 00 __ LDA #$00
602a : 85 57 __ STA T5 + 0 
602c : 85 55 __ STA T4 + 0 
602e : 85 13 __ STA P6 
6030 : a5 6b __ LDA T16 + 0 
6032 : 85 12 __ STA P5 
.l47:
6034 : a5 4f __ LDA T1 + 0 
6036 : 85 14 __ STA P7 
6038 : a5 50 __ LDA T1 + 1 
603a : 85 15 __ STA P8 
603c : a5 57 __ LDA T5 + 0 
603e : c9 04 __ CMP #$04
6040 : b0 0a __ BCS $604c ; (draw_ball.s48 + 0)
.s55:
6042 : a4 55 __ LDY T4 + 0 
6044 : b9 cf 86 LDA $86cf,y ; (mx[0] + 1)
6047 : be ce 86 LDX $86ce,y ; (mx[0] + 0)
604a : 90 04 __ BCC $6050 ; (draw_ball.s49 + 0)
.s48:
604c : a5 52 __ LDA T2 + 1 
604e : a6 51 __ LDX T2 + 0 
.s49:
6050 : 86 16 __ STX P9 
6052 : 85 17 __ STA P10 
6054 : 8a __ __ TXA
6055 : 18 __ __ CLC
6056 : 69 01 __ ADC #$01
6058 : 85 4f __ STA T1 + 0 
605a : a5 17 __ LDA P10 
605c : 69 00 __ ADC #$00
605e : 85 50 __ STA T1 + 1 
6060 : a5 53 __ LDA T3 + 0 
6062 : 4a __ __ LSR
6063 : a9 02 __ LDA #$02
6065 : b0 02 __ BCS $6069 ; (draw_ball.s96 + 0)
.s95:
6067 : a9 01 __ LDA #$01
.s96:
6069 : 85 18 __ STA P11 
606b : 20 2b 62 JSR $622b ; (mc_hspan.s4 + 0)
606e : e6 53 __ INC T3 + 0 
6070 : e6 55 __ INC T4 + 0 
6072 : e6 55 __ INC T4 + 0 
6074 : e6 57 __ INC T5 + 0 
6076 : a5 57 __ LDA T5 + 0 
6078 : c9 05 __ CMP #$05
607a : 90 b8 __ BCC $6034 ; (draw_ball.l47 + 0)
.l50:
607c : e6 6b __ INC T16 + 0 
607e : d0 02 __ BNE $6082 ; (draw_ball.s88 + 0)
.s87:
6080 : e6 6c __ INC T16 + 1 
.s88:
6082 : e6 6d __ INC T17 + 0 
6084 : d0 02 __ BNE $6088 ; (draw_ball.s90 + 0)
.s89:
6086 : e6 6e __ INC T17 + 1 
.s90:
6088 : a5 5e __ LDA T9 + 1 
608a : c5 6e __ CMP T17 + 1 
608c : d0 08 __ BNE $6096 ; (draw_ball.s54 + 0)
.s51:
608e : a5 5d __ LDA T9 + 0 
6090 : c5 6d __ CMP T17 + 0 
.s52:
6092 : b0 08 __ BCS $609c ; (draw_ball.s33 + 0)
6094 : 90 0d __ BCC $60a3 ; (draw_ball.s11 + 0)
.s54:
6096 : 45 6e __ EOR T17 + 1 
6098 : 10 f8 __ BPL $6092 ; (draw_ball.s52 + 0)
.s53:
609a : b0 07 __ BCS $60a3 ; (draw_ball.s11 + 0)
.s33:
609c : a5 6c __ LDA T16 + 1 
609e : d0 dc __ BNE $607c ; (draw_ball.l50 + 0)
60a0 : 4c be 5e JMP $5ebe ; (draw_ball.l81 + 0)
.s11:
60a3 : a5 65 __ LDA T13 + 0 
60a5 : 8d e0 bf STA $bfe0 ; (lats[0] + 0)
60a8 : a5 66 __ LDA T13 + 1 
60aa : 8d e1 bf STA $bfe1 ; (lats[0] + 1)
60ad : a5 61 __ LDA T11 + 0 
60af : 8d e2 bf STA $bfe2 ; (lats[0] + 2)
60b2 : a5 62 __ LDA T11 + 1 
60b4 : 8d e3 bf STA $bfe3 ; (lats[0] + 3)
60b7 : a9 00 __ LDA #$00
60b9 : 8d e4 bf STA $bfe4 ; (lats[0] + 4)
60bc : 8d e5 bf STA $bfe5 ; (lats[0] + 5)
60bf : 85 53 __ STA T3 + 0 
60c1 : a6 5f __ LDX T10 + 0 
60c3 : 8e e6 bf STX $bfe6 ; (lats[0] + 6)
60c6 : a6 60 __ LDX T10 + 1 
60c8 : 8e e7 bf STX $bfe7 ; (lats[0] + 7)
60cb : a6 63 __ LDX T12 + 0 
60cd : 8e e8 bf STX $bfe8 ; (lats[0] + 8)
60d0 : a6 64 __ LDX T12 + 1 
60d2 : 8e e9 bf STX $bfe9 ; (lats[0] + 9)
60d5 : ae ec bf LDX $bfec ; (sstack + 2)
60d8 : 86 55 __ STX T4 + 0 
60da : ae ed bf LDX $bfed ; (sstack + 3)
60dd : 86 56 __ STX T4 + 1 
.l12:
60df : 0a __ __ ASL
60e0 : a8 __ __ TAY
60e1 : b9 e0 bf LDA $bfe0,y ; (lats[0] + 0)
60e4 : 18 __ __ CLC
60e5 : 65 55 __ ADC T4 + 0 
60e7 : 85 4f __ STA T1 + 0 
60e9 : b9 e1 bf LDA $bfe1,y ; (lats[0] + 1)
60ec : 65 56 __ ADC T4 + 1 
60ee : d0 58 __ BNE $6148 ; (draw_ball.s15 + 0)
.s31:
60f0 : a5 4f __ LDA T1 + 0 
60f2 : c9 c8 __ CMP #$c8
60f4 : b0 52 __ BCS $6148 ; (draw_ball.s15 + 0)
.s13:
60f6 : b9 e0 bf LDA $bfe0,y ; (lats[0] + 0)
60f9 : 85 1b __ STA ACCU + 0 ; (cy + 0)
60fb : 85 03 __ STA WORK + 0 
60fd : b9 e1 bf LDA $bfe1,y ; (lats[0] + 1)
6100 : 85 1c __ STA ACCU + 1 ; (cy + 1)
6102 : 85 04 __ STA WORK + 1 
6104 : 20 0c 78 JSR $780c ; (mul16 + 0)
6107 : 38 __ __ SEC
6108 : a5 67 __ LDA T14 + 0 
610a : e5 05 __ SBC WORK + 2 
610c : 85 0d __ STA P0 
610e : a5 68 __ LDA T14 + 1 
6110 : e5 06 __ SBC WORK + 3 
6112 : 30 34 __ BMI $6148 ; (draw_ball.s15 + 0)
.s30:
6114 : 85 0e __ STA P1 
6116 : 05 0d __ ORA P0 
6118 : f0 2e __ BEQ $6148 ; (draw_ball.s15 + 0)
.s14:
611a : 20 76 5d JSR $5d76 ; (mc_isqrt.s4 + 0)
611d : a5 4f __ LDA T1 + 0 
611f : 85 12 __ STA P5 
6121 : a9 00 __ LDA #$00
6123 : 85 13 __ STA P6 
6125 : 85 18 __ STA P11 
6127 : ad ea bf LDA $bfea ; (sstack + 0)
612a : 18 __ __ CLC
612b : 65 1b __ ADC ACCU + 0 ; (cy + 0)
612d : 85 16 __ STA P9 
612f : ad eb bf LDA $bfeb ; (sstack + 1)
6132 : 65 1c __ ADC ACCU + 1 ; (cy + 1)
6134 : 85 17 __ STA P10 
6136 : ad ea bf LDA $bfea ; (sstack + 0)
6139 : 38 __ __ SEC
613a : e5 1b __ SBC ACCU + 0 ; (cy + 0)
613c : 85 14 __ STA P7 
613e : ad eb bf LDA $bfeb ; (sstack + 1)
6141 : e5 1c __ SBC ACCU + 1 ; (cy + 1)
6143 : 85 15 __ STA P8 
6145 : 20 2b 62 JSR $622b ; (mc_hspan.s4 + 0)
.s15:
6148 : e6 53 __ INC T3 + 0 
614a : a5 53 __ LDA T3 + 0 
614c : c9 05 __ CMP #$05
614e : d0 8f __ BNE $60df ; (draw_ball.l12 + 0)
.s16:
6150 : a5 6f __ LDA T20 + 0 
6152 : d0 0b __ BNE $615f ; (draw_ball.s17 + 0)
.s3:
6154 : a2 1c __ LDX #$1c
6156 : bd c3 bf LDA $bfc3,x ; (draw_ball@stack + 0)
6159 : 95 53 __ STA T3 + 0,x 
615b : ca __ __ DEX
615c : 10 f8 __ BPL $6156 ; (draw_ball.s3 + 2)
615e : 60 __ __ RTS
.s17:
615f : ad ee bf LDA $bfee ; (sstack + 4)
6162 : 85 51 __ STA T2 + 0 
6164 : a9 04 __ LDA #$04
6166 : 85 5b __ STA T7 + 0 
.l18:
6168 : 18 __ __ CLC
6169 : a5 55 __ LDA T4 + 0 
616b : 65 69 __ ADC T15 + 0 
616d : 85 53 __ STA T3 + 0 
616f : a5 56 __ LDA T4 + 1 
6171 : 65 6a __ ADC T15 + 1 
6173 : 85 54 __ STA T3 + 1 
6175 : a5 69 __ LDA T15 + 0 
6177 : 85 57 __ STA T5 + 0 
6179 : a5 6a __ LDA T15 + 1 
617b : 85 58 __ STA T5 + 1 
617d : 18 __ __ CLC
617e : a5 51 __ LDA T2 + 0 
6180 : 69 10 __ ADC #$10
6182 : 29 3f __ AND #$3f
6184 : aa __ __ TAX
6185 : bd 4b 80 LDA $804b,x ; (sin64[0] + 0)
6188 : 85 59 __ STA T6 + 0 
618a : 29 80 __ AND #$80
618c : 10 02 __ BPL $6190 ; (draw_ball.l18 + 40)
618e : a9 ff __ LDA #$ff
6190 : 85 5a __ STA T6 + 1 
6192 : a5 54 __ LDA T3 + 1 
6194 : d0 5d __ BNE $61f3 ; (draw_ball.l22 + 0)
.l29:
6196 : a5 53 __ LDA T3 + 0 
6198 : c9 c8 __ CMP #$c8
619a : b0 57 __ BCS $61f3 ; (draw_ball.l22 + 0)
.s20:
619c : a5 57 __ LDA T5 + 0 
619e : 85 03 __ STA WORK + 0 
61a0 : 85 1b __ STA ACCU + 0 ; (cy + 0)
61a2 : a5 58 __ LDA T5 + 1 
61a4 : 85 04 __ STA WORK + 1 
61a6 : 85 1c __ STA ACCU + 1 ; (cy + 1)
61a8 : 20 0c 78 JSR $780c ; (mul16 + 0)
61ab : 38 __ __ SEC
61ac : a5 67 __ LDA T14 + 0 
61ae : e5 05 __ SBC WORK + 2 
61b0 : 85 0d __ STA P0 
61b2 : a5 68 __ LDA T14 + 1 
61b4 : e5 06 __ SBC WORK + 3 
61b6 : 30 3b __ BMI $61f3 ; (draw_ball.l22 + 0)
.s28:
61b8 : 85 0e __ STA P1 
61ba : 05 0d __ ORA P0 
61bc : f0 35 __ BEQ $61f3 ; (draw_ball.l22 + 0)
.s21:
61be : 20 76 5d JSR $5d76 ; (mc_isqrt.s4 + 0)
61c1 : a5 1b __ LDA ACCU + 0 ; (cy + 0)
61c3 : 85 03 __ STA WORK + 0 
61c5 : a5 1c __ LDA ACCU + 1 ; (cy + 1)
61c7 : 85 04 __ STA WORK + 1 
61c9 : a5 53 __ LDA T3 + 0 
61cb : 85 0f __ STA P2 
61cd : a9 00 __ LDA #$00
61cf : 85 10 __ STA P3 
61d1 : 85 11 __ STA P4 
61d3 : a5 59 __ LDA T6 + 0 
61d5 : 85 1b __ STA ACCU + 0 ; (cy + 0)
61d7 : a5 5a __ LDA T6 + 1 
61d9 : 85 1c __ STA ACCU + 1 ; (cy + 1)
61db : 20 0c 78 JSR $780c ; (mul16 + 0)
61de : 20 6a 7c JSR $7c6a ; (divs16@proxy + 0)
61e1 : ad ea bf LDA $bfea ; (sstack + 0)
61e4 : 18 __ __ CLC
61e5 : 65 1b __ ADC ACCU + 0 ; (cy + 0)
61e7 : 85 0d __ STA P0 
61e9 : ad eb bf LDA $bfeb ; (sstack + 1)
61ec : 65 1c __ ADC ACCU + 1 ; (cy + 1)
61ee : 85 0e __ STA P1 
61f0 : 20 d4 5b JSR $5bd4 ; (mc_setpix.s4 + 0)
.l22:
61f3 : e6 53 __ INC T3 + 0 
61f5 : d0 02 __ BNE $61f9 ; (draw_ball.s92 + 0)
.s91:
61f7 : e6 54 __ INC T3 + 1 
.s92:
61f9 : e6 57 __ INC T5 + 0 
61fb : d0 02 __ BNE $61ff ; (draw_ball.s94 + 0)
.s93:
61fd : e6 58 __ INC T5 + 1 
.s94:
61ff : a5 5e __ LDA T9 + 1 
6201 : c5 58 __ CMP T5 + 1 
6203 : d0 08 __ BNE $620d ; (draw_ball.s27 + 0)
.s24:
6205 : a5 5d __ LDA T9 + 0 
6207 : c5 57 __ CMP T5 + 0 
.s25:
6209 : 90 08 __ BCC $6213 ; (draw_ball.s23 + 0)
620b : b0 17 __ BCS $6224 ; (draw_ball.s19 + 0)
.s27:
620d : 45 58 __ EOR T5 + 1 
620f : 10 f8 __ BPL $6209 ; (draw_ball.s25 + 0)
.s26:
6211 : 90 11 __ BCC $6224 ; (draw_ball.s19 + 0)
.s23:
6213 : 18 __ __ CLC
6214 : a5 51 __ LDA T2 + 0 
6216 : 69 10 __ ADC #$10
6218 : 85 51 __ STA T2 + 0 
621a : c6 5b __ DEC T7 + 0 
621c : f0 03 __ BEQ $6221 ; (draw_ball.s23 + 14)
621e : 4c 68 61 JMP $6168 ; (draw_ball.l18 + 0)
6221 : 4c 54 61 JMP $6154 ; (draw_ball.s3 + 0)
.s19:
6224 : a5 54 __ LDA T3 + 1 
6226 : d0 cb __ BNE $61f3 ; (draw_ball.l22 + 0)
6228 : 4c 96 61 JMP $6196 ; (draw_ball.l29 + 0)
--------------------------------------------------------------------
mc_hspan: ; mc_hspan(i16,i16,i16,u8)->void
;  65, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
622b : a5 13 __ LDA P6 ; (my + 1)
622d : f0 01 __ BEQ $6230 ; (mc_hspan.s39 + 0)
622f : 60 __ __ RTS
.s39:
6230 : a5 12 __ LDA P5 ; (my + 0)
6232 : c9 c8 __ CMP #$c8
6234 : 90 01 __ BCC $6237 ; (mc_hspan.s5 + 0)
6236 : 60 __ __ RTS
.s5:
6237 : 24 15 __ BIT P8 ; (x0 + 1)
6239 : 10 08 __ BPL $6243 ; (mc_hspan.s49 + 0)
.s38:
623b : a9 00 __ LDA #$00
623d : 85 14 __ STA P7 ; (x0 + 0)
623f : 85 15 __ STA P8 ; (x0 + 1)
6241 : 90 02 __ BCC $6245 ; (mc_hspan.s6 + 0)
.s49:
6243 : a5 14 __ LDA P7 ; (x0 + 0)
.s6:
6245 : 85 46 __ STA T4 + 0 
6247 : a6 15 __ LDX P8 ; (x0 + 1)
6249 : a5 17 __ LDA P10 ; (x1 + 1)
624b : 10 01 __ BPL $624e ; (mc_hspan.s37 + 0)
624d : 60 __ __ RTS
.s37:
624e : 86 47 __ STX T4 + 1 
6250 : d0 09 __ BNE $625b ; (mc_hspan.s34 + 0)
.s36:
6252 : a5 16 __ LDA P9 ; (x1 + 0)
6254 : c9 a0 __ CMP #$a0
6256 : b0 03 __ BCS $625b ; (mc_hspan.s34 + 0)
6258 : 4c c3 63 JMP $63c3 ; (mc_hspan.s7 + 0)
.s34:
625b : a9 9f __ LDA #$9f
625d : 85 16 __ STA P9 ; (x1 + 0)
625f : a9 00 __ LDA #$00
6261 : 85 17 __ STA P10 ; (x1 + 1)
6263 : 8a __ __ TXA
6264 : f0 01 __ BEQ $6267 ; (mc_hspan.s35 + 0)
6266 : 60 __ __ RTS
.s35:
6267 : a5 14 __ LDA P7 ; (x0 + 0)
6269 : c9 a0 __ CMP #$a0
626b : 90 01 __ BCC $626e ; (mc_hspan.s8 + 0)
626d : 60 __ __ RTS
.s8:
626e : a5 16 __ LDA P9 ; (x1 + 0)
6270 : 85 4a __ STA T6 + 0 
6272 : 85 48 __ STA T5 + 0 
6274 : a5 14 __ LDA P7 ; (x0 + 0)
6276 : 4a __ __ LSR
6277 : 4a __ __ LSR
6278 : 85 4c __ STA T7 + 0 
627a : a5 17 __ LDA P10 ; (x1 + 1)
627c : 85 49 __ STA T5 + 1 
627e : 4a __ __ LSR
627f : 66 4a __ ROR T6 + 0 
6281 : 4a __ __ LSR
6282 : 66 4a __ ROR T6 + 0 
6284 : 49 20 __ EOR #$20
6286 : 38 __ __ SEC
6287 : e9 20 __ SBC #$20
6289 : 85 4b __ STA T6 + 1 
628b : d0 09 __ BNE $6296 ; (mc_hspan.s9 + 0)
.s31:
628d : a5 4c __ LDA T7 + 0 
628f : c5 4a __ CMP T6 + 0 
6291 : d0 03 __ BNE $6296 ; (mc_hspan.s9 + 0)
6293 : 4c 94 63 JMP $6394 ; (mc_hspan.s26 + 0)
.s9:
6296 : a5 12 __ LDA P5 ; (my + 0)
6298 : 85 0f __ STA P2 
629a : 29 07 __ AND #$07
629c : 85 1b __ STA ACCU + 0 
629e : a5 12 __ LDA P5 ; (my + 0)
62a0 : 4a __ __ LSR
62a1 : 4a __ __ LSR
62a2 : 4a __ __ LSR
62a3 : 85 43 __ STA T1 + 0 
62a5 : 0a __ __ ASL
62a6 : 0a __ __ ASL
62a7 : 65 43 __ ADC T1 + 0 
62a9 : 4a __ __ LSR
62aa : 6a __ __ ROR
62ab : aa __ __ TAX
62ac : 29 80 __ AND #$80
62ae : 6a __ __ ROR
62af : 05 1b __ ORA ACCU + 0 
62b1 : 85 4d __ STA T8 + 0 
62b3 : 8a __ __ TXA
62b4 : 29 3f __ AND #$3f
62b6 : 69 e0 __ ADC #$e0
62b8 : 85 4e __ STA T8 + 1 
62ba : a5 18 __ LDA P11 ; (col + 0)
62bc : 85 1c __ STA ACCU + 1 
62be : 0a __ __ ASL
62bf : 0a __ __ ASL
62c0 : 05 18 __ ORA P11 ; (col + 0)
62c2 : 85 43 __ STA T1 + 0 
62c4 : a5 18 __ LDA P11 ; (col + 0)
62c6 : 0a __ __ ASL
62c7 : 0a __ __ ASL
62c8 : 0a __ __ ASL
62c9 : 0a __ __ ASL
62ca : 05 43 __ ORA T1 + 0 
62cc : 85 43 __ STA T1 + 0 
62ce : a9 00 __ LDA #$00
62d0 : 85 10 __ STA P3 
62d2 : 46 1c __ LSR ACCU + 1 
62d4 : 6a __ __ ROR
62d5 : 66 1c __ ROR ACCU + 1 
62d7 : 6a __ __ ROR
62d8 : 05 43 __ ORA T1 + 0 
62da : 85 45 __ STA T2 + 0 
.l10:
62dc : 20 c8 5b JSR $5bc8 ; (mc_setpix@proxy + 0)
62df : 18 __ __ CLC
62e0 : a5 0d __ LDA P0 
62e2 : 69 01 __ ADC #$01
62e4 : 85 46 __ STA T4 + 0 
62e6 : 85 1b __ STA ACCU + 0 
62e8 : a5 0e __ LDA P1 
62ea : 69 00 __ ADC #$00
62ec : 85 47 __ STA T4 + 1 
62ee : 4a __ __ LSR
62ef : 66 1b __ ROR ACCU + 0 
62f1 : 4a __ __ LSR
62f2 : 66 1b __ ROR ACCU + 0 
62f4 : 49 20 __ EOR #$20
62f6 : c9 20 __ CMP #$20
62f8 : d0 06 __ BNE $6300 ; (mc_hspan.s11 + 0)
.s25:
62fa : a5 1b __ LDA ACCU + 0 
62fc : c5 4c __ CMP T7 + 0 
62fe : f0 dc __ BEQ $62dc ; (mc_hspan.l10 + 0)
.s11:
6300 : a9 00 __ LDA #$00
6302 : 85 1c __ STA ACCU + 1 
6304 : a6 4c __ LDX T7 + 0 
6306 : e8 __ __ INX
6307 : a5 4b __ LDA T6 + 1 
6309 : 30 43 __ BMI $634e ; (mc_hspan.s12 + 0)
.s24:
630b : f0 04 __ BEQ $6311 ; (mc_hspan.s23 + 0)
.s40:
630d : 8a __ __ TXA
630e : 4c 16 63 JMP $6316 ; (mc_hspan.s19 + 0)
.s23:
6311 : 8a __ __ TXA
6312 : e4 4a __ CPX T6 + 0 
6314 : b0 38 __ BCS $634e ; (mc_hspan.s12 + 0)
.s19:
6316 : 0a __ __ ASL
6317 : 0a __ __ ASL
6318 : 0a __ __ ASL
6319 : a0 00 __ LDY #$00
631b : 90 02 __ BCC $631f ; (mc_hspan.s42 + 0)
.s41:
631d : c8 __ __ INY
631e : 18 __ __ CLC
.s42:
631f : 65 4d __ ADC T8 + 0 
6321 : 85 43 __ STA T1 + 0 
6323 : 98 __ __ TYA
6324 : 65 4e __ ADC T8 + 1 
6326 : 85 44 __ STA T1 + 1 
.l20:
6328 : a5 45 __ LDA T2 + 0 
632a : a0 00 __ LDY #$00
632c : 91 43 __ STA (T1 + 0),y 
632e : 24 4b __ BIT T6 + 1 
6330 : 30 1c __ BMI $634e ; (mc_hspan.s12 + 0)
.s22:
6332 : e8 __ __ INX
6333 : d0 02 __ BNE $6337 ; (mc_hspan.s44 + 0)
.s43:
6335 : e6 1c __ INC ACCU + 1 
.s44:
6337 : 18 __ __ CLC
6338 : a5 43 __ LDA T1 + 0 
633a : 69 08 __ ADC #$08
633c : 85 43 __ STA T1 + 0 
633e : 90 02 __ BCC $6342 ; (mc_hspan.s46 + 0)
.s45:
6340 : e6 44 __ INC T1 + 1 
.s46:
6342 : a5 1c __ LDA ACCU + 1 
6344 : c5 4b __ CMP T6 + 1 
6346 : 90 e0 __ BCC $6328 ; (mc_hspan.l20 + 0)
.s48:
6348 : d0 04 __ BNE $634e ; (mc_hspan.s12 + 0)
.s21:
634a : e4 4a __ CPX T6 + 0 
634c : 90 da __ BCC $6328 ; (mc_hspan.l20 + 0)
.s12:
634e : 06 4a __ ASL T6 + 0 
6350 : 26 4b __ ROL T6 + 1 
6352 : 06 4a __ ASL T6 + 0 
6354 : 26 4b __ ROL T6 + 1 
6356 : a9 00 __ LDA #$00
6358 : 85 10 __ STA P3 
635a : f0 20 __ BEQ $637c ; (mc_hspan.l13 + 0)
.s14:
635c : a5 4a __ LDA T6 + 0 
635e : 85 0d __ STA P0 
6360 : a5 4b __ LDA T6 + 1 
6362 : 85 0e __ STA P1 
6364 : a5 12 __ LDA P5 ; (my + 0)
6366 : 85 0f __ STA P2 
6368 : a5 18 __ LDA P11 ; (col + 0)
636a : 85 11 __ STA P4 
636c : 20 d4 5b JSR $5bd4 ; (mc_setpix.s4 + 0)
636f : 18 __ __ CLC
6370 : a5 0d __ LDA P0 
6372 : 69 01 __ ADC #$01
6374 : 85 4a __ STA T6 + 0 
6376 : a5 0e __ LDA P1 
6378 : 69 00 __ ADC #$00
637a : 85 4b __ STA T6 + 1 
.l13:
637c : a5 49 __ LDA T5 + 1 
637e : c5 4b __ CMP T6 + 1 
6380 : d0 07 __ BNE $6389 ; (mc_hspan.s18 + 0)
.s15:
6382 : a5 48 __ LDA T5 + 0 
6384 : c5 4a __ CMP T6 + 0 
6386 : 4c 8d 63 JMP $638d ; (mc_hspan.s16 + 0)
.s18:
6389 : 45 4b __ EOR T6 + 1 
638b : 30 03 __ BMI $6390 ; (mc_hspan.s17 + 0)
.s16:
638d : b0 cd __ BCS $635c ; (mc_hspan.s14 + 0)
.s3:
638f : 60 __ __ RTS
.s17:
6390 : b0 fd __ BCS $638f ; (mc_hspan.s3 + 0)
6392 : 90 c8 __ BCC $635c ; (mc_hspan.s14 + 0)
.s26:
6394 : a5 17 __ LDA P10 ; (x1 + 1)
6396 : c5 15 __ CMP P8 ; (x0 + 1)
6398 : d0 04 __ BNE $639e ; (mc_hspan.l47 + 0)
.s28:
639a : a5 48 __ LDA T5 + 0 
639c : c5 46 __ CMP T4 + 0 
.l47:
639e : 90 ef __ BCC $638f ; (mc_hspan.s3 + 0)
.s50:
63a0 : a9 00 __ LDA #$00
63a2 : 85 10 __ STA P3 
63a4 : a5 12 __ LDA P5 ; (my + 0)
63a6 : 85 0f __ STA P2 
.l27:
63a8 : 20 c8 5b JSR $5bc8 ; (mc_setpix@proxy + 0)
63ab : 18 __ __ CLC
63ac : a5 0d __ LDA P0 
63ae : 69 01 __ ADC #$01
63b0 : 85 46 __ STA T4 + 0 
63b2 : a5 0e __ LDA P1 
63b4 : 69 00 __ ADC #$00
63b6 : 85 47 __ STA T4 + 1 
63b8 : a5 49 __ LDA T5 + 1 
63ba : 30 d3 __ BMI $638f ; (mc_hspan.s3 + 0)
.s30:
63bc : c5 47 __ CMP T4 + 1 
63be : f0 da __ BEQ $639a ; (mc_hspan.s28 + 0)
.s29:
63c0 : b0 e6 __ BCS $63a8 ; (mc_hspan.l27 + 0)
63c2 : 60 __ __ RTS
.s7:
63c3 : a5 17 __ LDA P10 ; (x1 + 1)
63c5 : c5 15 __ CMP P8 ; (x0 + 1)
63c7 : d0 04 __ BNE $63cd ; (mc_hspan.s33 + 0)
.s32:
63c9 : a5 16 __ LDA P9 ; (x1 + 0)
63cb : c5 14 __ CMP P7 ; (x0 + 0)
.s33:
63cd : 90 c0 __ BCC $638f ; (mc_hspan.s3 + 0)
63cf : 4c 6e 62 JMP $626e ; (mc_hspan.s8 + 0)
--------------------------------------------------------------------
vectors_run: ; vectors_run()->void
;   3, "/home/xahmol/git/UltimateDemo2026/src/vectors.h"
.s1:
63d2 : a2 04 __ LDX #$04
63d4 : b5 53 __ LDA T3 + 0,x 
63d6 : 9d c6 bf STA $bfc6,x ; (vectors_run@stack + 0)
63d9 : ca __ __ DEX
63da : 10 f8 __ BPL $63d4 ; (vectors_run.s1 + 2)
.s4:
63dc : 20 a5 64 JSR $64a5 ; (vec_init.s4 + 0)
63df : a9 00 __ LDA #$00
63e1 : 85 53 __ STA T3 + 0 
63e3 : 85 54 __ STA T4 + 0 
63e5 : a9 a8 __ LDA #$a8
63e7 : 85 55 __ STA T5 + 0 
63e9 : a9 fd __ LDA #$fd
63eb : 85 56 __ STA T5 + 1 
.l5:
63ed : 2c 11 d0 BIT $d011 
63f0 : 30 fb __ BMI $63ed ; (vectors_run.l5 + 0)
.l6:
63f2 : 2c 11 d0 BIT $d011 
63f5 : 10 fb __ BPL $63f2 ; (vectors_run.l6 + 0)
.s7:
63f7 : a9 00 __ LDA #$00
63f9 : 85 57 __ STA T6 + 0 
63fb : 85 0f __ STA P2 
63fd : 85 10 __ STA P3 
63ff : 85 0d __ STA P0 
6401 : 20 45 7c JSR $7c45 ; (memset@proxy + 0)
6404 : e6 53 __ INC T3 + 0 
6406 : a5 53 __ LDA T3 + 0 
6408 : 85 0d __ STA P0 
640a : a6 54 __ LDX T4 + 0 
640c : e8 __ __ INX
640d : e8 __ __ INX
640e : 86 54 __ STX T4 + 0 
6410 : 86 0e __ STX P1 
6412 : 20 12 65 JSR $6512 ; (project.s1 + 0)
.l8:
6415 : a9 d6 __ LDA #$d6
6417 : 8d ea bf STA $bfea ; (sstack + 0)
641a : a9 86 __ LDA #$86
641c : 8d eb bf STA $bfeb ; (sstack + 1)
641f : a9 f3 __ LDA #$f3
6421 : 8d ec bf STA $bfec ; (sstack + 2)
6424 : a9 80 __ LDA #$80
6426 : 8d ed bf STA $bfed ; (sstack + 3)
6429 : a9 00 __ LDA #$00
642b : 8d f6 bf STA $bff6 ; (sstack + 12)
642e : a4 57 __ LDY T6 + 0 
6430 : b9 26 83 LDA $8326,y ; (cube_e[0][0] + 0)
6433 : 0a __ __ ASL
6434 : aa __ __ TAX
6435 : bd ee 86 LDA $86ee,x ; (px_cur[0] + 0)
6438 : 8d ee bf STA $bfee ; (sstack + 4)
643b : bd ef 86 LDA $86ef,x ; (px_cur[0] + 1)
643e : 8d ef bf STA $bfef ; (sstack + 5)
6441 : bd de 86 LDA $86de,x ; (py_cur[0] + 0)
6444 : 8d f0 bf STA $bff0 ; (sstack + 6)
6447 : bd df 86 LDA $86df,x ; (py_cur[0] + 1)
644a : 8d f1 bf STA $bff1 ; (sstack + 7)
644d : b9 27 83 LDA $8327,y ; (cube_e[0][0] + 1)
6450 : 0a __ __ ASL
6451 : aa __ __ TAX
6452 : bd ee 86 LDA $86ee,x ; (px_cur[0] + 0)
6455 : 8d f2 bf STA $bff2 ; (sstack + 8)
6458 : bd ef 86 LDA $86ef,x ; (px_cur[0] + 1)
645b : 8d f3 bf STA $bff3 ; (sstack + 9)
645e : bd de 86 LDA $86de,x ; (py_cur[0] + 0)
6461 : 8d f4 bf STA $bff4 ; (sstack + 10)
6464 : bd df 86 LDA $86df,x ; (py_cur[0] + 1)
6467 : 8d f5 bf STA $bff5 ; (sstack + 11)
646a : 20 b0 37 JSR $37b0 ; (bm_line.s1 + 0)
646d : 18 __ __ CLC
646e : a5 57 __ LDA T6 + 0 
6470 : 69 02 __ ADC #$02
6472 : 85 57 __ STA T6 + 0 
6474 : c9 18 __ CMP #$18
6476 : d0 9d __ BNE $6415 ; (vectors_run.l8 + 0)
.s9:
6478 : e6 55 __ INC T5 + 0 
647a : f0 03 __ BEQ $647f ; (vectors_run.s11 + 0)
647c : 4c ed 63 JMP $63ed ; (vectors_run.l5 + 0)
.s11:
647f : e6 56 __ INC T5 + 1 
6481 : d0 f9 __ BNE $647c ; (vectors_run.s9 + 4)
.s10:
6483 : a9 00 __ LDA #$00
6485 : 85 0d __ STA P0 
6487 : 85 0e __ STA P1 
6489 : 85 10 __ STA P3 
648b : a9 36 __ LDA #$36
648d : 85 01 __ STA $01 
648f : 20 88 0f JSR $0f88 ; (vic_setmode@proxy + 0)
6492 : a9 00 __ LDA #$00
6494 : 8d 20 d0 STA $d020 
6497 : 8d 21 d0 STA $d021 
.s3:
649a : a2 04 __ LDX #$04
649c : bd c6 bf LDA $bfc6,x ; (vectors_run@stack + 0)
649f : 95 53 __ STA T3 + 0,x 
64a1 : ca __ __ DEX
64a2 : 10 f8 __ BPL $649c ; (vectors_run.s3 + 2)
64a4 : 60 __ __ RTS
--------------------------------------------------------------------
vec_init: ; vec_init()->void
; 116, "/home/xahmol/git/UltimateDemo2026/src/vectors.c"
.s4:
64a5 : 78 __ __ SEI
64a6 : a9 00 __ LDA #$00
64a8 : 85 0f __ STA P2 
64aa : 85 10 __ STA P3 
64ac : a9 30 __ LDA #$30
64ae : 85 01 __ STA $01 
64b0 : a9 40 __ LDA #$40
64b2 : 85 11 __ STA P4 
64b4 : a9 1f __ LDA #$1f
64b6 : 85 12 __ STA P5 
64b8 : a9 10 __ LDA #$10
64ba : a2 fa __ LDX #$fa
.l6:
64bc : ca __ __ DEX
64bd : 9d 00 d0 STA $d000,x 
64c0 : 9d fa d0 STA $d0fa,x 
64c3 : 9d f4 d1 STA $d1f4,x 
64c6 : 9d ee d2 STA $d2ee,x 
64c9 : d0 f1 __ BNE $64bc ; (vec_init.l6 + 0)
.s5:
64cb : a9 00 __ LDA #$00
64cd : 85 43 __ STA T1 + 0 
64cf : 85 0d __ STA P0 
64d1 : a9 e0 __ LDA #$e0
64d3 : 85 44 __ STA T1 + 1 
64d5 : 85 0e __ STA P1 
64d7 : 20 14 24 JSR $2414 ; (memset.s4 + 0)
64da : a9 35 __ LDA #$35
64dc : 85 01 __ STA $01 
64de : 20 30 24 JSR $2430 ; (mmap_trampoline.s4 + 0)
64e1 : 58 __ __ CLI
64e2 : 20 b4 7c JSR $7cb4 ; (vic_setmode@proxy + 0)
64e5 : a5 10 __ LDA P3 
64e7 : 8d d6 86 STA $86d6 ; (VScreen.data + 0)
64ea : a5 11 __ LDA P4 
64ec : 8d d7 86 STA $86d7 ; (VScreen.data + 1)
64ef : a9 28 __ LDA #$28
64f1 : 8d da 86 STA $86da ; (VScreen.cwidth + 0)
64f4 : a9 19 __ LDA #$19
64f6 : 8d db 86 STA $86db ; (VScreen.cheight + 0)
64f9 : a9 40 __ LDA #$40
64fb : 8d dc 86 STA $86dc ; (VScreen.width + 0)
64fe : a9 01 __ LDA #$01
6500 : 8d dd 86 STA $86dd ; (VScreen.width + 1)
6503 : a9 00 __ LDA #$00
6505 : 8d 20 d0 STA $d020 
6508 : 8d 21 d0 STA $d021 
650b : 8d d8 86 STA $86d8 ; (VScreen.rdata + 0)
650e : 8d d9 86 STA $86d9 ; (VScreen.rdata + 1)
.s3:
6511 : 60 __ __ RTS
--------------------------------------------------------------------
project: ; project(u8,u8,i16*,i16*)->void
;  81, "/home/xahmol/git/UltimateDemo2026/src/vectors.c"
.s1:
6512 : a2 0e __ LDX #$0e
6514 : b5 53 __ LDA T4 + 0,x 
6516 : 9d d2 bf STA $bfd2,x ; (project@stack + 0)
6519 : ca __ __ DEX
651a : 10 f8 __ BPL $6514 ; (project.s1 + 2)
.s4:
651c : a5 0d __ LDA P0 ; (ax + 0)
651e : 0a __ __ ASL
651f : 85 47 __ STA T1 + 0 
6521 : a9 81 __ LDA #$81
6523 : 69 00 __ ADC #$00
6525 : 85 5a __ STA T7 + 1 
6527 : 18 __ __ CLC
6528 : a5 0e __ LDA P1 ; (ay + 0)
652a : 69 40 __ ADC #$40
652c : 0a __ __ ASL
652d : 85 4b __ STA T2 + 0 
652f : a9 00 __ LDA #$00
6531 : 85 48 __ STA T1 + 1 
6533 : 2a __ __ ROL
6534 : aa __ __ TAX
6535 : a9 26 __ LDA #$26
6537 : 85 59 __ STA T7 + 0 
6539 : 65 4b __ ADC T2 + 0 
653b : 85 5b __ STA T8 + 0 
653d : 8a __ __ TXA
653e : 69 81 __ ADC #$81
6540 : 85 5c __ STA T8 + 1 
6542 : 06 0e __ ASL P1 ; (ay + 0)
6544 : 26 48 __ ROL T1 + 1 
6546 : 18 __ __ CLC
6547 : a9 26 __ LDA #$26
6549 : 65 0e __ ADC P1 ; (ay + 0)
654b : 85 5d __ STA T9 + 0 
654d : a9 81 __ LDA #$81
654f : 65 48 __ ADC T1 + 1 
6551 : 85 5e __ STA T9 + 1 
6553 : 18 __ __ CLC
6554 : a5 0d __ LDA P0 ; (ax + 0)
6556 : 69 40 __ ADC #$40
6558 : 0a __ __ ASL
6559 : a2 00 __ LDX #$00
655b : 90 02 __ BCC $655f ; (project.s11 + 0)
.s10:
655d : e8 __ __ INX
655e : 18 __ __ CLC
.s11:
655f : 69 26 __ ADC #$26
6561 : 85 5f __ STA T10 + 0 
6563 : 8a __ __ TXA
6564 : 69 81 __ ADC #$81
6566 : 85 60 __ STA T10 + 1 
6568 : a9 00 __ LDA #$00
656a : 85 52 __ STA T11 + 0 
.l5:
656c : 85 61 __ STA T12 + 0 
656e : aa __ __ TAX
656f : bd 0e 81 LDA $810e,x ; (cube_v[0][0] + 0)
6572 : 29 80 __ AND #$80
6574 : 10 02 __ BPL $6578 ; (project.l5 + 12)
6576 : a9 ff __ LDA #$ff
6578 : 85 04 __ STA WORK + 1 
657a : 85 44 __ STA T0 + 1 
657c : bd 0e 81 LDA $810e,x ; (cube_v[0][0] + 0)
657f : 0a __ __ ASL
6580 : 0a __ __ ASL
6581 : 18 __ __ CLC
6582 : 7d 0e 81 ADC $810e,x ; (cube_v[0][0] + 0)
6585 : 0a __ __ ASL
6586 : 0a __ __ ASL
6587 : 0a __ __ ASL
6588 : 0a __ __ ASL
6589 : 85 43 __ STA T0 + 0 
658b : 85 03 __ STA WORK + 0 
658d : a5 04 __ LDA WORK + 1 
658f : 29 80 __ AND #$80
6591 : 10 02 __ BPL $6595 ; (project.l5 + 41)
6593 : a9 ff __ LDA #$ff
6595 : 85 45 __ STA T0 + 2 
6597 : 85 06 __ STA WORK + 3 
6599 : 85 05 __ STA WORK + 2 
659b : a0 00 __ LDY #$00
659d : b1 5b __ LDA (T8 + 0),y 
659f : 85 0e __ STA P1 ; (ay + 0)
65a1 : 85 1b __ STA ACCU + 0 
65a3 : c8 __ __ INY
65a4 : b1 5b __ LDA (T8 + 0),y 
65a6 : 85 48 __ STA T1 + 1 
65a8 : 85 1c __ STA ACCU + 1 
65aa : 29 80 __ AND #$80
65ac : 10 02 __ BPL $65b0 ; (project.l5 + 68)
65ae : a9 ff __ LDA #$ff
65b0 : 85 49 __ STA T1 + 2 
65b2 : 85 1d __ STA ACCU + 2 
65b4 : 85 1e __ STA ACCU + 3 
65b6 : 20 12 79 JSR $7912 ; (mul32 + 0)
65b9 : a5 07 __ LDA WORK + 4 
65bb : 85 4b __ STA T2 + 0 
65bd : a5 08 __ LDA WORK + 5 
65bf : 85 4c __ STA T2 + 1 
65c1 : a5 09 __ LDA WORK + 6 
65c3 : 85 4d __ STA T2 + 2 
65c5 : a5 0a __ LDA WORK + 7 
65c7 : 85 4e __ STA T2 + 3 
65c9 : a0 00 __ LDY #$00
65cb : b1 5d __ LDA (T9 + 0),y 
65cd : 85 4f __ STA T3 + 0 
65cf : 85 03 __ STA WORK + 0 
65d1 : c8 __ __ INY
65d2 : b1 5d __ LDA (T9 + 0),y 
65d4 : 85 50 __ STA T3 + 1 
65d6 : 85 04 __ STA WORK + 1 
65d8 : 29 80 __ AND #$80
65da : 10 02 __ BPL $65de ; (project.l5 + 114)
65dc : a9 ff __ LDA #$ff
65de : 85 51 __ STA T3 + 2 
65e0 : 85 06 __ STA WORK + 3 
65e2 : 85 05 __ STA WORK + 2 
65e4 : a6 61 __ LDX T12 + 0 
65e6 : bd 10 81 LDA $8110,x ; (cube_v[0][0] + 2)
65e9 : 29 80 __ AND #$80
65eb : 10 02 __ BPL $65ef ; (project.l5 + 131)
65ed : a9 ff __ LDA #$ff
65ef : 85 1c __ STA ACCU + 1 
65f1 : 85 54 __ STA T4 + 1 
65f3 : bd 10 81 LDA $8110,x ; (cube_v[0][0] + 2)
65f6 : 0a __ __ ASL
65f7 : 0a __ __ ASL
65f8 : 18 __ __ CLC
65f9 : 7d 10 81 ADC $8110,x ; (cube_v[0][0] + 2)
65fc : 0a __ __ ASL
65fd : 0a __ __ ASL
65fe : 0a __ __ ASL
65ff : 0a __ __ ASL
6600 : 85 53 __ STA T4 + 0 
6602 : 85 1b __ STA ACCU + 0 
6604 : a5 1c __ LDA ACCU + 1 
6606 : 29 80 __ AND #$80
6608 : 10 02 __ BPL $660c ; (project.l5 + 160)
660a : a9 ff __ LDA #$ff
660c : 85 55 __ STA T4 + 2 
660e : 85 1d __ STA ACCU + 2 
6610 : 85 1e __ STA ACCU + 3 
6612 : 20 12 79 JSR $7912 ; (mul32 + 0)
6615 : 18 __ __ CLC
6616 : a5 07 __ LDA WORK + 4 
6618 : 65 4b __ ADC T2 + 0 
661a : a5 08 __ LDA WORK + 5 
661c : 65 4c __ ADC T2 + 1 
661e : 85 4b __ STA T2 + 0 
6620 : a5 09 __ LDA WORK + 6 
6622 : 65 4d __ ADC T2 + 2 
6624 : 85 4c __ STA T2 + 1 
6626 : a5 0a __ LDA WORK + 7 
6628 : 65 4e __ ADC T2 + 3 
662a : 85 4e __ STA T2 + 3 
662c : a4 47 __ LDY T1 + 0 
662e : b1 59 __ LDA (T7 + 0),y 
6630 : 85 56 __ STA T5 + 0 
6632 : c8 __ __ INY
6633 : b1 59 __ LDA (T7 + 0),y 
6635 : 85 57 __ STA T5 + 1 
6637 : 29 80 __ AND #$80
6639 : 10 02 __ BPL $663d ; (project.l5 + 209)
663b : a9 ff __ LDA #$ff
663d : 85 58 __ STA T5 + 2 
663f : a5 53 __ LDA T4 + 0 
6641 : 85 1b __ STA ACCU + 0 
6643 : a5 54 __ LDA T4 + 1 
6645 : 85 1c __ STA ACCU + 1 
6647 : a5 55 __ LDA T4 + 2 
6649 : 85 1d __ STA ACCU + 2 
664b : 85 1e __ STA ACCU + 3 
664d : a5 0e __ LDA P1 ; (ay + 0)
664f : 85 03 __ STA WORK + 0 
6651 : a5 48 __ LDA T1 + 1 
6653 : 85 04 __ STA WORK + 1 
6655 : a5 49 __ LDA T1 + 2 
6657 : 85 05 __ STA WORK + 2 
6659 : 85 06 __ STA WORK + 3 
665b : 20 12 79 JSR $7912 ; (mul32 + 0)
665e : a5 07 __ LDA WORK + 4 
6660 : 85 0e __ STA P1 ; (ay + 0)
6662 : a5 08 __ LDA WORK + 5 
6664 : 85 48 __ STA T1 + 1 
6666 : a5 09 __ LDA WORK + 6 
6668 : 85 49 __ STA T1 + 2 
666a : a5 0a __ LDA WORK + 7 
666c : 85 4a __ STA T1 + 3 
666e : 38 __ __ SEC
666f : a9 00 __ LDA #$00
6671 : e5 4f __ SBC T3 + 0 
6673 : 85 1b __ STA ACCU + 0 
6675 : a9 00 __ LDA #$00
6677 : e5 50 __ SBC T3 + 1 
6679 : 85 1c __ STA ACCU + 1 
667b : a9 00 __ LDA #$00
667d : e5 51 __ SBC T3 + 2 
667f : 85 1d __ STA ACCU + 2 
6681 : a9 00 __ LDA #$00
6683 : e5 51 __ SBC T3 + 2 
6685 : 85 1e __ STA ACCU + 3 
6687 : a5 43 __ LDA T0 + 0 
6689 : 85 03 __ STA WORK + 0 
668b : a5 44 __ LDA T0 + 1 
668d : 85 04 __ STA WORK + 1 
668f : a5 45 __ LDA T0 + 2 
6691 : 85 05 __ STA WORK + 2 
6693 : 85 06 __ STA WORK + 3 
6695 : 20 12 79 JSR $7912 ; (mul32 + 0)
6698 : 18 __ __ CLC
6699 : a5 07 __ LDA WORK + 4 
669b : 65 0e __ ADC P1 ; (ay + 0)
669d : a5 08 __ LDA WORK + 5 
669f : 65 48 __ ADC T1 + 1 
66a1 : 85 43 __ STA T0 + 0 
66a3 : a5 09 __ LDA WORK + 6 
66a5 : 65 49 __ ADC T1 + 2 
66a7 : 85 44 __ STA T0 + 1 
66a9 : a5 0a __ LDA WORK + 7 
66ab : 65 4a __ ADC T1 + 3 
66ad : 4a __ __ LSR
66ae : 66 44 __ ROR T0 + 1 
66b0 : 66 43 __ ROR T0 + 0 
66b2 : 4a __ __ LSR
66b3 : 66 44 __ ROR T0 + 1 
66b5 : 66 43 __ ROR T0 + 0 
66b7 : 4a __ __ LSR
66b8 : 66 44 __ ROR T0 + 1 
66ba : 66 43 __ ROR T0 + 0 
66bc : 4a __ __ LSR
66bd : 66 44 __ ROR T0 + 1 
66bf : 66 43 __ ROR T0 + 0 
66c1 : a5 44 __ LDA T0 + 1 
66c3 : 85 1c __ STA ACCU + 1 
66c5 : 29 80 __ AND #$80
66c7 : 10 02 __ BPL $66cb ; (project.l5 + 351)
66c9 : a9 ff __ LDA #$ff
66cb : 85 45 __ STA T0 + 2 
66cd : 85 1e __ STA ACCU + 3 
66cf : 85 1d __ STA ACCU + 2 
66d1 : a5 43 __ LDA T0 + 0 
66d3 : 85 1b __ STA ACCU + 0 
66d5 : a5 56 __ LDA T5 + 0 
66d7 : 85 03 __ STA WORK + 0 
66d9 : a5 57 __ LDA T5 + 1 
66db : 85 04 __ STA WORK + 1 
66dd : a5 58 __ LDA T5 + 2 
66df : 85 05 __ STA WORK + 2 
66e1 : 85 06 __ STA WORK + 3 
66e3 : 20 12 79 JSR $7912 ; (mul32 + 0)
66e6 : a5 07 __ LDA WORK + 4 
66e8 : 85 0e __ STA P1 ; (ay + 0)
66ea : a5 08 __ LDA WORK + 5 
66ec : 85 48 __ STA T1 + 1 
66ee : a5 09 __ LDA WORK + 6 
66f0 : 85 49 __ STA T1 + 2 
66f2 : a5 0a __ LDA WORK + 7 
66f4 : 85 4a __ STA T1 + 3 
66f6 : a6 61 __ LDX T12 + 0 
66f8 : bd 0f 81 LDA $810f,x ; (cube_v[0][0] + 1)
66fb : 29 80 __ AND #$80
66fd : 10 02 __ BPL $6701 ; (project.l5 + 405)
66ff : a9 ff __ LDA #$ff
6701 : 85 04 __ STA WORK + 1 
6703 : 85 50 __ STA T3 + 1 
6705 : bd 0f 81 LDA $810f,x ; (cube_v[0][0] + 1)
6708 : 0a __ __ ASL
6709 : 0a __ __ ASL
670a : 18 __ __ CLC
670b : 7d 0f 81 ADC $810f,x ; (cube_v[0][0] + 1)
670e : 0a __ __ ASL
670f : 0a __ __ ASL
6710 : 0a __ __ ASL
6711 : 0a __ __ ASL
6712 : 85 4f __ STA T3 + 0 
6714 : 85 03 __ STA WORK + 0 
6716 : a5 04 __ LDA WORK + 1 
6718 : 29 80 __ AND #$80
671a : 10 02 __ BPL $671e ; (project.l5 + 434)
671c : a9 ff __ LDA #$ff
671e : 85 51 __ STA T3 + 2 
6720 : 85 06 __ STA WORK + 3 
6722 : 85 05 __ STA WORK + 2 
6724 : a0 00 __ LDY #$00
6726 : b1 5f __ LDA (T10 + 0),y 
6728 : 85 53 __ STA T4 + 0 
672a : 85 1b __ STA ACCU + 0 
672c : c8 __ __ INY
672d : b1 5f __ LDA (T10 + 0),y 
672f : 85 54 __ STA T4 + 1 
6731 : 85 1c __ STA ACCU + 1 
6733 : 29 80 __ AND #$80
6735 : 10 02 __ BPL $6739 ; (project.l5 + 461)
6737 : a9 ff __ LDA #$ff
6739 : 85 55 __ STA T4 + 2 
673b : 85 1d __ STA ACCU + 2 
673d : 85 1e __ STA ACCU + 3 
673f : 20 12 79 JSR $7912 ; (mul32 + 0)
6742 : 38 __ __ SEC
6743 : a5 07 __ LDA WORK + 4 
6745 : e5 0e __ SBC P1 ; (ay + 0)
6747 : a5 08 __ LDA WORK + 5 
6749 : e5 48 __ SBC T1 + 1 
674b : 85 0e __ STA P1 ; (ay + 0)
674d : a5 09 __ LDA WORK + 6 
674f : e5 49 __ SBC T1 + 2 
6751 : 85 48 __ STA T1 + 1 
6753 : a5 0a __ LDA WORK + 7 
6755 : e5 4a __ SBC T1 + 3 
6757 : 85 4a __ STA T1 + 3 
6759 : a5 53 __ LDA T4 + 0 
675b : 85 1b __ STA ACCU + 0 
675d : a5 54 __ LDA T4 + 1 
675f : 85 1c __ STA ACCU + 1 
6761 : a5 55 __ LDA T4 + 2 
6763 : 85 1d __ STA ACCU + 2 
6765 : 85 1e __ STA ACCU + 3 
6767 : a5 43 __ LDA T0 + 0 
6769 : 85 03 __ STA WORK + 0 
676b : a5 44 __ LDA T0 + 1 
676d : 85 04 __ STA WORK + 1 
676f : a5 45 __ LDA T0 + 2 
6771 : 85 05 __ STA WORK + 2 
6773 : 85 06 __ STA WORK + 3 
6775 : 20 12 79 JSR $7912 ; (mul32 + 0)
6778 : a5 07 __ LDA WORK + 4 
677a : 85 43 __ STA T0 + 0 
677c : a5 08 __ LDA WORK + 5 
677e : 85 44 __ STA T0 + 1 
6780 : a5 09 __ LDA WORK + 6 
6782 : 85 45 __ STA T0 + 2 
6784 : a5 0a __ LDA WORK + 7 
6786 : 85 46 __ STA T0 + 3 
6788 : a5 56 __ LDA T5 + 0 
678a : 85 1b __ STA ACCU + 0 
678c : a5 57 __ LDA T5 + 1 
678e : 85 1c __ STA ACCU + 1 
6790 : a5 58 __ LDA T5 + 2 
6792 : 85 1d __ STA ACCU + 2 
6794 : 85 1e __ STA ACCU + 3 
6796 : a5 4f __ LDA T3 + 0 
6798 : 85 03 __ STA WORK + 0 
679a : a5 50 __ LDA T3 + 1 
679c : 85 04 __ STA WORK + 1 
679e : a5 51 __ LDA T3 + 2 
67a0 : 85 05 __ STA WORK + 2 
67a2 : 85 06 __ STA WORK + 3 
67a4 : 20 12 79 JSR $7912 ; (mul32 + 0)
67a7 : 18 __ __ CLC
67a8 : a5 07 __ LDA WORK + 4 
67aa : 65 43 __ ADC T0 + 0 
67ac : a5 08 __ LDA WORK + 5 
67ae : 65 44 __ ADC T0 + 1 
67b0 : 85 43 __ STA T0 + 0 
67b2 : a5 09 __ LDA WORK + 6 
67b4 : 65 45 __ ADC T0 + 2 
67b6 : 85 44 __ STA T0 + 1 
67b8 : a5 0a __ LDA WORK + 7 
67ba : 65 46 __ ADC T0 + 3 
67bc : 4a __ __ LSR
67bd : 66 44 __ ROR T0 + 1 
67bf : 66 43 __ ROR T0 + 0 
67c1 : 4a __ __ LSR
67c2 : 66 44 __ ROR T0 + 1 
67c4 : 66 43 __ ROR T0 + 0 
67c6 : 4a __ __ LSR
67c7 : 66 44 __ ROR T0 + 1 
67c9 : 66 43 __ ROR T0 + 0 
67cb : 4a __ __ LSR
67cc : 66 44 __ ROR T0 + 1 
67ce : 66 43 __ ROR T0 + 0 
67d0 : 18 __ __ CLC
67d1 : a5 43 __ LDA T0 + 0 
67d3 : 69 18 __ ADC #$18
67d5 : 85 4f __ STA T3 + 0 
67d7 : a5 44 __ LDA T0 + 1 
67d9 : 69 01 __ ADC #$01
67db : 85 50 __ STA T3 + 1 
67dd : a5 44 __ LDA T0 + 1 
67df : 49 80 __ EOR #$80
67e1 : c9 7e __ CMP #$7e
67e3 : d0 04 __ BNE $67e9 ; (project.s9 + 0)
.s8:
67e5 : a5 43 __ LDA T0 + 0 
67e7 : c9 e9 __ CMP #$e9
.s9:
67e9 : b0 08 __ BCS $67f3 ; (project.s6 + 0)
.s7:
67eb : a9 01 __ LDA #$01
67ed : 85 4f __ STA T3 + 0 
67ef : a9 00 __ LDA #$00
67f1 : 85 50 __ STA T3 + 1 
.s6:
67f3 : a5 4e __ LDA T2 + 3 
67f5 : 4a __ __ LSR
67f6 : 66 4c __ ROR T2 + 1 
67f8 : 66 4b __ ROR T2 + 0 
67fa : 4a __ __ LSR
67fb : 66 4c __ ROR T2 + 1 
67fd : 66 4b __ ROR T2 + 0 
67ff : 4a __ __ LSR
6800 : 66 4c __ ROR T2 + 1 
6802 : 66 4b __ ROR T2 + 0 
6804 : 4a __ __ LSR
6805 : 66 4c __ ROR T2 + 1 
6807 : 66 4b __ ROR T2 + 0 
6809 : a5 4b __ LDA T2 + 0 
680b : 0a __ __ ASL
680c : a8 __ __ TAY
680d : a5 4c __ LDA T2 + 1 
680f : 2a __ __ ROL
6810 : aa __ __ TAX
6811 : 98 __ __ TYA
6812 : 18 __ __ CLC
6813 : 65 4b __ ADC T2 + 0 
6815 : a8 __ __ TAY
6816 : 8a __ __ TXA
6817 : 65 4c __ ADC T2 + 1 
6819 : 85 1b __ STA ACCU + 0 
681b : 98 __ __ TYA
681c : 0a __ __ ASL
681d : 26 1b __ ROL ACCU + 0 
681f : 0a __ __ ASL
6820 : 26 1b __ ROL ACCU + 0 
6822 : 0a __ __ ASL
6823 : 26 1b __ ROL ACCU + 0 
6825 : 18 __ __ CLC
6826 : 65 4b __ ADC T2 + 0 
6828 : 85 4b __ STA T2 + 0 
682a : a5 1b __ LDA ACCU + 0 
682c : 65 4c __ ADC T2 + 1 
682e : 06 4b __ ASL T2 + 0 
6830 : 2a __ __ ROL
6831 : 06 4b __ ASL T2 + 0 
6833 : 2a __ __ ROL
6834 : 06 4b __ ASL T2 + 0 
6836 : 2a __ __ ROL
6837 : 85 1c __ STA ACCU + 1 
6839 : a5 4b __ LDA T2 + 0 
683b : 85 1b __ STA ACCU + 0 
683d : 20 54 7c JSR $7c54 ; (divs16@proxy + 0)
6840 : 18 __ __ CLC
6841 : a5 1b __ LDA ACCU + 0 
6843 : 69 a0 __ ADC #$a0
6845 : a8 __ __ TAY
6846 : a5 1c __ LDA ACCU + 1 
6848 : 69 00 __ ADC #$00
684a : 85 44 __ STA T0 + 1 
684c : a5 52 __ LDA T11 + 0 
684e : 0a __ __ ASL
684f : 85 4b __ STA T2 + 0 
6851 : aa __ __ TAX
6852 : 98 __ __ TYA
6853 : 9d ee 86 STA $86ee,x ; (px_cur[0] + 0)
6856 : a5 44 __ LDA T0 + 1 
6858 : 9d ef 86 STA $86ef,x ; (px_cur[0] + 1)
685b : a5 4a __ LDA T1 + 3 
685d : 4a __ __ LSR
685e : 66 48 __ ROR T1 + 1 
6860 : 66 0e __ ROR P1 ; (ay + 0)
6862 : 4a __ __ LSR
6863 : 66 48 __ ROR T1 + 1 
6865 : 66 0e __ ROR P1 ; (ay + 0)
6867 : 4a __ __ LSR
6868 : 66 48 __ ROR T1 + 1 
686a : 66 0e __ ROR P1 ; (ay + 0)
686c : 4a __ __ LSR
686d : 66 48 __ ROR T1 + 1 
686f : 66 0e __ ROR P1 ; (ay + 0)
6871 : a5 0e __ LDA P1 ; (ay + 0)
6873 : 0a __ __ ASL
6874 : a8 __ __ TAY
6875 : a5 48 __ LDA T1 + 1 
6877 : 2a __ __ ROL
6878 : aa __ __ TAX
6879 : 98 __ __ TYA
687a : 18 __ __ CLC
687b : 65 0e __ ADC P1 ; (ay + 0)
687d : a8 __ __ TAY
687e : 8a __ __ TXA
687f : 65 48 __ ADC T1 + 1 
6881 : 85 1b __ STA ACCU + 0 
6883 : 98 __ __ TYA
6884 : 0a __ __ ASL
6885 : 26 1b __ ROL ACCU + 0 
6887 : 0a __ __ ASL
6888 : 26 1b __ ROL ACCU + 0 
688a : 0a __ __ ASL
688b : 26 1b __ ROL ACCU + 0 
688d : 18 __ __ CLC
688e : 65 0e __ ADC P1 ; (ay + 0)
6890 : 85 0e __ STA P1 ; (ay + 0)
6892 : a5 1b __ LDA ACCU + 0 
6894 : 65 48 __ ADC T1 + 1 
6896 : 06 0e __ ASL P1 ; (ay + 0)
6898 : 2a __ __ ROL
6899 : 06 0e __ ASL P1 ; (ay + 0)
689b : 2a __ __ ROL
689c : 06 0e __ ASL P1 ; (ay + 0)
689e : 2a __ __ ROL
689f : 85 1c __ STA ACCU + 1 
68a1 : a5 0e __ LDA P1 ; (ay + 0)
68a3 : 85 1b __ STA ACCU + 0 
68a5 : 20 54 7c JSR $7c54 ; (divs16@proxy + 0)
68a8 : 18 __ __ CLC
68a9 : a5 1b __ LDA ACCU + 0 
68ab : 69 64 __ ADC #$64
68ad : a6 4b __ LDX T2 + 0 
68af : 9d de 86 STA $86de,x ; (py_cur[0] + 0)
68b2 : a5 1c __ LDA ACCU + 1 
68b4 : 69 00 __ ADC #$00
68b6 : 9d df 86 STA $86df,x ; (py_cur[0] + 1)
68b9 : e6 52 __ INC T11 + 0 
68bb : 18 __ __ CLC
68bc : a5 61 __ LDA T12 + 0 
68be : 69 03 __ ADC #$03
68c0 : c9 18 __ CMP #$18
68c2 : f0 03 __ BEQ $68c7 ; (project.s3 + 0)
68c4 : 4c 6c 65 JMP $656c ; (project.l5 + 0)
.s3:
68c7 : a2 0e __ LDX #$0e
68c9 : bd d2 bf LDA $bfd2,x ; (project@stack + 0)
68cc : 95 53 __ STA T4 + 0,x 
68ce : ca __ __ DEX
68cf : 10 f8 __ BPL $68c9 ; (project.s3 + 2)
68d1 : 60 __ __ RTS
--------------------------------------------------------------------
plasma_run: ; plasma_run()->void
;   3, "/home/xahmol/git/UltimateDemo2026/src/plasma.h"
.s1:
68d2 : a2 04 __ LDX #$04
68d4 : b5 53 __ LDA T1 + 0,x 
68d6 : 9d e2 bf STA $bfe2,x ; (plasma_run@stack + 0)
68d9 : ca __ __ DEX
68da : 10 f8 __ BPL $68d4 ; (plasma_run.s1 + 2)
.s4:
68dc : 20 b1 69 JSR $69b1 ; (plasma_init.s4 + 0)
68df : a9 00 __ LDA #$00
68e1 : 85 53 __ STA T1 + 0 
68e3 : 85 54 __ STA T2 + 0 
68e5 : 85 55 __ STA T3 + 0 
68e7 : a9 a2 __ LDA #$a2
68e9 : 85 56 __ STA T4 + 0 
68eb : a9 fe __ LDA #$fe
68ed : 85 57 __ STA T4 + 1 
.l5:
68ef : a5 53 __ LDA T1 + 0 
68f1 : 85 0d __ STA P0 
68f3 : 20 05 6a JSR $6a05 ; (plasma_frame@proxy + 0)
.l6:
68f6 : 2c 11 d0 BIT $d011 
68f9 : 30 fb __ BMI $68f6 ; (plasma_run.l6 + 0)
.l7:
68fb : 2c 11 d0 BIT $d011 
68fe : 10 fb __ BPL $68fb ; (plasma_run.l7 + 0)
.s8:
6900 : e6 55 __ INC T3 + 0 
6902 : e6 54 __ INC T2 + 0 
6904 : e6 54 __ INC T2 + 0 
6906 : e6 53 __ INC T1 + 0 
6908 : e6 56 __ INC T4 + 0 
690a : d0 e3 __ BNE $68ef ; (plasma_run.l5 + 0)
.s19:
690c : e6 57 __ INC T4 + 1 
690e : d0 df __ BNE $68ef ; (plasma_run.l5 + 0)
.s9:
6910 : a9 00 __ LDA #$00
6912 : 85 43 __ STA T0 + 0 
6914 : 85 1f __ STA ADDR + 0 
6916 : a9 c0 __ LDA #$c0
6918 : 85 44 __ STA T0 + 1 
691a : d0 02 __ BNE $691e ; (plasma_run.l18 + 0)
.s21:
691c : e6 44 __ INC T0 + 1 
.l18:
691e : a9 82 __ LDA #$82
6920 : a0 00 __ LDY #$00
6922 : 91 43 __ STA (T0 + 0),y 
6924 : 18 __ __ CLC
6925 : a5 44 __ LDA T0 + 1 
6927 : 69 18 __ ADC #$18
6929 : 85 20 __ STA ADDR + 1 
692b : a9 07 __ LDA #$07
692d : a4 43 __ LDY T0 + 0 
692f : 91 1f __ STA (ADDR + 0),y 
6931 : 98 __ __ TYA
6932 : 18 __ __ CLC
6933 : 69 01 __ ADC #$01
6935 : 85 43 __ STA T0 + 0 
6937 : b0 e3 __ BCS $691c ; (plasma_run.s21 + 0)
.s22:
6939 : c9 e8 __ CMP #$e8
693b : d0 e1 __ BNE $691e ; (plasma_run.l18 + 0)
.s17:
693d : a5 44 __ LDA T0 + 1 
693f : c9 c3 __ CMP #$c3
6941 : d0 db __ BNE $691e ; (plasma_run.l18 + 0)
.s10:
6943 : a9 00 __ LDA #$00
6945 : 8d 21 d0 STA $d021 
6948 : a9 a2 __ LDA #$a2
694a : 85 56 __ STA T4 + 0 
694c : a9 fe __ LDA #$fe
694e : 85 57 __ STA T4 + 1 
6950 : a5 53 __ LDA T1 + 0 
.l11:
6952 : 85 0d __ STA P0 
6954 : 20 05 6a JSR $6a05 ; (plasma_frame@proxy + 0)
.l12:
6957 : 2c 11 d0 BIT $d011 
695a : 30 fb __ BMI $6957 ; (plasma_run.l12 + 0)
.l13:
695c : 2c 11 d0 BIT $d011 
695f : 10 fb __ BPL $695c ; (plasma_run.l13 + 0)
.s14:
6961 : 18 __ __ CLC
6962 : a5 0f __ LDA P2 
6964 : 69 02 __ ADC #$02
6966 : 85 55 __ STA T3 + 0 
6968 : 18 __ __ CLC
6969 : a5 54 __ LDA T2 + 0 
696b : 69 03 __ ADC #$03
696d : 85 54 __ STA T2 + 0 
696f : 18 __ __ CLC
6970 : a5 0d __ LDA P0 
6972 : 69 02 __ ADC #$02
6974 : e6 56 __ INC T4 + 0 
6976 : d0 da __ BNE $6952 ; (plasma_run.l11 + 0)
.s20:
6978 : e6 57 __ INC T4 + 1 
697a : d0 d6 __ BNE $6952 ; (plasma_run.l11 + 0)
.s15:
697c : a9 00 __ LDA #$00
697e : 85 0d __ STA P0 
6980 : 85 0e __ STA P1 
6982 : 85 10 __ STA P3 
6984 : a9 36 __ LDA #$36
6986 : 85 01 __ STA $01 
6988 : 20 88 0f JSR $0f88 ; (vic_setmode@proxy + 0)
698b : a9 00 __ LDA #$00
698d : 8d 20 d0 STA $d020 
6990 : 8d 21 d0 STA $d021 
6993 : a9 20 __ LDA #$20
6995 : a2 fa __ LDX #$fa
.l16:
6997 : ca __ __ DEX
6998 : 9d 00 04 STA $0400,x 
699b : 9d fa 04 STA $04fa,x 
699e : 9d f4 05 STA $05f4,x 
69a1 : 9d ee 06 STA $06ee,x 
69a4 : d0 f1 __ BNE $6997 ; (plasma_run.l16 + 0)
.s3:
69a6 : a2 04 __ LDX #$04
69a8 : bd e2 bf LDA $bfe2,x ; (plasma_run@stack + 0)
69ab : 95 53 __ STA T1 + 0,x 
69ad : ca __ __ DEX
69ae : 10 f8 __ BPL $69a8 ; (plasma_run.s3 + 2)
69b0 : 60 __ __ RTS
--------------------------------------------------------------------
plasma_init: ; plasma_init()->void
;  38, "/home/xahmol/git/UltimateDemo2026/src/plasma.c"
.s4:
69b1 : a9 00 __ LDA #$00
69b3 : 85 0f __ STA P2 
69b5 : 85 10 __ STA P3 
69b7 : 85 43 __ STA T0 + 0 
69b9 : 85 0d __ STA P0 
69bb : a9 35 __ LDA #$35
69bd : 85 01 __ STA $01 
69bf : 20 45 7c JSR $7c45 ; (memset@proxy + 0)
69c2 : a9 c0 __ LDA #$c0
69c4 : 85 44 __ STA T0 + 1 
69c6 : a9 00 __ LDA #$00
69c8 : 85 1f __ STA ADDR + 0 
69ca : f0 02 __ BEQ $69ce ; (plasma_init.l7 + 0)
.s8:
69cc : e6 44 __ INC T0 + 1 
.l7:
69ce : a9 34 __ LDA #$34
69d0 : a0 00 __ LDY #$00
69d2 : 91 43 __ STA (T0 + 0),y 
69d4 : 18 __ __ CLC
69d5 : a5 44 __ LDA T0 + 1 
69d7 : 69 18 __ ADC #$18
69d9 : 85 20 __ STA ADDR + 1 
69db : a9 07 __ LDA #$07
69dd : a4 43 __ LDY T0 + 0 
69df : 91 1f __ STA (ADDR + 0),y 
69e1 : 98 __ __ TYA
69e2 : 18 __ __ CLC
69e3 : 69 01 __ ADC #$01
69e5 : 85 43 __ STA T0 + 0 
69e7 : b0 e3 __ BCS $69cc ; (plasma_init.s8 + 0)
.s9:
69e9 : c9 e8 __ CMP #$e8
69eb : d0 e1 __ BNE $69ce ; (plasma_init.l7 + 0)
.s6:
69ed : a5 44 __ LDA T0 + 1 
69ef : c9 c3 __ CMP #$c3
69f1 : d0 db __ BNE $69ce ; (plasma_init.l7 + 0)
.s5:
69f3 : a9 00 __ LDA #$00
69f5 : 85 0e __ STA P1 
69f7 : 85 10 __ STA P3 
69f9 : 20 a5 7c JSR $7ca5 ; (vic_setmode@proxy + 0)
69fc : a9 00 __ LDA #$00
69fe : 8d 21 d0 STA $d021 
6a01 : 8d 20 d0 STA $d020 
.s3:
6a04 : 60 __ __ RTS
--------------------------------------------------------------------
plasma_frame@proxy: ; plasma_frame@proxy
6a05 : a5 54 __ LDA $54 
6a07 : 85 0e __ STA P1 
6a09 : a5 55 __ LDA $55 
6a0b : 85 0f __ STA P2 
--------------------------------------------------------------------
plasma_frame: ; plasma_frame(u8,u8,u8)->void
;  69, "/home/xahmol/git/UltimateDemo2026/src/plasma.c"
.s4:
6a0d : a2 00 __ LDX #$00
.l8:
6a0f : a5 0e __ LDA P1 ; (t2 + 0)
6a11 : 29 3f __ AND #$3f
6a13 : a8 __ __ TAY
6a14 : b9 3e 83 LDA $833e,y ; (sin_lut[0] + 0)
6a17 : 9d 20 a2 STA $a220,x ; (row_sin[0] + 0)
6a1a : e6 0e __ INC P1 ; (t2 + 0)
6a1c : e8 __ __ INX
6a1d : e0 c8 __ CPX #$c8
6a1f : d0 ee __ BNE $6a0f ; (plasma_frame.l8 + 0)
.s9:
6a21 : a5 0d __ LDA P0 ; (t1 + 0)
6a23 : 85 0e __ STA P1 ; (t2 + 0)
6a25 : a9 00 __ LDA #$00
6a27 : 85 1b __ STA ACCU + 0 
.l5:
6a29 : 85 4b __ STA T10 + 0 
6a2b : 29 07 __ AND #$07
6a2d : 85 43 __ STA T3 + 0 
6a2f : a5 1b __ LDA ACCU + 0 
6a31 : 29 f8 __ AND #$f8
6a33 : 85 45 __ STA T4 + 0 
6a35 : 4a __ __ LSR
6a36 : 4a __ __ LSR
6a37 : 65 45 __ ADC T4 + 0 
6a39 : 4a __ __ LSR
6a3a : 6a __ __ ROR
6a3b : 6a __ __ ROR
6a3c : aa __ __ TAX
6a3d : 29 c0 __ AND #$c0
6a3f : 6a __ __ ROR
6a40 : 05 43 __ ORA T3 + 0 
6a42 : 85 45 __ STA T4 + 0 
6a44 : 8a __ __ TXA
6a45 : 29 1f __ AND #$1f
6a47 : 09 e0 __ ORA #$e0
6a49 : 85 46 __ STA T4 + 1 
6a4b : a5 1b __ LDA ACCU + 0 
6a4d : 69 03 __ ADC #$03
6a4f : 85 43 __ STA T3 + 0 
6a51 : a5 0e __ LDA P1 ; (t2 + 0)
6a53 : 85 4d __ STA T11 + 0 
6a55 : 18 __ __ CLC
6a56 : 69 03 __ ADC #$03
6a58 : 85 1c __ STA ACCU + 1 
6a5a : a5 1b __ LDA ACCU + 0 
6a5c : aa __ __ TAX
6a5d : e8 __ __ INX
6a5e : 86 49 __ STX T8 + 0 
6a60 : 18 __ __ CLC
6a61 : 69 02 __ ADC #$02
6a63 : 85 47 __ STA T6 + 0 
6a65 : a9 00 __ LDA #$00
6a67 : 85 44 __ STA T3 + 1 
6a69 : 85 48 __ STA T6 + 1 
6a6b : 18 __ __ CLC
6a6c : a5 0e __ LDA P1 ; (t2 + 0)
6a6e : 69 02 __ ADC #$02
6a70 : 85 1d __ STA ACCU + 2 
6a72 : 18 __ __ CLC
6a73 : 69 ff __ ADC #$ff
6a75 : 85 1e __ STA ACCU + 3 
6a77 : a9 00 __ LDA #$00
6a79 : 85 4a __ STA T8 + 1 
6a7b : 85 4c __ STA T10 + 1 
6a7d : bd 1f a2 LDA $a21f,x ; (tbuffer[0] + 319)
6a80 : 85 4e __ STA T12 + 0 
6a82 : a9 28 __ LDA #$28
6a84 : 85 51 __ STA T16 + 0 
6a86 : a0 00 __ LDY #$00
6a88 : 18 __ __ CLC
.l7:
6a89 : a5 4d __ LDA T11 + 0 
6a8b : 29 3f __ AND #$3f
6a8d : aa __ __ TAX
6a8e : bd 3e 83 LDA $833e,x ; (sin_lut[0] + 0)
6a91 : 65 4e __ ADC T12 + 0 
6a93 : 85 4f __ STA T13 + 0 
6a95 : a5 4c __ LDA T10 + 1 
6a97 : 4a __ __ LSR
6a98 : a5 4b __ LDA T10 + 0 
6a9a : 6a __ __ ROR
6a9b : 18 __ __ CLC
6a9c : 65 0f __ ADC P2 ; (t3 + 0)
6a9e : 29 3f __ AND #$3f
6aa0 : aa __ __ TAX
6aa1 : bd 3e 83 LDA $833e,x ; (sin_lut[0] + 0)
6aa4 : 18 __ __ CLC
6aa5 : 65 4f __ ADC T13 + 0 
6aa7 : aa __ __ TAX
6aa8 : bd 7e 83 LDA $837e,x ; (sum_to_col[0] + 0)
6aab : 4a __ __ LSR
6aac : 6a __ __ ROR
6aad : 6a __ __ ROR
6aae : 85 4f __ STA T13 + 0 
6ab0 : a5 1e __ LDA ACCU + 3 
6ab2 : 29 3f __ AND #$3f
6ab4 : aa __ __ TAX
6ab5 : bd 3e 83 LDA $833e,x ; (sin_lut[0] + 0)
6ab8 : 65 4e __ ADC T12 + 0 
6aba : 85 50 __ STA T14 + 0 
6abc : a5 4a __ LDA T8 + 1 
6abe : 4a __ __ LSR
6abf : a5 49 __ LDA T8 + 0 
6ac1 : 6a __ __ ROR
6ac2 : 18 __ __ CLC
6ac3 : 65 0f __ ADC P2 ; (t3 + 0)
6ac5 : 29 3f __ AND #$3f
6ac7 : aa __ __ TAX
6ac8 : bd 3e 83 LDA $833e,x ; (sin_lut[0] + 0)
6acb : 18 __ __ CLC
6acc : 65 50 __ ADC T14 + 0 
6ace : aa __ __ TAX
6acf : bd 7e 83 LDA $837e,x ; (sum_to_col[0] + 0)
6ad2 : 0a __ __ ASL
6ad3 : 0a __ __ ASL
6ad4 : 0a __ __ ASL
6ad5 : 0a __ __ ASL
6ad6 : 05 4f __ ORA T13 + 0 
6ad8 : 85 4f __ STA T13 + 0 
6ada : a5 1d __ LDA ACCU + 2 
6adc : 29 3f __ AND #$3f
6ade : aa __ __ TAX
6adf : bd 3e 83 LDA $833e,x ; (sin_lut[0] + 0)
6ae2 : 65 4e __ ADC T12 + 0 
6ae4 : 85 50 __ STA T14 + 0 
6ae6 : a5 48 __ LDA T6 + 1 
6ae8 : 4a __ __ LSR
6ae9 : a5 47 __ LDA T6 + 0 
6aeb : 6a __ __ ROR
6aec : 18 __ __ CLC
6aed : 65 0f __ ADC P2 ; (t3 + 0)
6aef : 29 3f __ AND #$3f
6af1 : aa __ __ TAX
6af2 : bd 3e 83 LDA $833e,x ; (sin_lut[0] + 0)
6af5 : 18 __ __ CLC
6af6 : 65 50 __ ADC T14 + 0 
6af8 : aa __ __ TAX
6af9 : bd 7e 83 LDA $837e,x ; (sum_to_col[0] + 0)
6afc : 0a __ __ ASL
6afd : 0a __ __ ASL
6afe : 05 4f __ ORA T13 + 0 
6b00 : 85 4f __ STA T13 + 0 
6b02 : a5 1c __ LDA ACCU + 1 
6b04 : 29 3f __ AND #$3f
6b06 : aa __ __ TAX
6b07 : bd 3e 83 LDA $833e,x ; (sin_lut[0] + 0)
6b0a : 65 4e __ ADC T12 + 0 
6b0c : 85 50 __ STA T14 + 0 
6b0e : a5 44 __ LDA T3 + 1 
6b10 : 4a __ __ LSR
6b11 : a5 43 __ LDA T3 + 0 
6b13 : 6a __ __ ROR
6b14 : 18 __ __ CLC
6b15 : 65 0f __ ADC P2 ; (t3 + 0)
6b17 : 29 3f __ AND #$3f
6b19 : aa __ __ TAX
6b1a : bd 3e 83 LDA $833e,x ; (sin_lut[0] + 0)
6b1d : 18 __ __ CLC
6b1e : 65 50 __ ADC T14 + 0 
6b20 : aa __ __ TAX
6b21 : bd 7e 83 LDA $837e,x ; (sum_to_col[0] + 0)
6b24 : 05 4f __ ORA T13 + 0 
6b26 : 91 45 __ STA (T4 + 0),y 
6b28 : 18 __ __ CLC
6b29 : a5 43 __ LDA T3 + 0 
6b2b : 69 04 __ ADC #$04
6b2d : 85 43 __ STA T3 + 0 
6b2f : 90 03 __ BCC $6b34 ; (plasma_frame.s11 + 0)
.s10:
6b31 : e6 44 __ INC T3 + 1 
6b33 : 18 __ __ CLC
.s11:
6b34 : a5 1c __ LDA ACCU + 1 
6b36 : 69 04 __ ADC #$04
6b38 : 85 1c __ STA ACCU + 1 
6b3a : 18 __ __ CLC
6b3b : a5 47 __ LDA T6 + 0 
6b3d : 69 04 __ ADC #$04
6b3f : 85 47 __ STA T6 + 0 
6b41 : 90 03 __ BCC $6b46 ; (plasma_frame.s13 + 0)
.s12:
6b43 : e6 48 __ INC T6 + 1 
6b45 : 18 __ __ CLC
.s13:
6b46 : a5 1d __ LDA ACCU + 2 
6b48 : 69 04 __ ADC #$04
6b4a : 85 1d __ STA ACCU + 2 
6b4c : 18 __ __ CLC
6b4d : a5 49 __ LDA T8 + 0 
6b4f : 69 04 __ ADC #$04
6b51 : 85 49 __ STA T8 + 0 
6b53 : 90 03 __ BCC $6b58 ; (plasma_frame.s15 + 0)
.s14:
6b55 : e6 4a __ INC T8 + 1 
6b57 : 18 __ __ CLC
.s15:
6b58 : a5 1e __ LDA ACCU + 3 
6b5a : 69 04 __ ADC #$04
6b5c : 85 1e __ STA ACCU + 3 
6b5e : 18 __ __ CLC
6b5f : a5 4b __ LDA T10 + 0 
6b61 : 69 04 __ ADC #$04
6b63 : 85 4b __ STA T10 + 0 
6b65 : 90 03 __ BCC $6b6a ; (plasma_frame.s17 + 0)
.s16:
6b67 : e6 4c __ INC T10 + 1 
6b69 : 18 __ __ CLC
.s17:
6b6a : a5 4d __ LDA T11 + 0 
6b6c : 69 04 __ ADC #$04
6b6e : 85 4d __ STA T11 + 0 
6b70 : 98 __ __ TYA
6b71 : 18 __ __ CLC
6b72 : 69 08 __ ADC #$08
6b74 : a8 __ __ TAY
6b75 : 90 03 __ BCC $6b7a ; (plasma_frame.s19 + 0)
.s18:
6b77 : e6 46 __ INC T4 + 1 
6b79 : 18 __ __ CLC
.s19:
6b7a : c6 51 __ DEC T16 + 0 
6b7c : f0 03 __ BEQ $6b81 ; (plasma_frame.s6 + 0)
6b7e : 4c 89 6a JMP $6a89 ; (plasma_frame.l7 + 0)
.s6:
6b81 : e6 1b __ INC ACCU + 0 
6b83 : a5 1b __ LDA ACCU + 0 
6b85 : c9 c8 __ CMP #$c8
6b87 : f0 03 __ BEQ $6b8c ; (plasma_frame.s3 + 0)
6b89 : 4c 29 6a JMP $6a29 ; (plasma_frame.l5 + 0)
.s3:
6b8c : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_run: ; tunnel_run()->void
;   6, "/home/xahmol/git/UltimateDemo2026/src/tunnel.h"
.s1:
6b8d : a2 06 __ LDX #$06
6b8f : b5 53 __ LDA T1 + 0,x 
6b91 : 9d df bf STA $bfdf,x ; (tunnel_run@stack + 0)
6b94 : ca __ __ DEX
6b95 : 10 f8 __ BPL $6b8f ; (tunnel_run.s1 + 2)
.s4:
6b97 : a9 8f __ LDA #$8f
6b99 : 20 73 16 JSR $1673 ; (turbo_set.s4 + 0)
6b9c : 20 61 6c JSR $6c61 ; (tunnel_build_tables.s4 + 0)
6b9f : 20 a6 6e JSR $6ea6 ; (tunnel_build_tex.s4 + 0)
6ba2 : 20 26 6f JSR $6f26 ; (tun_init.s4 + 0)
6ba5 : a9 00 __ LDA #$00
6ba7 : 85 55 __ STA T4 + 0 
6ba9 : 85 56 __ STA T5 + 0 
6bab : 85 43 __ STA T0 + 0 
6bad : 85 53 __ STA T1 + 0 
6baf : 85 59 __ STA T7 + 0 
6bb1 : 85 57 __ STA T6 + 0 
6bb3 : 85 58 __ STA T6 + 1 
.l5:
6bb5 : a5 57 __ LDA T6 + 0 
6bb7 : 85 1b __ STA ACCU + 0 
6bb9 : a5 58 __ LDA T6 + 1 
6bbb : 85 1c __ STA ACCU + 1 
6bbd : a9 c8 __ LDA #$c8
6bbf : 85 03 __ STA WORK + 0 
6bc1 : 20 89 78 JSR $7889 ; (divmod@proxy + 0)
6bc4 : a4 1b __ LDY ACCU + 0 
6bc6 : c4 59 __ CPY T7 + 0 
6bc8 : f0 2a __ BEQ $6bf4 ; (tunnel_run.s6 + 0)
.s12:
6bca : b9 fc 7d LDA $7dfc,y ; (pal_sc[0] + 0)
6bcd : a2 fa __ LDX #$fa
.l14:
6bcf : ca __ __ DEX
6bd0 : 9d 00 c0 STA $c000,x 
6bd3 : 9d fa c0 STA $c0fa,x 
6bd6 : 9d f4 c1 STA $c1f4,x 
6bd9 : 9d ee c2 STA $c2ee,x 
6bdc : d0 f1 __ BNE $6bcf ; (tunnel_run.l14 + 0)
.s13:
6bde : b9 fb 80 LDA $80fb,y ; (pal_cr[0] + 0)
6be1 : a2 fa __ LDX #$fa
.l16:
6be3 : ca __ __ DEX
6be4 : 9d 00 d8 STA $d800,x 
6be7 : 9d fa d8 STA $d8fa,x 
6bea : 9d f4 d9 STA $d9f4,x 
6bed : 9d ee da STA $daee,x 
6bf0 : d0 f1 __ BNE $6be3 ; (tunnel_run.l16 + 0)
.s15:
6bf2 : 84 59 __ STY T7 + 0 
.s6:
6bf4 : a5 55 __ LDA T4 + 0 
6bf6 : 85 12 __ STA P5 
6bf8 : a5 56 __ LDA T5 + 0 
6bfa : 85 13 __ STA P6 
6bfc : a5 43 __ LDA T0 + 0 
6bfe : 85 54 __ STA T2 + 0 
6c00 : 29 3f __ AND #$3f
6c02 : aa __ __ TAX
6c03 : bd 88 83 LDA $8388,x ; (lat_wave[0] + 0)
6c06 : 85 14 __ STA P7 
6c08 : a5 53 __ LDA T1 + 0 
6c0a : 29 3f __ AND #$3f
6c0c : aa __ __ TAX
6c0d : bd 00 84 LDA $8400,x ; (vert_wave[0] + 0)
6c10 : 85 15 __ STA P8 
6c12 : 20 7a 6f JSR $6f7a ; (tunnel_render.s4 + 0)
.l7:
6c15 : 2c 11 d0 BIT $d011 
6c18 : 30 fb __ BMI $6c15 ; (tunnel_run.l7 + 0)
.l8:
6c1a : 2c 11 d0 BIT $d011 
6c1d : 10 fb __ BPL $6c1a ; (tunnel_run.l8 + 0)
.s9:
6c1f : e6 53 __ INC T1 + 0 
6c21 : a6 54 __ LDX T2 + 0 
6c23 : e8 __ __ INX
6c24 : 86 43 __ STX T0 + 0 
6c26 : e6 56 __ INC T5 + 0 
6c28 : e6 55 __ INC T4 + 0 
6c2a : e6 57 __ INC T6 + 0 
6c2c : d0 02 __ BNE $6c30 ; (tunnel_run.s18 + 0)
.s17:
6c2e : e6 58 __ INC T6 + 1 
.s18:
6c30 : a5 58 __ LDA T6 + 1 
6c32 : c9 03 __ CMP #$03
6c34 : f0 03 __ BEQ $6c39 ; (tunnel_run.s11 + 0)
6c36 : 4c b5 6b JMP $6bb5 ; (tunnel_run.l5 + 0)
.s11:
6c39 : a5 57 __ LDA T6 + 0 
6c3b : c9 20 __ CMP #$20
6c3d : d0 f7 __ BNE $6c36 ; (tunnel_run.s18 + 6)
.s10:
6c3f : a9 00 __ LDA #$00
6c41 : 85 0d __ STA P0 
6c43 : 85 0e __ STA P1 
6c45 : 85 10 __ STA P3 
6c47 : a9 36 __ LDA #$36
6c49 : 85 01 __ STA $01 
6c4b : 20 88 0f JSR $0f88 ; (vic_setmode@proxy + 0)
6c4e : a9 00 __ LDA #$00
6c50 : 8d 20 d0 STA $d020 
6c53 : 8d 21 d0 STA $d021 
.s3:
6c56 : a2 06 __ LDX #$06
6c58 : bd df bf LDA $bfdf,x ; (tunnel_run@stack + 0)
6c5b : 95 53 __ STA T1 + 0,x 
6c5d : ca __ __ DEX
6c5e : 10 f8 __ BPL $6c58 ; (tunnel_run.s3 + 2)
6c60 : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_build_tables: ; tunnel_build_tables()->void
; 160, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6c61 : a9 00 __ LDA #$00
6c63 : 85 4d __ STA T4 + 0 
6c65 : a9 97 __ LDA #$97
6c67 : 85 49 __ STA T1 + 0 
6c69 : a9 ff __ LDA #$ff
6c6b : 85 4a __ STA T1 + 1 
.l5:
6c6d : a9 00 __ LDA #$00
6c6f : 85 4e __ STA T5 + 0 
6c71 : a9 b1 __ LDA #$b1
6c73 : 85 4b __ STA T2 + 0 
6c75 : a9 ff __ LDA #$ff
.l6:
6c77 : 85 4c __ STA T2 + 1 
6c79 : 85 10 __ STA P3 
6c7b : a5 49 __ LDA T1 + 0 
6c7d : 85 0d __ STA P0 
6c7f : a5 4a __ LDA T1 + 1 
6c81 : 85 0e __ STA P1 
6c83 : a5 4b __ LDA T2 + 0 
6c85 : 85 0f __ STA P2 
6c87 : 20 ed 6c JSR $6ced ; (iatan2_5.s4 + 0)
6c8a : a6 4e __ LDX T5 + 0 
6c8c : 9d 00 a3 STA $a300,x ; (row_buf[0] + 0)
6c8f : a5 4b __ LDA T2 + 0 
6c91 : 85 0d __ STA P0 
6c93 : a5 4c __ LDA T2 + 1 
6c95 : 85 0e __ STA P1 
6c97 : a5 49 __ LDA T1 + 0 
6c99 : 85 0f __ STA P2 
6c9b : a5 4a __ LDA T1 + 1 
6c9d : 85 10 __ STA P3 
6c9f : 20 d1 6d JSR $6dd1 ; (idist_5.s4 + 0)
6ca2 : a6 4e __ LDX T5 + 0 
6ca4 : e8 __ __ INX
6ca5 : 86 4e __ STX T5 + 0 
6ca7 : 9d 4f a3 STA $a34f,x ; (row_buf[0] + 79)
6caa : 18 __ __ CLC
6cab : a5 0d __ LDA P0 
6cad : 69 02 __ ADC #$02
6caf : 85 4b __ STA T2 + 0 
6cb1 : a5 0e __ LDA P1 
6cb3 : 69 00 __ ADC #$00
6cb5 : e0 50 __ CPX #$50
6cb7 : 90 be __ BCC $6c77 ; (tunnel_build_tables.l6 + 0)
.s7:
6cb9 : a5 4d __ LDA T4 + 0 
6cbb : 85 1b __ STA ACCU + 0 
6cbd : a9 d0 __ LDA #$d0
6cbf : 85 0d __ STA P0 
6cc1 : a9 00 __ LDA #$00
6cc3 : 85 1c __ STA ACCU + 1 
6cc5 : 85 1d __ STA ACCU + 2 
6cc7 : 85 1e __ STA ACCU + 3 
6cc9 : a9 a0 __ LDA #$a0
6ccb : 20 d6 77 JSR $77d6 ; (mul32by8 + 0)
6cce : 18 __ __ CLC
6ccf : a5 09 __ LDA WORK + 6 
6cd1 : 69 20 __ ADC #$20
6cd3 : 85 10 __ STA P3 
6cd5 : a5 0a __ LDA WORK + 7 
6cd7 : 69 00 __ ADC #$00
6cd9 : 85 11 __ STA P4 
6cdb : 20 73 6e JSR $6e73 ; (reu_dma@proxy + 0)
6cde : e6 49 __ INC T1 + 0 
6ce0 : d0 02 __ BNE $6ce4 ; (tunnel_build_tables.s9 + 0)
.s8:
6ce2 : e6 4a __ INC T1 + 1 
.s9:
6ce4 : e6 4d __ INC T4 + 0 
6ce6 : a5 4d __ LDA T4 + 0 
6ce8 : c9 6e __ CMP #$6e
6cea : 90 81 __ BCC $6c6d ; (tunnel_build_tables.l5 + 0)
.s3:
6cec : 60 __ __ RTS
--------------------------------------------------------------------
iatan2_5: ; iatan2_5(i16,i16)->u8
; 115, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6ced : a5 10 __ LDA P3 ; (x + 1)
6cef : 05 0f __ ORA P2 ; (x + 0)
6cf1 : d0 0a __ BNE $6cfd ; (iatan2_5.s5 + 0)
.s37:
6cf3 : 85 0f __ STA P2 ; (x + 0)
6cf5 : 85 10 __ STA P3 ; (x + 1)
6cf7 : a5 0d __ LDA P0 ; (y + 0)
6cf9 : 05 0e __ ORA P1 ; (y + 1)
6cfb : f0 77 __ BEQ $6d74 ; (iatan2_5.s3 + 0)
.s5:
6cfd : 24 10 __ BIT P3 ; (x + 1)
6cff : 30 09 __ BMI $6d0a ; (iatan2_5.s36 + 0)
.s6:
6d01 : a5 0f __ LDA P2 ; (x + 0)
6d03 : 85 43 __ STA T1 + 0 
6d05 : a5 10 __ LDA P3 ; (x + 1)
6d07 : 4c 15 6d JMP $6d15 ; (iatan2_5.s7 + 0)
.s36:
6d0a : 38 __ __ SEC
6d0b : a9 00 __ LDA #$00
6d0d : e5 0f __ SBC P2 ; (x + 0)
6d0f : 85 43 __ STA T1 + 0 
6d11 : a9 00 __ LDA #$00
6d13 : e5 10 __ SBC P3 ; (x + 1)
.s7:
6d15 : a8 __ __ TAY
6d16 : 24 0e __ BIT P1 ; (y + 1)
6d18 : 30 09 __ BMI $6d23 ; (iatan2_5.s35 + 0)
.s8:
6d1a : a5 0d __ LDA P0 ; (y + 0)
6d1c : 85 45 __ STA T3 + 0 
6d1e : a5 0e __ LDA P1 ; (y + 1)
6d20 : 4c 2e 6d JMP $6d2e ; (iatan2_5.s9 + 0)
.s35:
6d23 : 38 __ __ SEC
6d24 : a9 00 __ LDA #$00
6d26 : e5 0d __ SBC P0 ; (y + 0)
6d28 : 85 45 __ STA T3 + 0 
6d2a : a9 00 __ LDA #$00
6d2c : e5 0e __ SBC P1 ; (y + 1)
.s9:
6d2e : 85 46 __ STA T3 + 1 
6d30 : 98 __ __ TYA
6d31 : 30 53 __ BMI $6d86 ; (iatan2_5.s10 + 0)
.s34:
6d33 : c4 46 __ CPY T3 + 1 
6d35 : d0 04 __ BNE $6d3b ; (iatan2_5.s33 + 0)
.s32:
6d37 : a5 43 __ LDA T1 + 0 
6d39 : c5 45 __ CMP T3 + 0 
.s33:
6d3b : 90 49 __ BCC $6d86 ; (iatan2_5.s10 + 0)
.s21:
6d3d : 84 04 __ STY WORK + 1 
6d3f : 24 0e __ BIT P1 ; (y + 1)
6d41 : 30 04 __ BMI $6d47 ; (iatan2_5.s23 + 0)
.s22:
6d43 : a9 ff __ LDA #$ff
6d45 : b0 02 __ BCS $6d49 ; (iatan2_5.s24 + 0)
.s23:
6d47 : a9 00 __ LDA #$00
.s24:
6d49 : 85 44 __ STA T2 + 0 
6d4b : a5 46 __ LDA T3 + 1 
6d4d : 06 45 __ ASL T3 + 0 
6d4f : 2a __ __ ROL
6d50 : 06 45 __ ASL T3 + 0 
6d52 : 2a __ __ ROL
6d53 : 06 45 __ ASL T3 + 0 
6d55 : 2a __ __ ROL
6d56 : 85 1c __ STA ACCU + 1 
6d58 : a5 45 __ LDA T3 + 0 
6d5a : 85 1b __ STA ACCU + 0 
6d5c : a5 43 __ LDA T1 + 0 
6d5e : 85 03 __ STA WORK + 0 
6d60 : 20 52 78 JSR $7852 ; (divs16 + 0)
6d63 : a5 10 __ LDA P3 ; (x + 1)
6d65 : 30 04 __ BMI $6d6b ; (iatan2_5.s25 + 0)
.s31:
6d67 : 05 0f __ ORA P2 ; (x + 0)
6d69 : d0 10 __ BNE $6d7b ; (iatan2_5.s28 + 0)
.s25:
6d6b : 24 44 __ BIT T2 + 0 
6d6d : 30 06 __ BMI $6d75 ; (iatan2_5.s27 + 0)
.s26:
6d6f : 18 __ __ CLC
6d70 : a5 1b __ LDA ACCU + 0 
6d72 : 69 10 __ ADC #$10
.s3:
6d74 : 60 __ __ RTS
.s27:
6d75 : a9 10 __ LDA #$10
.s38:
6d77 : 38 __ __ SEC
6d78 : e5 1b __ SBC ACCU + 0 
6d7a : 60 __ __ RTS
.s28:
6d7b : 24 44 __ BIT T2 + 0 
6d7d : 10 03 __ BPL $6d82 ; (iatan2_5.s29 + 0)
.s30:
6d7f : a5 1b __ LDA ACCU + 0 
6d81 : 60 __ __ RTS
.s29:
6d82 : a9 20 __ LDA #$20
6d84 : d0 f1 __ BNE $6d77 ; (iatan2_5.s38 + 0)
.s10:
6d86 : 24 10 __ BIT P3 ; (x + 1)
6d88 : 30 04 __ BMI $6d8e ; (iatan2_5.s12 + 0)
.s11:
6d8a : a9 ff __ LDA #$ff
6d8c : d0 02 __ BNE $6d90 ; (iatan2_5.s13 + 0)
.s12:
6d8e : a9 00 __ LDA #$00
.s13:
6d90 : 85 47 __ STA T4 + 0 
6d92 : 98 __ __ TYA
6d93 : 06 43 __ ASL T1 + 0 
6d95 : 2a __ __ ROL
6d96 : 06 43 __ ASL T1 + 0 
6d98 : 2a __ __ ROL
6d99 : 06 43 __ ASL T1 + 0 
6d9b : 2a __ __ ROL
6d9c : 85 1c __ STA ACCU + 1 
6d9e : a5 43 __ LDA T1 + 0 
6da0 : 85 1b __ STA ACCU + 0 
6da2 : a5 45 __ LDA T3 + 0 
6da4 : 85 03 __ STA WORK + 0 
6da6 : a5 46 __ LDA T3 + 1 
6da8 : 85 04 __ STA WORK + 1 
6daa : 20 52 78 JSR $7852 ; (divs16 + 0)
6dad : a5 0e __ LDA P1 ; (y + 1)
6daf : 30 04 __ BMI $6db5 ; (iatan2_5.s14 + 0)
.s20:
6db1 : 05 0d __ ORA P0 ; (y + 0)
6db3 : d0 0e __ BNE $6dc3 ; (iatan2_5.s17 + 0)
.s14:
6db5 : 24 47 __ BIT T4 + 0 
6db7 : 10 06 __ BPL $6dbf ; (iatan2_5.s15 + 0)
.s16:
6db9 : 18 __ __ CLC
6dba : a5 1b __ LDA ACCU + 0 
6dbc : 69 18 __ ADC #$18
6dbe : 60 __ __ RTS
.s15:
6dbf : a9 18 __ LDA #$18
6dc1 : d0 b4 __ BNE $6d77 ; (iatan2_5.s38 + 0)
.s17:
6dc3 : 24 47 __ BIT T4 + 0 
6dc5 : 10 04 __ BPL $6dcb ; (iatan2_5.s18 + 0)
.s19:
6dc7 : a9 08 __ LDA #$08
6dc9 : d0 ac __ BNE $6d77 ; (iatan2_5.s38 + 0)
.s18:
6dcb : 18 __ __ CLC
6dcc : a5 1b __ LDA ACCU + 0 
6dce : 69 08 __ ADC #$08
6dd0 : 60 __ __ RTS
--------------------------------------------------------------------
idist_5: ; idist_5(i16,i16)->u8
; 137, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6dd1 : a5 0f __ LDA P2 ; (dy + 0)
6dd3 : 85 03 __ STA WORK + 0 
6dd5 : 85 1b __ STA ACCU + 0 
6dd7 : a5 10 __ LDA P3 ; (dy + 1)
6dd9 : 85 04 __ STA WORK + 1 
6ddb : 85 1c __ STA ACCU + 1 
6ddd : 20 0c 78 JSR $780c ; (mul16 + 0)
6de0 : a5 05 __ LDA WORK + 2 
6de2 : 85 43 __ STA T0 + 0 
6de4 : a5 06 __ LDA WORK + 3 
6de6 : 85 44 __ STA T0 + 1 
6de8 : a5 0d __ LDA P0 ; (dx + 0)
6dea : 85 03 __ STA WORK + 0 
6dec : 85 1b __ STA ACCU + 0 
6dee : a5 0e __ LDA P1 ; (dx + 1)
6df0 : 85 04 __ STA WORK + 1 
6df2 : 85 1c __ STA ACCU + 1 
6df4 : 20 0c 78 JSR $780c ; (mul16 + 0)
6df7 : 18 __ __ CLC
6df8 : a5 05 __ LDA WORK + 2 
6dfa : 65 43 __ ADC T0 + 0 
6dfc : 85 43 __ STA T0 + 0 
6dfe : a5 06 __ LDA WORK + 3 
6e00 : 65 44 __ ADC T0 + 1 
6e02 : 85 44 __ STA T0 + 1 
6e04 : 05 43 __ ORA T0 + 0 
6e06 : f0 64 __ BEQ $6e6c ; (idist_5.s11 + 0)
.s5:
6e08 : a5 44 __ LDA T0 + 1 
6e0a : 4a __ __ LSR
6e0b : 85 46 __ STA T1 + 1 
6e0d : a5 43 __ LDA T0 + 0 
6e0f : 6a __ __ ROR
6e10 : 85 45 __ STA T1 + 0 
6e12 : 05 46 __ ORA T1 + 1 
6e14 : d0 08 __ BNE $6e1e ; (idist_5.l6 + 0)
.s10:
6e16 : a9 01 __ LDA #$01
6e18 : 85 45 __ STA T1 + 0 
6e1a : a9 00 __ LDA #$00
6e1c : 85 46 __ STA T1 + 1 
.l6:
6e1e : a5 45 __ LDA T1 + 0 
6e20 : 85 03 __ STA WORK + 0 
6e22 : 85 47 __ STA T2 + 0 
6e24 : a5 46 __ LDA T1 + 1 
6e26 : 85 04 __ STA WORK + 1 
6e28 : 85 48 __ STA T2 + 1 
6e2a : a5 43 __ LDA T0 + 0 
6e2c : 85 1b __ STA ACCU + 0 
6e2e : a5 44 __ LDA T0 + 1 
6e30 : 85 1c __ STA ACCU + 1 
6e32 : 20 8d 78 JSR $788d ; (divmod + 0)
6e35 : 18 __ __ CLC
6e36 : a5 1b __ LDA ACCU + 0 
6e38 : 65 45 __ ADC T1 + 0 
6e3a : 85 45 __ STA T1 + 0 
6e3c : a5 1c __ LDA ACCU + 1 
6e3e : 65 46 __ ADC T1 + 1 
6e40 : 4a __ __ LSR
6e41 : 85 46 __ STA T1 + 1 
6e43 : 66 45 __ ROR T1 + 0 
6e45 : c5 48 __ CMP T2 + 1 
6e47 : 90 d5 __ BCC $6e1e ; (idist_5.l6 + 0)
.s12:
6e49 : d0 24 __ BNE $6e6f ; (idist_5.s13 + 0)
.s9:
6e4b : a5 45 __ LDA T1 + 0 
6e4d : c5 47 __ CMP T2 + 0 
6e4f : 90 cd __ BCC $6e1e ; (idist_5.l6 + 0)
.s7:
6e51 : 85 03 __ STA WORK + 0 
6e53 : a9 20 __ LDA #$20
6e55 : 85 1b __ STA ACCU + 0 
6e57 : a9 03 __ LDA #$03
6e59 : 85 1c __ STA ACCU + 1 
6e5b : a5 46 __ LDA T1 + 1 
6e5d : 85 04 __ STA WORK + 1 
6e5f : 20 8d 78 JSR $788d ; (divmod + 0)
6e62 : a5 1c __ LDA ACCU + 1 
6e64 : d0 06 __ BNE $6e6c ; (idist_5.s11 + 0)
.s8:
6e66 : a5 1b __ LDA ACCU + 0 
6e68 : c9 20 __ CMP #$20
6e6a : 90 02 __ BCC $6e6e ; (idist_5.s3 + 0)
.s11:
6e6c : a9 1f __ LDA #$1f
.s3:
6e6e : 60 __ __ RTS
.s13:
6e6f : a5 45 __ LDA T1 + 0 
6e71 : b0 de __ BCS $6e51 ; (idist_5.s7 + 0)
--------------------------------------------------------------------
reu_dma@proxy: ; reu_dma@proxy
6e73 : a5 07 __ LDA WORK + 4 
6e75 : 85 0e __ STA P1 
6e77 : a5 08 __ LDA WORK + 5 
6e79 : 85 0f __ STA P2 
--------------------------------------------------------------------
reu_dma: ; reu_dma(u8,u32,void*,u8)->void
;  94, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6e7b : 78 __ __ SEI
6e7c : a9 00 __ LDA #$00
6e7e : 8d 02 df STA $df02 
6e81 : a9 a3 __ LDA #$a3
6e83 : 8d 03 df STA $df03 
6e86 : a5 0e __ LDA P1 ; (reu_addr + 0)
6e88 : 8d 04 df STA $df04 
6e8b : a5 0f __ LDA P2 ; (reu_addr + 1)
6e8d : 8d 05 df STA $df05 
6e90 : a5 10 __ LDA P3 ; (reu_addr + 2)
6e92 : 8d 06 df STA $df06 
6e95 : a9 a0 __ LDA #$a0
6e97 : 8d 07 df STA $df07 
6e9a : a9 00 __ LDA #$00
6e9c : 8d 08 df STA $df08 
6e9f : a5 0d __ LDA P0 ; (cmd + 0)
6ea1 : 8d 01 df STA $df01 
6ea4 : 58 __ __ CLI
.s3:
6ea5 : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_build_tex: ; tunnel_build_tex()->void
; 182, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6ea6 : a9 00 __ LDA #$00
6ea8 : 85 1b __ STA ACCU + 0 
.l5:
6eaa : 29 04 __ AND #$04
6eac : 4a __ __ LSR
6ead : 4a __ __ LSR
6eae : f0 02 __ BEQ $6eb2 ; (tunnel_build_tex.s14 + 0)
.s13:
6eb0 : a9 04 __ LDA #$04
.s14:
6eb2 : 85 43 __ STA T1 + 0 
6eb4 : a5 1b __ LDA ACCU + 0 
6eb6 : 0a __ __ ASL
6eb7 : 0a __ __ ASL
6eb8 : 0a __ __ ASL
6eb9 : 0a __ __ ASL
6eba : 85 45 __ STA T2 + 0 
6ebc : a9 00 __ LDA #$00
6ebe : 85 1c __ STA ACCU + 1 
6ec0 : 2a __ __ ROL
6ec1 : 06 45 __ ASL T2 + 0 
6ec3 : 2a __ __ ROL
6ec4 : 85 46 __ STA T2 + 1 
6ec6 : a5 1b __ LDA ACCU + 0 
6ec8 : 29 03 __ AND #$03
6eca : f0 3b __ BEQ $6f07 ; (tunnel_build_tex.s11 + 0)
.l6:
6ecc : 18 __ __ CLC
6ecd : a5 43 __ LDA T1 + 0 
6ecf : 65 1c __ ADC ACCU + 1 
6ed1 : 29 1f __ AND #$1f
6ed3 : aa __ __ TAX
6ed4 : 29 07 __ AND #$07
6ed6 : d0 04 __ BNE $6edc ; (tunnel_build_tex.s7 + 0)
.s10:
6ed8 : a9 02 __ LDA #$02
6eda : d0 05 __ BNE $6ee1 ; (tunnel_build_tex.s8 + 0)
.s7:
6edc : 8a __ __ TXA
6edd : 29 04 __ AND #$04
6edf : 4a __ __ LSR
6ee0 : 4a __ __ LSR
.s8:
6ee1 : aa __ __ TAX
6ee2 : a5 45 __ LDA T2 + 0 
6ee4 : 05 1c __ ORA ACCU + 1 
6ee6 : 18 __ __ CLC
6ee7 : 69 a0 __ ADC #$a0
6ee9 : 85 47 __ STA T5 + 0 
6eeb : a9 a3 __ LDA #$a3
6eed : 65 46 __ ADC T2 + 1 
6eef : 85 48 __ STA T5 + 1 
6ef1 : 8a __ __ TXA
6ef2 : a0 00 __ LDY #$00
6ef4 : 91 47 __ STA (T5 + 0),y 
6ef6 : e6 1c __ INC ACCU + 1 
6ef8 : a5 1c __ LDA ACCU + 1 
6efa : c9 20 __ CMP #$20
6efc : d0 ce __ BNE $6ecc ; (tunnel_build_tex.l6 + 0)
.s9:
6efe : e6 1b __ INC ACCU + 0 
6f00 : a5 1b __ LDA ACCU + 0 
6f02 : c9 20 __ CMP #$20
6f04 : d0 a4 __ BNE $6eaa ; (tunnel_build_tex.l5 + 0)
.s3:
6f06 : 60 __ __ RTS
.s11:
6f07 : 85 43 __ STA T1 + 0 
6f09 : a6 45 __ LDX T2 + 0 
.l12:
6f0b : 8a __ __ TXA
6f0c : 05 1c __ ORA ACCU + 1 
6f0e : 18 __ __ CLC
6f0f : 69 a0 __ ADC #$a0
6f11 : a8 __ __ TAY
6f12 : a9 a3 __ LDA #$a3
6f14 : 65 46 __ ADC T2 + 1 
6f16 : 85 44 __ STA T1 + 1 
6f18 : a9 03 __ LDA #$03
6f1a : 91 43 __ STA (T1 + 0),y 
6f1c : e6 1c __ INC ACCU + 1 
6f1e : a5 1c __ LDA ACCU + 1 
6f20 : c9 20 __ CMP #$20
6f22 : d0 e7 __ BNE $6f0b ; (tunnel_build_tex.l12 + 0)
6f24 : f0 d8 __ BEQ $6efe ; (tunnel_build_tex.s9 + 0)
--------------------------------------------------------------------
tun_init: ; tun_init()->void
; 266, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6f26 : a9 00 __ LDA #$00
6f28 : 85 0f __ STA P2 
6f2a : 85 10 __ STA P3 
6f2c : 85 43 __ STA T0 + 0 
6f2e : 85 0d __ STA P0 
6f30 : a9 35 __ LDA #$35
6f32 : 85 01 __ STA $01 
6f34 : 20 45 7c JSR $7c45 ; (memset@proxy + 0)
6f37 : a9 c0 __ LDA #$c0
6f39 : 85 44 __ STA T0 + 1 
6f3b : a9 00 __ LDA #$00
6f3d : 85 1f __ STA ADDR + 0 
6f3f : f0 02 __ BEQ $6f43 ; (tun_init.l7 + 0)
.s8:
6f41 : e6 44 __ INC T0 + 1 
.l7:
6f43 : a9 f9 __ LDA #$f9
6f45 : a0 00 __ LDY #$00
6f47 : 91 43 __ STA (T0 + 0),y 
6f49 : 18 __ __ CLC
6f4a : a5 44 __ LDA T0 + 1 
6f4c : 69 18 __ ADC #$18
6f4e : 85 20 __ STA ADDR + 1 
6f50 : a9 01 __ LDA #$01
6f52 : a4 43 __ LDY T0 + 0 
6f54 : 91 1f __ STA (ADDR + 0),y 
6f56 : 98 __ __ TYA
6f57 : 18 __ __ CLC
6f58 : 69 01 __ ADC #$01
6f5a : 85 43 __ STA T0 + 0 
6f5c : b0 e3 __ BCS $6f41 ; (tun_init.s8 + 0)
.s9:
6f5e : c9 e8 __ CMP #$e8
6f60 : d0 e1 __ BNE $6f43 ; (tun_init.l7 + 0)
.s6:
6f62 : a5 44 __ LDA T0 + 1 
6f64 : c9 c3 __ CMP #$c3
6f66 : d0 db __ BNE $6f43 ; (tun_init.l7 + 0)
.s5:
6f68 : a9 00 __ LDA #$00
6f6a : 85 0e __ STA P1 
6f6c : 85 10 __ STA P3 
6f6e : 20 a5 7c JSR $7ca5 ; (vic_setmode@proxy + 0)
6f71 : a9 00 __ LDA #$00
6f73 : 8d 21 d0 STA $d021 
6f76 : 8d 20 d0 STA $d020 
.s3:
6f79 : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_render: ; tunnel_render(u8,u8,i8,i8)->void
; 209, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6f7a : 18 __ __ CLC
6f7b : a5 15 __ LDA P8 ; (vert_j + 0)
6f7d : 69 05 __ ADC #$05
6f7f : 85 51 __ STA T12 + 0 
6f81 : a9 00 __ LDA #$00
6f83 : 85 52 __ STA T13 + 0 
6f85 : a9 d1 __ LDA #$d1
6f87 : 85 0d __ STA P0 
.l5:
6f89 : a5 51 __ LDA T12 + 0 
6f8b : 85 1b __ STA ACCU + 0 
6f8d : a9 00 __ LDA #$00
6f8f : 85 1c __ STA ACCU + 1 
6f91 : 85 1d __ STA ACCU + 2 
6f93 : 85 1e __ STA ACCU + 3 
6f95 : a9 a0 __ LDA #$a0
6f97 : 20 d6 77 JSR $77d6 ; (mul32by8 + 0)
6f9a : 18 __ __ CLC
6f9b : a5 09 __ LDA WORK + 6 
6f9d : 69 20 __ ADC #$20
6f9f : 85 10 __ STA P3 
6fa1 : a5 0a __ LDA WORK + 7 
6fa3 : 69 00 __ ADC #$00
6fa5 : 85 11 __ STA P4 
6fa7 : 20 73 6e JSR $6e73 ; (reu_dma@proxy + 0)
6faa : a5 52 __ LDA T13 + 0 
6fac : 4a __ __ LSR
6fad : 4a __ __ LSR
6fae : 4a __ __ LSR
6faf : aa __ __ TAX
6fb0 : a5 52 __ LDA T13 + 0 
6fb2 : 29 07 __ AND #$07
6fb4 : 1d 00 7c ORA $7c00,x ; (__multab320L + 0)
6fb7 : 85 43 __ STA T1 + 0 
6fb9 : bd 0d 7c LDA $7c0d,x ; (__multab320H + 0)
6fbc : 09 e0 __ ORA #$e0
6fbe : 85 44 __ STA T1 + 1 
6fc0 : 38 __ __ SEC
6fc1 : a9 c7 __ LDA #$c7
6fc3 : e5 52 __ SBC T13 + 0 
6fc5 : aa __ __ TAX
6fc6 : 29 07 __ AND #$07
6fc8 : 85 1c __ STA ACCU + 1 
6fca : 8a __ __ TXA
6fcb : 4a __ __ LSR
6fcc : 4a __ __ LSR
6fcd : 4a __ __ LSR
6fce : 85 1b __ STA ACCU + 0 
6fd0 : 0a __ __ ASL
6fd1 : 0a __ __ ASL
6fd2 : 65 1b __ ADC ACCU + 0 
6fd4 : 4a __ __ LSR
6fd5 : 6a __ __ ROR
6fd6 : aa __ __ TAX
6fd7 : 29 80 __ AND #$80
6fd9 : 6a __ __ ROR
6fda : 05 1c __ ORA ACCU + 1 
6fdc : 85 1b __ STA ACCU + 0 
6fde : 8a __ __ TXA
6fdf : 29 3f __ AND #$3f
6fe1 : 69 e0 __ ADC #$e0
6fe3 : 85 1c __ STA ACCU + 1 
6fe5 : a9 00 __ LDA #$00
6fe7 : 85 1d __ STA ACCU + 2 
.l6:
6fe9 : 0a __ __ ASL
6fea : 18 __ __ CLC
6feb : 65 14 __ ADC P7 ; (lat_j + 0)
6fed : 85 45 __ STA T4 + 0 
6fef : aa __ __ TAX
6ff0 : a8 __ __ TAY
6ff1 : c8 __ __ INY
6ff2 : 24 45 __ BIT T4 + 0 
6ff4 : 10 03 __ BPL $6ff9 ; (tunnel_render.s7 + 0)
6ff6 : 4c 06 71 JMP $7106 ; (tunnel_render.s13 + 0)
.s7:
6ff9 : a9 4f __ LDA #$4f
6ffb : c5 45 __ CMP T4 + 0 
6ffd : b0 02 __ BCS $7001 ; (tunnel_render.s8 + 0)
.s12:
6fff : 85 45 __ STA T4 + 0 
.s8:
7001 : 8a __ __ TXA
7002 : 30 06 __ BMI $700a ; (tunnel_render.s9 + 0)
.s20:
7004 : c9 4f __ CMP #$4f
7006 : 90 02 __ BCC $700a ; (tunnel_render.s9 + 0)
.s11:
7008 : a0 4f __ LDY #$4f
.s9:
700a : 84 47 __ STY T5 + 0 
700c : a5 13 __ LDA P6 ; (t_dist + 0)
700e : a6 45 __ LDX T4 + 0 
7010 : 18 __ __ CLC
7011 : 7d 50 a3 ADC $a350,x ; (row_buf[0] + 80)
7014 : 29 1f __ AND #$1f
7016 : 0a __ __ ASL
7017 : 0a __ __ ASL
7018 : 0a __ __ ASL
7019 : 0a __ __ ASL
701a : 85 49 __ STA T6 + 0 
701c : a9 00 __ LDA #$00
701e : 2a __ __ ROL
701f : 06 49 __ ASL T6 + 0 
7021 : 2a __ __ ROL
7022 : 85 4a __ STA T6 + 1 
7024 : bd 00 a3 LDA $a300,x ; (row_buf[0] + 0)
7027 : 85 45 __ STA T4 + 0 
7029 : 65 12 __ ADC P5 ; (t_ang + 0)
702b : 29 1f __ AND #$1f
702d : 05 49 __ ORA T6 + 0 
702f : 18 __ __ CLC
7030 : 69 a0 __ ADC #$a0
7032 : 85 4d __ STA T9 + 0 
7034 : a9 a3 __ LDA #$a3
7036 : 65 4a __ ADC T6 + 1 
7038 : 85 4e __ STA T9 + 1 
703a : a0 00 __ LDY #$00
703c : b1 4d __ LDA (T9 + 0),y 
703e : aa __ __ TAX
703f : 4a __ __ LSR
7040 : 85 50 __ STA T10 + 1 
7042 : 98 __ __ TYA
7043 : 6a __ __ ROR
7044 : 66 50 __ ROR T10 + 1 
7046 : 6a __ __ ROR
7047 : 85 4f __ STA T10 + 0 
7049 : 8a __ __ TXA
704a : 0a __ __ ASL
704b : 0a __ __ ASL
704c : 0a __ __ ASL
704d : 0a __ __ ASL
704e : 05 4f __ ORA T10 + 0 
7050 : 85 4d __ STA T9 + 0 
7052 : a6 47 __ LDX T5 + 0 
7054 : bd 50 a3 LDA $a350,x ; (row_buf[0] + 80)
7057 : 18 __ __ CLC
7058 : 65 13 __ ADC P6 ; (t_dist + 0)
705a : 29 1f __ AND #$1f
705c : 0a __ __ ASL
705d : 0a __ __ ASL
705e : 0a __ __ ASL
705f : 0a __ __ ASL
7060 : 85 4b __ STA T7 + 0 
7062 : 98 __ __ TYA
7063 : 2a __ __ ROL
7064 : 06 4b __ ASL T7 + 0 
7066 : 2a __ __ ROL
7067 : 85 4c __ STA T7 + 1 
7069 : bd 00 a3 LDA $a300,x ; (row_buf[0] + 0)
706c : 85 47 __ STA T5 + 0 
706e : 65 12 __ ADC P5 ; (t_ang + 0)
7070 : 29 1f __ AND #$1f
7072 : 05 4b __ ORA T7 + 0 
7074 : 18 __ __ CLC
7075 : 69 a0 __ ADC #$a0
7077 : 85 4f __ STA T10 + 0 
7079 : a9 a3 __ LDA #$a3
707b : 65 4c __ ADC T7 + 1 
707d : 85 50 __ STA T10 + 1 
707f : b1 4f __ LDA (T10 + 0),y 
7081 : 0a __ __ ASL
7082 : 0a __ __ ASL
7083 : 05 4d __ ORA T9 + 0 
7085 : 11 4f __ ORA (T10 + 0),y 
7087 : 91 43 __ STA (T1 + 0),y 
7089 : 38 __ __ SEC
708a : a9 20 __ LDA #$20
708c : e5 45 __ SBC T4 + 0 
708e : 18 __ __ CLC
708f : 65 12 __ ADC P5 ; (t_ang + 0)
7091 : 29 1f __ AND #$1f
7093 : 05 49 __ ORA T6 + 0 
7095 : 18 __ __ CLC
7096 : 69 a0 __ ADC #$a0
7098 : 85 45 __ STA T4 + 0 
709a : a9 a3 __ LDA #$a3
709c : 65 4a __ ADC T6 + 1 
709e : 85 46 __ STA T4 + 1 
70a0 : b1 45 __ LDA (T4 + 0),y 
70a2 : aa __ __ TAX
70a3 : 4a __ __ LSR
70a4 : 85 4a __ STA T6 + 1 
70a6 : 98 __ __ TYA
70a7 : 6a __ __ ROR
70a8 : 66 4a __ ROR T6 + 1 
70aa : 6a __ __ ROR
70ab : 85 49 __ STA T6 + 0 
70ad : 8a __ __ TXA
70ae : 0a __ __ ASL
70af : 0a __ __ ASL
70b0 : 0a __ __ ASL
70b1 : 0a __ __ ASL
70b2 : 05 49 __ ORA T6 + 0 
70b4 : 85 45 __ STA T4 + 0 
70b6 : 38 __ __ SEC
70b7 : a9 20 __ LDA #$20
70b9 : e5 47 __ SBC T5 + 0 
70bb : 18 __ __ CLC
70bc : 65 12 __ ADC P5 ; (t_ang + 0)
70be : 29 1f __ AND #$1f
70c0 : 05 4b __ ORA T7 + 0 
70c2 : 18 __ __ CLC
70c3 : 69 a0 __ ADC #$a0
70c5 : 85 47 __ STA T5 + 0 
70c7 : a9 a3 __ LDA #$a3
70c9 : 65 4c __ ADC T7 + 1 
70cb : 85 48 __ STA T5 + 1 
70cd : b1 47 __ LDA (T5 + 0),y 
70cf : 0a __ __ ASL
70d0 : 0a __ __ ASL
70d1 : 05 45 __ ORA T4 + 0 
70d3 : 11 47 __ ORA (T5 + 0),y 
70d5 : 91 1b __ STA (ACCU + 0),y 
70d7 : 18 __ __ CLC
70d8 : a5 43 __ LDA T1 + 0 
70da : 69 08 __ ADC #$08
70dc : 85 43 __ STA T1 + 0 
70de : 90 03 __ BCC $70e3 ; (tunnel_render.s17 + 0)
.s16:
70e0 : e6 44 __ INC T1 + 1 
70e2 : 18 __ __ CLC
.s17:
70e3 : a5 1b __ LDA ACCU + 0 
70e5 : 69 08 __ ADC #$08
70e7 : 85 1b __ STA ACCU + 0 
70e9 : 90 02 __ BCC $70ed ; (tunnel_render.s19 + 0)
.s18:
70eb : e6 1c __ INC ACCU + 1 
.s19:
70ed : e6 1d __ INC ACCU + 2 
70ef : a5 1d __ LDA ACCU + 2 
70f1 : c9 28 __ CMP #$28
70f3 : f0 03 __ BEQ $70f8 ; (tunnel_render.s10 + 0)
70f5 : 4c e9 6f JMP $6fe9 ; (tunnel_render.l6 + 0)
.s10:
70f8 : e6 51 __ INC T12 + 0 
70fa : e6 52 __ INC T13 + 0 
70fc : a5 52 __ LDA T13 + 0 
70fe : c9 64 __ CMP #$64
7100 : f0 03 __ BEQ $7105 ; (tunnel_render.s3 + 0)
7102 : 4c 89 6f JMP $6f89 ; (tunnel_render.l5 + 0)
.s3:
7105 : 60 __ __ RTS
.s13:
7106 : a9 00 __ LDA #$00
7108 : 85 45 __ STA T4 + 0 
710a : 8a __ __ TXA
710b : 30 03 __ BMI $7110 ; (tunnel_render.s15 + 0)
710d : 4c 04 70 JMP $7004 ; (tunnel_render.s20 + 0)
.s15:
7110 : e0 ff __ CPX #$ff
7112 : 90 03 __ BCC $7117 ; (tunnel_render.s14 + 0)
7114 : 4c 01 70 JMP $7001 ; (tunnel_render.s8 + 0)
.s14:
7117 : a0 00 __ LDY #$00
7119 : 4c 0a 70 JMP $700a ; (tunnel_render.s9 + 0)
--------------------------------------------------------------------
scroller_run: ; scroller_run()->void
;   3, "/home/xahmol/git/UltimateDemo2026/src/scroller.h"
.s4:
711c : a9 00 __ LDA #$00
711e : 8d d6 87 STA $87d6 ; (loops + 0)
7121 : 8d d7 87 STA $87d7 ; (loops + 1)
7124 : 8d fe 86 STA $86fe ; (done + 0)
7127 : 8d ff 83 STA $83ff ; (plasma_phase + 0)
712a : 8d fe 83 STA $83fe ; (wave_phase + 0)
712d : 8d ff 76 STA $76ff ; (insert_col + 0)
7130 : 8d fc 83 STA $83fc ; (txt_pos + 0)
7133 : 8d fd 83 STA $83fd ; (txt_pos + 1)
7136 : a9 07 __ LDA #$07
7138 : 8d ff 80 STA $80ff ; (fine_x + 0)
713b : 20 43 72 JSR $7243 ; (scr_init.s4 + 0)
713e : a9 00 __ LDA #$00
7140 : 8d 20 d0 STA $d020 
.l5:
7143 : 2c 11 d0 BIT $d011 
7146 : 30 fb __ BMI $7143 ; (scroller_run.l5 + 0)
.l6:
7148 : 2c 11 d0 BIT $d011 
714b : 10 fb __ BPL $7148 ; (scroller_run.l6 + 0)
.s7:
714d : a9 00 __ LDA #$00
714f : 8d 00 dc STA $dc00 
7152 : ad 01 dc LDA $dc01 
7155 : 85 43 __ STA T0 + 0 
7157 : a9 ff __ LDA #$ff
7159 : 8d 00 dc STA $dc00 
715c : c5 43 __ CMP T0 + 0 
715e : f0 05 __ BEQ $7165 ; (scroller_run.s8 + 0)
.s20:
7160 : a9 01 __ LDA #$01
7162 : 8d fe 86 STA $86fe ; (done + 0)
.s8:
7165 : ad ff 80 LDA $80ff ; (fine_x + 0)
7168 : f0 06 __ BEQ $7170 ; (scroller_run.s9 + 0)
.s19:
716a : ce ff 80 DEC $80ff ; (fine_x + 0)
716d : 4c 00 72 JMP $7200 ; (scroller_run.s11 + 0)
.s9:
7170 : a9 07 __ LDA #$07
7172 : 8d ff 80 STA $80ff ; (fine_x + 0)
7175 : a2 00 __ LDX #$00
.l21:
7177 : bd d9 87 LDA $87d9,x ; (scr_letter[0] + 1)
717a : 9d d8 87 STA $87d8,x ; (scr_letter[0] + 0)
717d : bd c9 89 LDA $89c9,x ; (scr_col[0] + 1)
7180 : 9d c8 89 STA $89c8,x ; (scr_col[0] + 0)
7183 : e8 __ __ INX
7184 : e0 27 __ CPX #$27
7186 : d0 ef __ BNE $7177 ; (scroller_run.l21 + 0)
.s22:
7188 : 18 __ __ CLC
7189 : a9 40 __ LDA #$40
718b : 6d fc 83 ADC $83fc ; (txt_pos + 0)
718e : 85 43 __ STA T0 + 0 
7190 : a9 84 __ LDA #$84
7192 : 6d fd 83 ADC $83fd ; (txt_pos + 1)
7195 : 85 44 __ STA T0 + 1 
7197 : a0 00 __ LDY #$00
7199 : b1 43 __ LDA (T0 + 0),y 
719b : 20 a9 72 JSR $72a9 ; (letter_idx.s4 + 0)
719e : aa __ __ TAX
719f : ad ff 76 LDA $76ff ; (insert_col + 0)
71a2 : dd 78 86 CMP $8678,x ; (letter_width[0] + 0)
71a5 : b0 0b __ BCS $71b2 ; (scroller_run.s10 + 0)
.s18:
71a7 : 8e ff 87 STX $87ff ; (scr_letter[0] + 39)
71aa : 8d ef 89 STA $89ef ; (scr_col[0] + 39)
71ad : ee ff 76 INC $76ff ; (insert_col + 0)
71b0 : 90 4e __ BCC $7200 ; (scroller_run.s11 + 0)
.s10:
71b2 : a9 00 __ LDA #$00
71b4 : 8d ff 76 STA $76ff ; (insert_col + 0)
71b7 : 8d ef 89 STA $89ef ; (scr_col[0] + 39)
71ba : ad fc 83 LDA $83fc ; (txt_pos + 0)
71bd : 69 00 __ ADC #$00
71bf : 8d fc 83 STA $83fc ; (txt_pos + 0)
71c2 : a9 34 __ LDA #$34
71c4 : 8d ff 87 STA $87ff ; (scr_letter[0] + 39)
71c7 : ad fd 83 LDA $83fd ; (txt_pos + 1)
71ca : 69 00 __ ADC #$00
71cc : 8d fd 83 STA $83fd ; (txt_pos + 1)
71cf : c9 02 __ CMP #$02
71d1 : d0 05 __ BNE $71d8 ; (scroller_run.s17 + 0)
.s16:
71d3 : ad fc 83 LDA $83fc ; (txt_pos + 0)
71d6 : c9 37 __ CMP #$37
.s17:
71d8 : 90 26 __ BCC $7200 ; (scroller_run.s11 + 0)
.s13:
71da : a9 00 __ LDA #$00
71dc : 8d fc 83 STA $83fc ; (txt_pos + 0)
71df : 8d fd 83 STA $83fd ; (txt_pos + 1)
71e2 : ad d6 87 LDA $87d6 ; (loops + 0)
71e5 : 69 00 __ ADC #$00
71e7 : 8d d6 87 STA $87d6 ; (loops + 0)
71ea : ad d7 87 LDA $87d7 ; (loops + 1)
71ed : 69 00 __ ADC #$00
71ef : 8d d7 87 STA $87d7 ; (loops + 1)
71f2 : d0 07 __ BNE $71fb ; (scroller_run.s14 + 0)
.s15:
71f4 : ad d6 87 LDA $87d6 ; (loops + 0)
71f7 : c9 02 __ CMP #$02
71f9 : 90 05 __ BCC $7200 ; (scroller_run.s11 + 0)
.s14:
71fb : a9 01 __ LDA #$01
71fd : 8d fe 86 STA $86fe ; (done + 0)
.s11:
7200 : 20 74 73 JSR $7374 ; (draw_frame.s4 + 0)
7203 : ee fe 83 INC $83fe ; (wave_phase + 0)
7206 : ee ff 83 INC $83ff ; (plasma_phase + 0)
7209 : ad 16 d0 LDA $d016 
720c : 29 f8 __ AND #$f8
720e : 0d ff 80 ORA $80ff ; (fine_x + 0)
7211 : 8d 16 d0 STA $d016 
7214 : ad fe 86 LDA $86fe ; (done + 0)
7217 : d0 03 __ BNE $721c ; (scr_done.s4 + 0)
7219 : 4c 43 71 JMP $7143 ; (scroller_run.l5 + 0)
--------------------------------------------------------------------
scr_done: ; scr_done()->void
; 366, "/home/xahmol/git/UltimateDemo2026/src/scroller.c"
.s4:
721c : ad 16 d0 LDA $d016 
721f : 29 f8 __ AND #$f8
7221 : 8d 16 d0 STA $d016 
7224 : a9 00 __ LDA #$00
7226 : 85 0d __ STA P0 
7228 : 85 0e __ STA P1 
722a : 85 10 __ STA P3 
722c : 20 88 0f JSR $0f88 ; (vic_setmode@proxy + 0)
722f : a9 20 __ LDA #$20
7231 : a2 fa __ LDX #$fa
.l5:
7233 : ca __ __ DEX
7234 : 9d 00 04 STA $0400,x 
7237 : 9d fa 04 STA $04fa,x 
723a : 9d f4 05 STA $05f4,x 
723d : 9d ee 06 STA $06ee,x 
7240 : d0 f1 __ BNE $7233 ; (scr_done.l5 + 0)
.s3:
7242 : 60 __ __ RTS
--------------------------------------------------------------------
scr_init: ; scr_init()->void
; 346, "/home/xahmol/git/UltimateDemo2026/src/scroller.c"
.s4:
7243 : a9 00 __ LDA #$00
7245 : 85 0d __ STA P0 
7247 : 85 43 __ STA T0 + 0 
7249 : 85 0e __ STA P1 
724b : 85 10 __ STA P3 
724d : a9 04 __ LDA #$04
724f : 85 44 __ STA T0 + 1 
7251 : 85 0f __ STA P2 
7253 : a9 10 __ LDA #$10
7255 : 85 11 __ STA P4 
7257 : 20 90 0f JSR $0f90 ; (vic_setmode.s4 + 0)
725a : a9 00 __ LDA #$00
725c : 8d 21 d0 STA $d021 
725f : 8d 20 d0 STA $d020 
7262 : 85 1f __ STA ADDR + 0 
7264 : f0 02 __ BEQ $7268 ; (scr_init.l8 + 0)
.s10:
7266 : e6 44 __ INC T0 + 1 
.l8:
7268 : a9 20 __ LDA #$20
726a : a0 00 __ LDY #$00
726c : 91 43 __ STA (T0 + 0),y 
726e : 18 __ __ CLC
726f : a5 44 __ LDA T0 + 1 
7271 : 69 d4 __ ADC #$d4
7273 : 85 20 __ STA ADDR + 1 
7275 : a9 06 __ LDA #$06
7277 : a4 43 __ LDY T0 + 0 
7279 : 91 1f __ STA (ADDR + 0),y 
727b : 98 __ __ TYA
727c : 18 __ __ CLC
727d : 69 01 __ ADC #$01
727f : 85 43 __ STA T0 + 0 
7281 : b0 e3 __ BCS $7266 ; (scr_init.s10 + 0)
.s11:
7283 : c9 e8 __ CMP #$e8
7285 : d0 e1 __ BNE $7268 ; (scr_init.l8 + 0)
.s7:
7287 : a5 44 __ LDA T0 + 1 
7289 : c9 07 __ CMP #$07
728b : d0 db __ BNE $7268 ; (scr_init.l8 + 0)
.s5:
728d : a2 00 __ LDX #$00
.l9:
728f : a9 34 __ LDA #$34
7291 : 9d d8 87 STA $87d8,x ; (scr_letter[0] + 0)
7294 : a9 00 __ LDA #$00
7296 : 9d c8 89 STA $89c8,x ; (scr_col[0] + 0)
7299 : e8 __ __ INX
729a : e0 28 __ CPX #$28
729c : d0 f1 __ BNE $728f ; (scr_init.l9 + 0)
.s6:
729e : ad 16 d0 LDA $d016 
72a1 : 29 f8 __ AND #$f8
72a3 : 09 07 __ ORA #$07
72a5 : 8d 16 d0 STA $d016 
.s3:
72a8 : 60 __ __ RTS
--------------------------------------------------------------------
letter_idx: ; letter_idx(u8)->u8
; 306, "/home/xahmol/git/UltimateDemo2026/src/scroller.c"
.s4:
72a9 : c9 61 __ CMP #$61
72ab : 90 07 __ BCC $72b4 ; (letter_idx.s5 + 0)
.s61:
72ad : c9 7b __ CMP #$7b
72af : b0 03 __ BCS $72b4 ; (letter_idx.s5 + 0)
.s62:
72b1 : e9 60 __ SBC #$60
.s3:
72b3 : 60 __ __ RTS
.s5:
72b4 : c9 41 __ CMP #$41
72b6 : 90 07 __ BCC $72bf ; (letter_idx.s6 + 0)
.s59:
72b8 : c9 5b __ CMP #$5b
72ba : b0 03 __ BCS $72bf ; (letter_idx.s6 + 0)
.s60:
72bc : 69 d9 __ ADC #$d9
72be : 60 __ __ RTS
.s6:
72bf : c9 30 __ CMP #$30
72c1 : b0 03 __ BCS $72c6 ; (letter_idx.s57 + 0)
72c3 : 4c 6a 73 JMP $736a ; (letter_idx.s7 + 0)
.s57:
72c6 : c9 3a __ CMP #$3a
72c8 : b0 03 __ BCS $72cd ; (letter_idx.s8 + 0)
.s58:
72ca : 69 05 __ ADC #$05
72cc : 60 __ __ RTS
.s8:
72cd : c9 2d __ CMP #$2d
72cf : 90 4e __ BCC $731f ; (letter_idx.s33 + 0)
.s9:
72d1 : c9 3d __ CMP #$3d
72d3 : d0 03 __ BNE $72d8 ; (letter_idx.s10 + 0)
.s32:
72d5 : a9 4d __ LDA #$4d
72d7 : 60 __ __ RTS
.s10:
72d8 : 90 24 __ BCC $72fe ; (letter_idx.s22 + 0)
.s11:
72da : c9 40 __ CMP #$40
72dc : d0 03 __ BNE $72e1 ; (letter_idx.s12 + 0)
.s21:
72de : a9 54 __ LDA #$54
72e0 : 60 __ __ RTS
.s12:
72e1 : 90 11 __ BCC $72f4 ; (letter_idx.s18 + 0)
.s13:
72e3 : c9 5b __ CMP #$5b
72e5 : d0 03 __ BNE $72ea ; (letter_idx.s14 + 0)
.s17:
72e7 : a9 53 __ LDA #$53
72e9 : 60 __ __ RTS
.s14:
72ea : c9 5d __ CMP #$5d
72ec : d0 03 __ BNE $72f1 ; (letter_idx.s15 + 0)
.s16:
72ee : a9 55 __ LDA #$55
72f0 : 60 __ __ RTS
.s15:
72f1 : a9 34 __ LDA #$34
72f3 : 60 __ __ RTS
.s18:
72f4 : c9 3e __ CMP #$3e
72f6 : d0 03 __ BNE $72fb ; (letter_idx.s19 + 0)
.s20:
72f8 : a9 52 __ LDA #$52
72fa : 60 __ __ RTS
.s19:
72fb : a9 4c __ LDA #$4c
72fd : 60 __ __ RTS
.s22:
72fe : c9 3a __ CMP #$3a
7300 : d0 03 __ BNE $7305 ; (letter_idx.s23 + 0)
.s31:
7302 : a9 3f __ LDA #$3f
7304 : 60 __ __ RTS
.s23:
7305 : 90 0a __ BCC $7311 ; (letter_idx.s27 + 0)
.s24:
7307 : c9 3b __ CMP #$3b
7309 : d0 03 __ BNE $730e ; (letter_idx.s25 + 0)
.s26:
730b : a9 42 __ LDA #$42
730d : 60 __ __ RTS
.s25:
730e : a9 50 __ LDA #$50
7310 : 60 __ __ RTS
.s27:
7311 : c9 2e __ CMP #$2e
7313 : d0 03 __ BNE $7318 ; (letter_idx.s28 + 0)
.s30:
7315 : a9 40 __ LDA #$40
7317 : 60 __ __ RTS
.s28:
7318 : c9 2f __ CMP #$2f
731a : d0 d5 __ BNE $72f1 ; (letter_idx.s15 + 0)
.s29:
731c : a9 44 __ LDA #$44
731e : 60 __ __ RTS
.s33:
731f : c9 26 __ CMP #$26
7321 : d0 03 __ BNE $7326 ; (letter_idx.s34 + 0)
.s55:
7323 : a9 48 __ LDA #$48
7325 : 60 __ __ RTS
.s34:
7326 : 90 21 __ BCC $7349 ; (letter_idx.s45 + 0)
.s35:
7328 : c9 29 __ CMP #$29
732a : d0 03 __ BNE $732f ; (letter_idx.s36 + 0)
.s44:
732c : a9 51 __ LDA #$51
732e : 60 __ __ RTS
.s36:
732f : 90 0e __ BCC $733f ; (letter_idx.s41 + 0)
.s37:
7331 : c9 2b __ CMP #$2b
7333 : d0 03 __ BNE $7338 ; (letter_idx.s38 + 0)
.s40:
7335 : a9 4b __ LDA #$4b
7337 : 60 __ __ RTS
.s38:
7338 : c9 2c __ CMP #$2c
733a : d0 b5 __ BNE $72f1 ; (letter_idx.s15 + 0)
.s39:
733c : a9 43 __ LDA #$43
733e : 60 __ __ RTS
.s41:
733f : c9 27 __ CMP #$27
7341 : d0 03 __ BNE $7346 ; (letter_idx.s42 + 0)
.s43:
7343 : a9 45 __ LDA #$45
7345 : 60 __ __ RTS
.s42:
7346 : a9 4f __ LDA #$4f
7348 : 60 __ __ RTS
.s45:
7349 : c9 23 __ CMP #$23
734b : d0 03 __ BNE $7350 ; (letter_idx.s46 + 0)
.s54:
734d : a9 4e __ LDA #$4e
734f : 60 __ __ RTS
.s46:
7350 : 90 0a __ BCC $735c ; (letter_idx.s50 + 0)
.s47:
7352 : c9 24 __ CMP #$24
7354 : d0 03 __ BNE $7359 ; (letter_idx.s48 + 0)
.s49:
7356 : a9 47 __ LDA #$47
7358 : 60 __ __ RTS
.s48:
7359 : a9 49 __ LDA #$49
735b : 60 __ __ RTS
.s50:
735c : c9 21 __ CMP #$21
735e : d0 03 __ BNE $7363 ; (letter_idx.s51 + 0)
.s53:
7360 : a9 41 __ LDA #$41
7362 : 60 __ __ RTS
.s51:
7363 : c9 22 __ CMP #$22
7365 : d0 8a __ BNE $72f1 ; (letter_idx.s15 + 0)
.s52:
7367 : a9 46 __ LDA #$46
7369 : 60 __ __ RTS
.s7:
736a : c9 2d __ CMP #$2d
736c : f0 03 __ BEQ $7371 ; (letter_idx.s56 + 0)
736e : 4c cd 72 JMP $72cd ; (letter_idx.s8 + 0)
.s56:
7371 : a9 4a __ LDA #$4a
7373 : 60 __ __ RTS
--------------------------------------------------------------------
draw_frame: ; draw_frame()->void
; 408, "/home/xahmol/git/UltimateDemo2026/src/scroller.c"
.s4:
7374 : ad ff 83 LDA $83ff ; (plasma_phase + 0)
7377 : 85 1d __ STA ACCU + 2 
7379 : 0a __ __ ASL
737a : 85 1e __ STA ACCU + 3 
737c : a9 00 __ LDA #$00
737e : 8d ff 86 STA $86ff ; (dp_y + 0)
7381 : 85 1f __ STA ADDR + 0 
7383 : 85 45 __ STA T4 + 0 
.l5:
7385 : ad ff 86 LDA $86ff ; (dp_y + 0)
7388 : 85 49 __ STA T7 + 0 
738a : 0a __ __ ASL
738b : 85 1b __ STA ACCU + 0 
738d : a9 00 __ LDA #$00
738f : 2a __ __ ROL
7390 : 06 1b __ ASL ACCU + 0 
7392 : 2a __ __ ROL
7393 : aa __ __ TAX
7394 : a5 1b __ LDA ACCU + 0 
7396 : 65 49 __ ADC T7 + 0 
7398 : 85 1b __ STA ACCU + 0 
739a : 8a __ __ TXA
739b : 69 00 __ ADC #$00
739d : 06 1b __ ASL ACCU + 0 
739f : 2a __ __ ROL
73a0 : 06 1b __ ASL ACCU + 0 
73a2 : 2a __ __ ROL
73a3 : 06 1b __ ASL ACCU + 0 
73a5 : 2a __ __ ROL
73a6 : 69 04 __ ADC #$04
73a8 : 85 46 __ STA T4 + 1 
73aa : a5 49 __ LDA T7 + 0 
73ac : 0a __ __ ASL
73ad : 0a __ __ ASL
73ae : 0a __ __ ASL
73af : 18 __ __ CLC
73b0 : 65 49 __ ADC T7 + 0 
73b2 : 18 __ __ CLC
73b3 : 65 1e __ ADC ACCU + 3 
73b5 : 29 3f __ AND #$3f
73b7 : aa __ __ TAX
73b8 : bd 00 87 LDA $8700,x ; (psin[0] + 0)
73bb : 85 43 __ STA T2 + 0 
73bd : a5 1d __ LDA ACCU + 2 
73bf : 85 47 __ STA T5 + 0 
73c1 : a9 28 __ LDA #$28
73c3 : 85 4a __ STA T8 + 0 
73c5 : a4 1b __ LDY ACCU + 0 
.l35:
73c7 : a9 a0 __ LDA #$a0
73c9 : 91 45 __ STA (T4 + 0),y 
73cb : a5 47 __ LDA T5 + 0 
73cd : 29 3f __ AND #$3f
73cf : aa __ __ TAX
73d0 : bd 00 87 LDA $8700,x ; (psin[0] + 0)
73d3 : 18 __ __ CLC
73d4 : 65 43 __ ADC T2 + 0 
73d6 : 4a __ __ LSR
73d7 : aa __ __ TAX
73d8 : 18 __ __ CLC
73d9 : a5 46 __ LDA T4 + 1 
73db : 69 d4 __ ADC #$d4
73dd : 85 20 __ STA ADDR + 1 
73df : bd c8 83 LDA $83c8,x ; (pcolor[0] + 0)
73e2 : 91 1f __ STA (ADDR + 0),y 
73e4 : 18 __ __ CLC
73e5 : a5 47 __ LDA T5 + 0 
73e7 : 69 05 __ ADC #$05
73e9 : 85 47 __ STA T5 + 0 
73eb : c8 __ __ INY
73ec : d0 02 __ BNE $73f0 ; (draw_frame.s40 + 0)
.s39:
73ee : e6 46 __ INC T4 + 1 
.s40:
73f0 : c6 4a __ DEC T8 + 0 
73f2 : d0 d3 __ BNE $73c7 ; (draw_frame.l35 + 0)
.s36:
73f4 : a6 49 __ LDX T7 + 0 
73f6 : e8 __ __ INX
73f7 : 8e ff 86 STX $86ff ; (dp_y + 0)
73fa : e0 19 __ CPX #$19
73fc : 90 87 __ BCC $7385 ; (draw_frame.l5 + 0)
.s6:
73fe : a9 00 __ LDA #$00
7400 : 8d f0 89 STA $89f0 ; (df_x + 0)
.l7:
7403 : ae f0 89 LDX $89f0 ; (df_x + 0)
7406 : 86 49 __ STX T7 + 0 
7408 : 86 1d __ STX ACCU + 2 
740a : bd c8 89 LDA $89c8,x ; (scr_col[0] + 0)
740d : 85 45 __ STA T4 + 0 
740f : d0 0f __ BNE $7420 ; (draw_frame.s9 + 0)
.s8:
7411 : ad fe 83 LDA $83fe ; (wave_phase + 0)
7414 : 18 __ __ CLC
7415 : 65 1d __ ADC ACCU + 2 
7417 : 29 3f __ AND #$3f
7419 : aa __ __ TAX
741a : bd 40 87 LDA $8740,x ; (sin_row[0] + 0)
741d : 8d f1 89 STA $89f1 ; (df_yoff + 0)
.s9:
7420 : ad f1 89 LDA $89f1 ; (df_yoff + 0)
7423 : 18 __ __ CLC
7424 : 69 0a __ ADC #$0a
7426 : 85 1e __ STA ACCU + 3 
7428 : 0a __ __ ASL
7429 : 85 1b __ STA ACCU + 0 
742b : a9 00 __ LDA #$00
742d : 2a __ __ ROL
742e : 06 1b __ ASL ACCU + 0 
7430 : 2a __ __ ROL
7431 : aa __ __ TAX
7432 : a5 1b __ LDA ACCU + 0 
7434 : 65 1e __ ADC ACCU + 3 
7436 : 85 43 __ STA T2 + 0 
7438 : 8a __ __ TXA
7439 : 69 00 __ ADC #$00
743b : 06 43 __ ASL T2 + 0 
743d : 2a __ __ ROL
743e : 06 43 __ ASL T2 + 0 
7440 : 2a __ __ ROL
7441 : 06 43 __ ASL T2 + 0 
7443 : 2a __ __ ROL
7444 : 85 44 __ STA T2 + 1 
7446 : a5 43 __ LDA T2 + 0 
7448 : 69 b0 __ ADC #$b0
744a : a8 __ __ TAY
744b : a5 44 __ LDA T2 + 1 
744d : 69 03 __ ADC #$03
744f : aa __ __ TAX
7450 : 98 __ __ TYA
7451 : 18 __ __ CLC
7452 : 65 1d __ ADC ACCU + 2 
7454 : 85 1b __ STA ACCU + 0 
7456 : 85 1f __ STA ADDR + 0 
7458 : 8a __ __ TXA
7459 : 69 00 __ ADC #$00
745b : 85 1c __ STA ACCU + 1 
745d : 18 __ __ CLC
745e : 69 d4 __ ADC #$d4
7460 : 85 20 __ STA ADDR + 1 
7462 : a9 63 __ LDA #$63
7464 : a0 00 __ LDY #$00
7466 : 91 1b __ STA (ACCU + 0),y 
7468 : a9 0b __ LDA #$0b
746a : 91 1f __ STA (ADDR + 0),y 
746c : 38 __ __ SEC
746d : a5 1e __ LDA ACCU + 3 
746f : e9 01 __ SBC #$01
7471 : aa __ __ TAX
7472 : b0 01 __ BCS $7475 ; (draw_frame.s48 + 0)
.s47:
7474 : 88 __ __ DEY
.s48:
7475 : 0a __ __ ASL
7476 : 85 1b __ STA ACCU + 0 
7478 : 98 __ __ TYA
7479 : 2a __ __ ROL
747a : 06 1b __ ASL ACCU + 0 
747c : 2a __ __ ROL
747d : 85 1c __ STA ACCU + 1 
747f : 8a __ __ TXA
7480 : 18 __ __ CLC
7481 : 65 1b __ ADC ACCU + 0 
7483 : 85 1b __ STA ACCU + 0 
7485 : 98 __ __ TYA
7486 : 65 1c __ ADC ACCU + 1 
7488 : 06 1b __ ASL ACCU + 0 
748a : 2a __ __ ROL
748b : 06 1b __ ASL ACCU + 0 
748d : 2a __ __ ROL
748e : 06 1b __ ASL ACCU + 0 
7490 : 2a __ __ ROL
7491 : aa __ __ TAX
7492 : 18 __ __ CLC
7493 : a5 1b __ LDA ACCU + 0 
7495 : 65 1d __ ADC ACCU + 2 
7497 : a8 __ __ TAY
7498 : 8a __ __ TXA
7499 : 69 04 __ ADC #$04
749b : 85 1c __ STA ACCU + 1 
749d : a9 00 __ LDA #$00
749f : 85 1f __ STA ADDR + 0 
74a1 : 85 1b __ STA ACCU + 0 
74a3 : a2 07 __ LDX #$07
74a5 : 18 __ __ CLC
.l37:
74a6 : a9 20 __ LDA #$20
74a8 : 91 1b __ STA (ACCU + 0),y 
74aa : a5 1c __ LDA ACCU + 1 
74ac : 69 d4 __ ADC #$d4
74ae : 85 20 __ STA ADDR + 1 
74b0 : a9 00 __ LDA #$00
74b2 : 91 1f __ STA (ADDR + 0),y 
74b4 : 98 __ __ TYA
74b5 : 18 __ __ CLC
74b6 : 69 28 __ ADC #$28
74b8 : a8 __ __ TAY
74b9 : 90 03 __ BCC $74be ; (draw_frame.s42 + 0)
.s41:
74bb : e6 1c __ INC ACCU + 1 
74bd : 18 __ __ CLC
.s42:
74be : ca __ __ DEX
74bf : d0 e5 __ BNE $74a6 ; (draw_frame.l37 + 0)
.s38:
74c1 : a9 07 __ LDA #$07
74c3 : 8d f2 89 STA $89f2 ; (df_r + 0)
74c6 : 18 __ __ CLC
74c7 : a5 43 __ LDA T2 + 0 
74c9 : 69 f0 __ ADC #$f0
74cb : a4 44 __ LDY T2 + 1 
74cd : 90 02 __ BCC $74d1 ; (draw_frame.s44 + 0)
.s43:
74cf : c8 __ __ INY
74d0 : 18 __ __ CLC
.s44:
74d1 : 65 1d __ ADC ACCU + 2 
74d3 : 85 43 __ STA T2 + 0 
74d5 : 98 __ __ TYA
74d6 : 69 04 __ ADC #$04
74d8 : 85 44 __ STA T2 + 1 
74da : a9 64 __ LDA #$64
74dc : a0 00 __ LDY #$00
74de : 91 43 __ STA (T2 + 0),y 
74e0 : 18 __ __ CLC
74e1 : a5 44 __ LDA T2 + 1 
74e3 : 69 d4 __ ADC #$d4
74e5 : 85 44 __ STA T2 + 1 
74e7 : a9 0b __ LDA #$0b
74e9 : 91 43 __ STA (T2 + 0),y 
74eb : a4 1d __ LDY ACCU + 2 
74ed : b9 d8 87 LDA $87d8,y ; (scr_letter[0] + 0)
74f0 : c9 34 __ CMP #$34
74f2 : d0 0e __ BNE $7502 ; (draw_frame.s11 + 0)
.s10:
74f4 : a6 49 __ LDX T7 + 0 
74f6 : e8 __ __ INX
74f7 : 8e f0 89 STX $89f0 ; (df_x + 0)
74fa : e0 28 __ CPX #$28
74fc : b0 03 __ BCS $7501 ; (draw_frame.s3 + 0)
74fe : 4c 03 74 JMP $7403 ; (draw_frame.l7 + 0)
.s3:
7501 : 60 __ __ RTS
.s11:
7502 : 8e f2 89 STX $89f2 ; (df_r + 0)
7505 : 85 4a __ STA T8 + 0 
7507 : c9 0d __ CMP #$0d
7509 : 8a __ __ TXA
750a : 6a __ __ ROR
750b : 85 4b __ STA T9 + 0 
750d : a5 45 __ LDA T4 + 0 
750f : 85 43 __ STA T2 + 0 
.l12:
7511 : ad f2 89 LDA $89f2 ; (df_r + 0)
7514 : 85 4c __ STA T10 + 0 
7516 : a8 __ __ TAY
7517 : 18 __ __ CLC
7518 : 65 1e __ ADC ACCU + 3 
751a : aa __ __ TAX
751b : a9 00 __ LDA #$00
751d : 2a __ __ ROL
751e : 85 48 __ STA T5 + 1 
7520 : 8a __ __ TXA
7521 : 0a __ __ ASL
7522 : 85 1b __ STA ACCU + 0 
7524 : a5 48 __ LDA T5 + 1 
7526 : 2a __ __ ROL
7527 : 06 1b __ ASL ACCU + 0 
7529 : 2a __ __ ROL
752a : 85 1c __ STA ACCU + 1 
752c : 8a __ __ TXA
752d : 18 __ __ CLC
752e : 65 1b __ ADC ACCU + 0 
7530 : 85 47 __ STA T5 + 0 
7532 : a5 1c __ LDA ACCU + 1 
7534 : 65 48 __ ADC T5 + 1 
7536 : 06 47 __ ASL T5 + 0 
7538 : 2a __ __ ROL
7539 : 06 47 __ ASL T5 + 0 
753b : 2a __ __ ROL
753c : 06 47 __ ASL T5 + 0 
753e : 2a __ __ ROL
753f : aa __ __ TAX
7540 : 18 __ __ CLC
7541 : a5 47 __ LDA T5 + 0 
7543 : 65 1d __ ADC ACCU + 2 
7545 : 85 47 __ STA T5 + 0 
7547 : 90 02 __ BCC $754b ; (draw_frame.s46 + 0)
.s45:
7549 : e8 __ __ INX
754a : 18 __ __ CLC
.s46:
754b : b9 f4 7b LDA $7bf4,y ; (__multab40L + 0)
754e : a4 4a __ LDY T8 + 0 
7550 : 79 80 87 ADC $8780,y ; (letter_start[0] + 0)
7553 : 18 __ __ CLC
7554 : 65 43 __ ADC T2 + 0 
7556 : 85 45 __ STA T4 + 0 
7558 : 24 4b __ BIT T9 + 0 
755a : 30 0a __ BMI $7566 ; (draw_frame.s13 + 0)
.s34:
755c : 18 __ __ CLC
755d : 69 00 __ ADC #$00
755f : 85 1b __ STA ACCU + 0 
7561 : a9 88 __ LDA #$88
7563 : 4c ac 75 JMP $75ac ; (draw_frame.s18 + 0)
.s13:
7566 : 98 __ __ TYA
7567 : c0 1a __ CPY #$1a
7569 : b0 0b __ BCS $7576 ; (draw_frame.s14 + 0)
.s33:
756b : a9 00 __ LDA #$00
756d : 65 45 __ ADC T4 + 0 
756f : 85 1b __ STA ACCU + 0 
7571 : a9 89 __ LDA #$89
7573 : 4c ac 75 JMP $75ac ; (draw_frame.s18 + 0)
.s14:
7576 : c9 28 __ CMP #$28
7578 : b0 0b __ BCS $7585 ; (draw_frame.s15 + 0)
.s32:
757a : a9 00 __ LDA #$00
757c : 65 45 __ ADC T4 + 0 
757e : 85 1b __ STA ACCU + 0 
7580 : a9 8a __ LDA #$8a
7582 : 4c ac 75 JMP $75ac ; (draw_frame.s18 + 0)
.s15:
7585 : c9 34 __ CMP #$34
7587 : b0 0b __ BCS $7594 ; (draw_frame.s16 + 0)
.s31:
7589 : a9 00 __ LDA #$00
758b : 65 45 __ ADC T4 + 0 
758d : 85 1b __ STA ACCU + 0 
758f : a9 8b __ LDA #$8b
7591 : 4c ac 75 JMP $75ac ; (draw_frame.s18 + 0)
.s16:
7594 : c9 47 __ CMP #$47
7596 : 90 0c __ BCC $75a4 ; (draw_frame.s30 + 0)
.s17:
7598 : 18 __ __ CLC
7599 : a9 00 __ LDA #$00
759b : 65 45 __ ADC T4 + 0 
759d : 85 1b __ STA ACCU + 0 
759f : a9 8d __ LDA #$8d
75a1 : 4c ac 75 JMP $75ac ; (draw_frame.s18 + 0)
.s30:
75a4 : a9 00 __ LDA #$00
75a6 : 65 45 __ ADC T4 + 0 
75a8 : 85 1b __ STA ACCU + 0 
75aa : a9 8c __ LDA #$8c
.s18:
75ac : 69 00 __ ADC #$00
75ae : 85 1c __ STA ACCU + 1 
75b0 : 8a __ __ TXA
75b1 : 18 __ __ CLC
75b2 : 69 04 __ ADC #$04
75b4 : 85 48 __ STA T5 + 1 
75b6 : a0 00 __ LDY #$00
75b8 : b1 1b __ LDA (ACCU + 0),y 
75ba : 91 47 __ STA (T5 + 0),y 
75bc : 24 4b __ BIT T9 + 0 
75be : 30 0c __ BMI $75cc ; (draw_frame.s19 + 0)
.s29:
75c0 : 18 __ __ CLC
75c1 : a9 00 __ LDA #$00
75c3 : 65 45 __ ADC T4 + 0 
75c5 : 85 45 __ STA T4 + 0 
75c7 : a9 8e __ LDA #$8e
75c9 : 4c 13 76 JMP $7613 ; (draw_frame.s24 + 0)
.s19:
75cc : a5 4a __ LDA T8 + 0 
75ce : c9 1a __ CMP #$1a
75d0 : b0 0b __ BCS $75dd ; (draw_frame.s20 + 0)
.s28:
75d2 : a9 00 __ LDA #$00
75d4 : 65 45 __ ADC T4 + 0 
75d6 : 85 45 __ STA T4 + 0 
75d8 : a9 8f __ LDA #$8f
75da : 4c 13 76 JMP $7613 ; (draw_frame.s24 + 0)
.s20:
75dd : c9 28 __ CMP #$28
75df : b0 0b __ BCS $75ec ; (draw_frame.s21 + 0)
.s27:
75e1 : a9 00 __ LDA #$00
75e3 : 65 45 __ ADC T4 + 0 
75e5 : 85 45 __ STA T4 + 0 
75e7 : a9 90 __ LDA #$90
75e9 : 4c 13 76 JMP $7613 ; (draw_frame.s24 + 0)
.s21:
75ec : c9 34 __ CMP #$34
75ee : b0 0b __ BCS $75fb ; (draw_frame.s22 + 0)
.s26:
75f0 : a9 00 __ LDA #$00
75f2 : 65 45 __ ADC T4 + 0 
75f4 : 85 45 __ STA T4 + 0 
75f6 : a9 91 __ LDA #$91
75f8 : 4c 13 76 JMP $7613 ; (draw_frame.s24 + 0)
.s22:
75fb : c9 47 __ CMP #$47
75fd : 90 0c __ BCC $760b ; (draw_frame.s25 + 0)
.s23:
75ff : 18 __ __ CLC
7600 : a9 00 __ LDA #$00
7602 : 65 45 __ ADC T4 + 0 
7604 : 85 45 __ STA T4 + 0 
7606 : a9 93 __ LDA #$93
7608 : 4c 13 76 JMP $7613 ; (draw_frame.s24 + 0)
.s25:
760b : a9 00 __ LDA #$00
760d : 65 45 __ ADC T4 + 0 
760f : 85 45 __ STA T4 + 0 
7611 : a9 92 __ LDA #$92
.s24:
7613 : 69 00 __ ADC #$00
7615 : 85 46 __ STA T4 + 1 
7617 : 18 __ __ CLC
7618 : a5 48 __ LDA T5 + 1 
761a : 69 d4 __ ADC #$d4
761c : 85 48 __ STA T5 + 1 
761e : b1 45 __ LDA (T4 + 0),y 
7620 : 91 47 __ STA (T5 + 0),y 
7622 : a6 4c __ LDX T10 + 0 
7624 : e8 __ __ INX
7625 : 8e f2 89 STX $89f2 ; (df_r + 0)
7628 : e0 05 __ CPX #$05
762a : b0 03 __ BCS $762f ; (draw_frame.s24 + 28)
762c : 4c 11 75 JMP $7511 ; (draw_frame.l12 + 0)
762f : 4c f4 74 JMP $74f4 ; (draw_frame.s10 + 0)
--------------------------------------------------------------------
modplay_stop: ; modplay_stop()->void
; 249, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s4:
7632 : 78 __ __ SEI
7633 : a9 00 __ LDA #$00
7635 : 8d 4c 9c STA $9c4c ; (modplay.active + 0)
7638 : 8d 20 df STA $df20 
763b : 8d 40 df STA $df40 
763e : 8d 60 df STA $df60 
7641 : 8d 80 df STA $df80 
7644 : ad fe 7b LDA $7bfe ; (mod_saved_irq[0] + 0)
7647 : 8d 14 03 STA $0314 
764a : ad ff 7b LDA $7bff ; (mod_saved_irq[0] + 1)
764d : 8d 15 03 STA $0315 
7650 : a9 7f __ LDA #$7f
7652 : 8d 0d dc STA $dc0d 
7655 : a9 25 __ LDA #$25
7657 : 8d 04 dc STA $dc04 
765a : a9 4d __ LDA #$4d
765c : 8d 05 dc STA $dc05 
765f : a9 81 __ LDA #$81
7661 : 8d 0d dc STA $dc0d 
7664 : a9 01 __ LDA #$01
7666 : 8d 0e dc STA $dc0e 
7669 : 58 __ __ CLI
.s3:
766a : 60 __ __ RTS
--------------------------------------------------------------------
766b : __ __ __ BYT 65 4e 44 20 4f 46 20 64 45 4d 4f 20 73 45 51 55 : eND OF dEMO sEQU
767b : __ __ __ BYT 45 4e 43 45 00                                  : ENCE.
--------------------------------------------------------------------
7680 : __ __ __ BYT 64 45 4d 4f 20 53 45 51 55 45 4e 43 45 20 43 4f : dEMO SEQUENCE CO
7690 : __ __ __ BYT 4d 50 4c 45 54 45 2e 00                         : MPLETE..
--------------------------------------------------------------------
7698 : __ __ __ BYT 67 45 41 52 20 00                               : gEAR .
--------------------------------------------------------------------
769e : __ __ __ BYT 31 20 54 4f 20 36 34 20 6d 68 5a 2c 20 31 36 20 : 1 TO 64 mhZ, 16 
76ae : __ __ __ BYT 53 54 45 50 53 00                               : STEPS.
--------------------------------------------------------------------
76b4 : __ __ __ BYT 66 52 41 43 54 00                               : fRACT.
--------------------------------------------------------------------
76ba : __ __ __ BYT 6d 41 4e 44 45 4c 42 52 4f 54 20 6d 63 20 46 52 : mANDELBROT mc FR
76ca : __ __ __ BYT 41 43 54 41 4c 00                               : ACTAL.
--------------------------------------------------------------------
76d0 : __ __ __ BYT 62 41 4c 4c 20 00                               : bALL .
--------------------------------------------------------------------
76d6 : __ __ __ BYT 33 64 20 42 41 4c 4c 20 2b 20 47 52 49 44 00    : 3d BALL + GRID.
--------------------------------------------------------------------
76e5 : __ __ __ BYT 76 45 43 54 20 00                               : vECT .
--------------------------------------------------------------------
76eb : __ __ __ BYT 33 64 20 57 49 52 45 46 52 41 4d 45 20 43 55 42 : 3d WIREFRAME CUB
76fb : __ __ __ BYT 45 00                                           : E.
--------------------------------------------------------------------
_uii_root:
76fd : __ __ __ BYT 2f 00                                           : /.
--------------------------------------------------------------------
insert_col:
76ff : __ __ __ BSS	1
--------------------------------------------------------------------
7700 : __ __ __ BYT 70 4c 41 53 20 00                               : pLAS .
--------------------------------------------------------------------
7706 : __ __ __ BYT 70 4c 41 53 4d 41 20 49 4e 54 45 52 46 45 52 45 : pLASMA INTERFERE
7716 : __ __ __ BYT 4e 43 45 00                                     : NCE.
--------------------------------------------------------------------
771a : __ __ __ BYT 74 55 4e 4c 20 00                               : tUNL .
--------------------------------------------------------------------
7720 : __ __ __ BYT 33 64 20 54 45 58 54 55 52 45 20 54 55 4e 4e 45 : 3d TEXTURE TUNNE
7730 : __ __ __ BYT 4c 00                                           : L.
--------------------------------------------------------------------
7732 : __ __ __ BYT 73 43 52 4c 20 00                               : sCRL .
--------------------------------------------------------------------
7738 : __ __ __ BYT 70 65 74 73 63 69 69 20 46 4f 4e 54 20 53 43 52 : petscii FONT SCR
7748 : __ __ __ BYT 4f 4c 4c 45 52 00                               : OLLER.
--------------------------------------------------------------------
774e : __ __ __ BYT 34 45 56 2e 4d 4f 44 3a 20 46 4f 52 45 56 45 52 : 4EV.MOD: FOREVER
775e : __ __ __ BYT 20 59 4f 55 4e 47 00                            :  YOUNG.
--------------------------------------------------------------------
7765 : __ __ __ BYT 75 4c 54 49 4d 41 54 45 20 36 34 20 41 54 20 36 : uLTIMATE 64 AT 6
7775 : __ __ __ BYT 34 20 6d 68 5a 20 54 55 52 42 4f 3a 00          : 4 mhZ TURBO:.
--------------------------------------------------------------------
7782 : __ __ __ BYT 54 48 45 20 46 41 53 54 45 53 54 20 63 36 34 20 : THE FASTEST c64 
7792 : __ __ __ BYT 43 4f 4d 50 41 54 49 42 4c 45 2e 00             : COMPATIBLE..
--------------------------------------------------------------------
mul16by8: ; mul16by8
779e : 4a __ __ LSR
779f : f0 2e __ BEQ $77cf ; (mul16by8 + 49)
77a1 : a2 00 __ LDX #$00
77a3 : a0 00 __ LDY #$00
77a5 : 90 13 __ BCC $77ba ; (mul16by8 + 28)
77a7 : a4 1b __ LDY ACCU + 0 
77a9 : a6 1c __ LDX ACCU + 1 
77ab : b0 0d __ BCS $77ba ; (mul16by8 + 28)
77ad : 85 02 __ STA $02 
77af : 18 __ __ CLC
77b0 : 98 __ __ TYA
77b1 : 65 1b __ ADC ACCU + 0 
77b3 : a8 __ __ TAY
77b4 : 8a __ __ TXA
77b5 : 65 1c __ ADC ACCU + 1 
77b7 : aa __ __ TAX
77b8 : a5 02 __ LDA $02 
77ba : 06 1b __ ASL ACCU + 0 
77bc : 26 1c __ ROL ACCU + 1 
77be : 4a __ __ LSR
77bf : 90 f9 __ BCC $77ba ; (mul16by8 + 28)
77c1 : d0 ea __ BNE $77ad ; (mul16by8 + 15)
77c3 : 18 __ __ CLC
77c4 : 98 __ __ TYA
77c5 : 65 1b __ ADC ACCU + 0 
77c7 : 85 1b __ STA ACCU + 0 
77c9 : 8a __ __ TXA
77ca : 65 1c __ ADC ACCU + 1 
77cc : 85 1c __ STA ACCU + 1 
77ce : 60 __ __ RTS
77cf : b0 04 __ BCS $77d5 ; (mul16by8 + 55)
77d1 : 85 1b __ STA ACCU + 0 
77d3 : 85 1c __ STA ACCU + 1 
77d5 : 60 __ __ RTS
--------------------------------------------------------------------
mul32by8: ; mul32by8
77d6 : a0 00 __ LDY #$00
77d8 : 84 07 __ STY WORK + 4 
77da : 84 08 __ STY WORK + 5 
77dc : 84 09 __ STY WORK + 6 
77de : 4a __ __ LSR
77df : b0 0d __ BCS $77ee ; (mul32by8 + 24)
77e1 : f0 26 __ BEQ $7809 ; (mul32by8 + 51)
77e3 : 06 1b __ ASL ACCU + 0 
77e5 : 26 1c __ ROL ACCU + 1 
77e7 : 26 1d __ ROL ACCU + 2 
77e9 : 26 1e __ ROL ACCU + 3 
77eb : 4a __ __ LSR
77ec : 90 f5 __ BCC $77e3 ; (mul32by8 + 13)
77ee : aa __ __ TAX
77ef : 18 __ __ CLC
77f0 : a5 07 __ LDA WORK + 4 
77f2 : 65 1b __ ADC ACCU + 0 
77f4 : 85 07 __ STA WORK + 4 
77f6 : a5 08 __ LDA WORK + 5 
77f8 : 65 1c __ ADC ACCU + 1 
77fa : 85 08 __ STA WORK + 5 
77fc : a5 09 __ LDA WORK + 6 
77fe : 65 1d __ ADC ACCU + 2 
7800 : 85 09 __ STA WORK + 6 
7802 : 98 __ __ TYA
7803 : 65 1e __ ADC ACCU + 3 
7805 : a8 __ __ TAY
7806 : 8a __ __ TXA
7807 : d0 da __ BNE $77e3 ; (mul32by8 + 13)
7809 : 84 0a __ STY WORK + 7 
780b : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
780c : a0 00 __ LDY #$00
780e : 84 06 __ STY WORK + 3 
7810 : a5 03 __ LDA WORK + 0 
7812 : a6 04 __ LDX WORK + 1 
7814 : f0 1c __ BEQ $7832 ; (mul16 + 38)
7816 : 38 __ __ SEC
7817 : 6a __ __ ROR
7818 : 90 0d __ BCC $7827 ; (mul16 + 27)
781a : aa __ __ TAX
781b : 18 __ __ CLC
781c : 98 __ __ TYA
781d : 65 1b __ ADC ACCU + 0 
781f : a8 __ __ TAY
7820 : a5 06 __ LDA WORK + 3 
7822 : 65 1c __ ADC ACCU + 1 
7824 : 85 06 __ STA WORK + 3 
7826 : 8a __ __ TXA
7827 : 06 1b __ ASL ACCU + 0 
7829 : 26 1c __ ROL ACCU + 1 
782b : 4a __ __ LSR
782c : 90 f9 __ BCC $7827 ; (mul16 + 27)
782e : d0 ea __ BNE $781a ; (mul16 + 14)
7830 : a5 04 __ LDA WORK + 1 
7832 : 4a __ __ LSR
7833 : 90 0d __ BCC $7842 ; (mul16 + 54)
7835 : aa __ __ TAX
7836 : 18 __ __ CLC
7837 : 98 __ __ TYA
7838 : 65 1b __ ADC ACCU + 0 
783a : a8 __ __ TAY
783b : a5 06 __ LDA WORK + 3 
783d : 65 1c __ ADC ACCU + 1 
783f : 85 06 __ STA WORK + 3 
7841 : 8a __ __ TXA
7842 : 06 1b __ ASL ACCU + 0 
7844 : 26 1c __ ROL ACCU + 1 
7846 : 4a __ __ LSR
7847 : b0 ec __ BCS $7835 ; (mul16 + 41)
7849 : d0 f7 __ BNE $7842 ; (mul16 + 54)
784b : 84 05 __ STY WORK + 2 
784d : 60 __ __ RTS
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
784e : a9 7f __ LDA #$7f
7850 : 85 03 __ STA WORK + 0 
--------------------------------------------------------------------
divs16: ; divs16
7852 : 24 1c __ BIT ACCU + 1 
7854 : 10 0d __ BPL $7863 ; (divs16 + 17)
7856 : 20 6d 78 JSR $786d ; (negaccu + 0)
7859 : 24 04 __ BIT WORK + 1 
785b : 10 0d __ BPL $786a ; (divs16 + 24)
785d : 20 7b 78 JSR $787b ; (negtmp + 0)
7860 : 4c 8d 78 JMP $788d ; (divmod + 0)
7863 : 24 04 __ BIT WORK + 1 
7865 : 10 f9 __ BPL $7860 ; (divs16 + 14)
7867 : 20 7b 78 JSR $787b ; (negtmp + 0)
786a : 20 8d 78 JSR $788d ; (divmod + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
786d : 38 __ __ SEC
786e : a9 00 __ LDA #$00
7870 : e5 1b __ SBC ACCU + 0 
7872 : 85 1b __ STA ACCU + 0 
7874 : a9 00 __ LDA #$00
7876 : e5 1c __ SBC ACCU + 1 
7878 : 85 1c __ STA ACCU + 1 
787a : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
787b : 38 __ __ SEC
787c : a9 00 __ LDA #$00
787e : e5 03 __ SBC WORK + 0 
7880 : 85 03 __ STA WORK + 0 
7882 : a9 00 __ LDA #$00
7884 : e5 04 __ SBC WORK + 1 
7886 : 85 04 __ STA WORK + 1 
7888 : 60 __ __ RTS
--------------------------------------------------------------------
divmod@proxy: ; divmod@proxy
7889 : a9 00 __ LDA #$00
788b : 85 04 __ STA WORK + 1 
--------------------------------------------------------------------
divmod: ; divmod
788d : a5 1c __ LDA ACCU + 1 
788f : d0 31 __ BNE $78c2 ; (divmod + 53)
7891 : a5 04 __ LDA WORK + 1 
7893 : d0 1e __ BNE $78b3 ; (divmod + 38)
7895 : 85 06 __ STA WORK + 3 
7897 : a2 04 __ LDX #$04
7899 : 06 1b __ ASL ACCU + 0 
789b : 2a __ __ ROL
789c : c5 03 __ CMP WORK + 0 
789e : 90 02 __ BCC $78a2 ; (divmod + 21)
78a0 : e5 03 __ SBC WORK + 0 
78a2 : 26 1b __ ROL ACCU + 0 
78a4 : 2a __ __ ROL
78a5 : c5 03 __ CMP WORK + 0 
78a7 : 90 02 __ BCC $78ab ; (divmod + 30)
78a9 : e5 03 __ SBC WORK + 0 
78ab : 26 1b __ ROL ACCU + 0 
78ad : ca __ __ DEX
78ae : d0 eb __ BNE $789b ; (divmod + 14)
78b0 : 85 05 __ STA WORK + 2 
78b2 : 60 __ __ RTS
78b3 : a5 1b __ LDA ACCU + 0 
78b5 : 85 05 __ STA WORK + 2 
78b7 : a5 1c __ LDA ACCU + 1 
78b9 : 85 06 __ STA WORK + 3 
78bb : a9 00 __ LDA #$00
78bd : 85 1b __ STA ACCU + 0 
78bf : 85 1c __ STA ACCU + 1 
78c1 : 60 __ __ RTS
78c2 : a5 04 __ LDA WORK + 1 
78c4 : d0 1f __ BNE $78e5 ; (divmod + 88)
78c6 : a5 03 __ LDA WORK + 0 
78c8 : 30 1b __ BMI $78e5 ; (divmod + 88)
78ca : a9 00 __ LDA #$00
78cc : 85 06 __ STA WORK + 3 
78ce : a2 10 __ LDX #$10
78d0 : 06 1b __ ASL ACCU + 0 
78d2 : 26 1c __ ROL ACCU + 1 
78d4 : 2a __ __ ROL
78d5 : c5 03 __ CMP WORK + 0 
78d7 : 90 02 __ BCC $78db ; (divmod + 78)
78d9 : e5 03 __ SBC WORK + 0 
78db : 26 1b __ ROL ACCU + 0 
78dd : 26 1c __ ROL ACCU + 1 
78df : ca __ __ DEX
78e0 : d0 f2 __ BNE $78d4 ; (divmod + 71)
78e2 : 85 05 __ STA WORK + 2 
78e4 : 60 __ __ RTS
78e5 : a9 00 __ LDA #$00
78e7 : 85 05 __ STA WORK + 2 
78e9 : 85 06 __ STA WORK + 3 
78eb : 84 02 __ STY $02 
78ed : a0 10 __ LDY #$10
78ef : 18 __ __ CLC
78f0 : 26 1b __ ROL ACCU + 0 
78f2 : 26 1c __ ROL ACCU + 1 
78f4 : 26 05 __ ROL WORK + 2 
78f6 : 26 06 __ ROL WORK + 3 
78f8 : 38 __ __ SEC
78f9 : a5 05 __ LDA WORK + 2 
78fb : e5 03 __ SBC WORK + 0 
78fd : aa __ __ TAX
78fe : a5 06 __ LDA WORK + 3 
7900 : e5 04 __ SBC WORK + 1 
7902 : 90 04 __ BCC $7908 ; (divmod + 123)
7904 : 86 05 __ STX WORK + 2 
7906 : 85 06 __ STA WORK + 3 
7908 : 88 __ __ DEY
7909 : d0 e5 __ BNE $78f0 ; (divmod + 99)
790b : 26 1b __ ROL ACCU + 0 
790d : 26 1c __ ROL ACCU + 1 
790f : a4 02 __ LDY $02 
7911 : 60 __ __ RTS
--------------------------------------------------------------------
mul32: ; mul32
7912 : a5 04 __ LDA WORK + 1 
7914 : 05 05 __ ORA WORK + 2 
7916 : 05 06 __ ORA WORK + 3 
7918 : d0 05 __ BNE $791f ; (mul32 + 13)
791a : a5 03 __ LDA WORK + 0 
791c : 4c d6 77 JMP $77d6 ; (mul32by8 + 0)
791f : a0 00 __ LDY #$00
7921 : 84 07 __ STY WORK + 4 
7923 : 84 08 __ STY WORK + 5 
7925 : 98 __ __ TYA
7926 : 38 __ __ SEC
7927 : 66 03 __ ROR WORK + 0 
7929 : 90 15 __ BCC $7940 ; (mul32 + 46)
792b : aa __ __ TAX
792c : 18 __ __ CLC
792d : a5 07 __ LDA WORK + 4 
792f : 65 1b __ ADC ACCU + 0 
7931 : 85 07 __ STA WORK + 4 
7933 : a5 08 __ LDA WORK + 5 
7935 : 65 1c __ ADC ACCU + 1 
7937 : 85 08 __ STA WORK + 5 
7939 : 98 __ __ TYA
793a : 65 1d __ ADC ACCU + 2 
793c : a8 __ __ TAY
793d : 8a __ __ TXA
793e : 65 1e __ ADC ACCU + 3 
7940 : 46 04 __ LSR WORK + 1 
7942 : 90 0f __ BCC $7953 ; (mul32 + 65)
7944 : aa __ __ TAX
7945 : 18 __ __ CLC
7946 : a5 08 __ LDA WORK + 5 
7948 : 65 1b __ ADC ACCU + 0 
794a : 85 08 __ STA WORK + 5 
794c : 98 __ __ TYA
794d : 65 1c __ ADC ACCU + 1 
794f : a8 __ __ TAY
7950 : 8a __ __ TXA
7951 : 65 1d __ ADC ACCU + 2 
7953 : 46 05 __ LSR WORK + 2 
7955 : 90 09 __ BCC $7960 ; (mul32 + 78)
7957 : aa __ __ TAX
7958 : 18 __ __ CLC
7959 : 98 __ __ TYA
795a : 65 1b __ ADC ACCU + 0 
795c : a8 __ __ TAY
795d : 8a __ __ TXA
795e : 65 1c __ ADC ACCU + 1 
7960 : 46 06 __ LSR WORK + 3 
7962 : 90 03 __ BCC $7967 ; (mul32 + 85)
7964 : 18 __ __ CLC
7965 : 65 1b __ ADC ACCU + 0 
7967 : 06 1b __ ASL ACCU + 0 
7969 : 26 1c __ ROL ACCU + 1 
796b : 26 1d __ ROL ACCU + 2 
796d : 26 1e __ ROL ACCU + 3 
796f : 46 03 __ LSR WORK + 0 
7971 : 90 cd __ BCC $7940 ; (mul32 + 46)
7973 : d0 b6 __ BNE $792b ; (mul32 + 25)
7975 : 84 09 __ STY WORK + 6 
7977 : 85 0a __ STA WORK + 7 
7979 : 60 __ __ RTS
--------------------------------------------------------------------
divs32: ; divs32
797a : 24 1e __ BIT ACCU + 3 
797c : 10 0d __ BPL $798b ; (divs32 + 17)
797e : 20 95 79 JSR $7995 ; (negaccu32 + 0)
7981 : 24 06 __ BIT WORK + 3 
7983 : 10 0d __ BPL $7992 ; (divs32 + 24)
7985 : 20 af 79 JSR $79af ; (negtmp32 + 0)
7988 : 4c 58 42 JMP $4258 ; (divmod32 + 0)
798b : 24 06 __ BIT WORK + 3 
798d : 10 f9 __ BPL $7988 ; (divs32 + 14)
798f : 20 af 79 JSR $79af ; (negtmp32 + 0)
7992 : 20 58 42 JSR $4258 ; (divmod32 + 0)
--------------------------------------------------------------------
negaccu32: ; negaccu32
7995 : 38 __ __ SEC
7996 : a9 00 __ LDA #$00
7998 : e5 1b __ SBC ACCU + 0 
799a : 85 1b __ STA ACCU + 0 
799c : a9 00 __ LDA #$00
799e : e5 1c __ SBC ACCU + 1 
79a0 : 85 1c __ STA ACCU + 1 
79a2 : a9 00 __ LDA #$00
79a4 : e5 1d __ SBC ACCU + 2 
79a6 : 85 1d __ STA ACCU + 2 
79a8 : a9 00 __ LDA #$00
79aa : e5 1e __ SBC ACCU + 3 
79ac : 85 1e __ STA ACCU + 3 
79ae : 60 __ __ RTS
--------------------------------------------------------------------
negtmp32: ; negtmp32
79af : 38 __ __ SEC
79b0 : a9 00 __ LDA #$00
79b2 : e5 03 __ SBC WORK + 0 
79b4 : 85 03 __ STA WORK + 0 
79b6 : a9 00 __ LDA #$00
79b8 : e5 04 __ SBC WORK + 1 
79ba : 85 04 __ STA WORK + 1 
79bc : a9 00 __ LDA #$00
79be : e5 05 __ SBC WORK + 2 
79c0 : 85 05 __ STA WORK + 2 
79c2 : a9 00 __ LDA #$00
79c4 : e5 06 __ SBC WORK + 3 
79c6 : 85 06 __ STA WORK + 3 
79c8 : 60 __ __ RTS
--------------------------------------------------------------------
crt_malloc: ; crt_malloc
79c9 : 18 __ __ CLC
79ca : a5 1b __ LDA ACCU + 0 
79cc : 69 0d __ ADC #$0d
79ce : 29 fc __ AND #$fc
79d0 : 85 03 __ STA WORK + 0 
79d2 : a5 1c __ LDA ACCU + 1 
79d4 : 69 00 __ ADC #$00
79d6 : 85 04 __ STA WORK + 1 
79d8 : ad f5 89 LDA $89f5 ; (HeapNode.end + 0)
79db : d0 26 __ BNE $7a03 ; (crt_malloc + 58)
79dd : a9 00 __ LDA #$00
79df : 8d a2 a7 STA $a7a2 
79e2 : 8d a3 a7 STA $a7a3 
79e5 : ee f5 89 INC $89f5 ; (HeapNode.end + 0)
79e8 : a9 a0 __ LDA #$a0
79ea : 09 02 __ ORA #$02
79ec : 8d f3 89 STA $89f3 ; (HeapNode.next + 0)
79ef : a9 a7 __ LDA #$a7
79f1 : 8d f4 89 STA $89f4 ; (HeapNode.next + 1)
79f4 : 38 __ __ SEC
79f5 : a9 00 __ LDA #$00
79f7 : e9 02 __ SBC #$02
79f9 : 8d a4 a7 STA $a7a4 
79fc : a9 b0 __ LDA #$b0
79fe : e9 00 __ SBC #$00
7a00 : 8d a5 a7 STA $a7a5 
7a03 : a9 f3 __ LDA #$f3
7a05 : a2 89 __ LDX #$89
7a07 : 85 1d __ STA ACCU + 2 
7a09 : 86 1e __ STX ACCU + 3 
7a0b : 18 __ __ CLC
7a0c : a0 00 __ LDY #$00
7a0e : b1 1d __ LDA (ACCU + 2),y 
7a10 : 85 1b __ STA ACCU + 0 
7a12 : 65 03 __ ADC WORK + 0 
7a14 : 85 05 __ STA WORK + 2 
7a16 : c8 __ __ INY
7a17 : b1 1d __ LDA (ACCU + 2),y 
7a19 : 85 1c __ STA ACCU + 1 
7a1b : f0 20 __ BEQ $7a3d ; (crt_malloc + 116)
7a1d : 65 04 __ ADC WORK + 1 
7a1f : 85 06 __ STA WORK + 3 
7a21 : b0 14 __ BCS $7a37 ; (crt_malloc + 110)
7a23 : a0 02 __ LDY #$02
7a25 : b1 1b __ LDA (ACCU + 0),y 
7a27 : c5 05 __ CMP WORK + 2 
7a29 : c8 __ __ INY
7a2a : b1 1b __ LDA (ACCU + 0),y 
7a2c : e5 06 __ SBC WORK + 3 
7a2e : b0 0f __ BCS $7a3f ; (crt_malloc + 118)
7a30 : a5 1b __ LDA ACCU + 0 
7a32 : a6 1c __ LDX ACCU + 1 
7a34 : 4c 07 7a JMP $7a07 ; (crt_malloc + 62)
7a37 : a9 00 __ LDA #$00
7a39 : 85 1b __ STA ACCU + 0 
7a3b : 85 1c __ STA ACCU + 1 
7a3d : 02 __ __ INV
7a3e : 60 __ __ RTS
7a3f : a5 05 __ LDA WORK + 2 
7a41 : 85 07 __ STA WORK + 4 
7a43 : a5 06 __ LDA WORK + 3 
7a45 : 85 08 __ STA WORK + 5 
7a47 : a0 02 __ LDY #$02
7a49 : a5 07 __ LDA WORK + 4 
7a4b : d1 1b __ CMP (ACCU + 0),y 
7a4d : d0 15 __ BNE $7a64 ; (crt_malloc + 155)
7a4f : c8 __ __ INY
7a50 : a5 08 __ LDA WORK + 5 
7a52 : d1 1b __ CMP (ACCU + 0),y 
7a54 : d0 0e __ BNE $7a64 ; (crt_malloc + 155)
7a56 : a0 00 __ LDY #$00
7a58 : b1 1b __ LDA (ACCU + 0),y 
7a5a : 91 1d __ STA (ACCU + 2),y 
7a5c : c8 __ __ INY
7a5d : b1 1b __ LDA (ACCU + 0),y 
7a5f : 91 1d __ STA (ACCU + 2),y 
7a61 : 4c 81 7a JMP $7a81 ; (crt_malloc + 184)
7a64 : a0 00 __ LDY #$00
7a66 : b1 1b __ LDA (ACCU + 0),y 
7a68 : 91 07 __ STA (WORK + 4),y 
7a6a : a5 07 __ LDA WORK + 4 
7a6c : 91 1d __ STA (ACCU + 2),y 
7a6e : c8 __ __ INY
7a6f : b1 1b __ LDA (ACCU + 0),y 
7a71 : 91 07 __ STA (WORK + 4),y 
7a73 : a5 08 __ LDA WORK + 5 
7a75 : 91 1d __ STA (ACCU + 2),y 
7a77 : c8 __ __ INY
7a78 : b1 1b __ LDA (ACCU + 0),y 
7a7a : 91 07 __ STA (WORK + 4),y 
7a7c : c8 __ __ INY
7a7d : b1 1b __ LDA (ACCU + 0),y 
7a7f : 91 07 __ STA (WORK + 4),y 
7a81 : a0 00 __ LDY #$00
7a83 : a5 05 __ LDA WORK + 2 
7a85 : 91 1b __ STA (ACCU + 0),y 
7a87 : c8 __ __ INY
7a88 : a5 06 __ LDA WORK + 3 
7a8a : 91 1b __ STA (ACCU + 0),y 
7a8c : a0 02 __ LDY #$02
7a8e : a9 bd __ LDA #$bd
7a90 : 91 1b __ STA (ACCU + 0),y 
7a92 : c8 __ __ INY
7a93 : 91 1b __ STA (ACCU + 0),y 
7a95 : c8 __ __ INY
7a96 : 91 1b __ STA (ACCU + 0),y 
7a98 : c8 __ __ INY
7a99 : 91 1b __ STA (ACCU + 0),y 
7a9b : 38 __ __ SEC
7a9c : a5 05 __ LDA WORK + 2 
7a9e : e9 04 __ SBC #$04
7aa0 : 85 05 __ STA WORK + 2 
7aa2 : b0 02 __ BCS $7aa6 ; (crt_malloc + 221)
7aa4 : c6 06 __ DEC WORK + 3 
7aa6 : a9 be __ LDA #$be
7aa8 : a0 00 __ LDY #$00
7aaa : 91 05 __ STA (WORK + 2),y 
7aac : c8 __ __ INY
7aad : 91 05 __ STA (WORK + 2),y 
7aaf : c8 __ __ INY
7ab0 : 91 05 __ STA (WORK + 2),y 
7ab2 : c8 __ __ INY
7ab3 : 91 05 __ STA (WORK + 2),y 
7ab5 : 18 __ __ CLC
7ab6 : a5 1b __ LDA ACCU + 0 
7ab8 : 69 06 __ ADC #$06
7aba : 85 1b __ STA ACCU + 0 
7abc : 90 02 __ BCC $7ac0 ; (crt_malloc + 247)
7abe : e6 1c __ INC ACCU + 1 
7ac0 : 60 __ __ RTS
--------------------------------------------------------------------
crt_free@proxy: ; crt_free@proxy
7ac1 : a5 0d __ LDA P0 
7ac3 : 85 1b __ STA ACCU + 0 
7ac5 : a5 0e __ LDA P1 
7ac7 : 85 1c __ STA ACCU + 1 
--------------------------------------------------------------------
crt_free: ; crt_free
7ac9 : a5 1b __ LDA ACCU + 0 
7acb : 05 1c __ ORA ACCU + 1 
7acd : d0 01 __ BNE $7ad0 ; (crt_free + 7)
7acf : 60 __ __ RTS
7ad0 : 38 __ __ SEC
7ad1 : a5 1b __ LDA ACCU + 0 
7ad3 : 29 03 __ AND #$03
7ad5 : d0 56 __ BNE $7b2d ; (crt_free + 100)
7ad7 : a5 1b __ LDA ACCU + 0 
7ad9 : e9 06 __ SBC #$06
7adb : 85 1b __ STA ACCU + 0 
7add : b0 02 __ BCS $7ae1 ; (crt_free + 24)
7adf : c6 1c __ DEC ACCU + 1 
7ae1 : a0 02 __ LDY #$02
7ae3 : a9 bd __ LDA #$bd
7ae5 : d1 1b __ CMP (ACCU + 0),y 
7ae7 : d0 44 __ BNE $7b2d ; (crt_free + 100)
7ae9 : c8 __ __ INY
7aea : d1 1b __ CMP (ACCU + 0),y 
7aec : d0 3f __ BNE $7b2d ; (crt_free + 100)
7aee : c8 __ __ INY
7aef : d1 1b __ CMP (ACCU + 0),y 
7af1 : d0 3a __ BNE $7b2d ; (crt_free + 100)
7af3 : c8 __ __ INY
7af4 : d1 1b __ CMP (ACCU + 0),y 
7af6 : d0 35 __ BNE $7b2d ; (crt_free + 100)
7af8 : a0 00 __ LDY #$00
7afa : 38 __ __ SEC
7afb : b1 1b __ LDA (ACCU + 0),y 
7afd : e9 04 __ SBC #$04
7aff : 85 03 __ STA WORK + 0 
7b01 : c8 __ __ INY
7b02 : b1 1b __ LDA (ACCU + 0),y 
7b04 : e9 00 __ SBC #$00
7b06 : 85 04 __ STA WORK + 1 
7b08 : a0 00 __ LDY #$00
7b0a : a9 be __ LDA #$be
7b0c : d1 03 __ CMP (WORK + 0),y 
7b0e : d0 1d __ BNE $7b2d ; (crt_free + 100)
7b10 : c8 __ __ INY
7b11 : d1 03 __ CMP (WORK + 0),y 
7b13 : d0 18 __ BNE $7b2d ; (crt_free + 100)
7b15 : c8 __ __ INY
7b16 : d1 03 __ CMP (WORK + 0),y 
7b18 : d0 13 __ BNE $7b2d ; (crt_free + 100)
7b1a : c8 __ __ INY
7b1b : d1 03 __ CMP (WORK + 0),y 
7b1d : d0 0e __ BNE $7b2d ; (crt_free + 100)
7b1f : a5 1c __ LDA ACCU + 1 
7b21 : a6 1b __ LDX ACCU + 0 
7b23 : c9 a7 __ CMP #$a7
7b25 : 90 06 __ BCC $7b2d ; (crt_free + 100)
7b27 : d0 05 __ BNE $7b2e ; (crt_free + 101)
7b29 : e0 a0 __ CPX #$a0
7b2b : b0 01 __ BCS $7b2e ; (crt_free + 101)
7b2d : 02 __ __ INV
7b2e : c9 b0 __ CMP #$b0
7b30 : 90 06 __ BCC $7b38 ; (crt_free + 111)
7b32 : d0 f9 __ BNE $7b2d ; (crt_free + 100)
7b34 : e0 00 __ CPX #$00
7b36 : b0 f5 __ BCS $7b2d ; (crt_free + 100)
7b38 : a0 02 __ LDY #$02
7b3a : a9 bf __ LDA #$bf
7b3c : 91 1b __ STA (ACCU + 0),y 
7b3e : c8 __ __ INY
7b3f : 91 1b __ STA (ACCU + 0),y 
7b41 : a0 00 __ LDY #$00
7b43 : b1 1b __ LDA (ACCU + 0),y 
7b45 : 85 1d __ STA ACCU + 2 
7b47 : c8 __ __ INY
7b48 : b1 1b __ LDA (ACCU + 0),y 
7b4a : 85 1e __ STA ACCU + 3 
7b4c : a9 f3 __ LDA #$f3
7b4e : a2 89 __ LDX #$89
7b50 : 85 05 __ STA WORK + 2 
7b52 : 86 06 __ STX WORK + 3 
7b54 : a0 01 __ LDY #$01
7b56 : b1 05 __ LDA (WORK + 2),y 
7b58 : f0 28 __ BEQ $7b82 ; (crt_free + 185)
7b5a : aa __ __ TAX
7b5b : 88 __ __ DEY
7b5c : b1 05 __ LDA (WORK + 2),y 
7b5e : e4 1e __ CPX ACCU + 3 
7b60 : 90 ee __ BCC $7b50 ; (crt_free + 135)
7b62 : d0 1e __ BNE $7b82 ; (crt_free + 185)
7b64 : c5 1d __ CMP ACCU + 2 
7b66 : 90 e8 __ BCC $7b50 ; (crt_free + 135)
7b68 : d0 18 __ BNE $7b82 ; (crt_free + 185)
7b6a : a0 00 __ LDY #$00
7b6c : b1 1d __ LDA (ACCU + 2),y 
7b6e : 91 1b __ STA (ACCU + 0),y 
7b70 : c8 __ __ INY
7b71 : b1 1d __ LDA (ACCU + 2),y 
7b73 : 91 1b __ STA (ACCU + 0),y 
7b75 : c8 __ __ INY
7b76 : b1 1d __ LDA (ACCU + 2),y 
7b78 : 91 1b __ STA (ACCU + 0),y 
7b7a : c8 __ __ INY
7b7b : b1 1d __ LDA (ACCU + 2),y 
7b7d : 91 1b __ STA (ACCU + 0),y 
7b7f : 4c 97 7b JMP $7b97 ; (crt_free + 206)
7b82 : a0 00 __ LDY #$00
7b84 : b1 05 __ LDA (WORK + 2),y 
7b86 : 91 1b __ STA (ACCU + 0),y 
7b88 : c8 __ __ INY
7b89 : b1 05 __ LDA (WORK + 2),y 
7b8b : 91 1b __ STA (ACCU + 0),y 
7b8d : c8 __ __ INY
7b8e : a5 1d __ LDA ACCU + 2 
7b90 : 91 1b __ STA (ACCU + 0),y 
7b92 : c8 __ __ INY
7b93 : a5 1e __ LDA ACCU + 3 
7b95 : 91 1b __ STA (ACCU + 0),y 
7b97 : a0 02 __ LDY #$02
7b99 : b1 05 __ LDA (WORK + 2),y 
7b9b : c5 1b __ CMP ACCU + 0 
7b9d : d0 1d __ BNE $7bbc ; (crt_free + 243)
7b9f : c8 __ __ INY
7ba0 : b1 05 __ LDA (WORK + 2),y 
7ba2 : c5 1c __ CMP ACCU + 1 
7ba4 : d0 16 __ BNE $7bbc ; (crt_free + 243)
7ba6 : a0 00 __ LDY #$00
7ba8 : b1 1b __ LDA (ACCU + 0),y 
7baa : 91 05 __ STA (WORK + 2),y 
7bac : c8 __ __ INY
7bad : b1 1b __ LDA (ACCU + 0),y 
7baf : 91 05 __ STA (WORK + 2),y 
7bb1 : c8 __ __ INY
7bb2 : b1 1b __ LDA (ACCU + 0),y 
7bb4 : 91 05 __ STA (WORK + 2),y 
7bb6 : c8 __ __ INY
7bb7 : b1 1b __ LDA (ACCU + 0),y 
7bb9 : 91 05 __ STA (WORK + 2),y 
7bbb : 60 __ __ RTS
7bbc : a0 00 __ LDY #$00
7bbe : a5 1b __ LDA ACCU + 0 
7bc0 : 91 05 __ STA (WORK + 2),y 
7bc2 : c8 __ __ INY
7bc3 : a5 1c __ LDA ACCU + 1 
7bc5 : 91 05 __ STA (WORK + 2),y 
7bc7 : 60 __ __ RTS
--------------------------------------------------------------------
__multab16L:
7bc8 : __ __ __ BYT 00 10 20 30 40                                  : .. 0@
--------------------------------------------------------------------
__multab50L:
7bcd : __ __ __ BYT 00 32 64 96                                     : .2d.
--------------------------------------------------------------------
__multab7L:
7bd1 : __ __ __ BYT 00 07 0e 15 1c 23 2a 31 38 3f 46 4d 54          : .....#*18?FMT
--------------------------------------------------------------------
__shrtab192L:
7bde : __ __ __ BYT c0 60 30 18 0c 06 03                            : .`0....
--------------------------------------------------------------------
__multab12L:
7be5 : __ __ __ BYT 00 0c 18 24                                     : ...$
--------------------------------------------------------------------
__multab3L:
7be9 : __ __ __ BYT 00 03 06 09                                     : ....
--------------------------------------------------------------------
__shltab3L:
7bed : __ __ __ BYT 03 06 0c 18 30 60 c0                            : ....0`.
--------------------------------------------------------------------
__multab40L:
7bf4 : __ __ __ BYT 00 28 50 78 a0 c8                               : .(Px..
--------------------------------------------------------------------
blitops_op:
7bfa : __ __ __ BYT 00 21 01 41                                     : .!.A
--------------------------------------------------------------------
mod_saved_irq:
7bfe : __ __ __ BSS	2
--------------------------------------------------------------------
__multab320L:
7c00 : __ __ __ BYT 00 40 80 c0 00 40 80 c0 00 40 80 c0 00          : .@...@...@...
--------------------------------------------------------------------
__multab320H:
7c0d : __ __ __ BYT 00 01 02 03 05 06 07 08 0a 0b 0c 0d 0f          : .............
--------------------------------------------------------------------
__multab10L:
7c1a : __ __ __ BYT 00 0a 14 1e 28 32 3c 46 50 5a 64 6e 78 82 8c 96 : ....(2<FPZdnx...
--------------------------------------------------------------------
__multab17L:
7c2a : __ __ __ BYT 00 11 22 33 44 55 66 77 88 99 aa bb cc dd ee ff : .."3DUfw........
--------------------------------------------------------------------
screen_result@proxy: ; screen_result@proxy
7c3a : a9 c5 __ LDA #$c5
7c3c : 85 10 __ STA P3 
7c3e : a9 15 __ LDA #$15
7c40 : 85 11 __ STA P4 
7c42 : 4c ec 11 JMP $11ec ; (screen_result.s4 + 0)
--------------------------------------------------------------------
memset@proxy: ; memset@proxy
7c45 : a9 e0 __ LDA #$e0
7c47 : 85 0e __ STA P1 
7c49 : a9 40 __ LDA #$40
7c4b : 85 11 __ STA P4 
7c4d : a9 1f __ LDA #$1f
7c4f : 85 12 __ STA P5 
7c51 : 4c 14 24 JMP $2414 ; (memset.s4 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
7c54 : a5 4f __ LDA $4f 
7c56 : 85 03 __ STA WORK + 0 
7c58 : a5 50 __ LDA $50 
7c5a : 85 04 __ STA WORK + 1 
7c5c : 4c 52 78 JMP $7852 ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
7c5f : a5 5e __ LDA $5e 
7c61 : 85 03 __ STA WORK + 0 
7c63 : a5 5f __ LDA $5f 
7c65 : 85 04 __ STA WORK + 1 
7c67 : 4c 52 78 JMP $7852 ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
7c6a : a9 7f __ LDA #$7f
7c6c : 85 03 __ STA WORK + 0 
7c6e : a9 00 __ LDA #$00
7c70 : 85 04 __ STA WORK + 1 
7c72 : a5 05 __ LDA WORK + 2 
7c74 : 85 1b __ STA ACCU + 0 
7c76 : a5 06 __ LDA WORK + 3 
7c78 : 85 1c __ STA ACCU + 1 
7c7a : 4c 52 78 JMP $7852 ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
7c7d : a9 0d __ LDA #$0d
7c7f : 85 03 __ STA WORK + 0 
7c81 : 4c 52 78 JMP $7852 ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
7c84 : a9 7f __ LDA #$7f
7c86 : 85 03 __ STA WORK + 0 
7c88 : a9 00 __ LDA #$00
7c8a : 85 04 __ STA WORK + 1 
7c8c : 4c 52 78 JMP $7852 ; (divs16 + 0)
--------------------------------------------------------------------
divmod@proxy: ; divmod@proxy
7c8f : a9 50 __ LDA #$50
7c91 : 85 1b __ STA ACCU + 0 
7c93 : a9 46 __ LDA #$46
7c95 : 85 1c __ STA ACCU + 1 
7c97 : 4c 8d 78 JMP $788d ; (divmod + 0)
--------------------------------------------------------------------
cwin_put_string@proxy: ; cwin_put_string@proxy
7c9a : a5 10 __ LDA P3 
7c9c : 85 0d __ STA P0 
7c9e : a5 11 __ LDA P4 
7ca0 : 85 0e __ STA P1 
7ca2 : 4c 4a 11 JMP $114a ; (cwin_put_string.s4 + 0)
--------------------------------------------------------------------
vic_setmode@proxy: ; vic_setmode@proxy
7ca5 : a9 04 __ LDA #$04
7ca7 : 85 0d __ STA P0 
7ca9 : a9 c0 __ LDA #$c0
7cab : 85 0f __ STA P2 
7cad : a9 e0 __ LDA #$e0
7caf : 85 11 __ STA P4 
7cb1 : 4c 90 0f JMP $0f90 ; (vic_setmode.s4 + 0)
--------------------------------------------------------------------
vic_setmode@proxy: ; vic_setmode@proxy
7cb4 : a9 03 __ LDA #$03
7cb6 : 85 0d __ STA P0 
7cb8 : a9 00 __ LDA #$00
7cba : 85 0e __ STA P1 
7cbc : a9 d0 __ LDA #$d0
7cbe : 85 0f __ STA P2 
7cc0 : a5 43 __ LDA $43 
7cc2 : 85 10 __ STA P3 
7cc4 : a5 44 __ LDA $44 
7cc6 : 85 11 __ STA P4 
7cc8 : 4c 90 0f JMP $0f90 ; (vic_setmode.s4 + 0)
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
7ccb : a9 7c __ LDA #$7c
7ccd : 85 0e __ STA P1 
7ccf : 4c c1 10 JMP $10c1 ; (strlen.s4 + 0)
--------------------------------------------------------------------
p2smap:
7cd2 : __ __ __ BYT 40 00 40 20 40 c0 80 80                         : @.@ @...
--------------------------------------------------------------------
p2smap:
7cda : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
audio_ch_base:
7ce2 : __ __ __ BYT 20 df 40 df 60 df 80 df a0 df c0 df e0 df       :  .@.`.........
--------------------------------------------------------------------
mod_file:
7cf0 : __ __ __ BYT 34 65 76 2e 6d 6f 64 00                         : 4ev.mod.
--------------------------------------------------------------------
lmask:
7cf8 : __ __ __ BYT ff 7f 3f 1f 0f 07 03 01                         : ..?.....
--------------------------------------------------------------------
mul40:
7d00 : __ __ __ BYT 00 00 28 00 50 00 78 00 a0 00 c8 00 f0 00 18 01 : ..(.P.x.........
7d10 : __ __ __ BYT 40 01 68 01 90 01 b8 01 e0 01 08 02 30 02 58 02 : @.h.........0.X.
7d20 : __ __ __ BYT 80 02 a8 02 d0 02 f8 02 20 03 48 03 70 03 98 03 : ........ .H.p...
7d30 : __ __ __ BYT c0 03                                           : ..
--------------------------------------------------------------------
demo_path:
7d32 : __ __ __ BYT 69 64 69 38 62 2f 75 6c 74 64 65 6d 6f 32 30 32 : idi8b/ultdemo202
7d42 : __ __ __ BYT 36 2f 00                                        : 6/.
--------------------------------------------------------------------
sid_freq:
7d45 : __ __ __ BYT a9 02 d2 02 fd 02 2b 03 5b 03 8e 03 c4 03 fd 03 : ......+.[.......
7d55 : __ __ __ BYT 3a 04 7a 04 bf 04 07 05 53 05 a4 05 fa 05 55 06 : :.z.....S.....U.
--------------------------------------------------------------------
speed_nums:
7d65 : __ __ __ BYT b6 25 b8 25 ba 25 bc 25 be 25 c0 25 c2 25 c5 25 : .%.%.%.%.%.%.%.%
7d75 : __ __ __ BYT c8 25 cb 25 ce 25 d1 25 d4 25 d7 25 da 25 dd 25 : .%.%.%.%.%.%.%.%
--------------------------------------------------------------------
glyphs:
7d85 : __ __ __ BYT 70 88 88 88 88 88 70 20 60 20 20 20 20 70 70 88 : p.....p `    pp.
7d95 : __ __ __ BYT 08 30 40 80 f8 70 88 08 30 08 88 70 10 30 50 90 : .0@..p..0..p.0P.
7da5 : __ __ __ BYT f8 10 10 f8 80 f0 08 08 88 70 30 40 80 f0 88 88 : .........p0@....
7db5 : __ __ __ BYT 70 f8 08 10 20 40 40 40 70 88 88 70 88 88 70 70 : p... @@@p..p..pp
7dc5 : __ __ __ BYT 88 88 78 08 10 60 88 d8 a8 88 88 88 88 88 88 88 : ..x..`..........
7dd5 : __ __ __ BYT f8 88 88 88 f8 10 20 40 80 80 f8                : ...... @...
--------------------------------------------------------------------
rmask:
7de0 : __ __ __ BYT 00 80 c0 e0 f0 f8 fc fe                         : ........
--------------------------------------------------------------------
tbitmap:
7de8 : __ __ __ BYT e0 a0 00 00 28 01 40 01                         : ....(.@.
--------------------------------------------------------------------
cr:
7df0 : __ __ __ BYT 00 00 00 00 40 01 c8 00                         : ....@...
--------------------------------------------------------------------
cbytes:
7df8 : __ __ __ BYT 00 55 aa ff                                     : .U..
--------------------------------------------------------------------
pal_sc:
7dfc : __ __ __ BYT f9 e3 a8 d5                                     : ....
--------------------------------------------------------------------
step_msg:
7e00 : __ __ __ BYT dd 2f f6 2f 0b 30 1e 30 36 30 53 30 6d 30 87 30 : ././.0.060S0m0.0
7e10 : __ __ __ BYT a0 30 bc 30 dc 30 f9 30 16 31 32 31 4a 31 66 31 : .0.0.0.0.121J1f1
--------------------------------------------------------------------
TinyFont:
7e20 : __ __ __ BYT 00 04 05 08 0d 12 17 1c 1d 21 25 2a 2d 2e 31 32 : .........!%*-.12
7e30 : __ __ __ BYT 35 39 3d 41 45 49 4d 51 55 59 5d 5e 5f 62 65 68 : 59=AEIMQUY]^_beh
7e40 : __ __ __ BYT 6c 71 76 7a 7e 82 86 8a 8e 92 95 99 9d a1 a6 ab : lqvz~...........
7e50 : __ __ __ BYT af b3 b7 bb bf c4 c8 cd d2 d7 dc e1 e5 e8 ec f1 : ................
7e60 : __ __ __ BYT f5 f9 fd 01 05 09 0d 10 14 18 19 1b 1f 21 26 2a : .............!&*
7e70 : __ __ __ BYT 2e 32 36 3a 3e 41 45 49 4e 52 56 5a 5e 5f 63 67 : .26:>AEINRVZ^_cg
7e80 : __ __ __ BYT 10 04 0c 14 14 14 14 04 10 10 14 0c 04 0c 04 0c : ................
7e90 : __ __ __ BYT 10 10 10 10 10 10 10 10 10 10 04 04 0c 0c 0c 10 : ................
7ea0 : __ __ __ BYT 14 14 10 10 10 10 10 10 10 0c 10 10 10 14 14 10 : ................
7eb0 : __ __ __ BYT 10 10 10 10 14 10 14 14 14 14 14 10 0c 10 14 10 : ................
7ec0 : __ __ __ BYT 10 10 10 11 11 11 0d 11 11 05 09 11 09 15 11 11 : ................
7ed0 : __ __ __ BYT 11 11 11 11 0d 11 11 15 11 11 11 11 05 11 11 11 : ................
7ee0 : __ __ __ BYT 00 00 00 00 fa c0 00 c0 28 7c 28 7c 28 20 54 d6 : ........(|(|( T.
7ef0 : __ __ __ BYT 54 08 04 48 10 24 40 6c 92 92 6c 0a c0 38 44 82 : T..H.$@l..l..8D.
7f00 : __ __ __ BYT 82 82 82 44 38 10 54 38 54 10 10 38 10 03 10 10 : ...D8.T8T..8....
7f10 : __ __ __ BYT 10 02 06 38 c0 7c 82 82 7c 22 42 fe 02 46 8a 92 : ...8.|..|"B..F..
7f20 : __ __ __ BYT 62 44 82 92 6c f0 10 3e 10 e4 92 92 8c 7c 92 92 : bD..l..>.....|..
7f30 : __ __ __ BYT 4c 80 8e 90 e0 6c 92 92 6c 64 92 92 7c 28 0b 10 : L....l..ld..|(..
7f40 : __ __ __ BYT 28 44 28 28 28 44 28 10 40 80 9a 60 00 00 00 00 : (D(((D(.@..`....
7f50 : __ __ __ BYT 00 3e 50 90 50 3e fe 92 92 6c 7c 82 82 44 fe 82 : .>P.P>...l|..D..
7f60 : __ __ __ BYT 82 7c fe 92 92 82 fe 90 90 80 7c 82 92 1c fe 10 : .|........|.....
7f70 : __ __ __ BYT 10 fe 82 fe 82 84 82 82 fc fe 10 28 c6 fe 02 02 : ...........(....
7f80 : __ __ __ BYT 02 fe 40 20 40 fe fe 40 20 10 fe 7c 82 82 7c fe : ..@ @..@ ..|..|.
7f90 : __ __ __ BYT 90 90 60 7c 82 84 7a fe 90 90 6e 64 92 92 4c 80 : ..`|..z...nd..L.
7fa0 : __ __ __ BYT 80 fe 80 80 fc 02 02 fc e0 18 06 18 e0 fe 04 08 : ................
7fb0 : __ __ __ BYT 04 fe c6 28 10 28 c6 e0 10 1e 10 e0 86 8a 92 a2 : ...(.(..........
7fc0 : __ __ __ BYT c2 fe 82 82 82 c0 38 06 82 82 82 fe 20 40 80 40 : ......8..... @.@
7fd0 : __ __ __ BYT 20 01 01 01 01 00 00 00 00 04 2a 2a 1e fe 22 22 :  .........**..""
7fe0 : __ __ __ BYT 1c 1c 22 22 14 1c 22 22 fe 1c 2a 2a 18 20 7e a0 : ..""..""..**. ~.
7ff0 : __ __ __ BYT 18 25 25 3e fe 20 20 1e be 01 be fe 10 28 46 fc : .%%>.  ......(F.
8000 : __ __ __ BYT 02 3e 20 1e 20 1e 3e 20 20 1e 1c 22 22 1c 3f 24 : .> . .>  .."".?$
8010 : __ __ __ BYT 24 18 18 24 24 3f 3e 10 20 10 12 2a 2a 04 20 7c : $..$$?>. ..**. |
8020 : __ __ __ BYT 22 3c 02 02 3e 38 04 02 3c 3c 02 1c 02 3c 26 18 : "<..>8..<<...<&.
8030 : __ __ __ BYT 0c 32 38 05 05 3e 26 2a 2a 32 10 6c 82 82 fe 82 : .28..>&**2.l....
8040 : __ __ __ BYT 82 6c 10 10 20 10 20 00 00 00 00                : .l.. . ....
--------------------------------------------------------------------
sin64:
804b : __ __ __ BYT 00 0c 19 25 31 3c 47 51 5a 62 6a 70 75 7a 7d 7e : ...%1<GQZbjpuz}~
805b : __ __ __ BYT 7f 7e 7d 7a 75 70 6a 62 5a 51 47 3c 31 25 19 0c : .~}zupjbZQG<1%..
806b : __ __ __ BYT 00 f4 e7 db cf c4 b9 af a6 9e 96 90 8b 86 83 82 : ................
807b : __ __ __ BYT 81 82 83 86 8b 90 96 9e a6 af b9 c4 cf db e7 f4 : ................
--------------------------------------------------------------------
vib_sine:
808b : __ __ __ BYT 00 18 31 4a 61 78 8d a1 b4 c5 d4 e0 eb f4 fa fd : ..1Jax..........
809b : __ __ __ BYT ff fd fa f4 eb e0 d4 c5 b4 a1 8d 78 61 4a 31 18 : ...........xaJ1.
--------------------------------------------------------------------
mand_frame:
80ab : __ __ __ BYT 00 e4 1f f5 33 20 00 00 00 00                   : ....3 ....
--------------------------------------------------------------------
f1c:
80b5 : __ __ __ BYT 0f 01 0d 0d 05 01 07 0d 01 01 07 08 0e 03 01 03 : ................
80c5 : __ __ __ BYT 0e 0d 0d 07 01 01 0d 07 06 03 0e 0e 05 03 05 0d : ................
80d5 : __ __ __ BYT 01 01 05 0d 06 04 03 03 0e 01 0d 03 01 01 0f 0d : ................
--------------------------------------------------------------------
gz:
80e5 : __ __ __ BYT a0 00 bb 00 d5 00 f0 00 0b 01 25 01 40 01       : ..........%.@.
--------------------------------------------------------------------
vcr:
80f3 : __ __ __ BYT 00 00 00 00 40 01 c8 00                         : ....@...
--------------------------------------------------------------------
pal_cr:
80fb : __ __ __ BYT 01 01 07 03                                     : ....
--------------------------------------------------------------------
fine_x:
80ff : __ __ __ BSS	1
--------------------------------------------------------------------
gx:
8100 : __ __ __ BYT b0 ff cb ff e5 ff 00 00 1b 00 35 00 50 00       : ..........5.P.
--------------------------------------------------------------------
cube_v:
810e : __ __ __ BYT ff ff ff 01 ff ff 01 01 ff ff 01 ff ff ff 01 01 : ................
811e : __ __ __ BYT ff 01 01 01 01 ff 01 01                         : ........
--------------------------------------------------------------------
sin256:
8126 : __ __ __ BYT 00 00 65 00 c9 00 2d 01 91 01 f5 01 59 02 bc 02 : ..e...-.....Y...
8136 : __ __ __ BYT 1f 03 81 03 e3 03 44 04 a5 04 05 05 64 05 c2 05 : ......D.....d...
8146 : __ __ __ BYT 1f 06 7c 06 d7 06 32 07 8b 07 e3 07 3a 08 8f 08 : ..|...2.....:...
8156 : __ __ __ BYT e4 08 37 09 88 09 d8 09 26 0a 73 0a bf 0a 08 0b : ..7.....&.s.....
8166 : __ __ __ BYT 50 0b 97 0b db 0b 1e 0c 5e 0c 9d 0c da 0c 15 0d : P.......^.......
8176 : __ __ __ BYT 4e 0d 85 0d b9 0d ec 0d 1c 0e 4b 0e 77 0e a1 0e : N.........K.w...
8186 : __ __ __ BYT c8 0e ee 0e 11 0f 31 0f 50 0f 6c 0f 85 0f 9c 0f : ......1.P.l.....
8196 : __ __ __ BYT b1 0f c4 0f d4 0f e1 0f ec 0f f5 0f fb 0f ff 0f : ................
81a6 : __ __ __ BYT 00 10 ff 0f fb 0f f5 0f ec 0f e1 0f d4 0f c4 0f : ................
81b6 : __ __ __ BYT b1 0f 9c 0f 85 0f 6c 0f 50 0f 31 0f 11 0f ee 0e : ......l.P.1.....
81c6 : __ __ __ BYT c8 0e a1 0e 77 0e 4b 0e 1c 0e ec 0d b9 0d 85 0d : ....w.K.........
81d6 : __ __ __ BYT 4e 0d 15 0d da 0c 9d 0c 5e 0c 1e 0c db 0b 97 0b : N.......^.......
81e6 : __ __ __ BYT 50 0b 08 0b bf 0a 73 0a 26 0a d8 09 88 09 37 09 : P.....s.&.....7.
81f6 : __ __ __ BYT e4 08 8f 08 3a 08 e3 07 8b 07 32 07 d7 06 7c 06 : ....:.....2...|.
8206 : __ __ __ BYT 1f 06 c2 05 64 05 05 05 a5 04 44 04 e3 03 81 03 : ....d.....D.....
8216 : __ __ __ BYT 1f 03 bc 02 59 02 f5 01 91 01 2d 01 c9 00 65 00 : ....Y.....-...e.
8226 : __ __ __ BYT 00 00 9b ff 37 ff d3 fe 6f fe 0b fe a7 fd 44 fd : ....7...o.....D.
8236 : __ __ __ BYT e1 fc 7f fc 1d fc bc fb 5b fb fb fa 9c fa 3e fa : ........[.....>.
8246 : __ __ __ BYT e1 f9 84 f9 29 f9 ce f8 75 f8 1d f8 c6 f7 71 f7 : ....)...u.....q.
8256 : __ __ __ BYT 1c f7 c9 f6 78 f6 28 f6 da f5 8d f5 41 f5 f8 f4 : ....x.(.....A...
8266 : __ __ __ BYT b0 f4 69 f4 25 f4 e2 f3 a2 f3 63 f3 26 f3 eb f2 : ..i.%.....c.&...
8276 : __ __ __ BYT b2 f2 7b f2 47 f2 14 f2 e4 f1 b5 f1 89 f1 5f f1 : ..{.G........._.
8286 : __ __ __ BYT 38 f1 12 f1 ef f0 cf f0 b0 f0 94 f0 7b f0 64 f0 : 8...........{.d.
8296 : __ __ __ BYT 4f f0 3c f0 2c f0 1f f0 14 f0 0b f0 05 f0 01 f0 : O.<.,...........
82a6 : __ __ __ BYT 00 f0 01 f0 05 f0 0b f0 14 f0 1f f0 2c f0 3c f0 : ............,.<.
82b6 : __ __ __ BYT 4f f0 64 f0 7b f0 94 f0 b0 f0 cf f0 ef f0 12 f1 : O.d.{...........
82c6 : __ __ __ BYT 38 f1 5f f1 89 f1 b5 f1 e4 f1 14 f2 47 f2 7b f2 : 8._.........G.{.
82d6 : __ __ __ BYT b2 f2 eb f2 26 f3 63 f3 a2 f3 e2 f3 25 f4 69 f4 : ....&.c.....%.i.
82e6 : __ __ __ BYT b0 f4 f8 f4 41 f5 8d f5 da f5 28 f6 78 f6 c9 f6 : ....A.....(.x...
82f6 : __ __ __ BYT 1c f7 71 f7 c6 f7 1d f8 75 f8 ce f8 29 f9 84 f9 : ..q.....u...)...
8306 : __ __ __ BYT e1 f9 3e fa 9c fa fb fa 5b fb bc fb 1d fc 7f fc : ..>.....[.......
8316 : __ __ __ BYT e1 fc 44 fd a7 fd 0b fe 6f fe d3 fe 37 ff 9b ff : ..D.....o...7...
--------------------------------------------------------------------
cube_e:
8326 : __ __ __ BYT 00 01 01 02 02 03 03 00 04 05 05 06 06 07 07 04 : ................
8336 : __ __ __ BYT 00 04 01 05 02 06 03 07                         : ........
--------------------------------------------------------------------
sin_lut:
833e : __ __ __ BYT 02 02 02 02 02 02 02 02 03 03 03 03 03 03 03 03 : ................
834e : __ __ __ BYT 03 03 03 03 03 03 03 03 03 02 02 02 02 02 02 02 : ................
835e : __ __ __ BYT 02 01 01 01 01 01 01 01 00 00 00 00 00 00 00 00 : ................
836e : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 01 01 01 01 01 01 : ................
--------------------------------------------------------------------
sum_to_col:
837e : __ __ __ BYT 00 00 00 01 01 02 02 03 03 03                   : ..........
--------------------------------------------------------------------
lat_wave:
8388 : __ __ __ BYT 00 ff ff fe fe fd fd fc fc fb fb fb fa fa fa fa : ................
8398 : __ __ __ BYT fa fa fa fb fb fb fc fc fd fd fe fe ff ff 00 00 : ................
83a8 : __ __ __ BYT 01 01 02 02 03 03 04 04 05 05 05 06 06 06 06 06 : ................
83b8 : __ __ __ BYT 06 06 05 05 05 04 04 03 03 02 02 01 01 00 00 ff : ................
--------------------------------------------------------------------
pcolor:
83c8 : __ __ __ BYT 02 08 07 0d 05 03 0e 06                         : ........
--------------------------------------------------------------------
cw:
83d0 : __ __ __ BSS	12
--------------------------------------------------------------------
Screen:
83dc : __ __ __ BSS	8
--------------------------------------------------------------------
tworks:
83e4 : __ __ __ BSS	8
--------------------------------------------------------------------
mod_row_buf:
83ec : __ __ __ BSS	16
--------------------------------------------------------------------
txt_pos:
83fc : __ __ __ BSS	2
--------------------------------------------------------------------
wave_phase:
83fe : __ __ __ BSS	1
--------------------------------------------------------------------
plasma_phase:
83ff : __ __ __ BSS	1
--------------------------------------------------------------------
vert_wave:
8400 : __ __ __ BYT 00 01 02 02 03 03 04 04 04 04 04 03 03 02 02 01 : ................
8410 : __ __ __ BYT 00 ff fe fe fd fd fc fc fc fc fc fd fd fe fe ff : ................
8420 : __ __ __ BYT 00 01 02 02 03 03 04 04 04 04 04 03 03 02 02 01 : ................
8430 : __ __ __ BYT 00 ff fe fe fd fd fc fc fc fc fc fd fd fe fe ff : ................
--------------------------------------------------------------------
scroll_text:
8440 : __ __ __ BYT 20 20 75 4c 54 49 4d 41 54 45 20 64 45 4d 4f 20 :   uLTIMATE dEMO 
8450 : __ __ __ BYT 32 30 32 36 20 20 63 4f 44 45 44 20 69 4e 20 63 : 2026  cODED iN c
8460 : __ __ __ BYT 20 62 59 20 78 41 4e 44 45 52 20 6d 4f 4c 20 20 :  bY xANDER mOL  
8470 : __ __ __ BYT 72 55 4e 4e 49 4e 47 20 61 54 20 36 34 20 6d 48 : rUNNING aT 64 mH
8480 : __ __ __ BYT 5a 20 6f 4e 20 74 48 45 20 75 4c 54 49 4d 41 54 : Z oN tHE uLTIMAT
8490 : __ __ __ BYT 45 20 36 34 20 68 41 52 44 57 41 52 45 20 20 67 : E 64 hARDWARE  g
84a0 : __ __ __ BYT 52 45 45 54 49 4e 47 53 20 74 4f 20 61 4c 4c 20 : REETINGS tO aLL 
84b0 : __ __ __ BYT 63 36 34 20 64 45 4d 4f 20 63 4f 44 45 52 53 20 : c64 dEMO cODERS 
84c0 : __ __ __ BYT 20 73 54 49 4c 4c 20 70 55 53 48 49 4e 47 20 74 :  sTILL pUSHING t
84d0 : __ __ __ BYT 48 45 20 6c 49 4d 49 54 53 20 6f 46 20 74 48 45 : HE lIMITS oF tHE
84e0 : __ __ __ BYT 20 63 36 34 20 69 4e 20 32 30 32 36 20 20 20 20 :  c64 iN 2026    
84f0 : __ __ __ BYT 2d 20 63 52 45 44 49 54 53 20 2d 20 20 63 4f 44 : - cREDITS -  cOD
8500 : __ __ __ BYT 45 20 2d 20 6f 53 43 41 52 36 34 20 63 4f 4d 50 : E - oSCAR64 cOMP
8510 : __ __ __ BYT 49 4c 45 52 20 62 59 20 44 52 4d 4f 52 54 41 4c : ILER bY DRMORTAL
8520 : __ __ __ BYT 57 4f 4d 42 41 54 20 20 6d 55 53 49 43 20 2d 20 : WOMBAT  mUSIC - 
8530 : __ __ __ BYT 66 4f 52 45 56 45 52 20 79 4f 55 4e 47 20 2d 20 : fOREVER yOUNG - 
8540 : __ __ __ BYT 34 45 56 2e 4d 4f 44 20 20 66 4f 4e 54 20 2d 20 : 4EV.MOD  fONT - 
8550 : __ __ __ BYT 73 4d 41 4c 4c 20 72 4f 55 4e 44 20 70 65 74 73 : sMALL rOUND pets
8560 : __ __ __ BYT 63 69 69 20 66 4f 4e 54 20 62 59 20 63 55 50 49 : cii fONT bY cUPI
8570 : __ __ __ BYT 44 20 20 75 4c 54 49 4d 41 54 45 20 6c 49 42 52 : D  uLTIMATE lIBR
8580 : __ __ __ BYT 41 52 59 20 62 59 20 73 43 4f 54 54 20 68 55 54 : ARY bY sCOTT hUT
8590 : __ __ __ BYT 54 45 52 20 20 6d 4f 44 20 70 4c 41 59 45 52 20 : TER  mOD pLAYER 
85a0 : __ __ __ BYT 73 4f 55 52 43 45 20 62 59 20 66 52 45 53 48 4e : sOURCE bY fRESHN
85b0 : __ __ __ BYT 45 53 53 20 20 20 20 2d 20 73 50 45 43 49 41 4c : ESS    - sPECIAL
85c0 : __ __ __ BYT 20 74 48 41 4e 4b 53 20 2d 20 20 67 49 44 45 4f :  tHANKS -  gIDEO
85d0 : __ __ __ BYT 4e 20 7a 57 45 49 4a 54 5a 45 52 20 2d 20 63 52 : N zWEIJTZER - cR
85e0 : __ __ __ BYT 45 41 54 4f 52 20 6f 46 20 74 48 45 20 75 4c 54 : EATOR oF tHE uLT
85f0 : __ __ __ BYT 49 4d 41 54 45 20 36 34 20 20 74 48 45 20 66 41 : IMATE 64  tHE fA
8600 : __ __ __ BYT 53 54 45 53 54 20 63 36 34 20 63 4f 4d 50 41 54 : STEST c64 cOMPAT
8610 : __ __ __ BYT 49 42 4c 45 20 6d 41 43 48 49 4e 45 20 20 20 20 : IBLE mACHINE    
8620 : __ __ __ BYT 74 48 41 4e 4b 20 79 4f 55 20 66 4f 52 20 77 41 : tHANK yOU fOR wA
8630 : __ __ __ BYT 54 43 48 49 4e 47 20 20 70 52 45 53 53 20 61 4e : TCHING  pRESS aN
8640 : __ __ __ BYT 59 20 6b 45 59 20 74 4f 20 65 58 49 54 20 20 20 : Y kEY tO eXIT   
8650 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
8660 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
8670 : __ __ __ BYT 20 20 20 20 20 20 20 00                         :        .
--------------------------------------------------------------------
letter_width:
8678 : __ __ __ BYT 03 03 03 03 03 03 03 04 02 03 03 03 03 03 03 03 : ................
8688 : __ __ __ BYT 03 03 03 03 03 02 03 03 03 03 03 03 03 03 03 02 : ................
8698 : __ __ __ BYT 03 03 01 02 03 01 05 03 03 03 03 03 03 03 03 02 : ................
86a8 : __ __ __ BYT 05 03 03 03 03 03 01 03 03 03 03 03 03 03 03 01 : ................
86b8 : __ __ __ BYT 01 01 01 01 03 01 02 03 03 03 04 03 03 04 02 02 : ................
86c8 : __ __ __ BYT 02 02 02 02 03 02                               : ......
--------------------------------------------------------------------
mx:
86ce : __ __ __ BSS	8
--------------------------------------------------------------------
VScreen:
86d6 : __ __ __ BSS	8
--------------------------------------------------------------------
py_cur:
86de : __ __ __ BSS	16
--------------------------------------------------------------------
px_cur:
86ee : __ __ __ BSS	16
--------------------------------------------------------------------
done:
86fe : __ __ __ BSS	1
--------------------------------------------------------------------
dp_y:
86ff : __ __ __ BSS	1
--------------------------------------------------------------------
psin:
8700 : __ __ __ BYT 04 04 04 05 05 05 05 06 06 06 06 07 07 07 07 07 : ................
8710 : __ __ __ BYT 07 07 07 07 07 07 06 06 06 06 05 05 05 05 04 04 : ................
8720 : __ __ __ BYT 04 03 03 02 02 02 02 01 01 01 01 00 00 00 00 00 : ................
8730 : __ __ __ BYT 00 00 00 00 00 00 01 01 01 01 02 02 02 02 03 03 : ................
--------------------------------------------------------------------
sin_row:
8740 : __ __ __ BYT 00 01 01 01 01 02 02 02 02 02 01 01 01 01 00 00 : ................
8750 : __ __ __ BYT ff ff ff fe fe fe fe fe fe fe ff ff ff 00 00 01 : ................
8760 : __ __ __ BYT 00 01 01 01 01 02 02 02 02 02 01 01 01 01 00 00 : ................
8770 : __ __ __ BYT ff ff ff fe fe fe fe fe fe fe ff ff ff 00 00 01 : ................
--------------------------------------------------------------------
letter_start:
8780 : __ __ __ BYT 00 03 06 09 0c 0f 12 15 19 1b 1e 21 24 00 03 06 : ...........!$...
8790 : __ __ __ BYT 09 0c 0f 12 15 18 1a 1d 20 23 00 03 06 09 0c 0f : ........ #......
87a0 : __ __ __ BYT 11 14 17 18 1a 1d 1e 23 00 03 06 09 0c 0f 12 15 : .......#........
87b0 : __ __ __ BYT 17 1c 1f 22 00 00 03 04 07 0a 0d 10 13 16 19 1c : ..."............
87c0 : __ __ __ BYT 1d 1e 1f 20 21 24 25 00 03 06 09 0d 10 13 17 19 : ... !$%.........
87d0 : __ __ __ BYT 1b 1d 1f 21 23 26                               : ...!#&
--------------------------------------------------------------------
loops:
87d6 : __ __ __ BSS	2
--------------------------------------------------------------------
scr_letter:
87d8 : __ __ __ BSS	40
--------------------------------------------------------------------
font_am_ch:
8800 : __ __ __ BYT 55 44 49 70 44 49 55 44 49 70 44 49 55 44 6e 55 : UDIpDIUDIpDIUDnU
8810 : __ __ __ BYT 44 6e 55 44 49 72 20 72 20 72 20 20 20 6e 72 20 : DnUDIr r r   nr 
8820 : __ __ __ BYT 2f 72 20 20 55 72 49 20 6b 46 73 6b 46 73 47 20 : /r  UrI kFskFsG 
8830 : __ __ __ BYT 20 48 20 48 6b 44 20 6b 44 20 47 44 6e 6b 44 73 :  H HkD kD GDnkDs
8840 : __ __ __ BYT 20 5d 20 70 20 48 6b 3c 20 5d 20 20 47 48 48 20 :  ] p Hk< ]  GHH 
8850 : __ __ __ BYT 47 20 48 47 20 48 47 20 20 48 20 48 47 20 20 47 : G HG HG  H HG  G
8860 : __ __ __ BYT 20 20 47 20 48 48 20 47 20 48 20 47 20 48 48 20 :   G HH G H G HH 
8870 : __ __ __ BYT 4d 47 20 20 47 5d 48 20 6d 20 7d 6d 46 4b 4a 46 : MG  G]H m }mFKJF
8880 : __ __ __ BYT 4b 6d 46 4b 4a 46 7d 71 20 20 4a 46 4b 71 20 71 : KmFKJF}q  JFKq q
8890 : __ __ __ BYT 20 71 20 4a 46 4b 71 20 27 6d 46 7d 4a 20 4b 20 :  q JFKq 'mF}J K 
88a0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
88b0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
88c0 : __ __ __ BYT 20 20 20 20 20 20 20 20                         :         
--------------------------------------------------------------------
bitshift:
88c8 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
88d8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
88e8 : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
88f8 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
font_nz_ch:
8900 : __ __ __ BYT 72 20 72 55 44 49 55 44 49 55 44 49 55 44 49 55 : r rUDIUDIUDIUDIU
8910 : __ __ __ BYT 44 49 70 72 6e 55 20 49 74 59 55 20 49 20 20 20 : DIprnU ItYU I   
8920 : __ __ __ BYT 47 20 47 43 44 6e 20 20 47 4d 48 47 20 48 47 20 : G GCDn  GMHG HG 
8930 : __ __ __ BYT 48 47 20 48 47 20 48 4a 44 49 20 5d 20 47 20 48 : HG HG HJDI ] G H
8940 : __ __ __ BYT 54 59 47 48 48 4d 20 2f 4a 46 73 20 4e 20 20 20 : TYGHHM /JFs N   
8950 : __ __ __ BYT 47 20 48 47 20 48 6b 46 4b 47 20 48 6b 46 4b 47 : G HG HkFKG HkFKG
8960 : __ __ __ BYT 20 48 20 5d 20 47 20 48 47 48 47 5d 48 20 56 20 :  H ] G HGHG]H V 
8970 : __ __ __ BYT 47 20 48 4e 20 48 20 20 71 20 71 4a 46 4b 5d 20 : G HN H  q qJFK] 
8980 : __ __ __ BYT 20 4a 46 4d 5d 20 4d 4a 46 4b 20 71 20 4a 46 4b :  JFM] MJFK q JFK
8990 : __ __ __ BYT 4a 4b 4a 71 4b 2f 20 4d 6d 46 4b 6d 46 7d 20 20 : JKJqK/ MmFKmF}  
89a0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
89b0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
89c0 : __ __ __ BYT 20 20 20 20 20 20 20 20                         :         
--------------------------------------------------------------------
scr_col:
89c8 : __ __ __ BSS	40
--------------------------------------------------------------------
df_x:
89f0 : __ __ __ BSS	1
--------------------------------------------------------------------
df_yoff:
89f1 : __ __ __ BSS	1
--------------------------------------------------------------------
df_r:
89f2 : __ __ __ BSS	1
--------------------------------------------------------------------
HeapNode:
89f3 : __ __ __ BSS	4
--------------------------------------------------------------------
font_lc_an_ch:
8a00 : __ __ __ BYT 20 20 20 48 20 20 20 20 20 20 20 47 20 20 20 55 :    H       G   U
8a10 : __ __ __ BYT 46 20 20 20 48 20 20 57 20 20 54 20 20 47 20 20 : F   H  W  T  G  
8a20 : __ __ __ BYT 20 20 20 20 20 20 20 20 55 44 49 6b 44 49 55 44 :         UDIkDIUD
8a30 : __ __ __ BYT 49 55 44 73 55 44 49 6b 46 55 44 49 6b 44 49 59 : IUDsUDIkFUDIkDIY
8a40 : __ __ __ BYT 20 49 47 20 4e 42 70 44 72 44 49 70 44 49 20 20 :  IG NBpDrDIpDI  
8a50 : __ __ __ BYT 55 44 73 5d 20 48 47 20 20 47 20 48 6b 46 4b 47 : UDs] HG  G HkFKG
8a60 : __ __ __ BYT 20 47 20 48 47 20 48 48 20 48 6b 3c 20 5d 47 20 :  G HG HH Hk< ]G 
8a70 : __ __ __ BYT 47 20 48 47 20 48 20 20 4a 46 7d 6d 46 4b 4a 46 : G HG H  JF}mFKJF
8a80 : __ __ __ BYT 4b 4a 46 4b 4a 46 4b 4a 20 4a 46 73 42 20 42 71 : KJFKJFKJ JFsB Bq
8a90 : __ __ __ BYT 20 48 42 20 4d 48 6d 20 7d 20 7d 6d 20 7d 20 20 :  HB MHm } }m }  
8aa0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
8ab0 : __ __ __ BYT 20 20 46 4b 20 20 20 20 46 4b 20 20 20 20 20 20 :   FK    FK      
8ac0 : __ __ __ BYT 20 20 20 20 20 20 20 20                         :         
--------------------------------------------------------------------
font_lc_oz_ch:
8b00 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 48 :                H
8b10 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
8b20 : __ __ __ BYT 20 20 20 20 20 20 20 20 55 44 49 55 44 49 55 44 :         UDIUDIUD
8b30 : __ __ __ BYT 49 55 44 49 55 44 49 6b 44 20 55 20 49 54 59 55 : IUDIUDIkD U ITYU
8b40 : __ __ __ BYT 20 55 20 49 4d 20 2f 55 20 49 70 44 6e 20 20 20 :  U IM /U IpDn   
8b50 : __ __ __ BYT 47 20 48 47 20 48 47 20 48 47 20 20 4a 44 49 47 : G HG HG HG  JDIG
8b60 : __ __ __ BYT 20 48 47 20 48 47 48 47 20 47 20 48 20 56 20 47 :  HG HGHG G H V G
8b70 : __ __ __ BYT 20 48 55 44 4b 20 20 20 4a 46 4b 6b 46 4b 4a 46 :  HUDK   JFKkFKJF
8b80 : __ __ __ BYT 73 71 20 20 4a 46 4b 4a 46 4b 4a 46 4b 4a 4b 4a : sq  JFKJFKJFKJKJ
8b90 : __ __ __ BYT 46 71 46 4b 2f 20 4d 4a 46 73 6d 46 43 20 20 20 : FqFK/ MJFsmFC   
8ba0 : __ __ __ BYT 20 20 20 48 20 20 20 20 47 20 20 20 20 20 20 20 :    H    G       
8bb0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
8bc0 : __ __ __ BYT 46 4b 20 20 20 20 20 20                         : FK      
--------------------------------------------------------------------
font_dig_ch:
8c00 : __ __ __ BYT 55 44 49 49 55 44 49 55 44 49 55 20 49 70 44 6e : UDIIUDIUDIU IpDn
8c10 : __ __ __ BYT 55 44 49 70 44 6e 55 44 49 55 44 49 20 20 59 20 : UDIpDnUDIUDI  Y 
8c20 : __ __ __ BYT 20 20 20 20 42 42 42 20 47 4e 48 48 55 46 4b 20 :     BBB GNHHUFK 
8c30 : __ __ __ BYT 46 73 47 20 48 4a 44 49 6b 44 49 20 55 7d 6b 46 : FsG HJDIkDI U}kF
8c40 : __ __ __ BYT 73 47 20 48 51 20 48 51 20 20 20 2f 48 48 47 20 : sG HQ HQ   /HHG 
8c50 : __ __ __ BYT 47 20 48 48 47 20 20 20 20 48 4a 46 73 47 20 48 : G HHG    HJFsG H
8c60 : __ __ __ BYT 47 20 48 20 47 20 47 20 48 4a 46 73 51 20 5d 42 : G H G G HJFsQ ]B
8c70 : __ __ __ BYT 42 20 4e 20 20 20 20 20 4a 46 4b 71 4a 46 7d 6d : B N     JFKqJF}m
8c80 : __ __ __ BYT 46 4b 20 20 47 4a 46 4b 4a 46 4b 20 54 20 4a 46 : FK  GJFKJFK T JF
8c90 : __ __ __ BYT 4b 4a 46 4b 20 51 51 48 48 2f 20 20 20 20 20 20 : KJFK QQHH/      
8ca0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
8cb0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 4b :                K
8cc0 : __ __ __ BYT 4b 20 20 20 20 20 20 20                         : K       
--------------------------------------------------------------------
font_sym_ch:
8d00 : __ __ __ BYT 55 5b 49 55 44 49 20 20 20 20 20 20 20 20 20 20 : U[IUDI          
8d10 : __ __ __ BYT 70 44 49 20 20 20 20 47 47 55 44 20 2f 44 49 4d : pDI    GGUD /DIM
8d20 : __ __ __ BYT 20 70 40 20 20 20 40 6e 4a 5b 49 6b 46 73 57 20 :  p@   @nJ[IkFsW 
8d30 : __ __ __ BYT 2f 20 20 20 20 20 48 20 20 55 4b 46 43 44 20 5b : /     H  UKFCD [
8d40 : __ __ __ BYT 5b 47 20 3c 20 20 48 20 3e 5d 20 55 44 49 20 42 : [G <  H >] UDI B
8d50 : __ __ __ BYT 20 42 48 47 4d 48 20 4e 20 20 46 43 44 46 5b 44 :  BHGMH N  FCDF[D
8d60 : __ __ __ BYT 20 47 20 46 43 44 20 5b 5b 47 20 20 4d 20 48 2f :  G FCD [[G  M H/
8d70 : __ __ __ BYT 20 5d 20 47 4a 4b 20 42 4a 5b 4b 4a 46 5b 2f 20 :  ] GJK BJ[KJF[/ 
8d80 : __ __ __ BYT 57 20 20 20 20 20 47 20 20 51 20 20 20 20 20 48 : W     G  Q     H
8d90 : __ __ __ BYT 48 4a 46 20 20 46 4b 20 20 6d 40 4a 46 4b 40 7d : HJF  FK  m@JFK@}
8da0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
8db0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
8dc0 : __ __ __ BYT 20 20 20 20 20 20 20 20                         :         
--------------------------------------------------------------------
font_am_co:
8e00 : __ __ __ BYT 0f 0d 01 0f 0d 01 0f 0d 01 0f 0d 01 0f 0d 01 0f : ................
8e10 : __ __ __ BYT 0d 01 0f 0d 01 0f 0d 01 0d 01 01 0d 0d 01 0f 0d : ................
8e20 : __ __ __ BYT 01 01 0d 0d 0d 0d 01 0d 0f 0d 0d 0f 0d 0d 0f 0f : ................
8e30 : __ __ __ BYT 0f 0f 0f 0d 0f 0d 0f 05 0f 0f 0f 0f 0f 0f 0d 0d : ................
8e40 : __ __ __ BYT 0d 0d 0d 0d 0d 0d 0f 01 0d 0d 0d 0f 0f 0d 0d 0d : ................
8e50 : __ __ __ BYT 05 0f 0d 05 0f 0d 05 0f 0d 05 0f 0d 05 0f 0d 05 : ................
8e60 : __ __ __ BYT 0f 05 05 0f 0d 05 0f 0d 0d 0f 0d 05 0f 0d 05 0d : ................
8e70 : __ __ __ BYT 0d 0f 0f 0d 05 0f 0f 0d 05 0f 0f 05 05 0f 05 05 : ................
8e80 : __ __ __ BYT 0f 05 05 0f 05 05 0f 05 05 05 05 05 0f 05 0f 0f : ................
8e90 : __ __ __ BYT 0d 05 0d 05 05 0f 05 0d 05 05 05 0f 05 0d 0f 0d : ................
8ea0 : __ __ __ BYT 0e 0f 0f 0e 0e 0e 0f 0f 0d 0d 0d 0d 0d 0d 0d 0e : ................
8eb0 : __ __ __ BYT 0e 0e 0e 0e 0f 0e 0f 0f 0f 0d 0d 0e 0e 0f 0f 0d : ................
8ec0 : __ __ __ BYT 0d 0e 0d 0d 0e 0e 0d 0e                         : ........
--------------------------------------------------------------------
font_nz_co:
8f00 : __ __ __ BYT 0f 0d 01 0f 0d 01 0d 0d 01 0f 0d 01 0d 0d 01 0f : ................
8f10 : __ __ __ BYT 0d 01 0f 0d 01 0f 0d 01 0d 01 0d 0d 01 0f 0d 01 : ................
8f20 : __ __ __ BYT 0f 0d 01 0f 0d 01 0d 0d 0f 0d 0d 0f 0d 0d 0f 0f : ................
8f30 : __ __ __ BYT 0d 0f 0d 0d 0f 0f 0d 0f 0d 01 05 0f 0f 0f 0f 0f : ................
8f40 : __ __ __ BYT 0f 0d 0f 0d 0d 0f 0d 01 0f 0d 0d 0f 0d 01 0d 0d : ................
8f50 : __ __ __ BYT 05 0f 0d 05 0f 0d 05 0f 0f 05 0f 0d 05 0f 0f 05 : ................
8f60 : __ __ __ BYT 0f 0d 05 0f 05 05 0f 0d 05 0f 05 0f 0f 0f 0d 0d : ................
8f70 : __ __ __ BYT 05 0f 0d 05 0f 0d 0d 0d 05 0f 0f 05 05 0f 05 05 : ................
8f80 : __ __ __ BYT 05 05 05 0f 05 05 05 05 05 0f 05 05 05 05 05 0f : ................
8f90 : __ __ __ BYT 05 0d 05 05 0f 05 0f 0d 05 05 0f 05 05 0f 0d 0d : ................
8fa0 : __ __ __ BYT 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e : ................
8fb0 : __ __ __ BYT 0e 0e 0e 0e 0e 0e 0e 0f 0e 0e 0e 0e 0e 05 05 05 : ................
8fc0 : __ __ __ BYT 0e 05 05 05 0e 0e 05 0e                         : ........
--------------------------------------------------------------------
font_lc_an_co:
9000 : __ __ __ BYT 0e 0e 0e 0d 0d 0e 0e 0e 0e 0e 0f 0d 0e 0e 0e 0d : ................
9010 : __ __ __ BYT 01 0e 0e 0e 0f 0f 0e 01 0e 0e 01 0f 0e 01 0f 0e : ................
9020 : __ __ __ BYT 0e 0e 0e 0e 0e 0e 0e 0e 0f 0d 01 0f 0d 01 0f 0d : ................
9030 : __ __ __ BYT 01 0d 01 01 0f 0d 01 0d 01 0f 0d 01 0d 01 01 01 : ................
9040 : __ __ __ BYT 0f 0d 0d 0d 01 0d 0f 0d 01 0f 01 0f 0d 01 0e 0e : ................
9050 : __ __ __ BYT 05 0d 0d 05 0e 0d 0f 0f 0e 0f 0f 0d 0f 0d 01 0f : ................
9060 : __ __ __ BYT 0f 0f 0f 0d 0f 0f 0d 0d 0f 01 0f 0d 0f 0f 05 0f : ................
9070 : __ __ __ BYT 0d 0f 0d 05 0f 0d 0f 0e 05 05 0f 05 05 0f 05 0f : ................
9080 : __ __ __ BYT 0d 05 05 0f 05 05 0f 05 0f 05 05 0f 05 0f 0f 0f : ................
9090 : __ __ __ BYT 0f 0d 05 05 05 05 05 0f 0f 0f 0f 05 0f 0f 0f 0e : ................
90a0 : __ __ __ BYT 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0f 0f 0e 0e 0f : ................
90b0 : __ __ __ BYT 0f 0f 05 0f 0f 0f 0f 0f 05 0f 0f 0f 0f 0f 0f 0f : ................
90c0 : __ __ __ BYT 0e 0e 0e 0e 0e 0e 0e 0e                         : ........
--------------------------------------------------------------------
font_lc_oz_co:
9100 : __ __ __ BYT 0e 0e 0e 0f 0f 0e 0e 0e 0e 0e 0e 0e 0e 0f 0e 01 : ................
9110 : __ __ __ BYT 0e 0e 0f 0f 0f 0e 0f 0f 0f 0f 0e 0e 0f 0f 0f 0f : ................
9120 : __ __ __ BYT 0f 0f 0f 0e 0e 0e 0e 0e 0f 0d 01 0f 0d 01 0f 0d : ................
9130 : __ __ __ BYT 01 0d 01 0d 0d 01 0d 0d 01 0f 0d 0f 01 0d 01 0d : ................
9140 : __ __ __ BYT 0f 01 0f 01 01 0f 01 0d 0f 01 0f 0d 01 0e 0e 0e : ................
9150 : __ __ __ BYT 05 0f 0d 0f 0f 0d 0f 0f 0d 0f 0f 0f 0d 0f 0f 0f : ................
9160 : __ __ __ BYT 0f 0d 0f 0f 01 0f 0d 0f 0f 0d 0f 0d 0f 0d 0f 0f : ................
9170 : __ __ __ BYT 0f 01 0f 0f 0d 0e 0e 0e 05 05 0f 05 0f 0f 05 05 : ................
9180 : __ __ __ BYT 0f 05 0f 0f 05 05 0f 05 05 0f 05 0f 0d 05 0f 05 : ................
9190 : __ __ __ BYT 05 0f 05 0f 05 0f 0f 05 0f 0d 05 05 0f 0f 0e 0e : ................
91a0 : __ __ __ BYT 0e 0f 0f 05 0e 0f 0f 0e 05 0e 0f 0e 0e 0e 0e 0e : ................
91b0 : __ __ __ BYT 0e 0e 0f 0f 0f 0f 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e : ................
91c0 : __ __ __ BYT 05 0f 0e 0e 0e 0e 0e 0e                         : ........
--------------------------------------------------------------------
font_dig_co:
9200 : __ __ __ BYT 0f 0d 01 01 0f 0d 01 0d 01 01 0d 0f 01 0f 0d 01 : ................
9210 : __ __ __ BYT 0f 0d 01 0f 0d 01 0f 0d 01 0d 01 01 0f 0f 01 01 : ................
9220 : __ __ __ BYT 0f 0f 0f 0f 01 01 01 0e 0f 0f 01 0d 0f 0d 01 0f : ................
9230 : __ __ __ BYT 0f 0d 0f 0f 0d 0f 0d 01 0f 0d 01 0f 0f 0d 0f 0d : ................
9240 : __ __ __ BYT 01 0f 0f 0d 0d 0f 0d 0d 0f 0e 0f 0d 0d 0d 0d 0e : ................
9250 : __ __ __ BYT 05 0f 0d 0f 05 0f 0f 0f 0f 0f 05 05 0f 05 0f 0d : ................
9260 : __ __ __ BYT 05 0f 0d 0f 0f 0e 05 0f 0d 05 0f 0f 0f 0f 0f 0f : ................
9270 : __ __ __ BYT 0d 0f 0f 0f 0f 0e 0e 0e 05 05 0f 05 05 05 0f 05 : ................
9280 : __ __ __ BYT 05 0f 0f 0f 05 05 05 0f 05 05 0f 0f 05 0e 05 05 : ................
9290 : __ __ __ BYT 0f 05 05 0f 0f 0f 05 05 0f 05 0e 0e 0e 0e 0e 0e : ................
92a0 : __ __ __ BYT 0e 0f 0f 0e 0e 0e 0f 0f 0f 0f 0e 0e 0f 0f 0f 0e : ................
92b0 : __ __ __ BYT 0e 0e 0e 0e 0f 0e 0f 0f 0f 0f 0f 0e 0e 0f 0f 05 : ................
92c0 : __ __ __ BYT 05 0e 0e 0e 0e 0e 0e 0e                         : ........
--------------------------------------------------------------------
font_sym_co:
9300 : __ __ __ BYT 0f 0d 01 0d 01 01 0e 0f 0f 0e 0e 0e 0e 0f 0e 0f : ................
9310 : __ __ __ BYT 0d 01 01 0e 0e 0e 0e 0d 01 0d 01 0f 01 0d 01 01 : ................
9320 : __ __ __ BYT 0e 0d 01 0e 0e 0e 0d 01 0f 0d 01 0f 0f 0d 0d 0f : ................
9330 : __ __ __ BYT 01 0e 0e 0e 0f 0f 01 0f 0f 0f 0d 0f 0d 01 0f 0f : ................
9340 : __ __ __ BYT 0d 0f 0f 0d 0f 0f 0d 0e 0d 0f 0f 0d 0d 01 0f 0d : ................
9350 : __ __ __ BYT 0f 0f 0d 05 0f 0d 0f 0d 0f 0f 0f 0d 01 0f 0d 0f : ................
9360 : __ __ __ BYT 0f 05 0e 0f 0d 01 0e 0f 0f 05 0f 0e 0f 0f 0f 0f : ................
9370 : __ __ __ BYT 0e 05 0f 0f 0d 0f 0f 0f 05 05 0f 05 0f 0f 0f 0e : ................
9380 : __ __ __ BYT 0f 0f 0e 0f 0e 0f 0f 0f 0e 05 0e 0e 0e 0e 0e 05 : ................
9390 : __ __ __ BYT 05 05 0f 0f 0e 05 05 0e 0e 05 0f 05 05 0f 0f 05 : ................
93a0 : __ __ __ BYT 0e 0e 0e 0e 0f 0f 0e 0e 0f 0f 0f 0e 0e 0e 0f 0e : ................
93b0 : __ __ __ BYT 0e 0f 0d 0e 0e 0e 0e 0f 0e 0d 0d 0d 0d 0d 0e 0e : ................
93c0 : __ __ __ BYT 0e 0e 0e 0e 0e 0d 0f 0e                         : ........
--------------------------------------------------------------------
uii_data:
93c8 : __ __ __ BSS	513
--------------------------------------------------------------------
uii_status:
95c9 : __ __ __ BSS	257
--------------------------------------------------------------------
_uii_fp:
9700 : __ __ __ BSS	128
--------------------------------------------------------------------
hdr:
9780 : __ __ __ BSS	1084
--------------------------------------------------------------------
modplay:
9bbc : __ __ __ BSS	938
--------------------------------------------------------------------
BLIT_CODE:
a000 : __ __ __ BSS	224
--------------------------------------------------------------------
tbuffer:
a0e0 : __ __ __ BSS	320
--------------------------------------------------------------------
row_sin:
a220 : __ __ __ BSS	200
--------------------------------------------------------------------
row_buf:
a300 : __ __ __ BSS	160
--------------------------------------------------------------------
tex_flat:
a3a0 : __ __ __ BSS	1024
