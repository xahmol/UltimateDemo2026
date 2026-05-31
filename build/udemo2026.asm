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
080e : 8e ff 0e STX $0eff ; (spentry + 0)
0811 : a2 97 __ LDX #$97
0813 : a0 c8 __ LDY #$c8
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 ab __ CPX #$ab
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
; 101, "/home/xahmol/git/UltimateDemo2026/src/main.c"
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
0a11 : 8d 02 a0 STA $a002 ; (modplay.order_table[0] + 63)
0a14 : a9 03 __ LDA #$03
0a16 : 8d 03 a0 STA $a003 ; (modplay.order_table[0] + 64)
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
0a36 : a9 00 __ LDA #$00
0a38 : 8d 18 03 STA $0318 
0a3b : a9 0f __ LDA #$0f
0a3d : 8d 19 03 STA $0319 
0a40 : a9 16 __ LDA #$16
0a42 : 85 16 __ STA P9 
0a44 : a9 11 __ LDA #$11
0a46 : 85 17 __ STA P10 
0a48 : 20 0b 0f JSR $0f0b ; (screen_init.s4 + 0)
0a4b : a9 c6 __ LDA #$c6
0a4d : 85 10 __ STA P3 
0a4f : a9 11 __ LDA #$11
0a51 : 85 11 __ STA P4 
0a53 : 20 3f 11 JSR $113f ; (screen_info.s4 + 0)
0a56 : a9 00 __ LDA #$00
0a58 : 8d 09 dc STA $dc09 
0a5b : 8d 08 dc STA $dc08 
0a5e : 85 56 __ STA T3 + 0 
.l5:
0a60 : 20 e7 11 JSR $11e7 ; (uii_detect.s4 + 0)
0a63 : aa __ __ TAX
0a64 : d0 07 __ BNE $0a6d ; (main.s7 + 0)
.s6:
0a66 : ad 09 dc LDA $dc09 
0a69 : c9 0a __ CMP #$0a
0a6b : 90 f3 __ BCC $0a60 ; (main.l5 + 0)
.s7:
0a6d : 20 e7 11 JSR $11e7 ; (uii_detect.s4 + 0)
0a70 : aa __ __ TAX
0a71 : d0 3b __ BNE $0aae ; (main.s9 + 0)
.s8:
0a73 : 85 12 __ STA P5 
0a75 : a9 68 __ LDA #$68
0a77 : 85 10 __ STA P3 
0a79 : a9 12 __ LDA #$12
0a7b : 85 14 __ STA P7 
0a7d : a9 12 __ LDA #$12
0a7f : 85 11 __ STA P4 
0a81 : a9 6e __ LDA #$6e
0a83 : 85 13 __ STA P6 
0a85 : 20 08 12 JSR $1208 ; (screen_result.s4 + 0)
0a88 : a9 1d __ LDA #$1d
0a8a : 85 12 __ STA P5 
0a8c : a9 13 __ LDA #$13
0a8e : 85 13 __ STA P6 
0a90 : a9 12 __ LDA #$12
0a92 : a2 e5 __ LDX #$e5
.s74:
0a94 : 86 14 __ STX P7 
0a96 : 85 15 __ STA P8 
0a98 : 20 7b 12 JSR $127b ; (screen_error_exit.s4 + 0)
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
0ab0 : 8d ff 15 STA $15ff ; (uii_target + 0)
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
0ac9 : 20 42 13 JSR $1342 ; (uii_sendcommand.s4 + 0)
0acc : 20 bd 13 JSR $13bd ; (uii_readdata.s4 + 0)
0acf : 20 ed 13 JSR $13ed ; (uii_readstatus.s4 + 0)
0ad2 : 20 4b 14 JSR $144b ; (uii_accept.s4 + 0)
0ad5 : ad c9 99 LDA $99c9 ; (uii_status[0] + 0)
0ad8 : c9 30 __ CMP #$30
0ada : d0 12 __ BNE $0aee ; (main.s10 + 0)
.s71:
0adc : ad ca 99 LDA $99ca ; (uii_status[0] + 1)
0adf : c9 30 __ CMP #$30
0ae1 : d0 0b __ BNE $0aee ; (main.s10 + 0)
.s72:
0ae3 : ad c8 97 LDA $97c8 ; (uii_data[0] + 0)
0ae6 : f0 06 __ BEQ $0aee ; (main.s10 + 0)
.s73:
0ae8 : 20 5b 14 JSR $145b ; (uci_to_upper@proxy + 0)
0aeb : 4c f9 0a JMP $0af9 ; (main.s12 + 0)
.s10:
0aee : a2 ff __ LDX #$ff
.l11:
0af0 : e8 __ __ INX
0af1 : bd 95 14 LDA $1495,x 
0af4 : 9d 93 bf STA $bf93,x ; (detail[0] + 0)
0af7 : d0 f7 __ BNE $0af0 ; (main.l11 + 0)
.s12:
0af9 : a9 68 __ LDA #$68
0afb : 85 10 __ STA P3 
0afd : a9 12 __ LDA #$12
0aff : 85 11 __ STA P4 
0b01 : 20 fc 11 JSR $11fc ; (screen_result@proxy + 0)
0b04 : 20 1d 14 JSR $141d ; (uii_get_hwinfo.s4 + 0)
0b07 : ad c9 99 LDA $99c9 ; (uii_status[0] + 0)
0b0a : c9 30 __ CMP #$30
0b0c : d0 2e __ BNE $0b3c ; (main.s13 + 0)
.s68:
0b0e : ad ca 99 LDA $99ca ; (uii_status[0] + 1)
0b11 : c9 30 __ CMP #$30
0b13 : d0 27 __ BNE $0b3c ; (main.s13 + 0)
.s69:
0b15 : 20 5b 14 JSR $145b ; (uci_to_upper@proxy + 0)
0b18 : aa __ __ TAX
0b19 : f0 21 __ BEQ $0b3c ; (main.s13 + 0)
.s70:
0b1b : a9 01 __ LDA #$01
0b1d : 85 0f __ STA P2 
0b1f : a9 14 __ LDA #$14
0b21 : 85 0e __ STA P1 
0b23 : a9 9c __ LDA #$9c
0b25 : 85 0d __ STA P0 
0b27 : 20 66 11 JSR $1166 ; (cwin_put_string.s4 + 0)
0b2a : a9 93 __ LDA #$93
0b2c : 85 0d __ STA P0 
0b2e : a9 03 __ LDA #$03
0b30 : 85 0f __ STA P2 
0b32 : a9 bf __ LDA #$bf
0b34 : 85 0e __ STA P1 
0b36 : 20 66 11 JSR $1166 ; (cwin_put_string.s4 + 0)
0b39 : 20 46 11 JSR $1146 ; (cwin_cursor_newline.s4 + 0)
.s13:
0b3c : a9 a7 __ LDA #$a7
0b3e : 85 10 __ STA P3 
0b40 : a9 14 __ LDA #$14
0b42 : 85 11 __ STA P4 
0b44 : 20 3f 11 JSR $113f ; (screen_info.s4 + 0)
0b47 : 20 b7 14 JSR $14b7 ; (detect_reu.s4 + 0)
0b4a : c9 10 __ CMP #$10
0b4c : b0 03 __ BCS $0b51 ; (main.s14 + 0)
0b4e : 4c d3 0e JMP $0ed3 ; (main.s64 + 0)
.s14:
0b51 : a9 16 __ LDA #$16
0b53 : 85 14 __ STA P7 
0b55 : a9 37 __ LDA #$37
0b57 : 85 13 __ STA P6 
0b59 : 20 f4 7f JSR $7ff4 ; (screen_result@proxy + 0)
0b5c : a9 3d __ LDA #$3d
0b5e : 85 10 __ STA P3 
0b60 : a9 16 __ LDA #$16
0b62 : 85 11 __ STA P4 
0b64 : 20 3f 11 JSR $113f ; (screen_info.s4 + 0)
0b67 : 20 54 16 JSR $1654 ; (turbo_detect.s4 + 0)
0b6a : a9 2c __ LDA #$2c
0b6c : 85 10 __ STA P3 
0b6e : a9 17 __ LDA #$17
0b70 : 85 11 __ STA P4 
0b72 : a5 1b __ LDA ACCU + 0 
0b74 : d0 1b __ BNE $0b91 ; (main.s38 + 0)
.s15:
0b76 : c6 12 __ DEC P5 
0b78 : a9 32 __ LDA #$32
0b7a : 85 13 __ STA P6 
0b7c : a9 17 __ LDA #$17
0b7e : 85 14 __ STA P7 
0b80 : 20 08 12 JSR $1208 ; (screen_result.s4 + 0)
0b83 : a9 47 __ LDA #$47
0b85 : 85 10 __ STA P3 
0b87 : a9 17 __ LDA #$17
0b89 : 85 11 __ STA P4 
0b8b : 20 ca 12 JSR $12ca ; (screen_hint.s4 + 0)
0b8e : 4c 32 0c JMP $0c32 ; (main.s16 + 0)
.s38:
0b91 : c9 02 __ CMP #$02
0b93 : d0 14 __ BNE $0ba9 ; (main.s39 + 0)
.s63:
0b95 : a9 17 __ LDA #$17
0b97 : a2 69 __ LDX #$69
.s40:
0b99 : 86 53 __ STX T0 + 0 
0b9b : 85 54 __ STA T0 + 1 
0b9d : a9 93 __ LDA #$93
0b9f : 85 13 __ STA P6 
0ba1 : a9 bf __ LDA #$bf
0ba3 : 85 14 __ STA P7 
0ba5 : a0 ff __ LDY #$ff
0ba7 : d0 7e __ BNE $0c27 ; (main.l41 + 0)
.s39:
0ba9 : c9 01 __ CMP #$01
0bab : f0 07 __ BEQ $0bb4 ; (main.s43 + 0)
.s75:
0bad : a9 17 __ LDA #$17
0baf : a2 2c __ LDX #$2c
0bb1 : 4c 99 0b JMP $0b99 ; (main.s40 + 0)
.s43:
0bb4 : 20 70 17 JSR $1770 ; (turbo_get.s3 + 0)
0bb7 : 29 0f __ AND #$0f
0bb9 : c9 0e __ CMP #$0e
0bbb : d0 07 __ BNE $0bc4 ; (main.s44 + 0)
.s62:
0bbd : a9 17 __ LDA #$17
0bbf : a2 74 __ LDX #$74
0bc1 : 4c 99 0b JMP $0b99 ; (main.s40 + 0)
.s44:
0bc4 : c9 0d __ CMP #$0d
0bc6 : d0 07 __ BNE $0bcf ; (main.s45 + 0)
.s61:
0bc8 : a9 17 __ LDA #$17
0bca : a2 7b __ LDX #$7b
0bcc : 4c 99 0b JMP $0b99 ; (main.s40 + 0)
.s45:
0bcf : c9 0c __ CMP #$0c
0bd1 : d0 07 __ BNE $0bda ; (main.s46 + 0)
.s60:
0bd3 : a9 17 __ LDA #$17
0bd5 : a2 82 __ LDX #$82
0bd7 : 4c 99 0b JMP $0b99 ; (main.s40 + 0)
.s46:
0bda : c9 0b __ CMP #$0b
0bdc : d0 07 __ BNE $0be5 ; (main.s47 + 0)
.s59:
0bde : a9 17 __ LDA #$17
0be0 : a2 89 __ LDX #$89
0be2 : 4c 99 0b JMP $0b99 ; (main.s40 + 0)
.s47:
0be5 : c9 0a __ CMP #$0a
0be7 : d0 07 __ BNE $0bf0 ; (main.s48 + 0)
.s58:
0be9 : a9 17 __ LDA #$17
0beb : a2 90 __ LDX #$90
0bed : 4c 99 0b JMP $0b99 ; (main.s40 + 0)
.s48:
0bf0 : c9 09 __ CMP #$09
0bf2 : d0 07 __ BNE $0bfb ; (main.s49 + 0)
.s57:
0bf4 : a9 17 __ LDA #$17
0bf6 : a2 97 __ LDX #$97
0bf8 : 4c 99 0b JMP $0b99 ; (main.s40 + 0)
.s49:
0bfb : c9 08 __ CMP #$08
0bfd : d0 07 __ BNE $0c06 ; (main.s50 + 0)
.s56:
0bff : a9 17 __ LDA #$17
0c01 : a2 9e __ LDX #$9e
0c03 : 4c 99 0b JMP $0b99 ; (main.s40 + 0)
.s50:
0c06 : c9 07 __ CMP #$07
0c08 : d0 07 __ BNE $0c11 ; (main.s51 + 0)
.s55:
0c0a : a9 17 __ LDA #$17
0c0c : a2 a5 __ LDX #$a5
0c0e : 4c 99 0b JMP $0b99 ; (main.s40 + 0)
.s51:
0c11 : c9 06 __ CMP #$06
0c13 : d0 07 __ BNE $0c1c ; (main.s52 + 0)
.s54:
0c15 : a9 17 __ LDA #$17
0c17 : a2 ac __ LDX #$ac
0c19 : 4c 99 0b JMP $0b99 ; (main.s40 + 0)
.s52:
0c1c : c9 05 __ CMP #$05
0c1e : d0 8d __ BNE $0bad ; (main.s75 + 0)
.s53:
0c20 : a9 17 __ LDA #$17
0c22 : a2 b3 __ LDX #$b3
0c24 : 4c 99 0b JMP $0b99 ; (main.s40 + 0)
.l41:
0c27 : c8 __ __ INY
0c28 : b1 53 __ LDA (T0 + 0),y 
0c2a : 99 93 bf STA $bf93,y ; (detail[0] + 0)
0c2d : d0 f8 __ BNE $0c27 ; (main.l41 + 0)
.s42:
0c2f : 20 08 12 JSR $1208 ; (screen_result.s4 + 0)
.s16:
0c32 : a9 b9 __ LDA #$b9
0c34 : 85 10 __ STA P3 
0c36 : a9 17 __ LDA #$17
0c38 : 85 11 __ STA P4 
0c3a : 20 3f 11 JSR $113f ; (screen_info.s4 + 0)
0c3d : 20 d4 17 JSR $17d4 ; (audio_detect.s4 + 0)
0c40 : aa __ __ TAX
0c41 : f0 03 __ BEQ $0c46 ; (main.s17 + 0)
0c43 : 4c d8 0d JMP $0dd8 ; (main.s28 + 0)
.s17:
0c46 : a9 4d __ LDA #$4d
0c48 : 85 10 __ STA P3 
0c4a : a9 18 __ LDA #$18
0c4c : 85 11 __ STA P4 
0c4e : a9 53 __ LDA #$53
0c50 : 85 13 __ STA P6 
0c52 : a9 18 __ LDA #$18
0c54 : 85 14 __ STA P7 
0c56 : a9 18 __ LDA #$18
0c58 : a2 64 __ LDX #$64
.s18:
0c5a : 86 53 __ STX T0 + 0 
0c5c : 85 54 __ STA T0 + 1 
0c5e : a9 00 __ LDA #$00
0c60 : 85 12 __ STA P5 
0c62 : 20 08 12 JSR $1208 ; (screen_result.s4 + 0)
0c65 : a5 53 __ LDA T0 + 0 
0c67 : 85 10 __ STA P3 
0c69 : a5 54 __ LDA T0 + 1 
0c6b : 85 11 __ STA P4 
0c6d : 20 ca 12 JSR $12ca ; (screen_hint.s4 + 0)
.s19:
0c70 : 20 46 11 JSR $1146 ; (cwin_cursor_newline.s4 + 0)
0c73 : a9 48 __ LDA #$48
0c75 : 85 10 __ STA P3 
0c77 : a9 20 __ LDA #$20
0c79 : 85 11 __ STA P4 
0c7b : 20 3f 11 JSR $113f ; (screen_info.s4 + 0)
0c7e : 20 46 11 JSR $1146 ; (cwin_cursor_newline.s4 + 0)
0c81 : a9 cc __ LDA #$cc
0c83 : 85 10 __ STA P3 
0c85 : a9 20 __ LDA #$20
0c87 : 85 11 __ STA P4 
0c89 : 20 5c 20 JSR $205c ; (screen_wait_key.s4 + 0)
0c8c : 20 ed 20 JSR $20ed ; (gears_run.s1 + 0)
0c8f : a5 56 __ LDA T3 + 0 
0c91 : f0 03 __ BEQ $0c96 ; (main.s20 + 0)
.s27:
0c93 : 20 ac 41 JSR $41ac ; (modplay_start.s4 + 0)
.s20:
0c96 : 20 21 51 JSR $5121 ; (mandel_run.s4 + 0)
0c99 : 20 df 55 JSR $55df ; (ball_run.s1 + 0)
0c9c : 20 ef 63 JSR $63ef ; (vectors_run.s1 + 0)
0c9f : 20 ef 68 JSR $68ef ; (plasma_run.s1 + 0)
0ca2 : 20 aa 6b JSR $6baa ; (tunnel_run.s1 + 0)
0ca5 : a9 10 __ LDA #$10
0ca7 : 8d 02 a0 STA $a002 ; (modplay.order_table[0] + 63)
0caa : a9 03 __ LDA #$03
0cac : 8d 03 a0 STA $a003 ; (modplay.order_table[0] + 64)
0caf : 20 39 71 JSR $7139 ; (flower_run.s1 + 0)
0cb2 : 20 c2 74 JSR $74c2 ; (scroller_run.s4 + 0)
0cb5 : a5 56 __ LDA T3 + 0 
0cb7 : f0 03 __ BEQ $0cbc ; (main.s21 + 0)
.s26:
0cb9 : 20 d4 79 JSR $79d4 ; (modplay_stop.s4 + 0)
.s21:
0cbc : a9 00 __ LDA #$00
0cbe : 85 c6 __ STA $c6 
0cc0 : 20 90 16 JSR $1690 ; (turbo_set.s4 + 0)
0cc3 : a9 0d __ LDA #$0d
0cc5 : 85 16 __ STA P9 
0cc7 : a9 7a __ LDA #$7a
0cc9 : 85 17 __ STA P10 
0ccb : 20 0b 0f JSR $0f0b ; (screen_init.s4 + 0)
0cce : 20 46 11 JSR $1146 ; (cwin_cursor_newline.s4 + 0)
0cd1 : a9 22 __ LDA #$22
0cd3 : 85 10 __ STA P3 
0cd5 : a9 7a __ LDA #$7a
0cd7 : 85 11 __ STA P4 
0cd9 : 20 3f 11 JSR $113f ; (screen_info.s4 + 0)
0cdc : a9 01 __ LDA #$01
0cde : 85 12 __ STA P5 
0ce0 : 20 46 11 JSR $1146 ; (cwin_cursor_newline.s4 + 0)
0ce3 : a9 3a __ LDA #$3a
0ce5 : 85 10 __ STA P3 
0ce7 : a9 7a __ LDA #$7a
0ce9 : 85 14 __ STA P7 
0ceb : a9 7a __ LDA #$7a
0ced : 85 11 __ STA P4 
0cef : a9 40 __ LDA #$40
0cf1 : 85 13 __ STA P6 
0cf3 : 20 08 12 JSR $1208 ; (screen_result.s4 + 0)
0cf6 : a9 56 __ LDA #$56
0cf8 : 85 10 __ STA P3 
0cfa : a9 7a __ LDA #$7a
0cfc : 85 14 __ STA P7 
0cfe : a9 7a __ LDA #$7a
0d00 : 85 11 __ STA P4 
0d02 : a9 5c __ LDA #$5c
0d04 : 85 13 __ STA P6 
0d06 : 20 08 12 JSR $1208 ; (screen_result.s4 + 0)
0d09 : a9 72 __ LDA #$72
0d0b : 85 10 __ STA P3 
0d0d : a9 7a __ LDA #$7a
0d0f : 85 14 __ STA P7 
0d11 : a9 7a __ LDA #$7a
0d13 : 85 11 __ STA P4 
0d15 : a9 78 __ LDA #$78
0d17 : 85 13 __ STA P6 
0d19 : 20 08 12 JSR $1208 ; (screen_result.s4 + 0)
0d1c : a9 87 __ LDA #$87
0d1e : 85 10 __ STA P3 
0d20 : a9 7a __ LDA #$7a
0d22 : 85 14 __ STA P7 
0d24 : a9 7a __ LDA #$7a
0d26 : 85 11 __ STA P4 
0d28 : a9 8d __ LDA #$8d
0d2a : 85 13 __ STA P6 
0d2c : 20 08 12 JSR $1208 ; (screen_result.s4 + 0)
0d2f : a9 9f __ LDA #$9f
0d31 : 85 10 __ STA P3 
0d33 : a9 7a __ LDA #$7a
0d35 : 85 14 __ STA P7 
0d37 : a9 7a __ LDA #$7a
0d39 : 85 11 __ STA P4 
0d3b : a9 a5 __ LDA #$a5
0d3d : 85 13 __ STA P6 
0d3f : 20 08 12 JSR $1208 ; (screen_result.s4 + 0)
0d42 : a9 b9 __ LDA #$b9
0d44 : 85 10 __ STA P3 
0d46 : a9 7a __ LDA #$7a
0d48 : 85 14 __ STA P7 
0d4a : a9 7a __ LDA #$7a
0d4c : 85 11 __ STA P4 
0d4e : a9 bf __ LDA #$bf
0d50 : 85 13 __ STA P6 
0d52 : 20 08 12 JSR $1208 ; (screen_result.s4 + 0)
0d55 : a9 d1 __ LDA #$d1
0d57 : 85 10 __ STA P3 
0d59 : a9 7a __ LDA #$7a
0d5b : 85 14 __ STA P7 
0d5d : a9 7a __ LDA #$7a
0d5f : 85 11 __ STA P4 
0d61 : a9 d7 __ LDA #$d7
0d63 : 85 13 __ STA P6 
0d65 : 20 08 12 JSR $1208 ; (screen_result.s4 + 0)
0d68 : a9 ea __ LDA #$ea
0d6a : 85 10 __ STA P3 
0d6c : a9 7b __ LDA #$7b
0d6e : 85 14 __ STA P7 
0d70 : a9 7a __ LDA #$7a
0d72 : 85 11 __ STA P4 
0d74 : a9 00 __ LDA #$00
0d76 : 85 13 __ STA P6 
0d78 : 20 08 12 JSR $1208 ; (screen_result.s4 + 0)
0d7b : a5 56 __ LDA T3 + 0 
0d7d : f0 13 __ BEQ $0d92 ; (main.s22 + 0)
.s25:
0d7f : a9 00 __ LDA #$00
0d81 : 85 10 __ STA P3 
0d83 : a9 7b __ LDA #$7b
0d85 : 85 14 __ STA P7 
0d87 : a9 20 __ LDA #$20
0d89 : 85 11 __ STA P4 
0d8b : a9 16 __ LDA #$16
0d8d : 85 13 __ STA P6 
0d8f : 20 08 12 JSR $1208 ; (screen_result.s4 + 0)
.s22:
0d92 : 20 46 11 JSR $1146 ; (cwin_cursor_newline.s4 + 0)
0d95 : a9 2d __ LDA #$2d
0d97 : 85 10 __ STA P3 
0d99 : a9 7b __ LDA #$7b
0d9b : 85 11 __ STA P4 
0d9d : 20 3f 11 JSR $113f ; (screen_info.s4 + 0)
0da0 : a9 4a __ LDA #$4a
0da2 : 85 10 __ STA P3 
0da4 : a9 7b __ LDA #$7b
0da6 : 85 11 __ STA P4 
0da8 : 20 3f 11 JSR $113f ; (screen_info.s4 + 0)
0dab : 20 46 11 JSR $1146 ; (cwin_cursor_newline.s4 + 0)
0dae : a9 00 __ LDA #$00
0db0 : 85 10 __ STA P3 
0db2 : 85 11 __ STA P4 
0db4 : 20 5c 20 JSR $205c ; (screen_wait_key.s4 + 0)
.l23:
0db7 : a2 00 __ LDX #$00
0db9 : 8e 00 dc STX $dc00 
0dbc : ad 01 dc LDA $dc01 
0dbf : c9 ff __ CMP #$ff
0dc1 : d0 f4 __ BNE $0db7 ; (main.l23 + 0)
.s24:
0dc3 : 8d 00 dc STA $dc00 
0dc6 : 86 c6 __ STX $c6 
0dc8 : 86 1b __ STX ACCU + 0 
0dca : a9 0e __ LDA #$0e
0dcc : 8d 20 d0 STA $d020 
0dcf : a9 06 __ LDA #$06
0dd1 : 8d 21 d0 STA $d021 
0dd4 : 8a __ __ TXA
0dd5 : 4c a1 0a JMP $0aa1 ; (main.s3 + 0)
.s28:
0dd8 : ad 21 df LDA $df21 
0ddb : 85 55 __ STA T2 + 0 
0ddd : 85 0f __ STA P2 
0ddf : a9 8f __ LDA #$8f
0de1 : 85 0d __ STA P0 
0de3 : a9 bf __ LDA #$bf
0de5 : 85 0e __ STA P1 
0de7 : 20 83 18 JSR $1883 ; (fmt_dec.s4 + 0)
0dea : a9 93 __ LDA #$93
0dec : 85 0d __ STA P0 
0dee : a9 bf __ LDA #$bf
0df0 : 85 0e __ STA P1 
0df2 : a9 8f __ LDA #$8f
0df4 : 85 0f __ STA P2 
0df6 : a9 bf __ LDA #$bf
0df8 : 85 10 __ STA P3 
0dfa : a2 ff __ LDX #$ff
.l29:
0dfc : e8 __ __ INX
0dfd : bd fd 0e LDA $0efd,x 
0e00 : 9d 93 bf STA $bf93,x ; (detail[0] + 0)
0e03 : d0 f7 __ BNE $0dfc ; (main.l29 + 0)
.s30:
0e05 : 20 d3 18 JSR $18d3 ; (strcat.s4 + 0)
0e08 : a9 18 __ LDA #$18
0e0a : 85 11 __ STA P4 
0e0c : a9 4d __ LDA #$4d
0e0e : 85 10 __ STA P3 
0e10 : 20 fc 11 JSR $11fc ; (screen_result@proxy + 0)
0e13 : a5 55 __ LDA T2 + 0 
0e15 : d0 03 __ BNE $0e1a ; (main.s31 + 0)
0e17 : 4c 70 0c JMP $0c70 ; (main.s19 + 0)
.s31:
0e1a : a9 00 __ LDA #$00
0e1c : 8d 3e bf STA $bf3e ; (media_count + 0)
0e1f : a9 06 __ LDA #$06
0e21 : 85 10 __ STA P3 
0e23 : a9 19 __ LDA #$19
0e25 : 85 11 __ STA P4 
0e27 : 20 3f 11 JSR $113f ; (screen_info.s4 + 0)
0e2a : a9 00 __ LDA #$00
0e2c : 85 10 __ STA P3 
0e2e : 8d 12 bf STA $bf12 ; (cmd[0] + 0)
0e31 : a9 02 __ LDA #$02
0e33 : 85 0f __ STA P2 
0e35 : a9 01 __ LDA #$01
0e37 : 8d ff 15 STA $15ff ; (uii_target + 0)
0e3a : a9 17 __ LDA #$17
0e3c : 8d 13 bf STA $bf13 ; (cmd[0] + 1)
0e3f : a9 12 __ LDA #$12
0e41 : 85 0d __ STA P0 
0e43 : a9 bf __ LDA #$bf
0e45 : 85 0e __ STA P1 
0e47 : 20 42 13 JSR $1342 ; (uii_sendcommand.s4 + 0)
0e4a : 20 ed 13 JSR $13ed ; (uii_readstatus.s4 + 0)
0e4d : 20 4b 14 JSR $144b ; (uii_accept.s4 + 0)
0e50 : 20 17 19 JSR $1917 ; (modplay_load.s4 + 0)
0e53 : a5 1b __ LDA ACCU + 0 
0e55 : d0 45 __ BNE $0e9c ; (main.s35 + 0)
.s32:
0e57 : a9 3f __ LDA #$3f
0e59 : 85 13 __ STA P6 
0e5b : a9 bf __ LDA #$bf
0e5d : 85 16 __ STA P9 
0e5f : a9 bf __ LDA #$bf
0e61 : 85 14 __ STA P7 
0e63 : a9 3e __ LDA #$3e
0e65 : 85 15 __ STA P8 
0e67 : 20 5e 1a JSR $1a5e ; (uii_scan_media.s4 + 0)
0e6a : ad 3e bf LDA $bf3e ; (media_count + 0)
0e6d : 85 15 __ STA P8 
0e6f : a9 16 __ LDA #$16
0e71 : 85 16 __ STA P9 
0e73 : a9 bf __ LDA #$bf
0e75 : 85 17 __ STA P10 
0e77 : 20 55 1c JSR $1c55 ; (uii_find_media_path.s4 + 0)
0e7a : a5 1b __ LDA ACCU + 0 
0e7c : f0 07 __ BEQ $0e85 ; (main.s33 + 0)
.s34:
0e7e : 20 17 19 JSR $1917 ; (modplay_load.s4 + 0)
0e81 : a5 1b __ LDA ACCU + 0 
0e83 : d0 17 __ BNE $0e9c ; (main.s35 + 0)
.s33:
0e85 : a9 00 __ LDA #$00
0e87 : 85 10 __ STA P3 
0e89 : a9 20 __ LDA #$20
0e8b : 85 11 __ STA P4 
0e8d : a9 1d __ LDA #$1d
0e8f : 85 13 __ STA P6 
0e91 : a9 20 __ LDA #$20
0e93 : 85 14 __ STA P7 
0e95 : a9 20 __ LDA #$20
0e97 : a2 27 __ LDX #$27
0e99 : 4c 5a 0c JMP $0c5a ; (main.s18 + 0)
.s35:
0e9c : 20 3c 1d JSR $1d3c ; (modplay_init.s4 + 0)
0e9f : a9 00 __ LDA #$00
0ea1 : 85 10 __ STA P3 
0ea3 : a9 20 __ LDA #$20
0ea5 : 85 11 __ STA P4 
0ea7 : a5 1b __ LDA ACCU + 0 
0ea9 : d0 09 __ BNE $0eb4 ; (main.s37 + 0)
.s36:
0eab : 85 12 __ STA P5 
0ead : a9 20 __ LDA #$20
0eaf : a2 0e __ LDX #$0e
0eb1 : 4c c9 0e JMP $0ec9 ; (main.s76 + 0)
.s37:
0eb4 : a9 01 __ LDA #$01
0eb6 : e6 56 __ INC T3 + 0 
0eb8 : 85 12 __ STA P5 
0eba : 8d 4b a0 STA $a04b ; (modplay.stereo + 0)
0ebd : 8d 4d a0 STA $a04d ; (modplay.loop_song + 0)
0ec0 : a9 a0 __ LDA #$a0
0ec2 : 8d 4a a0 STA $a04a ; (modplay.master_volume + 0)
0ec5 : a9 20 __ LDA #$20
0ec7 : a2 06 __ LDX #$06
.s76:
0ec9 : 86 13 __ STX P6 
0ecb : 85 14 __ STA P7 
0ecd : 20 08 12 JSR $1208 ; (screen_result.s4 + 0)
0ed0 : 4c 70 0c JMP $0c70 ; (main.s19 + 0)
.s64:
0ed3 : a2 00 __ LDX #$00
0ed5 : 86 12 __ STX P5 
0ed7 : aa __ __ TAX
0ed8 : f0 06 __ BEQ $0ee0 ; (main.s65 + 0)
.s67:
0eda : a9 15 __ LDA #$15
0edc : a2 e8 __ LDX #$e8
0ede : 90 04 __ BCC $0ee4 ; (main.s66 + 0)
.s65:
0ee0 : a9 12 __ LDA #$12
0ee2 : a2 6e __ LDX #$6e
.s66:
0ee4 : 86 13 __ STX P6 
0ee6 : 85 14 __ STA P7 
0ee8 : 20 f4 7f JSR $7ff4 ; (screen_result@proxy + 0)
0eeb : a9 00 __ LDA #$00
0eed : 85 12 __ STA P5 
0eef : a9 16 __ LDA #$16
0ef1 : 85 13 __ STA P6 
0ef3 : a9 16 __ LDA #$16
0ef5 : a2 17 __ LDX #$17
0ef7 : 4c 94 0a JMP $0a94 ; (main.s74 + 0)
--------------------------------------------------------------------
0efa : __ __ __ BYT 20 20 00                                        :   .
--------------------------------------------------------------------
0efd : __ __ __ BYT 56 00                                           : V.
--------------------------------------------------------------------
spentry:
0eff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
nmi_handler: ; nmi_handler()->void
;  96, "/home/xahmol/git/UltimateDemo2026/src/main.c"
.s1:
0f00 : 48 __ __ PHA
0f01 : 8a __ __ TXA
0f02 : 48 __ __ PHA
0f03 : 98 __ __ TYA
0f04 : 48 __ __ PHA
.s3:
0f05 : 68 __ __ PLA
0f06 : a8 __ __ TAY
0f07 : 68 __ __ PLA
0f08 : aa __ __ TAX
0f09 : 68 __ __ PLA
0f0a : 40 __ __ RTI
--------------------------------------------------------------------
screen_init: ; screen_init(const u8*)->void
;  13, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
0f0b : a9 00 __ LDA #$00
0f0d : 85 0d __ STA P0 
0f0f : 85 43 __ STA T0 + 0 
0f11 : 85 0e __ STA P1 
0f13 : 85 10 __ STA P3 
0f15 : 20 b0 0f JSR $0fb0 ; (vic_setmode@proxy + 0)
0f18 : a9 00 __ LDA #$00
0f1a : 8d eb 87 STA $87eb ; (cw.sx + 0)
0f1d : 8d ec 87 STA $87ec ; (cw.sy + 0)
0f20 : 8d ef 87 STA $87ef ; (cw.cx + 0)
0f23 : 8d f0 87 STA $87f0 ; (cw.cy + 0)
0f26 : a2 19 __ LDX #$19
0f28 : 8e ee 87 STX $87ee ; (cw.wy + 0)
0f2b : 8d 20 d0 STA $d020 
0f2e : 8d 21 d0 STA $d021 
0f31 : 8d f3 87 STA $87f3 ; (cw.sp + 0)
0f34 : 8d f5 87 STA $87f5 ; (cw.cp + 0)
0f37 : a9 04 __ LDA #$04
0f39 : 8d f4 87 STA $87f4 ; (cw.sp + 1)
0f3c : 85 44 __ STA T0 + 1 
0f3e : a9 d8 __ LDA #$d8
0f40 : 8d f6 87 STA $87f6 ; (cw.cp + 1)
0f43 : 85 46 __ STA T1 + 1 
0f45 : a2 00 __ LDX #$00
0f47 : 86 45 __ STX T1 + 0 
0f49 : a9 28 __ LDA #$28
0f4b : 8d ed 87 STA $87ed ; (cw.wx + 0)
.l8:
0f4e : 85 1b __ STA ACCU + 0 
0f50 : a0 00 __ LDY #$00
.l9:
0f52 : a9 20 __ LDA #$20
0f54 : 91 43 __ STA (T0 + 0),y 
0f56 : a9 01 __ LDA #$01
0f58 : 91 45 __ STA (T1 + 0),y 
0f5a : c8 __ __ INY
0f5b : c4 1b __ CPY ACCU + 0 
0f5d : 90 f3 __ BCC $0f52 ; (screen_init.l9 + 0)
.l6:
0f5f : e8 __ __ INX
0f60 : ec ee 87 CPX $87ee ; (cw.wy + 0)
0f63 : 90 2f __ BCC $0f94 ; (screen_init.s5 + 0)
.s7:
0f65 : a9 00 __ LDA #$00
0f67 : 85 12 __ STA P5 
0f69 : a9 11 __ LDA #$11
0f6b : 85 14 __ STA P7 
0f6d : a9 05 __ LDA #$05
0f6f : 85 15 __ STA P8 
0f71 : a9 05 __ LDA #$05
0f73 : 85 13 __ STA P6 
0f75 : 20 0a 10 JSR $100a ; (header_line.s4 + 0)
0f78 : e6 12 __ INC P5 
0f7a : a5 16 __ LDA P9 ; (title + 0)
0f7c : 85 13 __ STA P6 
0f7e : a5 17 __ LDA P10 ; (title + 1)
0f80 : 85 14 __ STA P7 
0f82 : a9 0d __ LDA #$0d
0f84 : 85 15 __ STA P8 
0f86 : 20 0a 10 JSR $100a ; (header_line.s4 + 0)
0f89 : a9 00 __ LDA #$00
0f8b : 8d ef 87 STA $87ef ; (cw.cx + 0)
0f8e : a9 03 __ LDA #$03
0f90 : 8d f0 87 STA $87f0 ; (cw.cy + 0)
.s3:
0f93 : 60 __ __ RTS
.s5:
0f94 : a5 43 __ LDA T0 + 0 
0f96 : 69 28 __ ADC #$28
0f98 : 85 43 __ STA T0 + 0 
0f9a : 90 03 __ BCC $0f9f ; (screen_init.s11 + 0)
.s10:
0f9c : e6 44 __ INC T0 + 1 
0f9e : 18 __ __ CLC
.s11:
0f9f : a5 45 __ LDA T1 + 0 
0fa1 : 69 28 __ ADC #$28
0fa3 : 85 45 __ STA T1 + 0 
0fa5 : 90 02 __ BCC $0fa9 ; (screen_init.s13 + 0)
.s12:
0fa7 : e6 46 __ INC T1 + 1 
.s13:
0fa9 : ad ed 87 LDA $87ed ; (cw.wx + 0)
0fac : f0 b1 __ BEQ $0f5f ; (screen_init.l6 + 0)
0fae : d0 9e __ BNE $0f4e ; (screen_init.l8 + 0)
--------------------------------------------------------------------
vic_setmode@proxy: ; vic_setmode@proxy
0fb0 : a9 04 __ LDA #$04
0fb2 : 85 0f __ STA P2 
0fb4 : a9 18 __ LDA #$18
0fb6 : 85 11 __ STA P4 
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  97, "/home/xahmol/oscar64/include/c64/vic.h"
.s4:
0fb8 : a4 0d __ LDY P0 ; (mode + 0)
0fba : c0 02 __ CPY #$02
0fbc : d0 09 __ BNE $0fc7 ; (vic_setmode.s5 + 0)
.s10:
0fbe : a9 5b __ LDA #$5b
0fc0 : 8d 11 d0 STA $d011 
.s8:
0fc3 : a9 08 __ LDA #$08
0fc5 : d0 0c __ BNE $0fd3 ; (vic_setmode.s7 + 0)
.s5:
0fc7 : b0 36 __ BCS $0fff ; (vic_setmode.s6 + 0)
.s9:
0fc9 : a9 1b __ LDA #$1b
0fcb : 8d 11 d0 STA $d011 
0fce : 98 __ __ TYA
0fcf : f0 f2 __ BEQ $0fc3 ; (vic_setmode.s8 + 0)
.s11:
0fd1 : a9 18 __ LDA #$18
.s7:
0fd3 : 8d 16 d0 STA $d016 
0fd6 : ad 00 dd LDA $dd00 
0fd9 : 29 fc __ AND #$fc
0fdb : 85 1b __ STA ACCU + 0 
0fdd : a5 0f __ LDA P2 ; (text + 1)
0fdf : 0a __ __ ASL
0fe0 : 2a __ __ ROL
0fe1 : 29 01 __ AND #$01
0fe3 : 2a __ __ ROL
0fe4 : 49 03 __ EOR #$03
0fe6 : 05 1b __ ORA ACCU + 0 
0fe8 : 8d 00 dd STA $dd00 
0feb : a5 0f __ LDA P2 ; (text + 1)
0fed : 29 3c __ AND #$3c
0fef : 0a __ __ ASL
0ff0 : 0a __ __ ASL
0ff1 : 85 1b __ STA ACCU + 0 
0ff3 : a5 11 __ LDA P4 ; (font + 1)
0ff5 : 29 38 __ AND #$38
0ff7 : 4a __ __ LSR
0ff8 : 4a __ __ LSR
0ff9 : 05 1b __ ORA ACCU + 0 
0ffb : 8d 18 d0 STA $d018 
.s3:
0ffe : 60 __ __ RTS
.s6:
0fff : a9 3b __ LDA #$3b
1001 : 8d 11 d0 STA $d011 
1004 : c0 03 __ CPY #$03
1006 : d0 c9 __ BNE $0fd1 ; (vic_setmode.s11 + 0)
1008 : f0 b9 __ BEQ $0fc3 ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
header_line: ; header_line(u8,const u8*,u8)->void
;  33, "/home/xahmol/git/UltimateDemo2026/src/screen.c"
.s4:
100a : a5 13 __ LDA P6 ; (text + 0)
100c : 85 0d __ STA P0 
100e : a5 14 __ LDA P7 ; (text + 1)
1010 : 85 0e __ STA P1 
1012 : 20 e9 10 JSR $10e9 ; (strlen.s4 + 0)
1015 : a5 12 __ LDA P5 ; (row + 0)
1017 : 0a __ __ ASL
1018 : aa __ __ TAX
1019 : ad f3 87 LDA $87f3 ; (cw.sp + 0)
101c : 7d 93 80 ADC $8093,x ; (mul40[0] + 0)
101f : 85 46 __ STA T2 + 0 
1021 : ad f4 87 LDA $87f4 ; (cw.sp + 1)
1024 : 7d 94 80 ADC $8094,x ; (mul40[0] + 1)
1027 : 85 47 __ STA T2 + 1 
1029 : ad f5 87 LDA $87f5 ; (cw.cp + 0)
102c : 18 __ __ CLC
102d : 7d 93 80 ADC $8093,x ; (mul40[0] + 0)
1030 : 85 48 __ STA T3 + 0 
1032 : ad f6 87 LDA $87f6 ; (cw.cp + 1)
1035 : 7d 94 80 ADC $8094,x ; (mul40[0] + 1)
1038 : 85 49 __ STA T3 + 1 
103a : 38 __ __ SEC
103b : a9 28 __ LDA #$28
103d : e5 1b __ SBC ACCU + 0 
103f : a8 __ __ TAY
1040 : a9 00 __ LDA #$00
1042 : e9 00 __ SBC #$00
1044 : aa __ __ TAX
1045 : 0a __ __ ASL
1046 : 98 __ __ TYA
1047 : 69 00 __ ADC #$00
1049 : 85 45 __ STA T1 + 0 
104b : 8a __ __ TXA
104c : 69 00 __ ADC #$00
104e : 4a __ __ LSR
104f : 66 45 __ ROR T1 + 0 
1051 : a0 00 __ LDY #$00
1053 : a6 15 __ LDX P8 ; (color + 0)
.l8:
1055 : a9 a0 __ LDA #$a0
1057 : 91 46 __ STA (T2 + 0),y 
1059 : 8a __ __ TXA
105a : 91 48 __ STA (T3 + 0),y 
105c : c8 __ __ INY
105d : c0 28 __ CPY #$28
105f : d0 f4 __ BNE $1055 ; (header_line.l8 + 0)
.s9:
1061 : a9 00 __ LDA #$00
1063 : 85 4a __ STA T4 + 0 
1065 : a5 1b __ LDA ACCU + 0 
1067 : f0 1f __ BEQ $1088 ; (header_line.s5 + 0)
.s10:
1069 : a0 00 __ LDY #$00
.l7:
106b : b1 13 __ LDA (P6),y ; (text + 0)
106d : 4a __ __ LSR
106e : 4a __ __ LSR
106f : 4a __ __ LSR
1070 : 4a __ __ LSR
1071 : 4a __ __ LSR
1072 : aa __ __ TAX
1073 : bd c5 80 LDA $80c5,x ; (p2smap[0] + 0)
1076 : 51 13 __ EOR (P6),y ; (text + 0)
1078 : 09 80 __ ORA #$80
107a : 99 c1 bf STA $bfc1,y ; (buf[0] + 0)
107d : c8 __ __ INY
107e : c4 1b __ CPY ACCU + 0 
1080 : b0 04 __ BCS $1086 ; (header_line.s11 + 0)
.s6:
1082 : c0 28 __ CPY #$28
1084 : 90 e5 __ BCC $106b ; (header_line.l7 + 0)
.s11:
1086 : 84 4a __ STY T4 + 0 
.s5:
1088 : a5 45 __ LDA T1 + 0 
108a : 85 0d __ STA P0 
108c : a5 12 __ LDA P5 ; (row + 0)
108e : 85 0e __ STA P1 
1090 : a5 15 __ LDA P8 ; (color + 0)
1092 : 85 11 __ STA P4 
1094 : a9 00 __ LDA #$00
1096 : a6 4a __ LDX T4 + 0 
1098 : 9d c1 bf STA $bfc1,x ; (buf[0] + 0)
109b : a9 c1 __ LDA #$c1
109d : 85 0f __ STA P2 
109f : a9 bf __ LDA #$bf
10a1 : 85 10 __ STA P3 
--------------------------------------------------------------------
cwin_putat_string_raw: ; cwin_putat_string_raw(struct CharWin*,u8,u8,const u8*,u8)->void
; 103, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
10a3 : a5 0e __ LDA P1 ; (y + 0)
10a5 : 0a __ __ ASL
10a6 : aa __ __ TAX
10a7 : bd 93 80 LDA $8093,x ; (mul40[0] + 0)
10aa : 65 0d __ ADC P0 ; (x + 0)
10ac : 85 1b __ STA ACCU + 0 
10ae : bd 94 80 LDA $8094,x ; (mul40[0] + 1)
10b1 : 69 00 __ ADC #$00
10b3 : 85 1c __ STA ACCU + 1 
10b5 : ad f3 87 LDA $87f3 ; (cw.sp + 0)
10b8 : 65 1b __ ADC ACCU + 0 
10ba : 85 43 __ STA T1 + 0 
10bc : ad f4 87 LDA $87f4 ; (cw.sp + 1)
10bf : 65 1c __ ADC ACCU + 1 
10c1 : 85 44 __ STA T1 + 1 
10c3 : ad f5 87 LDA $87f5 ; (cw.cp + 0)
10c6 : 18 __ __ CLC
10c7 : 65 1b __ ADC ACCU + 0 
10c9 : 85 1b __ STA ACCU + 0 
10cb : ad f6 87 LDA $87f6 ; (cw.cp + 1)
10ce : 65 1c __ ADC ACCU + 1 
10d0 : 85 1c __ STA ACCU + 1 
10d2 : a6 11 __ LDX P4 ; (color + 0)
10d4 : a0 00 __ LDY #$00
10d6 : b1 0f __ LDA (P2),y ; (str + 0)
10d8 : f0 0a __ BEQ $10e4 ; (cwin_putat_string_raw.s3 + 0)
.l5:
10da : 91 43 __ STA (T1 + 0),y 
10dc : 8a __ __ TXA
10dd : 91 1b __ STA (ACCU + 0),y 
10df : c8 __ __ INY
10e0 : b1 0f __ LDA (P2),y ; (str + 0)
10e2 : d0 f6 __ BNE $10da ; (cwin_putat_string_raw.l5 + 0)
.s3:
10e4 : 60 __ __ RTS
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
10e5 : a5 12 __ LDA P5 
10e7 : 85 0e __ STA P1 
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
;  12, "/home/xahmol/oscar64/include/string.h"
.s4:
10e9 : a9 00 __ LDA #$00
10eb : 85 1b __ STA ACCU + 0 
10ed : 85 1c __ STA ACCU + 1 
10ef : a8 __ __ TAY
10f0 : b1 0d __ LDA (P0),y ; (str + 0)
10f2 : f0 10 __ BEQ $1104 ; (strlen.s3 + 0)
.s6:
10f4 : a2 00 __ LDX #$00
.l7:
10f6 : c8 __ __ INY
10f7 : d0 03 __ BNE $10fc ; (strlen.s9 + 0)
.s8:
10f9 : e6 0e __ INC P1 ; (str + 1)
10fb : e8 __ __ INX
.s9:
10fc : b1 0d __ LDA (P0),y ; (str + 0)
10fe : d0 f6 __ BNE $10f6 ; (strlen.l7 + 0)
.s5:
1100 : 86 1c __ STX ACCU + 1 
1102 : 84 1b __ STY ACCU + 0 
.s3:
1104 : 60 __ __ RTS
--------------------------------------------------------------------
1105 : __ __ __ BYT 75 4c 54 49 4d 41 54 45 64 45 4d 4f 32 30 32 36 : uLTIMATEdEMO2026
1115 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1116 : __ __ __ BYT 68 41 52 44 57 41 52 45 20 64 45 54 45 43 54 49 : hARDWARE dETECTI
1126 : __ __ __ BYT 4f 4e 20 20 56 30 2e 31 2e 30 2d 32 30 32 36 30 : ON  V0.1.0-20260
1136 : __ __ __ BYT 35 33 31 2d 31 34 34 34 00                      : 531-1444.
--------------------------------------------------------------------
screen_info: ; screen_info(const u8*)->void
;  23, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
113f : a9 0f __ LDA #$0f
1141 : 85 0f __ STA P2 
1143 : 20 54 80 JSR $8054 ; (cwin_put_string@proxy + 0)
--------------------------------------------------------------------
cwin_cursor_newline: ; cwin_cursor_newline(struct CharWin*)->void
;  44, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
1146 : ad f0 87 LDA $87f0 ; (cw.cy + 0)
1149 : 18 __ __ CLC
114a : 69 01 __ ADC #$01
114c : a8 __ __ TAY
114d : a9 00 __ LDA #$00
114f : 8d ef 87 STA $87ef ; (cw.cx + 0)
1152 : 2a __ __ ROL
1153 : d0 08 __ BNE $115d ; (cwin_cursor_newline.s3 + 0)
.s6:
1155 : cc ee 87 CPY $87ee ; (cw.wy + 0)
1158 : b0 03 __ BCS $115d ; (cwin_cursor_newline.s3 + 0)
.s5:
115a : ee f0 87 INC $87f0 ; (cw.cy + 0)
.s3:
115d : 60 __ __ RTS
--------------------------------------------------------------------
cwin_put_string@proxy: ; cwin_put_string@proxy
115e : a9 fa __ LDA #$fa
1160 : 85 0d __ STA P0 
1162 : a9 0e __ LDA #$0e
1164 : 85 0e __ STA P1 
--------------------------------------------------------------------
cwin_put_string: ; cwin_put_string(struct CharWin*,const u8*,u8)->void
;  64, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
1166 : ad f0 87 LDA $87f0 ; (cw.cy + 0)
1169 : 0a __ __ ASL
116a : aa __ __ TAX
116b : bd 93 80 LDA $8093,x ; (mul40[0] + 0)
116e : 6d ef 87 ADC $87ef ; (cw.cx + 0)
1171 : 85 1b __ STA ACCU + 0 
1173 : bd 94 80 LDA $8094,x ; (mul40[0] + 1)
1176 : 69 00 __ ADC #$00
1178 : 85 1c __ STA ACCU + 1 
117a : ad f3 87 LDA $87f3 ; (cw.sp + 0)
117d : 65 1b __ ADC ACCU + 0 
117f : 85 43 __ STA T1 + 0 
1181 : ad f4 87 LDA $87f4 ; (cw.sp + 1)
1184 : 65 1c __ ADC ACCU + 1 
1186 : 85 44 __ STA T1 + 1 
1188 : ad f5 87 LDA $87f5 ; (cw.cp + 0)
118b : 18 __ __ CLC
118c : 65 1b __ ADC ACCU + 0 
118e : 85 1b __ STA ACCU + 0 
1190 : ad f6 87 LDA $87f6 ; (cw.cp + 1)
1193 : 65 1c __ ADC ACCU + 1 
1195 : 85 1c __ STA ACCU + 1 
1197 : a0 00 __ LDY #$00
1199 : b1 0d __ LDA (P0),y ; (str + 0)
119b : f0 16 __ BEQ $11b3 ; (cwin_put_string.s5 + 0)
.l7:
119d : 4a __ __ LSR
119e : 4a __ __ LSR
119f : 4a __ __ LSR
11a0 : 4a __ __ LSR
11a1 : 4a __ __ LSR
11a2 : aa __ __ TAX
11a3 : bd cd 80 LDA $80cd,x ; (p2smap[0] + 0)
11a6 : 51 0d __ EOR (P0),y ; (str + 0)
11a8 : 91 43 __ STA (T1 + 0),y 
11aa : a5 0f __ LDA P2 ; (color + 0)
11ac : 91 1b __ STA (ACCU + 0),y 
11ae : c8 __ __ INY
11af : b1 0d __ LDA (P0),y ; (str + 0)
11b1 : d0 ea __ BNE $119d ; (cwin_put_string.l7 + 0)
.s5:
11b3 : 98 __ __ TYA
11b4 : 18 __ __ CLC
11b5 : 6d ef 87 ADC $87ef ; (cw.cx + 0)
11b8 : cd ed 87 CMP $87ed ; (cw.wx + 0)
11bb : 90 05 __ BCC $11c2 ; (cwin_put_string.s3 + 0)
.s6:
11bd : a9 00 __ LDA #$00
11bf : ee f0 87 INC $87f0 ; (cw.cy + 0)
.s3:
11c2 : 8d ef 87 STA $87ef ; (cw.cx + 0)
11c5 : 60 __ __ RTS
--------------------------------------------------------------------
11c6 : __ __ __ BYT 77 41 49 54 49 4e 47 20 46 4f 52 20 75 4c 54 49 : wAITING FOR uLTI
11d6 : __ __ __ BYT 4d 41 54 45 20 46 49 52 4d 57 41 52 45 2e 2e 2e : MATE FIRMWARE...
11e6 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
uii_detect: ; uii_detect()->u8
; 167, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
11e7 : ad 1d df LDA $df1d 
11ea : c9 c9 __ CMP #$c9
11ec : d0 0b __ BNE $11f9 ; (uii_detect.s5 + 0)
.s6:
11ee : ad 1c df LDA $df1c 
11f1 : 09 04 __ ORA #$04
11f3 : 8d 1c df STA $df1c 
11f6 : a9 01 __ LDA #$01
11f8 : 60 __ __ RTS
.s5:
11f9 : a9 00 __ LDA #$00
.s3:
11fb : 60 __ __ RTS
--------------------------------------------------------------------
screen_result@proxy: ; screen_result@proxy
11fc : a9 01 __ LDA #$01
11fe : 85 12 __ STA P5 
1200 : a9 93 __ LDA #$93
1202 : 85 13 __ STA P6 
1204 : a9 bf __ LDA #$bf
1206 : 85 14 __ STA P7 
--------------------------------------------------------------------
screen_result: ; screen_result(const u8*,u8,const u8*)->void
;  17, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
1208 : a9 01 __ LDA #$01
120a : 85 0f __ STA P2 
120c : 20 5e 11 JSR $115e ; (cwin_put_string@proxy + 0)
120f : 20 54 80 JSR $8054 ; (cwin_put_string@proxy + 0)
1212 : a9 64 __ LDA #$64
1214 : 85 0d __ STA P0 
1216 : a9 12 __ LDA #$12
1218 : 85 0e __ STA P1 
121a : 20 66 11 JSR $1166 ; (cwin_put_string.s4 + 0)
121d : a5 12 __ LDA P5 ; (ok + 0)
121f : d0 09 __ BNE $122a ; (screen_result.s7 + 0)
.s5:
1221 : e6 0f __ INC P2 
1223 : a9 12 __ LDA #$12
1225 : a0 5d __ LDY #$5d
1227 : 4c 32 12 JMP $1232 ; (screen_result.s6 + 0)
.s7:
122a : a9 05 __ LDA #$05
122c : 85 0f __ STA P2 
122e : a9 12 __ LDA #$12
1230 : a0 56 __ LDY #$56
.s6:
1232 : 84 0d __ STY P0 
1234 : 85 0e __ STA P1 
1236 : 20 66 11 JSR $1166 ; (cwin_put_string.s4 + 0)
1239 : a5 12 __ LDA P5 ; (ok + 0)
123b : f0 04 __ BEQ $1241 ; (screen_result.s8 + 0)
.s9:
123d : a9 03 __ LDA #$03
123f : d0 02 __ BNE $1243 ; (screen_result.s10 + 0)
.s8:
1241 : a9 07 __ LDA #$07
.s10:
1243 : 85 0f __ STA P2 
1245 : 20 5e 11 JSR $115e ; (cwin_put_string@proxy + 0)
1248 : a5 13 __ LDA P6 ; (detail + 0)
124a : 85 0d __ STA P0 
124c : a5 14 __ LDA P7 ; (detail + 1)
124e : 85 0e __ STA P1 
1250 : 20 66 11 JSR $1166 ; (cwin_put_string.s4 + 0)
1253 : 4c 46 11 JMP $1146 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
1256 : __ __ __ BYT 5b 20 6f 6b 20 5d 00                            : [ ok ].
--------------------------------------------------------------------
125d : __ __ __ BYT 5b 66 41 49 4c 5d 00                            : [fAIL].
--------------------------------------------------------------------
1264 : __ __ __ BYT 20 3a 20 00                                     :  : .
--------------------------------------------------------------------
1268 : __ __ __ BYT 75 63 69 20 20 00                               : uci  .
--------------------------------------------------------------------
126e : __ __ __ BYT 6e 4f 54 20 44 45 54 45 43 54 45 44 00          : nOT DETECTED.
--------------------------------------------------------------------
screen_error_exit: ; screen_error_exit(const u8*,const u8*)->void
;  32, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
127b : a9 02 __ LDA #$02
127d : 85 0f __ STA P2 
127f : 20 46 11 JSR $1146 ; (cwin_cursor_newline.s4 + 0)
1282 : a5 12 __ LDA P5 ; (msg + 0)
1284 : 85 0d __ STA P0 
1286 : a5 13 __ LDA P6 ; (msg + 1)
1288 : 85 0e __ STA P1 
128a : 20 66 11 JSR $1166 ; (cwin_put_string.s4 + 0)
128d : 20 46 11 JSR $1146 ; (cwin_cursor_newline.s4 + 0)
1290 : a5 15 __ LDA P8 ; (hint + 1)
1292 : 05 14 __ ORA P7 ; (hint + 0)
1294 : f0 11 __ BEQ $12a7 ; (screen_error_exit.s5 + 0)
.s6:
1296 : a0 00 __ LDY #$00
1298 : b1 14 __ LDA (P7),y ; (hint + 0)
129a : f0 0b __ BEQ $12a7 ; (screen_error_exit.s5 + 0)
.s7:
129c : a5 14 __ LDA P7 ; (hint + 0)
129e : 85 10 __ STA P3 
12a0 : a5 15 __ LDA P8 ; (hint + 1)
12a2 : 85 11 __ STA P4 
12a4 : 20 ca 12 JSR $12ca ; (screen_hint.s4 + 0)
.s5:
12a7 : a9 01 __ LDA #$01
12a9 : 85 0f __ STA P2 
12ab : 20 46 11 JSR $1146 ; (cwin_cursor_newline.s4 + 0)
12ae : a9 00 __ LDA #$00
12b0 : 85 0d __ STA P0 
12b2 : a9 13 __ LDA #$13
12b4 : 85 0e __ STA P1 
12b6 : 20 66 11 JSR $1166 ; (cwin_put_string.s4 + 0)
12b9 : 20 46 11 JSR $1146 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
cwin_getch: ; cwin_getch()->void
; 147, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
12bc : 20 e4 ff JSR $ffe4 
12bf : c9 00 __ CMP #$00
12c1 : f0 f9 __ BEQ $12bc ; (cwin_getch.s4 + 0)
12c3 : 85 1b __ STA ACCU + 0 
12c5 : a9 00 __ LDA #$00
12c7 : 85 1c __ STA ACCU + 1 
.s3:
12c9 : 60 __ __ RTS
--------------------------------------------------------------------
screen_hint: ; screen_hint(const u8*)->void
;  26, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
12ca : a9 07 __ LDA #$07
12cc : 85 0f __ STA P2 
12ce : a9 12 __ LDA #$12
12d0 : 85 0e __ STA P1 
12d2 : a9 df __ LDA #$df
12d4 : 85 0d __ STA P0 
12d6 : 20 66 11 JSR $1166 ; (cwin_put_string.s4 + 0)
12d9 : 20 54 80 JSR $8054 ; (cwin_put_string@proxy + 0)
12dc : 4c 46 11 JMP $1146 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
12df : __ __ __ BYT 20 20 2d 3e 20 00                               :   -> .
--------------------------------------------------------------------
12e5 : __ __ __ BYT 66 32 20 3e 20 75 63 69 20 73 45 54 54 49 4e 47 : f2 > uci sETTING
12f5 : __ __ __ BYT 53 20 3e 20 65 4e 41 42 4c 45 00                : S > eNABLE.
--------------------------------------------------------------------
1300 : __ __ __ BYT 70 52 45 53 53 20 41 20 4b 45 59 20 2d 20 45 58 : pRESS A KEY - EX
1310 : __ __ __ BYT 49 54 20 54 4f 20 62 61 73 69 63 2e 00          : IT TO basic..
--------------------------------------------------------------------
131d : __ __ __ BYT 6e 4f 20 75 4c 54 49 4d 41 54 45 20 63 4f 4d 4d : nO uLTIMATE cOMM
132d : __ __ __ BYT 41 4e 44 20 69 4e 54 45 52 46 41 43 45 20 46 4f : AND iNTERFACE FO
133d : __ __ __ BYT 55 4e 44 2e 00                                  : UND..
--------------------------------------------------------------------
uii_sendcommand: ; uii_sendcommand(u8*,u16)->void
; 173, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
1342 : ad ff 15 LDA $15ff ; (uii_target + 0)
1345 : a0 00 __ LDY #$00
1347 : 84 1b __ STY ACCU + 0 
1349 : 84 1c __ STY ACCU + 1 
134b : 91 0d __ STA (P0),y ; (bytes + 0)
.l5:
134d : ad 1c df LDA $df1c 
1350 : 29 20 __ AND #$20
1352 : d0 f9 __ BNE $134d ; (uii_sendcommand.l5 + 0)
.s6:
1354 : ad 1c df LDA $df1c 
1357 : 29 10 __ AND #$10
1359 : d0 f2 __ BNE $134d ; (uii_sendcommand.l5 + 0)
.s7:
135b : a5 1c __ LDA ACCU + 1 
135d : c5 10 __ CMP P3 ; (count + 1)
135f : d0 04 __ BNE $1365 ; (uii_sendcommand.s16 + 0)
.s15:
1361 : a5 1b __ LDA ACCU + 0 
1363 : c5 0f __ CMP P2 ; (count + 0)
.s16:
1365 : b0 2e __ BCS $1395 ; (uii_sendcommand.s8 + 0)
.s12:
1367 : a5 0d __ LDA P0 ; (bytes + 0)
1369 : 65 1b __ ADC ACCU + 0 
136b : 85 43 __ STA T3 + 0 
136d : a5 0e __ LDA P1 ; (bytes + 1)
136f : 65 1c __ ADC ACCU + 1 
1371 : 85 44 __ STA T3 + 1 
1373 : a6 1b __ LDX ACCU + 0 
.l13:
1375 : a0 00 __ LDY #$00
1377 : b1 43 __ LDA (T3 + 0),y 
1379 : 8d 1d df STA $df1d 
137c : e6 43 __ INC T3 + 0 
137e : d0 02 __ BNE $1382 ; (uii_sendcommand.s19 + 0)
.s18:
1380 : e6 44 __ INC T3 + 1 
.s19:
1382 : e8 __ __ INX
1383 : d0 02 __ BNE $1387 ; (uii_sendcommand.s21 + 0)
.s20:
1385 : e6 1c __ INC ACCU + 1 
.s21:
1387 : a5 1c __ LDA ACCU + 1 
1389 : c5 10 __ CMP P3 ; (count + 1)
138b : 90 e8 __ BCC $1375 ; (uii_sendcommand.l13 + 0)
.s22:
138d : d0 04 __ BNE $1393 ; (uii_sendcommand.s17 + 0)
.s14:
138f : e4 0f __ CPX P2 ; (count + 0)
1391 : 90 e2 __ BCC $1375 ; (uii_sendcommand.l13 + 0)
.s17:
1393 : 86 1b __ STX ACCU + 0 
.s8:
1395 : ad 1c df LDA $df1c 
1398 : 09 01 __ ORA #$01
139a : 8d 1c df STA $df1c 
139d : ad 1c df LDA $df1c 
13a0 : 29 04 __ AND #$04
13a2 : f0 0a __ BEQ $13ae ; (uii_sendcommand.l9 + 0)
.s11:
13a4 : ad 1c df LDA $df1c 
13a7 : 09 08 __ ORA #$08
13a9 : 8d 1c df STA $df1c 
13ac : b0 9f __ BCS $134d ; (uii_sendcommand.l5 + 0)
.l9:
13ae : ad 1c df LDA $df1c 
13b1 : 29 20 __ AND #$20
13b3 : d0 07 __ BNE $13bc ; (uii_sendcommand.s3 + 0)
.s10:
13b5 : ad 1c df LDA $df1c 
13b8 : 29 10 __ AND #$10
13ba : d0 f2 __ BNE $13ae ; (uii_sendcommand.l9 + 0)
.s3:
13bc : 60 __ __ RTS
--------------------------------------------------------------------
uii_readdata: ; uii_readdata()->void
; 179, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
13bd : a9 00 __ LDA #$00
13bf : 8d c8 97 STA $97c8 ; (uii_data[0] + 0)
13c2 : a2 c8 __ LDX #$c8
13c4 : 86 1b __ STX ACCU + 0 
13c6 : a8 __ __ TAY
13c7 : f0 0d __ BEQ $13d6 ; (uii_readdata.l5 + 0)
.s8:
13c9 : ad 1e df LDA $df1e 
13cc : 91 1b __ STA (ACCU + 0),y 
13ce : 98 __ __ TYA
13cf : 18 __ __ CLC
13d0 : 69 01 __ ADC #$01
13d2 : a8 __ __ TAY
13d3 : 8a __ __ TXA
13d4 : 69 00 __ ADC #$00
.l5:
13d6 : aa __ __ TAX
13d7 : 18 __ __ CLC
13d8 : 69 97 __ ADC #$97
13da : 85 1c __ STA ACCU + 1 
13dc : 2c 1c df BIT $df1c 
13df : 10 07 __ BPL $13e8 ; (uii_readdata.s6 + 0)
.s7:
13e1 : e0 02 __ CPX #$02
13e3 : d0 e4 __ BNE $13c9 ; (uii_readdata.s8 + 0)
.s9:
13e5 : 98 __ __ TYA
13e6 : d0 e1 __ BNE $13c9 ; (uii_readdata.s8 + 0)
.s6:
13e8 : a9 00 __ LDA #$00
13ea : 91 1b __ STA (ACCU + 0),y 
.s3:
13ec : 60 __ __ RTS
--------------------------------------------------------------------
uii_readstatus: ; uii_readstatus()->void
; 180, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
13ed : a9 00 __ LDA #$00
13ef : 8d c9 99 STA $99c9 ; (uii_status[0] + 0)
13f2 : a2 c9 __ LDX #$c9
13f4 : 86 1b __ STX ACCU + 0 
13f6 : a8 __ __ TAY
13f7 : f0 0d __ BEQ $1406 ; (uii_readstatus.l5 + 0)
.s8:
13f9 : ad 1f df LDA $df1f 
13fc : 91 1b __ STA (ACCU + 0),y 
13fe : 98 __ __ TYA
13ff : 18 __ __ CLC
1400 : 69 01 __ ADC #$01
1402 : a8 __ __ TAY
1403 : 8a __ __ TXA
1404 : 69 00 __ ADC #$00
.l5:
1406 : aa __ __ TAX
1407 : 18 __ __ CLC
1408 : 69 99 __ ADC #$99
140a : 85 1c __ STA ACCU + 1 
140c : ad 1c df LDA $df1c 
140f : 29 40 __ AND #$40
1411 : f0 07 __ BEQ $141a ; (uii_readstatus.s6 + 0)
.s7:
1413 : e0 01 __ CPX #$01
1415 : d0 e2 __ BNE $13f9 ; (uii_readstatus.s8 + 0)
.s9:
1417 : 98 __ __ TYA
1418 : d0 df __ BNE $13f9 ; (uii_readstatus.s8 + 0)
.s6:
141a : 91 1b __ STA (ACCU + 0),y 
.s3:
141c : 60 __ __ RTS
--------------------------------------------------------------------
uii_get_hwinfo: ; uii_get_hwinfo(u8)->void
;  53, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
141d : a9 00 __ LDA #$00
141f : 85 10 __ STA P3 
1421 : 8d e7 bf STA $bfe7 ; (cmd[0] + 0)
1424 : 8d e9 bf STA $bfe9 ; (cmd[0] + 2)
1427 : a9 03 __ LDA #$03
1429 : 85 0f __ STA P2 
142b : a9 04 __ LDA #$04
142d : 8d ff 15 STA $15ff ; (uii_target + 0)
1430 : a9 28 __ LDA #$28
1432 : 8d e8 bf STA $bfe8 ; (cmd[0] + 1)
1435 : a9 00 __ LDA #$00
1437 : 8d e9 bf STA $bfe9 ; (cmd[0] + 2)
143a : a9 e7 __ LDA #$e7
143c : 85 0d __ STA P0 
143e : a9 bf __ LDA #$bf
1440 : 85 0e __ STA P1 
1442 : 20 42 13 JSR $1342 ; (uii_sendcommand.s4 + 0)
1445 : 20 bd 13 JSR $13bd ; (uii_readdata.s4 + 0)
1448 : 20 ed 13 JSR $13ed ; (uii_readstatus.s4 + 0)
--------------------------------------------------------------------
uii_accept: ; uii_accept()->void
; 174, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
144b : ad 1c df LDA $df1c 
144e : 09 02 __ ORA #$02
1450 : 8d 1c df STA $df1c 
.l5:
1453 : ad 1c df LDA $df1c 
1456 : 29 02 __ AND #$02
1458 : d0 f9 __ BNE $1453 ; (uii_accept.l5 + 0)
.s3:
145a : 60 __ __ RTS
--------------------------------------------------------------------
uci_to_upper@proxy: ; uci_to_upper@proxy
145b : a9 93 __ LDA #$93
145d : 85 0d __ STA P0 
145f : a9 bf __ LDA #$bf
1461 : 85 0e __ STA P1 
--------------------------------------------------------------------
uci_to_upper: ; uci_to_upper(u8*,u8)->u8
;  72, "/home/xahmol/git/UltimateDemo2026/src/main.c"
.s4:
1463 : a0 00 __ LDY #$00
1465 : a2 00 __ LDX #$00
1467 : ad c8 97 LDA $97c8 ; (uii_data[0] + 0)
146a : f0 23 __ BEQ $148f ; (uci_to_upper.s6 + 0)
.l8:
146c : c9 20 __ CMP #$20
146e : 90 11 __ BCC $1481 ; (uci_to_upper.s9 + 0)
.s10:
1470 : c9 7f __ CMP #$7f
1472 : b0 0d __ BCS $1481 ; (uci_to_upper.s9 + 0)
.s11:
1474 : c9 61 __ CMP #$61
1476 : 90 06 __ BCC $147e ; (uci_to_upper.s14 + 0)
.s12:
1478 : c9 7b __ CMP #$7b
147a : b0 02 __ BCS $147e ; (uci_to_upper.s14 + 0)
.s13:
147c : e9 1f __ SBC #$1f
.s14:
147e : 91 0d __ STA (P0),y ; (dst + 0)
1480 : c8 __ __ INY
.s9:
1481 : e8 __ __ INX
1482 : e0 7f __ CPX #$7f
1484 : b0 09 __ BCS $148f ; (uci_to_upper.s6 + 0)
.s5:
1486 : c0 18 __ CPY #$18
1488 : b0 05 __ BCS $148f ; (uci_to_upper.s6 + 0)
.s7:
148a : bd c8 97 LDA $97c8,x ; (uii_data[0] + 0)
148d : d0 dd __ BNE $146c ; (uci_to_upper.l8 + 0)
.s6:
148f : a9 00 __ LDA #$00
1491 : 91 0d __ STA (P0),y ; (dst + 0)
.s3:
1493 : 98 __ __ TYA
1494 : 60 __ __ RTS
--------------------------------------------------------------------
1495 : __ __ __ BYT 75 63 69 20 6f 4b 00                            : uci oK.
--------------------------------------------------------------------
149c : __ __ __ BYT 20 20 74 59 50 45 20 20 3a 20 00                :   tYPE  : .
--------------------------------------------------------------------
14a7 : __ __ __ BYT 63 48 45 43 4b 49 4e 47 20 72 65 75 2e 2e 2e 00 : cHECKING reu....
--------------------------------------------------------------------
detect_reu: ; detect_reu()->u8
;  33, "/home/xahmol/git/UltimateDemo2026/src/detect.h"
.s4:
14b7 : a9 00 __ LDA #$00
14b9 : 8d e9 bf STA $bfe9 ; (c + 0)
14bc : a9 e9 __ LDA #$e9
14be : 8d 02 df STA $df02 
14c1 : a9 bf __ LDA #$bf
14c3 : 8d 03 df STA $df03 
14c6 : a9 00 __ LDA #$00
14c8 : 8d 04 df STA $df04 
14cb : 8d 05 df STA $df05 
14ce : 8d 06 df STA $df06 
14d1 : a2 01 __ LDX #$01
14d3 : 8e 07 df STX $df07 
14d6 : 8d 08 df STA $df08 
14d9 : 8d 0a df STA $df0a 
14dc : a2 90 __ LDX #$90
14de : 8e 01 df STX $df01 
14e1 : a2 e8 __ LDX #$e8
14e3 : 8e 02 df STX $df02 
14e6 : a2 bf __ LDX #$bf
14e8 : 8e 03 df STX $df03 
14eb : 8d 04 df STA $df04 
14ee : 8d 05 df STA $df05 
14f1 : 8d 06 df STA $df06 
14f4 : a2 01 __ LDX #$01
14f6 : 8e 07 df STX $df07 
14f9 : 8d 08 df STA $df08 
14fc : 8d 0a df STA $df0a 
14ff : a9 91 __ LDA #$91
1501 : 8d 01 df STA $df01 
1504 : ad e8 bf LDA $bfe8 ; (d + 0)
1507 : d0 52 __ BNE $155b ; (detect_reu.s6 + 0)
.s5:
1509 : a2 47 __ LDX #$47
150b : 8e e9 bf STX $bfe9 ; (c + 0)
150e : a2 e9 __ LDX #$e9
1510 : 8e 02 df STX $df02 
1513 : a2 bf __ LDX #$bf
1515 : 8e 03 df STX $df03 
1518 : 8d 04 df STA $df04 
151b : 8d 05 df STA $df05 
151e : 8d 06 df STA $df06 
1521 : a2 01 __ LDX #$01
1523 : 8e 07 df STX $df07 
1526 : 8d 08 df STA $df08 
1529 : 8d 0a df STA $df0a 
152c : a2 90 __ LDX #$90
152e : 8e 01 df STX $df01 
1531 : a2 e8 __ LDX #$e8
1533 : 8e 02 df STX $df02 
1536 : a2 bf __ LDX #$bf
1538 : 8e 03 df STX $df03 
153b : 8d 04 df STA $df04 
153e : 8d 05 df STA $df05 
1541 : 8d 06 df STA $df06 
1544 : a2 01 __ LDX #$01
1546 : 8e 07 df STX $df07 
1549 : 8d 08 df STA $df08 
154c : 8d 0a df STA $df0a 
154f : a9 91 __ LDA #$91
1551 : 8d 01 df STA $df01 
1554 : ad e8 bf LDA $bfe8 ; (d + 0)
1557 : c9 47 __ CMP #$47
1559 : f0 03 __ BEQ $155e ; (detect_reu.s7 + 0)
.s6:
155b : a9 00 __ LDA #$00
.s3:
155d : 60 __ __ RTS
.s7:
155e : a0 01 __ LDY #$01
.l8:
1560 : 8d e9 bf STA $bfe9 ; (c + 0)
1563 : a9 e9 __ LDA #$e9
1565 : 8d 02 df STA $df02 
1568 : a9 bf __ LDA #$bf
156a : 8d 03 df STA $df03 
156d : a9 00 __ LDA #$00
156f : 8d 04 df STA $df04 
1572 : 8d 05 df STA $df05 
1575 : 8c 06 df STY $df06 
1578 : 8e 07 df STX $df07 
157b : 8d 08 df STA $df08 
157e : 8d 0a df STA $df0a 
1581 : a2 90 __ LDX #$90
1583 : 8e 01 df STX $df01 
1586 : 8d e9 bf STA $bfe9 ; (c + 0)
1589 : a2 e9 __ LDX #$e9
158b : 8e 02 df STX $df02 
158e : a2 bf __ LDX #$bf
1590 : 8e 03 df STX $df03 
1593 : 8d 04 df STA $df04 
1596 : 8d 05 df STA $df05 
1599 : 8d 06 df STA $df06 
159c : a2 01 __ LDX #$01
159e : 8e 07 df STX $df07 
15a1 : 8d 08 df STA $df08 
15a4 : 8d 0a df STA $df0a 
15a7 : a2 90 __ LDX #$90
15a9 : 8e 01 df STX $df01 
15ac : a2 e8 __ LDX #$e8
15ae : 8e 02 df STX $df02 
15b1 : a2 bf __ LDX #$bf
15b3 : 8e 03 df STX $df03 
15b6 : 8d 04 df STA $df04 
15b9 : 8d 05 df STA $df05 
15bc : 8c 06 df STY $df06 
15bf : a2 01 __ LDX #$01
15c1 : 8e 07 df STX $df07 
15c4 : 8d 08 df STA $df08 
15c7 : 8d 0a df STA $df0a 
15ca : a9 91 __ LDA #$91
15cc : 8d 01 df STA $df01 
15cf : ad e8 bf LDA $bfe8 ; (d + 0)
15d2 : c9 47 __ CMP #$47
15d4 : d0 06 __ BNE $15dc ; (detect_reu.s11 + 0)
.s9:
15d6 : c8 __ __ INY
15d7 : d0 87 __ BNE $1560 ; (detect_reu.l8 + 0)
.s10:
15d9 : a9 10 __ LDA #$10
15db : 60 __ __ RTS
.s11:
15dc : 98 __ __ TYA
15dd : 4a __ __ LSR
15de : 4a __ __ LSR
15df : 4a __ __ LSR
15e0 : 4a __ __ LSR
15e1 : 60 __ __ RTS
--------------------------------------------------------------------
15e2 : __ __ __ BYT 72 65 75 20 20 00                               : reu  .
--------------------------------------------------------------------
15e8 : __ __ __ BYT 74 4f 4f 20 53 4d 41 4c 4c 20 28 4e 45 45 44 20 : tOO SMALL (NEED 
15f8 : __ __ __ BYT 31 36 20 6d 62 29 00                            : 16 mb).
--------------------------------------------------------------------
uii_target:
15ff : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
1600 : __ __ __ BYT 31 36 20 6d 62 20 72 65 75 20 49 53 20 52 45 51 : 16 mb reu IS REQ
1610 : __ __ __ BYT 55 49 52 45 44 2e 00                            : UIRED..
--------------------------------------------------------------------
1617 : __ __ __ BYT 66 32 20 3e 20 63 36 34 20 53 45 54 54 49 4e 47 : f2 > c64 SETTING
1627 : __ __ __ BYT 53 20 3e 20 72 65 75 20 3e 20 31 36 20 6d 62 00 : S > reu > 16 mb.
--------------------------------------------------------------------
1637 : __ __ __ BYT 31 36 20 6d 62 00                               : 16 mb.
--------------------------------------------------------------------
163d : __ __ __ BYT 63 48 45 43 4b 49 4e 47 20 54 55 52 42 4f 20 4d : cHECKING TURBO M
164d : __ __ __ BYT 4f 44 45 2e 2e 2e 00                            : ODE....
--------------------------------------------------------------------
turbo_detect: ; turbo_detect()->u8
; 114, "/home/xahmol/git/UltimateDemo2026/include/turbo.h"
.s4:
1654 : ae 31 d0 LDX $d031 
1657 : e8 __ __ INX
1658 : f0 1c __ BEQ $1676 ; (turbo_detect.s6 + 0)
.s5:
165a : a9 0f __ LDA #$0f
165c : 20 90 16 JSR $1690 ; (turbo_set.s4 + 0)
165f : 20 ab 16 JSR $16ab ; (benchmark_delay.s4 + 0)
1662 : 20 ab 16 JSR $16ab ; (benchmark_delay.s4 + 0)
1665 : a5 1b __ LDA ACCU + 0 
1667 : 85 44 __ STA T0 + 0 
1669 : a5 1c __ LDA ACCU + 1 
166b : 85 45 __ STA T0 + 1 
166d : a9 00 __ LDA #$00
166f : 20 90 16 JSR $1690 ; (turbo_set.s4 + 0)
1672 : a5 45 __ LDA T0 + 1 
1674 : f0 05 __ BEQ $167b ; (turbo_detect.s9 + 0)
.s6:
1676 : a9 00 __ LDA #$00
.s3:
1678 : 85 1b __ STA ACCU + 0 
167a : 60 __ __ RTS
.s9:
167b : a5 44 __ LDA T0 + 0 
167d : c9 02 __ CMP #$02
167f : b0 04 __ BCS $1685 ; (turbo_detect.s7 + 0)
.s8:
1681 : a9 02 __ LDA #$02
1683 : 90 f3 __ BCC $1678 ; (turbo_detect.s3 + 0)
.s7:
1685 : c9 46 __ CMP #$46
1687 : a9 00 __ LDA #$00
1689 : 2a __ __ ROL
168a : 49 01 __ EOR #$01
168c : 90 ea __ BCC $1678 ; (turbo_detect.s3 + 0)
--------------------------------------------------------------------
turbo_set: ; turbo_set(u8)->void
; 131, "/home/xahmol/git/UltimateDemo2026/include/turbo.h"
.s4:
1690 : a8 __ __ TAY
1691 : d0 0c __ BNE $169f ; (turbo_set.s6 + 0)
.s5:
1693 : 8d 31 d0 STA $d031 
1696 : ad 30 d0 LDA $d030 
1699 : 29 fe __ AND #$fe
169b : 8d 30 d0 STA $d030 
169e : 60 __ __ RTS
.s6:
169f : ad 30 d0 LDA $d030 
16a2 : 09 01 __ ORA #$01
16a4 : 8d 30 d0 STA $d030 
16a7 : 8c 31 d0 STY $d031 
.s3:
16aa : 60 __ __ RTS
--------------------------------------------------------------------
benchmark_delay: ; benchmark_delay(i16)->i16
;  99, "/home/xahmol/git/UltimateDemo2026/include/turbo.h"
.s4:
16ab : 78 __ __ SEI
16ac : a9 00 __ LDA #$00
16ae : 8d 09 dc STA $dc09 
16b1 : 8d 08 dc STA $dc08 
16b4 : 8d e8 bf STA $bfe8 ; (i + 0)
16b7 : f0 0e __ BEQ $16c7 ; (benchmark_delay.l5 + 0)
.s9:
16b9 : ad e8 bf LDA $bfe8 ; (i + 0)
16bc : 18 __ __ CLC
16bd : 69 01 __ ADC #$01
16bf : 8d e8 bf STA $bfe8 ; (i + 0)
16c2 : ad e9 bf LDA $bfe9 ; (i + 1)
16c5 : 69 00 __ ADC #$00
.l5:
16c7 : 8d e9 bf STA $bfe9 ; (i + 1)
16ca : ac e8 bf LDY $bfe8 ; (i + 0)
16cd : ad e9 bf LDA $bfe9 ; (i + 1)
16d0 : 49 80 __ EOR #$80
16d2 : c9 83 __ CMP #$83
16d4 : d0 02 __ BNE $16d8 ; (benchmark_delay.s14 + 0)
.s13:
16d6 : c0 e8 __ CPY #$e8
.s14:
16d8 : b0 07 __ BCS $16e1 ; (benchmark_delay.s6 + 0)
.s7:
16da : a9 00 __ LDA #$00
16dc : 8d e6 bf STA $bfe6 ; (j + 0)
16df : 90 28 __ BCC $1709 ; (benchmark_delay.l8 + 0)
.s6:
16e1 : 58 __ __ CLI
16e2 : ad 09 dc LDA $dc09 
16e5 : aa __ __ TAX
16e6 : 0a __ __ ASL
16e7 : 85 1b __ STA ACCU + 0 
16e9 : a9 00 __ LDA #$00
16eb : 2a __ __ ROL
16ec : 06 1b __ ASL ACCU + 0 
16ee : 2a __ __ ROL
16ef : a8 __ __ TAY
16f0 : 8a __ __ TXA
16f1 : 65 1b __ ADC ACCU + 0 
16f3 : 85 43 __ STA T0 + 0 
16f5 : 98 __ __ TYA
16f6 : 69 00 __ ADC #$00
16f8 : 06 43 __ ASL T0 + 0 
16fa : 2a __ __ ROL
16fb : a8 __ __ TAY
16fc : ad 08 dc LDA $dc08 
16ff : 65 43 __ ADC T0 + 0 
1701 : 85 1b __ STA ACCU + 0 
1703 : 90 01 __ BCC $1706 ; (benchmark_delay.s16 + 0)
.s15:
1705 : c8 __ __ INY
.s16:
1706 : 84 1c __ STY ACCU + 1 
.s3:
1708 : 60 __ __ RTS
.l8:
1709 : 8d e7 bf STA $bfe7 ; (j + 1)
170c : ac e6 bf LDY $bfe6 ; (j + 0)
170f : ad e7 bf LDA $bfe7 ; (j + 1)
1712 : 30 06 __ BMI $171a ; (benchmark_delay.s10 + 0)
.s12:
1714 : d0 a3 __ BNE $16b9 ; (benchmark_delay.s9 + 0)
.s11:
1716 : c0 c8 __ CPY #$c8
1718 : b0 9f __ BCS $16b9 ; (benchmark_delay.s9 + 0)
.s10:
171a : ea __ __ NOP
171b : ad e6 bf LDA $bfe6 ; (j + 0)
171e : 18 __ __ CLC
171f : 69 01 __ ADC #$01
1721 : 8d e6 bf STA $bfe6 ; (j + 0)
1724 : ad e7 bf LDA $bfe7 ; (j + 1)
1727 : 69 00 __ ADC #$00
1729 : 4c 09 17 JMP $1709 ; (benchmark_delay.l8 + 0)
--------------------------------------------------------------------
172c : __ __ __ BYT 74 55 52 42 4f 00                               : tURBO.
--------------------------------------------------------------------
1732 : __ __ __ BYT 6e 4f 54 20 44 45 54 45 43 54 45 44 20 28 31 20 : nOT DETECTED (1 
1742 : __ __ __ BYT 6d 68 5a 29 00                                  : mhZ).
--------------------------------------------------------------------
1747 : __ __ __ BYT 65 4e 41 42 4c 45 20 54 55 52 42 4f 20 49 4e 20 : eNABLE TURBO IN 
1757 : __ __ __ BYT 75 4c 54 49 4d 41 54 45 20 46 49 52 4d 57 41 52 : uLTIMATE FIRMWAR
1767 : __ __ __ BYT 45 00                                           : E.
--------------------------------------------------------------------
1769 : __ __ __ BYT 36 34 20 6d 68 5a 00                            : 64 mhZ.
--------------------------------------------------------------------
turbo_get: ; turbo_get()->u8
; 149, "/home/xahmol/git/UltimateDemo2026/include/turbo.h"
.s3:
1770 : ad 31 d0 LDA $d031 
1773 : 60 __ __ RTS
--------------------------------------------------------------------
1774 : __ __ __ BYT 34 38 20 6d 68 5a 00                            : 48 mhZ.
--------------------------------------------------------------------
177b : __ __ __ BYT 34 30 20 6d 68 5a 00                            : 40 mhZ.
--------------------------------------------------------------------
1782 : __ __ __ BYT 33 36 20 6d 68 5a 00                            : 36 mhZ.
--------------------------------------------------------------------
1789 : __ __ __ BYT 33 32 20 6d 68 5a 00                            : 32 mhZ.
--------------------------------------------------------------------
1790 : __ __ __ BYT 32 38 20 6d 68 5a 00                            : 28 mhZ.
--------------------------------------------------------------------
1797 : __ __ __ BYT 32 34 20 6d 68 5a 00                            : 24 mhZ.
--------------------------------------------------------------------
179e : __ __ __ BYT 32 30 20 6d 68 5a 00                            : 20 mhZ.
--------------------------------------------------------------------
17a5 : __ __ __ BYT 31 36 20 6d 68 5a 00                            : 16 mhZ.
--------------------------------------------------------------------
17ac : __ __ __ BYT 31 32 20 6d 68 5a 00                            : 12 mhZ.
--------------------------------------------------------------------
17b3 : __ __ __ BYT 38 20 6d 68 5a 00                               : 8 mhZ.
--------------------------------------------------------------------
17b9 : __ __ __ BYT 63 48 45 43 4b 49 4e 47 20 75 4c 54 49 4d 41 54 : cHECKING uLTIMAT
17c9 : __ __ __ BYT 45 20 61 55 44 49 4f 2e 2e 2e 00                : E aUDIO....
--------------------------------------------------------------------
audio_detect: ; audio_detect()->u8
;  92, "/home/xahmol/git/UltimateDemo2026/include/audio.h"
.s4:
17d4 : 78 __ __ SEI
17d5 : a2 00 __ LDX #$00
17d7 : 86 43 __ STX T0 + 0 
.l15:
17d9 : bd d6 80 LDA $80d6,x ; (audio_ch_base[0] + 1)
17dc : 85 44 __ STA T0 + 1 
17de : a9 00 __ LDA #$00
17e0 : bc d5 80 LDY $80d5,x ; (audio_ch_base[0] + 0)
17e3 : 91 43 __ STA (T0 + 0),y 
17e5 : e8 __ __ INX
17e6 : e8 __ __ INX
17e7 : e0 0e __ CPX #$0e
17e9 : d0 ee __ BNE $17d9 ; (audio_detect.l15 + 0)
.s16:
17eb : a9 ff __ LDA #$ff
17ed : 8d 3f df STA $df3f 
17f0 : a2 00 __ LDX #$00
17f2 : ad 20 df LDA $df20 
17f5 : d0 08 __ BNE $17ff ; (audio_detect.s14 + 0)
.l6:
17f7 : ca __ __ DEX
17f8 : f0 09 __ BEQ $1803 ; (audio_detect.s7 + 0)
.s5:
17fa : ad 20 df LDA $df20 
17fd : f0 f8 __ BEQ $17f7 ; (audio_detect.l6 + 0)
.s14:
17ff : 58 __ __ CLI
.s17:
1800 : a9 00 __ LDA #$00
.s3:
1802 : 60 __ __ RTS
.s7:
1803 : 8d 21 df STA $df21 
1806 : a9 01 __ LDA #$01
1808 : 8d 24 df STA $df24 
180b : 8e 25 df STX $df25 
180e : 8e 26 df STX $df26 
1811 : 8e 27 df STX $df27 
1814 : 8e 2e df STX $df2e 
1817 : 8e 29 df STX $df29 
181a : 8d 2f df STA $df2f 
181d : 8d 2a df STA $df2a 
1820 : 8e 2b df STX $df2b 
1823 : a9 05 __ LDA #$05
1825 : 8d 20 df STA $df20 
1828 : a2 80 __ LDX #$80
182a : ad 20 df LDA $df20 
182d : d0 08 __ BNE $1837 ; (audio_detect.l10 + 0)
.l9:
182f : ca __ __ DEX
1830 : f0 05 __ BEQ $1837 ; (audio_detect.l10 + 0)
.s8:
1832 : ad 20 df LDA $df20 
1835 : f0 f8 __ BEQ $182f ; (audio_detect.l9 + 0)
.l10:
1837 : ac 20 df LDY $df20 
183a : 88 __ __ DEY
183b : d0 0c __ BNE $1849 ; (audio_detect.s13 + 0)
.s11:
183d : ca __ __ DEX
183e : d0 f7 __ BNE $1837 ; (audio_detect.l10 + 0)
.s12:
1840 : a9 ff __ LDA #$ff
1842 : 8d 3f df STA $df3f 
1845 : 58 __ __ CLI
1846 : a9 01 __ LDA #$01
1848 : 60 __ __ RTS
.s13:
1849 : 58 __ __ CLI
184a : a9 00 __ LDA #$00
184c : 60 __ __ RTS
--------------------------------------------------------------------
184d : __ __ __ BYT 61 55 44 49 4f 00                               : aUDIO.
--------------------------------------------------------------------
1853 : __ __ __ BYT 6d 4f 44 55 4c 45 20 4e 4f 54 20 46 4f 55 4e 44 : mODULE NOT FOUND
1863 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1864 : __ __ __ BYT 66 32 20 3e 20 63 36 34 2f 63 41 52 54 20 53 45 : f2 > c64/cART SE
1874 : __ __ __ BYT 54 54 49 4e 47 53 20 3e 20 61 55 44 49 4f 00    : TTINGS > aUDIO.
--------------------------------------------------------------------
fmt_dec: ; fmt_dec(u8*,u8)->void
;  56, "/home/xahmol/git/UltimateDemo2026/src/main.c"
.s4:
1883 : a5 0f __ LDA P2 ; (val + 0)
1885 : c9 64 __ CMP #$64
1887 : b0 04 __ BCS $188d ; (fmt_dec.s7 + 0)
.s5:
1889 : a0 00 __ LDY #$00
188b : 90 1d __ BCC $18aa ; (fmt_dec.s6 + 0)
.s7:
188d : 85 1b __ STA ACCU + 0 
188f : a9 00 __ LDA #$00
1891 : 85 1c __ STA ACCU + 1 
1893 : 85 04 __ STA WORK + 1 
1895 : a9 64 __ LDA #$64
1897 : 85 03 __ STA WORK + 0 
1899 : 20 4d 7c JSR $7c4d ; (divmod + 0)
189c : 18 __ __ CLC
189d : a5 1b __ LDA ACCU + 0 
189f : 69 30 __ ADC #$30
18a1 : a0 00 __ LDY #$00
18a3 : 91 0d __ STA (P0),y ; (buf + 0)
18a5 : a5 05 __ LDA WORK + 2 
18a7 : 85 0f __ STA P2 ; (val + 0)
18a9 : c8 __ __ INY
.s6:
18aa : 84 43 __ STY T1 + 0 
18ac : a9 00 __ LDA #$00
18ae : c8 __ __ INY
18af : c8 __ __ INY
18b0 : 91 0d __ STA (P0),y ; (buf + 0)
18b2 : 85 1c __ STA ACCU + 1 
18b4 : 85 04 __ STA WORK + 1 
18b6 : a5 0f __ LDA P2 ; (val + 0)
18b8 : 85 1b __ STA ACCU + 0 
18ba : a9 0a __ LDA #$0a
18bc : 85 03 __ STA WORK + 0 
18be : 20 4d 7c JSR $7c4d ; (divmod + 0)
18c1 : 18 __ __ CLC
18c2 : a5 1b __ LDA ACCU + 0 
18c4 : 69 30 __ ADC #$30
18c6 : a4 43 __ LDY T1 + 0 
18c8 : 91 0d __ STA (P0),y ; (buf + 0)
18ca : 18 __ __ CLC
18cb : a5 05 __ LDA WORK + 2 
18cd : 69 30 __ ADC #$30
18cf : c8 __ __ INY
18d0 : 91 0d __ STA (P0),y ; (buf + 0)
.s3:
18d2 : 60 __ __ RTS
--------------------------------------------------------------------
strcat: ; strcat(u8*,const u8*)->void
;  14, "/home/xahmol/oscar64/include/string.h"
.s4:
18d3 : a5 0d __ LDA P0 ; (dst + 0)
18d5 : 85 1b __ STA ACCU + 0 
18d7 : a5 0e __ LDA P1 ; (dst + 1)
18d9 : 85 1c __ STA ACCU + 1 
18db : a0 00 __ LDY #$00
18dd : b1 0d __ LDA (P0),y ; (dst + 0)
18df : f0 0f __ BEQ $18f0 ; (strcat.s5 + 0)
.s6:
18e1 : 84 1b __ STY ACCU + 0 
18e3 : a4 0d __ LDY P0 ; (dst + 0)
.l7:
18e5 : c8 __ __ INY
18e6 : d0 02 __ BNE $18ea ; (strcat.s11 + 0)
.s10:
18e8 : e6 1c __ INC ACCU + 1 
.s11:
18ea : b1 1b __ LDA (ACCU + 0),y 
18ec : d0 f7 __ BNE $18e5 ; (strcat.l7 + 0)
.s8:
18ee : 84 1b __ STY ACCU + 0 
.s5:
18f0 : a8 __ __ TAY
.l9:
18f1 : b1 0f __ LDA (P2),y ; (src + 0)
18f3 : 91 1b __ STA (ACCU + 0),y 
18f5 : aa __ __ TAX
18f6 : e6 0f __ INC P2 ; (src + 0)
18f8 : d0 02 __ BNE $18fc ; (strcat.s13 + 0)
.s12:
18fa : e6 10 __ INC P3 ; (src + 1)
.s13:
18fc : e6 1b __ INC ACCU + 0 
18fe : d0 02 __ BNE $1902 ; (strcat.s15 + 0)
.s14:
1900 : e6 1c __ INC ACCU + 1 
.s15:
1902 : 8a __ __ TXA
1903 : d0 ec __ BNE $18f1 ; (strcat.l9 + 0)
.s3:
1905 : 60 __ __ RTS
--------------------------------------------------------------------
1906 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 4d 55 53 49 43 2e 2e 2e : lOADING MUSIC...
1916 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
modplay_load: ; modplay_load(u8*,u32)->u8
; 209, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s4:
1917 : 20 83 19 JSR $1983 ; (uii_open_file.s4 + 0)
191a : ad c9 99 LDA $99c9 ; (uii_status[0] + 0)
191d : c9 30 __ CMP #$30
191f : d0 07 __ BNE $1928 ; (modplay_load.s15 + 0)
.s5:
1921 : ad ca 99 LDA $99ca ; (uii_status[0] + 1)
1924 : c9 30 __ CMP #$30
1926 : f0 05 __ BEQ $192d ; (modplay_load.s6 + 0)
.s15:
1928 : a9 00 __ LDA #$00
.s3:
192a : 85 1b __ STA ACCU + 0 
192c : 60 __ __ RTS
.s6:
192d : a9 00 __ LDA #$00
192f : 85 48 __ STA T0 + 0 
1931 : 85 4b __ STA T0 + 3 
1933 : a8 __ __ TAY
1934 : aa __ __ TAX
1935 : a9 10 __ LDA #$10
1937 : 85 4c __ STA T2 + 0 
.l7:
1939 : 86 13 __ STX P6 
193b : 84 12 __ STY P5 
193d : a5 48 __ LDA T0 + 0 
193f : 85 11 __ STA P4 
1941 : a5 4b __ LDA T0 + 3 
1943 : 85 14 __ STA P7 
1945 : 20 11 1a JSR $1a11 ; (uii_load_reu.s4 + 0)
1948 : 18 __ __ CLC
1949 : a5 11 __ LDA P4 
194b : 69 ff __ ADC #$ff
194d : 85 48 __ STA T0 + 0 
194f : a5 12 __ LDA P5 
1951 : 69 7f __ ADC #$7f
1953 : a8 __ __ TAY
1954 : a5 13 __ LDA P6 
1956 : 69 00 __ ADC #$00
1958 : aa __ __ TAX
1959 : a5 14 __ LDA P7 
195b : 69 00 __ ADC #$00
195d : 85 4b __ STA T0 + 3 
195f : ad c9 99 LDA $99c9 ; (uii_status[0] + 0)
1962 : c9 30 __ CMP #$30
1964 : d0 0b __ BNE $1971 ; (modplay_load.s10 + 0)
.s8:
1966 : ad ca 99 LDA $99ca ; (uii_status[0] + 1)
1969 : c9 30 __ CMP #$30
196b : d0 04 __ BNE $1971 ; (modplay_load.s10 + 0)
.s9:
196d : c6 4c __ DEC T2 + 0 
196f : d0 c8 __ BNE $1939 ; (modplay_load.l7 + 0)
.s10:
1971 : a5 4b __ LDA T0 + 3 
1973 : d0 0a __ BNE $197f ; (modplay_load.s11 + 0)
.s12:
1975 : 8a __ __ TXA
1976 : d0 07 __ BNE $197f ; (modplay_load.s11 + 0)
.s13:
1978 : 98 __ __ TYA
1979 : d0 04 __ BNE $197f ; (modplay_load.s11 + 0)
.s14:
197b : c5 48 __ CMP T0 + 0 
197d : b0 ab __ BCS $192a ; (modplay_load.s3 + 0)
.s11:
197f : a9 01 __ LDA #$01
1981 : d0 a7 __ BNE $192a ; (modplay_load.s3 + 0)
--------------------------------------------------------------------
uii_open_file: ; uii_open_file(u8,u8*)->void
;  31, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
1983 : a9 e3 __ LDA #$e3
1985 : 85 0d __ STA P0 
1987 : 20 8c 80 JSR $808c ; (strlen@proxy + 0)
198a : 18 __ __ CLC
198b : a5 1b __ LDA ACCU + 0 
198d : 69 03 __ ADC #$03
198f : 85 1b __ STA ACCU + 0 
1991 : 90 02 __ BCC $1995 ; (uii_open_file.s11 + 0)
.s10:
1993 : e6 1c __ INC ACCU + 1 
.s11:
1995 : 20 89 7d JSR $7d89 ; (crt_malloc + 0)
1998 : a5 1c __ LDA ACCU + 1 
199a : 05 1b __ ORA ACCU + 0 
199c : d0 01 __ BNE $199f ; (uii_open_file.s5 + 0)
.s3:
199e : 60 __ __ RTS
.s5:
199f : a5 1c __ LDA ACCU + 1 
19a1 : 85 47 __ STA T2 + 1 
19a3 : a5 1b __ LDA ACCU + 0 
19a5 : 85 46 __ STA T2 + 0 
19a7 : a9 00 __ LDA #$00
19a9 : a8 __ __ TAY
19aa : 91 1b __ STA (ACCU + 0),y 
19ac : a9 80 __ LDA #$80
19ae : 85 0e __ STA P1 
19b0 : a9 02 __ LDA #$02
19b2 : c8 __ __ INY
19b3 : 91 1b __ STA (ACCU + 0),y 
19b5 : 98 __ __ TYA
19b6 : c8 __ __ INY
19b7 : 91 1b __ STA (ACCU + 0),y 
19b9 : 20 e9 10 JSR $10e9 ; (strlen.s4 + 0)
19bc : a5 1b __ LDA ACCU + 0 
19be : 05 1c __ ORA ACCU + 1 
19c0 : f0 23 __ BEQ $19e5 ; (uii_open_file.s6 + 0)
.s7:
19c2 : a9 00 __ LDA #$00
19c4 : 85 45 __ STA T1 + 0 
.l9:
19c6 : a9 80 __ LDA #$80
19c8 : 85 0e __ STA P1 
19ca : a6 45 __ LDX T1 + 0 
19cc : 8a __ __ TXA
19cd : 18 __ __ CLC
19ce : 69 03 __ ADC #$03
19d0 : a8 __ __ TAY
19d1 : bd e3 80 LDA $80e3,x ; (mod_file[0] + 0)
19d4 : 91 46 __ STA (T2 + 0),y 
19d6 : 20 e9 10 JSR $10e9 ; (strlen.s4 + 0)
19d9 : e6 45 __ INC T1 + 0 
19db : a5 1c __ LDA ACCU + 1 
19dd : d0 e7 __ BNE $19c6 ; (uii_open_file.l9 + 0)
.s8:
19df : a5 45 __ LDA T1 + 0 
19e1 : c5 1b __ CMP ACCU + 0 
19e3 : 90 e1 __ BCC $19c6 ; (uii_open_file.l9 + 0)
.s6:
19e5 : a9 01 __ LDA #$01
19e7 : 8d ff 15 STA $15ff ; (uii_target + 0)
19ea : 20 8c 80 JSR $808c ; (strlen@proxy + 0)
19ed : a5 46 __ LDA T2 + 0 
19ef : 85 0d __ STA P0 
19f1 : a5 47 __ LDA T2 + 1 
19f3 : 85 0e __ STA P1 
19f5 : 18 __ __ CLC
19f6 : a5 1b __ LDA ACCU + 0 
19f8 : 69 03 __ ADC #$03
19fa : 85 0f __ STA P2 
19fc : a5 1c __ LDA ACCU + 1 
19fe : 69 00 __ ADC #$00
1a00 : 85 10 __ STA P3 
1a02 : 20 42 13 JSR $1342 ; (uii_sendcommand.s4 + 0)
1a05 : 20 81 7e JSR $7e81 ; (crt_free@proxy + 0)
1a08 : 20 bd 13 JSR $13bd ; (uii_readdata.s4 + 0)
1a0b : 20 ed 13 JSR $13ed ; (uii_readstatus.s4 + 0)
1a0e : 4c 4b 14 JMP $144b ; (uii_accept.s4 + 0)
--------------------------------------------------------------------
uii_load_reu: ; uii_load_reu(u32,u32)->void
;  46, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
1a11 : a9 00 __ LDA #$00
1a13 : 85 10 __ STA P3 
1a15 : 8d e0 bf STA $bfe0 ; (cmd[0] + 0)
1a18 : 8d e8 bf STA $bfe8 ; (cmd[0] + 8)
1a1b : 8d e9 bf STA $bfe9 ; (cmd[0] + 9)
1a1e : a9 0a __ LDA #$0a
1a20 : 85 0f __ STA P2 
1a22 : a9 01 __ LDA #$01
1a24 : 8d ff 15 STA $15ff ; (uii_target + 0)
1a27 : a9 21 __ LDA #$21
1a29 : 8d e1 bf STA $bfe1 ; (cmd[0] + 1)
1a2c : a9 ff __ LDA #$ff
1a2e : 8d e6 bf STA $bfe6 ; (cmd[0] + 6)
1a31 : a9 7f __ LDA #$7f
1a33 : 8d e7 bf STA $bfe7 ; (cmd[0] + 7)
1a36 : a5 11 __ LDA P4 ; (reu_addr + 0)
1a38 : 8d e2 bf STA $bfe2 ; (cmd[0] + 2)
1a3b : a5 12 __ LDA P5 ; (reu_addr + 1)
1a3d : 8d e3 bf STA $bfe3 ; (cmd[0] + 3)
1a40 : a5 13 __ LDA P6 ; (reu_addr + 2)
1a42 : 8d e4 bf STA $bfe4 ; (cmd[0] + 4)
1a45 : a5 14 __ LDA P7 ; (reu_addr + 3)
1a47 : 8d e5 bf STA $bfe5 ; (cmd[0] + 5)
1a4a : a9 e0 __ LDA #$e0
1a4c : 85 0d __ STA P0 
1a4e : a9 bf __ LDA #$bf
1a50 : 85 0e __ STA P1 
1a52 : 20 42 13 JSR $1342 ; (uii_sendcommand.s4 + 0)
1a55 : 20 bd 13 JSR $13bd ; (uii_readdata.s4 + 0)
1a58 : 20 ed 13 JSR $13ed ; (uii_readstatus.s4 + 0)
1a5b : 4c 4b 14 JMP $144b ; (uii_accept.s4 + 0)
--------------------------------------------------------------------
uii_scan_media: ; uii_scan_media(u8[]*,u8*)->void
;  75, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
1a5e : a9 00 __ LDA #$00
1a60 : a8 __ __ TAY
1a61 : 91 15 __ STA (P8),y ; (count + 0)
1a63 : a9 fe __ LDA #$fe
1a65 : 85 11 __ STA P4 
1a67 : a9 7a __ LDA #$7a
1a69 : 85 12 __ STA P5 
1a6b : 20 ab 1b JSR $1bab ; (uii_change_dir.s4 + 0)
1a6e : a9 00 __ LDA #$00
1a70 : 85 10 __ STA P3 
1a72 : 8d e8 bf STA $bfe8 ; (cmd[0] + 0)
1a75 : a9 02 __ LDA #$02
1a77 : 85 0f __ STA P2 
1a79 : a9 01 __ LDA #$01
1a7b : 8d ff 15 STA $15ff ; (uii_target + 0)
1a7e : a9 13 __ LDA #$13
1a80 : 8d e9 bf STA $bfe9 ; (cmd[0] + 1)
1a83 : a9 e8 __ LDA #$e8
1a85 : 85 0d __ STA P0 
1a87 : a9 bf __ LDA #$bf
1a89 : 85 0e __ STA P1 
1a8b : 20 42 13 JSR $1342 ; (uii_sendcommand.s4 + 0)
1a8e : 20 ed 13 JSR $13ed ; (uii_readstatus.s4 + 0)
1a91 : 20 4b 14 JSR $144b ; (uii_accept.s4 + 0)
1a94 : ad c9 99 LDA $99c9 ; (uii_status[0] + 0)
1a97 : c9 30 __ CMP #$30
1a99 : d0 70 __ BNE $1b0b ; (uii_scan_media.s3 + 0)
.s5:
1a9b : ad ca 99 LDA $99ca ; (uii_status[0] + 1)
1a9e : c9 30 __ CMP #$30
1aa0 : d0 69 __ BNE $1b0b ; (uii_scan_media.s3 + 0)
.s6:
1aa2 : a9 01 __ LDA #$01
1aa4 : 8d ff 15 STA $15ff ; (uii_target + 0)
1aa7 : a9 00 __ LDA #$00
1aa9 : 8d e6 bf STA $bfe6 ; (cmd[0] + 0)
1aac : a9 14 __ LDA #$14
1aae : 8d e7 bf STA $bfe7 ; (cmd[0] + 1)
1ab1 : a9 e6 __ LDA #$e6
1ab3 : 85 0d __ STA P0 
1ab5 : a9 bf __ LDA #$bf
1ab7 : 85 0e __ STA P1 
1ab9 : 20 42 13 JSR $1342 ; (uii_sendcommand.s4 + 0)
1abc : 2c 1c df BIT $df1c 
1abf : 10 4a __ BPL $1b0b ; (uii_scan_media.s3 + 0)
.l8:
1ac1 : 20 bd 13 JSR $13bd ; (uii_readdata.s4 + 0)
1ac4 : 20 4b 14 JSR $144b ; (uii_accept.s4 + 0)
1ac7 : ad c8 97 LDA $97c8 ; (uii_data[0] + 0)
1aca : 29 10 __ AND #$10
1acc : f0 38 __ BEQ $1b06 ; (uii_scan_media.s7 + 0)
.s9:
1ace : ad c9 97 LDA $97c9 ; (uii_data[0] + 1)
1ad1 : f0 33 __ BEQ $1b06 ; (uii_scan_media.s7 + 0)
.s10:
1ad3 : 20 4a 1c JSR $1c4a ; (_uii_lc.s4 + 0)
1ad6 : 85 49 __ STA T3 + 0 
1ad8 : ad ca 97 LDA $97ca ; (uii_data[0] + 2)
1adb : 20 4a 1c JSR $1c4a ; (_uii_lc.s4 + 0)
1ade : 85 4a __ STA T4 + 0 
1ae0 : ad cb 97 LDA $97cb ; (uii_data[0] + 3)
1ae3 : 20 4a 1c JSR $1c4a ; (_uii_lc.s4 + 0)
1ae6 : aa __ __ TAX
1ae7 : a5 49 __ LDA T3 + 0 
1ae9 : c9 73 __ CMP #$73
1aeb : d0 03 __ BNE $1af0 ; (uii_scan_media.s18 + 0)
1aed : 4c 9f 1b JMP $1b9f ; (uii_scan_media.s11 + 0)
.s18:
1af0 : c9 75 __ CMP #$75
1af2 : d0 12 __ BNE $1b06 ; (uii_scan_media.s7 + 0)
.s19:
1af4 : a5 4a __ LDA T4 + 0 
1af6 : c9 73 __ CMP #$73
1af8 : d0 0c __ BNE $1b06 ; (uii_scan_media.s7 + 0)
.s20:
1afa : e0 62 __ CPX #$62
1afc : d0 08 __ BNE $1b06 ; (uii_scan_media.s7 + 0)
.s12:
1afe : a0 00 __ LDY #$00
1b00 : b1 15 __ LDA (P8),y ; (count + 0)
1b02 : c9 05 __ CMP #$05
1b04 : 90 06 __ BCC $1b0c ; (uii_scan_media.s13 + 0)
.s7:
1b06 : 2c 1c df BIT $df1c 
1b09 : 30 b6 __ BMI $1ac1 ; (uii_scan_media.l8 + 0)
.s3:
1b0b : 60 __ __ RTS
.s13:
1b0c : aa __ __ TAX
1b0d : a9 2f __ LDA #$2f
1b0f : bc 88 7f LDY $7f88,x ; (__multab16L + 0)
1b12 : 91 13 __ STA (P6),y ; (drives + 0)
1b14 : a9 00 __ LDA #$00
1b16 : 85 4b __ STA T5 + 0 
.l14:
1b18 : a6 4b __ LDX T5 + 0 
1b1a : bd c9 97 LDA $97c9,x ; (uii_data[0] + 1)
1b1d : f0 04 __ BEQ $1b23 ; (uii_scan_media.s15 + 0)
.s16:
1b1f : e0 0d __ CPX #$0d
1b21 : 90 52 __ BCC $1b75 ; (uii_scan_media.s17 + 0)
.s15:
1b23 : a0 00 __ LDY #$00
1b25 : b1 15 __ LDA (P8),y ; (count + 0)
1b27 : 0a __ __ ASL
1b28 : 2a __ __ ROL
1b29 : 2a __ __ ROL
1b2a : 2a __ __ ROL
1b2b : aa __ __ TAX
1b2c : 29 07 __ AND #$07
1b2e : 2a __ __ ROL
1b2f : a8 __ __ TAY
1b30 : 8a __ __ TXA
1b31 : 29 f0 __ AND #$f0
1b33 : 65 13 __ ADC P6 ; (drives + 0)
1b35 : 85 43 __ STA T0 + 0 
1b37 : 98 __ __ TYA
1b38 : 65 14 __ ADC P7 ; (drives + 1)
1b3a : 85 44 __ STA T0 + 1 
1b3c : a9 2f __ LDA #$2f
1b3e : a4 4b __ LDY T5 + 0 
1b40 : c8 __ __ INY
1b41 : 91 43 __ STA (T0 + 0),y 
1b43 : a0 00 __ LDY #$00
1b45 : b1 15 __ LDA (P8),y ; (count + 0)
1b47 : 0a __ __ ASL
1b48 : 2a __ __ ROL
1b49 : 2a __ __ ROL
1b4a : 2a __ __ ROL
1b4b : aa __ __ TAX
1b4c : 29 07 __ AND #$07
1b4e : 2a __ __ ROL
1b4f : a8 __ __ TAY
1b50 : 8a __ __ TXA
1b51 : 29 f0 __ AND #$f0
1b53 : 65 13 __ ADC P6 ; (drives + 0)
1b55 : 85 43 __ STA T0 + 0 
1b57 : 98 __ __ TYA
1b58 : 65 14 __ ADC P7 ; (drives + 1)
1b5a : 85 44 __ STA T0 + 1 
1b5c : a9 00 __ LDA #$00
1b5e : a4 4b __ LDY T5 + 0 
1b60 : c8 __ __ INY
1b61 : c8 __ __ INY
1b62 : 91 43 __ STA (T0 + 0),y 
1b64 : a8 __ __ TAY
1b65 : b1 15 __ LDA (P8),y ; (count + 0)
1b67 : 18 __ __ CLC
1b68 : 69 01 __ ADC #$01
1b6a : 91 15 __ STA (P8),y ; (count + 0)
1b6c : 2c 1c df BIT $df1c 
1b6f : 10 03 __ BPL $1b74 ; (uii_scan_media.s15 + 81)
1b71 : 4c c1 1a JMP $1ac1 ; (uii_scan_media.l8 + 0)
1b74 : 60 __ __ RTS
.s17:
1b75 : 20 4a 1c JSR $1c4a ; (_uii_lc.s4 + 0)
1b78 : aa __ __ TAX
1b79 : a0 00 __ LDY #$00
1b7b : b1 15 __ LDA (P8),y ; (count + 0)
1b7d : 0a __ __ ASL
1b7e : 2a __ __ ROL
1b7f : 2a __ __ ROL
1b80 : 2a __ __ ROL
1b81 : a8 __ __ TAY
1b82 : 29 07 __ AND #$07
1b84 : 2a __ __ ROL
1b85 : 85 44 __ STA T0 + 1 
1b87 : 98 __ __ TYA
1b88 : 29 f0 __ AND #$f0
1b8a : 65 13 __ ADC P6 ; (drives + 0)
1b8c : 85 43 __ STA T0 + 0 
1b8e : a5 44 __ LDA T0 + 1 
1b90 : 65 14 __ ADC P7 ; (drives + 1)
1b92 : 85 44 __ STA T0 + 1 
1b94 : 8a __ __ TXA
1b95 : a4 4b __ LDY T5 + 0 
1b97 : c8 __ __ INY
1b98 : 84 4b __ STY T5 + 0 
1b9a : 91 43 __ STA (T0 + 0),y 
1b9c : 4c 18 1b JMP $1b18 ; (uii_scan_media.l14 + 0)
.s11:
1b9f : a5 4a __ LDA T4 + 0 
1ba1 : c9 64 __ CMP #$64
1ba3 : f0 03 __ BEQ $1ba8 ; (uii_scan_media.s11 + 9)
1ba5 : 4c 06 1b JMP $1b06 ; (uii_scan_media.s7 + 0)
1ba8 : 4c fe 1a JMP $1afe ; (uii_scan_media.s12 + 0)
--------------------------------------------------------------------
uii_change_dir: ; uii_change_dir(u8*)->void
;  25, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
1bab : a5 11 __ LDA P4 ; (directory + 0)
1bad : 85 0d __ STA P0 
1baf : 20 e5 10 JSR $10e5 ; (strlen@proxy + 0)
1bb2 : 18 __ __ CLC
1bb3 : a5 1b __ LDA ACCU + 0 
1bb5 : 69 02 __ ADC #$02
1bb7 : 85 1b __ STA ACCU + 0 
1bb9 : 90 02 __ BCC $1bbd ; (uii_change_dir.s11 + 0)
.s10:
1bbb : e6 1c __ INC ACCU + 1 
.s11:
1bbd : 20 89 7d JSR $7d89 ; (crt_malloc + 0)
1bc0 : a5 1c __ LDA ACCU + 1 
1bc2 : 05 1b __ ORA ACCU + 0 
1bc4 : d0 01 __ BNE $1bc7 ; (uii_change_dir.s5 + 0)
.s3:
1bc6 : 60 __ __ RTS
.s5:
1bc7 : a5 1c __ LDA ACCU + 1 
1bc9 : 85 46 __ STA T2 + 1 
1bcb : a5 1b __ LDA ACCU + 0 
1bcd : 85 45 __ STA T2 + 0 
1bcf : a9 00 __ LDA #$00
1bd1 : a8 __ __ TAY
1bd2 : 91 1b __ STA (ACCU + 0),y 
1bd4 : a9 11 __ LDA #$11
1bd6 : c8 __ __ INY
1bd7 : 91 1b __ STA (ACCU + 0),y 
1bd9 : a9 00 __ LDA #$00
1bdb : 85 47 __ STA T3 + 0 
1bdd : 85 48 __ STA T3 + 1 
.l12:
1bdf : 20 e5 10 JSR $10e5 ; (strlen@proxy + 0)
1be2 : a5 48 __ LDA T3 + 1 
1be4 : c5 1c __ CMP ACCU + 1 
1be6 : d0 5c __ BNE $1c44 ; (uii_change_dir.s9 + 0)
.s8:
1be8 : a5 47 __ LDA T3 + 0 
1bea : c5 1b __ CMP ACCU + 0 
1bec : 90 2d __ BCC $1c1b ; (uii_change_dir.s7 + 0)
.s6:
1bee : a5 12 __ LDA P5 ; (directory + 1)
1bf0 : 85 0e __ STA P1 
1bf2 : a9 01 __ LDA #$01
1bf4 : 8d ff 15 STA $15ff ; (uii_target + 0)
1bf7 : 20 e9 10 JSR $10e9 ; (strlen.s4 + 0)
1bfa : a5 45 __ LDA T2 + 0 
1bfc : 85 0d __ STA P0 
1bfe : a5 46 __ LDA T2 + 1 
1c00 : 85 0e __ STA P1 
1c02 : 18 __ __ CLC
1c03 : a5 1b __ LDA ACCU + 0 
1c05 : 69 02 __ ADC #$02
1c07 : 85 0f __ STA P2 
1c09 : a5 1c __ LDA ACCU + 1 
1c0b : 69 00 __ ADC #$00
1c0d : 85 10 __ STA P3 
1c0f : 20 42 13 JSR $1342 ; (uii_sendcommand.s4 + 0)
1c12 : 20 81 7e JSR $7e81 ; (crt_free@proxy + 0)
1c15 : 20 ed 13 JSR $13ed ; (uii_readstatus.s4 + 0)
1c18 : 4c 4b 14 JMP $144b ; (uii_accept.s4 + 0)
.s7:
1c1b : 85 43 __ STA T0 + 0 
1c1d : 18 __ __ CLC
1c1e : a5 12 __ LDA P5 ; (directory + 1)
1c20 : 65 48 __ ADC T3 + 1 
1c22 : 85 44 __ STA T0 + 1 
1c24 : a4 11 __ LDY P4 ; (directory + 0)
1c26 : b1 43 __ LDA (T0 + 0),y 
1c28 : aa __ __ TAX
1c29 : 18 __ __ CLC
1c2a : a5 45 __ LDA T2 + 0 
1c2c : 65 47 __ ADC T3 + 0 
1c2e : 85 43 __ STA T0 + 0 
1c30 : a5 46 __ LDA T2 + 1 
1c32 : 65 48 __ ADC T3 + 1 
1c34 : 85 44 __ STA T0 + 1 
1c36 : 8a __ __ TXA
1c37 : a0 02 __ LDY #$02
1c39 : 91 43 __ STA (T0 + 0),y 
1c3b : e6 47 __ INC T3 + 0 
1c3d : d0 a0 __ BNE $1bdf ; (uii_change_dir.l12 + 0)
.s13:
1c3f : e6 48 __ INC T3 + 1 
1c41 : 4c df 1b JMP $1bdf ; (uii_change_dir.l12 + 0)
.s9:
1c44 : b0 a8 __ BCS $1bee ; (uii_change_dir.s6 + 0)
.s14:
1c46 : a5 47 __ LDA T3 + 0 
1c48 : 90 d1 __ BCC $1c1b ; (uii_change_dir.s7 + 0)
--------------------------------------------------------------------
_uii_lc: ; _uii_lc(u8)->u8
; 925, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.c"
.s4:
1c4a : c9 41 __ CMP #$41
1c4c : 90 06 __ BCC $1c54 ; (_uii_lc.s3 + 0)
.s5:
1c4e : c9 5b __ CMP #$5b
1c50 : b0 02 __ BCS $1c54 ; (_uii_lc.s3 + 0)
.s6:
1c52 : 09 20 __ ORA #$20
.s3:
1c54 : 60 __ __ RTS
--------------------------------------------------------------------
uii_find_media_path: ; uii_find_media_path(u8[]*,u8,u8*,u8*)->u8
;  82, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
1c55 : a9 00 __ LDA #$00
1c57 : a8 __ __ TAY
1c58 : 91 16 __ STA (P9),y ; (result + 0)
1c5a : a9 eb __ LDA #$eb
1c5c : 85 0d __ STA P0 
1c5e : a9 80 __ LDA #$80
1c60 : 85 0e __ STA P1 
1c62 : 20 e9 10 JSR $10e9 ; (strlen.s4 + 0)
1c65 : a5 15 __ LDA P8 ; (drv_count + 0)
1c67 : d0 03 __ BNE $1c6c ; (uii_find_media_path.s6 + 0)
1c69 : 4c 02 1d JMP $1d02 ; (uii_find_media_path.s5 + 0)
.s6:
1c6c : a5 1b __ LDA ACCU + 0 
1c6e : 85 49 __ STA T2 + 0 
1c70 : 18 __ __ CLC
1c71 : 69 01 __ ADC #$01
1c73 : 85 4a __ STA T3 + 0 
1c75 : a9 00 __ LDA #$00
1c77 : 2a __ __ ROL
1c78 : 85 4b __ STA T3 + 1 
1c7a : a9 00 __ LDA #$00
1c7c : 85 4f __ STA T8 + 0 
.l7:
1c7e : 0a __ __ ASL
1c7f : 2a __ __ ROL
1c80 : 2a __ __ ROL
1c81 : 2a __ __ ROL
1c82 : a8 __ __ TAY
1c83 : 29 07 __ AND #$07
1c85 : 2a __ __ ROL
1c86 : aa __ __ TAX
1c87 : 98 __ __ TYA
1c88 : 29 f0 __ AND #$f0
1c8a : 65 13 __ ADC P6 ; (drives + 0)
1c8c : 85 0d __ STA P0 
1c8e : 8a __ __ TXA
1c8f : 65 14 __ ADC P7 ; (drives + 1)
1c91 : 85 4d __ STA T5 + 1 
1c93 : 85 0e __ STA P1 
1c95 : 20 e9 10 JSR $10e9 ; (strlen.s4 + 0)
1c98 : 18 __ __ CLC
1c99 : a5 1b __ LDA ACCU + 0 
1c9b : 65 49 __ ADC T2 + 0 
1c9d : c9 7f __ CMP #$7f
1c9f : b0 56 __ BCS $1cf7 ; (uii_find_media_path.s9 + 0)
.s8:
1ca1 : a5 1b __ LDA ACCU + 0 
1ca3 : 85 11 __ STA P4 
1ca5 : 85 4e __ STA T6 + 0 
1ca7 : a5 0d __ LDA P0 
1ca9 : 85 0f __ STA P2 
1cab : a5 4d __ LDA T5 + 1 
1cad : 85 10 __ STA P3 
1caf : a9 00 __ LDA #$00
1cb1 : 85 12 __ STA P5 
1cb3 : a9 9b __ LDA #$9b
1cb5 : 85 0e __ STA P1 
1cb7 : a9 00 __ LDA #$00
1cb9 : 85 0d __ STA P0 
1cbb : 20 15 1d JSR $1d15 ; (memcpy.s4 + 0)
1cbe : a5 4a __ LDA T3 + 0 
1cc0 : 85 11 __ STA P4 
1cc2 : a5 4b __ LDA T3 + 1 
1cc4 : 85 12 __ STA P5 
1cc6 : 18 __ __ CLC
1cc7 : a9 00 __ LDA #$00
1cc9 : 65 4e __ ADC T6 + 0 
1ccb : 85 0d __ STA P0 
1ccd : a9 9b __ LDA #$9b
1ccf : 69 00 __ ADC #$00
1cd1 : 85 0e __ STA P1 
1cd3 : a9 eb __ LDA #$eb
1cd5 : 85 0f __ STA P2 
1cd7 : a9 80 __ LDA #$80
1cd9 : 85 10 __ STA P3 
1cdb : 20 15 1d JSR $1d15 ; (memcpy.s4 + 0)
1cde : a9 00 __ LDA #$00
1ce0 : 85 11 __ STA P4 
1ce2 : a9 9b __ LDA #$9b
1ce4 : 85 12 __ STA P5 
1ce6 : 20 ab 1b JSR $1bab ; (uii_change_dir.s4 + 0)
1ce9 : ad c9 99 LDA $99c9 ; (uii_status[0] + 0)
1cec : c9 30 __ CMP #$30
1cee : d0 07 __ BNE $1cf7 ; (uii_find_media_path.s9 + 0)
.s10:
1cf0 : ad ca 99 LDA $99ca ; (uii_status[0] + 1)
1cf3 : c9 30 __ CMP #$30
1cf5 : f0 10 __ BEQ $1d07 ; (uii_find_media_path.s11 + 0)
.s9:
1cf7 : e6 4f __ INC T8 + 0 
1cf9 : a5 4f __ LDA T8 + 0 
1cfb : c5 15 __ CMP P8 ; (drv_count + 0)
1cfd : b0 03 __ BCS $1d02 ; (uii_find_media_path.s5 + 0)
1cff : 4c 7e 1c JMP $1c7e ; (uii_find_media_path.l7 + 0)
.s5:
1d02 : a9 00 __ LDA #$00
.s3:
1d04 : 85 1b __ STA ACCU + 0 
1d06 : 60 __ __ RTS
.s11:
1d07 : a0 ff __ LDY #$ff
.l12:
1d09 : c8 __ __ INY
1d0a : b9 00 9b LDA $9b00,y ; (_uii_fp[0] + 0)
1d0d : 91 16 __ STA (P9),y ; (result + 0)
1d0f : d0 f8 __ BNE $1d09 ; (uii_find_media_path.l12 + 0)
.s13:
1d11 : a9 01 __ LDA #$01
1d13 : d0 ef __ BNE $1d04 ; (uii_find_media_path.s3 + 0)
--------------------------------------------------------------------
memcpy: ; memcpy(void*,const void*,i16)->void
;  30, "/home/xahmol/oscar64/include/string.h"
.s4:
1d15 : a6 12 __ LDX P5 
1d17 : f0 10 __ BEQ $1d29 ; (memcpy.s4 + 20)
1d19 : a0 00 __ LDY #$00
1d1b : b1 0f __ LDA (P2),y 
1d1d : 91 0d __ STA (P0),y 
1d1f : c8 __ __ INY
1d20 : d0 f9 __ BNE $1d1b ; (memcpy.s4 + 6)
1d22 : e6 10 __ INC P3 
1d24 : e6 0e __ INC P1 
1d26 : ca __ __ DEX
1d27 : d0 f2 __ BNE $1d1b ; (memcpy.s4 + 6)
1d29 : a4 11 __ LDY P4 
1d2b : f0 0e __ BEQ $1d3b ; (memcpy.s3 + 0)
1d2d : 88 __ __ DEY
1d2e : f0 07 __ BEQ $1d37 ; (memcpy.s4 + 34)
1d30 : b1 0f __ LDA (P2),y 
1d32 : 91 0d __ STA (P0),y 
1d34 : 88 __ __ DEY
1d35 : d0 f9 __ BNE $1d30 ; (memcpy.s4 + 27)
1d37 : b1 0f __ LDA (P2),y 
1d39 : 91 0d __ STA (P0),y 
.s3:
1d3b : 60 __ __ RTS
--------------------------------------------------------------------
modplay_init: ; modplay_init(u32)->u8
; 227, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s4:
1d3c : a9 00 __ LDA #$00
1d3e : 8d bc 9f STA $9fbc ; (modplay.reu_base + 0)
1d41 : 8d bd 9f STA $9fbd ; (modplay.reu_base + 1)
1d44 : 8d be 9f STA $9fbe ; (modplay.reu_base + 2)
1d47 : 8d bf 9f STA $9fbf ; (modplay.reu_base + 3)
1d4a : a2 80 __ LDX #$80
1d4c : 8e 02 df STX $df02 
1d4f : a2 9b __ LDX #$9b
1d51 : 8e 03 df STX $df03 
1d54 : 8d 04 df STA $df04 
1d57 : 8d 05 df STA $df05 
1d5a : 8d 06 df STA $df06 
1d5d : a9 3c __ LDA #$3c
1d5f : 8d 07 df STA $df07 
1d62 : a9 04 __ LDA #$04
1d64 : 8d 08 df STA $df08 
1d67 : a9 00 __ LDA #$00
1d69 : 8d 0a df STA $df0a 
1d6c : a9 91 __ LDA #$91
1d6e : 8d 01 df STA $df01 
1d71 : ad b8 9f LDA $9fb8 ; (hdr[0] + 1080)
1d74 : c9 4d __ CMP #$4d
1d76 : f0 03 __ BEQ $1d7b ; (modplay_init.s48 + 0)
1d78 : 4c db 1f JMP $1fdb ; (modplay_init.s5 + 0)
.s48:
1d7b : ad b9 9f LDA $9fb9 ; (hdr[0] + 1081)
1d7e : c9 2e __ CMP #$2e
1d80 : d0 03 __ BNE $1d85 ; (modplay_init.s49 + 0)
1d82 : 4c ca 1f JMP $1fca ; (modplay_init.s52 + 0)
.s49:
1d85 : c9 21 __ CMP #$21
1d87 : d0 0e __ BNE $1d97 ; (modplay_init.s6 + 0)
.s50:
1d89 : ad ba 9f LDA $9fba ; (hdr[0] + 1082)
1d8c : c9 4b __ CMP #$4b
1d8e : d0 07 __ BNE $1d97 ; (modplay_init.s6 + 0)
.s51:
1d90 : ad bb 9f LDA $9fbb ; (hdr[0] + 1083)
1d93 : c9 21 __ CMP #$21
1d95 : f0 1c __ BEQ $1db3 ; (modplay_init.s44 + 0)
.s6:
1d97 : ad b8 9f LDA $9fb8 ; (hdr[0] + 1080)
1d9a : c9 46 __ CMP #$46
1d9c : d0 19 __ BNE $1db7 ; (modplay_init.s7 + 0)
.s41:
1d9e : ad b9 9f LDA $9fb9 ; (hdr[0] + 1081)
1da1 : c9 4c __ CMP #$4c
1da3 : d0 12 __ BNE $1db7 ; (modplay_init.s7 + 0)
.s42:
1da5 : ad ba 9f LDA $9fba ; (hdr[0] + 1082)
1da8 : c9 54 __ CMP #$54
1daa : d0 0b __ BNE $1db7 ; (modplay_init.s7 + 0)
.s43:
1dac : ad bb 9f LDA $9fbb ; (hdr[0] + 1083)
1daf : c9 34 __ CMP #$34
1db1 : d0 04 __ BNE $1db7 ; (modplay_init.s7 + 0)
.s44:
1db3 : a9 1f __ LDA #$1f
1db5 : d0 17 __ BNE $1dce ; (modplay_init.s12 + 0)
.s7:
1db7 : a2 00 __ LDX #$00
.l8:
1db9 : bd b8 9f LDA $9fb8,x ; (hdr[0] + 1080)
1dbc : c9 20 __ CMP #$20
1dbe : b0 03 __ BCS $1dc3 ; (modplay_init.s9 + 0)
1dc0 : 4c c5 1f JMP $1fc5 ; (modplay_init.s40 + 0)
.s9:
1dc3 : c9 7f __ CMP #$7f
1dc5 : b0 f9 __ BCS $1dc0 ; (modplay_init.l8 + 7)
.s10:
1dc7 : e8 __ __ INX
1dc8 : e0 04 __ CPX #$04
1dca : 90 ed __ BCC $1db9 ; (modplay_init.l8 + 0)
.s11:
1dcc : a9 0f __ LDA #$0f
.s12:
1dce : 8d c1 9f STA $9fc1 ; (modplay.num_samples + 0)
1dd1 : ad 36 9f LDA $9f36 ; (hdr[0] + 950)
1dd4 : 8d c0 9f STA $9fc0 ; (modplay.song_length + 0)
1dd7 : d0 09 __ BNE $1de2 ; (modplay_init.s39 + 0)
.s62:
1dd9 : a9 80 __ LDA #$80
.s13:
1ddb : 8d c0 9f STA $9fc0 ; (modplay.song_length + 0)
.s14:
1dde : a2 7f __ LDX #$7f
1de0 : d0 09 __ BNE $1deb ; (modplay_init.l15 + 0)
.s39:
1de2 : a9 80 __ LDA #$80
1de4 : cd 36 9f CMP $9f36 ; (hdr[0] + 950)
1de7 : b0 f5 __ BCS $1dde ; (modplay_init.s14 + 0)
1de9 : 90 f0 __ BCC $1ddb ; (modplay_init.s13 + 0)
.l15:
1deb : bd 38 9f LDA $9f38,x ; (hdr[0] + 952)
1dee : 9d c3 9f STA $9fc3,x ; (modplay.order_table[0] + 0)
1df1 : ca __ __ DEX
1df2 : 10 f7 __ BPL $1deb ; (modplay_init.l15 + 0)
.s16:
1df4 : a2 00 __ LDX #$00
1df6 : a0 00 __ LDY #$00
.l17:
1df8 : 98 __ __ TYA
1df9 : dd c3 9f CMP $9fc3,x ; (modplay.order_table[0] + 0)
1dfc : b0 04 __ BCS $1e02 ; (modplay_init.s18 + 0)
.s38:
1dfe : bd c3 9f LDA $9fc3,x ; (modplay.order_table[0] + 0)
1e01 : a8 __ __ TAY
.s18:
1e02 : e8 __ __ INX
1e03 : 10 f3 __ BPL $1df8 ; (modplay_init.l17 + 0)
.s19:
1e05 : 18 __ __ CLC
1e06 : 69 01 __ ADC #$01
1e08 : 85 1c __ STA ACCU + 1 
1e0a : 8d c2 9f STA $9fc2 ; (modplay.num_patterns + 0)
1e0d : a9 00 __ LDA #$00
1e0f : 06 1c __ ASL ACCU + 1 
1e11 : 2a __ __ ROL
1e12 : 06 1c __ ASL ACCU + 1 
1e14 : 2a __ __ ROL
1e15 : 85 1d __ STA ACCU + 2 
1e17 : ad c1 9f LDA $9fc1 ; (modplay.num_samples + 0)
1e1a : c9 1f __ CMP #$1f
1e1c : d0 03 __ BNE $1e21 ; (modplay_init.s20 + 0)
1e1e : 4c b1 1f JMP $1fb1 ; (modplay_init.s37 + 0)
.s20:
1e21 : a5 1c __ LDA ACCU + 1 
1e23 : 09 02 __ ORA #$02
1e25 : 85 1c __ STA ACCU + 1 
1e27 : a9 58 __ LDA #$58
1e29 : 85 1b __ STA ACCU + 0 
1e2b : ad c1 9f LDA $9fc1 ; (modplay.num_samples + 0)
1e2e : d0 66 __ BNE $1e96 ; (modplay_init.s31 + 0)
.s21:
1e30 : a9 00 __ LDA #$00
1e32 : 8d fe 80 STA $80fe ; (mod_paused + 0)
1e35 : 8d 43 a0 STA $a043 ; (modplay.order_pos + 0)
1e38 : 8d 45 a0 STA $a045 ; (modplay.row + 0)
1e3b : 8d 46 a0 STA $a046 ; (modplay.tick + 0)
1e3e : 8d 4c a0 STA $a04c ; (modplay.active + 0)
1e41 : ad c3 9f LDA $9fc3 ; (modplay.order_table[0] + 0)
1e44 : 8d 44 a0 STA $a044 ; (modplay.pattern_num + 0)
1e47 : a9 01 __ LDA #$01
1e49 : 8d 4b a0 STA $a04b ; (modplay.stereo + 0)
1e4c : 8d 4d a0 STA $a04d ; (modplay.loop_song + 0)
1e4f : a9 06 __ LDA #$06
1e51 : 8d 47 a0 STA $a047 ; (modplay.ticks_per_row + 0)
1e54 : a9 7d __ LDA #$7d
1e56 : 8d 48 a0 STA $a048 ; (modplay.bpm + 0)
1e59 : a9 00 __ LDA #$00
1e5b : a2 c8 __ LDX #$c8
1e5d : 8e 4a a0 STX $a04a ; (modplay.master_volume + 0)
.l22:
1e60 : ca __ __ DEX
1e61 : 9d 9e a2 STA $a29e,x ; (modplay.channel[0].sample_num + 0)
1e64 : d0 fa __ BNE $1e60 ; (modplay_init.l22 + 0)
.s23:
1e66 : 85 46 __ STA T2 + 0 
.l24:
1e68 : a5 46 __ LDA T2 + 0 
1e6a : c9 01 __ CMP #$01
1e6c : f0 04 __ BEQ $1e72 ; (modplay_init.s30 + 0)
.s25:
1e6e : c9 02 __ CMP #$02
1e70 : d0 04 __ BNE $1e76 ; (modplay_init.s26 + 0)
.s30:
1e72 : a0 ff __ LDY #$ff
1e74 : d0 02 __ BNE $1e78 ; (modplay_init.l27 + 0)
.s26:
1e76 : a0 00 __ LDY #$00
.l27:
1e78 : a6 46 __ LDX T2 + 0 
1e7a : bd 8d 7f LDA $7f8d,x ; (__multab50L + 0)
1e7d : aa __ __ TAX
1e7e : 98 __ __ TYA
1e7f : 9d a4 a2 STA $a2a4,x ; (modplay.channel[0].pan + 0)
1e82 : e6 46 __ INC T2 + 0 
1e84 : a5 46 __ LDA T2 + 0 
1e86 : c9 04 __ CMP #$04
1e88 : b0 07 __ BCS $1e91 ; (modplay_init.s28 + 0)
.s29:
1e8a : ad 4b a0 LDA $a04b ; (modplay.stereo + 0)
1e8d : f0 e7 __ BEQ $1e76 ; (modplay_init.s26 + 0)
1e8f : d0 d7 __ BNE $1e68 ; (modplay_init.l24 + 0)
.s28:
1e91 : a9 01 __ LDA #$01
.s3:
1e93 : 85 1b __ STA ACCU + 0 
1e95 : 60 __ __ RTS
.s31:
1e96 : a9 00 __ LDA #$00
1e98 : 85 43 __ STA T1 + 0 
1e9a : 85 44 __ STA T1 + 1 
1e9c : 85 45 __ STA T1 + 2 
1e9e : 85 1e __ STA ACCU + 3 
1ea0 : a9 51 __ LDA #$51
1ea2 : 85 4e __ STA T6 + 0 
1ea4 : a9 a0 __ LDA #$a0
1ea6 : 85 4f __ STA T6 + 1 
1ea8 : a9 94 __ LDA #$94
1eaa : 85 50 __ STA T7 + 0 
1eac : a9 9b __ LDA #$9b
1eae : 85 51 __ STA T7 + 1 
1eb0 : a2 00 __ LDX #$00
1eb2 : 18 __ __ CLC
.l32:
1eb3 : a5 1b __ LDA ACCU + 0 
1eb5 : 65 43 __ ADC T1 + 0 
1eb7 : a0 00 __ LDY #$00
1eb9 : 84 48 __ STY T2 + 2 
1ebb : 91 4e __ STA (T6 + 0),y 
1ebd : a5 1c __ LDA ACCU + 1 
1ebf : 65 44 __ ADC T1 + 1 
1ec1 : c8 __ __ INY
1ec2 : 91 4e __ STA (T6 + 0),y 
1ec4 : a5 1d __ LDA ACCU + 2 
1ec6 : 65 45 __ ADC T1 + 2 
1ec8 : c8 __ __ INY
1ec9 : 91 4e __ STA (T6 + 0),y 
1ecb : 8a __ __ TXA
1ecc : 69 00 __ ADC #$00
1ece : c8 __ __ INY
1ecf : 91 4e __ STA (T6 + 0),y 
1ed1 : a0 16 __ LDY #$16
1ed3 : b1 50 __ LDA (T7 + 0),y 
1ed5 : 85 47 __ STA T2 + 1 
1ed7 : c8 __ __ INY
1ed8 : b1 50 __ LDA (T7 + 0),y 
1eda : 0a __ __ ASL
1edb : 85 46 __ STA T2 + 0 
1edd : 26 47 __ ROL T2 + 1 
1edf : 26 48 __ ROL T2 + 2 
1ee1 : a0 04 __ LDY #$04
1ee3 : 91 4e __ STA (T6 + 0),y 
1ee5 : a5 47 __ LDA T2 + 1 
1ee7 : c8 __ __ INY
1ee8 : 91 4e __ STA (T6 + 0),y 
1eea : a5 48 __ LDA T2 + 2 
1eec : c8 __ __ INY
1eed : 91 4e __ STA (T6 + 0),y 
1eef : a9 00 __ LDA #$00
1ef1 : c8 __ __ INY
1ef2 : 91 4e __ STA (T6 + 0),y 
1ef4 : a0 19 __ LDY #$19
1ef6 : b1 50 __ LDA (T7 + 0),y 
1ef8 : c9 41 __ CMP #$41
1efa : 90 02 __ BCC $1efe ; (modplay_init.s54 + 0)
.s33:
1efc : a9 40 __ LDA #$40
.s54:
1efe : a0 11 __ LDY #$11
1f00 : 91 4e __ STA (T6 + 0),y 
1f02 : a0 18 __ LDY #$18
1f04 : b1 50 __ LDA (T7 + 0),y 
1f06 : 29 0f __ AND #$0f
1f08 : a0 12 __ LDY #$12
1f0a : 91 4e __ STA (T6 + 0),y 
1f0c : a0 1a __ LDY #$1a
1f0e : b1 50 __ LDA (T7 + 0),y 
1f10 : 85 4a __ STA T3 + 1 
1f12 : c8 __ __ INY
1f13 : b1 50 __ LDA (T7 + 0),y 
1f15 : 85 49 __ STA T3 + 0 
1f17 : 0a __ __ ASL
1f18 : a0 08 __ LDY #$08
1f1a : 91 4e __ STA (T6 + 0),y 
1f1c : a5 4a __ LDA T3 + 1 
1f1e : 2a __ __ ROL
1f1f : c8 __ __ INY
1f20 : 91 4e __ STA (T6 + 0),y 
1f22 : a9 00 __ LDA #$00
1f24 : 2a __ __ ROL
1f25 : c8 __ __ INY
1f26 : 91 4e __ STA (T6 + 0),y 
1f28 : a9 00 __ LDA #$00
1f2a : c8 __ __ INY
1f2b : 91 4e __ STA (T6 + 0),y 
1f2d : a0 1d __ LDY #$1d
1f2f : b1 50 __ LDA (T7 + 0),y 
1f31 : 85 4c __ STA T4 + 0 
1f33 : 65 49 __ ADC T3 + 0 
1f35 : 85 49 __ STA T3 + 0 
1f37 : 88 __ __ DEY
1f38 : b1 50 __ LDA (T7 + 0),y 
1f3a : 85 4d __ STA T4 + 1 
1f3c : 65 4a __ ADC T3 + 1 
1f3e : 85 4a __ STA T3 + 1 
1f40 : a9 00 __ LDA #$00
1f42 : 2a __ __ ROL
1f43 : 85 4b __ STA T3 + 2 
1f45 : a9 00 __ LDA #$00
1f47 : 06 49 __ ASL T3 + 0 
1f49 : 26 4a __ ROL T3 + 1 
1f4b : 26 4b __ ROL T3 + 2 
1f4d : a0 0f __ LDY #$0f
1f4f : 91 4e __ STA (T6 + 0),y 
1f51 : a5 49 __ LDA T3 + 0 
1f53 : a0 0c __ LDY #$0c
1f55 : 91 4e __ STA (T6 + 0),y 
1f57 : a5 4a __ LDA T3 + 1 
1f59 : c8 __ __ INY
1f5a : 91 4e __ STA (T6 + 0),y 
1f5c : a5 4b __ LDA T3 + 2 
1f5e : c8 __ __ INY
1f5f : 91 4e __ STA (T6 + 0),y 
1f61 : a5 4d __ LDA T4 + 1 
1f63 : f0 04 __ BEQ $1f69 ; (modplay_init.s36 + 0)
.s35:
1f65 : a9 01 __ LDA #$01
1f67 : d0 09 __ BNE $1f72 ; (modplay_init.s34 + 0)
.s36:
1f69 : a9 01 __ LDA #$01
1f6b : c5 4c __ CMP T4 + 0 
1f6d : a9 00 __ LDA #$00
1f6f : 2a __ __ ROL
1f70 : 49 01 __ EOR #$01
.s34:
1f72 : a0 10 __ LDY #$10
1f74 : 91 4e __ STA (T6 + 0),y 
1f76 : 18 __ __ CLC
1f77 : a5 46 __ LDA T2 + 0 
1f79 : 65 43 __ ADC T1 + 0 
1f7b : 85 43 __ STA T1 + 0 
1f7d : a5 47 __ LDA T2 + 1 
1f7f : 65 44 __ ADC T1 + 1 
1f81 : 85 44 __ STA T1 + 1 
1f83 : a5 48 __ LDA T2 + 2 
1f85 : 65 45 __ ADC T1 + 2 
1f87 : 85 45 __ STA T1 + 2 
1f89 : 90 02 __ BCC $1f8d ; (modplay_init.s57 + 0)
.s56:
1f8b : e8 __ __ INX
1f8c : 18 __ __ CLC
.s57:
1f8d : a5 50 __ LDA T7 + 0 
1f8f : 69 1e __ ADC #$1e
1f91 : 85 50 __ STA T7 + 0 
1f93 : 90 03 __ BCC $1f98 ; (modplay_init.s59 + 0)
.s58:
1f95 : e6 51 __ INC T7 + 1 
1f97 : 18 __ __ CLC
.s59:
1f98 : a5 4e __ LDA T6 + 0 
1f9a : 69 13 __ ADC #$13
1f9c : 85 4e __ STA T6 + 0 
1f9e : 90 02 __ BCC $1fa2 ; (modplay_init.s61 + 0)
.s60:
1fa0 : e6 4f __ INC T6 + 1 
.s61:
1fa2 : e6 1e __ INC ACCU + 3 
1fa4 : a5 1e __ LDA ACCU + 3 
1fa6 : cd c1 9f CMP $9fc1 ; (modplay.num_samples + 0)
1fa9 : b0 03 __ BCS $1fae ; (modplay_init.s61 + 12)
1fab : 4c b3 1e JMP $1eb3 ; (modplay_init.l32 + 0)
1fae : 4c 30 1e JMP $1e30 ; (modplay_init.s21 + 0)
.s37:
1fb1 : a9 3c __ LDA #$3c
1fb3 : 85 1b __ STA ACCU + 0 
1fb5 : a5 1c __ LDA ACCU + 1 
1fb7 : 69 03 __ ADC #$03
1fb9 : 85 1c __ STA ACCU + 1 
1fbb : b0 03 __ BCS $1fc0 ; (modplay_init.s55 + 0)
1fbd : 4c 96 1e JMP $1e96 ; (modplay_init.s31 + 0)
.s55:
1fc0 : e6 1d __ INC ACCU + 2 
1fc2 : 4c 96 1e JMP $1e96 ; (modplay_init.s31 + 0)
.s40:
1fc5 : a9 00 __ LDA #$00
1fc7 : 4c 93 1e JMP $1e93 ; (modplay_init.s3 + 0)
.s52:
1fca : ad ba 9f LDA $9fba ; (hdr[0] + 1082)
1fcd : c9 4b __ CMP #$4b
1fcf : d0 0a __ BNE $1fdb ; (modplay_init.s5 + 0)
.s53:
1fd1 : ad bb 9f LDA $9fbb ; (hdr[0] + 1083)
1fd4 : c9 2e __ CMP #$2e
1fd6 : d0 03 __ BNE $1fdb ; (modplay_init.s5 + 0)
1fd8 : 4c b3 1d JMP $1db3 ; (modplay_init.s44 + 0)
.s5:
1fdb : ad b8 9f LDA $9fb8 ; (hdr[0] + 1080)
1fde : c9 34 __ CMP #$34
1fe0 : f0 03 __ BEQ $1fe5 ; (modplay_init.s45 + 0)
1fe2 : 4c 97 1d JMP $1d97 ; (modplay_init.s6 + 0)
.s45:
1fe5 : ad b9 9f LDA $9fb9 ; (hdr[0] + 1081)
1fe8 : c9 43 __ CMP #$43
1fea : f0 03 __ BEQ $1fef ; (modplay_init.s46 + 0)
1fec : 4c b7 1d JMP $1db7 ; (modplay_init.s7 + 0)
.s46:
1fef : ad ba 9f LDA $9fba ; (hdr[0] + 1082)
1ff2 : c9 48 __ CMP #$48
1ff4 : d0 f6 __ BNE $1fec ; (modplay_init.s45 + 7)
.s47:
1ff6 : ad bb 9f LDA $9fbb ; (hdr[0] + 1083)
1ff9 : c9 4e __ CMP #$4e
1ffb : d0 ef __ BNE $1fec ; (modplay_init.s45 + 7)
1ffd : 4c b3 1d JMP $1db3 ; (modplay_init.s44 + 0)
--------------------------------------------------------------------
2000 : __ __ __ BYT 6d 55 53 49 43 00                               : mUSIC.
--------------------------------------------------------------------
2006 : __ __ __ BYT 34 45 56 2e 4d 4f 44 00                         : 4EV.MOD.
--------------------------------------------------------------------
200e : __ __ __ BYT 62 41 44 20 6d 6f 64 20 46 4f 52 4d 41 54 00    : bAD mod FORMAT.
--------------------------------------------------------------------
201d : __ __ __ BYT 6e 4f 54 20 46 4f 55 4e 44 00                   : nOT FOUND.
--------------------------------------------------------------------
2027 : __ __ __ BYT 70 4c 41 43 45 20 44 45 4d 4f 20 49 4e 20 49 44 : pLACE DEMO IN ID
2037 : __ __ __ BYT 49 38 42 2f 55 4c 54 44 45 4d 4f 32 30 32 36 2f : I8B/ULTDEMO2026/
2047 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
2048 : __ __ __ BYT 64 45 54 45 43 54 49 4f 4e 20 43 4f 4d 50 4c 45 : dETECTION COMPLE
2058 : __ __ __ BYT 54 45 2e 00                                     : TE..
--------------------------------------------------------------------
screen_wait_key: ; screen_wait_key(const u8*)->void
;  37, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
205c : a9 01 __ LDA #$01
205e : 85 0f __ STA P2 
2060 : a5 10 __ LDA P3 ; (msg + 0)
2062 : aa __ __ TAX
2063 : 05 11 __ ORA P4 ; (msg + 1)
2065 : f0 0a __ BEQ $2071 ; (screen_wait_key.s5 + 0)
.s13:
2067 : a5 11 __ LDA P4 ; (msg + 1)
2069 : 85 0e __ STA P1 
206b : a0 00 __ LDY #$00
206d : b1 10 __ LDA (P3),y ; (msg + 0)
206f : d0 06 __ BNE $2077 ; (screen_wait_key.s6 + 0)
.s5:
2071 : a9 20 __ LDA #$20
2073 : 85 0e __ STA P1 
2075 : a2 b1 __ LDX #$b1
.s6:
2077 : 86 0d __ STX P0 
2079 : 20 66 11 JSR $1166 ; (cwin_put_string.s4 + 0)
207c : 20 46 11 JSR $1146 ; (cwin_cursor_newline.s4 + 0)
.l7:
207f : a2 04 __ LDX #$04
.l8:
2081 : 2c 11 d0 BIT $d011 
2084 : 30 fb __ BMI $2081 ; (screen_wait_key.l8 + 0)
.l9:
2086 : 2c 11 d0 BIT $d011 
2089 : 10 fb __ BPL $2086 ; (screen_wait_key.l9 + 0)
.s10:
208b : a9 00 __ LDA #$00
208d : 8d 00 dc STA $dc00 
2090 : ad 01 dc LDA $dc01 
2093 : 85 43 __ STA T0 + 0 
2095 : a9 ff __ LDA #$ff
2097 : 8d 00 dc STA $dc00 
209a : c5 43 __ CMP T0 + 0 
209c : d0 e1 __ BNE $207f ; (screen_wait_key.l7 + 0)
.s11:
209e : ca __ __ DEX
209f : d0 e0 __ BNE $2081 ; (screen_wait_key.l8 + 0)
.l12:
20a1 : 8e 00 dc STX $dc00 
20a4 : ac 01 dc LDY $dc01 
20a7 : 84 43 __ STY T0 + 0 
20a9 : 8d 00 dc STA $dc00 
20ac : c5 43 __ CMP T0 + 0 
20ae : f0 f1 __ BEQ $20a1 ; (screen_wait_key.l12 + 0)
.s3:
20b0 : 60 __ __ RTS
--------------------------------------------------------------------
20b1 : __ __ __ BYT 70 52 45 53 53 20 41 4e 59 20 4b 45 59 20 54 4f : pRESS ANY KEY TO
20c1 : __ __ __ BYT 20 43 4f 4e 54 49 4e 55 45 2e 00                :  CONTINUE..
--------------------------------------------------------------------
20cc : __ __ __ BYT 70 52 45 53 53 20 41 4e 59 20 4b 45 59 20 54 4f : pRESS ANY KEY TO
20dc : __ __ __ BYT 20 53 54 41 52 54 20 54 48 45 20 44 45 4d 4f 2e :  START THE DEMO.
20ec : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
gears_run: ; gears_run()->void
;   8, "/home/xahmol/git/UltimateDemo2026/src/gears.h"
.s1:
20ed : a5 53 __ LDA T0 + 0 
20ef : 8d ad bf STA $bfad ; (gears_run@stack + 0)
.s4:
20f2 : a9 00 __ LDA #$00
20f4 : 85 f9 __ STA $f9 ; (zp_spd + 0)
20f6 : 85 f7 __ STA $f7 ; (zp_angle1 + 0)
20f8 : a9 01 __ LDA #$01
20fa : 85 fa __ STA $fa ; (zp_dirty + 0)
20fc : a9 1c __ LDA #$1c
20fe : 85 f8 __ STA $f8 ; (zp_angle2 + 0)
2100 : 20 bf 23 JSR $23bf ; (hires_init.s4 + 0)
2103 : 20 97 24 JSR $2497 ; (engine_init.s4 + 0)
2106 : a9 00 __ LDA #$00
2108 : 20 90 16 JSR $1690 ; (turbo_set.s4 + 0)
210b : a9 00 __ LDA #$00
210d : 85 0f __ STA P2 
210f : 85 10 __ STA P3 
2111 : a9 e0 __ LDA #$e0
2113 : 85 11 __ STA P4 
2115 : a9 06 __ LDA #$06
2117 : 85 12 __ STA P5 
2119 : 20 de 24 JSR $24de ; (tod_reset.s4 + 0)
211c : 20 29 24 JSR $2429 ; (memset@proxy + 0)
211f : a9 00 __ LDA #$00
2121 : 8d f3 bf STA $bff3 ; (sstack + 9)
2124 : 20 e9 24 JSR $24e9 ; (draw_speed.s1 + 0)
2127 : a9 00 __ LDA #$00
2129 : 8d f0 bf STA $bff0 ; (sstack + 6)
212c : 20 3d 2f JSR $2f3d ; (draw_message.s1 + 0)
212f : a9 1c __ LDA #$1c
2131 : 8d f9 bf STA $bff9 ; (sstack + 15)
2134 : 8d fc bf STA $bffc ; (sstack + 18)
2137 : a9 d0 __ LDA #$d0
2139 : 8d f7 bf STA $bff7 ; (sstack + 13)
213c : a9 00 __ LDA #$00
213e : 8d f8 bf STA $bff8 ; (sstack + 14)
2141 : a9 08 __ LDA #$08
2143 : 8d fa bf STA $bffa ; (sstack + 16)
2146 : 8d fb bf STA $bffb ; (sstack + 17)
2149 : 8d fe bf STA $bffe ; (sstack + 20)
214c : a9 28 __ LDA #$28
214e : 8d fd bf STA $bffd ; (sstack + 19)
2151 : a9 04 __ LDA #$04
2153 : 8d ff bf STA $bfff ; (sstack + 21)
2156 : 20 2d 33 JSR $332d ; (draw_gear.s1 + 0)
2159 : a9 00 __ LDA #$00
215b : 8d f8 bf STA $bff8 ; (sstack + 14)
215e : 8d f9 bf STA $bff9 ; (sstack + 15)
2161 : a9 78 __ LDA #$78
2163 : 8d f7 bf STA $bff7 ; (sstack + 13)
2166 : a9 10 __ LDA #$10
2168 : 8d fa bf STA $bffa ; (sstack + 16)
216b : a9 04 __ LDA #$04
216d : 8d fb bf STA $bffb ; (sstack + 17)
2170 : a9 2c __ LDA #$2c
2172 : 8d fc bf STA $bffc ; (sstack + 18)
2175 : a9 36 __ LDA #$36
2177 : 8d fd bf STA $bffd ; (sstack + 19)
217a : a9 0a __ LDA #$0a
217c : 8d fe bf STA $bffe ; (sstack + 20)
217f : a9 06 __ LDA #$06
2181 : 8d ff bf STA $bfff ; (sstack + 21)
2184 : 20 2d 33 JSR $332d ; (draw_gear.s1 + 0)
2187 : a9 00 __ LDA #$00
.l20:
2189 : 85 fa __ STA $fa ; (zp_dirty + 0)
.l5:
218b : a9 0f __ LDA #$0f
218d : c5 f9 __ CMP $f9 ; (zp_spd + 0)
218f : b0 0f __ BCS $21a0 ; (gears_run.l12 + 0)
.s6:
2191 : a9 8f __ LDA #$8f
2193 : 20 90 16 JSR $1690 ; (turbo_set.s4 + 0)
2196 : a9 0f __ LDA #$0f
2198 : 85 f9 __ STA $f9 ; (zp_spd + 0)
219a : 20 de 24 JSR $24de ; (tod_reset.s4 + 0)
219d : 4c cc 22 JMP $22cc ; (gears_run.l7 + 0)
.l12:
21a0 : 2c 11 d0 BIT $d011 
21a3 : 30 fb __ BMI $21a0 ; (gears_run.l12 + 0)
.l13:
21a5 : 2c 11 d0 BIT $d011 
21a8 : 10 fb __ BPL $21a5 ; (gears_run.l13 + 0)
.s14:
21aa : a5 fa __ LDA $fa ; (zp_dirty + 0)
21ac : f0 25 __ BEQ $21d3 ; (gears_run.s15 + 0)
.s19:
21ae : a9 00 __ LDA #$00
21b0 : 85 0f __ STA P2 
21b2 : 85 10 __ STA P3 
21b4 : a9 e0 __ LDA #$e0
21b6 : 85 11 __ STA P4 
21b8 : a9 06 __ LDA #$06
21ba : 85 12 __ STA P5 
21bc : 20 29 24 JSR $2429 ; (memset@proxy + 0)
21bf : a5 f9 __ LDA $f9 ; (zp_spd + 0)
21c1 : 8d f3 bf STA $bff3 ; (sstack + 9)
21c4 : 20 e9 24 JSR $24e9 ; (draw_speed.s1 + 0)
21c7 : a5 f9 __ LDA $f9 ; (zp_spd + 0)
21c9 : 8d f0 bf STA $bff0 ; (sstack + 6)
21cc : 20 3d 2f JSR $2f3d ; (draw_message.s1 + 0)
21cf : a9 00 __ LDA #$00
21d1 : 85 fa __ STA $fa ; (zp_dirty + 0)
.s15:
21d3 : a9 d0 __ LDA #$d0
21d5 : 8d f7 bf STA $bff7 ; (sstack + 13)
21d8 : a9 00 __ LDA #$00
21da : 8d f8 bf STA $bff8 ; (sstack + 14)
21dd : a5 f8 __ LDA $f8 ; (zp_angle2 + 0)
21df : 8d f9 bf STA $bff9 ; (sstack + 15)
21e2 : a9 08 __ LDA #$08
21e4 : 8d fa bf STA $bffa ; (sstack + 16)
21e7 : 8d fb bf STA $bffb ; (sstack + 17)
21ea : 8d fe bf STA $bffe ; (sstack + 20)
21ed : a9 1c __ LDA #$1c
21ef : 8d fc bf STA $bffc ; (sstack + 18)
21f2 : a9 28 __ LDA #$28
21f4 : 8d fd bf STA $bffd ; (sstack + 19)
21f7 : a9 04 __ LDA #$04
21f9 : 8d ff bf STA $bfff ; (sstack + 21)
21fc : 20 2d 33 JSR $332d ; (draw_gear.s1 + 0)
21ff : a9 78 __ LDA #$78
2201 : 8d f7 bf STA $bff7 ; (sstack + 13)
2204 : a9 00 __ LDA #$00
2206 : 8d f8 bf STA $bff8 ; (sstack + 14)
2209 : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
220b : 8d f9 bf STA $bff9 ; (sstack + 15)
220e : a9 10 __ LDA #$10
2210 : 8d fa bf STA $bffa ; (sstack + 16)
2213 : a9 04 __ LDA #$04
2215 : 8d fb bf STA $bffb ; (sstack + 17)
2218 : a9 2c __ LDA #$2c
221a : 8d fc bf STA $bffc ; (sstack + 18)
221d : a9 36 __ LDA #$36
221f : 8d fd bf STA $bffd ; (sstack + 19)
2222 : a9 0a __ LDA #$0a
2224 : 8d fe bf STA $bffe ; (sstack + 20)
2227 : a9 06 __ LDA #$06
2229 : 8d ff bf STA $bfff ; (sstack + 21)
222c : 20 2d 33 JSR $332d ; (draw_gear.s1 + 0)
222f : 78 __ __ SEI
2230 : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
2232 : 18 __ __ CLC
2233 : 69 01 __ ADC #$01
2235 : 29 3f __ AND #$3f
2237 : 85 f7 __ STA $f7 ; (zp_angle1 + 0)
2239 : a5 f8 __ LDA $f8 ; (zp_angle2 + 0)
223b : 38 __ __ SEC
223c : e9 02 __ SBC #$02
223e : 29 3f __ AND #$3f
2240 : 85 53 __ STA T0 + 0 
2242 : 85 f8 __ STA $f8 ; (zp_angle2 + 0)
2244 : 58 __ __ CLI
2245 : a9 d0 __ LDA #$d0
2247 : 8d f7 bf STA $bff7 ; (sstack + 13)
224a : a9 00 __ LDA #$00
224c : 8d f8 bf STA $bff8 ; (sstack + 14)
224f : a5 53 __ LDA T0 + 0 
2251 : 8d f9 bf STA $bff9 ; (sstack + 15)
2254 : a9 08 __ LDA #$08
2256 : 8d fa bf STA $bffa ; (sstack + 16)
2259 : 8d fb bf STA $bffb ; (sstack + 17)
225c : 8d fe bf STA $bffe ; (sstack + 20)
225f : a9 1c __ LDA #$1c
2261 : 8d fc bf STA $bffc ; (sstack + 18)
2264 : a9 28 __ LDA #$28
2266 : 8d fd bf STA $bffd ; (sstack + 19)
2269 : a9 04 __ LDA #$04
226b : 8d ff bf STA $bfff ; (sstack + 21)
226e : 20 2d 33 JSR $332d ; (draw_gear.s1 + 0)
2271 : a9 78 __ LDA #$78
2273 : 8d f7 bf STA $bff7 ; (sstack + 13)
2276 : a9 00 __ LDA #$00
2278 : 8d f8 bf STA $bff8 ; (sstack + 14)
227b : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
227d : 8d f9 bf STA $bff9 ; (sstack + 15)
2280 : a9 10 __ LDA #$10
2282 : 8d fa bf STA $bffa ; (sstack + 16)
2285 : a9 04 __ LDA #$04
2287 : 8d fb bf STA $bffb ; (sstack + 17)
228a : a9 2c __ LDA #$2c
228c : 8d fc bf STA $bffc ; (sstack + 18)
228f : a9 36 __ LDA #$36
2291 : 8d fd bf STA $bffd ; (sstack + 19)
2294 : a9 0a __ LDA #$0a
2296 : 8d fe bf STA $bffe ; (sstack + 20)
2299 : a9 06 __ LDA #$06
229b : 8d ff bf STA $bfff ; (sstack + 21)
229e : 20 2d 33 JSR $332d ; (draw_gear.s1 + 0)
22a1 : ad 09 dc LDA $dc09 
22a4 : d0 03 __ BNE $22a9 ; (gears_run.s16 + 0)
22a6 : 4c 8b 21 JMP $218b ; (gears_run.l5 + 0)
.s16:
22a9 : 20 de 24 JSR $24de ; (tod_reset.s4 + 0)
22ac : a4 f9 __ LDY $f9 ; (zp_spd + 0)
22ae : c0 0f __ CPY #$0f
22b0 : b0 13 __ BCS $22c5 ; (gears_run.s17 + 0)
.s18:
22b2 : c8 __ __ INY
22b3 : 84 0d __ STY P0 
22b5 : 84 f9 __ STY $f9 ; (zp_spd + 0)
22b7 : 98 __ __ TYA
22b8 : 20 90 16 JSR $1690 ; (turbo_set.s4 + 0)
22bb : a5 0d __ LDA P0 
22bd : 20 8d 41 JSR $418d ; (engine_update.s4 + 0)
22c0 : a9 01 __ LDA #$01
22c2 : 4c 89 21 JMP $2189 ; (gears_run.l20 + 0)
.s17:
22c5 : a9 10 __ LDA #$10
22c7 : 85 f9 __ STA $f9 ; (zp_spd + 0)
22c9 : 4c 8b 21 JMP $218b ; (gears_run.l5 + 0)
.l7:
22cc : ad 09 dc LDA $dc09 
22cf : c9 05 __ CMP #$05
22d1 : 90 11 __ BCC $22e4 ; (gears_run.l9 + 0)
.s8:
22d3 : a9 00 __ LDA #$00
22d5 : 8d 04 d4 STA $d404 
22d8 : 8d 0b d4 STA $d40b 
22db : 8d 18 d4 STA $d418 
.s3:
22de : ad ad bf LDA $bfad ; (gears_run@stack + 0)
22e1 : 85 53 __ STA T0 + 0 
22e3 : 60 __ __ RTS
.l9:
22e4 : 2c 11 d0 BIT $d011 
22e7 : 30 fb __ BMI $22e4 ; (gears_run.l9 + 0)
.l10:
22e9 : 2c 11 d0 BIT $d011 
22ec : 10 fb __ BPL $22e9 ; (gears_run.l10 + 0)
.s11:
22ee : a9 d0 __ LDA #$d0
22f0 : 8d f7 bf STA $bff7 ; (sstack + 13)
22f3 : a9 00 __ LDA #$00
22f5 : 8d f8 bf STA $bff8 ; (sstack + 14)
22f8 : a5 f8 __ LDA $f8 ; (zp_angle2 + 0)
22fa : 8d f9 bf STA $bff9 ; (sstack + 15)
22fd : a9 08 __ LDA #$08
22ff : 8d fa bf STA $bffa ; (sstack + 16)
2302 : 8d fb bf STA $bffb ; (sstack + 17)
2305 : 8d fe bf STA $bffe ; (sstack + 20)
2308 : a9 1c __ LDA #$1c
230a : 8d fc bf STA $bffc ; (sstack + 18)
230d : a9 28 __ LDA #$28
230f : 8d fd bf STA $bffd ; (sstack + 19)
2312 : a9 04 __ LDA #$04
2314 : 8d ff bf STA $bfff ; (sstack + 21)
2317 : 20 2d 33 JSR $332d ; (draw_gear.s1 + 0)
231a : a9 78 __ LDA #$78
231c : 8d f7 bf STA $bff7 ; (sstack + 13)
231f : a9 00 __ LDA #$00
2321 : 8d f8 bf STA $bff8 ; (sstack + 14)
2324 : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
2326 : 8d f9 bf STA $bff9 ; (sstack + 15)
2329 : a9 10 __ LDA #$10
232b : 8d fa bf STA $bffa ; (sstack + 16)
232e : a9 04 __ LDA #$04
2330 : 8d fb bf STA $bffb ; (sstack + 17)
2333 : a9 2c __ LDA #$2c
2335 : 8d fc bf STA $bffc ; (sstack + 18)
2338 : a9 36 __ LDA #$36
233a : 8d fd bf STA $bffd ; (sstack + 19)
233d : a9 0a __ LDA #$0a
233f : 8d fe bf STA $bffe ; (sstack + 20)
2342 : a9 06 __ LDA #$06
2344 : 8d ff bf STA $bfff ; (sstack + 21)
2347 : 20 2d 33 JSR $332d ; (draw_gear.s1 + 0)
234a : 78 __ __ SEI
234b : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
234d : 18 __ __ CLC
234e : 69 01 __ ADC #$01
2350 : 29 3f __ AND #$3f
2352 : 85 f7 __ STA $f7 ; (zp_angle1 + 0)
2354 : a5 f8 __ LDA $f8 ; (zp_angle2 + 0)
2356 : 38 __ __ SEC
2357 : e9 02 __ SBC #$02
2359 : 29 3f __ AND #$3f
235b : 85 53 __ STA T0 + 0 
235d : 85 f8 __ STA $f8 ; (zp_angle2 + 0)
235f : 58 __ __ CLI
2360 : a9 d0 __ LDA #$d0
2362 : 8d f7 bf STA $bff7 ; (sstack + 13)
2365 : a9 00 __ LDA #$00
2367 : 8d f8 bf STA $bff8 ; (sstack + 14)
236a : a5 53 __ LDA T0 + 0 
236c : 8d f9 bf STA $bff9 ; (sstack + 15)
236f : a9 08 __ LDA #$08
2371 : 8d fa bf STA $bffa ; (sstack + 16)
2374 : 8d fb bf STA $bffb ; (sstack + 17)
2377 : 8d fe bf STA $bffe ; (sstack + 20)
237a : a9 1c __ LDA #$1c
237c : 8d fc bf STA $bffc ; (sstack + 18)
237f : a9 28 __ LDA #$28
2381 : 8d fd bf STA $bffd ; (sstack + 19)
2384 : a9 04 __ LDA #$04
2386 : 8d ff bf STA $bfff ; (sstack + 21)
2389 : 20 2d 33 JSR $332d ; (draw_gear.s1 + 0)
238c : a9 78 __ LDA #$78
238e : 8d f7 bf STA $bff7 ; (sstack + 13)
2391 : a9 00 __ LDA #$00
2393 : 8d f8 bf STA $bff8 ; (sstack + 14)
2396 : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
2398 : 8d f9 bf STA $bff9 ; (sstack + 15)
239b : a9 10 __ LDA #$10
239d : 8d fa bf STA $bffa ; (sstack + 16)
23a0 : a9 04 __ LDA #$04
23a2 : 8d fb bf STA $bffb ; (sstack + 17)
23a5 : a9 2c __ LDA #$2c
23a7 : 8d fc bf STA $bffc ; (sstack + 18)
23aa : a9 36 __ LDA #$36
23ac : 8d fd bf STA $bffd ; (sstack + 19)
23af : a9 0a __ LDA #$0a
23b1 : 8d fe bf STA $bffe ; (sstack + 20)
23b4 : a9 06 __ LDA #$06
23b6 : 8d ff bf STA $bfff ; (sstack + 21)
23b9 : 20 2d 33 JSR $332d ; (draw_gear.s1 + 0)
23bc : 4c cc 22 JMP $22cc ; (gears_run.l7 + 0)
--------------------------------------------------------------------
hires_init: ; hires_init()->void
; 246, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s4:
23bf : 78 __ __ SEI
23c0 : a9 00 __ LDA #$00
23c2 : 85 0f __ STA P2 
23c4 : 85 10 __ STA P3 
23c6 : a9 30 __ LDA #$30
23c8 : 85 01 __ STA $01 
23ca : a9 40 __ LDA #$40
23cc : 85 11 __ STA P4 
23ce : a9 1f __ LDA #$1f
23d0 : 85 12 __ STA P5 
23d2 : a9 10 __ LDA #$10
23d4 : a2 fa __ LDX #$fa
.l6:
23d6 : ca __ __ DEX
23d7 : 9d 00 d0 STA $d000,x 
23da : 9d fa d0 STA $d0fa,x 
23dd : 9d f4 d1 STA $d1f4,x 
23e0 : 9d ee d2 STA $d2ee,x 
23e3 : d0 f1 __ BNE $23d6 ; (hires_init.l6 + 0)
.s5:
23e5 : a9 00 __ LDA #$00
23e7 : 85 43 __ STA T1 + 0 
23e9 : 85 0d __ STA P0 
23eb : a9 e0 __ LDA #$e0
23ed : 85 44 __ STA T1 + 1 
23ef : 85 0e __ STA P1 
23f1 : 20 31 24 JSR $2431 ; (memset.s4 + 0)
23f4 : a9 35 __ LDA #$35
23f6 : 85 01 __ STA $01 
23f8 : 20 4d 24 JSR $244d ; (mmap_trampoline.s4 + 0)
23fb : 58 __ __ CLI
23fc : 20 75 80 JSR $8075 ; (vic_setmode@proxy + 0)
23ff : a5 10 __ LDA P3 
2401 : 8d f7 87 STA $87f7 ; (Screen.data + 0)
2404 : a5 11 __ LDA P4 
2406 : 8d f8 87 STA $87f8 ; (Screen.data + 1)
2409 : a9 28 __ LDA #$28
240b : 8d fb 87 STA $87fb ; (Screen.cwidth + 0)
240e : a9 19 __ LDA #$19
2410 : 8d fc 87 STA $87fc ; (Screen.cheight + 0)
2413 : a9 40 __ LDA #$40
2415 : 8d fd 87 STA $87fd ; (Screen.width + 0)
2418 : a9 01 __ LDA #$01
241a : 8d fe 87 STA $87fe ; (Screen.width + 1)
241d : a9 00 __ LDA #$00
241f : 8d 20 d0 STA $d020 
2422 : 8d f9 87 STA $87f9 ; (Screen.rdata + 0)
2425 : 8d fa 87 STA $87fa ; (Screen.rdata + 1)
.s3:
2428 : 60 __ __ RTS
--------------------------------------------------------------------
memset@proxy: ; memset@proxy
2429 : a9 60 __ LDA #$60
242b : 85 0d __ STA P0 
242d : a9 f8 __ LDA #$f8
242f : 85 0e __ STA P1 
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void
;  28, "/home/xahmol/oscar64/include/string.h"
.s4:
2431 : a5 0f __ LDA P2 
2433 : a6 12 __ LDX P5 
2435 : f0 0c __ BEQ $2443 ; (memset.s4 + 18)
2437 : a0 00 __ LDY #$00
2439 : 91 0d __ STA (P0),y 
243b : c8 __ __ INY
243c : d0 fb __ BNE $2439 ; (memset.s4 + 8)
243e : e6 0e __ INC P1 
2440 : ca __ __ DEX
2441 : d0 f6 __ BNE $2439 ; (memset.s4 + 8)
2443 : a4 11 __ LDY P4 
2445 : f0 05 __ BEQ $244c ; (memset.s3 + 0)
2447 : 88 __ __ DEY
2448 : 91 0d __ STA (P0),y 
244a : d0 fb __ BNE $2447 ; (memset.s4 + 22)
.s3:
244c : 60 __ __ RTS
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/xahmol/oscar64/include/c64/memmap.h"
.s4:
244d : a9 62 __ LDA #$62
244f : 8d fa ff STA $fffa 
2452 : a9 24 __ LDA #$24
2454 : 8d fb ff STA $fffb 
2457 : a9 80 __ LDA #$80
2459 : 8d fe ff STA $fffe 
245c : a9 24 __ LDA #$24
245e : 8d ff ff STA $ffff 
.s3:
2461 : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
2462 : 48 __ __ PHA
2463 : 8a __ __ TXA
2464 : 48 __ __ PHA
2465 : a9 24 __ LDA #$24
2467 : 48 __ __ PHA
2468 : a9 79 __ LDA #$79
246a : 48 __ __ PHA
246b : ba __ __ TSX
246c : bd 05 01 LDA $0105,x 
246f : 48 __ __ PHA
2470 : a6 01 __ LDX $01 
2472 : a9 36 __ LDA #$36
2474 : 85 01 __ STA $01 
2476 : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
2479 : 86 01 __ STX $01 
247b : 68 __ __ PLA
247c : aa __ __ TAX
247d : 68 __ __ PLA
247e : 40 __ __ RTI
247f : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
2480 : 48 __ __ PHA
2481 : 8a __ __ TXA
2482 : 48 __ __ PHA
2483 : a9 24 __ LDA #$24
2485 : 48 __ __ PHA
2486 : a9 79 __ LDA #$79
2488 : 48 __ __ PHA
2489 : ba __ __ TSX
248a : bd 05 01 LDA $0105,x 
248d : 48 __ __ PHA
248e : a6 01 __ LDX $01 
2490 : a9 36 __ LDA #$36
2492 : 85 01 __ STA $01 
2494 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
engine_init: ; engine_init()->void
; 332, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s4:
2497 : a9 00 __ LDA #$00
2499 : 8d 15 d4 STA $d415 
249c : a9 18 __ LDA #$18
249e : 8d 16 d4 STA $d416 
24a1 : a9 83 __ LDA #$83
24a3 : 8d 17 d4 STA $d417 
24a6 : a9 1f __ LDA #$1f
24a8 : 8d 18 d4 STA $d418 
24ab : a9 05 __ LDA #$05
24ad : 8d 05 d4 STA $d405 
24b0 : a9 f3 __ LDA #$f3
24b2 : 8d 06 d4 STA $d406 
24b5 : a9 a9 __ LDA #$a9
24b7 : 8d 00 d4 STA $d400 
24ba : a9 02 __ LDA #$02
24bc : 8d 01 d4 STA $d401 
24bf : a9 21 __ LDA #$21
24c1 : 8d 04 d4 STA $d404 
24c4 : a9 05 __ LDA #$05
24c6 : 8d 0c d4 STA $d40c 
24c9 : a9 f3 __ LDA #$f3
24cb : 8d 0d d4 STA $d40d 
24ce : a9 52 __ LDA #$52
24d0 : 8d 07 d4 STA $d407 
24d3 : a9 05 __ LDA #$05
24d5 : 8d 08 d4 STA $d408 
24d8 : a9 81 __ LDA #$81
24da : 8d 0b d4 STA $d40b 
.s3:
24dd : 60 __ __ RTS
--------------------------------------------------------------------
tod_reset: ; tod_reset()->void
; 277, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s4:
24de : 78 __ __ SEI
24df : a9 00 __ LDA #$00
24e1 : 8d 09 dc STA $dc09 
24e4 : 8d 08 dc STA $dc08 
24e7 : 58 __ __ CLI
.s3:
24e8 : 60 __ __ RTS
--------------------------------------------------------------------
draw_speed: ; draw_speed(u8)->void
; 194, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s1:
24e9 : a2 05 __ LDX #$05
24eb : b5 53 __ LDA T1 + 0,x 
24ed : 9d c3 bf STA $bfc3,x ; (draw_speed@stack + 0)
24f0 : ca __ __ DEX
24f1 : 10 f8 __ BPL $24eb ; (draw_speed.s1 + 2)
.s4:
24f3 : ad f3 bf LDA $bff3 ; (sstack + 9)
24f6 : 0a __ __ ASL
24f7 : aa __ __ TAX
24f8 : bd 20 81 LDA $8120,x ; (speed_nums[0] + 0)
24fb : 85 53 __ STA T1 + 0 
24fd : 85 0d __ STA P0 
24ff : bd 21 81 LDA $8121,x ; (speed_nums[0] + 1)
2502 : 85 54 __ STA T1 + 1 
2504 : 85 0e __ STA P1 
2506 : 20 e9 10 JSR $10e9 ; (strlen.s4 + 0)
2509 : a5 1b __ LDA ACCU + 0 
250b : 0a __ __ ASL
250c : a2 00 __ LDX #$00
250e : 90 02 __ BCC $2512 ; (draw_speed.s9 + 0)
.s8:
2510 : e8 __ __ INX
2511 : 18 __ __ CLC
.s9:
2512 : 65 1b __ ADC ACCU + 0 
2514 : 85 43 __ STA T0 + 0 
2516 : 8a __ __ TXA
2517 : 69 00 __ ADC #$00
2519 : 06 43 __ ASL T0 + 0 
251b : 2a __ __ ROL
251c : 06 43 __ ASL T0 + 0 
251e : 2a __ __ ROL
251f : aa __ __ TAX
2520 : 18 __ __ CLC
2521 : a5 43 __ LDA T0 + 0 
2523 : 69 28 __ ADC #$28
2525 : 85 43 __ STA T0 + 0 
2527 : 90 01 __ BCC $252a ; (draw_speed.s11 + 0)
.s10:
2529 : e8 __ __ INX
.s11:
252a : 86 44 __ STX T0 + 1 
252c : 38 __ __ SEC
252d : a9 40 __ LDA #$40
252f : e5 43 __ SBC T0 + 0 
2531 : a8 __ __ TAY
2532 : a9 01 __ LDA #$01
2534 : e5 44 __ SBC T0 + 1 
2536 : aa __ __ TAX
2537 : 0a __ __ ASL
2538 : 98 __ __ TYA
2539 : 69 00 __ ADC #$00
253b : 85 56 __ STA T3 + 0 
253d : 8a __ __ TXA
253e : 69 00 __ ADC #$00
2540 : c9 80 __ CMP #$80
2542 : 6a __ __ ROR
2543 : 66 56 __ ROR T3 + 0 
2545 : 85 57 __ STA T3 + 1 
2547 : a5 1b __ LDA ACCU + 0 
2549 : f0 30 __ BEQ $257b ; (draw_speed.s5 + 0)
.s6:
254b : 85 55 __ STA T2 + 0 
254d : a9 00 __ LDA #$00
254f : 85 58 __ STA T4 + 0 
.l7:
2551 : a5 56 __ LDA T3 + 0 
2553 : 8d f0 bf STA $bff0 ; (sstack + 6)
2556 : a5 57 __ LDA T3 + 1 
2558 : 8d f1 bf STA $bff1 ; (sstack + 7)
255b : a4 58 __ LDY T4 + 0 
255d : b1 53 __ LDA (T1 + 0),y 
255f : 38 __ __ SEC
2560 : e9 30 __ SBC #$30
2562 : 8d f2 bf STA $bff2 ; (sstack + 8)
2565 : 20 fd 25 JSR $25fd ; (draw_glyph.s1 + 0)
2568 : 18 __ __ CLC
2569 : a5 56 __ LDA T3 + 0 
256b : 69 0c __ ADC #$0c
256d : 85 56 __ STA T3 + 0 
256f : 90 02 __ BCC $2573 ; (draw_speed.s13 + 0)
.s12:
2571 : e6 57 __ INC T3 + 1 
.s13:
2573 : e6 58 __ INC T4 + 0 
2575 : a5 58 __ LDA T4 + 0 
2577 : c5 55 __ CMP T2 + 0 
2579 : 90 d6 __ BCC $2551 ; (draw_speed.l7 + 0)
.s5:
257b : a9 0a __ LDA #$0a
257d : 8d f2 bf STA $bff2 ; (sstack + 8)
2580 : 18 __ __ CLC
2581 : a5 56 __ LDA T3 + 0 
2583 : 69 06 __ ADC #$06
2585 : 85 56 __ STA T3 + 0 
2587 : 8d f0 bf STA $bff0 ; (sstack + 6)
258a : a5 57 __ LDA T3 + 1 
258c : 69 00 __ ADC #$00
258e : 85 57 __ STA T3 + 1 
2590 : 8d f1 bf STA $bff1 ; (sstack + 7)
2593 : 20 fd 25 JSR $25fd ; (draw_glyph.s1 + 0)
2596 : a9 0b __ LDA #$0b
2598 : 8d f2 bf STA $bff2 ; (sstack + 8)
259b : 18 __ __ CLC
259c : a5 56 __ LDA T3 + 0 
259e : 69 0c __ ADC #$0c
25a0 : 85 56 __ STA T3 + 0 
25a2 : 8d f0 bf STA $bff0 ; (sstack + 6)
25a5 : a5 57 __ LDA T3 + 1 
25a7 : 69 00 __ ADC #$00
25a9 : 85 57 __ STA T3 + 1 
25ab : 8d f1 bf STA $bff1 ; (sstack + 7)
25ae : 20 fd 25 JSR $25fd ; (draw_glyph.s1 + 0)
25b1 : a9 0c __ LDA #$0c
25b3 : 8d f2 bf STA $bff2 ; (sstack + 8)
25b6 : 18 __ __ CLC
25b7 : a5 56 __ LDA T3 + 0 
25b9 : 69 0c __ ADC #$0c
25bb : 8d f0 bf STA $bff0 ; (sstack + 6)
25be : a5 57 __ LDA T3 + 1 
25c0 : 69 00 __ ADC #$00
25c2 : 8d f1 bf STA $bff1 ; (sstack + 7)
25c5 : 20 fd 25 JSR $25fd ; (draw_glyph.s1 + 0)
.s3:
25c8 : a2 05 __ LDX #$05
25ca : bd c3 bf LDA $bfc3,x ; (draw_speed@stack + 0)
25cd : 95 53 __ STA T1 + 0,x 
25cf : ca __ __ DEX
25d0 : 10 f8 __ BPL $25ca ; (draw_speed.s3 + 2)
25d2 : 60 __ __ RTS
--------------------------------------------------------------------
25d3 : __ __ __ BYT 31 00                                           : 1.
--------------------------------------------------------------------
25d5 : __ __ __ BYT 32 00                                           : 2.
--------------------------------------------------------------------
25d7 : __ __ __ BYT 33 00                                           : 3.
--------------------------------------------------------------------
25d9 : __ __ __ BYT 34 00                                           : 4.
--------------------------------------------------------------------
25db : __ __ __ BYT 36 00                                           : 6.
--------------------------------------------------------------------
25dd : __ __ __ BYT 38 00                                           : 8.
--------------------------------------------------------------------
25df : __ __ __ BYT 31 32 00                                        : 12.
--------------------------------------------------------------------
25e2 : __ __ __ BYT 31 36 00                                        : 16.
--------------------------------------------------------------------
25e5 : __ __ __ BYT 32 30 00                                        : 20.
--------------------------------------------------------------------
25e8 : __ __ __ BYT 32 34 00                                        : 24.
--------------------------------------------------------------------
25eb : __ __ __ BYT 32 38 00                                        : 28.
--------------------------------------------------------------------
25ee : __ __ __ BYT 33 32 00                                        : 32.
--------------------------------------------------------------------
25f1 : __ __ __ BYT 33 36 00                                        : 36.
--------------------------------------------------------------------
25f4 : __ __ __ BYT 34 30 00                                        : 40.
--------------------------------------------------------------------
25f7 : __ __ __ BYT 34 38 00                                        : 48.
--------------------------------------------------------------------
25fa : __ __ __ BYT 36 34 00                                        : 64.
--------------------------------------------------------------------
draw_glyph: ; draw_glyph(i16,i16,u8)->void
; 176, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s1:
25fd : a2 04 __ LDX #$04
25ff : b5 53 __ LDA T2 + 0,x 
2601 : 9d ca bf STA $bfca,x ; (draw_glyph@stack + 0)
2604 : ca __ __ DEX
2605 : 10 f8 __ BPL $25ff ; (draw_glyph.s1 + 2)
.s4:
2607 : ae f2 bf LDX $bff2 ; (sstack + 8)
260a : bd 91 7f LDA $7f91,x ; (__multab7L + 0)
260d : 18 __ __ CLC
260e : 69 40 __ ADC #$40
2610 : 85 53 __ STA T2 + 0 
2612 : a9 81 __ LDA #$81
2614 : 69 00 __ ADC #$00
2616 : 85 54 __ STA T2 + 1 
2618 : a9 87 __ LDA #$87
261a : 85 15 __ STA P8 
261c : a9 f7 __ LDA #$f7
261e : 85 14 __ STA P7 
2620 : a9 44 __ LDA #$44
2622 : 85 18 __ STA P11 
2624 : a9 00 __ LDA #$00
2626 : 85 13 __ STA P6 
2628 : 85 57 __ STA T6 + 0 
262a : 18 __ __ CLC
.l5:
262b : 69 57 __ ADC #$57
262d : 0a __ __ ASL
262e : 85 55 __ STA T4 + 0 
2630 : a2 00 __ LDX #$00
2632 : 86 56 __ STX T5 + 0 
.l6:
2634 : bd e8 8c LDA $8ce8,x ; (bitshift[0] + 32)
2637 : a4 57 __ LDY T6 + 0 
2639 : 31 53 __ AND (T2 + 0),y 
263b : f0 30 __ BEQ $266d ; (draw_glyph.s7 + 0)
.s9:
263d : a5 55 __ LDA T4 + 0 
263f : 85 12 __ STA P5 
2641 : 8d ea bf STA $bfea ; (sstack + 0)
2644 : a9 00 __ LDA #$00
2646 : 8d eb bf STA $bfeb ; (sstack + 1)
2649 : 8d ed bf STA $bfed ; (sstack + 3)
264c : 8d ef bf STA $bfef ; (sstack + 5)
264f : a9 02 __ LDA #$02
2651 : 8d ec bf STA $bfec ; (sstack + 2)
2654 : 8d ee bf STA $bfee ; (sstack + 4)
2657 : 8a __ __ TXA
2658 : 0a __ __ ASL
2659 : 18 __ __ CLC
265a : 6d f0 bf ADC $bff0 ; (sstack + 6)
265d : 85 10 __ STA P3 
265f : 85 16 __ STA P9 
2661 : ad f1 bf LDA $bff1 ; (sstack + 7)
2664 : 69 00 __ ADC #$00
2666 : 85 11 __ STA P4 
2668 : 85 17 __ STA P10 
266a : 20 88 26 JSR $2688 ; (bmu_bitblit.s1 + 0)
.s7:
266d : e6 56 __ INC T5 + 0 
266f : a6 56 __ LDX T5 + 0 
2671 : e0 05 __ CPX #$05
2673 : d0 bf __ BNE $2634 ; (draw_glyph.l6 + 0)
.s8:
2675 : e6 57 __ INC T6 + 0 
2677 : a5 57 __ LDA T6 + 0 
2679 : c9 07 __ CMP #$07
267b : 90 ae __ BCC $262b ; (draw_glyph.l5 + 0)
.s3:
267d : a2 04 __ LDX #$04
267f : bd ca bf LDA $bfca,x ; (draw_glyph@stack + 0)
2682 : 95 53 __ STA T2 + 0,x 
2684 : ca __ __ DEX
2685 : 10 f8 __ BPL $267f ; (draw_glyph.s3 + 2)
2687 : 60 __ __ RTS
--------------------------------------------------------------------
bmu_bitblit: ; bmu_bitblit(const struct Bitmap*,i16,i16,const struct Bitmap*,i16,i16,i16,i16,const u8*,enum BlitOp)->void
; 119, "/home/xahmol/oscar64/include/gfx/bitmap.h"
.s1:
2688 : a2 0c __ LDX #$0c
268a : b5 53 __ LDA T11 + 0,x 
268c : 9d d3 bf STA $bfd3,x ; (bmu_bitblit@stack + 0)
268f : ca __ __ DEX
2690 : 10 f8 __ BPL $268a ; (bmu_bitblit.s1 + 2)
.s4:
2692 : a5 10 __ LDA P3 ; (dx + 0)
2694 : 85 47 __ STA T2 + 0 
2696 : 18 __ __ CLC
2697 : 6d ec bf ADC $bfec ; (sstack + 2)
269a : 85 45 __ STA T1 + 0 
269c : 29 07 __ AND #$07
269e : aa __ __ TAX
269f : bd a3 81 LDA $81a3,x ; (rmask[0] + 0)
26a2 : 85 56 __ STA T14 + 0 
26a4 : ad ed bf LDA $bfed ; (sstack + 3)
26a7 : 65 11 __ ADC P4 ; (dx + 1)
26a9 : 4a __ __ LSR
26aa : 66 45 __ ROR T1 + 0 
26ac : 4a __ __ LSR
26ad : 66 45 __ ROR T1 + 0 
26af : 4a __ __ LSR
26b0 : 66 45 __ ROR T1 + 0 
26b2 : a5 11 __ LDA P4 ; (dx + 1)
26b4 : 4a __ __ LSR
26b5 : 66 47 __ ROR T2 + 0 
26b7 : 4a __ __ LSR
26b8 : 66 47 __ ROR T2 + 0 
26ba : 4a __ __ LSR
26bb : 66 47 __ ROR T2 + 0 
26bd : 38 __ __ SEC
26be : a5 45 __ LDA T1 + 0 
26c0 : e5 47 __ SBC T2 + 0 
26c2 : 85 4d __ STA T6 + 0 
26c4 : a5 10 __ LDA P3 ; (dx + 0)
26c6 : 29 07 __ AND #$07
26c8 : 85 45 __ STA T1 + 0 
26ca : aa __ __ TAX
26cb : bd 9b 81 LDA $819b,x ; (lmask[0] + 0)
26ce : 85 52 __ STA T12 + 0 
26d0 : 85 55 __ STA T13 + 0 
26d2 : ad ee bf LDA $bfee ; (sstack + 4)
26d5 : 85 4e __ STA T8 + 0 
26d7 : a5 14 __ LDA P7 ; (sbm + 0)
26d9 : 85 4f __ STA T9 + 0 
26db : a6 15 __ LDX P8 ; (sbm + 1)
26dd : 86 50 __ STX T9 + 1 
26df : c9 f7 __ CMP #$f7
26e1 : d0 4d __ BNE $2730 ; (bmu_bitblit.s111 + 0)
.s88:
26e3 : e0 87 __ CPX #$87
26e5 : d0 49 __ BNE $2730 ; (bmu_bitblit.s111 + 0)
.s72:
26e7 : a9 f7 __ LDA #$f7
26e9 : 85 4f __ STA T9 + 0 
26eb : a9 87 __ LDA #$87
26ed : 85 50 __ STA T9 + 1 
26ef : ad eb bf LDA $bfeb ; (sstack + 1)
26f2 : c5 13 __ CMP P6 ; (dy + 1)
26f4 : d0 09 __ BNE $26ff ; (bmu_bitblit.s87 + 0)
.s84:
26f6 : ad ea bf LDA $bfea ; (sstack + 0)
26f9 : c5 12 __ CMP P5 ; (dy + 0)
.s85:
26fb : b0 08 __ BCS $2705 ; (bmu_bitblit.s73 + 0)
26fd : 90 28 __ BCC $2727 ; (bmu_bitblit.s75 + 0)
.s87:
26ff : 45 13 __ EOR P6 ; (dy + 1)
2701 : 10 f8 __ BPL $26fb ; (bmu_bitblit.s85 + 0)
.s86:
2703 : b0 22 __ BCS $2727 ; (bmu_bitblit.s75 + 0)
.s73:
2705 : a5 13 __ LDA P6 ; (dy + 1)
2707 : cd eb bf CMP $bfeb ; (sstack + 1)
270a : d0 24 __ BNE $2730 ; (bmu_bitblit.s111 + 0)
.s83:
270c : a5 12 __ LDA P5 ; (dy + 0)
270e : cd ea bf CMP $bfea ; (sstack + 0)
2711 : d0 1f __ BNE $2732 ; (bmu_bitblit.s5 + 0)
.s74:
2713 : a5 17 __ LDA P10 ; (sx + 1)
2715 : c5 11 __ CMP P4 ; (dx + 1)
2717 : d0 08 __ BNE $2721 ; (bmu_bitblit.s82 + 0)
.s79:
2719 : a5 16 __ LDA P9 ; (sx + 0)
271b : c5 10 __ CMP P3 ; (dx + 0)
.s80:
271d : 90 08 __ BCC $2727 ; (bmu_bitblit.s75 + 0)
271f : b0 0f __ BCS $2730 ; (bmu_bitblit.s111 + 0)
.s82:
2721 : 45 11 __ EOR P4 ; (dx + 1)
2723 : 10 f8 __ BPL $271d ; (bmu_bitblit.s80 + 0)
.s81:
2725 : 90 09 __ BCC $2730 ; (bmu_bitblit.s111 + 0)
.s75:
2727 : a5 18 __ LDA P11 ; (op + 0)
2729 : 29 08 __ AND #$08
272b : f0 03 __ BEQ $2730 ; (bmu_bitblit.s111 + 0)
272d : 4c 16 2c JMP $2c16 ; (bmu_bitblit.s76 + 0)
.s111:
2730 : a5 12 __ LDA P5 ; (dy + 0)
.s5:
2732 : 29 f8 __ AND #$f8
2734 : 85 1b __ STA ACCU + 0 ; (w + 0)
2736 : a5 13 __ LDA P6 ; (dy + 1)
2738 : 85 1c __ STA ACCU + 1 ; (w + 1)
273a : ad fb 87 LDA $87fb ; (Screen.cwidth + 0)
273d : 85 51 __ STA T10 + 0 
273f : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
2742 : ad f7 87 LDA $87f7 ; (Screen.data + 0)
2745 : 18 __ __ CLC
2746 : 65 1b __ ADC ACCU + 0 ; (w + 0)
2748 : 85 4a __ STA T4 + 0 
274a : ad f8 87 LDA $87f8 ; (Screen.data + 1)
274d : 65 1c __ ADC ACCU + 1 ; (w + 1)
274f : aa __ __ TAX
2750 : a5 10 __ LDA P3 ; (dx + 0)
2752 : 29 f8 __ AND #$f8
2754 : 18 __ __ CLC
2755 : 65 4a __ ADC T4 + 0 
2757 : 85 4a __ STA T4 + 0 
2759 : 8a __ __ TXA
275a : 65 11 __ ADC P4 ; (dx + 1)
275c : aa __ __ TAX
275d : a5 12 __ LDA P5 ; (dy + 0)
275f : 29 07 __ AND #$07
2761 : 18 __ __ CLC
2762 : 65 4a __ ADC T4 + 0 
2764 : 85 53 __ STA T11 + 0 
2766 : 90 01 __ BCC $2769 ; (bmu_bitblit.s94 + 0)
.s93:
2768 : e8 __ __ INX
.s94:
2769 : 86 54 __ STX T11 + 1 
276b : ad eb bf LDA $bfeb ; (sstack + 1)
276e : 85 1c __ STA ACCU + 1 ; (w + 1)
2770 : ad ea bf LDA $bfea ; (sstack + 0)
2773 : 29 f8 __ AND #$f8
2775 : 85 1b __ STA ACCU + 0 ; (w + 0)
2777 : a0 04 __ LDY #$04
2779 : b1 4f __ LDA (T9 + 0),y 
277b : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
277e : a0 00 __ LDY #$00
2780 : 84 57 __ STY T16 + 0 
2782 : b1 4f __ LDA (T9 + 0),y 
2784 : 18 __ __ CLC
2785 : 65 1b __ ADC ACCU + 0 ; (w + 0)
2787 : 85 49 __ STA T3 + 0 
2789 : c8 __ __ INY
278a : b1 4f __ LDA (T9 + 0),y 
278c : 65 1c __ ADC ACCU + 1 ; (w + 1)
278e : aa __ __ TAX
278f : a5 16 __ LDA P9 ; (sx + 0)
2791 : 29 f8 __ AND #$f8
2793 : 18 __ __ CLC
2794 : 65 49 __ ADC T3 + 0 
2796 : 85 49 __ STA T3 + 0 
2798 : 8a __ __ TXA
2799 : 65 17 __ ADC P10 ; (sx + 1)
279b : aa __ __ TAX
279c : ad ea bf LDA $bfea ; (sstack + 0)
279f : 29 07 __ AND #$07
27a1 : 18 __ __ CLC
27a2 : 65 49 __ ADC T3 + 0 
27a4 : 85 4a __ STA T4 + 0 
27a6 : 90 01 __ BCC $27a9 ; (bmu_bitblit.s96 + 0)
.s95:
27a8 : e8 __ __ INX
.s96:
27a9 : 86 4b __ STX T4 + 1 
27ab : a5 16 __ LDA P9 ; (sx + 0)
27ad : 29 07 __ AND #$07
27af : 49 ff __ EOR #$ff
27b1 : 38 __ __ SEC
27b2 : 65 45 __ ADC T1 + 0 
27b4 : 85 43 __ STA T0 + 0 
27b6 : f0 0d __ BEQ $27c5 ; (bmu_bitblit.s6 + 0)
.s70:
27b8 : 30 0b __ BMI $27c5 ; (bmu_bitblit.s6 + 0)
.s71:
27ba : 18 __ __ CLC
27bb : a5 4a __ LDA T4 + 0 
27bd : 69 f8 __ ADC #$f8
27bf : 85 4a __ STA T4 + 0 
27c1 : b0 02 __ BCS $27c5 ; (bmu_bitblit.s6 + 0)
.s105:
27c3 : c6 4b __ DEC T4 + 1 
.s6:
27c5 : a9 18 __ LDA #$18
27c7 : 85 58 __ STA T17 + 0 
27c9 : a9 61 __ LDA #$61
27cb : 85 59 __ STA T18 + 0 
27cd : a9 90 __ LDA #$90
27cf : 85 5a __ STA T19 + 0 
27d1 : a9 e2 __ LDA #$e2
27d3 : 85 5b __ STA T20 + 0 
27d5 : a9 00 __ LDA #$00
27d7 : 85 5c __ STA T21 + 0 
27d9 : a9 08 __ LDA #$08
.s7:
27db : 85 5d __ STA T22 + 0 
27dd : a5 18 __ LDA P11 ; (op + 0)
27df : 29 08 __ AND #$08
27e1 : 85 4c __ STA T5 + 0 
27e3 : a5 18 __ LDA P11 ; (op + 0)
27e5 : 29 10 __ AND #$10
27e7 : 85 52 __ STA T12 + 0 
27e9 : a5 55 __ LDA T13 + 0 
27eb : 85 45 __ STA T1 + 0 
27ed : a5 43 __ LDA T0 + 0 
27ef : 29 07 __ AND #$07
27f1 : 85 5f __ STA T24 + 0 
27f3 : a5 4d __ LDA T6 + 0 
27f5 : 85 5e __ STA T23 + 0 
27f7 : d0 06 __ BNE $27ff ; (bmu_bitblit.s9 + 0)
.s8:
27f9 : a5 56 __ LDA T14 + 0 
27fb : 25 55 __ AND T13 + 0 
27fd : 85 45 __ STA T1 + 0 
.s9:
27ff : a9 a0 __ LDA #$a0
2801 : 8d 00 a4 STA $a400 ; (BLIT_CODE[0] + 0)
2804 : a5 5c __ LDA T21 + 0 
2806 : 8d 01 a4 STA $a401 ; (BLIT_CODE[0] + 1)
2809 : a9 02 __ LDA #$02
280b : 85 43 __ STA T0 + 0 
280d : a6 45 __ LDX T1 + 0 
280f : e8 __ __ INX
2810 : d0 03 __ BNE $2815 ; (bmu_bitblit.s10 + 0)
2812 : 4c b0 2b JMP $2bb0 ; (bmu_bitblit.s66 + 0)
.s10:
2815 : a5 52 __ LDA T12 + 0 
2817 : f0 18 __ BEQ $2831 ; (bmu_bitblit.s11 + 0)
.s65:
2819 : a9 b1 __ LDA #$b1
281b : 8d 02 a4 STA $a402 ; (BLIT_CODE[0] + 2)
281e : a9 05 __ LDA #$05
2820 : 8d 03 a4 STA $a403 ; (BLIT_CODE[0] + 3)
2823 : a9 85 __ LDA #$85
2825 : 8d 04 a4 STA $a404 ; (BLIT_CODE[0] + 4)
2828 : a9 0a __ LDA #$0a
282a : 8d 05 a4 STA $a405 ; (BLIT_CODE[0] + 5)
282d : a9 06 __ LDA #$06
282f : 85 43 __ STA T0 + 0 
.s11:
2831 : a5 4c __ LDA T5 + 0 
2833 : d0 05 __ BNE $283a ; (bmu_bitblit.s62 + 0)
.s12:
2835 : a5 43 __ LDA T0 + 0 
2837 : 4c 95 28 JMP $2895 ; (bmu_bitblit.s92 + 0)
.s62:
283a : a5 5f __ LDA T24 + 0 
283c : d0 05 __ BNE $2843 ; (bmu_bitblit.s64 + 0)
.s63:
283e : a5 43 __ LDA T0 + 0 
2840 : 4c 90 28 JMP $2890 ; (bmu_bitblit.s91 + 0)
.s64:
2843 : a9 b1 __ LDA #$b1
2845 : a6 43 __ LDX T0 + 0 
2847 : 9d 00 a4 STA $a400,x ; (BLIT_CODE[0] + 0)
284a : a9 03 __ LDA #$03
284c : 9d 01 a4 STA $a401,x ; (BLIT_CODE[0] + 1)
284f : 9d 06 a4 STA $a406,x ; (BLIT_CODE[0] + 6)
2852 : 9d 0a a4 STA $a40a,x ; (BLIT_CODE[0] + 10)
2855 : a9 85 __ LDA #$85
2857 : 9d 02 a4 STA $a402,x ; (BLIT_CODE[0] + 2)
285a : 9d 09 a4 STA $a409,x ; (BLIT_CODE[0] + 9)
285d : a9 08 __ LDA #$08
285f : 9d 03 a4 STA $a403,x ; (BLIT_CODE[0] + 3)
2862 : 9d 08 a4 STA $a408,x ; (BLIT_CODE[0] + 8)
2865 : a9 a5 __ LDA #$a5
2867 : 9d 05 a4 STA $a405,x ; (BLIT_CODE[0] + 5)
286a : a9 02 __ LDA #$02
286c : 9d 0c a4 STA $a40c,x ; (BLIT_CODE[0] + 12)
286f : a9 04 __ LDA #$04
2871 : 9d 0e a4 STA $a40e,x ; (BLIT_CODE[0] + 14)
2874 : a5 58 __ LDA T17 + 0 
2876 : 9d 04 a4 STA $a404,x ; (BLIT_CODE[0] + 4)
2879 : a5 59 __ LDA T18 + 0 
287b : 09 08 __ ORA #$08
287d : 9d 07 a4 STA $a407,x ; (BLIT_CODE[0] + 7)
2880 : a5 5a __ LDA T19 + 0 
2882 : 9d 0b a4 STA $a40b,x ; (BLIT_CODE[0] + 11)
2885 : a5 5b __ LDA T20 + 0 
2887 : 09 04 __ ORA #$04
2889 : 9d 0d a4 STA $a40d,x ; (BLIT_CODE[0] + 13)
288c : 8a __ __ TXA
288d : 18 __ __ CLC
288e : 69 0f __ ADC #$0f
.s91:
2890 : 85 0d __ STA P0 
2892 : 20 fa 2c JSR $2cfa ; (builddop_src@proxy + 0)
.s92:
2895 : 85 0d __ STA P0 
2897 : a5 18 __ LDA P11 ; (op + 0)
2899 : 85 0e __ STA P1 
289b : a5 45 __ LDA T1 + 0 
289d : 49 ff __ EOR #$ff
289f : 85 0f __ STA P2 
28a1 : 20 3d 2e JSR $2e3d ; (builddop_op.s4 + 0)
28a4 : 85 43 __ STA T0 + 0 
28a6 : a5 4d __ LDA T6 + 0 
28a8 : f0 63 __ BEQ $290d ; (bmu_bitblit.s13 + 0)
.s34:
28aa : a9 a0 __ LDA #$a0
28ac : a6 43 __ LDX T0 + 0 
28ae : e8 __ __ INX
28af : e8 __ __ INX
28b0 : 86 43 __ STX T0 + 0 
28b2 : 86 0d __ STX P0 
28b4 : 9d fe a3 STA $a3fe,x 
28b7 : 18 __ __ CLC
28b8 : a5 5d __ LDA T22 + 0 
28ba : 65 5c __ ADC T21 + 0 
28bc : 9d ff a3 STA $a3ff,x 
28bf : 85 5c __ STA T21 + 0 
28c1 : a5 4d __ LDA T6 + 0 
.s35:
28c3 : c9 02 __ CMP #$02
28c5 : 90 03 __ BCC $28ca ; (bmu_bitblit.s36 + 0)
28c7 : 4c 93 2a JMP $2a93 ; (bmu_bitblit.s42 + 0)
.s36:
28ca : a5 56 __ LDA T14 + 0 
28cc : f0 3f __ BEQ $290d ; (bmu_bitblit.s13 + 0)
.s37:
28ce : a5 52 __ LDA T12 + 0 
28d0 : f0 1e __ BEQ $28f0 ; (bmu_bitblit.s38 + 0)
.s41:
28d2 : a9 b1 __ LDA #$b1
28d4 : a6 43 __ LDX T0 + 0 
28d6 : 9d 00 a4 STA $a400,x ; (BLIT_CODE[0] + 0)
28d9 : a9 05 __ LDA #$05
28db : 9d 01 a4 STA $a401,x ; (BLIT_CODE[0] + 1)
28de : a9 85 __ LDA #$85
28e0 : 9d 02 a4 STA $a402,x ; (BLIT_CODE[0] + 2)
28e3 : a9 0a __ LDA #$0a
28e5 : 9d 03 a4 STA $a403,x ; (BLIT_CODE[0] + 3)
28e8 : 8a __ __ TXA
28e9 : 18 __ __ CLC
28ea : 69 04 __ ADC #$04
28ec : 85 43 __ STA T0 + 0 
28ee : 85 0d __ STA P0 
.s38:
28f0 : a5 4c __ LDA T5 + 0 
28f2 : d0 05 __ BNE $28f9 ; (bmu_bitblit.s40 + 0)
.s39:
28f4 : a5 43 __ LDA T0 + 0 
28f6 : 4c fc 28 JMP $28fc ; (bmu_bitblit.s90 + 0)
.s40:
28f9 : 20 fa 2c JSR $2cfa ; (builddop_src@proxy + 0)
.s90:
28fc : 85 0d __ STA P0 
28fe : a5 18 __ LDA P11 ; (op + 0)
2900 : 85 0e __ STA P1 
2902 : a5 56 __ LDA T14 + 0 
2904 : 49 ff __ EOR #$ff
2906 : 85 0f __ STA P2 
2908 : 20 3d 2e JSR $2e3d ; (builddop_op.s4 + 0)
290b : 85 43 __ STA T0 + 0 
.s13:
290d : a9 60 __ LDA #$60
290f : a6 43 __ LDX T0 + 0 
2911 : 9d 00 a4 STA $a400,x ; (BLIT_CODE[0] + 0)
2914 : 18 __ __ CLC
2915 : a5 51 __ LDA T10 + 0 
2917 : 69 ff __ ADC #$ff
2919 : 2a __ __ ROL
291a : 2a __ __ ROL
291b : 2a __ __ ROL
291c : aa __ __ TAX
291d : 29 f8 __ AND #$f8
291f : 85 43 __ STA T0 + 0 
2921 : 8a __ __ TXA
2922 : 29 07 __ AND #$07
2924 : 2a __ __ ROL
2925 : 69 f8 __ ADC #$f8
2927 : 85 44 __ STA T0 + 1 
2929 : a5 4c __ LDA T5 + 0 
292b : d0 78 __ BNE $29a5 ; (bmu_bitblit.s22 + 0)
.s14:
292d : a5 18 __ LDA P11 ; (op + 0)
292f : 29 20 __ AND #$20
2931 : d0 3d __ BNE $2970 ; (bmu_bitblit.l19 + 0)
.s15:
2933 : 85 47 __ STA T2 + 0 
.l16:
2935 : a5 53 __ LDA T11 + 0 
2937 : 85 05 __ STA WORK + 2 
2939 : 85 03 __ STA WORK + 0 
293b : a5 54 __ LDA T11 + 1 
293d : 85 06 __ STA WORK + 3 
293f : 85 04 __ STA WORK + 1 
2941 : a5 47 __ LDA T2 + 0 
2943 : 85 07 __ STA WORK + 4 
2945 : 20 00 a4 JSR $a400 ; (BLIT_CODE[0] + 0)
2948 : e6 53 __ INC T11 + 0 
294a : d0 02 __ BNE $294e ; (bmu_bitblit.s104 + 0)
.s103:
294c : e6 54 __ INC T11 + 1 
.s104:
294e : a5 53 __ LDA T11 + 0 
2950 : 29 07 __ AND #$07
2952 : d0 0d __ BNE $2961 ; (bmu_bitblit.s17 + 0)
.s18:
2954 : 18 __ __ CLC
2955 : a5 53 __ LDA T11 + 0 
2957 : 65 43 __ ADC T0 + 0 
2959 : 85 53 __ STA T11 + 0 
295b : a5 54 __ LDA T11 + 1 
295d : 65 44 __ ADC T0 + 1 
295f : 85 54 __ STA T11 + 1 
.s17:
2961 : c6 4e __ DEC T8 + 0 
2963 : d0 d0 __ BNE $2935 ; (bmu_bitblit.l16 + 0)
.s3:
2965 : a2 0c __ LDX #$0c
2967 : bd d3 bf LDA $bfd3,x ; (bmu_bitblit@stack + 0)
296a : 95 53 __ STA T11 + 0,x 
296c : ca __ __ DEX
296d : 10 f8 __ BPL $2967 ; (bmu_bitblit.s3 + 2)
296f : 60 __ __ RTS
.l19:
2970 : a5 53 __ LDA T11 + 0 
2972 : 85 05 __ STA WORK + 2 
2974 : 85 03 __ STA WORK + 0 
2976 : 29 07 __ AND #$07
2978 : aa __ __ TAX
2979 : a5 54 __ LDA T11 + 1 
297b : 85 06 __ STA WORK + 3 
297d : 85 04 __ STA WORK + 1 
297f : b5 00 __ LDA $00,x 
2981 : 85 07 __ STA WORK + 4 
2983 : 20 00 a4 JSR $a400 ; (BLIT_CODE[0] + 0)
2986 : e6 53 __ INC T11 + 0 
2988 : d0 02 __ BNE $298c ; (bmu_bitblit.s102 + 0)
.s101:
298a : e6 54 __ INC T11 + 1 
.s102:
298c : a5 53 __ LDA T11 + 0 
298e : 29 07 __ AND #$07
2990 : d0 0d __ BNE $299f ; (bmu_bitblit.s20 + 0)
.s21:
2992 : 18 __ __ CLC
2993 : a5 53 __ LDA T11 + 0 
2995 : 65 43 __ ADC T0 + 0 
2997 : 85 53 __ STA T11 + 0 
2999 : a5 54 __ LDA T11 + 1 
299b : 65 44 __ ADC T0 + 1 
299d : 85 54 __ STA T11 + 1 
.s20:
299f : c6 4e __ DEC T8 + 0 
29a1 : d0 cd __ BNE $2970 ; (bmu_bitblit.l19 + 0)
29a3 : f0 c0 __ BEQ $2965 ; (bmu_bitblit.s3 + 0)
.s22:
29a5 : a5 4a __ LDA T4 + 0 
29a7 : 85 45 __ STA T1 + 0 
29a9 : a5 4b __ LDA T4 + 1 
29ab : 85 46 __ STA T1 + 1 
29ad : a0 04 __ LDY #$04
29af : b1 4f __ LDA (T9 + 0),y 
29b1 : 18 __ __ CLC
29b2 : 69 ff __ ADC #$ff
29b4 : 2a __ __ ROL
29b5 : 2a __ __ ROL
29b6 : 2a __ __ ROL
29b7 : aa __ __ TAX
29b8 : 29 f8 __ AND #$f8
29ba : 85 47 __ STA T2 + 0 
29bc : 8a __ __ TXA
29bd : 29 07 __ AND #$07
29bf : 2a __ __ ROL
29c0 : 69 f8 __ ADC #$f8
29c2 : 85 48 __ STA T2 + 1 
29c4 : a5 57 __ LDA T16 + 0 
29c6 : f0 1d __ BEQ $29e5 ; (bmu_bitblit.l23 + 0)
.s28:
29c8 : 38 __ __ SEC
29c9 : a9 00 __ LDA #$00
29cb : e5 43 __ SBC T0 + 0 
29cd : 85 43 __ STA T0 + 0 
29cf : a9 00 __ LDA #$00
29d1 : e5 44 __ SBC T0 + 1 
29d3 : 85 44 __ STA T0 + 1 
29d5 : 38 __ __ SEC
29d6 : a9 00 __ LDA #$00
29d8 : e5 47 __ SBC T2 + 0 
29da : 85 47 __ STA T2 + 0 
29dc : a9 00 __ LDA #$00
29de : e5 48 __ SBC T2 + 1 
29e0 : 85 48 __ STA T2 + 1 
29e2 : 4c 38 2a JMP $2a38 ; (bmu_bitblit.l29 + 0)
.l23:
29e5 : a5 4a __ LDA T4 + 0 
29e7 : 85 03 __ STA WORK + 0 
29e9 : a5 4b __ LDA T4 + 1 
29eb : 85 04 __ STA WORK + 1 
29ed : a5 54 __ LDA T11 + 1 
29ef : 85 06 __ STA WORK + 3 
29f1 : a5 53 __ LDA T11 + 0 
29f3 : 85 05 __ STA WORK + 2 
29f5 : 29 07 __ AND #$07
29f7 : a8 __ __ TAY
29f8 : b1 45 __ LDA (T1 + 0),y 
29fa : 85 07 __ STA WORK + 4 
29fc : 20 00 a4 JSR $a400 ; (BLIT_CODE[0] + 0)
29ff : e6 4a __ INC T4 + 0 
2a01 : d0 02 __ BNE $2a05 ; (bmu_bitblit.s98 + 0)
.s97:
2a03 : e6 4b __ INC T4 + 1 
.s98:
2a05 : a5 4a __ LDA T4 + 0 
2a07 : 29 07 __ AND #$07
2a09 : d0 0d __ BNE $2a18 ; (bmu_bitblit.s24 + 0)
.s27:
2a0b : 18 __ __ CLC
2a0c : a5 4a __ LDA T4 + 0 
2a0e : 65 47 __ ADC T2 + 0 
2a10 : 85 4a __ STA T4 + 0 
2a12 : a5 4b __ LDA T4 + 1 
2a14 : 65 48 __ ADC T2 + 1 
2a16 : 85 4b __ STA T4 + 1 
.s24:
2a18 : e6 53 __ INC T11 + 0 
2a1a : d0 02 __ BNE $2a1e ; (bmu_bitblit.s100 + 0)
.s99:
2a1c : e6 54 __ INC T11 + 1 
.s100:
2a1e : a5 53 __ LDA T11 + 0 
2a20 : 29 07 __ AND #$07
2a22 : d0 0d __ BNE $2a31 ; (bmu_bitblit.s25 + 0)
.s26:
2a24 : 18 __ __ CLC
2a25 : a5 53 __ LDA T11 + 0 
2a27 : 65 43 __ ADC T0 + 0 
2a29 : 85 53 __ STA T11 + 0 
2a2b : a5 54 __ LDA T11 + 1 
2a2d : 65 44 __ ADC T0 + 1 
2a2f : 85 54 __ STA T11 + 1 
.s25:
2a31 : c6 4e __ DEC T8 + 0 
2a33 : d0 b0 __ BNE $29e5 ; (bmu_bitblit.l23 + 0)
2a35 : 4c 65 29 JMP $2965 ; (bmu_bitblit.s3 + 0)
.l29:
2a38 : a5 4a __ LDA T4 + 0 
2a3a : 29 07 __ AND #$07
2a3c : d0 0d __ BNE $2a4b ; (bmu_bitblit.s30 + 0)
.s33:
2a3e : 18 __ __ CLC
2a3f : a5 4a __ LDA T4 + 0 
2a41 : 65 47 __ ADC T2 + 0 
2a43 : 85 4a __ STA T4 + 0 
2a45 : a5 4b __ LDA T4 + 1 
2a47 : 65 48 __ ADC T2 + 1 
2a49 : 85 4b __ STA T4 + 1 
.s30:
2a4b : a5 53 __ LDA T11 + 0 
2a4d : 29 07 __ AND #$07
2a4f : d0 0d __ BNE $2a5e ; (bmu_bitblit.s31 + 0)
.s32:
2a51 : 18 __ __ CLC
2a52 : a5 53 __ LDA T11 + 0 
2a54 : 65 43 __ ADC T0 + 0 
2a56 : 85 53 __ STA T11 + 0 
2a58 : a5 54 __ LDA T11 + 1 
2a5a : 65 44 __ ADC T0 + 1 
2a5c : 85 54 __ STA T11 + 1 
.s31:
2a5e : 18 __ __ CLC
2a5f : a5 53 __ LDA T11 + 0 
2a61 : 69 ff __ ADC #$ff
2a63 : 85 05 __ STA WORK + 2 
2a65 : 85 53 __ STA T11 + 0 
2a67 : a5 54 __ LDA T11 + 1 
2a69 : 69 ff __ ADC #$ff
2a6b : 85 54 __ STA T11 + 1 
2a6d : 85 06 __ STA WORK + 3 
2a6f : 18 __ __ CLC
2a70 : a5 4a __ LDA T4 + 0 
2a72 : 69 ff __ ADC #$ff
2a74 : 85 4a __ STA T4 + 0 
2a76 : 85 03 __ STA WORK + 0 
2a78 : a5 4b __ LDA T4 + 1 
2a7a : 69 ff __ ADC #$ff
2a7c : 85 4b __ STA T4 + 1 
2a7e : 85 04 __ STA WORK + 1 
2a80 : a5 05 __ LDA WORK + 2 
2a82 : 29 07 __ AND #$07
2a84 : a8 __ __ TAY
2a85 : b1 45 __ LDA (T1 + 0),y 
2a87 : 85 07 __ STA WORK + 4 
2a89 : 20 00 a4 JSR $a400 ; (BLIT_CODE[0] + 0)
2a8c : c6 4e __ DEC T8 + 0 
2a8e : d0 a8 __ BNE $2a38 ; (bmu_bitblit.l29 + 0)
2a90 : 4c 65 29 JMP $2965 ; (bmu_bitblit.s3 + 0)
.s42:
2a93 : a9 02 __ LDA #$02
2a95 : c5 5e __ CMP T23 + 0 
2a97 : a9 00 __ LDA #$00
2a99 : 6a __ __ ROR
2a9a : 85 49 __ STA T3 + 0 
2a9c : d0 19 __ BNE $2ab7 ; (bmu_bitblit.s43 + 0)
.s61:
2a9e : a9 a2 __ LDA #$a2
2aa0 : a6 43 __ LDX T0 + 0 
2aa2 : e8 __ __ INX
2aa3 : e8 __ __ INX
2aa4 : 86 43 __ STX T0 + 0 
2aa6 : 9d fe a3 STA $a3fe,x 
2aa9 : 38 __ __ SEC
2aaa : a5 5e __ LDA T23 + 0 
2aac : e9 01 __ SBC #$01
2aae : 9d ff a3 STA $a3ff,x 
2ab1 : a5 5e __ LDA T23 + 0 
2ab3 : c9 20 __ CMP #$20
2ab5 : b0 0d __ BCS $2ac4 ; (bmu_bitblit.s45 + 0)
.s43:
2ab7 : a5 5f __ LDA T24 + 0 
2ab9 : d0 09 __ BNE $2ac4 ; (bmu_bitblit.s45 + 0)
.s44:
2abb : a5 58 __ LDA T17 + 0 
2abd : a6 43 __ LDX T0 + 0 
2abf : 9d 00 a4 STA $a400,x ; (BLIT_CODE[0] + 0)
2ac2 : e6 43 __ INC T0 + 0 
.s45:
2ac4 : a5 43 __ LDA T0 + 0 
2ac6 : 85 55 __ STA T13 + 0 
2ac8 : a5 52 __ LDA T12 + 0 
2aca : f0 1c __ BEQ $2ae8 ; (bmu_bitblit.s46 + 0)
.s60:
2acc : a9 b1 __ LDA #$b1
2ace : a6 43 __ LDX T0 + 0 
2ad0 : 9d 00 a4 STA $a400,x ; (BLIT_CODE[0] + 0)
2ad3 : a9 05 __ LDA #$05
2ad5 : 9d 01 a4 STA $a401,x ; (BLIT_CODE[0] + 1)
2ad8 : a9 85 __ LDA #$85
2ada : 9d 02 a4 STA $a402,x ; (BLIT_CODE[0] + 2)
2add : a9 0a __ LDA #$0a
2adf : 9d 03 a4 STA $a403,x ; (BLIT_CODE[0] + 3)
2ae2 : 8a __ __ TXA
2ae3 : 18 __ __ CLC
2ae4 : 69 04 __ ADC #$04
2ae6 : 85 43 __ STA T0 + 0 
.s46:
2ae8 : a5 4c __ LDA T5 + 0 
2aea : d0 05 __ BNE $2af1 ; (bmu_bitblit.s59 + 0)
.s47:
2aec : a5 43 __ LDA T0 + 0 
2aee : 4c f8 2a JMP $2af8 ; (bmu_bitblit.s89 + 0)
.s59:
2af1 : a5 43 __ LDA T0 + 0 
2af3 : 85 0d __ STA P0 
2af5 : 20 fa 2c JSR $2cfa ; (builddop_src@proxy + 0)
.s89:
2af8 : 85 0d __ STA P0 
2afa : a5 18 __ LDA P11 ; (op + 0)
2afc : 85 0e __ STA P1 
2afe : a9 00 __ LDA #$00
2b00 : 85 0f __ STA P2 
2b02 : 20 3d 2e JSR $2e3d ; (builddop_op.s4 + 0)
2b05 : 24 49 __ BIT T3 + 0 
2b07 : 10 1b __ BPL $2b24 ; (bmu_bitblit.s50 + 0)
.s48:
2b09 : 85 43 __ STA T0 + 0 
2b0b : aa __ __ TAX
2b0c : a9 a0 __ LDA #$a0
2b0e : 9d 00 a4 STA $a400,x ; (BLIT_CODE[0] + 0)
2b11 : 18 __ __ CLC
2b12 : a5 5d __ LDA T22 + 0 
2b14 : 65 5c __ ADC T21 + 0 
2b16 : 9d 01 a4 STA $a401,x ; (BLIT_CODE[0] + 1)
.s49:
2b19 : a6 43 __ LDX T0 + 0 
2b1b : e8 __ __ INX
2b1c : e8 __ __ INX
2b1d : 86 43 __ STX T0 + 0 
2b1f : 86 0d __ STX P0 
2b21 : 4c ca 28 JMP $28ca ; (bmu_bitblit.s36 + 0)
.s50:
2b24 : aa __ __ TAX
2b25 : a9 1f __ LDA #$1f
2b27 : c5 5e __ CMP T23 + 0 
2b29 : a9 00 __ LDA #$00
2b2b : 6a __ __ ROR
2b2c : 85 4d __ STA T6 + 0 
2b2e : f0 04 __ BEQ $2b34 ; (bmu_bitblit.s58 + 0)
.s51:
2b30 : a5 5f __ LDA T24 + 0 
2b32 : f0 06 __ BEQ $2b3a ; (bmu_bitblit.s52 + 0)
.s58:
2b34 : a5 58 __ LDA T17 + 0 
2b36 : 9d 00 a4 STA $a400,x ; (BLIT_CODE[0] + 0)
2b39 : e8 __ __ INX
.s52:
2b3a : a9 98 __ LDA #$98
2b3c : 9d 00 a4 STA $a400,x ; (BLIT_CODE[0] + 0)
2b3f : a9 08 __ LDA #$08
2b41 : 9d 02 a4 STA $a402,x ; (BLIT_CODE[0] + 2)
2b44 : a9 a8 __ LDA #$a8
2b46 : 9d 03 a4 STA $a403,x ; (BLIT_CODE[0] + 3)
2b49 : a5 59 __ LDA T18 + 0 
2b4b : 09 08 __ ORA #$08
2b4d : 9d 01 a4 STA $a401,x ; (BLIT_CODE[0] + 1)
2b50 : 8a __ __ TXA
2b51 : 18 __ __ CLC
2b52 : 69 04 __ ADC #$04
2b54 : 85 43 __ STA T0 + 0 
2b56 : 24 4d __ BIT T6 + 0 
2b58 : 30 3a __ BMI $2b94 ; (bmu_bitblit.s53 + 0)
.s54:
2b5a : a5 5a __ LDA T19 + 0 
2b5c : 9d 04 a4 STA $a404,x ; (BLIT_CODE[0] + 4)
2b5f : a5 5b __ LDA T20 + 0 
2b61 : 09 04 __ ORA #$04
2b63 : a8 __ __ TAY
2b64 : a5 4c __ LDA T5 + 0 
2b66 : d0 0d __ BNE $2b75 ; (bmu_bitblit.s57 + 0)
.s55:
2b68 : a9 02 __ LDA #$02
2b6a : 9d 05 a4 STA $a405,x ; (BLIT_CODE[0] + 5)
2b6d : 18 __ __ CLC
2b6e : a5 43 __ LDA T0 + 0 
2b70 : 69 02 __ ADC #$02
2b72 : 4c 86 2b JMP $2b86 ; (bmu_bitblit.s56 + 0)
.s57:
2b75 : a9 04 __ LDA #$04
2b77 : 9d 05 a4 STA $a405,x ; (BLIT_CODE[0] + 5)
2b7a : 9d 07 a4 STA $a407,x ; (BLIT_CODE[0] + 7)
2b7d : 98 __ __ TYA
2b7e : 9d 06 a4 STA $a406,x ; (BLIT_CODE[0] + 6)
2b81 : 18 __ __ CLC
2b82 : a5 43 __ LDA T0 + 0 
2b84 : 69 04 __ ADC #$04
.s56:
2b86 : aa __ __ TAX
2b87 : e8 __ __ INX
2b88 : e8 __ __ INX
2b89 : 86 43 __ STX T0 + 0 
2b8b : 98 __ __ TYA
2b8c : 9d fe a3 STA $a3fe,x 
2b8f : a9 06 __ LDA #$06
2b91 : 9d ff a3 STA $a3ff,x 
.s53:
2b94 : a9 ca __ LDA #$ca
2b96 : a6 43 __ LDX T0 + 0 
2b98 : 9d 00 a4 STA $a400,x ; (BLIT_CODE[0] + 0)
2b9b : a9 d0 __ LDA #$d0
2b9d : 9d 01 a4 STA $a401,x ; (BLIT_CODE[0] + 1)
2ba0 : e6 43 __ INC T0 + 0 
2ba2 : a5 55 __ LDA T13 + 0 
2ba4 : 38 __ __ SEC
2ba5 : e5 43 __ SBC T0 + 0 
2ba7 : 38 __ __ SEC
2ba8 : e9 02 __ SBC #$02
2baa : 9d 02 a4 STA $a402,x ; (BLIT_CODE[0] + 2)
2bad : 4c 19 2b JMP $2b19 ; (bmu_bitblit.s49 + 0)
.s66:
2bb0 : 85 0d __ STA P0 
2bb2 : a5 4c __ LDA T5 + 0 
2bb4 : f0 51 __ BEQ $2c07 ; (bmu_bitblit.s67 + 0)
.s68:
2bb6 : a5 5f __ LDA T24 + 0 
2bb8 : f0 4d __ BEQ $2c07 ; (bmu_bitblit.s67 + 0)
.s69:
2bba : a9 03 __ LDA #$03
2bbc : 8d 03 a4 STA $a403 ; (BLIT_CODE[0] + 3)
2bbf : 8d 08 a4 STA $a408 ; (BLIT_CODE[0] + 8)
2bc2 : 8d 0c a4 STA $a40c ; (BLIT_CODE[0] + 12)
2bc5 : a9 b1 __ LDA #$b1
2bc7 : 8d 02 a4 STA $a402 ; (BLIT_CODE[0] + 2)
2bca : a9 85 __ LDA #$85
2bcc : 8d 04 a4 STA $a404 ; (BLIT_CODE[0] + 4)
2bcf : 8d 0b a4 STA $a40b ; (BLIT_CODE[0] + 11)
2bd2 : a9 08 __ LDA #$08
2bd4 : 8d 05 a4 STA $a405 ; (BLIT_CODE[0] + 5)
2bd7 : 8d 0a a4 STA $a40a ; (BLIT_CODE[0] + 10)
2bda : a9 a5 __ LDA #$a5
2bdc : 8d 07 a4 STA $a407 ; (BLIT_CODE[0] + 7)
2bdf : a9 02 __ LDA #$02
2be1 : 8d 0e a4 STA $a40e ; (BLIT_CODE[0] + 14)
2be4 : a9 04 __ LDA #$04
2be6 : 8d 10 a4 STA $a410 ; (BLIT_CODE[0] + 16)
2be9 : a5 58 __ LDA T17 + 0 
2beb : 8d 06 a4 STA $a406 ; (BLIT_CODE[0] + 6)
2bee : a5 59 __ LDA T18 + 0 
2bf0 : 09 08 __ ORA #$08
2bf2 : 8d 09 a4 STA $a409 ; (BLIT_CODE[0] + 9)
2bf5 : a5 5a __ LDA T19 + 0 
2bf7 : 8d 0d a4 STA $a40d ; (BLIT_CODE[0] + 13)
2bfa : a5 5b __ LDA T20 + 0 
2bfc : 09 04 __ ORA #$04
2bfe : 8d 0f a4 STA $a40f ; (BLIT_CODE[0] + 15)
2c01 : a9 11 __ LDA #$11
2c03 : 85 43 __ STA T0 + 0 
2c05 : 85 0d __ STA P0 
.s67:
2c07 : 18 __ __ CLC
2c08 : a5 4d __ LDA T6 + 0 
2c0a : 69 01 __ ADC #$01
2c0c : 85 5e __ STA T23 + 0 
2c0e : d0 03 __ BNE $2c13 ; (bmu_bitblit.s67 + 12)
2c10 : 4c 0d 29 JMP $290d ; (bmu_bitblit.s13 + 0)
2c13 : 4c c3 28 JMP $28c3 ; (bmu_bitblit.s35 + 0)
.s76:
2c16 : 18 __ __ CLC
2c17 : a5 12 __ LDA P5 ; (dy + 0)
2c19 : 65 4e __ ADC T8 + 0 
2c1b : 85 47 __ STA T2 + 0 
2c1d : 29 f8 __ AND #$f8
2c1f : 85 1b __ STA ACCU + 0 ; (w + 0)
2c21 : a5 13 __ LDA P6 ; (dy + 1)
2c23 : 69 00 __ ADC #$00
2c25 : 85 1c __ STA ACCU + 1 ; (w + 1)
2c27 : ad fb 87 LDA $87fb ; (Screen.cwidth + 0)
2c2a : 85 51 __ STA T10 + 0 
2c2c : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
2c2f : ad f7 87 LDA $87f7 ; (Screen.data + 0)
2c32 : 18 __ __ CLC
2c33 : 65 1b __ ADC ACCU + 0 ; (w + 0)
2c35 : 85 4c __ STA T5 + 0 
2c37 : ad f8 87 LDA $87f8 ; (Screen.data + 1)
2c3a : 65 1c __ ADC ACCU + 1 ; (w + 1)
2c3c : aa __ __ TAX
2c3d : a5 10 __ LDA P3 ; (dx + 0)
2c3f : 29 f8 __ AND #$f8
2c41 : 18 __ __ CLC
2c42 : 65 4c __ ADC T5 + 0 
2c44 : 85 4c __ STA T5 + 0 
2c46 : 8a __ __ TXA
2c47 : 65 11 __ ADC P4 ; (dx + 1)
2c49 : aa __ __ TAX
2c4a : a5 47 __ LDA T2 + 0 
2c4c : 29 07 __ AND #$07
2c4e : 18 __ __ CLC
2c4f : 65 4c __ ADC T5 + 0 
2c51 : 85 4c __ STA T5 + 0 
2c53 : 90 02 __ BCC $2c57 ; (bmu_bitblit.s107 + 0)
.s106:
2c55 : e8 __ __ INX
2c56 : 18 __ __ CLC
.s107:
2c57 : a5 4d __ LDA T6 + 0 
2c59 : 69 e1 __ ADC #$e1
2c5b : 2a __ __ ROL
2c5c : 2a __ __ ROL
2c5d : 2a __ __ ROL
2c5e : a8 __ __ TAY
2c5f : 29 f8 __ AND #$f8
2c61 : 85 43 __ STA T0 + 0 
2c63 : 98 __ __ TYA
2c64 : 29 07 __ AND #$07
2c66 : 2a __ __ ROL
2c67 : 69 f8 __ ADC #$f8
2c69 : 85 44 __ STA T0 + 1 
2c6b : 18 __ __ CLC
2c6c : a5 4c __ LDA T5 + 0 
2c6e : 65 43 __ ADC T0 + 0 
2c70 : 85 53 __ STA T11 + 0 
2c72 : 8a __ __ TXA
2c73 : 65 44 __ ADC T0 + 1 
2c75 : 85 54 __ STA T11 + 1 
2c77 : a5 56 __ LDA T14 + 0 
2c79 : 85 55 __ STA T13 + 0 
2c7b : a5 52 __ LDA T12 + 0 
2c7d : 85 56 __ STA T14 + 0 
2c7f : ad ea bf LDA $bfea ; (sstack + 0)
2c82 : 18 __ __ CLC
2c83 : 65 4e __ ADC T8 + 0 
2c85 : 85 47 __ STA T2 + 0 
2c87 : 29 f8 __ AND #$f8
2c89 : 85 1b __ STA ACCU + 0 ; (w + 0)
2c8b : ad eb bf LDA $bfeb ; (sstack + 1)
2c8e : 69 00 __ ADC #$00
2c90 : 85 1c __ STA ACCU + 1 ; (w + 1)
2c92 : ad fb 87 LDA $87fb ; (Screen.cwidth + 0)
2c95 : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
2c98 : ad f7 87 LDA $87f7 ; (Screen.data + 0)
2c9b : 18 __ __ CLC
2c9c : 65 1b __ ADC ACCU + 0 ; (w + 0)
2c9e : 85 4a __ STA T4 + 0 
2ca0 : ad f8 87 LDA $87f8 ; (Screen.data + 1)
2ca3 : 65 1c __ ADC ACCU + 1 ; (w + 1)
2ca5 : aa __ __ TAX
2ca6 : a5 16 __ LDA P9 ; (sx + 0)
2ca8 : 29 f8 __ AND #$f8
2caa : 18 __ __ CLC
2cab : 65 4a __ ADC T4 + 0 
2cad : 85 4a __ STA T4 + 0 
2caf : 8a __ __ TXA
2cb0 : 65 17 __ ADC P10 ; (sx + 1)
2cb2 : aa __ __ TAX
2cb3 : a5 47 __ LDA T2 + 0 
2cb5 : 29 07 __ AND #$07
2cb7 : 18 __ __ CLC
2cb8 : 65 4a __ ADC T4 + 0 
2cba : 90 02 __ BCC $2cbe ; (bmu_bitblit.s109 + 0)
.s108:
2cbc : e8 __ __ INX
2cbd : 18 __ __ CLC
.s109:
2cbe : 65 43 __ ADC T0 + 0 
2cc0 : 85 4a __ STA T4 + 0 
2cc2 : 8a __ __ TXA
2cc3 : 65 44 __ ADC T0 + 1 
2cc5 : 85 4b __ STA T4 + 1 
2cc7 : a9 01 __ LDA #$01
2cc9 : 85 57 __ STA T16 + 0 
2ccb : a5 16 __ LDA P9 ; (sx + 0)
2ccd : 29 07 __ AND #$07
2ccf : 49 ff __ EOR #$ff
2cd1 : 38 __ __ SEC
2cd2 : 65 45 __ ADC T1 + 0 
2cd4 : 85 43 __ STA T0 + 0 
2cd6 : 10 0b __ BPL $2ce3 ; (bmu_bitblit.s77 + 0)
.s78:
2cd8 : 18 __ __ CLC
2cd9 : a5 4a __ LDA T4 + 0 
2cdb : 69 08 __ ADC #$08
2cdd : 85 4a __ STA T4 + 0 
2cdf : 90 02 __ BCC $2ce3 ; (bmu_bitblit.s77 + 0)
.s110:
2ce1 : e6 4b __ INC T4 + 1 
.s77:
2ce3 : a9 38 __ LDA #$38
2ce5 : 85 58 __ STA T17 + 0 
2ce7 : a9 e1 __ LDA #$e1
2ce9 : 85 59 __ STA T18 + 0 
2ceb : a9 b0 __ LDA #$b0
2ced : 85 5a __ STA T19 + 0 
2cef : a9 c2 __ LDA #$c2
2cf1 : 85 5b __ STA T20 + 0 
2cf3 : a9 f8 __ LDA #$f8
2cf5 : 85 5c __ STA T21 + 0 
2cf7 : 4c db 27 JMP $27db ; (bmu_bitblit.s7 + 0)
--------------------------------------------------------------------
builddop_src@proxy: ; builddop_src@proxy
2cfa : a5 5f __ LDA $5f 
2cfc : 85 0e __ STA P1 
2cfe : a5 57 __ LDA $57 
2d00 : 85 0f __ STA P2 
--------------------------------------------------------------------
builddop_src: ; builddop_src(u8,u8,bool)->u8
; 888, "/home/xahmol/oscar64/include/gfx/bitmap.c"
.s4:
2d02 : a6 0d __ LDX P0 ; (ip + 0)
2d04 : e8 __ __ INX
2d05 : a4 0d __ LDY P0 ; (ip + 0)
2d07 : e8 __ __ INX
2d08 : a5 0e __ LDA P1 ; (shift + 0)
2d0a : d0 0c __ BNE $2d18 ; (builddop_src.s6 + 0)
.s5:
2d0c : a9 b1 __ LDA #$b1
2d0e : 99 00 a4 STA $a400,y ; (BLIT_CODE[0] + 0)
2d11 : a9 03 __ LDA #$03
2d13 : 99 01 a4 STA $a401,y ; (BLIT_CODE[0] + 1)
.s35:
2d16 : 8a __ __ TXA
.s3:
2d17 : 60 __ __ RTS
.s6:
2d18 : a9 a5 __ LDA #$a5
2d1a : 99 00 a4 STA $a400,y ; (BLIT_CODE[0] + 0)
2d1d : a9 08 __ LDA #$08
2d1f : 99 01 a4 STA $a401,y ; (BLIT_CODE[0] + 1)
2d22 : a5 0f __ LDA P2 ; (reverse + 0)
2d24 : f0 03 __ BEQ $2d29 ; (builddop_src.s7 + 0)
2d26 : 4c 2f 2e JMP $2e2f ; (builddop_src.s26 + 0)
.s7:
2d29 : a5 0e __ LDA P1 ; (shift + 0)
2d2b : c9 05 __ CMP #$05
2d2d : b0 06 __ BCS $2d35 ; (builddop_src.s8 + 0)
.s24:
2d2f : a9 4a __ LDA #$4a
.s25:
2d31 : 99 02 a4 STA $a402,y ; (BLIT_CODE[0] + 2)
2d34 : e8 __ __ INX
.s8:
2d35 : a9 85 __ LDA #$85
2d37 : 9d 00 a4 STA $a400,x ; (BLIT_CODE[0] + 0)
2d3a : 9d 04 a4 STA $a404,x ; (BLIT_CODE[0] + 4)
2d3d : a9 09 __ LDA #$09
2d3f : 9d 01 a4 STA $a401,x ; (BLIT_CODE[0] + 1)
2d42 : a9 b1 __ LDA #$b1
2d44 : 9d 02 a4 STA $a402,x ; (BLIT_CODE[0] + 2)
2d47 : a9 03 __ LDA #$03
2d49 : 9d 03 a4 STA $a403,x ; (BLIT_CODE[0] + 3)
2d4c : a9 08 __ LDA #$08
2d4e : 9d 05 a4 STA $a405,x ; (BLIT_CODE[0] + 5)
2d51 : 8a __ __ TXA
2d52 : 18 __ __ CLC
2d53 : 69 06 __ ADC #$06
2d55 : 85 1b __ STA ACCU + 0 
2d57 : 85 0d __ STA P0 ; (ip + 0)
2d59 : a5 0f __ LDA P2 ; (reverse + 0)
2d5b : d0 6a __ BNE $2dc7 ; (builddop_src.s17 + 0)
.s9:
2d5d : a5 0e __ LDA P1 ; (shift + 0)
2d5f : c9 05 __ CMP #$05
2d61 : 90 0b __ BCC $2d6e ; (builddop_src.s10 + 0)
.s13:
2d63 : a9 0a __ LDA #$0a
2d65 : 9d 06 a4 STA $a406,x ; (BLIT_CODE[0] + 6)
2d68 : e6 1b __ INC ACCU + 0 
2d6a : a6 0e __ LDX P1 ; (shift + 0)
2d6c : b0 2e __ BCS $2d9c ; (builddop_src.l14 + 0)
.s10:
2d6e : c9 02 __ CMP #$02
2d70 : 90 1f __ BCC $2d91 ; (builddop_src.s11 + 0)
.s12:
2d72 : c6 0e __ DEC P1 ; (shift + 0)
2d74 : a6 0d __ LDX P0 ; (ip + 0)
2d76 : a4 0e __ LDY P1 ; (shift + 0)
.l31:
2d78 : a9 6a __ LDA #$6a
2d7a : 9d 00 a4 STA $a400,x ; (BLIT_CODE[0] + 0)
2d7d : a9 46 __ LDA #$46
2d7f : 9d 01 a4 STA $a401,x ; (BLIT_CODE[0] + 1)
2d82 : a9 09 __ LDA #$09
2d84 : 9d 02 a4 STA $a402,x ; (BLIT_CODE[0] + 2)
2d87 : 8a __ __ TXA
2d88 : 18 __ __ CLC
2d89 : 69 03 __ ADC #$03
2d8b : aa __ __ TAX
2d8c : 88 __ __ DEY
2d8d : d0 e9 __ BNE $2d78 ; (builddop_src.l31 + 0)
.s32:
2d8f : 85 0d __ STA P0 ; (ip + 0)
.s11:
2d91 : a9 6a __ LDA #$6a
.s33:
2d93 : a6 0d __ LDX P0 ; (ip + 0)
2d95 : 9d 00 a4 STA $a400,x ; (BLIT_CODE[0] + 0)
2d98 : e8 __ __ INX
2d99 : 4c 16 2d JMP $2d16 ; (builddop_src.s35 + 0)
.l14:
2d9c : a9 09 __ LDA #$09
2d9e : a4 1b __ LDY ACCU + 0 
2da0 : 99 01 a4 STA $a401,y ; (BLIT_CODE[0] + 1)
2da3 : 98 __ __ TYA
2da4 : 18 __ __ CLC
2da5 : 69 03 __ ADC #$03
2da7 : 85 1b __ STA ACCU + 0 
2da9 : e0 07 __ CPX #$07
2dab : b0 0d __ BCS $2dba ; (builddop_src.s15 + 0)
.s16:
2dad : a9 26 __ LDA #$26
2daf : 99 00 a4 STA $a400,y ; (BLIT_CODE[0] + 0)
2db2 : a9 0a __ LDA #$0a
2db4 : 99 02 a4 STA $a402,y ; (BLIT_CODE[0] + 2)
2db7 : e8 __ __ INX
2db8 : 90 e2 __ BCC $2d9c ; (builddop_src.l14 + 0)
.s15:
2dba : a9 a5 __ LDA #$a5
2dbc : 99 00 a4 STA $a400,y ; (BLIT_CODE[0] + 0)
2dbf : a9 2a __ LDA #$2a
2dc1 : 99 02 a4 STA $a402,y ; (BLIT_CODE[0] + 2)
2dc4 : a5 1b __ LDA ACCU + 0 
2dc6 : 60 __ __ RTS
.s17:
2dc7 : a4 0e __ LDY P1 ; (shift + 0)
2dc9 : c0 05 __ CPY #$05
2dcb : b0 3d __ BCS $2e0a ; (builddop_src.s21 + 0)
.s18:
2dcd : a9 4a __ LDA #$4a
2dcf : 9d 06 a4 STA $a406,x ; (BLIT_CODE[0] + 6)
2dd2 : e6 1b __ INC ACCU + 0 
2dd4 : c0 02 __ CPY #$02
2dd6 : 90 1c __ BCC $2df4 ; (builddop_src.s19 + 0)
.s20:
2dd8 : a6 1b __ LDX ACCU + 0 
2dda : 88 __ __ DEY
.l29:
2ddb : a9 66 __ LDA #$66
2ddd : 9d 00 a4 STA $a400,x ; (BLIT_CODE[0] + 0)
2de0 : a9 09 __ LDA #$09
2de2 : 9d 01 a4 STA $a401,x ; (BLIT_CODE[0] + 1)
2de5 : a9 4a __ LDA #$4a
2de7 : 9d 02 a4 STA $a402,x ; (BLIT_CODE[0] + 2)
2dea : 8a __ __ TXA
2deb : 18 __ __ CLC
2dec : 69 03 __ ADC #$03
2dee : aa __ __ TAX
2def : 88 __ __ DEY
2df0 : d0 e9 __ BNE $2ddb ; (builddop_src.l29 + 0)
.s30:
2df2 : 85 1b __ STA ACCU + 0 
.s19:
2df4 : a9 a5 __ LDA #$a5
2df6 : a6 1b __ LDX ACCU + 0 
2df8 : 9d 00 a4 STA $a400,x ; (BLIT_CODE[0] + 0)
2dfb : a9 09 __ LDA #$09
2dfd : 9d 01 a4 STA $a401,x ; (BLIT_CODE[0] + 1)
2e00 : a9 6a __ LDA #$6a
2e02 : 9d 02 a4 STA $a402,x ; (BLIT_CODE[0] + 2)
2e05 : 8a __ __ TXA
2e06 : 18 __ __ CLC
2e07 : 69 03 __ ADC #$03
2e09 : 60 __ __ RTS
.s21:
2e0a : c0 07 __ CPY #$07
2e0c : b0 1c __ BCS $2e2a ; (builddop_src.s22 + 0)
.s23:
2e0e : a6 0d __ LDX P0 ; (ip + 0)
.l34:
2e10 : a9 2a __ LDA #$2a
2e12 : 9d 00 a4 STA $a400,x ; (BLIT_CODE[0] + 0)
2e15 : a9 06 __ LDA #$06
2e17 : 9d 01 a4 STA $a401,x ; (BLIT_CODE[0] + 1)
2e1a : a9 09 __ LDA #$09
2e1c : 9d 02 a4 STA $a402,x ; (BLIT_CODE[0] + 2)
2e1f : 8a __ __ TXA
2e20 : 69 03 __ ADC #$03
2e22 : c8 __ __ INY
2e23 : c0 07 __ CPY #$07
2e25 : aa __ __ TAX
2e26 : 90 e8 __ BCC $2e10 ; (builddop_src.l34 + 0)
.s28:
2e28 : 85 0d __ STA P0 ; (ip + 0)
.s22:
2e2a : a9 2a __ LDA #$2a
2e2c : 4c 93 2d JMP $2d93 ; (builddop_src.s33 + 0)
.s26:
2e2f : a5 0e __ LDA P1 ; (shift + 0)
2e31 : c9 05 __ CMP #$05
2e33 : b0 03 __ BCS $2e38 ; (builddop_src.s27 + 0)
2e35 : 4c 35 2d JMP $2d35 ; (builddop_src.s8 + 0)
.s27:
2e38 : a9 0a __ LDA #$0a
2e3a : 4c 31 2d JMP $2d31 ; (builddop_src.s25 + 0)
--------------------------------------------------------------------
builddop_op: ; builddop_op(u8,enum BlitOp,u8)->u8
; 965, "/home/xahmol/oscar64/include/gfx/bitmap.c"
.s4:
2e3d : a5 0e __ LDA P1 ; (op + 0)
2e3f : 29 20 __ AND #$20
2e41 : f0 04 __ BEQ $2e47 ; (builddop_op.s27 + 0)
.s28:
2e43 : a9 07 __ LDA #$07
2e45 : d0 02 __ BNE $2e49 ; (builddop_op.s29 + 0)
.s27:
2e47 : a9 0a __ LDA #$0a
.s29:
2e49 : 85 1c __ STA ACCU + 1 
2e4b : a5 0e __ LDA P1 ; (op + 0)
2e4d : 29 03 __ AND #$03
2e4f : a8 __ __ TAY
2e50 : a5 0e __ LDA P1 ; (op + 0)
2e52 : 29 04 __ AND #$04
2e54 : f0 03 __ BEQ $2e59 ; (builddop_op.s5 + 0)
2e56 : 4c eb 2e JMP $2eeb ; (builddop_op.s18 + 0)
.s5:
2e59 : a5 0e __ LDA P1 ; (op + 0)
2e5b : 29 08 __ AND #$08
2e5d : d0 13 __ BNE $2e72 ; (builddop_op.s15 + 0)
.s6:
2e5f : a9 a5 __ LDA #$a5
2e61 : a6 0d __ LDX P0 ; (ip + 0)
2e63 : 9d 00 a4 STA $a400,x ; (BLIT_CODE[0] + 0)
2e66 : a5 1c __ LDA ACCU + 1 
.s7:
2e68 : e8 __ __ INX
2e69 : e8 __ __ INX
2e6a : 86 0d __ STX P0 ; (ip + 0)
2e6c : 9d ff a3 STA $a3ff,x 
2e6f : 4c 82 2e JMP $2e82 ; (builddop_op.s16 + 0)
.s15:
2e72 : a5 0e __ LDA P1 ; (op + 0)
2e74 : 0a __ __ ASL
2e75 : 10 0b __ BPL $2e82 ; (builddop_op.s16 + 0)
.s17:
2e77 : a9 49 __ LDA #$49
2e79 : a6 0d __ LDX P0 ; (ip + 0)
2e7b : 9d 00 a4 STA $a400,x ; (BLIT_CODE[0] + 0)
2e7e : a9 ff __ LDA #$ff
2e80 : d0 e6 __ BNE $2e68 ; (builddop_op.s7 + 0)
.s16:
2e82 : 98 __ __ TYA
2e83 : f0 13 __ BEQ $2e98 ; (builddop_op.s8 + 0)
.s14:
2e85 : a5 1c __ LDA ACCU + 1 
2e87 : a6 0d __ LDX P0 ; (ip + 0)
2e89 : e8 __ __ INX
2e8a : e8 __ __ INX
2e8b : 86 0d __ STX P0 ; (ip + 0)
2e8d : 9d ff a3 STA $a3ff,x 
2e90 : b9 ab 81 LDA $81ab,y ; (blitops_op[0] + 0)
2e93 : 09 04 __ ORA #$04
2e95 : 9d fe a3 STA $a3fe,x 
.s8:
2e98 : a5 0f __ LDA P2 ; (mask + 0)
2e9a : f0 3f __ BEQ $2edb ; (builddop_op.s9 + 0)
.s10:
2e9c : a9 85 __ LDA #$85
2e9e : a4 0d __ LDY P0 ; (ip + 0)
2ea0 : 99 00 a4 STA $a400,y ; (BLIT_CODE[0] + 0)
2ea3 : a9 09 __ LDA #$09
2ea5 : 99 01 a4 STA $a401,y ; (BLIT_CODE[0] + 1)
2ea8 : 98 __ __ TYA
2ea9 : 18 __ __ CLC
2eaa : 69 08 __ ADC #$08
2eac : 85 0d __ STA P0 ; (ip + 0)
2eae : a5 0e __ LDA P1 ; (op + 0)
2eb0 : 29 10 __ AND #$10
2eb2 : f0 09 __ BEQ $2ebd ; (builddop_op.s11 + 0)
.s13:
2eb4 : a9 45 __ LDA #$45
2eb6 : 99 02 a4 STA $a402,y ; (BLIT_CODE[0] + 2)
2eb9 : a9 0a __ LDA #$0a
2ebb : d0 07 __ BNE $2ec4 ; (builddop_op.s12 + 0)
.s11:
2ebd : a9 51 __ LDA #$51
2ebf : 99 02 a4 STA $a402,y ; (BLIT_CODE[0] + 2)
2ec2 : a9 05 __ LDA #$05
.s12:
2ec4 : 99 03 a4 STA $a403,y ; (BLIT_CODE[0] + 3)
2ec7 : a9 29 __ LDA #$29
2ec9 : 99 04 a4 STA $a404,y ; (BLIT_CODE[0] + 4)
2ecc : a5 0f __ LDA P2 ; (mask + 0)
2ece : 99 05 a4 STA $a405,y ; (BLIT_CODE[0] + 5)
2ed1 : a9 45 __ LDA #$45
2ed3 : 99 06 a4 STA $a406,y ; (BLIT_CODE[0] + 6)
2ed6 : a9 09 __ LDA #$09
2ed8 : 99 07 a4 STA $a407,y ; (BLIT_CODE[0] + 7)
.s9:
2edb : a9 91 __ LDA #$91
2edd : a6 0d __ LDX P0 ; (ip + 0)
2edf : 9d 00 a4 STA $a400,x ; (BLIT_CODE[0] + 0)
2ee2 : a9 05 __ LDA #$05
2ee4 : 9d 01 a4 STA $a401,x ; (BLIT_CODE[0] + 1)
2ee7 : e8 __ __ INX
2ee8 : e8 __ __ INX
2ee9 : 8a __ __ TXA
.s3:
2eea : 60 __ __ RTS
.s18:
2eeb : 98 __ __ TYA
2eec : d0 04 __ BNE $2ef2 ; (builddop_op.s20 + 0)
.s19:
2eee : a5 0f __ LDA P2 ; (mask + 0)
2ef0 : d0 16 __ BNE $2f08 ; (builddop_op.s23 + 0)
.s20:
2ef2 : a5 0e __ LDA P1 ; (op + 0)
2ef4 : 29 40 __ AND #$40
2ef6 : f0 02 __ BEQ $2efa ; (builddop_op.s21 + 0)
.s22:
2ef8 : a9 ff __ LDA #$ff
.s21:
2efa : 85 1b __ STA ACCU + 0 
2efc : a9 a9 __ LDA #$a9
2efe : a6 0d __ LDX P0 ; (ip + 0)
2f00 : 9d 00 a4 STA $a400,x ; (BLIT_CODE[0] + 0)
2f03 : a5 1b __ LDA ACCU + 0 
2f05 : 4c 68 2e JMP $2e68 ; (builddop_op.s7 + 0)
.s23:
2f08 : a9 b1 __ LDA #$b1
2f0a : a4 0d __ LDY P0 ; (ip + 0)
2f0c : 99 00 a4 STA $a400,y ; (BLIT_CODE[0] + 0)
2f0f : a9 05 __ LDA #$05
2f11 : 99 01 a4 STA $a401,y ; (BLIT_CODE[0] + 1)
2f14 : 06 0e __ ASL P1 ; (op + 0)
2f16 : 30 0a __ BMI $2f22 ; (builddop_op.s26 + 0)
.s24:
2f18 : a9 29 __ LDA #$29
2f1a : 99 02 a4 STA $a402,y ; (BLIT_CODE[0] + 2)
2f1d : a5 0f __ LDA P2 ; (mask + 0)
2f1f : 4c 2b 2f JMP $2f2b ; (builddop_op.s25 + 0)
.s26:
2f22 : a9 09 __ LDA #$09
2f24 : 99 02 a4 STA $a402,y ; (BLIT_CODE[0] + 2)
2f27 : a5 0f __ LDA P2 ; (mask + 0)
2f29 : 49 ff __ EOR #$ff
.s25:
2f2b : 99 03 a4 STA $a403,y ; (BLIT_CODE[0] + 3)
2f2e : a9 91 __ LDA #$91
2f30 : 99 04 a4 STA $a404,y ; (BLIT_CODE[0] + 4)
2f33 : a9 05 __ LDA #$05
2f35 : 99 05 a4 STA $a405,y ; (BLIT_CODE[0] + 5)
2f38 : 98 __ __ TYA
2f39 : 18 __ __ CLC
2f3a : 69 06 __ ADC #$06
2f3c : 60 __ __ RTS
--------------------------------------------------------------------
draw_message: ; draw_message(u8)->void
; 234, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s1:
2f3d : a2 04 __ LDX #$04
2f3f : b5 53 __ LDA T1 + 0,x 
2f41 : 9d cd bf STA $bfcd,x ; (draw_message@stack + 0)
2f44 : ca __ __ DEX
2f45 : 10 f8 __ BPL $2f3f ; (draw_message.s1 + 2)
.s4:
2f47 : ad f0 bf LDA $bff0 ; (sstack + 6)
2f4a : 0a __ __ ASL
2f4b : aa __ __ TAX
2f4c : bd af 81 LDA $81af,x ; (step_msg[0] + 0)
2f4f : 85 56 __ STA T3 + 0 
2f51 : 85 0d __ STA P0 
2f53 : bd b0 81 LDA $81b0,x ; (step_msg[0] + 1)
2f56 : 85 57 __ STA T3 + 1 
2f58 : 85 0e __ STA P1 
2f5a : 20 e9 10 JSR $10e9 ; (strlen.s4 + 0)
2f5d : a9 00 __ LDA #$00
2f5f : 85 53 __ STA T1 + 0 
2f61 : 85 54 __ STA T1 + 1 
2f63 : a5 1b __ LDA ACCU + 0 
2f65 : f0 1b __ BEQ $2f82 ; (draw_message.s5 + 0)
.s6:
2f67 : a0 00 __ LDY #$00
.l7:
2f69 : b1 56 __ LDA (T3 + 0),y 
2f6b : 38 __ __ SEC
2f6c : e9 20 __ SBC #$20
2f6e : aa __ __ TAX
2f6f : bd 2f 82 LDA $822f,x ; (TinyFont[0] + 96)
2f72 : 4a __ __ LSR
2f73 : 4a __ __ LSR
2f74 : 38 __ __ SEC
2f75 : 65 53 __ ADC T1 + 0 
2f77 : 85 53 __ STA T1 + 0 
2f79 : 90 02 __ BCC $2f7d ; (draw_message.s9 + 0)
.s8:
2f7b : e6 54 __ INC T1 + 1 
.s9:
2f7d : c8 __ __ INY
2f7e : c4 1b __ CPY ACCU + 0 
2f80 : 90 e7 __ BCC $2f69 ; (draw_message.l7 + 0)
.s5:
2f82 : a5 0d __ LDA P0 
2f84 : 85 0e __ STA P1 
2f86 : a5 57 __ LDA T3 + 1 
2f88 : 85 0f __ STA P2 
2f8a : a5 1b __ LDA ACCU + 0 
2f8c : 85 10 __ STA P3 
2f8e : 38 __ __ SEC
2f8f : a9 40 __ LDA #$40
2f91 : e5 53 __ SBC T1 + 0 
2f93 : a8 __ __ TAY
2f94 : a9 01 __ LDA #$01
2f96 : e5 54 __ SBC T1 + 1 
2f98 : aa __ __ TAX
2f99 : 0a __ __ ASL
2f9a : 98 __ __ TYA
2f9b : 69 00 __ ADC #$00
2f9d : 85 53 __ STA T1 + 0 
2f9f : 8a __ __ TXA
2fa0 : 69 00 __ ADC #$00
2fa2 : c9 80 __ CMP #$80
2fa4 : 6a __ __ ROR
2fa5 : 66 53 __ ROR T1 + 0 
2fa7 : 85 54 __ STA T1 + 1 
2fa9 : a5 53 __ LDA T1 + 0 
2fab : 29 07 __ AND #$07
2fad : 85 55 __ STA T2 + 0 
2faf : 85 0d __ STA P0 
2fb1 : 20 9c 31 JSR $319c ; (bmu_text.s4 + 0)
2fb4 : a5 53 __ LDA T1 + 0 
2fb6 : 85 10 __ STA P3 
2fb8 : a5 54 __ LDA T1 + 1 
2fba : 85 11 __ STA P4 
2fbc : a9 00 __ LDA #$00
2fbe : 85 13 __ STA P6 
2fc0 : 85 17 __ STA P10 
2fc2 : 8d ea bf STA $bfea ; (sstack + 0)
2fc5 : 8d eb bf STA $bfeb ; (sstack + 1)
2fc8 : 8d ef bf STA $bfef ; (sstack + 5)
2fcb : a5 55 __ LDA T2 + 0 
2fcd : 85 16 __ STA P9 
2fcf : a9 a2 __ LDA #$a2
2fd1 : 85 12 __ STA P5 
2fd3 : a5 1b __ LDA ACCU + 0 
2fd5 : 8d ec bf STA $bfec ; (sstack + 2)
2fd8 : a5 1c __ LDA ACCU + 1 
2fda : 8d ed bf STA $bfed ; (sstack + 3)
2fdd : a9 08 __ LDA #$08
2fdf : 85 18 __ STA P11 
2fe1 : 8d ee bf STA $bfee ; (sstack + 4)
2fe4 : a9 00 __ LDA #$00
2fe6 : 85 14 __ STA P7 
2fe8 : a9 84 __ LDA #$84
2fea : 85 15 __ STA P8 
2fec : 20 88 26 JSR $2688 ; (bmu_bitblit.s1 + 0)
.s3:
2fef : a2 04 __ LDX #$04
2ff1 : bd cd bf LDA $bfcd,x ; (draw_message@stack + 0)
2ff4 : 95 53 __ STA T1 + 0,x 
2ff6 : ca __ __ DEX
2ff7 : 10 f8 __ BPL $2ff1 ; (draw_message.s3 + 2)
2ff9 : 60 __ __ RTS
--------------------------------------------------------------------
2ffa : __ __ __ BYT 53 74 61 6e 64 61 72 64 20 31 20 4d 48 7a 20 43 : Standard 1 MHz C
300a : __ __ __ BYT 36 34 20 73 70 65 65 64 00                      : 64 speed.
--------------------------------------------------------------------
3013 : __ __ __ BYT 54 75 72 62 6f 20 65 6e 67 61 67 65 64 3a 20 32 : Turbo engaged: 2
3023 : __ __ __ BYT 20 4d 48 7a 00                                  :  MHz.
--------------------------------------------------------------------
3028 : __ __ __ BYT 33 20 4d 48 7a 20 2d 20 77 61 72 6d 69 6e 67 20 : 3 MHz - warming 
3038 : __ __ __ BYT 75 70 00                                        : up.
--------------------------------------------------------------------
303b : __ __ __ BYT 34 20 4d 48 7a 20 2d 20 73 6d 6f 6f 74 68 20 61 : 4 MHz - smooth a
304b : __ __ __ BYT 6c 72 65 61 64 79 21 00                         : lready!.
--------------------------------------------------------------------
3053 : __ __ __ BYT 36 20 4d 48 7a 20 2d 20 74 68 69 73 20 66 65 65 : 6 MHz - this fee
3063 : __ __ __ BYT 6c 73 20 64 69 66 66 65 72 65 6e 74 00          : ls different.
--------------------------------------------------------------------
3070 : __ __ __ BYT 38 20 4d 48 7a 20 2d 20 74 68 69 6e 67 73 20 61 : 8 MHz - things a
3080 : __ __ __ BYT 72 65 20 6d 6f 76 69 6e 67 00                   : re moving.
--------------------------------------------------------------------
308a : __ __ __ BYT 31 32 20 4d 48 7a 20 2d 20 70 69 63 6b 69 6e 67 : 12 MHz - picking
309a : __ __ __ BYT 20 75 70 20 73 70 65 65 64 00                   :  up speed.
--------------------------------------------------------------------
30a4 : __ __ __ BYT 31 36 20 4d 48 7a 20 2d 20 6e 6f 74 69 63 65 61 : 16 MHz - noticea
30b4 : __ __ __ BYT 62 6c 79 20 66 61 73 74 00                      : bly fast.
--------------------------------------------------------------------
30bd : __ __ __ BYT 32 30 20 4d 48 7a 20 2d 20 77 68 61 74 20 69 73 : 20 MHz - what is
30cd : __ __ __ BYT 20 68 61 70 70 65 6e 69 6e 67 3f 00             :  happening?.
--------------------------------------------------------------------
30d9 : __ __ __ BYT 32 34 20 4d 48 7a 20 2d 20 65 79 65 73 20 63 61 : 24 MHz - eyes ca
30e9 : __ __ __ BYT 6e 20 62 61 72 65 6c 79 20 66 6f 6c 6c 6f 77 00 : n barely follow.
--------------------------------------------------------------------
30f9 : __ __ __ BYT 32 38 20 4d 48 7a 20 2d 20 74 68 69 73 20 69 73 : 28 MHz - this is
3109 : __ __ __ BYT 20 69 6e 63 72 65 64 69 62 6c 65 21 00          :  incredible!.
--------------------------------------------------------------------
3116 : __ __ __ BYT 33 32 20 4d 48 7a 20 2d 20 74 68 65 20 6d 61 63 : 32 MHz - the mac
3126 : __ __ __ BYT 68 69 6e 65 20 73 63 72 65 61 6d 73 00          : hine screams.
--------------------------------------------------------------------
3133 : __ __ __ BYT 33 36 20 4d 48 7a 20 2d 20 62 65 79 6f 6e 64 20 : 36 MHz - beyond 
3143 : __ __ __ BYT 69 6d 61 67 69 6e 61 74 69 6f 6e 00             : imagination.
--------------------------------------------------------------------
314f : __ __ __ BYT 34 30 20 4d 48 7a 20 2d 20 68 6f 6c 64 20 6f 6e : 40 MHz - hold on
315f : __ __ __ BYT 20 74 69 67 68 74 21 00                         :  tight!.
--------------------------------------------------------------------
3167 : __ __ __ BYT 34 38 20 4d 48 7a 20 2d 20 6d 61 78 69 6d 75 6d : 48 MHz - maximum
3177 : __ __ __ BYT 20 6f 76 65 72 64 72 69 76 65 21 00             :  overdrive!.
--------------------------------------------------------------------
3183 : __ __ __ BYT 36 34 20 4d 48 7a 20 20 55 4c 54 49 4d 41 54 45 : 64 MHz  ULTIMATE
3193 : __ __ __ BYT 20 53 50 45 45 44 21 21 00                      :  SPEED!!.
--------------------------------------------------------------------
bmu_text: ; bmu_text(const struct Bitmap*,u8,const u8*,u8)->i16
; 151, "/home/xahmol/oscar64/include/gfx/bitmap.h"
.s4:
319c : a9 00 __ LDA #$00
319e : 8d ce 8a STA $8ace ; (tworks[0] + 0)
31a1 : 8d cf 8a STA $8acf ; (tworks[0] + 1)
31a4 : 8d d0 8a STA $8ad0 ; (tworks[0] + 2)
31a7 : 8d d1 8a STA $8ad1 ; (tworks[0] + 3)
31aa : 8d d2 8a STA $8ad2 ; (tworks[0] + 4)
31ad : 8d d3 8a STA $8ad3 ; (tworks[0] + 5)
31b0 : 8d d4 8a STA $8ad4 ; (tworks[0] + 6)
31b3 : 8d d5 8a STA $8ad5 ; (tworks[0] + 7)
31b6 : 85 1b __ STA ACCU + 0 
31b8 : 85 1c __ STA ACCU + 1 
31ba : ad 00 84 LDA $8400 ; (tbitmap.data + 0)
31bd : 85 43 __ STA T1 + 0 
31bf : ad 01 84 LDA $8401 ; (tbitmap.data + 1)
31c2 : 85 44 __ STA T1 + 1 
31c4 : a5 10 __ LDA P3 ; (len + 0)
31c6 : d0 03 __ BNE $31cb ; (bmu_text.s7 + 0)
31c8 : 4c d8 32 JMP $32d8 ; (bmu_text.s5 + 0)
.s7:
31cb : a0 00 __ LDY #$00
.l8:
31cd : 84 1d __ STY ACCU + 2 
31cf : b1 0e __ LDA (P1),y ; (str + 0)
31d1 : 38 __ __ SEC
31d2 : e9 20 __ SBC #$20
31d4 : aa __ __ TAX
31d5 : 18 __ __ CLC
31d6 : a9 8f __ LDA #$8f
31d8 : 7d cf 81 ADC $81cf,x ; (TinyFont[0] + 0)
31db : 85 45 __ STA T6 + 0 
31dd : bd 2f 82 LDA $822f,x ; (TinyFont[0] + 96)
31e0 : 29 03 __ AND #$03
31e2 : 69 82 __ ADC #$82
31e4 : 85 46 __ STA T6 + 1 
31e6 : bd 2f 82 LDA $822f,x ; (TinyFont[0] + 96)
31e9 : 4a __ __ LSR
31ea : 4a __ __ LSR
31eb : 85 1e __ STA ACCU + 3 
31ed : 38 __ __ SEC
31ee : 65 1b __ ADC ACCU + 0 
31f0 : 85 1b __ STA ACCU + 0 
31f2 : 90 02 __ BCC $31f6 ; (bmu_text.s19 + 0)
.s18:
31f4 : e6 1c __ INC ACCU + 1 
.s19:
31f6 : a9 00 __ LDA #$00
31f8 : 85 47 __ STA T7 + 0 
31fa : a5 1e __ LDA ACCU + 3 
31fc : f0 73 __ BEQ $3271 ; (bmu_text.s9 + 0)
.s16:
31fe : a6 0d __ LDX P0 ; (lx + 0)
3200 : a0 00 __ LDY #$00
.l12:
3202 : b1 45 __ LDA (T6 + 0),y 
3204 : 0a __ __ ASL
3205 : 2e ce 8a ROL $8ace ; (tworks[0] + 0)
3208 : 0a __ __ ASL
3209 : 2e cf 8a ROL $8acf ; (tworks[0] + 1)
320c : 0a __ __ ASL
320d : 2e d0 8a ROL $8ad0 ; (tworks[0] + 2)
3210 : 0a __ __ ASL
3211 : 2e d1 8a ROL $8ad1 ; (tworks[0] + 3)
3214 : 0a __ __ ASL
3215 : 2e d2 8a ROL $8ad2 ; (tworks[0] + 4)
3218 : 0a __ __ ASL
3219 : 2e d3 8a ROL $8ad3 ; (tworks[0] + 5)
321c : 0a __ __ ASL
321d : 2e d4 8a ROL $8ad4 ; (tworks[0] + 6)
3220 : 0a __ __ ASL
3221 : 2e d5 8a ROL $8ad5 ; (tworks[0] + 7)
3224 : e8 __ __ INX
3225 : e0 08 __ CPX #$08
3227 : d0 3e __ BNE $3267 ; (bmu_text.s13 + 0)
.s14:
3229 : ad ce 8a LDA $8ace ; (tworks[0] + 0)
322c : a0 00 __ LDY #$00
322e : 91 43 __ STA (T1 + 0),y 
3230 : ad cf 8a LDA $8acf ; (tworks[0] + 1)
3233 : c8 __ __ INY
3234 : 91 43 __ STA (T1 + 0),y 
3236 : ad d0 8a LDA $8ad0 ; (tworks[0] + 2)
3239 : c8 __ __ INY
323a : 91 43 __ STA (T1 + 0),y 
323c : ad d1 8a LDA $8ad1 ; (tworks[0] + 3)
323f : c8 __ __ INY
3240 : 91 43 __ STA (T1 + 0),y 
3242 : ad d2 8a LDA $8ad2 ; (tworks[0] + 4)
3245 : c8 __ __ INY
3246 : 91 43 __ STA (T1 + 0),y 
3248 : ad d3 8a LDA $8ad3 ; (tworks[0] + 5)
324b : c8 __ __ INY
324c : 91 43 __ STA (T1 + 0),y 
324e : ad d4 8a LDA $8ad4 ; (tworks[0] + 6)
3251 : c8 __ __ INY
3252 : 91 43 __ STA (T1 + 0),y 
3254 : ad d5 8a LDA $8ad5 ; (tworks[0] + 7)
3257 : c8 __ __ INY
3258 : 91 43 __ STA (T1 + 0),y 
325a : 18 __ __ CLC
325b : a5 43 __ LDA T1 + 0 
325d : 69 08 __ ADC #$08
325f : 85 43 __ STA T1 + 0 
3261 : 90 02 __ BCC $3265 ; (bmu_text.s21 + 0)
.s20:
3263 : e6 44 __ INC T1 + 1 
.s21:
3265 : a2 00 __ LDX #$00
.s13:
3267 : e6 47 __ INC T7 + 0 
3269 : a4 47 __ LDY T7 + 0 
326b : c4 1e __ CPY ACCU + 3 
326d : 90 93 __ BCC $3202 ; (bmu_text.l12 + 0)
.s17:
326f : 86 0d __ STX P0 ; (lx + 0)
.s9:
3271 : 0e ce 8a ASL $8ace ; (tworks[0] + 0)
3274 : 0e cf 8a ASL $8acf ; (tworks[0] + 1)
3277 : 0e d0 8a ASL $8ad0 ; (tworks[0] + 2)
327a : 0e d1 8a ASL $8ad1 ; (tworks[0] + 3)
327d : 0e d2 8a ASL $8ad2 ; (tworks[0] + 4)
3280 : 0e d3 8a ASL $8ad3 ; (tworks[0] + 5)
3283 : 0e d4 8a ASL $8ad4 ; (tworks[0] + 6)
3286 : 0e d5 8a ASL $8ad5 ; (tworks[0] + 7)
3289 : e6 0d __ INC P0 ; (lx + 0)
328b : a5 0d __ LDA P0 ; (lx + 0)
328d : c9 08 __ CMP #$08
328f : d0 3d __ BNE $32ce ; (bmu_text.s10 + 0)
.s11:
3291 : ad ce 8a LDA $8ace ; (tworks[0] + 0)
3294 : a0 00 __ LDY #$00
3296 : 84 0d __ STY P0 ; (lx + 0)
3298 : 91 43 __ STA (T1 + 0),y 
329a : ad cf 8a LDA $8acf ; (tworks[0] + 1)
329d : c8 __ __ INY
329e : 91 43 __ STA (T1 + 0),y 
32a0 : ad d0 8a LDA $8ad0 ; (tworks[0] + 2)
32a3 : c8 __ __ INY
32a4 : 91 43 __ STA (T1 + 0),y 
32a6 : ad d1 8a LDA $8ad1 ; (tworks[0] + 3)
32a9 : c8 __ __ INY
32aa : 91 43 __ STA (T1 + 0),y 
32ac : ad d2 8a LDA $8ad2 ; (tworks[0] + 4)
32af : c8 __ __ INY
32b0 : 91 43 __ STA (T1 + 0),y 
32b2 : ad d3 8a LDA $8ad3 ; (tworks[0] + 5)
32b5 : c8 __ __ INY
32b6 : 91 43 __ STA (T1 + 0),y 
32b8 : ad d4 8a LDA $8ad4 ; (tworks[0] + 6)
32bb : c8 __ __ INY
32bc : 91 43 __ STA (T1 + 0),y 
32be : ad d5 8a LDA $8ad5 ; (tworks[0] + 7)
32c1 : c8 __ __ INY
32c2 : 91 43 __ STA (T1 + 0),y 
32c4 : a5 43 __ LDA T1 + 0 
32c6 : 69 07 __ ADC #$07
32c8 : 85 43 __ STA T1 + 0 
32ca : 90 02 __ BCC $32ce ; (bmu_text.s10 + 0)
.s22:
32cc : e6 44 __ INC T1 + 1 
.s10:
32ce : a4 1d __ LDY ACCU + 2 
32d0 : c8 __ __ INY
32d1 : c4 10 __ CPY P3 ; (len + 0)
32d3 : b0 03 __ BCS $32d8 ; (bmu_text.s5 + 0)
32d5 : 4c cd 31 JMP $31cd ; (bmu_text.l8 + 0)
.s5:
32d8 : a6 0d __ LDX P0 ; (lx + 0)
32da : e0 08 __ CPX #$08
32dc : b0 1d __ BCS $32fb ; (bmu_text.s6 + 0)
.l15:
32de : 0e ce 8a ASL $8ace ; (tworks[0] + 0)
32e1 : 0e cf 8a ASL $8acf ; (tworks[0] + 1)
32e4 : 0e d0 8a ASL $8ad0 ; (tworks[0] + 2)
32e7 : 0e d1 8a ASL $8ad1 ; (tworks[0] + 3)
32ea : 0e d2 8a ASL $8ad2 ; (tworks[0] + 4)
32ed : 0e d3 8a ASL $8ad3 ; (tworks[0] + 5)
32f0 : 0e d4 8a ASL $8ad4 ; (tworks[0] + 6)
32f3 : 0e d5 8a ASL $8ad5 ; (tworks[0] + 7)
32f6 : e8 __ __ INX
32f7 : e0 08 __ CPX #$08
32f9 : 90 e3 __ BCC $32de ; (bmu_text.l15 + 0)
.s6:
32fb : ad ce 8a LDA $8ace ; (tworks[0] + 0)
32fe : a0 00 __ LDY #$00
3300 : 91 43 __ STA (T1 + 0),y 
3302 : ad cf 8a LDA $8acf ; (tworks[0] + 1)
3305 : c8 __ __ INY
3306 : 91 43 __ STA (T1 + 0),y 
3308 : ad d0 8a LDA $8ad0 ; (tworks[0] + 2)
330b : c8 __ __ INY
330c : 91 43 __ STA (T1 + 0),y 
330e : ad d1 8a LDA $8ad1 ; (tworks[0] + 3)
3311 : c8 __ __ INY
3312 : 91 43 __ STA (T1 + 0),y 
3314 : ad d2 8a LDA $8ad2 ; (tworks[0] + 4)
3317 : c8 __ __ INY
3318 : 91 43 __ STA (T1 + 0),y 
331a : ad d3 8a LDA $8ad3 ; (tworks[0] + 5)
331d : c8 __ __ INY
331e : 91 43 __ STA (T1 + 0),y 
3320 : ad d4 8a LDA $8ad4 ; (tworks[0] + 6)
3323 : c8 __ __ INY
3324 : 91 43 __ STA (T1 + 0),y 
3326 : ad d5 8a LDA $8ad5 ; (tworks[0] + 7)
3329 : c8 __ __ INY
332a : 91 43 __ STA (T1 + 0),y 
.s3:
332c : 60 __ __ RTS
--------------------------------------------------------------------
draw_gear: ; draw_gear(i16,i16,u8,u8,u8,u8,u8,u8,u8,u8)->void
;  88, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s1:
332d : a2 20 __ LDX #$20
332f : b5 53 __ LDA T0 + 0,x 
3331 : 9d b0 bf STA $bfb0,x ; (draw_gear@stack + 0)
3334 : ca __ __ DEX
3335 : 10 f8 __ BPL $332f ; (draw_gear.s1 + 2)
.s4:
3337 : ad fd bf LDA $bffd ; (sstack + 19)
333a : 85 5d __ STA T5 + 0 
333c : ad fc bf LDA $bffc ; (sstack + 18)
333f : 85 5e __ STA T6 + 0 
3341 : ad f9 bf LDA $bff9 ; (sstack + 15)
3344 : 85 5f __ STA T7 + 0 
3346 : ad fb bf LDA $bffb ; (sstack + 17)
3349 : 85 60 __ STA T8 + 0 
334b : 4a __ __ LSR
334c : 85 61 __ STA T9 + 0 
334e : a9 00 __ LDA #$00
3350 : 85 62 __ STA T10 + 0 
3352 : 85 63 __ STA T11 + 0 
3354 : 85 64 __ STA T11 + 1 
3356 : 85 65 __ STA T12 + 0 
3358 : 85 66 __ STA T12 + 1 
335a : 85 53 __ STA T0 + 0 
335c : 85 54 __ STA T0 + 1 
335e : 85 55 __ STA T1 + 0 
3360 : 85 56 __ STA T1 + 1 
3362 : ae ff bf LDX $bfff ; (sstack + 21)
3365 : 86 71 __ STX T20 + 0 
3367 : ae fe bf LDX $bffe ; (sstack + 20)
336a : 86 72 __ STX T21 + 0 
336c : ae fa bf LDX $bffa ; (sstack + 16)
336f : 86 73 __ STX T22 + 0 
3371 : ae f7 bf LDX $bff7 ; (sstack + 13)
3374 : 86 67 __ STX T13 + 0 
.l5:
3376 : 85 1b __ STA ACCU + 0 
3378 : a9 00 __ LDA #$00
337a : 85 1c __ STA ACCU + 1 
337c : a5 60 __ LDA T8 + 0 
337e : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
3381 : 18 __ __ CLC
3382 : a5 1b __ LDA ACCU + 0 
3384 : 65 5f __ ADC T7 + 0 
3386 : 29 3f __ AND #$3f
3388 : 85 68 __ STA T14 + 0 
338a : 18 __ __ CLC
338b : 69 10 __ ADC #$10
338d : 29 3f __ AND #$3f
338f : aa __ __ TAX
3390 : bd 08 84 LDA $8408,x ; (sin64[0] + 0)
3393 : 85 57 __ STA T2 + 0 
3395 : 0a __ __ ASL
3396 : a9 00 __ LDA #$00
3398 : 85 04 __ STA WORK + 1 
339a : 69 ff __ ADC #$ff
339c : 49 ff __ EOR #$ff
339e : 85 58 __ STA T2 + 1 
33a0 : a5 57 __ LDA T2 + 0 
33a2 : 0a __ __ ASL
33a3 : 85 1b __ STA ACCU + 0 
33a5 : a5 58 __ LDA T2 + 1 
33a7 : 2a __ __ ROL
33a8 : 06 1b __ ASL ACCU + 0 
33aa : 2a __ __ ROL
33ab : 85 1c __ STA ACCU + 1 
33ad : 20 f0 7a JSR $7af0 ; (divs16@proxy + 0)
33b0 : a5 1b __ LDA ACCU + 0 
33b2 : 85 69 __ STA T15 + 0 
33b4 : a5 1c __ LDA ACCU + 1 
33b6 : 85 6a __ STA T15 + 1 
33b8 : a6 68 __ LDX T14 + 0 
33ba : bd 08 84 LDA $8408,x ; (sin64[0] + 0)
33bd : 85 59 __ STA T3 + 0 
33bf : 85 1b __ STA ACCU + 0 
33c1 : 29 80 __ AND #$80
33c3 : 10 02 __ BPL $33c7 ; (draw_gear.l5 + 81)
33c5 : a9 ff __ LDA #$ff
33c7 : 85 5a __ STA T3 + 1 
33c9 : 85 1c __ STA ACCU + 1 
33cb : a5 5d __ LDA T5 + 0 
33cd : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
33d0 : 20 3e 80 JSR $803e ; (divs16@proxy + 0)
33d3 : 18 __ __ CLC
33d4 : a5 1b __ LDA ACCU + 0 
33d6 : 69 58 __ ADC #$58
33d8 : 85 6b __ STA T16 + 0 
33da : a5 1c __ LDA ACCU + 1 
33dc : 69 00 __ ADC #$00
33de : 85 6c __ STA T16 + 1 
33e0 : a5 57 __ LDA T2 + 0 
33e2 : 85 1b __ STA ACCU + 0 
33e4 : a5 58 __ LDA T2 + 1 
33e6 : 85 1c __ STA ACCU + 1 
33e8 : a5 5d __ LDA T5 + 0 
33ea : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
33ed : 20 3e 80 JSR $803e ; (divs16@proxy + 0)
33f0 : 18 __ __ CLC
33f1 : a5 1b __ LDA ACCU + 0 
33f3 : 65 67 __ ADC T13 + 0 
33f5 : 85 6d __ STA T17 + 0 
33f7 : a5 1c __ LDA ACCU + 1 
33f9 : 69 00 __ ADC #$00
33fb : 85 6e __ STA T17 + 1 
33fd : a5 59 __ LDA T3 + 0 
33ff : 85 1b __ STA ACCU + 0 
3401 : a5 5a __ LDA T3 + 1 
3403 : 85 1c __ STA ACCU + 1 
3405 : a5 5e __ LDA T6 + 0 
3407 : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
340a : 20 3e 80 JSR $803e ; (divs16@proxy + 0)
340d : 18 __ __ CLC
340e : a5 1b __ LDA ACCU + 0 
3410 : 69 58 __ ADC #$58
3412 : 85 5b __ STA T4 + 0 
3414 : a5 1c __ LDA ACCU + 1 
3416 : 69 00 __ ADC #$00
3418 : 85 5c __ STA T4 + 1 
341a : a5 57 __ LDA T2 + 0 
341c : 85 1b __ STA ACCU + 0 
341e : a5 58 __ LDA T2 + 1 
3420 : 85 1c __ STA ACCU + 1 
3422 : a5 5e __ LDA T6 + 0 
3424 : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
3427 : 20 3e 80 JSR $803e ; (divs16@proxy + 0)
342a : 18 __ __ CLC
342b : a5 1b __ LDA ACCU + 0 
342d : 65 67 __ ADC T13 + 0 
342f : 85 57 __ STA T2 + 0 
3431 : a5 1c __ LDA ACCU + 1 
3433 : 69 00 __ ADC #$00
3435 : 85 58 __ STA T2 + 1 
3437 : 38 __ __ SEC
3438 : a9 00 __ LDA #$00
343a : e5 59 __ SBC T3 + 0 
343c : 85 1b __ STA ACCU + 0 
343e : a9 00 __ LDA #$00
3440 : 85 04 __ STA WORK + 1 
3442 : e5 5a __ SBC T3 + 1 
3444 : 06 1b __ ASL ACCU + 0 
3446 : 2a __ __ ROL
3447 : 06 1b __ ASL ACCU + 0 
3449 : 2a __ __ ROL
344a : 85 1c __ STA ACCU + 1 
344c : 20 f0 7a JSR $7af0 ; (divs16@proxy + 0)
344f : a5 1b __ LDA ACCU + 0 
3451 : 85 59 __ STA T3 + 0 
3453 : a5 1c __ LDA ACCU + 1 
3455 : 85 5a __ STA T3 + 1 
3457 : 05 1b __ ORA ACCU + 0 
3459 : d0 12 __ BNE $346d ; (draw_gear.s6 + 0)
.s12:
345b : 85 59 __ STA T3 + 0 
345d : 85 5a __ STA T3 + 1 
345f : a5 69 __ LDA T15 + 0 
3461 : 05 6a __ ORA T15 + 1 
3463 : d0 08 __ BNE $346d ; (draw_gear.s6 + 0)
.s13:
3465 : a9 01 __ LDA #$01
3467 : 85 69 __ STA T15 + 0 
3469 : a9 00 __ LDA #$00
346b : 85 6a __ STA T15 + 1 
.s6:
346d : a5 62 __ LDA T10 + 0 
346f : d0 1d __ BNE $348e ; (draw_gear.s11 + 0)
.s7:
3471 : 38 __ __ SEC
3472 : a5 5b __ LDA T4 + 0 
3474 : e5 69 __ SBC T15 + 0 
3476 : 85 65 __ STA T12 + 0 
3478 : a5 5c __ LDA T4 + 1 
347a : e5 6a __ SBC T15 + 1 
347c : 85 66 __ STA T12 + 1 
347e : 38 __ __ SEC
347f : a5 57 __ LDA T2 + 0 
3481 : e5 59 __ SBC T3 + 0 
3483 : 85 63 __ STA T11 + 0 
3485 : a5 58 __ LDA T2 + 1 
3487 : e5 5a __ SBC T3 + 1 
3489 : 85 64 __ STA T11 + 1 
348b : 4c dc 34 JMP $34dc ; (draw_gear.s8 + 0)
.s11:
348e : a5 53 __ LDA T0 + 0 
3490 : 8d ee bf STA $bfee ; (sstack + 4)
3493 : a5 54 __ LDA T0 + 1 
3495 : 8d ef bf STA $bfef ; (sstack + 5)
3498 : a5 55 __ LDA T1 + 0 
349a : 8d f0 bf STA $bff0 ; (sstack + 6)
349d : a5 56 __ LDA T1 + 1 
349f : 8d f1 bf STA $bff1 ; (sstack + 7)
34a2 : a9 03 __ LDA #$03
34a4 : 8d f6 bf STA $bff6 ; (sstack + 12)
34a7 : a9 f7 __ LDA #$f7
34a9 : 8d ea bf STA $bfea ; (sstack + 0)
34ac : a9 87 __ LDA #$87
34ae : 8d eb bf STA $bfeb ; (sstack + 1)
34b1 : a9 48 __ LDA #$48
34b3 : 8d ec bf STA $bfec ; (sstack + 2)
34b6 : a9 84 __ LDA #$84
34b8 : 8d ed bf STA $bfed ; (sstack + 3)
34bb : 38 __ __ SEC
34bc : a5 57 __ LDA T2 + 0 
34be : e5 59 __ SBC T3 + 0 
34c0 : 8d f2 bf STA $bff2 ; (sstack + 8)
34c3 : a5 58 __ LDA T2 + 1 
34c5 : e5 5a __ SBC T3 + 1 
34c7 : 8d f3 bf STA $bff3 ; (sstack + 9)
34ca : 38 __ __ SEC
34cb : a5 5b __ LDA T4 + 0 
34cd : e5 69 __ SBC T15 + 0 
34cf : 8d f4 bf STA $bff4 ; (sstack + 10)
34d2 : a5 5c __ LDA T4 + 1 
34d4 : e5 6a __ SBC T15 + 1 
34d6 : 8d f5 bf STA $bff5 ; (sstack + 11)
34d9 : 20 cd 37 JSR $37cd ; (bm_line.s1 + 0)
.s8:
34dc : a9 03 __ LDA #$03
34de : 8d f6 bf STA $bff6 ; (sstack + 12)
34e1 : a9 f7 __ LDA #$f7
34e3 : 8d ea bf STA $bfea ; (sstack + 0)
34e6 : a9 87 __ LDA #$87
34e8 : 8d eb bf STA $bfeb ; (sstack + 1)
34eb : a9 48 __ LDA #$48
34ed : 8d ec bf STA $bfec ; (sstack + 2)
34f0 : a9 84 __ LDA #$84
34f2 : 8d ed bf STA $bfed ; (sstack + 3)
34f5 : 38 __ __ SEC
34f6 : a5 57 __ LDA T2 + 0 
34f8 : e5 59 __ SBC T3 + 0 
34fa : 8d ee bf STA $bfee ; (sstack + 4)
34fd : a5 58 __ LDA T2 + 1 
34ff : e5 5a __ SBC T3 + 1 
3501 : 8d ef bf STA $bfef ; (sstack + 5)
3504 : 38 __ __ SEC
3505 : a5 5b __ LDA T4 + 0 
3507 : e5 69 __ SBC T15 + 0 
3509 : 8d f0 bf STA $bff0 ; (sstack + 6)
350c : a5 5c __ LDA T4 + 1 
350e : e5 6a __ SBC T15 + 1 
3510 : 8d f1 bf STA $bff1 ; (sstack + 7)
3513 : 38 __ __ SEC
3514 : a5 6d __ LDA T17 + 0 
3516 : e5 59 __ SBC T3 + 0 
3518 : 85 53 __ STA T0 + 0 
351a : 8d f2 bf STA $bff2 ; (sstack + 8)
351d : a5 6e __ LDA T17 + 1 
351f : e5 5a __ SBC T3 + 1 
3521 : 85 54 __ STA T0 + 1 
3523 : 8d f3 bf STA $bff3 ; (sstack + 9)
3526 : 38 __ __ SEC
3527 : a5 6b __ LDA T16 + 0 
3529 : e5 69 __ SBC T15 + 0 
352b : 85 6f __ STA T19 + 0 
352d : 8d f4 bf STA $bff4 ; (sstack + 10)
3530 : a5 6c __ LDA T16 + 1 
3532 : e5 6a __ SBC T15 + 1 
3534 : 85 70 __ STA T19 + 1 
3536 : 8d f5 bf STA $bff5 ; (sstack + 11)
3539 : 20 cd 37 JSR $37cd ; (bm_line.s1 + 0)
353c : a9 f7 __ LDA #$f7
353e : 8d ea bf STA $bfea ; (sstack + 0)
3541 : a9 87 __ LDA #$87
3543 : 8d eb bf STA $bfeb ; (sstack + 1)
3546 : a9 48 __ LDA #$48
3548 : 8d ec bf STA $bfec ; (sstack + 2)
354b : a9 84 __ LDA #$84
354d : 8d ed bf STA $bfed ; (sstack + 3)
3550 : a5 53 __ LDA T0 + 0 
3552 : 8d ee bf STA $bfee ; (sstack + 4)
3555 : a5 54 __ LDA T0 + 1 
3557 : 8d ef bf STA $bfef ; (sstack + 5)
355a : a5 6f __ LDA T19 + 0 
355c : 8d f0 bf STA $bff0 ; (sstack + 6)
355f : a5 70 __ LDA T19 + 1 
3561 : 8d f1 bf STA $bff1 ; (sstack + 7)
3564 : a9 03 __ LDA #$03
3566 : 8d f6 bf STA $bff6 ; (sstack + 12)
3569 : 18 __ __ CLC
356a : a5 6d __ LDA T17 + 0 
356c : 65 59 __ ADC T3 + 0 
356e : 85 53 __ STA T0 + 0 
3570 : 8d f2 bf STA $bff2 ; (sstack + 8)
3573 : a5 6e __ LDA T17 + 1 
3575 : 65 5a __ ADC T3 + 1 
3577 : 85 54 __ STA T0 + 1 
3579 : 8d f3 bf STA $bff3 ; (sstack + 9)
357c : 18 __ __ CLC
357d : a5 6b __ LDA T16 + 0 
357f : 65 69 __ ADC T15 + 0 
3581 : 85 6b __ STA T16 + 0 
3583 : 8d f4 bf STA $bff4 ; (sstack + 10)
3586 : a5 6c __ LDA T16 + 1 
3588 : 65 6a __ ADC T15 + 1 
358a : 85 6c __ STA T16 + 1 
358c : 8d f5 bf STA $bff5 ; (sstack + 11)
358f : 20 cd 37 JSR $37cd ; (bm_line.s1 + 0)
3592 : a9 03 __ LDA #$03
3594 : 8d f6 bf STA $bff6 ; (sstack + 12)
3597 : 18 __ __ CLC
3598 : a5 5b __ LDA T4 + 0 
359a : 65 69 __ ADC T15 + 0 
359c : 85 5b __ STA T4 + 0 
359e : 8d f4 bf STA $bff4 ; (sstack + 10)
35a1 : a5 5c __ LDA T4 + 1 
35a3 : 65 6a __ ADC T15 + 1 
35a5 : 85 5c __ STA T4 + 1 
35a7 : 8d f5 bf STA $bff5 ; (sstack + 11)
35aa : 18 __ __ CLC
35ab : a5 57 __ LDA T2 + 0 
35ad : 65 59 __ ADC T3 + 0 
35af : 85 57 __ STA T2 + 0 
35b1 : 8d f2 bf STA $bff2 ; (sstack + 8)
35b4 : a5 58 __ LDA T2 + 1 
35b6 : 65 5a __ ADC T3 + 1 
35b8 : 85 58 __ STA T2 + 1 
35ba : 8d f3 bf STA $bff3 ; (sstack + 9)
35bd : a9 f7 __ LDA #$f7
35bf : 8d ea bf STA $bfea ; (sstack + 0)
35c2 : a9 87 __ LDA #$87
35c4 : 8d eb bf STA $bfeb ; (sstack + 1)
35c7 : a9 48 __ LDA #$48
35c9 : 8d ec bf STA $bfec ; (sstack + 2)
35cc : a9 84 __ LDA #$84
35ce : 8d ed bf STA $bfed ; (sstack + 3)
35d1 : a5 53 __ LDA T0 + 0 
35d3 : 8d ee bf STA $bfee ; (sstack + 4)
35d6 : a5 54 __ LDA T0 + 1 
35d8 : 8d ef bf STA $bfef ; (sstack + 5)
35db : a5 6b __ LDA T16 + 0 
35dd : 8d f0 bf STA $bff0 ; (sstack + 6)
35e0 : a5 6c __ LDA T16 + 1 
35e2 : 8d f1 bf STA $bff1 ; (sstack + 7)
35e5 : 20 cd 37 JSR $37cd ; (bm_line.s1 + 0)
35e8 : a9 f7 __ LDA #$f7
35ea : 8d ea bf STA $bfea ; (sstack + 0)
35ed : a9 87 __ LDA #$87
35ef : 8d eb bf STA $bfeb ; (sstack + 1)
35f2 : a9 48 __ LDA #$48
35f4 : 8d ec bf STA $bfec ; (sstack + 2)
35f7 : a9 84 __ LDA #$84
35f9 : 8d ed bf STA $bfed ; (sstack + 3)
35fc : a5 57 __ LDA T2 + 0 
35fe : 8d ee bf STA $bfee ; (sstack + 4)
3601 : a5 58 __ LDA T2 + 1 
3603 : 8d ef bf STA $bfef ; (sstack + 5)
3606 : a5 5b __ LDA T4 + 0 
3608 : 8d f0 bf STA $bff0 ; (sstack + 6)
360b : a5 5c __ LDA T4 + 1 
360d : 8d f1 bf STA $bff1 ; (sstack + 7)
3610 : a9 03 __ LDA #$03
3612 : 8d f6 bf STA $bff6 ; (sstack + 12)
3615 : 18 __ __ CLC
3616 : a5 61 __ LDA T9 + 0 
3618 : 65 68 __ ADC T14 + 0 
361a : 29 3f __ AND #$3f
361c : 85 53 __ STA T0 + 0 
361e : 18 __ __ CLC
361f : 69 10 __ ADC #$10
3621 : 29 3f __ AND #$3f
3623 : aa __ __ TAX
3624 : bd 08 84 LDA $8408,x ; (sin64[0] + 0)
3627 : 85 1b __ STA ACCU + 0 
3629 : 29 80 __ AND #$80
362b : 10 02 __ BPL $362f ; (draw_gear.s8 + 339)
362d : a9 ff __ LDA #$ff
362f : 85 1c __ STA ACCU + 1 
3631 : a5 5e __ LDA T6 + 0 
3633 : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
3636 : 20 3e 80 JSR $803e ; (divs16@proxy + 0)
3639 : 18 __ __ CLC
363a : a5 1b __ LDA ACCU + 0 
363c : 65 67 __ ADC T13 + 0 
363e : 85 57 __ STA T2 + 0 
3640 : 8d f2 bf STA $bff2 ; (sstack + 8)
3643 : a5 1c __ LDA ACCU + 1 
3645 : 69 00 __ ADC #$00
3647 : 85 58 __ STA T2 + 1 
3649 : 8d f3 bf STA $bff3 ; (sstack + 9)
364c : a6 53 __ LDX T0 + 0 
364e : bd 08 84 LDA $8408,x ; (sin64[0] + 0)
3651 : 85 1b __ STA ACCU + 0 
3653 : 29 80 __ AND #$80
3655 : 10 02 __ BPL $3659 ; (draw_gear.s8 + 381)
3657 : a9 ff __ LDA #$ff
3659 : 85 1c __ STA ACCU + 1 
365b : a5 5e __ LDA T6 + 0 
365d : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
3660 : 20 3e 80 JSR $803e ; (divs16@proxy + 0)
3663 : 18 __ __ CLC
3664 : a5 1b __ LDA ACCU + 0 
3666 : 69 58 __ ADC #$58
3668 : 85 59 __ STA T3 + 0 
366a : 8d f4 bf STA $bff4 ; (sstack + 10)
366d : a5 1c __ LDA ACCU + 1 
366f : 69 00 __ ADC #$00
3671 : 85 5a __ STA T3 + 1 
3673 : 8d f5 bf STA $bff5 ; (sstack + 11)
3676 : 20 cd 37 JSR $37cd ; (bm_line.s1 + 0)
3679 : a5 57 __ LDA T2 + 0 
367b : 85 53 __ STA T0 + 0 
367d : a5 58 __ LDA T2 + 1 
367f : 85 54 __ STA T0 + 1 
3681 : a5 59 __ LDA T3 + 0 
3683 : 85 55 __ STA T1 + 0 
3685 : a5 5a __ LDA T3 + 1 
3687 : 85 56 __ STA T1 + 1 
3689 : e6 62 __ INC T10 + 0 
368b : a5 62 __ LDA T10 + 0 
368d : c5 73 __ CMP T22 + 0 
368f : b0 03 __ BCS $3694 ; (draw_gear.s9 + 0)
3691 : 4c 76 33 JMP $3376 ; (draw_gear.l5 + 0)
.s9:
3694 : a5 57 __ LDA T2 + 0 
3696 : 8d ee bf STA $bfee ; (sstack + 4)
3699 : a5 58 __ LDA T2 + 1 
369b : 8d ef bf STA $bfef ; (sstack + 5)
369e : a5 59 __ LDA T3 + 0 
36a0 : 8d f0 bf STA $bff0 ; (sstack + 6)
36a3 : a5 5a __ LDA T3 + 1 
36a5 : 8d f1 bf STA $bff1 ; (sstack + 7)
36a8 : a5 63 __ LDA T11 + 0 
36aa : 8d f2 bf STA $bff2 ; (sstack + 8)
36ad : a5 64 __ LDA T11 + 1 
36af : 8d f3 bf STA $bff3 ; (sstack + 9)
36b2 : a5 65 __ LDA T12 + 0 
36b4 : 8d f4 bf STA $bff4 ; (sstack + 10)
36b7 : a5 66 __ LDA T12 + 1 
36b9 : 8d f5 bf STA $bff5 ; (sstack + 11)
36bc : a9 03 __ LDA #$03
36be : 8d f6 bf STA $bff6 ; (sstack + 12)
36c1 : a9 f7 __ LDA #$f7
36c3 : 8d ea bf STA $bfea ; (sstack + 0)
36c6 : a9 87 __ LDA #$87
36c8 : 8d eb bf STA $bfeb ; (sstack + 1)
36cb : a9 48 __ LDA #$48
36cd : 8d ec bf STA $bfec ; (sstack + 2)
36d0 : a9 84 __ LDA #$84
36d2 : 8d ed bf STA $bfed ; (sstack + 3)
36d5 : 20 cd 37 JSR $37cd ; (bm_line.s1 + 0)
36d8 : a5 71 __ LDA T20 + 0 
36da : 85 03 __ STA WORK + 0 
36dc : 85 62 __ STA T10 + 0 
36de : a9 00 __ LDA #$00
36e0 : 85 5d __ STA T5 + 0 
36e2 : 85 1c __ STA ACCU + 1 
36e4 : 85 04 __ STA WORK + 1 
36e6 : a9 40 __ LDA #$40
36e8 : 85 1b __ STA ACCU + 0 
36ea : 20 4d 7c JSR $7c4d ; (divmod + 0)
36ed : a5 1b __ LDA ACCU + 0 
36ef : 85 59 __ STA T3 + 0 
.l10:
36f1 : a9 f7 __ LDA #$f7
36f3 : 8d ea bf STA $bfea ; (sstack + 0)
36f6 : a9 87 __ LDA #$87
36f8 : 8d eb bf STA $bfeb ; (sstack + 1)
36fb : a9 48 __ LDA #$48
36fd : 8d ec bf STA $bfec ; (sstack + 2)
3700 : a9 84 __ LDA #$84
3702 : 8d ed bf STA $bfed ; (sstack + 3)
3705 : a9 03 __ LDA #$03
3707 : 8d f6 bf STA $bff6 ; (sstack + 12)
370a : a5 5d __ LDA T5 + 0 
370c : 85 1b __ STA ACCU + 0 
370e : a9 00 __ LDA #$00
3710 : 85 1c __ STA ACCU + 1 
3712 : a5 59 __ LDA T3 + 0 
3714 : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
3717 : 18 __ __ CLC
3718 : a5 1b __ LDA ACCU + 0 
371a : 65 5f __ ADC T7 + 0 
371c : 29 3f __ AND #$3f
371e : 85 53 __ STA T0 + 0 
3720 : 18 __ __ CLC
3721 : 69 10 __ ADC #$10
3723 : 29 3f __ AND #$3f
3725 : aa __ __ TAX
3726 : bd 08 84 LDA $8408,x ; (sin64[0] + 0)
3729 : 85 55 __ STA T1 + 0 
372b : 85 1b __ STA ACCU + 0 
372d : 29 80 __ AND #$80
372f : 10 02 __ BPL $3733 ; (draw_gear.l10 + 66)
3731 : a9 ff __ LDA #$ff
3733 : 85 56 __ STA T1 + 1 
3735 : 85 1c __ STA ACCU + 1 
3737 : a5 72 __ LDA T21 + 0 
3739 : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
373c : 20 3e 80 JSR $803e ; (divs16@proxy + 0)
373f : 18 __ __ CLC
3740 : a5 1b __ LDA ACCU + 0 
3742 : 65 67 __ ADC T13 + 0 
3744 : 8d ee bf STA $bfee ; (sstack + 4)
3747 : a5 1c __ LDA ACCU + 1 
3749 : 69 00 __ ADC #$00
374b : 8d ef bf STA $bfef ; (sstack + 5)
374e : a6 53 __ LDX T0 + 0 
3750 : bd 08 84 LDA $8408,x ; (sin64[0] + 0)
3753 : 85 53 __ STA T0 + 0 
3755 : 85 1b __ STA ACCU + 0 
3757 : 29 80 __ AND #$80
3759 : 10 02 __ BPL $375d ; (draw_gear.l10 + 108)
375b : a9 ff __ LDA #$ff
375d : 85 54 __ STA T0 + 1 
375f : 85 1c __ STA ACCU + 1 
3761 : a5 72 __ LDA T21 + 0 
3763 : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
3766 : 20 3e 80 JSR $803e ; (divs16@proxy + 0)
3769 : 18 __ __ CLC
376a : a5 1b __ LDA ACCU + 0 
376c : 69 58 __ ADC #$58
376e : 8d f0 bf STA $bff0 ; (sstack + 6)
3771 : a5 1c __ LDA ACCU + 1 
3773 : 69 00 __ ADC #$00
3775 : 8d f1 bf STA $bff1 ; (sstack + 7)
3778 : a5 55 __ LDA T1 + 0 
377a : 85 1b __ STA ACCU + 0 
377c : a5 56 __ LDA T1 + 1 
377e : 85 1c __ STA ACCU + 1 
3780 : a5 5e __ LDA T6 + 0 
3782 : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
3785 : 20 3e 80 JSR $803e ; (divs16@proxy + 0)
3788 : 18 __ __ CLC
3789 : a5 1b __ LDA ACCU + 0 
378b : 65 67 __ ADC T13 + 0 
378d : 8d f2 bf STA $bff2 ; (sstack + 8)
3790 : a5 1c __ LDA ACCU + 1 
3792 : 69 00 __ ADC #$00
3794 : 8d f3 bf STA $bff3 ; (sstack + 9)
3797 : a5 53 __ LDA T0 + 0 
3799 : 85 1b __ STA ACCU + 0 
379b : a5 54 __ LDA T0 + 1 
379d : 85 1c __ STA ACCU + 1 
379f : a5 5e __ LDA T6 + 0 
37a1 : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
37a4 : 20 3e 80 JSR $803e ; (divs16@proxy + 0)
37a7 : 18 __ __ CLC
37a8 : a5 1b __ LDA ACCU + 0 
37aa : 69 58 __ ADC #$58
37ac : 8d f4 bf STA $bff4 ; (sstack + 10)
37af : a5 1c __ LDA ACCU + 1 
37b1 : 69 00 __ ADC #$00
37b3 : 8d f5 bf STA $bff5 ; (sstack + 11)
37b6 : 20 cd 37 JSR $37cd ; (bm_line.s1 + 0)
37b9 : e6 5d __ INC T5 + 0 
37bb : c6 62 __ DEC T10 + 0 
37bd : f0 03 __ BEQ $37c2 ; (draw_gear.s3 + 0)
37bf : 4c f1 36 JMP $36f1 ; (draw_gear.l10 + 0)
.s3:
37c2 : a2 20 __ LDX #$20
37c4 : bd b0 bf LDA $bfb0,x ; (draw_gear@stack + 0)
37c7 : 95 53 __ STA T0 + 0,x 
37c9 : ca __ __ DEX
37ca : 10 f8 __ BPL $37c4 ; (draw_gear.s3 + 2)
37cc : 60 __ __ RTS
--------------------------------------------------------------------
bm_line: ; bm_line(const struct Bitmap*,const struct ClipRect*,i16,i16,i16,i16,u8,enum LineOp)->void
; 116, "/home/xahmol/oscar64/include/gfx/bitmap.h"
.s1:
37cd : a2 0e __ LDX #$0e
37cf : b5 53 __ LDA T2 + 0,x 
37d1 : 9d db bf STA $bfdb,x ; (bm_line@stack + 0)
37d4 : ca __ __ DEX
37d5 : 10 f8 __ BPL $37cf ; (bm_line.s1 + 2)
.s4:
37d7 : ad f0 bf LDA $bff0 ; (sstack + 6)
37da : 85 55 __ STA T3 + 0 
37dc : ad f1 bf LDA $bff1 ; (sstack + 7)
37df : 85 56 __ STA T3 + 1 
37e1 : ad f4 bf LDA $bff4 ; (sstack + 10)
37e4 : 85 53 __ STA T2 + 0 
37e6 : 38 __ __ SEC
37e7 : e5 55 __ SBC T3 + 0 
37e9 : 85 57 __ STA T4 + 0 
37eb : ad f5 bf LDA $bff5 ; (sstack + 11)
37ee : 85 54 __ STA T2 + 1 
37f0 : e5 56 __ SBC T3 + 1 
37f2 : 85 58 __ STA T4 + 1 
37f4 : ad f6 bf LDA $bff6 ; (sstack + 12)
37f7 : 85 61 __ STA T10 + 0 
37f9 : ad ec bf LDA $bfec ; (sstack + 2)
37fc : 85 59 __ STA T5 + 0 
37fe : ad ed bf LDA $bfed ; (sstack + 3)
3801 : 85 5a __ STA T5 + 1 
3803 : a0 00 __ LDY #$00
3805 : b1 59 __ LDA (T5 + 0),y 
3807 : 85 43 __ STA T0 + 0 
3809 : c8 __ __ INY
380a : b1 59 __ LDA (T5 + 0),y 
380c : 85 44 __ STA T0 + 1 
380e : a0 04 __ LDY #$04
3810 : b1 59 __ LDA (T5 + 0),y 
3812 : 85 45 __ STA T1 + 0 
3814 : ad ee bf LDA $bfee ; (sstack + 4)
3817 : 85 5d __ STA T7 + 0 
3819 : ad ef bf LDA $bfef ; (sstack + 5)
381c : 85 5e __ STA T7 + 1 
381e : ad f2 bf LDA $bff2 ; (sstack + 8)
3821 : 85 5b __ STA T6 + 0 
3823 : 38 __ __ SEC
3824 : e5 5d __ SBC T7 + 0 
3826 : 85 5f __ STA T8 + 0 
3828 : ad f3 bf LDA $bff3 ; (sstack + 9)
382b : 85 5c __ STA T6 + 1 
382d : c8 __ __ INY
382e : e5 5e __ SBC T7 + 1 
3830 : 85 60 __ STA T8 + 1 
3832 : 30 07 __ BMI $383b ; (bm_line.s5 + 0)
.s82:
3834 : 05 5f __ ORA T8 + 0 
3836 : f0 03 __ BEQ $383b ; (bm_line.s5 + 0)
3838 : 4c 65 3b JMP $3b65 ; (bm_line.s64 + 0)
.s5:
383b : a5 5e __ LDA T7 + 1 
383d : 10 03 __ BPL $3842 ; (bm_line.s63 + 0)
383f : 4c b1 39 JMP $39b1 ; (bm_line.s3 + 0)
.s63:
3842 : c5 44 __ CMP T0 + 1 
3844 : d0 04 __ BNE $384a ; (bm_line.s62 + 0)
.s61:
3846 : a5 5d __ LDA T7 + 0 
3848 : c5 43 __ CMP T0 + 0 
.s62:
384a : 90 f3 __ BCC $383f ; (bm_line.s5 + 4)
.s6:
384c : a5 5c __ LDA T6 + 1 
384e : 10 03 __ BPL $3853 ; (bm_line.s60 + 0)
3850 : 4c 0e 3b JMP $3b0e ; (bm_line.s52 + 0)
.s60:
3853 : d1 59 __ CMP (T5 + 0),y 
3855 : d0 04 __ BNE $385b ; (bm_line.s59 + 0)
.s58:
3857 : a5 5b __ LDA T6 + 0 
3859 : c5 45 __ CMP T1 + 0 
.s59:
385b : b0 e2 __ BCS $383f ; (bm_line.s5 + 4)
.s7:
385d : a5 5c __ LDA T6 + 1 
385f : c5 44 __ CMP T0 + 1 
3861 : d0 04 __ BNE $3867 ; (bm_line.s57 + 0)
.s56:
3863 : a5 5b __ LDA T6 + 0 
3865 : c5 43 __ CMP T0 + 0 
.s57:
3867 : 90 e7 __ BCC $3850 ; (bm_line.s6 + 4)
.s8:
3869 : a5 5e __ LDA T7 + 1 
386b : d1 59 __ CMP (T5 + 0),y 
386d : d0 04 __ BNE $3873 ; (bm_line.s54 + 0)
.s51:
386f : a5 5d __ LDA T7 + 0 
3871 : c5 45 __ CMP T1 + 0 
.s54:
3873 : 90 4e __ BCC $38c3 ; (bm_line.s9 + 0)
.s50:
3875 : a5 57 __ LDA T4 + 0 
3877 : 85 0f __ STA P2 
3879 : a5 58 __ LDA T4 + 1 
387b : 85 10 __ STA P3 
387d : a5 5f __ LDA T8 + 0 
387f : 85 11 __ STA P4 
3881 : a5 60 __ LDA T8 + 1 
3883 : 85 12 __ STA P5 
3885 : 18 __ __ CLC
3886 : a5 5d __ LDA T7 + 0 
3888 : 69 01 __ ADC #$01
388a : a8 __ __ TAY
388b : a5 5e __ LDA T7 + 1 
388d : 69 00 __ ADC #$00
388f : aa __ __ TAX
3890 : 98 __ __ TYA
3891 : 38 __ __ SEC
3892 : a0 04 __ LDY #$04
3894 : f1 59 __ SBC (T5 + 0),y 
3896 : 85 0d __ STA P0 
3898 : 8a __ __ TXA
3899 : c8 __ __ INY
389a : f1 59 __ SBC (T5 + 0),y 
389c : 85 0e __ STA P1 
389e : 20 47 3c JSR $3c47 ; (lmuldiv16s.s4 + 0)
38a1 : 38 __ __ SEC
38a2 : a5 55 __ LDA T3 + 0 
38a4 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
38a6 : 8d f0 bf STA $bff0 ; (sstack + 6)
38a9 : a5 56 __ LDA T3 + 1 
38ab : e5 1c __ SBC ACCU + 1 ; (clip + 1)
38ad : 8d f1 bf STA $bff1 ; (sstack + 7)
38b0 : a0 04 __ LDY #$04
38b2 : b1 59 __ LDA (T5 + 0),y 
38b4 : 38 __ __ SEC
38b5 : e9 01 __ SBC #$01
38b7 : aa __ __ TAX
38b8 : c8 __ __ INY
38b9 : b1 59 __ LDA (T5 + 0),y 
38bb : 8e ee bf STX $bfee ; (sstack + 4)
38be : e9 00 __ SBC #$00
38c0 : 8d ef bf STA $bfef ; (sstack + 5)
.s9:
38c3 : a0 02 __ LDY #$02
38c5 : b1 59 __ LDA (T5 + 0),y 
38c7 : 85 43 __ STA T0 + 0 
38c9 : c8 __ __ INY
38ca : b1 59 __ LDA (T5 + 0),y 
38cc : 85 44 __ STA T0 + 1 
38ce : a0 06 __ LDY #$06
38d0 : b1 59 __ LDA (T5 + 0),y 
38d2 : 85 45 __ STA T1 + 0 
38d4 : c8 __ __ INY
38d5 : a5 58 __ LDA T4 + 1 
38d7 : 30 07 __ BMI $38e0 ; (bm_line.s10 + 0)
.s49:
38d9 : 05 57 __ ORA T4 + 0 
38db : f0 03 __ BEQ $38e0 ; (bm_line.s10 + 0)
38dd : 4c 16 3a JMP $3a16 ; (bm_line.s30 + 0)
.s10:
38e0 : ad f0 bf LDA $bff0 ; (sstack + 6)
38e3 : 85 55 __ STA T3 + 0 
38e5 : ad f1 bf LDA $bff1 ; (sstack + 7)
38e8 : 10 03 __ BPL $38ed ; (bm_line.s29 + 0)
38ea : 4c b1 39 JMP $39b1 ; (bm_line.s3 + 0)
.s29:
38ed : 85 56 __ STA T3 + 1 
38ef : c5 44 __ CMP T0 + 1 
38f1 : d0 04 __ BNE $38f7 ; (bm_line.s28 + 0)
.s27:
38f3 : a5 55 __ LDA T3 + 0 
38f5 : c5 43 __ CMP T0 + 0 
.s28:
38f7 : 90 f1 __ BCC $38ea ; (bm_line.s10 + 10)
.s11:
38f9 : ad f5 bf LDA $bff5 ; (sstack + 11)
38fc : 10 03 __ BPL $3901 ; (bm_line.s26 + 0)
38fe : 4c bc 39 JMP $39bc ; (bm_line.s17 + 0)
.s26:
3901 : d1 59 __ CMP (T5 + 0),y 
3903 : d0 05 __ BNE $390a ; (bm_line.s25 + 0)
.s24:
3905 : ad f4 bf LDA $bff4 ; (sstack + 10)
3908 : c5 45 __ CMP T1 + 0 
.s25:
390a : b0 de __ BCS $38ea ; (bm_line.s10 + 10)
.s12:
390c : ad f5 bf LDA $bff5 ; (sstack + 11)
390f : 30 ed __ BMI $38fe ; (bm_line.s11 + 5)
.s23:
3911 : c5 44 __ CMP T0 + 1 
3913 : d0 05 __ BNE $391a ; (bm_line.s22 + 0)
.s21:
3915 : ad f4 bf LDA $bff4 ; (sstack + 10)
3918 : c5 43 __ CMP T0 + 0 
.s22:
391a : 90 e2 __ BCC $38fe ; (bm_line.s11 + 5)
.s13:
391c : a5 56 __ LDA T3 + 1 
391e : d1 59 __ CMP (T5 + 0),y 
3920 : d0 04 __ BNE $3926 ; (bm_line.s19 + 0)
.s16:
3922 : a5 55 __ LDA T3 + 0 
3924 : c5 45 __ CMP T1 + 0 
.s19:
3926 : 90 50 __ BCC $3978 ; (bm_line.s14 + 0)
.s15:
3928 : a5 5f __ LDA T8 + 0 
392a : 85 0f __ STA P2 
392c : a5 60 __ LDA T8 + 1 
392e : 85 10 __ STA P3 
3930 : a5 57 __ LDA T4 + 0 
3932 : 85 11 __ STA P4 
3934 : a5 58 __ LDA T4 + 1 
3936 : 85 12 __ STA P5 
3938 : 18 __ __ CLC
3939 : a5 55 __ LDA T3 + 0 
393b : 69 01 __ ADC #$01
393d : a8 __ __ TAY
393e : a5 56 __ LDA T3 + 1 
3940 : 69 00 __ ADC #$00
3942 : aa __ __ TAX
3943 : 98 __ __ TYA
3944 : 38 __ __ SEC
3945 : a0 06 __ LDY #$06
3947 : f1 59 __ SBC (T5 + 0),y 
3949 : 85 0d __ STA P0 
394b : 8a __ __ TXA
394c : c8 __ __ INY
394d : f1 59 __ SBC (T5 + 0),y 
394f : 85 0e __ STA P1 
3951 : 20 47 3c JSR $3c47 ; (lmuldiv16s.s4 + 0)
3954 : ad ee bf LDA $bfee ; (sstack + 4)
3957 : 38 __ __ SEC
3958 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
395a : 8d ee bf STA $bfee ; (sstack + 4)
395d : ad ef bf LDA $bfef ; (sstack + 5)
3960 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
3962 : 8d ef bf STA $bfef ; (sstack + 5)
3965 : a0 06 __ LDY #$06
3967 : b1 59 __ LDA (T5 + 0),y 
3969 : 38 __ __ SEC
396a : e9 01 __ SBC #$01
396c : aa __ __ TAX
396d : c8 __ __ INY
396e : b1 59 __ LDA (T5 + 0),y 
3970 : 8e f0 bf STX $bff0 ; (sstack + 6)
3973 : e9 00 __ SBC #$00
3975 : 8d f1 bf STA $bff1 ; (sstack + 7)
.s14:
3978 : ad ea bf LDA $bfea ; (sstack + 0)
397b : 85 0d __ STA P0 
397d : ad eb bf LDA $bfeb ; (sstack + 1)
3980 : 85 0e __ STA P1 
3982 : ad ee bf LDA $bfee ; (sstack + 4)
3985 : 85 0f __ STA P2 
3987 : ad ef bf LDA $bfef ; (sstack + 5)
398a : 85 10 __ STA P3 
398c : ad f0 bf LDA $bff0 ; (sstack + 6)
398f : 85 11 __ STA P4 
3991 : ad f1 bf LDA $bff1 ; (sstack + 7)
3994 : 85 12 __ STA P5 
3996 : ad f2 bf LDA $bff2 ; (sstack + 8)
3999 : 85 13 __ STA P6 
399b : ad f3 bf LDA $bff3 ; (sstack + 9)
399e : 85 14 __ STA P7 
39a0 : ad f4 bf LDA $bff4 ; (sstack + 10)
39a3 : 85 15 __ STA P8 
39a5 : ad f5 bf LDA $bff5 ; (sstack + 11)
39a8 : 85 16 __ STA P9 
39aa : a5 61 __ LDA T10 + 0 
39ac : 85 18 __ STA P11 
39ae : 20 06 3d JSR $3d06 ; (bmu_line.s4 + 0)
.s3:
39b1 : a2 0e __ LDX #$0e
39b3 : bd db bf LDA $bfdb,x ; (bm_line@stack + 0)
39b6 : 95 53 __ STA T2 + 0,x 
39b8 : ca __ __ DEX
39b9 : 10 f8 __ BPL $39b3 ; (bm_line.s3 + 2)
39bb : 60 __ __ RTS
.s17:
39bc : a5 5f __ LDA T8 + 0 
39be : 85 0f __ STA P2 
39c0 : a5 60 __ LDA T8 + 1 
39c2 : 85 10 __ STA P3 
39c4 : a5 57 __ LDA T4 + 0 
39c6 : 85 11 __ STA P4 
39c8 : a5 58 __ LDA T4 + 1 
39ca : 85 12 __ STA P5 
39cc : 38 __ __ SEC
39cd : a5 43 __ LDA T0 + 0 
39cf : ed f4 bf SBC $bff4 ; (sstack + 10)
39d2 : 85 0d __ STA P0 
39d4 : a5 44 __ LDA T0 + 1 
39d6 : ed f5 bf SBC $bff5 ; (sstack + 11)
39d9 : 85 0e __ STA P1 
39db : 20 47 3c JSR $3c47 ; (lmuldiv16s.s4 + 0)
39de : a0 02 __ LDY #$02
39e0 : b1 59 __ LDA (T5 + 0),y 
39e2 : 8d f4 bf STA $bff4 ; (sstack + 10)
39e5 : c8 __ __ INY
39e6 : b1 59 __ LDA (T5 + 0),y 
39e8 : 8d f5 bf STA $bff5 ; (sstack + 11)
39eb : ad f2 bf LDA $bff2 ; (sstack + 8)
39ee : 18 __ __ CLC
39ef : 65 1b __ ADC ACCU + 0 ; (clip + 0)
39f1 : 8d f2 bf STA $bff2 ; (sstack + 8)
39f4 : ad f3 bf LDA $bff3 ; (sstack + 9)
39f7 : 65 1c __ ADC ACCU + 1 ; (clip + 1)
39f9 : 8d f3 bf STA $bff3 ; (sstack + 9)
39fc : a0 07 __ LDY #$07
39fe : b1 59 __ LDA (T5 + 0),y 
3a00 : 10 03 __ BPL $3a05 ; (bm_line.s20 + 0)
3a02 : 4c 28 39 JMP $3928 ; (bm_line.s15 + 0)
.s20:
3a05 : a5 56 __ LDA T3 + 1 
3a07 : d1 59 __ CMP (T5 + 0),y 
3a09 : f0 03 __ BEQ $3a0e ; (bm_line.s18 + 0)
3a0b : 4c 26 39 JMP $3926 ; (bm_line.s19 + 0)
.s18:
3a0e : a5 55 __ LDA T3 + 0 
3a10 : 88 __ __ DEY
3a11 : d1 59 __ CMP (T5 + 0),y 
3a13 : 4c 26 39 JMP $3926 ; (bm_line.s19 + 0)
.s30:
3a16 : ad f4 bf LDA $bff4 ; (sstack + 10)
3a19 : 85 55 __ STA T3 + 0 
3a1b : ad f5 bf LDA $bff5 ; (sstack + 11)
3a1e : 30 91 __ BMI $39b1 ; (bm_line.s3 + 0)
.s48:
3a20 : 85 56 __ STA T3 + 1 
3a22 : c5 44 __ CMP T0 + 1 
3a24 : d0 04 __ BNE $3a2a ; (bm_line.s47 + 0)
.s46:
3a26 : a5 55 __ LDA T3 + 0 
3a28 : c5 43 __ CMP T0 + 0 
.s47:
3a2a : 90 85 __ BCC $39b1 ; (bm_line.s3 + 0)
.s31:
3a2c : ad f1 bf LDA $bff1 ; (sstack + 7)
3a2f : 10 03 __ BPL $3a34 ; (bm_line.s45 + 0)
3a31 : 4c b4 3a JMP $3ab4 ; (bm_line.s36 + 0)
.s45:
3a34 : d1 59 __ CMP (T5 + 0),y 
3a36 : d0 05 __ BNE $3a3d ; (bm_line.s44 + 0)
.s43:
3a38 : ad f0 bf LDA $bff0 ; (sstack + 6)
3a3b : c5 45 __ CMP T1 + 0 
.s44:
3a3d : 90 03 __ BCC $3a42 ; (bm_line.s32 + 0)
3a3f : 4c b1 39 JMP $39b1 ; (bm_line.s3 + 0)
.s32:
3a42 : ad f1 bf LDA $bff1 ; (sstack + 7)
3a45 : 30 6d __ BMI $3ab4 ; (bm_line.s36 + 0)
.s42:
3a47 : c5 44 __ CMP T0 + 1 
3a49 : d0 05 __ BNE $3a50 ; (bm_line.s41 + 0)
.s40:
3a4b : ad f0 bf LDA $bff0 ; (sstack + 6)
3a4e : c5 43 __ CMP T0 + 0 
.s41:
3a50 : 90 62 __ BCC $3ab4 ; (bm_line.s36 + 0)
.s33:
3a52 : a5 56 __ LDA T3 + 1 
3a54 : d1 59 __ CMP (T5 + 0),y 
3a56 : d0 04 __ BNE $3a5c ; (bm_line.s38 + 0)
.s35:
3a58 : a5 55 __ LDA T3 + 0 
3a5a : c5 45 __ CMP T1 + 0 
.s38:
3a5c : b0 03 __ BCS $3a61 ; (bm_line.s34 + 0)
3a5e : 4c 78 39 JMP $3978 ; (bm_line.s14 + 0)
.s34:
3a61 : a5 5f __ LDA T8 + 0 
3a63 : 85 0f __ STA P2 
3a65 : a5 60 __ LDA T8 + 1 
3a67 : 85 10 __ STA P3 
3a69 : a5 57 __ LDA T4 + 0 
3a6b : 85 11 __ STA P4 
3a6d : a5 58 __ LDA T4 + 1 
3a6f : 85 12 __ STA P5 
3a71 : 18 __ __ CLC
3a72 : a5 55 __ LDA T3 + 0 
3a74 : 69 01 __ ADC #$01
3a76 : a8 __ __ TAY
3a77 : a5 56 __ LDA T3 + 1 
3a79 : 69 00 __ ADC #$00
3a7b : aa __ __ TAX
3a7c : 98 __ __ TYA
3a7d : 38 __ __ SEC
3a7e : a0 06 __ LDY #$06
3a80 : f1 59 __ SBC (T5 + 0),y 
3a82 : 85 0d __ STA P0 
3a84 : 8a __ __ TXA
3a85 : c8 __ __ INY
3a86 : f1 59 __ SBC (T5 + 0),y 
3a88 : 85 0e __ STA P1 
3a8a : 20 47 3c JSR $3c47 ; (lmuldiv16s.s4 + 0)
3a8d : ad f2 bf LDA $bff2 ; (sstack + 8)
3a90 : 38 __ __ SEC
3a91 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
3a93 : 8d f2 bf STA $bff2 ; (sstack + 8)
3a96 : ad f3 bf LDA $bff3 ; (sstack + 9)
3a99 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
3a9b : 8d f3 bf STA $bff3 ; (sstack + 9)
3a9e : a0 06 __ LDY #$06
3aa0 : b1 59 __ LDA (T5 + 0),y 
3aa2 : 38 __ __ SEC
3aa3 : e9 01 __ SBC #$01
3aa5 : aa __ __ TAX
3aa6 : c8 __ __ INY
3aa7 : b1 59 __ LDA (T5 + 0),y 
3aa9 : 8e f4 bf STX $bff4 ; (sstack + 10)
3aac : e9 00 __ SBC #$00
3aae : 8d f5 bf STA $bff5 ; (sstack + 11)
3ab1 : 4c 78 39 JMP $3978 ; (bm_line.s14 + 0)
.s36:
3ab4 : a5 5f __ LDA T8 + 0 
3ab6 : 85 0f __ STA P2 
3ab8 : a5 60 __ LDA T8 + 1 
3aba : 85 10 __ STA P3 
3abc : a5 57 __ LDA T4 + 0 
3abe : 85 11 __ STA P4 
3ac0 : a5 58 __ LDA T4 + 1 
3ac2 : 85 12 __ STA P5 
3ac4 : 38 __ __ SEC
3ac5 : a5 43 __ LDA T0 + 0 
3ac7 : ed f0 bf SBC $bff0 ; (sstack + 6)
3aca : 85 0d __ STA P0 
3acc : a5 44 __ LDA T0 + 1 
3ace : ed f1 bf SBC $bff1 ; (sstack + 7)
3ad1 : 85 0e __ STA P1 
3ad3 : 20 47 3c JSR $3c47 ; (lmuldiv16s.s4 + 0)
3ad6 : a0 02 __ LDY #$02
3ad8 : b1 59 __ LDA (T5 + 0),y 
3ada : 8d f0 bf STA $bff0 ; (sstack + 6)
3add : c8 __ __ INY
3ade : b1 59 __ LDA (T5 + 0),y 
3ae0 : 8d f1 bf STA $bff1 ; (sstack + 7)
3ae3 : ad ee bf LDA $bfee ; (sstack + 4)
3ae6 : 18 __ __ CLC
3ae7 : 65 1b __ ADC ACCU + 0 ; (clip + 0)
3ae9 : 8d ee bf STA $bfee ; (sstack + 4)
3aec : ad ef bf LDA $bfef ; (sstack + 5)
3aef : 65 1c __ ADC ACCU + 1 ; (clip + 1)
3af1 : 8d ef bf STA $bfef ; (sstack + 5)
3af4 : a0 07 __ LDY #$07
3af6 : b1 59 __ LDA (T5 + 0),y 
3af8 : 10 03 __ BPL $3afd ; (bm_line.s39 + 0)
3afa : 4c 61 3a JMP $3a61 ; (bm_line.s34 + 0)
.s39:
3afd : a5 56 __ LDA T3 + 1 
3aff : d1 59 __ CMP (T5 + 0),y 
3b01 : f0 03 __ BEQ $3b06 ; (bm_line.s37 + 0)
3b03 : 4c 5c 3a JMP $3a5c ; (bm_line.s38 + 0)
.s37:
3b06 : a5 55 __ LDA T3 + 0 
3b08 : 88 __ __ DEY
3b09 : d1 59 __ CMP (T5 + 0),y 
3b0b : 4c 5c 3a JMP $3a5c ; (bm_line.s38 + 0)
.s52:
3b0e : a5 57 __ LDA T4 + 0 
3b10 : 85 0f __ STA P2 
3b12 : a5 58 __ LDA T4 + 1 
3b14 : 85 10 __ STA P3 
3b16 : a5 5f __ LDA T8 + 0 
3b18 : 85 11 __ STA P4 
3b1a : a5 60 __ LDA T8 + 1 
3b1c : 85 12 __ STA P5 
3b1e : 38 __ __ SEC
3b1f : a5 43 __ LDA T0 + 0 
3b21 : e5 5b __ SBC T6 + 0 
3b23 : 85 0d __ STA P0 
3b25 : a5 44 __ LDA T0 + 1 
3b27 : e5 5c __ SBC T6 + 1 
3b29 : 85 0e __ STA P1 
3b2b : 20 47 3c JSR $3c47 ; (lmuldiv16s.s4 + 0)
3b2e : 18 __ __ CLC
3b2f : a5 1b __ LDA ACCU + 0 ; (clip + 0)
3b31 : 65 53 __ ADC T2 + 0 
3b33 : aa __ __ TAX
3b34 : a0 00 __ LDY #$00
3b36 : b1 59 __ LDA (T5 + 0),y 
3b38 : 8d f2 bf STA $bff2 ; (sstack + 8)
3b3b : c8 __ __ INY
3b3c : b1 59 __ LDA (T5 + 0),y 
3b3e : 8e f4 bf STX $bff4 ; (sstack + 10)
3b41 : 8d f3 bf STA $bff3 ; (sstack + 9)
3b44 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
3b46 : 65 54 __ ADC T2 + 1 
3b48 : 8d f5 bf STA $bff5 ; (sstack + 11)
3b4b : a0 05 __ LDY #$05
3b4d : b1 59 __ LDA (T5 + 0),y 
3b4f : 10 03 __ BPL $3b54 ; (bm_line.s55 + 0)
3b51 : 4c 75 38 JMP $3875 ; (bm_line.s50 + 0)
.s55:
3b54 : a5 5e __ LDA T7 + 1 
3b56 : d1 59 __ CMP (T5 + 0),y 
3b58 : f0 03 __ BEQ $3b5d ; (bm_line.s53 + 0)
3b5a : 4c 73 38 JMP $3873 ; (bm_line.s54 + 0)
.s53:
3b5d : a5 5d __ LDA T7 + 0 
3b5f : 88 __ __ DEY
3b60 : d1 59 __ CMP (T5 + 0),y 
3b62 : 4c 73 38 JMP $3873 ; (bm_line.s54 + 0)
.s64:
3b65 : a5 5c __ LDA T6 + 1 
3b67 : 10 03 __ BPL $3b6c ; (bm_line.s81 + 0)
3b69 : 4c b1 39 JMP $39b1 ; (bm_line.s3 + 0)
.s81:
3b6c : c5 44 __ CMP T0 + 1 
3b6e : d0 04 __ BNE $3b74 ; (bm_line.s80 + 0)
.s79:
3b70 : a5 5b __ LDA T6 + 0 
3b72 : c5 43 __ CMP T0 + 0 
.s80:
3b74 : 90 f3 __ BCC $3b69 ; (bm_line.s64 + 4)
.s65:
3b76 : a5 5e __ LDA T7 + 1 
3b78 : 30 76 __ BMI $3bf0 ; (bm_line.s70 + 0)
.s78:
3b7a : d1 59 __ CMP (T5 + 0),y 
3b7c : d0 04 __ BNE $3b82 ; (bm_line.s77 + 0)
.s76:
3b7e : a5 5d __ LDA T7 + 0 
3b80 : c5 45 __ CMP T1 + 0 
.s77:
3b82 : b0 e5 __ BCS $3b69 ; (bm_line.s64 + 4)
.s66:
3b84 : a5 5e __ LDA T7 + 1 
3b86 : c5 44 __ CMP T0 + 1 
3b88 : d0 04 __ BNE $3b8e ; (bm_line.s75 + 0)
.s74:
3b8a : a5 5d __ LDA T7 + 0 
3b8c : c5 43 __ CMP T0 + 0 
.s75:
3b8e : 90 60 __ BCC $3bf0 ; (bm_line.s70 + 0)
.s67:
3b90 : a5 5c __ LDA T6 + 1 
3b92 : d1 59 __ CMP (T5 + 0),y 
3b94 : d0 04 __ BNE $3b9a ; (bm_line.s72 + 0)
.s69:
3b96 : a5 5b __ LDA T6 + 0 
3b98 : c5 45 __ CMP T1 + 0 
.s72:
3b9a : b0 03 __ BCS $3b9f ; (bm_line.s68 + 0)
3b9c : 4c c3 38 JMP $38c3 ; (bm_line.s9 + 0)
.s68:
3b9f : a5 57 __ LDA T4 + 0 
3ba1 : 85 0f __ STA P2 
3ba3 : a5 58 __ LDA T4 + 1 
3ba5 : 85 10 __ STA P3 
3ba7 : a5 5f __ LDA T8 + 0 
3ba9 : 85 11 __ STA P4 
3bab : a5 60 __ LDA T8 + 1 
3bad : 85 12 __ STA P5 
3baf : 18 __ __ CLC
3bb0 : a5 5b __ LDA T6 + 0 
3bb2 : 69 01 __ ADC #$01
3bb4 : a8 __ __ TAY
3bb5 : a5 5c __ LDA T6 + 1 
3bb7 : 69 00 __ ADC #$00
3bb9 : aa __ __ TAX
3bba : 98 __ __ TYA
3bbb : 38 __ __ SEC
3bbc : a0 04 __ LDY #$04
3bbe : f1 59 __ SBC (T5 + 0),y 
3bc0 : 85 0d __ STA P0 
3bc2 : 8a __ __ TXA
3bc3 : c8 __ __ INY
3bc4 : f1 59 __ SBC (T5 + 0),y 
3bc6 : 85 0e __ STA P1 
3bc8 : 20 47 3c JSR $3c47 ; (lmuldiv16s.s4 + 0)
3bcb : 38 __ __ SEC
3bcc : a5 53 __ LDA T2 + 0 
3bce : e5 1b __ SBC ACCU + 0 ; (clip + 0)
3bd0 : 8d f4 bf STA $bff4 ; (sstack + 10)
3bd3 : a5 54 __ LDA T2 + 1 
3bd5 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
3bd7 : 8d f5 bf STA $bff5 ; (sstack + 11)
3bda : a0 04 __ LDY #$04
3bdc : b1 59 __ LDA (T5 + 0),y 
3bde : 38 __ __ SEC
3bdf : e9 01 __ SBC #$01
3be1 : aa __ __ TAX
3be2 : c8 __ __ INY
3be3 : b1 59 __ LDA (T5 + 0),y 
3be5 : 8e f2 bf STX $bff2 ; (sstack + 8)
3be8 : e9 00 __ SBC #$00
3bea : 8d f3 bf STA $bff3 ; (sstack + 9)
3bed : 4c c3 38 JMP $38c3 ; (bm_line.s9 + 0)
.s70:
3bf0 : a5 57 __ LDA T4 + 0 
3bf2 : 85 0f __ STA P2 
3bf4 : a5 58 __ LDA T4 + 1 
3bf6 : 85 10 __ STA P3 
3bf8 : a5 5f __ LDA T8 + 0 
3bfa : 85 11 __ STA P4 
3bfc : a5 60 __ LDA T8 + 1 
3bfe : 85 12 __ STA P5 
3c00 : 38 __ __ SEC
3c01 : a5 43 __ LDA T0 + 0 
3c03 : e5 5d __ SBC T7 + 0 
3c05 : 85 0d __ STA P0 
3c07 : a5 44 __ LDA T0 + 1 
3c09 : e5 5e __ SBC T7 + 1 
3c0b : 85 0e __ STA P1 
3c0d : 20 47 3c JSR $3c47 ; (lmuldiv16s.s4 + 0)
3c10 : 18 __ __ CLC
3c11 : a5 1b __ LDA ACCU + 0 ; (clip + 0)
3c13 : 65 55 __ ADC T3 + 0 
3c15 : aa __ __ TAX
3c16 : a0 00 __ LDY #$00
3c18 : b1 59 __ LDA (T5 + 0),y 
3c1a : 8d ee bf STA $bfee ; (sstack + 4)
3c1d : c8 __ __ INY
3c1e : b1 59 __ LDA (T5 + 0),y 
3c20 : 8e f0 bf STX $bff0 ; (sstack + 6)
3c23 : 8d ef bf STA $bfef ; (sstack + 5)
3c26 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
3c28 : 65 56 __ ADC T3 + 1 
3c2a : 8d f1 bf STA $bff1 ; (sstack + 7)
3c2d : a0 05 __ LDY #$05
3c2f : b1 59 __ LDA (T5 + 0),y 
3c31 : 10 03 __ BPL $3c36 ; (bm_line.s73 + 0)
3c33 : 4c 9f 3b JMP $3b9f ; (bm_line.s68 + 0)
.s73:
3c36 : a5 5c __ LDA T6 + 1 
3c38 : d1 59 __ CMP (T5 + 0),y 
3c3a : f0 03 __ BEQ $3c3f ; (bm_line.s71 + 0)
3c3c : 4c 9a 3b JMP $3b9a ; (bm_line.s72 + 0)
.s71:
3c3f : a5 5b __ LDA T6 + 0 
3c41 : 88 __ __ DEY
3c42 : d1 59 __ CMP (T5 + 0),y 
3c44 : 4c 9a 3b JMP $3b9a ; (bm_line.s72 + 0)
--------------------------------------------------------------------
lmuldiv16s: ; lmuldiv16s(i16,i16,i16)->i16
;  42, "/home/xahmol/oscar64/include/fixmath.h"
.s4:
3c47 : a9 00 __ LDA #$00
3c49 : 24 0e __ BIT P1 ; (a + 1)
3c4b : 10 0d __ BPL $3c5a ; (lmuldiv16s.s5 + 0)
.s10:
3c4d : 38 __ __ SEC
3c4e : e5 0d __ SBC P0 ; (a + 0)
3c50 : 85 0d __ STA P0 ; (a + 0)
3c52 : a9 00 __ LDA #$00
3c54 : e5 0e __ SBC P1 ; (a + 1)
3c56 : 85 0e __ STA P1 ; (a + 1)
3c58 : a9 01 __ LDA #$01
.s5:
3c5a : 85 43 __ STA T1 + 0 
3c5c : 24 10 __ BIT P3 ; (b + 1)
3c5e : 10 14 __ BPL $3c74 ; (lmuldiv16s.s6 + 0)
.s9:
3c60 : 38 __ __ SEC
3c61 : a9 00 __ LDA #$00
3c63 : e5 0f __ SBC P2 ; (b + 0)
3c65 : 85 0f __ STA P2 ; (b + 0)
3c67 : a9 00 __ LDA #$00
3c69 : e5 10 __ SBC P3 ; (b + 1)
3c6b : 85 10 __ STA P3 ; (b + 1)
3c6d : a9 00 __ LDA #$00
3c6f : c5 43 __ CMP T1 + 0 
3c71 : 2a __ __ ROL
3c72 : 85 43 __ STA T1 + 0 
.s6:
3c74 : 24 12 __ BIT P5 ; (c + 1)
3c76 : 10 14 __ BPL $3c8c ; (lmuldiv16s.s7 + 0)
.s8:
3c78 : 38 __ __ SEC
3c79 : a9 00 __ LDA #$00
3c7b : e5 11 __ SBC P4 ; (c + 0)
3c7d : 85 11 __ STA P4 ; (c + 0)
3c7f : a9 00 __ LDA #$00
3c81 : e5 12 __ SBC P5 ; (c + 1)
3c83 : 85 12 __ STA P5 ; (c + 1)
3c85 : a9 00 __ LDA #$00
3c87 : c5 43 __ CMP T1 + 0 
3c89 : 2a __ __ ROL
3c8a : 85 43 __ STA T1 + 0 
.s7:
3c8c : a9 00 __ LDA #$00
3c8e : 85 05 __ STA WORK + 2 
3c90 : 85 06 __ STA WORK + 3 
3c92 : a5 0d __ LDA P0 ; (a + 0)
3c94 : 38 __ __ SEC
3c95 : a0 08 __ LDY #$08
3c97 : 6a __ __ ROR
3c98 : 90 0f __ BCC $3ca9 ; (lmuldiv16s.s7 + 29)
3c9a : aa __ __ TAX
3c9b : 18 __ __ CLC
3c9c : a5 05 __ LDA WORK + 2 
3c9e : 65 0f __ ADC P2 ; (b + 0)
3ca0 : 85 05 __ STA WORK + 2 
3ca2 : a5 06 __ LDA WORK + 3 
3ca4 : 65 10 __ ADC P3 ; (b + 1)
3ca6 : 85 06 __ STA WORK + 3 
3ca8 : 8a __ __ TXA
3ca9 : 66 06 __ ROR WORK + 3 
3cab : 66 05 __ ROR WORK + 2 
3cad : 88 __ __ DEY
3cae : d0 e7 __ BNE $3c97 ; (lmuldiv16s.s7 + 11)
3cb0 : 6a __ __ ROR
3cb1 : 90 07 __ BCC $3cba ; (lmuldiv16s.s7 + 46)
3cb3 : 85 03 __ STA WORK + 0 
3cb5 : a5 0e __ LDA P1 ; (a + 1)
3cb7 : 18 __ __ CLC
3cb8 : 90 db __ BCC $3c95 ; (lmuldiv16s.s7 + 9)
3cba : 38 __ __ SEC
3cbb : 85 04 __ STA WORK + 1 
3cbd : a2 08 __ LDX #$08
3cbf : 26 04 __ ROL WORK + 1 
3cc1 : 26 05 __ ROL WORK + 2 
3cc3 : 26 06 __ ROL WORK + 3 
3cc5 : 90 0c __ BCC $3cd3 ; (lmuldiv16s.s7 + 71)
3cc7 : a5 05 __ LDA WORK + 2 
3cc9 : e5 11 __ SBC P4 ; (c + 0)
3ccb : a8 __ __ TAY
3ccc : a5 06 __ LDA WORK + 3 
3cce : e5 12 __ SBC P5 ; (c + 1)
3cd0 : 38 __ __ SEC
3cd1 : b0 0c __ BCS $3cdf ; (lmuldiv16s.s7 + 83)
3cd3 : 38 __ __ SEC
3cd4 : a5 05 __ LDA WORK + 2 
3cd6 : e5 11 __ SBC P4 ; (c + 0)
3cd8 : a8 __ __ TAY
3cd9 : a5 06 __ LDA WORK + 3 
3cdb : e5 12 __ SBC P5 ; (c + 1)
3cdd : 90 04 __ BCC $3ce3 ; (lmuldiv16s.s7 + 87)
3cdf : 85 06 __ STA WORK + 3 
3ce1 : 84 05 __ STY WORK + 2 
3ce3 : ca __ __ DEX
3ce4 : d0 d9 __ BNE $3cbf ; (lmuldiv16s.s7 + 51)
3ce6 : a5 04 __ LDA WORK + 1 
3ce8 : 2a __ __ ROL
3ce9 : 90 07 __ BCC $3cf2 ; (lmuldiv16s.s7 + 102)
3ceb : 85 1c __ STA ACCU + 1 
3ced : a5 03 __ LDA WORK + 0 
3cef : 18 __ __ CLC
3cf0 : 90 c9 __ BCC $3cbb ; (lmuldiv16s.s7 + 47)
3cf2 : 85 1b __ STA ACCU + 0 
3cf4 : a5 43 __ LDA T1 + 0 
3cf6 : f0 0d __ BEQ $3d05 ; (lmuldiv16s.s3 + 0)
3cf8 : 38 __ __ SEC
3cf9 : a9 00 __ LDA #$00
3cfb : e5 1b __ SBC ACCU + 0 
3cfd : 85 1b __ STA ACCU + 0 
3cff : a9 00 __ LDA #$00
3d01 : e5 1c __ SBC ACCU + 1 
3d03 : 85 1c __ STA ACCU + 1 
.s3:
3d05 : 60 __ __ RTS
--------------------------------------------------------------------
bmu_line: ; bmu_line(const struct Bitmap*,i16,i16,i16,i16,u8,enum LineOp)->void
; 113, "/home/xahmol/oscar64/include/gfx/bitmap.h"
.s4:
3d06 : a5 18 __ LDA P11 ; (op + 0)
3d08 : d0 02 __ BNE $3d0c ; (bmu_line.s6 + 0)
.s5:
3d0a : e6 18 __ INC P11 ; (op + 0)
.s6:
3d0c : 38 __ __ SEC
3d0d : a5 13 __ LDA P6 ; (x1 + 0)
3d0f : e5 0f __ SBC P2 ; (x0 + 0)
3d11 : 85 46 __ STA T2 + 0 
3d13 : a5 14 __ LDA P7 ; (x1 + 1)
3d15 : e5 10 __ SBC P3 ; (x0 + 1)
3d17 : 85 47 __ STA T2 + 1 
3d19 : 10 11 __ BPL $3d2c ; (bmu_line.s7 + 0)
.s52:
3d1b : 38 __ __ SEC
3d1c : a9 00 __ LDA #$00
3d1e : e5 46 __ SBC T2 + 0 
3d20 : 85 46 __ STA T2 + 0 
3d22 : a9 00 __ LDA #$00
3d24 : e5 47 __ SBC T2 + 1 
3d26 : 85 47 __ STA T2 + 1 
3d28 : a9 01 __ LDA #$01
3d2a : d0 02 __ BNE $3d2e ; (bmu_line.s8 + 0)
.s7:
3d2c : a9 00 __ LDA #$00
.s8:
3d2e : 85 51 __ STA T11 + 0 
3d30 : 38 __ __ SEC
3d31 : a5 15 __ LDA P8 ; (y1 + 0)
3d33 : e5 11 __ SBC P4 ; (y0 + 0)
3d35 : 85 43 __ STA T0 + 0 
3d37 : a5 16 __ LDA P9 ; (y1 + 1)
3d39 : e5 12 __ SBC P5 ; (y0 + 1)
3d3b : 85 44 __ STA T0 + 1 
3d3d : 10 11 __ BPL $3d50 ; (bmu_line.s9 + 0)
.s51:
3d3f : 38 __ __ SEC
3d40 : a9 00 __ LDA #$00
3d42 : e5 43 __ SBC T0 + 0 
3d44 : 85 43 __ STA T0 + 0 
3d46 : a9 00 __ LDA #$00
3d48 : e5 44 __ SBC T0 + 1 
3d4a : 85 44 __ STA T0 + 1 
3d4c : a9 01 __ LDA #$01
3d4e : d0 02 __ BNE $3d52 ; (bmu_line.s10 + 0)
.s9:
3d50 : a9 00 __ LDA #$00
.s10:
3d52 : 85 52 __ STA T12 + 0 
3d54 : a5 44 __ LDA T0 + 1 
3d56 : c5 47 __ CMP T2 + 1 
3d58 : d0 04 __ BNE $3d5e ; (bmu_line.s50 + 0)
.s49:
3d5a : a5 43 __ LDA T0 + 0 
3d5c : c5 46 __ CMP T2 + 0 
.s50:
3d5e : b0 06 __ BCS $3d66 ; (bmu_line.s11 + 0)
.s48:
3d60 : a5 47 __ LDA T2 + 1 
3d62 : a6 46 __ LDX T2 + 0 
3d64 : 90 04 __ BCC $3d6a ; (bmu_line.s12 + 0)
.s11:
3d66 : a5 44 __ LDA T0 + 1 
3d68 : a6 43 __ LDX T0 + 0 
.s12:
3d6a : 86 48 __ STX T4 + 0 
3d6c : 85 49 __ STA T4 + 1 
3d6e : 38 __ __ SEC
3d6f : a5 43 __ LDA T0 + 0 
3d71 : e5 46 __ SBC T2 + 0 
3d73 : 85 4a __ STA T5 + 0 
3d75 : a5 44 __ LDA T0 + 1 
3d77 : e5 47 __ SBC T2 + 1 
3d79 : 85 4b __ STA T5 + 1 
3d7b : a5 4a __ LDA T5 + 0 
3d7d : 4a __ __ LSR
3d7e : b0 0c __ BCS $3d8c ; (bmu_line.s47 + 0)
.s13:
3d80 : a5 4b __ LDA T5 + 1 
3d82 : c9 80 __ CMP #$80
3d84 : 6a __ __ ROR
3d85 : 85 4b __ STA T5 + 1 
3d87 : 66 4a __ ROR T5 + 0 
3d89 : 4c 94 3d JMP $3d94 ; (bmu_line.s14 + 0)
.s47:
3d8c : 06 43 __ ASL T0 + 0 
3d8e : 26 44 __ ROL T0 + 1 
3d90 : 06 46 __ ASL T2 + 0 
3d92 : 26 47 __ ROL T2 + 1 
.s14:
3d94 : a0 00 __ LDY #$00
3d96 : b1 0d __ LDA (P0),y ; (bm + 0)
3d98 : 85 4d __ STA T7 + 0 
3d9a : c8 __ __ INY
3d9b : b1 0d __ LDA (P0),y ; (bm + 0)
3d9d : 85 4e __ STA T7 + 1 
3d9f : a0 04 __ LDY #$04
3da1 : b1 0d __ LDA (P0),y ; (bm + 0)
3da3 : aa __ __ TAX
3da4 : 0a __ __ ASL
3da5 : 85 4f __ STA T8 + 0 
3da7 : a9 a0 __ LDA #$a0
3da9 : 8d 00 a4 STA $a400 ; (BLIT_CODE[0] + 0)
3dac : a9 a2 __ LDA #$a2
3dae : 8d 02 a4 STA $a402 ; (BLIT_CODE[0] + 2)
3db1 : a9 a5 __ LDA #$a5
3db3 : 8d 04 a4 STA $a404 ; (BLIT_CODE[0] + 4)
3db6 : a9 0a __ LDA #$0a
3db8 : 8d 05 a4 STA $a405 ; (BLIT_CODE[0] + 5)
3dbb : a9 00 __ LDA #$00
3dbd : 2a __ __ ROL
3dbe : 06 4f __ ASL T8 + 0 
3dc0 : 2a __ __ ROL
3dc1 : 06 4f __ ASL T8 + 0 
3dc3 : 2a __ __ ROL
3dc4 : 85 50 __ STA T8 + 1 
3dc6 : a5 52 __ LDA T12 + 0 
3dc8 : f0 0d __ BEQ $3dd7 ; (bmu_line.s15 + 0)
.s46:
3dca : 38 __ __ SEC
3dcb : a9 00 __ LDA #$00
3dcd : e5 4f __ SBC T8 + 0 
3dcf : 85 4f __ STA T8 + 0 
3dd1 : a9 00 __ LDA #$00
3dd3 : e5 50 __ SBC T8 + 1 
3dd5 : 85 50 __ STA T8 + 1 
.s15:
3dd7 : a5 11 __ LDA P4 ; (y0 + 0)
3dd9 : 29 f8 __ AND #$f8
3ddb : 85 1b __ STA ACCU + 0 
3ddd : a5 12 __ LDA P5 ; (y0 + 1)
3ddf : 85 1c __ STA ACCU + 1 
3de1 : 8a __ __ TXA
3de2 : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
3de5 : 18 __ __ CLC
3de6 : a5 4d __ LDA T7 + 0 
3de8 : 65 1b __ ADC ACCU + 0 
3dea : 85 4d __ STA T7 + 0 
3dec : a5 4e __ LDA T7 + 1 
3dee : 65 1c __ ADC ACCU + 1 
3df0 : aa __ __ TAX
3df1 : a5 0f __ LDA P2 ; (x0 + 0)
3df3 : 29 f8 __ AND #$f8
3df5 : 18 __ __ CLC
3df6 : 65 4d __ ADC T7 + 0 
3df8 : 85 4d __ STA T7 + 0 
3dfa : 8a __ __ TXA
3dfb : 65 10 __ ADC P3 ; (x0 + 1)
3dfd : 85 4e __ STA T7 + 1 
3dff : a5 46 __ LDA T2 + 0 
3e01 : 05 43 __ ORA T0 + 0 
3e03 : 29 80 __ AND #$80
3e05 : 85 4c __ STA T6 + 0 
3e07 : a5 47 __ LDA T2 + 1 
3e09 : 05 44 __ ORA T0 + 1 
3e0b : 05 4c __ ORA T6 + 0 
3e0d : f0 02 __ BEQ $3e11 ; (bmu_line.s56 + 0)
.s55:
3e0f : a9 01 __ LDA #$01
.s56:
3e11 : 85 1c __ STA ACCU + 1 
3e13 : a5 11 __ LDA P4 ; (y0 + 0)
3e15 : 29 07 __ AND #$07
3e17 : 8d 01 a4 STA $a401 ; (BLIT_CODE[0] + 1)
3e1a : a6 48 __ LDX T4 + 0 
3e1c : e8 __ __ INX
3e1d : 8e 03 a4 STX $a403 ; (BLIT_CODE[0] + 3)
3e20 : a5 0f __ LDA P2 ; (x0 + 0)
3e22 : 29 07 __ AND #$07
3e24 : aa __ __ TAX
3e25 : a5 18 __ LDA P11 ; (op + 0)
3e27 : c9 02 __ CMP #$02
3e29 : d0 20 __ BNE $3e4b ; (bmu_line.s16 + 0)
.s45:
3e2b : a9 49 __ LDA #$49
3e2d : 8d 06 a4 STA $a406 ; (BLIT_CODE[0] + 6)
3e30 : a9 ff __ LDA #$ff
3e32 : 8d 07 a4 STA $a407 ; (BLIT_CODE[0] + 7)
3e35 : a9 31 __ LDA #$31
3e37 : 8d 08 a4 STA $a408 ; (BLIT_CODE[0] + 8)
3e3a : a9 03 __ LDA #$03
3e3c : 8d 09 a4 STA $a409 ; (BLIT_CODE[0] + 9)
3e3f : 8d 0b a4 STA $a40b ; (BLIT_CODE[0] + 11)
3e42 : a9 91 __ LDA #$91
3e44 : 8d 0a a4 STA $a40a ; (BLIT_CODE[0] + 10)
3e47 : a9 0c __ LDA #$0c
3e49 : d0 21 __ BNE $3e6c ; (bmu_line.s19 + 0)
.s16:
3e4b : b0 03 __ BCS $3e50 ; (bmu_line.s17 + 0)
3e4d : 4c 38 41 JMP $4138 ; (bmu_line.s42 + 0)
.s17:
3e50 : c9 03 __ CMP #$03
3e52 : f0 04 __ BEQ $3e58 ; (bmu_line.s40 + 0)
.s18:
3e54 : a9 06 __ LDA #$06
3e56 : d0 14 __ BNE $3e6c ; (bmu_line.s19 + 0)
.s40:
3e58 : a9 51 __ LDA #$51
.s41:
3e5a : 8d 06 a4 STA $a406 ; (BLIT_CODE[0] + 6)
3e5d : a9 03 __ LDA #$03
3e5f : 8d 07 a4 STA $a407 ; (BLIT_CODE[0] + 7)
3e62 : 8d 09 a4 STA $a409 ; (BLIT_CODE[0] + 9)
3e65 : a9 91 __ LDA #$91
3e67 : 8d 08 a4 STA $a408 ; (BLIT_CODE[0] + 8)
3e6a : a9 0a __ LDA #$0a
.s19:
3e6c : 85 45 __ STA T1 + 0 
3e6e : a5 43 __ LDA T0 + 0 
3e70 : 05 44 __ ORA T0 + 1 
3e72 : f0 03 __ BEQ $3e77 ; (bmu_line.s20 + 0)
3e74 : 4c 46 3f JMP $3f46 ; (bmu_line.s28 + 0)
.s20:
3e77 : a5 46 __ LDA T2 + 0 
3e79 : 05 47 __ ORA T2 + 1 
3e7b : f0 75 __ BEQ $3ef2 ; (bmu_line.s21 + 0)
.s22:
3e7d : a9 0a __ LDA #$0a
3e7f : a4 45 __ LDY T1 + 0 
3e81 : 99 01 a4 STA $a401,y ; (BLIT_CODE[0] + 1)
3e84 : 99 05 a4 STA $a405,y ; (BLIT_CODE[0] + 5)
3e87 : a9 90 __ LDA #$90
3e89 : 99 02 a4 STA $a402,y ; (BLIT_CODE[0] + 2)
3e8c : a9 0c __ LDA #$0c
3e8e : 99 03 a4 STA $a403,y ; (BLIT_CODE[0] + 3)
3e91 : a9 a5 __ LDA #$a5
3e93 : 99 06 a4 STA $a406,y ; (BLIT_CODE[0] + 6)
3e96 : a9 03 __ LDA #$03
3e98 : 99 07 a4 STA $a407,y ; (BLIT_CODE[0] + 7)
3e9b : a9 69 __ LDA #$69
3e9d : 99 08 a4 STA $a408,y ; (BLIT_CODE[0] + 8)
3ea0 : a5 51 __ LDA T11 + 0 
3ea2 : f0 09 __ BEQ $3ead ; (bmu_line.s23 + 0)
.s27:
3ea4 : a9 06 __ LDA #$06
3ea6 : 99 00 a4 STA $a400,y ; (BLIT_CODE[0] + 0)
3ea9 : a9 26 __ LDA #$26
3eab : d0 07 __ BNE $3eb4 ; (bmu_line.s53 + 0)
.s23:
3ead : a9 46 __ LDA #$46
3eaf : 99 00 a4 STA $a400,y ; (BLIT_CODE[0] + 0)
3eb2 : a9 66 __ LDA #$66
.s53:
3eb4 : 99 04 a4 STA $a404,y ; (BLIT_CODE[0] + 4)
3eb7 : a9 02 __ LDA #$02
3eb9 : 99 0b a4 STA $a40b,y ; (BLIT_CODE[0] + 11)
3ebc : a5 51 __ LDA T11 + 0 
3ebe : f0 0e __ BEQ $3ece ; (bmu_line.s24 + 0)
.s26:
3ec0 : a9 f8 __ LDA #$f8
3ec2 : 99 09 a4 STA $a409,y ; (BLIT_CODE[0] + 9)
3ec5 : a9 b0 __ LDA #$b0
3ec7 : 99 0a a4 STA $a40a,y ; (BLIT_CODE[0] + 10)
3eca : a9 c6 __ LDA #$c6
3ecc : d0 0c __ BNE $3eda ; (bmu_line.s25 + 0)
.s24:
3ece : a9 08 __ LDA #$08
3ed0 : 99 09 a4 STA $a409,y ; (BLIT_CODE[0] + 9)
3ed3 : a9 90 __ LDA #$90
3ed5 : 99 0a a4 STA $a40a,y ; (BLIT_CODE[0] + 10)
3ed8 : a9 e6 __ LDA #$e6
.s25:
3eda : 99 0c a4 STA $a40c,y ; (BLIT_CODE[0] + 12)
3edd : a9 04 __ LDA #$04
3edf : 99 0d a4 STA $a40d,y ; (BLIT_CODE[0] + 13)
3ee2 : a9 85 __ LDA #$85
3ee4 : 99 0e a4 STA $a40e,y ; (BLIT_CODE[0] + 14)
3ee7 : a9 03 __ LDA #$03
3ee9 : 99 0f a4 STA $a40f,y ; (BLIT_CODE[0] + 15)
3eec : 98 __ __ TYA
3eed : 18 __ __ CLC
3eee : 69 10 __ ADC #$10
3ef0 : 85 45 __ STA T1 + 0 
.s21:
3ef2 : a9 ca __ LDA #$ca
3ef4 : a4 45 __ LDY T1 + 0 
3ef6 : 84 43 __ STY T0 + 0 
3ef8 : 99 00 a4 STA $a400,y ; (BLIT_CODE[0] + 0)
3efb : a9 d0 __ LDA #$d0
3efd : 99 01 a4 STA $a401,y ; (BLIT_CODE[0] + 1)
3f00 : a9 c6 __ LDA #$c6
3f02 : 99 03 a4 STA $a403,y ; (BLIT_CODE[0] + 3)
3f05 : a9 0b __ LDA #$0b
3f07 : 99 04 a4 STA $a404,y ; (BLIT_CODE[0] + 4)
3f0a : a9 10 __ LDA #$10
3f0c : 99 05 a4 STA $a405,y ; (BLIT_CODE[0] + 5)
3f0f : a9 60 __ LDA #$60
3f11 : 99 07 a4 STA $a407,y ; (BLIT_CODE[0] + 7)
3f14 : e6 43 __ INC T0 + 0 
3f16 : 38 __ __ SEC
3f17 : a9 02 __ LDA #$02
3f19 : e5 43 __ SBC T0 + 0 
3f1b : 99 02 a4 STA $a402,y ; (BLIT_CODE[0] + 2)
3f1e : 38 __ __ SEC
3f1f : a9 fe __ LDA #$fe
3f21 : e5 43 __ SBC T0 + 0 
3f23 : 99 06 a4 STA $a406,y ; (BLIT_CODE[0] + 6)
3f26 : a5 49 __ LDA T4 + 1 
3f28 : 85 0b __ STA WORK + 8 
3f2a : a5 4d __ LDA T7 + 0 
3f2c : 85 03 __ STA WORK + 0 
3f2e : a5 4e __ LDA T7 + 1 
3f30 : 85 04 __ STA WORK + 1 
3f32 : a5 4a __ LDA T5 + 0 
3f34 : 85 05 __ STA WORK + 2 
3f36 : a5 4b __ LDA T5 + 1 
3f38 : 85 06 __ STA WORK + 3 
3f3a : bd e8 8c LDA $8ce8,x ; (bitshift[0] + 32)
3f3d : 85 0a __ STA WORK + 7 
3f3f : a9 ff __ LDA #$ff
3f41 : 85 07 __ STA WORK + 4 
3f43 : 4c 00 a4 JMP $a400 ; (BLIT_CODE[0] + 0)
.s28:
3f46 : a5 46 __ LDA T2 + 0 
3f48 : 05 47 __ ORA T2 + 1 
3f4a : c9 01 __ CMP #$01
3f4c : a9 00 __ LDA #$00
3f4e : 6a __ __ ROR
3f4f : 85 1d __ STA ACCU + 2 
3f51 : f0 03 __ BEQ $3f56 ; (bmu_line.s29 + 0)
3f53 : 4c f1 40 JMP $40f1 ; (bmu_line.s35 + 0)
.s29:
3f56 : a9 00 __ LDA #$00
3f58 : 85 46 __ STA T2 + 0 
3f5a : 85 47 __ STA T2 + 1 
3f5c : 85 1b __ STA ACCU + 0 
3f5e : a5 52 __ LDA T12 + 0 
3f60 : f0 03 __ BEQ $3f65 ; (bmu_line.s30 + 0)
3f62 : 4c 86 40 JMP $4086 ; (bmu_line.s34 + 0)
.s30:
3f65 : a9 c8 __ LDA #$c8
3f67 : a4 45 __ LDY T1 + 0 
3f69 : 99 00 a4 STA $a400,y ; (BLIT_CODE[0] + 0)
3f6c : a9 c0 __ LDA #$c0
3f6e : 99 01 a4 STA $a401,y ; (BLIT_CODE[0] + 1)
3f71 : a9 08 __ LDA #$08
3f73 : 99 02 a4 STA $a402,y ; (BLIT_CODE[0] + 2)
3f76 : a9 d0 __ LDA #$d0
3f78 : 99 03 a4 STA $a403,y ; (BLIT_CODE[0] + 3)
3f7b : a9 a0 __ LDA #$a0
3f7d : 99 05 a4 STA $a405,y ; (BLIT_CODE[0] + 5)
3f80 : a9 00 __ LDA #$00
3f82 : 99 06 a4 STA $a406,y ; (BLIT_CODE[0] + 6)
3f85 : a9 a5 __ LDA #$a5
3f87 : 99 07 a4 STA $a407,y ; (BLIT_CODE[0] + 7)
3f8a : 99 0d a4 STA $a40d,y ; (BLIT_CODE[0] + 13)
3f8d : a9 03 __ LDA #$03
3f8f : 99 08 a4 STA $a408,y ; (BLIT_CODE[0] + 8)
3f92 : 99 0c a4 STA $a40c,y ; (BLIT_CODE[0] + 12)
3f95 : a9 69 __ LDA #$69
3f97 : 99 09 a4 STA $a409,y ; (BLIT_CODE[0] + 9)
3f9a : 99 0f a4 STA $a40f,y ; (BLIT_CODE[0] + 15)
3f9d : a9 85 __ LDA #$85
3f9f : 99 0b a4 STA $a40b,y ; (BLIT_CODE[0] + 11)
3fa2 : 99 11 a4 STA $a411,y ; (BLIT_CODE[0] + 17)
3fa5 : a9 04 __ LDA #$04
3fa7 : 99 0e a4 STA $a40e,y ; (BLIT_CODE[0] + 14)
3faa : 99 12 a4 STA $a412,y ; (BLIT_CODE[0] + 18)
3fad : a5 1b __ LDA ACCU + 0 
3faf : f0 04 __ BEQ $3fb5 ; (bmu_line.s60 + 0)
.s61:
3fb1 : a9 10 __ LDA #$10
3fb3 : 90 02 __ BCC $3fb7 ; (bmu_line.s62 + 0)
.s60:
3fb5 : a9 0e __ LDA #$0e
.s62:
3fb7 : 99 04 a4 STA $a404,y ; (BLIT_CODE[0] + 4)
3fba : 38 __ __ SEC
3fbb : a5 4f __ LDA T8 + 0 
3fbd : e9 01 __ SBC #$01
3fbf : 99 0a a4 STA $a40a,y ; (BLIT_CODE[0] + 10)
3fc2 : a5 50 __ LDA T8 + 1 
3fc4 : e9 00 __ SBC #$00
3fc6 : 99 10 a4 STA $a410,y ; (BLIT_CODE[0] + 16)
3fc9 : 98 __ __ TYA
3fca : 18 __ __ CLC
3fcb : 69 13 __ ADC #$13
3fcd : 85 45 __ STA T1 + 0 
3fcf : a8 __ __ TAY
3fd0 : 24 1d __ BIT ACCU + 2 
3fd2 : 30 03 __ BMI $3fd7 ; (bmu_line.s31 + 0)
3fd4 : 4c 77 3e JMP $3e77 ; (bmu_line.s20 + 0)
.s31:
3fd7 : a9 a5 __ LDA #$a5
3fd9 : 99 00 a4 STA $a400,y ; (BLIT_CODE[0] + 0)
3fdc : a9 05 __ LDA #$05
3fde : 99 01 a4 STA $a401,y ; (BLIT_CODE[0] + 1)
3fe1 : 99 06 a4 STA $a406,y ; (BLIT_CODE[0] + 6)
3fe4 : a9 38 __ LDA #$38
3fe6 : 99 02 a4 STA $a402,y ; (BLIT_CODE[0] + 2)
3fe9 : a9 e9 __ LDA #$e9
3feb : 99 03 a4 STA $a403,y ; (BLIT_CODE[0] + 3)
3fee : a9 85 __ LDA #$85
3ff0 : 99 05 a4 STA $a405,y ; (BLIT_CODE[0] + 5)
3ff3 : a5 46 __ LDA T2 + 0 
3ff5 : 99 04 a4 STA $a404,y ; (BLIT_CODE[0] + 4)
3ff8 : a5 1c __ LDA ACCU + 1 
3ffa : d0 2a __ BNE $4026 ; (bmu_line.s33 + 0)
.s32:
3ffc : a9 10 __ LDA #$10
3ffe : 99 07 a4 STA $a407,y ; (BLIT_CODE[0] + 7)
4001 : a9 15 __ LDA #$15
4003 : 99 08 a4 STA $a408,y ; (BLIT_CODE[0] + 8)
4006 : a9 18 __ LDA #$18
4008 : 99 09 a4 STA $a409,y ; (BLIT_CODE[0] + 9)
400b : a9 69 __ LDA #$69
400d : 99 0a a4 STA $a40a,y ; (BLIT_CODE[0] + 10)
4010 : a5 43 __ LDA T0 + 0 
4012 : 99 0b a4 STA $a40b,y ; (BLIT_CODE[0] + 11)
4015 : a9 85 __ LDA #$85
4017 : 99 0c a4 STA $a40c,y ; (BLIT_CODE[0] + 12)
401a : a9 05 __ LDA #$05
401c : 99 0d a4 STA $a40d,y ; (BLIT_CODE[0] + 13)
401f : 98 __ __ TYA
4020 : 18 __ __ CLC
4021 : 69 0e __ ADC #$0e
4023 : 4c 81 40 JMP $4081 ; (bmu_line.s54 + 0)
.s33:
4026 : a9 a5 __ LDA #$a5
4028 : 99 07 a4 STA $a407,y ; (BLIT_CODE[0] + 7)
402b : 99 10 a4 STA $a410,y ; (BLIT_CODE[0] + 16)
402e : 99 16 a4 STA $a416,y ; (BLIT_CODE[0] + 22)
4031 : a9 06 __ LDA #$06
4033 : 99 08 a4 STA $a408,y ; (BLIT_CODE[0] + 8)
4036 : 99 0c a4 STA $a40c,y ; (BLIT_CODE[0] + 12)
4039 : 99 17 a4 STA $a417,y ; (BLIT_CODE[0] + 23)
403c : 99 1b a4 STA $a41b,y ; (BLIT_CODE[0] + 27)
403f : a9 e9 __ LDA #$e9
4041 : 99 09 a4 STA $a409,y ; (BLIT_CODE[0] + 9)
4044 : a9 85 __ LDA #$85
4046 : 99 0b a4 STA $a40b,y ; (BLIT_CODE[0] + 11)
4049 : 99 14 a4 STA $a414,y ; (BLIT_CODE[0] + 20)
404c : 99 1a a4 STA $a41a,y ; (BLIT_CODE[0] + 26)
404f : a9 10 __ LDA #$10
4051 : 99 0d a4 STA $a40d,y ; (BLIT_CODE[0] + 13)
4054 : a9 1d __ LDA #$1d
4056 : 99 0e a4 STA $a40e,y ; (BLIT_CODE[0] + 14)
4059 : a9 18 __ LDA #$18
405b : 99 0f a4 STA $a40f,y ; (BLIT_CODE[0] + 15)
405e : a9 05 __ LDA #$05
4060 : 99 11 a4 STA $a411,y ; (BLIT_CODE[0] + 17)
4063 : 99 15 a4 STA $a415,y ; (BLIT_CODE[0] + 21)
4066 : a9 69 __ LDA #$69
4068 : 99 12 a4 STA $a412,y ; (BLIT_CODE[0] + 18)
406b : 99 18 a4 STA $a418,y ; (BLIT_CODE[0] + 24)
406e : a5 43 __ LDA T0 + 0 
4070 : 99 13 a4 STA $a413,y ; (BLIT_CODE[0] + 19)
4073 : a5 47 __ LDA T2 + 1 
4075 : 99 0a a4 STA $a40a,y ; (BLIT_CODE[0] + 10)
4078 : a5 44 __ LDA T0 + 1 
407a : 99 19 a4 STA $a419,y ; (BLIT_CODE[0] + 25)
407d : 98 __ __ TYA
407e : 18 __ __ CLC
407f : 69 1c __ ADC #$1c
.s54:
4081 : 85 45 __ STA T1 + 0 
4083 : 4c 7d 3e JMP $3e7d ; (bmu_line.s22 + 0)
.s34:
4086 : a9 88 __ LDA #$88
4088 : a4 45 __ LDY T1 + 0 
408a : 99 00 a4 STA $a400,y ; (BLIT_CODE[0] + 0)
408d : a9 10 __ LDA #$10
408f : 99 01 a4 STA $a401,y ; (BLIT_CODE[0] + 1)
4092 : a9 18 __ LDA #$18
4094 : 99 03 a4 STA $a403,y ; (BLIT_CODE[0] + 3)
4097 : a9 a0 __ LDA #$a0
4099 : 99 04 a4 STA $a404,y ; (BLIT_CODE[0] + 4)
409c : a9 07 __ LDA #$07
409e : 99 05 a4 STA $a405,y ; (BLIT_CODE[0] + 5)
40a1 : a9 a5 __ LDA #$a5
40a3 : 99 06 a4 STA $a406,y ; (BLIT_CODE[0] + 6)
40a6 : 99 0c a4 STA $a40c,y ; (BLIT_CODE[0] + 12)
40a9 : a9 03 __ LDA #$03
40ab : 99 07 a4 STA $a407,y ; (BLIT_CODE[0] + 7)
40ae : 99 0b a4 STA $a40b,y ; (BLIT_CODE[0] + 11)
40b1 : a9 69 __ LDA #$69
40b3 : 99 08 a4 STA $a408,y ; (BLIT_CODE[0] + 8)
40b6 : 99 0e a4 STA $a40e,y ; (BLIT_CODE[0] + 14)
40b9 : a9 85 __ LDA #$85
40bb : 99 0a a4 STA $a40a,y ; (BLIT_CODE[0] + 10)
40be : 99 10 a4 STA $a410,y ; (BLIT_CODE[0] + 16)
40c1 : a9 04 __ LDA #$04
40c3 : 99 0d a4 STA $a40d,y ; (BLIT_CODE[0] + 13)
40c6 : 99 11 a4 STA $a411,y ; (BLIT_CODE[0] + 17)
40c9 : a5 1b __ LDA ACCU + 0 
40cb : f0 04 __ BEQ $40d1 ; (bmu_line.s57 + 0)
.s58:
40cd : a9 11 __ LDA #$11
40cf : 90 02 __ BCC $40d3 ; (bmu_line.s59 + 0)
.s57:
40d1 : a9 0f __ LDA #$0f
.s59:
40d3 : 99 02 a4 STA $a402,y ; (BLIT_CODE[0] + 2)
40d6 : a5 4f __ LDA T8 + 0 
40d8 : 99 09 a4 STA $a409,y ; (BLIT_CODE[0] + 9)
40db : a5 50 __ LDA T8 + 1 
40dd : 99 0f a4 STA $a40f,y ; (BLIT_CODE[0] + 15)
40e0 : 98 __ __ TYA
40e1 : 18 __ __ CLC
40e2 : 69 12 __ ADC #$12
40e4 : 85 45 __ STA T1 + 0 
40e6 : a8 __ __ TAY
40e7 : 24 1d __ BIT ACCU + 2 
40e9 : 10 03 __ BPL $40ee ; (bmu_line.s59 + 27)
40eb : 4c d7 3f JMP $3fd7 ; (bmu_line.s31 + 0)
40ee : 4c 77 3e JMP $3e77 ; (bmu_line.s20 + 0)
.s35:
40f1 : a9 a5 __ LDA #$a5
40f3 : a4 45 __ LDY T1 + 0 
40f5 : 99 00 a4 STA $a400,y ; (BLIT_CODE[0] + 0)
40f8 : a9 30 __ LDA #$30
40fa : 99 02 a4 STA $a402,y ; (BLIT_CODE[0] + 2)
40fd : a5 1c __ LDA ACCU + 1 
40ff : 69 05 __ ADC #$05
4101 : 99 01 a4 STA $a401,y ; (BLIT_CODE[0] + 1)
4104 : a5 1c __ LDA ACCU + 1 
4106 : d0 26 __ BNE $412e ; (bmu_line.s39 + 0)
.s36:
4108 : a9 1b __ LDA #$1b
410a : 85 1b __ STA ACCU + 0 
410c : a5 52 __ LDA T12 + 0 
410e : d0 02 __ BNE $4112 ; (bmu_line.s38 + 0)
.s37:
4110 : e6 1b __ INC ACCU + 0 
.s38:
4112 : a5 1b __ LDA ACCU + 0 
4114 : 99 03 a4 STA $a403,y ; (BLIT_CODE[0] + 3)
4117 : 98 __ __ TYA
4118 : 18 __ __ CLC
4119 : 69 04 __ ADC #$04
411b : 85 45 __ STA T1 + 0 
411d : a9 00 __ LDA #$00
411f : c5 1c __ CMP ACCU + 1 
4121 : 2a __ __ ROL
4122 : 85 1b __ STA ACCU + 0 
4124 : a5 52 __ LDA T12 + 0 
4126 : f0 03 __ BEQ $412b ; (bmu_line.s38 + 25)
4128 : 4c 86 40 JMP $4086 ; (bmu_line.s34 + 0)
412b : 4c 65 3f JMP $3f65 ; (bmu_line.s30 + 0)
.s39:
412e : a9 21 __ LDA #$21
4130 : 85 1b __ STA ACCU + 0 
4132 : a5 52 __ LDA T12 + 0 
4134 : d0 dc __ BNE $4112 ; (bmu_line.s38 + 0)
4136 : f0 d8 __ BEQ $4110 ; (bmu_line.s37 + 0)
.s42:
4138 : a8 __ __ TAY
4139 : f0 05 __ BEQ $4140 ; (bmu_line.s43 + 0)
.s44:
413b : a9 11 __ LDA #$11
413d : 4c 5a 3e JMP $3e5a ; (bmu_line.s41 + 0)
.s43:
4140 : a9 06 __ LDA #$06
4142 : 8d 06 a4 STA $a406 ; (BLIT_CODE[0] + 6)
4145 : 8d 09 a4 STA $a409 ; (BLIT_CODE[0] + 9)
4148 : a9 07 __ LDA #$07
414a : 8d 07 a4 STA $a407 ; (BLIT_CODE[0] + 7)
414d : 8d 0b a4 STA $a40b ; (BLIT_CODE[0] + 11)
4150 : a9 90 __ LDA #$90
4152 : 8d 08 a4 STA $a408 ; (BLIT_CODE[0] + 8)
4155 : a9 e6 __ LDA #$e6
4157 : 8d 0a a4 STA $a40a ; (BLIT_CODE[0] + 10)
415a : a9 11 __ LDA #$11
415c : 8d 0c a4 STA $a40c ; (BLIT_CODE[0] + 12)
415f : a9 03 __ LDA #$03
4161 : 8d 0d a4 STA $a40d ; (BLIT_CODE[0] + 13)
4164 : 8d 13 a4 STA $a413 ; (BLIT_CODE[0] + 19)
4167 : 8d 15 a4 STA $a415 ; (BLIT_CODE[0] + 21)
416a : a9 d0 __ LDA #$d0
416c : 8d 0e a4 STA $a40e ; (BLIT_CODE[0] + 14)
416f : a9 04 __ LDA #$04
4171 : 8d 0f a4 STA $a40f ; (BLIT_CODE[0] + 15)
4174 : a9 49 __ LDA #$49
4176 : 8d 10 a4 STA $a410 ; (BLIT_CODE[0] + 16)
4179 : a9 ff __ LDA #$ff
417b : 8d 11 a4 STA $a411 ; (BLIT_CODE[0] + 17)
417e : a9 31 __ LDA #$31
4180 : 8d 12 a4 STA $a412 ; (BLIT_CODE[0] + 18)
4183 : a9 91 __ LDA #$91
4185 : 8d 14 a4 STA $a414 ; (BLIT_CODE[0] + 20)
4188 : a9 16 __ LDA #$16
418a : 4c 6c 3e JMP $3e6c ; (bmu_line.s19 + 0)
--------------------------------------------------------------------
engine_update: ; engine_update(u8)->void
; 359, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s4:
418d : 0a __ __ ASL
418e : aa __ __ TAX
418f : bd 00 81 LDA $8100,x ; (sid_freq[0] + 0)
4192 : 8d 00 d4 STA $d400 
4195 : bd 01 81 LDA $8101,x ; (sid_freq[0] + 1)
4198 : 85 1c __ STA ACCU + 1 
419a : 8d 01 d4 STA $d401 
419d : bd 00 81 LDA $8100,x ; (sid_freq[0] + 0)
41a0 : 0a __ __ ASL
41a1 : 26 1c __ ROL ACCU + 1 
41a3 : 8d 07 d4 STA $d407 
41a6 : a5 1c __ LDA ACCU + 1 
41a8 : 8d 08 d4 STA $d408 
.s3:
41ab : 60 __ __ RTS
--------------------------------------------------------------------
modplay_start: ; modplay_start()->void
; 239, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s4:
41ac : ad c0 9f LDA $9fc0 ; (modplay.song_length + 0)
41af : d0 01 __ BNE $41b2 ; (modplay_start.s5 + 0)
.s3:
41b1 : 60 __ __ RTS
.s5:
41b2 : a9 00 __ LDA #$00
41b4 : 8d fe 80 STA $80fe ; (mod_paused + 0)
41b7 : 8d 43 a0 STA $a043 ; (modplay.order_pos + 0)
41ba : 85 43 __ STA T0 + 0 
41bc : 8d 45 a0 STA $a045 ; (modplay.row + 0)
41bf : 8d 46 a0 STA $a046 ; (modplay.tick + 0)
41c2 : 8d 49 a0 STA $a049 ; (modplay.pattern_delay + 0)
41c5 : 8d 4e a0 STA $a04e ; (modplay.skip_row_advance + 0)
41c8 : ad c3 9f LDA $9fc3 ; (modplay.order_table[0] + 0)
41cb : 8d 44 a0 STA $a044 ; (modplay.pattern_num + 0)
41ce : a9 06 __ LDA #$06
41d0 : 8d 47 a0 STA $a047 ; (modplay.ticks_per_row + 0)
41d3 : a9 7d __ LDA #$7d
41d5 : 8d 48 a0 STA $a048 ; (modplay.bpm + 0)
41d8 : a9 01 __ LDA #$01
41da : 8d 4c a0 STA $a04c ; (modplay.active + 0)
41dd : ad 4b a0 LDA $a04b ; (modplay.stereo + 0)
41e0 : d0 17 __ BNE $41f9 ; (modplay_start.l10 + 0)
.s7:
41e2 : a9 80 __ LDA #$80
41e4 : a6 43 __ LDX T0 + 0 
41e6 : bc 8d 7f LDY $7f8d,x ; (__multab50L + 0)
.l8:
41e9 : 99 a4 a2 STA $a2a4,y ; (modplay.channel[0].pan + 0)
41ec : e6 43 __ INC T0 + 0 
41ee : a5 43 __ LDA T0 + 0 
41f0 : c9 04 __ CMP #$04
41f2 : b0 1d __ BCS $4211 ; (modplay_start.s9 + 0)
.s6:
41f4 : ad 4b a0 LDA $a04b ; (modplay.stereo + 0)
41f7 : f0 e9 __ BEQ $41e2 ; (modplay_start.s7 + 0)
.l10:
41f9 : a5 43 __ LDA T0 + 0 
41fb : f0 04 __ BEQ $4201 ; (modplay_start.s11 + 0)
.s13:
41fd : c9 03 __ CMP #$03
41ff : d0 04 __ BNE $4205 ; (modplay_start.s14 + 0)
.s11:
4201 : a2 00 __ LDX #$00
4203 : f0 02 __ BEQ $4207 ; (modplay_start.s12 + 0)
.s14:
4205 : a2 ff __ LDX #$ff
.s12:
4207 : a4 43 __ LDY T0 + 0 
4209 : b9 8d 7f LDA $7f8d,y ; (__multab50L + 0)
420c : a8 __ __ TAY
420d : 8a __ __ TXA
420e : 4c e9 41 JMP $41e9 ; (modplay_start.l8 + 0)
.s9:
4211 : ad 48 a0 LDA $a048 ; (modplay.bpm + 0)
4214 : 20 51 42 JSR $4251 ; (bpm_to_timer.s4 + 0)
4217 : a5 1b __ LDA ACCU + 0 
4219 : 85 43 __ STA T0 + 0 
421b : a5 1c __ LDA ACCU + 1 
421d : 85 44 __ STA T0 + 1 
421f : 78 __ __ SEI
4220 : ad 14 03 LDA $0314 
4223 : 8d fe 83 STA $83fe ; (mod_saved_irq[0] + 0)
4226 : ad 15 03 LDA $0315 
4229 : 8d ff 83 STA $83ff ; (mod_saved_irq[0] + 1)
422c : a9 7f __ LDA #$7f
422e : 8d 0d dc STA $dc0d 
4231 : a5 43 __ LDA T0 + 0 
4233 : 8d 04 dc STA $dc04 
4236 : a5 44 __ LDA T0 + 1 
4238 : 8d 05 dc STA $dc05 
423b : a9 4c __ LDA #$4c
423d : 8d 14 03 STA $0314 
4240 : a9 43 __ LDA #$43
4242 : 8d 15 03 STA $0315 
4245 : a9 81 __ LDA #$81
4247 : 8d 0d dc STA $dc0d 
424a : a9 01 __ LDA #$01
424c : 8d 0e dc STA $dc0e 
424f : 58 __ __ CLI
4250 : 60 __ __ RTS
--------------------------------------------------------------------
bpm_to_timer: ; bpm_to_timer(u8)->u16
;  76, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4251 : 85 03 __ STA WORK + 0 
4253 : aa __ __ TAX
4254 : d0 09 __ BNE $425f ; (bpm_to_timer.s6 + 0)
.s5:
4256 : a9 f8 __ LDA #$f8
4258 : 85 1b __ STA ACCU + 0 
425a : a9 4c __ LDA #$4c
425c : 85 1c __ STA ACCU + 1 
.s3:
425e : 60 __ __ RTS
.s6:
425f : a9 00 __ LDA #$00
4261 : 85 1e __ STA ACCU + 3 
4263 : 85 04 __ STA WORK + 1 
4265 : 85 05 __ STA WORK + 2 
4267 : 85 06 __ STA WORK + 3 
4269 : a9 90 __ LDA #$90
426b : 85 1b __ STA ACCU + 0 
426d : a9 95 __ LDA #$95
426f : 85 1c __ STA ACCU + 1 
4271 : a9 25 __ LDA #$25
4273 : 85 1d __ STA ACCU + 2 
--------------------------------------------------------------------
divmod32: ; divmod32
4275 : 84 02 __ STY $02 
4277 : a0 20 __ LDY #$20
4279 : a9 00 __ LDA #$00
427b : 85 07 __ STA WORK + 4 
427d : 85 08 __ STA WORK + 5 
427f : 85 09 __ STA WORK + 6 
4281 : 85 0a __ STA WORK + 7 
4283 : a5 05 __ LDA WORK + 2 
4285 : 05 06 __ ORA WORK + 3 
4287 : d0 78 __ BNE $4301 ; (divmod32 + 140)
4289 : a5 04 __ LDA WORK + 1 
428b : d0 27 __ BNE $42b4 ; (divmod32 + 63)
428d : 18 __ __ CLC
428e : 26 1b __ ROL ACCU + 0 
4290 : 26 1c __ ROL ACCU + 1 
4292 : 26 1d __ ROL ACCU + 2 
4294 : 26 1e __ ROL ACCU + 3 
4296 : 2a __ __ ROL
4297 : 90 05 __ BCC $429e ; (divmod32 + 41)
4299 : e5 03 __ SBC WORK + 0 
429b : 38 __ __ SEC
429c : b0 06 __ BCS $42a4 ; (divmod32 + 47)
429e : c5 03 __ CMP WORK + 0 
42a0 : 90 02 __ BCC $42a4 ; (divmod32 + 47)
42a2 : e5 03 __ SBC WORK + 0 
42a4 : 88 __ __ DEY
42a5 : d0 e7 __ BNE $428e ; (divmod32 + 25)
42a7 : 85 07 __ STA WORK + 4 
42a9 : 26 1b __ ROL ACCU + 0 
42ab : 26 1c __ ROL ACCU + 1 
42ad : 26 1d __ ROL ACCU + 2 
42af : 26 1e __ ROL ACCU + 3 
42b1 : a4 02 __ LDY $02 
42b3 : 60 __ __ RTS
42b4 : a5 1e __ LDA ACCU + 3 
42b6 : d0 10 __ BNE $42c8 ; (divmod32 + 83)
42b8 : a6 1d __ LDX ACCU + 2 
42ba : 86 1e __ STX ACCU + 3 
42bc : a6 1c __ LDX ACCU + 1 
42be : 86 1d __ STX ACCU + 2 
42c0 : a6 1b __ LDX ACCU + 0 
42c2 : 86 1c __ STX ACCU + 1 
42c4 : 85 1b __ STA ACCU + 0 
42c6 : a0 18 __ LDY #$18
42c8 : 18 __ __ CLC
42c9 : 26 1b __ ROL ACCU + 0 
42cb : 26 1c __ ROL ACCU + 1 
42cd : 26 1d __ ROL ACCU + 2 
42cf : 26 1e __ ROL ACCU + 3 
42d1 : 26 07 __ ROL WORK + 4 
42d3 : 26 08 __ ROL WORK + 5 
42d5 : 90 0c __ BCC $42e3 ; (divmod32 + 110)
42d7 : a5 07 __ LDA WORK + 4 
42d9 : e5 03 __ SBC WORK + 0 
42db : aa __ __ TAX
42dc : a5 08 __ LDA WORK + 5 
42de : e5 04 __ SBC WORK + 1 
42e0 : 38 __ __ SEC
42e1 : b0 0c __ BCS $42ef ; (divmod32 + 122)
42e3 : 38 __ __ SEC
42e4 : a5 07 __ LDA WORK + 4 
42e6 : e5 03 __ SBC WORK + 0 
42e8 : aa __ __ TAX
42e9 : a5 08 __ LDA WORK + 5 
42eb : e5 04 __ SBC WORK + 1 
42ed : 90 04 __ BCC $42f3 ; (divmod32 + 126)
42ef : 86 07 __ STX WORK + 4 
42f1 : 85 08 __ STA WORK + 5 
42f3 : 88 __ __ DEY
42f4 : d0 d3 __ BNE $42c9 ; (divmod32 + 84)
42f6 : 26 1b __ ROL ACCU + 0 
42f8 : 26 1c __ ROL ACCU + 1 
42fa : 26 1d __ ROL ACCU + 2 
42fc : 26 1e __ ROL ACCU + 3 
42fe : a4 02 __ LDY $02 
4300 : 60 __ __ RTS
4301 : a0 10 __ LDY #$10
4303 : a5 1e __ LDA ACCU + 3 
4305 : 85 08 __ STA WORK + 5 
4307 : a5 1d __ LDA ACCU + 2 
4309 : 85 07 __ STA WORK + 4 
430b : a9 00 __ LDA #$00
430d : 85 1d __ STA ACCU + 2 
430f : 85 1e __ STA ACCU + 3 
4311 : 18 __ __ CLC
4312 : 26 1b __ ROL ACCU + 0 
4314 : 26 1c __ ROL ACCU + 1 
4316 : 26 07 __ ROL WORK + 4 
4318 : 26 08 __ ROL WORK + 5 
431a : 26 09 __ ROL WORK + 6 
431c : 26 0a __ ROL WORK + 7 
431e : a5 07 __ LDA WORK + 4 
4320 : c5 03 __ CMP WORK + 0 
4322 : a5 08 __ LDA WORK + 5 
4324 : e5 04 __ SBC WORK + 1 
4326 : a5 09 __ LDA WORK + 6 
4328 : e5 05 __ SBC WORK + 2 
432a : aa __ __ TAX
432b : a5 0a __ LDA WORK + 7 
432d : e5 06 __ SBC WORK + 3 
432f : 90 11 __ BCC $4342 ; (divmod32 + 205)
4331 : 86 09 __ STX WORK + 6 
4333 : 85 0a __ STA WORK + 7 
4335 : a5 07 __ LDA WORK + 4 
4337 : e5 03 __ SBC WORK + 0 
4339 : 85 07 __ STA WORK + 4 
433b : a5 08 __ LDA WORK + 5 
433d : e5 04 __ SBC WORK + 1 
433f : 85 08 __ STA WORK + 5 
4341 : 38 __ __ SEC
4342 : 88 __ __ DEY
4343 : d0 cd __ BNE $4312 ; (divmod32 + 157)
4345 : 26 1b __ ROL ACCU + 0 
4347 : 26 1c __ ROL ACCU + 1 
4349 : a4 02 __ LDY $02 
434b : 60 __ __ RTS
--------------------------------------------------------------------
modplay_irq: ; modplay_irq
434c : ad 0d dc LDA $dc0d 
434f : 29 01 __ AND #$01
4351 : d0 03 __ BNE $4356 ; (modplay_irq + 10)
4353 : 4c 31 ea JMP $ea31 
4356 : a5 07 __ LDA WORK + 4 
4358 : 48 __ __ PHA
4359 : a5 08 __ LDA WORK + 5 
435b : 48 __ __ PHA
435c : a5 09 __ LDA WORK + 6 
435e : 48 __ __ PHA
435f : a5 0a __ LDA WORK + 7 
4361 : 48 __ __ PHA
4362 : a5 0b __ LDA WORK + 8 
4364 : 48 __ __ PHA
4365 : a5 0c __ LDA $0c 
4367 : 48 __ __ PHA
4368 : a5 14 __ LDA P7 
436a : 48 __ __ PHA
436b : a5 15 __ LDA P8 
436d : 48 __ __ PHA
436e : a5 16 __ LDA P9 
4370 : 48 __ __ PHA
4371 : a5 17 __ LDA P10 
4373 : 48 __ __ PHA
4374 : a5 18 __ LDA P11 
4376 : 48 __ __ PHA
4377 : a5 19 __ LDA IP + 0 
4379 : 48 __ __ PHA
437a : a5 1a __ LDA IP + 1 
437c : 48 __ __ PHA
437d : a5 1f __ LDA ADDR + 0 
437f : 48 __ __ PHA
4380 : a5 20 __ LDA ADDR + 1 
4382 : 48 __ __ PHA
4383 : a5 21 __ LDA ADDR + 2 
4385 : 48 __ __ PHA
4386 : a5 22 __ LDA ADDR + 3 
4388 : 48 __ __ PHA
4389 : a5 23 __ LDA SP + 0 
438b : 48 __ __ PHA
438c : a5 24 __ LDA SP + 1 
438e : 48 __ __ PHA
438f : a5 25 __ LDA FP + 0 
4391 : 48 __ __ PHA
4392 : a5 26 __ LDA FP + 1 
4394 : 48 __ __ PHA
4395 : a5 27 __ LDA $27 
4397 : 48 __ __ PHA
4398 : a5 28 __ LDA $28 
439a : 48 __ __ PHA
439b : a5 29 __ LDA $29 
439d : 48 __ __ PHA
439e : a5 2a __ LDA $2a 
43a0 : 48 __ __ PHA
43a1 : a5 2b __ LDA $2b 
43a3 : 48 __ __ PHA
43a4 : a5 2c __ LDA $2c 
43a6 : 48 __ __ PHA
43a7 : a5 2d __ LDA $2d 
43a9 : 48 __ __ PHA
43aa : a5 2e __ LDA $2e 
43ac : 48 __ __ PHA
43ad : a5 2f __ LDA $2f 
43af : 48 __ __ PHA
43b0 : a5 30 __ LDA $30 
43b2 : 48 __ __ PHA
43b3 : a5 31 __ LDA $31 
43b5 : 48 __ __ PHA
43b6 : a5 32 __ LDA $32 
43b8 : 48 __ __ PHA
43b9 : a5 33 __ LDA $33 
43bb : 48 __ __ PHA
43bc : a5 34 __ LDA $34 
43be : 48 __ __ PHA
43bf : a5 35 __ LDA $35 
43c1 : 48 __ __ PHA
43c2 : a5 36 __ LDA $36 
43c4 : 48 __ __ PHA
43c5 : a5 37 __ LDA $37 
43c7 : 48 __ __ PHA
43c8 : a5 38 __ LDA $38 
43ca : 48 __ __ PHA
43cb : a5 39 __ LDA $39 
43cd : 48 __ __ PHA
43ce : a5 3a __ LDA $3a 
43d0 : 48 __ __ PHA
43d1 : a5 3b __ LDA $3b 
43d3 : 48 __ __ PHA
43d4 : a5 3c __ LDA $3c 
43d6 : 48 __ __ PHA
43d7 : a5 3d __ LDA $3d 
43d9 : 48 __ __ PHA
43da : a5 3e __ LDA $3e 
43dc : 48 __ __ PHA
43dd : a5 3f __ LDA $3f 
43df : 48 __ __ PHA
43e0 : a5 40 __ LDA $40 
43e2 : 48 __ __ PHA
43e3 : a5 41 __ LDA $41 
43e5 : 48 __ __ PHA
43e6 : a5 42 __ LDA $42 
43e8 : 48 __ __ PHA
43e9 : 20 82 44 JSR $4482 ; (modplay_tick.s1 + 0)
43ec : 68 __ __ PLA
43ed : 85 42 __ STA $42 
43ef : 68 __ __ PLA
43f0 : 85 41 __ STA $41 
43f2 : 68 __ __ PLA
43f3 : 85 40 __ STA $40 
43f5 : 68 __ __ PLA
43f6 : 85 3f __ STA $3f 
43f8 : 68 __ __ PLA
43f9 : 85 3e __ STA $3e 
43fb : 68 __ __ PLA
43fc : 85 3d __ STA $3d 
43fe : 68 __ __ PLA
43ff : 85 3c __ STA $3c 
4401 : 68 __ __ PLA
4402 : 85 3b __ STA $3b 
4404 : 68 __ __ PLA
4405 : 85 3a __ STA $3a 
4407 : 68 __ __ PLA
4408 : 85 39 __ STA $39 
440a : 68 __ __ PLA
440b : 85 38 __ STA $38 
440d : 68 __ __ PLA
440e : 85 37 __ STA $37 
4410 : 68 __ __ PLA
4411 : 85 36 __ STA $36 
4413 : 68 __ __ PLA
4414 : 85 35 __ STA $35 
4416 : 68 __ __ PLA
4417 : 85 34 __ STA $34 
4419 : 68 __ __ PLA
441a : 85 33 __ STA $33 
441c : 68 __ __ PLA
441d : 85 32 __ STA $32 
441f : 68 __ __ PLA
4420 : 85 31 __ STA $31 
4422 : 68 __ __ PLA
4423 : 85 30 __ STA $30 
4425 : 68 __ __ PLA
4426 : 85 2f __ STA $2f 
4428 : 68 __ __ PLA
4429 : 85 2e __ STA $2e 
442b : 68 __ __ PLA
442c : 85 2d __ STA $2d 
442e : 68 __ __ PLA
442f : 85 2c __ STA $2c 
4431 : 68 __ __ PLA
4432 : 85 2b __ STA $2b 
4434 : 68 __ __ PLA
4435 : 85 2a __ STA $2a 
4437 : 68 __ __ PLA
4438 : 85 29 __ STA $29 
443a : 68 __ __ PLA
443b : 85 28 __ STA $28 
443d : 68 __ __ PLA
443e : 85 27 __ STA $27 
4440 : 68 __ __ PLA
4441 : 85 26 __ STA FP + 1 
4443 : 68 __ __ PLA
4444 : 85 25 __ STA FP + 0 
4446 : 68 __ __ PLA
4447 : 85 24 __ STA SP + 1 
4449 : 68 __ __ PLA
444a : 85 23 __ STA SP + 0 
444c : 68 __ __ PLA
444d : 85 22 __ STA ADDR + 3 
444f : 68 __ __ PLA
4450 : 85 21 __ STA ADDR + 2 
4452 : 68 __ __ PLA
4453 : 85 20 __ STA ADDR + 1 
4455 : 68 __ __ PLA
4456 : 85 1f __ STA ADDR + 0 
4458 : 68 __ __ PLA
4459 : 85 1a __ STA IP + 1 
445b : 68 __ __ PLA
445c : 85 19 __ STA IP + 0 
445e : 68 __ __ PLA
445f : 85 18 __ STA P11 
4461 : 68 __ __ PLA
4462 : 85 17 __ STA P10 
4464 : 68 __ __ PLA
4465 : 85 16 __ STA P9 
4467 : 68 __ __ PLA
4468 : 85 15 __ STA P8 
446a : 68 __ __ PLA
446b : 85 14 __ STA P7 
446d : 68 __ __ PLA
446e : 85 0c __ STA $0c 
4470 : 68 __ __ PLA
4471 : 85 0b __ STA WORK + 8 
4473 : 68 __ __ PLA
4474 : 85 0a __ STA WORK + 7 
4476 : 68 __ __ PLA
4477 : 85 09 __ STA WORK + 6 
4479 : 68 __ __ PLA
447a : 85 08 __ STA WORK + 5 
447c : 68 __ __ PLA
447d : 85 07 __ STA WORK + 4 
447f : 4c 31 ea JMP $ea31 
--------------------------------------------------------------------
modplay_tick: ; modplay_tick()->void
; 285, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s1:
4482 : c6 24 __ DEC SP + 1 
4484 : a5 03 __ LDA WORK + 0 
4486 : 48 __ __ PHA
4487 : a5 04 __ LDA WORK + 1 
4489 : 48 __ __ PHA
448a : a5 05 __ LDA WORK + 2 
448c : 48 __ __ PHA
448d : a5 06 __ LDA WORK + 3 
448f : 48 __ __ PHA
4490 : a5 0d __ LDA P0 
4492 : 48 __ __ PHA
4493 : a5 0e __ LDA P1 
4495 : 48 __ __ PHA
4496 : a5 0f __ LDA P2 
4498 : 48 __ __ PHA
4499 : a5 10 __ LDA P3 
449b : 48 __ __ PHA
449c : a5 11 __ LDA P4 
449e : 48 __ __ PHA
449f : a5 12 __ LDA P5 
44a1 : 48 __ __ PHA
44a2 : a5 13 __ LDA P6 
44a4 : 48 __ __ PHA
44a5 : a5 1b __ LDA ACCU + 0 
44a7 : 48 __ __ PHA
44a8 : a5 1c __ LDA ACCU + 1 
44aa : 48 __ __ PHA
44ab : a5 1d __ LDA ACCU + 2 
44ad : 48 __ __ PHA
44ae : a5 1e __ LDA ACCU + 3 
44b0 : 48 __ __ PHA
44b1 : a5 43 __ LDA T0 + 0 
44b3 : 48 __ __ PHA
44b4 : a5 44 __ LDA T0 + 1 
44b6 : 48 __ __ PHA
44b7 : a5 45 __ LDA T2 + 0 
44b9 : 48 __ __ PHA
44ba : a5 46 __ LDA $46 
44bc : 48 __ __ PHA
44bd : a5 47 __ LDA $47 
44bf : 48 __ __ PHA
44c0 : a5 48 __ LDA $48 
44c2 : 48 __ __ PHA
44c3 : a5 49 __ LDA $49 
44c5 : 48 __ __ PHA
44c6 : a5 4a __ LDA $4a 
44c8 : 48 __ __ PHA
44c9 : a5 4b __ LDA $4b 
44cb : 48 __ __ PHA
44cc : a5 4c __ LDA $4c 
44ce : 48 __ __ PHA
44cf : a5 4d __ LDA $4d 
44d1 : 48 __ __ PHA
44d2 : a5 4e __ LDA $4e 
44d4 : 48 __ __ PHA
44d5 : a5 4f __ LDA $4f 
44d7 : 48 __ __ PHA
44d8 : a5 50 __ LDA $50 
44da : 48 __ __ PHA
44db : a5 51 __ LDA $51 
44dd : 48 __ __ PHA
.s4:
44de : ad 4c a0 LDA $a04c ; (modplay.active + 0)
44e1 : d0 03 __ BNE $44e6 ; (modplay_tick.s5 + 0)
44e3 : 4c 7c 45 JMP $457c ; (modplay_tick.s3 + 0)
.s5:
44e6 : ad fe 80 LDA $80fe ; (mod_paused + 0)
44e9 : d0 f8 __ BNE $44e3 ; (modplay_tick.s4 + 5)
.s6:
44eb : ad 46 a0 LDA $a046 ; (modplay.tick + 0)
44ee : d0 19 __ BNE $4509 ; (modplay_tick.s25 + 0)
.s7:
44f0 : ad 48 a0 LDA $a048 ; (modplay.bpm + 0)
44f3 : 20 51 42 JSR $4251 ; (bpm_to_timer.s4 + 0)
44f6 : a5 1b __ LDA ACCU + 0 
44f8 : 8d 04 dc STA $dc04 
44fb : a5 1c __ LDA ACCU + 1 
44fd : 8d 05 dc STA $dc05 
4500 : 20 0b 46 JSR $460b ; (process_new_row.s1 + 0)
4503 : ac 47 a0 LDY $a047 ; (modplay.ticks_per_row + 0)
4506 : 4c 22 45 JMP $4522 ; (modplay_tick.s8 + 0)
.s25:
4509 : a9 00 __ LDA #$00
450b : 85 0f __ STA P2 
450d : 20 9d 4c JSR $4c9d ; (fx_tick.s4 + 0)
4510 : e6 0f __ INC P2 
4512 : 20 9d 4c JSR $4c9d ; (fx_tick.s4 + 0)
4515 : e6 0f __ INC P2 
4517 : 20 9d 4c JSR $4c9d ; (fx_tick.s4 + 0)
451a : e6 0f __ INC P2 
451c : 20 9d 4c JSR $4c9d ; (fx_tick.s4 + 0)
451f : ac 46 a0 LDY $a046 ; (modplay.tick + 0)
.s8:
4522 : 88 __ __ DEY
4523 : 8c 46 a0 STY $a046 ; (modplay.tick + 0)
4526 : a9 00 __ LDA #$00
4528 : 85 13 __ STA P6 
.l26:
452a : 20 1a 4f JSR $4f1a ; (ua_update_channel.s1 + 0)
452d : e6 13 __ INC P6 
452f : a5 13 __ LDA P6 
4531 : c9 04 __ CMP #$04
4533 : 90 f5 __ BCC $452a ; (modplay_tick.l26 + 0)
.s9:
4535 : ad 46 a0 LDA $a046 ; (modplay.tick + 0)
4538 : d0 42 __ BNE $457c ; (modplay_tick.s3 + 0)
.s10:
453a : ad 49 a0 LDA $a049 ; (modplay.pattern_delay + 0)
453d : f0 05 __ BEQ $4544 ; (modplay_tick.s11 + 0)
.s24:
453f : ce 49 a0 DEC $a049 ; (modplay.pattern_delay + 0)
4542 : b0 38 __ BCS $457c ; (modplay_tick.s3 + 0)
.s11:
4544 : ad 4e a0 LDA $a04e ; (modplay.skip_row_advance + 0)
4547 : f0 03 __ BEQ $454c ; (modplay_tick.s12 + 0)
4549 : 4c d9 45 JMP $45d9 ; (modplay_tick.s18 + 0)
.s12:
454c : ee 45 a0 INC $a045 ; (modplay.row + 0)
454f : ad 45 a0 LDA $a045 ; (modplay.row + 0)
4552 : c9 40 __ CMP #$40
4554 : 90 26 __ BCC $457c ; (modplay_tick.s3 + 0)
.s13:
4556 : ee 43 a0 INC $a043 ; (modplay.order_pos + 0)
4559 : a9 00 __ LDA #$00
455b : 8d 45 a0 STA $a045 ; (modplay.row + 0)
455e : ad 43 a0 LDA $a043 ; (modplay.order_pos + 0)
4561 : cd c0 9f CMP $9fc0 ; (modplay.song_length + 0)
4564 : 90 0f __ BCC $4575 ; (modplay_tick.s14 + 0)
.s15:
4566 : ad 4d a0 LDA $a04d ; (modplay.loop_song + 0)
4569 : d0 05 __ BNE $4570 ; (modplay_tick.s17 + 0)
.s16:
456b : 8d 4c a0 STA $a04c ; (modplay.active + 0)
456e : b0 0c __ BCS $457c ; (modplay_tick.s3 + 0)
.s17:
4570 : a9 00 __ LDA #$00
4572 : 8d 43 a0 STA $a043 ; (modplay.order_pos + 0)
.s14:
4575 : aa __ __ TAX
4576 : bd c3 9f LDA $9fc3,x ; (modplay.order_table[0] + 0)
4579 : 8d 44 a0 STA $a044 ; (modplay.pattern_num + 0)
.s3:
457c : 68 __ __ PLA
457d : 85 51 __ STA $51 
457f : 68 __ __ PLA
4580 : 85 50 __ STA $50 
4582 : 68 __ __ PLA
4583 : 85 4f __ STA $4f 
4585 : 68 __ __ PLA
4586 : 85 4e __ STA $4e 
4588 : 68 __ __ PLA
4589 : 85 4d __ STA $4d 
458b : 68 __ __ PLA
458c : 85 4c __ STA $4c 
458e : 68 __ __ PLA
458f : 85 4b __ STA $4b 
4591 : 68 __ __ PLA
4592 : 85 4a __ STA $4a 
4594 : 68 __ __ PLA
4595 : 85 49 __ STA $49 
4597 : 68 __ __ PLA
4598 : 85 48 __ STA $48 
459a : 68 __ __ PLA
459b : 85 47 __ STA $47 
459d : 68 __ __ PLA
459e : 85 46 __ STA $46 
45a0 : 68 __ __ PLA
45a1 : 85 45 __ STA T2 + 0 
45a3 : 68 __ __ PLA
45a4 : 85 44 __ STA T0 + 1 
45a6 : 68 __ __ PLA
45a7 : 85 43 __ STA T0 + 0 
45a9 : 68 __ __ PLA
45aa : 85 1e __ STA ACCU + 3 
45ac : 68 __ __ PLA
45ad : 85 1d __ STA ACCU + 2 
45af : 68 __ __ PLA
45b0 : 85 1c __ STA ACCU + 1 
45b2 : 68 __ __ PLA
45b3 : 85 1b __ STA ACCU + 0 
45b5 : 68 __ __ PLA
45b6 : 85 13 __ STA P6 
45b8 : 68 __ __ PLA
45b9 : 85 12 __ STA P5 
45bb : 68 __ __ PLA
45bc : 85 11 __ STA P4 
45be : 68 __ __ PLA
45bf : 85 10 __ STA P3 
45c1 : 68 __ __ PLA
45c2 : 85 0f __ STA P2 
45c4 : 68 __ __ PLA
45c5 : 85 0e __ STA P1 
45c7 : 68 __ __ PLA
45c8 : 85 0d __ STA P0 
45ca : 68 __ __ PLA
45cb : 85 06 __ STA WORK + 3 
45cd : 68 __ __ PLA
45ce : 85 05 __ STA WORK + 2 
45d0 : 68 __ __ PLA
45d1 : 85 04 __ STA WORK + 1 
45d3 : 68 __ __ PLA
45d4 : 85 03 __ STA WORK + 0 
45d6 : e6 24 __ INC SP + 1 
45d8 : 60 __ __ RTS
.s18:
45d9 : ad 4f a0 LDA $a04f ; (modplay.next_order + 0)
45dc : c9 ff __ CMP #$ff
45de : f0 06 __ BEQ $45e6 ; (modplay_tick.s19 + 0)
.s23:
45e0 : 8d 43 a0 STA $a043 ; (modplay.order_pos + 0)
45e3 : 4c e9 45 JMP $45e9 ; (modplay_tick.s27 + 0)
.s19:
45e6 : ad 43 a0 LDA $a043 ; (modplay.order_pos + 0)
.s27:
45e9 : cd c0 9f CMP $9fc0 ; (modplay.song_length + 0)
45ec : 90 0d __ BCC $45fb ; (modplay_tick.s20 + 0)
.s21:
45ee : ad 4d a0 LDA $a04d ; (modplay.loop_song + 0)
45f1 : d0 03 __ BNE $45f6 ; (modplay_tick.s22 + 0)
45f3 : 4c 6b 45 JMP $456b ; (modplay_tick.s16 + 0)
.s22:
45f6 : a9 00 __ LDA #$00
45f8 : 8d 43 a0 STA $a043 ; (modplay.order_pos + 0)
.s20:
45fb : aa __ __ TAX
45fc : bd c3 9f LDA $9fc3,x ; (modplay.order_table[0] + 0)
45ff : 8d 44 a0 STA $a044 ; (modplay.pattern_num + 0)
4602 : ad 50 a0 LDA $a050 ; (modplay.next_row + 0)
4605 : 8d 45 a0 STA $a045 ; (modplay.row + 0)
4608 : 4c 7c 45 JMP $457c ; (modplay_tick.s3 + 0)
--------------------------------------------------------------------
process_new_row: ; process_new_row()->void
; 579, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s1:
460b : 38 __ __ SEC
460c : a5 23 __ LDA SP + 0 
460e : e9 0b __ SBC #$0b
4610 : 85 23 __ STA SP + 0 
4612 : b0 02 __ BCS $4616 ; (process_new_row.s4 + 0)
4614 : c6 24 __ DEC SP + 1 
.s4:
4616 : a9 00 __ LDA #$00
4618 : 8d 4e a0 STA $a04e ; (modplay.skip_row_advance + 0)
461b : 8d 50 a0 STA $a050 ; (modplay.next_row + 0)
461e : ad bc 9f LDA $9fbc ; (modplay.reu_base + 0)
4621 : 18 __ __ CLC
4622 : 69 3c __ ADC #$3c
4624 : 85 43 __ STA T0 + 0 
4626 : a9 ff __ LDA #$ff
4628 : 8d 4f a0 STA $a04f ; (modplay.next_order + 0)
462b : a9 d6 __ LDA #$d6
462d : 8d 02 df STA $df02 
4630 : a9 8a __ LDA #$8a
4632 : 8d 03 df STA $df03 
4635 : ad bd 9f LDA $9fbd ; (modplay.reu_base + 1)
4638 : 69 04 __ ADC #$04
463a : aa __ __ TAX
463b : ac be 9f LDY $9fbe ; (modplay.reu_base + 2)
463e : 90 01 __ BCC $4641 ; (process_new_row.s9 + 0)
.s8:
4640 : c8 __ __ INY
.s9:
4641 : ad 44 a0 LDA $a044 ; (modplay.pattern_num + 0)
4644 : 0a __ __ ASL
4645 : 85 1c __ STA ACCU + 1 
4647 : a9 00 __ LDA #$00
4649 : 2a __ __ ROL
464a : 06 1c __ ASL ACCU + 1 
464c : 2a __ __ ROL
464d : 85 1d __ STA ACCU + 2 
464f : 8a __ __ TXA
4650 : 65 1c __ ADC ACCU + 1 
4652 : 85 44 __ STA T0 + 1 
4654 : 98 __ __ TYA
4655 : 65 1d __ ADC ACCU + 2 
4657 : 85 45 __ STA T0 + 2 
4659 : ad 45 a0 LDA $a045 ; (modplay.row + 0)
465c : 85 1b __ STA ACCU + 0 
465e : a9 00 __ LDA #$00
4660 : 85 1c __ STA ACCU + 1 
4662 : 85 1d __ STA ACCU + 2 
4664 : a2 04 __ LDX #$04
.l5:
4666 : 06 1b __ ASL ACCU + 0 
4668 : 26 1c __ ROL ACCU + 1 
466a : 26 1d __ ROL ACCU + 2 
466c : 2a __ __ ROL
466d : ca __ __ DEX
466e : d0 f6 __ BNE $4666 ; (process_new_row.l5 + 0)
.s6:
4670 : 18 __ __ CLC
4671 : a5 1b __ LDA ACCU + 0 
4673 : 65 43 __ ADC T0 + 0 
4675 : 8d 04 df STA $df04 
4678 : a5 1c __ LDA ACCU + 1 
467a : 65 44 __ ADC T0 + 1 
467c : 8d 05 df STA $df05 
467f : a5 1d __ LDA ACCU + 2 
4681 : 65 45 __ ADC T0 + 2 
4683 : 8d 06 df STA $df06 
4686 : a9 10 __ LDA #$10
4688 : 8d 07 df STA $df07 
468b : 8e 08 df STX $df08 
468e : 8e 0a df STX $df0a 
4691 : 86 4a __ STX T5 + 0 
4693 : 86 4b __ STX T7 + 0 
4695 : 86 10 __ STX P3 
4697 : a9 91 __ LDA #$91
4699 : 8d 01 df STA $df01 
469c : 18 __ __ CLC
469d : a5 23 __ LDA SP + 0 
469f : 69 06 __ ADC #$06
46a1 : 85 11 __ STA P4 
46a3 : a5 24 __ LDA SP + 1 
46a5 : 69 00 __ ADC #$00
46a7 : 85 12 __ STA P5 
.l7:
46a9 : a6 4b __ LDX T7 + 0 
46ab : bd d6 8a LDA $8ad6,x ; (mod_row_buf[0] + 0)
46ae : 29 f0 __ AND #$f0
46b0 : 85 48 __ STA T2 + 0 
46b2 : bd d8 8a LDA $8ad8,x ; (mod_row_buf[0] + 2)
46b5 : 4a __ __ LSR
46b6 : 4a __ __ LSR
46b7 : 4a __ __ LSR
46b8 : 4a __ __ LSR
46b9 : 05 48 __ ORA T2 + 0 
46bb : a0 06 __ LDY #$06
46bd : 91 23 __ STA (SP + 0),y 
46bf : bd d7 8a LDA $8ad7,x ; (mod_row_buf[0] + 1)
46c2 : c8 __ __ INY
46c3 : 91 23 __ STA (SP + 0),y 
46c5 : bd d6 8a LDA $8ad6,x ; (mod_row_buf[0] + 0)
46c8 : 29 0f __ AND #$0f
46ca : c8 __ __ INY
46cb : 91 23 __ STA (SP + 0),y 
46cd : bd d8 8a LDA $8ad8,x ; (mod_row_buf[0] + 2)
46d0 : 29 0f __ AND #$0f
46d2 : 85 49 __ STA T3 + 0 
46d4 : c8 __ __ INY
46d5 : 91 23 __ STA (SP + 0),y 
46d7 : bd d9 8a LDA $8ad9,x ; (mod_row_buf[0] + 3)
46da : c8 __ __ INY
46db : 91 23 __ STA (SP + 0),y 
46dd : a5 49 __ LDA T3 + 0 
46df : a4 4a __ LDY T5 + 0 
46e1 : 99 a5 a2 STA $a2a5,y ; (modplay.channel[0].effect + 0)
46e4 : bd d9 8a LDA $8ad9,x ; (mod_row_buf[0] + 3)
46e7 : 99 a6 a2 STA $a2a6,y ; (modplay.channel[0].eparam + 0)
46ea : 20 16 47 JSR $4716 ; (apply_note.s4 + 0)
46ed : a5 10 __ LDA P3 
46ef : 85 0f __ STA P2 
46f1 : 20 a0 49 JSR $49a0 ; (fx_row.s4 + 0)
46f4 : 18 __ __ CLC
46f5 : a5 4a __ LDA T5 + 0 
46f7 : 69 32 __ ADC #$32
46f9 : 85 4a __ STA T5 + 0 
46fb : 18 __ __ CLC
46fc : a5 4b __ LDA T7 + 0 
46fe : 69 04 __ ADC #$04
4700 : 85 4b __ STA T7 + 0 
4702 : e6 10 __ INC P3 
4704 : a5 10 __ LDA P3 
4706 : c9 04 __ CMP #$04
4708 : 90 9f __ BCC $46a9 ; (process_new_row.l7 + 0)
.s3:
470a : 18 __ __ CLC
470b : a5 23 __ LDA SP + 0 
470d : 69 0b __ ADC #$0b
470f : 85 23 __ STA SP + 0 
4711 : 90 02 __ BCC $4715 ; (process_new_row.s3 + 11)
4713 : e6 24 __ INC SP + 1 
4715 : 60 __ __ RTS
--------------------------------------------------------------------
apply_note: ; apply_note(u8,struct S#24079*)->void
; 194, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4716 : a5 10 __ LDA P3 ; (ch_idx + 0)
4718 : 0a __ __ ASL
4719 : 18 __ __ CLC
471a : 65 10 __ ADC P3 ; (ch_idx + 0)
471c : 0a __ __ ASL
471d : 0a __ __ ASL
471e : 0a __ __ ASL
471f : 18 __ __ CLC
4720 : 65 10 __ ADC P3 ; (ch_idx + 0)
4722 : 0a __ __ ASL
4723 : 85 47 __ STA T3 + 0 
4725 : a0 00 __ LDY #$00
4727 : b1 11 __ LDA (P4),y ; (n + 0)
4729 : d0 03 __ BNE $472e ; (apply_note.s14 + 0)
472b : 4c de 47 JMP $47de ; (apply_note.s5 + 0)
.s14:
472e : ad c1 9f LDA $9fc1 ; (modplay.num_samples + 0)
4731 : d1 11 __ CMP (P4),y ; (n + 0)
4733 : 90 f6 __ BCC $472b ; (apply_note.s4 + 21)
.s15:
4735 : 84 1c __ STY ACCU + 1 
4737 : b1 11 __ LDA (P4),y ; (n + 0)
4739 : a6 47 __ LDX T3 + 0 
473b : 9d 9e a2 STA $a29e,x ; (modplay.channel[0].sample_num + 0)
473e : 85 1b __ STA ACCU + 0 
4740 : a9 13 __ LDA #$13
4742 : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
4745 : 18 __ __ CLC
4746 : a9 3e __ LDA #$3e
4748 : 65 1b __ ADC ACCU + 0 
474a : 85 1b __ STA ACCU + 0 
474c : a9 a0 __ LDA #$a0
474e : 65 1c __ ADC ACCU + 1 
4750 : 85 1c __ STA ACCU + 1 
4752 : a0 11 __ LDY #$11
4754 : b1 1b __ LDA (ACCU + 0),y 
4756 : a6 47 __ LDX T3 + 0 
4758 : 9d a3 a2 STA $a2a3,x ; (modplay.channel[0].volume + 0)
475b : 88 __ __ DEY
475c : b1 1b __ LDA (ACCU + 0),y 
475e : 9d bf a2 STA $a2bf,x ; (modplay.channel[0].needs_loop + 0)
4761 : a0 01 __ LDY #$01
4763 : b1 1b __ LDA (ACCU + 0),y 
4765 : 85 44 __ STA T0 + 1 
4767 : 9d c1 a2 STA $a2c1,x ; (modplay.channel[0].smp_start + 1)
476a : c8 __ __ INY
476b : b1 1b __ LDA (ACCU + 0),y 
476d : 85 45 __ STA T0 + 2 
476f : 9d c2 a2 STA $a2c2,x ; (modplay.channel[0].smp_start + 2)
4772 : c8 __ __ INY
4773 : b1 1b __ LDA (ACCU + 0),y 
4775 : 85 46 __ STA T0 + 3 
4777 : 9d c3 a2 STA $a2c3,x ; (modplay.channel[0].smp_start + 3)
477a : a0 00 __ LDY #$00
477c : b1 1b __ LDA (ACCU + 0),y 
477e : 85 43 __ STA T0 + 0 
4780 : 9d c0 a2 STA $a2c0,x ; (modplay.channel[0].smp_start + 0)
4783 : a0 04 __ LDY #$04
4785 : b1 1b __ LDA (ACCU + 0),y 
4787 : 9d c4 a2 STA $a2c4,x ; (modplay.channel[0].smp_length + 0)
478a : c8 __ __ INY
478b : b1 1b __ LDA (ACCU + 0),y 
478d : 9d c5 a2 STA $a2c5,x ; (modplay.channel[0].smp_length + 1)
4790 : c8 __ __ INY
4791 : b1 1b __ LDA (ACCU + 0),y 
4793 : 9d c6 a2 STA $a2c6,x ; (modplay.channel[0].smp_length + 2)
4796 : c8 __ __ INY
4797 : b1 1b __ LDA (ACCU + 0),y 
4799 : 9d c7 a2 STA $a2c7,x ; (modplay.channel[0].smp_length + 3)
479c : 18 __ __ CLC
479d : c8 __ __ INY
479e : b1 1b __ LDA (ACCU + 0),y 
47a0 : 65 43 __ ADC T0 + 0 
47a2 : 9d c8 a2 STA $a2c8,x ; (modplay.channel[0].smp_loop_a + 0)
47a5 : c8 __ __ INY
47a6 : b1 1b __ LDA (ACCU + 0),y 
47a8 : 65 44 __ ADC T0 + 1 
47aa : 9d c9 a2 STA $a2c9,x ; (modplay.channel[0].smp_loop_a + 1)
47ad : c8 __ __ INY
47ae : b1 1b __ LDA (ACCU + 0),y 
47b0 : 65 45 __ ADC T0 + 2 
47b2 : 9d ca a2 STA $a2ca,x ; (modplay.channel[0].smp_loop_a + 2)
47b5 : c8 __ __ INY
47b6 : b1 1b __ LDA (ACCU + 0),y 
47b8 : 65 46 __ ADC T0 + 3 
47ba : 9d cb a2 STA $a2cb,x ; (modplay.channel[0].smp_loop_a + 3)
47bd : 18 __ __ CLC
47be : c8 __ __ INY
47bf : b1 1b __ LDA (ACCU + 0),y 
47c1 : 65 43 __ ADC T0 + 0 
47c3 : 9d cc a2 STA $a2cc,x ; (modplay.channel[0].smp_loop_b + 0)
47c6 : c8 __ __ INY
47c7 : b1 1b __ LDA (ACCU + 0),y 
47c9 : 65 44 __ ADC T0 + 1 
47cb : 9d cd a2 STA $a2cd,x ; (modplay.channel[0].smp_loop_b + 1)
47ce : c8 __ __ INY
47cf : b1 1b __ LDA (ACCU + 0),y 
47d1 : 65 45 __ ADC T0 + 2 
47d3 : 9d ce a2 STA $a2ce,x ; (modplay.channel[0].smp_loop_b + 2)
47d6 : c8 __ __ INY
47d7 : b1 1b __ LDA (ACCU + 0),y 
47d9 : 65 46 __ ADC T0 + 3 
47db : 9d cf a2 STA $a2cf,x ; (modplay.channel[0].smp_loop_b + 3)
.s5:
47de : a0 01 __ LDY #$01
47e0 : b1 11 __ LDA (P4),y ; (n + 0)
47e2 : 85 0d __ STA P0 
47e4 : c8 __ __ INY
47e5 : b1 11 __ LDA (P4),y ; (n + 0)
47e7 : 85 0e __ STA P1 
47e9 : c8 __ __ INY
47ea : 05 0d __ ORA P0 
47ec : f0 6f __ BEQ $485d ; (apply_note.s6 + 0)
.s10:
47ee : b1 11 __ LDA (P4),y ; (n + 0)
47f0 : c9 03 __ CMP #$03
47f2 : f0 69 __ BEQ $485d ; (apply_note.s6 + 0)
.s11:
47f4 : a6 47 __ LDX T3 + 0 
47f6 : bd 9e a2 LDA $a29e,x ; (modplay.channel[0].sample_num + 0)
47f9 : f0 1a __ BEQ $4815 ; (apply_note.s18 + 0)
.s13:
47fb : 85 1b __ STA ACCU + 0 
47fd : a9 00 __ LDA #$00
47ff : 85 1c __ STA ACCU + 1 
4801 : a9 13 __ LDA #$13
4803 : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
4806 : a9 50 __ LDA #$50
4808 : 85 43 __ STA T0 + 0 
480a : 18 __ __ CLC
480b : a9 a0 __ LDA #$a0
480d : 65 1c __ ADC ACCU + 1 
480f : 85 44 __ STA T0 + 1 
4811 : a4 1b __ LDY ACCU + 0 
4813 : b1 43 __ LDA (T0 + 0),y 
.s18:
4815 : 85 0f __ STA P2 
4817 : 20 a8 48 JSR $48a8 ; (period_finetune.s4 + 0)
481a : a5 1b __ LDA ACCU + 0 
481c : 85 0d __ STA P0 
481e : a6 47 __ LDX T3 + 0 
4820 : 9d 9f a2 STA $a29f,x ; (modplay.channel[0].period + 0)
4823 : a5 1c __ LDA ACCU + 1 
4825 : 85 0e __ STA P1 
4827 : 9d a0 a2 STA $a2a0,x ; (modplay.channel[0].period + 1)
482a : 20 57 49 JSR $4957 ; (period_to_rate.s4 + 0)
482d : a5 1b __ LDA ACCU + 0 
482f : a6 47 __ LDX T3 + 0 
4831 : 9d a1 a2 STA $a2a1,x ; (modplay.channel[0].rate + 0)
4834 : a5 1c __ LDA ACCU + 1 
4836 : 9d a2 a2 STA $a2a2,x ; (modplay.channel[0].rate + 1)
4839 : a0 00 __ LDY #$00
483b : b1 11 __ LDA (P4),y ; (n + 0)
483d : 9d b5 a2 STA $a2b5,x ; (modplay.channel[0].last_note + 0)
4840 : a0 03 __ LDY #$03
4842 : b1 11 __ LDA (P4),y ; (n + 0)
4844 : c9 03 __ CMP #$03
4846 : f0 15 __ BEQ $485d ; (apply_note.s6 + 0)
.s12:
4848 : a8 __ __ TAY
4849 : a9 00 __ LDA #$00
484b : 9d ab a2 STA $a2ab,x ; (modplay.channel[0].vib_pos + 0)
484e : 9d af a2 STA $a2af,x ; (modplay.channel[0].trm_pos + 0)
4851 : 9d b4 a2 STA $a2b4,x ; (modplay.channel[0].arp_counter + 0)
4854 : a9 01 __ LDA #$01
4856 : 9d be a2 STA $a2be,x ; (modplay.channel[0].needs_start + 0)
4859 : 98 __ __ TYA
485a : 4c 5f 48 JMP $485f ; (apply_note.s16 + 0)
.s6:
485d : b1 11 __ LDA (P4),y ; (n + 0)
.s16:
485f : c9 03 __ CMP #$03
4861 : d0 44 __ BNE $48a7 ; (apply_note.s3 + 0)
.s7:
4863 : a0 01 __ LDY #$01
4865 : b1 11 __ LDA (P4),y ; (n + 0)
4867 : 85 0d __ STA P0 
4869 : c8 __ __ INY
486a : 11 11 __ ORA (P4),y ; (n + 0)
486c : f0 39 __ BEQ $48a7 ; (apply_note.s3 + 0)
.s8:
486e : b1 11 __ LDA (P4),y ; (n + 0)
4870 : 85 0e __ STA P1 
4872 : a6 47 __ LDX T3 + 0 
4874 : bd 9e a2 LDA $a29e,x ; (modplay.channel[0].sample_num + 0)
4877 : f0 1a __ BEQ $4893 ; (apply_note.s17 + 0)
.s9:
4879 : 85 1b __ STA ACCU + 0 
487b : a9 00 __ LDA #$00
487d : 85 1c __ STA ACCU + 1 
487f : a9 13 __ LDA #$13
4881 : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
4884 : a9 50 __ LDA #$50
4886 : 85 43 __ STA T0 + 0 
4888 : 18 __ __ CLC
4889 : a9 a0 __ LDA #$a0
488b : 65 1c __ ADC ACCU + 1 
488d : 85 44 __ STA T0 + 1 
488f : a4 1b __ LDY ACCU + 0 
4891 : b1 43 __ LDA (T0 + 0),y 
.s17:
4893 : 85 0f __ STA P2 
4895 : 20 a8 48 JSR $48a8 ; (period_finetune.s4 + 0)
4898 : 20 4f 49 JSR $494f ; (period_to_rate@proxy + 0)
489b : a5 1b __ LDA ACCU + 0 
489d : a6 47 __ LDX T3 + 0 
489f : 9d a7 a2 STA $a2a7,x ; (modplay.channel[0].porta_target + 0)
48a2 : a5 1c __ LDA ACCU + 1 
48a4 : 9d a8 a2 STA $a2a8,x ; (modplay.channel[0].porta_target + 1)
.s3:
48a7 : 60 __ __ RTS
--------------------------------------------------------------------
period_finetune: ; period_finetune(u16,u8)->u16
;  59, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
48a8 : a5 0f __ LDA P2 ; (finetune_raw + 0)
48aa : c9 08 __ CMP #$08
48ac : b0 03 __ BCS $48b1 ; (period_finetune.s14 + 0)
48ae : 4c 46 49 JMP $4946 ; (period_finetune.s5 + 0)
.s14:
48b1 : e9 10 __ SBC #$10
48b3 : 85 0f __ STA P2 ; (finetune_raw + 0)
48b5 : f0 06 __ BEQ $48bd ; (period_finetune.s6 + 0)
.s7:
48b7 : a5 0e __ LDA P1 ; (period + 1)
48b9 : 05 0d __ ORA P0 ; (period + 0)
48bb : d0 09 __ BNE $48c6 ; (period_finetune.s8 + 0)
.s6:
48bd : a5 0d __ LDA P0 ; (period + 0)
48bf : 85 1b __ STA ACCU + 0 
48c1 : a5 0e __ LDA P1 ; (period + 1)
48c3 : 4c 43 49 JMP $4943 ; (period_finetune.s3 + 0)
.s8:
48c6 : a5 0f __ LDA P2 ; (finetune_raw + 0)
48c8 : 10 05 __ BPL $48cf ; (period_finetune.s9 + 0)
.s13:
48ca : 38 __ __ SEC
48cb : a9 00 __ LDA #$00
48cd : e5 0f __ SBC P2 ; (finetune_raw + 0)
.s9:
48cf : a6 0d __ LDX P0 ; (period + 0)
48d1 : 86 1b __ STX ACCU + 0 
48d3 : a6 0e __ LDX P1 ; (period + 1)
48d5 : 86 1c __ STX ACCU + 1 
48d7 : a2 00 __ LDX #$00
48d9 : 86 1d __ STX ACCU + 2 
48db : 86 1e __ STX ACCU + 3 
48dd : 20 9e 7b JSR $7b9e ; (mul32by8 + 0)
48e0 : a5 07 __ LDA WORK + 4 
48e2 : 85 1b __ STA ACCU + 0 
48e4 : a5 08 __ LDA WORK + 5 
48e6 : 85 1c __ STA ACCU + 1 
48e8 : a5 09 __ LDA WORK + 6 
48ea : 85 1d __ STA ACCU + 2 
48ec : a5 0a __ LDA WORK + 7 
48ee : 85 1e __ STA ACCU + 3 
48f0 : a9 00 __ LDA #$00
48f2 : 85 05 __ STA WORK + 2 
48f4 : 85 06 __ STA WORK + 3 
48f6 : a9 e9 __ LDA #$e9
48f8 : 85 03 __ STA WORK + 0 
48fa : a9 02 __ LDA #$02
48fc : 85 04 __ STA WORK + 1 
48fe : 20 d2 7c JSR $7cd2 ; (mul32 + 0)
4901 : a5 07 __ LDA WORK + 4 
4903 : 85 1b __ STA ACCU + 0 
4905 : a5 08 __ LDA WORK + 5 
4907 : 85 1c __ STA ACCU + 1 
4909 : a5 09 __ LDA WORK + 6 
490b : 85 1d __ STA ACCU + 2 
490d : a5 0a __ LDA WORK + 7 
490f : 85 1e __ STA ACCU + 3 
4911 : a9 a0 __ LDA #$a0
4913 : 85 03 __ STA WORK + 0 
4915 : a9 00 __ LDA #$00
4917 : 85 06 __ STA WORK + 3 
4919 : a9 86 __ LDA #$86
491b : 85 04 __ STA WORK + 1 
491d : a9 01 __ LDA #$01
491f : 85 05 __ STA WORK + 2 
4921 : 20 3a 7d JSR $7d3a ; (divs32 + 0)
4924 : a5 0f __ LDA P2 ; (finetune_raw + 0)
4926 : 30 02 __ BMI $492a ; (period_finetune.s10 + 0)
.s12:
4928 : d0 0e __ BNE $4938 ; (period_finetune.s11 + 0)
.s10:
492a : 18 __ __ CLC
492b : a5 0d __ LDA P0 ; (period + 0)
492d : 65 1b __ ADC ACCU + 0 
492f : 85 1b __ STA ACCU + 0 
4931 : a5 0e __ LDA P1 ; (period + 1)
4933 : 65 1c __ ADC ACCU + 1 
4935 : 4c 43 49 JMP $4943 ; (period_finetune.s3 + 0)
.s11:
4938 : 38 __ __ SEC
4939 : a5 0d __ LDA P0 ; (period + 0)
493b : e5 1b __ SBC ACCU + 0 
493d : 85 1b __ STA ACCU + 0 
493f : a5 0e __ LDA P1 ; (period + 1)
4941 : e5 1c __ SBC ACCU + 1 
.s3:
4943 : 85 1c __ STA ACCU + 1 
4945 : 60 __ __ RTS
.s5:
4946 : aa __ __ TAX
4947 : d0 03 __ BNE $494c ; (period_finetune.s5 + 6)
4949 : 4c bd 48 JMP $48bd ; (period_finetune.s6 + 0)
494c : 4c b7 48 JMP $48b7 ; (period_finetune.s7 + 0)
--------------------------------------------------------------------
period_to_rate@proxy: ; period_to_rate@proxy
494f : a5 1b __ LDA ACCU + 0 
4951 : 85 0d __ STA P0 
4953 : a5 1c __ LDA ACCU + 1 
4955 : 85 0e __ STA P1 
--------------------------------------------------------------------
period_to_rate: ; period_to_rate(u16)->u16
;  41, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4957 : a5 0e __ LDA P1 ; (period + 1)
4959 : 05 0d __ ORA P0 ; (period + 0)
495b : f0 3e __ BEQ $499b ; (period_to_rate.s6 + 0)
.s5:
495d : a5 0d __ LDA P0 ; (period + 0)
495f : 85 1b __ STA ACCU + 0 
4961 : a5 0e __ LDA P1 ; (period + 1)
4963 : 85 1c __ STA ACCU + 1 
4965 : a9 00 __ LDA #$00
4967 : 85 1d __ STA ACCU + 2 
4969 : 85 1e __ STA ACCU + 3 
496b : 85 05 __ STA WORK + 2 
496d : 85 06 __ STA WORK + 3 
496f : a9 d4 __ LDA #$d4
4971 : 85 03 __ STA WORK + 0 
4973 : a9 30 __ LDA #$30
4975 : 85 04 __ STA WORK + 1 
4977 : 20 d2 7c JSR $7cd2 ; (mul32 + 0)
497a : a5 07 __ LDA WORK + 4 
497c : 85 1b __ STA ACCU + 0 
497e : a5 08 __ LDA WORK + 5 
4980 : 85 1c __ STA ACCU + 1 
4982 : a5 09 __ LDA WORK + 6 
4984 : 85 1d __ STA ACCU + 2 
4986 : a5 0a __ LDA WORK + 7 
4988 : 85 1e __ STA ACCU + 3 
498a : a9 00 __ LDA #$00
498c : 85 05 __ STA WORK + 2 
498e : 85 06 __ STA WORK + 3 
4990 : a9 b6 __ LDA #$b6
4992 : 85 03 __ STA WORK + 0 
4994 : a9 1b __ LDA #$1b
4996 : 85 04 __ STA WORK + 1 
4998 : 4c 75 42 JMP $4275 ; (divmod32 + 0)
.s6:
499b : 85 1b __ STA ACCU + 0 
499d : 85 1c __ STA ACCU + 1 
.s3:
499f : 60 __ __ RTS
--------------------------------------------------------------------
fx_row: ; fx_row(u8)->void
; 242, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
49a0 : a4 0f __ LDY P2 ; (ch_idx + 0)
49a2 : be 8d 7f LDX $7f8d,y ; (__multab50L + 0)
49a5 : bd a6 a2 LDA $a2a6,x ; (modplay.channel[0].eparam + 0)
49a8 : 85 1c __ STA ACCU + 1 
49aa : 4a __ __ LSR
49ab : 4a __ __ LSR
49ac : 4a __ __ LSR
49ad : 4a __ __ LSR
49ae : 85 1b __ STA ACCU + 0 
49b0 : bd a5 a2 LDA $a2a5,x ; (modplay.channel[0].effect + 0)
49b3 : c9 08 __ CMP #$08
49b5 : d0 09 __ BNE $49c0 ; (fx_row.s5 + 0)
.s93:
49b7 : a4 1b __ LDY ACCU + 0 
49b9 : b9 e4 7f LDA $7fe4,y ; (__multab17L + 0)
49bc : 9d a4 a2 STA $a2a4,x ; (modplay.channel[0].pan + 0)
.s3:
49bf : 60 __ __ RTS
.s5:
49c0 : a5 1c __ LDA ACCU + 1 
49c2 : 29 0f __ AND #$0f
49c4 : 85 43 __ STA T0 + 0 
49c6 : bd a5 a2 LDA $a2a5,x ; (modplay.channel[0].effect + 0)
49c9 : c9 08 __ CMP #$08
49cb : b0 03 __ BCS $49d0 ; (fx_row.s6 + 0)
49cd : 4c 07 4c JMP $4c07 ; (fx_row.s74 + 0)
.s6:
49d0 : c9 0c __ CMP #$0c
49d2 : d0 03 __ BNE $49d7 ; (fx_row.s7 + 0)
49d4 : 4c f9 4b JMP $4bf9 ; (fx_row.s73 + 0)
.s7:
49d7 : b0 03 __ BCS $49dc ; (fx_row.s8 + 0)
49d9 : 4c 7c 4b JMP $4b7c ; (fx_row.s57 + 0)
.s8:
49dc : c9 0e __ CMP #$0e
49de : f0 33 __ BEQ $4a13 ; (fx_row.s16 + 0)
.s9:
49e0 : 90 14 __ BCC $49f6 ; (fx_row.s15 + 0)
.s10:
49e2 : c9 0f __ CMP #$0f
49e4 : d0 d9 __ BNE $49bf ; (fx_row.s3 + 0)
.s11:
49e6 : a5 1c __ LDA ACCU + 1 
49e8 : f0 d5 __ BEQ $49bf ; (fx_row.s3 + 0)
.s12:
49ea : c9 20 __ CMP #$20
49ec : b0 04 __ BCS $49f2 ; (fx_row.s13 + 0)
.s14:
49ee : 8d 47 a0 STA $a047 ; (modplay.ticks_per_row + 0)
49f1 : 60 __ __ RTS
.s13:
49f2 : 8d 48 a0 STA $a048 ; (modplay.bpm + 0)
49f5 : 60 __ __ RTS
.s15:
49f6 : ae 43 a0 LDX $a043 ; (modplay.order_pos + 0)
49f9 : e8 __ __ INX
49fa : 8e 4f a0 STX $a04f ; (modplay.next_order + 0)
49fd : a9 01 __ LDA #$01
49ff : 8d 4e a0 STA $a04e ; (modplay.skip_row_advance + 0)
4a02 : a6 1b __ LDX ACCU + 0 
4a04 : bd d4 7f LDA $7fd4,x ; (__multab10L + 0)
4a07 : 65 43 __ ADC T0 + 0 
4a09 : c9 40 __ CMP #$40
4a0b : 90 02 __ BCC $4a0f ; (fx_row.s96 + 0)
.s97:
4a0d : a9 00 __ LDA #$00
.s96:
4a0f : 8d 50 a0 STA $a050 ; (modplay.next_row + 0)
4a12 : 60 __ __ RTS
.s16:
4a13 : a5 1b __ LDA ACCU + 0 
4a15 : c9 07 __ CMP #$07
4a17 : d0 08 __ BNE $4a21 ; (fx_row.s17 + 0)
.s56:
4a19 : a5 43 __ LDA T0 + 0 
4a1b : 29 07 __ AND #$07
4a1d : 9d ae a2 STA $a2ae,x ; (modplay.channel[0].trm_wave + 0)
4a20 : 60 __ __ RTS
.s17:
4a21 : 86 46 __ STX T3 + 0 
4a23 : c9 07 __ CMP #$07
4a25 : 90 6d __ BCC $4a94 ; (fx_row.s34 + 0)
.s18:
4a27 : c9 0c __ CMP #$0c
4a29 : d0 0b __ BNE $4a36 ; (fx_row.s19 + 0)
.s33:
4a2b : a5 43 __ LDA T0 + 0 
4a2d : 9d b8 a2 STA $a2b8,x ; (modplay.channel[0].tick_stop + 0)
4a30 : a9 00 __ LDA #$00
4a32 : 9d b9 a2 STA $a2b9,x ; (modplay.channel[0].tick_cur + 0)
4a35 : 60 __ __ RTS
.s19:
4a36 : 90 25 __ BCC $4a5d ; (fx_row.s25 + 0)
.s20:
4a38 : c9 0d __ CMP #$0d
4a3a : f0 0b __ BEQ $4a47 ; (fx_row.s23 + 0)
.s21:
4a3c : c9 0e __ CMP #$0e
4a3e : f0 01 __ BEQ $4a41 ; (fx_row.s22 + 0)
4a40 : 60 __ __ RTS
.s22:
4a41 : a5 43 __ LDA T0 + 0 
4a43 : 8d 49 a0 STA $a049 ; (modplay.pattern_delay + 0)
4a46 : 60 __ __ RTS
.s23:
4a47 : a5 43 __ LDA T0 + 0 
4a49 : 9d b8 a2 STA $a2b8,x ; (modplay.channel[0].tick_stop + 0)
4a4c : a9 00 __ LDA #$00
4a4e : 9d b9 a2 STA $a2b9,x ; (modplay.channel[0].tick_cur + 0)
4a51 : bd be a2 LDA $a2be,x ; (modplay.channel[0].needs_start + 0)
4a54 : 9d ba a2 STA $a2ba,x ; (modplay.channel[0].cmd_backup + 0)
.s24:
4a57 : a9 00 __ LDA #$00
4a59 : 9d be a2 STA $a2be,x ; (modplay.channel[0].needs_start + 0)
4a5c : 60 __ __ RTS
.s25:
4a5d : c9 0a __ CMP #$0a
4a5f : d0 0f __ BNE $4a70 ; (fx_row.s26 + 0)
.s32:
4a61 : bd a3 a2 LDA $a2a3,x ; (modplay.channel[0].volume + 0)
4a64 : 18 __ __ CLC
4a65 : 65 43 __ ADC T0 + 0 
.s28:
4a67 : 20 8c 4c JSR $4c8c ; (clamp_vol.s4 + 0)
4a6a : a6 46 __ LDX T3 + 0 
.s95:
4a6c : 9d a3 a2 STA $a2a3,x ; (modplay.channel[0].volume + 0)
4a6f : 60 __ __ RTS
.s26:
4a70 : b0 1a __ BCS $4a8c ; (fx_row.s27 + 0)
.s30:
4a72 : c9 09 __ CMP #$09
4a74 : f0 01 __ BEQ $4a77 ; (fx_row.s31 + 0)
4a76 : 60 __ __ RTS
.s31:
4a77 : a5 43 __ LDA T0 + 0 
4a79 : 9d b8 a2 STA $a2b8,x ; (modplay.channel[0].tick_stop + 0)
4a7c : a9 00 __ LDA #$00
4a7e : 9d b9 a2 STA $a2b9,x ; (modplay.channel[0].tick_cur + 0)
4a81 : bd be a2 LDA $a2be,x ; (modplay.channel[0].needs_start + 0)
4a84 : 9d ba a2 STA $a2ba,x ; (modplay.channel[0].cmd_backup + 0)
4a87 : a5 43 __ LDA T0 + 0 
4a89 : d0 cc __ BNE $4a57 ; (fx_row.s24 + 0)
4a8b : 60 __ __ RTS
.s27:
4a8c : bd a3 a2 LDA $a2a3,x ; (modplay.channel[0].volume + 0)
4a8f : e5 43 __ SBC T0 + 0 
4a91 : 4c 67 4a JMP $4a67 ; (fx_row.s28 + 0)
.s34:
4a94 : c9 04 __ CMP #$04
4a96 : d0 08 __ BNE $4aa0 ; (fx_row.s35 + 0)
.s55:
4a98 : a5 43 __ LDA T0 + 0 
4a9a : 29 07 __ AND #$07
4a9c : 9d aa a2 STA $a2aa,x ; (modplay.channel[0].vib_wave + 0)
4a9f : 60 __ __ RTS
.s35:
4aa0 : 90 65 __ BCC $4b07 ; (fx_row.s46 + 0)
.s36:
4aa2 : c9 05 __ CMP #$05
4aa4 : d0 2f __ BNE $4ad5 ; (fx_row.s37 + 0)
.s43:
4aa6 : bd 9e a2 LDA $a29e,x ; (modplay.channel[0].sample_num + 0)
4aa9 : d0 01 __ BNE $4aac ; (fx_row.s44 + 0)
4aab : 60 __ __ RTS
.s44:
4aac : ad c1 9f LDA $9fc1 ; (modplay.num_samples + 0)
4aaf : dd 9e a2 CMP $a29e,x ; (modplay.channel[0].sample_num + 0)
4ab2 : b0 01 __ BCS $4ab5 ; (fx_row.s45 + 0)
4ab4 : 60 __ __ RTS
.s45:
4ab5 : bd 9e a2 LDA $a29e,x ; (modplay.channel[0].sample_num + 0)
4ab8 : 85 1b __ STA ACCU + 0 
4aba : a9 00 __ LDA #$00
4abc : 85 1c __ STA ACCU + 1 
4abe : a9 13 __ LDA #$13
4ac0 : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
4ac3 : a9 50 __ LDA #$50
4ac5 : 85 44 __ STA T1 + 0 
4ac7 : 18 __ __ CLC
4ac8 : a9 a0 __ LDA #$a0
4aca : 65 1c __ ADC ACCU + 1 
4acc : 85 45 __ STA T1 + 1 
4ace : a5 43 __ LDA T0 + 0 
4ad0 : a4 1b __ LDY ACCU + 0 
4ad2 : 91 44 __ STA (T1 + 0),y 
4ad4 : 60 __ __ RTS
.s37:
4ad5 : a5 43 __ LDA T0 + 0 
4ad7 : d0 07 __ BNE $4ae0 ; (fx_row.s39 + 0)
.s38:
4ad9 : ad 45 a0 LDA $a045 ; (modplay.row + 0)
4adc : 9d b6 a2 STA $a2b6,x ; (modplay.channel[0].loop_row + 0)
4adf : 60 __ __ RTS
.s39:
4ae0 : bd b7 a2 LDA $a2b7,x ; (modplay.channel[0].loop_count + 0)
4ae3 : f0 1a __ BEQ $4aff ; (fx_row.s40 + 0)
.s42:
4ae5 : 38 __ __ SEC
4ae6 : e9 01 __ SBC #$01
4ae8 : 9d b7 a2 STA $a2b7,x ; (modplay.channel[0].loop_count + 0)
4aeb : d0 01 __ BNE $4aee ; (fx_row.s41 + 0)
4aed : 60 __ __ RTS
.s41:
4aee : a9 01 __ LDA #$01
4af0 : 8d 4e a0 STA $a04e ; (modplay.skip_row_advance + 0)
4af3 : ad 43 a0 LDA $a043 ; (modplay.order_pos + 0)
4af6 : 8d 4f a0 STA $a04f ; (modplay.next_order + 0)
4af9 : bd b6 a2 LDA $a2b6,x ; (modplay.channel[0].loop_row + 0)
4afc : 4c 0f 4a JMP $4a0f ; (fx_row.s96 + 0)
.s40:
4aff : a5 43 __ LDA T0 + 0 
4b01 : 9d b7 a2 STA $a2b7,x ; (modplay.channel[0].loop_count + 0)
4b04 : 4c ee 4a JMP $4aee ; (fx_row.s41 + 0)
.s46:
4b07 : c9 02 __ CMP #$02
4b09 : f0 4e __ BEQ $4b59 ; (fx_row.s54 + 0)
.s47:
4b0b : 90 01 __ BCC $4b0e ; (fx_row.s48 + 0)
4b0d : 60 __ __ RTS
.s48:
4b0e : c9 01 __ CMP #$01
4b10 : f0 01 __ BEQ $4b13 ; (fx_row.s49 + 0)
4b12 : 60 __ __ RTS
.s49:
4b13 : bd a0 a2 LDA $a2a0,x ; (modplay.channel[0].period + 1)
4b16 : d0 09 __ BNE $4b21 ; (fx_row.s52 + 0)
.s53:
4b18 : a9 71 __ LDA #$71
4b1a : dd 9f a2 CMP $a29f,x ; (modplay.channel[0].period + 0)
4b1d : a4 46 __ LDY T3 + 0 
4b1f : b0 1e __ BCS $4b3f ; (fx_row.s50 + 0)
.s52:
4b21 : bd 9f a2 LDA $a29f,x ; (modplay.channel[0].period + 0)
4b24 : 38 __ __ SEC
4b25 : e5 43 __ SBC T0 + 0 
4b27 : 85 0d __ STA P0 
4b29 : bd a0 a2 LDA $a2a0,x ; (modplay.channel[0].period + 1)
4b2c : e9 00 __ SBC #$00
4b2e : 85 0e __ STA P1 
4b30 : 20 5c 4c JSR $4c5c ; (clamp_period.s4 + 0)
4b33 : a5 1b __ LDA ACCU + 0 
4b35 : a4 46 __ LDY T3 + 0 
4b37 : 99 9f a2 STA $a29f,y ; (modplay.channel[0].period + 0)
4b3a : a5 1c __ LDA ACCU + 1 
4b3c : 99 a0 a2 STA $a2a0,y ; (modplay.channel[0].period + 1)
.s50:
4b3f : b9 9f a2 LDA $a29f,y ; (modplay.channel[0].period + 0)
4b42 : 85 0d __ STA P0 
4b44 : b9 a0 a2 LDA $a2a0,y ; (modplay.channel[0].period + 1)
.s51:
4b47 : 85 0e __ STA P1 
4b49 : 20 57 49 JSR $4957 ; (period_to_rate.s4 + 0)
4b4c : a5 1b __ LDA ACCU + 0 
4b4e : a6 46 __ LDX T3 + 0 
4b50 : 9d a1 a2 STA $a2a1,x ; (modplay.channel[0].rate + 0)
4b53 : a5 1c __ LDA ACCU + 1 
4b55 : 9d a2 a2 STA $a2a2,x ; (modplay.channel[0].rate + 1)
4b58 : 60 __ __ RTS
.s54:
4b59 : bd 9f a2 LDA $a29f,x ; (modplay.channel[0].period + 0)
4b5c : 18 __ __ CLC
4b5d : 65 43 __ ADC T0 + 0 
4b5f : 85 0d __ STA P0 
4b61 : bd a0 a2 LDA $a2a0,x ; (modplay.channel[0].period + 1)
4b64 : 69 00 __ ADC #$00
4b66 : 85 0e __ STA P1 
4b68 : 20 5c 4c JSR $4c5c ; (clamp_period.s4 + 0)
4b6b : a5 1b __ LDA ACCU + 0 
4b6d : 85 0d __ STA P0 
4b6f : a6 46 __ LDX T3 + 0 
4b71 : 9d 9f a2 STA $a29f,x ; (modplay.channel[0].period + 0)
4b74 : a5 1c __ LDA ACCU + 1 
4b76 : 9d a0 a2 STA $a2a0,x ; (modplay.channel[0].period + 1)
4b79 : 4c 47 4b JMP $4b47 ; (fx_row.s51 + 0)
.s57:
4b7c : c9 0a __ CMP #$0a
4b7e : f0 6e __ BEQ $4bee ; (fx_row.s71 + 0)
.s58:
4b80 : b0 5f __ BCS $4be1 ; (fx_row.s59 + 0)
.s60:
4b82 : a5 1c __ LDA ACCU + 1 
4b84 : d0 01 __ BNE $4b87 ; (fx_row.s61 + 0)
4b86 : 60 __ __ RTS
.s61:
4b87 : bd c7 a2 LDA $a2c7,x ; (modplay.channel[0].smp_length + 3)
4b8a : d0 29 __ BNE $4bb5 ; (fx_row.s63 + 0)
.s68:
4b8c : bd c6 a2 LDA $a2c6,x ; (modplay.channel[0].smp_length + 2)
4b8f : d0 0b __ BNE $4b9c ; (fx_row.s62 + 0)
.s69:
4b91 : bd c5 a2 LDA $a2c5,x ; (modplay.channel[0].smp_length + 1)
4b94 : d0 06 __ BNE $4b9c ; (fx_row.s62 + 0)
.s70:
4b96 : dd c4 a2 CMP $a2c4,x ; (modplay.channel[0].smp_length + 0)
4b99 : 90 01 __ BCC $4b9c ; (fx_row.s62 + 0)
4b9b : 60 __ __ RTS
.s62:
4b9c : bd c7 a2 LDA $a2c7,x ; (modplay.channel[0].smp_length + 3)
4b9f : d0 14 __ BNE $4bb5 ; (fx_row.s63 + 0)
.s64:
4ba1 : bd c6 a2 LDA $a2c6,x ; (modplay.channel[0].smp_length + 2)
4ba4 : d0 0f __ BNE $4bb5 ; (fx_row.s63 + 0)
.s65:
4ba6 : a5 1c __ LDA ACCU + 1 
4ba8 : dd c5 a2 CMP $a2c5,x ; (modplay.channel[0].smp_length + 1)
4bab : d0 05 __ BNE $4bb2 ; (fx_row.s67 + 0)
.s66:
4bad : a9 00 __ LDA #$00
4baf : dd c4 a2 CMP $a2c4,x ; (modplay.channel[0].smp_length + 0)
.s67:
4bb2 : 90 01 __ BCC $4bb5 ; (fx_row.s63 + 0)
4bb4 : 60 __ __ RTS
.s63:
4bb5 : bd c5 a2 LDA $a2c5,x ; (modplay.channel[0].smp_length + 1)
4bb8 : 38 __ __ SEC
4bb9 : e5 1c __ SBC ACCU + 1 
4bbb : 9d c5 a2 STA $a2c5,x ; (modplay.channel[0].smp_length + 1)
4bbe : bd c6 a2 LDA $a2c6,x ; (modplay.channel[0].smp_length + 2)
4bc1 : e9 00 __ SBC #$00
4bc3 : 9d c6 a2 STA $a2c6,x ; (modplay.channel[0].smp_length + 2)
4bc6 : b0 03 __ BCS $4bcb ; (fx_row.s99 + 0)
.s98:
4bc8 : de c7 a2 DEC $a2c7,x ; (modplay.channel[0].smp_length + 3)
.s99:
4bcb : bd c1 a2 LDA $a2c1,x ; (modplay.channel[0].smp_start + 1)
4bce : 18 __ __ CLC
4bcf : 65 1c __ ADC ACCU + 1 
4bd1 : 9d c1 a2 STA $a2c1,x ; (modplay.channel[0].smp_start + 1)
4bd4 : b0 01 __ BCS $4bd7 ; (fx_row.s101 + 0)
4bd6 : 60 __ __ RTS
.s101:
4bd7 : fe c2 a2 INC $a2c2,x ; (modplay.channel[0].smp_start + 2)
4bda : f0 01 __ BEQ $4bdd ; (fx_row.s100 + 0)
4bdc : 60 __ __ RTS
.s100:
4bdd : fe c3 a2 INC $a2c3,x ; (modplay.channel[0].smp_start + 3)
4be0 : 60 __ __ RTS
.s59:
4be1 : a9 01 __ LDA #$01
4be3 : 8d 4e a0 STA $a04e ; (modplay.skip_row_advance + 0)
4be6 : a5 1c __ LDA ACCU + 1 
4be8 : 8d 4f a0 STA $a04f ; (modplay.next_order + 0)
4beb : 4c 0d 4a JMP $4a0d ; (fx_row.s97 + 0)
.s71:
4bee : a5 1b __ LDA ACCU + 0 
4bf0 : d0 03 __ BNE $4bf5 ; (fx_row.s94 + 0)
.s72:
4bf2 : 38 __ __ SEC
4bf3 : e5 43 __ SBC T0 + 0 
.s94:
4bf5 : 9d b3 a2 STA $a2b3,x ; (modplay.channel[0].volslide + 0)
4bf8 : 60 __ __ RTS
.s73:
4bf9 : a9 40 __ LDA #$40
4bfb : c5 1c __ CMP ACCU + 1 
4bfd : b0 03 __ BCS $4c02 ; (fx_row.s29 + 0)
4bff : 4c 6c 4a JMP $4a6c ; (fx_row.s95 + 0)
.s29:
4c02 : a5 1c __ LDA ACCU + 1 
4c04 : 4c 6c 4a JMP $4a6c ; (fx_row.s95 + 0)
.s74:
4c07 : c9 04 __ CMP #$04
4c09 : f0 41 __ BEQ $4c4c ; (fx_row.s89 + 0)
.s75:
4c0b : 90 23 __ BCC $4c30 ; (fx_row.s83 + 0)
.s76:
4c0d : c9 06 __ CMP #$06
4c0f : f0 dd __ BEQ $4bee ; (fx_row.s71 + 0)
.s77:
4c11 : b0 07 __ BCS $4c1a ; (fx_row.s78 + 0)
.s82:
4c13 : a9 00 __ LDA #$00
4c15 : 9d be a2 STA $a2be,x ; (modplay.channel[0].needs_start + 0)
4c18 : 90 d4 __ BCC $4bee ; (fx_row.s71 + 0)
.s78:
4c1a : bd a3 a2 LDA $a2a3,x ; (modplay.channel[0].volume + 0)
4c1d : 9d b2 a2 STA $a2b2,x ; (modplay.channel[0].trm_basvol + 0)
4c20 : a5 43 __ LDA T0 + 0 
4c22 : f0 03 __ BEQ $4c27 ; (fx_row.s79 + 0)
.s81:
4c24 : 9d b0 a2 STA $a2b0,x ; (modplay.channel[0].trm_depth + 0)
.s79:
4c27 : a5 1b __ LDA ACCU + 0 
4c29 : d0 01 __ BNE $4c2c ; (fx_row.s80 + 0)
4c2b : 60 __ __ RTS
.s80:
4c2c : 9d b1 a2 STA $a2b1,x ; (modplay.channel[0].trm_speed + 0)
4c2f : 60 __ __ RTS
.s83:
4c30 : a8 __ __ TAY
4c31 : d0 04 __ BNE $4c37 ; (fx_row.s84 + 0)
.s88:
4c33 : 9d b4 a2 STA $a2b4,x ; (modplay.channel[0].arp_counter + 0)
4c36 : 60 __ __ RTS
.s84:
4c37 : a9 02 __ LDA #$02
4c39 : dd a5 a2 CMP $a2a5,x ; (modplay.channel[0].effect + 0)
4c3c : b0 05 __ BCS $4c43 ; (fx_row.s87 + 0)
.s85:
4c3e : a9 00 __ LDA #$00
4c40 : 9d be a2 STA $a2be,x ; (modplay.channel[0].needs_start + 0)
.s87:
4c43 : a5 1c __ LDA ACCU + 1 
4c45 : d0 01 __ BNE $4c48 ; (fx_row.s86 + 0)
4c47 : 60 __ __ RTS
.s86:
4c48 : 9d a9 a2 STA $a2a9,x ; (modplay.channel[0].porta_speed + 0)
4c4b : 60 __ __ RTS
.s89:
4c4c : a5 43 __ LDA T0 + 0 
4c4e : f0 03 __ BEQ $4c53 ; (fx_row.s90 + 0)
.s92:
4c50 : 9d ac a2 STA $a2ac,x ; (modplay.channel[0].vib_depth + 0)
.s90:
4c53 : a5 1b __ LDA ACCU + 0 
4c55 : d0 01 __ BNE $4c58 ; (fx_row.s91 + 0)
4c57 : 60 __ __ RTS
.s91:
4c58 : 9d ad a2 STA $a2ad,x ; (modplay.channel[0].vib_speed + 0)
4c5b : 60 __ __ RTS
--------------------------------------------------------------------
clamp_period: ; clamp_period(u16)->u16
; 144, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4c5c : a5 0e __ LDA P1 ; (p + 1)
4c5e : d0 0f __ BNE $4c6f ; (clamp_period.s5 + 0)
.s11:
4c60 : a5 0d __ LDA P0 ; (p + 0)
4c62 : c9 71 __ CMP #$71
4c64 : b0 09 __ BCS $4c6f ; (clamp_period.s5 + 0)
.s10:
4c66 : a9 00 __ LDA #$00
4c68 : a0 71 __ LDY #$71
.s3:
4c6a : 84 1b __ STY ACCU + 0 
4c6c : 85 1c __ STA ACCU + 1 
4c6e : 60 __ __ RTS
.s5:
4c6f : a9 03 __ LDA #$03
4c71 : c5 0e __ CMP P1 ; (p + 1)
4c73 : f0 04 __ BEQ $4c79 ; (clamp_period.s8 + 0)
.s9:
4c75 : 90 08 __ BCC $4c7f ; (clamp_period.s7 + 0)
4c77 : b0 0c __ BCS $4c85 ; (clamp_period.s6 + 0)
.s8:
4c79 : a5 0d __ LDA P0 ; (p + 0)
4c7b : c9 59 __ CMP #$59
4c7d : 90 06 __ BCC $4c85 ; (clamp_period.s6 + 0)
.s7:
4c7f : a9 03 __ LDA #$03
4c81 : a0 58 __ LDY #$58
4c83 : d0 e5 __ BNE $4c6a ; (clamp_period.s3 + 0)
.s6:
4c85 : a5 0e __ LDA P1 ; (p + 1)
4c87 : a4 0d __ LDY P0 ; (p + 0)
4c89 : 4c 6a 4c JMP $4c6a ; (clamp_period.s3 + 0)
--------------------------------------------------------------------
clamp_vol: ; clamp_vol(i8)->u8
; 132, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4c8c : 85 1b __ STA ACCU + 0 
4c8e : aa __ __ TAX
4c8f : 10 03 __ BPL $4c94 ; (clamp_vol.s5 + 0)
.s7:
4c91 : a9 00 __ LDA #$00
.s3:
4c93 : 60 __ __ RTS
.s5:
4c94 : a9 40 __ LDA #$40
4c96 : c5 1b __ CMP ACCU + 0 
4c98 : 90 f9 __ BCC $4c93 ; (clamp_vol.s3 + 0)
.s6:
4c9a : a5 1b __ LDA ACCU + 0 
4c9c : 60 __ __ RTS
--------------------------------------------------------------------
fx_tick: ; fx_tick(u8)->void
; 433, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4c9d : a4 0f __ LDY P2 ; (ch_idx + 0)
4c9f : be 8d 7f LDX $7f8d,y ; (__multab50L + 0)
4ca2 : 86 45 __ STX T3 + 0 
4ca4 : bd a5 a2 LDA $a2a5,x ; (modplay.channel[0].effect + 0)
4ca7 : c9 05 __ CMP #$05
4ca9 : d0 05 __ BNE $4cb0 ; (fx_tick.s6 + 0)
.s5:
4cab : a0 01 __ LDY #$01
4cad : 4c 12 4e JMP $4e12 ; (fx_tick.s34 + 0)
.s6:
4cb0 : 85 47 __ STA T5 + 0 
4cb2 : c9 05 __ CMP #$05
4cb4 : b0 03 __ BCS $4cb9 ; (fx_tick.s7 + 0)
4cb6 : 4c ef 4d JMP $4def ; (fx_tick.s31 + 0)
.s7:
4cb9 : c9 0a __ CMP #$0a
4cbb : d0 03 __ BNE $4cc0 ; (fx_tick.s8 + 0)
4cbd : 4c e0 4d JMP $4de0 ; (fx_tick.s29 + 0)
.s8:
4cc0 : 90 4d __ BCC $4d0f ; (fx_tick.s20 + 0)
.s9:
4cc2 : c9 0e __ CMP #$0e
4cc4 : d0 21 __ BNE $4ce7 ; (fx_tick.s3 + 0)
.s10:
4cc6 : bd a6 a2 LDA $a2a6,x ; (modplay.channel[0].eparam + 0)
4cc9 : 4a __ __ LSR
4cca : 4a __ __ LSR
4ccb : 4a __ __ LSR
4ccc : 4a __ __ LSR
4ccd : c9 0c __ CMP #$0c
4ccf : f0 2d __ BEQ $4cfe ; (fx_tick.s18 + 0)
.s11:
4cd1 : 90 15 __ BCC $4ce8 ; (fx_tick.s15 + 0)
.s12:
4cd3 : c9 0d __ CMP #$0d
4cd5 : d0 10 __ BNE $4ce7 ; (fx_tick.s3 + 0)
.s13:
4cd7 : fe b9 a2 INC $a2b9,x ; (modplay.channel[0].tick_cur + 0)
4cda : bd b9 a2 LDA $a2b9,x ; (modplay.channel[0].tick_cur + 0)
4cdd : dd b8 a2 CMP $a2b8,x ; (modplay.channel[0].tick_stop + 0)
4ce0 : d0 05 __ BNE $4ce7 ; (fx_tick.s3 + 0)
.s14:
4ce2 : a9 01 __ LDA #$01
4ce4 : 9d be a2 STA $a2be,x ; (modplay.channel[0].needs_start + 0)
.s3:
4ce7 : 60 __ __ RTS
.s15:
4ce8 : c9 09 __ CMP #$09
4cea : d0 fb __ BNE $4ce7 ; (fx_tick.s3 + 0)
.s16:
4cec : fe b9 a2 INC $a2b9,x ; (modplay.channel[0].tick_cur + 0)
4cef : bd b9 a2 LDA $a2b9,x ; (modplay.channel[0].tick_cur + 0)
4cf2 : dd b8 a2 CMP $a2b8,x ; (modplay.channel[0].tick_stop + 0)
4cf5 : 90 f0 __ BCC $4ce7 ; (fx_tick.s3 + 0)
.s17:
4cf7 : a9 00 __ LDA #$00
4cf9 : 9d b9 a2 STA $a2b9,x ; (modplay.channel[0].tick_cur + 0)
4cfc : b0 e4 __ BCS $4ce2 ; (fx_tick.s14 + 0)
.s18:
4cfe : fe b9 a2 INC $a2b9,x ; (modplay.channel[0].tick_cur + 0)
4d01 : bd b9 a2 LDA $a2b9,x ; (modplay.channel[0].tick_cur + 0)
4d04 : dd b8 a2 CMP $a2b8,x ; (modplay.channel[0].tick_stop + 0)
4d07 : 90 de __ BCC $4ce7 ; (fx_tick.s3 + 0)
.s19:
4d09 : a9 00 __ LDA #$00
.s60:
4d0b : 9d a3 a2 STA $a2a3,x ; (modplay.channel[0].volume + 0)
4d0e : 60 __ __ RTS
.s20:
4d0f : c9 06 __ CMP #$06
4d11 : f0 58 __ BEQ $4d6b ; (fx_tick.s26 + 0)
.s21:
4d13 : c9 07 __ CMP #$07
4d15 : d0 d0 __ BNE $4ce7 ; (fx_tick.s3 + 0)
.s22:
4d17 : bd ae a2 LDA $a2ae,x ; (modplay.channel[0].trm_wave + 0)
4d1a : 85 0d __ STA P0 
4d1c : bd af a2 LDA $a2af,x ; (modplay.channel[0].trm_pos + 0)
4d1f : 85 0e __ STA P1 
4d21 : 20 f3 4e JSR $4ef3 ; (wave_value.s4 + 0)
4d24 : aa __ __ TAX
4d25 : a4 45 __ LDY T3 + 0 
4d27 : b9 b0 a2 LDA $a2b0,y ; (modplay.channel[0].trm_depth + 0)
4d2a : 85 1b __ STA ACCU + 0 
4d2c : a9 00 __ LDA #$00
4d2e : 85 1c __ STA ACCU + 1 
4d30 : 8a __ __ TXA
4d31 : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
4d34 : a5 1c __ LDA ACCU + 1 
4d36 : 85 43 __ STA T0 + 0 
4d38 : a5 1b __ LDA ACCU + 0 
4d3a : 0a __ __ ASL
4d3b : 26 43 __ ROL T0 + 0 
4d3d : 0a __ __ ASL
4d3e : 26 43 __ ROL T0 + 0 
4d40 : a5 0e __ LDA P1 
4d42 : a4 45 __ LDY T3 + 0 
4d44 : 29 10 __ AND #$10
4d46 : d0 09 __ BNE $4d51 ; (fx_tick.s25 + 0)
.s23:
4d48 : 18 __ __ CLC
4d49 : a5 43 __ LDA T0 + 0 
4d4b : 79 b2 a2 ADC $a2b2,y ; (modplay.channel[0].trm_basvol + 0)
4d4e : 4c 57 4d JMP $4d57 ; (fx_tick.s24 + 0)
.s25:
4d51 : b9 b2 a2 LDA $a2b2,y ; (modplay.channel[0].trm_basvol + 0)
4d54 : 38 __ __ SEC
4d55 : e5 43 __ SBC T0 + 0 
.s24:
4d57 : 20 8c 4c JSR $4c8c ; (clamp_vol.s4 + 0)
4d5a : a6 45 __ LDX T3 + 0 
4d5c : 9d a3 a2 STA $a2a3,x ; (modplay.channel[0].volume + 0)
4d5f : bd b1 a2 LDA $a2b1,x ; (modplay.channel[0].trm_speed + 0)
4d62 : 18 __ __ CLC
4d63 : 65 0e __ ADC P1 
4d65 : 29 3f __ AND #$3f
4d67 : 9d af a2 STA $a2af,x ; (modplay.channel[0].trm_pos + 0)
4d6a : 60 __ __ RTS
.s26:
4d6b : bd aa a2 LDA $a2aa,x ; (modplay.channel[0].vib_wave + 0)
4d6e : 85 0d __ STA P0 
4d70 : bd ab a2 LDA $a2ab,x ; (modplay.channel[0].vib_pos + 0)
4d73 : 85 0e __ STA P1 
4d75 : 20 f3 4e JSR $4ef3 ; (wave_value.s4 + 0)
4d78 : aa __ __ TAX
4d79 : a4 45 __ LDY T3 + 0 
4d7b : b9 ac a2 LDA $a2ac,y ; (modplay.channel[0].vib_depth + 0)
4d7e : 85 1b __ STA ACCU + 0 
4d80 : a9 00 __ LDA #$00
4d82 : 85 1c __ STA ACCU + 1 
4d84 : 8a __ __ TXA
4d85 : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
4d88 : a5 1c __ LDA ACCU + 1 
4d8a : 06 1b __ ASL ACCU + 0 
4d8c : 2a __ __ ROL
4d8d : 85 43 __ STA T0 + 0 
4d8f : a9 00 __ LDA #$00
4d91 : 2a __ __ ROL
4d92 : 85 44 __ STA T0 + 1 
4d94 : a5 0e __ LDA P1 
4d96 : 85 46 __ STA T4 + 0 
4d98 : a4 45 __ LDY T3 + 0 
4d9a : 29 10 __ AND #$10
4d9c : d0 0f __ BNE $4dad ; (fx_tick.s30 + 0)
.s27:
4d9e : b9 9f a2 LDA $a29f,y ; (modplay.channel[0].period + 0)
4da1 : 65 43 __ ADC T0 + 0 
4da3 : 85 0d __ STA P0 
4da5 : b9 a0 a2 LDA $a2a0,y ; (modplay.channel[0].period + 1)
4da8 : 65 44 __ ADC T0 + 1 
4daa : 4c ba 4d JMP $4dba ; (fx_tick.s28 + 0)
.s30:
4dad : b9 9f a2 LDA $a29f,y ; (modplay.channel[0].period + 0)
4db0 : 38 __ __ SEC
4db1 : e5 43 __ SBC T0 + 0 
4db3 : 85 0d __ STA P0 
4db5 : b9 a0 a2 LDA $a2a0,y ; (modplay.channel[0].period + 1)
4db8 : e5 44 __ SBC T0 + 1 
.s28:
4dba : 85 0e __ STA P1 
4dbc : 20 5c 4c JSR $4c5c ; (clamp_period.s4 + 0)
4dbf : 20 4f 49 JSR $494f ; (period_to_rate@proxy + 0)
4dc2 : a5 1b __ LDA ACCU + 0 
4dc4 : a6 45 __ LDX T3 + 0 
4dc6 : 9d a1 a2 STA $a2a1,x ; (modplay.channel[0].rate + 0)
4dc9 : a5 1c __ LDA ACCU + 1 
4dcb : 9d a2 a2 STA $a2a2,x ; (modplay.channel[0].rate + 1)
4dce : bd ad a2 LDA $a2ad,x ; (modplay.channel[0].vib_speed + 0)
4dd1 : 18 __ __ CLC
4dd2 : 65 46 __ ADC T4 + 0 
4dd4 : 29 3f __ AND #$3f
4dd6 : 9d ab a2 STA $a2ab,x ; (modplay.channel[0].vib_pos + 0)
4dd9 : a5 47 __ LDA T5 + 0 
4ddb : c9 06 __ CMP #$06
4ddd : f0 01 __ BEQ $4de0 ; (fx_tick.s29 + 0)
4ddf : 60 __ __ RTS
.s29:
4de0 : bd a3 a2 LDA $a2a3,x ; (modplay.channel[0].volume + 0)
4de3 : 18 __ __ CLC
4de4 : 7d b3 a2 ADC $a2b3,x ; (modplay.channel[0].volslide + 0)
4de7 : 20 8c 4c JSR $4c8c ; (clamp_vol.s4 + 0)
4dea : a6 45 __ LDX T3 + 0 
4dec : 4c 0b 4d JMP $4d0b ; (fx_tick.s60 + 0)
.s31:
4def : c9 02 __ CMP #$02
4df1 : d0 11 __ BNE $4e04 ; (fx_tick.s32 + 0)
.s59:
4df3 : bd a9 a2 LDA $a2a9,x ; (modplay.channel[0].porta_speed + 0)
4df6 : 18 __ __ CLC
4df7 : 7d 9f a2 ADC $a29f,x ; (modplay.channel[0].period + 0)
4dfa : 85 0d __ STA P0 
4dfc : bd a0 a2 LDA $a2a0,x ; (modplay.channel[0].period + 1)
4dff : 69 00 __ ADC #$00
4e01 : 4c ce 4e JMP $4ece ; (fx_tick.s57 + 0)
.s32:
4e04 : b0 03 __ BCS $4e09 ; (fx_tick.s33 + 0)
4e06 : 4c a0 4e JMP $4ea0 ; (fx_tick.s51 + 0)
.s33:
4e09 : a0 00 __ LDY #$00
4e0b : c9 03 __ CMP #$03
4e0d : f0 03 __ BEQ $4e12 ; (fx_tick.s34 + 0)
4e0f : 4c 6b 4d JMP $4d6b ; (fx_tick.s26 + 0)
.s34:
4e12 : bd a7 a2 LDA $a2a7,x ; (modplay.channel[0].porta_target + 0)
4e15 : 85 43 __ STA T0 + 0 
4e17 : bd a8 a2 LDA $a2a8,x ; (modplay.channel[0].porta_target + 1)
4e1a : 85 44 __ STA T0 + 1 
4e1c : 05 43 __ ORA T0 + 0 
4e1e : f0 58 __ BEQ $4e78 ; (fx_tick.s35 + 0)
.s36:
4e20 : bd a2 a2 LDA $a2a2,x ; (modplay.channel[0].rate + 1)
4e23 : 85 1c __ STA ACCU + 1 
4e25 : c5 44 __ CMP T0 + 1 
4e27 : d0 09 __ BNE $4e32 ; (fx_tick.s37 + 0)
.s50:
4e29 : a5 43 __ LDA T0 + 0 
4e2b : dd a1 a2 CMP $a2a1,x ; (modplay.channel[0].rate + 0)
4e2e : f0 48 __ BEQ $4e78 ; (fx_tick.s35 + 0)
.s61:
4e30 : a5 1c __ LDA ACCU + 1 
.s37:
4e32 : c5 44 __ CMP T0 + 1 
4e34 : d0 05 __ BNE $4e3b ; (fx_tick.s49 + 0)
.s48:
4e36 : bd a1 a2 LDA $a2a1,x ; (modplay.channel[0].rate + 0)
4e39 : c5 43 __ CMP T0 + 0 
.s49:
4e3b : 90 42 __ BCC $4e7f ; (fx_tick.s45 + 0)
.s38:
4e3d : a5 1c __ LDA ACCU + 1 
4e3f : d0 11 __ BNE $4e52 ; (fx_tick.s43 + 0)
.s44:
4e41 : bd a9 a2 LDA $a2a9,x ; (modplay.channel[0].porta_speed + 0)
4e44 : dd a1 a2 CMP $a2a1,x ; (modplay.channel[0].rate + 0)
4e47 : 90 09 __ BCC $4e52 ; (fx_tick.s43 + 0)
.s39:
4e49 : a5 43 __ LDA T0 + 0 
4e4b : 9d a1 a2 STA $a2a1,x ; (modplay.channel[0].rate + 0)
4e4e : a5 44 __ LDA T0 + 1 
4e50 : b0 0e __ BCS $4e60 ; (fx_tick.s40 + 0)
.s43:
4e52 : bd a1 a2 LDA $a2a1,x ; (modplay.channel[0].rate + 0)
4e55 : 38 __ __ SEC
4e56 : fd a9 a2 SBC $a2a9,x ; (modplay.channel[0].porta_speed + 0)
4e59 : 9d a1 a2 STA $a2a1,x ; (modplay.channel[0].rate + 0)
4e5c : a5 1c __ LDA ACCU + 1 
4e5e : e9 00 __ SBC #$00
.s40:
4e60 : 9d a2 a2 STA $a2a2,x ; (modplay.channel[0].rate + 1)
4e63 : c5 44 __ CMP T0 + 1 
4e65 : d0 05 __ BNE $4e6c ; (fx_tick.s47 + 0)
.s42:
4e67 : bd a1 a2 LDA $a2a1,x ; (modplay.channel[0].rate + 0)
4e6a : c5 43 __ CMP T0 + 0 
.s47:
4e6c : b0 0a __ BCS $4e78 ; (fx_tick.s35 + 0)
.s41:
4e6e : a5 43 __ LDA T0 + 0 
4e70 : 9d a1 a2 STA $a2a1,x ; (modplay.channel[0].rate + 0)
4e73 : a5 44 __ LDA T0 + 1 
4e75 : 9d a2 a2 STA $a2a2,x ; (modplay.channel[0].rate + 1)
.s35:
4e78 : 98 __ __ TYA
4e79 : f0 03 __ BEQ $4e7e ; (fx_tick.s35 + 6)
4e7b : 4c e0 4d JMP $4de0 ; (fx_tick.s29 + 0)
4e7e : 60 __ __ RTS
.s45:
4e7f : bd a9 a2 LDA $a2a9,x ; (modplay.channel[0].porta_speed + 0)
4e82 : 7d a1 a2 ADC $a2a1,x ; (modplay.channel[0].rate + 0)
4e85 : 85 1b __ STA ACCU + 0 
4e87 : 9d a1 a2 STA $a2a1,x ; (modplay.channel[0].rate + 0)
4e8a : a5 1c __ LDA ACCU + 1 
4e8c : 69 00 __ ADC #$00
4e8e : 85 1c __ STA ACCU + 1 
4e90 : 9d a2 a2 STA $a2a2,x ; (modplay.channel[0].rate + 1)
4e93 : a5 44 __ LDA T0 + 1 
4e95 : c5 1c __ CMP ACCU + 1 
4e97 : d0 d3 __ BNE $4e6c ; (fx_tick.s47 + 0)
.s46:
4e99 : a5 43 __ LDA T0 + 0 
4e9b : c5 1b __ CMP ACCU + 0 
4e9d : 4c 6c 4e JMP $4e6c ; (fx_tick.s47 + 0)
.s51:
4ea0 : a8 __ __ TAY
4ea1 : d0 10 __ BNE $4eb3 ; (fx_tick.s55 + 0)
.s52:
4ea3 : bd a6 a2 LDA $a2a6,x ; (modplay.channel[0].eparam + 0)
4ea6 : d0 01 __ BNE $4ea9 ; (fx_tick.s53 + 0)
4ea8 : 60 __ __ RTS
.s53:
4ea9 : bd 9e a2 LDA $a29e,x ; (modplay.channel[0].sample_num + 0)
4eac : d0 01 __ BNE $4eaf ; (fx_tick.s54 + 0)
4eae : 60 __ __ RTS
.s54:
4eaf : fe b4 a2 INC $a2b4,x ; (modplay.channel[0].arp_counter + 0)
4eb2 : 60 __ __ RTS
.s55:
4eb3 : bd a0 a2 LDA $a2a0,x ; (modplay.channel[0].period + 1)
4eb6 : d0 08 __ BNE $4ec0 ; (fx_tick.s56 + 0)
.s58:
4eb8 : a9 71 __ LDA #$71
4eba : dd 9f a2 CMP $a29f,x ; (modplay.channel[0].period + 0)
4ebd : 90 01 __ BCC $4ec0 ; (fx_tick.s56 + 0)
4ebf : 60 __ __ RTS
.s56:
4ec0 : bd 9f a2 LDA $a29f,x ; (modplay.channel[0].period + 0)
4ec3 : 38 __ __ SEC
4ec4 : fd a9 a2 SBC $a2a9,x ; (modplay.channel[0].porta_speed + 0)
4ec7 : 85 0d __ STA P0 
4ec9 : bd a0 a2 LDA $a2a0,x ; (modplay.channel[0].period + 1)
4ecc : e9 00 __ SBC #$00
.s57:
4ece : 85 0e __ STA P1 
4ed0 : 20 5c 4c JSR $4c5c ; (clamp_period.s4 + 0)
4ed3 : a5 1b __ LDA ACCU + 0 
4ed5 : 85 0d __ STA P0 
4ed7 : a6 45 __ LDX T3 + 0 
4ed9 : 9d 9f a2 STA $a29f,x ; (modplay.channel[0].period + 0)
4edc : a5 1c __ LDA ACCU + 1 
4ede : 85 0e __ STA P1 
4ee0 : 9d a0 a2 STA $a2a0,x ; (modplay.channel[0].period + 1)
4ee3 : 20 57 49 JSR $4957 ; (period_to_rate.s4 + 0)
4ee6 : a5 1b __ LDA ACCU + 0 
4ee8 : a6 45 __ LDX T3 + 0 
4eea : 9d a1 a2 STA $a2a1,x ; (modplay.channel[0].rate + 0)
4eed : a5 1c __ LDA ACCU + 1 
4eef : 9d a2 a2 STA $a2a2,x ; (modplay.channel[0].rate + 1)
4ef2 : 60 __ __ RTS
--------------------------------------------------------------------
wave_value: ; wave_value(u8,u8)->u8
; 156, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4ef3 : a5 0e __ LDA P1 ; (pos + 0)
4ef5 : 29 1f __ AND #$1f
4ef7 : a8 __ __ TAY
4ef8 : a5 0d __ LDA P0 ; (wave + 0)
4efa : 29 03 __ AND #$03
4efc : c9 01 __ CMP #$01
4efe : d0 07 __ BNE $4f07 ; (wave_value.s5 + 0)
.s10:
4f00 : 98 __ __ TYA
4f01 : 0a __ __ ASL
4f02 : 0a __ __ ASL
4f03 : 0a __ __ ASL
4f04 : 49 ff __ EOR #$ff
.s3:
4f06 : 60 __ __ RTS
.s5:
4f07 : aa __ __ TAX
4f08 : d0 04 __ BNE $4f0e ; (wave_value.s6 + 0)
.s9:
4f0a : b9 50 84 LDA $8450,y ; (vib_sine[0] + 0)
4f0d : 60 __ __ RTS
.s6:
4f0e : c9 02 __ CMP #$02
4f10 : d0 03 __ BNE $4f15 ; (wave_value.s7 + 0)
.s8:
4f12 : a9 ff __ LDA #$ff
4f14 : 60 __ __ RTS
.s7:
4f15 : 98 __ __ TYA
4f16 : 0a __ __ ASL
4f17 : 0a __ __ ASL
4f18 : 0a __ __ ASL
4f19 : 60 __ __ RTS
--------------------------------------------------------------------
ua_update_channel: ; ua_update_channel(u8)->void
;  86, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s1:
4f1a : 38 __ __ SEC
4f1b : a5 23 __ LDA SP + 0 
4f1d : e9 0c __ SBC #$0c
4f1f : 85 23 __ STA SP + 0 
4f21 : b0 02 __ BCS $4f25 ; (ua_update_channel.s1 + 11)
4f23 : c6 24 __ DEC SP + 1 
4f25 : a0 03 __ LDY #$03
4f27 : b9 53 00 LDA $0053,y 
4f2a : 91 23 __ STA (SP + 0),y 
4f2c : 88 __ __ DEY
4f2d : 10 f8 __ BPL $4f27 ; (ua_update_channel.s1 + 13)
.s4:
4f2f : ad 4a a0 LDA $a04a ; (modplay.master_volume + 0)
4f32 : 85 1b __ STA ACCU + 0 
4f34 : a6 13 __ LDX P6 ; (ch + 0)
4f36 : 86 47 __ STX T1 + 0 
4f38 : bd 8d 7f LDA $7f8d,x ; (__multab50L + 0)
4f3b : 85 43 __ STA T0 + 0 
4f3d : aa __ __ TAX
4f3e : a9 00 __ LDA #$00
4f40 : 85 1c __ STA ACCU + 1 
4f42 : bd a3 a2 LDA $a2a3,x ; (modplay.channel[0].volume + 0)
4f45 : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
4f48 : a5 1c __ LDA ACCU + 1 
4f4a : 85 50 __ STA T6 + 0 
4f4c : a5 1b __ LDA ACCU + 0 
4f4e : 0a __ __ ASL
4f4f : 26 50 __ ROL T6 + 0 
4f51 : 0a __ __ ASL
4f52 : 26 50 __ ROL T6 + 0 
4f54 : a4 43 __ LDY T0 + 0 
4f56 : b9 be a2 LDA $a2be,y ; (modplay.channel[0].needs_start + 0)
4f59 : d0 5f __ BNE $4fba ; (ua_update_channel.s10 + 0)
.s5:
4f5b : a5 50 __ LDA T6 + 0 
4f5d : d9 bb a2 CMP $a2bb,y ; (modplay.channel[0].ua_vol + 0)
4f60 : f0 0f __ BEQ $4f71 ; (ua_update_channel.s6 + 0)
.s9:
4f62 : 06 47 __ ASL T1 + 0 
4f64 : a4 47 __ LDY T1 + 0 
4f66 : be d5 80 LDX $80d5,y ; (audio_ch_base[0] + 0)
4f69 : 9d 01 df STA $df01,x 
4f6c : a4 43 __ LDY T0 + 0 
4f6e : 99 bb a2 STA $a2bb,y ; (modplay.channel[0].ua_vol + 0)
.s6:
4f71 : b9 a2 a2 LDA $a2a2,y ; (modplay.channel[0].rate + 1)
4f74 : d9 bd a2 CMP $a2bd,y ; (modplay.channel[0].ua_rate + 1)
4f77 : d0 08 __ BNE $4f81 ; (ua_update_channel.s7 + 0)
.s8:
4f79 : b9 a1 a2 LDA $a2a1,y ; (modplay.channel[0].rate + 0)
4f7c : d9 bc a2 CMP $a2bc,y ; (modplay.channel[0].ua_rate + 0)
4f7f : f0 23 __ BEQ $4fa4 ; (ua_update_channel.s3 + 0)
.s7:
4f81 : b9 a1 a2 LDA $a2a1,y ; (modplay.channel[0].rate + 0)
4f84 : 85 0e __ STA P1 
4f86 : a5 13 __ LDA P6 ; (ch + 0)
4f88 : 0a __ __ ASL
4f89 : aa __ __ TAX
4f8a : b9 a2 a2 LDA $a2a2,y ; (modplay.channel[0].rate + 1)
4f8d : 85 0f __ STA P2 
4f8f : bc d5 80 LDY $80d5,x ; (audio_ch_base[0] + 0)
4f92 : 99 0e df STA $df0e,y 
4f95 : a5 0e __ LDA P1 
4f97 : 99 0f df STA $df0f,y 
4f9a : a6 43 __ LDX T0 + 0 
4f9c : 9d bc a2 STA $a2bc,x ; (modplay.channel[0].ua_rate + 0)
4f9f : a5 0f __ LDA P2 
.s14:
4fa1 : 9d bd a2 STA $a2bd,x ; (modplay.channel[0].ua_rate + 1)
.s3:
4fa4 : a0 03 __ LDY #$03
4fa6 : b1 23 __ LDA (SP + 0),y 
4fa8 : 99 53 00 STA $0053,y 
4fab : 88 __ __ DEY
4fac : 10 f8 __ BPL $4fa6 ; (ua_update_channel.s3 + 2)
4fae : 18 __ __ CLC
4faf : a5 23 __ LDA SP + 0 
4fb1 : 69 0c __ ADC #$0c
4fb3 : 85 23 __ STA SP + 0 
4fb5 : 90 02 __ BCC $4fb9 ; (ua_update_channel.s3 + 21)
4fb7 : e6 24 __ INC SP + 1 
4fb9 : 60 __ __ RTS
.s10:
4fba : 84 51 __ STY T7 + 0 
4fbc : a5 13 __ LDA P6 ; (ch + 0)
4fbe : 85 0d __ STA P0 
4fc0 : a9 00 __ LDA #$00
4fc2 : 99 be a2 STA $a2be,y ; (modplay.channel[0].needs_start + 0)
4fc5 : b9 c0 a2 LDA $a2c0,y ; (modplay.channel[0].smp_start + 0)
4fc8 : 85 0e __ STA P1 
4fca : b9 c1 a2 LDA $a2c1,y ; (modplay.channel[0].smp_start + 1)
4fcd : 85 0f __ STA P2 
4fcf : b9 c2 a2 LDA $a2c2,y ; (modplay.channel[0].smp_start + 2)
4fd2 : 85 10 __ STA P3 
4fd4 : b9 c3 a2 LDA $a2c3,y ; (modplay.channel[0].smp_start + 3)
4fd7 : 85 11 __ STA P4 
4fd9 : 06 47 __ ASL T1 + 0 
4fdb : a6 47 __ LDX T1 + 0 
4fdd : bd d5 80 LDA $80d5,x ; (audio_ch_base[0] + 0)
4fe0 : 85 4f __ STA T5 + 0 
4fe2 : 85 53 __ STA T8 + 0 
4fe4 : b9 a1 a2 LDA $a2a1,y ; (modplay.channel[0].rate + 0)
4fe7 : 85 55 __ STA T9 + 0 
4fe9 : a9 df __ LDA #$df
4feb : 85 54 __ STA T8 + 1 
4fed : b9 a2 a2 LDA $a2a2,y ; (modplay.channel[0].rate + 1)
4ff0 : 85 56 __ STA T9 + 1 
4ff2 : b9 c4 a2 LDA $a2c4,y ; (modplay.channel[0].smp_length + 0)
4ff5 : 85 43 __ STA T0 + 0 
4ff7 : b9 c5 a2 LDA $a2c5,y ; (modplay.channel[0].smp_length + 1)
4ffa : 85 44 __ STA T0 + 1 
4ffc : b9 c6 a2 LDA $a2c6,y ; (modplay.channel[0].smp_length + 2)
4fff : 85 45 __ STA T0 + 2 
5001 : b9 c7 a2 LDA $a2c7,y ; (modplay.channel[0].smp_length + 3)
5004 : 85 46 __ STA T0 + 3 
5006 : b9 bf a2 LDA $a2bf,y ; (modplay.channel[0].needs_loop + 0)
5009 : d0 03 __ BNE $500e ; (ua_update_channel.s13 + 0)
500b : 4c 93 50 JMP $5093 ; (ua_update_channel.s11 + 0)
.s13:
500e : a6 51 __ LDX T7 + 0 
5010 : bd c8 a2 LDA $a2c8,x ; (modplay.channel[0].smp_loop_a + 0)
5013 : 85 47 __ STA T1 + 0 
5015 : bd c9 a2 LDA $a2c9,x ; (modplay.channel[0].smp_loop_a + 1)
5018 : 85 48 __ STA T1 + 1 
501a : bd ca a2 LDA $a2ca,x ; (modplay.channel[0].smp_loop_a + 2)
501d : 85 49 __ STA T1 + 2 
501f : bd cb a2 LDA $a2cb,x ; (modplay.channel[0].smp_loop_a + 3)
5022 : 85 4a __ STA T1 + 3 
5024 : bd cc a2 LDA $a2cc,x ; (modplay.channel[0].smp_loop_b + 0)
5027 : 85 4b __ STA T2 + 0 
5029 : bd cd a2 LDA $a2cd,x ; (modplay.channel[0].smp_loop_b + 1)
502c : 85 4c __ STA T2 + 1 
502e : bd ce a2 LDA $a2ce,x ; (modplay.channel[0].smp_loop_b + 2)
5031 : 85 4d __ STA T2 + 2 
5033 : bd cf a2 LDA $a2cf,x ; (modplay.channel[0].smp_loop_b + 3)
5036 : 85 4e __ STA T2 + 3 
5038 : a9 00 __ LDA #$00
503a : a6 4f __ LDX T5 + 0 
503c : 9d 00 df STA $df00,x 
503f : a5 50 __ LDA T6 + 0 
5041 : 9d 01 df STA $df01,x 
5044 : b9 a4 a2 LDA $a2a4,y ; (modplay.channel[0].pan + 0)
5047 : 9d 02 df STA $df02,x 
504a : 20 d1 50 JSR $50d1 ; (ch_wr_sms.s4 + 0)
504d : 20 ed 50 JSR $50ed ; (ch_wr_be24@proxy + 0)
5050 : a5 0d __ LDA P0 
5052 : 0a __ __ ASL
5053 : aa __ __ TAX
5054 : a5 56 __ LDA T9 + 1 
5056 : bc d5 80 LDY $80d5,x ; (audio_ch_base[0] + 0)
5059 : 99 0e df STA $df0e,y 
505c : a5 55 __ LDA T9 + 0 
505e : 99 0f df STA $df0f,y 
5061 : a5 47 __ LDA T1 + 0 
5063 : 85 0f __ STA P2 
5065 : a9 11 __ LDA #$11
5067 : 85 0e __ STA P1 
5069 : a5 48 __ LDA T1 + 1 
506b : 85 10 __ STA P3 
506d : a5 49 __ LDA T1 + 2 
506f : 85 11 __ STA P4 
5071 : a5 4a __ LDA T1 + 3 
5073 : 85 12 __ STA P5 
5075 : 20 01 51 JSR $5101 ; (ch_wr_be24.s4 + 0)
5078 : a5 4b __ LDA T2 + 0 
507a : 85 0f __ STA P2 
507c : a9 15 __ LDA #$15
507e : 85 0e __ STA P1 
5080 : a5 4c __ LDA T2 + 1 
5082 : 85 10 __ STA P3 
5084 : a5 4d __ LDA T2 + 2 
5086 : 85 11 __ STA P4 
5088 : a5 4e __ LDA T2 + 3 
508a : 85 12 __ STA P5 
508c : 20 01 51 JSR $5101 ; (ch_wr_be24.s4 + 0)
508f : a9 03 __ LDA #$03
5091 : d0 29 __ BNE $50bc ; (ua_update_channel.s12 + 0)
.s11:
5093 : a6 4f __ LDX T5 + 0 
5095 : 9d 00 df STA $df00,x 
5098 : a5 50 __ LDA T6 + 0 
509a : 9d 01 df STA $df01,x 
509d : b9 a4 a2 LDA $a2a4,y ; (modplay.channel[0].pan + 0)
50a0 : 9d 02 df STA $df02,x 
50a3 : 20 d1 50 JSR $50d1 ; (ch_wr_sms.s4 + 0)
50a6 : 20 ed 50 JSR $50ed ; (ch_wr_be24@proxy + 0)
50a9 : a5 0d __ LDA P0 
50ab : 0a __ __ ASL
50ac : aa __ __ TAX
50ad : a5 56 __ LDA T9 + 1 
50af : bc d5 80 LDY $80d5,x ; (audio_ch_base[0] + 0)
50b2 : 99 0e df STA $df0e,y 
50b5 : a5 55 __ LDA T9 + 0 
50b7 : 99 0f df STA $df0f,y 
50ba : a9 01 __ LDA #$01
.s12:
50bc : a0 00 __ LDY #$00
50be : 91 53 __ STA (T8 + 0),y 
50c0 : a5 50 __ LDA T6 + 0 
50c2 : a6 51 __ LDX T7 + 0 
50c4 : 9d bb a2 STA $a2bb,x ; (modplay.channel[0].ua_vol + 0)
50c7 : a5 55 __ LDA T9 + 0 
50c9 : 9d bc a2 STA $a2bc,x ; (modplay.channel[0].ua_rate + 0)
50cc : a5 56 __ LDA T9 + 1 
50ce : 4c a1 4f JMP $4fa1 ; (ua_update_channel.s14 + 0)
--------------------------------------------------------------------
ch_wr_sms: ; ch_wr_sms(u8,u32)->void
;  40, "/home/xahmol/git/UltimateDemo2026/include/audio.c"
.s4:
50d1 : a5 0d __ LDA P0 ; (ch + 0)
50d3 : 0a __ __ ASL
50d4 : a8 __ __ TAY
50d5 : a9 01 __ LDA #$01
50d7 : be d5 80 LDX $80d5,y ; (audio_ch_base[0] + 0)
50da : 9d 04 df STA $df04,x 
50dd : a5 10 __ LDA P3 ; (addr + 2)
50df : 9d 05 df STA $df05,x 
50e2 : a5 0f __ LDA P2 ; (addr + 1)
50e4 : 9d 06 df STA $df06,x 
50e7 : a5 0e __ LDA P1 ; (addr + 0)
50e9 : 9d 07 df STA $df07,x 
.s3:
50ec : 60 __ __ RTS
--------------------------------------------------------------------
ch_wr_be24@proxy: ; ch_wr_be24@proxy
50ed : a9 09 __ LDA #$09
50ef : 85 0e __ STA P1 
50f1 : a5 43 __ LDA $43 
50f3 : 85 0f __ STA P2 
50f5 : a5 44 __ LDA $44 
50f7 : 85 10 __ STA P3 
50f9 : a5 45 __ LDA $45 
50fb : 85 11 __ STA P4 
50fd : a5 46 __ LDA $46 
50ff : 85 12 __ STA P5 
--------------------------------------------------------------------
ch_wr_be24: ; ch_wr_be24(u8,u8,u32)->void
;  52, "/home/xahmol/git/UltimateDemo2026/include/audio.c"
.s4:
5101 : a5 0d __ LDA P0 ; (ch + 0)
5103 : 0a __ __ ASL
5104 : aa __ __ TAX
5105 : bd d5 80 LDA $80d5,x ; (audio_ch_base[0] + 0)
5108 : 65 0e __ ADC P1 ; (offset + 0)
510a : 85 1b __ STA ACCU + 0 
510c : a9 df __ LDA #$df
510e : 85 1c __ STA ACCU + 1 
5110 : a5 11 __ LDA P4 ; (val + 2)
5112 : a0 00 __ LDY #$00
5114 : 91 1b __ STA (ACCU + 0),y 
5116 : a5 10 __ LDA P3 ; (val + 1)
5118 : c8 __ __ INY
5119 : 91 1b __ STA (ACCU + 0),y 
511b : a5 0f __ LDA P2 ; (val + 0)
511d : c8 __ __ INY
511e : 91 1b __ STA (ACCU + 0),y 
.s3:
5120 : 60 __ __ RTS
--------------------------------------------------------------------
mandel_run: ; mandel_run()->void
;   4, "/home/xahmol/git/UltimateDemo2026/src/mandel.h"
.s4:
5121 : a9 8f __ LDA #$8f
5123 : 20 90 16 JSR $1690 ; (turbo_set.s4 + 0)
5126 : a9 35 __ LDA #$35
5128 : 85 01 __ STA $01 
512a : a9 1f __ LDA #$1f
512c : 85 12 __ STA P5 
512e : a9 40 __ LDA #$40
5130 : 85 11 __ STA P4 
5132 : a9 00 __ LDA #$00
5134 : 85 0f __ STA P2 
5136 : 85 10 __ STA P3 
5138 : a2 fa __ LDX #$fa
.l6:
513a : ca __ __ DEX
513b : 9d 00 c0 STA $c000,x 
513e : 9d fa c0 STA $c0fa,x 
5141 : 9d f4 c1 STA $c1f4,x 
5144 : 9d ee c2 STA $c2ee,x 
5147 : d0 f1 __ BNE $513a ; (mandel_run.l6 + 0)
.s5:
5149 : 85 0d __ STA P0 
514b : a9 e0 __ LDA #$e0
514d : 85 0e __ STA P1 
514f : 20 31 24 JSR $2431 ; (memset.s4 + 0)
5152 : a9 04 __ LDA #$04
5154 : 85 0d __ STA P0 
5156 : a9 00 __ LDA #$00
5158 : 85 10 __ STA P3 
515a : a9 e0 __ LDA #$e0
515c : 85 11 __ STA P4 
515e : a9 01 __ LDA #$01
5160 : a2 fa __ LDX #$fa
.l8:
5162 : ca __ __ DEX
5163 : 9d 00 d8 STA $d800,x 
5166 : 9d fa d8 STA $d8fa,x 
5169 : 9d f4 d9 STA $d9f4,x 
516c : 9d ee da STA $daee,x 
516f : d0 f1 __ BNE $5162 ; (mandel_run.l8 + 0)
.s7:
5171 : a9 00 __ LDA #$00
5173 : 85 0e __ STA P1 
5175 : a9 c0 __ LDA #$c0
5177 : 85 0f __ STA P2 
5179 : 20 b8 0f JSR $0fb8 ; (vic_setmode.s4 + 0)
517c : a9 00 __ LDA #$00
517e : 8d 21 d0 STA $d021 
5181 : 8d 20 d0 STA $d020 
5184 : a9 70 __ LDA #$70
5186 : 85 13 __ STA P6 
5188 : a9 84 __ LDA #$84
518a : 85 14 __ STA P7 
518c : 20 c1 51 JSR $51c1 ; (render.s1 + 0)
518f : a9 7a __ LDA #$7a
5191 : 85 0d __ STA P0 
5193 : a9 84 __ LDA #$84
5195 : 85 0e __ STA P1 
5197 : 20 54 54 JSR $5454 ; (colorize_standard.s4 + 0)
519a : a9 00 __ LDA #$00
519c : 8d 09 dc STA $dc09 
519f : 8d 08 dc STA $dc08 
.l9:
51a2 : ad 09 dc LDA $dc09 
51a5 : c9 05 __ CMP #$05
51a7 : 90 f9 __ BCC $51a2 ; (mandel_run.l9 + 0)
.s10:
51a9 : a9 00 __ LDA #$00
51ab : 85 0d __ STA P0 
51ad : 85 0e __ STA P1 
51af : 85 10 __ STA P3 
51b1 : a9 36 __ LDA #$36
51b3 : 85 01 __ STA $01 
51b5 : 20 b0 0f JSR $0fb0 ; (vic_setmode@proxy + 0)
51b8 : a9 00 __ LDA #$00
51ba : 8d 20 d0 STA $d020 
51bd : 8d 21 d0 STA $d021 
.s3:
51c0 : 60 __ __ RTS
--------------------------------------------------------------------
render: ; render(const struct S#29251*)->void
;  81, "/home/xahmol/git/UltimateDemo2026/src/mandel.c"
.s1:
51c1 : a2 05 __ LDX #$05
51c3 : b5 53 __ LDA T10 + 0,x 
51c5 : 9d da bf STA $bfda,x ; (render@stack + 0)
51c8 : ca __ __ DEX
51c9 : 10 f8 __ BPL $51c3 ; (render.s1 + 2)
.s4:
51cb : a9 40 __ LDA #$40
51cd : 85 11 __ STA P4 
51cf : a9 1f __ LDA #$1f
51d1 : 85 12 __ STA P5 
51d3 : a9 00 __ LDA #$00
51d5 : 85 0d __ STA P0 
51d7 : a9 e0 __ LDA #$e0
51d9 : 85 0e __ STA P1 
51db : a0 06 __ LDY #$06
51dd : b1 13 __ LDA (P6),y ; (f + 0)
51df : c8 __ __ INY
51e0 : 11 13 __ ORA (P6),y ; (f + 0)
51e2 : d0 08 __ BNE $51ec ; (render.s24 + 0)
.s5:
51e4 : c8 __ __ INY
51e5 : b1 13 __ LDA (P6),y ; (f + 0)
51e7 : c8 __ __ INY
51e8 : 11 13 __ ORA (P6),y ; (f + 0)
51ea : f0 02 __ BEQ $51ee ; (render.s6 + 0)
.s24:
51ec : a9 01 __ LDA #$01
.s6:
51ee : 85 57 __ STA T12 + 0 
51f0 : a9 00 __ LDA #$00
51f2 : 85 0f __ STA P2 
51f4 : 85 10 __ STA P3 
51f6 : 20 31 24 JSR $2431 ; (memset.s4 + 0)
51f9 : a9 00 __ LDA #$00
51fb : 85 4d __ STA T6 + 0 
.l7:
51fd : 29 07 __ AND #$07
51ff : 85 43 __ STA T0 + 0 
5201 : a5 4d __ LDA T6 + 0 
5203 : 29 f8 __ AND #$f8
5205 : 85 1b __ STA ACCU + 0 
5207 : 4a __ __ LSR
5208 : 4a __ __ LSR
5209 : 65 1b __ ADC ACCU + 0 
520b : 4a __ __ LSR
520c : 6a __ __ ROR
520d : 6a __ __ ROR
520e : aa __ __ TAX
520f : 29 c0 __ AND #$c0
5211 : 6a __ __ ROR
5212 : 05 43 __ ORA T0 + 0 
5214 : 85 4e __ STA T7 + 0 
5216 : 8a __ __ TXA
5217 : 29 1f __ AND #$1f
5219 : 09 e0 __ ORA #$e0
521b : 85 4f __ STA T7 + 1 
521d : a0 05 __ LDY #$05
521f : b1 13 __ LDA (P6),y ; (f + 0)
5221 : 85 1b __ STA ACCU + 0 
5223 : a9 00 __ LDA #$00
5225 : 85 52 __ STA T9 + 0 
5227 : 85 1c __ STA ACCU + 1 
5229 : a5 4d __ LDA T6 + 0 
522b : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
522e : a0 02 __ LDY #$02
5230 : b1 13 __ LDA (P6),y ; (f + 0)
5232 : 18 __ __ CLC
5233 : 65 1b __ ADC ACCU + 0 
5235 : 85 50 __ STA T8 + 0 
5237 : c8 __ __ INY
5238 : b1 13 __ LDA (P6),y ; (f + 0)
523a : 65 1c __ ADC ACCU + 1 
523c : 85 51 __ STA T8 + 1 
.l8:
523e : a0 04 __ LDY #$04
5240 : b1 13 __ LDA (P6),y ; (f + 0)
5242 : 85 1b __ STA ACCU + 0 
5244 : a9 00 __ LDA #$00
5246 : 85 1c __ STA ACCU + 1 
5248 : a5 52 __ LDA T9 + 0 
524a : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
524d : a0 00 __ LDY #$00
524f : b1 13 __ LDA (P6),y ; (f + 0)
5251 : 18 __ __ CLC
5252 : 65 1b __ ADC ACCU + 0 
5254 : 85 49 __ STA T3 + 0 
5256 : 85 53 __ STA T10 + 0 
5258 : c8 __ __ INY
5259 : b1 13 __ LDA (P6),y ; (f + 0)
525b : 65 1c __ ADC ACCU + 1 
525d : 85 4a __ STA T3 + 1 
525f : 85 54 __ STA T10 + 1 
5261 : a5 57 __ LDA T12 + 0 
5263 : d0 11 __ BNE $5276 ; (render.s23 + 0)
.s9:
5265 : 85 49 __ STA T3 + 0 
5267 : 85 4a __ STA T3 + 1 
5269 : 85 4b __ STA T4 + 0 
526b : 85 4c __ STA T4 + 1 
526d : a5 50 __ LDA T8 + 0 
526f : 85 55 __ STA T11 + 0 
5271 : a5 51 __ LDA T8 + 1 
5273 : 4c 91 52 JMP $5291 ; (render.s10 + 0)
.s23:
5276 : a5 50 __ LDA T8 + 0 
5278 : 85 4b __ STA T4 + 0 
527a : a5 51 __ LDA T8 + 1 
527c : 85 4c __ STA T4 + 1 
527e : a0 06 __ LDY #$06
5280 : b1 13 __ LDA (P6),y ; (f + 0)
5282 : 85 53 __ STA T10 + 0 
5284 : c8 __ __ INY
5285 : b1 13 __ LDA (P6),y ; (f + 0)
5287 : 85 54 __ STA T10 + 1 
5289 : c8 __ __ INY
528a : b1 13 __ LDA (P6),y ; (f + 0)
528c : 85 55 __ STA T11 + 0 
528e : c8 __ __ INY
528f : b1 13 __ LDA (P6),y ; (f + 0)
.s10:
5291 : 85 56 __ STA T11 + 1 
5293 : a9 00 __ LDA #$00
5295 : 85 58 __ STA T13 + 0 
.l11:
5297 : a6 49 __ LDX T3 + 0 
5299 : a5 4a __ LDA T3 + 1 
529b : 10 0a __ BPL $52a7 ; (render.s12 + 0)
.s22:
529d : 38 __ __ SEC
529e : a9 00 __ LDA #$00
52a0 : e5 49 __ SBC T3 + 0 
52a2 : aa __ __ TAX
52a3 : a9 00 __ LDA #$00
52a5 : e5 4a __ SBC T3 + 1 
.s12:
52a7 : 86 0d __ STX P0 
52a9 : 86 0f __ STX P2 
52ab : 85 0e __ STA P1 
52ad : 85 10 __ STA P3 
52af : 20 bb 53 JSR $53bb ; (lmul16u.s4 + 0)
52b2 : a5 1b __ LDA ACCU + 0 
52b4 : 85 45 __ STA T2 + 0 
52b6 : a5 1c __ LDA ACCU + 1 
52b8 : 85 46 __ STA T2 + 1 
52ba : a5 1d __ LDA ACCU + 2 
52bc : 85 47 __ STA T2 + 2 
52be : a5 1e __ LDA ACCU + 3 
52c0 : 85 48 __ STA T2 + 3 
52c2 : a6 4b __ LDX T4 + 0 
52c4 : a5 4c __ LDA T4 + 1 
52c6 : 10 0a __ BPL $52d2 ; (render.s13 + 0)
.s21:
52c8 : 38 __ __ SEC
52c9 : a9 00 __ LDA #$00
52cb : e5 4b __ SBC T4 + 0 
52cd : aa __ __ TAX
52ce : a9 00 __ LDA #$00
52d0 : e5 4c __ SBC T4 + 1 
.s13:
52d2 : 86 0d __ STX P0 
52d4 : 86 0f __ STX P2 
52d6 : 85 0e __ STA P1 
52d8 : 85 10 __ STA P3 
52da : 20 bb 53 JSR $53bb ; (lmul16u.s4 + 0)
52dd : 18 __ __ CLC
52de : a5 1b __ LDA ACCU + 0 
52e0 : 65 45 __ ADC T2 + 0 
52e2 : a5 1c __ LDA ACCU + 1 
52e4 : 65 46 __ ADC T2 + 1 
52e6 : a5 1d __ LDA ACCU + 2 
52e8 : 65 47 __ ADC T2 + 2 
52ea : a5 1e __ LDA ACCU + 3 
52ec : 65 48 __ ADC T2 + 3 
52ee : c9 04 __ CMP #$04
52f0 : 90 1b __ BCC $530d ; (render.s14 + 0)
.s20:
52f2 : a5 58 __ LDA T13 + 0 
52f4 : 4a __ __ LSR
52f5 : 4a __ __ LSR
52f6 : 85 1b __ STA ACCU + 0 
52f8 : a9 00 __ LDA #$00
52fa : 85 1c __ STA ACCU + 1 
52fc : 85 04 __ STA WORK + 1 
52fe : a9 03 __ LDA #$03
5300 : 85 03 __ STA WORK + 0 
5302 : 20 4d 7c JSR $7c4d ; (divmod + 0)
5305 : 18 __ __ CLC
5306 : a5 05 __ LDA WORK + 2 
5308 : 69 01 __ ADC #$01
530a : 4c 6c 53 JMP $536c ; (render.s18 + 0)
.s14:
530d : a5 49 __ LDA T3 + 0 
530f : 85 0d __ STA P0 
5311 : a5 4a __ LDA T3 + 1 
5313 : 85 0e __ STA P1 
5315 : a5 4b __ LDA T4 + 0 
5317 : 85 0f __ STA P2 
5319 : a5 4c __ LDA T4 + 1 
531b : 85 10 __ STA P3 
531d : 38 __ __ SEC
531e : a5 45 __ LDA T2 + 0 
5320 : e5 1b __ SBC ACCU + 0 
5322 : a5 46 __ LDA T2 + 1 
5324 : e5 1c __ SBC ACCU + 1 
5326 : 85 43 __ STA T0 + 0 
5328 : a5 47 __ LDA T2 + 2 
532a : e5 1d __ SBC ACCU + 2 
532c : 85 44 __ STA T0 + 1 
532e : a5 48 __ LDA T2 + 3 
5330 : e5 1e __ SBC ACCU + 3 
5332 : a2 04 __ LDX #$04
.l15:
5334 : 4a __ __ LSR
5335 : 66 44 __ ROR T0 + 1 
5337 : 66 43 __ ROR T0 + 0 
5339 : ca __ __ DEX
533a : d0 f8 __ BNE $5334 ; (render.l15 + 0)
.s16:
533c : 18 __ __ CLC
533d : a5 43 __ LDA T0 + 0 
533f : 65 53 __ ADC T10 + 0 
5341 : 85 49 __ STA T3 + 0 
5343 : a5 44 __ LDA T0 + 1 
5345 : 65 54 __ ADC T10 + 1 
5347 : 85 4a __ STA T3 + 1 
5349 : 20 e2 53 JSR $53e2 ; (lmul4f12s.s4 + 0)
534c : a5 1b __ LDA ACCU + 0 
534e : 0a __ __ ASL
534f : a8 __ __ TAY
5350 : a5 1c __ LDA ACCU + 1 
5352 : 2a __ __ ROL
5353 : aa __ __ TAX
5354 : 98 __ __ TYA
5355 : 18 __ __ CLC
5356 : 65 55 __ ADC T11 + 0 
5358 : 85 4b __ STA T4 + 0 
535a : 8a __ __ TXA
535b : 65 56 __ ADC T11 + 1 
535d : 85 4c __ STA T4 + 1 
535f : e6 58 __ INC T13 + 0 
5361 : a5 58 __ LDA T13 + 0 
5363 : c9 20 __ CMP #$20
5365 : b0 03 __ BCS $536a ; (render.s17 + 0)
5367 : 4c 97 52 JMP $5297 ; (render.l11 + 0)
.s17:
536a : a9 00 __ LDA #$00
.s18:
536c : aa __ __ TAX
536d : a5 52 __ LDA T9 + 0 
536f : 29 03 __ AND #$03
5371 : 0a __ __ ASL
5372 : a8 __ __ TAY
5373 : b9 9e 7f LDA $7f9e,y ; (__shrtab192L + 0)
5376 : 85 1b __ STA ACCU + 0 
5378 : 49 ff __ EOR #$ff
537a : 85 45 __ STA T2 + 0 
537c : a5 52 __ LDA T9 + 0 
537e : 29 fc __ AND #$fc
5380 : 0a __ __ ASL
5381 : 85 49 __ STA T3 + 0 
5383 : a5 4f __ LDA T7 + 1 
5385 : 69 00 __ ADC #$00
5387 : 85 4a __ STA T3 + 1 
5389 : a4 4e __ LDY T7 + 0 
538b : b1 49 __ LDA (T3 + 0),y 
538d : 25 45 __ AND T2 + 0 
538f : 85 45 __ STA T2 + 0 
5391 : bd fa 83 LDA $83fa,x ; (cbytes[0] + 0)
5394 : 25 1b __ AND ACCU + 0 
5396 : 05 45 __ ORA T2 + 0 
5398 : 91 49 __ STA (T3 + 0),y 
539a : e6 52 __ INC T9 + 0 
539c : a5 52 __ LDA T9 + 0 
539e : c9 a0 __ CMP #$a0
53a0 : b0 03 __ BCS $53a5 ; (render.s19 + 0)
53a2 : 4c 3e 52 JMP $523e ; (render.l8 + 0)
.s19:
53a5 : e6 4d __ INC T6 + 0 
53a7 : a5 4d __ LDA T6 + 0 
53a9 : c9 c8 __ CMP #$c8
53ab : b0 03 __ BCS $53b0 ; (render.s3 + 0)
53ad : 4c fd 51 JMP $51fd ; (render.l7 + 0)
.s3:
53b0 : a2 05 __ LDX #$05
53b2 : bd da bf LDA $bfda,x ; (render@stack + 0)
53b5 : 95 53 __ STA T10 + 0,x 
53b7 : ca __ __ DEX
53b8 : 10 f8 __ BPL $53b2 ; (render.s3 + 2)
53ba : 60 __ __ RTS
--------------------------------------------------------------------
lmul16u: ; lmul16u(u16,u16)->u32
;   5, "/home/xahmol/oscar64/include/fixmath.h"
.s4:
53bb : a9 00 __ LDA #$00
53bd : 85 1d __ STA ACCU + 2 
53bf : 85 1e __ STA ACCU + 3 
53c1 : a2 10 __ LDX #$10
53c3 : 46 0e __ LSR P1 
53c5 : 66 0d __ ROR P0 
53c7 : 90 0d __ BCC $53d6 ; (lmul16u.s4 + 27)
53c9 : 18 __ __ CLC
53ca : a5 1d __ LDA ACCU + 2 
53cc : 65 0f __ ADC P2 
53ce : 85 1d __ STA ACCU + 2 
53d0 : a5 1e __ LDA ACCU + 3 
53d2 : 65 10 __ ADC P3 
53d4 : 85 1e __ STA ACCU + 3 
53d6 : 66 1e __ ROR ACCU + 3 
53d8 : 66 1d __ ROR ACCU + 2 
53da : 66 1c __ ROR ACCU + 1 
53dc : 66 1b __ ROR ACCU + 0 
53de : ca __ __ DEX
53df : d0 e2 __ BNE $53c3 ; (lmul16u.s4 + 8)
.s3:
53e1 : 60 __ __ RTS
--------------------------------------------------------------------
lmul4f12s: ; lmul4f12s(i16,i16)->i16
;  18, "/home/xahmol/oscar64/include/fixmath.h"
.s4:
53e2 : 38 __ __ SEC
53e3 : a5 0d __ LDA P0 
53e5 : 6a __ __ ROR
53e6 : 85 1b __ STA ACCU + 0 
53e8 : a9 00 __ LDA #$00
53ea : 85 1c __ STA ACCU + 1 
53ec : 90 0b __ BCC $53f9 ; (lmul4f12s.s4 + 23)
53ee : a8 __ __ TAY
53ef : 18 __ __ CLC
53f0 : a5 1c __ LDA ACCU + 1 
53f2 : 65 0f __ ADC P2 
53f4 : 85 1c __ STA ACCU + 1 
53f6 : 98 __ __ TYA
53f7 : 65 10 __ ADC P3 
53f9 : 6a __ __ ROR
53fa : 66 1c __ ROR ACCU + 1 
53fc : 46 1b __ LSR ACCU + 0 
53fe : 90 f9 __ BCC $53f9 ; (lmul4f12s.s4 + 23)
5400 : d0 ec __ BNE $53ee ; (lmul4f12s.s4 + 12)
5402 : a6 0e __ LDX P1 
5404 : 86 1b __ STX ACCU + 0 
5406 : a2 07 __ LDX #$07
5408 : 46 1b __ LSR ACCU + 0 
540a : 90 0b __ BCC $5417 ; (lmul4f12s.s4 + 53)
540c : a8 __ __ TAY
540d : 18 __ __ CLC
540e : a5 1c __ LDA ACCU + 1 
5410 : 65 0f __ ADC P2 
5412 : 85 1c __ STA ACCU + 1 
5414 : 98 __ __ TYA
5415 : 65 10 __ ADC P3 
5417 : 6a __ __ ROR
5418 : 66 1c __ ROR ACCU + 1 
541a : 66 1b __ ROR ACCU + 0 
541c : ca __ __ DEX
541d : d0 eb __ BNE $540a ; (lmul4f12s.s4 + 40)
541f : 90 0a __ BCC $542b ; (lmul4f12s.s4 + 73)
5421 : a8 __ __ TAY
5422 : a5 1c __ LDA ACCU + 1 
5424 : e5 0f __ SBC P2 
5426 : 85 1c __ STA ACCU + 1 
5428 : 98 __ __ TYA
5429 : e5 10 __ SBC P3 
542b : 6a __ __ ROR
542c : 66 1c __ ROR ACCU + 1 
542e : 66 1b __ ROR ACCU + 0 
5430 : 24 10 __ BIT P3 
5432 : 10 0b __ BPL $543f ; (lmul4f12s.s4 + 93)
5434 : aa __ __ TAX
5435 : 38 __ __ SEC
5436 : a5 1c __ LDA ACCU + 1 
5438 : e5 0d __ SBC P0 
543a : 85 1c __ STA ACCU + 1 
543c : 8a __ __ TXA
543d : e5 0e __ SBC P1 
543f : 4a __ __ LSR
5440 : 66 1c __ ROR ACCU + 1 
5442 : 66 1b __ ROR ACCU + 0 
5444 : 4a __ __ LSR
5445 : 66 1c __ ROR ACCU + 1 
5447 : 66 1b __ ROR ACCU + 0 
5449 : 4a __ __ LSR
544a : 66 1c __ ROR ACCU + 1 
544c : 66 1b __ ROR ACCU + 0 
544e : 4a __ __ LSR
544f : 66 1c __ ROR ACCU + 1 
5451 : 66 1b __ ROR ACCU + 0 
.s3:
5453 : 60 __ __ RTS
--------------------------------------------------------------------
colorize_standard: ; colorize_standard(const const struct S#29280[]*)->void
; 137, "/home/xahmol/git/UltimateDemo2026/src/mandel.c"
.s4:
5454 : a9 00 __ LDA #$00
5456 : 85 43 __ STA T0 + 0 
5458 : 85 44 __ STA T1 + 0 
545a : 85 46 __ STA T2 + 0 
545c : 85 48 __ STA T3 + 0 
545e : a9 e0 __ LDA #$e0
5460 : 85 45 __ STA T1 + 1 
5462 : a9 c0 __ LDA #$c0
5464 : 85 47 __ STA T2 + 1 
5466 : a9 d8 __ LDA #$d8
5468 : 85 49 __ STA T3 + 1 
.l5:
546a : a9 00 __ LDA #$00
546c : 85 4a __ STA T4 + 0 
.l6:
546e : 0a __ __ ASL
546f : 0a __ __ ASL
5470 : 0a __ __ ASL
5471 : a2 00 __ LDX #$00
5473 : 90 02 __ BCC $5477 ; (colorize_standard.s51 + 0)
.s50:
5475 : e8 __ __ INX
5476 : 18 __ __ CLC
.s51:
5477 : 65 44 __ ADC T1 + 0 
5479 : 85 4b __ STA T5 + 0 
547b : 8a __ __ TXA
547c : 65 45 __ ADC T1 + 1 
547e : 85 4c __ STA T5 + 1 
5480 : a9 00 __ LDA #$00
5482 : 85 1c __ STA ACCU + 1 
5484 : 85 4d __ STA T10 + 0 
5486 : 85 4e __ STA T11 + 0 
5488 : aa __ __ TAX
5489 : a8 __ __ TAY
.l49:
548a : b1 4b __ LDA (T5 + 0),y 
548c : 85 1b __ STA ACCU + 0 
548e : 0a __ __ ASL
548f : 2a __ __ ROL
5490 : 29 01 __ AND #$01
5492 : 2a __ __ ROL
5493 : d0 04 __ BNE $5499 ; (colorize_standard.s43 + 0)
.s7:
5495 : e8 __ __ INX
5496 : 4c ad 54 JMP $54ad ; (colorize_standard.s8 + 0)
.s43:
5499 : c9 01 __ CMP #$01
549b : d0 05 __ BNE $54a2 ; (colorize_standard.s44 + 0)
.s47:
549d : e6 1c __ INC ACCU + 1 
549f : 4c ad 54 JMP $54ad ; (colorize_standard.s8 + 0)
.s44:
54a2 : c9 02 __ CMP #$02
54a4 : f0 05 __ BEQ $54ab ; (colorize_standard.s46 + 0)
.s45:
54a6 : e6 4e __ INC T11 + 0 
54a8 : 4c ad 54 JMP $54ad ; (colorize_standard.s8 + 0)
.s46:
54ab : e6 4d __ INC T10 + 0 
.s8:
54ad : a5 1b __ LDA ACCU + 0 
54af : 29 30 __ AND #$30
54b1 : 4a __ __ LSR
54b2 : 4a __ __ LSR
54b3 : 4a __ __ LSR
54b4 : 4a __ __ LSR
54b5 : d0 04 __ BNE $54bb ; (colorize_standard.s38 + 0)
.s9:
54b7 : e8 __ __ INX
54b8 : 4c cf 54 JMP $54cf ; (colorize_standard.s10 + 0)
.s38:
54bb : c9 01 __ CMP #$01
54bd : d0 05 __ BNE $54c4 ; (colorize_standard.s39 + 0)
.s42:
54bf : e6 1c __ INC ACCU + 1 
54c1 : 4c cf 54 JMP $54cf ; (colorize_standard.s10 + 0)
.s39:
54c4 : c9 02 __ CMP #$02
54c6 : f0 05 __ BEQ $54cd ; (colorize_standard.s41 + 0)
.s40:
54c8 : e6 4e __ INC T11 + 0 
54ca : 4c cf 54 JMP $54cf ; (colorize_standard.s10 + 0)
.s41:
54cd : e6 4d __ INC T10 + 0 
.s10:
54cf : a5 1b __ LDA ACCU + 0 
54d1 : 29 0c __ AND #$0c
54d3 : 4a __ __ LSR
54d4 : 4a __ __ LSR
54d5 : d0 04 __ BNE $54db ; (colorize_standard.s33 + 0)
.s11:
54d7 : e8 __ __ INX
54d8 : 4c ef 54 JMP $54ef ; (colorize_standard.s12 + 0)
.s33:
54db : c9 01 __ CMP #$01
54dd : d0 05 __ BNE $54e4 ; (colorize_standard.s34 + 0)
.s37:
54df : e6 1c __ INC ACCU + 1 
54e1 : 4c ef 54 JMP $54ef ; (colorize_standard.s12 + 0)
.s34:
54e4 : c9 02 __ CMP #$02
54e6 : f0 05 __ BEQ $54ed ; (colorize_standard.s36 + 0)
.s35:
54e8 : e6 4e __ INC T11 + 0 
54ea : 4c ef 54 JMP $54ef ; (colorize_standard.s12 + 0)
.s36:
54ed : e6 4d __ INC T10 + 0 
.s12:
54ef : a5 1b __ LDA ACCU + 0 
54f1 : 29 03 __ AND #$03
54f3 : d0 04 __ BNE $54f9 ; (colorize_standard.s28 + 0)
.s13:
54f5 : e8 __ __ INX
54f6 : 4c 0d 55 JMP $550d ; (colorize_standard.s14 + 0)
.s28:
54f9 : c9 01 __ CMP #$01
54fb : d0 05 __ BNE $5502 ; (colorize_standard.s29 + 0)
.s32:
54fd : e6 1c __ INC ACCU + 1 
54ff : 4c 0d 55 JMP $550d ; (colorize_standard.s14 + 0)
.s29:
5502 : c9 02 __ CMP #$02
5504 : f0 05 __ BEQ $550b ; (colorize_standard.s31 + 0)
.s30:
5506 : e6 4e __ INC T11 + 0 
5508 : 4c 0d 55 JMP $550d ; (colorize_standard.s14 + 0)
.s31:
550b : e6 4d __ INC T10 + 0 
.s14:
550d : c8 __ __ INY
550e : c0 08 __ CPY #$08
5510 : b0 03 __ BCS $5515 ; (colorize_standard.s15 + 0)
5512 : 4c 8a 54 JMP $548a ; (colorize_standard.l49 + 0)
.s15:
5515 : 18 __ __ CLC
5516 : a5 4d __ LDA T10 + 0 
5518 : 65 1c __ ADC ACCU + 1 
551a : 85 4b __ STA T5 + 0 
551c : a9 00 __ LDA #$00
551e : 2a __ __ ROL
551f : a8 __ __ TAY
5520 : a5 4b __ LDA T5 + 0 
5522 : 65 4e __ ADC T11 + 0 
5524 : 85 4b __ STA T5 + 0 
5526 : 98 __ __ TYA
5527 : 69 00 __ ADC #$00
5529 : 05 4b __ ORA T5 + 0 
552b : f0 02 __ BEQ $552f ; (colorize_standard.s53 + 0)
.s52:
552d : a9 01 __ LDA #$01
.s53:
552f : 85 4b __ STA T5 + 0 
5531 : 8a __ __ TXA
5532 : f0 03 __ BEQ $5537 ; (colorize_standard.s16 + 0)
5534 : 4c d6 55 JMP $55d6 ; (colorize_standard.s26 + 0)
.s16:
5537 : a5 4b __ LDA T5 + 0 
5539 : f0 22 __ BEQ $555d ; (colorize_standard.s17 + 0)
.s19:
553b : a5 1c __ LDA ACCU + 1 
553d : c5 4d __ CMP T10 + 0 
553f : b0 04 __ BCS $5545 ; (colorize_standard.s20 + 0)
.s25:
5541 : a9 02 __ LDA #$02
5543 : 90 02 __ BCC $5547 ; (colorize_standard.s21 + 0)
.s20:
5545 : a9 01 __ LDA #$01
.s21:
5547 : 85 4b __ STA T5 + 0 
5549 : a5 4d __ LDA T10 + 0 
554b : c5 4e __ CMP T11 + 0 
554d : b0 06 __ BCS $5555 ; (colorize_standard.s22 + 0)
.s23:
554f : a5 1c __ LDA ACCU + 1 
5551 : c5 4e __ CMP T11 + 0 
5553 : 90 04 __ BCC $5559 ; (colorize_standard.s24 + 0)
.s22:
5555 : c6 4b __ DEC T5 + 0 
5557 : b0 04 __ BCS $555d ; (colorize_standard.s17 + 0)
.s24:
5559 : a9 02 __ LDA #$02
.s48:
555b : 85 4b __ STA T5 + 0 
.s17:
555d : 18 __ __ CLC
555e : a5 4a __ LDA T4 + 0 
5560 : 65 43 __ ADC T0 + 0 
5562 : 0a __ __ ASL
5563 : 0a __ __ ASL
5564 : 85 1b __ STA ACCU + 0 
5566 : a9 00 __ LDA #$00
5568 : 85 1c __ STA ACCU + 1 
556a : 85 04 __ STA WORK + 1 
556c : a9 41 __ LDA #$41
556e : 85 03 __ STA WORK + 0 
5570 : 20 4d 7c JSR $7c4d ; (divmod + 0)
5573 : a6 1b __ LDX ACCU + 0 
5575 : bd a5 7f LDA $7fa5,x ; (__multab12L + 0)
5578 : 18 __ __ CLC
5579 : 65 0d __ ADC P0 ; (pal + 0)
557b : 85 1b __ STA ACCU + 0 
557d : a5 0e __ LDA P1 ; (pal + 1)
557f : 69 00 __ ADC #$00
5581 : aa __ __ TAX
5582 : a4 4b __ LDY T5 + 0 
5584 : b9 a9 7f LDA $7fa9,y ; (__multab3L + 0)
5587 : 18 __ __ CLC
5588 : 65 1b __ ADC ACCU + 0 
558a : 85 1b __ STA ACCU + 0 
558c : 90 01 __ BCC $558f ; (colorize_standard.s55 + 0)
.s54:
558e : e8 __ __ INX
.s55:
558f : 86 1c __ STX ACCU + 1 
5591 : a0 00 __ LDY #$00
5593 : b1 1b __ LDA (ACCU + 0),y 
5595 : 0a __ __ ASL
5596 : 0a __ __ ASL
5597 : 0a __ __ ASL
5598 : 0a __ __ ASL
5599 : c8 __ __ INY
559a : 11 1b __ ORA (ACCU + 0),y 
559c : 88 __ __ DEY
559d : 91 46 __ STA (T2 + 0),y 
559f : a0 02 __ LDY #$02
55a1 : b1 1b __ LDA (ACCU + 0),y 
55a3 : a0 00 __ LDY #$00
55a5 : 91 48 __ STA (T3 + 0),y 
55a7 : e6 46 __ INC T2 + 0 
55a9 : d0 02 __ BNE $55ad ; (colorize_standard.s57 + 0)
.s56:
55ab : e6 47 __ INC T2 + 1 
.s57:
55ad : e6 48 __ INC T3 + 0 
55af : d0 02 __ BNE $55b3 ; (colorize_standard.s59 + 0)
.s58:
55b1 : e6 49 __ INC T3 + 1 
.s59:
55b3 : e6 4a __ INC T4 + 0 
55b5 : a5 4a __ LDA T4 + 0 
55b7 : c9 28 __ CMP #$28
55b9 : f0 03 __ BEQ $55be ; (colorize_standard.s18 + 0)
55bb : 4c 6e 54 JMP $546e ; (colorize_standard.l6 + 0)
.s18:
55be : a5 44 __ LDA T1 + 0 
55c0 : 69 3f __ ADC #$3f
55c2 : 85 44 __ STA T1 + 0 
55c4 : a5 45 __ LDA T1 + 1 
55c6 : 69 01 __ ADC #$01
55c8 : 85 45 __ STA T1 + 1 
55ca : e6 43 __ INC T0 + 0 
55cc : a5 43 __ LDA T0 + 0 
55ce : c9 19 __ CMP #$19
55d0 : f0 03 __ BEQ $55d5 ; (colorize_standard.s3 + 0)
55d2 : 4c 6a 54 JMP $546a ; (colorize_standard.l5 + 0)
.s3:
55d5 : 60 __ __ RTS
.s26:
55d6 : a5 4b __ LDA T5 + 0 
55d8 : f0 83 __ BEQ $555d ; (colorize_standard.s17 + 0)
.s27:
55da : a9 03 __ LDA #$03
55dc : 4c 5b 55 JMP $555b ; (colorize_standard.s48 + 0)
--------------------------------------------------------------------
ball_run: ; ball_run()->void
;   3, "/home/xahmol/git/UltimateDemo2026/src/ball.h"
.s1:
55df : a2 0d __ LDX #$0d
55e1 : b5 53 __ LDA T0 + 0,x 
55e3 : 9d af bf STA $bfaf,x ; (ball_run@stack + 0)
55e6 : ca __ __ DEX
55e7 : 10 f8 __ BPL $55e1 ; (ball_run.s1 + 2)
.s4:
55e9 : a9 8f __ LDA #$8f
55eb : 20 90 16 JSR $1690 ; (turbo_set.s4 + 0)
55ee : 20 9c 57 JSR $579c ; (ball_init.s4 + 0)
55f1 : a9 00 __ LDA #$00
55f3 : 85 55 __ STA T1 + 0 
55f5 : 85 56 __ STA T2 + 0 
55f7 : 85 57 __ STA T3 + 0 
55f9 : 85 58 __ STA T4 + 0 
55fb : 85 59 __ STA T5 + 0 
55fd : a9 a8 __ LDA #$a8
55ff : 85 5a __ STA T6 + 0 
5601 : a9 fd __ LDA #$fd
5603 : 85 5b __ STA T6 + 1 
.l5:
5605 : 2c 11 d0 BIT $d011 
5608 : 30 fb __ BMI $5605 ; (ball_run.l5 + 0)
.l6:
560a : 2c 11 d0 BIT $d011 
560d : 10 fb __ BPL $560a ; (ball_run.l6 + 0)
.s7:
560f : a9 00 __ LDA #$00
5611 : 85 0f __ STA P2 
5613 : 85 10 __ STA P3 
5615 : 85 0d __ STA P0 
5617 : 20 ff 7f JSR $7fff ; (memset@proxy + 0)
561a : a5 55 __ LDA T1 + 0 
561c : 29 3f __ AND #$3f
561e : aa __ __ TAX
561f : bd 08 84 LDA $8408,x ; (sin64[0] + 0)
5622 : 85 5c __ STA T7 + 0 
5624 : 29 80 __ AND #$80
5626 : 10 02 __ BPL $562a ; (ball_run.s7 + 27)
5628 : a9 ff __ LDA #$ff
562a : 85 5d __ STA T7 + 1 
562c : bd 08 84 LDA $8408,x ; (sin64[0] + 0)
562f : 10 0d __ BPL $563e ; (ball_run.s8 + 0)
.s10:
5631 : 38 __ __ SEC
5632 : a9 00 __ LDA #$00
5634 : e5 5c __ SBC T7 + 0 
5636 : 85 5c __ STA T7 + 0 
5638 : a9 00 __ LDA #$00
563a : e5 5d __ SBC T7 + 1 
563c : 85 5d __ STA T7 + 1 
.s8:
563e : a5 58 __ LDA T4 + 0 
5640 : 85 18 __ STA P11 
5642 : a5 57 __ LDA T3 + 0 
5644 : 29 3f __ AND #$3f
5646 : aa __ __ TAX
5647 : bd 08 84 LDA $8408,x ; (sin64[0] + 0)
564a : 85 60 __ STA T9 + 0 
564c : a5 56 __ LDA T2 + 0 
564e : 29 3f __ AND #$3f
5650 : aa __ __ TAX
5651 : bd 08 84 LDA $8408,x ; (sin64[0] + 0)
5654 : 85 53 __ STA T0 + 0 
5656 : 29 80 __ AND #$80
5658 : 10 02 __ BPL $565c ; (ball_run.s8 + 30)
565a : a9 ff __ LDA #$ff
565c : 85 54 __ STA T0 + 1 
565e : 20 f5 57 JSR $57f5 ; (draw_floor.s4 + 0)
5661 : a5 53 __ LDA T0 + 0 
5663 : 0a __ __ ASL
5664 : 85 1b __ STA ACCU + 0 
5666 : a5 54 __ LDA T0 + 1 
5668 : 2a __ __ ROL
5669 : 06 1b __ ASL ACCU + 0 
566b : 2a __ __ ROL
566c : aa __ __ TAX
566d : 18 __ __ CLC
566e : a5 1b __ LDA ACCU + 0 
5670 : 65 53 __ ADC T0 + 0 
5672 : 85 1b __ STA ACCU + 0 
5674 : 8a __ __ TXA
5675 : 65 54 __ ADC T0 + 1 
5677 : 06 1b __ ASL ACCU + 0 
5679 : 2a __ __ ROL
567a : 06 1b __ ASL ACCU + 0 
567c : 2a __ __ ROL
567d : 06 1b __ ASL ACCU + 0 
567f : 2a __ __ ROL
5680 : 06 1b __ ASL ACCU + 0 
5682 : 2a __ __ ROL
5683 : 85 1c __ STA ACCU + 1 
5685 : 20 3e 80 JSR $803e ; (divs16@proxy + 0)
5688 : 18 __ __ CLC
5689 : a5 1b __ LDA ACCU + 0 
568b : 69 f0 __ ADC #$f0
568d : 85 5e __ STA T8 + 0 
568f : a5 1c __ LDA ACCU + 1 
5691 : 69 00 __ ADC #$00
5693 : 85 5f __ STA T8 + 1 
5695 : a5 60 __ LDA T9 + 0 
5697 : 85 1b __ STA ACCU + 0 
5699 : 29 80 __ AND #$80
569b : 10 02 __ BPL $569f ; (ball_run.s8 + 97)
569d : a9 ff __ LDA #$ff
569f : 85 1c __ STA ACCU + 1 
56a1 : a9 1e __ LDA #$1e
56a3 : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
56a6 : 20 3e 80 JSR $803e ; (divs16@proxy + 0)
56a9 : a9 b4 __ LDA #$b4
56ab : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
56ae : 20 19 80 JSR $8019 ; (divs16@proxy + 0)
56b1 : 18 __ __ CLC
56b2 : a5 1b __ LDA ACCU + 0 
56b4 : 69 50 __ ADC #$50
56b6 : 85 12 __ STA P5 
56b8 : a5 1c __ LDA ACCU + 1 
56ba : 69 00 __ ADC #$00
56bc : 85 13 __ STA P6 
56be : a9 50 __ LDA #$50
56c0 : 85 1b __ STA ACCU + 0 
56c2 : a9 46 __ LDA #$46
56c4 : 85 1c __ STA ACCU + 1 
56c6 : 20 19 80 JSR $8019 ; (divs16@proxy + 0)
56c9 : 18 __ __ CLC
56ca : a5 1b __ LDA ACCU + 0 
56cc : 69 48 __ ADC #$48
56ce : 85 14 __ STA P7 
56d0 : a5 1c __ LDA ACCU + 1 
56d2 : 69 00 __ ADC #$00
56d4 : 85 15 __ STA P8 
56d6 : a9 a0 __ LDA #$a0
56d8 : 85 1b __ STA ACCU + 0 
56da : a9 05 __ LDA #$05
56dc : 85 1c __ STA ACCU + 1 
56de : 20 19 80 JSR $8019 ; (divs16@proxy + 0)
56e1 : a5 1b __ LDA ACCU + 0 
56e3 : 85 16 __ STA P9 
56e5 : a5 1c __ LDA ACCU + 1 
56e7 : 85 17 __ STA P10 
56e9 : a9 1c __ LDA #$1c
56eb : 85 1b __ STA ACCU + 0 
56ed : a9 02 __ LDA #$02
56ef : 85 1c __ STA ACCU + 1 
56f1 : 20 19 80 JSR $8019 ; (divs16@proxy + 0)
56f4 : a5 1b __ LDA ACCU + 0 
56f6 : 8d ea bf STA $bfea ; (sstack + 0)
56f9 : a5 1c __ LDA ACCU + 1 
56fb : 8d eb bf STA $bfeb ; (sstack + 1)
56fe : 20 54 5c JSR $5c54 ; (draw_shadow.s4 + 0)
5701 : a5 12 __ LDA P5 
5703 : 8d ea bf STA $bfea ; (sstack + 0)
5706 : a5 13 __ LDA P6 
5708 : 8d eb bf STA $bfeb ; (sstack + 1)
570b : a5 59 __ LDA T5 + 0 
570d : 8d ee bf STA $bfee ; (sstack + 4)
5710 : 18 __ __ CLC
5711 : 69 02 __ ADC #$02
5713 : 85 59 __ STA T5 + 0 
5715 : a5 5c __ LDA T7 + 0 
5717 : 85 1b __ STA ACCU + 0 
5719 : a5 5d __ LDA T7 + 1 
571b : 85 1c __ STA ACCU + 1 
571d : a9 3c __ LDA #$3c
571f : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
5722 : a9 7f __ LDA #$7f
5724 : 85 03 __ STA WORK + 0 
5726 : 20 f7 7a JSR $7af7 ; (divmod@proxy + 0)
5729 : 38 __ __ SEC
572a : a9 64 __ LDA #$64
572c : e5 1b __ SBC ACCU + 0 
572e : 85 1b __ STA ACCU + 0 
5730 : a9 00 __ LDA #$00
5732 : 85 1c __ STA ACCU + 1 
5734 : a9 b4 __ LDA #$b4
5736 : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
5739 : 20 19 80 JSR $8019 ; (divs16@proxy + 0)
573c : 18 __ __ CLC
573d : a5 1b __ LDA ACCU + 0 
573f : 69 48 __ ADC #$48
5741 : 8d ec bf STA $bfec ; (sstack + 2)
5744 : a5 1c __ LDA ACCU + 1 
5746 : 69 00 __ ADC #$00
5748 : 8d ed bf STA $bfed ; (sstack + 3)
574b : a9 40 __ LDA #$40
574d : 85 1b __ STA ACCU + 0 
574f : a9 0b __ LDA #$0b
5751 : 85 1c __ STA ACCU + 1 
5753 : 20 19 80 JSR $8019 ; (divs16@proxy + 0)
5756 : a5 1b __ LDA ACCU + 0 
5758 : 8d ef bf STA $bfef ; (sstack + 5)
575b : a5 1c __ LDA ACCU + 1 
575d : 8d f0 bf STA $bff0 ; (sstack + 6)
5760 : 20 ed 5d JSR $5ded ; (draw_ball.s1 + 0)
5763 : e6 58 __ INC T4 + 0 
5765 : e6 57 __ INC T3 + 0 
5767 : e6 57 __ INC T3 + 0 
5769 : e6 56 __ INC T2 + 0 
576b : e6 55 __ INC T1 + 0 
576d : e6 55 __ INC T1 + 0 
576f : e6 5a __ INC T6 + 0 
5771 : f0 03 __ BEQ $5776 ; (ball_run.s11 + 0)
5773 : 4c 05 56 JMP $5605 ; (ball_run.l5 + 0)
.s11:
5776 : e6 5b __ INC T6 + 1 
5778 : d0 f9 __ BNE $5773 ; (ball_run.s8 + 309)
.s9:
577a : a9 00 __ LDA #$00
577c : 85 0d __ STA P0 
577e : 85 0e __ STA P1 
5780 : 85 10 __ STA P3 
5782 : a9 36 __ LDA #$36
5784 : 85 01 __ STA $01 
5786 : 20 b0 0f JSR $0fb0 ; (vic_setmode@proxy + 0)
5789 : a9 00 __ LDA #$00
578b : 8d 20 d0 STA $d020 
578e : 8d 21 d0 STA $d021 
.s3:
5791 : a2 0d __ LDX #$0d
5793 : bd af bf LDA $bfaf,x ; (ball_run@stack + 0)
5796 : 95 53 __ STA T0 + 0,x 
5798 : ca __ __ DEX
5799 : 10 f8 __ BPL $5793 ; (ball_run.s3 + 2)
579b : 60 __ __ RTS
--------------------------------------------------------------------
ball_init: ; ball_init()->void
; 293, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
579c : 78 __ __ SEI
579d : a9 35 __ LDA #$35
579f : 85 01 __ STA $01 
57a1 : 20 4d 24 JSR $244d ; (mmap_trampoline.s4 + 0)
57a4 : 58 __ __ CLI
57a5 : a9 00 __ LDA #$00
57a7 : 85 0f __ STA P2 
57a9 : 85 10 __ STA P3 
57ab : 85 43 __ STA T0 + 0 
57ad : 85 0d __ STA P0 
57af : 20 ff 7f JSR $7fff ; (memset@proxy + 0)
57b2 : a9 c0 __ LDA #$c0
57b4 : 85 44 __ STA T0 + 1 
57b6 : a9 00 __ LDA #$00
57b8 : 85 1f __ STA ADDR + 0 
57ba : f0 02 __ BEQ $57be ; (ball_init.l7 + 0)
.s8:
57bc : e6 44 __ INC T0 + 1 
.l7:
57be : a9 12 __ LDA #$12
57c0 : a0 00 __ LDY #$00
57c2 : 91 43 __ STA (T0 + 0),y 
57c4 : 18 __ __ CLC
57c5 : a5 44 __ LDA T0 + 1 
57c7 : 69 18 __ ADC #$18
57c9 : 85 20 __ STA ADDR + 1 
57cb : a9 0c __ LDA #$0c
57cd : a4 43 __ LDY T0 + 0 
57cf : 91 1f __ STA (ADDR + 0),y 
57d1 : 98 __ __ TYA
57d2 : 18 __ __ CLC
57d3 : 69 01 __ ADC #$01
57d5 : 85 43 __ STA T0 + 0 
57d7 : b0 e3 __ BCS $57bc ; (ball_init.s8 + 0)
.s9:
57d9 : c9 e8 __ CMP #$e8
57db : d0 e1 __ BNE $57be ; (ball_init.l7 + 0)
.s6:
57dd : a5 44 __ LDA T0 + 1 
57df : c9 c3 __ CMP #$c3
57e1 : d0 db __ BNE $57be ; (ball_init.l7 + 0)
.s5:
57e3 : a9 00 __ LDA #$00
57e5 : 85 0e __ STA P1 
57e7 : 85 10 __ STA P3 
57e9 : 20 66 80 JSR $8066 ; (vic_setmode@proxy + 0)
57ec : a9 00 __ LDA #$00
57ee : 8d 21 d0 STA $d021 
57f1 : 8d 20 d0 STA $d020 
.s3:
57f4 : 60 __ __ RTS
--------------------------------------------------------------------
draw_floor: ; draw_floor(u8)->void
; 137, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
57f5 : a9 00 __ LDA #$00
57f7 : 85 51 __ STA T3 + 0 
.l5:
57f9 : a5 18 __ LDA P11 ; (floor_rot + 0)
57fb : 85 11 __ STA P4 
57fd : a9 b0 __ LDA #$b0
57ff : 85 0d __ STA P0 
5801 : a9 ff __ LDA #$ff
5803 : 85 0e __ STA P1 
5805 : a5 51 __ LDA T3 + 0 
5807 : 0a __ __ ASL
5808 : aa __ __ TAX
5809 : a9 e8 __ LDA #$e8
580b : 85 12 __ STA P5 
580d : a9 bf __ LDA #$bf
580f : 85 13 __ STA P6 
5811 : a9 e6 __ LDA #$e6
5813 : 85 14 __ STA P7 
5815 : a9 bf __ LDA #$bf
5817 : 85 15 __ STA P8 
5819 : bd aa 84 LDA $84aa,x ; (gz[0] + 0)
581c : 85 0f __ STA P2 
581e : bd ab 84 LDA $84ab,x ; (gz[0] + 1)
5821 : 85 10 __ STA P3 
5823 : 20 f1 59 JSR $59f1 ; (rotate_y.s4 + 0)
5826 : e6 0e __ INC P1 
5828 : a9 50 __ LDA #$50
582a : 85 0d __ STA P0 
582c : a9 e4 __ LDA #$e4
582e : 85 12 __ STA P5 
5830 : a9 bf __ LDA #$bf
5832 : 85 15 __ STA P8 
5834 : a9 bf __ LDA #$bf
5836 : 85 13 __ STA P6 
5838 : a9 e2 __ LDA #$e2
583a : 85 14 __ STA P7 
583c : 20 f1 59 JSR $59f1 ; (rotate_y.s4 + 0)
583f : ad e7 bf LDA $bfe7 ; (rz0 + 1)
5842 : 30 1a __ BMI $585e ; (draw_floor.s8 + 0)
.s21:
5844 : d0 07 __ BNE $584d ; (draw_floor.s6 + 0)
.s20:
5846 : ad e6 bf LDA $bfe6 ; (rz0 + 0)
5849 : c9 0f __ CMP #$0f
584b : 90 11 __ BCC $585e ; (draw_floor.s8 + 0)
.s6:
584d : ad e3 bf LDA $bfe3 ; (rz1 + 1)
5850 : 30 0c __ BMI $585e ; (draw_floor.s8 + 0)
.s19:
5852 : f0 03 __ BEQ $5857 ; (draw_floor.s18 + 0)
5854 : 4c 63 59 JMP $5963 ; (draw_floor.s7 + 0)
.s18:
5857 : ad e2 bf LDA $bfe2 ; (rz1 + 0)
585a : c9 0f __ CMP #$0f
585c : b0 f6 __ BCS $5854 ; (draw_floor.s19 + 2)
.s8:
585e : e6 51 __ INC T3 + 0 
5860 : a5 51 __ LDA T3 + 0 
5862 : c9 07 __ CMP #$07
5864 : d0 93 __ BNE $57f9 ; (draw_floor.l5 + 0)
.s9:
5866 : a9 00 __ LDA #$00
5868 : 85 51 __ STA T3 + 0 
.l10:
586a : a5 18 __ LDA P11 ; (floor_rot + 0)
586c : 85 11 __ STA P4 
586e : a9 a0 __ LDA #$a0
5870 : 85 0f __ STA P2 
5872 : a9 00 __ LDA #$00
5874 : 85 10 __ STA P3 
5876 : a5 51 __ LDA T3 + 0 
5878 : 0a __ __ ASL
5879 : aa __ __ TAX
587a : a9 e0 __ LDA #$e0
587c : 85 12 __ STA P5 
587e : a9 bf __ LDA #$bf
5880 : 85 13 __ STA P6 
5882 : a9 de __ LDA #$de
5884 : 85 14 __ STA P7 
5886 : a9 bf __ LDA #$bf
5888 : 85 15 __ STA P8 
588a : bd b8 84 LDA $84b8,x ; (gx[0] + 0)
588d : 85 0d __ STA P0 
588f : bd b9 84 LDA $84b9,x ; (gx[0] + 1)
5892 : 85 0e __ STA P1 
5894 : 20 f1 59 JSR $59f1 ; (rotate_y.s4 + 0)
5897 : e6 10 __ INC P3 
5899 : a9 40 __ LDA #$40
589b : 85 0f __ STA P2 
589d : a9 dc __ LDA #$dc
589f : 85 12 __ STA P5 
58a1 : a9 bf __ LDA #$bf
58a3 : 85 15 __ STA P8 
58a5 : a9 bf __ LDA #$bf
58a7 : 85 13 __ STA P6 
58a9 : a9 da __ LDA #$da
58ab : 85 14 __ STA P7 
58ad : 20 f1 59 JSR $59f1 ; (rotate_y.s4 + 0)
58b0 : ad df bf LDA $bfdf ; (rz0 + 1)
58b3 : 30 17 __ BMI $58cc ; (draw_floor.s13 + 0)
.s17:
58b5 : d0 07 __ BNE $58be ; (draw_floor.s11 + 0)
.s16:
58b7 : ad de bf LDA $bfde ; (rz0 + 0)
58ba : c9 0f __ CMP #$0f
58bc : 90 0e __ BCC $58cc ; (draw_floor.s13 + 0)
.s11:
58be : ad db bf LDA $bfdb ; (rz1 + 1)
58c1 : 30 09 __ BMI $58cc ; (draw_floor.s13 + 0)
.s15:
58c3 : d0 10 __ BNE $58d5 ; (draw_floor.s12 + 0)
.s14:
58c5 : ad da bf LDA $bfda ; (rz1 + 0)
58c8 : c9 0f __ CMP #$0f
58ca : b0 09 __ BCS $58d5 ; (draw_floor.s12 + 0)
.s13:
58cc : e6 51 __ INC T3 + 0 
58ce : a5 51 __ LDA T3 + 0 
58d0 : c9 07 __ CMP #$07
58d2 : d0 96 __ BNE $586a ; (draw_floor.l10 + 0)
.s3:
58d4 : 60 __ __ RTS
.s12:
58d5 : ad e0 bf LDA $bfe0 ; (rx0 + 0)
58d8 : 85 1b __ STA ACCU + 0 
58da : ad e1 bf LDA $bfe1 ; (rx0 + 1)
58dd : 85 1c __ STA ACCU + 1 
58df : a9 b4 __ LDA #$b4
58e1 : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
58e4 : ad de bf LDA $bfde ; (rz0 + 0)
58e7 : 85 03 __ STA WORK + 0 
58e9 : ad df bf LDA $bfdf ; (rz0 + 1)
58ec : 85 04 __ STA WORK + 1 
58ee : 20 16 7c JSR $7c16 ; (divs16 + 0)
58f1 : 18 __ __ CLC
58f2 : a5 1b __ LDA ACCU + 0 
58f4 : 69 50 __ ADC #$50
58f6 : 85 12 __ STA P5 
58f8 : a5 1c __ LDA ACCU + 1 
58fa : 69 00 __ ADC #$00
58fc : 85 13 __ STA P6 
58fe : ad de bf LDA $bfde ; (rz0 + 0)
5901 : 85 03 __ STA WORK + 0 
5903 : ad df bf LDA $bfdf ; (rz0 + 1)
5906 : 85 04 __ STA WORK + 1 
5908 : 20 49 80 JSR $8049 ; (divmod@proxy + 0)
590b : 18 __ __ CLC
590c : a5 1b __ LDA ACCU + 0 
590e : 69 48 __ ADC #$48
5910 : 85 14 __ STA P7 
5912 : a5 1c __ LDA ACCU + 1 
5914 : 69 00 __ ADC #$00
5916 : 85 15 __ STA P8 
5918 : ad dc bf LDA $bfdc ; (rx1 + 0)
591b : 85 1b __ STA ACCU + 0 
591d : ad dd bf LDA $bfdd ; (rx1 + 1)
5920 : 85 1c __ STA ACCU + 1 
5922 : a9 b4 __ LDA #$b4
5924 : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
5927 : ad da bf LDA $bfda ; (rz1 + 0)
592a : 85 03 __ STA WORK + 0 
592c : ad db bf LDA $bfdb ; (rz1 + 1)
592f : 85 04 __ STA WORK + 1 
5931 : 20 16 7c JSR $7c16 ; (divs16 + 0)
5934 : 18 __ __ CLC
5935 : a5 1b __ LDA ACCU + 0 
5937 : 69 50 __ ADC #$50
5939 : 85 16 __ STA P9 
593b : a5 1c __ LDA ACCU + 1 
593d : 69 00 __ ADC #$00
593f : 85 17 __ STA P10 
5941 : ad da bf LDA $bfda ; (rz1 + 0)
5944 : 85 03 __ STA WORK + 0 
5946 : ad db bf LDA $bfdb ; (rz1 + 1)
5949 : 85 04 __ STA WORK + 1 
594b : 20 49 80 JSR $8049 ; (divmod@proxy + 0)
594e : 18 __ __ CLC
594f : a5 1b __ LDA ACCU + 0 
5951 : 69 48 __ ADC #$48
5953 : 8d ea bf STA $bfea ; (sstack + 0)
5956 : a5 1c __ LDA ACCU + 1 
5958 : 69 00 __ ADC #$00
595a : 8d eb bf STA $bfeb ; (sstack + 1)
595d : 20 b6 5a JSR $5ab6 ; (mc_line.s4 + 0)
5960 : 4c cc 58 JMP $58cc ; (draw_floor.s13 + 0)
.s7:
5963 : ad e8 bf LDA $bfe8 ; (rx0 + 0)
5966 : 85 1b __ STA ACCU + 0 
5968 : ad e9 bf LDA $bfe9 ; (rx0 + 1)
596b : 85 1c __ STA ACCU + 1 
596d : a9 b4 __ LDA #$b4
596f : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
5972 : ad e6 bf LDA $bfe6 ; (rz0 + 0)
5975 : 85 03 __ STA WORK + 0 
5977 : ad e7 bf LDA $bfe7 ; (rz0 + 1)
597a : 85 04 __ STA WORK + 1 
597c : 20 16 7c JSR $7c16 ; (divs16 + 0)
597f : 18 __ __ CLC
5980 : a5 1b __ LDA ACCU + 0 
5982 : 69 50 __ ADC #$50
5984 : 85 12 __ STA P5 
5986 : a5 1c __ LDA ACCU + 1 
5988 : 69 00 __ ADC #$00
598a : 85 13 __ STA P6 
598c : ad e6 bf LDA $bfe6 ; (rz0 + 0)
598f : 85 03 __ STA WORK + 0 
5991 : ad e7 bf LDA $bfe7 ; (rz0 + 1)
5994 : 85 04 __ STA WORK + 1 
5996 : 20 49 80 JSR $8049 ; (divmod@proxy + 0)
5999 : 18 __ __ CLC
599a : a5 1b __ LDA ACCU + 0 
599c : 69 48 __ ADC #$48
599e : 85 14 __ STA P7 
59a0 : a5 1c __ LDA ACCU + 1 
59a2 : 69 00 __ ADC #$00
59a4 : 85 15 __ STA P8 
59a6 : ad e4 bf LDA $bfe4 ; (rx1 + 0)
59a9 : 85 1b __ STA ACCU + 0 
59ab : ad e5 bf LDA $bfe5 ; (rx1 + 1)
59ae : 85 1c __ STA ACCU + 1 
59b0 : a9 b4 __ LDA #$b4
59b2 : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
59b5 : ad e2 bf LDA $bfe2 ; (rz1 + 0)
59b8 : 85 03 __ STA WORK + 0 
59ba : ad e3 bf LDA $bfe3 ; (rz1 + 1)
59bd : 85 04 __ STA WORK + 1 
59bf : 20 16 7c JSR $7c16 ; (divs16 + 0)
59c2 : 18 __ __ CLC
59c3 : a5 1b __ LDA ACCU + 0 
59c5 : 69 50 __ ADC #$50
59c7 : 85 16 __ STA P9 
59c9 : a5 1c __ LDA ACCU + 1 
59cb : 69 00 __ ADC #$00
59cd : 85 17 __ STA P10 
59cf : ad e2 bf LDA $bfe2 ; (rz1 + 0)
59d2 : 85 03 __ STA WORK + 0 
59d4 : ad e3 bf LDA $bfe3 ; (rz1 + 1)
59d7 : 85 04 __ STA WORK + 1 
59d9 : 20 49 80 JSR $8049 ; (divmod@proxy + 0)
59dc : 18 __ __ CLC
59dd : a5 1b __ LDA ACCU + 0 
59df : 69 48 __ ADC #$48
59e1 : 8d ea bf STA $bfea ; (sstack + 0)
59e4 : a5 1c __ LDA ACCU + 1 
59e6 : 69 00 __ ADC #$00
59e8 : 8d eb bf STA $bfeb ; (sstack + 1)
59eb : 20 b6 5a JSR $5ab6 ; (mc_line.s4 + 0)
59ee : 4c 5e 58 JMP $585e ; (draw_floor.s8 + 0)
--------------------------------------------------------------------
rotate_y: ; rotate_y(i16,i16,u8,i16*,i16*)->void
; 128, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
59f1 : a5 11 __ LDA P4 ; (angle + 0)
59f3 : 29 3f __ AND #$3f
59f5 : aa __ __ TAX
59f6 : bd 08 84 LDA $8408,x ; (sin64[0] + 0)
59f9 : 85 45 __ STA T1 + 0 
59fb : 85 03 __ STA WORK + 0 
59fd : 29 80 __ AND #$80
59ff : 10 02 __ BPL $5a03 ; (rotate_y.s4 + 18)
5a01 : a9 ff __ LDA #$ff
5a03 : 85 46 __ STA T1 + 1 
5a05 : 85 04 __ STA WORK + 1 
5a07 : a5 0f __ LDA P2 ; (z + 0)
5a09 : 38 __ __ SEC
5a0a : e9 f0 __ SBC #$f0
5a0c : 85 47 __ STA T2 + 0 
5a0e : 85 1b __ STA ACCU + 0 
5a10 : a5 10 __ LDA P3 ; (z + 1)
5a12 : e9 00 __ SBC #$00
5a14 : 85 48 __ STA T2 + 1 
5a16 : 85 1c __ STA ACCU + 1 
5a18 : 20 d4 7b JSR $7bd4 ; (mul16 + 0)
5a1b : a5 05 __ LDA WORK + 2 
5a1d : 85 49 __ STA T3 + 0 
5a1f : a5 06 __ LDA WORK + 3 
5a21 : 85 4a __ STA T3 + 1 
5a23 : 18 __ __ CLC
5a24 : a5 11 __ LDA P4 ; (angle + 0)
5a26 : 69 10 __ ADC #$10
5a28 : 29 3f __ AND #$3f
5a2a : aa __ __ TAX
5a2b : bd 08 84 LDA $8408,x ; (sin64[0] + 0)
5a2e : 85 43 __ STA T0 + 0 
5a30 : 85 03 __ STA WORK + 0 
5a32 : 29 80 __ AND #$80
5a34 : 10 02 __ BPL $5a38 ; (rotate_y.s4 + 71)
5a36 : a9 ff __ LDA #$ff
5a38 : 85 44 __ STA T0 + 1 
5a3a : 85 04 __ STA WORK + 1 
5a3c : a5 0d __ LDA P0 ; (x + 0)
5a3e : 85 1b __ STA ACCU + 0 
5a40 : a5 0e __ LDA P1 ; (x + 1)
5a42 : 85 1c __ STA ACCU + 1 
5a44 : 20 d4 7b JSR $7bd4 ; (mul16 + 0)
5a47 : 18 __ __ CLC
5a48 : a5 05 __ LDA WORK + 2 
5a4a : 65 49 __ ADC T3 + 0 
5a4c : 85 1b __ STA ACCU + 0 
5a4e : a5 06 __ LDA WORK + 3 
5a50 : 65 4a __ ADC T3 + 1 
5a52 : 85 1c __ STA ACCU + 1 
5a54 : 20 3e 80 JSR $803e ; (divs16@proxy + 0)
5a57 : a5 1b __ LDA ACCU + 0 
5a59 : a0 00 __ LDY #$00
5a5b : 91 12 __ STA (P5),y ; (rx + 0)
5a5d : a5 1c __ LDA ACCU + 1 
5a5f : c8 __ __ INY
5a60 : 91 12 __ STA (P5),y ; (rx + 0)
5a62 : 38 __ __ SEC
5a63 : a9 00 __ LDA #$00
5a65 : e5 0d __ SBC P0 ; (x + 0)
5a67 : 85 1b __ STA ACCU + 0 
5a69 : a9 00 __ LDA #$00
5a6b : e5 0e __ SBC P1 ; (x + 1)
5a6d : 85 1c __ STA ACCU + 1 
5a6f : a5 45 __ LDA T1 + 0 
5a71 : 85 03 __ STA WORK + 0 
5a73 : a5 46 __ LDA T1 + 1 
5a75 : 85 04 __ STA WORK + 1 
5a77 : 20 d4 7b JSR $7bd4 ; (mul16 + 0)
5a7a : a5 05 __ LDA WORK + 2 
5a7c : 85 45 __ STA T1 + 0 
5a7e : a5 06 __ LDA WORK + 3 
5a80 : 85 46 __ STA T1 + 1 
5a82 : a5 47 __ LDA T2 + 0 
5a84 : 85 1b __ STA ACCU + 0 
5a86 : a5 48 __ LDA T2 + 1 
5a88 : 85 1c __ STA ACCU + 1 
5a8a : a5 43 __ LDA T0 + 0 
5a8c : 85 03 __ STA WORK + 0 
5a8e : a5 44 __ LDA T0 + 1 
5a90 : 85 04 __ STA WORK + 1 
5a92 : 20 d4 7b JSR $7bd4 ; (mul16 + 0)
5a95 : 18 __ __ CLC
5a96 : a5 05 __ LDA WORK + 2 
5a98 : 65 45 __ ADC T1 + 0 
5a9a : 85 1b __ STA ACCU + 0 
5a9c : a5 06 __ LDA WORK + 3 
5a9e : 65 46 __ ADC T1 + 1 
5aa0 : 85 1c __ STA ACCU + 1 
5aa2 : 20 3e 80 JSR $803e ; (divs16@proxy + 0)
5aa5 : 18 __ __ CLC
5aa6 : a5 1b __ LDA ACCU + 0 
5aa8 : 69 f0 __ ADC #$f0
5aaa : a0 00 __ LDY #$00
5aac : 91 14 __ STA (P7),y ; (rz + 0)
5aae : a5 1c __ LDA ACCU + 1 
5ab0 : 69 00 __ ADC #$00
5ab2 : c8 __ __ INY
5ab3 : 91 14 __ STA (P7),y ; (rz + 0)
.s3:
5ab5 : 60 __ __ RTS
--------------------------------------------------------------------
mc_line: ; mc_line(i16,i16,i16,i16,u8)->void
;  89, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5ab6 : 38 __ __ SEC
5ab7 : a5 16 __ LDA P9 ; (x1 + 0)
5ab9 : e5 12 __ SBC P5 ; (x0 + 0)
5abb : 85 43 __ STA T3 + 0 
5abd : a5 17 __ LDA P10 ; (x1 + 1)
5abf : e5 13 __ SBC P6 ; (x0 + 1)
5ac1 : 85 44 __ STA T3 + 1 
5ac3 : 10 0d __ BPL $5ad2 ; (mc_line.s5 + 0)
.s37:
5ac5 : 38 __ __ SEC
5ac6 : a9 00 __ LDA #$00
5ac8 : e5 43 __ SBC T3 + 0 
5aca : 85 43 __ STA T3 + 0 
5acc : a9 00 __ LDA #$00
5ace : e5 44 __ SBC T3 + 1 
5ad0 : 85 44 __ STA T3 + 1 
.s5:
5ad2 : ad ea bf LDA $bfea ; (sstack + 0)
5ad5 : 85 45 __ STA T4 + 0 
5ad7 : 38 __ __ SEC
5ad8 : e5 14 __ SBC P7 ; (y0 + 0)
5ada : 85 47 __ STA T5 + 0 
5adc : ad eb bf LDA $bfeb ; (sstack + 1)
5adf : 85 46 __ STA T4 + 1 
5ae1 : e5 15 __ SBC P8 ; (y0 + 1)
5ae3 : 85 48 __ STA T5 + 1 
5ae5 : 10 0d __ BPL $5af4 ; (mc_line.s6 + 0)
.s36:
5ae7 : 38 __ __ SEC
5ae8 : a9 00 __ LDA #$00
5aea : e5 47 __ SBC T5 + 0 
5aec : 85 47 __ STA T5 + 0 
5aee : a9 00 __ LDA #$00
5af0 : e5 48 __ SBC T5 + 1 
5af2 : 85 48 __ STA T5 + 1 
.s6:
5af4 : a5 13 __ LDA P6 ; (x0 + 1)
5af6 : c5 17 __ CMP P10 ; (x1 + 1)
5af8 : d0 08 __ BNE $5b02 ; (mc_line.s35 + 0)
.s32:
5afa : a5 12 __ LDA P5 ; (x0 + 0)
5afc : c5 16 __ CMP P9 ; (x1 + 0)
.s33:
5afe : 90 08 __ BCC $5b08 ; (mc_line.s31 + 0)
5b00 : b0 0e __ BCS $5b10 ; (mc_line.s7 + 0)
.s35:
5b02 : 45 17 __ EOR P10 ; (x1 + 1)
5b04 : 10 f8 __ BPL $5afe ; (mc_line.s33 + 0)
.s34:
5b06 : 90 08 __ BCC $5b10 ; (mc_line.s7 + 0)
.s31:
5b08 : a9 01 __ LDA #$01
5b0a : 85 49 __ STA T6 + 0 
5b0c : a9 00 __ LDA #$00
5b0e : f0 04 __ BEQ $5b14 ; (mc_line.s8 + 0)
.s7:
5b10 : a9 ff __ LDA #$ff
5b12 : 85 49 __ STA T6 + 0 
.s8:
5b14 : 85 4a __ STA T6 + 1 
5b16 : a5 15 __ LDA P8 ; (y0 + 1)
5b18 : c5 46 __ CMP T4 + 1 
5b1a : d0 08 __ BNE $5b24 ; (mc_line.s30 + 0)
.s27:
5b1c : a5 14 __ LDA P7 ; (y0 + 0)
5b1e : c5 45 __ CMP T4 + 0 
.s28:
5b20 : 90 08 __ BCC $5b2a ; (mc_line.s26 + 0)
5b22 : b0 0e __ BCS $5b32 ; (mc_line.s9 + 0)
.s30:
5b24 : 45 46 __ EOR T4 + 1 
5b26 : 10 f8 __ BPL $5b20 ; (mc_line.s28 + 0)
.s29:
5b28 : 90 08 __ BCC $5b32 ; (mc_line.s9 + 0)
.s26:
5b2a : a9 01 __ LDA #$01
5b2c : 85 4b __ STA T7 + 0 
5b2e : a9 00 __ LDA #$00
5b30 : f0 04 __ BEQ $5b36 ; (mc_line.s10 + 0)
.s9:
5b32 : a9 ff __ LDA #$ff
5b34 : 85 4b __ STA T7 + 0 
.s10:
5b36 : 85 4c __ STA T7 + 1 
5b38 : 38 __ __ SEC
5b39 : a5 43 __ LDA T3 + 0 
5b3b : e5 47 __ SBC T5 + 0 
5b3d : 85 4d __ STA T8 + 0 
5b3f : a5 44 __ LDA T3 + 1 
5b41 : e5 48 __ SBC T5 + 1 
5b43 : 85 4e __ STA T8 + 1 
5b45 : 38 __ __ SEC
5b46 : a9 00 __ LDA #$00
5b48 : e5 47 __ SBC T5 + 0 
5b4a : 85 4f __ STA T9 + 0 
5b4c : a9 00 __ LDA #$00
5b4e : e5 48 __ SBC T5 + 1 
5b50 : 85 50 __ STA T9 + 1 
.l11:
5b52 : a5 12 __ LDA P5 ; (x0 + 0)
5b54 : 85 0d __ STA P0 
5b56 : a9 01 __ LDA #$01
5b58 : 85 11 __ STA P4 
5b5a : a5 13 __ LDA P6 ; (x0 + 1)
5b5c : 85 0e __ STA P1 
5b5e : a5 14 __ LDA P7 ; (y0 + 0)
5b60 : 85 0f __ STA P2 
5b62 : a5 15 __ LDA P8 ; (y0 + 1)
5b64 : 85 10 __ STA P3 
5b66 : 20 f1 5b JSR $5bf1 ; (mc_setpix.s4 + 0)
5b69 : a5 13 __ LDA P6 ; (x0 + 1)
5b6b : c5 17 __ CMP P10 ; (x1 + 1)
5b6d : d0 12 __ BNE $5b81 ; (mc_line.s12 + 0)
.s25:
5b6f : a5 12 __ LDA P5 ; (x0 + 0)
5b71 : c5 16 __ CMP P9 ; (x1 + 0)
5b73 : d0 0c __ BNE $5b81 ; (mc_line.s12 + 0)
.s23:
5b75 : a5 15 __ LDA P8 ; (y0 + 1)
5b77 : c5 46 __ CMP T4 + 1 
5b79 : d0 06 __ BNE $5b81 ; (mc_line.s12 + 0)
.s24:
5b7b : a5 14 __ LDA P7 ; (y0 + 0)
5b7d : c5 45 __ CMP T4 + 0 
5b7f : f0 63 __ BEQ $5be4 ; (mc_line.s3 + 0)
.s12:
5b81 : a5 4d __ LDA T8 + 0 
5b83 : 0a __ __ ASL
5b84 : 85 1b __ STA ACCU + 0 
5b86 : a5 4e __ LDA T8 + 1 
5b88 : 2a __ __ ROL
5b89 : 85 1c __ STA ACCU + 1 
5b8b : a5 50 __ LDA T9 + 1 
5b8d : c5 1c __ CMP ACCU + 1 
5b8f : d0 08 __ BNE $5b99 ; (mc_line.s22 + 0)
.s19:
5b91 : a5 4f __ LDA T9 + 0 
5b93 : c5 1b __ CMP ACCU + 0 
.s20:
5b95 : 90 08 __ BCC $5b9f ; (mc_line.s18 + 0)
5b97 : b0 20 __ BCS $5bb9 ; (mc_line.s13 + 0)
.s22:
5b99 : 45 1c __ EOR ACCU + 1 
5b9b : 10 f8 __ BPL $5b95 ; (mc_line.s20 + 0)
.s21:
5b9d : 90 1a __ BCC $5bb9 ; (mc_line.s13 + 0)
.s18:
5b9f : 18 __ __ CLC
5ba0 : a5 12 __ LDA P5 ; (x0 + 0)
5ba2 : 65 49 __ ADC T6 + 0 
5ba4 : 85 12 __ STA P5 ; (x0 + 0)
5ba6 : a5 13 __ LDA P6 ; (x0 + 1)
5ba8 : 65 4a __ ADC T6 + 1 
5baa : 85 13 __ STA P6 ; (x0 + 1)
5bac : 38 __ __ SEC
5bad : a5 4d __ LDA T8 + 0 
5baf : e5 47 __ SBC T5 + 0 
5bb1 : 85 4d __ STA T8 + 0 
5bb3 : a5 4e __ LDA T8 + 1 
5bb5 : e5 48 __ SBC T5 + 1 
5bb7 : 85 4e __ STA T8 + 1 
.s13:
5bb9 : a5 1c __ LDA ACCU + 1 
5bbb : 30 0a __ BMI $5bc7 ; (mc_line.s14 + 0)
.s17:
5bbd : c5 44 __ CMP T3 + 1 
5bbf : d0 04 __ BNE $5bc5 ; (mc_line.s16 + 0)
.s15:
5bc1 : a5 1b __ LDA ACCU + 0 
5bc3 : c5 43 __ CMP T3 + 0 
.s16:
5bc5 : b0 8b __ BCS $5b52 ; (mc_line.l11 + 0)
.s14:
5bc7 : 18 __ __ CLC
5bc8 : a5 14 __ LDA P7 ; (y0 + 0)
5bca : 65 4b __ ADC T7 + 0 
5bcc : 85 14 __ STA P7 ; (y0 + 0)
5bce : a5 15 __ LDA P8 ; (y0 + 1)
5bd0 : 65 4c __ ADC T7 + 1 
5bd2 : 85 15 __ STA P8 ; (y0 + 1)
5bd4 : 18 __ __ CLC
5bd5 : a5 4d __ LDA T8 + 0 
5bd7 : 65 43 __ ADC T3 + 0 
5bd9 : 85 4d __ STA T8 + 0 
5bdb : a5 4e __ LDA T8 + 1 
5bdd : 65 44 __ ADC T3 + 1 
5bdf : 85 4e __ STA T8 + 1 
5be1 : 4c 52 5b JMP $5b52 ; (mc_line.l11 + 0)
.s3:
5be4 : 60 __ __ RTS
--------------------------------------------------------------------
mc_setpix@proxy: ; mc_setpix@proxy
5be5 : a5 46 __ LDA $46 
5be7 : 85 0d __ STA P0 
5be9 : a5 47 __ LDA $47 
5beb : 85 0e __ STA P1 
5bed : a5 18 __ LDA P11 
5bef : 85 11 __ STA P4 
--------------------------------------------------------------------
mc_setpix: ; mc_setpix(i16,i16,u8)->void
;  54, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5bf1 : a5 0e __ LDA P1 ; (mx + 1)
5bf3 : d0 5e __ BNE $5c53 ; (mc_setpix.s3 + 0)
.s9:
5bf5 : a5 0d __ LDA P0 ; (mx + 0)
5bf7 : c9 a0 __ CMP #$a0
5bf9 : b0 58 __ BCS $5c53 ; (mc_setpix.s3 + 0)
.s5:
5bfb : a5 10 __ LDA P3 ; (my + 1)
5bfd : d0 54 __ BNE $5c53 ; (mc_setpix.s3 + 0)
.s8:
5bff : a5 0f __ LDA P2 ; (my + 0)
5c01 : c9 c8 __ CMP #$c8
5c03 : b0 4e __ BCS $5c53 ; (mc_setpix.s3 + 0)
.s6:
5c05 : a5 0d __ LDA P0 ; (mx + 0)
5c07 : 29 03 __ AND #$03
5c09 : 49 03 __ EOR #$03
5c0b : 0a __ __ ASL
5c0c : 85 1b __ STA ACCU + 0 
5c0e : a5 11 __ LDA P4 ; (col + 0)
5c10 : a6 1b __ LDX ACCU + 0 
5c12 : f0 08 __ BEQ $5c1c ; (mc_setpix.s7 + 0)
.l10:
5c14 : 0a __ __ ASL
5c15 : ca __ __ DEX
5c16 : d0 fc __ BNE $5c14 ; (mc_setpix.l10 + 0)
.s11:
5c18 : 85 11 __ STA P4 ; (col + 0)
5c1a : a6 1b __ LDX ACCU + 0 
.s7:
5c1c : a5 0f __ LDA P2 ; (my + 0)
5c1e : 29 07 __ AND #$07
5c20 : 85 1c __ STA ACCU + 1 
5c22 : a5 0f __ LDA P2 ; (my + 0)
5c24 : 4a __ __ LSR
5c25 : 4a __ __ LSR
5c26 : 4a __ __ LSR
5c27 : 85 1b __ STA ACCU + 0 
5c29 : 0a __ __ ASL
5c2a : 0a __ __ ASL
5c2b : 65 1b __ ADC ACCU + 0 
5c2d : 4a __ __ LSR
5c2e : 6a __ __ ROR
5c2f : a8 __ __ TAY
5c30 : 29 80 __ AND #$80
5c32 : 6a __ __ ROR
5c33 : 05 1c __ ORA ACCU + 1 
5c35 : 85 1b __ STA ACCU + 0 
5c37 : 98 __ __ TYA
5c38 : 29 3f __ AND #$3f
5c3a : 85 1c __ STA ACCU + 1 
5c3c : a5 0d __ LDA P0 ; (mx + 0)
5c3e : 29 fc __ AND #$fc
5c40 : 0a __ __ ASL
5c41 : a8 __ __ TAY
5c42 : a5 1c __ LDA ACCU + 1 
5c44 : 69 e0 __ ADC #$e0
5c46 : 85 1c __ STA ACCU + 1 
5c48 : bd ad 7f LDA $7fad,x ; (__shltab3L + 0)
5c4b : 49 ff __ EOR #$ff
5c4d : 31 1b __ AND (ACCU + 0),y 
5c4f : 05 11 __ ORA P4 ; (col + 0)
5c51 : 91 1b __ STA (ACCU + 0),y 
.s3:
5c53 : 60 __ __ RTS
--------------------------------------------------------------------
draw_shadow: ; draw_shadow(i16,i16,i16,i16)->void
; 174, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5c54 : a5 17 __ LDA P10 ; (rx + 1)
5c56 : 30 06 __ BMI $5c5e ; (draw_shadow.s29 + 0)
.s31:
5c58 : d0 0c __ BNE $5c66 ; (draw_shadow.s5 + 0)
.s30:
5c5a : a5 16 __ LDA P9 ; (rx + 0)
5c5c : d0 08 __ BNE $5c66 ; (draw_shadow.s5 + 0)
.s29:
5c5e : a9 01 __ LDA #$01
5c60 : 85 16 __ STA P9 ; (rx + 0)
5c62 : a9 00 __ LDA #$00
5c64 : 85 17 __ STA P10 ; (rx + 1)
.s5:
5c66 : ad eb bf LDA $bfeb ; (sstack + 1)
5c69 : 30 07 __ BMI $5c72 ; (draw_shadow.s26 + 0)
.s28:
5c6b : d0 0f __ BNE $5c7c ; (draw_shadow.s6 + 0)
.s27:
5c6d : ad ea bf LDA $bfea ; (sstack + 0)
5c70 : d0 0a __ BNE $5c7c ; (draw_shadow.s6 + 0)
.s26:
5c72 : a9 01 __ LDA #$01
5c74 : 8d ea bf STA $bfea ; (sstack + 0)
5c77 : a9 00 __ LDA #$00
5c79 : 8d eb bf STA $bfeb ; (sstack + 1)
.s6:
5c7c : ad ea bf LDA $bfea ; (sstack + 0)
5c7f : 85 48 __ STA T2 + 0 
5c81 : 49 ff __ EOR #$ff
5c83 : 38 __ __ SEC
5c84 : 69 00 __ ADC #$00
5c86 : 85 4a __ STA T3 + 0 
5c88 : a9 00 __ LDA #$00
5c8a : ed eb bf SBC $bfeb ; (sstack + 1)
5c8d : 85 4b __ STA T3 + 1 
5c8f : ad eb bf LDA $bfeb ; (sstack + 1)
5c92 : 85 49 __ STA T2 + 1 
5c94 : c5 4b __ CMP T3 + 1 
5c96 : d0 07 __ BNE $5c9f ; (draw_shadow.s25 + 0)
.s22:
5c98 : a5 48 __ LDA T2 + 0 
5c9a : c5 4a __ CMP T3 + 0 
.s23:
5c9c : b0 08 __ BCS $5ca6 ; (draw_shadow.s7 + 0)
5c9e : 60 __ __ RTS
.s25:
5c9f : 45 4b __ EOR T3 + 1 
5ca1 : 10 f9 __ BPL $5c9c ; (draw_shadow.s23 + 0)
.s24:
5ca3 : 90 01 __ BCC $5ca6 ; (draw_shadow.s7 + 0)
5ca5 : 60 __ __ RTS
.s7:
5ca6 : 18 __ __ CLC
5ca7 : a5 14 __ LDA P7 ; (sy + 0)
5ca9 : 65 4a __ ADC T3 + 0 
5cab : 85 4c __ STA T4 + 0 
5cad : a5 15 __ LDA P8 ; (sy + 1)
5caf : 65 4b __ ADC T3 + 1 
5cb1 : 85 4d __ STA T4 + 1 
5cb3 : a5 48 __ LDA T2 + 0 
5cb5 : 85 03 __ STA WORK + 0 
5cb7 : 85 1b __ STA ACCU + 0 
5cb9 : a5 49 __ LDA T2 + 1 
5cbb : 85 04 __ STA WORK + 1 
5cbd : 85 1c __ STA ACCU + 1 
5cbf : 20 d4 7b JSR $7bd4 ; (mul16 + 0)
5cc2 : a5 05 __ LDA WORK + 2 
5cc4 : 85 4e __ STA T5 + 0 
5cc6 : a5 06 __ LDA WORK + 3 
5cc8 : 85 4f __ STA T5 + 1 
5cca : a5 4d __ LDA T4 + 1 
5ccc : f0 03 __ BEQ $5cd1 ; (draw_shadow.l21 + 0)
5cce : 4c 6c 5d JMP $5d6c ; (draw_shadow.l11 + 0)
.l21:
5cd1 : a5 4c __ LDA T4 + 0 
5cd3 : c9 c8 __ CMP #$c8
5cd5 : b0 f7 __ BCS $5cce ; (draw_shadow.s7 + 40)
.s9:
5cd7 : a5 4a __ LDA T3 + 0 
5cd9 : 85 03 __ STA WORK + 0 
5cdb : 85 1b __ STA ACCU + 0 
5cdd : a5 4b __ LDA T3 + 1 
5cdf : 85 04 __ STA WORK + 1 
5ce1 : 85 1c __ STA ACCU + 1 
5ce3 : 20 d4 7b JSR $7bd4 ; (mul16 + 0)
5ce6 : 38 __ __ SEC
5ce7 : a5 4e __ LDA T5 + 0 
5ce9 : e5 05 __ SBC WORK + 2 
5ceb : 85 0d __ STA P0 
5ced : a5 4f __ LDA T5 + 1 
5cef : e5 06 __ SBC WORK + 3 
5cf1 : 30 79 __ BMI $5d6c ; (draw_shadow.l11 + 0)
.s10:
5cf3 : 85 0e __ STA P1 
5cf5 : 20 93 5d JSR $5d93 ; (mc_isqrt.s4 + 0)
5cf8 : a5 1b __ LDA ACCU + 0 
5cfa : 85 03 __ STA WORK + 0 
5cfc : a5 1c __ LDA ACCU + 1 
5cfe : 85 04 __ STA WORK + 1 
5d00 : a5 16 __ LDA P9 ; (rx + 0)
5d02 : 85 1b __ STA ACCU + 0 
5d04 : a5 17 __ LDA P10 ; (rx + 1)
5d06 : 85 1c __ STA ACCU + 1 
5d08 : 20 d4 7b JSR $7bd4 ; (mul16 + 0)
5d0b : a5 05 __ LDA WORK + 2 
5d0d : 85 1b __ STA ACCU + 0 
5d0f : a5 06 __ LDA WORK + 3 
5d11 : 85 1c __ STA ACCU + 1 
5d13 : a5 48 __ LDA T2 + 0 
5d15 : 85 03 __ STA WORK + 0 
5d17 : a5 49 __ LDA T2 + 1 
5d19 : 85 04 __ STA WORK + 1 
5d1b : 20 16 7c JSR $7c16 ; (divs16 + 0)
5d1e : 18 __ __ CLC
5d1f : a5 12 __ LDA P5 ; (sx + 0)
5d21 : 65 1b __ ADC ACCU + 0 
5d23 : 85 50 __ STA T6 + 0 
5d25 : a5 13 __ LDA P6 ; (sx + 1)
5d27 : 65 1c __ ADC ACCU + 1 
5d29 : 85 51 __ STA T6 + 1 
5d2b : 38 __ __ SEC
5d2c : a5 12 __ LDA P5 ; (sx + 0)
5d2e : e5 1b __ SBC ACCU + 0 
5d30 : 85 47 __ STA T0 + 0 
5d32 : a5 13 __ LDA P6 ; (sx + 1)
5d34 : e5 1c __ SBC ACCU + 1 
5d36 : 85 0e __ STA P1 
5d38 : a9 00 __ LDA #$00
5d3a : 85 10 __ STA P3 
.l36:
5d3c : a5 51 __ LDA T6 + 1 
5d3e : c5 0e __ CMP P1 
5d40 : d0 08 __ BNE $5d4a ; (draw_shadow.s20 + 0)
.s17:
5d42 : a5 50 __ LDA T6 + 0 
5d44 : c5 47 __ CMP T0 + 0 
.s18:
5d46 : b0 08 __ BCS $5d50 ; (draw_shadow.s16 + 0)
5d48 : 90 22 __ BCC $5d6c ; (draw_shadow.l11 + 0)
.s20:
5d4a : 45 0e __ EOR P1 
5d4c : 10 f8 __ BPL $5d46 ; (draw_shadow.s18 + 0)
.s19:
5d4e : b0 1c __ BCS $5d6c ; (draw_shadow.l11 + 0)
.s16:
5d50 : a5 47 __ LDA T0 + 0 
5d52 : 85 0d __ STA P0 
5d54 : a5 4c __ LDA T4 + 0 
5d56 : 85 0f __ STA P2 
5d58 : a9 03 __ LDA #$03
5d5a : 85 11 __ STA P4 
5d5c : 20 f1 5b JSR $5bf1 ; (mc_setpix.s4 + 0)
5d5f : 18 __ __ CLC
5d60 : a5 0d __ LDA P0 
5d62 : 69 02 __ ADC #$02
5d64 : 85 47 __ STA T0 + 0 
5d66 : 90 d4 __ BCC $5d3c ; (draw_shadow.l36 + 0)
.s37:
5d68 : e6 0e __ INC P1 
5d6a : b0 d0 __ BCS $5d3c ; (draw_shadow.l36 + 0)
.l11:
5d6c : e6 4c __ INC T4 + 0 
5d6e : d0 02 __ BNE $5d72 ; (draw_shadow.s33 + 0)
.s32:
5d70 : e6 4d __ INC T4 + 1 
.s33:
5d72 : e6 4a __ INC T3 + 0 
5d74 : d0 02 __ BNE $5d78 ; (draw_shadow.s35 + 0)
.s34:
5d76 : e6 4b __ INC T3 + 1 
.s35:
5d78 : a5 49 __ LDA T2 + 1 
5d7a : c5 4b __ CMP T3 + 1 
5d7c : d0 07 __ BNE $5d85 ; (draw_shadow.s15 + 0)
.s12:
5d7e : a5 48 __ LDA T2 + 0 
5d80 : c5 4a __ CMP T3 + 0 
.s13:
5d82 : b0 07 __ BCS $5d8b ; (draw_shadow.s8 + 0)
5d84 : 60 __ __ RTS
.s15:
5d85 : 45 4b __ EOR T3 + 1 
5d87 : 10 f9 __ BPL $5d82 ; (draw_shadow.s13 + 0)
.s14:
5d89 : b0 07 __ BCS $5d92 ; (draw_shadow.s3 + 0)
.s8:
5d8b : a5 4d __ LDA T4 + 1 
5d8d : d0 dd __ BNE $5d6c ; (draw_shadow.l11 + 0)
5d8f : 4c d1 5c JMP $5cd1 ; (draw_shadow.l21 + 0)
.s3:
5d92 : 60 __ __ RTS
--------------------------------------------------------------------
mc_isqrt: ; mc_isqrt(u16)->i16
;  39, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5d93 : a5 0e __ LDA P1 ; (n + 1)
5d95 : 05 0d __ ORA P0 ; (n + 0)
5d97 : d0 05 __ BNE $5d9e ; (mc_isqrt.s5 + 0)
.s10:
5d99 : 85 1b __ STA ACCU + 0 
.s3:
5d9b : 85 1c __ STA ACCU + 1 
5d9d : 60 __ __ RTS
.s5:
5d9e : a5 0e __ LDA P1 ; (n + 1)
5da0 : 4a __ __ LSR
5da1 : 85 44 __ STA T1 + 1 
5da3 : a5 0d __ LDA P0 ; (n + 0)
5da5 : 6a __ __ ROR
5da6 : 85 43 __ STA T1 + 0 
5da8 : 05 44 __ ORA T1 + 1 
5daa : d0 06 __ BNE $5db2 ; (mc_isqrt.l6 + 0)
.s9:
5dac : a2 01 __ LDX #$01
5dae : 86 1b __ STX ACCU + 0 
5db0 : d0 e9 __ BNE $5d9b ; (mc_isqrt.s3 + 0)
.l6:
5db2 : a5 43 __ LDA T1 + 0 
5db4 : 85 03 __ STA WORK + 0 
5db6 : 85 45 __ STA T2 + 0 
5db8 : a5 44 __ LDA T1 + 1 
5dba : 85 04 __ STA WORK + 1 
5dbc : 85 46 __ STA T2 + 1 
5dbe : a5 0d __ LDA P0 ; (n + 0)
5dc0 : 85 1b __ STA ACCU + 0 
5dc2 : a5 0e __ LDA P1 ; (n + 1)
5dc4 : 85 1c __ STA ACCU + 1 
5dc6 : 20 4d 7c JSR $7c4d ; (divmod + 0)
5dc9 : 18 __ __ CLC
5dca : a5 1b __ LDA ACCU + 0 
5dcc : 65 43 __ ADC T1 + 0 
5dce : 85 43 __ STA T1 + 0 
5dd0 : a5 1c __ LDA ACCU + 1 
5dd2 : 65 44 __ ADC T1 + 1 
5dd4 : 4a __ __ LSR
5dd5 : 85 44 __ STA T1 + 1 
5dd7 : 66 43 __ ROR T1 + 0 
5dd9 : c5 46 __ CMP T2 + 1 
5ddb : 90 d5 __ BCC $5db2 ; (mc_isqrt.l6 + 0)
.s11:
5ddd : d0 06 __ BNE $5de5 ; (mc_isqrt.s7 + 0)
.s8:
5ddf : a5 43 __ LDA T1 + 0 
5de1 : c5 45 __ CMP T2 + 0 
5de3 : 90 cd __ BCC $5db2 ; (mc_isqrt.l6 + 0)
.s7:
5de5 : a5 45 __ LDA T2 + 0 
5de7 : 85 1b __ STA ACCU + 0 
5de9 : a5 46 __ LDA T2 + 1 
5deb : b0 ae __ BCS $5d9b ; (mc_isqrt.s3 + 0)
--------------------------------------------------------------------
draw_ball: ; draw_ball(i16,i16,u8,i16)->void
; 199, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s1:
5ded : a2 1c __ LDX #$1c
5def : b5 53 __ LDA T3 + 0,x 
5df1 : 9d c3 bf STA $bfc3,x ; (draw_ball@stack + 0)
5df4 : ca __ __ DEX
5df5 : 10 f8 __ BPL $5def ; (draw_ball.s1 + 2)
.s4:
5df7 : ad f0 bf LDA $bff0 ; (sstack + 6)
5dfa : 30 09 __ BMI $5e05 ; (draw_ball.s82 + 0)
.s84:
5dfc : d0 11 __ BNE $5e0f ; (draw_ball.s5 + 0)
.s83:
5dfe : ad ef bf LDA $bfef ; (sstack + 5)
5e01 : c9 03 __ CMP #$03
5e03 : b0 0a __ BCS $5e0f ; (draw_ball.s5 + 0)
.s82:
5e05 : a9 03 __ LDA #$03
5e07 : 8d ef bf STA $bfef ; (sstack + 5)
5e0a : a9 00 __ LDA #$00
5e0c : 8d f0 bf STA $bff0 ; (sstack + 6)
.s5:
5e0f : ad ef bf LDA $bfef ; (sstack + 5)
5e12 : 85 5d __ STA T9 + 0 
5e14 : 0a __ __ ASL
5e15 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5e17 : ad f0 bf LDA $bff0 ; (sstack + 6)
5e1a : 85 5e __ STA T9 + 1 
5e1c : 2a __ __ ROL
5e1d : 06 1b __ ASL ACCU + 0 ; (cy + 0)
5e1f : 2a __ __ ROL
5e20 : aa __ __ TAX
5e21 : 18 __ __ CLC
5e22 : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5e24 : 65 5d __ ADC T9 + 0 
5e26 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5e28 : 8a __ __ TXA
5e29 : 65 5e __ ADC T9 + 1 
5e2b : 85 1c __ STA ACCU + 1 ; (cy + 1)
5e2d : a9 00 __ LDA #$00
5e2f : 85 04 __ STA WORK + 1 
5e31 : 20 37 80 JSR $8037 ; (divs16@proxy + 0)
5e34 : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5e36 : 85 5f __ STA T10 + 0 
5e38 : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5e3a : 85 60 __ STA T10 + 1 
5e3c : 38 __ __ SEC
5e3d : a9 00 __ LDA #$00
5e3f : e5 1b __ SBC ACCU + 0 ; (cy + 0)
5e41 : 85 61 __ STA T11 + 0 
5e43 : a9 00 __ LDA #$00
5e45 : 85 04 __ STA WORK + 1 
5e47 : e5 1c __ SBC ACCU + 1 ; (cy + 1)
5e49 : 85 62 __ STA T11 + 1 
5e4b : a5 5d __ LDA T9 + 0 
5e4d : 0a __ __ ASL
5e4e : 85 1b __ STA ACCU + 0 ; (cy + 0)
5e50 : a5 5e __ LDA T9 + 1 
5e52 : 2a __ __ ROL
5e53 : 06 1b __ ASL ACCU + 0 ; (cy + 0)
5e55 : 2a __ __ ROL
5e56 : 06 1b __ ASL ACCU + 0 ; (cy + 0)
5e58 : 2a __ __ ROL
5e59 : aa __ __ TAX
5e5a : 18 __ __ CLC
5e5b : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5e5d : 65 5d __ ADC T9 + 0 
5e5f : 85 1b __ STA ACCU + 0 ; (cy + 0)
5e61 : 8a __ __ TXA
5e62 : 65 5e __ ADC T9 + 1 
5e64 : 85 1c __ STA ACCU + 1 ; (cy + 1)
5e66 : 20 37 80 JSR $8037 ; (divs16@proxy + 0)
5e69 : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5e6b : 85 63 __ STA T12 + 0 
5e6d : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5e6f : 85 64 __ STA T12 + 1 
5e71 : 38 __ __ SEC
5e72 : a9 00 __ LDA #$00
5e74 : e5 1b __ SBC ACCU + 0 ; (cy + 0)
5e76 : 85 65 __ STA T13 + 0 
5e78 : a9 00 __ LDA #$00
5e7a : e5 1c __ SBC ACCU + 1 ; (cy + 1)
5e7c : 85 66 __ STA T13 + 1 
5e7e : a5 5d __ LDA T9 + 0 
5e80 : 85 03 __ STA WORK + 0 
5e82 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5e84 : a5 5e __ LDA T9 + 1 
5e86 : 85 04 __ STA WORK + 1 
5e88 : 85 1c __ STA ACCU + 1 ; (cy + 1)
5e8a : 20 d4 7b JSR $7bd4 ; (mul16 + 0)
5e8d : a5 05 __ LDA WORK + 2 
5e8f : 85 67 __ STA T14 + 0 
5e91 : a5 06 __ LDA WORK + 3 
5e93 : 85 68 __ STA T14 + 1 
5e95 : 38 __ __ SEC
5e96 : a9 00 __ LDA #$00
5e98 : e5 5d __ SBC T9 + 0 
5e9a : 85 69 __ STA T15 + 0 
5e9c : a9 00 __ LDA #$00
5e9e : e5 5e __ SBC T9 + 1 
5ea0 : 85 6a __ STA T15 + 1 
5ea2 : a5 5e __ LDA T9 + 1 
5ea4 : c5 6a __ CMP T15 + 1 
5ea6 : d0 09 __ BNE $5eb1 ; (draw_ball.s10 + 0)
.s7:
5ea8 : a5 5d __ LDA T9 + 0 
5eaa : c5 69 __ CMP T15 + 0 
.s8:
5eac : a9 00 __ LDA #$00
5eae : 2a __ __ ROL
5eaf : 90 09 __ BCC $5eba ; (draw_ball.s6 + 0)
.s10:
5eb1 : 45 6a __ EOR T15 + 1 
5eb3 : 10 f7 __ BPL $5eac ; (draw_ball.s8 + 0)
.s9:
5eb5 : a9 00 __ LDA #$00
5eb7 : 2a __ __ ROL
5eb8 : 49 01 __ EOR #$01
.s6:
5eba : 85 6f __ STA T20 + 0 
5ebc : d0 03 __ BNE $5ec1 ; (draw_ball.s32 + 0)
5ebe : 4c c0 60 JMP $60c0 ; (draw_ball.s11 + 0)
.s32:
5ec1 : ad ec bf LDA $bfec ; (sstack + 2)
5ec4 : 18 __ __ CLC
5ec5 : 65 69 __ ADC T15 + 0 
5ec7 : 85 6b __ STA T16 + 0 
5ec9 : a5 69 __ LDA T15 + 0 
5ecb : 85 6d __ STA T17 + 0 
5ecd : a5 6a __ LDA T15 + 1 
5ecf : 85 6e __ STA T17 + 1 
5ed1 : 6d ed bf ADC $bfed ; (sstack + 3)
5ed4 : 85 6c __ STA T16 + 1 
5ed6 : f0 03 __ BEQ $5edb ; (draw_ball.l81 + 0)
5ed8 : 4c 99 60 JMP $6099 ; (draw_ball.l50 + 0)
.l81:
5edb : a5 6b __ LDA T16 + 0 
5edd : c9 c8 __ CMP #$c8
5edf : b0 f7 __ BCS $5ed8 ; (draw_ball.s32 + 23)
.s34:
5ee1 : a5 6d __ LDA T17 + 0 
5ee3 : 85 03 __ STA WORK + 0 
5ee5 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5ee7 : a5 6e __ LDA T17 + 1 
5ee9 : 85 04 __ STA WORK + 1 
5eeb : 85 1c __ STA ACCU + 1 ; (cy + 1)
5eed : 20 d4 7b JSR $7bd4 ; (mul16 + 0)
5ef0 : 38 __ __ SEC
5ef1 : a5 67 __ LDA T14 + 0 
5ef3 : e5 05 __ SBC WORK + 2 
5ef5 : 85 0d __ STA P0 
5ef7 : a5 68 __ LDA T14 + 1 
5ef9 : e5 06 __ SBC WORK + 3 
5efb : 30 db __ BMI $5ed8 ; (draw_ball.s32 + 23)
.s80:
5efd : 85 0e __ STA P1 
5eff : 05 0d __ ORA P0 
5f01 : f0 d5 __ BEQ $5ed8 ; (draw_ball.s32 + 23)
.s35:
5f03 : 20 93 5d JSR $5d93 ; (mc_isqrt.s4 + 0)
5f06 : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5f08 : 85 43 __ STA T0 + 0 
5f0a : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5f0c : 85 44 __ STA T0 + 1 
5f0e : a5 6e __ LDA T17 + 1 
5f10 : c5 66 __ CMP T13 + 1 
5f12 : d0 08 __ BNE $5f1c ; (draw_ball.s79 + 0)
.s76:
5f14 : a5 6d __ LDA T17 + 0 
5f16 : c5 65 __ CMP T13 + 0 
.s77:
5f18 : 90 08 __ BCC $5f22 ; (draw_ball.s75 + 0)
5f1a : b0 1e __ BCS $5f3a ; (draw_ball.s36 + 0)
.s79:
5f1c : 45 66 __ EOR T13 + 1 
5f1e : 10 f8 __ BPL $5f18 ; (draw_ball.s77 + 0)
.s78:
5f20 : 90 18 __ BCC $5f3a ; (draw_ball.s36 + 0)
.s75:
5f22 : a9 00 __ LDA #$00
.s41:
5f24 : 85 47 __ STA T18 + 0 
5f26 : ad ea bf LDA $bfea ; (sstack + 0)
5f29 : 85 53 __ STA T3 + 0 
5f2b : a9 00 __ LDA #$00
5f2d : 85 51 __ STA T2 + 0 
5f2f : ad eb bf LDA $bfeb ; (sstack + 1)
5f32 : 85 54 __ STA T3 + 1 
5f34 : ad ee bf LDA $bfee ; (sstack + 4)
5f37 : 4c 86 5f JMP $5f86 ; (draw_ball.l86 + 0)
.s36:
5f3a : a5 6e __ LDA T17 + 1 
5f3c : c5 62 __ CMP T11 + 1 
5f3e : d0 08 __ BNE $5f48 ; (draw_ball.s74 + 0)
.s71:
5f40 : a5 6d __ LDA T17 + 0 
5f42 : c5 61 __ CMP T11 + 0 
.s72:
5f44 : 90 08 __ BCC $5f4e ; (draw_ball.s70 + 0)
5f46 : b0 0a __ BCS $5f52 ; (draw_ball.s37 + 0)
.s74:
5f48 : 45 62 __ EOR T11 + 1 
5f4a : 10 f8 __ BPL $5f44 ; (draw_ball.s72 + 0)
.s73:
5f4c : 90 04 __ BCC $5f52 ; (draw_ball.s37 + 0)
.s70:
5f4e : a9 01 __ LDA #$01
5f50 : d0 d2 __ BNE $5f24 ; (draw_ball.s41 + 0)
.s37:
5f52 : 24 6e __ BIT T17 + 1 
5f54 : 10 04 __ BPL $5f5a ; (draw_ball.s38 + 0)
.s69:
5f56 : a9 02 __ LDA #$02
5f58 : d0 ca __ BNE $5f24 ; (draw_ball.s41 + 0)
.s38:
5f5a : 24 60 __ BIT T10 + 1 
5f5c : 30 10 __ BMI $5f6e ; (draw_ball.s39 + 0)
.s68:
5f5e : a5 6e __ LDA T17 + 1 
5f60 : c5 60 __ CMP T10 + 1 
5f62 : d0 04 __ BNE $5f68 ; (draw_ball.s67 + 0)
.s66:
5f64 : a5 6d __ LDA T17 + 0 
5f66 : c5 5f __ CMP T10 + 0 
.s67:
5f68 : b0 04 __ BCS $5f6e ; (draw_ball.s39 + 0)
.s65:
5f6a : a9 03 __ LDA #$03
5f6c : 90 b6 __ BCC $5f24 ; (draw_ball.s41 + 0)
.s39:
5f6e : 24 64 __ BIT T12 + 1 
5f70 : 30 10 __ BMI $5f82 ; (draw_ball.s40 + 0)
.s64:
5f72 : a5 6e __ LDA T17 + 1 
5f74 : c5 64 __ CMP T12 + 1 
5f76 : d0 04 __ BNE $5f7c ; (draw_ball.s63 + 0)
.s62:
5f78 : a5 6d __ LDA T17 + 0 
5f7a : c5 63 __ CMP T12 + 0 
.s63:
5f7c : b0 04 __ BCS $5f82 ; (draw_ball.s40 + 0)
.s61:
5f7e : a9 04 __ LDA #$04
5f80 : 90 a2 __ BCC $5f24 ; (draw_ball.s41 + 0)
.s40:
5f82 : a9 05 __ LDA #$05
5f84 : d0 9e __ BNE $5f24 ; (draw_ball.s41 + 0)
.l86:
5f86 : 85 4f __ STA T1 + 0 
5f88 : 18 __ __ CLC
5f89 : 69 10 __ ADC #$10
5f8b : 29 3f __ AND #$3f
5f8d : aa __ __ TAX
5f8e : bd 08 84 LDA $8408,x ; (sin64[0] + 0)
5f91 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5f93 : 29 80 __ AND #$80
5f95 : 10 02 __ BPL $5f99 ; (draw_ball.l86 + 19)
5f97 : a9 ff __ LDA #$ff
5f99 : 85 1c __ STA ACCU + 1 ; (cy + 1)
5f9b : a5 43 __ LDA T0 + 0 
5f9d : 85 03 __ STA WORK + 0 
5f9f : a5 44 __ LDA T0 + 1 
5fa1 : 85 04 __ STA WORK + 1 
5fa3 : 20 d4 7b JSR $7bd4 ; (mul16 + 0)
5fa6 : 20 24 80 JSR $8024 ; (divs16@proxy + 0)
5fa9 : 18 __ __ CLC
5faa : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5fac : 65 53 __ ADC T3 + 0 
5fae : a6 51 __ LDX T2 + 0 
5fb0 : e8 __ __ INX
5fb1 : e8 __ __ INX
5fb2 : 86 51 __ STX T2 + 0 
5fb4 : 9d e4 8a STA $8ae4,x ; (mod_row_buf[0] + 14)
5fb7 : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5fb9 : 65 54 __ ADC T3 + 1 
5fbb : 9d e5 8a STA $8ae5,x ; (mod_row_buf[0] + 15)
5fbe : 18 __ __ CLC
5fbf : a5 4f __ LDA T1 + 0 
5fc1 : 69 10 __ ADC #$10
5fc3 : e0 08 __ CPX #$08
5fc5 : d0 bf __ BNE $5f86 ; (draw_ball.l86 + 0)
.s42:
5fc7 : a9 00 __ LDA #$00
5fc9 : 85 4f __ STA T1 + 0 
.l43:
5fcb : a4 4f __ LDY T1 + 0 
5fcd : c8 __ __ INY
5fce : 84 55 __ STY T4 + 0 
5fd0 : 0a __ __ ASL
5fd1 : 85 57 __ STA T5 + 0 
.l85:
5fd3 : a5 55 __ LDA T4 + 0 
5fd5 : 0a __ __ ASL
5fd6 : 85 59 __ STA T6 + 0 
5fd8 : aa __ __ TAX
5fd9 : bd e6 8a LDA $8ae6,x ; (mx[0] + 0)
5fdc : 85 5b __ STA T7 + 0 
5fde : bd e7 8a LDA $8ae7,x ; (mx[0] + 1)
5fe1 : 85 5c __ STA T7 + 1 
5fe3 : a6 57 __ LDX T5 + 0 
5fe5 : bd e6 8a LDA $8ae6,x ; (mx[0] + 0)
5fe8 : 85 45 __ STA T8 + 0 
5fea : bd e7 8a LDA $8ae7,x ; (mx[0] + 1)
5fed : 85 46 __ STA T8 + 1 
5fef : a5 5c __ LDA T7 + 1 
5ff1 : c5 46 __ CMP T8 + 1 
5ff3 : d0 08 __ BNE $5ffd ; (draw_ball.s60 + 0)
.s57:
5ff5 : a5 5b __ LDA T7 + 0 
5ff7 : c5 45 __ CMP T8 + 0 
.s58:
5ff9 : 90 08 __ BCC $6003 ; (draw_ball.s56 + 0)
5ffb : b0 1c __ BCS $6019 ; (draw_ball.s44 + 0)
.s60:
5ffd : 45 46 __ EOR T8 + 1 
5fff : 10 f8 __ BPL $5ff9 ; (draw_ball.s58 + 0)
.s59:
6001 : 90 16 __ BCC $6019 ; (draw_ball.s44 + 0)
.s56:
6003 : a5 5b __ LDA T7 + 0 
6005 : 9d e6 8a STA $8ae6,x ; (mx[0] + 0)
6008 : a5 5c __ LDA T7 + 1 
600a : 9d e7 8a STA $8ae7,x ; (mx[0] + 1)
600d : a5 45 __ LDA T8 + 0 
600f : a6 59 __ LDX T6 + 0 
6011 : 9d e6 8a STA $8ae6,x ; (mx[0] + 0)
6014 : a5 46 __ LDA T8 + 1 
6016 : 9d e7 8a STA $8ae7,x ; (mx[0] + 1)
.s44:
6019 : e6 55 __ INC T4 + 0 
601b : c8 __ __ INY
601c : c0 04 __ CPY #$04
601e : 90 b3 __ BCC $5fd3 ; (draw_ball.l85 + 0)
.s45:
6020 : e6 4f __ INC T1 + 0 
6022 : a5 4f __ LDA T1 + 0 
6024 : c9 03 __ CMP #$03
6026 : d0 a3 __ BNE $5fcb ; (draw_ball.l43 + 0)
.s46:
6028 : a5 53 __ LDA T3 + 0 
602a : e5 43 __ SBC T0 + 0 
602c : 85 4f __ STA T1 + 0 
602e : a5 54 __ LDA T3 + 1 
6030 : e5 44 __ SBC T0 + 1 
6032 : 85 50 __ STA T1 + 1 
6034 : 18 __ __ CLC
6035 : a5 53 __ LDA T3 + 0 
6037 : 65 43 __ ADC T0 + 0 
6039 : 85 51 __ STA T2 + 0 
603b : a5 54 __ LDA T3 + 1 
603d : 65 44 __ ADC T0 + 1 
603f : 85 52 __ STA T2 + 1 
6041 : a5 47 __ LDA T18 + 0 
6043 : 85 53 __ STA T3 + 0 
6045 : a9 00 __ LDA #$00
6047 : 85 57 __ STA T5 + 0 
6049 : 85 55 __ STA T4 + 0 
604b : 85 13 __ STA P6 
604d : a5 6b __ LDA T16 + 0 
604f : 85 12 __ STA P5 
.l47:
6051 : a5 4f __ LDA T1 + 0 
6053 : 85 14 __ STA P7 
6055 : a5 50 __ LDA T1 + 1 
6057 : 85 15 __ STA P8 
6059 : a5 57 __ LDA T5 + 0 
605b : c9 04 __ CMP #$04
605d : b0 0a __ BCS $6069 ; (draw_ball.s48 + 0)
.s55:
605f : a4 55 __ LDY T4 + 0 
6061 : b9 e7 8a LDA $8ae7,y ; (mx[0] + 1)
6064 : be e6 8a LDX $8ae6,y ; (mx[0] + 0)
6067 : 90 04 __ BCC $606d ; (draw_ball.s49 + 0)
.s48:
6069 : a5 52 __ LDA T2 + 1 
606b : a6 51 __ LDX T2 + 0 
.s49:
606d : 86 16 __ STX P9 
606f : 85 17 __ STA P10 
6071 : 8a __ __ TXA
6072 : 18 __ __ CLC
6073 : 69 01 __ ADC #$01
6075 : 85 4f __ STA T1 + 0 
6077 : a5 17 __ LDA P10 
6079 : 69 00 __ ADC #$00
607b : 85 50 __ STA T1 + 1 
607d : a5 53 __ LDA T3 + 0 
607f : 4a __ __ LSR
6080 : a9 02 __ LDA #$02
6082 : b0 02 __ BCS $6086 ; (draw_ball.s96 + 0)
.s95:
6084 : a9 01 __ LDA #$01
.s96:
6086 : 85 18 __ STA P11 
6088 : 20 48 62 JSR $6248 ; (mc_hspan.s4 + 0)
608b : e6 53 __ INC T3 + 0 
608d : e6 55 __ INC T4 + 0 
608f : e6 55 __ INC T4 + 0 
6091 : e6 57 __ INC T5 + 0 
6093 : a5 57 __ LDA T5 + 0 
6095 : c9 05 __ CMP #$05
6097 : 90 b8 __ BCC $6051 ; (draw_ball.l47 + 0)
.l50:
6099 : e6 6b __ INC T16 + 0 
609b : d0 02 __ BNE $609f ; (draw_ball.s88 + 0)
.s87:
609d : e6 6c __ INC T16 + 1 
.s88:
609f : e6 6d __ INC T17 + 0 
60a1 : d0 02 __ BNE $60a5 ; (draw_ball.s90 + 0)
.s89:
60a3 : e6 6e __ INC T17 + 1 
.s90:
60a5 : a5 5e __ LDA T9 + 1 
60a7 : c5 6e __ CMP T17 + 1 
60a9 : d0 08 __ BNE $60b3 ; (draw_ball.s54 + 0)
.s51:
60ab : a5 5d __ LDA T9 + 0 
60ad : c5 6d __ CMP T17 + 0 
.s52:
60af : b0 08 __ BCS $60b9 ; (draw_ball.s33 + 0)
60b1 : 90 0d __ BCC $60c0 ; (draw_ball.s11 + 0)
.s54:
60b3 : 45 6e __ EOR T17 + 1 
60b5 : 10 f8 __ BPL $60af ; (draw_ball.s52 + 0)
.s53:
60b7 : b0 07 __ BCS $60c0 ; (draw_ball.s11 + 0)
.s33:
60b9 : a5 6c __ LDA T16 + 1 
60bb : d0 dc __ BNE $6099 ; (draw_ball.l50 + 0)
60bd : 4c db 5e JMP $5edb ; (draw_ball.l81 + 0)
.s11:
60c0 : a5 65 __ LDA T13 + 0 
60c2 : 8d e0 bf STA $bfe0 ; (lats[0] + 0)
60c5 : a5 66 __ LDA T13 + 1 
60c7 : 8d e1 bf STA $bfe1 ; (lats[0] + 1)
60ca : a5 61 __ LDA T11 + 0 
60cc : 8d e2 bf STA $bfe2 ; (lats[0] + 2)
60cf : a5 62 __ LDA T11 + 1 
60d1 : 8d e3 bf STA $bfe3 ; (lats[0] + 3)
60d4 : a9 00 __ LDA #$00
60d6 : 8d e4 bf STA $bfe4 ; (lats[0] + 4)
60d9 : 8d e5 bf STA $bfe5 ; (lats[0] + 5)
60dc : 85 53 __ STA T3 + 0 
60de : a6 5f __ LDX T10 + 0 
60e0 : 8e e6 bf STX $bfe6 ; (lats[0] + 6)
60e3 : a6 60 __ LDX T10 + 1 
60e5 : 8e e7 bf STX $bfe7 ; (lats[0] + 7)
60e8 : a6 63 __ LDX T12 + 0 
60ea : 8e e8 bf STX $bfe8 ; (lats[0] + 8)
60ed : a6 64 __ LDX T12 + 1 
60ef : 8e e9 bf STX $bfe9 ; (lats[0] + 9)
60f2 : ae ec bf LDX $bfec ; (sstack + 2)
60f5 : 86 55 __ STX T4 + 0 
60f7 : ae ed bf LDX $bfed ; (sstack + 3)
60fa : 86 56 __ STX T4 + 1 
.l12:
60fc : 0a __ __ ASL
60fd : a8 __ __ TAY
60fe : b9 e0 bf LDA $bfe0,y ; (lats[0] + 0)
6101 : 18 __ __ CLC
6102 : 65 55 __ ADC T4 + 0 
6104 : 85 4f __ STA T1 + 0 
6106 : b9 e1 bf LDA $bfe1,y ; (lats[0] + 1)
6109 : 65 56 __ ADC T4 + 1 
610b : d0 58 __ BNE $6165 ; (draw_ball.s15 + 0)
.s31:
610d : a5 4f __ LDA T1 + 0 
610f : c9 c8 __ CMP #$c8
6111 : b0 52 __ BCS $6165 ; (draw_ball.s15 + 0)
.s13:
6113 : b9 e0 bf LDA $bfe0,y ; (lats[0] + 0)
6116 : 85 1b __ STA ACCU + 0 ; (cy + 0)
6118 : 85 03 __ STA WORK + 0 
611a : b9 e1 bf LDA $bfe1,y ; (lats[0] + 1)
611d : 85 1c __ STA ACCU + 1 ; (cy + 1)
611f : 85 04 __ STA WORK + 1 
6121 : 20 d4 7b JSR $7bd4 ; (mul16 + 0)
6124 : 38 __ __ SEC
6125 : a5 67 __ LDA T14 + 0 
6127 : e5 05 __ SBC WORK + 2 
6129 : 85 0d __ STA P0 
612b : a5 68 __ LDA T14 + 1 
612d : e5 06 __ SBC WORK + 3 
612f : 30 34 __ BMI $6165 ; (draw_ball.s15 + 0)
.s30:
6131 : 85 0e __ STA P1 
6133 : 05 0d __ ORA P0 
6135 : f0 2e __ BEQ $6165 ; (draw_ball.s15 + 0)
.s14:
6137 : 20 93 5d JSR $5d93 ; (mc_isqrt.s4 + 0)
613a : a5 4f __ LDA T1 + 0 
613c : 85 12 __ STA P5 
613e : a9 00 __ LDA #$00
6140 : 85 13 __ STA P6 
6142 : 85 18 __ STA P11 
6144 : ad ea bf LDA $bfea ; (sstack + 0)
6147 : 18 __ __ CLC
6148 : 65 1b __ ADC ACCU + 0 ; (cy + 0)
614a : 85 16 __ STA P9 
614c : ad eb bf LDA $bfeb ; (sstack + 1)
614f : 65 1c __ ADC ACCU + 1 ; (cy + 1)
6151 : 85 17 __ STA P10 
6153 : ad ea bf LDA $bfea ; (sstack + 0)
6156 : 38 __ __ SEC
6157 : e5 1b __ SBC ACCU + 0 ; (cy + 0)
6159 : 85 14 __ STA P7 
615b : ad eb bf LDA $bfeb ; (sstack + 1)
615e : e5 1c __ SBC ACCU + 1 ; (cy + 1)
6160 : 85 15 __ STA P8 
6162 : 20 48 62 JSR $6248 ; (mc_hspan.s4 + 0)
.s15:
6165 : e6 53 __ INC T3 + 0 
6167 : a5 53 __ LDA T3 + 0 
6169 : c9 05 __ CMP #$05
616b : d0 8f __ BNE $60fc ; (draw_ball.l12 + 0)
.s16:
616d : a5 6f __ LDA T20 + 0 
616f : d0 0b __ BNE $617c ; (draw_ball.s17 + 0)
.s3:
6171 : a2 1c __ LDX #$1c
6173 : bd c3 bf LDA $bfc3,x ; (draw_ball@stack + 0)
6176 : 95 53 __ STA T3 + 0,x 
6178 : ca __ __ DEX
6179 : 10 f8 __ BPL $6173 ; (draw_ball.s3 + 2)
617b : 60 __ __ RTS
.s17:
617c : ad ee bf LDA $bfee ; (sstack + 4)
617f : 85 51 __ STA T2 + 0 
6181 : a9 04 __ LDA #$04
6183 : 85 5b __ STA T7 + 0 
.l18:
6185 : 18 __ __ CLC
6186 : a5 55 __ LDA T4 + 0 
6188 : 65 69 __ ADC T15 + 0 
618a : 85 53 __ STA T3 + 0 
618c : a5 56 __ LDA T4 + 1 
618e : 65 6a __ ADC T15 + 1 
6190 : 85 54 __ STA T3 + 1 
6192 : a5 69 __ LDA T15 + 0 
6194 : 85 57 __ STA T5 + 0 
6196 : a5 6a __ LDA T15 + 1 
6198 : 85 58 __ STA T5 + 1 
619a : 18 __ __ CLC
619b : a5 51 __ LDA T2 + 0 
619d : 69 10 __ ADC #$10
619f : 29 3f __ AND #$3f
61a1 : aa __ __ TAX
61a2 : bd 08 84 LDA $8408,x ; (sin64[0] + 0)
61a5 : 85 59 __ STA T6 + 0 
61a7 : 29 80 __ AND #$80
61a9 : 10 02 __ BPL $61ad ; (draw_ball.l18 + 40)
61ab : a9 ff __ LDA #$ff
61ad : 85 5a __ STA T6 + 1 
61af : a5 54 __ LDA T3 + 1 
61b1 : d0 5d __ BNE $6210 ; (draw_ball.l22 + 0)
.l29:
61b3 : a5 53 __ LDA T3 + 0 
61b5 : c9 c8 __ CMP #$c8
61b7 : b0 57 __ BCS $6210 ; (draw_ball.l22 + 0)
.s20:
61b9 : a5 57 __ LDA T5 + 0 
61bb : 85 03 __ STA WORK + 0 
61bd : 85 1b __ STA ACCU + 0 ; (cy + 0)
61bf : a5 58 __ LDA T5 + 1 
61c1 : 85 04 __ STA WORK + 1 
61c3 : 85 1c __ STA ACCU + 1 ; (cy + 1)
61c5 : 20 d4 7b JSR $7bd4 ; (mul16 + 0)
61c8 : 38 __ __ SEC
61c9 : a5 67 __ LDA T14 + 0 
61cb : e5 05 __ SBC WORK + 2 
61cd : 85 0d __ STA P0 
61cf : a5 68 __ LDA T14 + 1 
61d1 : e5 06 __ SBC WORK + 3 
61d3 : 30 3b __ BMI $6210 ; (draw_ball.l22 + 0)
.s28:
61d5 : 85 0e __ STA P1 
61d7 : 05 0d __ ORA P0 
61d9 : f0 35 __ BEQ $6210 ; (draw_ball.l22 + 0)
.s21:
61db : 20 93 5d JSR $5d93 ; (mc_isqrt.s4 + 0)
61de : a5 1b __ LDA ACCU + 0 ; (cy + 0)
61e0 : 85 03 __ STA WORK + 0 
61e2 : a5 1c __ LDA ACCU + 1 ; (cy + 1)
61e4 : 85 04 __ STA WORK + 1 
61e6 : a5 53 __ LDA T3 + 0 
61e8 : 85 0f __ STA P2 
61ea : a9 00 __ LDA #$00
61ec : 85 10 __ STA P3 
61ee : 85 11 __ STA P4 
61f0 : a5 59 __ LDA T6 + 0 
61f2 : 85 1b __ STA ACCU + 0 ; (cy + 0)
61f4 : a5 5a __ LDA T6 + 1 
61f6 : 85 1c __ STA ACCU + 1 ; (cy + 1)
61f8 : 20 d4 7b JSR $7bd4 ; (mul16 + 0)
61fb : 20 24 80 JSR $8024 ; (divs16@proxy + 0)
61fe : ad ea bf LDA $bfea ; (sstack + 0)
6201 : 18 __ __ CLC
6202 : 65 1b __ ADC ACCU + 0 ; (cy + 0)
6204 : 85 0d __ STA P0 
6206 : ad eb bf LDA $bfeb ; (sstack + 1)
6209 : 65 1c __ ADC ACCU + 1 ; (cy + 1)
620b : 85 0e __ STA P1 
620d : 20 f1 5b JSR $5bf1 ; (mc_setpix.s4 + 0)
.l22:
6210 : e6 53 __ INC T3 + 0 
6212 : d0 02 __ BNE $6216 ; (draw_ball.s92 + 0)
.s91:
6214 : e6 54 __ INC T3 + 1 
.s92:
6216 : e6 57 __ INC T5 + 0 
6218 : d0 02 __ BNE $621c ; (draw_ball.s94 + 0)
.s93:
621a : e6 58 __ INC T5 + 1 
.s94:
621c : a5 5e __ LDA T9 + 1 
621e : c5 58 __ CMP T5 + 1 
6220 : d0 08 __ BNE $622a ; (draw_ball.s27 + 0)
.s24:
6222 : a5 5d __ LDA T9 + 0 
6224 : c5 57 __ CMP T5 + 0 
.s25:
6226 : 90 08 __ BCC $6230 ; (draw_ball.s23 + 0)
6228 : b0 17 __ BCS $6241 ; (draw_ball.s19 + 0)
.s27:
622a : 45 58 __ EOR T5 + 1 
622c : 10 f8 __ BPL $6226 ; (draw_ball.s25 + 0)
.s26:
622e : 90 11 __ BCC $6241 ; (draw_ball.s19 + 0)
.s23:
6230 : 18 __ __ CLC
6231 : a5 51 __ LDA T2 + 0 
6233 : 69 10 __ ADC #$10
6235 : 85 51 __ STA T2 + 0 
6237 : c6 5b __ DEC T7 + 0 
6239 : f0 03 __ BEQ $623e ; (draw_ball.s23 + 14)
623b : 4c 85 61 JMP $6185 ; (draw_ball.l18 + 0)
623e : 4c 71 61 JMP $6171 ; (draw_ball.s3 + 0)
.s19:
6241 : a5 54 __ LDA T3 + 1 
6243 : d0 cb __ BNE $6210 ; (draw_ball.l22 + 0)
6245 : 4c b3 61 JMP $61b3 ; (draw_ball.l29 + 0)
--------------------------------------------------------------------
mc_hspan: ; mc_hspan(i16,i16,i16,u8)->void
;  65, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
6248 : a5 13 __ LDA P6 ; (my + 1)
624a : f0 01 __ BEQ $624d ; (mc_hspan.s39 + 0)
624c : 60 __ __ RTS
.s39:
624d : a5 12 __ LDA P5 ; (my + 0)
624f : c9 c8 __ CMP #$c8
6251 : 90 01 __ BCC $6254 ; (mc_hspan.s5 + 0)
6253 : 60 __ __ RTS
.s5:
6254 : 24 15 __ BIT P8 ; (x0 + 1)
6256 : 10 08 __ BPL $6260 ; (mc_hspan.s49 + 0)
.s38:
6258 : a9 00 __ LDA #$00
625a : 85 14 __ STA P7 ; (x0 + 0)
625c : 85 15 __ STA P8 ; (x0 + 1)
625e : 90 02 __ BCC $6262 ; (mc_hspan.s6 + 0)
.s49:
6260 : a5 14 __ LDA P7 ; (x0 + 0)
.s6:
6262 : 85 46 __ STA T4 + 0 
6264 : a6 15 __ LDX P8 ; (x0 + 1)
6266 : a5 17 __ LDA P10 ; (x1 + 1)
6268 : 10 01 __ BPL $626b ; (mc_hspan.s37 + 0)
626a : 60 __ __ RTS
.s37:
626b : 86 47 __ STX T4 + 1 
626d : d0 09 __ BNE $6278 ; (mc_hspan.s34 + 0)
.s36:
626f : a5 16 __ LDA P9 ; (x1 + 0)
6271 : c9 a0 __ CMP #$a0
6273 : b0 03 __ BCS $6278 ; (mc_hspan.s34 + 0)
6275 : 4c e0 63 JMP $63e0 ; (mc_hspan.s7 + 0)
.s34:
6278 : a9 9f __ LDA #$9f
627a : 85 16 __ STA P9 ; (x1 + 0)
627c : a9 00 __ LDA #$00
627e : 85 17 __ STA P10 ; (x1 + 1)
6280 : 8a __ __ TXA
6281 : f0 01 __ BEQ $6284 ; (mc_hspan.s35 + 0)
6283 : 60 __ __ RTS
.s35:
6284 : a5 14 __ LDA P7 ; (x0 + 0)
6286 : c9 a0 __ CMP #$a0
6288 : 90 01 __ BCC $628b ; (mc_hspan.s8 + 0)
628a : 60 __ __ RTS
.s8:
628b : a5 16 __ LDA P9 ; (x1 + 0)
628d : 85 4a __ STA T6 + 0 
628f : 85 48 __ STA T5 + 0 
6291 : a5 14 __ LDA P7 ; (x0 + 0)
6293 : 4a __ __ LSR
6294 : 4a __ __ LSR
6295 : 85 4c __ STA T7 + 0 
6297 : a5 17 __ LDA P10 ; (x1 + 1)
6299 : 85 49 __ STA T5 + 1 
629b : 4a __ __ LSR
629c : 66 4a __ ROR T6 + 0 
629e : 4a __ __ LSR
629f : 66 4a __ ROR T6 + 0 
62a1 : 49 20 __ EOR #$20
62a3 : 38 __ __ SEC
62a4 : e9 20 __ SBC #$20
62a6 : 85 4b __ STA T6 + 1 
62a8 : d0 09 __ BNE $62b3 ; (mc_hspan.s9 + 0)
.s31:
62aa : a5 4c __ LDA T7 + 0 
62ac : c5 4a __ CMP T6 + 0 
62ae : d0 03 __ BNE $62b3 ; (mc_hspan.s9 + 0)
62b0 : 4c b1 63 JMP $63b1 ; (mc_hspan.s26 + 0)
.s9:
62b3 : a5 12 __ LDA P5 ; (my + 0)
62b5 : 85 0f __ STA P2 
62b7 : 29 07 __ AND #$07
62b9 : 85 1b __ STA ACCU + 0 
62bb : a5 12 __ LDA P5 ; (my + 0)
62bd : 4a __ __ LSR
62be : 4a __ __ LSR
62bf : 4a __ __ LSR
62c0 : 85 43 __ STA T1 + 0 
62c2 : 0a __ __ ASL
62c3 : 0a __ __ ASL
62c4 : 65 43 __ ADC T1 + 0 
62c6 : 4a __ __ LSR
62c7 : 6a __ __ ROR
62c8 : aa __ __ TAX
62c9 : 29 80 __ AND #$80
62cb : 6a __ __ ROR
62cc : 05 1b __ ORA ACCU + 0 
62ce : 85 4d __ STA T8 + 0 
62d0 : 8a __ __ TXA
62d1 : 29 3f __ AND #$3f
62d3 : 69 e0 __ ADC #$e0
62d5 : 85 4e __ STA T8 + 1 
62d7 : a5 18 __ LDA P11 ; (col + 0)
62d9 : 85 1c __ STA ACCU + 1 
62db : 0a __ __ ASL
62dc : 0a __ __ ASL
62dd : 05 18 __ ORA P11 ; (col + 0)
62df : 85 43 __ STA T1 + 0 
62e1 : a5 18 __ LDA P11 ; (col + 0)
62e3 : 0a __ __ ASL
62e4 : 0a __ __ ASL
62e5 : 0a __ __ ASL
62e6 : 0a __ __ ASL
62e7 : 05 43 __ ORA T1 + 0 
62e9 : 85 43 __ STA T1 + 0 
62eb : a9 00 __ LDA #$00
62ed : 85 10 __ STA P3 
62ef : 46 1c __ LSR ACCU + 1 
62f1 : 6a __ __ ROR
62f2 : 66 1c __ ROR ACCU + 1 
62f4 : 6a __ __ ROR
62f5 : 05 43 __ ORA T1 + 0 
62f7 : 85 45 __ STA T2 + 0 
.l10:
62f9 : 20 e5 5b JSR $5be5 ; (mc_setpix@proxy + 0)
62fc : 18 __ __ CLC
62fd : a5 0d __ LDA P0 
62ff : 69 01 __ ADC #$01
6301 : 85 46 __ STA T4 + 0 
6303 : 85 1b __ STA ACCU + 0 
6305 : a5 0e __ LDA P1 
6307 : 69 00 __ ADC #$00
6309 : 85 47 __ STA T4 + 1 
630b : 4a __ __ LSR
630c : 66 1b __ ROR ACCU + 0 
630e : 4a __ __ LSR
630f : 66 1b __ ROR ACCU + 0 
6311 : 49 20 __ EOR #$20
6313 : c9 20 __ CMP #$20
6315 : d0 06 __ BNE $631d ; (mc_hspan.s11 + 0)
.s25:
6317 : a5 1b __ LDA ACCU + 0 
6319 : c5 4c __ CMP T7 + 0 
631b : f0 dc __ BEQ $62f9 ; (mc_hspan.l10 + 0)
.s11:
631d : a9 00 __ LDA #$00
631f : 85 1c __ STA ACCU + 1 
6321 : a6 4c __ LDX T7 + 0 
6323 : e8 __ __ INX
6324 : a5 4b __ LDA T6 + 1 
6326 : 30 43 __ BMI $636b ; (mc_hspan.s12 + 0)
.s24:
6328 : f0 04 __ BEQ $632e ; (mc_hspan.s23 + 0)
.s40:
632a : 8a __ __ TXA
632b : 4c 33 63 JMP $6333 ; (mc_hspan.s19 + 0)
.s23:
632e : 8a __ __ TXA
632f : e4 4a __ CPX T6 + 0 
6331 : b0 38 __ BCS $636b ; (mc_hspan.s12 + 0)
.s19:
6333 : 0a __ __ ASL
6334 : 0a __ __ ASL
6335 : 0a __ __ ASL
6336 : a0 00 __ LDY #$00
6338 : 90 02 __ BCC $633c ; (mc_hspan.s42 + 0)
.s41:
633a : c8 __ __ INY
633b : 18 __ __ CLC
.s42:
633c : 65 4d __ ADC T8 + 0 
633e : 85 43 __ STA T1 + 0 
6340 : 98 __ __ TYA
6341 : 65 4e __ ADC T8 + 1 
6343 : 85 44 __ STA T1 + 1 
.l20:
6345 : a5 45 __ LDA T2 + 0 
6347 : a0 00 __ LDY #$00
6349 : 91 43 __ STA (T1 + 0),y 
634b : 24 4b __ BIT T6 + 1 
634d : 30 1c __ BMI $636b ; (mc_hspan.s12 + 0)
.s22:
634f : e8 __ __ INX
6350 : d0 02 __ BNE $6354 ; (mc_hspan.s44 + 0)
.s43:
6352 : e6 1c __ INC ACCU + 1 
.s44:
6354 : 18 __ __ CLC
6355 : a5 43 __ LDA T1 + 0 
6357 : 69 08 __ ADC #$08
6359 : 85 43 __ STA T1 + 0 
635b : 90 02 __ BCC $635f ; (mc_hspan.s46 + 0)
.s45:
635d : e6 44 __ INC T1 + 1 
.s46:
635f : a5 1c __ LDA ACCU + 1 
6361 : c5 4b __ CMP T6 + 1 
6363 : 90 e0 __ BCC $6345 ; (mc_hspan.l20 + 0)
.s48:
6365 : d0 04 __ BNE $636b ; (mc_hspan.s12 + 0)
.s21:
6367 : e4 4a __ CPX T6 + 0 
6369 : 90 da __ BCC $6345 ; (mc_hspan.l20 + 0)
.s12:
636b : 06 4a __ ASL T6 + 0 
636d : 26 4b __ ROL T6 + 1 
636f : 06 4a __ ASL T6 + 0 
6371 : 26 4b __ ROL T6 + 1 
6373 : a9 00 __ LDA #$00
6375 : 85 10 __ STA P3 
6377 : f0 20 __ BEQ $6399 ; (mc_hspan.l13 + 0)
.s14:
6379 : a5 4a __ LDA T6 + 0 
637b : 85 0d __ STA P0 
637d : a5 4b __ LDA T6 + 1 
637f : 85 0e __ STA P1 
6381 : a5 12 __ LDA P5 ; (my + 0)
6383 : 85 0f __ STA P2 
6385 : a5 18 __ LDA P11 ; (col + 0)
6387 : 85 11 __ STA P4 
6389 : 20 f1 5b JSR $5bf1 ; (mc_setpix.s4 + 0)
638c : 18 __ __ CLC
638d : a5 0d __ LDA P0 
638f : 69 01 __ ADC #$01
6391 : 85 4a __ STA T6 + 0 
6393 : a5 0e __ LDA P1 
6395 : 69 00 __ ADC #$00
6397 : 85 4b __ STA T6 + 1 
.l13:
6399 : a5 49 __ LDA T5 + 1 
639b : c5 4b __ CMP T6 + 1 
639d : d0 07 __ BNE $63a6 ; (mc_hspan.s18 + 0)
.s15:
639f : a5 48 __ LDA T5 + 0 
63a1 : c5 4a __ CMP T6 + 0 
63a3 : 4c aa 63 JMP $63aa ; (mc_hspan.s16 + 0)
.s18:
63a6 : 45 4b __ EOR T6 + 1 
63a8 : 30 03 __ BMI $63ad ; (mc_hspan.s17 + 0)
.s16:
63aa : b0 cd __ BCS $6379 ; (mc_hspan.s14 + 0)
.s3:
63ac : 60 __ __ RTS
.s17:
63ad : b0 fd __ BCS $63ac ; (mc_hspan.s3 + 0)
63af : 90 c8 __ BCC $6379 ; (mc_hspan.s14 + 0)
.s26:
63b1 : a5 17 __ LDA P10 ; (x1 + 1)
63b3 : c5 15 __ CMP P8 ; (x0 + 1)
63b5 : d0 04 __ BNE $63bb ; (mc_hspan.l47 + 0)
.s28:
63b7 : a5 48 __ LDA T5 + 0 
63b9 : c5 46 __ CMP T4 + 0 
.l47:
63bb : 90 ef __ BCC $63ac ; (mc_hspan.s3 + 0)
.s50:
63bd : a9 00 __ LDA #$00
63bf : 85 10 __ STA P3 
63c1 : a5 12 __ LDA P5 ; (my + 0)
63c3 : 85 0f __ STA P2 
.l27:
63c5 : 20 e5 5b JSR $5be5 ; (mc_setpix@proxy + 0)
63c8 : 18 __ __ CLC
63c9 : a5 0d __ LDA P0 
63cb : 69 01 __ ADC #$01
63cd : 85 46 __ STA T4 + 0 
63cf : a5 0e __ LDA P1 
63d1 : 69 00 __ ADC #$00
63d3 : 85 47 __ STA T4 + 1 
63d5 : a5 49 __ LDA T5 + 1 
63d7 : 30 d3 __ BMI $63ac ; (mc_hspan.s3 + 0)
.s30:
63d9 : c5 47 __ CMP T4 + 1 
63db : f0 da __ BEQ $63b7 ; (mc_hspan.s28 + 0)
.s29:
63dd : b0 e6 __ BCS $63c5 ; (mc_hspan.l27 + 0)
63df : 60 __ __ RTS
.s7:
63e0 : a5 17 __ LDA P10 ; (x1 + 1)
63e2 : c5 15 __ CMP P8 ; (x0 + 1)
63e4 : d0 04 __ BNE $63ea ; (mc_hspan.s33 + 0)
.s32:
63e6 : a5 16 __ LDA P9 ; (x1 + 0)
63e8 : c5 14 __ CMP P7 ; (x0 + 0)
.s33:
63ea : 90 c0 __ BCC $63ac ; (mc_hspan.s3 + 0)
63ec : 4c 8b 62 JMP $628b ; (mc_hspan.s8 + 0)
--------------------------------------------------------------------
vectors_run: ; vectors_run()->void
;   3, "/home/xahmol/git/UltimateDemo2026/src/vectors.h"
.s1:
63ef : a2 04 __ LDX #$04
63f1 : b5 53 __ LDA T3 + 0,x 
63f3 : 9d c6 bf STA $bfc6,x ; (vectors_run@stack + 0)
63f6 : ca __ __ DEX
63f7 : 10 f8 __ BPL $63f1 ; (vectors_run.s1 + 2)
.s4:
63f9 : 20 c2 64 JSR $64c2 ; (vec_init.s4 + 0)
63fc : a9 00 __ LDA #$00
63fe : 85 53 __ STA T3 + 0 
6400 : 85 54 __ STA T4 + 0 
6402 : a9 a8 __ LDA #$a8
6404 : 85 55 __ STA T5 + 0 
6406 : a9 fd __ LDA #$fd
6408 : 85 56 __ STA T5 + 1 
.l5:
640a : 2c 11 d0 BIT $d011 
640d : 30 fb __ BMI $640a ; (vectors_run.l5 + 0)
.l6:
640f : 2c 11 d0 BIT $d011 
6412 : 10 fb __ BPL $640f ; (vectors_run.l6 + 0)
.s7:
6414 : a9 00 __ LDA #$00
6416 : 85 57 __ STA T6 + 0 
6418 : 85 0f __ STA P2 
641a : 85 10 __ STA P3 
641c : 85 0d __ STA P0 
641e : 20 ff 7f JSR $7fff ; (memset@proxy + 0)
6421 : e6 53 __ INC T3 + 0 
6423 : a5 53 __ LDA T3 + 0 
6425 : 85 0d __ STA P0 
6427 : a6 54 __ LDX T4 + 0 
6429 : e8 __ __ INX
642a : e8 __ __ INX
642b : 86 54 __ STX T4 + 0 
642d : 86 0e __ STX P1 
642f : 20 2f 65 JSR $652f ; (project.s1 + 0)
.l8:
6432 : a9 ee __ LDA #$ee
6434 : 8d ea bf STA $bfea ; (sstack + 0)
6437 : a9 8a __ LDA #$8a
6439 : 8d eb bf STA $bfeb ; (sstack + 1)
643c : a9 f6 __ LDA #$f6
643e : 8d ec bf STA $bfec ; (sstack + 2)
6441 : a9 86 __ LDA #$86
6443 : 8d ed bf STA $bfed ; (sstack + 3)
6446 : a9 00 __ LDA #$00
6448 : 8d f6 bf STA $bff6 ; (sstack + 12)
644b : a4 57 __ LDY T6 + 0 
644d : b9 de 86 LDA $86de,y ; (cube_e[0][0] + 0)
6450 : 0a __ __ ASL
6451 : aa __ __ TAX
6452 : bd e6 8b LDA $8be6,x ; (px_cur[0] + 0)
6455 : 8d ee bf STA $bfee ; (sstack + 4)
6458 : bd e7 8b LDA $8be7,x ; (px_cur[0] + 1)
645b : 8d ef bf STA $bfef ; (sstack + 5)
645e : bd d6 8b LDA $8bd6,x ; (py_cur[0] + 0)
6461 : 8d f0 bf STA $bff0 ; (sstack + 6)
6464 : bd d7 8b LDA $8bd7,x ; (py_cur[0] + 1)
6467 : 8d f1 bf STA $bff1 ; (sstack + 7)
646a : b9 df 86 LDA $86df,y ; (cube_e[0][0] + 1)
646d : 0a __ __ ASL
646e : aa __ __ TAX
646f : bd e6 8b LDA $8be6,x ; (px_cur[0] + 0)
6472 : 8d f2 bf STA $bff2 ; (sstack + 8)
6475 : bd e7 8b LDA $8be7,x ; (px_cur[0] + 1)
6478 : 8d f3 bf STA $bff3 ; (sstack + 9)
647b : bd d6 8b LDA $8bd6,x ; (py_cur[0] + 0)
647e : 8d f4 bf STA $bff4 ; (sstack + 10)
6481 : bd d7 8b LDA $8bd7,x ; (py_cur[0] + 1)
6484 : 8d f5 bf STA $bff5 ; (sstack + 11)
6487 : 20 cd 37 JSR $37cd ; (bm_line.s1 + 0)
648a : 18 __ __ CLC
648b : a5 57 __ LDA T6 + 0 
648d : 69 02 __ ADC #$02
648f : 85 57 __ STA T6 + 0 
6491 : c9 18 __ CMP #$18
6493 : d0 9d __ BNE $6432 ; (vectors_run.l8 + 0)
.s9:
6495 : e6 55 __ INC T5 + 0 
6497 : f0 03 __ BEQ $649c ; (vectors_run.s11 + 0)
6499 : 4c 0a 64 JMP $640a ; (vectors_run.l5 + 0)
.s11:
649c : e6 56 __ INC T5 + 1 
649e : d0 f9 __ BNE $6499 ; (vectors_run.s9 + 4)
.s10:
64a0 : a9 00 __ LDA #$00
64a2 : 85 0d __ STA P0 
64a4 : 85 0e __ STA P1 
64a6 : 85 10 __ STA P3 
64a8 : a9 36 __ LDA #$36
64aa : 85 01 __ STA $01 
64ac : 20 b0 0f JSR $0fb0 ; (vic_setmode@proxy + 0)
64af : a9 00 __ LDA #$00
64b1 : 8d 20 d0 STA $d020 
64b4 : 8d 21 d0 STA $d021 
.s3:
64b7 : a2 04 __ LDX #$04
64b9 : bd c6 bf LDA $bfc6,x ; (vectors_run@stack + 0)
64bc : 95 53 __ STA T3 + 0,x 
64be : ca __ __ DEX
64bf : 10 f8 __ BPL $64b9 ; (vectors_run.s3 + 2)
64c1 : 60 __ __ RTS
--------------------------------------------------------------------
vec_init: ; vec_init()->void
; 116, "/home/xahmol/git/UltimateDemo2026/src/vectors.c"
.s4:
64c2 : 78 __ __ SEI
64c3 : a9 00 __ LDA #$00
64c5 : 85 0f __ STA P2 
64c7 : 85 10 __ STA P3 
64c9 : a9 30 __ LDA #$30
64cb : 85 01 __ STA $01 
64cd : a9 40 __ LDA #$40
64cf : 85 11 __ STA P4 
64d1 : a9 1f __ LDA #$1f
64d3 : 85 12 __ STA P5 
64d5 : a9 10 __ LDA #$10
64d7 : a2 fa __ LDX #$fa
.l6:
64d9 : ca __ __ DEX
64da : 9d 00 d0 STA $d000,x 
64dd : 9d fa d0 STA $d0fa,x 
64e0 : 9d f4 d1 STA $d1f4,x 
64e3 : 9d ee d2 STA $d2ee,x 
64e6 : d0 f1 __ BNE $64d9 ; (vec_init.l6 + 0)
.s5:
64e8 : a9 00 __ LDA #$00
64ea : 85 43 __ STA T1 + 0 
64ec : 85 0d __ STA P0 
64ee : a9 e0 __ LDA #$e0
64f0 : 85 44 __ STA T1 + 1 
64f2 : 85 0e __ STA P1 
64f4 : 20 31 24 JSR $2431 ; (memset.s4 + 0)
64f7 : a9 35 __ LDA #$35
64f9 : 85 01 __ STA $01 
64fb : 20 4d 24 JSR $244d ; (mmap_trampoline.s4 + 0)
64fe : 58 __ __ CLI
64ff : 20 75 80 JSR $8075 ; (vic_setmode@proxy + 0)
6502 : a5 10 __ LDA P3 
6504 : 8d ee 8a STA $8aee ; (VScreen.data + 0)
6507 : a5 11 __ LDA P4 
6509 : 8d ef 8a STA $8aef ; (VScreen.data + 1)
650c : a9 28 __ LDA #$28
650e : 8d f2 8a STA $8af2 ; (VScreen.cwidth + 0)
6511 : a9 19 __ LDA #$19
6513 : 8d f3 8a STA $8af3 ; (VScreen.cheight + 0)
6516 : a9 40 __ LDA #$40
6518 : 8d f4 8a STA $8af4 ; (VScreen.width + 0)
651b : a9 01 __ LDA #$01
651d : 8d f5 8a STA $8af5 ; (VScreen.width + 1)
6520 : a9 00 __ LDA #$00
6522 : 8d 20 d0 STA $d020 
6525 : 8d 21 d0 STA $d021 
6528 : 8d f0 8a STA $8af0 ; (VScreen.rdata + 0)
652b : 8d f1 8a STA $8af1 ; (VScreen.rdata + 1)
.s3:
652e : 60 __ __ RTS
--------------------------------------------------------------------
project: ; project(u8,u8,i16*,i16*)->void
;  81, "/home/xahmol/git/UltimateDemo2026/src/vectors.c"
.s1:
652f : a2 0e __ LDX #$0e
6531 : b5 53 __ LDA T4 + 0,x 
6533 : 9d d2 bf STA $bfd2,x ; (project@stack + 0)
6536 : ca __ __ DEX
6537 : 10 f8 __ BPL $6531 ; (project.s1 + 2)
.s4:
6539 : a5 0d __ LDA P0 ; (ax + 0)
653b : 0a __ __ ASL
653c : 85 47 __ STA T1 + 0 
653e : a9 84 __ LDA #$84
6540 : 69 00 __ ADC #$00
6542 : 85 5a __ STA T7 + 1 
6544 : 18 __ __ CLC
6545 : a5 0e __ LDA P1 ; (ay + 0)
6547 : 69 40 __ ADC #$40
6549 : 0a __ __ ASL
654a : 85 4b __ STA T2 + 0 
654c : a9 00 __ LDA #$00
654e : 85 48 __ STA T1 + 1 
6550 : 2a __ __ ROL
6551 : aa __ __ TAX
6552 : a9 de __ LDA #$de
6554 : 85 59 __ STA T7 + 0 
6556 : 65 4b __ ADC T2 + 0 
6558 : 85 5b __ STA T8 + 0 
655a : 8a __ __ TXA
655b : 69 84 __ ADC #$84
655d : 85 5c __ STA T8 + 1 
655f : 06 0e __ ASL P1 ; (ay + 0)
6561 : 26 48 __ ROL T1 + 1 
6563 : 18 __ __ CLC
6564 : a9 de __ LDA #$de
6566 : 65 0e __ ADC P1 ; (ay + 0)
6568 : 85 5d __ STA T9 + 0 
656a : a9 84 __ LDA #$84
656c : 65 48 __ ADC T1 + 1 
656e : 85 5e __ STA T9 + 1 
6570 : 18 __ __ CLC
6571 : a5 0d __ LDA P0 ; (ax + 0)
6573 : 69 40 __ ADC #$40
6575 : 0a __ __ ASL
6576 : a2 00 __ LDX #$00
6578 : 90 02 __ BCC $657c ; (project.s11 + 0)
.s10:
657a : e8 __ __ INX
657b : 18 __ __ CLC
.s11:
657c : 69 de __ ADC #$de
657e : 85 5f __ STA T10 + 0 
6580 : 8a __ __ TXA
6581 : 69 84 __ ADC #$84
6583 : 85 60 __ STA T10 + 1 
6585 : a9 00 __ LDA #$00
6587 : 85 52 __ STA T11 + 0 
.l5:
6589 : 85 61 __ STA T12 + 0 
658b : aa __ __ TAX
658c : bd c6 84 LDA $84c6,x ; (cube_v[0][0] + 0)
658f : 29 80 __ AND #$80
6591 : 10 02 __ BPL $6595 ; (project.l5 + 12)
6593 : a9 ff __ LDA #$ff
6595 : 85 04 __ STA WORK + 1 
6597 : 85 44 __ STA T0 + 1 
6599 : bd c6 84 LDA $84c6,x ; (cube_v[0][0] + 0)
659c : 0a __ __ ASL
659d : 0a __ __ ASL
659e : 18 __ __ CLC
659f : 7d c6 84 ADC $84c6,x ; (cube_v[0][0] + 0)
65a2 : 0a __ __ ASL
65a3 : 0a __ __ ASL
65a4 : 0a __ __ ASL
65a5 : 0a __ __ ASL
65a6 : 85 43 __ STA T0 + 0 
65a8 : 85 03 __ STA WORK + 0 
65aa : a5 04 __ LDA WORK + 1 
65ac : 29 80 __ AND #$80
65ae : 10 02 __ BPL $65b2 ; (project.l5 + 41)
65b0 : a9 ff __ LDA #$ff
65b2 : 85 45 __ STA T0 + 2 
65b4 : 85 06 __ STA WORK + 3 
65b6 : 85 05 __ STA WORK + 2 
65b8 : a0 00 __ LDY #$00
65ba : b1 5b __ LDA (T8 + 0),y 
65bc : 85 0e __ STA P1 ; (ay + 0)
65be : 85 1b __ STA ACCU + 0 
65c0 : c8 __ __ INY
65c1 : b1 5b __ LDA (T8 + 0),y 
65c3 : 85 48 __ STA T1 + 1 
65c5 : 85 1c __ STA ACCU + 1 
65c7 : 29 80 __ AND #$80
65c9 : 10 02 __ BPL $65cd ; (project.l5 + 68)
65cb : a9 ff __ LDA #$ff
65cd : 85 49 __ STA T1 + 2 
65cf : 85 1d __ STA ACCU + 2 
65d1 : 85 1e __ STA ACCU + 3 
65d3 : 20 d2 7c JSR $7cd2 ; (mul32 + 0)
65d6 : a5 07 __ LDA WORK + 4 
65d8 : 85 4b __ STA T2 + 0 
65da : a5 08 __ LDA WORK + 5 
65dc : 85 4c __ STA T2 + 1 
65de : a5 09 __ LDA WORK + 6 
65e0 : 85 4d __ STA T2 + 2 
65e2 : a5 0a __ LDA WORK + 7 
65e4 : 85 4e __ STA T2 + 3 
65e6 : a0 00 __ LDY #$00
65e8 : b1 5d __ LDA (T9 + 0),y 
65ea : 85 4f __ STA T3 + 0 
65ec : 85 03 __ STA WORK + 0 
65ee : c8 __ __ INY
65ef : b1 5d __ LDA (T9 + 0),y 
65f1 : 85 50 __ STA T3 + 1 
65f3 : 85 04 __ STA WORK + 1 
65f5 : 29 80 __ AND #$80
65f7 : 10 02 __ BPL $65fb ; (project.l5 + 114)
65f9 : a9 ff __ LDA #$ff
65fb : 85 51 __ STA T3 + 2 
65fd : 85 06 __ STA WORK + 3 
65ff : 85 05 __ STA WORK + 2 
6601 : a6 61 __ LDX T12 + 0 
6603 : bd c8 84 LDA $84c8,x ; (cube_v[0][0] + 2)
6606 : 29 80 __ AND #$80
6608 : 10 02 __ BPL $660c ; (project.l5 + 131)
660a : a9 ff __ LDA #$ff
660c : 85 1c __ STA ACCU + 1 
660e : 85 54 __ STA T4 + 1 
6610 : bd c8 84 LDA $84c8,x ; (cube_v[0][0] + 2)
6613 : 0a __ __ ASL
6614 : 0a __ __ ASL
6615 : 18 __ __ CLC
6616 : 7d c8 84 ADC $84c8,x ; (cube_v[0][0] + 2)
6619 : 0a __ __ ASL
661a : 0a __ __ ASL
661b : 0a __ __ ASL
661c : 0a __ __ ASL
661d : 85 53 __ STA T4 + 0 
661f : 85 1b __ STA ACCU + 0 
6621 : a5 1c __ LDA ACCU + 1 
6623 : 29 80 __ AND #$80
6625 : 10 02 __ BPL $6629 ; (project.l5 + 160)
6627 : a9 ff __ LDA #$ff
6629 : 85 55 __ STA T4 + 2 
662b : 85 1d __ STA ACCU + 2 
662d : 85 1e __ STA ACCU + 3 
662f : 20 d2 7c JSR $7cd2 ; (mul32 + 0)
6632 : 18 __ __ CLC
6633 : a5 07 __ LDA WORK + 4 
6635 : 65 4b __ ADC T2 + 0 
6637 : a5 08 __ LDA WORK + 5 
6639 : 65 4c __ ADC T2 + 1 
663b : 85 4b __ STA T2 + 0 
663d : a5 09 __ LDA WORK + 6 
663f : 65 4d __ ADC T2 + 2 
6641 : 85 4c __ STA T2 + 1 
6643 : a5 0a __ LDA WORK + 7 
6645 : 65 4e __ ADC T2 + 3 
6647 : 85 4e __ STA T2 + 3 
6649 : a4 47 __ LDY T1 + 0 
664b : b1 59 __ LDA (T7 + 0),y 
664d : 85 56 __ STA T5 + 0 
664f : c8 __ __ INY
6650 : b1 59 __ LDA (T7 + 0),y 
6652 : 85 57 __ STA T5 + 1 
6654 : 29 80 __ AND #$80
6656 : 10 02 __ BPL $665a ; (project.l5 + 209)
6658 : a9 ff __ LDA #$ff
665a : 85 58 __ STA T5 + 2 
665c : a5 53 __ LDA T4 + 0 
665e : 85 1b __ STA ACCU + 0 
6660 : a5 54 __ LDA T4 + 1 
6662 : 85 1c __ STA ACCU + 1 
6664 : a5 55 __ LDA T4 + 2 
6666 : 85 1d __ STA ACCU + 2 
6668 : 85 1e __ STA ACCU + 3 
666a : a5 0e __ LDA P1 ; (ay + 0)
666c : 85 03 __ STA WORK + 0 
666e : a5 48 __ LDA T1 + 1 
6670 : 85 04 __ STA WORK + 1 
6672 : a5 49 __ LDA T1 + 2 
6674 : 85 05 __ STA WORK + 2 
6676 : 85 06 __ STA WORK + 3 
6678 : 20 d2 7c JSR $7cd2 ; (mul32 + 0)
667b : a5 07 __ LDA WORK + 4 
667d : 85 0e __ STA P1 ; (ay + 0)
667f : a5 08 __ LDA WORK + 5 
6681 : 85 48 __ STA T1 + 1 
6683 : a5 09 __ LDA WORK + 6 
6685 : 85 49 __ STA T1 + 2 
6687 : a5 0a __ LDA WORK + 7 
6689 : 85 4a __ STA T1 + 3 
668b : 38 __ __ SEC
668c : a9 00 __ LDA #$00
668e : e5 4f __ SBC T3 + 0 
6690 : 85 1b __ STA ACCU + 0 
6692 : a9 00 __ LDA #$00
6694 : e5 50 __ SBC T3 + 1 
6696 : 85 1c __ STA ACCU + 1 
6698 : a9 00 __ LDA #$00
669a : e5 51 __ SBC T3 + 2 
669c : 85 1d __ STA ACCU + 2 
669e : a9 00 __ LDA #$00
66a0 : e5 51 __ SBC T3 + 2 
66a2 : 85 1e __ STA ACCU + 3 
66a4 : a5 43 __ LDA T0 + 0 
66a6 : 85 03 __ STA WORK + 0 
66a8 : a5 44 __ LDA T0 + 1 
66aa : 85 04 __ STA WORK + 1 
66ac : a5 45 __ LDA T0 + 2 
66ae : 85 05 __ STA WORK + 2 
66b0 : 85 06 __ STA WORK + 3 
66b2 : 20 d2 7c JSR $7cd2 ; (mul32 + 0)
66b5 : 18 __ __ CLC
66b6 : a5 07 __ LDA WORK + 4 
66b8 : 65 0e __ ADC P1 ; (ay + 0)
66ba : a5 08 __ LDA WORK + 5 
66bc : 65 48 __ ADC T1 + 1 
66be : 85 43 __ STA T0 + 0 
66c0 : a5 09 __ LDA WORK + 6 
66c2 : 65 49 __ ADC T1 + 2 
66c4 : 85 44 __ STA T0 + 1 
66c6 : a5 0a __ LDA WORK + 7 
66c8 : 65 4a __ ADC T1 + 3 
66ca : 4a __ __ LSR
66cb : 66 44 __ ROR T0 + 1 
66cd : 66 43 __ ROR T0 + 0 
66cf : 4a __ __ LSR
66d0 : 66 44 __ ROR T0 + 1 
66d2 : 66 43 __ ROR T0 + 0 
66d4 : 4a __ __ LSR
66d5 : 66 44 __ ROR T0 + 1 
66d7 : 66 43 __ ROR T0 + 0 
66d9 : 4a __ __ LSR
66da : 66 44 __ ROR T0 + 1 
66dc : 66 43 __ ROR T0 + 0 
66de : a5 44 __ LDA T0 + 1 
66e0 : 85 1c __ STA ACCU + 1 
66e2 : 29 80 __ AND #$80
66e4 : 10 02 __ BPL $66e8 ; (project.l5 + 351)
66e6 : a9 ff __ LDA #$ff
66e8 : 85 45 __ STA T0 + 2 
66ea : 85 1e __ STA ACCU + 3 
66ec : 85 1d __ STA ACCU + 2 
66ee : a5 43 __ LDA T0 + 0 
66f0 : 85 1b __ STA ACCU + 0 
66f2 : a5 56 __ LDA T5 + 0 
66f4 : 85 03 __ STA WORK + 0 
66f6 : a5 57 __ LDA T5 + 1 
66f8 : 85 04 __ STA WORK + 1 
66fa : a5 58 __ LDA T5 + 2 
66fc : 85 05 __ STA WORK + 2 
66fe : 85 06 __ STA WORK + 3 
6700 : 20 d2 7c JSR $7cd2 ; (mul32 + 0)
6703 : a5 07 __ LDA WORK + 4 
6705 : 85 0e __ STA P1 ; (ay + 0)
6707 : a5 08 __ LDA WORK + 5 
6709 : 85 48 __ STA T1 + 1 
670b : a5 09 __ LDA WORK + 6 
670d : 85 49 __ STA T1 + 2 
670f : a5 0a __ LDA WORK + 7 
6711 : 85 4a __ STA T1 + 3 
6713 : a6 61 __ LDX T12 + 0 
6715 : bd c7 84 LDA $84c7,x ; (cube_v[0][0] + 1)
6718 : 29 80 __ AND #$80
671a : 10 02 __ BPL $671e ; (project.l5 + 405)
671c : a9 ff __ LDA #$ff
671e : 85 04 __ STA WORK + 1 
6720 : 85 50 __ STA T3 + 1 
6722 : bd c7 84 LDA $84c7,x ; (cube_v[0][0] + 1)
6725 : 0a __ __ ASL
6726 : 0a __ __ ASL
6727 : 18 __ __ CLC
6728 : 7d c7 84 ADC $84c7,x ; (cube_v[0][0] + 1)
672b : 0a __ __ ASL
672c : 0a __ __ ASL
672d : 0a __ __ ASL
672e : 0a __ __ ASL
672f : 85 4f __ STA T3 + 0 
6731 : 85 03 __ STA WORK + 0 
6733 : a5 04 __ LDA WORK + 1 
6735 : 29 80 __ AND #$80
6737 : 10 02 __ BPL $673b ; (project.l5 + 434)
6739 : a9 ff __ LDA #$ff
673b : 85 51 __ STA T3 + 2 
673d : 85 06 __ STA WORK + 3 
673f : 85 05 __ STA WORK + 2 
6741 : a0 00 __ LDY #$00
6743 : b1 5f __ LDA (T10 + 0),y 
6745 : 85 53 __ STA T4 + 0 
6747 : 85 1b __ STA ACCU + 0 
6749 : c8 __ __ INY
674a : b1 5f __ LDA (T10 + 0),y 
674c : 85 54 __ STA T4 + 1 
674e : 85 1c __ STA ACCU + 1 
6750 : 29 80 __ AND #$80
6752 : 10 02 __ BPL $6756 ; (project.l5 + 461)
6754 : a9 ff __ LDA #$ff
6756 : 85 55 __ STA T4 + 2 
6758 : 85 1d __ STA ACCU + 2 
675a : 85 1e __ STA ACCU + 3 
675c : 20 d2 7c JSR $7cd2 ; (mul32 + 0)
675f : 38 __ __ SEC
6760 : a5 07 __ LDA WORK + 4 
6762 : e5 0e __ SBC P1 ; (ay + 0)
6764 : a5 08 __ LDA WORK + 5 
6766 : e5 48 __ SBC T1 + 1 
6768 : 85 0e __ STA P1 ; (ay + 0)
676a : a5 09 __ LDA WORK + 6 
676c : e5 49 __ SBC T1 + 2 
676e : 85 48 __ STA T1 + 1 
6770 : a5 0a __ LDA WORK + 7 
6772 : e5 4a __ SBC T1 + 3 
6774 : 85 4a __ STA T1 + 3 
6776 : a5 53 __ LDA T4 + 0 
6778 : 85 1b __ STA ACCU + 0 
677a : a5 54 __ LDA T4 + 1 
677c : 85 1c __ STA ACCU + 1 
677e : a5 55 __ LDA T4 + 2 
6780 : 85 1d __ STA ACCU + 2 
6782 : 85 1e __ STA ACCU + 3 
6784 : a5 43 __ LDA T0 + 0 
6786 : 85 03 __ STA WORK + 0 
6788 : a5 44 __ LDA T0 + 1 
678a : 85 04 __ STA WORK + 1 
678c : a5 45 __ LDA T0 + 2 
678e : 85 05 __ STA WORK + 2 
6790 : 85 06 __ STA WORK + 3 
6792 : 20 d2 7c JSR $7cd2 ; (mul32 + 0)
6795 : a5 07 __ LDA WORK + 4 
6797 : 85 43 __ STA T0 + 0 
6799 : a5 08 __ LDA WORK + 5 
679b : 85 44 __ STA T0 + 1 
679d : a5 09 __ LDA WORK + 6 
679f : 85 45 __ STA T0 + 2 
67a1 : a5 0a __ LDA WORK + 7 
67a3 : 85 46 __ STA T0 + 3 
67a5 : a5 56 __ LDA T5 + 0 
67a7 : 85 1b __ STA ACCU + 0 
67a9 : a5 57 __ LDA T5 + 1 
67ab : 85 1c __ STA ACCU + 1 
67ad : a5 58 __ LDA T5 + 2 
67af : 85 1d __ STA ACCU + 2 
67b1 : 85 1e __ STA ACCU + 3 
67b3 : a5 4f __ LDA T3 + 0 
67b5 : 85 03 __ STA WORK + 0 
67b7 : a5 50 __ LDA T3 + 1 
67b9 : 85 04 __ STA WORK + 1 
67bb : a5 51 __ LDA T3 + 2 
67bd : 85 05 __ STA WORK + 2 
67bf : 85 06 __ STA WORK + 3 
67c1 : 20 d2 7c JSR $7cd2 ; (mul32 + 0)
67c4 : 18 __ __ CLC
67c5 : a5 07 __ LDA WORK + 4 
67c7 : 65 43 __ ADC T0 + 0 
67c9 : a5 08 __ LDA WORK + 5 
67cb : 65 44 __ ADC T0 + 1 
67cd : 85 43 __ STA T0 + 0 
67cf : a5 09 __ LDA WORK + 6 
67d1 : 65 45 __ ADC T0 + 2 
67d3 : 85 44 __ STA T0 + 1 
67d5 : a5 0a __ LDA WORK + 7 
67d7 : 65 46 __ ADC T0 + 3 
67d9 : 4a __ __ LSR
67da : 66 44 __ ROR T0 + 1 
67dc : 66 43 __ ROR T0 + 0 
67de : 4a __ __ LSR
67df : 66 44 __ ROR T0 + 1 
67e1 : 66 43 __ ROR T0 + 0 
67e3 : 4a __ __ LSR
67e4 : 66 44 __ ROR T0 + 1 
67e6 : 66 43 __ ROR T0 + 0 
67e8 : 4a __ __ LSR
67e9 : 66 44 __ ROR T0 + 1 
67eb : 66 43 __ ROR T0 + 0 
67ed : 18 __ __ CLC
67ee : a5 43 __ LDA T0 + 0 
67f0 : 69 18 __ ADC #$18
67f2 : 85 4f __ STA T3 + 0 
67f4 : a5 44 __ LDA T0 + 1 
67f6 : 69 01 __ ADC #$01
67f8 : 85 50 __ STA T3 + 1 
67fa : a5 44 __ LDA T0 + 1 
67fc : 49 80 __ EOR #$80
67fe : c9 7e __ CMP #$7e
6800 : d0 04 __ BNE $6806 ; (project.s9 + 0)
.s8:
6802 : a5 43 __ LDA T0 + 0 
6804 : c9 e9 __ CMP #$e9
.s9:
6806 : b0 08 __ BCS $6810 ; (project.s6 + 0)
.s7:
6808 : a9 01 __ LDA #$01
680a : 85 4f __ STA T3 + 0 
680c : a9 00 __ LDA #$00
680e : 85 50 __ STA T3 + 1 
.s6:
6810 : a5 4e __ LDA T2 + 3 
6812 : 4a __ __ LSR
6813 : 66 4c __ ROR T2 + 1 
6815 : 66 4b __ ROR T2 + 0 
6817 : 4a __ __ LSR
6818 : 66 4c __ ROR T2 + 1 
681a : 66 4b __ ROR T2 + 0 
681c : 4a __ __ LSR
681d : 66 4c __ ROR T2 + 1 
681f : 66 4b __ ROR T2 + 0 
6821 : 4a __ __ LSR
6822 : 66 4c __ ROR T2 + 1 
6824 : 66 4b __ ROR T2 + 0 
6826 : a5 4b __ LDA T2 + 0 
6828 : 0a __ __ ASL
6829 : a8 __ __ TAY
682a : a5 4c __ LDA T2 + 1 
682c : 2a __ __ ROL
682d : aa __ __ TAX
682e : 98 __ __ TYA
682f : 18 __ __ CLC
6830 : 65 4b __ ADC T2 + 0 
6832 : a8 __ __ TAY
6833 : 8a __ __ TXA
6834 : 65 4c __ ADC T2 + 1 
6836 : 85 1b __ STA ACCU + 0 
6838 : 98 __ __ TYA
6839 : 0a __ __ ASL
683a : 26 1b __ ROL ACCU + 0 
683c : 0a __ __ ASL
683d : 26 1b __ ROL ACCU + 0 
683f : 0a __ __ ASL
6840 : 26 1b __ ROL ACCU + 0 
6842 : 18 __ __ CLC
6843 : 65 4b __ ADC T2 + 0 
6845 : 85 4b __ STA T2 + 0 
6847 : a5 1b __ LDA ACCU + 0 
6849 : 65 4c __ ADC T2 + 1 
684b : 06 4b __ ASL T2 + 0 
684d : 2a __ __ ROL
684e : 06 4b __ ASL T2 + 0 
6850 : 2a __ __ ROL
6851 : 06 4b __ ASL T2 + 0 
6853 : 2a __ __ ROL
6854 : 85 1c __ STA ACCU + 1 
6856 : a5 4b __ LDA T2 + 0 
6858 : 85 1b __ STA ACCU + 0 
685a : 20 0e 80 JSR $800e ; (divs16@proxy + 0)
685d : 18 __ __ CLC
685e : a5 1b __ LDA ACCU + 0 
6860 : 69 a0 __ ADC #$a0
6862 : a8 __ __ TAY
6863 : a5 1c __ LDA ACCU + 1 
6865 : 69 00 __ ADC #$00
6867 : 85 44 __ STA T0 + 1 
6869 : a5 52 __ LDA T11 + 0 
686b : 0a __ __ ASL
686c : 85 4b __ STA T2 + 0 
686e : aa __ __ TAX
686f : 98 __ __ TYA
6870 : 9d e6 8b STA $8be6,x ; (px_cur[0] + 0)
6873 : a5 44 __ LDA T0 + 1 
6875 : 9d e7 8b STA $8be7,x ; (px_cur[0] + 1)
6878 : a5 4a __ LDA T1 + 3 
687a : 4a __ __ LSR
687b : 66 48 __ ROR T1 + 1 
687d : 66 0e __ ROR P1 ; (ay + 0)
687f : 4a __ __ LSR
6880 : 66 48 __ ROR T1 + 1 
6882 : 66 0e __ ROR P1 ; (ay + 0)
6884 : 4a __ __ LSR
6885 : 66 48 __ ROR T1 + 1 
6887 : 66 0e __ ROR P1 ; (ay + 0)
6889 : 4a __ __ LSR
688a : 66 48 __ ROR T1 + 1 
688c : 66 0e __ ROR P1 ; (ay + 0)
688e : a5 0e __ LDA P1 ; (ay + 0)
6890 : 0a __ __ ASL
6891 : a8 __ __ TAY
6892 : a5 48 __ LDA T1 + 1 
6894 : 2a __ __ ROL
6895 : aa __ __ TAX
6896 : 98 __ __ TYA
6897 : 18 __ __ CLC
6898 : 65 0e __ ADC P1 ; (ay + 0)
689a : a8 __ __ TAY
689b : 8a __ __ TXA
689c : 65 48 __ ADC T1 + 1 
689e : 85 1b __ STA ACCU + 0 
68a0 : 98 __ __ TYA
68a1 : 0a __ __ ASL
68a2 : 26 1b __ ROL ACCU + 0 
68a4 : 0a __ __ ASL
68a5 : 26 1b __ ROL ACCU + 0 
68a7 : 0a __ __ ASL
68a8 : 26 1b __ ROL ACCU + 0 
68aa : 18 __ __ CLC
68ab : 65 0e __ ADC P1 ; (ay + 0)
68ad : 85 0e __ STA P1 ; (ay + 0)
68af : a5 1b __ LDA ACCU + 0 
68b1 : 65 48 __ ADC T1 + 1 
68b3 : 06 0e __ ASL P1 ; (ay + 0)
68b5 : 2a __ __ ROL
68b6 : 06 0e __ ASL P1 ; (ay + 0)
68b8 : 2a __ __ ROL
68b9 : 06 0e __ ASL P1 ; (ay + 0)
68bb : 2a __ __ ROL
68bc : 85 1c __ STA ACCU + 1 
68be : a5 0e __ LDA P1 ; (ay + 0)
68c0 : 85 1b __ STA ACCU + 0 
68c2 : 20 0e 80 JSR $800e ; (divs16@proxy + 0)
68c5 : 18 __ __ CLC
68c6 : a5 1b __ LDA ACCU + 0 
68c8 : 69 64 __ ADC #$64
68ca : a6 4b __ LDX T2 + 0 
68cc : 9d d6 8b STA $8bd6,x ; (py_cur[0] + 0)
68cf : a5 1c __ LDA ACCU + 1 
68d1 : 69 00 __ ADC #$00
68d3 : 9d d7 8b STA $8bd7,x ; (py_cur[0] + 1)
68d6 : e6 52 __ INC T11 + 0 
68d8 : 18 __ __ CLC
68d9 : a5 61 __ LDA T12 + 0 
68db : 69 03 __ ADC #$03
68dd : c9 18 __ CMP #$18
68df : f0 03 __ BEQ $68e4 ; (project.s3 + 0)
68e1 : 4c 89 65 JMP $6589 ; (project.l5 + 0)
.s3:
68e4 : a2 0e __ LDX #$0e
68e6 : bd d2 bf LDA $bfd2,x ; (project@stack + 0)
68e9 : 95 53 __ STA T4 + 0,x 
68eb : ca __ __ DEX
68ec : 10 f8 __ BPL $68e6 ; (project.s3 + 2)
68ee : 60 __ __ RTS
--------------------------------------------------------------------
plasma_run: ; plasma_run()->void
;   3, "/home/xahmol/git/UltimateDemo2026/src/plasma.h"
.s1:
68ef : a2 04 __ LDX #$04
68f1 : b5 53 __ LDA T1 + 0,x 
68f3 : 9d e2 bf STA $bfe2,x ; (plasma_run@stack + 0)
68f6 : ca __ __ DEX
68f7 : 10 f8 __ BPL $68f1 ; (plasma_run.s1 + 2)
.s4:
68f9 : 20 ce 69 JSR $69ce ; (plasma_init.s4 + 0)
68fc : a9 00 __ LDA #$00
68fe : 85 53 __ STA T1 + 0 
6900 : 85 54 __ STA T2 + 0 
6902 : 85 55 __ STA T3 + 0 
6904 : a9 a2 __ LDA #$a2
6906 : 85 56 __ STA T4 + 0 
6908 : a9 fe __ LDA #$fe
690a : 85 57 __ STA T4 + 1 
.l5:
690c : a5 53 __ LDA T1 + 0 
690e : 85 0d __ STA P0 
6910 : 20 22 6a JSR $6a22 ; (plasma_frame@proxy + 0)
.l6:
6913 : 2c 11 d0 BIT $d011 
6916 : 30 fb __ BMI $6913 ; (plasma_run.l6 + 0)
.l7:
6918 : 2c 11 d0 BIT $d011 
691b : 10 fb __ BPL $6918 ; (plasma_run.l7 + 0)
.s8:
691d : e6 55 __ INC T3 + 0 
691f : e6 54 __ INC T2 + 0 
6921 : e6 54 __ INC T2 + 0 
6923 : e6 53 __ INC T1 + 0 
6925 : e6 56 __ INC T4 + 0 
6927 : d0 e3 __ BNE $690c ; (plasma_run.l5 + 0)
.s19:
6929 : e6 57 __ INC T4 + 1 
692b : d0 df __ BNE $690c ; (plasma_run.l5 + 0)
.s9:
692d : a9 00 __ LDA #$00
692f : 85 43 __ STA T0 + 0 
6931 : 85 1f __ STA ADDR + 0 
6933 : a9 c0 __ LDA #$c0
6935 : 85 44 __ STA T0 + 1 
6937 : d0 02 __ BNE $693b ; (plasma_run.l18 + 0)
.s21:
6939 : e6 44 __ INC T0 + 1 
.l18:
693b : a9 82 __ LDA #$82
693d : a0 00 __ LDY #$00
693f : 91 43 __ STA (T0 + 0),y 
6941 : 18 __ __ CLC
6942 : a5 44 __ LDA T0 + 1 
6944 : 69 18 __ ADC #$18
6946 : 85 20 __ STA ADDR + 1 
6948 : a9 07 __ LDA #$07
694a : a4 43 __ LDY T0 + 0 
694c : 91 1f __ STA (ADDR + 0),y 
694e : 98 __ __ TYA
694f : 18 __ __ CLC
6950 : 69 01 __ ADC #$01
6952 : 85 43 __ STA T0 + 0 
6954 : b0 e3 __ BCS $6939 ; (plasma_run.s21 + 0)
.s22:
6956 : c9 e8 __ CMP #$e8
6958 : d0 e1 __ BNE $693b ; (plasma_run.l18 + 0)
.s17:
695a : a5 44 __ LDA T0 + 1 
695c : c9 c3 __ CMP #$c3
695e : d0 db __ BNE $693b ; (plasma_run.l18 + 0)
.s10:
6960 : a9 00 __ LDA #$00
6962 : 8d 21 d0 STA $d021 
6965 : a9 a2 __ LDA #$a2
6967 : 85 56 __ STA T4 + 0 
6969 : a9 fe __ LDA #$fe
696b : 85 57 __ STA T4 + 1 
696d : a5 53 __ LDA T1 + 0 
.l11:
696f : 85 0d __ STA P0 
6971 : 20 22 6a JSR $6a22 ; (plasma_frame@proxy + 0)
.l12:
6974 : 2c 11 d0 BIT $d011 
6977 : 30 fb __ BMI $6974 ; (plasma_run.l12 + 0)
.l13:
6979 : 2c 11 d0 BIT $d011 
697c : 10 fb __ BPL $6979 ; (plasma_run.l13 + 0)
.s14:
697e : 18 __ __ CLC
697f : a5 0f __ LDA P2 
6981 : 69 02 __ ADC #$02
6983 : 85 55 __ STA T3 + 0 
6985 : 18 __ __ CLC
6986 : a5 54 __ LDA T2 + 0 
6988 : 69 03 __ ADC #$03
698a : 85 54 __ STA T2 + 0 
698c : 18 __ __ CLC
698d : a5 0d __ LDA P0 
698f : 69 02 __ ADC #$02
6991 : e6 56 __ INC T4 + 0 
6993 : d0 da __ BNE $696f ; (plasma_run.l11 + 0)
.s20:
6995 : e6 57 __ INC T4 + 1 
6997 : d0 d6 __ BNE $696f ; (plasma_run.l11 + 0)
.s15:
6999 : a9 00 __ LDA #$00
699b : 85 0d __ STA P0 
699d : 85 0e __ STA P1 
699f : 85 10 __ STA P3 
69a1 : a9 36 __ LDA #$36
69a3 : 85 01 __ STA $01 
69a5 : 20 b0 0f JSR $0fb0 ; (vic_setmode@proxy + 0)
69a8 : a9 00 __ LDA #$00
69aa : 8d 20 d0 STA $d020 
69ad : 8d 21 d0 STA $d021 
69b0 : a9 20 __ LDA #$20
69b2 : a2 fa __ LDX #$fa
.l16:
69b4 : ca __ __ DEX
69b5 : 9d 00 04 STA $0400,x 
69b8 : 9d fa 04 STA $04fa,x 
69bb : 9d f4 05 STA $05f4,x 
69be : 9d ee 06 STA $06ee,x 
69c1 : d0 f1 __ BNE $69b4 ; (plasma_run.l16 + 0)
.s3:
69c3 : a2 04 __ LDX #$04
69c5 : bd e2 bf LDA $bfe2,x ; (plasma_run@stack + 0)
69c8 : 95 53 __ STA T1 + 0,x 
69ca : ca __ __ DEX
69cb : 10 f8 __ BPL $69c5 ; (plasma_run.s3 + 2)
69cd : 60 __ __ RTS
--------------------------------------------------------------------
plasma_init: ; plasma_init()->void
;  38, "/home/xahmol/git/UltimateDemo2026/src/plasma.c"
.s4:
69ce : a9 00 __ LDA #$00
69d0 : 85 0f __ STA P2 
69d2 : 85 10 __ STA P3 
69d4 : 85 43 __ STA T0 + 0 
69d6 : 85 0d __ STA P0 
69d8 : a9 35 __ LDA #$35
69da : 85 01 __ STA $01 
69dc : 20 ff 7f JSR $7fff ; (memset@proxy + 0)
69df : a9 c0 __ LDA #$c0
69e1 : 85 44 __ STA T0 + 1 
69e3 : a9 00 __ LDA #$00
69e5 : 85 1f __ STA ADDR + 0 
69e7 : f0 02 __ BEQ $69eb ; (plasma_init.l7 + 0)
.s8:
69e9 : e6 44 __ INC T0 + 1 
.l7:
69eb : a9 34 __ LDA #$34
69ed : a0 00 __ LDY #$00
69ef : 91 43 __ STA (T0 + 0),y 
69f1 : 18 __ __ CLC
69f2 : a5 44 __ LDA T0 + 1 
69f4 : 69 18 __ ADC #$18
69f6 : 85 20 __ STA ADDR + 1 
69f8 : a9 07 __ LDA #$07
69fa : a4 43 __ LDY T0 + 0 
69fc : 91 1f __ STA (ADDR + 0),y 
69fe : 98 __ __ TYA
69ff : 18 __ __ CLC
6a00 : 69 01 __ ADC #$01
6a02 : 85 43 __ STA T0 + 0 
6a04 : b0 e3 __ BCS $69e9 ; (plasma_init.s8 + 0)
.s9:
6a06 : c9 e8 __ CMP #$e8
6a08 : d0 e1 __ BNE $69eb ; (plasma_init.l7 + 0)
.s6:
6a0a : a5 44 __ LDA T0 + 1 
6a0c : c9 c3 __ CMP #$c3
6a0e : d0 db __ BNE $69eb ; (plasma_init.l7 + 0)
.s5:
6a10 : a9 00 __ LDA #$00
6a12 : 85 0e __ STA P1 
6a14 : 85 10 __ STA P3 
6a16 : 20 66 80 JSR $8066 ; (vic_setmode@proxy + 0)
6a19 : a9 00 __ LDA #$00
6a1b : 8d 21 d0 STA $d021 
6a1e : 8d 20 d0 STA $d020 
.s3:
6a21 : 60 __ __ RTS
--------------------------------------------------------------------
plasma_frame@proxy: ; plasma_frame@proxy
6a22 : a5 54 __ LDA $54 
6a24 : 85 0e __ STA P1 
6a26 : a5 55 __ LDA $55 
6a28 : 85 0f __ STA P2 
--------------------------------------------------------------------
plasma_frame: ; plasma_frame(u8,u8,u8)->void
;  69, "/home/xahmol/git/UltimateDemo2026/src/plasma.c"
.s4:
6a2a : a2 00 __ LDX #$00
.l8:
6a2c : a5 0e __ LDA P1 ; (t2 + 0)
6a2e : 29 3f __ AND #$3f
6a30 : a8 __ __ TAY
6a31 : b9 00 87 LDA $8700,y ; (sin_lut[0] + 0)
6a34 : 9d 20 a6 STA $a620,x ; (row_sin[0] + 0)
6a37 : e6 0e __ INC P1 ; (t2 + 0)
6a39 : e8 __ __ INX
6a3a : e0 c8 __ CPX #$c8
6a3c : d0 ee __ BNE $6a2c ; (plasma_frame.l8 + 0)
.s9:
6a3e : a5 0d __ LDA P0 ; (t1 + 0)
6a40 : 85 0e __ STA P1 ; (t2 + 0)
6a42 : a9 00 __ LDA #$00
6a44 : 85 1b __ STA ACCU + 0 
.l5:
6a46 : 85 4b __ STA T10 + 0 
6a48 : 29 07 __ AND #$07
6a4a : 85 43 __ STA T3 + 0 
6a4c : a5 1b __ LDA ACCU + 0 
6a4e : 29 f8 __ AND #$f8
6a50 : 85 45 __ STA T4 + 0 
6a52 : 4a __ __ LSR
6a53 : 4a __ __ LSR
6a54 : 65 45 __ ADC T4 + 0 
6a56 : 4a __ __ LSR
6a57 : 6a __ __ ROR
6a58 : 6a __ __ ROR
6a59 : aa __ __ TAX
6a5a : 29 c0 __ AND #$c0
6a5c : 6a __ __ ROR
6a5d : 05 43 __ ORA T3 + 0 
6a5f : 85 45 __ STA T4 + 0 
6a61 : 8a __ __ TXA
6a62 : 29 1f __ AND #$1f
6a64 : 09 e0 __ ORA #$e0
6a66 : 85 46 __ STA T4 + 1 
6a68 : a5 1b __ LDA ACCU + 0 
6a6a : 69 03 __ ADC #$03
6a6c : 85 43 __ STA T3 + 0 
6a6e : a5 0e __ LDA P1 ; (t2 + 0)
6a70 : 85 4d __ STA T11 + 0 
6a72 : 18 __ __ CLC
6a73 : 69 03 __ ADC #$03
6a75 : 85 1c __ STA ACCU + 1 
6a77 : a5 1b __ LDA ACCU + 0 
6a79 : aa __ __ TAX
6a7a : e8 __ __ INX
6a7b : 86 49 __ STX T8 + 0 
6a7d : 18 __ __ CLC
6a7e : 69 02 __ ADC #$02
6a80 : 85 47 __ STA T6 + 0 
6a82 : a9 00 __ LDA #$00
6a84 : 85 44 __ STA T3 + 1 
6a86 : 85 48 __ STA T6 + 1 
6a88 : 18 __ __ CLC
6a89 : a5 0e __ LDA P1 ; (t2 + 0)
6a8b : 69 02 __ ADC #$02
6a8d : 85 1d __ STA ACCU + 2 
6a8f : 18 __ __ CLC
6a90 : 69 ff __ ADC #$ff
6a92 : 85 1e __ STA ACCU + 3 
6a94 : a9 00 __ LDA #$00
6a96 : 85 4a __ STA T8 + 1 
6a98 : 85 4c __ STA T10 + 1 
6a9a : bd 1f a6 LDA $a61f,x ; (tbuffer[0] + 319)
6a9d : 85 4e __ STA T12 + 0 
6a9f : a9 28 __ LDA #$28
6aa1 : 85 51 __ STA T16 + 0 
6aa3 : a0 00 __ LDY #$00
6aa5 : 18 __ __ CLC
.l7:
6aa6 : a5 4d __ LDA T11 + 0 
6aa8 : 29 3f __ AND #$3f
6aaa : aa __ __ TAX
6aab : bd 00 87 LDA $8700,x ; (sin_lut[0] + 0)
6aae : 65 4e __ ADC T12 + 0 
6ab0 : 85 4f __ STA T13 + 0 
6ab2 : a5 4c __ LDA T10 + 1 
6ab4 : 4a __ __ LSR
6ab5 : a5 4b __ LDA T10 + 0 
6ab7 : 6a __ __ ROR
6ab8 : 18 __ __ CLC
6ab9 : 65 0f __ ADC P2 ; (t3 + 0)
6abb : 29 3f __ AND #$3f
6abd : aa __ __ TAX
6abe : bd 00 87 LDA $8700,x ; (sin_lut[0] + 0)
6ac1 : 18 __ __ CLC
6ac2 : 65 4f __ ADC T13 + 0 
6ac4 : aa __ __ TAX
6ac5 : bd 40 87 LDA $8740,x ; (sum_to_col[0] + 0)
6ac8 : 4a __ __ LSR
6ac9 : 6a __ __ ROR
6aca : 6a __ __ ROR
6acb : 85 4f __ STA T13 + 0 
6acd : a5 1e __ LDA ACCU + 3 
6acf : 29 3f __ AND #$3f
6ad1 : aa __ __ TAX
6ad2 : bd 00 87 LDA $8700,x ; (sin_lut[0] + 0)
6ad5 : 65 4e __ ADC T12 + 0 
6ad7 : 85 50 __ STA T14 + 0 
6ad9 : a5 4a __ LDA T8 + 1 
6adb : 4a __ __ LSR
6adc : a5 49 __ LDA T8 + 0 
6ade : 6a __ __ ROR
6adf : 18 __ __ CLC
6ae0 : 65 0f __ ADC P2 ; (t3 + 0)
6ae2 : 29 3f __ AND #$3f
6ae4 : aa __ __ TAX
6ae5 : bd 00 87 LDA $8700,x ; (sin_lut[0] + 0)
6ae8 : 18 __ __ CLC
6ae9 : 65 50 __ ADC T14 + 0 
6aeb : aa __ __ TAX
6aec : bd 40 87 LDA $8740,x ; (sum_to_col[0] + 0)
6aef : 0a __ __ ASL
6af0 : 0a __ __ ASL
6af1 : 0a __ __ ASL
6af2 : 0a __ __ ASL
6af3 : 05 4f __ ORA T13 + 0 
6af5 : 85 4f __ STA T13 + 0 
6af7 : a5 1d __ LDA ACCU + 2 
6af9 : 29 3f __ AND #$3f
6afb : aa __ __ TAX
6afc : bd 00 87 LDA $8700,x ; (sin_lut[0] + 0)
6aff : 65 4e __ ADC T12 + 0 
6b01 : 85 50 __ STA T14 + 0 
6b03 : a5 48 __ LDA T6 + 1 
6b05 : 4a __ __ LSR
6b06 : a5 47 __ LDA T6 + 0 
6b08 : 6a __ __ ROR
6b09 : 18 __ __ CLC
6b0a : 65 0f __ ADC P2 ; (t3 + 0)
6b0c : 29 3f __ AND #$3f
6b0e : aa __ __ TAX
6b0f : bd 00 87 LDA $8700,x ; (sin_lut[0] + 0)
6b12 : 18 __ __ CLC
6b13 : 65 50 __ ADC T14 + 0 
6b15 : aa __ __ TAX
6b16 : bd 40 87 LDA $8740,x ; (sum_to_col[0] + 0)
6b19 : 0a __ __ ASL
6b1a : 0a __ __ ASL
6b1b : 05 4f __ ORA T13 + 0 
6b1d : 85 4f __ STA T13 + 0 
6b1f : a5 1c __ LDA ACCU + 1 
6b21 : 29 3f __ AND #$3f
6b23 : aa __ __ TAX
6b24 : bd 00 87 LDA $8700,x ; (sin_lut[0] + 0)
6b27 : 65 4e __ ADC T12 + 0 
6b29 : 85 50 __ STA T14 + 0 
6b2b : a5 44 __ LDA T3 + 1 
6b2d : 4a __ __ LSR
6b2e : a5 43 __ LDA T3 + 0 
6b30 : 6a __ __ ROR
6b31 : 18 __ __ CLC
6b32 : 65 0f __ ADC P2 ; (t3 + 0)
6b34 : 29 3f __ AND #$3f
6b36 : aa __ __ TAX
6b37 : bd 00 87 LDA $8700,x ; (sin_lut[0] + 0)
6b3a : 18 __ __ CLC
6b3b : 65 50 __ ADC T14 + 0 
6b3d : aa __ __ TAX
6b3e : bd 40 87 LDA $8740,x ; (sum_to_col[0] + 0)
6b41 : 05 4f __ ORA T13 + 0 
6b43 : 91 45 __ STA (T4 + 0),y 
6b45 : 18 __ __ CLC
6b46 : a5 43 __ LDA T3 + 0 
6b48 : 69 04 __ ADC #$04
6b4a : 85 43 __ STA T3 + 0 
6b4c : 90 03 __ BCC $6b51 ; (plasma_frame.s11 + 0)
.s10:
6b4e : e6 44 __ INC T3 + 1 
6b50 : 18 __ __ CLC
.s11:
6b51 : a5 1c __ LDA ACCU + 1 
6b53 : 69 04 __ ADC #$04
6b55 : 85 1c __ STA ACCU + 1 
6b57 : 18 __ __ CLC
6b58 : a5 47 __ LDA T6 + 0 
6b5a : 69 04 __ ADC #$04
6b5c : 85 47 __ STA T6 + 0 
6b5e : 90 03 __ BCC $6b63 ; (plasma_frame.s13 + 0)
.s12:
6b60 : e6 48 __ INC T6 + 1 
6b62 : 18 __ __ CLC
.s13:
6b63 : a5 1d __ LDA ACCU + 2 
6b65 : 69 04 __ ADC #$04
6b67 : 85 1d __ STA ACCU + 2 
6b69 : 18 __ __ CLC
6b6a : a5 49 __ LDA T8 + 0 
6b6c : 69 04 __ ADC #$04
6b6e : 85 49 __ STA T8 + 0 
6b70 : 90 03 __ BCC $6b75 ; (plasma_frame.s15 + 0)
.s14:
6b72 : e6 4a __ INC T8 + 1 
6b74 : 18 __ __ CLC
.s15:
6b75 : a5 1e __ LDA ACCU + 3 
6b77 : 69 04 __ ADC #$04
6b79 : 85 1e __ STA ACCU + 3 
6b7b : 18 __ __ CLC
6b7c : a5 4b __ LDA T10 + 0 
6b7e : 69 04 __ ADC #$04
6b80 : 85 4b __ STA T10 + 0 
6b82 : 90 03 __ BCC $6b87 ; (plasma_frame.s17 + 0)
.s16:
6b84 : e6 4c __ INC T10 + 1 
6b86 : 18 __ __ CLC
.s17:
6b87 : a5 4d __ LDA T11 + 0 
6b89 : 69 04 __ ADC #$04
6b8b : 85 4d __ STA T11 + 0 
6b8d : 98 __ __ TYA
6b8e : 18 __ __ CLC
6b8f : 69 08 __ ADC #$08
6b91 : a8 __ __ TAY
6b92 : 90 03 __ BCC $6b97 ; (plasma_frame.s19 + 0)
.s18:
6b94 : e6 46 __ INC T4 + 1 
6b96 : 18 __ __ CLC
.s19:
6b97 : c6 51 __ DEC T16 + 0 
6b99 : f0 03 __ BEQ $6b9e ; (plasma_frame.s6 + 0)
6b9b : 4c a6 6a JMP $6aa6 ; (plasma_frame.l7 + 0)
.s6:
6b9e : e6 1b __ INC ACCU + 0 
6ba0 : a5 1b __ LDA ACCU + 0 
6ba2 : c9 c8 __ CMP #$c8
6ba4 : f0 03 __ BEQ $6ba9 ; (plasma_frame.s3 + 0)
6ba6 : 4c 46 6a JMP $6a46 ; (plasma_frame.l5 + 0)
.s3:
6ba9 : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_run: ; tunnel_run()->void
;   6, "/home/xahmol/git/UltimateDemo2026/src/tunnel.h"
.s1:
6baa : a2 06 __ LDX #$06
6bac : b5 53 __ LDA T1 + 0,x 
6bae : 9d df bf STA $bfdf,x ; (tunnel_run@stack + 0)
6bb1 : ca __ __ DEX
6bb2 : 10 f8 __ BPL $6bac ; (tunnel_run.s1 + 2)
.s4:
6bb4 : a9 8f __ LDA #$8f
6bb6 : 20 90 16 JSR $1690 ; (turbo_set.s4 + 0)
6bb9 : 20 7e 6c JSR $6c7e ; (tunnel_build_tables.s4 + 0)
6bbc : 20 c3 6e JSR $6ec3 ; (tunnel_build_tex.s4 + 0)
6bbf : 20 43 6f JSR $6f43 ; (tun_init.s4 + 0)
6bc2 : a9 00 __ LDA #$00
6bc4 : 85 55 __ STA T4 + 0 
6bc6 : 85 56 __ STA T5 + 0 
6bc8 : 85 43 __ STA T0 + 0 
6bca : 85 53 __ STA T1 + 0 
6bcc : 85 59 __ STA T7 + 0 
6bce : 85 57 __ STA T6 + 0 
6bd0 : 85 58 __ STA T6 + 1 
.l5:
6bd2 : a5 57 __ LDA T6 + 0 
6bd4 : 85 1b __ STA ACCU + 0 
6bd6 : a5 58 __ LDA T6 + 1 
6bd8 : 85 1c __ STA ACCU + 1 
6bda : a9 c8 __ LDA #$c8
6bdc : 85 03 __ STA WORK + 0 
6bde : 20 f7 7a JSR $7af7 ; (divmod@proxy + 0)
6be1 : a4 1b __ LDY ACCU + 0 
6be3 : c4 59 __ CPY T7 + 0 
6be5 : f0 2a __ BEQ $6c11 ; (tunnel_run.s6 + 0)
.s12:
6be7 : b9 4a 87 LDA $874a,y ; (pal_sc[0] + 0)
6bea : a2 fa __ LDX #$fa
.l14:
6bec : ca __ __ DEX
6bed : 9d 00 c0 STA $c000,x 
6bf0 : 9d fa c0 STA $c0fa,x 
6bf3 : 9d f4 c1 STA $c1f4,x 
6bf6 : 9d ee c2 STA $c2ee,x 
6bf9 : d0 f1 __ BNE $6bec ; (tunnel_run.l14 + 0)
.s13:
6bfb : b9 4e 87 LDA $874e,y ; (pal_cr[0] + 0)
6bfe : a2 fa __ LDX #$fa
.l16:
6c00 : ca __ __ DEX
6c01 : 9d 00 d8 STA $d800,x 
6c04 : 9d fa d8 STA $d8fa,x 
6c07 : 9d f4 d9 STA $d9f4,x 
6c0a : 9d ee da STA $daee,x 
6c0d : d0 f1 __ BNE $6c00 ; (tunnel_run.l16 + 0)
.s15:
6c0f : 84 59 __ STY T7 + 0 
.s6:
6c11 : a5 55 __ LDA T4 + 0 
6c13 : 85 12 __ STA P5 
6c15 : a5 56 __ LDA T5 + 0 
6c17 : 85 13 __ STA P6 
6c19 : a5 43 __ LDA T0 + 0 
6c1b : 85 54 __ STA T2 + 0 
6c1d : 29 3f __ AND #$3f
6c1f : aa __ __ TAX
6c20 : bd 52 87 LDA $8752,x ; (lat_wave[0] + 0)
6c23 : 85 14 __ STA P7 
6c25 : a5 53 __ LDA T1 + 0 
6c27 : 29 3f __ AND #$3f
6c29 : aa __ __ TAX
6c2a : bd 92 87 LDA $8792,x ; (vert_wave[0] + 0)
6c2d : 85 15 __ STA P8 
6c2f : 20 97 6f JSR $6f97 ; (tunnel_render.s4 + 0)
.l7:
6c32 : 2c 11 d0 BIT $d011 
6c35 : 30 fb __ BMI $6c32 ; (tunnel_run.l7 + 0)
.l8:
6c37 : 2c 11 d0 BIT $d011 
6c3a : 10 fb __ BPL $6c37 ; (tunnel_run.l8 + 0)
.s9:
6c3c : e6 53 __ INC T1 + 0 
6c3e : a6 54 __ LDX T2 + 0 
6c40 : e8 __ __ INX
6c41 : 86 43 __ STX T0 + 0 
6c43 : e6 56 __ INC T5 + 0 
6c45 : e6 55 __ INC T4 + 0 
6c47 : e6 57 __ INC T6 + 0 
6c49 : d0 02 __ BNE $6c4d ; (tunnel_run.s18 + 0)
.s17:
6c4b : e6 58 __ INC T6 + 1 
.s18:
6c4d : a5 58 __ LDA T6 + 1 
6c4f : c9 03 __ CMP #$03
6c51 : f0 03 __ BEQ $6c56 ; (tunnel_run.s11 + 0)
6c53 : 4c d2 6b JMP $6bd2 ; (tunnel_run.l5 + 0)
.s11:
6c56 : a5 57 __ LDA T6 + 0 
6c58 : c9 20 __ CMP #$20
6c5a : d0 f7 __ BNE $6c53 ; (tunnel_run.s18 + 6)
.s10:
6c5c : a9 00 __ LDA #$00
6c5e : 85 0d __ STA P0 
6c60 : 85 0e __ STA P1 
6c62 : 85 10 __ STA P3 
6c64 : a9 36 __ LDA #$36
6c66 : 85 01 __ STA $01 
6c68 : 20 b0 0f JSR $0fb0 ; (vic_setmode@proxy + 0)
6c6b : a9 00 __ LDA #$00
6c6d : 8d 20 d0 STA $d020 
6c70 : 8d 21 d0 STA $d021 
.s3:
6c73 : a2 06 __ LDX #$06
6c75 : bd df bf LDA $bfdf,x ; (tunnel_run@stack + 0)
6c78 : 95 53 __ STA T1 + 0,x 
6c7a : ca __ __ DEX
6c7b : 10 f8 __ BPL $6c75 ; (tunnel_run.s3 + 2)
6c7d : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_build_tables: ; tunnel_build_tables()->void
; 160, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6c7e : a9 00 __ LDA #$00
6c80 : 85 4d __ STA T4 + 0 
6c82 : a9 97 __ LDA #$97
6c84 : 85 49 __ STA T1 + 0 
6c86 : a9 ff __ LDA #$ff
6c88 : 85 4a __ STA T1 + 1 
.l5:
6c8a : a9 00 __ LDA #$00
6c8c : 85 4e __ STA T5 + 0 
6c8e : a9 b1 __ LDA #$b1
6c90 : 85 4b __ STA T2 + 0 
6c92 : a9 ff __ LDA #$ff
.l6:
6c94 : 85 4c __ STA T2 + 1 
6c96 : 85 10 __ STA P3 
6c98 : a5 49 __ LDA T1 + 0 
6c9a : 85 0d __ STA P0 
6c9c : a5 4a __ LDA T1 + 1 
6c9e : 85 0e __ STA P1 
6ca0 : a5 4b __ LDA T2 + 0 
6ca2 : 85 0f __ STA P2 
6ca4 : 20 0a 6d JSR $6d0a ; (iatan2_5.s4 + 0)
6ca7 : a6 4e __ LDX T5 + 0 
6ca9 : 9d 00 a7 STA $a700,x ; (row_buf[0] + 0)
6cac : a5 4b __ LDA T2 + 0 
6cae : 85 0d __ STA P0 
6cb0 : a5 4c __ LDA T2 + 1 
6cb2 : 85 0e __ STA P1 
6cb4 : a5 49 __ LDA T1 + 0 
6cb6 : 85 0f __ STA P2 
6cb8 : a5 4a __ LDA T1 + 1 
6cba : 85 10 __ STA P3 
6cbc : 20 ee 6d JSR $6dee ; (idist_5.s4 + 0)
6cbf : a6 4e __ LDX T5 + 0 
6cc1 : e8 __ __ INX
6cc2 : 86 4e __ STX T5 + 0 
6cc4 : 9d 4f a7 STA $a74f,x ; (row_buf[0] + 79)
6cc7 : 18 __ __ CLC
6cc8 : a5 0d __ LDA P0 
6cca : 69 02 __ ADC #$02
6ccc : 85 4b __ STA T2 + 0 
6cce : a5 0e __ LDA P1 
6cd0 : 69 00 __ ADC #$00
6cd2 : e0 50 __ CPX #$50
6cd4 : 90 be __ BCC $6c94 ; (tunnel_build_tables.l6 + 0)
.s7:
6cd6 : a5 4d __ LDA T4 + 0 
6cd8 : 85 1b __ STA ACCU + 0 
6cda : a9 d0 __ LDA #$d0
6cdc : 85 0d __ STA P0 
6cde : a9 00 __ LDA #$00
6ce0 : 85 1c __ STA ACCU + 1 
6ce2 : 85 1d __ STA ACCU + 2 
6ce4 : 85 1e __ STA ACCU + 3 
6ce6 : a9 a0 __ LDA #$a0
6ce8 : 20 9e 7b JSR $7b9e ; (mul32by8 + 0)
6ceb : 18 __ __ CLC
6cec : a5 09 __ LDA WORK + 6 
6cee : 69 20 __ ADC #$20
6cf0 : 85 10 __ STA P3 
6cf2 : a5 0a __ LDA WORK + 7 
6cf4 : 69 00 __ ADC #$00
6cf6 : 85 11 __ STA P4 
6cf8 : 20 90 6e JSR $6e90 ; (reu_dma@proxy + 0)
6cfb : e6 49 __ INC T1 + 0 
6cfd : d0 02 __ BNE $6d01 ; (tunnel_build_tables.s9 + 0)
.s8:
6cff : e6 4a __ INC T1 + 1 
.s9:
6d01 : e6 4d __ INC T4 + 0 
6d03 : a5 4d __ LDA T4 + 0 
6d05 : c9 6e __ CMP #$6e
6d07 : 90 81 __ BCC $6c8a ; (tunnel_build_tables.l5 + 0)
.s3:
6d09 : 60 __ __ RTS
--------------------------------------------------------------------
iatan2_5: ; iatan2_5(i16,i16)->u8
; 115, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6d0a : a5 10 __ LDA P3 ; (x + 1)
6d0c : 05 0f __ ORA P2 ; (x + 0)
6d0e : d0 0a __ BNE $6d1a ; (iatan2_5.s5 + 0)
.s37:
6d10 : 85 0f __ STA P2 ; (x + 0)
6d12 : 85 10 __ STA P3 ; (x + 1)
6d14 : a5 0d __ LDA P0 ; (y + 0)
6d16 : 05 0e __ ORA P1 ; (y + 1)
6d18 : f0 77 __ BEQ $6d91 ; (iatan2_5.s3 + 0)
.s5:
6d1a : 24 10 __ BIT P3 ; (x + 1)
6d1c : 30 09 __ BMI $6d27 ; (iatan2_5.s36 + 0)
.s6:
6d1e : a5 0f __ LDA P2 ; (x + 0)
6d20 : 85 43 __ STA T1 + 0 
6d22 : a5 10 __ LDA P3 ; (x + 1)
6d24 : 4c 32 6d JMP $6d32 ; (iatan2_5.s7 + 0)
.s36:
6d27 : 38 __ __ SEC
6d28 : a9 00 __ LDA #$00
6d2a : e5 0f __ SBC P2 ; (x + 0)
6d2c : 85 43 __ STA T1 + 0 
6d2e : a9 00 __ LDA #$00
6d30 : e5 10 __ SBC P3 ; (x + 1)
.s7:
6d32 : a8 __ __ TAY
6d33 : 24 0e __ BIT P1 ; (y + 1)
6d35 : 30 09 __ BMI $6d40 ; (iatan2_5.s35 + 0)
.s8:
6d37 : a5 0d __ LDA P0 ; (y + 0)
6d39 : 85 45 __ STA T3 + 0 
6d3b : a5 0e __ LDA P1 ; (y + 1)
6d3d : 4c 4b 6d JMP $6d4b ; (iatan2_5.s9 + 0)
.s35:
6d40 : 38 __ __ SEC
6d41 : a9 00 __ LDA #$00
6d43 : e5 0d __ SBC P0 ; (y + 0)
6d45 : 85 45 __ STA T3 + 0 
6d47 : a9 00 __ LDA #$00
6d49 : e5 0e __ SBC P1 ; (y + 1)
.s9:
6d4b : 85 46 __ STA T3 + 1 
6d4d : 98 __ __ TYA
6d4e : 30 53 __ BMI $6da3 ; (iatan2_5.s10 + 0)
.s34:
6d50 : c4 46 __ CPY T3 + 1 
6d52 : d0 04 __ BNE $6d58 ; (iatan2_5.s33 + 0)
.s32:
6d54 : a5 43 __ LDA T1 + 0 
6d56 : c5 45 __ CMP T3 + 0 
.s33:
6d58 : 90 49 __ BCC $6da3 ; (iatan2_5.s10 + 0)
.s21:
6d5a : 84 04 __ STY WORK + 1 
6d5c : 24 0e __ BIT P1 ; (y + 1)
6d5e : 30 04 __ BMI $6d64 ; (iatan2_5.s23 + 0)
.s22:
6d60 : a9 ff __ LDA #$ff
6d62 : b0 02 __ BCS $6d66 ; (iatan2_5.s24 + 0)
.s23:
6d64 : a9 00 __ LDA #$00
.s24:
6d66 : 85 44 __ STA T2 + 0 
6d68 : a5 46 __ LDA T3 + 1 
6d6a : 06 45 __ ASL T3 + 0 
6d6c : 2a __ __ ROL
6d6d : 06 45 __ ASL T3 + 0 
6d6f : 2a __ __ ROL
6d70 : 06 45 __ ASL T3 + 0 
6d72 : 2a __ __ ROL
6d73 : 85 1c __ STA ACCU + 1 
6d75 : a5 45 __ LDA T3 + 0 
6d77 : 85 1b __ STA ACCU + 0 
6d79 : a5 43 __ LDA T1 + 0 
6d7b : 85 03 __ STA WORK + 0 
6d7d : 20 16 7c JSR $7c16 ; (divs16 + 0)
6d80 : a5 10 __ LDA P3 ; (x + 1)
6d82 : 30 04 __ BMI $6d88 ; (iatan2_5.s25 + 0)
.s31:
6d84 : 05 0f __ ORA P2 ; (x + 0)
6d86 : d0 10 __ BNE $6d98 ; (iatan2_5.s28 + 0)
.s25:
6d88 : 24 44 __ BIT T2 + 0 
6d8a : 30 06 __ BMI $6d92 ; (iatan2_5.s27 + 0)
.s26:
6d8c : 18 __ __ CLC
6d8d : a5 1b __ LDA ACCU + 0 
6d8f : 69 10 __ ADC #$10
.s3:
6d91 : 60 __ __ RTS
.s27:
6d92 : a9 10 __ LDA #$10
.s38:
6d94 : 38 __ __ SEC
6d95 : e5 1b __ SBC ACCU + 0 
6d97 : 60 __ __ RTS
.s28:
6d98 : 24 44 __ BIT T2 + 0 
6d9a : 10 03 __ BPL $6d9f ; (iatan2_5.s29 + 0)
.s30:
6d9c : a5 1b __ LDA ACCU + 0 
6d9e : 60 __ __ RTS
.s29:
6d9f : a9 20 __ LDA #$20
6da1 : d0 f1 __ BNE $6d94 ; (iatan2_5.s38 + 0)
.s10:
6da3 : 24 10 __ BIT P3 ; (x + 1)
6da5 : 30 04 __ BMI $6dab ; (iatan2_5.s12 + 0)
.s11:
6da7 : a9 ff __ LDA #$ff
6da9 : d0 02 __ BNE $6dad ; (iatan2_5.s13 + 0)
.s12:
6dab : a9 00 __ LDA #$00
.s13:
6dad : 85 47 __ STA T4 + 0 
6daf : 98 __ __ TYA
6db0 : 06 43 __ ASL T1 + 0 
6db2 : 2a __ __ ROL
6db3 : 06 43 __ ASL T1 + 0 
6db5 : 2a __ __ ROL
6db6 : 06 43 __ ASL T1 + 0 
6db8 : 2a __ __ ROL
6db9 : 85 1c __ STA ACCU + 1 
6dbb : a5 43 __ LDA T1 + 0 
6dbd : 85 1b __ STA ACCU + 0 
6dbf : a5 45 __ LDA T3 + 0 
6dc1 : 85 03 __ STA WORK + 0 
6dc3 : a5 46 __ LDA T3 + 1 
6dc5 : 85 04 __ STA WORK + 1 
6dc7 : 20 16 7c JSR $7c16 ; (divs16 + 0)
6dca : a5 0e __ LDA P1 ; (y + 1)
6dcc : 30 04 __ BMI $6dd2 ; (iatan2_5.s14 + 0)
.s20:
6dce : 05 0d __ ORA P0 ; (y + 0)
6dd0 : d0 0e __ BNE $6de0 ; (iatan2_5.s17 + 0)
.s14:
6dd2 : 24 47 __ BIT T4 + 0 
6dd4 : 10 06 __ BPL $6ddc ; (iatan2_5.s15 + 0)
.s16:
6dd6 : 18 __ __ CLC
6dd7 : a5 1b __ LDA ACCU + 0 
6dd9 : 69 18 __ ADC #$18
6ddb : 60 __ __ RTS
.s15:
6ddc : a9 18 __ LDA #$18
6dde : d0 b4 __ BNE $6d94 ; (iatan2_5.s38 + 0)
.s17:
6de0 : 24 47 __ BIT T4 + 0 
6de2 : 10 04 __ BPL $6de8 ; (iatan2_5.s18 + 0)
.s19:
6de4 : a9 08 __ LDA #$08
6de6 : d0 ac __ BNE $6d94 ; (iatan2_5.s38 + 0)
.s18:
6de8 : 18 __ __ CLC
6de9 : a5 1b __ LDA ACCU + 0 
6deb : 69 08 __ ADC #$08
6ded : 60 __ __ RTS
--------------------------------------------------------------------
idist_5: ; idist_5(i16,i16)->u8
; 137, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6dee : a5 0f __ LDA P2 ; (dy + 0)
6df0 : 85 03 __ STA WORK + 0 
6df2 : 85 1b __ STA ACCU + 0 
6df4 : a5 10 __ LDA P3 ; (dy + 1)
6df6 : 85 04 __ STA WORK + 1 
6df8 : 85 1c __ STA ACCU + 1 
6dfa : 20 d4 7b JSR $7bd4 ; (mul16 + 0)
6dfd : a5 05 __ LDA WORK + 2 
6dff : 85 43 __ STA T0 + 0 
6e01 : a5 06 __ LDA WORK + 3 
6e03 : 85 44 __ STA T0 + 1 
6e05 : a5 0d __ LDA P0 ; (dx + 0)
6e07 : 85 03 __ STA WORK + 0 
6e09 : 85 1b __ STA ACCU + 0 
6e0b : a5 0e __ LDA P1 ; (dx + 1)
6e0d : 85 04 __ STA WORK + 1 
6e0f : 85 1c __ STA ACCU + 1 
6e11 : 20 d4 7b JSR $7bd4 ; (mul16 + 0)
6e14 : 18 __ __ CLC
6e15 : a5 05 __ LDA WORK + 2 
6e17 : 65 43 __ ADC T0 + 0 
6e19 : 85 43 __ STA T0 + 0 
6e1b : a5 06 __ LDA WORK + 3 
6e1d : 65 44 __ ADC T0 + 1 
6e1f : 85 44 __ STA T0 + 1 
6e21 : 05 43 __ ORA T0 + 0 
6e23 : f0 64 __ BEQ $6e89 ; (idist_5.s11 + 0)
.s5:
6e25 : a5 44 __ LDA T0 + 1 
6e27 : 4a __ __ LSR
6e28 : 85 46 __ STA T1 + 1 
6e2a : a5 43 __ LDA T0 + 0 
6e2c : 6a __ __ ROR
6e2d : 85 45 __ STA T1 + 0 
6e2f : 05 46 __ ORA T1 + 1 
6e31 : d0 08 __ BNE $6e3b ; (idist_5.l6 + 0)
.s10:
6e33 : a9 01 __ LDA #$01
6e35 : 85 45 __ STA T1 + 0 
6e37 : a9 00 __ LDA #$00
6e39 : 85 46 __ STA T1 + 1 
.l6:
6e3b : a5 45 __ LDA T1 + 0 
6e3d : 85 03 __ STA WORK + 0 
6e3f : 85 47 __ STA T2 + 0 
6e41 : a5 46 __ LDA T1 + 1 
6e43 : 85 04 __ STA WORK + 1 
6e45 : 85 48 __ STA T2 + 1 
6e47 : a5 43 __ LDA T0 + 0 
6e49 : 85 1b __ STA ACCU + 0 
6e4b : a5 44 __ LDA T0 + 1 
6e4d : 85 1c __ STA ACCU + 1 
6e4f : 20 4d 7c JSR $7c4d ; (divmod + 0)
6e52 : 18 __ __ CLC
6e53 : a5 1b __ LDA ACCU + 0 
6e55 : 65 45 __ ADC T1 + 0 
6e57 : 85 45 __ STA T1 + 0 
6e59 : a5 1c __ LDA ACCU + 1 
6e5b : 65 46 __ ADC T1 + 1 
6e5d : 4a __ __ LSR
6e5e : 85 46 __ STA T1 + 1 
6e60 : 66 45 __ ROR T1 + 0 
6e62 : c5 48 __ CMP T2 + 1 
6e64 : 90 d5 __ BCC $6e3b ; (idist_5.l6 + 0)
.s12:
6e66 : d0 24 __ BNE $6e8c ; (idist_5.s13 + 0)
.s9:
6e68 : a5 45 __ LDA T1 + 0 
6e6a : c5 47 __ CMP T2 + 0 
6e6c : 90 cd __ BCC $6e3b ; (idist_5.l6 + 0)
.s7:
6e6e : 85 03 __ STA WORK + 0 
6e70 : a9 20 __ LDA #$20
6e72 : 85 1b __ STA ACCU + 0 
6e74 : a9 03 __ LDA #$03
6e76 : 85 1c __ STA ACCU + 1 
6e78 : a5 46 __ LDA T1 + 1 
6e7a : 85 04 __ STA WORK + 1 
6e7c : 20 4d 7c JSR $7c4d ; (divmod + 0)
6e7f : a5 1c __ LDA ACCU + 1 
6e81 : d0 06 __ BNE $6e89 ; (idist_5.s11 + 0)
.s8:
6e83 : a5 1b __ LDA ACCU + 0 
6e85 : c9 20 __ CMP #$20
6e87 : 90 02 __ BCC $6e8b ; (idist_5.s3 + 0)
.s11:
6e89 : a9 1f __ LDA #$1f
.s3:
6e8b : 60 __ __ RTS
.s13:
6e8c : a5 45 __ LDA T1 + 0 
6e8e : b0 de __ BCS $6e6e ; (idist_5.s7 + 0)
--------------------------------------------------------------------
reu_dma@proxy: ; reu_dma@proxy
6e90 : a5 07 __ LDA WORK + 4 
6e92 : 85 0e __ STA P1 
6e94 : a5 08 __ LDA WORK + 5 
6e96 : 85 0f __ STA P2 
--------------------------------------------------------------------
reu_dma: ; reu_dma(u8,u32,void*,u8)->void
;  94, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6e98 : 78 __ __ SEI
6e99 : a9 00 __ LDA #$00
6e9b : 8d 02 df STA $df02 
6e9e : a9 a7 __ LDA #$a7
6ea0 : 8d 03 df STA $df03 
6ea3 : a5 0e __ LDA P1 ; (reu_addr + 0)
6ea5 : 8d 04 df STA $df04 
6ea8 : a5 0f __ LDA P2 ; (reu_addr + 1)
6eaa : 8d 05 df STA $df05 
6ead : a5 10 __ LDA P3 ; (reu_addr + 2)
6eaf : 8d 06 df STA $df06 
6eb2 : a9 a0 __ LDA #$a0
6eb4 : 8d 07 df STA $df07 
6eb7 : a9 00 __ LDA #$00
6eb9 : 8d 08 df STA $df08 
6ebc : a5 0d __ LDA P0 ; (cmd + 0)
6ebe : 8d 01 df STA $df01 
6ec1 : 58 __ __ CLI
.s3:
6ec2 : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_build_tex: ; tunnel_build_tex()->void
; 182, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6ec3 : a9 00 __ LDA #$00
6ec5 : 85 1b __ STA ACCU + 0 
.l5:
6ec7 : 29 04 __ AND #$04
6ec9 : 4a __ __ LSR
6eca : 4a __ __ LSR
6ecb : f0 02 __ BEQ $6ecf ; (tunnel_build_tex.s14 + 0)
.s13:
6ecd : a9 04 __ LDA #$04
.s14:
6ecf : 85 43 __ STA T1 + 0 
6ed1 : a5 1b __ LDA ACCU + 0 
6ed3 : 0a __ __ ASL
6ed4 : 0a __ __ ASL
6ed5 : 0a __ __ ASL
6ed6 : 0a __ __ ASL
6ed7 : 85 45 __ STA T2 + 0 
6ed9 : a9 00 __ LDA #$00
6edb : 85 1c __ STA ACCU + 1 
6edd : 2a __ __ ROL
6ede : 06 45 __ ASL T2 + 0 
6ee0 : 2a __ __ ROL
6ee1 : 85 46 __ STA T2 + 1 
6ee3 : a5 1b __ LDA ACCU + 0 
6ee5 : 29 03 __ AND #$03
6ee7 : f0 3b __ BEQ $6f24 ; (tunnel_build_tex.s11 + 0)
.l6:
6ee9 : 18 __ __ CLC
6eea : a5 43 __ LDA T1 + 0 
6eec : 65 1c __ ADC ACCU + 1 
6eee : 29 1f __ AND #$1f
6ef0 : aa __ __ TAX
6ef1 : 29 07 __ AND #$07
6ef3 : d0 04 __ BNE $6ef9 ; (tunnel_build_tex.s7 + 0)
.s10:
6ef5 : a9 02 __ LDA #$02
6ef7 : d0 05 __ BNE $6efe ; (tunnel_build_tex.s8 + 0)
.s7:
6ef9 : 8a __ __ TXA
6efa : 29 04 __ AND #$04
6efc : 4a __ __ LSR
6efd : 4a __ __ LSR
.s8:
6efe : aa __ __ TAX
6eff : a5 45 __ LDA T2 + 0 
6f01 : 05 1c __ ORA ACCU + 1 
6f03 : 18 __ __ CLC
6f04 : 69 a0 __ ADC #$a0
6f06 : 85 47 __ STA T5 + 0 
6f08 : a9 a7 __ LDA #$a7
6f0a : 65 46 __ ADC T2 + 1 
6f0c : 85 48 __ STA T5 + 1 
6f0e : 8a __ __ TXA
6f0f : a0 00 __ LDY #$00
6f11 : 91 47 __ STA (T5 + 0),y 
6f13 : e6 1c __ INC ACCU + 1 
6f15 : a5 1c __ LDA ACCU + 1 
6f17 : c9 20 __ CMP #$20
6f19 : d0 ce __ BNE $6ee9 ; (tunnel_build_tex.l6 + 0)
.s9:
6f1b : e6 1b __ INC ACCU + 0 
6f1d : a5 1b __ LDA ACCU + 0 
6f1f : c9 20 __ CMP #$20
6f21 : d0 a4 __ BNE $6ec7 ; (tunnel_build_tex.l5 + 0)
.s3:
6f23 : 60 __ __ RTS
.s11:
6f24 : 85 43 __ STA T1 + 0 
6f26 : a6 45 __ LDX T2 + 0 
.l12:
6f28 : 8a __ __ TXA
6f29 : 05 1c __ ORA ACCU + 1 
6f2b : 18 __ __ CLC
6f2c : 69 a0 __ ADC #$a0
6f2e : a8 __ __ TAY
6f2f : a9 a7 __ LDA #$a7
6f31 : 65 46 __ ADC T2 + 1 
6f33 : 85 44 __ STA T1 + 1 
6f35 : a9 03 __ LDA #$03
6f37 : 91 43 __ STA (T1 + 0),y 
6f39 : e6 1c __ INC ACCU + 1 
6f3b : a5 1c __ LDA ACCU + 1 
6f3d : c9 20 __ CMP #$20
6f3f : d0 e7 __ BNE $6f28 ; (tunnel_build_tex.l12 + 0)
6f41 : f0 d8 __ BEQ $6f1b ; (tunnel_build_tex.s9 + 0)
--------------------------------------------------------------------
tun_init: ; tun_init()->void
; 266, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6f43 : a9 00 __ LDA #$00
6f45 : 85 0f __ STA P2 
6f47 : 85 10 __ STA P3 
6f49 : 85 43 __ STA T0 + 0 
6f4b : 85 0d __ STA P0 
6f4d : a9 35 __ LDA #$35
6f4f : 85 01 __ STA $01 
6f51 : 20 ff 7f JSR $7fff ; (memset@proxy + 0)
6f54 : a9 c0 __ LDA #$c0
6f56 : 85 44 __ STA T0 + 1 
6f58 : a9 00 __ LDA #$00
6f5a : 85 1f __ STA ADDR + 0 
6f5c : f0 02 __ BEQ $6f60 ; (tun_init.l7 + 0)
.s8:
6f5e : e6 44 __ INC T0 + 1 
.l7:
6f60 : a9 f9 __ LDA #$f9
6f62 : a0 00 __ LDY #$00
6f64 : 91 43 __ STA (T0 + 0),y 
6f66 : 18 __ __ CLC
6f67 : a5 44 __ LDA T0 + 1 
6f69 : 69 18 __ ADC #$18
6f6b : 85 20 __ STA ADDR + 1 
6f6d : a9 01 __ LDA #$01
6f6f : a4 43 __ LDY T0 + 0 
6f71 : 91 1f __ STA (ADDR + 0),y 
6f73 : 98 __ __ TYA
6f74 : 18 __ __ CLC
6f75 : 69 01 __ ADC #$01
6f77 : 85 43 __ STA T0 + 0 
6f79 : b0 e3 __ BCS $6f5e ; (tun_init.s8 + 0)
.s9:
6f7b : c9 e8 __ CMP #$e8
6f7d : d0 e1 __ BNE $6f60 ; (tun_init.l7 + 0)
.s6:
6f7f : a5 44 __ LDA T0 + 1 
6f81 : c9 c3 __ CMP #$c3
6f83 : d0 db __ BNE $6f60 ; (tun_init.l7 + 0)
.s5:
6f85 : a9 00 __ LDA #$00
6f87 : 85 0e __ STA P1 
6f89 : 85 10 __ STA P3 
6f8b : 20 66 80 JSR $8066 ; (vic_setmode@proxy + 0)
6f8e : a9 00 __ LDA #$00
6f90 : 8d 21 d0 STA $d021 
6f93 : 8d 20 d0 STA $d020 
.s3:
6f96 : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_render: ; tunnel_render(u8,u8,i8,i8)->void
; 209, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6f97 : 18 __ __ CLC
6f98 : a5 15 __ LDA P8 ; (vert_j + 0)
6f9a : 69 05 __ ADC #$05
6f9c : 85 51 __ STA T12 + 0 
6f9e : a9 00 __ LDA #$00
6fa0 : 85 52 __ STA T13 + 0 
6fa2 : a9 d1 __ LDA #$d1
6fa4 : 85 0d __ STA P0 
.l5:
6fa6 : a5 51 __ LDA T12 + 0 
6fa8 : 85 1b __ STA ACCU + 0 
6faa : a9 00 __ LDA #$00
6fac : 85 1c __ STA ACCU + 1 
6fae : 85 1d __ STA ACCU + 2 
6fb0 : 85 1e __ STA ACCU + 3 
6fb2 : a9 a0 __ LDA #$a0
6fb4 : 20 9e 7b JSR $7b9e ; (mul32by8 + 0)
6fb7 : 18 __ __ CLC
6fb8 : a5 09 __ LDA WORK + 6 
6fba : 69 20 __ ADC #$20
6fbc : 85 10 __ STA P3 
6fbe : a5 0a __ LDA WORK + 7 
6fc0 : 69 00 __ ADC #$00
6fc2 : 85 11 __ STA P4 
6fc4 : 20 90 6e JSR $6e90 ; (reu_dma@proxy + 0)
6fc7 : a5 52 __ LDA T13 + 0 
6fc9 : 4a __ __ LSR
6fca : 4a __ __ LSR
6fcb : 4a __ __ LSR
6fcc : aa __ __ TAX
6fcd : a5 52 __ LDA T13 + 0 
6fcf : 29 07 __ AND #$07
6fd1 : 1d b4 7f ORA $7fb4,x ; (__multab320L + 0)
6fd4 : 85 43 __ STA T1 + 0 
6fd6 : bd c1 7f LDA $7fc1,x ; (__multab320H + 0)
6fd9 : 09 e0 __ ORA #$e0
6fdb : 85 44 __ STA T1 + 1 
6fdd : 38 __ __ SEC
6fde : a9 c7 __ LDA #$c7
6fe0 : e5 52 __ SBC T13 + 0 
6fe2 : aa __ __ TAX
6fe3 : 29 07 __ AND #$07
6fe5 : 85 1c __ STA ACCU + 1 
6fe7 : 8a __ __ TXA
6fe8 : 4a __ __ LSR
6fe9 : 4a __ __ LSR
6fea : 4a __ __ LSR
6feb : 85 1b __ STA ACCU + 0 
6fed : 0a __ __ ASL
6fee : 0a __ __ ASL
6fef : 65 1b __ ADC ACCU + 0 
6ff1 : 4a __ __ LSR
6ff2 : 6a __ __ ROR
6ff3 : aa __ __ TAX
6ff4 : 29 80 __ AND #$80
6ff6 : 6a __ __ ROR
6ff7 : 05 1c __ ORA ACCU + 1 
6ff9 : 85 1b __ STA ACCU + 0 
6ffb : 8a __ __ TXA
6ffc : 29 3f __ AND #$3f
6ffe : 69 e0 __ ADC #$e0
7000 : 85 1c __ STA ACCU + 1 
7002 : a9 00 __ LDA #$00
7004 : 85 1d __ STA ACCU + 2 
.l6:
7006 : 0a __ __ ASL
7007 : 18 __ __ CLC
7008 : 65 14 __ ADC P7 ; (lat_j + 0)
700a : 85 45 __ STA T4 + 0 
700c : aa __ __ TAX
700d : a8 __ __ TAY
700e : c8 __ __ INY
700f : 24 45 __ BIT T4 + 0 
7011 : 10 03 __ BPL $7016 ; (tunnel_render.s7 + 0)
7013 : 4c 23 71 JMP $7123 ; (tunnel_render.s13 + 0)
.s7:
7016 : a9 4f __ LDA #$4f
7018 : c5 45 __ CMP T4 + 0 
701a : b0 02 __ BCS $701e ; (tunnel_render.s8 + 0)
.s12:
701c : 85 45 __ STA T4 + 0 
.s8:
701e : 8a __ __ TXA
701f : 30 06 __ BMI $7027 ; (tunnel_render.s9 + 0)
.s20:
7021 : c9 4f __ CMP #$4f
7023 : 90 02 __ BCC $7027 ; (tunnel_render.s9 + 0)
.s11:
7025 : a0 4f __ LDY #$4f
.s9:
7027 : 84 47 __ STY T5 + 0 
7029 : a5 13 __ LDA P6 ; (t_dist + 0)
702b : a6 45 __ LDX T4 + 0 
702d : 18 __ __ CLC
702e : 7d 50 a7 ADC $a750,x ; (row_buf[0] + 80)
7031 : 29 1f __ AND #$1f
7033 : 0a __ __ ASL
7034 : 0a __ __ ASL
7035 : 0a __ __ ASL
7036 : 0a __ __ ASL
7037 : 85 49 __ STA T6 + 0 
7039 : a9 00 __ LDA #$00
703b : 2a __ __ ROL
703c : 06 49 __ ASL T6 + 0 
703e : 2a __ __ ROL
703f : 85 4a __ STA T6 + 1 
7041 : bd 00 a7 LDA $a700,x ; (row_buf[0] + 0)
7044 : 85 45 __ STA T4 + 0 
7046 : 65 12 __ ADC P5 ; (t_ang + 0)
7048 : 29 1f __ AND #$1f
704a : 05 49 __ ORA T6 + 0 
704c : 18 __ __ CLC
704d : 69 a0 __ ADC #$a0
704f : 85 4d __ STA T9 + 0 
7051 : a9 a7 __ LDA #$a7
7053 : 65 4a __ ADC T6 + 1 
7055 : 85 4e __ STA T9 + 1 
7057 : a0 00 __ LDY #$00
7059 : b1 4d __ LDA (T9 + 0),y 
705b : aa __ __ TAX
705c : 4a __ __ LSR
705d : 85 50 __ STA T10 + 1 
705f : 98 __ __ TYA
7060 : 6a __ __ ROR
7061 : 66 50 __ ROR T10 + 1 
7063 : 6a __ __ ROR
7064 : 85 4f __ STA T10 + 0 
7066 : 8a __ __ TXA
7067 : 0a __ __ ASL
7068 : 0a __ __ ASL
7069 : 0a __ __ ASL
706a : 0a __ __ ASL
706b : 05 4f __ ORA T10 + 0 
706d : 85 4d __ STA T9 + 0 
706f : a6 47 __ LDX T5 + 0 
7071 : bd 50 a7 LDA $a750,x ; (row_buf[0] + 80)
7074 : 18 __ __ CLC
7075 : 65 13 __ ADC P6 ; (t_dist + 0)
7077 : 29 1f __ AND #$1f
7079 : 0a __ __ ASL
707a : 0a __ __ ASL
707b : 0a __ __ ASL
707c : 0a __ __ ASL
707d : 85 4b __ STA T7 + 0 
707f : 98 __ __ TYA
7080 : 2a __ __ ROL
7081 : 06 4b __ ASL T7 + 0 
7083 : 2a __ __ ROL
7084 : 85 4c __ STA T7 + 1 
7086 : bd 00 a7 LDA $a700,x ; (row_buf[0] + 0)
7089 : 85 47 __ STA T5 + 0 
708b : 65 12 __ ADC P5 ; (t_ang + 0)
708d : 29 1f __ AND #$1f
708f : 05 4b __ ORA T7 + 0 
7091 : 18 __ __ CLC
7092 : 69 a0 __ ADC #$a0
7094 : 85 4f __ STA T10 + 0 
7096 : a9 a7 __ LDA #$a7
7098 : 65 4c __ ADC T7 + 1 
709a : 85 50 __ STA T10 + 1 
709c : b1 4f __ LDA (T10 + 0),y 
709e : 0a __ __ ASL
709f : 0a __ __ ASL
70a0 : 05 4d __ ORA T9 + 0 
70a2 : 11 4f __ ORA (T10 + 0),y 
70a4 : 91 43 __ STA (T1 + 0),y 
70a6 : 38 __ __ SEC
70a7 : a9 20 __ LDA #$20
70a9 : e5 45 __ SBC T4 + 0 
70ab : 18 __ __ CLC
70ac : 65 12 __ ADC P5 ; (t_ang + 0)
70ae : 29 1f __ AND #$1f
70b0 : 05 49 __ ORA T6 + 0 
70b2 : 18 __ __ CLC
70b3 : 69 a0 __ ADC #$a0
70b5 : 85 45 __ STA T4 + 0 
70b7 : a9 a7 __ LDA #$a7
70b9 : 65 4a __ ADC T6 + 1 
70bb : 85 46 __ STA T4 + 1 
70bd : b1 45 __ LDA (T4 + 0),y 
70bf : aa __ __ TAX
70c0 : 4a __ __ LSR
70c1 : 85 4a __ STA T6 + 1 
70c3 : 98 __ __ TYA
70c4 : 6a __ __ ROR
70c5 : 66 4a __ ROR T6 + 1 
70c7 : 6a __ __ ROR
70c8 : 85 49 __ STA T6 + 0 
70ca : 8a __ __ TXA
70cb : 0a __ __ ASL
70cc : 0a __ __ ASL
70cd : 0a __ __ ASL
70ce : 0a __ __ ASL
70cf : 05 49 __ ORA T6 + 0 
70d1 : 85 45 __ STA T4 + 0 
70d3 : 38 __ __ SEC
70d4 : a9 20 __ LDA #$20
70d6 : e5 47 __ SBC T5 + 0 
70d8 : 18 __ __ CLC
70d9 : 65 12 __ ADC P5 ; (t_ang + 0)
70db : 29 1f __ AND #$1f
70dd : 05 4b __ ORA T7 + 0 
70df : 18 __ __ CLC
70e0 : 69 a0 __ ADC #$a0
70e2 : 85 47 __ STA T5 + 0 
70e4 : a9 a7 __ LDA #$a7
70e6 : 65 4c __ ADC T7 + 1 
70e8 : 85 48 __ STA T5 + 1 
70ea : b1 47 __ LDA (T5 + 0),y 
70ec : 0a __ __ ASL
70ed : 0a __ __ ASL
70ee : 05 45 __ ORA T4 + 0 
70f0 : 11 47 __ ORA (T5 + 0),y 
70f2 : 91 1b __ STA (ACCU + 0),y 
70f4 : 18 __ __ CLC
70f5 : a5 43 __ LDA T1 + 0 
70f7 : 69 08 __ ADC #$08
70f9 : 85 43 __ STA T1 + 0 
70fb : 90 03 __ BCC $7100 ; (tunnel_render.s17 + 0)
.s16:
70fd : e6 44 __ INC T1 + 1 
70ff : 18 __ __ CLC
.s17:
7100 : a5 1b __ LDA ACCU + 0 
7102 : 69 08 __ ADC #$08
7104 : 85 1b __ STA ACCU + 0 
7106 : 90 02 __ BCC $710a ; (tunnel_render.s19 + 0)
.s18:
7108 : e6 1c __ INC ACCU + 1 
.s19:
710a : e6 1d __ INC ACCU + 2 
710c : a5 1d __ LDA ACCU + 2 
710e : c9 28 __ CMP #$28
7110 : f0 03 __ BEQ $7115 ; (tunnel_render.s10 + 0)
7112 : 4c 06 70 JMP $7006 ; (tunnel_render.l6 + 0)
.s10:
7115 : e6 51 __ INC T12 + 0 
7117 : e6 52 __ INC T13 + 0 
7119 : a5 52 __ LDA T13 + 0 
711b : c9 64 __ CMP #$64
711d : f0 03 __ BEQ $7122 ; (tunnel_render.s3 + 0)
711f : 4c a6 6f JMP $6fa6 ; (tunnel_render.l5 + 0)
.s3:
7122 : 60 __ __ RTS
.s13:
7123 : a9 00 __ LDA #$00
7125 : 85 45 __ STA T4 + 0 
7127 : 8a __ __ TXA
7128 : 30 03 __ BMI $712d ; (tunnel_render.s15 + 0)
712a : 4c 21 70 JMP $7021 ; (tunnel_render.s20 + 0)
.s15:
712d : e0 ff __ CPX #$ff
712f : 90 03 __ BCC $7134 ; (tunnel_render.s14 + 0)
7131 : 4c 1e 70 JMP $701e ; (tunnel_render.s8 + 0)
.s14:
7134 : a0 00 __ LDY #$00
7136 : 4c 27 70 JMP $7027 ; (tunnel_render.s9 + 0)
--------------------------------------------------------------------
flower_run: ; flower_run()->void
;   3, "/home/xahmol/git/UltimateDemo2026/src/flower.h"
.s1:
7139 : a2 03 __ LDX #$03
713b : b5 53 __ LDA T1 + 0,x 
713d : 9d d9 bf STA $bfd9,x ; (flower_run@stack + 0)
7140 : ca __ __ DEX
7141 : 10 f8 __ BPL $713b ; (flower_run.s1 + 2)
.s4:
7143 : a9 8f __ LDA #$8f
7145 : 20 90 16 JSR $1690 ; (turbo_set.s4 + 0)
7148 : 20 f7 71 JSR $71f7 ; (flower_init.s1 + 0)
714b : a9 00 __ LDA #$00
714d : 85 53 __ STA T1 + 0 
714f : 85 54 __ STA T2 + 0 
7151 : 85 55 __ STA T3 + 0 
7153 : 85 56 __ STA T3 + 1 
7155 : a9 05 __ LDA #$05
7157 : 85 0f __ STA P2 
7159 : a9 da __ LDA #$da
715b : 85 10 __ STA P3 
715d : a9 87 __ LDA #$87
715f : 85 11 __ STA P4 
.l5:
7161 : 20 de 73 JSR $73de ; (flower_frame@proxy + 0)
.l6:
7164 : 2c 11 d0 BIT $d011 
7167 : 30 fb __ BMI $7164 ; (flower_run.l6 + 0)
.l7:
7169 : 2c 11 d0 BIT $d011 
716c : 10 fb __ BPL $7169 ; (flower_run.l7 + 0)
.s8:
716e : a5 55 __ LDA T3 + 0 
7170 : 29 03 __ AND #$03
7172 : d0 02 __ BNE $7176 ; (flower_run.s9 + 0)
.s23:
7174 : e6 54 __ INC T2 + 0 
.s9:
7176 : 18 __ __ CLC
7177 : a5 0d __ LDA P0 
7179 : 69 02 __ ADC #$02
717b : 85 53 __ STA T1 + 0 
717d : e6 55 __ INC T3 + 0 
717f : d0 02 __ BNE $7183 ; (flower_run.s25 + 0)
.s24:
7181 : e6 56 __ INC T3 + 1 
.s25:
7183 : a6 56 __ LDX T3 + 1 
7185 : ca __ __ DEX
7186 : d0 d9 __ BNE $7161 ; (flower_run.l5 + 0)
.s22:
7188 : a5 55 __ LDA T3 + 0 
718a : c9 2c __ CMP #$2c
718c : d0 d3 __ BNE $7161 ; (flower_run.l5 + 0)
.s10:
718e : 86 55 __ STX T3 + 0 
7190 : 86 56 __ STX T3 + 1 
7192 : a9 04 __ LDA #$04
7194 : 85 0f __ STA P2 
7196 : a9 df __ LDA #$df
7198 : 85 10 __ STA P3 
719a : a9 87 __ LDA #$87
719c : 85 11 __ STA P4 
.l11:
719e : 20 de 73 JSR $73de ; (flower_frame@proxy + 0)
.l12:
71a1 : 2c 11 d0 BIT $d011 
71a4 : 30 fb __ BMI $71a1 ; (flower_run.l12 + 0)
.l13:
71a6 : 2c 11 d0 BIT $d011 
71a9 : 10 fb __ BPL $71a6 ; (flower_run.l13 + 0)
.s14:
71ab : a5 55 __ LDA T3 + 0 
71ad : 29 03 __ AND #$03
71af : d0 02 __ BNE $71b3 ; (flower_run.s15 + 0)
.s21:
71b1 : e6 54 __ INC T2 + 0 
.s15:
71b3 : e6 53 __ INC T1 + 0 
71b5 : e6 55 __ INC T3 + 0 
71b7 : d0 02 __ BNE $71bb ; (flower_run.s27 + 0)
.s26:
71b9 : e6 56 __ INC T3 + 1 
.s27:
71bb : a6 56 __ LDX T3 + 1 
71bd : ca __ __ DEX
71be : d0 de __ BNE $719e ; (flower_run.l11 + 0)
.s20:
71c0 : a5 55 __ LDA T3 + 0 
71c2 : c9 2c __ CMP #$2c
71c4 : d0 d8 __ BNE $719e ; (flower_run.l11 + 0)
.s16:
71c6 : a9 20 __ LDA #$20
71c8 : a2 fa __ LDX #$fa
.l18:
71ca : ca __ __ DEX
71cb : 9d 00 04 STA $0400,x 
71ce : 9d fa 04 STA $04fa,x 
71d1 : 9d f4 05 STA $05f4,x 
71d4 : 9d ee 06 STA $06ee,x 
71d7 : d0 f1 __ BNE $71ca ; (flower_run.l18 + 0)
.s17:
71d9 : a9 01 __ LDA #$01
71db : a2 fa __ LDX #$fa
.l19:
71dd : ca __ __ DEX
71de : 9d 00 d8 STA $d800,x 
71e1 : 9d fa d8 STA $d8fa,x 
71e4 : 9d f4 d9 STA $d9f4,x 
71e7 : 9d ee da STA $daee,x 
71ea : d0 f1 __ BNE $71dd ; (flower_run.l19 + 0)
.s3:
71ec : a2 03 __ LDX #$03
71ee : bd d9 bf LDA $bfd9,x ; (flower_run@stack + 0)
71f1 : 95 53 __ STA T1 + 0,x 
71f3 : ca __ __ DEX
71f4 : 10 f8 __ BPL $71ee ; (flower_run.s3 + 2)
71f6 : 60 __ __ RTS
--------------------------------------------------------------------
flower_init: ; flower_init()->void
;  70, "/home/xahmol/git/UltimateDemo2026/src/flower.c"
.s1:
71f7 : a2 03 __ LDX #$03
71f9 : b5 53 __ LDA T10 + 0,x 
71fb : 9d e1 bf STA $bfe1,x ; (flower_init@stack + 0)
71fe : ca __ __ DEX
71ff : 10 f8 __ BPL $71f9 ; (flower_init.s1 + 2)
.s4:
7201 : a9 00 __ LDA #$00
7203 : 85 53 __ STA T10 + 0 
7205 : 85 54 __ STA T11 + 0 
7207 : 85 43 __ STA T0 + 0 
7209 : 85 44 __ STA T0 + 1 
.l5:
720b : 38 __ __ SEC
720c : a5 53 __ LDA T10 + 0 
720e : e9 13 __ SBC #$13
7210 : 85 45 __ STA T1 + 0 
7212 : a9 00 __ LDA #$00
7214 : e9 00 __ SBC #$00
7216 : 85 46 __ STA T1 + 1 
7218 : 38 __ __ SEC
7219 : a9 00 __ LDA #$00
721b : e5 45 __ SBC T1 + 0 
721d : 85 47 __ STA T2 + 0 
721f : a9 00 __ LDA #$00
7221 : e5 46 __ SBC T1 + 1 
7223 : 85 48 __ STA T2 + 1 
7225 : 24 46 __ BIT T1 + 1 
7227 : 30 0b __ BMI $7234 ; (flower_init.s6 + 0)
.s7:
7229 : a9 00 __ LDA #$00
722b : 85 55 __ STA T12 + 0 
722d : a5 46 __ LDA T1 + 1 
722f : a6 45 __ LDX T1 + 0 
7231 : 4c 3a 72 JMP $723a ; (flower_init.s8 + 0)
.s6:
7234 : a2 01 __ LDX #$01
7236 : 86 55 __ STX T12 + 0 
7238 : a6 47 __ LDX T2 + 0 
.s8:
723a : 86 49 __ STX T3 + 0 
723c : a8 __ __ TAY
723d : a5 54 __ LDA T11 + 0 
723f : 0a __ __ ASL
7240 : 85 1b __ STA ACCU + 0 
7242 : a9 00 __ LDA #$00
7244 : 2a __ __ ROL
7245 : 06 1b __ ASL ACCU + 0 
7247 : 2a __ __ ROL
7248 : aa __ __ TAX
7249 : a5 1b __ LDA ACCU + 0 
724b : 65 54 __ ADC T11 + 0 
724d : 90 01 __ BCC $7250 ; (flower_init.s40 + 0)
.s39:
724f : e8 __ __ INX
.s40:
7250 : 38 __ __ SEC
7251 : e9 3c __ SBC #$3c
7253 : 85 4a __ STA T4 + 0 
7255 : b0 01 __ BCS $7258 ; (flower_init.s42 + 0)
.s41:
7257 : ca __ __ DEX
.s42:
7258 : 8a __ __ TXA
7259 : 0a __ __ ASL
725a : a9 00 __ LDA #$00
725c : 69 ff __ ADC #$ff
725e : 49 03 __ EOR #$03
7260 : 29 03 __ AND #$03
7262 : 18 __ __ CLC
7263 : 65 4a __ ADC T4 + 0 
7265 : 85 4a __ STA T4 + 0 
7267 : 8a __ __ TXA
7268 : 69 00 __ ADC #$00
726a : c9 80 __ CMP #$80
726c : 6a __ __ ROR
726d : 66 4a __ ROR T4 + 0 
726f : c9 80 __ CMP #$80
7271 : 6a __ __ ROR
7272 : 66 4a __ ROR T4 + 0 
7274 : 85 4b __ STA T4 + 1 
7276 : 38 __ __ SEC
7277 : a9 00 __ LDA #$00
7279 : e5 4a __ SBC T4 + 0 
727b : 85 4c __ STA T5 + 0 
727d : a9 00 __ LDA #$00
727f : e5 4b __ SBC T4 + 1 
7281 : 85 4d __ STA T5 + 1 
7283 : 24 4b __ BIT T4 + 1 
7285 : 30 0b __ BMI $7292 ; (flower_init.s9 + 0)
.s10:
7287 : a9 00 __ LDA #$00
7289 : 85 56 __ STA T13 + 0 
728b : a5 4b __ LDA T4 + 1 
728d : a6 4a __ LDX T4 + 0 
728f : 4c 98 72 JMP $7298 ; (flower_init.s11 + 0)
.s9:
7292 : a2 01 __ LDX #$01
7294 : 86 56 __ STX T13 + 0 
7296 : a6 4c __ LDX T5 + 0 
.s11:
7298 : 84 51 __ STY T8 + 1 
729a : 86 1b __ STX ACCU + 0 
729c : 86 4e __ STX T7 + 0 
729e : 85 1c __ STA ACCU + 1 
72a0 : 85 4f __ STA T7 + 1 
72a2 : a5 49 __ LDA T3 + 0 
72a4 : 85 50 __ STA T8 + 0 
72a6 : a5 56 __ LDA T13 + 0 
72a8 : f0 03 __ BEQ $72ad ; (flower_init.s12 + 0)
72aa : 4c d0 73 JMP $73d0 ; (flower_init.s38 + 0)
.s12:
72ad : a5 55 __ LDA T12 + 0 
72af : f0 02 __ BEQ $72b3 ; (flower_init.s13 + 0)
.s37:
72b1 : a9 02 __ LDA #$02
.s13:
72b3 : 85 52 __ STA T9 + 0 
72b5 : 98 __ __ TYA
72b6 : c4 1c __ CPY ACCU + 1 
72b8 : d0 08 __ BNE $72c2 ; (flower_init.s36 + 0)
.s33:
72ba : a5 49 __ LDA T3 + 0 
72bc : c5 1b __ CMP ACCU + 0 
.s34:
72be : 90 08 __ BCC $72c8 ; (flower_init.s32 + 0)
72c0 : b0 18 __ BCS $72da ; (flower_init.s14 + 0)
.s36:
72c2 : 45 1c __ EOR ACCU + 1 
72c4 : 10 f8 __ BPL $72be ; (flower_init.s34 + 0)
.s35:
72c6 : 90 12 __ BCC $72da ; (flower_init.s14 + 0)
.s32:
72c8 : 86 50 __ STX T8 + 0 
72ca : 84 4f __ STY T7 + 1 
72cc : a5 1c __ LDA ACCU + 1 
72ce : 85 51 __ STA T8 + 1 
72d0 : a5 49 __ LDA T3 + 0 
72d2 : 85 4e __ STA T7 + 0 
72d4 : a5 52 __ LDA T9 + 0 
72d6 : 49 01 __ EOR #$01
72d8 : 85 52 __ STA T9 + 0 
.s14:
72da : a5 50 __ LDA T8 + 0 
72dc : 05 51 __ ORA T8 + 1 
72de : f0 1e __ BEQ $72fe ; (flower_init.s31 + 0)
.s15:
72e0 : a5 4f __ LDA T7 + 1 
72e2 : 06 4e __ ASL T7 + 0 
72e4 : 2a __ __ ROL
72e5 : 06 4e __ ASL T7 + 0 
72e7 : 2a __ __ ROL
72e8 : 06 4e __ ASL T7 + 0 
72ea : 2a __ __ ROL
72eb : 85 1c __ STA ACCU + 1 
72ed : a5 4e __ LDA T7 + 0 
72ef : 85 1b __ STA ACCU + 0 
72f1 : a5 50 __ LDA T8 + 0 
72f3 : 85 03 __ STA WORK + 0 
72f5 : a5 51 __ LDA T8 + 1 
72f7 : 85 04 __ STA WORK + 1 
72f9 : 20 16 7c JSR $7c16 ; (divs16 + 0)
72fc : a5 1b __ LDA ACCU + 0 
.s31:
72fe : 85 49 __ STA T3 + 0 
7300 : a5 43 __ LDA T0 + 0 
7302 : 85 1b __ STA ACCU + 0 
7304 : 18 __ __ CLC
7305 : a5 44 __ LDA T0 + 1 
7307 : 69 c0 __ ADC #$c0
7309 : 85 1c __ STA ACCU + 1 
730b : a5 52 __ LDA T9 + 0 
730d : 0a __ __ ASL
730e : 0a __ __ ASL
730f : 0a __ __ ASL
7310 : 18 __ __ CLC
7311 : 65 49 __ ADC T3 + 0 
7313 : 29 3f __ AND #$3f
7315 : a0 00 __ LDY #$00
7317 : 91 1b __ STA (ACCU + 0),y 
7319 : a5 56 __ LDA T13 + 0 
731b : f0 03 __ BEQ $7320 ; (flower_init.s16 + 0)
731d : 4c c0 73 JMP $73c0 ; (flower_init.s30 + 0)
.s16:
7320 : a5 4a __ LDA T4 + 0 
7322 : 85 49 __ STA T3 + 0 
7324 : a4 4b __ LDY T4 + 1 
7326 : a5 55 __ LDA T12 + 0 
7328 : f0 08 __ BEQ $7332 ; (flower_init.s17 + 0)
.s29:
732a : a5 47 __ LDA T2 + 0 
732c : 85 45 __ STA T1 + 0 
732e : a5 48 __ LDA T2 + 1 
7330 : 85 46 __ STA T1 + 1 
.s17:
7332 : 98 __ __ TYA
7333 : c4 46 __ CPY T1 + 1 
7335 : d0 08 __ BNE $733f ; (flower_init.s28 + 0)
.s25:
7337 : a5 49 __ LDA T3 + 0 
7339 : c5 45 __ CMP T1 + 0 
.s26:
733b : b0 08 __ BCS $7345 ; (flower_init.s18 + 0)
733d : 90 1b __ BCC $735a ; (flower_init.s24 + 0)
.s28:
733f : 45 46 __ EOR T1 + 1 
7341 : 10 f8 __ BPL $733b ; (flower_init.s26 + 0)
.s27:
7343 : b0 15 __ BCS $735a ; (flower_init.s24 + 0)
.s18:
7345 : a5 46 __ LDA T1 + 1 
7347 : 0a __ __ ASL
7348 : a5 45 __ LDA T1 + 0 
734a : 69 00 __ ADC #$00
734c : aa __ __ TAX
734d : a5 46 __ LDA T1 + 1 
734f : 69 00 __ ADC #$00
7351 : 4a __ __ LSR
7352 : 8a __ __ TXA
7353 : 6a __ __ ROR
7354 : 18 __ __ CLC
7355 : 65 49 __ ADC T3 + 0 
7357 : 4c 6a 73 JMP $736a ; (flower_init.s19 + 0)
.s24:
735a : 98 __ __ TYA
735b : 0a __ __ ASL
735c : a5 49 __ LDA T3 + 0 
735e : 69 00 __ ADC #$00
7360 : aa __ __ TAX
7361 : 98 __ __ TYA
7362 : 69 00 __ ADC #$00
7364 : 4a __ __ LSR
7365 : 8a __ __ TXA
7366 : 6a __ __ ROR
7367 : 18 __ __ CLC
7368 : 65 45 __ ADC T1 + 0 
.s19:
736a : aa __ __ TAX
736b : a5 43 __ LDA T0 + 0 
736d : 85 47 __ STA T2 + 0 
736f : 18 __ __ CLC
7370 : a5 44 __ LDA T0 + 1 
7372 : 69 c3 __ ADC #$c3
7374 : 85 48 __ STA T2 + 1 
7376 : 8a __ __ TXA
7377 : a0 e8 __ LDY #$e8
7379 : 91 47 __ STA (T2 + 0),y 
737b : e6 53 __ INC T10 + 0 
737d : a5 53 __ LDA T10 + 0 
737f : c9 28 __ CMP #$28
7381 : d0 06 __ BNE $7389 ; (flower_init.s20 + 0)
.s23:
7383 : e6 54 __ INC T11 + 0 
7385 : a9 00 __ LDA #$00
7387 : 85 53 __ STA T10 + 0 
.s20:
7389 : e6 43 __ INC T0 + 0 
738b : d0 02 __ BNE $738f ; (flower_init.s46 + 0)
.s45:
738d : e6 44 __ INC T0 + 1 
.s46:
738f : a5 44 __ LDA T0 + 1 
7391 : c9 03 __ CMP #$03
7393 : f0 03 __ BEQ $7398 ; (flower_init.s22 + 0)
7395 : 4c 0b 72 JMP $720b ; (flower_init.l5 + 0)
.s22:
7398 : a5 43 __ LDA T0 + 0 
739a : c9 e8 __ CMP #$e8
739c : d0 f7 __ BNE $7395 ; (flower_init.s46 + 6)
.s21:
739e : a9 00 __ LDA #$00
73a0 : 85 0d __ STA P0 
73a2 : 85 0e __ STA P1 
73a4 : 85 10 __ STA P3 
73a6 : a9 04 __ LDA #$04
73a8 : 85 0f __ STA P2 
73aa : 20 5f 80 JSR $805f ; (vic_setmode@proxy + 0)
73ad : a9 00 __ LDA #$00
73af : 8d 20 d0 STA $d020 
73b2 : 8d 21 d0 STA $d021 
.s3:
73b5 : a2 03 __ LDX #$03
73b7 : bd e1 bf LDA $bfe1,x ; (flower_init@stack + 0)
73ba : 95 53 __ STA T10 + 0,x 
73bc : ca __ __ DEX
73bd : 10 f8 __ BPL $73b7 ; (flower_init.s3 + 2)
73bf : 60 __ __ RTS
.s30:
73c0 : a5 4c __ LDA T5 + 0 
73c2 : 85 49 __ STA T3 + 0 
73c4 : a4 4d __ LDY T5 + 1 
73c6 : a5 55 __ LDA T12 + 0 
73c8 : d0 03 __ BNE $73cd ; (flower_init.s30 + 13)
73ca : 4c 32 73 JMP $7332 ; (flower_init.s17 + 0)
73cd : 4c 2a 73 JMP $732a ; (flower_init.s29 + 0)
.s38:
73d0 : a5 55 __ LDA T12 + 0 
73d2 : f0 05 __ BEQ $73d9 ; (flower_init.s43 + 0)
.s44:
73d4 : a9 06 __ LDA #$06
73d6 : 4c b3 72 JMP $72b3 ; (flower_init.s13 + 0)
.s43:
73d9 : a9 04 __ LDA #$04
73db : 4c b3 72 JMP $72b3 ; (flower_init.s13 + 0)
--------------------------------------------------------------------
flower_frame@proxy: ; flower_frame@proxy
73de : a5 53 __ LDA $53 
73e0 : 85 0d __ STA P0 
73e2 : a5 54 __ LDA $54 
73e4 : 85 0e __ STA P1 
--------------------------------------------------------------------
flower_frame: ; flower_frame(u8,u8,u8,const u8*)->void
; 121, "/home/xahmol/git/UltimateDemo2026/src/flower.c"
.s4:
73e6 : a9 e8 __ LDA #$e8
73e8 : 85 43 __ STA T3 + 0 
73ea : a9 c3 __ LDA #$c3
73ec : 85 44 __ STA T3 + 1 
73ee : a9 00 __ LDA #$00
73f0 : 85 45 __ STA T4 + 0 
73f2 : a9 c0 __ LDA #$c0
73f4 : 85 46 __ STA T4 + 1 
.l5:
73f6 : a0 00 __ LDY #$00
73f8 : 84 1c __ STY ACCU + 1 
73fa : b1 45 __ LDA (T4 + 0),y 
73fc : 85 47 __ STA T6 + 0 
73fe : 85 1b __ STA ACCU + 0 
7400 : a5 0f __ LDA P2 ; (k + 0)
7402 : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
7405 : a5 1b __ LDA ACCU + 0 
7407 : 38 __ __ SEC
7408 : e5 0d __ SBC P0 ; (t + 0)
740a : 29 3f __ AND #$3f
740c : aa __ __ TAX
740d : bd 00 88 LDA $8800,x ; (cos64[0] + 0)
7410 : 85 48 __ STA T7 + 0 
7412 : 29 80 __ AND #$80
7414 : 10 02 __ BPL $7418 ; (flower_frame.l5 + 34)
7416 : a9 ff __ LDA #$ff
7418 : 85 49 __ STA T7 + 1 
741a : bd 00 88 LDA $8800,x ; (cos64[0] + 0)
741d : 10 0d __ BPL $742c ; (flower_frame.s6 + 0)
.s13:
741f : 38 __ __ SEC
7420 : a9 00 __ LDA #$00
7422 : e5 48 __ SBC T7 + 0 
7424 : 85 48 __ STA T7 + 0 
7426 : a9 00 __ LDA #$00
7428 : e5 49 __ SBC T7 + 1 
742a : 85 49 __ STA T7 + 1 
.s6:
742c : a5 48 __ LDA T7 + 0 
742e : 0a __ __ ASL
742f : 0a __ __ ASL
7430 : 85 1b __ STA ACCU + 0 
7432 : a5 49 __ LDA T7 + 1 
7434 : 2a __ __ ROL
7435 : 06 1b __ ASL ACCU + 0 
7437 : 2a __ __ ROL
7438 : aa __ __ TAX
7439 : 38 __ __ SEC
743a : a5 1b __ LDA ACCU + 0 
743c : e5 48 __ SBC T7 + 0 
743e : 85 48 __ STA T7 + 0 
7440 : 8a __ __ TXA
7441 : e5 49 __ SBC T7 + 1 
7443 : 06 48 __ ASL T7 + 0 
7445 : 2a __ __ ROL
7446 : aa __ __ TAX
7447 : a5 48 __ LDA T7 + 0 
7449 : 86 48 __ STX T7 + 0 
744b : 0a __ __ ASL
744c : 26 48 __ ROL T7 + 0 
744e : a5 48 __ LDA T7 + 0 
7450 : a0 00 __ LDY #$00
7452 : d1 43 __ CMP (T3 + 0),y 
7454 : 90 05 __ BCC $745b ; (flower_frame.s12 + 0)
.s7:
7456 : f1 43 __ SBC (T3 + 0),y 
7458 : 4c 60 74 JMP $7460 ; (flower_frame.s8 + 0)
.s12:
745b : b1 43 __ LDA (T3 + 0),y 
745d : 38 __ __ SEC
745e : e5 48 __ SBC T7 + 0 
.s8:
7460 : c9 08 __ CMP #$08
7462 : aa __ __ TAX
7463 : 90 02 __ BCC $7467 ; (flower_frame.s10 + 0)
.s9:
7465 : a2 07 __ LDX #$07
.s10:
7467 : 84 1c __ STY ACCU + 1 
7469 : a5 45 __ LDA T4 + 0 
746b : 85 48 __ STA T7 + 0 
746d : 18 __ __ CLC
746e : a5 46 __ LDA T4 + 1 
7470 : 69 44 __ ADC #$44
7472 : 85 49 __ STA T7 + 1 
7474 : bd d2 87 LDA $87d2,x ; (char_tab[0] + 0)
7477 : 91 48 __ STA (T7 + 0),y 
7479 : 18 __ __ CLC
747a : a5 0e __ LDA P1 ; (t_slow + 0)
747c : 65 47 __ ADC T6 + 0 
747e : 29 3f __ AND #$3f
7480 : 85 1b __ STA ACCU + 0 
7482 : a5 0f __ LDA P2 ; (k + 0)
7484 : 20 66 7b JSR $7b66 ; (mul16by8 + 0)
7487 : a5 1c __ LDA ACCU + 1 
7489 : 85 47 __ STA T6 + 0 
748b : a5 1b __ LDA ACCU + 0 
748d : 0a __ __ ASL
748e : 26 47 __ ROL T6 + 0 
7490 : 0a __ __ ASL
7491 : 26 47 __ ROL T6 + 0 
7493 : a5 45 __ LDA T4 + 0 
7495 : 85 1f __ STA ADDR + 0 
7497 : 18 __ __ CLC
7498 : a5 46 __ LDA T4 + 1 
749a : 69 18 __ ADC #$18
749c : 85 20 __ STA ADDR + 1 
749e : a4 47 __ LDY T6 + 0 
74a0 : b1 10 __ LDA (P3),y ; (pal + 0)
74a2 : a0 00 __ LDY #$00
74a4 : 91 1f __ STA (ADDR + 0),y 
74a6 : e6 43 __ INC T3 + 0 
74a8 : d0 02 __ BNE $74ac ; (flower_frame.s15 + 0)
.s14:
74aa : e6 44 __ INC T3 + 1 
.s15:
74ac : e6 45 __ INC T4 + 0 
74ae : d0 02 __ BNE $74b2 ; (flower_frame.s17 + 0)
.s16:
74b0 : e6 46 __ INC T4 + 1 
.s17:
74b2 : a5 45 __ LDA T4 + 0 
74b4 : c9 e8 __ CMP #$e8
74b6 : f0 03 __ BEQ $74bb ; (flower_frame.s11 + 0)
74b8 : 4c f6 73 JMP $73f6 ; (flower_frame.l5 + 0)
.s11:
74bb : a5 46 __ LDA T4 + 1 
74bd : c9 c3 __ CMP #$c3
74bf : d0 f7 __ BNE $74b8 ; (flower_frame.s17 + 6)
.s3:
74c1 : 60 __ __ RTS
--------------------------------------------------------------------
scroller_run: ; scroller_run()->void
;   3, "/home/xahmol/git/UltimateDemo2026/src/scroller.h"
.s4:
74c2 : a9 00 __ LDA #$00
74c4 : 8d f9 8a STA $8af9 ; (loops + 0)
74c7 : 8d fa 8a STA $8afa ; (loops + 1)
74ca : 8d f8 8a STA $8af8 ; (done + 0)
74cd : 8d f7 8a STA $8af7 ; (plasma_phase + 0)
74d0 : 8d f6 8a STA $8af6 ; (wave_phase + 0)
74d3 : 8d ff 80 STA $80ff ; (insert_col + 0)
74d6 : 8d fe 86 STA $86fe ; (txt_pos + 0)
74d9 : 8d ff 86 STA $86ff ; (txt_pos + 1)
74dc : a9 07 __ LDA #$07
74de : 8d ff 87 STA $87ff ; (fine_x + 0)
74e1 : 20 e9 75 JSR $75e9 ; (scr_init.s4 + 0)
74e4 : a9 00 __ LDA #$00
74e6 : 8d 20 d0 STA $d020 
.l5:
74e9 : 2c 11 d0 BIT $d011 
74ec : 30 fb __ BMI $74e9 ; (scroller_run.l5 + 0)
.l6:
74ee : 2c 11 d0 BIT $d011 
74f1 : 10 fb __ BPL $74ee ; (scroller_run.l6 + 0)
.s7:
74f3 : a9 00 __ LDA #$00
74f5 : 8d 00 dc STA $dc00 
74f8 : ad 01 dc LDA $dc01 
74fb : 85 43 __ STA T0 + 0 
74fd : a9 ff __ LDA #$ff
74ff : 8d 00 dc STA $dc00 
7502 : c5 43 __ CMP T0 + 0 
7504 : f0 05 __ BEQ $750b ; (scroller_run.s8 + 0)
.s20:
7506 : a9 01 __ LDA #$01
7508 : 8d f8 8a STA $8af8 ; (done + 0)
.s8:
750b : ad ff 87 LDA $87ff ; (fine_x + 0)
750e : f0 06 __ BEQ $7516 ; (scroller_run.s9 + 0)
.s19:
7510 : ce ff 87 DEC $87ff ; (fine_x + 0)
7513 : 4c a6 75 JMP $75a6 ; (scroller_run.s11 + 0)
.s9:
7516 : a9 07 __ LDA #$07
7518 : 8d ff 87 STA $87ff ; (fine_x + 0)
751b : a2 00 __ LDX #$00
.l21:
751d : bd c9 8d LDA $8dc9,x ; (scr_letter[0] + 1)
7520 : 9d c8 8d STA $8dc8,x ; (scr_letter[0] + 0)
7523 : bd c9 8e LDA $8ec9,x ; (scr_col[0] + 1)
7526 : 9d c8 8e STA $8ec8,x ; (scr_col[0] + 0)
7529 : e8 __ __ INX
752a : e0 27 __ CPX #$27
752c : d0 ef __ BNE $751d ; (scroller_run.l21 + 0)
.s22:
752e : 18 __ __ CLC
752f : a9 40 __ LDA #$40
7531 : 6d fe 86 ADC $86fe ; (txt_pos + 0)
7534 : 85 43 __ STA T0 + 0 
7536 : a9 88 __ LDA #$88
7538 : 6d ff 86 ADC $86ff ; (txt_pos + 1)
753b : 85 44 __ STA T0 + 1 
753d : a0 00 __ LDY #$00
753f : b1 43 __ LDA (T0 + 0),y 
7541 : 20 4b 76 JSR $764b ; (letter_idx.s4 + 0)
7544 : aa __ __ TAX
7545 : ad ff 80 LDA $80ff ; (insert_col + 0)
7548 : dd 78 8a CMP $8a78,x ; (letter_width[0] + 0)
754b : b0 0b __ BCS $7558 ; (scroller_run.s10 + 0)
.s18:
754d : 8e ef 8d STX $8def ; (scr_letter[0] + 39)
7550 : 8d ef 8e STA $8eef ; (scr_col[0] + 39)
7553 : ee ff 80 INC $80ff ; (insert_col + 0)
7556 : 90 4e __ BCC $75a6 ; (scroller_run.s11 + 0)
.s10:
7558 : a9 00 __ LDA #$00
755a : 8d ff 80 STA $80ff ; (insert_col + 0)
755d : 8d ef 8e STA $8eef ; (scr_col[0] + 39)
7560 : ad fe 86 LDA $86fe ; (txt_pos + 0)
7563 : 69 00 __ ADC #$00
7565 : 8d fe 86 STA $86fe ; (txt_pos + 0)
7568 : a9 34 __ LDA #$34
756a : 8d ef 8d STA $8def ; (scr_letter[0] + 39)
756d : ad ff 86 LDA $86ff ; (txt_pos + 1)
7570 : 69 00 __ ADC #$00
7572 : 8d ff 86 STA $86ff ; (txt_pos + 1)
7575 : c9 02 __ CMP #$02
7577 : d0 05 __ BNE $757e ; (scroller_run.s17 + 0)
.s16:
7579 : ad fe 86 LDA $86fe ; (txt_pos + 0)
757c : c9 37 __ CMP #$37
.s17:
757e : 90 26 __ BCC $75a6 ; (scroller_run.s11 + 0)
.s13:
7580 : a9 00 __ LDA #$00
7582 : 8d fe 86 STA $86fe ; (txt_pos + 0)
7585 : 8d ff 86 STA $86ff ; (txt_pos + 1)
7588 : ad f9 8a LDA $8af9 ; (loops + 0)
758b : 69 00 __ ADC #$00
758d : 8d f9 8a STA $8af9 ; (loops + 0)
7590 : ad fa 8a LDA $8afa ; (loops + 1)
7593 : 69 00 __ ADC #$00
7595 : 8d fa 8a STA $8afa ; (loops + 1)
7598 : d0 07 __ BNE $75a1 ; (scroller_run.s14 + 0)
.s15:
759a : ad f9 8a LDA $8af9 ; (loops + 0)
759d : c9 02 __ CMP #$02
759f : 90 05 __ BCC $75a6 ; (scroller_run.s11 + 0)
.s14:
75a1 : a9 01 __ LDA #$01
75a3 : 8d f8 8a STA $8af8 ; (done + 0)
.s11:
75a6 : 20 16 77 JSR $7716 ; (draw_frame.s4 + 0)
75a9 : ee f6 8a INC $8af6 ; (wave_phase + 0)
75ac : ee f7 8a INC $8af7 ; (plasma_phase + 0)
75af : ad 16 d0 LDA $d016 
75b2 : 29 f8 __ AND #$f8
75b4 : 0d ff 87 ORA $87ff ; (fine_x + 0)
75b7 : 8d 16 d0 STA $d016 
75ba : ad f8 8a LDA $8af8 ; (done + 0)
75bd : d0 03 __ BNE $75c2 ; (scr_done.s4 + 0)
75bf : 4c e9 74 JMP $74e9 ; (scroller_run.l5 + 0)
--------------------------------------------------------------------
scr_done: ; scr_done()->void
; 366, "/home/xahmol/git/UltimateDemo2026/src/scroller.c"
.s4:
75c2 : ad 16 d0 LDA $d016 
75c5 : 29 f8 __ AND #$f8
75c7 : 8d 16 d0 STA $d016 
75ca : a9 00 __ LDA #$00
75cc : 85 0d __ STA P0 
75ce : 85 0e __ STA P1 
75d0 : 85 10 __ STA P3 
75d2 : 20 b0 0f JSR $0fb0 ; (vic_setmode@proxy + 0)
75d5 : a9 20 __ LDA #$20
75d7 : a2 fa __ LDX #$fa
.l5:
75d9 : ca __ __ DEX
75da : 9d 00 04 STA $0400,x 
75dd : 9d fa 04 STA $04fa,x 
75e0 : 9d f4 05 STA $05f4,x 
75e3 : 9d ee 06 STA $06ee,x 
75e6 : d0 f1 __ BNE $75d9 ; (scr_done.l5 + 0)
.s3:
75e8 : 60 __ __ RTS
--------------------------------------------------------------------
scr_init: ; scr_init()->void
; 346, "/home/xahmol/git/UltimateDemo2026/src/scroller.c"
.s4:
75e9 : a9 00 __ LDA #$00
75eb : 85 0d __ STA P0 
75ed : 85 43 __ STA T0 + 0 
75ef : 85 0e __ STA P1 
75f1 : 85 10 __ STA P3 
75f3 : a9 04 __ LDA #$04
75f5 : 85 44 __ STA T0 + 1 
75f7 : 85 0f __ STA P2 
75f9 : 20 5f 80 JSR $805f ; (vic_setmode@proxy + 0)
75fc : a9 00 __ LDA #$00
75fe : 8d 21 d0 STA $d021 
7601 : 8d 20 d0 STA $d020 
7604 : 85 1f __ STA ADDR + 0 
7606 : f0 02 __ BEQ $760a ; (scr_init.l8 + 0)
.s10:
7608 : e6 44 __ INC T0 + 1 
.l8:
760a : a9 20 __ LDA #$20
760c : a0 00 __ LDY #$00
760e : 91 43 __ STA (T0 + 0),y 
7610 : 18 __ __ CLC
7611 : a5 44 __ LDA T0 + 1 
7613 : 69 d4 __ ADC #$d4
7615 : 85 20 __ STA ADDR + 1 
7617 : a9 06 __ LDA #$06
7619 : a4 43 __ LDY T0 + 0 
761b : 91 1f __ STA (ADDR + 0),y 
761d : 98 __ __ TYA
761e : 18 __ __ CLC
761f : 69 01 __ ADC #$01
7621 : 85 43 __ STA T0 + 0 
7623 : b0 e3 __ BCS $7608 ; (scr_init.s10 + 0)
.s11:
7625 : c9 e8 __ CMP #$e8
7627 : d0 e1 __ BNE $760a ; (scr_init.l8 + 0)
.s7:
7629 : a5 44 __ LDA T0 + 1 
762b : c9 07 __ CMP #$07
762d : d0 db __ BNE $760a ; (scr_init.l8 + 0)
.s5:
762f : a2 00 __ LDX #$00
.l9:
7631 : a9 34 __ LDA #$34
7633 : 9d c8 8d STA $8dc8,x ; (scr_letter[0] + 0)
7636 : a9 00 __ LDA #$00
7638 : 9d c8 8e STA $8ec8,x ; (scr_col[0] + 0)
763b : e8 __ __ INX
763c : e0 28 __ CPX #$28
763e : d0 f1 __ BNE $7631 ; (scr_init.l9 + 0)
.s6:
7640 : ad 16 d0 LDA $d016 
7643 : 29 f8 __ AND #$f8
7645 : 09 07 __ ORA #$07
7647 : 8d 16 d0 STA $d016 
.s3:
764a : 60 __ __ RTS
--------------------------------------------------------------------
letter_idx: ; letter_idx(u8)->u8
; 306, "/home/xahmol/git/UltimateDemo2026/src/scroller.c"
.s4:
764b : c9 61 __ CMP #$61
764d : 90 07 __ BCC $7656 ; (letter_idx.s5 + 0)
.s61:
764f : c9 7b __ CMP #$7b
7651 : b0 03 __ BCS $7656 ; (letter_idx.s5 + 0)
.s62:
7653 : e9 60 __ SBC #$60
.s3:
7655 : 60 __ __ RTS
.s5:
7656 : c9 41 __ CMP #$41
7658 : 90 07 __ BCC $7661 ; (letter_idx.s6 + 0)
.s59:
765a : c9 5b __ CMP #$5b
765c : b0 03 __ BCS $7661 ; (letter_idx.s6 + 0)
.s60:
765e : 69 d9 __ ADC #$d9
7660 : 60 __ __ RTS
.s6:
7661 : c9 30 __ CMP #$30
7663 : b0 03 __ BCS $7668 ; (letter_idx.s57 + 0)
7665 : 4c 0c 77 JMP $770c ; (letter_idx.s7 + 0)
.s57:
7668 : c9 3a __ CMP #$3a
766a : b0 03 __ BCS $766f ; (letter_idx.s8 + 0)
.s58:
766c : 69 05 __ ADC #$05
766e : 60 __ __ RTS
.s8:
766f : c9 2d __ CMP #$2d
7671 : 90 4e __ BCC $76c1 ; (letter_idx.s33 + 0)
.s9:
7673 : c9 3d __ CMP #$3d
7675 : d0 03 __ BNE $767a ; (letter_idx.s10 + 0)
.s32:
7677 : a9 4d __ LDA #$4d
7679 : 60 __ __ RTS
.s10:
767a : 90 24 __ BCC $76a0 ; (letter_idx.s22 + 0)
.s11:
767c : c9 40 __ CMP #$40
767e : d0 03 __ BNE $7683 ; (letter_idx.s12 + 0)
.s21:
7680 : a9 54 __ LDA #$54
7682 : 60 __ __ RTS
.s12:
7683 : 90 11 __ BCC $7696 ; (letter_idx.s18 + 0)
.s13:
7685 : c9 5b __ CMP #$5b
7687 : d0 03 __ BNE $768c ; (letter_idx.s14 + 0)
.s17:
7689 : a9 53 __ LDA #$53
768b : 60 __ __ RTS
.s14:
768c : c9 5d __ CMP #$5d
768e : d0 03 __ BNE $7693 ; (letter_idx.s15 + 0)
.s16:
7690 : a9 55 __ LDA #$55
7692 : 60 __ __ RTS
.s15:
7693 : a9 34 __ LDA #$34
7695 : 60 __ __ RTS
.s18:
7696 : c9 3e __ CMP #$3e
7698 : d0 03 __ BNE $769d ; (letter_idx.s19 + 0)
.s20:
769a : a9 52 __ LDA #$52
769c : 60 __ __ RTS
.s19:
769d : a9 4c __ LDA #$4c
769f : 60 __ __ RTS
.s22:
76a0 : c9 3a __ CMP #$3a
76a2 : d0 03 __ BNE $76a7 ; (letter_idx.s23 + 0)
.s31:
76a4 : a9 3f __ LDA #$3f
76a6 : 60 __ __ RTS
.s23:
76a7 : 90 0a __ BCC $76b3 ; (letter_idx.s27 + 0)
.s24:
76a9 : c9 3b __ CMP #$3b
76ab : d0 03 __ BNE $76b0 ; (letter_idx.s25 + 0)
.s26:
76ad : a9 42 __ LDA #$42
76af : 60 __ __ RTS
.s25:
76b0 : a9 50 __ LDA #$50
76b2 : 60 __ __ RTS
.s27:
76b3 : c9 2e __ CMP #$2e
76b5 : d0 03 __ BNE $76ba ; (letter_idx.s28 + 0)
.s30:
76b7 : a9 40 __ LDA #$40
76b9 : 60 __ __ RTS
.s28:
76ba : c9 2f __ CMP #$2f
76bc : d0 d5 __ BNE $7693 ; (letter_idx.s15 + 0)
.s29:
76be : a9 44 __ LDA #$44
76c0 : 60 __ __ RTS
.s33:
76c1 : c9 26 __ CMP #$26
76c3 : d0 03 __ BNE $76c8 ; (letter_idx.s34 + 0)
.s55:
76c5 : a9 48 __ LDA #$48
76c7 : 60 __ __ RTS
.s34:
76c8 : 90 21 __ BCC $76eb ; (letter_idx.s45 + 0)
.s35:
76ca : c9 29 __ CMP #$29
76cc : d0 03 __ BNE $76d1 ; (letter_idx.s36 + 0)
.s44:
76ce : a9 51 __ LDA #$51
76d0 : 60 __ __ RTS
.s36:
76d1 : 90 0e __ BCC $76e1 ; (letter_idx.s41 + 0)
.s37:
76d3 : c9 2b __ CMP #$2b
76d5 : d0 03 __ BNE $76da ; (letter_idx.s38 + 0)
.s40:
76d7 : a9 4b __ LDA #$4b
76d9 : 60 __ __ RTS
.s38:
76da : c9 2c __ CMP #$2c
76dc : d0 b5 __ BNE $7693 ; (letter_idx.s15 + 0)
.s39:
76de : a9 43 __ LDA #$43
76e0 : 60 __ __ RTS
.s41:
76e1 : c9 27 __ CMP #$27
76e3 : d0 03 __ BNE $76e8 ; (letter_idx.s42 + 0)
.s43:
76e5 : a9 45 __ LDA #$45
76e7 : 60 __ __ RTS
.s42:
76e8 : a9 4f __ LDA #$4f
76ea : 60 __ __ RTS
.s45:
76eb : c9 23 __ CMP #$23
76ed : d0 03 __ BNE $76f2 ; (letter_idx.s46 + 0)
.s54:
76ef : a9 4e __ LDA #$4e
76f1 : 60 __ __ RTS
.s46:
76f2 : 90 0a __ BCC $76fe ; (letter_idx.s50 + 0)
.s47:
76f4 : c9 24 __ CMP #$24
76f6 : d0 03 __ BNE $76fb ; (letter_idx.s48 + 0)
.s49:
76f8 : a9 47 __ LDA #$47
76fa : 60 __ __ RTS
.s48:
76fb : a9 49 __ LDA #$49
76fd : 60 __ __ RTS
.s50:
76fe : c9 21 __ CMP #$21
7700 : d0 03 __ BNE $7705 ; (letter_idx.s51 + 0)
.s53:
7702 : a9 41 __ LDA #$41
7704 : 60 __ __ RTS
.s51:
7705 : c9 22 __ CMP #$22
7707 : d0 8a __ BNE $7693 ; (letter_idx.s15 + 0)
.s52:
7709 : a9 46 __ LDA #$46
770b : 60 __ __ RTS
.s7:
770c : c9 2d __ CMP #$2d
770e : f0 03 __ BEQ $7713 ; (letter_idx.s56 + 0)
7710 : 4c 6f 76 JMP $766f ; (letter_idx.s8 + 0)
.s56:
7713 : a9 4a __ LDA #$4a
7715 : 60 __ __ RTS
--------------------------------------------------------------------
draw_frame: ; draw_frame()->void
; 408, "/home/xahmol/git/UltimateDemo2026/src/scroller.c"
.s4:
7716 : ad f7 8a LDA $8af7 ; (plasma_phase + 0)
7719 : 85 1d __ STA ACCU + 2 
771b : 0a __ __ ASL
771c : 85 1e __ STA ACCU + 3 
771e : a9 00 __ LDA #$00
7720 : 8d fb 8a STA $8afb ; (dp_y + 0)
7723 : 85 1f __ STA ADDR + 0 
7725 : 85 45 __ STA T4 + 0 
.l5:
7727 : ad fb 8a LDA $8afb ; (dp_y + 0)
772a : 85 49 __ STA T7 + 0 
772c : 0a __ __ ASL
772d : 85 1b __ STA ACCU + 0 
772f : a9 00 __ LDA #$00
7731 : 2a __ __ ROL
7732 : 06 1b __ ASL ACCU + 0 
7734 : 2a __ __ ROL
7735 : aa __ __ TAX
7736 : a5 1b __ LDA ACCU + 0 
7738 : 65 49 __ ADC T7 + 0 
773a : 85 1b __ STA ACCU + 0 
773c : 8a __ __ TXA
773d : 69 00 __ ADC #$00
773f : 06 1b __ ASL ACCU + 0 
7741 : 2a __ __ ROL
7742 : 06 1b __ ASL ACCU + 0 
7744 : 2a __ __ ROL
7745 : 06 1b __ ASL ACCU + 0 
7747 : 2a __ __ ROL
7748 : 69 04 __ ADC #$04
774a : 85 46 __ STA T4 + 1 
774c : a5 49 __ LDA T7 + 0 
774e : 0a __ __ ASL
774f : 0a __ __ ASL
7750 : 0a __ __ ASL
7751 : 18 __ __ CLC
7752 : 65 49 __ ADC T7 + 0 
7754 : 18 __ __ CLC
7755 : 65 1e __ ADC ACCU + 3 
7757 : 29 3f __ AND #$3f
7759 : aa __ __ TAX
775a : bd 00 8b LDA $8b00,x ; (psin[0] + 0)
775d : 85 43 __ STA T2 + 0 
775f : a5 1d __ LDA ACCU + 2 
7761 : 85 47 __ STA T5 + 0 
7763 : a9 28 __ LDA #$28
7765 : 85 4a __ STA T8 + 0 
7767 : a4 1b __ LDY ACCU + 0 
.l35:
7769 : a9 a0 __ LDA #$a0
776b : 91 45 __ STA (T4 + 0),y 
776d : a5 47 __ LDA T5 + 0 
776f : 29 3f __ AND #$3f
7771 : aa __ __ TAX
7772 : bd 00 8b LDA $8b00,x ; (psin[0] + 0)
7775 : 18 __ __ CLC
7776 : 65 43 __ ADC T2 + 0 
7778 : 4a __ __ LSR
7779 : aa __ __ TAX
777a : 18 __ __ CLC
777b : a5 46 __ LDA T4 + 1 
777d : 69 d4 __ ADC #$d4
777f : 85 20 __ STA ADDR + 1 
7781 : bd e3 87 LDA $87e3,x ; (pcolor[0] + 0)
7784 : 91 1f __ STA (ADDR + 0),y 
7786 : 18 __ __ CLC
7787 : a5 47 __ LDA T5 + 0 
7789 : 69 05 __ ADC #$05
778b : 85 47 __ STA T5 + 0 
778d : c8 __ __ INY
778e : d0 02 __ BNE $7792 ; (draw_frame.s40 + 0)
.s39:
7790 : e6 46 __ INC T4 + 1 
.s40:
7792 : c6 4a __ DEC T8 + 0 
7794 : d0 d3 __ BNE $7769 ; (draw_frame.l35 + 0)
.s36:
7796 : a6 49 __ LDX T7 + 0 
7798 : e8 __ __ INX
7799 : 8e fb 8a STX $8afb ; (dp_y + 0)
779c : e0 19 __ CPX #$19
779e : 90 87 __ BCC $7727 ; (draw_frame.l5 + 0)
.s6:
77a0 : a9 00 __ LDA #$00
77a2 : 8d fc 8a STA $8afc ; (df_x + 0)
.l7:
77a5 : ae fc 8a LDX $8afc ; (df_x + 0)
77a8 : 86 49 __ STX T7 + 0 
77aa : 86 1d __ STX ACCU + 2 
77ac : bd c8 8e LDA $8ec8,x ; (scr_col[0] + 0)
77af : 85 45 __ STA T4 + 0 
77b1 : d0 0f __ BNE $77c2 ; (draw_frame.s9 + 0)
.s8:
77b3 : ad f6 8a LDA $8af6 ; (wave_phase + 0)
77b6 : 18 __ __ CLC
77b7 : 65 1d __ ADC ACCU + 2 
77b9 : 29 3f __ AND #$3f
77bb : aa __ __ TAX
77bc : bd 40 8b LDA $8b40,x ; (sin_row[0] + 0)
77bf : 8d fd 8a STA $8afd ; (df_yoff + 0)
.s9:
77c2 : ad fd 8a LDA $8afd ; (df_yoff + 0)
77c5 : 18 __ __ CLC
77c6 : 69 0a __ ADC #$0a
77c8 : 85 1e __ STA ACCU + 3 
77ca : 0a __ __ ASL
77cb : 85 1b __ STA ACCU + 0 
77cd : a9 00 __ LDA #$00
77cf : 2a __ __ ROL
77d0 : 06 1b __ ASL ACCU + 0 
77d2 : 2a __ __ ROL
77d3 : aa __ __ TAX
77d4 : a5 1b __ LDA ACCU + 0 
77d6 : 65 1e __ ADC ACCU + 3 
77d8 : 85 43 __ STA T2 + 0 
77da : 8a __ __ TXA
77db : 69 00 __ ADC #$00
77dd : 06 43 __ ASL T2 + 0 
77df : 2a __ __ ROL
77e0 : 06 43 __ ASL T2 + 0 
77e2 : 2a __ __ ROL
77e3 : 06 43 __ ASL T2 + 0 
77e5 : 2a __ __ ROL
77e6 : 85 44 __ STA T2 + 1 
77e8 : a5 43 __ LDA T2 + 0 
77ea : 69 b0 __ ADC #$b0
77ec : a8 __ __ TAY
77ed : a5 44 __ LDA T2 + 1 
77ef : 69 03 __ ADC #$03
77f1 : aa __ __ TAX
77f2 : 98 __ __ TYA
77f3 : 18 __ __ CLC
77f4 : 65 1d __ ADC ACCU + 2 
77f6 : 85 1b __ STA ACCU + 0 
77f8 : 85 1f __ STA ADDR + 0 
77fa : 8a __ __ TXA
77fb : 69 00 __ ADC #$00
77fd : 85 1c __ STA ACCU + 1 
77ff : 18 __ __ CLC
7800 : 69 d4 __ ADC #$d4
7802 : 85 20 __ STA ADDR + 1 
7804 : a9 63 __ LDA #$63
7806 : a0 00 __ LDY #$00
7808 : 91 1b __ STA (ACCU + 0),y 
780a : a9 0b __ LDA #$0b
780c : 91 1f __ STA (ADDR + 0),y 
780e : 38 __ __ SEC
780f : a5 1e __ LDA ACCU + 3 
7811 : e9 01 __ SBC #$01
7813 : aa __ __ TAX
7814 : b0 01 __ BCS $7817 ; (draw_frame.s48 + 0)
.s47:
7816 : 88 __ __ DEY
.s48:
7817 : 0a __ __ ASL
7818 : 85 1b __ STA ACCU + 0 
781a : 98 __ __ TYA
781b : 2a __ __ ROL
781c : 06 1b __ ASL ACCU + 0 
781e : 2a __ __ ROL
781f : 85 1c __ STA ACCU + 1 
7821 : 8a __ __ TXA
7822 : 18 __ __ CLC
7823 : 65 1b __ ADC ACCU + 0 
7825 : 85 1b __ STA ACCU + 0 
7827 : 98 __ __ TYA
7828 : 65 1c __ ADC ACCU + 1 
782a : 06 1b __ ASL ACCU + 0 
782c : 2a __ __ ROL
782d : 06 1b __ ASL ACCU + 0 
782f : 2a __ __ ROL
7830 : 06 1b __ ASL ACCU + 0 
7832 : 2a __ __ ROL
7833 : aa __ __ TAX
7834 : 18 __ __ CLC
7835 : a5 1b __ LDA ACCU + 0 
7837 : 65 1d __ ADC ACCU + 2 
7839 : a8 __ __ TAY
783a : 8a __ __ TXA
783b : 69 04 __ ADC #$04
783d : 85 1c __ STA ACCU + 1 
783f : a9 00 __ LDA #$00
7841 : 85 1f __ STA ADDR + 0 
7843 : 85 1b __ STA ACCU + 0 
7845 : a2 07 __ LDX #$07
7847 : 18 __ __ CLC
.l37:
7848 : a9 20 __ LDA #$20
784a : 91 1b __ STA (ACCU + 0),y 
784c : a5 1c __ LDA ACCU + 1 
784e : 69 d4 __ ADC #$d4
7850 : 85 20 __ STA ADDR + 1 
7852 : a9 00 __ LDA #$00
7854 : 91 1f __ STA (ADDR + 0),y 
7856 : 98 __ __ TYA
7857 : 18 __ __ CLC
7858 : 69 28 __ ADC #$28
785a : a8 __ __ TAY
785b : 90 03 __ BCC $7860 ; (draw_frame.s42 + 0)
.s41:
785d : e6 1c __ INC ACCU + 1 
785f : 18 __ __ CLC
.s42:
7860 : ca __ __ DEX
7861 : d0 e5 __ BNE $7848 ; (draw_frame.l37 + 0)
.s38:
7863 : a9 07 __ LDA #$07
7865 : 8d fe 8a STA $8afe ; (df_r + 0)
7868 : 18 __ __ CLC
7869 : a5 43 __ LDA T2 + 0 
786b : 69 f0 __ ADC #$f0
786d : a4 44 __ LDY T2 + 1 
786f : 90 02 __ BCC $7873 ; (draw_frame.s44 + 0)
.s43:
7871 : c8 __ __ INY
7872 : 18 __ __ CLC
.s44:
7873 : 65 1d __ ADC ACCU + 2 
7875 : 85 43 __ STA T2 + 0 
7877 : 98 __ __ TYA
7878 : 69 04 __ ADC #$04
787a : 85 44 __ STA T2 + 1 
787c : a9 64 __ LDA #$64
787e : a0 00 __ LDY #$00
7880 : 91 43 __ STA (T2 + 0),y 
7882 : 18 __ __ CLC
7883 : a5 44 __ LDA T2 + 1 
7885 : 69 d4 __ ADC #$d4
7887 : 85 44 __ STA T2 + 1 
7889 : a9 0b __ LDA #$0b
788b : 91 43 __ STA (T2 + 0),y 
788d : a4 1d __ LDY ACCU + 2 
788f : b9 c8 8d LDA $8dc8,y ; (scr_letter[0] + 0)
7892 : c9 34 __ CMP #$34
7894 : d0 0e __ BNE $78a4 ; (draw_frame.s11 + 0)
.s10:
7896 : a6 49 __ LDX T7 + 0 
7898 : e8 __ __ INX
7899 : 8e fc 8a STX $8afc ; (df_x + 0)
789c : e0 28 __ CPX #$28
789e : b0 03 __ BCS $78a3 ; (draw_frame.s3 + 0)
78a0 : 4c a5 77 JMP $77a5 ; (draw_frame.l7 + 0)
.s3:
78a3 : 60 __ __ RTS
.s11:
78a4 : 8e fe 8a STX $8afe ; (df_r + 0)
78a7 : 85 4a __ STA T8 + 0 
78a9 : c9 0d __ CMP #$0d
78ab : 8a __ __ TXA
78ac : 6a __ __ ROR
78ad : 85 4b __ STA T9 + 0 
78af : a5 45 __ LDA T4 + 0 
78b1 : 85 43 __ STA T2 + 0 
.l12:
78b3 : ad fe 8a LDA $8afe ; (df_r + 0)
78b6 : 85 4c __ STA T10 + 0 
78b8 : a8 __ __ TAY
78b9 : 18 __ __ CLC
78ba : 65 1e __ ADC ACCU + 3 
78bc : aa __ __ TAX
78bd : a9 00 __ LDA #$00
78bf : 2a __ __ ROL
78c0 : 85 48 __ STA T5 + 1 
78c2 : 8a __ __ TXA
78c3 : 0a __ __ ASL
78c4 : 85 1b __ STA ACCU + 0 
78c6 : a5 48 __ LDA T5 + 1 
78c8 : 2a __ __ ROL
78c9 : 06 1b __ ASL ACCU + 0 
78cb : 2a __ __ ROL
78cc : 85 1c __ STA ACCU + 1 
78ce : 8a __ __ TXA
78cf : 18 __ __ CLC
78d0 : 65 1b __ ADC ACCU + 0 
78d2 : 85 47 __ STA T5 + 0 
78d4 : a5 1c __ LDA ACCU + 1 
78d6 : 65 48 __ ADC T5 + 1 
78d8 : 06 47 __ ASL T5 + 0 
78da : 2a __ __ ROL
78db : 06 47 __ ASL T5 + 0 
78dd : 2a __ __ ROL
78de : 06 47 __ ASL T5 + 0 
78e0 : 2a __ __ ROL
78e1 : aa __ __ TAX
78e2 : 18 __ __ CLC
78e3 : a5 47 __ LDA T5 + 0 
78e5 : 65 1d __ ADC ACCU + 2 
78e7 : 85 47 __ STA T5 + 0 
78e9 : 90 02 __ BCC $78ed ; (draw_frame.s46 + 0)
.s45:
78eb : e8 __ __ INX
78ec : 18 __ __ CLC
.s46:
78ed : b9 ce 7f LDA $7fce,y ; (__multab40L + 0)
78f0 : a4 4a __ LDY T8 + 0 
78f2 : 79 80 8b ADC $8b80,y ; (letter_start[0] + 0)
78f5 : 18 __ __ CLC
78f6 : 65 43 __ ADC T2 + 0 
78f8 : 85 45 __ STA T4 + 0 
78fa : 24 4b __ BIT T9 + 0 
78fc : 30 0a __ BMI $7908 ; (draw_frame.s13 + 0)
.s34:
78fe : 18 __ __ CLC
78ff : 69 00 __ ADC #$00
7901 : 85 1b __ STA ACCU + 0 
7903 : a9 8c __ LDA #$8c
7905 : 4c 4e 79 JMP $794e ; (draw_frame.s18 + 0)
.s13:
7908 : 98 __ __ TYA
7909 : c0 1a __ CPY #$1a
790b : b0 0b __ BCS $7918 ; (draw_frame.s14 + 0)
.s33:
790d : a9 00 __ LDA #$00
790f : 65 45 __ ADC T4 + 0 
7911 : 85 1b __ STA ACCU + 0 
7913 : a9 8d __ LDA #$8d
7915 : 4c 4e 79 JMP $794e ; (draw_frame.s18 + 0)
.s14:
7918 : c9 28 __ CMP #$28
791a : b0 0b __ BCS $7927 ; (draw_frame.s15 + 0)
.s32:
791c : a9 00 __ LDA #$00
791e : 65 45 __ ADC T4 + 0 
7920 : 85 1b __ STA ACCU + 0 
7922 : a9 8e __ LDA #$8e
7924 : 4c 4e 79 JMP $794e ; (draw_frame.s18 + 0)
.s15:
7927 : c9 34 __ CMP #$34
7929 : b0 0b __ BCS $7936 ; (draw_frame.s16 + 0)
.s31:
792b : a9 00 __ LDA #$00
792d : 65 45 __ ADC T4 + 0 
792f : 85 1b __ STA ACCU + 0 
7931 : a9 8f __ LDA #$8f
7933 : 4c 4e 79 JMP $794e ; (draw_frame.s18 + 0)
.s16:
7936 : c9 47 __ CMP #$47
7938 : 90 0c __ BCC $7946 ; (draw_frame.s30 + 0)
.s17:
793a : 18 __ __ CLC
793b : a9 00 __ LDA #$00
793d : 65 45 __ ADC T4 + 0 
793f : 85 1b __ STA ACCU + 0 
7941 : a9 91 __ LDA #$91
7943 : 4c 4e 79 JMP $794e ; (draw_frame.s18 + 0)
.s30:
7946 : a9 00 __ LDA #$00
7948 : 65 45 __ ADC T4 + 0 
794a : 85 1b __ STA ACCU + 0 
794c : a9 90 __ LDA #$90
.s18:
794e : 69 00 __ ADC #$00
7950 : 85 1c __ STA ACCU + 1 
7952 : 8a __ __ TXA
7953 : 18 __ __ CLC
7954 : 69 04 __ ADC #$04
7956 : 85 48 __ STA T5 + 1 
7958 : a0 00 __ LDY #$00
795a : b1 1b __ LDA (ACCU + 0),y 
795c : 91 47 __ STA (T5 + 0),y 
795e : 24 4b __ BIT T9 + 0 
7960 : 30 0c __ BMI $796e ; (draw_frame.s19 + 0)
.s29:
7962 : 18 __ __ CLC
7963 : a9 00 __ LDA #$00
7965 : 65 45 __ ADC T4 + 0 
7967 : 85 45 __ STA T4 + 0 
7969 : a9 92 __ LDA #$92
796b : 4c b5 79 JMP $79b5 ; (draw_frame.s24 + 0)
.s19:
796e : a5 4a __ LDA T8 + 0 
7970 : c9 1a __ CMP #$1a
7972 : b0 0b __ BCS $797f ; (draw_frame.s20 + 0)
.s28:
7974 : a9 00 __ LDA #$00
7976 : 65 45 __ ADC T4 + 0 
7978 : 85 45 __ STA T4 + 0 
797a : a9 93 __ LDA #$93
797c : 4c b5 79 JMP $79b5 ; (draw_frame.s24 + 0)
.s20:
797f : c9 28 __ CMP #$28
7981 : b0 0b __ BCS $798e ; (draw_frame.s21 + 0)
.s27:
7983 : a9 00 __ LDA #$00
7985 : 65 45 __ ADC T4 + 0 
7987 : 85 45 __ STA T4 + 0 
7989 : a9 94 __ LDA #$94
798b : 4c b5 79 JMP $79b5 ; (draw_frame.s24 + 0)
.s21:
798e : c9 34 __ CMP #$34
7990 : b0 0b __ BCS $799d ; (draw_frame.s22 + 0)
.s26:
7992 : a9 00 __ LDA #$00
7994 : 65 45 __ ADC T4 + 0 
7996 : 85 45 __ STA T4 + 0 
7998 : a9 95 __ LDA #$95
799a : 4c b5 79 JMP $79b5 ; (draw_frame.s24 + 0)
.s22:
799d : c9 47 __ CMP #$47
799f : 90 0c __ BCC $79ad ; (draw_frame.s25 + 0)
.s23:
79a1 : 18 __ __ CLC
79a2 : a9 00 __ LDA #$00
79a4 : 65 45 __ ADC T4 + 0 
79a6 : 85 45 __ STA T4 + 0 
79a8 : a9 97 __ LDA #$97
79aa : 4c b5 79 JMP $79b5 ; (draw_frame.s24 + 0)
.s25:
79ad : a9 00 __ LDA #$00
79af : 65 45 __ ADC T4 + 0 
79b1 : 85 45 __ STA T4 + 0 
79b3 : a9 96 __ LDA #$96
.s24:
79b5 : 69 00 __ ADC #$00
79b7 : 85 46 __ STA T4 + 1 
79b9 : 18 __ __ CLC
79ba : a5 48 __ LDA T5 + 1 
79bc : 69 d4 __ ADC #$d4
79be : 85 48 __ STA T5 + 1 
79c0 : b1 45 __ LDA (T4 + 0),y 
79c2 : 91 47 __ STA (T5 + 0),y 
79c4 : a6 4c __ LDX T10 + 0 
79c6 : e8 __ __ INX
79c7 : 8e fe 8a STX $8afe ; (df_r + 0)
79ca : e0 05 __ CPX #$05
79cc : b0 03 __ BCS $79d1 ; (draw_frame.s24 + 28)
79ce : 4c b3 78 JMP $78b3 ; (draw_frame.l12 + 0)
79d1 : 4c 96 78 JMP $7896 ; (draw_frame.s10 + 0)
--------------------------------------------------------------------
modplay_stop: ; modplay_stop()->void
; 249, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s4:
79d4 : 78 __ __ SEI
79d5 : a9 00 __ LDA #$00
79d7 : 8d 4c a0 STA $a04c ; (modplay.active + 0)
79da : 8d 20 df STA $df20 
79dd : 8d 40 df STA $df40 
79e0 : 8d 60 df STA $df60 
79e3 : 8d 80 df STA $df80 
79e6 : ad fe 83 LDA $83fe ; (mod_saved_irq[0] + 0)
79e9 : 8d 14 03 STA $0314 
79ec : ad ff 83 LDA $83ff ; (mod_saved_irq[0] + 1)
79ef : 8d 15 03 STA $0315 
79f2 : a9 7f __ LDA #$7f
79f4 : 8d 0d dc STA $dc0d 
79f7 : a9 25 __ LDA #$25
79f9 : 8d 04 dc STA $dc04 
79fc : a9 4d __ LDA #$4d
79fe : 8d 05 dc STA $dc05 
7a01 : a9 81 __ LDA #$81
7a03 : 8d 0d dc STA $dc0d 
7a06 : a9 01 __ LDA #$01
7a08 : 8d 0e dc STA $dc0e 
7a0b : 58 __ __ CLI
.s3:
7a0c : 60 __ __ RTS
--------------------------------------------------------------------
7a0d : __ __ __ BYT 65 4e 44 20 4f 46 20 64 45 4d 4f 20 73 45 51 55 : eND OF dEMO sEQU
7a1d : __ __ __ BYT 45 4e 43 45 00                                  : ENCE.
--------------------------------------------------------------------
7a22 : __ __ __ BYT 64 45 4d 4f 20 53 45 51 55 45 4e 43 45 20 43 4f : dEMO SEQUENCE CO
7a32 : __ __ __ BYT 4d 50 4c 45 54 45 2e 00                         : MPLETE..
--------------------------------------------------------------------
7a3a : __ __ __ BYT 67 45 41 52 20 00                               : gEAR .
--------------------------------------------------------------------
7a40 : __ __ __ BYT 31 20 54 4f 20 36 34 20 6d 68 5a 2c 20 31 36 20 : 1 TO 64 mhZ, 16 
7a50 : __ __ __ BYT 53 54 45 50 53 00                               : STEPS.
--------------------------------------------------------------------
7a56 : __ __ __ BYT 66 52 41 43 54 00                               : fRACT.
--------------------------------------------------------------------
7a5c : __ __ __ BYT 6d 41 4e 44 45 4c 42 52 4f 54 20 6d 63 20 46 52 : mANDELBROT mc FR
7a6c : __ __ __ BYT 41 43 54 41 4c 00                               : ACTAL.
--------------------------------------------------------------------
7a72 : __ __ __ BYT 62 41 4c 4c 20 00                               : bALL .
--------------------------------------------------------------------
7a78 : __ __ __ BYT 33 64 20 42 41 4c 4c 20 2b 20 47 52 49 44 00    : 3d BALL + GRID.
--------------------------------------------------------------------
7a87 : __ __ __ BYT 76 45 43 54 20 00                               : vECT .
--------------------------------------------------------------------
7a8d : __ __ __ BYT 33 64 20 57 49 52 45 46 52 41 4d 45 20 43 55 42 : 3d WIREFRAME CUB
7a9d : __ __ __ BYT 45 00                                           : E.
--------------------------------------------------------------------
7a9f : __ __ __ BYT 70 4c 41 53 20 00                               : pLAS .
--------------------------------------------------------------------
7aa5 : __ __ __ BYT 70 4c 41 53 4d 41 20 49 4e 54 45 52 46 45 52 45 : pLASMA INTERFERE
7ab5 : __ __ __ BYT 4e 43 45 00                                     : NCE.
--------------------------------------------------------------------
7ab9 : __ __ __ BYT 74 55 4e 4c 20 00                               : tUNL .
--------------------------------------------------------------------
7abf : __ __ __ BYT 33 64 20 54 45 58 54 55 52 45 20 54 55 4e 4e 45 : 3d TEXTURE TUNNE
7acf : __ __ __ BYT 4c 00                                           : L.
--------------------------------------------------------------------
7ad1 : __ __ __ BYT 66 4c 4f 57 20 00                               : fLOW .
--------------------------------------------------------------------
7ad7 : __ __ __ BYT 70 65 74 73 63 69 69 20 50 4f 4c 41 52 20 52 4f : petscii POLAR RO
7ae7 : __ __ __ BYT 53 45 00                                        : SE.
--------------------------------------------------------------------
7aea : __ __ __ BYT 73 43 52 4c 20 00                               : sCRL .
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
7af0 : a9 7f __ LDA #$7f
7af2 : 85 03 __ STA WORK + 0 
7af4 : 4c 16 7c JMP $7c16 ; (divs16 + 0)
--------------------------------------------------------------------
divmod@proxy: ; divmod@proxy
7af7 : a9 00 __ LDA #$00
7af9 : 85 04 __ STA WORK + 1 
7afb : 4c 4d 7c JMP $7c4d ; (divmod + 0)
--------------------------------------------------------------------
_uii_root:
7afe : __ __ __ BYT 2f 00                                           : /.
--------------------------------------------------------------------
7b00 : __ __ __ BYT 70 65 74 73 63 69 69 20 46 4f 4e 54 20 53 43 52 : petscii FONT SCR
7b10 : __ __ __ BYT 4f 4c 4c 45 52 00                               : OLLER.
--------------------------------------------------------------------
7b16 : __ __ __ BYT 34 45 56 2e 4d 4f 44 3a 20 46 4f 52 45 56 45 52 : 4EV.MOD: FOREVER
7b26 : __ __ __ BYT 20 59 4f 55 4e 47 00                            :  YOUNG.
--------------------------------------------------------------------
7b2d : __ __ __ BYT 75 4c 54 49 4d 41 54 45 20 36 34 20 41 54 20 36 : uLTIMATE 64 AT 6
7b3d : __ __ __ BYT 34 20 6d 68 5a 20 54 55 52 42 4f 3a 00          : 4 mhZ TURBO:.
--------------------------------------------------------------------
7b4a : __ __ __ BYT 54 48 45 20 46 41 53 54 45 53 54 20 63 36 34 20 : THE FASTEST c64 
7b5a : __ __ __ BYT 43 4f 4d 50 41 54 49 42 4c 45 2e 00             : COMPATIBLE..
--------------------------------------------------------------------
mul16by8: ; mul16by8
7b66 : 4a __ __ LSR
7b67 : f0 2e __ BEQ $7b97 ; (mul16by8 + 49)
7b69 : a2 00 __ LDX #$00
7b6b : a0 00 __ LDY #$00
7b6d : 90 13 __ BCC $7b82 ; (mul16by8 + 28)
7b6f : a4 1b __ LDY ACCU + 0 
7b71 : a6 1c __ LDX ACCU + 1 
7b73 : b0 0d __ BCS $7b82 ; (mul16by8 + 28)
7b75 : 85 02 __ STA $02 
7b77 : 18 __ __ CLC
7b78 : 98 __ __ TYA
7b79 : 65 1b __ ADC ACCU + 0 
7b7b : a8 __ __ TAY
7b7c : 8a __ __ TXA
7b7d : 65 1c __ ADC ACCU + 1 
7b7f : aa __ __ TAX
7b80 : a5 02 __ LDA $02 
7b82 : 06 1b __ ASL ACCU + 0 
7b84 : 26 1c __ ROL ACCU + 1 
7b86 : 4a __ __ LSR
7b87 : 90 f9 __ BCC $7b82 ; (mul16by8 + 28)
7b89 : d0 ea __ BNE $7b75 ; (mul16by8 + 15)
7b8b : 18 __ __ CLC
7b8c : 98 __ __ TYA
7b8d : 65 1b __ ADC ACCU + 0 
7b8f : 85 1b __ STA ACCU + 0 
7b91 : 8a __ __ TXA
7b92 : 65 1c __ ADC ACCU + 1 
7b94 : 85 1c __ STA ACCU + 1 
7b96 : 60 __ __ RTS
7b97 : b0 04 __ BCS $7b9d ; (mul16by8 + 55)
7b99 : 85 1b __ STA ACCU + 0 
7b9b : 85 1c __ STA ACCU + 1 
7b9d : 60 __ __ RTS
--------------------------------------------------------------------
mul32by8: ; mul32by8
7b9e : a0 00 __ LDY #$00
7ba0 : 84 07 __ STY WORK + 4 
7ba2 : 84 08 __ STY WORK + 5 
7ba4 : 84 09 __ STY WORK + 6 
7ba6 : 4a __ __ LSR
7ba7 : b0 0d __ BCS $7bb6 ; (mul32by8 + 24)
7ba9 : f0 26 __ BEQ $7bd1 ; (mul32by8 + 51)
7bab : 06 1b __ ASL ACCU + 0 
7bad : 26 1c __ ROL ACCU + 1 
7baf : 26 1d __ ROL ACCU + 2 
7bb1 : 26 1e __ ROL ACCU + 3 
7bb3 : 4a __ __ LSR
7bb4 : 90 f5 __ BCC $7bab ; (mul32by8 + 13)
7bb6 : aa __ __ TAX
7bb7 : 18 __ __ CLC
7bb8 : a5 07 __ LDA WORK + 4 
7bba : 65 1b __ ADC ACCU + 0 
7bbc : 85 07 __ STA WORK + 4 
7bbe : a5 08 __ LDA WORK + 5 
7bc0 : 65 1c __ ADC ACCU + 1 
7bc2 : 85 08 __ STA WORK + 5 
7bc4 : a5 09 __ LDA WORK + 6 
7bc6 : 65 1d __ ADC ACCU + 2 
7bc8 : 85 09 __ STA WORK + 6 
7bca : 98 __ __ TYA
7bcb : 65 1e __ ADC ACCU + 3 
7bcd : a8 __ __ TAY
7bce : 8a __ __ TXA
7bcf : d0 da __ BNE $7bab ; (mul32by8 + 13)
7bd1 : 84 0a __ STY WORK + 7 
7bd3 : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
7bd4 : a0 00 __ LDY #$00
7bd6 : 84 06 __ STY WORK + 3 
7bd8 : a5 03 __ LDA WORK + 0 
7bda : a6 04 __ LDX WORK + 1 
7bdc : f0 1c __ BEQ $7bfa ; (mul16 + 38)
7bde : 38 __ __ SEC
7bdf : 6a __ __ ROR
7be0 : 90 0d __ BCC $7bef ; (mul16 + 27)
7be2 : aa __ __ TAX
7be3 : 18 __ __ CLC
7be4 : 98 __ __ TYA
7be5 : 65 1b __ ADC ACCU + 0 
7be7 : a8 __ __ TAY
7be8 : a5 06 __ LDA WORK + 3 
7bea : 65 1c __ ADC ACCU + 1 
7bec : 85 06 __ STA WORK + 3 
7bee : 8a __ __ TXA
7bef : 06 1b __ ASL ACCU + 0 
7bf1 : 26 1c __ ROL ACCU + 1 
7bf3 : 4a __ __ LSR
7bf4 : 90 f9 __ BCC $7bef ; (mul16 + 27)
7bf6 : d0 ea __ BNE $7be2 ; (mul16 + 14)
7bf8 : a5 04 __ LDA WORK + 1 
7bfa : 4a __ __ LSR
7bfb : 90 0d __ BCC $7c0a ; (mul16 + 54)
7bfd : aa __ __ TAX
7bfe : 18 __ __ CLC
7bff : 98 __ __ TYA
7c00 : 65 1b __ ADC ACCU + 0 
7c02 : a8 __ __ TAY
7c03 : a5 06 __ LDA WORK + 3 
7c05 : 65 1c __ ADC ACCU + 1 
7c07 : 85 06 __ STA WORK + 3 
7c09 : 8a __ __ TXA
7c0a : 06 1b __ ASL ACCU + 0 
7c0c : 26 1c __ ROL ACCU + 1 
7c0e : 4a __ __ LSR
7c0f : b0 ec __ BCS $7bfd ; (mul16 + 41)
7c11 : d0 f7 __ BNE $7c0a ; (mul16 + 54)
7c13 : 84 05 __ STY WORK + 2 
7c15 : 60 __ __ RTS
--------------------------------------------------------------------
divs16: ; divs16
7c16 : 24 1c __ BIT ACCU + 1 
7c18 : 10 0d __ BPL $7c27 ; (divs16 + 17)
7c1a : 20 31 7c JSR $7c31 ; (negaccu + 0)
7c1d : 24 04 __ BIT WORK + 1 
7c1f : 10 0d __ BPL $7c2e ; (divs16 + 24)
7c21 : 20 3f 7c JSR $7c3f ; (negtmp + 0)
7c24 : 4c 4d 7c JMP $7c4d ; (divmod + 0)
7c27 : 24 04 __ BIT WORK + 1 
7c29 : 10 f9 __ BPL $7c24 ; (divs16 + 14)
7c2b : 20 3f 7c JSR $7c3f ; (negtmp + 0)
7c2e : 20 4d 7c JSR $7c4d ; (divmod + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
7c31 : 38 __ __ SEC
7c32 : a9 00 __ LDA #$00
7c34 : e5 1b __ SBC ACCU + 0 
7c36 : 85 1b __ STA ACCU + 0 
7c38 : a9 00 __ LDA #$00
7c3a : e5 1c __ SBC ACCU + 1 
7c3c : 85 1c __ STA ACCU + 1 
7c3e : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
7c3f : 38 __ __ SEC
7c40 : a9 00 __ LDA #$00
7c42 : e5 03 __ SBC WORK + 0 
7c44 : 85 03 __ STA WORK + 0 
7c46 : a9 00 __ LDA #$00
7c48 : e5 04 __ SBC WORK + 1 
7c4a : 85 04 __ STA WORK + 1 
7c4c : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
7c4d : a5 1c __ LDA ACCU + 1 
7c4f : d0 31 __ BNE $7c82 ; (divmod + 53)
7c51 : a5 04 __ LDA WORK + 1 
7c53 : d0 1e __ BNE $7c73 ; (divmod + 38)
7c55 : 85 06 __ STA WORK + 3 
7c57 : a2 04 __ LDX #$04
7c59 : 06 1b __ ASL ACCU + 0 
7c5b : 2a __ __ ROL
7c5c : c5 03 __ CMP WORK + 0 
7c5e : 90 02 __ BCC $7c62 ; (divmod + 21)
7c60 : e5 03 __ SBC WORK + 0 
7c62 : 26 1b __ ROL ACCU + 0 
7c64 : 2a __ __ ROL
7c65 : c5 03 __ CMP WORK + 0 
7c67 : 90 02 __ BCC $7c6b ; (divmod + 30)
7c69 : e5 03 __ SBC WORK + 0 
7c6b : 26 1b __ ROL ACCU + 0 
7c6d : ca __ __ DEX
7c6e : d0 eb __ BNE $7c5b ; (divmod + 14)
7c70 : 85 05 __ STA WORK + 2 
7c72 : 60 __ __ RTS
7c73 : a5 1b __ LDA ACCU + 0 
7c75 : 85 05 __ STA WORK + 2 
7c77 : a5 1c __ LDA ACCU + 1 
7c79 : 85 06 __ STA WORK + 3 
7c7b : a9 00 __ LDA #$00
7c7d : 85 1b __ STA ACCU + 0 
7c7f : 85 1c __ STA ACCU + 1 
7c81 : 60 __ __ RTS
7c82 : a5 04 __ LDA WORK + 1 
7c84 : d0 1f __ BNE $7ca5 ; (divmod + 88)
7c86 : a5 03 __ LDA WORK + 0 
7c88 : 30 1b __ BMI $7ca5 ; (divmod + 88)
7c8a : a9 00 __ LDA #$00
7c8c : 85 06 __ STA WORK + 3 
7c8e : a2 10 __ LDX #$10
7c90 : 06 1b __ ASL ACCU + 0 
7c92 : 26 1c __ ROL ACCU + 1 
7c94 : 2a __ __ ROL
7c95 : c5 03 __ CMP WORK + 0 
7c97 : 90 02 __ BCC $7c9b ; (divmod + 78)
7c99 : e5 03 __ SBC WORK + 0 
7c9b : 26 1b __ ROL ACCU + 0 
7c9d : 26 1c __ ROL ACCU + 1 
7c9f : ca __ __ DEX
7ca0 : d0 f2 __ BNE $7c94 ; (divmod + 71)
7ca2 : 85 05 __ STA WORK + 2 
7ca4 : 60 __ __ RTS
7ca5 : a9 00 __ LDA #$00
7ca7 : 85 05 __ STA WORK + 2 
7ca9 : 85 06 __ STA WORK + 3 
7cab : 84 02 __ STY $02 
7cad : a0 10 __ LDY #$10
7caf : 18 __ __ CLC
7cb0 : 26 1b __ ROL ACCU + 0 
7cb2 : 26 1c __ ROL ACCU + 1 
7cb4 : 26 05 __ ROL WORK + 2 
7cb6 : 26 06 __ ROL WORK + 3 
7cb8 : 38 __ __ SEC
7cb9 : a5 05 __ LDA WORK + 2 
7cbb : e5 03 __ SBC WORK + 0 
7cbd : aa __ __ TAX
7cbe : a5 06 __ LDA WORK + 3 
7cc0 : e5 04 __ SBC WORK + 1 
7cc2 : 90 04 __ BCC $7cc8 ; (divmod + 123)
7cc4 : 86 05 __ STX WORK + 2 
7cc6 : 85 06 __ STA WORK + 3 
7cc8 : 88 __ __ DEY
7cc9 : d0 e5 __ BNE $7cb0 ; (divmod + 99)
7ccb : 26 1b __ ROL ACCU + 0 
7ccd : 26 1c __ ROL ACCU + 1 
7ccf : a4 02 __ LDY $02 
7cd1 : 60 __ __ RTS
--------------------------------------------------------------------
mul32: ; mul32
7cd2 : a5 04 __ LDA WORK + 1 
7cd4 : 05 05 __ ORA WORK + 2 
7cd6 : 05 06 __ ORA WORK + 3 
7cd8 : d0 05 __ BNE $7cdf ; (mul32 + 13)
7cda : a5 03 __ LDA WORK + 0 
7cdc : 4c 9e 7b JMP $7b9e ; (mul32by8 + 0)
7cdf : a0 00 __ LDY #$00
7ce1 : 84 07 __ STY WORK + 4 
7ce3 : 84 08 __ STY WORK + 5 
7ce5 : 98 __ __ TYA
7ce6 : 38 __ __ SEC
7ce7 : 66 03 __ ROR WORK + 0 
7ce9 : 90 15 __ BCC $7d00 ; (mul32 + 46)
7ceb : aa __ __ TAX
7cec : 18 __ __ CLC
7ced : a5 07 __ LDA WORK + 4 
7cef : 65 1b __ ADC ACCU + 0 
7cf1 : 85 07 __ STA WORK + 4 
7cf3 : a5 08 __ LDA WORK + 5 
7cf5 : 65 1c __ ADC ACCU + 1 
7cf7 : 85 08 __ STA WORK + 5 
7cf9 : 98 __ __ TYA
7cfa : 65 1d __ ADC ACCU + 2 
7cfc : a8 __ __ TAY
7cfd : 8a __ __ TXA
7cfe : 65 1e __ ADC ACCU + 3 
7d00 : 46 04 __ LSR WORK + 1 
7d02 : 90 0f __ BCC $7d13 ; (mul32 + 65)
7d04 : aa __ __ TAX
7d05 : 18 __ __ CLC
7d06 : a5 08 __ LDA WORK + 5 
7d08 : 65 1b __ ADC ACCU + 0 
7d0a : 85 08 __ STA WORK + 5 
7d0c : 98 __ __ TYA
7d0d : 65 1c __ ADC ACCU + 1 
7d0f : a8 __ __ TAY
7d10 : 8a __ __ TXA
7d11 : 65 1d __ ADC ACCU + 2 
7d13 : 46 05 __ LSR WORK + 2 
7d15 : 90 09 __ BCC $7d20 ; (mul32 + 78)
7d17 : aa __ __ TAX
7d18 : 18 __ __ CLC
7d19 : 98 __ __ TYA
7d1a : 65 1b __ ADC ACCU + 0 
7d1c : a8 __ __ TAY
7d1d : 8a __ __ TXA
7d1e : 65 1c __ ADC ACCU + 1 
7d20 : 46 06 __ LSR WORK + 3 
7d22 : 90 03 __ BCC $7d27 ; (mul32 + 85)
7d24 : 18 __ __ CLC
7d25 : 65 1b __ ADC ACCU + 0 
7d27 : 06 1b __ ASL ACCU + 0 
7d29 : 26 1c __ ROL ACCU + 1 
7d2b : 26 1d __ ROL ACCU + 2 
7d2d : 26 1e __ ROL ACCU + 3 
7d2f : 46 03 __ LSR WORK + 0 
7d31 : 90 cd __ BCC $7d00 ; (mul32 + 46)
7d33 : d0 b6 __ BNE $7ceb ; (mul32 + 25)
7d35 : 84 09 __ STY WORK + 6 
7d37 : 85 0a __ STA WORK + 7 
7d39 : 60 __ __ RTS
--------------------------------------------------------------------
divs32: ; divs32
7d3a : 24 1e __ BIT ACCU + 3 
7d3c : 10 0d __ BPL $7d4b ; (divs32 + 17)
7d3e : 20 55 7d JSR $7d55 ; (negaccu32 + 0)
7d41 : 24 06 __ BIT WORK + 3 
7d43 : 10 0d __ BPL $7d52 ; (divs32 + 24)
7d45 : 20 6f 7d JSR $7d6f ; (negtmp32 + 0)
7d48 : 4c 75 42 JMP $4275 ; (divmod32 + 0)
7d4b : 24 06 __ BIT WORK + 3 
7d4d : 10 f9 __ BPL $7d48 ; (divs32 + 14)
7d4f : 20 6f 7d JSR $7d6f ; (negtmp32 + 0)
7d52 : 20 75 42 JSR $4275 ; (divmod32 + 0)
--------------------------------------------------------------------
negaccu32: ; negaccu32
7d55 : 38 __ __ SEC
7d56 : a9 00 __ LDA #$00
7d58 : e5 1b __ SBC ACCU + 0 
7d5a : 85 1b __ STA ACCU + 0 
7d5c : a9 00 __ LDA #$00
7d5e : e5 1c __ SBC ACCU + 1 
7d60 : 85 1c __ STA ACCU + 1 
7d62 : a9 00 __ LDA #$00
7d64 : e5 1d __ SBC ACCU + 2 
7d66 : 85 1d __ STA ACCU + 2 
7d68 : a9 00 __ LDA #$00
7d6a : e5 1e __ SBC ACCU + 3 
7d6c : 85 1e __ STA ACCU + 3 
7d6e : 60 __ __ RTS
--------------------------------------------------------------------
negtmp32: ; negtmp32
7d6f : 38 __ __ SEC
7d70 : a9 00 __ LDA #$00
7d72 : e5 03 __ SBC WORK + 0 
7d74 : 85 03 __ STA WORK + 0 
7d76 : a9 00 __ LDA #$00
7d78 : e5 04 __ SBC WORK + 1 
7d7a : 85 04 __ STA WORK + 1 
7d7c : a9 00 __ LDA #$00
7d7e : e5 05 __ SBC WORK + 2 
7d80 : 85 05 __ STA WORK + 2 
7d82 : a9 00 __ LDA #$00
7d84 : e5 06 __ SBC WORK + 3 
7d86 : 85 06 __ STA WORK + 3 
7d88 : 60 __ __ RTS
--------------------------------------------------------------------
crt_malloc: ; crt_malloc
7d89 : 18 __ __ CLC
7d8a : a5 1b __ LDA ACCU + 0 
7d8c : 69 0d __ ADC #$0d
7d8e : 29 fc __ AND #$fc
7d90 : 85 03 __ STA WORK + 0 
7d92 : a5 1c __ LDA ACCU + 1 
7d94 : 69 00 __ ADC #$00
7d96 : 85 04 __ STA WORK + 1 
7d98 : ad f8 8b LDA $8bf8 ; (HeapNode.end + 0)
7d9b : d0 26 __ BNE $7dc3 ; (crt_malloc + 58)
7d9d : a9 00 __ LDA #$00
7d9f : 8d a2 ab STA $aba2 
7da2 : 8d a3 ab STA $aba3 
7da5 : ee f8 8b INC $8bf8 ; (HeapNode.end + 0)
7da8 : a9 a0 __ LDA #$a0
7daa : 09 02 __ ORA #$02
7dac : 8d f6 8b STA $8bf6 ; (HeapNode.next + 0)
7daf : a9 ab __ LDA #$ab
7db1 : 8d f7 8b STA $8bf7 ; (HeapNode.next + 1)
7db4 : 38 __ __ SEC
7db5 : a9 00 __ LDA #$00
7db7 : e9 02 __ SBC #$02
7db9 : 8d a4 ab STA $aba4 
7dbc : a9 b0 __ LDA #$b0
7dbe : e9 00 __ SBC #$00
7dc0 : 8d a5 ab STA $aba5 
7dc3 : a9 f6 __ LDA #$f6
7dc5 : a2 8b __ LDX #$8b
7dc7 : 85 1d __ STA ACCU + 2 
7dc9 : 86 1e __ STX ACCU + 3 
7dcb : 18 __ __ CLC
7dcc : a0 00 __ LDY #$00
7dce : b1 1d __ LDA (ACCU + 2),y 
7dd0 : 85 1b __ STA ACCU + 0 
7dd2 : 65 03 __ ADC WORK + 0 
7dd4 : 85 05 __ STA WORK + 2 
7dd6 : c8 __ __ INY
7dd7 : b1 1d __ LDA (ACCU + 2),y 
7dd9 : 85 1c __ STA ACCU + 1 
7ddb : f0 20 __ BEQ $7dfd ; (crt_malloc + 116)
7ddd : 65 04 __ ADC WORK + 1 
7ddf : 85 06 __ STA WORK + 3 
7de1 : b0 14 __ BCS $7df7 ; (crt_malloc + 110)
7de3 : a0 02 __ LDY #$02
7de5 : b1 1b __ LDA (ACCU + 0),y 
7de7 : c5 05 __ CMP WORK + 2 
7de9 : c8 __ __ INY
7dea : b1 1b __ LDA (ACCU + 0),y 
7dec : e5 06 __ SBC WORK + 3 
7dee : b0 0f __ BCS $7dff ; (crt_malloc + 118)
7df0 : a5 1b __ LDA ACCU + 0 
7df2 : a6 1c __ LDX ACCU + 1 
7df4 : 4c c7 7d JMP $7dc7 ; (crt_malloc + 62)
7df7 : a9 00 __ LDA #$00
7df9 : 85 1b __ STA ACCU + 0 
7dfb : 85 1c __ STA ACCU + 1 
7dfd : 02 __ __ INV
7dfe : 60 __ __ RTS
7dff : a5 05 __ LDA WORK + 2 
7e01 : 85 07 __ STA WORK + 4 
7e03 : a5 06 __ LDA WORK + 3 
7e05 : 85 08 __ STA WORK + 5 
7e07 : a0 02 __ LDY #$02
7e09 : a5 07 __ LDA WORK + 4 
7e0b : d1 1b __ CMP (ACCU + 0),y 
7e0d : d0 15 __ BNE $7e24 ; (crt_malloc + 155)
7e0f : c8 __ __ INY
7e10 : a5 08 __ LDA WORK + 5 
7e12 : d1 1b __ CMP (ACCU + 0),y 
7e14 : d0 0e __ BNE $7e24 ; (crt_malloc + 155)
7e16 : a0 00 __ LDY #$00
7e18 : b1 1b __ LDA (ACCU + 0),y 
7e1a : 91 1d __ STA (ACCU + 2),y 
7e1c : c8 __ __ INY
7e1d : b1 1b __ LDA (ACCU + 0),y 
7e1f : 91 1d __ STA (ACCU + 2),y 
7e21 : 4c 41 7e JMP $7e41 ; (crt_malloc + 184)
7e24 : a0 00 __ LDY #$00
7e26 : b1 1b __ LDA (ACCU + 0),y 
7e28 : 91 07 __ STA (WORK + 4),y 
7e2a : a5 07 __ LDA WORK + 4 
7e2c : 91 1d __ STA (ACCU + 2),y 
7e2e : c8 __ __ INY
7e2f : b1 1b __ LDA (ACCU + 0),y 
7e31 : 91 07 __ STA (WORK + 4),y 
7e33 : a5 08 __ LDA WORK + 5 
7e35 : 91 1d __ STA (ACCU + 2),y 
7e37 : c8 __ __ INY
7e38 : b1 1b __ LDA (ACCU + 0),y 
7e3a : 91 07 __ STA (WORK + 4),y 
7e3c : c8 __ __ INY
7e3d : b1 1b __ LDA (ACCU + 0),y 
7e3f : 91 07 __ STA (WORK + 4),y 
7e41 : a0 00 __ LDY #$00
7e43 : a5 05 __ LDA WORK + 2 
7e45 : 91 1b __ STA (ACCU + 0),y 
7e47 : c8 __ __ INY
7e48 : a5 06 __ LDA WORK + 3 
7e4a : 91 1b __ STA (ACCU + 0),y 
7e4c : a0 02 __ LDY #$02
7e4e : a9 bd __ LDA #$bd
7e50 : 91 1b __ STA (ACCU + 0),y 
7e52 : c8 __ __ INY
7e53 : 91 1b __ STA (ACCU + 0),y 
7e55 : c8 __ __ INY
7e56 : 91 1b __ STA (ACCU + 0),y 
7e58 : c8 __ __ INY
7e59 : 91 1b __ STA (ACCU + 0),y 
7e5b : 38 __ __ SEC
7e5c : a5 05 __ LDA WORK + 2 
7e5e : e9 04 __ SBC #$04
7e60 : 85 05 __ STA WORK + 2 
7e62 : b0 02 __ BCS $7e66 ; (crt_malloc + 221)
7e64 : c6 06 __ DEC WORK + 3 
7e66 : a9 be __ LDA #$be
7e68 : a0 00 __ LDY #$00
7e6a : 91 05 __ STA (WORK + 2),y 
7e6c : c8 __ __ INY
7e6d : 91 05 __ STA (WORK + 2),y 
7e6f : c8 __ __ INY
7e70 : 91 05 __ STA (WORK + 2),y 
7e72 : c8 __ __ INY
7e73 : 91 05 __ STA (WORK + 2),y 
7e75 : 18 __ __ CLC
7e76 : a5 1b __ LDA ACCU + 0 
7e78 : 69 06 __ ADC #$06
7e7a : 85 1b __ STA ACCU + 0 
7e7c : 90 02 __ BCC $7e80 ; (crt_malloc + 247)
7e7e : e6 1c __ INC ACCU + 1 
7e80 : 60 __ __ RTS
--------------------------------------------------------------------
crt_free@proxy: ; crt_free@proxy
7e81 : a5 0d __ LDA P0 
7e83 : 85 1b __ STA ACCU + 0 
7e85 : a5 0e __ LDA P1 
7e87 : 85 1c __ STA ACCU + 1 
--------------------------------------------------------------------
crt_free: ; crt_free
7e89 : a5 1b __ LDA ACCU + 0 
7e8b : 05 1c __ ORA ACCU + 1 
7e8d : d0 01 __ BNE $7e90 ; (crt_free + 7)
7e8f : 60 __ __ RTS
7e90 : 38 __ __ SEC
7e91 : a5 1b __ LDA ACCU + 0 
7e93 : 29 03 __ AND #$03
7e95 : d0 56 __ BNE $7eed ; (crt_free + 100)
7e97 : a5 1b __ LDA ACCU + 0 
7e99 : e9 06 __ SBC #$06
7e9b : 85 1b __ STA ACCU + 0 
7e9d : b0 02 __ BCS $7ea1 ; (crt_free + 24)
7e9f : c6 1c __ DEC ACCU + 1 
7ea1 : a0 02 __ LDY #$02
7ea3 : a9 bd __ LDA #$bd
7ea5 : d1 1b __ CMP (ACCU + 0),y 
7ea7 : d0 44 __ BNE $7eed ; (crt_free + 100)
7ea9 : c8 __ __ INY
7eaa : d1 1b __ CMP (ACCU + 0),y 
7eac : d0 3f __ BNE $7eed ; (crt_free + 100)
7eae : c8 __ __ INY
7eaf : d1 1b __ CMP (ACCU + 0),y 
7eb1 : d0 3a __ BNE $7eed ; (crt_free + 100)
7eb3 : c8 __ __ INY
7eb4 : d1 1b __ CMP (ACCU + 0),y 
7eb6 : d0 35 __ BNE $7eed ; (crt_free + 100)
7eb8 : a0 00 __ LDY #$00
7eba : 38 __ __ SEC
7ebb : b1 1b __ LDA (ACCU + 0),y 
7ebd : e9 04 __ SBC #$04
7ebf : 85 03 __ STA WORK + 0 
7ec1 : c8 __ __ INY
7ec2 : b1 1b __ LDA (ACCU + 0),y 
7ec4 : e9 00 __ SBC #$00
7ec6 : 85 04 __ STA WORK + 1 
7ec8 : a0 00 __ LDY #$00
7eca : a9 be __ LDA #$be
7ecc : d1 03 __ CMP (WORK + 0),y 
7ece : d0 1d __ BNE $7eed ; (crt_free + 100)
7ed0 : c8 __ __ INY
7ed1 : d1 03 __ CMP (WORK + 0),y 
7ed3 : d0 18 __ BNE $7eed ; (crt_free + 100)
7ed5 : c8 __ __ INY
7ed6 : d1 03 __ CMP (WORK + 0),y 
7ed8 : d0 13 __ BNE $7eed ; (crt_free + 100)
7eda : c8 __ __ INY
7edb : d1 03 __ CMP (WORK + 0),y 
7edd : d0 0e __ BNE $7eed ; (crt_free + 100)
7edf : a5 1c __ LDA ACCU + 1 
7ee1 : a6 1b __ LDX ACCU + 0 
7ee3 : c9 ab __ CMP #$ab
7ee5 : 90 06 __ BCC $7eed ; (crt_free + 100)
7ee7 : d0 05 __ BNE $7eee ; (crt_free + 101)
7ee9 : e0 a0 __ CPX #$a0
7eeb : b0 01 __ BCS $7eee ; (crt_free + 101)
7eed : 02 __ __ INV
7eee : c9 b0 __ CMP #$b0
7ef0 : 90 06 __ BCC $7ef8 ; (crt_free + 111)
7ef2 : d0 f9 __ BNE $7eed ; (crt_free + 100)
7ef4 : e0 00 __ CPX #$00
7ef6 : b0 f5 __ BCS $7eed ; (crt_free + 100)
7ef8 : a0 02 __ LDY #$02
7efa : a9 bf __ LDA #$bf
7efc : 91 1b __ STA (ACCU + 0),y 
7efe : c8 __ __ INY
7eff : 91 1b __ STA (ACCU + 0),y 
7f01 : a0 00 __ LDY #$00
7f03 : b1 1b __ LDA (ACCU + 0),y 
7f05 : 85 1d __ STA ACCU + 2 
7f07 : c8 __ __ INY
7f08 : b1 1b __ LDA (ACCU + 0),y 
7f0a : 85 1e __ STA ACCU + 3 
7f0c : a9 f6 __ LDA #$f6
7f0e : a2 8b __ LDX #$8b
7f10 : 85 05 __ STA WORK + 2 
7f12 : 86 06 __ STX WORK + 3 
7f14 : a0 01 __ LDY #$01
7f16 : b1 05 __ LDA (WORK + 2),y 
7f18 : f0 28 __ BEQ $7f42 ; (crt_free + 185)
7f1a : aa __ __ TAX
7f1b : 88 __ __ DEY
7f1c : b1 05 __ LDA (WORK + 2),y 
7f1e : e4 1e __ CPX ACCU + 3 
7f20 : 90 ee __ BCC $7f10 ; (crt_free + 135)
7f22 : d0 1e __ BNE $7f42 ; (crt_free + 185)
7f24 : c5 1d __ CMP ACCU + 2 
7f26 : 90 e8 __ BCC $7f10 ; (crt_free + 135)
7f28 : d0 18 __ BNE $7f42 ; (crt_free + 185)
7f2a : a0 00 __ LDY #$00
7f2c : b1 1d __ LDA (ACCU + 2),y 
7f2e : 91 1b __ STA (ACCU + 0),y 
7f30 : c8 __ __ INY
7f31 : b1 1d __ LDA (ACCU + 2),y 
7f33 : 91 1b __ STA (ACCU + 0),y 
7f35 : c8 __ __ INY
7f36 : b1 1d __ LDA (ACCU + 2),y 
7f38 : 91 1b __ STA (ACCU + 0),y 
7f3a : c8 __ __ INY
7f3b : b1 1d __ LDA (ACCU + 2),y 
7f3d : 91 1b __ STA (ACCU + 0),y 
7f3f : 4c 57 7f JMP $7f57 ; (crt_free + 206)
7f42 : a0 00 __ LDY #$00
7f44 : b1 05 __ LDA (WORK + 2),y 
7f46 : 91 1b __ STA (ACCU + 0),y 
7f48 : c8 __ __ INY
7f49 : b1 05 __ LDA (WORK + 2),y 
7f4b : 91 1b __ STA (ACCU + 0),y 
7f4d : c8 __ __ INY
7f4e : a5 1d __ LDA ACCU + 2 
7f50 : 91 1b __ STA (ACCU + 0),y 
7f52 : c8 __ __ INY
7f53 : a5 1e __ LDA ACCU + 3 
7f55 : 91 1b __ STA (ACCU + 0),y 
7f57 : a0 02 __ LDY #$02
7f59 : b1 05 __ LDA (WORK + 2),y 
7f5b : c5 1b __ CMP ACCU + 0 
7f5d : d0 1d __ BNE $7f7c ; (crt_free + 243)
7f5f : c8 __ __ INY
7f60 : b1 05 __ LDA (WORK + 2),y 
7f62 : c5 1c __ CMP ACCU + 1 
7f64 : d0 16 __ BNE $7f7c ; (crt_free + 243)
7f66 : a0 00 __ LDY #$00
7f68 : b1 1b __ LDA (ACCU + 0),y 
7f6a : 91 05 __ STA (WORK + 2),y 
7f6c : c8 __ __ INY
7f6d : b1 1b __ LDA (ACCU + 0),y 
7f6f : 91 05 __ STA (WORK + 2),y 
7f71 : c8 __ __ INY
7f72 : b1 1b __ LDA (ACCU + 0),y 
7f74 : 91 05 __ STA (WORK + 2),y 
7f76 : c8 __ __ INY
7f77 : b1 1b __ LDA (ACCU + 0),y 
7f79 : 91 05 __ STA (WORK + 2),y 
7f7b : 60 __ __ RTS
7f7c : a0 00 __ LDY #$00
7f7e : a5 1b __ LDA ACCU + 0 
7f80 : 91 05 __ STA (WORK + 2),y 
7f82 : c8 __ __ INY
7f83 : a5 1c __ LDA ACCU + 1 
7f85 : 91 05 __ STA (WORK + 2),y 
7f87 : 60 __ __ RTS
--------------------------------------------------------------------
__multab16L:
7f88 : __ __ __ BYT 00 10 20 30 40                                  : .. 0@
--------------------------------------------------------------------
__multab50L:
7f8d : __ __ __ BYT 00 32 64 96                                     : .2d.
--------------------------------------------------------------------
__multab7L:
7f91 : __ __ __ BYT 00 07 0e 15 1c 23 2a 31 38 3f 46 4d 54          : .....#*18?FMT
--------------------------------------------------------------------
__shrtab192L:
7f9e : __ __ __ BYT c0 60 30 18 0c 06 03                            : .`0....
--------------------------------------------------------------------
__multab12L:
7fa5 : __ __ __ BYT 00 0c 18 24                                     : ...$
--------------------------------------------------------------------
__multab3L:
7fa9 : __ __ __ BYT 00 03 06 09                                     : ....
--------------------------------------------------------------------
__shltab3L:
7fad : __ __ __ BYT 03 06 0c 18 30 60 c0                            : ....0`.
--------------------------------------------------------------------
__multab320L:
7fb4 : __ __ __ BYT 00 40 80 c0 00 40 80 c0 00 40 80 c0 00          : .@...@...@...
--------------------------------------------------------------------
__multab320H:
7fc1 : __ __ __ BYT 00 01 02 03 05 06 07 08 0a 0b 0c 0d 0f          : .............
--------------------------------------------------------------------
__multab40L:
7fce : __ __ __ BYT 00 28 50 78 a0 c8                               : .(Px..
--------------------------------------------------------------------
__multab10L:
7fd4 : __ __ __ BYT 00 0a 14 1e 28 32 3c 46 50 5a 64 6e 78 82 8c 96 : ....(2<FPZdnx...
--------------------------------------------------------------------
__multab17L:
7fe4 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 99 aa bb cc dd ee ff : .."3DUfw........
--------------------------------------------------------------------
screen_result@proxy: ; screen_result@proxy
7ff4 : a9 e2 __ LDA #$e2
7ff6 : 85 10 __ STA P3 
7ff8 : a9 15 __ LDA #$15
7ffa : 85 11 __ STA P4 
7ffc : 4c 08 12 JMP $1208 ; (screen_result.s4 + 0)
--------------------------------------------------------------------
memset@proxy: ; memset@proxy
7fff : a9 e0 __ LDA #$e0
8001 : 85 0e __ STA P1 
8003 : a9 40 __ LDA #$40
8005 : 85 11 __ STA P4 
8007 : a9 1f __ LDA #$1f
8009 : 85 12 __ STA P5 
800b : 4c 31 24 JMP $2431 ; (memset.s4 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
800e : a5 4f __ LDA $4f 
8010 : 85 03 __ STA WORK + 0 
8012 : a5 50 __ LDA $50 
8014 : 85 04 __ STA WORK + 1 
8016 : 4c 16 7c JMP $7c16 ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
8019 : a5 5e __ LDA $5e 
801b : 85 03 __ STA WORK + 0 
801d : a5 5f __ LDA $5f 
801f : 85 04 __ STA WORK + 1 
8021 : 4c 16 7c JMP $7c16 ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
8024 : a9 7f __ LDA #$7f
8026 : 85 03 __ STA WORK + 0 
8028 : a9 00 __ LDA #$00
802a : 85 04 __ STA WORK + 1 
802c : a5 05 __ LDA WORK + 2 
802e : 85 1b __ STA ACCU + 0 
8030 : a5 06 __ LDA WORK + 3 
8032 : 85 1c __ STA ACCU + 1 
8034 : 4c 16 7c JMP $7c16 ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
8037 : a9 0d __ LDA #$0d
8039 : 85 03 __ STA WORK + 0 
803b : 4c 16 7c JMP $7c16 ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
803e : a9 7f __ LDA #$7f
8040 : 85 03 __ STA WORK + 0 
8042 : a9 00 __ LDA #$00
8044 : 85 04 __ STA WORK + 1 
8046 : 4c 16 7c JMP $7c16 ; (divs16 + 0)
--------------------------------------------------------------------
divmod@proxy: ; divmod@proxy
8049 : a9 50 __ LDA #$50
804b : 85 1b __ STA ACCU + 0 
804d : a9 46 __ LDA #$46
804f : 85 1c __ STA ACCU + 1 
8051 : 4c 4d 7c JMP $7c4d ; (divmod + 0)
--------------------------------------------------------------------
cwin_put_string@proxy: ; cwin_put_string@proxy
8054 : a5 10 __ LDA P3 
8056 : 85 0d __ STA P0 
8058 : a5 11 __ LDA P4 
805a : 85 0e __ STA P1 
805c : 4c 66 11 JMP $1166 ; (cwin_put_string.s4 + 0)
--------------------------------------------------------------------
vic_setmode@proxy: ; vic_setmode@proxy
805f : a9 10 __ LDA #$10
8061 : 85 11 __ STA P4 
8063 : 4c b8 0f JMP $0fb8 ; (vic_setmode.s4 + 0)
--------------------------------------------------------------------
vic_setmode@proxy: ; vic_setmode@proxy
8066 : a9 04 __ LDA #$04
8068 : 85 0d __ STA P0 
806a : a9 c0 __ LDA #$c0
806c : 85 0f __ STA P2 
806e : a9 e0 __ LDA #$e0
8070 : 85 11 __ STA P4 
8072 : 4c b8 0f JMP $0fb8 ; (vic_setmode.s4 + 0)
--------------------------------------------------------------------
vic_setmode@proxy: ; vic_setmode@proxy
8075 : a9 03 __ LDA #$03
8077 : 85 0d __ STA P0 
8079 : a9 00 __ LDA #$00
807b : 85 0e __ STA P1 
807d : a9 d0 __ LDA #$d0
807f : 85 0f __ STA P2 
8081 : a5 43 __ LDA $43 
8083 : 85 10 __ STA P3 
8085 : a5 44 __ LDA $44 
8087 : 85 11 __ STA P4 
8089 : 4c b8 0f JMP $0fb8 ; (vic_setmode.s4 + 0)
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
808c : a9 80 __ LDA #$80
808e : 85 0e __ STA P1 
8090 : 4c e9 10 JMP $10e9 ; (strlen.s4 + 0)
--------------------------------------------------------------------
mul40:
8093 : __ __ __ BYT 00 00 28 00 50 00 78 00 a0 00 c8 00 f0 00 18 01 : ..(.P.x.........
80a3 : __ __ __ BYT 40 01 68 01 90 01 b8 01 e0 01 08 02 30 02 58 02 : @.h.........0.X.
80b3 : __ __ __ BYT 80 02 a8 02 d0 02 f8 02 20 03 48 03 70 03 98 03 : ........ .H.p...
80c3 : __ __ __ BYT c0 03                                           : ..
--------------------------------------------------------------------
p2smap:
80c5 : __ __ __ BYT 40 00 40 20 40 c0 80 80                         : @.@ @...
--------------------------------------------------------------------
p2smap:
80cd : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
audio_ch_base:
80d5 : __ __ __ BYT 20 df 40 df 60 df 80 df a0 df c0 df e0 df       :  .@.`.........
--------------------------------------------------------------------
mod_file:
80e3 : __ __ __ BYT 34 65 76 2e 6d 6f 64 00                         : 4ev.mod.
--------------------------------------------------------------------
demo_path:
80eb : __ __ __ BYT 69 64 69 38 62 2f 75 6c 74 64 65 6d 6f 32 30 32 : idi8b/ultdemo202
80fb : __ __ __ BYT 36 2f 00                                        : 6/.
--------------------------------------------------------------------
mod_paused:
80fe : __ __ __ BSS	1
--------------------------------------------------------------------
insert_col:
80ff : __ __ __ BSS	1
--------------------------------------------------------------------
sid_freq:
8100 : __ __ __ BYT a9 02 d2 02 fd 02 2b 03 5b 03 8e 03 c4 03 fd 03 : ......+.[.......
8110 : __ __ __ BYT 3a 04 7a 04 bf 04 07 05 53 05 a4 05 fa 05 55 06 : :.z.....S.....U.
--------------------------------------------------------------------
speed_nums:
8120 : __ __ __ BYT d3 25 d5 25 d7 25 d9 25 db 25 dd 25 df 25 e2 25 : .%.%.%.%.%.%.%.%
8130 : __ __ __ BYT e5 25 e8 25 eb 25 ee 25 f1 25 f4 25 f7 25 fa 25 : .%.%.%.%.%.%.%.%
--------------------------------------------------------------------
glyphs:
8140 : __ __ __ BYT 70 88 88 88 88 88 70 20 60 20 20 20 20 70 70 88 : p.....p `    pp.
8150 : __ __ __ BYT 08 30 40 80 f8 70 88 08 30 08 88 70 10 30 50 90 : .0@..p..0..p.0P.
8160 : __ __ __ BYT f8 10 10 f8 80 f0 08 08 88 70 30 40 80 f0 88 88 : .........p0@....
8170 : __ __ __ BYT 70 f8 08 10 20 40 40 40 70 88 88 70 88 88 70 70 : p... @@@p..p..pp
8180 : __ __ __ BYT 88 88 78 08 10 60 88 d8 a8 88 88 88 88 88 88 88 : ..x..`..........
8190 : __ __ __ BYT f8 88 88 88 f8 10 20 40 80 80 f8                : ...... @...
--------------------------------------------------------------------
lmask:
819b : __ __ __ BYT ff 7f 3f 1f 0f 07 03 01                         : ..?.....
--------------------------------------------------------------------
rmask:
81a3 : __ __ __ BYT 00 80 c0 e0 f0 f8 fc fe                         : ........
--------------------------------------------------------------------
blitops_op:
81ab : __ __ __ BYT 00 21 01 41                                     : .!.A
--------------------------------------------------------------------
step_msg:
81af : __ __ __ BYT fa 2f 13 30 28 30 3b 30 53 30 70 30 8a 30 a4 30 : ./.0(0;0S0p0.0.0
81bf : __ __ __ BYT bd 30 d9 30 f9 30 16 31 33 31 4f 31 67 31 83 31 : .0.0.0.131O1g1.1
--------------------------------------------------------------------
TinyFont:
81cf : __ __ __ BYT 00 04 05 08 0d 12 17 1c 1d 21 25 2a 2d 2e 31 32 : .........!%*-.12
81df : __ __ __ BYT 35 39 3d 41 45 49 4d 51 55 59 5d 5e 5f 62 65 68 : 59=AEIMQUY]^_beh
81ef : __ __ __ BYT 6c 71 76 7a 7e 82 86 8a 8e 92 95 99 9d a1 a6 ab : lqvz~...........
81ff : __ __ __ BYT af b3 b7 bb bf c4 c8 cd d2 d7 dc e1 e5 e8 ec f1 : ................
820f : __ __ __ BYT f5 f9 fd 01 05 09 0d 10 14 18 19 1b 1f 21 26 2a : .............!&*
821f : __ __ __ BYT 2e 32 36 3a 3e 41 45 49 4e 52 56 5a 5e 5f 63 67 : .26:>AEINRVZ^_cg
822f : __ __ __ BYT 10 04 0c 14 14 14 14 04 10 10 14 0c 04 0c 04 0c : ................
823f : __ __ __ BYT 10 10 10 10 10 10 10 10 10 10 04 04 0c 0c 0c 10 : ................
824f : __ __ __ BYT 14 14 10 10 10 10 10 10 10 0c 10 10 10 14 14 10 : ................
825f : __ __ __ BYT 10 10 10 10 14 10 14 14 14 14 14 10 0c 10 14 10 : ................
826f : __ __ __ BYT 10 10 10 11 11 11 0d 11 11 05 09 11 09 15 11 11 : ................
827f : __ __ __ BYT 11 11 11 11 0d 11 11 15 11 11 11 11 05 11 11 11 : ................
828f : __ __ __ BYT 00 00 00 00 fa c0 00 c0 28 7c 28 7c 28 20 54 d6 : ........(|(|( T.
829f : __ __ __ BYT 54 08 04 48 10 24 40 6c 92 92 6c 0a c0 38 44 82 : T..H.$@l..l..8D.
82af : __ __ __ BYT 82 82 82 44 38 10 54 38 54 10 10 38 10 03 10 10 : ...D8.T8T..8....
82bf : __ __ __ BYT 10 02 06 38 c0 7c 82 82 7c 22 42 fe 02 46 8a 92 : ...8.|..|"B..F..
82cf : __ __ __ BYT 62 44 82 92 6c f0 10 3e 10 e4 92 92 8c 7c 92 92 : bD..l..>.....|..
82df : __ __ __ BYT 4c 80 8e 90 e0 6c 92 92 6c 64 92 92 7c 28 0b 10 : L....l..ld..|(..
82ef : __ __ __ BYT 28 44 28 28 28 44 28 10 40 80 9a 60 00 00 00 00 : (D(((D(.@..`....
82ff : __ __ __ BYT 00 3e 50 90 50 3e fe 92 92 6c 7c 82 82 44 fe 82 : .>P.P>...l|..D..
830f : __ __ __ BYT 82 7c fe 92 92 82 fe 90 90 80 7c 82 92 1c fe 10 : .|........|.....
831f : __ __ __ BYT 10 fe 82 fe 82 84 82 82 fc fe 10 28 c6 fe 02 02 : ...........(....
832f : __ __ __ BYT 02 fe 40 20 40 fe fe 40 20 10 fe 7c 82 82 7c fe : ..@ @..@ ..|..|.
833f : __ __ __ BYT 90 90 60 7c 82 84 7a fe 90 90 6e 64 92 92 4c 80 : ..`|..z...nd..L.
834f : __ __ __ BYT 80 fe 80 80 fc 02 02 fc e0 18 06 18 e0 fe 04 08 : ................
835f : __ __ __ BYT 04 fe c6 28 10 28 c6 e0 10 1e 10 e0 86 8a 92 a2 : ...(.(..........
836f : __ __ __ BYT c2 fe 82 82 82 c0 38 06 82 82 82 fe 20 40 80 40 : ......8..... @.@
837f : __ __ __ BYT 20 01 01 01 01 00 00 00 00 04 2a 2a 1e fe 22 22 :  .........**..""
838f : __ __ __ BYT 1c 1c 22 22 14 1c 22 22 fe 1c 2a 2a 18 20 7e a0 : ..""..""..**. ~.
839f : __ __ __ BYT 18 25 25 3e fe 20 20 1e be 01 be fe 10 28 46 fc : .%%>.  ......(F.
83af : __ __ __ BYT 02 3e 20 1e 20 1e 3e 20 20 1e 1c 22 22 1c 3f 24 : .> . .>  .."".?$
83bf : __ __ __ BYT 24 18 18 24 24 3f 3e 10 20 10 12 2a 2a 04 20 7c : $..$$?>. ..**. |
83cf : __ __ __ BYT 22 3c 02 02 3e 38 04 02 3c 3c 02 1c 02 3c 26 18 : "<..>8..<<...<&.
83df : __ __ __ BYT 0c 32 38 05 05 3e 26 2a 2a 32 10 6c 82 82 fe 82 : .28..>&**2.l....
83ef : __ __ __ BYT 82 6c 10 10 20 10 20 00 00 00 00                : .l.. . ....
--------------------------------------------------------------------
cbytes:
83fa : __ __ __ BYT 00 55 aa ff                                     : .U..
--------------------------------------------------------------------
mod_saved_irq:
83fe : __ __ __ BSS	2
--------------------------------------------------------------------
tbitmap:
8400 : __ __ __ BYT e0 a4 00 00 28 01 40 01                         : ....(.@.
--------------------------------------------------------------------
sin64:
8408 : __ __ __ BYT 00 0c 19 25 31 3c 47 51 5a 62 6a 70 75 7a 7d 7e : ...%1<GQZbjpuz}~
8418 : __ __ __ BYT 7f 7e 7d 7a 75 70 6a 62 5a 51 47 3c 31 25 19 0c : .~}zupjbZQG<1%..
8428 : __ __ __ BYT 00 f4 e7 db cf c4 b9 af a6 9e 96 90 8b 86 83 82 : ................
8438 : __ __ __ BYT 81 82 83 86 8b 90 96 9e a6 af b9 c4 cf db e7 f4 : ................
--------------------------------------------------------------------
cr:
8448 : __ __ __ BYT 00 00 00 00 40 01 c8 00                         : ....@...
--------------------------------------------------------------------
vib_sine:
8450 : __ __ __ BYT 00 18 31 4a 61 78 8d a1 b4 c5 d4 e0 eb f4 fa fd : ..1Jax..........
8460 : __ __ __ BYT ff fd fa f4 eb e0 d4 c5 b4 a1 8d 78 61 4a 31 18 : ...........xaJ1.
--------------------------------------------------------------------
mand_frame:
8470 : __ __ __ BYT 00 e4 1f f5 33 20 00 00 00 00                   : ....3 ....
--------------------------------------------------------------------
f1c:
847a : __ __ __ BYT 0f 01 0d 0d 05 01 07 0d 01 01 07 08 0e 03 01 03 : ................
848a : __ __ __ BYT 0e 0d 0d 07 01 01 0d 07 06 03 0e 0e 05 03 05 0d : ................
849a : __ __ __ BYT 01 01 05 0d 06 04 03 03 0e 01 0d 03 01 01 0f 0d : ................
--------------------------------------------------------------------
gz:
84aa : __ __ __ BYT a0 00 bb 00 d5 00 f0 00 0b 01 25 01 40 01       : ..........%.@.
--------------------------------------------------------------------
gx:
84b8 : __ __ __ BYT b0 ff cb ff e5 ff 00 00 1b 00 35 00 50 00       : ..........5.P.
--------------------------------------------------------------------
cube_v:
84c6 : __ __ __ BYT ff ff ff 01 ff ff 01 01 ff ff 01 ff ff ff 01 01 : ................
84d6 : __ __ __ BYT ff 01 01 01 01 ff 01 01                         : ........
--------------------------------------------------------------------
sin256:
84de : __ __ __ BYT 00 00 65 00 c9 00 2d 01 91 01 f5 01 59 02 bc 02 : ..e...-.....Y...
84ee : __ __ __ BYT 1f 03 81 03 e3 03 44 04 a5 04 05 05 64 05 c2 05 : ......D.....d...
84fe : __ __ __ BYT 1f 06 7c 06 d7 06 32 07 8b 07 e3 07 3a 08 8f 08 : ..|...2.....:...
850e : __ __ __ BYT e4 08 37 09 88 09 d8 09 26 0a 73 0a bf 0a 08 0b : ..7.....&.s.....
851e : __ __ __ BYT 50 0b 97 0b db 0b 1e 0c 5e 0c 9d 0c da 0c 15 0d : P.......^.......
852e : __ __ __ BYT 4e 0d 85 0d b9 0d ec 0d 1c 0e 4b 0e 77 0e a1 0e : N.........K.w...
853e : __ __ __ BYT c8 0e ee 0e 11 0f 31 0f 50 0f 6c 0f 85 0f 9c 0f : ......1.P.l.....
854e : __ __ __ BYT b1 0f c4 0f d4 0f e1 0f ec 0f f5 0f fb 0f ff 0f : ................
855e : __ __ __ BYT 00 10 ff 0f fb 0f f5 0f ec 0f e1 0f d4 0f c4 0f : ................
856e : __ __ __ BYT b1 0f 9c 0f 85 0f 6c 0f 50 0f 31 0f 11 0f ee 0e : ......l.P.1.....
857e : __ __ __ BYT c8 0e a1 0e 77 0e 4b 0e 1c 0e ec 0d b9 0d 85 0d : ....w.K.........
858e : __ __ __ BYT 4e 0d 15 0d da 0c 9d 0c 5e 0c 1e 0c db 0b 97 0b : N.......^.......
859e : __ __ __ BYT 50 0b 08 0b bf 0a 73 0a 26 0a d8 09 88 09 37 09 : P.....s.&.....7.
85ae : __ __ __ BYT e4 08 8f 08 3a 08 e3 07 8b 07 32 07 d7 06 7c 06 : ....:.....2...|.
85be : __ __ __ BYT 1f 06 c2 05 64 05 05 05 a5 04 44 04 e3 03 81 03 : ....d.....D.....
85ce : __ __ __ BYT 1f 03 bc 02 59 02 f5 01 91 01 2d 01 c9 00 65 00 : ....Y.....-...e.
85de : __ __ __ BYT 00 00 9b ff 37 ff d3 fe 6f fe 0b fe a7 fd 44 fd : ....7...o.....D.
85ee : __ __ __ BYT e1 fc 7f fc 1d fc bc fb 5b fb fb fa 9c fa 3e fa : ........[.....>.
85fe : __ __ __ BYT e1 f9 84 f9 29 f9 ce f8 75 f8 1d f8 c6 f7 71 f7 : ....)...u.....q.
860e : __ __ __ BYT 1c f7 c9 f6 78 f6 28 f6 da f5 8d f5 41 f5 f8 f4 : ....x.(.....A...
861e : __ __ __ BYT b0 f4 69 f4 25 f4 e2 f3 a2 f3 63 f3 26 f3 eb f2 : ..i.%.....c.&...
862e : __ __ __ BYT b2 f2 7b f2 47 f2 14 f2 e4 f1 b5 f1 89 f1 5f f1 : ..{.G........._.
863e : __ __ __ BYT 38 f1 12 f1 ef f0 cf f0 b0 f0 94 f0 7b f0 64 f0 : 8...........{.d.
864e : __ __ __ BYT 4f f0 3c f0 2c f0 1f f0 14 f0 0b f0 05 f0 01 f0 : O.<.,...........
865e : __ __ __ BYT 00 f0 01 f0 05 f0 0b f0 14 f0 1f f0 2c f0 3c f0 : ............,.<.
866e : __ __ __ BYT 4f f0 64 f0 7b f0 94 f0 b0 f0 cf f0 ef f0 12 f1 : O.d.{...........
867e : __ __ __ BYT 38 f1 5f f1 89 f1 b5 f1 e4 f1 14 f2 47 f2 7b f2 : 8._.........G.{.
868e : __ __ __ BYT b2 f2 eb f2 26 f3 63 f3 a2 f3 e2 f3 25 f4 69 f4 : ....&.c.....%.i.
869e : __ __ __ BYT b0 f4 f8 f4 41 f5 8d f5 da f5 28 f6 78 f6 c9 f6 : ....A.....(.x...
86ae : __ __ __ BYT 1c f7 71 f7 c6 f7 1d f8 75 f8 ce f8 29 f9 84 f9 : ..q.....u...)...
86be : __ __ __ BYT e1 f9 3e fa 9c fa fb fa 5b fb bc fb 1d fc 7f fc : ..>.....[.......
86ce : __ __ __ BYT e1 fc 44 fd a7 fd 0b fe 6f fe d3 fe 37 ff 9b ff : ..D.....o...7...
--------------------------------------------------------------------
cube_e:
86de : __ __ __ BYT 00 01 01 02 02 03 03 00 04 05 05 06 06 07 07 04 : ................
86ee : __ __ __ BYT 00 04 01 05 02 06 03 07                         : ........
--------------------------------------------------------------------
vcr:
86f6 : __ __ __ BYT 00 00 00 00 40 01 c8 00                         : ....@...
--------------------------------------------------------------------
txt_pos:
86fe : __ __ __ BSS	2
--------------------------------------------------------------------
sin_lut:
8700 : __ __ __ BYT 02 02 02 02 02 02 02 02 03 03 03 03 03 03 03 03 : ................
8710 : __ __ __ BYT 03 03 03 03 03 03 03 03 03 02 02 02 02 02 02 02 : ................
8720 : __ __ __ BYT 02 01 01 01 01 01 01 01 00 00 00 00 00 00 00 00 : ................
8730 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 01 01 01 01 01 01 : ................
--------------------------------------------------------------------
sum_to_col:
8740 : __ __ __ BYT 00 00 00 01 01 02 02 03 03 03                   : ..........
--------------------------------------------------------------------
pal_sc:
874a : __ __ __ BYT f9 e3 a8 d5                                     : ....
--------------------------------------------------------------------
pal_cr:
874e : __ __ __ BYT 01 01 07 03                                     : ....
--------------------------------------------------------------------
lat_wave:
8752 : __ __ __ BYT 00 ff ff fe fe fd fd fc fc fb fb fb fa fa fa fa : ................
8762 : __ __ __ BYT fa fa fa fb fb fb fc fc fd fd fe fe ff ff 00 00 : ................
8772 : __ __ __ BYT 01 01 02 02 03 03 04 04 05 05 05 06 06 06 06 06 : ................
8782 : __ __ __ BYT 06 06 05 05 05 04 04 03 03 02 02 01 01 00 00 ff : ................
--------------------------------------------------------------------
vert_wave:
8792 : __ __ __ BYT 00 01 02 02 03 03 04 04 04 04 04 03 03 02 02 01 : ................
87a2 : __ __ __ BYT 00 ff fe fe fd fd fc fc fc fc fc fd fd fe fe ff : ................
87b2 : __ __ __ BYT 00 01 02 02 03 03 04 04 04 04 04 03 03 02 02 01 : ................
87c2 : __ __ __ BYT 00 ff fe fe fd fd fc fc fc fc fc fd fd fe fe ff : ................
--------------------------------------------------------------------
char_tab:
87d2 : __ __ __ BYT a0 00 2a 2a 2e 20 20 20                         : ..**.   
--------------------------------------------------------------------
warm_col:
87da : __ __ __ BYT 01 03 07 0d 0a                                  : .....
--------------------------------------------------------------------
cool_col:
87df : __ __ __ BYT 01 0e 03 0f                                     : ....
--------------------------------------------------------------------
pcolor:
87e3 : __ __ __ BYT 02 08 07 0d 05 03 0e 06                         : ........
--------------------------------------------------------------------
cw:
87eb : __ __ __ BSS	12
--------------------------------------------------------------------
Screen:
87f7 : __ __ __ BSS	8
--------------------------------------------------------------------
fine_x:
87ff : __ __ __ BSS	1
--------------------------------------------------------------------
cos64:
8800 : __ __ __ BYT 7f 7e 7d 7a 75 70 6a 62 5a 51 47 3c 31 25 19 0c : .~}zupjbZQG<1%..
8810 : __ __ __ BYT 00 f4 e7 db cf c4 b9 af a6 9e 96 90 8b 86 83 82 : ................
8820 : __ __ __ BYT 81 82 83 86 8b 90 96 9e a6 af b9 c4 cf db e7 f4 : ................
8830 : __ __ __ BYT 00 0c 19 25 31 3c 47 51 5a 62 6a 70 75 7a 7d 7e : ...%1<GQZbjpuz}~
--------------------------------------------------------------------
scroll_text:
8840 : __ __ __ BYT 20 20 75 4c 54 49 4d 41 54 45 20 64 45 4d 4f 20 :   uLTIMATE dEMO 
8850 : __ __ __ BYT 32 30 32 36 20 20 63 4f 44 45 44 20 69 4e 20 63 : 2026  cODED iN c
8860 : __ __ __ BYT 20 62 59 20 78 41 4e 44 45 52 20 6d 4f 4c 20 20 :  bY xANDER mOL  
8870 : __ __ __ BYT 72 55 4e 4e 49 4e 47 20 61 54 20 36 34 20 6d 48 : rUNNING aT 64 mH
8880 : __ __ __ BYT 5a 20 6f 4e 20 74 48 45 20 75 4c 54 49 4d 41 54 : Z oN tHE uLTIMAT
8890 : __ __ __ BYT 45 20 36 34 20 68 41 52 44 57 41 52 45 20 20 67 : E 64 hARDWARE  g
88a0 : __ __ __ BYT 52 45 45 54 49 4e 47 53 20 74 4f 20 61 4c 4c 20 : REETINGS tO aLL 
88b0 : __ __ __ BYT 63 36 34 20 64 45 4d 4f 20 63 4f 44 45 52 53 20 : c64 dEMO cODERS 
88c0 : __ __ __ BYT 20 73 54 49 4c 4c 20 70 55 53 48 49 4e 47 20 74 :  sTILL pUSHING t
88d0 : __ __ __ BYT 48 45 20 6c 49 4d 49 54 53 20 6f 46 20 74 48 45 : HE lIMITS oF tHE
88e0 : __ __ __ BYT 20 63 36 34 20 69 4e 20 32 30 32 36 20 20 20 20 :  c64 iN 2026    
88f0 : __ __ __ BYT 2d 20 63 52 45 44 49 54 53 20 2d 20 20 63 4f 44 : - cREDITS -  cOD
8900 : __ __ __ BYT 45 20 2d 20 6f 53 43 41 52 36 34 20 63 4f 4d 50 : E - oSCAR64 cOMP
8910 : __ __ __ BYT 49 4c 45 52 20 62 59 20 44 52 4d 4f 52 54 41 4c : ILER bY DRMORTAL
8920 : __ __ __ BYT 57 4f 4d 42 41 54 20 20 6d 55 53 49 43 20 2d 20 : WOMBAT  mUSIC - 
8930 : __ __ __ BYT 66 4f 52 45 56 45 52 20 79 4f 55 4e 47 20 2d 20 : fOREVER yOUNG - 
8940 : __ __ __ BYT 34 45 56 2e 4d 4f 44 20 20 66 4f 4e 54 20 2d 20 : 4EV.MOD  fONT - 
8950 : __ __ __ BYT 73 4d 41 4c 4c 20 72 4f 55 4e 44 20 70 65 74 73 : sMALL rOUND pets
8960 : __ __ __ BYT 63 69 69 20 66 4f 4e 54 20 62 59 20 63 55 50 49 : cii fONT bY cUPI
8970 : __ __ __ BYT 44 20 20 75 4c 54 49 4d 41 54 45 20 6c 49 42 52 : D  uLTIMATE lIBR
8980 : __ __ __ BYT 41 52 59 20 62 59 20 73 43 4f 54 54 20 68 55 54 : ARY bY sCOTT hUT
8990 : __ __ __ BYT 54 45 52 20 20 6d 4f 44 20 70 4c 41 59 45 52 20 : TER  mOD pLAYER 
89a0 : __ __ __ BYT 73 4f 55 52 43 45 20 62 59 20 66 52 45 53 48 4e : sOURCE bY fRESHN
89b0 : __ __ __ BYT 45 53 53 20 20 20 20 2d 20 73 50 45 43 49 41 4c : ESS    - sPECIAL
89c0 : __ __ __ BYT 20 74 48 41 4e 4b 53 20 2d 20 20 67 49 44 45 4f :  tHANKS -  gIDEO
89d0 : __ __ __ BYT 4e 20 7a 57 45 49 4a 54 5a 45 52 20 2d 20 63 52 : N zWEIJTZER - cR
89e0 : __ __ __ BYT 45 41 54 4f 52 20 6f 46 20 74 48 45 20 75 4c 54 : EATOR oF tHE uLT
89f0 : __ __ __ BYT 49 4d 41 54 45 20 36 34 20 20 74 48 45 20 66 41 : IMATE 64  tHE fA
8a00 : __ __ __ BYT 53 54 45 53 54 20 63 36 34 20 63 4f 4d 50 41 54 : STEST c64 cOMPAT
8a10 : __ __ __ BYT 49 42 4c 45 20 6d 41 43 48 49 4e 45 20 20 20 20 : IBLE mACHINE    
8a20 : __ __ __ BYT 74 48 41 4e 4b 20 79 4f 55 20 66 4f 52 20 77 41 : tHANK yOU fOR wA
8a30 : __ __ __ BYT 54 43 48 49 4e 47 20 20 70 52 45 53 53 20 61 4e : TCHING  pRESS aN
8a40 : __ __ __ BYT 59 20 6b 45 59 20 74 4f 20 65 58 49 54 20 20 20 : Y kEY tO eXIT   
8a50 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
8a60 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
8a70 : __ __ __ BYT 20 20 20 20 20 20 20 00                         :        .
--------------------------------------------------------------------
letter_width:
8a78 : __ __ __ BYT 03 03 03 03 03 03 03 04 02 03 03 03 03 03 03 03 : ................
8a88 : __ __ __ BYT 03 03 03 03 03 02 03 03 03 03 03 03 03 03 03 02 : ................
8a98 : __ __ __ BYT 03 03 01 02 03 01 05 03 03 03 03 03 03 03 03 02 : ................
8aa8 : __ __ __ BYT 05 03 03 03 03 03 01 03 03 03 03 03 03 03 03 01 : ................
8ab8 : __ __ __ BYT 01 01 01 01 03 01 02 03 03 03 04 03 03 04 02 02 : ................
8ac8 : __ __ __ BYT 02 02 02 02 03 02                               : ......
--------------------------------------------------------------------
tworks:
8ace : __ __ __ BSS	8
--------------------------------------------------------------------
mod_row_buf:
8ad6 : __ __ __ BSS	16
--------------------------------------------------------------------
mx:
8ae6 : __ __ __ BSS	8
--------------------------------------------------------------------
VScreen:
8aee : __ __ __ BSS	8
--------------------------------------------------------------------
wave_phase:
8af6 : __ __ __ BSS	1
--------------------------------------------------------------------
plasma_phase:
8af7 : __ __ __ BSS	1
--------------------------------------------------------------------
done:
8af8 : __ __ __ BSS	1
--------------------------------------------------------------------
loops:
8af9 : __ __ __ BSS	2
--------------------------------------------------------------------
dp_y:
8afb : __ __ __ BSS	1
--------------------------------------------------------------------
df_x:
8afc : __ __ __ BSS	1
--------------------------------------------------------------------
df_yoff:
8afd : __ __ __ BSS	1
--------------------------------------------------------------------
df_r:
8afe : __ __ __ BSS	1
--------------------------------------------------------------------
psin:
8b00 : __ __ __ BYT 04 04 04 05 05 05 05 06 06 06 06 07 07 07 07 07 : ................
8b10 : __ __ __ BYT 07 07 07 07 07 07 06 06 06 06 05 05 05 05 04 04 : ................
8b20 : __ __ __ BYT 04 03 03 02 02 02 02 01 01 01 01 00 00 00 00 00 : ................
8b30 : __ __ __ BYT 00 00 00 00 00 00 01 01 01 01 02 02 02 02 03 03 : ................
--------------------------------------------------------------------
sin_row:
8b40 : __ __ __ BYT 00 01 01 01 01 02 02 02 02 02 01 01 01 01 00 00 : ................
8b50 : __ __ __ BYT ff ff ff fe fe fe fe fe fe fe ff ff ff 00 00 01 : ................
8b60 : __ __ __ BYT 00 01 01 01 01 02 02 02 02 02 01 01 01 01 00 00 : ................
8b70 : __ __ __ BYT ff ff ff fe fe fe fe fe fe fe ff ff ff 00 00 01 : ................
--------------------------------------------------------------------
letter_start:
8b80 : __ __ __ BYT 00 03 06 09 0c 0f 12 15 19 1b 1e 21 24 00 03 06 : ...........!$...
8b90 : __ __ __ BYT 09 0c 0f 12 15 18 1a 1d 20 23 00 03 06 09 0c 0f : ........ #......
8ba0 : __ __ __ BYT 11 14 17 18 1a 1d 1e 23 00 03 06 09 0c 0f 12 15 : .......#........
8bb0 : __ __ __ BYT 17 1c 1f 22 00 00 03 04 07 0a 0d 10 13 16 19 1c : ..."............
8bc0 : __ __ __ BYT 1d 1e 1f 20 21 24 25 00 03 06 09 0d 10 13 17 19 : ... !$%.........
8bd0 : __ __ __ BYT 1b 1d 1f 21 23 26                               : ...!#&
--------------------------------------------------------------------
py_cur:
8bd6 : __ __ __ BSS	16
--------------------------------------------------------------------
px_cur:
8be6 : __ __ __ BSS	16
--------------------------------------------------------------------
HeapNode:
8bf6 : __ __ __ BSS	4
--------------------------------------------------------------------
font_am_ch:
8c00 : __ __ __ BYT 55 44 49 70 44 49 55 44 49 70 44 49 55 44 6e 55 : UDIpDIUDIpDIUDnU
8c10 : __ __ __ BYT 44 6e 55 44 49 72 20 72 20 72 20 20 20 6e 72 20 : DnUDIr r r   nr 
8c20 : __ __ __ BYT 2f 72 20 20 55 72 49 20 6b 46 73 6b 46 73 47 20 : /r  UrI kFskFsG 
8c30 : __ __ __ BYT 20 48 20 48 6b 44 20 6b 44 20 47 44 6e 6b 44 73 :  H HkD kD GDnkDs
8c40 : __ __ __ BYT 20 5d 20 70 20 48 6b 3c 20 5d 20 20 47 48 48 20 :  ] p Hk< ]  GHH 
8c50 : __ __ __ BYT 47 20 48 47 20 48 47 20 20 48 20 48 47 20 20 47 : G HG HG  H HG  G
8c60 : __ __ __ BYT 20 20 47 20 48 48 20 47 20 48 20 47 20 48 48 20 :   G HH G H G HH 
8c70 : __ __ __ BYT 4d 47 20 20 47 5d 48 20 6d 20 7d 6d 46 4b 4a 46 : MG  G]H m }mFKJF
8c80 : __ __ __ BYT 4b 6d 46 4b 4a 46 7d 71 20 20 4a 46 4b 71 20 71 : KmFKJF}q  JFKq q
8c90 : __ __ __ BYT 20 71 20 4a 46 4b 71 20 27 6d 46 7d 4a 20 4b 20 :  q JFKq 'mF}J K 
8ca0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
8cb0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
8cc0 : __ __ __ BYT 20 20 20 20 20 20 20 20                         :         
--------------------------------------------------------------------
bitshift:
8cc8 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
8cd8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8ce8 : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
8cf8 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
font_nz_ch:
8d00 : __ __ __ BYT 72 20 72 55 44 49 55 44 49 55 44 49 55 44 49 55 : r rUDIUDIUDIUDIU
8d10 : __ __ __ BYT 44 49 70 72 6e 55 20 49 74 59 55 20 49 20 20 20 : DIprnU ItYU I   
8d20 : __ __ __ BYT 47 20 47 43 44 6e 20 20 47 4d 48 47 20 48 47 20 : G GCDn  GMHG HG 
8d30 : __ __ __ BYT 48 47 20 48 47 20 48 4a 44 49 20 5d 20 47 20 48 : HG HG HJDI ] G H
8d40 : __ __ __ BYT 54 59 47 48 48 4d 20 2f 4a 46 73 20 4e 20 20 20 : TYGHHM /JFs N   
8d50 : __ __ __ BYT 47 20 48 47 20 48 6b 46 4b 47 20 48 6b 46 4b 47 : G HG HkFKG HkFKG
8d60 : __ __ __ BYT 20 48 20 5d 20 47 20 48 47 48 47 5d 48 20 56 20 :  H ] G HGHG]H V 
8d70 : __ __ __ BYT 47 20 48 4e 20 48 20 20 71 20 71 4a 46 4b 5d 20 : G HN H  q qJFK] 
8d80 : __ __ __ BYT 20 4a 46 4d 5d 20 4d 4a 46 4b 20 71 20 4a 46 4b :  JFM] MJFK q JFK
8d90 : __ __ __ BYT 4a 4b 4a 71 4b 2f 20 4d 6d 46 4b 6d 46 7d 20 20 : JKJqK/ MmFKmF}  
8da0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
8db0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
8dc0 : __ __ __ BYT 20 20 20 20 20 20 20 20                         :         
--------------------------------------------------------------------
scr_letter:
8dc8 : __ __ __ BSS	40
--------------------------------------------------------------------
font_lc_an_ch:
8e00 : __ __ __ BYT 20 20 20 48 20 20 20 20 20 20 20 47 20 20 20 55 :    H       G   U
8e10 : __ __ __ BYT 46 20 20 20 48 20 20 57 20 20 54 20 20 47 20 20 : F   H  W  T  G  
8e20 : __ __ __ BYT 20 20 20 20 20 20 20 20 55 44 49 6b 44 49 55 44 :         UDIkDIUD
8e30 : __ __ __ BYT 49 55 44 73 55 44 49 6b 46 55 44 49 6b 44 49 59 : IUDsUDIkFUDIkDIY
8e40 : __ __ __ BYT 20 49 47 20 4e 42 70 44 72 44 49 70 44 49 20 20 :  IG NBpDrDIpDI  
8e50 : __ __ __ BYT 55 44 73 5d 20 48 47 20 20 47 20 48 6b 46 4b 47 : UDs] HG  G HkFKG
8e60 : __ __ __ BYT 20 47 20 48 47 20 48 48 20 48 6b 3c 20 5d 47 20 :  G HG HH Hk< ]G 
8e70 : __ __ __ BYT 47 20 48 47 20 48 20 20 4a 46 7d 6d 46 4b 4a 46 : G HG H  JF}mFKJF
8e80 : __ __ __ BYT 4b 4a 46 4b 4a 46 4b 4a 20 4a 46 73 42 20 42 71 : KJFKJFKJ JFsB Bq
8e90 : __ __ __ BYT 20 48 42 20 4d 48 6d 20 7d 20 7d 6d 20 7d 20 20 :  HB MHm } }m }  
8ea0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
8eb0 : __ __ __ BYT 20 20 46 4b 20 20 20 20 46 4b 20 20 20 20 20 20 :   FK    FK      
8ec0 : __ __ __ BYT 20 20 20 20 20 20 20 20                         :         
--------------------------------------------------------------------
scr_col:
8ec8 : __ __ __ BSS	40
--------------------------------------------------------------------
font_lc_oz_ch:
8f00 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 48 :                H
8f10 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
8f20 : __ __ __ BYT 20 20 20 20 20 20 20 20 55 44 49 55 44 49 55 44 :         UDIUDIUD
8f30 : __ __ __ BYT 49 55 44 49 55 44 49 6b 44 20 55 20 49 54 59 55 : IUDIUDIkD U ITYU
8f40 : __ __ __ BYT 20 55 20 49 4d 20 2f 55 20 49 70 44 6e 20 20 20 :  U IM /U IpDn   
8f50 : __ __ __ BYT 47 20 48 47 20 48 47 20 48 47 20 20 4a 44 49 47 : G HG HG HG  JDIG
8f60 : __ __ __ BYT 20 48 47 20 48 47 48 47 20 47 20 48 20 56 20 47 :  HG HGHG G H V G
8f70 : __ __ __ BYT 20 48 55 44 4b 20 20 20 4a 46 4b 6b 46 4b 4a 46 :  HUDK   JFKkFKJF
8f80 : __ __ __ BYT 73 71 20 20 4a 46 4b 4a 46 4b 4a 46 4b 4a 4b 4a : sq  JFKJFKJFKJKJ
8f90 : __ __ __ BYT 46 71 46 4b 2f 20 4d 4a 46 73 6d 46 43 20 20 20 : FqFK/ MJFsmFC   
8fa0 : __ __ __ BYT 20 20 20 48 20 20 20 20 47 20 20 20 20 20 20 20 :    H    G       
8fb0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
8fc0 : __ __ __ BYT 46 4b 20 20 20 20 20 20                         : FK      
--------------------------------------------------------------------
font_dig_ch:
9000 : __ __ __ BYT 55 44 49 49 55 44 49 55 44 49 55 20 49 70 44 6e : UDIIUDIUDIU IpDn
9010 : __ __ __ BYT 55 44 49 70 44 6e 55 44 49 55 44 49 20 20 59 20 : UDIpDnUDIUDI  Y 
9020 : __ __ __ BYT 20 20 20 20 42 42 42 20 47 4e 48 48 55 46 4b 20 :     BBB GNHHUFK 
9030 : __ __ __ BYT 46 73 47 20 48 4a 44 49 6b 44 49 20 55 7d 6b 46 : FsG HJDIkDI U}kF
9040 : __ __ __ BYT 73 47 20 48 51 20 48 51 20 20 20 2f 48 48 47 20 : sG HQ HQ   /HHG 
9050 : __ __ __ BYT 47 20 48 48 47 20 20 20 20 48 4a 46 73 47 20 48 : G HHG    HJFsG H
9060 : __ __ __ BYT 47 20 48 20 47 20 47 20 48 4a 46 73 51 20 5d 42 : G H G G HJFsQ ]B
9070 : __ __ __ BYT 42 20 4e 20 20 20 20 20 4a 46 4b 71 4a 46 7d 6d : B N     JFKqJF}m
9080 : __ __ __ BYT 46 4b 20 20 47 4a 46 4b 4a 46 4b 20 54 20 4a 46 : FK  GJFKJFK T JF
9090 : __ __ __ BYT 4b 4a 46 4b 20 51 51 48 48 2f 20 20 20 20 20 20 : KJFK QQHH/      
90a0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
90b0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 4b :                K
90c0 : __ __ __ BYT 4b 20 20 20 20 20 20 20                         : K       
--------------------------------------------------------------------
font_sym_ch:
9100 : __ __ __ BYT 55 5b 49 55 44 49 20 20 20 20 20 20 20 20 20 20 : U[IUDI          
9110 : __ __ __ BYT 70 44 49 20 20 20 20 47 47 55 44 20 2f 44 49 4d : pDI    GGUD /DIM
9120 : __ __ __ BYT 20 70 40 20 20 20 40 6e 4a 5b 49 6b 46 73 57 20 :  p@   @nJ[IkFsW 
9130 : __ __ __ BYT 2f 20 20 20 20 20 48 20 20 55 4b 46 43 44 20 5b : /     H  UKFCD [
9140 : __ __ __ BYT 5b 47 20 3c 20 20 48 20 3e 5d 20 55 44 49 20 42 : [G <  H >] UDI B
9150 : __ __ __ BYT 20 42 48 47 4d 48 20 4e 20 20 46 43 44 46 5b 44 :  BHGMH N  FCDF[D
9160 : __ __ __ BYT 20 47 20 46 43 44 20 5b 5b 47 20 20 4d 20 48 2f :  G FCD [[G  M H/
9170 : __ __ __ BYT 20 5d 20 47 4a 4b 20 42 4a 5b 4b 4a 46 5b 2f 20 :  ] GJK BJ[KJF[/ 
9180 : __ __ __ BYT 57 20 20 20 20 20 47 20 20 51 20 20 20 20 20 48 : W     G  Q     H
9190 : __ __ __ BYT 48 4a 46 20 20 46 4b 20 20 6d 40 4a 46 4b 40 7d : HJF  FK  m@JFK@}
91a0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
91b0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
91c0 : __ __ __ BYT 20 20 20 20 20 20 20 20                         :         
--------------------------------------------------------------------
font_am_co:
9200 : __ __ __ BYT 0f 0d 01 0f 0d 01 0f 0d 01 0f 0d 01 0f 0d 01 0f : ................
9210 : __ __ __ BYT 0d 01 0f 0d 01 0f 0d 01 0d 01 01 0d 0d 01 0f 0d : ................
9220 : __ __ __ BYT 01 01 0d 0d 0d 0d 01 0d 0f 0d 0d 0f 0d 0d 0f 0f : ................
9230 : __ __ __ BYT 0f 0f 0f 0d 0f 0d 0f 05 0f 0f 0f 0f 0f 0f 0d 0d : ................
9240 : __ __ __ BYT 0d 0d 0d 0d 0d 0d 0f 01 0d 0d 0d 0f 0f 0d 0d 0d : ................
9250 : __ __ __ BYT 05 0f 0d 05 0f 0d 05 0f 0d 05 0f 0d 05 0f 0d 05 : ................
9260 : __ __ __ BYT 0f 05 05 0f 0d 05 0f 0d 0d 0f 0d 05 0f 0d 05 0d : ................
9270 : __ __ __ BYT 0d 0f 0f 0d 05 0f 0f 0d 05 0f 0f 05 05 0f 05 05 : ................
9280 : __ __ __ BYT 0f 05 05 0f 05 05 0f 05 05 05 05 05 0f 05 0f 0f : ................
9290 : __ __ __ BYT 0d 05 0d 05 05 0f 05 0d 05 05 05 0f 05 0d 0f 0d : ................
92a0 : __ __ __ BYT 0e 0f 0f 0e 0e 0e 0f 0f 0d 0d 0d 0d 0d 0d 0d 0e : ................
92b0 : __ __ __ BYT 0e 0e 0e 0e 0f 0e 0f 0f 0f 0d 0d 0e 0e 0f 0f 0d : ................
92c0 : __ __ __ BYT 0d 0e 0d 0d 0e 0e 0d 0e                         : ........
--------------------------------------------------------------------
font_nz_co:
9300 : __ __ __ BYT 0f 0d 01 0f 0d 01 0d 0d 01 0f 0d 01 0d 0d 01 0f : ................
9310 : __ __ __ BYT 0d 01 0f 0d 01 0f 0d 01 0d 01 0d 0d 01 0f 0d 01 : ................
9320 : __ __ __ BYT 0f 0d 01 0f 0d 01 0d 0d 0f 0d 0d 0f 0d 0d 0f 0f : ................
9330 : __ __ __ BYT 0d 0f 0d 0d 0f 0f 0d 0f 0d 01 05 0f 0f 0f 0f 0f : ................
9340 : __ __ __ BYT 0f 0d 0f 0d 0d 0f 0d 01 0f 0d 0d 0f 0d 01 0d 0d : ................
9350 : __ __ __ BYT 05 0f 0d 05 0f 0d 05 0f 0f 05 0f 0d 05 0f 0f 05 : ................
9360 : __ __ __ BYT 0f 0d 05 0f 05 05 0f 0d 05 0f 05 0f 0f 0f 0d 0d : ................
9370 : __ __ __ BYT 05 0f 0d 05 0f 0d 0d 0d 05 0f 0f 05 05 0f 05 05 : ................
9380 : __ __ __ BYT 05 05 05 0f 05 05 05 05 05 0f 05 05 05 05 05 0f : ................
9390 : __ __ __ BYT 05 0d 05 05 0f 05 0f 0d 05 05 0f 05 05 0f 0d 0d : ................
93a0 : __ __ __ BYT 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e : ................
93b0 : __ __ __ BYT 0e 0e 0e 0e 0e 0e 0e 0f 0e 0e 0e 0e 0e 05 05 05 : ................
93c0 : __ __ __ BYT 0e 05 05 05 0e 0e 05 0e                         : ........
--------------------------------------------------------------------
font_lc_an_co:
9400 : __ __ __ BYT 0e 0e 0e 0d 0d 0e 0e 0e 0e 0e 0f 0d 0e 0e 0e 0d : ................
9410 : __ __ __ BYT 01 0e 0e 0e 0f 0f 0e 01 0e 0e 01 0f 0e 01 0f 0e : ................
9420 : __ __ __ BYT 0e 0e 0e 0e 0e 0e 0e 0e 0f 0d 01 0f 0d 01 0f 0d : ................
9430 : __ __ __ BYT 01 0d 01 01 0f 0d 01 0d 01 0f 0d 01 0d 01 01 01 : ................
9440 : __ __ __ BYT 0f 0d 0d 0d 01 0d 0f 0d 01 0f 01 0f 0d 01 0e 0e : ................
9450 : __ __ __ BYT 05 0d 0d 05 0e 0d 0f 0f 0e 0f 0f 0d 0f 0d 01 0f : ................
9460 : __ __ __ BYT 0f 0f 0f 0d 0f 0f 0d 0d 0f 01 0f 0d 0f 0f 05 0f : ................
9470 : __ __ __ BYT 0d 0f 0d 05 0f 0d 0f 0e 05 05 0f 05 05 0f 05 0f : ................
9480 : __ __ __ BYT 0d 05 05 0f 05 05 0f 05 0f 05 05 0f 05 0f 0f 0f : ................
9490 : __ __ __ BYT 0f 0d 05 05 05 05 05 0f 0f 0f 0f 05 0f 0f 0f 0e : ................
94a0 : __ __ __ BYT 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0f 0f 0e 0e 0f : ................
94b0 : __ __ __ BYT 0f 0f 05 0f 0f 0f 0f 0f 05 0f 0f 0f 0f 0f 0f 0f : ................
94c0 : __ __ __ BYT 0e 0e 0e 0e 0e 0e 0e 0e                         : ........
--------------------------------------------------------------------
font_lc_oz_co:
9500 : __ __ __ BYT 0e 0e 0e 0f 0f 0e 0e 0e 0e 0e 0e 0e 0e 0f 0e 01 : ................
9510 : __ __ __ BYT 0e 0e 0f 0f 0f 0e 0f 0f 0f 0f 0e 0e 0f 0f 0f 0f : ................
9520 : __ __ __ BYT 0f 0f 0f 0e 0e 0e 0e 0e 0f 0d 01 0f 0d 01 0f 0d : ................
9530 : __ __ __ BYT 01 0d 01 0d 0d 01 0d 0d 01 0f 0d 0f 01 0d 01 0d : ................
9540 : __ __ __ BYT 0f 01 0f 01 01 0f 01 0d 0f 01 0f 0d 01 0e 0e 0e : ................
9550 : __ __ __ BYT 05 0f 0d 0f 0f 0d 0f 0f 0d 0f 0f 0f 0d 0f 0f 0f : ................
9560 : __ __ __ BYT 0f 0d 0f 0f 01 0f 0d 0f 0f 0d 0f 0d 0f 0d 0f 0f : ................
9570 : __ __ __ BYT 0f 01 0f 0f 0d 0e 0e 0e 05 05 0f 05 0f 0f 05 05 : ................
9580 : __ __ __ BYT 0f 05 0f 0f 05 05 0f 05 05 0f 05 0f 0d 05 0f 05 : ................
9590 : __ __ __ BYT 05 0f 05 0f 05 0f 0f 05 0f 0d 05 05 0f 0f 0e 0e : ................
95a0 : __ __ __ BYT 0e 0f 0f 05 0e 0f 0f 0e 05 0e 0f 0e 0e 0e 0e 0e : ................
95b0 : __ __ __ BYT 0e 0e 0f 0f 0f 0f 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e : ................
95c0 : __ __ __ BYT 05 0f 0e 0e 0e 0e 0e 0e                         : ........
--------------------------------------------------------------------
font_dig_co:
9600 : __ __ __ BYT 0f 0d 01 01 0f 0d 01 0d 01 01 0d 0f 01 0f 0d 01 : ................
9610 : __ __ __ BYT 0f 0d 01 0f 0d 01 0f 0d 01 0d 01 01 0f 0f 01 01 : ................
9620 : __ __ __ BYT 0f 0f 0f 0f 01 01 01 0e 0f 0f 01 0d 0f 0d 01 0f : ................
9630 : __ __ __ BYT 0f 0d 0f 0f 0d 0f 0d 01 0f 0d 01 0f 0f 0d 0f 0d : ................
9640 : __ __ __ BYT 01 0f 0f 0d 0d 0f 0d 0d 0f 0e 0f 0d 0d 0d 0d 0e : ................
9650 : __ __ __ BYT 05 0f 0d 0f 05 0f 0f 0f 0f 0f 05 05 0f 05 0f 0d : ................
9660 : __ __ __ BYT 05 0f 0d 0f 0f 0e 05 0f 0d 05 0f 0f 0f 0f 0f 0f : ................
9670 : __ __ __ BYT 0d 0f 0f 0f 0f 0e 0e 0e 05 05 0f 05 05 05 0f 05 : ................
9680 : __ __ __ BYT 05 0f 0f 0f 05 05 05 0f 05 05 0f 0f 05 0e 05 05 : ................
9690 : __ __ __ BYT 0f 05 05 0f 0f 0f 05 05 0f 05 0e 0e 0e 0e 0e 0e : ................
96a0 : __ __ __ BYT 0e 0f 0f 0e 0e 0e 0f 0f 0f 0f 0e 0e 0f 0f 0f 0e : ................
96b0 : __ __ __ BYT 0e 0e 0e 0e 0f 0e 0f 0f 0f 0f 0f 0e 0e 0f 0f 05 : ................
96c0 : __ __ __ BYT 05 0e 0e 0e 0e 0e 0e 0e                         : ........
--------------------------------------------------------------------
font_sym_co:
9700 : __ __ __ BYT 0f 0d 01 0d 01 01 0e 0f 0f 0e 0e 0e 0e 0f 0e 0f : ................
9710 : __ __ __ BYT 0d 01 01 0e 0e 0e 0e 0d 01 0d 01 0f 01 0d 01 01 : ................
9720 : __ __ __ BYT 0e 0d 01 0e 0e 0e 0d 01 0f 0d 01 0f 0f 0d 0d 0f : ................
9730 : __ __ __ BYT 01 0e 0e 0e 0f 0f 01 0f 0f 0f 0d 0f 0d 01 0f 0f : ................
9740 : __ __ __ BYT 0d 0f 0f 0d 0f 0f 0d 0e 0d 0f 0f 0d 0d 01 0f 0d : ................
9750 : __ __ __ BYT 0f 0f 0d 05 0f 0d 0f 0d 0f 0f 0f 0d 01 0f 0d 0f : ................
9760 : __ __ __ BYT 0f 05 0e 0f 0d 01 0e 0f 0f 05 0f 0e 0f 0f 0f 0f : ................
9770 : __ __ __ BYT 0e 05 0f 0f 0d 0f 0f 0f 05 05 0f 05 0f 0f 0f 0e : ................
9780 : __ __ __ BYT 0f 0f 0e 0f 0e 0f 0f 0f 0e 05 0e 0e 0e 0e 0e 05 : ................
9790 : __ __ __ BYT 05 05 0f 0f 0e 05 05 0e 0e 05 0f 05 05 0f 0f 05 : ................
97a0 : __ __ __ BYT 0e 0e 0e 0e 0f 0f 0e 0e 0f 0f 0f 0e 0e 0e 0f 0e : ................
97b0 : __ __ __ BYT 0e 0f 0d 0e 0e 0e 0e 0f 0e 0d 0d 0d 0d 0d 0e 0e : ................
97c0 : __ __ __ BYT 0e 0e 0e 0e 0e 0d 0f 0e                         : ........
--------------------------------------------------------------------
uii_data:
97c8 : __ __ __ BSS	513
--------------------------------------------------------------------
uii_status:
99c9 : __ __ __ BSS	257
--------------------------------------------------------------------
_uii_fp:
9b00 : __ __ __ BSS	128
--------------------------------------------------------------------
hdr:
9b80 : __ __ __ BSS	1084
--------------------------------------------------------------------
modplay:
9fbc : __ __ __ BSS	938
--------------------------------------------------------------------
BLIT_CODE:
a400 : __ __ __ BSS	224
--------------------------------------------------------------------
tbuffer:
a4e0 : __ __ __ BSS	320
--------------------------------------------------------------------
row_sin:
a620 : __ __ __ BSS	200
--------------------------------------------------------------------
row_buf:
a700 : __ __ __ BSS	160
--------------------------------------------------------------------
tex_flat:
a7a0 : __ __ __ BSS	1024
