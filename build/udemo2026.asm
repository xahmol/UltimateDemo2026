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
080e : 8e ff 16 STX $16ff ; (spentry + 0)
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
; 102, "/home/xahmol/git/UltimateDemo2026/src/main.c"
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
0a36 : a9 c1 __ LDA #$c1
0a38 : 8d 18 03 STA $0318 
0a3b : a9 0e __ LDA #$0e
0a3d : 8d 19 03 STA $0319 
0a40 : a9 00 __ LDA #$00
0a42 : 85 16 __ STA P9 
0a44 : a9 11 __ LDA #$11
0a46 : 85 17 __ STA P10 
0a48 : 20 cc 0e JSR $0ecc ; (screen_init.s4 + 0)
0a4b : a9 92 __ LDA #$92
0a4d : 85 10 __ STA P3 
0a4f : a9 11 __ LDA #$11
0a51 : 85 11 __ STA P4 
0a53 : 20 d7 10 JSR $10d7 ; (screen_info.s4 + 0)
0a56 : a9 00 __ LDA #$00
0a58 : 8d 09 dc STA $dc09 
0a5b : 8d 08 dc STA $dc08 
0a5e : 85 56 __ STA T3 + 0 
.l5:
0a60 : 20 b3 11 JSR $11b3 ; (uii_detect.s4 + 0)
0a63 : aa __ __ TAX
0a64 : d0 07 __ BNE $0a6d ; (main.s7 + 0)
.s6:
0a66 : ad 09 dc LDA $dc09 
0a69 : c9 0a __ CMP #$0a
0a6b : 90 f3 __ BCC $0a60 ; (main.l5 + 0)
.s7:
0a6d : 20 b3 11 JSR $11b3 ; (uii_detect.s4 + 0)
0a70 : aa __ __ TAX
0a71 : d0 3b __ BNE $0aae ; (main.s9 + 0)
.s8:
0a73 : 85 12 __ STA P5 
0a75 : a9 2d __ LDA #$2d
0a77 : 85 10 __ STA P3 
0a79 : a9 12 __ LDA #$12
0a7b : 85 14 __ STA P7 
0a7d : a9 12 __ LDA #$12
0a7f : 85 11 __ STA P4 
0a81 : a9 33 __ LDA #$33
0a83 : 85 13 __ STA P6 
0a85 : 20 d4 11 JSR $11d4 ; (screen_result.s4 + 0)
0a88 : a9 c7 __ LDA #$c7
0a8a : 85 12 __ STA P5 
0a8c : a9 12 __ LDA #$12
0a8e : 85 13 __ STA P6 
0a90 : a9 13 __ LDA #$13
0a92 : a2 00 __ LDX #$00
.s72:
0a94 : 86 14 __ STX P7 
0a96 : 85 15 __ STA P8 
0a98 : 20 40 12 JSR $1240 ; (screen_error_exit.s4 + 0)
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
0ab0 : 8d fd 76 STA $76fd ; (uii_target + 0)
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
0ac9 : 20 1b 13 JSR $131b ; (uii_sendcommand.s4 + 0)
0acc : 20 96 13 JSR $1396 ; (uii_readdata.s4 + 0)
0acf : 20 c6 13 JSR $13c6 ; (uii_readstatus.s4 + 0)
0ad2 : 20 24 14 JSR $1424 ; (uii_accept.s4 + 0)
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
0ae8 : 20 ec 12 JSR $12ec ; (uci_to_upper@proxy + 0)
0aeb : 4c f9 0a JMP $0af9 ; (main.s12 + 0)
.s10:
0aee : a2 ff __ LDX #$ff
.l11:
0af0 : e8 __ __ INX
0af1 : bd f7 12 LDA $12f7,x 
0af4 : 9d 93 bf STA $bf93,x ; (detail[0] + 0)
0af7 : d0 f7 __ BNE $0af0 ; (main.l11 + 0)
.s12:
0af9 : a9 2d __ LDA #$2d
0afb : 85 10 __ STA P3 
0afd : a9 12 __ LDA #$12
0aff : 85 11 __ STA P4 
0b01 : 20 c8 11 JSR $11c8 ; (screen_result@proxy + 0)
0b04 : 20 f6 13 JSR $13f6 ; (uii_get_hwinfo.s4 + 0)
0b07 : ad c9 95 LDA $95c9 ; (uii_status[0] + 0)
0b0a : c9 30 __ CMP #$30
0b0c : d0 2e __ BNE $0b3c ; (main.s13 + 0)
.s66:
0b0e : ad ca 95 LDA $95ca ; (uii_status[0] + 1)
0b11 : c9 30 __ CMP #$30
0b13 : d0 27 __ BNE $0b3c ; (main.s13 + 0)
.s67:
0b15 : 20 ec 12 JSR $12ec ; (uci_to_upper@proxy + 0)
0b18 : aa __ __ TAX
0b19 : f0 21 __ BEQ $0b3c ; (main.s13 + 0)
.s68:
0b1b : a9 01 __ LDA #$01
0b1d : 85 0f __ STA P2 
0b1f : a9 14 __ LDA #$14
0b21 : 85 0e __ STA P1 
0b23 : a9 66 __ LDA #$66
0b25 : 85 0d __ STA P0 
0b27 : 20 32 11 JSR $1132 ; (cwin_put_string.s4 + 0)
0b2a : a9 93 __ LDA #$93
0b2c : 85 0d __ STA P0 
0b2e : a9 03 __ LDA #$03
0b30 : 85 0f __ STA P2 
0b32 : a9 bf __ LDA #$bf
0b34 : 85 0e __ STA P1 
0b36 : 20 32 11 JSR $1132 ; (cwin_put_string.s4 + 0)
0b39 : 20 de 10 JSR $10de ; (cwin_cursor_newline.s4 + 0)
.s13:
0b3c : a9 71 __ LDA #$71
0b3e : 85 10 __ STA P3 
0b40 : a9 14 __ LDA #$14
0b42 : 85 11 __ STA P4 
0b44 : 20 d7 10 JSR $10d7 ; (screen_info.s4 + 0)
0b47 : 20 81 14 JSR $1481 ; (detect_reu.s4 + 0)
0b4a : c9 10 __ CMP #$10
0b4c : b0 03 __ BCS $0b51 ; (main.s14 + 0)
0b4e : 4c 9a 0e JMP $0e9a ; (main.s62 + 0)
.s14:
0b51 : a9 16 __ LDA #$16
0b53 : 85 14 __ STA P7 
0b55 : a9 00 __ LDA #$00
0b57 : 85 13 __ STA P6 
0b59 : 20 f4 7b JSR $7bf4 ; (screen_result@proxy + 0)
0b5c : a9 06 __ LDA #$06
0b5e : 85 10 __ STA P3 
0b60 : a9 16 __ LDA #$16
0b62 : 85 11 __ STA P4 
0b64 : 20 d7 10 JSR $10d7 ; (screen_info.s4 + 0)
0b67 : 20 1d 16 JSR $161d ; (turbo_detect.s4 + 0)
0b6a : a9 f5 __ LDA #$f5
0b6c : 85 10 __ STA P3 
0b6e : a9 16 __ LDA #$16
0b70 : 85 11 __ STA P4 
0b72 : a5 1b __ LDA ACCU + 0 
0b74 : d0 1b __ BNE $0b91 ; (main.s36 + 0)
.s15:
0b76 : c6 12 __ DEC P5 
0b78 : a9 00 __ LDA #$00
0b7a : 85 13 __ STA P6 
0b7c : a9 17 __ LDA #$17
0b7e : 85 14 __ STA P7 
0b80 : 20 d4 11 JSR $11d4 ; (screen_result.s4 + 0)
0b83 : a9 15 __ LDA #$15
0b85 : 85 10 __ STA P3 
0b87 : a9 17 __ LDA #$17
0b89 : 85 11 __ STA P4 
0b8b : 20 8f 12 JSR $128f ; (screen_hint.s4 + 0)
0b8e : 4c 32 0c JMP $0c32 ; (main.s16 + 0)
.s36:
0b91 : c9 02 __ CMP #$02
0b93 : d0 14 __ BNE $0ba9 ; (main.s37 + 0)
.s61:
0b95 : a9 17 __ LDA #$17
0b97 : a2 37 __ LDX #$37
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
0bad : a9 16 __ LDA #$16
0baf : a2 f5 __ LDX #$f5
0bb1 : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s41:
0bb4 : 20 fb 16 JSR $16fb ; (turbo_get.s3 + 0)
0bb7 : 29 0f __ AND #$0f
0bb9 : c9 0e __ CMP #$0e
0bbb : d0 07 __ BNE $0bc4 ; (main.s42 + 0)
.s60:
0bbd : a9 17 __ LDA #$17
0bbf : a2 3e __ LDX #$3e
0bc1 : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s42:
0bc4 : c9 0d __ CMP #$0d
0bc6 : d0 07 __ BNE $0bcf ; (main.s43 + 0)
.s59:
0bc8 : a9 17 __ LDA #$17
0bca : a2 45 __ LDX #$45
0bcc : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s43:
0bcf : c9 0c __ CMP #$0c
0bd1 : d0 07 __ BNE $0bda ; (main.s44 + 0)
.s58:
0bd3 : a9 17 __ LDA #$17
0bd5 : a2 4c __ LDX #$4c
0bd7 : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s44:
0bda : c9 0b __ CMP #$0b
0bdc : d0 07 __ BNE $0be5 ; (main.s45 + 0)
.s57:
0bde : a9 17 __ LDA #$17
0be0 : a2 53 __ LDX #$53
0be2 : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s45:
0be5 : c9 0a __ CMP #$0a
0be7 : d0 07 __ BNE $0bf0 ; (main.s46 + 0)
.s56:
0be9 : a9 17 __ LDA #$17
0beb : a2 5a __ LDX #$5a
0bed : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s46:
0bf0 : c9 09 __ CMP #$09
0bf2 : d0 07 __ BNE $0bfb ; (main.s47 + 0)
.s55:
0bf4 : a9 17 __ LDA #$17
0bf6 : a2 61 __ LDX #$61
0bf8 : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s47:
0bfb : c9 08 __ CMP #$08
0bfd : d0 07 __ BNE $0c06 ; (main.s48 + 0)
.s54:
0bff : a9 17 __ LDA #$17
0c01 : a2 68 __ LDX #$68
0c03 : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s48:
0c06 : c9 07 __ CMP #$07
0c08 : d0 07 __ BNE $0c11 ; (main.s49 + 0)
.s53:
0c0a : a9 17 __ LDA #$17
0c0c : a2 6f __ LDX #$6f
0c0e : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s49:
0c11 : c9 06 __ CMP #$06
0c13 : d0 07 __ BNE $0c1c ; (main.s50 + 0)
.s52:
0c15 : a9 17 __ LDA #$17
0c17 : a2 76 __ LDX #$76
0c19 : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s50:
0c1c : c9 05 __ CMP #$05
0c1e : d0 8d __ BNE $0bad ; (main.s73 + 0)
.s51:
0c20 : a9 17 __ LDA #$17
0c22 : a2 7d __ LDX #$7d
0c24 : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.l39:
0c27 : c8 __ __ INY
0c28 : b1 53 __ LDA (T0 + 0),y 
0c2a : 99 93 bf STA $bf93,y ; (detail[0] + 0)
0c2d : d0 f8 __ BNE $0c27 ; (main.l39 + 0)
.s40:
0c2f : 20 d4 11 JSR $11d4 ; (screen_result.s4 + 0)
.s16:
0c32 : a9 83 __ LDA #$83
0c34 : 85 10 __ STA P3 
0c36 : a9 17 __ LDA #$17
0c38 : 85 11 __ STA P4 
0c3a : 20 d7 10 JSR $10d7 ; (screen_info.s4 + 0)
0c3d : 20 9e 17 JSR $179e ; (audio_detect.s4 + 0)
0c40 : aa __ __ TAX
0c41 : f0 03 __ BEQ $0c46 ; (main.s17 + 0)
0c43 : 4c 9f 0d JMP $0d9f ; (main.s26 + 0)
.s17:
0c46 : a9 17 __ LDA #$17
0c48 : 85 10 __ STA P3 
0c4a : a9 18 __ LDA #$18
0c4c : 85 11 __ STA P4 
0c4e : a9 1d __ LDA #$1d
0c50 : 85 13 __ STA P6 
0c52 : a9 18 __ LDA #$18
0c54 : 85 14 __ STA P7 
0c56 : a9 18 __ LDA #$18
0c58 : a2 2e __ LDX #$2e
.s18:
0c5a : 86 53 __ STX T0 + 0 
0c5c : 85 54 __ STA T0 + 1 
0c5e : a9 00 __ LDA #$00
0c60 : 85 12 __ STA P5 
0c62 : 20 d4 11 JSR $11d4 ; (screen_result.s4 + 0)
0c65 : a5 53 __ LDA T0 + 0 
0c67 : 85 10 __ STA P3 
0c69 : a5 54 __ LDA T0 + 1 
0c6b : 85 11 __ STA P4 
0c6d : 20 8f 12 JSR $128f ; (screen_hint.s4 + 0)
.s19:
0c70 : 20 de 10 JSR $10de ; (cwin_cursor_newline.s4 + 0)
0c73 : a9 21 __ LDA #$21
0c75 : 85 10 __ STA P3 
0c77 : a9 20 __ LDA #$20
0c79 : 85 11 __ STA P4 
0c7b : 20 d7 10 JSR $10d7 ; (screen_info.s4 + 0)
0c7e : 20 de 10 JSR $10de ; (cwin_cursor_newline.s4 + 0)
0c81 : a9 94 __ LDA #$94
0c83 : 85 10 __ STA P3 
0c85 : a9 20 __ LDA #$20
0c87 : 85 11 __ STA P4 
0c89 : 20 35 20 JSR $2035 ; (screen_wait_key.s4 + 0)
0c8c : 20 b5 20 JSR $20b5 ; (gears_run.s1 + 0)
0c8f : a5 56 __ LDA T3 + 0 
0c91 : f0 03 __ BEQ $0c96 ; (main.s20 + 0)
.s25:
0c93 : 20 68 41 JSR $4168 ; (modplay_start.s4 + 0)
.s20:
0c96 : 20 dd 50 JSR $50dd ; (mandel_run.s4 + 0)
0c99 : 20 9b 55 JSR $559b ; (ball_run.s1 + 0)
0c9c : 20 ab 63 JSR $63ab ; (vectors_run.s1 + 0)
0c9f : 20 ab 68 JSR $68ab ; (plasma_run.s1 + 0)
0ca2 : 20 66 6b JSR $6b66 ; (tunnel_run.s1 + 0)
0ca5 : a9 10 __ LDA #$10
0ca7 : 8d 02 a0 STA $a002 ; (BLIT_CODE[0] + 2)
0caa : a9 03 __ LDA #$03
0cac : 8d 03 a0 STA $a003 ; (BLIT_CODE[0] + 3)
0caf : 20 f5 70 JSR $70f5 ; (scroller_run.s4 + 0)
0cb2 : a5 56 __ LDA T3 + 0 
0cb4 : f0 03 __ BEQ $0cb9 ; (main.s21 + 0)
.s24:
0cb6 : 20 0b 76 JSR $760b ; (modplay_stop.s4 + 0)
.s21:
0cb9 : a9 00 __ LDA #$00
0cbb : 85 c6 __ STA $c6 
0cbd : 20 59 16 JSR $1659 ; (turbo_set.s4 + 0)
0cc0 : a9 44 __ LDA #$44
0cc2 : 85 16 __ STA P9 
0cc4 : a9 76 __ LDA #$76
0cc6 : 85 17 __ STA P10 
0cc8 : 20 cc 0e JSR $0ecc ; (screen_init.s4 + 0)
0ccb : 20 de 10 JSR $10de ; (cwin_cursor_newline.s4 + 0)
0cce : a9 59 __ LDA #$59
0cd0 : 85 10 __ STA P3 
0cd2 : a9 76 __ LDA #$76
0cd4 : 85 11 __ STA P4 
0cd6 : 20 d7 10 JSR $10d7 ; (screen_info.s4 + 0)
0cd9 : a9 01 __ LDA #$01
0cdb : 85 12 __ STA P5 
0cdd : 20 de 10 JSR $10de ; (cwin_cursor_newline.s4 + 0)
0ce0 : a9 71 __ LDA #$71
0ce2 : 85 10 __ STA P3 
0ce4 : a9 76 __ LDA #$76
0ce6 : 85 14 __ STA P7 
0ce8 : a9 76 __ LDA #$76
0cea : 85 11 __ STA P4 
0cec : a9 77 __ LDA #$77
0cee : 85 13 __ STA P6 
0cf0 : 20 d4 11 JSR $11d4 ; (screen_result.s4 + 0)
0cf3 : a9 8d __ LDA #$8d
0cf5 : 85 10 __ STA P3 
0cf7 : a9 76 __ LDA #$76
0cf9 : 85 14 __ STA P7 
0cfb : a9 76 __ LDA #$76
0cfd : 85 11 __ STA P4 
0cff : a9 93 __ LDA #$93
0d01 : 85 13 __ STA P6 
0d03 : 20 d4 11 JSR $11d4 ; (screen_result.s4 + 0)
0d06 : a9 a2 __ LDA #$a2
0d08 : 85 10 __ STA P3 
0d0a : a9 76 __ LDA #$76
0d0c : 85 14 __ STA P7 
0d0e : a9 76 __ LDA #$76
0d10 : 85 11 __ STA P4 
0d12 : a9 a8 __ LDA #$a8
0d14 : 85 13 __ STA P6 
0d16 : 20 d4 11 JSR $11d4 ; (screen_result.s4 + 0)
0d19 : a9 ba __ LDA #$ba
0d1b : 85 10 __ STA P3 
0d1d : a9 76 __ LDA #$76
0d1f : 85 14 __ STA P7 
0d21 : a9 76 __ LDA #$76
0d23 : 85 11 __ STA P4 
0d25 : a9 c0 __ LDA #$c0
0d27 : 85 13 __ STA P6 
0d29 : 20 d4 11 JSR $11d4 ; (screen_result.s4 + 0)
0d2c : a9 d4 __ LDA #$d4
0d2e : 85 10 __ STA P3 
0d30 : a9 76 __ LDA #$76
0d32 : 85 14 __ STA P7 
0d34 : a9 76 __ LDA #$76
0d36 : 85 11 __ STA P4 
0d38 : a9 da __ LDA #$da
0d3a : 85 13 __ STA P6 
0d3c : 20 d4 11 JSR $11d4 ; (screen_result.s4 + 0)
0d3f : a9 f0 __ LDA #$f0
0d41 : 85 10 __ STA P3 
0d43 : a9 77 __ LDA #$77
0d45 : 85 14 __ STA P7 
0d47 : a9 76 __ LDA #$76
0d49 : 85 11 __ STA P4 
0d4b : a9 00 __ LDA #$00
0d4d : 85 13 __ STA P6 
0d4f : 20 d4 11 JSR $11d4 ; (screen_result.s4 + 0)
0d52 : a5 56 __ LDA T3 + 0 
0d54 : f0 13 __ BEQ $0d69 ; (main.s22 + 0)
.s23:
0d56 : a9 ca __ LDA #$ca
0d58 : 85 10 __ STA P3 
0d5a : a9 77 __ LDA #$77
0d5c : 85 14 __ STA P7 
0d5e : a9 1f __ LDA #$1f
0d60 : 85 11 __ STA P4 
0d62 : a9 12 __ LDA #$12
0d64 : 85 13 __ STA P6 
0d66 : 20 d4 11 JSR $11d4 ; (screen_result.s4 + 0)
.s22:
0d69 : 20 de 10 JSR $10de ; (cwin_cursor_newline.s4 + 0)
0d6c : a9 29 __ LDA #$29
0d6e : 85 10 __ STA P3 
0d70 : a9 77 __ LDA #$77
0d72 : 85 11 __ STA P4 
0d74 : 20 d7 10 JSR $10d7 ; (screen_info.s4 + 0)
0d77 : a9 46 __ LDA #$46
0d79 : 85 10 __ STA P3 
0d7b : a9 77 __ LDA #$77
0d7d : 85 11 __ STA P4 
0d7f : 20 d7 10 JSR $10d7 ; (screen_info.s4 + 0)
0d82 : 20 de 10 JSR $10de ; (cwin_cursor_newline.s4 + 0)
0d85 : a9 00 __ LDA #$00
0d87 : 85 10 __ STA P3 
0d89 : 85 11 __ STA P4 
0d8b : 20 35 20 JSR $2035 ; (screen_wait_key.s4 + 0)
0d8e : a9 0e __ LDA #$0e
0d90 : 8d 20 d0 STA $d020 
0d93 : a9 06 __ LDA #$06
0d95 : 8d 21 d0 STA $d021 
0d98 : a9 00 __ LDA #$00
0d9a : 85 1b __ STA ACCU + 0 
0d9c : 4c a1 0a JMP $0aa1 ; (main.s3 + 0)
.s26:
0d9f : ad 21 df LDA $df21 
0da2 : 85 55 __ STA T2 + 0 
0da4 : 85 0f __ STA P2 
0da6 : a9 8f __ LDA #$8f
0da8 : 85 0d __ STA P0 
0daa : a9 bf __ LDA #$bf
0dac : 85 0e __ STA P1 
0dae : 20 4d 18 JSR $184d ; (fmt_dec.s4 + 0)
0db1 : a9 93 __ LDA #$93
0db3 : 85 0d __ STA P0 
0db5 : a9 bf __ LDA #$bf
0db7 : 85 0e __ STA P1 
0db9 : a9 8f __ LDA #$8f
0dbb : 85 0f __ STA P2 
0dbd : a9 bf __ LDA #$bf
0dbf : 85 10 __ STA P3 
0dc1 : a2 ff __ LDX #$ff
.l27:
0dc3 : e8 __ __ INX
0dc4 : bd fe 12 LDA $12fe,x 
0dc7 : 9d 93 bf STA $bf93,x ; (detail[0] + 0)
0dca : d0 f7 __ BNE $0dc3 ; (main.l27 + 0)
.s28:
0dcc : 20 9d 18 JSR $189d ; (strcat.s4 + 0)
0dcf : a9 18 __ LDA #$18
0dd1 : 85 11 __ STA P4 
0dd3 : a9 17 __ LDA #$17
0dd5 : 85 10 __ STA P3 
0dd7 : 20 c8 11 JSR $11c8 ; (screen_result@proxy + 0)
0dda : a5 55 __ LDA T2 + 0 
0ddc : d0 03 __ BNE $0de1 ; (main.s29 + 0)
0dde : 4c 70 0c JMP $0c70 ; (main.s19 + 0)
.s29:
0de1 : a9 00 __ LDA #$00
0de3 : 8d 3e bf STA $bf3e ; (media_count + 0)
0de6 : a9 d0 __ LDA #$d0
0de8 : 85 10 __ STA P3 
0dea : a9 18 __ LDA #$18
0dec : 85 11 __ STA P4 
0dee : 20 d7 10 JSR $10d7 ; (screen_info.s4 + 0)
0df1 : a9 00 __ LDA #$00
0df3 : 85 10 __ STA P3 
0df5 : 8d 12 bf STA $bf12 ; (cmd[0] + 0)
0df8 : a9 02 __ LDA #$02
0dfa : 85 0f __ STA P2 
0dfc : a9 01 __ LDA #$01
0dfe : 8d fd 76 STA $76fd ; (uii_target + 0)
0e01 : a9 17 __ LDA #$17
0e03 : 8d 13 bf STA $bf13 ; (cmd[0] + 1)
0e06 : a9 12 __ LDA #$12
0e08 : 85 0d __ STA P0 
0e0a : a9 bf __ LDA #$bf
0e0c : 85 0e __ STA P1 
0e0e : 20 1b 13 JSR $131b ; (uii_sendcommand.s4 + 0)
0e11 : 20 c6 13 JSR $13c6 ; (uii_readstatus.s4 + 0)
0e14 : 20 24 14 JSR $1424 ; (uii_accept.s4 + 0)
0e17 : 20 e1 18 JSR $18e1 ; (modplay_load.s4 + 0)
0e1a : a5 1b __ LDA ACCU + 0 
0e1c : d0 45 __ BNE $0e63 ; (main.s33 + 0)
.s30:
0e1e : a9 3f __ LDA #$3f
0e20 : 85 13 __ STA P6 
0e22 : a9 bf __ LDA #$bf
0e24 : 85 16 __ STA P9 
0e26 : a9 bf __ LDA #$bf
0e28 : 85 14 __ STA P7 
0e2a : a9 3e __ LDA #$3e
0e2c : 85 15 __ STA P8 
0e2e : 20 28 1a JSR $1a28 ; (uii_scan_media.s4 + 0)
0e31 : ad 3e bf LDA $bf3e ; (media_count + 0)
0e34 : 85 15 __ STA P8 
0e36 : a9 16 __ LDA #$16
0e38 : 85 16 __ STA P9 
0e3a : a9 bf __ LDA #$bf
0e3c : 85 17 __ STA P10 
0e3e : 20 1f 1c JSR $1c1f ; (uii_find_media_path.s4 + 0)
0e41 : a5 1b __ LDA ACCU + 0 
0e43 : f0 07 __ BEQ $0e4c ; (main.s31 + 0)
.s32:
0e45 : 20 e1 18 JSR $18e1 ; (modplay_load.s4 + 0)
0e48 : a5 1b __ LDA ACCU + 0 
0e4a : d0 17 __ BNE $0e63 ; (main.s33 + 0)
.s31:
0e4c : a9 ca __ LDA #$ca
0e4e : 85 10 __ STA P3 
0e50 : a9 1f __ LDA #$1f
0e52 : 85 11 __ STA P4 
0e54 : a9 e7 __ LDA #$e7
0e56 : 85 13 __ STA P6 
0e58 : a9 1f __ LDA #$1f
0e5a : 85 14 __ STA P7 
0e5c : a9 20 __ LDA #$20
0e5e : a2 00 __ LDX #$00
0e60 : 4c 5a 0c JMP $0c5a ; (main.s18 + 0)
.s33:
0e63 : 20 06 1d JSR $1d06 ; (modplay_init.s4 + 0)
0e66 : a9 ca __ LDA #$ca
0e68 : 85 10 __ STA P3 
0e6a : a9 1f __ LDA #$1f
0e6c : 85 11 __ STA P4 
0e6e : a5 1b __ LDA ACCU + 0 
0e70 : d0 09 __ BNE $0e7b ; (main.s35 + 0)
.s34:
0e72 : 85 12 __ STA P5 
0e74 : a9 1f __ LDA #$1f
0e76 : a2 d8 __ LDX #$d8
0e78 : 4c 90 0e JMP $0e90 ; (main.s74 + 0)
.s35:
0e7b : a9 01 __ LDA #$01
0e7d : e6 56 __ INC T3 + 0 
0e7f : 85 12 __ STA P5 
0e81 : 8d 4b 9c STA $9c4b ; (modplay.stereo + 0)
0e84 : 8d 4d 9c STA $9c4d ; (modplay.loop_song + 0)
0e87 : a9 a0 __ LDA #$a0
0e89 : 8d 4a 9c STA $9c4a ; (modplay.master_volume + 0)
0e8c : a9 1f __ LDA #$1f
0e8e : a2 d0 __ LDX #$d0
.s74:
0e90 : 86 13 __ STX P6 
0e92 : 85 14 __ STA P7 
0e94 : 20 d4 11 JSR $11d4 ; (screen_result.s4 + 0)
0e97 : 4c 70 0c JMP $0c70 ; (main.s19 + 0)
.s62:
0e9a : a2 00 __ LDX #$00
0e9c : 86 12 __ STX P5 
0e9e : aa __ __ TAX
0e9f : f0 06 __ BEQ $0ea7 ; (main.s63 + 0)
.s65:
0ea1 : a9 15 __ LDA #$15
0ea3 : a2 b2 __ LDX #$b2
0ea5 : 90 04 __ BCC $0eab ; (main.s64 + 0)
.s63:
0ea7 : a9 12 __ LDA #$12
0ea9 : a2 33 __ LDX #$33
.s64:
0eab : 86 13 __ STX P6 
0ead : 85 14 __ STA P7 
0eaf : 20 f4 7b JSR $7bf4 ; (screen_result@proxy + 0)
0eb2 : a9 c9 __ LDA #$c9
0eb4 : 85 12 __ STA P5 
0eb6 : a9 15 __ LDA #$15
0eb8 : 85 13 __ STA P6 
0eba : a9 15 __ LDA #$15
0ebc : a2 e0 __ LDX #$e0
0ebe : 4c 94 0a JMP $0a94 ; (main.s72 + 0)
--------------------------------------------------------------------
nmi_handler: ; nmi_handler()->void
;  97, "/home/xahmol/git/UltimateDemo2026/src/main.c"
.s1:
0ec1 : 48 __ __ PHA
0ec2 : 8a __ __ TXA
0ec3 : 48 __ __ PHA
0ec4 : 98 __ __ TYA
0ec5 : 48 __ __ PHA
.s3:
0ec6 : 68 __ __ PLA
0ec7 : a8 __ __ TAY
0ec8 : 68 __ __ PLA
0ec9 : aa __ __ TAX
0eca : 68 __ __ PLA
0ecb : 40 __ __ RTI
--------------------------------------------------------------------
screen_init: ; screen_init(const u8*)->void
;  13, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
0ecc : a9 00 __ LDA #$00
0ece : 85 0d __ STA P0 
0ed0 : 85 43 __ STA T0 + 0 
0ed2 : 85 0e __ STA P1 
0ed4 : 85 10 __ STA P3 
0ed6 : 20 71 0f JSR $0f71 ; (vic_setmode@proxy + 0)
0ed9 : a9 00 __ LDA #$00
0edb : 8d 96 87 STA $8796 ; (cw.sx + 0)
0ede : 8d 97 87 STA $8797 ; (cw.sy + 0)
0ee1 : 8d 9a 87 STA $879a ; (cw.cx + 0)
0ee4 : 8d 9b 87 STA $879b ; (cw.cy + 0)
0ee7 : a2 19 __ LDX #$19
0ee9 : 8e 99 87 STX $8799 ; (cw.wy + 0)
0eec : 8d 20 d0 STA $d020 
0eef : 8d 21 d0 STA $d021 
0ef2 : 8d 9e 87 STA $879e ; (cw.sp + 0)
0ef5 : 8d a0 87 STA $87a0 ; (cw.cp + 0)
0ef8 : a9 04 __ LDA #$04
0efa : 8d 9f 87 STA $879f ; (cw.sp + 1)
0efd : 85 44 __ STA T0 + 1 
0eff : a9 d8 __ LDA #$d8
0f01 : 8d a1 87 STA $87a1 ; (cw.cp + 1)
0f04 : 85 46 __ STA T1 + 1 
0f06 : a2 00 __ LDX #$00
0f08 : 86 45 __ STX T1 + 0 
0f0a : a9 28 __ LDA #$28
0f0c : 8d 98 87 STA $8798 ; (cw.wx + 0)
.l8:
0f0f : 85 1b __ STA ACCU + 0 
0f11 : a0 00 __ LDY #$00
.l9:
0f13 : a9 20 __ LDA #$20
0f15 : 91 43 __ STA (T0 + 0),y 
0f17 : a9 01 __ LDA #$01
0f19 : 91 45 __ STA (T1 + 0),y 
0f1b : c8 __ __ INY
0f1c : c4 1b __ CPY ACCU + 0 
0f1e : 90 f3 __ BCC $0f13 ; (screen_init.l9 + 0)
.l6:
0f20 : e8 __ __ INX
0f21 : ec 99 87 CPX $8799 ; (cw.wy + 0)
0f24 : 90 2f __ BCC $0f55 ; (screen_init.s5 + 0)
.s7:
0f26 : a9 00 __ LDA #$00
0f28 : 85 12 __ STA P5 
0f2a : a9 10 __ LDA #$10
0f2c : 85 14 __ STA P7 
0f2e : a9 05 __ LDA #$05
0f30 : 85 15 __ STA P8 
0f32 : a9 c6 __ LDA #$c6
0f34 : 85 13 __ STA P6 
0f36 : 20 cb 0f JSR $0fcb ; (header_line.s4 + 0)
0f39 : e6 12 __ INC P5 
0f3b : a5 16 __ LDA P9 ; (title + 0)
0f3d : 85 13 __ STA P6 
0f3f : a5 17 __ LDA P10 ; (title + 1)
0f41 : 85 14 __ STA P7 
0f43 : a9 0d __ LDA #$0d
0f45 : 85 15 __ STA P8 
0f47 : 20 cb 0f JSR $0fcb ; (header_line.s4 + 0)
0f4a : a9 00 __ LDA #$00
0f4c : 8d 9a 87 STA $879a ; (cw.cx + 0)
0f4f : a9 03 __ LDA #$03
0f51 : 8d 9b 87 STA $879b ; (cw.cy + 0)
.s3:
0f54 : 60 __ __ RTS
.s5:
0f55 : a5 43 __ LDA T0 + 0 
0f57 : 69 28 __ ADC #$28
0f59 : 85 43 __ STA T0 + 0 
0f5b : 90 03 __ BCC $0f60 ; (screen_init.s11 + 0)
.s10:
0f5d : e6 44 __ INC T0 + 1 
0f5f : 18 __ __ CLC
.s11:
0f60 : a5 45 __ LDA T1 + 0 
0f62 : 69 28 __ ADC #$28
0f64 : 85 45 __ STA T1 + 0 
0f66 : 90 02 __ BCC $0f6a ; (screen_init.s13 + 0)
.s12:
0f68 : e6 46 __ INC T1 + 1 
.s13:
0f6a : ad 98 87 LDA $8798 ; (cw.wx + 0)
0f6d : f0 b1 __ BEQ $0f20 ; (screen_init.l6 + 0)
0f6f : d0 9e __ BNE $0f0f ; (screen_init.l8 + 0)
--------------------------------------------------------------------
vic_setmode@proxy: ; vic_setmode@proxy
0f71 : a9 04 __ LDA #$04
0f73 : 85 0f __ STA P2 
0f75 : a9 18 __ LDA #$18
0f77 : 85 11 __ STA P4 
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  97, "/home/xahmol/oscar64/include/c64/vic.h"
.s4:
0f79 : a4 0d __ LDY P0 ; (mode + 0)
0f7b : c0 02 __ CPY #$02
0f7d : d0 09 __ BNE $0f88 ; (vic_setmode.s5 + 0)
.s10:
0f7f : a9 5b __ LDA #$5b
0f81 : 8d 11 d0 STA $d011 
.s8:
0f84 : a9 08 __ LDA #$08
0f86 : d0 0c __ BNE $0f94 ; (vic_setmode.s7 + 0)
.s5:
0f88 : b0 36 __ BCS $0fc0 ; (vic_setmode.s6 + 0)
.s9:
0f8a : a9 1b __ LDA #$1b
0f8c : 8d 11 d0 STA $d011 
0f8f : 98 __ __ TYA
0f90 : f0 f2 __ BEQ $0f84 ; (vic_setmode.s8 + 0)
.s11:
0f92 : a9 18 __ LDA #$18
.s7:
0f94 : 8d 16 d0 STA $d016 
0f97 : ad 00 dd LDA $dd00 
0f9a : 29 fc __ AND #$fc
0f9c : 85 1b __ STA ACCU + 0 
0f9e : a5 0f __ LDA P2 ; (text + 1)
0fa0 : 0a __ __ ASL
0fa1 : 2a __ __ ROL
0fa2 : 29 01 __ AND #$01
0fa4 : 2a __ __ ROL
0fa5 : 49 03 __ EOR #$03
0fa7 : 05 1b __ ORA ACCU + 0 
0fa9 : 8d 00 dd STA $dd00 
0fac : a5 0f __ LDA P2 ; (text + 1)
0fae : 29 3c __ AND #$3c
0fb0 : 0a __ __ ASL
0fb1 : 0a __ __ ASL
0fb2 : 85 1b __ STA ACCU + 0 
0fb4 : a5 11 __ LDA P4 ; (font + 1)
0fb6 : 29 38 __ AND #$38
0fb8 : 4a __ __ LSR
0fb9 : 4a __ __ LSR
0fba : 05 1b __ ORA ACCU + 0 
0fbc : 8d 18 d0 STA $d018 
.s3:
0fbf : 60 __ __ RTS
.s6:
0fc0 : a9 3b __ LDA #$3b
0fc2 : 8d 11 d0 STA $d011 
0fc5 : c0 03 __ CPY #$03
0fc7 : d0 c9 __ BNE $0f92 ; (vic_setmode.s11 + 0)
0fc9 : f0 b9 __ BEQ $0f84 ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
header_line: ; header_line(u8,const u8*,u8)->void
;  41, "/home/xahmol/git/UltimateDemo2026/src/screen.c"
.s4:
0fcb : a5 13 __ LDA P6 ; (text + 0)
0fcd : 85 0d __ STA P0 
0fcf : a5 14 __ LDA P7 ; (text + 1)
0fd1 : 85 0e __ STA P1 
0fd3 : 20 aa 10 JSR $10aa ; (strlen.s4 + 0)
0fd6 : a5 12 __ LDA P5 ; (row + 0)
0fd8 : 0a __ __ ASL
0fd9 : aa __ __ TAX
0fda : ad 9e 87 LDA $879e ; (cw.sp + 0)
0fdd : 7d 8c 7c ADC $7c8c,x ; (mul40[0] + 0)
0fe0 : 85 46 __ STA T2 + 0 
0fe2 : ad 9f 87 LDA $879f ; (cw.sp + 1)
0fe5 : 7d 8d 7c ADC $7c8d,x ; (mul40[0] + 1)
0fe8 : 85 47 __ STA T2 + 1 
0fea : ad a0 87 LDA $87a0 ; (cw.cp + 0)
0fed : 18 __ __ CLC
0fee : 7d 8c 7c ADC $7c8c,x ; (mul40[0] + 0)
0ff1 : 85 48 __ STA T3 + 0 
0ff3 : ad a1 87 LDA $87a1 ; (cw.cp + 1)
0ff6 : 7d 8d 7c ADC $7c8d,x ; (mul40[0] + 1)
0ff9 : 85 49 __ STA T3 + 1 
0ffb : 38 __ __ SEC
0ffc : a9 28 __ LDA #$28
0ffe : e5 1b __ SBC ACCU + 0 
1000 : a8 __ __ TAY
1001 : a9 00 __ LDA #$00
1003 : e9 00 __ SBC #$00
1005 : aa __ __ TAX
1006 : 0a __ __ ASL
1007 : 98 __ __ TYA
1008 : 69 00 __ ADC #$00
100a : 85 45 __ STA T1 + 0 
100c : 8a __ __ TXA
100d : 69 00 __ ADC #$00
100f : 4a __ __ LSR
1010 : 66 45 __ ROR T1 + 0 
1012 : a0 00 __ LDY #$00
1014 : a6 15 __ LDX P8 ; (color + 0)
.l8:
1016 : a9 a0 __ LDA #$a0
1018 : 91 46 __ STA (T2 + 0),y 
101a : 8a __ __ TXA
101b : 91 48 __ STA (T3 + 0),y 
101d : c8 __ __ INY
101e : c0 28 __ CPY #$28
1020 : d0 f4 __ BNE $1016 ; (header_line.l8 + 0)
.s9:
1022 : a9 00 __ LDA #$00
1024 : 85 4a __ STA T4 + 0 
1026 : a5 1b __ LDA ACCU + 0 
1028 : f0 1f __ BEQ $1049 ; (header_line.s5 + 0)
.s10:
102a : a0 00 __ LDY #$00
.l7:
102c : b1 13 __ LDA (P6),y ; (text + 0)
102e : 4a __ __ LSR
102f : 4a __ __ LSR
1030 : 4a __ __ LSR
1031 : 4a __ __ LSR
1032 : 4a __ __ LSR
1033 : aa __ __ TAX
1034 : bd be 7c LDA $7cbe,x ; (p2smap[0] + 0)
1037 : 51 13 __ EOR (P6),y ; (text + 0)
1039 : 09 80 __ ORA #$80
103b : 99 c1 bf STA $bfc1,y ; (buf[0] + 0)
103e : c8 __ __ INY
103f : c4 1b __ CPY ACCU + 0 
1041 : b0 04 __ BCS $1047 ; (header_line.s11 + 0)
.s6:
1043 : c0 28 __ CPY #$28
1045 : 90 e5 __ BCC $102c ; (header_line.l7 + 0)
.s11:
1047 : 84 4a __ STY T4 + 0 
.s5:
1049 : a5 45 __ LDA T1 + 0 
104b : 85 0d __ STA P0 
104d : a5 12 __ LDA P5 ; (row + 0)
104f : 85 0e __ STA P1 
1051 : a5 15 __ LDA P8 ; (color + 0)
1053 : 85 11 __ STA P4 
1055 : a9 00 __ LDA #$00
1057 : a6 4a __ LDX T4 + 0 
1059 : 9d c1 bf STA $bfc1,x ; (buf[0] + 0)
105c : a9 c1 __ LDA #$c1
105e : 85 0f __ STA P2 
1060 : a9 bf __ LDA #$bf
1062 : 85 10 __ STA P3 
--------------------------------------------------------------------
cwin_putat_string_raw: ; cwin_putat_string_raw(struct CharWin*,u8,u8,const u8*,u8)->void
; 103, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
1064 : a5 0e __ LDA P1 ; (y + 0)
1066 : 0a __ __ ASL
1067 : aa __ __ TAX
1068 : bd 8c 7c LDA $7c8c,x ; (mul40[0] + 0)
106b : 65 0d __ ADC P0 ; (x + 0)
106d : 85 1b __ STA ACCU + 0 
106f : bd 8d 7c LDA $7c8d,x ; (mul40[0] + 1)
1072 : 69 00 __ ADC #$00
1074 : 85 1c __ STA ACCU + 1 
1076 : ad 9e 87 LDA $879e ; (cw.sp + 0)
1079 : 65 1b __ ADC ACCU + 0 
107b : 85 43 __ STA T1 + 0 
107d : ad 9f 87 LDA $879f ; (cw.sp + 1)
1080 : 65 1c __ ADC ACCU + 1 
1082 : 85 44 __ STA T1 + 1 
1084 : ad a0 87 LDA $87a0 ; (cw.cp + 0)
1087 : 18 __ __ CLC
1088 : 65 1b __ ADC ACCU + 0 
108a : 85 1b __ STA ACCU + 0 
108c : ad a1 87 LDA $87a1 ; (cw.cp + 1)
108f : 65 1c __ ADC ACCU + 1 
1091 : 85 1c __ STA ACCU + 1 
1093 : a6 11 __ LDX P4 ; (color + 0)
1095 : a0 00 __ LDY #$00
1097 : b1 0f __ LDA (P2),y ; (str + 0)
1099 : f0 0a __ BEQ $10a5 ; (cwin_putat_string_raw.s3 + 0)
.l5:
109b : 91 43 __ STA (T1 + 0),y 
109d : 8a __ __ TXA
109e : 91 1b __ STA (ACCU + 0),y 
10a0 : c8 __ __ INY
10a1 : b1 0f __ LDA (P2),y ; (str + 0)
10a3 : d0 f6 __ BNE $109b ; (cwin_putat_string_raw.l5 + 0)
.s3:
10a5 : 60 __ __ RTS
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
10a6 : a5 12 __ LDA P5 
10a8 : 85 0e __ STA P1 
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
;  12, "/home/xahmol/oscar64/include/string.h"
.s4:
10aa : a9 00 __ LDA #$00
10ac : 85 1b __ STA ACCU + 0 
10ae : 85 1c __ STA ACCU + 1 
10b0 : a8 __ __ TAY
10b1 : b1 0d __ LDA (P0),y ; (str + 0)
10b3 : f0 10 __ BEQ $10c5 ; (strlen.s3 + 0)
.s6:
10b5 : a2 00 __ LDX #$00
.l7:
10b7 : c8 __ __ INY
10b8 : d0 03 __ BNE $10bd ; (strlen.s9 + 0)
.s8:
10ba : e6 0e __ INC P1 ; (str + 1)
10bc : e8 __ __ INX
.s9:
10bd : b1 0d __ LDA (P0),y ; (str + 0)
10bf : d0 f6 __ BNE $10b7 ; (strlen.l7 + 0)
.s5:
10c1 : 86 1c __ STX ACCU + 1 
10c3 : 84 1b __ STY ACCU + 0 
.s3:
10c5 : 60 __ __ RTS
--------------------------------------------------------------------
10c6 : __ __ __ BYT 75 4c 54 49 4d 41 54 45 64 45 4d 4f 32 30 32 36 : uLTIMATEdEMO2026
10d6 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
screen_info: ; screen_info(const u8*)->void
;  23, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
10d7 : a9 0f __ LDA #$0f
10d9 : 85 0f __ STA P2 
10db : 20 54 7c JSR $7c54 ; (cwin_put_string@proxy + 0)
--------------------------------------------------------------------
cwin_cursor_newline: ; cwin_cursor_newline(struct CharWin*)->void
;  44, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
10de : ad 9b 87 LDA $879b ; (cw.cy + 0)
10e1 : 18 __ __ CLC
10e2 : 69 01 __ ADC #$01
10e4 : a8 __ __ TAY
10e5 : a9 00 __ LDA #$00
10e7 : 8d 9a 87 STA $879a ; (cw.cx + 0)
10ea : 2a __ __ ROL
10eb : d0 08 __ BNE $10f5 ; (cwin_cursor_newline.s3 + 0)
.s6:
10ed : cc 99 87 CPY $8799 ; (cw.wy + 0)
10f0 : b0 03 __ BCS $10f5 ; (cwin_cursor_newline.s3 + 0)
.s5:
10f2 : ee 9b 87 INC $879b ; (cw.cy + 0)
.s3:
10f5 : 60 __ __ RTS
--------------------------------------------------------------------
10f6 : __ __ __ BYT 5b 20 6f 6b 20 5d 00                            : [ ok ].
--------------------------------------------------------------------
10fd : __ __ __ BYT 20 20 00                                        :   .
--------------------------------------------------------------------
1100 : __ __ __ BYT 68 41 52 44 57 41 52 45 20 64 45 54 45 43 54 49 : hARDWARE dETECTI
1110 : __ __ __ BYT 4f 4e 20 20 20 56 30 2e 31 2e 30 2d 32 30 32 36 : ON   V0.1.0-2026
1120 : __ __ __ BYT 30 35 33 31 2d 31 31 34 30 00                   : 0531-1140.
--------------------------------------------------------------------
cwin_put_string@proxy: ; cwin_put_string@proxy
112a : a9 fd __ LDA #$fd
112c : 85 0d __ STA P0 
112e : a9 10 __ LDA #$10
1130 : 85 0e __ STA P1 
--------------------------------------------------------------------
cwin_put_string: ; cwin_put_string(struct CharWin*,const u8*,u8)->void
;  64, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
1132 : ad 9b 87 LDA $879b ; (cw.cy + 0)
1135 : 0a __ __ ASL
1136 : aa __ __ TAX
1137 : bd 8c 7c LDA $7c8c,x ; (mul40[0] + 0)
113a : 6d 9a 87 ADC $879a ; (cw.cx + 0)
113d : 85 1b __ STA ACCU + 0 
113f : bd 8d 7c LDA $7c8d,x ; (mul40[0] + 1)
1142 : 69 00 __ ADC #$00
1144 : 85 1c __ STA ACCU + 1 
1146 : ad 9e 87 LDA $879e ; (cw.sp + 0)
1149 : 65 1b __ ADC ACCU + 0 
114b : 85 43 __ STA T1 + 0 
114d : ad 9f 87 LDA $879f ; (cw.sp + 1)
1150 : 65 1c __ ADC ACCU + 1 
1152 : 85 44 __ STA T1 + 1 
1154 : ad a0 87 LDA $87a0 ; (cw.cp + 0)
1157 : 18 __ __ CLC
1158 : 65 1b __ ADC ACCU + 0 
115a : 85 1b __ STA ACCU + 0 
115c : ad a1 87 LDA $87a1 ; (cw.cp + 1)
115f : 65 1c __ ADC ACCU + 1 
1161 : 85 1c __ STA ACCU + 1 
1163 : a0 00 __ LDY #$00
1165 : b1 0d __ LDA (P0),y ; (str + 0)
1167 : f0 16 __ BEQ $117f ; (cwin_put_string.s5 + 0)
.l7:
1169 : 4a __ __ LSR
116a : 4a __ __ LSR
116b : 4a __ __ LSR
116c : 4a __ __ LSR
116d : 4a __ __ LSR
116e : aa __ __ TAX
116f : bd c6 7c LDA $7cc6,x ; (p2smap[0] + 0)
1172 : 51 0d __ EOR (P0),y ; (str + 0)
1174 : 91 43 __ STA (T1 + 0),y 
1176 : a5 0f __ LDA P2 ; (color + 0)
1178 : 91 1b __ STA (ACCU + 0),y 
117a : c8 __ __ INY
117b : b1 0d __ LDA (P0),y ; (str + 0)
117d : d0 ea __ BNE $1169 ; (cwin_put_string.l7 + 0)
.s5:
117f : 98 __ __ TYA
1180 : 18 __ __ CLC
1181 : 6d 9a 87 ADC $879a ; (cw.cx + 0)
1184 : cd 98 87 CMP $8798 ; (cw.wx + 0)
1187 : 90 05 __ BCC $118e ; (cwin_put_string.s3 + 0)
.s6:
1189 : a9 00 __ LDA #$00
118b : ee 9b 87 INC $879b ; (cw.cy + 0)
.s3:
118e : 8d 9a 87 STA $879a ; (cw.cx + 0)
1191 : 60 __ __ RTS
--------------------------------------------------------------------
1192 : __ __ __ BYT 77 41 49 54 49 4e 47 20 46 4f 52 20 75 4c 54 49 : wAITING FOR uLTI
11a2 : __ __ __ BYT 4d 41 54 45 20 46 49 52 4d 57 41 52 45 2e 2e 2e : MATE FIRMWARE...
11b2 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
uii_detect: ; uii_detect()->u8
; 167, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
11b3 : ad 1d df LDA $df1d 
11b6 : c9 c9 __ CMP #$c9
11b8 : d0 0b __ BNE $11c5 ; (uii_detect.s5 + 0)
.s6:
11ba : ad 1c df LDA $df1c 
11bd : 09 04 __ ORA #$04
11bf : 8d 1c df STA $df1c 
11c2 : a9 01 __ LDA #$01
11c4 : 60 __ __ RTS
.s5:
11c5 : a9 00 __ LDA #$00
.s3:
11c7 : 60 __ __ RTS
--------------------------------------------------------------------
screen_result@proxy: ; screen_result@proxy
11c8 : a9 01 __ LDA #$01
11ca : 85 12 __ STA P5 
11cc : a9 93 __ LDA #$93
11ce : 85 13 __ STA P6 
11d0 : a9 bf __ LDA #$bf
11d2 : 85 14 __ STA P7 
--------------------------------------------------------------------
screen_result: ; screen_result(const u8*,u8,const u8*)->void
;  17, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
11d4 : a9 01 __ LDA #$01
11d6 : 85 0f __ STA P2 
11d8 : 20 2a 11 JSR $112a ; (cwin_put_string@proxy + 0)
11db : 20 54 7c JSR $7c54 ; (cwin_put_string@proxy + 0)
11de : a9 29 __ LDA #$29
11e0 : 85 0d __ STA P0 
11e2 : a9 12 __ LDA #$12
11e4 : 85 0e __ STA P1 
11e6 : 20 32 11 JSR $1132 ; (cwin_put_string.s4 + 0)
11e9 : a5 12 __ LDA P5 ; (ok + 0)
11eb : d0 09 __ BNE $11f6 ; (screen_result.s7 + 0)
.s5:
11ed : e6 0f __ INC P2 
11ef : a9 12 __ LDA #$12
11f1 : a0 22 __ LDY #$22
11f3 : 4c fe 11 JMP $11fe ; (screen_result.s6 + 0)
.s7:
11f6 : a9 05 __ LDA #$05
11f8 : 85 0f __ STA P2 
11fa : a9 10 __ LDA #$10
11fc : a0 f6 __ LDY #$f6
.s6:
11fe : 84 0d __ STY P0 
1200 : 85 0e __ STA P1 
1202 : 20 32 11 JSR $1132 ; (cwin_put_string.s4 + 0)
1205 : a5 12 __ LDA P5 ; (ok + 0)
1207 : f0 04 __ BEQ $120d ; (screen_result.s8 + 0)
.s9:
1209 : a9 03 __ LDA #$03
120b : d0 02 __ BNE $120f ; (screen_result.s10 + 0)
.s8:
120d : a9 07 __ LDA #$07
.s10:
120f : 85 0f __ STA P2 
1211 : 20 2a 11 JSR $112a ; (cwin_put_string@proxy + 0)
1214 : a5 13 __ LDA P6 ; (detail + 0)
1216 : 85 0d __ STA P0 
1218 : a5 14 __ LDA P7 ; (detail + 1)
121a : 85 0e __ STA P1 
121c : 20 32 11 JSR $1132 ; (cwin_put_string.s4 + 0)
121f : 4c de 10 JMP $10de ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
1222 : __ __ __ BYT 5b 66 41 49 4c 5d 00                            : [fAIL].
--------------------------------------------------------------------
1229 : __ __ __ BYT 20 3a 20 00                                     :  : .
--------------------------------------------------------------------
122d : __ __ __ BYT 75 63 69 20 20 00                               : uci  .
--------------------------------------------------------------------
1233 : __ __ __ BYT 6e 4f 54 20 44 45 54 45 43 54 45 44 00          : nOT DETECTED.
--------------------------------------------------------------------
screen_error_exit: ; screen_error_exit(const u8*,const u8*)->void
;  32, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
1240 : a9 02 __ LDA #$02
1242 : 85 0f __ STA P2 
1244 : 20 de 10 JSR $10de ; (cwin_cursor_newline.s4 + 0)
1247 : a5 12 __ LDA P5 ; (msg + 0)
1249 : 85 0d __ STA P0 
124b : a5 13 __ LDA P6 ; (msg + 1)
124d : 85 0e __ STA P1 
124f : 20 32 11 JSR $1132 ; (cwin_put_string.s4 + 0)
1252 : 20 de 10 JSR $10de ; (cwin_cursor_newline.s4 + 0)
1255 : a5 15 __ LDA P8 ; (hint + 1)
1257 : 05 14 __ ORA P7 ; (hint + 0)
1259 : f0 11 __ BEQ $126c ; (screen_error_exit.s5 + 0)
.s6:
125b : a0 00 __ LDY #$00
125d : b1 14 __ LDA (P7),y ; (hint + 0)
125f : f0 0b __ BEQ $126c ; (screen_error_exit.s5 + 0)
.s7:
1261 : a5 14 __ LDA P7 ; (hint + 0)
1263 : 85 10 __ STA P3 
1265 : a5 15 __ LDA P8 ; (hint + 1)
1267 : 85 11 __ STA P4 
1269 : 20 8f 12 JSR $128f ; (screen_hint.s4 + 0)
.s5:
126c : a9 01 __ LDA #$01
126e : 85 0f __ STA P2 
1270 : 20 de 10 JSR $10de ; (cwin_cursor_newline.s4 + 0)
1273 : a9 aa __ LDA #$aa
1275 : 85 0d __ STA P0 
1277 : a9 12 __ LDA #$12
1279 : 85 0e __ STA P1 
127b : 20 32 11 JSR $1132 ; (cwin_put_string.s4 + 0)
127e : 20 de 10 JSR $10de ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
cwin_getch: ; cwin_getch()->void
; 147, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
1281 : 20 e4 ff JSR $ffe4 
1284 : c9 00 __ CMP #$00
1286 : f0 f9 __ BEQ $1281 ; (cwin_getch.s4 + 0)
1288 : 85 1b __ STA ACCU + 0 
128a : a9 00 __ LDA #$00
128c : 85 1c __ STA ACCU + 1 
.s3:
128e : 60 __ __ RTS
--------------------------------------------------------------------
screen_hint: ; screen_hint(const u8*)->void
;  26, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
128f : a9 07 __ LDA #$07
1291 : 85 0f __ STA P2 
1293 : a9 12 __ LDA #$12
1295 : 85 0e __ STA P1 
1297 : a9 a4 __ LDA #$a4
1299 : 85 0d __ STA P0 
129b : 20 32 11 JSR $1132 ; (cwin_put_string.s4 + 0)
129e : 20 54 7c JSR $7c54 ; (cwin_put_string@proxy + 0)
12a1 : 4c de 10 JMP $10de ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
12a4 : __ __ __ BYT 20 20 2d 3e 20 00                               :   -> .
--------------------------------------------------------------------
12aa : __ __ __ BYT 70 52 45 53 53 20 41 20 4b 45 59 20 2d 20 45 58 : pRESS A KEY - EX
12ba : __ __ __ BYT 49 54 20 54 4f 20 62 61 73 69 63 2e 00          : IT TO basic..
--------------------------------------------------------------------
12c7 : __ __ __ BYT 6e 4f 20 75 4c 54 49 4d 41 54 45 20 63 4f 4d 4d : nO uLTIMATE cOMM
12d7 : __ __ __ BYT 41 4e 44 20 69 4e 54 45 52 46 41 43 45 20 46 4f : AND iNTERFACE FO
12e7 : __ __ __ BYT 55 4e 44 2e 00                                  : UND..
--------------------------------------------------------------------
uci_to_upper@proxy: ; uci_to_upper@proxy
12ec : a9 93 __ LDA #$93
12ee : 85 0d __ STA P0 
12f0 : a9 bf __ LDA #$bf
12f2 : 85 0e __ STA P1 
12f4 : 4c 34 14 JMP $1434 ; (uci_to_upper.s4 + 0)
--------------------------------------------------------------------
12f7 : __ __ __ BYT 75 63 69 20 6f 4b 00                            : uci oK.
--------------------------------------------------------------------
12fe : __ __ __ BYT 56 00                                           : V.
--------------------------------------------------------------------
1300 : __ __ __ BYT 66 32 20 3e 20 75 63 69 20 73 45 54 54 49 4e 47 : f2 > uci sETTING
1310 : __ __ __ BYT 53 20 3e 20 65 4e 41 42 4c 45 00                : S > eNABLE.
--------------------------------------------------------------------
uii_sendcommand: ; uii_sendcommand(u8*,u16)->void
; 173, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
131b : ad fd 76 LDA $76fd ; (uii_target + 0)
131e : a0 00 __ LDY #$00
1320 : 84 1b __ STY ACCU + 0 
1322 : 84 1c __ STY ACCU + 1 
1324 : 91 0d __ STA (P0),y ; (bytes + 0)
.l5:
1326 : ad 1c df LDA $df1c 
1329 : 29 20 __ AND #$20
132b : d0 f9 __ BNE $1326 ; (uii_sendcommand.l5 + 0)
.s6:
132d : ad 1c df LDA $df1c 
1330 : 29 10 __ AND #$10
1332 : d0 f2 __ BNE $1326 ; (uii_sendcommand.l5 + 0)
.s7:
1334 : a5 1c __ LDA ACCU + 1 
1336 : c5 10 __ CMP P3 ; (count + 1)
1338 : d0 04 __ BNE $133e ; (uii_sendcommand.s16 + 0)
.s15:
133a : a5 1b __ LDA ACCU + 0 
133c : c5 0f __ CMP P2 ; (count + 0)
.s16:
133e : b0 2e __ BCS $136e ; (uii_sendcommand.s8 + 0)
.s12:
1340 : a5 0d __ LDA P0 ; (bytes + 0)
1342 : 65 1b __ ADC ACCU + 0 
1344 : 85 43 __ STA T3 + 0 
1346 : a5 0e __ LDA P1 ; (bytes + 1)
1348 : 65 1c __ ADC ACCU + 1 
134a : 85 44 __ STA T3 + 1 
134c : a6 1b __ LDX ACCU + 0 
.l13:
134e : a0 00 __ LDY #$00
1350 : b1 43 __ LDA (T3 + 0),y 
1352 : 8d 1d df STA $df1d 
1355 : e6 43 __ INC T3 + 0 
1357 : d0 02 __ BNE $135b ; (uii_sendcommand.s19 + 0)
.s18:
1359 : e6 44 __ INC T3 + 1 
.s19:
135b : e8 __ __ INX
135c : d0 02 __ BNE $1360 ; (uii_sendcommand.s21 + 0)
.s20:
135e : e6 1c __ INC ACCU + 1 
.s21:
1360 : a5 1c __ LDA ACCU + 1 
1362 : c5 10 __ CMP P3 ; (count + 1)
1364 : 90 e8 __ BCC $134e ; (uii_sendcommand.l13 + 0)
.s22:
1366 : d0 04 __ BNE $136c ; (uii_sendcommand.s17 + 0)
.s14:
1368 : e4 0f __ CPX P2 ; (count + 0)
136a : 90 e2 __ BCC $134e ; (uii_sendcommand.l13 + 0)
.s17:
136c : 86 1b __ STX ACCU + 0 
.s8:
136e : ad 1c df LDA $df1c 
1371 : 09 01 __ ORA #$01
1373 : 8d 1c df STA $df1c 
1376 : ad 1c df LDA $df1c 
1379 : 29 04 __ AND #$04
137b : f0 0a __ BEQ $1387 ; (uii_sendcommand.l9 + 0)
.s11:
137d : ad 1c df LDA $df1c 
1380 : 09 08 __ ORA #$08
1382 : 8d 1c df STA $df1c 
1385 : b0 9f __ BCS $1326 ; (uii_sendcommand.l5 + 0)
.l9:
1387 : ad 1c df LDA $df1c 
138a : 29 20 __ AND #$20
138c : d0 07 __ BNE $1395 ; (uii_sendcommand.s3 + 0)
.s10:
138e : ad 1c df LDA $df1c 
1391 : 29 10 __ AND #$10
1393 : d0 f2 __ BNE $1387 ; (uii_sendcommand.l9 + 0)
.s3:
1395 : 60 __ __ RTS
--------------------------------------------------------------------
uii_readdata: ; uii_readdata()->void
; 179, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
1396 : a9 00 __ LDA #$00
1398 : 8d c8 93 STA $93c8 ; (uii_data[0] + 0)
139b : a2 c8 __ LDX #$c8
139d : 86 1b __ STX ACCU + 0 
139f : a8 __ __ TAY
13a0 : f0 0d __ BEQ $13af ; (uii_readdata.l5 + 0)
.s8:
13a2 : ad 1e df LDA $df1e 
13a5 : 91 1b __ STA (ACCU + 0),y 
13a7 : 98 __ __ TYA
13a8 : 18 __ __ CLC
13a9 : 69 01 __ ADC #$01
13ab : a8 __ __ TAY
13ac : 8a __ __ TXA
13ad : 69 00 __ ADC #$00
.l5:
13af : aa __ __ TAX
13b0 : 18 __ __ CLC
13b1 : 69 93 __ ADC #$93
13b3 : 85 1c __ STA ACCU + 1 
13b5 : 2c 1c df BIT $df1c 
13b8 : 10 07 __ BPL $13c1 ; (uii_readdata.s6 + 0)
.s7:
13ba : e0 02 __ CPX #$02
13bc : d0 e4 __ BNE $13a2 ; (uii_readdata.s8 + 0)
.s9:
13be : 98 __ __ TYA
13bf : d0 e1 __ BNE $13a2 ; (uii_readdata.s8 + 0)
.s6:
13c1 : a9 00 __ LDA #$00
13c3 : 91 1b __ STA (ACCU + 0),y 
.s3:
13c5 : 60 __ __ RTS
--------------------------------------------------------------------
uii_readstatus: ; uii_readstatus()->void
; 180, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
13c6 : a9 00 __ LDA #$00
13c8 : 8d c9 95 STA $95c9 ; (uii_status[0] + 0)
13cb : a2 c9 __ LDX #$c9
13cd : 86 1b __ STX ACCU + 0 
13cf : a8 __ __ TAY
13d0 : f0 0d __ BEQ $13df ; (uii_readstatus.l5 + 0)
.s8:
13d2 : ad 1f df LDA $df1f 
13d5 : 91 1b __ STA (ACCU + 0),y 
13d7 : 98 __ __ TYA
13d8 : 18 __ __ CLC
13d9 : 69 01 __ ADC #$01
13db : a8 __ __ TAY
13dc : 8a __ __ TXA
13dd : 69 00 __ ADC #$00
.l5:
13df : aa __ __ TAX
13e0 : 18 __ __ CLC
13e1 : 69 95 __ ADC #$95
13e3 : 85 1c __ STA ACCU + 1 
13e5 : ad 1c df LDA $df1c 
13e8 : 29 40 __ AND #$40
13ea : f0 07 __ BEQ $13f3 ; (uii_readstatus.s6 + 0)
.s7:
13ec : e0 01 __ CPX #$01
13ee : d0 e2 __ BNE $13d2 ; (uii_readstatus.s8 + 0)
.s9:
13f0 : 98 __ __ TYA
13f1 : d0 df __ BNE $13d2 ; (uii_readstatus.s8 + 0)
.s6:
13f3 : 91 1b __ STA (ACCU + 0),y 
.s3:
13f5 : 60 __ __ RTS
--------------------------------------------------------------------
uii_get_hwinfo: ; uii_get_hwinfo(u8)->void
;  53, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
13f6 : a9 00 __ LDA #$00
13f8 : 85 10 __ STA P3 
13fa : 8d e7 bf STA $bfe7 ; (cmd[0] + 0)
13fd : 8d e9 bf STA $bfe9 ; (cmd[0] + 2)
1400 : a9 03 __ LDA #$03
1402 : 85 0f __ STA P2 
1404 : a9 04 __ LDA #$04
1406 : 8d fd 76 STA $76fd ; (uii_target + 0)
1409 : a9 28 __ LDA #$28
140b : 8d e8 bf STA $bfe8 ; (cmd[0] + 1)
140e : a9 00 __ LDA #$00
1410 : 8d e9 bf STA $bfe9 ; (cmd[0] + 2)
1413 : a9 e7 __ LDA #$e7
1415 : 85 0d __ STA P0 
1417 : a9 bf __ LDA #$bf
1419 : 85 0e __ STA P1 
141b : 20 1b 13 JSR $131b ; (uii_sendcommand.s4 + 0)
141e : 20 96 13 JSR $1396 ; (uii_readdata.s4 + 0)
1421 : 20 c6 13 JSR $13c6 ; (uii_readstatus.s4 + 0)
--------------------------------------------------------------------
uii_accept: ; uii_accept()->void
; 174, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
1424 : ad 1c df LDA $df1c 
1427 : 09 02 __ ORA #$02
1429 : 8d 1c df STA $df1c 
.l5:
142c : ad 1c df LDA $df1c 
142f : 29 02 __ AND #$02
1431 : d0 f9 __ BNE $142c ; (uii_accept.l5 + 0)
.s3:
1433 : 60 __ __ RTS
--------------------------------------------------------------------
uci_to_upper: ; uci_to_upper(u8*,u8)->u8
;  73, "/home/xahmol/git/UltimateDemo2026/src/main.c"
.s4:
1434 : a0 00 __ LDY #$00
1436 : a2 00 __ LDX #$00
1438 : ad c8 93 LDA $93c8 ; (uii_data[0] + 0)
143b : f0 23 __ BEQ $1460 ; (uci_to_upper.s6 + 0)
.l8:
143d : c9 20 __ CMP #$20
143f : 90 11 __ BCC $1452 ; (uci_to_upper.s9 + 0)
.s10:
1441 : c9 7f __ CMP #$7f
1443 : b0 0d __ BCS $1452 ; (uci_to_upper.s9 + 0)
.s11:
1445 : c9 61 __ CMP #$61
1447 : 90 06 __ BCC $144f ; (uci_to_upper.s14 + 0)
.s12:
1449 : c9 7b __ CMP #$7b
144b : b0 02 __ BCS $144f ; (uci_to_upper.s14 + 0)
.s13:
144d : e9 1f __ SBC #$1f
.s14:
144f : 91 0d __ STA (P0),y ; (dst + 0)
1451 : c8 __ __ INY
.s9:
1452 : e8 __ __ INX
1453 : e0 7f __ CPX #$7f
1455 : b0 09 __ BCS $1460 ; (uci_to_upper.s6 + 0)
.s5:
1457 : c0 18 __ CPY #$18
1459 : b0 05 __ BCS $1460 ; (uci_to_upper.s6 + 0)
.s7:
145b : bd c8 93 LDA $93c8,x ; (uii_data[0] + 0)
145e : d0 dd __ BNE $143d ; (uci_to_upper.l8 + 0)
.s6:
1460 : a9 00 __ LDA #$00
1462 : 91 0d __ STA (P0),y ; (dst + 0)
.s3:
1464 : 98 __ __ TYA
1465 : 60 __ __ RTS
--------------------------------------------------------------------
1466 : __ __ __ BYT 20 20 74 59 50 45 20 20 3a 20 00                :   tYPE  : .
--------------------------------------------------------------------
1471 : __ __ __ BYT 63 48 45 43 4b 49 4e 47 20 72 65 75 2e 2e 2e 00 : cHECKING reu....
--------------------------------------------------------------------
detect_reu: ; detect_reu()->u8
;  33, "/home/xahmol/git/UltimateDemo2026/src/detect.h"
.s4:
1481 : a9 00 __ LDA #$00
1483 : 8d e9 bf STA $bfe9 ; (c + 0)
1486 : a9 e9 __ LDA #$e9
1488 : 8d 02 df STA $df02 
148b : a9 bf __ LDA #$bf
148d : 8d 03 df STA $df03 
1490 : a9 00 __ LDA #$00
1492 : 8d 04 df STA $df04 
1495 : 8d 05 df STA $df05 
1498 : 8d 06 df STA $df06 
149b : a2 01 __ LDX #$01
149d : 8e 07 df STX $df07 
14a0 : 8d 08 df STA $df08 
14a3 : 8d 0a df STA $df0a 
14a6 : a2 90 __ LDX #$90
14a8 : 8e 01 df STX $df01 
14ab : a2 e8 __ LDX #$e8
14ad : 8e 02 df STX $df02 
14b0 : a2 bf __ LDX #$bf
14b2 : 8e 03 df STX $df03 
14b5 : 8d 04 df STA $df04 
14b8 : 8d 05 df STA $df05 
14bb : 8d 06 df STA $df06 
14be : a2 01 __ LDX #$01
14c0 : 8e 07 df STX $df07 
14c3 : 8d 08 df STA $df08 
14c6 : 8d 0a df STA $df0a 
14c9 : a9 91 __ LDA #$91
14cb : 8d 01 df STA $df01 
14ce : ad e8 bf LDA $bfe8 ; (d + 0)
14d1 : d0 52 __ BNE $1525 ; (detect_reu.s6 + 0)
.s5:
14d3 : a2 47 __ LDX #$47
14d5 : 8e e9 bf STX $bfe9 ; (c + 0)
14d8 : a2 e9 __ LDX #$e9
14da : 8e 02 df STX $df02 
14dd : a2 bf __ LDX #$bf
14df : 8e 03 df STX $df03 
14e2 : 8d 04 df STA $df04 
14e5 : 8d 05 df STA $df05 
14e8 : 8d 06 df STA $df06 
14eb : a2 01 __ LDX #$01
14ed : 8e 07 df STX $df07 
14f0 : 8d 08 df STA $df08 
14f3 : 8d 0a df STA $df0a 
14f6 : a2 90 __ LDX #$90
14f8 : 8e 01 df STX $df01 
14fb : a2 e8 __ LDX #$e8
14fd : 8e 02 df STX $df02 
1500 : a2 bf __ LDX #$bf
1502 : 8e 03 df STX $df03 
1505 : 8d 04 df STA $df04 
1508 : 8d 05 df STA $df05 
150b : 8d 06 df STA $df06 
150e : a2 01 __ LDX #$01
1510 : 8e 07 df STX $df07 
1513 : 8d 08 df STA $df08 
1516 : 8d 0a df STA $df0a 
1519 : a9 91 __ LDA #$91
151b : 8d 01 df STA $df01 
151e : ad e8 bf LDA $bfe8 ; (d + 0)
1521 : c9 47 __ CMP #$47
1523 : f0 03 __ BEQ $1528 ; (detect_reu.s7 + 0)
.s6:
1525 : a9 00 __ LDA #$00
.s3:
1527 : 60 __ __ RTS
.s7:
1528 : a0 01 __ LDY #$01
.l8:
152a : 8d e9 bf STA $bfe9 ; (c + 0)
152d : a9 e9 __ LDA #$e9
152f : 8d 02 df STA $df02 
1532 : a9 bf __ LDA #$bf
1534 : 8d 03 df STA $df03 
1537 : a9 00 __ LDA #$00
1539 : 8d 04 df STA $df04 
153c : 8d 05 df STA $df05 
153f : 8c 06 df STY $df06 
1542 : 8e 07 df STX $df07 
1545 : 8d 08 df STA $df08 
1548 : 8d 0a df STA $df0a 
154b : a2 90 __ LDX #$90
154d : 8e 01 df STX $df01 
1550 : 8d e9 bf STA $bfe9 ; (c + 0)
1553 : a2 e9 __ LDX #$e9
1555 : 8e 02 df STX $df02 
1558 : a2 bf __ LDX #$bf
155a : 8e 03 df STX $df03 
155d : 8d 04 df STA $df04 
1560 : 8d 05 df STA $df05 
1563 : 8d 06 df STA $df06 
1566 : a2 01 __ LDX #$01
1568 : 8e 07 df STX $df07 
156b : 8d 08 df STA $df08 
156e : 8d 0a df STA $df0a 
1571 : a2 90 __ LDX #$90
1573 : 8e 01 df STX $df01 
1576 : a2 e8 __ LDX #$e8
1578 : 8e 02 df STX $df02 
157b : a2 bf __ LDX #$bf
157d : 8e 03 df STX $df03 
1580 : 8d 04 df STA $df04 
1583 : 8d 05 df STA $df05 
1586 : 8c 06 df STY $df06 
1589 : a2 01 __ LDX #$01
158b : 8e 07 df STX $df07 
158e : 8d 08 df STA $df08 
1591 : 8d 0a df STA $df0a 
1594 : a9 91 __ LDA #$91
1596 : 8d 01 df STA $df01 
1599 : ad e8 bf LDA $bfe8 ; (d + 0)
159c : c9 47 __ CMP #$47
159e : d0 06 __ BNE $15a6 ; (detect_reu.s11 + 0)
.s9:
15a0 : c8 __ __ INY
15a1 : d0 87 __ BNE $152a ; (detect_reu.l8 + 0)
.s10:
15a3 : a9 10 __ LDA #$10
15a5 : 60 __ __ RTS
.s11:
15a6 : 98 __ __ TYA
15a7 : 4a __ __ LSR
15a8 : 4a __ __ LSR
15a9 : 4a __ __ LSR
15aa : 4a __ __ LSR
15ab : 60 __ __ RTS
--------------------------------------------------------------------
15ac : __ __ __ BYT 72 65 75 20 20 00                               : reu  .
--------------------------------------------------------------------
15b2 : __ __ __ BYT 74 4f 4f 20 53 4d 41 4c 4c 20 28 4e 45 45 44 20 : tOO SMALL (NEED 
15c2 : __ __ __ BYT 31 36 20 6d 62 29 00                            : 16 mb).
--------------------------------------------------------------------
15c9 : __ __ __ BYT 31 36 20 6d 62 20 72 65 75 20 49 53 20 52 45 51 : 16 mb reu IS REQ
15d9 : __ __ __ BYT 55 49 52 45 44 2e 00                            : UIRED..
--------------------------------------------------------------------
15e0 : __ __ __ BYT 66 32 20 3e 20 63 36 34 20 53 45 54 54 49 4e 47 : f2 > c64 SETTING
15f0 : __ __ __ BYT 53 20 3e 20 72 65 75 20 3e 20 31 36 20 6d 62 00 : S > reu > 16 mb.
--------------------------------------------------------------------
1600 : __ __ __ BYT 31 36 20 6d 62 00                               : 16 mb.
--------------------------------------------------------------------
1606 : __ __ __ BYT 63 48 45 43 4b 49 4e 47 20 54 55 52 42 4f 20 4d : cHECKING TURBO M
1616 : __ __ __ BYT 4f 44 45 2e 2e 2e 00                            : ODE....
--------------------------------------------------------------------
turbo_detect: ; turbo_detect()->u8
; 114, "/home/xahmol/git/UltimateDemo2026/include/turbo.h"
.s4:
161d : ae 31 d0 LDX $d031 
1620 : e8 __ __ INX
1621 : f0 1c __ BEQ $163f ; (turbo_detect.s6 + 0)
.s5:
1623 : a9 0f __ LDA #$0f
1625 : 20 59 16 JSR $1659 ; (turbo_set.s4 + 0)
1628 : 20 74 16 JSR $1674 ; (benchmark_delay.s4 + 0)
162b : 20 74 16 JSR $1674 ; (benchmark_delay.s4 + 0)
162e : a5 1b __ LDA ACCU + 0 
1630 : 85 44 __ STA T0 + 0 
1632 : a5 1c __ LDA ACCU + 1 
1634 : 85 45 __ STA T0 + 1 
1636 : a9 00 __ LDA #$00
1638 : 20 59 16 JSR $1659 ; (turbo_set.s4 + 0)
163b : a5 45 __ LDA T0 + 1 
163d : f0 05 __ BEQ $1644 ; (turbo_detect.s9 + 0)
.s6:
163f : a9 00 __ LDA #$00
.s3:
1641 : 85 1b __ STA ACCU + 0 
1643 : 60 __ __ RTS
.s9:
1644 : a5 44 __ LDA T0 + 0 
1646 : c9 02 __ CMP #$02
1648 : b0 04 __ BCS $164e ; (turbo_detect.s7 + 0)
.s8:
164a : a9 02 __ LDA #$02
164c : 90 f3 __ BCC $1641 ; (turbo_detect.s3 + 0)
.s7:
164e : c9 46 __ CMP #$46
1650 : a9 00 __ LDA #$00
1652 : 2a __ __ ROL
1653 : 49 01 __ EOR #$01
1655 : 90 ea __ BCC $1641 ; (turbo_detect.s3 + 0)
--------------------------------------------------------------------
turbo_set: ; turbo_set(u8)->void
; 131, "/home/xahmol/git/UltimateDemo2026/include/turbo.h"
.s4:
1659 : a8 __ __ TAY
165a : d0 0c __ BNE $1668 ; (turbo_set.s6 + 0)
.s5:
165c : 8d 31 d0 STA $d031 
165f : ad 30 d0 LDA $d030 
1662 : 29 fe __ AND #$fe
1664 : 8d 30 d0 STA $d030 
1667 : 60 __ __ RTS
.s6:
1668 : ad 30 d0 LDA $d030 
166b : 09 01 __ ORA #$01
166d : 8d 30 d0 STA $d030 
1670 : 8c 31 d0 STY $d031 
.s3:
1673 : 60 __ __ RTS
--------------------------------------------------------------------
benchmark_delay: ; benchmark_delay(i16)->i16
;  99, "/home/xahmol/git/UltimateDemo2026/include/turbo.h"
.s4:
1674 : 78 __ __ SEI
1675 : a9 00 __ LDA #$00
1677 : 8d 09 dc STA $dc09 
167a : 8d 08 dc STA $dc08 
167d : 8d e8 bf STA $bfe8 ; (i + 0)
1680 : f0 0e __ BEQ $1690 ; (benchmark_delay.l5 + 0)
.s9:
1682 : ad e8 bf LDA $bfe8 ; (i + 0)
1685 : 18 __ __ CLC
1686 : 69 01 __ ADC #$01
1688 : 8d e8 bf STA $bfe8 ; (i + 0)
168b : ad e9 bf LDA $bfe9 ; (i + 1)
168e : 69 00 __ ADC #$00
.l5:
1690 : 8d e9 bf STA $bfe9 ; (i + 1)
1693 : ac e8 bf LDY $bfe8 ; (i + 0)
1696 : ad e9 bf LDA $bfe9 ; (i + 1)
1699 : 49 80 __ EOR #$80
169b : c9 83 __ CMP #$83
169d : d0 02 __ BNE $16a1 ; (benchmark_delay.s14 + 0)
.s13:
169f : c0 e8 __ CPY #$e8
.s14:
16a1 : b0 07 __ BCS $16aa ; (benchmark_delay.s6 + 0)
.s7:
16a3 : a9 00 __ LDA #$00
16a5 : 8d e6 bf STA $bfe6 ; (j + 0)
16a8 : 90 28 __ BCC $16d2 ; (benchmark_delay.l8 + 0)
.s6:
16aa : 58 __ __ CLI
16ab : ad 09 dc LDA $dc09 
16ae : aa __ __ TAX
16af : 0a __ __ ASL
16b0 : 85 1b __ STA ACCU + 0 
16b2 : a9 00 __ LDA #$00
16b4 : 2a __ __ ROL
16b5 : 06 1b __ ASL ACCU + 0 
16b7 : 2a __ __ ROL
16b8 : a8 __ __ TAY
16b9 : 8a __ __ TXA
16ba : 65 1b __ ADC ACCU + 0 
16bc : 85 43 __ STA T0 + 0 
16be : 98 __ __ TYA
16bf : 69 00 __ ADC #$00
16c1 : 06 43 __ ASL T0 + 0 
16c3 : 2a __ __ ROL
16c4 : a8 __ __ TAY
16c5 : ad 08 dc LDA $dc08 
16c8 : 65 43 __ ADC T0 + 0 
16ca : 85 1b __ STA ACCU + 0 
16cc : 90 01 __ BCC $16cf ; (benchmark_delay.s16 + 0)
.s15:
16ce : c8 __ __ INY
.s16:
16cf : 84 1c __ STY ACCU + 1 
.s3:
16d1 : 60 __ __ RTS
.l8:
16d2 : 8d e7 bf STA $bfe7 ; (j + 1)
16d5 : ac e6 bf LDY $bfe6 ; (j + 0)
16d8 : ad e7 bf LDA $bfe7 ; (j + 1)
16db : 30 06 __ BMI $16e3 ; (benchmark_delay.s10 + 0)
.s12:
16dd : d0 a3 __ BNE $1682 ; (benchmark_delay.s9 + 0)
.s11:
16df : c0 c8 __ CPY #$c8
16e1 : b0 9f __ BCS $1682 ; (benchmark_delay.s9 + 0)
.s10:
16e3 : ea __ __ NOP
16e4 : ad e6 bf LDA $bfe6 ; (j + 0)
16e7 : 18 __ __ CLC
16e8 : 69 01 __ ADC #$01
16ea : 8d e6 bf STA $bfe6 ; (j + 0)
16ed : ad e7 bf LDA $bfe7 ; (j + 1)
16f0 : 69 00 __ ADC #$00
16f2 : 4c d2 16 JMP $16d2 ; (benchmark_delay.l8 + 0)
--------------------------------------------------------------------
16f5 : __ __ __ BYT 74 55 52 42 4f 00                               : tURBO.
--------------------------------------------------------------------
turbo_get: ; turbo_get()->u8
; 149, "/home/xahmol/git/UltimateDemo2026/include/turbo.h"
.s3:
16fb : ad 31 d0 LDA $d031 
16fe : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
16ff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1700 : __ __ __ BYT 6e 4f 54 20 44 45 54 45 43 54 45 44 20 28 31 20 : nOT DETECTED (1 
1710 : __ __ __ BYT 6d 68 5a 29 00                                  : mhZ).
--------------------------------------------------------------------
1715 : __ __ __ BYT 65 4e 41 42 4c 45 20 54 55 52 42 4f 20 49 4e 20 : eNABLE TURBO IN 
1725 : __ __ __ BYT 75 4c 54 49 4d 41 54 45 20 46 49 52 4d 57 41 52 : uLTIMATE FIRMWAR
1735 : __ __ __ BYT 45 00                                           : E.
--------------------------------------------------------------------
1737 : __ __ __ BYT 36 34 20 6d 68 5a 00                            : 64 mhZ.
--------------------------------------------------------------------
173e : __ __ __ BYT 34 38 20 6d 68 5a 00                            : 48 mhZ.
--------------------------------------------------------------------
1745 : __ __ __ BYT 34 30 20 6d 68 5a 00                            : 40 mhZ.
--------------------------------------------------------------------
174c : __ __ __ BYT 33 36 20 6d 68 5a 00                            : 36 mhZ.
--------------------------------------------------------------------
1753 : __ __ __ BYT 33 32 20 6d 68 5a 00                            : 32 mhZ.
--------------------------------------------------------------------
175a : __ __ __ BYT 32 38 20 6d 68 5a 00                            : 28 mhZ.
--------------------------------------------------------------------
1761 : __ __ __ BYT 32 34 20 6d 68 5a 00                            : 24 mhZ.
--------------------------------------------------------------------
1768 : __ __ __ BYT 32 30 20 6d 68 5a 00                            : 20 mhZ.
--------------------------------------------------------------------
176f : __ __ __ BYT 31 36 20 6d 68 5a 00                            : 16 mhZ.
--------------------------------------------------------------------
1776 : __ __ __ BYT 31 32 20 6d 68 5a 00                            : 12 mhZ.
--------------------------------------------------------------------
177d : __ __ __ BYT 38 20 6d 68 5a 00                               : 8 mhZ.
--------------------------------------------------------------------
1783 : __ __ __ BYT 63 48 45 43 4b 49 4e 47 20 75 4c 54 49 4d 41 54 : cHECKING uLTIMAT
1793 : __ __ __ BYT 45 20 61 55 44 49 4f 2e 2e 2e 00                : E aUDIO....
--------------------------------------------------------------------
audio_detect: ; audio_detect()->u8
;  92, "/home/xahmol/git/UltimateDemo2026/include/audio.h"
.s4:
179e : 78 __ __ SEI
179f : a2 00 __ LDX #$00
17a1 : 86 43 __ STX T0 + 0 
.l15:
17a3 : bd cf 7c LDA $7ccf,x ; (audio_ch_base[0] + 1)
17a6 : 85 44 __ STA T0 + 1 
17a8 : a9 00 __ LDA #$00
17aa : bc ce 7c LDY $7cce,x ; (audio_ch_base[0] + 0)
17ad : 91 43 __ STA (T0 + 0),y 
17af : e8 __ __ INX
17b0 : e8 __ __ INX
17b1 : e0 0e __ CPX #$0e
17b3 : d0 ee __ BNE $17a3 ; (audio_detect.l15 + 0)
.s16:
17b5 : a9 ff __ LDA #$ff
17b7 : 8d 3f df STA $df3f 
17ba : a2 00 __ LDX #$00
17bc : ad 20 df LDA $df20 
17bf : d0 08 __ BNE $17c9 ; (audio_detect.s14 + 0)
.l6:
17c1 : ca __ __ DEX
17c2 : f0 09 __ BEQ $17cd ; (audio_detect.s7 + 0)
.s5:
17c4 : ad 20 df LDA $df20 
17c7 : f0 f8 __ BEQ $17c1 ; (audio_detect.l6 + 0)
.s14:
17c9 : 58 __ __ CLI
.s17:
17ca : a9 00 __ LDA #$00
.s3:
17cc : 60 __ __ RTS
.s7:
17cd : 8d 21 df STA $df21 
17d0 : a9 01 __ LDA #$01
17d2 : 8d 24 df STA $df24 
17d5 : 8e 25 df STX $df25 
17d8 : 8e 26 df STX $df26 
17db : 8e 27 df STX $df27 
17de : 8e 2e df STX $df2e 
17e1 : 8e 29 df STX $df29 
17e4 : 8d 2f df STA $df2f 
17e7 : 8d 2a df STA $df2a 
17ea : 8e 2b df STX $df2b 
17ed : a9 05 __ LDA #$05
17ef : 8d 20 df STA $df20 
17f2 : a2 80 __ LDX #$80
17f4 : ad 20 df LDA $df20 
17f7 : d0 08 __ BNE $1801 ; (audio_detect.l10 + 0)
.l9:
17f9 : ca __ __ DEX
17fa : f0 05 __ BEQ $1801 ; (audio_detect.l10 + 0)
.s8:
17fc : ad 20 df LDA $df20 
17ff : f0 f8 __ BEQ $17f9 ; (audio_detect.l9 + 0)
.l10:
1801 : ac 20 df LDY $df20 
1804 : 88 __ __ DEY
1805 : d0 0c __ BNE $1813 ; (audio_detect.s13 + 0)
.s11:
1807 : ca __ __ DEX
1808 : d0 f7 __ BNE $1801 ; (audio_detect.l10 + 0)
.s12:
180a : a9 ff __ LDA #$ff
180c : 8d 3f df STA $df3f 
180f : 58 __ __ CLI
1810 : a9 01 __ LDA #$01
1812 : 60 __ __ RTS
.s13:
1813 : 58 __ __ CLI
1814 : a9 00 __ LDA #$00
1816 : 60 __ __ RTS
--------------------------------------------------------------------
1817 : __ __ __ BYT 61 55 44 49 4f 00                               : aUDIO.
--------------------------------------------------------------------
181d : __ __ __ BYT 6d 4f 44 55 4c 45 20 4e 4f 54 20 46 4f 55 4e 44 : mODULE NOT FOUND
182d : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
182e : __ __ __ BYT 66 32 20 3e 20 63 36 34 2f 63 41 52 54 20 53 45 : f2 > c64/cART SE
183e : __ __ __ BYT 54 54 49 4e 47 53 20 3e 20 61 55 44 49 4f 00    : TTINGS > aUDIO.
--------------------------------------------------------------------
fmt_dec: ; fmt_dec(u8*,u8)->void
;  57, "/home/xahmol/git/UltimateDemo2026/src/main.c"
.s4:
184d : a5 0f __ LDA P2 ; (val + 0)
184f : c9 64 __ CMP #$64
1851 : b0 04 __ BCS $1857 ; (fmt_dec.s7 + 0)
.s5:
1853 : a0 00 __ LDY #$00
1855 : 90 1d __ BCC $1874 ; (fmt_dec.s6 + 0)
.s7:
1857 : 85 1b __ STA ACCU + 0 
1859 : a9 00 __ LDA #$00
185b : 85 1c __ STA ACCU + 1 
185d : 85 04 __ STA WORK + 1 
185f : a9 64 __ LDA #$64
1861 : 85 03 __ STA WORK + 0 
1863 : 20 4d 78 JSR $784d ; (divmod + 0)
1866 : 18 __ __ CLC
1867 : a5 1b __ LDA ACCU + 0 
1869 : 69 30 __ ADC #$30
186b : a0 00 __ LDY #$00
186d : 91 0d __ STA (P0),y ; (buf + 0)
186f : a5 05 __ LDA WORK + 2 
1871 : 85 0f __ STA P2 ; (val + 0)
1873 : c8 __ __ INY
.s6:
1874 : 84 43 __ STY T1 + 0 
1876 : a9 00 __ LDA #$00
1878 : c8 __ __ INY
1879 : c8 __ __ INY
187a : 91 0d __ STA (P0),y ; (buf + 0)
187c : 85 1c __ STA ACCU + 1 
187e : 85 04 __ STA WORK + 1 
1880 : a5 0f __ LDA P2 ; (val + 0)
1882 : 85 1b __ STA ACCU + 0 
1884 : a9 0a __ LDA #$0a
1886 : 85 03 __ STA WORK + 0 
1888 : 20 4d 78 JSR $784d ; (divmod + 0)
188b : 18 __ __ CLC
188c : a5 1b __ LDA ACCU + 0 
188e : 69 30 __ ADC #$30
1890 : a4 43 __ LDY T1 + 0 
1892 : 91 0d __ STA (P0),y ; (buf + 0)
1894 : 18 __ __ CLC
1895 : a5 05 __ LDA WORK + 2 
1897 : 69 30 __ ADC #$30
1899 : c8 __ __ INY
189a : 91 0d __ STA (P0),y ; (buf + 0)
.s3:
189c : 60 __ __ RTS
--------------------------------------------------------------------
strcat: ; strcat(u8*,const u8*)->void
;  14, "/home/xahmol/oscar64/include/string.h"
.s4:
189d : a5 0d __ LDA P0 ; (dst + 0)
189f : 85 1b __ STA ACCU + 0 
18a1 : a5 0e __ LDA P1 ; (dst + 1)
18a3 : 85 1c __ STA ACCU + 1 
18a5 : a0 00 __ LDY #$00
18a7 : b1 0d __ LDA (P0),y ; (dst + 0)
18a9 : f0 0f __ BEQ $18ba ; (strcat.s5 + 0)
.s6:
18ab : 84 1b __ STY ACCU + 0 
18ad : a4 0d __ LDY P0 ; (dst + 0)
.l7:
18af : c8 __ __ INY
18b0 : d0 02 __ BNE $18b4 ; (strcat.s11 + 0)
.s10:
18b2 : e6 1c __ INC ACCU + 1 
.s11:
18b4 : b1 1b __ LDA (ACCU + 0),y 
18b6 : d0 f7 __ BNE $18af ; (strcat.l7 + 0)
.s8:
18b8 : 84 1b __ STY ACCU + 0 
.s5:
18ba : a8 __ __ TAY
.l9:
18bb : b1 0f __ LDA (P2),y ; (src + 0)
18bd : 91 1b __ STA (ACCU + 0),y 
18bf : aa __ __ TAX
18c0 : e6 0f __ INC P2 ; (src + 0)
18c2 : d0 02 __ BNE $18c6 ; (strcat.s13 + 0)
.s12:
18c4 : e6 10 __ INC P3 ; (src + 1)
.s13:
18c6 : e6 1b __ INC ACCU + 0 
18c8 : d0 02 __ BNE $18cc ; (strcat.s15 + 0)
.s14:
18ca : e6 1c __ INC ACCU + 1 
.s15:
18cc : 8a __ __ TXA
18cd : d0 ec __ BNE $18bb ; (strcat.l9 + 0)
.s3:
18cf : 60 __ __ RTS
--------------------------------------------------------------------
18d0 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 4d 55 53 49 43 2e 2e 2e : lOADING MUSIC...
18e0 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
modplay_load: ; modplay_load(u8*,u32)->u8
; 209, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s4:
18e1 : 20 4d 19 JSR $194d ; (uii_open_file.s4 + 0)
18e4 : ad c9 95 LDA $95c9 ; (uii_status[0] + 0)
18e7 : c9 30 __ CMP #$30
18e9 : d0 07 __ BNE $18f2 ; (modplay_load.s15 + 0)
.s5:
18eb : ad ca 95 LDA $95ca ; (uii_status[0] + 1)
18ee : c9 30 __ CMP #$30
18f0 : f0 05 __ BEQ $18f7 ; (modplay_load.s6 + 0)
.s15:
18f2 : a9 00 __ LDA #$00
.s3:
18f4 : 85 1b __ STA ACCU + 0 
18f6 : 60 __ __ RTS
.s6:
18f7 : a9 00 __ LDA #$00
18f9 : 85 48 __ STA T0 + 0 
18fb : 85 4b __ STA T0 + 3 
18fd : a8 __ __ TAY
18fe : aa __ __ TAX
18ff : a9 10 __ LDA #$10
1901 : 85 4c __ STA T2 + 0 
.l7:
1903 : 86 13 __ STX P6 
1905 : 84 12 __ STY P5 
1907 : a5 48 __ LDA T0 + 0 
1909 : 85 11 __ STA P4 
190b : a5 4b __ LDA T0 + 3 
190d : 85 14 __ STA P7 
190f : 20 db 19 JSR $19db ; (uii_load_reu.s4 + 0)
1912 : 18 __ __ CLC
1913 : a5 11 __ LDA P4 
1915 : 69 ff __ ADC #$ff
1917 : 85 48 __ STA T0 + 0 
1919 : a5 12 __ LDA P5 
191b : 69 7f __ ADC #$7f
191d : a8 __ __ TAY
191e : a5 13 __ LDA P6 
1920 : 69 00 __ ADC #$00
1922 : aa __ __ TAX
1923 : a5 14 __ LDA P7 
1925 : 69 00 __ ADC #$00
1927 : 85 4b __ STA T0 + 3 
1929 : ad c9 95 LDA $95c9 ; (uii_status[0] + 0)
192c : c9 30 __ CMP #$30
192e : d0 0b __ BNE $193b ; (modplay_load.s10 + 0)
.s8:
1930 : ad ca 95 LDA $95ca ; (uii_status[0] + 1)
1933 : c9 30 __ CMP #$30
1935 : d0 04 __ BNE $193b ; (modplay_load.s10 + 0)
.s9:
1937 : c6 4c __ DEC T2 + 0 
1939 : d0 c8 __ BNE $1903 ; (modplay_load.l7 + 0)
.s10:
193b : a5 4b __ LDA T0 + 3 
193d : d0 0a __ BNE $1949 ; (modplay_load.s11 + 0)
.s12:
193f : 8a __ __ TXA
1940 : d0 07 __ BNE $1949 ; (modplay_load.s11 + 0)
.s13:
1942 : 98 __ __ TYA
1943 : d0 04 __ BNE $1949 ; (modplay_load.s11 + 0)
.s14:
1945 : c5 48 __ CMP T0 + 0 
1947 : b0 ab __ BCS $18f4 ; (modplay_load.s3 + 0)
.s11:
1949 : a9 01 __ LDA #$01
194b : d0 a7 __ BNE $18f4 ; (modplay_load.s3 + 0)
--------------------------------------------------------------------
uii_open_file: ; uii_open_file(u8,u8*)->void
;  31, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
194d : a9 dc __ LDA #$dc
194f : 85 0d __ STA P0 
1951 : 20 85 7c JSR $7c85 ; (strlen@proxy + 0)
1954 : 18 __ __ CLC
1955 : a5 1b __ LDA ACCU + 0 
1957 : 69 03 __ ADC #$03
1959 : 85 1b __ STA ACCU + 0 
195b : 90 02 __ BCC $195f ; (uii_open_file.s11 + 0)
.s10:
195d : e6 1c __ INC ACCU + 1 
.s11:
195f : 20 89 79 JSR $7989 ; (crt_malloc + 0)
1962 : a5 1c __ LDA ACCU + 1 
1964 : 05 1b __ ORA ACCU + 0 
1966 : d0 01 __ BNE $1969 ; (uii_open_file.s5 + 0)
.s3:
1968 : 60 __ __ RTS
.s5:
1969 : a5 1c __ LDA ACCU + 1 
196b : 85 47 __ STA T2 + 1 
196d : a5 1b __ LDA ACCU + 0 
196f : 85 46 __ STA T2 + 0 
1971 : a9 00 __ LDA #$00
1973 : a8 __ __ TAY
1974 : 91 1b __ STA (ACCU + 0),y 
1976 : a9 7c __ LDA #$7c
1978 : 85 0e __ STA P1 
197a : a9 02 __ LDA #$02
197c : c8 __ __ INY
197d : 91 1b __ STA (ACCU + 0),y 
197f : 98 __ __ TYA
1980 : c8 __ __ INY
1981 : 91 1b __ STA (ACCU + 0),y 
1983 : 20 aa 10 JSR $10aa ; (strlen.s4 + 0)
1986 : a5 1b __ LDA ACCU + 0 
1988 : 05 1c __ ORA ACCU + 1 
198a : f0 23 __ BEQ $19af ; (uii_open_file.s6 + 0)
.s7:
198c : a9 00 __ LDA #$00
198e : 85 45 __ STA T1 + 0 
.l9:
1990 : a9 7c __ LDA #$7c
1992 : 85 0e __ STA P1 
1994 : a6 45 __ LDX T1 + 0 
1996 : 8a __ __ TXA
1997 : 18 __ __ CLC
1998 : 69 03 __ ADC #$03
199a : a8 __ __ TAY
199b : bd dc 7c LDA $7cdc,x ; (mod_file[0] + 0)
199e : 91 46 __ STA (T2 + 0),y 
19a0 : 20 aa 10 JSR $10aa ; (strlen.s4 + 0)
19a3 : e6 45 __ INC T1 + 0 
19a5 : a5 1c __ LDA ACCU + 1 
19a7 : d0 e7 __ BNE $1990 ; (uii_open_file.l9 + 0)
.s8:
19a9 : a5 45 __ LDA T1 + 0 
19ab : c5 1b __ CMP ACCU + 0 
19ad : 90 e1 __ BCC $1990 ; (uii_open_file.l9 + 0)
.s6:
19af : a9 01 __ LDA #$01
19b1 : 8d fd 76 STA $76fd ; (uii_target + 0)
19b4 : 20 85 7c JSR $7c85 ; (strlen@proxy + 0)
19b7 : a5 46 __ LDA T2 + 0 
19b9 : 85 0d __ STA P0 
19bb : a5 47 __ LDA T2 + 1 
19bd : 85 0e __ STA P1 
19bf : 18 __ __ CLC
19c0 : a5 1b __ LDA ACCU + 0 
19c2 : 69 03 __ ADC #$03
19c4 : 85 0f __ STA P2 
19c6 : a5 1c __ LDA ACCU + 1 
19c8 : 69 00 __ ADC #$00
19ca : 85 10 __ STA P3 
19cc : 20 1b 13 JSR $131b ; (uii_sendcommand.s4 + 0)
19cf : 20 81 7a JSR $7a81 ; (crt_free@proxy + 0)
19d2 : 20 96 13 JSR $1396 ; (uii_readdata.s4 + 0)
19d5 : 20 c6 13 JSR $13c6 ; (uii_readstatus.s4 + 0)
19d8 : 4c 24 14 JMP $1424 ; (uii_accept.s4 + 0)
--------------------------------------------------------------------
uii_load_reu: ; uii_load_reu(u32,u32)->void
;  46, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
19db : a9 00 __ LDA #$00
19dd : 85 10 __ STA P3 
19df : 8d e0 bf STA $bfe0 ; (cmd[0] + 0)
19e2 : 8d e8 bf STA $bfe8 ; (cmd[0] + 8)
19e5 : 8d e9 bf STA $bfe9 ; (cmd[0] + 9)
19e8 : a9 0a __ LDA #$0a
19ea : 85 0f __ STA P2 
19ec : a9 01 __ LDA #$01
19ee : 8d fd 76 STA $76fd ; (uii_target + 0)
19f1 : a9 21 __ LDA #$21
19f3 : 8d e1 bf STA $bfe1 ; (cmd[0] + 1)
19f6 : a9 ff __ LDA #$ff
19f8 : 8d e6 bf STA $bfe6 ; (cmd[0] + 6)
19fb : a9 7f __ LDA #$7f
19fd : 8d e7 bf STA $bfe7 ; (cmd[0] + 7)
1a00 : a5 11 __ LDA P4 ; (reu_addr + 0)
1a02 : 8d e2 bf STA $bfe2 ; (cmd[0] + 2)
1a05 : a5 12 __ LDA P5 ; (reu_addr + 1)
1a07 : 8d e3 bf STA $bfe3 ; (cmd[0] + 3)
1a0a : a5 13 __ LDA P6 ; (reu_addr + 2)
1a0c : 8d e4 bf STA $bfe4 ; (cmd[0] + 4)
1a0f : a5 14 __ LDA P7 ; (reu_addr + 3)
1a11 : 8d e5 bf STA $bfe5 ; (cmd[0] + 5)
1a14 : a9 e0 __ LDA #$e0
1a16 : 85 0d __ STA P0 
1a18 : a9 bf __ LDA #$bf
1a1a : 85 0e __ STA P1 
1a1c : 20 1b 13 JSR $131b ; (uii_sendcommand.s4 + 0)
1a1f : 20 96 13 JSR $1396 ; (uii_readdata.s4 + 0)
1a22 : 20 c6 13 JSR $13c6 ; (uii_readstatus.s4 + 0)
1a25 : 4c 24 14 JMP $1424 ; (uii_accept.s4 + 0)
--------------------------------------------------------------------
uii_scan_media: ; uii_scan_media(u8[]*,u8*)->void
;  75, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
1a28 : a9 00 __ LDA #$00
1a2a : a8 __ __ TAY
1a2b : 91 15 __ STA (P8),y ; (count + 0)
1a2d : a9 fe __ LDA #$fe
1a2f : 85 11 __ STA P4 
1a31 : a9 76 __ LDA #$76
1a33 : 85 12 __ STA P5 
1a35 : 20 75 1b JSR $1b75 ; (uii_change_dir.s4 + 0)
1a38 : a9 00 __ LDA #$00
1a3a : 85 10 __ STA P3 
1a3c : 8d e8 bf STA $bfe8 ; (cmd[0] + 0)
1a3f : a9 02 __ LDA #$02
1a41 : 85 0f __ STA P2 
1a43 : a9 01 __ LDA #$01
1a45 : 8d fd 76 STA $76fd ; (uii_target + 0)
1a48 : a9 13 __ LDA #$13
1a4a : 8d e9 bf STA $bfe9 ; (cmd[0] + 1)
1a4d : a9 e8 __ LDA #$e8
1a4f : 85 0d __ STA P0 
1a51 : a9 bf __ LDA #$bf
1a53 : 85 0e __ STA P1 
1a55 : 20 1b 13 JSR $131b ; (uii_sendcommand.s4 + 0)
1a58 : 20 c6 13 JSR $13c6 ; (uii_readstatus.s4 + 0)
1a5b : 20 24 14 JSR $1424 ; (uii_accept.s4 + 0)
1a5e : ad c9 95 LDA $95c9 ; (uii_status[0] + 0)
1a61 : c9 30 __ CMP #$30
1a63 : d0 70 __ BNE $1ad5 ; (uii_scan_media.s3 + 0)
.s5:
1a65 : ad ca 95 LDA $95ca ; (uii_status[0] + 1)
1a68 : c9 30 __ CMP #$30
1a6a : d0 69 __ BNE $1ad5 ; (uii_scan_media.s3 + 0)
.s6:
1a6c : a9 01 __ LDA #$01
1a6e : 8d fd 76 STA $76fd ; (uii_target + 0)
1a71 : a9 00 __ LDA #$00
1a73 : 8d e6 bf STA $bfe6 ; (cmd[0] + 0)
1a76 : a9 14 __ LDA #$14
1a78 : 8d e7 bf STA $bfe7 ; (cmd[0] + 1)
1a7b : a9 e6 __ LDA #$e6
1a7d : 85 0d __ STA P0 
1a7f : a9 bf __ LDA #$bf
1a81 : 85 0e __ STA P1 
1a83 : 20 1b 13 JSR $131b ; (uii_sendcommand.s4 + 0)
1a86 : 2c 1c df BIT $df1c 
1a89 : 10 4a __ BPL $1ad5 ; (uii_scan_media.s3 + 0)
.l8:
1a8b : 20 96 13 JSR $1396 ; (uii_readdata.s4 + 0)
1a8e : 20 24 14 JSR $1424 ; (uii_accept.s4 + 0)
1a91 : ad c8 93 LDA $93c8 ; (uii_data[0] + 0)
1a94 : 29 10 __ AND #$10
1a96 : f0 38 __ BEQ $1ad0 ; (uii_scan_media.s7 + 0)
.s9:
1a98 : ad c9 93 LDA $93c9 ; (uii_data[0] + 1)
1a9b : f0 33 __ BEQ $1ad0 ; (uii_scan_media.s7 + 0)
.s10:
1a9d : 20 14 1c JSR $1c14 ; (_uii_lc.s4 + 0)
1aa0 : 85 49 __ STA T3 + 0 
1aa2 : ad ca 93 LDA $93ca ; (uii_data[0] + 2)
1aa5 : 20 14 1c JSR $1c14 ; (_uii_lc.s4 + 0)
1aa8 : 85 4a __ STA T4 + 0 
1aaa : ad cb 93 LDA $93cb ; (uii_data[0] + 3)
1aad : 20 14 1c JSR $1c14 ; (_uii_lc.s4 + 0)
1ab0 : aa __ __ TAX
1ab1 : a5 49 __ LDA T3 + 0 
1ab3 : c9 73 __ CMP #$73
1ab5 : d0 03 __ BNE $1aba ; (uii_scan_media.s18 + 0)
1ab7 : 4c 69 1b JMP $1b69 ; (uii_scan_media.s11 + 0)
.s18:
1aba : c9 75 __ CMP #$75
1abc : d0 12 __ BNE $1ad0 ; (uii_scan_media.s7 + 0)
.s19:
1abe : a5 4a __ LDA T4 + 0 
1ac0 : c9 73 __ CMP #$73
1ac2 : d0 0c __ BNE $1ad0 ; (uii_scan_media.s7 + 0)
.s20:
1ac4 : e0 62 __ CPX #$62
1ac6 : d0 08 __ BNE $1ad0 ; (uii_scan_media.s7 + 0)
.s12:
1ac8 : a0 00 __ LDY #$00
1aca : b1 15 __ LDA (P8),y ; (count + 0)
1acc : c9 05 __ CMP #$05
1ace : 90 06 __ BCC $1ad6 ; (uii_scan_media.s13 + 0)
.s7:
1ad0 : 2c 1c df BIT $df1c 
1ad3 : 30 b6 __ BMI $1a8b ; (uii_scan_media.l8 + 0)
.s3:
1ad5 : 60 __ __ RTS
.s13:
1ad6 : aa __ __ TAX
1ad7 : a9 2f __ LDA #$2f
1ad9 : bc 88 7b LDY $7b88,x ; (__multab16L + 0)
1adc : 91 13 __ STA (P6),y ; (drives + 0)
1ade : a9 00 __ LDA #$00
1ae0 : 85 4b __ STA T5 + 0 
.l14:
1ae2 : a6 4b __ LDX T5 + 0 
1ae4 : bd c9 93 LDA $93c9,x ; (uii_data[0] + 1)
1ae7 : f0 04 __ BEQ $1aed ; (uii_scan_media.s15 + 0)
.s16:
1ae9 : e0 0d __ CPX #$0d
1aeb : 90 52 __ BCC $1b3f ; (uii_scan_media.s17 + 0)
.s15:
1aed : a0 00 __ LDY #$00
1aef : b1 15 __ LDA (P8),y ; (count + 0)
1af1 : 0a __ __ ASL
1af2 : 2a __ __ ROL
1af3 : 2a __ __ ROL
1af4 : 2a __ __ ROL
1af5 : aa __ __ TAX
1af6 : 29 07 __ AND #$07
1af8 : 2a __ __ ROL
1af9 : a8 __ __ TAY
1afa : 8a __ __ TXA
1afb : 29 f0 __ AND #$f0
1afd : 65 13 __ ADC P6 ; (drives + 0)
1aff : 85 43 __ STA T0 + 0 
1b01 : 98 __ __ TYA
1b02 : 65 14 __ ADC P7 ; (drives + 1)
1b04 : 85 44 __ STA T0 + 1 
1b06 : a9 2f __ LDA #$2f
1b08 : a4 4b __ LDY T5 + 0 
1b0a : c8 __ __ INY
1b0b : 91 43 __ STA (T0 + 0),y 
1b0d : a0 00 __ LDY #$00
1b0f : b1 15 __ LDA (P8),y ; (count + 0)
1b11 : 0a __ __ ASL
1b12 : 2a __ __ ROL
1b13 : 2a __ __ ROL
1b14 : 2a __ __ ROL
1b15 : aa __ __ TAX
1b16 : 29 07 __ AND #$07
1b18 : 2a __ __ ROL
1b19 : a8 __ __ TAY
1b1a : 8a __ __ TXA
1b1b : 29 f0 __ AND #$f0
1b1d : 65 13 __ ADC P6 ; (drives + 0)
1b1f : 85 43 __ STA T0 + 0 
1b21 : 98 __ __ TYA
1b22 : 65 14 __ ADC P7 ; (drives + 1)
1b24 : 85 44 __ STA T0 + 1 
1b26 : a9 00 __ LDA #$00
1b28 : a4 4b __ LDY T5 + 0 
1b2a : c8 __ __ INY
1b2b : c8 __ __ INY
1b2c : 91 43 __ STA (T0 + 0),y 
1b2e : a8 __ __ TAY
1b2f : b1 15 __ LDA (P8),y ; (count + 0)
1b31 : 18 __ __ CLC
1b32 : 69 01 __ ADC #$01
1b34 : 91 15 __ STA (P8),y ; (count + 0)
1b36 : 2c 1c df BIT $df1c 
1b39 : 10 03 __ BPL $1b3e ; (uii_scan_media.s15 + 81)
1b3b : 4c 8b 1a JMP $1a8b ; (uii_scan_media.l8 + 0)
1b3e : 60 __ __ RTS
.s17:
1b3f : 20 14 1c JSR $1c14 ; (_uii_lc.s4 + 0)
1b42 : aa __ __ TAX
1b43 : a0 00 __ LDY #$00
1b45 : b1 15 __ LDA (P8),y ; (count + 0)
1b47 : 0a __ __ ASL
1b48 : 2a __ __ ROL
1b49 : 2a __ __ ROL
1b4a : 2a __ __ ROL
1b4b : a8 __ __ TAY
1b4c : 29 07 __ AND #$07
1b4e : 2a __ __ ROL
1b4f : 85 44 __ STA T0 + 1 
1b51 : 98 __ __ TYA
1b52 : 29 f0 __ AND #$f0
1b54 : 65 13 __ ADC P6 ; (drives + 0)
1b56 : 85 43 __ STA T0 + 0 
1b58 : a5 44 __ LDA T0 + 1 
1b5a : 65 14 __ ADC P7 ; (drives + 1)
1b5c : 85 44 __ STA T0 + 1 
1b5e : 8a __ __ TXA
1b5f : a4 4b __ LDY T5 + 0 
1b61 : c8 __ __ INY
1b62 : 84 4b __ STY T5 + 0 
1b64 : 91 43 __ STA (T0 + 0),y 
1b66 : 4c e2 1a JMP $1ae2 ; (uii_scan_media.l14 + 0)
.s11:
1b69 : a5 4a __ LDA T4 + 0 
1b6b : c9 64 __ CMP #$64
1b6d : f0 03 __ BEQ $1b72 ; (uii_scan_media.s11 + 9)
1b6f : 4c d0 1a JMP $1ad0 ; (uii_scan_media.s7 + 0)
1b72 : 4c c8 1a JMP $1ac8 ; (uii_scan_media.s12 + 0)
--------------------------------------------------------------------
uii_change_dir: ; uii_change_dir(u8*)->void
;  25, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
1b75 : a5 11 __ LDA P4 ; (directory + 0)
1b77 : 85 0d __ STA P0 
1b79 : 20 a6 10 JSR $10a6 ; (strlen@proxy + 0)
1b7c : 18 __ __ CLC
1b7d : a5 1b __ LDA ACCU + 0 
1b7f : 69 02 __ ADC #$02
1b81 : 85 1b __ STA ACCU + 0 
1b83 : 90 02 __ BCC $1b87 ; (uii_change_dir.s11 + 0)
.s10:
1b85 : e6 1c __ INC ACCU + 1 
.s11:
1b87 : 20 89 79 JSR $7989 ; (crt_malloc + 0)
1b8a : a5 1c __ LDA ACCU + 1 
1b8c : 05 1b __ ORA ACCU + 0 
1b8e : d0 01 __ BNE $1b91 ; (uii_change_dir.s5 + 0)
.s3:
1b90 : 60 __ __ RTS
.s5:
1b91 : a5 1c __ LDA ACCU + 1 
1b93 : 85 46 __ STA T2 + 1 
1b95 : a5 1b __ LDA ACCU + 0 
1b97 : 85 45 __ STA T2 + 0 
1b99 : a9 00 __ LDA #$00
1b9b : a8 __ __ TAY
1b9c : 91 1b __ STA (ACCU + 0),y 
1b9e : a9 11 __ LDA #$11
1ba0 : c8 __ __ INY
1ba1 : 91 1b __ STA (ACCU + 0),y 
1ba3 : a9 00 __ LDA #$00
1ba5 : 85 47 __ STA T3 + 0 
1ba7 : 85 48 __ STA T3 + 1 
.l12:
1ba9 : 20 a6 10 JSR $10a6 ; (strlen@proxy + 0)
1bac : a5 48 __ LDA T3 + 1 
1bae : c5 1c __ CMP ACCU + 1 
1bb0 : d0 5c __ BNE $1c0e ; (uii_change_dir.s9 + 0)
.s8:
1bb2 : a5 47 __ LDA T3 + 0 
1bb4 : c5 1b __ CMP ACCU + 0 
1bb6 : 90 2d __ BCC $1be5 ; (uii_change_dir.s7 + 0)
.s6:
1bb8 : a5 12 __ LDA P5 ; (directory + 1)
1bba : 85 0e __ STA P1 
1bbc : a9 01 __ LDA #$01
1bbe : 8d fd 76 STA $76fd ; (uii_target + 0)
1bc1 : 20 aa 10 JSR $10aa ; (strlen.s4 + 0)
1bc4 : a5 45 __ LDA T2 + 0 
1bc6 : 85 0d __ STA P0 
1bc8 : a5 46 __ LDA T2 + 1 
1bca : 85 0e __ STA P1 
1bcc : 18 __ __ CLC
1bcd : a5 1b __ LDA ACCU + 0 
1bcf : 69 02 __ ADC #$02
1bd1 : 85 0f __ STA P2 
1bd3 : a5 1c __ LDA ACCU + 1 
1bd5 : 69 00 __ ADC #$00
1bd7 : 85 10 __ STA P3 
1bd9 : 20 1b 13 JSR $131b ; (uii_sendcommand.s4 + 0)
1bdc : 20 81 7a JSR $7a81 ; (crt_free@proxy + 0)
1bdf : 20 c6 13 JSR $13c6 ; (uii_readstatus.s4 + 0)
1be2 : 4c 24 14 JMP $1424 ; (uii_accept.s4 + 0)
.s7:
1be5 : 85 43 __ STA T0 + 0 
1be7 : 18 __ __ CLC
1be8 : a5 12 __ LDA P5 ; (directory + 1)
1bea : 65 48 __ ADC T3 + 1 
1bec : 85 44 __ STA T0 + 1 
1bee : a4 11 __ LDY P4 ; (directory + 0)
1bf0 : b1 43 __ LDA (T0 + 0),y 
1bf2 : aa __ __ TAX
1bf3 : 18 __ __ CLC
1bf4 : a5 45 __ LDA T2 + 0 
1bf6 : 65 47 __ ADC T3 + 0 
1bf8 : 85 43 __ STA T0 + 0 
1bfa : a5 46 __ LDA T2 + 1 
1bfc : 65 48 __ ADC T3 + 1 
1bfe : 85 44 __ STA T0 + 1 
1c00 : 8a __ __ TXA
1c01 : a0 02 __ LDY #$02
1c03 : 91 43 __ STA (T0 + 0),y 
1c05 : e6 47 __ INC T3 + 0 
1c07 : d0 a0 __ BNE $1ba9 ; (uii_change_dir.l12 + 0)
.s13:
1c09 : e6 48 __ INC T3 + 1 
1c0b : 4c a9 1b JMP $1ba9 ; (uii_change_dir.l12 + 0)
.s9:
1c0e : b0 a8 __ BCS $1bb8 ; (uii_change_dir.s6 + 0)
.s14:
1c10 : a5 47 __ LDA T3 + 0 
1c12 : 90 d1 __ BCC $1be5 ; (uii_change_dir.s7 + 0)
--------------------------------------------------------------------
_uii_lc: ; _uii_lc(u8)->u8
; 925, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.c"
.s4:
1c14 : c9 41 __ CMP #$41
1c16 : 90 06 __ BCC $1c1e ; (_uii_lc.s3 + 0)
.s5:
1c18 : c9 5b __ CMP #$5b
1c1a : b0 02 __ BCS $1c1e ; (_uii_lc.s3 + 0)
.s6:
1c1c : 09 20 __ ORA #$20
.s3:
1c1e : 60 __ __ RTS
--------------------------------------------------------------------
uii_find_media_path: ; uii_find_media_path(u8[]*,u8,u8*,u8*)->u8
;  82, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
1c1f : a9 00 __ LDA #$00
1c21 : a8 __ __ TAY
1c22 : 91 16 __ STA (P9),y ; (result + 0)
1c24 : a9 e4 __ LDA #$e4
1c26 : 85 0d __ STA P0 
1c28 : a9 7c __ LDA #$7c
1c2a : 85 0e __ STA P1 
1c2c : 20 aa 10 JSR $10aa ; (strlen.s4 + 0)
1c2f : a5 15 __ LDA P8 ; (drv_count + 0)
1c31 : d0 03 __ BNE $1c36 ; (uii_find_media_path.s6 + 0)
1c33 : 4c cc 1c JMP $1ccc ; (uii_find_media_path.s5 + 0)
.s6:
1c36 : a5 1b __ LDA ACCU + 0 
1c38 : 85 49 __ STA T2 + 0 
1c3a : 18 __ __ CLC
1c3b : 69 01 __ ADC #$01
1c3d : 85 4a __ STA T3 + 0 
1c3f : a9 00 __ LDA #$00
1c41 : 2a __ __ ROL
1c42 : 85 4b __ STA T3 + 1 
1c44 : a9 00 __ LDA #$00
1c46 : 85 4f __ STA T8 + 0 
.l7:
1c48 : 0a __ __ ASL
1c49 : 2a __ __ ROL
1c4a : 2a __ __ ROL
1c4b : 2a __ __ ROL
1c4c : a8 __ __ TAY
1c4d : 29 07 __ AND #$07
1c4f : 2a __ __ ROL
1c50 : aa __ __ TAX
1c51 : 98 __ __ TYA
1c52 : 29 f0 __ AND #$f0
1c54 : 65 13 __ ADC P6 ; (drives + 0)
1c56 : 85 0d __ STA P0 
1c58 : 8a __ __ TXA
1c59 : 65 14 __ ADC P7 ; (drives + 1)
1c5b : 85 4d __ STA T5 + 1 
1c5d : 85 0e __ STA P1 
1c5f : 20 aa 10 JSR $10aa ; (strlen.s4 + 0)
1c62 : 18 __ __ CLC
1c63 : a5 1b __ LDA ACCU + 0 
1c65 : 65 49 __ ADC T2 + 0 
1c67 : c9 7f __ CMP #$7f
1c69 : b0 56 __ BCS $1cc1 ; (uii_find_media_path.s9 + 0)
.s8:
1c6b : a5 1b __ LDA ACCU + 0 
1c6d : 85 11 __ STA P4 
1c6f : 85 4e __ STA T6 + 0 
1c71 : a5 0d __ LDA P0 
1c73 : 85 0f __ STA P2 
1c75 : a5 4d __ LDA T5 + 1 
1c77 : 85 10 __ STA P3 
1c79 : a9 00 __ LDA #$00
1c7b : 85 12 __ STA P5 
1c7d : a9 97 __ LDA #$97
1c7f : 85 0e __ STA P1 
1c81 : a9 00 __ LDA #$00
1c83 : 85 0d __ STA P0 
1c85 : 20 df 1c JSR $1cdf ; (memcpy.s4 + 0)
1c88 : a5 4a __ LDA T3 + 0 
1c8a : 85 11 __ STA P4 
1c8c : a5 4b __ LDA T3 + 1 
1c8e : 85 12 __ STA P5 
1c90 : 18 __ __ CLC
1c91 : a9 00 __ LDA #$00
1c93 : 65 4e __ ADC T6 + 0 
1c95 : 85 0d __ STA P0 
1c97 : a9 97 __ LDA #$97
1c99 : 69 00 __ ADC #$00
1c9b : 85 0e __ STA P1 
1c9d : a9 e4 __ LDA #$e4
1c9f : 85 0f __ STA P2 
1ca1 : a9 7c __ LDA #$7c
1ca3 : 85 10 __ STA P3 
1ca5 : 20 df 1c JSR $1cdf ; (memcpy.s4 + 0)
1ca8 : a9 00 __ LDA #$00
1caa : 85 11 __ STA P4 
1cac : a9 97 __ LDA #$97
1cae : 85 12 __ STA P5 
1cb0 : 20 75 1b JSR $1b75 ; (uii_change_dir.s4 + 0)
1cb3 : ad c9 95 LDA $95c9 ; (uii_status[0] + 0)
1cb6 : c9 30 __ CMP #$30
1cb8 : d0 07 __ BNE $1cc1 ; (uii_find_media_path.s9 + 0)
.s10:
1cba : ad ca 95 LDA $95ca ; (uii_status[0] + 1)
1cbd : c9 30 __ CMP #$30
1cbf : f0 10 __ BEQ $1cd1 ; (uii_find_media_path.s11 + 0)
.s9:
1cc1 : e6 4f __ INC T8 + 0 
1cc3 : a5 4f __ LDA T8 + 0 
1cc5 : c5 15 __ CMP P8 ; (drv_count + 0)
1cc7 : b0 03 __ BCS $1ccc ; (uii_find_media_path.s5 + 0)
1cc9 : 4c 48 1c JMP $1c48 ; (uii_find_media_path.l7 + 0)
.s5:
1ccc : a9 00 __ LDA #$00
.s3:
1cce : 85 1b __ STA ACCU + 0 
1cd0 : 60 __ __ RTS
.s11:
1cd1 : a0 ff __ LDY #$ff
.l12:
1cd3 : c8 __ __ INY
1cd4 : b9 00 97 LDA $9700,y ; (_uii_fp[0] + 0)
1cd7 : 91 16 __ STA (P9),y ; (result + 0)
1cd9 : d0 f8 __ BNE $1cd3 ; (uii_find_media_path.l12 + 0)
.s13:
1cdb : a9 01 __ LDA #$01
1cdd : d0 ef __ BNE $1cce ; (uii_find_media_path.s3 + 0)
--------------------------------------------------------------------
memcpy: ; memcpy(void*,const void*,i16)->void
;  30, "/home/xahmol/oscar64/include/string.h"
.s4:
1cdf : a6 12 __ LDX P5 
1ce1 : f0 10 __ BEQ $1cf3 ; (memcpy.s4 + 20)
1ce3 : a0 00 __ LDY #$00
1ce5 : b1 0f __ LDA (P2),y 
1ce7 : 91 0d __ STA (P0),y 
1ce9 : c8 __ __ INY
1cea : d0 f9 __ BNE $1ce5 ; (memcpy.s4 + 6)
1cec : e6 10 __ INC P3 
1cee : e6 0e __ INC P1 
1cf0 : ca __ __ DEX
1cf1 : d0 f2 __ BNE $1ce5 ; (memcpy.s4 + 6)
1cf3 : a4 11 __ LDY P4 
1cf5 : f0 0e __ BEQ $1d05 ; (memcpy.s3 + 0)
1cf7 : 88 __ __ DEY
1cf8 : f0 07 __ BEQ $1d01 ; (memcpy.s4 + 34)
1cfa : b1 0f __ LDA (P2),y 
1cfc : 91 0d __ STA (P0),y 
1cfe : 88 __ __ DEY
1cff : d0 f9 __ BNE $1cfa ; (memcpy.s4 + 27)
1d01 : b1 0f __ LDA (P2),y 
1d03 : 91 0d __ STA (P0),y 
.s3:
1d05 : 60 __ __ RTS
--------------------------------------------------------------------
modplay_init: ; modplay_init(u32)->u8
; 227, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s4:
1d06 : a9 00 __ LDA #$00
1d08 : 8d bc 9b STA $9bbc ; (modplay.reu_base + 0)
1d0b : 8d bd 9b STA $9bbd ; (modplay.reu_base + 1)
1d0e : 8d be 9b STA $9bbe ; (modplay.reu_base + 2)
1d11 : 8d bf 9b STA $9bbf ; (modplay.reu_base + 3)
1d14 : a2 80 __ LDX #$80
1d16 : 8e 02 df STX $df02 
1d19 : a2 97 __ LDX #$97
1d1b : 8e 03 df STX $df03 
1d1e : 8d 04 df STA $df04 
1d21 : 8d 05 df STA $df05 
1d24 : 8d 06 df STA $df06 
1d27 : a9 3c __ LDA #$3c
1d29 : 8d 07 df STA $df07 
1d2c : a9 04 __ LDA #$04
1d2e : 8d 08 df STA $df08 
1d31 : a9 00 __ LDA #$00
1d33 : 8d 0a df STA $df0a 
1d36 : a9 91 __ LDA #$91
1d38 : 8d 01 df STA $df01 
1d3b : ad b8 9b LDA $9bb8 ; (hdr[0] + 1080)
1d3e : c9 4d __ CMP #$4d
1d40 : f0 03 __ BEQ $1d45 ; (modplay_init.s48 + 0)
1d42 : 4c a5 1f JMP $1fa5 ; (modplay_init.s5 + 0)
.s48:
1d45 : ad b9 9b LDA $9bb9 ; (hdr[0] + 1081)
1d48 : c9 2e __ CMP #$2e
1d4a : d0 03 __ BNE $1d4f ; (modplay_init.s49 + 0)
1d4c : 4c 94 1f JMP $1f94 ; (modplay_init.s52 + 0)
.s49:
1d4f : c9 21 __ CMP #$21
1d51 : d0 0e __ BNE $1d61 ; (modplay_init.s6 + 0)
.s50:
1d53 : ad ba 9b LDA $9bba ; (hdr[0] + 1082)
1d56 : c9 4b __ CMP #$4b
1d58 : d0 07 __ BNE $1d61 ; (modplay_init.s6 + 0)
.s51:
1d5a : ad bb 9b LDA $9bbb ; (hdr[0] + 1083)
1d5d : c9 21 __ CMP #$21
1d5f : f0 1c __ BEQ $1d7d ; (modplay_init.s44 + 0)
.s6:
1d61 : ad b8 9b LDA $9bb8 ; (hdr[0] + 1080)
1d64 : c9 46 __ CMP #$46
1d66 : d0 19 __ BNE $1d81 ; (modplay_init.s7 + 0)
.s41:
1d68 : ad b9 9b LDA $9bb9 ; (hdr[0] + 1081)
1d6b : c9 4c __ CMP #$4c
1d6d : d0 12 __ BNE $1d81 ; (modplay_init.s7 + 0)
.s42:
1d6f : ad ba 9b LDA $9bba ; (hdr[0] + 1082)
1d72 : c9 54 __ CMP #$54
1d74 : d0 0b __ BNE $1d81 ; (modplay_init.s7 + 0)
.s43:
1d76 : ad bb 9b LDA $9bbb ; (hdr[0] + 1083)
1d79 : c9 34 __ CMP #$34
1d7b : d0 04 __ BNE $1d81 ; (modplay_init.s7 + 0)
.s44:
1d7d : a9 1f __ LDA #$1f
1d7f : d0 17 __ BNE $1d98 ; (modplay_init.s12 + 0)
.s7:
1d81 : a2 00 __ LDX #$00
.l8:
1d83 : bd b8 9b LDA $9bb8,x ; (hdr[0] + 1080)
1d86 : c9 20 __ CMP #$20
1d88 : b0 03 __ BCS $1d8d ; (modplay_init.s9 + 0)
1d8a : 4c 8f 1f JMP $1f8f ; (modplay_init.s40 + 0)
.s9:
1d8d : c9 7f __ CMP #$7f
1d8f : b0 f9 __ BCS $1d8a ; (modplay_init.l8 + 7)
.s10:
1d91 : e8 __ __ INX
1d92 : e0 04 __ CPX #$04
1d94 : 90 ed __ BCC $1d83 ; (modplay_init.l8 + 0)
.s11:
1d96 : a9 0f __ LDA #$0f
.s12:
1d98 : 8d c1 9b STA $9bc1 ; (modplay.num_samples + 0)
1d9b : ad 36 9b LDA $9b36 ; (hdr[0] + 950)
1d9e : 8d c0 9b STA $9bc0 ; (modplay.song_length + 0)
1da1 : d0 09 __ BNE $1dac ; (modplay_init.s39 + 0)
.s62:
1da3 : a9 80 __ LDA #$80
.s13:
1da5 : 8d c0 9b STA $9bc0 ; (modplay.song_length + 0)
.s14:
1da8 : a2 7f __ LDX #$7f
1daa : d0 09 __ BNE $1db5 ; (modplay_init.l15 + 0)
.s39:
1dac : a9 80 __ LDA #$80
1dae : cd 36 9b CMP $9b36 ; (hdr[0] + 950)
1db1 : b0 f5 __ BCS $1da8 ; (modplay_init.s14 + 0)
1db3 : 90 f0 __ BCC $1da5 ; (modplay_init.s13 + 0)
.l15:
1db5 : bd 38 9b LDA $9b38,x ; (hdr[0] + 952)
1db8 : 9d c3 9b STA $9bc3,x ; (modplay.order_table[0] + 0)
1dbb : ca __ __ DEX
1dbc : 10 f7 __ BPL $1db5 ; (modplay_init.l15 + 0)
.s16:
1dbe : a2 00 __ LDX #$00
1dc0 : a0 00 __ LDY #$00
.l17:
1dc2 : 98 __ __ TYA
1dc3 : dd c3 9b CMP $9bc3,x ; (modplay.order_table[0] + 0)
1dc6 : b0 04 __ BCS $1dcc ; (modplay_init.s18 + 0)
.s38:
1dc8 : bd c3 9b LDA $9bc3,x ; (modplay.order_table[0] + 0)
1dcb : a8 __ __ TAY
.s18:
1dcc : e8 __ __ INX
1dcd : 10 f3 __ BPL $1dc2 ; (modplay_init.l17 + 0)
.s19:
1dcf : 18 __ __ CLC
1dd0 : 69 01 __ ADC #$01
1dd2 : 85 1c __ STA ACCU + 1 
1dd4 : 8d c2 9b STA $9bc2 ; (modplay.num_patterns + 0)
1dd7 : a9 00 __ LDA #$00
1dd9 : 06 1c __ ASL ACCU + 1 
1ddb : 2a __ __ ROL
1ddc : 06 1c __ ASL ACCU + 1 
1dde : 2a __ __ ROL
1ddf : 85 1d __ STA ACCU + 2 
1de1 : ad c1 9b LDA $9bc1 ; (modplay.num_samples + 0)
1de4 : c9 1f __ CMP #$1f
1de6 : d0 03 __ BNE $1deb ; (modplay_init.s20 + 0)
1de8 : 4c 7b 1f JMP $1f7b ; (modplay_init.s37 + 0)
.s20:
1deb : a5 1c __ LDA ACCU + 1 
1ded : 09 02 __ ORA #$02
1def : 85 1c __ STA ACCU + 1 
1df1 : a9 58 __ LDA #$58
1df3 : 85 1b __ STA ACCU + 0 
1df5 : ad c1 9b LDA $9bc1 ; (modplay.num_samples + 0)
1df8 : d0 66 __ BNE $1e60 ; (modplay_init.s31 + 0)
.s21:
1dfa : a9 00 __ LDA #$00
1dfc : 8d ff 7c STA $7cff ; (mod_paused + 0)
1dff : 8d 43 9c STA $9c43 ; (modplay.order_pos + 0)
1e02 : 8d 45 9c STA $9c45 ; (modplay.row + 0)
1e05 : 8d 46 9c STA $9c46 ; (modplay.tick + 0)
1e08 : 8d 4c 9c STA $9c4c ; (modplay.active + 0)
1e0b : ad c3 9b LDA $9bc3 ; (modplay.order_table[0] + 0)
1e0e : 8d 44 9c STA $9c44 ; (modplay.pattern_num + 0)
1e11 : a9 01 __ LDA #$01
1e13 : 8d 4b 9c STA $9c4b ; (modplay.stereo + 0)
1e16 : 8d 4d 9c STA $9c4d ; (modplay.loop_song + 0)
1e19 : a9 06 __ LDA #$06
1e1b : 8d 47 9c STA $9c47 ; (modplay.ticks_per_row + 0)
1e1e : a9 7d __ LDA #$7d
1e20 : 8d 48 9c STA $9c48 ; (modplay.bpm + 0)
1e23 : a9 00 __ LDA #$00
1e25 : a2 c8 __ LDX #$c8
1e27 : 8e 4a 9c STX $9c4a ; (modplay.master_volume + 0)
.l22:
1e2a : ca __ __ DEX
1e2b : 9d 9e 9e STA $9e9e,x ; (modplay.channel[0].sample_num + 0)
1e2e : d0 fa __ BNE $1e2a ; (modplay_init.l22 + 0)
.s23:
1e30 : 85 46 __ STA T2 + 0 
.l24:
1e32 : a5 46 __ LDA T2 + 0 
1e34 : c9 01 __ CMP #$01
1e36 : f0 04 __ BEQ $1e3c ; (modplay_init.s30 + 0)
.s25:
1e38 : c9 02 __ CMP #$02
1e3a : d0 04 __ BNE $1e40 ; (modplay_init.s26 + 0)
.s30:
1e3c : a0 ff __ LDY #$ff
1e3e : d0 02 __ BNE $1e42 ; (modplay_init.l27 + 0)
.s26:
1e40 : a0 00 __ LDY #$00
.l27:
1e42 : a6 46 __ LDX T2 + 0 
1e44 : bd 8d 7b LDA $7b8d,x ; (__multab50L + 0)
1e47 : aa __ __ TAX
1e48 : 98 __ __ TYA
1e49 : 9d a4 9e STA $9ea4,x ; (modplay.channel[0].pan + 0)
1e4c : e6 46 __ INC T2 + 0 
1e4e : a5 46 __ LDA T2 + 0 
1e50 : c9 04 __ CMP #$04
1e52 : b0 07 __ BCS $1e5b ; (modplay_init.s28 + 0)
.s29:
1e54 : ad 4b 9c LDA $9c4b ; (modplay.stereo + 0)
1e57 : f0 e7 __ BEQ $1e40 ; (modplay_init.s26 + 0)
1e59 : d0 d7 __ BNE $1e32 ; (modplay_init.l24 + 0)
.s28:
1e5b : a9 01 __ LDA #$01
.s3:
1e5d : 85 1b __ STA ACCU + 0 
1e5f : 60 __ __ RTS
.s31:
1e60 : a9 00 __ LDA #$00
1e62 : 85 43 __ STA T1 + 0 
1e64 : 85 44 __ STA T1 + 1 
1e66 : 85 45 __ STA T1 + 2 
1e68 : 85 1e __ STA ACCU + 3 
1e6a : a9 51 __ LDA #$51
1e6c : 85 4e __ STA T6 + 0 
1e6e : a9 9c __ LDA #$9c
1e70 : 85 4f __ STA T6 + 1 
1e72 : a9 94 __ LDA #$94
1e74 : 85 50 __ STA T7 + 0 
1e76 : a9 97 __ LDA #$97
1e78 : 85 51 __ STA T7 + 1 
1e7a : a2 00 __ LDX #$00
1e7c : 18 __ __ CLC
.l32:
1e7d : a5 1b __ LDA ACCU + 0 
1e7f : 65 43 __ ADC T1 + 0 
1e81 : a0 00 __ LDY #$00
1e83 : 84 48 __ STY T2 + 2 
1e85 : 91 4e __ STA (T6 + 0),y 
1e87 : a5 1c __ LDA ACCU + 1 
1e89 : 65 44 __ ADC T1 + 1 
1e8b : c8 __ __ INY
1e8c : 91 4e __ STA (T6 + 0),y 
1e8e : a5 1d __ LDA ACCU + 2 
1e90 : 65 45 __ ADC T1 + 2 
1e92 : c8 __ __ INY
1e93 : 91 4e __ STA (T6 + 0),y 
1e95 : 8a __ __ TXA
1e96 : 69 00 __ ADC #$00
1e98 : c8 __ __ INY
1e99 : 91 4e __ STA (T6 + 0),y 
1e9b : a0 16 __ LDY #$16
1e9d : b1 50 __ LDA (T7 + 0),y 
1e9f : 85 47 __ STA T2 + 1 
1ea1 : c8 __ __ INY
1ea2 : b1 50 __ LDA (T7 + 0),y 
1ea4 : 0a __ __ ASL
1ea5 : 85 46 __ STA T2 + 0 
1ea7 : 26 47 __ ROL T2 + 1 
1ea9 : 26 48 __ ROL T2 + 2 
1eab : a0 04 __ LDY #$04
1ead : 91 4e __ STA (T6 + 0),y 
1eaf : a5 47 __ LDA T2 + 1 
1eb1 : c8 __ __ INY
1eb2 : 91 4e __ STA (T6 + 0),y 
1eb4 : a5 48 __ LDA T2 + 2 
1eb6 : c8 __ __ INY
1eb7 : 91 4e __ STA (T6 + 0),y 
1eb9 : a9 00 __ LDA #$00
1ebb : c8 __ __ INY
1ebc : 91 4e __ STA (T6 + 0),y 
1ebe : a0 19 __ LDY #$19
1ec0 : b1 50 __ LDA (T7 + 0),y 
1ec2 : c9 41 __ CMP #$41
1ec4 : 90 02 __ BCC $1ec8 ; (modplay_init.s54 + 0)
.s33:
1ec6 : a9 40 __ LDA #$40
.s54:
1ec8 : a0 11 __ LDY #$11
1eca : 91 4e __ STA (T6 + 0),y 
1ecc : a0 18 __ LDY #$18
1ece : b1 50 __ LDA (T7 + 0),y 
1ed0 : 29 0f __ AND #$0f
1ed2 : a0 12 __ LDY #$12
1ed4 : 91 4e __ STA (T6 + 0),y 
1ed6 : a0 1a __ LDY #$1a
1ed8 : b1 50 __ LDA (T7 + 0),y 
1eda : 85 4a __ STA T3 + 1 
1edc : c8 __ __ INY
1edd : b1 50 __ LDA (T7 + 0),y 
1edf : 85 49 __ STA T3 + 0 
1ee1 : 0a __ __ ASL
1ee2 : a0 08 __ LDY #$08
1ee4 : 91 4e __ STA (T6 + 0),y 
1ee6 : a5 4a __ LDA T3 + 1 
1ee8 : 2a __ __ ROL
1ee9 : c8 __ __ INY
1eea : 91 4e __ STA (T6 + 0),y 
1eec : a9 00 __ LDA #$00
1eee : 2a __ __ ROL
1eef : c8 __ __ INY
1ef0 : 91 4e __ STA (T6 + 0),y 
1ef2 : a9 00 __ LDA #$00
1ef4 : c8 __ __ INY
1ef5 : 91 4e __ STA (T6 + 0),y 
1ef7 : a0 1d __ LDY #$1d
1ef9 : b1 50 __ LDA (T7 + 0),y 
1efb : 85 4c __ STA T4 + 0 
1efd : 65 49 __ ADC T3 + 0 
1eff : 85 49 __ STA T3 + 0 
1f01 : 88 __ __ DEY
1f02 : b1 50 __ LDA (T7 + 0),y 
1f04 : 85 4d __ STA T4 + 1 
1f06 : 65 4a __ ADC T3 + 1 
1f08 : 85 4a __ STA T3 + 1 
1f0a : a9 00 __ LDA #$00
1f0c : 2a __ __ ROL
1f0d : 85 4b __ STA T3 + 2 
1f0f : a9 00 __ LDA #$00
1f11 : 06 49 __ ASL T3 + 0 
1f13 : 26 4a __ ROL T3 + 1 
1f15 : 26 4b __ ROL T3 + 2 
1f17 : a0 0f __ LDY #$0f
1f19 : 91 4e __ STA (T6 + 0),y 
1f1b : a5 49 __ LDA T3 + 0 
1f1d : a0 0c __ LDY #$0c
1f1f : 91 4e __ STA (T6 + 0),y 
1f21 : a5 4a __ LDA T3 + 1 
1f23 : c8 __ __ INY
1f24 : 91 4e __ STA (T6 + 0),y 
1f26 : a5 4b __ LDA T3 + 2 
1f28 : c8 __ __ INY
1f29 : 91 4e __ STA (T6 + 0),y 
1f2b : a5 4d __ LDA T4 + 1 
1f2d : f0 04 __ BEQ $1f33 ; (modplay_init.s36 + 0)
.s35:
1f2f : a9 01 __ LDA #$01
1f31 : d0 09 __ BNE $1f3c ; (modplay_init.s34 + 0)
.s36:
1f33 : a9 01 __ LDA #$01
1f35 : c5 4c __ CMP T4 + 0 
1f37 : a9 00 __ LDA #$00
1f39 : 2a __ __ ROL
1f3a : 49 01 __ EOR #$01
.s34:
1f3c : a0 10 __ LDY #$10
1f3e : 91 4e __ STA (T6 + 0),y 
1f40 : 18 __ __ CLC
1f41 : a5 46 __ LDA T2 + 0 
1f43 : 65 43 __ ADC T1 + 0 
1f45 : 85 43 __ STA T1 + 0 
1f47 : a5 47 __ LDA T2 + 1 
1f49 : 65 44 __ ADC T1 + 1 
1f4b : 85 44 __ STA T1 + 1 
1f4d : a5 48 __ LDA T2 + 2 
1f4f : 65 45 __ ADC T1 + 2 
1f51 : 85 45 __ STA T1 + 2 
1f53 : 90 02 __ BCC $1f57 ; (modplay_init.s57 + 0)
.s56:
1f55 : e8 __ __ INX
1f56 : 18 __ __ CLC
.s57:
1f57 : a5 50 __ LDA T7 + 0 
1f59 : 69 1e __ ADC #$1e
1f5b : 85 50 __ STA T7 + 0 
1f5d : 90 03 __ BCC $1f62 ; (modplay_init.s59 + 0)
.s58:
1f5f : e6 51 __ INC T7 + 1 
1f61 : 18 __ __ CLC
.s59:
1f62 : a5 4e __ LDA T6 + 0 
1f64 : 69 13 __ ADC #$13
1f66 : 85 4e __ STA T6 + 0 
1f68 : 90 02 __ BCC $1f6c ; (modplay_init.s61 + 0)
.s60:
1f6a : e6 4f __ INC T6 + 1 
.s61:
1f6c : e6 1e __ INC ACCU + 3 
1f6e : a5 1e __ LDA ACCU + 3 
1f70 : cd c1 9b CMP $9bc1 ; (modplay.num_samples + 0)
1f73 : b0 03 __ BCS $1f78 ; (modplay_init.s61 + 12)
1f75 : 4c 7d 1e JMP $1e7d ; (modplay_init.l32 + 0)
1f78 : 4c fa 1d JMP $1dfa ; (modplay_init.s21 + 0)
.s37:
1f7b : a9 3c __ LDA #$3c
1f7d : 85 1b __ STA ACCU + 0 
1f7f : a5 1c __ LDA ACCU + 1 
1f81 : 69 03 __ ADC #$03
1f83 : 85 1c __ STA ACCU + 1 
1f85 : b0 03 __ BCS $1f8a ; (modplay_init.s55 + 0)
1f87 : 4c 60 1e JMP $1e60 ; (modplay_init.s31 + 0)
.s55:
1f8a : e6 1d __ INC ACCU + 2 
1f8c : 4c 60 1e JMP $1e60 ; (modplay_init.s31 + 0)
.s40:
1f8f : a9 00 __ LDA #$00
1f91 : 4c 5d 1e JMP $1e5d ; (modplay_init.s3 + 0)
.s52:
1f94 : ad ba 9b LDA $9bba ; (hdr[0] + 1082)
1f97 : c9 4b __ CMP #$4b
1f99 : d0 0a __ BNE $1fa5 ; (modplay_init.s5 + 0)
.s53:
1f9b : ad bb 9b LDA $9bbb ; (hdr[0] + 1083)
1f9e : c9 2e __ CMP #$2e
1fa0 : d0 03 __ BNE $1fa5 ; (modplay_init.s5 + 0)
1fa2 : 4c 7d 1d JMP $1d7d ; (modplay_init.s44 + 0)
.s5:
1fa5 : ad b8 9b LDA $9bb8 ; (hdr[0] + 1080)
1fa8 : c9 34 __ CMP #$34
1faa : f0 03 __ BEQ $1faf ; (modplay_init.s45 + 0)
1fac : 4c 61 1d JMP $1d61 ; (modplay_init.s6 + 0)
.s45:
1faf : ad b9 9b LDA $9bb9 ; (hdr[0] + 1081)
1fb2 : c9 43 __ CMP #$43
1fb4 : f0 03 __ BEQ $1fb9 ; (modplay_init.s46 + 0)
1fb6 : 4c 81 1d JMP $1d81 ; (modplay_init.s7 + 0)
.s46:
1fb9 : ad ba 9b LDA $9bba ; (hdr[0] + 1082)
1fbc : c9 48 __ CMP #$48
1fbe : d0 f6 __ BNE $1fb6 ; (modplay_init.s45 + 7)
.s47:
1fc0 : ad bb 9b LDA $9bbb ; (hdr[0] + 1083)
1fc3 : c9 4e __ CMP #$4e
1fc5 : d0 ef __ BNE $1fb6 ; (modplay_init.s45 + 7)
1fc7 : 4c 7d 1d JMP $1d7d ; (modplay_init.s44 + 0)
--------------------------------------------------------------------
1fca : __ __ __ BYT 6d 55 53 49 43 00                               : mUSIC.
--------------------------------------------------------------------
1fd0 : __ __ __ BYT 34 45 56 2e 4d 4f 44 00                         : 4EV.MOD.
--------------------------------------------------------------------
1fd8 : __ __ __ BYT 62 41 44 20 6d 6f 64 20 46 4f 52 4d 41 54 00    : bAD mod FORMAT.
--------------------------------------------------------------------
1fe7 : __ __ __ BYT 6e 4f 54 20 46 4f 55 4e 44 00                   : nOT FOUND.
--------------------------------------------------------------------
memset@proxy: ; memset@proxy
1ff1 : a9 60 __ LDA #$60
1ff3 : 85 0d __ STA P0 
1ff5 : a9 f8 __ LDA #$f8
1ff7 : 85 0e __ STA P1 
1ff9 : 4c f1 23 JMP $23f1 ; (memset.s4 + 0)
--------------------------------------------------------------------
1ffc : __ __ __ BYT 31 00                                           : 1.
--------------------------------------------------------------------
1ffe : __ __ __ BYT 32 00                                           : 2.
--------------------------------------------------------------------
2000 : __ __ __ BYT 70 4c 41 43 45 20 44 45 4d 4f 20 49 4e 20 49 44 : pLACE DEMO IN ID
2010 : __ __ __ BYT 49 38 42 2f 55 4c 54 44 45 4d 4f 32 30 32 36 2f : I8B/ULTDEMO2026/
2020 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
2021 : __ __ __ BYT 64 45 54 45 43 54 49 4f 4e 20 43 4f 4d 50 4c 45 : dETECTION COMPLE
2031 : __ __ __ BYT 54 45 2e 00                                     : TE..
--------------------------------------------------------------------
screen_wait_key: ; screen_wait_key(const u8*)->void
;  37, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
2035 : a9 01 __ LDA #$01
2037 : 85 0f __ STA P2 
2039 : a5 10 __ LDA P3 ; (msg + 0)
203b : aa __ __ TAX
203c : 05 11 __ ORA P4 ; (msg + 1)
203e : f0 0a __ BEQ $204a ; (screen_wait_key.s5 + 0)
.s10:
2040 : a5 11 __ LDA P4 ; (msg + 1)
2042 : 85 0e __ STA P1 
2044 : a0 00 __ LDY #$00
2046 : b1 10 __ LDA (P3),y ; (msg + 0)
2048 : d0 06 __ BNE $2050 ; (screen_wait_key.s6 + 0)
.s5:
204a : a9 20 __ LDA #$20
204c : 85 0e __ STA P1 
204e : a2 79 __ LDX #$79
.s6:
2050 : 86 0d __ STX P0 
2052 : 20 32 11 JSR $1132 ; (cwin_put_string.s4 + 0)
2055 : 20 de 10 JSR $10de ; (cwin_cursor_newline.s4 + 0)
2058 : a9 00 __ LDA #$00
205a : 8d 00 dc STA $dc00 
.l7:
205d : ad 01 dc LDA $dc01 
2060 : c9 ff __ CMP #$ff
2062 : d0 f9 __ BNE $205d ; (screen_wait_key.l7 + 0)
.s8:
2064 : 8d 00 dc STA $dc00 
.l9:
2067 : a2 00 __ LDX #$00
2069 : 8e 00 dc STX $dc00 
206c : ae 01 dc LDX $dc01 
206f : 86 43 __ STX T0 + 0 
2071 : 8d 00 dc STA $dc00 
2074 : c5 43 __ CMP T0 + 0 
2076 : f0 ef __ BEQ $2067 ; (screen_wait_key.l9 + 0)
.s3:
2078 : 60 __ __ RTS
--------------------------------------------------------------------
2079 : __ __ __ BYT 70 52 45 53 53 20 41 4e 59 20 4b 45 59 20 54 4f : pRESS ANY KEY TO
2089 : __ __ __ BYT 20 43 4f 4e 54 49 4e 55 45 2e 00                :  CONTINUE..
--------------------------------------------------------------------
2094 : __ __ __ BYT 70 52 45 53 53 20 41 4e 59 20 4b 45 59 20 54 4f : pRESS ANY KEY TO
20a4 : __ __ __ BYT 20 53 54 41 52 54 20 54 48 45 20 44 45 4d 4f 2e :  START THE DEMO.
20b4 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
gears_run: ; gears_run()->void
;   8, "/home/xahmol/git/UltimateDemo2026/src/gears.h"
.s1:
20b5 : a5 53 __ LDA T0 + 0 
20b7 : 8d ad bf STA $bfad ; (gears_run@stack + 0)
.s4:
20ba : a9 00 __ LDA #$00
20bc : 85 f9 __ STA $f9 ; (zp_spd + 0)
20be : 85 f7 __ STA $f7 ; (zp_angle1 + 0)
20c0 : a9 01 __ LDA #$01
20c2 : 85 fa __ STA $fa ; (zp_dirty + 0)
20c4 : a9 1c __ LDA #$1c
20c6 : 85 f8 __ STA $f8 ; (zp_angle2 + 0)
20c8 : 20 87 23 JSR $2387 ; (hires_init.s4 + 0)
20cb : 20 57 24 JSR $2457 ; (engine_init.s4 + 0)
20ce : a9 00 __ LDA #$00
20d0 : 20 59 16 JSR $1659 ; (turbo_set.s4 + 0)
20d3 : a9 00 __ LDA #$00
20d5 : 85 0f __ STA P2 
20d7 : 85 10 __ STA P3 
20d9 : a9 e0 __ LDA #$e0
20db : 85 11 __ STA P4 
20dd : a9 06 __ LDA #$06
20df : 85 12 __ STA P5 
20e1 : 20 9e 24 JSR $249e ; (tod_reset.s4 + 0)
20e4 : 20 f1 1f JSR $1ff1 ; (memset@proxy + 0)
20e7 : a9 00 __ LDA #$00
20e9 : 8d f3 bf STA $bff3 ; (sstack + 9)
20ec : 20 a9 24 JSR $24a9 ; (draw_speed.s1 + 0)
20ef : a9 00 __ LDA #$00
20f1 : 8d f0 bf STA $bff0 ; (sstack + 6)
20f4 : 20 f9 2e JSR $2ef9 ; (draw_message.s1 + 0)
20f7 : a9 1c __ LDA #$1c
20f9 : 8d f9 bf STA $bff9 ; (sstack + 15)
20fc : 8d fc bf STA $bffc ; (sstack + 18)
20ff : a9 d0 __ LDA #$d0
2101 : 8d f7 bf STA $bff7 ; (sstack + 13)
2104 : a9 00 __ LDA #$00
2106 : 8d f8 bf STA $bff8 ; (sstack + 14)
2109 : a9 08 __ LDA #$08
210b : 8d fa bf STA $bffa ; (sstack + 16)
210e : 8d fb bf STA $bffb ; (sstack + 17)
2111 : 8d fe bf STA $bffe ; (sstack + 20)
2114 : a9 28 __ LDA #$28
2116 : 8d fd bf STA $bffd ; (sstack + 19)
2119 : a9 04 __ LDA #$04
211b : 8d ff bf STA $bfff ; (sstack + 21)
211e : 20 e9 32 JSR $32e9 ; (draw_gear.s1 + 0)
2121 : a9 00 __ LDA #$00
2123 : 8d f8 bf STA $bff8 ; (sstack + 14)
2126 : 8d f9 bf STA $bff9 ; (sstack + 15)
2129 : a9 78 __ LDA #$78
212b : 8d f7 bf STA $bff7 ; (sstack + 13)
212e : a9 10 __ LDA #$10
2130 : 8d fa bf STA $bffa ; (sstack + 16)
2133 : a9 04 __ LDA #$04
2135 : 8d fb bf STA $bffb ; (sstack + 17)
2138 : a9 2c __ LDA #$2c
213a : 8d fc bf STA $bffc ; (sstack + 18)
213d : a9 36 __ LDA #$36
213f : 8d fd bf STA $bffd ; (sstack + 19)
2142 : a9 0a __ LDA #$0a
2144 : 8d fe bf STA $bffe ; (sstack + 20)
2147 : a9 06 __ LDA #$06
2149 : 8d ff bf STA $bfff ; (sstack + 21)
214c : 20 e9 32 JSR $32e9 ; (draw_gear.s1 + 0)
214f : a9 00 __ LDA #$00
.l20:
2151 : 85 fa __ STA $fa ; (zp_dirty + 0)
.l5:
2153 : a9 0f __ LDA #$0f
2155 : c5 f9 __ CMP $f9 ; (zp_spd + 0)
2157 : b0 0f __ BCS $2168 ; (gears_run.l12 + 0)
.s6:
2159 : a9 8f __ LDA #$8f
215b : 20 59 16 JSR $1659 ; (turbo_set.s4 + 0)
215e : a9 0f __ LDA #$0f
2160 : 85 f9 __ STA $f9 ; (zp_spd + 0)
2162 : 20 9e 24 JSR $249e ; (tod_reset.s4 + 0)
2165 : 4c 94 22 JMP $2294 ; (gears_run.l7 + 0)
.l12:
2168 : 2c 11 d0 BIT $d011 
216b : 30 fb __ BMI $2168 ; (gears_run.l12 + 0)
.l13:
216d : 2c 11 d0 BIT $d011 
2170 : 10 fb __ BPL $216d ; (gears_run.l13 + 0)
.s14:
2172 : a5 fa __ LDA $fa ; (zp_dirty + 0)
2174 : f0 25 __ BEQ $219b ; (gears_run.s15 + 0)
.s19:
2176 : a9 00 __ LDA #$00
2178 : 85 0f __ STA P2 
217a : 85 10 __ STA P3 
217c : a9 e0 __ LDA #$e0
217e : 85 11 __ STA P4 
2180 : a9 06 __ LDA #$06
2182 : 85 12 __ STA P5 
2184 : 20 f1 1f JSR $1ff1 ; (memset@proxy + 0)
2187 : a5 f9 __ LDA $f9 ; (zp_spd + 0)
2189 : 8d f3 bf STA $bff3 ; (sstack + 9)
218c : 20 a9 24 JSR $24a9 ; (draw_speed.s1 + 0)
218f : a5 f9 __ LDA $f9 ; (zp_spd + 0)
2191 : 8d f0 bf STA $bff0 ; (sstack + 6)
2194 : 20 f9 2e JSR $2ef9 ; (draw_message.s1 + 0)
2197 : a9 00 __ LDA #$00
2199 : 85 fa __ STA $fa ; (zp_dirty + 0)
.s15:
219b : a9 d0 __ LDA #$d0
219d : 8d f7 bf STA $bff7 ; (sstack + 13)
21a0 : a9 00 __ LDA #$00
21a2 : 8d f8 bf STA $bff8 ; (sstack + 14)
21a5 : a5 f8 __ LDA $f8 ; (zp_angle2 + 0)
21a7 : 8d f9 bf STA $bff9 ; (sstack + 15)
21aa : a9 08 __ LDA #$08
21ac : 8d fa bf STA $bffa ; (sstack + 16)
21af : 8d fb bf STA $bffb ; (sstack + 17)
21b2 : 8d fe bf STA $bffe ; (sstack + 20)
21b5 : a9 1c __ LDA #$1c
21b7 : 8d fc bf STA $bffc ; (sstack + 18)
21ba : a9 28 __ LDA #$28
21bc : 8d fd bf STA $bffd ; (sstack + 19)
21bf : a9 04 __ LDA #$04
21c1 : 8d ff bf STA $bfff ; (sstack + 21)
21c4 : 20 e9 32 JSR $32e9 ; (draw_gear.s1 + 0)
21c7 : a9 78 __ LDA #$78
21c9 : 8d f7 bf STA $bff7 ; (sstack + 13)
21cc : a9 00 __ LDA #$00
21ce : 8d f8 bf STA $bff8 ; (sstack + 14)
21d1 : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
21d3 : 8d f9 bf STA $bff9 ; (sstack + 15)
21d6 : a9 10 __ LDA #$10
21d8 : 8d fa bf STA $bffa ; (sstack + 16)
21db : a9 04 __ LDA #$04
21dd : 8d fb bf STA $bffb ; (sstack + 17)
21e0 : a9 2c __ LDA #$2c
21e2 : 8d fc bf STA $bffc ; (sstack + 18)
21e5 : a9 36 __ LDA #$36
21e7 : 8d fd bf STA $bffd ; (sstack + 19)
21ea : a9 0a __ LDA #$0a
21ec : 8d fe bf STA $bffe ; (sstack + 20)
21ef : a9 06 __ LDA #$06
21f1 : 8d ff bf STA $bfff ; (sstack + 21)
21f4 : 20 e9 32 JSR $32e9 ; (draw_gear.s1 + 0)
21f7 : 78 __ __ SEI
21f8 : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
21fa : 18 __ __ CLC
21fb : 69 01 __ ADC #$01
21fd : 29 3f __ AND #$3f
21ff : 85 f7 __ STA $f7 ; (zp_angle1 + 0)
2201 : a5 f8 __ LDA $f8 ; (zp_angle2 + 0)
2203 : 38 __ __ SEC
2204 : e9 02 __ SBC #$02
2206 : 29 3f __ AND #$3f
2208 : 85 53 __ STA T0 + 0 
220a : 85 f8 __ STA $f8 ; (zp_angle2 + 0)
220c : 58 __ __ CLI
220d : a9 d0 __ LDA #$d0
220f : 8d f7 bf STA $bff7 ; (sstack + 13)
2212 : a9 00 __ LDA #$00
2214 : 8d f8 bf STA $bff8 ; (sstack + 14)
2217 : a5 53 __ LDA T0 + 0 
2219 : 8d f9 bf STA $bff9 ; (sstack + 15)
221c : a9 08 __ LDA #$08
221e : 8d fa bf STA $bffa ; (sstack + 16)
2221 : 8d fb bf STA $bffb ; (sstack + 17)
2224 : 8d fe bf STA $bffe ; (sstack + 20)
2227 : a9 1c __ LDA #$1c
2229 : 8d fc bf STA $bffc ; (sstack + 18)
222c : a9 28 __ LDA #$28
222e : 8d fd bf STA $bffd ; (sstack + 19)
2231 : a9 04 __ LDA #$04
2233 : 8d ff bf STA $bfff ; (sstack + 21)
2236 : 20 e9 32 JSR $32e9 ; (draw_gear.s1 + 0)
2239 : a9 78 __ LDA #$78
223b : 8d f7 bf STA $bff7 ; (sstack + 13)
223e : a9 00 __ LDA #$00
2240 : 8d f8 bf STA $bff8 ; (sstack + 14)
2243 : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
2245 : 8d f9 bf STA $bff9 ; (sstack + 15)
2248 : a9 10 __ LDA #$10
224a : 8d fa bf STA $bffa ; (sstack + 16)
224d : a9 04 __ LDA #$04
224f : 8d fb bf STA $bffb ; (sstack + 17)
2252 : a9 2c __ LDA #$2c
2254 : 8d fc bf STA $bffc ; (sstack + 18)
2257 : a9 36 __ LDA #$36
2259 : 8d fd bf STA $bffd ; (sstack + 19)
225c : a9 0a __ LDA #$0a
225e : 8d fe bf STA $bffe ; (sstack + 20)
2261 : a9 06 __ LDA #$06
2263 : 8d ff bf STA $bfff ; (sstack + 21)
2266 : 20 e9 32 JSR $32e9 ; (draw_gear.s1 + 0)
2269 : ad 09 dc LDA $dc09 
226c : d0 03 __ BNE $2271 ; (gears_run.s16 + 0)
226e : 4c 53 21 JMP $2153 ; (gears_run.l5 + 0)
.s16:
2271 : 20 9e 24 JSR $249e ; (tod_reset.s4 + 0)
2274 : a4 f9 __ LDY $f9 ; (zp_spd + 0)
2276 : c0 0f __ CPY #$0f
2278 : b0 13 __ BCS $228d ; (gears_run.s17 + 0)
.s18:
227a : c8 __ __ INY
227b : 84 0d __ STY P0 
227d : 84 f9 __ STY $f9 ; (zp_spd + 0)
227f : 98 __ __ TYA
2280 : 20 59 16 JSR $1659 ; (turbo_set.s4 + 0)
2283 : a5 0d __ LDA P0 
2285 : 20 49 41 JSR $4149 ; (engine_update.s4 + 0)
2288 : a9 01 __ LDA #$01
228a : 4c 51 21 JMP $2151 ; (gears_run.l20 + 0)
.s17:
228d : a9 10 __ LDA #$10
228f : 85 f9 __ STA $f9 ; (zp_spd + 0)
2291 : 4c 53 21 JMP $2153 ; (gears_run.l5 + 0)
.l7:
2294 : ad 09 dc LDA $dc09 
2297 : c9 05 __ CMP #$05
2299 : 90 11 __ BCC $22ac ; (gears_run.l9 + 0)
.s8:
229b : a9 00 __ LDA #$00
229d : 8d 04 d4 STA $d404 
22a0 : 8d 0b d4 STA $d40b 
22a3 : 8d 18 d4 STA $d418 
.s3:
22a6 : ad ad bf LDA $bfad ; (gears_run@stack + 0)
22a9 : 85 53 __ STA T0 + 0 
22ab : 60 __ __ RTS
.l9:
22ac : 2c 11 d0 BIT $d011 
22af : 30 fb __ BMI $22ac ; (gears_run.l9 + 0)
.l10:
22b1 : 2c 11 d0 BIT $d011 
22b4 : 10 fb __ BPL $22b1 ; (gears_run.l10 + 0)
.s11:
22b6 : a9 d0 __ LDA #$d0
22b8 : 8d f7 bf STA $bff7 ; (sstack + 13)
22bb : a9 00 __ LDA #$00
22bd : 8d f8 bf STA $bff8 ; (sstack + 14)
22c0 : a5 f8 __ LDA $f8 ; (zp_angle2 + 0)
22c2 : 8d f9 bf STA $bff9 ; (sstack + 15)
22c5 : a9 08 __ LDA #$08
22c7 : 8d fa bf STA $bffa ; (sstack + 16)
22ca : 8d fb bf STA $bffb ; (sstack + 17)
22cd : 8d fe bf STA $bffe ; (sstack + 20)
22d0 : a9 1c __ LDA #$1c
22d2 : 8d fc bf STA $bffc ; (sstack + 18)
22d5 : a9 28 __ LDA #$28
22d7 : 8d fd bf STA $bffd ; (sstack + 19)
22da : a9 04 __ LDA #$04
22dc : 8d ff bf STA $bfff ; (sstack + 21)
22df : 20 e9 32 JSR $32e9 ; (draw_gear.s1 + 0)
22e2 : a9 78 __ LDA #$78
22e4 : 8d f7 bf STA $bff7 ; (sstack + 13)
22e7 : a9 00 __ LDA #$00
22e9 : 8d f8 bf STA $bff8 ; (sstack + 14)
22ec : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
22ee : 8d f9 bf STA $bff9 ; (sstack + 15)
22f1 : a9 10 __ LDA #$10
22f3 : 8d fa bf STA $bffa ; (sstack + 16)
22f6 : a9 04 __ LDA #$04
22f8 : 8d fb bf STA $bffb ; (sstack + 17)
22fb : a9 2c __ LDA #$2c
22fd : 8d fc bf STA $bffc ; (sstack + 18)
2300 : a9 36 __ LDA #$36
2302 : 8d fd bf STA $bffd ; (sstack + 19)
2305 : a9 0a __ LDA #$0a
2307 : 8d fe bf STA $bffe ; (sstack + 20)
230a : a9 06 __ LDA #$06
230c : 8d ff bf STA $bfff ; (sstack + 21)
230f : 20 e9 32 JSR $32e9 ; (draw_gear.s1 + 0)
2312 : 78 __ __ SEI
2313 : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
2315 : 18 __ __ CLC
2316 : 69 01 __ ADC #$01
2318 : 29 3f __ AND #$3f
231a : 85 f7 __ STA $f7 ; (zp_angle1 + 0)
231c : a5 f8 __ LDA $f8 ; (zp_angle2 + 0)
231e : 38 __ __ SEC
231f : e9 02 __ SBC #$02
2321 : 29 3f __ AND #$3f
2323 : 85 53 __ STA T0 + 0 
2325 : 85 f8 __ STA $f8 ; (zp_angle2 + 0)
2327 : 58 __ __ CLI
2328 : a9 d0 __ LDA #$d0
232a : 8d f7 bf STA $bff7 ; (sstack + 13)
232d : a9 00 __ LDA #$00
232f : 8d f8 bf STA $bff8 ; (sstack + 14)
2332 : a5 53 __ LDA T0 + 0 
2334 : 8d f9 bf STA $bff9 ; (sstack + 15)
2337 : a9 08 __ LDA #$08
2339 : 8d fa bf STA $bffa ; (sstack + 16)
233c : 8d fb bf STA $bffb ; (sstack + 17)
233f : 8d fe bf STA $bffe ; (sstack + 20)
2342 : a9 1c __ LDA #$1c
2344 : 8d fc bf STA $bffc ; (sstack + 18)
2347 : a9 28 __ LDA #$28
2349 : 8d fd bf STA $bffd ; (sstack + 19)
234c : a9 04 __ LDA #$04
234e : 8d ff bf STA $bfff ; (sstack + 21)
2351 : 20 e9 32 JSR $32e9 ; (draw_gear.s1 + 0)
2354 : a9 78 __ LDA #$78
2356 : 8d f7 bf STA $bff7 ; (sstack + 13)
2359 : a9 00 __ LDA #$00
235b : 8d f8 bf STA $bff8 ; (sstack + 14)
235e : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
2360 : 8d f9 bf STA $bff9 ; (sstack + 15)
2363 : a9 10 __ LDA #$10
2365 : 8d fa bf STA $bffa ; (sstack + 16)
2368 : a9 04 __ LDA #$04
236a : 8d fb bf STA $bffb ; (sstack + 17)
236d : a9 2c __ LDA #$2c
236f : 8d fc bf STA $bffc ; (sstack + 18)
2372 : a9 36 __ LDA #$36
2374 : 8d fd bf STA $bffd ; (sstack + 19)
2377 : a9 0a __ LDA #$0a
2379 : 8d fe bf STA $bffe ; (sstack + 20)
237c : a9 06 __ LDA #$06
237e : 8d ff bf STA $bfff ; (sstack + 21)
2381 : 20 e9 32 JSR $32e9 ; (draw_gear.s1 + 0)
2384 : 4c 94 22 JMP $2294 ; (gears_run.l7 + 0)
--------------------------------------------------------------------
hires_init: ; hires_init()->void
; 246, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s4:
2387 : 78 __ __ SEI
2388 : a9 00 __ LDA #$00
238a : 85 0f __ STA P2 
238c : 85 10 __ STA P3 
238e : a9 30 __ LDA #$30
2390 : 85 01 __ STA $01 
2392 : a9 40 __ LDA #$40
2394 : 85 11 __ STA P4 
2396 : a9 1f __ LDA #$1f
2398 : 85 12 __ STA P5 
239a : a9 10 __ LDA #$10
239c : a2 fa __ LDX #$fa
.l6:
239e : ca __ __ DEX
239f : 9d 00 d0 STA $d000,x 
23a2 : 9d fa d0 STA $d0fa,x 
23a5 : 9d f4 d1 STA $d1f4,x 
23a8 : 9d ee d2 STA $d2ee,x 
23ab : d0 f1 __ BNE $239e ; (hires_init.l6 + 0)
.s5:
23ad : a9 00 __ LDA #$00
23af : 85 43 __ STA T1 + 0 
23b1 : 85 0d __ STA P0 
23b3 : a9 e0 __ LDA #$e0
23b5 : 85 44 __ STA T1 + 1 
23b7 : 85 0e __ STA P1 
23b9 : 20 f1 23 JSR $23f1 ; (memset.s4 + 0)
23bc : a9 35 __ LDA #$35
23be : 85 01 __ STA $01 
23c0 : 20 0d 24 JSR $240d ; (mmap_trampoline.s4 + 0)
23c3 : 58 __ __ CLI
23c4 : 20 6e 7c JSR $7c6e ; (vic_setmode@proxy + 0)
23c7 : a5 10 __ LDA P3 
23c9 : 8d a2 87 STA $87a2 ; (Screen.data + 0)
23cc : a5 11 __ LDA P4 
23ce : 8d a3 87 STA $87a3 ; (Screen.data + 1)
23d1 : a9 28 __ LDA #$28
23d3 : 8d a6 87 STA $87a6 ; (Screen.cwidth + 0)
23d6 : a9 19 __ LDA #$19
23d8 : 8d a7 87 STA $87a7 ; (Screen.cheight + 0)
23db : a9 40 __ LDA #$40
23dd : 8d a8 87 STA $87a8 ; (Screen.width + 0)
23e0 : a9 01 __ LDA #$01
23e2 : 8d a9 87 STA $87a9 ; (Screen.width + 1)
23e5 : a9 00 __ LDA #$00
23e7 : 8d 20 d0 STA $d020 
23ea : 8d a4 87 STA $87a4 ; (Screen.rdata + 0)
23ed : 8d a5 87 STA $87a5 ; (Screen.rdata + 1)
.s3:
23f0 : 60 __ __ RTS
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void
;  28, "/home/xahmol/oscar64/include/string.h"
.s4:
23f1 : a5 0f __ LDA P2 
23f3 : a6 12 __ LDX P5 
23f5 : f0 0c __ BEQ $2403 ; (memset.s4 + 18)
23f7 : a0 00 __ LDY #$00
23f9 : 91 0d __ STA (P0),y 
23fb : c8 __ __ INY
23fc : d0 fb __ BNE $23f9 ; (memset.s4 + 8)
23fe : e6 0e __ INC P1 
2400 : ca __ __ DEX
2401 : d0 f6 __ BNE $23f9 ; (memset.s4 + 8)
2403 : a4 11 __ LDY P4 
2405 : f0 05 __ BEQ $240c ; (memset.s3 + 0)
2407 : 88 __ __ DEY
2408 : 91 0d __ STA (P0),y 
240a : d0 fb __ BNE $2407 ; (memset.s4 + 22)
.s3:
240c : 60 __ __ RTS
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/xahmol/oscar64/include/c64/memmap.h"
.s4:
240d : a9 22 __ LDA #$22
240f : 8d fa ff STA $fffa 
2412 : a9 24 __ LDA #$24
2414 : 8d fb ff STA $fffb 
2417 : a9 40 __ LDA #$40
2419 : 8d fe ff STA $fffe 
241c : a9 24 __ LDA #$24
241e : 8d ff ff STA $ffff 
.s3:
2421 : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
2422 : 48 __ __ PHA
2423 : 8a __ __ TXA
2424 : 48 __ __ PHA
2425 : a9 24 __ LDA #$24
2427 : 48 __ __ PHA
2428 : a9 39 __ LDA #$39
242a : 48 __ __ PHA
242b : ba __ __ TSX
242c : bd 05 01 LDA $0105,x 
242f : 48 __ __ PHA
2430 : a6 01 __ LDX $01 
2432 : a9 36 __ LDA #$36
2434 : 85 01 __ STA $01 
2436 : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
2439 : 86 01 __ STX $01 
243b : 68 __ __ PLA
243c : aa __ __ TAX
243d : 68 __ __ PLA
243e : 40 __ __ RTI
243f : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
2440 : 48 __ __ PHA
2441 : 8a __ __ TXA
2442 : 48 __ __ PHA
2443 : a9 24 __ LDA #$24
2445 : 48 __ __ PHA
2446 : a9 39 __ LDA #$39
2448 : 48 __ __ PHA
2449 : ba __ __ TSX
244a : bd 05 01 LDA $0105,x 
244d : 48 __ __ PHA
244e : a6 01 __ LDX $01 
2450 : a9 36 __ LDA #$36
2452 : 85 01 __ STA $01 
2454 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
engine_init: ; engine_init()->void
; 337, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s4:
2457 : a9 00 __ LDA #$00
2459 : 8d 15 d4 STA $d415 
245c : a9 18 __ LDA #$18
245e : 8d 16 d4 STA $d416 
2461 : a9 83 __ LDA #$83
2463 : 8d 17 d4 STA $d417 
2466 : a9 1f __ LDA #$1f
2468 : 8d 18 d4 STA $d418 
246b : a9 05 __ LDA #$05
246d : 8d 05 d4 STA $d405 
2470 : a9 f3 __ LDA #$f3
2472 : 8d 06 d4 STA $d406 
2475 : a9 a9 __ LDA #$a9
2477 : 8d 00 d4 STA $d400 
247a : a9 02 __ LDA #$02
247c : 8d 01 d4 STA $d401 
247f : a9 21 __ LDA #$21
2481 : 8d 04 d4 STA $d404 
2484 : a9 05 __ LDA #$05
2486 : 8d 0c d4 STA $d40c 
2489 : a9 f3 __ LDA #$f3
248b : 8d 0d d4 STA $d40d 
248e : a9 52 __ LDA #$52
2490 : 8d 07 d4 STA $d407 
2493 : a9 05 __ LDA #$05
2495 : 8d 08 d4 STA $d408 
2498 : a9 81 __ LDA #$81
249a : 8d 0b d4 STA $d40b 
.s3:
249d : 60 __ __ RTS
--------------------------------------------------------------------
tod_reset: ; tod_reset()->void
; 277, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s4:
249e : 78 __ __ SEI
249f : a9 00 __ LDA #$00
24a1 : 8d 09 dc STA $dc09 
24a4 : 8d 08 dc STA $dc08 
24a7 : 58 __ __ CLI
.s3:
24a8 : 60 __ __ RTS
--------------------------------------------------------------------
draw_speed: ; draw_speed(u8)->void
; 194, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s1:
24a9 : a2 05 __ LDX #$05
24ab : b5 53 __ LDA T1 + 0,x 
24ad : 9d c3 bf STA $bfc3,x ; (draw_speed@stack + 0)
24b0 : ca __ __ DEX
24b1 : 10 f8 __ BPL $24ab ; (draw_speed.s1 + 2)
.s4:
24b3 : ad f3 bf LDA $bff3 ; (sstack + 9)
24b6 : 0a __ __ ASL
24b7 : aa __ __ TAX
24b8 : bd 20 7d LDA $7d20,x ; (speed_nums[0] + 0)
24bb : 85 53 __ STA T1 + 0 
24bd : 85 0d __ STA P0 
24bf : bd 21 7d LDA $7d21,x ; (speed_nums[0] + 1)
24c2 : 85 54 __ STA T1 + 1 
24c4 : 85 0e __ STA P1 
24c6 : 20 aa 10 JSR $10aa ; (strlen.s4 + 0)
24c9 : a5 1b __ LDA ACCU + 0 
24cb : 0a __ __ ASL
24cc : a2 00 __ LDX #$00
24ce : 90 02 __ BCC $24d2 ; (draw_speed.s9 + 0)
.s8:
24d0 : e8 __ __ INX
24d1 : 18 __ __ CLC
.s9:
24d2 : 65 1b __ ADC ACCU + 0 
24d4 : 85 43 __ STA T0 + 0 
24d6 : 8a __ __ TXA
24d7 : 69 00 __ ADC #$00
24d9 : 06 43 __ ASL T0 + 0 
24db : 2a __ __ ROL
24dc : 06 43 __ ASL T0 + 0 
24de : 2a __ __ ROL
24df : aa __ __ TAX
24e0 : 18 __ __ CLC
24e1 : a5 43 __ LDA T0 + 0 
24e3 : 69 28 __ ADC #$28
24e5 : 85 43 __ STA T0 + 0 
24e7 : 90 01 __ BCC $24ea ; (draw_speed.s11 + 0)
.s10:
24e9 : e8 __ __ INX
.s11:
24ea : 86 44 __ STX T0 + 1 
24ec : 38 __ __ SEC
24ed : a9 40 __ LDA #$40
24ef : e5 43 __ SBC T0 + 0 
24f1 : a8 __ __ TAY
24f2 : a9 01 __ LDA #$01
24f4 : e5 44 __ SBC T0 + 1 
24f6 : aa __ __ TAX
24f7 : 0a __ __ ASL
24f8 : 98 __ __ TYA
24f9 : 69 00 __ ADC #$00
24fb : 85 56 __ STA T3 + 0 
24fd : 8a __ __ TXA
24fe : 69 00 __ ADC #$00
2500 : c9 80 __ CMP #$80
2502 : 6a __ __ ROR
2503 : 66 56 __ ROR T3 + 0 
2505 : 85 57 __ STA T3 + 1 
2507 : a5 1b __ LDA ACCU + 0 
2509 : f0 30 __ BEQ $253b ; (draw_speed.s5 + 0)
.s6:
250b : 85 55 __ STA T2 + 0 
250d : a9 00 __ LDA #$00
250f : 85 58 __ STA T4 + 0 
.l7:
2511 : a5 56 __ LDA T3 + 0 
2513 : 8d f0 bf STA $bff0 ; (sstack + 6)
2516 : a5 57 __ LDA T3 + 1 
2518 : 8d f1 bf STA $bff1 ; (sstack + 7)
251b : a4 58 __ LDY T4 + 0 
251d : b1 53 __ LDA (T1 + 0),y 
251f : 38 __ __ SEC
2520 : e9 30 __ SBC #$30
2522 : 8d f2 bf STA $bff2 ; (sstack + 8)
2525 : 20 b9 25 JSR $25b9 ; (draw_glyph.s1 + 0)
2528 : 18 __ __ CLC
2529 : a5 56 __ LDA T3 + 0 
252b : 69 0c __ ADC #$0c
252d : 85 56 __ STA T3 + 0 
252f : 90 02 __ BCC $2533 ; (draw_speed.s13 + 0)
.s12:
2531 : e6 57 __ INC T3 + 1 
.s13:
2533 : e6 58 __ INC T4 + 0 
2535 : a5 58 __ LDA T4 + 0 
2537 : c5 55 __ CMP T2 + 0 
2539 : 90 d6 __ BCC $2511 ; (draw_speed.l7 + 0)
.s5:
253b : a9 0a __ LDA #$0a
253d : 8d f2 bf STA $bff2 ; (sstack + 8)
2540 : 18 __ __ CLC
2541 : a5 56 __ LDA T3 + 0 
2543 : 69 06 __ ADC #$06
2545 : 85 56 __ STA T3 + 0 
2547 : 8d f0 bf STA $bff0 ; (sstack + 6)
254a : a5 57 __ LDA T3 + 1 
254c : 69 00 __ ADC #$00
254e : 85 57 __ STA T3 + 1 
2550 : 8d f1 bf STA $bff1 ; (sstack + 7)
2553 : 20 b9 25 JSR $25b9 ; (draw_glyph.s1 + 0)
2556 : a9 0b __ LDA #$0b
2558 : 8d f2 bf STA $bff2 ; (sstack + 8)
255b : 18 __ __ CLC
255c : a5 56 __ LDA T3 + 0 
255e : 69 0c __ ADC #$0c
2560 : 85 56 __ STA T3 + 0 
2562 : 8d f0 bf STA $bff0 ; (sstack + 6)
2565 : a5 57 __ LDA T3 + 1 
2567 : 69 00 __ ADC #$00
2569 : 85 57 __ STA T3 + 1 
256b : 8d f1 bf STA $bff1 ; (sstack + 7)
256e : 20 b9 25 JSR $25b9 ; (draw_glyph.s1 + 0)
2571 : a9 0c __ LDA #$0c
2573 : 8d f2 bf STA $bff2 ; (sstack + 8)
2576 : 18 __ __ CLC
2577 : a5 56 __ LDA T3 + 0 
2579 : 69 0c __ ADC #$0c
257b : 8d f0 bf STA $bff0 ; (sstack + 6)
257e : a5 57 __ LDA T3 + 1 
2580 : 69 00 __ ADC #$00
2582 : 8d f1 bf STA $bff1 ; (sstack + 7)
2585 : 20 b9 25 JSR $25b9 ; (draw_glyph.s1 + 0)
.s3:
2588 : a2 05 __ LDX #$05
258a : bd c3 bf LDA $bfc3,x ; (draw_speed@stack + 0)
258d : 95 53 __ STA T1 + 0,x 
258f : ca __ __ DEX
2590 : 10 f8 __ BPL $258a ; (draw_speed.s3 + 2)
2592 : 60 __ __ RTS
--------------------------------------------------------------------
2593 : __ __ __ BYT 33 00                                           : 3.
--------------------------------------------------------------------
2595 : __ __ __ BYT 34 00                                           : 4.
--------------------------------------------------------------------
2597 : __ __ __ BYT 36 00                                           : 6.
--------------------------------------------------------------------
2599 : __ __ __ BYT 38 00                                           : 8.
--------------------------------------------------------------------
259b : __ __ __ BYT 31 32 00                                        : 12.
--------------------------------------------------------------------
259e : __ __ __ BYT 31 36 00                                        : 16.
--------------------------------------------------------------------
25a1 : __ __ __ BYT 32 30 00                                        : 20.
--------------------------------------------------------------------
25a4 : __ __ __ BYT 32 34 00                                        : 24.
--------------------------------------------------------------------
25a7 : __ __ __ BYT 32 38 00                                        : 28.
--------------------------------------------------------------------
25aa : __ __ __ BYT 33 32 00                                        : 32.
--------------------------------------------------------------------
25ad : __ __ __ BYT 33 36 00                                        : 36.
--------------------------------------------------------------------
25b0 : __ __ __ BYT 34 30 00                                        : 40.
--------------------------------------------------------------------
25b3 : __ __ __ BYT 34 38 00                                        : 48.
--------------------------------------------------------------------
25b6 : __ __ __ BYT 36 34 00                                        : 64.
--------------------------------------------------------------------
draw_glyph: ; draw_glyph(i16,i16,u8)->void
; 176, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s1:
25b9 : a2 04 __ LDX #$04
25bb : b5 53 __ LDA T2 + 0,x 
25bd : 9d ca bf STA $bfca,x ; (draw_glyph@stack + 0)
25c0 : ca __ __ DEX
25c1 : 10 f8 __ BPL $25bb ; (draw_glyph.s1 + 2)
.s4:
25c3 : ae f2 bf LDX $bff2 ; (sstack + 8)
25c6 : bd 91 7b LDA $7b91,x ; (__multab7L + 0)
25c9 : 18 __ __ CLC
25ca : 69 40 __ ADC #$40
25cc : 85 53 __ STA T2 + 0 
25ce : a9 7d __ LDA #$7d
25d0 : 69 00 __ ADC #$00
25d2 : 85 54 __ STA T2 + 1 
25d4 : a9 87 __ LDA #$87
25d6 : 85 15 __ STA P8 
25d8 : a9 a2 __ LDA #$a2
25da : 85 14 __ STA P7 
25dc : a9 44 __ LDA #$44
25de : 85 18 __ STA P11 
25e0 : a9 00 __ LDA #$00
25e2 : 85 13 __ STA P6 
25e4 : 85 57 __ STA T6 + 0 
25e6 : 18 __ __ CLC
.l5:
25e7 : 69 57 __ ADC #$57
25e9 : 0a __ __ ASL
25ea : 85 55 __ STA T4 + 0 
25ec : a2 00 __ LDX #$00
25ee : 86 56 __ STX T5 + 0 
.l6:
25f0 : bd e8 86 LDA $86e8,x ; (bitshift[0] + 32)
25f3 : a4 57 __ LDY T6 + 0 
25f5 : 31 53 __ AND (T2 + 0),y 
25f7 : f0 30 __ BEQ $2629 ; (draw_glyph.s7 + 0)
.s9:
25f9 : a5 55 __ LDA T4 + 0 
25fb : 85 12 __ STA P5 
25fd : 8d ea bf STA $bfea ; (sstack + 0)
2600 : a9 00 __ LDA #$00
2602 : 8d eb bf STA $bfeb ; (sstack + 1)
2605 : 8d ed bf STA $bfed ; (sstack + 3)
2608 : 8d ef bf STA $bfef ; (sstack + 5)
260b : a9 02 __ LDA #$02
260d : 8d ec bf STA $bfec ; (sstack + 2)
2610 : 8d ee bf STA $bfee ; (sstack + 4)
2613 : 8a __ __ TXA
2614 : 0a __ __ ASL
2615 : 18 __ __ CLC
2616 : 6d f0 bf ADC $bff0 ; (sstack + 6)
2619 : 85 10 __ STA P3 
261b : 85 16 __ STA P9 
261d : ad f1 bf LDA $bff1 ; (sstack + 7)
2620 : 69 00 __ ADC #$00
2622 : 85 11 __ STA P4 
2624 : 85 17 __ STA P10 
2626 : 20 44 26 JSR $2644 ; (bmu_bitblit.s1 + 0)
.s7:
2629 : e6 56 __ INC T5 + 0 
262b : a6 56 __ LDX T5 + 0 
262d : e0 05 __ CPX #$05
262f : d0 bf __ BNE $25f0 ; (draw_glyph.l6 + 0)
.s8:
2631 : e6 57 __ INC T6 + 0 
2633 : a5 57 __ LDA T6 + 0 
2635 : c9 07 __ CMP #$07
2637 : 90 ae __ BCC $25e7 ; (draw_glyph.l5 + 0)
.s3:
2639 : a2 04 __ LDX #$04
263b : bd ca bf LDA $bfca,x ; (draw_glyph@stack + 0)
263e : 95 53 __ STA T2 + 0,x 
2640 : ca __ __ DEX
2641 : 10 f8 __ BPL $263b ; (draw_glyph.s3 + 2)
2643 : 60 __ __ RTS
--------------------------------------------------------------------
bmu_bitblit: ; bmu_bitblit(const struct Bitmap*,i16,i16,const struct Bitmap*,i16,i16,i16,i16,const u8*,enum BlitOp)->void
; 119, "/home/xahmol/oscar64/include/gfx/bitmap.h"
.s1:
2644 : a2 0c __ LDX #$0c
2646 : b5 53 __ LDA T11 + 0,x 
2648 : 9d d3 bf STA $bfd3,x ; (bmu_bitblit@stack + 0)
264b : ca __ __ DEX
264c : 10 f8 __ BPL $2646 ; (bmu_bitblit.s1 + 2)
.s4:
264e : a5 10 __ LDA P3 ; (dx + 0)
2650 : 85 47 __ STA T2 + 0 
2652 : 18 __ __ CLC
2653 : 6d ec bf ADC $bfec ; (sstack + 2)
2656 : 85 45 __ STA T1 + 0 
2658 : 29 07 __ AND #$07
265a : aa __ __ TAX
265b : bd 9b 7d LDA $7d9b,x ; (rmask[0] + 0)
265e : 85 56 __ STA T14 + 0 
2660 : ad ed bf LDA $bfed ; (sstack + 3)
2663 : 65 11 __ ADC P4 ; (dx + 1)
2665 : 4a __ __ LSR
2666 : 66 45 __ ROR T1 + 0 
2668 : 4a __ __ LSR
2669 : 66 45 __ ROR T1 + 0 
266b : 4a __ __ LSR
266c : 66 45 __ ROR T1 + 0 
266e : a5 11 __ LDA P4 ; (dx + 1)
2670 : 4a __ __ LSR
2671 : 66 47 __ ROR T2 + 0 
2673 : 4a __ __ LSR
2674 : 66 47 __ ROR T2 + 0 
2676 : 4a __ __ LSR
2677 : 66 47 __ ROR T2 + 0 
2679 : 38 __ __ SEC
267a : a5 45 __ LDA T1 + 0 
267c : e5 47 __ SBC T2 + 0 
267e : 85 4d __ STA T6 + 0 
2680 : a5 10 __ LDA P3 ; (dx + 0)
2682 : 29 07 __ AND #$07
2684 : 85 45 __ STA T1 + 0 
2686 : aa __ __ TAX
2687 : bd f7 7c LDA $7cf7,x ; (lmask[0] + 0)
268a : 85 52 __ STA T12 + 0 
268c : 85 55 __ STA T13 + 0 
268e : ad ee bf LDA $bfee ; (sstack + 4)
2691 : 85 4e __ STA T8 + 0 
2693 : a5 14 __ LDA P7 ; (sbm + 0)
2695 : 85 4f __ STA T9 + 0 
2697 : a6 15 __ LDX P8 ; (sbm + 1)
2699 : 86 50 __ STX T9 + 1 
269b : c9 a2 __ CMP #$a2
269d : d0 4d __ BNE $26ec ; (bmu_bitblit.s111 + 0)
.s88:
269f : e0 87 __ CPX #$87
26a1 : d0 49 __ BNE $26ec ; (bmu_bitblit.s111 + 0)
.s72:
26a3 : a9 a2 __ LDA #$a2
26a5 : 85 4f __ STA T9 + 0 
26a7 : a9 87 __ LDA #$87
26a9 : 85 50 __ STA T9 + 1 
26ab : ad eb bf LDA $bfeb ; (sstack + 1)
26ae : c5 13 __ CMP P6 ; (dy + 1)
26b0 : d0 09 __ BNE $26bb ; (bmu_bitblit.s87 + 0)
.s84:
26b2 : ad ea bf LDA $bfea ; (sstack + 0)
26b5 : c5 12 __ CMP P5 ; (dy + 0)
.s85:
26b7 : b0 08 __ BCS $26c1 ; (bmu_bitblit.s73 + 0)
26b9 : 90 28 __ BCC $26e3 ; (bmu_bitblit.s75 + 0)
.s87:
26bb : 45 13 __ EOR P6 ; (dy + 1)
26bd : 10 f8 __ BPL $26b7 ; (bmu_bitblit.s85 + 0)
.s86:
26bf : b0 22 __ BCS $26e3 ; (bmu_bitblit.s75 + 0)
.s73:
26c1 : a5 13 __ LDA P6 ; (dy + 1)
26c3 : cd eb bf CMP $bfeb ; (sstack + 1)
26c6 : d0 24 __ BNE $26ec ; (bmu_bitblit.s111 + 0)
.s83:
26c8 : a5 12 __ LDA P5 ; (dy + 0)
26ca : cd ea bf CMP $bfea ; (sstack + 0)
26cd : d0 1f __ BNE $26ee ; (bmu_bitblit.s5 + 0)
.s74:
26cf : a5 17 __ LDA P10 ; (sx + 1)
26d1 : c5 11 __ CMP P4 ; (dx + 1)
26d3 : d0 08 __ BNE $26dd ; (bmu_bitblit.s82 + 0)
.s79:
26d5 : a5 16 __ LDA P9 ; (sx + 0)
26d7 : c5 10 __ CMP P3 ; (dx + 0)
.s80:
26d9 : 90 08 __ BCC $26e3 ; (bmu_bitblit.s75 + 0)
26db : b0 0f __ BCS $26ec ; (bmu_bitblit.s111 + 0)
.s82:
26dd : 45 11 __ EOR P4 ; (dx + 1)
26df : 10 f8 __ BPL $26d9 ; (bmu_bitblit.s80 + 0)
.s81:
26e1 : 90 09 __ BCC $26ec ; (bmu_bitblit.s111 + 0)
.s75:
26e3 : a5 18 __ LDA P11 ; (op + 0)
26e5 : 29 08 __ AND #$08
26e7 : f0 03 __ BEQ $26ec ; (bmu_bitblit.s111 + 0)
26e9 : 4c d2 2b JMP $2bd2 ; (bmu_bitblit.s76 + 0)
.s111:
26ec : a5 12 __ LDA P5 ; (dy + 0)
.s5:
26ee : 29 f8 __ AND #$f8
26f0 : 85 1b __ STA ACCU + 0 ; (w + 0)
26f2 : a5 13 __ LDA P6 ; (dy + 1)
26f4 : 85 1c __ STA ACCU + 1 ; (w + 1)
26f6 : ad a6 87 LDA $87a6 ; (Screen.cwidth + 0)
26f9 : 85 51 __ STA T10 + 0 
26fb : 20 62 77 JSR $7762 ; (mul16by8 + 0)
26fe : ad a2 87 LDA $87a2 ; (Screen.data + 0)
2701 : 18 __ __ CLC
2702 : 65 1b __ ADC ACCU + 0 ; (w + 0)
2704 : 85 4a __ STA T4 + 0 
2706 : ad a3 87 LDA $87a3 ; (Screen.data + 1)
2709 : 65 1c __ ADC ACCU + 1 ; (w + 1)
270b : aa __ __ TAX
270c : a5 10 __ LDA P3 ; (dx + 0)
270e : 29 f8 __ AND #$f8
2710 : 18 __ __ CLC
2711 : 65 4a __ ADC T4 + 0 
2713 : 85 4a __ STA T4 + 0 
2715 : 8a __ __ TXA
2716 : 65 11 __ ADC P4 ; (dx + 1)
2718 : aa __ __ TAX
2719 : a5 12 __ LDA P5 ; (dy + 0)
271b : 29 07 __ AND #$07
271d : 18 __ __ CLC
271e : 65 4a __ ADC T4 + 0 
2720 : 85 53 __ STA T11 + 0 
2722 : 90 01 __ BCC $2725 ; (bmu_bitblit.s94 + 0)
.s93:
2724 : e8 __ __ INX
.s94:
2725 : 86 54 __ STX T11 + 1 
2727 : ad eb bf LDA $bfeb ; (sstack + 1)
272a : 85 1c __ STA ACCU + 1 ; (w + 1)
272c : ad ea bf LDA $bfea ; (sstack + 0)
272f : 29 f8 __ AND #$f8
2731 : 85 1b __ STA ACCU + 0 ; (w + 0)
2733 : a0 04 __ LDY #$04
2735 : b1 4f __ LDA (T9 + 0),y 
2737 : 20 62 77 JSR $7762 ; (mul16by8 + 0)
273a : a0 00 __ LDY #$00
273c : 84 57 __ STY T16 + 0 
273e : b1 4f __ LDA (T9 + 0),y 
2740 : 18 __ __ CLC
2741 : 65 1b __ ADC ACCU + 0 ; (w + 0)
2743 : 85 49 __ STA T3 + 0 
2745 : c8 __ __ INY
2746 : b1 4f __ LDA (T9 + 0),y 
2748 : 65 1c __ ADC ACCU + 1 ; (w + 1)
274a : aa __ __ TAX
274b : a5 16 __ LDA P9 ; (sx + 0)
274d : 29 f8 __ AND #$f8
274f : 18 __ __ CLC
2750 : 65 49 __ ADC T3 + 0 
2752 : 85 49 __ STA T3 + 0 
2754 : 8a __ __ TXA
2755 : 65 17 __ ADC P10 ; (sx + 1)
2757 : aa __ __ TAX
2758 : ad ea bf LDA $bfea ; (sstack + 0)
275b : 29 07 __ AND #$07
275d : 18 __ __ CLC
275e : 65 49 __ ADC T3 + 0 
2760 : 85 4a __ STA T4 + 0 
2762 : 90 01 __ BCC $2765 ; (bmu_bitblit.s96 + 0)
.s95:
2764 : e8 __ __ INX
.s96:
2765 : 86 4b __ STX T4 + 1 
2767 : a5 16 __ LDA P9 ; (sx + 0)
2769 : 29 07 __ AND #$07
276b : 49 ff __ EOR #$ff
276d : 38 __ __ SEC
276e : 65 45 __ ADC T1 + 0 
2770 : 85 43 __ STA T0 + 0 
2772 : f0 0d __ BEQ $2781 ; (bmu_bitblit.s6 + 0)
.s70:
2774 : 30 0b __ BMI $2781 ; (bmu_bitblit.s6 + 0)
.s71:
2776 : 18 __ __ CLC
2777 : a5 4a __ LDA T4 + 0 
2779 : 69 f8 __ ADC #$f8
277b : 85 4a __ STA T4 + 0 
277d : b0 02 __ BCS $2781 ; (bmu_bitblit.s6 + 0)
.s105:
277f : c6 4b __ DEC T4 + 1 
.s6:
2781 : a9 18 __ LDA #$18
2783 : 85 58 __ STA T17 + 0 
2785 : a9 61 __ LDA #$61
2787 : 85 59 __ STA T18 + 0 
2789 : a9 90 __ LDA #$90
278b : 85 5a __ STA T19 + 0 
278d : a9 e2 __ LDA #$e2
278f : 85 5b __ STA T20 + 0 
2791 : a9 00 __ LDA #$00
2793 : 85 5c __ STA T21 + 0 
2795 : a9 08 __ LDA #$08
.s7:
2797 : 85 5d __ STA T22 + 0 
2799 : a5 18 __ LDA P11 ; (op + 0)
279b : 29 08 __ AND #$08
279d : 85 4c __ STA T5 + 0 
279f : a5 18 __ LDA P11 ; (op + 0)
27a1 : 29 10 __ AND #$10
27a3 : 85 52 __ STA T12 + 0 
27a5 : a5 55 __ LDA T13 + 0 
27a7 : 85 45 __ STA T1 + 0 
27a9 : a5 43 __ LDA T0 + 0 
27ab : 29 07 __ AND #$07
27ad : 85 5f __ STA T24 + 0 
27af : a5 4d __ LDA T6 + 0 
27b1 : 85 5e __ STA T23 + 0 
27b3 : d0 06 __ BNE $27bb ; (bmu_bitblit.s9 + 0)
.s8:
27b5 : a5 56 __ LDA T14 + 0 
27b7 : 25 55 __ AND T13 + 0 
27b9 : 85 45 __ STA T1 + 0 
.s9:
27bb : a9 a0 __ LDA #$a0
27bd : 8d 00 a0 STA $a000 ; (BLIT_CODE[0] + 0)
27c0 : a5 5c __ LDA T21 + 0 
27c2 : 8d 01 a0 STA $a001 ; (BLIT_CODE[0] + 1)
27c5 : a9 02 __ LDA #$02
27c7 : 85 43 __ STA T0 + 0 
27c9 : a6 45 __ LDX T1 + 0 
27cb : e8 __ __ INX
27cc : d0 03 __ BNE $27d1 ; (bmu_bitblit.s10 + 0)
27ce : 4c 6c 2b JMP $2b6c ; (bmu_bitblit.s66 + 0)
.s10:
27d1 : a5 52 __ LDA T12 + 0 
27d3 : f0 18 __ BEQ $27ed ; (bmu_bitblit.s11 + 0)
.s65:
27d5 : a9 b1 __ LDA #$b1
27d7 : 8d 02 a0 STA $a002 ; (BLIT_CODE[0] + 2)
27da : a9 05 __ LDA #$05
27dc : 8d 03 a0 STA $a003 ; (BLIT_CODE[0] + 3)
27df : a9 85 __ LDA #$85
27e1 : 8d 04 a0 STA $a004 ; (BLIT_CODE[0] + 4)
27e4 : a9 0a __ LDA #$0a
27e6 : 8d 05 a0 STA $a005 ; (BLIT_CODE[0] + 5)
27e9 : a9 06 __ LDA #$06
27eb : 85 43 __ STA T0 + 0 
.s11:
27ed : a5 4c __ LDA T5 + 0 
27ef : d0 05 __ BNE $27f6 ; (bmu_bitblit.s62 + 0)
.s12:
27f1 : a5 43 __ LDA T0 + 0 
27f3 : 4c 51 28 JMP $2851 ; (bmu_bitblit.s92 + 0)
.s62:
27f6 : a5 5f __ LDA T24 + 0 
27f8 : d0 05 __ BNE $27ff ; (bmu_bitblit.s64 + 0)
.s63:
27fa : a5 43 __ LDA T0 + 0 
27fc : 4c 4c 28 JMP $284c ; (bmu_bitblit.s91 + 0)
.s64:
27ff : a9 b1 __ LDA #$b1
2801 : a6 43 __ LDX T0 + 0 
2803 : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2806 : a9 03 __ LDA #$03
2808 : 9d 01 a0 STA $a001,x ; (BLIT_CODE[0] + 1)
280b : 9d 06 a0 STA $a006,x ; (BLIT_CODE[0] + 6)
280e : 9d 0a a0 STA $a00a,x ; (BLIT_CODE[0] + 10)
2811 : a9 85 __ LDA #$85
2813 : 9d 02 a0 STA $a002,x ; (BLIT_CODE[0] + 2)
2816 : 9d 09 a0 STA $a009,x ; (BLIT_CODE[0] + 9)
2819 : a9 08 __ LDA #$08
281b : 9d 03 a0 STA $a003,x ; (BLIT_CODE[0] + 3)
281e : 9d 08 a0 STA $a008,x ; (BLIT_CODE[0] + 8)
2821 : a9 a5 __ LDA #$a5
2823 : 9d 05 a0 STA $a005,x ; (BLIT_CODE[0] + 5)
2826 : a9 02 __ LDA #$02
2828 : 9d 0c a0 STA $a00c,x ; (BLIT_CODE[0] + 12)
282b : a9 04 __ LDA #$04
282d : 9d 0e a0 STA $a00e,x ; (BLIT_CODE[0] + 14)
2830 : a5 58 __ LDA T17 + 0 
2832 : 9d 04 a0 STA $a004,x ; (BLIT_CODE[0] + 4)
2835 : a5 59 __ LDA T18 + 0 
2837 : 09 08 __ ORA #$08
2839 : 9d 07 a0 STA $a007,x ; (BLIT_CODE[0] + 7)
283c : a5 5a __ LDA T19 + 0 
283e : 9d 0b a0 STA $a00b,x ; (BLIT_CODE[0] + 11)
2841 : a5 5b __ LDA T20 + 0 
2843 : 09 04 __ ORA #$04
2845 : 9d 0d a0 STA $a00d,x ; (BLIT_CODE[0] + 13)
2848 : 8a __ __ TXA
2849 : 18 __ __ CLC
284a : 69 0f __ ADC #$0f
.s91:
284c : 85 0d __ STA P0 
284e : 20 b6 2c JSR $2cb6 ; (builddop_src@proxy + 0)
.s92:
2851 : 85 0d __ STA P0 
2853 : a5 18 __ LDA P11 ; (op + 0)
2855 : 85 0e __ STA P1 
2857 : a5 45 __ LDA T1 + 0 
2859 : 49 ff __ EOR #$ff
285b : 85 0f __ STA P2 
285d : 20 f9 2d JSR $2df9 ; (builddop_op.s4 + 0)
2860 : 85 43 __ STA T0 + 0 
2862 : a5 4d __ LDA T6 + 0 
2864 : f0 63 __ BEQ $28c9 ; (bmu_bitblit.s13 + 0)
.s34:
2866 : a9 a0 __ LDA #$a0
2868 : a6 43 __ LDX T0 + 0 
286a : e8 __ __ INX
286b : e8 __ __ INX
286c : 86 43 __ STX T0 + 0 
286e : 86 0d __ STX P0 
2870 : 9d fe 9f STA $9ffe,x 
2873 : 18 __ __ CLC
2874 : a5 5d __ LDA T22 + 0 
2876 : 65 5c __ ADC T21 + 0 
2878 : 9d ff 9f STA $9fff,x 
287b : 85 5c __ STA T21 + 0 
287d : a5 4d __ LDA T6 + 0 
.s35:
287f : c9 02 __ CMP #$02
2881 : 90 03 __ BCC $2886 ; (bmu_bitblit.s36 + 0)
2883 : 4c 4f 2a JMP $2a4f ; (bmu_bitblit.s42 + 0)
.s36:
2886 : a5 56 __ LDA T14 + 0 
2888 : f0 3f __ BEQ $28c9 ; (bmu_bitblit.s13 + 0)
.s37:
288a : a5 52 __ LDA T12 + 0 
288c : f0 1e __ BEQ $28ac ; (bmu_bitblit.s38 + 0)
.s41:
288e : a9 b1 __ LDA #$b1
2890 : a6 43 __ LDX T0 + 0 
2892 : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2895 : a9 05 __ LDA #$05
2897 : 9d 01 a0 STA $a001,x ; (BLIT_CODE[0] + 1)
289a : a9 85 __ LDA #$85
289c : 9d 02 a0 STA $a002,x ; (BLIT_CODE[0] + 2)
289f : a9 0a __ LDA #$0a
28a1 : 9d 03 a0 STA $a003,x ; (BLIT_CODE[0] + 3)
28a4 : 8a __ __ TXA
28a5 : 18 __ __ CLC
28a6 : 69 04 __ ADC #$04
28a8 : 85 43 __ STA T0 + 0 
28aa : 85 0d __ STA P0 
.s38:
28ac : a5 4c __ LDA T5 + 0 
28ae : d0 05 __ BNE $28b5 ; (bmu_bitblit.s40 + 0)
.s39:
28b0 : a5 43 __ LDA T0 + 0 
28b2 : 4c b8 28 JMP $28b8 ; (bmu_bitblit.s90 + 0)
.s40:
28b5 : 20 b6 2c JSR $2cb6 ; (builddop_src@proxy + 0)
.s90:
28b8 : 85 0d __ STA P0 
28ba : a5 18 __ LDA P11 ; (op + 0)
28bc : 85 0e __ STA P1 
28be : a5 56 __ LDA T14 + 0 
28c0 : 49 ff __ EOR #$ff
28c2 : 85 0f __ STA P2 
28c4 : 20 f9 2d JSR $2df9 ; (builddop_op.s4 + 0)
28c7 : 85 43 __ STA T0 + 0 
.s13:
28c9 : a9 60 __ LDA #$60
28cb : a6 43 __ LDX T0 + 0 
28cd : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
28d0 : 18 __ __ CLC
28d1 : a5 51 __ LDA T10 + 0 
28d3 : 69 ff __ ADC #$ff
28d5 : 2a __ __ ROL
28d6 : 2a __ __ ROL
28d7 : 2a __ __ ROL
28d8 : aa __ __ TAX
28d9 : 29 f8 __ AND #$f8
28db : 85 43 __ STA T0 + 0 
28dd : 8a __ __ TXA
28de : 29 07 __ AND #$07
28e0 : 2a __ __ ROL
28e1 : 69 f8 __ ADC #$f8
28e3 : 85 44 __ STA T0 + 1 
28e5 : a5 4c __ LDA T5 + 0 
28e7 : d0 78 __ BNE $2961 ; (bmu_bitblit.s22 + 0)
.s14:
28e9 : a5 18 __ LDA P11 ; (op + 0)
28eb : 29 20 __ AND #$20
28ed : d0 3d __ BNE $292c ; (bmu_bitblit.l19 + 0)
.s15:
28ef : 85 47 __ STA T2 + 0 
.l16:
28f1 : a5 53 __ LDA T11 + 0 
28f3 : 85 05 __ STA WORK + 2 
28f5 : 85 03 __ STA WORK + 0 
28f7 : a5 54 __ LDA T11 + 1 
28f9 : 85 06 __ STA WORK + 3 
28fb : 85 04 __ STA WORK + 1 
28fd : a5 47 __ LDA T2 + 0 
28ff : 85 07 __ STA WORK + 4 
2901 : 20 00 a0 JSR $a000 ; (BLIT_CODE[0] + 0)
2904 : e6 53 __ INC T11 + 0 
2906 : d0 02 __ BNE $290a ; (bmu_bitblit.s104 + 0)
.s103:
2908 : e6 54 __ INC T11 + 1 
.s104:
290a : a5 53 __ LDA T11 + 0 
290c : 29 07 __ AND #$07
290e : d0 0d __ BNE $291d ; (bmu_bitblit.s17 + 0)
.s18:
2910 : 18 __ __ CLC
2911 : a5 53 __ LDA T11 + 0 
2913 : 65 43 __ ADC T0 + 0 
2915 : 85 53 __ STA T11 + 0 
2917 : a5 54 __ LDA T11 + 1 
2919 : 65 44 __ ADC T0 + 1 
291b : 85 54 __ STA T11 + 1 
.s17:
291d : c6 4e __ DEC T8 + 0 
291f : d0 d0 __ BNE $28f1 ; (bmu_bitblit.l16 + 0)
.s3:
2921 : a2 0c __ LDX #$0c
2923 : bd d3 bf LDA $bfd3,x ; (bmu_bitblit@stack + 0)
2926 : 95 53 __ STA T11 + 0,x 
2928 : ca __ __ DEX
2929 : 10 f8 __ BPL $2923 ; (bmu_bitblit.s3 + 2)
292b : 60 __ __ RTS
.l19:
292c : a5 53 __ LDA T11 + 0 
292e : 85 05 __ STA WORK + 2 
2930 : 85 03 __ STA WORK + 0 
2932 : 29 07 __ AND #$07
2934 : aa __ __ TAX
2935 : a5 54 __ LDA T11 + 1 
2937 : 85 06 __ STA WORK + 3 
2939 : 85 04 __ STA WORK + 1 
293b : b5 00 __ LDA $00,x 
293d : 85 07 __ STA WORK + 4 
293f : 20 00 a0 JSR $a000 ; (BLIT_CODE[0] + 0)
2942 : e6 53 __ INC T11 + 0 
2944 : d0 02 __ BNE $2948 ; (bmu_bitblit.s102 + 0)
.s101:
2946 : e6 54 __ INC T11 + 1 
.s102:
2948 : a5 53 __ LDA T11 + 0 
294a : 29 07 __ AND #$07
294c : d0 0d __ BNE $295b ; (bmu_bitblit.s20 + 0)
.s21:
294e : 18 __ __ CLC
294f : a5 53 __ LDA T11 + 0 
2951 : 65 43 __ ADC T0 + 0 
2953 : 85 53 __ STA T11 + 0 
2955 : a5 54 __ LDA T11 + 1 
2957 : 65 44 __ ADC T0 + 1 
2959 : 85 54 __ STA T11 + 1 
.s20:
295b : c6 4e __ DEC T8 + 0 
295d : d0 cd __ BNE $292c ; (bmu_bitblit.l19 + 0)
295f : f0 c0 __ BEQ $2921 ; (bmu_bitblit.s3 + 0)
.s22:
2961 : a5 4a __ LDA T4 + 0 
2963 : 85 45 __ STA T1 + 0 
2965 : a5 4b __ LDA T4 + 1 
2967 : 85 46 __ STA T1 + 1 
2969 : a0 04 __ LDY #$04
296b : b1 4f __ LDA (T9 + 0),y 
296d : 18 __ __ CLC
296e : 69 ff __ ADC #$ff
2970 : 2a __ __ ROL
2971 : 2a __ __ ROL
2972 : 2a __ __ ROL
2973 : aa __ __ TAX
2974 : 29 f8 __ AND #$f8
2976 : 85 47 __ STA T2 + 0 
2978 : 8a __ __ TXA
2979 : 29 07 __ AND #$07
297b : 2a __ __ ROL
297c : 69 f8 __ ADC #$f8
297e : 85 48 __ STA T2 + 1 
2980 : a5 57 __ LDA T16 + 0 
2982 : f0 1d __ BEQ $29a1 ; (bmu_bitblit.l23 + 0)
.s28:
2984 : 38 __ __ SEC
2985 : a9 00 __ LDA #$00
2987 : e5 43 __ SBC T0 + 0 
2989 : 85 43 __ STA T0 + 0 
298b : a9 00 __ LDA #$00
298d : e5 44 __ SBC T0 + 1 
298f : 85 44 __ STA T0 + 1 
2991 : 38 __ __ SEC
2992 : a9 00 __ LDA #$00
2994 : e5 47 __ SBC T2 + 0 
2996 : 85 47 __ STA T2 + 0 
2998 : a9 00 __ LDA #$00
299a : e5 48 __ SBC T2 + 1 
299c : 85 48 __ STA T2 + 1 
299e : 4c f4 29 JMP $29f4 ; (bmu_bitblit.l29 + 0)
.l23:
29a1 : a5 4a __ LDA T4 + 0 
29a3 : 85 03 __ STA WORK + 0 
29a5 : a5 4b __ LDA T4 + 1 
29a7 : 85 04 __ STA WORK + 1 
29a9 : a5 54 __ LDA T11 + 1 
29ab : 85 06 __ STA WORK + 3 
29ad : a5 53 __ LDA T11 + 0 
29af : 85 05 __ STA WORK + 2 
29b1 : 29 07 __ AND #$07
29b3 : a8 __ __ TAY
29b4 : b1 45 __ LDA (T1 + 0),y 
29b6 : 85 07 __ STA WORK + 4 
29b8 : 20 00 a0 JSR $a000 ; (BLIT_CODE[0] + 0)
29bb : e6 4a __ INC T4 + 0 
29bd : d0 02 __ BNE $29c1 ; (bmu_bitblit.s98 + 0)
.s97:
29bf : e6 4b __ INC T4 + 1 
.s98:
29c1 : a5 4a __ LDA T4 + 0 
29c3 : 29 07 __ AND #$07
29c5 : d0 0d __ BNE $29d4 ; (bmu_bitblit.s24 + 0)
.s27:
29c7 : 18 __ __ CLC
29c8 : a5 4a __ LDA T4 + 0 
29ca : 65 47 __ ADC T2 + 0 
29cc : 85 4a __ STA T4 + 0 
29ce : a5 4b __ LDA T4 + 1 
29d0 : 65 48 __ ADC T2 + 1 
29d2 : 85 4b __ STA T4 + 1 
.s24:
29d4 : e6 53 __ INC T11 + 0 
29d6 : d0 02 __ BNE $29da ; (bmu_bitblit.s100 + 0)
.s99:
29d8 : e6 54 __ INC T11 + 1 
.s100:
29da : a5 53 __ LDA T11 + 0 
29dc : 29 07 __ AND #$07
29de : d0 0d __ BNE $29ed ; (bmu_bitblit.s25 + 0)
.s26:
29e0 : 18 __ __ CLC
29e1 : a5 53 __ LDA T11 + 0 
29e3 : 65 43 __ ADC T0 + 0 
29e5 : 85 53 __ STA T11 + 0 
29e7 : a5 54 __ LDA T11 + 1 
29e9 : 65 44 __ ADC T0 + 1 
29eb : 85 54 __ STA T11 + 1 
.s25:
29ed : c6 4e __ DEC T8 + 0 
29ef : d0 b0 __ BNE $29a1 ; (bmu_bitblit.l23 + 0)
29f1 : 4c 21 29 JMP $2921 ; (bmu_bitblit.s3 + 0)
.l29:
29f4 : a5 4a __ LDA T4 + 0 
29f6 : 29 07 __ AND #$07
29f8 : d0 0d __ BNE $2a07 ; (bmu_bitblit.s30 + 0)
.s33:
29fa : 18 __ __ CLC
29fb : a5 4a __ LDA T4 + 0 
29fd : 65 47 __ ADC T2 + 0 
29ff : 85 4a __ STA T4 + 0 
2a01 : a5 4b __ LDA T4 + 1 
2a03 : 65 48 __ ADC T2 + 1 
2a05 : 85 4b __ STA T4 + 1 
.s30:
2a07 : a5 53 __ LDA T11 + 0 
2a09 : 29 07 __ AND #$07
2a0b : d0 0d __ BNE $2a1a ; (bmu_bitblit.s31 + 0)
.s32:
2a0d : 18 __ __ CLC
2a0e : a5 53 __ LDA T11 + 0 
2a10 : 65 43 __ ADC T0 + 0 
2a12 : 85 53 __ STA T11 + 0 
2a14 : a5 54 __ LDA T11 + 1 
2a16 : 65 44 __ ADC T0 + 1 
2a18 : 85 54 __ STA T11 + 1 
.s31:
2a1a : 18 __ __ CLC
2a1b : a5 53 __ LDA T11 + 0 
2a1d : 69 ff __ ADC #$ff
2a1f : 85 05 __ STA WORK + 2 
2a21 : 85 53 __ STA T11 + 0 
2a23 : a5 54 __ LDA T11 + 1 
2a25 : 69 ff __ ADC #$ff
2a27 : 85 54 __ STA T11 + 1 
2a29 : 85 06 __ STA WORK + 3 
2a2b : 18 __ __ CLC
2a2c : a5 4a __ LDA T4 + 0 
2a2e : 69 ff __ ADC #$ff
2a30 : 85 4a __ STA T4 + 0 
2a32 : 85 03 __ STA WORK + 0 
2a34 : a5 4b __ LDA T4 + 1 
2a36 : 69 ff __ ADC #$ff
2a38 : 85 4b __ STA T4 + 1 
2a3a : 85 04 __ STA WORK + 1 
2a3c : a5 05 __ LDA WORK + 2 
2a3e : 29 07 __ AND #$07
2a40 : a8 __ __ TAY
2a41 : b1 45 __ LDA (T1 + 0),y 
2a43 : 85 07 __ STA WORK + 4 
2a45 : 20 00 a0 JSR $a000 ; (BLIT_CODE[0] + 0)
2a48 : c6 4e __ DEC T8 + 0 
2a4a : d0 a8 __ BNE $29f4 ; (bmu_bitblit.l29 + 0)
2a4c : 4c 21 29 JMP $2921 ; (bmu_bitblit.s3 + 0)
.s42:
2a4f : a9 02 __ LDA #$02
2a51 : c5 5e __ CMP T23 + 0 
2a53 : a9 00 __ LDA #$00
2a55 : 6a __ __ ROR
2a56 : 85 49 __ STA T3 + 0 
2a58 : d0 19 __ BNE $2a73 ; (bmu_bitblit.s43 + 0)
.s61:
2a5a : a9 a2 __ LDA #$a2
2a5c : a6 43 __ LDX T0 + 0 
2a5e : e8 __ __ INX
2a5f : e8 __ __ INX
2a60 : 86 43 __ STX T0 + 0 
2a62 : 9d fe 9f STA $9ffe,x 
2a65 : 38 __ __ SEC
2a66 : a5 5e __ LDA T23 + 0 
2a68 : e9 01 __ SBC #$01
2a6a : 9d ff 9f STA $9fff,x 
2a6d : a5 5e __ LDA T23 + 0 
2a6f : c9 20 __ CMP #$20
2a71 : b0 0d __ BCS $2a80 ; (bmu_bitblit.s45 + 0)
.s43:
2a73 : a5 5f __ LDA T24 + 0 
2a75 : d0 09 __ BNE $2a80 ; (bmu_bitblit.s45 + 0)
.s44:
2a77 : a5 58 __ LDA T17 + 0 
2a79 : a6 43 __ LDX T0 + 0 
2a7b : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2a7e : e6 43 __ INC T0 + 0 
.s45:
2a80 : a5 43 __ LDA T0 + 0 
2a82 : 85 55 __ STA T13 + 0 
2a84 : a5 52 __ LDA T12 + 0 
2a86 : f0 1c __ BEQ $2aa4 ; (bmu_bitblit.s46 + 0)
.s60:
2a88 : a9 b1 __ LDA #$b1
2a8a : a6 43 __ LDX T0 + 0 
2a8c : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2a8f : a9 05 __ LDA #$05
2a91 : 9d 01 a0 STA $a001,x ; (BLIT_CODE[0] + 1)
2a94 : a9 85 __ LDA #$85
2a96 : 9d 02 a0 STA $a002,x ; (BLIT_CODE[0] + 2)
2a99 : a9 0a __ LDA #$0a
2a9b : 9d 03 a0 STA $a003,x ; (BLIT_CODE[0] + 3)
2a9e : 8a __ __ TXA
2a9f : 18 __ __ CLC
2aa0 : 69 04 __ ADC #$04
2aa2 : 85 43 __ STA T0 + 0 
.s46:
2aa4 : a5 4c __ LDA T5 + 0 
2aa6 : d0 05 __ BNE $2aad ; (bmu_bitblit.s59 + 0)
.s47:
2aa8 : a5 43 __ LDA T0 + 0 
2aaa : 4c b4 2a JMP $2ab4 ; (bmu_bitblit.s89 + 0)
.s59:
2aad : a5 43 __ LDA T0 + 0 
2aaf : 85 0d __ STA P0 
2ab1 : 20 b6 2c JSR $2cb6 ; (builddop_src@proxy + 0)
.s89:
2ab4 : 85 0d __ STA P0 
2ab6 : a5 18 __ LDA P11 ; (op + 0)
2ab8 : 85 0e __ STA P1 
2aba : a9 00 __ LDA #$00
2abc : 85 0f __ STA P2 
2abe : 20 f9 2d JSR $2df9 ; (builddop_op.s4 + 0)
2ac1 : 24 49 __ BIT T3 + 0 
2ac3 : 10 1b __ BPL $2ae0 ; (bmu_bitblit.s50 + 0)
.s48:
2ac5 : 85 43 __ STA T0 + 0 
2ac7 : aa __ __ TAX
2ac8 : a9 a0 __ LDA #$a0
2aca : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2acd : 18 __ __ CLC
2ace : a5 5d __ LDA T22 + 0 
2ad0 : 65 5c __ ADC T21 + 0 
2ad2 : 9d 01 a0 STA $a001,x ; (BLIT_CODE[0] + 1)
.s49:
2ad5 : a6 43 __ LDX T0 + 0 
2ad7 : e8 __ __ INX
2ad8 : e8 __ __ INX
2ad9 : 86 43 __ STX T0 + 0 
2adb : 86 0d __ STX P0 
2add : 4c 86 28 JMP $2886 ; (bmu_bitblit.s36 + 0)
.s50:
2ae0 : aa __ __ TAX
2ae1 : a9 1f __ LDA #$1f
2ae3 : c5 5e __ CMP T23 + 0 
2ae5 : a9 00 __ LDA #$00
2ae7 : 6a __ __ ROR
2ae8 : 85 4d __ STA T6 + 0 
2aea : f0 04 __ BEQ $2af0 ; (bmu_bitblit.s58 + 0)
.s51:
2aec : a5 5f __ LDA T24 + 0 
2aee : f0 06 __ BEQ $2af6 ; (bmu_bitblit.s52 + 0)
.s58:
2af0 : a5 58 __ LDA T17 + 0 
2af2 : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2af5 : e8 __ __ INX
.s52:
2af6 : a9 98 __ LDA #$98
2af8 : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2afb : a9 08 __ LDA #$08
2afd : 9d 02 a0 STA $a002,x ; (BLIT_CODE[0] + 2)
2b00 : a9 a8 __ LDA #$a8
2b02 : 9d 03 a0 STA $a003,x ; (BLIT_CODE[0] + 3)
2b05 : a5 59 __ LDA T18 + 0 
2b07 : 09 08 __ ORA #$08
2b09 : 9d 01 a0 STA $a001,x ; (BLIT_CODE[0] + 1)
2b0c : 8a __ __ TXA
2b0d : 18 __ __ CLC
2b0e : 69 04 __ ADC #$04
2b10 : 85 43 __ STA T0 + 0 
2b12 : 24 4d __ BIT T6 + 0 
2b14 : 30 3a __ BMI $2b50 ; (bmu_bitblit.s53 + 0)
.s54:
2b16 : a5 5a __ LDA T19 + 0 
2b18 : 9d 04 a0 STA $a004,x ; (BLIT_CODE[0] + 4)
2b1b : a5 5b __ LDA T20 + 0 
2b1d : 09 04 __ ORA #$04
2b1f : a8 __ __ TAY
2b20 : a5 4c __ LDA T5 + 0 
2b22 : d0 0d __ BNE $2b31 ; (bmu_bitblit.s57 + 0)
.s55:
2b24 : a9 02 __ LDA #$02
2b26 : 9d 05 a0 STA $a005,x ; (BLIT_CODE[0] + 5)
2b29 : 18 __ __ CLC
2b2a : a5 43 __ LDA T0 + 0 
2b2c : 69 02 __ ADC #$02
2b2e : 4c 42 2b JMP $2b42 ; (bmu_bitblit.s56 + 0)
.s57:
2b31 : a9 04 __ LDA #$04
2b33 : 9d 05 a0 STA $a005,x ; (BLIT_CODE[0] + 5)
2b36 : 9d 07 a0 STA $a007,x ; (BLIT_CODE[0] + 7)
2b39 : 98 __ __ TYA
2b3a : 9d 06 a0 STA $a006,x ; (BLIT_CODE[0] + 6)
2b3d : 18 __ __ CLC
2b3e : a5 43 __ LDA T0 + 0 
2b40 : 69 04 __ ADC #$04
.s56:
2b42 : aa __ __ TAX
2b43 : e8 __ __ INX
2b44 : e8 __ __ INX
2b45 : 86 43 __ STX T0 + 0 
2b47 : 98 __ __ TYA
2b48 : 9d fe 9f STA $9ffe,x 
2b4b : a9 06 __ LDA #$06
2b4d : 9d ff 9f STA $9fff,x 
.s53:
2b50 : a9 ca __ LDA #$ca
2b52 : a6 43 __ LDX T0 + 0 
2b54 : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2b57 : a9 d0 __ LDA #$d0
2b59 : 9d 01 a0 STA $a001,x ; (BLIT_CODE[0] + 1)
2b5c : e6 43 __ INC T0 + 0 
2b5e : a5 55 __ LDA T13 + 0 
2b60 : 38 __ __ SEC
2b61 : e5 43 __ SBC T0 + 0 
2b63 : 38 __ __ SEC
2b64 : e9 02 __ SBC #$02
2b66 : 9d 02 a0 STA $a002,x ; (BLIT_CODE[0] + 2)
2b69 : 4c d5 2a JMP $2ad5 ; (bmu_bitblit.s49 + 0)
.s66:
2b6c : 85 0d __ STA P0 
2b6e : a5 4c __ LDA T5 + 0 
2b70 : f0 51 __ BEQ $2bc3 ; (bmu_bitblit.s67 + 0)
.s68:
2b72 : a5 5f __ LDA T24 + 0 
2b74 : f0 4d __ BEQ $2bc3 ; (bmu_bitblit.s67 + 0)
.s69:
2b76 : a9 03 __ LDA #$03
2b78 : 8d 03 a0 STA $a003 ; (BLIT_CODE[0] + 3)
2b7b : 8d 08 a0 STA $a008 ; (BLIT_CODE[0] + 8)
2b7e : 8d 0c a0 STA $a00c ; (BLIT_CODE[0] + 12)
2b81 : a9 b1 __ LDA #$b1
2b83 : 8d 02 a0 STA $a002 ; (BLIT_CODE[0] + 2)
2b86 : a9 85 __ LDA #$85
2b88 : 8d 04 a0 STA $a004 ; (BLIT_CODE[0] + 4)
2b8b : 8d 0b a0 STA $a00b ; (BLIT_CODE[0] + 11)
2b8e : a9 08 __ LDA #$08
2b90 : 8d 05 a0 STA $a005 ; (BLIT_CODE[0] + 5)
2b93 : 8d 0a a0 STA $a00a ; (BLIT_CODE[0] + 10)
2b96 : a9 a5 __ LDA #$a5
2b98 : 8d 07 a0 STA $a007 ; (BLIT_CODE[0] + 7)
2b9b : a9 02 __ LDA #$02
2b9d : 8d 0e a0 STA $a00e ; (BLIT_CODE[0] + 14)
2ba0 : a9 04 __ LDA #$04
2ba2 : 8d 10 a0 STA $a010 ; (BLIT_CODE[0] + 16)
2ba5 : a5 58 __ LDA T17 + 0 
2ba7 : 8d 06 a0 STA $a006 ; (BLIT_CODE[0] + 6)
2baa : a5 59 __ LDA T18 + 0 
2bac : 09 08 __ ORA #$08
2bae : 8d 09 a0 STA $a009 ; (BLIT_CODE[0] + 9)
2bb1 : a5 5a __ LDA T19 + 0 
2bb3 : 8d 0d a0 STA $a00d ; (BLIT_CODE[0] + 13)
2bb6 : a5 5b __ LDA T20 + 0 
2bb8 : 09 04 __ ORA #$04
2bba : 8d 0f a0 STA $a00f ; (BLIT_CODE[0] + 15)
2bbd : a9 11 __ LDA #$11
2bbf : 85 43 __ STA T0 + 0 
2bc1 : 85 0d __ STA P0 
.s67:
2bc3 : 18 __ __ CLC
2bc4 : a5 4d __ LDA T6 + 0 
2bc6 : 69 01 __ ADC #$01
2bc8 : 85 5e __ STA T23 + 0 
2bca : d0 03 __ BNE $2bcf ; (bmu_bitblit.s67 + 12)
2bcc : 4c c9 28 JMP $28c9 ; (bmu_bitblit.s13 + 0)
2bcf : 4c 7f 28 JMP $287f ; (bmu_bitblit.s35 + 0)
.s76:
2bd2 : 18 __ __ CLC
2bd3 : a5 12 __ LDA P5 ; (dy + 0)
2bd5 : 65 4e __ ADC T8 + 0 
2bd7 : 85 47 __ STA T2 + 0 
2bd9 : 29 f8 __ AND #$f8
2bdb : 85 1b __ STA ACCU + 0 ; (w + 0)
2bdd : a5 13 __ LDA P6 ; (dy + 1)
2bdf : 69 00 __ ADC #$00
2be1 : 85 1c __ STA ACCU + 1 ; (w + 1)
2be3 : ad a6 87 LDA $87a6 ; (Screen.cwidth + 0)
2be6 : 85 51 __ STA T10 + 0 
2be8 : 20 62 77 JSR $7762 ; (mul16by8 + 0)
2beb : ad a2 87 LDA $87a2 ; (Screen.data + 0)
2bee : 18 __ __ CLC
2bef : 65 1b __ ADC ACCU + 0 ; (w + 0)
2bf1 : 85 4c __ STA T5 + 0 
2bf3 : ad a3 87 LDA $87a3 ; (Screen.data + 1)
2bf6 : 65 1c __ ADC ACCU + 1 ; (w + 1)
2bf8 : aa __ __ TAX
2bf9 : a5 10 __ LDA P3 ; (dx + 0)
2bfb : 29 f8 __ AND #$f8
2bfd : 18 __ __ CLC
2bfe : 65 4c __ ADC T5 + 0 
2c00 : 85 4c __ STA T5 + 0 
2c02 : 8a __ __ TXA
2c03 : 65 11 __ ADC P4 ; (dx + 1)
2c05 : aa __ __ TAX
2c06 : a5 47 __ LDA T2 + 0 
2c08 : 29 07 __ AND #$07
2c0a : 18 __ __ CLC
2c0b : 65 4c __ ADC T5 + 0 
2c0d : 85 4c __ STA T5 + 0 
2c0f : 90 02 __ BCC $2c13 ; (bmu_bitblit.s107 + 0)
.s106:
2c11 : e8 __ __ INX
2c12 : 18 __ __ CLC
.s107:
2c13 : a5 4d __ LDA T6 + 0 
2c15 : 69 e1 __ ADC #$e1
2c17 : 2a __ __ ROL
2c18 : 2a __ __ ROL
2c19 : 2a __ __ ROL
2c1a : a8 __ __ TAY
2c1b : 29 f8 __ AND #$f8
2c1d : 85 43 __ STA T0 + 0 
2c1f : 98 __ __ TYA
2c20 : 29 07 __ AND #$07
2c22 : 2a __ __ ROL
2c23 : 69 f8 __ ADC #$f8
2c25 : 85 44 __ STA T0 + 1 
2c27 : 18 __ __ CLC
2c28 : a5 4c __ LDA T5 + 0 
2c2a : 65 43 __ ADC T0 + 0 
2c2c : 85 53 __ STA T11 + 0 
2c2e : 8a __ __ TXA
2c2f : 65 44 __ ADC T0 + 1 
2c31 : 85 54 __ STA T11 + 1 
2c33 : a5 56 __ LDA T14 + 0 
2c35 : 85 55 __ STA T13 + 0 
2c37 : a5 52 __ LDA T12 + 0 
2c39 : 85 56 __ STA T14 + 0 
2c3b : ad ea bf LDA $bfea ; (sstack + 0)
2c3e : 18 __ __ CLC
2c3f : 65 4e __ ADC T8 + 0 
2c41 : 85 47 __ STA T2 + 0 
2c43 : 29 f8 __ AND #$f8
2c45 : 85 1b __ STA ACCU + 0 ; (w + 0)
2c47 : ad eb bf LDA $bfeb ; (sstack + 1)
2c4a : 69 00 __ ADC #$00
2c4c : 85 1c __ STA ACCU + 1 ; (w + 1)
2c4e : ad a6 87 LDA $87a6 ; (Screen.cwidth + 0)
2c51 : 20 62 77 JSR $7762 ; (mul16by8 + 0)
2c54 : ad a2 87 LDA $87a2 ; (Screen.data + 0)
2c57 : 18 __ __ CLC
2c58 : 65 1b __ ADC ACCU + 0 ; (w + 0)
2c5a : 85 4a __ STA T4 + 0 
2c5c : ad a3 87 LDA $87a3 ; (Screen.data + 1)
2c5f : 65 1c __ ADC ACCU + 1 ; (w + 1)
2c61 : aa __ __ TAX
2c62 : a5 16 __ LDA P9 ; (sx + 0)
2c64 : 29 f8 __ AND #$f8
2c66 : 18 __ __ CLC
2c67 : 65 4a __ ADC T4 + 0 
2c69 : 85 4a __ STA T4 + 0 
2c6b : 8a __ __ TXA
2c6c : 65 17 __ ADC P10 ; (sx + 1)
2c6e : aa __ __ TAX
2c6f : a5 47 __ LDA T2 + 0 
2c71 : 29 07 __ AND #$07
2c73 : 18 __ __ CLC
2c74 : 65 4a __ ADC T4 + 0 
2c76 : 90 02 __ BCC $2c7a ; (bmu_bitblit.s109 + 0)
.s108:
2c78 : e8 __ __ INX
2c79 : 18 __ __ CLC
.s109:
2c7a : 65 43 __ ADC T0 + 0 
2c7c : 85 4a __ STA T4 + 0 
2c7e : 8a __ __ TXA
2c7f : 65 44 __ ADC T0 + 1 
2c81 : 85 4b __ STA T4 + 1 
2c83 : a9 01 __ LDA #$01
2c85 : 85 57 __ STA T16 + 0 
2c87 : a5 16 __ LDA P9 ; (sx + 0)
2c89 : 29 07 __ AND #$07
2c8b : 49 ff __ EOR #$ff
2c8d : 38 __ __ SEC
2c8e : 65 45 __ ADC T1 + 0 
2c90 : 85 43 __ STA T0 + 0 
2c92 : 10 0b __ BPL $2c9f ; (bmu_bitblit.s77 + 0)
.s78:
2c94 : 18 __ __ CLC
2c95 : a5 4a __ LDA T4 + 0 
2c97 : 69 08 __ ADC #$08
2c99 : 85 4a __ STA T4 + 0 
2c9b : 90 02 __ BCC $2c9f ; (bmu_bitblit.s77 + 0)
.s110:
2c9d : e6 4b __ INC T4 + 1 
.s77:
2c9f : a9 38 __ LDA #$38
2ca1 : 85 58 __ STA T17 + 0 
2ca3 : a9 e1 __ LDA #$e1
2ca5 : 85 59 __ STA T18 + 0 
2ca7 : a9 b0 __ LDA #$b0
2ca9 : 85 5a __ STA T19 + 0 
2cab : a9 c2 __ LDA #$c2
2cad : 85 5b __ STA T20 + 0 
2caf : a9 f8 __ LDA #$f8
2cb1 : 85 5c __ STA T21 + 0 
2cb3 : 4c 97 27 JMP $2797 ; (bmu_bitblit.s7 + 0)
--------------------------------------------------------------------
builddop_src@proxy: ; builddop_src@proxy
2cb6 : a5 5f __ LDA $5f 
2cb8 : 85 0e __ STA P1 
2cba : a5 57 __ LDA $57 
2cbc : 85 0f __ STA P2 
--------------------------------------------------------------------
builddop_src: ; builddop_src(u8,u8,bool)->u8
; 888, "/home/xahmol/oscar64/include/gfx/bitmap.c"
.s4:
2cbe : a6 0d __ LDX P0 ; (ip + 0)
2cc0 : e8 __ __ INX
2cc1 : a4 0d __ LDY P0 ; (ip + 0)
2cc3 : e8 __ __ INX
2cc4 : a5 0e __ LDA P1 ; (shift + 0)
2cc6 : d0 0c __ BNE $2cd4 ; (builddop_src.s6 + 0)
.s5:
2cc8 : a9 b1 __ LDA #$b1
2cca : 99 00 a0 STA $a000,y ; (BLIT_CODE[0] + 0)
2ccd : a9 03 __ LDA #$03
2ccf : 99 01 a0 STA $a001,y ; (BLIT_CODE[0] + 1)
.s35:
2cd2 : 8a __ __ TXA
.s3:
2cd3 : 60 __ __ RTS
.s6:
2cd4 : a9 a5 __ LDA #$a5
2cd6 : 99 00 a0 STA $a000,y ; (BLIT_CODE[0] + 0)
2cd9 : a9 08 __ LDA #$08
2cdb : 99 01 a0 STA $a001,y ; (BLIT_CODE[0] + 1)
2cde : a5 0f __ LDA P2 ; (reverse + 0)
2ce0 : f0 03 __ BEQ $2ce5 ; (builddop_src.s7 + 0)
2ce2 : 4c eb 2d JMP $2deb ; (builddop_src.s26 + 0)
.s7:
2ce5 : a5 0e __ LDA P1 ; (shift + 0)
2ce7 : c9 05 __ CMP #$05
2ce9 : b0 06 __ BCS $2cf1 ; (builddop_src.s8 + 0)
.s24:
2ceb : a9 4a __ LDA #$4a
.s25:
2ced : 99 02 a0 STA $a002,y ; (BLIT_CODE[0] + 2)
2cf0 : e8 __ __ INX
.s8:
2cf1 : a9 85 __ LDA #$85
2cf3 : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2cf6 : 9d 04 a0 STA $a004,x ; (BLIT_CODE[0] + 4)
2cf9 : a9 09 __ LDA #$09
2cfb : 9d 01 a0 STA $a001,x ; (BLIT_CODE[0] + 1)
2cfe : a9 b1 __ LDA #$b1
2d00 : 9d 02 a0 STA $a002,x ; (BLIT_CODE[0] + 2)
2d03 : a9 03 __ LDA #$03
2d05 : 9d 03 a0 STA $a003,x ; (BLIT_CODE[0] + 3)
2d08 : a9 08 __ LDA #$08
2d0a : 9d 05 a0 STA $a005,x ; (BLIT_CODE[0] + 5)
2d0d : 8a __ __ TXA
2d0e : 18 __ __ CLC
2d0f : 69 06 __ ADC #$06
2d11 : 85 1b __ STA ACCU + 0 
2d13 : 85 0d __ STA P0 ; (ip + 0)
2d15 : a5 0f __ LDA P2 ; (reverse + 0)
2d17 : d0 6a __ BNE $2d83 ; (builddop_src.s17 + 0)
.s9:
2d19 : a5 0e __ LDA P1 ; (shift + 0)
2d1b : c9 05 __ CMP #$05
2d1d : 90 0b __ BCC $2d2a ; (builddop_src.s10 + 0)
.s13:
2d1f : a9 0a __ LDA #$0a
2d21 : 9d 06 a0 STA $a006,x ; (BLIT_CODE[0] + 6)
2d24 : e6 1b __ INC ACCU + 0 
2d26 : a6 0e __ LDX P1 ; (shift + 0)
2d28 : b0 2e __ BCS $2d58 ; (builddop_src.l14 + 0)
.s10:
2d2a : c9 02 __ CMP #$02
2d2c : 90 1f __ BCC $2d4d ; (builddop_src.s11 + 0)
.s12:
2d2e : c6 0e __ DEC P1 ; (shift + 0)
2d30 : a6 0d __ LDX P0 ; (ip + 0)
2d32 : a4 0e __ LDY P1 ; (shift + 0)
.l31:
2d34 : a9 6a __ LDA #$6a
2d36 : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2d39 : a9 46 __ LDA #$46
2d3b : 9d 01 a0 STA $a001,x ; (BLIT_CODE[0] + 1)
2d3e : a9 09 __ LDA #$09
2d40 : 9d 02 a0 STA $a002,x ; (BLIT_CODE[0] + 2)
2d43 : 8a __ __ TXA
2d44 : 18 __ __ CLC
2d45 : 69 03 __ ADC #$03
2d47 : aa __ __ TAX
2d48 : 88 __ __ DEY
2d49 : d0 e9 __ BNE $2d34 ; (builddop_src.l31 + 0)
.s32:
2d4b : 85 0d __ STA P0 ; (ip + 0)
.s11:
2d4d : a9 6a __ LDA #$6a
.s33:
2d4f : a6 0d __ LDX P0 ; (ip + 0)
2d51 : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2d54 : e8 __ __ INX
2d55 : 4c d2 2c JMP $2cd2 ; (builddop_src.s35 + 0)
.l14:
2d58 : a9 09 __ LDA #$09
2d5a : a4 1b __ LDY ACCU + 0 
2d5c : 99 01 a0 STA $a001,y ; (BLIT_CODE[0] + 1)
2d5f : 98 __ __ TYA
2d60 : 18 __ __ CLC
2d61 : 69 03 __ ADC #$03
2d63 : 85 1b __ STA ACCU + 0 
2d65 : e0 07 __ CPX #$07
2d67 : b0 0d __ BCS $2d76 ; (builddop_src.s15 + 0)
.s16:
2d69 : a9 26 __ LDA #$26
2d6b : 99 00 a0 STA $a000,y ; (BLIT_CODE[0] + 0)
2d6e : a9 0a __ LDA #$0a
2d70 : 99 02 a0 STA $a002,y ; (BLIT_CODE[0] + 2)
2d73 : e8 __ __ INX
2d74 : 90 e2 __ BCC $2d58 ; (builddop_src.l14 + 0)
.s15:
2d76 : a9 a5 __ LDA #$a5
2d78 : 99 00 a0 STA $a000,y ; (BLIT_CODE[0] + 0)
2d7b : a9 2a __ LDA #$2a
2d7d : 99 02 a0 STA $a002,y ; (BLIT_CODE[0] + 2)
2d80 : a5 1b __ LDA ACCU + 0 
2d82 : 60 __ __ RTS
.s17:
2d83 : a4 0e __ LDY P1 ; (shift + 0)
2d85 : c0 05 __ CPY #$05
2d87 : b0 3d __ BCS $2dc6 ; (builddop_src.s21 + 0)
.s18:
2d89 : a9 4a __ LDA #$4a
2d8b : 9d 06 a0 STA $a006,x ; (BLIT_CODE[0] + 6)
2d8e : e6 1b __ INC ACCU + 0 
2d90 : c0 02 __ CPY #$02
2d92 : 90 1c __ BCC $2db0 ; (builddop_src.s19 + 0)
.s20:
2d94 : a6 1b __ LDX ACCU + 0 
2d96 : 88 __ __ DEY
.l29:
2d97 : a9 66 __ LDA #$66
2d99 : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2d9c : a9 09 __ LDA #$09
2d9e : 9d 01 a0 STA $a001,x ; (BLIT_CODE[0] + 1)
2da1 : a9 4a __ LDA #$4a
2da3 : 9d 02 a0 STA $a002,x ; (BLIT_CODE[0] + 2)
2da6 : 8a __ __ TXA
2da7 : 18 __ __ CLC
2da8 : 69 03 __ ADC #$03
2daa : aa __ __ TAX
2dab : 88 __ __ DEY
2dac : d0 e9 __ BNE $2d97 ; (builddop_src.l29 + 0)
.s30:
2dae : 85 1b __ STA ACCU + 0 
.s19:
2db0 : a9 a5 __ LDA #$a5
2db2 : a6 1b __ LDX ACCU + 0 
2db4 : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2db7 : a9 09 __ LDA #$09
2db9 : 9d 01 a0 STA $a001,x ; (BLIT_CODE[0] + 1)
2dbc : a9 6a __ LDA #$6a
2dbe : 9d 02 a0 STA $a002,x ; (BLIT_CODE[0] + 2)
2dc1 : 8a __ __ TXA
2dc2 : 18 __ __ CLC
2dc3 : 69 03 __ ADC #$03
2dc5 : 60 __ __ RTS
.s21:
2dc6 : c0 07 __ CPY #$07
2dc8 : b0 1c __ BCS $2de6 ; (builddop_src.s22 + 0)
.s23:
2dca : a6 0d __ LDX P0 ; (ip + 0)
.l34:
2dcc : a9 2a __ LDA #$2a
2dce : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2dd1 : a9 06 __ LDA #$06
2dd3 : 9d 01 a0 STA $a001,x ; (BLIT_CODE[0] + 1)
2dd6 : a9 09 __ LDA #$09
2dd8 : 9d 02 a0 STA $a002,x ; (BLIT_CODE[0] + 2)
2ddb : 8a __ __ TXA
2ddc : 69 03 __ ADC #$03
2dde : c8 __ __ INY
2ddf : c0 07 __ CPY #$07
2de1 : aa __ __ TAX
2de2 : 90 e8 __ BCC $2dcc ; (builddop_src.l34 + 0)
.s28:
2de4 : 85 0d __ STA P0 ; (ip + 0)
.s22:
2de6 : a9 2a __ LDA #$2a
2de8 : 4c 4f 2d JMP $2d4f ; (builddop_src.s33 + 0)
.s26:
2deb : a5 0e __ LDA P1 ; (shift + 0)
2ded : c9 05 __ CMP #$05
2def : b0 03 __ BCS $2df4 ; (builddop_src.s27 + 0)
2df1 : 4c f1 2c JMP $2cf1 ; (builddop_src.s8 + 0)
.s27:
2df4 : a9 0a __ LDA #$0a
2df6 : 4c ed 2c JMP $2ced ; (builddop_src.s25 + 0)
--------------------------------------------------------------------
builddop_op: ; builddop_op(u8,enum BlitOp,u8)->u8
; 965, "/home/xahmol/oscar64/include/gfx/bitmap.c"
.s4:
2df9 : a5 0e __ LDA P1 ; (op + 0)
2dfb : 29 20 __ AND #$20
2dfd : f0 04 __ BEQ $2e03 ; (builddop_op.s27 + 0)
.s28:
2dff : a9 07 __ LDA #$07
2e01 : d0 02 __ BNE $2e05 ; (builddop_op.s29 + 0)
.s27:
2e03 : a9 0a __ LDA #$0a
.s29:
2e05 : 85 1c __ STA ACCU + 1 
2e07 : a5 0e __ LDA P1 ; (op + 0)
2e09 : 29 03 __ AND #$03
2e0b : a8 __ __ TAY
2e0c : a5 0e __ LDA P1 ; (op + 0)
2e0e : 29 04 __ AND #$04
2e10 : f0 03 __ BEQ $2e15 ; (builddop_op.s5 + 0)
2e12 : 4c a7 2e JMP $2ea7 ; (builddop_op.s18 + 0)
.s5:
2e15 : a5 0e __ LDA P1 ; (op + 0)
2e17 : 29 08 __ AND #$08
2e19 : d0 13 __ BNE $2e2e ; (builddop_op.s15 + 0)
.s6:
2e1b : a9 a5 __ LDA #$a5
2e1d : a6 0d __ LDX P0 ; (ip + 0)
2e1f : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2e22 : a5 1c __ LDA ACCU + 1 
.s7:
2e24 : e8 __ __ INX
2e25 : e8 __ __ INX
2e26 : 86 0d __ STX P0 ; (ip + 0)
2e28 : 9d ff 9f STA $9fff,x 
2e2b : 4c 3e 2e JMP $2e3e ; (builddop_op.s16 + 0)
.s15:
2e2e : a5 0e __ LDA P1 ; (op + 0)
2e30 : 0a __ __ ASL
2e31 : 10 0b __ BPL $2e3e ; (builddop_op.s16 + 0)
.s17:
2e33 : a9 49 __ LDA #$49
2e35 : a6 0d __ LDX P0 ; (ip + 0)
2e37 : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2e3a : a9 ff __ LDA #$ff
2e3c : d0 e6 __ BNE $2e24 ; (builddop_op.s7 + 0)
.s16:
2e3e : 98 __ __ TYA
2e3f : f0 13 __ BEQ $2e54 ; (builddop_op.s8 + 0)
.s14:
2e41 : a5 1c __ LDA ACCU + 1 
2e43 : a6 0d __ LDX P0 ; (ip + 0)
2e45 : e8 __ __ INX
2e46 : e8 __ __ INX
2e47 : 86 0d __ STX P0 ; (ip + 0)
2e49 : 9d ff 9f STA $9fff,x 
2e4c : b9 a3 7d LDA $7da3,y ; (blitops_op[0] + 0)
2e4f : 09 04 __ ORA #$04
2e51 : 9d fe 9f STA $9ffe,x 
.s8:
2e54 : a5 0f __ LDA P2 ; (mask + 0)
2e56 : f0 3f __ BEQ $2e97 ; (builddop_op.s9 + 0)
.s10:
2e58 : a9 85 __ LDA #$85
2e5a : a4 0d __ LDY P0 ; (ip + 0)
2e5c : 99 00 a0 STA $a000,y ; (BLIT_CODE[0] + 0)
2e5f : a9 09 __ LDA #$09
2e61 : 99 01 a0 STA $a001,y ; (BLIT_CODE[0] + 1)
2e64 : 98 __ __ TYA
2e65 : 18 __ __ CLC
2e66 : 69 08 __ ADC #$08
2e68 : 85 0d __ STA P0 ; (ip + 0)
2e6a : a5 0e __ LDA P1 ; (op + 0)
2e6c : 29 10 __ AND #$10
2e6e : f0 09 __ BEQ $2e79 ; (builddop_op.s11 + 0)
.s13:
2e70 : a9 45 __ LDA #$45
2e72 : 99 02 a0 STA $a002,y ; (BLIT_CODE[0] + 2)
2e75 : a9 0a __ LDA #$0a
2e77 : d0 07 __ BNE $2e80 ; (builddop_op.s12 + 0)
.s11:
2e79 : a9 51 __ LDA #$51
2e7b : 99 02 a0 STA $a002,y ; (BLIT_CODE[0] + 2)
2e7e : a9 05 __ LDA #$05
.s12:
2e80 : 99 03 a0 STA $a003,y ; (BLIT_CODE[0] + 3)
2e83 : a9 29 __ LDA #$29
2e85 : 99 04 a0 STA $a004,y ; (BLIT_CODE[0] + 4)
2e88 : a5 0f __ LDA P2 ; (mask + 0)
2e8a : 99 05 a0 STA $a005,y ; (BLIT_CODE[0] + 5)
2e8d : a9 45 __ LDA #$45
2e8f : 99 06 a0 STA $a006,y ; (BLIT_CODE[0] + 6)
2e92 : a9 09 __ LDA #$09
2e94 : 99 07 a0 STA $a007,y ; (BLIT_CODE[0] + 7)
.s9:
2e97 : a9 91 __ LDA #$91
2e99 : a6 0d __ LDX P0 ; (ip + 0)
2e9b : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2e9e : a9 05 __ LDA #$05
2ea0 : 9d 01 a0 STA $a001,x ; (BLIT_CODE[0] + 1)
2ea3 : e8 __ __ INX
2ea4 : e8 __ __ INX
2ea5 : 8a __ __ TXA
.s3:
2ea6 : 60 __ __ RTS
.s18:
2ea7 : 98 __ __ TYA
2ea8 : d0 04 __ BNE $2eae ; (builddop_op.s20 + 0)
.s19:
2eaa : a5 0f __ LDA P2 ; (mask + 0)
2eac : d0 16 __ BNE $2ec4 ; (builddop_op.s23 + 0)
.s20:
2eae : a5 0e __ LDA P1 ; (op + 0)
2eb0 : 29 40 __ AND #$40
2eb2 : f0 02 __ BEQ $2eb6 ; (builddop_op.s21 + 0)
.s22:
2eb4 : a9 ff __ LDA #$ff
.s21:
2eb6 : 85 1b __ STA ACCU + 0 
2eb8 : a9 a9 __ LDA #$a9
2eba : a6 0d __ LDX P0 ; (ip + 0)
2ebc : 9d 00 a0 STA $a000,x ; (BLIT_CODE[0] + 0)
2ebf : a5 1b __ LDA ACCU + 0 
2ec1 : 4c 24 2e JMP $2e24 ; (builddop_op.s7 + 0)
.s23:
2ec4 : a9 b1 __ LDA #$b1
2ec6 : a4 0d __ LDY P0 ; (ip + 0)
2ec8 : 99 00 a0 STA $a000,y ; (BLIT_CODE[0] + 0)
2ecb : a9 05 __ LDA #$05
2ecd : 99 01 a0 STA $a001,y ; (BLIT_CODE[0] + 1)
2ed0 : 06 0e __ ASL P1 ; (op + 0)
2ed2 : 30 0a __ BMI $2ede ; (builddop_op.s26 + 0)
.s24:
2ed4 : a9 29 __ LDA #$29
2ed6 : 99 02 a0 STA $a002,y ; (BLIT_CODE[0] + 2)
2ed9 : a5 0f __ LDA P2 ; (mask + 0)
2edb : 4c e7 2e JMP $2ee7 ; (builddop_op.s25 + 0)
.s26:
2ede : a9 09 __ LDA #$09
2ee0 : 99 02 a0 STA $a002,y ; (BLIT_CODE[0] + 2)
2ee3 : a5 0f __ LDA P2 ; (mask + 0)
2ee5 : 49 ff __ EOR #$ff
.s25:
2ee7 : 99 03 a0 STA $a003,y ; (BLIT_CODE[0] + 3)
2eea : a9 91 __ LDA #$91
2eec : 99 04 a0 STA $a004,y ; (BLIT_CODE[0] + 4)
2eef : a9 05 __ LDA #$05
2ef1 : 99 05 a0 STA $a005,y ; (BLIT_CODE[0] + 5)
2ef4 : 98 __ __ TYA
2ef5 : 18 __ __ CLC
2ef6 : 69 06 __ ADC #$06
2ef8 : 60 __ __ RTS
--------------------------------------------------------------------
draw_message: ; draw_message(u8)->void
; 234, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s1:
2ef9 : a2 04 __ LDX #$04
2efb : b5 53 __ LDA T1 + 0,x 
2efd : 9d cd bf STA $bfcd,x ; (draw_message@stack + 0)
2f00 : ca __ __ DEX
2f01 : 10 f8 __ BPL $2efb ; (draw_message.s1 + 2)
.s4:
2f03 : ad f0 bf LDA $bff0 ; (sstack + 6)
2f06 : 0a __ __ ASL
2f07 : aa __ __ TAX
2f08 : bd a7 7d LDA $7da7,x ; (step_msg[0] + 0)
2f0b : 85 56 __ STA T3 + 0 
2f0d : 85 0d __ STA P0 
2f0f : bd a8 7d LDA $7da8,x ; (step_msg[0] + 1)
2f12 : 85 57 __ STA T3 + 1 
2f14 : 85 0e __ STA P1 
2f16 : 20 aa 10 JSR $10aa ; (strlen.s4 + 0)
2f19 : a9 00 __ LDA #$00
2f1b : 85 53 __ STA T1 + 0 
2f1d : 85 54 __ STA T1 + 1 
2f1f : a5 1b __ LDA ACCU + 0 
2f21 : f0 1b __ BEQ $2f3e ; (draw_message.s5 + 0)
.s6:
2f23 : a0 00 __ LDY #$00
.l7:
2f25 : b1 56 __ LDA (T3 + 0),y 
2f27 : 38 __ __ SEC
2f28 : e9 20 __ SBC #$20
2f2a : aa __ __ TAX
2f2b : bd 27 7e LDA $7e27,x ; (TinyFont[0] + 96)
2f2e : 4a __ __ LSR
2f2f : 4a __ __ LSR
2f30 : 38 __ __ SEC
2f31 : 65 53 __ ADC T1 + 0 
2f33 : 85 53 __ STA T1 + 0 
2f35 : 90 02 __ BCC $2f39 ; (draw_message.s9 + 0)
.s8:
2f37 : e6 54 __ INC T1 + 1 
.s9:
2f39 : c8 __ __ INY
2f3a : c4 1b __ CPY ACCU + 0 
2f3c : 90 e7 __ BCC $2f25 ; (draw_message.l7 + 0)
.s5:
2f3e : a5 0d __ LDA P0 
2f40 : 85 0e __ STA P1 
2f42 : a5 57 __ LDA T3 + 1 
2f44 : 85 0f __ STA P2 
2f46 : a5 1b __ LDA ACCU + 0 
2f48 : 85 10 __ STA P3 
2f4a : 38 __ __ SEC
2f4b : a9 40 __ LDA #$40
2f4d : e5 53 __ SBC T1 + 0 
2f4f : a8 __ __ TAY
2f50 : a9 01 __ LDA #$01
2f52 : e5 54 __ SBC T1 + 1 
2f54 : aa __ __ TAX
2f55 : 0a __ __ ASL
2f56 : 98 __ __ TYA
2f57 : 69 00 __ ADC #$00
2f59 : 85 53 __ STA T1 + 0 
2f5b : 8a __ __ TXA
2f5c : 69 00 __ ADC #$00
2f5e : c9 80 __ CMP #$80
2f60 : 6a __ __ ROR
2f61 : 66 53 __ ROR T1 + 0 
2f63 : 85 54 __ STA T1 + 1 
2f65 : a5 53 __ LDA T1 + 0 
2f67 : 29 07 __ AND #$07
2f69 : 85 55 __ STA T2 + 0 
2f6b : 85 0d __ STA P0 
2f6d : 20 58 31 JSR $3158 ; (bmu_text.s4 + 0)
2f70 : a5 53 __ LDA T1 + 0 
2f72 : 85 10 __ STA P3 
2f74 : a5 54 __ LDA T1 + 1 
2f76 : 85 11 __ STA P4 
2f78 : a9 00 __ LDA #$00
2f7a : 85 13 __ STA P6 
2f7c : 85 17 __ STA P10 
2f7e : 8d ea bf STA $bfea ; (sstack + 0)
2f81 : 8d eb bf STA $bfeb ; (sstack + 1)
2f84 : 8d ef bf STA $bfef ; (sstack + 5)
2f87 : a5 55 __ LDA T2 + 0 
2f89 : 85 16 __ STA P9 
2f8b : a9 a2 __ LDA #$a2
2f8d : 85 12 __ STA P5 
2f8f : a5 1b __ LDA ACCU + 0 
2f91 : 8d ec bf STA $bfec ; (sstack + 2)
2f94 : a5 1c __ LDA ACCU + 1 
2f96 : 8d ed bf STA $bfed ; (sstack + 3)
2f99 : a9 08 __ LDA #$08
2f9b : 85 18 __ STA P11 
2f9d : 8d ee bf STA $bfee ; (sstack + 4)
2fa0 : a9 f2 __ LDA #$f2
2fa2 : 85 14 __ STA P7 
2fa4 : a9 7f __ LDA #$7f
2fa6 : 85 15 __ STA P8 
2fa8 : 20 44 26 JSR $2644 ; (bmu_bitblit.s1 + 0)
.s3:
2fab : a2 04 __ LDX #$04
2fad : bd cd bf LDA $bfcd,x ; (draw_message@stack + 0)
2fb0 : 95 53 __ STA T1 + 0,x 
2fb2 : ca __ __ DEX
2fb3 : 10 f8 __ BPL $2fad ; (draw_message.s3 + 2)
2fb5 : 60 __ __ RTS
--------------------------------------------------------------------
2fb6 : __ __ __ BYT 53 74 61 6e 64 61 72 64 20 31 20 4d 48 7a 20 43 : Standard 1 MHz C
2fc6 : __ __ __ BYT 36 34 20 73 70 65 65 64 00                      : 64 speed.
--------------------------------------------------------------------
2fcf : __ __ __ BYT 54 75 72 62 6f 20 65 6e 67 61 67 65 64 3a 20 32 : Turbo engaged: 2
2fdf : __ __ __ BYT 20 4d 48 7a 00                                  :  MHz.
--------------------------------------------------------------------
2fe4 : __ __ __ BYT 33 20 4d 48 7a 20 2d 20 77 61 72 6d 69 6e 67 20 : 3 MHz - warming 
2ff4 : __ __ __ BYT 75 70 00                                        : up.
--------------------------------------------------------------------
2ff7 : __ __ __ BYT 34 20 4d 48 7a 20 2d 20 73 6d 6f 6f 74 68 20 61 : 4 MHz - smooth a
3007 : __ __ __ BYT 6c 72 65 61 64 79 21 00                         : lready!.
--------------------------------------------------------------------
300f : __ __ __ BYT 36 20 4d 48 7a 20 2d 20 74 68 69 73 20 66 65 65 : 6 MHz - this fee
301f : __ __ __ BYT 6c 73 20 64 69 66 66 65 72 65 6e 74 00          : ls different.
--------------------------------------------------------------------
302c : __ __ __ BYT 38 20 4d 48 7a 20 2d 20 74 68 69 6e 67 73 20 61 : 8 MHz - things a
303c : __ __ __ BYT 72 65 20 6d 6f 76 69 6e 67 00                   : re moving.
--------------------------------------------------------------------
3046 : __ __ __ BYT 31 32 20 4d 48 7a 20 2d 20 70 69 63 6b 69 6e 67 : 12 MHz - picking
3056 : __ __ __ BYT 20 75 70 20 73 70 65 65 64 00                   :  up speed.
--------------------------------------------------------------------
3060 : __ __ __ BYT 31 36 20 4d 48 7a 20 2d 20 6e 6f 74 69 63 65 61 : 16 MHz - noticea
3070 : __ __ __ BYT 62 6c 79 20 66 61 73 74 00                      : bly fast.
--------------------------------------------------------------------
3079 : __ __ __ BYT 32 30 20 4d 48 7a 20 2d 20 77 68 61 74 20 69 73 : 20 MHz - what is
3089 : __ __ __ BYT 20 68 61 70 70 65 6e 69 6e 67 3f 00             :  happening?.
--------------------------------------------------------------------
3095 : __ __ __ BYT 32 34 20 4d 48 7a 20 2d 20 65 79 65 73 20 63 61 : 24 MHz - eyes ca
30a5 : __ __ __ BYT 6e 20 62 61 72 65 6c 79 20 66 6f 6c 6c 6f 77 00 : n barely follow.
--------------------------------------------------------------------
30b5 : __ __ __ BYT 32 38 20 4d 48 7a 20 2d 20 74 68 69 73 20 69 73 : 28 MHz - this is
30c5 : __ __ __ BYT 20 69 6e 63 72 65 64 69 62 6c 65 21 00          :  incredible!.
--------------------------------------------------------------------
30d2 : __ __ __ BYT 33 32 20 4d 48 7a 20 2d 20 74 68 65 20 6d 61 63 : 32 MHz - the mac
30e2 : __ __ __ BYT 68 69 6e 65 20 73 63 72 65 61 6d 73 00          : hine screams.
--------------------------------------------------------------------
30ef : __ __ __ BYT 33 36 20 4d 48 7a 20 2d 20 62 65 79 6f 6e 64 20 : 36 MHz - beyond 
30ff : __ __ __ BYT 69 6d 61 67 69 6e 61 74 69 6f 6e 00             : imagination.
--------------------------------------------------------------------
310b : __ __ __ BYT 34 30 20 4d 48 7a 20 2d 20 68 6f 6c 64 20 6f 6e : 40 MHz - hold on
311b : __ __ __ BYT 20 74 69 67 68 74 21 00                         :  tight!.
--------------------------------------------------------------------
3123 : __ __ __ BYT 34 38 20 4d 48 7a 20 2d 20 6d 61 78 69 6d 75 6d : 48 MHz - maximum
3133 : __ __ __ BYT 20 6f 76 65 72 64 72 69 76 65 21 00             :  overdrive!.
--------------------------------------------------------------------
313f : __ __ __ BYT 36 34 20 4d 48 7a 20 20 55 4c 54 49 4d 41 54 45 : 64 MHz  ULTIMATE
314f : __ __ __ BYT 20 53 50 45 45 44 21 21 00                      :  SPEED!!.
--------------------------------------------------------------------
bmu_text: ; bmu_text(const struct Bitmap*,u8,const u8*,u8)->i16
; 151, "/home/xahmol/oscar64/include/gfx/bitmap.h"
.s4:
3158 : a9 00 __ LDA #$00
315a : 8d aa 87 STA $87aa ; (tworks[0] + 0)
315d : 8d ab 87 STA $87ab ; (tworks[0] + 1)
3160 : 8d ac 87 STA $87ac ; (tworks[0] + 2)
3163 : 8d ad 87 STA $87ad ; (tworks[0] + 3)
3166 : 8d ae 87 STA $87ae ; (tworks[0] + 4)
3169 : 8d af 87 STA $87af ; (tworks[0] + 5)
316c : 8d b0 87 STA $87b0 ; (tworks[0] + 6)
316f : 8d b1 87 STA $87b1 ; (tworks[0] + 7)
3172 : 85 1b __ STA ACCU + 0 
3174 : 85 1c __ STA ACCU + 1 
3176 : ad f2 7f LDA $7ff2 ; (tbitmap.data + 0)
3179 : 85 43 __ STA T1 + 0 
317b : ad f3 7f LDA $7ff3 ; (tbitmap.data + 1)
317e : 85 44 __ STA T1 + 1 
3180 : a5 10 __ LDA P3 ; (len + 0)
3182 : d0 03 __ BNE $3187 ; (bmu_text.s7 + 0)
3184 : 4c 94 32 JMP $3294 ; (bmu_text.s5 + 0)
.s7:
3187 : a0 00 __ LDY #$00
.l8:
3189 : 84 1d __ STY ACCU + 2 
318b : b1 0e __ LDA (P1),y ; (str + 0)
318d : 38 __ __ SEC
318e : e9 20 __ SBC #$20
3190 : aa __ __ TAX
3191 : 18 __ __ CLC
3192 : a9 87 __ LDA #$87
3194 : 7d c7 7d ADC $7dc7,x ; (TinyFont[0] + 0)
3197 : 85 45 __ STA T6 + 0 
3199 : bd 27 7e LDA $7e27,x ; (TinyFont[0] + 96)
319c : 29 03 __ AND #$03
319e : 69 7e __ ADC #$7e
31a0 : 85 46 __ STA T6 + 1 
31a2 : bd 27 7e LDA $7e27,x ; (TinyFont[0] + 96)
31a5 : 4a __ __ LSR
31a6 : 4a __ __ LSR
31a7 : 85 1e __ STA ACCU + 3 
31a9 : 38 __ __ SEC
31aa : 65 1b __ ADC ACCU + 0 
31ac : 85 1b __ STA ACCU + 0 
31ae : 90 02 __ BCC $31b2 ; (bmu_text.s19 + 0)
.s18:
31b0 : e6 1c __ INC ACCU + 1 
.s19:
31b2 : a9 00 __ LDA #$00
31b4 : 85 47 __ STA T7 + 0 
31b6 : a5 1e __ LDA ACCU + 3 
31b8 : f0 73 __ BEQ $322d ; (bmu_text.s9 + 0)
.s16:
31ba : a6 0d __ LDX P0 ; (lx + 0)
31bc : a0 00 __ LDY #$00
.l12:
31be : b1 45 __ LDA (T6 + 0),y 
31c0 : 0a __ __ ASL
31c1 : 2e aa 87 ROL $87aa ; (tworks[0] + 0)
31c4 : 0a __ __ ASL
31c5 : 2e ab 87 ROL $87ab ; (tworks[0] + 1)
31c8 : 0a __ __ ASL
31c9 : 2e ac 87 ROL $87ac ; (tworks[0] + 2)
31cc : 0a __ __ ASL
31cd : 2e ad 87 ROL $87ad ; (tworks[0] + 3)
31d0 : 0a __ __ ASL
31d1 : 2e ae 87 ROL $87ae ; (tworks[0] + 4)
31d4 : 0a __ __ ASL
31d5 : 2e af 87 ROL $87af ; (tworks[0] + 5)
31d8 : 0a __ __ ASL
31d9 : 2e b0 87 ROL $87b0 ; (tworks[0] + 6)
31dc : 0a __ __ ASL
31dd : 2e b1 87 ROL $87b1 ; (tworks[0] + 7)
31e0 : e8 __ __ INX
31e1 : e0 08 __ CPX #$08
31e3 : d0 3e __ BNE $3223 ; (bmu_text.s13 + 0)
.s14:
31e5 : ad aa 87 LDA $87aa ; (tworks[0] + 0)
31e8 : a0 00 __ LDY #$00
31ea : 91 43 __ STA (T1 + 0),y 
31ec : ad ab 87 LDA $87ab ; (tworks[0] + 1)
31ef : c8 __ __ INY
31f0 : 91 43 __ STA (T1 + 0),y 
31f2 : ad ac 87 LDA $87ac ; (tworks[0] + 2)
31f5 : c8 __ __ INY
31f6 : 91 43 __ STA (T1 + 0),y 
31f8 : ad ad 87 LDA $87ad ; (tworks[0] + 3)
31fb : c8 __ __ INY
31fc : 91 43 __ STA (T1 + 0),y 
31fe : ad ae 87 LDA $87ae ; (tworks[0] + 4)
3201 : c8 __ __ INY
3202 : 91 43 __ STA (T1 + 0),y 
3204 : ad af 87 LDA $87af ; (tworks[0] + 5)
3207 : c8 __ __ INY
3208 : 91 43 __ STA (T1 + 0),y 
320a : ad b0 87 LDA $87b0 ; (tworks[0] + 6)
320d : c8 __ __ INY
320e : 91 43 __ STA (T1 + 0),y 
3210 : ad b1 87 LDA $87b1 ; (tworks[0] + 7)
3213 : c8 __ __ INY
3214 : 91 43 __ STA (T1 + 0),y 
3216 : 18 __ __ CLC
3217 : a5 43 __ LDA T1 + 0 
3219 : 69 08 __ ADC #$08
321b : 85 43 __ STA T1 + 0 
321d : 90 02 __ BCC $3221 ; (bmu_text.s21 + 0)
.s20:
321f : e6 44 __ INC T1 + 1 
.s21:
3221 : a2 00 __ LDX #$00
.s13:
3223 : e6 47 __ INC T7 + 0 
3225 : a4 47 __ LDY T7 + 0 
3227 : c4 1e __ CPY ACCU + 3 
3229 : 90 93 __ BCC $31be ; (bmu_text.l12 + 0)
.s17:
322b : 86 0d __ STX P0 ; (lx + 0)
.s9:
322d : 0e aa 87 ASL $87aa ; (tworks[0] + 0)
3230 : 0e ab 87 ASL $87ab ; (tworks[0] + 1)
3233 : 0e ac 87 ASL $87ac ; (tworks[0] + 2)
3236 : 0e ad 87 ASL $87ad ; (tworks[0] + 3)
3239 : 0e ae 87 ASL $87ae ; (tworks[0] + 4)
323c : 0e af 87 ASL $87af ; (tworks[0] + 5)
323f : 0e b0 87 ASL $87b0 ; (tworks[0] + 6)
3242 : 0e b1 87 ASL $87b1 ; (tworks[0] + 7)
3245 : e6 0d __ INC P0 ; (lx + 0)
3247 : a5 0d __ LDA P0 ; (lx + 0)
3249 : c9 08 __ CMP #$08
324b : d0 3d __ BNE $328a ; (bmu_text.s10 + 0)
.s11:
324d : ad aa 87 LDA $87aa ; (tworks[0] + 0)
3250 : a0 00 __ LDY #$00
3252 : 84 0d __ STY P0 ; (lx + 0)
3254 : 91 43 __ STA (T1 + 0),y 
3256 : ad ab 87 LDA $87ab ; (tworks[0] + 1)
3259 : c8 __ __ INY
325a : 91 43 __ STA (T1 + 0),y 
325c : ad ac 87 LDA $87ac ; (tworks[0] + 2)
325f : c8 __ __ INY
3260 : 91 43 __ STA (T1 + 0),y 
3262 : ad ad 87 LDA $87ad ; (tworks[0] + 3)
3265 : c8 __ __ INY
3266 : 91 43 __ STA (T1 + 0),y 
3268 : ad ae 87 LDA $87ae ; (tworks[0] + 4)
326b : c8 __ __ INY
326c : 91 43 __ STA (T1 + 0),y 
326e : ad af 87 LDA $87af ; (tworks[0] + 5)
3271 : c8 __ __ INY
3272 : 91 43 __ STA (T1 + 0),y 
3274 : ad b0 87 LDA $87b0 ; (tworks[0] + 6)
3277 : c8 __ __ INY
3278 : 91 43 __ STA (T1 + 0),y 
327a : ad b1 87 LDA $87b1 ; (tworks[0] + 7)
327d : c8 __ __ INY
327e : 91 43 __ STA (T1 + 0),y 
3280 : a5 43 __ LDA T1 + 0 
3282 : 69 07 __ ADC #$07
3284 : 85 43 __ STA T1 + 0 
3286 : 90 02 __ BCC $328a ; (bmu_text.s10 + 0)
.s22:
3288 : e6 44 __ INC T1 + 1 
.s10:
328a : a4 1d __ LDY ACCU + 2 
328c : c8 __ __ INY
328d : c4 10 __ CPY P3 ; (len + 0)
328f : b0 03 __ BCS $3294 ; (bmu_text.s5 + 0)
3291 : 4c 89 31 JMP $3189 ; (bmu_text.l8 + 0)
.s5:
3294 : a6 0d __ LDX P0 ; (lx + 0)
3296 : e0 08 __ CPX #$08
3298 : b0 1d __ BCS $32b7 ; (bmu_text.s6 + 0)
.l15:
329a : 0e aa 87 ASL $87aa ; (tworks[0] + 0)
329d : 0e ab 87 ASL $87ab ; (tworks[0] + 1)
32a0 : 0e ac 87 ASL $87ac ; (tworks[0] + 2)
32a3 : 0e ad 87 ASL $87ad ; (tworks[0] + 3)
32a6 : 0e ae 87 ASL $87ae ; (tworks[0] + 4)
32a9 : 0e af 87 ASL $87af ; (tworks[0] + 5)
32ac : 0e b0 87 ASL $87b0 ; (tworks[0] + 6)
32af : 0e b1 87 ASL $87b1 ; (tworks[0] + 7)
32b2 : e8 __ __ INX
32b3 : e0 08 __ CPX #$08
32b5 : 90 e3 __ BCC $329a ; (bmu_text.l15 + 0)
.s6:
32b7 : ad aa 87 LDA $87aa ; (tworks[0] + 0)
32ba : a0 00 __ LDY #$00
32bc : 91 43 __ STA (T1 + 0),y 
32be : ad ab 87 LDA $87ab ; (tworks[0] + 1)
32c1 : c8 __ __ INY
32c2 : 91 43 __ STA (T1 + 0),y 
32c4 : ad ac 87 LDA $87ac ; (tworks[0] + 2)
32c7 : c8 __ __ INY
32c8 : 91 43 __ STA (T1 + 0),y 
32ca : ad ad 87 LDA $87ad ; (tworks[0] + 3)
32cd : c8 __ __ INY
32ce : 91 43 __ STA (T1 + 0),y 
32d0 : ad ae 87 LDA $87ae ; (tworks[0] + 4)
32d3 : c8 __ __ INY
32d4 : 91 43 __ STA (T1 + 0),y 
32d6 : ad af 87 LDA $87af ; (tworks[0] + 5)
32d9 : c8 __ __ INY
32da : 91 43 __ STA (T1 + 0),y 
32dc : ad b0 87 LDA $87b0 ; (tworks[0] + 6)
32df : c8 __ __ INY
32e0 : 91 43 __ STA (T1 + 0),y 
32e2 : ad b1 87 LDA $87b1 ; (tworks[0] + 7)
32e5 : c8 __ __ INY
32e6 : 91 43 __ STA (T1 + 0),y 
.s3:
32e8 : 60 __ __ RTS
--------------------------------------------------------------------
draw_gear: ; draw_gear(i16,i16,u8,u8,u8,u8,u8,u8,u8,u8)->void
;  88, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s1:
32e9 : a2 20 __ LDX #$20
32eb : b5 53 __ LDA T0 + 0,x 
32ed : 9d b0 bf STA $bfb0,x ; (draw_gear@stack + 0)
32f0 : ca __ __ DEX
32f1 : 10 f8 __ BPL $32eb ; (draw_gear.s1 + 2)
.s4:
32f3 : ad fd bf LDA $bffd ; (sstack + 19)
32f6 : 85 5d __ STA T5 + 0 
32f8 : ad fc bf LDA $bffc ; (sstack + 18)
32fb : 85 5e __ STA T6 + 0 
32fd : ad f9 bf LDA $bff9 ; (sstack + 15)
3300 : 85 5f __ STA T7 + 0 
3302 : ad fb bf LDA $bffb ; (sstack + 17)
3305 : 85 60 __ STA T8 + 0 
3307 : 4a __ __ LSR
3308 : 85 61 __ STA T9 + 0 
330a : a9 00 __ LDA #$00
330c : 85 62 __ STA T10 + 0 
330e : 85 63 __ STA T11 + 0 
3310 : 85 64 __ STA T11 + 1 
3312 : 85 65 __ STA T12 + 0 
3314 : 85 66 __ STA T12 + 1 
3316 : 85 53 __ STA T0 + 0 
3318 : 85 54 __ STA T0 + 1 
331a : 85 55 __ STA T1 + 0 
331c : 85 56 __ STA T1 + 1 
331e : ae ff bf LDX $bfff ; (sstack + 21)
3321 : 86 71 __ STX T20 + 0 
3323 : ae fe bf LDX $bffe ; (sstack + 20)
3326 : 86 72 __ STX T21 + 0 
3328 : ae fa bf LDX $bffa ; (sstack + 16)
332b : 86 73 __ STX T22 + 0 
332d : ae f7 bf LDX $bff7 ; (sstack + 13)
3330 : 86 67 __ STX T13 + 0 
.l5:
3332 : 85 1b __ STA ACCU + 0 
3334 : a9 00 __ LDA #$00
3336 : 85 1c __ STA ACCU + 1 
3338 : a5 60 __ LDA T8 + 0 
333a : 20 62 77 JSR $7762 ; (mul16by8 + 0)
333d : 18 __ __ CLC
333e : a5 1b __ LDA ACCU + 0 
3340 : 65 5f __ ADC T7 + 0 
3342 : 29 3f __ AND #$3f
3344 : 85 68 __ STA T14 + 0 
3346 : 18 __ __ CLC
3347 : 69 10 __ ADC #$10
3349 : 29 3f __ AND #$3f
334b : aa __ __ TAX
334c : bd 00 80 LDA $8000,x ; (sin64[0] + 0)
334f : 85 57 __ STA T2 + 0 
3351 : 0a __ __ ASL
3352 : a9 00 __ LDA #$00
3354 : 85 04 __ STA WORK + 1 
3356 : 69 ff __ ADC #$ff
3358 : 49 ff __ EOR #$ff
335a : 85 58 __ STA T2 + 1 
335c : a5 57 __ LDA T2 + 0 
335e : 0a __ __ ASL
335f : 85 1b __ STA ACCU + 0 
3361 : a5 58 __ LDA T2 + 1 
3363 : 2a __ __ ROL
3364 : 06 1b __ ASL ACCU + 0 
3366 : 2a __ __ ROL
3367 : 85 1c __ STA ACCU + 1 
3369 : 20 f6 76 JSR $76f6 ; (divs16@proxy + 0)
336c : a5 1b __ LDA ACCU + 0 
336e : 85 69 __ STA T15 + 0 
3370 : a5 1c __ LDA ACCU + 1 
3372 : 85 6a __ STA T15 + 1 
3374 : a6 68 __ LDX T14 + 0 
3376 : bd 00 80 LDA $8000,x ; (sin64[0] + 0)
3379 : 85 59 __ STA T3 + 0 
337b : 85 1b __ STA ACCU + 0 
337d : 29 80 __ AND #$80
337f : 10 02 __ BPL $3383 ; (draw_gear.l5 + 81)
3381 : a9 ff __ LDA #$ff
3383 : 85 5a __ STA T3 + 1 
3385 : 85 1c __ STA ACCU + 1 
3387 : a5 5d __ LDA T5 + 0 
3389 : 20 62 77 JSR $7762 ; (mul16by8 + 0)
338c : 20 3e 7c JSR $7c3e ; (divs16@proxy + 0)
338f : 18 __ __ CLC
3390 : a5 1b __ LDA ACCU + 0 
3392 : 69 58 __ ADC #$58
3394 : 85 6b __ STA T16 + 0 
3396 : a5 1c __ LDA ACCU + 1 
3398 : 69 00 __ ADC #$00
339a : 85 6c __ STA T16 + 1 
339c : a5 57 __ LDA T2 + 0 
339e : 85 1b __ STA ACCU + 0 
33a0 : a5 58 __ LDA T2 + 1 
33a2 : 85 1c __ STA ACCU + 1 
33a4 : a5 5d __ LDA T5 + 0 
33a6 : 20 62 77 JSR $7762 ; (mul16by8 + 0)
33a9 : 20 3e 7c JSR $7c3e ; (divs16@proxy + 0)
33ac : 18 __ __ CLC
33ad : a5 1b __ LDA ACCU + 0 
33af : 65 67 __ ADC T13 + 0 
33b1 : 85 6d __ STA T17 + 0 
33b3 : a5 1c __ LDA ACCU + 1 
33b5 : 69 00 __ ADC #$00
33b7 : 85 6e __ STA T17 + 1 
33b9 : a5 59 __ LDA T3 + 0 
33bb : 85 1b __ STA ACCU + 0 
33bd : a5 5a __ LDA T3 + 1 
33bf : 85 1c __ STA ACCU + 1 
33c1 : a5 5e __ LDA T6 + 0 
33c3 : 20 62 77 JSR $7762 ; (mul16by8 + 0)
33c6 : 20 3e 7c JSR $7c3e ; (divs16@proxy + 0)
33c9 : 18 __ __ CLC
33ca : a5 1b __ LDA ACCU + 0 
33cc : 69 58 __ ADC #$58
33ce : 85 5b __ STA T4 + 0 
33d0 : a5 1c __ LDA ACCU + 1 
33d2 : 69 00 __ ADC #$00
33d4 : 85 5c __ STA T4 + 1 
33d6 : a5 57 __ LDA T2 + 0 
33d8 : 85 1b __ STA ACCU + 0 
33da : a5 58 __ LDA T2 + 1 
33dc : 85 1c __ STA ACCU + 1 
33de : a5 5e __ LDA T6 + 0 
33e0 : 20 62 77 JSR $7762 ; (mul16by8 + 0)
33e3 : 20 3e 7c JSR $7c3e ; (divs16@proxy + 0)
33e6 : 18 __ __ CLC
33e7 : a5 1b __ LDA ACCU + 0 
33e9 : 65 67 __ ADC T13 + 0 
33eb : 85 57 __ STA T2 + 0 
33ed : a5 1c __ LDA ACCU + 1 
33ef : 69 00 __ ADC #$00
33f1 : 85 58 __ STA T2 + 1 
33f3 : 38 __ __ SEC
33f4 : a9 00 __ LDA #$00
33f6 : e5 59 __ SBC T3 + 0 
33f8 : 85 1b __ STA ACCU + 0 
33fa : a9 00 __ LDA #$00
33fc : 85 04 __ STA WORK + 1 
33fe : e5 5a __ SBC T3 + 1 
3400 : 06 1b __ ASL ACCU + 0 
3402 : 2a __ __ ROL
3403 : 06 1b __ ASL ACCU + 0 
3405 : 2a __ __ ROL
3406 : 85 1c __ STA ACCU + 1 
3408 : 20 f6 76 JSR $76f6 ; (divs16@proxy + 0)
340b : a5 1b __ LDA ACCU + 0 
340d : 85 59 __ STA T3 + 0 
340f : a5 1c __ LDA ACCU + 1 
3411 : 85 5a __ STA T3 + 1 
3413 : 05 1b __ ORA ACCU + 0 
3415 : d0 12 __ BNE $3429 ; (draw_gear.s6 + 0)
.s12:
3417 : 85 59 __ STA T3 + 0 
3419 : 85 5a __ STA T3 + 1 
341b : a5 69 __ LDA T15 + 0 
341d : 05 6a __ ORA T15 + 1 
341f : d0 08 __ BNE $3429 ; (draw_gear.s6 + 0)
.s13:
3421 : a9 01 __ LDA #$01
3423 : 85 69 __ STA T15 + 0 
3425 : a9 00 __ LDA #$00
3427 : 85 6a __ STA T15 + 1 
.s6:
3429 : a5 62 __ LDA T10 + 0 
342b : d0 1d __ BNE $344a ; (draw_gear.s11 + 0)
.s7:
342d : 38 __ __ SEC
342e : a5 5b __ LDA T4 + 0 
3430 : e5 69 __ SBC T15 + 0 
3432 : 85 65 __ STA T12 + 0 
3434 : a5 5c __ LDA T4 + 1 
3436 : e5 6a __ SBC T15 + 1 
3438 : 85 66 __ STA T12 + 1 
343a : 38 __ __ SEC
343b : a5 57 __ LDA T2 + 0 
343d : e5 59 __ SBC T3 + 0 
343f : 85 63 __ STA T11 + 0 
3441 : a5 58 __ LDA T2 + 1 
3443 : e5 5a __ SBC T3 + 1 
3445 : 85 64 __ STA T11 + 1 
3447 : 4c 98 34 JMP $3498 ; (draw_gear.s8 + 0)
.s11:
344a : a5 53 __ LDA T0 + 0 
344c : 8d ee bf STA $bfee ; (sstack + 4)
344f : a5 54 __ LDA T0 + 1 
3451 : 8d ef bf STA $bfef ; (sstack + 5)
3454 : a5 55 __ LDA T1 + 0 
3456 : 8d f0 bf STA $bff0 ; (sstack + 6)
3459 : a5 56 __ LDA T1 + 1 
345b : 8d f1 bf STA $bff1 ; (sstack + 7)
345e : a9 03 __ LDA #$03
3460 : 8d f6 bf STA $bff6 ; (sstack + 12)
3463 : a9 a2 __ LDA #$a2
3465 : 8d ea bf STA $bfea ; (sstack + 0)
3468 : a9 87 __ LDA #$87
346a : 8d eb bf STA $bfeb ; (sstack + 1)
346d : a9 40 __ LDA #$40
346f : 8d ec bf STA $bfec ; (sstack + 2)
3472 : a9 80 __ LDA #$80
3474 : 8d ed bf STA $bfed ; (sstack + 3)
3477 : 38 __ __ SEC
3478 : a5 57 __ LDA T2 + 0 
347a : e5 59 __ SBC T3 + 0 
347c : 8d f2 bf STA $bff2 ; (sstack + 8)
347f : a5 58 __ LDA T2 + 1 
3481 : e5 5a __ SBC T3 + 1 
3483 : 8d f3 bf STA $bff3 ; (sstack + 9)
3486 : 38 __ __ SEC
3487 : a5 5b __ LDA T4 + 0 
3489 : e5 69 __ SBC T15 + 0 
348b : 8d f4 bf STA $bff4 ; (sstack + 10)
348e : a5 5c __ LDA T4 + 1 
3490 : e5 6a __ SBC T15 + 1 
3492 : 8d f5 bf STA $bff5 ; (sstack + 11)
3495 : 20 89 37 JSR $3789 ; (bm_line.s1 + 0)
.s8:
3498 : a9 03 __ LDA #$03
349a : 8d f6 bf STA $bff6 ; (sstack + 12)
349d : a9 a2 __ LDA #$a2
349f : 8d ea bf STA $bfea ; (sstack + 0)
34a2 : a9 87 __ LDA #$87
34a4 : 8d eb bf STA $bfeb ; (sstack + 1)
34a7 : a9 40 __ LDA #$40
34a9 : 8d ec bf STA $bfec ; (sstack + 2)
34ac : a9 80 __ LDA #$80
34ae : 8d ed bf STA $bfed ; (sstack + 3)
34b1 : 38 __ __ SEC
34b2 : a5 57 __ LDA T2 + 0 
34b4 : e5 59 __ SBC T3 + 0 
34b6 : 8d ee bf STA $bfee ; (sstack + 4)
34b9 : a5 58 __ LDA T2 + 1 
34bb : e5 5a __ SBC T3 + 1 
34bd : 8d ef bf STA $bfef ; (sstack + 5)
34c0 : 38 __ __ SEC
34c1 : a5 5b __ LDA T4 + 0 
34c3 : e5 69 __ SBC T15 + 0 
34c5 : 8d f0 bf STA $bff0 ; (sstack + 6)
34c8 : a5 5c __ LDA T4 + 1 
34ca : e5 6a __ SBC T15 + 1 
34cc : 8d f1 bf STA $bff1 ; (sstack + 7)
34cf : 38 __ __ SEC
34d0 : a5 6d __ LDA T17 + 0 
34d2 : e5 59 __ SBC T3 + 0 
34d4 : 85 53 __ STA T0 + 0 
34d6 : 8d f2 bf STA $bff2 ; (sstack + 8)
34d9 : a5 6e __ LDA T17 + 1 
34db : e5 5a __ SBC T3 + 1 
34dd : 85 54 __ STA T0 + 1 
34df : 8d f3 bf STA $bff3 ; (sstack + 9)
34e2 : 38 __ __ SEC
34e3 : a5 6b __ LDA T16 + 0 
34e5 : e5 69 __ SBC T15 + 0 
34e7 : 85 6f __ STA T19 + 0 
34e9 : 8d f4 bf STA $bff4 ; (sstack + 10)
34ec : a5 6c __ LDA T16 + 1 
34ee : e5 6a __ SBC T15 + 1 
34f0 : 85 70 __ STA T19 + 1 
34f2 : 8d f5 bf STA $bff5 ; (sstack + 11)
34f5 : 20 89 37 JSR $3789 ; (bm_line.s1 + 0)
34f8 : a9 a2 __ LDA #$a2
34fa : 8d ea bf STA $bfea ; (sstack + 0)
34fd : a9 87 __ LDA #$87
34ff : 8d eb bf STA $bfeb ; (sstack + 1)
3502 : a9 40 __ LDA #$40
3504 : 8d ec bf STA $bfec ; (sstack + 2)
3507 : a9 80 __ LDA #$80
3509 : 8d ed bf STA $bfed ; (sstack + 3)
350c : a5 53 __ LDA T0 + 0 
350e : 8d ee bf STA $bfee ; (sstack + 4)
3511 : a5 54 __ LDA T0 + 1 
3513 : 8d ef bf STA $bfef ; (sstack + 5)
3516 : a5 6f __ LDA T19 + 0 
3518 : 8d f0 bf STA $bff0 ; (sstack + 6)
351b : a5 70 __ LDA T19 + 1 
351d : 8d f1 bf STA $bff1 ; (sstack + 7)
3520 : a9 03 __ LDA #$03
3522 : 8d f6 bf STA $bff6 ; (sstack + 12)
3525 : 18 __ __ CLC
3526 : a5 6d __ LDA T17 + 0 
3528 : 65 59 __ ADC T3 + 0 
352a : 85 53 __ STA T0 + 0 
352c : 8d f2 bf STA $bff2 ; (sstack + 8)
352f : a5 6e __ LDA T17 + 1 
3531 : 65 5a __ ADC T3 + 1 
3533 : 85 54 __ STA T0 + 1 
3535 : 8d f3 bf STA $bff3 ; (sstack + 9)
3538 : 18 __ __ CLC
3539 : a5 6b __ LDA T16 + 0 
353b : 65 69 __ ADC T15 + 0 
353d : 85 6b __ STA T16 + 0 
353f : 8d f4 bf STA $bff4 ; (sstack + 10)
3542 : a5 6c __ LDA T16 + 1 
3544 : 65 6a __ ADC T15 + 1 
3546 : 85 6c __ STA T16 + 1 
3548 : 8d f5 bf STA $bff5 ; (sstack + 11)
354b : 20 89 37 JSR $3789 ; (bm_line.s1 + 0)
354e : a9 03 __ LDA #$03
3550 : 8d f6 bf STA $bff6 ; (sstack + 12)
3553 : 18 __ __ CLC
3554 : a5 5b __ LDA T4 + 0 
3556 : 65 69 __ ADC T15 + 0 
3558 : 85 5b __ STA T4 + 0 
355a : 8d f4 bf STA $bff4 ; (sstack + 10)
355d : a5 5c __ LDA T4 + 1 
355f : 65 6a __ ADC T15 + 1 
3561 : 85 5c __ STA T4 + 1 
3563 : 8d f5 bf STA $bff5 ; (sstack + 11)
3566 : 18 __ __ CLC
3567 : a5 57 __ LDA T2 + 0 
3569 : 65 59 __ ADC T3 + 0 
356b : 85 57 __ STA T2 + 0 
356d : 8d f2 bf STA $bff2 ; (sstack + 8)
3570 : a5 58 __ LDA T2 + 1 
3572 : 65 5a __ ADC T3 + 1 
3574 : 85 58 __ STA T2 + 1 
3576 : 8d f3 bf STA $bff3 ; (sstack + 9)
3579 : a9 a2 __ LDA #$a2
357b : 8d ea bf STA $bfea ; (sstack + 0)
357e : a9 87 __ LDA #$87
3580 : 8d eb bf STA $bfeb ; (sstack + 1)
3583 : a9 40 __ LDA #$40
3585 : 8d ec bf STA $bfec ; (sstack + 2)
3588 : a9 80 __ LDA #$80
358a : 8d ed bf STA $bfed ; (sstack + 3)
358d : a5 53 __ LDA T0 + 0 
358f : 8d ee bf STA $bfee ; (sstack + 4)
3592 : a5 54 __ LDA T0 + 1 
3594 : 8d ef bf STA $bfef ; (sstack + 5)
3597 : a5 6b __ LDA T16 + 0 
3599 : 8d f0 bf STA $bff0 ; (sstack + 6)
359c : a5 6c __ LDA T16 + 1 
359e : 8d f1 bf STA $bff1 ; (sstack + 7)
35a1 : 20 89 37 JSR $3789 ; (bm_line.s1 + 0)
35a4 : a9 a2 __ LDA #$a2
35a6 : 8d ea bf STA $bfea ; (sstack + 0)
35a9 : a9 87 __ LDA #$87
35ab : 8d eb bf STA $bfeb ; (sstack + 1)
35ae : a9 40 __ LDA #$40
35b0 : 8d ec bf STA $bfec ; (sstack + 2)
35b3 : a9 80 __ LDA #$80
35b5 : 8d ed bf STA $bfed ; (sstack + 3)
35b8 : a5 57 __ LDA T2 + 0 
35ba : 8d ee bf STA $bfee ; (sstack + 4)
35bd : a5 58 __ LDA T2 + 1 
35bf : 8d ef bf STA $bfef ; (sstack + 5)
35c2 : a5 5b __ LDA T4 + 0 
35c4 : 8d f0 bf STA $bff0 ; (sstack + 6)
35c7 : a5 5c __ LDA T4 + 1 
35c9 : 8d f1 bf STA $bff1 ; (sstack + 7)
35cc : a9 03 __ LDA #$03
35ce : 8d f6 bf STA $bff6 ; (sstack + 12)
35d1 : 18 __ __ CLC
35d2 : a5 61 __ LDA T9 + 0 
35d4 : 65 68 __ ADC T14 + 0 
35d6 : 29 3f __ AND #$3f
35d8 : 85 53 __ STA T0 + 0 
35da : 18 __ __ CLC
35db : 69 10 __ ADC #$10
35dd : 29 3f __ AND #$3f
35df : aa __ __ TAX
35e0 : bd 00 80 LDA $8000,x ; (sin64[0] + 0)
35e3 : 85 1b __ STA ACCU + 0 
35e5 : 29 80 __ AND #$80
35e7 : 10 02 __ BPL $35eb ; (draw_gear.s8 + 339)
35e9 : a9 ff __ LDA #$ff
35eb : 85 1c __ STA ACCU + 1 
35ed : a5 5e __ LDA T6 + 0 
35ef : 20 62 77 JSR $7762 ; (mul16by8 + 0)
35f2 : 20 3e 7c JSR $7c3e ; (divs16@proxy + 0)
35f5 : 18 __ __ CLC
35f6 : a5 1b __ LDA ACCU + 0 
35f8 : 65 67 __ ADC T13 + 0 
35fa : 85 57 __ STA T2 + 0 
35fc : 8d f2 bf STA $bff2 ; (sstack + 8)
35ff : a5 1c __ LDA ACCU + 1 
3601 : 69 00 __ ADC #$00
3603 : 85 58 __ STA T2 + 1 
3605 : 8d f3 bf STA $bff3 ; (sstack + 9)
3608 : a6 53 __ LDX T0 + 0 
360a : bd 00 80 LDA $8000,x ; (sin64[0] + 0)
360d : 85 1b __ STA ACCU + 0 
360f : 29 80 __ AND #$80
3611 : 10 02 __ BPL $3615 ; (draw_gear.s8 + 381)
3613 : a9 ff __ LDA #$ff
3615 : 85 1c __ STA ACCU + 1 
3617 : a5 5e __ LDA T6 + 0 
3619 : 20 62 77 JSR $7762 ; (mul16by8 + 0)
361c : 20 3e 7c JSR $7c3e ; (divs16@proxy + 0)
361f : 18 __ __ CLC
3620 : a5 1b __ LDA ACCU + 0 
3622 : 69 58 __ ADC #$58
3624 : 85 59 __ STA T3 + 0 
3626 : 8d f4 bf STA $bff4 ; (sstack + 10)
3629 : a5 1c __ LDA ACCU + 1 
362b : 69 00 __ ADC #$00
362d : 85 5a __ STA T3 + 1 
362f : 8d f5 bf STA $bff5 ; (sstack + 11)
3632 : 20 89 37 JSR $3789 ; (bm_line.s1 + 0)
3635 : a5 57 __ LDA T2 + 0 
3637 : 85 53 __ STA T0 + 0 
3639 : a5 58 __ LDA T2 + 1 
363b : 85 54 __ STA T0 + 1 
363d : a5 59 __ LDA T3 + 0 
363f : 85 55 __ STA T1 + 0 
3641 : a5 5a __ LDA T3 + 1 
3643 : 85 56 __ STA T1 + 1 
3645 : e6 62 __ INC T10 + 0 
3647 : a5 62 __ LDA T10 + 0 
3649 : c5 73 __ CMP T22 + 0 
364b : b0 03 __ BCS $3650 ; (draw_gear.s9 + 0)
364d : 4c 32 33 JMP $3332 ; (draw_gear.l5 + 0)
.s9:
3650 : a5 57 __ LDA T2 + 0 
3652 : 8d ee bf STA $bfee ; (sstack + 4)
3655 : a5 58 __ LDA T2 + 1 
3657 : 8d ef bf STA $bfef ; (sstack + 5)
365a : a5 59 __ LDA T3 + 0 
365c : 8d f0 bf STA $bff0 ; (sstack + 6)
365f : a5 5a __ LDA T3 + 1 
3661 : 8d f1 bf STA $bff1 ; (sstack + 7)
3664 : a5 63 __ LDA T11 + 0 
3666 : 8d f2 bf STA $bff2 ; (sstack + 8)
3669 : a5 64 __ LDA T11 + 1 
366b : 8d f3 bf STA $bff3 ; (sstack + 9)
366e : a5 65 __ LDA T12 + 0 
3670 : 8d f4 bf STA $bff4 ; (sstack + 10)
3673 : a5 66 __ LDA T12 + 1 
3675 : 8d f5 bf STA $bff5 ; (sstack + 11)
3678 : a9 03 __ LDA #$03
367a : 8d f6 bf STA $bff6 ; (sstack + 12)
367d : a9 a2 __ LDA #$a2
367f : 8d ea bf STA $bfea ; (sstack + 0)
3682 : a9 87 __ LDA #$87
3684 : 8d eb bf STA $bfeb ; (sstack + 1)
3687 : a9 40 __ LDA #$40
3689 : 8d ec bf STA $bfec ; (sstack + 2)
368c : a9 80 __ LDA #$80
368e : 8d ed bf STA $bfed ; (sstack + 3)
3691 : 20 89 37 JSR $3789 ; (bm_line.s1 + 0)
3694 : a5 71 __ LDA T20 + 0 
3696 : 85 03 __ STA WORK + 0 
3698 : 85 62 __ STA T10 + 0 
369a : a9 00 __ LDA #$00
369c : 85 5d __ STA T5 + 0 
369e : 85 1c __ STA ACCU + 1 
36a0 : 85 04 __ STA WORK + 1 
36a2 : a9 40 __ LDA #$40
36a4 : 85 1b __ STA ACCU + 0 
36a6 : 20 4d 78 JSR $784d ; (divmod + 0)
36a9 : a5 1b __ LDA ACCU + 0 
36ab : 85 59 __ STA T3 + 0 
.l10:
36ad : a9 a2 __ LDA #$a2
36af : 8d ea bf STA $bfea ; (sstack + 0)
36b2 : a9 87 __ LDA #$87
36b4 : 8d eb bf STA $bfeb ; (sstack + 1)
36b7 : a9 40 __ LDA #$40
36b9 : 8d ec bf STA $bfec ; (sstack + 2)
36bc : a9 80 __ LDA #$80
36be : 8d ed bf STA $bfed ; (sstack + 3)
36c1 : a9 03 __ LDA #$03
36c3 : 8d f6 bf STA $bff6 ; (sstack + 12)
36c6 : a5 5d __ LDA T5 + 0 
36c8 : 85 1b __ STA ACCU + 0 
36ca : a9 00 __ LDA #$00
36cc : 85 1c __ STA ACCU + 1 
36ce : a5 59 __ LDA T3 + 0 
36d0 : 20 62 77 JSR $7762 ; (mul16by8 + 0)
36d3 : 18 __ __ CLC
36d4 : a5 1b __ LDA ACCU + 0 
36d6 : 65 5f __ ADC T7 + 0 
36d8 : 29 3f __ AND #$3f
36da : 85 53 __ STA T0 + 0 
36dc : 18 __ __ CLC
36dd : 69 10 __ ADC #$10
36df : 29 3f __ AND #$3f
36e1 : aa __ __ TAX
36e2 : bd 00 80 LDA $8000,x ; (sin64[0] + 0)
36e5 : 85 55 __ STA T1 + 0 
36e7 : 85 1b __ STA ACCU + 0 
36e9 : 29 80 __ AND #$80
36eb : 10 02 __ BPL $36ef ; (draw_gear.l10 + 66)
36ed : a9 ff __ LDA #$ff
36ef : 85 56 __ STA T1 + 1 
36f1 : 85 1c __ STA ACCU + 1 
36f3 : a5 72 __ LDA T21 + 0 
36f5 : 20 62 77 JSR $7762 ; (mul16by8 + 0)
36f8 : 20 3e 7c JSR $7c3e ; (divs16@proxy + 0)
36fb : 18 __ __ CLC
36fc : a5 1b __ LDA ACCU + 0 
36fe : 65 67 __ ADC T13 + 0 
3700 : 8d ee bf STA $bfee ; (sstack + 4)
3703 : a5 1c __ LDA ACCU + 1 
3705 : 69 00 __ ADC #$00
3707 : 8d ef bf STA $bfef ; (sstack + 5)
370a : a6 53 __ LDX T0 + 0 
370c : bd 00 80 LDA $8000,x ; (sin64[0] + 0)
370f : 85 53 __ STA T0 + 0 
3711 : 85 1b __ STA ACCU + 0 
3713 : 29 80 __ AND #$80
3715 : 10 02 __ BPL $3719 ; (draw_gear.l10 + 108)
3717 : a9 ff __ LDA #$ff
3719 : 85 54 __ STA T0 + 1 
371b : 85 1c __ STA ACCU + 1 
371d : a5 72 __ LDA T21 + 0 
371f : 20 62 77 JSR $7762 ; (mul16by8 + 0)
3722 : 20 3e 7c JSR $7c3e ; (divs16@proxy + 0)
3725 : 18 __ __ CLC
3726 : a5 1b __ LDA ACCU + 0 
3728 : 69 58 __ ADC #$58
372a : 8d f0 bf STA $bff0 ; (sstack + 6)
372d : a5 1c __ LDA ACCU + 1 
372f : 69 00 __ ADC #$00
3731 : 8d f1 bf STA $bff1 ; (sstack + 7)
3734 : a5 55 __ LDA T1 + 0 
3736 : 85 1b __ STA ACCU + 0 
3738 : a5 56 __ LDA T1 + 1 
373a : 85 1c __ STA ACCU + 1 
373c : a5 5e __ LDA T6 + 0 
373e : 20 62 77 JSR $7762 ; (mul16by8 + 0)
3741 : 20 3e 7c JSR $7c3e ; (divs16@proxy + 0)
3744 : 18 __ __ CLC
3745 : a5 1b __ LDA ACCU + 0 
3747 : 65 67 __ ADC T13 + 0 
3749 : 8d f2 bf STA $bff2 ; (sstack + 8)
374c : a5 1c __ LDA ACCU + 1 
374e : 69 00 __ ADC #$00
3750 : 8d f3 bf STA $bff3 ; (sstack + 9)
3753 : a5 53 __ LDA T0 + 0 
3755 : 85 1b __ STA ACCU + 0 
3757 : a5 54 __ LDA T0 + 1 
3759 : 85 1c __ STA ACCU + 1 
375b : a5 5e __ LDA T6 + 0 
375d : 20 62 77 JSR $7762 ; (mul16by8 + 0)
3760 : 20 3e 7c JSR $7c3e ; (divs16@proxy + 0)
3763 : 18 __ __ CLC
3764 : a5 1b __ LDA ACCU + 0 
3766 : 69 58 __ ADC #$58
3768 : 8d f4 bf STA $bff4 ; (sstack + 10)
376b : a5 1c __ LDA ACCU + 1 
376d : 69 00 __ ADC #$00
376f : 8d f5 bf STA $bff5 ; (sstack + 11)
3772 : 20 89 37 JSR $3789 ; (bm_line.s1 + 0)
3775 : e6 5d __ INC T5 + 0 
3777 : c6 62 __ DEC T10 + 0 
3779 : f0 03 __ BEQ $377e ; (draw_gear.s3 + 0)
377b : 4c ad 36 JMP $36ad ; (draw_gear.l10 + 0)
.s3:
377e : a2 20 __ LDX #$20
3780 : bd b0 bf LDA $bfb0,x ; (draw_gear@stack + 0)
3783 : 95 53 __ STA T0 + 0,x 
3785 : ca __ __ DEX
3786 : 10 f8 __ BPL $3780 ; (draw_gear.s3 + 2)
3788 : 60 __ __ RTS
--------------------------------------------------------------------
bm_line: ; bm_line(const struct Bitmap*,const struct ClipRect*,i16,i16,i16,i16,u8,enum LineOp)->void
; 116, "/home/xahmol/oscar64/include/gfx/bitmap.h"
.s1:
3789 : a2 0e __ LDX #$0e
378b : b5 53 __ LDA T2 + 0,x 
378d : 9d db bf STA $bfdb,x ; (bm_line@stack + 0)
3790 : ca __ __ DEX
3791 : 10 f8 __ BPL $378b ; (bm_line.s1 + 2)
.s4:
3793 : ad f0 bf LDA $bff0 ; (sstack + 6)
3796 : 85 55 __ STA T3 + 0 
3798 : ad f1 bf LDA $bff1 ; (sstack + 7)
379b : 85 56 __ STA T3 + 1 
379d : ad f4 bf LDA $bff4 ; (sstack + 10)
37a0 : 85 53 __ STA T2 + 0 
37a2 : 38 __ __ SEC
37a3 : e5 55 __ SBC T3 + 0 
37a5 : 85 57 __ STA T4 + 0 
37a7 : ad f5 bf LDA $bff5 ; (sstack + 11)
37aa : 85 54 __ STA T2 + 1 
37ac : e5 56 __ SBC T3 + 1 
37ae : 85 58 __ STA T4 + 1 
37b0 : ad f6 bf LDA $bff6 ; (sstack + 12)
37b3 : 85 61 __ STA T10 + 0 
37b5 : ad ec bf LDA $bfec ; (sstack + 2)
37b8 : 85 59 __ STA T5 + 0 
37ba : ad ed bf LDA $bfed ; (sstack + 3)
37bd : 85 5a __ STA T5 + 1 
37bf : a0 00 __ LDY #$00
37c1 : b1 59 __ LDA (T5 + 0),y 
37c3 : 85 43 __ STA T0 + 0 
37c5 : c8 __ __ INY
37c6 : b1 59 __ LDA (T5 + 0),y 
37c8 : 85 44 __ STA T0 + 1 
37ca : a0 04 __ LDY #$04
37cc : b1 59 __ LDA (T5 + 0),y 
37ce : 85 45 __ STA T1 + 0 
37d0 : ad ee bf LDA $bfee ; (sstack + 4)
37d3 : 85 5d __ STA T7 + 0 
37d5 : ad ef bf LDA $bfef ; (sstack + 5)
37d8 : 85 5e __ STA T7 + 1 
37da : ad f2 bf LDA $bff2 ; (sstack + 8)
37dd : 85 5b __ STA T6 + 0 
37df : 38 __ __ SEC
37e0 : e5 5d __ SBC T7 + 0 
37e2 : 85 5f __ STA T8 + 0 
37e4 : ad f3 bf LDA $bff3 ; (sstack + 9)
37e7 : 85 5c __ STA T6 + 1 
37e9 : c8 __ __ INY
37ea : e5 5e __ SBC T7 + 1 
37ec : 85 60 __ STA T8 + 1 
37ee : 30 07 __ BMI $37f7 ; (bm_line.s5 + 0)
.s82:
37f0 : 05 5f __ ORA T8 + 0 
37f2 : f0 03 __ BEQ $37f7 ; (bm_line.s5 + 0)
37f4 : 4c 21 3b JMP $3b21 ; (bm_line.s64 + 0)
.s5:
37f7 : a5 5e __ LDA T7 + 1 
37f9 : 10 03 __ BPL $37fe ; (bm_line.s63 + 0)
37fb : 4c 6d 39 JMP $396d ; (bm_line.s3 + 0)
.s63:
37fe : c5 44 __ CMP T0 + 1 
3800 : d0 04 __ BNE $3806 ; (bm_line.s62 + 0)
.s61:
3802 : a5 5d __ LDA T7 + 0 
3804 : c5 43 __ CMP T0 + 0 
.s62:
3806 : 90 f3 __ BCC $37fb ; (bm_line.s5 + 4)
.s6:
3808 : a5 5c __ LDA T6 + 1 
380a : 10 03 __ BPL $380f ; (bm_line.s60 + 0)
380c : 4c ca 3a JMP $3aca ; (bm_line.s52 + 0)
.s60:
380f : d1 59 __ CMP (T5 + 0),y 
3811 : d0 04 __ BNE $3817 ; (bm_line.s59 + 0)
.s58:
3813 : a5 5b __ LDA T6 + 0 
3815 : c5 45 __ CMP T1 + 0 
.s59:
3817 : b0 e2 __ BCS $37fb ; (bm_line.s5 + 4)
.s7:
3819 : a5 5c __ LDA T6 + 1 
381b : c5 44 __ CMP T0 + 1 
381d : d0 04 __ BNE $3823 ; (bm_line.s57 + 0)
.s56:
381f : a5 5b __ LDA T6 + 0 
3821 : c5 43 __ CMP T0 + 0 
.s57:
3823 : 90 e7 __ BCC $380c ; (bm_line.s6 + 4)
.s8:
3825 : a5 5e __ LDA T7 + 1 
3827 : d1 59 __ CMP (T5 + 0),y 
3829 : d0 04 __ BNE $382f ; (bm_line.s54 + 0)
.s51:
382b : a5 5d __ LDA T7 + 0 
382d : c5 45 __ CMP T1 + 0 
.s54:
382f : 90 4e __ BCC $387f ; (bm_line.s9 + 0)
.s50:
3831 : a5 57 __ LDA T4 + 0 
3833 : 85 0f __ STA P2 
3835 : a5 58 __ LDA T4 + 1 
3837 : 85 10 __ STA P3 
3839 : a5 5f __ LDA T8 + 0 
383b : 85 11 __ STA P4 
383d : a5 60 __ LDA T8 + 1 
383f : 85 12 __ STA P5 
3841 : 18 __ __ CLC
3842 : a5 5d __ LDA T7 + 0 
3844 : 69 01 __ ADC #$01
3846 : a8 __ __ TAY
3847 : a5 5e __ LDA T7 + 1 
3849 : 69 00 __ ADC #$00
384b : aa __ __ TAX
384c : 98 __ __ TYA
384d : 38 __ __ SEC
384e : a0 04 __ LDY #$04
3850 : f1 59 __ SBC (T5 + 0),y 
3852 : 85 0d __ STA P0 
3854 : 8a __ __ TXA
3855 : c8 __ __ INY
3856 : f1 59 __ SBC (T5 + 0),y 
3858 : 85 0e __ STA P1 
385a : 20 03 3c JSR $3c03 ; (lmuldiv16s.s4 + 0)
385d : 38 __ __ SEC
385e : a5 55 __ LDA T3 + 0 
3860 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
3862 : 8d f0 bf STA $bff0 ; (sstack + 6)
3865 : a5 56 __ LDA T3 + 1 
3867 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
3869 : 8d f1 bf STA $bff1 ; (sstack + 7)
386c : a0 04 __ LDY #$04
386e : b1 59 __ LDA (T5 + 0),y 
3870 : 38 __ __ SEC
3871 : e9 01 __ SBC #$01
3873 : aa __ __ TAX
3874 : c8 __ __ INY
3875 : b1 59 __ LDA (T5 + 0),y 
3877 : 8e ee bf STX $bfee ; (sstack + 4)
387a : e9 00 __ SBC #$00
387c : 8d ef bf STA $bfef ; (sstack + 5)
.s9:
387f : a0 02 __ LDY #$02
3881 : b1 59 __ LDA (T5 + 0),y 
3883 : 85 43 __ STA T0 + 0 
3885 : c8 __ __ INY
3886 : b1 59 __ LDA (T5 + 0),y 
3888 : 85 44 __ STA T0 + 1 
388a : a0 06 __ LDY #$06
388c : b1 59 __ LDA (T5 + 0),y 
388e : 85 45 __ STA T1 + 0 
3890 : c8 __ __ INY
3891 : a5 58 __ LDA T4 + 1 
3893 : 30 07 __ BMI $389c ; (bm_line.s10 + 0)
.s49:
3895 : 05 57 __ ORA T4 + 0 
3897 : f0 03 __ BEQ $389c ; (bm_line.s10 + 0)
3899 : 4c d2 39 JMP $39d2 ; (bm_line.s30 + 0)
.s10:
389c : ad f0 bf LDA $bff0 ; (sstack + 6)
389f : 85 55 __ STA T3 + 0 
38a1 : ad f1 bf LDA $bff1 ; (sstack + 7)
38a4 : 10 03 __ BPL $38a9 ; (bm_line.s29 + 0)
38a6 : 4c 6d 39 JMP $396d ; (bm_line.s3 + 0)
.s29:
38a9 : 85 56 __ STA T3 + 1 
38ab : c5 44 __ CMP T0 + 1 
38ad : d0 04 __ BNE $38b3 ; (bm_line.s28 + 0)
.s27:
38af : a5 55 __ LDA T3 + 0 
38b1 : c5 43 __ CMP T0 + 0 
.s28:
38b3 : 90 f1 __ BCC $38a6 ; (bm_line.s10 + 10)
.s11:
38b5 : ad f5 bf LDA $bff5 ; (sstack + 11)
38b8 : 10 03 __ BPL $38bd ; (bm_line.s26 + 0)
38ba : 4c 78 39 JMP $3978 ; (bm_line.s17 + 0)
.s26:
38bd : d1 59 __ CMP (T5 + 0),y 
38bf : d0 05 __ BNE $38c6 ; (bm_line.s25 + 0)
.s24:
38c1 : ad f4 bf LDA $bff4 ; (sstack + 10)
38c4 : c5 45 __ CMP T1 + 0 
.s25:
38c6 : b0 de __ BCS $38a6 ; (bm_line.s10 + 10)
.s12:
38c8 : ad f5 bf LDA $bff5 ; (sstack + 11)
38cb : 30 ed __ BMI $38ba ; (bm_line.s11 + 5)
.s23:
38cd : c5 44 __ CMP T0 + 1 
38cf : d0 05 __ BNE $38d6 ; (bm_line.s22 + 0)
.s21:
38d1 : ad f4 bf LDA $bff4 ; (sstack + 10)
38d4 : c5 43 __ CMP T0 + 0 
.s22:
38d6 : 90 e2 __ BCC $38ba ; (bm_line.s11 + 5)
.s13:
38d8 : a5 56 __ LDA T3 + 1 
38da : d1 59 __ CMP (T5 + 0),y 
38dc : d0 04 __ BNE $38e2 ; (bm_line.s19 + 0)
.s16:
38de : a5 55 __ LDA T3 + 0 
38e0 : c5 45 __ CMP T1 + 0 
.s19:
38e2 : 90 50 __ BCC $3934 ; (bm_line.s14 + 0)
.s15:
38e4 : a5 5f __ LDA T8 + 0 
38e6 : 85 0f __ STA P2 
38e8 : a5 60 __ LDA T8 + 1 
38ea : 85 10 __ STA P3 
38ec : a5 57 __ LDA T4 + 0 
38ee : 85 11 __ STA P4 
38f0 : a5 58 __ LDA T4 + 1 
38f2 : 85 12 __ STA P5 
38f4 : 18 __ __ CLC
38f5 : a5 55 __ LDA T3 + 0 
38f7 : 69 01 __ ADC #$01
38f9 : a8 __ __ TAY
38fa : a5 56 __ LDA T3 + 1 
38fc : 69 00 __ ADC #$00
38fe : aa __ __ TAX
38ff : 98 __ __ TYA
3900 : 38 __ __ SEC
3901 : a0 06 __ LDY #$06
3903 : f1 59 __ SBC (T5 + 0),y 
3905 : 85 0d __ STA P0 
3907 : 8a __ __ TXA
3908 : c8 __ __ INY
3909 : f1 59 __ SBC (T5 + 0),y 
390b : 85 0e __ STA P1 
390d : 20 03 3c JSR $3c03 ; (lmuldiv16s.s4 + 0)
3910 : ad ee bf LDA $bfee ; (sstack + 4)
3913 : 38 __ __ SEC
3914 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
3916 : 8d ee bf STA $bfee ; (sstack + 4)
3919 : ad ef bf LDA $bfef ; (sstack + 5)
391c : e5 1c __ SBC ACCU + 1 ; (clip + 1)
391e : 8d ef bf STA $bfef ; (sstack + 5)
3921 : a0 06 __ LDY #$06
3923 : b1 59 __ LDA (T5 + 0),y 
3925 : 38 __ __ SEC
3926 : e9 01 __ SBC #$01
3928 : aa __ __ TAX
3929 : c8 __ __ INY
392a : b1 59 __ LDA (T5 + 0),y 
392c : 8e f0 bf STX $bff0 ; (sstack + 6)
392f : e9 00 __ SBC #$00
3931 : 8d f1 bf STA $bff1 ; (sstack + 7)
.s14:
3934 : ad ea bf LDA $bfea ; (sstack + 0)
3937 : 85 0d __ STA P0 
3939 : ad eb bf LDA $bfeb ; (sstack + 1)
393c : 85 0e __ STA P1 
393e : ad ee bf LDA $bfee ; (sstack + 4)
3941 : 85 0f __ STA P2 
3943 : ad ef bf LDA $bfef ; (sstack + 5)
3946 : 85 10 __ STA P3 
3948 : ad f0 bf LDA $bff0 ; (sstack + 6)
394b : 85 11 __ STA P4 
394d : ad f1 bf LDA $bff1 ; (sstack + 7)
3950 : 85 12 __ STA P5 
3952 : ad f2 bf LDA $bff2 ; (sstack + 8)
3955 : 85 13 __ STA P6 
3957 : ad f3 bf LDA $bff3 ; (sstack + 9)
395a : 85 14 __ STA P7 
395c : ad f4 bf LDA $bff4 ; (sstack + 10)
395f : 85 15 __ STA P8 
3961 : ad f5 bf LDA $bff5 ; (sstack + 11)
3964 : 85 16 __ STA P9 
3966 : a5 61 __ LDA T10 + 0 
3968 : 85 18 __ STA P11 
396a : 20 c2 3c JSR $3cc2 ; (bmu_line.s4 + 0)
.s3:
396d : a2 0e __ LDX #$0e
396f : bd db bf LDA $bfdb,x ; (bm_line@stack + 0)
3972 : 95 53 __ STA T2 + 0,x 
3974 : ca __ __ DEX
3975 : 10 f8 __ BPL $396f ; (bm_line.s3 + 2)
3977 : 60 __ __ RTS
.s17:
3978 : a5 5f __ LDA T8 + 0 
397a : 85 0f __ STA P2 
397c : a5 60 __ LDA T8 + 1 
397e : 85 10 __ STA P3 
3980 : a5 57 __ LDA T4 + 0 
3982 : 85 11 __ STA P4 
3984 : a5 58 __ LDA T4 + 1 
3986 : 85 12 __ STA P5 
3988 : 38 __ __ SEC
3989 : a5 43 __ LDA T0 + 0 
398b : ed f4 bf SBC $bff4 ; (sstack + 10)
398e : 85 0d __ STA P0 
3990 : a5 44 __ LDA T0 + 1 
3992 : ed f5 bf SBC $bff5 ; (sstack + 11)
3995 : 85 0e __ STA P1 
3997 : 20 03 3c JSR $3c03 ; (lmuldiv16s.s4 + 0)
399a : a0 02 __ LDY #$02
399c : b1 59 __ LDA (T5 + 0),y 
399e : 8d f4 bf STA $bff4 ; (sstack + 10)
39a1 : c8 __ __ INY
39a2 : b1 59 __ LDA (T5 + 0),y 
39a4 : 8d f5 bf STA $bff5 ; (sstack + 11)
39a7 : ad f2 bf LDA $bff2 ; (sstack + 8)
39aa : 18 __ __ CLC
39ab : 65 1b __ ADC ACCU + 0 ; (clip + 0)
39ad : 8d f2 bf STA $bff2 ; (sstack + 8)
39b0 : ad f3 bf LDA $bff3 ; (sstack + 9)
39b3 : 65 1c __ ADC ACCU + 1 ; (clip + 1)
39b5 : 8d f3 bf STA $bff3 ; (sstack + 9)
39b8 : a0 07 __ LDY #$07
39ba : b1 59 __ LDA (T5 + 0),y 
39bc : 10 03 __ BPL $39c1 ; (bm_line.s20 + 0)
39be : 4c e4 38 JMP $38e4 ; (bm_line.s15 + 0)
.s20:
39c1 : a5 56 __ LDA T3 + 1 
39c3 : d1 59 __ CMP (T5 + 0),y 
39c5 : f0 03 __ BEQ $39ca ; (bm_line.s18 + 0)
39c7 : 4c e2 38 JMP $38e2 ; (bm_line.s19 + 0)
.s18:
39ca : a5 55 __ LDA T3 + 0 
39cc : 88 __ __ DEY
39cd : d1 59 __ CMP (T5 + 0),y 
39cf : 4c e2 38 JMP $38e2 ; (bm_line.s19 + 0)
.s30:
39d2 : ad f4 bf LDA $bff4 ; (sstack + 10)
39d5 : 85 55 __ STA T3 + 0 
39d7 : ad f5 bf LDA $bff5 ; (sstack + 11)
39da : 30 91 __ BMI $396d ; (bm_line.s3 + 0)
.s48:
39dc : 85 56 __ STA T3 + 1 
39de : c5 44 __ CMP T0 + 1 
39e0 : d0 04 __ BNE $39e6 ; (bm_line.s47 + 0)
.s46:
39e2 : a5 55 __ LDA T3 + 0 
39e4 : c5 43 __ CMP T0 + 0 
.s47:
39e6 : 90 85 __ BCC $396d ; (bm_line.s3 + 0)
.s31:
39e8 : ad f1 bf LDA $bff1 ; (sstack + 7)
39eb : 10 03 __ BPL $39f0 ; (bm_line.s45 + 0)
39ed : 4c 70 3a JMP $3a70 ; (bm_line.s36 + 0)
.s45:
39f0 : d1 59 __ CMP (T5 + 0),y 
39f2 : d0 05 __ BNE $39f9 ; (bm_line.s44 + 0)
.s43:
39f4 : ad f0 bf LDA $bff0 ; (sstack + 6)
39f7 : c5 45 __ CMP T1 + 0 
.s44:
39f9 : 90 03 __ BCC $39fe ; (bm_line.s32 + 0)
39fb : 4c 6d 39 JMP $396d ; (bm_line.s3 + 0)
.s32:
39fe : ad f1 bf LDA $bff1 ; (sstack + 7)
3a01 : 30 6d __ BMI $3a70 ; (bm_line.s36 + 0)
.s42:
3a03 : c5 44 __ CMP T0 + 1 
3a05 : d0 05 __ BNE $3a0c ; (bm_line.s41 + 0)
.s40:
3a07 : ad f0 bf LDA $bff0 ; (sstack + 6)
3a0a : c5 43 __ CMP T0 + 0 
.s41:
3a0c : 90 62 __ BCC $3a70 ; (bm_line.s36 + 0)
.s33:
3a0e : a5 56 __ LDA T3 + 1 
3a10 : d1 59 __ CMP (T5 + 0),y 
3a12 : d0 04 __ BNE $3a18 ; (bm_line.s38 + 0)
.s35:
3a14 : a5 55 __ LDA T3 + 0 
3a16 : c5 45 __ CMP T1 + 0 
.s38:
3a18 : b0 03 __ BCS $3a1d ; (bm_line.s34 + 0)
3a1a : 4c 34 39 JMP $3934 ; (bm_line.s14 + 0)
.s34:
3a1d : a5 5f __ LDA T8 + 0 
3a1f : 85 0f __ STA P2 
3a21 : a5 60 __ LDA T8 + 1 
3a23 : 85 10 __ STA P3 
3a25 : a5 57 __ LDA T4 + 0 
3a27 : 85 11 __ STA P4 
3a29 : a5 58 __ LDA T4 + 1 
3a2b : 85 12 __ STA P5 
3a2d : 18 __ __ CLC
3a2e : a5 55 __ LDA T3 + 0 
3a30 : 69 01 __ ADC #$01
3a32 : a8 __ __ TAY
3a33 : a5 56 __ LDA T3 + 1 
3a35 : 69 00 __ ADC #$00
3a37 : aa __ __ TAX
3a38 : 98 __ __ TYA
3a39 : 38 __ __ SEC
3a3a : a0 06 __ LDY #$06
3a3c : f1 59 __ SBC (T5 + 0),y 
3a3e : 85 0d __ STA P0 
3a40 : 8a __ __ TXA
3a41 : c8 __ __ INY
3a42 : f1 59 __ SBC (T5 + 0),y 
3a44 : 85 0e __ STA P1 
3a46 : 20 03 3c JSR $3c03 ; (lmuldiv16s.s4 + 0)
3a49 : ad f2 bf LDA $bff2 ; (sstack + 8)
3a4c : 38 __ __ SEC
3a4d : e5 1b __ SBC ACCU + 0 ; (clip + 0)
3a4f : 8d f2 bf STA $bff2 ; (sstack + 8)
3a52 : ad f3 bf LDA $bff3 ; (sstack + 9)
3a55 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
3a57 : 8d f3 bf STA $bff3 ; (sstack + 9)
3a5a : a0 06 __ LDY #$06
3a5c : b1 59 __ LDA (T5 + 0),y 
3a5e : 38 __ __ SEC
3a5f : e9 01 __ SBC #$01
3a61 : aa __ __ TAX
3a62 : c8 __ __ INY
3a63 : b1 59 __ LDA (T5 + 0),y 
3a65 : 8e f4 bf STX $bff4 ; (sstack + 10)
3a68 : e9 00 __ SBC #$00
3a6a : 8d f5 bf STA $bff5 ; (sstack + 11)
3a6d : 4c 34 39 JMP $3934 ; (bm_line.s14 + 0)
.s36:
3a70 : a5 5f __ LDA T8 + 0 
3a72 : 85 0f __ STA P2 
3a74 : a5 60 __ LDA T8 + 1 
3a76 : 85 10 __ STA P3 
3a78 : a5 57 __ LDA T4 + 0 
3a7a : 85 11 __ STA P4 
3a7c : a5 58 __ LDA T4 + 1 
3a7e : 85 12 __ STA P5 
3a80 : 38 __ __ SEC
3a81 : a5 43 __ LDA T0 + 0 
3a83 : ed f0 bf SBC $bff0 ; (sstack + 6)
3a86 : 85 0d __ STA P0 
3a88 : a5 44 __ LDA T0 + 1 
3a8a : ed f1 bf SBC $bff1 ; (sstack + 7)
3a8d : 85 0e __ STA P1 
3a8f : 20 03 3c JSR $3c03 ; (lmuldiv16s.s4 + 0)
3a92 : a0 02 __ LDY #$02
3a94 : b1 59 __ LDA (T5 + 0),y 
3a96 : 8d f0 bf STA $bff0 ; (sstack + 6)
3a99 : c8 __ __ INY
3a9a : b1 59 __ LDA (T5 + 0),y 
3a9c : 8d f1 bf STA $bff1 ; (sstack + 7)
3a9f : ad ee bf LDA $bfee ; (sstack + 4)
3aa2 : 18 __ __ CLC
3aa3 : 65 1b __ ADC ACCU + 0 ; (clip + 0)
3aa5 : 8d ee bf STA $bfee ; (sstack + 4)
3aa8 : ad ef bf LDA $bfef ; (sstack + 5)
3aab : 65 1c __ ADC ACCU + 1 ; (clip + 1)
3aad : 8d ef bf STA $bfef ; (sstack + 5)
3ab0 : a0 07 __ LDY #$07
3ab2 : b1 59 __ LDA (T5 + 0),y 
3ab4 : 10 03 __ BPL $3ab9 ; (bm_line.s39 + 0)
3ab6 : 4c 1d 3a JMP $3a1d ; (bm_line.s34 + 0)
.s39:
3ab9 : a5 56 __ LDA T3 + 1 
3abb : d1 59 __ CMP (T5 + 0),y 
3abd : f0 03 __ BEQ $3ac2 ; (bm_line.s37 + 0)
3abf : 4c 18 3a JMP $3a18 ; (bm_line.s38 + 0)
.s37:
3ac2 : a5 55 __ LDA T3 + 0 
3ac4 : 88 __ __ DEY
3ac5 : d1 59 __ CMP (T5 + 0),y 
3ac7 : 4c 18 3a JMP $3a18 ; (bm_line.s38 + 0)
.s52:
3aca : a5 57 __ LDA T4 + 0 
3acc : 85 0f __ STA P2 
3ace : a5 58 __ LDA T4 + 1 
3ad0 : 85 10 __ STA P3 
3ad2 : a5 5f __ LDA T8 + 0 
3ad4 : 85 11 __ STA P4 
3ad6 : a5 60 __ LDA T8 + 1 
3ad8 : 85 12 __ STA P5 
3ada : 38 __ __ SEC
3adb : a5 43 __ LDA T0 + 0 
3add : e5 5b __ SBC T6 + 0 
3adf : 85 0d __ STA P0 
3ae1 : a5 44 __ LDA T0 + 1 
3ae3 : e5 5c __ SBC T6 + 1 
3ae5 : 85 0e __ STA P1 
3ae7 : 20 03 3c JSR $3c03 ; (lmuldiv16s.s4 + 0)
3aea : 18 __ __ CLC
3aeb : a5 1b __ LDA ACCU + 0 ; (clip + 0)
3aed : 65 53 __ ADC T2 + 0 
3aef : aa __ __ TAX
3af0 : a0 00 __ LDY #$00
3af2 : b1 59 __ LDA (T5 + 0),y 
3af4 : 8d f2 bf STA $bff2 ; (sstack + 8)
3af7 : c8 __ __ INY
3af8 : b1 59 __ LDA (T5 + 0),y 
3afa : 8e f4 bf STX $bff4 ; (sstack + 10)
3afd : 8d f3 bf STA $bff3 ; (sstack + 9)
3b00 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
3b02 : 65 54 __ ADC T2 + 1 
3b04 : 8d f5 bf STA $bff5 ; (sstack + 11)
3b07 : a0 05 __ LDY #$05
3b09 : b1 59 __ LDA (T5 + 0),y 
3b0b : 10 03 __ BPL $3b10 ; (bm_line.s55 + 0)
3b0d : 4c 31 38 JMP $3831 ; (bm_line.s50 + 0)
.s55:
3b10 : a5 5e __ LDA T7 + 1 
3b12 : d1 59 __ CMP (T5 + 0),y 
3b14 : f0 03 __ BEQ $3b19 ; (bm_line.s53 + 0)
3b16 : 4c 2f 38 JMP $382f ; (bm_line.s54 + 0)
.s53:
3b19 : a5 5d __ LDA T7 + 0 
3b1b : 88 __ __ DEY
3b1c : d1 59 __ CMP (T5 + 0),y 
3b1e : 4c 2f 38 JMP $382f ; (bm_line.s54 + 0)
.s64:
3b21 : a5 5c __ LDA T6 + 1 
3b23 : 10 03 __ BPL $3b28 ; (bm_line.s81 + 0)
3b25 : 4c 6d 39 JMP $396d ; (bm_line.s3 + 0)
.s81:
3b28 : c5 44 __ CMP T0 + 1 
3b2a : d0 04 __ BNE $3b30 ; (bm_line.s80 + 0)
.s79:
3b2c : a5 5b __ LDA T6 + 0 
3b2e : c5 43 __ CMP T0 + 0 
.s80:
3b30 : 90 f3 __ BCC $3b25 ; (bm_line.s64 + 4)
.s65:
3b32 : a5 5e __ LDA T7 + 1 
3b34 : 30 76 __ BMI $3bac ; (bm_line.s70 + 0)
.s78:
3b36 : d1 59 __ CMP (T5 + 0),y 
3b38 : d0 04 __ BNE $3b3e ; (bm_line.s77 + 0)
.s76:
3b3a : a5 5d __ LDA T7 + 0 
3b3c : c5 45 __ CMP T1 + 0 
.s77:
3b3e : b0 e5 __ BCS $3b25 ; (bm_line.s64 + 4)
.s66:
3b40 : a5 5e __ LDA T7 + 1 
3b42 : c5 44 __ CMP T0 + 1 
3b44 : d0 04 __ BNE $3b4a ; (bm_line.s75 + 0)
.s74:
3b46 : a5 5d __ LDA T7 + 0 
3b48 : c5 43 __ CMP T0 + 0 
.s75:
3b4a : 90 60 __ BCC $3bac ; (bm_line.s70 + 0)
.s67:
3b4c : a5 5c __ LDA T6 + 1 
3b4e : d1 59 __ CMP (T5 + 0),y 
3b50 : d0 04 __ BNE $3b56 ; (bm_line.s72 + 0)
.s69:
3b52 : a5 5b __ LDA T6 + 0 
3b54 : c5 45 __ CMP T1 + 0 
.s72:
3b56 : b0 03 __ BCS $3b5b ; (bm_line.s68 + 0)
3b58 : 4c 7f 38 JMP $387f ; (bm_line.s9 + 0)
.s68:
3b5b : a5 57 __ LDA T4 + 0 
3b5d : 85 0f __ STA P2 
3b5f : a5 58 __ LDA T4 + 1 
3b61 : 85 10 __ STA P3 
3b63 : a5 5f __ LDA T8 + 0 
3b65 : 85 11 __ STA P4 
3b67 : a5 60 __ LDA T8 + 1 
3b69 : 85 12 __ STA P5 
3b6b : 18 __ __ CLC
3b6c : a5 5b __ LDA T6 + 0 
3b6e : 69 01 __ ADC #$01
3b70 : a8 __ __ TAY
3b71 : a5 5c __ LDA T6 + 1 
3b73 : 69 00 __ ADC #$00
3b75 : aa __ __ TAX
3b76 : 98 __ __ TYA
3b77 : 38 __ __ SEC
3b78 : a0 04 __ LDY #$04
3b7a : f1 59 __ SBC (T5 + 0),y 
3b7c : 85 0d __ STA P0 
3b7e : 8a __ __ TXA
3b7f : c8 __ __ INY
3b80 : f1 59 __ SBC (T5 + 0),y 
3b82 : 85 0e __ STA P1 
3b84 : 20 03 3c JSR $3c03 ; (lmuldiv16s.s4 + 0)
3b87 : 38 __ __ SEC
3b88 : a5 53 __ LDA T2 + 0 
3b8a : e5 1b __ SBC ACCU + 0 ; (clip + 0)
3b8c : 8d f4 bf STA $bff4 ; (sstack + 10)
3b8f : a5 54 __ LDA T2 + 1 
3b91 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
3b93 : 8d f5 bf STA $bff5 ; (sstack + 11)
3b96 : a0 04 __ LDY #$04
3b98 : b1 59 __ LDA (T5 + 0),y 
3b9a : 38 __ __ SEC
3b9b : e9 01 __ SBC #$01
3b9d : aa __ __ TAX
3b9e : c8 __ __ INY
3b9f : b1 59 __ LDA (T5 + 0),y 
3ba1 : 8e f2 bf STX $bff2 ; (sstack + 8)
3ba4 : e9 00 __ SBC #$00
3ba6 : 8d f3 bf STA $bff3 ; (sstack + 9)
3ba9 : 4c 7f 38 JMP $387f ; (bm_line.s9 + 0)
.s70:
3bac : a5 57 __ LDA T4 + 0 
3bae : 85 0f __ STA P2 
3bb0 : a5 58 __ LDA T4 + 1 
3bb2 : 85 10 __ STA P3 
3bb4 : a5 5f __ LDA T8 + 0 
3bb6 : 85 11 __ STA P4 
3bb8 : a5 60 __ LDA T8 + 1 
3bba : 85 12 __ STA P5 
3bbc : 38 __ __ SEC
3bbd : a5 43 __ LDA T0 + 0 
3bbf : e5 5d __ SBC T7 + 0 
3bc1 : 85 0d __ STA P0 
3bc3 : a5 44 __ LDA T0 + 1 
3bc5 : e5 5e __ SBC T7 + 1 
3bc7 : 85 0e __ STA P1 
3bc9 : 20 03 3c JSR $3c03 ; (lmuldiv16s.s4 + 0)
3bcc : 18 __ __ CLC
3bcd : a5 1b __ LDA ACCU + 0 ; (clip + 0)
3bcf : 65 55 __ ADC T3 + 0 
3bd1 : aa __ __ TAX
3bd2 : a0 00 __ LDY #$00
3bd4 : b1 59 __ LDA (T5 + 0),y 
3bd6 : 8d ee bf STA $bfee ; (sstack + 4)
3bd9 : c8 __ __ INY
3bda : b1 59 __ LDA (T5 + 0),y 
3bdc : 8e f0 bf STX $bff0 ; (sstack + 6)
3bdf : 8d ef bf STA $bfef ; (sstack + 5)
3be2 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
3be4 : 65 56 __ ADC T3 + 1 
3be6 : 8d f1 bf STA $bff1 ; (sstack + 7)
3be9 : a0 05 __ LDY #$05
3beb : b1 59 __ LDA (T5 + 0),y 
3bed : 10 03 __ BPL $3bf2 ; (bm_line.s73 + 0)
3bef : 4c 5b 3b JMP $3b5b ; (bm_line.s68 + 0)
.s73:
3bf2 : a5 5c __ LDA T6 + 1 
3bf4 : d1 59 __ CMP (T5 + 0),y 
3bf6 : f0 03 __ BEQ $3bfb ; (bm_line.s71 + 0)
3bf8 : 4c 56 3b JMP $3b56 ; (bm_line.s72 + 0)
.s71:
3bfb : a5 5b __ LDA T6 + 0 
3bfd : 88 __ __ DEY
3bfe : d1 59 __ CMP (T5 + 0),y 
3c00 : 4c 56 3b JMP $3b56 ; (bm_line.s72 + 0)
--------------------------------------------------------------------
lmuldiv16s: ; lmuldiv16s(i16,i16,i16)->i16
;  42, "/home/xahmol/oscar64/include/fixmath.h"
.s4:
3c03 : a9 00 __ LDA #$00
3c05 : 24 0e __ BIT P1 ; (a + 1)
3c07 : 10 0d __ BPL $3c16 ; (lmuldiv16s.s5 + 0)
.s10:
3c09 : 38 __ __ SEC
3c0a : e5 0d __ SBC P0 ; (a + 0)
3c0c : 85 0d __ STA P0 ; (a + 0)
3c0e : a9 00 __ LDA #$00
3c10 : e5 0e __ SBC P1 ; (a + 1)
3c12 : 85 0e __ STA P1 ; (a + 1)
3c14 : a9 01 __ LDA #$01
.s5:
3c16 : 85 43 __ STA T1 + 0 
3c18 : 24 10 __ BIT P3 ; (b + 1)
3c1a : 10 14 __ BPL $3c30 ; (lmuldiv16s.s6 + 0)
.s9:
3c1c : 38 __ __ SEC
3c1d : a9 00 __ LDA #$00
3c1f : e5 0f __ SBC P2 ; (b + 0)
3c21 : 85 0f __ STA P2 ; (b + 0)
3c23 : a9 00 __ LDA #$00
3c25 : e5 10 __ SBC P3 ; (b + 1)
3c27 : 85 10 __ STA P3 ; (b + 1)
3c29 : a9 00 __ LDA #$00
3c2b : c5 43 __ CMP T1 + 0 
3c2d : 2a __ __ ROL
3c2e : 85 43 __ STA T1 + 0 
.s6:
3c30 : 24 12 __ BIT P5 ; (c + 1)
3c32 : 10 14 __ BPL $3c48 ; (lmuldiv16s.s7 + 0)
.s8:
3c34 : 38 __ __ SEC
3c35 : a9 00 __ LDA #$00
3c37 : e5 11 __ SBC P4 ; (c + 0)
3c39 : 85 11 __ STA P4 ; (c + 0)
3c3b : a9 00 __ LDA #$00
3c3d : e5 12 __ SBC P5 ; (c + 1)
3c3f : 85 12 __ STA P5 ; (c + 1)
3c41 : a9 00 __ LDA #$00
3c43 : c5 43 __ CMP T1 + 0 
3c45 : 2a __ __ ROL
3c46 : 85 43 __ STA T1 + 0 
.s7:
3c48 : a9 00 __ LDA #$00
3c4a : 85 05 __ STA WORK + 2 
3c4c : 85 06 __ STA WORK + 3 
3c4e : a5 0d __ LDA P0 ; (a + 0)
3c50 : 38 __ __ SEC
3c51 : a0 08 __ LDY #$08
3c53 : 6a __ __ ROR
3c54 : 90 0f __ BCC $3c65 ; (lmuldiv16s.s7 + 29)
3c56 : aa __ __ TAX
3c57 : 18 __ __ CLC
3c58 : a5 05 __ LDA WORK + 2 
3c5a : 65 0f __ ADC P2 ; (b + 0)
3c5c : 85 05 __ STA WORK + 2 
3c5e : a5 06 __ LDA WORK + 3 
3c60 : 65 10 __ ADC P3 ; (b + 1)
3c62 : 85 06 __ STA WORK + 3 
3c64 : 8a __ __ TXA
3c65 : 66 06 __ ROR WORK + 3 
3c67 : 66 05 __ ROR WORK + 2 
3c69 : 88 __ __ DEY
3c6a : d0 e7 __ BNE $3c53 ; (lmuldiv16s.s7 + 11)
3c6c : 6a __ __ ROR
3c6d : 90 07 __ BCC $3c76 ; (lmuldiv16s.s7 + 46)
3c6f : 85 03 __ STA WORK + 0 
3c71 : a5 0e __ LDA P1 ; (a + 1)
3c73 : 18 __ __ CLC
3c74 : 90 db __ BCC $3c51 ; (lmuldiv16s.s7 + 9)
3c76 : 38 __ __ SEC
3c77 : 85 04 __ STA WORK + 1 
3c79 : a2 08 __ LDX #$08
3c7b : 26 04 __ ROL WORK + 1 
3c7d : 26 05 __ ROL WORK + 2 
3c7f : 26 06 __ ROL WORK + 3 
3c81 : 90 0c __ BCC $3c8f ; (lmuldiv16s.s7 + 71)
3c83 : a5 05 __ LDA WORK + 2 
3c85 : e5 11 __ SBC P4 ; (c + 0)
3c87 : a8 __ __ TAY
3c88 : a5 06 __ LDA WORK + 3 
3c8a : e5 12 __ SBC P5 ; (c + 1)
3c8c : 38 __ __ SEC
3c8d : b0 0c __ BCS $3c9b ; (lmuldiv16s.s7 + 83)
3c8f : 38 __ __ SEC
3c90 : a5 05 __ LDA WORK + 2 
3c92 : e5 11 __ SBC P4 ; (c + 0)
3c94 : a8 __ __ TAY
3c95 : a5 06 __ LDA WORK + 3 
3c97 : e5 12 __ SBC P5 ; (c + 1)
3c99 : 90 04 __ BCC $3c9f ; (lmuldiv16s.s7 + 87)
3c9b : 85 06 __ STA WORK + 3 
3c9d : 84 05 __ STY WORK + 2 
3c9f : ca __ __ DEX
3ca0 : d0 d9 __ BNE $3c7b ; (lmuldiv16s.s7 + 51)
3ca2 : a5 04 __ LDA WORK + 1 
3ca4 : 2a __ __ ROL
3ca5 : 90 07 __ BCC $3cae ; (lmuldiv16s.s7 + 102)
3ca7 : 85 1c __ STA ACCU + 1 
3ca9 : a5 03 __ LDA WORK + 0 
3cab : 18 __ __ CLC
3cac : 90 c9 __ BCC $3c77 ; (lmuldiv16s.s7 + 47)
3cae : 85 1b __ STA ACCU + 0 
3cb0 : a5 43 __ LDA T1 + 0 
3cb2 : f0 0d __ BEQ $3cc1 ; (lmuldiv16s.s3 + 0)
3cb4 : 38 __ __ SEC
3cb5 : a9 00 __ LDA #$00
3cb7 : e5 1b __ SBC ACCU + 0 
3cb9 : 85 1b __ STA ACCU + 0 
3cbb : a9 00 __ LDA #$00
3cbd : e5 1c __ SBC ACCU + 1 
3cbf : 85 1c __ STA ACCU + 1 
.s3:
3cc1 : 60 __ __ RTS
--------------------------------------------------------------------
bmu_line: ; bmu_line(const struct Bitmap*,i16,i16,i16,i16,u8,enum LineOp)->void
; 113, "/home/xahmol/oscar64/include/gfx/bitmap.h"
.s4:
3cc2 : a5 18 __ LDA P11 ; (op + 0)
3cc4 : d0 02 __ BNE $3cc8 ; (bmu_line.s6 + 0)
.s5:
3cc6 : e6 18 __ INC P11 ; (op + 0)
.s6:
3cc8 : 38 __ __ SEC
3cc9 : a5 13 __ LDA P6 ; (x1 + 0)
3ccb : e5 0f __ SBC P2 ; (x0 + 0)
3ccd : 85 46 __ STA T2 + 0 
3ccf : a5 14 __ LDA P7 ; (x1 + 1)
3cd1 : e5 10 __ SBC P3 ; (x0 + 1)
3cd3 : 85 47 __ STA T2 + 1 
3cd5 : 10 11 __ BPL $3ce8 ; (bmu_line.s7 + 0)
.s52:
3cd7 : 38 __ __ SEC
3cd8 : a9 00 __ LDA #$00
3cda : e5 46 __ SBC T2 + 0 
3cdc : 85 46 __ STA T2 + 0 
3cde : a9 00 __ LDA #$00
3ce0 : e5 47 __ SBC T2 + 1 
3ce2 : 85 47 __ STA T2 + 1 
3ce4 : a9 01 __ LDA #$01
3ce6 : d0 02 __ BNE $3cea ; (bmu_line.s8 + 0)
.s7:
3ce8 : a9 00 __ LDA #$00
.s8:
3cea : 85 51 __ STA T11 + 0 
3cec : 38 __ __ SEC
3ced : a5 15 __ LDA P8 ; (y1 + 0)
3cef : e5 11 __ SBC P4 ; (y0 + 0)
3cf1 : 85 43 __ STA T0 + 0 
3cf3 : a5 16 __ LDA P9 ; (y1 + 1)
3cf5 : e5 12 __ SBC P5 ; (y0 + 1)
3cf7 : 85 44 __ STA T0 + 1 
3cf9 : 10 11 __ BPL $3d0c ; (bmu_line.s9 + 0)
.s51:
3cfb : 38 __ __ SEC
3cfc : a9 00 __ LDA #$00
3cfe : e5 43 __ SBC T0 + 0 
3d00 : 85 43 __ STA T0 + 0 
3d02 : a9 00 __ LDA #$00
3d04 : e5 44 __ SBC T0 + 1 
3d06 : 85 44 __ STA T0 + 1 
3d08 : a9 01 __ LDA #$01
3d0a : d0 02 __ BNE $3d0e ; (bmu_line.s10 + 0)
.s9:
3d0c : a9 00 __ LDA #$00
.s10:
3d0e : 85 52 __ STA T12 + 0 
3d10 : a5 44 __ LDA T0 + 1 
3d12 : c5 47 __ CMP T2 + 1 
3d14 : d0 04 __ BNE $3d1a ; (bmu_line.s50 + 0)
.s49:
3d16 : a5 43 __ LDA T0 + 0 
3d18 : c5 46 __ CMP T2 + 0 
.s50:
3d1a : b0 06 __ BCS $3d22 ; (bmu_line.s11 + 0)
.s48:
3d1c : a5 47 __ LDA T2 + 1 
3d1e : a6 46 __ LDX T2 + 0 
3d20 : 90 04 __ BCC $3d26 ; (bmu_line.s12 + 0)
.s11:
3d22 : a5 44 __ LDA T0 + 1 
3d24 : a6 43 __ LDX T0 + 0 
.s12:
3d26 : 86 48 __ STX T4 + 0 
3d28 : 85 49 __ STA T4 + 1 
3d2a : 38 __ __ SEC
3d2b : a5 43 __ LDA T0 + 0 
3d2d : e5 46 __ SBC T2 + 0 
3d2f : 85 4a __ STA T5 + 0 
3d31 : a5 44 __ LDA T0 + 1 
3d33 : e5 47 __ SBC T2 + 1 
3d35 : 85 4b __ STA T5 + 1 
3d37 : a5 4a __ LDA T5 + 0 
3d39 : 4a __ __ LSR
3d3a : b0 0c __ BCS $3d48 ; (bmu_line.s47 + 0)
.s13:
3d3c : a5 4b __ LDA T5 + 1 
3d3e : c9 80 __ CMP #$80
3d40 : 6a __ __ ROR
3d41 : 85 4b __ STA T5 + 1 
3d43 : 66 4a __ ROR T5 + 0 
3d45 : 4c 50 3d JMP $3d50 ; (bmu_line.s14 + 0)
.s47:
3d48 : 06 43 __ ASL T0 + 0 
3d4a : 26 44 __ ROL T0 + 1 
3d4c : 06 46 __ ASL T2 + 0 
3d4e : 26 47 __ ROL T2 + 1 
.s14:
3d50 : a0 00 __ LDY #$00
3d52 : b1 0d __ LDA (P0),y ; (bm + 0)
3d54 : 85 4d __ STA T7 + 0 
3d56 : c8 __ __ INY
3d57 : b1 0d __ LDA (P0),y ; (bm + 0)
3d59 : 85 4e __ STA T7 + 1 
3d5b : a0 04 __ LDY #$04
3d5d : b1 0d __ LDA (P0),y ; (bm + 0)
3d5f : aa __ __ TAX
3d60 : 0a __ __ ASL
3d61 : 85 4f __ STA T8 + 0 
3d63 : a9 a0 __ LDA #$a0
3d65 : 8d 00 a0 STA $a000 ; (BLIT_CODE[0] + 0)
3d68 : a9 a2 __ LDA #$a2
3d6a : 8d 02 a0 STA $a002 ; (BLIT_CODE[0] + 2)
3d6d : a9 a5 __ LDA #$a5
3d6f : 8d 04 a0 STA $a004 ; (BLIT_CODE[0] + 4)
3d72 : a9 0a __ LDA #$0a
3d74 : 8d 05 a0 STA $a005 ; (BLIT_CODE[0] + 5)
3d77 : a9 00 __ LDA #$00
3d79 : 2a __ __ ROL
3d7a : 06 4f __ ASL T8 + 0 
3d7c : 2a __ __ ROL
3d7d : 06 4f __ ASL T8 + 0 
3d7f : 2a __ __ ROL
3d80 : 85 50 __ STA T8 + 1 
3d82 : a5 52 __ LDA T12 + 0 
3d84 : f0 0d __ BEQ $3d93 ; (bmu_line.s15 + 0)
.s46:
3d86 : 38 __ __ SEC
3d87 : a9 00 __ LDA #$00
3d89 : e5 4f __ SBC T8 + 0 
3d8b : 85 4f __ STA T8 + 0 
3d8d : a9 00 __ LDA #$00
3d8f : e5 50 __ SBC T8 + 1 
3d91 : 85 50 __ STA T8 + 1 
.s15:
3d93 : a5 11 __ LDA P4 ; (y0 + 0)
3d95 : 29 f8 __ AND #$f8
3d97 : 85 1b __ STA ACCU + 0 
3d99 : a5 12 __ LDA P5 ; (y0 + 1)
3d9b : 85 1c __ STA ACCU + 1 
3d9d : 8a __ __ TXA
3d9e : 20 62 77 JSR $7762 ; (mul16by8 + 0)
3da1 : 18 __ __ CLC
3da2 : a5 4d __ LDA T7 + 0 
3da4 : 65 1b __ ADC ACCU + 0 
3da6 : 85 4d __ STA T7 + 0 
3da8 : a5 4e __ LDA T7 + 1 
3daa : 65 1c __ ADC ACCU + 1 
3dac : aa __ __ TAX
3dad : a5 0f __ LDA P2 ; (x0 + 0)
3daf : 29 f8 __ AND #$f8
3db1 : 18 __ __ CLC
3db2 : 65 4d __ ADC T7 + 0 
3db4 : 85 4d __ STA T7 + 0 
3db6 : 8a __ __ TXA
3db7 : 65 10 __ ADC P3 ; (x0 + 1)
3db9 : 85 4e __ STA T7 + 1 
3dbb : a5 46 __ LDA T2 + 0 
3dbd : 05 43 __ ORA T0 + 0 
3dbf : 29 80 __ AND #$80
3dc1 : 85 4c __ STA T6 + 0 
3dc3 : a5 47 __ LDA T2 + 1 
3dc5 : 05 44 __ ORA T0 + 1 
3dc7 : 05 4c __ ORA T6 + 0 
3dc9 : f0 02 __ BEQ $3dcd ; (bmu_line.s56 + 0)
.s55:
3dcb : a9 01 __ LDA #$01
.s56:
3dcd : 85 1c __ STA ACCU + 1 
3dcf : a5 11 __ LDA P4 ; (y0 + 0)
3dd1 : 29 07 __ AND #$07
3dd3 : 8d 01 a0 STA $a001 ; (BLIT_CODE[0] + 1)
3dd6 : a6 48 __ LDX T4 + 0 
3dd8 : e8 __ __ INX
3dd9 : 8e 03 a0 STX $a003 ; (BLIT_CODE[0] + 3)
3ddc : a5 0f __ LDA P2 ; (x0 + 0)
3dde : 29 07 __ AND #$07
3de0 : aa __ __ TAX
3de1 : a5 18 __ LDA P11 ; (op + 0)
3de3 : c9 02 __ CMP #$02
3de5 : d0 20 __ BNE $3e07 ; (bmu_line.s16 + 0)
.s45:
3de7 : a9 49 __ LDA #$49
3de9 : 8d 06 a0 STA $a006 ; (BLIT_CODE[0] + 6)
3dec : a9 ff __ LDA #$ff
3dee : 8d 07 a0 STA $a007 ; (BLIT_CODE[0] + 7)
3df1 : a9 31 __ LDA #$31
3df3 : 8d 08 a0 STA $a008 ; (BLIT_CODE[0] + 8)
3df6 : a9 03 __ LDA #$03
3df8 : 8d 09 a0 STA $a009 ; (BLIT_CODE[0] + 9)
3dfb : 8d 0b a0 STA $a00b ; (BLIT_CODE[0] + 11)
3dfe : a9 91 __ LDA #$91
3e00 : 8d 0a a0 STA $a00a ; (BLIT_CODE[0] + 10)
3e03 : a9 0c __ LDA #$0c
3e05 : d0 21 __ BNE $3e28 ; (bmu_line.s19 + 0)
.s16:
3e07 : b0 03 __ BCS $3e0c ; (bmu_line.s17 + 0)
3e09 : 4c f4 40 JMP $40f4 ; (bmu_line.s42 + 0)
.s17:
3e0c : c9 03 __ CMP #$03
3e0e : f0 04 __ BEQ $3e14 ; (bmu_line.s40 + 0)
.s18:
3e10 : a9 06 __ LDA #$06
3e12 : d0 14 __ BNE $3e28 ; (bmu_line.s19 + 0)
.s40:
3e14 : a9 51 __ LDA #$51
.s41:
3e16 : 8d 06 a0 STA $a006 ; (BLIT_CODE[0] + 6)
3e19 : a9 03 __ LDA #$03
3e1b : 8d 07 a0 STA $a007 ; (BLIT_CODE[0] + 7)
3e1e : 8d 09 a0 STA $a009 ; (BLIT_CODE[0] + 9)
3e21 : a9 91 __ LDA #$91
3e23 : 8d 08 a0 STA $a008 ; (BLIT_CODE[0] + 8)
3e26 : a9 0a __ LDA #$0a
.s19:
3e28 : 85 45 __ STA T1 + 0 
3e2a : a5 43 __ LDA T0 + 0 
3e2c : 05 44 __ ORA T0 + 1 
3e2e : f0 03 __ BEQ $3e33 ; (bmu_line.s20 + 0)
3e30 : 4c 02 3f JMP $3f02 ; (bmu_line.s28 + 0)
.s20:
3e33 : a5 46 __ LDA T2 + 0 
3e35 : 05 47 __ ORA T2 + 1 
3e37 : f0 75 __ BEQ $3eae ; (bmu_line.s21 + 0)
.s22:
3e39 : a9 0a __ LDA #$0a
3e3b : a4 45 __ LDY T1 + 0 
3e3d : 99 01 a0 STA $a001,y ; (BLIT_CODE[0] + 1)
3e40 : 99 05 a0 STA $a005,y ; (BLIT_CODE[0] + 5)
3e43 : a9 90 __ LDA #$90
3e45 : 99 02 a0 STA $a002,y ; (BLIT_CODE[0] + 2)
3e48 : a9 0c __ LDA #$0c
3e4a : 99 03 a0 STA $a003,y ; (BLIT_CODE[0] + 3)
3e4d : a9 a5 __ LDA #$a5
3e4f : 99 06 a0 STA $a006,y ; (BLIT_CODE[0] + 6)
3e52 : a9 03 __ LDA #$03
3e54 : 99 07 a0 STA $a007,y ; (BLIT_CODE[0] + 7)
3e57 : a9 69 __ LDA #$69
3e59 : 99 08 a0 STA $a008,y ; (BLIT_CODE[0] + 8)
3e5c : a5 51 __ LDA T11 + 0 
3e5e : f0 09 __ BEQ $3e69 ; (bmu_line.s23 + 0)
.s27:
3e60 : a9 06 __ LDA #$06
3e62 : 99 00 a0 STA $a000,y ; (BLIT_CODE[0] + 0)
3e65 : a9 26 __ LDA #$26
3e67 : d0 07 __ BNE $3e70 ; (bmu_line.s53 + 0)
.s23:
3e69 : a9 46 __ LDA #$46
3e6b : 99 00 a0 STA $a000,y ; (BLIT_CODE[0] + 0)
3e6e : a9 66 __ LDA #$66
.s53:
3e70 : 99 04 a0 STA $a004,y ; (BLIT_CODE[0] + 4)
3e73 : a9 02 __ LDA #$02
3e75 : 99 0b a0 STA $a00b,y ; (BLIT_CODE[0] + 11)
3e78 : a5 51 __ LDA T11 + 0 
3e7a : f0 0e __ BEQ $3e8a ; (bmu_line.s24 + 0)
.s26:
3e7c : a9 f8 __ LDA #$f8
3e7e : 99 09 a0 STA $a009,y ; (BLIT_CODE[0] + 9)
3e81 : a9 b0 __ LDA #$b0
3e83 : 99 0a a0 STA $a00a,y ; (BLIT_CODE[0] + 10)
3e86 : a9 c6 __ LDA #$c6
3e88 : d0 0c __ BNE $3e96 ; (bmu_line.s25 + 0)
.s24:
3e8a : a9 08 __ LDA #$08
3e8c : 99 09 a0 STA $a009,y ; (BLIT_CODE[0] + 9)
3e8f : a9 90 __ LDA #$90
3e91 : 99 0a a0 STA $a00a,y ; (BLIT_CODE[0] + 10)
3e94 : a9 e6 __ LDA #$e6
.s25:
3e96 : 99 0c a0 STA $a00c,y ; (BLIT_CODE[0] + 12)
3e99 : a9 04 __ LDA #$04
3e9b : 99 0d a0 STA $a00d,y ; (BLIT_CODE[0] + 13)
3e9e : a9 85 __ LDA #$85
3ea0 : 99 0e a0 STA $a00e,y ; (BLIT_CODE[0] + 14)
3ea3 : a9 03 __ LDA #$03
3ea5 : 99 0f a0 STA $a00f,y ; (BLIT_CODE[0] + 15)
3ea8 : 98 __ __ TYA
3ea9 : 18 __ __ CLC
3eaa : 69 10 __ ADC #$10
3eac : 85 45 __ STA T1 + 0 
.s21:
3eae : a9 ca __ LDA #$ca
3eb0 : a4 45 __ LDY T1 + 0 
3eb2 : 84 43 __ STY T0 + 0 
3eb4 : 99 00 a0 STA $a000,y ; (BLIT_CODE[0] + 0)
3eb7 : a9 d0 __ LDA #$d0
3eb9 : 99 01 a0 STA $a001,y ; (BLIT_CODE[0] + 1)
3ebc : a9 c6 __ LDA #$c6
3ebe : 99 03 a0 STA $a003,y ; (BLIT_CODE[0] + 3)
3ec1 : a9 0b __ LDA #$0b
3ec3 : 99 04 a0 STA $a004,y ; (BLIT_CODE[0] + 4)
3ec6 : a9 10 __ LDA #$10
3ec8 : 99 05 a0 STA $a005,y ; (BLIT_CODE[0] + 5)
3ecb : a9 60 __ LDA #$60
3ecd : 99 07 a0 STA $a007,y ; (BLIT_CODE[0] + 7)
3ed0 : e6 43 __ INC T0 + 0 
3ed2 : 38 __ __ SEC
3ed3 : a9 02 __ LDA #$02
3ed5 : e5 43 __ SBC T0 + 0 
3ed7 : 99 02 a0 STA $a002,y ; (BLIT_CODE[0] + 2)
3eda : 38 __ __ SEC
3edb : a9 fe __ LDA #$fe
3edd : e5 43 __ SBC T0 + 0 
3edf : 99 06 a0 STA $a006,y ; (BLIT_CODE[0] + 6)
3ee2 : a5 49 __ LDA T4 + 1 
3ee4 : 85 0b __ STA WORK + 8 
3ee6 : a5 4d __ LDA T7 + 0 
3ee8 : 85 03 __ STA WORK + 0 
3eea : a5 4e __ LDA T7 + 1 
3eec : 85 04 __ STA WORK + 1 
3eee : a5 4a __ LDA T5 + 0 
3ef0 : 85 05 __ STA WORK + 2 
3ef2 : a5 4b __ LDA T5 + 1 
3ef4 : 85 06 __ STA WORK + 3 
3ef6 : bd e8 86 LDA $86e8,x ; (bitshift[0] + 32)
3ef9 : 85 0a __ STA WORK + 7 
3efb : a9 ff __ LDA #$ff
3efd : 85 07 __ STA WORK + 4 
3eff : 4c 00 a0 JMP $a000 ; (BLIT_CODE[0] + 0)
.s28:
3f02 : a5 46 __ LDA T2 + 0 
3f04 : 05 47 __ ORA T2 + 1 
3f06 : c9 01 __ CMP #$01
3f08 : a9 00 __ LDA #$00
3f0a : 6a __ __ ROR
3f0b : 85 1d __ STA ACCU + 2 
3f0d : f0 03 __ BEQ $3f12 ; (bmu_line.s29 + 0)
3f0f : 4c ad 40 JMP $40ad ; (bmu_line.s35 + 0)
.s29:
3f12 : a9 00 __ LDA #$00
3f14 : 85 46 __ STA T2 + 0 
3f16 : 85 47 __ STA T2 + 1 
3f18 : 85 1b __ STA ACCU + 0 
3f1a : a5 52 __ LDA T12 + 0 
3f1c : f0 03 __ BEQ $3f21 ; (bmu_line.s30 + 0)
3f1e : 4c 42 40 JMP $4042 ; (bmu_line.s34 + 0)
.s30:
3f21 : a9 c8 __ LDA #$c8
3f23 : a4 45 __ LDY T1 + 0 
3f25 : 99 00 a0 STA $a000,y ; (BLIT_CODE[0] + 0)
3f28 : a9 c0 __ LDA #$c0
3f2a : 99 01 a0 STA $a001,y ; (BLIT_CODE[0] + 1)
3f2d : a9 08 __ LDA #$08
3f2f : 99 02 a0 STA $a002,y ; (BLIT_CODE[0] + 2)
3f32 : a9 d0 __ LDA #$d0
3f34 : 99 03 a0 STA $a003,y ; (BLIT_CODE[0] + 3)
3f37 : a9 a0 __ LDA #$a0
3f39 : 99 05 a0 STA $a005,y ; (BLIT_CODE[0] + 5)
3f3c : a9 00 __ LDA #$00
3f3e : 99 06 a0 STA $a006,y ; (BLIT_CODE[0] + 6)
3f41 : a9 a5 __ LDA #$a5
3f43 : 99 07 a0 STA $a007,y ; (BLIT_CODE[0] + 7)
3f46 : 99 0d a0 STA $a00d,y ; (BLIT_CODE[0] + 13)
3f49 : a9 03 __ LDA #$03
3f4b : 99 08 a0 STA $a008,y ; (BLIT_CODE[0] + 8)
3f4e : 99 0c a0 STA $a00c,y ; (BLIT_CODE[0] + 12)
3f51 : a9 69 __ LDA #$69
3f53 : 99 09 a0 STA $a009,y ; (BLIT_CODE[0] + 9)
3f56 : 99 0f a0 STA $a00f,y ; (BLIT_CODE[0] + 15)
3f59 : a9 85 __ LDA #$85
3f5b : 99 0b a0 STA $a00b,y ; (BLIT_CODE[0] + 11)
3f5e : 99 11 a0 STA $a011,y ; (BLIT_CODE[0] + 17)
3f61 : a9 04 __ LDA #$04
3f63 : 99 0e a0 STA $a00e,y ; (BLIT_CODE[0] + 14)
3f66 : 99 12 a0 STA $a012,y ; (BLIT_CODE[0] + 18)
3f69 : a5 1b __ LDA ACCU + 0 
3f6b : f0 04 __ BEQ $3f71 ; (bmu_line.s60 + 0)
.s61:
3f6d : a9 10 __ LDA #$10
3f6f : 90 02 __ BCC $3f73 ; (bmu_line.s62 + 0)
.s60:
3f71 : a9 0e __ LDA #$0e
.s62:
3f73 : 99 04 a0 STA $a004,y ; (BLIT_CODE[0] + 4)
3f76 : 38 __ __ SEC
3f77 : a5 4f __ LDA T8 + 0 
3f79 : e9 01 __ SBC #$01
3f7b : 99 0a a0 STA $a00a,y ; (BLIT_CODE[0] + 10)
3f7e : a5 50 __ LDA T8 + 1 
3f80 : e9 00 __ SBC #$00
3f82 : 99 10 a0 STA $a010,y ; (BLIT_CODE[0] + 16)
3f85 : 98 __ __ TYA
3f86 : 18 __ __ CLC
3f87 : 69 13 __ ADC #$13
3f89 : 85 45 __ STA T1 + 0 
3f8b : a8 __ __ TAY
3f8c : 24 1d __ BIT ACCU + 2 
3f8e : 30 03 __ BMI $3f93 ; (bmu_line.s31 + 0)
3f90 : 4c 33 3e JMP $3e33 ; (bmu_line.s20 + 0)
.s31:
3f93 : a9 a5 __ LDA #$a5
3f95 : 99 00 a0 STA $a000,y ; (BLIT_CODE[0] + 0)
3f98 : a9 05 __ LDA #$05
3f9a : 99 01 a0 STA $a001,y ; (BLIT_CODE[0] + 1)
3f9d : 99 06 a0 STA $a006,y ; (BLIT_CODE[0] + 6)
3fa0 : a9 38 __ LDA #$38
3fa2 : 99 02 a0 STA $a002,y ; (BLIT_CODE[0] + 2)
3fa5 : a9 e9 __ LDA #$e9
3fa7 : 99 03 a0 STA $a003,y ; (BLIT_CODE[0] + 3)
3faa : a9 85 __ LDA #$85
3fac : 99 05 a0 STA $a005,y ; (BLIT_CODE[0] + 5)
3faf : a5 46 __ LDA T2 + 0 
3fb1 : 99 04 a0 STA $a004,y ; (BLIT_CODE[0] + 4)
3fb4 : a5 1c __ LDA ACCU + 1 
3fb6 : d0 2a __ BNE $3fe2 ; (bmu_line.s33 + 0)
.s32:
3fb8 : a9 10 __ LDA #$10
3fba : 99 07 a0 STA $a007,y ; (BLIT_CODE[0] + 7)
3fbd : a9 15 __ LDA #$15
3fbf : 99 08 a0 STA $a008,y ; (BLIT_CODE[0] + 8)
3fc2 : a9 18 __ LDA #$18
3fc4 : 99 09 a0 STA $a009,y ; (BLIT_CODE[0] + 9)
3fc7 : a9 69 __ LDA #$69
3fc9 : 99 0a a0 STA $a00a,y ; (BLIT_CODE[0] + 10)
3fcc : a5 43 __ LDA T0 + 0 
3fce : 99 0b a0 STA $a00b,y ; (BLIT_CODE[0] + 11)
3fd1 : a9 85 __ LDA #$85
3fd3 : 99 0c a0 STA $a00c,y ; (BLIT_CODE[0] + 12)
3fd6 : a9 05 __ LDA #$05
3fd8 : 99 0d a0 STA $a00d,y ; (BLIT_CODE[0] + 13)
3fdb : 98 __ __ TYA
3fdc : 18 __ __ CLC
3fdd : 69 0e __ ADC #$0e
3fdf : 4c 3d 40 JMP $403d ; (bmu_line.s54 + 0)
.s33:
3fe2 : a9 a5 __ LDA #$a5
3fe4 : 99 07 a0 STA $a007,y ; (BLIT_CODE[0] + 7)
3fe7 : 99 10 a0 STA $a010,y ; (BLIT_CODE[0] + 16)
3fea : 99 16 a0 STA $a016,y ; (BLIT_CODE[0] + 22)
3fed : a9 06 __ LDA #$06
3fef : 99 08 a0 STA $a008,y ; (BLIT_CODE[0] + 8)
3ff2 : 99 0c a0 STA $a00c,y ; (BLIT_CODE[0] + 12)
3ff5 : 99 17 a0 STA $a017,y ; (BLIT_CODE[0] + 23)
3ff8 : 99 1b a0 STA $a01b,y ; (BLIT_CODE[0] + 27)
3ffb : a9 e9 __ LDA #$e9
3ffd : 99 09 a0 STA $a009,y ; (BLIT_CODE[0] + 9)
4000 : a9 85 __ LDA #$85
4002 : 99 0b a0 STA $a00b,y ; (BLIT_CODE[0] + 11)
4005 : 99 14 a0 STA $a014,y ; (BLIT_CODE[0] + 20)
4008 : 99 1a a0 STA $a01a,y ; (BLIT_CODE[0] + 26)
400b : a9 10 __ LDA #$10
400d : 99 0d a0 STA $a00d,y ; (BLIT_CODE[0] + 13)
4010 : a9 1d __ LDA #$1d
4012 : 99 0e a0 STA $a00e,y ; (BLIT_CODE[0] + 14)
4015 : a9 18 __ LDA #$18
4017 : 99 0f a0 STA $a00f,y ; (BLIT_CODE[0] + 15)
401a : a9 05 __ LDA #$05
401c : 99 11 a0 STA $a011,y ; (BLIT_CODE[0] + 17)
401f : 99 15 a0 STA $a015,y ; (BLIT_CODE[0] + 21)
4022 : a9 69 __ LDA #$69
4024 : 99 12 a0 STA $a012,y ; (BLIT_CODE[0] + 18)
4027 : 99 18 a0 STA $a018,y ; (BLIT_CODE[0] + 24)
402a : a5 43 __ LDA T0 + 0 
402c : 99 13 a0 STA $a013,y ; (BLIT_CODE[0] + 19)
402f : a5 47 __ LDA T2 + 1 
4031 : 99 0a a0 STA $a00a,y ; (BLIT_CODE[0] + 10)
4034 : a5 44 __ LDA T0 + 1 
4036 : 99 19 a0 STA $a019,y ; (BLIT_CODE[0] + 25)
4039 : 98 __ __ TYA
403a : 18 __ __ CLC
403b : 69 1c __ ADC #$1c
.s54:
403d : 85 45 __ STA T1 + 0 
403f : 4c 39 3e JMP $3e39 ; (bmu_line.s22 + 0)
.s34:
4042 : a9 88 __ LDA #$88
4044 : a4 45 __ LDY T1 + 0 
4046 : 99 00 a0 STA $a000,y ; (BLIT_CODE[0] + 0)
4049 : a9 10 __ LDA #$10
404b : 99 01 a0 STA $a001,y ; (BLIT_CODE[0] + 1)
404e : a9 18 __ LDA #$18
4050 : 99 03 a0 STA $a003,y ; (BLIT_CODE[0] + 3)
4053 : a9 a0 __ LDA #$a0
4055 : 99 04 a0 STA $a004,y ; (BLIT_CODE[0] + 4)
4058 : a9 07 __ LDA #$07
405a : 99 05 a0 STA $a005,y ; (BLIT_CODE[0] + 5)
405d : a9 a5 __ LDA #$a5
405f : 99 06 a0 STA $a006,y ; (BLIT_CODE[0] + 6)
4062 : 99 0c a0 STA $a00c,y ; (BLIT_CODE[0] + 12)
4065 : a9 03 __ LDA #$03
4067 : 99 07 a0 STA $a007,y ; (BLIT_CODE[0] + 7)
406a : 99 0b a0 STA $a00b,y ; (BLIT_CODE[0] + 11)
406d : a9 69 __ LDA #$69
406f : 99 08 a0 STA $a008,y ; (BLIT_CODE[0] + 8)
4072 : 99 0e a0 STA $a00e,y ; (BLIT_CODE[0] + 14)
4075 : a9 85 __ LDA #$85
4077 : 99 0a a0 STA $a00a,y ; (BLIT_CODE[0] + 10)
407a : 99 10 a0 STA $a010,y ; (BLIT_CODE[0] + 16)
407d : a9 04 __ LDA #$04
407f : 99 0d a0 STA $a00d,y ; (BLIT_CODE[0] + 13)
4082 : 99 11 a0 STA $a011,y ; (BLIT_CODE[0] + 17)
4085 : a5 1b __ LDA ACCU + 0 
4087 : f0 04 __ BEQ $408d ; (bmu_line.s57 + 0)
.s58:
4089 : a9 11 __ LDA #$11
408b : 90 02 __ BCC $408f ; (bmu_line.s59 + 0)
.s57:
408d : a9 0f __ LDA #$0f
.s59:
408f : 99 02 a0 STA $a002,y ; (BLIT_CODE[0] + 2)
4092 : a5 4f __ LDA T8 + 0 
4094 : 99 09 a0 STA $a009,y ; (BLIT_CODE[0] + 9)
4097 : a5 50 __ LDA T8 + 1 
4099 : 99 0f a0 STA $a00f,y ; (BLIT_CODE[0] + 15)
409c : 98 __ __ TYA
409d : 18 __ __ CLC
409e : 69 12 __ ADC #$12
40a0 : 85 45 __ STA T1 + 0 
40a2 : a8 __ __ TAY
40a3 : 24 1d __ BIT ACCU + 2 
40a5 : 10 03 __ BPL $40aa ; (bmu_line.s59 + 27)
40a7 : 4c 93 3f JMP $3f93 ; (bmu_line.s31 + 0)
40aa : 4c 33 3e JMP $3e33 ; (bmu_line.s20 + 0)
.s35:
40ad : a9 a5 __ LDA #$a5
40af : a4 45 __ LDY T1 + 0 
40b1 : 99 00 a0 STA $a000,y ; (BLIT_CODE[0] + 0)
40b4 : a9 30 __ LDA #$30
40b6 : 99 02 a0 STA $a002,y ; (BLIT_CODE[0] + 2)
40b9 : a5 1c __ LDA ACCU + 1 
40bb : 69 05 __ ADC #$05
40bd : 99 01 a0 STA $a001,y ; (BLIT_CODE[0] + 1)
40c0 : a5 1c __ LDA ACCU + 1 
40c2 : d0 26 __ BNE $40ea ; (bmu_line.s39 + 0)
.s36:
40c4 : a9 1b __ LDA #$1b
40c6 : 85 1b __ STA ACCU + 0 
40c8 : a5 52 __ LDA T12 + 0 
40ca : d0 02 __ BNE $40ce ; (bmu_line.s38 + 0)
.s37:
40cc : e6 1b __ INC ACCU + 0 
.s38:
40ce : a5 1b __ LDA ACCU + 0 
40d0 : 99 03 a0 STA $a003,y ; (BLIT_CODE[0] + 3)
40d3 : 98 __ __ TYA
40d4 : 18 __ __ CLC
40d5 : 69 04 __ ADC #$04
40d7 : 85 45 __ STA T1 + 0 
40d9 : a9 00 __ LDA #$00
40db : c5 1c __ CMP ACCU + 1 
40dd : 2a __ __ ROL
40de : 85 1b __ STA ACCU + 0 
40e0 : a5 52 __ LDA T12 + 0 
40e2 : f0 03 __ BEQ $40e7 ; (bmu_line.s38 + 25)
40e4 : 4c 42 40 JMP $4042 ; (bmu_line.s34 + 0)
40e7 : 4c 21 3f JMP $3f21 ; (bmu_line.s30 + 0)
.s39:
40ea : a9 21 __ LDA #$21
40ec : 85 1b __ STA ACCU + 0 
40ee : a5 52 __ LDA T12 + 0 
40f0 : d0 dc __ BNE $40ce ; (bmu_line.s38 + 0)
40f2 : f0 d8 __ BEQ $40cc ; (bmu_line.s37 + 0)
.s42:
40f4 : a8 __ __ TAY
40f5 : f0 05 __ BEQ $40fc ; (bmu_line.s43 + 0)
.s44:
40f7 : a9 11 __ LDA #$11
40f9 : 4c 16 3e JMP $3e16 ; (bmu_line.s41 + 0)
.s43:
40fc : a9 06 __ LDA #$06
40fe : 8d 06 a0 STA $a006 ; (BLIT_CODE[0] + 6)
4101 : 8d 09 a0 STA $a009 ; (BLIT_CODE[0] + 9)
4104 : a9 07 __ LDA #$07
4106 : 8d 07 a0 STA $a007 ; (BLIT_CODE[0] + 7)
4109 : 8d 0b a0 STA $a00b ; (BLIT_CODE[0] + 11)
410c : a9 90 __ LDA #$90
410e : 8d 08 a0 STA $a008 ; (BLIT_CODE[0] + 8)
4111 : a9 e6 __ LDA #$e6
4113 : 8d 0a a0 STA $a00a ; (BLIT_CODE[0] + 10)
4116 : a9 11 __ LDA #$11
4118 : 8d 0c a0 STA $a00c ; (BLIT_CODE[0] + 12)
411b : a9 03 __ LDA #$03
411d : 8d 0d a0 STA $a00d ; (BLIT_CODE[0] + 13)
4120 : 8d 13 a0 STA $a013 ; (BLIT_CODE[0] + 19)
4123 : 8d 15 a0 STA $a015 ; (BLIT_CODE[0] + 21)
4126 : a9 d0 __ LDA #$d0
4128 : 8d 0e a0 STA $a00e ; (BLIT_CODE[0] + 14)
412b : a9 04 __ LDA #$04
412d : 8d 0f a0 STA $a00f ; (BLIT_CODE[0] + 15)
4130 : a9 49 __ LDA #$49
4132 : 8d 10 a0 STA $a010 ; (BLIT_CODE[0] + 16)
4135 : a9 ff __ LDA #$ff
4137 : 8d 11 a0 STA $a011 ; (BLIT_CODE[0] + 17)
413a : a9 31 __ LDA #$31
413c : 8d 12 a0 STA $a012 ; (BLIT_CODE[0] + 18)
413f : a9 91 __ LDA #$91
4141 : 8d 14 a0 STA $a014 ; (BLIT_CODE[0] + 20)
4144 : a9 16 __ LDA #$16
4146 : 4c 28 3e JMP $3e28 ; (bmu_line.s19 + 0)
--------------------------------------------------------------------
engine_update: ; engine_update(u8)->void
; 364, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s4:
4149 : 0a __ __ ASL
414a : aa __ __ TAX
414b : bd 00 7d LDA $7d00,x ; (sid_freq[0] + 0)
414e : 8d 00 d4 STA $d400 
4151 : bd 01 7d LDA $7d01,x ; (sid_freq[0] + 1)
4154 : 85 1c __ STA ACCU + 1 
4156 : 8d 01 d4 STA $d401 
4159 : bd 00 7d LDA $7d00,x ; (sid_freq[0] + 0)
415c : 0a __ __ ASL
415d : 26 1c __ ROL ACCU + 1 
415f : 8d 07 d4 STA $d407 
4162 : a5 1c __ LDA ACCU + 1 
4164 : 8d 08 d4 STA $d408 
.s3:
4167 : 60 __ __ RTS
--------------------------------------------------------------------
modplay_start: ; modplay_start()->void
; 239, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s4:
4168 : ad c0 9b LDA $9bc0 ; (modplay.song_length + 0)
416b : d0 01 __ BNE $416e ; (modplay_start.s5 + 0)
.s3:
416d : 60 __ __ RTS
.s5:
416e : a9 00 __ LDA #$00
4170 : 8d ff 7c STA $7cff ; (mod_paused + 0)
4173 : 8d 43 9c STA $9c43 ; (modplay.order_pos + 0)
4176 : 85 43 __ STA T0 + 0 
4178 : 8d 45 9c STA $9c45 ; (modplay.row + 0)
417b : 8d 46 9c STA $9c46 ; (modplay.tick + 0)
417e : 8d 49 9c STA $9c49 ; (modplay.pattern_delay + 0)
4181 : 8d 4e 9c STA $9c4e ; (modplay.skip_row_advance + 0)
4184 : ad c3 9b LDA $9bc3 ; (modplay.order_table[0] + 0)
4187 : 8d 44 9c STA $9c44 ; (modplay.pattern_num + 0)
418a : a9 06 __ LDA #$06
418c : 8d 47 9c STA $9c47 ; (modplay.ticks_per_row + 0)
418f : a9 7d __ LDA #$7d
4191 : 8d 48 9c STA $9c48 ; (modplay.bpm + 0)
4194 : a9 01 __ LDA #$01
4196 : 8d 4c 9c STA $9c4c ; (modplay.active + 0)
4199 : ad 4b 9c LDA $9c4b ; (modplay.stereo + 0)
419c : d0 17 __ BNE $41b5 ; (modplay_start.l10 + 0)
.s7:
419e : a9 80 __ LDA #$80
41a0 : a6 43 __ LDX T0 + 0 
41a2 : bc 8d 7b LDY $7b8d,x ; (__multab50L + 0)
.l8:
41a5 : 99 a4 9e STA $9ea4,y ; (modplay.channel[0].pan + 0)
41a8 : e6 43 __ INC T0 + 0 
41aa : a5 43 __ LDA T0 + 0 
41ac : c9 04 __ CMP #$04
41ae : b0 1d __ BCS $41cd ; (modplay_start.s9 + 0)
.s6:
41b0 : ad 4b 9c LDA $9c4b ; (modplay.stereo + 0)
41b3 : f0 e9 __ BEQ $419e ; (modplay_start.s7 + 0)
.l10:
41b5 : a5 43 __ LDA T0 + 0 
41b7 : f0 04 __ BEQ $41bd ; (modplay_start.s11 + 0)
.s13:
41b9 : c9 03 __ CMP #$03
41bb : d0 04 __ BNE $41c1 ; (modplay_start.s14 + 0)
.s11:
41bd : a2 00 __ LDX #$00
41bf : f0 02 __ BEQ $41c3 ; (modplay_start.s12 + 0)
.s14:
41c1 : a2 ff __ LDX #$ff
.s12:
41c3 : a4 43 __ LDY T0 + 0 
41c5 : b9 8d 7b LDA $7b8d,y ; (__multab50L + 0)
41c8 : a8 __ __ TAY
41c9 : 8a __ __ TXA
41ca : 4c a5 41 JMP $41a5 ; (modplay_start.l8 + 0)
.s9:
41cd : ad 48 9c LDA $9c48 ; (modplay.bpm + 0)
41d0 : 20 0d 42 JSR $420d ; (bpm_to_timer.s4 + 0)
41d3 : a5 1b __ LDA ACCU + 0 
41d5 : 85 43 __ STA T0 + 0 
41d7 : a5 1c __ LDA ACCU + 1 
41d9 : 85 44 __ STA T0 + 1 
41db : 78 __ __ SEI
41dc : ad 14 03 LDA $0314 
41df : 8d fe 7f STA $7ffe ; (mod_saved_irq[0] + 0)
41e2 : ad 15 03 LDA $0315 
41e5 : 8d ff 7f STA $7fff ; (mod_saved_irq[0] + 1)
41e8 : a9 7f __ LDA #$7f
41ea : 8d 0d dc STA $dc0d 
41ed : a5 43 __ LDA T0 + 0 
41ef : 8d 04 dc STA $dc04 
41f2 : a5 44 __ LDA T0 + 1 
41f4 : 8d 05 dc STA $dc05 
41f7 : a9 08 __ LDA #$08
41f9 : 8d 14 03 STA $0314 
41fc : a9 43 __ LDA #$43
41fe : 8d 15 03 STA $0315 
4201 : a9 81 __ LDA #$81
4203 : 8d 0d dc STA $dc0d 
4206 : a9 01 __ LDA #$01
4208 : 8d 0e dc STA $dc0e 
420b : 58 __ __ CLI
420c : 60 __ __ RTS
--------------------------------------------------------------------
bpm_to_timer: ; bpm_to_timer(u8)->u16
;  76, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
420d : 85 03 __ STA WORK + 0 
420f : aa __ __ TAX
4210 : d0 09 __ BNE $421b ; (bpm_to_timer.s6 + 0)
.s5:
4212 : a9 f8 __ LDA #$f8
4214 : 85 1b __ STA ACCU + 0 
4216 : a9 4c __ LDA #$4c
4218 : 85 1c __ STA ACCU + 1 
.s3:
421a : 60 __ __ RTS
.s6:
421b : a9 00 __ LDA #$00
421d : 85 1e __ STA ACCU + 3 
421f : 85 04 __ STA WORK + 1 
4221 : 85 05 __ STA WORK + 2 
4223 : 85 06 __ STA WORK + 3 
4225 : a9 90 __ LDA #$90
4227 : 85 1b __ STA ACCU + 0 
4229 : a9 95 __ LDA #$95
422b : 85 1c __ STA ACCU + 1 
422d : a9 25 __ LDA #$25
422f : 85 1d __ STA ACCU + 2 
--------------------------------------------------------------------
divmod32: ; divmod32
4231 : 84 02 __ STY $02 
4233 : a0 20 __ LDY #$20
4235 : a9 00 __ LDA #$00
4237 : 85 07 __ STA WORK + 4 
4239 : 85 08 __ STA WORK + 5 
423b : 85 09 __ STA WORK + 6 
423d : 85 0a __ STA WORK + 7 
423f : a5 05 __ LDA WORK + 2 
4241 : 05 06 __ ORA WORK + 3 
4243 : d0 78 __ BNE $42bd ; (divmod32 + 140)
4245 : a5 04 __ LDA WORK + 1 
4247 : d0 27 __ BNE $4270 ; (divmod32 + 63)
4249 : 18 __ __ CLC
424a : 26 1b __ ROL ACCU + 0 
424c : 26 1c __ ROL ACCU + 1 
424e : 26 1d __ ROL ACCU + 2 
4250 : 26 1e __ ROL ACCU + 3 
4252 : 2a __ __ ROL
4253 : 90 05 __ BCC $425a ; (divmod32 + 41)
4255 : e5 03 __ SBC WORK + 0 
4257 : 38 __ __ SEC
4258 : b0 06 __ BCS $4260 ; (divmod32 + 47)
425a : c5 03 __ CMP WORK + 0 
425c : 90 02 __ BCC $4260 ; (divmod32 + 47)
425e : e5 03 __ SBC WORK + 0 
4260 : 88 __ __ DEY
4261 : d0 e7 __ BNE $424a ; (divmod32 + 25)
4263 : 85 07 __ STA WORK + 4 
4265 : 26 1b __ ROL ACCU + 0 
4267 : 26 1c __ ROL ACCU + 1 
4269 : 26 1d __ ROL ACCU + 2 
426b : 26 1e __ ROL ACCU + 3 
426d : a4 02 __ LDY $02 
426f : 60 __ __ RTS
4270 : a5 1e __ LDA ACCU + 3 
4272 : d0 10 __ BNE $4284 ; (divmod32 + 83)
4274 : a6 1d __ LDX ACCU + 2 
4276 : 86 1e __ STX ACCU + 3 
4278 : a6 1c __ LDX ACCU + 1 
427a : 86 1d __ STX ACCU + 2 
427c : a6 1b __ LDX ACCU + 0 
427e : 86 1c __ STX ACCU + 1 
4280 : 85 1b __ STA ACCU + 0 
4282 : a0 18 __ LDY #$18
4284 : 18 __ __ CLC
4285 : 26 1b __ ROL ACCU + 0 
4287 : 26 1c __ ROL ACCU + 1 
4289 : 26 1d __ ROL ACCU + 2 
428b : 26 1e __ ROL ACCU + 3 
428d : 26 07 __ ROL WORK + 4 
428f : 26 08 __ ROL WORK + 5 
4291 : 90 0c __ BCC $429f ; (divmod32 + 110)
4293 : a5 07 __ LDA WORK + 4 
4295 : e5 03 __ SBC WORK + 0 
4297 : aa __ __ TAX
4298 : a5 08 __ LDA WORK + 5 
429a : e5 04 __ SBC WORK + 1 
429c : 38 __ __ SEC
429d : b0 0c __ BCS $42ab ; (divmod32 + 122)
429f : 38 __ __ SEC
42a0 : a5 07 __ LDA WORK + 4 
42a2 : e5 03 __ SBC WORK + 0 
42a4 : aa __ __ TAX
42a5 : a5 08 __ LDA WORK + 5 
42a7 : e5 04 __ SBC WORK + 1 
42a9 : 90 04 __ BCC $42af ; (divmod32 + 126)
42ab : 86 07 __ STX WORK + 4 
42ad : 85 08 __ STA WORK + 5 
42af : 88 __ __ DEY
42b0 : d0 d3 __ BNE $4285 ; (divmod32 + 84)
42b2 : 26 1b __ ROL ACCU + 0 
42b4 : 26 1c __ ROL ACCU + 1 
42b6 : 26 1d __ ROL ACCU + 2 
42b8 : 26 1e __ ROL ACCU + 3 
42ba : a4 02 __ LDY $02 
42bc : 60 __ __ RTS
42bd : a0 10 __ LDY #$10
42bf : a5 1e __ LDA ACCU + 3 
42c1 : 85 08 __ STA WORK + 5 
42c3 : a5 1d __ LDA ACCU + 2 
42c5 : 85 07 __ STA WORK + 4 
42c7 : a9 00 __ LDA #$00
42c9 : 85 1d __ STA ACCU + 2 
42cb : 85 1e __ STA ACCU + 3 
42cd : 18 __ __ CLC
42ce : 26 1b __ ROL ACCU + 0 
42d0 : 26 1c __ ROL ACCU + 1 
42d2 : 26 07 __ ROL WORK + 4 
42d4 : 26 08 __ ROL WORK + 5 
42d6 : 26 09 __ ROL WORK + 6 
42d8 : 26 0a __ ROL WORK + 7 
42da : a5 07 __ LDA WORK + 4 
42dc : c5 03 __ CMP WORK + 0 
42de : a5 08 __ LDA WORK + 5 
42e0 : e5 04 __ SBC WORK + 1 
42e2 : a5 09 __ LDA WORK + 6 
42e4 : e5 05 __ SBC WORK + 2 
42e6 : aa __ __ TAX
42e7 : a5 0a __ LDA WORK + 7 
42e9 : e5 06 __ SBC WORK + 3 
42eb : 90 11 __ BCC $42fe ; (divmod32 + 205)
42ed : 86 09 __ STX WORK + 6 
42ef : 85 0a __ STA WORK + 7 
42f1 : a5 07 __ LDA WORK + 4 
42f3 : e5 03 __ SBC WORK + 0 
42f5 : 85 07 __ STA WORK + 4 
42f7 : a5 08 __ LDA WORK + 5 
42f9 : e5 04 __ SBC WORK + 1 
42fb : 85 08 __ STA WORK + 5 
42fd : 38 __ __ SEC
42fe : 88 __ __ DEY
42ff : d0 cd __ BNE $42ce ; (divmod32 + 157)
4301 : 26 1b __ ROL ACCU + 0 
4303 : 26 1c __ ROL ACCU + 1 
4305 : a4 02 __ LDY $02 
4307 : 60 __ __ RTS
--------------------------------------------------------------------
modplay_irq: ; modplay_irq
4308 : ad 0d dc LDA $dc0d 
430b : 29 01 __ AND #$01
430d : d0 03 __ BNE $4312 ; (modplay_irq + 10)
430f : 4c 31 ea JMP $ea31 
4312 : a5 07 __ LDA WORK + 4 
4314 : 48 __ __ PHA
4315 : a5 08 __ LDA WORK + 5 
4317 : 48 __ __ PHA
4318 : a5 09 __ LDA WORK + 6 
431a : 48 __ __ PHA
431b : a5 0a __ LDA WORK + 7 
431d : 48 __ __ PHA
431e : a5 0b __ LDA WORK + 8 
4320 : 48 __ __ PHA
4321 : a5 0c __ LDA $0c 
4323 : 48 __ __ PHA
4324 : a5 14 __ LDA P7 
4326 : 48 __ __ PHA
4327 : a5 15 __ LDA P8 
4329 : 48 __ __ PHA
432a : a5 16 __ LDA P9 
432c : 48 __ __ PHA
432d : a5 17 __ LDA P10 
432f : 48 __ __ PHA
4330 : a5 18 __ LDA P11 
4332 : 48 __ __ PHA
4333 : a5 19 __ LDA IP + 0 
4335 : 48 __ __ PHA
4336 : a5 1a __ LDA IP + 1 
4338 : 48 __ __ PHA
4339 : a5 1f __ LDA ADDR + 0 
433b : 48 __ __ PHA
433c : a5 20 __ LDA ADDR + 1 
433e : 48 __ __ PHA
433f : a5 21 __ LDA ADDR + 2 
4341 : 48 __ __ PHA
4342 : a5 22 __ LDA ADDR + 3 
4344 : 48 __ __ PHA
4345 : a5 23 __ LDA SP + 0 
4347 : 48 __ __ PHA
4348 : a5 24 __ LDA SP + 1 
434a : 48 __ __ PHA
434b : a5 25 __ LDA FP + 0 
434d : 48 __ __ PHA
434e : a5 26 __ LDA FP + 1 
4350 : 48 __ __ PHA
4351 : a5 27 __ LDA $27 
4353 : 48 __ __ PHA
4354 : a5 28 __ LDA $28 
4356 : 48 __ __ PHA
4357 : a5 29 __ LDA $29 
4359 : 48 __ __ PHA
435a : a5 2a __ LDA $2a 
435c : 48 __ __ PHA
435d : a5 2b __ LDA $2b 
435f : 48 __ __ PHA
4360 : a5 2c __ LDA $2c 
4362 : 48 __ __ PHA
4363 : a5 2d __ LDA $2d 
4365 : 48 __ __ PHA
4366 : a5 2e __ LDA $2e 
4368 : 48 __ __ PHA
4369 : a5 2f __ LDA $2f 
436b : 48 __ __ PHA
436c : a5 30 __ LDA $30 
436e : 48 __ __ PHA
436f : a5 31 __ LDA $31 
4371 : 48 __ __ PHA
4372 : a5 32 __ LDA $32 
4374 : 48 __ __ PHA
4375 : a5 33 __ LDA $33 
4377 : 48 __ __ PHA
4378 : a5 34 __ LDA $34 
437a : 48 __ __ PHA
437b : a5 35 __ LDA $35 
437d : 48 __ __ PHA
437e : a5 36 __ LDA $36 
4380 : 48 __ __ PHA
4381 : a5 37 __ LDA $37 
4383 : 48 __ __ PHA
4384 : a5 38 __ LDA $38 
4386 : 48 __ __ PHA
4387 : a5 39 __ LDA $39 
4389 : 48 __ __ PHA
438a : a5 3a __ LDA $3a 
438c : 48 __ __ PHA
438d : a5 3b __ LDA $3b 
438f : 48 __ __ PHA
4390 : a5 3c __ LDA $3c 
4392 : 48 __ __ PHA
4393 : a5 3d __ LDA $3d 
4395 : 48 __ __ PHA
4396 : a5 3e __ LDA $3e 
4398 : 48 __ __ PHA
4399 : a5 3f __ LDA $3f 
439b : 48 __ __ PHA
439c : a5 40 __ LDA $40 
439e : 48 __ __ PHA
439f : a5 41 __ LDA $41 
43a1 : 48 __ __ PHA
43a2 : a5 42 __ LDA $42 
43a4 : 48 __ __ PHA
43a5 : 20 3e 44 JSR $443e ; (modplay_tick.s1 + 0)
43a8 : 68 __ __ PLA
43a9 : 85 42 __ STA $42 
43ab : 68 __ __ PLA
43ac : 85 41 __ STA $41 
43ae : 68 __ __ PLA
43af : 85 40 __ STA $40 
43b1 : 68 __ __ PLA
43b2 : 85 3f __ STA $3f 
43b4 : 68 __ __ PLA
43b5 : 85 3e __ STA $3e 
43b7 : 68 __ __ PLA
43b8 : 85 3d __ STA $3d 
43ba : 68 __ __ PLA
43bb : 85 3c __ STA $3c 
43bd : 68 __ __ PLA
43be : 85 3b __ STA $3b 
43c0 : 68 __ __ PLA
43c1 : 85 3a __ STA $3a 
43c3 : 68 __ __ PLA
43c4 : 85 39 __ STA $39 
43c6 : 68 __ __ PLA
43c7 : 85 38 __ STA $38 
43c9 : 68 __ __ PLA
43ca : 85 37 __ STA $37 
43cc : 68 __ __ PLA
43cd : 85 36 __ STA $36 
43cf : 68 __ __ PLA
43d0 : 85 35 __ STA $35 
43d2 : 68 __ __ PLA
43d3 : 85 34 __ STA $34 
43d5 : 68 __ __ PLA
43d6 : 85 33 __ STA $33 
43d8 : 68 __ __ PLA
43d9 : 85 32 __ STA $32 
43db : 68 __ __ PLA
43dc : 85 31 __ STA $31 
43de : 68 __ __ PLA
43df : 85 30 __ STA $30 
43e1 : 68 __ __ PLA
43e2 : 85 2f __ STA $2f 
43e4 : 68 __ __ PLA
43e5 : 85 2e __ STA $2e 
43e7 : 68 __ __ PLA
43e8 : 85 2d __ STA $2d 
43ea : 68 __ __ PLA
43eb : 85 2c __ STA $2c 
43ed : 68 __ __ PLA
43ee : 85 2b __ STA $2b 
43f0 : 68 __ __ PLA
43f1 : 85 2a __ STA $2a 
43f3 : 68 __ __ PLA
43f4 : 85 29 __ STA $29 
43f6 : 68 __ __ PLA
43f7 : 85 28 __ STA $28 
43f9 : 68 __ __ PLA
43fa : 85 27 __ STA $27 
43fc : 68 __ __ PLA
43fd : 85 26 __ STA FP + 1 
43ff : 68 __ __ PLA
4400 : 85 25 __ STA FP + 0 
4402 : 68 __ __ PLA
4403 : 85 24 __ STA SP + 1 
4405 : 68 __ __ PLA
4406 : 85 23 __ STA SP + 0 
4408 : 68 __ __ PLA
4409 : 85 22 __ STA ADDR + 3 
440b : 68 __ __ PLA
440c : 85 21 __ STA ADDR + 2 
440e : 68 __ __ PLA
440f : 85 20 __ STA ADDR + 1 
4411 : 68 __ __ PLA
4412 : 85 1f __ STA ADDR + 0 
4414 : 68 __ __ PLA
4415 : 85 1a __ STA IP + 1 
4417 : 68 __ __ PLA
4418 : 85 19 __ STA IP + 0 
441a : 68 __ __ PLA
441b : 85 18 __ STA P11 
441d : 68 __ __ PLA
441e : 85 17 __ STA P10 
4420 : 68 __ __ PLA
4421 : 85 16 __ STA P9 
4423 : 68 __ __ PLA
4424 : 85 15 __ STA P8 
4426 : 68 __ __ PLA
4427 : 85 14 __ STA P7 
4429 : 68 __ __ PLA
442a : 85 0c __ STA $0c 
442c : 68 __ __ PLA
442d : 85 0b __ STA WORK + 8 
442f : 68 __ __ PLA
4430 : 85 0a __ STA WORK + 7 
4432 : 68 __ __ PLA
4433 : 85 09 __ STA WORK + 6 
4435 : 68 __ __ PLA
4436 : 85 08 __ STA WORK + 5 
4438 : 68 __ __ PLA
4439 : 85 07 __ STA WORK + 4 
443b : 4c 31 ea JMP $ea31 
--------------------------------------------------------------------
modplay_tick: ; modplay_tick()->void
; 285, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s1:
443e : c6 24 __ DEC SP + 1 
4440 : a5 03 __ LDA WORK + 0 
4442 : 48 __ __ PHA
4443 : a5 04 __ LDA WORK + 1 
4445 : 48 __ __ PHA
4446 : a5 05 __ LDA WORK + 2 
4448 : 48 __ __ PHA
4449 : a5 06 __ LDA WORK + 3 
444b : 48 __ __ PHA
444c : a5 0d __ LDA P0 
444e : 48 __ __ PHA
444f : a5 0e __ LDA P1 
4451 : 48 __ __ PHA
4452 : a5 0f __ LDA P2 
4454 : 48 __ __ PHA
4455 : a5 10 __ LDA P3 
4457 : 48 __ __ PHA
4458 : a5 11 __ LDA P4 
445a : 48 __ __ PHA
445b : a5 12 __ LDA P5 
445d : 48 __ __ PHA
445e : a5 13 __ LDA P6 
4460 : 48 __ __ PHA
4461 : a5 1b __ LDA ACCU + 0 
4463 : 48 __ __ PHA
4464 : a5 1c __ LDA ACCU + 1 
4466 : 48 __ __ PHA
4467 : a5 1d __ LDA ACCU + 2 
4469 : 48 __ __ PHA
446a : a5 1e __ LDA ACCU + 3 
446c : 48 __ __ PHA
446d : a5 43 __ LDA T0 + 0 
446f : 48 __ __ PHA
4470 : a5 44 __ LDA T0 + 1 
4472 : 48 __ __ PHA
4473 : a5 45 __ LDA T2 + 0 
4475 : 48 __ __ PHA
4476 : a5 46 __ LDA $46 
4478 : 48 __ __ PHA
4479 : a5 47 __ LDA $47 
447b : 48 __ __ PHA
447c : a5 48 __ LDA $48 
447e : 48 __ __ PHA
447f : a5 49 __ LDA $49 
4481 : 48 __ __ PHA
4482 : a5 4a __ LDA $4a 
4484 : 48 __ __ PHA
4485 : a5 4b __ LDA $4b 
4487 : 48 __ __ PHA
4488 : a5 4c __ LDA $4c 
448a : 48 __ __ PHA
448b : a5 4d __ LDA $4d 
448d : 48 __ __ PHA
448e : a5 4e __ LDA $4e 
4490 : 48 __ __ PHA
4491 : a5 4f __ LDA $4f 
4493 : 48 __ __ PHA
4494 : a5 50 __ LDA $50 
4496 : 48 __ __ PHA
4497 : a5 51 __ LDA $51 
4499 : 48 __ __ PHA
.s4:
449a : ad 4c 9c LDA $9c4c ; (modplay.active + 0)
449d : d0 03 __ BNE $44a2 ; (modplay_tick.s5 + 0)
449f : 4c 38 45 JMP $4538 ; (modplay_tick.s3 + 0)
.s5:
44a2 : ad ff 7c LDA $7cff ; (mod_paused + 0)
44a5 : d0 f8 __ BNE $449f ; (modplay_tick.s4 + 5)
.s6:
44a7 : ad 46 9c LDA $9c46 ; (modplay.tick + 0)
44aa : d0 19 __ BNE $44c5 ; (modplay_tick.s25 + 0)
.s7:
44ac : ad 48 9c LDA $9c48 ; (modplay.bpm + 0)
44af : 20 0d 42 JSR $420d ; (bpm_to_timer.s4 + 0)
44b2 : a5 1b __ LDA ACCU + 0 
44b4 : 8d 04 dc STA $dc04 
44b7 : a5 1c __ LDA ACCU + 1 
44b9 : 8d 05 dc STA $dc05 
44bc : 20 c7 45 JSR $45c7 ; (process_new_row.s1 + 0)
44bf : ac 47 9c LDY $9c47 ; (modplay.ticks_per_row + 0)
44c2 : 4c de 44 JMP $44de ; (modplay_tick.s8 + 0)
.s25:
44c5 : a9 00 __ LDA #$00
44c7 : 85 0f __ STA P2 
44c9 : 20 59 4c JSR $4c59 ; (fx_tick.s4 + 0)
44cc : e6 0f __ INC P2 
44ce : 20 59 4c JSR $4c59 ; (fx_tick.s4 + 0)
44d1 : e6 0f __ INC P2 
44d3 : 20 59 4c JSR $4c59 ; (fx_tick.s4 + 0)
44d6 : e6 0f __ INC P2 
44d8 : 20 59 4c JSR $4c59 ; (fx_tick.s4 + 0)
44db : ac 46 9c LDY $9c46 ; (modplay.tick + 0)
.s8:
44de : 88 __ __ DEY
44df : 8c 46 9c STY $9c46 ; (modplay.tick + 0)
44e2 : a9 00 __ LDA #$00
44e4 : 85 13 __ STA P6 
.l26:
44e6 : 20 d6 4e JSR $4ed6 ; (ua_update_channel.s1 + 0)
44e9 : e6 13 __ INC P6 
44eb : a5 13 __ LDA P6 
44ed : c9 04 __ CMP #$04
44ef : 90 f5 __ BCC $44e6 ; (modplay_tick.l26 + 0)
.s9:
44f1 : ad 46 9c LDA $9c46 ; (modplay.tick + 0)
44f4 : d0 42 __ BNE $4538 ; (modplay_tick.s3 + 0)
.s10:
44f6 : ad 49 9c LDA $9c49 ; (modplay.pattern_delay + 0)
44f9 : f0 05 __ BEQ $4500 ; (modplay_tick.s11 + 0)
.s24:
44fb : ce 49 9c DEC $9c49 ; (modplay.pattern_delay + 0)
44fe : b0 38 __ BCS $4538 ; (modplay_tick.s3 + 0)
.s11:
4500 : ad 4e 9c LDA $9c4e ; (modplay.skip_row_advance + 0)
4503 : f0 03 __ BEQ $4508 ; (modplay_tick.s12 + 0)
4505 : 4c 95 45 JMP $4595 ; (modplay_tick.s18 + 0)
.s12:
4508 : ee 45 9c INC $9c45 ; (modplay.row + 0)
450b : ad 45 9c LDA $9c45 ; (modplay.row + 0)
450e : c9 40 __ CMP #$40
4510 : 90 26 __ BCC $4538 ; (modplay_tick.s3 + 0)
.s13:
4512 : ee 43 9c INC $9c43 ; (modplay.order_pos + 0)
4515 : a9 00 __ LDA #$00
4517 : 8d 45 9c STA $9c45 ; (modplay.row + 0)
451a : ad 43 9c LDA $9c43 ; (modplay.order_pos + 0)
451d : cd c0 9b CMP $9bc0 ; (modplay.song_length + 0)
4520 : 90 0f __ BCC $4531 ; (modplay_tick.s14 + 0)
.s15:
4522 : ad 4d 9c LDA $9c4d ; (modplay.loop_song + 0)
4525 : d0 05 __ BNE $452c ; (modplay_tick.s17 + 0)
.s16:
4527 : 8d 4c 9c STA $9c4c ; (modplay.active + 0)
452a : b0 0c __ BCS $4538 ; (modplay_tick.s3 + 0)
.s17:
452c : a9 00 __ LDA #$00
452e : 8d 43 9c STA $9c43 ; (modplay.order_pos + 0)
.s14:
4531 : aa __ __ TAX
4532 : bd c3 9b LDA $9bc3,x ; (modplay.order_table[0] + 0)
4535 : 8d 44 9c STA $9c44 ; (modplay.pattern_num + 0)
.s3:
4538 : 68 __ __ PLA
4539 : 85 51 __ STA $51 
453b : 68 __ __ PLA
453c : 85 50 __ STA $50 
453e : 68 __ __ PLA
453f : 85 4f __ STA $4f 
4541 : 68 __ __ PLA
4542 : 85 4e __ STA $4e 
4544 : 68 __ __ PLA
4545 : 85 4d __ STA $4d 
4547 : 68 __ __ PLA
4548 : 85 4c __ STA $4c 
454a : 68 __ __ PLA
454b : 85 4b __ STA $4b 
454d : 68 __ __ PLA
454e : 85 4a __ STA $4a 
4550 : 68 __ __ PLA
4551 : 85 49 __ STA $49 
4553 : 68 __ __ PLA
4554 : 85 48 __ STA $48 
4556 : 68 __ __ PLA
4557 : 85 47 __ STA $47 
4559 : 68 __ __ PLA
455a : 85 46 __ STA $46 
455c : 68 __ __ PLA
455d : 85 45 __ STA T2 + 0 
455f : 68 __ __ PLA
4560 : 85 44 __ STA T0 + 1 
4562 : 68 __ __ PLA
4563 : 85 43 __ STA T0 + 0 
4565 : 68 __ __ PLA
4566 : 85 1e __ STA ACCU + 3 
4568 : 68 __ __ PLA
4569 : 85 1d __ STA ACCU + 2 
456b : 68 __ __ PLA
456c : 85 1c __ STA ACCU + 1 
456e : 68 __ __ PLA
456f : 85 1b __ STA ACCU + 0 
4571 : 68 __ __ PLA
4572 : 85 13 __ STA P6 
4574 : 68 __ __ PLA
4575 : 85 12 __ STA P5 
4577 : 68 __ __ PLA
4578 : 85 11 __ STA P4 
457a : 68 __ __ PLA
457b : 85 10 __ STA P3 
457d : 68 __ __ PLA
457e : 85 0f __ STA P2 
4580 : 68 __ __ PLA
4581 : 85 0e __ STA P1 
4583 : 68 __ __ PLA
4584 : 85 0d __ STA P0 
4586 : 68 __ __ PLA
4587 : 85 06 __ STA WORK + 3 
4589 : 68 __ __ PLA
458a : 85 05 __ STA WORK + 2 
458c : 68 __ __ PLA
458d : 85 04 __ STA WORK + 1 
458f : 68 __ __ PLA
4590 : 85 03 __ STA WORK + 0 
4592 : e6 24 __ INC SP + 1 
4594 : 60 __ __ RTS
.s18:
4595 : ad 4f 9c LDA $9c4f ; (modplay.next_order + 0)
4598 : c9 ff __ CMP #$ff
459a : f0 06 __ BEQ $45a2 ; (modplay_tick.s19 + 0)
.s23:
459c : 8d 43 9c STA $9c43 ; (modplay.order_pos + 0)
459f : 4c a5 45 JMP $45a5 ; (modplay_tick.s27 + 0)
.s19:
45a2 : ad 43 9c LDA $9c43 ; (modplay.order_pos + 0)
.s27:
45a5 : cd c0 9b CMP $9bc0 ; (modplay.song_length + 0)
45a8 : 90 0d __ BCC $45b7 ; (modplay_tick.s20 + 0)
.s21:
45aa : ad 4d 9c LDA $9c4d ; (modplay.loop_song + 0)
45ad : d0 03 __ BNE $45b2 ; (modplay_tick.s22 + 0)
45af : 4c 27 45 JMP $4527 ; (modplay_tick.s16 + 0)
.s22:
45b2 : a9 00 __ LDA #$00
45b4 : 8d 43 9c STA $9c43 ; (modplay.order_pos + 0)
.s20:
45b7 : aa __ __ TAX
45b8 : bd c3 9b LDA $9bc3,x ; (modplay.order_table[0] + 0)
45bb : 8d 44 9c STA $9c44 ; (modplay.pattern_num + 0)
45be : ad 50 9c LDA $9c50 ; (modplay.next_row + 0)
45c1 : 8d 45 9c STA $9c45 ; (modplay.row + 0)
45c4 : 4c 38 45 JMP $4538 ; (modplay_tick.s3 + 0)
--------------------------------------------------------------------
process_new_row: ; process_new_row()->void
; 579, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s1:
45c7 : 38 __ __ SEC
45c8 : a5 23 __ LDA SP + 0 
45ca : e9 0b __ SBC #$0b
45cc : 85 23 __ STA SP + 0 
45ce : b0 02 __ BCS $45d2 ; (process_new_row.s4 + 0)
45d0 : c6 24 __ DEC SP + 1 
.s4:
45d2 : a9 00 __ LDA #$00
45d4 : 8d 4e 9c STA $9c4e ; (modplay.skip_row_advance + 0)
45d7 : 8d 50 9c STA $9c50 ; (modplay.next_row + 0)
45da : ad bc 9b LDA $9bbc ; (modplay.reu_base + 0)
45dd : 18 __ __ CLC
45de : 69 3c __ ADC #$3c
45e0 : 85 43 __ STA T0 + 0 
45e2 : a9 ff __ LDA #$ff
45e4 : 8d 4f 9c STA $9c4f ; (modplay.next_order + 0)
45e7 : a9 b2 __ LDA #$b2
45e9 : 8d 02 df STA $df02 
45ec : a9 87 __ LDA #$87
45ee : 8d 03 df STA $df03 
45f1 : ad bd 9b LDA $9bbd ; (modplay.reu_base + 1)
45f4 : 69 04 __ ADC #$04
45f6 : aa __ __ TAX
45f7 : ac be 9b LDY $9bbe ; (modplay.reu_base + 2)
45fa : 90 01 __ BCC $45fd ; (process_new_row.s9 + 0)
.s8:
45fc : c8 __ __ INY
.s9:
45fd : ad 44 9c LDA $9c44 ; (modplay.pattern_num + 0)
4600 : 0a __ __ ASL
4601 : 85 1c __ STA ACCU + 1 
4603 : a9 00 __ LDA #$00
4605 : 2a __ __ ROL
4606 : 06 1c __ ASL ACCU + 1 
4608 : 2a __ __ ROL
4609 : 85 1d __ STA ACCU + 2 
460b : 8a __ __ TXA
460c : 65 1c __ ADC ACCU + 1 
460e : 85 44 __ STA T0 + 1 
4610 : 98 __ __ TYA
4611 : 65 1d __ ADC ACCU + 2 
4613 : 85 45 __ STA T0 + 2 
4615 : ad 45 9c LDA $9c45 ; (modplay.row + 0)
4618 : 85 1b __ STA ACCU + 0 
461a : a9 00 __ LDA #$00
461c : 85 1c __ STA ACCU + 1 
461e : 85 1d __ STA ACCU + 2 
4620 : a2 04 __ LDX #$04
.l5:
4622 : 06 1b __ ASL ACCU + 0 
4624 : 26 1c __ ROL ACCU + 1 
4626 : 26 1d __ ROL ACCU + 2 
4628 : 2a __ __ ROL
4629 : ca __ __ DEX
462a : d0 f6 __ BNE $4622 ; (process_new_row.l5 + 0)
.s6:
462c : 18 __ __ CLC
462d : a5 1b __ LDA ACCU + 0 
462f : 65 43 __ ADC T0 + 0 
4631 : 8d 04 df STA $df04 
4634 : a5 1c __ LDA ACCU + 1 
4636 : 65 44 __ ADC T0 + 1 
4638 : 8d 05 df STA $df05 
463b : a5 1d __ LDA ACCU + 2 
463d : 65 45 __ ADC T0 + 2 
463f : 8d 06 df STA $df06 
4642 : a9 10 __ LDA #$10
4644 : 8d 07 df STA $df07 
4647 : 8e 08 df STX $df08 
464a : 8e 0a df STX $df0a 
464d : 86 4a __ STX T5 + 0 
464f : 86 4b __ STX T7 + 0 
4651 : 86 10 __ STX P3 
4653 : a9 91 __ LDA #$91
4655 : 8d 01 df STA $df01 
4658 : 18 __ __ CLC
4659 : a5 23 __ LDA SP + 0 
465b : 69 06 __ ADC #$06
465d : 85 11 __ STA P4 
465f : a5 24 __ LDA SP + 1 
4661 : 69 00 __ ADC #$00
4663 : 85 12 __ STA P5 
.l7:
4665 : a6 4b __ LDX T7 + 0 
4667 : bd b2 87 LDA $87b2,x ; (mod_row_buf[0] + 0)
466a : 29 f0 __ AND #$f0
466c : 85 48 __ STA T2 + 0 
466e : bd b4 87 LDA $87b4,x ; (mod_row_buf[0] + 2)
4671 : 4a __ __ LSR
4672 : 4a __ __ LSR
4673 : 4a __ __ LSR
4674 : 4a __ __ LSR
4675 : 05 48 __ ORA T2 + 0 
4677 : a0 06 __ LDY #$06
4679 : 91 23 __ STA (SP + 0),y 
467b : bd b3 87 LDA $87b3,x ; (mod_row_buf[0] + 1)
467e : c8 __ __ INY
467f : 91 23 __ STA (SP + 0),y 
4681 : bd b2 87 LDA $87b2,x ; (mod_row_buf[0] + 0)
4684 : 29 0f __ AND #$0f
4686 : c8 __ __ INY
4687 : 91 23 __ STA (SP + 0),y 
4689 : bd b4 87 LDA $87b4,x ; (mod_row_buf[0] + 2)
468c : 29 0f __ AND #$0f
468e : 85 49 __ STA T3 + 0 
4690 : c8 __ __ INY
4691 : 91 23 __ STA (SP + 0),y 
4693 : bd b5 87 LDA $87b5,x ; (mod_row_buf[0] + 3)
4696 : c8 __ __ INY
4697 : 91 23 __ STA (SP + 0),y 
4699 : a5 49 __ LDA T3 + 0 
469b : a4 4a __ LDY T5 + 0 
469d : 99 a5 9e STA $9ea5,y ; (modplay.channel[0].effect + 0)
46a0 : bd b5 87 LDA $87b5,x ; (mod_row_buf[0] + 3)
46a3 : 99 a6 9e STA $9ea6,y ; (modplay.channel[0].eparam + 0)
46a6 : 20 d2 46 JSR $46d2 ; (apply_note.s4 + 0)
46a9 : a5 10 __ LDA P3 
46ab : 85 0f __ STA P2 
46ad : 20 5c 49 JSR $495c ; (fx_row.s4 + 0)
46b0 : 18 __ __ CLC
46b1 : a5 4a __ LDA T5 + 0 
46b3 : 69 32 __ ADC #$32
46b5 : 85 4a __ STA T5 + 0 
46b7 : 18 __ __ CLC
46b8 : a5 4b __ LDA T7 + 0 
46ba : 69 04 __ ADC #$04
46bc : 85 4b __ STA T7 + 0 
46be : e6 10 __ INC P3 
46c0 : a5 10 __ LDA P3 
46c2 : c9 04 __ CMP #$04
46c4 : 90 9f __ BCC $4665 ; (process_new_row.l7 + 0)
.s3:
46c6 : 18 __ __ CLC
46c7 : a5 23 __ LDA SP + 0 
46c9 : 69 0b __ ADC #$0b
46cb : 85 23 __ STA SP + 0 
46cd : 90 02 __ BCC $46d1 ; (process_new_row.s3 + 11)
46cf : e6 24 __ INC SP + 1 
46d1 : 60 __ __ RTS
--------------------------------------------------------------------
apply_note: ; apply_note(u8,struct S#24081*)->void
; 194, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
46d2 : a5 10 __ LDA P3 ; (ch_idx + 0)
46d4 : 0a __ __ ASL
46d5 : 18 __ __ CLC
46d6 : 65 10 __ ADC P3 ; (ch_idx + 0)
46d8 : 0a __ __ ASL
46d9 : 0a __ __ ASL
46da : 0a __ __ ASL
46db : 18 __ __ CLC
46dc : 65 10 __ ADC P3 ; (ch_idx + 0)
46de : 0a __ __ ASL
46df : 85 47 __ STA T3 + 0 
46e1 : a0 00 __ LDY #$00
46e3 : b1 11 __ LDA (P4),y ; (n + 0)
46e5 : d0 03 __ BNE $46ea ; (apply_note.s14 + 0)
46e7 : 4c 9a 47 JMP $479a ; (apply_note.s5 + 0)
.s14:
46ea : ad c1 9b LDA $9bc1 ; (modplay.num_samples + 0)
46ed : d1 11 __ CMP (P4),y ; (n + 0)
46ef : 90 f6 __ BCC $46e7 ; (apply_note.s4 + 21)
.s15:
46f1 : 84 1c __ STY ACCU + 1 
46f3 : b1 11 __ LDA (P4),y ; (n + 0)
46f5 : a6 47 __ LDX T3 + 0 
46f7 : 9d 9e 9e STA $9e9e,x ; (modplay.channel[0].sample_num + 0)
46fa : 85 1b __ STA ACCU + 0 
46fc : a9 13 __ LDA #$13
46fe : 20 62 77 JSR $7762 ; (mul16by8 + 0)
4701 : 18 __ __ CLC
4702 : a9 3e __ LDA #$3e
4704 : 65 1b __ ADC ACCU + 0 
4706 : 85 1b __ STA ACCU + 0 
4708 : a9 9c __ LDA #$9c
470a : 65 1c __ ADC ACCU + 1 
470c : 85 1c __ STA ACCU + 1 
470e : a0 11 __ LDY #$11
4710 : b1 1b __ LDA (ACCU + 0),y 
4712 : a6 47 __ LDX T3 + 0 
4714 : 9d a3 9e STA $9ea3,x ; (modplay.channel[0].volume + 0)
4717 : 88 __ __ DEY
4718 : b1 1b __ LDA (ACCU + 0),y 
471a : 9d bf 9e STA $9ebf,x ; (modplay.channel[0].needs_loop + 0)
471d : a0 01 __ LDY #$01
471f : b1 1b __ LDA (ACCU + 0),y 
4721 : 85 44 __ STA T0 + 1 
4723 : 9d c1 9e STA $9ec1,x ; (modplay.channel[0].smp_start + 1)
4726 : c8 __ __ INY
4727 : b1 1b __ LDA (ACCU + 0),y 
4729 : 85 45 __ STA T0 + 2 
472b : 9d c2 9e STA $9ec2,x ; (modplay.channel[0].smp_start + 2)
472e : c8 __ __ INY
472f : b1 1b __ LDA (ACCU + 0),y 
4731 : 85 46 __ STA T0 + 3 
4733 : 9d c3 9e STA $9ec3,x ; (modplay.channel[0].smp_start + 3)
4736 : a0 00 __ LDY #$00
4738 : b1 1b __ LDA (ACCU + 0),y 
473a : 85 43 __ STA T0 + 0 
473c : 9d c0 9e STA $9ec0,x ; (modplay.channel[0].smp_start + 0)
473f : a0 04 __ LDY #$04
4741 : b1 1b __ LDA (ACCU + 0),y 
4743 : 9d c4 9e STA $9ec4,x ; (modplay.channel[0].smp_length + 0)
4746 : c8 __ __ INY
4747 : b1 1b __ LDA (ACCU + 0),y 
4749 : 9d c5 9e STA $9ec5,x ; (modplay.channel[0].smp_length + 1)
474c : c8 __ __ INY
474d : b1 1b __ LDA (ACCU + 0),y 
474f : 9d c6 9e STA $9ec6,x ; (modplay.channel[0].smp_length + 2)
4752 : c8 __ __ INY
4753 : b1 1b __ LDA (ACCU + 0),y 
4755 : 9d c7 9e STA $9ec7,x ; (modplay.channel[0].smp_length + 3)
4758 : 18 __ __ CLC
4759 : c8 __ __ INY
475a : b1 1b __ LDA (ACCU + 0),y 
475c : 65 43 __ ADC T0 + 0 
475e : 9d c8 9e STA $9ec8,x ; (modplay.channel[0].smp_loop_a + 0)
4761 : c8 __ __ INY
4762 : b1 1b __ LDA (ACCU + 0),y 
4764 : 65 44 __ ADC T0 + 1 
4766 : 9d c9 9e STA $9ec9,x ; (modplay.channel[0].smp_loop_a + 1)
4769 : c8 __ __ INY
476a : b1 1b __ LDA (ACCU + 0),y 
476c : 65 45 __ ADC T0 + 2 
476e : 9d ca 9e STA $9eca,x ; (modplay.channel[0].smp_loop_a + 2)
4771 : c8 __ __ INY
4772 : b1 1b __ LDA (ACCU + 0),y 
4774 : 65 46 __ ADC T0 + 3 
4776 : 9d cb 9e STA $9ecb,x ; (modplay.channel[0].smp_loop_a + 3)
4779 : 18 __ __ CLC
477a : c8 __ __ INY
477b : b1 1b __ LDA (ACCU + 0),y 
477d : 65 43 __ ADC T0 + 0 
477f : 9d cc 9e STA $9ecc,x ; (modplay.channel[0].smp_loop_b + 0)
4782 : c8 __ __ INY
4783 : b1 1b __ LDA (ACCU + 0),y 
4785 : 65 44 __ ADC T0 + 1 
4787 : 9d cd 9e STA $9ecd,x ; (modplay.channel[0].smp_loop_b + 1)
478a : c8 __ __ INY
478b : b1 1b __ LDA (ACCU + 0),y 
478d : 65 45 __ ADC T0 + 2 
478f : 9d ce 9e STA $9ece,x ; (modplay.channel[0].smp_loop_b + 2)
4792 : c8 __ __ INY
4793 : b1 1b __ LDA (ACCU + 0),y 
4795 : 65 46 __ ADC T0 + 3 
4797 : 9d cf 9e STA $9ecf,x ; (modplay.channel[0].smp_loop_b + 3)
.s5:
479a : a0 01 __ LDY #$01
479c : b1 11 __ LDA (P4),y ; (n + 0)
479e : 85 0d __ STA P0 
47a0 : c8 __ __ INY
47a1 : b1 11 __ LDA (P4),y ; (n + 0)
47a3 : 85 0e __ STA P1 
47a5 : c8 __ __ INY
47a6 : 05 0d __ ORA P0 
47a8 : f0 6f __ BEQ $4819 ; (apply_note.s6 + 0)
.s10:
47aa : b1 11 __ LDA (P4),y ; (n + 0)
47ac : c9 03 __ CMP #$03
47ae : f0 69 __ BEQ $4819 ; (apply_note.s6 + 0)
.s11:
47b0 : a6 47 __ LDX T3 + 0 
47b2 : bd 9e 9e LDA $9e9e,x ; (modplay.channel[0].sample_num + 0)
47b5 : f0 1a __ BEQ $47d1 ; (apply_note.s18 + 0)
.s13:
47b7 : 85 1b __ STA ACCU + 0 
47b9 : a9 00 __ LDA #$00
47bb : 85 1c __ STA ACCU + 1 
47bd : a9 13 __ LDA #$13
47bf : 20 62 77 JSR $7762 ; (mul16by8 + 0)
47c2 : a9 50 __ LDA #$50
47c4 : 85 43 __ STA T0 + 0 
47c6 : 18 __ __ CLC
47c7 : a9 9c __ LDA #$9c
47c9 : 65 1c __ ADC ACCU + 1 
47cb : 85 44 __ STA T0 + 1 
47cd : a4 1b __ LDY ACCU + 0 
47cf : b1 43 __ LDA (T0 + 0),y 
.s18:
47d1 : 85 0f __ STA P2 
47d3 : 20 64 48 JSR $4864 ; (period_finetune.s4 + 0)
47d6 : a5 1b __ LDA ACCU + 0 
47d8 : 85 0d __ STA P0 
47da : a6 47 __ LDX T3 + 0 
47dc : 9d 9f 9e STA $9e9f,x ; (modplay.channel[0].period + 0)
47df : a5 1c __ LDA ACCU + 1 
47e1 : 85 0e __ STA P1 
47e3 : 9d a0 9e STA $9ea0,x ; (modplay.channel[0].period + 1)
47e6 : 20 13 49 JSR $4913 ; (period_to_rate.s4 + 0)
47e9 : a5 1b __ LDA ACCU + 0 
47eb : a6 47 __ LDX T3 + 0 
47ed : 9d a1 9e STA $9ea1,x ; (modplay.channel[0].rate + 0)
47f0 : a5 1c __ LDA ACCU + 1 
47f2 : 9d a2 9e STA $9ea2,x ; (modplay.channel[0].rate + 1)
47f5 : a0 00 __ LDY #$00
47f7 : b1 11 __ LDA (P4),y ; (n + 0)
47f9 : 9d b5 9e STA $9eb5,x ; (modplay.channel[0].last_note + 0)
47fc : a0 03 __ LDY #$03
47fe : b1 11 __ LDA (P4),y ; (n + 0)
4800 : c9 03 __ CMP #$03
4802 : f0 15 __ BEQ $4819 ; (apply_note.s6 + 0)
.s12:
4804 : a8 __ __ TAY
4805 : a9 00 __ LDA #$00
4807 : 9d ab 9e STA $9eab,x ; (modplay.channel[0].vib_pos + 0)
480a : 9d af 9e STA $9eaf,x ; (modplay.channel[0].trm_pos + 0)
480d : 9d b4 9e STA $9eb4,x ; (modplay.channel[0].arp_counter + 0)
4810 : a9 01 __ LDA #$01
4812 : 9d be 9e STA $9ebe,x ; (modplay.channel[0].needs_start + 0)
4815 : 98 __ __ TYA
4816 : 4c 1b 48 JMP $481b ; (apply_note.s16 + 0)
.s6:
4819 : b1 11 __ LDA (P4),y ; (n + 0)
.s16:
481b : c9 03 __ CMP #$03
481d : d0 44 __ BNE $4863 ; (apply_note.s3 + 0)
.s7:
481f : a0 01 __ LDY #$01
4821 : b1 11 __ LDA (P4),y ; (n + 0)
4823 : 85 0d __ STA P0 
4825 : c8 __ __ INY
4826 : 11 11 __ ORA (P4),y ; (n + 0)
4828 : f0 39 __ BEQ $4863 ; (apply_note.s3 + 0)
.s8:
482a : b1 11 __ LDA (P4),y ; (n + 0)
482c : 85 0e __ STA P1 
482e : a6 47 __ LDX T3 + 0 
4830 : bd 9e 9e LDA $9e9e,x ; (modplay.channel[0].sample_num + 0)
4833 : f0 1a __ BEQ $484f ; (apply_note.s17 + 0)
.s9:
4835 : 85 1b __ STA ACCU + 0 
4837 : a9 00 __ LDA #$00
4839 : 85 1c __ STA ACCU + 1 
483b : a9 13 __ LDA #$13
483d : 20 62 77 JSR $7762 ; (mul16by8 + 0)
4840 : a9 50 __ LDA #$50
4842 : 85 43 __ STA T0 + 0 
4844 : 18 __ __ CLC
4845 : a9 9c __ LDA #$9c
4847 : 65 1c __ ADC ACCU + 1 
4849 : 85 44 __ STA T0 + 1 
484b : a4 1b __ LDY ACCU + 0 
484d : b1 43 __ LDA (T0 + 0),y 
.s17:
484f : 85 0f __ STA P2 
4851 : 20 64 48 JSR $4864 ; (period_finetune.s4 + 0)
4854 : 20 0b 49 JSR $490b ; (period_to_rate@proxy + 0)
4857 : a5 1b __ LDA ACCU + 0 
4859 : a6 47 __ LDX T3 + 0 
485b : 9d a7 9e STA $9ea7,x ; (modplay.channel[0].porta_target + 0)
485e : a5 1c __ LDA ACCU + 1 
4860 : 9d a8 9e STA $9ea8,x ; (modplay.channel[0].porta_target + 1)
.s3:
4863 : 60 __ __ RTS
--------------------------------------------------------------------
period_finetune: ; period_finetune(u16,u8)->u16
;  59, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4864 : a5 0f __ LDA P2 ; (finetune_raw + 0)
4866 : c9 08 __ CMP #$08
4868 : b0 03 __ BCS $486d ; (period_finetune.s14 + 0)
486a : 4c 02 49 JMP $4902 ; (period_finetune.s5 + 0)
.s14:
486d : e9 10 __ SBC #$10
486f : 85 0f __ STA P2 ; (finetune_raw + 0)
4871 : f0 06 __ BEQ $4879 ; (period_finetune.s6 + 0)
.s7:
4873 : a5 0e __ LDA P1 ; (period + 1)
4875 : 05 0d __ ORA P0 ; (period + 0)
4877 : d0 09 __ BNE $4882 ; (period_finetune.s8 + 0)
.s6:
4879 : a5 0d __ LDA P0 ; (period + 0)
487b : 85 1b __ STA ACCU + 0 
487d : a5 0e __ LDA P1 ; (period + 1)
487f : 4c ff 48 JMP $48ff ; (period_finetune.s3 + 0)
.s8:
4882 : a5 0f __ LDA P2 ; (finetune_raw + 0)
4884 : 10 05 __ BPL $488b ; (period_finetune.s9 + 0)
.s13:
4886 : 38 __ __ SEC
4887 : a9 00 __ LDA #$00
4889 : e5 0f __ SBC P2 ; (finetune_raw + 0)
.s9:
488b : a6 0d __ LDX P0 ; (period + 0)
488d : 86 1b __ STX ACCU + 0 
488f : a6 0e __ LDX P1 ; (period + 1)
4891 : 86 1c __ STX ACCU + 1 
4893 : a2 00 __ LDX #$00
4895 : 86 1d __ STX ACCU + 2 
4897 : 86 1e __ STX ACCU + 3 
4899 : 20 9a 77 JSR $779a ; (mul32by8 + 0)
489c : a5 07 __ LDA WORK + 4 
489e : 85 1b __ STA ACCU + 0 
48a0 : a5 08 __ LDA WORK + 5 
48a2 : 85 1c __ STA ACCU + 1 
48a4 : a5 09 __ LDA WORK + 6 
48a6 : 85 1d __ STA ACCU + 2 
48a8 : a5 0a __ LDA WORK + 7 
48aa : 85 1e __ STA ACCU + 3 
48ac : a9 00 __ LDA #$00
48ae : 85 05 __ STA WORK + 2 
48b0 : 85 06 __ STA WORK + 3 
48b2 : a9 e9 __ LDA #$e9
48b4 : 85 03 __ STA WORK + 0 
48b6 : a9 02 __ LDA #$02
48b8 : 85 04 __ STA WORK + 1 
48ba : 20 d2 78 JSR $78d2 ; (mul32 + 0)
48bd : a5 07 __ LDA WORK + 4 
48bf : 85 1b __ STA ACCU + 0 
48c1 : a5 08 __ LDA WORK + 5 
48c3 : 85 1c __ STA ACCU + 1 
48c5 : a5 09 __ LDA WORK + 6 
48c7 : 85 1d __ STA ACCU + 2 
48c9 : a5 0a __ LDA WORK + 7 
48cb : 85 1e __ STA ACCU + 3 
48cd : a9 a0 __ LDA #$a0
48cf : 85 03 __ STA WORK + 0 
48d1 : a9 00 __ LDA #$00
48d3 : 85 06 __ STA WORK + 3 
48d5 : a9 86 __ LDA #$86
48d7 : 85 04 __ STA WORK + 1 
48d9 : a9 01 __ LDA #$01
48db : 85 05 __ STA WORK + 2 
48dd : 20 3a 79 JSR $793a ; (divs32 + 0)
48e0 : a5 0f __ LDA P2 ; (finetune_raw + 0)
48e2 : 30 02 __ BMI $48e6 ; (period_finetune.s10 + 0)
.s12:
48e4 : d0 0e __ BNE $48f4 ; (period_finetune.s11 + 0)
.s10:
48e6 : 18 __ __ CLC
48e7 : a5 0d __ LDA P0 ; (period + 0)
48e9 : 65 1b __ ADC ACCU + 0 
48eb : 85 1b __ STA ACCU + 0 
48ed : a5 0e __ LDA P1 ; (period + 1)
48ef : 65 1c __ ADC ACCU + 1 
48f1 : 4c ff 48 JMP $48ff ; (period_finetune.s3 + 0)
.s11:
48f4 : 38 __ __ SEC
48f5 : a5 0d __ LDA P0 ; (period + 0)
48f7 : e5 1b __ SBC ACCU + 0 
48f9 : 85 1b __ STA ACCU + 0 
48fb : a5 0e __ LDA P1 ; (period + 1)
48fd : e5 1c __ SBC ACCU + 1 
.s3:
48ff : 85 1c __ STA ACCU + 1 
4901 : 60 __ __ RTS
.s5:
4902 : aa __ __ TAX
4903 : d0 03 __ BNE $4908 ; (period_finetune.s5 + 6)
4905 : 4c 79 48 JMP $4879 ; (period_finetune.s6 + 0)
4908 : 4c 73 48 JMP $4873 ; (period_finetune.s7 + 0)
--------------------------------------------------------------------
period_to_rate@proxy: ; period_to_rate@proxy
490b : a5 1b __ LDA ACCU + 0 
490d : 85 0d __ STA P0 
490f : a5 1c __ LDA ACCU + 1 
4911 : 85 0e __ STA P1 
--------------------------------------------------------------------
period_to_rate: ; period_to_rate(u16)->u16
;  41, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4913 : a5 0e __ LDA P1 ; (period + 1)
4915 : 05 0d __ ORA P0 ; (period + 0)
4917 : f0 3e __ BEQ $4957 ; (period_to_rate.s6 + 0)
.s5:
4919 : a5 0d __ LDA P0 ; (period + 0)
491b : 85 1b __ STA ACCU + 0 
491d : a5 0e __ LDA P1 ; (period + 1)
491f : 85 1c __ STA ACCU + 1 
4921 : a9 00 __ LDA #$00
4923 : 85 1d __ STA ACCU + 2 
4925 : 85 1e __ STA ACCU + 3 
4927 : 85 05 __ STA WORK + 2 
4929 : 85 06 __ STA WORK + 3 
492b : a9 d4 __ LDA #$d4
492d : 85 03 __ STA WORK + 0 
492f : a9 30 __ LDA #$30
4931 : 85 04 __ STA WORK + 1 
4933 : 20 d2 78 JSR $78d2 ; (mul32 + 0)
4936 : a5 07 __ LDA WORK + 4 
4938 : 85 1b __ STA ACCU + 0 
493a : a5 08 __ LDA WORK + 5 
493c : 85 1c __ STA ACCU + 1 
493e : a5 09 __ LDA WORK + 6 
4940 : 85 1d __ STA ACCU + 2 
4942 : a5 0a __ LDA WORK + 7 
4944 : 85 1e __ STA ACCU + 3 
4946 : a9 00 __ LDA #$00
4948 : 85 05 __ STA WORK + 2 
494a : 85 06 __ STA WORK + 3 
494c : a9 b6 __ LDA #$b6
494e : 85 03 __ STA WORK + 0 
4950 : a9 1b __ LDA #$1b
4952 : 85 04 __ STA WORK + 1 
4954 : 4c 31 42 JMP $4231 ; (divmod32 + 0)
.s6:
4957 : 85 1b __ STA ACCU + 0 
4959 : 85 1c __ STA ACCU + 1 
.s3:
495b : 60 __ __ RTS
--------------------------------------------------------------------
fx_row: ; fx_row(u8)->void
; 242, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
495c : a4 0f __ LDY P2 ; (ch_idx + 0)
495e : be 8d 7b LDX $7b8d,y ; (__multab50L + 0)
4961 : bd a6 9e LDA $9ea6,x ; (modplay.channel[0].eparam + 0)
4964 : 85 1c __ STA ACCU + 1 
4966 : 4a __ __ LSR
4967 : 4a __ __ LSR
4968 : 4a __ __ LSR
4969 : 4a __ __ LSR
496a : 85 1b __ STA ACCU + 0 
496c : bd a5 9e LDA $9ea5,x ; (modplay.channel[0].effect + 0)
496f : c9 08 __ CMP #$08
4971 : d0 09 __ BNE $497c ; (fx_row.s5 + 0)
.s93:
4973 : a4 1b __ LDY ACCU + 0 
4975 : b9 e4 7b LDA $7be4,y ; (__multab17L + 0)
4978 : 9d a4 9e STA $9ea4,x ; (modplay.channel[0].pan + 0)
.s3:
497b : 60 __ __ RTS
.s5:
497c : a5 1c __ LDA ACCU + 1 
497e : 29 0f __ AND #$0f
4980 : 85 43 __ STA T0 + 0 
4982 : bd a5 9e LDA $9ea5,x ; (modplay.channel[0].effect + 0)
4985 : c9 08 __ CMP #$08
4987 : b0 03 __ BCS $498c ; (fx_row.s6 + 0)
4989 : 4c c3 4b JMP $4bc3 ; (fx_row.s74 + 0)
.s6:
498c : c9 0c __ CMP #$0c
498e : d0 03 __ BNE $4993 ; (fx_row.s7 + 0)
4990 : 4c b5 4b JMP $4bb5 ; (fx_row.s73 + 0)
.s7:
4993 : b0 03 __ BCS $4998 ; (fx_row.s8 + 0)
4995 : 4c 38 4b JMP $4b38 ; (fx_row.s57 + 0)
.s8:
4998 : c9 0e __ CMP #$0e
499a : f0 33 __ BEQ $49cf ; (fx_row.s16 + 0)
.s9:
499c : 90 14 __ BCC $49b2 ; (fx_row.s15 + 0)
.s10:
499e : c9 0f __ CMP #$0f
49a0 : d0 d9 __ BNE $497b ; (fx_row.s3 + 0)
.s11:
49a2 : a5 1c __ LDA ACCU + 1 
49a4 : f0 d5 __ BEQ $497b ; (fx_row.s3 + 0)
.s12:
49a6 : c9 20 __ CMP #$20
49a8 : b0 04 __ BCS $49ae ; (fx_row.s13 + 0)
.s14:
49aa : 8d 47 9c STA $9c47 ; (modplay.ticks_per_row + 0)
49ad : 60 __ __ RTS
.s13:
49ae : 8d 48 9c STA $9c48 ; (modplay.bpm + 0)
49b1 : 60 __ __ RTS
.s15:
49b2 : ae 43 9c LDX $9c43 ; (modplay.order_pos + 0)
49b5 : e8 __ __ INX
49b6 : 8e 4f 9c STX $9c4f ; (modplay.next_order + 0)
49b9 : a9 01 __ LDA #$01
49bb : 8d 4e 9c STA $9c4e ; (modplay.skip_row_advance + 0)
49be : a6 1b __ LDX ACCU + 0 
49c0 : bd d4 7b LDA $7bd4,x ; (__multab10L + 0)
49c3 : 65 43 __ ADC T0 + 0 
49c5 : c9 40 __ CMP #$40
49c7 : 90 02 __ BCC $49cb ; (fx_row.s96 + 0)
.s97:
49c9 : a9 00 __ LDA #$00
.s96:
49cb : 8d 50 9c STA $9c50 ; (modplay.next_row + 0)
49ce : 60 __ __ RTS
.s16:
49cf : a5 1b __ LDA ACCU + 0 
49d1 : c9 07 __ CMP #$07
49d3 : d0 08 __ BNE $49dd ; (fx_row.s17 + 0)
.s56:
49d5 : a5 43 __ LDA T0 + 0 
49d7 : 29 07 __ AND #$07
49d9 : 9d ae 9e STA $9eae,x ; (modplay.channel[0].trm_wave + 0)
49dc : 60 __ __ RTS
.s17:
49dd : 86 46 __ STX T3 + 0 
49df : c9 07 __ CMP #$07
49e1 : 90 6d __ BCC $4a50 ; (fx_row.s34 + 0)
.s18:
49e3 : c9 0c __ CMP #$0c
49e5 : d0 0b __ BNE $49f2 ; (fx_row.s19 + 0)
.s33:
49e7 : a5 43 __ LDA T0 + 0 
49e9 : 9d b8 9e STA $9eb8,x ; (modplay.channel[0].tick_stop + 0)
49ec : a9 00 __ LDA #$00
49ee : 9d b9 9e STA $9eb9,x ; (modplay.channel[0].tick_cur + 0)
49f1 : 60 __ __ RTS
.s19:
49f2 : 90 25 __ BCC $4a19 ; (fx_row.s25 + 0)
.s20:
49f4 : c9 0d __ CMP #$0d
49f6 : f0 0b __ BEQ $4a03 ; (fx_row.s23 + 0)
.s21:
49f8 : c9 0e __ CMP #$0e
49fa : f0 01 __ BEQ $49fd ; (fx_row.s22 + 0)
49fc : 60 __ __ RTS
.s22:
49fd : a5 43 __ LDA T0 + 0 
49ff : 8d 49 9c STA $9c49 ; (modplay.pattern_delay + 0)
4a02 : 60 __ __ RTS
.s23:
4a03 : a5 43 __ LDA T0 + 0 
4a05 : 9d b8 9e STA $9eb8,x ; (modplay.channel[0].tick_stop + 0)
4a08 : a9 00 __ LDA #$00
4a0a : 9d b9 9e STA $9eb9,x ; (modplay.channel[0].tick_cur + 0)
4a0d : bd be 9e LDA $9ebe,x ; (modplay.channel[0].needs_start + 0)
4a10 : 9d ba 9e STA $9eba,x ; (modplay.channel[0].cmd_backup + 0)
.s24:
4a13 : a9 00 __ LDA #$00
4a15 : 9d be 9e STA $9ebe,x ; (modplay.channel[0].needs_start + 0)
4a18 : 60 __ __ RTS
.s25:
4a19 : c9 0a __ CMP #$0a
4a1b : d0 0f __ BNE $4a2c ; (fx_row.s26 + 0)
.s32:
4a1d : bd a3 9e LDA $9ea3,x ; (modplay.channel[0].volume + 0)
4a20 : 18 __ __ CLC
4a21 : 65 43 __ ADC T0 + 0 
.s28:
4a23 : 20 48 4c JSR $4c48 ; (clamp_vol.s4 + 0)
4a26 : a6 46 __ LDX T3 + 0 
.s95:
4a28 : 9d a3 9e STA $9ea3,x ; (modplay.channel[0].volume + 0)
4a2b : 60 __ __ RTS
.s26:
4a2c : b0 1a __ BCS $4a48 ; (fx_row.s27 + 0)
.s30:
4a2e : c9 09 __ CMP #$09
4a30 : f0 01 __ BEQ $4a33 ; (fx_row.s31 + 0)
4a32 : 60 __ __ RTS
.s31:
4a33 : a5 43 __ LDA T0 + 0 
4a35 : 9d b8 9e STA $9eb8,x ; (modplay.channel[0].tick_stop + 0)
4a38 : a9 00 __ LDA #$00
4a3a : 9d b9 9e STA $9eb9,x ; (modplay.channel[0].tick_cur + 0)
4a3d : bd be 9e LDA $9ebe,x ; (modplay.channel[0].needs_start + 0)
4a40 : 9d ba 9e STA $9eba,x ; (modplay.channel[0].cmd_backup + 0)
4a43 : a5 43 __ LDA T0 + 0 
4a45 : d0 cc __ BNE $4a13 ; (fx_row.s24 + 0)
4a47 : 60 __ __ RTS
.s27:
4a48 : bd a3 9e LDA $9ea3,x ; (modplay.channel[0].volume + 0)
4a4b : e5 43 __ SBC T0 + 0 
4a4d : 4c 23 4a JMP $4a23 ; (fx_row.s28 + 0)
.s34:
4a50 : c9 04 __ CMP #$04
4a52 : d0 08 __ BNE $4a5c ; (fx_row.s35 + 0)
.s55:
4a54 : a5 43 __ LDA T0 + 0 
4a56 : 29 07 __ AND #$07
4a58 : 9d aa 9e STA $9eaa,x ; (modplay.channel[0].vib_wave + 0)
4a5b : 60 __ __ RTS
.s35:
4a5c : 90 65 __ BCC $4ac3 ; (fx_row.s46 + 0)
.s36:
4a5e : c9 05 __ CMP #$05
4a60 : d0 2f __ BNE $4a91 ; (fx_row.s37 + 0)
.s43:
4a62 : bd 9e 9e LDA $9e9e,x ; (modplay.channel[0].sample_num + 0)
4a65 : d0 01 __ BNE $4a68 ; (fx_row.s44 + 0)
4a67 : 60 __ __ RTS
.s44:
4a68 : ad c1 9b LDA $9bc1 ; (modplay.num_samples + 0)
4a6b : dd 9e 9e CMP $9e9e,x ; (modplay.channel[0].sample_num + 0)
4a6e : b0 01 __ BCS $4a71 ; (fx_row.s45 + 0)
4a70 : 60 __ __ RTS
.s45:
4a71 : bd 9e 9e LDA $9e9e,x ; (modplay.channel[0].sample_num + 0)
4a74 : 85 1b __ STA ACCU + 0 
4a76 : a9 00 __ LDA #$00
4a78 : 85 1c __ STA ACCU + 1 
4a7a : a9 13 __ LDA #$13
4a7c : 20 62 77 JSR $7762 ; (mul16by8 + 0)
4a7f : a9 50 __ LDA #$50
4a81 : 85 44 __ STA T1 + 0 
4a83 : 18 __ __ CLC
4a84 : a9 9c __ LDA #$9c
4a86 : 65 1c __ ADC ACCU + 1 
4a88 : 85 45 __ STA T1 + 1 
4a8a : a5 43 __ LDA T0 + 0 
4a8c : a4 1b __ LDY ACCU + 0 
4a8e : 91 44 __ STA (T1 + 0),y 
4a90 : 60 __ __ RTS
.s37:
4a91 : a5 43 __ LDA T0 + 0 
4a93 : d0 07 __ BNE $4a9c ; (fx_row.s39 + 0)
.s38:
4a95 : ad 45 9c LDA $9c45 ; (modplay.row + 0)
4a98 : 9d b6 9e STA $9eb6,x ; (modplay.channel[0].loop_row + 0)
4a9b : 60 __ __ RTS
.s39:
4a9c : bd b7 9e LDA $9eb7,x ; (modplay.channel[0].loop_count + 0)
4a9f : f0 1a __ BEQ $4abb ; (fx_row.s40 + 0)
.s42:
4aa1 : 38 __ __ SEC
4aa2 : e9 01 __ SBC #$01
4aa4 : 9d b7 9e STA $9eb7,x ; (modplay.channel[0].loop_count + 0)
4aa7 : d0 01 __ BNE $4aaa ; (fx_row.s41 + 0)
4aa9 : 60 __ __ RTS
.s41:
4aaa : a9 01 __ LDA #$01
4aac : 8d 4e 9c STA $9c4e ; (modplay.skip_row_advance + 0)
4aaf : ad 43 9c LDA $9c43 ; (modplay.order_pos + 0)
4ab2 : 8d 4f 9c STA $9c4f ; (modplay.next_order + 0)
4ab5 : bd b6 9e LDA $9eb6,x ; (modplay.channel[0].loop_row + 0)
4ab8 : 4c cb 49 JMP $49cb ; (fx_row.s96 + 0)
.s40:
4abb : a5 43 __ LDA T0 + 0 
4abd : 9d b7 9e STA $9eb7,x ; (modplay.channel[0].loop_count + 0)
4ac0 : 4c aa 4a JMP $4aaa ; (fx_row.s41 + 0)
.s46:
4ac3 : c9 02 __ CMP #$02
4ac5 : f0 4e __ BEQ $4b15 ; (fx_row.s54 + 0)
.s47:
4ac7 : 90 01 __ BCC $4aca ; (fx_row.s48 + 0)
4ac9 : 60 __ __ RTS
.s48:
4aca : c9 01 __ CMP #$01
4acc : f0 01 __ BEQ $4acf ; (fx_row.s49 + 0)
4ace : 60 __ __ RTS
.s49:
4acf : bd a0 9e LDA $9ea0,x ; (modplay.channel[0].period + 1)
4ad2 : d0 09 __ BNE $4add ; (fx_row.s52 + 0)
.s53:
4ad4 : a9 71 __ LDA #$71
4ad6 : dd 9f 9e CMP $9e9f,x ; (modplay.channel[0].period + 0)
4ad9 : a4 46 __ LDY T3 + 0 
4adb : b0 1e __ BCS $4afb ; (fx_row.s50 + 0)
.s52:
4add : bd 9f 9e LDA $9e9f,x ; (modplay.channel[0].period + 0)
4ae0 : 38 __ __ SEC
4ae1 : e5 43 __ SBC T0 + 0 
4ae3 : 85 0d __ STA P0 
4ae5 : bd a0 9e LDA $9ea0,x ; (modplay.channel[0].period + 1)
4ae8 : e9 00 __ SBC #$00
4aea : 85 0e __ STA P1 
4aec : 20 18 4c JSR $4c18 ; (clamp_period.s4 + 0)
4aef : a5 1b __ LDA ACCU + 0 
4af1 : a4 46 __ LDY T3 + 0 
4af3 : 99 9f 9e STA $9e9f,y ; (modplay.channel[0].period + 0)
4af6 : a5 1c __ LDA ACCU + 1 
4af8 : 99 a0 9e STA $9ea0,y ; (modplay.channel[0].period + 1)
.s50:
4afb : b9 9f 9e LDA $9e9f,y ; (modplay.channel[0].period + 0)
4afe : 85 0d __ STA P0 
4b00 : b9 a0 9e LDA $9ea0,y ; (modplay.channel[0].period + 1)
.s51:
4b03 : 85 0e __ STA P1 
4b05 : 20 13 49 JSR $4913 ; (period_to_rate.s4 + 0)
4b08 : a5 1b __ LDA ACCU + 0 
4b0a : a6 46 __ LDX T3 + 0 
4b0c : 9d a1 9e STA $9ea1,x ; (modplay.channel[0].rate + 0)
4b0f : a5 1c __ LDA ACCU + 1 
4b11 : 9d a2 9e STA $9ea2,x ; (modplay.channel[0].rate + 1)
4b14 : 60 __ __ RTS
.s54:
4b15 : bd 9f 9e LDA $9e9f,x ; (modplay.channel[0].period + 0)
4b18 : 18 __ __ CLC
4b19 : 65 43 __ ADC T0 + 0 
4b1b : 85 0d __ STA P0 
4b1d : bd a0 9e LDA $9ea0,x ; (modplay.channel[0].period + 1)
4b20 : 69 00 __ ADC #$00
4b22 : 85 0e __ STA P1 
4b24 : 20 18 4c JSR $4c18 ; (clamp_period.s4 + 0)
4b27 : a5 1b __ LDA ACCU + 0 
4b29 : 85 0d __ STA P0 
4b2b : a6 46 __ LDX T3 + 0 
4b2d : 9d 9f 9e STA $9e9f,x ; (modplay.channel[0].period + 0)
4b30 : a5 1c __ LDA ACCU + 1 
4b32 : 9d a0 9e STA $9ea0,x ; (modplay.channel[0].period + 1)
4b35 : 4c 03 4b JMP $4b03 ; (fx_row.s51 + 0)
.s57:
4b38 : c9 0a __ CMP #$0a
4b3a : f0 6e __ BEQ $4baa ; (fx_row.s71 + 0)
.s58:
4b3c : b0 5f __ BCS $4b9d ; (fx_row.s59 + 0)
.s60:
4b3e : a5 1c __ LDA ACCU + 1 
4b40 : d0 01 __ BNE $4b43 ; (fx_row.s61 + 0)
4b42 : 60 __ __ RTS
.s61:
4b43 : bd c7 9e LDA $9ec7,x ; (modplay.channel[0].smp_length + 3)
4b46 : d0 29 __ BNE $4b71 ; (fx_row.s63 + 0)
.s68:
4b48 : bd c6 9e LDA $9ec6,x ; (modplay.channel[0].smp_length + 2)
4b4b : d0 0b __ BNE $4b58 ; (fx_row.s62 + 0)
.s69:
4b4d : bd c5 9e LDA $9ec5,x ; (modplay.channel[0].smp_length + 1)
4b50 : d0 06 __ BNE $4b58 ; (fx_row.s62 + 0)
.s70:
4b52 : dd c4 9e CMP $9ec4,x ; (modplay.channel[0].smp_length + 0)
4b55 : 90 01 __ BCC $4b58 ; (fx_row.s62 + 0)
4b57 : 60 __ __ RTS
.s62:
4b58 : bd c7 9e LDA $9ec7,x ; (modplay.channel[0].smp_length + 3)
4b5b : d0 14 __ BNE $4b71 ; (fx_row.s63 + 0)
.s64:
4b5d : bd c6 9e LDA $9ec6,x ; (modplay.channel[0].smp_length + 2)
4b60 : d0 0f __ BNE $4b71 ; (fx_row.s63 + 0)
.s65:
4b62 : a5 1c __ LDA ACCU + 1 
4b64 : dd c5 9e CMP $9ec5,x ; (modplay.channel[0].smp_length + 1)
4b67 : d0 05 __ BNE $4b6e ; (fx_row.s67 + 0)
.s66:
4b69 : a9 00 __ LDA #$00
4b6b : dd c4 9e CMP $9ec4,x ; (modplay.channel[0].smp_length + 0)
.s67:
4b6e : 90 01 __ BCC $4b71 ; (fx_row.s63 + 0)
4b70 : 60 __ __ RTS
.s63:
4b71 : bd c5 9e LDA $9ec5,x ; (modplay.channel[0].smp_length + 1)
4b74 : 38 __ __ SEC
4b75 : e5 1c __ SBC ACCU + 1 
4b77 : 9d c5 9e STA $9ec5,x ; (modplay.channel[0].smp_length + 1)
4b7a : bd c6 9e LDA $9ec6,x ; (modplay.channel[0].smp_length + 2)
4b7d : e9 00 __ SBC #$00
4b7f : 9d c6 9e STA $9ec6,x ; (modplay.channel[0].smp_length + 2)
4b82 : b0 03 __ BCS $4b87 ; (fx_row.s99 + 0)
.s98:
4b84 : de c7 9e DEC $9ec7,x ; (modplay.channel[0].smp_length + 3)
.s99:
4b87 : bd c1 9e LDA $9ec1,x ; (modplay.channel[0].smp_start + 1)
4b8a : 18 __ __ CLC
4b8b : 65 1c __ ADC ACCU + 1 
4b8d : 9d c1 9e STA $9ec1,x ; (modplay.channel[0].smp_start + 1)
4b90 : b0 01 __ BCS $4b93 ; (fx_row.s101 + 0)
4b92 : 60 __ __ RTS
.s101:
4b93 : fe c2 9e INC $9ec2,x ; (modplay.channel[0].smp_start + 2)
4b96 : f0 01 __ BEQ $4b99 ; (fx_row.s100 + 0)
4b98 : 60 __ __ RTS
.s100:
4b99 : fe c3 9e INC $9ec3,x ; (modplay.channel[0].smp_start + 3)
4b9c : 60 __ __ RTS
.s59:
4b9d : a9 01 __ LDA #$01
4b9f : 8d 4e 9c STA $9c4e ; (modplay.skip_row_advance + 0)
4ba2 : a5 1c __ LDA ACCU + 1 
4ba4 : 8d 4f 9c STA $9c4f ; (modplay.next_order + 0)
4ba7 : 4c c9 49 JMP $49c9 ; (fx_row.s97 + 0)
.s71:
4baa : a5 1b __ LDA ACCU + 0 
4bac : d0 03 __ BNE $4bb1 ; (fx_row.s94 + 0)
.s72:
4bae : 38 __ __ SEC
4baf : e5 43 __ SBC T0 + 0 
.s94:
4bb1 : 9d b3 9e STA $9eb3,x ; (modplay.channel[0].volslide + 0)
4bb4 : 60 __ __ RTS
.s73:
4bb5 : a9 40 __ LDA #$40
4bb7 : c5 1c __ CMP ACCU + 1 
4bb9 : b0 03 __ BCS $4bbe ; (fx_row.s29 + 0)
4bbb : 4c 28 4a JMP $4a28 ; (fx_row.s95 + 0)
.s29:
4bbe : a5 1c __ LDA ACCU + 1 
4bc0 : 4c 28 4a JMP $4a28 ; (fx_row.s95 + 0)
.s74:
4bc3 : c9 04 __ CMP #$04
4bc5 : f0 41 __ BEQ $4c08 ; (fx_row.s89 + 0)
.s75:
4bc7 : 90 23 __ BCC $4bec ; (fx_row.s83 + 0)
.s76:
4bc9 : c9 06 __ CMP #$06
4bcb : f0 dd __ BEQ $4baa ; (fx_row.s71 + 0)
.s77:
4bcd : b0 07 __ BCS $4bd6 ; (fx_row.s78 + 0)
.s82:
4bcf : a9 00 __ LDA #$00
4bd1 : 9d be 9e STA $9ebe,x ; (modplay.channel[0].needs_start + 0)
4bd4 : 90 d4 __ BCC $4baa ; (fx_row.s71 + 0)
.s78:
4bd6 : bd a3 9e LDA $9ea3,x ; (modplay.channel[0].volume + 0)
4bd9 : 9d b2 9e STA $9eb2,x ; (modplay.channel[0].trm_basvol + 0)
4bdc : a5 43 __ LDA T0 + 0 
4bde : f0 03 __ BEQ $4be3 ; (fx_row.s79 + 0)
.s81:
4be0 : 9d b0 9e STA $9eb0,x ; (modplay.channel[0].trm_depth + 0)
.s79:
4be3 : a5 1b __ LDA ACCU + 0 
4be5 : d0 01 __ BNE $4be8 ; (fx_row.s80 + 0)
4be7 : 60 __ __ RTS
.s80:
4be8 : 9d b1 9e STA $9eb1,x ; (modplay.channel[0].trm_speed + 0)
4beb : 60 __ __ RTS
.s83:
4bec : a8 __ __ TAY
4bed : d0 04 __ BNE $4bf3 ; (fx_row.s84 + 0)
.s88:
4bef : 9d b4 9e STA $9eb4,x ; (modplay.channel[0].arp_counter + 0)
4bf2 : 60 __ __ RTS
.s84:
4bf3 : a9 02 __ LDA #$02
4bf5 : dd a5 9e CMP $9ea5,x ; (modplay.channel[0].effect + 0)
4bf8 : b0 05 __ BCS $4bff ; (fx_row.s87 + 0)
.s85:
4bfa : a9 00 __ LDA #$00
4bfc : 9d be 9e STA $9ebe,x ; (modplay.channel[0].needs_start + 0)
.s87:
4bff : a5 1c __ LDA ACCU + 1 
4c01 : d0 01 __ BNE $4c04 ; (fx_row.s86 + 0)
4c03 : 60 __ __ RTS
.s86:
4c04 : 9d a9 9e STA $9ea9,x ; (modplay.channel[0].porta_speed + 0)
4c07 : 60 __ __ RTS
.s89:
4c08 : a5 43 __ LDA T0 + 0 
4c0a : f0 03 __ BEQ $4c0f ; (fx_row.s90 + 0)
.s92:
4c0c : 9d ac 9e STA $9eac,x ; (modplay.channel[0].vib_depth + 0)
.s90:
4c0f : a5 1b __ LDA ACCU + 0 
4c11 : d0 01 __ BNE $4c14 ; (fx_row.s91 + 0)
4c13 : 60 __ __ RTS
.s91:
4c14 : 9d ad 9e STA $9ead,x ; (modplay.channel[0].vib_speed + 0)
4c17 : 60 __ __ RTS
--------------------------------------------------------------------
clamp_period: ; clamp_period(u16)->u16
; 144, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4c18 : a5 0e __ LDA P1 ; (p + 1)
4c1a : d0 0f __ BNE $4c2b ; (clamp_period.s5 + 0)
.s11:
4c1c : a5 0d __ LDA P0 ; (p + 0)
4c1e : c9 71 __ CMP #$71
4c20 : b0 09 __ BCS $4c2b ; (clamp_period.s5 + 0)
.s10:
4c22 : a9 00 __ LDA #$00
4c24 : a0 71 __ LDY #$71
.s3:
4c26 : 84 1b __ STY ACCU + 0 
4c28 : 85 1c __ STA ACCU + 1 
4c2a : 60 __ __ RTS
.s5:
4c2b : a9 03 __ LDA #$03
4c2d : c5 0e __ CMP P1 ; (p + 1)
4c2f : f0 04 __ BEQ $4c35 ; (clamp_period.s8 + 0)
.s9:
4c31 : 90 08 __ BCC $4c3b ; (clamp_period.s7 + 0)
4c33 : b0 0c __ BCS $4c41 ; (clamp_period.s6 + 0)
.s8:
4c35 : a5 0d __ LDA P0 ; (p + 0)
4c37 : c9 59 __ CMP #$59
4c39 : 90 06 __ BCC $4c41 ; (clamp_period.s6 + 0)
.s7:
4c3b : a9 03 __ LDA #$03
4c3d : a0 58 __ LDY #$58
4c3f : d0 e5 __ BNE $4c26 ; (clamp_period.s3 + 0)
.s6:
4c41 : a5 0e __ LDA P1 ; (p + 1)
4c43 : a4 0d __ LDY P0 ; (p + 0)
4c45 : 4c 26 4c JMP $4c26 ; (clamp_period.s3 + 0)
--------------------------------------------------------------------
clamp_vol: ; clamp_vol(i8)->u8
; 132, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4c48 : 85 1b __ STA ACCU + 0 
4c4a : aa __ __ TAX
4c4b : 10 03 __ BPL $4c50 ; (clamp_vol.s5 + 0)
.s7:
4c4d : a9 00 __ LDA #$00
.s3:
4c4f : 60 __ __ RTS
.s5:
4c50 : a9 40 __ LDA #$40
4c52 : c5 1b __ CMP ACCU + 0 
4c54 : 90 f9 __ BCC $4c4f ; (clamp_vol.s3 + 0)
.s6:
4c56 : a5 1b __ LDA ACCU + 0 
4c58 : 60 __ __ RTS
--------------------------------------------------------------------
fx_tick: ; fx_tick(u8)->void
; 433, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4c59 : a4 0f __ LDY P2 ; (ch_idx + 0)
4c5b : be 8d 7b LDX $7b8d,y ; (__multab50L + 0)
4c5e : 86 45 __ STX T3 + 0 
4c60 : bd a5 9e LDA $9ea5,x ; (modplay.channel[0].effect + 0)
4c63 : c9 05 __ CMP #$05
4c65 : d0 05 __ BNE $4c6c ; (fx_tick.s6 + 0)
.s5:
4c67 : a0 01 __ LDY #$01
4c69 : 4c ce 4d JMP $4dce ; (fx_tick.s34 + 0)
.s6:
4c6c : 85 47 __ STA T5 + 0 
4c6e : c9 05 __ CMP #$05
4c70 : b0 03 __ BCS $4c75 ; (fx_tick.s7 + 0)
4c72 : 4c ab 4d JMP $4dab ; (fx_tick.s31 + 0)
.s7:
4c75 : c9 0a __ CMP #$0a
4c77 : d0 03 __ BNE $4c7c ; (fx_tick.s8 + 0)
4c79 : 4c 9c 4d JMP $4d9c ; (fx_tick.s29 + 0)
.s8:
4c7c : 90 4d __ BCC $4ccb ; (fx_tick.s20 + 0)
.s9:
4c7e : c9 0e __ CMP #$0e
4c80 : d0 21 __ BNE $4ca3 ; (fx_tick.s3 + 0)
.s10:
4c82 : bd a6 9e LDA $9ea6,x ; (modplay.channel[0].eparam + 0)
4c85 : 4a __ __ LSR
4c86 : 4a __ __ LSR
4c87 : 4a __ __ LSR
4c88 : 4a __ __ LSR
4c89 : c9 0c __ CMP #$0c
4c8b : f0 2d __ BEQ $4cba ; (fx_tick.s18 + 0)
.s11:
4c8d : 90 15 __ BCC $4ca4 ; (fx_tick.s15 + 0)
.s12:
4c8f : c9 0d __ CMP #$0d
4c91 : d0 10 __ BNE $4ca3 ; (fx_tick.s3 + 0)
.s13:
4c93 : fe b9 9e INC $9eb9,x ; (modplay.channel[0].tick_cur + 0)
4c96 : bd b9 9e LDA $9eb9,x ; (modplay.channel[0].tick_cur + 0)
4c99 : dd b8 9e CMP $9eb8,x ; (modplay.channel[0].tick_stop + 0)
4c9c : d0 05 __ BNE $4ca3 ; (fx_tick.s3 + 0)
.s14:
4c9e : a9 01 __ LDA #$01
4ca0 : 9d be 9e STA $9ebe,x ; (modplay.channel[0].needs_start + 0)
.s3:
4ca3 : 60 __ __ RTS
.s15:
4ca4 : c9 09 __ CMP #$09
4ca6 : d0 fb __ BNE $4ca3 ; (fx_tick.s3 + 0)
.s16:
4ca8 : fe b9 9e INC $9eb9,x ; (modplay.channel[0].tick_cur + 0)
4cab : bd b9 9e LDA $9eb9,x ; (modplay.channel[0].tick_cur + 0)
4cae : dd b8 9e CMP $9eb8,x ; (modplay.channel[0].tick_stop + 0)
4cb1 : 90 f0 __ BCC $4ca3 ; (fx_tick.s3 + 0)
.s17:
4cb3 : a9 00 __ LDA #$00
4cb5 : 9d b9 9e STA $9eb9,x ; (modplay.channel[0].tick_cur + 0)
4cb8 : b0 e4 __ BCS $4c9e ; (fx_tick.s14 + 0)
.s18:
4cba : fe b9 9e INC $9eb9,x ; (modplay.channel[0].tick_cur + 0)
4cbd : bd b9 9e LDA $9eb9,x ; (modplay.channel[0].tick_cur + 0)
4cc0 : dd b8 9e CMP $9eb8,x ; (modplay.channel[0].tick_stop + 0)
4cc3 : 90 de __ BCC $4ca3 ; (fx_tick.s3 + 0)
.s19:
4cc5 : a9 00 __ LDA #$00
.s60:
4cc7 : 9d a3 9e STA $9ea3,x ; (modplay.channel[0].volume + 0)
4cca : 60 __ __ RTS
.s20:
4ccb : c9 06 __ CMP #$06
4ccd : f0 58 __ BEQ $4d27 ; (fx_tick.s26 + 0)
.s21:
4ccf : c9 07 __ CMP #$07
4cd1 : d0 d0 __ BNE $4ca3 ; (fx_tick.s3 + 0)
.s22:
4cd3 : bd ae 9e LDA $9eae,x ; (modplay.channel[0].trm_wave + 0)
4cd6 : 85 0d __ STA P0 
4cd8 : bd af 9e LDA $9eaf,x ; (modplay.channel[0].trm_pos + 0)
4cdb : 85 0e __ STA P1 
4cdd : 20 af 4e JSR $4eaf ; (wave_value.s4 + 0)
4ce0 : aa __ __ TAX
4ce1 : a4 45 __ LDY T3 + 0 
4ce3 : b9 b0 9e LDA $9eb0,y ; (modplay.channel[0].trm_depth + 0)
4ce6 : 85 1b __ STA ACCU + 0 
4ce8 : a9 00 __ LDA #$00
4cea : 85 1c __ STA ACCU + 1 
4cec : 8a __ __ TXA
4ced : 20 62 77 JSR $7762 ; (mul16by8 + 0)
4cf0 : a5 1c __ LDA ACCU + 1 
4cf2 : 85 43 __ STA T0 + 0 
4cf4 : a5 1b __ LDA ACCU + 0 
4cf6 : 0a __ __ ASL
4cf7 : 26 43 __ ROL T0 + 0 
4cf9 : 0a __ __ ASL
4cfa : 26 43 __ ROL T0 + 0 
4cfc : a5 0e __ LDA P1 
4cfe : a4 45 __ LDY T3 + 0 
4d00 : 29 10 __ AND #$10
4d02 : d0 09 __ BNE $4d0d ; (fx_tick.s25 + 0)
.s23:
4d04 : 18 __ __ CLC
4d05 : a5 43 __ LDA T0 + 0 
4d07 : 79 b2 9e ADC $9eb2,y ; (modplay.channel[0].trm_basvol + 0)
4d0a : 4c 13 4d JMP $4d13 ; (fx_tick.s24 + 0)
.s25:
4d0d : b9 b2 9e LDA $9eb2,y ; (modplay.channel[0].trm_basvol + 0)
4d10 : 38 __ __ SEC
4d11 : e5 43 __ SBC T0 + 0 
.s24:
4d13 : 20 48 4c JSR $4c48 ; (clamp_vol.s4 + 0)
4d16 : a6 45 __ LDX T3 + 0 
4d18 : 9d a3 9e STA $9ea3,x ; (modplay.channel[0].volume + 0)
4d1b : bd b1 9e LDA $9eb1,x ; (modplay.channel[0].trm_speed + 0)
4d1e : 18 __ __ CLC
4d1f : 65 0e __ ADC P1 
4d21 : 29 3f __ AND #$3f
4d23 : 9d af 9e STA $9eaf,x ; (modplay.channel[0].trm_pos + 0)
4d26 : 60 __ __ RTS
.s26:
4d27 : bd aa 9e LDA $9eaa,x ; (modplay.channel[0].vib_wave + 0)
4d2a : 85 0d __ STA P0 
4d2c : bd ab 9e LDA $9eab,x ; (modplay.channel[0].vib_pos + 0)
4d2f : 85 0e __ STA P1 
4d31 : 20 af 4e JSR $4eaf ; (wave_value.s4 + 0)
4d34 : aa __ __ TAX
4d35 : a4 45 __ LDY T3 + 0 
4d37 : b9 ac 9e LDA $9eac,y ; (modplay.channel[0].vib_depth + 0)
4d3a : 85 1b __ STA ACCU + 0 
4d3c : a9 00 __ LDA #$00
4d3e : 85 1c __ STA ACCU + 1 
4d40 : 8a __ __ TXA
4d41 : 20 62 77 JSR $7762 ; (mul16by8 + 0)
4d44 : a5 1c __ LDA ACCU + 1 
4d46 : 06 1b __ ASL ACCU + 0 
4d48 : 2a __ __ ROL
4d49 : 85 43 __ STA T0 + 0 
4d4b : a9 00 __ LDA #$00
4d4d : 2a __ __ ROL
4d4e : 85 44 __ STA T0 + 1 
4d50 : a5 0e __ LDA P1 
4d52 : 85 46 __ STA T4 + 0 
4d54 : a4 45 __ LDY T3 + 0 
4d56 : 29 10 __ AND #$10
4d58 : d0 0f __ BNE $4d69 ; (fx_tick.s30 + 0)
.s27:
4d5a : b9 9f 9e LDA $9e9f,y ; (modplay.channel[0].period + 0)
4d5d : 65 43 __ ADC T0 + 0 
4d5f : 85 0d __ STA P0 
4d61 : b9 a0 9e LDA $9ea0,y ; (modplay.channel[0].period + 1)
4d64 : 65 44 __ ADC T0 + 1 
4d66 : 4c 76 4d JMP $4d76 ; (fx_tick.s28 + 0)
.s30:
4d69 : b9 9f 9e LDA $9e9f,y ; (modplay.channel[0].period + 0)
4d6c : 38 __ __ SEC
4d6d : e5 43 __ SBC T0 + 0 
4d6f : 85 0d __ STA P0 
4d71 : b9 a0 9e LDA $9ea0,y ; (modplay.channel[0].period + 1)
4d74 : e5 44 __ SBC T0 + 1 
.s28:
4d76 : 85 0e __ STA P1 
4d78 : 20 18 4c JSR $4c18 ; (clamp_period.s4 + 0)
4d7b : 20 0b 49 JSR $490b ; (period_to_rate@proxy + 0)
4d7e : a5 1b __ LDA ACCU + 0 
4d80 : a6 45 __ LDX T3 + 0 
4d82 : 9d a1 9e STA $9ea1,x ; (modplay.channel[0].rate + 0)
4d85 : a5 1c __ LDA ACCU + 1 
4d87 : 9d a2 9e STA $9ea2,x ; (modplay.channel[0].rate + 1)
4d8a : bd ad 9e LDA $9ead,x ; (modplay.channel[0].vib_speed + 0)
4d8d : 18 __ __ CLC
4d8e : 65 46 __ ADC T4 + 0 
4d90 : 29 3f __ AND #$3f
4d92 : 9d ab 9e STA $9eab,x ; (modplay.channel[0].vib_pos + 0)
4d95 : a5 47 __ LDA T5 + 0 
4d97 : c9 06 __ CMP #$06
4d99 : f0 01 __ BEQ $4d9c ; (fx_tick.s29 + 0)
4d9b : 60 __ __ RTS
.s29:
4d9c : bd a3 9e LDA $9ea3,x ; (modplay.channel[0].volume + 0)
4d9f : 18 __ __ CLC
4da0 : 7d b3 9e ADC $9eb3,x ; (modplay.channel[0].volslide + 0)
4da3 : 20 48 4c JSR $4c48 ; (clamp_vol.s4 + 0)
4da6 : a6 45 __ LDX T3 + 0 
4da8 : 4c c7 4c JMP $4cc7 ; (fx_tick.s60 + 0)
.s31:
4dab : c9 02 __ CMP #$02
4dad : d0 11 __ BNE $4dc0 ; (fx_tick.s32 + 0)
.s59:
4daf : bd a9 9e LDA $9ea9,x ; (modplay.channel[0].porta_speed + 0)
4db2 : 18 __ __ CLC
4db3 : 7d 9f 9e ADC $9e9f,x ; (modplay.channel[0].period + 0)
4db6 : 85 0d __ STA P0 
4db8 : bd a0 9e LDA $9ea0,x ; (modplay.channel[0].period + 1)
4dbb : 69 00 __ ADC #$00
4dbd : 4c 8a 4e JMP $4e8a ; (fx_tick.s57 + 0)
.s32:
4dc0 : b0 03 __ BCS $4dc5 ; (fx_tick.s33 + 0)
4dc2 : 4c 5c 4e JMP $4e5c ; (fx_tick.s51 + 0)
.s33:
4dc5 : a0 00 __ LDY #$00
4dc7 : c9 03 __ CMP #$03
4dc9 : f0 03 __ BEQ $4dce ; (fx_tick.s34 + 0)
4dcb : 4c 27 4d JMP $4d27 ; (fx_tick.s26 + 0)
.s34:
4dce : bd a7 9e LDA $9ea7,x ; (modplay.channel[0].porta_target + 0)
4dd1 : 85 43 __ STA T0 + 0 
4dd3 : bd a8 9e LDA $9ea8,x ; (modplay.channel[0].porta_target + 1)
4dd6 : 85 44 __ STA T0 + 1 
4dd8 : 05 43 __ ORA T0 + 0 
4dda : f0 58 __ BEQ $4e34 ; (fx_tick.s35 + 0)
.s36:
4ddc : bd a2 9e LDA $9ea2,x ; (modplay.channel[0].rate + 1)
4ddf : 85 1c __ STA ACCU + 1 
4de1 : c5 44 __ CMP T0 + 1 
4de3 : d0 09 __ BNE $4dee ; (fx_tick.s37 + 0)
.s50:
4de5 : a5 43 __ LDA T0 + 0 
4de7 : dd a1 9e CMP $9ea1,x ; (modplay.channel[0].rate + 0)
4dea : f0 48 __ BEQ $4e34 ; (fx_tick.s35 + 0)
.s61:
4dec : a5 1c __ LDA ACCU + 1 
.s37:
4dee : c5 44 __ CMP T0 + 1 
4df0 : d0 05 __ BNE $4df7 ; (fx_tick.s49 + 0)
.s48:
4df2 : bd a1 9e LDA $9ea1,x ; (modplay.channel[0].rate + 0)
4df5 : c5 43 __ CMP T0 + 0 
.s49:
4df7 : 90 42 __ BCC $4e3b ; (fx_tick.s45 + 0)
.s38:
4df9 : a5 1c __ LDA ACCU + 1 
4dfb : d0 11 __ BNE $4e0e ; (fx_tick.s43 + 0)
.s44:
4dfd : bd a9 9e LDA $9ea9,x ; (modplay.channel[0].porta_speed + 0)
4e00 : dd a1 9e CMP $9ea1,x ; (modplay.channel[0].rate + 0)
4e03 : 90 09 __ BCC $4e0e ; (fx_tick.s43 + 0)
.s39:
4e05 : a5 43 __ LDA T0 + 0 
4e07 : 9d a1 9e STA $9ea1,x ; (modplay.channel[0].rate + 0)
4e0a : a5 44 __ LDA T0 + 1 
4e0c : b0 0e __ BCS $4e1c ; (fx_tick.s40 + 0)
.s43:
4e0e : bd a1 9e LDA $9ea1,x ; (modplay.channel[0].rate + 0)
4e11 : 38 __ __ SEC
4e12 : fd a9 9e SBC $9ea9,x ; (modplay.channel[0].porta_speed + 0)
4e15 : 9d a1 9e STA $9ea1,x ; (modplay.channel[0].rate + 0)
4e18 : a5 1c __ LDA ACCU + 1 
4e1a : e9 00 __ SBC #$00
.s40:
4e1c : 9d a2 9e STA $9ea2,x ; (modplay.channel[0].rate + 1)
4e1f : c5 44 __ CMP T0 + 1 
4e21 : d0 05 __ BNE $4e28 ; (fx_tick.s47 + 0)
.s42:
4e23 : bd a1 9e LDA $9ea1,x ; (modplay.channel[0].rate + 0)
4e26 : c5 43 __ CMP T0 + 0 
.s47:
4e28 : b0 0a __ BCS $4e34 ; (fx_tick.s35 + 0)
.s41:
4e2a : a5 43 __ LDA T0 + 0 
4e2c : 9d a1 9e STA $9ea1,x ; (modplay.channel[0].rate + 0)
4e2f : a5 44 __ LDA T0 + 1 
4e31 : 9d a2 9e STA $9ea2,x ; (modplay.channel[0].rate + 1)
.s35:
4e34 : 98 __ __ TYA
4e35 : f0 03 __ BEQ $4e3a ; (fx_tick.s35 + 6)
4e37 : 4c 9c 4d JMP $4d9c ; (fx_tick.s29 + 0)
4e3a : 60 __ __ RTS
.s45:
4e3b : bd a9 9e LDA $9ea9,x ; (modplay.channel[0].porta_speed + 0)
4e3e : 7d a1 9e ADC $9ea1,x ; (modplay.channel[0].rate + 0)
4e41 : 85 1b __ STA ACCU + 0 
4e43 : 9d a1 9e STA $9ea1,x ; (modplay.channel[0].rate + 0)
4e46 : a5 1c __ LDA ACCU + 1 
4e48 : 69 00 __ ADC #$00
4e4a : 85 1c __ STA ACCU + 1 
4e4c : 9d a2 9e STA $9ea2,x ; (modplay.channel[0].rate + 1)
4e4f : a5 44 __ LDA T0 + 1 
4e51 : c5 1c __ CMP ACCU + 1 
4e53 : d0 d3 __ BNE $4e28 ; (fx_tick.s47 + 0)
.s46:
4e55 : a5 43 __ LDA T0 + 0 
4e57 : c5 1b __ CMP ACCU + 0 
4e59 : 4c 28 4e JMP $4e28 ; (fx_tick.s47 + 0)
.s51:
4e5c : a8 __ __ TAY
4e5d : d0 10 __ BNE $4e6f ; (fx_tick.s55 + 0)
.s52:
4e5f : bd a6 9e LDA $9ea6,x ; (modplay.channel[0].eparam + 0)
4e62 : d0 01 __ BNE $4e65 ; (fx_tick.s53 + 0)
4e64 : 60 __ __ RTS
.s53:
4e65 : bd 9e 9e LDA $9e9e,x ; (modplay.channel[0].sample_num + 0)
4e68 : d0 01 __ BNE $4e6b ; (fx_tick.s54 + 0)
4e6a : 60 __ __ RTS
.s54:
4e6b : fe b4 9e INC $9eb4,x ; (modplay.channel[0].arp_counter + 0)
4e6e : 60 __ __ RTS
.s55:
4e6f : bd a0 9e LDA $9ea0,x ; (modplay.channel[0].period + 1)
4e72 : d0 08 __ BNE $4e7c ; (fx_tick.s56 + 0)
.s58:
4e74 : a9 71 __ LDA #$71
4e76 : dd 9f 9e CMP $9e9f,x ; (modplay.channel[0].period + 0)
4e79 : 90 01 __ BCC $4e7c ; (fx_tick.s56 + 0)
4e7b : 60 __ __ RTS
.s56:
4e7c : bd 9f 9e LDA $9e9f,x ; (modplay.channel[0].period + 0)
4e7f : 38 __ __ SEC
4e80 : fd a9 9e SBC $9ea9,x ; (modplay.channel[0].porta_speed + 0)
4e83 : 85 0d __ STA P0 
4e85 : bd a0 9e LDA $9ea0,x ; (modplay.channel[0].period + 1)
4e88 : e9 00 __ SBC #$00
.s57:
4e8a : 85 0e __ STA P1 
4e8c : 20 18 4c JSR $4c18 ; (clamp_period.s4 + 0)
4e8f : a5 1b __ LDA ACCU + 0 
4e91 : 85 0d __ STA P0 
4e93 : a6 45 __ LDX T3 + 0 
4e95 : 9d 9f 9e STA $9e9f,x ; (modplay.channel[0].period + 0)
4e98 : a5 1c __ LDA ACCU + 1 
4e9a : 85 0e __ STA P1 
4e9c : 9d a0 9e STA $9ea0,x ; (modplay.channel[0].period + 1)
4e9f : 20 13 49 JSR $4913 ; (period_to_rate.s4 + 0)
4ea2 : a5 1b __ LDA ACCU + 0 
4ea4 : a6 45 __ LDX T3 + 0 
4ea6 : 9d a1 9e STA $9ea1,x ; (modplay.channel[0].rate + 0)
4ea9 : a5 1c __ LDA ACCU + 1 
4eab : 9d a2 9e STA $9ea2,x ; (modplay.channel[0].rate + 1)
4eae : 60 __ __ RTS
--------------------------------------------------------------------
wave_value: ; wave_value(u8,u8)->u8
; 156, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4eaf : a5 0e __ LDA P1 ; (pos + 0)
4eb1 : 29 1f __ AND #$1f
4eb3 : a8 __ __ TAY
4eb4 : a5 0d __ LDA P0 ; (wave + 0)
4eb6 : 29 03 __ AND #$03
4eb8 : c9 01 __ CMP #$01
4eba : d0 07 __ BNE $4ec3 ; (wave_value.s5 + 0)
.s10:
4ebc : 98 __ __ TYA
4ebd : 0a __ __ ASL
4ebe : 0a __ __ ASL
4ebf : 0a __ __ ASL
4ec0 : 49 ff __ EOR #$ff
.s3:
4ec2 : 60 __ __ RTS
.s5:
4ec3 : aa __ __ TAX
4ec4 : d0 04 __ BNE $4eca ; (wave_value.s6 + 0)
.s9:
4ec6 : b9 48 80 LDA $8048,y ; (vib_sine[0] + 0)
4ec9 : 60 __ __ RTS
.s6:
4eca : c9 02 __ CMP #$02
4ecc : d0 03 __ BNE $4ed1 ; (wave_value.s7 + 0)
.s8:
4ece : a9 ff __ LDA #$ff
4ed0 : 60 __ __ RTS
.s7:
4ed1 : 98 __ __ TYA
4ed2 : 0a __ __ ASL
4ed3 : 0a __ __ ASL
4ed4 : 0a __ __ ASL
4ed5 : 60 __ __ RTS
--------------------------------------------------------------------
ua_update_channel: ; ua_update_channel(u8)->void
;  86, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s1:
4ed6 : 38 __ __ SEC
4ed7 : a5 23 __ LDA SP + 0 
4ed9 : e9 0c __ SBC #$0c
4edb : 85 23 __ STA SP + 0 
4edd : b0 02 __ BCS $4ee1 ; (ua_update_channel.s1 + 11)
4edf : c6 24 __ DEC SP + 1 
4ee1 : a0 03 __ LDY #$03
4ee3 : b9 53 00 LDA $0053,y 
4ee6 : 91 23 __ STA (SP + 0),y 
4ee8 : 88 __ __ DEY
4ee9 : 10 f8 __ BPL $4ee3 ; (ua_update_channel.s1 + 13)
.s4:
4eeb : ad 4a 9c LDA $9c4a ; (modplay.master_volume + 0)
4eee : 85 1b __ STA ACCU + 0 
4ef0 : a6 13 __ LDX P6 ; (ch + 0)
4ef2 : 86 47 __ STX T1 + 0 
4ef4 : bd 8d 7b LDA $7b8d,x ; (__multab50L + 0)
4ef7 : 85 43 __ STA T0 + 0 
4ef9 : aa __ __ TAX
4efa : a9 00 __ LDA #$00
4efc : 85 1c __ STA ACCU + 1 
4efe : bd a3 9e LDA $9ea3,x ; (modplay.channel[0].volume + 0)
4f01 : 20 62 77 JSR $7762 ; (mul16by8 + 0)
4f04 : a5 1c __ LDA ACCU + 1 
4f06 : 85 50 __ STA T6 + 0 
4f08 : a5 1b __ LDA ACCU + 0 
4f0a : 0a __ __ ASL
4f0b : 26 50 __ ROL T6 + 0 
4f0d : 0a __ __ ASL
4f0e : 26 50 __ ROL T6 + 0 
4f10 : a4 43 __ LDY T0 + 0 
4f12 : b9 be 9e LDA $9ebe,y ; (modplay.channel[0].needs_start + 0)
4f15 : d0 5f __ BNE $4f76 ; (ua_update_channel.s10 + 0)
.s5:
4f17 : a5 50 __ LDA T6 + 0 
4f19 : d9 bb 9e CMP $9ebb,y ; (modplay.channel[0].ua_vol + 0)
4f1c : f0 0f __ BEQ $4f2d ; (ua_update_channel.s6 + 0)
.s9:
4f1e : 06 47 __ ASL T1 + 0 
4f20 : a4 47 __ LDY T1 + 0 
4f22 : be ce 7c LDX $7cce,y ; (audio_ch_base[0] + 0)
4f25 : 9d 01 df STA $df01,x 
4f28 : a4 43 __ LDY T0 + 0 
4f2a : 99 bb 9e STA $9ebb,y ; (modplay.channel[0].ua_vol + 0)
.s6:
4f2d : b9 a2 9e LDA $9ea2,y ; (modplay.channel[0].rate + 1)
4f30 : d9 bd 9e CMP $9ebd,y ; (modplay.channel[0].ua_rate + 1)
4f33 : d0 08 __ BNE $4f3d ; (ua_update_channel.s7 + 0)
.s8:
4f35 : b9 a1 9e LDA $9ea1,y ; (modplay.channel[0].rate + 0)
4f38 : d9 bc 9e CMP $9ebc,y ; (modplay.channel[0].ua_rate + 0)
4f3b : f0 23 __ BEQ $4f60 ; (ua_update_channel.s3 + 0)
.s7:
4f3d : b9 a1 9e LDA $9ea1,y ; (modplay.channel[0].rate + 0)
4f40 : 85 0e __ STA P1 
4f42 : a5 13 __ LDA P6 ; (ch + 0)
4f44 : 0a __ __ ASL
4f45 : aa __ __ TAX
4f46 : b9 a2 9e LDA $9ea2,y ; (modplay.channel[0].rate + 1)
4f49 : 85 0f __ STA P2 
4f4b : bc ce 7c LDY $7cce,x ; (audio_ch_base[0] + 0)
4f4e : 99 0e df STA $df0e,y 
4f51 : a5 0e __ LDA P1 
4f53 : 99 0f df STA $df0f,y 
4f56 : a6 43 __ LDX T0 + 0 
4f58 : 9d bc 9e STA $9ebc,x ; (modplay.channel[0].ua_rate + 0)
4f5b : a5 0f __ LDA P2 
.s14:
4f5d : 9d bd 9e STA $9ebd,x ; (modplay.channel[0].ua_rate + 1)
.s3:
4f60 : a0 03 __ LDY #$03
4f62 : b1 23 __ LDA (SP + 0),y 
4f64 : 99 53 00 STA $0053,y 
4f67 : 88 __ __ DEY
4f68 : 10 f8 __ BPL $4f62 ; (ua_update_channel.s3 + 2)
4f6a : 18 __ __ CLC
4f6b : a5 23 __ LDA SP + 0 
4f6d : 69 0c __ ADC #$0c
4f6f : 85 23 __ STA SP + 0 
4f71 : 90 02 __ BCC $4f75 ; (ua_update_channel.s3 + 21)
4f73 : e6 24 __ INC SP + 1 
4f75 : 60 __ __ RTS
.s10:
4f76 : 84 51 __ STY T7 + 0 
4f78 : a5 13 __ LDA P6 ; (ch + 0)
4f7a : 85 0d __ STA P0 
4f7c : a9 00 __ LDA #$00
4f7e : 99 be 9e STA $9ebe,y ; (modplay.channel[0].needs_start + 0)
4f81 : b9 c0 9e LDA $9ec0,y ; (modplay.channel[0].smp_start + 0)
4f84 : 85 0e __ STA P1 
4f86 : b9 c1 9e LDA $9ec1,y ; (modplay.channel[0].smp_start + 1)
4f89 : 85 0f __ STA P2 
4f8b : b9 c2 9e LDA $9ec2,y ; (modplay.channel[0].smp_start + 2)
4f8e : 85 10 __ STA P3 
4f90 : b9 c3 9e LDA $9ec3,y ; (modplay.channel[0].smp_start + 3)
4f93 : 85 11 __ STA P4 
4f95 : 06 47 __ ASL T1 + 0 
4f97 : a6 47 __ LDX T1 + 0 
4f99 : bd ce 7c LDA $7cce,x ; (audio_ch_base[0] + 0)
4f9c : 85 4f __ STA T5 + 0 
4f9e : 85 53 __ STA T8 + 0 
4fa0 : b9 a1 9e LDA $9ea1,y ; (modplay.channel[0].rate + 0)
4fa3 : 85 55 __ STA T9 + 0 
4fa5 : a9 df __ LDA #$df
4fa7 : 85 54 __ STA T8 + 1 
4fa9 : b9 a2 9e LDA $9ea2,y ; (modplay.channel[0].rate + 1)
4fac : 85 56 __ STA T9 + 1 
4fae : b9 c4 9e LDA $9ec4,y ; (modplay.channel[0].smp_length + 0)
4fb1 : 85 43 __ STA T0 + 0 
4fb3 : b9 c5 9e LDA $9ec5,y ; (modplay.channel[0].smp_length + 1)
4fb6 : 85 44 __ STA T0 + 1 
4fb8 : b9 c6 9e LDA $9ec6,y ; (modplay.channel[0].smp_length + 2)
4fbb : 85 45 __ STA T0 + 2 
4fbd : b9 c7 9e LDA $9ec7,y ; (modplay.channel[0].smp_length + 3)
4fc0 : 85 46 __ STA T0 + 3 
4fc2 : b9 bf 9e LDA $9ebf,y ; (modplay.channel[0].needs_loop + 0)
4fc5 : d0 03 __ BNE $4fca ; (ua_update_channel.s13 + 0)
4fc7 : 4c 4f 50 JMP $504f ; (ua_update_channel.s11 + 0)
.s13:
4fca : a6 51 __ LDX T7 + 0 
4fcc : bd c8 9e LDA $9ec8,x ; (modplay.channel[0].smp_loop_a + 0)
4fcf : 85 47 __ STA T1 + 0 
4fd1 : bd c9 9e LDA $9ec9,x ; (modplay.channel[0].smp_loop_a + 1)
4fd4 : 85 48 __ STA T1 + 1 
4fd6 : bd ca 9e LDA $9eca,x ; (modplay.channel[0].smp_loop_a + 2)
4fd9 : 85 49 __ STA T1 + 2 
4fdb : bd cb 9e LDA $9ecb,x ; (modplay.channel[0].smp_loop_a + 3)
4fde : 85 4a __ STA T1 + 3 
4fe0 : bd cc 9e LDA $9ecc,x ; (modplay.channel[0].smp_loop_b + 0)
4fe3 : 85 4b __ STA T2 + 0 
4fe5 : bd cd 9e LDA $9ecd,x ; (modplay.channel[0].smp_loop_b + 1)
4fe8 : 85 4c __ STA T2 + 1 
4fea : bd ce 9e LDA $9ece,x ; (modplay.channel[0].smp_loop_b + 2)
4fed : 85 4d __ STA T2 + 2 
4fef : bd cf 9e LDA $9ecf,x ; (modplay.channel[0].smp_loop_b + 3)
4ff2 : 85 4e __ STA T2 + 3 
4ff4 : a9 00 __ LDA #$00
4ff6 : a6 4f __ LDX T5 + 0 
4ff8 : 9d 00 df STA $df00,x 
4ffb : a5 50 __ LDA T6 + 0 
4ffd : 9d 01 df STA $df01,x 
5000 : b9 a4 9e LDA $9ea4,y ; (modplay.channel[0].pan + 0)
5003 : 9d 02 df STA $df02,x 
5006 : 20 8d 50 JSR $508d ; (ch_wr_sms.s4 + 0)
5009 : 20 a9 50 JSR $50a9 ; (ch_wr_be24@proxy + 0)
500c : a5 0d __ LDA P0 
500e : 0a __ __ ASL
500f : aa __ __ TAX
5010 : a5 56 __ LDA T9 + 1 
5012 : bc ce 7c LDY $7cce,x ; (audio_ch_base[0] + 0)
5015 : 99 0e df STA $df0e,y 
5018 : a5 55 __ LDA T9 + 0 
501a : 99 0f df STA $df0f,y 
501d : a5 47 __ LDA T1 + 0 
501f : 85 0f __ STA P2 
5021 : a9 11 __ LDA #$11
5023 : 85 0e __ STA P1 
5025 : a5 48 __ LDA T1 + 1 
5027 : 85 10 __ STA P3 
5029 : a5 49 __ LDA T1 + 2 
502b : 85 11 __ STA P4 
502d : a5 4a __ LDA T1 + 3 
502f : 85 12 __ STA P5 
5031 : 20 bd 50 JSR $50bd ; (ch_wr_be24.s4 + 0)
5034 : a5 4b __ LDA T2 + 0 
5036 : 85 0f __ STA P2 
5038 : a9 15 __ LDA #$15
503a : 85 0e __ STA P1 
503c : a5 4c __ LDA T2 + 1 
503e : 85 10 __ STA P3 
5040 : a5 4d __ LDA T2 + 2 
5042 : 85 11 __ STA P4 
5044 : a5 4e __ LDA T2 + 3 
5046 : 85 12 __ STA P5 
5048 : 20 bd 50 JSR $50bd ; (ch_wr_be24.s4 + 0)
504b : a9 03 __ LDA #$03
504d : d0 29 __ BNE $5078 ; (ua_update_channel.s12 + 0)
.s11:
504f : a6 4f __ LDX T5 + 0 
5051 : 9d 00 df STA $df00,x 
5054 : a5 50 __ LDA T6 + 0 
5056 : 9d 01 df STA $df01,x 
5059 : b9 a4 9e LDA $9ea4,y ; (modplay.channel[0].pan + 0)
505c : 9d 02 df STA $df02,x 
505f : 20 8d 50 JSR $508d ; (ch_wr_sms.s4 + 0)
5062 : 20 a9 50 JSR $50a9 ; (ch_wr_be24@proxy + 0)
5065 : a5 0d __ LDA P0 
5067 : 0a __ __ ASL
5068 : aa __ __ TAX
5069 : a5 56 __ LDA T9 + 1 
506b : bc ce 7c LDY $7cce,x ; (audio_ch_base[0] + 0)
506e : 99 0e df STA $df0e,y 
5071 : a5 55 __ LDA T9 + 0 
5073 : 99 0f df STA $df0f,y 
5076 : a9 01 __ LDA #$01
.s12:
5078 : a0 00 __ LDY #$00
507a : 91 53 __ STA (T8 + 0),y 
507c : a5 50 __ LDA T6 + 0 
507e : a6 51 __ LDX T7 + 0 
5080 : 9d bb 9e STA $9ebb,x ; (modplay.channel[0].ua_vol + 0)
5083 : a5 55 __ LDA T9 + 0 
5085 : 9d bc 9e STA $9ebc,x ; (modplay.channel[0].ua_rate + 0)
5088 : a5 56 __ LDA T9 + 1 
508a : 4c 5d 4f JMP $4f5d ; (ua_update_channel.s14 + 0)
--------------------------------------------------------------------
ch_wr_sms: ; ch_wr_sms(u8,u32)->void
;  40, "/home/xahmol/git/UltimateDemo2026/include/audio.c"
.s4:
508d : a5 0d __ LDA P0 ; (ch + 0)
508f : 0a __ __ ASL
5090 : a8 __ __ TAY
5091 : a9 01 __ LDA #$01
5093 : be ce 7c LDX $7cce,y ; (audio_ch_base[0] + 0)
5096 : 9d 04 df STA $df04,x 
5099 : a5 10 __ LDA P3 ; (addr + 2)
509b : 9d 05 df STA $df05,x 
509e : a5 0f __ LDA P2 ; (addr + 1)
50a0 : 9d 06 df STA $df06,x 
50a3 : a5 0e __ LDA P1 ; (addr + 0)
50a5 : 9d 07 df STA $df07,x 
.s3:
50a8 : 60 __ __ RTS
--------------------------------------------------------------------
ch_wr_be24@proxy: ; ch_wr_be24@proxy
50a9 : a9 09 __ LDA #$09
50ab : 85 0e __ STA P1 
50ad : a5 43 __ LDA $43 
50af : 85 0f __ STA P2 
50b1 : a5 44 __ LDA $44 
50b3 : 85 10 __ STA P3 
50b5 : a5 45 __ LDA $45 
50b7 : 85 11 __ STA P4 
50b9 : a5 46 __ LDA $46 
50bb : 85 12 __ STA P5 
--------------------------------------------------------------------
ch_wr_be24: ; ch_wr_be24(u8,u8,u32)->void
;  52, "/home/xahmol/git/UltimateDemo2026/include/audio.c"
.s4:
50bd : a5 0d __ LDA P0 ; (ch + 0)
50bf : 0a __ __ ASL
50c0 : aa __ __ TAX
50c1 : bd ce 7c LDA $7cce,x ; (audio_ch_base[0] + 0)
50c4 : 65 0e __ ADC P1 ; (offset + 0)
50c6 : 85 1b __ STA ACCU + 0 
50c8 : a9 df __ LDA #$df
50ca : 85 1c __ STA ACCU + 1 
50cc : a5 11 __ LDA P4 ; (val + 2)
50ce : a0 00 __ LDY #$00
50d0 : 91 1b __ STA (ACCU + 0),y 
50d2 : a5 10 __ LDA P3 ; (val + 1)
50d4 : c8 __ __ INY
50d5 : 91 1b __ STA (ACCU + 0),y 
50d7 : a5 0f __ LDA P2 ; (val + 0)
50d9 : c8 __ __ INY
50da : 91 1b __ STA (ACCU + 0),y 
.s3:
50dc : 60 __ __ RTS
--------------------------------------------------------------------
mandel_run: ; mandel_run()->void
;   4, "/home/xahmol/git/UltimateDemo2026/src/mandel.h"
.s4:
50dd : a9 8f __ LDA #$8f
50df : 20 59 16 JSR $1659 ; (turbo_set.s4 + 0)
50e2 : a9 35 __ LDA #$35
50e4 : 85 01 __ STA $01 
50e6 : a9 1f __ LDA #$1f
50e8 : 85 12 __ STA P5 
50ea : a9 40 __ LDA #$40
50ec : 85 11 __ STA P4 
50ee : a9 00 __ LDA #$00
50f0 : 85 0f __ STA P2 
50f2 : 85 10 __ STA P3 
50f4 : a2 fa __ LDX #$fa
.l6:
50f6 : ca __ __ DEX
50f7 : 9d 00 c0 STA $c000,x 
50fa : 9d fa c0 STA $c0fa,x 
50fd : 9d f4 c1 STA $c1f4,x 
5100 : 9d ee c2 STA $c2ee,x 
5103 : d0 f1 __ BNE $50f6 ; (mandel_run.l6 + 0)
.s5:
5105 : 85 0d __ STA P0 
5107 : a9 e0 __ LDA #$e0
5109 : 85 0e __ STA P1 
510b : 20 f1 23 JSR $23f1 ; (memset.s4 + 0)
510e : a9 04 __ LDA #$04
5110 : 85 0d __ STA P0 
5112 : a9 00 __ LDA #$00
5114 : 85 10 __ STA P3 
5116 : a9 e0 __ LDA #$e0
5118 : 85 11 __ STA P4 
511a : a9 01 __ LDA #$01
511c : a2 fa __ LDX #$fa
.l8:
511e : ca __ __ DEX
511f : 9d 00 d8 STA $d800,x 
5122 : 9d fa d8 STA $d8fa,x 
5125 : 9d f4 d9 STA $d9f4,x 
5128 : 9d ee da STA $daee,x 
512b : d0 f1 __ BNE $511e ; (mandel_run.l8 + 0)
.s7:
512d : a9 00 __ LDA #$00
512f : 85 0e __ STA P1 
5131 : a9 c0 __ LDA #$c0
5133 : 85 0f __ STA P2 
5135 : 20 79 0f JSR $0f79 ; (vic_setmode.s4 + 0)
5138 : a9 00 __ LDA #$00
513a : 8d 21 d0 STA $d021 
513d : 8d 20 d0 STA $d020 
5140 : a9 72 __ LDA #$72
5142 : 85 13 __ STA P6 
5144 : a9 80 __ LDA #$80
5146 : 85 14 __ STA P7 
5148 : 20 7d 51 JSR $517d ; (render.s1 + 0)
514b : a9 9a __ LDA #$9a
514d : 85 0d __ STA P0 
514f : a9 80 __ LDA #$80
5151 : 85 0e __ STA P1 
5153 : 20 10 54 JSR $5410 ; (colorize_standard.s4 + 0)
5156 : a9 00 __ LDA #$00
5158 : 8d 09 dc STA $dc09 
515b : 8d 08 dc STA $dc08 
.l9:
515e : ad 09 dc LDA $dc09 
5161 : c9 05 __ CMP #$05
5163 : 90 f9 __ BCC $515e ; (mandel_run.l9 + 0)
.s10:
5165 : a9 00 __ LDA #$00
5167 : 85 0d __ STA P0 
5169 : 85 0e __ STA P1 
516b : 85 10 __ STA P3 
516d : a9 36 __ LDA #$36
516f : 85 01 __ STA $01 
5171 : 20 71 0f JSR $0f71 ; (vic_setmode@proxy + 0)
5174 : a9 00 __ LDA #$00
5176 : 8d 20 d0 STA $d020 
5179 : 8d 21 d0 STA $d021 
.s3:
517c : 60 __ __ RTS
--------------------------------------------------------------------
render: ; render(const struct S#29253*)->void
; 120, "/home/xahmol/git/UltimateDemo2026/src/mandel.c"
.s1:
517d : a2 05 __ LDX #$05
517f : b5 53 __ LDA T10 + 0,x 
5181 : 9d da bf STA $bfda,x ; (render@stack + 0)
5184 : ca __ __ DEX
5185 : 10 f8 __ BPL $517f ; (render.s1 + 2)
.s4:
5187 : a9 40 __ LDA #$40
5189 : 85 11 __ STA P4 
518b : a9 1f __ LDA #$1f
518d : 85 12 __ STA P5 
518f : a9 00 __ LDA #$00
5191 : 85 0d __ STA P0 
5193 : a9 e0 __ LDA #$e0
5195 : 85 0e __ STA P1 
5197 : a0 06 __ LDY #$06
5199 : b1 13 __ LDA (P6),y ; (f + 0)
519b : c8 __ __ INY
519c : 11 13 __ ORA (P6),y ; (f + 0)
519e : d0 08 __ BNE $51a8 ; (render.s24 + 0)
.s5:
51a0 : c8 __ __ INY
51a1 : b1 13 __ LDA (P6),y ; (f + 0)
51a3 : c8 __ __ INY
51a4 : 11 13 __ ORA (P6),y ; (f + 0)
51a6 : f0 02 __ BEQ $51aa ; (render.s6 + 0)
.s24:
51a8 : a9 01 __ LDA #$01
.s6:
51aa : 85 57 __ STA T12 + 0 
51ac : a9 00 __ LDA #$00
51ae : 85 0f __ STA P2 
51b0 : 85 10 __ STA P3 
51b2 : 20 f1 23 JSR $23f1 ; (memset.s4 + 0)
51b5 : a9 00 __ LDA #$00
51b7 : 85 4d __ STA T6 + 0 
.l7:
51b9 : 29 07 __ AND #$07
51bb : 85 43 __ STA T0 + 0 
51bd : a5 4d __ LDA T6 + 0 
51bf : 29 f8 __ AND #$f8
51c1 : 85 1b __ STA ACCU + 0 
51c3 : 4a __ __ LSR
51c4 : 4a __ __ LSR
51c5 : 65 1b __ ADC ACCU + 0 
51c7 : 4a __ __ LSR
51c8 : 6a __ __ ROR
51c9 : 6a __ __ ROR
51ca : aa __ __ TAX
51cb : 29 c0 __ AND #$c0
51cd : 6a __ __ ROR
51ce : 05 43 __ ORA T0 + 0 
51d0 : 85 4e __ STA T7 + 0 
51d2 : 8a __ __ TXA
51d3 : 29 1f __ AND #$1f
51d5 : 09 e0 __ ORA #$e0
51d7 : 85 4f __ STA T7 + 1 
51d9 : a0 05 __ LDY #$05
51db : b1 13 __ LDA (P6),y ; (f + 0)
51dd : 85 1b __ STA ACCU + 0 
51df : a9 00 __ LDA #$00
51e1 : 85 52 __ STA T9 + 0 
51e3 : 85 1c __ STA ACCU + 1 
51e5 : a5 4d __ LDA T6 + 0 
51e7 : 20 62 77 JSR $7762 ; (mul16by8 + 0)
51ea : a0 02 __ LDY #$02
51ec : b1 13 __ LDA (P6),y ; (f + 0)
51ee : 18 __ __ CLC
51ef : 65 1b __ ADC ACCU + 0 
51f1 : 85 50 __ STA T8 + 0 
51f3 : c8 __ __ INY
51f4 : b1 13 __ LDA (P6),y ; (f + 0)
51f6 : 65 1c __ ADC ACCU + 1 
51f8 : 85 51 __ STA T8 + 1 
.l8:
51fa : a0 04 __ LDY #$04
51fc : b1 13 __ LDA (P6),y ; (f + 0)
51fe : 85 1b __ STA ACCU + 0 
5200 : a9 00 __ LDA #$00
5202 : 85 1c __ STA ACCU + 1 
5204 : a5 52 __ LDA T9 + 0 
5206 : 20 62 77 JSR $7762 ; (mul16by8 + 0)
5209 : a0 00 __ LDY #$00
520b : b1 13 __ LDA (P6),y ; (f + 0)
520d : 18 __ __ CLC
520e : 65 1b __ ADC ACCU + 0 
5210 : 85 49 __ STA T3 + 0 
5212 : 85 53 __ STA T10 + 0 
5214 : c8 __ __ INY
5215 : b1 13 __ LDA (P6),y ; (f + 0)
5217 : 65 1c __ ADC ACCU + 1 
5219 : 85 4a __ STA T3 + 1 
521b : 85 54 __ STA T10 + 1 
521d : a5 57 __ LDA T12 + 0 
521f : d0 11 __ BNE $5232 ; (render.s23 + 0)
.s9:
5221 : 85 49 __ STA T3 + 0 
5223 : 85 4a __ STA T3 + 1 
5225 : 85 4b __ STA T4 + 0 
5227 : 85 4c __ STA T4 + 1 
5229 : a5 50 __ LDA T8 + 0 
522b : 85 55 __ STA T11 + 0 
522d : a5 51 __ LDA T8 + 1 
522f : 4c 4d 52 JMP $524d ; (render.s10 + 0)
.s23:
5232 : a5 50 __ LDA T8 + 0 
5234 : 85 4b __ STA T4 + 0 
5236 : a5 51 __ LDA T8 + 1 
5238 : 85 4c __ STA T4 + 1 
523a : a0 06 __ LDY #$06
523c : b1 13 __ LDA (P6),y ; (f + 0)
523e : 85 53 __ STA T10 + 0 
5240 : c8 __ __ INY
5241 : b1 13 __ LDA (P6),y ; (f + 0)
5243 : 85 54 __ STA T10 + 1 
5245 : c8 __ __ INY
5246 : b1 13 __ LDA (P6),y ; (f + 0)
5248 : 85 55 __ STA T11 + 0 
524a : c8 __ __ INY
524b : b1 13 __ LDA (P6),y ; (f + 0)
.s10:
524d : 85 56 __ STA T11 + 1 
524f : a9 00 __ LDA #$00
5251 : 85 58 __ STA T13 + 0 
.l11:
5253 : a6 49 __ LDX T3 + 0 
5255 : a5 4a __ LDA T3 + 1 
5257 : 10 0a __ BPL $5263 ; (render.s12 + 0)
.s22:
5259 : 38 __ __ SEC
525a : a9 00 __ LDA #$00
525c : e5 49 __ SBC T3 + 0 
525e : aa __ __ TAX
525f : a9 00 __ LDA #$00
5261 : e5 4a __ SBC T3 + 1 
.s12:
5263 : 86 0d __ STX P0 
5265 : 86 0f __ STX P2 
5267 : 85 0e __ STA P1 
5269 : 85 10 __ STA P3 
526b : 20 77 53 JSR $5377 ; (lmul16u.s4 + 0)
526e : a5 1b __ LDA ACCU + 0 
5270 : 85 45 __ STA T2 + 0 
5272 : a5 1c __ LDA ACCU + 1 
5274 : 85 46 __ STA T2 + 1 
5276 : a5 1d __ LDA ACCU + 2 
5278 : 85 47 __ STA T2 + 2 
527a : a5 1e __ LDA ACCU + 3 
527c : 85 48 __ STA T2 + 3 
527e : a6 4b __ LDX T4 + 0 
5280 : a5 4c __ LDA T4 + 1 
5282 : 10 0a __ BPL $528e ; (render.s13 + 0)
.s21:
5284 : 38 __ __ SEC
5285 : a9 00 __ LDA #$00
5287 : e5 4b __ SBC T4 + 0 
5289 : aa __ __ TAX
528a : a9 00 __ LDA #$00
528c : e5 4c __ SBC T4 + 1 
.s13:
528e : 86 0d __ STX P0 
5290 : 86 0f __ STX P2 
5292 : 85 0e __ STA P1 
5294 : 85 10 __ STA P3 
5296 : 20 77 53 JSR $5377 ; (lmul16u.s4 + 0)
5299 : 18 __ __ CLC
529a : a5 1b __ LDA ACCU + 0 
529c : 65 45 __ ADC T2 + 0 
529e : a5 1c __ LDA ACCU + 1 
52a0 : 65 46 __ ADC T2 + 1 
52a2 : a5 1d __ LDA ACCU + 2 
52a4 : 65 47 __ ADC T2 + 2 
52a6 : a5 1e __ LDA ACCU + 3 
52a8 : 65 48 __ ADC T2 + 3 
52aa : c9 04 __ CMP #$04
52ac : 90 1b __ BCC $52c9 ; (render.s14 + 0)
.s20:
52ae : a5 58 __ LDA T13 + 0 
52b0 : 4a __ __ LSR
52b1 : 4a __ __ LSR
52b2 : 85 1b __ STA ACCU + 0 
52b4 : a9 00 __ LDA #$00
52b6 : 85 1c __ STA ACCU + 1 
52b8 : 85 04 __ STA WORK + 1 
52ba : a9 03 __ LDA #$03
52bc : 85 03 __ STA WORK + 0 
52be : 20 4d 78 JSR $784d ; (divmod + 0)
52c1 : 18 __ __ CLC
52c2 : a5 05 __ LDA WORK + 2 
52c4 : 69 01 __ ADC #$01
52c6 : 4c 28 53 JMP $5328 ; (render.s18 + 0)
.s14:
52c9 : a5 49 __ LDA T3 + 0 
52cb : 85 0d __ STA P0 
52cd : a5 4a __ LDA T3 + 1 
52cf : 85 0e __ STA P1 
52d1 : a5 4b __ LDA T4 + 0 
52d3 : 85 0f __ STA P2 
52d5 : a5 4c __ LDA T4 + 1 
52d7 : 85 10 __ STA P3 
52d9 : 38 __ __ SEC
52da : a5 45 __ LDA T2 + 0 
52dc : e5 1b __ SBC ACCU + 0 
52de : a5 46 __ LDA T2 + 1 
52e0 : e5 1c __ SBC ACCU + 1 
52e2 : 85 43 __ STA T0 + 0 
52e4 : a5 47 __ LDA T2 + 2 
52e6 : e5 1d __ SBC ACCU + 2 
52e8 : 85 44 __ STA T0 + 1 
52ea : a5 48 __ LDA T2 + 3 
52ec : e5 1e __ SBC ACCU + 3 
52ee : a2 04 __ LDX #$04
.l15:
52f0 : 4a __ __ LSR
52f1 : 66 44 __ ROR T0 + 1 
52f3 : 66 43 __ ROR T0 + 0 
52f5 : ca __ __ DEX
52f6 : d0 f8 __ BNE $52f0 ; (render.l15 + 0)
.s16:
52f8 : 18 __ __ CLC
52f9 : a5 43 __ LDA T0 + 0 
52fb : 65 53 __ ADC T10 + 0 
52fd : 85 49 __ STA T3 + 0 
52ff : a5 44 __ LDA T0 + 1 
5301 : 65 54 __ ADC T10 + 1 
5303 : 85 4a __ STA T3 + 1 
5305 : 20 9e 53 JSR $539e ; (lmul4f12s.s4 + 0)
5308 : a5 1b __ LDA ACCU + 0 
530a : 0a __ __ ASL
530b : a8 __ __ TAY
530c : a5 1c __ LDA ACCU + 1 
530e : 2a __ __ ROL
530f : aa __ __ TAX
5310 : 98 __ __ TYA
5311 : 18 __ __ CLC
5312 : 65 55 __ ADC T11 + 0 
5314 : 85 4b __ STA T4 + 0 
5316 : 8a __ __ TXA
5317 : 65 56 __ ADC T11 + 1 
5319 : 85 4c __ STA T4 + 1 
531b : e6 58 __ INC T13 + 0 
531d : a5 58 __ LDA T13 + 0 
531f : c9 20 __ CMP #$20
5321 : b0 03 __ BCS $5326 ; (render.s17 + 0)
5323 : 4c 53 52 JMP $5253 ; (render.l11 + 0)
.s17:
5326 : a9 00 __ LDA #$00
.s18:
5328 : aa __ __ TAX
5329 : a5 52 __ LDA T9 + 0 
532b : 29 03 __ AND #$03
532d : 0a __ __ ASL
532e : a8 __ __ TAY
532f : b9 9e 7b LDA $7b9e,y ; (__shrtab192L + 0)
5332 : 85 1b __ STA ACCU + 0 
5334 : 49 ff __ EOR #$ff
5336 : 85 45 __ STA T2 + 0 
5338 : a5 52 __ LDA T9 + 0 
533a : 29 fc __ AND #$fc
533c : 0a __ __ ASL
533d : 85 49 __ STA T3 + 0 
533f : a5 4f __ LDA T7 + 1 
5341 : 69 00 __ ADC #$00
5343 : 85 4a __ STA T3 + 1 
5345 : a4 4e __ LDY T7 + 0 
5347 : b1 49 __ LDA (T3 + 0),y 
5349 : 25 45 __ AND T2 + 0 
534b : 85 45 __ STA T2 + 0 
534d : bd fa 7f LDA $7ffa,x ; (cbytes[0] + 0)
5350 : 25 1b __ AND ACCU + 0 
5352 : 05 45 __ ORA T2 + 0 
5354 : 91 49 __ STA (T3 + 0),y 
5356 : e6 52 __ INC T9 + 0 
5358 : a5 52 __ LDA T9 + 0 
535a : c9 a0 __ CMP #$a0
535c : b0 03 __ BCS $5361 ; (render.s19 + 0)
535e : 4c fa 51 JMP $51fa ; (render.l8 + 0)
.s19:
5361 : e6 4d __ INC T6 + 0 
5363 : a5 4d __ LDA T6 + 0 
5365 : c9 c8 __ CMP #$c8
5367 : b0 03 __ BCS $536c ; (render.s3 + 0)
5369 : 4c b9 51 JMP $51b9 ; (render.l7 + 0)
.s3:
536c : a2 05 __ LDX #$05
536e : bd da bf LDA $bfda,x ; (render@stack + 0)
5371 : 95 53 __ STA T10 + 0,x 
5373 : ca __ __ DEX
5374 : 10 f8 __ BPL $536e ; (render.s3 + 2)
5376 : 60 __ __ RTS
--------------------------------------------------------------------
lmul16u: ; lmul16u(u16,u16)->u32
;   5, "/home/xahmol/oscar64/include/fixmath.h"
.s4:
5377 : a9 00 __ LDA #$00
5379 : 85 1d __ STA ACCU + 2 
537b : 85 1e __ STA ACCU + 3 
537d : a2 10 __ LDX #$10
537f : 46 0e __ LSR P1 
5381 : 66 0d __ ROR P0 
5383 : 90 0d __ BCC $5392 ; (lmul16u.s4 + 27)
5385 : 18 __ __ CLC
5386 : a5 1d __ LDA ACCU + 2 
5388 : 65 0f __ ADC P2 
538a : 85 1d __ STA ACCU + 2 
538c : a5 1e __ LDA ACCU + 3 
538e : 65 10 __ ADC P3 
5390 : 85 1e __ STA ACCU + 3 
5392 : 66 1e __ ROR ACCU + 3 
5394 : 66 1d __ ROR ACCU + 2 
5396 : 66 1c __ ROR ACCU + 1 
5398 : 66 1b __ ROR ACCU + 0 
539a : ca __ __ DEX
539b : d0 e2 __ BNE $537f ; (lmul16u.s4 + 8)
.s3:
539d : 60 __ __ RTS
--------------------------------------------------------------------
lmul4f12s: ; lmul4f12s(i16,i16)->i16
;  18, "/home/xahmol/oscar64/include/fixmath.h"
.s4:
539e : 38 __ __ SEC
539f : a5 0d __ LDA P0 
53a1 : 6a __ __ ROR
53a2 : 85 1b __ STA ACCU + 0 
53a4 : a9 00 __ LDA #$00
53a6 : 85 1c __ STA ACCU + 1 
53a8 : 90 0b __ BCC $53b5 ; (lmul4f12s.s4 + 23)
53aa : a8 __ __ TAY
53ab : 18 __ __ CLC
53ac : a5 1c __ LDA ACCU + 1 
53ae : 65 0f __ ADC P2 
53b0 : 85 1c __ STA ACCU + 1 
53b2 : 98 __ __ TYA
53b3 : 65 10 __ ADC P3 
53b5 : 6a __ __ ROR
53b6 : 66 1c __ ROR ACCU + 1 
53b8 : 46 1b __ LSR ACCU + 0 
53ba : 90 f9 __ BCC $53b5 ; (lmul4f12s.s4 + 23)
53bc : d0 ec __ BNE $53aa ; (lmul4f12s.s4 + 12)
53be : a6 0e __ LDX P1 
53c0 : 86 1b __ STX ACCU + 0 
53c2 : a2 07 __ LDX #$07
53c4 : 46 1b __ LSR ACCU + 0 
53c6 : 90 0b __ BCC $53d3 ; (lmul4f12s.s4 + 53)
53c8 : a8 __ __ TAY
53c9 : 18 __ __ CLC
53ca : a5 1c __ LDA ACCU + 1 
53cc : 65 0f __ ADC P2 
53ce : 85 1c __ STA ACCU + 1 
53d0 : 98 __ __ TYA
53d1 : 65 10 __ ADC P3 
53d3 : 6a __ __ ROR
53d4 : 66 1c __ ROR ACCU + 1 
53d6 : 66 1b __ ROR ACCU + 0 
53d8 : ca __ __ DEX
53d9 : d0 eb __ BNE $53c6 ; (lmul4f12s.s4 + 40)
53db : 90 0a __ BCC $53e7 ; (lmul4f12s.s4 + 73)
53dd : a8 __ __ TAY
53de : a5 1c __ LDA ACCU + 1 
53e0 : e5 0f __ SBC P2 
53e2 : 85 1c __ STA ACCU + 1 
53e4 : 98 __ __ TYA
53e5 : e5 10 __ SBC P3 
53e7 : 6a __ __ ROR
53e8 : 66 1c __ ROR ACCU + 1 
53ea : 66 1b __ ROR ACCU + 0 
53ec : 24 10 __ BIT P3 
53ee : 10 0b __ BPL $53fb ; (lmul4f12s.s4 + 93)
53f0 : aa __ __ TAX
53f1 : 38 __ __ SEC
53f2 : a5 1c __ LDA ACCU + 1 
53f4 : e5 0d __ SBC P0 
53f6 : 85 1c __ STA ACCU + 1 
53f8 : 8a __ __ TXA
53f9 : e5 0e __ SBC P1 
53fb : 4a __ __ LSR
53fc : 66 1c __ ROR ACCU + 1 
53fe : 66 1b __ ROR ACCU + 0 
5400 : 4a __ __ LSR
5401 : 66 1c __ ROR ACCU + 1 
5403 : 66 1b __ ROR ACCU + 0 
5405 : 4a __ __ LSR
5406 : 66 1c __ ROR ACCU + 1 
5408 : 66 1b __ ROR ACCU + 0 
540a : 4a __ __ LSR
540b : 66 1c __ ROR ACCU + 1 
540d : 66 1b __ ROR ACCU + 0 
.s3:
540f : 60 __ __ RTS
--------------------------------------------------------------------
colorize_standard: ; colorize_standard(const const struct S#29371[]*)->void
; 176, "/home/xahmol/git/UltimateDemo2026/src/mandel.c"
.s4:
5410 : a9 00 __ LDA #$00
5412 : 85 43 __ STA T0 + 0 
5414 : 85 44 __ STA T1 + 0 
5416 : 85 46 __ STA T2 + 0 
5418 : 85 48 __ STA T3 + 0 
541a : a9 e0 __ LDA #$e0
541c : 85 45 __ STA T1 + 1 
541e : a9 c0 __ LDA #$c0
5420 : 85 47 __ STA T2 + 1 
5422 : a9 d8 __ LDA #$d8
5424 : 85 49 __ STA T3 + 1 
.l5:
5426 : a9 00 __ LDA #$00
5428 : 85 4a __ STA T4 + 0 
.l6:
542a : 0a __ __ ASL
542b : 0a __ __ ASL
542c : 0a __ __ ASL
542d : a2 00 __ LDX #$00
542f : 90 02 __ BCC $5433 ; (colorize_standard.s51 + 0)
.s50:
5431 : e8 __ __ INX
5432 : 18 __ __ CLC
.s51:
5433 : 65 44 __ ADC T1 + 0 
5435 : 85 4b __ STA T5 + 0 
5437 : 8a __ __ TXA
5438 : 65 45 __ ADC T1 + 1 
543a : 85 4c __ STA T5 + 1 
543c : a9 00 __ LDA #$00
543e : 85 1c __ STA ACCU + 1 
5440 : 85 4d __ STA T10 + 0 
5442 : 85 4e __ STA T11 + 0 
5444 : aa __ __ TAX
5445 : a8 __ __ TAY
.l49:
5446 : b1 4b __ LDA (T5 + 0),y 
5448 : 85 1b __ STA ACCU + 0 
544a : 0a __ __ ASL
544b : 2a __ __ ROL
544c : 29 01 __ AND #$01
544e : 2a __ __ ROL
544f : d0 04 __ BNE $5455 ; (colorize_standard.s43 + 0)
.s7:
5451 : e8 __ __ INX
5452 : 4c 69 54 JMP $5469 ; (colorize_standard.s8 + 0)
.s43:
5455 : c9 01 __ CMP #$01
5457 : d0 05 __ BNE $545e ; (colorize_standard.s44 + 0)
.s47:
5459 : e6 1c __ INC ACCU + 1 
545b : 4c 69 54 JMP $5469 ; (colorize_standard.s8 + 0)
.s44:
545e : c9 02 __ CMP #$02
5460 : f0 05 __ BEQ $5467 ; (colorize_standard.s46 + 0)
.s45:
5462 : e6 4e __ INC T11 + 0 
5464 : 4c 69 54 JMP $5469 ; (colorize_standard.s8 + 0)
.s46:
5467 : e6 4d __ INC T10 + 0 
.s8:
5469 : a5 1b __ LDA ACCU + 0 
546b : 29 30 __ AND #$30
546d : 4a __ __ LSR
546e : 4a __ __ LSR
546f : 4a __ __ LSR
5470 : 4a __ __ LSR
5471 : d0 04 __ BNE $5477 ; (colorize_standard.s38 + 0)
.s9:
5473 : e8 __ __ INX
5474 : 4c 8b 54 JMP $548b ; (colorize_standard.s10 + 0)
.s38:
5477 : c9 01 __ CMP #$01
5479 : d0 05 __ BNE $5480 ; (colorize_standard.s39 + 0)
.s42:
547b : e6 1c __ INC ACCU + 1 
547d : 4c 8b 54 JMP $548b ; (colorize_standard.s10 + 0)
.s39:
5480 : c9 02 __ CMP #$02
5482 : f0 05 __ BEQ $5489 ; (colorize_standard.s41 + 0)
.s40:
5484 : e6 4e __ INC T11 + 0 
5486 : 4c 8b 54 JMP $548b ; (colorize_standard.s10 + 0)
.s41:
5489 : e6 4d __ INC T10 + 0 
.s10:
548b : a5 1b __ LDA ACCU + 0 
548d : 29 0c __ AND #$0c
548f : 4a __ __ LSR
5490 : 4a __ __ LSR
5491 : d0 04 __ BNE $5497 ; (colorize_standard.s33 + 0)
.s11:
5493 : e8 __ __ INX
5494 : 4c ab 54 JMP $54ab ; (colorize_standard.s12 + 0)
.s33:
5497 : c9 01 __ CMP #$01
5499 : d0 05 __ BNE $54a0 ; (colorize_standard.s34 + 0)
.s37:
549b : e6 1c __ INC ACCU + 1 
549d : 4c ab 54 JMP $54ab ; (colorize_standard.s12 + 0)
.s34:
54a0 : c9 02 __ CMP #$02
54a2 : f0 05 __ BEQ $54a9 ; (colorize_standard.s36 + 0)
.s35:
54a4 : e6 4e __ INC T11 + 0 
54a6 : 4c ab 54 JMP $54ab ; (colorize_standard.s12 + 0)
.s36:
54a9 : e6 4d __ INC T10 + 0 
.s12:
54ab : a5 1b __ LDA ACCU + 0 
54ad : 29 03 __ AND #$03
54af : d0 04 __ BNE $54b5 ; (colorize_standard.s28 + 0)
.s13:
54b1 : e8 __ __ INX
54b2 : 4c c9 54 JMP $54c9 ; (colorize_standard.s14 + 0)
.s28:
54b5 : c9 01 __ CMP #$01
54b7 : d0 05 __ BNE $54be ; (colorize_standard.s29 + 0)
.s32:
54b9 : e6 1c __ INC ACCU + 1 
54bb : 4c c9 54 JMP $54c9 ; (colorize_standard.s14 + 0)
.s29:
54be : c9 02 __ CMP #$02
54c0 : f0 05 __ BEQ $54c7 ; (colorize_standard.s31 + 0)
.s30:
54c2 : e6 4e __ INC T11 + 0 
54c4 : 4c c9 54 JMP $54c9 ; (colorize_standard.s14 + 0)
.s31:
54c7 : e6 4d __ INC T10 + 0 
.s14:
54c9 : c8 __ __ INY
54ca : c0 08 __ CPY #$08
54cc : b0 03 __ BCS $54d1 ; (colorize_standard.s15 + 0)
54ce : 4c 46 54 JMP $5446 ; (colorize_standard.l49 + 0)
.s15:
54d1 : 18 __ __ CLC
54d2 : a5 4d __ LDA T10 + 0 
54d4 : 65 1c __ ADC ACCU + 1 
54d6 : 85 4b __ STA T5 + 0 
54d8 : a9 00 __ LDA #$00
54da : 2a __ __ ROL
54db : a8 __ __ TAY
54dc : a5 4b __ LDA T5 + 0 
54de : 65 4e __ ADC T11 + 0 
54e0 : 85 4b __ STA T5 + 0 
54e2 : 98 __ __ TYA
54e3 : 69 00 __ ADC #$00
54e5 : 05 4b __ ORA T5 + 0 
54e7 : f0 02 __ BEQ $54eb ; (colorize_standard.s53 + 0)
.s52:
54e9 : a9 01 __ LDA #$01
.s53:
54eb : 85 4b __ STA T5 + 0 
54ed : 8a __ __ TXA
54ee : f0 03 __ BEQ $54f3 ; (colorize_standard.s16 + 0)
54f0 : 4c 92 55 JMP $5592 ; (colorize_standard.s26 + 0)
.s16:
54f3 : a5 4b __ LDA T5 + 0 
54f5 : f0 22 __ BEQ $5519 ; (colorize_standard.s17 + 0)
.s19:
54f7 : a5 1c __ LDA ACCU + 1 
54f9 : c5 4d __ CMP T10 + 0 
54fb : b0 04 __ BCS $5501 ; (colorize_standard.s20 + 0)
.s25:
54fd : a9 02 __ LDA #$02
54ff : 90 02 __ BCC $5503 ; (colorize_standard.s21 + 0)
.s20:
5501 : a9 01 __ LDA #$01
.s21:
5503 : 85 4b __ STA T5 + 0 
5505 : a5 4d __ LDA T10 + 0 
5507 : c5 4e __ CMP T11 + 0 
5509 : b0 06 __ BCS $5511 ; (colorize_standard.s22 + 0)
.s23:
550b : a5 1c __ LDA ACCU + 1 
550d : c5 4e __ CMP T11 + 0 
550f : 90 04 __ BCC $5515 ; (colorize_standard.s24 + 0)
.s22:
5511 : c6 4b __ DEC T5 + 0 
5513 : b0 04 __ BCS $5519 ; (colorize_standard.s17 + 0)
.s24:
5515 : a9 02 __ LDA #$02
.s48:
5517 : 85 4b __ STA T5 + 0 
.s17:
5519 : 18 __ __ CLC
551a : a5 4a __ LDA T4 + 0 
551c : 65 43 __ ADC T0 + 0 
551e : 0a __ __ ASL
551f : 0a __ __ ASL
5520 : 85 1b __ STA ACCU + 0 
5522 : a9 00 __ LDA #$00
5524 : 85 1c __ STA ACCU + 1 
5526 : 85 04 __ STA WORK + 1 
5528 : a9 41 __ LDA #$41
552a : 85 03 __ STA WORK + 0 
552c : 20 4d 78 JSR $784d ; (divmod + 0)
552f : a6 1b __ LDX ACCU + 0 
5531 : bd a5 7b LDA $7ba5,x ; (__multab12L + 0)
5534 : 18 __ __ CLC
5535 : 65 0d __ ADC P0 ; (pal + 0)
5537 : 85 1b __ STA ACCU + 0 
5539 : a5 0e __ LDA P1 ; (pal + 1)
553b : 69 00 __ ADC #$00
553d : aa __ __ TAX
553e : a4 4b __ LDY T5 + 0 
5540 : b9 a9 7b LDA $7ba9,y ; (__multab3L + 0)
5543 : 18 __ __ CLC
5544 : 65 1b __ ADC ACCU + 0 
5546 : 85 1b __ STA ACCU + 0 
5548 : 90 01 __ BCC $554b ; (colorize_standard.s55 + 0)
.s54:
554a : e8 __ __ INX
.s55:
554b : 86 1c __ STX ACCU + 1 
554d : a0 00 __ LDY #$00
554f : b1 1b __ LDA (ACCU + 0),y 
5551 : 0a __ __ ASL
5552 : 0a __ __ ASL
5553 : 0a __ __ ASL
5554 : 0a __ __ ASL
5555 : c8 __ __ INY
5556 : 11 1b __ ORA (ACCU + 0),y 
5558 : 88 __ __ DEY
5559 : 91 46 __ STA (T2 + 0),y 
555b : a0 02 __ LDY #$02
555d : b1 1b __ LDA (ACCU + 0),y 
555f : a0 00 __ LDY #$00
5561 : 91 48 __ STA (T3 + 0),y 
5563 : e6 46 __ INC T2 + 0 
5565 : d0 02 __ BNE $5569 ; (colorize_standard.s57 + 0)
.s56:
5567 : e6 47 __ INC T2 + 1 
.s57:
5569 : e6 48 __ INC T3 + 0 
556b : d0 02 __ BNE $556f ; (colorize_standard.s59 + 0)
.s58:
556d : e6 49 __ INC T3 + 1 
.s59:
556f : e6 4a __ INC T4 + 0 
5571 : a5 4a __ LDA T4 + 0 
5573 : c9 28 __ CMP #$28
5575 : f0 03 __ BEQ $557a ; (colorize_standard.s18 + 0)
5577 : 4c 2a 54 JMP $542a ; (colorize_standard.l6 + 0)
.s18:
557a : a5 44 __ LDA T1 + 0 
557c : 69 3f __ ADC #$3f
557e : 85 44 __ STA T1 + 0 
5580 : a5 45 __ LDA T1 + 1 
5582 : 69 01 __ ADC #$01
5584 : 85 45 __ STA T1 + 1 
5586 : e6 43 __ INC T0 + 0 
5588 : a5 43 __ LDA T0 + 0 
558a : c9 19 __ CMP #$19
558c : f0 03 __ BEQ $5591 ; (colorize_standard.s3 + 0)
558e : 4c 26 54 JMP $5426 ; (colorize_standard.l5 + 0)
.s3:
5591 : 60 __ __ RTS
.s26:
5592 : a5 4b __ LDA T5 + 0 
5594 : f0 83 __ BEQ $5519 ; (colorize_standard.s17 + 0)
.s27:
5596 : a9 03 __ LDA #$03
5598 : 4c 17 55 JMP $5517 ; (colorize_standard.s48 + 0)
--------------------------------------------------------------------
ball_run: ; ball_run()->void
;   3, "/home/xahmol/git/UltimateDemo2026/src/ball.h"
.s1:
559b : a2 0d __ LDX #$0d
559d : b5 53 __ LDA T0 + 0,x 
559f : 9d af bf STA $bfaf,x ; (ball_run@stack + 0)
55a2 : ca __ __ DEX
55a3 : 10 f8 __ BPL $559d ; (ball_run.s1 + 2)
.s4:
55a5 : a9 8f __ LDA #$8f
55a7 : 20 59 16 JSR $1659 ; (turbo_set.s4 + 0)
55aa : 20 58 57 JSR $5758 ; (ball_init.s4 + 0)
55ad : a9 00 __ LDA #$00
55af : 85 55 __ STA T1 + 0 
55b1 : 85 56 __ STA T2 + 0 
55b3 : 85 57 __ STA T3 + 0 
55b5 : 85 58 __ STA T4 + 0 
55b7 : 85 59 __ STA T5 + 0 
55b9 : a9 a8 __ LDA #$a8
55bb : 85 5a __ STA T6 + 0 
55bd : a9 fd __ LDA #$fd
55bf : 85 5b __ STA T6 + 1 
.l5:
55c1 : 2c 11 d0 BIT $d011 
55c4 : 30 fb __ BMI $55c1 ; (ball_run.l5 + 0)
.l6:
55c6 : 2c 11 d0 BIT $d011 
55c9 : 10 fb __ BPL $55c6 ; (ball_run.l6 + 0)
.s7:
55cb : a9 00 __ LDA #$00
55cd : 85 0f __ STA P2 
55cf : 85 10 __ STA P3 
55d1 : 85 0d __ STA P0 
55d3 : 20 ff 7b JSR $7bff ; (memset@proxy + 0)
55d6 : a5 55 __ LDA T1 + 0 
55d8 : 29 3f __ AND #$3f
55da : aa __ __ TAX
55db : bd 00 80 LDA $8000,x ; (sin64[0] + 0)
55de : 85 5c __ STA T7 + 0 
55e0 : 29 80 __ AND #$80
55e2 : 10 02 __ BPL $55e6 ; (ball_run.s7 + 27)
55e4 : a9 ff __ LDA #$ff
55e6 : 85 5d __ STA T7 + 1 
55e8 : bd 00 80 LDA $8000,x ; (sin64[0] + 0)
55eb : 10 0d __ BPL $55fa ; (ball_run.s8 + 0)
.s10:
55ed : 38 __ __ SEC
55ee : a9 00 __ LDA #$00
55f0 : e5 5c __ SBC T7 + 0 
55f2 : 85 5c __ STA T7 + 0 
55f4 : a9 00 __ LDA #$00
55f6 : e5 5d __ SBC T7 + 1 
55f8 : 85 5d __ STA T7 + 1 
.s8:
55fa : a5 58 __ LDA T4 + 0 
55fc : 85 18 __ STA P11 
55fe : a5 57 __ LDA T3 + 0 
5600 : 29 3f __ AND #$3f
5602 : aa __ __ TAX
5603 : bd 00 80 LDA $8000,x ; (sin64[0] + 0)
5606 : 85 60 __ STA T9 + 0 
5608 : a5 56 __ LDA T2 + 0 
560a : 29 3f __ AND #$3f
560c : aa __ __ TAX
560d : bd 00 80 LDA $8000,x ; (sin64[0] + 0)
5610 : 85 53 __ STA T0 + 0 
5612 : 29 80 __ AND #$80
5614 : 10 02 __ BPL $5618 ; (ball_run.s8 + 30)
5616 : a9 ff __ LDA #$ff
5618 : 85 54 __ STA T0 + 1 
561a : 20 b1 57 JSR $57b1 ; (draw_floor.s4 + 0)
561d : a5 53 __ LDA T0 + 0 
561f : 0a __ __ ASL
5620 : 85 1b __ STA ACCU + 0 
5622 : a5 54 __ LDA T0 + 1 
5624 : 2a __ __ ROL
5625 : 06 1b __ ASL ACCU + 0 
5627 : 2a __ __ ROL
5628 : aa __ __ TAX
5629 : 18 __ __ CLC
562a : a5 1b __ LDA ACCU + 0 
562c : 65 53 __ ADC T0 + 0 
562e : 85 1b __ STA ACCU + 0 
5630 : 8a __ __ TXA
5631 : 65 54 __ ADC T0 + 1 
5633 : 06 1b __ ASL ACCU + 0 
5635 : 2a __ __ ROL
5636 : 06 1b __ ASL ACCU + 0 
5638 : 2a __ __ ROL
5639 : 06 1b __ ASL ACCU + 0 
563b : 2a __ __ ROL
563c : 06 1b __ ASL ACCU + 0 
563e : 2a __ __ ROL
563f : 85 1c __ STA ACCU + 1 
5641 : 20 3e 7c JSR $7c3e ; (divs16@proxy + 0)
5644 : 18 __ __ CLC
5645 : a5 1b __ LDA ACCU + 0 
5647 : 69 f0 __ ADC #$f0
5649 : 85 5e __ STA T8 + 0 
564b : a5 1c __ LDA ACCU + 1 
564d : 69 00 __ ADC #$00
564f : 85 5f __ STA T8 + 1 
5651 : a5 60 __ LDA T9 + 0 
5653 : 85 1b __ STA ACCU + 0 
5655 : 29 80 __ AND #$80
5657 : 10 02 __ BPL $565b ; (ball_run.s8 + 97)
5659 : a9 ff __ LDA #$ff
565b : 85 1c __ STA ACCU + 1 
565d : a9 1e __ LDA #$1e
565f : 20 62 77 JSR $7762 ; (mul16by8 + 0)
5662 : 20 3e 7c JSR $7c3e ; (divs16@proxy + 0)
5665 : a9 b4 __ LDA #$b4
5667 : 20 62 77 JSR $7762 ; (mul16by8 + 0)
566a : 20 19 7c JSR $7c19 ; (divs16@proxy + 0)
566d : 18 __ __ CLC
566e : a5 1b __ LDA ACCU + 0 
5670 : 69 50 __ ADC #$50
5672 : 85 12 __ STA P5 
5674 : a5 1c __ LDA ACCU + 1 
5676 : 69 00 __ ADC #$00
5678 : 85 13 __ STA P6 
567a : a9 50 __ LDA #$50
567c : 85 1b __ STA ACCU + 0 
567e : a9 46 __ LDA #$46
5680 : 85 1c __ STA ACCU + 1 
5682 : 20 19 7c JSR $7c19 ; (divs16@proxy + 0)
5685 : 18 __ __ CLC
5686 : a5 1b __ LDA ACCU + 0 
5688 : 69 48 __ ADC #$48
568a : 85 14 __ STA P7 
568c : a5 1c __ LDA ACCU + 1 
568e : 69 00 __ ADC #$00
5690 : 85 15 __ STA P8 
5692 : a9 a0 __ LDA #$a0
5694 : 85 1b __ STA ACCU + 0 
5696 : a9 05 __ LDA #$05
5698 : 85 1c __ STA ACCU + 1 
569a : 20 19 7c JSR $7c19 ; (divs16@proxy + 0)
569d : a5 1b __ LDA ACCU + 0 
569f : 85 16 __ STA P9 
56a1 : a5 1c __ LDA ACCU + 1 
56a3 : 85 17 __ STA P10 
56a5 : a9 1c __ LDA #$1c
56a7 : 85 1b __ STA ACCU + 0 
56a9 : a9 02 __ LDA #$02
56ab : 85 1c __ STA ACCU + 1 
56ad : 20 19 7c JSR $7c19 ; (divs16@proxy + 0)
56b0 : a5 1b __ LDA ACCU + 0 
56b2 : 8d ea bf STA $bfea ; (sstack + 0)
56b5 : a5 1c __ LDA ACCU + 1 
56b7 : 8d eb bf STA $bfeb ; (sstack + 1)
56ba : 20 10 5c JSR $5c10 ; (draw_shadow.s4 + 0)
56bd : a5 12 __ LDA P5 
56bf : 8d ea bf STA $bfea ; (sstack + 0)
56c2 : a5 13 __ LDA P6 
56c4 : 8d eb bf STA $bfeb ; (sstack + 1)
56c7 : a5 59 __ LDA T5 + 0 
56c9 : 8d ee bf STA $bfee ; (sstack + 4)
56cc : 18 __ __ CLC
56cd : 69 02 __ ADC #$02
56cf : 85 59 __ STA T5 + 0 
56d1 : a5 5c __ LDA T7 + 0 
56d3 : 85 1b __ STA ACCU + 0 
56d5 : a5 5d __ LDA T7 + 1 
56d7 : 85 1c __ STA ACCU + 1 
56d9 : a9 3c __ LDA #$3c
56db : 20 62 77 JSR $7762 ; (mul16by8 + 0)
56de : a9 7f __ LDA #$7f
56e0 : 85 03 __ STA WORK + 0 
56e2 : 20 49 78 JSR $7849 ; (divmod@proxy + 0)
56e5 : 38 __ __ SEC
56e6 : a9 64 __ LDA #$64
56e8 : e5 1b __ SBC ACCU + 0 
56ea : 85 1b __ STA ACCU + 0 
56ec : a9 00 __ LDA #$00
56ee : 85 1c __ STA ACCU + 1 
56f0 : a9 b4 __ LDA #$b4
56f2 : 20 62 77 JSR $7762 ; (mul16by8 + 0)
56f5 : 20 19 7c JSR $7c19 ; (divs16@proxy + 0)
56f8 : 18 __ __ CLC
56f9 : a5 1b __ LDA ACCU + 0 
56fb : 69 48 __ ADC #$48
56fd : 8d ec bf STA $bfec ; (sstack + 2)
5700 : a5 1c __ LDA ACCU + 1 
5702 : 69 00 __ ADC #$00
5704 : 8d ed bf STA $bfed ; (sstack + 3)
5707 : a9 40 __ LDA #$40
5709 : 85 1b __ STA ACCU + 0 
570b : a9 0b __ LDA #$0b
570d : 85 1c __ STA ACCU + 1 
570f : 20 19 7c JSR $7c19 ; (divs16@proxy + 0)
5712 : a5 1b __ LDA ACCU + 0 
5714 : 8d ef bf STA $bfef ; (sstack + 5)
5717 : a5 1c __ LDA ACCU + 1 
5719 : 8d f0 bf STA $bff0 ; (sstack + 6)
571c : 20 a9 5d JSR $5da9 ; (draw_ball.s1 + 0)
571f : e6 58 __ INC T4 + 0 
5721 : e6 57 __ INC T3 + 0 
5723 : e6 57 __ INC T3 + 0 
5725 : e6 56 __ INC T2 + 0 
5727 : e6 55 __ INC T1 + 0 
5729 : e6 55 __ INC T1 + 0 
572b : e6 5a __ INC T6 + 0 
572d : f0 03 __ BEQ $5732 ; (ball_run.s11 + 0)
572f : 4c c1 55 JMP $55c1 ; (ball_run.l5 + 0)
.s11:
5732 : e6 5b __ INC T6 + 1 
5734 : d0 f9 __ BNE $572f ; (ball_run.s8 + 309)
.s9:
5736 : a9 00 __ LDA #$00
5738 : 85 0d __ STA P0 
573a : 85 0e __ STA P1 
573c : 85 10 __ STA P3 
573e : a9 36 __ LDA #$36
5740 : 85 01 __ STA $01 
5742 : 20 71 0f JSR $0f71 ; (vic_setmode@proxy + 0)
5745 : a9 00 __ LDA #$00
5747 : 8d 20 d0 STA $d020 
574a : 8d 21 d0 STA $d021 
.s3:
574d : a2 0d __ LDX #$0d
574f : bd af bf LDA $bfaf,x ; (ball_run@stack + 0)
5752 : 95 53 __ STA T0 + 0,x 
5754 : ca __ __ DEX
5755 : 10 f8 __ BPL $574f ; (ball_run.s3 + 2)
5757 : 60 __ __ RTS
--------------------------------------------------------------------
ball_init: ; ball_init()->void
; 293, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5758 : 78 __ __ SEI
5759 : a9 35 __ LDA #$35
575b : 85 01 __ STA $01 
575d : 20 0d 24 JSR $240d ; (mmap_trampoline.s4 + 0)
5760 : 58 __ __ CLI
5761 : a9 00 __ LDA #$00
5763 : 85 0f __ STA P2 
5765 : 85 10 __ STA P3 
5767 : 85 43 __ STA T0 + 0 
5769 : 85 0d __ STA P0 
576b : 20 ff 7b JSR $7bff ; (memset@proxy + 0)
576e : a9 c0 __ LDA #$c0
5770 : 85 44 __ STA T0 + 1 
5772 : a9 00 __ LDA #$00
5774 : 85 1f __ STA ADDR + 0 
5776 : f0 02 __ BEQ $577a ; (ball_init.l7 + 0)
.s8:
5778 : e6 44 __ INC T0 + 1 
.l7:
577a : a9 12 __ LDA #$12
577c : a0 00 __ LDY #$00
577e : 91 43 __ STA (T0 + 0),y 
5780 : 18 __ __ CLC
5781 : a5 44 __ LDA T0 + 1 
5783 : 69 18 __ ADC #$18
5785 : 85 20 __ STA ADDR + 1 
5787 : a9 0c __ LDA #$0c
5789 : a4 43 __ LDY T0 + 0 
578b : 91 1f __ STA (ADDR + 0),y 
578d : 98 __ __ TYA
578e : 18 __ __ CLC
578f : 69 01 __ ADC #$01
5791 : 85 43 __ STA T0 + 0 
5793 : b0 e3 __ BCS $5778 ; (ball_init.s8 + 0)
.s9:
5795 : c9 e8 __ CMP #$e8
5797 : d0 e1 __ BNE $577a ; (ball_init.l7 + 0)
.s6:
5799 : a5 44 __ LDA T0 + 1 
579b : c9 c3 __ CMP #$c3
579d : d0 db __ BNE $577a ; (ball_init.l7 + 0)
.s5:
579f : a9 00 __ LDA #$00
57a1 : 85 0e __ STA P1 
57a3 : 85 10 __ STA P3 
57a5 : 20 5f 7c JSR $7c5f ; (vic_setmode@proxy + 0)
57a8 : a9 00 __ LDA #$00
57aa : 8d 21 d0 STA $d021 
57ad : 8d 20 d0 STA $d020 
.s3:
57b0 : 60 __ __ RTS
--------------------------------------------------------------------
draw_floor: ; draw_floor(u8)->void
; 137, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
57b1 : a9 00 __ LDA #$00
57b3 : 85 51 __ STA T3 + 0 
.l5:
57b5 : a5 18 __ LDA P11 ; (floor_rot + 0)
57b7 : 85 11 __ STA P4 
57b9 : a9 b0 __ LDA #$b0
57bb : 85 0d __ STA P0 
57bd : a9 ff __ LDA #$ff
57bf : 85 0e __ STA P1 
57c1 : a5 51 __ LDA T3 + 0 
57c3 : 0a __ __ ASL
57c4 : aa __ __ TAX
57c5 : a9 e8 __ LDA #$e8
57c7 : 85 12 __ STA P5 
57c9 : a9 bf __ LDA #$bf
57cb : 85 13 __ STA P6 
57cd : a9 e6 __ LDA #$e6
57cf : 85 14 __ STA P7 
57d1 : a9 bf __ LDA #$bf
57d3 : 85 15 __ STA P8 
57d5 : bd ca 80 LDA $80ca,x ; (gz[0] + 0)
57d8 : 85 0f __ STA P2 
57da : bd cb 80 LDA $80cb,x ; (gz[0] + 1)
57dd : 85 10 __ STA P3 
57df : 20 ad 59 JSR $59ad ; (rotate_y.s4 + 0)
57e2 : e6 0e __ INC P1 
57e4 : a9 50 __ LDA #$50
57e6 : 85 0d __ STA P0 
57e8 : a9 e4 __ LDA #$e4
57ea : 85 12 __ STA P5 
57ec : a9 bf __ LDA #$bf
57ee : 85 15 __ STA P8 
57f0 : a9 bf __ LDA #$bf
57f2 : 85 13 __ STA P6 
57f4 : a9 e2 __ LDA #$e2
57f6 : 85 14 __ STA P7 
57f8 : 20 ad 59 JSR $59ad ; (rotate_y.s4 + 0)
57fb : ad e7 bf LDA $bfe7 ; (rz0 + 1)
57fe : 30 1a __ BMI $581a ; (draw_floor.s8 + 0)
.s21:
5800 : d0 07 __ BNE $5809 ; (draw_floor.s6 + 0)
.s20:
5802 : ad e6 bf LDA $bfe6 ; (rz0 + 0)
5805 : c9 0f __ CMP #$0f
5807 : 90 11 __ BCC $581a ; (draw_floor.s8 + 0)
.s6:
5809 : ad e3 bf LDA $bfe3 ; (rz1 + 1)
580c : 30 0c __ BMI $581a ; (draw_floor.s8 + 0)
.s19:
580e : f0 03 __ BEQ $5813 ; (draw_floor.s18 + 0)
5810 : 4c 1f 59 JMP $591f ; (draw_floor.s7 + 0)
.s18:
5813 : ad e2 bf LDA $bfe2 ; (rz1 + 0)
5816 : c9 0f __ CMP #$0f
5818 : b0 f6 __ BCS $5810 ; (draw_floor.s19 + 2)
.s8:
581a : e6 51 __ INC T3 + 0 
581c : a5 51 __ LDA T3 + 0 
581e : c9 07 __ CMP #$07
5820 : d0 93 __ BNE $57b5 ; (draw_floor.l5 + 0)
.s9:
5822 : a9 00 __ LDA #$00
5824 : 85 51 __ STA T3 + 0 
.l10:
5826 : a5 18 __ LDA P11 ; (floor_rot + 0)
5828 : 85 11 __ STA P4 
582a : a9 a0 __ LDA #$a0
582c : 85 0f __ STA P2 
582e : a9 00 __ LDA #$00
5830 : 85 10 __ STA P3 
5832 : a5 51 __ LDA T3 + 0 
5834 : 0a __ __ ASL
5835 : aa __ __ TAX
5836 : a9 e0 __ LDA #$e0
5838 : 85 12 __ STA P5 
583a : a9 bf __ LDA #$bf
583c : 85 13 __ STA P6 
583e : a9 de __ LDA #$de
5840 : 85 14 __ STA P7 
5842 : a9 bf __ LDA #$bf
5844 : 85 15 __ STA P8 
5846 : bd d8 80 LDA $80d8,x ; (gx[0] + 0)
5849 : 85 0d __ STA P0 
584b : bd d9 80 LDA $80d9,x ; (gx[0] + 1)
584e : 85 0e __ STA P1 
5850 : 20 ad 59 JSR $59ad ; (rotate_y.s4 + 0)
5853 : e6 10 __ INC P3 
5855 : a9 40 __ LDA #$40
5857 : 85 0f __ STA P2 
5859 : a9 dc __ LDA #$dc
585b : 85 12 __ STA P5 
585d : a9 bf __ LDA #$bf
585f : 85 15 __ STA P8 
5861 : a9 bf __ LDA #$bf
5863 : 85 13 __ STA P6 
5865 : a9 da __ LDA #$da
5867 : 85 14 __ STA P7 
5869 : 20 ad 59 JSR $59ad ; (rotate_y.s4 + 0)
586c : ad df bf LDA $bfdf ; (rz0 + 1)
586f : 30 17 __ BMI $5888 ; (draw_floor.s13 + 0)
.s17:
5871 : d0 07 __ BNE $587a ; (draw_floor.s11 + 0)
.s16:
5873 : ad de bf LDA $bfde ; (rz0 + 0)
5876 : c9 0f __ CMP #$0f
5878 : 90 0e __ BCC $5888 ; (draw_floor.s13 + 0)
.s11:
587a : ad db bf LDA $bfdb ; (rz1 + 1)
587d : 30 09 __ BMI $5888 ; (draw_floor.s13 + 0)
.s15:
587f : d0 10 __ BNE $5891 ; (draw_floor.s12 + 0)
.s14:
5881 : ad da bf LDA $bfda ; (rz1 + 0)
5884 : c9 0f __ CMP #$0f
5886 : b0 09 __ BCS $5891 ; (draw_floor.s12 + 0)
.s13:
5888 : e6 51 __ INC T3 + 0 
588a : a5 51 __ LDA T3 + 0 
588c : c9 07 __ CMP #$07
588e : d0 96 __ BNE $5826 ; (draw_floor.l10 + 0)
.s3:
5890 : 60 __ __ RTS
.s12:
5891 : ad e0 bf LDA $bfe0 ; (rx0 + 0)
5894 : 85 1b __ STA ACCU + 0 
5896 : ad e1 bf LDA $bfe1 ; (rx0 + 1)
5899 : 85 1c __ STA ACCU + 1 
589b : a9 b4 __ LDA #$b4
589d : 20 62 77 JSR $7762 ; (mul16by8 + 0)
58a0 : ad de bf LDA $bfde ; (rz0 + 0)
58a3 : 85 03 __ STA WORK + 0 
58a5 : ad df bf LDA $bfdf ; (rz0 + 1)
58a8 : 85 04 __ STA WORK + 1 
58aa : 20 12 78 JSR $7812 ; (divs16 + 0)
58ad : 18 __ __ CLC
58ae : a5 1b __ LDA ACCU + 0 
58b0 : 69 50 __ ADC #$50
58b2 : 85 12 __ STA P5 
58b4 : a5 1c __ LDA ACCU + 1 
58b6 : 69 00 __ ADC #$00
58b8 : 85 13 __ STA P6 
58ba : ad de bf LDA $bfde ; (rz0 + 0)
58bd : 85 03 __ STA WORK + 0 
58bf : ad df bf LDA $bfdf ; (rz0 + 1)
58c2 : 85 04 __ STA WORK + 1 
58c4 : 20 49 7c JSR $7c49 ; (divmod@proxy + 0)
58c7 : 18 __ __ CLC
58c8 : a5 1b __ LDA ACCU + 0 
58ca : 69 48 __ ADC #$48
58cc : 85 14 __ STA P7 
58ce : a5 1c __ LDA ACCU + 1 
58d0 : 69 00 __ ADC #$00
58d2 : 85 15 __ STA P8 
58d4 : ad dc bf LDA $bfdc ; (rx1 + 0)
58d7 : 85 1b __ STA ACCU + 0 
58d9 : ad dd bf LDA $bfdd ; (rx1 + 1)
58dc : 85 1c __ STA ACCU + 1 
58de : a9 b4 __ LDA #$b4
58e0 : 20 62 77 JSR $7762 ; (mul16by8 + 0)
58e3 : ad da bf LDA $bfda ; (rz1 + 0)
58e6 : 85 03 __ STA WORK + 0 
58e8 : ad db bf LDA $bfdb ; (rz1 + 1)
58eb : 85 04 __ STA WORK + 1 
58ed : 20 12 78 JSR $7812 ; (divs16 + 0)
58f0 : 18 __ __ CLC
58f1 : a5 1b __ LDA ACCU + 0 
58f3 : 69 50 __ ADC #$50
58f5 : 85 16 __ STA P9 
58f7 : a5 1c __ LDA ACCU + 1 
58f9 : 69 00 __ ADC #$00
58fb : 85 17 __ STA P10 
58fd : ad da bf LDA $bfda ; (rz1 + 0)
5900 : 85 03 __ STA WORK + 0 
5902 : ad db bf LDA $bfdb ; (rz1 + 1)
5905 : 85 04 __ STA WORK + 1 
5907 : 20 49 7c JSR $7c49 ; (divmod@proxy + 0)
590a : 18 __ __ CLC
590b : a5 1b __ LDA ACCU + 0 
590d : 69 48 __ ADC #$48
590f : 8d ea bf STA $bfea ; (sstack + 0)
5912 : a5 1c __ LDA ACCU + 1 
5914 : 69 00 __ ADC #$00
5916 : 8d eb bf STA $bfeb ; (sstack + 1)
5919 : 20 72 5a JSR $5a72 ; (mc_line.s4 + 0)
591c : 4c 88 58 JMP $5888 ; (draw_floor.s13 + 0)
.s7:
591f : ad e8 bf LDA $bfe8 ; (rx0 + 0)
5922 : 85 1b __ STA ACCU + 0 
5924 : ad e9 bf LDA $bfe9 ; (rx0 + 1)
5927 : 85 1c __ STA ACCU + 1 
5929 : a9 b4 __ LDA #$b4
592b : 20 62 77 JSR $7762 ; (mul16by8 + 0)
592e : ad e6 bf LDA $bfe6 ; (rz0 + 0)
5931 : 85 03 __ STA WORK + 0 
5933 : ad e7 bf LDA $bfe7 ; (rz0 + 1)
5936 : 85 04 __ STA WORK + 1 
5938 : 20 12 78 JSR $7812 ; (divs16 + 0)
593b : 18 __ __ CLC
593c : a5 1b __ LDA ACCU + 0 
593e : 69 50 __ ADC #$50
5940 : 85 12 __ STA P5 
5942 : a5 1c __ LDA ACCU + 1 
5944 : 69 00 __ ADC #$00
5946 : 85 13 __ STA P6 
5948 : ad e6 bf LDA $bfe6 ; (rz0 + 0)
594b : 85 03 __ STA WORK + 0 
594d : ad e7 bf LDA $bfe7 ; (rz0 + 1)
5950 : 85 04 __ STA WORK + 1 
5952 : 20 49 7c JSR $7c49 ; (divmod@proxy + 0)
5955 : 18 __ __ CLC
5956 : a5 1b __ LDA ACCU + 0 
5958 : 69 48 __ ADC #$48
595a : 85 14 __ STA P7 
595c : a5 1c __ LDA ACCU + 1 
595e : 69 00 __ ADC #$00
5960 : 85 15 __ STA P8 
5962 : ad e4 bf LDA $bfe4 ; (rx1 + 0)
5965 : 85 1b __ STA ACCU + 0 
5967 : ad e5 bf LDA $bfe5 ; (rx1 + 1)
596a : 85 1c __ STA ACCU + 1 
596c : a9 b4 __ LDA #$b4
596e : 20 62 77 JSR $7762 ; (mul16by8 + 0)
5971 : ad e2 bf LDA $bfe2 ; (rz1 + 0)
5974 : 85 03 __ STA WORK + 0 
5976 : ad e3 bf LDA $bfe3 ; (rz1 + 1)
5979 : 85 04 __ STA WORK + 1 
597b : 20 12 78 JSR $7812 ; (divs16 + 0)
597e : 18 __ __ CLC
597f : a5 1b __ LDA ACCU + 0 
5981 : 69 50 __ ADC #$50
5983 : 85 16 __ STA P9 
5985 : a5 1c __ LDA ACCU + 1 
5987 : 69 00 __ ADC #$00
5989 : 85 17 __ STA P10 
598b : ad e2 bf LDA $bfe2 ; (rz1 + 0)
598e : 85 03 __ STA WORK + 0 
5990 : ad e3 bf LDA $bfe3 ; (rz1 + 1)
5993 : 85 04 __ STA WORK + 1 
5995 : 20 49 7c JSR $7c49 ; (divmod@proxy + 0)
5998 : 18 __ __ CLC
5999 : a5 1b __ LDA ACCU + 0 
599b : 69 48 __ ADC #$48
599d : 8d ea bf STA $bfea ; (sstack + 0)
59a0 : a5 1c __ LDA ACCU + 1 
59a2 : 69 00 __ ADC #$00
59a4 : 8d eb bf STA $bfeb ; (sstack + 1)
59a7 : 20 72 5a JSR $5a72 ; (mc_line.s4 + 0)
59aa : 4c 1a 58 JMP $581a ; (draw_floor.s8 + 0)
--------------------------------------------------------------------
rotate_y: ; rotate_y(i16,i16,u8,i16*,i16*)->void
; 128, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
59ad : a5 11 __ LDA P4 ; (angle + 0)
59af : 29 3f __ AND #$3f
59b1 : aa __ __ TAX
59b2 : bd 00 80 LDA $8000,x ; (sin64[0] + 0)
59b5 : 85 45 __ STA T1 + 0 
59b7 : 85 03 __ STA WORK + 0 
59b9 : 29 80 __ AND #$80
59bb : 10 02 __ BPL $59bf ; (rotate_y.s4 + 18)
59bd : a9 ff __ LDA #$ff
59bf : 85 46 __ STA T1 + 1 
59c1 : 85 04 __ STA WORK + 1 
59c3 : a5 0f __ LDA P2 ; (z + 0)
59c5 : 38 __ __ SEC
59c6 : e9 f0 __ SBC #$f0
59c8 : 85 47 __ STA T2 + 0 
59ca : 85 1b __ STA ACCU + 0 
59cc : a5 10 __ LDA P3 ; (z + 1)
59ce : e9 00 __ SBC #$00
59d0 : 85 48 __ STA T2 + 1 
59d2 : 85 1c __ STA ACCU + 1 
59d4 : 20 d0 77 JSR $77d0 ; (mul16 + 0)
59d7 : a5 05 __ LDA WORK + 2 
59d9 : 85 49 __ STA T3 + 0 
59db : a5 06 __ LDA WORK + 3 
59dd : 85 4a __ STA T3 + 1 
59df : 18 __ __ CLC
59e0 : a5 11 __ LDA P4 ; (angle + 0)
59e2 : 69 10 __ ADC #$10
59e4 : 29 3f __ AND #$3f
59e6 : aa __ __ TAX
59e7 : bd 00 80 LDA $8000,x ; (sin64[0] + 0)
59ea : 85 43 __ STA T0 + 0 
59ec : 85 03 __ STA WORK + 0 
59ee : 29 80 __ AND #$80
59f0 : 10 02 __ BPL $59f4 ; (rotate_y.s4 + 71)
59f2 : a9 ff __ LDA #$ff
59f4 : 85 44 __ STA T0 + 1 
59f6 : 85 04 __ STA WORK + 1 
59f8 : a5 0d __ LDA P0 ; (x + 0)
59fa : 85 1b __ STA ACCU + 0 
59fc : a5 0e __ LDA P1 ; (x + 1)
59fe : 85 1c __ STA ACCU + 1 
5a00 : 20 d0 77 JSR $77d0 ; (mul16 + 0)
5a03 : 18 __ __ CLC
5a04 : a5 05 __ LDA WORK + 2 
5a06 : 65 49 __ ADC T3 + 0 
5a08 : 85 1b __ STA ACCU + 0 
5a0a : a5 06 __ LDA WORK + 3 
5a0c : 65 4a __ ADC T3 + 1 
5a0e : 85 1c __ STA ACCU + 1 
5a10 : 20 3e 7c JSR $7c3e ; (divs16@proxy + 0)
5a13 : a5 1b __ LDA ACCU + 0 
5a15 : a0 00 __ LDY #$00
5a17 : 91 12 __ STA (P5),y ; (rx + 0)
5a19 : a5 1c __ LDA ACCU + 1 
5a1b : c8 __ __ INY
5a1c : 91 12 __ STA (P5),y ; (rx + 0)
5a1e : 38 __ __ SEC
5a1f : a9 00 __ LDA #$00
5a21 : e5 0d __ SBC P0 ; (x + 0)
5a23 : 85 1b __ STA ACCU + 0 
5a25 : a9 00 __ LDA #$00
5a27 : e5 0e __ SBC P1 ; (x + 1)
5a29 : 85 1c __ STA ACCU + 1 
5a2b : a5 45 __ LDA T1 + 0 
5a2d : 85 03 __ STA WORK + 0 
5a2f : a5 46 __ LDA T1 + 1 
5a31 : 85 04 __ STA WORK + 1 
5a33 : 20 d0 77 JSR $77d0 ; (mul16 + 0)
5a36 : a5 05 __ LDA WORK + 2 
5a38 : 85 45 __ STA T1 + 0 
5a3a : a5 06 __ LDA WORK + 3 
5a3c : 85 46 __ STA T1 + 1 
5a3e : a5 47 __ LDA T2 + 0 
5a40 : 85 1b __ STA ACCU + 0 
5a42 : a5 48 __ LDA T2 + 1 
5a44 : 85 1c __ STA ACCU + 1 
5a46 : a5 43 __ LDA T0 + 0 
5a48 : 85 03 __ STA WORK + 0 
5a4a : a5 44 __ LDA T0 + 1 
5a4c : 85 04 __ STA WORK + 1 
5a4e : 20 d0 77 JSR $77d0 ; (mul16 + 0)
5a51 : 18 __ __ CLC
5a52 : a5 05 __ LDA WORK + 2 
5a54 : 65 45 __ ADC T1 + 0 
5a56 : 85 1b __ STA ACCU + 0 
5a58 : a5 06 __ LDA WORK + 3 
5a5a : 65 46 __ ADC T1 + 1 
5a5c : 85 1c __ STA ACCU + 1 
5a5e : 20 3e 7c JSR $7c3e ; (divs16@proxy + 0)
5a61 : 18 __ __ CLC
5a62 : a5 1b __ LDA ACCU + 0 
5a64 : 69 f0 __ ADC #$f0
5a66 : a0 00 __ LDY #$00
5a68 : 91 14 __ STA (P7),y ; (rz + 0)
5a6a : a5 1c __ LDA ACCU + 1 
5a6c : 69 00 __ ADC #$00
5a6e : c8 __ __ INY
5a6f : 91 14 __ STA (P7),y ; (rz + 0)
.s3:
5a71 : 60 __ __ RTS
--------------------------------------------------------------------
mc_line: ; mc_line(i16,i16,i16,i16,u8)->void
;  89, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5a72 : 38 __ __ SEC
5a73 : a5 16 __ LDA P9 ; (x1 + 0)
5a75 : e5 12 __ SBC P5 ; (x0 + 0)
5a77 : 85 43 __ STA T3 + 0 
5a79 : a5 17 __ LDA P10 ; (x1 + 1)
5a7b : e5 13 __ SBC P6 ; (x0 + 1)
5a7d : 85 44 __ STA T3 + 1 
5a7f : 10 0d __ BPL $5a8e ; (mc_line.s5 + 0)
.s37:
5a81 : 38 __ __ SEC
5a82 : a9 00 __ LDA #$00
5a84 : e5 43 __ SBC T3 + 0 
5a86 : 85 43 __ STA T3 + 0 
5a88 : a9 00 __ LDA #$00
5a8a : e5 44 __ SBC T3 + 1 
5a8c : 85 44 __ STA T3 + 1 
.s5:
5a8e : ad ea bf LDA $bfea ; (sstack + 0)
5a91 : 85 45 __ STA T4 + 0 
5a93 : 38 __ __ SEC
5a94 : e5 14 __ SBC P7 ; (y0 + 0)
5a96 : 85 47 __ STA T5 + 0 
5a98 : ad eb bf LDA $bfeb ; (sstack + 1)
5a9b : 85 46 __ STA T4 + 1 
5a9d : e5 15 __ SBC P8 ; (y0 + 1)
5a9f : 85 48 __ STA T5 + 1 
5aa1 : 10 0d __ BPL $5ab0 ; (mc_line.s6 + 0)
.s36:
5aa3 : 38 __ __ SEC
5aa4 : a9 00 __ LDA #$00
5aa6 : e5 47 __ SBC T5 + 0 
5aa8 : 85 47 __ STA T5 + 0 
5aaa : a9 00 __ LDA #$00
5aac : e5 48 __ SBC T5 + 1 
5aae : 85 48 __ STA T5 + 1 
.s6:
5ab0 : a5 13 __ LDA P6 ; (x0 + 1)
5ab2 : c5 17 __ CMP P10 ; (x1 + 1)
5ab4 : d0 08 __ BNE $5abe ; (mc_line.s35 + 0)
.s32:
5ab6 : a5 12 __ LDA P5 ; (x0 + 0)
5ab8 : c5 16 __ CMP P9 ; (x1 + 0)
.s33:
5aba : 90 08 __ BCC $5ac4 ; (mc_line.s31 + 0)
5abc : b0 0e __ BCS $5acc ; (mc_line.s7 + 0)
.s35:
5abe : 45 17 __ EOR P10 ; (x1 + 1)
5ac0 : 10 f8 __ BPL $5aba ; (mc_line.s33 + 0)
.s34:
5ac2 : 90 08 __ BCC $5acc ; (mc_line.s7 + 0)
.s31:
5ac4 : a9 01 __ LDA #$01
5ac6 : 85 49 __ STA T6 + 0 
5ac8 : a9 00 __ LDA #$00
5aca : f0 04 __ BEQ $5ad0 ; (mc_line.s8 + 0)
.s7:
5acc : a9 ff __ LDA #$ff
5ace : 85 49 __ STA T6 + 0 
.s8:
5ad0 : 85 4a __ STA T6 + 1 
5ad2 : a5 15 __ LDA P8 ; (y0 + 1)
5ad4 : c5 46 __ CMP T4 + 1 
5ad6 : d0 08 __ BNE $5ae0 ; (mc_line.s30 + 0)
.s27:
5ad8 : a5 14 __ LDA P7 ; (y0 + 0)
5ada : c5 45 __ CMP T4 + 0 
.s28:
5adc : 90 08 __ BCC $5ae6 ; (mc_line.s26 + 0)
5ade : b0 0e __ BCS $5aee ; (mc_line.s9 + 0)
.s30:
5ae0 : 45 46 __ EOR T4 + 1 
5ae2 : 10 f8 __ BPL $5adc ; (mc_line.s28 + 0)
.s29:
5ae4 : 90 08 __ BCC $5aee ; (mc_line.s9 + 0)
.s26:
5ae6 : a9 01 __ LDA #$01
5ae8 : 85 4b __ STA T7 + 0 
5aea : a9 00 __ LDA #$00
5aec : f0 04 __ BEQ $5af2 ; (mc_line.s10 + 0)
.s9:
5aee : a9 ff __ LDA #$ff
5af0 : 85 4b __ STA T7 + 0 
.s10:
5af2 : 85 4c __ STA T7 + 1 
5af4 : 38 __ __ SEC
5af5 : a5 43 __ LDA T3 + 0 
5af7 : e5 47 __ SBC T5 + 0 
5af9 : 85 4d __ STA T8 + 0 
5afb : a5 44 __ LDA T3 + 1 
5afd : e5 48 __ SBC T5 + 1 
5aff : 85 4e __ STA T8 + 1 
5b01 : 38 __ __ SEC
5b02 : a9 00 __ LDA #$00
5b04 : e5 47 __ SBC T5 + 0 
5b06 : 85 4f __ STA T9 + 0 
5b08 : a9 00 __ LDA #$00
5b0a : e5 48 __ SBC T5 + 1 
5b0c : 85 50 __ STA T9 + 1 
.l11:
5b0e : a5 12 __ LDA P5 ; (x0 + 0)
5b10 : 85 0d __ STA P0 
5b12 : a9 01 __ LDA #$01
5b14 : 85 11 __ STA P4 
5b16 : a5 13 __ LDA P6 ; (x0 + 1)
5b18 : 85 0e __ STA P1 
5b1a : a5 14 __ LDA P7 ; (y0 + 0)
5b1c : 85 0f __ STA P2 
5b1e : a5 15 __ LDA P8 ; (y0 + 1)
5b20 : 85 10 __ STA P3 
5b22 : 20 ad 5b JSR $5bad ; (mc_setpix.s4 + 0)
5b25 : a5 13 __ LDA P6 ; (x0 + 1)
5b27 : c5 17 __ CMP P10 ; (x1 + 1)
5b29 : d0 12 __ BNE $5b3d ; (mc_line.s12 + 0)
.s25:
5b2b : a5 12 __ LDA P5 ; (x0 + 0)
5b2d : c5 16 __ CMP P9 ; (x1 + 0)
5b2f : d0 0c __ BNE $5b3d ; (mc_line.s12 + 0)
.s23:
5b31 : a5 15 __ LDA P8 ; (y0 + 1)
5b33 : c5 46 __ CMP T4 + 1 
5b35 : d0 06 __ BNE $5b3d ; (mc_line.s12 + 0)
.s24:
5b37 : a5 14 __ LDA P7 ; (y0 + 0)
5b39 : c5 45 __ CMP T4 + 0 
5b3b : f0 63 __ BEQ $5ba0 ; (mc_line.s3 + 0)
.s12:
5b3d : a5 4d __ LDA T8 + 0 
5b3f : 0a __ __ ASL
5b40 : 85 1b __ STA ACCU + 0 
5b42 : a5 4e __ LDA T8 + 1 
5b44 : 2a __ __ ROL
5b45 : 85 1c __ STA ACCU + 1 
5b47 : a5 50 __ LDA T9 + 1 
5b49 : c5 1c __ CMP ACCU + 1 
5b4b : d0 08 __ BNE $5b55 ; (mc_line.s22 + 0)
.s19:
5b4d : a5 4f __ LDA T9 + 0 
5b4f : c5 1b __ CMP ACCU + 0 
.s20:
5b51 : 90 08 __ BCC $5b5b ; (mc_line.s18 + 0)
5b53 : b0 20 __ BCS $5b75 ; (mc_line.s13 + 0)
.s22:
5b55 : 45 1c __ EOR ACCU + 1 
5b57 : 10 f8 __ BPL $5b51 ; (mc_line.s20 + 0)
.s21:
5b59 : 90 1a __ BCC $5b75 ; (mc_line.s13 + 0)
.s18:
5b5b : 18 __ __ CLC
5b5c : a5 12 __ LDA P5 ; (x0 + 0)
5b5e : 65 49 __ ADC T6 + 0 
5b60 : 85 12 __ STA P5 ; (x0 + 0)
5b62 : a5 13 __ LDA P6 ; (x0 + 1)
5b64 : 65 4a __ ADC T6 + 1 
5b66 : 85 13 __ STA P6 ; (x0 + 1)
5b68 : 38 __ __ SEC
5b69 : a5 4d __ LDA T8 + 0 
5b6b : e5 47 __ SBC T5 + 0 
5b6d : 85 4d __ STA T8 + 0 
5b6f : a5 4e __ LDA T8 + 1 
5b71 : e5 48 __ SBC T5 + 1 
5b73 : 85 4e __ STA T8 + 1 
.s13:
5b75 : a5 1c __ LDA ACCU + 1 
5b77 : 30 0a __ BMI $5b83 ; (mc_line.s14 + 0)
.s17:
5b79 : c5 44 __ CMP T3 + 1 
5b7b : d0 04 __ BNE $5b81 ; (mc_line.s16 + 0)
.s15:
5b7d : a5 1b __ LDA ACCU + 0 
5b7f : c5 43 __ CMP T3 + 0 
.s16:
5b81 : b0 8b __ BCS $5b0e ; (mc_line.l11 + 0)
.s14:
5b83 : 18 __ __ CLC
5b84 : a5 14 __ LDA P7 ; (y0 + 0)
5b86 : 65 4b __ ADC T7 + 0 
5b88 : 85 14 __ STA P7 ; (y0 + 0)
5b8a : a5 15 __ LDA P8 ; (y0 + 1)
5b8c : 65 4c __ ADC T7 + 1 
5b8e : 85 15 __ STA P8 ; (y0 + 1)
5b90 : 18 __ __ CLC
5b91 : a5 4d __ LDA T8 + 0 
5b93 : 65 43 __ ADC T3 + 0 
5b95 : 85 4d __ STA T8 + 0 
5b97 : a5 4e __ LDA T8 + 1 
5b99 : 65 44 __ ADC T3 + 1 
5b9b : 85 4e __ STA T8 + 1 
5b9d : 4c 0e 5b JMP $5b0e ; (mc_line.l11 + 0)
.s3:
5ba0 : 60 __ __ RTS
--------------------------------------------------------------------
mc_setpix@proxy: ; mc_setpix@proxy
5ba1 : a5 46 __ LDA $46 
5ba3 : 85 0d __ STA P0 
5ba5 : a5 47 __ LDA $47 
5ba7 : 85 0e __ STA P1 
5ba9 : a5 18 __ LDA P11 
5bab : 85 11 __ STA P4 
--------------------------------------------------------------------
mc_setpix: ; mc_setpix(i16,i16,u8)->void
;  54, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5bad : a5 0e __ LDA P1 ; (mx + 1)
5baf : d0 5e __ BNE $5c0f ; (mc_setpix.s3 + 0)
.s9:
5bb1 : a5 0d __ LDA P0 ; (mx + 0)
5bb3 : c9 a0 __ CMP #$a0
5bb5 : b0 58 __ BCS $5c0f ; (mc_setpix.s3 + 0)
.s5:
5bb7 : a5 10 __ LDA P3 ; (my + 1)
5bb9 : d0 54 __ BNE $5c0f ; (mc_setpix.s3 + 0)
.s8:
5bbb : a5 0f __ LDA P2 ; (my + 0)
5bbd : c9 c8 __ CMP #$c8
5bbf : b0 4e __ BCS $5c0f ; (mc_setpix.s3 + 0)
.s6:
5bc1 : a5 0d __ LDA P0 ; (mx + 0)
5bc3 : 29 03 __ AND #$03
5bc5 : 49 03 __ EOR #$03
5bc7 : 0a __ __ ASL
5bc8 : 85 1b __ STA ACCU + 0 
5bca : a5 11 __ LDA P4 ; (col + 0)
5bcc : a6 1b __ LDX ACCU + 0 
5bce : f0 08 __ BEQ $5bd8 ; (mc_setpix.s7 + 0)
.l10:
5bd0 : 0a __ __ ASL
5bd1 : ca __ __ DEX
5bd2 : d0 fc __ BNE $5bd0 ; (mc_setpix.l10 + 0)
.s11:
5bd4 : 85 11 __ STA P4 ; (col + 0)
5bd6 : a6 1b __ LDX ACCU + 0 
.s7:
5bd8 : a5 0f __ LDA P2 ; (my + 0)
5bda : 29 07 __ AND #$07
5bdc : 85 1c __ STA ACCU + 1 
5bde : a5 0f __ LDA P2 ; (my + 0)
5be0 : 4a __ __ LSR
5be1 : 4a __ __ LSR
5be2 : 4a __ __ LSR
5be3 : 85 1b __ STA ACCU + 0 
5be5 : 0a __ __ ASL
5be6 : 0a __ __ ASL
5be7 : 65 1b __ ADC ACCU + 0 
5be9 : 4a __ __ LSR
5bea : 6a __ __ ROR
5beb : a8 __ __ TAY
5bec : 29 80 __ AND #$80
5bee : 6a __ __ ROR
5bef : 05 1c __ ORA ACCU + 1 
5bf1 : 85 1b __ STA ACCU + 0 
5bf3 : 98 __ __ TYA
5bf4 : 29 3f __ AND #$3f
5bf6 : 85 1c __ STA ACCU + 1 
5bf8 : a5 0d __ LDA P0 ; (mx + 0)
5bfa : 29 fc __ AND #$fc
5bfc : 0a __ __ ASL
5bfd : a8 __ __ TAY
5bfe : a5 1c __ LDA ACCU + 1 
5c00 : 69 e0 __ ADC #$e0
5c02 : 85 1c __ STA ACCU + 1 
5c04 : bd ad 7b LDA $7bad,x ; (__shltab3L + 0)
5c07 : 49 ff __ EOR #$ff
5c09 : 31 1b __ AND (ACCU + 0),y 
5c0b : 05 11 __ ORA P4 ; (col + 0)
5c0d : 91 1b __ STA (ACCU + 0),y 
.s3:
5c0f : 60 __ __ RTS
--------------------------------------------------------------------
draw_shadow: ; draw_shadow(i16,i16,i16,i16)->void
; 174, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5c10 : a5 17 __ LDA P10 ; (rx + 1)
5c12 : 30 06 __ BMI $5c1a ; (draw_shadow.s29 + 0)
.s31:
5c14 : d0 0c __ BNE $5c22 ; (draw_shadow.s5 + 0)
.s30:
5c16 : a5 16 __ LDA P9 ; (rx + 0)
5c18 : d0 08 __ BNE $5c22 ; (draw_shadow.s5 + 0)
.s29:
5c1a : a9 01 __ LDA #$01
5c1c : 85 16 __ STA P9 ; (rx + 0)
5c1e : a9 00 __ LDA #$00
5c20 : 85 17 __ STA P10 ; (rx + 1)
.s5:
5c22 : ad eb bf LDA $bfeb ; (sstack + 1)
5c25 : 30 07 __ BMI $5c2e ; (draw_shadow.s26 + 0)
.s28:
5c27 : d0 0f __ BNE $5c38 ; (draw_shadow.s6 + 0)
.s27:
5c29 : ad ea bf LDA $bfea ; (sstack + 0)
5c2c : d0 0a __ BNE $5c38 ; (draw_shadow.s6 + 0)
.s26:
5c2e : a9 01 __ LDA #$01
5c30 : 8d ea bf STA $bfea ; (sstack + 0)
5c33 : a9 00 __ LDA #$00
5c35 : 8d eb bf STA $bfeb ; (sstack + 1)
.s6:
5c38 : ad ea bf LDA $bfea ; (sstack + 0)
5c3b : 85 48 __ STA T2 + 0 
5c3d : 49 ff __ EOR #$ff
5c3f : 38 __ __ SEC
5c40 : 69 00 __ ADC #$00
5c42 : 85 4a __ STA T3 + 0 
5c44 : a9 00 __ LDA #$00
5c46 : ed eb bf SBC $bfeb ; (sstack + 1)
5c49 : 85 4b __ STA T3 + 1 
5c4b : ad eb bf LDA $bfeb ; (sstack + 1)
5c4e : 85 49 __ STA T2 + 1 
5c50 : c5 4b __ CMP T3 + 1 
5c52 : d0 07 __ BNE $5c5b ; (draw_shadow.s25 + 0)
.s22:
5c54 : a5 48 __ LDA T2 + 0 
5c56 : c5 4a __ CMP T3 + 0 
.s23:
5c58 : b0 08 __ BCS $5c62 ; (draw_shadow.s7 + 0)
5c5a : 60 __ __ RTS
.s25:
5c5b : 45 4b __ EOR T3 + 1 
5c5d : 10 f9 __ BPL $5c58 ; (draw_shadow.s23 + 0)
.s24:
5c5f : 90 01 __ BCC $5c62 ; (draw_shadow.s7 + 0)
5c61 : 60 __ __ RTS
.s7:
5c62 : 18 __ __ CLC
5c63 : a5 14 __ LDA P7 ; (sy + 0)
5c65 : 65 4a __ ADC T3 + 0 
5c67 : 85 4c __ STA T4 + 0 
5c69 : a5 15 __ LDA P8 ; (sy + 1)
5c6b : 65 4b __ ADC T3 + 1 
5c6d : 85 4d __ STA T4 + 1 
5c6f : a5 48 __ LDA T2 + 0 
5c71 : 85 03 __ STA WORK + 0 
5c73 : 85 1b __ STA ACCU + 0 
5c75 : a5 49 __ LDA T2 + 1 
5c77 : 85 04 __ STA WORK + 1 
5c79 : 85 1c __ STA ACCU + 1 
5c7b : 20 d0 77 JSR $77d0 ; (mul16 + 0)
5c7e : a5 05 __ LDA WORK + 2 
5c80 : 85 4e __ STA T5 + 0 
5c82 : a5 06 __ LDA WORK + 3 
5c84 : 85 4f __ STA T5 + 1 
5c86 : a5 4d __ LDA T4 + 1 
5c88 : f0 03 __ BEQ $5c8d ; (draw_shadow.l21 + 0)
5c8a : 4c 28 5d JMP $5d28 ; (draw_shadow.l11 + 0)
.l21:
5c8d : a5 4c __ LDA T4 + 0 
5c8f : c9 c8 __ CMP #$c8
5c91 : b0 f7 __ BCS $5c8a ; (draw_shadow.s7 + 40)
.s9:
5c93 : a5 4a __ LDA T3 + 0 
5c95 : 85 03 __ STA WORK + 0 
5c97 : 85 1b __ STA ACCU + 0 
5c99 : a5 4b __ LDA T3 + 1 
5c9b : 85 04 __ STA WORK + 1 
5c9d : 85 1c __ STA ACCU + 1 
5c9f : 20 d0 77 JSR $77d0 ; (mul16 + 0)
5ca2 : 38 __ __ SEC
5ca3 : a5 4e __ LDA T5 + 0 
5ca5 : e5 05 __ SBC WORK + 2 
5ca7 : 85 0d __ STA P0 
5ca9 : a5 4f __ LDA T5 + 1 
5cab : e5 06 __ SBC WORK + 3 
5cad : 30 79 __ BMI $5d28 ; (draw_shadow.l11 + 0)
.s10:
5caf : 85 0e __ STA P1 
5cb1 : 20 4f 5d JSR $5d4f ; (mc_isqrt.s4 + 0)
5cb4 : a5 1b __ LDA ACCU + 0 
5cb6 : 85 03 __ STA WORK + 0 
5cb8 : a5 1c __ LDA ACCU + 1 
5cba : 85 04 __ STA WORK + 1 
5cbc : a5 16 __ LDA P9 ; (rx + 0)
5cbe : 85 1b __ STA ACCU + 0 
5cc0 : a5 17 __ LDA P10 ; (rx + 1)
5cc2 : 85 1c __ STA ACCU + 1 
5cc4 : 20 d0 77 JSR $77d0 ; (mul16 + 0)
5cc7 : a5 05 __ LDA WORK + 2 
5cc9 : 85 1b __ STA ACCU + 0 
5ccb : a5 06 __ LDA WORK + 3 
5ccd : 85 1c __ STA ACCU + 1 
5ccf : a5 48 __ LDA T2 + 0 
5cd1 : 85 03 __ STA WORK + 0 
5cd3 : a5 49 __ LDA T2 + 1 
5cd5 : 85 04 __ STA WORK + 1 
5cd7 : 20 12 78 JSR $7812 ; (divs16 + 0)
5cda : 18 __ __ CLC
5cdb : a5 12 __ LDA P5 ; (sx + 0)
5cdd : 65 1b __ ADC ACCU + 0 
5cdf : 85 50 __ STA T6 + 0 
5ce1 : a5 13 __ LDA P6 ; (sx + 1)
5ce3 : 65 1c __ ADC ACCU + 1 
5ce5 : 85 51 __ STA T6 + 1 
5ce7 : 38 __ __ SEC
5ce8 : a5 12 __ LDA P5 ; (sx + 0)
5cea : e5 1b __ SBC ACCU + 0 
5cec : 85 47 __ STA T0 + 0 
5cee : a5 13 __ LDA P6 ; (sx + 1)
5cf0 : e5 1c __ SBC ACCU + 1 
5cf2 : 85 0e __ STA P1 
5cf4 : a9 00 __ LDA #$00
5cf6 : 85 10 __ STA P3 
.l36:
5cf8 : a5 51 __ LDA T6 + 1 
5cfa : c5 0e __ CMP P1 
5cfc : d0 08 __ BNE $5d06 ; (draw_shadow.s20 + 0)
.s17:
5cfe : a5 50 __ LDA T6 + 0 
5d00 : c5 47 __ CMP T0 + 0 
.s18:
5d02 : b0 08 __ BCS $5d0c ; (draw_shadow.s16 + 0)
5d04 : 90 22 __ BCC $5d28 ; (draw_shadow.l11 + 0)
.s20:
5d06 : 45 0e __ EOR P1 
5d08 : 10 f8 __ BPL $5d02 ; (draw_shadow.s18 + 0)
.s19:
5d0a : b0 1c __ BCS $5d28 ; (draw_shadow.l11 + 0)
.s16:
5d0c : a5 47 __ LDA T0 + 0 
5d0e : 85 0d __ STA P0 
5d10 : a5 4c __ LDA T4 + 0 
5d12 : 85 0f __ STA P2 
5d14 : a9 03 __ LDA #$03
5d16 : 85 11 __ STA P4 
5d18 : 20 ad 5b JSR $5bad ; (mc_setpix.s4 + 0)
5d1b : 18 __ __ CLC
5d1c : a5 0d __ LDA P0 
5d1e : 69 02 __ ADC #$02
5d20 : 85 47 __ STA T0 + 0 
5d22 : 90 d4 __ BCC $5cf8 ; (draw_shadow.l36 + 0)
.s37:
5d24 : e6 0e __ INC P1 
5d26 : b0 d0 __ BCS $5cf8 ; (draw_shadow.l36 + 0)
.l11:
5d28 : e6 4c __ INC T4 + 0 
5d2a : d0 02 __ BNE $5d2e ; (draw_shadow.s33 + 0)
.s32:
5d2c : e6 4d __ INC T4 + 1 
.s33:
5d2e : e6 4a __ INC T3 + 0 
5d30 : d0 02 __ BNE $5d34 ; (draw_shadow.s35 + 0)
.s34:
5d32 : e6 4b __ INC T3 + 1 
.s35:
5d34 : a5 49 __ LDA T2 + 1 
5d36 : c5 4b __ CMP T3 + 1 
5d38 : d0 07 __ BNE $5d41 ; (draw_shadow.s15 + 0)
.s12:
5d3a : a5 48 __ LDA T2 + 0 
5d3c : c5 4a __ CMP T3 + 0 
.s13:
5d3e : b0 07 __ BCS $5d47 ; (draw_shadow.s8 + 0)
5d40 : 60 __ __ RTS
.s15:
5d41 : 45 4b __ EOR T3 + 1 
5d43 : 10 f9 __ BPL $5d3e ; (draw_shadow.s13 + 0)
.s14:
5d45 : b0 07 __ BCS $5d4e ; (draw_shadow.s3 + 0)
.s8:
5d47 : a5 4d __ LDA T4 + 1 
5d49 : d0 dd __ BNE $5d28 ; (draw_shadow.l11 + 0)
5d4b : 4c 8d 5c JMP $5c8d ; (draw_shadow.l21 + 0)
.s3:
5d4e : 60 __ __ RTS
--------------------------------------------------------------------
mc_isqrt: ; mc_isqrt(u16)->i16
;  39, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5d4f : a5 0e __ LDA P1 ; (n + 1)
5d51 : 05 0d __ ORA P0 ; (n + 0)
5d53 : d0 05 __ BNE $5d5a ; (mc_isqrt.s5 + 0)
.s10:
5d55 : 85 1b __ STA ACCU + 0 
.s3:
5d57 : 85 1c __ STA ACCU + 1 
5d59 : 60 __ __ RTS
.s5:
5d5a : a5 0e __ LDA P1 ; (n + 1)
5d5c : 4a __ __ LSR
5d5d : 85 44 __ STA T1 + 1 
5d5f : a5 0d __ LDA P0 ; (n + 0)
5d61 : 6a __ __ ROR
5d62 : 85 43 __ STA T1 + 0 
5d64 : 05 44 __ ORA T1 + 1 
5d66 : d0 06 __ BNE $5d6e ; (mc_isqrt.l6 + 0)
.s9:
5d68 : a2 01 __ LDX #$01
5d6a : 86 1b __ STX ACCU + 0 
5d6c : d0 e9 __ BNE $5d57 ; (mc_isqrt.s3 + 0)
.l6:
5d6e : a5 43 __ LDA T1 + 0 
5d70 : 85 03 __ STA WORK + 0 
5d72 : 85 45 __ STA T2 + 0 
5d74 : a5 44 __ LDA T1 + 1 
5d76 : 85 04 __ STA WORK + 1 
5d78 : 85 46 __ STA T2 + 1 
5d7a : a5 0d __ LDA P0 ; (n + 0)
5d7c : 85 1b __ STA ACCU + 0 
5d7e : a5 0e __ LDA P1 ; (n + 1)
5d80 : 85 1c __ STA ACCU + 1 
5d82 : 20 4d 78 JSR $784d ; (divmod + 0)
5d85 : 18 __ __ CLC
5d86 : a5 1b __ LDA ACCU + 0 
5d88 : 65 43 __ ADC T1 + 0 
5d8a : 85 43 __ STA T1 + 0 
5d8c : a5 1c __ LDA ACCU + 1 
5d8e : 65 44 __ ADC T1 + 1 
5d90 : 4a __ __ LSR
5d91 : 85 44 __ STA T1 + 1 
5d93 : 66 43 __ ROR T1 + 0 
5d95 : c5 46 __ CMP T2 + 1 
5d97 : 90 d5 __ BCC $5d6e ; (mc_isqrt.l6 + 0)
.s11:
5d99 : d0 06 __ BNE $5da1 ; (mc_isqrt.s7 + 0)
.s8:
5d9b : a5 43 __ LDA T1 + 0 
5d9d : c5 45 __ CMP T2 + 0 
5d9f : 90 cd __ BCC $5d6e ; (mc_isqrt.l6 + 0)
.s7:
5da1 : a5 45 __ LDA T2 + 0 
5da3 : 85 1b __ STA ACCU + 0 
5da5 : a5 46 __ LDA T2 + 1 
5da7 : b0 ae __ BCS $5d57 ; (mc_isqrt.s3 + 0)
--------------------------------------------------------------------
draw_ball: ; draw_ball(i16,i16,u8,i16)->void
; 199, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s1:
5da9 : a2 1c __ LDX #$1c
5dab : b5 53 __ LDA T3 + 0,x 
5dad : 9d c3 bf STA $bfc3,x ; (draw_ball@stack + 0)
5db0 : ca __ __ DEX
5db1 : 10 f8 __ BPL $5dab ; (draw_ball.s1 + 2)
.s4:
5db3 : ad f0 bf LDA $bff0 ; (sstack + 6)
5db6 : 30 09 __ BMI $5dc1 ; (draw_ball.s82 + 0)
.s84:
5db8 : d0 11 __ BNE $5dcb ; (draw_ball.s5 + 0)
.s83:
5dba : ad ef bf LDA $bfef ; (sstack + 5)
5dbd : c9 03 __ CMP #$03
5dbf : b0 0a __ BCS $5dcb ; (draw_ball.s5 + 0)
.s82:
5dc1 : a9 03 __ LDA #$03
5dc3 : 8d ef bf STA $bfef ; (sstack + 5)
5dc6 : a9 00 __ LDA #$00
5dc8 : 8d f0 bf STA $bff0 ; (sstack + 6)
.s5:
5dcb : ad ef bf LDA $bfef ; (sstack + 5)
5dce : 85 5d __ STA T9 + 0 
5dd0 : 0a __ __ ASL
5dd1 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5dd3 : ad f0 bf LDA $bff0 ; (sstack + 6)
5dd6 : 85 5e __ STA T9 + 1 
5dd8 : 2a __ __ ROL
5dd9 : 06 1b __ ASL ACCU + 0 ; (cy + 0)
5ddb : 2a __ __ ROL
5ddc : aa __ __ TAX
5ddd : 18 __ __ CLC
5dde : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5de0 : 65 5d __ ADC T9 + 0 
5de2 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5de4 : 8a __ __ TXA
5de5 : 65 5e __ ADC T9 + 1 
5de7 : 85 1c __ STA ACCU + 1 ; (cy + 1)
5de9 : a9 00 __ LDA #$00
5deb : 85 04 __ STA WORK + 1 
5ded : 20 37 7c JSR $7c37 ; (divs16@proxy + 0)
5df0 : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5df2 : 85 5f __ STA T10 + 0 
5df4 : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5df6 : 85 60 __ STA T10 + 1 
5df8 : 38 __ __ SEC
5df9 : a9 00 __ LDA #$00
5dfb : e5 1b __ SBC ACCU + 0 ; (cy + 0)
5dfd : 85 61 __ STA T11 + 0 
5dff : a9 00 __ LDA #$00
5e01 : 85 04 __ STA WORK + 1 
5e03 : e5 1c __ SBC ACCU + 1 ; (cy + 1)
5e05 : 85 62 __ STA T11 + 1 
5e07 : a5 5d __ LDA T9 + 0 
5e09 : 0a __ __ ASL
5e0a : 85 1b __ STA ACCU + 0 ; (cy + 0)
5e0c : a5 5e __ LDA T9 + 1 
5e0e : 2a __ __ ROL
5e0f : 06 1b __ ASL ACCU + 0 ; (cy + 0)
5e11 : 2a __ __ ROL
5e12 : 06 1b __ ASL ACCU + 0 ; (cy + 0)
5e14 : 2a __ __ ROL
5e15 : aa __ __ TAX
5e16 : 18 __ __ CLC
5e17 : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5e19 : 65 5d __ ADC T9 + 0 
5e1b : 85 1b __ STA ACCU + 0 ; (cy + 0)
5e1d : 8a __ __ TXA
5e1e : 65 5e __ ADC T9 + 1 
5e20 : 85 1c __ STA ACCU + 1 ; (cy + 1)
5e22 : 20 37 7c JSR $7c37 ; (divs16@proxy + 0)
5e25 : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5e27 : 85 63 __ STA T12 + 0 
5e29 : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5e2b : 85 64 __ STA T12 + 1 
5e2d : 38 __ __ SEC
5e2e : a9 00 __ LDA #$00
5e30 : e5 1b __ SBC ACCU + 0 ; (cy + 0)
5e32 : 85 65 __ STA T13 + 0 
5e34 : a9 00 __ LDA #$00
5e36 : e5 1c __ SBC ACCU + 1 ; (cy + 1)
5e38 : 85 66 __ STA T13 + 1 
5e3a : a5 5d __ LDA T9 + 0 
5e3c : 85 03 __ STA WORK + 0 
5e3e : 85 1b __ STA ACCU + 0 ; (cy + 0)
5e40 : a5 5e __ LDA T9 + 1 
5e42 : 85 04 __ STA WORK + 1 
5e44 : 85 1c __ STA ACCU + 1 ; (cy + 1)
5e46 : 20 d0 77 JSR $77d0 ; (mul16 + 0)
5e49 : a5 05 __ LDA WORK + 2 
5e4b : 85 67 __ STA T14 + 0 
5e4d : a5 06 __ LDA WORK + 3 
5e4f : 85 68 __ STA T14 + 1 
5e51 : 38 __ __ SEC
5e52 : a9 00 __ LDA #$00
5e54 : e5 5d __ SBC T9 + 0 
5e56 : 85 69 __ STA T15 + 0 
5e58 : a9 00 __ LDA #$00
5e5a : e5 5e __ SBC T9 + 1 
5e5c : 85 6a __ STA T15 + 1 
5e5e : a5 5e __ LDA T9 + 1 
5e60 : c5 6a __ CMP T15 + 1 
5e62 : d0 09 __ BNE $5e6d ; (draw_ball.s10 + 0)
.s7:
5e64 : a5 5d __ LDA T9 + 0 
5e66 : c5 69 __ CMP T15 + 0 
.s8:
5e68 : a9 00 __ LDA #$00
5e6a : 2a __ __ ROL
5e6b : 90 09 __ BCC $5e76 ; (draw_ball.s6 + 0)
.s10:
5e6d : 45 6a __ EOR T15 + 1 
5e6f : 10 f7 __ BPL $5e68 ; (draw_ball.s8 + 0)
.s9:
5e71 : a9 00 __ LDA #$00
5e73 : 2a __ __ ROL
5e74 : 49 01 __ EOR #$01
.s6:
5e76 : 85 6f __ STA T20 + 0 
5e78 : d0 03 __ BNE $5e7d ; (draw_ball.s32 + 0)
5e7a : 4c 7c 60 JMP $607c ; (draw_ball.s11 + 0)
.s32:
5e7d : ad ec bf LDA $bfec ; (sstack + 2)
5e80 : 18 __ __ CLC
5e81 : 65 69 __ ADC T15 + 0 
5e83 : 85 6b __ STA T16 + 0 
5e85 : a5 69 __ LDA T15 + 0 
5e87 : 85 6d __ STA T17 + 0 
5e89 : a5 6a __ LDA T15 + 1 
5e8b : 85 6e __ STA T17 + 1 
5e8d : 6d ed bf ADC $bfed ; (sstack + 3)
5e90 : 85 6c __ STA T16 + 1 
5e92 : f0 03 __ BEQ $5e97 ; (draw_ball.l81 + 0)
5e94 : 4c 55 60 JMP $6055 ; (draw_ball.l50 + 0)
.l81:
5e97 : a5 6b __ LDA T16 + 0 
5e99 : c9 c8 __ CMP #$c8
5e9b : b0 f7 __ BCS $5e94 ; (draw_ball.s32 + 23)
.s34:
5e9d : a5 6d __ LDA T17 + 0 
5e9f : 85 03 __ STA WORK + 0 
5ea1 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5ea3 : a5 6e __ LDA T17 + 1 
5ea5 : 85 04 __ STA WORK + 1 
5ea7 : 85 1c __ STA ACCU + 1 ; (cy + 1)
5ea9 : 20 d0 77 JSR $77d0 ; (mul16 + 0)
5eac : 38 __ __ SEC
5ead : a5 67 __ LDA T14 + 0 
5eaf : e5 05 __ SBC WORK + 2 
5eb1 : 85 0d __ STA P0 
5eb3 : a5 68 __ LDA T14 + 1 
5eb5 : e5 06 __ SBC WORK + 3 
5eb7 : 30 db __ BMI $5e94 ; (draw_ball.s32 + 23)
.s80:
5eb9 : 85 0e __ STA P1 
5ebb : 05 0d __ ORA P0 
5ebd : f0 d5 __ BEQ $5e94 ; (draw_ball.s32 + 23)
.s35:
5ebf : 20 4f 5d JSR $5d4f ; (mc_isqrt.s4 + 0)
5ec2 : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5ec4 : 85 43 __ STA T0 + 0 
5ec6 : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5ec8 : 85 44 __ STA T0 + 1 
5eca : a5 6e __ LDA T17 + 1 
5ecc : c5 66 __ CMP T13 + 1 
5ece : d0 08 __ BNE $5ed8 ; (draw_ball.s79 + 0)
.s76:
5ed0 : a5 6d __ LDA T17 + 0 
5ed2 : c5 65 __ CMP T13 + 0 
.s77:
5ed4 : 90 08 __ BCC $5ede ; (draw_ball.s75 + 0)
5ed6 : b0 1e __ BCS $5ef6 ; (draw_ball.s36 + 0)
.s79:
5ed8 : 45 66 __ EOR T13 + 1 
5eda : 10 f8 __ BPL $5ed4 ; (draw_ball.s77 + 0)
.s78:
5edc : 90 18 __ BCC $5ef6 ; (draw_ball.s36 + 0)
.s75:
5ede : a9 00 __ LDA #$00
.s41:
5ee0 : 85 47 __ STA T18 + 0 
5ee2 : ad ea bf LDA $bfea ; (sstack + 0)
5ee5 : 85 53 __ STA T3 + 0 
5ee7 : a9 00 __ LDA #$00
5ee9 : 85 51 __ STA T2 + 0 
5eeb : ad eb bf LDA $bfeb ; (sstack + 1)
5eee : 85 54 __ STA T3 + 1 
5ef0 : ad ee bf LDA $bfee ; (sstack + 4)
5ef3 : 4c 42 5f JMP $5f42 ; (draw_ball.l86 + 0)
.s36:
5ef6 : a5 6e __ LDA T17 + 1 
5ef8 : c5 62 __ CMP T11 + 1 
5efa : d0 08 __ BNE $5f04 ; (draw_ball.s74 + 0)
.s71:
5efc : a5 6d __ LDA T17 + 0 
5efe : c5 61 __ CMP T11 + 0 
.s72:
5f00 : 90 08 __ BCC $5f0a ; (draw_ball.s70 + 0)
5f02 : b0 0a __ BCS $5f0e ; (draw_ball.s37 + 0)
.s74:
5f04 : 45 62 __ EOR T11 + 1 
5f06 : 10 f8 __ BPL $5f00 ; (draw_ball.s72 + 0)
.s73:
5f08 : 90 04 __ BCC $5f0e ; (draw_ball.s37 + 0)
.s70:
5f0a : a9 01 __ LDA #$01
5f0c : d0 d2 __ BNE $5ee0 ; (draw_ball.s41 + 0)
.s37:
5f0e : 24 6e __ BIT T17 + 1 
5f10 : 10 04 __ BPL $5f16 ; (draw_ball.s38 + 0)
.s69:
5f12 : a9 02 __ LDA #$02
5f14 : d0 ca __ BNE $5ee0 ; (draw_ball.s41 + 0)
.s38:
5f16 : 24 60 __ BIT T10 + 1 
5f18 : 30 10 __ BMI $5f2a ; (draw_ball.s39 + 0)
.s68:
5f1a : a5 6e __ LDA T17 + 1 
5f1c : c5 60 __ CMP T10 + 1 
5f1e : d0 04 __ BNE $5f24 ; (draw_ball.s67 + 0)
.s66:
5f20 : a5 6d __ LDA T17 + 0 
5f22 : c5 5f __ CMP T10 + 0 
.s67:
5f24 : b0 04 __ BCS $5f2a ; (draw_ball.s39 + 0)
.s65:
5f26 : a9 03 __ LDA #$03
5f28 : 90 b6 __ BCC $5ee0 ; (draw_ball.s41 + 0)
.s39:
5f2a : 24 64 __ BIT T12 + 1 
5f2c : 30 10 __ BMI $5f3e ; (draw_ball.s40 + 0)
.s64:
5f2e : a5 6e __ LDA T17 + 1 
5f30 : c5 64 __ CMP T12 + 1 
5f32 : d0 04 __ BNE $5f38 ; (draw_ball.s63 + 0)
.s62:
5f34 : a5 6d __ LDA T17 + 0 
5f36 : c5 63 __ CMP T12 + 0 
.s63:
5f38 : b0 04 __ BCS $5f3e ; (draw_ball.s40 + 0)
.s61:
5f3a : a9 04 __ LDA #$04
5f3c : 90 a2 __ BCC $5ee0 ; (draw_ball.s41 + 0)
.s40:
5f3e : a9 05 __ LDA #$05
5f40 : d0 9e __ BNE $5ee0 ; (draw_ball.s41 + 0)
.l86:
5f42 : 85 4f __ STA T1 + 0 
5f44 : 18 __ __ CLC
5f45 : 69 10 __ ADC #$10
5f47 : 29 3f __ AND #$3f
5f49 : aa __ __ TAX
5f4a : bd 00 80 LDA $8000,x ; (sin64[0] + 0)
5f4d : 85 1b __ STA ACCU + 0 ; (cy + 0)
5f4f : 29 80 __ AND #$80
5f51 : 10 02 __ BPL $5f55 ; (draw_ball.l86 + 19)
5f53 : a9 ff __ LDA #$ff
5f55 : 85 1c __ STA ACCU + 1 ; (cy + 1)
5f57 : a5 43 __ LDA T0 + 0 
5f59 : 85 03 __ STA WORK + 0 
5f5b : a5 44 __ LDA T0 + 1 
5f5d : 85 04 __ STA WORK + 1 
5f5f : 20 d0 77 JSR $77d0 ; (mul16 + 0)
5f62 : 20 24 7c JSR $7c24 ; (divs16@proxy + 0)
5f65 : 18 __ __ CLC
5f66 : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5f68 : 65 53 __ ADC T3 + 0 
5f6a : a6 51 __ LDX T2 + 0 
5f6c : e8 __ __ INX
5f6d : e8 __ __ INX
5f6e : 86 51 __ STX T2 + 0 
5f70 : 9d c0 87 STA $87c0,x ; (mod_row_buf[0] + 14)
5f73 : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5f75 : 65 54 __ ADC T3 + 1 
5f77 : 9d c1 87 STA $87c1,x ; (mod_row_buf[0] + 15)
5f7a : 18 __ __ CLC
5f7b : a5 4f __ LDA T1 + 0 
5f7d : 69 10 __ ADC #$10
5f7f : e0 08 __ CPX #$08
5f81 : d0 bf __ BNE $5f42 ; (draw_ball.l86 + 0)
.s42:
5f83 : a9 00 __ LDA #$00
5f85 : 85 4f __ STA T1 + 0 
.l43:
5f87 : a4 4f __ LDY T1 + 0 
5f89 : c8 __ __ INY
5f8a : 84 55 __ STY T4 + 0 
5f8c : 0a __ __ ASL
5f8d : 85 57 __ STA T5 + 0 
.l85:
5f8f : a5 55 __ LDA T4 + 0 
5f91 : 0a __ __ ASL
5f92 : 85 59 __ STA T6 + 0 
5f94 : aa __ __ TAX
5f95 : bd c2 87 LDA $87c2,x ; (mx[0] + 0)
5f98 : 85 5b __ STA T7 + 0 
5f9a : bd c3 87 LDA $87c3,x ; (mx[0] + 1)
5f9d : 85 5c __ STA T7 + 1 
5f9f : a6 57 __ LDX T5 + 0 
5fa1 : bd c2 87 LDA $87c2,x ; (mx[0] + 0)
5fa4 : 85 45 __ STA T8 + 0 
5fa6 : bd c3 87 LDA $87c3,x ; (mx[0] + 1)
5fa9 : 85 46 __ STA T8 + 1 
5fab : a5 5c __ LDA T7 + 1 
5fad : c5 46 __ CMP T8 + 1 
5faf : d0 08 __ BNE $5fb9 ; (draw_ball.s60 + 0)
.s57:
5fb1 : a5 5b __ LDA T7 + 0 
5fb3 : c5 45 __ CMP T8 + 0 
.s58:
5fb5 : 90 08 __ BCC $5fbf ; (draw_ball.s56 + 0)
5fb7 : b0 1c __ BCS $5fd5 ; (draw_ball.s44 + 0)
.s60:
5fb9 : 45 46 __ EOR T8 + 1 
5fbb : 10 f8 __ BPL $5fb5 ; (draw_ball.s58 + 0)
.s59:
5fbd : 90 16 __ BCC $5fd5 ; (draw_ball.s44 + 0)
.s56:
5fbf : a5 5b __ LDA T7 + 0 
5fc1 : 9d c2 87 STA $87c2,x ; (mx[0] + 0)
5fc4 : a5 5c __ LDA T7 + 1 
5fc6 : 9d c3 87 STA $87c3,x ; (mx[0] + 1)
5fc9 : a5 45 __ LDA T8 + 0 
5fcb : a6 59 __ LDX T6 + 0 
5fcd : 9d c2 87 STA $87c2,x ; (mx[0] + 0)
5fd0 : a5 46 __ LDA T8 + 1 
5fd2 : 9d c3 87 STA $87c3,x ; (mx[0] + 1)
.s44:
5fd5 : e6 55 __ INC T4 + 0 
5fd7 : c8 __ __ INY
5fd8 : c0 04 __ CPY #$04
5fda : 90 b3 __ BCC $5f8f ; (draw_ball.l85 + 0)
.s45:
5fdc : e6 4f __ INC T1 + 0 
5fde : a5 4f __ LDA T1 + 0 
5fe0 : c9 03 __ CMP #$03
5fe2 : d0 a3 __ BNE $5f87 ; (draw_ball.l43 + 0)
.s46:
5fe4 : a5 53 __ LDA T3 + 0 
5fe6 : e5 43 __ SBC T0 + 0 
5fe8 : 85 4f __ STA T1 + 0 
5fea : a5 54 __ LDA T3 + 1 
5fec : e5 44 __ SBC T0 + 1 
5fee : 85 50 __ STA T1 + 1 
5ff0 : 18 __ __ CLC
5ff1 : a5 53 __ LDA T3 + 0 
5ff3 : 65 43 __ ADC T0 + 0 
5ff5 : 85 51 __ STA T2 + 0 
5ff7 : a5 54 __ LDA T3 + 1 
5ff9 : 65 44 __ ADC T0 + 1 
5ffb : 85 52 __ STA T2 + 1 
5ffd : a5 47 __ LDA T18 + 0 
5fff : 85 53 __ STA T3 + 0 
6001 : a9 00 __ LDA #$00
6003 : 85 57 __ STA T5 + 0 
6005 : 85 55 __ STA T4 + 0 
6007 : 85 13 __ STA P6 
6009 : a5 6b __ LDA T16 + 0 
600b : 85 12 __ STA P5 
.l47:
600d : a5 4f __ LDA T1 + 0 
600f : 85 14 __ STA P7 
6011 : a5 50 __ LDA T1 + 1 
6013 : 85 15 __ STA P8 
6015 : a5 57 __ LDA T5 + 0 
6017 : c9 04 __ CMP #$04
6019 : b0 0a __ BCS $6025 ; (draw_ball.s48 + 0)
.s55:
601b : a4 55 __ LDY T4 + 0 
601d : b9 c3 87 LDA $87c3,y ; (mx[0] + 1)
6020 : be c2 87 LDX $87c2,y ; (mx[0] + 0)
6023 : 90 04 __ BCC $6029 ; (draw_ball.s49 + 0)
.s48:
6025 : a5 52 __ LDA T2 + 1 
6027 : a6 51 __ LDX T2 + 0 
.s49:
6029 : 86 16 __ STX P9 
602b : 85 17 __ STA P10 
602d : 8a __ __ TXA
602e : 18 __ __ CLC
602f : 69 01 __ ADC #$01
6031 : 85 4f __ STA T1 + 0 
6033 : a5 17 __ LDA P10 
6035 : 69 00 __ ADC #$00
6037 : 85 50 __ STA T1 + 1 
6039 : a5 53 __ LDA T3 + 0 
603b : 4a __ __ LSR
603c : a9 02 __ LDA #$02
603e : b0 02 __ BCS $6042 ; (draw_ball.s96 + 0)
.s95:
6040 : a9 01 __ LDA #$01
.s96:
6042 : 85 18 __ STA P11 
6044 : 20 04 62 JSR $6204 ; (mc_hspan.s4 + 0)
6047 : e6 53 __ INC T3 + 0 
6049 : e6 55 __ INC T4 + 0 
604b : e6 55 __ INC T4 + 0 
604d : e6 57 __ INC T5 + 0 
604f : a5 57 __ LDA T5 + 0 
6051 : c9 05 __ CMP #$05
6053 : 90 b8 __ BCC $600d ; (draw_ball.l47 + 0)
.l50:
6055 : e6 6b __ INC T16 + 0 
6057 : d0 02 __ BNE $605b ; (draw_ball.s88 + 0)
.s87:
6059 : e6 6c __ INC T16 + 1 
.s88:
605b : e6 6d __ INC T17 + 0 
605d : d0 02 __ BNE $6061 ; (draw_ball.s90 + 0)
.s89:
605f : e6 6e __ INC T17 + 1 
.s90:
6061 : a5 5e __ LDA T9 + 1 
6063 : c5 6e __ CMP T17 + 1 
6065 : d0 08 __ BNE $606f ; (draw_ball.s54 + 0)
.s51:
6067 : a5 5d __ LDA T9 + 0 
6069 : c5 6d __ CMP T17 + 0 
.s52:
606b : b0 08 __ BCS $6075 ; (draw_ball.s33 + 0)
606d : 90 0d __ BCC $607c ; (draw_ball.s11 + 0)
.s54:
606f : 45 6e __ EOR T17 + 1 
6071 : 10 f8 __ BPL $606b ; (draw_ball.s52 + 0)
.s53:
6073 : b0 07 __ BCS $607c ; (draw_ball.s11 + 0)
.s33:
6075 : a5 6c __ LDA T16 + 1 
6077 : d0 dc __ BNE $6055 ; (draw_ball.l50 + 0)
6079 : 4c 97 5e JMP $5e97 ; (draw_ball.l81 + 0)
.s11:
607c : a5 65 __ LDA T13 + 0 
607e : 8d e0 bf STA $bfe0 ; (lats[0] + 0)
6081 : a5 66 __ LDA T13 + 1 
6083 : 8d e1 bf STA $bfe1 ; (lats[0] + 1)
6086 : a5 61 __ LDA T11 + 0 
6088 : 8d e2 bf STA $bfe2 ; (lats[0] + 2)
608b : a5 62 __ LDA T11 + 1 
608d : 8d e3 bf STA $bfe3 ; (lats[0] + 3)
6090 : a9 00 __ LDA #$00
6092 : 8d e4 bf STA $bfe4 ; (lats[0] + 4)
6095 : 8d e5 bf STA $bfe5 ; (lats[0] + 5)
6098 : 85 53 __ STA T3 + 0 
609a : a6 5f __ LDX T10 + 0 
609c : 8e e6 bf STX $bfe6 ; (lats[0] + 6)
609f : a6 60 __ LDX T10 + 1 
60a1 : 8e e7 bf STX $bfe7 ; (lats[0] + 7)
60a4 : a6 63 __ LDX T12 + 0 
60a6 : 8e e8 bf STX $bfe8 ; (lats[0] + 8)
60a9 : a6 64 __ LDX T12 + 1 
60ab : 8e e9 bf STX $bfe9 ; (lats[0] + 9)
60ae : ae ec bf LDX $bfec ; (sstack + 2)
60b1 : 86 55 __ STX T4 + 0 
60b3 : ae ed bf LDX $bfed ; (sstack + 3)
60b6 : 86 56 __ STX T4 + 1 
.l12:
60b8 : 0a __ __ ASL
60b9 : a8 __ __ TAY
60ba : b9 e0 bf LDA $bfe0,y ; (lats[0] + 0)
60bd : 18 __ __ CLC
60be : 65 55 __ ADC T4 + 0 
60c0 : 85 4f __ STA T1 + 0 
60c2 : b9 e1 bf LDA $bfe1,y ; (lats[0] + 1)
60c5 : 65 56 __ ADC T4 + 1 
60c7 : d0 58 __ BNE $6121 ; (draw_ball.s15 + 0)
.s31:
60c9 : a5 4f __ LDA T1 + 0 
60cb : c9 c8 __ CMP #$c8
60cd : b0 52 __ BCS $6121 ; (draw_ball.s15 + 0)
.s13:
60cf : b9 e0 bf LDA $bfe0,y ; (lats[0] + 0)
60d2 : 85 1b __ STA ACCU + 0 ; (cy + 0)
60d4 : 85 03 __ STA WORK + 0 
60d6 : b9 e1 bf LDA $bfe1,y ; (lats[0] + 1)
60d9 : 85 1c __ STA ACCU + 1 ; (cy + 1)
60db : 85 04 __ STA WORK + 1 
60dd : 20 d0 77 JSR $77d0 ; (mul16 + 0)
60e0 : 38 __ __ SEC
60e1 : a5 67 __ LDA T14 + 0 
60e3 : e5 05 __ SBC WORK + 2 
60e5 : 85 0d __ STA P0 
60e7 : a5 68 __ LDA T14 + 1 
60e9 : e5 06 __ SBC WORK + 3 
60eb : 30 34 __ BMI $6121 ; (draw_ball.s15 + 0)
.s30:
60ed : 85 0e __ STA P1 
60ef : 05 0d __ ORA P0 
60f1 : f0 2e __ BEQ $6121 ; (draw_ball.s15 + 0)
.s14:
60f3 : 20 4f 5d JSR $5d4f ; (mc_isqrt.s4 + 0)
60f6 : a5 4f __ LDA T1 + 0 
60f8 : 85 12 __ STA P5 
60fa : a9 00 __ LDA #$00
60fc : 85 13 __ STA P6 
60fe : 85 18 __ STA P11 
6100 : ad ea bf LDA $bfea ; (sstack + 0)
6103 : 18 __ __ CLC
6104 : 65 1b __ ADC ACCU + 0 ; (cy + 0)
6106 : 85 16 __ STA P9 
6108 : ad eb bf LDA $bfeb ; (sstack + 1)
610b : 65 1c __ ADC ACCU + 1 ; (cy + 1)
610d : 85 17 __ STA P10 
610f : ad ea bf LDA $bfea ; (sstack + 0)
6112 : 38 __ __ SEC
6113 : e5 1b __ SBC ACCU + 0 ; (cy + 0)
6115 : 85 14 __ STA P7 
6117 : ad eb bf LDA $bfeb ; (sstack + 1)
611a : e5 1c __ SBC ACCU + 1 ; (cy + 1)
611c : 85 15 __ STA P8 
611e : 20 04 62 JSR $6204 ; (mc_hspan.s4 + 0)
.s15:
6121 : e6 53 __ INC T3 + 0 
6123 : a5 53 __ LDA T3 + 0 
6125 : c9 05 __ CMP #$05
6127 : d0 8f __ BNE $60b8 ; (draw_ball.l12 + 0)
.s16:
6129 : a5 6f __ LDA T20 + 0 
612b : d0 0b __ BNE $6138 ; (draw_ball.s17 + 0)
.s3:
612d : a2 1c __ LDX #$1c
612f : bd c3 bf LDA $bfc3,x ; (draw_ball@stack + 0)
6132 : 95 53 __ STA T3 + 0,x 
6134 : ca __ __ DEX
6135 : 10 f8 __ BPL $612f ; (draw_ball.s3 + 2)
6137 : 60 __ __ RTS
.s17:
6138 : ad ee bf LDA $bfee ; (sstack + 4)
613b : 85 51 __ STA T2 + 0 
613d : a9 04 __ LDA #$04
613f : 85 5b __ STA T7 + 0 
.l18:
6141 : 18 __ __ CLC
6142 : a5 55 __ LDA T4 + 0 
6144 : 65 69 __ ADC T15 + 0 
6146 : 85 53 __ STA T3 + 0 
6148 : a5 56 __ LDA T4 + 1 
614a : 65 6a __ ADC T15 + 1 
614c : 85 54 __ STA T3 + 1 
614e : a5 69 __ LDA T15 + 0 
6150 : 85 57 __ STA T5 + 0 
6152 : a5 6a __ LDA T15 + 1 
6154 : 85 58 __ STA T5 + 1 
6156 : 18 __ __ CLC
6157 : a5 51 __ LDA T2 + 0 
6159 : 69 10 __ ADC #$10
615b : 29 3f __ AND #$3f
615d : aa __ __ TAX
615e : bd 00 80 LDA $8000,x ; (sin64[0] + 0)
6161 : 85 59 __ STA T6 + 0 
6163 : 29 80 __ AND #$80
6165 : 10 02 __ BPL $6169 ; (draw_ball.l18 + 40)
6167 : a9 ff __ LDA #$ff
6169 : 85 5a __ STA T6 + 1 
616b : a5 54 __ LDA T3 + 1 
616d : d0 5d __ BNE $61cc ; (draw_ball.l22 + 0)
.l29:
616f : a5 53 __ LDA T3 + 0 
6171 : c9 c8 __ CMP #$c8
6173 : b0 57 __ BCS $61cc ; (draw_ball.l22 + 0)
.s20:
6175 : a5 57 __ LDA T5 + 0 
6177 : 85 03 __ STA WORK + 0 
6179 : 85 1b __ STA ACCU + 0 ; (cy + 0)
617b : a5 58 __ LDA T5 + 1 
617d : 85 04 __ STA WORK + 1 
617f : 85 1c __ STA ACCU + 1 ; (cy + 1)
6181 : 20 d0 77 JSR $77d0 ; (mul16 + 0)
6184 : 38 __ __ SEC
6185 : a5 67 __ LDA T14 + 0 
6187 : e5 05 __ SBC WORK + 2 
6189 : 85 0d __ STA P0 
618b : a5 68 __ LDA T14 + 1 
618d : e5 06 __ SBC WORK + 3 
618f : 30 3b __ BMI $61cc ; (draw_ball.l22 + 0)
.s28:
6191 : 85 0e __ STA P1 
6193 : 05 0d __ ORA P0 
6195 : f0 35 __ BEQ $61cc ; (draw_ball.l22 + 0)
.s21:
6197 : 20 4f 5d JSR $5d4f ; (mc_isqrt.s4 + 0)
619a : a5 1b __ LDA ACCU + 0 ; (cy + 0)
619c : 85 03 __ STA WORK + 0 
619e : a5 1c __ LDA ACCU + 1 ; (cy + 1)
61a0 : 85 04 __ STA WORK + 1 
61a2 : a5 53 __ LDA T3 + 0 
61a4 : 85 0f __ STA P2 
61a6 : a9 00 __ LDA #$00
61a8 : 85 10 __ STA P3 
61aa : 85 11 __ STA P4 
61ac : a5 59 __ LDA T6 + 0 
61ae : 85 1b __ STA ACCU + 0 ; (cy + 0)
61b0 : a5 5a __ LDA T6 + 1 
61b2 : 85 1c __ STA ACCU + 1 ; (cy + 1)
61b4 : 20 d0 77 JSR $77d0 ; (mul16 + 0)
61b7 : 20 24 7c JSR $7c24 ; (divs16@proxy + 0)
61ba : ad ea bf LDA $bfea ; (sstack + 0)
61bd : 18 __ __ CLC
61be : 65 1b __ ADC ACCU + 0 ; (cy + 0)
61c0 : 85 0d __ STA P0 
61c2 : ad eb bf LDA $bfeb ; (sstack + 1)
61c5 : 65 1c __ ADC ACCU + 1 ; (cy + 1)
61c7 : 85 0e __ STA P1 
61c9 : 20 ad 5b JSR $5bad ; (mc_setpix.s4 + 0)
.l22:
61cc : e6 53 __ INC T3 + 0 
61ce : d0 02 __ BNE $61d2 ; (draw_ball.s92 + 0)
.s91:
61d0 : e6 54 __ INC T3 + 1 
.s92:
61d2 : e6 57 __ INC T5 + 0 
61d4 : d0 02 __ BNE $61d8 ; (draw_ball.s94 + 0)
.s93:
61d6 : e6 58 __ INC T5 + 1 
.s94:
61d8 : a5 5e __ LDA T9 + 1 
61da : c5 58 __ CMP T5 + 1 
61dc : d0 08 __ BNE $61e6 ; (draw_ball.s27 + 0)
.s24:
61de : a5 5d __ LDA T9 + 0 
61e0 : c5 57 __ CMP T5 + 0 
.s25:
61e2 : 90 08 __ BCC $61ec ; (draw_ball.s23 + 0)
61e4 : b0 17 __ BCS $61fd ; (draw_ball.s19 + 0)
.s27:
61e6 : 45 58 __ EOR T5 + 1 
61e8 : 10 f8 __ BPL $61e2 ; (draw_ball.s25 + 0)
.s26:
61ea : 90 11 __ BCC $61fd ; (draw_ball.s19 + 0)
.s23:
61ec : 18 __ __ CLC
61ed : a5 51 __ LDA T2 + 0 
61ef : 69 10 __ ADC #$10
61f1 : 85 51 __ STA T2 + 0 
61f3 : c6 5b __ DEC T7 + 0 
61f5 : f0 03 __ BEQ $61fa ; (draw_ball.s23 + 14)
61f7 : 4c 41 61 JMP $6141 ; (draw_ball.l18 + 0)
61fa : 4c 2d 61 JMP $612d ; (draw_ball.s3 + 0)
.s19:
61fd : a5 54 __ LDA T3 + 1 
61ff : d0 cb __ BNE $61cc ; (draw_ball.l22 + 0)
6201 : 4c 6f 61 JMP $616f ; (draw_ball.l29 + 0)
--------------------------------------------------------------------
mc_hspan: ; mc_hspan(i16,i16,i16,u8)->void
;  65, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
6204 : a5 13 __ LDA P6 ; (my + 1)
6206 : f0 01 __ BEQ $6209 ; (mc_hspan.s39 + 0)
6208 : 60 __ __ RTS
.s39:
6209 : a5 12 __ LDA P5 ; (my + 0)
620b : c9 c8 __ CMP #$c8
620d : 90 01 __ BCC $6210 ; (mc_hspan.s5 + 0)
620f : 60 __ __ RTS
.s5:
6210 : 24 15 __ BIT P8 ; (x0 + 1)
6212 : 10 08 __ BPL $621c ; (mc_hspan.s49 + 0)
.s38:
6214 : a9 00 __ LDA #$00
6216 : 85 14 __ STA P7 ; (x0 + 0)
6218 : 85 15 __ STA P8 ; (x0 + 1)
621a : 90 02 __ BCC $621e ; (mc_hspan.s6 + 0)
.s49:
621c : a5 14 __ LDA P7 ; (x0 + 0)
.s6:
621e : 85 46 __ STA T4 + 0 
6220 : a6 15 __ LDX P8 ; (x0 + 1)
6222 : a5 17 __ LDA P10 ; (x1 + 1)
6224 : 10 01 __ BPL $6227 ; (mc_hspan.s37 + 0)
6226 : 60 __ __ RTS
.s37:
6227 : 86 47 __ STX T4 + 1 
6229 : d0 09 __ BNE $6234 ; (mc_hspan.s34 + 0)
.s36:
622b : a5 16 __ LDA P9 ; (x1 + 0)
622d : c9 a0 __ CMP #$a0
622f : b0 03 __ BCS $6234 ; (mc_hspan.s34 + 0)
6231 : 4c 9c 63 JMP $639c ; (mc_hspan.s7 + 0)
.s34:
6234 : a9 9f __ LDA #$9f
6236 : 85 16 __ STA P9 ; (x1 + 0)
6238 : a9 00 __ LDA #$00
623a : 85 17 __ STA P10 ; (x1 + 1)
623c : 8a __ __ TXA
623d : f0 01 __ BEQ $6240 ; (mc_hspan.s35 + 0)
623f : 60 __ __ RTS
.s35:
6240 : a5 14 __ LDA P7 ; (x0 + 0)
6242 : c9 a0 __ CMP #$a0
6244 : 90 01 __ BCC $6247 ; (mc_hspan.s8 + 0)
6246 : 60 __ __ RTS
.s8:
6247 : a5 16 __ LDA P9 ; (x1 + 0)
6249 : 85 4a __ STA T6 + 0 
624b : 85 48 __ STA T5 + 0 
624d : a5 14 __ LDA P7 ; (x0 + 0)
624f : 4a __ __ LSR
6250 : 4a __ __ LSR
6251 : 85 4c __ STA T7 + 0 
6253 : a5 17 __ LDA P10 ; (x1 + 1)
6255 : 85 49 __ STA T5 + 1 
6257 : 4a __ __ LSR
6258 : 66 4a __ ROR T6 + 0 
625a : 4a __ __ LSR
625b : 66 4a __ ROR T6 + 0 
625d : 49 20 __ EOR #$20
625f : 38 __ __ SEC
6260 : e9 20 __ SBC #$20
6262 : 85 4b __ STA T6 + 1 
6264 : d0 09 __ BNE $626f ; (mc_hspan.s9 + 0)
.s31:
6266 : a5 4c __ LDA T7 + 0 
6268 : c5 4a __ CMP T6 + 0 
626a : d0 03 __ BNE $626f ; (mc_hspan.s9 + 0)
626c : 4c 6d 63 JMP $636d ; (mc_hspan.s26 + 0)
.s9:
626f : a5 12 __ LDA P5 ; (my + 0)
6271 : 85 0f __ STA P2 
6273 : 29 07 __ AND #$07
6275 : 85 1b __ STA ACCU + 0 
6277 : a5 12 __ LDA P5 ; (my + 0)
6279 : 4a __ __ LSR
627a : 4a __ __ LSR
627b : 4a __ __ LSR
627c : 85 43 __ STA T1 + 0 
627e : 0a __ __ ASL
627f : 0a __ __ ASL
6280 : 65 43 __ ADC T1 + 0 
6282 : 4a __ __ LSR
6283 : 6a __ __ ROR
6284 : aa __ __ TAX
6285 : 29 80 __ AND #$80
6287 : 6a __ __ ROR
6288 : 05 1b __ ORA ACCU + 0 
628a : 85 4d __ STA T8 + 0 
628c : 8a __ __ TXA
628d : 29 3f __ AND #$3f
628f : 69 e0 __ ADC #$e0
6291 : 85 4e __ STA T8 + 1 
6293 : a5 18 __ LDA P11 ; (col + 0)
6295 : 85 1c __ STA ACCU + 1 
6297 : 0a __ __ ASL
6298 : 0a __ __ ASL
6299 : 05 18 __ ORA P11 ; (col + 0)
629b : 85 43 __ STA T1 + 0 
629d : a5 18 __ LDA P11 ; (col + 0)
629f : 0a __ __ ASL
62a0 : 0a __ __ ASL
62a1 : 0a __ __ ASL
62a2 : 0a __ __ ASL
62a3 : 05 43 __ ORA T1 + 0 
62a5 : 85 43 __ STA T1 + 0 
62a7 : a9 00 __ LDA #$00
62a9 : 85 10 __ STA P3 
62ab : 46 1c __ LSR ACCU + 1 
62ad : 6a __ __ ROR
62ae : 66 1c __ ROR ACCU + 1 
62b0 : 6a __ __ ROR
62b1 : 05 43 __ ORA T1 + 0 
62b3 : 85 45 __ STA T2 + 0 
.l10:
62b5 : 20 a1 5b JSR $5ba1 ; (mc_setpix@proxy + 0)
62b8 : 18 __ __ CLC
62b9 : a5 0d __ LDA P0 
62bb : 69 01 __ ADC #$01
62bd : 85 46 __ STA T4 + 0 
62bf : 85 1b __ STA ACCU + 0 
62c1 : a5 0e __ LDA P1 
62c3 : 69 00 __ ADC #$00
62c5 : 85 47 __ STA T4 + 1 
62c7 : 4a __ __ LSR
62c8 : 66 1b __ ROR ACCU + 0 
62ca : 4a __ __ LSR
62cb : 66 1b __ ROR ACCU + 0 
62cd : 49 20 __ EOR #$20
62cf : c9 20 __ CMP #$20
62d1 : d0 06 __ BNE $62d9 ; (mc_hspan.s11 + 0)
.s25:
62d3 : a5 1b __ LDA ACCU + 0 
62d5 : c5 4c __ CMP T7 + 0 
62d7 : f0 dc __ BEQ $62b5 ; (mc_hspan.l10 + 0)
.s11:
62d9 : a9 00 __ LDA #$00
62db : 85 1c __ STA ACCU + 1 
62dd : a6 4c __ LDX T7 + 0 
62df : e8 __ __ INX
62e0 : a5 4b __ LDA T6 + 1 
62e2 : 30 43 __ BMI $6327 ; (mc_hspan.s12 + 0)
.s24:
62e4 : f0 04 __ BEQ $62ea ; (mc_hspan.s23 + 0)
.s40:
62e6 : 8a __ __ TXA
62e7 : 4c ef 62 JMP $62ef ; (mc_hspan.s19 + 0)
.s23:
62ea : 8a __ __ TXA
62eb : e4 4a __ CPX T6 + 0 
62ed : b0 38 __ BCS $6327 ; (mc_hspan.s12 + 0)
.s19:
62ef : 0a __ __ ASL
62f0 : 0a __ __ ASL
62f1 : 0a __ __ ASL
62f2 : a0 00 __ LDY #$00
62f4 : 90 02 __ BCC $62f8 ; (mc_hspan.s42 + 0)
.s41:
62f6 : c8 __ __ INY
62f7 : 18 __ __ CLC
.s42:
62f8 : 65 4d __ ADC T8 + 0 
62fa : 85 43 __ STA T1 + 0 
62fc : 98 __ __ TYA
62fd : 65 4e __ ADC T8 + 1 
62ff : 85 44 __ STA T1 + 1 
.l20:
6301 : a5 45 __ LDA T2 + 0 
6303 : a0 00 __ LDY #$00
6305 : 91 43 __ STA (T1 + 0),y 
6307 : 24 4b __ BIT T6 + 1 
6309 : 30 1c __ BMI $6327 ; (mc_hspan.s12 + 0)
.s22:
630b : e8 __ __ INX
630c : d0 02 __ BNE $6310 ; (mc_hspan.s44 + 0)
.s43:
630e : e6 1c __ INC ACCU + 1 
.s44:
6310 : 18 __ __ CLC
6311 : a5 43 __ LDA T1 + 0 
6313 : 69 08 __ ADC #$08
6315 : 85 43 __ STA T1 + 0 
6317 : 90 02 __ BCC $631b ; (mc_hspan.s46 + 0)
.s45:
6319 : e6 44 __ INC T1 + 1 
.s46:
631b : a5 1c __ LDA ACCU + 1 
631d : c5 4b __ CMP T6 + 1 
631f : 90 e0 __ BCC $6301 ; (mc_hspan.l20 + 0)
.s48:
6321 : d0 04 __ BNE $6327 ; (mc_hspan.s12 + 0)
.s21:
6323 : e4 4a __ CPX T6 + 0 
6325 : 90 da __ BCC $6301 ; (mc_hspan.l20 + 0)
.s12:
6327 : 06 4a __ ASL T6 + 0 
6329 : 26 4b __ ROL T6 + 1 
632b : 06 4a __ ASL T6 + 0 
632d : 26 4b __ ROL T6 + 1 
632f : a9 00 __ LDA #$00
6331 : 85 10 __ STA P3 
6333 : f0 20 __ BEQ $6355 ; (mc_hspan.l13 + 0)
.s14:
6335 : a5 4a __ LDA T6 + 0 
6337 : 85 0d __ STA P0 
6339 : a5 4b __ LDA T6 + 1 
633b : 85 0e __ STA P1 
633d : a5 12 __ LDA P5 ; (my + 0)
633f : 85 0f __ STA P2 
6341 : a5 18 __ LDA P11 ; (col + 0)
6343 : 85 11 __ STA P4 
6345 : 20 ad 5b JSR $5bad ; (mc_setpix.s4 + 0)
6348 : 18 __ __ CLC
6349 : a5 0d __ LDA P0 
634b : 69 01 __ ADC #$01
634d : 85 4a __ STA T6 + 0 
634f : a5 0e __ LDA P1 
6351 : 69 00 __ ADC #$00
6353 : 85 4b __ STA T6 + 1 
.l13:
6355 : a5 49 __ LDA T5 + 1 
6357 : c5 4b __ CMP T6 + 1 
6359 : d0 07 __ BNE $6362 ; (mc_hspan.s18 + 0)
.s15:
635b : a5 48 __ LDA T5 + 0 
635d : c5 4a __ CMP T6 + 0 
635f : 4c 66 63 JMP $6366 ; (mc_hspan.s16 + 0)
.s18:
6362 : 45 4b __ EOR T6 + 1 
6364 : 30 03 __ BMI $6369 ; (mc_hspan.s17 + 0)
.s16:
6366 : b0 cd __ BCS $6335 ; (mc_hspan.s14 + 0)
.s3:
6368 : 60 __ __ RTS
.s17:
6369 : b0 fd __ BCS $6368 ; (mc_hspan.s3 + 0)
636b : 90 c8 __ BCC $6335 ; (mc_hspan.s14 + 0)
.s26:
636d : a5 17 __ LDA P10 ; (x1 + 1)
636f : c5 15 __ CMP P8 ; (x0 + 1)
6371 : d0 04 __ BNE $6377 ; (mc_hspan.l47 + 0)
.s28:
6373 : a5 48 __ LDA T5 + 0 
6375 : c5 46 __ CMP T4 + 0 
.l47:
6377 : 90 ef __ BCC $6368 ; (mc_hspan.s3 + 0)
.s50:
6379 : a9 00 __ LDA #$00
637b : 85 10 __ STA P3 
637d : a5 12 __ LDA P5 ; (my + 0)
637f : 85 0f __ STA P2 
.l27:
6381 : 20 a1 5b JSR $5ba1 ; (mc_setpix@proxy + 0)
6384 : 18 __ __ CLC
6385 : a5 0d __ LDA P0 
6387 : 69 01 __ ADC #$01
6389 : 85 46 __ STA T4 + 0 
638b : a5 0e __ LDA P1 
638d : 69 00 __ ADC #$00
638f : 85 47 __ STA T4 + 1 
6391 : a5 49 __ LDA T5 + 1 
6393 : 30 d3 __ BMI $6368 ; (mc_hspan.s3 + 0)
.s30:
6395 : c5 47 __ CMP T4 + 1 
6397 : f0 da __ BEQ $6373 ; (mc_hspan.s28 + 0)
.s29:
6399 : b0 e6 __ BCS $6381 ; (mc_hspan.l27 + 0)
639b : 60 __ __ RTS
.s7:
639c : a5 17 __ LDA P10 ; (x1 + 1)
639e : c5 15 __ CMP P8 ; (x0 + 1)
63a0 : d0 04 __ BNE $63a6 ; (mc_hspan.s33 + 0)
.s32:
63a2 : a5 16 __ LDA P9 ; (x1 + 0)
63a4 : c5 14 __ CMP P7 ; (x0 + 0)
.s33:
63a6 : 90 c0 __ BCC $6368 ; (mc_hspan.s3 + 0)
63a8 : 4c 47 62 JMP $6247 ; (mc_hspan.s8 + 0)
--------------------------------------------------------------------
vectors_run: ; vectors_run()->void
;   3, "/home/xahmol/git/UltimateDemo2026/src/vectors.h"
.s1:
63ab : a2 04 __ LDX #$04
63ad : b5 53 __ LDA T3 + 0,x 
63af : 9d c6 bf STA $bfc6,x ; (vectors_run@stack + 0)
63b2 : ca __ __ DEX
63b3 : 10 f8 __ BPL $63ad ; (vectors_run.s1 + 2)
.s4:
63b5 : 20 7e 64 JSR $647e ; (vec_init.s4 + 0)
63b8 : a9 00 __ LDA #$00
63ba : 85 53 __ STA T3 + 0 
63bc : 85 54 __ STA T4 + 0 
63be : a9 a8 __ LDA #$a8
63c0 : 85 55 __ STA T5 + 0 
63c2 : a9 fd __ LDA #$fd
63c4 : 85 56 __ STA T5 + 1 
.l5:
63c6 : 2c 11 d0 BIT $d011 
63c9 : 30 fb __ BMI $63c6 ; (vectors_run.l5 + 0)
.l6:
63cb : 2c 11 d0 BIT $d011 
63ce : 10 fb __ BPL $63cb ; (vectors_run.l6 + 0)
.s7:
63d0 : a9 00 __ LDA #$00
63d2 : 85 57 __ STA T6 + 0 
63d4 : 85 0f __ STA P2 
63d6 : 85 10 __ STA P3 
63d8 : 85 0d __ STA P0 
63da : 20 ff 7b JSR $7bff ; (memset@proxy + 0)
63dd : e6 53 __ INC T3 + 0 
63df : a5 53 __ LDA T3 + 0 
63e1 : 85 0d __ STA P0 
63e3 : a6 54 __ LDX T4 + 0 
63e5 : e8 __ __ INX
63e6 : e8 __ __ INX
63e7 : 86 54 __ STX T4 + 0 
63e9 : 86 0e __ STX P1 
63eb : 20 eb 64 JSR $64eb ; (project.s1 + 0)
.l8:
63ee : a9 ca __ LDA #$ca
63f0 : 8d ea bf STA $bfea ; (sstack + 0)
63f3 : a9 87 __ LDA #$87
63f5 : 8d eb bf STA $bfeb ; (sstack + 1)
63f8 : a9 18 __ LDA #$18
63fa : 8d ec bf STA $bfec ; (sstack + 2)
63fd : a9 83 __ LDA #$83
63ff : 8d ed bf STA $bfed ; (sstack + 3)
6402 : a9 00 __ LDA #$00
6404 : 8d f6 bf STA $bff6 ; (sstack + 12)
6407 : a4 57 __ LDY T6 + 0 
6409 : b9 00 83 LDA $8300,y ; (cube_e[0][0] + 0)
640c : 0a __ __ ASL
640d : aa __ __ TAX
640e : bd e2 87 LDA $87e2,x ; (px_cur[0] + 0)
6411 : 8d ee bf STA $bfee ; (sstack + 4)
6414 : bd e3 87 LDA $87e3,x ; (px_cur[0] + 1)
6417 : 8d ef bf STA $bfef ; (sstack + 5)
641a : bd d2 87 LDA $87d2,x ; (py_cur[0] + 0)
641d : 8d f0 bf STA $bff0 ; (sstack + 6)
6420 : bd d3 87 LDA $87d3,x ; (py_cur[0] + 1)
6423 : 8d f1 bf STA $bff1 ; (sstack + 7)
6426 : b9 01 83 LDA $8301,y ; (cube_e[0][0] + 1)
6429 : 0a __ __ ASL
642a : aa __ __ TAX
642b : bd e2 87 LDA $87e2,x ; (px_cur[0] + 0)
642e : 8d f2 bf STA $bff2 ; (sstack + 8)
6431 : bd e3 87 LDA $87e3,x ; (px_cur[0] + 1)
6434 : 8d f3 bf STA $bff3 ; (sstack + 9)
6437 : bd d2 87 LDA $87d2,x ; (py_cur[0] + 0)
643a : 8d f4 bf STA $bff4 ; (sstack + 10)
643d : bd d3 87 LDA $87d3,x ; (py_cur[0] + 1)
6440 : 8d f5 bf STA $bff5 ; (sstack + 11)
6443 : 20 89 37 JSR $3789 ; (bm_line.s1 + 0)
6446 : 18 __ __ CLC
6447 : a5 57 __ LDA T6 + 0 
6449 : 69 02 __ ADC #$02
644b : 85 57 __ STA T6 + 0 
644d : c9 18 __ CMP #$18
644f : d0 9d __ BNE $63ee ; (vectors_run.l8 + 0)
.s9:
6451 : e6 55 __ INC T5 + 0 
6453 : f0 03 __ BEQ $6458 ; (vectors_run.s11 + 0)
6455 : 4c c6 63 JMP $63c6 ; (vectors_run.l5 + 0)
.s11:
6458 : e6 56 __ INC T5 + 1 
645a : d0 f9 __ BNE $6455 ; (vectors_run.s9 + 4)
.s10:
645c : a9 00 __ LDA #$00
645e : 85 0d __ STA P0 
6460 : 85 0e __ STA P1 
6462 : 85 10 __ STA P3 
6464 : a9 36 __ LDA #$36
6466 : 85 01 __ STA $01 
6468 : 20 71 0f JSR $0f71 ; (vic_setmode@proxy + 0)
646b : a9 00 __ LDA #$00
646d : 8d 20 d0 STA $d020 
6470 : 8d 21 d0 STA $d021 
.s3:
6473 : a2 04 __ LDX #$04
6475 : bd c6 bf LDA $bfc6,x ; (vectors_run@stack + 0)
6478 : 95 53 __ STA T3 + 0,x 
647a : ca __ __ DEX
647b : 10 f8 __ BPL $6475 ; (vectors_run.s3 + 2)
647d : 60 __ __ RTS
--------------------------------------------------------------------
vec_init: ; vec_init()->void
; 116, "/home/xahmol/git/UltimateDemo2026/src/vectors.c"
.s4:
647e : 78 __ __ SEI
647f : a9 00 __ LDA #$00
6481 : 85 0f __ STA P2 
6483 : 85 10 __ STA P3 
6485 : a9 30 __ LDA #$30
6487 : 85 01 __ STA $01 
6489 : a9 40 __ LDA #$40
648b : 85 11 __ STA P4 
648d : a9 1f __ LDA #$1f
648f : 85 12 __ STA P5 
6491 : a9 10 __ LDA #$10
6493 : a2 fa __ LDX #$fa
.l6:
6495 : ca __ __ DEX
6496 : 9d 00 d0 STA $d000,x 
6499 : 9d fa d0 STA $d0fa,x 
649c : 9d f4 d1 STA $d1f4,x 
649f : 9d ee d2 STA $d2ee,x 
64a2 : d0 f1 __ BNE $6495 ; (vec_init.l6 + 0)
.s5:
64a4 : a9 00 __ LDA #$00
64a6 : 85 43 __ STA T1 + 0 
64a8 : 85 0d __ STA P0 
64aa : a9 e0 __ LDA #$e0
64ac : 85 44 __ STA T1 + 1 
64ae : 85 0e __ STA P1 
64b0 : 20 f1 23 JSR $23f1 ; (memset.s4 + 0)
64b3 : a9 35 __ LDA #$35
64b5 : 85 01 __ STA $01 
64b7 : 20 0d 24 JSR $240d ; (mmap_trampoline.s4 + 0)
64ba : 58 __ __ CLI
64bb : 20 6e 7c JSR $7c6e ; (vic_setmode@proxy + 0)
64be : a5 10 __ LDA P3 
64c0 : 8d ca 87 STA $87ca ; (VScreen.data + 0)
64c3 : a5 11 __ LDA P4 
64c5 : 8d cb 87 STA $87cb ; (VScreen.data + 1)
64c8 : a9 28 __ LDA #$28
64ca : 8d ce 87 STA $87ce ; (VScreen.cwidth + 0)
64cd : a9 19 __ LDA #$19
64cf : 8d cf 87 STA $87cf ; (VScreen.cheight + 0)
64d2 : a9 40 __ LDA #$40
64d4 : 8d d0 87 STA $87d0 ; (VScreen.width + 0)
64d7 : a9 01 __ LDA #$01
64d9 : 8d d1 87 STA $87d1 ; (VScreen.width + 1)
64dc : a9 00 __ LDA #$00
64de : 8d 20 d0 STA $d020 
64e1 : 8d 21 d0 STA $d021 
64e4 : 8d cc 87 STA $87cc ; (VScreen.rdata + 0)
64e7 : 8d cd 87 STA $87cd ; (VScreen.rdata + 1)
.s3:
64ea : 60 __ __ RTS
--------------------------------------------------------------------
project: ; project(u8,u8,i16*,i16*)->void
;  81, "/home/xahmol/git/UltimateDemo2026/src/vectors.c"
.s1:
64eb : a2 0e __ LDX #$0e
64ed : b5 53 __ LDA T4 + 0,x 
64ef : 9d d2 bf STA $bfd2,x ; (project@stack + 0)
64f2 : ca __ __ DEX
64f3 : 10 f8 __ BPL $64ed ; (project.s1 + 2)
.s4:
64f5 : a5 0d __ LDA P0 ; (ax + 0)
64f7 : 0a __ __ ASL
64f8 : 85 47 __ STA T1 + 0 
64fa : a9 80 __ LDA #$80
64fc : 69 00 __ ADC #$00
64fe : 85 5a __ STA T7 + 1 
6500 : 18 __ __ CLC
6501 : a5 0e __ LDA P1 ; (ay + 0)
6503 : 69 40 __ ADC #$40
6505 : 0a __ __ ASL
6506 : 85 4b __ STA T2 + 0 
6508 : a9 00 __ LDA #$00
650a : 85 48 __ STA T1 + 1 
650c : 2a __ __ ROL
650d : aa __ __ TAX
650e : a9 fe __ LDA #$fe
6510 : 85 59 __ STA T7 + 0 
6512 : 65 4b __ ADC T2 + 0 
6514 : 85 5b __ STA T8 + 0 
6516 : 8a __ __ TXA
6517 : 69 80 __ ADC #$80
6519 : 85 5c __ STA T8 + 1 
651b : 06 0e __ ASL P1 ; (ay + 0)
651d : 26 48 __ ROL T1 + 1 
651f : 18 __ __ CLC
6520 : a9 fe __ LDA #$fe
6522 : 65 0e __ ADC P1 ; (ay + 0)
6524 : 85 5d __ STA T9 + 0 
6526 : a9 80 __ LDA #$80
6528 : 65 48 __ ADC T1 + 1 
652a : 85 5e __ STA T9 + 1 
652c : 18 __ __ CLC
652d : a5 0d __ LDA P0 ; (ax + 0)
652f : 69 40 __ ADC #$40
6531 : 0a __ __ ASL
6532 : a2 00 __ LDX #$00
6534 : 90 02 __ BCC $6538 ; (project.s11 + 0)
.s10:
6536 : e8 __ __ INX
6537 : 18 __ __ CLC
.s11:
6538 : 69 fe __ ADC #$fe
653a : 85 5f __ STA T10 + 0 
653c : 8a __ __ TXA
653d : 69 80 __ ADC #$80
653f : 85 60 __ STA T10 + 1 
6541 : a9 00 __ LDA #$00
6543 : 85 52 __ STA T11 + 0 
.l5:
6545 : 85 61 __ STA T12 + 0 
6547 : aa __ __ TAX
6548 : bd e6 80 LDA $80e6,x ; (cube_v[0][0] + 0)
654b : 29 80 __ AND #$80
654d : 10 02 __ BPL $6551 ; (project.l5 + 12)
654f : a9 ff __ LDA #$ff
6551 : 85 04 __ STA WORK + 1 
6553 : 85 44 __ STA T0 + 1 
6555 : bd e6 80 LDA $80e6,x ; (cube_v[0][0] + 0)
6558 : 0a __ __ ASL
6559 : 0a __ __ ASL
655a : 18 __ __ CLC
655b : 7d e6 80 ADC $80e6,x ; (cube_v[0][0] + 0)
655e : 0a __ __ ASL
655f : 0a __ __ ASL
6560 : 0a __ __ ASL
6561 : 0a __ __ ASL
6562 : 85 43 __ STA T0 + 0 
6564 : 85 03 __ STA WORK + 0 
6566 : a5 04 __ LDA WORK + 1 
6568 : 29 80 __ AND #$80
656a : 10 02 __ BPL $656e ; (project.l5 + 41)
656c : a9 ff __ LDA #$ff
656e : 85 45 __ STA T0 + 2 
6570 : 85 06 __ STA WORK + 3 
6572 : 85 05 __ STA WORK + 2 
6574 : a0 00 __ LDY #$00
6576 : b1 5b __ LDA (T8 + 0),y 
6578 : 85 0e __ STA P1 ; (ay + 0)
657a : 85 1b __ STA ACCU + 0 
657c : c8 __ __ INY
657d : b1 5b __ LDA (T8 + 0),y 
657f : 85 48 __ STA T1 + 1 
6581 : 85 1c __ STA ACCU + 1 
6583 : 29 80 __ AND #$80
6585 : 10 02 __ BPL $6589 ; (project.l5 + 68)
6587 : a9 ff __ LDA #$ff
6589 : 85 49 __ STA T1 + 2 
658b : 85 1d __ STA ACCU + 2 
658d : 85 1e __ STA ACCU + 3 
658f : 20 d2 78 JSR $78d2 ; (mul32 + 0)
6592 : a5 07 __ LDA WORK + 4 
6594 : 85 4b __ STA T2 + 0 
6596 : a5 08 __ LDA WORK + 5 
6598 : 85 4c __ STA T2 + 1 
659a : a5 09 __ LDA WORK + 6 
659c : 85 4d __ STA T2 + 2 
659e : a5 0a __ LDA WORK + 7 
65a0 : 85 4e __ STA T2 + 3 
65a2 : a0 00 __ LDY #$00
65a4 : b1 5d __ LDA (T9 + 0),y 
65a6 : 85 4f __ STA T3 + 0 
65a8 : 85 03 __ STA WORK + 0 
65aa : c8 __ __ INY
65ab : b1 5d __ LDA (T9 + 0),y 
65ad : 85 50 __ STA T3 + 1 
65af : 85 04 __ STA WORK + 1 
65b1 : 29 80 __ AND #$80
65b3 : 10 02 __ BPL $65b7 ; (project.l5 + 114)
65b5 : a9 ff __ LDA #$ff
65b7 : 85 51 __ STA T3 + 2 
65b9 : 85 06 __ STA WORK + 3 
65bb : 85 05 __ STA WORK + 2 
65bd : a6 61 __ LDX T12 + 0 
65bf : bd e8 80 LDA $80e8,x ; (cube_v[0][0] + 2)
65c2 : 29 80 __ AND #$80
65c4 : 10 02 __ BPL $65c8 ; (project.l5 + 131)
65c6 : a9 ff __ LDA #$ff
65c8 : 85 1c __ STA ACCU + 1 
65ca : 85 54 __ STA T4 + 1 
65cc : bd e8 80 LDA $80e8,x ; (cube_v[0][0] + 2)
65cf : 0a __ __ ASL
65d0 : 0a __ __ ASL
65d1 : 18 __ __ CLC
65d2 : 7d e8 80 ADC $80e8,x ; (cube_v[0][0] + 2)
65d5 : 0a __ __ ASL
65d6 : 0a __ __ ASL
65d7 : 0a __ __ ASL
65d8 : 0a __ __ ASL
65d9 : 85 53 __ STA T4 + 0 
65db : 85 1b __ STA ACCU + 0 
65dd : a5 1c __ LDA ACCU + 1 
65df : 29 80 __ AND #$80
65e1 : 10 02 __ BPL $65e5 ; (project.l5 + 160)
65e3 : a9 ff __ LDA #$ff
65e5 : 85 55 __ STA T4 + 2 
65e7 : 85 1d __ STA ACCU + 2 
65e9 : 85 1e __ STA ACCU + 3 
65eb : 20 d2 78 JSR $78d2 ; (mul32 + 0)
65ee : 18 __ __ CLC
65ef : a5 07 __ LDA WORK + 4 
65f1 : 65 4b __ ADC T2 + 0 
65f3 : a5 08 __ LDA WORK + 5 
65f5 : 65 4c __ ADC T2 + 1 
65f7 : 85 4b __ STA T2 + 0 
65f9 : a5 09 __ LDA WORK + 6 
65fb : 65 4d __ ADC T2 + 2 
65fd : 85 4c __ STA T2 + 1 
65ff : a5 0a __ LDA WORK + 7 
6601 : 65 4e __ ADC T2 + 3 
6603 : 85 4e __ STA T2 + 3 
6605 : a4 47 __ LDY T1 + 0 
6607 : b1 59 __ LDA (T7 + 0),y 
6609 : 85 56 __ STA T5 + 0 
660b : c8 __ __ INY
660c : b1 59 __ LDA (T7 + 0),y 
660e : 85 57 __ STA T5 + 1 
6610 : 29 80 __ AND #$80
6612 : 10 02 __ BPL $6616 ; (project.l5 + 209)
6614 : a9 ff __ LDA #$ff
6616 : 85 58 __ STA T5 + 2 
6618 : a5 53 __ LDA T4 + 0 
661a : 85 1b __ STA ACCU + 0 
661c : a5 54 __ LDA T4 + 1 
661e : 85 1c __ STA ACCU + 1 
6620 : a5 55 __ LDA T4 + 2 
6622 : 85 1d __ STA ACCU + 2 
6624 : 85 1e __ STA ACCU + 3 
6626 : a5 0e __ LDA P1 ; (ay + 0)
6628 : 85 03 __ STA WORK + 0 
662a : a5 48 __ LDA T1 + 1 
662c : 85 04 __ STA WORK + 1 
662e : a5 49 __ LDA T1 + 2 
6630 : 85 05 __ STA WORK + 2 
6632 : 85 06 __ STA WORK + 3 
6634 : 20 d2 78 JSR $78d2 ; (mul32 + 0)
6637 : a5 07 __ LDA WORK + 4 
6639 : 85 0e __ STA P1 ; (ay + 0)
663b : a5 08 __ LDA WORK + 5 
663d : 85 48 __ STA T1 + 1 
663f : a5 09 __ LDA WORK + 6 
6641 : 85 49 __ STA T1 + 2 
6643 : a5 0a __ LDA WORK + 7 
6645 : 85 4a __ STA T1 + 3 
6647 : 38 __ __ SEC
6648 : a9 00 __ LDA #$00
664a : e5 4f __ SBC T3 + 0 
664c : 85 1b __ STA ACCU + 0 
664e : a9 00 __ LDA #$00
6650 : e5 50 __ SBC T3 + 1 
6652 : 85 1c __ STA ACCU + 1 
6654 : a9 00 __ LDA #$00
6656 : e5 51 __ SBC T3 + 2 
6658 : 85 1d __ STA ACCU + 2 
665a : a9 00 __ LDA #$00
665c : e5 51 __ SBC T3 + 2 
665e : 85 1e __ STA ACCU + 3 
6660 : a5 43 __ LDA T0 + 0 
6662 : 85 03 __ STA WORK + 0 
6664 : a5 44 __ LDA T0 + 1 
6666 : 85 04 __ STA WORK + 1 
6668 : a5 45 __ LDA T0 + 2 
666a : 85 05 __ STA WORK + 2 
666c : 85 06 __ STA WORK + 3 
666e : 20 d2 78 JSR $78d2 ; (mul32 + 0)
6671 : 18 __ __ CLC
6672 : a5 07 __ LDA WORK + 4 
6674 : 65 0e __ ADC P1 ; (ay + 0)
6676 : a5 08 __ LDA WORK + 5 
6678 : 65 48 __ ADC T1 + 1 
667a : 85 43 __ STA T0 + 0 
667c : a5 09 __ LDA WORK + 6 
667e : 65 49 __ ADC T1 + 2 
6680 : 85 44 __ STA T0 + 1 
6682 : a5 0a __ LDA WORK + 7 
6684 : 65 4a __ ADC T1 + 3 
6686 : 4a __ __ LSR
6687 : 66 44 __ ROR T0 + 1 
6689 : 66 43 __ ROR T0 + 0 
668b : 4a __ __ LSR
668c : 66 44 __ ROR T0 + 1 
668e : 66 43 __ ROR T0 + 0 
6690 : 4a __ __ LSR
6691 : 66 44 __ ROR T0 + 1 
6693 : 66 43 __ ROR T0 + 0 
6695 : 4a __ __ LSR
6696 : 66 44 __ ROR T0 + 1 
6698 : 66 43 __ ROR T0 + 0 
669a : a5 44 __ LDA T0 + 1 
669c : 85 1c __ STA ACCU + 1 
669e : 29 80 __ AND #$80
66a0 : 10 02 __ BPL $66a4 ; (project.l5 + 351)
66a2 : a9 ff __ LDA #$ff
66a4 : 85 45 __ STA T0 + 2 
66a6 : 85 1e __ STA ACCU + 3 
66a8 : 85 1d __ STA ACCU + 2 
66aa : a5 43 __ LDA T0 + 0 
66ac : 85 1b __ STA ACCU + 0 
66ae : a5 56 __ LDA T5 + 0 
66b0 : 85 03 __ STA WORK + 0 
66b2 : a5 57 __ LDA T5 + 1 
66b4 : 85 04 __ STA WORK + 1 
66b6 : a5 58 __ LDA T5 + 2 
66b8 : 85 05 __ STA WORK + 2 
66ba : 85 06 __ STA WORK + 3 
66bc : 20 d2 78 JSR $78d2 ; (mul32 + 0)
66bf : a5 07 __ LDA WORK + 4 
66c1 : 85 0e __ STA P1 ; (ay + 0)
66c3 : a5 08 __ LDA WORK + 5 
66c5 : 85 48 __ STA T1 + 1 
66c7 : a5 09 __ LDA WORK + 6 
66c9 : 85 49 __ STA T1 + 2 
66cb : a5 0a __ LDA WORK + 7 
66cd : 85 4a __ STA T1 + 3 
66cf : a6 61 __ LDX T12 + 0 
66d1 : bd e7 80 LDA $80e7,x ; (cube_v[0][0] + 1)
66d4 : 29 80 __ AND #$80
66d6 : 10 02 __ BPL $66da ; (project.l5 + 405)
66d8 : a9 ff __ LDA #$ff
66da : 85 04 __ STA WORK + 1 
66dc : 85 50 __ STA T3 + 1 
66de : bd e7 80 LDA $80e7,x ; (cube_v[0][0] + 1)
66e1 : 0a __ __ ASL
66e2 : 0a __ __ ASL
66e3 : 18 __ __ CLC
66e4 : 7d e7 80 ADC $80e7,x ; (cube_v[0][0] + 1)
66e7 : 0a __ __ ASL
66e8 : 0a __ __ ASL
66e9 : 0a __ __ ASL
66ea : 0a __ __ ASL
66eb : 85 4f __ STA T3 + 0 
66ed : 85 03 __ STA WORK + 0 
66ef : a5 04 __ LDA WORK + 1 
66f1 : 29 80 __ AND #$80
66f3 : 10 02 __ BPL $66f7 ; (project.l5 + 434)
66f5 : a9 ff __ LDA #$ff
66f7 : 85 51 __ STA T3 + 2 
66f9 : 85 06 __ STA WORK + 3 
66fb : 85 05 __ STA WORK + 2 
66fd : a0 00 __ LDY #$00
66ff : b1 5f __ LDA (T10 + 0),y 
6701 : 85 53 __ STA T4 + 0 
6703 : 85 1b __ STA ACCU + 0 
6705 : c8 __ __ INY
6706 : b1 5f __ LDA (T10 + 0),y 
6708 : 85 54 __ STA T4 + 1 
670a : 85 1c __ STA ACCU + 1 
670c : 29 80 __ AND #$80
670e : 10 02 __ BPL $6712 ; (project.l5 + 461)
6710 : a9 ff __ LDA #$ff
6712 : 85 55 __ STA T4 + 2 
6714 : 85 1d __ STA ACCU + 2 
6716 : 85 1e __ STA ACCU + 3 
6718 : 20 d2 78 JSR $78d2 ; (mul32 + 0)
671b : 38 __ __ SEC
671c : a5 07 __ LDA WORK + 4 
671e : e5 0e __ SBC P1 ; (ay + 0)
6720 : a5 08 __ LDA WORK + 5 
6722 : e5 48 __ SBC T1 + 1 
6724 : 85 0e __ STA P1 ; (ay + 0)
6726 : a5 09 __ LDA WORK + 6 
6728 : e5 49 __ SBC T1 + 2 
672a : 85 48 __ STA T1 + 1 
672c : a5 0a __ LDA WORK + 7 
672e : e5 4a __ SBC T1 + 3 
6730 : 85 4a __ STA T1 + 3 
6732 : a5 53 __ LDA T4 + 0 
6734 : 85 1b __ STA ACCU + 0 
6736 : a5 54 __ LDA T4 + 1 
6738 : 85 1c __ STA ACCU + 1 
673a : a5 55 __ LDA T4 + 2 
673c : 85 1d __ STA ACCU + 2 
673e : 85 1e __ STA ACCU + 3 
6740 : a5 43 __ LDA T0 + 0 
6742 : 85 03 __ STA WORK + 0 
6744 : a5 44 __ LDA T0 + 1 
6746 : 85 04 __ STA WORK + 1 
6748 : a5 45 __ LDA T0 + 2 
674a : 85 05 __ STA WORK + 2 
674c : 85 06 __ STA WORK + 3 
674e : 20 d2 78 JSR $78d2 ; (mul32 + 0)
6751 : a5 07 __ LDA WORK + 4 
6753 : 85 43 __ STA T0 + 0 
6755 : a5 08 __ LDA WORK + 5 
6757 : 85 44 __ STA T0 + 1 
6759 : a5 09 __ LDA WORK + 6 
675b : 85 45 __ STA T0 + 2 
675d : a5 0a __ LDA WORK + 7 
675f : 85 46 __ STA T0 + 3 
6761 : a5 56 __ LDA T5 + 0 
6763 : 85 1b __ STA ACCU + 0 
6765 : a5 57 __ LDA T5 + 1 
6767 : 85 1c __ STA ACCU + 1 
6769 : a5 58 __ LDA T5 + 2 
676b : 85 1d __ STA ACCU + 2 
676d : 85 1e __ STA ACCU + 3 
676f : a5 4f __ LDA T3 + 0 
6771 : 85 03 __ STA WORK + 0 
6773 : a5 50 __ LDA T3 + 1 
6775 : 85 04 __ STA WORK + 1 
6777 : a5 51 __ LDA T3 + 2 
6779 : 85 05 __ STA WORK + 2 
677b : 85 06 __ STA WORK + 3 
677d : 20 d2 78 JSR $78d2 ; (mul32 + 0)
6780 : 18 __ __ CLC
6781 : a5 07 __ LDA WORK + 4 
6783 : 65 43 __ ADC T0 + 0 
6785 : a5 08 __ LDA WORK + 5 
6787 : 65 44 __ ADC T0 + 1 
6789 : 85 43 __ STA T0 + 0 
678b : a5 09 __ LDA WORK + 6 
678d : 65 45 __ ADC T0 + 2 
678f : 85 44 __ STA T0 + 1 
6791 : a5 0a __ LDA WORK + 7 
6793 : 65 46 __ ADC T0 + 3 
6795 : 4a __ __ LSR
6796 : 66 44 __ ROR T0 + 1 
6798 : 66 43 __ ROR T0 + 0 
679a : 4a __ __ LSR
679b : 66 44 __ ROR T0 + 1 
679d : 66 43 __ ROR T0 + 0 
679f : 4a __ __ LSR
67a0 : 66 44 __ ROR T0 + 1 
67a2 : 66 43 __ ROR T0 + 0 
67a4 : 4a __ __ LSR
67a5 : 66 44 __ ROR T0 + 1 
67a7 : 66 43 __ ROR T0 + 0 
67a9 : 18 __ __ CLC
67aa : a5 43 __ LDA T0 + 0 
67ac : 69 18 __ ADC #$18
67ae : 85 4f __ STA T3 + 0 
67b0 : a5 44 __ LDA T0 + 1 
67b2 : 69 01 __ ADC #$01
67b4 : 85 50 __ STA T3 + 1 
67b6 : a5 44 __ LDA T0 + 1 
67b8 : 49 80 __ EOR #$80
67ba : c9 7e __ CMP #$7e
67bc : d0 04 __ BNE $67c2 ; (project.s9 + 0)
.s8:
67be : a5 43 __ LDA T0 + 0 
67c0 : c9 e9 __ CMP #$e9
.s9:
67c2 : b0 08 __ BCS $67cc ; (project.s6 + 0)
.s7:
67c4 : a9 01 __ LDA #$01
67c6 : 85 4f __ STA T3 + 0 
67c8 : a9 00 __ LDA #$00
67ca : 85 50 __ STA T3 + 1 
.s6:
67cc : a5 4e __ LDA T2 + 3 
67ce : 4a __ __ LSR
67cf : 66 4c __ ROR T2 + 1 
67d1 : 66 4b __ ROR T2 + 0 
67d3 : 4a __ __ LSR
67d4 : 66 4c __ ROR T2 + 1 
67d6 : 66 4b __ ROR T2 + 0 
67d8 : 4a __ __ LSR
67d9 : 66 4c __ ROR T2 + 1 
67db : 66 4b __ ROR T2 + 0 
67dd : 4a __ __ LSR
67de : 66 4c __ ROR T2 + 1 
67e0 : 66 4b __ ROR T2 + 0 
67e2 : a5 4b __ LDA T2 + 0 
67e4 : 0a __ __ ASL
67e5 : a8 __ __ TAY
67e6 : a5 4c __ LDA T2 + 1 
67e8 : 2a __ __ ROL
67e9 : aa __ __ TAX
67ea : 98 __ __ TYA
67eb : 18 __ __ CLC
67ec : 65 4b __ ADC T2 + 0 
67ee : a8 __ __ TAY
67ef : 8a __ __ TXA
67f0 : 65 4c __ ADC T2 + 1 
67f2 : 85 1b __ STA ACCU + 0 
67f4 : 98 __ __ TYA
67f5 : 0a __ __ ASL
67f6 : 26 1b __ ROL ACCU + 0 
67f8 : 0a __ __ ASL
67f9 : 26 1b __ ROL ACCU + 0 
67fb : 0a __ __ ASL
67fc : 26 1b __ ROL ACCU + 0 
67fe : 18 __ __ CLC
67ff : 65 4b __ ADC T2 + 0 
6801 : 85 4b __ STA T2 + 0 
6803 : a5 1b __ LDA ACCU + 0 
6805 : 65 4c __ ADC T2 + 1 
6807 : 06 4b __ ASL T2 + 0 
6809 : 2a __ __ ROL
680a : 06 4b __ ASL T2 + 0 
680c : 2a __ __ ROL
680d : 06 4b __ ASL T2 + 0 
680f : 2a __ __ ROL
6810 : 85 1c __ STA ACCU + 1 
6812 : a5 4b __ LDA T2 + 0 
6814 : 85 1b __ STA ACCU + 0 
6816 : 20 0e 7c JSR $7c0e ; (divs16@proxy + 0)
6819 : 18 __ __ CLC
681a : a5 1b __ LDA ACCU + 0 
681c : 69 a0 __ ADC #$a0
681e : a8 __ __ TAY
681f : a5 1c __ LDA ACCU + 1 
6821 : 69 00 __ ADC #$00
6823 : 85 44 __ STA T0 + 1 
6825 : a5 52 __ LDA T11 + 0 
6827 : 0a __ __ ASL
6828 : 85 4b __ STA T2 + 0 
682a : aa __ __ TAX
682b : 98 __ __ TYA
682c : 9d e2 87 STA $87e2,x ; (px_cur[0] + 0)
682f : a5 44 __ LDA T0 + 1 
6831 : 9d e3 87 STA $87e3,x ; (px_cur[0] + 1)
6834 : a5 4a __ LDA T1 + 3 
6836 : 4a __ __ LSR
6837 : 66 48 __ ROR T1 + 1 
6839 : 66 0e __ ROR P1 ; (ay + 0)
683b : 4a __ __ LSR
683c : 66 48 __ ROR T1 + 1 
683e : 66 0e __ ROR P1 ; (ay + 0)
6840 : 4a __ __ LSR
6841 : 66 48 __ ROR T1 + 1 
6843 : 66 0e __ ROR P1 ; (ay + 0)
6845 : 4a __ __ LSR
6846 : 66 48 __ ROR T1 + 1 
6848 : 66 0e __ ROR P1 ; (ay + 0)
684a : a5 0e __ LDA P1 ; (ay + 0)
684c : 0a __ __ ASL
684d : a8 __ __ TAY
684e : a5 48 __ LDA T1 + 1 
6850 : 2a __ __ ROL
6851 : aa __ __ TAX
6852 : 98 __ __ TYA
6853 : 18 __ __ CLC
6854 : 65 0e __ ADC P1 ; (ay + 0)
6856 : a8 __ __ TAY
6857 : 8a __ __ TXA
6858 : 65 48 __ ADC T1 + 1 
685a : 85 1b __ STA ACCU + 0 
685c : 98 __ __ TYA
685d : 0a __ __ ASL
685e : 26 1b __ ROL ACCU + 0 
6860 : 0a __ __ ASL
6861 : 26 1b __ ROL ACCU + 0 
6863 : 0a __ __ ASL
6864 : 26 1b __ ROL ACCU + 0 
6866 : 18 __ __ CLC
6867 : 65 0e __ ADC P1 ; (ay + 0)
6869 : 85 0e __ STA P1 ; (ay + 0)
686b : a5 1b __ LDA ACCU + 0 
686d : 65 48 __ ADC T1 + 1 
686f : 06 0e __ ASL P1 ; (ay + 0)
6871 : 2a __ __ ROL
6872 : 06 0e __ ASL P1 ; (ay + 0)
6874 : 2a __ __ ROL
6875 : 06 0e __ ASL P1 ; (ay + 0)
6877 : 2a __ __ ROL
6878 : 85 1c __ STA ACCU + 1 
687a : a5 0e __ LDA P1 ; (ay + 0)
687c : 85 1b __ STA ACCU + 0 
687e : 20 0e 7c JSR $7c0e ; (divs16@proxy + 0)
6881 : 18 __ __ CLC
6882 : a5 1b __ LDA ACCU + 0 
6884 : 69 64 __ ADC #$64
6886 : a6 4b __ LDX T2 + 0 
6888 : 9d d2 87 STA $87d2,x ; (py_cur[0] + 0)
688b : a5 1c __ LDA ACCU + 1 
688d : 69 00 __ ADC #$00
688f : 9d d3 87 STA $87d3,x ; (py_cur[0] + 1)
6892 : e6 52 __ INC T11 + 0 
6894 : 18 __ __ CLC
6895 : a5 61 __ LDA T12 + 0 
6897 : 69 03 __ ADC #$03
6899 : c9 18 __ CMP #$18
689b : f0 03 __ BEQ $68a0 ; (project.s3 + 0)
689d : 4c 45 65 JMP $6545 ; (project.l5 + 0)
.s3:
68a0 : a2 0e __ LDX #$0e
68a2 : bd d2 bf LDA $bfd2,x ; (project@stack + 0)
68a5 : 95 53 __ STA T4 + 0,x 
68a7 : ca __ __ DEX
68a8 : 10 f8 __ BPL $68a2 ; (project.s3 + 2)
68aa : 60 __ __ RTS
--------------------------------------------------------------------
plasma_run: ; plasma_run()->void
;   3, "/home/xahmol/git/UltimateDemo2026/src/plasma.h"
.s1:
68ab : a2 04 __ LDX #$04
68ad : b5 53 __ LDA T1 + 0,x 
68af : 9d e2 bf STA $bfe2,x ; (plasma_run@stack + 0)
68b2 : ca __ __ DEX
68b3 : 10 f8 __ BPL $68ad ; (plasma_run.s1 + 2)
.s4:
68b5 : 20 8a 69 JSR $698a ; (plasma_init.s4 + 0)
68b8 : a9 00 __ LDA #$00
68ba : 85 53 __ STA T1 + 0 
68bc : 85 54 __ STA T2 + 0 
68be : 85 55 __ STA T3 + 0 
68c0 : a9 a2 __ LDA #$a2
68c2 : 85 56 __ STA T4 + 0 
68c4 : a9 fe __ LDA #$fe
68c6 : 85 57 __ STA T4 + 1 
.l5:
68c8 : a5 53 __ LDA T1 + 0 
68ca : 85 0d __ STA P0 
68cc : 20 de 69 JSR $69de ; (plasma_frame@proxy + 0)
.l6:
68cf : 2c 11 d0 BIT $d011 
68d2 : 30 fb __ BMI $68cf ; (plasma_run.l6 + 0)
.l7:
68d4 : 2c 11 d0 BIT $d011 
68d7 : 10 fb __ BPL $68d4 ; (plasma_run.l7 + 0)
.s8:
68d9 : e6 55 __ INC T3 + 0 
68db : e6 54 __ INC T2 + 0 
68dd : e6 54 __ INC T2 + 0 
68df : e6 53 __ INC T1 + 0 
68e1 : e6 56 __ INC T4 + 0 
68e3 : d0 e3 __ BNE $68c8 ; (plasma_run.l5 + 0)
.s19:
68e5 : e6 57 __ INC T4 + 1 
68e7 : d0 df __ BNE $68c8 ; (plasma_run.l5 + 0)
.s9:
68e9 : a9 00 __ LDA #$00
68eb : 85 43 __ STA T0 + 0 
68ed : 85 1f __ STA ADDR + 0 
68ef : a9 c0 __ LDA #$c0
68f1 : 85 44 __ STA T0 + 1 
68f3 : d0 02 __ BNE $68f7 ; (plasma_run.l18 + 0)
.s21:
68f5 : e6 44 __ INC T0 + 1 
.l18:
68f7 : a9 82 __ LDA #$82
68f9 : a0 00 __ LDY #$00
68fb : 91 43 __ STA (T0 + 0),y 
68fd : 18 __ __ CLC
68fe : a5 44 __ LDA T0 + 1 
6900 : 69 18 __ ADC #$18
6902 : 85 20 __ STA ADDR + 1 
6904 : a9 07 __ LDA #$07
6906 : a4 43 __ LDY T0 + 0 
6908 : 91 1f __ STA (ADDR + 0),y 
690a : 98 __ __ TYA
690b : 18 __ __ CLC
690c : 69 01 __ ADC #$01
690e : 85 43 __ STA T0 + 0 
6910 : b0 e3 __ BCS $68f5 ; (plasma_run.s21 + 0)
.s22:
6912 : c9 e8 __ CMP #$e8
6914 : d0 e1 __ BNE $68f7 ; (plasma_run.l18 + 0)
.s17:
6916 : a5 44 __ LDA T0 + 1 
6918 : c9 c3 __ CMP #$c3
691a : d0 db __ BNE $68f7 ; (plasma_run.l18 + 0)
.s10:
691c : a9 00 __ LDA #$00
691e : 8d 21 d0 STA $d021 
6921 : a9 a2 __ LDA #$a2
6923 : 85 56 __ STA T4 + 0 
6925 : a9 fe __ LDA #$fe
6927 : 85 57 __ STA T4 + 1 
6929 : a5 53 __ LDA T1 + 0 
.l11:
692b : 85 0d __ STA P0 
692d : 20 de 69 JSR $69de ; (plasma_frame@proxy + 0)
.l12:
6930 : 2c 11 d0 BIT $d011 
6933 : 30 fb __ BMI $6930 ; (plasma_run.l12 + 0)
.l13:
6935 : 2c 11 d0 BIT $d011 
6938 : 10 fb __ BPL $6935 ; (plasma_run.l13 + 0)
.s14:
693a : 18 __ __ CLC
693b : a5 0f __ LDA P2 
693d : 69 02 __ ADC #$02
693f : 85 55 __ STA T3 + 0 
6941 : 18 __ __ CLC
6942 : a5 54 __ LDA T2 + 0 
6944 : 69 03 __ ADC #$03
6946 : 85 54 __ STA T2 + 0 
6948 : 18 __ __ CLC
6949 : a5 0d __ LDA P0 
694b : 69 02 __ ADC #$02
694d : e6 56 __ INC T4 + 0 
694f : d0 da __ BNE $692b ; (plasma_run.l11 + 0)
.s20:
6951 : e6 57 __ INC T4 + 1 
6953 : d0 d6 __ BNE $692b ; (plasma_run.l11 + 0)
.s15:
6955 : a9 00 __ LDA #$00
6957 : 85 0d __ STA P0 
6959 : 85 0e __ STA P1 
695b : 85 10 __ STA P3 
695d : a9 36 __ LDA #$36
695f : 85 01 __ STA $01 
6961 : 20 71 0f JSR $0f71 ; (vic_setmode@proxy + 0)
6964 : a9 00 __ LDA #$00
6966 : 8d 20 d0 STA $d020 
6969 : 8d 21 d0 STA $d021 
696c : a9 20 __ LDA #$20
696e : a2 fa __ LDX #$fa
.l16:
6970 : ca __ __ DEX
6971 : 9d 00 04 STA $0400,x 
6974 : 9d fa 04 STA $04fa,x 
6977 : 9d f4 05 STA $05f4,x 
697a : 9d ee 06 STA $06ee,x 
697d : d0 f1 __ BNE $6970 ; (plasma_run.l16 + 0)
.s3:
697f : a2 04 __ LDX #$04
6981 : bd e2 bf LDA $bfe2,x ; (plasma_run@stack + 0)
6984 : 95 53 __ STA T1 + 0,x 
6986 : ca __ __ DEX
6987 : 10 f8 __ BPL $6981 ; (plasma_run.s3 + 2)
6989 : 60 __ __ RTS
--------------------------------------------------------------------
plasma_init: ; plasma_init()->void
;  38, "/home/xahmol/git/UltimateDemo2026/src/plasma.c"
.s4:
698a : a9 00 __ LDA #$00
698c : 85 0f __ STA P2 
698e : 85 10 __ STA P3 
6990 : 85 43 __ STA T0 + 0 
6992 : 85 0d __ STA P0 
6994 : a9 35 __ LDA #$35
6996 : 85 01 __ STA $01 
6998 : 20 ff 7b JSR $7bff ; (memset@proxy + 0)
699b : a9 c0 __ LDA #$c0
699d : 85 44 __ STA T0 + 1 
699f : a9 00 __ LDA #$00
69a1 : 85 1f __ STA ADDR + 0 
69a3 : f0 02 __ BEQ $69a7 ; (plasma_init.l7 + 0)
.s8:
69a5 : e6 44 __ INC T0 + 1 
.l7:
69a7 : a9 34 __ LDA #$34
69a9 : a0 00 __ LDY #$00
69ab : 91 43 __ STA (T0 + 0),y 
69ad : 18 __ __ CLC
69ae : a5 44 __ LDA T0 + 1 
69b0 : 69 18 __ ADC #$18
69b2 : 85 20 __ STA ADDR + 1 
69b4 : a9 07 __ LDA #$07
69b6 : a4 43 __ LDY T0 + 0 
69b8 : 91 1f __ STA (ADDR + 0),y 
69ba : 98 __ __ TYA
69bb : 18 __ __ CLC
69bc : 69 01 __ ADC #$01
69be : 85 43 __ STA T0 + 0 
69c0 : b0 e3 __ BCS $69a5 ; (plasma_init.s8 + 0)
.s9:
69c2 : c9 e8 __ CMP #$e8
69c4 : d0 e1 __ BNE $69a7 ; (plasma_init.l7 + 0)
.s6:
69c6 : a5 44 __ LDA T0 + 1 
69c8 : c9 c3 __ CMP #$c3
69ca : d0 db __ BNE $69a7 ; (plasma_init.l7 + 0)
.s5:
69cc : a9 00 __ LDA #$00
69ce : 85 0e __ STA P1 
69d0 : 85 10 __ STA P3 
69d2 : 20 5f 7c JSR $7c5f ; (vic_setmode@proxy + 0)
69d5 : a9 00 __ LDA #$00
69d7 : 8d 21 d0 STA $d021 
69da : 8d 20 d0 STA $d020 
.s3:
69dd : 60 __ __ RTS
--------------------------------------------------------------------
plasma_frame@proxy: ; plasma_frame@proxy
69de : a5 54 __ LDA $54 
69e0 : 85 0e __ STA P1 
69e2 : a5 55 __ LDA $55 
69e4 : 85 0f __ STA P2 
--------------------------------------------------------------------
plasma_frame: ; plasma_frame(u8,u8,u8)->void
;  69, "/home/xahmol/git/UltimateDemo2026/src/plasma.c"
.s4:
69e6 : a2 00 __ LDX #$00
.l8:
69e8 : a5 0e __ LDA P1 ; (t2 + 0)
69ea : 29 3f __ AND #$3f
69ec : a8 __ __ TAY
69ed : b9 20 83 LDA $8320,y ; (sin_lut[0] + 0)
69f0 : 9d 20 a2 STA $a220,x ; (row_sin[0] + 0)
69f3 : e6 0e __ INC P1 ; (t2 + 0)
69f5 : e8 __ __ INX
69f6 : e0 c8 __ CPX #$c8
69f8 : d0 ee __ BNE $69e8 ; (plasma_frame.l8 + 0)
.s9:
69fa : a5 0d __ LDA P0 ; (t1 + 0)
69fc : 85 0e __ STA P1 ; (t2 + 0)
69fe : a9 00 __ LDA #$00
6a00 : 85 1b __ STA ACCU + 0 
.l5:
6a02 : 85 4b __ STA T10 + 0 
6a04 : 29 07 __ AND #$07
6a06 : 85 43 __ STA T3 + 0 
6a08 : a5 1b __ LDA ACCU + 0 
6a0a : 29 f8 __ AND #$f8
6a0c : 85 45 __ STA T4 + 0 
6a0e : 4a __ __ LSR
6a0f : 4a __ __ LSR
6a10 : 65 45 __ ADC T4 + 0 
6a12 : 4a __ __ LSR
6a13 : 6a __ __ ROR
6a14 : 6a __ __ ROR
6a15 : aa __ __ TAX
6a16 : 29 c0 __ AND #$c0
6a18 : 6a __ __ ROR
6a19 : 05 43 __ ORA T3 + 0 
6a1b : 85 45 __ STA T4 + 0 
6a1d : 8a __ __ TXA
6a1e : 29 1f __ AND #$1f
6a20 : 09 e0 __ ORA #$e0
6a22 : 85 46 __ STA T4 + 1 
6a24 : a5 1b __ LDA ACCU + 0 
6a26 : 69 03 __ ADC #$03
6a28 : 85 43 __ STA T3 + 0 
6a2a : a5 0e __ LDA P1 ; (t2 + 0)
6a2c : 85 4d __ STA T11 + 0 
6a2e : 18 __ __ CLC
6a2f : 69 03 __ ADC #$03
6a31 : 85 1c __ STA ACCU + 1 
6a33 : a5 1b __ LDA ACCU + 0 
6a35 : aa __ __ TAX
6a36 : e8 __ __ INX
6a37 : 86 49 __ STX T8 + 0 
6a39 : 18 __ __ CLC
6a3a : 69 02 __ ADC #$02
6a3c : 85 47 __ STA T6 + 0 
6a3e : a9 00 __ LDA #$00
6a40 : 85 44 __ STA T3 + 1 
6a42 : 85 48 __ STA T6 + 1 
6a44 : 18 __ __ CLC
6a45 : a5 0e __ LDA P1 ; (t2 + 0)
6a47 : 69 02 __ ADC #$02
6a49 : 85 1d __ STA ACCU + 2 
6a4b : 18 __ __ CLC
6a4c : 69 ff __ ADC #$ff
6a4e : 85 1e __ STA ACCU + 3 
6a50 : a9 00 __ LDA #$00
6a52 : 85 4a __ STA T8 + 1 
6a54 : 85 4c __ STA T10 + 1 
6a56 : bd 1f a2 LDA $a21f,x ; (tbuffer[0] + 319)
6a59 : 85 4e __ STA T12 + 0 
6a5b : a9 28 __ LDA #$28
6a5d : 85 51 __ STA T16 + 0 
6a5f : a0 00 __ LDY #$00
6a61 : 18 __ __ CLC
.l7:
6a62 : a5 4d __ LDA T11 + 0 
6a64 : 29 3f __ AND #$3f
6a66 : aa __ __ TAX
6a67 : bd 20 83 LDA $8320,x ; (sin_lut[0] + 0)
6a6a : 65 4e __ ADC T12 + 0 
6a6c : 85 4f __ STA T13 + 0 
6a6e : a5 4c __ LDA T10 + 1 
6a70 : 4a __ __ LSR
6a71 : a5 4b __ LDA T10 + 0 
6a73 : 6a __ __ ROR
6a74 : 18 __ __ CLC
6a75 : 65 0f __ ADC P2 ; (t3 + 0)
6a77 : 29 3f __ AND #$3f
6a79 : aa __ __ TAX
6a7a : bd 20 83 LDA $8320,x ; (sin_lut[0] + 0)
6a7d : 18 __ __ CLC
6a7e : 65 4f __ ADC T13 + 0 
6a80 : aa __ __ TAX
6a81 : bd 60 83 LDA $8360,x ; (sum_to_col[0] + 0)
6a84 : 4a __ __ LSR
6a85 : 6a __ __ ROR
6a86 : 6a __ __ ROR
6a87 : 85 4f __ STA T13 + 0 
6a89 : a5 1e __ LDA ACCU + 3 
6a8b : 29 3f __ AND #$3f
6a8d : aa __ __ TAX
6a8e : bd 20 83 LDA $8320,x ; (sin_lut[0] + 0)
6a91 : 65 4e __ ADC T12 + 0 
6a93 : 85 50 __ STA T14 + 0 
6a95 : a5 4a __ LDA T8 + 1 
6a97 : 4a __ __ LSR
6a98 : a5 49 __ LDA T8 + 0 
6a9a : 6a __ __ ROR
6a9b : 18 __ __ CLC
6a9c : 65 0f __ ADC P2 ; (t3 + 0)
6a9e : 29 3f __ AND #$3f
6aa0 : aa __ __ TAX
6aa1 : bd 20 83 LDA $8320,x ; (sin_lut[0] + 0)
6aa4 : 18 __ __ CLC
6aa5 : 65 50 __ ADC T14 + 0 
6aa7 : aa __ __ TAX
6aa8 : bd 60 83 LDA $8360,x ; (sum_to_col[0] + 0)
6aab : 0a __ __ ASL
6aac : 0a __ __ ASL
6aad : 0a __ __ ASL
6aae : 0a __ __ ASL
6aaf : 05 4f __ ORA T13 + 0 
6ab1 : 85 4f __ STA T13 + 0 
6ab3 : a5 1d __ LDA ACCU + 2 
6ab5 : 29 3f __ AND #$3f
6ab7 : aa __ __ TAX
6ab8 : bd 20 83 LDA $8320,x ; (sin_lut[0] + 0)
6abb : 65 4e __ ADC T12 + 0 
6abd : 85 50 __ STA T14 + 0 
6abf : a5 48 __ LDA T6 + 1 
6ac1 : 4a __ __ LSR
6ac2 : a5 47 __ LDA T6 + 0 
6ac4 : 6a __ __ ROR
6ac5 : 18 __ __ CLC
6ac6 : 65 0f __ ADC P2 ; (t3 + 0)
6ac8 : 29 3f __ AND #$3f
6aca : aa __ __ TAX
6acb : bd 20 83 LDA $8320,x ; (sin_lut[0] + 0)
6ace : 18 __ __ CLC
6acf : 65 50 __ ADC T14 + 0 
6ad1 : aa __ __ TAX
6ad2 : bd 60 83 LDA $8360,x ; (sum_to_col[0] + 0)
6ad5 : 0a __ __ ASL
6ad6 : 0a __ __ ASL
6ad7 : 05 4f __ ORA T13 + 0 
6ad9 : 85 4f __ STA T13 + 0 
6adb : a5 1c __ LDA ACCU + 1 
6add : 29 3f __ AND #$3f
6adf : aa __ __ TAX
6ae0 : bd 20 83 LDA $8320,x ; (sin_lut[0] + 0)
6ae3 : 65 4e __ ADC T12 + 0 
6ae5 : 85 50 __ STA T14 + 0 
6ae7 : a5 44 __ LDA T3 + 1 
6ae9 : 4a __ __ LSR
6aea : a5 43 __ LDA T3 + 0 
6aec : 6a __ __ ROR
6aed : 18 __ __ CLC
6aee : 65 0f __ ADC P2 ; (t3 + 0)
6af0 : 29 3f __ AND #$3f
6af2 : aa __ __ TAX
6af3 : bd 20 83 LDA $8320,x ; (sin_lut[0] + 0)
6af6 : 18 __ __ CLC
6af7 : 65 50 __ ADC T14 + 0 
6af9 : aa __ __ TAX
6afa : bd 60 83 LDA $8360,x ; (sum_to_col[0] + 0)
6afd : 05 4f __ ORA T13 + 0 
6aff : 91 45 __ STA (T4 + 0),y 
6b01 : 18 __ __ CLC
6b02 : a5 43 __ LDA T3 + 0 
6b04 : 69 04 __ ADC #$04
6b06 : 85 43 __ STA T3 + 0 
6b08 : 90 03 __ BCC $6b0d ; (plasma_frame.s11 + 0)
.s10:
6b0a : e6 44 __ INC T3 + 1 
6b0c : 18 __ __ CLC
.s11:
6b0d : a5 1c __ LDA ACCU + 1 
6b0f : 69 04 __ ADC #$04
6b11 : 85 1c __ STA ACCU + 1 
6b13 : 18 __ __ CLC
6b14 : a5 47 __ LDA T6 + 0 
6b16 : 69 04 __ ADC #$04
6b18 : 85 47 __ STA T6 + 0 
6b1a : 90 03 __ BCC $6b1f ; (plasma_frame.s13 + 0)
.s12:
6b1c : e6 48 __ INC T6 + 1 
6b1e : 18 __ __ CLC
.s13:
6b1f : a5 1d __ LDA ACCU + 2 
6b21 : 69 04 __ ADC #$04
6b23 : 85 1d __ STA ACCU + 2 
6b25 : 18 __ __ CLC
6b26 : a5 49 __ LDA T8 + 0 
6b28 : 69 04 __ ADC #$04
6b2a : 85 49 __ STA T8 + 0 
6b2c : 90 03 __ BCC $6b31 ; (plasma_frame.s15 + 0)
.s14:
6b2e : e6 4a __ INC T8 + 1 
6b30 : 18 __ __ CLC
.s15:
6b31 : a5 1e __ LDA ACCU + 3 
6b33 : 69 04 __ ADC #$04
6b35 : 85 1e __ STA ACCU + 3 
6b37 : 18 __ __ CLC
6b38 : a5 4b __ LDA T10 + 0 
6b3a : 69 04 __ ADC #$04
6b3c : 85 4b __ STA T10 + 0 
6b3e : 90 03 __ BCC $6b43 ; (plasma_frame.s17 + 0)
.s16:
6b40 : e6 4c __ INC T10 + 1 
6b42 : 18 __ __ CLC
.s17:
6b43 : a5 4d __ LDA T11 + 0 
6b45 : 69 04 __ ADC #$04
6b47 : 85 4d __ STA T11 + 0 
6b49 : 98 __ __ TYA
6b4a : 18 __ __ CLC
6b4b : 69 08 __ ADC #$08
6b4d : a8 __ __ TAY
6b4e : 90 03 __ BCC $6b53 ; (plasma_frame.s19 + 0)
.s18:
6b50 : e6 46 __ INC T4 + 1 
6b52 : 18 __ __ CLC
.s19:
6b53 : c6 51 __ DEC T16 + 0 
6b55 : f0 03 __ BEQ $6b5a ; (plasma_frame.s6 + 0)
6b57 : 4c 62 6a JMP $6a62 ; (plasma_frame.l7 + 0)
.s6:
6b5a : e6 1b __ INC ACCU + 0 
6b5c : a5 1b __ LDA ACCU + 0 
6b5e : c9 c8 __ CMP #$c8
6b60 : f0 03 __ BEQ $6b65 ; (plasma_frame.s3 + 0)
6b62 : 4c 02 6a JMP $6a02 ; (plasma_frame.l5 + 0)
.s3:
6b65 : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_run: ; tunnel_run()->void
;   6, "/home/xahmol/git/UltimateDemo2026/src/tunnel.h"
.s1:
6b66 : a2 06 __ LDX #$06
6b68 : b5 53 __ LDA T1 + 0,x 
6b6a : 9d df bf STA $bfdf,x ; (tunnel_run@stack + 0)
6b6d : ca __ __ DEX
6b6e : 10 f8 __ BPL $6b68 ; (tunnel_run.s1 + 2)
.s4:
6b70 : a9 8f __ LDA #$8f
6b72 : 20 59 16 JSR $1659 ; (turbo_set.s4 + 0)
6b75 : 20 3a 6c JSR $6c3a ; (tunnel_build_tables.s4 + 0)
6b78 : 20 7f 6e JSR $6e7f ; (tunnel_build_tex.s4 + 0)
6b7b : 20 ff 6e JSR $6eff ; (tun_init.s4 + 0)
6b7e : a9 00 __ LDA #$00
6b80 : 85 55 __ STA T4 + 0 
6b82 : 85 56 __ STA T5 + 0 
6b84 : 85 43 __ STA T0 + 0 
6b86 : 85 53 __ STA T1 + 0 
6b88 : 85 59 __ STA T7 + 0 
6b8a : 85 57 __ STA T6 + 0 
6b8c : 85 58 __ STA T6 + 1 
.l5:
6b8e : a5 57 __ LDA T6 + 0 
6b90 : 85 1b __ STA ACCU + 0 
6b92 : a5 58 __ LDA T6 + 1 
6b94 : 85 1c __ STA ACCU + 1 
6b96 : a9 c8 __ LDA #$c8
6b98 : 85 03 __ STA WORK + 0 
6b9a : 20 49 78 JSR $7849 ; (divmod@proxy + 0)
6b9d : a4 1b __ LDY ACCU + 0 
6b9f : c4 59 __ CPY T7 + 0 
6ba1 : f0 2a __ BEQ $6bcd ; (tunnel_run.s6 + 0)
.s12:
6ba3 : b9 6a 83 LDA $836a,y ; (pal_sc[0] + 0)
6ba6 : a2 fa __ LDX #$fa
.l14:
6ba8 : ca __ __ DEX
6ba9 : 9d 00 c0 STA $c000,x 
6bac : 9d fa c0 STA $c0fa,x 
6baf : 9d f4 c1 STA $c1f4,x 
6bb2 : 9d ee c2 STA $c2ee,x 
6bb5 : d0 f1 __ BNE $6ba8 ; (tunnel_run.l14 + 0)
.s13:
6bb7 : b9 6e 83 LDA $836e,y ; (pal_cr[0] + 0)
6bba : a2 fa __ LDX #$fa
.l16:
6bbc : ca __ __ DEX
6bbd : 9d 00 d8 STA $d800,x 
6bc0 : 9d fa d8 STA $d8fa,x 
6bc3 : 9d f4 d9 STA $d9f4,x 
6bc6 : 9d ee da STA $daee,x 
6bc9 : d0 f1 __ BNE $6bbc ; (tunnel_run.l16 + 0)
.s15:
6bcb : 84 59 __ STY T7 + 0 
.s6:
6bcd : a5 55 __ LDA T4 + 0 
6bcf : 85 12 __ STA P5 
6bd1 : a5 56 __ LDA T5 + 0 
6bd3 : 85 13 __ STA P6 
6bd5 : a5 43 __ LDA T0 + 0 
6bd7 : 85 54 __ STA T2 + 0 
6bd9 : 29 3f __ AND #$3f
6bdb : aa __ __ TAX
6bdc : bd 72 83 LDA $8372,x ; (lat_wave[0] + 0)
6bdf : 85 14 __ STA P7 
6be1 : a5 53 __ LDA T1 + 0 
6be3 : 29 3f __ AND #$3f
6be5 : aa __ __ TAX
6be6 : bd b2 83 LDA $83b2,x ; (vert_wave[0] + 0)
6be9 : 85 15 __ STA P8 
6beb : 20 53 6f JSR $6f53 ; (tunnel_render.s4 + 0)
.l7:
6bee : 2c 11 d0 BIT $d011 
6bf1 : 30 fb __ BMI $6bee ; (tunnel_run.l7 + 0)
.l8:
6bf3 : 2c 11 d0 BIT $d011 
6bf6 : 10 fb __ BPL $6bf3 ; (tunnel_run.l8 + 0)
.s9:
6bf8 : e6 53 __ INC T1 + 0 
6bfa : a6 54 __ LDX T2 + 0 
6bfc : e8 __ __ INX
6bfd : 86 43 __ STX T0 + 0 
6bff : e6 56 __ INC T5 + 0 
6c01 : e6 55 __ INC T4 + 0 
6c03 : e6 57 __ INC T6 + 0 
6c05 : d0 02 __ BNE $6c09 ; (tunnel_run.s18 + 0)
.s17:
6c07 : e6 58 __ INC T6 + 1 
.s18:
6c09 : a5 58 __ LDA T6 + 1 
6c0b : c9 03 __ CMP #$03
6c0d : f0 03 __ BEQ $6c12 ; (tunnel_run.s11 + 0)
6c0f : 4c 8e 6b JMP $6b8e ; (tunnel_run.l5 + 0)
.s11:
6c12 : a5 57 __ LDA T6 + 0 
6c14 : c9 20 __ CMP #$20
6c16 : d0 f7 __ BNE $6c0f ; (tunnel_run.s18 + 6)
.s10:
6c18 : a9 00 __ LDA #$00
6c1a : 85 0d __ STA P0 
6c1c : 85 0e __ STA P1 
6c1e : 85 10 __ STA P3 
6c20 : a9 36 __ LDA #$36
6c22 : 85 01 __ STA $01 
6c24 : 20 71 0f JSR $0f71 ; (vic_setmode@proxy + 0)
6c27 : a9 00 __ LDA #$00
6c29 : 8d 20 d0 STA $d020 
6c2c : 8d 21 d0 STA $d021 
.s3:
6c2f : a2 06 __ LDX #$06
6c31 : bd df bf LDA $bfdf,x ; (tunnel_run@stack + 0)
6c34 : 95 53 __ STA T1 + 0,x 
6c36 : ca __ __ DEX
6c37 : 10 f8 __ BPL $6c31 ; (tunnel_run.s3 + 2)
6c39 : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_build_tables: ; tunnel_build_tables()->void
; 160, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6c3a : a9 00 __ LDA #$00
6c3c : 85 4d __ STA T4 + 0 
6c3e : a9 97 __ LDA #$97
6c40 : 85 49 __ STA T1 + 0 
6c42 : a9 ff __ LDA #$ff
6c44 : 85 4a __ STA T1 + 1 
.l5:
6c46 : a9 00 __ LDA #$00
6c48 : 85 4e __ STA T5 + 0 
6c4a : a9 b1 __ LDA #$b1
6c4c : 85 4b __ STA T2 + 0 
6c4e : a9 ff __ LDA #$ff
.l6:
6c50 : 85 4c __ STA T2 + 1 
6c52 : 85 10 __ STA P3 
6c54 : a5 49 __ LDA T1 + 0 
6c56 : 85 0d __ STA P0 
6c58 : a5 4a __ LDA T1 + 1 
6c5a : 85 0e __ STA P1 
6c5c : a5 4b __ LDA T2 + 0 
6c5e : 85 0f __ STA P2 
6c60 : 20 c6 6c JSR $6cc6 ; (iatan2_5.s4 + 0)
6c63 : a6 4e __ LDX T5 + 0 
6c65 : 9d 00 a3 STA $a300,x ; (row_buf[0] + 0)
6c68 : a5 4b __ LDA T2 + 0 
6c6a : 85 0d __ STA P0 
6c6c : a5 4c __ LDA T2 + 1 
6c6e : 85 0e __ STA P1 
6c70 : a5 49 __ LDA T1 + 0 
6c72 : 85 0f __ STA P2 
6c74 : a5 4a __ LDA T1 + 1 
6c76 : 85 10 __ STA P3 
6c78 : 20 aa 6d JSR $6daa ; (idist_5.s4 + 0)
6c7b : a6 4e __ LDX T5 + 0 
6c7d : e8 __ __ INX
6c7e : 86 4e __ STX T5 + 0 
6c80 : 9d 4f a3 STA $a34f,x ; (row_buf[0] + 79)
6c83 : 18 __ __ CLC
6c84 : a5 0d __ LDA P0 
6c86 : 69 02 __ ADC #$02
6c88 : 85 4b __ STA T2 + 0 
6c8a : a5 0e __ LDA P1 
6c8c : 69 00 __ ADC #$00
6c8e : e0 50 __ CPX #$50
6c90 : 90 be __ BCC $6c50 ; (tunnel_build_tables.l6 + 0)
.s7:
6c92 : a5 4d __ LDA T4 + 0 
6c94 : 85 1b __ STA ACCU + 0 
6c96 : a9 d0 __ LDA #$d0
6c98 : 85 0d __ STA P0 
6c9a : a9 00 __ LDA #$00
6c9c : 85 1c __ STA ACCU + 1 
6c9e : 85 1d __ STA ACCU + 2 
6ca0 : 85 1e __ STA ACCU + 3 
6ca2 : a9 a0 __ LDA #$a0
6ca4 : 20 9a 77 JSR $779a ; (mul32by8 + 0)
6ca7 : 18 __ __ CLC
6ca8 : a5 09 __ LDA WORK + 6 
6caa : 69 20 __ ADC #$20
6cac : 85 10 __ STA P3 
6cae : a5 0a __ LDA WORK + 7 
6cb0 : 69 00 __ ADC #$00
6cb2 : 85 11 __ STA P4 
6cb4 : 20 4c 6e JSR $6e4c ; (reu_dma@proxy + 0)
6cb7 : e6 49 __ INC T1 + 0 
6cb9 : d0 02 __ BNE $6cbd ; (tunnel_build_tables.s9 + 0)
.s8:
6cbb : e6 4a __ INC T1 + 1 
.s9:
6cbd : e6 4d __ INC T4 + 0 
6cbf : a5 4d __ LDA T4 + 0 
6cc1 : c9 6e __ CMP #$6e
6cc3 : 90 81 __ BCC $6c46 ; (tunnel_build_tables.l5 + 0)
.s3:
6cc5 : 60 __ __ RTS
--------------------------------------------------------------------
iatan2_5: ; iatan2_5(i16,i16)->u8
; 115, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6cc6 : a5 10 __ LDA P3 ; (x + 1)
6cc8 : 05 0f __ ORA P2 ; (x + 0)
6cca : d0 0a __ BNE $6cd6 ; (iatan2_5.s5 + 0)
.s37:
6ccc : 85 0f __ STA P2 ; (x + 0)
6cce : 85 10 __ STA P3 ; (x + 1)
6cd0 : a5 0d __ LDA P0 ; (y + 0)
6cd2 : 05 0e __ ORA P1 ; (y + 1)
6cd4 : f0 77 __ BEQ $6d4d ; (iatan2_5.s3 + 0)
.s5:
6cd6 : 24 10 __ BIT P3 ; (x + 1)
6cd8 : 30 09 __ BMI $6ce3 ; (iatan2_5.s36 + 0)
.s6:
6cda : a5 0f __ LDA P2 ; (x + 0)
6cdc : 85 43 __ STA T1 + 0 
6cde : a5 10 __ LDA P3 ; (x + 1)
6ce0 : 4c ee 6c JMP $6cee ; (iatan2_5.s7 + 0)
.s36:
6ce3 : 38 __ __ SEC
6ce4 : a9 00 __ LDA #$00
6ce6 : e5 0f __ SBC P2 ; (x + 0)
6ce8 : 85 43 __ STA T1 + 0 
6cea : a9 00 __ LDA #$00
6cec : e5 10 __ SBC P3 ; (x + 1)
.s7:
6cee : a8 __ __ TAY
6cef : 24 0e __ BIT P1 ; (y + 1)
6cf1 : 30 09 __ BMI $6cfc ; (iatan2_5.s35 + 0)
.s8:
6cf3 : a5 0d __ LDA P0 ; (y + 0)
6cf5 : 85 45 __ STA T3 + 0 
6cf7 : a5 0e __ LDA P1 ; (y + 1)
6cf9 : 4c 07 6d JMP $6d07 ; (iatan2_5.s9 + 0)
.s35:
6cfc : 38 __ __ SEC
6cfd : a9 00 __ LDA #$00
6cff : e5 0d __ SBC P0 ; (y + 0)
6d01 : 85 45 __ STA T3 + 0 
6d03 : a9 00 __ LDA #$00
6d05 : e5 0e __ SBC P1 ; (y + 1)
.s9:
6d07 : 85 46 __ STA T3 + 1 
6d09 : 98 __ __ TYA
6d0a : 30 53 __ BMI $6d5f ; (iatan2_5.s10 + 0)
.s34:
6d0c : c4 46 __ CPY T3 + 1 
6d0e : d0 04 __ BNE $6d14 ; (iatan2_5.s33 + 0)
.s32:
6d10 : a5 43 __ LDA T1 + 0 
6d12 : c5 45 __ CMP T3 + 0 
.s33:
6d14 : 90 49 __ BCC $6d5f ; (iatan2_5.s10 + 0)
.s21:
6d16 : 84 04 __ STY WORK + 1 
6d18 : 24 0e __ BIT P1 ; (y + 1)
6d1a : 30 04 __ BMI $6d20 ; (iatan2_5.s23 + 0)
.s22:
6d1c : a9 ff __ LDA #$ff
6d1e : b0 02 __ BCS $6d22 ; (iatan2_5.s24 + 0)
.s23:
6d20 : a9 00 __ LDA #$00
.s24:
6d22 : 85 44 __ STA T2 + 0 
6d24 : a5 46 __ LDA T3 + 1 
6d26 : 06 45 __ ASL T3 + 0 
6d28 : 2a __ __ ROL
6d29 : 06 45 __ ASL T3 + 0 
6d2b : 2a __ __ ROL
6d2c : 06 45 __ ASL T3 + 0 
6d2e : 2a __ __ ROL
6d2f : 85 1c __ STA ACCU + 1 
6d31 : a5 45 __ LDA T3 + 0 
6d33 : 85 1b __ STA ACCU + 0 
6d35 : a5 43 __ LDA T1 + 0 
6d37 : 85 03 __ STA WORK + 0 
6d39 : 20 12 78 JSR $7812 ; (divs16 + 0)
6d3c : a5 10 __ LDA P3 ; (x + 1)
6d3e : 30 04 __ BMI $6d44 ; (iatan2_5.s25 + 0)
.s31:
6d40 : 05 0f __ ORA P2 ; (x + 0)
6d42 : d0 10 __ BNE $6d54 ; (iatan2_5.s28 + 0)
.s25:
6d44 : 24 44 __ BIT T2 + 0 
6d46 : 30 06 __ BMI $6d4e ; (iatan2_5.s27 + 0)
.s26:
6d48 : 18 __ __ CLC
6d49 : a5 1b __ LDA ACCU + 0 
6d4b : 69 10 __ ADC #$10
.s3:
6d4d : 60 __ __ RTS
.s27:
6d4e : a9 10 __ LDA #$10
.s38:
6d50 : 38 __ __ SEC
6d51 : e5 1b __ SBC ACCU + 0 
6d53 : 60 __ __ RTS
.s28:
6d54 : 24 44 __ BIT T2 + 0 
6d56 : 10 03 __ BPL $6d5b ; (iatan2_5.s29 + 0)
.s30:
6d58 : a5 1b __ LDA ACCU + 0 
6d5a : 60 __ __ RTS
.s29:
6d5b : a9 20 __ LDA #$20
6d5d : d0 f1 __ BNE $6d50 ; (iatan2_5.s38 + 0)
.s10:
6d5f : 24 10 __ BIT P3 ; (x + 1)
6d61 : 30 04 __ BMI $6d67 ; (iatan2_5.s12 + 0)
.s11:
6d63 : a9 ff __ LDA #$ff
6d65 : d0 02 __ BNE $6d69 ; (iatan2_5.s13 + 0)
.s12:
6d67 : a9 00 __ LDA #$00
.s13:
6d69 : 85 47 __ STA T4 + 0 
6d6b : 98 __ __ TYA
6d6c : 06 43 __ ASL T1 + 0 
6d6e : 2a __ __ ROL
6d6f : 06 43 __ ASL T1 + 0 
6d71 : 2a __ __ ROL
6d72 : 06 43 __ ASL T1 + 0 
6d74 : 2a __ __ ROL
6d75 : 85 1c __ STA ACCU + 1 
6d77 : a5 43 __ LDA T1 + 0 
6d79 : 85 1b __ STA ACCU + 0 
6d7b : a5 45 __ LDA T3 + 0 
6d7d : 85 03 __ STA WORK + 0 
6d7f : a5 46 __ LDA T3 + 1 
6d81 : 85 04 __ STA WORK + 1 
6d83 : 20 12 78 JSR $7812 ; (divs16 + 0)
6d86 : a5 0e __ LDA P1 ; (y + 1)
6d88 : 30 04 __ BMI $6d8e ; (iatan2_5.s14 + 0)
.s20:
6d8a : 05 0d __ ORA P0 ; (y + 0)
6d8c : d0 0e __ BNE $6d9c ; (iatan2_5.s17 + 0)
.s14:
6d8e : 24 47 __ BIT T4 + 0 
6d90 : 10 06 __ BPL $6d98 ; (iatan2_5.s15 + 0)
.s16:
6d92 : 18 __ __ CLC
6d93 : a5 1b __ LDA ACCU + 0 
6d95 : 69 18 __ ADC #$18
6d97 : 60 __ __ RTS
.s15:
6d98 : a9 18 __ LDA #$18
6d9a : d0 b4 __ BNE $6d50 ; (iatan2_5.s38 + 0)
.s17:
6d9c : 24 47 __ BIT T4 + 0 
6d9e : 10 04 __ BPL $6da4 ; (iatan2_5.s18 + 0)
.s19:
6da0 : a9 08 __ LDA #$08
6da2 : d0 ac __ BNE $6d50 ; (iatan2_5.s38 + 0)
.s18:
6da4 : 18 __ __ CLC
6da5 : a5 1b __ LDA ACCU + 0 
6da7 : 69 08 __ ADC #$08
6da9 : 60 __ __ RTS
--------------------------------------------------------------------
idist_5: ; idist_5(i16,i16)->u8
; 137, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6daa : a5 0f __ LDA P2 ; (dy + 0)
6dac : 85 03 __ STA WORK + 0 
6dae : 85 1b __ STA ACCU + 0 
6db0 : a5 10 __ LDA P3 ; (dy + 1)
6db2 : 85 04 __ STA WORK + 1 
6db4 : 85 1c __ STA ACCU + 1 
6db6 : 20 d0 77 JSR $77d0 ; (mul16 + 0)
6db9 : a5 05 __ LDA WORK + 2 
6dbb : 85 43 __ STA T0 + 0 
6dbd : a5 06 __ LDA WORK + 3 
6dbf : 85 44 __ STA T0 + 1 
6dc1 : a5 0d __ LDA P0 ; (dx + 0)
6dc3 : 85 03 __ STA WORK + 0 
6dc5 : 85 1b __ STA ACCU + 0 
6dc7 : a5 0e __ LDA P1 ; (dx + 1)
6dc9 : 85 04 __ STA WORK + 1 
6dcb : 85 1c __ STA ACCU + 1 
6dcd : 20 d0 77 JSR $77d0 ; (mul16 + 0)
6dd0 : 18 __ __ CLC
6dd1 : a5 05 __ LDA WORK + 2 
6dd3 : 65 43 __ ADC T0 + 0 
6dd5 : 85 43 __ STA T0 + 0 
6dd7 : a5 06 __ LDA WORK + 3 
6dd9 : 65 44 __ ADC T0 + 1 
6ddb : 85 44 __ STA T0 + 1 
6ddd : 05 43 __ ORA T0 + 0 
6ddf : f0 64 __ BEQ $6e45 ; (idist_5.s11 + 0)
.s5:
6de1 : a5 44 __ LDA T0 + 1 
6de3 : 4a __ __ LSR
6de4 : 85 46 __ STA T1 + 1 
6de6 : a5 43 __ LDA T0 + 0 
6de8 : 6a __ __ ROR
6de9 : 85 45 __ STA T1 + 0 
6deb : 05 46 __ ORA T1 + 1 
6ded : d0 08 __ BNE $6df7 ; (idist_5.l6 + 0)
.s10:
6def : a9 01 __ LDA #$01
6df1 : 85 45 __ STA T1 + 0 
6df3 : a9 00 __ LDA #$00
6df5 : 85 46 __ STA T1 + 1 
.l6:
6df7 : a5 45 __ LDA T1 + 0 
6df9 : 85 03 __ STA WORK + 0 
6dfb : 85 47 __ STA T2 + 0 
6dfd : a5 46 __ LDA T1 + 1 
6dff : 85 04 __ STA WORK + 1 
6e01 : 85 48 __ STA T2 + 1 
6e03 : a5 43 __ LDA T0 + 0 
6e05 : 85 1b __ STA ACCU + 0 
6e07 : a5 44 __ LDA T0 + 1 
6e09 : 85 1c __ STA ACCU + 1 
6e0b : 20 4d 78 JSR $784d ; (divmod + 0)
6e0e : 18 __ __ CLC
6e0f : a5 1b __ LDA ACCU + 0 
6e11 : 65 45 __ ADC T1 + 0 
6e13 : 85 45 __ STA T1 + 0 
6e15 : a5 1c __ LDA ACCU + 1 
6e17 : 65 46 __ ADC T1 + 1 
6e19 : 4a __ __ LSR
6e1a : 85 46 __ STA T1 + 1 
6e1c : 66 45 __ ROR T1 + 0 
6e1e : c5 48 __ CMP T2 + 1 
6e20 : 90 d5 __ BCC $6df7 ; (idist_5.l6 + 0)
.s12:
6e22 : d0 24 __ BNE $6e48 ; (idist_5.s13 + 0)
.s9:
6e24 : a5 45 __ LDA T1 + 0 
6e26 : c5 47 __ CMP T2 + 0 
6e28 : 90 cd __ BCC $6df7 ; (idist_5.l6 + 0)
.s7:
6e2a : 85 03 __ STA WORK + 0 
6e2c : a9 20 __ LDA #$20
6e2e : 85 1b __ STA ACCU + 0 
6e30 : a9 03 __ LDA #$03
6e32 : 85 1c __ STA ACCU + 1 
6e34 : a5 46 __ LDA T1 + 1 
6e36 : 85 04 __ STA WORK + 1 
6e38 : 20 4d 78 JSR $784d ; (divmod + 0)
6e3b : a5 1c __ LDA ACCU + 1 
6e3d : d0 06 __ BNE $6e45 ; (idist_5.s11 + 0)
.s8:
6e3f : a5 1b __ LDA ACCU + 0 
6e41 : c9 20 __ CMP #$20
6e43 : 90 02 __ BCC $6e47 ; (idist_5.s3 + 0)
.s11:
6e45 : a9 1f __ LDA #$1f
.s3:
6e47 : 60 __ __ RTS
.s13:
6e48 : a5 45 __ LDA T1 + 0 
6e4a : b0 de __ BCS $6e2a ; (idist_5.s7 + 0)
--------------------------------------------------------------------
reu_dma@proxy: ; reu_dma@proxy
6e4c : a5 07 __ LDA WORK + 4 
6e4e : 85 0e __ STA P1 
6e50 : a5 08 __ LDA WORK + 5 
6e52 : 85 0f __ STA P2 
--------------------------------------------------------------------
reu_dma: ; reu_dma(u8,u32,void*,u8)->void
;  94, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6e54 : 78 __ __ SEI
6e55 : a9 00 __ LDA #$00
6e57 : 8d 02 df STA $df02 
6e5a : a9 a3 __ LDA #$a3
6e5c : 8d 03 df STA $df03 
6e5f : a5 0e __ LDA P1 ; (reu_addr + 0)
6e61 : 8d 04 df STA $df04 
6e64 : a5 0f __ LDA P2 ; (reu_addr + 1)
6e66 : 8d 05 df STA $df05 
6e69 : a5 10 __ LDA P3 ; (reu_addr + 2)
6e6b : 8d 06 df STA $df06 
6e6e : a9 a0 __ LDA #$a0
6e70 : 8d 07 df STA $df07 
6e73 : a9 00 __ LDA #$00
6e75 : 8d 08 df STA $df08 
6e78 : a5 0d __ LDA P0 ; (cmd + 0)
6e7a : 8d 01 df STA $df01 
6e7d : 58 __ __ CLI
.s3:
6e7e : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_build_tex: ; tunnel_build_tex()->void
; 182, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6e7f : a9 00 __ LDA #$00
6e81 : 85 1b __ STA ACCU + 0 
.l5:
6e83 : 29 04 __ AND #$04
6e85 : 4a __ __ LSR
6e86 : 4a __ __ LSR
6e87 : f0 02 __ BEQ $6e8b ; (tunnel_build_tex.s14 + 0)
.s13:
6e89 : a9 04 __ LDA #$04
.s14:
6e8b : 85 43 __ STA T1 + 0 
6e8d : a5 1b __ LDA ACCU + 0 
6e8f : 0a __ __ ASL
6e90 : 0a __ __ ASL
6e91 : 0a __ __ ASL
6e92 : 0a __ __ ASL
6e93 : 85 45 __ STA T2 + 0 
6e95 : a9 00 __ LDA #$00
6e97 : 85 1c __ STA ACCU + 1 
6e99 : 2a __ __ ROL
6e9a : 06 45 __ ASL T2 + 0 
6e9c : 2a __ __ ROL
6e9d : 85 46 __ STA T2 + 1 
6e9f : a5 1b __ LDA ACCU + 0 
6ea1 : 29 03 __ AND #$03
6ea3 : f0 3b __ BEQ $6ee0 ; (tunnel_build_tex.s11 + 0)
.l6:
6ea5 : 18 __ __ CLC
6ea6 : a5 43 __ LDA T1 + 0 
6ea8 : 65 1c __ ADC ACCU + 1 
6eaa : 29 1f __ AND #$1f
6eac : aa __ __ TAX
6ead : 29 07 __ AND #$07
6eaf : d0 04 __ BNE $6eb5 ; (tunnel_build_tex.s7 + 0)
.s10:
6eb1 : a9 02 __ LDA #$02
6eb3 : d0 05 __ BNE $6eba ; (tunnel_build_tex.s8 + 0)
.s7:
6eb5 : 8a __ __ TXA
6eb6 : 29 04 __ AND #$04
6eb8 : 4a __ __ LSR
6eb9 : 4a __ __ LSR
.s8:
6eba : aa __ __ TAX
6ebb : a5 45 __ LDA T2 + 0 
6ebd : 05 1c __ ORA ACCU + 1 
6ebf : 18 __ __ CLC
6ec0 : 69 a0 __ ADC #$a0
6ec2 : 85 47 __ STA T5 + 0 
6ec4 : a9 a3 __ LDA #$a3
6ec6 : 65 46 __ ADC T2 + 1 
6ec8 : 85 48 __ STA T5 + 1 
6eca : 8a __ __ TXA
6ecb : a0 00 __ LDY #$00
6ecd : 91 47 __ STA (T5 + 0),y 
6ecf : e6 1c __ INC ACCU + 1 
6ed1 : a5 1c __ LDA ACCU + 1 
6ed3 : c9 20 __ CMP #$20
6ed5 : d0 ce __ BNE $6ea5 ; (tunnel_build_tex.l6 + 0)
.s9:
6ed7 : e6 1b __ INC ACCU + 0 
6ed9 : a5 1b __ LDA ACCU + 0 
6edb : c9 20 __ CMP #$20
6edd : d0 a4 __ BNE $6e83 ; (tunnel_build_tex.l5 + 0)
.s3:
6edf : 60 __ __ RTS
.s11:
6ee0 : 85 43 __ STA T1 + 0 
6ee2 : a6 45 __ LDX T2 + 0 
.l12:
6ee4 : 8a __ __ TXA
6ee5 : 05 1c __ ORA ACCU + 1 
6ee7 : 18 __ __ CLC
6ee8 : 69 a0 __ ADC #$a0
6eea : a8 __ __ TAY
6eeb : a9 a3 __ LDA #$a3
6eed : 65 46 __ ADC T2 + 1 
6eef : 85 44 __ STA T1 + 1 
6ef1 : a9 03 __ LDA #$03
6ef3 : 91 43 __ STA (T1 + 0),y 
6ef5 : e6 1c __ INC ACCU + 1 
6ef7 : a5 1c __ LDA ACCU + 1 
6ef9 : c9 20 __ CMP #$20
6efb : d0 e7 __ BNE $6ee4 ; (tunnel_build_tex.l12 + 0)
6efd : f0 d8 __ BEQ $6ed7 ; (tunnel_build_tex.s9 + 0)
--------------------------------------------------------------------
tun_init: ; tun_init()->void
; 266, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6eff : a9 00 __ LDA #$00
6f01 : 85 0f __ STA P2 
6f03 : 85 10 __ STA P3 
6f05 : 85 43 __ STA T0 + 0 
6f07 : 85 0d __ STA P0 
6f09 : a9 35 __ LDA #$35
6f0b : 85 01 __ STA $01 
6f0d : 20 ff 7b JSR $7bff ; (memset@proxy + 0)
6f10 : a9 c0 __ LDA #$c0
6f12 : 85 44 __ STA T0 + 1 
6f14 : a9 00 __ LDA #$00
6f16 : 85 1f __ STA ADDR + 0 
6f18 : f0 02 __ BEQ $6f1c ; (tun_init.l7 + 0)
.s8:
6f1a : e6 44 __ INC T0 + 1 
.l7:
6f1c : a9 f9 __ LDA #$f9
6f1e : a0 00 __ LDY #$00
6f20 : 91 43 __ STA (T0 + 0),y 
6f22 : 18 __ __ CLC
6f23 : a5 44 __ LDA T0 + 1 
6f25 : 69 18 __ ADC #$18
6f27 : 85 20 __ STA ADDR + 1 
6f29 : a9 01 __ LDA #$01
6f2b : a4 43 __ LDY T0 + 0 
6f2d : 91 1f __ STA (ADDR + 0),y 
6f2f : 98 __ __ TYA
6f30 : 18 __ __ CLC
6f31 : 69 01 __ ADC #$01
6f33 : 85 43 __ STA T0 + 0 
6f35 : b0 e3 __ BCS $6f1a ; (tun_init.s8 + 0)
.s9:
6f37 : c9 e8 __ CMP #$e8
6f39 : d0 e1 __ BNE $6f1c ; (tun_init.l7 + 0)
.s6:
6f3b : a5 44 __ LDA T0 + 1 
6f3d : c9 c3 __ CMP #$c3
6f3f : d0 db __ BNE $6f1c ; (tun_init.l7 + 0)
.s5:
6f41 : a9 00 __ LDA #$00
6f43 : 85 0e __ STA P1 
6f45 : 85 10 __ STA P3 
6f47 : 20 5f 7c JSR $7c5f ; (vic_setmode@proxy + 0)
6f4a : a9 00 __ LDA #$00
6f4c : 8d 21 d0 STA $d021 
6f4f : 8d 20 d0 STA $d020 
.s3:
6f52 : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_render: ; tunnel_render(u8,u8,i8,i8)->void
; 209, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6f53 : 18 __ __ CLC
6f54 : a5 15 __ LDA P8 ; (vert_j + 0)
6f56 : 69 05 __ ADC #$05
6f58 : 85 51 __ STA T12 + 0 
6f5a : a9 00 __ LDA #$00
6f5c : 85 52 __ STA T13 + 0 
6f5e : a9 d1 __ LDA #$d1
6f60 : 85 0d __ STA P0 
.l5:
6f62 : a5 51 __ LDA T12 + 0 
6f64 : 85 1b __ STA ACCU + 0 
6f66 : a9 00 __ LDA #$00
6f68 : 85 1c __ STA ACCU + 1 
6f6a : 85 1d __ STA ACCU + 2 
6f6c : 85 1e __ STA ACCU + 3 
6f6e : a9 a0 __ LDA #$a0
6f70 : 20 9a 77 JSR $779a ; (mul32by8 + 0)
6f73 : 18 __ __ CLC
6f74 : a5 09 __ LDA WORK + 6 
6f76 : 69 20 __ ADC #$20
6f78 : 85 10 __ STA P3 
6f7a : a5 0a __ LDA WORK + 7 
6f7c : 69 00 __ ADC #$00
6f7e : 85 11 __ STA P4 
6f80 : 20 4c 6e JSR $6e4c ; (reu_dma@proxy + 0)
6f83 : a5 52 __ LDA T13 + 0 
6f85 : 4a __ __ LSR
6f86 : 4a __ __ LSR
6f87 : 4a __ __ LSR
6f88 : aa __ __ TAX
6f89 : a5 52 __ LDA T13 + 0 
6f8b : 29 07 __ AND #$07
6f8d : 1d b4 7b ORA $7bb4,x ; (__multab320L + 0)
6f90 : 85 43 __ STA T1 + 0 
6f92 : bd c1 7b LDA $7bc1,x ; (__multab320H + 0)
6f95 : 09 e0 __ ORA #$e0
6f97 : 85 44 __ STA T1 + 1 
6f99 : 38 __ __ SEC
6f9a : a9 c7 __ LDA #$c7
6f9c : e5 52 __ SBC T13 + 0 
6f9e : aa __ __ TAX
6f9f : 29 07 __ AND #$07
6fa1 : 85 1c __ STA ACCU + 1 
6fa3 : 8a __ __ TXA
6fa4 : 4a __ __ LSR
6fa5 : 4a __ __ LSR
6fa6 : 4a __ __ LSR
6fa7 : 85 1b __ STA ACCU + 0 
6fa9 : 0a __ __ ASL
6faa : 0a __ __ ASL
6fab : 65 1b __ ADC ACCU + 0 
6fad : 4a __ __ LSR
6fae : 6a __ __ ROR
6faf : aa __ __ TAX
6fb0 : 29 80 __ AND #$80
6fb2 : 6a __ __ ROR
6fb3 : 05 1c __ ORA ACCU + 1 
6fb5 : 85 1b __ STA ACCU + 0 
6fb7 : 8a __ __ TXA
6fb8 : 29 3f __ AND #$3f
6fba : 69 e0 __ ADC #$e0
6fbc : 85 1c __ STA ACCU + 1 
6fbe : a9 00 __ LDA #$00
6fc0 : 85 1d __ STA ACCU + 2 
.l6:
6fc2 : 0a __ __ ASL
6fc3 : 18 __ __ CLC
6fc4 : 65 14 __ ADC P7 ; (lat_j + 0)
6fc6 : 85 45 __ STA T4 + 0 
6fc8 : aa __ __ TAX
6fc9 : a8 __ __ TAY
6fca : c8 __ __ INY
6fcb : 24 45 __ BIT T4 + 0 
6fcd : 10 03 __ BPL $6fd2 ; (tunnel_render.s7 + 0)
6fcf : 4c df 70 JMP $70df ; (tunnel_render.s13 + 0)
.s7:
6fd2 : a9 4f __ LDA #$4f
6fd4 : c5 45 __ CMP T4 + 0 
6fd6 : b0 02 __ BCS $6fda ; (tunnel_render.s8 + 0)
.s12:
6fd8 : 85 45 __ STA T4 + 0 
.s8:
6fda : 8a __ __ TXA
6fdb : 30 06 __ BMI $6fe3 ; (tunnel_render.s9 + 0)
.s20:
6fdd : c9 4f __ CMP #$4f
6fdf : 90 02 __ BCC $6fe3 ; (tunnel_render.s9 + 0)
.s11:
6fe1 : a0 4f __ LDY #$4f
.s9:
6fe3 : 84 47 __ STY T5 + 0 
6fe5 : a5 13 __ LDA P6 ; (t_dist + 0)
6fe7 : a6 45 __ LDX T4 + 0 
6fe9 : 18 __ __ CLC
6fea : 7d 50 a3 ADC $a350,x ; (row_buf[0] + 80)
6fed : 29 1f __ AND #$1f
6fef : 0a __ __ ASL
6ff0 : 0a __ __ ASL
6ff1 : 0a __ __ ASL
6ff2 : 0a __ __ ASL
6ff3 : 85 49 __ STA T6 + 0 
6ff5 : a9 00 __ LDA #$00
6ff7 : 2a __ __ ROL
6ff8 : 06 49 __ ASL T6 + 0 
6ffa : 2a __ __ ROL
6ffb : 85 4a __ STA T6 + 1 
6ffd : bd 00 a3 LDA $a300,x ; (row_buf[0] + 0)
7000 : 85 45 __ STA T4 + 0 
7002 : 65 12 __ ADC P5 ; (t_ang + 0)
7004 : 29 1f __ AND #$1f
7006 : 05 49 __ ORA T6 + 0 
7008 : 18 __ __ CLC
7009 : 69 a0 __ ADC #$a0
700b : 85 4d __ STA T9 + 0 
700d : a9 a3 __ LDA #$a3
700f : 65 4a __ ADC T6 + 1 
7011 : 85 4e __ STA T9 + 1 
7013 : a0 00 __ LDY #$00
7015 : b1 4d __ LDA (T9 + 0),y 
7017 : aa __ __ TAX
7018 : 4a __ __ LSR
7019 : 85 50 __ STA T10 + 1 
701b : 98 __ __ TYA
701c : 6a __ __ ROR
701d : 66 50 __ ROR T10 + 1 
701f : 6a __ __ ROR
7020 : 85 4f __ STA T10 + 0 
7022 : 8a __ __ TXA
7023 : 0a __ __ ASL
7024 : 0a __ __ ASL
7025 : 0a __ __ ASL
7026 : 0a __ __ ASL
7027 : 05 4f __ ORA T10 + 0 
7029 : 85 4d __ STA T9 + 0 
702b : a6 47 __ LDX T5 + 0 
702d : bd 50 a3 LDA $a350,x ; (row_buf[0] + 80)
7030 : 18 __ __ CLC
7031 : 65 13 __ ADC P6 ; (t_dist + 0)
7033 : 29 1f __ AND #$1f
7035 : 0a __ __ ASL
7036 : 0a __ __ ASL
7037 : 0a __ __ ASL
7038 : 0a __ __ ASL
7039 : 85 4b __ STA T7 + 0 
703b : 98 __ __ TYA
703c : 2a __ __ ROL
703d : 06 4b __ ASL T7 + 0 
703f : 2a __ __ ROL
7040 : 85 4c __ STA T7 + 1 
7042 : bd 00 a3 LDA $a300,x ; (row_buf[0] + 0)
7045 : 85 47 __ STA T5 + 0 
7047 : 65 12 __ ADC P5 ; (t_ang + 0)
7049 : 29 1f __ AND #$1f
704b : 05 4b __ ORA T7 + 0 
704d : 18 __ __ CLC
704e : 69 a0 __ ADC #$a0
7050 : 85 4f __ STA T10 + 0 
7052 : a9 a3 __ LDA #$a3
7054 : 65 4c __ ADC T7 + 1 
7056 : 85 50 __ STA T10 + 1 
7058 : b1 4f __ LDA (T10 + 0),y 
705a : 0a __ __ ASL
705b : 0a __ __ ASL
705c : 05 4d __ ORA T9 + 0 
705e : 11 4f __ ORA (T10 + 0),y 
7060 : 91 43 __ STA (T1 + 0),y 
7062 : 38 __ __ SEC
7063 : a9 20 __ LDA #$20
7065 : e5 45 __ SBC T4 + 0 
7067 : 18 __ __ CLC
7068 : 65 12 __ ADC P5 ; (t_ang + 0)
706a : 29 1f __ AND #$1f
706c : 05 49 __ ORA T6 + 0 
706e : 18 __ __ CLC
706f : 69 a0 __ ADC #$a0
7071 : 85 45 __ STA T4 + 0 
7073 : a9 a3 __ LDA #$a3
7075 : 65 4a __ ADC T6 + 1 
7077 : 85 46 __ STA T4 + 1 
7079 : b1 45 __ LDA (T4 + 0),y 
707b : aa __ __ TAX
707c : 4a __ __ LSR
707d : 85 4a __ STA T6 + 1 
707f : 98 __ __ TYA
7080 : 6a __ __ ROR
7081 : 66 4a __ ROR T6 + 1 
7083 : 6a __ __ ROR
7084 : 85 49 __ STA T6 + 0 
7086 : 8a __ __ TXA
7087 : 0a __ __ ASL
7088 : 0a __ __ ASL
7089 : 0a __ __ ASL
708a : 0a __ __ ASL
708b : 05 49 __ ORA T6 + 0 
708d : 85 45 __ STA T4 + 0 
708f : 38 __ __ SEC
7090 : a9 20 __ LDA #$20
7092 : e5 47 __ SBC T5 + 0 
7094 : 18 __ __ CLC
7095 : 65 12 __ ADC P5 ; (t_ang + 0)
7097 : 29 1f __ AND #$1f
7099 : 05 4b __ ORA T7 + 0 
709b : 18 __ __ CLC
709c : 69 a0 __ ADC #$a0
709e : 85 47 __ STA T5 + 0 
70a0 : a9 a3 __ LDA #$a3
70a2 : 65 4c __ ADC T7 + 1 
70a4 : 85 48 __ STA T5 + 1 
70a6 : b1 47 __ LDA (T5 + 0),y 
70a8 : 0a __ __ ASL
70a9 : 0a __ __ ASL
70aa : 05 45 __ ORA T4 + 0 
70ac : 11 47 __ ORA (T5 + 0),y 
70ae : 91 1b __ STA (ACCU + 0),y 
70b0 : 18 __ __ CLC
70b1 : a5 43 __ LDA T1 + 0 
70b3 : 69 08 __ ADC #$08
70b5 : 85 43 __ STA T1 + 0 
70b7 : 90 03 __ BCC $70bc ; (tunnel_render.s17 + 0)
.s16:
70b9 : e6 44 __ INC T1 + 1 
70bb : 18 __ __ CLC
.s17:
70bc : a5 1b __ LDA ACCU + 0 
70be : 69 08 __ ADC #$08
70c0 : 85 1b __ STA ACCU + 0 
70c2 : 90 02 __ BCC $70c6 ; (tunnel_render.s19 + 0)
.s18:
70c4 : e6 1c __ INC ACCU + 1 
.s19:
70c6 : e6 1d __ INC ACCU + 2 
70c8 : a5 1d __ LDA ACCU + 2 
70ca : c9 28 __ CMP #$28
70cc : f0 03 __ BEQ $70d1 ; (tunnel_render.s10 + 0)
70ce : 4c c2 6f JMP $6fc2 ; (tunnel_render.l6 + 0)
.s10:
70d1 : e6 51 __ INC T12 + 0 
70d3 : e6 52 __ INC T13 + 0 
70d5 : a5 52 __ LDA T13 + 0 
70d7 : c9 64 __ CMP #$64
70d9 : f0 03 __ BEQ $70de ; (tunnel_render.s3 + 0)
70db : 4c 62 6f JMP $6f62 ; (tunnel_render.l5 + 0)
.s3:
70de : 60 __ __ RTS
.s13:
70df : a9 00 __ LDA #$00
70e1 : 85 45 __ STA T4 + 0 
70e3 : 8a __ __ TXA
70e4 : 30 03 __ BMI $70e9 ; (tunnel_render.s15 + 0)
70e6 : 4c dd 6f JMP $6fdd ; (tunnel_render.s20 + 0)
.s15:
70e9 : e0 ff __ CPX #$ff
70eb : 90 03 __ BCC $70f0 ; (tunnel_render.s14 + 0)
70ed : 4c da 6f JMP $6fda ; (tunnel_render.s8 + 0)
.s14:
70f0 : a0 00 __ LDY #$00
70f2 : 4c e3 6f JMP $6fe3 ; (tunnel_render.s9 + 0)
--------------------------------------------------------------------
scroller_run: ; scroller_run()->void
;   3, "/home/xahmol/git/UltimateDemo2026/src/scroller.h"
.s4:
70f5 : a9 00 __ LDA #$00
70f7 : 8d f7 87 STA $87f7 ; (loops + 0)
70fa : 8d f8 87 STA $87f8 ; (loops + 1)
70fd : 8d f6 87 STA $87f6 ; (done + 0)
7100 : 8d f5 87 STA $87f5 ; (plasma_phase + 0)
7103 : 8d f4 87 STA $87f4 ; (wave_phase + 0)
7106 : 8d f2 87 STA $87f2 ; (insert_col + 0)
7109 : 8d fe 82 STA $82fe ; (txt_pos + 0)
710c : 8d ff 82 STA $82ff ; (txt_pos + 1)
710f : a9 07 __ LDA #$07
7111 : 8d f3 87 STA $87f3 ; (fine_x + 0)
7114 : 20 1c 72 JSR $721c ; (scr_init.s4 + 0)
7117 : a9 00 __ LDA #$00
7119 : 8d 20 d0 STA $d020 
.l5:
711c : 2c 11 d0 BIT $d011 
711f : 30 fb __ BMI $711c ; (scroller_run.l5 + 0)
.l6:
7121 : 2c 11 d0 BIT $d011 
7124 : 10 fb __ BPL $7121 ; (scroller_run.l6 + 0)
.s7:
7126 : a9 00 __ LDA #$00
7128 : 8d 00 dc STA $dc00 
712b : ad 01 dc LDA $dc01 
712e : 85 43 __ STA T0 + 0 
7130 : a9 ff __ LDA #$ff
7132 : 8d 00 dc STA $dc00 
7135 : c5 43 __ CMP T0 + 0 
7137 : f0 05 __ BEQ $713e ; (scroller_run.s8 + 0)
.s20:
7139 : a9 01 __ LDA #$01
713b : 8d f6 87 STA $87f6 ; (done + 0)
.s8:
713e : ad f3 87 LDA $87f3 ; (fine_x + 0)
7141 : f0 06 __ BEQ $7149 ; (scroller_run.s9 + 0)
.s19:
7143 : ce f3 87 DEC $87f3 ; (fine_x + 0)
7146 : 4c d9 71 JMP $71d9 ; (scroller_run.s11 + 0)
.s9:
7149 : a9 07 __ LDA #$07
714b : 8d f3 87 STA $87f3 ; (fine_x + 0)
714e : a2 00 __ LDX #$00
.l21:
7150 : bd c9 88 LDA $88c9,x ; (scr_letter[0] + 1)
7153 : 9d c8 88 STA $88c8,x ; (scr_letter[0] + 0)
7156 : bd c9 89 LDA $89c9,x ; (scr_col[0] + 1)
7159 : 9d c8 89 STA $89c8,x ; (scr_col[0] + 0)
715c : e8 __ __ INX
715d : e0 27 __ CPX #$27
715f : d0 ef __ BNE $7150 ; (scroller_run.l21 + 0)
.s22:
7161 : 18 __ __ CLC
7162 : a9 f2 __ LDA #$f2
7164 : 6d fe 82 ADC $82fe ; (txt_pos + 0)
7167 : 85 43 __ STA T0 + 0 
7169 : a9 83 __ LDA #$83
716b : 6d ff 82 ADC $82ff ; (txt_pos + 1)
716e : 85 44 __ STA T0 + 1 
7170 : a0 00 __ LDY #$00
7172 : b1 43 __ LDA (T0 + 0),y 
7174 : 20 82 72 JSR $7282 ; (letter_idx.s4 + 0)
7177 : aa __ __ TAX
7178 : ad f2 87 LDA $87f2 ; (insert_col + 0)
717b : dd 2a 86 CMP $862a,x ; (letter_width[0] + 0)
717e : b0 0b __ BCS $718b ; (scroller_run.s10 + 0)
.s18:
7180 : 8e ef 88 STX $88ef ; (scr_letter[0] + 39)
7183 : 8d ef 89 STA $89ef ; (scr_col[0] + 39)
7186 : ee f2 87 INC $87f2 ; (insert_col + 0)
7189 : 90 4e __ BCC $71d9 ; (scroller_run.s11 + 0)
.s10:
718b : a9 00 __ LDA #$00
718d : 8d f2 87 STA $87f2 ; (insert_col + 0)
7190 : 8d ef 89 STA $89ef ; (scr_col[0] + 39)
7193 : ad fe 82 LDA $82fe ; (txt_pos + 0)
7196 : 69 00 __ ADC #$00
7198 : 8d fe 82 STA $82fe ; (txt_pos + 0)
719b : a9 34 __ LDA #$34
719d : 8d ef 88 STA $88ef ; (scr_letter[0] + 39)
71a0 : ad ff 82 LDA $82ff ; (txt_pos + 1)
71a3 : 69 00 __ ADC #$00
71a5 : 8d ff 82 STA $82ff ; (txt_pos + 1)
71a8 : c9 02 __ CMP #$02
71aa : d0 05 __ BNE $71b1 ; (scroller_run.s17 + 0)
.s16:
71ac : ad fe 82 LDA $82fe ; (txt_pos + 0)
71af : c9 37 __ CMP #$37
.s17:
71b1 : 90 26 __ BCC $71d9 ; (scroller_run.s11 + 0)
.s13:
71b3 : a9 00 __ LDA #$00
71b5 : 8d fe 82 STA $82fe ; (txt_pos + 0)
71b8 : 8d ff 82 STA $82ff ; (txt_pos + 1)
71bb : ad f7 87 LDA $87f7 ; (loops + 0)
71be : 69 00 __ ADC #$00
71c0 : 8d f7 87 STA $87f7 ; (loops + 0)
71c3 : ad f8 87 LDA $87f8 ; (loops + 1)
71c6 : 69 00 __ ADC #$00
71c8 : 8d f8 87 STA $87f8 ; (loops + 1)
71cb : d0 07 __ BNE $71d4 ; (scroller_run.s14 + 0)
.s15:
71cd : ad f7 87 LDA $87f7 ; (loops + 0)
71d0 : c9 02 __ CMP #$02
71d2 : 90 05 __ BCC $71d9 ; (scroller_run.s11 + 0)
.s14:
71d4 : a9 01 __ LDA #$01
71d6 : 8d f6 87 STA $87f6 ; (done + 0)
.s11:
71d9 : 20 4d 73 JSR $734d ; (draw_frame.s4 + 0)
71dc : ee f4 87 INC $87f4 ; (wave_phase + 0)
71df : ee f5 87 INC $87f5 ; (plasma_phase + 0)
71e2 : ad 16 d0 LDA $d016 
71e5 : 29 f8 __ AND #$f8
71e7 : 0d f3 87 ORA $87f3 ; (fine_x + 0)
71ea : 8d 16 d0 STA $d016 
71ed : ad f6 87 LDA $87f6 ; (done + 0)
71f0 : d0 03 __ BNE $71f5 ; (scr_done.s4 + 0)
71f2 : 4c 1c 71 JMP $711c ; (scroller_run.l5 + 0)
--------------------------------------------------------------------
scr_done: ; scr_done()->void
; 366, "/home/xahmol/git/UltimateDemo2026/src/scroller.c"
.s4:
71f5 : ad 16 d0 LDA $d016 
71f8 : 29 f8 __ AND #$f8
71fa : 8d 16 d0 STA $d016 
71fd : a9 00 __ LDA #$00
71ff : 85 0d __ STA P0 
7201 : 85 0e __ STA P1 
7203 : 85 10 __ STA P3 
7205 : 20 71 0f JSR $0f71 ; (vic_setmode@proxy + 0)
7208 : a9 20 __ LDA #$20
720a : a2 fa __ LDX #$fa
.l5:
720c : ca __ __ DEX
720d : 9d 00 04 STA $0400,x 
7210 : 9d fa 04 STA $04fa,x 
7213 : 9d f4 05 STA $05f4,x 
7216 : 9d ee 06 STA $06ee,x 
7219 : d0 f1 __ BNE $720c ; (scr_done.l5 + 0)
.s3:
721b : 60 __ __ RTS
--------------------------------------------------------------------
scr_init: ; scr_init()->void
; 346, "/home/xahmol/git/UltimateDemo2026/src/scroller.c"
.s4:
721c : a9 00 __ LDA #$00
721e : 85 0d __ STA P0 
7220 : 85 43 __ STA T0 + 0 
7222 : 85 0e __ STA P1 
7224 : 85 10 __ STA P3 
7226 : a9 04 __ LDA #$04
7228 : 85 44 __ STA T0 + 1 
722a : 85 0f __ STA P2 
722c : a9 10 __ LDA #$10
722e : 85 11 __ STA P4 
7230 : 20 79 0f JSR $0f79 ; (vic_setmode.s4 + 0)
7233 : a9 00 __ LDA #$00
7235 : 8d 21 d0 STA $d021 
7238 : 8d 20 d0 STA $d020 
723b : 85 1f __ STA ADDR + 0 
723d : f0 02 __ BEQ $7241 ; (scr_init.l8 + 0)
.s10:
723f : e6 44 __ INC T0 + 1 
.l8:
7241 : a9 20 __ LDA #$20
7243 : a0 00 __ LDY #$00
7245 : 91 43 __ STA (T0 + 0),y 
7247 : 18 __ __ CLC
7248 : a5 44 __ LDA T0 + 1 
724a : 69 d4 __ ADC #$d4
724c : 85 20 __ STA ADDR + 1 
724e : a9 06 __ LDA #$06
7250 : a4 43 __ LDY T0 + 0 
7252 : 91 1f __ STA (ADDR + 0),y 
7254 : 98 __ __ TYA
7255 : 18 __ __ CLC
7256 : 69 01 __ ADC #$01
7258 : 85 43 __ STA T0 + 0 
725a : b0 e3 __ BCS $723f ; (scr_init.s10 + 0)
.s11:
725c : c9 e8 __ CMP #$e8
725e : d0 e1 __ BNE $7241 ; (scr_init.l8 + 0)
.s7:
7260 : a5 44 __ LDA T0 + 1 
7262 : c9 07 __ CMP #$07
7264 : d0 db __ BNE $7241 ; (scr_init.l8 + 0)
.s5:
7266 : a2 00 __ LDX #$00
.l9:
7268 : a9 34 __ LDA #$34
726a : 9d c8 88 STA $88c8,x ; (scr_letter[0] + 0)
726d : a9 00 __ LDA #$00
726f : 9d c8 89 STA $89c8,x ; (scr_col[0] + 0)
7272 : e8 __ __ INX
7273 : e0 28 __ CPX #$28
7275 : d0 f1 __ BNE $7268 ; (scr_init.l9 + 0)
.s6:
7277 : ad 16 d0 LDA $d016 
727a : 29 f8 __ AND #$f8
727c : 09 07 __ ORA #$07
727e : 8d 16 d0 STA $d016 
.s3:
7281 : 60 __ __ RTS
--------------------------------------------------------------------
letter_idx: ; letter_idx(u8)->u8
; 306, "/home/xahmol/git/UltimateDemo2026/src/scroller.c"
.s4:
7282 : c9 61 __ CMP #$61
7284 : 90 07 __ BCC $728d ; (letter_idx.s5 + 0)
.s61:
7286 : c9 7b __ CMP #$7b
7288 : b0 03 __ BCS $728d ; (letter_idx.s5 + 0)
.s62:
728a : e9 60 __ SBC #$60
.s3:
728c : 60 __ __ RTS
.s5:
728d : c9 41 __ CMP #$41
728f : 90 07 __ BCC $7298 ; (letter_idx.s6 + 0)
.s59:
7291 : c9 5b __ CMP #$5b
7293 : b0 03 __ BCS $7298 ; (letter_idx.s6 + 0)
.s60:
7295 : 69 d9 __ ADC #$d9
7297 : 60 __ __ RTS
.s6:
7298 : c9 30 __ CMP #$30
729a : b0 03 __ BCS $729f ; (letter_idx.s57 + 0)
729c : 4c 43 73 JMP $7343 ; (letter_idx.s7 + 0)
.s57:
729f : c9 3a __ CMP #$3a
72a1 : b0 03 __ BCS $72a6 ; (letter_idx.s8 + 0)
.s58:
72a3 : 69 05 __ ADC #$05
72a5 : 60 __ __ RTS
.s8:
72a6 : c9 2d __ CMP #$2d
72a8 : 90 4e __ BCC $72f8 ; (letter_idx.s33 + 0)
.s9:
72aa : c9 3d __ CMP #$3d
72ac : d0 03 __ BNE $72b1 ; (letter_idx.s10 + 0)
.s32:
72ae : a9 4d __ LDA #$4d
72b0 : 60 __ __ RTS
.s10:
72b1 : 90 24 __ BCC $72d7 ; (letter_idx.s22 + 0)
.s11:
72b3 : c9 40 __ CMP #$40
72b5 : d0 03 __ BNE $72ba ; (letter_idx.s12 + 0)
.s21:
72b7 : a9 54 __ LDA #$54
72b9 : 60 __ __ RTS
.s12:
72ba : 90 11 __ BCC $72cd ; (letter_idx.s18 + 0)
.s13:
72bc : c9 5b __ CMP #$5b
72be : d0 03 __ BNE $72c3 ; (letter_idx.s14 + 0)
.s17:
72c0 : a9 53 __ LDA #$53
72c2 : 60 __ __ RTS
.s14:
72c3 : c9 5d __ CMP #$5d
72c5 : d0 03 __ BNE $72ca ; (letter_idx.s15 + 0)
.s16:
72c7 : a9 55 __ LDA #$55
72c9 : 60 __ __ RTS
.s15:
72ca : a9 34 __ LDA #$34
72cc : 60 __ __ RTS
.s18:
72cd : c9 3e __ CMP #$3e
72cf : d0 03 __ BNE $72d4 ; (letter_idx.s19 + 0)
.s20:
72d1 : a9 52 __ LDA #$52
72d3 : 60 __ __ RTS
.s19:
72d4 : a9 4c __ LDA #$4c
72d6 : 60 __ __ RTS
.s22:
72d7 : c9 3a __ CMP #$3a
72d9 : d0 03 __ BNE $72de ; (letter_idx.s23 + 0)
.s31:
72db : a9 3f __ LDA #$3f
72dd : 60 __ __ RTS
.s23:
72de : 90 0a __ BCC $72ea ; (letter_idx.s27 + 0)
.s24:
72e0 : c9 3b __ CMP #$3b
72e2 : d0 03 __ BNE $72e7 ; (letter_idx.s25 + 0)
.s26:
72e4 : a9 42 __ LDA #$42
72e6 : 60 __ __ RTS
.s25:
72e7 : a9 50 __ LDA #$50
72e9 : 60 __ __ RTS
.s27:
72ea : c9 2e __ CMP #$2e
72ec : d0 03 __ BNE $72f1 ; (letter_idx.s28 + 0)
.s30:
72ee : a9 40 __ LDA #$40
72f0 : 60 __ __ RTS
.s28:
72f1 : c9 2f __ CMP #$2f
72f3 : d0 d5 __ BNE $72ca ; (letter_idx.s15 + 0)
.s29:
72f5 : a9 44 __ LDA #$44
72f7 : 60 __ __ RTS
.s33:
72f8 : c9 26 __ CMP #$26
72fa : d0 03 __ BNE $72ff ; (letter_idx.s34 + 0)
.s55:
72fc : a9 48 __ LDA #$48
72fe : 60 __ __ RTS
.s34:
72ff : 90 21 __ BCC $7322 ; (letter_idx.s45 + 0)
.s35:
7301 : c9 29 __ CMP #$29
7303 : d0 03 __ BNE $7308 ; (letter_idx.s36 + 0)
.s44:
7305 : a9 51 __ LDA #$51
7307 : 60 __ __ RTS
.s36:
7308 : 90 0e __ BCC $7318 ; (letter_idx.s41 + 0)
.s37:
730a : c9 2b __ CMP #$2b
730c : d0 03 __ BNE $7311 ; (letter_idx.s38 + 0)
.s40:
730e : a9 4b __ LDA #$4b
7310 : 60 __ __ RTS
.s38:
7311 : c9 2c __ CMP #$2c
7313 : d0 b5 __ BNE $72ca ; (letter_idx.s15 + 0)
.s39:
7315 : a9 43 __ LDA #$43
7317 : 60 __ __ RTS
.s41:
7318 : c9 27 __ CMP #$27
731a : d0 03 __ BNE $731f ; (letter_idx.s42 + 0)
.s43:
731c : a9 45 __ LDA #$45
731e : 60 __ __ RTS
.s42:
731f : a9 4f __ LDA #$4f
7321 : 60 __ __ RTS
.s45:
7322 : c9 23 __ CMP #$23
7324 : d0 03 __ BNE $7329 ; (letter_idx.s46 + 0)
.s54:
7326 : a9 4e __ LDA #$4e
7328 : 60 __ __ RTS
.s46:
7329 : 90 0a __ BCC $7335 ; (letter_idx.s50 + 0)
.s47:
732b : c9 24 __ CMP #$24
732d : d0 03 __ BNE $7332 ; (letter_idx.s48 + 0)
.s49:
732f : a9 47 __ LDA #$47
7331 : 60 __ __ RTS
.s48:
7332 : a9 49 __ LDA #$49
7334 : 60 __ __ RTS
.s50:
7335 : c9 21 __ CMP #$21
7337 : d0 03 __ BNE $733c ; (letter_idx.s51 + 0)
.s53:
7339 : a9 41 __ LDA #$41
733b : 60 __ __ RTS
.s51:
733c : c9 22 __ CMP #$22
733e : d0 8a __ BNE $72ca ; (letter_idx.s15 + 0)
.s52:
7340 : a9 46 __ LDA #$46
7342 : 60 __ __ RTS
.s7:
7343 : c9 2d __ CMP #$2d
7345 : f0 03 __ BEQ $734a ; (letter_idx.s56 + 0)
7347 : 4c a6 72 JMP $72a6 ; (letter_idx.s8 + 0)
.s56:
734a : a9 4a __ LDA #$4a
734c : 60 __ __ RTS
--------------------------------------------------------------------
draw_frame: ; draw_frame()->void
; 408, "/home/xahmol/git/UltimateDemo2026/src/scroller.c"
.s4:
734d : ad f5 87 LDA $87f5 ; (plasma_phase + 0)
7350 : 85 1d __ STA ACCU + 2 
7352 : 0a __ __ ASL
7353 : 85 1e __ STA ACCU + 3 
7355 : a9 00 __ LDA #$00
7357 : 8d f9 87 STA $87f9 ; (dp_y + 0)
735a : 85 1f __ STA ADDR + 0 
735c : 85 45 __ STA T4 + 0 
.l5:
735e : ad f9 87 LDA $87f9 ; (dp_y + 0)
7361 : 85 49 __ STA T7 + 0 
7363 : 0a __ __ ASL
7364 : 85 1b __ STA ACCU + 0 
7366 : a9 00 __ LDA #$00
7368 : 2a __ __ ROL
7369 : 06 1b __ ASL ACCU + 0 
736b : 2a __ __ ROL
736c : aa __ __ TAX
736d : a5 1b __ LDA ACCU + 0 
736f : 65 49 __ ADC T7 + 0 
7371 : 85 1b __ STA ACCU + 0 
7373 : 8a __ __ TXA
7374 : 69 00 __ ADC #$00
7376 : 06 1b __ ASL ACCU + 0 
7378 : 2a __ __ ROL
7379 : 06 1b __ ASL ACCU + 0 
737b : 2a __ __ ROL
737c : 06 1b __ ASL ACCU + 0 
737e : 2a __ __ ROL
737f : 69 04 __ ADC #$04
7381 : 85 46 __ STA T4 + 1 
7383 : a5 49 __ LDA T7 + 0 
7385 : 0a __ __ ASL
7386 : 0a __ __ ASL
7387 : 0a __ __ ASL
7388 : 18 __ __ CLC
7389 : 65 49 __ ADC T7 + 0 
738b : 18 __ __ CLC
738c : 65 1e __ ADC ACCU + 3 
738e : 29 3f __ AND #$3f
7390 : aa __ __ TAX
7391 : bd 80 86 LDA $8680,x ; (psin[0] + 0)
7394 : 85 43 __ STA T2 + 0 
7396 : a5 1d __ LDA ACCU + 2 
7398 : 85 47 __ STA T5 + 0 
739a : a9 28 __ LDA #$28
739c : 85 4a __ STA T8 + 0 
739e : a4 1b __ LDY ACCU + 0 
.l35:
73a0 : a9 a0 __ LDA #$a0
73a2 : 91 45 __ STA (T4 + 0),y 
73a4 : a5 47 __ LDA T5 + 0 
73a6 : 29 3f __ AND #$3f
73a8 : aa __ __ TAX
73a9 : bd 80 86 LDA $8680,x ; (psin[0] + 0)
73ac : 18 __ __ CLC
73ad : 65 43 __ ADC T2 + 0 
73af : 4a __ __ LSR
73b0 : aa __ __ TAX
73b1 : 18 __ __ CLC
73b2 : a5 46 __ LDA T4 + 1 
73b4 : 69 d4 __ ADC #$d4
73b6 : 85 20 __ STA ADDR + 1 
73b8 : bd c0 86 LDA $86c0,x ; (pcolor[0] + 0)
73bb : 91 1f __ STA (ADDR + 0),y 
73bd : 18 __ __ CLC
73be : a5 47 __ LDA T5 + 0 
73c0 : 69 05 __ ADC #$05
73c2 : 85 47 __ STA T5 + 0 
73c4 : c8 __ __ INY
73c5 : d0 02 __ BNE $73c9 ; (draw_frame.s40 + 0)
.s39:
73c7 : e6 46 __ INC T4 + 1 
.s40:
73c9 : c6 4a __ DEC T8 + 0 
73cb : d0 d3 __ BNE $73a0 ; (draw_frame.l35 + 0)
.s36:
73cd : a6 49 __ LDX T7 + 0 
73cf : e8 __ __ INX
73d0 : 8e f9 87 STX $87f9 ; (dp_y + 0)
73d3 : e0 19 __ CPX #$19
73d5 : 90 87 __ BCC $735e ; (draw_frame.l5 + 0)
.s6:
73d7 : a9 00 __ LDA #$00
73d9 : 8d fa 87 STA $87fa ; (df_x + 0)
.l7:
73dc : ae fa 87 LDX $87fa ; (df_x + 0)
73df : 86 49 __ STX T7 + 0 
73e1 : 86 1d __ STX ACCU + 2 
73e3 : bd c8 89 LDA $89c8,x ; (scr_col[0] + 0)
73e6 : 85 45 __ STA T4 + 0 
73e8 : d0 0f __ BNE $73f9 ; (draw_frame.s9 + 0)
.s8:
73ea : ad f4 87 LDA $87f4 ; (wave_phase + 0)
73ed : 18 __ __ CLC
73ee : 65 1d __ ADC ACCU + 2 
73f0 : 29 3f __ AND #$3f
73f2 : aa __ __ TAX
73f3 : bd 00 87 LDA $8700,x ; (sin_row[0] + 0)
73f6 : 8d fb 87 STA $87fb ; (df_yoff + 0)
.s9:
73f9 : ad fb 87 LDA $87fb ; (df_yoff + 0)
73fc : 18 __ __ CLC
73fd : 69 0a __ ADC #$0a
73ff : 85 1e __ STA ACCU + 3 
7401 : 0a __ __ ASL
7402 : 85 1b __ STA ACCU + 0 
7404 : a9 00 __ LDA #$00
7406 : 2a __ __ ROL
7407 : 06 1b __ ASL ACCU + 0 
7409 : 2a __ __ ROL
740a : aa __ __ TAX
740b : a5 1b __ LDA ACCU + 0 
740d : 65 1e __ ADC ACCU + 3 
740f : 85 43 __ STA T2 + 0 
7411 : 8a __ __ TXA
7412 : 69 00 __ ADC #$00
7414 : 06 43 __ ASL T2 + 0 
7416 : 2a __ __ ROL
7417 : 06 43 __ ASL T2 + 0 
7419 : 2a __ __ ROL
741a : 06 43 __ ASL T2 + 0 
741c : 2a __ __ ROL
741d : 85 44 __ STA T2 + 1 
741f : a5 43 __ LDA T2 + 0 
7421 : 69 b0 __ ADC #$b0
7423 : a8 __ __ TAY
7424 : a5 44 __ LDA T2 + 1 
7426 : 69 03 __ ADC #$03
7428 : aa __ __ TAX
7429 : 98 __ __ TYA
742a : 18 __ __ CLC
742b : 65 1d __ ADC ACCU + 2 
742d : 85 1b __ STA ACCU + 0 
742f : 85 1f __ STA ADDR + 0 
7431 : 8a __ __ TXA
7432 : 69 00 __ ADC #$00
7434 : 85 1c __ STA ACCU + 1 
7436 : 18 __ __ CLC
7437 : 69 d4 __ ADC #$d4
7439 : 85 20 __ STA ADDR + 1 
743b : a9 63 __ LDA #$63
743d : a0 00 __ LDY #$00
743f : 91 1b __ STA (ACCU + 0),y 
7441 : a9 0b __ LDA #$0b
7443 : 91 1f __ STA (ADDR + 0),y 
7445 : 38 __ __ SEC
7446 : a5 1e __ LDA ACCU + 3 
7448 : e9 01 __ SBC #$01
744a : aa __ __ TAX
744b : b0 01 __ BCS $744e ; (draw_frame.s48 + 0)
.s47:
744d : 88 __ __ DEY
.s48:
744e : 0a __ __ ASL
744f : 85 1b __ STA ACCU + 0 
7451 : 98 __ __ TYA
7452 : 2a __ __ ROL
7453 : 06 1b __ ASL ACCU + 0 
7455 : 2a __ __ ROL
7456 : 85 1c __ STA ACCU + 1 
7458 : 8a __ __ TXA
7459 : 18 __ __ CLC
745a : 65 1b __ ADC ACCU + 0 
745c : 85 1b __ STA ACCU + 0 
745e : 98 __ __ TYA
745f : 65 1c __ ADC ACCU + 1 
7461 : 06 1b __ ASL ACCU + 0 
7463 : 2a __ __ ROL
7464 : 06 1b __ ASL ACCU + 0 
7466 : 2a __ __ ROL
7467 : 06 1b __ ASL ACCU + 0 
7469 : 2a __ __ ROL
746a : aa __ __ TAX
746b : 18 __ __ CLC
746c : a5 1b __ LDA ACCU + 0 
746e : 65 1d __ ADC ACCU + 2 
7470 : a8 __ __ TAY
7471 : 8a __ __ TXA
7472 : 69 04 __ ADC #$04
7474 : 85 1c __ STA ACCU + 1 
7476 : a9 00 __ LDA #$00
7478 : 85 1f __ STA ADDR + 0 
747a : 85 1b __ STA ACCU + 0 
747c : a2 07 __ LDX #$07
747e : 18 __ __ CLC
.l37:
747f : a9 20 __ LDA #$20
7481 : 91 1b __ STA (ACCU + 0),y 
7483 : a5 1c __ LDA ACCU + 1 
7485 : 69 d4 __ ADC #$d4
7487 : 85 20 __ STA ADDR + 1 
7489 : a9 00 __ LDA #$00
748b : 91 1f __ STA (ADDR + 0),y 
748d : 98 __ __ TYA
748e : 18 __ __ CLC
748f : 69 28 __ ADC #$28
7491 : a8 __ __ TAY
7492 : 90 03 __ BCC $7497 ; (draw_frame.s42 + 0)
.s41:
7494 : e6 1c __ INC ACCU + 1 
7496 : 18 __ __ CLC
.s42:
7497 : ca __ __ DEX
7498 : d0 e5 __ BNE $747f ; (draw_frame.l37 + 0)
.s38:
749a : a9 07 __ LDA #$07
749c : 8d fc 87 STA $87fc ; (df_r + 0)
749f : 18 __ __ CLC
74a0 : a5 43 __ LDA T2 + 0 
74a2 : 69 f0 __ ADC #$f0
74a4 : a4 44 __ LDY T2 + 1 
74a6 : 90 02 __ BCC $74aa ; (draw_frame.s44 + 0)
.s43:
74a8 : c8 __ __ INY
74a9 : 18 __ __ CLC
.s44:
74aa : 65 1d __ ADC ACCU + 2 
74ac : 85 43 __ STA T2 + 0 
74ae : 98 __ __ TYA
74af : 69 04 __ ADC #$04
74b1 : 85 44 __ STA T2 + 1 
74b3 : a9 64 __ LDA #$64
74b5 : a0 00 __ LDY #$00
74b7 : 91 43 __ STA (T2 + 0),y 
74b9 : 18 __ __ CLC
74ba : a5 44 __ LDA T2 + 1 
74bc : 69 d4 __ ADC #$d4
74be : 85 44 __ STA T2 + 1 
74c0 : a9 0b __ LDA #$0b
74c2 : 91 43 __ STA (T2 + 0),y 
74c4 : a4 1d __ LDY ACCU + 2 
74c6 : b9 c8 88 LDA $88c8,y ; (scr_letter[0] + 0)
74c9 : c9 34 __ CMP #$34
74cb : d0 0e __ BNE $74db ; (draw_frame.s11 + 0)
.s10:
74cd : a6 49 __ LDX T7 + 0 
74cf : e8 __ __ INX
74d0 : 8e fa 87 STX $87fa ; (df_x + 0)
74d3 : e0 28 __ CPX #$28
74d5 : b0 03 __ BCS $74da ; (draw_frame.s3 + 0)
74d7 : 4c dc 73 JMP $73dc ; (draw_frame.l7 + 0)
.s3:
74da : 60 __ __ RTS
.s11:
74db : 8e fc 87 STX $87fc ; (df_r + 0)
74de : 85 4a __ STA T8 + 0 
74e0 : c9 0d __ CMP #$0d
74e2 : 8a __ __ TXA
74e3 : 6a __ __ ROR
74e4 : 85 4b __ STA T9 + 0 
74e6 : a5 45 __ LDA T4 + 0 
74e8 : 85 43 __ STA T2 + 0 
.l12:
74ea : ad fc 87 LDA $87fc ; (df_r + 0)
74ed : 85 4c __ STA T10 + 0 
74ef : a8 __ __ TAY
74f0 : 18 __ __ CLC
74f1 : 65 1e __ ADC ACCU + 3 
74f3 : aa __ __ TAX
74f4 : a9 00 __ LDA #$00
74f6 : 2a __ __ ROL
74f7 : 85 48 __ STA T5 + 1 
74f9 : 8a __ __ TXA
74fa : 0a __ __ ASL
74fb : 85 1b __ STA ACCU + 0 
74fd : a5 48 __ LDA T5 + 1 
74ff : 2a __ __ ROL
7500 : 06 1b __ ASL ACCU + 0 
7502 : 2a __ __ ROL
7503 : 85 1c __ STA ACCU + 1 
7505 : 8a __ __ TXA
7506 : 18 __ __ CLC
7507 : 65 1b __ ADC ACCU + 0 
7509 : 85 47 __ STA T5 + 0 
750b : a5 1c __ LDA ACCU + 1 
750d : 65 48 __ ADC T5 + 1 
750f : 06 47 __ ASL T5 + 0 
7511 : 2a __ __ ROL
7512 : 06 47 __ ASL T5 + 0 
7514 : 2a __ __ ROL
7515 : 06 47 __ ASL T5 + 0 
7517 : 2a __ __ ROL
7518 : aa __ __ TAX
7519 : 18 __ __ CLC
751a : a5 47 __ LDA T5 + 0 
751c : 65 1d __ ADC ACCU + 2 
751e : 85 47 __ STA T5 + 0 
7520 : 90 02 __ BCC $7524 ; (draw_frame.s46 + 0)
.s45:
7522 : e8 __ __ INX
7523 : 18 __ __ CLC
.s46:
7524 : b9 ce 7b LDA $7bce,y ; (__multab40L + 0)
7527 : a4 4a __ LDY T8 + 0 
7529 : 79 40 87 ADC $8740,y ; (letter_start[0] + 0)
752c : 18 __ __ CLC
752d : 65 43 __ ADC T2 + 0 
752f : 85 45 __ STA T4 + 0 
7531 : 24 4b __ BIT T9 + 0 
7533 : 30 0a __ BMI $753f ; (draw_frame.s13 + 0)
.s34:
7535 : 18 __ __ CLC
7536 : 69 00 __ ADC #$00
7538 : 85 1b __ STA ACCU + 0 
753a : a9 88 __ LDA #$88
753c : 4c 85 75 JMP $7585 ; (draw_frame.s18 + 0)
.s13:
753f : 98 __ __ TYA
7540 : c0 1a __ CPY #$1a
7542 : b0 0b __ BCS $754f ; (draw_frame.s14 + 0)
.s33:
7544 : a9 00 __ LDA #$00
7546 : 65 45 __ ADC T4 + 0 
7548 : 85 1b __ STA ACCU + 0 
754a : a9 89 __ LDA #$89
754c : 4c 85 75 JMP $7585 ; (draw_frame.s18 + 0)
.s14:
754f : c9 28 __ CMP #$28
7551 : b0 0b __ BCS $755e ; (draw_frame.s15 + 0)
.s32:
7553 : a9 00 __ LDA #$00
7555 : 65 45 __ ADC T4 + 0 
7557 : 85 1b __ STA ACCU + 0 
7559 : a9 8a __ LDA #$8a
755b : 4c 85 75 JMP $7585 ; (draw_frame.s18 + 0)
.s15:
755e : c9 34 __ CMP #$34
7560 : b0 0b __ BCS $756d ; (draw_frame.s16 + 0)
.s31:
7562 : a9 00 __ LDA #$00
7564 : 65 45 __ ADC T4 + 0 
7566 : 85 1b __ STA ACCU + 0 
7568 : a9 8b __ LDA #$8b
756a : 4c 85 75 JMP $7585 ; (draw_frame.s18 + 0)
.s16:
756d : c9 47 __ CMP #$47
756f : 90 0c __ BCC $757d ; (draw_frame.s30 + 0)
.s17:
7571 : 18 __ __ CLC
7572 : a9 00 __ LDA #$00
7574 : 65 45 __ ADC T4 + 0 
7576 : 85 1b __ STA ACCU + 0 
7578 : a9 8d __ LDA #$8d
757a : 4c 85 75 JMP $7585 ; (draw_frame.s18 + 0)
.s30:
757d : a9 00 __ LDA #$00
757f : 65 45 __ ADC T4 + 0 
7581 : 85 1b __ STA ACCU + 0 
7583 : a9 8c __ LDA #$8c
.s18:
7585 : 69 00 __ ADC #$00
7587 : 85 1c __ STA ACCU + 1 
7589 : 8a __ __ TXA
758a : 18 __ __ CLC
758b : 69 04 __ ADC #$04
758d : 85 48 __ STA T5 + 1 
758f : a0 00 __ LDY #$00
7591 : b1 1b __ LDA (ACCU + 0),y 
7593 : 91 47 __ STA (T5 + 0),y 
7595 : 24 4b __ BIT T9 + 0 
7597 : 30 0c __ BMI $75a5 ; (draw_frame.s19 + 0)
.s29:
7599 : 18 __ __ CLC
759a : a9 00 __ LDA #$00
759c : 65 45 __ ADC T4 + 0 
759e : 85 45 __ STA T4 + 0 
75a0 : a9 8e __ LDA #$8e
75a2 : 4c ec 75 JMP $75ec ; (draw_frame.s24 + 0)
.s19:
75a5 : a5 4a __ LDA T8 + 0 
75a7 : c9 1a __ CMP #$1a
75a9 : b0 0b __ BCS $75b6 ; (draw_frame.s20 + 0)
.s28:
75ab : a9 00 __ LDA #$00
75ad : 65 45 __ ADC T4 + 0 
75af : 85 45 __ STA T4 + 0 
75b1 : a9 8f __ LDA #$8f
75b3 : 4c ec 75 JMP $75ec ; (draw_frame.s24 + 0)
.s20:
75b6 : c9 28 __ CMP #$28
75b8 : b0 0b __ BCS $75c5 ; (draw_frame.s21 + 0)
.s27:
75ba : a9 00 __ LDA #$00
75bc : 65 45 __ ADC T4 + 0 
75be : 85 45 __ STA T4 + 0 
75c0 : a9 90 __ LDA #$90
75c2 : 4c ec 75 JMP $75ec ; (draw_frame.s24 + 0)
.s21:
75c5 : c9 34 __ CMP #$34
75c7 : b0 0b __ BCS $75d4 ; (draw_frame.s22 + 0)
.s26:
75c9 : a9 00 __ LDA #$00
75cb : 65 45 __ ADC T4 + 0 
75cd : 85 45 __ STA T4 + 0 
75cf : a9 91 __ LDA #$91
75d1 : 4c ec 75 JMP $75ec ; (draw_frame.s24 + 0)
.s22:
75d4 : c9 47 __ CMP #$47
75d6 : 90 0c __ BCC $75e4 ; (draw_frame.s25 + 0)
.s23:
75d8 : 18 __ __ CLC
75d9 : a9 00 __ LDA #$00
75db : 65 45 __ ADC T4 + 0 
75dd : 85 45 __ STA T4 + 0 
75df : a9 93 __ LDA #$93
75e1 : 4c ec 75 JMP $75ec ; (draw_frame.s24 + 0)
.s25:
75e4 : a9 00 __ LDA #$00
75e6 : 65 45 __ ADC T4 + 0 
75e8 : 85 45 __ STA T4 + 0 
75ea : a9 92 __ LDA #$92
.s24:
75ec : 69 00 __ ADC #$00
75ee : 85 46 __ STA T4 + 1 
75f0 : 18 __ __ CLC
75f1 : a5 48 __ LDA T5 + 1 
75f3 : 69 d4 __ ADC #$d4
75f5 : 85 48 __ STA T5 + 1 
75f7 : b1 45 __ LDA (T4 + 0),y 
75f9 : 91 47 __ STA (T5 + 0),y 
75fb : a6 4c __ LDX T10 + 0 
75fd : e8 __ __ INX
75fe : 8e fc 87 STX $87fc ; (df_r + 0)
7601 : e0 05 __ CPX #$05
7603 : b0 03 __ BCS $7608 ; (draw_frame.s24 + 28)
7605 : 4c ea 74 JMP $74ea ; (draw_frame.l12 + 0)
7608 : 4c cd 74 JMP $74cd ; (draw_frame.s10 + 0)
--------------------------------------------------------------------
modplay_stop: ; modplay_stop()->void
; 249, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s4:
760b : 78 __ __ SEI
760c : a9 00 __ LDA #$00
760e : 8d 4c 9c STA $9c4c ; (modplay.active + 0)
7611 : 8d 20 df STA $df20 
7614 : 8d 40 df STA $df40 
7617 : 8d 60 df STA $df60 
761a : 8d 80 df STA $df80 
761d : ad fe 7f LDA $7ffe ; (mod_saved_irq[0] + 0)
7620 : 8d 14 03 STA $0314 
7623 : ad ff 7f LDA $7fff ; (mod_saved_irq[0] + 1)
7626 : 8d 15 03 STA $0315 
7629 : a9 7f __ LDA #$7f
762b : 8d 0d dc STA $dc0d 
762e : a9 25 __ LDA #$25
7630 : 8d 04 dc STA $dc04 
7633 : a9 4d __ LDA #$4d
7635 : 8d 05 dc STA $dc05 
7638 : a9 81 __ LDA #$81
763a : 8d 0d dc STA $dc0d 
763d : a9 01 __ LDA #$01
763f : 8d 0e dc STA $dc0e 
7642 : 58 __ __ CLI
.s3:
7643 : 60 __ __ RTS
--------------------------------------------------------------------
7644 : __ __ __ BYT 65 4e 44 20 4f 46 20 64 45 4d 4f 20 73 45 51 55 : eND OF dEMO sEQU
7654 : __ __ __ BYT 45 4e 43 45 00                                  : ENCE.
--------------------------------------------------------------------
7659 : __ __ __ BYT 64 45 4d 4f 20 53 45 51 55 45 4e 43 45 20 43 4f : dEMO SEQUENCE CO
7669 : __ __ __ BYT 4d 50 4c 45 54 45 2e 00                         : MPLETE..
--------------------------------------------------------------------
7671 : __ __ __ BYT 67 45 41 52 20 00                               : gEAR .
--------------------------------------------------------------------
7677 : __ __ __ BYT 31 20 54 4f 20 36 34 20 6d 68 5a 2c 20 31 36 20 : 1 TO 64 mhZ, 16 
7687 : __ __ __ BYT 53 54 45 50 53 00                               : STEPS.
--------------------------------------------------------------------
768d : __ __ __ BYT 62 41 4c 4c 20 00                               : bALL .
--------------------------------------------------------------------
7693 : __ __ __ BYT 33 64 20 42 41 4c 4c 20 2b 20 47 52 49 44 00    : 3d BALL + GRID.
--------------------------------------------------------------------
76a2 : __ __ __ BYT 76 45 43 54 20 00                               : vECT .
--------------------------------------------------------------------
76a8 : __ __ __ BYT 33 64 20 57 49 52 45 46 52 41 4d 45 20 43 55 42 : 3d WIREFRAME CUB
76b8 : __ __ __ BYT 45 00                                           : E.
--------------------------------------------------------------------
76ba : __ __ __ BYT 70 4c 41 53 20 00                               : pLAS .
--------------------------------------------------------------------
76c0 : __ __ __ BYT 70 4c 41 53 4d 41 20 49 4e 54 45 52 46 45 52 45 : pLASMA INTERFERE
76d0 : __ __ __ BYT 4e 43 45 00                                     : NCE.
--------------------------------------------------------------------
76d4 : __ __ __ BYT 66 52 41 43 54 00                               : fRACT.
--------------------------------------------------------------------
76da : __ __ __ BYT 6d 41 4e 44 45 4c 42 52 4f 54 20 6d 63 20 46 52 : mANDELBROT mc FR
76ea : __ __ __ BYT 41 43 54 41 4c 00                               : ACTAL.
--------------------------------------------------------------------
76f0 : __ __ __ BYT 74 55 4e 4c 20 00                               : tUNL .
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
76f6 : a9 7f __ LDA #$7f
76f8 : 85 03 __ STA WORK + 0 
76fa : 4c 12 78 JMP $7812 ; (divs16 + 0)
--------------------------------------------------------------------
uii_target:
76fd : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
_uii_root:
76fe : __ __ __ BYT 2f 00                                           : /.
--------------------------------------------------------------------
7700 : __ __ __ BYT 33 64 20 54 45 58 54 55 52 45 20 54 55 4e 4e 45 : 3d TEXTURE TUNNE
7710 : __ __ __ BYT 4c 00                                           : L.
--------------------------------------------------------------------
7712 : __ __ __ BYT 34 45 56 2e 4d 4f 44 3a 20 46 4f 52 45 56 45 52 : 4EV.MOD: FOREVER
7722 : __ __ __ BYT 20 59 4f 55 4e 47 00                            :  YOUNG.
--------------------------------------------------------------------
7729 : __ __ __ BYT 75 4c 54 49 4d 41 54 45 20 36 34 20 41 54 20 36 : uLTIMATE 64 AT 6
7739 : __ __ __ BYT 34 20 6d 68 5a 20 54 55 52 42 4f 3a 00          : 4 mhZ TURBO:.
--------------------------------------------------------------------
7746 : __ __ __ BYT 54 48 45 20 46 41 53 54 45 53 54 20 63 36 34 20 : THE FASTEST c64 
7756 : __ __ __ BYT 43 4f 4d 50 41 54 49 42 4c 45 2e 00             : COMPATIBLE..
--------------------------------------------------------------------
mul16by8: ; mul16by8
7762 : 4a __ __ LSR
7763 : f0 2e __ BEQ $7793 ; (mul16by8 + 49)
7765 : a2 00 __ LDX #$00
7767 : a0 00 __ LDY #$00
7769 : 90 13 __ BCC $777e ; (mul16by8 + 28)
776b : a4 1b __ LDY ACCU + 0 
776d : a6 1c __ LDX ACCU + 1 
776f : b0 0d __ BCS $777e ; (mul16by8 + 28)
7771 : 85 02 __ STA $02 
7773 : 18 __ __ CLC
7774 : 98 __ __ TYA
7775 : 65 1b __ ADC ACCU + 0 
7777 : a8 __ __ TAY
7778 : 8a __ __ TXA
7779 : 65 1c __ ADC ACCU + 1 
777b : aa __ __ TAX
777c : a5 02 __ LDA $02 
777e : 06 1b __ ASL ACCU + 0 
7780 : 26 1c __ ROL ACCU + 1 
7782 : 4a __ __ LSR
7783 : 90 f9 __ BCC $777e ; (mul16by8 + 28)
7785 : d0 ea __ BNE $7771 ; (mul16by8 + 15)
7787 : 18 __ __ CLC
7788 : 98 __ __ TYA
7789 : 65 1b __ ADC ACCU + 0 
778b : 85 1b __ STA ACCU + 0 
778d : 8a __ __ TXA
778e : 65 1c __ ADC ACCU + 1 
7790 : 85 1c __ STA ACCU + 1 
7792 : 60 __ __ RTS
7793 : b0 04 __ BCS $7799 ; (mul16by8 + 55)
7795 : 85 1b __ STA ACCU + 0 
7797 : 85 1c __ STA ACCU + 1 
7799 : 60 __ __ RTS
--------------------------------------------------------------------
mul32by8: ; mul32by8
779a : a0 00 __ LDY #$00
779c : 84 07 __ STY WORK + 4 
779e : 84 08 __ STY WORK + 5 
77a0 : 84 09 __ STY WORK + 6 
77a2 : 4a __ __ LSR
77a3 : b0 0d __ BCS $77b2 ; (mul32by8 + 24)
77a5 : f0 26 __ BEQ $77cd ; (mul32by8 + 51)
77a7 : 06 1b __ ASL ACCU + 0 
77a9 : 26 1c __ ROL ACCU + 1 
77ab : 26 1d __ ROL ACCU + 2 
77ad : 26 1e __ ROL ACCU + 3 
77af : 4a __ __ LSR
77b0 : 90 f5 __ BCC $77a7 ; (mul32by8 + 13)
77b2 : aa __ __ TAX
77b3 : 18 __ __ CLC
77b4 : a5 07 __ LDA WORK + 4 
77b6 : 65 1b __ ADC ACCU + 0 
77b8 : 85 07 __ STA WORK + 4 
77ba : a5 08 __ LDA WORK + 5 
77bc : 65 1c __ ADC ACCU + 1 
77be : 85 08 __ STA WORK + 5 
77c0 : a5 09 __ LDA WORK + 6 
77c2 : 65 1d __ ADC ACCU + 2 
77c4 : 85 09 __ STA WORK + 6 
77c6 : 98 __ __ TYA
77c7 : 65 1e __ ADC ACCU + 3 
77c9 : a8 __ __ TAY
77ca : 8a __ __ TXA
77cb : d0 da __ BNE $77a7 ; (mul32by8 + 13)
77cd : 84 0a __ STY WORK + 7 
77cf : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
77d0 : a0 00 __ LDY #$00
77d2 : 84 06 __ STY WORK + 3 
77d4 : a5 03 __ LDA WORK + 0 
77d6 : a6 04 __ LDX WORK + 1 
77d8 : f0 1c __ BEQ $77f6 ; (mul16 + 38)
77da : 38 __ __ SEC
77db : 6a __ __ ROR
77dc : 90 0d __ BCC $77eb ; (mul16 + 27)
77de : aa __ __ TAX
77df : 18 __ __ CLC
77e0 : 98 __ __ TYA
77e1 : 65 1b __ ADC ACCU + 0 
77e3 : a8 __ __ TAY
77e4 : a5 06 __ LDA WORK + 3 
77e6 : 65 1c __ ADC ACCU + 1 
77e8 : 85 06 __ STA WORK + 3 
77ea : 8a __ __ TXA
77eb : 06 1b __ ASL ACCU + 0 
77ed : 26 1c __ ROL ACCU + 1 
77ef : 4a __ __ LSR
77f0 : 90 f9 __ BCC $77eb ; (mul16 + 27)
77f2 : d0 ea __ BNE $77de ; (mul16 + 14)
77f4 : a5 04 __ LDA WORK + 1 
77f6 : 4a __ __ LSR
77f7 : 90 0d __ BCC $7806 ; (mul16 + 54)
77f9 : aa __ __ TAX
77fa : 18 __ __ CLC
77fb : 98 __ __ TYA
77fc : 65 1b __ ADC ACCU + 0 
77fe : a8 __ __ TAY
77ff : a5 06 __ LDA WORK + 3 
7801 : 65 1c __ ADC ACCU + 1 
7803 : 85 06 __ STA WORK + 3 
7805 : 8a __ __ TXA
7806 : 06 1b __ ASL ACCU + 0 
7808 : 26 1c __ ROL ACCU + 1 
780a : 4a __ __ LSR
780b : b0 ec __ BCS $77f9 ; (mul16 + 41)
780d : d0 f7 __ BNE $7806 ; (mul16 + 54)
780f : 84 05 __ STY WORK + 2 
7811 : 60 __ __ RTS
--------------------------------------------------------------------
divs16: ; divs16
7812 : 24 1c __ BIT ACCU + 1 
7814 : 10 0d __ BPL $7823 ; (divs16 + 17)
7816 : 20 2d 78 JSR $782d ; (negaccu + 0)
7819 : 24 04 __ BIT WORK + 1 
781b : 10 0d __ BPL $782a ; (divs16 + 24)
781d : 20 3b 78 JSR $783b ; (negtmp + 0)
7820 : 4c 4d 78 JMP $784d ; (divmod + 0)
7823 : 24 04 __ BIT WORK + 1 
7825 : 10 f9 __ BPL $7820 ; (divs16 + 14)
7827 : 20 3b 78 JSR $783b ; (negtmp + 0)
782a : 20 4d 78 JSR $784d ; (divmod + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
782d : 38 __ __ SEC
782e : a9 00 __ LDA #$00
7830 : e5 1b __ SBC ACCU + 0 
7832 : 85 1b __ STA ACCU + 0 
7834 : a9 00 __ LDA #$00
7836 : e5 1c __ SBC ACCU + 1 
7838 : 85 1c __ STA ACCU + 1 
783a : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
783b : 38 __ __ SEC
783c : a9 00 __ LDA #$00
783e : e5 03 __ SBC WORK + 0 
7840 : 85 03 __ STA WORK + 0 
7842 : a9 00 __ LDA #$00
7844 : e5 04 __ SBC WORK + 1 
7846 : 85 04 __ STA WORK + 1 
7848 : 60 __ __ RTS
--------------------------------------------------------------------
divmod@proxy: ; divmod@proxy
7849 : a9 00 __ LDA #$00
784b : 85 04 __ STA WORK + 1 
--------------------------------------------------------------------
divmod: ; divmod
784d : a5 1c __ LDA ACCU + 1 
784f : d0 31 __ BNE $7882 ; (divmod + 53)
7851 : a5 04 __ LDA WORK + 1 
7853 : d0 1e __ BNE $7873 ; (divmod + 38)
7855 : 85 06 __ STA WORK + 3 
7857 : a2 04 __ LDX #$04
7859 : 06 1b __ ASL ACCU + 0 
785b : 2a __ __ ROL
785c : c5 03 __ CMP WORK + 0 
785e : 90 02 __ BCC $7862 ; (divmod + 21)
7860 : e5 03 __ SBC WORK + 0 
7862 : 26 1b __ ROL ACCU + 0 
7864 : 2a __ __ ROL
7865 : c5 03 __ CMP WORK + 0 
7867 : 90 02 __ BCC $786b ; (divmod + 30)
7869 : e5 03 __ SBC WORK + 0 
786b : 26 1b __ ROL ACCU + 0 
786d : ca __ __ DEX
786e : d0 eb __ BNE $785b ; (divmod + 14)
7870 : 85 05 __ STA WORK + 2 
7872 : 60 __ __ RTS
7873 : a5 1b __ LDA ACCU + 0 
7875 : 85 05 __ STA WORK + 2 
7877 : a5 1c __ LDA ACCU + 1 
7879 : 85 06 __ STA WORK + 3 
787b : a9 00 __ LDA #$00
787d : 85 1b __ STA ACCU + 0 
787f : 85 1c __ STA ACCU + 1 
7881 : 60 __ __ RTS
7882 : a5 04 __ LDA WORK + 1 
7884 : d0 1f __ BNE $78a5 ; (divmod + 88)
7886 : a5 03 __ LDA WORK + 0 
7888 : 30 1b __ BMI $78a5 ; (divmod + 88)
788a : a9 00 __ LDA #$00
788c : 85 06 __ STA WORK + 3 
788e : a2 10 __ LDX #$10
7890 : 06 1b __ ASL ACCU + 0 
7892 : 26 1c __ ROL ACCU + 1 
7894 : 2a __ __ ROL
7895 : c5 03 __ CMP WORK + 0 
7897 : 90 02 __ BCC $789b ; (divmod + 78)
7899 : e5 03 __ SBC WORK + 0 
789b : 26 1b __ ROL ACCU + 0 
789d : 26 1c __ ROL ACCU + 1 
789f : ca __ __ DEX
78a0 : d0 f2 __ BNE $7894 ; (divmod + 71)
78a2 : 85 05 __ STA WORK + 2 
78a4 : 60 __ __ RTS
78a5 : a9 00 __ LDA #$00
78a7 : 85 05 __ STA WORK + 2 
78a9 : 85 06 __ STA WORK + 3 
78ab : 84 02 __ STY $02 
78ad : a0 10 __ LDY #$10
78af : 18 __ __ CLC
78b0 : 26 1b __ ROL ACCU + 0 
78b2 : 26 1c __ ROL ACCU + 1 
78b4 : 26 05 __ ROL WORK + 2 
78b6 : 26 06 __ ROL WORK + 3 
78b8 : 38 __ __ SEC
78b9 : a5 05 __ LDA WORK + 2 
78bb : e5 03 __ SBC WORK + 0 
78bd : aa __ __ TAX
78be : a5 06 __ LDA WORK + 3 
78c0 : e5 04 __ SBC WORK + 1 
78c2 : 90 04 __ BCC $78c8 ; (divmod + 123)
78c4 : 86 05 __ STX WORK + 2 
78c6 : 85 06 __ STA WORK + 3 
78c8 : 88 __ __ DEY
78c9 : d0 e5 __ BNE $78b0 ; (divmod + 99)
78cb : 26 1b __ ROL ACCU + 0 
78cd : 26 1c __ ROL ACCU + 1 
78cf : a4 02 __ LDY $02 
78d1 : 60 __ __ RTS
--------------------------------------------------------------------
mul32: ; mul32
78d2 : a5 04 __ LDA WORK + 1 
78d4 : 05 05 __ ORA WORK + 2 
78d6 : 05 06 __ ORA WORK + 3 
78d8 : d0 05 __ BNE $78df ; (mul32 + 13)
78da : a5 03 __ LDA WORK + 0 
78dc : 4c 9a 77 JMP $779a ; (mul32by8 + 0)
78df : a0 00 __ LDY #$00
78e1 : 84 07 __ STY WORK + 4 
78e3 : 84 08 __ STY WORK + 5 
78e5 : 98 __ __ TYA
78e6 : 38 __ __ SEC
78e7 : 66 03 __ ROR WORK + 0 
78e9 : 90 15 __ BCC $7900 ; (mul32 + 46)
78eb : aa __ __ TAX
78ec : 18 __ __ CLC
78ed : a5 07 __ LDA WORK + 4 
78ef : 65 1b __ ADC ACCU + 0 
78f1 : 85 07 __ STA WORK + 4 
78f3 : a5 08 __ LDA WORK + 5 
78f5 : 65 1c __ ADC ACCU + 1 
78f7 : 85 08 __ STA WORK + 5 
78f9 : 98 __ __ TYA
78fa : 65 1d __ ADC ACCU + 2 
78fc : a8 __ __ TAY
78fd : 8a __ __ TXA
78fe : 65 1e __ ADC ACCU + 3 
7900 : 46 04 __ LSR WORK + 1 
7902 : 90 0f __ BCC $7913 ; (mul32 + 65)
7904 : aa __ __ TAX
7905 : 18 __ __ CLC
7906 : a5 08 __ LDA WORK + 5 
7908 : 65 1b __ ADC ACCU + 0 
790a : 85 08 __ STA WORK + 5 
790c : 98 __ __ TYA
790d : 65 1c __ ADC ACCU + 1 
790f : a8 __ __ TAY
7910 : 8a __ __ TXA
7911 : 65 1d __ ADC ACCU + 2 
7913 : 46 05 __ LSR WORK + 2 
7915 : 90 09 __ BCC $7920 ; (mul32 + 78)
7917 : aa __ __ TAX
7918 : 18 __ __ CLC
7919 : 98 __ __ TYA
791a : 65 1b __ ADC ACCU + 0 
791c : a8 __ __ TAY
791d : 8a __ __ TXA
791e : 65 1c __ ADC ACCU + 1 
7920 : 46 06 __ LSR WORK + 3 
7922 : 90 03 __ BCC $7927 ; (mul32 + 85)
7924 : 18 __ __ CLC
7925 : 65 1b __ ADC ACCU + 0 
7927 : 06 1b __ ASL ACCU + 0 
7929 : 26 1c __ ROL ACCU + 1 
792b : 26 1d __ ROL ACCU + 2 
792d : 26 1e __ ROL ACCU + 3 
792f : 46 03 __ LSR WORK + 0 
7931 : 90 cd __ BCC $7900 ; (mul32 + 46)
7933 : d0 b6 __ BNE $78eb ; (mul32 + 25)
7935 : 84 09 __ STY WORK + 6 
7937 : 85 0a __ STA WORK + 7 
7939 : 60 __ __ RTS
--------------------------------------------------------------------
divs32: ; divs32
793a : 24 1e __ BIT ACCU + 3 
793c : 10 0d __ BPL $794b ; (divs32 + 17)
793e : 20 55 79 JSR $7955 ; (negaccu32 + 0)
7941 : 24 06 __ BIT WORK + 3 
7943 : 10 0d __ BPL $7952 ; (divs32 + 24)
7945 : 20 6f 79 JSR $796f ; (negtmp32 + 0)
7948 : 4c 31 42 JMP $4231 ; (divmod32 + 0)
794b : 24 06 __ BIT WORK + 3 
794d : 10 f9 __ BPL $7948 ; (divs32 + 14)
794f : 20 6f 79 JSR $796f ; (negtmp32 + 0)
7952 : 20 31 42 JSR $4231 ; (divmod32 + 0)
--------------------------------------------------------------------
negaccu32: ; negaccu32
7955 : 38 __ __ SEC
7956 : a9 00 __ LDA #$00
7958 : e5 1b __ SBC ACCU + 0 
795a : 85 1b __ STA ACCU + 0 
795c : a9 00 __ LDA #$00
795e : e5 1c __ SBC ACCU + 1 
7960 : 85 1c __ STA ACCU + 1 
7962 : a9 00 __ LDA #$00
7964 : e5 1d __ SBC ACCU + 2 
7966 : 85 1d __ STA ACCU + 2 
7968 : a9 00 __ LDA #$00
796a : e5 1e __ SBC ACCU + 3 
796c : 85 1e __ STA ACCU + 3 
796e : 60 __ __ RTS
--------------------------------------------------------------------
negtmp32: ; negtmp32
796f : 38 __ __ SEC
7970 : a9 00 __ LDA #$00
7972 : e5 03 __ SBC WORK + 0 
7974 : 85 03 __ STA WORK + 0 
7976 : a9 00 __ LDA #$00
7978 : e5 04 __ SBC WORK + 1 
797a : 85 04 __ STA WORK + 1 
797c : a9 00 __ LDA #$00
797e : e5 05 __ SBC WORK + 2 
7980 : 85 05 __ STA WORK + 2 
7982 : a9 00 __ LDA #$00
7984 : e5 06 __ SBC WORK + 3 
7986 : 85 06 __ STA WORK + 3 
7988 : 60 __ __ RTS
--------------------------------------------------------------------
crt_malloc: ; crt_malloc
7989 : 18 __ __ CLC
798a : a5 1b __ LDA ACCU + 0 
798c : 69 0d __ ADC #$0d
798e : 29 fc __ AND #$fc
7990 : 85 03 __ STA WORK + 0 
7992 : a5 1c __ LDA ACCU + 1 
7994 : 69 00 __ ADC #$00
7996 : 85 04 __ STA WORK + 1 
7998 : ad f2 88 LDA $88f2 ; (HeapNode.end + 0)
799b : d0 26 __ BNE $79c3 ; (crt_malloc + 58)
799d : a9 00 __ LDA #$00
799f : 8d a2 a7 STA $a7a2 
79a2 : 8d a3 a7 STA $a7a3 
79a5 : ee f2 88 INC $88f2 ; (HeapNode.end + 0)
79a8 : a9 a0 __ LDA #$a0
79aa : 09 02 __ ORA #$02
79ac : 8d f0 88 STA $88f0 ; (HeapNode.next + 0)
79af : a9 a7 __ LDA #$a7
79b1 : 8d f1 88 STA $88f1 ; (HeapNode.next + 1)
79b4 : 38 __ __ SEC
79b5 : a9 00 __ LDA #$00
79b7 : e9 02 __ SBC #$02
79b9 : 8d a4 a7 STA $a7a4 
79bc : a9 b0 __ LDA #$b0
79be : e9 00 __ SBC #$00
79c0 : 8d a5 a7 STA $a7a5 
79c3 : a9 f0 __ LDA #$f0
79c5 : a2 88 __ LDX #$88
79c7 : 85 1d __ STA ACCU + 2 
79c9 : 86 1e __ STX ACCU + 3 
79cb : 18 __ __ CLC
79cc : a0 00 __ LDY #$00
79ce : b1 1d __ LDA (ACCU + 2),y 
79d0 : 85 1b __ STA ACCU + 0 
79d2 : 65 03 __ ADC WORK + 0 
79d4 : 85 05 __ STA WORK + 2 
79d6 : c8 __ __ INY
79d7 : b1 1d __ LDA (ACCU + 2),y 
79d9 : 85 1c __ STA ACCU + 1 
79db : f0 20 __ BEQ $79fd ; (crt_malloc + 116)
79dd : 65 04 __ ADC WORK + 1 
79df : 85 06 __ STA WORK + 3 
79e1 : b0 14 __ BCS $79f7 ; (crt_malloc + 110)
79e3 : a0 02 __ LDY #$02
79e5 : b1 1b __ LDA (ACCU + 0),y 
79e7 : c5 05 __ CMP WORK + 2 
79e9 : c8 __ __ INY
79ea : b1 1b __ LDA (ACCU + 0),y 
79ec : e5 06 __ SBC WORK + 3 
79ee : b0 0f __ BCS $79ff ; (crt_malloc + 118)
79f0 : a5 1b __ LDA ACCU + 0 
79f2 : a6 1c __ LDX ACCU + 1 
79f4 : 4c c7 79 JMP $79c7 ; (crt_malloc + 62)
79f7 : a9 00 __ LDA #$00
79f9 : 85 1b __ STA ACCU + 0 
79fb : 85 1c __ STA ACCU + 1 
79fd : 02 __ __ INV
79fe : 60 __ __ RTS
79ff : a5 05 __ LDA WORK + 2 
7a01 : 85 07 __ STA WORK + 4 
7a03 : a5 06 __ LDA WORK + 3 
7a05 : 85 08 __ STA WORK + 5 
7a07 : a0 02 __ LDY #$02
7a09 : a5 07 __ LDA WORK + 4 
7a0b : d1 1b __ CMP (ACCU + 0),y 
7a0d : d0 15 __ BNE $7a24 ; (crt_malloc + 155)
7a0f : c8 __ __ INY
7a10 : a5 08 __ LDA WORK + 5 
7a12 : d1 1b __ CMP (ACCU + 0),y 
7a14 : d0 0e __ BNE $7a24 ; (crt_malloc + 155)
7a16 : a0 00 __ LDY #$00
7a18 : b1 1b __ LDA (ACCU + 0),y 
7a1a : 91 1d __ STA (ACCU + 2),y 
7a1c : c8 __ __ INY
7a1d : b1 1b __ LDA (ACCU + 0),y 
7a1f : 91 1d __ STA (ACCU + 2),y 
7a21 : 4c 41 7a JMP $7a41 ; (crt_malloc + 184)
7a24 : a0 00 __ LDY #$00
7a26 : b1 1b __ LDA (ACCU + 0),y 
7a28 : 91 07 __ STA (WORK + 4),y 
7a2a : a5 07 __ LDA WORK + 4 
7a2c : 91 1d __ STA (ACCU + 2),y 
7a2e : c8 __ __ INY
7a2f : b1 1b __ LDA (ACCU + 0),y 
7a31 : 91 07 __ STA (WORK + 4),y 
7a33 : a5 08 __ LDA WORK + 5 
7a35 : 91 1d __ STA (ACCU + 2),y 
7a37 : c8 __ __ INY
7a38 : b1 1b __ LDA (ACCU + 0),y 
7a3a : 91 07 __ STA (WORK + 4),y 
7a3c : c8 __ __ INY
7a3d : b1 1b __ LDA (ACCU + 0),y 
7a3f : 91 07 __ STA (WORK + 4),y 
7a41 : a0 00 __ LDY #$00
7a43 : a5 05 __ LDA WORK + 2 
7a45 : 91 1b __ STA (ACCU + 0),y 
7a47 : c8 __ __ INY
7a48 : a5 06 __ LDA WORK + 3 
7a4a : 91 1b __ STA (ACCU + 0),y 
7a4c : a0 02 __ LDY #$02
7a4e : a9 bd __ LDA #$bd
7a50 : 91 1b __ STA (ACCU + 0),y 
7a52 : c8 __ __ INY
7a53 : 91 1b __ STA (ACCU + 0),y 
7a55 : c8 __ __ INY
7a56 : 91 1b __ STA (ACCU + 0),y 
7a58 : c8 __ __ INY
7a59 : 91 1b __ STA (ACCU + 0),y 
7a5b : 38 __ __ SEC
7a5c : a5 05 __ LDA WORK + 2 
7a5e : e9 04 __ SBC #$04
7a60 : 85 05 __ STA WORK + 2 
7a62 : b0 02 __ BCS $7a66 ; (crt_malloc + 221)
7a64 : c6 06 __ DEC WORK + 3 
7a66 : a9 be __ LDA #$be
7a68 : a0 00 __ LDY #$00
7a6a : 91 05 __ STA (WORK + 2),y 
7a6c : c8 __ __ INY
7a6d : 91 05 __ STA (WORK + 2),y 
7a6f : c8 __ __ INY
7a70 : 91 05 __ STA (WORK + 2),y 
7a72 : c8 __ __ INY
7a73 : 91 05 __ STA (WORK + 2),y 
7a75 : 18 __ __ CLC
7a76 : a5 1b __ LDA ACCU + 0 
7a78 : 69 06 __ ADC #$06
7a7a : 85 1b __ STA ACCU + 0 
7a7c : 90 02 __ BCC $7a80 ; (crt_malloc + 247)
7a7e : e6 1c __ INC ACCU + 1 
7a80 : 60 __ __ RTS
--------------------------------------------------------------------
crt_free@proxy: ; crt_free@proxy
7a81 : a5 0d __ LDA P0 
7a83 : 85 1b __ STA ACCU + 0 
7a85 : a5 0e __ LDA P1 
7a87 : 85 1c __ STA ACCU + 1 
--------------------------------------------------------------------
crt_free: ; crt_free
7a89 : a5 1b __ LDA ACCU + 0 
7a8b : 05 1c __ ORA ACCU + 1 
7a8d : d0 01 __ BNE $7a90 ; (crt_free + 7)
7a8f : 60 __ __ RTS
7a90 : 38 __ __ SEC
7a91 : a5 1b __ LDA ACCU + 0 
7a93 : 29 03 __ AND #$03
7a95 : d0 56 __ BNE $7aed ; (crt_free + 100)
7a97 : a5 1b __ LDA ACCU + 0 
7a99 : e9 06 __ SBC #$06
7a9b : 85 1b __ STA ACCU + 0 
7a9d : b0 02 __ BCS $7aa1 ; (crt_free + 24)
7a9f : c6 1c __ DEC ACCU + 1 
7aa1 : a0 02 __ LDY #$02
7aa3 : a9 bd __ LDA #$bd
7aa5 : d1 1b __ CMP (ACCU + 0),y 
7aa7 : d0 44 __ BNE $7aed ; (crt_free + 100)
7aa9 : c8 __ __ INY
7aaa : d1 1b __ CMP (ACCU + 0),y 
7aac : d0 3f __ BNE $7aed ; (crt_free + 100)
7aae : c8 __ __ INY
7aaf : d1 1b __ CMP (ACCU + 0),y 
7ab1 : d0 3a __ BNE $7aed ; (crt_free + 100)
7ab3 : c8 __ __ INY
7ab4 : d1 1b __ CMP (ACCU + 0),y 
7ab6 : d0 35 __ BNE $7aed ; (crt_free + 100)
7ab8 : a0 00 __ LDY #$00
7aba : 38 __ __ SEC
7abb : b1 1b __ LDA (ACCU + 0),y 
7abd : e9 04 __ SBC #$04
7abf : 85 03 __ STA WORK + 0 
7ac1 : c8 __ __ INY
7ac2 : b1 1b __ LDA (ACCU + 0),y 
7ac4 : e9 00 __ SBC #$00
7ac6 : 85 04 __ STA WORK + 1 
7ac8 : a0 00 __ LDY #$00
7aca : a9 be __ LDA #$be
7acc : d1 03 __ CMP (WORK + 0),y 
7ace : d0 1d __ BNE $7aed ; (crt_free + 100)
7ad0 : c8 __ __ INY
7ad1 : d1 03 __ CMP (WORK + 0),y 
7ad3 : d0 18 __ BNE $7aed ; (crt_free + 100)
7ad5 : c8 __ __ INY
7ad6 : d1 03 __ CMP (WORK + 0),y 
7ad8 : d0 13 __ BNE $7aed ; (crt_free + 100)
7ada : c8 __ __ INY
7adb : d1 03 __ CMP (WORK + 0),y 
7add : d0 0e __ BNE $7aed ; (crt_free + 100)
7adf : a5 1c __ LDA ACCU + 1 
7ae1 : a6 1b __ LDX ACCU + 0 
7ae3 : c9 a7 __ CMP #$a7
7ae5 : 90 06 __ BCC $7aed ; (crt_free + 100)
7ae7 : d0 05 __ BNE $7aee ; (crt_free + 101)
7ae9 : e0 a0 __ CPX #$a0
7aeb : b0 01 __ BCS $7aee ; (crt_free + 101)
7aed : 02 __ __ INV
7aee : c9 b0 __ CMP #$b0
7af0 : 90 06 __ BCC $7af8 ; (crt_free + 111)
7af2 : d0 f9 __ BNE $7aed ; (crt_free + 100)
7af4 : e0 00 __ CPX #$00
7af6 : b0 f5 __ BCS $7aed ; (crt_free + 100)
7af8 : a0 02 __ LDY #$02
7afa : a9 bf __ LDA #$bf
7afc : 91 1b __ STA (ACCU + 0),y 
7afe : c8 __ __ INY
7aff : 91 1b __ STA (ACCU + 0),y 
7b01 : a0 00 __ LDY #$00
7b03 : b1 1b __ LDA (ACCU + 0),y 
7b05 : 85 1d __ STA ACCU + 2 
7b07 : c8 __ __ INY
7b08 : b1 1b __ LDA (ACCU + 0),y 
7b0a : 85 1e __ STA ACCU + 3 
7b0c : a9 f0 __ LDA #$f0
7b0e : a2 88 __ LDX #$88
7b10 : 85 05 __ STA WORK + 2 
7b12 : 86 06 __ STX WORK + 3 
7b14 : a0 01 __ LDY #$01
7b16 : b1 05 __ LDA (WORK + 2),y 
7b18 : f0 28 __ BEQ $7b42 ; (crt_free + 185)
7b1a : aa __ __ TAX
7b1b : 88 __ __ DEY
7b1c : b1 05 __ LDA (WORK + 2),y 
7b1e : e4 1e __ CPX ACCU + 3 
7b20 : 90 ee __ BCC $7b10 ; (crt_free + 135)
7b22 : d0 1e __ BNE $7b42 ; (crt_free + 185)
7b24 : c5 1d __ CMP ACCU + 2 
7b26 : 90 e8 __ BCC $7b10 ; (crt_free + 135)
7b28 : d0 18 __ BNE $7b42 ; (crt_free + 185)
7b2a : a0 00 __ LDY #$00
7b2c : b1 1d __ LDA (ACCU + 2),y 
7b2e : 91 1b __ STA (ACCU + 0),y 
7b30 : c8 __ __ INY
7b31 : b1 1d __ LDA (ACCU + 2),y 
7b33 : 91 1b __ STA (ACCU + 0),y 
7b35 : c8 __ __ INY
7b36 : b1 1d __ LDA (ACCU + 2),y 
7b38 : 91 1b __ STA (ACCU + 0),y 
7b3a : c8 __ __ INY
7b3b : b1 1d __ LDA (ACCU + 2),y 
7b3d : 91 1b __ STA (ACCU + 0),y 
7b3f : 4c 57 7b JMP $7b57 ; (crt_free + 206)
7b42 : a0 00 __ LDY #$00
7b44 : b1 05 __ LDA (WORK + 2),y 
7b46 : 91 1b __ STA (ACCU + 0),y 
7b48 : c8 __ __ INY
7b49 : b1 05 __ LDA (WORK + 2),y 
7b4b : 91 1b __ STA (ACCU + 0),y 
7b4d : c8 __ __ INY
7b4e : a5 1d __ LDA ACCU + 2 
7b50 : 91 1b __ STA (ACCU + 0),y 
7b52 : c8 __ __ INY
7b53 : a5 1e __ LDA ACCU + 3 
7b55 : 91 1b __ STA (ACCU + 0),y 
7b57 : a0 02 __ LDY #$02
7b59 : b1 05 __ LDA (WORK + 2),y 
7b5b : c5 1b __ CMP ACCU + 0 
7b5d : d0 1d __ BNE $7b7c ; (crt_free + 243)
7b5f : c8 __ __ INY
7b60 : b1 05 __ LDA (WORK + 2),y 
7b62 : c5 1c __ CMP ACCU + 1 
7b64 : d0 16 __ BNE $7b7c ; (crt_free + 243)
7b66 : a0 00 __ LDY #$00
7b68 : b1 1b __ LDA (ACCU + 0),y 
7b6a : 91 05 __ STA (WORK + 2),y 
7b6c : c8 __ __ INY
7b6d : b1 1b __ LDA (ACCU + 0),y 
7b6f : 91 05 __ STA (WORK + 2),y 
7b71 : c8 __ __ INY
7b72 : b1 1b __ LDA (ACCU + 0),y 
7b74 : 91 05 __ STA (WORK + 2),y 
7b76 : c8 __ __ INY
7b77 : b1 1b __ LDA (ACCU + 0),y 
7b79 : 91 05 __ STA (WORK + 2),y 
7b7b : 60 __ __ RTS
7b7c : a0 00 __ LDY #$00
7b7e : a5 1b __ LDA ACCU + 0 
7b80 : 91 05 __ STA (WORK + 2),y 
7b82 : c8 __ __ INY
7b83 : a5 1c __ LDA ACCU + 1 
7b85 : 91 05 __ STA (WORK + 2),y 
7b87 : 60 __ __ RTS
--------------------------------------------------------------------
__multab16L:
7b88 : __ __ __ BYT 00 10 20 30 40                                  : .. 0@
--------------------------------------------------------------------
__multab50L:
7b8d : __ __ __ BYT 00 32 64 96                                     : .2d.
--------------------------------------------------------------------
__multab7L:
7b91 : __ __ __ BYT 00 07 0e 15 1c 23 2a 31 38 3f 46 4d 54          : .....#*18?FMT
--------------------------------------------------------------------
__shrtab192L:
7b9e : __ __ __ BYT c0 60 30 18 0c 06 03                            : .`0....
--------------------------------------------------------------------
__multab12L:
7ba5 : __ __ __ BYT 00 0c 18 24                                     : ...$
--------------------------------------------------------------------
__multab3L:
7ba9 : __ __ __ BYT 00 03 06 09                                     : ....
--------------------------------------------------------------------
__shltab3L:
7bad : __ __ __ BYT 03 06 0c 18 30 60 c0                            : ....0`.
--------------------------------------------------------------------
__multab320L:
7bb4 : __ __ __ BYT 00 40 80 c0 00 40 80 c0 00 40 80 c0 00          : .@...@...@...
--------------------------------------------------------------------
__multab320H:
7bc1 : __ __ __ BYT 00 01 02 03 05 06 07 08 0a 0b 0c 0d 0f          : .............
--------------------------------------------------------------------
__multab40L:
7bce : __ __ __ BYT 00 28 50 78 a0 c8                               : .(Px..
--------------------------------------------------------------------
__multab10L:
7bd4 : __ __ __ BYT 00 0a 14 1e 28 32 3c 46 50 5a 64 6e 78 82 8c 96 : ....(2<FPZdnx...
--------------------------------------------------------------------
__multab17L:
7be4 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 99 aa bb cc dd ee ff : .."3DUfw........
--------------------------------------------------------------------
screen_result@proxy: ; screen_result@proxy
7bf4 : a9 ac __ LDA #$ac
7bf6 : 85 10 __ STA P3 
7bf8 : a9 15 __ LDA #$15
7bfa : 85 11 __ STA P4 
7bfc : 4c d4 11 JMP $11d4 ; (screen_result.s4 + 0)
--------------------------------------------------------------------
memset@proxy: ; memset@proxy
7bff : a9 e0 __ LDA #$e0
7c01 : 85 0e __ STA P1 
7c03 : a9 40 __ LDA #$40
7c05 : 85 11 __ STA P4 
7c07 : a9 1f __ LDA #$1f
7c09 : 85 12 __ STA P5 
7c0b : 4c f1 23 JMP $23f1 ; (memset.s4 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
7c0e : a5 4f __ LDA $4f 
7c10 : 85 03 __ STA WORK + 0 
7c12 : a5 50 __ LDA $50 
7c14 : 85 04 __ STA WORK + 1 
7c16 : 4c 12 78 JMP $7812 ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
7c19 : a5 5e __ LDA $5e 
7c1b : 85 03 __ STA WORK + 0 
7c1d : a5 5f __ LDA $5f 
7c1f : 85 04 __ STA WORK + 1 
7c21 : 4c 12 78 JMP $7812 ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
7c24 : a9 7f __ LDA #$7f
7c26 : 85 03 __ STA WORK + 0 
7c28 : a9 00 __ LDA #$00
7c2a : 85 04 __ STA WORK + 1 
7c2c : a5 05 __ LDA WORK + 2 
7c2e : 85 1b __ STA ACCU + 0 
7c30 : a5 06 __ LDA WORK + 3 
7c32 : 85 1c __ STA ACCU + 1 
7c34 : 4c 12 78 JMP $7812 ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
7c37 : a9 0d __ LDA #$0d
7c39 : 85 03 __ STA WORK + 0 
7c3b : 4c 12 78 JMP $7812 ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
7c3e : a9 7f __ LDA #$7f
7c40 : 85 03 __ STA WORK + 0 
7c42 : a9 00 __ LDA #$00
7c44 : 85 04 __ STA WORK + 1 
7c46 : 4c 12 78 JMP $7812 ; (divs16 + 0)
--------------------------------------------------------------------
divmod@proxy: ; divmod@proxy
7c49 : a9 50 __ LDA #$50
7c4b : 85 1b __ STA ACCU + 0 
7c4d : a9 46 __ LDA #$46
7c4f : 85 1c __ STA ACCU + 1 
7c51 : 4c 4d 78 JMP $784d ; (divmod + 0)
--------------------------------------------------------------------
cwin_put_string@proxy: ; cwin_put_string@proxy
7c54 : a5 10 __ LDA P3 
7c56 : 85 0d __ STA P0 
7c58 : a5 11 __ LDA P4 
7c5a : 85 0e __ STA P1 
7c5c : 4c 32 11 JMP $1132 ; (cwin_put_string.s4 + 0)
--------------------------------------------------------------------
vic_setmode@proxy: ; vic_setmode@proxy
7c5f : a9 04 __ LDA #$04
7c61 : 85 0d __ STA P0 
7c63 : a9 c0 __ LDA #$c0
7c65 : 85 0f __ STA P2 
7c67 : a9 e0 __ LDA #$e0
7c69 : 85 11 __ STA P4 
7c6b : 4c 79 0f JMP $0f79 ; (vic_setmode.s4 + 0)
--------------------------------------------------------------------
vic_setmode@proxy: ; vic_setmode@proxy
7c6e : a9 03 __ LDA #$03
7c70 : 85 0d __ STA P0 
7c72 : a9 00 __ LDA #$00
7c74 : 85 0e __ STA P1 
7c76 : a9 d0 __ LDA #$d0
7c78 : 85 0f __ STA P2 
7c7a : a5 43 __ LDA $43 
7c7c : 85 10 __ STA P3 
7c7e : a5 44 __ LDA $44 
7c80 : 85 11 __ STA P4 
7c82 : 4c 79 0f JMP $0f79 ; (vic_setmode.s4 + 0)
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
7c85 : a9 7c __ LDA #$7c
7c87 : 85 0e __ STA P1 
7c89 : 4c aa 10 JMP $10aa ; (strlen.s4 + 0)
--------------------------------------------------------------------
mul40:
7c8c : __ __ __ BYT 00 00 28 00 50 00 78 00 a0 00 c8 00 f0 00 18 01 : ..(.P.x.........
7c9c : __ __ __ BYT 40 01 68 01 90 01 b8 01 e0 01 08 02 30 02 58 02 : @.h.........0.X.
7cac : __ __ __ BYT 80 02 a8 02 d0 02 f8 02 20 03 48 03 70 03 98 03 : ........ .H.p...
7cbc : __ __ __ BYT c0 03                                           : ..
--------------------------------------------------------------------
p2smap:
7cbe : __ __ __ BYT 40 00 40 20 40 c0 80 80                         : @.@ @...
--------------------------------------------------------------------
p2smap:
7cc6 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
audio_ch_base:
7cce : __ __ __ BYT 20 df 40 df 60 df 80 df a0 df c0 df e0 df       :  .@.`.........
--------------------------------------------------------------------
mod_file:
7cdc : __ __ __ BYT 34 65 76 2e 6d 6f 64 00                         : 4ev.mod.
--------------------------------------------------------------------
demo_path:
7ce4 : __ __ __ BYT 69 64 69 38 62 2f 75 6c 74 64 65 6d 6f 32 30 32 : idi8b/ultdemo202
7cf4 : __ __ __ BYT 36 2f 00                                        : 6/.
--------------------------------------------------------------------
lmask:
7cf7 : __ __ __ BYT ff 7f 3f 1f 0f 07 03 01                         : ..?.....
--------------------------------------------------------------------
mod_paused:
7cff : __ __ __ BSS	1
--------------------------------------------------------------------
sid_freq:
7d00 : __ __ __ BYT a9 02 d2 02 fd 02 2b 03 5b 03 8e 03 c4 03 fd 03 : ......+.[.......
7d10 : __ __ __ BYT 3a 04 7a 04 bf 04 07 05 53 05 a4 05 fa 05 55 06 : :.z.....S.....U.
--------------------------------------------------------------------
speed_nums:
7d20 : __ __ __ BYT fc 1f fe 1f 93 25 95 25 97 25 99 25 9b 25 9e 25 : .....%.%.%.%.%.%
7d30 : __ __ __ BYT a1 25 a4 25 a7 25 aa 25 ad 25 b0 25 b3 25 b6 25 : .%.%.%.%.%.%.%.%
--------------------------------------------------------------------
glyphs:
7d40 : __ __ __ BYT 70 88 88 88 88 88 70 20 60 20 20 20 20 70 70 88 : p.....p `    pp.
7d50 : __ __ __ BYT 08 30 40 80 f8 70 88 08 30 08 88 70 10 30 50 90 : .0@..p..0..p.0P.
7d60 : __ __ __ BYT f8 10 10 f8 80 f0 08 08 88 70 30 40 80 f0 88 88 : .........p0@....
7d70 : __ __ __ BYT 70 f8 08 10 20 40 40 40 70 88 88 70 88 88 70 70 : p... @@@p..p..pp
7d80 : __ __ __ BYT 88 88 78 08 10 60 88 d8 a8 88 88 88 88 88 88 88 : ..x..`..........
7d90 : __ __ __ BYT f8 88 88 88 f8 10 20 40 80 80 f8                : ...... @...
--------------------------------------------------------------------
rmask:
7d9b : __ __ __ BYT 00 80 c0 e0 f0 f8 fc fe                         : ........
--------------------------------------------------------------------
blitops_op:
7da3 : __ __ __ BYT 00 21 01 41                                     : .!.A
--------------------------------------------------------------------
step_msg:
7da7 : __ __ __ BYT b6 2f cf 2f e4 2f f7 2f 0f 30 2c 30 46 30 60 30 : ././././.0,0F0`0
7db7 : __ __ __ BYT 79 30 95 30 b5 30 d2 30 ef 30 0b 31 23 31 3f 31 : y0.0.0.0.0.1#1?1
--------------------------------------------------------------------
TinyFont:
7dc7 : __ __ __ BYT 00 04 05 08 0d 12 17 1c 1d 21 25 2a 2d 2e 31 32 : .........!%*-.12
7dd7 : __ __ __ BYT 35 39 3d 41 45 49 4d 51 55 59 5d 5e 5f 62 65 68 : 59=AEIMQUY]^_beh
7de7 : __ __ __ BYT 6c 71 76 7a 7e 82 86 8a 8e 92 95 99 9d a1 a6 ab : lqvz~...........
7df7 : __ __ __ BYT af b3 b7 bb bf c4 c8 cd d2 d7 dc e1 e5 e8 ec f1 : ................
7e07 : __ __ __ BYT f5 f9 fd 01 05 09 0d 10 14 18 19 1b 1f 21 26 2a : .............!&*
7e17 : __ __ __ BYT 2e 32 36 3a 3e 41 45 49 4e 52 56 5a 5e 5f 63 67 : .26:>AEINRVZ^_cg
7e27 : __ __ __ BYT 10 04 0c 14 14 14 14 04 10 10 14 0c 04 0c 04 0c : ................
7e37 : __ __ __ BYT 10 10 10 10 10 10 10 10 10 10 04 04 0c 0c 0c 10 : ................
7e47 : __ __ __ BYT 14 14 10 10 10 10 10 10 10 0c 10 10 10 14 14 10 : ................
7e57 : __ __ __ BYT 10 10 10 10 14 10 14 14 14 14 14 10 0c 10 14 10 : ................
7e67 : __ __ __ BYT 10 10 10 11 11 11 0d 11 11 05 09 11 09 15 11 11 : ................
7e77 : __ __ __ BYT 11 11 11 11 0d 11 11 15 11 11 11 11 05 11 11 11 : ................
7e87 : __ __ __ BYT 00 00 00 00 fa c0 00 c0 28 7c 28 7c 28 20 54 d6 : ........(|(|( T.
7e97 : __ __ __ BYT 54 08 04 48 10 24 40 6c 92 92 6c 0a c0 38 44 82 : T..H.$@l..l..8D.
7ea7 : __ __ __ BYT 82 82 82 44 38 10 54 38 54 10 10 38 10 03 10 10 : ...D8.T8T..8....
7eb7 : __ __ __ BYT 10 02 06 38 c0 7c 82 82 7c 22 42 fe 02 46 8a 92 : ...8.|..|"B..F..
7ec7 : __ __ __ BYT 62 44 82 92 6c f0 10 3e 10 e4 92 92 8c 7c 92 92 : bD..l..>.....|..
7ed7 : __ __ __ BYT 4c 80 8e 90 e0 6c 92 92 6c 64 92 92 7c 28 0b 10 : L....l..ld..|(..
7ee7 : __ __ __ BYT 28 44 28 28 28 44 28 10 40 80 9a 60 00 00 00 00 : (D(((D(.@..`....
7ef7 : __ __ __ BYT 00 3e 50 90 50 3e fe 92 92 6c 7c 82 82 44 fe 82 : .>P.P>...l|..D..
7f07 : __ __ __ BYT 82 7c fe 92 92 82 fe 90 90 80 7c 82 92 1c fe 10 : .|........|.....
7f17 : __ __ __ BYT 10 fe 82 fe 82 84 82 82 fc fe 10 28 c6 fe 02 02 : ...........(....
7f27 : __ __ __ BYT 02 fe 40 20 40 fe fe 40 20 10 fe 7c 82 82 7c fe : ..@ @..@ ..|..|.
7f37 : __ __ __ BYT 90 90 60 7c 82 84 7a fe 90 90 6e 64 92 92 4c 80 : ..`|..z...nd..L.
7f47 : __ __ __ BYT 80 fe 80 80 fc 02 02 fc e0 18 06 18 e0 fe 04 08 : ................
7f57 : __ __ __ BYT 04 fe c6 28 10 28 c6 e0 10 1e 10 e0 86 8a 92 a2 : ...(.(..........
7f67 : __ __ __ BYT c2 fe 82 82 82 c0 38 06 82 82 82 fe 20 40 80 40 : ......8..... @.@
7f77 : __ __ __ BYT 20 01 01 01 01 00 00 00 00 04 2a 2a 1e fe 22 22 :  .........**..""
7f87 : __ __ __ BYT 1c 1c 22 22 14 1c 22 22 fe 1c 2a 2a 18 20 7e a0 : ..""..""..**. ~.
7f97 : __ __ __ BYT 18 25 25 3e fe 20 20 1e be 01 be fe 10 28 46 fc : .%%>.  ......(F.
7fa7 : __ __ __ BYT 02 3e 20 1e 20 1e 3e 20 20 1e 1c 22 22 1c 3f 24 : .> . .>  .."".?$
7fb7 : __ __ __ BYT 24 18 18 24 24 3f 3e 10 20 10 12 2a 2a 04 20 7c : $..$$?>. ..**. |
7fc7 : __ __ __ BYT 22 3c 02 02 3e 38 04 02 3c 3c 02 1c 02 3c 26 18 : "<..>8..<<...<&.
7fd7 : __ __ __ BYT 0c 32 38 05 05 3e 26 2a 2a 32 10 6c 82 82 fe 82 : .28..>&**2.l....
7fe7 : __ __ __ BYT 82 6c 10 10 20 10 20 00 00 00 00                : .l.. . ....
--------------------------------------------------------------------
tbitmap:
7ff2 : __ __ __ BYT e0 a0 00 00 28 01 40 01                         : ....(.@.
--------------------------------------------------------------------
cbytes:
7ffa : __ __ __ BYT 00 55 aa ff                                     : .U..
--------------------------------------------------------------------
mod_saved_irq:
7ffe : __ __ __ BSS	2
--------------------------------------------------------------------
sin64:
8000 : __ __ __ BYT 00 0c 19 25 31 3c 47 51 5a 62 6a 70 75 7a 7d 7e : ...%1<GQZbjpuz}~
8010 : __ __ __ BYT 7f 7e 7d 7a 75 70 6a 62 5a 51 47 3c 31 25 19 0c : .~}zupjbZQG<1%..
8020 : __ __ __ BYT 00 f4 e7 db cf c4 b9 af a6 9e 96 90 8b 86 83 82 : ................
8030 : __ __ __ BYT 81 82 83 86 8b 90 96 9e a6 af b9 c4 cf db e7 f4 : ................
--------------------------------------------------------------------
cr:
8040 : __ __ __ BYT 00 00 00 00 40 01 c8 00                         : ....@...
--------------------------------------------------------------------
vib_sine:
8048 : __ __ __ BYT 00 18 31 4a 61 78 8d a1 b4 c5 d4 e0 eb f4 fa fd : ..1Jax..........
8058 : __ __ __ BYT ff fd fa f4 eb e0 d4 c5 b4 a1 8d 78 61 4a 31 18 : ...........xaJ1.
--------------------------------------------------------------------
frames:
8068 : __ __ __ BYT 00 d8 00 e7 60 40 00 00 00 00 00 e4 1f f5 33 20 : ....`@........3 
8078 : __ __ __ BYT 00 00 00 00 00 ec 00 f8 1a 10 00 00 00 00 00 d8 : ................
8088 : __ __ __ BYT 00 e7 60 40 cd f4 52 04 00 d8 00 e7 60 40 33 f3 : ..`@..R.....`@3.
8098 : __ __ __ BYT 7f 02                                           : ..
--------------------------------------------------------------------
f1c:
809a : __ __ __ BYT 0f 01 0d 0d 05 01 07 0d 01 01 07 08 0e 03 01 03 : ................
80aa : __ __ __ BYT 0e 0d 0d 07 01 01 0d 07 06 03 0e 0e 05 03 05 0d : ................
80ba : __ __ __ BYT 01 01 05 0d 06 04 03 03 0e 01 0d 03 01 01 0f 0d : ................
--------------------------------------------------------------------
gz:
80ca : __ __ __ BYT a0 00 bb 00 d5 00 f0 00 0b 01 25 01 40 01       : ..........%.@.
--------------------------------------------------------------------
gx:
80d8 : __ __ __ BYT b0 ff cb ff e5 ff 00 00 1b 00 35 00 50 00       : ..........5.P.
--------------------------------------------------------------------
cube_v:
80e6 : __ __ __ BYT ff ff ff 01 ff ff 01 01 ff ff 01 ff ff ff 01 01 : ................
80f6 : __ __ __ BYT ff 01 01 01 01 ff 01 01                         : ........
--------------------------------------------------------------------
sin256:
80fe : __ __ __ BYT 00 00 65 00 c9 00 2d 01 91 01 f5 01 59 02 bc 02 : ..e...-.....Y...
810e : __ __ __ BYT 1f 03 81 03 e3 03 44 04 a5 04 05 05 64 05 c2 05 : ......D.....d...
811e : __ __ __ BYT 1f 06 7c 06 d7 06 32 07 8b 07 e3 07 3a 08 8f 08 : ..|...2.....:...
812e : __ __ __ BYT e4 08 37 09 88 09 d8 09 26 0a 73 0a bf 0a 08 0b : ..7.....&.s.....
813e : __ __ __ BYT 50 0b 97 0b db 0b 1e 0c 5e 0c 9d 0c da 0c 15 0d : P.......^.......
814e : __ __ __ BYT 4e 0d 85 0d b9 0d ec 0d 1c 0e 4b 0e 77 0e a1 0e : N.........K.w...
815e : __ __ __ BYT c8 0e ee 0e 11 0f 31 0f 50 0f 6c 0f 85 0f 9c 0f : ......1.P.l.....
816e : __ __ __ BYT b1 0f c4 0f d4 0f e1 0f ec 0f f5 0f fb 0f ff 0f : ................
817e : __ __ __ BYT 00 10 ff 0f fb 0f f5 0f ec 0f e1 0f d4 0f c4 0f : ................
818e : __ __ __ BYT b1 0f 9c 0f 85 0f 6c 0f 50 0f 31 0f 11 0f ee 0e : ......l.P.1.....
819e : __ __ __ BYT c8 0e a1 0e 77 0e 4b 0e 1c 0e ec 0d b9 0d 85 0d : ....w.K.........
81ae : __ __ __ BYT 4e 0d 15 0d da 0c 9d 0c 5e 0c 1e 0c db 0b 97 0b : N.......^.......
81be : __ __ __ BYT 50 0b 08 0b bf 0a 73 0a 26 0a d8 09 88 09 37 09 : P.....s.&.....7.
81ce : __ __ __ BYT e4 08 8f 08 3a 08 e3 07 8b 07 32 07 d7 06 7c 06 : ....:.....2...|.
81de : __ __ __ BYT 1f 06 c2 05 64 05 05 05 a5 04 44 04 e3 03 81 03 : ....d.....D.....
81ee : __ __ __ BYT 1f 03 bc 02 59 02 f5 01 91 01 2d 01 c9 00 65 00 : ....Y.....-...e.
81fe : __ __ __ BYT 00 00 9b ff 37 ff d3 fe 6f fe 0b fe a7 fd 44 fd : ....7...o.....D.
820e : __ __ __ BYT e1 fc 7f fc 1d fc bc fb 5b fb fb fa 9c fa 3e fa : ........[.....>.
821e : __ __ __ BYT e1 f9 84 f9 29 f9 ce f8 75 f8 1d f8 c6 f7 71 f7 : ....)...u.....q.
822e : __ __ __ BYT 1c f7 c9 f6 78 f6 28 f6 da f5 8d f5 41 f5 f8 f4 : ....x.(.....A...
823e : __ __ __ BYT b0 f4 69 f4 25 f4 e2 f3 a2 f3 63 f3 26 f3 eb f2 : ..i.%.....c.&...
824e : __ __ __ BYT b2 f2 7b f2 47 f2 14 f2 e4 f1 b5 f1 89 f1 5f f1 : ..{.G........._.
825e : __ __ __ BYT 38 f1 12 f1 ef f0 cf f0 b0 f0 94 f0 7b f0 64 f0 : 8...........{.d.
826e : __ __ __ BYT 4f f0 3c f0 2c f0 1f f0 14 f0 0b f0 05 f0 01 f0 : O.<.,...........
827e : __ __ __ BYT 00 f0 01 f0 05 f0 0b f0 14 f0 1f f0 2c f0 3c f0 : ............,.<.
828e : __ __ __ BYT 4f f0 64 f0 7b f0 94 f0 b0 f0 cf f0 ef f0 12 f1 : O.d.{...........
829e : __ __ __ BYT 38 f1 5f f1 89 f1 b5 f1 e4 f1 14 f2 47 f2 7b f2 : 8._.........G.{.
82ae : __ __ __ BYT b2 f2 eb f2 26 f3 63 f3 a2 f3 e2 f3 25 f4 69 f4 : ....&.c.....%.i.
82be : __ __ __ BYT b0 f4 f8 f4 41 f5 8d f5 da f5 28 f6 78 f6 c9 f6 : ....A.....(.x...
82ce : __ __ __ BYT 1c f7 71 f7 c6 f7 1d f8 75 f8 ce f8 29 f9 84 f9 : ..q.....u...)...
82de : __ __ __ BYT e1 f9 3e fa 9c fa fb fa 5b fb bc fb 1d fc 7f fc : ..>.....[.......
82ee : __ __ __ BYT e1 fc 44 fd a7 fd 0b fe 6f fe d3 fe 37 ff 9b ff : ..D.....o...7...
--------------------------------------------------------------------
txt_pos:
82fe : __ __ __ BSS	2
--------------------------------------------------------------------
cube_e:
8300 : __ __ __ BYT 00 01 01 02 02 03 03 00 04 05 05 06 06 07 07 04 : ................
8310 : __ __ __ BYT 00 04 01 05 02 06 03 07                         : ........
--------------------------------------------------------------------
vcr:
8318 : __ __ __ BYT 00 00 00 00 40 01 c8 00                         : ....@...
--------------------------------------------------------------------
sin_lut:
8320 : __ __ __ BYT 02 02 02 02 02 02 02 02 03 03 03 03 03 03 03 03 : ................
8330 : __ __ __ BYT 03 03 03 03 03 03 03 03 03 02 02 02 02 02 02 02 : ................
8340 : __ __ __ BYT 02 01 01 01 01 01 01 01 00 00 00 00 00 00 00 00 : ................
8350 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 01 01 01 01 01 01 : ................
--------------------------------------------------------------------
sum_to_col:
8360 : __ __ __ BYT 00 00 00 01 01 02 02 03 03 03                   : ..........
--------------------------------------------------------------------
pal_sc:
836a : __ __ __ BYT f9 e3 a8 d5                                     : ....
--------------------------------------------------------------------
pal_cr:
836e : __ __ __ BYT 01 01 07 03                                     : ....
--------------------------------------------------------------------
lat_wave:
8372 : __ __ __ BYT 00 ff ff fe fe fd fd fc fc fb fb fb fa fa fa fa : ................
8382 : __ __ __ BYT fa fa fa fb fb fb fc fc fd fd fe fe ff ff 00 00 : ................
8392 : __ __ __ BYT 01 01 02 02 03 03 04 04 05 05 05 06 06 06 06 06 : ................
83a2 : __ __ __ BYT 06 06 05 05 05 04 04 03 03 02 02 01 01 00 00 ff : ................
--------------------------------------------------------------------
vert_wave:
83b2 : __ __ __ BYT 00 01 02 02 03 03 04 04 04 04 04 03 03 02 02 01 : ................
83c2 : __ __ __ BYT 00 ff fe fe fd fd fc fc fc fc fc fd fd fe fe ff : ................
83d2 : __ __ __ BYT 00 01 02 02 03 03 04 04 04 04 04 03 03 02 02 01 : ................
83e2 : __ __ __ BYT 00 ff fe fe fd fd fc fc fc fc fc fd fd fe fe ff : ................
--------------------------------------------------------------------
scroll_text:
83f2 : __ __ __ BYT 20 20 75 4c 54 49 4d 41 54 45 20 64 45 4d 4f 20 :   uLTIMATE dEMO 
8402 : __ __ __ BYT 32 30 32 36 20 20 63 4f 44 45 44 20 69 4e 20 63 : 2026  cODED iN c
8412 : __ __ __ BYT 20 62 59 20 78 41 4e 44 45 52 20 6d 4f 4c 20 20 :  bY xANDER mOL  
8422 : __ __ __ BYT 72 55 4e 4e 49 4e 47 20 61 54 20 36 34 20 6d 48 : rUNNING aT 64 mH
8432 : __ __ __ BYT 5a 20 6f 4e 20 74 48 45 20 75 4c 54 49 4d 41 54 : Z oN tHE uLTIMAT
8442 : __ __ __ BYT 45 20 36 34 20 68 41 52 44 57 41 52 45 20 20 67 : E 64 hARDWARE  g
8452 : __ __ __ BYT 52 45 45 54 49 4e 47 53 20 74 4f 20 61 4c 4c 20 : REETINGS tO aLL 
8462 : __ __ __ BYT 63 36 34 20 64 45 4d 4f 20 63 4f 44 45 52 53 20 : c64 dEMO cODERS 
8472 : __ __ __ BYT 20 73 54 49 4c 4c 20 70 55 53 48 49 4e 47 20 74 :  sTILL pUSHING t
8482 : __ __ __ BYT 48 45 20 6c 49 4d 49 54 53 20 6f 46 20 74 48 45 : HE lIMITS oF tHE
8492 : __ __ __ BYT 20 63 36 34 20 69 4e 20 32 30 32 36 20 20 20 20 :  c64 iN 2026    
84a2 : __ __ __ BYT 2d 20 63 52 45 44 49 54 53 20 2d 20 20 63 4f 44 : - cREDITS -  cOD
84b2 : __ __ __ BYT 45 20 2d 20 6f 53 43 41 52 36 34 20 63 4f 4d 50 : E - oSCAR64 cOMP
84c2 : __ __ __ BYT 49 4c 45 52 20 62 59 20 44 52 4d 4f 52 54 41 4c : ILER bY DRMORTAL
84d2 : __ __ __ BYT 57 4f 4d 42 41 54 20 20 6d 55 53 49 43 20 2d 20 : WOMBAT  mUSIC - 
84e2 : __ __ __ BYT 66 4f 52 45 56 45 52 20 79 4f 55 4e 47 20 2d 20 : fOREVER yOUNG - 
84f2 : __ __ __ BYT 34 45 56 2e 4d 4f 44 20 20 66 4f 4e 54 20 2d 20 : 4EV.MOD  fONT - 
8502 : __ __ __ BYT 73 4d 41 4c 4c 20 72 4f 55 4e 44 20 70 65 74 73 : sMALL rOUND pets
8512 : __ __ __ BYT 63 69 69 20 66 4f 4e 54 20 62 59 20 63 55 50 49 : cii fONT bY cUPI
8522 : __ __ __ BYT 44 20 20 75 4c 54 49 4d 41 54 45 20 6c 49 42 52 : D  uLTIMATE lIBR
8532 : __ __ __ BYT 41 52 59 20 62 59 20 73 43 4f 54 54 20 68 55 54 : ARY bY sCOTT hUT
8542 : __ __ __ BYT 54 45 52 20 20 6d 4f 44 20 70 4c 41 59 45 52 20 : TER  mOD pLAYER 
8552 : __ __ __ BYT 73 4f 55 52 43 45 20 62 59 20 66 52 45 53 48 4e : sOURCE bY fRESHN
8562 : __ __ __ BYT 45 53 53 20 20 20 20 2d 20 73 50 45 43 49 41 4c : ESS    - sPECIAL
8572 : __ __ __ BYT 20 74 48 41 4e 4b 53 20 2d 20 20 67 49 44 45 4f :  tHANKS -  gIDEO
8582 : __ __ __ BYT 4e 20 7a 57 45 49 4a 54 5a 45 52 20 2d 20 63 52 : N zWEIJTZER - cR
8592 : __ __ __ BYT 45 41 54 4f 52 20 6f 46 20 74 48 45 20 75 4c 54 : EATOR oF tHE uLT
85a2 : __ __ __ BYT 49 4d 41 54 45 20 36 34 20 20 74 48 45 20 66 41 : IMATE 64  tHE fA
85b2 : __ __ __ BYT 53 54 45 53 54 20 63 36 34 20 63 4f 4d 50 41 54 : STEST c64 cOMPAT
85c2 : __ __ __ BYT 49 42 4c 45 20 6d 41 43 48 49 4e 45 20 20 20 20 : IBLE mACHINE    
85d2 : __ __ __ BYT 74 48 41 4e 4b 20 79 4f 55 20 66 4f 52 20 77 41 : tHANK yOU fOR wA
85e2 : __ __ __ BYT 54 43 48 49 4e 47 20 20 70 52 45 53 53 20 61 4e : TCHING  pRESS aN
85f2 : __ __ __ BYT 59 20 6b 45 59 20 74 4f 20 65 58 49 54 20 20 20 : Y kEY tO eXIT   
8602 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
8612 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
8622 : __ __ __ BYT 20 20 20 20 20 20 20 00                         :        .
--------------------------------------------------------------------
letter_width:
862a : __ __ __ BYT 03 03 03 03 03 03 03 04 02 03 03 03 03 03 03 03 : ................
863a : __ __ __ BYT 03 03 03 03 03 02 03 03 03 03 03 03 03 03 03 02 : ................
864a : __ __ __ BYT 03 03 01 02 03 01 05 03 03 03 03 03 03 03 03 02 : ................
865a : __ __ __ BYT 05 03 03 03 03 03 01 03 03 03 03 03 03 03 03 01 : ................
866a : __ __ __ BYT 01 01 01 01 03 01 02 03 03 03 04 03 03 04 02 02 : ................
867a : __ __ __ BYT 02 02 02 02 03 02                               : ......
--------------------------------------------------------------------
psin:
8680 : __ __ __ BYT 04 04 04 05 05 05 05 06 06 06 06 07 07 07 07 07 : ................
8690 : __ __ __ BYT 07 07 07 07 07 07 06 06 06 06 05 05 05 05 04 04 : ................
86a0 : __ __ __ BYT 04 03 03 02 02 02 02 01 01 01 01 00 00 00 00 00 : ................
86b0 : __ __ __ BYT 00 00 00 00 00 00 01 01 01 01 02 02 02 02 03 03 : ................
--------------------------------------------------------------------
pcolor:
86c0 : __ __ __ BYT 02 08 07 0d 05 03 0e 06                         : ........
--------------------------------------------------------------------
bitshift:
86c8 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
86d8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
86e8 : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
86f8 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
sin_row:
8700 : __ __ __ BYT 00 01 01 01 01 02 02 02 02 02 01 01 01 01 00 00 : ................
8710 : __ __ __ BYT ff ff ff fe fe fe fe fe fe fe ff ff ff 00 00 01 : ................
8720 : __ __ __ BYT 00 01 01 01 01 02 02 02 02 02 01 01 01 01 00 00 : ................
8730 : __ __ __ BYT ff ff ff fe fe fe fe fe fe fe ff ff ff 00 00 01 : ................
--------------------------------------------------------------------
letter_start:
8740 : __ __ __ BYT 00 03 06 09 0c 0f 12 15 19 1b 1e 21 24 00 03 06 : ...........!$...
8750 : __ __ __ BYT 09 0c 0f 12 15 18 1a 1d 20 23 00 03 06 09 0c 0f : ........ #......
8760 : __ __ __ BYT 11 14 17 18 1a 1d 1e 23 00 03 06 09 0c 0f 12 15 : .......#........
8770 : __ __ __ BYT 17 1c 1f 22 00 00 03 04 07 0a 0d 10 13 16 19 1c : ..."............
8780 : __ __ __ BYT 1d 1e 1f 20 21 24 25 00 03 06 09 0d 10 13 17 19 : ... !$%.........
8790 : __ __ __ BYT 1b 1d 1f 21 23 26                               : ...!#&
--------------------------------------------------------------------
cw:
8796 : __ __ __ BSS	12
--------------------------------------------------------------------
Screen:
87a2 : __ __ __ BSS	8
--------------------------------------------------------------------
tworks:
87aa : __ __ __ BSS	8
--------------------------------------------------------------------
mod_row_buf:
87b2 : __ __ __ BSS	16
--------------------------------------------------------------------
mx:
87c2 : __ __ __ BSS	8
--------------------------------------------------------------------
VScreen:
87ca : __ __ __ BSS	8
--------------------------------------------------------------------
py_cur:
87d2 : __ __ __ BSS	16
--------------------------------------------------------------------
px_cur:
87e2 : __ __ __ BSS	16
--------------------------------------------------------------------
insert_col:
87f2 : __ __ __ BSS	1
--------------------------------------------------------------------
fine_x:
87f3 : __ __ __ BSS	1
--------------------------------------------------------------------
wave_phase:
87f4 : __ __ __ BSS	1
--------------------------------------------------------------------
plasma_phase:
87f5 : __ __ __ BSS	1
--------------------------------------------------------------------
done:
87f6 : __ __ __ BSS	1
--------------------------------------------------------------------
loops:
87f7 : __ __ __ BSS	2
--------------------------------------------------------------------
dp_y:
87f9 : __ __ __ BSS	1
--------------------------------------------------------------------
df_x:
87fa : __ __ __ BSS	1
--------------------------------------------------------------------
df_yoff:
87fb : __ __ __ BSS	1
--------------------------------------------------------------------
df_r:
87fc : __ __ __ BSS	1
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
scr_letter:
88c8 : __ __ __ BSS	40
--------------------------------------------------------------------
HeapNode:
88f0 : __ __ __ BSS	4
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
