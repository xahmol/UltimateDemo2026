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
080e : 8e fd 77 STX $77fd ; (spentry + 0)
0811 : a2 8f __ LDX #$8f
0813 : a0 c8 __ LDY #$c8
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 a2 __ CPX #$a2
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
083b : a9 85 __ LDA #$85
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
0a00 : a5 53 __ LDA T2 + 0 
0a02 : 8d 87 bf STA $bf87 ; (main@stack + 0)
0a05 : a5 54 __ LDA T3 + 0 
0a07 : 8d 88 bf STA $bf88 ; (main@stack + 1)
.s4:
0a0a : a9 60 __ LDA #$60
0a0c : 8d 10 03 STA $0310 
0a0f : a9 10 __ LDA #$10
0a11 : 8d 02 a0 STA $a002 ; (tex_flat[0] + 354)
0a14 : a9 03 __ LDA #$03
0a16 : 8d 03 a0 STA $a003 ; (tex_flat[0] + 355)
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
0a36 : a9 5e __ LDA #$5e
0a38 : 8d 18 03 STA $0318 
0a3b : a9 0e __ LDA #$0e
0a3d : 8d 19 03 STA $0319 
0a40 : a9 74 __ LDA #$74
0a42 : 85 16 __ STA P9 
0a44 : a9 10 __ LDA #$10
0a46 : 85 17 __ STA P10 
0a48 : 20 69 0e JSR $0e69 ; (screen_init.s4 + 0)
0a4b : a9 25 __ LDA #$25
0a4d : 85 10 __ STA P3 
0a4f : a9 11 __ LDA #$11
0a51 : 85 11 __ STA P4 
0a53 : 20 9e 10 JSR $109e ; (screen_info.s4 + 0)
0a56 : a9 00 __ LDA #$00
0a58 : 8d 09 dc STA $dc09 
0a5b : 8d 08 dc STA $dc08 
0a5e : 85 54 __ STA T3 + 0 
.l5:
0a60 : 20 46 11 JSR $1146 ; (uii_detect.s4 + 0)
0a63 : aa __ __ TAX
0a64 : d0 07 __ BNE $0a6d ; (main.s7 + 0)
.s6:
0a66 : ad 09 dc LDA $dc09 
0a69 : c9 0a __ CMP #$0a
0a6b : 90 f3 __ BCC $0a60 ; (main.l5 + 0)
.s7:
0a6d : 20 46 11 JSR $1146 ; (uii_detect.s4 + 0)
0a70 : aa __ __ TAX
0a71 : d0 3b __ BNE $0aae ; (main.s9 + 0)
.s8:
0a73 : 85 12 __ STA P5 
0a75 : a9 ca __ LDA #$ca
0a77 : 85 10 __ STA P3 
0a79 : a9 11 __ LDA #$11
0a7b : 85 14 __ STA P7 
0a7d : a9 11 __ LDA #$11
0a7f : 85 11 __ STA P4 
0a81 : a9 d0 __ LDA #$d0
0a83 : 85 13 __ STA P6 
0a85 : 20 67 11 JSR $1167 ; (screen_result.s4 + 0)
0a88 : a9 64 __ LDA #$64
0a8a : 85 12 __ STA P5 
0a8c : a9 12 __ LDA #$12
0a8e : 85 13 __ STA P6 
0a90 : a9 12 __ LDA #$12
0a92 : a2 89 __ LDX #$89
.s72:
0a94 : 86 14 __ STX P7 
0a96 : 85 15 __ STA P8 
0a98 : 20 dd 11 JSR $11dd ; (screen_error_exit.s4 + 0)
0a9b : a9 01 __ LDA #$01
0a9d : 85 1b __ STA ACCU + 0 
0a9f : a9 00 __ LDA #$00
.s3:
0aa1 : 85 1c __ STA ACCU + 1 
0aa3 : ad 87 bf LDA $bf87 ; (main@stack + 0)
0aa6 : 85 53 __ STA T2 + 0 
0aa8 : ad 88 bf LDA $bf88 ; (main@stack + 1)
0aab : 85 54 __ STA T3 + 0 
0aad : 60 __ __ RTS
.s9:
0aae : a9 01 __ LDA #$01
0ab0 : 8d fe 77 STA $77fe ; (uii_target + 0)
0ab3 : 8d 8e bf STA $bf8e ; (cmd[0] + 1)
0ab6 : a9 02 __ LDA #$02
0ab8 : 85 0f __ STA P2 
0aba : a9 00 __ LDA #$00
0abc : 85 10 __ STA P3 
0abe : 8d 8d bf STA $bf8d ; (cmd[0] + 0)
0ac1 : a9 8d __ LDA #$8d
0ac3 : 85 0d __ STA P0 
0ac5 : a9 bf __ LDA #$bf
0ac7 : 85 0e __ STA P1 
0ac9 : 20 a4 12 JSR $12a4 ; (uii_sendcommand.s4 + 0)
0acc : 20 1f 13 JSR $131f ; (uii_readdata.s4 + 0)
0acf : 20 4f 13 JSR $134f ; (uii_readstatus.s4 + 0)
0ad2 : 20 ad 13 JSR $13ad ; (uii_accept.s4 + 0)
0ad5 : ad c9 91 LDA $91c9 ; (uii_status[0] + 0)
0ad8 : c9 30 __ CMP #$30
0ada : d0 12 __ BNE $0aee ; (main.s10 + 0)
.s69:
0adc : ad ca 91 LDA $91ca ; (uii_status[0] + 1)
0adf : c9 30 __ CMP #$30
0ae1 : d0 0b __ BNE $0aee ; (main.s10 + 0)
.s70:
0ae3 : ad c8 8f LDA $8fc8 ; (uii_data[0] + 0)
0ae6 : f0 06 __ BEQ $0aee ; (main.s10 + 0)
.s71:
0ae8 : 20 bd 13 JSR $13bd ; (uci_to_upper@proxy + 0)
0aeb : 4c f9 0a JMP $0af9 ; (main.s12 + 0)
.s10:
0aee : a2 ff __ LDX #$ff
.l11:
0af0 : e8 __ __ INX
0af1 : bd f7 13 LDA $13f7,x 
0af4 : 9d 93 bf STA $bf93,x ; (detail[0] + 0)
0af7 : d0 f7 __ BNE $0af0 ; (main.l11 + 0)
.s12:
0af9 : a9 ca __ LDA #$ca
0afb : 85 10 __ STA P3 
0afd : a9 11 __ LDA #$11
0aff : 85 11 __ STA P4 
0b01 : 20 5b 11 JSR $115b ; (screen_result@proxy + 0)
0b04 : 20 7f 13 JSR $137f ; (uii_get_hwinfo.s4 + 0)
0b07 : ad c9 91 LDA $91c9 ; (uii_status[0] + 0)
0b0a : c9 30 __ CMP #$30
0b0c : d0 2e __ BNE $0b3c ; (main.s13 + 0)
.s66:
0b0e : ad ca 91 LDA $91ca ; (uii_status[0] + 1)
0b11 : c9 30 __ CMP #$30
0b13 : d0 27 __ BNE $0b3c ; (main.s13 + 0)
.s67:
0b15 : 20 bd 13 JSR $13bd ; (uci_to_upper@proxy + 0)
0b18 : aa __ __ TAX
0b19 : f0 21 __ BEQ $0b3c ; (main.s13 + 0)
.s68:
0b1b : a9 01 __ LDA #$01
0b1d : 85 0f __ STA P2 
0b1f : a9 14 __ LDA #$14
0b21 : 85 0e __ STA P1 
0b23 : a9 00 __ LDA #$00
0b25 : 85 0d __ STA P0 
0b27 : 20 c5 10 JSR $10c5 ; (cwin_put_string.s4 + 0)
0b2a : a9 93 __ LDA #$93
0b2c : 85 0d __ STA P0 
0b2e : a9 03 __ LDA #$03
0b30 : 85 0f __ STA P2 
0b32 : a9 bf __ LDA #$bf
0b34 : 85 0e __ STA P1 
0b36 : 20 c5 10 JSR $10c5 ; (cwin_put_string.s4 + 0)
0b39 : 20 a5 10 JSR $10a5 ; (cwin_cursor_newline.s4 + 0)
.s13:
0b3c : a9 0b __ LDA #$0b
0b3e : 85 10 __ STA P3 
0b40 : a9 14 __ LDA #$14
0b42 : 85 11 __ STA P4 
0b44 : 20 9e 10 JSR $109e ; (screen_info.s4 + 0)
0b47 : 20 1b 14 JSR $141b ; (detect_reu.s4 + 0)
0b4a : c9 10 __ CMP #$10
0b4c : b0 03 __ BCS $0b51 ; (main.s14 + 0)
0b4e : 4c 37 0e JMP $0e37 ; (main.s62 + 0)
.s14:
0b51 : a9 15 __ LDA #$15
0b53 : 85 14 __ STA P7 
0b55 : a9 9a __ LDA #$9a
0b57 : 85 13 __ STA P6 
0b59 : 20 40 78 JSR $7840 ; (screen_result@proxy + 0)
0b5c : a9 a0 __ LDA #$a0
0b5e : 85 10 __ STA P3 
0b60 : a9 15 __ LDA #$15
0b62 : 85 11 __ STA P4 
0b64 : 20 9e 10 JSR $109e ; (screen_info.s4 + 0)
0b67 : 20 b7 15 JSR $15b7 ; (turbo_detect.s4 + 0)
0b6a : a9 8f __ LDA #$8f
0b6c : 85 10 __ STA P3 
0b6e : a9 16 __ LDA #$16
0b70 : 85 11 __ STA P4 
0b72 : a5 1b __ LDA ACCU + 0 
0b74 : d0 1b __ BNE $0b91 ; (main.s36 + 0)
.s15:
0b76 : c6 12 __ DEC P5 
0b78 : a9 95 __ LDA #$95
0b7a : 85 13 __ STA P6 
0b7c : a9 16 __ LDA #$16
0b7e : 85 14 __ STA P7 
0b80 : 20 67 11 JSR $1167 ; (screen_result.s4 + 0)
0b83 : a9 aa __ LDA #$aa
0b85 : 85 10 __ STA P3 
0b87 : a9 16 __ LDA #$16
0b89 : 85 11 __ STA P4 
0b8b : 20 2c 12 JSR $122c ; (screen_hint.s4 + 0)
0b8e : 4c 32 0c JMP $0c32 ; (main.s16 + 0)
.s36:
0b91 : c9 02 __ CMP #$02
0b93 : d0 14 __ BNE $0ba9 ; (main.s37 + 0)
.s61:
0b95 : a9 16 __ LDA #$16
0b97 : a2 cc __ LDX #$cc
.s38:
0b99 : 86 1b __ STX ACCU + 0 
0b9b : 85 1c __ STA ACCU + 1 
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
0baf : a2 8f __ LDX #$8f
0bb1 : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s41:
0bb4 : 20 d3 16 JSR $16d3 ; (turbo_get.s3 + 0)
0bb7 : 29 0f __ AND #$0f
0bb9 : c9 0e __ CMP #$0e
0bbb : d0 07 __ BNE $0bc4 ; (main.s42 + 0)
.s60:
0bbd : a9 16 __ LDA #$16
0bbf : a2 d7 __ LDX #$d7
0bc1 : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s42:
0bc4 : c9 0d __ CMP #$0d
0bc6 : d0 07 __ BNE $0bcf ; (main.s43 + 0)
.s59:
0bc8 : a9 16 __ LDA #$16
0bca : a2 de __ LDX #$de
0bcc : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s43:
0bcf : c9 0c __ CMP #$0c
0bd1 : d0 07 __ BNE $0bda ; (main.s44 + 0)
.s58:
0bd3 : a9 16 __ LDA #$16
0bd5 : a2 e5 __ LDX #$e5
0bd7 : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s44:
0bda : c9 0b __ CMP #$0b
0bdc : d0 07 __ BNE $0be5 ; (main.s45 + 0)
.s57:
0bde : a9 16 __ LDA #$16
0be0 : a2 ec __ LDX #$ec
0be2 : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s45:
0be5 : c9 0a __ CMP #$0a
0be7 : d0 07 __ BNE $0bf0 ; (main.s46 + 0)
.s56:
0be9 : a9 16 __ LDA #$16
0beb : a2 f3 __ LDX #$f3
0bed : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s46:
0bf0 : c9 09 __ CMP #$09
0bf2 : d0 07 __ BNE $0bfb ; (main.s47 + 0)
.s55:
0bf4 : a9 17 __ LDA #$17
0bf6 : a2 00 __ LDX #$00
0bf8 : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s47:
0bfb : c9 08 __ CMP #$08
0bfd : d0 07 __ BNE $0c06 ; (main.s48 + 0)
.s54:
0bff : a9 17 __ LDA #$17
0c01 : a2 07 __ LDX #$07
0c03 : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s48:
0c06 : c9 07 __ CMP #$07
0c08 : d0 07 __ BNE $0c11 ; (main.s49 + 0)
.s53:
0c0a : a9 17 __ LDA #$17
0c0c : a2 0e __ LDX #$0e
0c0e : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s49:
0c11 : c9 06 __ CMP #$06
0c13 : d0 07 __ BNE $0c1c ; (main.s50 + 0)
.s52:
0c15 : a9 17 __ LDA #$17
0c17 : a2 15 __ LDX #$15
0c19 : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.s50:
0c1c : c9 05 __ CMP #$05
0c1e : d0 8d __ BNE $0bad ; (main.s73 + 0)
.s51:
0c20 : a9 16 __ LDA #$16
0c22 : a2 fa __ LDX #$fa
0c24 : 4c 99 0b JMP $0b99 ; (main.s38 + 0)
.l39:
0c27 : c8 __ __ INY
0c28 : b1 1b __ LDA (ACCU + 0),y 
0c2a : 99 93 bf STA $bf93,y ; (detail[0] + 0)
0c2d : d0 f8 __ BNE $0c27 ; (main.l39 + 0)
.s40:
0c2f : 20 67 11 JSR $1167 ; (screen_result.s4 + 0)
.s16:
0c32 : a9 1c __ LDA #$1c
0c34 : 85 10 __ STA P3 
0c36 : a9 17 __ LDA #$17
0c38 : 85 11 __ STA P4 
0c3a : 20 9e 10 JSR $109e ; (screen_info.s4 + 0)
0c3d : 20 37 17 JSR $1737 ; (audio_detect.s4 + 0)
0c40 : aa __ __ TAX
0c41 : d0 23 __ BNE $0c66 ; (main.s27 + 0)
.s17:
0c43 : 85 12 __ STA P5 
0c45 : a9 b0 __ LDA #$b0
0c47 : 85 10 __ STA P3 
0c49 : a9 17 __ LDA #$17
0c4b : 85 14 __ STA P7 
0c4d : a9 17 __ LDA #$17
0c4f : 85 11 __ STA P4 
0c51 : a9 b6 __ LDA #$b6
0c53 : 85 13 __ STA P6 
0c55 : 20 67 11 JSR $1167 ; (screen_result.s4 + 0)
0c58 : a9 c7 __ LDA #$c7
0c5a : 85 10 __ STA P3 
0c5c : a9 17 __ LDA #$17
0c5e : 85 11 __ STA P4 
0c60 : 20 2c 12 JSR $122c ; (screen_hint.s4 + 0)
0c63 : 4c 06 0d JMP $0d06 ; (main.s18 + 0)
.s27:
0c66 : ad 21 df LDA $df21 
0c69 : 85 53 __ STA T2 + 0 
0c6b : 85 0f __ STA P2 
0c6d : a9 8f __ LDA #$8f
0c6f : 85 0d __ STA P0 
0c71 : a9 bf __ LDA #$bf
0c73 : 85 0e __ STA P1 
0c75 : 20 e6 17 JSR $17e6 ; (fmt_dec.s4 + 0)
0c78 : a9 93 __ LDA #$93
0c7a : 85 0d __ STA P0 
0c7c : a9 bf __ LDA #$bf
0c7e : 85 0e __ STA P1 
0c80 : a9 8f __ LDA #$8f
0c82 : 85 0f __ STA P2 
0c84 : a9 bf __ LDA #$bf
0c86 : 85 10 __ STA P3 
0c88 : a2 ff __ LDX #$ff
.l28:
0c8a : e8 __ __ INX
0c8b : bd fe 13 LDA $13fe,x 
0c8e : 9d 93 bf STA $bf93,x ; (detail[0] + 0)
0c91 : d0 f7 __ BNE $0c8a ; (main.l28 + 0)
.s29:
0c93 : 20 36 18 JSR $1836 ; (strcat.s4 + 0)
0c96 : a9 17 __ LDA #$17
0c98 : 85 11 __ STA P4 
0c9a : a9 b0 __ LDA #$b0
0c9c : 85 10 __ STA P3 
0c9e : 20 5b 11 JSR $115b ; (screen_result@proxy + 0)
0ca1 : a5 53 __ LDA T2 + 0 
0ca3 : f0 61 __ BEQ $0d06 ; (main.s18 + 0)
.s30:
0ca5 : a9 69 __ LDA #$69
0ca7 : 85 10 __ STA P3 
0ca9 : a9 18 __ LDA #$18
0cab : 85 11 __ STA P4 
0cad : 20 9e 10 JSR $109e ; (screen_info.s4 + 0)
0cb0 : 20 7a 18 JSR $187a ; (uii_change_dir.s4 + 0)
0cb3 : 20 01 19 JSR $1901 ; (modplay_load.s4 + 0)
0cb6 : a5 1b __ LDA ACCU + 0 
0cb8 : d0 1a __ BNE $0cd4 ; (main.s33 + 0)
.s31:
0cba : a9 0c __ LDA #$0c
0cbc : 85 10 __ STA P3 
0cbe : a9 1d __ LDA #$1d
0cc0 : 85 11 __ STA P4 
0cc2 : a9 1d __ LDA #$1d
0cc4 : a2 29 __ LDX #$29
.s32:
0cc6 : 86 13 __ STX P6 
0cc8 : 85 14 __ STA P7 
0cca : a9 00 __ LDA #$00
0ccc : 85 12 __ STA P5 
.s74:
0cce : 20 67 11 JSR $1167 ; (screen_result.s4 + 0)
0cd1 : 4c 06 0d JMP $0d06 ; (main.s18 + 0)
.s33:
0cd4 : 20 48 1a JSR $1a48 ; (modplay_init.s4 + 0)
0cd7 : a9 0c __ LDA #$0c
0cd9 : 85 10 __ STA P3 
0cdb : a9 1d __ LDA #$1d
0cdd : 85 11 __ STA P4 
0cdf : a5 1b __ LDA ACCU + 0 
0ce1 : f0 1c __ BEQ $0cff ; (main.s34 + 0)
.s35:
0ce3 : a9 01 __ LDA #$01
0ce5 : e6 54 __ INC T3 + 0 
0ce7 : 85 12 __ STA P5 
0ce9 : 8d 97 97 STA $9797 ; (modplay.stereo + 0)
0cec : 8d 99 97 STA $9799 ; (modplay.loop_song + 0)
0cef : a9 a0 __ LDA #$a0
0cf1 : 8d 96 97 STA $9796 ; (modplay.master_volume + 0)
0cf4 : a9 12 __ LDA #$12
0cf6 : 85 13 __ STA P6 
0cf8 : a9 1d __ LDA #$1d
0cfa : 85 14 __ STA P7 
0cfc : 4c ce 0c JMP $0cce ; (main.s74 + 0)
.s34:
0cff : a9 1d __ LDA #$1d
0d01 : a2 1a __ LDX #$1a
0d03 : 4c c6 0c JMP $0cc6 ; (main.s32 + 0)
.s18:
0d06 : 20 a5 10 JSR $10a5 ; (cwin_cursor_newline.s4 + 0)
0d09 : a9 38 __ LDA #$38
0d0b : 85 10 __ STA P3 
0d0d : a9 1d __ LDA #$1d
0d0f : 85 11 __ STA P4 
0d11 : 20 9e 10 JSR $109e ; (screen_info.s4 + 0)
0d14 : 20 a5 10 JSR $10a5 ; (cwin_cursor_newline.s4 + 0)
0d17 : a9 8d __ LDA #$8d
0d19 : 85 10 __ STA P3 
0d1b : a9 1d __ LDA #$1d
0d1d : 85 11 __ STA P4 
0d1f : 20 4c 1d JSR $1d4c ; (screen_wait_key.s4 + 0)
0d22 : 20 ae 1d JSR $1dae ; (gears_run.s1 + 0)
0d25 : a5 54 __ LDA T3 + 0 
0d27 : f0 03 __ BEQ $0d2c ; (main.s19 + 0)
.s26:
0d29 : 20 6d 3e JSR $3e6d ; (modplay_start.s4 + 0)
.s19:
0d2c : 20 e2 4d JSR $4de2 ; (mandel_run.s4 + 0)
0d2f : 20 a0 52 JSR $52a0 ; (ball_run.s1 + 0)
0d32 : 20 b0 60 JSR $60b0 ; (vectors_run.s1 + 0)
0d35 : 20 b0 65 JSR $65b0 ; (plasma_run.s1 + 0)
0d38 : 20 6b 68 JSR $686b ; (tunnel_run.s1 + 0)
0d3b : a9 10 __ LDA #$10
0d3d : 8d 02 a0 STA $a002 ; (tex_flat[0] + 354)
0d40 : a9 03 __ LDA #$03
0d42 : 8d 03 a0 STA $a003 ; (tex_flat[0] + 355)
0d45 : a5 54 __ LDA T3 + 0 
0d47 : f0 03 __ BEQ $0d4c ; (main.s20 + 0)
.s25:
0d49 : 20 fa 6d JSR $6dfa ; (modplay_stop.s4 + 0)
.s20:
0d4c : 20 33 6e JSR $6e33 ; (scroller_run.s4 + 0)
.l21:
0d4f : 20 e4 ff JSR $ffe4 
0d52 : aa __ __ TAX
0d53 : d0 fa __ BNE $0d4f ; (main.l21 + 0)
.s22:
0d55 : 20 f3 15 JSR $15f3 ; (turbo_set.s4 + 0)
0d58 : a9 7e __ LDA #$7e
0d5a : 85 16 __ STA P9 
0d5c : a9 72 __ LDA #$72
0d5e : 85 17 __ STA P10 
0d60 : 20 69 0e JSR $0e69 ; (screen_init.s4 + 0)
0d63 : 20 a5 10 JSR $10a5 ; (cwin_cursor_newline.s4 + 0)
0d66 : a9 93 __ LDA #$93
0d68 : 85 10 __ STA P3 
0d6a : a9 72 __ LDA #$72
0d6c : 85 11 __ STA P4 
0d6e : 20 9e 10 JSR $109e ; (screen_info.s4 + 0)
0d71 : a9 01 __ LDA #$01
0d73 : 85 12 __ STA P5 
0d75 : 20 a5 10 JSR $10a5 ; (cwin_cursor_newline.s4 + 0)
0d78 : a9 ab __ LDA #$ab
0d7a : 85 10 __ STA P3 
0d7c : a9 72 __ LDA #$72
0d7e : 85 14 __ STA P7 
0d80 : a9 72 __ LDA #$72
0d82 : 85 11 __ STA P4 
0d84 : a9 b1 __ LDA #$b1
0d86 : 85 13 __ STA P6 
0d88 : 20 67 11 JSR $1167 ; (screen_result.s4 + 0)
0d8b : a9 c7 __ LDA #$c7
0d8d : 85 10 __ STA P3 
0d8f : a9 72 __ LDA #$72
0d91 : 85 14 __ STA P7 
0d93 : a9 72 __ LDA #$72
0d95 : 85 11 __ STA P4 
0d97 : a9 cd __ LDA #$cd
0d99 : 85 13 __ STA P6 
0d9b : 20 67 11 JSR $1167 ; (screen_result.s4 + 0)
0d9e : a9 dc __ LDA #$dc
0da0 : 85 10 __ STA P3 
0da2 : a9 72 __ LDA #$72
0da4 : 85 14 __ STA P7 
0da6 : a9 72 __ LDA #$72
0da8 : 85 11 __ STA P4 
0daa : a9 e2 __ LDA #$e2
0dac : 85 13 __ STA P6 
0dae : 20 67 11 JSR $1167 ; (screen_result.s4 + 0)
0db1 : a9 f4 __ LDA #$f4
0db3 : 85 10 __ STA P3 
0db5 : a9 73 __ LDA #$73
0db7 : 85 14 __ STA P7 
0db9 : a9 72 __ LDA #$72
0dbb : 85 11 __ STA P4 
0dbd : a9 00 __ LDA #$00
0dbf : 85 13 __ STA P6 
0dc1 : 20 67 11 JSR $1167 ; (screen_result.s4 + 0)
0dc4 : a9 fa __ LDA #$fa
0dc6 : 85 10 __ STA P3 
0dc8 : a9 73 __ LDA #$73
0dca : 85 14 __ STA P7 
0dcc : a9 72 __ LDA #$72
0dce : 85 11 __ STA P4 
0dd0 : a9 14 __ LDA #$14
0dd2 : 85 13 __ STA P6 
0dd4 : 20 67 11 JSR $1167 ; (screen_result.s4 + 0)
0dd7 : a9 2a __ LDA #$2a
0dd9 : 85 10 __ STA P3 
0ddb : a9 73 __ LDA #$73
0ddd : 85 14 __ STA P7 
0ddf : a9 73 __ LDA #$73
0de1 : 85 11 __ STA P4 
0de3 : a9 30 __ LDA #$30
0de5 : 85 13 __ STA P6 
0de7 : 20 67 11 JSR $1167 ; (screen_result.s4 + 0)
0dea : a5 54 __ LDA T3 + 0 
0dec : f0 13 __ BEQ $0e01 ; (main.s23 + 0)
.s24:
0dee : a9 0c __ LDA #$0c
0df0 : 85 10 __ STA P3 
0df2 : a9 73 __ LDA #$73
0df4 : 85 14 __ STA P7 
0df6 : a9 1d __ LDA #$1d
0df8 : 85 11 __ STA P4 
0dfa : a9 42 __ LDA #$42
0dfc : 85 13 __ STA P6 
0dfe : 20 67 11 JSR $1167 ; (screen_result.s4 + 0)
.s23:
0e01 : 20 a5 10 JSR $10a5 ; (cwin_cursor_newline.s4 + 0)
0e04 : a9 59 __ LDA #$59
0e06 : 85 10 __ STA P3 
0e08 : a9 73 __ LDA #$73
0e0a : 85 11 __ STA P4 
0e0c : 20 9e 10 JSR $109e ; (screen_info.s4 + 0)
0e0f : a9 76 __ LDA #$76
0e11 : 85 10 __ STA P3 
0e13 : a9 73 __ LDA #$73
0e15 : 85 11 __ STA P4 
0e17 : 20 9e 10 JSR $109e ; (screen_info.s4 + 0)
0e1a : 20 a5 10 JSR $10a5 ; (cwin_cursor_newline.s4 + 0)
0e1d : a9 00 __ LDA #$00
0e1f : 85 10 __ STA P3 
0e21 : 85 11 __ STA P4 
0e23 : 20 4c 1d JSR $1d4c ; (screen_wait_key.s4 + 0)
0e26 : a9 0e __ LDA #$0e
0e28 : 8d 20 d0 STA $d020 
0e2b : a9 06 __ LDA #$06
0e2d : 8d 21 d0 STA $d021 
0e30 : a9 00 __ LDA #$00
0e32 : 85 1b __ STA ACCU + 0 
0e34 : 4c a1 0a JMP $0aa1 ; (main.s3 + 0)
.s62:
0e37 : a2 00 __ LDX #$00
0e39 : 86 12 __ STX P5 
0e3b : aa __ __ TAX
0e3c : f0 06 __ BEQ $0e44 ; (main.s63 + 0)
.s65:
0e3e : a9 15 __ LDA #$15
0e40 : a2 4c __ LDX #$4c
0e42 : 90 04 __ BCC $0e48 ; (main.s64 + 0)
.s63:
0e44 : a9 11 __ LDA #$11
0e46 : a2 d0 __ LDX #$d0
.s64:
0e48 : 86 13 __ STX P6 
0e4a : 85 14 __ STA P7 
0e4c : 20 40 78 JSR $7840 ; (screen_result@proxy + 0)
0e4f : a9 63 __ LDA #$63
0e51 : 85 12 __ STA P5 
0e53 : a9 15 __ LDA #$15
0e55 : 85 13 __ STA P6 
0e57 : a9 15 __ LDA #$15
0e59 : a2 7a __ LDX #$7a
0e5b : 4c 94 0a JMP $0a94 ; (main.s72 + 0)
--------------------------------------------------------------------
nmi_handler: ; nmi_handler()->void
;  97, "/home/xahmol/git/UltimateDemo2026/src/main.c"
.s1:
0e5e : 48 __ __ PHA
0e5f : 8a __ __ TXA
0e60 : 48 __ __ PHA
0e61 : 98 __ __ TYA
0e62 : 48 __ __ PHA
.s3:
0e63 : 68 __ __ PLA
0e64 : a8 __ __ TAY
0e65 : 68 __ __ PLA
0e66 : aa __ __ TAX
0e67 : 68 __ __ PLA
0e68 : 40 __ __ RTI
--------------------------------------------------------------------
screen_init: ; screen_init(const u8*)->void
;  13, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
0e69 : a9 00 __ LDA #$00
0e6b : 85 0d __ STA P0 
0e6d : 85 43 __ STA T0 + 0 
0e6f : 85 0e __ STA P1 
0e71 : 85 10 __ STA P3 
0e73 : 20 0e 0f JSR $0f0e ; (vic_setmode@proxy + 0)
0e76 : a9 00 __ LDA #$00
0e78 : 8d d4 82 STA $82d4 ; (cw.sx + 0)
0e7b : 8d d5 82 STA $82d5 ; (cw.sy + 0)
0e7e : 8d d8 82 STA $82d8 ; (cw.cx + 0)
0e81 : 8d d9 82 STA $82d9 ; (cw.cy + 0)
0e84 : a2 19 __ LDX #$19
0e86 : 8e d7 82 STX $82d7 ; (cw.wy + 0)
0e89 : 8d 20 d0 STA $d020 
0e8c : 8d 21 d0 STA $d021 
0e8f : 8d dc 82 STA $82dc ; (cw.sp + 0)
0e92 : 8d de 82 STA $82de ; (cw.cp + 0)
0e95 : a9 04 __ LDA #$04
0e97 : 8d dd 82 STA $82dd ; (cw.sp + 1)
0e9a : 85 44 __ STA T0 + 1 
0e9c : a9 d8 __ LDA #$d8
0e9e : 8d df 82 STA $82df ; (cw.cp + 1)
0ea1 : 85 46 __ STA T1 + 1 
0ea3 : a2 00 __ LDX #$00
0ea5 : 86 45 __ STX T1 + 0 
0ea7 : a9 28 __ LDA #$28
0ea9 : 8d d6 82 STA $82d6 ; (cw.wx + 0)
.l8:
0eac : 85 1b __ STA ACCU + 0 
0eae : a0 00 __ LDY #$00
.l9:
0eb0 : a9 20 __ LDA #$20
0eb2 : 91 43 __ STA (T0 + 0),y 
0eb4 : a9 01 __ LDA #$01
0eb6 : 91 45 __ STA (T1 + 0),y 
0eb8 : c8 __ __ INY
0eb9 : c4 1b __ CPY ACCU + 0 
0ebb : 90 f3 __ BCC $0eb0 ; (screen_init.l9 + 0)
.l6:
0ebd : e8 __ __ INX
0ebe : ec d7 82 CPX $82d7 ; (cw.wy + 0)
0ec1 : 90 2f __ BCC $0ef2 ; (screen_init.s5 + 0)
.s7:
0ec3 : a9 00 __ LDA #$00
0ec5 : 85 12 __ STA P5 
0ec7 : a9 10 __ LDA #$10
0ec9 : 85 14 __ STA P7 
0ecb : a9 05 __ LDA #$05
0ecd : 85 15 __ STA P8 
0ecf : a9 63 __ LDA #$63
0ed1 : 85 13 __ STA P6 
0ed3 : 20 68 0f JSR $0f68 ; (header_line.s4 + 0)
0ed6 : e6 12 __ INC P5 
0ed8 : a5 16 __ LDA P9 ; (title + 0)
0eda : 85 13 __ STA P6 
0edc : a5 17 __ LDA P10 ; (title + 1)
0ede : 85 14 __ STA P7 
0ee0 : a9 0d __ LDA #$0d
0ee2 : 85 15 __ STA P8 
0ee4 : 20 68 0f JSR $0f68 ; (header_line.s4 + 0)
0ee7 : a9 00 __ LDA #$00
0ee9 : 8d d8 82 STA $82d8 ; (cw.cx + 0)
0eec : a9 03 __ LDA #$03
0eee : 8d d9 82 STA $82d9 ; (cw.cy + 0)
.s3:
0ef1 : 60 __ __ RTS
.s5:
0ef2 : a5 43 __ LDA T0 + 0 
0ef4 : 69 28 __ ADC #$28
0ef6 : 85 43 __ STA T0 + 0 
0ef8 : 90 03 __ BCC $0efd ; (screen_init.s11 + 0)
.s10:
0efa : e6 44 __ INC T0 + 1 
0efc : 18 __ __ CLC
.s11:
0efd : a5 45 __ LDA T1 + 0 
0eff : 69 28 __ ADC #$28
0f01 : 85 45 __ STA T1 + 0 
0f03 : 90 02 __ BCC $0f07 ; (screen_init.s13 + 0)
.s12:
0f05 : e6 46 __ INC T1 + 1 
.s13:
0f07 : ad d6 82 LDA $82d6 ; (cw.wx + 0)
0f0a : f0 b1 __ BEQ $0ebd ; (screen_init.l6 + 0)
0f0c : d0 9e __ BNE $0eac ; (screen_init.l8 + 0)
--------------------------------------------------------------------
vic_setmode@proxy: ; vic_setmode@proxy
0f0e : a9 04 __ LDA #$04
0f10 : 85 0f __ STA P2 
0f12 : a9 18 __ LDA #$18
0f14 : 85 11 __ STA P4 
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  97, "/home/xahmol/oscar64/include/c64/vic.h"
.s4:
0f16 : a4 0d __ LDY P0 ; (mode + 0)
0f18 : c0 02 __ CPY #$02
0f1a : d0 09 __ BNE $0f25 ; (vic_setmode.s5 + 0)
.s10:
0f1c : a9 5b __ LDA #$5b
0f1e : 8d 11 d0 STA $d011 
.s8:
0f21 : a9 08 __ LDA #$08
0f23 : d0 0c __ BNE $0f31 ; (vic_setmode.s7 + 0)
.s5:
0f25 : b0 36 __ BCS $0f5d ; (vic_setmode.s6 + 0)
.s9:
0f27 : a9 1b __ LDA #$1b
0f29 : 8d 11 d0 STA $d011 
0f2c : 98 __ __ TYA
0f2d : f0 f2 __ BEQ $0f21 ; (vic_setmode.s8 + 0)
.s11:
0f2f : a9 18 __ LDA #$18
.s7:
0f31 : 8d 16 d0 STA $d016 
0f34 : ad 00 dd LDA $dd00 
0f37 : 29 fc __ AND #$fc
0f39 : 85 1b __ STA ACCU + 0 
0f3b : a5 0f __ LDA P2 ; (text + 1)
0f3d : 0a __ __ ASL
0f3e : 2a __ __ ROL
0f3f : 29 01 __ AND #$01
0f41 : 2a __ __ ROL
0f42 : 49 03 __ EOR #$03
0f44 : 05 1b __ ORA ACCU + 0 
0f46 : 8d 00 dd STA $dd00 
0f49 : a5 0f __ LDA P2 ; (text + 1)
0f4b : 29 3c __ AND #$3c
0f4d : 0a __ __ ASL
0f4e : 0a __ __ ASL
0f4f : 85 1b __ STA ACCU + 0 
0f51 : a5 11 __ LDA P4 ; (font + 1)
0f53 : 29 38 __ AND #$38
0f55 : 4a __ __ LSR
0f56 : 4a __ __ LSR
0f57 : 05 1b __ ORA ACCU + 0 
0f59 : 8d 18 d0 STA $d018 
.s3:
0f5c : 60 __ __ RTS
.s6:
0f5d : a9 3b __ LDA #$3b
0f5f : 8d 11 d0 STA $d011 
0f62 : c0 03 __ CPY #$03
0f64 : d0 c9 __ BNE $0f2f ; (vic_setmode.s11 + 0)
0f66 : f0 b9 __ BEQ $0f21 ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
header_line: ; header_line(u8,const u8*,u8)->void
;  41, "/home/xahmol/git/UltimateDemo2026/src/screen.c"
.s4:
0f68 : a5 13 __ LDA P6 ; (text + 0)
0f6a : 85 0d __ STA P0 
0f6c : a5 14 __ LDA P7 ; (text + 1)
0f6e : 85 0e __ STA P1 
0f70 : 20 47 10 JSR $1047 ; (strlen.s4 + 0)
0f73 : a5 12 __ LDA P5 ; (row + 0)
0f75 : 0a __ __ ASL
0f76 : aa __ __ TAX
0f77 : ad dc 82 LDA $82dc ; (cw.sp + 0)
0f7a : 7d 00 79 ADC $7900,x ; (mul40[0] + 0)
0f7d : 85 46 __ STA T2 + 0 
0f7f : ad dd 82 LDA $82dd ; (cw.sp + 1)
0f82 : 7d 01 79 ADC $7901,x ; (mul40[0] + 1)
0f85 : 85 47 __ STA T2 + 1 
0f87 : ad de 82 LDA $82de ; (cw.cp + 0)
0f8a : 18 __ __ CLC
0f8b : 7d 00 79 ADC $7900,x ; (mul40[0] + 0)
0f8e : 85 48 __ STA T3 + 0 
0f90 : ad df 82 LDA $82df ; (cw.cp + 1)
0f93 : 7d 01 79 ADC $7901,x ; (mul40[0] + 1)
0f96 : 85 49 __ STA T3 + 1 
0f98 : 38 __ __ SEC
0f99 : a9 28 __ LDA #$28
0f9b : e5 1b __ SBC ACCU + 0 
0f9d : a8 __ __ TAY
0f9e : a9 00 __ LDA #$00
0fa0 : e9 00 __ SBC #$00
0fa2 : aa __ __ TAX
0fa3 : 0a __ __ ASL
0fa4 : 98 __ __ TYA
0fa5 : 69 00 __ ADC #$00
0fa7 : 85 45 __ STA T1 + 0 
0fa9 : 8a __ __ TXA
0faa : 69 00 __ ADC #$00
0fac : 4a __ __ LSR
0fad : 66 45 __ ROR T1 + 0 
0faf : a0 00 __ LDY #$00
0fb1 : a6 15 __ LDX P8 ; (color + 0)
.l8:
0fb3 : a9 a0 __ LDA #$a0
0fb5 : 91 46 __ STA (T2 + 0),y 
0fb7 : 8a __ __ TXA
0fb8 : 91 48 __ STA (T3 + 0),y 
0fba : c8 __ __ INY
0fbb : c0 28 __ CPY #$28
0fbd : d0 f4 __ BNE $0fb3 ; (header_line.l8 + 0)
.s9:
0fbf : a9 00 __ LDA #$00
0fc1 : 85 4a __ STA T4 + 0 
0fc3 : a5 1b __ LDA ACCU + 0 
0fc5 : f0 1f __ BEQ $0fe6 ; (header_line.s5 + 0)
.s10:
0fc7 : a0 00 __ LDY #$00
.l7:
0fc9 : b1 13 __ LDA (P6),y ; (text + 0)
0fcb : 4a __ __ LSR
0fcc : 4a __ __ LSR
0fcd : 4a __ __ LSR
0fce : 4a __ __ LSR
0fcf : 4a __ __ LSR
0fd0 : aa __ __ TAX
0fd1 : bd d8 78 LDA $78d8,x ; (p2smap[0] + 0)
0fd4 : 51 13 __ EOR (P6),y ; (text + 0)
0fd6 : 09 80 __ ORA #$80
0fd8 : 99 c1 bf STA $bfc1,y ; (buf[0] + 0)
0fdb : c8 __ __ INY
0fdc : c4 1b __ CPY ACCU + 0 
0fde : b0 04 __ BCS $0fe4 ; (header_line.s11 + 0)
.s6:
0fe0 : c0 28 __ CPY #$28
0fe2 : 90 e5 __ BCC $0fc9 ; (header_line.l7 + 0)
.s11:
0fe4 : 84 4a __ STY T4 + 0 
.s5:
0fe6 : a5 45 __ LDA T1 + 0 
0fe8 : 85 0d __ STA P0 
0fea : a5 12 __ LDA P5 ; (row + 0)
0fec : 85 0e __ STA P1 
0fee : a5 15 __ LDA P8 ; (color + 0)
0ff0 : 85 11 __ STA P4 
0ff2 : a9 00 __ LDA #$00
0ff4 : a6 4a __ LDX T4 + 0 
0ff6 : 9d c1 bf STA $bfc1,x ; (buf[0] + 0)
0ff9 : a9 c1 __ LDA #$c1
0ffb : 85 0f __ STA P2 
0ffd : a9 bf __ LDA #$bf
0fff : 85 10 __ STA P3 
--------------------------------------------------------------------
cwin_putat_string_raw: ; cwin_putat_string_raw(struct CharWin*,u8,u8,const u8*,u8)->void
; 103, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
1001 : a5 0e __ LDA P1 ; (y + 0)
1003 : 0a __ __ ASL
1004 : aa __ __ TAX
1005 : bd 00 79 LDA $7900,x ; (mul40[0] + 0)
1008 : 65 0d __ ADC P0 ; (x + 0)
100a : 85 1b __ STA ACCU + 0 
100c : bd 01 79 LDA $7901,x ; (mul40[0] + 1)
100f : 69 00 __ ADC #$00
1011 : 85 1c __ STA ACCU + 1 
1013 : ad dc 82 LDA $82dc ; (cw.sp + 0)
1016 : 65 1b __ ADC ACCU + 0 
1018 : 85 43 __ STA T1 + 0 
101a : ad dd 82 LDA $82dd ; (cw.sp + 1)
101d : 65 1c __ ADC ACCU + 1 
101f : 85 44 __ STA T1 + 1 
1021 : ad de 82 LDA $82de ; (cw.cp + 0)
1024 : 18 __ __ CLC
1025 : 65 1b __ ADC ACCU + 0 
1027 : 85 1b __ STA ACCU + 0 
1029 : ad df 82 LDA $82df ; (cw.cp + 1)
102c : 65 1c __ ADC ACCU + 1 
102e : 85 1c __ STA ACCU + 1 
1030 : a6 11 __ LDX P4 ; (color + 0)
1032 : a0 00 __ LDY #$00
1034 : b1 0f __ LDA (P2),y ; (str + 0)
1036 : f0 0a __ BEQ $1042 ; (cwin_putat_string_raw.s3 + 0)
.l5:
1038 : 91 43 __ STA (T1 + 0),y 
103a : 8a __ __ TXA
103b : 91 1b __ STA (ACCU + 0),y 
103d : c8 __ __ INY
103e : b1 0f __ LDA (P2),y ; (str + 0)
1040 : d0 f6 __ BNE $1038 ; (cwin_putat_string_raw.l5 + 0)
.s3:
1042 : 60 __ __ RTS
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
1043 : a9 78 __ LDA #$78
1045 : 85 0e __ STA P1 
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
;  12, "/home/xahmol/oscar64/include/string.h"
.s4:
1047 : a9 00 __ LDA #$00
1049 : 85 1b __ STA ACCU + 0 
104b : 85 1c __ STA ACCU + 1 
104d : a8 __ __ TAY
104e : b1 0d __ LDA (P0),y ; (str + 0)
1050 : f0 10 __ BEQ $1062 ; (strlen.s3 + 0)
.s6:
1052 : a2 00 __ LDX #$00
.l7:
1054 : c8 __ __ INY
1055 : d0 03 __ BNE $105a ; (strlen.s9 + 0)
.s8:
1057 : e6 0e __ INC P1 ; (str + 1)
1059 : e8 __ __ INX
.s9:
105a : b1 0d __ LDA (P0),y ; (str + 0)
105c : d0 f6 __ BNE $1054 ; (strlen.l7 + 0)
.s5:
105e : 86 1c __ STX ACCU + 1 
1060 : 84 1b __ STY ACCU + 0 
.s3:
1062 : 60 __ __ RTS
--------------------------------------------------------------------
1063 : __ __ __ BYT 75 4c 54 49 4d 41 54 45 64 45 4d 4f 32 30 32 36 : uLTIMATEdEMO2026
1073 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1074 : __ __ __ BYT 68 41 52 44 57 41 52 45 20 64 45 54 45 43 54 49 : hARDWARE dETECTI
1084 : __ __ __ BYT 4f 4e 20 20 20 56 30 2e 31 2e 30 2d 32 30 32 36 : ON   V0.1.0-2026
1094 : __ __ __ BYT 30 35 33 31 2d 31 30 30 31 00                   : 0531-1001.
--------------------------------------------------------------------
screen_info: ; screen_info(const u8*)->void
;  23, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
109e : a9 0f __ LDA #$0f
10a0 : 85 0f __ STA P2 
10a2 : 20 a0 78 JSR $78a0 ; (cwin_put_string@proxy + 0)
--------------------------------------------------------------------
cwin_cursor_newline: ; cwin_cursor_newline(struct CharWin*)->void
;  44, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
10a5 : ad d9 82 LDA $82d9 ; (cw.cy + 0)
10a8 : 18 __ __ CLC
10a9 : 69 01 __ ADC #$01
10ab : a8 __ __ TAY
10ac : a9 00 __ LDA #$00
10ae : 8d d8 82 STA $82d8 ; (cw.cx + 0)
10b1 : 2a __ __ ROL
10b2 : d0 08 __ BNE $10bc ; (cwin_cursor_newline.s3 + 0)
.s6:
10b4 : cc d7 82 CPY $82d7 ; (cw.wy + 0)
10b7 : b0 03 __ BCS $10bc ; (cwin_cursor_newline.s3 + 0)
.s5:
10b9 : ee d9 82 INC $82d9 ; (cw.cy + 0)
.s3:
10bc : 60 __ __ RTS
--------------------------------------------------------------------
cwin_put_string@proxy: ; cwin_put_string@proxy
10bd : a9 c3 __ LDA #$c3
10bf : 85 0d __ STA P0 
10c1 : a9 11 __ LDA #$11
10c3 : 85 0e __ STA P1 
--------------------------------------------------------------------
cwin_put_string: ; cwin_put_string(struct CharWin*,const u8*,u8)->void
;  64, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
10c5 : ad d9 82 LDA $82d9 ; (cw.cy + 0)
10c8 : 0a __ __ ASL
10c9 : aa __ __ TAX
10ca : bd 00 79 LDA $7900,x ; (mul40[0] + 0)
10cd : 6d d8 82 ADC $82d8 ; (cw.cx + 0)
10d0 : 85 1b __ STA ACCU + 0 
10d2 : bd 01 79 LDA $7901,x ; (mul40[0] + 1)
10d5 : 69 00 __ ADC #$00
10d7 : 85 1c __ STA ACCU + 1 
10d9 : ad dc 82 LDA $82dc ; (cw.sp + 0)
10dc : 65 1b __ ADC ACCU + 0 
10de : 85 43 __ STA T1 + 0 
10e0 : ad dd 82 LDA $82dd ; (cw.sp + 1)
10e3 : 65 1c __ ADC ACCU + 1 
10e5 : 85 44 __ STA T1 + 1 
10e7 : ad de 82 LDA $82de ; (cw.cp + 0)
10ea : 18 __ __ CLC
10eb : 65 1b __ ADC ACCU + 0 
10ed : 85 1b __ STA ACCU + 0 
10ef : ad df 82 LDA $82df ; (cw.cp + 1)
10f2 : 65 1c __ ADC ACCU + 1 
10f4 : 85 1c __ STA ACCU + 1 
10f6 : a0 00 __ LDY #$00
10f8 : b1 0d __ LDA (P0),y ; (str + 0)
10fa : f0 16 __ BEQ $1112 ; (cwin_put_string.s5 + 0)
.l7:
10fc : 4a __ __ LSR
10fd : 4a __ __ LSR
10fe : 4a __ __ LSR
10ff : 4a __ __ LSR
1100 : 4a __ __ LSR
1101 : aa __ __ TAX
1102 : bd e0 78 LDA $78e0,x ; (p2smap[0] + 0)
1105 : 51 0d __ EOR (P0),y ; (str + 0)
1107 : 91 43 __ STA (T1 + 0),y 
1109 : a5 0f __ LDA P2 ; (color + 0)
110b : 91 1b __ STA (ACCU + 0),y 
110d : c8 __ __ INY
110e : b1 0d __ LDA (P0),y ; (str + 0)
1110 : d0 ea __ BNE $10fc ; (cwin_put_string.l7 + 0)
.s5:
1112 : 98 __ __ TYA
1113 : 18 __ __ CLC
1114 : 6d d8 82 ADC $82d8 ; (cw.cx + 0)
1117 : cd d6 82 CMP $82d6 ; (cw.wx + 0)
111a : 90 05 __ BCC $1121 ; (cwin_put_string.s3 + 0)
.s6:
111c : a9 00 __ LDA #$00
111e : ee d9 82 INC $82d9 ; (cw.cy + 0)
.s3:
1121 : 8d d8 82 STA $82d8 ; (cw.cx + 0)
1124 : 60 __ __ RTS
--------------------------------------------------------------------
1125 : __ __ __ BYT 77 41 49 54 49 4e 47 20 46 4f 52 20 75 4c 54 49 : wAITING FOR uLTI
1135 : __ __ __ BYT 4d 41 54 45 20 46 49 52 4d 57 41 52 45 2e 2e 2e : MATE FIRMWARE...
1145 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
uii_detect: ; uii_detect()->u8
; 167, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
1146 : ad 1d df LDA $df1d 
1149 : c9 c9 __ CMP #$c9
114b : d0 0b __ BNE $1158 ; (uii_detect.s5 + 0)
.s6:
114d : ad 1c df LDA $df1c 
1150 : 09 04 __ ORA #$04
1152 : 8d 1c df STA $df1c 
1155 : a9 01 __ LDA #$01
1157 : 60 __ __ RTS
.s5:
1158 : a9 00 __ LDA #$00
.s3:
115a : 60 __ __ RTS
--------------------------------------------------------------------
screen_result@proxy: ; screen_result@proxy
115b : a9 01 __ LDA #$01
115d : 85 12 __ STA P5 
115f : a9 93 __ LDA #$93
1161 : 85 13 __ STA P6 
1163 : a9 bf __ LDA #$bf
1165 : 85 14 __ STA P7 
--------------------------------------------------------------------
screen_result: ; screen_result(const u8*,u8,const u8*)->void
;  17, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
1167 : a9 01 __ LDA #$01
1169 : 85 0f __ STA P2 
116b : 20 bd 10 JSR $10bd ; (cwin_put_string@proxy + 0)
116e : 20 a0 78 JSR $78a0 ; (cwin_put_string@proxy + 0)
1171 : a9 c6 __ LDA #$c6
1173 : 85 0d __ STA P0 
1175 : a9 11 __ LDA #$11
1177 : 85 0e __ STA P1 
1179 : 20 c5 10 JSR $10c5 ; (cwin_put_string.s4 + 0)
117c : a5 12 __ LDA P5 ; (ok + 0)
117e : d0 09 __ BNE $1189 ; (screen_result.s7 + 0)
.s5:
1180 : e6 0f __ INC P2 
1182 : a9 11 __ LDA #$11
1184 : a0 bc __ LDY #$bc
1186 : 4c 91 11 JMP $1191 ; (screen_result.s6 + 0)
.s7:
1189 : a9 05 __ LDA #$05
118b : 85 0f __ STA P2 
118d : a9 11 __ LDA #$11
118f : a0 b5 __ LDY #$b5
.s6:
1191 : 84 0d __ STY P0 
1193 : 85 0e __ STA P1 
1195 : 20 c5 10 JSR $10c5 ; (cwin_put_string.s4 + 0)
1198 : a5 12 __ LDA P5 ; (ok + 0)
119a : f0 04 __ BEQ $11a0 ; (screen_result.s8 + 0)
.s9:
119c : a9 03 __ LDA #$03
119e : d0 02 __ BNE $11a2 ; (screen_result.s10 + 0)
.s8:
11a0 : a9 07 __ LDA #$07
.s10:
11a2 : 85 0f __ STA P2 
11a4 : 20 bd 10 JSR $10bd ; (cwin_put_string@proxy + 0)
11a7 : a5 13 __ LDA P6 ; (detail + 0)
11a9 : 85 0d __ STA P0 
11ab : a5 14 __ LDA P7 ; (detail + 1)
11ad : 85 0e __ STA P1 
11af : 20 c5 10 JSR $10c5 ; (cwin_put_string.s4 + 0)
11b2 : 4c a5 10 JMP $10a5 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
11b5 : __ __ __ BYT 5b 20 6f 6b 20 5d 00                            : [ ok ].
--------------------------------------------------------------------
11bc : __ __ __ BYT 5b 66 41 49 4c 5d 00                            : [fAIL].
--------------------------------------------------------------------
11c3 : __ __ __ BYT 20 20 00                                        :   .
--------------------------------------------------------------------
11c6 : __ __ __ BYT 20 3a 20 00                                     :  : .
--------------------------------------------------------------------
11ca : __ __ __ BYT 75 63 69 20 20 00                               : uci  .
--------------------------------------------------------------------
11d0 : __ __ __ BYT 6e 4f 54 20 44 45 54 45 43 54 45 44 00          : nOT DETECTED.
--------------------------------------------------------------------
screen_error_exit: ; screen_error_exit(const u8*,const u8*)->void
;  32, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
11dd : a9 02 __ LDA #$02
11df : 85 0f __ STA P2 
11e1 : 20 a5 10 JSR $10a5 ; (cwin_cursor_newline.s4 + 0)
11e4 : a5 12 __ LDA P5 ; (msg + 0)
11e6 : 85 0d __ STA P0 
11e8 : a5 13 __ LDA P6 ; (msg + 1)
11ea : 85 0e __ STA P1 
11ec : 20 c5 10 JSR $10c5 ; (cwin_put_string.s4 + 0)
11ef : 20 a5 10 JSR $10a5 ; (cwin_cursor_newline.s4 + 0)
11f2 : a5 15 __ LDA P8 ; (hint + 1)
11f4 : 05 14 __ ORA P7 ; (hint + 0)
11f6 : f0 11 __ BEQ $1209 ; (screen_error_exit.s5 + 0)
.s6:
11f8 : a0 00 __ LDY #$00
11fa : b1 14 __ LDA (P7),y ; (hint + 0)
11fc : f0 0b __ BEQ $1209 ; (screen_error_exit.s5 + 0)
.s7:
11fe : a5 14 __ LDA P7 ; (hint + 0)
1200 : 85 10 __ STA P3 
1202 : a5 15 __ LDA P8 ; (hint + 1)
1204 : 85 11 __ STA P4 
1206 : 20 2c 12 JSR $122c ; (screen_hint.s4 + 0)
.s5:
1209 : a9 01 __ LDA #$01
120b : 85 0f __ STA P2 
120d : 20 a5 10 JSR $10a5 ; (cwin_cursor_newline.s4 + 0)
1210 : a9 47 __ LDA #$47
1212 : 85 0d __ STA P0 
1214 : a9 12 __ LDA #$12
1216 : 85 0e __ STA P1 
1218 : 20 c5 10 JSR $10c5 ; (cwin_put_string.s4 + 0)
121b : 20 a5 10 JSR $10a5 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
cwin_getch: ; cwin_getch()->void
; 147, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
121e : 20 e4 ff JSR $ffe4 
1221 : c9 00 __ CMP #$00
1223 : f0 f9 __ BEQ $121e ; (cwin_getch.s4 + 0)
1225 : 85 1b __ STA ACCU + 0 
1227 : a9 00 __ LDA #$00
1229 : 85 1c __ STA ACCU + 1 
.s3:
122b : 60 __ __ RTS
--------------------------------------------------------------------
screen_hint: ; screen_hint(const u8*)->void
;  26, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
122c : a9 07 __ LDA #$07
122e : 85 0f __ STA P2 
1230 : a9 12 __ LDA #$12
1232 : 85 0e __ STA P1 
1234 : a9 41 __ LDA #$41
1236 : 85 0d __ STA P0 
1238 : 20 c5 10 JSR $10c5 ; (cwin_put_string.s4 + 0)
123b : 20 a0 78 JSR $78a0 ; (cwin_put_string@proxy + 0)
123e : 4c a5 10 JMP $10a5 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
1241 : __ __ __ BYT 20 20 2d 3e 20 00                               :   -> .
--------------------------------------------------------------------
1247 : __ __ __ BYT 70 52 45 53 53 20 41 20 4b 45 59 20 2d 20 45 58 : pRESS A KEY - EX
1257 : __ __ __ BYT 49 54 20 54 4f 20 62 61 73 69 63 2e 00          : IT TO basic..
--------------------------------------------------------------------
1264 : __ __ __ BYT 6e 4f 20 75 4c 54 49 4d 41 54 45 20 63 4f 4d 4d : nO uLTIMATE cOMM
1274 : __ __ __ BYT 41 4e 44 20 69 4e 54 45 52 46 41 43 45 20 46 4f : AND iNTERFACE FO
1284 : __ __ __ BYT 55 4e 44 2e 00                                  : UND..
--------------------------------------------------------------------
1289 : __ __ __ BYT 66 32 20 3e 20 75 63 69 20 73 45 54 54 49 4e 47 : f2 > uci sETTING
1299 : __ __ __ BYT 53 20 3e 20 65 4e 41 42 4c 45 00                : S > eNABLE.
--------------------------------------------------------------------
uii_sendcommand: ; uii_sendcommand(u8*,u16)->void
; 173, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
12a4 : ad fe 77 LDA $77fe ; (uii_target + 0)
12a7 : a0 00 __ LDY #$00
12a9 : 84 1b __ STY ACCU + 0 
12ab : 84 1c __ STY ACCU + 1 
12ad : 91 0d __ STA (P0),y ; (bytes + 0)
.l5:
12af : ad 1c df LDA $df1c 
12b2 : 29 20 __ AND #$20
12b4 : d0 f9 __ BNE $12af ; (uii_sendcommand.l5 + 0)
.s6:
12b6 : ad 1c df LDA $df1c 
12b9 : 29 10 __ AND #$10
12bb : d0 f2 __ BNE $12af ; (uii_sendcommand.l5 + 0)
.s7:
12bd : a5 1c __ LDA ACCU + 1 
12bf : c5 10 __ CMP P3 ; (count + 1)
12c1 : d0 04 __ BNE $12c7 ; (uii_sendcommand.s16 + 0)
.s15:
12c3 : a5 1b __ LDA ACCU + 0 
12c5 : c5 0f __ CMP P2 ; (count + 0)
.s16:
12c7 : b0 2e __ BCS $12f7 ; (uii_sendcommand.s8 + 0)
.s12:
12c9 : a5 0d __ LDA P0 ; (bytes + 0)
12cb : 65 1b __ ADC ACCU + 0 
12cd : 85 43 __ STA T3 + 0 
12cf : a5 0e __ LDA P1 ; (bytes + 1)
12d1 : 65 1c __ ADC ACCU + 1 
12d3 : 85 44 __ STA T3 + 1 
12d5 : a6 1b __ LDX ACCU + 0 
.l13:
12d7 : a0 00 __ LDY #$00
12d9 : b1 43 __ LDA (T3 + 0),y 
12db : 8d 1d df STA $df1d 
12de : e6 43 __ INC T3 + 0 
12e0 : d0 02 __ BNE $12e4 ; (uii_sendcommand.s19 + 0)
.s18:
12e2 : e6 44 __ INC T3 + 1 
.s19:
12e4 : e8 __ __ INX
12e5 : d0 02 __ BNE $12e9 ; (uii_sendcommand.s21 + 0)
.s20:
12e7 : e6 1c __ INC ACCU + 1 
.s21:
12e9 : a5 1c __ LDA ACCU + 1 
12eb : c5 10 __ CMP P3 ; (count + 1)
12ed : 90 e8 __ BCC $12d7 ; (uii_sendcommand.l13 + 0)
.s22:
12ef : d0 04 __ BNE $12f5 ; (uii_sendcommand.s17 + 0)
.s14:
12f1 : e4 0f __ CPX P2 ; (count + 0)
12f3 : 90 e2 __ BCC $12d7 ; (uii_sendcommand.l13 + 0)
.s17:
12f5 : 86 1b __ STX ACCU + 0 
.s8:
12f7 : ad 1c df LDA $df1c 
12fa : 09 01 __ ORA #$01
12fc : 8d 1c df STA $df1c 
12ff : ad 1c df LDA $df1c 
1302 : 29 04 __ AND #$04
1304 : f0 0a __ BEQ $1310 ; (uii_sendcommand.l9 + 0)
.s11:
1306 : ad 1c df LDA $df1c 
1309 : 09 08 __ ORA #$08
130b : 8d 1c df STA $df1c 
130e : b0 9f __ BCS $12af ; (uii_sendcommand.l5 + 0)
.l9:
1310 : ad 1c df LDA $df1c 
1313 : 29 20 __ AND #$20
1315 : d0 07 __ BNE $131e ; (uii_sendcommand.s3 + 0)
.s10:
1317 : ad 1c df LDA $df1c 
131a : 29 10 __ AND #$10
131c : d0 f2 __ BNE $1310 ; (uii_sendcommand.l9 + 0)
.s3:
131e : 60 __ __ RTS
--------------------------------------------------------------------
uii_readdata: ; uii_readdata()->void
; 179, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
131f : a9 00 __ LDA #$00
1321 : 8d c8 8f STA $8fc8 ; (uii_data[0] + 0)
1324 : a2 c8 __ LDX #$c8
1326 : 86 1b __ STX ACCU + 0 
1328 : a8 __ __ TAY
1329 : f0 0d __ BEQ $1338 ; (uii_readdata.l5 + 0)
.s8:
132b : ad 1e df LDA $df1e 
132e : 91 1b __ STA (ACCU + 0),y 
1330 : 98 __ __ TYA
1331 : 18 __ __ CLC
1332 : 69 01 __ ADC #$01
1334 : a8 __ __ TAY
1335 : 8a __ __ TXA
1336 : 69 00 __ ADC #$00
.l5:
1338 : aa __ __ TAX
1339 : 18 __ __ CLC
133a : 69 8f __ ADC #$8f
133c : 85 1c __ STA ACCU + 1 
133e : 2c 1c df BIT $df1c 
1341 : 10 07 __ BPL $134a ; (uii_readdata.s6 + 0)
.s7:
1343 : e0 02 __ CPX #$02
1345 : d0 e4 __ BNE $132b ; (uii_readdata.s8 + 0)
.s9:
1347 : 98 __ __ TYA
1348 : d0 e1 __ BNE $132b ; (uii_readdata.s8 + 0)
.s6:
134a : a9 00 __ LDA #$00
134c : 91 1b __ STA (ACCU + 0),y 
.s3:
134e : 60 __ __ RTS
--------------------------------------------------------------------
uii_readstatus: ; uii_readstatus()->void
; 180, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
134f : a9 00 __ LDA #$00
1351 : 8d c9 91 STA $91c9 ; (uii_status[0] + 0)
1354 : a2 c9 __ LDX #$c9
1356 : 86 1b __ STX ACCU + 0 
1358 : a8 __ __ TAY
1359 : f0 0d __ BEQ $1368 ; (uii_readstatus.l5 + 0)
.s8:
135b : ad 1f df LDA $df1f 
135e : 91 1b __ STA (ACCU + 0),y 
1360 : 98 __ __ TYA
1361 : 18 __ __ CLC
1362 : 69 01 __ ADC #$01
1364 : a8 __ __ TAY
1365 : 8a __ __ TXA
1366 : 69 00 __ ADC #$00
.l5:
1368 : aa __ __ TAX
1369 : 18 __ __ CLC
136a : 69 91 __ ADC #$91
136c : 85 1c __ STA ACCU + 1 
136e : ad 1c df LDA $df1c 
1371 : 29 40 __ AND #$40
1373 : f0 07 __ BEQ $137c ; (uii_readstatus.s6 + 0)
.s7:
1375 : e0 01 __ CPX #$01
1377 : d0 e2 __ BNE $135b ; (uii_readstatus.s8 + 0)
.s9:
1379 : 98 __ __ TYA
137a : d0 df __ BNE $135b ; (uii_readstatus.s8 + 0)
.s6:
137c : 91 1b __ STA (ACCU + 0),y 
.s3:
137e : 60 __ __ RTS
--------------------------------------------------------------------
uii_get_hwinfo: ; uii_get_hwinfo(u8)->void
;  53, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
137f : a9 00 __ LDA #$00
1381 : 85 10 __ STA P3 
1383 : 8d e7 bf STA $bfe7 ; (cmd[0] + 0)
1386 : 8d e9 bf STA $bfe9 ; (cmd[0] + 2)
1389 : a9 03 __ LDA #$03
138b : 85 0f __ STA P2 
138d : a9 04 __ LDA #$04
138f : 8d fe 77 STA $77fe ; (uii_target + 0)
1392 : a9 28 __ LDA #$28
1394 : 8d e8 bf STA $bfe8 ; (cmd[0] + 1)
1397 : a9 00 __ LDA #$00
1399 : 8d e9 bf STA $bfe9 ; (cmd[0] + 2)
139c : a9 e7 __ LDA #$e7
139e : 85 0d __ STA P0 
13a0 : a9 bf __ LDA #$bf
13a2 : 85 0e __ STA P1 
13a4 : 20 a4 12 JSR $12a4 ; (uii_sendcommand.s4 + 0)
13a7 : 20 1f 13 JSR $131f ; (uii_readdata.s4 + 0)
13aa : 20 4f 13 JSR $134f ; (uii_readstatus.s4 + 0)
--------------------------------------------------------------------
uii_accept: ; uii_accept()->void
; 174, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
13ad : ad 1c df LDA $df1c 
13b0 : 09 02 __ ORA #$02
13b2 : 8d 1c df STA $df1c 
.l5:
13b5 : ad 1c df LDA $df1c 
13b8 : 29 02 __ AND #$02
13ba : d0 f9 __ BNE $13b5 ; (uii_accept.l5 + 0)
.s3:
13bc : 60 __ __ RTS
--------------------------------------------------------------------
uci_to_upper@proxy: ; uci_to_upper@proxy
13bd : a9 93 __ LDA #$93
13bf : 85 0d __ STA P0 
13c1 : a9 bf __ LDA #$bf
13c3 : 85 0e __ STA P1 
--------------------------------------------------------------------
uci_to_upper: ; uci_to_upper(u8*,u8)->u8
;  73, "/home/xahmol/git/UltimateDemo2026/src/main.c"
.s4:
13c5 : a0 00 __ LDY #$00
13c7 : a2 00 __ LDX #$00
13c9 : ad c8 8f LDA $8fc8 ; (uii_data[0] + 0)
13cc : f0 23 __ BEQ $13f1 ; (uci_to_upper.s6 + 0)
.l8:
13ce : c9 20 __ CMP #$20
13d0 : 90 11 __ BCC $13e3 ; (uci_to_upper.s9 + 0)
.s10:
13d2 : c9 7f __ CMP #$7f
13d4 : b0 0d __ BCS $13e3 ; (uci_to_upper.s9 + 0)
.s11:
13d6 : c9 61 __ CMP #$61
13d8 : 90 06 __ BCC $13e0 ; (uci_to_upper.s14 + 0)
.s12:
13da : c9 7b __ CMP #$7b
13dc : b0 02 __ BCS $13e0 ; (uci_to_upper.s14 + 0)
.s13:
13de : e9 1f __ SBC #$1f
.s14:
13e0 : 91 0d __ STA (P0),y ; (dst + 0)
13e2 : c8 __ __ INY
.s9:
13e3 : e8 __ __ INX
13e4 : e0 7f __ CPX #$7f
13e6 : b0 09 __ BCS $13f1 ; (uci_to_upper.s6 + 0)
.s5:
13e8 : c0 18 __ CPY #$18
13ea : b0 05 __ BCS $13f1 ; (uci_to_upper.s6 + 0)
.s7:
13ec : bd c8 8f LDA $8fc8,x ; (uii_data[0] + 0)
13ef : d0 dd __ BNE $13ce ; (uci_to_upper.l8 + 0)
.s6:
13f1 : a9 00 __ LDA #$00
13f3 : 91 0d __ STA (P0),y ; (dst + 0)
.s3:
13f5 : 98 __ __ TYA
13f6 : 60 __ __ RTS
--------------------------------------------------------------------
13f7 : __ __ __ BYT 75 63 69 20 6f 4b 00                            : uci oK.
--------------------------------------------------------------------
13fe : __ __ __ BYT 56 00                                           : V.
--------------------------------------------------------------------
1400 : __ __ __ BYT 20 20 74 59 50 45 20 20 3a 20 00                :   tYPE  : .
--------------------------------------------------------------------
140b : __ __ __ BYT 63 48 45 43 4b 49 4e 47 20 72 65 75 2e 2e 2e 00 : cHECKING reu....
--------------------------------------------------------------------
detect_reu: ; detect_reu()->u8
;  33, "/home/xahmol/git/UltimateDemo2026/src/detect.h"
.s4:
141b : a9 00 __ LDA #$00
141d : 8d e9 bf STA $bfe9 ; (c + 0)
1420 : a9 e9 __ LDA #$e9
1422 : 8d 02 df STA $df02 
1425 : a9 bf __ LDA #$bf
1427 : 8d 03 df STA $df03 
142a : a9 00 __ LDA #$00
142c : 8d 04 df STA $df04 
142f : 8d 05 df STA $df05 
1432 : 8d 06 df STA $df06 
1435 : a2 01 __ LDX #$01
1437 : 8e 07 df STX $df07 
143a : 8d 08 df STA $df08 
143d : 8d 0a df STA $df0a 
1440 : a2 90 __ LDX #$90
1442 : 8e 01 df STX $df01 
1445 : a2 e8 __ LDX #$e8
1447 : 8e 02 df STX $df02 
144a : a2 bf __ LDX #$bf
144c : 8e 03 df STX $df03 
144f : 8d 04 df STA $df04 
1452 : 8d 05 df STA $df05 
1455 : 8d 06 df STA $df06 
1458 : a2 01 __ LDX #$01
145a : 8e 07 df STX $df07 
145d : 8d 08 df STA $df08 
1460 : 8d 0a df STA $df0a 
1463 : a9 91 __ LDA #$91
1465 : 8d 01 df STA $df01 
1468 : ad e8 bf LDA $bfe8 ; (d + 0)
146b : d0 52 __ BNE $14bf ; (detect_reu.s6 + 0)
.s5:
146d : a2 47 __ LDX #$47
146f : 8e e9 bf STX $bfe9 ; (c + 0)
1472 : a2 e9 __ LDX #$e9
1474 : 8e 02 df STX $df02 
1477 : a2 bf __ LDX #$bf
1479 : 8e 03 df STX $df03 
147c : 8d 04 df STA $df04 
147f : 8d 05 df STA $df05 
1482 : 8d 06 df STA $df06 
1485 : a2 01 __ LDX #$01
1487 : 8e 07 df STX $df07 
148a : 8d 08 df STA $df08 
148d : 8d 0a df STA $df0a 
1490 : a2 90 __ LDX #$90
1492 : 8e 01 df STX $df01 
1495 : a2 e8 __ LDX #$e8
1497 : 8e 02 df STX $df02 
149a : a2 bf __ LDX #$bf
149c : 8e 03 df STX $df03 
149f : 8d 04 df STA $df04 
14a2 : 8d 05 df STA $df05 
14a5 : 8d 06 df STA $df06 
14a8 : a2 01 __ LDX #$01
14aa : 8e 07 df STX $df07 
14ad : 8d 08 df STA $df08 
14b0 : 8d 0a df STA $df0a 
14b3 : a9 91 __ LDA #$91
14b5 : 8d 01 df STA $df01 
14b8 : ad e8 bf LDA $bfe8 ; (d + 0)
14bb : c9 47 __ CMP #$47
14bd : f0 03 __ BEQ $14c2 ; (detect_reu.s7 + 0)
.s6:
14bf : a9 00 __ LDA #$00
.s3:
14c1 : 60 __ __ RTS
.s7:
14c2 : a0 01 __ LDY #$01
.l8:
14c4 : 8d e9 bf STA $bfe9 ; (c + 0)
14c7 : a9 e9 __ LDA #$e9
14c9 : 8d 02 df STA $df02 
14cc : a9 bf __ LDA #$bf
14ce : 8d 03 df STA $df03 
14d1 : a9 00 __ LDA #$00
14d3 : 8d 04 df STA $df04 
14d6 : 8d 05 df STA $df05 
14d9 : 8c 06 df STY $df06 
14dc : 8e 07 df STX $df07 
14df : 8d 08 df STA $df08 
14e2 : 8d 0a df STA $df0a 
14e5 : a2 90 __ LDX #$90
14e7 : 8e 01 df STX $df01 
14ea : 8d e9 bf STA $bfe9 ; (c + 0)
14ed : a2 e9 __ LDX #$e9
14ef : 8e 02 df STX $df02 
14f2 : a2 bf __ LDX #$bf
14f4 : 8e 03 df STX $df03 
14f7 : 8d 04 df STA $df04 
14fa : 8d 05 df STA $df05 
14fd : 8d 06 df STA $df06 
1500 : a2 01 __ LDX #$01
1502 : 8e 07 df STX $df07 
1505 : 8d 08 df STA $df08 
1508 : 8d 0a df STA $df0a 
150b : a2 90 __ LDX #$90
150d : 8e 01 df STX $df01 
1510 : a2 e8 __ LDX #$e8
1512 : 8e 02 df STX $df02 
1515 : a2 bf __ LDX #$bf
1517 : 8e 03 df STX $df03 
151a : 8d 04 df STA $df04 
151d : 8d 05 df STA $df05 
1520 : 8c 06 df STY $df06 
1523 : a2 01 __ LDX #$01
1525 : 8e 07 df STX $df07 
1528 : 8d 08 df STA $df08 
152b : 8d 0a df STA $df0a 
152e : a9 91 __ LDA #$91
1530 : 8d 01 df STA $df01 
1533 : ad e8 bf LDA $bfe8 ; (d + 0)
1536 : c9 47 __ CMP #$47
1538 : d0 06 __ BNE $1540 ; (detect_reu.s11 + 0)
.s9:
153a : c8 __ __ INY
153b : d0 87 __ BNE $14c4 ; (detect_reu.l8 + 0)
.s10:
153d : a9 10 __ LDA #$10
153f : 60 __ __ RTS
.s11:
1540 : 98 __ __ TYA
1541 : 4a __ __ LSR
1542 : 4a __ __ LSR
1543 : 4a __ __ LSR
1544 : 4a __ __ LSR
1545 : 60 __ __ RTS
--------------------------------------------------------------------
1546 : __ __ __ BYT 72 65 75 20 20 00                               : reu  .
--------------------------------------------------------------------
154c : __ __ __ BYT 74 4f 4f 20 53 4d 41 4c 4c 20 28 4e 45 45 44 20 : tOO SMALL (NEED 
155c : __ __ __ BYT 31 36 20 6d 62 29 00                            : 16 mb).
--------------------------------------------------------------------
1563 : __ __ __ BYT 31 36 20 6d 62 20 72 65 75 20 49 53 20 52 45 51 : 16 mb reu IS REQ
1573 : __ __ __ BYT 55 49 52 45 44 2e 00                            : UIRED..
--------------------------------------------------------------------
157a : __ __ __ BYT 66 32 20 3e 20 63 36 34 20 53 45 54 54 49 4e 47 : f2 > c64 SETTING
158a : __ __ __ BYT 53 20 3e 20 72 65 75 20 3e 20 31 36 20 6d 62 00 : S > reu > 16 mb.
--------------------------------------------------------------------
159a : __ __ __ BYT 31 36 20 6d 62 00                               : 16 mb.
--------------------------------------------------------------------
15a0 : __ __ __ BYT 63 48 45 43 4b 49 4e 47 20 54 55 52 42 4f 20 4d : cHECKING TURBO M
15b0 : __ __ __ BYT 4f 44 45 2e 2e 2e 00                            : ODE....
--------------------------------------------------------------------
turbo_detect: ; turbo_detect()->u8
; 114, "/home/xahmol/git/UltimateDemo2026/include/turbo.h"
.s4:
15b7 : ae 31 d0 LDX $d031 
15ba : e8 __ __ INX
15bb : f0 1c __ BEQ $15d9 ; (turbo_detect.s6 + 0)
.s5:
15bd : a9 0f __ LDA #$0f
15bf : 20 f3 15 JSR $15f3 ; (turbo_set.s4 + 0)
15c2 : 20 0e 16 JSR $160e ; (benchmark_delay.s4 + 0)
15c5 : 20 0e 16 JSR $160e ; (benchmark_delay.s4 + 0)
15c8 : a5 1b __ LDA ACCU + 0 
15ca : 85 44 __ STA T0 + 0 
15cc : a5 1c __ LDA ACCU + 1 
15ce : 85 45 __ STA T0 + 1 
15d0 : a9 00 __ LDA #$00
15d2 : 20 f3 15 JSR $15f3 ; (turbo_set.s4 + 0)
15d5 : a5 45 __ LDA T0 + 1 
15d7 : f0 05 __ BEQ $15de ; (turbo_detect.s9 + 0)
.s6:
15d9 : a9 00 __ LDA #$00
.s3:
15db : 85 1b __ STA ACCU + 0 
15dd : 60 __ __ RTS
.s9:
15de : a5 44 __ LDA T0 + 0 
15e0 : c9 02 __ CMP #$02
15e2 : b0 04 __ BCS $15e8 ; (turbo_detect.s7 + 0)
.s8:
15e4 : a9 02 __ LDA #$02
15e6 : 90 f3 __ BCC $15db ; (turbo_detect.s3 + 0)
.s7:
15e8 : c9 46 __ CMP #$46
15ea : a9 00 __ LDA #$00
15ec : 2a __ __ ROL
15ed : 49 01 __ EOR #$01
15ef : 90 ea __ BCC $15db ; (turbo_detect.s3 + 0)
--------------------------------------------------------------------
turbo_set: ; turbo_set(u8)->void
; 131, "/home/xahmol/git/UltimateDemo2026/include/turbo.h"
.s4:
15f3 : a8 __ __ TAY
15f4 : d0 0c __ BNE $1602 ; (turbo_set.s6 + 0)
.s5:
15f6 : 8d 31 d0 STA $d031 
15f9 : ad 30 d0 LDA $d030 
15fc : 29 fe __ AND #$fe
15fe : 8d 30 d0 STA $d030 
1601 : 60 __ __ RTS
.s6:
1602 : ad 30 d0 LDA $d030 
1605 : 09 01 __ ORA #$01
1607 : 8d 30 d0 STA $d030 
160a : 8c 31 d0 STY $d031 
.s3:
160d : 60 __ __ RTS
--------------------------------------------------------------------
benchmark_delay: ; benchmark_delay(i16)->i16
;  99, "/home/xahmol/git/UltimateDemo2026/include/turbo.h"
.s4:
160e : 78 __ __ SEI
160f : a9 00 __ LDA #$00
1611 : 8d 09 dc STA $dc09 
1614 : 8d 08 dc STA $dc08 
1617 : 8d e8 bf STA $bfe8 ; (i + 0)
161a : f0 0e __ BEQ $162a ; (benchmark_delay.l5 + 0)
.s9:
161c : ad e8 bf LDA $bfe8 ; (i + 0)
161f : 18 __ __ CLC
1620 : 69 01 __ ADC #$01
1622 : 8d e8 bf STA $bfe8 ; (i + 0)
1625 : ad e9 bf LDA $bfe9 ; (i + 1)
1628 : 69 00 __ ADC #$00
.l5:
162a : 8d e9 bf STA $bfe9 ; (i + 1)
162d : ac e8 bf LDY $bfe8 ; (i + 0)
1630 : ad e9 bf LDA $bfe9 ; (i + 1)
1633 : 49 80 __ EOR #$80
1635 : c9 83 __ CMP #$83
1637 : d0 02 __ BNE $163b ; (benchmark_delay.s14 + 0)
.s13:
1639 : c0 e8 __ CPY #$e8
.s14:
163b : b0 07 __ BCS $1644 ; (benchmark_delay.s6 + 0)
.s7:
163d : a9 00 __ LDA #$00
163f : 8d e6 bf STA $bfe6 ; (j + 0)
1642 : 90 28 __ BCC $166c ; (benchmark_delay.l8 + 0)
.s6:
1644 : 58 __ __ CLI
1645 : ad 09 dc LDA $dc09 
1648 : aa __ __ TAX
1649 : 0a __ __ ASL
164a : 85 1b __ STA ACCU + 0 
164c : a9 00 __ LDA #$00
164e : 2a __ __ ROL
164f : 06 1b __ ASL ACCU + 0 
1651 : 2a __ __ ROL
1652 : a8 __ __ TAY
1653 : 8a __ __ TXA
1654 : 65 1b __ ADC ACCU + 0 
1656 : 85 43 __ STA T0 + 0 
1658 : 98 __ __ TYA
1659 : 69 00 __ ADC #$00
165b : 06 43 __ ASL T0 + 0 
165d : 2a __ __ ROL
165e : a8 __ __ TAY
165f : ad 08 dc LDA $dc08 
1662 : 65 43 __ ADC T0 + 0 
1664 : 85 1b __ STA ACCU + 0 
1666 : 90 01 __ BCC $1669 ; (benchmark_delay.s16 + 0)
.s15:
1668 : c8 __ __ INY
.s16:
1669 : 84 1c __ STY ACCU + 1 
.s3:
166b : 60 __ __ RTS
.l8:
166c : 8d e7 bf STA $bfe7 ; (j + 1)
166f : ac e6 bf LDY $bfe6 ; (j + 0)
1672 : ad e7 bf LDA $bfe7 ; (j + 1)
1675 : 30 06 __ BMI $167d ; (benchmark_delay.s10 + 0)
.s12:
1677 : d0 a3 __ BNE $161c ; (benchmark_delay.s9 + 0)
.s11:
1679 : c0 c8 __ CPY #$c8
167b : b0 9f __ BCS $161c ; (benchmark_delay.s9 + 0)
.s10:
167d : ea __ __ NOP
167e : ad e6 bf LDA $bfe6 ; (j + 0)
1681 : 18 __ __ CLC
1682 : 69 01 __ ADC #$01
1684 : 8d e6 bf STA $bfe6 ; (j + 0)
1687 : ad e7 bf LDA $bfe7 ; (j + 1)
168a : 69 00 __ ADC #$00
168c : 4c 6c 16 JMP $166c ; (benchmark_delay.l8 + 0)
--------------------------------------------------------------------
168f : __ __ __ BYT 74 55 52 42 4f 00                               : tURBO.
--------------------------------------------------------------------
1695 : __ __ __ BYT 6e 4f 54 20 44 45 54 45 43 54 45 44 20 28 31 20 : nOT DETECTED (1 
16a5 : __ __ __ BYT 6d 68 5a 29 00                                  : mhZ).
--------------------------------------------------------------------
16aa : __ __ __ BYT 65 4e 41 42 4c 45 20 54 55 52 42 4f 20 49 4e 20 : eNABLE TURBO IN 
16ba : __ __ __ BYT 75 4c 54 49 4d 41 54 45 20 46 49 52 4d 57 41 52 : uLTIMATE FIRMWAR
16ca : __ __ __ BYT 45 00                                           : E.
--------------------------------------------------------------------
16cc : __ __ __ BYT 36 34 20 6d 68 5a 00                            : 64 mhZ.
--------------------------------------------------------------------
turbo_get: ; turbo_get()->u8
; 149, "/home/xahmol/git/UltimateDemo2026/include/turbo.h"
.s3:
16d3 : ad 31 d0 LDA $d031 
16d6 : 60 __ __ RTS
--------------------------------------------------------------------
16d7 : __ __ __ BYT 34 38 20 6d 68 5a 00                            : 48 mhZ.
--------------------------------------------------------------------
16de : __ __ __ BYT 34 30 20 6d 68 5a 00                            : 40 mhZ.
--------------------------------------------------------------------
16e5 : __ __ __ BYT 33 36 20 6d 68 5a 00                            : 36 mhZ.
--------------------------------------------------------------------
16ec : __ __ __ BYT 33 32 20 6d 68 5a 00                            : 32 mhZ.
--------------------------------------------------------------------
16f3 : __ __ __ BYT 32 38 20 6d 68 5a 00                            : 28 mhZ.
--------------------------------------------------------------------
16fa : __ __ __ BYT 38 20 6d 68 5a 00                               : 8 mhZ.
--------------------------------------------------------------------
1700 : __ __ __ BYT 32 34 20 6d 68 5a 00                            : 24 mhZ.
--------------------------------------------------------------------
1707 : __ __ __ BYT 32 30 20 6d 68 5a 00                            : 20 mhZ.
--------------------------------------------------------------------
170e : __ __ __ BYT 31 36 20 6d 68 5a 00                            : 16 mhZ.
--------------------------------------------------------------------
1715 : __ __ __ BYT 31 32 20 6d 68 5a 00                            : 12 mhZ.
--------------------------------------------------------------------
171c : __ __ __ BYT 63 48 45 43 4b 49 4e 47 20 75 4c 54 49 4d 41 54 : cHECKING uLTIMAT
172c : __ __ __ BYT 45 20 61 55 44 49 4f 2e 2e 2e 00                : E aUDIO....
--------------------------------------------------------------------
audio_detect: ; audio_detect()->u8
;  92, "/home/xahmol/git/UltimateDemo2026/include/audio.h"
.s4:
1737 : 78 __ __ SEI
1738 : a2 00 __ LDX #$00
173a : 86 43 __ STX T0 + 0 
.l15:
173c : bd e9 78 LDA $78e9,x ; (audio_ch_base[0] + 1)
173f : 85 44 __ STA T0 + 1 
1741 : a9 00 __ LDA #$00
1743 : bc e8 78 LDY $78e8,x ; (audio_ch_base[0] + 0)
1746 : 91 43 __ STA (T0 + 0),y 
1748 : e8 __ __ INX
1749 : e8 __ __ INX
174a : e0 0e __ CPX #$0e
174c : d0 ee __ BNE $173c ; (audio_detect.l15 + 0)
.s16:
174e : a9 ff __ LDA #$ff
1750 : 8d 3f df STA $df3f 
1753 : a2 00 __ LDX #$00
1755 : ad 20 df LDA $df20 
1758 : d0 08 __ BNE $1762 ; (audio_detect.s14 + 0)
.l6:
175a : ca __ __ DEX
175b : f0 09 __ BEQ $1766 ; (audio_detect.s7 + 0)
.s5:
175d : ad 20 df LDA $df20 
1760 : f0 f8 __ BEQ $175a ; (audio_detect.l6 + 0)
.s14:
1762 : 58 __ __ CLI
.s17:
1763 : a9 00 __ LDA #$00
.s3:
1765 : 60 __ __ RTS
.s7:
1766 : 8d 21 df STA $df21 
1769 : a9 01 __ LDA #$01
176b : 8d 24 df STA $df24 
176e : 8e 25 df STX $df25 
1771 : 8e 26 df STX $df26 
1774 : 8e 27 df STX $df27 
1777 : 8e 2e df STX $df2e 
177a : 8e 29 df STX $df29 
177d : 8d 2f df STA $df2f 
1780 : 8d 2a df STA $df2a 
1783 : 8e 2b df STX $df2b 
1786 : a9 05 __ LDA #$05
1788 : 8d 20 df STA $df20 
178b : a2 80 __ LDX #$80
178d : ad 20 df LDA $df20 
1790 : d0 08 __ BNE $179a ; (audio_detect.l10 + 0)
.l9:
1792 : ca __ __ DEX
1793 : f0 05 __ BEQ $179a ; (audio_detect.l10 + 0)
.s8:
1795 : ad 20 df LDA $df20 
1798 : f0 f8 __ BEQ $1792 ; (audio_detect.l9 + 0)
.l10:
179a : ac 20 df LDY $df20 
179d : 88 __ __ DEY
179e : d0 0c __ BNE $17ac ; (audio_detect.s13 + 0)
.s11:
17a0 : ca __ __ DEX
17a1 : d0 f7 __ BNE $179a ; (audio_detect.l10 + 0)
.s12:
17a3 : a9 ff __ LDA #$ff
17a5 : 8d 3f df STA $df3f 
17a8 : 58 __ __ CLI
17a9 : a9 01 __ LDA #$01
17ab : 60 __ __ RTS
.s13:
17ac : 58 __ __ CLI
17ad : a9 00 __ LDA #$00
17af : 60 __ __ RTS
--------------------------------------------------------------------
17b0 : __ __ __ BYT 61 55 44 49 4f 00                               : aUDIO.
--------------------------------------------------------------------
17b6 : __ __ __ BYT 6d 4f 44 55 4c 45 20 4e 4f 54 20 46 4f 55 4e 44 : mODULE NOT FOUND
17c6 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
17c7 : __ __ __ BYT 66 32 20 3e 20 63 36 34 2f 63 41 52 54 20 53 45 : f2 > c64/cART SE
17d7 : __ __ __ BYT 54 54 49 4e 47 53 20 3e 20 61 55 44 49 4f 00    : TTINGS > aUDIO.
--------------------------------------------------------------------
fmt_dec: ; fmt_dec(u8*,u8)->void
;  57, "/home/xahmol/git/UltimateDemo2026/src/main.c"
.s4:
17e6 : a5 0f __ LDA P2 ; (val + 0)
17e8 : c9 64 __ CMP #$64
17ea : b0 04 __ BCS $17f0 ; (fmt_dec.s7 + 0)
.s5:
17ec : a0 00 __ LDY #$00
17ee : 90 1d __ BCC $180d ; (fmt_dec.s6 + 0)
.s7:
17f0 : 85 1b __ STA ACCU + 0 
17f2 : a9 00 __ LDA #$00
17f4 : 85 1c __ STA ACCU + 1 
17f6 : 85 04 __ STA WORK + 1 
17f8 : a9 64 __ LDA #$64
17fa : 85 03 __ STA WORK + 0 
17fc : 20 81 74 JSR $7481 ; (divmod + 0)
17ff : 18 __ __ CLC
1800 : a5 1b __ LDA ACCU + 0 
1802 : 69 30 __ ADC #$30
1804 : a0 00 __ LDY #$00
1806 : 91 0d __ STA (P0),y ; (buf + 0)
1808 : a5 05 __ LDA WORK + 2 
180a : 85 0f __ STA P2 ; (val + 0)
180c : c8 __ __ INY
.s6:
180d : 84 43 __ STY T1 + 0 
180f : a9 00 __ LDA #$00
1811 : c8 __ __ INY
1812 : c8 __ __ INY
1813 : 91 0d __ STA (P0),y ; (buf + 0)
1815 : 85 1c __ STA ACCU + 1 
1817 : 85 04 __ STA WORK + 1 
1819 : a5 0f __ LDA P2 ; (val + 0)
181b : 85 1b __ STA ACCU + 0 
181d : a9 0a __ LDA #$0a
181f : 85 03 __ STA WORK + 0 
1821 : 20 81 74 JSR $7481 ; (divmod + 0)
1824 : 18 __ __ CLC
1825 : a5 1b __ LDA ACCU + 0 
1827 : 69 30 __ ADC #$30
1829 : a4 43 __ LDY T1 + 0 
182b : 91 0d __ STA (P0),y ; (buf + 0)
182d : 18 __ __ CLC
182e : a5 05 __ LDA WORK + 2 
1830 : 69 30 __ ADC #$30
1832 : c8 __ __ INY
1833 : 91 0d __ STA (P0),y ; (buf + 0)
.s3:
1835 : 60 __ __ RTS
--------------------------------------------------------------------
strcat: ; strcat(u8*,const u8*)->void
;  14, "/home/xahmol/oscar64/include/string.h"
.s4:
1836 : a5 0d __ LDA P0 ; (dst + 0)
1838 : 85 1b __ STA ACCU + 0 
183a : a5 0e __ LDA P1 ; (dst + 1)
183c : 85 1c __ STA ACCU + 1 
183e : a0 00 __ LDY #$00
1840 : b1 0d __ LDA (P0),y ; (dst + 0)
1842 : f0 0f __ BEQ $1853 ; (strcat.s5 + 0)
.s6:
1844 : 84 1b __ STY ACCU + 0 
1846 : a4 0d __ LDY P0 ; (dst + 0)
.l7:
1848 : c8 __ __ INY
1849 : d0 02 __ BNE $184d ; (strcat.s11 + 0)
.s10:
184b : e6 1c __ INC ACCU + 1 
.s11:
184d : b1 1b __ LDA (ACCU + 0),y 
184f : d0 f7 __ BNE $1848 ; (strcat.l7 + 0)
.s8:
1851 : 84 1b __ STY ACCU + 0 
.s5:
1853 : a8 __ __ TAY
.l9:
1854 : b1 0f __ LDA (P2),y ; (src + 0)
1856 : 91 1b __ STA (ACCU + 0),y 
1858 : aa __ __ TAX
1859 : e6 0f __ INC P2 ; (src + 0)
185b : d0 02 __ BNE $185f ; (strcat.s13 + 0)
.s12:
185d : e6 10 __ INC P3 ; (src + 1)
.s13:
185f : e6 1b __ INC ACCU + 0 
1861 : d0 02 __ BNE $1865 ; (strcat.s15 + 0)
.s14:
1863 : e6 1c __ INC ACCU + 1 
.s15:
1865 : 8a __ __ TXA
1866 : d0 ec __ BNE $1854 ; (strcat.l9 + 0)
.s3:
1868 : 60 __ __ RTS
--------------------------------------------------------------------
1869 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 4d 55 53 49 43 2e 2e 2e : lOADING MUSIC...
1879 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
uii_change_dir: ; uii_change_dir(u8*)->void
;  25, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
187a : a9 32 __ LDA #$32
187c : 85 0d __ STA P0 
187e : 20 d1 78 JSR $78d1 ; (strlen@proxy + 0)
1881 : 18 __ __ CLC
1882 : a5 1b __ LDA ACCU + 0 
1884 : 69 02 __ ADC #$02
1886 : 85 1b __ STA ACCU + 0 
1888 : 90 02 __ BCC $188c ; (uii_change_dir.s11 + 0)
.s10:
188a : e6 1c __ INC ACCU + 1 
.s11:
188c : 20 bd 75 JSR $75bd ; (crt_malloc + 0)
188f : a5 1c __ LDA ACCU + 1 
1891 : 05 1b __ ORA ACCU + 0 
1893 : d0 01 __ BNE $1896 ; (uii_change_dir.s5 + 0)
.s3:
1895 : 60 __ __ RTS
.s5:
1896 : a5 1c __ LDA ACCU + 1 
1898 : 85 47 __ STA T2 + 1 
189a : a5 1b __ LDA ACCU + 0 
189c : 85 46 __ STA T2 + 0 
189e : a9 00 __ LDA #$00
18a0 : a8 __ __ TAY
18a1 : 91 1b __ STA (ACCU + 0),y 
18a3 : a9 79 __ LDA #$79
18a5 : 85 0e __ STA P1 
18a7 : a9 11 __ LDA #$11
18a9 : c8 __ __ INY
18aa : 91 1b __ STA (ACCU + 0),y 
18ac : 20 47 10 JSR $1047 ; (strlen.s4 + 0)
18af : a5 1b __ LDA ACCU + 0 
18b1 : 05 1c __ ORA ACCU + 1 
18b3 : f0 23 __ BEQ $18d8 ; (uii_change_dir.s6 + 0)
.s7:
18b5 : a9 00 __ LDA #$00
18b7 : 85 45 __ STA T1 + 0 
.l9:
18b9 : a9 79 __ LDA #$79
18bb : 85 0e __ STA P1 
18bd : a6 45 __ LDX T1 + 0 
18bf : 8a __ __ TXA
18c0 : 18 __ __ CLC
18c1 : 69 02 __ ADC #$02
18c3 : a8 __ __ TAY
18c4 : bd 32 79 LDA $7932,x ; (mod_dir[0] + 0)
18c7 : 91 46 __ STA (T2 + 0),y 
18c9 : 20 47 10 JSR $1047 ; (strlen.s4 + 0)
18cc : e6 45 __ INC T1 + 0 
18ce : a5 1c __ LDA ACCU + 1 
18d0 : d0 e7 __ BNE $18b9 ; (uii_change_dir.l9 + 0)
.s8:
18d2 : a5 45 __ LDA T1 + 0 
18d4 : c5 1b __ CMP ACCU + 0 
18d6 : 90 e1 __ BCC $18b9 ; (uii_change_dir.l9 + 0)
.s6:
18d8 : a9 01 __ LDA #$01
18da : 8d fe 77 STA $77fe ; (uii_target + 0)
18dd : 20 d1 78 JSR $78d1 ; (strlen@proxy + 0)
18e0 : a5 46 __ LDA T2 + 0 
18e2 : 85 0d __ STA P0 
18e4 : a5 47 __ LDA T2 + 1 
18e6 : 85 0e __ STA P1 
18e8 : 18 __ __ CLC
18e9 : a5 1b __ LDA ACCU + 0 
18eb : 69 02 __ ADC #$02
18ed : 85 0f __ STA P2 
18ef : a5 1c __ LDA ACCU + 1 
18f1 : 69 00 __ ADC #$00
18f3 : 85 10 __ STA P3 
18f5 : 20 a4 12 JSR $12a4 ; (uii_sendcommand.s4 + 0)
18f8 : 20 b5 76 JSR $76b5 ; (crt_free@proxy + 0)
18fb : 20 4f 13 JSR $134f ; (uii_readstatus.s4 + 0)
18fe : 4c ad 13 JMP $13ad ; (uii_accept.s4 + 0)
--------------------------------------------------------------------
modplay_load: ; modplay_load(u8*,u32)->u8
; 209, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s4:
1901 : 20 6d 19 JSR $196d ; (uii_open_file.s4 + 0)
1904 : ad c9 91 LDA $91c9 ; (uii_status[0] + 0)
1907 : c9 30 __ CMP #$30
1909 : d0 07 __ BNE $1912 ; (modplay_load.s15 + 0)
.s5:
190b : ad ca 91 LDA $91ca ; (uii_status[0] + 1)
190e : c9 30 __ CMP #$30
1910 : f0 05 __ BEQ $1917 ; (modplay_load.s6 + 0)
.s15:
1912 : a9 00 __ LDA #$00
.s3:
1914 : 85 1b __ STA ACCU + 0 
1916 : 60 __ __ RTS
.s6:
1917 : a9 00 __ LDA #$00
1919 : 85 48 __ STA T0 + 0 
191b : 85 4b __ STA T0 + 3 
191d : a8 __ __ TAY
191e : aa __ __ TAX
191f : a9 10 __ LDA #$10
1921 : 85 4c __ STA T2 + 0 
.l7:
1923 : 86 13 __ STX P6 
1925 : 84 12 __ STY P5 
1927 : a5 48 __ LDA T0 + 0 
1929 : 85 11 __ STA P4 
192b : a5 4b __ LDA T0 + 3 
192d : 85 14 __ STA P7 
192f : 20 fb 19 JSR $19fb ; (uii_load_reu.s4 + 0)
1932 : 18 __ __ CLC
1933 : a5 11 __ LDA P4 
1935 : 69 ff __ ADC #$ff
1937 : 85 48 __ STA T0 + 0 
1939 : a5 12 __ LDA P5 
193b : 69 7f __ ADC #$7f
193d : a8 __ __ TAY
193e : a5 13 __ LDA P6 
1940 : 69 00 __ ADC #$00
1942 : aa __ __ TAX
1943 : a5 14 __ LDA P7 
1945 : 69 00 __ ADC #$00
1947 : 85 4b __ STA T0 + 3 
1949 : ad c9 91 LDA $91c9 ; (uii_status[0] + 0)
194c : c9 30 __ CMP #$30
194e : d0 0b __ BNE $195b ; (modplay_load.s10 + 0)
.s8:
1950 : ad ca 91 LDA $91ca ; (uii_status[0] + 1)
1953 : c9 30 __ CMP #$30
1955 : d0 04 __ BNE $195b ; (modplay_load.s10 + 0)
.s9:
1957 : c6 4c __ DEC T2 + 0 
1959 : d0 c8 __ BNE $1923 ; (modplay_load.l7 + 0)
.s10:
195b : a5 4b __ LDA T0 + 3 
195d : d0 0a __ BNE $1969 ; (modplay_load.s11 + 0)
.s12:
195f : 8a __ __ TXA
1960 : d0 07 __ BNE $1969 ; (modplay_load.s11 + 0)
.s13:
1962 : 98 __ __ TYA
1963 : d0 04 __ BNE $1969 ; (modplay_load.s11 + 0)
.s14:
1965 : c5 48 __ CMP T0 + 0 
1967 : b0 ab __ BCS $1914 ; (modplay_load.s3 + 0)
.s11:
1969 : a9 01 __ LDA #$01
196b : d0 a7 __ BNE $1914 ; (modplay_load.s3 + 0)
--------------------------------------------------------------------
uii_open_file: ; uii_open_file(u8,u8*)->void
;  31, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
196d : a9 f6 __ LDA #$f6
196f : 85 0d __ STA P0 
1971 : 20 43 10 JSR $1043 ; (strlen@proxy + 0)
1974 : 18 __ __ CLC
1975 : a5 1b __ LDA ACCU + 0 
1977 : 69 03 __ ADC #$03
1979 : 85 1b __ STA ACCU + 0 
197b : 90 02 __ BCC $197f ; (uii_open_file.s11 + 0)
.s10:
197d : e6 1c __ INC ACCU + 1 
.s11:
197f : 20 bd 75 JSR $75bd ; (crt_malloc + 0)
1982 : a5 1c __ LDA ACCU + 1 
1984 : 05 1b __ ORA ACCU + 0 
1986 : d0 01 __ BNE $1989 ; (uii_open_file.s5 + 0)
.s3:
1988 : 60 __ __ RTS
.s5:
1989 : a5 1c __ LDA ACCU + 1 
198b : 85 47 __ STA T2 + 1 
198d : a5 1b __ LDA ACCU + 0 
198f : 85 46 __ STA T2 + 0 
1991 : a9 00 __ LDA #$00
1993 : a8 __ __ TAY
1994 : 91 1b __ STA (ACCU + 0),y 
1996 : a9 78 __ LDA #$78
1998 : 85 0e __ STA P1 
199a : a9 02 __ LDA #$02
199c : c8 __ __ INY
199d : 91 1b __ STA (ACCU + 0),y 
199f : 98 __ __ TYA
19a0 : c8 __ __ INY
19a1 : 91 1b __ STA (ACCU + 0),y 
19a3 : 20 47 10 JSR $1047 ; (strlen.s4 + 0)
19a6 : a5 1b __ LDA ACCU + 0 
19a8 : 05 1c __ ORA ACCU + 1 
19aa : f0 23 __ BEQ $19cf ; (uii_open_file.s6 + 0)
.s7:
19ac : a9 00 __ LDA #$00
19ae : 85 45 __ STA T1 + 0 
.l9:
19b0 : a9 78 __ LDA #$78
19b2 : 85 0e __ STA P1 
19b4 : a6 45 __ LDX T1 + 0 
19b6 : 8a __ __ TXA
19b7 : 18 __ __ CLC
19b8 : 69 03 __ ADC #$03
19ba : a8 __ __ TAY
19bb : bd f6 78 LDA $78f6,x ; (mod_file[0] + 0)
19be : 91 46 __ STA (T2 + 0),y 
19c0 : 20 47 10 JSR $1047 ; (strlen.s4 + 0)
19c3 : e6 45 __ INC T1 + 0 
19c5 : a5 1c __ LDA ACCU + 1 
19c7 : d0 e7 __ BNE $19b0 ; (uii_open_file.l9 + 0)
.s8:
19c9 : a5 45 __ LDA T1 + 0 
19cb : c5 1b __ CMP ACCU + 0 
19cd : 90 e1 __ BCC $19b0 ; (uii_open_file.l9 + 0)
.s6:
19cf : a9 01 __ LDA #$01
19d1 : 8d fe 77 STA $77fe ; (uii_target + 0)
19d4 : 20 43 10 JSR $1043 ; (strlen@proxy + 0)
19d7 : a5 46 __ LDA T2 + 0 
19d9 : 85 0d __ STA P0 
19db : a5 47 __ LDA T2 + 1 
19dd : 85 0e __ STA P1 
19df : 18 __ __ CLC
19e0 : a5 1b __ LDA ACCU + 0 
19e2 : 69 03 __ ADC #$03
19e4 : 85 0f __ STA P2 
19e6 : a5 1c __ LDA ACCU + 1 
19e8 : 69 00 __ ADC #$00
19ea : 85 10 __ STA P3 
19ec : 20 a4 12 JSR $12a4 ; (uii_sendcommand.s4 + 0)
19ef : 20 b5 76 JSR $76b5 ; (crt_free@proxy + 0)
19f2 : 20 1f 13 JSR $131f ; (uii_readdata.s4 + 0)
19f5 : 20 4f 13 JSR $134f ; (uii_readstatus.s4 + 0)
19f8 : 4c ad 13 JMP $13ad ; (uii_accept.s4 + 0)
--------------------------------------------------------------------
uii_load_reu: ; uii_load_reu(u32,u32)->void
;  46, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
19fb : a9 00 __ LDA #$00
19fd : 85 10 __ STA P3 
19ff : 8d e0 bf STA $bfe0 ; (cmd[0] + 0)
1a02 : 8d e8 bf STA $bfe8 ; (cmd[0] + 8)
1a05 : 8d e9 bf STA $bfe9 ; (cmd[0] + 9)
1a08 : a9 0a __ LDA #$0a
1a0a : 85 0f __ STA P2 
1a0c : a9 01 __ LDA #$01
1a0e : 8d fe 77 STA $77fe ; (uii_target + 0)
1a11 : a9 21 __ LDA #$21
1a13 : 8d e1 bf STA $bfe1 ; (cmd[0] + 1)
1a16 : a9 ff __ LDA #$ff
1a18 : 8d e6 bf STA $bfe6 ; (cmd[0] + 6)
1a1b : a9 7f __ LDA #$7f
1a1d : 8d e7 bf STA $bfe7 ; (cmd[0] + 7)
1a20 : a5 11 __ LDA P4 ; (reu_addr + 0)
1a22 : 8d e2 bf STA $bfe2 ; (cmd[0] + 2)
1a25 : a5 12 __ LDA P5 ; (reu_addr + 1)
1a27 : 8d e3 bf STA $bfe3 ; (cmd[0] + 3)
1a2a : a5 13 __ LDA P6 ; (reu_addr + 2)
1a2c : 8d e4 bf STA $bfe4 ; (cmd[0] + 4)
1a2f : a5 14 __ LDA P7 ; (reu_addr + 3)
1a31 : 8d e5 bf STA $bfe5 ; (cmd[0] + 5)
1a34 : a9 e0 __ LDA #$e0
1a36 : 85 0d __ STA P0 
1a38 : a9 bf __ LDA #$bf
1a3a : 85 0e __ STA P1 
1a3c : 20 a4 12 JSR $12a4 ; (uii_sendcommand.s4 + 0)
1a3f : 20 1f 13 JSR $131f ; (uii_readdata.s4 + 0)
1a42 : 20 4f 13 JSR $134f ; (uii_readstatus.s4 + 0)
1a45 : 4c ad 13 JMP $13ad ; (uii_accept.s4 + 0)
--------------------------------------------------------------------
modplay_init: ; modplay_init(u32)->u8
; 227, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s4:
1a48 : a9 00 __ LDA #$00
1a4a : 8d 08 97 STA $9708 ; (modplay.reu_base + 0)
1a4d : 8d 09 97 STA $9709 ; (modplay.reu_base + 1)
1a50 : 8d 0a 97 STA $970a ; (modplay.reu_base + 2)
1a53 : 8d 0b 97 STA $970b ; (modplay.reu_base + 3)
1a56 : a2 ca __ LDX #$ca
1a58 : 8e 02 df STX $df02 
1a5b : a2 92 __ LDX #$92
1a5d : 8e 03 df STX $df03 
1a60 : 8d 04 df STA $df04 
1a63 : 8d 05 df STA $df05 
1a66 : 8d 06 df STA $df06 
1a69 : a9 3c __ LDA #$3c
1a6b : 8d 07 df STA $df07 
1a6e : a9 04 __ LDA #$04
1a70 : 8d 08 df STA $df08 
1a73 : a9 00 __ LDA #$00
1a75 : 8d 0a df STA $df0a 
1a78 : a9 91 __ LDA #$91
1a7a : 8d 01 df STA $df01 
1a7d : ad 02 97 LDA $9702 ; (hdr[0] + 1080)
1a80 : c9 4d __ CMP #$4d
1a82 : f0 03 __ BEQ $1a87 ; (modplay_init.s48 + 0)
1a84 : 4c e7 1c JMP $1ce7 ; (modplay_init.s5 + 0)
.s48:
1a87 : ad 03 97 LDA $9703 ; (hdr[0] + 1081)
1a8a : c9 2e __ CMP #$2e
1a8c : d0 03 __ BNE $1a91 ; (modplay_init.s49 + 0)
1a8e : 4c d6 1c JMP $1cd6 ; (modplay_init.s52 + 0)
.s49:
1a91 : c9 21 __ CMP #$21
1a93 : d0 0e __ BNE $1aa3 ; (modplay_init.s6 + 0)
.s50:
1a95 : ad 04 97 LDA $9704 ; (hdr[0] + 1082)
1a98 : c9 4b __ CMP #$4b
1a9a : d0 07 __ BNE $1aa3 ; (modplay_init.s6 + 0)
.s51:
1a9c : ad 05 97 LDA $9705 ; (hdr[0] + 1083)
1a9f : c9 21 __ CMP #$21
1aa1 : f0 1c __ BEQ $1abf ; (modplay_init.s44 + 0)
.s6:
1aa3 : ad 02 97 LDA $9702 ; (hdr[0] + 1080)
1aa6 : c9 46 __ CMP #$46
1aa8 : d0 19 __ BNE $1ac3 ; (modplay_init.s7 + 0)
.s41:
1aaa : ad 03 97 LDA $9703 ; (hdr[0] + 1081)
1aad : c9 4c __ CMP #$4c
1aaf : d0 12 __ BNE $1ac3 ; (modplay_init.s7 + 0)
.s42:
1ab1 : ad 04 97 LDA $9704 ; (hdr[0] + 1082)
1ab4 : c9 54 __ CMP #$54
1ab6 : d0 0b __ BNE $1ac3 ; (modplay_init.s7 + 0)
.s43:
1ab8 : ad 05 97 LDA $9705 ; (hdr[0] + 1083)
1abb : c9 34 __ CMP #$34
1abd : d0 04 __ BNE $1ac3 ; (modplay_init.s7 + 0)
.s44:
1abf : a9 1f __ LDA #$1f
1ac1 : d0 17 __ BNE $1ada ; (modplay_init.s12 + 0)
.s7:
1ac3 : a2 00 __ LDX #$00
.l8:
1ac5 : bd 02 97 LDA $9702,x ; (hdr[0] + 1080)
1ac8 : c9 20 __ CMP #$20
1aca : b0 03 __ BCS $1acf ; (modplay_init.s9 + 0)
1acc : 4c d1 1c JMP $1cd1 ; (modplay_init.s40 + 0)
.s9:
1acf : c9 7f __ CMP #$7f
1ad1 : b0 f9 __ BCS $1acc ; (modplay_init.l8 + 7)
.s10:
1ad3 : e8 __ __ INX
1ad4 : e0 04 __ CPX #$04
1ad6 : 90 ed __ BCC $1ac5 ; (modplay_init.l8 + 0)
.s11:
1ad8 : a9 0f __ LDA #$0f
.s12:
1ada : 8d 0d 97 STA $970d ; (modplay.num_samples + 0)
1add : ad 80 96 LDA $9680 ; (hdr[0] + 950)
1ae0 : 8d 0c 97 STA $970c ; (modplay.song_length + 0)
1ae3 : d0 09 __ BNE $1aee ; (modplay_init.s39 + 0)
.s62:
1ae5 : a9 80 __ LDA #$80
.s13:
1ae7 : 8d 0c 97 STA $970c ; (modplay.song_length + 0)
.s14:
1aea : a2 7f __ LDX #$7f
1aec : d0 09 __ BNE $1af7 ; (modplay_init.l15 + 0)
.s39:
1aee : a9 80 __ LDA #$80
1af0 : cd 80 96 CMP $9680 ; (hdr[0] + 950)
1af3 : b0 f5 __ BCS $1aea ; (modplay_init.s14 + 0)
1af5 : 90 f0 __ BCC $1ae7 ; (modplay_init.s13 + 0)
.l15:
1af7 : bd 82 96 LDA $9682,x ; (hdr[0] + 952)
1afa : 9d 0f 97 STA $970f,x ; (modplay.order_table[0] + 0)
1afd : ca __ __ DEX
1afe : 10 f7 __ BPL $1af7 ; (modplay_init.l15 + 0)
.s16:
1b00 : a2 00 __ LDX #$00
1b02 : a0 00 __ LDY #$00
.l17:
1b04 : 98 __ __ TYA
1b05 : dd 0f 97 CMP $970f,x ; (modplay.order_table[0] + 0)
1b08 : b0 04 __ BCS $1b0e ; (modplay_init.s18 + 0)
.s38:
1b0a : bd 0f 97 LDA $970f,x ; (modplay.order_table[0] + 0)
1b0d : a8 __ __ TAY
.s18:
1b0e : e8 __ __ INX
1b0f : 10 f3 __ BPL $1b04 ; (modplay_init.l17 + 0)
.s19:
1b11 : 18 __ __ CLC
1b12 : 69 01 __ ADC #$01
1b14 : 85 1c __ STA ACCU + 1 
1b16 : 8d 0e 97 STA $970e ; (modplay.num_patterns + 0)
1b19 : a9 00 __ LDA #$00
1b1b : 06 1c __ ASL ACCU + 1 
1b1d : 2a __ __ ROL
1b1e : 06 1c __ ASL ACCU + 1 
1b20 : 2a __ __ ROL
1b21 : 85 1d __ STA ACCU + 2 
1b23 : ad 0d 97 LDA $970d ; (modplay.num_samples + 0)
1b26 : c9 1f __ CMP #$1f
1b28 : d0 03 __ BNE $1b2d ; (modplay_init.s20 + 0)
1b2a : 4c bd 1c JMP $1cbd ; (modplay_init.s37 + 0)
.s20:
1b2d : a5 1c __ LDA ACCU + 1 
1b2f : 09 02 __ ORA #$02
1b31 : 85 1c __ STA ACCU + 1 
1b33 : a9 58 __ LDA #$58
1b35 : 85 1b __ STA ACCU + 0 
1b37 : ad 0d 97 LDA $970d ; (modplay.num_samples + 0)
1b3a : d0 66 __ BNE $1ba2 ; (modplay_init.s31 + 0)
.s21:
1b3c : a9 00 __ LDA #$00
1b3e : 8d ff 77 STA $77ff ; (mod_paused + 0)
1b41 : 8d 8f 97 STA $978f ; (modplay.order_pos + 0)
1b44 : 8d 91 97 STA $9791 ; (modplay.row + 0)
1b47 : 8d 92 97 STA $9792 ; (modplay.tick + 0)
1b4a : 8d 98 97 STA $9798 ; (modplay.active + 0)
1b4d : ad 0f 97 LDA $970f ; (modplay.order_table[0] + 0)
1b50 : 8d 90 97 STA $9790 ; (modplay.pattern_num + 0)
1b53 : a9 01 __ LDA #$01
1b55 : 8d 97 97 STA $9797 ; (modplay.stereo + 0)
1b58 : 8d 99 97 STA $9799 ; (modplay.loop_song + 0)
1b5b : a9 06 __ LDA #$06
1b5d : 8d 93 97 STA $9793 ; (modplay.ticks_per_row + 0)
1b60 : a9 7d __ LDA #$7d
1b62 : 8d 94 97 STA $9794 ; (modplay.bpm + 0)
1b65 : a9 00 __ LDA #$00
1b67 : a2 c8 __ LDX #$c8
1b69 : 8e 96 97 STX $9796 ; (modplay.master_volume + 0)
.l22:
1b6c : ca __ __ DEX
1b6d : 9d ea 99 STA $99ea,x ; (modplay.channel[0].sample_num + 0)
1b70 : d0 fa __ BNE $1b6c ; (modplay_init.l22 + 0)
.s23:
1b72 : 85 46 __ STA T2 + 0 
.l24:
1b74 : a5 46 __ LDA T2 + 0 
1b76 : c9 01 __ CMP #$01
1b78 : f0 04 __ BEQ $1b7e ; (modplay_init.s30 + 0)
.s25:
1b7a : c9 02 __ CMP #$02
1b7c : d0 04 __ BNE $1b82 ; (modplay_init.s26 + 0)
.s30:
1b7e : a0 ff __ LDY #$ff
1b80 : d0 02 __ BNE $1b84 ; (modplay_init.l27 + 0)
.s26:
1b82 : a0 00 __ LDY #$00
.l27:
1b84 : a6 46 __ LDX T2 + 0 
1b86 : bd bc 77 LDA $77bc,x ; (__multab50L + 0)
1b89 : aa __ __ TAX
1b8a : 98 __ __ TYA
1b8b : 9d f0 99 STA $99f0,x ; (modplay.channel[0].pan + 0)
1b8e : e6 46 __ INC T2 + 0 
1b90 : a5 46 __ LDA T2 + 0 
1b92 : c9 04 __ CMP #$04
1b94 : b0 07 __ BCS $1b9d ; (modplay_init.s28 + 0)
.s29:
1b96 : ad 97 97 LDA $9797 ; (modplay.stereo + 0)
1b99 : f0 e7 __ BEQ $1b82 ; (modplay_init.s26 + 0)
1b9b : d0 d7 __ BNE $1b74 ; (modplay_init.l24 + 0)
.s28:
1b9d : a9 01 __ LDA #$01
.s3:
1b9f : 85 1b __ STA ACCU + 0 
1ba1 : 60 __ __ RTS
.s31:
1ba2 : a9 00 __ LDA #$00
1ba4 : 85 43 __ STA T1 + 0 
1ba6 : 85 44 __ STA T1 + 1 
1ba8 : 85 45 __ STA T1 + 2 
1baa : 85 1e __ STA ACCU + 3 
1bac : a9 9d __ LDA #$9d
1bae : 85 4e __ STA T6 + 0 
1bb0 : a9 97 __ LDA #$97
1bb2 : 85 4f __ STA T6 + 1 
1bb4 : a9 de __ LDA #$de
1bb6 : 85 50 __ STA T7 + 0 
1bb8 : a9 92 __ LDA #$92
1bba : 85 51 __ STA T7 + 1 
1bbc : a2 00 __ LDX #$00
1bbe : 18 __ __ CLC
.l32:
1bbf : a5 1b __ LDA ACCU + 0 
1bc1 : 65 43 __ ADC T1 + 0 
1bc3 : a0 00 __ LDY #$00
1bc5 : 84 48 __ STY T2 + 2 
1bc7 : 91 4e __ STA (T6 + 0),y 
1bc9 : a5 1c __ LDA ACCU + 1 
1bcb : 65 44 __ ADC T1 + 1 
1bcd : c8 __ __ INY
1bce : 91 4e __ STA (T6 + 0),y 
1bd0 : a5 1d __ LDA ACCU + 2 
1bd2 : 65 45 __ ADC T1 + 2 
1bd4 : c8 __ __ INY
1bd5 : 91 4e __ STA (T6 + 0),y 
1bd7 : 8a __ __ TXA
1bd8 : 69 00 __ ADC #$00
1bda : c8 __ __ INY
1bdb : 91 4e __ STA (T6 + 0),y 
1bdd : a0 16 __ LDY #$16
1bdf : b1 50 __ LDA (T7 + 0),y 
1be1 : 85 47 __ STA T2 + 1 
1be3 : c8 __ __ INY
1be4 : b1 50 __ LDA (T7 + 0),y 
1be6 : 0a __ __ ASL
1be7 : 85 46 __ STA T2 + 0 
1be9 : 26 47 __ ROL T2 + 1 
1beb : 26 48 __ ROL T2 + 2 
1bed : a0 04 __ LDY #$04
1bef : 91 4e __ STA (T6 + 0),y 
1bf1 : a5 47 __ LDA T2 + 1 
1bf3 : c8 __ __ INY
1bf4 : 91 4e __ STA (T6 + 0),y 
1bf6 : a5 48 __ LDA T2 + 2 
1bf8 : c8 __ __ INY
1bf9 : 91 4e __ STA (T6 + 0),y 
1bfb : a9 00 __ LDA #$00
1bfd : c8 __ __ INY
1bfe : 91 4e __ STA (T6 + 0),y 
1c00 : a0 19 __ LDY #$19
1c02 : b1 50 __ LDA (T7 + 0),y 
1c04 : c9 41 __ CMP #$41
1c06 : 90 02 __ BCC $1c0a ; (modplay_init.s54 + 0)
.s33:
1c08 : a9 40 __ LDA #$40
.s54:
1c0a : a0 11 __ LDY #$11
1c0c : 91 4e __ STA (T6 + 0),y 
1c0e : a0 18 __ LDY #$18
1c10 : b1 50 __ LDA (T7 + 0),y 
1c12 : 29 0f __ AND #$0f
1c14 : a0 12 __ LDY #$12
1c16 : 91 4e __ STA (T6 + 0),y 
1c18 : a0 1a __ LDY #$1a
1c1a : b1 50 __ LDA (T7 + 0),y 
1c1c : 85 4a __ STA T3 + 1 
1c1e : c8 __ __ INY
1c1f : b1 50 __ LDA (T7 + 0),y 
1c21 : 85 49 __ STA T3 + 0 
1c23 : 0a __ __ ASL
1c24 : a0 08 __ LDY #$08
1c26 : 91 4e __ STA (T6 + 0),y 
1c28 : a5 4a __ LDA T3 + 1 
1c2a : 2a __ __ ROL
1c2b : c8 __ __ INY
1c2c : 91 4e __ STA (T6 + 0),y 
1c2e : a9 00 __ LDA #$00
1c30 : 2a __ __ ROL
1c31 : c8 __ __ INY
1c32 : 91 4e __ STA (T6 + 0),y 
1c34 : a9 00 __ LDA #$00
1c36 : c8 __ __ INY
1c37 : 91 4e __ STA (T6 + 0),y 
1c39 : a0 1d __ LDY #$1d
1c3b : b1 50 __ LDA (T7 + 0),y 
1c3d : 85 4c __ STA T4 + 0 
1c3f : 65 49 __ ADC T3 + 0 
1c41 : 85 49 __ STA T3 + 0 
1c43 : 88 __ __ DEY
1c44 : b1 50 __ LDA (T7 + 0),y 
1c46 : 85 4d __ STA T4 + 1 
1c48 : 65 4a __ ADC T3 + 1 
1c4a : 85 4a __ STA T3 + 1 
1c4c : a9 00 __ LDA #$00
1c4e : 2a __ __ ROL
1c4f : 85 4b __ STA T3 + 2 
1c51 : a9 00 __ LDA #$00
1c53 : 06 49 __ ASL T3 + 0 
1c55 : 26 4a __ ROL T3 + 1 
1c57 : 26 4b __ ROL T3 + 2 
1c59 : a0 0f __ LDY #$0f
1c5b : 91 4e __ STA (T6 + 0),y 
1c5d : a5 49 __ LDA T3 + 0 
1c5f : a0 0c __ LDY #$0c
1c61 : 91 4e __ STA (T6 + 0),y 
1c63 : a5 4a __ LDA T3 + 1 
1c65 : c8 __ __ INY
1c66 : 91 4e __ STA (T6 + 0),y 
1c68 : a5 4b __ LDA T3 + 2 
1c6a : c8 __ __ INY
1c6b : 91 4e __ STA (T6 + 0),y 
1c6d : a5 4d __ LDA T4 + 1 
1c6f : f0 04 __ BEQ $1c75 ; (modplay_init.s36 + 0)
.s35:
1c71 : a9 01 __ LDA #$01
1c73 : d0 09 __ BNE $1c7e ; (modplay_init.s34 + 0)
.s36:
1c75 : a9 01 __ LDA #$01
1c77 : c5 4c __ CMP T4 + 0 
1c79 : a9 00 __ LDA #$00
1c7b : 2a __ __ ROL
1c7c : 49 01 __ EOR #$01
.s34:
1c7e : a0 10 __ LDY #$10
1c80 : 91 4e __ STA (T6 + 0),y 
1c82 : 18 __ __ CLC
1c83 : a5 46 __ LDA T2 + 0 
1c85 : 65 43 __ ADC T1 + 0 
1c87 : 85 43 __ STA T1 + 0 
1c89 : a5 47 __ LDA T2 + 1 
1c8b : 65 44 __ ADC T1 + 1 
1c8d : 85 44 __ STA T1 + 1 
1c8f : a5 48 __ LDA T2 + 2 
1c91 : 65 45 __ ADC T1 + 2 
1c93 : 85 45 __ STA T1 + 2 
1c95 : 90 02 __ BCC $1c99 ; (modplay_init.s57 + 0)
.s56:
1c97 : e8 __ __ INX
1c98 : 18 __ __ CLC
.s57:
1c99 : a5 50 __ LDA T7 + 0 
1c9b : 69 1e __ ADC #$1e
1c9d : 85 50 __ STA T7 + 0 
1c9f : 90 03 __ BCC $1ca4 ; (modplay_init.s59 + 0)
.s58:
1ca1 : e6 51 __ INC T7 + 1 
1ca3 : 18 __ __ CLC
.s59:
1ca4 : a5 4e __ LDA T6 + 0 
1ca6 : 69 13 __ ADC #$13
1ca8 : 85 4e __ STA T6 + 0 
1caa : 90 02 __ BCC $1cae ; (modplay_init.s61 + 0)
.s60:
1cac : e6 4f __ INC T6 + 1 
.s61:
1cae : e6 1e __ INC ACCU + 3 
1cb0 : a5 1e __ LDA ACCU + 3 
1cb2 : cd 0d 97 CMP $970d ; (modplay.num_samples + 0)
1cb5 : b0 03 __ BCS $1cba ; (modplay_init.s61 + 12)
1cb7 : 4c bf 1b JMP $1bbf ; (modplay_init.l32 + 0)
1cba : 4c 3c 1b JMP $1b3c ; (modplay_init.s21 + 0)
.s37:
1cbd : a9 3c __ LDA #$3c
1cbf : 85 1b __ STA ACCU + 0 
1cc1 : a5 1c __ LDA ACCU + 1 
1cc3 : 69 03 __ ADC #$03
1cc5 : 85 1c __ STA ACCU + 1 
1cc7 : b0 03 __ BCS $1ccc ; (modplay_init.s55 + 0)
1cc9 : 4c a2 1b JMP $1ba2 ; (modplay_init.s31 + 0)
.s55:
1ccc : e6 1d __ INC ACCU + 2 
1cce : 4c a2 1b JMP $1ba2 ; (modplay_init.s31 + 0)
.s40:
1cd1 : a9 00 __ LDA #$00
1cd3 : 4c 9f 1b JMP $1b9f ; (modplay_init.s3 + 0)
.s52:
1cd6 : ad 04 97 LDA $9704 ; (hdr[0] + 1082)
1cd9 : c9 4b __ CMP #$4b
1cdb : d0 0a __ BNE $1ce7 ; (modplay_init.s5 + 0)
.s53:
1cdd : ad 05 97 LDA $9705 ; (hdr[0] + 1083)
1ce0 : c9 2e __ CMP #$2e
1ce2 : d0 03 __ BNE $1ce7 ; (modplay_init.s5 + 0)
1ce4 : 4c bf 1a JMP $1abf ; (modplay_init.s44 + 0)
.s5:
1ce7 : ad 02 97 LDA $9702 ; (hdr[0] + 1080)
1cea : c9 34 __ CMP #$34
1cec : f0 03 __ BEQ $1cf1 ; (modplay_init.s45 + 0)
1cee : 4c a3 1a JMP $1aa3 ; (modplay_init.s6 + 0)
.s45:
1cf1 : ad 03 97 LDA $9703 ; (hdr[0] + 1081)
1cf4 : c9 43 __ CMP #$43
1cf6 : f0 03 __ BEQ $1cfb ; (modplay_init.s46 + 0)
1cf8 : 4c c3 1a JMP $1ac3 ; (modplay_init.s7 + 0)
.s46:
1cfb : ad 04 97 LDA $9704 ; (hdr[0] + 1082)
1cfe : c9 48 __ CMP #$48
1d00 : d0 f6 __ BNE $1cf8 ; (modplay_init.s45 + 7)
.s47:
1d02 : ad 05 97 LDA $9705 ; (hdr[0] + 1083)
1d05 : c9 4e __ CMP #$4e
1d07 : d0 ef __ BNE $1cf8 ; (modplay_init.s45 + 7)
1d09 : 4c bf 1a JMP $1abf ; (modplay_init.s44 + 0)
--------------------------------------------------------------------
1d0c : __ __ __ BYT 6d 55 53 49 43 00                               : mUSIC.
--------------------------------------------------------------------
1d12 : __ __ __ BYT 34 45 56 2e 4d 4f 44 00                         : 4EV.MOD.
--------------------------------------------------------------------
1d1a : __ __ __ BYT 62 41 44 20 6d 6f 64 20 46 4f 52 4d 41 54 00    : bAD mod FORMAT.
--------------------------------------------------------------------
1d29 : __ __ __ BYT 66 49 4c 45 20 4e 4f 54 20 46 4f 55 4e 44 00    : fILE NOT FOUND.
--------------------------------------------------------------------
1d38 : __ __ __ BYT 64 45 54 45 43 54 49 4f 4e 20 43 4f 4d 50 4c 45 : dETECTION COMPLE
1d48 : __ __ __ BYT 54 45 2e 00                                     : TE..
--------------------------------------------------------------------
screen_wait_key: ; screen_wait_key(const u8*)->void
;  37, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
1d4c : a9 01 __ LDA #$01
1d4e : 85 0f __ STA P2 
1d50 : a5 10 __ LDA P3 ; (msg + 0)
1d52 : aa __ __ TAX
1d53 : 05 11 __ ORA P4 ; (msg + 1)
1d55 : f0 0a __ BEQ $1d61 ; (screen_wait_key.s5 + 0)
.s7:
1d57 : a5 11 __ LDA P4 ; (msg + 1)
1d59 : 85 0e __ STA P1 
1d5b : a0 00 __ LDY #$00
1d5d : b1 10 __ LDA (P3),y ; (msg + 0)
1d5f : d0 06 __ BNE $1d67 ; (screen_wait_key.s6 + 0)
.s5:
1d61 : a9 1d __ LDA #$1d
1d63 : 85 0e __ STA P1 
1d65 : a2 72 __ LDX #$72
.s6:
1d67 : 86 0d __ STX P0 
1d69 : 20 c5 10 JSR $10c5 ; (cwin_put_string.s4 + 0)
1d6c : 20 a5 10 JSR $10a5 ; (cwin_cursor_newline.s4 + 0)
1d6f : 4c 1e 12 JMP $121e ; (cwin_getch.s4 + 0)
--------------------------------------------------------------------
1d72 : __ __ __ BYT 70 52 45 53 53 20 41 4e 59 20 4b 45 59 20 54 4f : pRESS ANY KEY TO
1d82 : __ __ __ BYT 20 43 4f 4e 54 49 4e 55 45 2e 00                :  CONTINUE..
--------------------------------------------------------------------
1d8d : __ __ __ BYT 70 52 45 53 53 20 41 4e 59 20 4b 45 59 20 54 4f : pRESS ANY KEY TO
1d9d : __ __ __ BYT 20 53 54 41 52 54 20 54 48 45 20 44 45 4d 4f 2e :  START THE DEMO.
1dad : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
gears_run: ; gears_run()->void
;   8, "/home/xahmol/git/UltimateDemo2026/src/gears.h"
.s1:
1dae : a5 53 __ LDA T0 + 0 
1db0 : 8d ad bf STA $bfad ; (gears_run@stack + 0)
.s4:
1db3 : a9 00 __ LDA #$00
1db5 : 85 f9 __ STA $f9 ; (zp_spd + 0)
1db7 : 85 f7 __ STA $f7 ; (zp_angle1 + 0)
1db9 : a9 01 __ LDA #$01
1dbb : 85 fa __ STA $fa ; (zp_dirty + 0)
1dbd : a9 1c __ LDA #$1c
1dbf : 85 f8 __ STA $f8 ; (zp_angle2 + 0)
1dc1 : 20 80 20 JSR $2080 ; (hires_init.s4 + 0)
1dc4 : 20 58 21 JSR $2158 ; (engine_init.s4 + 0)
1dc7 : a9 00 __ LDA #$00
1dc9 : 20 f3 15 JSR $15f3 ; (turbo_set.s4 + 0)
1dcc : a9 00 __ LDA #$00
1dce : 85 0f __ STA P2 
1dd0 : 85 10 __ STA P3 
1dd2 : a9 e0 __ LDA #$e0
1dd4 : 85 11 __ STA P4 
1dd6 : a9 06 __ LDA #$06
1dd8 : 85 12 __ STA P5 
1dda : 20 9f 21 JSR $219f ; (tod_reset.s4 + 0)
1ddd : 20 ea 20 JSR $20ea ; (memset@proxy + 0)
1de0 : a9 00 __ LDA #$00
1de2 : 8d f3 bf STA $bff3 ; (sstack + 9)
1de5 : 20 aa 21 JSR $21aa ; (draw_speed.s1 + 0)
1de8 : a9 00 __ LDA #$00
1dea : 8d f0 bf STA $bff0 ; (sstack + 6)
1ded : 20 fe 2b JSR $2bfe ; (draw_message.s1 + 0)
1df0 : a9 1c __ LDA #$1c
1df2 : 8d f9 bf STA $bff9 ; (sstack + 15)
1df5 : 8d fc bf STA $bffc ; (sstack + 18)
1df8 : a9 d0 __ LDA #$d0
1dfa : 8d f7 bf STA $bff7 ; (sstack + 13)
1dfd : a9 00 __ LDA #$00
1dff : 8d f8 bf STA $bff8 ; (sstack + 14)
1e02 : a9 08 __ LDA #$08
1e04 : 8d fa bf STA $bffa ; (sstack + 16)
1e07 : 8d fb bf STA $bffb ; (sstack + 17)
1e0a : 8d fe bf STA $bffe ; (sstack + 20)
1e0d : a9 28 __ LDA #$28
1e0f : 8d fd bf STA $bffd ; (sstack + 19)
1e12 : a9 04 __ LDA #$04
1e14 : 8d ff bf STA $bfff ; (sstack + 21)
1e17 : 20 ee 2f JSR $2fee ; (draw_gear.s1 + 0)
1e1a : a9 00 __ LDA #$00
1e1c : 8d f8 bf STA $bff8 ; (sstack + 14)
1e1f : 8d f9 bf STA $bff9 ; (sstack + 15)
1e22 : a9 78 __ LDA #$78
1e24 : 8d f7 bf STA $bff7 ; (sstack + 13)
1e27 : a9 10 __ LDA #$10
1e29 : 8d fa bf STA $bffa ; (sstack + 16)
1e2c : a9 04 __ LDA #$04
1e2e : 8d fb bf STA $bffb ; (sstack + 17)
1e31 : a9 2c __ LDA #$2c
1e33 : 8d fc bf STA $bffc ; (sstack + 18)
1e36 : a9 36 __ LDA #$36
1e38 : 8d fd bf STA $bffd ; (sstack + 19)
1e3b : a9 0a __ LDA #$0a
1e3d : 8d fe bf STA $bffe ; (sstack + 20)
1e40 : a9 06 __ LDA #$06
1e42 : 8d ff bf STA $bfff ; (sstack + 21)
1e45 : 20 ee 2f JSR $2fee ; (draw_gear.s1 + 0)
1e48 : a9 00 __ LDA #$00
.l20:
1e4a : 85 fa __ STA $fa ; (zp_dirty + 0)
.l5:
1e4c : a9 0f __ LDA #$0f
1e4e : c5 f9 __ CMP $f9 ; (zp_spd + 0)
1e50 : b0 0f __ BCS $1e61 ; (gears_run.l12 + 0)
.s6:
1e52 : a9 8f __ LDA #$8f
1e54 : 20 f3 15 JSR $15f3 ; (turbo_set.s4 + 0)
1e57 : a9 0f __ LDA #$0f
1e59 : 85 f9 __ STA $f9 ; (zp_spd + 0)
1e5b : 20 9f 21 JSR $219f ; (tod_reset.s4 + 0)
1e5e : 4c 8d 1f JMP $1f8d ; (gears_run.l7 + 0)
.l12:
1e61 : 2c 11 d0 BIT $d011 
1e64 : 30 fb __ BMI $1e61 ; (gears_run.l12 + 0)
.l13:
1e66 : 2c 11 d0 BIT $d011 
1e69 : 10 fb __ BPL $1e66 ; (gears_run.l13 + 0)
.s14:
1e6b : a5 fa __ LDA $fa ; (zp_dirty + 0)
1e6d : f0 25 __ BEQ $1e94 ; (gears_run.s15 + 0)
.s19:
1e6f : a9 00 __ LDA #$00
1e71 : 85 0f __ STA P2 
1e73 : 85 10 __ STA P3 
1e75 : a9 e0 __ LDA #$e0
1e77 : 85 11 __ STA P4 
1e79 : a9 06 __ LDA #$06
1e7b : 85 12 __ STA P5 
1e7d : 20 ea 20 JSR $20ea ; (memset@proxy + 0)
1e80 : a5 f9 __ LDA $f9 ; (zp_spd + 0)
1e82 : 8d f3 bf STA $bff3 ; (sstack + 9)
1e85 : 20 aa 21 JSR $21aa ; (draw_speed.s1 + 0)
1e88 : a5 f9 __ LDA $f9 ; (zp_spd + 0)
1e8a : 8d f0 bf STA $bff0 ; (sstack + 6)
1e8d : 20 fe 2b JSR $2bfe ; (draw_message.s1 + 0)
1e90 : a9 00 __ LDA #$00
1e92 : 85 fa __ STA $fa ; (zp_dirty + 0)
.s15:
1e94 : a9 d0 __ LDA #$d0
1e96 : 8d f7 bf STA $bff7 ; (sstack + 13)
1e99 : a9 00 __ LDA #$00
1e9b : 8d f8 bf STA $bff8 ; (sstack + 14)
1e9e : a5 f8 __ LDA $f8 ; (zp_angle2 + 0)
1ea0 : 8d f9 bf STA $bff9 ; (sstack + 15)
1ea3 : a9 08 __ LDA #$08
1ea5 : 8d fa bf STA $bffa ; (sstack + 16)
1ea8 : 8d fb bf STA $bffb ; (sstack + 17)
1eab : 8d fe bf STA $bffe ; (sstack + 20)
1eae : a9 1c __ LDA #$1c
1eb0 : 8d fc bf STA $bffc ; (sstack + 18)
1eb3 : a9 28 __ LDA #$28
1eb5 : 8d fd bf STA $bffd ; (sstack + 19)
1eb8 : a9 04 __ LDA #$04
1eba : 8d ff bf STA $bfff ; (sstack + 21)
1ebd : 20 ee 2f JSR $2fee ; (draw_gear.s1 + 0)
1ec0 : a9 78 __ LDA #$78
1ec2 : 8d f7 bf STA $bff7 ; (sstack + 13)
1ec5 : a9 00 __ LDA #$00
1ec7 : 8d f8 bf STA $bff8 ; (sstack + 14)
1eca : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
1ecc : 8d f9 bf STA $bff9 ; (sstack + 15)
1ecf : a9 10 __ LDA #$10
1ed1 : 8d fa bf STA $bffa ; (sstack + 16)
1ed4 : a9 04 __ LDA #$04
1ed6 : 8d fb bf STA $bffb ; (sstack + 17)
1ed9 : a9 2c __ LDA #$2c
1edb : 8d fc bf STA $bffc ; (sstack + 18)
1ede : a9 36 __ LDA #$36
1ee0 : 8d fd bf STA $bffd ; (sstack + 19)
1ee3 : a9 0a __ LDA #$0a
1ee5 : 8d fe bf STA $bffe ; (sstack + 20)
1ee8 : a9 06 __ LDA #$06
1eea : 8d ff bf STA $bfff ; (sstack + 21)
1eed : 20 ee 2f JSR $2fee ; (draw_gear.s1 + 0)
1ef0 : 78 __ __ SEI
1ef1 : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
1ef3 : 18 __ __ CLC
1ef4 : 69 01 __ ADC #$01
1ef6 : 29 3f __ AND #$3f
1ef8 : 85 f7 __ STA $f7 ; (zp_angle1 + 0)
1efa : a5 f8 __ LDA $f8 ; (zp_angle2 + 0)
1efc : 38 __ __ SEC
1efd : e9 02 __ SBC #$02
1eff : 29 3f __ AND #$3f
1f01 : 85 53 __ STA T0 + 0 
1f03 : 85 f8 __ STA $f8 ; (zp_angle2 + 0)
1f05 : 58 __ __ CLI
1f06 : a9 d0 __ LDA #$d0
1f08 : 8d f7 bf STA $bff7 ; (sstack + 13)
1f0b : a9 00 __ LDA #$00
1f0d : 8d f8 bf STA $bff8 ; (sstack + 14)
1f10 : a5 53 __ LDA T0 + 0 
1f12 : 8d f9 bf STA $bff9 ; (sstack + 15)
1f15 : a9 08 __ LDA #$08
1f17 : 8d fa bf STA $bffa ; (sstack + 16)
1f1a : 8d fb bf STA $bffb ; (sstack + 17)
1f1d : 8d fe bf STA $bffe ; (sstack + 20)
1f20 : a9 1c __ LDA #$1c
1f22 : 8d fc bf STA $bffc ; (sstack + 18)
1f25 : a9 28 __ LDA #$28
1f27 : 8d fd bf STA $bffd ; (sstack + 19)
1f2a : a9 04 __ LDA #$04
1f2c : 8d ff bf STA $bfff ; (sstack + 21)
1f2f : 20 ee 2f JSR $2fee ; (draw_gear.s1 + 0)
1f32 : a9 78 __ LDA #$78
1f34 : 8d f7 bf STA $bff7 ; (sstack + 13)
1f37 : a9 00 __ LDA #$00
1f39 : 8d f8 bf STA $bff8 ; (sstack + 14)
1f3c : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
1f3e : 8d f9 bf STA $bff9 ; (sstack + 15)
1f41 : a9 10 __ LDA #$10
1f43 : 8d fa bf STA $bffa ; (sstack + 16)
1f46 : a9 04 __ LDA #$04
1f48 : 8d fb bf STA $bffb ; (sstack + 17)
1f4b : a9 2c __ LDA #$2c
1f4d : 8d fc bf STA $bffc ; (sstack + 18)
1f50 : a9 36 __ LDA #$36
1f52 : 8d fd bf STA $bffd ; (sstack + 19)
1f55 : a9 0a __ LDA #$0a
1f57 : 8d fe bf STA $bffe ; (sstack + 20)
1f5a : a9 06 __ LDA #$06
1f5c : 8d ff bf STA $bfff ; (sstack + 21)
1f5f : 20 ee 2f JSR $2fee ; (draw_gear.s1 + 0)
1f62 : ad 09 dc LDA $dc09 
1f65 : d0 03 __ BNE $1f6a ; (gears_run.s16 + 0)
1f67 : 4c 4c 1e JMP $1e4c ; (gears_run.l5 + 0)
.s16:
1f6a : 20 9f 21 JSR $219f ; (tod_reset.s4 + 0)
1f6d : a4 f9 __ LDY $f9 ; (zp_spd + 0)
1f6f : c0 0f __ CPY #$0f
1f71 : b0 13 __ BCS $1f86 ; (gears_run.s17 + 0)
.s18:
1f73 : c8 __ __ INY
1f74 : 84 0d __ STY P0 
1f76 : 84 f9 __ STY $f9 ; (zp_spd + 0)
1f78 : 98 __ __ TYA
1f79 : 20 f3 15 JSR $15f3 ; (turbo_set.s4 + 0)
1f7c : a5 0d __ LDA P0 
1f7e : 20 4e 3e JSR $3e4e ; (engine_update.s4 + 0)
1f81 : a9 01 __ LDA #$01
1f83 : 4c 4a 1e JMP $1e4a ; (gears_run.l20 + 0)
.s17:
1f86 : a9 10 __ LDA #$10
1f88 : 85 f9 __ STA $f9 ; (zp_spd + 0)
1f8a : 4c 4c 1e JMP $1e4c ; (gears_run.l5 + 0)
.l7:
1f8d : ad 09 dc LDA $dc09 
1f90 : c9 05 __ CMP #$05
1f92 : 90 11 __ BCC $1fa5 ; (gears_run.l9 + 0)
.s8:
1f94 : a9 00 __ LDA #$00
1f96 : 8d 04 d4 STA $d404 
1f99 : 8d 0b d4 STA $d40b 
1f9c : 8d 18 d4 STA $d418 
.s3:
1f9f : ad ad bf LDA $bfad ; (gears_run@stack + 0)
1fa2 : 85 53 __ STA T0 + 0 
1fa4 : 60 __ __ RTS
.l9:
1fa5 : 2c 11 d0 BIT $d011 
1fa8 : 30 fb __ BMI $1fa5 ; (gears_run.l9 + 0)
.l10:
1faa : 2c 11 d0 BIT $d011 
1fad : 10 fb __ BPL $1faa ; (gears_run.l10 + 0)
.s11:
1faf : a9 d0 __ LDA #$d0
1fb1 : 8d f7 bf STA $bff7 ; (sstack + 13)
1fb4 : a9 00 __ LDA #$00
1fb6 : 8d f8 bf STA $bff8 ; (sstack + 14)
1fb9 : a5 f8 __ LDA $f8 ; (zp_angle2 + 0)
1fbb : 8d f9 bf STA $bff9 ; (sstack + 15)
1fbe : a9 08 __ LDA #$08
1fc0 : 8d fa bf STA $bffa ; (sstack + 16)
1fc3 : 8d fb bf STA $bffb ; (sstack + 17)
1fc6 : 8d fe bf STA $bffe ; (sstack + 20)
1fc9 : a9 1c __ LDA #$1c
1fcb : 8d fc bf STA $bffc ; (sstack + 18)
1fce : a9 28 __ LDA #$28
1fd0 : 8d fd bf STA $bffd ; (sstack + 19)
1fd3 : a9 04 __ LDA #$04
1fd5 : 8d ff bf STA $bfff ; (sstack + 21)
1fd8 : 20 ee 2f JSR $2fee ; (draw_gear.s1 + 0)
1fdb : a9 78 __ LDA #$78
1fdd : 8d f7 bf STA $bff7 ; (sstack + 13)
1fe0 : a9 00 __ LDA #$00
1fe2 : 8d f8 bf STA $bff8 ; (sstack + 14)
1fe5 : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
1fe7 : 8d f9 bf STA $bff9 ; (sstack + 15)
1fea : a9 10 __ LDA #$10
1fec : 8d fa bf STA $bffa ; (sstack + 16)
1fef : a9 04 __ LDA #$04
1ff1 : 8d fb bf STA $bffb ; (sstack + 17)
1ff4 : a9 2c __ LDA #$2c
1ff6 : 8d fc bf STA $bffc ; (sstack + 18)
1ff9 : a9 36 __ LDA #$36
1ffb : 8d fd bf STA $bffd ; (sstack + 19)
1ffe : a9 0a __ LDA #$0a
2000 : 8d fe bf STA $bffe ; (sstack + 20)
2003 : a9 06 __ LDA #$06
2005 : 8d ff bf STA $bfff ; (sstack + 21)
2008 : 20 ee 2f JSR $2fee ; (draw_gear.s1 + 0)
200b : 78 __ __ SEI
200c : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
200e : 18 __ __ CLC
200f : 69 01 __ ADC #$01
2011 : 29 3f __ AND #$3f
2013 : 85 f7 __ STA $f7 ; (zp_angle1 + 0)
2015 : a5 f8 __ LDA $f8 ; (zp_angle2 + 0)
2017 : 38 __ __ SEC
2018 : e9 02 __ SBC #$02
201a : 29 3f __ AND #$3f
201c : 85 53 __ STA T0 + 0 
201e : 85 f8 __ STA $f8 ; (zp_angle2 + 0)
2020 : 58 __ __ CLI
2021 : a9 d0 __ LDA #$d0
2023 : 8d f7 bf STA $bff7 ; (sstack + 13)
2026 : a9 00 __ LDA #$00
2028 : 8d f8 bf STA $bff8 ; (sstack + 14)
202b : a5 53 __ LDA T0 + 0 
202d : 8d f9 bf STA $bff9 ; (sstack + 15)
2030 : a9 08 __ LDA #$08
2032 : 8d fa bf STA $bffa ; (sstack + 16)
2035 : 8d fb bf STA $bffb ; (sstack + 17)
2038 : 8d fe bf STA $bffe ; (sstack + 20)
203b : a9 1c __ LDA #$1c
203d : 8d fc bf STA $bffc ; (sstack + 18)
2040 : a9 28 __ LDA #$28
2042 : 8d fd bf STA $bffd ; (sstack + 19)
2045 : a9 04 __ LDA #$04
2047 : 8d ff bf STA $bfff ; (sstack + 21)
204a : 20 ee 2f JSR $2fee ; (draw_gear.s1 + 0)
204d : a9 78 __ LDA #$78
204f : 8d f7 bf STA $bff7 ; (sstack + 13)
2052 : a9 00 __ LDA #$00
2054 : 8d f8 bf STA $bff8 ; (sstack + 14)
2057 : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
2059 : 8d f9 bf STA $bff9 ; (sstack + 15)
205c : a9 10 __ LDA #$10
205e : 8d fa bf STA $bffa ; (sstack + 16)
2061 : a9 04 __ LDA #$04
2063 : 8d fb bf STA $bffb ; (sstack + 17)
2066 : a9 2c __ LDA #$2c
2068 : 8d fc bf STA $bffc ; (sstack + 18)
206b : a9 36 __ LDA #$36
206d : 8d fd bf STA $bffd ; (sstack + 19)
2070 : a9 0a __ LDA #$0a
2072 : 8d fe bf STA $bffe ; (sstack + 20)
2075 : a9 06 __ LDA #$06
2077 : 8d ff bf STA $bfff ; (sstack + 21)
207a : 20 ee 2f JSR $2fee ; (draw_gear.s1 + 0)
207d : 4c 8d 1f JMP $1f8d ; (gears_run.l7 + 0)
--------------------------------------------------------------------
hires_init: ; hires_init()->void
; 246, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s4:
2080 : 78 __ __ SEI
2081 : a9 00 __ LDA #$00
2083 : 85 0f __ STA P2 
2085 : 85 10 __ STA P3 
2087 : a9 30 __ LDA #$30
2089 : 85 01 __ STA $01 
208b : a9 40 __ LDA #$40
208d : 85 11 __ STA P4 
208f : a9 1f __ LDA #$1f
2091 : 85 12 __ STA P5 
2093 : a9 10 __ LDA #$10
2095 : a2 fa __ LDX #$fa
.l6:
2097 : ca __ __ DEX
2098 : 9d 00 d0 STA $d000,x 
209b : 9d fa d0 STA $d0fa,x 
209e : 9d f4 d1 STA $d1f4,x 
20a1 : 9d ee d2 STA $d2ee,x 
20a4 : d0 f1 __ BNE $2097 ; (hires_init.l6 + 0)
.s5:
20a6 : a9 00 __ LDA #$00
20a8 : 85 43 __ STA T1 + 0 
20aa : 85 0d __ STA P0 
20ac : a9 e0 __ LDA #$e0
20ae : 85 44 __ STA T1 + 1 
20b0 : 85 0e __ STA P1 
20b2 : 20 f2 20 JSR $20f2 ; (memset.s4 + 0)
20b5 : a9 35 __ LDA #$35
20b7 : 85 01 __ STA $01 
20b9 : 20 0e 21 JSR $210e ; (mmap_trampoline.s4 + 0)
20bc : 58 __ __ CLI
20bd : 20 ba 78 JSR $78ba ; (vic_setmode@proxy + 0)
20c0 : a5 10 __ LDA P3 
20c2 : 8d e0 82 STA $82e0 ; (Screen.data + 0)
20c5 : a5 11 __ LDA P4 
20c7 : 8d e1 82 STA $82e1 ; (Screen.data + 1)
20ca : a9 28 __ LDA #$28
20cc : 8d e4 82 STA $82e4 ; (Screen.cwidth + 0)
20cf : a9 19 __ LDA #$19
20d1 : 8d e5 82 STA $82e5 ; (Screen.cheight + 0)
20d4 : a9 40 __ LDA #$40
20d6 : 8d e6 82 STA $82e6 ; (Screen.width + 0)
20d9 : a9 01 __ LDA #$01
20db : 8d e7 82 STA $82e7 ; (Screen.width + 1)
20de : a9 00 __ LDA #$00
20e0 : 8d 20 d0 STA $d020 
20e3 : 8d e2 82 STA $82e2 ; (Screen.rdata + 0)
20e6 : 8d e3 82 STA $82e3 ; (Screen.rdata + 1)
.s3:
20e9 : 60 __ __ RTS
--------------------------------------------------------------------
memset@proxy: ; memset@proxy
20ea : a9 60 __ LDA #$60
20ec : 85 0d __ STA P0 
20ee : a9 f8 __ LDA #$f8
20f0 : 85 0e __ STA P1 
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void
;  28, "/home/xahmol/oscar64/include/string.h"
.s4:
20f2 : a5 0f __ LDA P2 
20f4 : a6 12 __ LDX P5 
20f6 : f0 0c __ BEQ $2104 ; (memset.s4 + 18)
20f8 : a0 00 __ LDY #$00
20fa : 91 0d __ STA (P0),y 
20fc : c8 __ __ INY
20fd : d0 fb __ BNE $20fa ; (memset.s4 + 8)
20ff : e6 0e __ INC P1 
2101 : ca __ __ DEX
2102 : d0 f6 __ BNE $20fa ; (memset.s4 + 8)
2104 : a4 11 __ LDY P4 
2106 : f0 05 __ BEQ $210d ; (memset.s3 + 0)
2108 : 88 __ __ DEY
2109 : 91 0d __ STA (P0),y 
210b : d0 fb __ BNE $2108 ; (memset.s4 + 22)
.s3:
210d : 60 __ __ RTS
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/xahmol/oscar64/include/c64/memmap.h"
.s4:
210e : a9 23 __ LDA #$23
2110 : 8d fa ff STA $fffa 
2113 : a9 21 __ LDA #$21
2115 : 8d fb ff STA $fffb 
2118 : a9 41 __ LDA #$41
211a : 8d fe ff STA $fffe 
211d : a9 21 __ LDA #$21
211f : 8d ff ff STA $ffff 
.s3:
2122 : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
2123 : 48 __ __ PHA
2124 : 8a __ __ TXA
2125 : 48 __ __ PHA
2126 : a9 21 __ LDA #$21
2128 : 48 __ __ PHA
2129 : a9 3a __ LDA #$3a
212b : 48 __ __ PHA
212c : ba __ __ TSX
212d : bd 05 01 LDA $0105,x 
2130 : 48 __ __ PHA
2131 : a6 01 __ LDX $01 
2133 : a9 36 __ LDA #$36
2135 : 85 01 __ STA $01 
2137 : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
213a : 86 01 __ STX $01 
213c : 68 __ __ PLA
213d : aa __ __ TAX
213e : 68 __ __ PLA
213f : 40 __ __ RTI
2140 : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
2141 : 48 __ __ PHA
2142 : 8a __ __ TXA
2143 : 48 __ __ PHA
2144 : a9 21 __ LDA #$21
2146 : 48 __ __ PHA
2147 : a9 3a __ LDA #$3a
2149 : 48 __ __ PHA
214a : ba __ __ TSX
214b : bd 05 01 LDA $0105,x 
214e : 48 __ __ PHA
214f : a6 01 __ LDX $01 
2151 : a9 36 __ LDA #$36
2153 : 85 01 __ STA $01 
2155 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
engine_init: ; engine_init()->void
; 337, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s4:
2158 : a9 00 __ LDA #$00
215a : 8d 15 d4 STA $d415 
215d : a9 18 __ LDA #$18
215f : 8d 16 d4 STA $d416 
2162 : a9 83 __ LDA #$83
2164 : 8d 17 d4 STA $d417 
2167 : a9 1f __ LDA #$1f
2169 : 8d 18 d4 STA $d418 
216c : a9 05 __ LDA #$05
216e : 8d 05 d4 STA $d405 
2171 : a9 f3 __ LDA #$f3
2173 : 8d 06 d4 STA $d406 
2176 : a9 a9 __ LDA #$a9
2178 : 8d 00 d4 STA $d400 
217b : a9 02 __ LDA #$02
217d : 8d 01 d4 STA $d401 
2180 : a9 21 __ LDA #$21
2182 : 8d 04 d4 STA $d404 
2185 : a9 05 __ LDA #$05
2187 : 8d 0c d4 STA $d40c 
218a : a9 f3 __ LDA #$f3
218c : 8d 0d d4 STA $d40d 
218f : a9 52 __ LDA #$52
2191 : 8d 07 d4 STA $d407 
2194 : a9 05 __ LDA #$05
2196 : 8d 08 d4 STA $d408 
2199 : a9 81 __ LDA #$81
219b : 8d 0b d4 STA $d40b 
.s3:
219e : 60 __ __ RTS
--------------------------------------------------------------------
tod_reset: ; tod_reset()->void
; 277, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s4:
219f : 78 __ __ SEI
21a0 : a9 00 __ LDA #$00
21a2 : 8d 09 dc STA $dc09 
21a5 : 8d 08 dc STA $dc08 
21a8 : 58 __ __ CLI
.s3:
21a9 : 60 __ __ RTS
--------------------------------------------------------------------
draw_speed: ; draw_speed(u8)->void
; 194, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s1:
21aa : a2 05 __ LDX #$05
21ac : b5 53 __ LDA T1 + 0,x 
21ae : 9d c3 bf STA $bfc3,x ; (draw_speed@stack + 0)
21b1 : ca __ __ DEX
21b2 : 10 f8 __ BPL $21ac ; (draw_speed.s1 + 2)
.s4:
21b4 : ad f3 bf LDA $bff3 ; (sstack + 9)
21b7 : 0a __ __ ASL
21b8 : aa __ __ TAX
21b9 : bd 63 79 LDA $7963,x ; (speed_nums[0] + 0)
21bc : 85 53 __ STA T1 + 0 
21be : 85 0d __ STA P0 
21c0 : bd 64 79 LDA $7964,x ; (speed_nums[0] + 1)
21c3 : 85 54 __ STA T1 + 1 
21c5 : 85 0e __ STA P1 
21c7 : 20 47 10 JSR $1047 ; (strlen.s4 + 0)
21ca : a5 1b __ LDA ACCU + 0 
21cc : 0a __ __ ASL
21cd : a2 00 __ LDX #$00
21cf : 90 02 __ BCC $21d3 ; (draw_speed.s9 + 0)
.s8:
21d1 : e8 __ __ INX
21d2 : 18 __ __ CLC
.s9:
21d3 : 65 1b __ ADC ACCU + 0 
21d5 : 85 43 __ STA T0 + 0 
21d7 : 8a __ __ TXA
21d8 : 69 00 __ ADC #$00
21da : 06 43 __ ASL T0 + 0 
21dc : 2a __ __ ROL
21dd : 06 43 __ ASL T0 + 0 
21df : 2a __ __ ROL
21e0 : aa __ __ TAX
21e1 : 18 __ __ CLC
21e2 : a5 43 __ LDA T0 + 0 
21e4 : 69 28 __ ADC #$28
21e6 : 85 43 __ STA T0 + 0 
21e8 : 90 01 __ BCC $21eb ; (draw_speed.s11 + 0)
.s10:
21ea : e8 __ __ INX
.s11:
21eb : 86 44 __ STX T0 + 1 
21ed : 38 __ __ SEC
21ee : a9 40 __ LDA #$40
21f0 : e5 43 __ SBC T0 + 0 
21f2 : a8 __ __ TAY
21f3 : a9 01 __ LDA #$01
21f5 : e5 44 __ SBC T0 + 1 
21f7 : aa __ __ TAX
21f8 : 0a __ __ ASL
21f9 : 98 __ __ TYA
21fa : 69 00 __ ADC #$00
21fc : 85 56 __ STA T3 + 0 
21fe : 8a __ __ TXA
21ff : 69 00 __ ADC #$00
2201 : c9 80 __ CMP #$80
2203 : 6a __ __ ROR
2204 : 66 56 __ ROR T3 + 0 
2206 : 85 57 __ STA T3 + 1 
2208 : a5 1b __ LDA ACCU + 0 
220a : f0 30 __ BEQ $223c ; (draw_speed.s5 + 0)
.s6:
220c : 85 55 __ STA T2 + 0 
220e : a9 00 __ LDA #$00
2210 : 85 58 __ STA T4 + 0 
.l7:
2212 : a5 56 __ LDA T3 + 0 
2214 : 8d f0 bf STA $bff0 ; (sstack + 6)
2217 : a5 57 __ LDA T3 + 1 
2219 : 8d f1 bf STA $bff1 ; (sstack + 7)
221c : a4 58 __ LDY T4 + 0 
221e : b1 53 __ LDA (T1 + 0),y 
2220 : 38 __ __ SEC
2221 : e9 30 __ SBC #$30
2223 : 8d f2 bf STA $bff2 ; (sstack + 8)
2226 : 20 be 22 JSR $22be ; (draw_glyph.s1 + 0)
2229 : 18 __ __ CLC
222a : a5 56 __ LDA T3 + 0 
222c : 69 0c __ ADC #$0c
222e : 85 56 __ STA T3 + 0 
2230 : 90 02 __ BCC $2234 ; (draw_speed.s13 + 0)
.s12:
2232 : e6 57 __ INC T3 + 1 
.s13:
2234 : e6 58 __ INC T4 + 0 
2236 : a5 58 __ LDA T4 + 0 
2238 : c5 55 __ CMP T2 + 0 
223a : 90 d6 __ BCC $2212 ; (draw_speed.l7 + 0)
.s5:
223c : a9 0a __ LDA #$0a
223e : 8d f2 bf STA $bff2 ; (sstack + 8)
2241 : 18 __ __ CLC
2242 : a5 56 __ LDA T3 + 0 
2244 : 69 06 __ ADC #$06
2246 : 85 56 __ STA T3 + 0 
2248 : 8d f0 bf STA $bff0 ; (sstack + 6)
224b : a5 57 __ LDA T3 + 1 
224d : 69 00 __ ADC #$00
224f : 85 57 __ STA T3 + 1 
2251 : 8d f1 bf STA $bff1 ; (sstack + 7)
2254 : 20 be 22 JSR $22be ; (draw_glyph.s1 + 0)
2257 : a9 0b __ LDA #$0b
2259 : 8d f2 bf STA $bff2 ; (sstack + 8)
225c : 18 __ __ CLC
225d : a5 56 __ LDA T3 + 0 
225f : 69 0c __ ADC #$0c
2261 : 85 56 __ STA T3 + 0 
2263 : 8d f0 bf STA $bff0 ; (sstack + 6)
2266 : a5 57 __ LDA T3 + 1 
2268 : 69 00 __ ADC #$00
226a : 85 57 __ STA T3 + 1 
226c : 8d f1 bf STA $bff1 ; (sstack + 7)
226f : 20 be 22 JSR $22be ; (draw_glyph.s1 + 0)
2272 : a9 0c __ LDA #$0c
2274 : 8d f2 bf STA $bff2 ; (sstack + 8)
2277 : 18 __ __ CLC
2278 : a5 56 __ LDA T3 + 0 
227a : 69 0c __ ADC #$0c
227c : 8d f0 bf STA $bff0 ; (sstack + 6)
227f : a5 57 __ LDA T3 + 1 
2281 : 69 00 __ ADC #$00
2283 : 8d f1 bf STA $bff1 ; (sstack + 7)
2286 : 20 be 22 JSR $22be ; (draw_glyph.s1 + 0)
.s3:
2289 : a2 05 __ LDX #$05
228b : bd c3 bf LDA $bfc3,x ; (draw_speed@stack + 0)
228e : 95 53 __ STA T1 + 0,x 
2290 : ca __ __ DEX
2291 : 10 f8 __ BPL $228b ; (draw_speed.s3 + 2)
2293 : 60 __ __ RTS
--------------------------------------------------------------------
2294 : __ __ __ BYT 31 00                                           : 1.
--------------------------------------------------------------------
2296 : __ __ __ BYT 32 00                                           : 2.
--------------------------------------------------------------------
2298 : __ __ __ BYT 33 00                                           : 3.
--------------------------------------------------------------------
229a : __ __ __ BYT 34 00                                           : 4.
--------------------------------------------------------------------
229c : __ __ __ BYT 36 00                                           : 6.
--------------------------------------------------------------------
229e : __ __ __ BYT 38 00                                           : 8.
--------------------------------------------------------------------
22a0 : __ __ __ BYT 31 32 00                                        : 12.
--------------------------------------------------------------------
22a3 : __ __ __ BYT 31 36 00                                        : 16.
--------------------------------------------------------------------
22a6 : __ __ __ BYT 32 30 00                                        : 20.
--------------------------------------------------------------------
22a9 : __ __ __ BYT 32 34 00                                        : 24.
--------------------------------------------------------------------
22ac : __ __ __ BYT 32 38 00                                        : 28.
--------------------------------------------------------------------
22af : __ __ __ BYT 33 32 00                                        : 32.
--------------------------------------------------------------------
22b2 : __ __ __ BYT 33 36 00                                        : 36.
--------------------------------------------------------------------
22b5 : __ __ __ BYT 34 30 00                                        : 40.
--------------------------------------------------------------------
22b8 : __ __ __ BYT 34 38 00                                        : 48.
--------------------------------------------------------------------
22bb : __ __ __ BYT 36 34 00                                        : 64.
--------------------------------------------------------------------
draw_glyph: ; draw_glyph(i16,i16,u8)->void
; 176, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s1:
22be : a2 04 __ LDX #$04
22c0 : b5 53 __ LDA T2 + 0,x 
22c2 : 9d ca bf STA $bfca,x ; (draw_glyph@stack + 0)
22c5 : ca __ __ DEX
22c6 : 10 f8 __ BPL $22c0 ; (draw_glyph.s1 + 2)
.s4:
22c8 : ae f2 bf LDX $bff2 ; (sstack + 8)
22cb : bd c0 77 LDA $77c0,x ; (__multab7L + 0)
22ce : 18 __ __ CLC
22cf : 69 83 __ ADC #$83
22d1 : 85 53 __ STA T2 + 0 
22d3 : a9 79 __ LDA #$79
22d5 : 69 00 __ ADC #$00
22d7 : 85 54 __ STA T2 + 1 
22d9 : a9 82 __ LDA #$82
22db : 85 15 __ STA P8 
22dd : a9 e0 __ LDA #$e0
22df : 85 14 __ STA P7 
22e1 : a9 44 __ LDA #$44
22e3 : 85 18 __ STA P11 
22e5 : a9 00 __ LDA #$00
22e7 : 85 13 __ STA P6 
22e9 : 85 57 __ STA T6 + 0 
22eb : 18 __ __ CLC
.l5:
22ec : 69 57 __ ADC #$57
22ee : 0a __ __ ASL
22ef : 85 55 __ STA T4 + 0 
22f1 : a2 00 __ LDX #$00
22f3 : 86 56 __ STX T5 + 0 
.l6:
22f5 : bd 76 83 LDA $8376,x ; (bitshift[0] + 32)
22f8 : a4 57 __ LDY T6 + 0 
22fa : 31 53 __ AND (T2 + 0),y 
22fc : f0 30 __ BEQ $232e ; (draw_glyph.s7 + 0)
.s9:
22fe : a5 55 __ LDA T4 + 0 
2300 : 85 12 __ STA P5 
2302 : 8d ea bf STA $bfea ; (sstack + 0)
2305 : a9 00 __ LDA #$00
2307 : 8d eb bf STA $bfeb ; (sstack + 1)
230a : 8d ed bf STA $bfed ; (sstack + 3)
230d : 8d ef bf STA $bfef ; (sstack + 5)
2310 : a9 02 __ LDA #$02
2312 : 8d ec bf STA $bfec ; (sstack + 2)
2315 : 8d ee bf STA $bfee ; (sstack + 4)
2318 : 8a __ __ TXA
2319 : 0a __ __ ASL
231a : 18 __ __ CLC
231b : 6d f0 bf ADC $bff0 ; (sstack + 6)
231e : 85 10 __ STA P3 
2320 : 85 16 __ STA P9 
2322 : ad f1 bf LDA $bff1 ; (sstack + 7)
2325 : 69 00 __ ADC #$00
2327 : 85 11 __ STA P4 
2329 : 85 17 __ STA P10 
232b : 20 49 23 JSR $2349 ; (bmu_bitblit.s1 + 0)
.s7:
232e : e6 56 __ INC T5 + 0 
2330 : a6 56 __ LDX T5 + 0 
2332 : e0 05 __ CPX #$05
2334 : d0 bf __ BNE $22f5 ; (draw_glyph.l6 + 0)
.s8:
2336 : e6 57 __ INC T6 + 0 
2338 : a5 57 __ LDA T6 + 0 
233a : c9 07 __ CMP #$07
233c : 90 ae __ BCC $22ec ; (draw_glyph.l5 + 0)
.s3:
233e : a2 04 __ LDX #$04
2340 : bd ca bf LDA $bfca,x ; (draw_glyph@stack + 0)
2343 : 95 53 __ STA T2 + 0,x 
2345 : ca __ __ DEX
2346 : 10 f8 __ BPL $2340 ; (draw_glyph.s3 + 2)
2348 : 60 __ __ RTS
--------------------------------------------------------------------
bmu_bitblit: ; bmu_bitblit(const struct Bitmap*,i16,i16,const struct Bitmap*,i16,i16,i16,i16,const u8*,enum BlitOp)->void
; 119, "/home/xahmol/oscar64/include/gfx/bitmap.h"
.s1:
2349 : a2 0c __ LDX #$0c
234b : b5 53 __ LDA T11 + 0,x 
234d : 9d d3 bf STA $bfd3,x ; (bmu_bitblit@stack + 0)
2350 : ca __ __ DEX
2351 : 10 f8 __ BPL $234b ; (bmu_bitblit.s1 + 2)
.s4:
2353 : a5 10 __ LDA P3 ; (dx + 0)
2355 : 85 47 __ STA T2 + 0 
2357 : 18 __ __ CLC
2358 : 6d ec bf ADC $bfec ; (sstack + 2)
235b : 85 45 __ STA T1 + 0 
235d : 29 07 __ AND #$07
235f : aa __ __ TAX
2360 : bd e6 79 LDA $79e6,x ; (rmask[0] + 0)
2363 : 85 56 __ STA T14 + 0 
2365 : ad ed bf LDA $bfed ; (sstack + 3)
2368 : 65 11 __ ADC P4 ; (dx + 1)
236a : 4a __ __ LSR
236b : 66 45 __ ROR T1 + 0 
236d : 4a __ __ LSR
236e : 66 45 __ ROR T1 + 0 
2370 : 4a __ __ LSR
2371 : 66 45 __ ROR T1 + 0 
2373 : a5 11 __ LDA P4 ; (dx + 1)
2375 : 4a __ __ LSR
2376 : 66 47 __ ROR T2 + 0 
2378 : 4a __ __ LSR
2379 : 66 47 __ ROR T2 + 0 
237b : 4a __ __ LSR
237c : 66 47 __ ROR T2 + 0 
237e : 38 __ __ SEC
237f : a5 45 __ LDA T1 + 0 
2381 : e5 47 __ SBC T2 + 0 
2383 : 85 4d __ STA T6 + 0 
2385 : a5 10 __ LDA P3 ; (dx + 0)
2387 : 29 07 __ AND #$07
2389 : 85 45 __ STA T1 + 0 
238b : aa __ __ TAX
238c : bd de 79 LDA $79de,x ; (lmask[0] + 0)
238f : 85 52 __ STA T12 + 0 
2391 : 85 55 __ STA T13 + 0 
2393 : ad ee bf LDA $bfee ; (sstack + 4)
2396 : 85 4e __ STA T8 + 0 
2398 : a5 14 __ LDA P7 ; (sbm + 0)
239a : 85 4f __ STA T9 + 0 
239c : a6 15 __ LDX P8 ; (sbm + 1)
239e : 86 50 __ STX T9 + 1 
23a0 : c9 e0 __ CMP #$e0
23a2 : d0 4d __ BNE $23f1 ; (bmu_bitblit.s111 + 0)
.s88:
23a4 : e0 82 __ CPX #$82
23a6 : d0 49 __ BNE $23f1 ; (bmu_bitblit.s111 + 0)
.s72:
23a8 : a9 e0 __ LDA #$e0
23aa : 85 4f __ STA T9 + 0 
23ac : a9 82 __ LDA #$82
23ae : 85 50 __ STA T9 + 1 
23b0 : ad eb bf LDA $bfeb ; (sstack + 1)
23b3 : c5 13 __ CMP P6 ; (dy + 1)
23b5 : d0 09 __ BNE $23c0 ; (bmu_bitblit.s87 + 0)
.s84:
23b7 : ad ea bf LDA $bfea ; (sstack + 0)
23ba : c5 12 __ CMP P5 ; (dy + 0)
.s85:
23bc : b0 08 __ BCS $23c6 ; (bmu_bitblit.s73 + 0)
23be : 90 28 __ BCC $23e8 ; (bmu_bitblit.s75 + 0)
.s87:
23c0 : 45 13 __ EOR P6 ; (dy + 1)
23c2 : 10 f8 __ BPL $23bc ; (bmu_bitblit.s85 + 0)
.s86:
23c4 : b0 22 __ BCS $23e8 ; (bmu_bitblit.s75 + 0)
.s73:
23c6 : a5 13 __ LDA P6 ; (dy + 1)
23c8 : cd eb bf CMP $bfeb ; (sstack + 1)
23cb : d0 24 __ BNE $23f1 ; (bmu_bitblit.s111 + 0)
.s83:
23cd : a5 12 __ LDA P5 ; (dy + 0)
23cf : cd ea bf CMP $bfea ; (sstack + 0)
23d2 : d0 1f __ BNE $23f3 ; (bmu_bitblit.s5 + 0)
.s74:
23d4 : a5 17 __ LDA P10 ; (sx + 1)
23d6 : c5 11 __ CMP P4 ; (dx + 1)
23d8 : d0 08 __ BNE $23e2 ; (bmu_bitblit.s82 + 0)
.s79:
23da : a5 16 __ LDA P9 ; (sx + 0)
23dc : c5 10 __ CMP P3 ; (dx + 0)
.s80:
23de : 90 08 __ BCC $23e8 ; (bmu_bitblit.s75 + 0)
23e0 : b0 0f __ BCS $23f1 ; (bmu_bitblit.s111 + 0)
.s82:
23e2 : 45 11 __ EOR P4 ; (dx + 1)
23e4 : 10 f8 __ BPL $23de ; (bmu_bitblit.s80 + 0)
.s81:
23e6 : 90 09 __ BCC $23f1 ; (bmu_bitblit.s111 + 0)
.s75:
23e8 : a5 18 __ LDA P11 ; (op + 0)
23ea : 29 08 __ AND #$08
23ec : f0 03 __ BEQ $23f1 ; (bmu_bitblit.s111 + 0)
23ee : 4c d7 28 JMP $28d7 ; (bmu_bitblit.s76 + 0)
.s111:
23f1 : a5 12 __ LDA P5 ; (dy + 0)
.s5:
23f3 : 29 f8 __ AND #$f8
23f5 : 85 1b __ STA ACCU + 0 ; (w + 0)
23f7 : a5 13 __ LDA P6 ; (dy + 1)
23f9 : 85 1c __ STA ACCU + 1 ; (w + 1)
23fb : ad e4 82 LDA $82e4 ; (Screen.cwidth + 0)
23fe : 85 51 __ STA T10 + 0 
2400 : 20 92 73 JSR $7392 ; (mul16by8 + 0)
2403 : ad e0 82 LDA $82e0 ; (Screen.data + 0)
2406 : 18 __ __ CLC
2407 : 65 1b __ ADC ACCU + 0 ; (w + 0)
2409 : 85 4a __ STA T4 + 0 
240b : ad e1 82 LDA $82e1 ; (Screen.data + 1)
240e : 65 1c __ ADC ACCU + 1 ; (w + 1)
2410 : aa __ __ TAX
2411 : a5 10 __ LDA P3 ; (dx + 0)
2413 : 29 f8 __ AND #$f8
2415 : 18 __ __ CLC
2416 : 65 4a __ ADC T4 + 0 
2418 : 85 4a __ STA T4 + 0 
241a : 8a __ __ TXA
241b : 65 11 __ ADC P4 ; (dx + 1)
241d : aa __ __ TAX
241e : a5 12 __ LDA P5 ; (dy + 0)
2420 : 29 07 __ AND #$07
2422 : 18 __ __ CLC
2423 : 65 4a __ ADC T4 + 0 
2425 : 85 53 __ STA T11 + 0 
2427 : 90 01 __ BCC $242a ; (bmu_bitblit.s94 + 0)
.s93:
2429 : e8 __ __ INX
.s94:
242a : 86 54 __ STX T11 + 1 
242c : ad eb bf LDA $bfeb ; (sstack + 1)
242f : 85 1c __ STA ACCU + 1 ; (w + 1)
2431 : ad ea bf LDA $bfea ; (sstack + 0)
2434 : 29 f8 __ AND #$f8
2436 : 85 1b __ STA ACCU + 0 ; (w + 0)
2438 : a0 04 __ LDY #$04
243a : b1 4f __ LDA (T9 + 0),y 
243c : 20 92 73 JSR $7392 ; (mul16by8 + 0)
243f : a0 00 __ LDY #$00
2441 : 84 57 __ STY T16 + 0 
2443 : b1 4f __ LDA (T9 + 0),y 
2445 : 18 __ __ CLC
2446 : 65 1b __ ADC ACCU + 0 ; (w + 0)
2448 : 85 49 __ STA T3 + 0 
244a : c8 __ __ INY
244b : b1 4f __ LDA (T9 + 0),y 
244d : 65 1c __ ADC ACCU + 1 ; (w + 1)
244f : aa __ __ TAX
2450 : a5 16 __ LDA P9 ; (sx + 0)
2452 : 29 f8 __ AND #$f8
2454 : 18 __ __ CLC
2455 : 65 49 __ ADC T3 + 0 
2457 : 85 49 __ STA T3 + 0 
2459 : 8a __ __ TXA
245a : 65 17 __ ADC P10 ; (sx + 1)
245c : aa __ __ TAX
245d : ad ea bf LDA $bfea ; (sstack + 0)
2460 : 29 07 __ AND #$07
2462 : 18 __ __ CLC
2463 : 65 49 __ ADC T3 + 0 
2465 : 85 4a __ STA T4 + 0 
2467 : 90 01 __ BCC $246a ; (bmu_bitblit.s96 + 0)
.s95:
2469 : e8 __ __ INX
.s96:
246a : 86 4b __ STX T4 + 1 
246c : a5 16 __ LDA P9 ; (sx + 0)
246e : 29 07 __ AND #$07
2470 : 49 ff __ EOR #$ff
2472 : 38 __ __ SEC
2473 : 65 45 __ ADC T1 + 0 
2475 : 85 43 __ STA T0 + 0 
2477 : f0 0d __ BEQ $2486 ; (bmu_bitblit.s6 + 0)
.s70:
2479 : 30 0b __ BMI $2486 ; (bmu_bitblit.s6 + 0)
.s71:
247b : 18 __ __ CLC
247c : a5 4a __ LDA T4 + 0 
247e : 69 f8 __ ADC #$f8
2480 : 85 4a __ STA T4 + 0 
2482 : b0 02 __ BCS $2486 ; (bmu_bitblit.s6 + 0)
.s105:
2484 : c6 4b __ DEC T4 + 1 
.s6:
2486 : a9 18 __ LDA #$18
2488 : 85 58 __ STA T17 + 0 
248a : a9 61 __ LDA #$61
248c : 85 59 __ STA T18 + 0 
248e : a9 90 __ LDA #$90
2490 : 85 5a __ STA T19 + 0 
2492 : a9 e2 __ LDA #$e2
2494 : 85 5b __ STA T20 + 0 
2496 : a9 00 __ LDA #$00
2498 : 85 5c __ STA T21 + 0 
249a : a9 08 __ LDA #$08
.s7:
249c : 85 5d __ STA T22 + 0 
249e : a5 18 __ LDA P11 ; (op + 0)
24a0 : 29 08 __ AND #$08
24a2 : 85 4c __ STA T5 + 0 
24a4 : a5 18 __ LDA P11 ; (op + 0)
24a6 : 29 10 __ AND #$10
24a8 : 85 52 __ STA T12 + 0 
24aa : a5 55 __ LDA T13 + 0 
24ac : 85 45 __ STA T1 + 0 
24ae : a5 43 __ LDA T0 + 0 
24b0 : 29 07 __ AND #$07
24b2 : 85 5f __ STA T24 + 0 
24b4 : a5 4d __ LDA T6 + 0 
24b6 : 85 5e __ STA T23 + 0 
24b8 : d0 06 __ BNE $24c0 ; (bmu_bitblit.s9 + 0)
.s8:
24ba : a5 56 __ LDA T14 + 0 
24bc : 25 55 __ AND T13 + 0 
24be : 85 45 __ STA T1 + 0 
.s9:
24c0 : a9 a0 __ LDA #$a0
24c2 : 8d 00 9b STA $9b00 ; (BLIT_CODE[0] + 0)
24c5 : a5 5c __ LDA T21 + 0 
24c7 : 8d 01 9b STA $9b01 ; (BLIT_CODE[0] + 1)
24ca : a9 02 __ LDA #$02
24cc : 85 43 __ STA T0 + 0 
24ce : a6 45 __ LDX T1 + 0 
24d0 : e8 __ __ INX
24d1 : d0 03 __ BNE $24d6 ; (bmu_bitblit.s10 + 0)
24d3 : 4c 71 28 JMP $2871 ; (bmu_bitblit.s66 + 0)
.s10:
24d6 : a5 52 __ LDA T12 + 0 
24d8 : f0 18 __ BEQ $24f2 ; (bmu_bitblit.s11 + 0)
.s65:
24da : a9 b1 __ LDA #$b1
24dc : 8d 02 9b STA $9b02 ; (BLIT_CODE[0] + 2)
24df : a9 05 __ LDA #$05
24e1 : 8d 03 9b STA $9b03 ; (BLIT_CODE[0] + 3)
24e4 : a9 85 __ LDA #$85
24e6 : 8d 04 9b STA $9b04 ; (BLIT_CODE[0] + 4)
24e9 : a9 0a __ LDA #$0a
24eb : 8d 05 9b STA $9b05 ; (BLIT_CODE[0] + 5)
24ee : a9 06 __ LDA #$06
24f0 : 85 43 __ STA T0 + 0 
.s11:
24f2 : a5 4c __ LDA T5 + 0 
24f4 : d0 05 __ BNE $24fb ; (bmu_bitblit.s62 + 0)
.s12:
24f6 : a5 43 __ LDA T0 + 0 
24f8 : 4c 56 25 JMP $2556 ; (bmu_bitblit.s92 + 0)
.s62:
24fb : a5 5f __ LDA T24 + 0 
24fd : d0 05 __ BNE $2504 ; (bmu_bitblit.s64 + 0)
.s63:
24ff : a5 43 __ LDA T0 + 0 
2501 : 4c 51 25 JMP $2551 ; (bmu_bitblit.s91 + 0)
.s64:
2504 : a9 b1 __ LDA #$b1
2506 : a6 43 __ LDX T0 + 0 
2508 : 9d 00 9b STA $9b00,x ; (BLIT_CODE[0] + 0)
250b : a9 03 __ LDA #$03
250d : 9d 01 9b STA $9b01,x ; (BLIT_CODE[0] + 1)
2510 : 9d 06 9b STA $9b06,x ; (BLIT_CODE[0] + 6)
2513 : 9d 0a 9b STA $9b0a,x ; (BLIT_CODE[0] + 10)
2516 : a9 85 __ LDA #$85
2518 : 9d 02 9b STA $9b02,x ; (BLIT_CODE[0] + 2)
251b : 9d 09 9b STA $9b09,x ; (BLIT_CODE[0] + 9)
251e : a9 08 __ LDA #$08
2520 : 9d 03 9b STA $9b03,x ; (BLIT_CODE[0] + 3)
2523 : 9d 08 9b STA $9b08,x ; (BLIT_CODE[0] + 8)
2526 : a9 a5 __ LDA #$a5
2528 : 9d 05 9b STA $9b05,x ; (BLIT_CODE[0] + 5)
252b : a9 02 __ LDA #$02
252d : 9d 0c 9b STA $9b0c,x ; (BLIT_CODE[0] + 12)
2530 : a9 04 __ LDA #$04
2532 : 9d 0e 9b STA $9b0e,x ; (BLIT_CODE[0] + 14)
2535 : a5 58 __ LDA T17 + 0 
2537 : 9d 04 9b STA $9b04,x ; (BLIT_CODE[0] + 4)
253a : a5 59 __ LDA T18 + 0 
253c : 09 08 __ ORA #$08
253e : 9d 07 9b STA $9b07,x ; (BLIT_CODE[0] + 7)
2541 : a5 5a __ LDA T19 + 0 
2543 : 9d 0b 9b STA $9b0b,x ; (BLIT_CODE[0] + 11)
2546 : a5 5b __ LDA T20 + 0 
2548 : 09 04 __ ORA #$04
254a : 9d 0d 9b STA $9b0d,x ; (BLIT_CODE[0] + 13)
254d : 8a __ __ TXA
254e : 18 __ __ CLC
254f : 69 0f __ ADC #$0f
.s91:
2551 : 85 0d __ STA P0 
2553 : 20 bb 29 JSR $29bb ; (builddop_src@proxy + 0)
.s92:
2556 : 85 0d __ STA P0 
2558 : a5 18 __ LDA P11 ; (op + 0)
255a : 85 0e __ STA P1 
255c : a5 45 __ LDA T1 + 0 
255e : 49 ff __ EOR #$ff
2560 : 85 0f __ STA P2 
2562 : 20 fe 2a JSR $2afe ; (builddop_op.s4 + 0)
2565 : 85 43 __ STA T0 + 0 
2567 : a5 4d __ LDA T6 + 0 
2569 : f0 63 __ BEQ $25ce ; (bmu_bitblit.s13 + 0)
.s34:
256b : a9 a0 __ LDA #$a0
256d : a6 43 __ LDX T0 + 0 
256f : e8 __ __ INX
2570 : e8 __ __ INX
2571 : 86 43 __ STX T0 + 0 
2573 : 86 0d __ STX P0 
2575 : 9d fe 9a STA $9afe,x 
2578 : 18 __ __ CLC
2579 : a5 5d __ LDA T22 + 0 
257b : 65 5c __ ADC T21 + 0 
257d : 9d ff 9a STA $9aff,x 
2580 : 85 5c __ STA T21 + 0 
2582 : a5 4d __ LDA T6 + 0 
.s35:
2584 : c9 02 __ CMP #$02
2586 : 90 03 __ BCC $258b ; (bmu_bitblit.s36 + 0)
2588 : 4c 54 27 JMP $2754 ; (bmu_bitblit.s42 + 0)
.s36:
258b : a5 56 __ LDA T14 + 0 
258d : f0 3f __ BEQ $25ce ; (bmu_bitblit.s13 + 0)
.s37:
258f : a5 52 __ LDA T12 + 0 
2591 : f0 1e __ BEQ $25b1 ; (bmu_bitblit.s38 + 0)
.s41:
2593 : a9 b1 __ LDA #$b1
2595 : a6 43 __ LDX T0 + 0 
2597 : 9d 00 9b STA $9b00,x ; (BLIT_CODE[0] + 0)
259a : a9 05 __ LDA #$05
259c : 9d 01 9b STA $9b01,x ; (BLIT_CODE[0] + 1)
259f : a9 85 __ LDA #$85
25a1 : 9d 02 9b STA $9b02,x ; (BLIT_CODE[0] + 2)
25a4 : a9 0a __ LDA #$0a
25a6 : 9d 03 9b STA $9b03,x ; (BLIT_CODE[0] + 3)
25a9 : 8a __ __ TXA
25aa : 18 __ __ CLC
25ab : 69 04 __ ADC #$04
25ad : 85 43 __ STA T0 + 0 
25af : 85 0d __ STA P0 
.s38:
25b1 : a5 4c __ LDA T5 + 0 
25b3 : d0 05 __ BNE $25ba ; (bmu_bitblit.s40 + 0)
.s39:
25b5 : a5 43 __ LDA T0 + 0 
25b7 : 4c bd 25 JMP $25bd ; (bmu_bitblit.s90 + 0)
.s40:
25ba : 20 bb 29 JSR $29bb ; (builddop_src@proxy + 0)
.s90:
25bd : 85 0d __ STA P0 
25bf : a5 18 __ LDA P11 ; (op + 0)
25c1 : 85 0e __ STA P1 
25c3 : a5 56 __ LDA T14 + 0 
25c5 : 49 ff __ EOR #$ff
25c7 : 85 0f __ STA P2 
25c9 : 20 fe 2a JSR $2afe ; (builddop_op.s4 + 0)
25cc : 85 43 __ STA T0 + 0 
.s13:
25ce : a9 60 __ LDA #$60
25d0 : a6 43 __ LDX T0 + 0 
25d2 : 9d 00 9b STA $9b00,x ; (BLIT_CODE[0] + 0)
25d5 : 18 __ __ CLC
25d6 : a5 51 __ LDA T10 + 0 
25d8 : 69 ff __ ADC #$ff
25da : 2a __ __ ROL
25db : 2a __ __ ROL
25dc : 2a __ __ ROL
25dd : aa __ __ TAX
25de : 29 f8 __ AND #$f8
25e0 : 85 43 __ STA T0 + 0 
25e2 : 8a __ __ TXA
25e3 : 29 07 __ AND #$07
25e5 : 2a __ __ ROL
25e6 : 69 f8 __ ADC #$f8
25e8 : 85 44 __ STA T0 + 1 
25ea : a5 4c __ LDA T5 + 0 
25ec : d0 78 __ BNE $2666 ; (bmu_bitblit.s22 + 0)
.s14:
25ee : a5 18 __ LDA P11 ; (op + 0)
25f0 : 29 20 __ AND #$20
25f2 : d0 3d __ BNE $2631 ; (bmu_bitblit.l19 + 0)
.s15:
25f4 : 85 47 __ STA T2 + 0 
.l16:
25f6 : a5 53 __ LDA T11 + 0 
25f8 : 85 05 __ STA WORK + 2 
25fa : 85 03 __ STA WORK + 0 
25fc : a5 54 __ LDA T11 + 1 
25fe : 85 06 __ STA WORK + 3 
2600 : 85 04 __ STA WORK + 1 
2602 : a5 47 __ LDA T2 + 0 
2604 : 85 07 __ STA WORK + 4 
2606 : 20 00 9b JSR $9b00 ; (BLIT_CODE[0] + 0)
2609 : e6 53 __ INC T11 + 0 
260b : d0 02 __ BNE $260f ; (bmu_bitblit.s104 + 0)
.s103:
260d : e6 54 __ INC T11 + 1 
.s104:
260f : a5 53 __ LDA T11 + 0 
2611 : 29 07 __ AND #$07
2613 : d0 0d __ BNE $2622 ; (bmu_bitblit.s17 + 0)
.s18:
2615 : 18 __ __ CLC
2616 : a5 53 __ LDA T11 + 0 
2618 : 65 43 __ ADC T0 + 0 
261a : 85 53 __ STA T11 + 0 
261c : a5 54 __ LDA T11 + 1 
261e : 65 44 __ ADC T0 + 1 
2620 : 85 54 __ STA T11 + 1 
.s17:
2622 : c6 4e __ DEC T8 + 0 
2624 : d0 d0 __ BNE $25f6 ; (bmu_bitblit.l16 + 0)
.s3:
2626 : a2 0c __ LDX #$0c
2628 : bd d3 bf LDA $bfd3,x ; (bmu_bitblit@stack + 0)
262b : 95 53 __ STA T11 + 0,x 
262d : ca __ __ DEX
262e : 10 f8 __ BPL $2628 ; (bmu_bitblit.s3 + 2)
2630 : 60 __ __ RTS
.l19:
2631 : a5 53 __ LDA T11 + 0 
2633 : 85 05 __ STA WORK + 2 
2635 : 85 03 __ STA WORK + 0 
2637 : 29 07 __ AND #$07
2639 : aa __ __ TAX
263a : a5 54 __ LDA T11 + 1 
263c : 85 06 __ STA WORK + 3 
263e : 85 04 __ STA WORK + 1 
2640 : b5 00 __ LDA $00,x 
2642 : 85 07 __ STA WORK + 4 
2644 : 20 00 9b JSR $9b00 ; (BLIT_CODE[0] + 0)
2647 : e6 53 __ INC T11 + 0 
2649 : d0 02 __ BNE $264d ; (bmu_bitblit.s102 + 0)
.s101:
264b : e6 54 __ INC T11 + 1 
.s102:
264d : a5 53 __ LDA T11 + 0 
264f : 29 07 __ AND #$07
2651 : d0 0d __ BNE $2660 ; (bmu_bitblit.s20 + 0)
.s21:
2653 : 18 __ __ CLC
2654 : a5 53 __ LDA T11 + 0 
2656 : 65 43 __ ADC T0 + 0 
2658 : 85 53 __ STA T11 + 0 
265a : a5 54 __ LDA T11 + 1 
265c : 65 44 __ ADC T0 + 1 
265e : 85 54 __ STA T11 + 1 
.s20:
2660 : c6 4e __ DEC T8 + 0 
2662 : d0 cd __ BNE $2631 ; (bmu_bitblit.l19 + 0)
2664 : f0 c0 __ BEQ $2626 ; (bmu_bitblit.s3 + 0)
.s22:
2666 : a5 4a __ LDA T4 + 0 
2668 : 85 45 __ STA T1 + 0 
266a : a5 4b __ LDA T4 + 1 
266c : 85 46 __ STA T1 + 1 
266e : a0 04 __ LDY #$04
2670 : b1 4f __ LDA (T9 + 0),y 
2672 : 18 __ __ CLC
2673 : 69 ff __ ADC #$ff
2675 : 2a __ __ ROL
2676 : 2a __ __ ROL
2677 : 2a __ __ ROL
2678 : aa __ __ TAX
2679 : 29 f8 __ AND #$f8
267b : 85 47 __ STA T2 + 0 
267d : 8a __ __ TXA
267e : 29 07 __ AND #$07
2680 : 2a __ __ ROL
2681 : 69 f8 __ ADC #$f8
2683 : 85 48 __ STA T2 + 1 
2685 : a5 57 __ LDA T16 + 0 
2687 : f0 1d __ BEQ $26a6 ; (bmu_bitblit.l23 + 0)
.s28:
2689 : 38 __ __ SEC
268a : a9 00 __ LDA #$00
268c : e5 43 __ SBC T0 + 0 
268e : 85 43 __ STA T0 + 0 
2690 : a9 00 __ LDA #$00
2692 : e5 44 __ SBC T0 + 1 
2694 : 85 44 __ STA T0 + 1 
2696 : 38 __ __ SEC
2697 : a9 00 __ LDA #$00
2699 : e5 47 __ SBC T2 + 0 
269b : 85 47 __ STA T2 + 0 
269d : a9 00 __ LDA #$00
269f : e5 48 __ SBC T2 + 1 
26a1 : 85 48 __ STA T2 + 1 
26a3 : 4c f9 26 JMP $26f9 ; (bmu_bitblit.l29 + 0)
.l23:
26a6 : a5 4a __ LDA T4 + 0 
26a8 : 85 03 __ STA WORK + 0 
26aa : a5 4b __ LDA T4 + 1 
26ac : 85 04 __ STA WORK + 1 
26ae : a5 54 __ LDA T11 + 1 
26b0 : 85 06 __ STA WORK + 3 
26b2 : a5 53 __ LDA T11 + 0 
26b4 : 85 05 __ STA WORK + 2 
26b6 : 29 07 __ AND #$07
26b8 : a8 __ __ TAY
26b9 : b1 45 __ LDA (T1 + 0),y 
26bb : 85 07 __ STA WORK + 4 
26bd : 20 00 9b JSR $9b00 ; (BLIT_CODE[0] + 0)
26c0 : e6 4a __ INC T4 + 0 
26c2 : d0 02 __ BNE $26c6 ; (bmu_bitblit.s98 + 0)
.s97:
26c4 : e6 4b __ INC T4 + 1 
.s98:
26c6 : a5 4a __ LDA T4 + 0 
26c8 : 29 07 __ AND #$07
26ca : d0 0d __ BNE $26d9 ; (bmu_bitblit.s24 + 0)
.s27:
26cc : 18 __ __ CLC
26cd : a5 4a __ LDA T4 + 0 
26cf : 65 47 __ ADC T2 + 0 
26d1 : 85 4a __ STA T4 + 0 
26d3 : a5 4b __ LDA T4 + 1 
26d5 : 65 48 __ ADC T2 + 1 
26d7 : 85 4b __ STA T4 + 1 
.s24:
26d9 : e6 53 __ INC T11 + 0 
26db : d0 02 __ BNE $26df ; (bmu_bitblit.s100 + 0)
.s99:
26dd : e6 54 __ INC T11 + 1 
.s100:
26df : a5 53 __ LDA T11 + 0 
26e1 : 29 07 __ AND #$07
26e3 : d0 0d __ BNE $26f2 ; (bmu_bitblit.s25 + 0)
.s26:
26e5 : 18 __ __ CLC
26e6 : a5 53 __ LDA T11 + 0 
26e8 : 65 43 __ ADC T0 + 0 
26ea : 85 53 __ STA T11 + 0 
26ec : a5 54 __ LDA T11 + 1 
26ee : 65 44 __ ADC T0 + 1 
26f0 : 85 54 __ STA T11 + 1 
.s25:
26f2 : c6 4e __ DEC T8 + 0 
26f4 : d0 b0 __ BNE $26a6 ; (bmu_bitblit.l23 + 0)
26f6 : 4c 26 26 JMP $2626 ; (bmu_bitblit.s3 + 0)
.l29:
26f9 : a5 4a __ LDA T4 + 0 
26fb : 29 07 __ AND #$07
26fd : d0 0d __ BNE $270c ; (bmu_bitblit.s30 + 0)
.s33:
26ff : 18 __ __ CLC
2700 : a5 4a __ LDA T4 + 0 
2702 : 65 47 __ ADC T2 + 0 
2704 : 85 4a __ STA T4 + 0 
2706 : a5 4b __ LDA T4 + 1 
2708 : 65 48 __ ADC T2 + 1 
270a : 85 4b __ STA T4 + 1 
.s30:
270c : a5 53 __ LDA T11 + 0 
270e : 29 07 __ AND #$07
2710 : d0 0d __ BNE $271f ; (bmu_bitblit.s31 + 0)
.s32:
2712 : 18 __ __ CLC
2713 : a5 53 __ LDA T11 + 0 
2715 : 65 43 __ ADC T0 + 0 
2717 : 85 53 __ STA T11 + 0 
2719 : a5 54 __ LDA T11 + 1 
271b : 65 44 __ ADC T0 + 1 
271d : 85 54 __ STA T11 + 1 
.s31:
271f : 18 __ __ CLC
2720 : a5 53 __ LDA T11 + 0 
2722 : 69 ff __ ADC #$ff
2724 : 85 05 __ STA WORK + 2 
2726 : 85 53 __ STA T11 + 0 
2728 : a5 54 __ LDA T11 + 1 
272a : 69 ff __ ADC #$ff
272c : 85 54 __ STA T11 + 1 
272e : 85 06 __ STA WORK + 3 
2730 : 18 __ __ CLC
2731 : a5 4a __ LDA T4 + 0 
2733 : 69 ff __ ADC #$ff
2735 : 85 4a __ STA T4 + 0 
2737 : 85 03 __ STA WORK + 0 
2739 : a5 4b __ LDA T4 + 1 
273b : 69 ff __ ADC #$ff
273d : 85 4b __ STA T4 + 1 
273f : 85 04 __ STA WORK + 1 
2741 : a5 05 __ LDA WORK + 2 
2743 : 29 07 __ AND #$07
2745 : a8 __ __ TAY
2746 : b1 45 __ LDA (T1 + 0),y 
2748 : 85 07 __ STA WORK + 4 
274a : 20 00 9b JSR $9b00 ; (BLIT_CODE[0] + 0)
274d : c6 4e __ DEC T8 + 0 
274f : d0 a8 __ BNE $26f9 ; (bmu_bitblit.l29 + 0)
2751 : 4c 26 26 JMP $2626 ; (bmu_bitblit.s3 + 0)
.s42:
2754 : a9 02 __ LDA #$02
2756 : c5 5e __ CMP T23 + 0 
2758 : a9 00 __ LDA #$00
275a : 6a __ __ ROR
275b : 85 49 __ STA T3 + 0 
275d : d0 19 __ BNE $2778 ; (bmu_bitblit.s43 + 0)
.s61:
275f : a9 a2 __ LDA #$a2
2761 : a6 43 __ LDX T0 + 0 
2763 : e8 __ __ INX
2764 : e8 __ __ INX
2765 : 86 43 __ STX T0 + 0 
2767 : 9d fe 9a STA $9afe,x 
276a : 38 __ __ SEC
276b : a5 5e __ LDA T23 + 0 
276d : e9 01 __ SBC #$01
276f : 9d ff 9a STA $9aff,x 
2772 : a5 5e __ LDA T23 + 0 
2774 : c9 20 __ CMP #$20
2776 : b0 0d __ BCS $2785 ; (bmu_bitblit.s45 + 0)
.s43:
2778 : a5 5f __ LDA T24 + 0 
277a : d0 09 __ BNE $2785 ; (bmu_bitblit.s45 + 0)
.s44:
277c : a5 58 __ LDA T17 + 0 
277e : a6 43 __ LDX T0 + 0 
2780 : 9d 00 9b STA $9b00,x ; (BLIT_CODE[0] + 0)
2783 : e6 43 __ INC T0 + 0 
.s45:
2785 : a5 43 __ LDA T0 + 0 
2787 : 85 55 __ STA T13 + 0 
2789 : a5 52 __ LDA T12 + 0 
278b : f0 1c __ BEQ $27a9 ; (bmu_bitblit.s46 + 0)
.s60:
278d : a9 b1 __ LDA #$b1
278f : a6 43 __ LDX T0 + 0 
2791 : 9d 00 9b STA $9b00,x ; (BLIT_CODE[0] + 0)
2794 : a9 05 __ LDA #$05
2796 : 9d 01 9b STA $9b01,x ; (BLIT_CODE[0] + 1)
2799 : a9 85 __ LDA #$85
279b : 9d 02 9b STA $9b02,x ; (BLIT_CODE[0] + 2)
279e : a9 0a __ LDA #$0a
27a0 : 9d 03 9b STA $9b03,x ; (BLIT_CODE[0] + 3)
27a3 : 8a __ __ TXA
27a4 : 18 __ __ CLC
27a5 : 69 04 __ ADC #$04
27a7 : 85 43 __ STA T0 + 0 
.s46:
27a9 : a5 4c __ LDA T5 + 0 
27ab : d0 05 __ BNE $27b2 ; (bmu_bitblit.s59 + 0)
.s47:
27ad : a5 43 __ LDA T0 + 0 
27af : 4c b9 27 JMP $27b9 ; (bmu_bitblit.s89 + 0)
.s59:
27b2 : a5 43 __ LDA T0 + 0 
27b4 : 85 0d __ STA P0 
27b6 : 20 bb 29 JSR $29bb ; (builddop_src@proxy + 0)
.s89:
27b9 : 85 0d __ STA P0 
27bb : a5 18 __ LDA P11 ; (op + 0)
27bd : 85 0e __ STA P1 
27bf : a9 00 __ LDA #$00
27c1 : 85 0f __ STA P2 
27c3 : 20 fe 2a JSR $2afe ; (builddop_op.s4 + 0)
27c6 : 24 49 __ BIT T3 + 0 
27c8 : 10 1b __ BPL $27e5 ; (bmu_bitblit.s50 + 0)
.s48:
27ca : 85 43 __ STA T0 + 0 
27cc : aa __ __ TAX
27cd : a9 a0 __ LDA #$a0
27cf : 9d 00 9b STA $9b00,x ; (BLIT_CODE[0] + 0)
27d2 : 18 __ __ CLC
27d3 : a5 5d __ LDA T22 + 0 
27d5 : 65 5c __ ADC T21 + 0 
27d7 : 9d 01 9b STA $9b01,x ; (BLIT_CODE[0] + 1)
.s49:
27da : a6 43 __ LDX T0 + 0 
27dc : e8 __ __ INX
27dd : e8 __ __ INX
27de : 86 43 __ STX T0 + 0 
27e0 : 86 0d __ STX P0 
27e2 : 4c 8b 25 JMP $258b ; (bmu_bitblit.s36 + 0)
.s50:
27e5 : aa __ __ TAX
27e6 : a9 1f __ LDA #$1f
27e8 : c5 5e __ CMP T23 + 0 
27ea : a9 00 __ LDA #$00
27ec : 6a __ __ ROR
27ed : 85 4d __ STA T6 + 0 
27ef : f0 04 __ BEQ $27f5 ; (bmu_bitblit.s58 + 0)
.s51:
27f1 : a5 5f __ LDA T24 + 0 
27f3 : f0 06 __ BEQ $27fb ; (bmu_bitblit.s52 + 0)
.s58:
27f5 : a5 58 __ LDA T17 + 0 
27f7 : 9d 00 9b STA $9b00,x ; (BLIT_CODE[0] + 0)
27fa : e8 __ __ INX
.s52:
27fb : a9 98 __ LDA #$98
27fd : 9d 00 9b STA $9b00,x ; (BLIT_CODE[0] + 0)
2800 : a9 08 __ LDA #$08
2802 : 9d 02 9b STA $9b02,x ; (BLIT_CODE[0] + 2)
2805 : a9 a8 __ LDA #$a8
2807 : 9d 03 9b STA $9b03,x ; (BLIT_CODE[0] + 3)
280a : a5 59 __ LDA T18 + 0 
280c : 09 08 __ ORA #$08
280e : 9d 01 9b STA $9b01,x ; (BLIT_CODE[0] + 1)
2811 : 8a __ __ TXA
2812 : 18 __ __ CLC
2813 : 69 04 __ ADC #$04
2815 : 85 43 __ STA T0 + 0 
2817 : 24 4d __ BIT T6 + 0 
2819 : 30 3a __ BMI $2855 ; (bmu_bitblit.s53 + 0)
.s54:
281b : a5 5a __ LDA T19 + 0 
281d : 9d 04 9b STA $9b04,x ; (BLIT_CODE[0] + 4)
2820 : a5 5b __ LDA T20 + 0 
2822 : 09 04 __ ORA #$04
2824 : a8 __ __ TAY
2825 : a5 4c __ LDA T5 + 0 
2827 : d0 0d __ BNE $2836 ; (bmu_bitblit.s57 + 0)
.s55:
2829 : a9 02 __ LDA #$02
282b : 9d 05 9b STA $9b05,x ; (BLIT_CODE[0] + 5)
282e : 18 __ __ CLC
282f : a5 43 __ LDA T0 + 0 
2831 : 69 02 __ ADC #$02
2833 : 4c 47 28 JMP $2847 ; (bmu_bitblit.s56 + 0)
.s57:
2836 : a9 04 __ LDA #$04
2838 : 9d 05 9b STA $9b05,x ; (BLIT_CODE[0] + 5)
283b : 9d 07 9b STA $9b07,x ; (BLIT_CODE[0] + 7)
283e : 98 __ __ TYA
283f : 9d 06 9b STA $9b06,x ; (BLIT_CODE[0] + 6)
2842 : 18 __ __ CLC
2843 : a5 43 __ LDA T0 + 0 
2845 : 69 04 __ ADC #$04
.s56:
2847 : aa __ __ TAX
2848 : e8 __ __ INX
2849 : e8 __ __ INX
284a : 86 43 __ STX T0 + 0 
284c : 98 __ __ TYA
284d : 9d fe 9a STA $9afe,x 
2850 : a9 06 __ LDA #$06
2852 : 9d ff 9a STA $9aff,x 
.s53:
2855 : a9 ca __ LDA #$ca
2857 : a6 43 __ LDX T0 + 0 
2859 : 9d 00 9b STA $9b00,x ; (BLIT_CODE[0] + 0)
285c : a9 d0 __ LDA #$d0
285e : 9d 01 9b STA $9b01,x ; (BLIT_CODE[0] + 1)
2861 : e6 43 __ INC T0 + 0 
2863 : a5 55 __ LDA T13 + 0 
2865 : 38 __ __ SEC
2866 : e5 43 __ SBC T0 + 0 
2868 : 38 __ __ SEC
2869 : e9 02 __ SBC #$02
286b : 9d 02 9b STA $9b02,x ; (BLIT_CODE[0] + 2)
286e : 4c da 27 JMP $27da ; (bmu_bitblit.s49 + 0)
.s66:
2871 : 85 0d __ STA P0 
2873 : a5 4c __ LDA T5 + 0 
2875 : f0 51 __ BEQ $28c8 ; (bmu_bitblit.s67 + 0)
.s68:
2877 : a5 5f __ LDA T24 + 0 
2879 : f0 4d __ BEQ $28c8 ; (bmu_bitblit.s67 + 0)
.s69:
287b : a9 03 __ LDA #$03
287d : 8d 03 9b STA $9b03 ; (BLIT_CODE[0] + 3)
2880 : 8d 08 9b STA $9b08 ; (BLIT_CODE[0] + 8)
2883 : 8d 0c 9b STA $9b0c ; (BLIT_CODE[0] + 12)
2886 : a9 b1 __ LDA #$b1
2888 : 8d 02 9b STA $9b02 ; (BLIT_CODE[0] + 2)
288b : a9 85 __ LDA #$85
288d : 8d 04 9b STA $9b04 ; (BLIT_CODE[0] + 4)
2890 : 8d 0b 9b STA $9b0b ; (BLIT_CODE[0] + 11)
2893 : a9 08 __ LDA #$08
2895 : 8d 05 9b STA $9b05 ; (BLIT_CODE[0] + 5)
2898 : 8d 0a 9b STA $9b0a ; (BLIT_CODE[0] + 10)
289b : a9 a5 __ LDA #$a5
289d : 8d 07 9b STA $9b07 ; (BLIT_CODE[0] + 7)
28a0 : a9 02 __ LDA #$02
28a2 : 8d 0e 9b STA $9b0e ; (BLIT_CODE[0] + 14)
28a5 : a9 04 __ LDA #$04
28a7 : 8d 10 9b STA $9b10 ; (BLIT_CODE[0] + 16)
28aa : a5 58 __ LDA T17 + 0 
28ac : 8d 06 9b STA $9b06 ; (BLIT_CODE[0] + 6)
28af : a5 59 __ LDA T18 + 0 
28b1 : 09 08 __ ORA #$08
28b3 : 8d 09 9b STA $9b09 ; (BLIT_CODE[0] + 9)
28b6 : a5 5a __ LDA T19 + 0 
28b8 : 8d 0d 9b STA $9b0d ; (BLIT_CODE[0] + 13)
28bb : a5 5b __ LDA T20 + 0 
28bd : 09 04 __ ORA #$04
28bf : 8d 0f 9b STA $9b0f ; (BLIT_CODE[0] + 15)
28c2 : a9 11 __ LDA #$11
28c4 : 85 43 __ STA T0 + 0 
28c6 : 85 0d __ STA P0 
.s67:
28c8 : 18 __ __ CLC
28c9 : a5 4d __ LDA T6 + 0 
28cb : 69 01 __ ADC #$01
28cd : 85 5e __ STA T23 + 0 
28cf : d0 03 __ BNE $28d4 ; (bmu_bitblit.s67 + 12)
28d1 : 4c ce 25 JMP $25ce ; (bmu_bitblit.s13 + 0)
28d4 : 4c 84 25 JMP $2584 ; (bmu_bitblit.s35 + 0)
.s76:
28d7 : 18 __ __ CLC
28d8 : a5 12 __ LDA P5 ; (dy + 0)
28da : 65 4e __ ADC T8 + 0 
28dc : 85 47 __ STA T2 + 0 
28de : 29 f8 __ AND #$f8
28e0 : 85 1b __ STA ACCU + 0 ; (w + 0)
28e2 : a5 13 __ LDA P6 ; (dy + 1)
28e4 : 69 00 __ ADC #$00
28e6 : 85 1c __ STA ACCU + 1 ; (w + 1)
28e8 : ad e4 82 LDA $82e4 ; (Screen.cwidth + 0)
28eb : 85 51 __ STA T10 + 0 
28ed : 20 92 73 JSR $7392 ; (mul16by8 + 0)
28f0 : ad e0 82 LDA $82e0 ; (Screen.data + 0)
28f3 : 18 __ __ CLC
28f4 : 65 1b __ ADC ACCU + 0 ; (w + 0)
28f6 : 85 4c __ STA T5 + 0 
28f8 : ad e1 82 LDA $82e1 ; (Screen.data + 1)
28fb : 65 1c __ ADC ACCU + 1 ; (w + 1)
28fd : aa __ __ TAX
28fe : a5 10 __ LDA P3 ; (dx + 0)
2900 : 29 f8 __ AND #$f8
2902 : 18 __ __ CLC
2903 : 65 4c __ ADC T5 + 0 
2905 : 85 4c __ STA T5 + 0 
2907 : 8a __ __ TXA
2908 : 65 11 __ ADC P4 ; (dx + 1)
290a : aa __ __ TAX
290b : a5 47 __ LDA T2 + 0 
290d : 29 07 __ AND #$07
290f : 18 __ __ CLC
2910 : 65 4c __ ADC T5 + 0 
2912 : 85 4c __ STA T5 + 0 
2914 : 90 02 __ BCC $2918 ; (bmu_bitblit.s107 + 0)
.s106:
2916 : e8 __ __ INX
2917 : 18 __ __ CLC
.s107:
2918 : a5 4d __ LDA T6 + 0 
291a : 69 e1 __ ADC #$e1
291c : 2a __ __ ROL
291d : 2a __ __ ROL
291e : 2a __ __ ROL
291f : a8 __ __ TAY
2920 : 29 f8 __ AND #$f8
2922 : 85 43 __ STA T0 + 0 
2924 : 98 __ __ TYA
2925 : 29 07 __ AND #$07
2927 : 2a __ __ ROL
2928 : 69 f8 __ ADC #$f8
292a : 85 44 __ STA T0 + 1 
292c : 18 __ __ CLC
292d : a5 4c __ LDA T5 + 0 
292f : 65 43 __ ADC T0 + 0 
2931 : 85 53 __ STA T11 + 0 
2933 : 8a __ __ TXA
2934 : 65 44 __ ADC T0 + 1 
2936 : 85 54 __ STA T11 + 1 
2938 : a5 56 __ LDA T14 + 0 
293a : 85 55 __ STA T13 + 0 
293c : a5 52 __ LDA T12 + 0 
293e : 85 56 __ STA T14 + 0 
2940 : ad ea bf LDA $bfea ; (sstack + 0)
2943 : 18 __ __ CLC
2944 : 65 4e __ ADC T8 + 0 
2946 : 85 47 __ STA T2 + 0 
2948 : 29 f8 __ AND #$f8
294a : 85 1b __ STA ACCU + 0 ; (w + 0)
294c : ad eb bf LDA $bfeb ; (sstack + 1)
294f : 69 00 __ ADC #$00
2951 : 85 1c __ STA ACCU + 1 ; (w + 1)
2953 : ad e4 82 LDA $82e4 ; (Screen.cwidth + 0)
2956 : 20 92 73 JSR $7392 ; (mul16by8 + 0)
2959 : ad e0 82 LDA $82e0 ; (Screen.data + 0)
295c : 18 __ __ CLC
295d : 65 1b __ ADC ACCU + 0 ; (w + 0)
295f : 85 4a __ STA T4 + 0 
2961 : ad e1 82 LDA $82e1 ; (Screen.data + 1)
2964 : 65 1c __ ADC ACCU + 1 ; (w + 1)
2966 : aa __ __ TAX
2967 : a5 16 __ LDA P9 ; (sx + 0)
2969 : 29 f8 __ AND #$f8
296b : 18 __ __ CLC
296c : 65 4a __ ADC T4 + 0 
296e : 85 4a __ STA T4 + 0 
2970 : 8a __ __ TXA
2971 : 65 17 __ ADC P10 ; (sx + 1)
2973 : aa __ __ TAX
2974 : a5 47 __ LDA T2 + 0 
2976 : 29 07 __ AND #$07
2978 : 18 __ __ CLC
2979 : 65 4a __ ADC T4 + 0 
297b : 90 02 __ BCC $297f ; (bmu_bitblit.s109 + 0)
.s108:
297d : e8 __ __ INX
297e : 18 __ __ CLC
.s109:
297f : 65 43 __ ADC T0 + 0 
2981 : 85 4a __ STA T4 + 0 
2983 : 8a __ __ TXA
2984 : 65 44 __ ADC T0 + 1 
2986 : 85 4b __ STA T4 + 1 
2988 : a9 01 __ LDA #$01
298a : 85 57 __ STA T16 + 0 
298c : a5 16 __ LDA P9 ; (sx + 0)
298e : 29 07 __ AND #$07
2990 : 49 ff __ EOR #$ff
2992 : 38 __ __ SEC
2993 : 65 45 __ ADC T1 + 0 
2995 : 85 43 __ STA T0 + 0 
2997 : 10 0b __ BPL $29a4 ; (bmu_bitblit.s77 + 0)
.s78:
2999 : 18 __ __ CLC
299a : a5 4a __ LDA T4 + 0 
299c : 69 08 __ ADC #$08
299e : 85 4a __ STA T4 + 0 
29a0 : 90 02 __ BCC $29a4 ; (bmu_bitblit.s77 + 0)
.s110:
29a2 : e6 4b __ INC T4 + 1 
.s77:
29a4 : a9 38 __ LDA #$38
29a6 : 85 58 __ STA T17 + 0 
29a8 : a9 e1 __ LDA #$e1
29aa : 85 59 __ STA T18 + 0 
29ac : a9 b0 __ LDA #$b0
29ae : 85 5a __ STA T19 + 0 
29b0 : a9 c2 __ LDA #$c2
29b2 : 85 5b __ STA T20 + 0 
29b4 : a9 f8 __ LDA #$f8
29b6 : 85 5c __ STA T21 + 0 
29b8 : 4c 9c 24 JMP $249c ; (bmu_bitblit.s7 + 0)
--------------------------------------------------------------------
builddop_src@proxy: ; builddop_src@proxy
29bb : a5 5f __ LDA $5f 
29bd : 85 0e __ STA P1 
29bf : a5 57 __ LDA $57 
29c1 : 85 0f __ STA P2 
--------------------------------------------------------------------
builddop_src: ; builddop_src(u8,u8,bool)->u8
; 888, "/home/xahmol/oscar64/include/gfx/bitmap.c"
.s4:
29c3 : a6 0d __ LDX P0 ; (ip + 0)
29c5 : e8 __ __ INX
29c6 : a4 0d __ LDY P0 ; (ip + 0)
29c8 : e8 __ __ INX
29c9 : a5 0e __ LDA P1 ; (shift + 0)
29cb : d0 0c __ BNE $29d9 ; (builddop_src.s6 + 0)
.s5:
29cd : a9 b1 __ LDA #$b1
29cf : 99 00 9b STA $9b00,y ; (BLIT_CODE[0] + 0)
29d2 : a9 03 __ LDA #$03
29d4 : 99 01 9b STA $9b01,y ; (BLIT_CODE[0] + 1)
.s35:
29d7 : 8a __ __ TXA
.s3:
29d8 : 60 __ __ RTS
.s6:
29d9 : a9 a5 __ LDA #$a5
29db : 99 00 9b STA $9b00,y ; (BLIT_CODE[0] + 0)
29de : a9 08 __ LDA #$08
29e0 : 99 01 9b STA $9b01,y ; (BLIT_CODE[0] + 1)
29e3 : a5 0f __ LDA P2 ; (reverse + 0)
29e5 : f0 03 __ BEQ $29ea ; (builddop_src.s7 + 0)
29e7 : 4c f0 2a JMP $2af0 ; (builddop_src.s26 + 0)
.s7:
29ea : a5 0e __ LDA P1 ; (shift + 0)
29ec : c9 05 __ CMP #$05
29ee : b0 06 __ BCS $29f6 ; (builddop_src.s8 + 0)
.s24:
29f0 : a9 4a __ LDA #$4a
.s25:
29f2 : 99 02 9b STA $9b02,y ; (BLIT_CODE[0] + 2)
29f5 : e8 __ __ INX
.s8:
29f6 : a9 85 __ LDA #$85
29f8 : 9d 00 9b STA $9b00,x ; (BLIT_CODE[0] + 0)
29fb : 9d 04 9b STA $9b04,x ; (BLIT_CODE[0] + 4)
29fe : a9 09 __ LDA #$09
2a00 : 9d 01 9b STA $9b01,x ; (BLIT_CODE[0] + 1)
2a03 : a9 b1 __ LDA #$b1
2a05 : 9d 02 9b STA $9b02,x ; (BLIT_CODE[0] + 2)
2a08 : a9 03 __ LDA #$03
2a0a : 9d 03 9b STA $9b03,x ; (BLIT_CODE[0] + 3)
2a0d : a9 08 __ LDA #$08
2a0f : 9d 05 9b STA $9b05,x ; (BLIT_CODE[0] + 5)
2a12 : 8a __ __ TXA
2a13 : 18 __ __ CLC
2a14 : 69 06 __ ADC #$06
2a16 : 85 1b __ STA ACCU + 0 
2a18 : 85 0d __ STA P0 ; (ip + 0)
2a1a : a5 0f __ LDA P2 ; (reverse + 0)
2a1c : d0 6a __ BNE $2a88 ; (builddop_src.s17 + 0)
.s9:
2a1e : a5 0e __ LDA P1 ; (shift + 0)
2a20 : c9 05 __ CMP #$05
2a22 : 90 0b __ BCC $2a2f ; (builddop_src.s10 + 0)
.s13:
2a24 : a9 0a __ LDA #$0a
2a26 : 9d 06 9b STA $9b06,x ; (BLIT_CODE[0] + 6)
2a29 : e6 1b __ INC ACCU + 0 
2a2b : a6 0e __ LDX P1 ; (shift + 0)
2a2d : b0 2e __ BCS $2a5d ; (builddop_src.l14 + 0)
.s10:
2a2f : c9 02 __ CMP #$02
2a31 : 90 1f __ BCC $2a52 ; (builddop_src.s11 + 0)
.s12:
2a33 : c6 0e __ DEC P1 ; (shift + 0)
2a35 : a6 0d __ LDX P0 ; (ip + 0)
2a37 : a4 0e __ LDY P1 ; (shift + 0)
.l31:
2a39 : a9 6a __ LDA #$6a
2a3b : 9d 00 9b STA $9b00,x ; (BLIT_CODE[0] + 0)
2a3e : a9 46 __ LDA #$46
2a40 : 9d 01 9b STA $9b01,x ; (BLIT_CODE[0] + 1)
2a43 : a9 09 __ LDA #$09
2a45 : 9d 02 9b STA $9b02,x ; (BLIT_CODE[0] + 2)
2a48 : 8a __ __ TXA
2a49 : 18 __ __ CLC
2a4a : 69 03 __ ADC #$03
2a4c : aa __ __ TAX
2a4d : 88 __ __ DEY
2a4e : d0 e9 __ BNE $2a39 ; (builddop_src.l31 + 0)
.s32:
2a50 : 85 0d __ STA P0 ; (ip + 0)
.s11:
2a52 : a9 6a __ LDA #$6a
.s33:
2a54 : a6 0d __ LDX P0 ; (ip + 0)
2a56 : 9d 00 9b STA $9b00,x ; (BLIT_CODE[0] + 0)
2a59 : e8 __ __ INX
2a5a : 4c d7 29 JMP $29d7 ; (builddop_src.s35 + 0)
.l14:
2a5d : a9 09 __ LDA #$09
2a5f : a4 1b __ LDY ACCU + 0 
2a61 : 99 01 9b STA $9b01,y ; (BLIT_CODE[0] + 1)
2a64 : 98 __ __ TYA
2a65 : 18 __ __ CLC
2a66 : 69 03 __ ADC #$03
2a68 : 85 1b __ STA ACCU + 0 
2a6a : e0 07 __ CPX #$07
2a6c : b0 0d __ BCS $2a7b ; (builddop_src.s15 + 0)
.s16:
2a6e : a9 26 __ LDA #$26
2a70 : 99 00 9b STA $9b00,y ; (BLIT_CODE[0] + 0)
2a73 : a9 0a __ LDA #$0a
2a75 : 99 02 9b STA $9b02,y ; (BLIT_CODE[0] + 2)
2a78 : e8 __ __ INX
2a79 : 90 e2 __ BCC $2a5d ; (builddop_src.l14 + 0)
.s15:
2a7b : a9 a5 __ LDA #$a5
2a7d : 99 00 9b STA $9b00,y ; (BLIT_CODE[0] + 0)
2a80 : a9 2a __ LDA #$2a
2a82 : 99 02 9b STA $9b02,y ; (BLIT_CODE[0] + 2)
2a85 : a5 1b __ LDA ACCU + 0 
2a87 : 60 __ __ RTS
.s17:
2a88 : a4 0e __ LDY P1 ; (shift + 0)
2a8a : c0 05 __ CPY #$05
2a8c : b0 3d __ BCS $2acb ; (builddop_src.s21 + 0)
.s18:
2a8e : a9 4a __ LDA #$4a
2a90 : 9d 06 9b STA $9b06,x ; (BLIT_CODE[0] + 6)
2a93 : e6 1b __ INC ACCU + 0 
2a95 : c0 02 __ CPY #$02
2a97 : 90 1c __ BCC $2ab5 ; (builddop_src.s19 + 0)
.s20:
2a99 : a6 1b __ LDX ACCU + 0 
2a9b : 88 __ __ DEY
.l29:
2a9c : a9 66 __ LDA #$66
2a9e : 9d 00 9b STA $9b00,x ; (BLIT_CODE[0] + 0)
2aa1 : a9 09 __ LDA #$09
2aa3 : 9d 01 9b STA $9b01,x ; (BLIT_CODE[0] + 1)
2aa6 : a9 4a __ LDA #$4a
2aa8 : 9d 02 9b STA $9b02,x ; (BLIT_CODE[0] + 2)
2aab : 8a __ __ TXA
2aac : 18 __ __ CLC
2aad : 69 03 __ ADC #$03
2aaf : aa __ __ TAX
2ab0 : 88 __ __ DEY
2ab1 : d0 e9 __ BNE $2a9c ; (builddop_src.l29 + 0)
.s30:
2ab3 : 85 1b __ STA ACCU + 0 
.s19:
2ab5 : a9 a5 __ LDA #$a5
2ab7 : a6 1b __ LDX ACCU + 0 
2ab9 : 9d 00 9b STA $9b00,x ; (BLIT_CODE[0] + 0)
2abc : a9 09 __ LDA #$09
2abe : 9d 01 9b STA $9b01,x ; (BLIT_CODE[0] + 1)
2ac1 : a9 6a __ LDA #$6a
2ac3 : 9d 02 9b STA $9b02,x ; (BLIT_CODE[0] + 2)
2ac6 : 8a __ __ TXA
2ac7 : 18 __ __ CLC
2ac8 : 69 03 __ ADC #$03
2aca : 60 __ __ RTS
.s21:
2acb : c0 07 __ CPY #$07
2acd : b0 1c __ BCS $2aeb ; (builddop_src.s22 + 0)
.s23:
2acf : a6 0d __ LDX P0 ; (ip + 0)
.l34:
2ad1 : a9 2a __ LDA #$2a
2ad3 : 9d 00 9b STA $9b00,x ; (BLIT_CODE[0] + 0)
2ad6 : a9 06 __ LDA #$06
2ad8 : 9d 01 9b STA $9b01,x ; (BLIT_CODE[0] + 1)
2adb : a9 09 __ LDA #$09
2add : 9d 02 9b STA $9b02,x ; (BLIT_CODE[0] + 2)
2ae0 : 8a __ __ TXA
2ae1 : 69 03 __ ADC #$03
2ae3 : c8 __ __ INY
2ae4 : c0 07 __ CPY #$07
2ae6 : aa __ __ TAX
2ae7 : 90 e8 __ BCC $2ad1 ; (builddop_src.l34 + 0)
.s28:
2ae9 : 85 0d __ STA P0 ; (ip + 0)
.s22:
2aeb : a9 2a __ LDA #$2a
2aed : 4c 54 2a JMP $2a54 ; (builddop_src.s33 + 0)
.s26:
2af0 : a5 0e __ LDA P1 ; (shift + 0)
2af2 : c9 05 __ CMP #$05
2af4 : b0 03 __ BCS $2af9 ; (builddop_src.s27 + 0)
2af6 : 4c f6 29 JMP $29f6 ; (builddop_src.s8 + 0)
.s27:
2af9 : a9 0a __ LDA #$0a
2afb : 4c f2 29 JMP $29f2 ; (builddop_src.s25 + 0)
--------------------------------------------------------------------
builddop_op: ; builddop_op(u8,enum BlitOp,u8)->u8
; 965, "/home/xahmol/oscar64/include/gfx/bitmap.c"
.s4:
2afe : a5 0e __ LDA P1 ; (op + 0)
2b00 : 29 20 __ AND #$20
2b02 : f0 04 __ BEQ $2b08 ; (builddop_op.s27 + 0)
.s28:
2b04 : a9 07 __ LDA #$07
2b06 : d0 02 __ BNE $2b0a ; (builddop_op.s29 + 0)
.s27:
2b08 : a9 0a __ LDA #$0a
.s29:
2b0a : 85 1c __ STA ACCU + 1 
2b0c : a5 0e __ LDA P1 ; (op + 0)
2b0e : 29 03 __ AND #$03
2b10 : a8 __ __ TAY
2b11 : a5 0e __ LDA P1 ; (op + 0)
2b13 : 29 04 __ AND #$04
2b15 : f0 03 __ BEQ $2b1a ; (builddop_op.s5 + 0)
2b17 : 4c ac 2b JMP $2bac ; (builddop_op.s18 + 0)
.s5:
2b1a : a5 0e __ LDA P1 ; (op + 0)
2b1c : 29 08 __ AND #$08
2b1e : d0 13 __ BNE $2b33 ; (builddop_op.s15 + 0)
.s6:
2b20 : a9 a5 __ LDA #$a5
2b22 : a6 0d __ LDX P0 ; (ip + 0)
2b24 : 9d 00 9b STA $9b00,x ; (BLIT_CODE[0] + 0)
2b27 : a5 1c __ LDA ACCU + 1 
.s7:
2b29 : e8 __ __ INX
2b2a : e8 __ __ INX
2b2b : 86 0d __ STX P0 ; (ip + 0)
2b2d : 9d ff 9a STA $9aff,x 
2b30 : 4c 43 2b JMP $2b43 ; (builddop_op.s16 + 0)
.s15:
2b33 : a5 0e __ LDA P1 ; (op + 0)
2b35 : 0a __ __ ASL
2b36 : 10 0b __ BPL $2b43 ; (builddop_op.s16 + 0)
.s17:
2b38 : a9 49 __ LDA #$49
2b3a : a6 0d __ LDX P0 ; (ip + 0)
2b3c : 9d 00 9b STA $9b00,x ; (BLIT_CODE[0] + 0)
2b3f : a9 ff __ LDA #$ff
2b41 : d0 e6 __ BNE $2b29 ; (builddop_op.s7 + 0)
.s16:
2b43 : 98 __ __ TYA
2b44 : f0 13 __ BEQ $2b59 ; (builddop_op.s8 + 0)
.s14:
2b46 : a5 1c __ LDA ACCU + 1 
2b48 : a6 0d __ LDX P0 ; (ip + 0)
2b4a : e8 __ __ INX
2b4b : e8 __ __ INX
2b4c : 86 0d __ STX P0 ; (ip + 0)
2b4e : 9d ff 9a STA $9aff,x 
2b51 : b9 ee 79 LDA $79ee,y ; (blitops_op[0] + 0)
2b54 : 09 04 __ ORA #$04
2b56 : 9d fe 9a STA $9afe,x 
.s8:
2b59 : a5 0f __ LDA P2 ; (mask + 0)
2b5b : f0 3f __ BEQ $2b9c ; (builddop_op.s9 + 0)
.s10:
2b5d : a9 85 __ LDA #$85
2b5f : a4 0d __ LDY P0 ; (ip + 0)
2b61 : 99 00 9b STA $9b00,y ; (BLIT_CODE[0] + 0)
2b64 : a9 09 __ LDA #$09
2b66 : 99 01 9b STA $9b01,y ; (BLIT_CODE[0] + 1)
2b69 : 98 __ __ TYA
2b6a : 18 __ __ CLC
2b6b : 69 08 __ ADC #$08
2b6d : 85 0d __ STA P0 ; (ip + 0)
2b6f : a5 0e __ LDA P1 ; (op + 0)
2b71 : 29 10 __ AND #$10
2b73 : f0 09 __ BEQ $2b7e ; (builddop_op.s11 + 0)
.s13:
2b75 : a9 45 __ LDA #$45
2b77 : 99 02 9b STA $9b02,y ; (BLIT_CODE[0] + 2)
2b7a : a9 0a __ LDA #$0a
2b7c : d0 07 __ BNE $2b85 ; (builddop_op.s12 + 0)
.s11:
2b7e : a9 51 __ LDA #$51
2b80 : 99 02 9b STA $9b02,y ; (BLIT_CODE[0] + 2)
2b83 : a9 05 __ LDA #$05
.s12:
2b85 : 99 03 9b STA $9b03,y ; (BLIT_CODE[0] + 3)
2b88 : a9 29 __ LDA #$29
2b8a : 99 04 9b STA $9b04,y ; (BLIT_CODE[0] + 4)
2b8d : a5 0f __ LDA P2 ; (mask + 0)
2b8f : 99 05 9b STA $9b05,y ; (BLIT_CODE[0] + 5)
2b92 : a9 45 __ LDA #$45
2b94 : 99 06 9b STA $9b06,y ; (BLIT_CODE[0] + 6)
2b97 : a9 09 __ LDA #$09
2b99 : 99 07 9b STA $9b07,y ; (BLIT_CODE[0] + 7)
.s9:
2b9c : a9 91 __ LDA #$91
2b9e : a6 0d __ LDX P0 ; (ip + 0)
2ba0 : 9d 00 9b STA $9b00,x ; (BLIT_CODE[0] + 0)
2ba3 : a9 05 __ LDA #$05
2ba5 : 9d 01 9b STA $9b01,x ; (BLIT_CODE[0] + 1)
2ba8 : e8 __ __ INX
2ba9 : e8 __ __ INX
2baa : 8a __ __ TXA
.s3:
2bab : 60 __ __ RTS
.s18:
2bac : 98 __ __ TYA
2bad : d0 04 __ BNE $2bb3 ; (builddop_op.s20 + 0)
.s19:
2baf : a5 0f __ LDA P2 ; (mask + 0)
2bb1 : d0 16 __ BNE $2bc9 ; (builddop_op.s23 + 0)
.s20:
2bb3 : a5 0e __ LDA P1 ; (op + 0)
2bb5 : 29 40 __ AND #$40
2bb7 : f0 02 __ BEQ $2bbb ; (builddop_op.s21 + 0)
.s22:
2bb9 : a9 ff __ LDA #$ff
.s21:
2bbb : 85 1b __ STA ACCU + 0 
2bbd : a9 a9 __ LDA #$a9
2bbf : a6 0d __ LDX P0 ; (ip + 0)
2bc1 : 9d 00 9b STA $9b00,x ; (BLIT_CODE[0] + 0)
2bc4 : a5 1b __ LDA ACCU + 0 
2bc6 : 4c 29 2b JMP $2b29 ; (builddop_op.s7 + 0)
.s23:
2bc9 : a9 b1 __ LDA #$b1
2bcb : a4 0d __ LDY P0 ; (ip + 0)
2bcd : 99 00 9b STA $9b00,y ; (BLIT_CODE[0] + 0)
2bd0 : a9 05 __ LDA #$05
2bd2 : 99 01 9b STA $9b01,y ; (BLIT_CODE[0] + 1)
2bd5 : 06 0e __ ASL P1 ; (op + 0)
2bd7 : 30 0a __ BMI $2be3 ; (builddop_op.s26 + 0)
.s24:
2bd9 : a9 29 __ LDA #$29
2bdb : 99 02 9b STA $9b02,y ; (BLIT_CODE[0] + 2)
2bde : a5 0f __ LDA P2 ; (mask + 0)
2be0 : 4c ec 2b JMP $2bec ; (builddop_op.s25 + 0)
.s26:
2be3 : a9 09 __ LDA #$09
2be5 : 99 02 9b STA $9b02,y ; (BLIT_CODE[0] + 2)
2be8 : a5 0f __ LDA P2 ; (mask + 0)
2bea : 49 ff __ EOR #$ff
.s25:
2bec : 99 03 9b STA $9b03,y ; (BLIT_CODE[0] + 3)
2bef : a9 91 __ LDA #$91
2bf1 : 99 04 9b STA $9b04,y ; (BLIT_CODE[0] + 4)
2bf4 : a9 05 __ LDA #$05
2bf6 : 99 05 9b STA $9b05,y ; (BLIT_CODE[0] + 5)
2bf9 : 98 __ __ TYA
2bfa : 18 __ __ CLC
2bfb : 69 06 __ ADC #$06
2bfd : 60 __ __ RTS
--------------------------------------------------------------------
draw_message: ; draw_message(u8)->void
; 234, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s1:
2bfe : a2 04 __ LDX #$04
2c00 : b5 53 __ LDA T1 + 0,x 
2c02 : 9d cd bf STA $bfcd,x ; (draw_message@stack + 0)
2c05 : ca __ __ DEX
2c06 : 10 f8 __ BPL $2c00 ; (draw_message.s1 + 2)
.s4:
2c08 : ad f0 bf LDA $bff0 ; (sstack + 6)
2c0b : 0a __ __ ASL
2c0c : aa __ __ TAX
2c0d : bd 00 7a LDA $7a00,x ; (step_msg[0] + 0)
2c10 : 85 56 __ STA T3 + 0 
2c12 : 85 0d __ STA P0 
2c14 : bd 01 7a LDA $7a01,x ; (step_msg[0] + 1)
2c17 : 85 57 __ STA T3 + 1 
2c19 : 85 0e __ STA P1 
2c1b : 20 47 10 JSR $1047 ; (strlen.s4 + 0)
2c1e : a9 00 __ LDA #$00
2c20 : 85 53 __ STA T1 + 0 
2c22 : 85 54 __ STA T1 + 1 
2c24 : a5 1b __ LDA ACCU + 0 
2c26 : f0 1b __ BEQ $2c43 ; (draw_message.s5 + 0)
.s6:
2c28 : a0 00 __ LDY #$00
.l7:
2c2a : b1 56 __ LDA (T3 + 0),y 
2c2c : 38 __ __ SEC
2c2d : e9 20 __ SBC #$20
2c2f : aa __ __ TAX
2c30 : bd 80 7a LDA $7a80,x ; (TinyFont[0] + 96)
2c33 : 4a __ __ LSR
2c34 : 4a __ __ LSR
2c35 : 38 __ __ SEC
2c36 : 65 53 __ ADC T1 + 0 
2c38 : 85 53 __ STA T1 + 0 
2c3a : 90 02 __ BCC $2c3e ; (draw_message.s9 + 0)
.s8:
2c3c : e6 54 __ INC T1 + 1 
.s9:
2c3e : c8 __ __ INY
2c3f : c4 1b __ CPY ACCU + 0 
2c41 : 90 e7 __ BCC $2c2a ; (draw_message.l7 + 0)
.s5:
2c43 : a5 0d __ LDA P0 
2c45 : 85 0e __ STA P1 
2c47 : a5 57 __ LDA T3 + 1 
2c49 : 85 0f __ STA P2 
2c4b : a5 1b __ LDA ACCU + 0 
2c4d : 85 10 __ STA P3 
2c4f : 38 __ __ SEC
2c50 : a9 40 __ LDA #$40
2c52 : e5 53 __ SBC T1 + 0 
2c54 : a8 __ __ TAY
2c55 : a9 01 __ LDA #$01
2c57 : e5 54 __ SBC T1 + 1 
2c59 : aa __ __ TAX
2c5a : 0a __ __ ASL
2c5b : 98 __ __ TYA
2c5c : 69 00 __ ADC #$00
2c5e : 85 53 __ STA T1 + 0 
2c60 : 8a __ __ TXA
2c61 : 69 00 __ ADC #$00
2c63 : c9 80 __ CMP #$80
2c65 : 6a __ __ ROR
2c66 : 66 53 __ ROR T1 + 0 
2c68 : 85 54 __ STA T1 + 1 
2c6a : a5 53 __ LDA T1 + 0 
2c6c : 29 07 __ AND #$07
2c6e : 85 55 __ STA T2 + 0 
2c70 : 85 0d __ STA P0 
2c72 : 20 5d 2e JSR $2e5d ; (bmu_text.s4 + 0)
2c75 : a5 53 __ LDA T1 + 0 
2c77 : 85 10 __ STA P3 
2c79 : a5 54 __ LDA T1 + 1 
2c7b : 85 11 __ STA P4 
2c7d : a9 00 __ LDA #$00
2c7f : 85 13 __ STA P6 
2c81 : 85 17 __ STA P10 
2c83 : 8d ea bf STA $bfea ; (sstack + 0)
2c86 : 8d eb bf STA $bfeb ; (sstack + 1)
2c89 : 8d ef bf STA $bfef ; (sstack + 5)
2c8c : a5 55 __ LDA T2 + 0 
2c8e : 85 16 __ STA P9 
2c90 : a9 a2 __ LDA #$a2
2c92 : 85 12 __ STA P5 
2c94 : a5 1b __ LDA ACCU + 0 
2c96 : 8d ec bf STA $bfec ; (sstack + 2)
2c99 : a5 1c __ LDA ACCU + 1 
2c9b : 8d ed bf STA $bfed ; (sstack + 3)
2c9e : a9 08 __ LDA #$08
2ca0 : 85 18 __ STA P11 
2ca2 : 8d ee bf STA $bfee ; (sstack + 4)
2ca5 : a9 f2 __ LDA #$f2
2ca7 : 85 14 __ STA P7 
2ca9 : a9 79 __ LDA #$79
2cab : 85 15 __ STA P8 
2cad : 20 49 23 JSR $2349 ; (bmu_bitblit.s1 + 0)
.s3:
2cb0 : a2 04 __ LDX #$04
2cb2 : bd cd bf LDA $bfcd,x ; (draw_message@stack + 0)
2cb5 : 95 53 __ STA T1 + 0,x 
2cb7 : ca __ __ DEX
2cb8 : 10 f8 __ BPL $2cb2 ; (draw_message.s3 + 2)
2cba : 60 __ __ RTS
--------------------------------------------------------------------
2cbb : __ __ __ BYT 53 74 61 6e 64 61 72 64 20 31 20 4d 48 7a 20 43 : Standard 1 MHz C
2ccb : __ __ __ BYT 36 34 20 73 70 65 65 64 00                      : 64 speed.
--------------------------------------------------------------------
2cd4 : __ __ __ BYT 54 75 72 62 6f 20 65 6e 67 61 67 65 64 3a 20 32 : Turbo engaged: 2
2ce4 : __ __ __ BYT 20 4d 48 7a 00                                  :  MHz.
--------------------------------------------------------------------
2ce9 : __ __ __ BYT 33 20 4d 48 7a 20 2d 20 77 61 72 6d 69 6e 67 20 : 3 MHz - warming 
2cf9 : __ __ __ BYT 75 70 00                                        : up.
--------------------------------------------------------------------
2cfc : __ __ __ BYT 34 20 4d 48 7a 20 2d 20 73 6d 6f 6f 74 68 20 61 : 4 MHz - smooth a
2d0c : __ __ __ BYT 6c 72 65 61 64 79 21 00                         : lready!.
--------------------------------------------------------------------
2d14 : __ __ __ BYT 36 20 4d 48 7a 20 2d 20 74 68 69 73 20 66 65 65 : 6 MHz - this fee
2d24 : __ __ __ BYT 6c 73 20 64 69 66 66 65 72 65 6e 74 00          : ls different.
--------------------------------------------------------------------
2d31 : __ __ __ BYT 38 20 4d 48 7a 20 2d 20 74 68 69 6e 67 73 20 61 : 8 MHz - things a
2d41 : __ __ __ BYT 72 65 20 6d 6f 76 69 6e 67 00                   : re moving.
--------------------------------------------------------------------
2d4b : __ __ __ BYT 31 32 20 4d 48 7a 20 2d 20 70 69 63 6b 69 6e 67 : 12 MHz - picking
2d5b : __ __ __ BYT 20 75 70 20 73 70 65 65 64 00                   :  up speed.
--------------------------------------------------------------------
2d65 : __ __ __ BYT 31 36 20 4d 48 7a 20 2d 20 6e 6f 74 69 63 65 61 : 16 MHz - noticea
2d75 : __ __ __ BYT 62 6c 79 20 66 61 73 74 00                      : bly fast.
--------------------------------------------------------------------
2d7e : __ __ __ BYT 32 30 20 4d 48 7a 20 2d 20 77 68 61 74 20 69 73 : 20 MHz - what is
2d8e : __ __ __ BYT 20 68 61 70 70 65 6e 69 6e 67 3f 00             :  happening?.
--------------------------------------------------------------------
2d9a : __ __ __ BYT 32 34 20 4d 48 7a 20 2d 20 65 79 65 73 20 63 61 : 24 MHz - eyes ca
2daa : __ __ __ BYT 6e 20 62 61 72 65 6c 79 20 66 6f 6c 6c 6f 77 00 : n barely follow.
--------------------------------------------------------------------
2dba : __ __ __ BYT 32 38 20 4d 48 7a 20 2d 20 74 68 69 73 20 69 73 : 28 MHz - this is
2dca : __ __ __ BYT 20 69 6e 63 72 65 64 69 62 6c 65 21 00          :  incredible!.
--------------------------------------------------------------------
2dd7 : __ __ __ BYT 33 32 20 4d 48 7a 20 2d 20 74 68 65 20 6d 61 63 : 32 MHz - the mac
2de7 : __ __ __ BYT 68 69 6e 65 20 73 63 72 65 61 6d 73 00          : hine screams.
--------------------------------------------------------------------
2df4 : __ __ __ BYT 33 36 20 4d 48 7a 20 2d 20 62 65 79 6f 6e 64 20 : 36 MHz - beyond 
2e04 : __ __ __ BYT 69 6d 61 67 69 6e 61 74 69 6f 6e 00             : imagination.
--------------------------------------------------------------------
2e10 : __ __ __ BYT 34 30 20 4d 48 7a 20 2d 20 68 6f 6c 64 20 6f 6e : 40 MHz - hold on
2e20 : __ __ __ BYT 20 74 69 67 68 74 21 00                         :  tight!.
--------------------------------------------------------------------
2e28 : __ __ __ BYT 34 38 20 4d 48 7a 20 2d 20 6d 61 78 69 6d 75 6d : 48 MHz - maximum
2e38 : __ __ __ BYT 20 6f 76 65 72 64 72 69 76 65 21 00             :  overdrive!.
--------------------------------------------------------------------
2e44 : __ __ __ BYT 36 34 20 4d 48 7a 20 20 55 4c 54 49 4d 41 54 45 : 64 MHz  ULTIMATE
2e54 : __ __ __ BYT 20 53 50 45 45 44 21 21 00                      :  SPEED!!.
--------------------------------------------------------------------
bmu_text: ; bmu_text(const struct Bitmap*,u8,const u8*,u8)->i16
; 151, "/home/xahmol/oscar64/include/gfx/bitmap.h"
.s4:
2e5d : a9 00 __ LDA #$00
2e5f : 8d e8 82 STA $82e8 ; (tworks[0] + 0)
2e62 : 8d e9 82 STA $82e9 ; (tworks[0] + 1)
2e65 : 8d ea 82 STA $82ea ; (tworks[0] + 2)
2e68 : 8d eb 82 STA $82eb ; (tworks[0] + 3)
2e6b : 8d ec 82 STA $82ec ; (tworks[0] + 4)
2e6e : 8d ed 82 STA $82ed ; (tworks[0] + 5)
2e71 : 8d ee 82 STA $82ee ; (tworks[0] + 6)
2e74 : 8d ef 82 STA $82ef ; (tworks[0] + 7)
2e77 : 85 1b __ STA ACCU + 0 
2e79 : 85 1c __ STA ACCU + 1 
2e7b : ad f2 79 LDA $79f2 ; (tbitmap.data + 0)
2e7e : 85 43 __ STA T1 + 0 
2e80 : ad f3 79 LDA $79f3 ; (tbitmap.data + 1)
2e83 : 85 44 __ STA T1 + 1 
2e85 : a5 10 __ LDA P3 ; (len + 0)
2e87 : d0 03 __ BNE $2e8c ; (bmu_text.s7 + 0)
2e89 : 4c 99 2f JMP $2f99 ; (bmu_text.s5 + 0)
.s7:
2e8c : a0 00 __ LDY #$00
.l8:
2e8e : 84 1d __ STY ACCU + 2 
2e90 : b1 0e __ LDA (P1),y ; (str + 0)
2e92 : 38 __ __ SEC
2e93 : e9 20 __ SBC #$20
2e95 : aa __ __ TAX
2e96 : 18 __ __ CLC
2e97 : a9 e0 __ LDA #$e0
2e99 : 7d 20 7a ADC $7a20,x ; (TinyFont[0] + 0)
2e9c : 85 45 __ STA T6 + 0 
2e9e : bd 80 7a LDA $7a80,x ; (TinyFont[0] + 96)
2ea1 : 29 03 __ AND #$03
2ea3 : 69 7a __ ADC #$7a
2ea5 : 85 46 __ STA T6 + 1 
2ea7 : bd 80 7a LDA $7a80,x ; (TinyFont[0] + 96)
2eaa : 4a __ __ LSR
2eab : 4a __ __ LSR
2eac : 85 1e __ STA ACCU + 3 
2eae : 38 __ __ SEC
2eaf : 65 1b __ ADC ACCU + 0 
2eb1 : 85 1b __ STA ACCU + 0 
2eb3 : 90 02 __ BCC $2eb7 ; (bmu_text.s19 + 0)
.s18:
2eb5 : e6 1c __ INC ACCU + 1 
.s19:
2eb7 : a9 00 __ LDA #$00
2eb9 : 85 47 __ STA T7 + 0 
2ebb : a5 1e __ LDA ACCU + 3 
2ebd : f0 73 __ BEQ $2f32 ; (bmu_text.s9 + 0)
.s16:
2ebf : a6 0d __ LDX P0 ; (lx + 0)
2ec1 : a0 00 __ LDY #$00
.l12:
2ec3 : b1 45 __ LDA (T6 + 0),y 
2ec5 : 0a __ __ ASL
2ec6 : 2e e8 82 ROL $82e8 ; (tworks[0] + 0)
2ec9 : 0a __ __ ASL
2eca : 2e e9 82 ROL $82e9 ; (tworks[0] + 1)
2ecd : 0a __ __ ASL
2ece : 2e ea 82 ROL $82ea ; (tworks[0] + 2)
2ed1 : 0a __ __ ASL
2ed2 : 2e eb 82 ROL $82eb ; (tworks[0] + 3)
2ed5 : 0a __ __ ASL
2ed6 : 2e ec 82 ROL $82ec ; (tworks[0] + 4)
2ed9 : 0a __ __ ASL
2eda : 2e ed 82 ROL $82ed ; (tworks[0] + 5)
2edd : 0a __ __ ASL
2ede : 2e ee 82 ROL $82ee ; (tworks[0] + 6)
2ee1 : 0a __ __ ASL
2ee2 : 2e ef 82 ROL $82ef ; (tworks[0] + 7)
2ee5 : e8 __ __ INX
2ee6 : e0 08 __ CPX #$08
2ee8 : d0 3e __ BNE $2f28 ; (bmu_text.s13 + 0)
.s14:
2eea : ad e8 82 LDA $82e8 ; (tworks[0] + 0)
2eed : a0 00 __ LDY #$00
2eef : 91 43 __ STA (T1 + 0),y 
2ef1 : ad e9 82 LDA $82e9 ; (tworks[0] + 1)
2ef4 : c8 __ __ INY
2ef5 : 91 43 __ STA (T1 + 0),y 
2ef7 : ad ea 82 LDA $82ea ; (tworks[0] + 2)
2efa : c8 __ __ INY
2efb : 91 43 __ STA (T1 + 0),y 
2efd : ad eb 82 LDA $82eb ; (tworks[0] + 3)
2f00 : c8 __ __ INY
2f01 : 91 43 __ STA (T1 + 0),y 
2f03 : ad ec 82 LDA $82ec ; (tworks[0] + 4)
2f06 : c8 __ __ INY
2f07 : 91 43 __ STA (T1 + 0),y 
2f09 : ad ed 82 LDA $82ed ; (tworks[0] + 5)
2f0c : c8 __ __ INY
2f0d : 91 43 __ STA (T1 + 0),y 
2f0f : ad ee 82 LDA $82ee ; (tworks[0] + 6)
2f12 : c8 __ __ INY
2f13 : 91 43 __ STA (T1 + 0),y 
2f15 : ad ef 82 LDA $82ef ; (tworks[0] + 7)
2f18 : c8 __ __ INY
2f19 : 91 43 __ STA (T1 + 0),y 
2f1b : 18 __ __ CLC
2f1c : a5 43 __ LDA T1 + 0 
2f1e : 69 08 __ ADC #$08
2f20 : 85 43 __ STA T1 + 0 
2f22 : 90 02 __ BCC $2f26 ; (bmu_text.s21 + 0)
.s20:
2f24 : e6 44 __ INC T1 + 1 
.s21:
2f26 : a2 00 __ LDX #$00
.s13:
2f28 : e6 47 __ INC T7 + 0 
2f2a : a4 47 __ LDY T7 + 0 
2f2c : c4 1e __ CPY ACCU + 3 
2f2e : 90 93 __ BCC $2ec3 ; (bmu_text.l12 + 0)
.s17:
2f30 : 86 0d __ STX P0 ; (lx + 0)
.s9:
2f32 : 0e e8 82 ASL $82e8 ; (tworks[0] + 0)
2f35 : 0e e9 82 ASL $82e9 ; (tworks[0] + 1)
2f38 : 0e ea 82 ASL $82ea ; (tworks[0] + 2)
2f3b : 0e eb 82 ASL $82eb ; (tworks[0] + 3)
2f3e : 0e ec 82 ASL $82ec ; (tworks[0] + 4)
2f41 : 0e ed 82 ASL $82ed ; (tworks[0] + 5)
2f44 : 0e ee 82 ASL $82ee ; (tworks[0] + 6)
2f47 : 0e ef 82 ASL $82ef ; (tworks[0] + 7)
2f4a : e6 0d __ INC P0 ; (lx + 0)
2f4c : a5 0d __ LDA P0 ; (lx + 0)
2f4e : c9 08 __ CMP #$08
2f50 : d0 3d __ BNE $2f8f ; (bmu_text.s10 + 0)
.s11:
2f52 : ad e8 82 LDA $82e8 ; (tworks[0] + 0)
2f55 : a0 00 __ LDY #$00
2f57 : 84 0d __ STY P0 ; (lx + 0)
2f59 : 91 43 __ STA (T1 + 0),y 
2f5b : ad e9 82 LDA $82e9 ; (tworks[0] + 1)
2f5e : c8 __ __ INY
2f5f : 91 43 __ STA (T1 + 0),y 
2f61 : ad ea 82 LDA $82ea ; (tworks[0] + 2)
2f64 : c8 __ __ INY
2f65 : 91 43 __ STA (T1 + 0),y 
2f67 : ad eb 82 LDA $82eb ; (tworks[0] + 3)
2f6a : c8 __ __ INY
2f6b : 91 43 __ STA (T1 + 0),y 
2f6d : ad ec 82 LDA $82ec ; (tworks[0] + 4)
2f70 : c8 __ __ INY
2f71 : 91 43 __ STA (T1 + 0),y 
2f73 : ad ed 82 LDA $82ed ; (tworks[0] + 5)
2f76 : c8 __ __ INY
2f77 : 91 43 __ STA (T1 + 0),y 
2f79 : ad ee 82 LDA $82ee ; (tworks[0] + 6)
2f7c : c8 __ __ INY
2f7d : 91 43 __ STA (T1 + 0),y 
2f7f : ad ef 82 LDA $82ef ; (tworks[0] + 7)
2f82 : c8 __ __ INY
2f83 : 91 43 __ STA (T1 + 0),y 
2f85 : a5 43 __ LDA T1 + 0 
2f87 : 69 07 __ ADC #$07
2f89 : 85 43 __ STA T1 + 0 
2f8b : 90 02 __ BCC $2f8f ; (bmu_text.s10 + 0)
.s22:
2f8d : e6 44 __ INC T1 + 1 
.s10:
2f8f : a4 1d __ LDY ACCU + 2 
2f91 : c8 __ __ INY
2f92 : c4 10 __ CPY P3 ; (len + 0)
2f94 : b0 03 __ BCS $2f99 ; (bmu_text.s5 + 0)
2f96 : 4c 8e 2e JMP $2e8e ; (bmu_text.l8 + 0)
.s5:
2f99 : a6 0d __ LDX P0 ; (lx + 0)
2f9b : e0 08 __ CPX #$08
2f9d : b0 1d __ BCS $2fbc ; (bmu_text.s6 + 0)
.l15:
2f9f : 0e e8 82 ASL $82e8 ; (tworks[0] + 0)
2fa2 : 0e e9 82 ASL $82e9 ; (tworks[0] + 1)
2fa5 : 0e ea 82 ASL $82ea ; (tworks[0] + 2)
2fa8 : 0e eb 82 ASL $82eb ; (tworks[0] + 3)
2fab : 0e ec 82 ASL $82ec ; (tworks[0] + 4)
2fae : 0e ed 82 ASL $82ed ; (tworks[0] + 5)
2fb1 : 0e ee 82 ASL $82ee ; (tworks[0] + 6)
2fb4 : 0e ef 82 ASL $82ef ; (tworks[0] + 7)
2fb7 : e8 __ __ INX
2fb8 : e0 08 __ CPX #$08
2fba : 90 e3 __ BCC $2f9f ; (bmu_text.l15 + 0)
.s6:
2fbc : ad e8 82 LDA $82e8 ; (tworks[0] + 0)
2fbf : a0 00 __ LDY #$00
2fc1 : 91 43 __ STA (T1 + 0),y 
2fc3 : ad e9 82 LDA $82e9 ; (tworks[0] + 1)
2fc6 : c8 __ __ INY
2fc7 : 91 43 __ STA (T1 + 0),y 
2fc9 : ad ea 82 LDA $82ea ; (tworks[0] + 2)
2fcc : c8 __ __ INY
2fcd : 91 43 __ STA (T1 + 0),y 
2fcf : ad eb 82 LDA $82eb ; (tworks[0] + 3)
2fd2 : c8 __ __ INY
2fd3 : 91 43 __ STA (T1 + 0),y 
2fd5 : ad ec 82 LDA $82ec ; (tworks[0] + 4)
2fd8 : c8 __ __ INY
2fd9 : 91 43 __ STA (T1 + 0),y 
2fdb : ad ed 82 LDA $82ed ; (tworks[0] + 5)
2fde : c8 __ __ INY
2fdf : 91 43 __ STA (T1 + 0),y 
2fe1 : ad ee 82 LDA $82ee ; (tworks[0] + 6)
2fe4 : c8 __ __ INY
2fe5 : 91 43 __ STA (T1 + 0),y 
2fe7 : ad ef 82 LDA $82ef ; (tworks[0] + 7)
2fea : c8 __ __ INY
2feb : 91 43 __ STA (T1 + 0),y 
.s3:
2fed : 60 __ __ RTS
--------------------------------------------------------------------
draw_gear: ; draw_gear(i16,i16,u8,u8,u8,u8,u8,u8,u8,u8)->void
;  88, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s1:
2fee : a2 20 __ LDX #$20
2ff0 : b5 53 __ LDA T0 + 0,x 
2ff2 : 9d b0 bf STA $bfb0,x ; (draw_gear@stack + 0)
2ff5 : ca __ __ DEX
2ff6 : 10 f8 __ BPL $2ff0 ; (draw_gear.s1 + 2)
.s4:
2ff8 : ad fd bf LDA $bffd ; (sstack + 19)
2ffb : 85 5d __ STA T5 + 0 
2ffd : ad fc bf LDA $bffc ; (sstack + 18)
3000 : 85 5e __ STA T6 + 0 
3002 : ad f9 bf LDA $bff9 ; (sstack + 15)
3005 : 85 5f __ STA T7 + 0 
3007 : ad fb bf LDA $bffb ; (sstack + 17)
300a : 85 60 __ STA T8 + 0 
300c : 4a __ __ LSR
300d : 85 61 __ STA T9 + 0 
300f : a9 00 __ LDA #$00
3011 : 85 62 __ STA T10 + 0 
3013 : 85 63 __ STA T11 + 0 
3015 : 85 64 __ STA T11 + 1 
3017 : 85 65 __ STA T12 + 0 
3019 : 85 66 __ STA T12 + 1 
301b : 85 53 __ STA T0 + 0 
301d : 85 54 __ STA T0 + 1 
301f : 85 55 __ STA T1 + 0 
3021 : 85 56 __ STA T1 + 1 
3023 : ae ff bf LDX $bfff ; (sstack + 21)
3026 : 86 71 __ STX T20 + 0 
3028 : ae fe bf LDX $bffe ; (sstack + 20)
302b : 86 72 __ STX T21 + 0 
302d : ae fa bf LDX $bffa ; (sstack + 16)
3030 : 86 73 __ STX T22 + 0 
3032 : ae f7 bf LDX $bff7 ; (sstack + 13)
3035 : 86 67 __ STX T13 + 0 
.l5:
3037 : 85 1b __ STA ACCU + 0 
3039 : a9 00 __ LDA #$00
303b : 85 1c __ STA ACCU + 1 
303d : a5 60 __ LDA T8 + 0 
303f : 20 92 73 JSR $7392 ; (mul16by8 + 0)
3042 : 18 __ __ CLC
3043 : a5 1b __ LDA ACCU + 0 
3045 : 65 5f __ ADC T7 + 0 
3047 : 29 3f __ AND #$3f
3049 : 85 68 __ STA T14 + 0 
304b : 18 __ __ CLC
304c : 69 10 __ ADC #$10
304e : 29 3f __ AND #$3f
3050 : aa __ __ TAX
3051 : bd 4b 7c LDA $7c4b,x ; (sin64[0] + 0)
3054 : 85 57 __ STA T2 + 0 
3056 : 0a __ __ ASL
3057 : a9 00 __ LDA #$00
3059 : 85 04 __ STA WORK + 1 
305b : 69 ff __ ADC #$ff
305d : 49 ff __ EOR #$ff
305f : 85 58 __ STA T2 + 1 
3061 : a5 57 __ LDA T2 + 0 
3063 : 0a __ __ ASL
3064 : 85 1b __ STA ACCU + 0 
3066 : a5 58 __ LDA T2 + 1 
3068 : 2a __ __ ROL
3069 : 06 1b __ ASL ACCU + 0 
306b : 2a __ __ ROL
306c : 85 1c __ STA ACCU + 1 
306e : 20 42 74 JSR $7442 ; (divs16@proxy + 0)
3071 : a5 1b __ LDA ACCU + 0 
3073 : 85 69 __ STA T15 + 0 
3075 : a5 1c __ LDA ACCU + 1 
3077 : 85 6a __ STA T15 + 1 
3079 : a6 68 __ LDX T14 + 0 
307b : bd 4b 7c LDA $7c4b,x ; (sin64[0] + 0)
307e : 85 59 __ STA T3 + 0 
3080 : 85 1b __ STA ACCU + 0 
3082 : 29 80 __ AND #$80
3084 : 10 02 __ BPL $3088 ; (draw_gear.l5 + 81)
3086 : a9 ff __ LDA #$ff
3088 : 85 5a __ STA T3 + 1 
308a : 85 1c __ STA ACCU + 1 
308c : a5 5d __ LDA T5 + 0 
308e : 20 92 73 JSR $7392 ; (mul16by8 + 0)
3091 : 20 8a 78 JSR $788a ; (divs16@proxy + 0)
3094 : 18 __ __ CLC
3095 : a5 1b __ LDA ACCU + 0 
3097 : 69 58 __ ADC #$58
3099 : 85 6b __ STA T16 + 0 
309b : a5 1c __ LDA ACCU + 1 
309d : 69 00 __ ADC #$00
309f : 85 6c __ STA T16 + 1 
30a1 : a5 57 __ LDA T2 + 0 
30a3 : 85 1b __ STA ACCU + 0 
30a5 : a5 58 __ LDA T2 + 1 
30a7 : 85 1c __ STA ACCU + 1 
30a9 : a5 5d __ LDA T5 + 0 
30ab : 20 92 73 JSR $7392 ; (mul16by8 + 0)
30ae : 20 8a 78 JSR $788a ; (divs16@proxy + 0)
30b1 : 18 __ __ CLC
30b2 : a5 1b __ LDA ACCU + 0 
30b4 : 65 67 __ ADC T13 + 0 
30b6 : 85 6d __ STA T17 + 0 
30b8 : a5 1c __ LDA ACCU + 1 
30ba : 69 00 __ ADC #$00
30bc : 85 6e __ STA T17 + 1 
30be : a5 59 __ LDA T3 + 0 
30c0 : 85 1b __ STA ACCU + 0 
30c2 : a5 5a __ LDA T3 + 1 
30c4 : 85 1c __ STA ACCU + 1 
30c6 : a5 5e __ LDA T6 + 0 
30c8 : 20 92 73 JSR $7392 ; (mul16by8 + 0)
30cb : 20 8a 78 JSR $788a ; (divs16@proxy + 0)
30ce : 18 __ __ CLC
30cf : a5 1b __ LDA ACCU + 0 
30d1 : 69 58 __ ADC #$58
30d3 : 85 5b __ STA T4 + 0 
30d5 : a5 1c __ LDA ACCU + 1 
30d7 : 69 00 __ ADC #$00
30d9 : 85 5c __ STA T4 + 1 
30db : a5 57 __ LDA T2 + 0 
30dd : 85 1b __ STA ACCU + 0 
30df : a5 58 __ LDA T2 + 1 
30e1 : 85 1c __ STA ACCU + 1 
30e3 : a5 5e __ LDA T6 + 0 
30e5 : 20 92 73 JSR $7392 ; (mul16by8 + 0)
30e8 : 20 8a 78 JSR $788a ; (divs16@proxy + 0)
30eb : 18 __ __ CLC
30ec : a5 1b __ LDA ACCU + 0 
30ee : 65 67 __ ADC T13 + 0 
30f0 : 85 57 __ STA T2 + 0 
30f2 : a5 1c __ LDA ACCU + 1 
30f4 : 69 00 __ ADC #$00
30f6 : 85 58 __ STA T2 + 1 
30f8 : 38 __ __ SEC
30f9 : a9 00 __ LDA #$00
30fb : e5 59 __ SBC T3 + 0 
30fd : 85 1b __ STA ACCU + 0 
30ff : a9 00 __ LDA #$00
3101 : 85 04 __ STA WORK + 1 
3103 : e5 5a __ SBC T3 + 1 
3105 : 06 1b __ ASL ACCU + 0 
3107 : 2a __ __ ROL
3108 : 06 1b __ ASL ACCU + 0 
310a : 2a __ __ ROL
310b : 85 1c __ STA ACCU + 1 
310d : 20 42 74 JSR $7442 ; (divs16@proxy + 0)
3110 : a5 1b __ LDA ACCU + 0 
3112 : 85 59 __ STA T3 + 0 
3114 : a5 1c __ LDA ACCU + 1 
3116 : 85 5a __ STA T3 + 1 
3118 : 05 1b __ ORA ACCU + 0 
311a : d0 12 __ BNE $312e ; (draw_gear.s6 + 0)
.s12:
311c : 85 59 __ STA T3 + 0 
311e : 85 5a __ STA T3 + 1 
3120 : a5 69 __ LDA T15 + 0 
3122 : 05 6a __ ORA T15 + 1 
3124 : d0 08 __ BNE $312e ; (draw_gear.s6 + 0)
.s13:
3126 : a9 01 __ LDA #$01
3128 : 85 69 __ STA T15 + 0 
312a : a9 00 __ LDA #$00
312c : 85 6a __ STA T15 + 1 
.s6:
312e : a5 62 __ LDA T10 + 0 
3130 : d0 1d __ BNE $314f ; (draw_gear.s11 + 0)
.s7:
3132 : 38 __ __ SEC
3133 : a5 5b __ LDA T4 + 0 
3135 : e5 69 __ SBC T15 + 0 
3137 : 85 65 __ STA T12 + 0 
3139 : a5 5c __ LDA T4 + 1 
313b : e5 6a __ SBC T15 + 1 
313d : 85 66 __ STA T12 + 1 
313f : 38 __ __ SEC
3140 : a5 57 __ LDA T2 + 0 
3142 : e5 59 __ SBC T3 + 0 
3144 : 85 63 __ STA T11 + 0 
3146 : a5 58 __ LDA T2 + 1 
3148 : e5 5a __ SBC T3 + 1 
314a : 85 64 __ STA T11 + 1 
314c : 4c 9d 31 JMP $319d ; (draw_gear.s8 + 0)
.s11:
314f : a5 53 __ LDA T0 + 0 
3151 : 8d ee bf STA $bfee ; (sstack + 4)
3154 : a5 54 __ LDA T0 + 1 
3156 : 8d ef bf STA $bfef ; (sstack + 5)
3159 : a5 55 __ LDA T1 + 0 
315b : 8d f0 bf STA $bff0 ; (sstack + 6)
315e : a5 56 __ LDA T1 + 1 
3160 : 8d f1 bf STA $bff1 ; (sstack + 7)
3163 : a9 03 __ LDA #$03
3165 : 8d f6 bf STA $bff6 ; (sstack + 12)
3168 : a9 e0 __ LDA #$e0
316a : 8d ea bf STA $bfea ; (sstack + 0)
316d : a9 82 __ LDA #$82
316f : 8d eb bf STA $bfeb ; (sstack + 1)
3172 : a9 8b __ LDA #$8b
3174 : 8d ec bf STA $bfec ; (sstack + 2)
3177 : a9 7c __ LDA #$7c
3179 : 8d ed bf STA $bfed ; (sstack + 3)
317c : 38 __ __ SEC
317d : a5 57 __ LDA T2 + 0 
317f : e5 59 __ SBC T3 + 0 
3181 : 8d f2 bf STA $bff2 ; (sstack + 8)
3184 : a5 58 __ LDA T2 + 1 
3186 : e5 5a __ SBC T3 + 1 
3188 : 8d f3 bf STA $bff3 ; (sstack + 9)
318b : 38 __ __ SEC
318c : a5 5b __ LDA T4 + 0 
318e : e5 69 __ SBC T15 + 0 
3190 : 8d f4 bf STA $bff4 ; (sstack + 10)
3193 : a5 5c __ LDA T4 + 1 
3195 : e5 6a __ SBC T15 + 1 
3197 : 8d f5 bf STA $bff5 ; (sstack + 11)
319a : 20 8e 34 JSR $348e ; (bm_line.s1 + 0)
.s8:
319d : a9 03 __ LDA #$03
319f : 8d f6 bf STA $bff6 ; (sstack + 12)
31a2 : a9 e0 __ LDA #$e0
31a4 : 8d ea bf STA $bfea ; (sstack + 0)
31a7 : a9 82 __ LDA #$82
31a9 : 8d eb bf STA $bfeb ; (sstack + 1)
31ac : a9 8b __ LDA #$8b
31ae : 8d ec bf STA $bfec ; (sstack + 2)
31b1 : a9 7c __ LDA #$7c
31b3 : 8d ed bf STA $bfed ; (sstack + 3)
31b6 : 38 __ __ SEC
31b7 : a5 57 __ LDA T2 + 0 
31b9 : e5 59 __ SBC T3 + 0 
31bb : 8d ee bf STA $bfee ; (sstack + 4)
31be : a5 58 __ LDA T2 + 1 
31c0 : e5 5a __ SBC T3 + 1 
31c2 : 8d ef bf STA $bfef ; (sstack + 5)
31c5 : 38 __ __ SEC
31c6 : a5 5b __ LDA T4 + 0 
31c8 : e5 69 __ SBC T15 + 0 
31ca : 8d f0 bf STA $bff0 ; (sstack + 6)
31cd : a5 5c __ LDA T4 + 1 
31cf : e5 6a __ SBC T15 + 1 
31d1 : 8d f1 bf STA $bff1 ; (sstack + 7)
31d4 : 38 __ __ SEC
31d5 : a5 6d __ LDA T17 + 0 
31d7 : e5 59 __ SBC T3 + 0 
31d9 : 85 53 __ STA T0 + 0 
31db : 8d f2 bf STA $bff2 ; (sstack + 8)
31de : a5 6e __ LDA T17 + 1 
31e0 : e5 5a __ SBC T3 + 1 
31e2 : 85 54 __ STA T0 + 1 
31e4 : 8d f3 bf STA $bff3 ; (sstack + 9)
31e7 : 38 __ __ SEC
31e8 : a5 6b __ LDA T16 + 0 
31ea : e5 69 __ SBC T15 + 0 
31ec : 85 6f __ STA T19 + 0 
31ee : 8d f4 bf STA $bff4 ; (sstack + 10)
31f1 : a5 6c __ LDA T16 + 1 
31f3 : e5 6a __ SBC T15 + 1 
31f5 : 85 70 __ STA T19 + 1 
31f7 : 8d f5 bf STA $bff5 ; (sstack + 11)
31fa : 20 8e 34 JSR $348e ; (bm_line.s1 + 0)
31fd : a9 e0 __ LDA #$e0
31ff : 8d ea bf STA $bfea ; (sstack + 0)
3202 : a9 82 __ LDA #$82
3204 : 8d eb bf STA $bfeb ; (sstack + 1)
3207 : a9 8b __ LDA #$8b
3209 : 8d ec bf STA $bfec ; (sstack + 2)
320c : a9 7c __ LDA #$7c
320e : 8d ed bf STA $bfed ; (sstack + 3)
3211 : a5 53 __ LDA T0 + 0 
3213 : 8d ee bf STA $bfee ; (sstack + 4)
3216 : a5 54 __ LDA T0 + 1 
3218 : 8d ef bf STA $bfef ; (sstack + 5)
321b : a5 6f __ LDA T19 + 0 
321d : 8d f0 bf STA $bff0 ; (sstack + 6)
3220 : a5 70 __ LDA T19 + 1 
3222 : 8d f1 bf STA $bff1 ; (sstack + 7)
3225 : a9 03 __ LDA #$03
3227 : 8d f6 bf STA $bff6 ; (sstack + 12)
322a : 18 __ __ CLC
322b : a5 6d __ LDA T17 + 0 
322d : 65 59 __ ADC T3 + 0 
322f : 85 53 __ STA T0 + 0 
3231 : 8d f2 bf STA $bff2 ; (sstack + 8)
3234 : a5 6e __ LDA T17 + 1 
3236 : 65 5a __ ADC T3 + 1 
3238 : 85 54 __ STA T0 + 1 
323a : 8d f3 bf STA $bff3 ; (sstack + 9)
323d : 18 __ __ CLC
323e : a5 6b __ LDA T16 + 0 
3240 : 65 69 __ ADC T15 + 0 
3242 : 85 6b __ STA T16 + 0 
3244 : 8d f4 bf STA $bff4 ; (sstack + 10)
3247 : a5 6c __ LDA T16 + 1 
3249 : 65 6a __ ADC T15 + 1 
324b : 85 6c __ STA T16 + 1 
324d : 8d f5 bf STA $bff5 ; (sstack + 11)
3250 : 20 8e 34 JSR $348e ; (bm_line.s1 + 0)
3253 : a9 03 __ LDA #$03
3255 : 8d f6 bf STA $bff6 ; (sstack + 12)
3258 : 18 __ __ CLC
3259 : a5 5b __ LDA T4 + 0 
325b : 65 69 __ ADC T15 + 0 
325d : 85 5b __ STA T4 + 0 
325f : 8d f4 bf STA $bff4 ; (sstack + 10)
3262 : a5 5c __ LDA T4 + 1 
3264 : 65 6a __ ADC T15 + 1 
3266 : 85 5c __ STA T4 + 1 
3268 : 8d f5 bf STA $bff5 ; (sstack + 11)
326b : 18 __ __ CLC
326c : a5 57 __ LDA T2 + 0 
326e : 65 59 __ ADC T3 + 0 
3270 : 85 57 __ STA T2 + 0 
3272 : 8d f2 bf STA $bff2 ; (sstack + 8)
3275 : a5 58 __ LDA T2 + 1 
3277 : 65 5a __ ADC T3 + 1 
3279 : 85 58 __ STA T2 + 1 
327b : 8d f3 bf STA $bff3 ; (sstack + 9)
327e : a9 e0 __ LDA #$e0
3280 : 8d ea bf STA $bfea ; (sstack + 0)
3283 : a9 82 __ LDA #$82
3285 : 8d eb bf STA $bfeb ; (sstack + 1)
3288 : a9 8b __ LDA #$8b
328a : 8d ec bf STA $bfec ; (sstack + 2)
328d : a9 7c __ LDA #$7c
328f : 8d ed bf STA $bfed ; (sstack + 3)
3292 : a5 53 __ LDA T0 + 0 
3294 : 8d ee bf STA $bfee ; (sstack + 4)
3297 : a5 54 __ LDA T0 + 1 
3299 : 8d ef bf STA $bfef ; (sstack + 5)
329c : a5 6b __ LDA T16 + 0 
329e : 8d f0 bf STA $bff0 ; (sstack + 6)
32a1 : a5 6c __ LDA T16 + 1 
32a3 : 8d f1 bf STA $bff1 ; (sstack + 7)
32a6 : 20 8e 34 JSR $348e ; (bm_line.s1 + 0)
32a9 : a9 e0 __ LDA #$e0
32ab : 8d ea bf STA $bfea ; (sstack + 0)
32ae : a9 82 __ LDA #$82
32b0 : 8d eb bf STA $bfeb ; (sstack + 1)
32b3 : a9 8b __ LDA #$8b
32b5 : 8d ec bf STA $bfec ; (sstack + 2)
32b8 : a9 7c __ LDA #$7c
32ba : 8d ed bf STA $bfed ; (sstack + 3)
32bd : a5 57 __ LDA T2 + 0 
32bf : 8d ee bf STA $bfee ; (sstack + 4)
32c2 : a5 58 __ LDA T2 + 1 
32c4 : 8d ef bf STA $bfef ; (sstack + 5)
32c7 : a5 5b __ LDA T4 + 0 
32c9 : 8d f0 bf STA $bff0 ; (sstack + 6)
32cc : a5 5c __ LDA T4 + 1 
32ce : 8d f1 bf STA $bff1 ; (sstack + 7)
32d1 : a9 03 __ LDA #$03
32d3 : 8d f6 bf STA $bff6 ; (sstack + 12)
32d6 : 18 __ __ CLC
32d7 : a5 61 __ LDA T9 + 0 
32d9 : 65 68 __ ADC T14 + 0 
32db : 29 3f __ AND #$3f
32dd : 85 53 __ STA T0 + 0 
32df : 18 __ __ CLC
32e0 : 69 10 __ ADC #$10
32e2 : 29 3f __ AND #$3f
32e4 : aa __ __ TAX
32e5 : bd 4b 7c LDA $7c4b,x ; (sin64[0] + 0)
32e8 : 85 1b __ STA ACCU + 0 
32ea : 29 80 __ AND #$80
32ec : 10 02 __ BPL $32f0 ; (draw_gear.s8 + 339)
32ee : a9 ff __ LDA #$ff
32f0 : 85 1c __ STA ACCU + 1 
32f2 : a5 5e __ LDA T6 + 0 
32f4 : 20 92 73 JSR $7392 ; (mul16by8 + 0)
32f7 : 20 8a 78 JSR $788a ; (divs16@proxy + 0)
32fa : 18 __ __ CLC
32fb : a5 1b __ LDA ACCU + 0 
32fd : 65 67 __ ADC T13 + 0 
32ff : 85 57 __ STA T2 + 0 
3301 : 8d f2 bf STA $bff2 ; (sstack + 8)
3304 : a5 1c __ LDA ACCU + 1 
3306 : 69 00 __ ADC #$00
3308 : 85 58 __ STA T2 + 1 
330a : 8d f3 bf STA $bff3 ; (sstack + 9)
330d : a6 53 __ LDX T0 + 0 
330f : bd 4b 7c LDA $7c4b,x ; (sin64[0] + 0)
3312 : 85 1b __ STA ACCU + 0 
3314 : 29 80 __ AND #$80
3316 : 10 02 __ BPL $331a ; (draw_gear.s8 + 381)
3318 : a9 ff __ LDA #$ff
331a : 85 1c __ STA ACCU + 1 
331c : a5 5e __ LDA T6 + 0 
331e : 20 92 73 JSR $7392 ; (mul16by8 + 0)
3321 : 20 8a 78 JSR $788a ; (divs16@proxy + 0)
3324 : 18 __ __ CLC
3325 : a5 1b __ LDA ACCU + 0 
3327 : 69 58 __ ADC #$58
3329 : 85 59 __ STA T3 + 0 
332b : 8d f4 bf STA $bff4 ; (sstack + 10)
332e : a5 1c __ LDA ACCU + 1 
3330 : 69 00 __ ADC #$00
3332 : 85 5a __ STA T3 + 1 
3334 : 8d f5 bf STA $bff5 ; (sstack + 11)
3337 : 20 8e 34 JSR $348e ; (bm_line.s1 + 0)
333a : a5 57 __ LDA T2 + 0 
333c : 85 53 __ STA T0 + 0 
333e : a5 58 __ LDA T2 + 1 
3340 : 85 54 __ STA T0 + 1 
3342 : a5 59 __ LDA T3 + 0 
3344 : 85 55 __ STA T1 + 0 
3346 : a5 5a __ LDA T3 + 1 
3348 : 85 56 __ STA T1 + 1 
334a : e6 62 __ INC T10 + 0 
334c : a5 62 __ LDA T10 + 0 
334e : c5 73 __ CMP T22 + 0 
3350 : b0 03 __ BCS $3355 ; (draw_gear.s9 + 0)
3352 : 4c 37 30 JMP $3037 ; (draw_gear.l5 + 0)
.s9:
3355 : a5 57 __ LDA T2 + 0 
3357 : 8d ee bf STA $bfee ; (sstack + 4)
335a : a5 58 __ LDA T2 + 1 
335c : 8d ef bf STA $bfef ; (sstack + 5)
335f : a5 59 __ LDA T3 + 0 
3361 : 8d f0 bf STA $bff0 ; (sstack + 6)
3364 : a5 5a __ LDA T3 + 1 
3366 : 8d f1 bf STA $bff1 ; (sstack + 7)
3369 : a5 63 __ LDA T11 + 0 
336b : 8d f2 bf STA $bff2 ; (sstack + 8)
336e : a5 64 __ LDA T11 + 1 
3370 : 8d f3 bf STA $bff3 ; (sstack + 9)
3373 : a5 65 __ LDA T12 + 0 
3375 : 8d f4 bf STA $bff4 ; (sstack + 10)
3378 : a5 66 __ LDA T12 + 1 
337a : 8d f5 bf STA $bff5 ; (sstack + 11)
337d : a9 03 __ LDA #$03
337f : 8d f6 bf STA $bff6 ; (sstack + 12)
3382 : a9 e0 __ LDA #$e0
3384 : 8d ea bf STA $bfea ; (sstack + 0)
3387 : a9 82 __ LDA #$82
3389 : 8d eb bf STA $bfeb ; (sstack + 1)
338c : a9 8b __ LDA #$8b
338e : 8d ec bf STA $bfec ; (sstack + 2)
3391 : a9 7c __ LDA #$7c
3393 : 8d ed bf STA $bfed ; (sstack + 3)
3396 : 20 8e 34 JSR $348e ; (bm_line.s1 + 0)
3399 : a5 71 __ LDA T20 + 0 
339b : 85 03 __ STA WORK + 0 
339d : 85 62 __ STA T10 + 0 
339f : a9 00 __ LDA #$00
33a1 : 85 5d __ STA T5 + 0 
33a3 : 85 1c __ STA ACCU + 1 
33a5 : 85 04 __ STA WORK + 1 
33a7 : a9 40 __ LDA #$40
33a9 : 85 1b __ STA ACCU + 0 
33ab : 20 81 74 JSR $7481 ; (divmod + 0)
33ae : a5 1b __ LDA ACCU + 0 
33b0 : 85 59 __ STA T3 + 0 
.l10:
33b2 : a9 e0 __ LDA #$e0
33b4 : 8d ea bf STA $bfea ; (sstack + 0)
33b7 : a9 82 __ LDA #$82
33b9 : 8d eb bf STA $bfeb ; (sstack + 1)
33bc : a9 8b __ LDA #$8b
33be : 8d ec bf STA $bfec ; (sstack + 2)
33c1 : a9 7c __ LDA #$7c
33c3 : 8d ed bf STA $bfed ; (sstack + 3)
33c6 : a9 03 __ LDA #$03
33c8 : 8d f6 bf STA $bff6 ; (sstack + 12)
33cb : a5 5d __ LDA T5 + 0 
33cd : 85 1b __ STA ACCU + 0 
33cf : a9 00 __ LDA #$00
33d1 : 85 1c __ STA ACCU + 1 
33d3 : a5 59 __ LDA T3 + 0 
33d5 : 20 92 73 JSR $7392 ; (mul16by8 + 0)
33d8 : 18 __ __ CLC
33d9 : a5 1b __ LDA ACCU + 0 
33db : 65 5f __ ADC T7 + 0 
33dd : 29 3f __ AND #$3f
33df : 85 53 __ STA T0 + 0 
33e1 : 18 __ __ CLC
33e2 : 69 10 __ ADC #$10
33e4 : 29 3f __ AND #$3f
33e6 : aa __ __ TAX
33e7 : bd 4b 7c LDA $7c4b,x ; (sin64[0] + 0)
33ea : 85 55 __ STA T1 + 0 
33ec : 85 1b __ STA ACCU + 0 
33ee : 29 80 __ AND #$80
33f0 : 10 02 __ BPL $33f4 ; (draw_gear.l10 + 66)
33f2 : a9 ff __ LDA #$ff
33f4 : 85 56 __ STA T1 + 1 
33f6 : 85 1c __ STA ACCU + 1 
33f8 : a5 72 __ LDA T21 + 0 
33fa : 20 92 73 JSR $7392 ; (mul16by8 + 0)
33fd : 20 8a 78 JSR $788a ; (divs16@proxy + 0)
3400 : 18 __ __ CLC
3401 : a5 1b __ LDA ACCU + 0 
3403 : 65 67 __ ADC T13 + 0 
3405 : 8d ee bf STA $bfee ; (sstack + 4)
3408 : a5 1c __ LDA ACCU + 1 
340a : 69 00 __ ADC #$00
340c : 8d ef bf STA $bfef ; (sstack + 5)
340f : a6 53 __ LDX T0 + 0 
3411 : bd 4b 7c LDA $7c4b,x ; (sin64[0] + 0)
3414 : 85 53 __ STA T0 + 0 
3416 : 85 1b __ STA ACCU + 0 
3418 : 29 80 __ AND #$80
341a : 10 02 __ BPL $341e ; (draw_gear.l10 + 108)
341c : a9 ff __ LDA #$ff
341e : 85 54 __ STA T0 + 1 
3420 : 85 1c __ STA ACCU + 1 
3422 : a5 72 __ LDA T21 + 0 
3424 : 20 92 73 JSR $7392 ; (mul16by8 + 0)
3427 : 20 8a 78 JSR $788a ; (divs16@proxy + 0)
342a : 18 __ __ CLC
342b : a5 1b __ LDA ACCU + 0 
342d : 69 58 __ ADC #$58
342f : 8d f0 bf STA $bff0 ; (sstack + 6)
3432 : a5 1c __ LDA ACCU + 1 
3434 : 69 00 __ ADC #$00
3436 : 8d f1 bf STA $bff1 ; (sstack + 7)
3439 : a5 55 __ LDA T1 + 0 
343b : 85 1b __ STA ACCU + 0 
343d : a5 56 __ LDA T1 + 1 
343f : 85 1c __ STA ACCU + 1 
3441 : a5 5e __ LDA T6 + 0 
3443 : 20 92 73 JSR $7392 ; (mul16by8 + 0)
3446 : 20 8a 78 JSR $788a ; (divs16@proxy + 0)
3449 : 18 __ __ CLC
344a : a5 1b __ LDA ACCU + 0 
344c : 65 67 __ ADC T13 + 0 
344e : 8d f2 bf STA $bff2 ; (sstack + 8)
3451 : a5 1c __ LDA ACCU + 1 
3453 : 69 00 __ ADC #$00
3455 : 8d f3 bf STA $bff3 ; (sstack + 9)
3458 : a5 53 __ LDA T0 + 0 
345a : 85 1b __ STA ACCU + 0 
345c : a5 54 __ LDA T0 + 1 
345e : 85 1c __ STA ACCU + 1 
3460 : a5 5e __ LDA T6 + 0 
3462 : 20 92 73 JSR $7392 ; (mul16by8 + 0)
3465 : 20 8a 78 JSR $788a ; (divs16@proxy + 0)
3468 : 18 __ __ CLC
3469 : a5 1b __ LDA ACCU + 0 
346b : 69 58 __ ADC #$58
346d : 8d f4 bf STA $bff4 ; (sstack + 10)
3470 : a5 1c __ LDA ACCU + 1 
3472 : 69 00 __ ADC #$00
3474 : 8d f5 bf STA $bff5 ; (sstack + 11)
3477 : 20 8e 34 JSR $348e ; (bm_line.s1 + 0)
347a : e6 5d __ INC T5 + 0 
347c : c6 62 __ DEC T10 + 0 
347e : f0 03 __ BEQ $3483 ; (draw_gear.s3 + 0)
3480 : 4c b2 33 JMP $33b2 ; (draw_gear.l10 + 0)
.s3:
3483 : a2 20 __ LDX #$20
3485 : bd b0 bf LDA $bfb0,x ; (draw_gear@stack + 0)
3488 : 95 53 __ STA T0 + 0,x 
348a : ca __ __ DEX
348b : 10 f8 __ BPL $3485 ; (draw_gear.s3 + 2)
348d : 60 __ __ RTS
--------------------------------------------------------------------
bm_line: ; bm_line(const struct Bitmap*,const struct ClipRect*,i16,i16,i16,i16,u8,enum LineOp)->void
; 116, "/home/xahmol/oscar64/include/gfx/bitmap.h"
.s1:
348e : a2 0e __ LDX #$0e
3490 : b5 53 __ LDA T2 + 0,x 
3492 : 9d db bf STA $bfdb,x ; (bm_line@stack + 0)
3495 : ca __ __ DEX
3496 : 10 f8 __ BPL $3490 ; (bm_line.s1 + 2)
.s4:
3498 : ad f0 bf LDA $bff0 ; (sstack + 6)
349b : 85 55 __ STA T3 + 0 
349d : ad f1 bf LDA $bff1 ; (sstack + 7)
34a0 : 85 56 __ STA T3 + 1 
34a2 : ad f4 bf LDA $bff4 ; (sstack + 10)
34a5 : 85 53 __ STA T2 + 0 
34a7 : 38 __ __ SEC
34a8 : e5 55 __ SBC T3 + 0 
34aa : 85 57 __ STA T4 + 0 
34ac : ad f5 bf LDA $bff5 ; (sstack + 11)
34af : 85 54 __ STA T2 + 1 
34b1 : e5 56 __ SBC T3 + 1 
34b3 : 85 58 __ STA T4 + 1 
34b5 : ad f6 bf LDA $bff6 ; (sstack + 12)
34b8 : 85 61 __ STA T10 + 0 
34ba : ad ec bf LDA $bfec ; (sstack + 2)
34bd : 85 59 __ STA T5 + 0 
34bf : ad ed bf LDA $bfed ; (sstack + 3)
34c2 : 85 5a __ STA T5 + 1 
34c4 : a0 00 __ LDY #$00
34c6 : b1 59 __ LDA (T5 + 0),y 
34c8 : 85 43 __ STA T0 + 0 
34ca : c8 __ __ INY
34cb : b1 59 __ LDA (T5 + 0),y 
34cd : 85 44 __ STA T0 + 1 
34cf : a0 04 __ LDY #$04
34d1 : b1 59 __ LDA (T5 + 0),y 
34d3 : 85 45 __ STA T1 + 0 
34d5 : ad ee bf LDA $bfee ; (sstack + 4)
34d8 : 85 5d __ STA T7 + 0 
34da : ad ef bf LDA $bfef ; (sstack + 5)
34dd : 85 5e __ STA T7 + 1 
34df : ad f2 bf LDA $bff2 ; (sstack + 8)
34e2 : 85 5b __ STA T6 + 0 
34e4 : 38 __ __ SEC
34e5 : e5 5d __ SBC T7 + 0 
34e7 : 85 5f __ STA T8 + 0 
34e9 : ad f3 bf LDA $bff3 ; (sstack + 9)
34ec : 85 5c __ STA T6 + 1 
34ee : c8 __ __ INY
34ef : e5 5e __ SBC T7 + 1 
34f1 : 85 60 __ STA T8 + 1 
34f3 : 30 07 __ BMI $34fc ; (bm_line.s5 + 0)
.s82:
34f5 : 05 5f __ ORA T8 + 0 
34f7 : f0 03 __ BEQ $34fc ; (bm_line.s5 + 0)
34f9 : 4c 26 38 JMP $3826 ; (bm_line.s64 + 0)
.s5:
34fc : a5 5e __ LDA T7 + 1 
34fe : 10 03 __ BPL $3503 ; (bm_line.s63 + 0)
3500 : 4c 72 36 JMP $3672 ; (bm_line.s3 + 0)
.s63:
3503 : c5 44 __ CMP T0 + 1 
3505 : d0 04 __ BNE $350b ; (bm_line.s62 + 0)
.s61:
3507 : a5 5d __ LDA T7 + 0 
3509 : c5 43 __ CMP T0 + 0 
.s62:
350b : 90 f3 __ BCC $3500 ; (bm_line.s5 + 4)
.s6:
350d : a5 5c __ LDA T6 + 1 
350f : 10 03 __ BPL $3514 ; (bm_line.s60 + 0)
3511 : 4c cf 37 JMP $37cf ; (bm_line.s52 + 0)
.s60:
3514 : d1 59 __ CMP (T5 + 0),y 
3516 : d0 04 __ BNE $351c ; (bm_line.s59 + 0)
.s58:
3518 : a5 5b __ LDA T6 + 0 
351a : c5 45 __ CMP T1 + 0 
.s59:
351c : b0 e2 __ BCS $3500 ; (bm_line.s5 + 4)
.s7:
351e : a5 5c __ LDA T6 + 1 
3520 : c5 44 __ CMP T0 + 1 
3522 : d0 04 __ BNE $3528 ; (bm_line.s57 + 0)
.s56:
3524 : a5 5b __ LDA T6 + 0 
3526 : c5 43 __ CMP T0 + 0 
.s57:
3528 : 90 e7 __ BCC $3511 ; (bm_line.s6 + 4)
.s8:
352a : a5 5e __ LDA T7 + 1 
352c : d1 59 __ CMP (T5 + 0),y 
352e : d0 04 __ BNE $3534 ; (bm_line.s54 + 0)
.s51:
3530 : a5 5d __ LDA T7 + 0 
3532 : c5 45 __ CMP T1 + 0 
.s54:
3534 : 90 4e __ BCC $3584 ; (bm_line.s9 + 0)
.s50:
3536 : a5 57 __ LDA T4 + 0 
3538 : 85 0f __ STA P2 
353a : a5 58 __ LDA T4 + 1 
353c : 85 10 __ STA P3 
353e : a5 5f __ LDA T8 + 0 
3540 : 85 11 __ STA P4 
3542 : a5 60 __ LDA T8 + 1 
3544 : 85 12 __ STA P5 
3546 : 18 __ __ CLC
3547 : a5 5d __ LDA T7 + 0 
3549 : 69 01 __ ADC #$01
354b : a8 __ __ TAY
354c : a5 5e __ LDA T7 + 1 
354e : 69 00 __ ADC #$00
3550 : aa __ __ TAX
3551 : 98 __ __ TYA
3552 : 38 __ __ SEC
3553 : a0 04 __ LDY #$04
3555 : f1 59 __ SBC (T5 + 0),y 
3557 : 85 0d __ STA P0 
3559 : 8a __ __ TXA
355a : c8 __ __ INY
355b : f1 59 __ SBC (T5 + 0),y 
355d : 85 0e __ STA P1 
355f : 20 08 39 JSR $3908 ; (lmuldiv16s.s4 + 0)
3562 : 38 __ __ SEC
3563 : a5 55 __ LDA T3 + 0 
3565 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
3567 : 8d f0 bf STA $bff0 ; (sstack + 6)
356a : a5 56 __ LDA T3 + 1 
356c : e5 1c __ SBC ACCU + 1 ; (clip + 1)
356e : 8d f1 bf STA $bff1 ; (sstack + 7)
3571 : a0 04 __ LDY #$04
3573 : b1 59 __ LDA (T5 + 0),y 
3575 : 38 __ __ SEC
3576 : e9 01 __ SBC #$01
3578 : aa __ __ TAX
3579 : c8 __ __ INY
357a : b1 59 __ LDA (T5 + 0),y 
357c : 8e ee bf STX $bfee ; (sstack + 4)
357f : e9 00 __ SBC #$00
3581 : 8d ef bf STA $bfef ; (sstack + 5)
.s9:
3584 : a0 02 __ LDY #$02
3586 : b1 59 __ LDA (T5 + 0),y 
3588 : 85 43 __ STA T0 + 0 
358a : c8 __ __ INY
358b : b1 59 __ LDA (T5 + 0),y 
358d : 85 44 __ STA T0 + 1 
358f : a0 06 __ LDY #$06
3591 : b1 59 __ LDA (T5 + 0),y 
3593 : 85 45 __ STA T1 + 0 
3595 : c8 __ __ INY
3596 : a5 58 __ LDA T4 + 1 
3598 : 30 07 __ BMI $35a1 ; (bm_line.s10 + 0)
.s49:
359a : 05 57 __ ORA T4 + 0 
359c : f0 03 __ BEQ $35a1 ; (bm_line.s10 + 0)
359e : 4c d7 36 JMP $36d7 ; (bm_line.s30 + 0)
.s10:
35a1 : ad f0 bf LDA $bff0 ; (sstack + 6)
35a4 : 85 55 __ STA T3 + 0 
35a6 : ad f1 bf LDA $bff1 ; (sstack + 7)
35a9 : 10 03 __ BPL $35ae ; (bm_line.s29 + 0)
35ab : 4c 72 36 JMP $3672 ; (bm_line.s3 + 0)
.s29:
35ae : 85 56 __ STA T3 + 1 
35b0 : c5 44 __ CMP T0 + 1 
35b2 : d0 04 __ BNE $35b8 ; (bm_line.s28 + 0)
.s27:
35b4 : a5 55 __ LDA T3 + 0 
35b6 : c5 43 __ CMP T0 + 0 
.s28:
35b8 : 90 f1 __ BCC $35ab ; (bm_line.s10 + 10)
.s11:
35ba : ad f5 bf LDA $bff5 ; (sstack + 11)
35bd : 10 03 __ BPL $35c2 ; (bm_line.s26 + 0)
35bf : 4c 7d 36 JMP $367d ; (bm_line.s17 + 0)
.s26:
35c2 : d1 59 __ CMP (T5 + 0),y 
35c4 : d0 05 __ BNE $35cb ; (bm_line.s25 + 0)
.s24:
35c6 : ad f4 bf LDA $bff4 ; (sstack + 10)
35c9 : c5 45 __ CMP T1 + 0 
.s25:
35cb : b0 de __ BCS $35ab ; (bm_line.s10 + 10)
.s12:
35cd : ad f5 bf LDA $bff5 ; (sstack + 11)
35d0 : 30 ed __ BMI $35bf ; (bm_line.s11 + 5)
.s23:
35d2 : c5 44 __ CMP T0 + 1 
35d4 : d0 05 __ BNE $35db ; (bm_line.s22 + 0)
.s21:
35d6 : ad f4 bf LDA $bff4 ; (sstack + 10)
35d9 : c5 43 __ CMP T0 + 0 
.s22:
35db : 90 e2 __ BCC $35bf ; (bm_line.s11 + 5)
.s13:
35dd : a5 56 __ LDA T3 + 1 
35df : d1 59 __ CMP (T5 + 0),y 
35e1 : d0 04 __ BNE $35e7 ; (bm_line.s19 + 0)
.s16:
35e3 : a5 55 __ LDA T3 + 0 
35e5 : c5 45 __ CMP T1 + 0 
.s19:
35e7 : 90 50 __ BCC $3639 ; (bm_line.s14 + 0)
.s15:
35e9 : a5 5f __ LDA T8 + 0 
35eb : 85 0f __ STA P2 
35ed : a5 60 __ LDA T8 + 1 
35ef : 85 10 __ STA P3 
35f1 : a5 57 __ LDA T4 + 0 
35f3 : 85 11 __ STA P4 
35f5 : a5 58 __ LDA T4 + 1 
35f7 : 85 12 __ STA P5 
35f9 : 18 __ __ CLC
35fa : a5 55 __ LDA T3 + 0 
35fc : 69 01 __ ADC #$01
35fe : a8 __ __ TAY
35ff : a5 56 __ LDA T3 + 1 
3601 : 69 00 __ ADC #$00
3603 : aa __ __ TAX
3604 : 98 __ __ TYA
3605 : 38 __ __ SEC
3606 : a0 06 __ LDY #$06
3608 : f1 59 __ SBC (T5 + 0),y 
360a : 85 0d __ STA P0 
360c : 8a __ __ TXA
360d : c8 __ __ INY
360e : f1 59 __ SBC (T5 + 0),y 
3610 : 85 0e __ STA P1 
3612 : 20 08 39 JSR $3908 ; (lmuldiv16s.s4 + 0)
3615 : ad ee bf LDA $bfee ; (sstack + 4)
3618 : 38 __ __ SEC
3619 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
361b : 8d ee bf STA $bfee ; (sstack + 4)
361e : ad ef bf LDA $bfef ; (sstack + 5)
3621 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
3623 : 8d ef bf STA $bfef ; (sstack + 5)
3626 : a0 06 __ LDY #$06
3628 : b1 59 __ LDA (T5 + 0),y 
362a : 38 __ __ SEC
362b : e9 01 __ SBC #$01
362d : aa __ __ TAX
362e : c8 __ __ INY
362f : b1 59 __ LDA (T5 + 0),y 
3631 : 8e f0 bf STX $bff0 ; (sstack + 6)
3634 : e9 00 __ SBC #$00
3636 : 8d f1 bf STA $bff1 ; (sstack + 7)
.s14:
3639 : ad ea bf LDA $bfea ; (sstack + 0)
363c : 85 0d __ STA P0 
363e : ad eb bf LDA $bfeb ; (sstack + 1)
3641 : 85 0e __ STA P1 
3643 : ad ee bf LDA $bfee ; (sstack + 4)
3646 : 85 0f __ STA P2 
3648 : ad ef bf LDA $bfef ; (sstack + 5)
364b : 85 10 __ STA P3 
364d : ad f0 bf LDA $bff0 ; (sstack + 6)
3650 : 85 11 __ STA P4 
3652 : ad f1 bf LDA $bff1 ; (sstack + 7)
3655 : 85 12 __ STA P5 
3657 : ad f2 bf LDA $bff2 ; (sstack + 8)
365a : 85 13 __ STA P6 
365c : ad f3 bf LDA $bff3 ; (sstack + 9)
365f : 85 14 __ STA P7 
3661 : ad f4 bf LDA $bff4 ; (sstack + 10)
3664 : 85 15 __ STA P8 
3666 : ad f5 bf LDA $bff5 ; (sstack + 11)
3669 : 85 16 __ STA P9 
366b : a5 61 __ LDA T10 + 0 
366d : 85 18 __ STA P11 
366f : 20 c7 39 JSR $39c7 ; (bmu_line.s4 + 0)
.s3:
3672 : a2 0e __ LDX #$0e
3674 : bd db bf LDA $bfdb,x ; (bm_line@stack + 0)
3677 : 95 53 __ STA T2 + 0,x 
3679 : ca __ __ DEX
367a : 10 f8 __ BPL $3674 ; (bm_line.s3 + 2)
367c : 60 __ __ RTS
.s17:
367d : a5 5f __ LDA T8 + 0 
367f : 85 0f __ STA P2 
3681 : a5 60 __ LDA T8 + 1 
3683 : 85 10 __ STA P3 
3685 : a5 57 __ LDA T4 + 0 
3687 : 85 11 __ STA P4 
3689 : a5 58 __ LDA T4 + 1 
368b : 85 12 __ STA P5 
368d : 38 __ __ SEC
368e : a5 43 __ LDA T0 + 0 
3690 : ed f4 bf SBC $bff4 ; (sstack + 10)
3693 : 85 0d __ STA P0 
3695 : a5 44 __ LDA T0 + 1 
3697 : ed f5 bf SBC $bff5 ; (sstack + 11)
369a : 85 0e __ STA P1 
369c : 20 08 39 JSR $3908 ; (lmuldiv16s.s4 + 0)
369f : a0 02 __ LDY #$02
36a1 : b1 59 __ LDA (T5 + 0),y 
36a3 : 8d f4 bf STA $bff4 ; (sstack + 10)
36a6 : c8 __ __ INY
36a7 : b1 59 __ LDA (T5 + 0),y 
36a9 : 8d f5 bf STA $bff5 ; (sstack + 11)
36ac : ad f2 bf LDA $bff2 ; (sstack + 8)
36af : 18 __ __ CLC
36b0 : 65 1b __ ADC ACCU + 0 ; (clip + 0)
36b2 : 8d f2 bf STA $bff2 ; (sstack + 8)
36b5 : ad f3 bf LDA $bff3 ; (sstack + 9)
36b8 : 65 1c __ ADC ACCU + 1 ; (clip + 1)
36ba : 8d f3 bf STA $bff3 ; (sstack + 9)
36bd : a0 07 __ LDY #$07
36bf : b1 59 __ LDA (T5 + 0),y 
36c1 : 10 03 __ BPL $36c6 ; (bm_line.s20 + 0)
36c3 : 4c e9 35 JMP $35e9 ; (bm_line.s15 + 0)
.s20:
36c6 : a5 56 __ LDA T3 + 1 
36c8 : d1 59 __ CMP (T5 + 0),y 
36ca : f0 03 __ BEQ $36cf ; (bm_line.s18 + 0)
36cc : 4c e7 35 JMP $35e7 ; (bm_line.s19 + 0)
.s18:
36cf : a5 55 __ LDA T3 + 0 
36d1 : 88 __ __ DEY
36d2 : d1 59 __ CMP (T5 + 0),y 
36d4 : 4c e7 35 JMP $35e7 ; (bm_line.s19 + 0)
.s30:
36d7 : ad f4 bf LDA $bff4 ; (sstack + 10)
36da : 85 55 __ STA T3 + 0 
36dc : ad f5 bf LDA $bff5 ; (sstack + 11)
36df : 30 91 __ BMI $3672 ; (bm_line.s3 + 0)
.s48:
36e1 : 85 56 __ STA T3 + 1 
36e3 : c5 44 __ CMP T0 + 1 
36e5 : d0 04 __ BNE $36eb ; (bm_line.s47 + 0)
.s46:
36e7 : a5 55 __ LDA T3 + 0 
36e9 : c5 43 __ CMP T0 + 0 
.s47:
36eb : 90 85 __ BCC $3672 ; (bm_line.s3 + 0)
.s31:
36ed : ad f1 bf LDA $bff1 ; (sstack + 7)
36f0 : 10 03 __ BPL $36f5 ; (bm_line.s45 + 0)
36f2 : 4c 75 37 JMP $3775 ; (bm_line.s36 + 0)
.s45:
36f5 : d1 59 __ CMP (T5 + 0),y 
36f7 : d0 05 __ BNE $36fe ; (bm_line.s44 + 0)
.s43:
36f9 : ad f0 bf LDA $bff0 ; (sstack + 6)
36fc : c5 45 __ CMP T1 + 0 
.s44:
36fe : 90 03 __ BCC $3703 ; (bm_line.s32 + 0)
3700 : 4c 72 36 JMP $3672 ; (bm_line.s3 + 0)
.s32:
3703 : ad f1 bf LDA $bff1 ; (sstack + 7)
3706 : 30 6d __ BMI $3775 ; (bm_line.s36 + 0)
.s42:
3708 : c5 44 __ CMP T0 + 1 
370a : d0 05 __ BNE $3711 ; (bm_line.s41 + 0)
.s40:
370c : ad f0 bf LDA $bff0 ; (sstack + 6)
370f : c5 43 __ CMP T0 + 0 
.s41:
3711 : 90 62 __ BCC $3775 ; (bm_line.s36 + 0)
.s33:
3713 : a5 56 __ LDA T3 + 1 
3715 : d1 59 __ CMP (T5 + 0),y 
3717 : d0 04 __ BNE $371d ; (bm_line.s38 + 0)
.s35:
3719 : a5 55 __ LDA T3 + 0 
371b : c5 45 __ CMP T1 + 0 
.s38:
371d : b0 03 __ BCS $3722 ; (bm_line.s34 + 0)
371f : 4c 39 36 JMP $3639 ; (bm_line.s14 + 0)
.s34:
3722 : a5 5f __ LDA T8 + 0 
3724 : 85 0f __ STA P2 
3726 : a5 60 __ LDA T8 + 1 
3728 : 85 10 __ STA P3 
372a : a5 57 __ LDA T4 + 0 
372c : 85 11 __ STA P4 
372e : a5 58 __ LDA T4 + 1 
3730 : 85 12 __ STA P5 
3732 : 18 __ __ CLC
3733 : a5 55 __ LDA T3 + 0 
3735 : 69 01 __ ADC #$01
3737 : a8 __ __ TAY
3738 : a5 56 __ LDA T3 + 1 
373a : 69 00 __ ADC #$00
373c : aa __ __ TAX
373d : 98 __ __ TYA
373e : 38 __ __ SEC
373f : a0 06 __ LDY #$06
3741 : f1 59 __ SBC (T5 + 0),y 
3743 : 85 0d __ STA P0 
3745 : 8a __ __ TXA
3746 : c8 __ __ INY
3747 : f1 59 __ SBC (T5 + 0),y 
3749 : 85 0e __ STA P1 
374b : 20 08 39 JSR $3908 ; (lmuldiv16s.s4 + 0)
374e : ad f2 bf LDA $bff2 ; (sstack + 8)
3751 : 38 __ __ SEC
3752 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
3754 : 8d f2 bf STA $bff2 ; (sstack + 8)
3757 : ad f3 bf LDA $bff3 ; (sstack + 9)
375a : e5 1c __ SBC ACCU + 1 ; (clip + 1)
375c : 8d f3 bf STA $bff3 ; (sstack + 9)
375f : a0 06 __ LDY #$06
3761 : b1 59 __ LDA (T5 + 0),y 
3763 : 38 __ __ SEC
3764 : e9 01 __ SBC #$01
3766 : aa __ __ TAX
3767 : c8 __ __ INY
3768 : b1 59 __ LDA (T5 + 0),y 
376a : 8e f4 bf STX $bff4 ; (sstack + 10)
376d : e9 00 __ SBC #$00
376f : 8d f5 bf STA $bff5 ; (sstack + 11)
3772 : 4c 39 36 JMP $3639 ; (bm_line.s14 + 0)
.s36:
3775 : a5 5f __ LDA T8 + 0 
3777 : 85 0f __ STA P2 
3779 : a5 60 __ LDA T8 + 1 
377b : 85 10 __ STA P3 
377d : a5 57 __ LDA T4 + 0 
377f : 85 11 __ STA P4 
3781 : a5 58 __ LDA T4 + 1 
3783 : 85 12 __ STA P5 
3785 : 38 __ __ SEC
3786 : a5 43 __ LDA T0 + 0 
3788 : ed f0 bf SBC $bff0 ; (sstack + 6)
378b : 85 0d __ STA P0 
378d : a5 44 __ LDA T0 + 1 
378f : ed f1 bf SBC $bff1 ; (sstack + 7)
3792 : 85 0e __ STA P1 
3794 : 20 08 39 JSR $3908 ; (lmuldiv16s.s4 + 0)
3797 : a0 02 __ LDY #$02
3799 : b1 59 __ LDA (T5 + 0),y 
379b : 8d f0 bf STA $bff0 ; (sstack + 6)
379e : c8 __ __ INY
379f : b1 59 __ LDA (T5 + 0),y 
37a1 : 8d f1 bf STA $bff1 ; (sstack + 7)
37a4 : ad ee bf LDA $bfee ; (sstack + 4)
37a7 : 18 __ __ CLC
37a8 : 65 1b __ ADC ACCU + 0 ; (clip + 0)
37aa : 8d ee bf STA $bfee ; (sstack + 4)
37ad : ad ef bf LDA $bfef ; (sstack + 5)
37b0 : 65 1c __ ADC ACCU + 1 ; (clip + 1)
37b2 : 8d ef bf STA $bfef ; (sstack + 5)
37b5 : a0 07 __ LDY #$07
37b7 : b1 59 __ LDA (T5 + 0),y 
37b9 : 10 03 __ BPL $37be ; (bm_line.s39 + 0)
37bb : 4c 22 37 JMP $3722 ; (bm_line.s34 + 0)
.s39:
37be : a5 56 __ LDA T3 + 1 
37c0 : d1 59 __ CMP (T5 + 0),y 
37c2 : f0 03 __ BEQ $37c7 ; (bm_line.s37 + 0)
37c4 : 4c 1d 37 JMP $371d ; (bm_line.s38 + 0)
.s37:
37c7 : a5 55 __ LDA T3 + 0 
37c9 : 88 __ __ DEY
37ca : d1 59 __ CMP (T5 + 0),y 
37cc : 4c 1d 37 JMP $371d ; (bm_line.s38 + 0)
.s52:
37cf : a5 57 __ LDA T4 + 0 
37d1 : 85 0f __ STA P2 
37d3 : a5 58 __ LDA T4 + 1 
37d5 : 85 10 __ STA P3 
37d7 : a5 5f __ LDA T8 + 0 
37d9 : 85 11 __ STA P4 
37db : a5 60 __ LDA T8 + 1 
37dd : 85 12 __ STA P5 
37df : 38 __ __ SEC
37e0 : a5 43 __ LDA T0 + 0 
37e2 : e5 5b __ SBC T6 + 0 
37e4 : 85 0d __ STA P0 
37e6 : a5 44 __ LDA T0 + 1 
37e8 : e5 5c __ SBC T6 + 1 
37ea : 85 0e __ STA P1 
37ec : 20 08 39 JSR $3908 ; (lmuldiv16s.s4 + 0)
37ef : 18 __ __ CLC
37f0 : a5 1b __ LDA ACCU + 0 ; (clip + 0)
37f2 : 65 53 __ ADC T2 + 0 
37f4 : aa __ __ TAX
37f5 : a0 00 __ LDY #$00
37f7 : b1 59 __ LDA (T5 + 0),y 
37f9 : 8d f2 bf STA $bff2 ; (sstack + 8)
37fc : c8 __ __ INY
37fd : b1 59 __ LDA (T5 + 0),y 
37ff : 8e f4 bf STX $bff4 ; (sstack + 10)
3802 : 8d f3 bf STA $bff3 ; (sstack + 9)
3805 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
3807 : 65 54 __ ADC T2 + 1 
3809 : 8d f5 bf STA $bff5 ; (sstack + 11)
380c : a0 05 __ LDY #$05
380e : b1 59 __ LDA (T5 + 0),y 
3810 : 10 03 __ BPL $3815 ; (bm_line.s55 + 0)
3812 : 4c 36 35 JMP $3536 ; (bm_line.s50 + 0)
.s55:
3815 : a5 5e __ LDA T7 + 1 
3817 : d1 59 __ CMP (T5 + 0),y 
3819 : f0 03 __ BEQ $381e ; (bm_line.s53 + 0)
381b : 4c 34 35 JMP $3534 ; (bm_line.s54 + 0)
.s53:
381e : a5 5d __ LDA T7 + 0 
3820 : 88 __ __ DEY
3821 : d1 59 __ CMP (T5 + 0),y 
3823 : 4c 34 35 JMP $3534 ; (bm_line.s54 + 0)
.s64:
3826 : a5 5c __ LDA T6 + 1 
3828 : 10 03 __ BPL $382d ; (bm_line.s81 + 0)
382a : 4c 72 36 JMP $3672 ; (bm_line.s3 + 0)
.s81:
382d : c5 44 __ CMP T0 + 1 
382f : d0 04 __ BNE $3835 ; (bm_line.s80 + 0)
.s79:
3831 : a5 5b __ LDA T6 + 0 
3833 : c5 43 __ CMP T0 + 0 
.s80:
3835 : 90 f3 __ BCC $382a ; (bm_line.s64 + 4)
.s65:
3837 : a5 5e __ LDA T7 + 1 
3839 : 30 76 __ BMI $38b1 ; (bm_line.s70 + 0)
.s78:
383b : d1 59 __ CMP (T5 + 0),y 
383d : d0 04 __ BNE $3843 ; (bm_line.s77 + 0)
.s76:
383f : a5 5d __ LDA T7 + 0 
3841 : c5 45 __ CMP T1 + 0 
.s77:
3843 : b0 e5 __ BCS $382a ; (bm_line.s64 + 4)
.s66:
3845 : a5 5e __ LDA T7 + 1 
3847 : c5 44 __ CMP T0 + 1 
3849 : d0 04 __ BNE $384f ; (bm_line.s75 + 0)
.s74:
384b : a5 5d __ LDA T7 + 0 
384d : c5 43 __ CMP T0 + 0 
.s75:
384f : 90 60 __ BCC $38b1 ; (bm_line.s70 + 0)
.s67:
3851 : a5 5c __ LDA T6 + 1 
3853 : d1 59 __ CMP (T5 + 0),y 
3855 : d0 04 __ BNE $385b ; (bm_line.s72 + 0)
.s69:
3857 : a5 5b __ LDA T6 + 0 
3859 : c5 45 __ CMP T1 + 0 
.s72:
385b : b0 03 __ BCS $3860 ; (bm_line.s68 + 0)
385d : 4c 84 35 JMP $3584 ; (bm_line.s9 + 0)
.s68:
3860 : a5 57 __ LDA T4 + 0 
3862 : 85 0f __ STA P2 
3864 : a5 58 __ LDA T4 + 1 
3866 : 85 10 __ STA P3 
3868 : a5 5f __ LDA T8 + 0 
386a : 85 11 __ STA P4 
386c : a5 60 __ LDA T8 + 1 
386e : 85 12 __ STA P5 
3870 : 18 __ __ CLC
3871 : a5 5b __ LDA T6 + 0 
3873 : 69 01 __ ADC #$01
3875 : a8 __ __ TAY
3876 : a5 5c __ LDA T6 + 1 
3878 : 69 00 __ ADC #$00
387a : aa __ __ TAX
387b : 98 __ __ TYA
387c : 38 __ __ SEC
387d : a0 04 __ LDY #$04
387f : f1 59 __ SBC (T5 + 0),y 
3881 : 85 0d __ STA P0 
3883 : 8a __ __ TXA
3884 : c8 __ __ INY
3885 : f1 59 __ SBC (T5 + 0),y 
3887 : 85 0e __ STA P1 
3889 : 20 08 39 JSR $3908 ; (lmuldiv16s.s4 + 0)
388c : 38 __ __ SEC
388d : a5 53 __ LDA T2 + 0 
388f : e5 1b __ SBC ACCU + 0 ; (clip + 0)
3891 : 8d f4 bf STA $bff4 ; (sstack + 10)
3894 : a5 54 __ LDA T2 + 1 
3896 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
3898 : 8d f5 bf STA $bff5 ; (sstack + 11)
389b : a0 04 __ LDY #$04
389d : b1 59 __ LDA (T5 + 0),y 
389f : 38 __ __ SEC
38a0 : e9 01 __ SBC #$01
38a2 : aa __ __ TAX
38a3 : c8 __ __ INY
38a4 : b1 59 __ LDA (T5 + 0),y 
38a6 : 8e f2 bf STX $bff2 ; (sstack + 8)
38a9 : e9 00 __ SBC #$00
38ab : 8d f3 bf STA $bff3 ; (sstack + 9)
38ae : 4c 84 35 JMP $3584 ; (bm_line.s9 + 0)
.s70:
38b1 : a5 57 __ LDA T4 + 0 
38b3 : 85 0f __ STA P2 
38b5 : a5 58 __ LDA T4 + 1 
38b7 : 85 10 __ STA P3 
38b9 : a5 5f __ LDA T8 + 0 
38bb : 85 11 __ STA P4 
38bd : a5 60 __ LDA T8 + 1 
38bf : 85 12 __ STA P5 
38c1 : 38 __ __ SEC
38c2 : a5 43 __ LDA T0 + 0 
38c4 : e5 5d __ SBC T7 + 0 
38c6 : 85 0d __ STA P0 
38c8 : a5 44 __ LDA T0 + 1 
38ca : e5 5e __ SBC T7 + 1 
38cc : 85 0e __ STA P1 
38ce : 20 08 39 JSR $3908 ; (lmuldiv16s.s4 + 0)
38d1 : 18 __ __ CLC
38d2 : a5 1b __ LDA ACCU + 0 ; (clip + 0)
38d4 : 65 55 __ ADC T3 + 0 
38d6 : aa __ __ TAX
38d7 : a0 00 __ LDY #$00
38d9 : b1 59 __ LDA (T5 + 0),y 
38db : 8d ee bf STA $bfee ; (sstack + 4)
38de : c8 __ __ INY
38df : b1 59 __ LDA (T5 + 0),y 
38e1 : 8e f0 bf STX $bff0 ; (sstack + 6)
38e4 : 8d ef bf STA $bfef ; (sstack + 5)
38e7 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
38e9 : 65 56 __ ADC T3 + 1 
38eb : 8d f1 bf STA $bff1 ; (sstack + 7)
38ee : a0 05 __ LDY #$05
38f0 : b1 59 __ LDA (T5 + 0),y 
38f2 : 10 03 __ BPL $38f7 ; (bm_line.s73 + 0)
38f4 : 4c 60 38 JMP $3860 ; (bm_line.s68 + 0)
.s73:
38f7 : a5 5c __ LDA T6 + 1 
38f9 : d1 59 __ CMP (T5 + 0),y 
38fb : f0 03 __ BEQ $3900 ; (bm_line.s71 + 0)
38fd : 4c 5b 38 JMP $385b ; (bm_line.s72 + 0)
.s71:
3900 : a5 5b __ LDA T6 + 0 
3902 : 88 __ __ DEY
3903 : d1 59 __ CMP (T5 + 0),y 
3905 : 4c 5b 38 JMP $385b ; (bm_line.s72 + 0)
--------------------------------------------------------------------
lmuldiv16s: ; lmuldiv16s(i16,i16,i16)->i16
;  42, "/home/xahmol/oscar64/include/fixmath.h"
.s4:
3908 : a9 00 __ LDA #$00
390a : 24 0e __ BIT P1 ; (a + 1)
390c : 10 0d __ BPL $391b ; (lmuldiv16s.s5 + 0)
.s10:
390e : 38 __ __ SEC
390f : e5 0d __ SBC P0 ; (a + 0)
3911 : 85 0d __ STA P0 ; (a + 0)
3913 : a9 00 __ LDA #$00
3915 : e5 0e __ SBC P1 ; (a + 1)
3917 : 85 0e __ STA P1 ; (a + 1)
3919 : a9 01 __ LDA #$01
.s5:
391b : 85 43 __ STA T1 + 0 
391d : 24 10 __ BIT P3 ; (b + 1)
391f : 10 14 __ BPL $3935 ; (lmuldiv16s.s6 + 0)
.s9:
3921 : 38 __ __ SEC
3922 : a9 00 __ LDA #$00
3924 : e5 0f __ SBC P2 ; (b + 0)
3926 : 85 0f __ STA P2 ; (b + 0)
3928 : a9 00 __ LDA #$00
392a : e5 10 __ SBC P3 ; (b + 1)
392c : 85 10 __ STA P3 ; (b + 1)
392e : a9 00 __ LDA #$00
3930 : c5 43 __ CMP T1 + 0 
3932 : 2a __ __ ROL
3933 : 85 43 __ STA T1 + 0 
.s6:
3935 : 24 12 __ BIT P5 ; (c + 1)
3937 : 10 14 __ BPL $394d ; (lmuldiv16s.s7 + 0)
.s8:
3939 : 38 __ __ SEC
393a : a9 00 __ LDA #$00
393c : e5 11 __ SBC P4 ; (c + 0)
393e : 85 11 __ STA P4 ; (c + 0)
3940 : a9 00 __ LDA #$00
3942 : e5 12 __ SBC P5 ; (c + 1)
3944 : 85 12 __ STA P5 ; (c + 1)
3946 : a9 00 __ LDA #$00
3948 : c5 43 __ CMP T1 + 0 
394a : 2a __ __ ROL
394b : 85 43 __ STA T1 + 0 
.s7:
394d : a9 00 __ LDA #$00
394f : 85 05 __ STA WORK + 2 
3951 : 85 06 __ STA WORK + 3 
3953 : a5 0d __ LDA P0 ; (a + 0)
3955 : 38 __ __ SEC
3956 : a0 08 __ LDY #$08
3958 : 6a __ __ ROR
3959 : 90 0f __ BCC $396a ; (lmuldiv16s.s7 + 29)
395b : aa __ __ TAX
395c : 18 __ __ CLC
395d : a5 05 __ LDA WORK + 2 
395f : 65 0f __ ADC P2 ; (b + 0)
3961 : 85 05 __ STA WORK + 2 
3963 : a5 06 __ LDA WORK + 3 
3965 : 65 10 __ ADC P3 ; (b + 1)
3967 : 85 06 __ STA WORK + 3 
3969 : 8a __ __ TXA
396a : 66 06 __ ROR WORK + 3 
396c : 66 05 __ ROR WORK + 2 
396e : 88 __ __ DEY
396f : d0 e7 __ BNE $3958 ; (lmuldiv16s.s7 + 11)
3971 : 6a __ __ ROR
3972 : 90 07 __ BCC $397b ; (lmuldiv16s.s7 + 46)
3974 : 85 03 __ STA WORK + 0 
3976 : a5 0e __ LDA P1 ; (a + 1)
3978 : 18 __ __ CLC
3979 : 90 db __ BCC $3956 ; (lmuldiv16s.s7 + 9)
397b : 38 __ __ SEC
397c : 85 04 __ STA WORK + 1 
397e : a2 08 __ LDX #$08
3980 : 26 04 __ ROL WORK + 1 
3982 : 26 05 __ ROL WORK + 2 
3984 : 26 06 __ ROL WORK + 3 
3986 : 90 0c __ BCC $3994 ; (lmuldiv16s.s7 + 71)
3988 : a5 05 __ LDA WORK + 2 
398a : e5 11 __ SBC P4 ; (c + 0)
398c : a8 __ __ TAY
398d : a5 06 __ LDA WORK + 3 
398f : e5 12 __ SBC P5 ; (c + 1)
3991 : 38 __ __ SEC
3992 : b0 0c __ BCS $39a0 ; (lmuldiv16s.s7 + 83)
3994 : 38 __ __ SEC
3995 : a5 05 __ LDA WORK + 2 
3997 : e5 11 __ SBC P4 ; (c + 0)
3999 : a8 __ __ TAY
399a : a5 06 __ LDA WORK + 3 
399c : e5 12 __ SBC P5 ; (c + 1)
399e : 90 04 __ BCC $39a4 ; (lmuldiv16s.s7 + 87)
39a0 : 85 06 __ STA WORK + 3 
39a2 : 84 05 __ STY WORK + 2 
39a4 : ca __ __ DEX
39a5 : d0 d9 __ BNE $3980 ; (lmuldiv16s.s7 + 51)
39a7 : a5 04 __ LDA WORK + 1 
39a9 : 2a __ __ ROL
39aa : 90 07 __ BCC $39b3 ; (lmuldiv16s.s7 + 102)
39ac : 85 1c __ STA ACCU + 1 
39ae : a5 03 __ LDA WORK + 0 
39b0 : 18 __ __ CLC
39b1 : 90 c9 __ BCC $397c ; (lmuldiv16s.s7 + 47)
39b3 : 85 1b __ STA ACCU + 0 
39b5 : a5 43 __ LDA T1 + 0 
39b7 : f0 0d __ BEQ $39c6 ; (lmuldiv16s.s3 + 0)
39b9 : 38 __ __ SEC
39ba : a9 00 __ LDA #$00
39bc : e5 1b __ SBC ACCU + 0 
39be : 85 1b __ STA ACCU + 0 
39c0 : a9 00 __ LDA #$00
39c2 : e5 1c __ SBC ACCU + 1 
39c4 : 85 1c __ STA ACCU + 1 
.s3:
39c6 : 60 __ __ RTS
--------------------------------------------------------------------
bmu_line: ; bmu_line(const struct Bitmap*,i16,i16,i16,i16,u8,enum LineOp)->void
; 113, "/home/xahmol/oscar64/include/gfx/bitmap.h"
.s4:
39c7 : a5 18 __ LDA P11 ; (op + 0)
39c9 : d0 02 __ BNE $39cd ; (bmu_line.s6 + 0)
.s5:
39cb : e6 18 __ INC P11 ; (op + 0)
.s6:
39cd : 38 __ __ SEC
39ce : a5 13 __ LDA P6 ; (x1 + 0)
39d0 : e5 0f __ SBC P2 ; (x0 + 0)
39d2 : 85 46 __ STA T2 + 0 
39d4 : a5 14 __ LDA P7 ; (x1 + 1)
39d6 : e5 10 __ SBC P3 ; (x0 + 1)
39d8 : 85 47 __ STA T2 + 1 
39da : 10 11 __ BPL $39ed ; (bmu_line.s7 + 0)
.s52:
39dc : 38 __ __ SEC
39dd : a9 00 __ LDA #$00
39df : e5 46 __ SBC T2 + 0 
39e1 : 85 46 __ STA T2 + 0 
39e3 : a9 00 __ LDA #$00
39e5 : e5 47 __ SBC T2 + 1 
39e7 : 85 47 __ STA T2 + 1 
39e9 : a9 01 __ LDA #$01
39eb : d0 02 __ BNE $39ef ; (bmu_line.s8 + 0)
.s7:
39ed : a9 00 __ LDA #$00
.s8:
39ef : 85 51 __ STA T11 + 0 
39f1 : 38 __ __ SEC
39f2 : a5 15 __ LDA P8 ; (y1 + 0)
39f4 : e5 11 __ SBC P4 ; (y0 + 0)
39f6 : 85 43 __ STA T0 + 0 
39f8 : a5 16 __ LDA P9 ; (y1 + 1)
39fa : e5 12 __ SBC P5 ; (y0 + 1)
39fc : 85 44 __ STA T0 + 1 
39fe : 10 11 __ BPL $3a11 ; (bmu_line.s9 + 0)
.s51:
3a00 : 38 __ __ SEC
3a01 : a9 00 __ LDA #$00
3a03 : e5 43 __ SBC T0 + 0 
3a05 : 85 43 __ STA T0 + 0 
3a07 : a9 00 __ LDA #$00
3a09 : e5 44 __ SBC T0 + 1 
3a0b : 85 44 __ STA T0 + 1 
3a0d : a9 01 __ LDA #$01
3a0f : d0 02 __ BNE $3a13 ; (bmu_line.s10 + 0)
.s9:
3a11 : a9 00 __ LDA #$00
.s10:
3a13 : 85 52 __ STA T12 + 0 
3a15 : a5 44 __ LDA T0 + 1 
3a17 : c5 47 __ CMP T2 + 1 
3a19 : d0 04 __ BNE $3a1f ; (bmu_line.s50 + 0)
.s49:
3a1b : a5 43 __ LDA T0 + 0 
3a1d : c5 46 __ CMP T2 + 0 
.s50:
3a1f : b0 06 __ BCS $3a27 ; (bmu_line.s11 + 0)
.s48:
3a21 : a5 47 __ LDA T2 + 1 
3a23 : a6 46 __ LDX T2 + 0 
3a25 : 90 04 __ BCC $3a2b ; (bmu_line.s12 + 0)
.s11:
3a27 : a5 44 __ LDA T0 + 1 
3a29 : a6 43 __ LDX T0 + 0 
.s12:
3a2b : 86 48 __ STX T4 + 0 
3a2d : 85 49 __ STA T4 + 1 
3a2f : 38 __ __ SEC
3a30 : a5 43 __ LDA T0 + 0 
3a32 : e5 46 __ SBC T2 + 0 
3a34 : 85 4a __ STA T5 + 0 
3a36 : a5 44 __ LDA T0 + 1 
3a38 : e5 47 __ SBC T2 + 1 
3a3a : 85 4b __ STA T5 + 1 
3a3c : a5 4a __ LDA T5 + 0 
3a3e : 4a __ __ LSR
3a3f : b0 0c __ BCS $3a4d ; (bmu_line.s47 + 0)
.s13:
3a41 : a5 4b __ LDA T5 + 1 
3a43 : c9 80 __ CMP #$80
3a45 : 6a __ __ ROR
3a46 : 85 4b __ STA T5 + 1 
3a48 : 66 4a __ ROR T5 + 0 
3a4a : 4c 55 3a JMP $3a55 ; (bmu_line.s14 + 0)
.s47:
3a4d : 06 43 __ ASL T0 + 0 
3a4f : 26 44 __ ROL T0 + 1 
3a51 : 06 46 __ ASL T2 + 0 
3a53 : 26 47 __ ROL T2 + 1 
.s14:
3a55 : a0 00 __ LDY #$00
3a57 : b1 0d __ LDA (P0),y ; (bm + 0)
3a59 : 85 4d __ STA T7 + 0 
3a5b : c8 __ __ INY
3a5c : b1 0d __ LDA (P0),y ; (bm + 0)
3a5e : 85 4e __ STA T7 + 1 
3a60 : a0 04 __ LDY #$04
3a62 : b1 0d __ LDA (P0),y ; (bm + 0)
3a64 : aa __ __ TAX
3a65 : 0a __ __ ASL
3a66 : 85 4f __ STA T8 + 0 
3a68 : a9 a0 __ LDA #$a0
3a6a : 8d 00 9b STA $9b00 ; (BLIT_CODE[0] + 0)
3a6d : a9 a2 __ LDA #$a2
3a6f : 8d 02 9b STA $9b02 ; (BLIT_CODE[0] + 2)
3a72 : a9 a5 __ LDA #$a5
3a74 : 8d 04 9b STA $9b04 ; (BLIT_CODE[0] + 4)
3a77 : a9 0a __ LDA #$0a
3a79 : 8d 05 9b STA $9b05 ; (BLIT_CODE[0] + 5)
3a7c : a9 00 __ LDA #$00
3a7e : 2a __ __ ROL
3a7f : 06 4f __ ASL T8 + 0 
3a81 : 2a __ __ ROL
3a82 : 06 4f __ ASL T8 + 0 
3a84 : 2a __ __ ROL
3a85 : 85 50 __ STA T8 + 1 
3a87 : a5 52 __ LDA T12 + 0 
3a89 : f0 0d __ BEQ $3a98 ; (bmu_line.s15 + 0)
.s46:
3a8b : 38 __ __ SEC
3a8c : a9 00 __ LDA #$00
3a8e : e5 4f __ SBC T8 + 0 
3a90 : 85 4f __ STA T8 + 0 
3a92 : a9 00 __ LDA #$00
3a94 : e5 50 __ SBC T8 + 1 
3a96 : 85 50 __ STA T8 + 1 
.s15:
3a98 : a5 11 __ LDA P4 ; (y0 + 0)
3a9a : 29 f8 __ AND #$f8
3a9c : 85 1b __ STA ACCU + 0 
3a9e : a5 12 __ LDA P5 ; (y0 + 1)
3aa0 : 85 1c __ STA ACCU + 1 
3aa2 : 8a __ __ TXA
3aa3 : 20 92 73 JSR $7392 ; (mul16by8 + 0)
3aa6 : 18 __ __ CLC
3aa7 : a5 4d __ LDA T7 + 0 
3aa9 : 65 1b __ ADC ACCU + 0 
3aab : 85 4d __ STA T7 + 0 
3aad : a5 4e __ LDA T7 + 1 
3aaf : 65 1c __ ADC ACCU + 1 
3ab1 : aa __ __ TAX
3ab2 : a5 0f __ LDA P2 ; (x0 + 0)
3ab4 : 29 f8 __ AND #$f8
3ab6 : 18 __ __ CLC
3ab7 : 65 4d __ ADC T7 + 0 
3ab9 : 85 4d __ STA T7 + 0 
3abb : 8a __ __ TXA
3abc : 65 10 __ ADC P3 ; (x0 + 1)
3abe : 85 4e __ STA T7 + 1 
3ac0 : a5 46 __ LDA T2 + 0 
3ac2 : 05 43 __ ORA T0 + 0 
3ac4 : 29 80 __ AND #$80
3ac6 : 85 4c __ STA T6 + 0 
3ac8 : a5 47 __ LDA T2 + 1 
3aca : 05 44 __ ORA T0 + 1 
3acc : 05 4c __ ORA T6 + 0 
3ace : f0 02 __ BEQ $3ad2 ; (bmu_line.s56 + 0)
.s55:
3ad0 : a9 01 __ LDA #$01
.s56:
3ad2 : 85 1c __ STA ACCU + 1 
3ad4 : a5 11 __ LDA P4 ; (y0 + 0)
3ad6 : 29 07 __ AND #$07
3ad8 : 8d 01 9b STA $9b01 ; (BLIT_CODE[0] + 1)
3adb : a6 48 __ LDX T4 + 0 
3add : e8 __ __ INX
3ade : 8e 03 9b STX $9b03 ; (BLIT_CODE[0] + 3)
3ae1 : a5 0f __ LDA P2 ; (x0 + 0)
3ae3 : 29 07 __ AND #$07
3ae5 : aa __ __ TAX
3ae6 : a5 18 __ LDA P11 ; (op + 0)
3ae8 : c9 02 __ CMP #$02
3aea : d0 20 __ BNE $3b0c ; (bmu_line.s16 + 0)
.s45:
3aec : a9 49 __ LDA #$49
3aee : 8d 06 9b STA $9b06 ; (BLIT_CODE[0] + 6)
3af1 : a9 ff __ LDA #$ff
3af3 : 8d 07 9b STA $9b07 ; (BLIT_CODE[0] + 7)
3af6 : a9 31 __ LDA #$31
3af8 : 8d 08 9b STA $9b08 ; (BLIT_CODE[0] + 8)
3afb : a9 03 __ LDA #$03
3afd : 8d 09 9b STA $9b09 ; (BLIT_CODE[0] + 9)
3b00 : 8d 0b 9b STA $9b0b ; (BLIT_CODE[0] + 11)
3b03 : a9 91 __ LDA #$91
3b05 : 8d 0a 9b STA $9b0a ; (BLIT_CODE[0] + 10)
3b08 : a9 0c __ LDA #$0c
3b0a : d0 21 __ BNE $3b2d ; (bmu_line.s19 + 0)
.s16:
3b0c : b0 03 __ BCS $3b11 ; (bmu_line.s17 + 0)
3b0e : 4c f9 3d JMP $3df9 ; (bmu_line.s42 + 0)
.s17:
3b11 : c9 03 __ CMP #$03
3b13 : f0 04 __ BEQ $3b19 ; (bmu_line.s40 + 0)
.s18:
3b15 : a9 06 __ LDA #$06
3b17 : d0 14 __ BNE $3b2d ; (bmu_line.s19 + 0)
.s40:
3b19 : a9 51 __ LDA #$51
.s41:
3b1b : 8d 06 9b STA $9b06 ; (BLIT_CODE[0] + 6)
3b1e : a9 03 __ LDA #$03
3b20 : 8d 07 9b STA $9b07 ; (BLIT_CODE[0] + 7)
3b23 : 8d 09 9b STA $9b09 ; (BLIT_CODE[0] + 9)
3b26 : a9 91 __ LDA #$91
3b28 : 8d 08 9b STA $9b08 ; (BLIT_CODE[0] + 8)
3b2b : a9 0a __ LDA #$0a
.s19:
3b2d : 85 45 __ STA T1 + 0 
3b2f : a5 43 __ LDA T0 + 0 
3b31 : 05 44 __ ORA T0 + 1 
3b33 : f0 03 __ BEQ $3b38 ; (bmu_line.s20 + 0)
3b35 : 4c 07 3c JMP $3c07 ; (bmu_line.s28 + 0)
.s20:
3b38 : a5 46 __ LDA T2 + 0 
3b3a : 05 47 __ ORA T2 + 1 
3b3c : f0 75 __ BEQ $3bb3 ; (bmu_line.s21 + 0)
.s22:
3b3e : a9 0a __ LDA #$0a
3b40 : a4 45 __ LDY T1 + 0 
3b42 : 99 01 9b STA $9b01,y ; (BLIT_CODE[0] + 1)
3b45 : 99 05 9b STA $9b05,y ; (BLIT_CODE[0] + 5)
3b48 : a9 90 __ LDA #$90
3b4a : 99 02 9b STA $9b02,y ; (BLIT_CODE[0] + 2)
3b4d : a9 0c __ LDA #$0c
3b4f : 99 03 9b STA $9b03,y ; (BLIT_CODE[0] + 3)
3b52 : a9 a5 __ LDA #$a5
3b54 : 99 06 9b STA $9b06,y ; (BLIT_CODE[0] + 6)
3b57 : a9 03 __ LDA #$03
3b59 : 99 07 9b STA $9b07,y ; (BLIT_CODE[0] + 7)
3b5c : a9 69 __ LDA #$69
3b5e : 99 08 9b STA $9b08,y ; (BLIT_CODE[0] + 8)
3b61 : a5 51 __ LDA T11 + 0 
3b63 : f0 09 __ BEQ $3b6e ; (bmu_line.s23 + 0)
.s27:
3b65 : a9 06 __ LDA #$06
3b67 : 99 00 9b STA $9b00,y ; (BLIT_CODE[0] + 0)
3b6a : a9 26 __ LDA #$26
3b6c : d0 07 __ BNE $3b75 ; (bmu_line.s53 + 0)
.s23:
3b6e : a9 46 __ LDA #$46
3b70 : 99 00 9b STA $9b00,y ; (BLIT_CODE[0] + 0)
3b73 : a9 66 __ LDA #$66
.s53:
3b75 : 99 04 9b STA $9b04,y ; (BLIT_CODE[0] + 4)
3b78 : a9 02 __ LDA #$02
3b7a : 99 0b 9b STA $9b0b,y ; (BLIT_CODE[0] + 11)
3b7d : a5 51 __ LDA T11 + 0 
3b7f : f0 0e __ BEQ $3b8f ; (bmu_line.s24 + 0)
.s26:
3b81 : a9 f8 __ LDA #$f8
3b83 : 99 09 9b STA $9b09,y ; (BLIT_CODE[0] + 9)
3b86 : a9 b0 __ LDA #$b0
3b88 : 99 0a 9b STA $9b0a,y ; (BLIT_CODE[0] + 10)
3b8b : a9 c6 __ LDA #$c6
3b8d : d0 0c __ BNE $3b9b ; (bmu_line.s25 + 0)
.s24:
3b8f : a9 08 __ LDA #$08
3b91 : 99 09 9b STA $9b09,y ; (BLIT_CODE[0] + 9)
3b94 : a9 90 __ LDA #$90
3b96 : 99 0a 9b STA $9b0a,y ; (BLIT_CODE[0] + 10)
3b99 : a9 e6 __ LDA #$e6
.s25:
3b9b : 99 0c 9b STA $9b0c,y ; (BLIT_CODE[0] + 12)
3b9e : a9 04 __ LDA #$04
3ba0 : 99 0d 9b STA $9b0d,y ; (BLIT_CODE[0] + 13)
3ba3 : a9 85 __ LDA #$85
3ba5 : 99 0e 9b STA $9b0e,y ; (BLIT_CODE[0] + 14)
3ba8 : a9 03 __ LDA #$03
3baa : 99 0f 9b STA $9b0f,y ; (BLIT_CODE[0] + 15)
3bad : 98 __ __ TYA
3bae : 18 __ __ CLC
3baf : 69 10 __ ADC #$10
3bb1 : 85 45 __ STA T1 + 0 
.s21:
3bb3 : a9 ca __ LDA #$ca
3bb5 : a4 45 __ LDY T1 + 0 
3bb7 : 84 43 __ STY T0 + 0 
3bb9 : 99 00 9b STA $9b00,y ; (BLIT_CODE[0] + 0)
3bbc : a9 d0 __ LDA #$d0
3bbe : 99 01 9b STA $9b01,y ; (BLIT_CODE[0] + 1)
3bc1 : a9 c6 __ LDA #$c6
3bc3 : 99 03 9b STA $9b03,y ; (BLIT_CODE[0] + 3)
3bc6 : a9 0b __ LDA #$0b
3bc8 : 99 04 9b STA $9b04,y ; (BLIT_CODE[0] + 4)
3bcb : a9 10 __ LDA #$10
3bcd : 99 05 9b STA $9b05,y ; (BLIT_CODE[0] + 5)
3bd0 : a9 60 __ LDA #$60
3bd2 : 99 07 9b STA $9b07,y ; (BLIT_CODE[0] + 7)
3bd5 : e6 43 __ INC T0 + 0 
3bd7 : 38 __ __ SEC
3bd8 : a9 02 __ LDA #$02
3bda : e5 43 __ SBC T0 + 0 
3bdc : 99 02 9b STA $9b02,y ; (BLIT_CODE[0] + 2)
3bdf : 38 __ __ SEC
3be0 : a9 fe __ LDA #$fe
3be2 : e5 43 __ SBC T0 + 0 
3be4 : 99 06 9b STA $9b06,y ; (BLIT_CODE[0] + 6)
3be7 : a5 49 __ LDA T4 + 1 
3be9 : 85 0b __ STA WORK + 8 
3beb : a5 4d __ LDA T7 + 0 
3bed : 85 03 __ STA WORK + 0 
3bef : a5 4e __ LDA T7 + 1 
3bf1 : 85 04 __ STA WORK + 1 
3bf3 : a5 4a __ LDA T5 + 0 
3bf5 : 85 05 __ STA WORK + 2 
3bf7 : a5 4b __ LDA T5 + 1 
3bf9 : 85 06 __ STA WORK + 3 
3bfb : bd 76 83 LDA $8376,x ; (bitshift[0] + 32)
3bfe : 85 0a __ STA WORK + 7 
3c00 : a9 ff __ LDA #$ff
3c02 : 85 07 __ STA WORK + 4 
3c04 : 4c 00 9b JMP $9b00 ; (BLIT_CODE[0] + 0)
.s28:
3c07 : a5 46 __ LDA T2 + 0 
3c09 : 05 47 __ ORA T2 + 1 
3c0b : c9 01 __ CMP #$01
3c0d : a9 00 __ LDA #$00
3c0f : 6a __ __ ROR
3c10 : 85 1d __ STA ACCU + 2 
3c12 : f0 03 __ BEQ $3c17 ; (bmu_line.s29 + 0)
3c14 : 4c b2 3d JMP $3db2 ; (bmu_line.s35 + 0)
.s29:
3c17 : a9 00 __ LDA #$00
3c19 : 85 46 __ STA T2 + 0 
3c1b : 85 47 __ STA T2 + 1 
3c1d : 85 1b __ STA ACCU + 0 
3c1f : a5 52 __ LDA T12 + 0 
3c21 : f0 03 __ BEQ $3c26 ; (bmu_line.s30 + 0)
3c23 : 4c 47 3d JMP $3d47 ; (bmu_line.s34 + 0)
.s30:
3c26 : a9 c8 __ LDA #$c8
3c28 : a4 45 __ LDY T1 + 0 
3c2a : 99 00 9b STA $9b00,y ; (BLIT_CODE[0] + 0)
3c2d : a9 c0 __ LDA #$c0
3c2f : 99 01 9b STA $9b01,y ; (BLIT_CODE[0] + 1)
3c32 : a9 08 __ LDA #$08
3c34 : 99 02 9b STA $9b02,y ; (BLIT_CODE[0] + 2)
3c37 : a9 d0 __ LDA #$d0
3c39 : 99 03 9b STA $9b03,y ; (BLIT_CODE[0] + 3)
3c3c : a9 a0 __ LDA #$a0
3c3e : 99 05 9b STA $9b05,y ; (BLIT_CODE[0] + 5)
3c41 : a9 00 __ LDA #$00
3c43 : 99 06 9b STA $9b06,y ; (BLIT_CODE[0] + 6)
3c46 : a9 a5 __ LDA #$a5
3c48 : 99 07 9b STA $9b07,y ; (BLIT_CODE[0] + 7)
3c4b : 99 0d 9b STA $9b0d,y ; (BLIT_CODE[0] + 13)
3c4e : a9 03 __ LDA #$03
3c50 : 99 08 9b STA $9b08,y ; (BLIT_CODE[0] + 8)
3c53 : 99 0c 9b STA $9b0c,y ; (BLIT_CODE[0] + 12)
3c56 : a9 69 __ LDA #$69
3c58 : 99 09 9b STA $9b09,y ; (BLIT_CODE[0] + 9)
3c5b : 99 0f 9b STA $9b0f,y ; (BLIT_CODE[0] + 15)
3c5e : a9 85 __ LDA #$85
3c60 : 99 0b 9b STA $9b0b,y ; (BLIT_CODE[0] + 11)
3c63 : 99 11 9b STA $9b11,y ; (BLIT_CODE[0] + 17)
3c66 : a9 04 __ LDA #$04
3c68 : 99 0e 9b STA $9b0e,y ; (BLIT_CODE[0] + 14)
3c6b : 99 12 9b STA $9b12,y ; (BLIT_CODE[0] + 18)
3c6e : a5 1b __ LDA ACCU + 0 
3c70 : f0 04 __ BEQ $3c76 ; (bmu_line.s60 + 0)
.s61:
3c72 : a9 10 __ LDA #$10
3c74 : 90 02 __ BCC $3c78 ; (bmu_line.s62 + 0)
.s60:
3c76 : a9 0e __ LDA #$0e
.s62:
3c78 : 99 04 9b STA $9b04,y ; (BLIT_CODE[0] + 4)
3c7b : 38 __ __ SEC
3c7c : a5 4f __ LDA T8 + 0 
3c7e : e9 01 __ SBC #$01
3c80 : 99 0a 9b STA $9b0a,y ; (BLIT_CODE[0] + 10)
3c83 : a5 50 __ LDA T8 + 1 
3c85 : e9 00 __ SBC #$00
3c87 : 99 10 9b STA $9b10,y ; (BLIT_CODE[0] + 16)
3c8a : 98 __ __ TYA
3c8b : 18 __ __ CLC
3c8c : 69 13 __ ADC #$13
3c8e : 85 45 __ STA T1 + 0 
3c90 : a8 __ __ TAY
3c91 : 24 1d __ BIT ACCU + 2 
3c93 : 30 03 __ BMI $3c98 ; (bmu_line.s31 + 0)
3c95 : 4c 38 3b JMP $3b38 ; (bmu_line.s20 + 0)
.s31:
3c98 : a9 a5 __ LDA #$a5
3c9a : 99 00 9b STA $9b00,y ; (BLIT_CODE[0] + 0)
3c9d : a9 05 __ LDA #$05
3c9f : 99 01 9b STA $9b01,y ; (BLIT_CODE[0] + 1)
3ca2 : 99 06 9b STA $9b06,y ; (BLIT_CODE[0] + 6)
3ca5 : a9 38 __ LDA #$38
3ca7 : 99 02 9b STA $9b02,y ; (BLIT_CODE[0] + 2)
3caa : a9 e9 __ LDA #$e9
3cac : 99 03 9b STA $9b03,y ; (BLIT_CODE[0] + 3)
3caf : a9 85 __ LDA #$85
3cb1 : 99 05 9b STA $9b05,y ; (BLIT_CODE[0] + 5)
3cb4 : a5 46 __ LDA T2 + 0 
3cb6 : 99 04 9b STA $9b04,y ; (BLIT_CODE[0] + 4)
3cb9 : a5 1c __ LDA ACCU + 1 
3cbb : d0 2a __ BNE $3ce7 ; (bmu_line.s33 + 0)
.s32:
3cbd : a9 10 __ LDA #$10
3cbf : 99 07 9b STA $9b07,y ; (BLIT_CODE[0] + 7)
3cc2 : a9 15 __ LDA #$15
3cc4 : 99 08 9b STA $9b08,y ; (BLIT_CODE[0] + 8)
3cc7 : a9 18 __ LDA #$18
3cc9 : 99 09 9b STA $9b09,y ; (BLIT_CODE[0] + 9)
3ccc : a9 69 __ LDA #$69
3cce : 99 0a 9b STA $9b0a,y ; (BLIT_CODE[0] + 10)
3cd1 : a5 43 __ LDA T0 + 0 
3cd3 : 99 0b 9b STA $9b0b,y ; (BLIT_CODE[0] + 11)
3cd6 : a9 85 __ LDA #$85
3cd8 : 99 0c 9b STA $9b0c,y ; (BLIT_CODE[0] + 12)
3cdb : a9 05 __ LDA #$05
3cdd : 99 0d 9b STA $9b0d,y ; (BLIT_CODE[0] + 13)
3ce0 : 98 __ __ TYA
3ce1 : 18 __ __ CLC
3ce2 : 69 0e __ ADC #$0e
3ce4 : 4c 42 3d JMP $3d42 ; (bmu_line.s54 + 0)
.s33:
3ce7 : a9 a5 __ LDA #$a5
3ce9 : 99 07 9b STA $9b07,y ; (BLIT_CODE[0] + 7)
3cec : 99 10 9b STA $9b10,y ; (BLIT_CODE[0] + 16)
3cef : 99 16 9b STA $9b16,y ; (BLIT_CODE[0] + 22)
3cf2 : a9 06 __ LDA #$06
3cf4 : 99 08 9b STA $9b08,y ; (BLIT_CODE[0] + 8)
3cf7 : 99 0c 9b STA $9b0c,y ; (BLIT_CODE[0] + 12)
3cfa : 99 17 9b STA $9b17,y ; (BLIT_CODE[0] + 23)
3cfd : 99 1b 9b STA $9b1b,y ; (BLIT_CODE[0] + 27)
3d00 : a9 e9 __ LDA #$e9
3d02 : 99 09 9b STA $9b09,y ; (BLIT_CODE[0] + 9)
3d05 : a9 85 __ LDA #$85
3d07 : 99 0b 9b STA $9b0b,y ; (BLIT_CODE[0] + 11)
3d0a : 99 14 9b STA $9b14,y ; (BLIT_CODE[0] + 20)
3d0d : 99 1a 9b STA $9b1a,y ; (BLIT_CODE[0] + 26)
3d10 : a9 10 __ LDA #$10
3d12 : 99 0d 9b STA $9b0d,y ; (BLIT_CODE[0] + 13)
3d15 : a9 1d __ LDA #$1d
3d17 : 99 0e 9b STA $9b0e,y ; (BLIT_CODE[0] + 14)
3d1a : a9 18 __ LDA #$18
3d1c : 99 0f 9b STA $9b0f,y ; (BLIT_CODE[0] + 15)
3d1f : a9 05 __ LDA #$05
3d21 : 99 11 9b STA $9b11,y ; (BLIT_CODE[0] + 17)
3d24 : 99 15 9b STA $9b15,y ; (BLIT_CODE[0] + 21)
3d27 : a9 69 __ LDA #$69
3d29 : 99 12 9b STA $9b12,y ; (BLIT_CODE[0] + 18)
3d2c : 99 18 9b STA $9b18,y ; (BLIT_CODE[0] + 24)
3d2f : a5 43 __ LDA T0 + 0 
3d31 : 99 13 9b STA $9b13,y ; (BLIT_CODE[0] + 19)
3d34 : a5 47 __ LDA T2 + 1 
3d36 : 99 0a 9b STA $9b0a,y ; (BLIT_CODE[0] + 10)
3d39 : a5 44 __ LDA T0 + 1 
3d3b : 99 19 9b STA $9b19,y ; (BLIT_CODE[0] + 25)
3d3e : 98 __ __ TYA
3d3f : 18 __ __ CLC
3d40 : 69 1c __ ADC #$1c
.s54:
3d42 : 85 45 __ STA T1 + 0 
3d44 : 4c 3e 3b JMP $3b3e ; (bmu_line.s22 + 0)
.s34:
3d47 : a9 88 __ LDA #$88
3d49 : a4 45 __ LDY T1 + 0 
3d4b : 99 00 9b STA $9b00,y ; (BLIT_CODE[0] + 0)
3d4e : a9 10 __ LDA #$10
3d50 : 99 01 9b STA $9b01,y ; (BLIT_CODE[0] + 1)
3d53 : a9 18 __ LDA #$18
3d55 : 99 03 9b STA $9b03,y ; (BLIT_CODE[0] + 3)
3d58 : a9 a0 __ LDA #$a0
3d5a : 99 04 9b STA $9b04,y ; (BLIT_CODE[0] + 4)
3d5d : a9 07 __ LDA #$07
3d5f : 99 05 9b STA $9b05,y ; (BLIT_CODE[0] + 5)
3d62 : a9 a5 __ LDA #$a5
3d64 : 99 06 9b STA $9b06,y ; (BLIT_CODE[0] + 6)
3d67 : 99 0c 9b STA $9b0c,y ; (BLIT_CODE[0] + 12)
3d6a : a9 03 __ LDA #$03
3d6c : 99 07 9b STA $9b07,y ; (BLIT_CODE[0] + 7)
3d6f : 99 0b 9b STA $9b0b,y ; (BLIT_CODE[0] + 11)
3d72 : a9 69 __ LDA #$69
3d74 : 99 08 9b STA $9b08,y ; (BLIT_CODE[0] + 8)
3d77 : 99 0e 9b STA $9b0e,y ; (BLIT_CODE[0] + 14)
3d7a : a9 85 __ LDA #$85
3d7c : 99 0a 9b STA $9b0a,y ; (BLIT_CODE[0] + 10)
3d7f : 99 10 9b STA $9b10,y ; (BLIT_CODE[0] + 16)
3d82 : a9 04 __ LDA #$04
3d84 : 99 0d 9b STA $9b0d,y ; (BLIT_CODE[0] + 13)
3d87 : 99 11 9b STA $9b11,y ; (BLIT_CODE[0] + 17)
3d8a : a5 1b __ LDA ACCU + 0 
3d8c : f0 04 __ BEQ $3d92 ; (bmu_line.s57 + 0)
.s58:
3d8e : a9 11 __ LDA #$11
3d90 : 90 02 __ BCC $3d94 ; (bmu_line.s59 + 0)
.s57:
3d92 : a9 0f __ LDA #$0f
.s59:
3d94 : 99 02 9b STA $9b02,y ; (BLIT_CODE[0] + 2)
3d97 : a5 4f __ LDA T8 + 0 
3d99 : 99 09 9b STA $9b09,y ; (BLIT_CODE[0] + 9)
3d9c : a5 50 __ LDA T8 + 1 
3d9e : 99 0f 9b STA $9b0f,y ; (BLIT_CODE[0] + 15)
3da1 : 98 __ __ TYA
3da2 : 18 __ __ CLC
3da3 : 69 12 __ ADC #$12
3da5 : 85 45 __ STA T1 + 0 
3da7 : a8 __ __ TAY
3da8 : 24 1d __ BIT ACCU + 2 
3daa : 10 03 __ BPL $3daf ; (bmu_line.s59 + 27)
3dac : 4c 98 3c JMP $3c98 ; (bmu_line.s31 + 0)
3daf : 4c 38 3b JMP $3b38 ; (bmu_line.s20 + 0)
.s35:
3db2 : a9 a5 __ LDA #$a5
3db4 : a4 45 __ LDY T1 + 0 
3db6 : 99 00 9b STA $9b00,y ; (BLIT_CODE[0] + 0)
3db9 : a9 30 __ LDA #$30
3dbb : 99 02 9b STA $9b02,y ; (BLIT_CODE[0] + 2)
3dbe : a5 1c __ LDA ACCU + 1 
3dc0 : 69 05 __ ADC #$05
3dc2 : 99 01 9b STA $9b01,y ; (BLIT_CODE[0] + 1)
3dc5 : a5 1c __ LDA ACCU + 1 
3dc7 : d0 26 __ BNE $3def ; (bmu_line.s39 + 0)
.s36:
3dc9 : a9 1b __ LDA #$1b
3dcb : 85 1b __ STA ACCU + 0 
3dcd : a5 52 __ LDA T12 + 0 
3dcf : d0 02 __ BNE $3dd3 ; (bmu_line.s38 + 0)
.s37:
3dd1 : e6 1b __ INC ACCU + 0 
.s38:
3dd3 : a5 1b __ LDA ACCU + 0 
3dd5 : 99 03 9b STA $9b03,y ; (BLIT_CODE[0] + 3)
3dd8 : 98 __ __ TYA
3dd9 : 18 __ __ CLC
3dda : 69 04 __ ADC #$04
3ddc : 85 45 __ STA T1 + 0 
3dde : a9 00 __ LDA #$00
3de0 : c5 1c __ CMP ACCU + 1 
3de2 : 2a __ __ ROL
3de3 : 85 1b __ STA ACCU + 0 
3de5 : a5 52 __ LDA T12 + 0 
3de7 : f0 03 __ BEQ $3dec ; (bmu_line.s38 + 25)
3de9 : 4c 47 3d JMP $3d47 ; (bmu_line.s34 + 0)
3dec : 4c 26 3c JMP $3c26 ; (bmu_line.s30 + 0)
.s39:
3def : a9 21 __ LDA #$21
3df1 : 85 1b __ STA ACCU + 0 
3df3 : a5 52 __ LDA T12 + 0 
3df5 : d0 dc __ BNE $3dd3 ; (bmu_line.s38 + 0)
3df7 : f0 d8 __ BEQ $3dd1 ; (bmu_line.s37 + 0)
.s42:
3df9 : a8 __ __ TAY
3dfa : f0 05 __ BEQ $3e01 ; (bmu_line.s43 + 0)
.s44:
3dfc : a9 11 __ LDA #$11
3dfe : 4c 1b 3b JMP $3b1b ; (bmu_line.s41 + 0)
.s43:
3e01 : a9 06 __ LDA #$06
3e03 : 8d 06 9b STA $9b06 ; (BLIT_CODE[0] + 6)
3e06 : 8d 09 9b STA $9b09 ; (BLIT_CODE[0] + 9)
3e09 : a9 07 __ LDA #$07
3e0b : 8d 07 9b STA $9b07 ; (BLIT_CODE[0] + 7)
3e0e : 8d 0b 9b STA $9b0b ; (BLIT_CODE[0] + 11)
3e11 : a9 90 __ LDA #$90
3e13 : 8d 08 9b STA $9b08 ; (BLIT_CODE[0] + 8)
3e16 : a9 e6 __ LDA #$e6
3e18 : 8d 0a 9b STA $9b0a ; (BLIT_CODE[0] + 10)
3e1b : a9 11 __ LDA #$11
3e1d : 8d 0c 9b STA $9b0c ; (BLIT_CODE[0] + 12)
3e20 : a9 03 __ LDA #$03
3e22 : 8d 0d 9b STA $9b0d ; (BLIT_CODE[0] + 13)
3e25 : 8d 13 9b STA $9b13 ; (BLIT_CODE[0] + 19)
3e28 : 8d 15 9b STA $9b15 ; (BLIT_CODE[0] + 21)
3e2b : a9 d0 __ LDA #$d0
3e2d : 8d 0e 9b STA $9b0e ; (BLIT_CODE[0] + 14)
3e30 : a9 04 __ LDA #$04
3e32 : 8d 0f 9b STA $9b0f ; (BLIT_CODE[0] + 15)
3e35 : a9 49 __ LDA #$49
3e37 : 8d 10 9b STA $9b10 ; (BLIT_CODE[0] + 16)
3e3a : a9 ff __ LDA #$ff
3e3c : 8d 11 9b STA $9b11 ; (BLIT_CODE[0] + 17)
3e3f : a9 31 __ LDA #$31
3e41 : 8d 12 9b STA $9b12 ; (BLIT_CODE[0] + 18)
3e44 : a9 91 __ LDA #$91
3e46 : 8d 14 9b STA $9b14 ; (BLIT_CODE[0] + 20)
3e49 : a9 16 __ LDA #$16
3e4b : 4c 2d 3b JMP $3b2d ; (bmu_line.s19 + 0)
--------------------------------------------------------------------
engine_update: ; engine_update(u8)->void
; 364, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s4:
3e4e : 0a __ __ ASL
3e4f : aa __ __ TAX
3e50 : bd 43 79 LDA $7943,x ; (sid_freq[0] + 0)
3e53 : 8d 00 d4 STA $d400 
3e56 : bd 44 79 LDA $7944,x ; (sid_freq[0] + 1)
3e59 : 85 1c __ STA ACCU + 1 
3e5b : 8d 01 d4 STA $d401 
3e5e : bd 43 79 LDA $7943,x ; (sid_freq[0] + 0)
3e61 : 0a __ __ ASL
3e62 : 26 1c __ ROL ACCU + 1 
3e64 : 8d 07 d4 STA $d407 
3e67 : a5 1c __ LDA ACCU + 1 
3e69 : 8d 08 d4 STA $d408 
.s3:
3e6c : 60 __ __ RTS
--------------------------------------------------------------------
modplay_start: ; modplay_start()->void
; 239, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s4:
3e6d : ad 0c 97 LDA $970c ; (modplay.song_length + 0)
3e70 : d0 01 __ BNE $3e73 ; (modplay_start.s5 + 0)
.s3:
3e72 : 60 __ __ RTS
.s5:
3e73 : a9 00 __ LDA #$00
3e75 : 8d ff 77 STA $77ff ; (mod_paused + 0)
3e78 : 8d 8f 97 STA $978f ; (modplay.order_pos + 0)
3e7b : 85 43 __ STA T0 + 0 
3e7d : 8d 91 97 STA $9791 ; (modplay.row + 0)
3e80 : 8d 92 97 STA $9792 ; (modplay.tick + 0)
3e83 : 8d 95 97 STA $9795 ; (modplay.pattern_delay + 0)
3e86 : 8d 9a 97 STA $979a ; (modplay.skip_row_advance + 0)
3e89 : ad 0f 97 LDA $970f ; (modplay.order_table[0] + 0)
3e8c : 8d 90 97 STA $9790 ; (modplay.pattern_num + 0)
3e8f : a9 06 __ LDA #$06
3e91 : 8d 93 97 STA $9793 ; (modplay.ticks_per_row + 0)
3e94 : a9 7d __ LDA #$7d
3e96 : 8d 94 97 STA $9794 ; (modplay.bpm + 0)
3e99 : a9 01 __ LDA #$01
3e9b : 8d 98 97 STA $9798 ; (modplay.active + 0)
3e9e : ad 97 97 LDA $9797 ; (modplay.stereo + 0)
3ea1 : d0 17 __ BNE $3eba ; (modplay_start.l10 + 0)
.s7:
3ea3 : a9 80 __ LDA #$80
3ea5 : a6 43 __ LDX T0 + 0 
3ea7 : bc bc 77 LDY $77bc,x ; (__multab50L + 0)
.l8:
3eaa : 99 f0 99 STA $99f0,y ; (modplay.channel[0].pan + 0)
3ead : e6 43 __ INC T0 + 0 
3eaf : a5 43 __ LDA T0 + 0 
3eb1 : c9 04 __ CMP #$04
3eb3 : b0 1d __ BCS $3ed2 ; (modplay_start.s9 + 0)
.s6:
3eb5 : ad 97 97 LDA $9797 ; (modplay.stereo + 0)
3eb8 : f0 e9 __ BEQ $3ea3 ; (modplay_start.s7 + 0)
.l10:
3eba : a5 43 __ LDA T0 + 0 
3ebc : f0 04 __ BEQ $3ec2 ; (modplay_start.s11 + 0)
.s13:
3ebe : c9 03 __ CMP #$03
3ec0 : d0 04 __ BNE $3ec6 ; (modplay_start.s14 + 0)
.s11:
3ec2 : a2 00 __ LDX #$00
3ec4 : f0 02 __ BEQ $3ec8 ; (modplay_start.s12 + 0)
.s14:
3ec6 : a2 ff __ LDX #$ff
.s12:
3ec8 : a4 43 __ LDY T0 + 0 
3eca : b9 bc 77 LDA $77bc,y ; (__multab50L + 0)
3ecd : a8 __ __ TAY
3ece : 8a __ __ TXA
3ecf : 4c aa 3e JMP $3eaa ; (modplay_start.l8 + 0)
.s9:
3ed2 : ad 94 97 LDA $9794 ; (modplay.bpm + 0)
3ed5 : 20 12 3f JSR $3f12 ; (bpm_to_timer.s4 + 0)
3ed8 : a5 1b __ LDA ACCU + 0 
3eda : 85 43 __ STA T0 + 0 
3edc : a5 1c __ LDA ACCU + 1 
3ede : 85 44 __ STA T0 + 1 
3ee0 : 78 __ __ SEI
3ee1 : ad 14 03 LDA $0314 
3ee4 : 8d fe 78 STA $78fe ; (mod_saved_irq[0] + 0)
3ee7 : ad 15 03 LDA $0315 
3eea : 8d ff 78 STA $78ff ; (mod_saved_irq[0] + 1)
3eed : a9 7f __ LDA #$7f
3eef : 8d 0d dc STA $dc0d 
3ef2 : a5 43 __ LDA T0 + 0 
3ef4 : 8d 04 dc STA $dc04 
3ef7 : a5 44 __ LDA T0 + 1 
3ef9 : 8d 05 dc STA $dc05 
3efc : a9 0d __ LDA #$0d
3efe : 8d 14 03 STA $0314 
3f01 : a9 40 __ LDA #$40
3f03 : 8d 15 03 STA $0315 
3f06 : a9 81 __ LDA #$81
3f08 : 8d 0d dc STA $dc0d 
3f0b : a9 01 __ LDA #$01
3f0d : 8d 0e dc STA $dc0e 
3f10 : 58 __ __ CLI
3f11 : 60 __ __ RTS
--------------------------------------------------------------------
bpm_to_timer: ; bpm_to_timer(u8)->u16
;  76, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
3f12 : 85 03 __ STA WORK + 0 
3f14 : aa __ __ TAX
3f15 : d0 09 __ BNE $3f20 ; (bpm_to_timer.s6 + 0)
.s5:
3f17 : a9 f8 __ LDA #$f8
3f19 : 85 1b __ STA ACCU + 0 
3f1b : a9 4c __ LDA #$4c
3f1d : 85 1c __ STA ACCU + 1 
.s3:
3f1f : 60 __ __ RTS
.s6:
3f20 : a9 00 __ LDA #$00
3f22 : 85 1e __ STA ACCU + 3 
3f24 : 85 04 __ STA WORK + 1 
3f26 : 85 05 __ STA WORK + 2 
3f28 : 85 06 __ STA WORK + 3 
3f2a : a9 90 __ LDA #$90
3f2c : 85 1b __ STA ACCU + 0 
3f2e : a9 95 __ LDA #$95
3f30 : 85 1c __ STA ACCU + 1 
3f32 : a9 25 __ LDA #$25
3f34 : 85 1d __ STA ACCU + 2 
--------------------------------------------------------------------
divmod32: ; divmod32
3f36 : 84 02 __ STY $02 
3f38 : a0 20 __ LDY #$20
3f3a : a9 00 __ LDA #$00
3f3c : 85 07 __ STA WORK + 4 
3f3e : 85 08 __ STA WORK + 5 
3f40 : 85 09 __ STA WORK + 6 
3f42 : 85 0a __ STA WORK + 7 
3f44 : a5 05 __ LDA WORK + 2 
3f46 : 05 06 __ ORA WORK + 3 
3f48 : d0 78 __ BNE $3fc2 ; (divmod32 + 140)
3f4a : a5 04 __ LDA WORK + 1 
3f4c : d0 27 __ BNE $3f75 ; (divmod32 + 63)
3f4e : 18 __ __ CLC
3f4f : 26 1b __ ROL ACCU + 0 
3f51 : 26 1c __ ROL ACCU + 1 
3f53 : 26 1d __ ROL ACCU + 2 
3f55 : 26 1e __ ROL ACCU + 3 
3f57 : 2a __ __ ROL
3f58 : 90 05 __ BCC $3f5f ; (divmod32 + 41)
3f5a : e5 03 __ SBC WORK + 0 
3f5c : 38 __ __ SEC
3f5d : b0 06 __ BCS $3f65 ; (divmod32 + 47)
3f5f : c5 03 __ CMP WORK + 0 
3f61 : 90 02 __ BCC $3f65 ; (divmod32 + 47)
3f63 : e5 03 __ SBC WORK + 0 
3f65 : 88 __ __ DEY
3f66 : d0 e7 __ BNE $3f4f ; (divmod32 + 25)
3f68 : 85 07 __ STA WORK + 4 
3f6a : 26 1b __ ROL ACCU + 0 
3f6c : 26 1c __ ROL ACCU + 1 
3f6e : 26 1d __ ROL ACCU + 2 
3f70 : 26 1e __ ROL ACCU + 3 
3f72 : a4 02 __ LDY $02 
3f74 : 60 __ __ RTS
3f75 : a5 1e __ LDA ACCU + 3 
3f77 : d0 10 __ BNE $3f89 ; (divmod32 + 83)
3f79 : a6 1d __ LDX ACCU + 2 
3f7b : 86 1e __ STX ACCU + 3 
3f7d : a6 1c __ LDX ACCU + 1 
3f7f : 86 1d __ STX ACCU + 2 
3f81 : a6 1b __ LDX ACCU + 0 
3f83 : 86 1c __ STX ACCU + 1 
3f85 : 85 1b __ STA ACCU + 0 
3f87 : a0 18 __ LDY #$18
3f89 : 18 __ __ CLC
3f8a : 26 1b __ ROL ACCU + 0 
3f8c : 26 1c __ ROL ACCU + 1 
3f8e : 26 1d __ ROL ACCU + 2 
3f90 : 26 1e __ ROL ACCU + 3 
3f92 : 26 07 __ ROL WORK + 4 
3f94 : 26 08 __ ROL WORK + 5 
3f96 : 90 0c __ BCC $3fa4 ; (divmod32 + 110)
3f98 : a5 07 __ LDA WORK + 4 
3f9a : e5 03 __ SBC WORK + 0 
3f9c : aa __ __ TAX
3f9d : a5 08 __ LDA WORK + 5 
3f9f : e5 04 __ SBC WORK + 1 
3fa1 : 38 __ __ SEC
3fa2 : b0 0c __ BCS $3fb0 ; (divmod32 + 122)
3fa4 : 38 __ __ SEC
3fa5 : a5 07 __ LDA WORK + 4 
3fa7 : e5 03 __ SBC WORK + 0 
3fa9 : aa __ __ TAX
3faa : a5 08 __ LDA WORK + 5 
3fac : e5 04 __ SBC WORK + 1 
3fae : 90 04 __ BCC $3fb4 ; (divmod32 + 126)
3fb0 : 86 07 __ STX WORK + 4 
3fb2 : 85 08 __ STA WORK + 5 
3fb4 : 88 __ __ DEY
3fb5 : d0 d3 __ BNE $3f8a ; (divmod32 + 84)
3fb7 : 26 1b __ ROL ACCU + 0 
3fb9 : 26 1c __ ROL ACCU + 1 
3fbb : 26 1d __ ROL ACCU + 2 
3fbd : 26 1e __ ROL ACCU + 3 
3fbf : a4 02 __ LDY $02 
3fc1 : 60 __ __ RTS
3fc2 : a0 10 __ LDY #$10
3fc4 : a5 1e __ LDA ACCU + 3 
3fc6 : 85 08 __ STA WORK + 5 
3fc8 : a5 1d __ LDA ACCU + 2 
3fca : 85 07 __ STA WORK + 4 
3fcc : a9 00 __ LDA #$00
3fce : 85 1d __ STA ACCU + 2 
3fd0 : 85 1e __ STA ACCU + 3 
3fd2 : 18 __ __ CLC
3fd3 : 26 1b __ ROL ACCU + 0 
3fd5 : 26 1c __ ROL ACCU + 1 
3fd7 : 26 07 __ ROL WORK + 4 
3fd9 : 26 08 __ ROL WORK + 5 
3fdb : 26 09 __ ROL WORK + 6 
3fdd : 26 0a __ ROL WORK + 7 
3fdf : a5 07 __ LDA WORK + 4 
3fe1 : c5 03 __ CMP WORK + 0 
3fe3 : a5 08 __ LDA WORK + 5 
3fe5 : e5 04 __ SBC WORK + 1 
3fe7 : a5 09 __ LDA WORK + 6 
3fe9 : e5 05 __ SBC WORK + 2 
3feb : aa __ __ TAX
3fec : a5 0a __ LDA WORK + 7 
3fee : e5 06 __ SBC WORK + 3 
3ff0 : 90 11 __ BCC $4003 ; (divmod32 + 205)
3ff2 : 86 09 __ STX WORK + 6 
3ff4 : 85 0a __ STA WORK + 7 
3ff6 : a5 07 __ LDA WORK + 4 
3ff8 : e5 03 __ SBC WORK + 0 
3ffa : 85 07 __ STA WORK + 4 
3ffc : a5 08 __ LDA WORK + 5 
3ffe : e5 04 __ SBC WORK + 1 
4000 : 85 08 __ STA WORK + 5 
4002 : 38 __ __ SEC
4003 : 88 __ __ DEY
4004 : d0 cd __ BNE $3fd3 ; (divmod32 + 157)
4006 : 26 1b __ ROL ACCU + 0 
4008 : 26 1c __ ROL ACCU + 1 
400a : a4 02 __ LDY $02 
400c : 60 __ __ RTS
--------------------------------------------------------------------
modplay_irq: ; modplay_irq
400d : ad 0d dc LDA $dc0d 
4010 : 29 01 __ AND #$01
4012 : d0 03 __ BNE $4017 ; (modplay_irq + 10)
4014 : 4c 31 ea JMP $ea31 
4017 : a5 07 __ LDA WORK + 4 
4019 : 48 __ __ PHA
401a : a5 08 __ LDA WORK + 5 
401c : 48 __ __ PHA
401d : a5 09 __ LDA WORK + 6 
401f : 48 __ __ PHA
4020 : a5 0a __ LDA WORK + 7 
4022 : 48 __ __ PHA
4023 : a5 0b __ LDA WORK + 8 
4025 : 48 __ __ PHA
4026 : a5 0c __ LDA $0c 
4028 : 48 __ __ PHA
4029 : a5 14 __ LDA P7 
402b : 48 __ __ PHA
402c : a5 15 __ LDA P8 
402e : 48 __ __ PHA
402f : a5 16 __ LDA P9 
4031 : 48 __ __ PHA
4032 : a5 17 __ LDA P10 
4034 : 48 __ __ PHA
4035 : a5 18 __ LDA P11 
4037 : 48 __ __ PHA
4038 : a5 19 __ LDA IP + 0 
403a : 48 __ __ PHA
403b : a5 1a __ LDA IP + 1 
403d : 48 __ __ PHA
403e : a5 1f __ LDA ADDR + 0 
4040 : 48 __ __ PHA
4041 : a5 20 __ LDA ADDR + 1 
4043 : 48 __ __ PHA
4044 : a5 21 __ LDA ADDR + 2 
4046 : 48 __ __ PHA
4047 : a5 22 __ LDA ADDR + 3 
4049 : 48 __ __ PHA
404a : a5 23 __ LDA SP + 0 
404c : 48 __ __ PHA
404d : a5 24 __ LDA SP + 1 
404f : 48 __ __ PHA
4050 : a5 25 __ LDA FP + 0 
4052 : 48 __ __ PHA
4053 : a5 26 __ LDA FP + 1 
4055 : 48 __ __ PHA
4056 : a5 27 __ LDA $27 
4058 : 48 __ __ PHA
4059 : a5 28 __ LDA $28 
405b : 48 __ __ PHA
405c : a5 29 __ LDA $29 
405e : 48 __ __ PHA
405f : a5 2a __ LDA $2a 
4061 : 48 __ __ PHA
4062 : a5 2b __ LDA $2b 
4064 : 48 __ __ PHA
4065 : a5 2c __ LDA $2c 
4067 : 48 __ __ PHA
4068 : a5 2d __ LDA $2d 
406a : 48 __ __ PHA
406b : a5 2e __ LDA $2e 
406d : 48 __ __ PHA
406e : a5 2f __ LDA $2f 
4070 : 48 __ __ PHA
4071 : a5 30 __ LDA $30 
4073 : 48 __ __ PHA
4074 : a5 31 __ LDA $31 
4076 : 48 __ __ PHA
4077 : a5 32 __ LDA $32 
4079 : 48 __ __ PHA
407a : a5 33 __ LDA $33 
407c : 48 __ __ PHA
407d : a5 34 __ LDA $34 
407f : 48 __ __ PHA
4080 : a5 35 __ LDA $35 
4082 : 48 __ __ PHA
4083 : a5 36 __ LDA $36 
4085 : 48 __ __ PHA
4086 : a5 37 __ LDA $37 
4088 : 48 __ __ PHA
4089 : a5 38 __ LDA $38 
408b : 48 __ __ PHA
408c : a5 39 __ LDA $39 
408e : 48 __ __ PHA
408f : a5 3a __ LDA $3a 
4091 : 48 __ __ PHA
4092 : a5 3b __ LDA $3b 
4094 : 48 __ __ PHA
4095 : a5 3c __ LDA $3c 
4097 : 48 __ __ PHA
4098 : a5 3d __ LDA $3d 
409a : 48 __ __ PHA
409b : a5 3e __ LDA $3e 
409d : 48 __ __ PHA
409e : a5 3f __ LDA $3f 
40a0 : 48 __ __ PHA
40a1 : a5 40 __ LDA $40 
40a3 : 48 __ __ PHA
40a4 : a5 41 __ LDA $41 
40a6 : 48 __ __ PHA
40a7 : a5 42 __ LDA $42 
40a9 : 48 __ __ PHA
40aa : 20 43 41 JSR $4143 ; (modplay_tick.s1 + 0)
40ad : 68 __ __ PLA
40ae : 85 42 __ STA $42 
40b0 : 68 __ __ PLA
40b1 : 85 41 __ STA $41 
40b3 : 68 __ __ PLA
40b4 : 85 40 __ STA $40 
40b6 : 68 __ __ PLA
40b7 : 85 3f __ STA $3f 
40b9 : 68 __ __ PLA
40ba : 85 3e __ STA $3e 
40bc : 68 __ __ PLA
40bd : 85 3d __ STA $3d 
40bf : 68 __ __ PLA
40c0 : 85 3c __ STA $3c 
40c2 : 68 __ __ PLA
40c3 : 85 3b __ STA $3b 
40c5 : 68 __ __ PLA
40c6 : 85 3a __ STA $3a 
40c8 : 68 __ __ PLA
40c9 : 85 39 __ STA $39 
40cb : 68 __ __ PLA
40cc : 85 38 __ STA $38 
40ce : 68 __ __ PLA
40cf : 85 37 __ STA $37 
40d1 : 68 __ __ PLA
40d2 : 85 36 __ STA $36 
40d4 : 68 __ __ PLA
40d5 : 85 35 __ STA $35 
40d7 : 68 __ __ PLA
40d8 : 85 34 __ STA $34 
40da : 68 __ __ PLA
40db : 85 33 __ STA $33 
40dd : 68 __ __ PLA
40de : 85 32 __ STA $32 
40e0 : 68 __ __ PLA
40e1 : 85 31 __ STA $31 
40e3 : 68 __ __ PLA
40e4 : 85 30 __ STA $30 
40e6 : 68 __ __ PLA
40e7 : 85 2f __ STA $2f 
40e9 : 68 __ __ PLA
40ea : 85 2e __ STA $2e 
40ec : 68 __ __ PLA
40ed : 85 2d __ STA $2d 
40ef : 68 __ __ PLA
40f0 : 85 2c __ STA $2c 
40f2 : 68 __ __ PLA
40f3 : 85 2b __ STA $2b 
40f5 : 68 __ __ PLA
40f6 : 85 2a __ STA $2a 
40f8 : 68 __ __ PLA
40f9 : 85 29 __ STA $29 
40fb : 68 __ __ PLA
40fc : 85 28 __ STA $28 
40fe : 68 __ __ PLA
40ff : 85 27 __ STA $27 
4101 : 68 __ __ PLA
4102 : 85 26 __ STA FP + 1 
4104 : 68 __ __ PLA
4105 : 85 25 __ STA FP + 0 
4107 : 68 __ __ PLA
4108 : 85 24 __ STA SP + 1 
410a : 68 __ __ PLA
410b : 85 23 __ STA SP + 0 
410d : 68 __ __ PLA
410e : 85 22 __ STA ADDR + 3 
4110 : 68 __ __ PLA
4111 : 85 21 __ STA ADDR + 2 
4113 : 68 __ __ PLA
4114 : 85 20 __ STA ADDR + 1 
4116 : 68 __ __ PLA
4117 : 85 1f __ STA ADDR + 0 
4119 : 68 __ __ PLA
411a : 85 1a __ STA IP + 1 
411c : 68 __ __ PLA
411d : 85 19 __ STA IP + 0 
411f : 68 __ __ PLA
4120 : 85 18 __ STA P11 
4122 : 68 __ __ PLA
4123 : 85 17 __ STA P10 
4125 : 68 __ __ PLA
4126 : 85 16 __ STA P9 
4128 : 68 __ __ PLA
4129 : 85 15 __ STA P8 
412b : 68 __ __ PLA
412c : 85 14 __ STA P7 
412e : 68 __ __ PLA
412f : 85 0c __ STA $0c 
4131 : 68 __ __ PLA
4132 : 85 0b __ STA WORK + 8 
4134 : 68 __ __ PLA
4135 : 85 0a __ STA WORK + 7 
4137 : 68 __ __ PLA
4138 : 85 09 __ STA WORK + 6 
413a : 68 __ __ PLA
413b : 85 08 __ STA WORK + 5 
413d : 68 __ __ PLA
413e : 85 07 __ STA WORK + 4 
4140 : 4c 31 ea JMP $ea31 
--------------------------------------------------------------------
modplay_tick: ; modplay_tick()->void
; 285, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s1:
4143 : c6 24 __ DEC SP + 1 
4145 : a5 03 __ LDA WORK + 0 
4147 : 48 __ __ PHA
4148 : a5 04 __ LDA WORK + 1 
414a : 48 __ __ PHA
414b : a5 05 __ LDA WORK + 2 
414d : 48 __ __ PHA
414e : a5 06 __ LDA WORK + 3 
4150 : 48 __ __ PHA
4151 : a5 0d __ LDA P0 
4153 : 48 __ __ PHA
4154 : a5 0e __ LDA P1 
4156 : 48 __ __ PHA
4157 : a5 0f __ LDA P2 
4159 : 48 __ __ PHA
415a : a5 10 __ LDA P3 
415c : 48 __ __ PHA
415d : a5 11 __ LDA P4 
415f : 48 __ __ PHA
4160 : a5 12 __ LDA P5 
4162 : 48 __ __ PHA
4163 : a5 13 __ LDA P6 
4165 : 48 __ __ PHA
4166 : a5 1b __ LDA ACCU + 0 
4168 : 48 __ __ PHA
4169 : a5 1c __ LDA ACCU + 1 
416b : 48 __ __ PHA
416c : a5 1d __ LDA ACCU + 2 
416e : 48 __ __ PHA
416f : a5 1e __ LDA ACCU + 3 
4171 : 48 __ __ PHA
4172 : a5 43 __ LDA T0 + 0 
4174 : 48 __ __ PHA
4175 : a5 44 __ LDA T0 + 1 
4177 : 48 __ __ PHA
4178 : a5 45 __ LDA T2 + 0 
417a : 48 __ __ PHA
417b : a5 46 __ LDA $46 
417d : 48 __ __ PHA
417e : a5 47 __ LDA $47 
4180 : 48 __ __ PHA
4181 : a5 48 __ LDA $48 
4183 : 48 __ __ PHA
4184 : a5 49 __ LDA $49 
4186 : 48 __ __ PHA
4187 : a5 4a __ LDA $4a 
4189 : 48 __ __ PHA
418a : a5 4b __ LDA $4b 
418c : 48 __ __ PHA
418d : a5 4c __ LDA $4c 
418f : 48 __ __ PHA
4190 : a5 4d __ LDA $4d 
4192 : 48 __ __ PHA
4193 : a5 4e __ LDA $4e 
4195 : 48 __ __ PHA
4196 : a5 4f __ LDA $4f 
4198 : 48 __ __ PHA
4199 : a5 50 __ LDA $50 
419b : 48 __ __ PHA
419c : a5 51 __ LDA $51 
419e : 48 __ __ PHA
.s4:
419f : ad 98 97 LDA $9798 ; (modplay.active + 0)
41a2 : d0 03 __ BNE $41a7 ; (modplay_tick.s5 + 0)
41a4 : 4c 3d 42 JMP $423d ; (modplay_tick.s3 + 0)
.s5:
41a7 : ad ff 77 LDA $77ff ; (mod_paused + 0)
41aa : d0 f8 __ BNE $41a4 ; (modplay_tick.s4 + 5)
.s6:
41ac : ad 92 97 LDA $9792 ; (modplay.tick + 0)
41af : d0 19 __ BNE $41ca ; (modplay_tick.s25 + 0)
.s7:
41b1 : ad 94 97 LDA $9794 ; (modplay.bpm + 0)
41b4 : 20 12 3f JSR $3f12 ; (bpm_to_timer.s4 + 0)
41b7 : a5 1b __ LDA ACCU + 0 
41b9 : 8d 04 dc STA $dc04 
41bc : a5 1c __ LDA ACCU + 1 
41be : 8d 05 dc STA $dc05 
41c1 : 20 cc 42 JSR $42cc ; (process_new_row.s1 + 0)
41c4 : ac 93 97 LDY $9793 ; (modplay.ticks_per_row + 0)
41c7 : 4c e3 41 JMP $41e3 ; (modplay_tick.s8 + 0)
.s25:
41ca : a9 00 __ LDA #$00
41cc : 85 0f __ STA P2 
41ce : 20 5e 49 JSR $495e ; (fx_tick.s4 + 0)
41d1 : e6 0f __ INC P2 
41d3 : 20 5e 49 JSR $495e ; (fx_tick.s4 + 0)
41d6 : e6 0f __ INC P2 
41d8 : 20 5e 49 JSR $495e ; (fx_tick.s4 + 0)
41db : e6 0f __ INC P2 
41dd : 20 5e 49 JSR $495e ; (fx_tick.s4 + 0)
41e0 : ac 92 97 LDY $9792 ; (modplay.tick + 0)
.s8:
41e3 : 88 __ __ DEY
41e4 : 8c 92 97 STY $9792 ; (modplay.tick + 0)
41e7 : a9 00 __ LDA #$00
41e9 : 85 13 __ STA P6 
.l26:
41eb : 20 db 4b JSR $4bdb ; (ua_update_channel.s1 + 0)
41ee : e6 13 __ INC P6 
41f0 : a5 13 __ LDA P6 
41f2 : c9 04 __ CMP #$04
41f4 : 90 f5 __ BCC $41eb ; (modplay_tick.l26 + 0)
.s9:
41f6 : ad 92 97 LDA $9792 ; (modplay.tick + 0)
41f9 : d0 42 __ BNE $423d ; (modplay_tick.s3 + 0)
.s10:
41fb : ad 95 97 LDA $9795 ; (modplay.pattern_delay + 0)
41fe : f0 05 __ BEQ $4205 ; (modplay_tick.s11 + 0)
.s24:
4200 : ce 95 97 DEC $9795 ; (modplay.pattern_delay + 0)
4203 : b0 38 __ BCS $423d ; (modplay_tick.s3 + 0)
.s11:
4205 : ad 9a 97 LDA $979a ; (modplay.skip_row_advance + 0)
4208 : f0 03 __ BEQ $420d ; (modplay_tick.s12 + 0)
420a : 4c 9a 42 JMP $429a ; (modplay_tick.s18 + 0)
.s12:
420d : ee 91 97 INC $9791 ; (modplay.row + 0)
4210 : ad 91 97 LDA $9791 ; (modplay.row + 0)
4213 : c9 40 __ CMP #$40
4215 : 90 26 __ BCC $423d ; (modplay_tick.s3 + 0)
.s13:
4217 : ee 8f 97 INC $978f ; (modplay.order_pos + 0)
421a : a9 00 __ LDA #$00
421c : 8d 91 97 STA $9791 ; (modplay.row + 0)
421f : ad 8f 97 LDA $978f ; (modplay.order_pos + 0)
4222 : cd 0c 97 CMP $970c ; (modplay.song_length + 0)
4225 : 90 0f __ BCC $4236 ; (modplay_tick.s14 + 0)
.s15:
4227 : ad 99 97 LDA $9799 ; (modplay.loop_song + 0)
422a : d0 05 __ BNE $4231 ; (modplay_tick.s17 + 0)
.s16:
422c : 8d 98 97 STA $9798 ; (modplay.active + 0)
422f : b0 0c __ BCS $423d ; (modplay_tick.s3 + 0)
.s17:
4231 : a9 00 __ LDA #$00
4233 : 8d 8f 97 STA $978f ; (modplay.order_pos + 0)
.s14:
4236 : aa __ __ TAX
4237 : bd 0f 97 LDA $970f,x ; (modplay.order_table[0] + 0)
423a : 8d 90 97 STA $9790 ; (modplay.pattern_num + 0)
.s3:
423d : 68 __ __ PLA
423e : 85 51 __ STA $51 
4240 : 68 __ __ PLA
4241 : 85 50 __ STA $50 
4243 : 68 __ __ PLA
4244 : 85 4f __ STA $4f 
4246 : 68 __ __ PLA
4247 : 85 4e __ STA $4e 
4249 : 68 __ __ PLA
424a : 85 4d __ STA $4d 
424c : 68 __ __ PLA
424d : 85 4c __ STA $4c 
424f : 68 __ __ PLA
4250 : 85 4b __ STA $4b 
4252 : 68 __ __ PLA
4253 : 85 4a __ STA $4a 
4255 : 68 __ __ PLA
4256 : 85 49 __ STA $49 
4258 : 68 __ __ PLA
4259 : 85 48 __ STA $48 
425b : 68 __ __ PLA
425c : 85 47 __ STA $47 
425e : 68 __ __ PLA
425f : 85 46 __ STA $46 
4261 : 68 __ __ PLA
4262 : 85 45 __ STA T2 + 0 
4264 : 68 __ __ PLA
4265 : 85 44 __ STA T0 + 1 
4267 : 68 __ __ PLA
4268 : 85 43 __ STA T0 + 0 
426a : 68 __ __ PLA
426b : 85 1e __ STA ACCU + 3 
426d : 68 __ __ PLA
426e : 85 1d __ STA ACCU + 2 
4270 : 68 __ __ PLA
4271 : 85 1c __ STA ACCU + 1 
4273 : 68 __ __ PLA
4274 : 85 1b __ STA ACCU + 0 
4276 : 68 __ __ PLA
4277 : 85 13 __ STA P6 
4279 : 68 __ __ PLA
427a : 85 12 __ STA P5 
427c : 68 __ __ PLA
427d : 85 11 __ STA P4 
427f : 68 __ __ PLA
4280 : 85 10 __ STA P3 
4282 : 68 __ __ PLA
4283 : 85 0f __ STA P2 
4285 : 68 __ __ PLA
4286 : 85 0e __ STA P1 
4288 : 68 __ __ PLA
4289 : 85 0d __ STA P0 
428b : 68 __ __ PLA
428c : 85 06 __ STA WORK + 3 
428e : 68 __ __ PLA
428f : 85 05 __ STA WORK + 2 
4291 : 68 __ __ PLA
4292 : 85 04 __ STA WORK + 1 
4294 : 68 __ __ PLA
4295 : 85 03 __ STA WORK + 0 
4297 : e6 24 __ INC SP + 1 
4299 : 60 __ __ RTS
.s18:
429a : ad 9b 97 LDA $979b ; (modplay.next_order + 0)
429d : c9 ff __ CMP #$ff
429f : f0 06 __ BEQ $42a7 ; (modplay_tick.s19 + 0)
.s23:
42a1 : 8d 8f 97 STA $978f ; (modplay.order_pos + 0)
42a4 : 4c aa 42 JMP $42aa ; (modplay_tick.s27 + 0)
.s19:
42a7 : ad 8f 97 LDA $978f ; (modplay.order_pos + 0)
.s27:
42aa : cd 0c 97 CMP $970c ; (modplay.song_length + 0)
42ad : 90 0d __ BCC $42bc ; (modplay_tick.s20 + 0)
.s21:
42af : ad 99 97 LDA $9799 ; (modplay.loop_song + 0)
42b2 : d0 03 __ BNE $42b7 ; (modplay_tick.s22 + 0)
42b4 : 4c 2c 42 JMP $422c ; (modplay_tick.s16 + 0)
.s22:
42b7 : a9 00 __ LDA #$00
42b9 : 8d 8f 97 STA $978f ; (modplay.order_pos + 0)
.s20:
42bc : aa __ __ TAX
42bd : bd 0f 97 LDA $970f,x ; (modplay.order_table[0] + 0)
42c0 : 8d 90 97 STA $9790 ; (modplay.pattern_num + 0)
42c3 : ad 9c 97 LDA $979c ; (modplay.next_row + 0)
42c6 : 8d 91 97 STA $9791 ; (modplay.row + 0)
42c9 : 4c 3d 42 JMP $423d ; (modplay_tick.s3 + 0)
--------------------------------------------------------------------
process_new_row: ; process_new_row()->void
; 579, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s1:
42cc : 38 __ __ SEC
42cd : a5 23 __ LDA SP + 0 
42cf : e9 0b __ SBC #$0b
42d1 : 85 23 __ STA SP + 0 
42d3 : b0 02 __ BCS $42d7 ; (process_new_row.s4 + 0)
42d5 : c6 24 __ DEC SP + 1 
.s4:
42d7 : a9 00 __ LDA #$00
42d9 : 8d 9a 97 STA $979a ; (modplay.skip_row_advance + 0)
42dc : 8d 9c 97 STA $979c ; (modplay.next_row + 0)
42df : ad 08 97 LDA $9708 ; (modplay.reu_base + 0)
42e2 : 18 __ __ CLC
42e3 : 69 3c __ ADC #$3c
42e5 : 85 43 __ STA T0 + 0 
42e7 : a9 ff __ LDA #$ff
42e9 : 8d 9b 97 STA $979b ; (modplay.next_order + 0)
42ec : a9 f0 __ LDA #$f0
42ee : 8d 02 df STA $df02 
42f1 : a9 82 __ LDA #$82
42f3 : 8d 03 df STA $df03 
42f6 : ad 09 97 LDA $9709 ; (modplay.reu_base + 1)
42f9 : 69 04 __ ADC #$04
42fb : aa __ __ TAX
42fc : ac 0a 97 LDY $970a ; (modplay.reu_base + 2)
42ff : 90 01 __ BCC $4302 ; (process_new_row.s9 + 0)
.s8:
4301 : c8 __ __ INY
.s9:
4302 : ad 90 97 LDA $9790 ; (modplay.pattern_num + 0)
4305 : 0a __ __ ASL
4306 : 85 1c __ STA ACCU + 1 
4308 : a9 00 __ LDA #$00
430a : 2a __ __ ROL
430b : 06 1c __ ASL ACCU + 1 
430d : 2a __ __ ROL
430e : 85 1d __ STA ACCU + 2 
4310 : 8a __ __ TXA
4311 : 65 1c __ ADC ACCU + 1 
4313 : 85 44 __ STA T0 + 1 
4315 : 98 __ __ TYA
4316 : 65 1d __ ADC ACCU + 2 
4318 : 85 45 __ STA T0 + 2 
431a : ad 91 97 LDA $9791 ; (modplay.row + 0)
431d : 85 1b __ STA ACCU + 0 
431f : a9 00 __ LDA #$00
4321 : 85 1c __ STA ACCU + 1 
4323 : 85 1d __ STA ACCU + 2 
4325 : a2 04 __ LDX #$04
.l5:
4327 : 06 1b __ ASL ACCU + 0 
4329 : 26 1c __ ROL ACCU + 1 
432b : 26 1d __ ROL ACCU + 2 
432d : 2a __ __ ROL
432e : ca __ __ DEX
432f : d0 f6 __ BNE $4327 ; (process_new_row.l5 + 0)
.s6:
4331 : 18 __ __ CLC
4332 : a5 1b __ LDA ACCU + 0 
4334 : 65 43 __ ADC T0 + 0 
4336 : 8d 04 df STA $df04 
4339 : a5 1c __ LDA ACCU + 1 
433b : 65 44 __ ADC T0 + 1 
433d : 8d 05 df STA $df05 
4340 : a5 1d __ LDA ACCU + 2 
4342 : 65 45 __ ADC T0 + 2 
4344 : 8d 06 df STA $df06 
4347 : a9 10 __ LDA #$10
4349 : 8d 07 df STA $df07 
434c : 8e 08 df STX $df08 
434f : 8e 0a df STX $df0a 
4352 : 86 4a __ STX T5 + 0 
4354 : 86 4b __ STX T7 + 0 
4356 : 86 10 __ STX P3 
4358 : a9 91 __ LDA #$91
435a : 8d 01 df STA $df01 
435d : 18 __ __ CLC
435e : a5 23 __ LDA SP + 0 
4360 : 69 06 __ ADC #$06
4362 : 85 11 __ STA P4 
4364 : a5 24 __ LDA SP + 1 
4366 : 69 00 __ ADC #$00
4368 : 85 12 __ STA P5 
.l7:
436a : a6 4b __ LDX T7 + 0 
436c : bd f0 82 LDA $82f0,x ; (mod_row_buf[0] + 0)
436f : 29 f0 __ AND #$f0
4371 : 85 48 __ STA T2 + 0 
4373 : bd f2 82 LDA $82f2,x ; (mod_row_buf[0] + 2)
4376 : 4a __ __ LSR
4377 : 4a __ __ LSR
4378 : 4a __ __ LSR
4379 : 4a __ __ LSR
437a : 05 48 __ ORA T2 + 0 
437c : a0 06 __ LDY #$06
437e : 91 23 __ STA (SP + 0),y 
4380 : bd f1 82 LDA $82f1,x ; (mod_row_buf[0] + 1)
4383 : c8 __ __ INY
4384 : 91 23 __ STA (SP + 0),y 
4386 : bd f0 82 LDA $82f0,x ; (mod_row_buf[0] + 0)
4389 : 29 0f __ AND #$0f
438b : c8 __ __ INY
438c : 91 23 __ STA (SP + 0),y 
438e : bd f2 82 LDA $82f2,x ; (mod_row_buf[0] + 2)
4391 : 29 0f __ AND #$0f
4393 : 85 49 __ STA T3 + 0 
4395 : c8 __ __ INY
4396 : 91 23 __ STA (SP + 0),y 
4398 : bd f3 82 LDA $82f3,x ; (mod_row_buf[0] + 3)
439b : c8 __ __ INY
439c : 91 23 __ STA (SP + 0),y 
439e : a5 49 __ LDA T3 + 0 
43a0 : a4 4a __ LDY T5 + 0 
43a2 : 99 f1 99 STA $99f1,y ; (modplay.channel[0].effect + 0)
43a5 : bd f3 82 LDA $82f3,x ; (mod_row_buf[0] + 3)
43a8 : 99 f2 99 STA $99f2,y ; (modplay.channel[0].eparam + 0)
43ab : 20 d7 43 JSR $43d7 ; (apply_note.s4 + 0)
43ae : a5 10 __ LDA P3 
43b0 : 85 0f __ STA P2 
43b2 : 20 61 46 JSR $4661 ; (fx_row.s4 + 0)
43b5 : 18 __ __ CLC
43b6 : a5 4a __ LDA T5 + 0 
43b8 : 69 32 __ ADC #$32
43ba : 85 4a __ STA T5 + 0 
43bc : 18 __ __ CLC
43bd : a5 4b __ LDA T7 + 0 
43bf : 69 04 __ ADC #$04
43c1 : 85 4b __ STA T7 + 0 
43c3 : e6 10 __ INC P3 
43c5 : a5 10 __ LDA P3 
43c7 : c9 04 __ CMP #$04
43c9 : 90 9f __ BCC $436a ; (process_new_row.l7 + 0)
.s3:
43cb : 18 __ __ CLC
43cc : a5 23 __ LDA SP + 0 
43ce : 69 0b __ ADC #$0b
43d0 : 85 23 __ STA SP + 0 
43d2 : 90 02 __ BCC $43d6 ; (process_new_row.s3 + 11)
43d4 : e6 24 __ INC SP + 1 
43d6 : 60 __ __ RTS
--------------------------------------------------------------------
apply_note: ; apply_note(u8,struct S#23775*)->void
; 194, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
43d7 : a5 10 __ LDA P3 ; (ch_idx + 0)
43d9 : 0a __ __ ASL
43da : 18 __ __ CLC
43db : 65 10 __ ADC P3 ; (ch_idx + 0)
43dd : 0a __ __ ASL
43de : 0a __ __ ASL
43df : 0a __ __ ASL
43e0 : 18 __ __ CLC
43e1 : 65 10 __ ADC P3 ; (ch_idx + 0)
43e3 : 0a __ __ ASL
43e4 : 85 47 __ STA T3 + 0 
43e6 : a0 00 __ LDY #$00
43e8 : b1 11 __ LDA (P4),y ; (n + 0)
43ea : d0 03 __ BNE $43ef ; (apply_note.s14 + 0)
43ec : 4c 9f 44 JMP $449f ; (apply_note.s5 + 0)
.s14:
43ef : ad 0d 97 LDA $970d ; (modplay.num_samples + 0)
43f2 : d1 11 __ CMP (P4),y ; (n + 0)
43f4 : 90 f6 __ BCC $43ec ; (apply_note.s4 + 21)
.s15:
43f6 : 84 1c __ STY ACCU + 1 
43f8 : b1 11 __ LDA (P4),y ; (n + 0)
43fa : a6 47 __ LDX T3 + 0 
43fc : 9d ea 99 STA $99ea,x ; (modplay.channel[0].sample_num + 0)
43ff : 85 1b __ STA ACCU + 0 
4401 : a9 13 __ LDA #$13
4403 : 20 92 73 JSR $7392 ; (mul16by8 + 0)
4406 : 18 __ __ CLC
4407 : a9 8a __ LDA #$8a
4409 : 65 1b __ ADC ACCU + 0 
440b : 85 1b __ STA ACCU + 0 
440d : a9 97 __ LDA #$97
440f : 65 1c __ ADC ACCU + 1 
4411 : 85 1c __ STA ACCU + 1 
4413 : a0 11 __ LDY #$11
4415 : b1 1b __ LDA (ACCU + 0),y 
4417 : a6 47 __ LDX T3 + 0 
4419 : 9d ef 99 STA $99ef,x ; (modplay.channel[0].volume + 0)
441c : 88 __ __ DEY
441d : b1 1b __ LDA (ACCU + 0),y 
441f : 9d 0b 9a STA $9a0b,x ; (modplay.channel[0].needs_loop + 0)
4422 : a0 01 __ LDY #$01
4424 : b1 1b __ LDA (ACCU + 0),y 
4426 : 85 44 __ STA T0 + 1 
4428 : 9d 0d 9a STA $9a0d,x ; (modplay.channel[0].smp_start + 1)
442b : c8 __ __ INY
442c : b1 1b __ LDA (ACCU + 0),y 
442e : 85 45 __ STA T0 + 2 
4430 : 9d 0e 9a STA $9a0e,x ; (modplay.channel[0].smp_start + 2)
4433 : c8 __ __ INY
4434 : b1 1b __ LDA (ACCU + 0),y 
4436 : 85 46 __ STA T0 + 3 
4438 : 9d 0f 9a STA $9a0f,x ; (modplay.channel[0].smp_start + 3)
443b : a0 00 __ LDY #$00
443d : b1 1b __ LDA (ACCU + 0),y 
443f : 85 43 __ STA T0 + 0 
4441 : 9d 0c 9a STA $9a0c,x ; (modplay.channel[0].smp_start + 0)
4444 : a0 04 __ LDY #$04
4446 : b1 1b __ LDA (ACCU + 0),y 
4448 : 9d 10 9a STA $9a10,x ; (modplay.channel[0].smp_length + 0)
444b : c8 __ __ INY
444c : b1 1b __ LDA (ACCU + 0),y 
444e : 9d 11 9a STA $9a11,x ; (modplay.channel[0].smp_length + 1)
4451 : c8 __ __ INY
4452 : b1 1b __ LDA (ACCU + 0),y 
4454 : 9d 12 9a STA $9a12,x ; (modplay.channel[0].smp_length + 2)
4457 : c8 __ __ INY
4458 : b1 1b __ LDA (ACCU + 0),y 
445a : 9d 13 9a STA $9a13,x ; (modplay.channel[0].smp_length + 3)
445d : 18 __ __ CLC
445e : c8 __ __ INY
445f : b1 1b __ LDA (ACCU + 0),y 
4461 : 65 43 __ ADC T0 + 0 
4463 : 9d 14 9a STA $9a14,x ; (modplay.channel[0].smp_loop_a + 0)
4466 : c8 __ __ INY
4467 : b1 1b __ LDA (ACCU + 0),y 
4469 : 65 44 __ ADC T0 + 1 
446b : 9d 15 9a STA $9a15,x ; (modplay.channel[0].smp_loop_a + 1)
446e : c8 __ __ INY
446f : b1 1b __ LDA (ACCU + 0),y 
4471 : 65 45 __ ADC T0 + 2 
4473 : 9d 16 9a STA $9a16,x ; (modplay.channel[0].smp_loop_a + 2)
4476 : c8 __ __ INY
4477 : b1 1b __ LDA (ACCU + 0),y 
4479 : 65 46 __ ADC T0 + 3 
447b : 9d 17 9a STA $9a17,x ; (modplay.channel[0].smp_loop_a + 3)
447e : 18 __ __ CLC
447f : c8 __ __ INY
4480 : b1 1b __ LDA (ACCU + 0),y 
4482 : 65 43 __ ADC T0 + 0 
4484 : 9d 18 9a STA $9a18,x ; (modplay.channel[0].smp_loop_b + 0)
4487 : c8 __ __ INY
4488 : b1 1b __ LDA (ACCU + 0),y 
448a : 65 44 __ ADC T0 + 1 
448c : 9d 19 9a STA $9a19,x ; (modplay.channel[0].smp_loop_b + 1)
448f : c8 __ __ INY
4490 : b1 1b __ LDA (ACCU + 0),y 
4492 : 65 45 __ ADC T0 + 2 
4494 : 9d 1a 9a STA $9a1a,x ; (modplay.channel[0].smp_loop_b + 2)
4497 : c8 __ __ INY
4498 : b1 1b __ LDA (ACCU + 0),y 
449a : 65 46 __ ADC T0 + 3 
449c : 9d 1b 9a STA $9a1b,x ; (modplay.channel[0].smp_loop_b + 3)
.s5:
449f : a0 01 __ LDY #$01
44a1 : b1 11 __ LDA (P4),y ; (n + 0)
44a3 : 85 0d __ STA P0 
44a5 : c8 __ __ INY
44a6 : b1 11 __ LDA (P4),y ; (n + 0)
44a8 : 85 0e __ STA P1 
44aa : c8 __ __ INY
44ab : 05 0d __ ORA P0 
44ad : f0 6f __ BEQ $451e ; (apply_note.s6 + 0)
.s10:
44af : b1 11 __ LDA (P4),y ; (n + 0)
44b1 : c9 03 __ CMP #$03
44b3 : f0 69 __ BEQ $451e ; (apply_note.s6 + 0)
.s11:
44b5 : a6 47 __ LDX T3 + 0 
44b7 : bd ea 99 LDA $99ea,x ; (modplay.channel[0].sample_num + 0)
44ba : f0 1a __ BEQ $44d6 ; (apply_note.s18 + 0)
.s13:
44bc : 85 1b __ STA ACCU + 0 
44be : a9 00 __ LDA #$00
44c0 : 85 1c __ STA ACCU + 1 
44c2 : a9 13 __ LDA #$13
44c4 : 20 92 73 JSR $7392 ; (mul16by8 + 0)
44c7 : a9 9c __ LDA #$9c
44c9 : 85 43 __ STA T0 + 0 
44cb : 18 __ __ CLC
44cc : a9 97 __ LDA #$97
44ce : 65 1c __ ADC ACCU + 1 
44d0 : 85 44 __ STA T0 + 1 
44d2 : a4 1b __ LDY ACCU + 0 
44d4 : b1 43 __ LDA (T0 + 0),y 
.s18:
44d6 : 85 0f __ STA P2 
44d8 : 20 69 45 JSR $4569 ; (period_finetune.s4 + 0)
44db : a5 1b __ LDA ACCU + 0 
44dd : 85 0d __ STA P0 
44df : a6 47 __ LDX T3 + 0 
44e1 : 9d eb 99 STA $99eb,x ; (modplay.channel[0].period + 0)
44e4 : a5 1c __ LDA ACCU + 1 
44e6 : 85 0e __ STA P1 
44e8 : 9d ec 99 STA $99ec,x ; (modplay.channel[0].period + 1)
44eb : 20 18 46 JSR $4618 ; (period_to_rate.s4 + 0)
44ee : a5 1b __ LDA ACCU + 0 
44f0 : a6 47 __ LDX T3 + 0 
44f2 : 9d ed 99 STA $99ed,x ; (modplay.channel[0].rate + 0)
44f5 : a5 1c __ LDA ACCU + 1 
44f7 : 9d ee 99 STA $99ee,x ; (modplay.channel[0].rate + 1)
44fa : a0 00 __ LDY #$00
44fc : b1 11 __ LDA (P4),y ; (n + 0)
44fe : 9d 01 9a STA $9a01,x ; (modplay.channel[0].last_note + 0)
4501 : a0 03 __ LDY #$03
4503 : b1 11 __ LDA (P4),y ; (n + 0)
4505 : c9 03 __ CMP #$03
4507 : f0 15 __ BEQ $451e ; (apply_note.s6 + 0)
.s12:
4509 : a8 __ __ TAY
450a : a9 00 __ LDA #$00
450c : 9d f7 99 STA $99f7,x ; (modplay.channel[0].vib_pos + 0)
450f : 9d fb 99 STA $99fb,x ; (modplay.channel[0].trm_pos + 0)
4512 : 9d 00 9a STA $9a00,x ; (modplay.channel[0].arp_counter + 0)
4515 : a9 01 __ LDA #$01
4517 : 9d 0a 9a STA $9a0a,x ; (modplay.channel[0].needs_start + 0)
451a : 98 __ __ TYA
451b : 4c 20 45 JMP $4520 ; (apply_note.s16 + 0)
.s6:
451e : b1 11 __ LDA (P4),y ; (n + 0)
.s16:
4520 : c9 03 __ CMP #$03
4522 : d0 44 __ BNE $4568 ; (apply_note.s3 + 0)
.s7:
4524 : a0 01 __ LDY #$01
4526 : b1 11 __ LDA (P4),y ; (n + 0)
4528 : 85 0d __ STA P0 
452a : c8 __ __ INY
452b : 11 11 __ ORA (P4),y ; (n + 0)
452d : f0 39 __ BEQ $4568 ; (apply_note.s3 + 0)
.s8:
452f : b1 11 __ LDA (P4),y ; (n + 0)
4531 : 85 0e __ STA P1 
4533 : a6 47 __ LDX T3 + 0 
4535 : bd ea 99 LDA $99ea,x ; (modplay.channel[0].sample_num + 0)
4538 : f0 1a __ BEQ $4554 ; (apply_note.s17 + 0)
.s9:
453a : 85 1b __ STA ACCU + 0 
453c : a9 00 __ LDA #$00
453e : 85 1c __ STA ACCU + 1 
4540 : a9 13 __ LDA #$13
4542 : 20 92 73 JSR $7392 ; (mul16by8 + 0)
4545 : a9 9c __ LDA #$9c
4547 : 85 43 __ STA T0 + 0 
4549 : 18 __ __ CLC
454a : a9 97 __ LDA #$97
454c : 65 1c __ ADC ACCU + 1 
454e : 85 44 __ STA T0 + 1 
4550 : a4 1b __ LDY ACCU + 0 
4552 : b1 43 __ LDA (T0 + 0),y 
.s17:
4554 : 85 0f __ STA P2 
4556 : 20 69 45 JSR $4569 ; (period_finetune.s4 + 0)
4559 : 20 10 46 JSR $4610 ; (period_to_rate@proxy + 0)
455c : a5 1b __ LDA ACCU + 0 
455e : a6 47 __ LDX T3 + 0 
4560 : 9d f3 99 STA $99f3,x ; (modplay.channel[0].porta_target + 0)
4563 : a5 1c __ LDA ACCU + 1 
4565 : 9d f4 99 STA $99f4,x ; (modplay.channel[0].porta_target + 1)
.s3:
4568 : 60 __ __ RTS
--------------------------------------------------------------------
period_finetune: ; period_finetune(u16,u8)->u16
;  59, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4569 : a5 0f __ LDA P2 ; (finetune_raw + 0)
456b : c9 08 __ CMP #$08
456d : b0 03 __ BCS $4572 ; (period_finetune.s14 + 0)
456f : 4c 07 46 JMP $4607 ; (period_finetune.s5 + 0)
.s14:
4572 : e9 10 __ SBC #$10
4574 : 85 0f __ STA P2 ; (finetune_raw + 0)
4576 : f0 06 __ BEQ $457e ; (period_finetune.s6 + 0)
.s7:
4578 : a5 0e __ LDA P1 ; (period + 1)
457a : 05 0d __ ORA P0 ; (period + 0)
457c : d0 09 __ BNE $4587 ; (period_finetune.s8 + 0)
.s6:
457e : a5 0d __ LDA P0 ; (period + 0)
4580 : 85 1b __ STA ACCU + 0 
4582 : a5 0e __ LDA P1 ; (period + 1)
4584 : 4c 04 46 JMP $4604 ; (period_finetune.s3 + 0)
.s8:
4587 : a5 0f __ LDA P2 ; (finetune_raw + 0)
4589 : 10 05 __ BPL $4590 ; (period_finetune.s9 + 0)
.s13:
458b : 38 __ __ SEC
458c : a9 00 __ LDA #$00
458e : e5 0f __ SBC P2 ; (finetune_raw + 0)
.s9:
4590 : a6 0d __ LDX P0 ; (period + 0)
4592 : 86 1b __ STX ACCU + 0 
4594 : a6 0e __ LDX P1 ; (period + 1)
4596 : 86 1c __ STX ACCU + 1 
4598 : a2 00 __ LDX #$00
459a : 86 1d __ STX ACCU + 2 
459c : 86 1e __ STX ACCU + 3 
459e : 20 ca 73 JSR $73ca ; (mul32by8 + 0)
45a1 : a5 07 __ LDA WORK + 4 
45a3 : 85 1b __ STA ACCU + 0 
45a5 : a5 08 __ LDA WORK + 5 
45a7 : 85 1c __ STA ACCU + 1 
45a9 : a5 09 __ LDA WORK + 6 
45ab : 85 1d __ STA ACCU + 2 
45ad : a5 0a __ LDA WORK + 7 
45af : 85 1e __ STA ACCU + 3 
45b1 : a9 00 __ LDA #$00
45b3 : 85 05 __ STA WORK + 2 
45b5 : 85 06 __ STA WORK + 3 
45b7 : a9 e9 __ LDA #$e9
45b9 : 85 03 __ STA WORK + 0 
45bb : a9 02 __ LDA #$02
45bd : 85 04 __ STA WORK + 1 
45bf : 20 06 75 JSR $7506 ; (mul32 + 0)
45c2 : a5 07 __ LDA WORK + 4 
45c4 : 85 1b __ STA ACCU + 0 
45c6 : a5 08 __ LDA WORK + 5 
45c8 : 85 1c __ STA ACCU + 1 
45ca : a5 09 __ LDA WORK + 6 
45cc : 85 1d __ STA ACCU + 2 
45ce : a5 0a __ LDA WORK + 7 
45d0 : 85 1e __ STA ACCU + 3 
45d2 : a9 a0 __ LDA #$a0
45d4 : 85 03 __ STA WORK + 0 
45d6 : a9 00 __ LDA #$00
45d8 : 85 06 __ STA WORK + 3 
45da : a9 86 __ LDA #$86
45dc : 85 04 __ STA WORK + 1 
45de : a9 01 __ LDA #$01
45e0 : 85 05 __ STA WORK + 2 
45e2 : 20 6e 75 JSR $756e ; (divs32 + 0)
45e5 : a5 0f __ LDA P2 ; (finetune_raw + 0)
45e7 : 30 02 __ BMI $45eb ; (period_finetune.s10 + 0)
.s12:
45e9 : d0 0e __ BNE $45f9 ; (period_finetune.s11 + 0)
.s10:
45eb : 18 __ __ CLC
45ec : a5 0d __ LDA P0 ; (period + 0)
45ee : 65 1b __ ADC ACCU + 0 
45f0 : 85 1b __ STA ACCU + 0 
45f2 : a5 0e __ LDA P1 ; (period + 1)
45f4 : 65 1c __ ADC ACCU + 1 
45f6 : 4c 04 46 JMP $4604 ; (period_finetune.s3 + 0)
.s11:
45f9 : 38 __ __ SEC
45fa : a5 0d __ LDA P0 ; (period + 0)
45fc : e5 1b __ SBC ACCU + 0 
45fe : 85 1b __ STA ACCU + 0 
4600 : a5 0e __ LDA P1 ; (period + 1)
4602 : e5 1c __ SBC ACCU + 1 
.s3:
4604 : 85 1c __ STA ACCU + 1 
4606 : 60 __ __ RTS
.s5:
4607 : aa __ __ TAX
4608 : d0 03 __ BNE $460d ; (period_finetune.s5 + 6)
460a : 4c 7e 45 JMP $457e ; (period_finetune.s6 + 0)
460d : 4c 78 45 JMP $4578 ; (period_finetune.s7 + 0)
--------------------------------------------------------------------
period_to_rate@proxy: ; period_to_rate@proxy
4610 : a5 1b __ LDA ACCU + 0 
4612 : 85 0d __ STA P0 
4614 : a5 1c __ LDA ACCU + 1 
4616 : 85 0e __ STA P1 
--------------------------------------------------------------------
period_to_rate: ; period_to_rate(u16)->u16
;  41, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4618 : a5 0e __ LDA P1 ; (period + 1)
461a : 05 0d __ ORA P0 ; (period + 0)
461c : f0 3e __ BEQ $465c ; (period_to_rate.s6 + 0)
.s5:
461e : a5 0d __ LDA P0 ; (period + 0)
4620 : 85 1b __ STA ACCU + 0 
4622 : a5 0e __ LDA P1 ; (period + 1)
4624 : 85 1c __ STA ACCU + 1 
4626 : a9 00 __ LDA #$00
4628 : 85 1d __ STA ACCU + 2 
462a : 85 1e __ STA ACCU + 3 
462c : 85 05 __ STA WORK + 2 
462e : 85 06 __ STA WORK + 3 
4630 : a9 d4 __ LDA #$d4
4632 : 85 03 __ STA WORK + 0 
4634 : a9 30 __ LDA #$30
4636 : 85 04 __ STA WORK + 1 
4638 : 20 06 75 JSR $7506 ; (mul32 + 0)
463b : a5 07 __ LDA WORK + 4 
463d : 85 1b __ STA ACCU + 0 
463f : a5 08 __ LDA WORK + 5 
4641 : 85 1c __ STA ACCU + 1 
4643 : a5 09 __ LDA WORK + 6 
4645 : 85 1d __ STA ACCU + 2 
4647 : a5 0a __ LDA WORK + 7 
4649 : 85 1e __ STA ACCU + 3 
464b : a9 00 __ LDA #$00
464d : 85 05 __ STA WORK + 2 
464f : 85 06 __ STA WORK + 3 
4651 : a9 b6 __ LDA #$b6
4653 : 85 03 __ STA WORK + 0 
4655 : a9 1b __ LDA #$1b
4657 : 85 04 __ STA WORK + 1 
4659 : 4c 36 3f JMP $3f36 ; (divmod32 + 0)
.s6:
465c : 85 1b __ STA ACCU + 0 
465e : 85 1c __ STA ACCU + 1 
.s3:
4660 : 60 __ __ RTS
--------------------------------------------------------------------
fx_row: ; fx_row(u8)->void
; 242, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4661 : a4 0f __ LDY P2 ; (ch_idx + 0)
4663 : be bc 77 LDX $77bc,y ; (__multab50L + 0)
4666 : bd f2 99 LDA $99f2,x ; (modplay.channel[0].eparam + 0)
4669 : 85 1c __ STA ACCU + 1 
466b : 4a __ __ LSR
466c : 4a __ __ LSR
466d : 4a __ __ LSR
466e : 4a __ __ LSR
466f : 85 1b __ STA ACCU + 0 
4671 : bd f1 99 LDA $99f1,x ; (modplay.channel[0].effect + 0)
4674 : c9 08 __ CMP #$08
4676 : d0 09 __ BNE $4681 ; (fx_row.s5 + 0)
.s93:
4678 : a4 1b __ LDY ACCU + 0 
467a : b9 30 78 LDA $7830,y ; (__multab17L + 0)
467d : 9d f0 99 STA $99f0,x ; (modplay.channel[0].pan + 0)
.s3:
4680 : 60 __ __ RTS
.s5:
4681 : a5 1c __ LDA ACCU + 1 
4683 : 29 0f __ AND #$0f
4685 : 85 43 __ STA T0 + 0 
4687 : bd f1 99 LDA $99f1,x ; (modplay.channel[0].effect + 0)
468a : c9 08 __ CMP #$08
468c : b0 03 __ BCS $4691 ; (fx_row.s6 + 0)
468e : 4c c8 48 JMP $48c8 ; (fx_row.s74 + 0)
.s6:
4691 : c9 0c __ CMP #$0c
4693 : d0 03 __ BNE $4698 ; (fx_row.s7 + 0)
4695 : 4c ba 48 JMP $48ba ; (fx_row.s73 + 0)
.s7:
4698 : b0 03 __ BCS $469d ; (fx_row.s8 + 0)
469a : 4c 3d 48 JMP $483d ; (fx_row.s57 + 0)
.s8:
469d : c9 0e __ CMP #$0e
469f : f0 33 __ BEQ $46d4 ; (fx_row.s16 + 0)
.s9:
46a1 : 90 14 __ BCC $46b7 ; (fx_row.s15 + 0)
.s10:
46a3 : c9 0f __ CMP #$0f
46a5 : d0 d9 __ BNE $4680 ; (fx_row.s3 + 0)
.s11:
46a7 : a5 1c __ LDA ACCU + 1 
46a9 : f0 d5 __ BEQ $4680 ; (fx_row.s3 + 0)
.s12:
46ab : c9 20 __ CMP #$20
46ad : b0 04 __ BCS $46b3 ; (fx_row.s13 + 0)
.s14:
46af : 8d 93 97 STA $9793 ; (modplay.ticks_per_row + 0)
46b2 : 60 __ __ RTS
.s13:
46b3 : 8d 94 97 STA $9794 ; (modplay.bpm + 0)
46b6 : 60 __ __ RTS
.s15:
46b7 : ae 8f 97 LDX $978f ; (modplay.order_pos + 0)
46ba : e8 __ __ INX
46bb : 8e 9b 97 STX $979b ; (modplay.next_order + 0)
46be : a9 01 __ LDA #$01
46c0 : 8d 9a 97 STA $979a ; (modplay.skip_row_advance + 0)
46c3 : a6 1b __ LDX ACCU + 0 
46c5 : bd 20 78 LDA $7820,x ; (__multab10L + 0)
46c8 : 65 43 __ ADC T0 + 0 
46ca : c9 40 __ CMP #$40
46cc : 90 02 __ BCC $46d0 ; (fx_row.s96 + 0)
.s97:
46ce : a9 00 __ LDA #$00
.s96:
46d0 : 8d 9c 97 STA $979c ; (modplay.next_row + 0)
46d3 : 60 __ __ RTS
.s16:
46d4 : a5 1b __ LDA ACCU + 0 
46d6 : c9 07 __ CMP #$07
46d8 : d0 08 __ BNE $46e2 ; (fx_row.s17 + 0)
.s56:
46da : a5 43 __ LDA T0 + 0 
46dc : 29 07 __ AND #$07
46de : 9d fa 99 STA $99fa,x ; (modplay.channel[0].trm_wave + 0)
46e1 : 60 __ __ RTS
.s17:
46e2 : 86 46 __ STX T3 + 0 
46e4 : c9 07 __ CMP #$07
46e6 : 90 6d __ BCC $4755 ; (fx_row.s34 + 0)
.s18:
46e8 : c9 0c __ CMP #$0c
46ea : d0 0b __ BNE $46f7 ; (fx_row.s19 + 0)
.s33:
46ec : a5 43 __ LDA T0 + 0 
46ee : 9d 04 9a STA $9a04,x ; (modplay.channel[0].tick_stop + 0)
46f1 : a9 00 __ LDA #$00
46f3 : 9d 05 9a STA $9a05,x ; (modplay.channel[0].tick_cur + 0)
46f6 : 60 __ __ RTS
.s19:
46f7 : 90 25 __ BCC $471e ; (fx_row.s25 + 0)
.s20:
46f9 : c9 0d __ CMP #$0d
46fb : f0 0b __ BEQ $4708 ; (fx_row.s23 + 0)
.s21:
46fd : c9 0e __ CMP #$0e
46ff : f0 01 __ BEQ $4702 ; (fx_row.s22 + 0)
4701 : 60 __ __ RTS
.s22:
4702 : a5 43 __ LDA T0 + 0 
4704 : 8d 95 97 STA $9795 ; (modplay.pattern_delay + 0)
4707 : 60 __ __ RTS
.s23:
4708 : a5 43 __ LDA T0 + 0 
470a : 9d 04 9a STA $9a04,x ; (modplay.channel[0].tick_stop + 0)
470d : a9 00 __ LDA #$00
470f : 9d 05 9a STA $9a05,x ; (modplay.channel[0].tick_cur + 0)
4712 : bd 0a 9a LDA $9a0a,x ; (modplay.channel[0].needs_start + 0)
4715 : 9d 06 9a STA $9a06,x ; (modplay.channel[0].cmd_backup + 0)
.s24:
4718 : a9 00 __ LDA #$00
471a : 9d 0a 9a STA $9a0a,x ; (modplay.channel[0].needs_start + 0)
471d : 60 __ __ RTS
.s25:
471e : c9 0a __ CMP #$0a
4720 : d0 0f __ BNE $4731 ; (fx_row.s26 + 0)
.s32:
4722 : bd ef 99 LDA $99ef,x ; (modplay.channel[0].volume + 0)
4725 : 18 __ __ CLC
4726 : 65 43 __ ADC T0 + 0 
.s28:
4728 : 20 4d 49 JSR $494d ; (clamp_vol.s4 + 0)
472b : a6 46 __ LDX T3 + 0 
.s95:
472d : 9d ef 99 STA $99ef,x ; (modplay.channel[0].volume + 0)
4730 : 60 __ __ RTS
.s26:
4731 : b0 1a __ BCS $474d ; (fx_row.s27 + 0)
.s30:
4733 : c9 09 __ CMP #$09
4735 : f0 01 __ BEQ $4738 ; (fx_row.s31 + 0)
4737 : 60 __ __ RTS
.s31:
4738 : a5 43 __ LDA T0 + 0 
473a : 9d 04 9a STA $9a04,x ; (modplay.channel[0].tick_stop + 0)
473d : a9 00 __ LDA #$00
473f : 9d 05 9a STA $9a05,x ; (modplay.channel[0].tick_cur + 0)
4742 : bd 0a 9a LDA $9a0a,x ; (modplay.channel[0].needs_start + 0)
4745 : 9d 06 9a STA $9a06,x ; (modplay.channel[0].cmd_backup + 0)
4748 : a5 43 __ LDA T0 + 0 
474a : d0 cc __ BNE $4718 ; (fx_row.s24 + 0)
474c : 60 __ __ RTS
.s27:
474d : bd ef 99 LDA $99ef,x ; (modplay.channel[0].volume + 0)
4750 : e5 43 __ SBC T0 + 0 
4752 : 4c 28 47 JMP $4728 ; (fx_row.s28 + 0)
.s34:
4755 : c9 04 __ CMP #$04
4757 : d0 08 __ BNE $4761 ; (fx_row.s35 + 0)
.s55:
4759 : a5 43 __ LDA T0 + 0 
475b : 29 07 __ AND #$07
475d : 9d f6 99 STA $99f6,x ; (modplay.channel[0].vib_wave + 0)
4760 : 60 __ __ RTS
.s35:
4761 : 90 65 __ BCC $47c8 ; (fx_row.s46 + 0)
.s36:
4763 : c9 05 __ CMP #$05
4765 : d0 2f __ BNE $4796 ; (fx_row.s37 + 0)
.s43:
4767 : bd ea 99 LDA $99ea,x ; (modplay.channel[0].sample_num + 0)
476a : d0 01 __ BNE $476d ; (fx_row.s44 + 0)
476c : 60 __ __ RTS
.s44:
476d : ad 0d 97 LDA $970d ; (modplay.num_samples + 0)
4770 : dd ea 99 CMP $99ea,x ; (modplay.channel[0].sample_num + 0)
4773 : b0 01 __ BCS $4776 ; (fx_row.s45 + 0)
4775 : 60 __ __ RTS
.s45:
4776 : bd ea 99 LDA $99ea,x ; (modplay.channel[0].sample_num + 0)
4779 : 85 1b __ STA ACCU + 0 
477b : a9 00 __ LDA #$00
477d : 85 1c __ STA ACCU + 1 
477f : a9 13 __ LDA #$13
4781 : 20 92 73 JSR $7392 ; (mul16by8 + 0)
4784 : a9 9c __ LDA #$9c
4786 : 85 44 __ STA T1 + 0 
4788 : 18 __ __ CLC
4789 : a9 97 __ LDA #$97
478b : 65 1c __ ADC ACCU + 1 
478d : 85 45 __ STA T1 + 1 
478f : a5 43 __ LDA T0 + 0 
4791 : a4 1b __ LDY ACCU + 0 
4793 : 91 44 __ STA (T1 + 0),y 
4795 : 60 __ __ RTS
.s37:
4796 : a5 43 __ LDA T0 + 0 
4798 : d0 07 __ BNE $47a1 ; (fx_row.s39 + 0)
.s38:
479a : ad 91 97 LDA $9791 ; (modplay.row + 0)
479d : 9d 02 9a STA $9a02,x ; (modplay.channel[0].loop_row + 0)
47a0 : 60 __ __ RTS
.s39:
47a1 : bd 03 9a LDA $9a03,x ; (modplay.channel[0].loop_count + 0)
47a4 : f0 1a __ BEQ $47c0 ; (fx_row.s40 + 0)
.s42:
47a6 : 38 __ __ SEC
47a7 : e9 01 __ SBC #$01
47a9 : 9d 03 9a STA $9a03,x ; (modplay.channel[0].loop_count + 0)
47ac : d0 01 __ BNE $47af ; (fx_row.s41 + 0)
47ae : 60 __ __ RTS
.s41:
47af : a9 01 __ LDA #$01
47b1 : 8d 9a 97 STA $979a ; (modplay.skip_row_advance + 0)
47b4 : ad 8f 97 LDA $978f ; (modplay.order_pos + 0)
47b7 : 8d 9b 97 STA $979b ; (modplay.next_order + 0)
47ba : bd 02 9a LDA $9a02,x ; (modplay.channel[0].loop_row + 0)
47bd : 4c d0 46 JMP $46d0 ; (fx_row.s96 + 0)
.s40:
47c0 : a5 43 __ LDA T0 + 0 
47c2 : 9d 03 9a STA $9a03,x ; (modplay.channel[0].loop_count + 0)
47c5 : 4c af 47 JMP $47af ; (fx_row.s41 + 0)
.s46:
47c8 : c9 02 __ CMP #$02
47ca : f0 4e __ BEQ $481a ; (fx_row.s54 + 0)
.s47:
47cc : 90 01 __ BCC $47cf ; (fx_row.s48 + 0)
47ce : 60 __ __ RTS
.s48:
47cf : c9 01 __ CMP #$01
47d1 : f0 01 __ BEQ $47d4 ; (fx_row.s49 + 0)
47d3 : 60 __ __ RTS
.s49:
47d4 : bd ec 99 LDA $99ec,x ; (modplay.channel[0].period + 1)
47d7 : d0 09 __ BNE $47e2 ; (fx_row.s52 + 0)
.s53:
47d9 : a9 71 __ LDA #$71
47db : dd eb 99 CMP $99eb,x ; (modplay.channel[0].period + 0)
47de : a4 46 __ LDY T3 + 0 
47e0 : b0 1e __ BCS $4800 ; (fx_row.s50 + 0)
.s52:
47e2 : bd eb 99 LDA $99eb,x ; (modplay.channel[0].period + 0)
47e5 : 38 __ __ SEC
47e6 : e5 43 __ SBC T0 + 0 
47e8 : 85 0d __ STA P0 
47ea : bd ec 99 LDA $99ec,x ; (modplay.channel[0].period + 1)
47ed : e9 00 __ SBC #$00
47ef : 85 0e __ STA P1 
47f1 : 20 1d 49 JSR $491d ; (clamp_period.s4 + 0)
47f4 : a5 1b __ LDA ACCU + 0 
47f6 : a4 46 __ LDY T3 + 0 
47f8 : 99 eb 99 STA $99eb,y ; (modplay.channel[0].period + 0)
47fb : a5 1c __ LDA ACCU + 1 
47fd : 99 ec 99 STA $99ec,y ; (modplay.channel[0].period + 1)
.s50:
4800 : b9 eb 99 LDA $99eb,y ; (modplay.channel[0].period + 0)
4803 : 85 0d __ STA P0 
4805 : b9 ec 99 LDA $99ec,y ; (modplay.channel[0].period + 1)
.s51:
4808 : 85 0e __ STA P1 
480a : 20 18 46 JSR $4618 ; (period_to_rate.s4 + 0)
480d : a5 1b __ LDA ACCU + 0 
480f : a6 46 __ LDX T3 + 0 
4811 : 9d ed 99 STA $99ed,x ; (modplay.channel[0].rate + 0)
4814 : a5 1c __ LDA ACCU + 1 
4816 : 9d ee 99 STA $99ee,x ; (modplay.channel[0].rate + 1)
4819 : 60 __ __ RTS
.s54:
481a : bd eb 99 LDA $99eb,x ; (modplay.channel[0].period + 0)
481d : 18 __ __ CLC
481e : 65 43 __ ADC T0 + 0 
4820 : 85 0d __ STA P0 
4822 : bd ec 99 LDA $99ec,x ; (modplay.channel[0].period + 1)
4825 : 69 00 __ ADC #$00
4827 : 85 0e __ STA P1 
4829 : 20 1d 49 JSR $491d ; (clamp_period.s4 + 0)
482c : a5 1b __ LDA ACCU + 0 
482e : 85 0d __ STA P0 
4830 : a6 46 __ LDX T3 + 0 
4832 : 9d eb 99 STA $99eb,x ; (modplay.channel[0].period + 0)
4835 : a5 1c __ LDA ACCU + 1 
4837 : 9d ec 99 STA $99ec,x ; (modplay.channel[0].period + 1)
483a : 4c 08 48 JMP $4808 ; (fx_row.s51 + 0)
.s57:
483d : c9 0a __ CMP #$0a
483f : f0 6e __ BEQ $48af ; (fx_row.s71 + 0)
.s58:
4841 : b0 5f __ BCS $48a2 ; (fx_row.s59 + 0)
.s60:
4843 : a5 1c __ LDA ACCU + 1 
4845 : d0 01 __ BNE $4848 ; (fx_row.s61 + 0)
4847 : 60 __ __ RTS
.s61:
4848 : bd 13 9a LDA $9a13,x ; (modplay.channel[0].smp_length + 3)
484b : d0 29 __ BNE $4876 ; (fx_row.s63 + 0)
.s68:
484d : bd 12 9a LDA $9a12,x ; (modplay.channel[0].smp_length + 2)
4850 : d0 0b __ BNE $485d ; (fx_row.s62 + 0)
.s69:
4852 : bd 11 9a LDA $9a11,x ; (modplay.channel[0].smp_length + 1)
4855 : d0 06 __ BNE $485d ; (fx_row.s62 + 0)
.s70:
4857 : dd 10 9a CMP $9a10,x ; (modplay.channel[0].smp_length + 0)
485a : 90 01 __ BCC $485d ; (fx_row.s62 + 0)
485c : 60 __ __ RTS
.s62:
485d : bd 13 9a LDA $9a13,x ; (modplay.channel[0].smp_length + 3)
4860 : d0 14 __ BNE $4876 ; (fx_row.s63 + 0)
.s64:
4862 : bd 12 9a LDA $9a12,x ; (modplay.channel[0].smp_length + 2)
4865 : d0 0f __ BNE $4876 ; (fx_row.s63 + 0)
.s65:
4867 : a5 1c __ LDA ACCU + 1 
4869 : dd 11 9a CMP $9a11,x ; (modplay.channel[0].smp_length + 1)
486c : d0 05 __ BNE $4873 ; (fx_row.s67 + 0)
.s66:
486e : a9 00 __ LDA #$00
4870 : dd 10 9a CMP $9a10,x ; (modplay.channel[0].smp_length + 0)
.s67:
4873 : 90 01 __ BCC $4876 ; (fx_row.s63 + 0)
4875 : 60 __ __ RTS
.s63:
4876 : bd 11 9a LDA $9a11,x ; (modplay.channel[0].smp_length + 1)
4879 : 38 __ __ SEC
487a : e5 1c __ SBC ACCU + 1 
487c : 9d 11 9a STA $9a11,x ; (modplay.channel[0].smp_length + 1)
487f : bd 12 9a LDA $9a12,x ; (modplay.channel[0].smp_length + 2)
4882 : e9 00 __ SBC #$00
4884 : 9d 12 9a STA $9a12,x ; (modplay.channel[0].smp_length + 2)
4887 : b0 03 __ BCS $488c ; (fx_row.s99 + 0)
.s98:
4889 : de 13 9a DEC $9a13,x ; (modplay.channel[0].smp_length + 3)
.s99:
488c : bd 0d 9a LDA $9a0d,x ; (modplay.channel[0].smp_start + 1)
488f : 18 __ __ CLC
4890 : 65 1c __ ADC ACCU + 1 
4892 : 9d 0d 9a STA $9a0d,x ; (modplay.channel[0].smp_start + 1)
4895 : b0 01 __ BCS $4898 ; (fx_row.s101 + 0)
4897 : 60 __ __ RTS
.s101:
4898 : fe 0e 9a INC $9a0e,x ; (modplay.channel[0].smp_start + 2)
489b : f0 01 __ BEQ $489e ; (fx_row.s100 + 0)
489d : 60 __ __ RTS
.s100:
489e : fe 0f 9a INC $9a0f,x ; (modplay.channel[0].smp_start + 3)
48a1 : 60 __ __ RTS
.s59:
48a2 : a9 01 __ LDA #$01
48a4 : 8d 9a 97 STA $979a ; (modplay.skip_row_advance + 0)
48a7 : a5 1c __ LDA ACCU + 1 
48a9 : 8d 9b 97 STA $979b ; (modplay.next_order + 0)
48ac : 4c ce 46 JMP $46ce ; (fx_row.s97 + 0)
.s71:
48af : a5 1b __ LDA ACCU + 0 
48b1 : d0 03 __ BNE $48b6 ; (fx_row.s94 + 0)
.s72:
48b3 : 38 __ __ SEC
48b4 : e5 43 __ SBC T0 + 0 
.s94:
48b6 : 9d ff 99 STA $99ff,x ; (modplay.channel[0].volslide + 0)
48b9 : 60 __ __ RTS
.s73:
48ba : a9 40 __ LDA #$40
48bc : c5 1c __ CMP ACCU + 1 
48be : b0 03 __ BCS $48c3 ; (fx_row.s29 + 0)
48c0 : 4c 2d 47 JMP $472d ; (fx_row.s95 + 0)
.s29:
48c3 : a5 1c __ LDA ACCU + 1 
48c5 : 4c 2d 47 JMP $472d ; (fx_row.s95 + 0)
.s74:
48c8 : c9 04 __ CMP #$04
48ca : f0 41 __ BEQ $490d ; (fx_row.s89 + 0)
.s75:
48cc : 90 23 __ BCC $48f1 ; (fx_row.s83 + 0)
.s76:
48ce : c9 06 __ CMP #$06
48d0 : f0 dd __ BEQ $48af ; (fx_row.s71 + 0)
.s77:
48d2 : b0 07 __ BCS $48db ; (fx_row.s78 + 0)
.s82:
48d4 : a9 00 __ LDA #$00
48d6 : 9d 0a 9a STA $9a0a,x ; (modplay.channel[0].needs_start + 0)
48d9 : 90 d4 __ BCC $48af ; (fx_row.s71 + 0)
.s78:
48db : bd ef 99 LDA $99ef,x ; (modplay.channel[0].volume + 0)
48de : 9d fe 99 STA $99fe,x ; (modplay.channel[0].trm_basvol + 0)
48e1 : a5 43 __ LDA T0 + 0 
48e3 : f0 03 __ BEQ $48e8 ; (fx_row.s79 + 0)
.s81:
48e5 : 9d fc 99 STA $99fc,x ; (modplay.channel[0].trm_depth + 0)
.s79:
48e8 : a5 1b __ LDA ACCU + 0 
48ea : d0 01 __ BNE $48ed ; (fx_row.s80 + 0)
48ec : 60 __ __ RTS
.s80:
48ed : 9d fd 99 STA $99fd,x ; (modplay.channel[0].trm_speed + 0)
48f0 : 60 __ __ RTS
.s83:
48f1 : a8 __ __ TAY
48f2 : d0 04 __ BNE $48f8 ; (fx_row.s84 + 0)
.s88:
48f4 : 9d 00 9a STA $9a00,x ; (modplay.channel[0].arp_counter + 0)
48f7 : 60 __ __ RTS
.s84:
48f8 : a9 02 __ LDA #$02
48fa : dd f1 99 CMP $99f1,x ; (modplay.channel[0].effect + 0)
48fd : b0 05 __ BCS $4904 ; (fx_row.s87 + 0)
.s85:
48ff : a9 00 __ LDA #$00
4901 : 9d 0a 9a STA $9a0a,x ; (modplay.channel[0].needs_start + 0)
.s87:
4904 : a5 1c __ LDA ACCU + 1 
4906 : d0 01 __ BNE $4909 ; (fx_row.s86 + 0)
4908 : 60 __ __ RTS
.s86:
4909 : 9d f5 99 STA $99f5,x ; (modplay.channel[0].porta_speed + 0)
490c : 60 __ __ RTS
.s89:
490d : a5 43 __ LDA T0 + 0 
490f : f0 03 __ BEQ $4914 ; (fx_row.s90 + 0)
.s92:
4911 : 9d f8 99 STA $99f8,x ; (modplay.channel[0].vib_depth + 0)
.s90:
4914 : a5 1b __ LDA ACCU + 0 
4916 : d0 01 __ BNE $4919 ; (fx_row.s91 + 0)
4918 : 60 __ __ RTS
.s91:
4919 : 9d f9 99 STA $99f9,x ; (modplay.channel[0].vib_speed + 0)
491c : 60 __ __ RTS
--------------------------------------------------------------------
clamp_period: ; clamp_period(u16)->u16
; 144, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
491d : a5 0e __ LDA P1 ; (p + 1)
491f : d0 0f __ BNE $4930 ; (clamp_period.s5 + 0)
.s11:
4921 : a5 0d __ LDA P0 ; (p + 0)
4923 : c9 71 __ CMP #$71
4925 : b0 09 __ BCS $4930 ; (clamp_period.s5 + 0)
.s10:
4927 : a9 00 __ LDA #$00
4929 : a0 71 __ LDY #$71
.s3:
492b : 84 1b __ STY ACCU + 0 
492d : 85 1c __ STA ACCU + 1 
492f : 60 __ __ RTS
.s5:
4930 : a9 03 __ LDA #$03
4932 : c5 0e __ CMP P1 ; (p + 1)
4934 : f0 04 __ BEQ $493a ; (clamp_period.s8 + 0)
.s9:
4936 : 90 08 __ BCC $4940 ; (clamp_period.s7 + 0)
4938 : b0 0c __ BCS $4946 ; (clamp_period.s6 + 0)
.s8:
493a : a5 0d __ LDA P0 ; (p + 0)
493c : c9 59 __ CMP #$59
493e : 90 06 __ BCC $4946 ; (clamp_period.s6 + 0)
.s7:
4940 : a9 03 __ LDA #$03
4942 : a0 58 __ LDY #$58
4944 : d0 e5 __ BNE $492b ; (clamp_period.s3 + 0)
.s6:
4946 : a5 0e __ LDA P1 ; (p + 1)
4948 : a4 0d __ LDY P0 ; (p + 0)
494a : 4c 2b 49 JMP $492b ; (clamp_period.s3 + 0)
--------------------------------------------------------------------
clamp_vol: ; clamp_vol(i8)->u8
; 132, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
494d : 85 1b __ STA ACCU + 0 
494f : aa __ __ TAX
4950 : 10 03 __ BPL $4955 ; (clamp_vol.s5 + 0)
.s7:
4952 : a9 00 __ LDA #$00
.s3:
4954 : 60 __ __ RTS
.s5:
4955 : a9 40 __ LDA #$40
4957 : c5 1b __ CMP ACCU + 0 
4959 : 90 f9 __ BCC $4954 ; (clamp_vol.s3 + 0)
.s6:
495b : a5 1b __ LDA ACCU + 0 
495d : 60 __ __ RTS
--------------------------------------------------------------------
fx_tick: ; fx_tick(u8)->void
; 433, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
495e : a4 0f __ LDY P2 ; (ch_idx + 0)
4960 : be bc 77 LDX $77bc,y ; (__multab50L + 0)
4963 : 86 45 __ STX T3 + 0 
4965 : bd f1 99 LDA $99f1,x ; (modplay.channel[0].effect + 0)
4968 : c9 05 __ CMP #$05
496a : d0 05 __ BNE $4971 ; (fx_tick.s6 + 0)
.s5:
496c : a0 01 __ LDY #$01
496e : 4c d3 4a JMP $4ad3 ; (fx_tick.s34 + 0)
.s6:
4971 : 85 47 __ STA T5 + 0 
4973 : c9 05 __ CMP #$05
4975 : b0 03 __ BCS $497a ; (fx_tick.s7 + 0)
4977 : 4c b0 4a JMP $4ab0 ; (fx_tick.s31 + 0)
.s7:
497a : c9 0a __ CMP #$0a
497c : d0 03 __ BNE $4981 ; (fx_tick.s8 + 0)
497e : 4c a1 4a JMP $4aa1 ; (fx_tick.s29 + 0)
.s8:
4981 : 90 4d __ BCC $49d0 ; (fx_tick.s20 + 0)
.s9:
4983 : c9 0e __ CMP #$0e
4985 : d0 21 __ BNE $49a8 ; (fx_tick.s3 + 0)
.s10:
4987 : bd f2 99 LDA $99f2,x ; (modplay.channel[0].eparam + 0)
498a : 4a __ __ LSR
498b : 4a __ __ LSR
498c : 4a __ __ LSR
498d : 4a __ __ LSR
498e : c9 0c __ CMP #$0c
4990 : f0 2d __ BEQ $49bf ; (fx_tick.s18 + 0)
.s11:
4992 : 90 15 __ BCC $49a9 ; (fx_tick.s15 + 0)
.s12:
4994 : c9 0d __ CMP #$0d
4996 : d0 10 __ BNE $49a8 ; (fx_tick.s3 + 0)
.s13:
4998 : fe 05 9a INC $9a05,x ; (modplay.channel[0].tick_cur + 0)
499b : bd 05 9a LDA $9a05,x ; (modplay.channel[0].tick_cur + 0)
499e : dd 04 9a CMP $9a04,x ; (modplay.channel[0].tick_stop + 0)
49a1 : d0 05 __ BNE $49a8 ; (fx_tick.s3 + 0)
.s14:
49a3 : a9 01 __ LDA #$01
49a5 : 9d 0a 9a STA $9a0a,x ; (modplay.channel[0].needs_start + 0)
.s3:
49a8 : 60 __ __ RTS
.s15:
49a9 : c9 09 __ CMP #$09
49ab : d0 fb __ BNE $49a8 ; (fx_tick.s3 + 0)
.s16:
49ad : fe 05 9a INC $9a05,x ; (modplay.channel[0].tick_cur + 0)
49b0 : bd 05 9a LDA $9a05,x ; (modplay.channel[0].tick_cur + 0)
49b3 : dd 04 9a CMP $9a04,x ; (modplay.channel[0].tick_stop + 0)
49b6 : 90 f0 __ BCC $49a8 ; (fx_tick.s3 + 0)
.s17:
49b8 : a9 00 __ LDA #$00
49ba : 9d 05 9a STA $9a05,x ; (modplay.channel[0].tick_cur + 0)
49bd : b0 e4 __ BCS $49a3 ; (fx_tick.s14 + 0)
.s18:
49bf : fe 05 9a INC $9a05,x ; (modplay.channel[0].tick_cur + 0)
49c2 : bd 05 9a LDA $9a05,x ; (modplay.channel[0].tick_cur + 0)
49c5 : dd 04 9a CMP $9a04,x ; (modplay.channel[0].tick_stop + 0)
49c8 : 90 de __ BCC $49a8 ; (fx_tick.s3 + 0)
.s19:
49ca : a9 00 __ LDA #$00
.s60:
49cc : 9d ef 99 STA $99ef,x ; (modplay.channel[0].volume + 0)
49cf : 60 __ __ RTS
.s20:
49d0 : c9 06 __ CMP #$06
49d2 : f0 58 __ BEQ $4a2c ; (fx_tick.s26 + 0)
.s21:
49d4 : c9 07 __ CMP #$07
49d6 : d0 d0 __ BNE $49a8 ; (fx_tick.s3 + 0)
.s22:
49d8 : bd fa 99 LDA $99fa,x ; (modplay.channel[0].trm_wave + 0)
49db : 85 0d __ STA P0 
49dd : bd fb 99 LDA $99fb,x ; (modplay.channel[0].trm_pos + 0)
49e0 : 85 0e __ STA P1 
49e2 : 20 b4 4b JSR $4bb4 ; (wave_value.s4 + 0)
49e5 : aa __ __ TAX
49e6 : a4 45 __ LDY T3 + 0 
49e8 : b9 fc 99 LDA $99fc,y ; (modplay.channel[0].trm_depth + 0)
49eb : 85 1b __ STA ACCU + 0 
49ed : a9 00 __ LDA #$00
49ef : 85 1c __ STA ACCU + 1 
49f1 : 8a __ __ TXA
49f2 : 20 92 73 JSR $7392 ; (mul16by8 + 0)
49f5 : a5 1c __ LDA ACCU + 1 
49f7 : 85 43 __ STA T0 + 0 
49f9 : a5 1b __ LDA ACCU + 0 
49fb : 0a __ __ ASL
49fc : 26 43 __ ROL T0 + 0 
49fe : 0a __ __ ASL
49ff : 26 43 __ ROL T0 + 0 
4a01 : a5 0e __ LDA P1 
4a03 : a4 45 __ LDY T3 + 0 
4a05 : 29 10 __ AND #$10
4a07 : d0 09 __ BNE $4a12 ; (fx_tick.s25 + 0)
.s23:
4a09 : 18 __ __ CLC
4a0a : a5 43 __ LDA T0 + 0 
4a0c : 79 fe 99 ADC $99fe,y ; (modplay.channel[0].trm_basvol + 0)
4a0f : 4c 18 4a JMP $4a18 ; (fx_tick.s24 + 0)
.s25:
4a12 : b9 fe 99 LDA $99fe,y ; (modplay.channel[0].trm_basvol + 0)
4a15 : 38 __ __ SEC
4a16 : e5 43 __ SBC T0 + 0 
.s24:
4a18 : 20 4d 49 JSR $494d ; (clamp_vol.s4 + 0)
4a1b : a6 45 __ LDX T3 + 0 
4a1d : 9d ef 99 STA $99ef,x ; (modplay.channel[0].volume + 0)
4a20 : bd fd 99 LDA $99fd,x ; (modplay.channel[0].trm_speed + 0)
4a23 : 18 __ __ CLC
4a24 : 65 0e __ ADC P1 
4a26 : 29 3f __ AND #$3f
4a28 : 9d fb 99 STA $99fb,x ; (modplay.channel[0].trm_pos + 0)
4a2b : 60 __ __ RTS
.s26:
4a2c : bd f6 99 LDA $99f6,x ; (modplay.channel[0].vib_wave + 0)
4a2f : 85 0d __ STA P0 
4a31 : bd f7 99 LDA $99f7,x ; (modplay.channel[0].vib_pos + 0)
4a34 : 85 0e __ STA P1 
4a36 : 20 b4 4b JSR $4bb4 ; (wave_value.s4 + 0)
4a39 : aa __ __ TAX
4a3a : a4 45 __ LDY T3 + 0 
4a3c : b9 f8 99 LDA $99f8,y ; (modplay.channel[0].vib_depth + 0)
4a3f : 85 1b __ STA ACCU + 0 
4a41 : a9 00 __ LDA #$00
4a43 : 85 1c __ STA ACCU + 1 
4a45 : 8a __ __ TXA
4a46 : 20 92 73 JSR $7392 ; (mul16by8 + 0)
4a49 : a5 1c __ LDA ACCU + 1 
4a4b : 06 1b __ ASL ACCU + 0 
4a4d : 2a __ __ ROL
4a4e : 85 43 __ STA T0 + 0 
4a50 : a9 00 __ LDA #$00
4a52 : 2a __ __ ROL
4a53 : 85 44 __ STA T0 + 1 
4a55 : a5 0e __ LDA P1 
4a57 : 85 46 __ STA T4 + 0 
4a59 : a4 45 __ LDY T3 + 0 
4a5b : 29 10 __ AND #$10
4a5d : d0 0f __ BNE $4a6e ; (fx_tick.s30 + 0)
.s27:
4a5f : b9 eb 99 LDA $99eb,y ; (modplay.channel[0].period + 0)
4a62 : 65 43 __ ADC T0 + 0 
4a64 : 85 0d __ STA P0 
4a66 : b9 ec 99 LDA $99ec,y ; (modplay.channel[0].period + 1)
4a69 : 65 44 __ ADC T0 + 1 
4a6b : 4c 7b 4a JMP $4a7b ; (fx_tick.s28 + 0)
.s30:
4a6e : b9 eb 99 LDA $99eb,y ; (modplay.channel[0].period + 0)
4a71 : 38 __ __ SEC
4a72 : e5 43 __ SBC T0 + 0 
4a74 : 85 0d __ STA P0 
4a76 : b9 ec 99 LDA $99ec,y ; (modplay.channel[0].period + 1)
4a79 : e5 44 __ SBC T0 + 1 
.s28:
4a7b : 85 0e __ STA P1 
4a7d : 20 1d 49 JSR $491d ; (clamp_period.s4 + 0)
4a80 : 20 10 46 JSR $4610 ; (period_to_rate@proxy + 0)
4a83 : a5 1b __ LDA ACCU + 0 
4a85 : a6 45 __ LDX T3 + 0 
4a87 : 9d ed 99 STA $99ed,x ; (modplay.channel[0].rate + 0)
4a8a : a5 1c __ LDA ACCU + 1 
4a8c : 9d ee 99 STA $99ee,x ; (modplay.channel[0].rate + 1)
4a8f : bd f9 99 LDA $99f9,x ; (modplay.channel[0].vib_speed + 0)
4a92 : 18 __ __ CLC
4a93 : 65 46 __ ADC T4 + 0 
4a95 : 29 3f __ AND #$3f
4a97 : 9d f7 99 STA $99f7,x ; (modplay.channel[0].vib_pos + 0)
4a9a : a5 47 __ LDA T5 + 0 
4a9c : c9 06 __ CMP #$06
4a9e : f0 01 __ BEQ $4aa1 ; (fx_tick.s29 + 0)
4aa0 : 60 __ __ RTS
.s29:
4aa1 : bd ef 99 LDA $99ef,x ; (modplay.channel[0].volume + 0)
4aa4 : 18 __ __ CLC
4aa5 : 7d ff 99 ADC $99ff,x ; (modplay.channel[0].volslide + 0)
4aa8 : 20 4d 49 JSR $494d ; (clamp_vol.s4 + 0)
4aab : a6 45 __ LDX T3 + 0 
4aad : 4c cc 49 JMP $49cc ; (fx_tick.s60 + 0)
.s31:
4ab0 : c9 02 __ CMP #$02
4ab2 : d0 11 __ BNE $4ac5 ; (fx_tick.s32 + 0)
.s59:
4ab4 : bd f5 99 LDA $99f5,x ; (modplay.channel[0].porta_speed + 0)
4ab7 : 18 __ __ CLC
4ab8 : 7d eb 99 ADC $99eb,x ; (modplay.channel[0].period + 0)
4abb : 85 0d __ STA P0 
4abd : bd ec 99 LDA $99ec,x ; (modplay.channel[0].period + 1)
4ac0 : 69 00 __ ADC #$00
4ac2 : 4c 8f 4b JMP $4b8f ; (fx_tick.s57 + 0)
.s32:
4ac5 : b0 03 __ BCS $4aca ; (fx_tick.s33 + 0)
4ac7 : 4c 61 4b JMP $4b61 ; (fx_tick.s51 + 0)
.s33:
4aca : a0 00 __ LDY #$00
4acc : c9 03 __ CMP #$03
4ace : f0 03 __ BEQ $4ad3 ; (fx_tick.s34 + 0)
4ad0 : 4c 2c 4a JMP $4a2c ; (fx_tick.s26 + 0)
.s34:
4ad3 : bd f3 99 LDA $99f3,x ; (modplay.channel[0].porta_target + 0)
4ad6 : 85 43 __ STA T0 + 0 
4ad8 : bd f4 99 LDA $99f4,x ; (modplay.channel[0].porta_target + 1)
4adb : 85 44 __ STA T0 + 1 
4add : 05 43 __ ORA T0 + 0 
4adf : f0 58 __ BEQ $4b39 ; (fx_tick.s35 + 0)
.s36:
4ae1 : bd ee 99 LDA $99ee,x ; (modplay.channel[0].rate + 1)
4ae4 : 85 1c __ STA ACCU + 1 
4ae6 : c5 44 __ CMP T0 + 1 
4ae8 : d0 09 __ BNE $4af3 ; (fx_tick.s37 + 0)
.s50:
4aea : a5 43 __ LDA T0 + 0 
4aec : dd ed 99 CMP $99ed,x ; (modplay.channel[0].rate + 0)
4aef : f0 48 __ BEQ $4b39 ; (fx_tick.s35 + 0)
.s61:
4af1 : a5 1c __ LDA ACCU + 1 
.s37:
4af3 : c5 44 __ CMP T0 + 1 
4af5 : d0 05 __ BNE $4afc ; (fx_tick.s49 + 0)
.s48:
4af7 : bd ed 99 LDA $99ed,x ; (modplay.channel[0].rate + 0)
4afa : c5 43 __ CMP T0 + 0 
.s49:
4afc : 90 42 __ BCC $4b40 ; (fx_tick.s45 + 0)
.s38:
4afe : a5 1c __ LDA ACCU + 1 
4b00 : d0 11 __ BNE $4b13 ; (fx_tick.s43 + 0)
.s44:
4b02 : bd f5 99 LDA $99f5,x ; (modplay.channel[0].porta_speed + 0)
4b05 : dd ed 99 CMP $99ed,x ; (modplay.channel[0].rate + 0)
4b08 : 90 09 __ BCC $4b13 ; (fx_tick.s43 + 0)
.s39:
4b0a : a5 43 __ LDA T0 + 0 
4b0c : 9d ed 99 STA $99ed,x ; (modplay.channel[0].rate + 0)
4b0f : a5 44 __ LDA T0 + 1 
4b11 : b0 0e __ BCS $4b21 ; (fx_tick.s40 + 0)
.s43:
4b13 : bd ed 99 LDA $99ed,x ; (modplay.channel[0].rate + 0)
4b16 : 38 __ __ SEC
4b17 : fd f5 99 SBC $99f5,x ; (modplay.channel[0].porta_speed + 0)
4b1a : 9d ed 99 STA $99ed,x ; (modplay.channel[0].rate + 0)
4b1d : a5 1c __ LDA ACCU + 1 
4b1f : e9 00 __ SBC #$00
.s40:
4b21 : 9d ee 99 STA $99ee,x ; (modplay.channel[0].rate + 1)
4b24 : c5 44 __ CMP T0 + 1 
4b26 : d0 05 __ BNE $4b2d ; (fx_tick.s47 + 0)
.s42:
4b28 : bd ed 99 LDA $99ed,x ; (modplay.channel[0].rate + 0)
4b2b : c5 43 __ CMP T0 + 0 
.s47:
4b2d : b0 0a __ BCS $4b39 ; (fx_tick.s35 + 0)
.s41:
4b2f : a5 43 __ LDA T0 + 0 
4b31 : 9d ed 99 STA $99ed,x ; (modplay.channel[0].rate + 0)
4b34 : a5 44 __ LDA T0 + 1 
4b36 : 9d ee 99 STA $99ee,x ; (modplay.channel[0].rate + 1)
.s35:
4b39 : 98 __ __ TYA
4b3a : f0 03 __ BEQ $4b3f ; (fx_tick.s35 + 6)
4b3c : 4c a1 4a JMP $4aa1 ; (fx_tick.s29 + 0)
4b3f : 60 __ __ RTS
.s45:
4b40 : bd f5 99 LDA $99f5,x ; (modplay.channel[0].porta_speed + 0)
4b43 : 7d ed 99 ADC $99ed,x ; (modplay.channel[0].rate + 0)
4b46 : 85 1b __ STA ACCU + 0 
4b48 : 9d ed 99 STA $99ed,x ; (modplay.channel[0].rate + 0)
4b4b : a5 1c __ LDA ACCU + 1 
4b4d : 69 00 __ ADC #$00
4b4f : 85 1c __ STA ACCU + 1 
4b51 : 9d ee 99 STA $99ee,x ; (modplay.channel[0].rate + 1)
4b54 : a5 44 __ LDA T0 + 1 
4b56 : c5 1c __ CMP ACCU + 1 
4b58 : d0 d3 __ BNE $4b2d ; (fx_tick.s47 + 0)
.s46:
4b5a : a5 43 __ LDA T0 + 0 
4b5c : c5 1b __ CMP ACCU + 0 
4b5e : 4c 2d 4b JMP $4b2d ; (fx_tick.s47 + 0)
.s51:
4b61 : a8 __ __ TAY
4b62 : d0 10 __ BNE $4b74 ; (fx_tick.s55 + 0)
.s52:
4b64 : bd f2 99 LDA $99f2,x ; (modplay.channel[0].eparam + 0)
4b67 : d0 01 __ BNE $4b6a ; (fx_tick.s53 + 0)
4b69 : 60 __ __ RTS
.s53:
4b6a : bd ea 99 LDA $99ea,x ; (modplay.channel[0].sample_num + 0)
4b6d : d0 01 __ BNE $4b70 ; (fx_tick.s54 + 0)
4b6f : 60 __ __ RTS
.s54:
4b70 : fe 00 9a INC $9a00,x ; (modplay.channel[0].arp_counter + 0)
4b73 : 60 __ __ RTS
.s55:
4b74 : bd ec 99 LDA $99ec,x ; (modplay.channel[0].period + 1)
4b77 : d0 08 __ BNE $4b81 ; (fx_tick.s56 + 0)
.s58:
4b79 : a9 71 __ LDA #$71
4b7b : dd eb 99 CMP $99eb,x ; (modplay.channel[0].period + 0)
4b7e : 90 01 __ BCC $4b81 ; (fx_tick.s56 + 0)
4b80 : 60 __ __ RTS
.s56:
4b81 : bd eb 99 LDA $99eb,x ; (modplay.channel[0].period + 0)
4b84 : 38 __ __ SEC
4b85 : fd f5 99 SBC $99f5,x ; (modplay.channel[0].porta_speed + 0)
4b88 : 85 0d __ STA P0 
4b8a : bd ec 99 LDA $99ec,x ; (modplay.channel[0].period + 1)
4b8d : e9 00 __ SBC #$00
.s57:
4b8f : 85 0e __ STA P1 
4b91 : 20 1d 49 JSR $491d ; (clamp_period.s4 + 0)
4b94 : a5 1b __ LDA ACCU + 0 
4b96 : 85 0d __ STA P0 
4b98 : a6 45 __ LDX T3 + 0 
4b9a : 9d eb 99 STA $99eb,x ; (modplay.channel[0].period + 0)
4b9d : a5 1c __ LDA ACCU + 1 
4b9f : 85 0e __ STA P1 
4ba1 : 9d ec 99 STA $99ec,x ; (modplay.channel[0].period + 1)
4ba4 : 20 18 46 JSR $4618 ; (period_to_rate.s4 + 0)
4ba7 : a5 1b __ LDA ACCU + 0 
4ba9 : a6 45 __ LDX T3 + 0 
4bab : 9d ed 99 STA $99ed,x ; (modplay.channel[0].rate + 0)
4bae : a5 1c __ LDA ACCU + 1 
4bb0 : 9d ee 99 STA $99ee,x ; (modplay.channel[0].rate + 1)
4bb3 : 60 __ __ RTS
--------------------------------------------------------------------
wave_value: ; wave_value(u8,u8)->u8
; 156, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4bb4 : a5 0e __ LDA P1 ; (pos + 0)
4bb6 : 29 1f __ AND #$1f
4bb8 : a8 __ __ TAY
4bb9 : a5 0d __ LDA P0 ; (wave + 0)
4bbb : 29 03 __ AND #$03
4bbd : c9 01 __ CMP #$01
4bbf : d0 07 __ BNE $4bc8 ; (wave_value.s5 + 0)
.s10:
4bc1 : 98 __ __ TYA
4bc2 : 0a __ __ ASL
4bc3 : 0a __ __ ASL
4bc4 : 0a __ __ ASL
4bc5 : 49 ff __ EOR #$ff
.s3:
4bc7 : 60 __ __ RTS
.s5:
4bc8 : aa __ __ TAX
4bc9 : d0 04 __ BNE $4bcf ; (wave_value.s6 + 0)
.s9:
4bcb : b9 93 7c LDA $7c93,y ; (vib_sine[0] + 0)
4bce : 60 __ __ RTS
.s6:
4bcf : c9 02 __ CMP #$02
4bd1 : d0 03 __ BNE $4bd6 ; (wave_value.s7 + 0)
.s8:
4bd3 : a9 ff __ LDA #$ff
4bd5 : 60 __ __ RTS
.s7:
4bd6 : 98 __ __ TYA
4bd7 : 0a __ __ ASL
4bd8 : 0a __ __ ASL
4bd9 : 0a __ __ ASL
4bda : 60 __ __ RTS
--------------------------------------------------------------------
ua_update_channel: ; ua_update_channel(u8)->void
;  86, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s1:
4bdb : 38 __ __ SEC
4bdc : a5 23 __ LDA SP + 0 
4bde : e9 0c __ SBC #$0c
4be0 : 85 23 __ STA SP + 0 
4be2 : b0 02 __ BCS $4be6 ; (ua_update_channel.s1 + 11)
4be4 : c6 24 __ DEC SP + 1 
4be6 : a0 03 __ LDY #$03
4be8 : b9 53 00 LDA $0053,y 
4beb : 91 23 __ STA (SP + 0),y 
4bed : 88 __ __ DEY
4bee : 10 f8 __ BPL $4be8 ; (ua_update_channel.s1 + 13)
.s4:
4bf0 : ad 96 97 LDA $9796 ; (modplay.master_volume + 0)
4bf3 : 85 1b __ STA ACCU + 0 
4bf5 : a6 13 __ LDX P6 ; (ch + 0)
4bf7 : 86 47 __ STX T1 + 0 
4bf9 : bd bc 77 LDA $77bc,x ; (__multab50L + 0)
4bfc : 85 43 __ STA T0 + 0 
4bfe : aa __ __ TAX
4bff : a9 00 __ LDA #$00
4c01 : 85 1c __ STA ACCU + 1 
4c03 : bd ef 99 LDA $99ef,x ; (modplay.channel[0].volume + 0)
4c06 : 20 92 73 JSR $7392 ; (mul16by8 + 0)
4c09 : a5 1c __ LDA ACCU + 1 
4c0b : 85 50 __ STA T6 + 0 
4c0d : a5 1b __ LDA ACCU + 0 
4c0f : 0a __ __ ASL
4c10 : 26 50 __ ROL T6 + 0 
4c12 : 0a __ __ ASL
4c13 : 26 50 __ ROL T6 + 0 
4c15 : a4 43 __ LDY T0 + 0 
4c17 : b9 0a 9a LDA $9a0a,y ; (modplay.channel[0].needs_start + 0)
4c1a : d0 5f __ BNE $4c7b ; (ua_update_channel.s10 + 0)
.s5:
4c1c : a5 50 __ LDA T6 + 0 
4c1e : d9 07 9a CMP $9a07,y ; (modplay.channel[0].ua_vol + 0)
4c21 : f0 0f __ BEQ $4c32 ; (ua_update_channel.s6 + 0)
.s9:
4c23 : 06 47 __ ASL T1 + 0 
4c25 : a4 47 __ LDY T1 + 0 
4c27 : be e8 78 LDX $78e8,y ; (audio_ch_base[0] + 0)
4c2a : 9d 01 df STA $df01,x 
4c2d : a4 43 __ LDY T0 + 0 
4c2f : 99 07 9a STA $9a07,y ; (modplay.channel[0].ua_vol + 0)
.s6:
4c32 : b9 ee 99 LDA $99ee,y ; (modplay.channel[0].rate + 1)
4c35 : d9 09 9a CMP $9a09,y ; (modplay.channel[0].ua_rate + 1)
4c38 : d0 08 __ BNE $4c42 ; (ua_update_channel.s7 + 0)
.s8:
4c3a : b9 ed 99 LDA $99ed,y ; (modplay.channel[0].rate + 0)
4c3d : d9 08 9a CMP $9a08,y ; (modplay.channel[0].ua_rate + 0)
4c40 : f0 23 __ BEQ $4c65 ; (ua_update_channel.s3 + 0)
.s7:
4c42 : b9 ed 99 LDA $99ed,y ; (modplay.channel[0].rate + 0)
4c45 : 85 0e __ STA P1 
4c47 : a5 13 __ LDA P6 ; (ch + 0)
4c49 : 0a __ __ ASL
4c4a : aa __ __ TAX
4c4b : b9 ee 99 LDA $99ee,y ; (modplay.channel[0].rate + 1)
4c4e : 85 0f __ STA P2 
4c50 : bc e8 78 LDY $78e8,x ; (audio_ch_base[0] + 0)
4c53 : 99 0e df STA $df0e,y 
4c56 : a5 0e __ LDA P1 
4c58 : 99 0f df STA $df0f,y 
4c5b : a6 43 __ LDX T0 + 0 
4c5d : 9d 08 9a STA $9a08,x ; (modplay.channel[0].ua_rate + 0)
4c60 : a5 0f __ LDA P2 
.s14:
4c62 : 9d 09 9a STA $9a09,x ; (modplay.channel[0].ua_rate + 1)
.s3:
4c65 : a0 03 __ LDY #$03
4c67 : b1 23 __ LDA (SP + 0),y 
4c69 : 99 53 00 STA $0053,y 
4c6c : 88 __ __ DEY
4c6d : 10 f8 __ BPL $4c67 ; (ua_update_channel.s3 + 2)
4c6f : 18 __ __ CLC
4c70 : a5 23 __ LDA SP + 0 
4c72 : 69 0c __ ADC #$0c
4c74 : 85 23 __ STA SP + 0 
4c76 : 90 02 __ BCC $4c7a ; (ua_update_channel.s3 + 21)
4c78 : e6 24 __ INC SP + 1 
4c7a : 60 __ __ RTS
.s10:
4c7b : 84 51 __ STY T7 + 0 
4c7d : a5 13 __ LDA P6 ; (ch + 0)
4c7f : 85 0d __ STA P0 
4c81 : a9 00 __ LDA #$00
4c83 : 99 0a 9a STA $9a0a,y ; (modplay.channel[0].needs_start + 0)
4c86 : b9 0c 9a LDA $9a0c,y ; (modplay.channel[0].smp_start + 0)
4c89 : 85 0e __ STA P1 
4c8b : b9 0d 9a LDA $9a0d,y ; (modplay.channel[0].smp_start + 1)
4c8e : 85 0f __ STA P2 
4c90 : b9 0e 9a LDA $9a0e,y ; (modplay.channel[0].smp_start + 2)
4c93 : 85 10 __ STA P3 
4c95 : b9 0f 9a LDA $9a0f,y ; (modplay.channel[0].smp_start + 3)
4c98 : 85 11 __ STA P4 
4c9a : 06 47 __ ASL T1 + 0 
4c9c : a6 47 __ LDX T1 + 0 
4c9e : bd e8 78 LDA $78e8,x ; (audio_ch_base[0] + 0)
4ca1 : 85 4f __ STA T5 + 0 
4ca3 : 85 53 __ STA T8 + 0 
4ca5 : b9 ed 99 LDA $99ed,y ; (modplay.channel[0].rate + 0)
4ca8 : 85 55 __ STA T9 + 0 
4caa : a9 df __ LDA #$df
4cac : 85 54 __ STA T8 + 1 
4cae : b9 ee 99 LDA $99ee,y ; (modplay.channel[0].rate + 1)
4cb1 : 85 56 __ STA T9 + 1 
4cb3 : b9 10 9a LDA $9a10,y ; (modplay.channel[0].smp_length + 0)
4cb6 : 85 43 __ STA T0 + 0 
4cb8 : b9 11 9a LDA $9a11,y ; (modplay.channel[0].smp_length + 1)
4cbb : 85 44 __ STA T0 + 1 
4cbd : b9 12 9a LDA $9a12,y ; (modplay.channel[0].smp_length + 2)
4cc0 : 85 45 __ STA T0 + 2 
4cc2 : b9 13 9a LDA $9a13,y ; (modplay.channel[0].smp_length + 3)
4cc5 : 85 46 __ STA T0 + 3 
4cc7 : b9 0b 9a LDA $9a0b,y ; (modplay.channel[0].needs_loop + 0)
4cca : d0 03 __ BNE $4ccf ; (ua_update_channel.s13 + 0)
4ccc : 4c 54 4d JMP $4d54 ; (ua_update_channel.s11 + 0)
.s13:
4ccf : a6 51 __ LDX T7 + 0 
4cd1 : bd 14 9a LDA $9a14,x ; (modplay.channel[0].smp_loop_a + 0)
4cd4 : 85 47 __ STA T1 + 0 
4cd6 : bd 15 9a LDA $9a15,x ; (modplay.channel[0].smp_loop_a + 1)
4cd9 : 85 48 __ STA T1 + 1 
4cdb : bd 16 9a LDA $9a16,x ; (modplay.channel[0].smp_loop_a + 2)
4cde : 85 49 __ STA T1 + 2 
4ce0 : bd 17 9a LDA $9a17,x ; (modplay.channel[0].smp_loop_a + 3)
4ce3 : 85 4a __ STA T1 + 3 
4ce5 : bd 18 9a LDA $9a18,x ; (modplay.channel[0].smp_loop_b + 0)
4ce8 : 85 4b __ STA T2 + 0 
4cea : bd 19 9a LDA $9a19,x ; (modplay.channel[0].smp_loop_b + 1)
4ced : 85 4c __ STA T2 + 1 
4cef : bd 1a 9a LDA $9a1a,x ; (modplay.channel[0].smp_loop_b + 2)
4cf2 : 85 4d __ STA T2 + 2 
4cf4 : bd 1b 9a LDA $9a1b,x ; (modplay.channel[0].smp_loop_b + 3)
4cf7 : 85 4e __ STA T2 + 3 
4cf9 : a9 00 __ LDA #$00
4cfb : a6 4f __ LDX T5 + 0 
4cfd : 9d 00 df STA $df00,x 
4d00 : a5 50 __ LDA T6 + 0 
4d02 : 9d 01 df STA $df01,x 
4d05 : b9 f0 99 LDA $99f0,y ; (modplay.channel[0].pan + 0)
4d08 : 9d 02 df STA $df02,x 
4d0b : 20 92 4d JSR $4d92 ; (ch_wr_sms.s4 + 0)
4d0e : 20 ae 4d JSR $4dae ; (ch_wr_be24@proxy + 0)
4d11 : a5 0d __ LDA P0 
4d13 : 0a __ __ ASL
4d14 : aa __ __ TAX
4d15 : a5 56 __ LDA T9 + 1 
4d17 : bc e8 78 LDY $78e8,x ; (audio_ch_base[0] + 0)
4d1a : 99 0e df STA $df0e,y 
4d1d : a5 55 __ LDA T9 + 0 
4d1f : 99 0f df STA $df0f,y 
4d22 : a5 47 __ LDA T1 + 0 
4d24 : 85 0f __ STA P2 
4d26 : a9 11 __ LDA #$11
4d28 : 85 0e __ STA P1 
4d2a : a5 48 __ LDA T1 + 1 
4d2c : 85 10 __ STA P3 
4d2e : a5 49 __ LDA T1 + 2 
4d30 : 85 11 __ STA P4 
4d32 : a5 4a __ LDA T1 + 3 
4d34 : 85 12 __ STA P5 
4d36 : 20 c2 4d JSR $4dc2 ; (ch_wr_be24.s4 + 0)
4d39 : a5 4b __ LDA T2 + 0 
4d3b : 85 0f __ STA P2 
4d3d : a9 15 __ LDA #$15
4d3f : 85 0e __ STA P1 
4d41 : a5 4c __ LDA T2 + 1 
4d43 : 85 10 __ STA P3 
4d45 : a5 4d __ LDA T2 + 2 
4d47 : 85 11 __ STA P4 
4d49 : a5 4e __ LDA T2 + 3 
4d4b : 85 12 __ STA P5 
4d4d : 20 c2 4d JSR $4dc2 ; (ch_wr_be24.s4 + 0)
4d50 : a9 03 __ LDA #$03
4d52 : d0 29 __ BNE $4d7d ; (ua_update_channel.s12 + 0)
.s11:
4d54 : a6 4f __ LDX T5 + 0 
4d56 : 9d 00 df STA $df00,x 
4d59 : a5 50 __ LDA T6 + 0 
4d5b : 9d 01 df STA $df01,x 
4d5e : b9 f0 99 LDA $99f0,y ; (modplay.channel[0].pan + 0)
4d61 : 9d 02 df STA $df02,x 
4d64 : 20 92 4d JSR $4d92 ; (ch_wr_sms.s4 + 0)
4d67 : 20 ae 4d JSR $4dae ; (ch_wr_be24@proxy + 0)
4d6a : a5 0d __ LDA P0 
4d6c : 0a __ __ ASL
4d6d : aa __ __ TAX
4d6e : a5 56 __ LDA T9 + 1 
4d70 : bc e8 78 LDY $78e8,x ; (audio_ch_base[0] + 0)
4d73 : 99 0e df STA $df0e,y 
4d76 : a5 55 __ LDA T9 + 0 
4d78 : 99 0f df STA $df0f,y 
4d7b : a9 01 __ LDA #$01
.s12:
4d7d : a0 00 __ LDY #$00
4d7f : 91 53 __ STA (T8 + 0),y 
4d81 : a5 50 __ LDA T6 + 0 
4d83 : a6 51 __ LDX T7 + 0 
4d85 : 9d 07 9a STA $9a07,x ; (modplay.channel[0].ua_vol + 0)
4d88 : a5 55 __ LDA T9 + 0 
4d8a : 9d 08 9a STA $9a08,x ; (modplay.channel[0].ua_rate + 0)
4d8d : a5 56 __ LDA T9 + 1 
4d8f : 4c 62 4c JMP $4c62 ; (ua_update_channel.s14 + 0)
--------------------------------------------------------------------
ch_wr_sms: ; ch_wr_sms(u8,u32)->void
;  40, "/home/xahmol/git/UltimateDemo2026/include/audio.c"
.s4:
4d92 : a5 0d __ LDA P0 ; (ch + 0)
4d94 : 0a __ __ ASL
4d95 : a8 __ __ TAY
4d96 : a9 01 __ LDA #$01
4d98 : be e8 78 LDX $78e8,y ; (audio_ch_base[0] + 0)
4d9b : 9d 04 df STA $df04,x 
4d9e : a5 10 __ LDA P3 ; (addr + 2)
4da0 : 9d 05 df STA $df05,x 
4da3 : a5 0f __ LDA P2 ; (addr + 1)
4da5 : 9d 06 df STA $df06,x 
4da8 : a5 0e __ LDA P1 ; (addr + 0)
4daa : 9d 07 df STA $df07,x 
.s3:
4dad : 60 __ __ RTS
--------------------------------------------------------------------
ch_wr_be24@proxy: ; ch_wr_be24@proxy
4dae : a9 09 __ LDA #$09
4db0 : 85 0e __ STA P1 
4db2 : a5 43 __ LDA $43 
4db4 : 85 0f __ STA P2 
4db6 : a5 44 __ LDA $44 
4db8 : 85 10 __ STA P3 
4dba : a5 45 __ LDA $45 
4dbc : 85 11 __ STA P4 
4dbe : a5 46 __ LDA $46 
4dc0 : 85 12 __ STA P5 
--------------------------------------------------------------------
ch_wr_be24: ; ch_wr_be24(u8,u8,u32)->void
;  52, "/home/xahmol/git/UltimateDemo2026/include/audio.c"
.s4:
4dc2 : a5 0d __ LDA P0 ; (ch + 0)
4dc4 : 0a __ __ ASL
4dc5 : aa __ __ TAX
4dc6 : bd e8 78 LDA $78e8,x ; (audio_ch_base[0] + 0)
4dc9 : 65 0e __ ADC P1 ; (offset + 0)
4dcb : 85 1b __ STA ACCU + 0 
4dcd : a9 df __ LDA #$df
4dcf : 85 1c __ STA ACCU + 1 
4dd1 : a5 11 __ LDA P4 ; (val + 2)
4dd3 : a0 00 __ LDY #$00
4dd5 : 91 1b __ STA (ACCU + 0),y 
4dd7 : a5 10 __ LDA P3 ; (val + 1)
4dd9 : c8 __ __ INY
4dda : 91 1b __ STA (ACCU + 0),y 
4ddc : a5 0f __ LDA P2 ; (val + 0)
4dde : c8 __ __ INY
4ddf : 91 1b __ STA (ACCU + 0),y 
.s3:
4de1 : 60 __ __ RTS
--------------------------------------------------------------------
mandel_run: ; mandel_run()->void
;   4, "/home/xahmol/git/UltimateDemo2026/src/mandel.h"
.s4:
4de2 : a9 8f __ LDA #$8f
4de4 : 20 f3 15 JSR $15f3 ; (turbo_set.s4 + 0)
4de7 : a9 35 __ LDA #$35
4de9 : 85 01 __ STA $01 
4deb : a9 1f __ LDA #$1f
4ded : 85 12 __ STA P5 
4def : a9 40 __ LDA #$40
4df1 : 85 11 __ STA P4 
4df3 : a9 00 __ LDA #$00
4df5 : 85 0f __ STA P2 
4df7 : 85 10 __ STA P3 
4df9 : a2 fa __ LDX #$fa
.l6:
4dfb : ca __ __ DEX
4dfc : 9d 00 c0 STA $c000,x 
4dff : 9d fa c0 STA $c0fa,x 
4e02 : 9d f4 c1 STA $c1f4,x 
4e05 : 9d ee c2 STA $c2ee,x 
4e08 : d0 f1 __ BNE $4dfb ; (mandel_run.l6 + 0)
.s5:
4e0a : 85 0d __ STA P0 
4e0c : a9 e0 __ LDA #$e0
4e0e : 85 0e __ STA P1 
4e10 : 20 f2 20 JSR $20f2 ; (memset.s4 + 0)
4e13 : a9 04 __ LDA #$04
4e15 : 85 0d __ STA P0 
4e17 : a9 00 __ LDA #$00
4e19 : 85 10 __ STA P3 
4e1b : a9 e0 __ LDA #$e0
4e1d : 85 11 __ STA P4 
4e1f : a9 01 __ LDA #$01
4e21 : a2 fa __ LDX #$fa
.l8:
4e23 : ca __ __ DEX
4e24 : 9d 00 d8 STA $d800,x 
4e27 : 9d fa d8 STA $d8fa,x 
4e2a : 9d f4 d9 STA $d9f4,x 
4e2d : 9d ee da STA $daee,x 
4e30 : d0 f1 __ BNE $4e23 ; (mandel_run.l8 + 0)
.s7:
4e32 : a9 00 __ LDA #$00
4e34 : 85 0e __ STA P1 
4e36 : a9 c0 __ LDA #$c0
4e38 : 85 0f __ STA P2 
4e3a : 20 16 0f JSR $0f16 ; (vic_setmode.s4 + 0)
4e3d : a9 00 __ LDA #$00
4e3f : 8d 21 d0 STA $d021 
4e42 : 8d 20 d0 STA $d020 
4e45 : a9 bd __ LDA #$bd
4e47 : 85 13 __ STA P6 
4e49 : a9 7c __ LDA #$7c
4e4b : 85 14 __ STA P7 
4e4d : 20 82 4e JSR $4e82 ; (render.s1 + 0)
4e50 : a9 00 __ LDA #$00
4e52 : 85 0d __ STA P0 
4e54 : a9 7d __ LDA #$7d
4e56 : 85 0e __ STA P1 
4e58 : 20 15 51 JSR $5115 ; (colorize_standard.s4 + 0)
4e5b : a9 00 __ LDA #$00
4e5d : 8d 09 dc STA $dc09 
4e60 : 8d 08 dc STA $dc08 
.l9:
4e63 : ad 09 dc LDA $dc09 
4e66 : c9 05 __ CMP #$05
4e68 : 90 f9 __ BCC $4e63 ; (mandel_run.l9 + 0)
.s10:
4e6a : a9 00 __ LDA #$00
4e6c : 85 0d __ STA P0 
4e6e : 85 0e __ STA P1 
4e70 : 85 10 __ STA P3 
4e72 : a9 36 __ LDA #$36
4e74 : 85 01 __ STA $01 
4e76 : 20 0e 0f JSR $0f0e ; (vic_setmode@proxy + 0)
4e79 : a9 00 __ LDA #$00
4e7b : 8d 20 d0 STA $d020 
4e7e : 8d 21 d0 STA $d021 
.s3:
4e81 : 60 __ __ RTS
--------------------------------------------------------------------
render: ; render(const struct S#28947*)->void
; 120, "/home/xahmol/git/UltimateDemo2026/src/mandel.c"
.s1:
4e82 : a2 05 __ LDX #$05
4e84 : b5 53 __ LDA T10 + 0,x 
4e86 : 9d da bf STA $bfda,x ; (render@stack + 0)
4e89 : ca __ __ DEX
4e8a : 10 f8 __ BPL $4e84 ; (render.s1 + 2)
.s4:
4e8c : a9 40 __ LDA #$40
4e8e : 85 11 __ STA P4 
4e90 : a9 1f __ LDA #$1f
4e92 : 85 12 __ STA P5 
4e94 : a9 00 __ LDA #$00
4e96 : 85 0d __ STA P0 
4e98 : a9 e0 __ LDA #$e0
4e9a : 85 0e __ STA P1 
4e9c : a0 06 __ LDY #$06
4e9e : b1 13 __ LDA (P6),y ; (f + 0)
4ea0 : c8 __ __ INY
4ea1 : 11 13 __ ORA (P6),y ; (f + 0)
4ea3 : d0 08 __ BNE $4ead ; (render.s24 + 0)
.s5:
4ea5 : c8 __ __ INY
4ea6 : b1 13 __ LDA (P6),y ; (f + 0)
4ea8 : c8 __ __ INY
4ea9 : 11 13 __ ORA (P6),y ; (f + 0)
4eab : f0 02 __ BEQ $4eaf ; (render.s6 + 0)
.s24:
4ead : a9 01 __ LDA #$01
.s6:
4eaf : 85 57 __ STA T12 + 0 
4eb1 : a9 00 __ LDA #$00
4eb3 : 85 0f __ STA P2 
4eb5 : 85 10 __ STA P3 
4eb7 : 20 f2 20 JSR $20f2 ; (memset.s4 + 0)
4eba : a9 00 __ LDA #$00
4ebc : 85 4d __ STA T6 + 0 
.l7:
4ebe : 29 07 __ AND #$07
4ec0 : 85 43 __ STA T0 + 0 
4ec2 : a5 4d __ LDA T6 + 0 
4ec4 : 29 f8 __ AND #$f8
4ec6 : 85 1b __ STA ACCU + 0 
4ec8 : 4a __ __ LSR
4ec9 : 4a __ __ LSR
4eca : 65 1b __ ADC ACCU + 0 
4ecc : 4a __ __ LSR
4ecd : 6a __ __ ROR
4ece : 6a __ __ ROR
4ecf : aa __ __ TAX
4ed0 : 29 c0 __ AND #$c0
4ed2 : 6a __ __ ROR
4ed3 : 05 43 __ ORA T0 + 0 
4ed5 : 85 4e __ STA T7 + 0 
4ed7 : 8a __ __ TXA
4ed8 : 29 1f __ AND #$1f
4eda : 09 e0 __ ORA #$e0
4edc : 85 4f __ STA T7 + 1 
4ede : a0 05 __ LDY #$05
4ee0 : b1 13 __ LDA (P6),y ; (f + 0)
4ee2 : 85 1b __ STA ACCU + 0 
4ee4 : a9 00 __ LDA #$00
4ee6 : 85 52 __ STA T9 + 0 
4ee8 : 85 1c __ STA ACCU + 1 
4eea : a5 4d __ LDA T6 + 0 
4eec : 20 92 73 JSR $7392 ; (mul16by8 + 0)
4eef : a0 02 __ LDY #$02
4ef1 : b1 13 __ LDA (P6),y ; (f + 0)
4ef3 : 18 __ __ CLC
4ef4 : 65 1b __ ADC ACCU + 0 
4ef6 : 85 50 __ STA T8 + 0 
4ef8 : c8 __ __ INY
4ef9 : b1 13 __ LDA (P6),y ; (f + 0)
4efb : 65 1c __ ADC ACCU + 1 
4efd : 85 51 __ STA T8 + 1 
.l8:
4eff : a0 04 __ LDY #$04
4f01 : b1 13 __ LDA (P6),y ; (f + 0)
4f03 : 85 1b __ STA ACCU + 0 
4f05 : a9 00 __ LDA #$00
4f07 : 85 1c __ STA ACCU + 1 
4f09 : a5 52 __ LDA T9 + 0 
4f0b : 20 92 73 JSR $7392 ; (mul16by8 + 0)
4f0e : a0 00 __ LDY #$00
4f10 : b1 13 __ LDA (P6),y ; (f + 0)
4f12 : 18 __ __ CLC
4f13 : 65 1b __ ADC ACCU + 0 
4f15 : 85 49 __ STA T3 + 0 
4f17 : 85 53 __ STA T10 + 0 
4f19 : c8 __ __ INY
4f1a : b1 13 __ LDA (P6),y ; (f + 0)
4f1c : 65 1c __ ADC ACCU + 1 
4f1e : 85 4a __ STA T3 + 1 
4f20 : 85 54 __ STA T10 + 1 
4f22 : a5 57 __ LDA T12 + 0 
4f24 : d0 11 __ BNE $4f37 ; (render.s23 + 0)
.s9:
4f26 : 85 49 __ STA T3 + 0 
4f28 : 85 4a __ STA T3 + 1 
4f2a : 85 4b __ STA T4 + 0 
4f2c : 85 4c __ STA T4 + 1 
4f2e : a5 50 __ LDA T8 + 0 
4f30 : 85 55 __ STA T11 + 0 
4f32 : a5 51 __ LDA T8 + 1 
4f34 : 4c 52 4f JMP $4f52 ; (render.s10 + 0)
.s23:
4f37 : a5 50 __ LDA T8 + 0 
4f39 : 85 4b __ STA T4 + 0 
4f3b : a5 51 __ LDA T8 + 1 
4f3d : 85 4c __ STA T4 + 1 
4f3f : a0 06 __ LDY #$06
4f41 : b1 13 __ LDA (P6),y ; (f + 0)
4f43 : 85 53 __ STA T10 + 0 
4f45 : c8 __ __ INY
4f46 : b1 13 __ LDA (P6),y ; (f + 0)
4f48 : 85 54 __ STA T10 + 1 
4f4a : c8 __ __ INY
4f4b : b1 13 __ LDA (P6),y ; (f + 0)
4f4d : 85 55 __ STA T11 + 0 
4f4f : c8 __ __ INY
4f50 : b1 13 __ LDA (P6),y ; (f + 0)
.s10:
4f52 : 85 56 __ STA T11 + 1 
4f54 : a9 00 __ LDA #$00
4f56 : 85 58 __ STA T13 + 0 
.l11:
4f58 : a6 49 __ LDX T3 + 0 
4f5a : a5 4a __ LDA T3 + 1 
4f5c : 10 0a __ BPL $4f68 ; (render.s12 + 0)
.s22:
4f5e : 38 __ __ SEC
4f5f : a9 00 __ LDA #$00
4f61 : e5 49 __ SBC T3 + 0 
4f63 : aa __ __ TAX
4f64 : a9 00 __ LDA #$00
4f66 : e5 4a __ SBC T3 + 1 
.s12:
4f68 : 86 0d __ STX P0 
4f6a : 86 0f __ STX P2 
4f6c : 85 0e __ STA P1 
4f6e : 85 10 __ STA P3 
4f70 : 20 7c 50 JSR $507c ; (lmul16u.s4 + 0)
4f73 : a5 1b __ LDA ACCU + 0 
4f75 : 85 45 __ STA T2 + 0 
4f77 : a5 1c __ LDA ACCU + 1 
4f79 : 85 46 __ STA T2 + 1 
4f7b : a5 1d __ LDA ACCU + 2 
4f7d : 85 47 __ STA T2 + 2 
4f7f : a5 1e __ LDA ACCU + 3 
4f81 : 85 48 __ STA T2 + 3 
4f83 : a6 4b __ LDX T4 + 0 
4f85 : a5 4c __ LDA T4 + 1 
4f87 : 10 0a __ BPL $4f93 ; (render.s13 + 0)
.s21:
4f89 : 38 __ __ SEC
4f8a : a9 00 __ LDA #$00
4f8c : e5 4b __ SBC T4 + 0 
4f8e : aa __ __ TAX
4f8f : a9 00 __ LDA #$00
4f91 : e5 4c __ SBC T4 + 1 
.s13:
4f93 : 86 0d __ STX P0 
4f95 : 86 0f __ STX P2 
4f97 : 85 0e __ STA P1 
4f99 : 85 10 __ STA P3 
4f9b : 20 7c 50 JSR $507c ; (lmul16u.s4 + 0)
4f9e : 18 __ __ CLC
4f9f : a5 1b __ LDA ACCU + 0 
4fa1 : 65 45 __ ADC T2 + 0 
4fa3 : a5 1c __ LDA ACCU + 1 
4fa5 : 65 46 __ ADC T2 + 1 
4fa7 : a5 1d __ LDA ACCU + 2 
4fa9 : 65 47 __ ADC T2 + 2 
4fab : a5 1e __ LDA ACCU + 3 
4fad : 65 48 __ ADC T2 + 3 
4faf : c9 04 __ CMP #$04
4fb1 : 90 1b __ BCC $4fce ; (render.s14 + 0)
.s20:
4fb3 : a5 58 __ LDA T13 + 0 
4fb5 : 4a __ __ LSR
4fb6 : 4a __ __ LSR
4fb7 : 85 1b __ STA ACCU + 0 
4fb9 : a9 00 __ LDA #$00
4fbb : 85 1c __ STA ACCU + 1 
4fbd : 85 04 __ STA WORK + 1 
4fbf : a9 03 __ LDA #$03
4fc1 : 85 03 __ STA WORK + 0 
4fc3 : 20 81 74 JSR $7481 ; (divmod + 0)
4fc6 : 18 __ __ CLC
4fc7 : a5 05 __ LDA WORK + 2 
4fc9 : 69 01 __ ADC #$01
4fcb : 4c 2d 50 JMP $502d ; (render.s18 + 0)
.s14:
4fce : a5 49 __ LDA T3 + 0 
4fd0 : 85 0d __ STA P0 
4fd2 : a5 4a __ LDA T3 + 1 
4fd4 : 85 0e __ STA P1 
4fd6 : a5 4b __ LDA T4 + 0 
4fd8 : 85 0f __ STA P2 
4fda : a5 4c __ LDA T4 + 1 
4fdc : 85 10 __ STA P3 
4fde : 38 __ __ SEC
4fdf : a5 45 __ LDA T2 + 0 
4fe1 : e5 1b __ SBC ACCU + 0 
4fe3 : a5 46 __ LDA T2 + 1 
4fe5 : e5 1c __ SBC ACCU + 1 
4fe7 : 85 43 __ STA T0 + 0 
4fe9 : a5 47 __ LDA T2 + 2 
4feb : e5 1d __ SBC ACCU + 2 
4fed : 85 44 __ STA T0 + 1 
4fef : a5 48 __ LDA T2 + 3 
4ff1 : e5 1e __ SBC ACCU + 3 
4ff3 : a2 04 __ LDX #$04
.l15:
4ff5 : 4a __ __ LSR
4ff6 : 66 44 __ ROR T0 + 1 
4ff8 : 66 43 __ ROR T0 + 0 
4ffa : ca __ __ DEX
4ffb : d0 f8 __ BNE $4ff5 ; (render.l15 + 0)
.s16:
4ffd : 18 __ __ CLC
4ffe : a5 43 __ LDA T0 + 0 
5000 : 65 53 __ ADC T10 + 0 
5002 : 85 49 __ STA T3 + 0 
5004 : a5 44 __ LDA T0 + 1 
5006 : 65 54 __ ADC T10 + 1 
5008 : 85 4a __ STA T3 + 1 
500a : 20 a3 50 JSR $50a3 ; (lmul4f12s.s4 + 0)
500d : a5 1b __ LDA ACCU + 0 
500f : 0a __ __ ASL
5010 : a8 __ __ TAY
5011 : a5 1c __ LDA ACCU + 1 
5013 : 2a __ __ ROL
5014 : aa __ __ TAX
5015 : 98 __ __ TYA
5016 : 18 __ __ CLC
5017 : 65 55 __ ADC T11 + 0 
5019 : 85 4b __ STA T4 + 0 
501b : 8a __ __ TXA
501c : 65 56 __ ADC T11 + 1 
501e : 85 4c __ STA T4 + 1 
5020 : e6 58 __ INC T13 + 0 
5022 : a5 58 __ LDA T13 + 0 
5024 : c9 20 __ CMP #$20
5026 : b0 03 __ BCS $502b ; (render.s17 + 0)
5028 : 4c 58 4f JMP $4f58 ; (render.l11 + 0)
.s17:
502b : a9 00 __ LDA #$00
.s18:
502d : aa __ __ TAX
502e : a5 52 __ LDA T9 + 0 
5030 : 29 03 __ AND #$03
5032 : 0a __ __ ASL
5033 : a8 __ __ TAY
5034 : b9 cd 77 LDA $77cd,y ; (__shrtab192L + 0)
5037 : 85 1b __ STA ACCU + 0 
5039 : 49 ff __ EOR #$ff
503b : 85 45 __ STA T2 + 0 
503d : a5 52 __ LDA T9 + 0 
503f : 29 fc __ AND #$fc
5041 : 0a __ __ ASL
5042 : 85 49 __ STA T3 + 0 
5044 : a5 4f __ LDA T7 + 1 
5046 : 69 00 __ ADC #$00
5048 : 85 4a __ STA T3 + 1 
504a : a4 4e __ LDY T7 + 0 
504c : b1 49 __ LDA (T3 + 0),y 
504e : 25 45 __ AND T2 + 0 
5050 : 85 45 __ STA T2 + 0 
5052 : bd fa 79 LDA $79fa,x ; (cbytes[0] + 0)
5055 : 25 1b __ AND ACCU + 0 
5057 : 05 45 __ ORA T2 + 0 
5059 : 91 49 __ STA (T3 + 0),y 
505b : e6 52 __ INC T9 + 0 
505d : a5 52 __ LDA T9 + 0 
505f : c9 a0 __ CMP #$a0
5061 : b0 03 __ BCS $5066 ; (render.s19 + 0)
5063 : 4c ff 4e JMP $4eff ; (render.l8 + 0)
.s19:
5066 : e6 4d __ INC T6 + 0 
5068 : a5 4d __ LDA T6 + 0 
506a : c9 c8 __ CMP #$c8
506c : b0 03 __ BCS $5071 ; (render.s3 + 0)
506e : 4c be 4e JMP $4ebe ; (render.l7 + 0)
.s3:
5071 : a2 05 __ LDX #$05
5073 : bd da bf LDA $bfda,x ; (render@stack + 0)
5076 : 95 53 __ STA T10 + 0,x 
5078 : ca __ __ DEX
5079 : 10 f8 __ BPL $5073 ; (render.s3 + 2)
507b : 60 __ __ RTS
--------------------------------------------------------------------
lmul16u: ; lmul16u(u16,u16)->u32
;   5, "/home/xahmol/oscar64/include/fixmath.h"
.s4:
507c : a9 00 __ LDA #$00
507e : 85 1d __ STA ACCU + 2 
5080 : 85 1e __ STA ACCU + 3 
5082 : a2 10 __ LDX #$10
5084 : 46 0e __ LSR P1 
5086 : 66 0d __ ROR P0 
5088 : 90 0d __ BCC $5097 ; (lmul16u.s4 + 27)
508a : 18 __ __ CLC
508b : a5 1d __ LDA ACCU + 2 
508d : 65 0f __ ADC P2 
508f : 85 1d __ STA ACCU + 2 
5091 : a5 1e __ LDA ACCU + 3 
5093 : 65 10 __ ADC P3 
5095 : 85 1e __ STA ACCU + 3 
5097 : 66 1e __ ROR ACCU + 3 
5099 : 66 1d __ ROR ACCU + 2 
509b : 66 1c __ ROR ACCU + 1 
509d : 66 1b __ ROR ACCU + 0 
509f : ca __ __ DEX
50a0 : d0 e2 __ BNE $5084 ; (lmul16u.s4 + 8)
.s3:
50a2 : 60 __ __ RTS
--------------------------------------------------------------------
lmul4f12s: ; lmul4f12s(i16,i16)->i16
;  18, "/home/xahmol/oscar64/include/fixmath.h"
.s4:
50a3 : 38 __ __ SEC
50a4 : a5 0d __ LDA P0 
50a6 : 6a __ __ ROR
50a7 : 85 1b __ STA ACCU + 0 
50a9 : a9 00 __ LDA #$00
50ab : 85 1c __ STA ACCU + 1 
50ad : 90 0b __ BCC $50ba ; (lmul4f12s.s4 + 23)
50af : a8 __ __ TAY
50b0 : 18 __ __ CLC
50b1 : a5 1c __ LDA ACCU + 1 
50b3 : 65 0f __ ADC P2 
50b5 : 85 1c __ STA ACCU + 1 
50b7 : 98 __ __ TYA
50b8 : 65 10 __ ADC P3 
50ba : 6a __ __ ROR
50bb : 66 1c __ ROR ACCU + 1 
50bd : 46 1b __ LSR ACCU + 0 
50bf : 90 f9 __ BCC $50ba ; (lmul4f12s.s4 + 23)
50c1 : d0 ec __ BNE $50af ; (lmul4f12s.s4 + 12)
50c3 : a6 0e __ LDX P1 
50c5 : 86 1b __ STX ACCU + 0 
50c7 : a2 07 __ LDX #$07
50c9 : 46 1b __ LSR ACCU + 0 
50cb : 90 0b __ BCC $50d8 ; (lmul4f12s.s4 + 53)
50cd : a8 __ __ TAY
50ce : 18 __ __ CLC
50cf : a5 1c __ LDA ACCU + 1 
50d1 : 65 0f __ ADC P2 
50d3 : 85 1c __ STA ACCU + 1 
50d5 : 98 __ __ TYA
50d6 : 65 10 __ ADC P3 
50d8 : 6a __ __ ROR
50d9 : 66 1c __ ROR ACCU + 1 
50db : 66 1b __ ROR ACCU + 0 
50dd : ca __ __ DEX
50de : d0 eb __ BNE $50cb ; (lmul4f12s.s4 + 40)
50e0 : 90 0a __ BCC $50ec ; (lmul4f12s.s4 + 73)
50e2 : a8 __ __ TAY
50e3 : a5 1c __ LDA ACCU + 1 
50e5 : e5 0f __ SBC P2 
50e7 : 85 1c __ STA ACCU + 1 
50e9 : 98 __ __ TYA
50ea : e5 10 __ SBC P3 
50ec : 6a __ __ ROR
50ed : 66 1c __ ROR ACCU + 1 
50ef : 66 1b __ ROR ACCU + 0 
50f1 : 24 10 __ BIT P3 
50f3 : 10 0b __ BPL $5100 ; (lmul4f12s.s4 + 93)
50f5 : aa __ __ TAX
50f6 : 38 __ __ SEC
50f7 : a5 1c __ LDA ACCU + 1 
50f9 : e5 0d __ SBC P0 
50fb : 85 1c __ STA ACCU + 1 
50fd : 8a __ __ TXA
50fe : e5 0e __ SBC P1 
5100 : 4a __ __ LSR
5101 : 66 1c __ ROR ACCU + 1 
5103 : 66 1b __ ROR ACCU + 0 
5105 : 4a __ __ LSR
5106 : 66 1c __ ROR ACCU + 1 
5108 : 66 1b __ ROR ACCU + 0 
510a : 4a __ __ LSR
510b : 66 1c __ ROR ACCU + 1 
510d : 66 1b __ ROR ACCU + 0 
510f : 4a __ __ LSR
5110 : 66 1c __ ROR ACCU + 1 
5112 : 66 1b __ ROR ACCU + 0 
.s3:
5114 : 60 __ __ RTS
--------------------------------------------------------------------
colorize_standard: ; colorize_standard(const const struct S#29065[]*)->void
; 176, "/home/xahmol/git/UltimateDemo2026/src/mandel.c"
.s4:
5115 : a9 00 __ LDA #$00
5117 : 85 43 __ STA T0 + 0 
5119 : 85 44 __ STA T1 + 0 
511b : 85 46 __ STA T2 + 0 
511d : 85 48 __ STA T3 + 0 
511f : a9 e0 __ LDA #$e0
5121 : 85 45 __ STA T1 + 1 
5123 : a9 c0 __ LDA #$c0
5125 : 85 47 __ STA T2 + 1 
5127 : a9 d8 __ LDA #$d8
5129 : 85 49 __ STA T3 + 1 
.l5:
512b : a9 00 __ LDA #$00
512d : 85 4a __ STA T4 + 0 
.l6:
512f : 0a __ __ ASL
5130 : 0a __ __ ASL
5131 : 0a __ __ ASL
5132 : a2 00 __ LDX #$00
5134 : 90 02 __ BCC $5138 ; (colorize_standard.s51 + 0)
.s50:
5136 : e8 __ __ INX
5137 : 18 __ __ CLC
.s51:
5138 : 65 44 __ ADC T1 + 0 
513a : 85 4b __ STA T5 + 0 
513c : 8a __ __ TXA
513d : 65 45 __ ADC T1 + 1 
513f : 85 4c __ STA T5 + 1 
5141 : a9 00 __ LDA #$00
5143 : 85 1c __ STA ACCU + 1 
5145 : 85 4d __ STA T10 + 0 
5147 : 85 4e __ STA T11 + 0 
5149 : aa __ __ TAX
514a : a8 __ __ TAY
.l49:
514b : b1 4b __ LDA (T5 + 0),y 
514d : 85 1b __ STA ACCU + 0 
514f : 0a __ __ ASL
5150 : 2a __ __ ROL
5151 : 29 01 __ AND #$01
5153 : 2a __ __ ROL
5154 : d0 04 __ BNE $515a ; (colorize_standard.s43 + 0)
.s7:
5156 : e8 __ __ INX
5157 : 4c 6e 51 JMP $516e ; (colorize_standard.s8 + 0)
.s43:
515a : c9 01 __ CMP #$01
515c : d0 05 __ BNE $5163 ; (colorize_standard.s44 + 0)
.s47:
515e : e6 1c __ INC ACCU + 1 
5160 : 4c 6e 51 JMP $516e ; (colorize_standard.s8 + 0)
.s44:
5163 : c9 02 __ CMP #$02
5165 : f0 05 __ BEQ $516c ; (colorize_standard.s46 + 0)
.s45:
5167 : e6 4e __ INC T11 + 0 
5169 : 4c 6e 51 JMP $516e ; (colorize_standard.s8 + 0)
.s46:
516c : e6 4d __ INC T10 + 0 
.s8:
516e : a5 1b __ LDA ACCU + 0 
5170 : 29 30 __ AND #$30
5172 : 4a __ __ LSR
5173 : 4a __ __ LSR
5174 : 4a __ __ LSR
5175 : 4a __ __ LSR
5176 : d0 04 __ BNE $517c ; (colorize_standard.s38 + 0)
.s9:
5178 : e8 __ __ INX
5179 : 4c 90 51 JMP $5190 ; (colorize_standard.s10 + 0)
.s38:
517c : c9 01 __ CMP #$01
517e : d0 05 __ BNE $5185 ; (colorize_standard.s39 + 0)
.s42:
5180 : e6 1c __ INC ACCU + 1 
5182 : 4c 90 51 JMP $5190 ; (colorize_standard.s10 + 0)
.s39:
5185 : c9 02 __ CMP #$02
5187 : f0 05 __ BEQ $518e ; (colorize_standard.s41 + 0)
.s40:
5189 : e6 4e __ INC T11 + 0 
518b : 4c 90 51 JMP $5190 ; (colorize_standard.s10 + 0)
.s41:
518e : e6 4d __ INC T10 + 0 
.s10:
5190 : a5 1b __ LDA ACCU + 0 
5192 : 29 0c __ AND #$0c
5194 : 4a __ __ LSR
5195 : 4a __ __ LSR
5196 : d0 04 __ BNE $519c ; (colorize_standard.s33 + 0)
.s11:
5198 : e8 __ __ INX
5199 : 4c b0 51 JMP $51b0 ; (colorize_standard.s12 + 0)
.s33:
519c : c9 01 __ CMP #$01
519e : d0 05 __ BNE $51a5 ; (colorize_standard.s34 + 0)
.s37:
51a0 : e6 1c __ INC ACCU + 1 
51a2 : 4c b0 51 JMP $51b0 ; (colorize_standard.s12 + 0)
.s34:
51a5 : c9 02 __ CMP #$02
51a7 : f0 05 __ BEQ $51ae ; (colorize_standard.s36 + 0)
.s35:
51a9 : e6 4e __ INC T11 + 0 
51ab : 4c b0 51 JMP $51b0 ; (colorize_standard.s12 + 0)
.s36:
51ae : e6 4d __ INC T10 + 0 
.s12:
51b0 : a5 1b __ LDA ACCU + 0 
51b2 : 29 03 __ AND #$03
51b4 : d0 04 __ BNE $51ba ; (colorize_standard.s28 + 0)
.s13:
51b6 : e8 __ __ INX
51b7 : 4c ce 51 JMP $51ce ; (colorize_standard.s14 + 0)
.s28:
51ba : c9 01 __ CMP #$01
51bc : d0 05 __ BNE $51c3 ; (colorize_standard.s29 + 0)
.s32:
51be : e6 1c __ INC ACCU + 1 
51c0 : 4c ce 51 JMP $51ce ; (colorize_standard.s14 + 0)
.s29:
51c3 : c9 02 __ CMP #$02
51c5 : f0 05 __ BEQ $51cc ; (colorize_standard.s31 + 0)
.s30:
51c7 : e6 4e __ INC T11 + 0 
51c9 : 4c ce 51 JMP $51ce ; (colorize_standard.s14 + 0)
.s31:
51cc : e6 4d __ INC T10 + 0 
.s14:
51ce : c8 __ __ INY
51cf : c0 08 __ CPY #$08
51d1 : b0 03 __ BCS $51d6 ; (colorize_standard.s15 + 0)
51d3 : 4c 4b 51 JMP $514b ; (colorize_standard.l49 + 0)
.s15:
51d6 : 18 __ __ CLC
51d7 : a5 4d __ LDA T10 + 0 
51d9 : 65 1c __ ADC ACCU + 1 
51db : 85 4b __ STA T5 + 0 
51dd : a9 00 __ LDA #$00
51df : 2a __ __ ROL
51e0 : a8 __ __ TAY
51e1 : a5 4b __ LDA T5 + 0 
51e3 : 65 4e __ ADC T11 + 0 
51e5 : 85 4b __ STA T5 + 0 
51e7 : 98 __ __ TYA
51e8 : 69 00 __ ADC #$00
51ea : 05 4b __ ORA T5 + 0 
51ec : f0 02 __ BEQ $51f0 ; (colorize_standard.s53 + 0)
.s52:
51ee : a9 01 __ LDA #$01
.s53:
51f0 : 85 4b __ STA T5 + 0 
51f2 : 8a __ __ TXA
51f3 : f0 03 __ BEQ $51f8 ; (colorize_standard.s16 + 0)
51f5 : 4c 97 52 JMP $5297 ; (colorize_standard.s26 + 0)
.s16:
51f8 : a5 4b __ LDA T5 + 0 
51fa : f0 22 __ BEQ $521e ; (colorize_standard.s17 + 0)
.s19:
51fc : a5 1c __ LDA ACCU + 1 
51fe : c5 4d __ CMP T10 + 0 
5200 : b0 04 __ BCS $5206 ; (colorize_standard.s20 + 0)
.s25:
5202 : a9 02 __ LDA #$02
5204 : 90 02 __ BCC $5208 ; (colorize_standard.s21 + 0)
.s20:
5206 : a9 01 __ LDA #$01
.s21:
5208 : 85 4b __ STA T5 + 0 
520a : a5 4d __ LDA T10 + 0 
520c : c5 4e __ CMP T11 + 0 
520e : b0 06 __ BCS $5216 ; (colorize_standard.s22 + 0)
.s23:
5210 : a5 1c __ LDA ACCU + 1 
5212 : c5 4e __ CMP T11 + 0 
5214 : 90 04 __ BCC $521a ; (colorize_standard.s24 + 0)
.s22:
5216 : c6 4b __ DEC T5 + 0 
5218 : b0 04 __ BCS $521e ; (colorize_standard.s17 + 0)
.s24:
521a : a9 02 __ LDA #$02
.s48:
521c : 85 4b __ STA T5 + 0 
.s17:
521e : 18 __ __ CLC
521f : a5 4a __ LDA T4 + 0 
5221 : 65 43 __ ADC T0 + 0 
5223 : 0a __ __ ASL
5224 : 0a __ __ ASL
5225 : 85 1b __ STA ACCU + 0 
5227 : a9 00 __ LDA #$00
5229 : 85 1c __ STA ACCU + 1 
522b : 85 04 __ STA WORK + 1 
522d : a9 41 __ LDA #$41
522f : 85 03 __ STA WORK + 0 
5231 : 20 81 74 JSR $7481 ; (divmod + 0)
5234 : a6 1b __ LDX ACCU + 0 
5236 : bd d4 77 LDA $77d4,x ; (__multab12L + 0)
5239 : 18 __ __ CLC
523a : 65 0d __ ADC P0 ; (pal + 0)
523c : 85 1b __ STA ACCU + 0 
523e : a5 0e __ LDA P1 ; (pal + 1)
5240 : 69 00 __ ADC #$00
5242 : aa __ __ TAX
5243 : a4 4b __ LDY T5 + 0 
5245 : b9 d8 77 LDA $77d8,y ; (__multab3L + 0)
5248 : 18 __ __ CLC
5249 : 65 1b __ ADC ACCU + 0 
524b : 85 1b __ STA ACCU + 0 
524d : 90 01 __ BCC $5250 ; (colorize_standard.s55 + 0)
.s54:
524f : e8 __ __ INX
.s55:
5250 : 86 1c __ STX ACCU + 1 
5252 : a0 00 __ LDY #$00
5254 : b1 1b __ LDA (ACCU + 0),y 
5256 : 0a __ __ ASL
5257 : 0a __ __ ASL
5258 : 0a __ __ ASL
5259 : 0a __ __ ASL
525a : c8 __ __ INY
525b : 11 1b __ ORA (ACCU + 0),y 
525d : 88 __ __ DEY
525e : 91 46 __ STA (T2 + 0),y 
5260 : a0 02 __ LDY #$02
5262 : b1 1b __ LDA (ACCU + 0),y 
5264 : a0 00 __ LDY #$00
5266 : 91 48 __ STA (T3 + 0),y 
5268 : e6 46 __ INC T2 + 0 
526a : d0 02 __ BNE $526e ; (colorize_standard.s57 + 0)
.s56:
526c : e6 47 __ INC T2 + 1 
.s57:
526e : e6 48 __ INC T3 + 0 
5270 : d0 02 __ BNE $5274 ; (colorize_standard.s59 + 0)
.s58:
5272 : e6 49 __ INC T3 + 1 
.s59:
5274 : e6 4a __ INC T4 + 0 
5276 : a5 4a __ LDA T4 + 0 
5278 : c9 28 __ CMP #$28
527a : f0 03 __ BEQ $527f ; (colorize_standard.s18 + 0)
527c : 4c 2f 51 JMP $512f ; (colorize_standard.l6 + 0)
.s18:
527f : a5 44 __ LDA T1 + 0 
5281 : 69 3f __ ADC #$3f
5283 : 85 44 __ STA T1 + 0 
5285 : a5 45 __ LDA T1 + 1 
5287 : 69 01 __ ADC #$01
5289 : 85 45 __ STA T1 + 1 
528b : e6 43 __ INC T0 + 0 
528d : a5 43 __ LDA T0 + 0 
528f : c9 19 __ CMP #$19
5291 : f0 03 __ BEQ $5296 ; (colorize_standard.s3 + 0)
5293 : 4c 2b 51 JMP $512b ; (colorize_standard.l5 + 0)
.s3:
5296 : 60 __ __ RTS
.s26:
5297 : a5 4b __ LDA T5 + 0 
5299 : f0 83 __ BEQ $521e ; (colorize_standard.s17 + 0)
.s27:
529b : a9 03 __ LDA #$03
529d : 4c 1c 52 JMP $521c ; (colorize_standard.s48 + 0)
--------------------------------------------------------------------
ball_run: ; ball_run()->void
;   3, "/home/xahmol/git/UltimateDemo2026/src/ball.h"
.s1:
52a0 : a2 0d __ LDX #$0d
52a2 : b5 53 __ LDA T0 + 0,x 
52a4 : 9d af bf STA $bfaf,x ; (ball_run@stack + 0)
52a7 : ca __ __ DEX
52a8 : 10 f8 __ BPL $52a2 ; (ball_run.s1 + 2)
.s4:
52aa : a9 8f __ LDA #$8f
52ac : 20 f3 15 JSR $15f3 ; (turbo_set.s4 + 0)
52af : 20 5d 54 JSR $545d ; (ball_init.s4 + 0)
52b2 : a9 00 __ LDA #$00
52b4 : 85 55 __ STA T1 + 0 
52b6 : 85 56 __ STA T2 + 0 
52b8 : 85 57 __ STA T3 + 0 
52ba : 85 58 __ STA T4 + 0 
52bc : 85 59 __ STA T5 + 0 
52be : a9 a8 __ LDA #$a8
52c0 : 85 5a __ STA T6 + 0 
52c2 : a9 fd __ LDA #$fd
52c4 : 85 5b __ STA T6 + 1 
.l5:
52c6 : 2c 11 d0 BIT $d011 
52c9 : 30 fb __ BMI $52c6 ; (ball_run.l5 + 0)
.l6:
52cb : 2c 11 d0 BIT $d011 
52ce : 10 fb __ BPL $52cb ; (ball_run.l6 + 0)
.s7:
52d0 : a9 00 __ LDA #$00
52d2 : 85 0f __ STA P2 
52d4 : 85 10 __ STA P3 
52d6 : 85 0d __ STA P0 
52d8 : 20 4b 78 JSR $784b ; (memset@proxy + 0)
52db : a5 55 __ LDA T1 + 0 
52dd : 29 3f __ AND #$3f
52df : aa __ __ TAX
52e0 : bd 4b 7c LDA $7c4b,x ; (sin64[0] + 0)
52e3 : 85 5c __ STA T7 + 0 
52e5 : 29 80 __ AND #$80
52e7 : 10 02 __ BPL $52eb ; (ball_run.s7 + 27)
52e9 : a9 ff __ LDA #$ff
52eb : 85 5d __ STA T7 + 1 
52ed : bd 4b 7c LDA $7c4b,x ; (sin64[0] + 0)
52f0 : 10 0d __ BPL $52ff ; (ball_run.s8 + 0)
.s10:
52f2 : 38 __ __ SEC
52f3 : a9 00 __ LDA #$00
52f5 : e5 5c __ SBC T7 + 0 
52f7 : 85 5c __ STA T7 + 0 
52f9 : a9 00 __ LDA #$00
52fb : e5 5d __ SBC T7 + 1 
52fd : 85 5d __ STA T7 + 1 
.s8:
52ff : a5 58 __ LDA T4 + 0 
5301 : 85 18 __ STA P11 
5303 : a5 57 __ LDA T3 + 0 
5305 : 29 3f __ AND #$3f
5307 : aa __ __ TAX
5308 : bd 4b 7c LDA $7c4b,x ; (sin64[0] + 0)
530b : 85 60 __ STA T9 + 0 
530d : a5 56 __ LDA T2 + 0 
530f : 29 3f __ AND #$3f
5311 : aa __ __ TAX
5312 : bd 4b 7c LDA $7c4b,x ; (sin64[0] + 0)
5315 : 85 53 __ STA T0 + 0 
5317 : 29 80 __ AND #$80
5319 : 10 02 __ BPL $531d ; (ball_run.s8 + 30)
531b : a9 ff __ LDA #$ff
531d : 85 54 __ STA T0 + 1 
531f : 20 b6 54 JSR $54b6 ; (draw_floor.s4 + 0)
5322 : a5 53 __ LDA T0 + 0 
5324 : 0a __ __ ASL
5325 : 85 1b __ STA ACCU + 0 
5327 : a5 54 __ LDA T0 + 1 
5329 : 2a __ __ ROL
532a : 06 1b __ ASL ACCU + 0 
532c : 2a __ __ ROL
532d : aa __ __ TAX
532e : 18 __ __ CLC
532f : a5 1b __ LDA ACCU + 0 
5331 : 65 53 __ ADC T0 + 0 
5333 : 85 1b __ STA ACCU + 0 
5335 : 8a __ __ TXA
5336 : 65 54 __ ADC T0 + 1 
5338 : 06 1b __ ASL ACCU + 0 
533a : 2a __ __ ROL
533b : 06 1b __ ASL ACCU + 0 
533d : 2a __ __ ROL
533e : 06 1b __ ASL ACCU + 0 
5340 : 2a __ __ ROL
5341 : 06 1b __ ASL ACCU + 0 
5343 : 2a __ __ ROL
5344 : 85 1c __ STA ACCU + 1 
5346 : 20 8a 78 JSR $788a ; (divs16@proxy + 0)
5349 : 18 __ __ CLC
534a : a5 1b __ LDA ACCU + 0 
534c : 69 f0 __ ADC #$f0
534e : 85 5e __ STA T8 + 0 
5350 : a5 1c __ LDA ACCU + 1 
5352 : 69 00 __ ADC #$00
5354 : 85 5f __ STA T8 + 1 
5356 : a5 60 __ LDA T9 + 0 
5358 : 85 1b __ STA ACCU + 0 
535a : 29 80 __ AND #$80
535c : 10 02 __ BPL $5360 ; (ball_run.s8 + 97)
535e : a9 ff __ LDA #$ff
5360 : 85 1c __ STA ACCU + 1 
5362 : a9 1e __ LDA #$1e
5364 : 20 92 73 JSR $7392 ; (mul16by8 + 0)
5367 : 20 8a 78 JSR $788a ; (divs16@proxy + 0)
536a : a9 b4 __ LDA #$b4
536c : 20 92 73 JSR $7392 ; (mul16by8 + 0)
536f : 20 65 78 JSR $7865 ; (divs16@proxy + 0)
5372 : 18 __ __ CLC
5373 : a5 1b __ LDA ACCU + 0 
5375 : 69 50 __ ADC #$50
5377 : 85 12 __ STA P5 
5379 : a5 1c __ LDA ACCU + 1 
537b : 69 00 __ ADC #$00
537d : 85 13 __ STA P6 
537f : a9 50 __ LDA #$50
5381 : 85 1b __ STA ACCU + 0 
5383 : a9 46 __ LDA #$46
5385 : 85 1c __ STA ACCU + 1 
5387 : 20 65 78 JSR $7865 ; (divs16@proxy + 0)
538a : 18 __ __ CLC
538b : a5 1b __ LDA ACCU + 0 
538d : 69 48 __ ADC #$48
538f : 85 14 __ STA P7 
5391 : a5 1c __ LDA ACCU + 1 
5393 : 69 00 __ ADC #$00
5395 : 85 15 __ STA P8 
5397 : a9 a0 __ LDA #$a0
5399 : 85 1b __ STA ACCU + 0 
539b : a9 05 __ LDA #$05
539d : 85 1c __ STA ACCU + 1 
539f : 20 65 78 JSR $7865 ; (divs16@proxy + 0)
53a2 : a5 1b __ LDA ACCU + 0 
53a4 : 85 16 __ STA P9 
53a6 : a5 1c __ LDA ACCU + 1 
53a8 : 85 17 __ STA P10 
53aa : a9 1c __ LDA #$1c
53ac : 85 1b __ STA ACCU + 0 
53ae : a9 02 __ LDA #$02
53b0 : 85 1c __ STA ACCU + 1 
53b2 : 20 65 78 JSR $7865 ; (divs16@proxy + 0)
53b5 : a5 1b __ LDA ACCU + 0 
53b7 : 8d ea bf STA $bfea ; (sstack + 0)
53ba : a5 1c __ LDA ACCU + 1 
53bc : 8d eb bf STA $bfeb ; (sstack + 1)
53bf : 20 15 59 JSR $5915 ; (draw_shadow.s4 + 0)
53c2 : a5 12 __ LDA P5 
53c4 : 8d ea bf STA $bfea ; (sstack + 0)
53c7 : a5 13 __ LDA P6 
53c9 : 8d eb bf STA $bfeb ; (sstack + 1)
53cc : a5 59 __ LDA T5 + 0 
53ce : 8d ee bf STA $bfee ; (sstack + 4)
53d1 : 18 __ __ CLC
53d2 : 69 02 __ ADC #$02
53d4 : 85 59 __ STA T5 + 0 
53d6 : a5 5c __ LDA T7 + 0 
53d8 : 85 1b __ STA ACCU + 0 
53da : a5 5d __ LDA T7 + 1 
53dc : 85 1c __ STA ACCU + 1 
53de : a9 3c __ LDA #$3c
53e0 : 20 92 73 JSR $7392 ; (mul16by8 + 0)
53e3 : a9 7f __ LDA #$7f
53e5 : 85 03 __ STA WORK + 0 
53e7 : 20 7d 74 JSR $747d ; (divmod@proxy + 0)
53ea : 38 __ __ SEC
53eb : a9 64 __ LDA #$64
53ed : e5 1b __ SBC ACCU + 0 
53ef : 85 1b __ STA ACCU + 0 
53f1 : a9 00 __ LDA #$00
53f3 : 85 1c __ STA ACCU + 1 
53f5 : a9 b4 __ LDA #$b4
53f7 : 20 92 73 JSR $7392 ; (mul16by8 + 0)
53fa : 20 65 78 JSR $7865 ; (divs16@proxy + 0)
53fd : 18 __ __ CLC
53fe : a5 1b __ LDA ACCU + 0 
5400 : 69 48 __ ADC #$48
5402 : 8d ec bf STA $bfec ; (sstack + 2)
5405 : a5 1c __ LDA ACCU + 1 
5407 : 69 00 __ ADC #$00
5409 : 8d ed bf STA $bfed ; (sstack + 3)
540c : a9 40 __ LDA #$40
540e : 85 1b __ STA ACCU + 0 
5410 : a9 0b __ LDA #$0b
5412 : 85 1c __ STA ACCU + 1 
5414 : 20 65 78 JSR $7865 ; (divs16@proxy + 0)
5417 : a5 1b __ LDA ACCU + 0 
5419 : 8d ef bf STA $bfef ; (sstack + 5)
541c : a5 1c __ LDA ACCU + 1 
541e : 8d f0 bf STA $bff0 ; (sstack + 6)
5421 : 20 ae 5a JSR $5aae ; (draw_ball.s1 + 0)
5424 : e6 58 __ INC T4 + 0 
5426 : e6 57 __ INC T3 + 0 
5428 : e6 57 __ INC T3 + 0 
542a : e6 56 __ INC T2 + 0 
542c : e6 55 __ INC T1 + 0 
542e : e6 55 __ INC T1 + 0 
5430 : e6 5a __ INC T6 + 0 
5432 : f0 03 __ BEQ $5437 ; (ball_run.s11 + 0)
5434 : 4c c6 52 JMP $52c6 ; (ball_run.l5 + 0)
.s11:
5437 : e6 5b __ INC T6 + 1 
5439 : d0 f9 __ BNE $5434 ; (ball_run.s8 + 309)
.s9:
543b : a9 00 __ LDA #$00
543d : 85 0d __ STA P0 
543f : 85 0e __ STA P1 
5441 : 85 10 __ STA P3 
5443 : a9 36 __ LDA #$36
5445 : 85 01 __ STA $01 
5447 : 20 0e 0f JSR $0f0e ; (vic_setmode@proxy + 0)
544a : a9 00 __ LDA #$00
544c : 8d 20 d0 STA $d020 
544f : 8d 21 d0 STA $d021 
.s3:
5452 : a2 0d __ LDX #$0d
5454 : bd af bf LDA $bfaf,x ; (ball_run@stack + 0)
5457 : 95 53 __ STA T0 + 0,x 
5459 : ca __ __ DEX
545a : 10 f8 __ BPL $5454 ; (ball_run.s3 + 2)
545c : 60 __ __ RTS
--------------------------------------------------------------------
ball_init: ; ball_init()->void
; 293, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
545d : 78 __ __ SEI
545e : a9 35 __ LDA #$35
5460 : 85 01 __ STA $01 
5462 : 20 0e 21 JSR $210e ; (mmap_trampoline.s4 + 0)
5465 : 58 __ __ CLI
5466 : a9 00 __ LDA #$00
5468 : 85 0f __ STA P2 
546a : 85 10 __ STA P3 
546c : 85 43 __ STA T0 + 0 
546e : 85 0d __ STA P0 
5470 : 20 4b 78 JSR $784b ; (memset@proxy + 0)
5473 : a9 c0 __ LDA #$c0
5475 : 85 44 __ STA T0 + 1 
5477 : a9 00 __ LDA #$00
5479 : 85 1f __ STA ADDR + 0 
547b : f0 02 __ BEQ $547f ; (ball_init.l7 + 0)
.s8:
547d : e6 44 __ INC T0 + 1 
.l7:
547f : a9 12 __ LDA #$12
5481 : a0 00 __ LDY #$00
5483 : 91 43 __ STA (T0 + 0),y 
5485 : 18 __ __ CLC
5486 : a5 44 __ LDA T0 + 1 
5488 : 69 18 __ ADC #$18
548a : 85 20 __ STA ADDR + 1 
548c : a9 0c __ LDA #$0c
548e : a4 43 __ LDY T0 + 0 
5490 : 91 1f __ STA (ADDR + 0),y 
5492 : 98 __ __ TYA
5493 : 18 __ __ CLC
5494 : 69 01 __ ADC #$01
5496 : 85 43 __ STA T0 + 0 
5498 : b0 e3 __ BCS $547d ; (ball_init.s8 + 0)
.s9:
549a : c9 e8 __ CMP #$e8
549c : d0 e1 __ BNE $547f ; (ball_init.l7 + 0)
.s6:
549e : a5 44 __ LDA T0 + 1 
54a0 : c9 c3 __ CMP #$c3
54a2 : d0 db __ BNE $547f ; (ball_init.l7 + 0)
.s5:
54a4 : a9 00 __ LDA #$00
54a6 : 85 0e __ STA P1 
54a8 : 85 10 __ STA P3 
54aa : 20 ab 78 JSR $78ab ; (vic_setmode@proxy + 0)
54ad : a9 00 __ LDA #$00
54af : 8d 21 d0 STA $d021 
54b2 : 8d 20 d0 STA $d020 
.s3:
54b5 : 60 __ __ RTS
--------------------------------------------------------------------
draw_floor: ; draw_floor(u8)->void
; 137, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
54b6 : a9 00 __ LDA #$00
54b8 : 85 51 __ STA T3 + 0 
.l5:
54ba : a5 18 __ LDA P11 ; (floor_rot + 0)
54bc : 85 11 __ STA P4 
54be : a9 b0 __ LDA #$b0
54c0 : 85 0d __ STA P0 
54c2 : a9 ff __ LDA #$ff
54c4 : 85 0e __ STA P1 
54c6 : a5 51 __ LDA T3 + 0 
54c8 : 0a __ __ ASL
54c9 : aa __ __ TAX
54ca : a9 e8 __ LDA #$e8
54cc : 85 12 __ STA P5 
54ce : a9 bf __ LDA #$bf
54d0 : 85 13 __ STA P6 
54d2 : a9 e6 __ LDA #$e6
54d4 : 85 14 __ STA P7 
54d6 : a9 bf __ LDA #$bf
54d8 : 85 15 __ STA P8 
54da : bd e5 7c LDA $7ce5,x ; (gz[0] + 0)
54dd : 85 0f __ STA P2 
54df : bd e6 7c LDA $7ce6,x ; (gz[0] + 1)
54e2 : 85 10 __ STA P3 
54e4 : 20 b2 56 JSR $56b2 ; (rotate_y.s4 + 0)
54e7 : e6 0e __ INC P1 
54e9 : a9 50 __ LDA #$50
54eb : 85 0d __ STA P0 
54ed : a9 e4 __ LDA #$e4
54ef : 85 12 __ STA P5 
54f1 : a9 bf __ LDA #$bf
54f3 : 85 15 __ STA P8 
54f5 : a9 bf __ LDA #$bf
54f7 : 85 13 __ STA P6 
54f9 : a9 e2 __ LDA #$e2
54fb : 85 14 __ STA P7 
54fd : 20 b2 56 JSR $56b2 ; (rotate_y.s4 + 0)
5500 : ad e7 bf LDA $bfe7 ; (rz0 + 1)
5503 : 30 1a __ BMI $551f ; (draw_floor.s8 + 0)
.s21:
5505 : d0 07 __ BNE $550e ; (draw_floor.s6 + 0)
.s20:
5507 : ad e6 bf LDA $bfe6 ; (rz0 + 0)
550a : c9 0f __ CMP #$0f
550c : 90 11 __ BCC $551f ; (draw_floor.s8 + 0)
.s6:
550e : ad e3 bf LDA $bfe3 ; (rz1 + 1)
5511 : 30 0c __ BMI $551f ; (draw_floor.s8 + 0)
.s19:
5513 : f0 03 __ BEQ $5518 ; (draw_floor.s18 + 0)
5515 : 4c 24 56 JMP $5624 ; (draw_floor.s7 + 0)
.s18:
5518 : ad e2 bf LDA $bfe2 ; (rz1 + 0)
551b : c9 0f __ CMP #$0f
551d : b0 f6 __ BCS $5515 ; (draw_floor.s19 + 2)
.s8:
551f : e6 51 __ INC T3 + 0 
5521 : a5 51 __ LDA T3 + 0 
5523 : c9 07 __ CMP #$07
5525 : d0 93 __ BNE $54ba ; (draw_floor.l5 + 0)
.s9:
5527 : a9 00 __ LDA #$00
5529 : 85 51 __ STA T3 + 0 
.l10:
552b : a5 18 __ LDA P11 ; (floor_rot + 0)
552d : 85 11 __ STA P4 
552f : a9 a0 __ LDA #$a0
5531 : 85 0f __ STA P2 
5533 : a9 00 __ LDA #$00
5535 : 85 10 __ STA P3 
5537 : a5 51 __ LDA T3 + 0 
5539 : 0a __ __ ASL
553a : aa __ __ TAX
553b : a9 e0 __ LDA #$e0
553d : 85 12 __ STA P5 
553f : a9 bf __ LDA #$bf
5541 : 85 13 __ STA P6 
5543 : a9 de __ LDA #$de
5545 : 85 14 __ STA P7 
5547 : a9 bf __ LDA #$bf
5549 : 85 15 __ STA P8 
554b : bd 30 7d LDA $7d30,x ; (gx[0] + 0)
554e : 85 0d __ STA P0 
5550 : bd 31 7d LDA $7d31,x ; (gx[0] + 1)
5553 : 85 0e __ STA P1 
5555 : 20 b2 56 JSR $56b2 ; (rotate_y.s4 + 0)
5558 : e6 10 __ INC P3 
555a : a9 40 __ LDA #$40
555c : 85 0f __ STA P2 
555e : a9 dc __ LDA #$dc
5560 : 85 12 __ STA P5 
5562 : a9 bf __ LDA #$bf
5564 : 85 15 __ STA P8 
5566 : a9 bf __ LDA #$bf
5568 : 85 13 __ STA P6 
556a : a9 da __ LDA #$da
556c : 85 14 __ STA P7 
556e : 20 b2 56 JSR $56b2 ; (rotate_y.s4 + 0)
5571 : ad df bf LDA $bfdf ; (rz0 + 1)
5574 : 30 17 __ BMI $558d ; (draw_floor.s13 + 0)
.s17:
5576 : d0 07 __ BNE $557f ; (draw_floor.s11 + 0)
.s16:
5578 : ad de bf LDA $bfde ; (rz0 + 0)
557b : c9 0f __ CMP #$0f
557d : 90 0e __ BCC $558d ; (draw_floor.s13 + 0)
.s11:
557f : ad db bf LDA $bfdb ; (rz1 + 1)
5582 : 30 09 __ BMI $558d ; (draw_floor.s13 + 0)
.s15:
5584 : d0 10 __ BNE $5596 ; (draw_floor.s12 + 0)
.s14:
5586 : ad da bf LDA $bfda ; (rz1 + 0)
5589 : c9 0f __ CMP #$0f
558b : b0 09 __ BCS $5596 ; (draw_floor.s12 + 0)
.s13:
558d : e6 51 __ INC T3 + 0 
558f : a5 51 __ LDA T3 + 0 
5591 : c9 07 __ CMP #$07
5593 : d0 96 __ BNE $552b ; (draw_floor.l10 + 0)
.s3:
5595 : 60 __ __ RTS
.s12:
5596 : ad e0 bf LDA $bfe0 ; (rx0 + 0)
5599 : 85 1b __ STA ACCU + 0 
559b : ad e1 bf LDA $bfe1 ; (rx0 + 1)
559e : 85 1c __ STA ACCU + 1 
55a0 : a9 b4 __ LDA #$b4
55a2 : 20 92 73 JSR $7392 ; (mul16by8 + 0)
55a5 : ad de bf LDA $bfde ; (rz0 + 0)
55a8 : 85 03 __ STA WORK + 0 
55aa : ad df bf LDA $bfdf ; (rz0 + 1)
55ad : 85 04 __ STA WORK + 1 
55af : 20 46 74 JSR $7446 ; (divs16 + 0)
55b2 : 18 __ __ CLC
55b3 : a5 1b __ LDA ACCU + 0 
55b5 : 69 50 __ ADC #$50
55b7 : 85 12 __ STA P5 
55b9 : a5 1c __ LDA ACCU + 1 
55bb : 69 00 __ ADC #$00
55bd : 85 13 __ STA P6 
55bf : ad de bf LDA $bfde ; (rz0 + 0)
55c2 : 85 03 __ STA WORK + 0 
55c4 : ad df bf LDA $bfdf ; (rz0 + 1)
55c7 : 85 04 __ STA WORK + 1 
55c9 : 20 95 78 JSR $7895 ; (divmod@proxy + 0)
55cc : 18 __ __ CLC
55cd : a5 1b __ LDA ACCU + 0 
55cf : 69 48 __ ADC #$48
55d1 : 85 14 __ STA P7 
55d3 : a5 1c __ LDA ACCU + 1 
55d5 : 69 00 __ ADC #$00
55d7 : 85 15 __ STA P8 
55d9 : ad dc bf LDA $bfdc ; (rx1 + 0)
55dc : 85 1b __ STA ACCU + 0 
55de : ad dd bf LDA $bfdd ; (rx1 + 1)
55e1 : 85 1c __ STA ACCU + 1 
55e3 : a9 b4 __ LDA #$b4
55e5 : 20 92 73 JSR $7392 ; (mul16by8 + 0)
55e8 : ad da bf LDA $bfda ; (rz1 + 0)
55eb : 85 03 __ STA WORK + 0 
55ed : ad db bf LDA $bfdb ; (rz1 + 1)
55f0 : 85 04 __ STA WORK + 1 
55f2 : 20 46 74 JSR $7446 ; (divs16 + 0)
55f5 : 18 __ __ CLC
55f6 : a5 1b __ LDA ACCU + 0 
55f8 : 69 50 __ ADC #$50
55fa : 85 16 __ STA P9 
55fc : a5 1c __ LDA ACCU + 1 
55fe : 69 00 __ ADC #$00
5600 : 85 17 __ STA P10 
5602 : ad da bf LDA $bfda ; (rz1 + 0)
5605 : 85 03 __ STA WORK + 0 
5607 : ad db bf LDA $bfdb ; (rz1 + 1)
560a : 85 04 __ STA WORK + 1 
560c : 20 95 78 JSR $7895 ; (divmod@proxy + 0)
560f : 18 __ __ CLC
5610 : a5 1b __ LDA ACCU + 0 
5612 : 69 48 __ ADC #$48
5614 : 8d ea bf STA $bfea ; (sstack + 0)
5617 : a5 1c __ LDA ACCU + 1 
5619 : 69 00 __ ADC #$00
561b : 8d eb bf STA $bfeb ; (sstack + 1)
561e : 20 77 57 JSR $5777 ; (mc_line.s4 + 0)
5621 : 4c 8d 55 JMP $558d ; (draw_floor.s13 + 0)
.s7:
5624 : ad e8 bf LDA $bfe8 ; (rx0 + 0)
5627 : 85 1b __ STA ACCU + 0 
5629 : ad e9 bf LDA $bfe9 ; (rx0 + 1)
562c : 85 1c __ STA ACCU + 1 
562e : a9 b4 __ LDA #$b4
5630 : 20 92 73 JSR $7392 ; (mul16by8 + 0)
5633 : ad e6 bf LDA $bfe6 ; (rz0 + 0)
5636 : 85 03 __ STA WORK + 0 
5638 : ad e7 bf LDA $bfe7 ; (rz0 + 1)
563b : 85 04 __ STA WORK + 1 
563d : 20 46 74 JSR $7446 ; (divs16 + 0)
5640 : 18 __ __ CLC
5641 : a5 1b __ LDA ACCU + 0 
5643 : 69 50 __ ADC #$50
5645 : 85 12 __ STA P5 
5647 : a5 1c __ LDA ACCU + 1 
5649 : 69 00 __ ADC #$00
564b : 85 13 __ STA P6 
564d : ad e6 bf LDA $bfe6 ; (rz0 + 0)
5650 : 85 03 __ STA WORK + 0 
5652 : ad e7 bf LDA $bfe7 ; (rz0 + 1)
5655 : 85 04 __ STA WORK + 1 
5657 : 20 95 78 JSR $7895 ; (divmod@proxy + 0)
565a : 18 __ __ CLC
565b : a5 1b __ LDA ACCU + 0 
565d : 69 48 __ ADC #$48
565f : 85 14 __ STA P7 
5661 : a5 1c __ LDA ACCU + 1 
5663 : 69 00 __ ADC #$00
5665 : 85 15 __ STA P8 
5667 : ad e4 bf LDA $bfe4 ; (rx1 + 0)
566a : 85 1b __ STA ACCU + 0 
566c : ad e5 bf LDA $bfe5 ; (rx1 + 1)
566f : 85 1c __ STA ACCU + 1 
5671 : a9 b4 __ LDA #$b4
5673 : 20 92 73 JSR $7392 ; (mul16by8 + 0)
5676 : ad e2 bf LDA $bfe2 ; (rz1 + 0)
5679 : 85 03 __ STA WORK + 0 
567b : ad e3 bf LDA $bfe3 ; (rz1 + 1)
567e : 85 04 __ STA WORK + 1 
5680 : 20 46 74 JSR $7446 ; (divs16 + 0)
5683 : 18 __ __ CLC
5684 : a5 1b __ LDA ACCU + 0 
5686 : 69 50 __ ADC #$50
5688 : 85 16 __ STA P9 
568a : a5 1c __ LDA ACCU + 1 
568c : 69 00 __ ADC #$00
568e : 85 17 __ STA P10 
5690 : ad e2 bf LDA $bfe2 ; (rz1 + 0)
5693 : 85 03 __ STA WORK + 0 
5695 : ad e3 bf LDA $bfe3 ; (rz1 + 1)
5698 : 85 04 __ STA WORK + 1 
569a : 20 95 78 JSR $7895 ; (divmod@proxy + 0)
569d : 18 __ __ CLC
569e : a5 1b __ LDA ACCU + 0 
56a0 : 69 48 __ ADC #$48
56a2 : 8d ea bf STA $bfea ; (sstack + 0)
56a5 : a5 1c __ LDA ACCU + 1 
56a7 : 69 00 __ ADC #$00
56a9 : 8d eb bf STA $bfeb ; (sstack + 1)
56ac : 20 77 57 JSR $5777 ; (mc_line.s4 + 0)
56af : 4c 1f 55 JMP $551f ; (draw_floor.s8 + 0)
--------------------------------------------------------------------
rotate_y: ; rotate_y(i16,i16,u8,i16*,i16*)->void
; 128, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
56b2 : a5 11 __ LDA P4 ; (angle + 0)
56b4 : 29 3f __ AND #$3f
56b6 : aa __ __ TAX
56b7 : bd 4b 7c LDA $7c4b,x ; (sin64[0] + 0)
56ba : 85 45 __ STA T1 + 0 
56bc : 85 03 __ STA WORK + 0 
56be : 29 80 __ AND #$80
56c0 : 10 02 __ BPL $56c4 ; (rotate_y.s4 + 18)
56c2 : a9 ff __ LDA #$ff
56c4 : 85 46 __ STA T1 + 1 
56c6 : 85 04 __ STA WORK + 1 
56c8 : a5 0f __ LDA P2 ; (z + 0)
56ca : 38 __ __ SEC
56cb : e9 f0 __ SBC #$f0
56cd : 85 47 __ STA T2 + 0 
56cf : 85 1b __ STA ACCU + 0 
56d1 : a5 10 __ LDA P3 ; (z + 1)
56d3 : e9 00 __ SBC #$00
56d5 : 85 48 __ STA T2 + 1 
56d7 : 85 1c __ STA ACCU + 1 
56d9 : 20 00 74 JSR $7400 ; (mul16 + 0)
56dc : a5 05 __ LDA WORK + 2 
56de : 85 49 __ STA T3 + 0 
56e0 : a5 06 __ LDA WORK + 3 
56e2 : 85 4a __ STA T3 + 1 
56e4 : 18 __ __ CLC
56e5 : a5 11 __ LDA P4 ; (angle + 0)
56e7 : 69 10 __ ADC #$10
56e9 : 29 3f __ AND #$3f
56eb : aa __ __ TAX
56ec : bd 4b 7c LDA $7c4b,x ; (sin64[0] + 0)
56ef : 85 43 __ STA T0 + 0 
56f1 : 85 03 __ STA WORK + 0 
56f3 : 29 80 __ AND #$80
56f5 : 10 02 __ BPL $56f9 ; (rotate_y.s4 + 71)
56f7 : a9 ff __ LDA #$ff
56f9 : 85 44 __ STA T0 + 1 
56fb : 85 04 __ STA WORK + 1 
56fd : a5 0d __ LDA P0 ; (x + 0)
56ff : 85 1b __ STA ACCU + 0 
5701 : a5 0e __ LDA P1 ; (x + 1)
5703 : 85 1c __ STA ACCU + 1 
5705 : 20 00 74 JSR $7400 ; (mul16 + 0)
5708 : 18 __ __ CLC
5709 : a5 05 __ LDA WORK + 2 
570b : 65 49 __ ADC T3 + 0 
570d : 85 1b __ STA ACCU + 0 
570f : a5 06 __ LDA WORK + 3 
5711 : 65 4a __ ADC T3 + 1 
5713 : 85 1c __ STA ACCU + 1 
5715 : 20 8a 78 JSR $788a ; (divs16@proxy + 0)
5718 : a5 1b __ LDA ACCU + 0 
571a : a0 00 __ LDY #$00
571c : 91 12 __ STA (P5),y ; (rx + 0)
571e : a5 1c __ LDA ACCU + 1 
5720 : c8 __ __ INY
5721 : 91 12 __ STA (P5),y ; (rx + 0)
5723 : 38 __ __ SEC
5724 : a9 00 __ LDA #$00
5726 : e5 0d __ SBC P0 ; (x + 0)
5728 : 85 1b __ STA ACCU + 0 
572a : a9 00 __ LDA #$00
572c : e5 0e __ SBC P1 ; (x + 1)
572e : 85 1c __ STA ACCU + 1 
5730 : a5 45 __ LDA T1 + 0 
5732 : 85 03 __ STA WORK + 0 
5734 : a5 46 __ LDA T1 + 1 
5736 : 85 04 __ STA WORK + 1 
5738 : 20 00 74 JSR $7400 ; (mul16 + 0)
573b : a5 05 __ LDA WORK + 2 
573d : 85 45 __ STA T1 + 0 
573f : a5 06 __ LDA WORK + 3 
5741 : 85 46 __ STA T1 + 1 
5743 : a5 47 __ LDA T2 + 0 
5745 : 85 1b __ STA ACCU + 0 
5747 : a5 48 __ LDA T2 + 1 
5749 : 85 1c __ STA ACCU + 1 
574b : a5 43 __ LDA T0 + 0 
574d : 85 03 __ STA WORK + 0 
574f : a5 44 __ LDA T0 + 1 
5751 : 85 04 __ STA WORK + 1 
5753 : 20 00 74 JSR $7400 ; (mul16 + 0)
5756 : 18 __ __ CLC
5757 : a5 05 __ LDA WORK + 2 
5759 : 65 45 __ ADC T1 + 0 
575b : 85 1b __ STA ACCU + 0 
575d : a5 06 __ LDA WORK + 3 
575f : 65 46 __ ADC T1 + 1 
5761 : 85 1c __ STA ACCU + 1 
5763 : 20 8a 78 JSR $788a ; (divs16@proxy + 0)
5766 : 18 __ __ CLC
5767 : a5 1b __ LDA ACCU + 0 
5769 : 69 f0 __ ADC #$f0
576b : a0 00 __ LDY #$00
576d : 91 14 __ STA (P7),y ; (rz + 0)
576f : a5 1c __ LDA ACCU + 1 
5771 : 69 00 __ ADC #$00
5773 : c8 __ __ INY
5774 : 91 14 __ STA (P7),y ; (rz + 0)
.s3:
5776 : 60 __ __ RTS
--------------------------------------------------------------------
mc_line: ; mc_line(i16,i16,i16,i16,u8)->void
;  89, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5777 : 38 __ __ SEC
5778 : a5 16 __ LDA P9 ; (x1 + 0)
577a : e5 12 __ SBC P5 ; (x0 + 0)
577c : 85 43 __ STA T3 + 0 
577e : a5 17 __ LDA P10 ; (x1 + 1)
5780 : e5 13 __ SBC P6 ; (x0 + 1)
5782 : 85 44 __ STA T3 + 1 
5784 : 10 0d __ BPL $5793 ; (mc_line.s5 + 0)
.s37:
5786 : 38 __ __ SEC
5787 : a9 00 __ LDA #$00
5789 : e5 43 __ SBC T3 + 0 
578b : 85 43 __ STA T3 + 0 
578d : a9 00 __ LDA #$00
578f : e5 44 __ SBC T3 + 1 
5791 : 85 44 __ STA T3 + 1 
.s5:
5793 : ad ea bf LDA $bfea ; (sstack + 0)
5796 : 85 45 __ STA T4 + 0 
5798 : 38 __ __ SEC
5799 : e5 14 __ SBC P7 ; (y0 + 0)
579b : 85 47 __ STA T5 + 0 
579d : ad eb bf LDA $bfeb ; (sstack + 1)
57a0 : 85 46 __ STA T4 + 1 
57a2 : e5 15 __ SBC P8 ; (y0 + 1)
57a4 : 85 48 __ STA T5 + 1 
57a6 : 10 0d __ BPL $57b5 ; (mc_line.s6 + 0)
.s36:
57a8 : 38 __ __ SEC
57a9 : a9 00 __ LDA #$00
57ab : e5 47 __ SBC T5 + 0 
57ad : 85 47 __ STA T5 + 0 
57af : a9 00 __ LDA #$00
57b1 : e5 48 __ SBC T5 + 1 
57b3 : 85 48 __ STA T5 + 1 
.s6:
57b5 : a5 13 __ LDA P6 ; (x0 + 1)
57b7 : c5 17 __ CMP P10 ; (x1 + 1)
57b9 : d0 08 __ BNE $57c3 ; (mc_line.s35 + 0)
.s32:
57bb : a5 12 __ LDA P5 ; (x0 + 0)
57bd : c5 16 __ CMP P9 ; (x1 + 0)
.s33:
57bf : 90 08 __ BCC $57c9 ; (mc_line.s31 + 0)
57c1 : b0 0e __ BCS $57d1 ; (mc_line.s7 + 0)
.s35:
57c3 : 45 17 __ EOR P10 ; (x1 + 1)
57c5 : 10 f8 __ BPL $57bf ; (mc_line.s33 + 0)
.s34:
57c7 : 90 08 __ BCC $57d1 ; (mc_line.s7 + 0)
.s31:
57c9 : a9 01 __ LDA #$01
57cb : 85 49 __ STA T6 + 0 
57cd : a9 00 __ LDA #$00
57cf : f0 04 __ BEQ $57d5 ; (mc_line.s8 + 0)
.s7:
57d1 : a9 ff __ LDA #$ff
57d3 : 85 49 __ STA T6 + 0 
.s8:
57d5 : 85 4a __ STA T6 + 1 
57d7 : a5 15 __ LDA P8 ; (y0 + 1)
57d9 : c5 46 __ CMP T4 + 1 
57db : d0 08 __ BNE $57e5 ; (mc_line.s30 + 0)
.s27:
57dd : a5 14 __ LDA P7 ; (y0 + 0)
57df : c5 45 __ CMP T4 + 0 
.s28:
57e1 : 90 08 __ BCC $57eb ; (mc_line.s26 + 0)
57e3 : b0 0e __ BCS $57f3 ; (mc_line.s9 + 0)
.s30:
57e5 : 45 46 __ EOR T4 + 1 
57e7 : 10 f8 __ BPL $57e1 ; (mc_line.s28 + 0)
.s29:
57e9 : 90 08 __ BCC $57f3 ; (mc_line.s9 + 0)
.s26:
57eb : a9 01 __ LDA #$01
57ed : 85 4b __ STA T7 + 0 
57ef : a9 00 __ LDA #$00
57f1 : f0 04 __ BEQ $57f7 ; (mc_line.s10 + 0)
.s9:
57f3 : a9 ff __ LDA #$ff
57f5 : 85 4b __ STA T7 + 0 
.s10:
57f7 : 85 4c __ STA T7 + 1 
57f9 : 38 __ __ SEC
57fa : a5 43 __ LDA T3 + 0 
57fc : e5 47 __ SBC T5 + 0 
57fe : 85 4d __ STA T8 + 0 
5800 : a5 44 __ LDA T3 + 1 
5802 : e5 48 __ SBC T5 + 1 
5804 : 85 4e __ STA T8 + 1 
5806 : 38 __ __ SEC
5807 : a9 00 __ LDA #$00
5809 : e5 47 __ SBC T5 + 0 
580b : 85 4f __ STA T9 + 0 
580d : a9 00 __ LDA #$00
580f : e5 48 __ SBC T5 + 1 
5811 : 85 50 __ STA T9 + 1 
.l11:
5813 : a5 12 __ LDA P5 ; (x0 + 0)
5815 : 85 0d __ STA P0 
5817 : a9 01 __ LDA #$01
5819 : 85 11 __ STA P4 
581b : a5 13 __ LDA P6 ; (x0 + 1)
581d : 85 0e __ STA P1 
581f : a5 14 __ LDA P7 ; (y0 + 0)
5821 : 85 0f __ STA P2 
5823 : a5 15 __ LDA P8 ; (y0 + 1)
5825 : 85 10 __ STA P3 
5827 : 20 b2 58 JSR $58b2 ; (mc_setpix.s4 + 0)
582a : a5 13 __ LDA P6 ; (x0 + 1)
582c : c5 17 __ CMP P10 ; (x1 + 1)
582e : d0 12 __ BNE $5842 ; (mc_line.s12 + 0)
.s25:
5830 : a5 12 __ LDA P5 ; (x0 + 0)
5832 : c5 16 __ CMP P9 ; (x1 + 0)
5834 : d0 0c __ BNE $5842 ; (mc_line.s12 + 0)
.s23:
5836 : a5 15 __ LDA P8 ; (y0 + 1)
5838 : c5 46 __ CMP T4 + 1 
583a : d0 06 __ BNE $5842 ; (mc_line.s12 + 0)
.s24:
583c : a5 14 __ LDA P7 ; (y0 + 0)
583e : c5 45 __ CMP T4 + 0 
5840 : f0 63 __ BEQ $58a5 ; (mc_line.s3 + 0)
.s12:
5842 : a5 4d __ LDA T8 + 0 
5844 : 0a __ __ ASL
5845 : 85 1b __ STA ACCU + 0 
5847 : a5 4e __ LDA T8 + 1 
5849 : 2a __ __ ROL
584a : 85 1c __ STA ACCU + 1 
584c : a5 50 __ LDA T9 + 1 
584e : c5 1c __ CMP ACCU + 1 
5850 : d0 08 __ BNE $585a ; (mc_line.s22 + 0)
.s19:
5852 : a5 4f __ LDA T9 + 0 
5854 : c5 1b __ CMP ACCU + 0 
.s20:
5856 : 90 08 __ BCC $5860 ; (mc_line.s18 + 0)
5858 : b0 20 __ BCS $587a ; (mc_line.s13 + 0)
.s22:
585a : 45 1c __ EOR ACCU + 1 
585c : 10 f8 __ BPL $5856 ; (mc_line.s20 + 0)
.s21:
585e : 90 1a __ BCC $587a ; (mc_line.s13 + 0)
.s18:
5860 : 18 __ __ CLC
5861 : a5 12 __ LDA P5 ; (x0 + 0)
5863 : 65 49 __ ADC T6 + 0 
5865 : 85 12 __ STA P5 ; (x0 + 0)
5867 : a5 13 __ LDA P6 ; (x0 + 1)
5869 : 65 4a __ ADC T6 + 1 
586b : 85 13 __ STA P6 ; (x0 + 1)
586d : 38 __ __ SEC
586e : a5 4d __ LDA T8 + 0 
5870 : e5 47 __ SBC T5 + 0 
5872 : 85 4d __ STA T8 + 0 
5874 : a5 4e __ LDA T8 + 1 
5876 : e5 48 __ SBC T5 + 1 
5878 : 85 4e __ STA T8 + 1 
.s13:
587a : a5 1c __ LDA ACCU + 1 
587c : 30 0a __ BMI $5888 ; (mc_line.s14 + 0)
.s17:
587e : c5 44 __ CMP T3 + 1 
5880 : d0 04 __ BNE $5886 ; (mc_line.s16 + 0)
.s15:
5882 : a5 1b __ LDA ACCU + 0 
5884 : c5 43 __ CMP T3 + 0 
.s16:
5886 : b0 8b __ BCS $5813 ; (mc_line.l11 + 0)
.s14:
5888 : 18 __ __ CLC
5889 : a5 14 __ LDA P7 ; (y0 + 0)
588b : 65 4b __ ADC T7 + 0 
588d : 85 14 __ STA P7 ; (y0 + 0)
588f : a5 15 __ LDA P8 ; (y0 + 1)
5891 : 65 4c __ ADC T7 + 1 
5893 : 85 15 __ STA P8 ; (y0 + 1)
5895 : 18 __ __ CLC
5896 : a5 4d __ LDA T8 + 0 
5898 : 65 43 __ ADC T3 + 0 
589a : 85 4d __ STA T8 + 0 
589c : a5 4e __ LDA T8 + 1 
589e : 65 44 __ ADC T3 + 1 
58a0 : 85 4e __ STA T8 + 1 
58a2 : 4c 13 58 JMP $5813 ; (mc_line.l11 + 0)
.s3:
58a5 : 60 __ __ RTS
--------------------------------------------------------------------
mc_setpix@proxy: ; mc_setpix@proxy
58a6 : a5 46 __ LDA $46 
58a8 : 85 0d __ STA P0 
58aa : a5 47 __ LDA $47 
58ac : 85 0e __ STA P1 
58ae : a5 18 __ LDA P11 
58b0 : 85 11 __ STA P4 
--------------------------------------------------------------------
mc_setpix: ; mc_setpix(i16,i16,u8)->void
;  54, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
58b2 : a5 0e __ LDA P1 ; (mx + 1)
58b4 : d0 5e __ BNE $5914 ; (mc_setpix.s3 + 0)
.s9:
58b6 : a5 0d __ LDA P0 ; (mx + 0)
58b8 : c9 a0 __ CMP #$a0
58ba : b0 58 __ BCS $5914 ; (mc_setpix.s3 + 0)
.s5:
58bc : a5 10 __ LDA P3 ; (my + 1)
58be : d0 54 __ BNE $5914 ; (mc_setpix.s3 + 0)
.s8:
58c0 : a5 0f __ LDA P2 ; (my + 0)
58c2 : c9 c8 __ CMP #$c8
58c4 : b0 4e __ BCS $5914 ; (mc_setpix.s3 + 0)
.s6:
58c6 : a5 0d __ LDA P0 ; (mx + 0)
58c8 : 29 03 __ AND #$03
58ca : 49 03 __ EOR #$03
58cc : 0a __ __ ASL
58cd : 85 1b __ STA ACCU + 0 
58cf : a5 11 __ LDA P4 ; (col + 0)
58d1 : a6 1b __ LDX ACCU + 0 
58d3 : f0 08 __ BEQ $58dd ; (mc_setpix.s7 + 0)
.l10:
58d5 : 0a __ __ ASL
58d6 : ca __ __ DEX
58d7 : d0 fc __ BNE $58d5 ; (mc_setpix.l10 + 0)
.s11:
58d9 : 85 11 __ STA P4 ; (col + 0)
58db : a6 1b __ LDX ACCU + 0 
.s7:
58dd : a5 0f __ LDA P2 ; (my + 0)
58df : 29 07 __ AND #$07
58e1 : 85 1c __ STA ACCU + 1 
58e3 : a5 0f __ LDA P2 ; (my + 0)
58e5 : 4a __ __ LSR
58e6 : 4a __ __ LSR
58e7 : 4a __ __ LSR
58e8 : 85 1b __ STA ACCU + 0 
58ea : 0a __ __ ASL
58eb : 0a __ __ ASL
58ec : 65 1b __ ADC ACCU + 0 
58ee : 4a __ __ LSR
58ef : 6a __ __ ROR
58f0 : a8 __ __ TAY
58f1 : 29 80 __ AND #$80
58f3 : 6a __ __ ROR
58f4 : 05 1c __ ORA ACCU + 1 
58f6 : 85 1b __ STA ACCU + 0 
58f8 : 98 __ __ TYA
58f9 : 29 3f __ AND #$3f
58fb : 85 1c __ STA ACCU + 1 
58fd : a5 0d __ LDA P0 ; (mx + 0)
58ff : 29 fc __ AND #$fc
5901 : 0a __ __ ASL
5902 : a8 __ __ TAY
5903 : a5 1c __ LDA ACCU + 1 
5905 : 69 e0 __ ADC #$e0
5907 : 85 1c __ STA ACCU + 1 
5909 : bd dc 77 LDA $77dc,x ; (__shltab3L + 0)
590c : 49 ff __ EOR #$ff
590e : 31 1b __ AND (ACCU + 0),y 
5910 : 05 11 __ ORA P4 ; (col + 0)
5912 : 91 1b __ STA (ACCU + 0),y 
.s3:
5914 : 60 __ __ RTS
--------------------------------------------------------------------
draw_shadow: ; draw_shadow(i16,i16,i16,i16)->void
; 174, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5915 : a5 17 __ LDA P10 ; (rx + 1)
5917 : 30 06 __ BMI $591f ; (draw_shadow.s29 + 0)
.s31:
5919 : d0 0c __ BNE $5927 ; (draw_shadow.s5 + 0)
.s30:
591b : a5 16 __ LDA P9 ; (rx + 0)
591d : d0 08 __ BNE $5927 ; (draw_shadow.s5 + 0)
.s29:
591f : a9 01 __ LDA #$01
5921 : 85 16 __ STA P9 ; (rx + 0)
5923 : a9 00 __ LDA #$00
5925 : 85 17 __ STA P10 ; (rx + 1)
.s5:
5927 : ad eb bf LDA $bfeb ; (sstack + 1)
592a : 30 07 __ BMI $5933 ; (draw_shadow.s26 + 0)
.s28:
592c : d0 0f __ BNE $593d ; (draw_shadow.s6 + 0)
.s27:
592e : ad ea bf LDA $bfea ; (sstack + 0)
5931 : d0 0a __ BNE $593d ; (draw_shadow.s6 + 0)
.s26:
5933 : a9 01 __ LDA #$01
5935 : 8d ea bf STA $bfea ; (sstack + 0)
5938 : a9 00 __ LDA #$00
593a : 8d eb bf STA $bfeb ; (sstack + 1)
.s6:
593d : ad ea bf LDA $bfea ; (sstack + 0)
5940 : 85 48 __ STA T2 + 0 
5942 : 49 ff __ EOR #$ff
5944 : 38 __ __ SEC
5945 : 69 00 __ ADC #$00
5947 : 85 4a __ STA T3 + 0 
5949 : a9 00 __ LDA #$00
594b : ed eb bf SBC $bfeb ; (sstack + 1)
594e : 85 4b __ STA T3 + 1 
5950 : ad eb bf LDA $bfeb ; (sstack + 1)
5953 : 85 49 __ STA T2 + 1 
5955 : c5 4b __ CMP T3 + 1 
5957 : d0 07 __ BNE $5960 ; (draw_shadow.s25 + 0)
.s22:
5959 : a5 48 __ LDA T2 + 0 
595b : c5 4a __ CMP T3 + 0 
.s23:
595d : b0 08 __ BCS $5967 ; (draw_shadow.s7 + 0)
595f : 60 __ __ RTS
.s25:
5960 : 45 4b __ EOR T3 + 1 
5962 : 10 f9 __ BPL $595d ; (draw_shadow.s23 + 0)
.s24:
5964 : 90 01 __ BCC $5967 ; (draw_shadow.s7 + 0)
5966 : 60 __ __ RTS
.s7:
5967 : 18 __ __ CLC
5968 : a5 14 __ LDA P7 ; (sy + 0)
596a : 65 4a __ ADC T3 + 0 
596c : 85 4c __ STA T4 + 0 
596e : a5 15 __ LDA P8 ; (sy + 1)
5970 : 65 4b __ ADC T3 + 1 
5972 : 85 4d __ STA T4 + 1 
5974 : a5 48 __ LDA T2 + 0 
5976 : 85 03 __ STA WORK + 0 
5978 : 85 1b __ STA ACCU + 0 
597a : a5 49 __ LDA T2 + 1 
597c : 85 04 __ STA WORK + 1 
597e : 85 1c __ STA ACCU + 1 
5980 : 20 00 74 JSR $7400 ; (mul16 + 0)
5983 : a5 05 __ LDA WORK + 2 
5985 : 85 4e __ STA T5 + 0 
5987 : a5 06 __ LDA WORK + 3 
5989 : 85 4f __ STA T5 + 1 
598b : a5 4d __ LDA T4 + 1 
598d : f0 03 __ BEQ $5992 ; (draw_shadow.l21 + 0)
598f : 4c 2d 5a JMP $5a2d ; (draw_shadow.l11 + 0)
.l21:
5992 : a5 4c __ LDA T4 + 0 
5994 : c9 c8 __ CMP #$c8
5996 : b0 f7 __ BCS $598f ; (draw_shadow.s7 + 40)
.s9:
5998 : a5 4a __ LDA T3 + 0 
599a : 85 03 __ STA WORK + 0 
599c : 85 1b __ STA ACCU + 0 
599e : a5 4b __ LDA T3 + 1 
59a0 : 85 04 __ STA WORK + 1 
59a2 : 85 1c __ STA ACCU + 1 
59a4 : 20 00 74 JSR $7400 ; (mul16 + 0)
59a7 : 38 __ __ SEC
59a8 : a5 4e __ LDA T5 + 0 
59aa : e5 05 __ SBC WORK + 2 
59ac : 85 0d __ STA P0 
59ae : a5 4f __ LDA T5 + 1 
59b0 : e5 06 __ SBC WORK + 3 
59b2 : 30 79 __ BMI $5a2d ; (draw_shadow.l11 + 0)
.s10:
59b4 : 85 0e __ STA P1 
59b6 : 20 54 5a JSR $5a54 ; (mc_isqrt.s4 + 0)
59b9 : a5 1b __ LDA ACCU + 0 
59bb : 85 03 __ STA WORK + 0 
59bd : a5 1c __ LDA ACCU + 1 
59bf : 85 04 __ STA WORK + 1 
59c1 : a5 16 __ LDA P9 ; (rx + 0)
59c3 : 85 1b __ STA ACCU + 0 
59c5 : a5 17 __ LDA P10 ; (rx + 1)
59c7 : 85 1c __ STA ACCU + 1 
59c9 : 20 00 74 JSR $7400 ; (mul16 + 0)
59cc : a5 05 __ LDA WORK + 2 
59ce : 85 1b __ STA ACCU + 0 
59d0 : a5 06 __ LDA WORK + 3 
59d2 : 85 1c __ STA ACCU + 1 
59d4 : a5 48 __ LDA T2 + 0 
59d6 : 85 03 __ STA WORK + 0 
59d8 : a5 49 __ LDA T2 + 1 
59da : 85 04 __ STA WORK + 1 
59dc : 20 46 74 JSR $7446 ; (divs16 + 0)
59df : 18 __ __ CLC
59e0 : a5 12 __ LDA P5 ; (sx + 0)
59e2 : 65 1b __ ADC ACCU + 0 
59e4 : 85 50 __ STA T6 + 0 
59e6 : a5 13 __ LDA P6 ; (sx + 1)
59e8 : 65 1c __ ADC ACCU + 1 
59ea : 85 51 __ STA T6 + 1 
59ec : 38 __ __ SEC
59ed : a5 12 __ LDA P5 ; (sx + 0)
59ef : e5 1b __ SBC ACCU + 0 
59f1 : 85 47 __ STA T0 + 0 
59f3 : a5 13 __ LDA P6 ; (sx + 1)
59f5 : e5 1c __ SBC ACCU + 1 
59f7 : 85 0e __ STA P1 
59f9 : a9 00 __ LDA #$00
59fb : 85 10 __ STA P3 
.l36:
59fd : a5 51 __ LDA T6 + 1 
59ff : c5 0e __ CMP P1 
5a01 : d0 08 __ BNE $5a0b ; (draw_shadow.s20 + 0)
.s17:
5a03 : a5 50 __ LDA T6 + 0 
5a05 : c5 47 __ CMP T0 + 0 
.s18:
5a07 : b0 08 __ BCS $5a11 ; (draw_shadow.s16 + 0)
5a09 : 90 22 __ BCC $5a2d ; (draw_shadow.l11 + 0)
.s20:
5a0b : 45 0e __ EOR P1 
5a0d : 10 f8 __ BPL $5a07 ; (draw_shadow.s18 + 0)
.s19:
5a0f : b0 1c __ BCS $5a2d ; (draw_shadow.l11 + 0)
.s16:
5a11 : a5 47 __ LDA T0 + 0 
5a13 : 85 0d __ STA P0 
5a15 : a5 4c __ LDA T4 + 0 
5a17 : 85 0f __ STA P2 
5a19 : a9 03 __ LDA #$03
5a1b : 85 11 __ STA P4 
5a1d : 20 b2 58 JSR $58b2 ; (mc_setpix.s4 + 0)
5a20 : 18 __ __ CLC
5a21 : a5 0d __ LDA P0 
5a23 : 69 02 __ ADC #$02
5a25 : 85 47 __ STA T0 + 0 
5a27 : 90 d4 __ BCC $59fd ; (draw_shadow.l36 + 0)
.s37:
5a29 : e6 0e __ INC P1 
5a2b : b0 d0 __ BCS $59fd ; (draw_shadow.l36 + 0)
.l11:
5a2d : e6 4c __ INC T4 + 0 
5a2f : d0 02 __ BNE $5a33 ; (draw_shadow.s33 + 0)
.s32:
5a31 : e6 4d __ INC T4 + 1 
.s33:
5a33 : e6 4a __ INC T3 + 0 
5a35 : d0 02 __ BNE $5a39 ; (draw_shadow.s35 + 0)
.s34:
5a37 : e6 4b __ INC T3 + 1 
.s35:
5a39 : a5 49 __ LDA T2 + 1 
5a3b : c5 4b __ CMP T3 + 1 
5a3d : d0 07 __ BNE $5a46 ; (draw_shadow.s15 + 0)
.s12:
5a3f : a5 48 __ LDA T2 + 0 
5a41 : c5 4a __ CMP T3 + 0 
.s13:
5a43 : b0 07 __ BCS $5a4c ; (draw_shadow.s8 + 0)
5a45 : 60 __ __ RTS
.s15:
5a46 : 45 4b __ EOR T3 + 1 
5a48 : 10 f9 __ BPL $5a43 ; (draw_shadow.s13 + 0)
.s14:
5a4a : b0 07 __ BCS $5a53 ; (draw_shadow.s3 + 0)
.s8:
5a4c : a5 4d __ LDA T4 + 1 
5a4e : d0 dd __ BNE $5a2d ; (draw_shadow.l11 + 0)
5a50 : 4c 92 59 JMP $5992 ; (draw_shadow.l21 + 0)
.s3:
5a53 : 60 __ __ RTS
--------------------------------------------------------------------
mc_isqrt: ; mc_isqrt(u16)->i16
;  39, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5a54 : a5 0e __ LDA P1 ; (n + 1)
5a56 : 05 0d __ ORA P0 ; (n + 0)
5a58 : d0 05 __ BNE $5a5f ; (mc_isqrt.s5 + 0)
.s10:
5a5a : 85 1b __ STA ACCU + 0 
.s3:
5a5c : 85 1c __ STA ACCU + 1 
5a5e : 60 __ __ RTS
.s5:
5a5f : a5 0e __ LDA P1 ; (n + 1)
5a61 : 4a __ __ LSR
5a62 : 85 44 __ STA T1 + 1 
5a64 : a5 0d __ LDA P0 ; (n + 0)
5a66 : 6a __ __ ROR
5a67 : 85 43 __ STA T1 + 0 
5a69 : 05 44 __ ORA T1 + 1 
5a6b : d0 06 __ BNE $5a73 ; (mc_isqrt.l6 + 0)
.s9:
5a6d : a2 01 __ LDX #$01
5a6f : 86 1b __ STX ACCU + 0 
5a71 : d0 e9 __ BNE $5a5c ; (mc_isqrt.s3 + 0)
.l6:
5a73 : a5 43 __ LDA T1 + 0 
5a75 : 85 03 __ STA WORK + 0 
5a77 : 85 45 __ STA T2 + 0 
5a79 : a5 44 __ LDA T1 + 1 
5a7b : 85 04 __ STA WORK + 1 
5a7d : 85 46 __ STA T2 + 1 
5a7f : a5 0d __ LDA P0 ; (n + 0)
5a81 : 85 1b __ STA ACCU + 0 
5a83 : a5 0e __ LDA P1 ; (n + 1)
5a85 : 85 1c __ STA ACCU + 1 
5a87 : 20 81 74 JSR $7481 ; (divmod + 0)
5a8a : 18 __ __ CLC
5a8b : a5 1b __ LDA ACCU + 0 
5a8d : 65 43 __ ADC T1 + 0 
5a8f : 85 43 __ STA T1 + 0 
5a91 : a5 1c __ LDA ACCU + 1 
5a93 : 65 44 __ ADC T1 + 1 
5a95 : 4a __ __ LSR
5a96 : 85 44 __ STA T1 + 1 
5a98 : 66 43 __ ROR T1 + 0 
5a9a : c5 46 __ CMP T2 + 1 
5a9c : 90 d5 __ BCC $5a73 ; (mc_isqrt.l6 + 0)
.s11:
5a9e : d0 06 __ BNE $5aa6 ; (mc_isqrt.s7 + 0)
.s8:
5aa0 : a5 43 __ LDA T1 + 0 
5aa2 : c5 45 __ CMP T2 + 0 
5aa4 : 90 cd __ BCC $5a73 ; (mc_isqrt.l6 + 0)
.s7:
5aa6 : a5 45 __ LDA T2 + 0 
5aa8 : 85 1b __ STA ACCU + 0 
5aaa : a5 46 __ LDA T2 + 1 
5aac : b0 ae __ BCS $5a5c ; (mc_isqrt.s3 + 0)
--------------------------------------------------------------------
draw_ball: ; draw_ball(i16,i16,u8,i16)->void
; 199, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s1:
5aae : a2 1c __ LDX #$1c
5ab0 : b5 53 __ LDA T3 + 0,x 
5ab2 : 9d c3 bf STA $bfc3,x ; (draw_ball@stack + 0)
5ab5 : ca __ __ DEX
5ab6 : 10 f8 __ BPL $5ab0 ; (draw_ball.s1 + 2)
.s4:
5ab8 : ad f0 bf LDA $bff0 ; (sstack + 6)
5abb : 30 09 __ BMI $5ac6 ; (draw_ball.s82 + 0)
.s84:
5abd : d0 11 __ BNE $5ad0 ; (draw_ball.s5 + 0)
.s83:
5abf : ad ef bf LDA $bfef ; (sstack + 5)
5ac2 : c9 03 __ CMP #$03
5ac4 : b0 0a __ BCS $5ad0 ; (draw_ball.s5 + 0)
.s82:
5ac6 : a9 03 __ LDA #$03
5ac8 : 8d ef bf STA $bfef ; (sstack + 5)
5acb : a9 00 __ LDA #$00
5acd : 8d f0 bf STA $bff0 ; (sstack + 6)
.s5:
5ad0 : ad ef bf LDA $bfef ; (sstack + 5)
5ad3 : 85 5d __ STA T9 + 0 
5ad5 : 0a __ __ ASL
5ad6 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5ad8 : ad f0 bf LDA $bff0 ; (sstack + 6)
5adb : 85 5e __ STA T9 + 1 
5add : 2a __ __ ROL
5ade : 06 1b __ ASL ACCU + 0 ; (cy + 0)
5ae0 : 2a __ __ ROL
5ae1 : aa __ __ TAX
5ae2 : 18 __ __ CLC
5ae3 : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5ae5 : 65 5d __ ADC T9 + 0 
5ae7 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5ae9 : 8a __ __ TXA
5aea : 65 5e __ ADC T9 + 1 
5aec : 85 1c __ STA ACCU + 1 ; (cy + 1)
5aee : a9 00 __ LDA #$00
5af0 : 85 04 __ STA WORK + 1 
5af2 : 20 83 78 JSR $7883 ; (divs16@proxy + 0)
5af5 : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5af7 : 85 5f __ STA T10 + 0 
5af9 : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5afb : 85 60 __ STA T10 + 1 
5afd : 38 __ __ SEC
5afe : a9 00 __ LDA #$00
5b00 : e5 1b __ SBC ACCU + 0 ; (cy + 0)
5b02 : 85 61 __ STA T11 + 0 
5b04 : a9 00 __ LDA #$00
5b06 : 85 04 __ STA WORK + 1 
5b08 : e5 1c __ SBC ACCU + 1 ; (cy + 1)
5b0a : 85 62 __ STA T11 + 1 
5b0c : a5 5d __ LDA T9 + 0 
5b0e : 0a __ __ ASL
5b0f : 85 1b __ STA ACCU + 0 ; (cy + 0)
5b11 : a5 5e __ LDA T9 + 1 
5b13 : 2a __ __ ROL
5b14 : 06 1b __ ASL ACCU + 0 ; (cy + 0)
5b16 : 2a __ __ ROL
5b17 : 06 1b __ ASL ACCU + 0 ; (cy + 0)
5b19 : 2a __ __ ROL
5b1a : aa __ __ TAX
5b1b : 18 __ __ CLC
5b1c : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5b1e : 65 5d __ ADC T9 + 0 
5b20 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5b22 : 8a __ __ TXA
5b23 : 65 5e __ ADC T9 + 1 
5b25 : 85 1c __ STA ACCU + 1 ; (cy + 1)
5b27 : 20 83 78 JSR $7883 ; (divs16@proxy + 0)
5b2a : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5b2c : 85 63 __ STA T12 + 0 
5b2e : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5b30 : 85 64 __ STA T12 + 1 
5b32 : 38 __ __ SEC
5b33 : a9 00 __ LDA #$00
5b35 : e5 1b __ SBC ACCU + 0 ; (cy + 0)
5b37 : 85 65 __ STA T13 + 0 
5b39 : a9 00 __ LDA #$00
5b3b : e5 1c __ SBC ACCU + 1 ; (cy + 1)
5b3d : 85 66 __ STA T13 + 1 
5b3f : a5 5d __ LDA T9 + 0 
5b41 : 85 03 __ STA WORK + 0 
5b43 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5b45 : a5 5e __ LDA T9 + 1 
5b47 : 85 04 __ STA WORK + 1 
5b49 : 85 1c __ STA ACCU + 1 ; (cy + 1)
5b4b : 20 00 74 JSR $7400 ; (mul16 + 0)
5b4e : a5 05 __ LDA WORK + 2 
5b50 : 85 67 __ STA T14 + 0 
5b52 : a5 06 __ LDA WORK + 3 
5b54 : 85 68 __ STA T14 + 1 
5b56 : 38 __ __ SEC
5b57 : a9 00 __ LDA #$00
5b59 : e5 5d __ SBC T9 + 0 
5b5b : 85 69 __ STA T15 + 0 
5b5d : a9 00 __ LDA #$00
5b5f : e5 5e __ SBC T9 + 1 
5b61 : 85 6a __ STA T15 + 1 
5b63 : a5 5e __ LDA T9 + 1 
5b65 : c5 6a __ CMP T15 + 1 
5b67 : d0 09 __ BNE $5b72 ; (draw_ball.s10 + 0)
.s7:
5b69 : a5 5d __ LDA T9 + 0 
5b6b : c5 69 __ CMP T15 + 0 
.s8:
5b6d : a9 00 __ LDA #$00
5b6f : 2a __ __ ROL
5b70 : 90 09 __ BCC $5b7b ; (draw_ball.s6 + 0)
.s10:
5b72 : 45 6a __ EOR T15 + 1 
5b74 : 10 f7 __ BPL $5b6d ; (draw_ball.s8 + 0)
.s9:
5b76 : a9 00 __ LDA #$00
5b78 : 2a __ __ ROL
5b79 : 49 01 __ EOR #$01
.s6:
5b7b : 85 6f __ STA T20 + 0 
5b7d : d0 03 __ BNE $5b82 ; (draw_ball.s32 + 0)
5b7f : 4c 81 5d JMP $5d81 ; (draw_ball.s11 + 0)
.s32:
5b82 : ad ec bf LDA $bfec ; (sstack + 2)
5b85 : 18 __ __ CLC
5b86 : 65 69 __ ADC T15 + 0 
5b88 : 85 6b __ STA T16 + 0 
5b8a : a5 69 __ LDA T15 + 0 
5b8c : 85 6d __ STA T17 + 0 
5b8e : a5 6a __ LDA T15 + 1 
5b90 : 85 6e __ STA T17 + 1 
5b92 : 6d ed bf ADC $bfed ; (sstack + 3)
5b95 : 85 6c __ STA T16 + 1 
5b97 : f0 03 __ BEQ $5b9c ; (draw_ball.l81 + 0)
5b99 : 4c 5a 5d JMP $5d5a ; (draw_ball.l50 + 0)
.l81:
5b9c : a5 6b __ LDA T16 + 0 
5b9e : c9 c8 __ CMP #$c8
5ba0 : b0 f7 __ BCS $5b99 ; (draw_ball.s32 + 23)
.s34:
5ba2 : a5 6d __ LDA T17 + 0 
5ba4 : 85 03 __ STA WORK + 0 
5ba6 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5ba8 : a5 6e __ LDA T17 + 1 
5baa : 85 04 __ STA WORK + 1 
5bac : 85 1c __ STA ACCU + 1 ; (cy + 1)
5bae : 20 00 74 JSR $7400 ; (mul16 + 0)
5bb1 : 38 __ __ SEC
5bb2 : a5 67 __ LDA T14 + 0 
5bb4 : e5 05 __ SBC WORK + 2 
5bb6 : 85 0d __ STA P0 
5bb8 : a5 68 __ LDA T14 + 1 
5bba : e5 06 __ SBC WORK + 3 
5bbc : 30 db __ BMI $5b99 ; (draw_ball.s32 + 23)
.s80:
5bbe : 85 0e __ STA P1 
5bc0 : 05 0d __ ORA P0 
5bc2 : f0 d5 __ BEQ $5b99 ; (draw_ball.s32 + 23)
.s35:
5bc4 : 20 54 5a JSR $5a54 ; (mc_isqrt.s4 + 0)
5bc7 : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5bc9 : 85 43 __ STA T0 + 0 
5bcb : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5bcd : 85 44 __ STA T0 + 1 
5bcf : a5 6e __ LDA T17 + 1 
5bd1 : c5 66 __ CMP T13 + 1 
5bd3 : d0 08 __ BNE $5bdd ; (draw_ball.s79 + 0)
.s76:
5bd5 : a5 6d __ LDA T17 + 0 
5bd7 : c5 65 __ CMP T13 + 0 
.s77:
5bd9 : 90 08 __ BCC $5be3 ; (draw_ball.s75 + 0)
5bdb : b0 1e __ BCS $5bfb ; (draw_ball.s36 + 0)
.s79:
5bdd : 45 66 __ EOR T13 + 1 
5bdf : 10 f8 __ BPL $5bd9 ; (draw_ball.s77 + 0)
.s78:
5be1 : 90 18 __ BCC $5bfb ; (draw_ball.s36 + 0)
.s75:
5be3 : a9 00 __ LDA #$00
.s41:
5be5 : 85 47 __ STA T18 + 0 
5be7 : ad ea bf LDA $bfea ; (sstack + 0)
5bea : 85 53 __ STA T3 + 0 
5bec : a9 00 __ LDA #$00
5bee : 85 51 __ STA T2 + 0 
5bf0 : ad eb bf LDA $bfeb ; (sstack + 1)
5bf3 : 85 54 __ STA T3 + 1 
5bf5 : ad ee bf LDA $bfee ; (sstack + 4)
5bf8 : 4c 47 5c JMP $5c47 ; (draw_ball.l86 + 0)
.s36:
5bfb : a5 6e __ LDA T17 + 1 
5bfd : c5 62 __ CMP T11 + 1 
5bff : d0 08 __ BNE $5c09 ; (draw_ball.s74 + 0)
.s71:
5c01 : a5 6d __ LDA T17 + 0 
5c03 : c5 61 __ CMP T11 + 0 
.s72:
5c05 : 90 08 __ BCC $5c0f ; (draw_ball.s70 + 0)
5c07 : b0 0a __ BCS $5c13 ; (draw_ball.s37 + 0)
.s74:
5c09 : 45 62 __ EOR T11 + 1 
5c0b : 10 f8 __ BPL $5c05 ; (draw_ball.s72 + 0)
.s73:
5c0d : 90 04 __ BCC $5c13 ; (draw_ball.s37 + 0)
.s70:
5c0f : a9 01 __ LDA #$01
5c11 : d0 d2 __ BNE $5be5 ; (draw_ball.s41 + 0)
.s37:
5c13 : 24 6e __ BIT T17 + 1 
5c15 : 10 04 __ BPL $5c1b ; (draw_ball.s38 + 0)
.s69:
5c17 : a9 02 __ LDA #$02
5c19 : d0 ca __ BNE $5be5 ; (draw_ball.s41 + 0)
.s38:
5c1b : 24 60 __ BIT T10 + 1 
5c1d : 30 10 __ BMI $5c2f ; (draw_ball.s39 + 0)
.s68:
5c1f : a5 6e __ LDA T17 + 1 
5c21 : c5 60 __ CMP T10 + 1 
5c23 : d0 04 __ BNE $5c29 ; (draw_ball.s67 + 0)
.s66:
5c25 : a5 6d __ LDA T17 + 0 
5c27 : c5 5f __ CMP T10 + 0 
.s67:
5c29 : b0 04 __ BCS $5c2f ; (draw_ball.s39 + 0)
.s65:
5c2b : a9 03 __ LDA #$03
5c2d : 90 b6 __ BCC $5be5 ; (draw_ball.s41 + 0)
.s39:
5c2f : 24 64 __ BIT T12 + 1 
5c31 : 30 10 __ BMI $5c43 ; (draw_ball.s40 + 0)
.s64:
5c33 : a5 6e __ LDA T17 + 1 
5c35 : c5 64 __ CMP T12 + 1 
5c37 : d0 04 __ BNE $5c3d ; (draw_ball.s63 + 0)
.s62:
5c39 : a5 6d __ LDA T17 + 0 
5c3b : c5 63 __ CMP T12 + 0 
.s63:
5c3d : b0 04 __ BCS $5c43 ; (draw_ball.s40 + 0)
.s61:
5c3f : a9 04 __ LDA #$04
5c41 : 90 a2 __ BCC $5be5 ; (draw_ball.s41 + 0)
.s40:
5c43 : a9 05 __ LDA #$05
5c45 : d0 9e __ BNE $5be5 ; (draw_ball.s41 + 0)
.l86:
5c47 : 85 4f __ STA T1 + 0 
5c49 : 18 __ __ CLC
5c4a : 69 10 __ ADC #$10
5c4c : 29 3f __ AND #$3f
5c4e : aa __ __ TAX
5c4f : bd 4b 7c LDA $7c4b,x ; (sin64[0] + 0)
5c52 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5c54 : 29 80 __ AND #$80
5c56 : 10 02 __ BPL $5c5a ; (draw_ball.l86 + 19)
5c58 : a9 ff __ LDA #$ff
5c5a : 85 1c __ STA ACCU + 1 ; (cy + 1)
5c5c : a5 43 __ LDA T0 + 0 
5c5e : 85 03 __ STA WORK + 0 
5c60 : a5 44 __ LDA T0 + 1 
5c62 : 85 04 __ STA WORK + 1 
5c64 : 20 00 74 JSR $7400 ; (mul16 + 0)
5c67 : 20 70 78 JSR $7870 ; (divs16@proxy + 0)
5c6a : 18 __ __ CLC
5c6b : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5c6d : 65 53 __ ADC T3 + 0 
5c6f : a6 51 __ LDX T2 + 0 
5c71 : e8 __ __ INX
5c72 : e8 __ __ INX
5c73 : 86 51 __ STX T2 + 0 
5c75 : 9d 8c 83 STA $838c,x ; (bitshift[0] + 54)
5c78 : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5c7a : 65 54 __ ADC T3 + 1 
5c7c : 9d 8d 83 STA $838d,x ; (bitshift[0] + 55)
5c7f : 18 __ __ CLC
5c80 : a5 4f __ LDA T1 + 0 
5c82 : 69 10 __ ADC #$10
5c84 : e0 08 __ CPX #$08
5c86 : d0 bf __ BNE $5c47 ; (draw_ball.l86 + 0)
.s42:
5c88 : a9 00 __ LDA #$00
5c8a : 85 4f __ STA T1 + 0 
.l43:
5c8c : a4 4f __ LDY T1 + 0 
5c8e : c8 __ __ INY
5c8f : 84 55 __ STY T4 + 0 
5c91 : 0a __ __ ASL
5c92 : 85 57 __ STA T5 + 0 
.l85:
5c94 : a5 55 __ LDA T4 + 0 
5c96 : 0a __ __ ASL
5c97 : 85 59 __ STA T6 + 0 
5c99 : aa __ __ TAX
5c9a : bd 8e 83 LDA $838e,x ; (mx[0] + 0)
5c9d : 85 5b __ STA T7 + 0 
5c9f : bd 8f 83 LDA $838f,x ; (mx[0] + 1)
5ca2 : 85 5c __ STA T7 + 1 
5ca4 : a6 57 __ LDX T5 + 0 
5ca6 : bd 8e 83 LDA $838e,x ; (mx[0] + 0)
5ca9 : 85 45 __ STA T8 + 0 
5cab : bd 8f 83 LDA $838f,x ; (mx[0] + 1)
5cae : 85 46 __ STA T8 + 1 
5cb0 : a5 5c __ LDA T7 + 1 
5cb2 : c5 46 __ CMP T8 + 1 
5cb4 : d0 08 __ BNE $5cbe ; (draw_ball.s60 + 0)
.s57:
5cb6 : a5 5b __ LDA T7 + 0 
5cb8 : c5 45 __ CMP T8 + 0 
.s58:
5cba : 90 08 __ BCC $5cc4 ; (draw_ball.s56 + 0)
5cbc : b0 1c __ BCS $5cda ; (draw_ball.s44 + 0)
.s60:
5cbe : 45 46 __ EOR T8 + 1 
5cc0 : 10 f8 __ BPL $5cba ; (draw_ball.s58 + 0)
.s59:
5cc2 : 90 16 __ BCC $5cda ; (draw_ball.s44 + 0)
.s56:
5cc4 : a5 5b __ LDA T7 + 0 
5cc6 : 9d 8e 83 STA $838e,x ; (mx[0] + 0)
5cc9 : a5 5c __ LDA T7 + 1 
5ccb : 9d 8f 83 STA $838f,x ; (mx[0] + 1)
5cce : a5 45 __ LDA T8 + 0 
5cd0 : a6 59 __ LDX T6 + 0 
5cd2 : 9d 8e 83 STA $838e,x ; (mx[0] + 0)
5cd5 : a5 46 __ LDA T8 + 1 
5cd7 : 9d 8f 83 STA $838f,x ; (mx[0] + 1)
.s44:
5cda : e6 55 __ INC T4 + 0 
5cdc : c8 __ __ INY
5cdd : c0 04 __ CPY #$04
5cdf : 90 b3 __ BCC $5c94 ; (draw_ball.l85 + 0)
.s45:
5ce1 : e6 4f __ INC T1 + 0 
5ce3 : a5 4f __ LDA T1 + 0 
5ce5 : c9 03 __ CMP #$03
5ce7 : d0 a3 __ BNE $5c8c ; (draw_ball.l43 + 0)
.s46:
5ce9 : a5 53 __ LDA T3 + 0 
5ceb : e5 43 __ SBC T0 + 0 
5ced : 85 4f __ STA T1 + 0 
5cef : a5 54 __ LDA T3 + 1 
5cf1 : e5 44 __ SBC T0 + 1 
5cf3 : 85 50 __ STA T1 + 1 
5cf5 : 18 __ __ CLC
5cf6 : a5 53 __ LDA T3 + 0 
5cf8 : 65 43 __ ADC T0 + 0 
5cfa : 85 51 __ STA T2 + 0 
5cfc : a5 54 __ LDA T3 + 1 
5cfe : 65 44 __ ADC T0 + 1 
5d00 : 85 52 __ STA T2 + 1 
5d02 : a5 47 __ LDA T18 + 0 
5d04 : 85 53 __ STA T3 + 0 
5d06 : a9 00 __ LDA #$00
5d08 : 85 57 __ STA T5 + 0 
5d0a : 85 55 __ STA T4 + 0 
5d0c : 85 13 __ STA P6 
5d0e : a5 6b __ LDA T16 + 0 
5d10 : 85 12 __ STA P5 
.l47:
5d12 : a5 4f __ LDA T1 + 0 
5d14 : 85 14 __ STA P7 
5d16 : a5 50 __ LDA T1 + 1 
5d18 : 85 15 __ STA P8 
5d1a : a5 57 __ LDA T5 + 0 
5d1c : c9 04 __ CMP #$04
5d1e : b0 0a __ BCS $5d2a ; (draw_ball.s48 + 0)
.s55:
5d20 : a4 55 __ LDY T4 + 0 
5d22 : b9 8f 83 LDA $838f,y ; (mx[0] + 1)
5d25 : be 8e 83 LDX $838e,y ; (mx[0] + 0)
5d28 : 90 04 __ BCC $5d2e ; (draw_ball.s49 + 0)
.s48:
5d2a : a5 52 __ LDA T2 + 1 
5d2c : a6 51 __ LDX T2 + 0 
.s49:
5d2e : 86 16 __ STX P9 
5d30 : 85 17 __ STA P10 
5d32 : 8a __ __ TXA
5d33 : 18 __ __ CLC
5d34 : 69 01 __ ADC #$01
5d36 : 85 4f __ STA T1 + 0 
5d38 : a5 17 __ LDA P10 
5d3a : 69 00 __ ADC #$00
5d3c : 85 50 __ STA T1 + 1 
5d3e : a5 53 __ LDA T3 + 0 
5d40 : 4a __ __ LSR
5d41 : a9 02 __ LDA #$02
5d43 : b0 02 __ BCS $5d47 ; (draw_ball.s96 + 0)
.s95:
5d45 : a9 01 __ LDA #$01
.s96:
5d47 : 85 18 __ STA P11 
5d49 : 20 09 5f JSR $5f09 ; (mc_hspan.s4 + 0)
5d4c : e6 53 __ INC T3 + 0 
5d4e : e6 55 __ INC T4 + 0 
5d50 : e6 55 __ INC T4 + 0 
5d52 : e6 57 __ INC T5 + 0 
5d54 : a5 57 __ LDA T5 + 0 
5d56 : c9 05 __ CMP #$05
5d58 : 90 b8 __ BCC $5d12 ; (draw_ball.l47 + 0)
.l50:
5d5a : e6 6b __ INC T16 + 0 
5d5c : d0 02 __ BNE $5d60 ; (draw_ball.s88 + 0)
.s87:
5d5e : e6 6c __ INC T16 + 1 
.s88:
5d60 : e6 6d __ INC T17 + 0 
5d62 : d0 02 __ BNE $5d66 ; (draw_ball.s90 + 0)
.s89:
5d64 : e6 6e __ INC T17 + 1 
.s90:
5d66 : a5 5e __ LDA T9 + 1 
5d68 : c5 6e __ CMP T17 + 1 
5d6a : d0 08 __ BNE $5d74 ; (draw_ball.s54 + 0)
.s51:
5d6c : a5 5d __ LDA T9 + 0 
5d6e : c5 6d __ CMP T17 + 0 
.s52:
5d70 : b0 08 __ BCS $5d7a ; (draw_ball.s33 + 0)
5d72 : 90 0d __ BCC $5d81 ; (draw_ball.s11 + 0)
.s54:
5d74 : 45 6e __ EOR T17 + 1 
5d76 : 10 f8 __ BPL $5d70 ; (draw_ball.s52 + 0)
.s53:
5d78 : b0 07 __ BCS $5d81 ; (draw_ball.s11 + 0)
.s33:
5d7a : a5 6c __ LDA T16 + 1 
5d7c : d0 dc __ BNE $5d5a ; (draw_ball.l50 + 0)
5d7e : 4c 9c 5b JMP $5b9c ; (draw_ball.l81 + 0)
.s11:
5d81 : a5 65 __ LDA T13 + 0 
5d83 : 8d e0 bf STA $bfe0 ; (lats[0] + 0)
5d86 : a5 66 __ LDA T13 + 1 
5d88 : 8d e1 bf STA $bfe1 ; (lats[0] + 1)
5d8b : a5 61 __ LDA T11 + 0 
5d8d : 8d e2 bf STA $bfe2 ; (lats[0] + 2)
5d90 : a5 62 __ LDA T11 + 1 
5d92 : 8d e3 bf STA $bfe3 ; (lats[0] + 3)
5d95 : a9 00 __ LDA #$00
5d97 : 8d e4 bf STA $bfe4 ; (lats[0] + 4)
5d9a : 8d e5 bf STA $bfe5 ; (lats[0] + 5)
5d9d : 85 53 __ STA T3 + 0 
5d9f : a6 5f __ LDX T10 + 0 
5da1 : 8e e6 bf STX $bfe6 ; (lats[0] + 6)
5da4 : a6 60 __ LDX T10 + 1 
5da6 : 8e e7 bf STX $bfe7 ; (lats[0] + 7)
5da9 : a6 63 __ LDX T12 + 0 
5dab : 8e e8 bf STX $bfe8 ; (lats[0] + 8)
5dae : a6 64 __ LDX T12 + 1 
5db0 : 8e e9 bf STX $bfe9 ; (lats[0] + 9)
5db3 : ae ec bf LDX $bfec ; (sstack + 2)
5db6 : 86 55 __ STX T4 + 0 
5db8 : ae ed bf LDX $bfed ; (sstack + 3)
5dbb : 86 56 __ STX T4 + 1 
.l12:
5dbd : 0a __ __ ASL
5dbe : a8 __ __ TAY
5dbf : b9 e0 bf LDA $bfe0,y ; (lats[0] + 0)
5dc2 : 18 __ __ CLC
5dc3 : 65 55 __ ADC T4 + 0 
5dc5 : 85 4f __ STA T1 + 0 
5dc7 : b9 e1 bf LDA $bfe1,y ; (lats[0] + 1)
5dca : 65 56 __ ADC T4 + 1 
5dcc : d0 58 __ BNE $5e26 ; (draw_ball.s15 + 0)
.s31:
5dce : a5 4f __ LDA T1 + 0 
5dd0 : c9 c8 __ CMP #$c8
5dd2 : b0 52 __ BCS $5e26 ; (draw_ball.s15 + 0)
.s13:
5dd4 : b9 e0 bf LDA $bfe0,y ; (lats[0] + 0)
5dd7 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5dd9 : 85 03 __ STA WORK + 0 
5ddb : b9 e1 bf LDA $bfe1,y ; (lats[0] + 1)
5dde : 85 1c __ STA ACCU + 1 ; (cy + 1)
5de0 : 85 04 __ STA WORK + 1 
5de2 : 20 00 74 JSR $7400 ; (mul16 + 0)
5de5 : 38 __ __ SEC
5de6 : a5 67 __ LDA T14 + 0 
5de8 : e5 05 __ SBC WORK + 2 
5dea : 85 0d __ STA P0 
5dec : a5 68 __ LDA T14 + 1 
5dee : e5 06 __ SBC WORK + 3 
5df0 : 30 34 __ BMI $5e26 ; (draw_ball.s15 + 0)
.s30:
5df2 : 85 0e __ STA P1 
5df4 : 05 0d __ ORA P0 
5df6 : f0 2e __ BEQ $5e26 ; (draw_ball.s15 + 0)
.s14:
5df8 : 20 54 5a JSR $5a54 ; (mc_isqrt.s4 + 0)
5dfb : a5 4f __ LDA T1 + 0 
5dfd : 85 12 __ STA P5 
5dff : a9 00 __ LDA #$00
5e01 : 85 13 __ STA P6 
5e03 : 85 18 __ STA P11 
5e05 : ad ea bf LDA $bfea ; (sstack + 0)
5e08 : 18 __ __ CLC
5e09 : 65 1b __ ADC ACCU + 0 ; (cy + 0)
5e0b : 85 16 __ STA P9 
5e0d : ad eb bf LDA $bfeb ; (sstack + 1)
5e10 : 65 1c __ ADC ACCU + 1 ; (cy + 1)
5e12 : 85 17 __ STA P10 
5e14 : ad ea bf LDA $bfea ; (sstack + 0)
5e17 : 38 __ __ SEC
5e18 : e5 1b __ SBC ACCU + 0 ; (cy + 0)
5e1a : 85 14 __ STA P7 
5e1c : ad eb bf LDA $bfeb ; (sstack + 1)
5e1f : e5 1c __ SBC ACCU + 1 ; (cy + 1)
5e21 : 85 15 __ STA P8 
5e23 : 20 09 5f JSR $5f09 ; (mc_hspan.s4 + 0)
.s15:
5e26 : e6 53 __ INC T3 + 0 
5e28 : a5 53 __ LDA T3 + 0 
5e2a : c9 05 __ CMP #$05
5e2c : d0 8f __ BNE $5dbd ; (draw_ball.l12 + 0)
.s16:
5e2e : a5 6f __ LDA T20 + 0 
5e30 : d0 0b __ BNE $5e3d ; (draw_ball.s17 + 0)
.s3:
5e32 : a2 1c __ LDX #$1c
5e34 : bd c3 bf LDA $bfc3,x ; (draw_ball@stack + 0)
5e37 : 95 53 __ STA T3 + 0,x 
5e39 : ca __ __ DEX
5e3a : 10 f8 __ BPL $5e34 ; (draw_ball.s3 + 2)
5e3c : 60 __ __ RTS
.s17:
5e3d : ad ee bf LDA $bfee ; (sstack + 4)
5e40 : 85 51 __ STA T2 + 0 
5e42 : a9 04 __ LDA #$04
5e44 : 85 5b __ STA T7 + 0 
.l18:
5e46 : 18 __ __ CLC
5e47 : a5 55 __ LDA T4 + 0 
5e49 : 65 69 __ ADC T15 + 0 
5e4b : 85 53 __ STA T3 + 0 
5e4d : a5 56 __ LDA T4 + 1 
5e4f : 65 6a __ ADC T15 + 1 
5e51 : 85 54 __ STA T3 + 1 
5e53 : a5 69 __ LDA T15 + 0 
5e55 : 85 57 __ STA T5 + 0 
5e57 : a5 6a __ LDA T15 + 1 
5e59 : 85 58 __ STA T5 + 1 
5e5b : 18 __ __ CLC
5e5c : a5 51 __ LDA T2 + 0 
5e5e : 69 10 __ ADC #$10
5e60 : 29 3f __ AND #$3f
5e62 : aa __ __ TAX
5e63 : bd 4b 7c LDA $7c4b,x ; (sin64[0] + 0)
5e66 : 85 59 __ STA T6 + 0 
5e68 : 29 80 __ AND #$80
5e6a : 10 02 __ BPL $5e6e ; (draw_ball.l18 + 40)
5e6c : a9 ff __ LDA #$ff
5e6e : 85 5a __ STA T6 + 1 
5e70 : a5 54 __ LDA T3 + 1 
5e72 : d0 5d __ BNE $5ed1 ; (draw_ball.l22 + 0)
.l29:
5e74 : a5 53 __ LDA T3 + 0 
5e76 : c9 c8 __ CMP #$c8
5e78 : b0 57 __ BCS $5ed1 ; (draw_ball.l22 + 0)
.s20:
5e7a : a5 57 __ LDA T5 + 0 
5e7c : 85 03 __ STA WORK + 0 
5e7e : 85 1b __ STA ACCU + 0 ; (cy + 0)
5e80 : a5 58 __ LDA T5 + 1 
5e82 : 85 04 __ STA WORK + 1 
5e84 : 85 1c __ STA ACCU + 1 ; (cy + 1)
5e86 : 20 00 74 JSR $7400 ; (mul16 + 0)
5e89 : 38 __ __ SEC
5e8a : a5 67 __ LDA T14 + 0 
5e8c : e5 05 __ SBC WORK + 2 
5e8e : 85 0d __ STA P0 
5e90 : a5 68 __ LDA T14 + 1 
5e92 : e5 06 __ SBC WORK + 3 
5e94 : 30 3b __ BMI $5ed1 ; (draw_ball.l22 + 0)
.s28:
5e96 : 85 0e __ STA P1 
5e98 : 05 0d __ ORA P0 
5e9a : f0 35 __ BEQ $5ed1 ; (draw_ball.l22 + 0)
.s21:
5e9c : 20 54 5a JSR $5a54 ; (mc_isqrt.s4 + 0)
5e9f : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5ea1 : 85 03 __ STA WORK + 0 
5ea3 : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5ea5 : 85 04 __ STA WORK + 1 
5ea7 : a5 53 __ LDA T3 + 0 
5ea9 : 85 0f __ STA P2 
5eab : a9 00 __ LDA #$00
5ead : 85 10 __ STA P3 
5eaf : 85 11 __ STA P4 
5eb1 : a5 59 __ LDA T6 + 0 
5eb3 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5eb5 : a5 5a __ LDA T6 + 1 
5eb7 : 85 1c __ STA ACCU + 1 ; (cy + 1)
5eb9 : 20 00 74 JSR $7400 ; (mul16 + 0)
5ebc : 20 70 78 JSR $7870 ; (divs16@proxy + 0)
5ebf : ad ea bf LDA $bfea ; (sstack + 0)
5ec2 : 18 __ __ CLC
5ec3 : 65 1b __ ADC ACCU + 0 ; (cy + 0)
5ec5 : 85 0d __ STA P0 
5ec7 : ad eb bf LDA $bfeb ; (sstack + 1)
5eca : 65 1c __ ADC ACCU + 1 ; (cy + 1)
5ecc : 85 0e __ STA P1 
5ece : 20 b2 58 JSR $58b2 ; (mc_setpix.s4 + 0)
.l22:
5ed1 : e6 53 __ INC T3 + 0 
5ed3 : d0 02 __ BNE $5ed7 ; (draw_ball.s92 + 0)
.s91:
5ed5 : e6 54 __ INC T3 + 1 
.s92:
5ed7 : e6 57 __ INC T5 + 0 
5ed9 : d0 02 __ BNE $5edd ; (draw_ball.s94 + 0)
.s93:
5edb : e6 58 __ INC T5 + 1 
.s94:
5edd : a5 5e __ LDA T9 + 1 
5edf : c5 58 __ CMP T5 + 1 
5ee1 : d0 08 __ BNE $5eeb ; (draw_ball.s27 + 0)
.s24:
5ee3 : a5 5d __ LDA T9 + 0 
5ee5 : c5 57 __ CMP T5 + 0 
.s25:
5ee7 : 90 08 __ BCC $5ef1 ; (draw_ball.s23 + 0)
5ee9 : b0 17 __ BCS $5f02 ; (draw_ball.s19 + 0)
.s27:
5eeb : 45 58 __ EOR T5 + 1 
5eed : 10 f8 __ BPL $5ee7 ; (draw_ball.s25 + 0)
.s26:
5eef : 90 11 __ BCC $5f02 ; (draw_ball.s19 + 0)
.s23:
5ef1 : 18 __ __ CLC
5ef2 : a5 51 __ LDA T2 + 0 
5ef4 : 69 10 __ ADC #$10
5ef6 : 85 51 __ STA T2 + 0 
5ef8 : c6 5b __ DEC T7 + 0 
5efa : f0 03 __ BEQ $5eff ; (draw_ball.s23 + 14)
5efc : 4c 46 5e JMP $5e46 ; (draw_ball.l18 + 0)
5eff : 4c 32 5e JMP $5e32 ; (draw_ball.s3 + 0)
.s19:
5f02 : a5 54 __ LDA T3 + 1 
5f04 : d0 cb __ BNE $5ed1 ; (draw_ball.l22 + 0)
5f06 : 4c 74 5e JMP $5e74 ; (draw_ball.l29 + 0)
--------------------------------------------------------------------
mc_hspan: ; mc_hspan(i16,i16,i16,u8)->void
;  65, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5f09 : a5 13 __ LDA P6 ; (my + 1)
5f0b : f0 01 __ BEQ $5f0e ; (mc_hspan.s39 + 0)
5f0d : 60 __ __ RTS
.s39:
5f0e : a5 12 __ LDA P5 ; (my + 0)
5f10 : c9 c8 __ CMP #$c8
5f12 : 90 01 __ BCC $5f15 ; (mc_hspan.s5 + 0)
5f14 : 60 __ __ RTS
.s5:
5f15 : 24 15 __ BIT P8 ; (x0 + 1)
5f17 : 10 08 __ BPL $5f21 ; (mc_hspan.s49 + 0)
.s38:
5f19 : a9 00 __ LDA #$00
5f1b : 85 14 __ STA P7 ; (x0 + 0)
5f1d : 85 15 __ STA P8 ; (x0 + 1)
5f1f : 90 02 __ BCC $5f23 ; (mc_hspan.s6 + 0)
.s49:
5f21 : a5 14 __ LDA P7 ; (x0 + 0)
.s6:
5f23 : 85 46 __ STA T4 + 0 
5f25 : a6 15 __ LDX P8 ; (x0 + 1)
5f27 : a5 17 __ LDA P10 ; (x1 + 1)
5f29 : 10 01 __ BPL $5f2c ; (mc_hspan.s37 + 0)
5f2b : 60 __ __ RTS
.s37:
5f2c : 86 47 __ STX T4 + 1 
5f2e : d0 09 __ BNE $5f39 ; (mc_hspan.s34 + 0)
.s36:
5f30 : a5 16 __ LDA P9 ; (x1 + 0)
5f32 : c9 a0 __ CMP #$a0
5f34 : b0 03 __ BCS $5f39 ; (mc_hspan.s34 + 0)
5f36 : 4c a1 60 JMP $60a1 ; (mc_hspan.s7 + 0)
.s34:
5f39 : a9 9f __ LDA #$9f
5f3b : 85 16 __ STA P9 ; (x1 + 0)
5f3d : a9 00 __ LDA #$00
5f3f : 85 17 __ STA P10 ; (x1 + 1)
5f41 : 8a __ __ TXA
5f42 : f0 01 __ BEQ $5f45 ; (mc_hspan.s35 + 0)
5f44 : 60 __ __ RTS
.s35:
5f45 : a5 14 __ LDA P7 ; (x0 + 0)
5f47 : c9 a0 __ CMP #$a0
5f49 : 90 01 __ BCC $5f4c ; (mc_hspan.s8 + 0)
5f4b : 60 __ __ RTS
.s8:
5f4c : a5 16 __ LDA P9 ; (x1 + 0)
5f4e : 85 4a __ STA T6 + 0 
5f50 : 85 48 __ STA T5 + 0 
5f52 : a5 14 __ LDA P7 ; (x0 + 0)
5f54 : 4a __ __ LSR
5f55 : 4a __ __ LSR
5f56 : 85 4c __ STA T7 + 0 
5f58 : a5 17 __ LDA P10 ; (x1 + 1)
5f5a : 85 49 __ STA T5 + 1 
5f5c : 4a __ __ LSR
5f5d : 66 4a __ ROR T6 + 0 
5f5f : 4a __ __ LSR
5f60 : 66 4a __ ROR T6 + 0 
5f62 : 49 20 __ EOR #$20
5f64 : 38 __ __ SEC
5f65 : e9 20 __ SBC #$20
5f67 : 85 4b __ STA T6 + 1 
5f69 : d0 09 __ BNE $5f74 ; (mc_hspan.s9 + 0)
.s31:
5f6b : a5 4c __ LDA T7 + 0 
5f6d : c5 4a __ CMP T6 + 0 
5f6f : d0 03 __ BNE $5f74 ; (mc_hspan.s9 + 0)
5f71 : 4c 72 60 JMP $6072 ; (mc_hspan.s26 + 0)
.s9:
5f74 : a5 12 __ LDA P5 ; (my + 0)
5f76 : 85 0f __ STA P2 
5f78 : 29 07 __ AND #$07
5f7a : 85 1b __ STA ACCU + 0 
5f7c : a5 12 __ LDA P5 ; (my + 0)
5f7e : 4a __ __ LSR
5f7f : 4a __ __ LSR
5f80 : 4a __ __ LSR
5f81 : 85 43 __ STA T1 + 0 
5f83 : 0a __ __ ASL
5f84 : 0a __ __ ASL
5f85 : 65 43 __ ADC T1 + 0 
5f87 : 4a __ __ LSR
5f88 : 6a __ __ ROR
5f89 : aa __ __ TAX
5f8a : 29 80 __ AND #$80
5f8c : 6a __ __ ROR
5f8d : 05 1b __ ORA ACCU + 0 
5f8f : 85 4d __ STA T8 + 0 
5f91 : 8a __ __ TXA
5f92 : 29 3f __ AND #$3f
5f94 : 69 e0 __ ADC #$e0
5f96 : 85 4e __ STA T8 + 1 
5f98 : a5 18 __ LDA P11 ; (col + 0)
5f9a : 85 1c __ STA ACCU + 1 
5f9c : 0a __ __ ASL
5f9d : 0a __ __ ASL
5f9e : 05 18 __ ORA P11 ; (col + 0)
5fa0 : 85 43 __ STA T1 + 0 
5fa2 : a5 18 __ LDA P11 ; (col + 0)
5fa4 : 0a __ __ ASL
5fa5 : 0a __ __ ASL
5fa6 : 0a __ __ ASL
5fa7 : 0a __ __ ASL
5fa8 : 05 43 __ ORA T1 + 0 
5faa : 85 43 __ STA T1 + 0 
5fac : a9 00 __ LDA #$00
5fae : 85 10 __ STA P3 
5fb0 : 46 1c __ LSR ACCU + 1 
5fb2 : 6a __ __ ROR
5fb3 : 66 1c __ ROR ACCU + 1 
5fb5 : 6a __ __ ROR
5fb6 : 05 43 __ ORA T1 + 0 
5fb8 : 85 45 __ STA T2 + 0 
.l10:
5fba : 20 a6 58 JSR $58a6 ; (mc_setpix@proxy + 0)
5fbd : 18 __ __ CLC
5fbe : a5 0d __ LDA P0 
5fc0 : 69 01 __ ADC #$01
5fc2 : 85 46 __ STA T4 + 0 
5fc4 : 85 1b __ STA ACCU + 0 
5fc6 : a5 0e __ LDA P1 
5fc8 : 69 00 __ ADC #$00
5fca : 85 47 __ STA T4 + 1 
5fcc : 4a __ __ LSR
5fcd : 66 1b __ ROR ACCU + 0 
5fcf : 4a __ __ LSR
5fd0 : 66 1b __ ROR ACCU + 0 
5fd2 : 49 20 __ EOR #$20
5fd4 : c9 20 __ CMP #$20
5fd6 : d0 06 __ BNE $5fde ; (mc_hspan.s11 + 0)
.s25:
5fd8 : a5 1b __ LDA ACCU + 0 
5fda : c5 4c __ CMP T7 + 0 
5fdc : f0 dc __ BEQ $5fba ; (mc_hspan.l10 + 0)
.s11:
5fde : a9 00 __ LDA #$00
5fe0 : 85 1c __ STA ACCU + 1 
5fe2 : a6 4c __ LDX T7 + 0 
5fe4 : e8 __ __ INX
5fe5 : a5 4b __ LDA T6 + 1 
5fe7 : 30 43 __ BMI $602c ; (mc_hspan.s12 + 0)
.s24:
5fe9 : f0 04 __ BEQ $5fef ; (mc_hspan.s23 + 0)
.s40:
5feb : 8a __ __ TXA
5fec : 4c f4 5f JMP $5ff4 ; (mc_hspan.s19 + 0)
.s23:
5fef : 8a __ __ TXA
5ff0 : e4 4a __ CPX T6 + 0 
5ff2 : b0 38 __ BCS $602c ; (mc_hspan.s12 + 0)
.s19:
5ff4 : 0a __ __ ASL
5ff5 : 0a __ __ ASL
5ff6 : 0a __ __ ASL
5ff7 : a0 00 __ LDY #$00
5ff9 : 90 02 __ BCC $5ffd ; (mc_hspan.s42 + 0)
.s41:
5ffb : c8 __ __ INY
5ffc : 18 __ __ CLC
.s42:
5ffd : 65 4d __ ADC T8 + 0 
5fff : 85 43 __ STA T1 + 0 
6001 : 98 __ __ TYA
6002 : 65 4e __ ADC T8 + 1 
6004 : 85 44 __ STA T1 + 1 
.l20:
6006 : a5 45 __ LDA T2 + 0 
6008 : a0 00 __ LDY #$00
600a : 91 43 __ STA (T1 + 0),y 
600c : 24 4b __ BIT T6 + 1 
600e : 30 1c __ BMI $602c ; (mc_hspan.s12 + 0)
.s22:
6010 : e8 __ __ INX
6011 : d0 02 __ BNE $6015 ; (mc_hspan.s44 + 0)
.s43:
6013 : e6 1c __ INC ACCU + 1 
.s44:
6015 : 18 __ __ CLC
6016 : a5 43 __ LDA T1 + 0 
6018 : 69 08 __ ADC #$08
601a : 85 43 __ STA T1 + 0 
601c : 90 02 __ BCC $6020 ; (mc_hspan.s46 + 0)
.s45:
601e : e6 44 __ INC T1 + 1 
.s46:
6020 : a5 1c __ LDA ACCU + 1 
6022 : c5 4b __ CMP T6 + 1 
6024 : 90 e0 __ BCC $6006 ; (mc_hspan.l20 + 0)
.s48:
6026 : d0 04 __ BNE $602c ; (mc_hspan.s12 + 0)
.s21:
6028 : e4 4a __ CPX T6 + 0 
602a : 90 da __ BCC $6006 ; (mc_hspan.l20 + 0)
.s12:
602c : 06 4a __ ASL T6 + 0 
602e : 26 4b __ ROL T6 + 1 
6030 : 06 4a __ ASL T6 + 0 
6032 : 26 4b __ ROL T6 + 1 
6034 : a9 00 __ LDA #$00
6036 : 85 10 __ STA P3 
6038 : f0 20 __ BEQ $605a ; (mc_hspan.l13 + 0)
.s14:
603a : a5 4a __ LDA T6 + 0 
603c : 85 0d __ STA P0 
603e : a5 4b __ LDA T6 + 1 
6040 : 85 0e __ STA P1 
6042 : a5 12 __ LDA P5 ; (my + 0)
6044 : 85 0f __ STA P2 
6046 : a5 18 __ LDA P11 ; (col + 0)
6048 : 85 11 __ STA P4 
604a : 20 b2 58 JSR $58b2 ; (mc_setpix.s4 + 0)
604d : 18 __ __ CLC
604e : a5 0d __ LDA P0 
6050 : 69 01 __ ADC #$01
6052 : 85 4a __ STA T6 + 0 
6054 : a5 0e __ LDA P1 
6056 : 69 00 __ ADC #$00
6058 : 85 4b __ STA T6 + 1 
.l13:
605a : a5 49 __ LDA T5 + 1 
605c : c5 4b __ CMP T6 + 1 
605e : d0 07 __ BNE $6067 ; (mc_hspan.s18 + 0)
.s15:
6060 : a5 48 __ LDA T5 + 0 
6062 : c5 4a __ CMP T6 + 0 
6064 : 4c 6b 60 JMP $606b ; (mc_hspan.s16 + 0)
.s18:
6067 : 45 4b __ EOR T6 + 1 
6069 : 30 03 __ BMI $606e ; (mc_hspan.s17 + 0)
.s16:
606b : b0 cd __ BCS $603a ; (mc_hspan.s14 + 0)
.s3:
606d : 60 __ __ RTS
.s17:
606e : b0 fd __ BCS $606d ; (mc_hspan.s3 + 0)
6070 : 90 c8 __ BCC $603a ; (mc_hspan.s14 + 0)
.s26:
6072 : a5 17 __ LDA P10 ; (x1 + 1)
6074 : c5 15 __ CMP P8 ; (x0 + 1)
6076 : d0 04 __ BNE $607c ; (mc_hspan.l47 + 0)
.s28:
6078 : a5 48 __ LDA T5 + 0 
607a : c5 46 __ CMP T4 + 0 
.l47:
607c : 90 ef __ BCC $606d ; (mc_hspan.s3 + 0)
.s50:
607e : a9 00 __ LDA #$00
6080 : 85 10 __ STA P3 
6082 : a5 12 __ LDA P5 ; (my + 0)
6084 : 85 0f __ STA P2 
.l27:
6086 : 20 a6 58 JSR $58a6 ; (mc_setpix@proxy + 0)
6089 : 18 __ __ CLC
608a : a5 0d __ LDA P0 
608c : 69 01 __ ADC #$01
608e : 85 46 __ STA T4 + 0 
6090 : a5 0e __ LDA P1 
6092 : 69 00 __ ADC #$00
6094 : 85 47 __ STA T4 + 1 
6096 : a5 49 __ LDA T5 + 1 
6098 : 30 d3 __ BMI $606d ; (mc_hspan.s3 + 0)
.s30:
609a : c5 47 __ CMP T4 + 1 
609c : f0 da __ BEQ $6078 ; (mc_hspan.s28 + 0)
.s29:
609e : b0 e6 __ BCS $6086 ; (mc_hspan.l27 + 0)
60a0 : 60 __ __ RTS
.s7:
60a1 : a5 17 __ LDA P10 ; (x1 + 1)
60a3 : c5 15 __ CMP P8 ; (x0 + 1)
60a5 : d0 04 __ BNE $60ab ; (mc_hspan.s33 + 0)
.s32:
60a7 : a5 16 __ LDA P9 ; (x1 + 0)
60a9 : c5 14 __ CMP P7 ; (x0 + 0)
.s33:
60ab : 90 c0 __ BCC $606d ; (mc_hspan.s3 + 0)
60ad : 4c 4c 5f JMP $5f4c ; (mc_hspan.s8 + 0)
--------------------------------------------------------------------
vectors_run: ; vectors_run()->void
;   3, "/home/xahmol/git/UltimateDemo2026/src/vectors.h"
.s1:
60b0 : a2 04 __ LDX #$04
60b2 : b5 53 __ LDA T3 + 0,x 
60b4 : 9d c6 bf STA $bfc6,x ; (vectors_run@stack + 0)
60b7 : ca __ __ DEX
60b8 : 10 f8 __ BPL $60b2 ; (vectors_run.s1 + 2)
.s4:
60ba : 20 83 61 JSR $6183 ; (vec_init.s4 + 0)
60bd : a9 00 __ LDA #$00
60bf : 85 53 __ STA T3 + 0 
60c1 : 85 54 __ STA T4 + 0 
60c3 : a9 a8 __ LDA #$a8
60c5 : 85 55 __ STA T5 + 0 
60c7 : a9 fd __ LDA #$fd
60c9 : 85 56 __ STA T5 + 1 
.l5:
60cb : 2c 11 d0 BIT $d011 
60ce : 30 fb __ BMI $60cb ; (vectors_run.l5 + 0)
.l6:
60d0 : 2c 11 d0 BIT $d011 
60d3 : 10 fb __ BPL $60d0 ; (vectors_run.l6 + 0)
.s7:
60d5 : a9 00 __ LDA #$00
60d7 : 85 57 __ STA T6 + 0 
60d9 : 85 0f __ STA P2 
60db : 85 10 __ STA P3 
60dd : 85 0d __ STA P0 
60df : 20 4b 78 JSR $784b ; (memset@proxy + 0)
60e2 : e6 53 __ INC T3 + 0 
60e4 : a5 53 __ LDA T3 + 0 
60e6 : 85 0d __ STA P0 
60e8 : a6 54 __ LDX T4 + 0 
60ea : e8 __ __ INX
60eb : e8 __ __ INX
60ec : 86 54 __ STX T4 + 0 
60ee : 86 0e __ STX P1 
60f0 : 20 f0 61 JSR $61f0 ; (project.s1 + 0)
.l8:
60f3 : a9 96 __ LDA #$96
60f5 : 8d ea bf STA $bfea ; (sstack + 0)
60f8 : a9 83 __ LDA #$83
60fa : 8d eb bf STA $bfeb ; (sstack + 1)
60fd : a9 f3 __ LDA #$f3
60ff : 8d ec bf STA $bfec ; (sstack + 2)
6102 : a9 7c __ LDA #$7c
6104 : 8d ed bf STA $bfed ; (sstack + 3)
6107 : a9 00 __ LDA #$00
6109 : 8d f6 bf STA $bff6 ; (sstack + 12)
610c : a4 57 __ LDY T6 + 0 
610e : b9 56 7f LDA $7f56,y ; (cube_e[0][0] + 0)
6111 : 0a __ __ ASL
6112 : aa __ __ TAX
6113 : bd ae 83 LDA $83ae,x ; (px_cur[0] + 0)
6116 : 8d ee bf STA $bfee ; (sstack + 4)
6119 : bd af 83 LDA $83af,x ; (px_cur[0] + 1)
611c : 8d ef bf STA $bfef ; (sstack + 5)
611f : bd 9e 83 LDA $839e,x ; (py_cur[0] + 0)
6122 : 8d f0 bf STA $bff0 ; (sstack + 6)
6125 : bd 9f 83 LDA $839f,x ; (py_cur[0] + 1)
6128 : 8d f1 bf STA $bff1 ; (sstack + 7)
612b : b9 57 7f LDA $7f57,y ; (cube_e[0][0] + 1)
612e : 0a __ __ ASL
612f : aa __ __ TAX
6130 : bd ae 83 LDA $83ae,x ; (px_cur[0] + 0)
6133 : 8d f2 bf STA $bff2 ; (sstack + 8)
6136 : bd af 83 LDA $83af,x ; (px_cur[0] + 1)
6139 : 8d f3 bf STA $bff3 ; (sstack + 9)
613c : bd 9e 83 LDA $839e,x ; (py_cur[0] + 0)
613f : 8d f4 bf STA $bff4 ; (sstack + 10)
6142 : bd 9f 83 LDA $839f,x ; (py_cur[0] + 1)
6145 : 8d f5 bf STA $bff5 ; (sstack + 11)
6148 : 20 8e 34 JSR $348e ; (bm_line.s1 + 0)
614b : 18 __ __ CLC
614c : a5 57 __ LDA T6 + 0 
614e : 69 02 __ ADC #$02
6150 : 85 57 __ STA T6 + 0 
6152 : c9 18 __ CMP #$18
6154 : d0 9d __ BNE $60f3 ; (vectors_run.l8 + 0)
.s9:
6156 : e6 55 __ INC T5 + 0 
6158 : f0 03 __ BEQ $615d ; (vectors_run.s11 + 0)
615a : 4c cb 60 JMP $60cb ; (vectors_run.l5 + 0)
.s11:
615d : e6 56 __ INC T5 + 1 
615f : d0 f9 __ BNE $615a ; (vectors_run.s9 + 4)
.s10:
6161 : a9 00 __ LDA #$00
6163 : 85 0d __ STA P0 
6165 : 85 0e __ STA P1 
6167 : 85 10 __ STA P3 
6169 : a9 36 __ LDA #$36
616b : 85 01 __ STA $01 
616d : 20 0e 0f JSR $0f0e ; (vic_setmode@proxy + 0)
6170 : a9 00 __ LDA #$00
6172 : 8d 20 d0 STA $d020 
6175 : 8d 21 d0 STA $d021 
.s3:
6178 : a2 04 __ LDX #$04
617a : bd c6 bf LDA $bfc6,x ; (vectors_run@stack + 0)
617d : 95 53 __ STA T3 + 0,x 
617f : ca __ __ DEX
6180 : 10 f8 __ BPL $617a ; (vectors_run.s3 + 2)
6182 : 60 __ __ RTS
--------------------------------------------------------------------
vec_init: ; vec_init()->void
; 116, "/home/xahmol/git/UltimateDemo2026/src/vectors.c"
.s4:
6183 : 78 __ __ SEI
6184 : a9 00 __ LDA #$00
6186 : 85 0f __ STA P2 
6188 : 85 10 __ STA P3 
618a : a9 30 __ LDA #$30
618c : 85 01 __ STA $01 
618e : a9 40 __ LDA #$40
6190 : 85 11 __ STA P4 
6192 : a9 1f __ LDA #$1f
6194 : 85 12 __ STA P5 
6196 : a9 10 __ LDA #$10
6198 : a2 fa __ LDX #$fa
.l6:
619a : ca __ __ DEX
619b : 9d 00 d0 STA $d000,x 
619e : 9d fa d0 STA $d0fa,x 
61a1 : 9d f4 d1 STA $d1f4,x 
61a4 : 9d ee d2 STA $d2ee,x 
61a7 : d0 f1 __ BNE $619a ; (vec_init.l6 + 0)
.s5:
61a9 : a9 00 __ LDA #$00
61ab : 85 43 __ STA T1 + 0 
61ad : 85 0d __ STA P0 
61af : a9 e0 __ LDA #$e0
61b1 : 85 44 __ STA T1 + 1 
61b3 : 85 0e __ STA P1 
61b5 : 20 f2 20 JSR $20f2 ; (memset.s4 + 0)
61b8 : a9 35 __ LDA #$35
61ba : 85 01 __ STA $01 
61bc : 20 0e 21 JSR $210e ; (mmap_trampoline.s4 + 0)
61bf : 58 __ __ CLI
61c0 : 20 ba 78 JSR $78ba ; (vic_setmode@proxy + 0)
61c3 : a5 10 __ LDA P3 
61c5 : 8d 96 83 STA $8396 ; (VScreen.data + 0)
61c8 : a5 11 __ LDA P4 
61ca : 8d 97 83 STA $8397 ; (VScreen.data + 1)
61cd : a9 28 __ LDA #$28
61cf : 8d 9a 83 STA $839a ; (VScreen.cwidth + 0)
61d2 : a9 19 __ LDA #$19
61d4 : 8d 9b 83 STA $839b ; (VScreen.cheight + 0)
61d7 : a9 40 __ LDA #$40
61d9 : 8d 9c 83 STA $839c ; (VScreen.width + 0)
61dc : a9 01 __ LDA #$01
61de : 8d 9d 83 STA $839d ; (VScreen.width + 1)
61e1 : a9 00 __ LDA #$00
61e3 : 8d 20 d0 STA $d020 
61e6 : 8d 21 d0 STA $d021 
61e9 : 8d 98 83 STA $8398 ; (VScreen.rdata + 0)
61ec : 8d 99 83 STA $8399 ; (VScreen.rdata + 1)
.s3:
61ef : 60 __ __ RTS
--------------------------------------------------------------------
project: ; project(u8,u8,i16*,i16*)->void
;  81, "/home/xahmol/git/UltimateDemo2026/src/vectors.c"
.s1:
61f0 : a2 0e __ LDX #$0e
61f2 : b5 53 __ LDA T4 + 0,x 
61f4 : 9d d2 bf STA $bfd2,x ; (project@stack + 0)
61f7 : ca __ __ DEX
61f8 : 10 f8 __ BPL $61f2 ; (project.s1 + 2)
.s4:
61fa : a5 0d __ LDA P0 ; (ax + 0)
61fc : 0a __ __ ASL
61fd : 85 47 __ STA T1 + 0 
61ff : a9 7d __ LDA #$7d
6201 : 69 00 __ ADC #$00
6203 : 85 5a __ STA T7 + 1 
6205 : 18 __ __ CLC
6206 : a5 0e __ LDA P1 ; (ay + 0)
6208 : 69 40 __ ADC #$40
620a : 0a __ __ ASL
620b : 85 4b __ STA T2 + 0 
620d : a9 00 __ LDA #$00
620f : 85 48 __ STA T1 + 1 
6211 : 2a __ __ ROL
6212 : aa __ __ TAX
6213 : a9 56 __ LDA #$56
6215 : 85 59 __ STA T7 + 0 
6217 : 65 4b __ ADC T2 + 0 
6219 : 85 5b __ STA T8 + 0 
621b : 8a __ __ TXA
621c : 69 7d __ ADC #$7d
621e : 85 5c __ STA T8 + 1 
6220 : 06 0e __ ASL P1 ; (ay + 0)
6222 : 26 48 __ ROL T1 + 1 
6224 : 18 __ __ CLC
6225 : a9 56 __ LDA #$56
6227 : 65 0e __ ADC P1 ; (ay + 0)
6229 : 85 5d __ STA T9 + 0 
622b : a9 7d __ LDA #$7d
622d : 65 48 __ ADC T1 + 1 
622f : 85 5e __ STA T9 + 1 
6231 : 18 __ __ CLC
6232 : a5 0d __ LDA P0 ; (ax + 0)
6234 : 69 40 __ ADC #$40
6236 : 0a __ __ ASL
6237 : a2 00 __ LDX #$00
6239 : 90 02 __ BCC $623d ; (project.s11 + 0)
.s10:
623b : e8 __ __ INX
623c : 18 __ __ CLC
.s11:
623d : 69 56 __ ADC #$56
623f : 85 5f __ STA T10 + 0 
6241 : 8a __ __ TXA
6242 : 69 7d __ ADC #$7d
6244 : 85 60 __ STA T10 + 1 
6246 : a9 00 __ LDA #$00
6248 : 85 52 __ STA T11 + 0 
.l5:
624a : 85 61 __ STA T12 + 0 
624c : aa __ __ TAX
624d : bd 3e 7d LDA $7d3e,x ; (cube_v[0][0] + 0)
6250 : 29 80 __ AND #$80
6252 : 10 02 __ BPL $6256 ; (project.l5 + 12)
6254 : a9 ff __ LDA #$ff
6256 : 85 04 __ STA WORK + 1 
6258 : 85 44 __ STA T0 + 1 
625a : bd 3e 7d LDA $7d3e,x ; (cube_v[0][0] + 0)
625d : 0a __ __ ASL
625e : 0a __ __ ASL
625f : 18 __ __ CLC
6260 : 7d 3e 7d ADC $7d3e,x ; (cube_v[0][0] + 0)
6263 : 0a __ __ ASL
6264 : 0a __ __ ASL
6265 : 0a __ __ ASL
6266 : 0a __ __ ASL
6267 : 85 43 __ STA T0 + 0 
6269 : 85 03 __ STA WORK + 0 
626b : a5 04 __ LDA WORK + 1 
626d : 29 80 __ AND #$80
626f : 10 02 __ BPL $6273 ; (project.l5 + 41)
6271 : a9 ff __ LDA #$ff
6273 : 85 45 __ STA T0 + 2 
6275 : 85 06 __ STA WORK + 3 
6277 : 85 05 __ STA WORK + 2 
6279 : a0 00 __ LDY #$00
627b : b1 5b __ LDA (T8 + 0),y 
627d : 85 0e __ STA P1 ; (ay + 0)
627f : 85 1b __ STA ACCU + 0 
6281 : c8 __ __ INY
6282 : b1 5b __ LDA (T8 + 0),y 
6284 : 85 48 __ STA T1 + 1 
6286 : 85 1c __ STA ACCU + 1 
6288 : 29 80 __ AND #$80
628a : 10 02 __ BPL $628e ; (project.l5 + 68)
628c : a9 ff __ LDA #$ff
628e : 85 49 __ STA T1 + 2 
6290 : 85 1d __ STA ACCU + 2 
6292 : 85 1e __ STA ACCU + 3 
6294 : 20 06 75 JSR $7506 ; (mul32 + 0)
6297 : a5 07 __ LDA WORK + 4 
6299 : 85 4b __ STA T2 + 0 
629b : a5 08 __ LDA WORK + 5 
629d : 85 4c __ STA T2 + 1 
629f : a5 09 __ LDA WORK + 6 
62a1 : 85 4d __ STA T2 + 2 
62a3 : a5 0a __ LDA WORK + 7 
62a5 : 85 4e __ STA T2 + 3 
62a7 : a0 00 __ LDY #$00
62a9 : b1 5d __ LDA (T9 + 0),y 
62ab : 85 4f __ STA T3 + 0 
62ad : 85 03 __ STA WORK + 0 
62af : c8 __ __ INY
62b0 : b1 5d __ LDA (T9 + 0),y 
62b2 : 85 50 __ STA T3 + 1 
62b4 : 85 04 __ STA WORK + 1 
62b6 : 29 80 __ AND #$80
62b8 : 10 02 __ BPL $62bc ; (project.l5 + 114)
62ba : a9 ff __ LDA #$ff
62bc : 85 51 __ STA T3 + 2 
62be : 85 06 __ STA WORK + 3 
62c0 : 85 05 __ STA WORK + 2 
62c2 : a6 61 __ LDX T12 + 0 
62c4 : bd 40 7d LDA $7d40,x ; (cube_v[0][0] + 2)
62c7 : 29 80 __ AND #$80
62c9 : 10 02 __ BPL $62cd ; (project.l5 + 131)
62cb : a9 ff __ LDA #$ff
62cd : 85 1c __ STA ACCU + 1 
62cf : 85 54 __ STA T4 + 1 
62d1 : bd 40 7d LDA $7d40,x ; (cube_v[0][0] + 2)
62d4 : 0a __ __ ASL
62d5 : 0a __ __ ASL
62d6 : 18 __ __ CLC
62d7 : 7d 40 7d ADC $7d40,x ; (cube_v[0][0] + 2)
62da : 0a __ __ ASL
62db : 0a __ __ ASL
62dc : 0a __ __ ASL
62dd : 0a __ __ ASL
62de : 85 53 __ STA T4 + 0 
62e0 : 85 1b __ STA ACCU + 0 
62e2 : a5 1c __ LDA ACCU + 1 
62e4 : 29 80 __ AND #$80
62e6 : 10 02 __ BPL $62ea ; (project.l5 + 160)
62e8 : a9 ff __ LDA #$ff
62ea : 85 55 __ STA T4 + 2 
62ec : 85 1d __ STA ACCU + 2 
62ee : 85 1e __ STA ACCU + 3 
62f0 : 20 06 75 JSR $7506 ; (mul32 + 0)
62f3 : 18 __ __ CLC
62f4 : a5 07 __ LDA WORK + 4 
62f6 : 65 4b __ ADC T2 + 0 
62f8 : a5 08 __ LDA WORK + 5 
62fa : 65 4c __ ADC T2 + 1 
62fc : 85 4b __ STA T2 + 0 
62fe : a5 09 __ LDA WORK + 6 
6300 : 65 4d __ ADC T2 + 2 
6302 : 85 4c __ STA T2 + 1 
6304 : a5 0a __ LDA WORK + 7 
6306 : 65 4e __ ADC T2 + 3 
6308 : 85 4e __ STA T2 + 3 
630a : a4 47 __ LDY T1 + 0 
630c : b1 59 __ LDA (T7 + 0),y 
630e : 85 56 __ STA T5 + 0 
6310 : c8 __ __ INY
6311 : b1 59 __ LDA (T7 + 0),y 
6313 : 85 57 __ STA T5 + 1 
6315 : 29 80 __ AND #$80
6317 : 10 02 __ BPL $631b ; (project.l5 + 209)
6319 : a9 ff __ LDA #$ff
631b : 85 58 __ STA T5 + 2 
631d : a5 53 __ LDA T4 + 0 
631f : 85 1b __ STA ACCU + 0 
6321 : a5 54 __ LDA T4 + 1 
6323 : 85 1c __ STA ACCU + 1 
6325 : a5 55 __ LDA T4 + 2 
6327 : 85 1d __ STA ACCU + 2 
6329 : 85 1e __ STA ACCU + 3 
632b : a5 0e __ LDA P1 ; (ay + 0)
632d : 85 03 __ STA WORK + 0 
632f : a5 48 __ LDA T1 + 1 
6331 : 85 04 __ STA WORK + 1 
6333 : a5 49 __ LDA T1 + 2 
6335 : 85 05 __ STA WORK + 2 
6337 : 85 06 __ STA WORK + 3 
6339 : 20 06 75 JSR $7506 ; (mul32 + 0)
633c : a5 07 __ LDA WORK + 4 
633e : 85 0e __ STA P1 ; (ay + 0)
6340 : a5 08 __ LDA WORK + 5 
6342 : 85 48 __ STA T1 + 1 
6344 : a5 09 __ LDA WORK + 6 
6346 : 85 49 __ STA T1 + 2 
6348 : a5 0a __ LDA WORK + 7 
634a : 85 4a __ STA T1 + 3 
634c : 38 __ __ SEC
634d : a9 00 __ LDA #$00
634f : e5 4f __ SBC T3 + 0 
6351 : 85 1b __ STA ACCU + 0 
6353 : a9 00 __ LDA #$00
6355 : e5 50 __ SBC T3 + 1 
6357 : 85 1c __ STA ACCU + 1 
6359 : a9 00 __ LDA #$00
635b : e5 51 __ SBC T3 + 2 
635d : 85 1d __ STA ACCU + 2 
635f : a9 00 __ LDA #$00
6361 : e5 51 __ SBC T3 + 2 
6363 : 85 1e __ STA ACCU + 3 
6365 : a5 43 __ LDA T0 + 0 
6367 : 85 03 __ STA WORK + 0 
6369 : a5 44 __ LDA T0 + 1 
636b : 85 04 __ STA WORK + 1 
636d : a5 45 __ LDA T0 + 2 
636f : 85 05 __ STA WORK + 2 
6371 : 85 06 __ STA WORK + 3 
6373 : 20 06 75 JSR $7506 ; (mul32 + 0)
6376 : 18 __ __ CLC
6377 : a5 07 __ LDA WORK + 4 
6379 : 65 0e __ ADC P1 ; (ay + 0)
637b : a5 08 __ LDA WORK + 5 
637d : 65 48 __ ADC T1 + 1 
637f : 85 43 __ STA T0 + 0 
6381 : a5 09 __ LDA WORK + 6 
6383 : 65 49 __ ADC T1 + 2 
6385 : 85 44 __ STA T0 + 1 
6387 : a5 0a __ LDA WORK + 7 
6389 : 65 4a __ ADC T1 + 3 
638b : 4a __ __ LSR
638c : 66 44 __ ROR T0 + 1 
638e : 66 43 __ ROR T0 + 0 
6390 : 4a __ __ LSR
6391 : 66 44 __ ROR T0 + 1 
6393 : 66 43 __ ROR T0 + 0 
6395 : 4a __ __ LSR
6396 : 66 44 __ ROR T0 + 1 
6398 : 66 43 __ ROR T0 + 0 
639a : 4a __ __ LSR
639b : 66 44 __ ROR T0 + 1 
639d : 66 43 __ ROR T0 + 0 
639f : a5 44 __ LDA T0 + 1 
63a1 : 85 1c __ STA ACCU + 1 
63a3 : 29 80 __ AND #$80
63a5 : 10 02 __ BPL $63a9 ; (project.l5 + 351)
63a7 : a9 ff __ LDA #$ff
63a9 : 85 45 __ STA T0 + 2 
63ab : 85 1e __ STA ACCU + 3 
63ad : 85 1d __ STA ACCU + 2 
63af : a5 43 __ LDA T0 + 0 
63b1 : 85 1b __ STA ACCU + 0 
63b3 : a5 56 __ LDA T5 + 0 
63b5 : 85 03 __ STA WORK + 0 
63b7 : a5 57 __ LDA T5 + 1 
63b9 : 85 04 __ STA WORK + 1 
63bb : a5 58 __ LDA T5 + 2 
63bd : 85 05 __ STA WORK + 2 
63bf : 85 06 __ STA WORK + 3 
63c1 : 20 06 75 JSR $7506 ; (mul32 + 0)
63c4 : a5 07 __ LDA WORK + 4 
63c6 : 85 0e __ STA P1 ; (ay + 0)
63c8 : a5 08 __ LDA WORK + 5 
63ca : 85 48 __ STA T1 + 1 
63cc : a5 09 __ LDA WORK + 6 
63ce : 85 49 __ STA T1 + 2 
63d0 : a5 0a __ LDA WORK + 7 
63d2 : 85 4a __ STA T1 + 3 
63d4 : a6 61 __ LDX T12 + 0 
63d6 : bd 3f 7d LDA $7d3f,x ; (cube_v[0][0] + 1)
63d9 : 29 80 __ AND #$80
63db : 10 02 __ BPL $63df ; (project.l5 + 405)
63dd : a9 ff __ LDA #$ff
63df : 85 04 __ STA WORK + 1 
63e1 : 85 50 __ STA T3 + 1 
63e3 : bd 3f 7d LDA $7d3f,x ; (cube_v[0][0] + 1)
63e6 : 0a __ __ ASL
63e7 : 0a __ __ ASL
63e8 : 18 __ __ CLC
63e9 : 7d 3f 7d ADC $7d3f,x ; (cube_v[0][0] + 1)
63ec : 0a __ __ ASL
63ed : 0a __ __ ASL
63ee : 0a __ __ ASL
63ef : 0a __ __ ASL
63f0 : 85 4f __ STA T3 + 0 
63f2 : 85 03 __ STA WORK + 0 
63f4 : a5 04 __ LDA WORK + 1 
63f6 : 29 80 __ AND #$80
63f8 : 10 02 __ BPL $63fc ; (project.l5 + 434)
63fa : a9 ff __ LDA #$ff
63fc : 85 51 __ STA T3 + 2 
63fe : 85 06 __ STA WORK + 3 
6400 : 85 05 __ STA WORK + 2 
6402 : a0 00 __ LDY #$00
6404 : b1 5f __ LDA (T10 + 0),y 
6406 : 85 53 __ STA T4 + 0 
6408 : 85 1b __ STA ACCU + 0 
640a : c8 __ __ INY
640b : b1 5f __ LDA (T10 + 0),y 
640d : 85 54 __ STA T4 + 1 
640f : 85 1c __ STA ACCU + 1 
6411 : 29 80 __ AND #$80
6413 : 10 02 __ BPL $6417 ; (project.l5 + 461)
6415 : a9 ff __ LDA #$ff
6417 : 85 55 __ STA T4 + 2 
6419 : 85 1d __ STA ACCU + 2 
641b : 85 1e __ STA ACCU + 3 
641d : 20 06 75 JSR $7506 ; (mul32 + 0)
6420 : 38 __ __ SEC
6421 : a5 07 __ LDA WORK + 4 
6423 : e5 0e __ SBC P1 ; (ay + 0)
6425 : a5 08 __ LDA WORK + 5 
6427 : e5 48 __ SBC T1 + 1 
6429 : 85 0e __ STA P1 ; (ay + 0)
642b : a5 09 __ LDA WORK + 6 
642d : e5 49 __ SBC T1 + 2 
642f : 85 48 __ STA T1 + 1 
6431 : a5 0a __ LDA WORK + 7 
6433 : e5 4a __ SBC T1 + 3 
6435 : 85 4a __ STA T1 + 3 
6437 : a5 53 __ LDA T4 + 0 
6439 : 85 1b __ STA ACCU + 0 
643b : a5 54 __ LDA T4 + 1 
643d : 85 1c __ STA ACCU + 1 
643f : a5 55 __ LDA T4 + 2 
6441 : 85 1d __ STA ACCU + 2 
6443 : 85 1e __ STA ACCU + 3 
6445 : a5 43 __ LDA T0 + 0 
6447 : 85 03 __ STA WORK + 0 
6449 : a5 44 __ LDA T0 + 1 
644b : 85 04 __ STA WORK + 1 
644d : a5 45 __ LDA T0 + 2 
644f : 85 05 __ STA WORK + 2 
6451 : 85 06 __ STA WORK + 3 
6453 : 20 06 75 JSR $7506 ; (mul32 + 0)
6456 : a5 07 __ LDA WORK + 4 
6458 : 85 43 __ STA T0 + 0 
645a : a5 08 __ LDA WORK + 5 
645c : 85 44 __ STA T0 + 1 
645e : a5 09 __ LDA WORK + 6 
6460 : 85 45 __ STA T0 + 2 
6462 : a5 0a __ LDA WORK + 7 
6464 : 85 46 __ STA T0 + 3 
6466 : a5 56 __ LDA T5 + 0 
6468 : 85 1b __ STA ACCU + 0 
646a : a5 57 __ LDA T5 + 1 
646c : 85 1c __ STA ACCU + 1 
646e : a5 58 __ LDA T5 + 2 
6470 : 85 1d __ STA ACCU + 2 
6472 : 85 1e __ STA ACCU + 3 
6474 : a5 4f __ LDA T3 + 0 
6476 : 85 03 __ STA WORK + 0 
6478 : a5 50 __ LDA T3 + 1 
647a : 85 04 __ STA WORK + 1 
647c : a5 51 __ LDA T3 + 2 
647e : 85 05 __ STA WORK + 2 
6480 : 85 06 __ STA WORK + 3 
6482 : 20 06 75 JSR $7506 ; (mul32 + 0)
6485 : 18 __ __ CLC
6486 : a5 07 __ LDA WORK + 4 
6488 : 65 43 __ ADC T0 + 0 
648a : a5 08 __ LDA WORK + 5 
648c : 65 44 __ ADC T0 + 1 
648e : 85 43 __ STA T0 + 0 
6490 : a5 09 __ LDA WORK + 6 
6492 : 65 45 __ ADC T0 + 2 
6494 : 85 44 __ STA T0 + 1 
6496 : a5 0a __ LDA WORK + 7 
6498 : 65 46 __ ADC T0 + 3 
649a : 4a __ __ LSR
649b : 66 44 __ ROR T0 + 1 
649d : 66 43 __ ROR T0 + 0 
649f : 4a __ __ LSR
64a0 : 66 44 __ ROR T0 + 1 
64a2 : 66 43 __ ROR T0 + 0 
64a4 : 4a __ __ LSR
64a5 : 66 44 __ ROR T0 + 1 
64a7 : 66 43 __ ROR T0 + 0 
64a9 : 4a __ __ LSR
64aa : 66 44 __ ROR T0 + 1 
64ac : 66 43 __ ROR T0 + 0 
64ae : 18 __ __ CLC
64af : a5 43 __ LDA T0 + 0 
64b1 : 69 18 __ ADC #$18
64b3 : 85 4f __ STA T3 + 0 
64b5 : a5 44 __ LDA T0 + 1 
64b7 : 69 01 __ ADC #$01
64b9 : 85 50 __ STA T3 + 1 
64bb : a5 44 __ LDA T0 + 1 
64bd : 49 80 __ EOR #$80
64bf : c9 7e __ CMP #$7e
64c1 : d0 04 __ BNE $64c7 ; (project.s9 + 0)
.s8:
64c3 : a5 43 __ LDA T0 + 0 
64c5 : c9 e9 __ CMP #$e9
.s9:
64c7 : b0 08 __ BCS $64d1 ; (project.s6 + 0)
.s7:
64c9 : a9 01 __ LDA #$01
64cb : 85 4f __ STA T3 + 0 
64cd : a9 00 __ LDA #$00
64cf : 85 50 __ STA T3 + 1 
.s6:
64d1 : a5 4e __ LDA T2 + 3 
64d3 : 4a __ __ LSR
64d4 : 66 4c __ ROR T2 + 1 
64d6 : 66 4b __ ROR T2 + 0 
64d8 : 4a __ __ LSR
64d9 : 66 4c __ ROR T2 + 1 
64db : 66 4b __ ROR T2 + 0 
64dd : 4a __ __ LSR
64de : 66 4c __ ROR T2 + 1 
64e0 : 66 4b __ ROR T2 + 0 
64e2 : 4a __ __ LSR
64e3 : 66 4c __ ROR T2 + 1 
64e5 : 66 4b __ ROR T2 + 0 
64e7 : a5 4b __ LDA T2 + 0 
64e9 : 0a __ __ ASL
64ea : a8 __ __ TAY
64eb : a5 4c __ LDA T2 + 1 
64ed : 2a __ __ ROL
64ee : aa __ __ TAX
64ef : 98 __ __ TYA
64f0 : 18 __ __ CLC
64f1 : 65 4b __ ADC T2 + 0 
64f3 : a8 __ __ TAY
64f4 : 8a __ __ TXA
64f5 : 65 4c __ ADC T2 + 1 
64f7 : 85 1b __ STA ACCU + 0 
64f9 : 98 __ __ TYA
64fa : 0a __ __ ASL
64fb : 26 1b __ ROL ACCU + 0 
64fd : 0a __ __ ASL
64fe : 26 1b __ ROL ACCU + 0 
6500 : 0a __ __ ASL
6501 : 26 1b __ ROL ACCU + 0 
6503 : 18 __ __ CLC
6504 : 65 4b __ ADC T2 + 0 
6506 : 85 4b __ STA T2 + 0 
6508 : a5 1b __ LDA ACCU + 0 
650a : 65 4c __ ADC T2 + 1 
650c : 06 4b __ ASL T2 + 0 
650e : 2a __ __ ROL
650f : 06 4b __ ASL T2 + 0 
6511 : 2a __ __ ROL
6512 : 06 4b __ ASL T2 + 0 
6514 : 2a __ __ ROL
6515 : 85 1c __ STA ACCU + 1 
6517 : a5 4b __ LDA T2 + 0 
6519 : 85 1b __ STA ACCU + 0 
651b : 20 5a 78 JSR $785a ; (divs16@proxy + 0)
651e : 18 __ __ CLC
651f : a5 1b __ LDA ACCU + 0 
6521 : 69 a0 __ ADC #$a0
6523 : a8 __ __ TAY
6524 : a5 1c __ LDA ACCU + 1 
6526 : 69 00 __ ADC #$00
6528 : 85 44 __ STA T0 + 1 
652a : a5 52 __ LDA T11 + 0 
652c : 0a __ __ ASL
652d : 85 4b __ STA T2 + 0 
652f : aa __ __ TAX
6530 : 98 __ __ TYA
6531 : 9d ae 83 STA $83ae,x ; (px_cur[0] + 0)
6534 : a5 44 __ LDA T0 + 1 
6536 : 9d af 83 STA $83af,x ; (px_cur[0] + 1)
6539 : a5 4a __ LDA T1 + 3 
653b : 4a __ __ LSR
653c : 66 48 __ ROR T1 + 1 
653e : 66 0e __ ROR P1 ; (ay + 0)
6540 : 4a __ __ LSR
6541 : 66 48 __ ROR T1 + 1 
6543 : 66 0e __ ROR P1 ; (ay + 0)
6545 : 4a __ __ LSR
6546 : 66 48 __ ROR T1 + 1 
6548 : 66 0e __ ROR P1 ; (ay + 0)
654a : 4a __ __ LSR
654b : 66 48 __ ROR T1 + 1 
654d : 66 0e __ ROR P1 ; (ay + 0)
654f : a5 0e __ LDA P1 ; (ay + 0)
6551 : 0a __ __ ASL
6552 : a8 __ __ TAY
6553 : a5 48 __ LDA T1 + 1 
6555 : 2a __ __ ROL
6556 : aa __ __ TAX
6557 : 98 __ __ TYA
6558 : 18 __ __ CLC
6559 : 65 0e __ ADC P1 ; (ay + 0)
655b : a8 __ __ TAY
655c : 8a __ __ TXA
655d : 65 48 __ ADC T1 + 1 
655f : 85 1b __ STA ACCU + 0 
6561 : 98 __ __ TYA
6562 : 0a __ __ ASL
6563 : 26 1b __ ROL ACCU + 0 
6565 : 0a __ __ ASL
6566 : 26 1b __ ROL ACCU + 0 
6568 : 0a __ __ ASL
6569 : 26 1b __ ROL ACCU + 0 
656b : 18 __ __ CLC
656c : 65 0e __ ADC P1 ; (ay + 0)
656e : 85 0e __ STA P1 ; (ay + 0)
6570 : a5 1b __ LDA ACCU + 0 
6572 : 65 48 __ ADC T1 + 1 
6574 : 06 0e __ ASL P1 ; (ay + 0)
6576 : 2a __ __ ROL
6577 : 06 0e __ ASL P1 ; (ay + 0)
6579 : 2a __ __ ROL
657a : 06 0e __ ASL P1 ; (ay + 0)
657c : 2a __ __ ROL
657d : 85 1c __ STA ACCU + 1 
657f : a5 0e __ LDA P1 ; (ay + 0)
6581 : 85 1b __ STA ACCU + 0 
6583 : 20 5a 78 JSR $785a ; (divs16@proxy + 0)
6586 : 18 __ __ CLC
6587 : a5 1b __ LDA ACCU + 0 
6589 : 69 64 __ ADC #$64
658b : a6 4b __ LDX T2 + 0 
658d : 9d 9e 83 STA $839e,x ; (py_cur[0] + 0)
6590 : a5 1c __ LDA ACCU + 1 
6592 : 69 00 __ ADC #$00
6594 : 9d 9f 83 STA $839f,x ; (py_cur[0] + 1)
6597 : e6 52 __ INC T11 + 0 
6599 : 18 __ __ CLC
659a : a5 61 __ LDA T12 + 0 
659c : 69 03 __ ADC #$03
659e : c9 18 __ CMP #$18
65a0 : f0 03 __ BEQ $65a5 ; (project.s3 + 0)
65a2 : 4c 4a 62 JMP $624a ; (project.l5 + 0)
.s3:
65a5 : a2 0e __ LDX #$0e
65a7 : bd d2 bf LDA $bfd2,x ; (project@stack + 0)
65aa : 95 53 __ STA T4 + 0,x 
65ac : ca __ __ DEX
65ad : 10 f8 __ BPL $65a7 ; (project.s3 + 2)
65af : 60 __ __ RTS
--------------------------------------------------------------------
plasma_run: ; plasma_run()->void
;   3, "/home/xahmol/git/UltimateDemo2026/src/plasma.h"
.s1:
65b0 : a2 04 __ LDX #$04
65b2 : b5 53 __ LDA T1 + 0,x 
65b4 : 9d e2 bf STA $bfe2,x ; (plasma_run@stack + 0)
65b7 : ca __ __ DEX
65b8 : 10 f8 __ BPL $65b2 ; (plasma_run.s1 + 2)
.s4:
65ba : 20 8f 66 JSR $668f ; (plasma_init.s4 + 0)
65bd : a9 00 __ LDA #$00
65bf : 85 53 __ STA T1 + 0 
65c1 : 85 54 __ STA T2 + 0 
65c3 : 85 55 __ STA T3 + 0 
65c5 : a9 a2 __ LDA #$a2
65c7 : 85 56 __ STA T4 + 0 
65c9 : a9 fe __ LDA #$fe
65cb : 85 57 __ STA T4 + 1 
.l5:
65cd : a5 53 __ LDA T1 + 0 
65cf : 85 0d __ STA P0 
65d1 : 20 e3 66 JSR $66e3 ; (plasma_frame@proxy + 0)
.l6:
65d4 : 2c 11 d0 BIT $d011 
65d7 : 30 fb __ BMI $65d4 ; (plasma_run.l6 + 0)
.l7:
65d9 : 2c 11 d0 BIT $d011 
65dc : 10 fb __ BPL $65d9 ; (plasma_run.l7 + 0)
.s8:
65de : e6 55 __ INC T3 + 0 
65e0 : e6 54 __ INC T2 + 0 
65e2 : e6 54 __ INC T2 + 0 
65e4 : e6 53 __ INC T1 + 0 
65e6 : e6 56 __ INC T4 + 0 
65e8 : d0 e3 __ BNE $65cd ; (plasma_run.l5 + 0)
.s19:
65ea : e6 57 __ INC T4 + 1 
65ec : d0 df __ BNE $65cd ; (plasma_run.l5 + 0)
.s9:
65ee : a9 00 __ LDA #$00
65f0 : 85 43 __ STA T0 + 0 
65f2 : 85 1f __ STA ADDR + 0 
65f4 : a9 c0 __ LDA #$c0
65f6 : 85 44 __ STA T0 + 1 
65f8 : d0 02 __ BNE $65fc ; (plasma_run.l18 + 0)
.s21:
65fa : e6 44 __ INC T0 + 1 
.l18:
65fc : a9 82 __ LDA #$82
65fe : a0 00 __ LDY #$00
6600 : 91 43 __ STA (T0 + 0),y 
6602 : 18 __ __ CLC
6603 : a5 44 __ LDA T0 + 1 
6605 : 69 18 __ ADC #$18
6607 : 85 20 __ STA ADDR + 1 
6609 : a9 07 __ LDA #$07
660b : a4 43 __ LDY T0 + 0 
660d : 91 1f __ STA (ADDR + 0),y 
660f : 98 __ __ TYA
6610 : 18 __ __ CLC
6611 : 69 01 __ ADC #$01
6613 : 85 43 __ STA T0 + 0 
6615 : b0 e3 __ BCS $65fa ; (plasma_run.s21 + 0)
.s22:
6617 : c9 e8 __ CMP #$e8
6619 : d0 e1 __ BNE $65fc ; (plasma_run.l18 + 0)
.s17:
661b : a5 44 __ LDA T0 + 1 
661d : c9 c3 __ CMP #$c3
661f : d0 db __ BNE $65fc ; (plasma_run.l18 + 0)
.s10:
6621 : a9 00 __ LDA #$00
6623 : 8d 21 d0 STA $d021 
6626 : a9 a2 __ LDA #$a2
6628 : 85 56 __ STA T4 + 0 
662a : a9 fe __ LDA #$fe
662c : 85 57 __ STA T4 + 1 
662e : a5 53 __ LDA T1 + 0 
.l11:
6630 : 85 0d __ STA P0 
6632 : 20 e3 66 JSR $66e3 ; (plasma_frame@proxy + 0)
.l12:
6635 : 2c 11 d0 BIT $d011 
6638 : 30 fb __ BMI $6635 ; (plasma_run.l12 + 0)
.l13:
663a : 2c 11 d0 BIT $d011 
663d : 10 fb __ BPL $663a ; (plasma_run.l13 + 0)
.s14:
663f : 18 __ __ CLC
6640 : a5 0f __ LDA P2 
6642 : 69 02 __ ADC #$02
6644 : 85 55 __ STA T3 + 0 
6646 : 18 __ __ CLC
6647 : a5 54 __ LDA T2 + 0 
6649 : 69 03 __ ADC #$03
664b : 85 54 __ STA T2 + 0 
664d : 18 __ __ CLC
664e : a5 0d __ LDA P0 
6650 : 69 02 __ ADC #$02
6652 : e6 56 __ INC T4 + 0 
6654 : d0 da __ BNE $6630 ; (plasma_run.l11 + 0)
.s20:
6656 : e6 57 __ INC T4 + 1 
6658 : d0 d6 __ BNE $6630 ; (plasma_run.l11 + 0)
.s15:
665a : a9 00 __ LDA #$00
665c : 85 0d __ STA P0 
665e : 85 0e __ STA P1 
6660 : 85 10 __ STA P3 
6662 : a9 36 __ LDA #$36
6664 : 85 01 __ STA $01 
6666 : 20 0e 0f JSR $0f0e ; (vic_setmode@proxy + 0)
6669 : a9 00 __ LDA #$00
666b : 8d 20 d0 STA $d020 
666e : 8d 21 d0 STA $d021 
6671 : a9 20 __ LDA #$20
6673 : a2 fa __ LDX #$fa
.l16:
6675 : ca __ __ DEX
6676 : 9d 00 04 STA $0400,x 
6679 : 9d fa 04 STA $04fa,x 
667c : 9d f4 05 STA $05f4,x 
667f : 9d ee 06 STA $06ee,x 
6682 : d0 f1 __ BNE $6675 ; (plasma_run.l16 + 0)
.s3:
6684 : a2 04 __ LDX #$04
6686 : bd e2 bf LDA $bfe2,x ; (plasma_run@stack + 0)
6689 : 95 53 __ STA T1 + 0,x 
668b : ca __ __ DEX
668c : 10 f8 __ BPL $6686 ; (plasma_run.s3 + 2)
668e : 60 __ __ RTS
--------------------------------------------------------------------
plasma_init: ; plasma_init()->void
;  38, "/home/xahmol/git/UltimateDemo2026/src/plasma.c"
.s4:
668f : a9 00 __ LDA #$00
6691 : 85 0f __ STA P2 
6693 : 85 10 __ STA P3 
6695 : 85 43 __ STA T0 + 0 
6697 : 85 0d __ STA P0 
6699 : a9 35 __ LDA #$35
669b : 85 01 __ STA $01 
669d : 20 4b 78 JSR $784b ; (memset@proxy + 0)
66a0 : a9 c0 __ LDA #$c0
66a2 : 85 44 __ STA T0 + 1 
66a4 : a9 00 __ LDA #$00
66a6 : 85 1f __ STA ADDR + 0 
66a8 : f0 02 __ BEQ $66ac ; (plasma_init.l7 + 0)
.s8:
66aa : e6 44 __ INC T0 + 1 
.l7:
66ac : a9 34 __ LDA #$34
66ae : a0 00 __ LDY #$00
66b0 : 91 43 __ STA (T0 + 0),y 
66b2 : 18 __ __ CLC
66b3 : a5 44 __ LDA T0 + 1 
66b5 : 69 18 __ ADC #$18
66b7 : 85 20 __ STA ADDR + 1 
66b9 : a9 07 __ LDA #$07
66bb : a4 43 __ LDY T0 + 0 
66bd : 91 1f __ STA (ADDR + 0),y 
66bf : 98 __ __ TYA
66c0 : 18 __ __ CLC
66c1 : 69 01 __ ADC #$01
66c3 : 85 43 __ STA T0 + 0 
66c5 : b0 e3 __ BCS $66aa ; (plasma_init.s8 + 0)
.s9:
66c7 : c9 e8 __ CMP #$e8
66c9 : d0 e1 __ BNE $66ac ; (plasma_init.l7 + 0)
.s6:
66cb : a5 44 __ LDA T0 + 1 
66cd : c9 c3 __ CMP #$c3
66cf : d0 db __ BNE $66ac ; (plasma_init.l7 + 0)
.s5:
66d1 : a9 00 __ LDA #$00
66d3 : 85 0e __ STA P1 
66d5 : 85 10 __ STA P3 
66d7 : 20 ab 78 JSR $78ab ; (vic_setmode@proxy + 0)
66da : a9 00 __ LDA #$00
66dc : 8d 21 d0 STA $d021 
66df : 8d 20 d0 STA $d020 
.s3:
66e2 : 60 __ __ RTS
--------------------------------------------------------------------
plasma_frame@proxy: ; plasma_frame@proxy
66e3 : a5 54 __ LDA $54 
66e5 : 85 0e __ STA P1 
66e7 : a5 55 __ LDA $55 
66e9 : 85 0f __ STA P2 
--------------------------------------------------------------------
plasma_frame: ; plasma_frame(u8,u8,u8)->void
;  69, "/home/xahmol/git/UltimateDemo2026/src/plasma.c"
.s4:
66eb : a2 00 __ LDX #$00
.l8:
66ed : a5 0e __ LDA P1 ; (t2 + 0)
66ef : 29 3f __ AND #$3f
66f1 : a8 __ __ TAY
66f2 : b9 6e 7f LDA $7f6e,y ; (sin_lut[0] + 0)
66f5 : 9d 20 9d STA $9d20,x ; (row_sin[0] + 0)
66f8 : e6 0e __ INC P1 ; (t2 + 0)
66fa : e8 __ __ INX
66fb : e0 c8 __ CPX #$c8
66fd : d0 ee __ BNE $66ed ; (plasma_frame.l8 + 0)
.s9:
66ff : a5 0d __ LDA P0 ; (t1 + 0)
6701 : 85 0e __ STA P1 ; (t2 + 0)
6703 : a9 00 __ LDA #$00
6705 : 85 1b __ STA ACCU + 0 
.l5:
6707 : 85 4b __ STA T10 + 0 
6709 : 29 07 __ AND #$07
670b : 85 43 __ STA T3 + 0 
670d : a5 1b __ LDA ACCU + 0 
670f : 29 f8 __ AND #$f8
6711 : 85 45 __ STA T4 + 0 
6713 : 4a __ __ LSR
6714 : 4a __ __ LSR
6715 : 65 45 __ ADC T4 + 0 
6717 : 4a __ __ LSR
6718 : 6a __ __ ROR
6719 : 6a __ __ ROR
671a : aa __ __ TAX
671b : 29 c0 __ AND #$c0
671d : 6a __ __ ROR
671e : 05 43 __ ORA T3 + 0 
6720 : 85 45 __ STA T4 + 0 
6722 : 8a __ __ TXA
6723 : 29 1f __ AND #$1f
6725 : 09 e0 __ ORA #$e0
6727 : 85 46 __ STA T4 + 1 
6729 : a5 1b __ LDA ACCU + 0 
672b : 69 03 __ ADC #$03
672d : 85 43 __ STA T3 + 0 
672f : a5 0e __ LDA P1 ; (t2 + 0)
6731 : 85 4d __ STA T11 + 0 
6733 : 18 __ __ CLC
6734 : 69 03 __ ADC #$03
6736 : 85 1c __ STA ACCU + 1 
6738 : a5 1b __ LDA ACCU + 0 
673a : aa __ __ TAX
673b : e8 __ __ INX
673c : 86 49 __ STX T8 + 0 
673e : 18 __ __ CLC
673f : 69 02 __ ADC #$02
6741 : 85 47 __ STA T6 + 0 
6743 : a9 00 __ LDA #$00
6745 : 85 44 __ STA T3 + 1 
6747 : 85 48 __ STA T6 + 1 
6749 : 18 __ __ CLC
674a : a5 0e __ LDA P1 ; (t2 + 0)
674c : 69 02 __ ADC #$02
674e : 85 1d __ STA ACCU + 2 
6750 : 18 __ __ CLC
6751 : 69 ff __ ADC #$ff
6753 : 85 1e __ STA ACCU + 3 
6755 : a9 00 __ LDA #$00
6757 : 85 4a __ STA T8 + 1 
6759 : 85 4c __ STA T10 + 1 
675b : bd 1f 9d LDA $9d1f,x ; (tbuffer[0] + 319)
675e : 85 4e __ STA T12 + 0 
6760 : a9 28 __ LDA #$28
6762 : 85 51 __ STA T16 + 0 
6764 : a0 00 __ LDY #$00
6766 : 18 __ __ CLC
.l7:
6767 : a5 4d __ LDA T11 + 0 
6769 : 29 3f __ AND #$3f
676b : aa __ __ TAX
676c : bd 6e 7f LDA $7f6e,x ; (sin_lut[0] + 0)
676f : 65 4e __ ADC T12 + 0 
6771 : 85 4f __ STA T13 + 0 
6773 : a5 4c __ LDA T10 + 1 
6775 : 4a __ __ LSR
6776 : a5 4b __ LDA T10 + 0 
6778 : 6a __ __ ROR
6779 : 18 __ __ CLC
677a : 65 0f __ ADC P2 ; (t3 + 0)
677c : 29 3f __ AND #$3f
677e : aa __ __ TAX
677f : bd 6e 7f LDA $7f6e,x ; (sin_lut[0] + 0)
6782 : 18 __ __ CLC
6783 : 65 4f __ ADC T13 + 0 
6785 : aa __ __ TAX
6786 : bd ae 7f LDA $7fae,x ; (sum_to_col[0] + 0)
6789 : 4a __ __ LSR
678a : 6a __ __ ROR
678b : 6a __ __ ROR
678c : 85 4f __ STA T13 + 0 
678e : a5 1e __ LDA ACCU + 3 
6790 : 29 3f __ AND #$3f
6792 : aa __ __ TAX
6793 : bd 6e 7f LDA $7f6e,x ; (sin_lut[0] + 0)
6796 : 65 4e __ ADC T12 + 0 
6798 : 85 50 __ STA T14 + 0 
679a : a5 4a __ LDA T8 + 1 
679c : 4a __ __ LSR
679d : a5 49 __ LDA T8 + 0 
679f : 6a __ __ ROR
67a0 : 18 __ __ CLC
67a1 : 65 0f __ ADC P2 ; (t3 + 0)
67a3 : 29 3f __ AND #$3f
67a5 : aa __ __ TAX
67a6 : bd 6e 7f LDA $7f6e,x ; (sin_lut[0] + 0)
67a9 : 18 __ __ CLC
67aa : 65 50 __ ADC T14 + 0 
67ac : aa __ __ TAX
67ad : bd ae 7f LDA $7fae,x ; (sum_to_col[0] + 0)
67b0 : 0a __ __ ASL
67b1 : 0a __ __ ASL
67b2 : 0a __ __ ASL
67b3 : 0a __ __ ASL
67b4 : 05 4f __ ORA T13 + 0 
67b6 : 85 4f __ STA T13 + 0 
67b8 : a5 1d __ LDA ACCU + 2 
67ba : 29 3f __ AND #$3f
67bc : aa __ __ TAX
67bd : bd 6e 7f LDA $7f6e,x ; (sin_lut[0] + 0)
67c0 : 65 4e __ ADC T12 + 0 
67c2 : 85 50 __ STA T14 + 0 
67c4 : a5 48 __ LDA T6 + 1 
67c6 : 4a __ __ LSR
67c7 : a5 47 __ LDA T6 + 0 
67c9 : 6a __ __ ROR
67ca : 18 __ __ CLC
67cb : 65 0f __ ADC P2 ; (t3 + 0)
67cd : 29 3f __ AND #$3f
67cf : aa __ __ TAX
67d0 : bd 6e 7f LDA $7f6e,x ; (sin_lut[0] + 0)
67d3 : 18 __ __ CLC
67d4 : 65 50 __ ADC T14 + 0 
67d6 : aa __ __ TAX
67d7 : bd ae 7f LDA $7fae,x ; (sum_to_col[0] + 0)
67da : 0a __ __ ASL
67db : 0a __ __ ASL
67dc : 05 4f __ ORA T13 + 0 
67de : 85 4f __ STA T13 + 0 
67e0 : a5 1c __ LDA ACCU + 1 
67e2 : 29 3f __ AND #$3f
67e4 : aa __ __ TAX
67e5 : bd 6e 7f LDA $7f6e,x ; (sin_lut[0] + 0)
67e8 : 65 4e __ ADC T12 + 0 
67ea : 85 50 __ STA T14 + 0 
67ec : a5 44 __ LDA T3 + 1 
67ee : 4a __ __ LSR
67ef : a5 43 __ LDA T3 + 0 
67f1 : 6a __ __ ROR
67f2 : 18 __ __ CLC
67f3 : 65 0f __ ADC P2 ; (t3 + 0)
67f5 : 29 3f __ AND #$3f
67f7 : aa __ __ TAX
67f8 : bd 6e 7f LDA $7f6e,x ; (sin_lut[0] + 0)
67fb : 18 __ __ CLC
67fc : 65 50 __ ADC T14 + 0 
67fe : aa __ __ TAX
67ff : bd ae 7f LDA $7fae,x ; (sum_to_col[0] + 0)
6802 : 05 4f __ ORA T13 + 0 
6804 : 91 45 __ STA (T4 + 0),y 
6806 : 18 __ __ CLC
6807 : a5 43 __ LDA T3 + 0 
6809 : 69 04 __ ADC #$04
680b : 85 43 __ STA T3 + 0 
680d : 90 03 __ BCC $6812 ; (plasma_frame.s11 + 0)
.s10:
680f : e6 44 __ INC T3 + 1 
6811 : 18 __ __ CLC
.s11:
6812 : a5 1c __ LDA ACCU + 1 
6814 : 69 04 __ ADC #$04
6816 : 85 1c __ STA ACCU + 1 
6818 : 18 __ __ CLC
6819 : a5 47 __ LDA T6 + 0 
681b : 69 04 __ ADC #$04
681d : 85 47 __ STA T6 + 0 
681f : 90 03 __ BCC $6824 ; (plasma_frame.s13 + 0)
.s12:
6821 : e6 48 __ INC T6 + 1 
6823 : 18 __ __ CLC
.s13:
6824 : a5 1d __ LDA ACCU + 2 
6826 : 69 04 __ ADC #$04
6828 : 85 1d __ STA ACCU + 2 
682a : 18 __ __ CLC
682b : a5 49 __ LDA T8 + 0 
682d : 69 04 __ ADC #$04
682f : 85 49 __ STA T8 + 0 
6831 : 90 03 __ BCC $6836 ; (plasma_frame.s15 + 0)
.s14:
6833 : e6 4a __ INC T8 + 1 
6835 : 18 __ __ CLC
.s15:
6836 : a5 1e __ LDA ACCU + 3 
6838 : 69 04 __ ADC #$04
683a : 85 1e __ STA ACCU + 3 
683c : 18 __ __ CLC
683d : a5 4b __ LDA T10 + 0 
683f : 69 04 __ ADC #$04
6841 : 85 4b __ STA T10 + 0 
6843 : 90 03 __ BCC $6848 ; (plasma_frame.s17 + 0)
.s16:
6845 : e6 4c __ INC T10 + 1 
6847 : 18 __ __ CLC
.s17:
6848 : a5 4d __ LDA T11 + 0 
684a : 69 04 __ ADC #$04
684c : 85 4d __ STA T11 + 0 
684e : 98 __ __ TYA
684f : 18 __ __ CLC
6850 : 69 08 __ ADC #$08
6852 : a8 __ __ TAY
6853 : 90 03 __ BCC $6858 ; (plasma_frame.s19 + 0)
.s18:
6855 : e6 46 __ INC T4 + 1 
6857 : 18 __ __ CLC
.s19:
6858 : c6 51 __ DEC T16 + 0 
685a : f0 03 __ BEQ $685f ; (plasma_frame.s6 + 0)
685c : 4c 67 67 JMP $6767 ; (plasma_frame.l7 + 0)
.s6:
685f : e6 1b __ INC ACCU + 0 
6861 : a5 1b __ LDA ACCU + 0 
6863 : c9 c8 __ CMP #$c8
6865 : f0 03 __ BEQ $686a ; (plasma_frame.s3 + 0)
6867 : 4c 07 67 JMP $6707 ; (plasma_frame.l5 + 0)
.s3:
686a : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_run: ; tunnel_run()->void
;   6, "/home/xahmol/git/UltimateDemo2026/src/tunnel.h"
.s1:
686b : a2 06 __ LDX #$06
686d : b5 53 __ LDA T1 + 0,x 
686f : 9d df bf STA $bfdf,x ; (tunnel_run@stack + 0)
6872 : ca __ __ DEX
6873 : 10 f8 __ BPL $686d ; (tunnel_run.s1 + 2)
.s4:
6875 : a9 8f __ LDA #$8f
6877 : 20 f3 15 JSR $15f3 ; (turbo_set.s4 + 0)
687a : 20 3f 69 JSR $693f ; (tunnel_build_tables.s4 + 0)
687d : 20 84 6b JSR $6b84 ; (tunnel_build_tex.s4 + 0)
6880 : 20 04 6c JSR $6c04 ; (tun_init.s4 + 0)
6883 : a9 00 __ LDA #$00
6885 : 85 55 __ STA T4 + 0 
6887 : 85 56 __ STA T5 + 0 
6889 : 85 43 __ STA T0 + 0 
688b : 85 53 __ STA T1 + 0 
688d : 85 59 __ STA T7 + 0 
688f : 85 57 __ STA T6 + 0 
6891 : 85 58 __ STA T6 + 1 
.l5:
6893 : a5 57 __ LDA T6 + 0 
6895 : 85 1b __ STA ACCU + 0 
6897 : a5 58 __ LDA T6 + 1 
6899 : 85 1c __ STA ACCU + 1 
689b : a9 c8 __ LDA #$c8
689d : 85 03 __ STA WORK + 0 
689f : 20 7d 74 JSR $747d ; (divmod@proxy + 0)
68a2 : a4 1b __ LDY ACCU + 0 
68a4 : c4 59 __ CPY T7 + 0 
68a6 : f0 2a __ BEQ $68d2 ; (tunnel_run.s6 + 0)
.s12:
68a8 : b9 fb 7c LDA $7cfb,y ; (pal_sc[0] + 0)
68ab : a2 fa __ LDX #$fa
.l14:
68ad : ca __ __ DEX
68ae : 9d 00 c0 STA $c000,x 
68b1 : 9d fa c0 STA $c0fa,x 
68b4 : 9d f4 c1 STA $c1f4,x 
68b7 : 9d ee c2 STA $c2ee,x 
68ba : d0 f1 __ BNE $68ad ; (tunnel_run.l14 + 0)
.s13:
68bc : b9 b8 7f LDA $7fb8,y ; (pal_cr[0] + 0)
68bf : a2 fa __ LDX #$fa
.l16:
68c1 : ca __ __ DEX
68c2 : 9d 00 d8 STA $d800,x 
68c5 : 9d fa d8 STA $d8fa,x 
68c8 : 9d f4 d9 STA $d9f4,x 
68cb : 9d ee da STA $daee,x 
68ce : d0 f1 __ BNE $68c1 ; (tunnel_run.l16 + 0)
.s15:
68d0 : 84 59 __ STY T7 + 0 
.s6:
68d2 : a5 55 __ LDA T4 + 0 
68d4 : 85 12 __ STA P5 
68d6 : a5 56 __ LDA T5 + 0 
68d8 : 85 13 __ STA P6 
68da : a5 43 __ LDA T0 + 0 
68dc : 85 54 __ STA T2 + 0 
68de : 29 3f __ AND #$3f
68e0 : aa __ __ TAX
68e1 : bd bc 7f LDA $7fbc,x ; (lat_wave[0] + 0)
68e4 : 85 14 __ STA P7 
68e6 : a5 53 __ LDA T1 + 0 
68e8 : 29 3f __ AND #$3f
68ea : aa __ __ TAX
68eb : bd 00 80 LDA $8000,x ; (vert_wave[0] + 0)
68ee : 85 15 __ STA P8 
68f0 : 20 58 6c JSR $6c58 ; (tunnel_render.s4 + 0)
.l7:
68f3 : 2c 11 d0 BIT $d011 
68f6 : 30 fb __ BMI $68f3 ; (tunnel_run.l7 + 0)
.l8:
68f8 : 2c 11 d0 BIT $d011 
68fb : 10 fb __ BPL $68f8 ; (tunnel_run.l8 + 0)
.s9:
68fd : e6 53 __ INC T1 + 0 
68ff : a6 54 __ LDX T2 + 0 
6901 : e8 __ __ INX
6902 : 86 43 __ STX T0 + 0 
6904 : e6 56 __ INC T5 + 0 
6906 : e6 55 __ INC T4 + 0 
6908 : e6 57 __ INC T6 + 0 
690a : d0 02 __ BNE $690e ; (tunnel_run.s18 + 0)
.s17:
690c : e6 58 __ INC T6 + 1 
.s18:
690e : a5 58 __ LDA T6 + 1 
6910 : c9 03 __ CMP #$03
6912 : f0 03 __ BEQ $6917 ; (tunnel_run.s11 + 0)
6914 : 4c 93 68 JMP $6893 ; (tunnel_run.l5 + 0)
.s11:
6917 : a5 57 __ LDA T6 + 0 
6919 : c9 20 __ CMP #$20
691b : d0 f7 __ BNE $6914 ; (tunnel_run.s18 + 6)
.s10:
691d : a9 00 __ LDA #$00
691f : 85 0d __ STA P0 
6921 : 85 0e __ STA P1 
6923 : 85 10 __ STA P3 
6925 : a9 36 __ LDA #$36
6927 : 85 01 __ STA $01 
6929 : 20 0e 0f JSR $0f0e ; (vic_setmode@proxy + 0)
692c : a9 00 __ LDA #$00
692e : 8d 20 d0 STA $d020 
6931 : 8d 21 d0 STA $d021 
.s3:
6934 : a2 06 __ LDX #$06
6936 : bd df bf LDA $bfdf,x ; (tunnel_run@stack + 0)
6939 : 95 53 __ STA T1 + 0,x 
693b : ca __ __ DEX
693c : 10 f8 __ BPL $6936 ; (tunnel_run.s3 + 2)
693e : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_build_tables: ; tunnel_build_tables()->void
; 160, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
693f : a9 00 __ LDA #$00
6941 : 85 4d __ STA T4 + 0 
6943 : a9 97 __ LDA #$97
6945 : 85 49 __ STA T1 + 0 
6947 : a9 ff __ LDA #$ff
6949 : 85 4a __ STA T1 + 1 
.l5:
694b : a9 00 __ LDA #$00
694d : 85 4e __ STA T5 + 0 
694f : a9 b1 __ LDA #$b1
6951 : 85 4b __ STA T2 + 0 
6953 : a9 ff __ LDA #$ff
.l6:
6955 : 85 4c __ STA T2 + 1 
6957 : 85 10 __ STA P3 
6959 : a5 49 __ LDA T1 + 0 
695b : 85 0d __ STA P0 
695d : a5 4a __ LDA T1 + 1 
695f : 85 0e __ STA P1 
6961 : a5 4b __ LDA T2 + 0 
6963 : 85 0f __ STA P2 
6965 : 20 cb 69 JSR $69cb ; (iatan2_5.s4 + 0)
6968 : a6 4e __ LDX T5 + 0 
696a : 9d 00 9e STA $9e00,x ; (row_buf[0] + 0)
696d : a5 4b __ LDA T2 + 0 
696f : 85 0d __ STA P0 
6971 : a5 4c __ LDA T2 + 1 
6973 : 85 0e __ STA P1 
6975 : a5 49 __ LDA T1 + 0 
6977 : 85 0f __ STA P2 
6979 : a5 4a __ LDA T1 + 1 
697b : 85 10 __ STA P3 
697d : 20 af 6a JSR $6aaf ; (idist_5.s4 + 0)
6980 : a6 4e __ LDX T5 + 0 
6982 : e8 __ __ INX
6983 : 86 4e __ STX T5 + 0 
6985 : 9d 4f 9e STA $9e4f,x ; (row_buf[0] + 79)
6988 : 18 __ __ CLC
6989 : a5 0d __ LDA P0 
698b : 69 02 __ ADC #$02
698d : 85 4b __ STA T2 + 0 
698f : a5 0e __ LDA P1 
6991 : 69 00 __ ADC #$00
6993 : e0 50 __ CPX #$50
6995 : 90 be __ BCC $6955 ; (tunnel_build_tables.l6 + 0)
.s7:
6997 : a5 4d __ LDA T4 + 0 
6999 : 85 1b __ STA ACCU + 0 
699b : a9 d0 __ LDA #$d0
699d : 85 0d __ STA P0 
699f : a9 00 __ LDA #$00
69a1 : 85 1c __ STA ACCU + 1 
69a3 : 85 1d __ STA ACCU + 2 
69a5 : 85 1e __ STA ACCU + 3 
69a7 : a9 a0 __ LDA #$a0
69a9 : 20 ca 73 JSR $73ca ; (mul32by8 + 0)
69ac : 18 __ __ CLC
69ad : a5 09 __ LDA WORK + 6 
69af : 69 20 __ ADC #$20
69b1 : 85 10 __ STA P3 
69b3 : a5 0a __ LDA WORK + 7 
69b5 : 69 00 __ ADC #$00
69b7 : 85 11 __ STA P4 
69b9 : 20 51 6b JSR $6b51 ; (reu_dma@proxy + 0)
69bc : e6 49 __ INC T1 + 0 
69be : d0 02 __ BNE $69c2 ; (tunnel_build_tables.s9 + 0)
.s8:
69c0 : e6 4a __ INC T1 + 1 
.s9:
69c2 : e6 4d __ INC T4 + 0 
69c4 : a5 4d __ LDA T4 + 0 
69c6 : c9 6e __ CMP #$6e
69c8 : 90 81 __ BCC $694b ; (tunnel_build_tables.l5 + 0)
.s3:
69ca : 60 __ __ RTS
--------------------------------------------------------------------
iatan2_5: ; iatan2_5(i16,i16)->u8
; 115, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
69cb : a5 10 __ LDA P3 ; (x + 1)
69cd : 05 0f __ ORA P2 ; (x + 0)
69cf : d0 0a __ BNE $69db ; (iatan2_5.s5 + 0)
.s37:
69d1 : 85 0f __ STA P2 ; (x + 0)
69d3 : 85 10 __ STA P3 ; (x + 1)
69d5 : a5 0d __ LDA P0 ; (y + 0)
69d7 : 05 0e __ ORA P1 ; (y + 1)
69d9 : f0 77 __ BEQ $6a52 ; (iatan2_5.s3 + 0)
.s5:
69db : 24 10 __ BIT P3 ; (x + 1)
69dd : 30 09 __ BMI $69e8 ; (iatan2_5.s36 + 0)
.s6:
69df : a5 0f __ LDA P2 ; (x + 0)
69e1 : 85 43 __ STA T1 + 0 
69e3 : a5 10 __ LDA P3 ; (x + 1)
69e5 : 4c f3 69 JMP $69f3 ; (iatan2_5.s7 + 0)
.s36:
69e8 : 38 __ __ SEC
69e9 : a9 00 __ LDA #$00
69eb : e5 0f __ SBC P2 ; (x + 0)
69ed : 85 43 __ STA T1 + 0 
69ef : a9 00 __ LDA #$00
69f1 : e5 10 __ SBC P3 ; (x + 1)
.s7:
69f3 : a8 __ __ TAY
69f4 : 24 0e __ BIT P1 ; (y + 1)
69f6 : 30 09 __ BMI $6a01 ; (iatan2_5.s35 + 0)
.s8:
69f8 : a5 0d __ LDA P0 ; (y + 0)
69fa : 85 45 __ STA T3 + 0 
69fc : a5 0e __ LDA P1 ; (y + 1)
69fe : 4c 0c 6a JMP $6a0c ; (iatan2_5.s9 + 0)
.s35:
6a01 : 38 __ __ SEC
6a02 : a9 00 __ LDA #$00
6a04 : e5 0d __ SBC P0 ; (y + 0)
6a06 : 85 45 __ STA T3 + 0 
6a08 : a9 00 __ LDA #$00
6a0a : e5 0e __ SBC P1 ; (y + 1)
.s9:
6a0c : 85 46 __ STA T3 + 1 
6a0e : 98 __ __ TYA
6a0f : 30 53 __ BMI $6a64 ; (iatan2_5.s10 + 0)
.s34:
6a11 : c4 46 __ CPY T3 + 1 
6a13 : d0 04 __ BNE $6a19 ; (iatan2_5.s33 + 0)
.s32:
6a15 : a5 43 __ LDA T1 + 0 
6a17 : c5 45 __ CMP T3 + 0 
.s33:
6a19 : 90 49 __ BCC $6a64 ; (iatan2_5.s10 + 0)
.s21:
6a1b : 84 04 __ STY WORK + 1 
6a1d : 24 0e __ BIT P1 ; (y + 1)
6a1f : 30 04 __ BMI $6a25 ; (iatan2_5.s23 + 0)
.s22:
6a21 : a9 ff __ LDA #$ff
6a23 : b0 02 __ BCS $6a27 ; (iatan2_5.s24 + 0)
.s23:
6a25 : a9 00 __ LDA #$00
.s24:
6a27 : 85 44 __ STA T2 + 0 
6a29 : a5 46 __ LDA T3 + 1 
6a2b : 06 45 __ ASL T3 + 0 
6a2d : 2a __ __ ROL
6a2e : 06 45 __ ASL T3 + 0 
6a30 : 2a __ __ ROL
6a31 : 06 45 __ ASL T3 + 0 
6a33 : 2a __ __ ROL
6a34 : 85 1c __ STA ACCU + 1 
6a36 : a5 45 __ LDA T3 + 0 
6a38 : 85 1b __ STA ACCU + 0 
6a3a : a5 43 __ LDA T1 + 0 
6a3c : 85 03 __ STA WORK + 0 
6a3e : 20 46 74 JSR $7446 ; (divs16 + 0)
6a41 : a5 10 __ LDA P3 ; (x + 1)
6a43 : 30 04 __ BMI $6a49 ; (iatan2_5.s25 + 0)
.s31:
6a45 : 05 0f __ ORA P2 ; (x + 0)
6a47 : d0 10 __ BNE $6a59 ; (iatan2_5.s28 + 0)
.s25:
6a49 : 24 44 __ BIT T2 + 0 
6a4b : 30 06 __ BMI $6a53 ; (iatan2_5.s27 + 0)
.s26:
6a4d : 18 __ __ CLC
6a4e : a5 1b __ LDA ACCU + 0 
6a50 : 69 10 __ ADC #$10
.s3:
6a52 : 60 __ __ RTS
.s27:
6a53 : a9 10 __ LDA #$10
.s38:
6a55 : 38 __ __ SEC
6a56 : e5 1b __ SBC ACCU + 0 
6a58 : 60 __ __ RTS
.s28:
6a59 : 24 44 __ BIT T2 + 0 
6a5b : 10 03 __ BPL $6a60 ; (iatan2_5.s29 + 0)
.s30:
6a5d : a5 1b __ LDA ACCU + 0 
6a5f : 60 __ __ RTS
.s29:
6a60 : a9 20 __ LDA #$20
6a62 : d0 f1 __ BNE $6a55 ; (iatan2_5.s38 + 0)
.s10:
6a64 : 24 10 __ BIT P3 ; (x + 1)
6a66 : 30 04 __ BMI $6a6c ; (iatan2_5.s12 + 0)
.s11:
6a68 : a9 ff __ LDA #$ff
6a6a : d0 02 __ BNE $6a6e ; (iatan2_5.s13 + 0)
.s12:
6a6c : a9 00 __ LDA #$00
.s13:
6a6e : 85 47 __ STA T4 + 0 
6a70 : 98 __ __ TYA
6a71 : 06 43 __ ASL T1 + 0 
6a73 : 2a __ __ ROL
6a74 : 06 43 __ ASL T1 + 0 
6a76 : 2a __ __ ROL
6a77 : 06 43 __ ASL T1 + 0 
6a79 : 2a __ __ ROL
6a7a : 85 1c __ STA ACCU + 1 
6a7c : a5 43 __ LDA T1 + 0 
6a7e : 85 1b __ STA ACCU + 0 
6a80 : a5 45 __ LDA T3 + 0 
6a82 : 85 03 __ STA WORK + 0 
6a84 : a5 46 __ LDA T3 + 1 
6a86 : 85 04 __ STA WORK + 1 
6a88 : 20 46 74 JSR $7446 ; (divs16 + 0)
6a8b : a5 0e __ LDA P1 ; (y + 1)
6a8d : 30 04 __ BMI $6a93 ; (iatan2_5.s14 + 0)
.s20:
6a8f : 05 0d __ ORA P0 ; (y + 0)
6a91 : d0 0e __ BNE $6aa1 ; (iatan2_5.s17 + 0)
.s14:
6a93 : 24 47 __ BIT T4 + 0 
6a95 : 10 06 __ BPL $6a9d ; (iatan2_5.s15 + 0)
.s16:
6a97 : 18 __ __ CLC
6a98 : a5 1b __ LDA ACCU + 0 
6a9a : 69 18 __ ADC #$18
6a9c : 60 __ __ RTS
.s15:
6a9d : a9 18 __ LDA #$18
6a9f : d0 b4 __ BNE $6a55 ; (iatan2_5.s38 + 0)
.s17:
6aa1 : 24 47 __ BIT T4 + 0 
6aa3 : 10 04 __ BPL $6aa9 ; (iatan2_5.s18 + 0)
.s19:
6aa5 : a9 08 __ LDA #$08
6aa7 : d0 ac __ BNE $6a55 ; (iatan2_5.s38 + 0)
.s18:
6aa9 : 18 __ __ CLC
6aaa : a5 1b __ LDA ACCU + 0 
6aac : 69 08 __ ADC #$08
6aae : 60 __ __ RTS
--------------------------------------------------------------------
idist_5: ; idist_5(i16,i16)->u8
; 137, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6aaf : a5 0f __ LDA P2 ; (dy + 0)
6ab1 : 85 03 __ STA WORK + 0 
6ab3 : 85 1b __ STA ACCU + 0 
6ab5 : a5 10 __ LDA P3 ; (dy + 1)
6ab7 : 85 04 __ STA WORK + 1 
6ab9 : 85 1c __ STA ACCU + 1 
6abb : 20 00 74 JSR $7400 ; (mul16 + 0)
6abe : a5 05 __ LDA WORK + 2 
6ac0 : 85 43 __ STA T0 + 0 
6ac2 : a5 06 __ LDA WORK + 3 
6ac4 : 85 44 __ STA T0 + 1 
6ac6 : a5 0d __ LDA P0 ; (dx + 0)
6ac8 : 85 03 __ STA WORK + 0 
6aca : 85 1b __ STA ACCU + 0 
6acc : a5 0e __ LDA P1 ; (dx + 1)
6ace : 85 04 __ STA WORK + 1 
6ad0 : 85 1c __ STA ACCU + 1 
6ad2 : 20 00 74 JSR $7400 ; (mul16 + 0)
6ad5 : 18 __ __ CLC
6ad6 : a5 05 __ LDA WORK + 2 
6ad8 : 65 43 __ ADC T0 + 0 
6ada : 85 43 __ STA T0 + 0 
6adc : a5 06 __ LDA WORK + 3 
6ade : 65 44 __ ADC T0 + 1 
6ae0 : 85 44 __ STA T0 + 1 
6ae2 : 05 43 __ ORA T0 + 0 
6ae4 : f0 64 __ BEQ $6b4a ; (idist_5.s11 + 0)
.s5:
6ae6 : a5 44 __ LDA T0 + 1 
6ae8 : 4a __ __ LSR
6ae9 : 85 46 __ STA T1 + 1 
6aeb : a5 43 __ LDA T0 + 0 
6aed : 6a __ __ ROR
6aee : 85 45 __ STA T1 + 0 
6af0 : 05 46 __ ORA T1 + 1 
6af2 : d0 08 __ BNE $6afc ; (idist_5.l6 + 0)
.s10:
6af4 : a9 01 __ LDA #$01
6af6 : 85 45 __ STA T1 + 0 
6af8 : a9 00 __ LDA #$00
6afa : 85 46 __ STA T1 + 1 
.l6:
6afc : a5 45 __ LDA T1 + 0 
6afe : 85 03 __ STA WORK + 0 
6b00 : 85 47 __ STA T2 + 0 
6b02 : a5 46 __ LDA T1 + 1 
6b04 : 85 04 __ STA WORK + 1 
6b06 : 85 48 __ STA T2 + 1 
6b08 : a5 43 __ LDA T0 + 0 
6b0a : 85 1b __ STA ACCU + 0 
6b0c : a5 44 __ LDA T0 + 1 
6b0e : 85 1c __ STA ACCU + 1 
6b10 : 20 81 74 JSR $7481 ; (divmod + 0)
6b13 : 18 __ __ CLC
6b14 : a5 1b __ LDA ACCU + 0 
6b16 : 65 45 __ ADC T1 + 0 
6b18 : 85 45 __ STA T1 + 0 
6b1a : a5 1c __ LDA ACCU + 1 
6b1c : 65 46 __ ADC T1 + 1 
6b1e : 4a __ __ LSR
6b1f : 85 46 __ STA T1 + 1 
6b21 : 66 45 __ ROR T1 + 0 
6b23 : c5 48 __ CMP T2 + 1 
6b25 : 90 d5 __ BCC $6afc ; (idist_5.l6 + 0)
.s12:
6b27 : d0 24 __ BNE $6b4d ; (idist_5.s13 + 0)
.s9:
6b29 : a5 45 __ LDA T1 + 0 
6b2b : c5 47 __ CMP T2 + 0 
6b2d : 90 cd __ BCC $6afc ; (idist_5.l6 + 0)
.s7:
6b2f : 85 03 __ STA WORK + 0 
6b31 : a9 20 __ LDA #$20
6b33 : 85 1b __ STA ACCU + 0 
6b35 : a9 03 __ LDA #$03
6b37 : 85 1c __ STA ACCU + 1 
6b39 : a5 46 __ LDA T1 + 1 
6b3b : 85 04 __ STA WORK + 1 
6b3d : 20 81 74 JSR $7481 ; (divmod + 0)
6b40 : a5 1c __ LDA ACCU + 1 
6b42 : d0 06 __ BNE $6b4a ; (idist_5.s11 + 0)
.s8:
6b44 : a5 1b __ LDA ACCU + 0 
6b46 : c9 20 __ CMP #$20
6b48 : 90 02 __ BCC $6b4c ; (idist_5.s3 + 0)
.s11:
6b4a : a9 1f __ LDA #$1f
.s3:
6b4c : 60 __ __ RTS
.s13:
6b4d : a5 45 __ LDA T1 + 0 
6b4f : b0 de __ BCS $6b2f ; (idist_5.s7 + 0)
--------------------------------------------------------------------
reu_dma@proxy: ; reu_dma@proxy
6b51 : a5 07 __ LDA WORK + 4 
6b53 : 85 0e __ STA P1 
6b55 : a5 08 __ LDA WORK + 5 
6b57 : 85 0f __ STA P2 
--------------------------------------------------------------------
reu_dma: ; reu_dma(u8,u32,void*,u8)->void
;  94, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6b59 : 78 __ __ SEI
6b5a : a9 00 __ LDA #$00
6b5c : 8d 02 df STA $df02 
6b5f : a9 9e __ LDA #$9e
6b61 : 8d 03 df STA $df03 
6b64 : a5 0e __ LDA P1 ; (reu_addr + 0)
6b66 : 8d 04 df STA $df04 
6b69 : a5 0f __ LDA P2 ; (reu_addr + 1)
6b6b : 8d 05 df STA $df05 
6b6e : a5 10 __ LDA P3 ; (reu_addr + 2)
6b70 : 8d 06 df STA $df06 
6b73 : a9 a0 __ LDA #$a0
6b75 : 8d 07 df STA $df07 
6b78 : a9 00 __ LDA #$00
6b7a : 8d 08 df STA $df08 
6b7d : a5 0d __ LDA P0 ; (cmd + 0)
6b7f : 8d 01 df STA $df01 
6b82 : 58 __ __ CLI
.s3:
6b83 : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_build_tex: ; tunnel_build_tex()->void
; 182, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6b84 : a9 00 __ LDA #$00
6b86 : 85 1b __ STA ACCU + 0 
.l5:
6b88 : 29 04 __ AND #$04
6b8a : 4a __ __ LSR
6b8b : 4a __ __ LSR
6b8c : f0 02 __ BEQ $6b90 ; (tunnel_build_tex.s14 + 0)
.s13:
6b8e : a9 04 __ LDA #$04
.s14:
6b90 : 85 43 __ STA T1 + 0 
6b92 : a5 1b __ LDA ACCU + 0 
6b94 : 0a __ __ ASL
6b95 : 0a __ __ ASL
6b96 : 0a __ __ ASL
6b97 : 0a __ __ ASL
6b98 : 85 45 __ STA T2 + 0 
6b9a : a9 00 __ LDA #$00
6b9c : 85 1c __ STA ACCU + 1 
6b9e : 2a __ __ ROL
6b9f : 06 45 __ ASL T2 + 0 
6ba1 : 2a __ __ ROL
6ba2 : 85 46 __ STA T2 + 1 
6ba4 : a5 1b __ LDA ACCU + 0 
6ba6 : 29 03 __ AND #$03
6ba8 : f0 3b __ BEQ $6be5 ; (tunnel_build_tex.s11 + 0)
.l6:
6baa : 18 __ __ CLC
6bab : a5 43 __ LDA T1 + 0 
6bad : 65 1c __ ADC ACCU + 1 
6baf : 29 1f __ AND #$1f
6bb1 : aa __ __ TAX
6bb2 : 29 07 __ AND #$07
6bb4 : d0 04 __ BNE $6bba ; (tunnel_build_tex.s7 + 0)
.s10:
6bb6 : a9 02 __ LDA #$02
6bb8 : d0 05 __ BNE $6bbf ; (tunnel_build_tex.s8 + 0)
.s7:
6bba : 8a __ __ TXA
6bbb : 29 04 __ AND #$04
6bbd : 4a __ __ LSR
6bbe : 4a __ __ LSR
.s8:
6bbf : aa __ __ TAX
6bc0 : a5 45 __ LDA T2 + 0 
6bc2 : 05 1c __ ORA ACCU + 1 
6bc4 : 18 __ __ CLC
6bc5 : 69 a0 __ ADC #$a0
6bc7 : 85 47 __ STA T5 + 0 
6bc9 : a9 9e __ LDA #$9e
6bcb : 65 46 __ ADC T2 + 1 
6bcd : 85 48 __ STA T5 + 1 
6bcf : 8a __ __ TXA
6bd0 : a0 00 __ LDY #$00
6bd2 : 91 47 __ STA (T5 + 0),y 
6bd4 : e6 1c __ INC ACCU + 1 
6bd6 : a5 1c __ LDA ACCU + 1 
6bd8 : c9 20 __ CMP #$20
6bda : d0 ce __ BNE $6baa ; (tunnel_build_tex.l6 + 0)
.s9:
6bdc : e6 1b __ INC ACCU + 0 
6bde : a5 1b __ LDA ACCU + 0 
6be0 : c9 20 __ CMP #$20
6be2 : d0 a4 __ BNE $6b88 ; (tunnel_build_tex.l5 + 0)
.s3:
6be4 : 60 __ __ RTS
.s11:
6be5 : 85 43 __ STA T1 + 0 
6be7 : a6 45 __ LDX T2 + 0 
.l12:
6be9 : 8a __ __ TXA
6bea : 05 1c __ ORA ACCU + 1 
6bec : 18 __ __ CLC
6bed : 69 a0 __ ADC #$a0
6bef : a8 __ __ TAY
6bf0 : a9 9e __ LDA #$9e
6bf2 : 65 46 __ ADC T2 + 1 
6bf4 : 85 44 __ STA T1 + 1 
6bf6 : a9 03 __ LDA #$03
6bf8 : 91 43 __ STA (T1 + 0),y 
6bfa : e6 1c __ INC ACCU + 1 
6bfc : a5 1c __ LDA ACCU + 1 
6bfe : c9 20 __ CMP #$20
6c00 : d0 e7 __ BNE $6be9 ; (tunnel_build_tex.l12 + 0)
6c02 : f0 d8 __ BEQ $6bdc ; (tunnel_build_tex.s9 + 0)
--------------------------------------------------------------------
tun_init: ; tun_init()->void
; 266, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6c04 : a9 00 __ LDA #$00
6c06 : 85 0f __ STA P2 
6c08 : 85 10 __ STA P3 
6c0a : 85 43 __ STA T0 + 0 
6c0c : 85 0d __ STA P0 
6c0e : a9 35 __ LDA #$35
6c10 : 85 01 __ STA $01 
6c12 : 20 4b 78 JSR $784b ; (memset@proxy + 0)
6c15 : a9 c0 __ LDA #$c0
6c17 : 85 44 __ STA T0 + 1 
6c19 : a9 00 __ LDA #$00
6c1b : 85 1f __ STA ADDR + 0 
6c1d : f0 02 __ BEQ $6c21 ; (tun_init.l7 + 0)
.s8:
6c1f : e6 44 __ INC T0 + 1 
.l7:
6c21 : a9 f9 __ LDA #$f9
6c23 : a0 00 __ LDY #$00
6c25 : 91 43 __ STA (T0 + 0),y 
6c27 : 18 __ __ CLC
6c28 : a5 44 __ LDA T0 + 1 
6c2a : 69 18 __ ADC #$18
6c2c : 85 20 __ STA ADDR + 1 
6c2e : a9 01 __ LDA #$01
6c30 : a4 43 __ LDY T0 + 0 
6c32 : 91 1f __ STA (ADDR + 0),y 
6c34 : 98 __ __ TYA
6c35 : 18 __ __ CLC
6c36 : 69 01 __ ADC #$01
6c38 : 85 43 __ STA T0 + 0 
6c3a : b0 e3 __ BCS $6c1f ; (tun_init.s8 + 0)
.s9:
6c3c : c9 e8 __ CMP #$e8
6c3e : d0 e1 __ BNE $6c21 ; (tun_init.l7 + 0)
.s6:
6c40 : a5 44 __ LDA T0 + 1 
6c42 : c9 c3 __ CMP #$c3
6c44 : d0 db __ BNE $6c21 ; (tun_init.l7 + 0)
.s5:
6c46 : a9 00 __ LDA #$00
6c48 : 85 0e __ STA P1 
6c4a : 85 10 __ STA P3 
6c4c : 20 ab 78 JSR $78ab ; (vic_setmode@proxy + 0)
6c4f : a9 00 __ LDA #$00
6c51 : 8d 21 d0 STA $d021 
6c54 : 8d 20 d0 STA $d020 
.s3:
6c57 : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_render: ; tunnel_render(u8,u8,i8,i8)->void
; 209, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6c58 : 18 __ __ CLC
6c59 : a5 15 __ LDA P8 ; (vert_j + 0)
6c5b : 69 05 __ ADC #$05
6c5d : 85 51 __ STA T12 + 0 
6c5f : a9 00 __ LDA #$00
6c61 : 85 52 __ STA T13 + 0 
6c63 : a9 d1 __ LDA #$d1
6c65 : 85 0d __ STA P0 
.l5:
6c67 : a5 51 __ LDA T12 + 0 
6c69 : 85 1b __ STA ACCU + 0 
6c6b : a9 00 __ LDA #$00
6c6d : 85 1c __ STA ACCU + 1 
6c6f : 85 1d __ STA ACCU + 2 
6c71 : 85 1e __ STA ACCU + 3 
6c73 : a9 a0 __ LDA #$a0
6c75 : 20 ca 73 JSR $73ca ; (mul32by8 + 0)
6c78 : 18 __ __ CLC
6c79 : a5 09 __ LDA WORK + 6 
6c7b : 69 20 __ ADC #$20
6c7d : 85 10 __ STA P3 
6c7f : a5 0a __ LDA WORK + 7 
6c81 : 69 00 __ ADC #$00
6c83 : 85 11 __ STA P4 
6c85 : 20 51 6b JSR $6b51 ; (reu_dma@proxy + 0)
6c88 : a5 52 __ LDA T13 + 0 
6c8a : 4a __ __ LSR
6c8b : 4a __ __ LSR
6c8c : 4a __ __ LSR
6c8d : aa __ __ TAX
6c8e : a5 52 __ LDA T13 + 0 
6c90 : 29 07 __ AND #$07
6c92 : 1d e3 77 ORA $77e3,x ; (__multab320L + 0)
6c95 : 85 43 __ STA T1 + 0 
6c97 : bd f0 77 LDA $77f0,x ; (__multab320H + 0)
6c9a : 09 e0 __ ORA #$e0
6c9c : 85 44 __ STA T1 + 1 
6c9e : 38 __ __ SEC
6c9f : a9 c7 __ LDA #$c7
6ca1 : e5 52 __ SBC T13 + 0 
6ca3 : aa __ __ TAX
6ca4 : 29 07 __ AND #$07
6ca6 : 85 1c __ STA ACCU + 1 
6ca8 : 8a __ __ TXA
6ca9 : 4a __ __ LSR
6caa : 4a __ __ LSR
6cab : 4a __ __ LSR
6cac : 85 1b __ STA ACCU + 0 
6cae : 0a __ __ ASL
6caf : 0a __ __ ASL
6cb0 : 65 1b __ ADC ACCU + 0 
6cb2 : 4a __ __ LSR
6cb3 : 6a __ __ ROR
6cb4 : aa __ __ TAX
6cb5 : 29 80 __ AND #$80
6cb7 : 6a __ __ ROR
6cb8 : 05 1c __ ORA ACCU + 1 
6cba : 85 1b __ STA ACCU + 0 
6cbc : 8a __ __ TXA
6cbd : 29 3f __ AND #$3f
6cbf : 69 e0 __ ADC #$e0
6cc1 : 85 1c __ STA ACCU + 1 
6cc3 : a9 00 __ LDA #$00
6cc5 : 85 1d __ STA ACCU + 2 
.l6:
6cc7 : 0a __ __ ASL
6cc8 : 18 __ __ CLC
6cc9 : 65 14 __ ADC P7 ; (lat_j + 0)
6ccb : 85 45 __ STA T4 + 0 
6ccd : aa __ __ TAX
6cce : a8 __ __ TAY
6ccf : c8 __ __ INY
6cd0 : 24 45 __ BIT T4 + 0 
6cd2 : 10 03 __ BPL $6cd7 ; (tunnel_render.s7 + 0)
6cd4 : 4c e4 6d JMP $6de4 ; (tunnel_render.s13 + 0)
.s7:
6cd7 : a9 4f __ LDA #$4f
6cd9 : c5 45 __ CMP T4 + 0 
6cdb : b0 02 __ BCS $6cdf ; (tunnel_render.s8 + 0)
.s12:
6cdd : 85 45 __ STA T4 + 0 
.s8:
6cdf : 8a __ __ TXA
6ce0 : 30 06 __ BMI $6ce8 ; (tunnel_render.s9 + 0)
.s20:
6ce2 : c9 4f __ CMP #$4f
6ce4 : 90 02 __ BCC $6ce8 ; (tunnel_render.s9 + 0)
.s11:
6ce6 : a0 4f __ LDY #$4f
.s9:
6ce8 : 84 47 __ STY T5 + 0 
6cea : a5 13 __ LDA P6 ; (t_dist + 0)
6cec : a6 45 __ LDX T4 + 0 
6cee : 18 __ __ CLC
6cef : 7d 50 9e ADC $9e50,x ; (row_buf[0] + 80)
6cf2 : 29 1f __ AND #$1f
6cf4 : 0a __ __ ASL
6cf5 : 0a __ __ ASL
6cf6 : 0a __ __ ASL
6cf7 : 0a __ __ ASL
6cf8 : 85 49 __ STA T6 + 0 
6cfa : a9 00 __ LDA #$00
6cfc : 2a __ __ ROL
6cfd : 06 49 __ ASL T6 + 0 
6cff : 2a __ __ ROL
6d00 : 85 4a __ STA T6 + 1 
6d02 : bd 00 9e LDA $9e00,x ; (row_buf[0] + 0)
6d05 : 85 45 __ STA T4 + 0 
6d07 : 65 12 __ ADC P5 ; (t_ang + 0)
6d09 : 29 1f __ AND #$1f
6d0b : 05 49 __ ORA T6 + 0 
6d0d : 18 __ __ CLC
6d0e : 69 a0 __ ADC #$a0
6d10 : 85 4d __ STA T9 + 0 
6d12 : a9 9e __ LDA #$9e
6d14 : 65 4a __ ADC T6 + 1 
6d16 : 85 4e __ STA T9 + 1 
6d18 : a0 00 __ LDY #$00
6d1a : b1 4d __ LDA (T9 + 0),y 
6d1c : aa __ __ TAX
6d1d : 4a __ __ LSR
6d1e : 85 50 __ STA T10 + 1 
6d20 : 98 __ __ TYA
6d21 : 6a __ __ ROR
6d22 : 66 50 __ ROR T10 + 1 
6d24 : 6a __ __ ROR
6d25 : 85 4f __ STA T10 + 0 
6d27 : 8a __ __ TXA
6d28 : 0a __ __ ASL
6d29 : 0a __ __ ASL
6d2a : 0a __ __ ASL
6d2b : 0a __ __ ASL
6d2c : 05 4f __ ORA T10 + 0 
6d2e : 85 4d __ STA T9 + 0 
6d30 : a6 47 __ LDX T5 + 0 
6d32 : bd 50 9e LDA $9e50,x ; (row_buf[0] + 80)
6d35 : 18 __ __ CLC
6d36 : 65 13 __ ADC P6 ; (t_dist + 0)
6d38 : 29 1f __ AND #$1f
6d3a : 0a __ __ ASL
6d3b : 0a __ __ ASL
6d3c : 0a __ __ ASL
6d3d : 0a __ __ ASL
6d3e : 85 4b __ STA T7 + 0 
6d40 : 98 __ __ TYA
6d41 : 2a __ __ ROL
6d42 : 06 4b __ ASL T7 + 0 
6d44 : 2a __ __ ROL
6d45 : 85 4c __ STA T7 + 1 
6d47 : bd 00 9e LDA $9e00,x ; (row_buf[0] + 0)
6d4a : 85 47 __ STA T5 + 0 
6d4c : 65 12 __ ADC P5 ; (t_ang + 0)
6d4e : 29 1f __ AND #$1f
6d50 : 05 4b __ ORA T7 + 0 
6d52 : 18 __ __ CLC
6d53 : 69 a0 __ ADC #$a0
6d55 : 85 4f __ STA T10 + 0 
6d57 : a9 9e __ LDA #$9e
6d59 : 65 4c __ ADC T7 + 1 
6d5b : 85 50 __ STA T10 + 1 
6d5d : b1 4f __ LDA (T10 + 0),y 
6d5f : 0a __ __ ASL
6d60 : 0a __ __ ASL
6d61 : 05 4d __ ORA T9 + 0 
6d63 : 11 4f __ ORA (T10 + 0),y 
6d65 : 91 43 __ STA (T1 + 0),y 
6d67 : 38 __ __ SEC
6d68 : a9 20 __ LDA #$20
6d6a : e5 45 __ SBC T4 + 0 
6d6c : 18 __ __ CLC
6d6d : 65 12 __ ADC P5 ; (t_ang + 0)
6d6f : 29 1f __ AND #$1f
6d71 : 05 49 __ ORA T6 + 0 
6d73 : 18 __ __ CLC
6d74 : 69 a0 __ ADC #$a0
6d76 : 85 45 __ STA T4 + 0 
6d78 : a9 9e __ LDA #$9e
6d7a : 65 4a __ ADC T6 + 1 
6d7c : 85 46 __ STA T4 + 1 
6d7e : b1 45 __ LDA (T4 + 0),y 
6d80 : aa __ __ TAX
6d81 : 4a __ __ LSR
6d82 : 85 4a __ STA T6 + 1 
6d84 : 98 __ __ TYA
6d85 : 6a __ __ ROR
6d86 : 66 4a __ ROR T6 + 1 
6d88 : 6a __ __ ROR
6d89 : 85 49 __ STA T6 + 0 
6d8b : 8a __ __ TXA
6d8c : 0a __ __ ASL
6d8d : 0a __ __ ASL
6d8e : 0a __ __ ASL
6d8f : 0a __ __ ASL
6d90 : 05 49 __ ORA T6 + 0 
6d92 : 85 45 __ STA T4 + 0 
6d94 : 38 __ __ SEC
6d95 : a9 20 __ LDA #$20
6d97 : e5 47 __ SBC T5 + 0 
6d99 : 18 __ __ CLC
6d9a : 65 12 __ ADC P5 ; (t_ang + 0)
6d9c : 29 1f __ AND #$1f
6d9e : 05 4b __ ORA T7 + 0 
6da0 : 18 __ __ CLC
6da1 : 69 a0 __ ADC #$a0
6da3 : 85 47 __ STA T5 + 0 
6da5 : a9 9e __ LDA #$9e
6da7 : 65 4c __ ADC T7 + 1 
6da9 : 85 48 __ STA T5 + 1 
6dab : b1 47 __ LDA (T5 + 0),y 
6dad : 0a __ __ ASL
6dae : 0a __ __ ASL
6daf : 05 45 __ ORA T4 + 0 
6db1 : 11 47 __ ORA (T5 + 0),y 
6db3 : 91 1b __ STA (ACCU + 0),y 
6db5 : 18 __ __ CLC
6db6 : a5 43 __ LDA T1 + 0 
6db8 : 69 08 __ ADC #$08
6dba : 85 43 __ STA T1 + 0 
6dbc : 90 03 __ BCC $6dc1 ; (tunnel_render.s17 + 0)
.s16:
6dbe : e6 44 __ INC T1 + 1 
6dc0 : 18 __ __ CLC
.s17:
6dc1 : a5 1b __ LDA ACCU + 0 
6dc3 : 69 08 __ ADC #$08
6dc5 : 85 1b __ STA ACCU + 0 
6dc7 : 90 02 __ BCC $6dcb ; (tunnel_render.s19 + 0)
.s18:
6dc9 : e6 1c __ INC ACCU + 1 
.s19:
6dcb : e6 1d __ INC ACCU + 2 
6dcd : a5 1d __ LDA ACCU + 2 
6dcf : c9 28 __ CMP #$28
6dd1 : f0 03 __ BEQ $6dd6 ; (tunnel_render.s10 + 0)
6dd3 : 4c c7 6c JMP $6cc7 ; (tunnel_render.l6 + 0)
.s10:
6dd6 : e6 51 __ INC T12 + 0 
6dd8 : e6 52 __ INC T13 + 0 
6dda : a5 52 __ LDA T13 + 0 
6ddc : c9 64 __ CMP #$64
6dde : f0 03 __ BEQ $6de3 ; (tunnel_render.s3 + 0)
6de0 : 4c 67 6c JMP $6c67 ; (tunnel_render.l5 + 0)
.s3:
6de3 : 60 __ __ RTS
.s13:
6de4 : a9 00 __ LDA #$00
6de6 : 85 45 __ STA T4 + 0 
6de8 : 8a __ __ TXA
6de9 : 30 03 __ BMI $6dee ; (tunnel_render.s15 + 0)
6deb : 4c e2 6c JMP $6ce2 ; (tunnel_render.s20 + 0)
.s15:
6dee : e0 ff __ CPX #$ff
6df0 : 90 03 __ BCC $6df5 ; (tunnel_render.s14 + 0)
6df2 : 4c df 6c JMP $6cdf ; (tunnel_render.s8 + 0)
.s14:
6df5 : a0 00 __ LDY #$00
6df7 : 4c e8 6c JMP $6ce8 ; (tunnel_render.s9 + 0)
--------------------------------------------------------------------
modplay_stop: ; modplay_stop()->void
; 249, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s4:
6dfa : 78 __ __ SEI
6dfb : a9 00 __ LDA #$00
6dfd : 8d 98 97 STA $9798 ; (modplay.active + 0)
6e00 : 8d 20 df STA $df20 
6e03 : 8d 40 df STA $df40 
6e06 : 8d 60 df STA $df60 
6e09 : 8d 80 df STA $df80 
6e0c : ad fe 78 LDA $78fe ; (mod_saved_irq[0] + 0)
6e0f : 8d 14 03 STA $0314 
6e12 : ad ff 78 LDA $78ff ; (mod_saved_irq[0] + 1)
6e15 : 8d 15 03 STA $0315 
6e18 : a9 7f __ LDA #$7f
6e1a : 8d 0d dc STA $dc0d 
6e1d : a9 25 __ LDA #$25
6e1f : 8d 04 dc STA $dc04 
6e22 : a9 4d __ LDA #$4d
6e24 : 8d 05 dc STA $dc05 
6e27 : a9 81 __ LDA #$81
6e29 : 8d 0d dc STA $dc0d 
6e2c : a9 01 __ LDA #$01
6e2e : 8d 0e dc STA $dc0e 
6e31 : 58 __ __ CLI
.s3:
6e32 : 60 __ __ RTS
--------------------------------------------------------------------
scroller_run: ; scroller_run()->void
;   3, "/home/xahmol/git/UltimateDemo2026/src/scroller.h"
.s4:
6e33 : a9 00 __ LDA #$00
6e35 : 8d be 83 STA $83be ; (loops + 0)
6e38 : 8d bf 83 STA $83bf ; (loops + 1)
6e3b : 8d ff 7f STA $7fff ; (done + 0)
6e3e : 8d fe 7f STA $7ffe ; (plasma_phase + 0)
6e41 : 8d fd 7f STA $7ffd ; (wave_phase + 0)
6e44 : 8d ff 7c STA $7cff ; (insert_col + 0)
6e47 : 8d fe 79 STA $79fe ; (txt_pos + 0)
6e4a : 8d ff 79 STA $79ff ; (txt_pos + 1)
6e4d : a9 07 __ LDA #$07
6e4f : 8d fc 7f STA $7ffc ; (fine_x + 0)
6e52 : 20 5a 6f JSR $6f5a ; (scr_init.s4 + 0)
6e55 : a9 00 __ LDA #$00
6e57 : 8d 20 d0 STA $d020 
.l5:
6e5a : 2c 11 d0 BIT $d011 
6e5d : 30 fb __ BMI $6e5a ; (scroller_run.l5 + 0)
.l6:
6e5f : 2c 11 d0 BIT $d011 
6e62 : 10 fb __ BPL $6e5f ; (scroller_run.l6 + 0)
.s7:
6e64 : a9 00 __ LDA #$00
6e66 : 8d 00 dc STA $dc00 
6e69 : ad 01 dc LDA $dc01 
6e6c : 85 43 __ STA T0 + 0 
6e6e : a9 ff __ LDA #$ff
6e70 : 8d 00 dc STA $dc00 
6e73 : c5 43 __ CMP T0 + 0 
6e75 : f0 05 __ BEQ $6e7c ; (scroller_run.s8 + 0)
.s20:
6e77 : a9 01 __ LDA #$01
6e79 : 8d ff 7f STA $7fff ; (done + 0)
.s8:
6e7c : ad fc 7f LDA $7ffc ; (fine_x + 0)
6e7f : f0 06 __ BEQ $6e87 ; (scroller_run.s9 + 0)
.s19:
6e81 : ce fc 7f DEC $7ffc ; (fine_x + 0)
6e84 : 4c 17 6f JMP $6f17 ; (scroller_run.s11 + 0)
.s9:
6e87 : a9 07 __ LDA #$07
6e89 : 8d fc 7f STA $7ffc ; (fine_x + 0)
6e8c : a2 00 __ LDX #$00
.l21:
6e8e : bd c1 83 LDA $83c1,x ; (scr_letter[0] + 1)
6e91 : 9d c0 83 STA $83c0,x ; (scr_letter[0] + 0)
6e94 : bd c9 84 LDA $84c9,x ; (scr_col[0] + 1)
6e97 : 9d c8 84 STA $84c8,x ; (scr_col[0] + 0)
6e9a : e8 __ __ INX
6e9b : e0 27 __ CPX #$27
6e9d : d0 ef __ BNE $6e8e ; (scroller_run.l21 + 0)
.s22:
6e9f : 18 __ __ CLC
6ea0 : a9 40 __ LDA #$40
6ea2 : 6d fe 79 ADC $79fe ; (txt_pos + 0)
6ea5 : 85 43 __ STA T0 + 0 
6ea7 : a9 80 __ LDA #$80
6ea9 : 6d ff 79 ADC $79ff ; (txt_pos + 1)
6eac : 85 44 __ STA T0 + 1 
6eae : a0 00 __ LDY #$00
6eb0 : b1 43 __ LDA (T0 + 0),y 
6eb2 : 20 c0 6f JSR $6fc0 ; (letter_idx.s4 + 0)
6eb5 : aa __ __ TAX
6eb6 : ad ff 7c LDA $7cff ; (insert_col + 0)
6eb9 : dd 36 82 CMP $8236,x ; (letter_width[0] + 0)
6ebc : b0 0b __ BCS $6ec9 ; (scroller_run.s10 + 0)
.s18:
6ebe : 8e e7 83 STX $83e7 ; (scr_letter[0] + 39)
6ec1 : 8d ef 84 STA $84ef ; (scr_col[0] + 39)
6ec4 : ee ff 7c INC $7cff ; (insert_col + 0)
6ec7 : 90 4e __ BCC $6f17 ; (scroller_run.s11 + 0)
.s10:
6ec9 : a9 00 __ LDA #$00
6ecb : 8d ff 7c STA $7cff ; (insert_col + 0)
6ece : 8d ef 84 STA $84ef ; (scr_col[0] + 39)
6ed1 : ad fe 79 LDA $79fe ; (txt_pos + 0)
6ed4 : 69 00 __ ADC #$00
6ed6 : 8d fe 79 STA $79fe ; (txt_pos + 0)
6ed9 : a9 34 __ LDA #$34
6edb : 8d e7 83 STA $83e7 ; (scr_letter[0] + 39)
6ede : ad ff 79 LDA $79ff ; (txt_pos + 1)
6ee1 : 69 00 __ ADC #$00
6ee3 : 8d ff 79 STA $79ff ; (txt_pos + 1)
6ee6 : c9 01 __ CMP #$01
6ee8 : d0 05 __ BNE $6eef ; (scroller_run.s17 + 0)
.s16:
6eea : ad fe 79 LDA $79fe ; (txt_pos + 0)
6eed : c9 f5 __ CMP #$f5
.s17:
6eef : 90 26 __ BCC $6f17 ; (scroller_run.s11 + 0)
.s13:
6ef1 : a9 00 __ LDA #$00
6ef3 : 8d fe 79 STA $79fe ; (txt_pos + 0)
6ef6 : 8d ff 79 STA $79ff ; (txt_pos + 1)
6ef9 : ad be 83 LDA $83be ; (loops + 0)
6efc : 69 00 __ ADC #$00
6efe : 8d be 83 STA $83be ; (loops + 0)
6f01 : ad bf 83 LDA $83bf ; (loops + 1)
6f04 : 69 00 __ ADC #$00
6f06 : 8d bf 83 STA $83bf ; (loops + 1)
6f09 : d0 07 __ BNE $6f12 ; (scroller_run.s14 + 0)
.s15:
6f0b : ad be 83 LDA $83be ; (loops + 0)
6f0e : c9 02 __ CMP #$02
6f10 : 90 05 __ BCC $6f17 ; (scroller_run.s11 + 0)
.s14:
6f12 : a9 01 __ LDA #$01
6f14 : 8d ff 7f STA $7fff ; (done + 0)
.s11:
6f17 : 20 8b 70 JSR $708b ; (draw_frame.s4 + 0)
6f1a : ee fd 7f INC $7ffd ; (wave_phase + 0)
6f1d : ee fe 7f INC $7ffe ; (plasma_phase + 0)
6f20 : ad 16 d0 LDA $d016 
6f23 : 29 f8 __ AND #$f8
6f25 : 0d fc 7f ORA $7ffc ; (fine_x + 0)
6f28 : 8d 16 d0 STA $d016 
6f2b : ad ff 7f LDA $7fff ; (done + 0)
6f2e : d0 03 __ BNE $6f33 ; (scr_done.s4 + 0)
6f30 : 4c 5a 6e JMP $6e5a ; (scroller_run.l5 + 0)
--------------------------------------------------------------------
scr_done: ; scr_done()->void
; 364, "/home/xahmol/git/UltimateDemo2026/src/scroller.c"
.s4:
6f33 : ad 16 d0 LDA $d016 
6f36 : 29 f8 __ AND #$f8
6f38 : 8d 16 d0 STA $d016 
6f3b : a9 00 __ LDA #$00
6f3d : 85 0d __ STA P0 
6f3f : 85 0e __ STA P1 
6f41 : 85 10 __ STA P3 
6f43 : 20 0e 0f JSR $0f0e ; (vic_setmode@proxy + 0)
6f46 : a9 20 __ LDA #$20
6f48 : a2 fa __ LDX #$fa
.l5:
6f4a : ca __ __ DEX
6f4b : 9d 00 04 STA $0400,x 
6f4e : 9d fa 04 STA $04fa,x 
6f51 : 9d f4 05 STA $05f4,x 
6f54 : 9d ee 06 STA $06ee,x 
6f57 : d0 f1 __ BNE $6f4a ; (scr_done.l5 + 0)
.s3:
6f59 : 60 __ __ RTS
--------------------------------------------------------------------
scr_init: ; scr_init()->void
; 344, "/home/xahmol/git/UltimateDemo2026/src/scroller.c"
.s4:
6f5a : a9 00 __ LDA #$00
6f5c : 85 0d __ STA P0 
6f5e : 85 43 __ STA T0 + 0 
6f60 : 85 0e __ STA P1 
6f62 : 85 10 __ STA P3 
6f64 : a9 04 __ LDA #$04
6f66 : 85 44 __ STA T0 + 1 
6f68 : 85 0f __ STA P2 
6f6a : a9 10 __ LDA #$10
6f6c : 85 11 __ STA P4 
6f6e : 20 16 0f JSR $0f16 ; (vic_setmode.s4 + 0)
6f71 : a9 00 __ LDA #$00
6f73 : 8d 21 d0 STA $d021 
6f76 : 8d 20 d0 STA $d020 
6f79 : 85 1f __ STA ADDR + 0 
6f7b : f0 02 __ BEQ $6f7f ; (scr_init.l8 + 0)
.s10:
6f7d : e6 44 __ INC T0 + 1 
.l8:
6f7f : a9 20 __ LDA #$20
6f81 : a0 00 __ LDY #$00
6f83 : 91 43 __ STA (T0 + 0),y 
6f85 : 18 __ __ CLC
6f86 : a5 44 __ LDA T0 + 1 
6f88 : 69 d4 __ ADC #$d4
6f8a : 85 20 __ STA ADDR + 1 
6f8c : a9 06 __ LDA #$06
6f8e : a4 43 __ LDY T0 + 0 
6f90 : 91 1f __ STA (ADDR + 0),y 
6f92 : 98 __ __ TYA
6f93 : 18 __ __ CLC
6f94 : 69 01 __ ADC #$01
6f96 : 85 43 __ STA T0 + 0 
6f98 : b0 e3 __ BCS $6f7d ; (scr_init.s10 + 0)
.s11:
6f9a : c9 e8 __ CMP #$e8
6f9c : d0 e1 __ BNE $6f7f ; (scr_init.l8 + 0)
.s7:
6f9e : a5 44 __ LDA T0 + 1 
6fa0 : c9 07 __ CMP #$07
6fa2 : d0 db __ BNE $6f7f ; (scr_init.l8 + 0)
.s5:
6fa4 : a2 00 __ LDX #$00
.l9:
6fa6 : a9 34 __ LDA #$34
6fa8 : 9d c0 83 STA $83c0,x ; (scr_letter[0] + 0)
6fab : a9 00 __ LDA #$00
6fad : 9d c8 84 STA $84c8,x ; (scr_col[0] + 0)
6fb0 : e8 __ __ INX
6fb1 : e0 28 __ CPX #$28
6fb3 : d0 f1 __ BNE $6fa6 ; (scr_init.l9 + 0)
.s6:
6fb5 : ad 16 d0 LDA $d016 
6fb8 : 29 f8 __ AND #$f8
6fba : 09 07 __ ORA #$07
6fbc : 8d 16 d0 STA $d016 
.s3:
6fbf : 60 __ __ RTS
--------------------------------------------------------------------
letter_idx: ; letter_idx(u8)->u8
; 304, "/home/xahmol/git/UltimateDemo2026/src/scroller.c"
.s4:
6fc0 : c9 61 __ CMP #$61
6fc2 : 90 07 __ BCC $6fcb ; (letter_idx.s5 + 0)
.s61:
6fc4 : c9 7b __ CMP #$7b
6fc6 : b0 03 __ BCS $6fcb ; (letter_idx.s5 + 0)
.s62:
6fc8 : e9 60 __ SBC #$60
.s3:
6fca : 60 __ __ RTS
.s5:
6fcb : c9 41 __ CMP #$41
6fcd : 90 07 __ BCC $6fd6 ; (letter_idx.s6 + 0)
.s59:
6fcf : c9 5b __ CMP #$5b
6fd1 : b0 03 __ BCS $6fd6 ; (letter_idx.s6 + 0)
.s60:
6fd3 : 69 d9 __ ADC #$d9
6fd5 : 60 __ __ RTS
.s6:
6fd6 : c9 30 __ CMP #$30
6fd8 : b0 03 __ BCS $6fdd ; (letter_idx.s57 + 0)
6fda : 4c 81 70 JMP $7081 ; (letter_idx.s7 + 0)
.s57:
6fdd : c9 3a __ CMP #$3a
6fdf : b0 03 __ BCS $6fe4 ; (letter_idx.s8 + 0)
.s58:
6fe1 : 69 05 __ ADC #$05
6fe3 : 60 __ __ RTS
.s8:
6fe4 : c9 2d __ CMP #$2d
6fe6 : 90 4e __ BCC $7036 ; (letter_idx.s33 + 0)
.s9:
6fe8 : c9 3d __ CMP #$3d
6fea : d0 03 __ BNE $6fef ; (letter_idx.s10 + 0)
.s32:
6fec : a9 4d __ LDA #$4d
6fee : 60 __ __ RTS
.s10:
6fef : 90 24 __ BCC $7015 ; (letter_idx.s22 + 0)
.s11:
6ff1 : c9 40 __ CMP #$40
6ff3 : d0 03 __ BNE $6ff8 ; (letter_idx.s12 + 0)
.s21:
6ff5 : a9 54 __ LDA #$54
6ff7 : 60 __ __ RTS
.s12:
6ff8 : 90 11 __ BCC $700b ; (letter_idx.s18 + 0)
.s13:
6ffa : c9 5b __ CMP #$5b
6ffc : d0 03 __ BNE $7001 ; (letter_idx.s14 + 0)
.s17:
6ffe : a9 53 __ LDA #$53
7000 : 60 __ __ RTS
.s14:
7001 : c9 5d __ CMP #$5d
7003 : d0 03 __ BNE $7008 ; (letter_idx.s15 + 0)
.s16:
7005 : a9 55 __ LDA #$55
7007 : 60 __ __ RTS
.s15:
7008 : a9 34 __ LDA #$34
700a : 60 __ __ RTS
.s18:
700b : c9 3e __ CMP #$3e
700d : d0 03 __ BNE $7012 ; (letter_idx.s19 + 0)
.s20:
700f : a9 52 __ LDA #$52
7011 : 60 __ __ RTS
.s19:
7012 : a9 4c __ LDA #$4c
7014 : 60 __ __ RTS
.s22:
7015 : c9 3a __ CMP #$3a
7017 : d0 03 __ BNE $701c ; (letter_idx.s23 + 0)
.s31:
7019 : a9 3f __ LDA #$3f
701b : 60 __ __ RTS
.s23:
701c : 90 0a __ BCC $7028 ; (letter_idx.s27 + 0)
.s24:
701e : c9 3b __ CMP #$3b
7020 : d0 03 __ BNE $7025 ; (letter_idx.s25 + 0)
.s26:
7022 : a9 42 __ LDA #$42
7024 : 60 __ __ RTS
.s25:
7025 : a9 50 __ LDA #$50
7027 : 60 __ __ RTS
.s27:
7028 : c9 2e __ CMP #$2e
702a : d0 03 __ BNE $702f ; (letter_idx.s28 + 0)
.s30:
702c : a9 40 __ LDA #$40
702e : 60 __ __ RTS
.s28:
702f : c9 2f __ CMP #$2f
7031 : d0 d5 __ BNE $7008 ; (letter_idx.s15 + 0)
.s29:
7033 : a9 44 __ LDA #$44
7035 : 60 __ __ RTS
.s33:
7036 : c9 26 __ CMP #$26
7038 : d0 03 __ BNE $703d ; (letter_idx.s34 + 0)
.s55:
703a : a9 48 __ LDA #$48
703c : 60 __ __ RTS
.s34:
703d : 90 21 __ BCC $7060 ; (letter_idx.s45 + 0)
.s35:
703f : c9 29 __ CMP #$29
7041 : d0 03 __ BNE $7046 ; (letter_idx.s36 + 0)
.s44:
7043 : a9 51 __ LDA #$51
7045 : 60 __ __ RTS
.s36:
7046 : 90 0e __ BCC $7056 ; (letter_idx.s41 + 0)
.s37:
7048 : c9 2b __ CMP #$2b
704a : d0 03 __ BNE $704f ; (letter_idx.s38 + 0)
.s40:
704c : a9 4b __ LDA #$4b
704e : 60 __ __ RTS
.s38:
704f : c9 2c __ CMP #$2c
7051 : d0 b5 __ BNE $7008 ; (letter_idx.s15 + 0)
.s39:
7053 : a9 43 __ LDA #$43
7055 : 60 __ __ RTS
.s41:
7056 : c9 27 __ CMP #$27
7058 : d0 03 __ BNE $705d ; (letter_idx.s42 + 0)
.s43:
705a : a9 45 __ LDA #$45
705c : 60 __ __ RTS
.s42:
705d : a9 4f __ LDA #$4f
705f : 60 __ __ RTS
.s45:
7060 : c9 23 __ CMP #$23
7062 : d0 03 __ BNE $7067 ; (letter_idx.s46 + 0)
.s54:
7064 : a9 4e __ LDA #$4e
7066 : 60 __ __ RTS
.s46:
7067 : 90 0a __ BCC $7073 ; (letter_idx.s50 + 0)
.s47:
7069 : c9 24 __ CMP #$24
706b : d0 03 __ BNE $7070 ; (letter_idx.s48 + 0)
.s49:
706d : a9 47 __ LDA #$47
706f : 60 __ __ RTS
.s48:
7070 : a9 49 __ LDA #$49
7072 : 60 __ __ RTS
.s50:
7073 : c9 21 __ CMP #$21
7075 : d0 03 __ BNE $707a ; (letter_idx.s51 + 0)
.s53:
7077 : a9 41 __ LDA #$41
7079 : 60 __ __ RTS
.s51:
707a : c9 22 __ CMP #$22
707c : d0 8a __ BNE $7008 ; (letter_idx.s15 + 0)
.s52:
707e : a9 46 __ LDA #$46
7080 : 60 __ __ RTS
.s7:
7081 : c9 2d __ CMP #$2d
7083 : f0 03 __ BEQ $7088 ; (letter_idx.s56 + 0)
7085 : 4c e4 6f JMP $6fe4 ; (letter_idx.s8 + 0)
.s56:
7088 : a9 4a __ LDA #$4a
708a : 60 __ __ RTS
--------------------------------------------------------------------
draw_frame: ; draw_frame()->void
; 406, "/home/xahmol/git/UltimateDemo2026/src/scroller.c"
.s4:
708b : ad fe 7f LDA $7ffe ; (plasma_phase + 0)
708e : 85 1c __ STA ACCU + 1 
7090 : 0a __ __ ASL
7091 : 85 43 __ STA T1 + 0 
7093 : a9 00 __ LDA #$00
7095 : 8d e8 83 STA $83e8 ; (dp_y + 0)
7098 : 85 1f __ STA ADDR + 0 
709a : 85 47 __ STA T4 + 0 
.l5:
709c : ad e8 83 LDA $83e8 ; (dp_y + 0)
709f : 85 1d __ STA ACCU + 2 
70a1 : 0a __ __ ASL
70a2 : 85 1b __ STA ACCU + 0 
70a4 : a9 00 __ LDA #$00
70a6 : 2a __ __ ROL
70a7 : 06 1b __ ASL ACCU + 0 
70a9 : 2a __ __ ROL
70aa : aa __ __ TAX
70ab : a5 1b __ LDA ACCU + 0 
70ad : 65 1d __ ADC ACCU + 2 
70af : 85 45 __ STA T3 + 0 
70b1 : 8a __ __ TXA
70b2 : 69 00 __ ADC #$00
70b4 : 06 45 __ ASL T3 + 0 
70b6 : 2a __ __ ROL
70b7 : 06 45 __ ASL T3 + 0 
70b9 : 2a __ __ ROL
70ba : 06 45 __ ASL T3 + 0 
70bc : 2a __ __ ROL
70bd : 69 04 __ ADC #$04
70bf : 85 48 __ STA T4 + 1 
70c1 : a5 1d __ LDA ACCU + 2 
70c3 : 0a __ __ ASL
70c4 : 0a __ __ ASL
70c5 : 0a __ __ ASL
70c6 : 18 __ __ CLC
70c7 : 65 1d __ ADC ACCU + 2 
70c9 : 18 __ __ CLC
70ca : 65 43 __ ADC T1 + 0 
70cc : 29 3f __ AND #$3f
70ce : aa __ __ TAX
70cf : bd 8c 82 LDA $828c,x ; (psin[0] + 0)
70d2 : 85 1b __ STA ACCU + 0 
70d4 : a5 1c __ LDA ACCU + 1 
70d6 : 85 49 __ STA T5 + 0 
70d8 : a9 28 __ LDA #$28
70da : 85 1e __ STA ACCU + 3 
70dc : a4 45 __ LDY T3 + 0 
.l33:
70de : a9 a0 __ LDA #$a0
70e0 : 91 47 __ STA (T4 + 0),y 
70e2 : a5 49 __ LDA T5 + 0 
70e4 : 29 3f __ AND #$3f
70e6 : aa __ __ TAX
70e7 : bd 8c 82 LDA $828c,x ; (psin[0] + 0)
70ea : 18 __ __ CLC
70eb : 65 1b __ ADC ACCU + 0 
70ed : 4a __ __ LSR
70ee : aa __ __ TAX
70ef : 18 __ __ CLC
70f0 : a5 48 __ LDA T4 + 1 
70f2 : 69 d4 __ ADC #$d4
70f4 : 85 20 __ STA ADDR + 1 
70f6 : bd cc 82 LDA $82cc,x ; (pcolor[0] + 0)
70f9 : 91 1f __ STA (ADDR + 0),y 
70fb : 18 __ __ CLC
70fc : a5 49 __ LDA T5 + 0 
70fe : 69 05 __ ADC #$05
7100 : 85 49 __ STA T5 + 0 
7102 : c8 __ __ INY
7103 : d0 02 __ BNE $7107 ; (draw_frame.s38 + 0)
.s37:
7105 : e6 48 __ INC T4 + 1 
.s38:
7107 : c6 1e __ DEC ACCU + 3 
7109 : d0 d3 __ BNE $70de ; (draw_frame.l33 + 0)
.s34:
710b : a6 1d __ LDX ACCU + 2 
710d : e8 __ __ INX
710e : 8e e8 83 STX $83e8 ; (dp_y + 0)
7111 : e0 19 __ CPX #$19
7113 : 90 87 __ BCC $709c ; (draw_frame.l5 + 0)
.s6:
7115 : a9 00 __ LDA #$00
7117 : 8d e9 83 STA $83e9 ; (df_x + 0)
.l7:
711a : ae e9 83 LDX $83e9 ; (df_x + 0)
711d : 86 1b __ STX ACCU + 0 
711f : 86 1c __ STX ACCU + 1 
7121 : a9 63 __ LDA #$63
7123 : 9d 40 05 STA $0540,x 
7126 : a9 0b __ LDA #$0b
7128 : 9d 40 d9 STA $d940,x 
712b : 8a __ __ TXA
712c : 18 __ __ CLC
712d : 69 68 __ ADC #$68
712f : a8 __ __ TAY
7130 : a9 05 __ LDA #$05
7132 : 69 00 __ ADC #$00
7134 : 85 44 __ STA T1 + 1 
7136 : a9 00 __ LDA #$00
7138 : 85 43 __ STA T1 + 0 
713a : a2 07 __ LDX #$07
.l35:
713c : a9 20 __ LDA #$20
713e : 91 43 __ STA (T1 + 0),y 
7140 : a5 44 __ LDA T1 + 1 
7142 : 69 d4 __ ADC #$d4
7144 : 85 20 __ STA ADDR + 1 
7146 : a9 00 __ LDA #$00
7148 : 91 1f __ STA (ADDR + 0),y 
714a : 98 __ __ TYA
714b : 18 __ __ CLC
714c : 69 28 __ ADC #$28
714e : a8 __ __ TAY
714f : 90 03 __ BCC $7154 ; (draw_frame.s40 + 0)
.s39:
7151 : e6 44 __ INC T1 + 1 
7153 : 18 __ __ CLC
.s40:
7154 : ca __ __ DEX
7155 : d0 e5 __ BNE $713c ; (draw_frame.l35 + 0)
.s36:
7157 : a9 07 __ LDA #$07
7159 : 8d ea 83 STA $83ea ; (df_r + 0)
715c : a9 64 __ LDA #$64
715e : a4 1c __ LDY ACCU + 1 
7160 : 99 80 06 STA $0680,y 
7163 : a9 0b __ LDA #$0b
7165 : 99 80 da STA $da80,y 
7168 : b9 c8 84 LDA $84c8,y ; (scr_col[0] + 0)
716b : 85 43 __ STA T1 + 0 
716d : b9 c0 83 LDA $83c0,y ; (scr_letter[0] + 0)
7170 : c9 34 __ CMP #$34
7172 : d0 0b __ BNE $717f ; (draw_frame.s9 + 0)
.s8:
7174 : a6 1b __ LDX ACCU + 0 
7176 : e8 __ __ INX
7177 : 8e e9 83 STX $83e9 ; (df_x + 0)
717a : e0 28 __ CPX #$28
717c : 90 9c __ BCC $711a ; (draw_frame.l7 + 0)
.s3:
717e : 60 __ __ RTS
.s9:
717f : 8e ea 83 STX $83ea ; (df_r + 0)
7182 : 85 1d __ STA ACCU + 2 
7184 : c9 0d __ CMP #$0d
7186 : 8a __ __ TXA
7187 : 6a __ __ ROR
7188 : 85 1e __ STA ACCU + 3 
.l10:
718a : ad ea 83 LDA $83ea ; (df_r + 0)
718d : 85 4b __ STA T9 + 0 
718f : 18 __ __ CLC
7190 : 69 0a __ ADC #$0a
7192 : aa __ __ TAX
7193 : bd 00 78 LDA $7800,x ; (__multab40L + 0)
7196 : 65 1c __ ADC ACCU + 1 
7198 : 85 47 __ STA T4 + 0 
719a : bc 10 78 LDY $7810,x ; (__multab40H + 0)
719d : 90 02 __ BCC $71a1 ; (draw_frame.s42 + 0)
.s41:
719f : c8 __ __ INY
71a0 : 18 __ __ CLC
.s42:
71a1 : a6 4b __ LDX T9 + 0 
71a3 : bd 00 78 LDA $7800,x ; (__multab40L + 0)
71a6 : a6 1d __ LDX ACCU + 2 
71a8 : 7d 00 83 ADC $8300,x ; (letter_start[0] + 0)
71ab : 18 __ __ CLC
71ac : 65 43 __ ADC T1 + 0 
71ae : 85 45 __ STA T3 + 0 
71b0 : 24 1e __ BIT ACCU + 3 
71b2 : 30 0a __ BMI $71be ; (draw_frame.s11 + 0)
.s32:
71b4 : 18 __ __ CLC
71b5 : 69 00 __ ADC #$00
71b7 : 85 49 __ STA T5 + 0 
71b9 : a9 84 __ LDA #$84
71bb : 4c f9 71 JMP $71f9 ; (draw_frame.s16 + 0)
.s11:
71be : e0 1a __ CPX #$1a
71c0 : b0 09 __ BCS $71cb ; (draw_frame.s12 + 0)
.s31:
71c2 : 69 00 __ ADC #$00
71c4 : 85 49 __ STA T5 + 0 
71c6 : a9 85 __ LDA #$85
71c8 : 4c f9 71 JMP $71f9 ; (draw_frame.s16 + 0)
.s12:
71cb : e0 28 __ CPX #$28
71cd : b0 09 __ BCS $71d8 ; (draw_frame.s13 + 0)
.s30:
71cf : 69 00 __ ADC #$00
71d1 : 85 49 __ STA T5 + 0 
71d3 : a9 86 __ LDA #$86
71d5 : 4c f9 71 JMP $71f9 ; (draw_frame.s16 + 0)
.s13:
71d8 : e0 34 __ CPX #$34
71da : b0 09 __ BCS $71e5 ; (draw_frame.s14 + 0)
.s29:
71dc : 69 00 __ ADC #$00
71de : 85 49 __ STA T5 + 0 
71e0 : a9 87 __ LDA #$87
71e2 : 4c f9 71 JMP $71f9 ; (draw_frame.s16 + 0)
.s14:
71e5 : e0 47 __ CPX #$47
71e7 : 90 0a __ BCC $71f3 ; (draw_frame.s28 + 0)
.s15:
71e9 : 18 __ __ CLC
71ea : 69 00 __ ADC #$00
71ec : 85 49 __ STA T5 + 0 
71ee : a9 89 __ LDA #$89
71f0 : 4c f9 71 JMP $71f9 ; (draw_frame.s16 + 0)
.s28:
71f3 : 69 00 __ ADC #$00
71f5 : 85 49 __ STA T5 + 0 
71f7 : a9 88 __ LDA #$88
.s16:
71f9 : 69 00 __ ADC #$00
71fb : 85 4a __ STA T5 + 1 
71fd : 98 __ __ TYA
71fe : 18 __ __ CLC
71ff : 69 04 __ ADC #$04
7201 : 85 48 __ STA T4 + 1 
7203 : a0 00 __ LDY #$00
7205 : b1 49 __ LDA (T5 + 0),y 
7207 : 91 47 __ STA (T4 + 0),y 
7209 : 24 1e __ BIT ACCU + 3 
720b : 30 0c __ BMI $7219 ; (draw_frame.s17 + 0)
.s27:
720d : 18 __ __ CLC
720e : a9 00 __ LDA #$00
7210 : 65 45 __ ADC T3 + 0 
7212 : 85 45 __ STA T3 + 0 
7214 : a9 8a __ LDA #$8a
7216 : 4c 5f 72 JMP $725f ; (draw_frame.s22 + 0)
.s17:
7219 : 8a __ __ TXA
721a : e0 1a __ CPX #$1a
721c : b0 0b __ BCS $7229 ; (draw_frame.s18 + 0)
.s26:
721e : a9 00 __ LDA #$00
7220 : 65 45 __ ADC T3 + 0 
7222 : 85 45 __ STA T3 + 0 
7224 : a9 8b __ LDA #$8b
7226 : 4c 5f 72 JMP $725f ; (draw_frame.s22 + 0)
.s18:
7229 : c9 28 __ CMP #$28
722b : b0 0b __ BCS $7238 ; (draw_frame.s19 + 0)
.s25:
722d : a9 00 __ LDA #$00
722f : 65 45 __ ADC T3 + 0 
7231 : 85 45 __ STA T3 + 0 
7233 : a9 8c __ LDA #$8c
7235 : 4c 5f 72 JMP $725f ; (draw_frame.s22 + 0)
.s19:
7238 : c9 34 __ CMP #$34
723a : b0 0b __ BCS $7247 ; (draw_frame.s20 + 0)
.s24:
723c : a9 00 __ LDA #$00
723e : 65 45 __ ADC T3 + 0 
7240 : 85 45 __ STA T3 + 0 
7242 : a9 8d __ LDA #$8d
7244 : 4c 5f 72 JMP $725f ; (draw_frame.s22 + 0)
.s20:
7247 : c9 47 __ CMP #$47
7249 : 90 0c __ BCC $7257 ; (draw_frame.s23 + 0)
.s21:
724b : 18 __ __ CLC
724c : a9 00 __ LDA #$00
724e : 65 45 __ ADC T3 + 0 
7250 : 85 45 __ STA T3 + 0 
7252 : a9 8f __ LDA #$8f
7254 : 4c 5f 72 JMP $725f ; (draw_frame.s22 + 0)
.s23:
7257 : a9 00 __ LDA #$00
7259 : 65 45 __ ADC T3 + 0 
725b : 85 45 __ STA T3 + 0 
725d : a9 8e __ LDA #$8e
.s22:
725f : 69 00 __ ADC #$00
7261 : 85 46 __ STA T3 + 1 
7263 : 18 __ __ CLC
7264 : a5 48 __ LDA T4 + 1 
7266 : 69 d4 __ ADC #$d4
7268 : 85 48 __ STA T4 + 1 
726a : b1 45 __ LDA (T3 + 0),y 
726c : 91 47 __ STA (T4 + 0),y 
726e : a6 4b __ LDX T9 + 0 
7270 : e8 __ __ INX
7271 : 8e ea 83 STX $83ea ; (df_r + 0)
7274 : e0 05 __ CPX #$05
7276 : b0 03 __ BCS $727b ; (draw_frame.s22 + 28)
7278 : 4c 8a 71 JMP $718a ; (draw_frame.l10 + 0)
727b : 4c 74 71 JMP $7174 ; (draw_frame.s8 + 0)
--------------------------------------------------------------------
727e : __ __ __ BYT 65 4e 44 20 4f 46 20 64 45 4d 4f 20 73 45 51 55 : eND OF dEMO sEQU
728e : __ __ __ BYT 45 4e 43 45 00                                  : ENCE.
--------------------------------------------------------------------
7293 : __ __ __ BYT 64 45 4d 4f 20 53 45 51 55 45 4e 43 45 20 43 4f : dEMO SEQUENCE CO
72a3 : __ __ __ BYT 4d 50 4c 45 54 45 2e 00                         : MPLETE..
--------------------------------------------------------------------
72ab : __ __ __ BYT 67 45 41 52 20 00                               : gEAR .
--------------------------------------------------------------------
72b1 : __ __ __ BYT 31 20 54 4f 20 36 34 20 6d 68 5a 2c 20 31 36 20 : 1 TO 64 mhZ, 16 
72c1 : __ __ __ BYT 53 54 45 50 53 00                               : STEPS.
--------------------------------------------------------------------
72c7 : __ __ __ BYT 62 41 4c 4c 20 00                               : bALL .
--------------------------------------------------------------------
72cd : __ __ __ BYT 33 64 20 42 41 4c 4c 20 2b 20 47 52 49 44 00    : 3d BALL + GRID.
--------------------------------------------------------------------
72dc : __ __ __ BYT 76 45 43 54 20 00                               : vECT .
--------------------------------------------------------------------
72e2 : __ __ __ BYT 33 64 20 57 49 52 45 46 52 41 4d 45 20 43 55 42 : 3d WIREFRAME CUB
72f2 : __ __ __ BYT 45 00                                           : E.
--------------------------------------------------------------------
72f4 : __ __ __ BYT 70 4c 41 53 20 00                               : pLAS .
--------------------------------------------------------------------
72fa : __ __ __ BYT 66 52 41 43 54 00                               : fRACT.
--------------------------------------------------------------------
7300 : __ __ __ BYT 70 4c 41 53 4d 41 20 49 4e 54 45 52 46 45 52 45 : pLASMA INTERFERE
7310 : __ __ __ BYT 4e 43 45 00                                     : NCE.
--------------------------------------------------------------------
7314 : __ __ __ BYT 6d 41 4e 44 45 4c 42 52 4f 54 20 6d 63 20 46 52 : mANDELBROT mc FR
7324 : __ __ __ BYT 41 43 54 41 4c 00                               : ACTAL.
--------------------------------------------------------------------
732a : __ __ __ BYT 74 55 4e 4c 20 00                               : tUNL .
--------------------------------------------------------------------
7330 : __ __ __ BYT 33 64 20 54 45 58 54 55 52 45 20 54 55 4e 4e 45 : 3d TEXTURE TUNNE
7340 : __ __ __ BYT 4c 00                                           : L.
--------------------------------------------------------------------
7342 : __ __ __ BYT 34 45 56 2e 4d 4f 44 3a 20 46 4f 52 45 56 45 52 : 4EV.MOD: FOREVER
7352 : __ __ __ BYT 20 59 4f 55 4e 47 00                            :  YOUNG.
--------------------------------------------------------------------
7359 : __ __ __ BYT 75 4c 54 49 4d 41 54 45 20 36 34 20 41 54 20 36 : uLTIMATE 64 AT 6
7369 : __ __ __ BYT 34 20 6d 68 5a 20 54 55 52 42 4f 3a 00          : 4 mhZ TURBO:.
--------------------------------------------------------------------
7376 : __ __ __ BYT 54 48 45 20 46 41 53 54 45 53 54 20 63 36 34 20 : THE FASTEST c64 
7386 : __ __ __ BYT 43 4f 4d 50 41 54 49 42 4c 45 2e 00             : COMPATIBLE..
--------------------------------------------------------------------
mul16by8: ; mul16by8
7392 : 4a __ __ LSR
7393 : f0 2e __ BEQ $73c3 ; (mul16by8 + 49)
7395 : a2 00 __ LDX #$00
7397 : a0 00 __ LDY #$00
7399 : 90 13 __ BCC $73ae ; (mul16by8 + 28)
739b : a4 1b __ LDY ACCU + 0 
739d : a6 1c __ LDX ACCU + 1 
739f : b0 0d __ BCS $73ae ; (mul16by8 + 28)
73a1 : 85 02 __ STA $02 
73a3 : 18 __ __ CLC
73a4 : 98 __ __ TYA
73a5 : 65 1b __ ADC ACCU + 0 
73a7 : a8 __ __ TAY
73a8 : 8a __ __ TXA
73a9 : 65 1c __ ADC ACCU + 1 
73ab : aa __ __ TAX
73ac : a5 02 __ LDA $02 
73ae : 06 1b __ ASL ACCU + 0 
73b0 : 26 1c __ ROL ACCU + 1 
73b2 : 4a __ __ LSR
73b3 : 90 f9 __ BCC $73ae ; (mul16by8 + 28)
73b5 : d0 ea __ BNE $73a1 ; (mul16by8 + 15)
73b7 : 18 __ __ CLC
73b8 : 98 __ __ TYA
73b9 : 65 1b __ ADC ACCU + 0 
73bb : 85 1b __ STA ACCU + 0 
73bd : 8a __ __ TXA
73be : 65 1c __ ADC ACCU + 1 
73c0 : 85 1c __ STA ACCU + 1 
73c2 : 60 __ __ RTS
73c3 : b0 04 __ BCS $73c9 ; (mul16by8 + 55)
73c5 : 85 1b __ STA ACCU + 0 
73c7 : 85 1c __ STA ACCU + 1 
73c9 : 60 __ __ RTS
--------------------------------------------------------------------
mul32by8: ; mul32by8
73ca : a0 00 __ LDY #$00
73cc : 84 07 __ STY WORK + 4 
73ce : 84 08 __ STY WORK + 5 
73d0 : 84 09 __ STY WORK + 6 
73d2 : 4a __ __ LSR
73d3 : b0 0d __ BCS $73e2 ; (mul32by8 + 24)
73d5 : f0 26 __ BEQ $73fd ; (mul32by8 + 51)
73d7 : 06 1b __ ASL ACCU + 0 
73d9 : 26 1c __ ROL ACCU + 1 
73db : 26 1d __ ROL ACCU + 2 
73dd : 26 1e __ ROL ACCU + 3 
73df : 4a __ __ LSR
73e0 : 90 f5 __ BCC $73d7 ; (mul32by8 + 13)
73e2 : aa __ __ TAX
73e3 : 18 __ __ CLC
73e4 : a5 07 __ LDA WORK + 4 
73e6 : 65 1b __ ADC ACCU + 0 
73e8 : 85 07 __ STA WORK + 4 
73ea : a5 08 __ LDA WORK + 5 
73ec : 65 1c __ ADC ACCU + 1 
73ee : 85 08 __ STA WORK + 5 
73f0 : a5 09 __ LDA WORK + 6 
73f2 : 65 1d __ ADC ACCU + 2 
73f4 : 85 09 __ STA WORK + 6 
73f6 : 98 __ __ TYA
73f7 : 65 1e __ ADC ACCU + 3 
73f9 : a8 __ __ TAY
73fa : 8a __ __ TXA
73fb : d0 da __ BNE $73d7 ; (mul32by8 + 13)
73fd : 84 0a __ STY WORK + 7 
73ff : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
7400 : a0 00 __ LDY #$00
7402 : 84 06 __ STY WORK + 3 
7404 : a5 03 __ LDA WORK + 0 
7406 : a6 04 __ LDX WORK + 1 
7408 : f0 1c __ BEQ $7426 ; (mul16 + 38)
740a : 38 __ __ SEC
740b : 6a __ __ ROR
740c : 90 0d __ BCC $741b ; (mul16 + 27)
740e : aa __ __ TAX
740f : 18 __ __ CLC
7410 : 98 __ __ TYA
7411 : 65 1b __ ADC ACCU + 0 
7413 : a8 __ __ TAY
7414 : a5 06 __ LDA WORK + 3 
7416 : 65 1c __ ADC ACCU + 1 
7418 : 85 06 __ STA WORK + 3 
741a : 8a __ __ TXA
741b : 06 1b __ ASL ACCU + 0 
741d : 26 1c __ ROL ACCU + 1 
741f : 4a __ __ LSR
7420 : 90 f9 __ BCC $741b ; (mul16 + 27)
7422 : d0 ea __ BNE $740e ; (mul16 + 14)
7424 : a5 04 __ LDA WORK + 1 
7426 : 4a __ __ LSR
7427 : 90 0d __ BCC $7436 ; (mul16 + 54)
7429 : aa __ __ TAX
742a : 18 __ __ CLC
742b : 98 __ __ TYA
742c : 65 1b __ ADC ACCU + 0 
742e : a8 __ __ TAY
742f : a5 06 __ LDA WORK + 3 
7431 : 65 1c __ ADC ACCU + 1 
7433 : 85 06 __ STA WORK + 3 
7435 : 8a __ __ TXA
7436 : 06 1b __ ASL ACCU + 0 
7438 : 26 1c __ ROL ACCU + 1 
743a : 4a __ __ LSR
743b : b0 ec __ BCS $7429 ; (mul16 + 41)
743d : d0 f7 __ BNE $7436 ; (mul16 + 54)
743f : 84 05 __ STY WORK + 2 
7441 : 60 __ __ RTS
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
7442 : a9 7f __ LDA #$7f
7444 : 85 03 __ STA WORK + 0 
--------------------------------------------------------------------
divs16: ; divs16
7446 : 24 1c __ BIT ACCU + 1 
7448 : 10 0d __ BPL $7457 ; (divs16 + 17)
744a : 20 61 74 JSR $7461 ; (negaccu + 0)
744d : 24 04 __ BIT WORK + 1 
744f : 10 0d __ BPL $745e ; (divs16 + 24)
7451 : 20 6f 74 JSR $746f ; (negtmp + 0)
7454 : 4c 81 74 JMP $7481 ; (divmod + 0)
7457 : 24 04 __ BIT WORK + 1 
7459 : 10 f9 __ BPL $7454 ; (divs16 + 14)
745b : 20 6f 74 JSR $746f ; (negtmp + 0)
745e : 20 81 74 JSR $7481 ; (divmod + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
7461 : 38 __ __ SEC
7462 : a9 00 __ LDA #$00
7464 : e5 1b __ SBC ACCU + 0 
7466 : 85 1b __ STA ACCU + 0 
7468 : a9 00 __ LDA #$00
746a : e5 1c __ SBC ACCU + 1 
746c : 85 1c __ STA ACCU + 1 
746e : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
746f : 38 __ __ SEC
7470 : a9 00 __ LDA #$00
7472 : e5 03 __ SBC WORK + 0 
7474 : 85 03 __ STA WORK + 0 
7476 : a9 00 __ LDA #$00
7478 : e5 04 __ SBC WORK + 1 
747a : 85 04 __ STA WORK + 1 
747c : 60 __ __ RTS
--------------------------------------------------------------------
divmod@proxy: ; divmod@proxy
747d : a9 00 __ LDA #$00
747f : 85 04 __ STA WORK + 1 
--------------------------------------------------------------------
divmod: ; divmod
7481 : a5 1c __ LDA ACCU + 1 
7483 : d0 31 __ BNE $74b6 ; (divmod + 53)
7485 : a5 04 __ LDA WORK + 1 
7487 : d0 1e __ BNE $74a7 ; (divmod + 38)
7489 : 85 06 __ STA WORK + 3 
748b : a2 04 __ LDX #$04
748d : 06 1b __ ASL ACCU + 0 
748f : 2a __ __ ROL
7490 : c5 03 __ CMP WORK + 0 
7492 : 90 02 __ BCC $7496 ; (divmod + 21)
7494 : e5 03 __ SBC WORK + 0 
7496 : 26 1b __ ROL ACCU + 0 
7498 : 2a __ __ ROL
7499 : c5 03 __ CMP WORK + 0 
749b : 90 02 __ BCC $749f ; (divmod + 30)
749d : e5 03 __ SBC WORK + 0 
749f : 26 1b __ ROL ACCU + 0 
74a1 : ca __ __ DEX
74a2 : d0 eb __ BNE $748f ; (divmod + 14)
74a4 : 85 05 __ STA WORK + 2 
74a6 : 60 __ __ RTS
74a7 : a5 1b __ LDA ACCU + 0 
74a9 : 85 05 __ STA WORK + 2 
74ab : a5 1c __ LDA ACCU + 1 
74ad : 85 06 __ STA WORK + 3 
74af : a9 00 __ LDA #$00
74b1 : 85 1b __ STA ACCU + 0 
74b3 : 85 1c __ STA ACCU + 1 
74b5 : 60 __ __ RTS
74b6 : a5 04 __ LDA WORK + 1 
74b8 : d0 1f __ BNE $74d9 ; (divmod + 88)
74ba : a5 03 __ LDA WORK + 0 
74bc : 30 1b __ BMI $74d9 ; (divmod + 88)
74be : a9 00 __ LDA #$00
74c0 : 85 06 __ STA WORK + 3 
74c2 : a2 10 __ LDX #$10
74c4 : 06 1b __ ASL ACCU + 0 
74c6 : 26 1c __ ROL ACCU + 1 
74c8 : 2a __ __ ROL
74c9 : c5 03 __ CMP WORK + 0 
74cb : 90 02 __ BCC $74cf ; (divmod + 78)
74cd : e5 03 __ SBC WORK + 0 
74cf : 26 1b __ ROL ACCU + 0 
74d1 : 26 1c __ ROL ACCU + 1 
74d3 : ca __ __ DEX
74d4 : d0 f2 __ BNE $74c8 ; (divmod + 71)
74d6 : 85 05 __ STA WORK + 2 
74d8 : 60 __ __ RTS
74d9 : a9 00 __ LDA #$00
74db : 85 05 __ STA WORK + 2 
74dd : 85 06 __ STA WORK + 3 
74df : 84 02 __ STY $02 
74e1 : a0 10 __ LDY #$10
74e3 : 18 __ __ CLC
74e4 : 26 1b __ ROL ACCU + 0 
74e6 : 26 1c __ ROL ACCU + 1 
74e8 : 26 05 __ ROL WORK + 2 
74ea : 26 06 __ ROL WORK + 3 
74ec : 38 __ __ SEC
74ed : a5 05 __ LDA WORK + 2 
74ef : e5 03 __ SBC WORK + 0 
74f1 : aa __ __ TAX
74f2 : a5 06 __ LDA WORK + 3 
74f4 : e5 04 __ SBC WORK + 1 
74f6 : 90 04 __ BCC $74fc ; (divmod + 123)
74f8 : 86 05 __ STX WORK + 2 
74fa : 85 06 __ STA WORK + 3 
74fc : 88 __ __ DEY
74fd : d0 e5 __ BNE $74e4 ; (divmod + 99)
74ff : 26 1b __ ROL ACCU + 0 
7501 : 26 1c __ ROL ACCU + 1 
7503 : a4 02 __ LDY $02 
7505 : 60 __ __ RTS
--------------------------------------------------------------------
mul32: ; mul32
7506 : a5 04 __ LDA WORK + 1 
7508 : 05 05 __ ORA WORK + 2 
750a : 05 06 __ ORA WORK + 3 
750c : d0 05 __ BNE $7513 ; (mul32 + 13)
750e : a5 03 __ LDA WORK + 0 
7510 : 4c ca 73 JMP $73ca ; (mul32by8 + 0)
7513 : a0 00 __ LDY #$00
7515 : 84 07 __ STY WORK + 4 
7517 : 84 08 __ STY WORK + 5 
7519 : 98 __ __ TYA
751a : 38 __ __ SEC
751b : 66 03 __ ROR WORK + 0 
751d : 90 15 __ BCC $7534 ; (mul32 + 46)
751f : aa __ __ TAX
7520 : 18 __ __ CLC
7521 : a5 07 __ LDA WORK + 4 
7523 : 65 1b __ ADC ACCU + 0 
7525 : 85 07 __ STA WORK + 4 
7527 : a5 08 __ LDA WORK + 5 
7529 : 65 1c __ ADC ACCU + 1 
752b : 85 08 __ STA WORK + 5 
752d : 98 __ __ TYA
752e : 65 1d __ ADC ACCU + 2 
7530 : a8 __ __ TAY
7531 : 8a __ __ TXA
7532 : 65 1e __ ADC ACCU + 3 
7534 : 46 04 __ LSR WORK + 1 
7536 : 90 0f __ BCC $7547 ; (mul32 + 65)
7538 : aa __ __ TAX
7539 : 18 __ __ CLC
753a : a5 08 __ LDA WORK + 5 
753c : 65 1b __ ADC ACCU + 0 
753e : 85 08 __ STA WORK + 5 
7540 : 98 __ __ TYA
7541 : 65 1c __ ADC ACCU + 1 
7543 : a8 __ __ TAY
7544 : 8a __ __ TXA
7545 : 65 1d __ ADC ACCU + 2 
7547 : 46 05 __ LSR WORK + 2 
7549 : 90 09 __ BCC $7554 ; (mul32 + 78)
754b : aa __ __ TAX
754c : 18 __ __ CLC
754d : 98 __ __ TYA
754e : 65 1b __ ADC ACCU + 0 
7550 : a8 __ __ TAY
7551 : 8a __ __ TXA
7552 : 65 1c __ ADC ACCU + 1 
7554 : 46 06 __ LSR WORK + 3 
7556 : 90 03 __ BCC $755b ; (mul32 + 85)
7558 : 18 __ __ CLC
7559 : 65 1b __ ADC ACCU + 0 
755b : 06 1b __ ASL ACCU + 0 
755d : 26 1c __ ROL ACCU + 1 
755f : 26 1d __ ROL ACCU + 2 
7561 : 26 1e __ ROL ACCU + 3 
7563 : 46 03 __ LSR WORK + 0 
7565 : 90 cd __ BCC $7534 ; (mul32 + 46)
7567 : d0 b6 __ BNE $751f ; (mul32 + 25)
7569 : 84 09 __ STY WORK + 6 
756b : 85 0a __ STA WORK + 7 
756d : 60 __ __ RTS
--------------------------------------------------------------------
divs32: ; divs32
756e : 24 1e __ BIT ACCU + 3 
7570 : 10 0d __ BPL $757f ; (divs32 + 17)
7572 : 20 89 75 JSR $7589 ; (negaccu32 + 0)
7575 : 24 06 __ BIT WORK + 3 
7577 : 10 0d __ BPL $7586 ; (divs32 + 24)
7579 : 20 a3 75 JSR $75a3 ; (negtmp32 + 0)
757c : 4c 36 3f JMP $3f36 ; (divmod32 + 0)
757f : 24 06 __ BIT WORK + 3 
7581 : 10 f9 __ BPL $757c ; (divs32 + 14)
7583 : 20 a3 75 JSR $75a3 ; (negtmp32 + 0)
7586 : 20 36 3f JSR $3f36 ; (divmod32 + 0)
--------------------------------------------------------------------
negaccu32: ; negaccu32
7589 : 38 __ __ SEC
758a : a9 00 __ LDA #$00
758c : e5 1b __ SBC ACCU + 0 
758e : 85 1b __ STA ACCU + 0 
7590 : a9 00 __ LDA #$00
7592 : e5 1c __ SBC ACCU + 1 
7594 : 85 1c __ STA ACCU + 1 
7596 : a9 00 __ LDA #$00
7598 : e5 1d __ SBC ACCU + 2 
759a : 85 1d __ STA ACCU + 2 
759c : a9 00 __ LDA #$00
759e : e5 1e __ SBC ACCU + 3 
75a0 : 85 1e __ STA ACCU + 3 
75a2 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp32: ; negtmp32
75a3 : 38 __ __ SEC
75a4 : a9 00 __ LDA #$00
75a6 : e5 03 __ SBC WORK + 0 
75a8 : 85 03 __ STA WORK + 0 
75aa : a9 00 __ LDA #$00
75ac : e5 04 __ SBC WORK + 1 
75ae : 85 04 __ STA WORK + 1 
75b0 : a9 00 __ LDA #$00
75b2 : e5 05 __ SBC WORK + 2 
75b4 : 85 05 __ STA WORK + 2 
75b6 : a9 00 __ LDA #$00
75b8 : e5 06 __ SBC WORK + 3 
75ba : 85 06 __ STA WORK + 3 
75bc : 60 __ __ RTS
--------------------------------------------------------------------
crt_malloc: ; crt_malloc
75bd : 18 __ __ CLC
75be : a5 1b __ LDA ACCU + 0 
75c0 : 69 0d __ ADC #$0d
75c2 : 29 fc __ AND #$fc
75c4 : 85 03 __ STA WORK + 0 
75c6 : a5 1c __ LDA ACCU + 1 
75c8 : 69 00 __ ADC #$00
75ca : 85 04 __ STA WORK + 1 
75cc : ad ed 83 LDA $83ed ; (HeapNode.end + 0)
75cf : d0 26 __ BNE $75f7 ; (crt_malloc + 58)
75d1 : a9 00 __ LDA #$00
75d3 : 8d a2 a2 STA $a2a2 
75d6 : 8d a3 a2 STA $a2a3 
75d9 : ee ed 83 INC $83ed ; (HeapNode.end + 0)
75dc : a9 a0 __ LDA #$a0
75de : 09 02 __ ORA #$02
75e0 : 8d eb 83 STA $83eb ; (HeapNode.next + 0)
75e3 : a9 a2 __ LDA #$a2
75e5 : 8d ec 83 STA $83ec ; (HeapNode.next + 1)
75e8 : 38 __ __ SEC
75e9 : a9 00 __ LDA #$00
75eb : e9 02 __ SBC #$02
75ed : 8d a4 a2 STA $a2a4 
75f0 : a9 b0 __ LDA #$b0
75f2 : e9 00 __ SBC #$00
75f4 : 8d a5 a2 STA $a2a5 
75f7 : a9 eb __ LDA #$eb
75f9 : a2 83 __ LDX #$83
75fb : 85 1d __ STA ACCU + 2 
75fd : 86 1e __ STX ACCU + 3 
75ff : 18 __ __ CLC
7600 : a0 00 __ LDY #$00
7602 : b1 1d __ LDA (ACCU + 2),y 
7604 : 85 1b __ STA ACCU + 0 
7606 : 65 03 __ ADC WORK + 0 
7608 : 85 05 __ STA WORK + 2 
760a : c8 __ __ INY
760b : b1 1d __ LDA (ACCU + 2),y 
760d : 85 1c __ STA ACCU + 1 
760f : f0 20 __ BEQ $7631 ; (crt_malloc + 116)
7611 : 65 04 __ ADC WORK + 1 
7613 : 85 06 __ STA WORK + 3 
7615 : b0 14 __ BCS $762b ; (crt_malloc + 110)
7617 : a0 02 __ LDY #$02
7619 : b1 1b __ LDA (ACCU + 0),y 
761b : c5 05 __ CMP WORK + 2 
761d : c8 __ __ INY
761e : b1 1b __ LDA (ACCU + 0),y 
7620 : e5 06 __ SBC WORK + 3 
7622 : b0 0f __ BCS $7633 ; (crt_malloc + 118)
7624 : a5 1b __ LDA ACCU + 0 
7626 : a6 1c __ LDX ACCU + 1 
7628 : 4c fb 75 JMP $75fb ; (crt_malloc + 62)
762b : a9 00 __ LDA #$00
762d : 85 1b __ STA ACCU + 0 
762f : 85 1c __ STA ACCU + 1 
7631 : 02 __ __ INV
7632 : 60 __ __ RTS
7633 : a5 05 __ LDA WORK + 2 
7635 : 85 07 __ STA WORK + 4 
7637 : a5 06 __ LDA WORK + 3 
7639 : 85 08 __ STA WORK + 5 
763b : a0 02 __ LDY #$02
763d : a5 07 __ LDA WORK + 4 
763f : d1 1b __ CMP (ACCU + 0),y 
7641 : d0 15 __ BNE $7658 ; (crt_malloc + 155)
7643 : c8 __ __ INY
7644 : a5 08 __ LDA WORK + 5 
7646 : d1 1b __ CMP (ACCU + 0),y 
7648 : d0 0e __ BNE $7658 ; (crt_malloc + 155)
764a : a0 00 __ LDY #$00
764c : b1 1b __ LDA (ACCU + 0),y 
764e : 91 1d __ STA (ACCU + 2),y 
7650 : c8 __ __ INY
7651 : b1 1b __ LDA (ACCU + 0),y 
7653 : 91 1d __ STA (ACCU + 2),y 
7655 : 4c 75 76 JMP $7675 ; (crt_malloc + 184)
7658 : a0 00 __ LDY #$00
765a : b1 1b __ LDA (ACCU + 0),y 
765c : 91 07 __ STA (WORK + 4),y 
765e : a5 07 __ LDA WORK + 4 
7660 : 91 1d __ STA (ACCU + 2),y 
7662 : c8 __ __ INY
7663 : b1 1b __ LDA (ACCU + 0),y 
7665 : 91 07 __ STA (WORK + 4),y 
7667 : a5 08 __ LDA WORK + 5 
7669 : 91 1d __ STA (ACCU + 2),y 
766b : c8 __ __ INY
766c : b1 1b __ LDA (ACCU + 0),y 
766e : 91 07 __ STA (WORK + 4),y 
7670 : c8 __ __ INY
7671 : b1 1b __ LDA (ACCU + 0),y 
7673 : 91 07 __ STA (WORK + 4),y 
7675 : a0 00 __ LDY #$00
7677 : a5 05 __ LDA WORK + 2 
7679 : 91 1b __ STA (ACCU + 0),y 
767b : c8 __ __ INY
767c : a5 06 __ LDA WORK + 3 
767e : 91 1b __ STA (ACCU + 0),y 
7680 : a0 02 __ LDY #$02
7682 : a9 bd __ LDA #$bd
7684 : 91 1b __ STA (ACCU + 0),y 
7686 : c8 __ __ INY
7687 : 91 1b __ STA (ACCU + 0),y 
7689 : c8 __ __ INY
768a : 91 1b __ STA (ACCU + 0),y 
768c : c8 __ __ INY
768d : 91 1b __ STA (ACCU + 0),y 
768f : 38 __ __ SEC
7690 : a5 05 __ LDA WORK + 2 
7692 : e9 04 __ SBC #$04
7694 : 85 05 __ STA WORK + 2 
7696 : b0 02 __ BCS $769a ; (crt_malloc + 221)
7698 : c6 06 __ DEC WORK + 3 
769a : a9 be __ LDA #$be
769c : a0 00 __ LDY #$00
769e : 91 05 __ STA (WORK + 2),y 
76a0 : c8 __ __ INY
76a1 : 91 05 __ STA (WORK + 2),y 
76a3 : c8 __ __ INY
76a4 : 91 05 __ STA (WORK + 2),y 
76a6 : c8 __ __ INY
76a7 : 91 05 __ STA (WORK + 2),y 
76a9 : 18 __ __ CLC
76aa : a5 1b __ LDA ACCU + 0 
76ac : 69 06 __ ADC #$06
76ae : 85 1b __ STA ACCU + 0 
76b0 : 90 02 __ BCC $76b4 ; (crt_malloc + 247)
76b2 : e6 1c __ INC ACCU + 1 
76b4 : 60 __ __ RTS
--------------------------------------------------------------------
crt_free@proxy: ; crt_free@proxy
76b5 : a5 0d __ LDA P0 
76b7 : 85 1b __ STA ACCU + 0 
76b9 : a5 0e __ LDA P1 
76bb : 85 1c __ STA ACCU + 1 
--------------------------------------------------------------------
crt_free: ; crt_free
76bd : a5 1b __ LDA ACCU + 0 
76bf : 05 1c __ ORA ACCU + 1 
76c1 : d0 01 __ BNE $76c4 ; (crt_free + 7)
76c3 : 60 __ __ RTS
76c4 : 38 __ __ SEC
76c5 : a5 1b __ LDA ACCU + 0 
76c7 : 29 03 __ AND #$03
76c9 : d0 56 __ BNE $7721 ; (crt_free + 100)
76cb : a5 1b __ LDA ACCU + 0 
76cd : e9 06 __ SBC #$06
76cf : 85 1b __ STA ACCU + 0 
76d1 : b0 02 __ BCS $76d5 ; (crt_free + 24)
76d3 : c6 1c __ DEC ACCU + 1 
76d5 : a0 02 __ LDY #$02
76d7 : a9 bd __ LDA #$bd
76d9 : d1 1b __ CMP (ACCU + 0),y 
76db : d0 44 __ BNE $7721 ; (crt_free + 100)
76dd : c8 __ __ INY
76de : d1 1b __ CMP (ACCU + 0),y 
76e0 : d0 3f __ BNE $7721 ; (crt_free + 100)
76e2 : c8 __ __ INY
76e3 : d1 1b __ CMP (ACCU + 0),y 
76e5 : d0 3a __ BNE $7721 ; (crt_free + 100)
76e7 : c8 __ __ INY
76e8 : d1 1b __ CMP (ACCU + 0),y 
76ea : d0 35 __ BNE $7721 ; (crt_free + 100)
76ec : a0 00 __ LDY #$00
76ee : 38 __ __ SEC
76ef : b1 1b __ LDA (ACCU + 0),y 
76f1 : e9 04 __ SBC #$04
76f3 : 85 03 __ STA WORK + 0 
76f5 : c8 __ __ INY
76f6 : b1 1b __ LDA (ACCU + 0),y 
76f8 : e9 00 __ SBC #$00
76fa : 85 04 __ STA WORK + 1 
76fc : a0 00 __ LDY #$00
76fe : a9 be __ LDA #$be
7700 : d1 03 __ CMP (WORK + 0),y 
7702 : d0 1d __ BNE $7721 ; (crt_free + 100)
7704 : c8 __ __ INY
7705 : d1 03 __ CMP (WORK + 0),y 
7707 : d0 18 __ BNE $7721 ; (crt_free + 100)
7709 : c8 __ __ INY
770a : d1 03 __ CMP (WORK + 0),y 
770c : d0 13 __ BNE $7721 ; (crt_free + 100)
770e : c8 __ __ INY
770f : d1 03 __ CMP (WORK + 0),y 
7711 : d0 0e __ BNE $7721 ; (crt_free + 100)
7713 : a5 1c __ LDA ACCU + 1 
7715 : a6 1b __ LDX ACCU + 0 
7717 : c9 a2 __ CMP #$a2
7719 : 90 06 __ BCC $7721 ; (crt_free + 100)
771b : d0 05 __ BNE $7722 ; (crt_free + 101)
771d : e0 a0 __ CPX #$a0
771f : b0 01 __ BCS $7722 ; (crt_free + 101)
7721 : 02 __ __ INV
7722 : c9 b0 __ CMP #$b0
7724 : 90 06 __ BCC $772c ; (crt_free + 111)
7726 : d0 f9 __ BNE $7721 ; (crt_free + 100)
7728 : e0 00 __ CPX #$00
772a : b0 f5 __ BCS $7721 ; (crt_free + 100)
772c : a0 02 __ LDY #$02
772e : a9 bf __ LDA #$bf
7730 : 91 1b __ STA (ACCU + 0),y 
7732 : c8 __ __ INY
7733 : 91 1b __ STA (ACCU + 0),y 
7735 : a0 00 __ LDY #$00
7737 : b1 1b __ LDA (ACCU + 0),y 
7739 : 85 1d __ STA ACCU + 2 
773b : c8 __ __ INY
773c : b1 1b __ LDA (ACCU + 0),y 
773e : 85 1e __ STA ACCU + 3 
7740 : a9 eb __ LDA #$eb
7742 : a2 83 __ LDX #$83
7744 : 85 05 __ STA WORK + 2 
7746 : 86 06 __ STX WORK + 3 
7748 : a0 01 __ LDY #$01
774a : b1 05 __ LDA (WORK + 2),y 
774c : f0 28 __ BEQ $7776 ; (crt_free + 185)
774e : aa __ __ TAX
774f : 88 __ __ DEY
7750 : b1 05 __ LDA (WORK + 2),y 
7752 : e4 1e __ CPX ACCU + 3 
7754 : 90 ee __ BCC $7744 ; (crt_free + 135)
7756 : d0 1e __ BNE $7776 ; (crt_free + 185)
7758 : c5 1d __ CMP ACCU + 2 
775a : 90 e8 __ BCC $7744 ; (crt_free + 135)
775c : d0 18 __ BNE $7776 ; (crt_free + 185)
775e : a0 00 __ LDY #$00
7760 : b1 1d __ LDA (ACCU + 2),y 
7762 : 91 1b __ STA (ACCU + 0),y 
7764 : c8 __ __ INY
7765 : b1 1d __ LDA (ACCU + 2),y 
7767 : 91 1b __ STA (ACCU + 0),y 
7769 : c8 __ __ INY
776a : b1 1d __ LDA (ACCU + 2),y 
776c : 91 1b __ STA (ACCU + 0),y 
776e : c8 __ __ INY
776f : b1 1d __ LDA (ACCU + 2),y 
7771 : 91 1b __ STA (ACCU + 0),y 
7773 : 4c 8b 77 JMP $778b ; (crt_free + 206)
7776 : a0 00 __ LDY #$00
7778 : b1 05 __ LDA (WORK + 2),y 
777a : 91 1b __ STA (ACCU + 0),y 
777c : c8 __ __ INY
777d : b1 05 __ LDA (WORK + 2),y 
777f : 91 1b __ STA (ACCU + 0),y 
7781 : c8 __ __ INY
7782 : a5 1d __ LDA ACCU + 2 
7784 : 91 1b __ STA (ACCU + 0),y 
7786 : c8 __ __ INY
7787 : a5 1e __ LDA ACCU + 3 
7789 : 91 1b __ STA (ACCU + 0),y 
778b : a0 02 __ LDY #$02
778d : b1 05 __ LDA (WORK + 2),y 
778f : c5 1b __ CMP ACCU + 0 
7791 : d0 1d __ BNE $77b0 ; (crt_free + 243)
7793 : c8 __ __ INY
7794 : b1 05 __ LDA (WORK + 2),y 
7796 : c5 1c __ CMP ACCU + 1 
7798 : d0 16 __ BNE $77b0 ; (crt_free + 243)
779a : a0 00 __ LDY #$00
779c : b1 1b __ LDA (ACCU + 0),y 
779e : 91 05 __ STA (WORK + 2),y 
77a0 : c8 __ __ INY
77a1 : b1 1b __ LDA (ACCU + 0),y 
77a3 : 91 05 __ STA (WORK + 2),y 
77a5 : c8 __ __ INY
77a6 : b1 1b __ LDA (ACCU + 0),y 
77a8 : 91 05 __ STA (WORK + 2),y 
77aa : c8 __ __ INY
77ab : b1 1b __ LDA (ACCU + 0),y 
77ad : 91 05 __ STA (WORK + 2),y 
77af : 60 __ __ RTS
77b0 : a0 00 __ LDY #$00
77b2 : a5 1b __ LDA ACCU + 0 
77b4 : 91 05 __ STA (WORK + 2),y 
77b6 : c8 __ __ INY
77b7 : a5 1c __ LDA ACCU + 1 
77b9 : 91 05 __ STA (WORK + 2),y 
77bb : 60 __ __ RTS
--------------------------------------------------------------------
__multab50L:
77bc : __ __ __ BYT 00 32 64 96                                     : .2d.
--------------------------------------------------------------------
__multab7L:
77c0 : __ __ __ BYT 00 07 0e 15 1c 23 2a 31 38 3f 46 4d 54          : .....#*18?FMT
--------------------------------------------------------------------
__shrtab192L:
77cd : __ __ __ BYT c0 60 30 18 0c 06 03                            : .`0....
--------------------------------------------------------------------
__multab12L:
77d4 : __ __ __ BYT 00 0c 18 24                                     : ...$
--------------------------------------------------------------------
__multab3L:
77d8 : __ __ __ BYT 00 03 06 09                                     : ....
--------------------------------------------------------------------
__shltab3L:
77dc : __ __ __ BYT 03 06 0c 18 30 60 c0                            : ....0`.
--------------------------------------------------------------------
__multab320L:
77e3 : __ __ __ BYT 00 40 80 c0 00 40 80 c0 00 40 80 c0 00          : .@...@...@...
--------------------------------------------------------------------
__multab320H:
77f0 : __ __ __ BYT 00 01 02 03 05 06 07 08 0a 0b 0c 0d 0f          : .............
--------------------------------------------------------------------
spentry:
77fd : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
uii_target:
77fe : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
mod_paused:
77ff : __ __ __ BSS	1
--------------------------------------------------------------------
__multab40L:
7800 : __ __ __ BYT 00 28 50 78 a0 c8 f0 18 40 68 90 b8 e0 08 30 58 : .(Px....@h....0X
--------------------------------------------------------------------
__multab40H:
7810 : __ __ __ BYT 00 00 00 00 00 00 00 01 01 01 01 01 01 02 02 02 : ................
--------------------------------------------------------------------
__multab10L:
7820 : __ __ __ BYT 00 0a 14 1e 28 32 3c 46 50 5a 64 6e 78 82 8c 96 : ....(2<FPZdnx...
--------------------------------------------------------------------
__multab17L:
7830 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 99 aa bb cc dd ee ff : .."3DUfw........
--------------------------------------------------------------------
screen_result@proxy: ; screen_result@proxy
7840 : a9 46 __ LDA #$46
7842 : 85 10 __ STA P3 
7844 : a9 15 __ LDA #$15
7846 : 85 11 __ STA P4 
7848 : 4c 67 11 JMP $1167 ; (screen_result.s4 + 0)
--------------------------------------------------------------------
memset@proxy: ; memset@proxy
784b : a9 e0 __ LDA #$e0
784d : 85 0e __ STA P1 
784f : a9 40 __ LDA #$40
7851 : 85 11 __ STA P4 
7853 : a9 1f __ LDA #$1f
7855 : 85 12 __ STA P5 
7857 : 4c f2 20 JMP $20f2 ; (memset.s4 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
785a : a5 4f __ LDA $4f 
785c : 85 03 __ STA WORK + 0 
785e : a5 50 __ LDA $50 
7860 : 85 04 __ STA WORK + 1 
7862 : 4c 46 74 JMP $7446 ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
7865 : a5 5e __ LDA $5e 
7867 : 85 03 __ STA WORK + 0 
7869 : a5 5f __ LDA $5f 
786b : 85 04 __ STA WORK + 1 
786d : 4c 46 74 JMP $7446 ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
7870 : a9 7f __ LDA #$7f
7872 : 85 03 __ STA WORK + 0 
7874 : a9 00 __ LDA #$00
7876 : 85 04 __ STA WORK + 1 
7878 : a5 05 __ LDA WORK + 2 
787a : 85 1b __ STA ACCU + 0 
787c : a5 06 __ LDA WORK + 3 
787e : 85 1c __ STA ACCU + 1 
7880 : 4c 46 74 JMP $7446 ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
7883 : a9 0d __ LDA #$0d
7885 : 85 03 __ STA WORK + 0 
7887 : 4c 46 74 JMP $7446 ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
788a : a9 7f __ LDA #$7f
788c : 85 03 __ STA WORK + 0 
788e : a9 00 __ LDA #$00
7890 : 85 04 __ STA WORK + 1 
7892 : 4c 46 74 JMP $7446 ; (divs16 + 0)
--------------------------------------------------------------------
divmod@proxy: ; divmod@proxy
7895 : a9 50 __ LDA #$50
7897 : 85 1b __ STA ACCU + 0 
7899 : a9 46 __ LDA #$46
789b : 85 1c __ STA ACCU + 1 
789d : 4c 81 74 JMP $7481 ; (divmod + 0)
--------------------------------------------------------------------
cwin_put_string@proxy: ; cwin_put_string@proxy
78a0 : a5 10 __ LDA P3 
78a2 : 85 0d __ STA P0 
78a4 : a5 11 __ LDA P4 
78a6 : 85 0e __ STA P1 
78a8 : 4c c5 10 JMP $10c5 ; (cwin_put_string.s4 + 0)
--------------------------------------------------------------------
vic_setmode@proxy: ; vic_setmode@proxy
78ab : a9 04 __ LDA #$04
78ad : 85 0d __ STA P0 
78af : a9 c0 __ LDA #$c0
78b1 : 85 0f __ STA P2 
78b3 : a9 e0 __ LDA #$e0
78b5 : 85 11 __ STA P4 
78b7 : 4c 16 0f JMP $0f16 ; (vic_setmode.s4 + 0)
--------------------------------------------------------------------
vic_setmode@proxy: ; vic_setmode@proxy
78ba : a9 03 __ LDA #$03
78bc : 85 0d __ STA P0 
78be : a9 00 __ LDA #$00
78c0 : 85 0e __ STA P1 
78c2 : a9 d0 __ LDA #$d0
78c4 : 85 0f __ STA P2 
78c6 : a5 43 __ LDA $43 
78c8 : 85 10 __ STA P3 
78ca : a5 44 __ LDA $44 
78cc : 85 11 __ STA P4 
78ce : 4c 16 0f JMP $0f16 ; (vic_setmode.s4 + 0)
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
78d1 : a9 79 __ LDA #$79
78d3 : 85 0e __ STA P1 
78d5 : 4c 47 10 JMP $1047 ; (strlen.s4 + 0)
--------------------------------------------------------------------
p2smap:
78d8 : __ __ __ BYT 40 00 40 20 40 c0 80 80                         : @.@ @...
--------------------------------------------------------------------
p2smap:
78e0 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
audio_ch_base:
78e8 : __ __ __ BYT 20 df 40 df 60 df 80 df a0 df c0 df e0 df       :  .@.`.........
--------------------------------------------------------------------
mod_file:
78f6 : __ __ __ BYT 34 65 76 2e 6d 6f 64 00                         : 4ev.mod.
--------------------------------------------------------------------
mod_saved_irq:
78fe : __ __ __ BSS	2
--------------------------------------------------------------------
mul40:
7900 : __ __ __ BYT 00 00 28 00 50 00 78 00 a0 00 c8 00 f0 00 18 01 : ..(.P.x.........
7910 : __ __ __ BYT 40 01 68 01 90 01 b8 01 e0 01 08 02 30 02 58 02 : @.h.........0.X.
7920 : __ __ __ BYT 80 02 a8 02 d0 02 f8 02 20 03 48 03 70 03 98 03 : ........ .H.p...
7930 : __ __ __ BYT c0 03                                           : ..
--------------------------------------------------------------------
mod_dir:
7932 : __ __ __ BYT 2f 75 73 62 30 2f 44 65 76 2f 61 73 73 65 74 73 : /usb0/Dev/assets
7942 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
sid_freq:
7943 : __ __ __ BYT a9 02 d2 02 fd 02 2b 03 5b 03 8e 03 c4 03 fd 03 : ......+.[.......
7953 : __ __ __ BYT 3a 04 7a 04 bf 04 07 05 53 05 a4 05 fa 05 55 06 : :.z.....S.....U.
--------------------------------------------------------------------
speed_nums:
7963 : __ __ __ BYT 94 22 96 22 98 22 9a 22 9c 22 9e 22 a0 22 a3 22 : ."."."."."."."."
7973 : __ __ __ BYT a6 22 a9 22 ac 22 af 22 b2 22 b5 22 b8 22 bb 22 : ."."."."."."."."
--------------------------------------------------------------------
glyphs:
7983 : __ __ __ BYT 70 88 88 88 88 88 70 20 60 20 20 20 20 70 70 88 : p.....p `    pp.
7993 : __ __ __ BYT 08 30 40 80 f8 70 88 08 30 08 88 70 10 30 50 90 : .0@..p..0..p.0P.
79a3 : __ __ __ BYT f8 10 10 f8 80 f0 08 08 88 70 30 40 80 f0 88 88 : .........p0@....
79b3 : __ __ __ BYT 70 f8 08 10 20 40 40 40 70 88 88 70 88 88 70 70 : p... @@@p..p..pp
79c3 : __ __ __ BYT 88 88 78 08 10 60 88 d8 a8 88 88 88 88 88 88 88 : ..x..`..........
79d3 : __ __ __ BYT f8 88 88 88 f8 10 20 40 80 80 f8                : ...... @...
--------------------------------------------------------------------
lmask:
79de : __ __ __ BYT ff 7f 3f 1f 0f 07 03 01                         : ..?.....
--------------------------------------------------------------------
rmask:
79e6 : __ __ __ BYT 00 80 c0 e0 f0 f8 fc fe                         : ........
--------------------------------------------------------------------
blitops_op:
79ee : __ __ __ BYT 00 21 01 41                                     : .!.A
--------------------------------------------------------------------
tbitmap:
79f2 : __ __ __ BYT e0 9b 00 00 28 01 40 01                         : ....(.@.
--------------------------------------------------------------------
cbytes:
79fa : __ __ __ BYT 00 55 aa ff                                     : .U..
--------------------------------------------------------------------
txt_pos:
79fe : __ __ __ BSS	2
--------------------------------------------------------------------
step_msg:
7a00 : __ __ __ BYT bb 2c d4 2c e9 2c fc 2c 14 2d 31 2d 4b 2d 65 2d : .,.,.,.,.-1-K-e-
7a10 : __ __ __ BYT 7e 2d 9a 2d ba 2d d7 2d f4 2d 10 2e 28 2e 44 2e : ~-.-.-.-.-..(.D.
--------------------------------------------------------------------
TinyFont:
7a20 : __ __ __ BYT 00 04 05 08 0d 12 17 1c 1d 21 25 2a 2d 2e 31 32 : .........!%*-.12
7a30 : __ __ __ BYT 35 39 3d 41 45 49 4d 51 55 59 5d 5e 5f 62 65 68 : 59=AEIMQUY]^_beh
7a40 : __ __ __ BYT 6c 71 76 7a 7e 82 86 8a 8e 92 95 99 9d a1 a6 ab : lqvz~...........
7a50 : __ __ __ BYT af b3 b7 bb bf c4 c8 cd d2 d7 dc e1 e5 e8 ec f1 : ................
7a60 : __ __ __ BYT f5 f9 fd 01 05 09 0d 10 14 18 19 1b 1f 21 26 2a : .............!&*
7a70 : __ __ __ BYT 2e 32 36 3a 3e 41 45 49 4e 52 56 5a 5e 5f 63 67 : .26:>AEINRVZ^_cg
7a80 : __ __ __ BYT 10 04 0c 14 14 14 14 04 10 10 14 0c 04 0c 04 0c : ................
7a90 : __ __ __ BYT 10 10 10 10 10 10 10 10 10 10 04 04 0c 0c 0c 10 : ................
7aa0 : __ __ __ BYT 14 14 10 10 10 10 10 10 10 0c 10 10 10 14 14 10 : ................
7ab0 : __ __ __ BYT 10 10 10 10 14 10 14 14 14 14 14 10 0c 10 14 10 : ................
7ac0 : __ __ __ BYT 10 10 10 11 11 11 0d 11 11 05 09 11 09 15 11 11 : ................
7ad0 : __ __ __ BYT 11 11 11 11 0d 11 11 15 11 11 11 11 05 11 11 11 : ................
7ae0 : __ __ __ BYT 00 00 00 00 fa c0 00 c0 28 7c 28 7c 28 20 54 d6 : ........(|(|( T.
7af0 : __ __ __ BYT 54 08 04 48 10 24 40 6c 92 92 6c 0a c0 38 44 82 : T..H.$@l..l..8D.
7b00 : __ __ __ BYT 82 82 82 44 38 10 54 38 54 10 10 38 10 03 10 10 : ...D8.T8T..8....
7b10 : __ __ __ BYT 10 02 06 38 c0 7c 82 82 7c 22 42 fe 02 46 8a 92 : ...8.|..|"B..F..
7b20 : __ __ __ BYT 62 44 82 92 6c f0 10 3e 10 e4 92 92 8c 7c 92 92 : bD..l..>.....|..
7b30 : __ __ __ BYT 4c 80 8e 90 e0 6c 92 92 6c 64 92 92 7c 28 0b 10 : L....l..ld..|(..
7b40 : __ __ __ BYT 28 44 28 28 28 44 28 10 40 80 9a 60 00 00 00 00 : (D(((D(.@..`....
7b50 : __ __ __ BYT 00 3e 50 90 50 3e fe 92 92 6c 7c 82 82 44 fe 82 : .>P.P>...l|..D..
7b60 : __ __ __ BYT 82 7c fe 92 92 82 fe 90 90 80 7c 82 92 1c fe 10 : .|........|.....
7b70 : __ __ __ BYT 10 fe 82 fe 82 84 82 82 fc fe 10 28 c6 fe 02 02 : ...........(....
7b80 : __ __ __ BYT 02 fe 40 20 40 fe fe 40 20 10 fe 7c 82 82 7c fe : ..@ @..@ ..|..|.
7b90 : __ __ __ BYT 90 90 60 7c 82 84 7a fe 90 90 6e 64 92 92 4c 80 : ..`|..z...nd..L.
7ba0 : __ __ __ BYT 80 fe 80 80 fc 02 02 fc e0 18 06 18 e0 fe 04 08 : ................
7bb0 : __ __ __ BYT 04 fe c6 28 10 28 c6 e0 10 1e 10 e0 86 8a 92 a2 : ...(.(..........
7bc0 : __ __ __ BYT c2 fe 82 82 82 c0 38 06 82 82 82 fe 20 40 80 40 : ......8..... @.@
7bd0 : __ __ __ BYT 20 01 01 01 01 00 00 00 00 04 2a 2a 1e fe 22 22 :  .........**..""
7be0 : __ __ __ BYT 1c 1c 22 22 14 1c 22 22 fe 1c 2a 2a 18 20 7e a0 : ..""..""..**. ~.
7bf0 : __ __ __ BYT 18 25 25 3e fe 20 20 1e be 01 be fe 10 28 46 fc : .%%>.  ......(F.
7c00 : __ __ __ BYT 02 3e 20 1e 20 1e 3e 20 20 1e 1c 22 22 1c 3f 24 : .> . .>  .."".?$
7c10 : __ __ __ BYT 24 18 18 24 24 3f 3e 10 20 10 12 2a 2a 04 20 7c : $..$$?>. ..**. |
7c20 : __ __ __ BYT 22 3c 02 02 3e 38 04 02 3c 3c 02 1c 02 3c 26 18 : "<..>8..<<...<&.
7c30 : __ __ __ BYT 0c 32 38 05 05 3e 26 2a 2a 32 10 6c 82 82 fe 82 : .28..>&**2.l....
7c40 : __ __ __ BYT 82 6c 10 10 20 10 20 00 00 00 00                : .l.. . ....
--------------------------------------------------------------------
sin64:
7c4b : __ __ __ BYT 00 0c 19 25 31 3c 47 51 5a 62 6a 70 75 7a 7d 7e : ...%1<GQZbjpuz}~
7c5b : __ __ __ BYT 7f 7e 7d 7a 75 70 6a 62 5a 51 47 3c 31 25 19 0c : .~}zupjbZQG<1%..
7c6b : __ __ __ BYT 00 f4 e7 db cf c4 b9 af a6 9e 96 90 8b 86 83 82 : ................
7c7b : __ __ __ BYT 81 82 83 86 8b 90 96 9e a6 af b9 c4 cf db e7 f4 : ................
--------------------------------------------------------------------
cr:
7c8b : __ __ __ BYT 00 00 00 00 40 01 c8 00                         : ....@...
--------------------------------------------------------------------
vib_sine:
7c93 : __ __ __ BYT 00 18 31 4a 61 78 8d a1 b4 c5 d4 e0 eb f4 fa fd : ..1Jax..........
7ca3 : __ __ __ BYT ff fd fa f4 eb e0 d4 c5 b4 a1 8d 78 61 4a 31 18 : ...........xaJ1.
--------------------------------------------------------------------
frames:
7cb3 : __ __ __ BYT 00 d8 00 e7 60 40 00 00 00 00 00 e4 1f f5 33 20 : ....`@........3 
7cc3 : __ __ __ BYT 00 00 00 00 00 ec 00 f8 1a 10 00 00 00 00 00 d8 : ................
7cd3 : __ __ __ BYT 00 e7 60 40 cd f4 52 04 00 d8 00 e7 60 40 33 f3 : ..`@..R.....`@3.
7ce3 : __ __ __ BYT 7f 02                                           : ..
--------------------------------------------------------------------
gz:
7ce5 : __ __ __ BYT a0 00 bb 00 d5 00 f0 00 0b 01 25 01 40 01       : ..........%.@.
--------------------------------------------------------------------
vcr:
7cf3 : __ __ __ BYT 00 00 00 00 40 01 c8 00                         : ....@...
--------------------------------------------------------------------
pal_sc:
7cfb : __ __ __ BYT f9 e3 a8 d5                                     : ....
--------------------------------------------------------------------
insert_col:
7cff : __ __ __ BSS	1
--------------------------------------------------------------------
f1c:
7d00 : __ __ __ BYT 0f 01 0d 0d 05 01 07 0d 01 01 07 08 0e 03 01 03 : ................
7d10 : __ __ __ BYT 0e 0d 0d 07 01 01 0d 07 06 03 0e 0e 05 03 05 0d : ................
7d20 : __ __ __ BYT 01 01 05 0d 06 04 03 03 0e 01 0d 03 01 01 0f 0d : ................
--------------------------------------------------------------------
gx:
7d30 : __ __ __ BYT b0 ff cb ff e5 ff 00 00 1b 00 35 00 50 00       : ..........5.P.
--------------------------------------------------------------------
cube_v:
7d3e : __ __ __ BYT ff ff ff 01 ff ff 01 01 ff ff 01 ff ff ff 01 01 : ................
7d4e : __ __ __ BYT ff 01 01 01 01 ff 01 01                         : ........
--------------------------------------------------------------------
sin256:
7d56 : __ __ __ BYT 00 00 65 00 c9 00 2d 01 91 01 f5 01 59 02 bc 02 : ..e...-.....Y...
7d66 : __ __ __ BYT 1f 03 81 03 e3 03 44 04 a5 04 05 05 64 05 c2 05 : ......D.....d...
7d76 : __ __ __ BYT 1f 06 7c 06 d7 06 32 07 8b 07 e3 07 3a 08 8f 08 : ..|...2.....:...
7d86 : __ __ __ BYT e4 08 37 09 88 09 d8 09 26 0a 73 0a bf 0a 08 0b : ..7.....&.s.....
7d96 : __ __ __ BYT 50 0b 97 0b db 0b 1e 0c 5e 0c 9d 0c da 0c 15 0d : P.......^.......
7da6 : __ __ __ BYT 4e 0d 85 0d b9 0d ec 0d 1c 0e 4b 0e 77 0e a1 0e : N.........K.w...
7db6 : __ __ __ BYT c8 0e ee 0e 11 0f 31 0f 50 0f 6c 0f 85 0f 9c 0f : ......1.P.l.....
7dc6 : __ __ __ BYT b1 0f c4 0f d4 0f e1 0f ec 0f f5 0f fb 0f ff 0f : ................
7dd6 : __ __ __ BYT 00 10 ff 0f fb 0f f5 0f ec 0f e1 0f d4 0f c4 0f : ................
7de6 : __ __ __ BYT b1 0f 9c 0f 85 0f 6c 0f 50 0f 31 0f 11 0f ee 0e : ......l.P.1.....
7df6 : __ __ __ BYT c8 0e a1 0e 77 0e 4b 0e 1c 0e ec 0d b9 0d 85 0d : ....w.K.........
7e06 : __ __ __ BYT 4e 0d 15 0d da 0c 9d 0c 5e 0c 1e 0c db 0b 97 0b : N.......^.......
7e16 : __ __ __ BYT 50 0b 08 0b bf 0a 73 0a 26 0a d8 09 88 09 37 09 : P.....s.&.....7.
7e26 : __ __ __ BYT e4 08 8f 08 3a 08 e3 07 8b 07 32 07 d7 06 7c 06 : ....:.....2...|.
7e36 : __ __ __ BYT 1f 06 c2 05 64 05 05 05 a5 04 44 04 e3 03 81 03 : ....d.....D.....
7e46 : __ __ __ BYT 1f 03 bc 02 59 02 f5 01 91 01 2d 01 c9 00 65 00 : ....Y.....-...e.
7e56 : __ __ __ BYT 00 00 9b ff 37 ff d3 fe 6f fe 0b fe a7 fd 44 fd : ....7...o.....D.
7e66 : __ __ __ BYT e1 fc 7f fc 1d fc bc fb 5b fb fb fa 9c fa 3e fa : ........[.....>.
7e76 : __ __ __ BYT e1 f9 84 f9 29 f9 ce f8 75 f8 1d f8 c6 f7 71 f7 : ....)...u.....q.
7e86 : __ __ __ BYT 1c f7 c9 f6 78 f6 28 f6 da f5 8d f5 41 f5 f8 f4 : ....x.(.....A...
7e96 : __ __ __ BYT b0 f4 69 f4 25 f4 e2 f3 a2 f3 63 f3 26 f3 eb f2 : ..i.%.....c.&...
7ea6 : __ __ __ BYT b2 f2 7b f2 47 f2 14 f2 e4 f1 b5 f1 89 f1 5f f1 : ..{.G........._.
7eb6 : __ __ __ BYT 38 f1 12 f1 ef f0 cf f0 b0 f0 94 f0 7b f0 64 f0 : 8...........{.d.
7ec6 : __ __ __ BYT 4f f0 3c f0 2c f0 1f f0 14 f0 0b f0 05 f0 01 f0 : O.<.,...........
7ed6 : __ __ __ BYT 00 f0 01 f0 05 f0 0b f0 14 f0 1f f0 2c f0 3c f0 : ............,.<.
7ee6 : __ __ __ BYT 4f f0 64 f0 7b f0 94 f0 b0 f0 cf f0 ef f0 12 f1 : O.d.{...........
7ef6 : __ __ __ BYT 38 f1 5f f1 89 f1 b5 f1 e4 f1 14 f2 47 f2 7b f2 : 8._.........G.{.
7f06 : __ __ __ BYT b2 f2 eb f2 26 f3 63 f3 a2 f3 e2 f3 25 f4 69 f4 : ....&.c.....%.i.
7f16 : __ __ __ BYT b0 f4 f8 f4 41 f5 8d f5 da f5 28 f6 78 f6 c9 f6 : ....A.....(.x...
7f26 : __ __ __ BYT 1c f7 71 f7 c6 f7 1d f8 75 f8 ce f8 29 f9 84 f9 : ..q.....u...)...
7f36 : __ __ __ BYT e1 f9 3e fa 9c fa fb fa 5b fb bc fb 1d fc 7f fc : ..>.....[.......
7f46 : __ __ __ BYT e1 fc 44 fd a7 fd 0b fe 6f fe d3 fe 37 ff 9b ff : ..D.....o...7...
--------------------------------------------------------------------
cube_e:
7f56 : __ __ __ BYT 00 01 01 02 02 03 03 00 04 05 05 06 06 07 07 04 : ................
7f66 : __ __ __ BYT 00 04 01 05 02 06 03 07                         : ........
--------------------------------------------------------------------
sin_lut:
7f6e : __ __ __ BYT 02 02 02 02 02 02 02 02 03 03 03 03 03 03 03 03 : ................
7f7e : __ __ __ BYT 03 03 03 03 03 03 03 03 03 02 02 02 02 02 02 02 : ................
7f8e : __ __ __ BYT 02 01 01 01 01 01 01 01 00 00 00 00 00 00 00 00 : ................
7f9e : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 01 01 01 01 01 01 : ................
--------------------------------------------------------------------
sum_to_col:
7fae : __ __ __ BYT 00 00 00 01 01 02 02 03 03 03                   : ..........
--------------------------------------------------------------------
pal_cr:
7fb8 : __ __ __ BYT 01 01 07 03                                     : ....
--------------------------------------------------------------------
lat_wave:
7fbc : __ __ __ BYT 00 ff ff fe fe fd fd fc fc fb fb fb fa fa fa fa : ................
7fcc : __ __ __ BYT fa fa fa fb fb fb fc fc fd fd fe fe ff ff 00 00 : ................
7fdc : __ __ __ BYT 01 01 02 02 03 03 04 04 05 05 05 06 06 06 06 06 : ................
7fec : __ __ __ BYT 06 06 05 05 05 04 04 03 03 02 02 01 01 00 00 ff : ................
--------------------------------------------------------------------
fine_x:
7ffc : __ __ __ BSS	1
--------------------------------------------------------------------
wave_phase:
7ffd : __ __ __ BSS	1
--------------------------------------------------------------------
plasma_phase:
7ffe : __ __ __ BSS	1
--------------------------------------------------------------------
done:
7fff : __ __ __ BSS	1
--------------------------------------------------------------------
vert_wave:
8000 : __ __ __ BYT 00 01 02 02 03 03 04 04 04 04 04 03 03 02 02 01 : ................
8010 : __ __ __ BYT 00 ff fe fe fd fd fc fc fc fc fc fd fd fe fe ff : ................
8020 : __ __ __ BYT 00 01 02 02 03 03 04 04 04 04 04 03 03 02 02 01 : ................
8030 : __ __ __ BYT 00 ff fe fe fd fd fc fc fc fc fc fd fd fe fe ff : ................
--------------------------------------------------------------------
scroll_text:
8040 : __ __ __ BYT 20 20 75 4c 54 49 4d 41 54 45 20 64 45 4d 4f 20 :   uLTIMATE dEMO 
8050 : __ __ __ BYT 32 30 32 36 20 20 63 4f 44 45 44 20 69 4e 20 63 : 2026  cODED iN c
8060 : __ __ __ BYT 20 62 59 20 78 41 4e 44 45 52 20 6d 4f 4c 20 20 :  bY xANDER mOL  
8070 : __ __ __ BYT 72 55 4e 4e 49 4e 47 20 61 54 20 36 34 20 6d 48 : rUNNING aT 64 mH
8080 : __ __ __ BYT 5a 20 6f 4e 20 74 48 45 20 75 4c 54 49 4d 41 54 : Z oN tHE uLTIMAT
8090 : __ __ __ BYT 45 20 36 34 20 68 41 52 44 57 41 52 45 20 20 67 : E 64 hARDWARE  g
80a0 : __ __ __ BYT 52 45 45 54 49 4e 47 53 20 74 4f 20 61 4c 4c 20 : REETINGS tO aLL 
80b0 : __ __ __ BYT 63 36 34 20 64 45 4d 4f 20 63 4f 44 45 52 53 20 : c64 dEMO cODERS 
80c0 : __ __ __ BYT 20 73 54 49 4c 4c 20 70 55 53 48 49 4e 47 20 74 :  sTILL pUSHING t
80d0 : __ __ __ BYT 48 45 20 6c 49 4d 49 54 53 20 6f 46 20 74 48 45 : HE lIMITS oF tHE
80e0 : __ __ __ BYT 20 63 36 34 20 69 4e 20 32 30 32 36 20 20 20 20 :  c64 iN 2026    
80f0 : __ __ __ BYT 2d 20 63 52 45 44 49 54 53 20 2d 20 20 63 4f 44 : - cREDITS -  cOD
8100 : __ __ __ BYT 45 20 2d 20 6f 53 43 41 52 36 34 20 63 4f 4d 50 : E - oSCAR64 cOMP
8110 : __ __ __ BYT 49 4c 45 52 20 62 59 20 44 52 4d 4f 52 54 41 4c : ILER bY DRMORTAL
8120 : __ __ __ BYT 57 4f 4d 42 41 54 20 20 6d 55 53 49 43 20 2d 20 : WOMBAT  mUSIC - 
8130 : __ __ __ BYT 66 4f 52 45 56 45 52 20 79 4f 55 4e 47 20 2d 20 : fOREVER yOUNG - 
8140 : __ __ __ BYT 34 45 56 2e 4d 4f 44 20 20 66 4f 4e 54 20 2d 20 : 4EV.MOD  fONT - 
8150 : __ __ __ BYT 73 4d 41 4c 4c 20 72 4f 55 4e 44 20 70 65 74 73 : sMALL rOUND pets
8160 : __ __ __ BYT 63 69 69 20 66 4f 4e 54 20 62 59 20 63 55 50 49 : cii fONT bY cUPI
8170 : __ __ __ BYT 44 20 20 20 20 2d 20 73 50 45 43 49 41 4c 20 74 : D    - sPECIAL t
8180 : __ __ __ BYT 48 41 4e 4b 53 20 2d 20 20 67 49 44 45 4f 4e 20 : HANKS -  gIDEON 
8190 : __ __ __ BYT 7a 57 45 49 4a 54 5a 45 52 20 2d 20 63 52 45 41 : zWEIJTZER - cREA
81a0 : __ __ __ BYT 54 4f 52 20 6f 46 20 74 48 45 20 75 4c 54 49 4d : TOR oF tHE uLTIM
81b0 : __ __ __ BYT 41 54 45 20 36 34 20 20 74 48 45 20 66 41 53 54 : ATE 64  tHE fAST
81c0 : __ __ __ BYT 45 53 54 20 63 36 34 20 63 4f 4d 50 41 54 49 42 : EST c64 cOMPATIB
81d0 : __ __ __ BYT 4c 45 20 6d 41 43 48 49 4e 45 20 20 20 20 74 48 : LE mACHINE    tH
81e0 : __ __ __ BYT 41 4e 4b 20 79 4f 55 20 66 4f 52 20 77 41 54 43 : ANK yOU fOR wATC
81f0 : __ __ __ BYT 48 49 4e 47 20 20 70 52 45 53 53 20 61 4e 59 20 : HING  pRESS aNY 
8200 : __ __ __ BYT 6b 45 59 20 74 4f 20 65 58 49 54 20 20 20 20 20 : kEY tO eXIT     
8210 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
8220 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
8230 : __ __ __ BYT 20 20 20 20 20 00                               :      .
--------------------------------------------------------------------
letter_width:
8236 : __ __ __ BYT 03 03 03 03 03 03 03 04 02 03 03 03 03 03 03 03 : ................
8246 : __ __ __ BYT 03 03 03 03 03 02 03 03 03 03 03 03 03 03 03 02 : ................
8256 : __ __ __ BYT 03 03 01 02 03 01 05 03 03 03 03 03 03 03 03 02 : ................
8266 : __ __ __ BYT 05 03 03 03 03 03 01 03 03 03 03 03 03 03 03 01 : ................
8276 : __ __ __ BYT 01 01 01 01 03 01 02 03 03 03 04 03 03 04 02 02 : ................
8286 : __ __ __ BYT 02 02 02 02 03 02                               : ......
--------------------------------------------------------------------
psin:
828c : __ __ __ BYT 04 04 04 05 05 05 05 06 06 06 06 07 07 07 07 07 : ................
829c : __ __ __ BYT 07 07 07 07 07 07 06 06 06 06 05 05 05 05 04 04 : ................
82ac : __ __ __ BYT 04 03 03 02 02 02 02 01 01 01 01 00 00 00 00 00 : ................
82bc : __ __ __ BYT 00 00 00 00 00 00 01 01 01 01 02 02 02 02 03 03 : ................
--------------------------------------------------------------------
pcolor:
82cc : __ __ __ BYT 02 08 07 0d 05 03 0e 06                         : ........
--------------------------------------------------------------------
cw:
82d4 : __ __ __ BSS	12
--------------------------------------------------------------------
Screen:
82e0 : __ __ __ BSS	8
--------------------------------------------------------------------
tworks:
82e8 : __ __ __ BSS	8
--------------------------------------------------------------------
mod_row_buf:
82f0 : __ __ __ BSS	16
--------------------------------------------------------------------
letter_start:
8300 : __ __ __ BYT 00 03 06 09 0c 0f 12 15 19 1b 1e 21 24 00 03 06 : ...........!$...
8310 : __ __ __ BYT 09 0c 0f 12 15 18 1a 1d 20 23 00 03 06 09 0c 0f : ........ #......
8320 : __ __ __ BYT 11 14 17 18 1a 1d 1e 23 00 03 06 09 0c 0f 12 15 : .......#........
8330 : __ __ __ BYT 17 1c 1f 22 00 00 03 04 07 0a 0d 10 13 16 19 1c : ..."............
8340 : __ __ __ BYT 1d 1e 1f 20 21 24 25 00 03 06 09 0d 10 13 17 19 : ... !$%.........
8350 : __ __ __ BYT 1b 1d 1f 21 23 26                               : ...!#&
--------------------------------------------------------------------
bitshift:
8356 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
8366 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8376 : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
8386 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
mx:
838e : __ __ __ BSS	8
--------------------------------------------------------------------
VScreen:
8396 : __ __ __ BSS	8
--------------------------------------------------------------------
py_cur:
839e : __ __ __ BSS	16
--------------------------------------------------------------------
px_cur:
83ae : __ __ __ BSS	16
--------------------------------------------------------------------
loops:
83be : __ __ __ BSS	2
--------------------------------------------------------------------
scr_letter:
83c0 : __ __ __ BSS	40
--------------------------------------------------------------------
dp_y:
83e8 : __ __ __ BSS	1
--------------------------------------------------------------------
df_x:
83e9 : __ __ __ BSS	1
--------------------------------------------------------------------
df_r:
83ea : __ __ __ BSS	1
--------------------------------------------------------------------
HeapNode:
83eb : __ __ __ BSS	4
--------------------------------------------------------------------
font_am_ch:
8400 : __ __ __ BYT 55 44 49 70 44 49 55 44 49 70 44 49 55 44 6e 55 : UDIpDIUDIpDIUDnU
8410 : __ __ __ BYT 44 6e 55 44 49 72 20 72 20 72 20 20 20 6e 72 20 : DnUDIr r r   nr 
8420 : __ __ __ BYT 2f 72 20 20 55 72 49 20 6b 46 73 6b 46 73 47 20 : /r  UrI kFskFsG 
8430 : __ __ __ BYT 20 48 20 48 6b 44 20 6b 44 20 47 44 6e 6b 44 73 :  H HkD kD GDnkDs
8440 : __ __ __ BYT 20 5d 20 70 20 48 6b 3c 20 5d 20 20 47 48 48 20 :  ] p Hk< ]  GHH 
8450 : __ __ __ BYT 47 20 48 47 20 48 47 20 20 48 20 48 47 20 20 47 : G HG HG  H HG  G
8460 : __ __ __ BYT 20 20 47 20 48 48 20 47 20 48 20 47 20 48 48 20 :   G HH G H G HH 
8470 : __ __ __ BYT 4d 47 20 20 47 5d 48 20 6d 20 7d 6d 46 4b 4a 46 : MG  G]H m }mFKJF
8480 : __ __ __ BYT 4b 6d 46 4b 4a 46 7d 71 20 20 4a 46 4b 71 20 71 : KmFKJF}q  JFKq q
8490 : __ __ __ BYT 20 71 20 4a 46 4b 71 20 27 6d 46 7d 4a 20 4b 20 :  q JFKq 'mF}J K 
84a0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
84b0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
84c0 : __ __ __ BYT 20 20 20 20 20 20 20 20                         :         
--------------------------------------------------------------------
scr_col:
84c8 : __ __ __ BSS	40
--------------------------------------------------------------------
font_nz_ch:
8500 : __ __ __ BYT 72 20 72 55 44 49 55 44 49 55 44 49 55 44 49 55 : r rUDIUDIUDIUDIU
8510 : __ __ __ BYT 44 49 70 72 6e 55 20 49 74 59 55 20 49 20 20 20 : DIprnU ItYU I   
8520 : __ __ __ BYT 47 20 47 43 44 6e 20 20 47 4d 48 47 20 48 47 20 : G GCDn  GMHG HG 
8530 : __ __ __ BYT 48 47 20 48 47 20 48 4a 44 49 20 5d 20 47 20 48 : HG HG HJDI ] G H
8540 : __ __ __ BYT 54 59 47 48 48 4d 20 2f 4a 46 73 20 4e 20 20 20 : TYGHHM /JFs N   
8550 : __ __ __ BYT 47 20 48 47 20 48 6b 46 4b 47 20 48 6b 46 4b 47 : G HG HkFKG HkFKG
8560 : __ __ __ BYT 20 48 20 5d 20 47 20 48 47 48 47 5d 48 20 56 20 :  H ] G HGHG]H V 
8570 : __ __ __ BYT 47 20 48 4e 20 48 20 20 71 20 71 4a 46 4b 5d 20 : G HN H  q qJFK] 
8580 : __ __ __ BYT 20 4a 46 4d 5d 20 4d 4a 46 4b 20 71 20 4a 46 4b :  JFM] MJFK q JFK
8590 : __ __ __ BYT 4a 4b 4a 71 4b 2f 20 4d 6d 46 4b 6d 46 7d 20 20 : JKJqK/ MmFKmF}  
85a0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
85b0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
85c0 : __ __ __ BYT 20 20 20 20 20 20 20 20                         :         
--------------------------------------------------------------------
font_lc_an_ch:
8600 : __ __ __ BYT 20 20 20 48 20 20 20 20 20 20 20 47 20 20 20 55 :    H       G   U
8610 : __ __ __ BYT 46 20 20 20 48 20 20 57 20 20 54 20 20 47 20 20 : F   H  W  T  G  
8620 : __ __ __ BYT 20 20 20 20 20 20 20 20 55 44 49 6b 44 49 55 44 :         UDIkDIUD
8630 : __ __ __ BYT 49 55 44 73 55 44 49 6b 46 55 44 49 6b 44 49 59 : IUDsUDIkFUDIkDIY
8640 : __ __ __ BYT 20 49 47 20 4e 42 70 44 72 44 49 70 44 49 20 20 :  IG NBpDrDIpDI  
8650 : __ __ __ BYT 55 44 73 5d 20 48 47 20 20 47 20 48 6b 46 4b 47 : UDs] HG  G HkFKG
8660 : __ __ __ BYT 20 47 20 48 47 20 48 48 20 48 6b 3c 20 5d 47 20 :  G HG HH Hk< ]G 
8670 : __ __ __ BYT 47 20 48 47 20 48 20 20 4a 46 7d 6d 46 4b 4a 46 : G HG H  JF}mFKJF
8680 : __ __ __ BYT 4b 4a 46 4b 4a 46 4b 4a 20 4a 46 73 42 20 42 71 : KJFKJFKJ JFsB Bq
8690 : __ __ __ BYT 20 48 42 20 4d 48 6d 20 7d 20 7d 6d 20 7d 20 20 :  HB MHm } }m }  
86a0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
86b0 : __ __ __ BYT 20 20 46 4b 20 20 20 20 46 4b 20 20 20 20 20 20 :   FK    FK      
86c0 : __ __ __ BYT 20 20 20 20 20 20 20 20                         :         
--------------------------------------------------------------------
font_lc_oz_ch:
8700 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 48 :                H
8710 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
8720 : __ __ __ BYT 20 20 20 20 20 20 20 20 55 44 49 55 44 49 55 44 :         UDIUDIUD
8730 : __ __ __ BYT 49 55 44 49 55 44 49 6b 44 20 55 20 49 54 59 55 : IUDIUDIkD U ITYU
8740 : __ __ __ BYT 20 55 20 49 4d 20 2f 55 20 49 70 44 6e 20 20 20 :  U IM /U IpDn   
8750 : __ __ __ BYT 47 20 48 47 20 48 47 20 48 47 20 20 4a 44 49 47 : G HG HG HG  JDIG
8760 : __ __ __ BYT 20 48 47 20 48 47 48 47 20 47 20 48 20 56 20 47 :  HG HGHG G H V G
8770 : __ __ __ BYT 20 48 55 44 4b 20 20 20 4a 46 4b 6b 46 4b 4a 46 :  HUDK   JFKkFKJF
8780 : __ __ __ BYT 73 71 20 20 4a 46 4b 4a 46 4b 4a 46 4b 4a 4b 4a : sq  JFKJFKJFKJKJ
8790 : __ __ __ BYT 46 71 46 4b 2f 20 4d 4a 46 73 6d 46 43 20 20 20 : FqFK/ MJFsmFC   
87a0 : __ __ __ BYT 20 20 20 48 20 20 20 20 47 20 20 20 20 20 20 20 :    H    G       
87b0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
87c0 : __ __ __ BYT 46 4b 20 20 20 20 20 20                         : FK      
--------------------------------------------------------------------
font_dig_ch:
8800 : __ __ __ BYT 55 44 49 49 55 44 49 55 44 49 55 20 49 70 44 6e : UDIIUDIUDIU IpDn
8810 : __ __ __ BYT 55 44 49 70 44 6e 55 44 49 55 44 49 20 20 59 20 : UDIpDnUDIUDI  Y 
8820 : __ __ __ BYT 20 20 20 20 42 42 42 20 47 4e 48 48 55 46 4b 20 :     BBB GNHHUFK 
8830 : __ __ __ BYT 46 73 47 20 48 4a 44 49 6b 44 49 20 55 7d 6b 46 : FsG HJDIkDI U}kF
8840 : __ __ __ BYT 73 47 20 48 51 20 48 51 20 20 20 2f 48 48 47 20 : sG HQ HQ   /HHG 
8850 : __ __ __ BYT 47 20 48 48 47 20 20 20 20 48 4a 46 73 47 20 48 : G HHG    HJFsG H
8860 : __ __ __ BYT 47 20 48 20 47 20 47 20 48 4a 46 73 51 20 5d 42 : G H G G HJFsQ ]B
8870 : __ __ __ BYT 42 20 4e 20 20 20 20 20 4a 46 4b 71 4a 46 7d 6d : B N     JFKqJF}m
8880 : __ __ __ BYT 46 4b 20 20 47 4a 46 4b 4a 46 4b 20 54 20 4a 46 : FK  GJFKJFK T JF
8890 : __ __ __ BYT 4b 4a 46 4b 20 51 51 48 48 2f 20 20 20 20 20 20 : KJFK QQHH/      
88a0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
88b0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 4b :                K
88c0 : __ __ __ BYT 4b 20 20 20 20 20 20 20                         : K       
--------------------------------------------------------------------
font_sym_ch:
8900 : __ __ __ BYT 55 5b 49 55 44 49 20 20 20 20 20 20 20 20 20 20 : U[IUDI          
8910 : __ __ __ BYT 70 44 49 20 20 20 20 47 47 55 44 20 2f 44 49 4d : pDI    GGUD /DIM
8920 : __ __ __ BYT 20 70 40 20 20 20 40 6e 4a 5b 49 6b 46 73 57 20 :  p@   @nJ[IkFsW 
8930 : __ __ __ BYT 2f 20 20 20 20 20 48 20 20 55 4b 46 43 44 20 5b : /     H  UKFCD [
8940 : __ __ __ BYT 5b 47 20 3c 20 20 48 20 3e 5d 20 55 44 49 20 42 : [G <  H >] UDI B
8950 : __ __ __ BYT 20 42 48 47 4d 48 20 4e 20 20 46 43 44 46 5b 44 :  BHGMH N  FCDF[D
8960 : __ __ __ BYT 20 47 20 46 43 44 20 5b 5b 47 20 20 4d 20 48 2f :  G FCD [[G  M H/
8970 : __ __ __ BYT 20 5d 20 47 4a 4b 20 42 4a 5b 4b 4a 46 5b 2f 20 :  ] GJK BJ[KJF[/ 
8980 : __ __ __ BYT 57 20 20 20 20 20 47 20 20 51 20 20 20 20 20 48 : W     G  Q     H
8990 : __ __ __ BYT 48 4a 46 20 20 46 4b 20 20 6d 40 4a 46 4b 40 7d : HJF  FK  m@JFK@}
89a0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
89b0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
89c0 : __ __ __ BYT 20 20 20 20 20 20 20 20                         :         
--------------------------------------------------------------------
font_am_co:
8a00 : __ __ __ BYT 0f 0d 01 0f 0d 01 0f 0d 01 0f 0d 01 0f 0d 01 0f : ................
8a10 : __ __ __ BYT 0d 01 0f 0d 01 0f 0d 01 0d 01 01 0d 0d 01 0f 0d : ................
8a20 : __ __ __ BYT 01 01 0d 0d 0d 0d 01 0d 0f 0d 0d 0f 0d 0d 0f 0f : ................
8a30 : __ __ __ BYT 0f 0f 0f 0d 0f 0d 0f 05 0f 0f 0f 0f 0f 0f 0d 0d : ................
8a40 : __ __ __ BYT 0d 0d 0d 0d 0d 0d 0f 01 0d 0d 0d 0f 0f 0d 0d 0d : ................
8a50 : __ __ __ BYT 05 0f 0d 05 0f 0d 05 0f 0d 05 0f 0d 05 0f 0d 05 : ................
8a60 : __ __ __ BYT 0f 05 05 0f 0d 05 0f 0d 0d 0f 0d 05 0f 0d 05 0d : ................
8a70 : __ __ __ BYT 0d 0f 0f 0d 05 0f 0f 0d 05 0f 0f 05 05 0f 05 05 : ................
8a80 : __ __ __ BYT 0f 05 05 0f 05 05 0f 05 05 05 05 05 0f 05 0f 0f : ................
8a90 : __ __ __ BYT 0d 05 0d 05 05 0f 05 0d 05 05 05 0f 05 0d 0f 0d : ................
8aa0 : __ __ __ BYT 0e 0f 0f 0e 0e 0e 0f 0f 0d 0d 0d 0d 0d 0d 0d 0e : ................
8ab0 : __ __ __ BYT 0e 0e 0e 0e 0f 0e 0f 0f 0f 0d 0d 0e 0e 0f 0f 0d : ................
8ac0 : __ __ __ BYT 0d 0e 0d 0d 0e 0e 0d 0e                         : ........
--------------------------------------------------------------------
font_nz_co:
8b00 : __ __ __ BYT 0f 0d 01 0f 0d 01 0d 0d 01 0f 0d 01 0d 0d 01 0f : ................
8b10 : __ __ __ BYT 0d 01 0f 0d 01 0f 0d 01 0d 01 0d 0d 01 0f 0d 01 : ................
8b20 : __ __ __ BYT 0f 0d 01 0f 0d 01 0d 0d 0f 0d 0d 0f 0d 0d 0f 0f : ................
8b30 : __ __ __ BYT 0d 0f 0d 0d 0f 0f 0d 0f 0d 01 05 0f 0f 0f 0f 0f : ................
8b40 : __ __ __ BYT 0f 0d 0f 0d 0d 0f 0d 01 0f 0d 0d 0f 0d 01 0d 0d : ................
8b50 : __ __ __ BYT 05 0f 0d 05 0f 0d 05 0f 0f 05 0f 0d 05 0f 0f 05 : ................
8b60 : __ __ __ BYT 0f 0d 05 0f 05 05 0f 0d 05 0f 05 0f 0f 0f 0d 0d : ................
8b70 : __ __ __ BYT 05 0f 0d 05 0f 0d 0d 0d 05 0f 0f 05 05 0f 05 05 : ................
8b80 : __ __ __ BYT 05 05 05 0f 05 05 05 05 05 0f 05 05 05 05 05 0f : ................
8b90 : __ __ __ BYT 05 0d 05 05 0f 05 0f 0d 05 05 0f 05 05 0f 0d 0d : ................
8ba0 : __ __ __ BYT 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e : ................
8bb0 : __ __ __ BYT 0e 0e 0e 0e 0e 0e 0e 0f 0e 0e 0e 0e 0e 05 05 05 : ................
8bc0 : __ __ __ BYT 0e 05 05 05 0e 0e 05 0e                         : ........
--------------------------------------------------------------------
font_lc_an_co:
8c00 : __ __ __ BYT 0e 0e 0e 0d 0d 0e 0e 0e 0e 0e 0f 0d 0e 0e 0e 0d : ................
8c10 : __ __ __ BYT 01 0e 0e 0e 0f 0f 0e 01 0e 0e 01 0f 0e 01 0f 0e : ................
8c20 : __ __ __ BYT 0e 0e 0e 0e 0e 0e 0e 0e 0f 0d 01 0f 0d 01 0f 0d : ................
8c30 : __ __ __ BYT 01 0d 01 01 0f 0d 01 0d 01 0f 0d 01 0d 01 01 01 : ................
8c40 : __ __ __ BYT 0f 0d 0d 0d 01 0d 0f 0d 01 0f 01 0f 0d 01 0e 0e : ................
8c50 : __ __ __ BYT 05 0d 0d 05 0e 0d 0f 0f 0e 0f 0f 0d 0f 0d 01 0f : ................
8c60 : __ __ __ BYT 0f 0f 0f 0d 0f 0f 0d 0d 0f 01 0f 0d 0f 0f 05 0f : ................
8c70 : __ __ __ BYT 0d 0f 0d 05 0f 0d 0f 0e 05 05 0f 05 05 0f 05 0f : ................
8c80 : __ __ __ BYT 0d 05 05 0f 05 05 0f 05 0f 05 05 0f 05 0f 0f 0f : ................
8c90 : __ __ __ BYT 0f 0d 05 05 05 05 05 0f 0f 0f 0f 05 0f 0f 0f 0e : ................
8ca0 : __ __ __ BYT 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0f 0f 0e 0e 0f : ................
8cb0 : __ __ __ BYT 0f 0f 05 0f 0f 0f 0f 0f 05 0f 0f 0f 0f 0f 0f 0f : ................
8cc0 : __ __ __ BYT 0e 0e 0e 0e 0e 0e 0e 0e                         : ........
--------------------------------------------------------------------
font_lc_oz_co:
8d00 : __ __ __ BYT 0e 0e 0e 0f 0f 0e 0e 0e 0e 0e 0e 0e 0e 0f 0e 01 : ................
8d10 : __ __ __ BYT 0e 0e 0f 0f 0f 0e 0f 0f 0f 0f 0e 0e 0f 0f 0f 0f : ................
8d20 : __ __ __ BYT 0f 0f 0f 0e 0e 0e 0e 0e 0f 0d 01 0f 0d 01 0f 0d : ................
8d30 : __ __ __ BYT 01 0d 01 0d 0d 01 0d 0d 01 0f 0d 0f 01 0d 01 0d : ................
8d40 : __ __ __ BYT 0f 01 0f 01 01 0f 01 0d 0f 01 0f 0d 01 0e 0e 0e : ................
8d50 : __ __ __ BYT 05 0f 0d 0f 0f 0d 0f 0f 0d 0f 0f 0f 0d 0f 0f 0f : ................
8d60 : __ __ __ BYT 0f 0d 0f 0f 01 0f 0d 0f 0f 0d 0f 0d 0f 0d 0f 0f : ................
8d70 : __ __ __ BYT 0f 01 0f 0f 0d 0e 0e 0e 05 05 0f 05 0f 0f 05 05 : ................
8d80 : __ __ __ BYT 0f 05 0f 0f 05 05 0f 05 05 0f 05 0f 0d 05 0f 05 : ................
8d90 : __ __ __ BYT 05 0f 05 0f 05 0f 0f 05 0f 0d 05 05 0f 0f 0e 0e : ................
8da0 : __ __ __ BYT 0e 0f 0f 05 0e 0f 0f 0e 05 0e 0f 0e 0e 0e 0e 0e : ................
8db0 : __ __ __ BYT 0e 0e 0f 0f 0f 0f 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e : ................
8dc0 : __ __ __ BYT 05 0f 0e 0e 0e 0e 0e 0e                         : ........
--------------------------------------------------------------------
font_dig_co:
8e00 : __ __ __ BYT 0f 0d 01 01 0f 0d 01 0d 01 01 0d 0f 01 0f 0d 01 : ................
8e10 : __ __ __ BYT 0f 0d 01 0f 0d 01 0f 0d 01 0d 01 01 0f 0f 01 01 : ................
8e20 : __ __ __ BYT 0f 0f 0f 0f 01 01 01 0e 0f 0f 01 0d 0f 0d 01 0f : ................
8e30 : __ __ __ BYT 0f 0d 0f 0f 0d 0f 0d 01 0f 0d 01 0f 0f 0d 0f 0d : ................
8e40 : __ __ __ BYT 01 0f 0f 0d 0d 0f 0d 0d 0f 0e 0f 0d 0d 0d 0d 0e : ................
8e50 : __ __ __ BYT 05 0f 0d 0f 05 0f 0f 0f 0f 0f 05 05 0f 05 0f 0d : ................
8e60 : __ __ __ BYT 05 0f 0d 0f 0f 0e 05 0f 0d 05 0f 0f 0f 0f 0f 0f : ................
8e70 : __ __ __ BYT 0d 0f 0f 0f 0f 0e 0e 0e 05 05 0f 05 05 05 0f 05 : ................
8e80 : __ __ __ BYT 05 0f 0f 0f 05 05 05 0f 05 05 0f 0f 05 0e 05 05 : ................
8e90 : __ __ __ BYT 0f 05 05 0f 0f 0f 05 05 0f 05 0e 0e 0e 0e 0e 0e : ................
8ea0 : __ __ __ BYT 0e 0f 0f 0e 0e 0e 0f 0f 0f 0f 0e 0e 0f 0f 0f 0e : ................
8eb0 : __ __ __ BYT 0e 0e 0e 0e 0f 0e 0f 0f 0f 0f 0f 0e 0e 0f 0f 05 : ................
8ec0 : __ __ __ BYT 05 0e 0e 0e 0e 0e 0e 0e                         : ........
--------------------------------------------------------------------
font_sym_co:
8f00 : __ __ __ BYT 0f 0d 01 0d 01 01 0e 0f 0f 0e 0e 0e 0e 0f 0e 0f : ................
8f10 : __ __ __ BYT 0d 01 01 0e 0e 0e 0e 0d 01 0d 01 0f 01 0d 01 01 : ................
8f20 : __ __ __ BYT 0e 0d 01 0e 0e 0e 0d 01 0f 0d 01 0f 0f 0d 0d 0f : ................
8f30 : __ __ __ BYT 01 0e 0e 0e 0f 0f 01 0f 0f 0f 0d 0f 0d 01 0f 0f : ................
8f40 : __ __ __ BYT 0d 0f 0f 0d 0f 0f 0d 0e 0d 0f 0f 0d 0d 01 0f 0d : ................
8f50 : __ __ __ BYT 0f 0f 0d 05 0f 0d 0f 0d 0f 0f 0f 0d 01 0f 0d 0f : ................
8f60 : __ __ __ BYT 0f 05 0e 0f 0d 01 0e 0f 0f 05 0f 0e 0f 0f 0f 0f : ................
8f70 : __ __ __ BYT 0e 05 0f 0f 0d 0f 0f 0f 05 05 0f 05 0f 0f 0f 0e : ................
8f80 : __ __ __ BYT 0f 0f 0e 0f 0e 0f 0f 0f 0e 05 0e 0e 0e 0e 0e 05 : ................
8f90 : __ __ __ BYT 05 05 0f 0f 0e 05 05 0e 0e 05 0f 05 05 0f 0f 05 : ................
8fa0 : __ __ __ BYT 0e 0e 0e 0e 0f 0f 0e 0e 0f 0f 0f 0e 0e 0e 0f 0e : ................
8fb0 : __ __ __ BYT 0e 0f 0d 0e 0e 0e 0e 0f 0e 0d 0d 0d 0d 0d 0e 0e : ................
8fc0 : __ __ __ BYT 0e 0e 0e 0e 0e 0d 0f 0e                         : ........
--------------------------------------------------------------------
uii_data:
8fc8 : __ __ __ BSS	513
--------------------------------------------------------------------
uii_status:
91c9 : __ __ __ BSS	257
--------------------------------------------------------------------
hdr:
92ca : __ __ __ BSS	1084
--------------------------------------------------------------------
modplay:
9708 : __ __ __ BSS	938
--------------------------------------------------------------------
BLIT_CODE:
9b00 : __ __ __ BSS	224
--------------------------------------------------------------------
tbuffer:
9be0 : __ __ __ BSS	320
--------------------------------------------------------------------
row_sin:
9d20 : __ __ __ BSS	200
--------------------------------------------------------------------
row_buf:
9e00 : __ __ __ BSS	160
--------------------------------------------------------------------
tex_flat:
9ea0 : __ __ __ BSS	1024
