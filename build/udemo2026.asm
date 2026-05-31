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
0811 : a2 90 __ LDX #$90
0813 : a0 c8 __ LDY #$c8
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 a3 __ CPX #$a3
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
0a11 : 8d 02 a0 STA $a002 ; (tex_flat[0] + 98)
0a14 : a9 03 __ LDA #$03
0a16 : 8d 03 a0 STA $a003 ; (tex_flat[0] + 99)
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
0a36 : a9 5c __ LDA #$5c
0a38 : 8d 18 03 STA $0318 
0a3b : a9 0e __ LDA #$0e
0a3d : 8d 19 03 STA $0319 
0a40 : a9 72 __ LDA #$72
0a42 : 85 16 __ STA P9 
0a44 : a9 10 __ LDA #$10
0a46 : 85 17 __ STA P10 
0a48 : 20 67 0e JSR $0e67 ; (screen_init.s4 + 0)
0a4b : a9 23 __ LDA #$23
0a4d : 85 10 __ STA P3 
0a4f : a9 11 __ LDA #$11
0a51 : 85 11 __ STA P4 
0a53 : 20 9c 10 JSR $109c ; (screen_info.s4 + 0)
0a56 : a9 00 __ LDA #$00
0a58 : 8d 09 dc STA $dc09 
0a5b : 8d 08 dc STA $dc08 
0a5e : 85 54 __ STA T3 + 0 
.l5:
0a60 : 20 44 11 JSR $1144 ; (uii_detect.s4 + 0)
0a63 : aa __ __ TAX
0a64 : d0 07 __ BNE $0a6d ; (main.s7 + 0)
.s6:
0a66 : ad 09 dc LDA $dc09 
0a69 : c9 0a __ CMP #$0a
0a6b : 90 f3 __ BCC $0a60 ; (main.l5 + 0)
.s7:
0a6d : 20 44 11 JSR $1144 ; (uii_detect.s4 + 0)
0a70 : aa __ __ TAX
0a71 : d0 3b __ BNE $0aae ; (main.s9 + 0)
.s8:
0a73 : 85 12 __ STA P5 
0a75 : a9 c8 __ LDA #$c8
0a77 : 85 10 __ STA P3 
0a79 : a9 11 __ LDA #$11
0a7b : 85 14 __ STA P7 
0a7d : a9 11 __ LDA #$11
0a7f : 85 11 __ STA P4 
0a81 : a9 ce __ LDA #$ce
0a83 : 85 13 __ STA P6 
0a85 : 20 65 11 JSR $1165 ; (screen_result.s4 + 0)
0a88 : a9 62 __ LDA #$62
0a8a : 85 12 __ STA P5 
0a8c : a9 12 __ LDA #$12
0a8e : 85 13 __ STA P6 
0a90 : a9 12 __ LDA #$12
0a92 : a2 87 __ LDX #$87
.s70:
0a94 : 86 14 __ STX P7 
0a96 : 85 15 __ STA P8 
0a98 : 20 db 11 JSR $11db ; (screen_error_exit.s4 + 0)
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
0ab0 : 8d fb 78 STA $78fb ; (uii_target + 0)
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
0ac9 : 20 a2 12 JSR $12a2 ; (uii_sendcommand.s4 + 0)
0acc : 20 1d 13 JSR $131d ; (uii_readdata.s4 + 0)
0acf : 20 4d 13 JSR $134d ; (uii_readstatus.s4 + 0)
0ad2 : 20 ab 13 JSR $13ab ; (uii_accept.s4 + 0)
0ad5 : ad c9 92 LDA $92c9 ; (uii_status[0] + 0)
0ad8 : c9 30 __ CMP #$30
0ada : d0 12 __ BNE $0aee ; (main.s10 + 0)
.s67:
0adc : ad ca 92 LDA $92ca ; (uii_status[0] + 1)
0adf : c9 30 __ CMP #$30
0ae1 : d0 0b __ BNE $0aee ; (main.s10 + 0)
.s68:
0ae3 : ad c8 90 LDA $90c8 ; (uii_data[0] + 0)
0ae6 : f0 06 __ BEQ $0aee ; (main.s10 + 0)
.s69:
0ae8 : 20 bb 13 JSR $13bb ; (uci_to_upper@proxy + 0)
0aeb : 4c f9 0a JMP $0af9 ; (main.s12 + 0)
.s10:
0aee : a2 ff __ LDX #$ff
.l11:
0af0 : e8 __ __ INX
0af1 : bd f5 13 LDA $13f5,x 
0af4 : 9d 93 bf STA $bf93,x ; (detail[0] + 0)
0af7 : d0 f7 __ BNE $0af0 ; (main.l11 + 0)
.s12:
0af9 : a9 c8 __ LDA #$c8
0afb : 85 10 __ STA P3 
0afd : a9 11 __ LDA #$11
0aff : 85 11 __ STA P4 
0b01 : 20 59 11 JSR $1159 ; (screen_result@proxy + 0)
0b04 : 20 7d 13 JSR $137d ; (uii_get_hwinfo.s4 + 0)
0b07 : ad c9 92 LDA $92c9 ; (uii_status[0] + 0)
0b0a : c9 30 __ CMP #$30
0b0c : d0 2e __ BNE $0b3c ; (main.s13 + 0)
.s64:
0b0e : ad ca 92 LDA $92ca ; (uii_status[0] + 1)
0b11 : c9 30 __ CMP #$30
0b13 : d0 27 __ BNE $0b3c ; (main.s13 + 0)
.s65:
0b15 : 20 bb 13 JSR $13bb ; (uci_to_upper@proxy + 0)
0b18 : aa __ __ TAX
0b19 : f0 21 __ BEQ $0b3c ; (main.s13 + 0)
.s66:
0b1b : a9 01 __ LDA #$01
0b1d : 85 0f __ STA P2 
0b1f : a9 14 __ LDA #$14
0b21 : 85 0e __ STA P1 
0b23 : a9 00 __ LDA #$00
0b25 : 85 0d __ STA P0 
0b27 : 20 c3 10 JSR $10c3 ; (cwin_put_string.s4 + 0)
0b2a : a9 93 __ LDA #$93
0b2c : 85 0d __ STA P0 
0b2e : a9 03 __ LDA #$03
0b30 : 85 0f __ STA P2 
0b32 : a9 bf __ LDA #$bf
0b34 : 85 0e __ STA P1 
0b36 : 20 c3 10 JSR $10c3 ; (cwin_put_string.s4 + 0)
0b39 : 20 a3 10 JSR $10a3 ; (cwin_cursor_newline.s4 + 0)
.s13:
0b3c : a9 0b __ LDA #$0b
0b3e : 85 10 __ STA P3 
0b40 : a9 14 __ LDA #$14
0b42 : 85 11 __ STA P4 
0b44 : 20 9c 10 JSR $109c ; (screen_info.s4 + 0)
0b47 : 20 1b 14 JSR $141b ; (detect_reu.s4 + 0)
0b4a : c9 10 __ CMP #$10
0b4c : b0 03 __ BCS $0b51 ; (main.s14 + 0)
0b4e : 4c 35 0e JMP $0e35 ; (main.s60 + 0)
.s14:
0b51 : a9 15 __ LDA #$15
0b53 : 85 14 __ STA P7 
0b55 : a9 9a __ LDA #$9a
0b57 : 85 13 __ STA P6 
0b59 : 20 10 79 JSR $7910 ; (screen_result@proxy + 0)
0b5c : a9 a0 __ LDA #$a0
0b5e : 85 10 __ STA P3 
0b60 : a9 15 __ LDA #$15
0b62 : 85 11 __ STA P4 
0b64 : 20 9c 10 JSR $109c ; (screen_info.s4 + 0)
0b67 : 20 b7 15 JSR $15b7 ; (turbo_detect.s4 + 0)
0b6a : a9 8f __ LDA #$8f
0b6c : 85 10 __ STA P3 
0b6e : a9 16 __ LDA #$16
0b70 : 85 11 __ STA P4 
0b72 : a5 1b __ LDA ACCU + 0 
0b74 : d0 1b __ BNE $0b91 ; (main.s34 + 0)
.s15:
0b76 : c6 12 __ DEC P5 
0b78 : a9 95 __ LDA #$95
0b7a : 85 13 __ STA P6 
0b7c : a9 16 __ LDA #$16
0b7e : 85 14 __ STA P7 
0b80 : 20 65 11 JSR $1165 ; (screen_result.s4 + 0)
0b83 : a9 aa __ LDA #$aa
0b85 : 85 10 __ STA P3 
0b87 : a9 16 __ LDA #$16
0b89 : 85 11 __ STA P4 
0b8b : 20 2a 12 JSR $122a ; (screen_hint.s4 + 0)
0b8e : 4c 32 0c JMP $0c32 ; (main.s16 + 0)
.s34:
0b91 : c9 02 __ CMP #$02
0b93 : d0 14 __ BNE $0ba9 ; (main.s35 + 0)
.s59:
0b95 : a9 16 __ LDA #$16
0b97 : a2 cc __ LDX #$cc
.s36:
0b99 : 86 1b __ STX ACCU + 0 
0b9b : 85 1c __ STA ACCU + 1 
0b9d : a9 93 __ LDA #$93
0b9f : 85 13 __ STA P6 
0ba1 : a9 bf __ LDA #$bf
0ba3 : 85 14 __ STA P7 
0ba5 : a0 ff __ LDY #$ff
0ba7 : d0 7e __ BNE $0c27 ; (main.l37 + 0)
.s35:
0ba9 : c9 01 __ CMP #$01
0bab : f0 07 __ BEQ $0bb4 ; (main.s39 + 0)
.s71:
0bad : a9 16 __ LDA #$16
0baf : a2 8f __ LDX #$8f
0bb1 : 4c 99 0b JMP $0b99 ; (main.s36 + 0)
.s39:
0bb4 : 20 fc 13 JSR $13fc ; (turbo_get.s3 + 0)
0bb7 : 29 0f __ AND #$0f
0bb9 : c9 0e __ CMP #$0e
0bbb : d0 07 __ BNE $0bc4 ; (main.s40 + 0)
.s58:
0bbd : a9 16 __ LDA #$16
0bbf : a2 d3 __ LDX #$d3
0bc1 : 4c 99 0b JMP $0b99 ; (main.s36 + 0)
.s40:
0bc4 : c9 0d __ CMP #$0d
0bc6 : d0 07 __ BNE $0bcf ; (main.s41 + 0)
.s57:
0bc8 : a9 16 __ LDA #$16
0bca : a2 da __ LDX #$da
0bcc : 4c 99 0b JMP $0b99 ; (main.s36 + 0)
.s41:
0bcf : c9 0c __ CMP #$0c
0bd1 : d0 07 __ BNE $0bda ; (main.s42 + 0)
.s56:
0bd3 : a9 16 __ LDA #$16
0bd5 : a2 e1 __ LDX #$e1
0bd7 : 4c 99 0b JMP $0b99 ; (main.s36 + 0)
.s42:
0bda : c9 0b __ CMP #$0b
0bdc : d0 07 __ BNE $0be5 ; (main.s43 + 0)
.s55:
0bde : a9 16 __ LDA #$16
0be0 : a2 e8 __ LDX #$e8
0be2 : 4c 99 0b JMP $0b99 ; (main.s36 + 0)
.s43:
0be5 : c9 0a __ CMP #$0a
0be7 : d0 07 __ BNE $0bf0 ; (main.s44 + 0)
.s54:
0be9 : a9 16 __ LDA #$16
0beb : a2 ef __ LDX #$ef
0bed : 4c 99 0b JMP $0b99 ; (main.s36 + 0)
.s44:
0bf0 : c9 09 __ CMP #$09
0bf2 : d0 07 __ BNE $0bfb ; (main.s45 + 0)
.s53:
0bf4 : a9 16 __ LDA #$16
0bf6 : a2 f6 __ LDX #$f6
0bf8 : 4c 99 0b JMP $0b99 ; (main.s36 + 0)
.s45:
0bfb : c9 08 __ CMP #$08
0bfd : d0 07 __ BNE $0c06 ; (main.s46 + 0)
.s52:
0bff : a9 17 __ LDA #$17
0c01 : a2 00 __ LDX #$00
0c03 : 4c 99 0b JMP $0b99 ; (main.s36 + 0)
.s46:
0c06 : c9 07 __ CMP #$07
0c08 : d0 07 __ BNE $0c11 ; (main.s47 + 0)
.s51:
0c0a : a9 17 __ LDA #$17
0c0c : a2 07 __ LDX #$07
0c0e : 4c 99 0b JMP $0b99 ; (main.s36 + 0)
.s47:
0c11 : c9 06 __ CMP #$06
0c13 : d0 07 __ BNE $0c1c ; (main.s48 + 0)
.s50:
0c15 : a9 17 __ LDA #$17
0c17 : a2 0e __ LDX #$0e
0c19 : 4c 99 0b JMP $0b99 ; (main.s36 + 0)
.s48:
0c1c : c9 05 __ CMP #$05
0c1e : d0 8d __ BNE $0bad ; (main.s71 + 0)
.s49:
0c20 : a9 17 __ LDA #$17
0c22 : a2 15 __ LDX #$15
0c24 : 4c 99 0b JMP $0b99 ; (main.s36 + 0)
.l37:
0c27 : c8 __ __ INY
0c28 : b1 1b __ LDA (ACCU + 0),y 
0c2a : 99 93 bf STA $bf93,y ; (detail[0] + 0)
0c2d : d0 f8 __ BNE $0c27 ; (main.l37 + 0)
.s38:
0c2f : 20 65 11 JSR $1165 ; (screen_result.s4 + 0)
.s16:
0c32 : a9 1b __ LDA #$1b
0c34 : 85 10 __ STA P3 
0c36 : a9 17 __ LDA #$17
0c38 : 85 11 __ STA P4 
0c3a : 20 9c 10 JSR $109c ; (screen_info.s4 + 0)
0c3d : 20 36 17 JSR $1736 ; (audio_detect.s4 + 0)
0c40 : aa __ __ TAX
0c41 : d0 23 __ BNE $0c66 ; (main.s25 + 0)
.s17:
0c43 : 85 12 __ STA P5 
0c45 : a9 af __ LDA #$af
0c47 : 85 10 __ STA P3 
0c49 : a9 17 __ LDA #$17
0c4b : 85 14 __ STA P7 
0c4d : a9 17 __ LDA #$17
0c4f : 85 11 __ STA P4 
0c51 : a9 b5 __ LDA #$b5
0c53 : 85 13 __ STA P6 
0c55 : 20 65 11 JSR $1165 ; (screen_result.s4 + 0)
0c58 : a9 c6 __ LDA #$c6
0c5a : 85 10 __ STA P3 
0c5c : a9 17 __ LDA #$17
0c5e : 85 11 __ STA P4 
0c60 : 20 2a 12 JSR $122a ; (screen_hint.s4 + 0)
0c63 : 4c 06 0d JMP $0d06 ; (main.s18 + 0)
.s25:
0c66 : ad 21 df LDA $df21 
0c69 : 85 53 __ STA T2 + 0 
0c6b : 85 0f __ STA P2 
0c6d : a9 8f __ LDA #$8f
0c6f : 85 0d __ STA P0 
0c71 : a9 bf __ LDA #$bf
0c73 : 85 0e __ STA P1 
0c75 : 20 e5 17 JSR $17e5 ; (fmt_dec.s4 + 0)
0c78 : a9 93 __ LDA #$93
0c7a : 85 0d __ STA P0 
0c7c : a9 bf __ LDA #$bf
0c7e : 85 0e __ STA P1 
0c80 : a9 8f __ LDA #$8f
0c82 : 85 0f __ STA P2 
0c84 : a9 bf __ LDA #$bf
0c86 : 85 10 __ STA P3 
0c88 : a2 ff __ LDX #$ff
.l26:
0c8a : e8 __ __ INX
0c8b : bd fd 16 LDA $16fd,x 
0c8e : 9d 93 bf STA $bf93,x ; (detail[0] + 0)
0c91 : d0 f7 __ BNE $0c8a ; (main.l26 + 0)
.s27:
0c93 : 20 35 18 JSR $1835 ; (strcat.s4 + 0)
0c96 : a9 17 __ LDA #$17
0c98 : 85 11 __ STA P4 
0c9a : a9 af __ LDA #$af
0c9c : 85 10 __ STA P3 
0c9e : 20 59 11 JSR $1159 ; (screen_result@proxy + 0)
0ca1 : a5 53 __ LDA T2 + 0 
0ca3 : f0 61 __ BEQ $0d06 ; (main.s18 + 0)
.s28:
0ca5 : a9 68 __ LDA #$68
0ca7 : 85 10 __ STA P3 
0ca9 : a9 18 __ LDA #$18
0cab : 85 11 __ STA P4 
0cad : 20 9c 10 JSR $109c ; (screen_info.s4 + 0)
0cb0 : 20 79 18 JSR $1879 ; (uii_change_dir.s4 + 0)
0cb3 : 20 00 19 JSR $1900 ; (modplay_load.s4 + 0)
0cb6 : a5 1b __ LDA ACCU + 0 
0cb8 : d0 1a __ BNE $0cd4 ; (main.s31 + 0)
.s29:
0cba : a9 0b __ LDA #$0b
0cbc : 85 10 __ STA P3 
0cbe : a9 1d __ LDA #$1d
0cc0 : 85 11 __ STA P4 
0cc2 : a9 1d __ LDA #$1d
0cc4 : a2 28 __ LDX #$28
.s30:
0cc6 : 86 13 __ STX P6 
0cc8 : 85 14 __ STA P7 
0cca : a9 00 __ LDA #$00
0ccc : 85 12 __ STA P5 
.s72:
0cce : 20 65 11 JSR $1165 ; (screen_result.s4 + 0)
0cd1 : 4c 06 0d JMP $0d06 ; (main.s18 + 0)
.s31:
0cd4 : 20 47 1a JSR $1a47 ; (modplay_init.s4 + 0)
0cd7 : a9 0b __ LDA #$0b
0cd9 : 85 10 __ STA P3 
0cdb : a9 1d __ LDA #$1d
0cdd : 85 11 __ STA P4 
0cdf : a5 1b __ LDA ACCU + 0 
0ce1 : f0 1c __ BEQ $0cff ; (main.s32 + 0)
.s33:
0ce3 : a9 01 __ LDA #$01
0ce5 : e6 54 __ INC T3 + 0 
0ce7 : 85 12 __ STA P5 
0ce9 : 8d 97 98 STA $9897 ; (modplay.stereo + 0)
0cec : 8d 99 98 STA $9899 ; (modplay.loop_song + 0)
0cef : a9 a0 __ LDA #$a0
0cf1 : 8d 96 98 STA $9896 ; (modplay.master_volume + 0)
0cf4 : a9 11 __ LDA #$11
0cf6 : 85 13 __ STA P6 
0cf8 : a9 1d __ LDA #$1d
0cfa : 85 14 __ STA P7 
0cfc : 4c ce 0c JMP $0cce ; (main.s72 + 0)
.s32:
0cff : a9 1d __ LDA #$1d
0d01 : a2 19 __ LDX #$19
0d03 : 4c c6 0c JMP $0cc6 ; (main.s30 + 0)
.s18:
0d06 : 20 a3 10 JSR $10a3 ; (cwin_cursor_newline.s4 + 0)
0d09 : a9 37 __ LDA #$37
0d0b : 85 10 __ STA P3 
0d0d : a9 1d __ LDA #$1d
0d0f : 85 11 __ STA P4 
0d11 : 20 9c 10 JSR $109c ; (screen_info.s4 + 0)
0d14 : 20 a3 10 JSR $10a3 ; (cwin_cursor_newline.s4 + 0)
0d17 : a9 aa __ LDA #$aa
0d19 : 85 10 __ STA P3 
0d1b : a9 1d __ LDA #$1d
0d1d : 85 11 __ STA P4 
0d1f : 20 4b 1d JSR $1d4b ; (screen_wait_key.s4 + 0)
0d22 : 20 cb 1d JSR $1dcb ; (gears_run.s1 + 0)
0d25 : a5 54 __ LDA T3 + 0 
0d27 : f0 03 __ BEQ $0d2c ; (main.s19 + 0)
.s24:
0d29 : 20 8a 3e JSR $3e8a ; (modplay_start.s4 + 0)
.s19:
0d2c : 20 ff 4d JSR $4dff ; (mandel_run.s4 + 0)
0d2f : 20 bd 52 JSR $52bd ; (ball_run.s1 + 0)
0d32 : 20 cd 60 JSR $60cd ; (vectors_run.s1 + 0)
0d35 : 20 cd 65 JSR $65cd ; (plasma_run.s1 + 0)
0d38 : 20 88 68 JSR $6888 ; (tunnel_run.s1 + 0)
0d3b : a9 10 __ LDA #$10
0d3d : 8d 02 a0 STA $a002 ; (tex_flat[0] + 98)
0d40 : a9 03 __ LDA #$03
0d42 : 8d 03 a0 STA $a003 ; (tex_flat[0] + 99)
0d45 : 20 17 6e JSR $6e17 ; (scroller_run.s4 + 0)
0d48 : a5 54 __ LDA T3 + 0 
0d4a : f0 03 __ BEQ $0d4f ; (main.s20 + 0)
.s23:
0d4c : 20 2d 73 JSR $732d ; (modplay_stop.s4 + 0)
.s20:
0d4f : a9 00 __ LDA #$00
0d51 : 85 c6 __ STA $c6 
0d53 : 20 f3 15 JSR $15f3 ; (turbo_set.s4 + 0)
0d56 : a9 66 __ LDA #$66
0d58 : 85 16 __ STA P9 
0d5a : a9 73 __ LDA #$73
0d5c : 85 17 __ STA P10 
0d5e : 20 67 0e JSR $0e67 ; (screen_init.s4 + 0)
0d61 : 20 a3 10 JSR $10a3 ; (cwin_cursor_newline.s4 + 0)
0d64 : a9 7b __ LDA #$7b
0d66 : 85 10 __ STA P3 
0d68 : a9 73 __ LDA #$73
0d6a : 85 11 __ STA P4 
0d6c : 20 9c 10 JSR $109c ; (screen_info.s4 + 0)
0d6f : a9 01 __ LDA #$01
0d71 : 85 12 __ STA P5 
0d73 : 20 a3 10 JSR $10a3 ; (cwin_cursor_newline.s4 + 0)
0d76 : a9 93 __ LDA #$93
0d78 : 85 10 __ STA P3 
0d7a : a9 73 __ LDA #$73
0d7c : 85 14 __ STA P7 
0d7e : a9 73 __ LDA #$73
0d80 : 85 11 __ STA P4 
0d82 : a9 99 __ LDA #$99
0d84 : 85 13 __ STA P6 
0d86 : 20 65 11 JSR $1165 ; (screen_result.s4 + 0)
0d89 : a9 af __ LDA #$af
0d8b : 85 10 __ STA P3 
0d8d : a9 73 __ LDA #$73
0d8f : 85 14 __ STA P7 
0d91 : a9 73 __ LDA #$73
0d93 : 85 11 __ STA P4 
0d95 : a9 b5 __ LDA #$b5
0d97 : 85 13 __ STA P6 
0d99 : 20 65 11 JSR $1165 ; (screen_result.s4 + 0)
0d9c : a9 c4 __ LDA #$c4
0d9e : 85 10 __ STA P3 
0da0 : a9 73 __ LDA #$73
0da2 : 85 14 __ STA P7 
0da4 : a9 73 __ LDA #$73
0da6 : 85 11 __ STA P4 
0da8 : a9 ca __ LDA #$ca
0daa : 85 13 __ STA P6 
0dac : 20 65 11 JSR $1165 ; (screen_result.s4 + 0)
0daf : a9 dc __ LDA #$dc
0db1 : 85 10 __ STA P3 
0db3 : a9 73 __ LDA #$73
0db5 : 85 14 __ STA P7 
0db7 : a9 73 __ LDA #$73
0db9 : 85 11 __ STA P4 
0dbb : a9 e2 __ LDA #$e2
0dbd : 85 13 __ STA P6 
0dbf : 20 65 11 JSR $1165 ; (screen_result.s4 + 0)
0dc2 : a9 f6 __ LDA #$f6
0dc4 : 85 10 __ STA P3 
0dc6 : a9 74 __ LDA #$74
0dc8 : 85 14 __ STA P7 
0dca : a9 73 __ LDA #$73
0dcc : 85 11 __ STA P4 
0dce : a9 00 __ LDA #$00
0dd0 : 85 13 __ STA P6 
0dd2 : 20 65 11 JSR $1165 ; (screen_result.s4 + 0)
0dd5 : a9 16 __ LDA #$16
0dd7 : 85 10 __ STA P3 
0dd9 : a9 74 __ LDA #$74
0ddb : 85 14 __ STA P7 
0ddd : a9 74 __ LDA #$74
0ddf : 85 11 __ STA P4 
0de1 : a9 1c __ LDA #$1c
0de3 : 85 13 __ STA P6 
0de5 : 20 65 11 JSR $1165 ; (screen_result.s4 + 0)
0de8 : a5 54 __ LDA T3 + 0 
0dea : f0 13 __ BEQ $0dff ; (main.s21 + 0)
.s22:
0dec : a9 0b __ LDA #$0b
0dee : 85 10 __ STA P3 
0df0 : a9 74 __ LDA #$74
0df2 : 85 14 __ STA P7 
0df4 : a9 1d __ LDA #$1d
0df6 : 85 11 __ STA P4 
0df8 : a9 2e __ LDA #$2e
0dfa : 85 13 __ STA P6 
0dfc : 20 65 11 JSR $1165 ; (screen_result.s4 + 0)
.s21:
0dff : 20 a3 10 JSR $10a3 ; (cwin_cursor_newline.s4 + 0)
0e02 : a9 45 __ LDA #$45
0e04 : 85 10 __ STA P3 
0e06 : a9 74 __ LDA #$74
0e08 : 85 11 __ STA P4 
0e0a : 20 9c 10 JSR $109c ; (screen_info.s4 + 0)
0e0d : a9 62 __ LDA #$62
0e0f : 85 10 __ STA P3 
0e11 : a9 74 __ LDA #$74
0e13 : 85 11 __ STA P4 
0e15 : 20 9c 10 JSR $109c ; (screen_info.s4 + 0)
0e18 : 20 a3 10 JSR $10a3 ; (cwin_cursor_newline.s4 + 0)
0e1b : a9 00 __ LDA #$00
0e1d : 85 10 __ STA P3 
0e1f : 85 11 __ STA P4 
0e21 : 20 4b 1d JSR $1d4b ; (screen_wait_key.s4 + 0)
0e24 : a9 0e __ LDA #$0e
0e26 : 8d 20 d0 STA $d020 
0e29 : a9 06 __ LDA #$06
0e2b : 8d 21 d0 STA $d021 
0e2e : a9 00 __ LDA #$00
0e30 : 85 1b __ STA ACCU + 0 
0e32 : 4c a1 0a JMP $0aa1 ; (main.s3 + 0)
.s60:
0e35 : a2 00 __ LDX #$00
0e37 : 86 12 __ STX P5 
0e39 : aa __ __ TAX
0e3a : f0 06 __ BEQ $0e42 ; (main.s61 + 0)
.s63:
0e3c : a9 15 __ LDA #$15
0e3e : a2 4c __ LDX #$4c
0e40 : 90 04 __ BCC $0e46 ; (main.s62 + 0)
.s61:
0e42 : a9 11 __ LDA #$11
0e44 : a2 ce __ LDX #$ce
.s62:
0e46 : 86 13 __ STX P6 
0e48 : 85 14 __ STA P7 
0e4a : 20 10 79 JSR $7910 ; (screen_result@proxy + 0)
0e4d : a9 63 __ LDA #$63
0e4f : 85 12 __ STA P5 
0e51 : a9 15 __ LDA #$15
0e53 : 85 13 __ STA P6 
0e55 : a9 15 __ LDA #$15
0e57 : a2 7a __ LDX #$7a
0e59 : 4c 94 0a JMP $0a94 ; (main.s70 + 0)
--------------------------------------------------------------------
nmi_handler: ; nmi_handler()->void
;  97, "/home/xahmol/git/UltimateDemo2026/src/main.c"
.s1:
0e5c : 48 __ __ PHA
0e5d : 8a __ __ TXA
0e5e : 48 __ __ PHA
0e5f : 98 __ __ TYA
0e60 : 48 __ __ PHA
.s3:
0e61 : 68 __ __ PLA
0e62 : a8 __ __ TAY
0e63 : 68 __ __ PLA
0e64 : aa __ __ TAX
0e65 : 68 __ __ PLA
0e66 : 40 __ __ RTI
--------------------------------------------------------------------
screen_init: ; screen_init(const u8*)->void
;  13, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
0e67 : a9 00 __ LDA #$00
0e69 : 85 0d __ STA P0 
0e6b : 85 43 __ STA T0 + 0 
0e6d : 85 0e __ STA P1 
0e6f : 85 10 __ STA P3 
0e71 : 20 0c 0f JSR $0f0c ; (vic_setmode@proxy + 0)
0e74 : a9 00 __ LDA #$00
0e76 : 8d ce 80 STA $80ce ; (cw.sx + 0)
0e79 : 8d cf 80 STA $80cf ; (cw.sy + 0)
0e7c : 8d d2 80 STA $80d2 ; (cw.cx + 0)
0e7f : 8d d3 80 STA $80d3 ; (cw.cy + 0)
0e82 : a2 19 __ LDX #$19
0e84 : 8e d1 80 STX $80d1 ; (cw.wy + 0)
0e87 : 8d 20 d0 STA $d020 
0e8a : 8d 21 d0 STA $d021 
0e8d : 8d d6 80 STA $80d6 ; (cw.sp + 0)
0e90 : 8d d8 80 STA $80d8 ; (cw.cp + 0)
0e93 : a9 04 __ LDA #$04
0e95 : 8d d7 80 STA $80d7 ; (cw.sp + 1)
0e98 : 85 44 __ STA T0 + 1 
0e9a : a9 d8 __ LDA #$d8
0e9c : 8d d9 80 STA $80d9 ; (cw.cp + 1)
0e9f : 85 46 __ STA T1 + 1 
0ea1 : a2 00 __ LDX #$00
0ea3 : 86 45 __ STX T1 + 0 
0ea5 : a9 28 __ LDA #$28
0ea7 : 8d d0 80 STA $80d0 ; (cw.wx + 0)
.l8:
0eaa : 85 1b __ STA ACCU + 0 
0eac : a0 00 __ LDY #$00
.l9:
0eae : a9 20 __ LDA #$20
0eb0 : 91 43 __ STA (T0 + 0),y 
0eb2 : a9 01 __ LDA #$01
0eb4 : 91 45 __ STA (T1 + 0),y 
0eb6 : c8 __ __ INY
0eb7 : c4 1b __ CPY ACCU + 0 
0eb9 : 90 f3 __ BCC $0eae ; (screen_init.l9 + 0)
.l6:
0ebb : e8 __ __ INX
0ebc : ec d1 80 CPX $80d1 ; (cw.wy + 0)
0ebf : 90 2f __ BCC $0ef0 ; (screen_init.s5 + 0)
.s7:
0ec1 : a9 00 __ LDA #$00
0ec3 : 85 12 __ STA P5 
0ec5 : a9 10 __ LDA #$10
0ec7 : 85 14 __ STA P7 
0ec9 : a9 05 __ LDA #$05
0ecb : 85 15 __ STA P8 
0ecd : a9 61 __ LDA #$61
0ecf : 85 13 __ STA P6 
0ed1 : 20 66 0f JSR $0f66 ; (header_line.s4 + 0)
0ed4 : e6 12 __ INC P5 
0ed6 : a5 16 __ LDA P9 ; (title + 0)
0ed8 : 85 13 __ STA P6 
0eda : a5 17 __ LDA P10 ; (title + 1)
0edc : 85 14 __ STA P7 
0ede : a9 0d __ LDA #$0d
0ee0 : 85 15 __ STA P8 
0ee2 : 20 66 0f JSR $0f66 ; (header_line.s4 + 0)
0ee5 : a9 00 __ LDA #$00
0ee7 : 8d d2 80 STA $80d2 ; (cw.cx + 0)
0eea : a9 03 __ LDA #$03
0eec : 8d d3 80 STA $80d3 ; (cw.cy + 0)
.s3:
0eef : 60 __ __ RTS
.s5:
0ef0 : a5 43 __ LDA T0 + 0 
0ef2 : 69 28 __ ADC #$28
0ef4 : 85 43 __ STA T0 + 0 
0ef6 : 90 03 __ BCC $0efb ; (screen_init.s11 + 0)
.s10:
0ef8 : e6 44 __ INC T0 + 1 
0efa : 18 __ __ CLC
.s11:
0efb : a5 45 __ LDA T1 + 0 
0efd : 69 28 __ ADC #$28
0eff : 85 45 __ STA T1 + 0 
0f01 : 90 02 __ BCC $0f05 ; (screen_init.s13 + 0)
.s12:
0f03 : e6 46 __ INC T1 + 1 
.s13:
0f05 : ad d0 80 LDA $80d0 ; (cw.wx + 0)
0f08 : f0 b1 __ BEQ $0ebb ; (screen_init.l6 + 0)
0f0a : d0 9e __ BNE $0eaa ; (screen_init.l8 + 0)
--------------------------------------------------------------------
vic_setmode@proxy: ; vic_setmode@proxy
0f0c : a9 04 __ LDA #$04
0f0e : 85 0f __ STA P2 
0f10 : a9 18 __ LDA #$18
0f12 : 85 11 __ STA P4 
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  97, "/home/xahmol/oscar64/include/c64/vic.h"
.s4:
0f14 : a4 0d __ LDY P0 ; (mode + 0)
0f16 : c0 02 __ CPY #$02
0f18 : d0 09 __ BNE $0f23 ; (vic_setmode.s5 + 0)
.s10:
0f1a : a9 5b __ LDA #$5b
0f1c : 8d 11 d0 STA $d011 
.s8:
0f1f : a9 08 __ LDA #$08
0f21 : d0 0c __ BNE $0f2f ; (vic_setmode.s7 + 0)
.s5:
0f23 : b0 36 __ BCS $0f5b ; (vic_setmode.s6 + 0)
.s9:
0f25 : a9 1b __ LDA #$1b
0f27 : 8d 11 d0 STA $d011 
0f2a : 98 __ __ TYA
0f2b : f0 f2 __ BEQ $0f1f ; (vic_setmode.s8 + 0)
.s11:
0f2d : a9 18 __ LDA #$18
.s7:
0f2f : 8d 16 d0 STA $d016 
0f32 : ad 00 dd LDA $dd00 
0f35 : 29 fc __ AND #$fc
0f37 : 85 1b __ STA ACCU + 0 
0f39 : a5 0f __ LDA P2 ; (text + 1)
0f3b : 0a __ __ ASL
0f3c : 2a __ __ ROL
0f3d : 29 01 __ AND #$01
0f3f : 2a __ __ ROL
0f40 : 49 03 __ EOR #$03
0f42 : 05 1b __ ORA ACCU + 0 
0f44 : 8d 00 dd STA $dd00 
0f47 : a5 0f __ LDA P2 ; (text + 1)
0f49 : 29 3c __ AND #$3c
0f4b : 0a __ __ ASL
0f4c : 0a __ __ ASL
0f4d : 85 1b __ STA ACCU + 0 
0f4f : a5 11 __ LDA P4 ; (font + 1)
0f51 : 29 38 __ AND #$38
0f53 : 4a __ __ LSR
0f54 : 4a __ __ LSR
0f55 : 05 1b __ ORA ACCU + 0 
0f57 : 8d 18 d0 STA $d018 
.s3:
0f5a : 60 __ __ RTS
.s6:
0f5b : a9 3b __ LDA #$3b
0f5d : 8d 11 d0 STA $d011 
0f60 : c0 03 __ CPY #$03
0f62 : d0 c9 __ BNE $0f2d ; (vic_setmode.s11 + 0)
0f64 : f0 b9 __ BEQ $0f1f ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
header_line: ; header_line(u8,const u8*,u8)->void
;  41, "/home/xahmol/git/UltimateDemo2026/src/screen.c"
.s4:
0f66 : a5 13 __ LDA P6 ; (text + 0)
0f68 : 85 0d __ STA P0 
0f6a : a5 14 __ LDA P7 ; (text + 1)
0f6c : 85 0e __ STA P1 
0f6e : 20 45 10 JSR $1045 ; (strlen.s4 + 0)
0f71 : a5 12 __ LDA P5 ; (row + 0)
0f73 : 0a __ __ ASL
0f74 : aa __ __ TAX
0f75 : ad d6 80 LDA $80d6 ; (cw.sp + 0)
0f78 : 7d a8 79 ADC $79a8,x ; (mul40[0] + 0)
0f7b : 85 46 __ STA T2 + 0 
0f7d : ad d7 80 LDA $80d7 ; (cw.sp + 1)
0f80 : 7d a9 79 ADC $79a9,x ; (mul40[0] + 1)
0f83 : 85 47 __ STA T2 + 1 
0f85 : ad d8 80 LDA $80d8 ; (cw.cp + 0)
0f88 : 18 __ __ CLC
0f89 : 7d a8 79 ADC $79a8,x ; (mul40[0] + 0)
0f8c : 85 48 __ STA T3 + 0 
0f8e : ad d9 80 LDA $80d9 ; (cw.cp + 1)
0f91 : 7d a9 79 ADC $79a9,x ; (mul40[0] + 1)
0f94 : 85 49 __ STA T3 + 1 
0f96 : 38 __ __ SEC
0f97 : a9 28 __ LDA #$28
0f99 : e5 1b __ SBC ACCU + 0 
0f9b : a8 __ __ TAY
0f9c : a9 00 __ LDA #$00
0f9e : e9 00 __ SBC #$00
0fa0 : aa __ __ TAX
0fa1 : 0a __ __ ASL
0fa2 : 98 __ __ TYA
0fa3 : 69 00 __ ADC #$00
0fa5 : 85 45 __ STA T1 + 0 
0fa7 : 8a __ __ TXA
0fa8 : 69 00 __ ADC #$00
0faa : 4a __ __ LSR
0fab : 66 45 __ ROR T1 + 0 
0fad : a0 00 __ LDY #$00
0faf : a6 15 __ LDX P8 ; (color + 0)
.l8:
0fb1 : a9 a0 __ LDA #$a0
0fb3 : 91 46 __ STA (T2 + 0),y 
0fb5 : 8a __ __ TXA
0fb6 : 91 48 __ STA (T3 + 0),y 
0fb8 : c8 __ __ INY
0fb9 : c0 28 __ CPY #$28
0fbb : d0 f4 __ BNE $0fb1 ; (header_line.l8 + 0)
.s9:
0fbd : a9 00 __ LDA #$00
0fbf : 85 4a __ STA T4 + 0 
0fc1 : a5 1b __ LDA ACCU + 0 
0fc3 : f0 1f __ BEQ $0fe4 ; (header_line.s5 + 0)
.s10:
0fc5 : a0 00 __ LDY #$00
.l7:
0fc7 : b1 13 __ LDA (P6),y ; (text + 0)
0fc9 : 4a __ __ LSR
0fca : 4a __ __ LSR
0fcb : 4a __ __ LSR
0fcc : 4a __ __ LSR
0fcd : 4a __ __ LSR
0fce : aa __ __ TAX
0fcf : bd da 79 LDA $79da,x ; (p2smap[0] + 0)
0fd2 : 51 13 __ EOR (P6),y ; (text + 0)
0fd4 : 09 80 __ ORA #$80
0fd6 : 99 c1 bf STA $bfc1,y ; (buf[0] + 0)
0fd9 : c8 __ __ INY
0fda : c4 1b __ CPY ACCU + 0 
0fdc : b0 04 __ BCS $0fe2 ; (header_line.s11 + 0)
.s6:
0fde : c0 28 __ CPY #$28
0fe0 : 90 e5 __ BCC $0fc7 ; (header_line.l7 + 0)
.s11:
0fe2 : 84 4a __ STY T4 + 0 
.s5:
0fe4 : a5 45 __ LDA T1 + 0 
0fe6 : 85 0d __ STA P0 
0fe8 : a5 12 __ LDA P5 ; (row + 0)
0fea : 85 0e __ STA P1 
0fec : a5 15 __ LDA P8 ; (color + 0)
0fee : 85 11 __ STA P4 
0ff0 : a9 00 __ LDA #$00
0ff2 : a6 4a __ LDX T4 + 0 
0ff4 : 9d c1 bf STA $bfc1,x ; (buf[0] + 0)
0ff7 : a9 c1 __ LDA #$c1
0ff9 : 85 0f __ STA P2 
0ffb : a9 bf __ LDA #$bf
0ffd : 85 10 __ STA P3 
--------------------------------------------------------------------
cwin_putat_string_raw: ; cwin_putat_string_raw(struct CharWin*,u8,u8,const u8*,u8)->void
; 103, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
0fff : a5 0e __ LDA P1 ; (y + 0)
1001 : 0a __ __ ASL
1002 : aa __ __ TAX
1003 : bd a8 79 LDA $79a8,x ; (mul40[0] + 0)
1006 : 65 0d __ ADC P0 ; (x + 0)
1008 : 85 1b __ STA ACCU + 0 
100a : bd a9 79 LDA $79a9,x ; (mul40[0] + 1)
100d : 69 00 __ ADC #$00
100f : 85 1c __ STA ACCU + 1 
1011 : ad d6 80 LDA $80d6 ; (cw.sp + 0)
1014 : 65 1b __ ADC ACCU + 0 
1016 : 85 43 __ STA T1 + 0 
1018 : ad d7 80 LDA $80d7 ; (cw.sp + 1)
101b : 65 1c __ ADC ACCU + 1 
101d : 85 44 __ STA T1 + 1 
101f : ad d8 80 LDA $80d8 ; (cw.cp + 0)
1022 : 18 __ __ CLC
1023 : 65 1b __ ADC ACCU + 0 
1025 : 85 1b __ STA ACCU + 0 
1027 : ad d9 80 LDA $80d9 ; (cw.cp + 1)
102a : 65 1c __ ADC ACCU + 1 
102c : 85 1c __ STA ACCU + 1 
102e : a6 11 __ LDX P4 ; (color + 0)
1030 : a0 00 __ LDY #$00
1032 : b1 0f __ LDA (P2),y ; (str + 0)
1034 : f0 0a __ BEQ $1040 ; (cwin_putat_string_raw.s3 + 0)
.l5:
1036 : 91 43 __ STA (T1 + 0),y 
1038 : 8a __ __ TXA
1039 : 91 1b __ STA (ACCU + 0),y 
103b : c8 __ __ INY
103c : b1 0f __ LDA (P2),y ; (str + 0)
103e : d0 f6 __ BNE $1036 ; (cwin_putat_string_raw.l5 + 0)
.s3:
1040 : 60 __ __ RTS
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
1041 : a9 79 __ LDA #$79
1043 : 85 0e __ STA P1 
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
;  12, "/home/xahmol/oscar64/include/string.h"
.s4:
1045 : a9 00 __ LDA #$00
1047 : 85 1b __ STA ACCU + 0 
1049 : 85 1c __ STA ACCU + 1 
104b : a8 __ __ TAY
104c : b1 0d __ LDA (P0),y ; (str + 0)
104e : f0 10 __ BEQ $1060 ; (strlen.s3 + 0)
.s6:
1050 : a2 00 __ LDX #$00
.l7:
1052 : c8 __ __ INY
1053 : d0 03 __ BNE $1058 ; (strlen.s9 + 0)
.s8:
1055 : e6 0e __ INC P1 ; (str + 1)
1057 : e8 __ __ INX
.s9:
1058 : b1 0d __ LDA (P0),y ; (str + 0)
105a : d0 f6 __ BNE $1052 ; (strlen.l7 + 0)
.s5:
105c : 86 1c __ STX ACCU + 1 
105e : 84 1b __ STY ACCU + 0 
.s3:
1060 : 60 __ __ RTS
--------------------------------------------------------------------
1061 : __ __ __ BYT 75 4c 54 49 4d 41 54 45 64 45 4d 4f 32 30 32 36 : uLTIMATEdEMO2026
1071 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1072 : __ __ __ BYT 68 41 52 44 57 41 52 45 20 64 45 54 45 43 54 49 : hARDWARE dETECTI
1082 : __ __ __ BYT 4f 4e 20 20 20 56 30 2e 31 2e 30 2d 32 30 32 36 : ON   V0.1.0-2026
1092 : __ __ __ BYT 30 35 33 31 2d 31 30 34 39 00                   : 0531-1049.
--------------------------------------------------------------------
screen_info: ; screen_info(const u8*)->void
;  23, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
109c : a9 0f __ LDA #$0f
109e : 85 0f __ STA P2 
10a0 : 20 70 79 JSR $7970 ; (cwin_put_string@proxy + 0)
--------------------------------------------------------------------
cwin_cursor_newline: ; cwin_cursor_newline(struct CharWin*)->void
;  44, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
10a3 : ad d3 80 LDA $80d3 ; (cw.cy + 0)
10a6 : 18 __ __ CLC
10a7 : 69 01 __ ADC #$01
10a9 : a8 __ __ TAY
10aa : a9 00 __ LDA #$00
10ac : 8d d2 80 STA $80d2 ; (cw.cx + 0)
10af : 2a __ __ ROL
10b0 : d0 08 __ BNE $10ba ; (cwin_cursor_newline.s3 + 0)
.s6:
10b2 : cc d1 80 CPY $80d1 ; (cw.wy + 0)
10b5 : b0 03 __ BCS $10ba ; (cwin_cursor_newline.s3 + 0)
.s5:
10b7 : ee d3 80 INC $80d3 ; (cw.cy + 0)
.s3:
10ba : 60 __ __ RTS
--------------------------------------------------------------------
cwin_put_string@proxy: ; cwin_put_string@proxy
10bb : a9 c1 __ LDA #$c1
10bd : 85 0d __ STA P0 
10bf : a9 11 __ LDA #$11
10c1 : 85 0e __ STA P1 
--------------------------------------------------------------------
cwin_put_string: ; cwin_put_string(struct CharWin*,const u8*,u8)->void
;  64, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
10c3 : ad d3 80 LDA $80d3 ; (cw.cy + 0)
10c6 : 0a __ __ ASL
10c7 : aa __ __ TAX
10c8 : bd a8 79 LDA $79a8,x ; (mul40[0] + 0)
10cb : 6d d2 80 ADC $80d2 ; (cw.cx + 0)
10ce : 85 1b __ STA ACCU + 0 
10d0 : bd a9 79 LDA $79a9,x ; (mul40[0] + 1)
10d3 : 69 00 __ ADC #$00
10d5 : 85 1c __ STA ACCU + 1 
10d7 : ad d6 80 LDA $80d6 ; (cw.sp + 0)
10da : 65 1b __ ADC ACCU + 0 
10dc : 85 43 __ STA T1 + 0 
10de : ad d7 80 LDA $80d7 ; (cw.sp + 1)
10e1 : 65 1c __ ADC ACCU + 1 
10e3 : 85 44 __ STA T1 + 1 
10e5 : ad d8 80 LDA $80d8 ; (cw.cp + 0)
10e8 : 18 __ __ CLC
10e9 : 65 1b __ ADC ACCU + 0 
10eb : 85 1b __ STA ACCU + 0 
10ed : ad d9 80 LDA $80d9 ; (cw.cp + 1)
10f0 : 65 1c __ ADC ACCU + 1 
10f2 : 85 1c __ STA ACCU + 1 
10f4 : a0 00 __ LDY #$00
10f6 : b1 0d __ LDA (P0),y ; (str + 0)
10f8 : f0 16 __ BEQ $1110 ; (cwin_put_string.s5 + 0)
.l7:
10fa : 4a __ __ LSR
10fb : 4a __ __ LSR
10fc : 4a __ __ LSR
10fd : 4a __ __ LSR
10fe : 4a __ __ LSR
10ff : aa __ __ TAX
1100 : bd e2 79 LDA $79e2,x ; (p2smap[0] + 0)
1103 : 51 0d __ EOR (P0),y ; (str + 0)
1105 : 91 43 __ STA (T1 + 0),y 
1107 : a5 0f __ LDA P2 ; (color + 0)
1109 : 91 1b __ STA (ACCU + 0),y 
110b : c8 __ __ INY
110c : b1 0d __ LDA (P0),y ; (str + 0)
110e : d0 ea __ BNE $10fa ; (cwin_put_string.l7 + 0)
.s5:
1110 : 98 __ __ TYA
1111 : 18 __ __ CLC
1112 : 6d d2 80 ADC $80d2 ; (cw.cx + 0)
1115 : cd d0 80 CMP $80d0 ; (cw.wx + 0)
1118 : 90 05 __ BCC $111f ; (cwin_put_string.s3 + 0)
.s6:
111a : a9 00 __ LDA #$00
111c : ee d3 80 INC $80d3 ; (cw.cy + 0)
.s3:
111f : 8d d2 80 STA $80d2 ; (cw.cx + 0)
1122 : 60 __ __ RTS
--------------------------------------------------------------------
1123 : __ __ __ BYT 77 41 49 54 49 4e 47 20 46 4f 52 20 75 4c 54 49 : wAITING FOR uLTI
1133 : __ __ __ BYT 4d 41 54 45 20 46 49 52 4d 57 41 52 45 2e 2e 2e : MATE FIRMWARE...
1143 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
uii_detect: ; uii_detect()->u8
; 167, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
1144 : ad 1d df LDA $df1d 
1147 : c9 c9 __ CMP #$c9
1149 : d0 0b __ BNE $1156 ; (uii_detect.s5 + 0)
.s6:
114b : ad 1c df LDA $df1c 
114e : 09 04 __ ORA #$04
1150 : 8d 1c df STA $df1c 
1153 : a9 01 __ LDA #$01
1155 : 60 __ __ RTS
.s5:
1156 : a9 00 __ LDA #$00
.s3:
1158 : 60 __ __ RTS
--------------------------------------------------------------------
screen_result@proxy: ; screen_result@proxy
1159 : a9 01 __ LDA #$01
115b : 85 12 __ STA P5 
115d : a9 93 __ LDA #$93
115f : 85 13 __ STA P6 
1161 : a9 bf __ LDA #$bf
1163 : 85 14 __ STA P7 
--------------------------------------------------------------------
screen_result: ; screen_result(const u8*,u8,const u8*)->void
;  17, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
1165 : a9 01 __ LDA #$01
1167 : 85 0f __ STA P2 
1169 : 20 bb 10 JSR $10bb ; (cwin_put_string@proxy + 0)
116c : 20 70 79 JSR $7970 ; (cwin_put_string@proxy + 0)
116f : a9 c4 __ LDA #$c4
1171 : 85 0d __ STA P0 
1173 : a9 11 __ LDA #$11
1175 : 85 0e __ STA P1 
1177 : 20 c3 10 JSR $10c3 ; (cwin_put_string.s4 + 0)
117a : a5 12 __ LDA P5 ; (ok + 0)
117c : d0 09 __ BNE $1187 ; (screen_result.s7 + 0)
.s5:
117e : e6 0f __ INC P2 
1180 : a9 11 __ LDA #$11
1182 : a0 ba __ LDY #$ba
1184 : 4c 8f 11 JMP $118f ; (screen_result.s6 + 0)
.s7:
1187 : a9 05 __ LDA #$05
1189 : 85 0f __ STA P2 
118b : a9 11 __ LDA #$11
118d : a0 b3 __ LDY #$b3
.s6:
118f : 84 0d __ STY P0 
1191 : 85 0e __ STA P1 
1193 : 20 c3 10 JSR $10c3 ; (cwin_put_string.s4 + 0)
1196 : a5 12 __ LDA P5 ; (ok + 0)
1198 : f0 04 __ BEQ $119e ; (screen_result.s8 + 0)
.s9:
119a : a9 03 __ LDA #$03
119c : d0 02 __ BNE $11a0 ; (screen_result.s10 + 0)
.s8:
119e : a9 07 __ LDA #$07
.s10:
11a0 : 85 0f __ STA P2 
11a2 : 20 bb 10 JSR $10bb ; (cwin_put_string@proxy + 0)
11a5 : a5 13 __ LDA P6 ; (detail + 0)
11a7 : 85 0d __ STA P0 
11a9 : a5 14 __ LDA P7 ; (detail + 1)
11ab : 85 0e __ STA P1 
11ad : 20 c3 10 JSR $10c3 ; (cwin_put_string.s4 + 0)
11b0 : 4c a3 10 JMP $10a3 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
11b3 : __ __ __ BYT 5b 20 6f 6b 20 5d 00                            : [ ok ].
--------------------------------------------------------------------
11ba : __ __ __ BYT 5b 66 41 49 4c 5d 00                            : [fAIL].
--------------------------------------------------------------------
11c1 : __ __ __ BYT 20 20 00                                        :   .
--------------------------------------------------------------------
11c4 : __ __ __ BYT 20 3a 20 00                                     :  : .
--------------------------------------------------------------------
11c8 : __ __ __ BYT 75 63 69 20 20 00                               : uci  .
--------------------------------------------------------------------
11ce : __ __ __ BYT 6e 4f 54 20 44 45 54 45 43 54 45 44 00          : nOT DETECTED.
--------------------------------------------------------------------
screen_error_exit: ; screen_error_exit(const u8*,const u8*)->void
;  32, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
11db : a9 02 __ LDA #$02
11dd : 85 0f __ STA P2 
11df : 20 a3 10 JSR $10a3 ; (cwin_cursor_newline.s4 + 0)
11e2 : a5 12 __ LDA P5 ; (msg + 0)
11e4 : 85 0d __ STA P0 
11e6 : a5 13 __ LDA P6 ; (msg + 1)
11e8 : 85 0e __ STA P1 
11ea : 20 c3 10 JSR $10c3 ; (cwin_put_string.s4 + 0)
11ed : 20 a3 10 JSR $10a3 ; (cwin_cursor_newline.s4 + 0)
11f0 : a5 15 __ LDA P8 ; (hint + 1)
11f2 : 05 14 __ ORA P7 ; (hint + 0)
11f4 : f0 11 __ BEQ $1207 ; (screen_error_exit.s5 + 0)
.s6:
11f6 : a0 00 __ LDY #$00
11f8 : b1 14 __ LDA (P7),y ; (hint + 0)
11fa : f0 0b __ BEQ $1207 ; (screen_error_exit.s5 + 0)
.s7:
11fc : a5 14 __ LDA P7 ; (hint + 0)
11fe : 85 10 __ STA P3 
1200 : a5 15 __ LDA P8 ; (hint + 1)
1202 : 85 11 __ STA P4 
1204 : 20 2a 12 JSR $122a ; (screen_hint.s4 + 0)
.s5:
1207 : a9 01 __ LDA #$01
1209 : 85 0f __ STA P2 
120b : 20 a3 10 JSR $10a3 ; (cwin_cursor_newline.s4 + 0)
120e : a9 45 __ LDA #$45
1210 : 85 0d __ STA P0 
1212 : a9 12 __ LDA #$12
1214 : 85 0e __ STA P1 
1216 : 20 c3 10 JSR $10c3 ; (cwin_put_string.s4 + 0)
1219 : 20 a3 10 JSR $10a3 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
cwin_getch: ; cwin_getch()->void
; 147, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
121c : 20 e4 ff JSR $ffe4 
121f : c9 00 __ CMP #$00
1221 : f0 f9 __ BEQ $121c ; (cwin_getch.s4 + 0)
1223 : 85 1b __ STA ACCU + 0 
1225 : a9 00 __ LDA #$00
1227 : 85 1c __ STA ACCU + 1 
.s3:
1229 : 60 __ __ RTS
--------------------------------------------------------------------
screen_hint: ; screen_hint(const u8*)->void
;  26, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
122a : a9 07 __ LDA #$07
122c : 85 0f __ STA P2 
122e : a9 12 __ LDA #$12
1230 : 85 0e __ STA P1 
1232 : a9 3f __ LDA #$3f
1234 : 85 0d __ STA P0 
1236 : 20 c3 10 JSR $10c3 ; (cwin_put_string.s4 + 0)
1239 : 20 70 79 JSR $7970 ; (cwin_put_string@proxy + 0)
123c : 4c a3 10 JMP $10a3 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
123f : __ __ __ BYT 20 20 2d 3e 20 00                               :   -> .
--------------------------------------------------------------------
1245 : __ __ __ BYT 70 52 45 53 53 20 41 20 4b 45 59 20 2d 20 45 58 : pRESS A KEY - EX
1255 : __ __ __ BYT 49 54 20 54 4f 20 62 61 73 69 63 2e 00          : IT TO basic..
--------------------------------------------------------------------
1262 : __ __ __ BYT 6e 4f 20 75 4c 54 49 4d 41 54 45 20 63 4f 4d 4d : nO uLTIMATE cOMM
1272 : __ __ __ BYT 41 4e 44 20 69 4e 54 45 52 46 41 43 45 20 46 4f : AND iNTERFACE FO
1282 : __ __ __ BYT 55 4e 44 2e 00                                  : UND..
--------------------------------------------------------------------
1287 : __ __ __ BYT 66 32 20 3e 20 75 63 69 20 73 45 54 54 49 4e 47 : f2 > uci sETTING
1297 : __ __ __ BYT 53 20 3e 20 65 4e 41 42 4c 45 00                : S > eNABLE.
--------------------------------------------------------------------
uii_sendcommand: ; uii_sendcommand(u8*,u16)->void
; 173, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
12a2 : ad fb 78 LDA $78fb ; (uii_target + 0)
12a5 : a0 00 __ LDY #$00
12a7 : 84 1b __ STY ACCU + 0 
12a9 : 84 1c __ STY ACCU + 1 
12ab : 91 0d __ STA (P0),y ; (bytes + 0)
.l5:
12ad : ad 1c df LDA $df1c 
12b0 : 29 20 __ AND #$20
12b2 : d0 f9 __ BNE $12ad ; (uii_sendcommand.l5 + 0)
.s6:
12b4 : ad 1c df LDA $df1c 
12b7 : 29 10 __ AND #$10
12b9 : d0 f2 __ BNE $12ad ; (uii_sendcommand.l5 + 0)
.s7:
12bb : a5 1c __ LDA ACCU + 1 
12bd : c5 10 __ CMP P3 ; (count + 1)
12bf : d0 04 __ BNE $12c5 ; (uii_sendcommand.s16 + 0)
.s15:
12c1 : a5 1b __ LDA ACCU + 0 
12c3 : c5 0f __ CMP P2 ; (count + 0)
.s16:
12c5 : b0 2e __ BCS $12f5 ; (uii_sendcommand.s8 + 0)
.s12:
12c7 : a5 0d __ LDA P0 ; (bytes + 0)
12c9 : 65 1b __ ADC ACCU + 0 
12cb : 85 43 __ STA T3 + 0 
12cd : a5 0e __ LDA P1 ; (bytes + 1)
12cf : 65 1c __ ADC ACCU + 1 
12d1 : 85 44 __ STA T3 + 1 
12d3 : a6 1b __ LDX ACCU + 0 
.l13:
12d5 : a0 00 __ LDY #$00
12d7 : b1 43 __ LDA (T3 + 0),y 
12d9 : 8d 1d df STA $df1d 
12dc : e6 43 __ INC T3 + 0 
12de : d0 02 __ BNE $12e2 ; (uii_sendcommand.s19 + 0)
.s18:
12e0 : e6 44 __ INC T3 + 1 
.s19:
12e2 : e8 __ __ INX
12e3 : d0 02 __ BNE $12e7 ; (uii_sendcommand.s21 + 0)
.s20:
12e5 : e6 1c __ INC ACCU + 1 
.s21:
12e7 : a5 1c __ LDA ACCU + 1 
12e9 : c5 10 __ CMP P3 ; (count + 1)
12eb : 90 e8 __ BCC $12d5 ; (uii_sendcommand.l13 + 0)
.s22:
12ed : d0 04 __ BNE $12f3 ; (uii_sendcommand.s17 + 0)
.s14:
12ef : e4 0f __ CPX P2 ; (count + 0)
12f1 : 90 e2 __ BCC $12d5 ; (uii_sendcommand.l13 + 0)
.s17:
12f3 : 86 1b __ STX ACCU + 0 
.s8:
12f5 : ad 1c df LDA $df1c 
12f8 : 09 01 __ ORA #$01
12fa : 8d 1c df STA $df1c 
12fd : ad 1c df LDA $df1c 
1300 : 29 04 __ AND #$04
1302 : f0 0a __ BEQ $130e ; (uii_sendcommand.l9 + 0)
.s11:
1304 : ad 1c df LDA $df1c 
1307 : 09 08 __ ORA #$08
1309 : 8d 1c df STA $df1c 
130c : b0 9f __ BCS $12ad ; (uii_sendcommand.l5 + 0)
.l9:
130e : ad 1c df LDA $df1c 
1311 : 29 20 __ AND #$20
1313 : d0 07 __ BNE $131c ; (uii_sendcommand.s3 + 0)
.s10:
1315 : ad 1c df LDA $df1c 
1318 : 29 10 __ AND #$10
131a : d0 f2 __ BNE $130e ; (uii_sendcommand.l9 + 0)
.s3:
131c : 60 __ __ RTS
--------------------------------------------------------------------
uii_readdata: ; uii_readdata()->void
; 179, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
131d : a9 00 __ LDA #$00
131f : 8d c8 90 STA $90c8 ; (uii_data[0] + 0)
1322 : a2 c8 __ LDX #$c8
1324 : 86 1b __ STX ACCU + 0 
1326 : a8 __ __ TAY
1327 : f0 0d __ BEQ $1336 ; (uii_readdata.l5 + 0)
.s8:
1329 : ad 1e df LDA $df1e 
132c : 91 1b __ STA (ACCU + 0),y 
132e : 98 __ __ TYA
132f : 18 __ __ CLC
1330 : 69 01 __ ADC #$01
1332 : a8 __ __ TAY
1333 : 8a __ __ TXA
1334 : 69 00 __ ADC #$00
.l5:
1336 : aa __ __ TAX
1337 : 18 __ __ CLC
1338 : 69 90 __ ADC #$90
133a : 85 1c __ STA ACCU + 1 
133c : 2c 1c df BIT $df1c 
133f : 10 07 __ BPL $1348 ; (uii_readdata.s6 + 0)
.s7:
1341 : e0 02 __ CPX #$02
1343 : d0 e4 __ BNE $1329 ; (uii_readdata.s8 + 0)
.s9:
1345 : 98 __ __ TYA
1346 : d0 e1 __ BNE $1329 ; (uii_readdata.s8 + 0)
.s6:
1348 : a9 00 __ LDA #$00
134a : 91 1b __ STA (ACCU + 0),y 
.s3:
134c : 60 __ __ RTS
--------------------------------------------------------------------
uii_readstatus: ; uii_readstatus()->void
; 180, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
134d : a9 00 __ LDA #$00
134f : 8d c9 92 STA $92c9 ; (uii_status[0] + 0)
1352 : a2 c9 __ LDX #$c9
1354 : 86 1b __ STX ACCU + 0 
1356 : a8 __ __ TAY
1357 : f0 0d __ BEQ $1366 ; (uii_readstatus.l5 + 0)
.s8:
1359 : ad 1f df LDA $df1f 
135c : 91 1b __ STA (ACCU + 0),y 
135e : 98 __ __ TYA
135f : 18 __ __ CLC
1360 : 69 01 __ ADC #$01
1362 : a8 __ __ TAY
1363 : 8a __ __ TXA
1364 : 69 00 __ ADC #$00
.l5:
1366 : aa __ __ TAX
1367 : 18 __ __ CLC
1368 : 69 92 __ ADC #$92
136a : 85 1c __ STA ACCU + 1 
136c : ad 1c df LDA $df1c 
136f : 29 40 __ AND #$40
1371 : f0 07 __ BEQ $137a ; (uii_readstatus.s6 + 0)
.s7:
1373 : e0 01 __ CPX #$01
1375 : d0 e2 __ BNE $1359 ; (uii_readstatus.s8 + 0)
.s9:
1377 : 98 __ __ TYA
1378 : d0 df __ BNE $1359 ; (uii_readstatus.s8 + 0)
.s6:
137a : 91 1b __ STA (ACCU + 0),y 
.s3:
137c : 60 __ __ RTS
--------------------------------------------------------------------
uii_get_hwinfo: ; uii_get_hwinfo(u8)->void
;  53, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
137d : a9 00 __ LDA #$00
137f : 85 10 __ STA P3 
1381 : 8d e7 bf STA $bfe7 ; (cmd[0] + 0)
1384 : 8d e9 bf STA $bfe9 ; (cmd[0] + 2)
1387 : a9 03 __ LDA #$03
1389 : 85 0f __ STA P2 
138b : a9 04 __ LDA #$04
138d : 8d fb 78 STA $78fb ; (uii_target + 0)
1390 : a9 28 __ LDA #$28
1392 : 8d e8 bf STA $bfe8 ; (cmd[0] + 1)
1395 : a9 00 __ LDA #$00
1397 : 8d e9 bf STA $bfe9 ; (cmd[0] + 2)
139a : a9 e7 __ LDA #$e7
139c : 85 0d __ STA P0 
139e : a9 bf __ LDA #$bf
13a0 : 85 0e __ STA P1 
13a2 : 20 a2 12 JSR $12a2 ; (uii_sendcommand.s4 + 0)
13a5 : 20 1d 13 JSR $131d ; (uii_readdata.s4 + 0)
13a8 : 20 4d 13 JSR $134d ; (uii_readstatus.s4 + 0)
--------------------------------------------------------------------
uii_accept: ; uii_accept()->void
; 174, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
13ab : ad 1c df LDA $df1c 
13ae : 09 02 __ ORA #$02
13b0 : 8d 1c df STA $df1c 
.l5:
13b3 : ad 1c df LDA $df1c 
13b6 : 29 02 __ AND #$02
13b8 : d0 f9 __ BNE $13b3 ; (uii_accept.l5 + 0)
.s3:
13ba : 60 __ __ RTS
--------------------------------------------------------------------
uci_to_upper@proxy: ; uci_to_upper@proxy
13bb : a9 93 __ LDA #$93
13bd : 85 0d __ STA P0 
13bf : a9 bf __ LDA #$bf
13c1 : 85 0e __ STA P1 
--------------------------------------------------------------------
uci_to_upper: ; uci_to_upper(u8*,u8)->u8
;  73, "/home/xahmol/git/UltimateDemo2026/src/main.c"
.s4:
13c3 : a0 00 __ LDY #$00
13c5 : a2 00 __ LDX #$00
13c7 : ad c8 90 LDA $90c8 ; (uii_data[0] + 0)
13ca : f0 23 __ BEQ $13ef ; (uci_to_upper.s6 + 0)
.l8:
13cc : c9 20 __ CMP #$20
13ce : 90 11 __ BCC $13e1 ; (uci_to_upper.s9 + 0)
.s10:
13d0 : c9 7f __ CMP #$7f
13d2 : b0 0d __ BCS $13e1 ; (uci_to_upper.s9 + 0)
.s11:
13d4 : c9 61 __ CMP #$61
13d6 : 90 06 __ BCC $13de ; (uci_to_upper.s14 + 0)
.s12:
13d8 : c9 7b __ CMP #$7b
13da : b0 02 __ BCS $13de ; (uci_to_upper.s14 + 0)
.s13:
13dc : e9 1f __ SBC #$1f
.s14:
13de : 91 0d __ STA (P0),y ; (dst + 0)
13e0 : c8 __ __ INY
.s9:
13e1 : e8 __ __ INX
13e2 : e0 7f __ CPX #$7f
13e4 : b0 09 __ BCS $13ef ; (uci_to_upper.s6 + 0)
.s5:
13e6 : c0 18 __ CPY #$18
13e8 : b0 05 __ BCS $13ef ; (uci_to_upper.s6 + 0)
.s7:
13ea : bd c8 90 LDA $90c8,x ; (uii_data[0] + 0)
13ed : d0 dd __ BNE $13cc ; (uci_to_upper.l8 + 0)
.s6:
13ef : a9 00 __ LDA #$00
13f1 : 91 0d __ STA (P0),y ; (dst + 0)
.s3:
13f3 : 98 __ __ TYA
13f4 : 60 __ __ RTS
--------------------------------------------------------------------
13f5 : __ __ __ BYT 75 63 69 20 6f 4b 00                            : uci oK.
--------------------------------------------------------------------
turbo_get: ; turbo_get()->u8
; 149, "/home/xahmol/git/UltimateDemo2026/include/turbo.h"
.s3:
13fc : ad 31 d0 LDA $d031 
13ff : 60 __ __ RTS
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
16d3 : __ __ __ BYT 34 38 20 6d 68 5a 00                            : 48 mhZ.
--------------------------------------------------------------------
16da : __ __ __ BYT 34 30 20 6d 68 5a 00                            : 40 mhZ.
--------------------------------------------------------------------
16e1 : __ __ __ BYT 33 36 20 6d 68 5a 00                            : 36 mhZ.
--------------------------------------------------------------------
16e8 : __ __ __ BYT 33 32 20 6d 68 5a 00                            : 32 mhZ.
--------------------------------------------------------------------
16ef : __ __ __ BYT 32 38 20 6d 68 5a 00                            : 28 mhZ.
--------------------------------------------------------------------
16f6 : __ __ __ BYT 32 34 20 6d 68 5a 00                            : 24 mhZ.
--------------------------------------------------------------------
16fd : __ __ __ BYT 56 00                                           : V.
--------------------------------------------------------------------
spentry:
16ff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1700 : __ __ __ BYT 32 30 20 6d 68 5a 00                            : 20 mhZ.
--------------------------------------------------------------------
1707 : __ __ __ BYT 31 36 20 6d 68 5a 00                            : 16 mhZ.
--------------------------------------------------------------------
170e : __ __ __ BYT 31 32 20 6d 68 5a 00                            : 12 mhZ.
--------------------------------------------------------------------
1715 : __ __ __ BYT 38 20 6d 68 5a 00                               : 8 mhZ.
--------------------------------------------------------------------
171b : __ __ __ BYT 63 48 45 43 4b 49 4e 47 20 75 4c 54 49 4d 41 54 : cHECKING uLTIMAT
172b : __ __ __ BYT 45 20 61 55 44 49 4f 2e 2e 2e 00                : E aUDIO....
--------------------------------------------------------------------
audio_detect: ; audio_detect()->u8
;  92, "/home/xahmol/git/UltimateDemo2026/include/audio.h"
.s4:
1736 : 78 __ __ SEI
1737 : a2 00 __ LDX #$00
1739 : 86 43 __ STX T0 + 0 
.l15:
173b : bd eb 79 LDA $79eb,x ; (audio_ch_base[0] + 1)
173e : 85 44 __ STA T0 + 1 
1740 : a9 00 __ LDA #$00
1742 : bc ea 79 LDY $79ea,x ; (audio_ch_base[0] + 0)
1745 : 91 43 __ STA (T0 + 0),y 
1747 : e8 __ __ INX
1748 : e8 __ __ INX
1749 : e0 0e __ CPX #$0e
174b : d0 ee __ BNE $173b ; (audio_detect.l15 + 0)
.s16:
174d : a9 ff __ LDA #$ff
174f : 8d 3f df STA $df3f 
1752 : a2 00 __ LDX #$00
1754 : ad 20 df LDA $df20 
1757 : d0 08 __ BNE $1761 ; (audio_detect.s14 + 0)
.l6:
1759 : ca __ __ DEX
175a : f0 09 __ BEQ $1765 ; (audio_detect.s7 + 0)
.s5:
175c : ad 20 df LDA $df20 
175f : f0 f8 __ BEQ $1759 ; (audio_detect.l6 + 0)
.s14:
1761 : 58 __ __ CLI
.s17:
1762 : a9 00 __ LDA #$00
.s3:
1764 : 60 __ __ RTS
.s7:
1765 : 8d 21 df STA $df21 
1768 : a9 01 __ LDA #$01
176a : 8d 24 df STA $df24 
176d : 8e 25 df STX $df25 
1770 : 8e 26 df STX $df26 
1773 : 8e 27 df STX $df27 
1776 : 8e 2e df STX $df2e 
1779 : 8e 29 df STX $df29 
177c : 8d 2f df STA $df2f 
177f : 8d 2a df STA $df2a 
1782 : 8e 2b df STX $df2b 
1785 : a9 05 __ LDA #$05
1787 : 8d 20 df STA $df20 
178a : a2 80 __ LDX #$80
178c : ad 20 df LDA $df20 
178f : d0 08 __ BNE $1799 ; (audio_detect.l10 + 0)
.l9:
1791 : ca __ __ DEX
1792 : f0 05 __ BEQ $1799 ; (audio_detect.l10 + 0)
.s8:
1794 : ad 20 df LDA $df20 
1797 : f0 f8 __ BEQ $1791 ; (audio_detect.l9 + 0)
.l10:
1799 : ac 20 df LDY $df20 
179c : 88 __ __ DEY
179d : d0 0c __ BNE $17ab ; (audio_detect.s13 + 0)
.s11:
179f : ca __ __ DEX
17a0 : d0 f7 __ BNE $1799 ; (audio_detect.l10 + 0)
.s12:
17a2 : a9 ff __ LDA #$ff
17a4 : 8d 3f df STA $df3f 
17a7 : 58 __ __ CLI
17a8 : a9 01 __ LDA #$01
17aa : 60 __ __ RTS
.s13:
17ab : 58 __ __ CLI
17ac : a9 00 __ LDA #$00
17ae : 60 __ __ RTS
--------------------------------------------------------------------
17af : __ __ __ BYT 61 55 44 49 4f 00                               : aUDIO.
--------------------------------------------------------------------
17b5 : __ __ __ BYT 6d 4f 44 55 4c 45 20 4e 4f 54 20 46 4f 55 4e 44 : mODULE NOT FOUND
17c5 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
17c6 : __ __ __ BYT 66 32 20 3e 20 63 36 34 2f 63 41 52 54 20 53 45 : f2 > c64/cART SE
17d6 : __ __ __ BYT 54 54 49 4e 47 53 20 3e 20 61 55 44 49 4f 00    : TTINGS > aUDIO.
--------------------------------------------------------------------
fmt_dec: ; fmt_dec(u8*,u8)->void
;  57, "/home/xahmol/git/UltimateDemo2026/src/main.c"
.s4:
17e5 : a5 0f __ LDA P2 ; (val + 0)
17e7 : c9 64 __ CMP #$64
17e9 : b0 04 __ BCS $17ef ; (fmt_dec.s7 + 0)
.s5:
17eb : a0 00 __ LDY #$00
17ed : 90 1d __ BCC $180c ; (fmt_dec.s6 + 0)
.s7:
17ef : 85 1b __ STA ACCU + 0 
17f1 : a9 00 __ LDA #$00
17f3 : 85 1c __ STA ACCU + 1 
17f5 : 85 04 __ STA WORK + 1 
17f7 : a9 64 __ LDA #$64
17f9 : 85 03 __ STA WORK + 0 
17fb : 20 6d 75 JSR $756d ; (divmod + 0)
17fe : 18 __ __ CLC
17ff : a5 1b __ LDA ACCU + 0 
1801 : 69 30 __ ADC #$30
1803 : a0 00 __ LDY #$00
1805 : 91 0d __ STA (P0),y ; (buf + 0)
1807 : a5 05 __ LDA WORK + 2 
1809 : 85 0f __ STA P2 ; (val + 0)
180b : c8 __ __ INY
.s6:
180c : 84 43 __ STY T1 + 0 
180e : a9 00 __ LDA #$00
1810 : c8 __ __ INY
1811 : c8 __ __ INY
1812 : 91 0d __ STA (P0),y ; (buf + 0)
1814 : 85 1c __ STA ACCU + 1 
1816 : 85 04 __ STA WORK + 1 
1818 : a5 0f __ LDA P2 ; (val + 0)
181a : 85 1b __ STA ACCU + 0 
181c : a9 0a __ LDA #$0a
181e : 85 03 __ STA WORK + 0 
1820 : 20 6d 75 JSR $756d ; (divmod + 0)
1823 : 18 __ __ CLC
1824 : a5 1b __ LDA ACCU + 0 
1826 : 69 30 __ ADC #$30
1828 : a4 43 __ LDY T1 + 0 
182a : 91 0d __ STA (P0),y ; (buf + 0)
182c : 18 __ __ CLC
182d : a5 05 __ LDA WORK + 2 
182f : 69 30 __ ADC #$30
1831 : c8 __ __ INY
1832 : 91 0d __ STA (P0),y ; (buf + 0)
.s3:
1834 : 60 __ __ RTS
--------------------------------------------------------------------
strcat: ; strcat(u8*,const u8*)->void
;  14, "/home/xahmol/oscar64/include/string.h"
.s4:
1835 : a5 0d __ LDA P0 ; (dst + 0)
1837 : 85 1b __ STA ACCU + 0 
1839 : a5 0e __ LDA P1 ; (dst + 1)
183b : 85 1c __ STA ACCU + 1 
183d : a0 00 __ LDY #$00
183f : b1 0d __ LDA (P0),y ; (dst + 0)
1841 : f0 0f __ BEQ $1852 ; (strcat.s5 + 0)
.s6:
1843 : 84 1b __ STY ACCU + 0 
1845 : a4 0d __ LDY P0 ; (dst + 0)
.l7:
1847 : c8 __ __ INY
1848 : d0 02 __ BNE $184c ; (strcat.s11 + 0)
.s10:
184a : e6 1c __ INC ACCU + 1 
.s11:
184c : b1 1b __ LDA (ACCU + 0),y 
184e : d0 f7 __ BNE $1847 ; (strcat.l7 + 0)
.s8:
1850 : 84 1b __ STY ACCU + 0 
.s5:
1852 : a8 __ __ TAY
.l9:
1853 : b1 0f __ LDA (P2),y ; (src + 0)
1855 : 91 1b __ STA (ACCU + 0),y 
1857 : aa __ __ TAX
1858 : e6 0f __ INC P2 ; (src + 0)
185a : d0 02 __ BNE $185e ; (strcat.s13 + 0)
.s12:
185c : e6 10 __ INC P3 ; (src + 1)
.s13:
185e : e6 1b __ INC ACCU + 0 
1860 : d0 02 __ BNE $1864 ; (strcat.s15 + 0)
.s14:
1862 : e6 1c __ INC ACCU + 1 
.s15:
1864 : 8a __ __ TXA
1865 : d0 ec __ BNE $1853 ; (strcat.l9 + 0)
.s3:
1867 : 60 __ __ RTS
--------------------------------------------------------------------
1868 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 4d 55 53 49 43 2e 2e 2e : lOADING MUSIC...
1878 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
uii_change_dir: ; uii_change_dir(u8*)->void
;  25, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
1879 : a9 00 __ LDA #$00
187b : 85 0d __ STA P0 
187d : 20 a1 79 JSR $79a1 ; (strlen@proxy + 0)
1880 : 18 __ __ CLC
1881 : a5 1b __ LDA ACCU + 0 
1883 : 69 02 __ ADC #$02
1885 : 85 1b __ STA ACCU + 0 
1887 : 90 02 __ BCC $188b ; (uii_change_dir.s11 + 0)
.s10:
1889 : e6 1c __ INC ACCU + 1 
.s11:
188b : 20 a9 76 JSR $76a9 ; (crt_malloc + 0)
188e : a5 1c __ LDA ACCU + 1 
1890 : 05 1b __ ORA ACCU + 0 
1892 : d0 01 __ BNE $1895 ; (uii_change_dir.s5 + 0)
.s3:
1894 : 60 __ __ RTS
.s5:
1895 : a5 1c __ LDA ACCU + 1 
1897 : 85 47 __ STA T2 + 1 
1899 : a5 1b __ LDA ACCU + 0 
189b : 85 46 __ STA T2 + 0 
189d : a9 00 __ LDA #$00
189f : a8 __ __ TAY
18a0 : 91 1b __ STA (ACCU + 0),y 
18a2 : a9 7a __ LDA #$7a
18a4 : 85 0e __ STA P1 
18a6 : a9 11 __ LDA #$11
18a8 : c8 __ __ INY
18a9 : 91 1b __ STA (ACCU + 0),y 
18ab : 20 45 10 JSR $1045 ; (strlen.s4 + 0)
18ae : a5 1b __ LDA ACCU + 0 
18b0 : 05 1c __ ORA ACCU + 1 
18b2 : f0 23 __ BEQ $18d7 ; (uii_change_dir.s6 + 0)
.s7:
18b4 : a9 00 __ LDA #$00
18b6 : 85 45 __ STA T1 + 0 
.l9:
18b8 : a9 7a __ LDA #$7a
18ba : 85 0e __ STA P1 
18bc : a6 45 __ LDX T1 + 0 
18be : 8a __ __ TXA
18bf : 18 __ __ CLC
18c0 : 69 02 __ ADC #$02
18c2 : a8 __ __ TAY
18c3 : bd 00 7a LDA $7a00,x ; (mod_dir[0] + 0)
18c6 : 91 46 __ STA (T2 + 0),y 
18c8 : 20 45 10 JSR $1045 ; (strlen.s4 + 0)
18cb : e6 45 __ INC T1 + 0 
18cd : a5 1c __ LDA ACCU + 1 
18cf : d0 e7 __ BNE $18b8 ; (uii_change_dir.l9 + 0)
.s8:
18d1 : a5 45 __ LDA T1 + 0 
18d3 : c5 1b __ CMP ACCU + 0 
18d5 : 90 e1 __ BCC $18b8 ; (uii_change_dir.l9 + 0)
.s6:
18d7 : a9 01 __ LDA #$01
18d9 : 8d fb 78 STA $78fb ; (uii_target + 0)
18dc : 20 a1 79 JSR $79a1 ; (strlen@proxy + 0)
18df : a5 46 __ LDA T2 + 0 
18e1 : 85 0d __ STA P0 
18e3 : a5 47 __ LDA T2 + 1 
18e5 : 85 0e __ STA P1 
18e7 : 18 __ __ CLC
18e8 : a5 1b __ LDA ACCU + 0 
18ea : 69 02 __ ADC #$02
18ec : 85 0f __ STA P2 
18ee : a5 1c __ LDA ACCU + 1 
18f0 : 69 00 __ ADC #$00
18f2 : 85 10 __ STA P3 
18f4 : 20 a2 12 JSR $12a2 ; (uii_sendcommand.s4 + 0)
18f7 : 20 a1 77 JSR $77a1 ; (crt_free@proxy + 0)
18fa : 20 4d 13 JSR $134d ; (uii_readstatus.s4 + 0)
18fd : 4c ab 13 JMP $13ab ; (uii_accept.s4 + 0)
--------------------------------------------------------------------
modplay_load: ; modplay_load(u8*,u32)->u8
; 209, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s4:
1900 : 20 6c 19 JSR $196c ; (uii_open_file.s4 + 0)
1903 : ad c9 92 LDA $92c9 ; (uii_status[0] + 0)
1906 : c9 30 __ CMP #$30
1908 : d0 07 __ BNE $1911 ; (modplay_load.s15 + 0)
.s5:
190a : ad ca 92 LDA $92ca ; (uii_status[0] + 1)
190d : c9 30 __ CMP #$30
190f : f0 05 __ BEQ $1916 ; (modplay_load.s6 + 0)
.s15:
1911 : a9 00 __ LDA #$00
.s3:
1913 : 85 1b __ STA ACCU + 0 
1915 : 60 __ __ RTS
.s6:
1916 : a9 00 __ LDA #$00
1918 : 85 48 __ STA T0 + 0 
191a : 85 4b __ STA T0 + 3 
191c : a8 __ __ TAY
191d : aa __ __ TAX
191e : a9 10 __ LDA #$10
1920 : 85 4c __ STA T2 + 0 
.l7:
1922 : 86 13 __ STX P6 
1924 : 84 12 __ STY P5 
1926 : a5 48 __ LDA T0 + 0 
1928 : 85 11 __ STA P4 
192a : a5 4b __ LDA T0 + 3 
192c : 85 14 __ STA P7 
192e : 20 fa 19 JSR $19fa ; (uii_load_reu.s4 + 0)
1931 : 18 __ __ CLC
1932 : a5 11 __ LDA P4 
1934 : 69 ff __ ADC #$ff
1936 : 85 48 __ STA T0 + 0 
1938 : a5 12 __ LDA P5 
193a : 69 7f __ ADC #$7f
193c : a8 __ __ TAY
193d : a5 13 __ LDA P6 
193f : 69 00 __ ADC #$00
1941 : aa __ __ TAX
1942 : a5 14 __ LDA P7 
1944 : 69 00 __ ADC #$00
1946 : 85 4b __ STA T0 + 3 
1948 : ad c9 92 LDA $92c9 ; (uii_status[0] + 0)
194b : c9 30 __ CMP #$30
194d : d0 0b __ BNE $195a ; (modplay_load.s10 + 0)
.s8:
194f : ad ca 92 LDA $92ca ; (uii_status[0] + 1)
1952 : c9 30 __ CMP #$30
1954 : d0 04 __ BNE $195a ; (modplay_load.s10 + 0)
.s9:
1956 : c6 4c __ DEC T2 + 0 
1958 : d0 c8 __ BNE $1922 ; (modplay_load.l7 + 0)
.s10:
195a : a5 4b __ LDA T0 + 3 
195c : d0 0a __ BNE $1968 ; (modplay_load.s11 + 0)
.s12:
195e : 8a __ __ TXA
195f : d0 07 __ BNE $1968 ; (modplay_load.s11 + 0)
.s13:
1961 : 98 __ __ TYA
1962 : d0 04 __ BNE $1968 ; (modplay_load.s11 + 0)
.s14:
1964 : c5 48 __ CMP T0 + 0 
1966 : b0 ab __ BCS $1913 ; (modplay_load.s3 + 0)
.s11:
1968 : a9 01 __ LDA #$01
196a : d0 a7 __ BNE $1913 ; (modplay_load.s3 + 0)
--------------------------------------------------------------------
uii_open_file: ; uii_open_file(u8,u8*)->void
;  31, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
196c : a9 f8 __ LDA #$f8
196e : 85 0d __ STA P0 
1970 : 20 41 10 JSR $1041 ; (strlen@proxy + 0)
1973 : 18 __ __ CLC
1974 : a5 1b __ LDA ACCU + 0 
1976 : 69 03 __ ADC #$03
1978 : 85 1b __ STA ACCU + 0 
197a : 90 02 __ BCC $197e ; (uii_open_file.s11 + 0)
.s10:
197c : e6 1c __ INC ACCU + 1 
.s11:
197e : 20 a9 76 JSR $76a9 ; (crt_malloc + 0)
1981 : a5 1c __ LDA ACCU + 1 
1983 : 05 1b __ ORA ACCU + 0 
1985 : d0 01 __ BNE $1988 ; (uii_open_file.s5 + 0)
.s3:
1987 : 60 __ __ RTS
.s5:
1988 : a5 1c __ LDA ACCU + 1 
198a : 85 47 __ STA T2 + 1 
198c : a5 1b __ LDA ACCU + 0 
198e : 85 46 __ STA T2 + 0 
1990 : a9 00 __ LDA #$00
1992 : a8 __ __ TAY
1993 : 91 1b __ STA (ACCU + 0),y 
1995 : a9 79 __ LDA #$79
1997 : 85 0e __ STA P1 
1999 : a9 02 __ LDA #$02
199b : c8 __ __ INY
199c : 91 1b __ STA (ACCU + 0),y 
199e : 98 __ __ TYA
199f : c8 __ __ INY
19a0 : 91 1b __ STA (ACCU + 0),y 
19a2 : 20 45 10 JSR $1045 ; (strlen.s4 + 0)
19a5 : a5 1b __ LDA ACCU + 0 
19a7 : 05 1c __ ORA ACCU + 1 
19a9 : f0 23 __ BEQ $19ce ; (uii_open_file.s6 + 0)
.s7:
19ab : a9 00 __ LDA #$00
19ad : 85 45 __ STA T1 + 0 
.l9:
19af : a9 79 __ LDA #$79
19b1 : 85 0e __ STA P1 
19b3 : a6 45 __ LDX T1 + 0 
19b5 : 8a __ __ TXA
19b6 : 18 __ __ CLC
19b7 : 69 03 __ ADC #$03
19b9 : a8 __ __ TAY
19ba : bd f8 79 LDA $79f8,x ; (mod_file[0] + 0)
19bd : 91 46 __ STA (T2 + 0),y 
19bf : 20 45 10 JSR $1045 ; (strlen.s4 + 0)
19c2 : e6 45 __ INC T1 + 0 
19c4 : a5 1c __ LDA ACCU + 1 
19c6 : d0 e7 __ BNE $19af ; (uii_open_file.l9 + 0)
.s8:
19c8 : a5 45 __ LDA T1 + 0 
19ca : c5 1b __ CMP ACCU + 0 
19cc : 90 e1 __ BCC $19af ; (uii_open_file.l9 + 0)
.s6:
19ce : a9 01 __ LDA #$01
19d0 : 8d fb 78 STA $78fb ; (uii_target + 0)
19d3 : 20 41 10 JSR $1041 ; (strlen@proxy + 0)
19d6 : a5 46 __ LDA T2 + 0 
19d8 : 85 0d __ STA P0 
19da : a5 47 __ LDA T2 + 1 
19dc : 85 0e __ STA P1 
19de : 18 __ __ CLC
19df : a5 1b __ LDA ACCU + 0 
19e1 : 69 03 __ ADC #$03
19e3 : 85 0f __ STA P2 
19e5 : a5 1c __ LDA ACCU + 1 
19e7 : 69 00 __ ADC #$00
19e9 : 85 10 __ STA P3 
19eb : 20 a2 12 JSR $12a2 ; (uii_sendcommand.s4 + 0)
19ee : 20 a1 77 JSR $77a1 ; (crt_free@proxy + 0)
19f1 : 20 1d 13 JSR $131d ; (uii_readdata.s4 + 0)
19f4 : 20 4d 13 JSR $134d ; (uii_readstatus.s4 + 0)
19f7 : 4c ab 13 JMP $13ab ; (uii_accept.s4 + 0)
--------------------------------------------------------------------
uii_load_reu: ; uii_load_reu(u32,u32)->void
;  46, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
19fa : a9 00 __ LDA #$00
19fc : 85 10 __ STA P3 
19fe : 8d e0 bf STA $bfe0 ; (cmd[0] + 0)
1a01 : 8d e8 bf STA $bfe8 ; (cmd[0] + 8)
1a04 : 8d e9 bf STA $bfe9 ; (cmd[0] + 9)
1a07 : a9 0a __ LDA #$0a
1a09 : 85 0f __ STA P2 
1a0b : a9 01 __ LDA #$01
1a0d : 8d fb 78 STA $78fb ; (uii_target + 0)
1a10 : a9 21 __ LDA #$21
1a12 : 8d e1 bf STA $bfe1 ; (cmd[0] + 1)
1a15 : a9 ff __ LDA #$ff
1a17 : 8d e6 bf STA $bfe6 ; (cmd[0] + 6)
1a1a : a9 7f __ LDA #$7f
1a1c : 8d e7 bf STA $bfe7 ; (cmd[0] + 7)
1a1f : a5 11 __ LDA P4 ; (reu_addr + 0)
1a21 : 8d e2 bf STA $bfe2 ; (cmd[0] + 2)
1a24 : a5 12 __ LDA P5 ; (reu_addr + 1)
1a26 : 8d e3 bf STA $bfe3 ; (cmd[0] + 3)
1a29 : a5 13 __ LDA P6 ; (reu_addr + 2)
1a2b : 8d e4 bf STA $bfe4 ; (cmd[0] + 4)
1a2e : a5 14 __ LDA P7 ; (reu_addr + 3)
1a30 : 8d e5 bf STA $bfe5 ; (cmd[0] + 5)
1a33 : a9 e0 __ LDA #$e0
1a35 : 85 0d __ STA P0 
1a37 : a9 bf __ LDA #$bf
1a39 : 85 0e __ STA P1 
1a3b : 20 a2 12 JSR $12a2 ; (uii_sendcommand.s4 + 0)
1a3e : 20 1d 13 JSR $131d ; (uii_readdata.s4 + 0)
1a41 : 20 4d 13 JSR $134d ; (uii_readstatus.s4 + 0)
1a44 : 4c ab 13 JMP $13ab ; (uii_accept.s4 + 0)
--------------------------------------------------------------------
modplay_init: ; modplay_init(u32)->u8
; 227, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s4:
1a47 : a9 00 __ LDA #$00
1a49 : 8d 08 98 STA $9808 ; (modplay.reu_base + 0)
1a4c : 8d 09 98 STA $9809 ; (modplay.reu_base + 1)
1a4f : 8d 0a 98 STA $980a ; (modplay.reu_base + 2)
1a52 : 8d 0b 98 STA $980b ; (modplay.reu_base + 3)
1a55 : a2 ca __ LDX #$ca
1a57 : 8e 02 df STX $df02 
1a5a : a2 93 __ LDX #$93
1a5c : 8e 03 df STX $df03 
1a5f : 8d 04 df STA $df04 
1a62 : 8d 05 df STA $df05 
1a65 : 8d 06 df STA $df06 
1a68 : a9 3c __ LDA #$3c
1a6a : 8d 07 df STA $df07 
1a6d : a9 04 __ LDA #$04
1a6f : 8d 08 df STA $df08 
1a72 : a9 00 __ LDA #$00
1a74 : 8d 0a df STA $df0a 
1a77 : a9 91 __ LDA #$91
1a79 : 8d 01 df STA $df01 
1a7c : ad 02 98 LDA $9802 ; (hdr[0] + 1080)
1a7f : c9 4d __ CMP #$4d
1a81 : f0 03 __ BEQ $1a86 ; (modplay_init.s48 + 0)
1a83 : 4c e6 1c JMP $1ce6 ; (modplay_init.s5 + 0)
.s48:
1a86 : ad 03 98 LDA $9803 ; (hdr[0] + 1081)
1a89 : c9 2e __ CMP #$2e
1a8b : d0 03 __ BNE $1a90 ; (modplay_init.s49 + 0)
1a8d : 4c d5 1c JMP $1cd5 ; (modplay_init.s52 + 0)
.s49:
1a90 : c9 21 __ CMP #$21
1a92 : d0 0e __ BNE $1aa2 ; (modplay_init.s6 + 0)
.s50:
1a94 : ad 04 98 LDA $9804 ; (hdr[0] + 1082)
1a97 : c9 4b __ CMP #$4b
1a99 : d0 07 __ BNE $1aa2 ; (modplay_init.s6 + 0)
.s51:
1a9b : ad 05 98 LDA $9805 ; (hdr[0] + 1083)
1a9e : c9 21 __ CMP #$21
1aa0 : f0 1c __ BEQ $1abe ; (modplay_init.s44 + 0)
.s6:
1aa2 : ad 02 98 LDA $9802 ; (hdr[0] + 1080)
1aa5 : c9 46 __ CMP #$46
1aa7 : d0 19 __ BNE $1ac2 ; (modplay_init.s7 + 0)
.s41:
1aa9 : ad 03 98 LDA $9803 ; (hdr[0] + 1081)
1aac : c9 4c __ CMP #$4c
1aae : d0 12 __ BNE $1ac2 ; (modplay_init.s7 + 0)
.s42:
1ab0 : ad 04 98 LDA $9804 ; (hdr[0] + 1082)
1ab3 : c9 54 __ CMP #$54
1ab5 : d0 0b __ BNE $1ac2 ; (modplay_init.s7 + 0)
.s43:
1ab7 : ad 05 98 LDA $9805 ; (hdr[0] + 1083)
1aba : c9 34 __ CMP #$34
1abc : d0 04 __ BNE $1ac2 ; (modplay_init.s7 + 0)
.s44:
1abe : a9 1f __ LDA #$1f
1ac0 : d0 17 __ BNE $1ad9 ; (modplay_init.s12 + 0)
.s7:
1ac2 : a2 00 __ LDX #$00
.l8:
1ac4 : bd 02 98 LDA $9802,x ; (hdr[0] + 1080)
1ac7 : c9 20 __ CMP #$20
1ac9 : b0 03 __ BCS $1ace ; (modplay_init.s9 + 0)
1acb : 4c d0 1c JMP $1cd0 ; (modplay_init.s40 + 0)
.s9:
1ace : c9 7f __ CMP #$7f
1ad0 : b0 f9 __ BCS $1acb ; (modplay_init.l8 + 7)
.s10:
1ad2 : e8 __ __ INX
1ad3 : e0 04 __ CPX #$04
1ad5 : 90 ed __ BCC $1ac4 ; (modplay_init.l8 + 0)
.s11:
1ad7 : a9 0f __ LDA #$0f
.s12:
1ad9 : 8d 0d 98 STA $980d ; (modplay.num_samples + 0)
1adc : ad 80 97 LDA $9780 ; (hdr[0] + 950)
1adf : 8d 0c 98 STA $980c ; (modplay.song_length + 0)
1ae2 : d0 09 __ BNE $1aed ; (modplay_init.s39 + 0)
.s62:
1ae4 : a9 80 __ LDA #$80
.s13:
1ae6 : 8d 0c 98 STA $980c ; (modplay.song_length + 0)
.s14:
1ae9 : a2 7f __ LDX #$7f
1aeb : d0 09 __ BNE $1af6 ; (modplay_init.l15 + 0)
.s39:
1aed : a9 80 __ LDA #$80
1aef : cd 80 97 CMP $9780 ; (hdr[0] + 950)
1af2 : b0 f5 __ BCS $1ae9 ; (modplay_init.s14 + 0)
1af4 : 90 f0 __ BCC $1ae6 ; (modplay_init.s13 + 0)
.l15:
1af6 : bd 82 97 LDA $9782,x ; (hdr[0] + 952)
1af9 : 9d 0f 98 STA $980f,x ; (modplay.order_table[0] + 0)
1afc : ca __ __ DEX
1afd : 10 f7 __ BPL $1af6 ; (modplay_init.l15 + 0)
.s16:
1aff : a2 00 __ LDX #$00
1b01 : a0 00 __ LDY #$00
.l17:
1b03 : 98 __ __ TYA
1b04 : dd 0f 98 CMP $980f,x ; (modplay.order_table[0] + 0)
1b07 : b0 04 __ BCS $1b0d ; (modplay_init.s18 + 0)
.s38:
1b09 : bd 0f 98 LDA $980f,x ; (modplay.order_table[0] + 0)
1b0c : a8 __ __ TAY
.s18:
1b0d : e8 __ __ INX
1b0e : 10 f3 __ BPL $1b03 ; (modplay_init.l17 + 0)
.s19:
1b10 : 18 __ __ CLC
1b11 : 69 01 __ ADC #$01
1b13 : 85 1c __ STA ACCU + 1 
1b15 : 8d 0e 98 STA $980e ; (modplay.num_patterns + 0)
1b18 : a9 00 __ LDA #$00
1b1a : 06 1c __ ASL ACCU + 1 
1b1c : 2a __ __ ROL
1b1d : 06 1c __ ASL ACCU + 1 
1b1f : 2a __ __ ROL
1b20 : 85 1d __ STA ACCU + 2 
1b22 : ad 0d 98 LDA $980d ; (modplay.num_samples + 0)
1b25 : c9 1f __ CMP #$1f
1b27 : d0 03 __ BNE $1b2c ; (modplay_init.s20 + 0)
1b29 : 4c bc 1c JMP $1cbc ; (modplay_init.s37 + 0)
.s20:
1b2c : a5 1c __ LDA ACCU + 1 
1b2e : 09 02 __ ORA #$02
1b30 : 85 1c __ STA ACCU + 1 
1b32 : a9 58 __ LDA #$58
1b34 : 85 1b __ STA ACCU + 0 
1b36 : ad 0d 98 LDA $980d ; (modplay.num_samples + 0)
1b39 : d0 66 __ BNE $1ba1 ; (modplay_init.s31 + 0)
.s21:
1b3b : a9 00 __ LDA #$00
1b3d : 8d fd 7d STA $7dfd ; (mod_paused + 0)
1b40 : 8d 8f 98 STA $988f ; (modplay.order_pos + 0)
1b43 : 8d 91 98 STA $9891 ; (modplay.row + 0)
1b46 : 8d 92 98 STA $9892 ; (modplay.tick + 0)
1b49 : 8d 98 98 STA $9898 ; (modplay.active + 0)
1b4c : ad 0f 98 LDA $980f ; (modplay.order_table[0] + 0)
1b4f : 8d 90 98 STA $9890 ; (modplay.pattern_num + 0)
1b52 : a9 01 __ LDA #$01
1b54 : 8d 97 98 STA $9897 ; (modplay.stereo + 0)
1b57 : 8d 99 98 STA $9899 ; (modplay.loop_song + 0)
1b5a : a9 06 __ LDA #$06
1b5c : 8d 93 98 STA $9893 ; (modplay.ticks_per_row + 0)
1b5f : a9 7d __ LDA #$7d
1b61 : 8d 94 98 STA $9894 ; (modplay.bpm + 0)
1b64 : a9 00 __ LDA #$00
1b66 : a2 c8 __ LDX #$c8
1b68 : 8e 96 98 STX $9896 ; (modplay.master_volume + 0)
.l22:
1b6b : ca __ __ DEX
1b6c : 9d ea 9a STA $9aea,x ; (modplay.channel[0].sample_num + 0)
1b6f : d0 fa __ BNE $1b6b ; (modplay_init.l22 + 0)
.s23:
1b71 : 85 46 __ STA T2 + 0 
.l24:
1b73 : a5 46 __ LDA T2 + 0 
1b75 : c9 01 __ CMP #$01
1b77 : f0 04 __ BEQ $1b7d ; (modplay_init.s30 + 0)
.s25:
1b79 : c9 02 __ CMP #$02
1b7b : d0 04 __ BNE $1b81 ; (modplay_init.s26 + 0)
.s30:
1b7d : a0 ff __ LDY #$ff
1b7f : d0 02 __ BNE $1b83 ; (modplay_init.l27 + 0)
.s26:
1b81 : a0 00 __ LDY #$00
.l27:
1b83 : a6 46 __ LDX T2 + 0 
1b85 : bd fc 73 LDA $73fc,x ; (__multab50L + 0)
1b88 : aa __ __ TAX
1b89 : 98 __ __ TYA
1b8a : 9d f0 9a STA $9af0,x ; (modplay.channel[0].pan + 0)
1b8d : e6 46 __ INC T2 + 0 
1b8f : a5 46 __ LDA T2 + 0 
1b91 : c9 04 __ CMP #$04
1b93 : b0 07 __ BCS $1b9c ; (modplay_init.s28 + 0)
.s29:
1b95 : ad 97 98 LDA $9897 ; (modplay.stereo + 0)
1b98 : f0 e7 __ BEQ $1b81 ; (modplay_init.s26 + 0)
1b9a : d0 d7 __ BNE $1b73 ; (modplay_init.l24 + 0)
.s28:
1b9c : a9 01 __ LDA #$01
.s3:
1b9e : 85 1b __ STA ACCU + 0 
1ba0 : 60 __ __ RTS
.s31:
1ba1 : a9 00 __ LDA #$00
1ba3 : 85 43 __ STA T1 + 0 
1ba5 : 85 44 __ STA T1 + 1 
1ba7 : 85 45 __ STA T1 + 2 
1ba9 : 85 1e __ STA ACCU + 3 
1bab : a9 9d __ LDA #$9d
1bad : 85 4e __ STA T6 + 0 
1baf : a9 98 __ LDA #$98
1bb1 : 85 4f __ STA T6 + 1 
1bb3 : a9 de __ LDA #$de
1bb5 : 85 50 __ STA T7 + 0 
1bb7 : a9 93 __ LDA #$93
1bb9 : 85 51 __ STA T7 + 1 
1bbb : a2 00 __ LDX #$00
1bbd : 18 __ __ CLC
.l32:
1bbe : a5 1b __ LDA ACCU + 0 
1bc0 : 65 43 __ ADC T1 + 0 
1bc2 : a0 00 __ LDY #$00
1bc4 : 84 48 __ STY T2 + 2 
1bc6 : 91 4e __ STA (T6 + 0),y 
1bc8 : a5 1c __ LDA ACCU + 1 
1bca : 65 44 __ ADC T1 + 1 
1bcc : c8 __ __ INY
1bcd : 91 4e __ STA (T6 + 0),y 
1bcf : a5 1d __ LDA ACCU + 2 
1bd1 : 65 45 __ ADC T1 + 2 
1bd3 : c8 __ __ INY
1bd4 : 91 4e __ STA (T6 + 0),y 
1bd6 : 8a __ __ TXA
1bd7 : 69 00 __ ADC #$00
1bd9 : c8 __ __ INY
1bda : 91 4e __ STA (T6 + 0),y 
1bdc : a0 16 __ LDY #$16
1bde : b1 50 __ LDA (T7 + 0),y 
1be0 : 85 47 __ STA T2 + 1 
1be2 : c8 __ __ INY
1be3 : b1 50 __ LDA (T7 + 0),y 
1be5 : 0a __ __ ASL
1be6 : 85 46 __ STA T2 + 0 
1be8 : 26 47 __ ROL T2 + 1 
1bea : 26 48 __ ROL T2 + 2 
1bec : a0 04 __ LDY #$04
1bee : 91 4e __ STA (T6 + 0),y 
1bf0 : a5 47 __ LDA T2 + 1 
1bf2 : c8 __ __ INY
1bf3 : 91 4e __ STA (T6 + 0),y 
1bf5 : a5 48 __ LDA T2 + 2 
1bf7 : c8 __ __ INY
1bf8 : 91 4e __ STA (T6 + 0),y 
1bfa : a9 00 __ LDA #$00
1bfc : c8 __ __ INY
1bfd : 91 4e __ STA (T6 + 0),y 
1bff : a0 19 __ LDY #$19
1c01 : b1 50 __ LDA (T7 + 0),y 
1c03 : c9 41 __ CMP #$41
1c05 : 90 02 __ BCC $1c09 ; (modplay_init.s54 + 0)
.s33:
1c07 : a9 40 __ LDA #$40
.s54:
1c09 : a0 11 __ LDY #$11
1c0b : 91 4e __ STA (T6 + 0),y 
1c0d : a0 18 __ LDY #$18
1c0f : b1 50 __ LDA (T7 + 0),y 
1c11 : 29 0f __ AND #$0f
1c13 : a0 12 __ LDY #$12
1c15 : 91 4e __ STA (T6 + 0),y 
1c17 : a0 1a __ LDY #$1a
1c19 : b1 50 __ LDA (T7 + 0),y 
1c1b : 85 4a __ STA T3 + 1 
1c1d : c8 __ __ INY
1c1e : b1 50 __ LDA (T7 + 0),y 
1c20 : 85 49 __ STA T3 + 0 
1c22 : 0a __ __ ASL
1c23 : a0 08 __ LDY #$08
1c25 : 91 4e __ STA (T6 + 0),y 
1c27 : a5 4a __ LDA T3 + 1 
1c29 : 2a __ __ ROL
1c2a : c8 __ __ INY
1c2b : 91 4e __ STA (T6 + 0),y 
1c2d : a9 00 __ LDA #$00
1c2f : 2a __ __ ROL
1c30 : c8 __ __ INY
1c31 : 91 4e __ STA (T6 + 0),y 
1c33 : a9 00 __ LDA #$00
1c35 : c8 __ __ INY
1c36 : 91 4e __ STA (T6 + 0),y 
1c38 : a0 1d __ LDY #$1d
1c3a : b1 50 __ LDA (T7 + 0),y 
1c3c : 85 4c __ STA T4 + 0 
1c3e : 65 49 __ ADC T3 + 0 
1c40 : 85 49 __ STA T3 + 0 
1c42 : 88 __ __ DEY
1c43 : b1 50 __ LDA (T7 + 0),y 
1c45 : 85 4d __ STA T4 + 1 
1c47 : 65 4a __ ADC T3 + 1 
1c49 : 85 4a __ STA T3 + 1 
1c4b : a9 00 __ LDA #$00
1c4d : 2a __ __ ROL
1c4e : 85 4b __ STA T3 + 2 
1c50 : a9 00 __ LDA #$00
1c52 : 06 49 __ ASL T3 + 0 
1c54 : 26 4a __ ROL T3 + 1 
1c56 : 26 4b __ ROL T3 + 2 
1c58 : a0 0f __ LDY #$0f
1c5a : 91 4e __ STA (T6 + 0),y 
1c5c : a5 49 __ LDA T3 + 0 
1c5e : a0 0c __ LDY #$0c
1c60 : 91 4e __ STA (T6 + 0),y 
1c62 : a5 4a __ LDA T3 + 1 
1c64 : c8 __ __ INY
1c65 : 91 4e __ STA (T6 + 0),y 
1c67 : a5 4b __ LDA T3 + 2 
1c69 : c8 __ __ INY
1c6a : 91 4e __ STA (T6 + 0),y 
1c6c : a5 4d __ LDA T4 + 1 
1c6e : f0 04 __ BEQ $1c74 ; (modplay_init.s36 + 0)
.s35:
1c70 : a9 01 __ LDA #$01
1c72 : d0 09 __ BNE $1c7d ; (modplay_init.s34 + 0)
.s36:
1c74 : a9 01 __ LDA #$01
1c76 : c5 4c __ CMP T4 + 0 
1c78 : a9 00 __ LDA #$00
1c7a : 2a __ __ ROL
1c7b : 49 01 __ EOR #$01
.s34:
1c7d : a0 10 __ LDY #$10
1c7f : 91 4e __ STA (T6 + 0),y 
1c81 : 18 __ __ CLC
1c82 : a5 46 __ LDA T2 + 0 
1c84 : 65 43 __ ADC T1 + 0 
1c86 : 85 43 __ STA T1 + 0 
1c88 : a5 47 __ LDA T2 + 1 
1c8a : 65 44 __ ADC T1 + 1 
1c8c : 85 44 __ STA T1 + 1 
1c8e : a5 48 __ LDA T2 + 2 
1c90 : 65 45 __ ADC T1 + 2 
1c92 : 85 45 __ STA T1 + 2 
1c94 : 90 02 __ BCC $1c98 ; (modplay_init.s57 + 0)
.s56:
1c96 : e8 __ __ INX
1c97 : 18 __ __ CLC
.s57:
1c98 : a5 50 __ LDA T7 + 0 
1c9a : 69 1e __ ADC #$1e
1c9c : 85 50 __ STA T7 + 0 
1c9e : 90 03 __ BCC $1ca3 ; (modplay_init.s59 + 0)
.s58:
1ca0 : e6 51 __ INC T7 + 1 
1ca2 : 18 __ __ CLC
.s59:
1ca3 : a5 4e __ LDA T6 + 0 
1ca5 : 69 13 __ ADC #$13
1ca7 : 85 4e __ STA T6 + 0 
1ca9 : 90 02 __ BCC $1cad ; (modplay_init.s61 + 0)
.s60:
1cab : e6 4f __ INC T6 + 1 
.s61:
1cad : e6 1e __ INC ACCU + 3 
1caf : a5 1e __ LDA ACCU + 3 
1cb1 : cd 0d 98 CMP $980d ; (modplay.num_samples + 0)
1cb4 : b0 03 __ BCS $1cb9 ; (modplay_init.s61 + 12)
1cb6 : 4c be 1b JMP $1bbe ; (modplay_init.l32 + 0)
1cb9 : 4c 3b 1b JMP $1b3b ; (modplay_init.s21 + 0)
.s37:
1cbc : a9 3c __ LDA #$3c
1cbe : 85 1b __ STA ACCU + 0 
1cc0 : a5 1c __ LDA ACCU + 1 
1cc2 : 69 03 __ ADC #$03
1cc4 : 85 1c __ STA ACCU + 1 
1cc6 : b0 03 __ BCS $1ccb ; (modplay_init.s55 + 0)
1cc8 : 4c a1 1b JMP $1ba1 ; (modplay_init.s31 + 0)
.s55:
1ccb : e6 1d __ INC ACCU + 2 
1ccd : 4c a1 1b JMP $1ba1 ; (modplay_init.s31 + 0)
.s40:
1cd0 : a9 00 __ LDA #$00
1cd2 : 4c 9e 1b JMP $1b9e ; (modplay_init.s3 + 0)
.s52:
1cd5 : ad 04 98 LDA $9804 ; (hdr[0] + 1082)
1cd8 : c9 4b __ CMP #$4b
1cda : d0 0a __ BNE $1ce6 ; (modplay_init.s5 + 0)
.s53:
1cdc : ad 05 98 LDA $9805 ; (hdr[0] + 1083)
1cdf : c9 2e __ CMP #$2e
1ce1 : d0 03 __ BNE $1ce6 ; (modplay_init.s5 + 0)
1ce3 : 4c be 1a JMP $1abe ; (modplay_init.s44 + 0)
.s5:
1ce6 : ad 02 98 LDA $9802 ; (hdr[0] + 1080)
1ce9 : c9 34 __ CMP #$34
1ceb : f0 03 __ BEQ $1cf0 ; (modplay_init.s45 + 0)
1ced : 4c a2 1a JMP $1aa2 ; (modplay_init.s6 + 0)
.s45:
1cf0 : ad 03 98 LDA $9803 ; (hdr[0] + 1081)
1cf3 : c9 43 __ CMP #$43
1cf5 : f0 03 __ BEQ $1cfa ; (modplay_init.s46 + 0)
1cf7 : 4c c2 1a JMP $1ac2 ; (modplay_init.s7 + 0)
.s46:
1cfa : ad 04 98 LDA $9804 ; (hdr[0] + 1082)
1cfd : c9 48 __ CMP #$48
1cff : d0 f6 __ BNE $1cf7 ; (modplay_init.s45 + 7)
.s47:
1d01 : ad 05 98 LDA $9805 ; (hdr[0] + 1083)
1d04 : c9 4e __ CMP #$4e
1d06 : d0 ef __ BNE $1cf7 ; (modplay_init.s45 + 7)
1d08 : 4c be 1a JMP $1abe ; (modplay_init.s44 + 0)
--------------------------------------------------------------------
1d0b : __ __ __ BYT 6d 55 53 49 43 00                               : mUSIC.
--------------------------------------------------------------------
1d11 : __ __ __ BYT 34 45 56 2e 4d 4f 44 00                         : 4EV.MOD.
--------------------------------------------------------------------
1d19 : __ __ __ BYT 62 41 44 20 6d 6f 64 20 46 4f 52 4d 41 54 00    : bAD mod FORMAT.
--------------------------------------------------------------------
1d28 : __ __ __ BYT 66 49 4c 45 20 4e 4f 54 20 46 4f 55 4e 44 00    : fILE NOT FOUND.
--------------------------------------------------------------------
1d37 : __ __ __ BYT 64 45 54 45 43 54 49 4f 4e 20 43 4f 4d 50 4c 45 : dETECTION COMPLE
1d47 : __ __ __ BYT 54 45 2e 00                                     : TE..
--------------------------------------------------------------------
screen_wait_key: ; screen_wait_key(const u8*)->void
;  37, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
1d4b : a9 01 __ LDA #$01
1d4d : 85 0f __ STA P2 
1d4f : a5 10 __ LDA P3 ; (msg + 0)
1d51 : aa __ __ TAX
1d52 : 05 11 __ ORA P4 ; (msg + 1)
1d54 : f0 0a __ BEQ $1d60 ; (screen_wait_key.s5 + 0)
.s10:
1d56 : a5 11 __ LDA P4 ; (msg + 1)
1d58 : 85 0e __ STA P1 
1d5a : a0 00 __ LDY #$00
1d5c : b1 10 __ LDA (P3),y ; (msg + 0)
1d5e : d0 06 __ BNE $1d66 ; (screen_wait_key.s6 + 0)
.s5:
1d60 : a9 1d __ LDA #$1d
1d62 : 85 0e __ STA P1 
1d64 : a2 8f __ LDX #$8f
.s6:
1d66 : 86 0d __ STX P0 
1d68 : 20 c3 10 JSR $10c3 ; (cwin_put_string.s4 + 0)
1d6b : 20 a3 10 JSR $10a3 ; (cwin_cursor_newline.s4 + 0)
1d6e : a9 00 __ LDA #$00
1d70 : 8d 00 dc STA $dc00 
.l7:
1d73 : ad 01 dc LDA $dc01 
1d76 : c9 ff __ CMP #$ff
1d78 : d0 f9 __ BNE $1d73 ; (screen_wait_key.l7 + 0)
.s8:
1d7a : 8d 00 dc STA $dc00 
.l9:
1d7d : a2 00 __ LDX #$00
1d7f : 8e 00 dc STX $dc00 
1d82 : ae 01 dc LDX $dc01 
1d85 : 86 43 __ STX T0 + 0 
1d87 : 8d 00 dc STA $dc00 
1d8a : c5 43 __ CMP T0 + 0 
1d8c : f0 ef __ BEQ $1d7d ; (screen_wait_key.l9 + 0)
.s3:
1d8e : 60 __ __ RTS
--------------------------------------------------------------------
1d8f : __ __ __ BYT 70 52 45 53 53 20 41 4e 59 20 4b 45 59 20 54 4f : pRESS ANY KEY TO
1d9f : __ __ __ BYT 20 43 4f 4e 54 49 4e 55 45 2e 00                :  CONTINUE..
--------------------------------------------------------------------
1daa : __ __ __ BYT 70 52 45 53 53 20 41 4e 59 20 4b 45 59 20 54 4f : pRESS ANY KEY TO
1dba : __ __ __ BYT 20 53 54 41 52 54 20 54 48 45 20 44 45 4d 4f 2e :  START THE DEMO.
1dca : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
gears_run: ; gears_run()->void
;   8, "/home/xahmol/git/UltimateDemo2026/src/gears.h"
.s1:
1dcb : a5 53 __ LDA T0 + 0 
1dcd : 8d ad bf STA $bfad ; (gears_run@stack + 0)
.s4:
1dd0 : a9 00 __ LDA #$00
1dd2 : 85 f9 __ STA $f9 ; (zp_spd + 0)
1dd4 : 85 f7 __ STA $f7 ; (zp_angle1 + 0)
1dd6 : a9 01 __ LDA #$01
1dd8 : 85 fa __ STA $fa ; (zp_dirty + 0)
1dda : a9 1c __ LDA #$1c
1ddc : 85 f8 __ STA $f8 ; (zp_angle2 + 0)
1dde : 20 9d 20 JSR $209d ; (hires_init.s4 + 0)
1de1 : 20 75 21 JSR $2175 ; (engine_init.s4 + 0)
1de4 : a9 00 __ LDA #$00
1de6 : 20 f3 15 JSR $15f3 ; (turbo_set.s4 + 0)
1de9 : a9 00 __ LDA #$00
1deb : 85 0f __ STA P2 
1ded : 85 10 __ STA P3 
1def : a9 e0 __ LDA #$e0
1df1 : 85 11 __ STA P4 
1df3 : a9 06 __ LDA #$06
1df5 : 85 12 __ STA P5 
1df7 : 20 bc 21 JSR $21bc ; (tod_reset.s4 + 0)
1dfa : 20 07 21 JSR $2107 ; (memset@proxy + 0)
1dfd : a9 00 __ LDA #$00
1dff : 8d f3 bf STA $bff3 ; (sstack + 9)
1e02 : 20 c7 21 JSR $21c7 ; (draw_speed.s1 + 0)
1e05 : a9 00 __ LDA #$00
1e07 : 8d f0 bf STA $bff0 ; (sstack + 6)
1e0a : 20 1b 2c JSR $2c1b ; (draw_message.s1 + 0)
1e0d : a9 1c __ LDA #$1c
1e0f : 8d f9 bf STA $bff9 ; (sstack + 15)
1e12 : 8d fc bf STA $bffc ; (sstack + 18)
1e15 : a9 d0 __ LDA #$d0
1e17 : 8d f7 bf STA $bff7 ; (sstack + 13)
1e1a : a9 00 __ LDA #$00
1e1c : 8d f8 bf STA $bff8 ; (sstack + 14)
1e1f : a9 08 __ LDA #$08
1e21 : 8d fa bf STA $bffa ; (sstack + 16)
1e24 : 8d fb bf STA $bffb ; (sstack + 17)
1e27 : 8d fe bf STA $bffe ; (sstack + 20)
1e2a : a9 28 __ LDA #$28
1e2c : 8d fd bf STA $bffd ; (sstack + 19)
1e2f : a9 04 __ LDA #$04
1e31 : 8d ff bf STA $bfff ; (sstack + 21)
1e34 : 20 0b 30 JSR $300b ; (draw_gear.s1 + 0)
1e37 : a9 00 __ LDA #$00
1e39 : 8d f8 bf STA $bff8 ; (sstack + 14)
1e3c : 8d f9 bf STA $bff9 ; (sstack + 15)
1e3f : a9 78 __ LDA #$78
1e41 : 8d f7 bf STA $bff7 ; (sstack + 13)
1e44 : a9 10 __ LDA #$10
1e46 : 8d fa bf STA $bffa ; (sstack + 16)
1e49 : a9 04 __ LDA #$04
1e4b : 8d fb bf STA $bffb ; (sstack + 17)
1e4e : a9 2c __ LDA #$2c
1e50 : 8d fc bf STA $bffc ; (sstack + 18)
1e53 : a9 36 __ LDA #$36
1e55 : 8d fd bf STA $bffd ; (sstack + 19)
1e58 : a9 0a __ LDA #$0a
1e5a : 8d fe bf STA $bffe ; (sstack + 20)
1e5d : a9 06 __ LDA #$06
1e5f : 8d ff bf STA $bfff ; (sstack + 21)
1e62 : 20 0b 30 JSR $300b ; (draw_gear.s1 + 0)
1e65 : a9 00 __ LDA #$00
.l20:
1e67 : 85 fa __ STA $fa ; (zp_dirty + 0)
.l5:
1e69 : a9 0f __ LDA #$0f
1e6b : c5 f9 __ CMP $f9 ; (zp_spd + 0)
1e6d : b0 0f __ BCS $1e7e ; (gears_run.l12 + 0)
.s6:
1e6f : a9 8f __ LDA #$8f
1e71 : 20 f3 15 JSR $15f3 ; (turbo_set.s4 + 0)
1e74 : a9 0f __ LDA #$0f
1e76 : 85 f9 __ STA $f9 ; (zp_spd + 0)
1e78 : 20 bc 21 JSR $21bc ; (tod_reset.s4 + 0)
1e7b : 4c aa 1f JMP $1faa ; (gears_run.l7 + 0)
.l12:
1e7e : 2c 11 d0 BIT $d011 
1e81 : 30 fb __ BMI $1e7e ; (gears_run.l12 + 0)
.l13:
1e83 : 2c 11 d0 BIT $d011 
1e86 : 10 fb __ BPL $1e83 ; (gears_run.l13 + 0)
.s14:
1e88 : a5 fa __ LDA $fa ; (zp_dirty + 0)
1e8a : f0 25 __ BEQ $1eb1 ; (gears_run.s15 + 0)
.s19:
1e8c : a9 00 __ LDA #$00
1e8e : 85 0f __ STA P2 
1e90 : 85 10 __ STA P3 
1e92 : a9 e0 __ LDA #$e0
1e94 : 85 11 __ STA P4 
1e96 : a9 06 __ LDA #$06
1e98 : 85 12 __ STA P5 
1e9a : 20 07 21 JSR $2107 ; (memset@proxy + 0)
1e9d : a5 f9 __ LDA $f9 ; (zp_spd + 0)
1e9f : 8d f3 bf STA $bff3 ; (sstack + 9)
1ea2 : 20 c7 21 JSR $21c7 ; (draw_speed.s1 + 0)
1ea5 : a5 f9 __ LDA $f9 ; (zp_spd + 0)
1ea7 : 8d f0 bf STA $bff0 ; (sstack + 6)
1eaa : 20 1b 2c JSR $2c1b ; (draw_message.s1 + 0)
1ead : a9 00 __ LDA #$00
1eaf : 85 fa __ STA $fa ; (zp_dirty + 0)
.s15:
1eb1 : a9 d0 __ LDA #$d0
1eb3 : 8d f7 bf STA $bff7 ; (sstack + 13)
1eb6 : a9 00 __ LDA #$00
1eb8 : 8d f8 bf STA $bff8 ; (sstack + 14)
1ebb : a5 f8 __ LDA $f8 ; (zp_angle2 + 0)
1ebd : 8d f9 bf STA $bff9 ; (sstack + 15)
1ec0 : a9 08 __ LDA #$08
1ec2 : 8d fa bf STA $bffa ; (sstack + 16)
1ec5 : 8d fb bf STA $bffb ; (sstack + 17)
1ec8 : 8d fe bf STA $bffe ; (sstack + 20)
1ecb : a9 1c __ LDA #$1c
1ecd : 8d fc bf STA $bffc ; (sstack + 18)
1ed0 : a9 28 __ LDA #$28
1ed2 : 8d fd bf STA $bffd ; (sstack + 19)
1ed5 : a9 04 __ LDA #$04
1ed7 : 8d ff bf STA $bfff ; (sstack + 21)
1eda : 20 0b 30 JSR $300b ; (draw_gear.s1 + 0)
1edd : a9 78 __ LDA #$78
1edf : 8d f7 bf STA $bff7 ; (sstack + 13)
1ee2 : a9 00 __ LDA #$00
1ee4 : 8d f8 bf STA $bff8 ; (sstack + 14)
1ee7 : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
1ee9 : 8d f9 bf STA $bff9 ; (sstack + 15)
1eec : a9 10 __ LDA #$10
1eee : 8d fa bf STA $bffa ; (sstack + 16)
1ef1 : a9 04 __ LDA #$04
1ef3 : 8d fb bf STA $bffb ; (sstack + 17)
1ef6 : a9 2c __ LDA #$2c
1ef8 : 8d fc bf STA $bffc ; (sstack + 18)
1efb : a9 36 __ LDA #$36
1efd : 8d fd bf STA $bffd ; (sstack + 19)
1f00 : a9 0a __ LDA #$0a
1f02 : 8d fe bf STA $bffe ; (sstack + 20)
1f05 : a9 06 __ LDA #$06
1f07 : 8d ff bf STA $bfff ; (sstack + 21)
1f0a : 20 0b 30 JSR $300b ; (draw_gear.s1 + 0)
1f0d : 78 __ __ SEI
1f0e : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
1f10 : 18 __ __ CLC
1f11 : 69 01 __ ADC #$01
1f13 : 29 3f __ AND #$3f
1f15 : 85 f7 __ STA $f7 ; (zp_angle1 + 0)
1f17 : a5 f8 __ LDA $f8 ; (zp_angle2 + 0)
1f19 : 38 __ __ SEC
1f1a : e9 02 __ SBC #$02
1f1c : 29 3f __ AND #$3f
1f1e : 85 53 __ STA T0 + 0 
1f20 : 85 f8 __ STA $f8 ; (zp_angle2 + 0)
1f22 : 58 __ __ CLI
1f23 : a9 d0 __ LDA #$d0
1f25 : 8d f7 bf STA $bff7 ; (sstack + 13)
1f28 : a9 00 __ LDA #$00
1f2a : 8d f8 bf STA $bff8 ; (sstack + 14)
1f2d : a5 53 __ LDA T0 + 0 
1f2f : 8d f9 bf STA $bff9 ; (sstack + 15)
1f32 : a9 08 __ LDA #$08
1f34 : 8d fa bf STA $bffa ; (sstack + 16)
1f37 : 8d fb bf STA $bffb ; (sstack + 17)
1f3a : 8d fe bf STA $bffe ; (sstack + 20)
1f3d : a9 1c __ LDA #$1c
1f3f : 8d fc bf STA $bffc ; (sstack + 18)
1f42 : a9 28 __ LDA #$28
1f44 : 8d fd bf STA $bffd ; (sstack + 19)
1f47 : a9 04 __ LDA #$04
1f49 : 8d ff bf STA $bfff ; (sstack + 21)
1f4c : 20 0b 30 JSR $300b ; (draw_gear.s1 + 0)
1f4f : a9 78 __ LDA #$78
1f51 : 8d f7 bf STA $bff7 ; (sstack + 13)
1f54 : a9 00 __ LDA #$00
1f56 : 8d f8 bf STA $bff8 ; (sstack + 14)
1f59 : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
1f5b : 8d f9 bf STA $bff9 ; (sstack + 15)
1f5e : a9 10 __ LDA #$10
1f60 : 8d fa bf STA $bffa ; (sstack + 16)
1f63 : a9 04 __ LDA #$04
1f65 : 8d fb bf STA $bffb ; (sstack + 17)
1f68 : a9 2c __ LDA #$2c
1f6a : 8d fc bf STA $bffc ; (sstack + 18)
1f6d : a9 36 __ LDA #$36
1f6f : 8d fd bf STA $bffd ; (sstack + 19)
1f72 : a9 0a __ LDA #$0a
1f74 : 8d fe bf STA $bffe ; (sstack + 20)
1f77 : a9 06 __ LDA #$06
1f79 : 8d ff bf STA $bfff ; (sstack + 21)
1f7c : 20 0b 30 JSR $300b ; (draw_gear.s1 + 0)
1f7f : ad 09 dc LDA $dc09 
1f82 : d0 03 __ BNE $1f87 ; (gears_run.s16 + 0)
1f84 : 4c 69 1e JMP $1e69 ; (gears_run.l5 + 0)
.s16:
1f87 : 20 bc 21 JSR $21bc ; (tod_reset.s4 + 0)
1f8a : a4 f9 __ LDY $f9 ; (zp_spd + 0)
1f8c : c0 0f __ CPY #$0f
1f8e : b0 13 __ BCS $1fa3 ; (gears_run.s17 + 0)
.s18:
1f90 : c8 __ __ INY
1f91 : 84 0d __ STY P0 
1f93 : 84 f9 __ STY $f9 ; (zp_spd + 0)
1f95 : 98 __ __ TYA
1f96 : 20 f3 15 JSR $15f3 ; (turbo_set.s4 + 0)
1f99 : a5 0d __ LDA P0 
1f9b : 20 6b 3e JSR $3e6b ; (engine_update.s4 + 0)
1f9e : a9 01 __ LDA #$01
1fa0 : 4c 67 1e JMP $1e67 ; (gears_run.l20 + 0)
.s17:
1fa3 : a9 10 __ LDA #$10
1fa5 : 85 f9 __ STA $f9 ; (zp_spd + 0)
1fa7 : 4c 69 1e JMP $1e69 ; (gears_run.l5 + 0)
.l7:
1faa : ad 09 dc LDA $dc09 
1fad : c9 05 __ CMP #$05
1faf : 90 11 __ BCC $1fc2 ; (gears_run.l9 + 0)
.s8:
1fb1 : a9 00 __ LDA #$00
1fb3 : 8d 04 d4 STA $d404 
1fb6 : 8d 0b d4 STA $d40b 
1fb9 : 8d 18 d4 STA $d418 
.s3:
1fbc : ad ad bf LDA $bfad ; (gears_run@stack + 0)
1fbf : 85 53 __ STA T0 + 0 
1fc1 : 60 __ __ RTS
.l9:
1fc2 : 2c 11 d0 BIT $d011 
1fc5 : 30 fb __ BMI $1fc2 ; (gears_run.l9 + 0)
.l10:
1fc7 : 2c 11 d0 BIT $d011 
1fca : 10 fb __ BPL $1fc7 ; (gears_run.l10 + 0)
.s11:
1fcc : a9 d0 __ LDA #$d0
1fce : 8d f7 bf STA $bff7 ; (sstack + 13)
1fd1 : a9 00 __ LDA #$00
1fd3 : 8d f8 bf STA $bff8 ; (sstack + 14)
1fd6 : a5 f8 __ LDA $f8 ; (zp_angle2 + 0)
1fd8 : 8d f9 bf STA $bff9 ; (sstack + 15)
1fdb : a9 08 __ LDA #$08
1fdd : 8d fa bf STA $bffa ; (sstack + 16)
1fe0 : 8d fb bf STA $bffb ; (sstack + 17)
1fe3 : 8d fe bf STA $bffe ; (sstack + 20)
1fe6 : a9 1c __ LDA #$1c
1fe8 : 8d fc bf STA $bffc ; (sstack + 18)
1feb : a9 28 __ LDA #$28
1fed : 8d fd bf STA $bffd ; (sstack + 19)
1ff0 : a9 04 __ LDA #$04
1ff2 : 8d ff bf STA $bfff ; (sstack + 21)
1ff5 : 20 0b 30 JSR $300b ; (draw_gear.s1 + 0)
1ff8 : a9 78 __ LDA #$78
1ffa : 8d f7 bf STA $bff7 ; (sstack + 13)
1ffd : a9 00 __ LDA #$00
1fff : 8d f8 bf STA $bff8 ; (sstack + 14)
2002 : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
2004 : 8d f9 bf STA $bff9 ; (sstack + 15)
2007 : a9 10 __ LDA #$10
2009 : 8d fa bf STA $bffa ; (sstack + 16)
200c : a9 04 __ LDA #$04
200e : 8d fb bf STA $bffb ; (sstack + 17)
2011 : a9 2c __ LDA #$2c
2013 : 8d fc bf STA $bffc ; (sstack + 18)
2016 : a9 36 __ LDA #$36
2018 : 8d fd bf STA $bffd ; (sstack + 19)
201b : a9 0a __ LDA #$0a
201d : 8d fe bf STA $bffe ; (sstack + 20)
2020 : a9 06 __ LDA #$06
2022 : 8d ff bf STA $bfff ; (sstack + 21)
2025 : 20 0b 30 JSR $300b ; (draw_gear.s1 + 0)
2028 : 78 __ __ SEI
2029 : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
202b : 18 __ __ CLC
202c : 69 01 __ ADC #$01
202e : 29 3f __ AND #$3f
2030 : 85 f7 __ STA $f7 ; (zp_angle1 + 0)
2032 : a5 f8 __ LDA $f8 ; (zp_angle2 + 0)
2034 : 38 __ __ SEC
2035 : e9 02 __ SBC #$02
2037 : 29 3f __ AND #$3f
2039 : 85 53 __ STA T0 + 0 
203b : 85 f8 __ STA $f8 ; (zp_angle2 + 0)
203d : 58 __ __ CLI
203e : a9 d0 __ LDA #$d0
2040 : 8d f7 bf STA $bff7 ; (sstack + 13)
2043 : a9 00 __ LDA #$00
2045 : 8d f8 bf STA $bff8 ; (sstack + 14)
2048 : a5 53 __ LDA T0 + 0 
204a : 8d f9 bf STA $bff9 ; (sstack + 15)
204d : a9 08 __ LDA #$08
204f : 8d fa bf STA $bffa ; (sstack + 16)
2052 : 8d fb bf STA $bffb ; (sstack + 17)
2055 : 8d fe bf STA $bffe ; (sstack + 20)
2058 : a9 1c __ LDA #$1c
205a : 8d fc bf STA $bffc ; (sstack + 18)
205d : a9 28 __ LDA #$28
205f : 8d fd bf STA $bffd ; (sstack + 19)
2062 : a9 04 __ LDA #$04
2064 : 8d ff bf STA $bfff ; (sstack + 21)
2067 : 20 0b 30 JSR $300b ; (draw_gear.s1 + 0)
206a : a9 78 __ LDA #$78
206c : 8d f7 bf STA $bff7 ; (sstack + 13)
206f : a9 00 __ LDA #$00
2071 : 8d f8 bf STA $bff8 ; (sstack + 14)
2074 : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
2076 : 8d f9 bf STA $bff9 ; (sstack + 15)
2079 : a9 10 __ LDA #$10
207b : 8d fa bf STA $bffa ; (sstack + 16)
207e : a9 04 __ LDA #$04
2080 : 8d fb bf STA $bffb ; (sstack + 17)
2083 : a9 2c __ LDA #$2c
2085 : 8d fc bf STA $bffc ; (sstack + 18)
2088 : a9 36 __ LDA #$36
208a : 8d fd bf STA $bffd ; (sstack + 19)
208d : a9 0a __ LDA #$0a
208f : 8d fe bf STA $bffe ; (sstack + 20)
2092 : a9 06 __ LDA #$06
2094 : 8d ff bf STA $bfff ; (sstack + 21)
2097 : 20 0b 30 JSR $300b ; (draw_gear.s1 + 0)
209a : 4c aa 1f JMP $1faa ; (gears_run.l7 + 0)
--------------------------------------------------------------------
hires_init: ; hires_init()->void
; 246, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s4:
209d : 78 __ __ SEI
209e : a9 00 __ LDA #$00
20a0 : 85 0f __ STA P2 
20a2 : 85 10 __ STA P3 
20a4 : a9 30 __ LDA #$30
20a6 : 85 01 __ STA $01 
20a8 : a9 40 __ LDA #$40
20aa : 85 11 __ STA P4 
20ac : a9 1f __ LDA #$1f
20ae : 85 12 __ STA P5 
20b0 : a9 10 __ LDA #$10
20b2 : a2 fa __ LDX #$fa
.l6:
20b4 : ca __ __ DEX
20b5 : 9d 00 d0 STA $d000,x 
20b8 : 9d fa d0 STA $d0fa,x 
20bb : 9d f4 d1 STA $d1f4,x 
20be : 9d ee d2 STA $d2ee,x 
20c1 : d0 f1 __ BNE $20b4 ; (hires_init.l6 + 0)
.s5:
20c3 : a9 00 __ LDA #$00
20c5 : 85 43 __ STA T1 + 0 
20c7 : 85 0d __ STA P0 
20c9 : a9 e0 __ LDA #$e0
20cb : 85 44 __ STA T1 + 1 
20cd : 85 0e __ STA P1 
20cf : 20 0f 21 JSR $210f ; (memset.s4 + 0)
20d2 : a9 35 __ LDA #$35
20d4 : 85 01 __ STA $01 
20d6 : 20 2b 21 JSR $212b ; (mmap_trampoline.s4 + 0)
20d9 : 58 __ __ CLI
20da : 20 8a 79 JSR $798a ; (vic_setmode@proxy + 0)
20dd : a5 10 __ LDA P3 
20df : 8d da 80 STA $80da ; (Screen.data + 0)
20e2 : a5 11 __ LDA P4 
20e4 : 8d db 80 STA $80db ; (Screen.data + 1)
20e7 : a9 28 __ LDA #$28
20e9 : 8d de 80 STA $80de ; (Screen.cwidth + 0)
20ec : a9 19 __ LDA #$19
20ee : 8d df 80 STA $80df ; (Screen.cheight + 0)
20f1 : a9 40 __ LDA #$40
20f3 : 8d e0 80 STA $80e0 ; (Screen.width + 0)
20f6 : a9 01 __ LDA #$01
20f8 : 8d e1 80 STA $80e1 ; (Screen.width + 1)
20fb : a9 00 __ LDA #$00
20fd : 8d 20 d0 STA $d020 
2100 : 8d dc 80 STA $80dc ; (Screen.rdata + 0)
2103 : 8d dd 80 STA $80dd ; (Screen.rdata + 1)
.s3:
2106 : 60 __ __ RTS
--------------------------------------------------------------------
memset@proxy: ; memset@proxy
2107 : a9 60 __ LDA #$60
2109 : 85 0d __ STA P0 
210b : a9 f8 __ LDA #$f8
210d : 85 0e __ STA P1 
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void
;  28, "/home/xahmol/oscar64/include/string.h"
.s4:
210f : a5 0f __ LDA P2 
2111 : a6 12 __ LDX P5 
2113 : f0 0c __ BEQ $2121 ; (memset.s4 + 18)
2115 : a0 00 __ LDY #$00
2117 : 91 0d __ STA (P0),y 
2119 : c8 __ __ INY
211a : d0 fb __ BNE $2117 ; (memset.s4 + 8)
211c : e6 0e __ INC P1 
211e : ca __ __ DEX
211f : d0 f6 __ BNE $2117 ; (memset.s4 + 8)
2121 : a4 11 __ LDY P4 
2123 : f0 05 __ BEQ $212a ; (memset.s3 + 0)
2125 : 88 __ __ DEY
2126 : 91 0d __ STA (P0),y 
2128 : d0 fb __ BNE $2125 ; (memset.s4 + 22)
.s3:
212a : 60 __ __ RTS
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/xahmol/oscar64/include/c64/memmap.h"
.s4:
212b : a9 40 __ LDA #$40
212d : 8d fa ff STA $fffa 
2130 : a9 21 __ LDA #$21
2132 : 8d fb ff STA $fffb 
2135 : a9 5e __ LDA #$5e
2137 : 8d fe ff STA $fffe 
213a : a9 21 __ LDA #$21
213c : 8d ff ff STA $ffff 
.s3:
213f : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
2140 : 48 __ __ PHA
2141 : 8a __ __ TXA
2142 : 48 __ __ PHA
2143 : a9 21 __ LDA #$21
2145 : 48 __ __ PHA
2146 : a9 57 __ LDA #$57
2148 : 48 __ __ PHA
2149 : ba __ __ TSX
214a : bd 05 01 LDA $0105,x 
214d : 48 __ __ PHA
214e : a6 01 __ LDX $01 
2150 : a9 36 __ LDA #$36
2152 : 85 01 __ STA $01 
2154 : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
2157 : 86 01 __ STX $01 
2159 : 68 __ __ PLA
215a : aa __ __ TAX
215b : 68 __ __ PLA
215c : 40 __ __ RTI
215d : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
215e : 48 __ __ PHA
215f : 8a __ __ TXA
2160 : 48 __ __ PHA
2161 : a9 21 __ LDA #$21
2163 : 48 __ __ PHA
2164 : a9 57 __ LDA #$57
2166 : 48 __ __ PHA
2167 : ba __ __ TSX
2168 : bd 05 01 LDA $0105,x 
216b : 48 __ __ PHA
216c : a6 01 __ LDX $01 
216e : a9 36 __ LDA #$36
2170 : 85 01 __ STA $01 
2172 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
engine_init: ; engine_init()->void
; 337, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s4:
2175 : a9 00 __ LDA #$00
2177 : 8d 15 d4 STA $d415 
217a : a9 18 __ LDA #$18
217c : 8d 16 d4 STA $d416 
217f : a9 83 __ LDA #$83
2181 : 8d 17 d4 STA $d417 
2184 : a9 1f __ LDA #$1f
2186 : 8d 18 d4 STA $d418 
2189 : a9 05 __ LDA #$05
218b : 8d 05 d4 STA $d405 
218e : a9 f3 __ LDA #$f3
2190 : 8d 06 d4 STA $d406 
2193 : a9 a9 __ LDA #$a9
2195 : 8d 00 d4 STA $d400 
2198 : a9 02 __ LDA #$02
219a : 8d 01 d4 STA $d401 
219d : a9 21 __ LDA #$21
219f : 8d 04 d4 STA $d404 
21a2 : a9 05 __ LDA #$05
21a4 : 8d 0c d4 STA $d40c 
21a7 : a9 f3 __ LDA #$f3
21a9 : 8d 0d d4 STA $d40d 
21ac : a9 52 __ LDA #$52
21ae : 8d 07 d4 STA $d407 
21b1 : a9 05 __ LDA #$05
21b3 : 8d 08 d4 STA $d408 
21b6 : a9 81 __ LDA #$81
21b8 : 8d 0b d4 STA $d40b 
.s3:
21bb : 60 __ __ RTS
--------------------------------------------------------------------
tod_reset: ; tod_reset()->void
; 277, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s4:
21bc : 78 __ __ SEI
21bd : a9 00 __ LDA #$00
21bf : 8d 09 dc STA $dc09 
21c2 : 8d 08 dc STA $dc08 
21c5 : 58 __ __ CLI
.s3:
21c6 : 60 __ __ RTS
--------------------------------------------------------------------
draw_speed: ; draw_speed(u8)->void
; 194, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s1:
21c7 : a2 05 __ LDX #$05
21c9 : b5 53 __ LDA T1 + 0,x 
21cb : 9d c3 bf STA $bfc3,x ; (draw_speed@stack + 0)
21ce : ca __ __ DEX
21cf : 10 f8 __ BPL $21c9 ; (draw_speed.s1 + 2)
.s4:
21d1 : ad f3 bf LDA $bff3 ; (sstack + 9)
21d4 : 0a __ __ ASL
21d5 : aa __ __ TAX
21d6 : bd 31 7a LDA $7a31,x ; (speed_nums[0] + 0)
21d9 : 85 53 __ STA T1 + 0 
21db : 85 0d __ STA P0 
21dd : bd 32 7a LDA $7a32,x ; (speed_nums[0] + 1)
21e0 : 85 54 __ STA T1 + 1 
21e2 : 85 0e __ STA P1 
21e4 : 20 45 10 JSR $1045 ; (strlen.s4 + 0)
21e7 : a5 1b __ LDA ACCU + 0 
21e9 : 0a __ __ ASL
21ea : a2 00 __ LDX #$00
21ec : 90 02 __ BCC $21f0 ; (draw_speed.s9 + 0)
.s8:
21ee : e8 __ __ INX
21ef : 18 __ __ CLC
.s9:
21f0 : 65 1b __ ADC ACCU + 0 
21f2 : 85 43 __ STA T0 + 0 
21f4 : 8a __ __ TXA
21f5 : 69 00 __ ADC #$00
21f7 : 06 43 __ ASL T0 + 0 
21f9 : 2a __ __ ROL
21fa : 06 43 __ ASL T0 + 0 
21fc : 2a __ __ ROL
21fd : aa __ __ TAX
21fe : 18 __ __ CLC
21ff : a5 43 __ LDA T0 + 0 
2201 : 69 28 __ ADC #$28
2203 : 85 43 __ STA T0 + 0 
2205 : 90 01 __ BCC $2208 ; (draw_speed.s11 + 0)
.s10:
2207 : e8 __ __ INX
.s11:
2208 : 86 44 __ STX T0 + 1 
220a : 38 __ __ SEC
220b : a9 40 __ LDA #$40
220d : e5 43 __ SBC T0 + 0 
220f : a8 __ __ TAY
2210 : a9 01 __ LDA #$01
2212 : e5 44 __ SBC T0 + 1 
2214 : aa __ __ TAX
2215 : 0a __ __ ASL
2216 : 98 __ __ TYA
2217 : 69 00 __ ADC #$00
2219 : 85 56 __ STA T3 + 0 
221b : 8a __ __ TXA
221c : 69 00 __ ADC #$00
221e : c9 80 __ CMP #$80
2220 : 6a __ __ ROR
2221 : 66 56 __ ROR T3 + 0 
2223 : 85 57 __ STA T3 + 1 
2225 : a5 1b __ LDA ACCU + 0 
2227 : f0 30 __ BEQ $2259 ; (draw_speed.s5 + 0)
.s6:
2229 : 85 55 __ STA T2 + 0 
222b : a9 00 __ LDA #$00
222d : 85 58 __ STA T4 + 0 
.l7:
222f : a5 56 __ LDA T3 + 0 
2231 : 8d f0 bf STA $bff0 ; (sstack + 6)
2234 : a5 57 __ LDA T3 + 1 
2236 : 8d f1 bf STA $bff1 ; (sstack + 7)
2239 : a4 58 __ LDY T4 + 0 
223b : b1 53 __ LDA (T1 + 0),y 
223d : 38 __ __ SEC
223e : e9 30 __ SBC #$30
2240 : 8d f2 bf STA $bff2 ; (sstack + 8)
2243 : 20 db 22 JSR $22db ; (draw_glyph.s1 + 0)
2246 : 18 __ __ CLC
2247 : a5 56 __ LDA T3 + 0 
2249 : 69 0c __ ADC #$0c
224b : 85 56 __ STA T3 + 0 
224d : 90 02 __ BCC $2251 ; (draw_speed.s13 + 0)
.s12:
224f : e6 57 __ INC T3 + 1 
.s13:
2251 : e6 58 __ INC T4 + 0 
2253 : a5 58 __ LDA T4 + 0 
2255 : c5 55 __ CMP T2 + 0 
2257 : 90 d6 __ BCC $222f ; (draw_speed.l7 + 0)
.s5:
2259 : a9 0a __ LDA #$0a
225b : 8d f2 bf STA $bff2 ; (sstack + 8)
225e : 18 __ __ CLC
225f : a5 56 __ LDA T3 + 0 
2261 : 69 06 __ ADC #$06
2263 : 85 56 __ STA T3 + 0 
2265 : 8d f0 bf STA $bff0 ; (sstack + 6)
2268 : a5 57 __ LDA T3 + 1 
226a : 69 00 __ ADC #$00
226c : 85 57 __ STA T3 + 1 
226e : 8d f1 bf STA $bff1 ; (sstack + 7)
2271 : 20 db 22 JSR $22db ; (draw_glyph.s1 + 0)
2274 : a9 0b __ LDA #$0b
2276 : 8d f2 bf STA $bff2 ; (sstack + 8)
2279 : 18 __ __ CLC
227a : a5 56 __ LDA T3 + 0 
227c : 69 0c __ ADC #$0c
227e : 85 56 __ STA T3 + 0 
2280 : 8d f0 bf STA $bff0 ; (sstack + 6)
2283 : a5 57 __ LDA T3 + 1 
2285 : 69 00 __ ADC #$00
2287 : 85 57 __ STA T3 + 1 
2289 : 8d f1 bf STA $bff1 ; (sstack + 7)
228c : 20 db 22 JSR $22db ; (draw_glyph.s1 + 0)
228f : a9 0c __ LDA #$0c
2291 : 8d f2 bf STA $bff2 ; (sstack + 8)
2294 : 18 __ __ CLC
2295 : a5 56 __ LDA T3 + 0 
2297 : 69 0c __ ADC #$0c
2299 : 8d f0 bf STA $bff0 ; (sstack + 6)
229c : a5 57 __ LDA T3 + 1 
229e : 69 00 __ ADC #$00
22a0 : 8d f1 bf STA $bff1 ; (sstack + 7)
22a3 : 20 db 22 JSR $22db ; (draw_glyph.s1 + 0)
.s3:
22a6 : a2 05 __ LDX #$05
22a8 : bd c3 bf LDA $bfc3,x ; (draw_speed@stack + 0)
22ab : 95 53 __ STA T1 + 0,x 
22ad : ca __ __ DEX
22ae : 10 f8 __ BPL $22a8 ; (draw_speed.s3 + 2)
22b0 : 60 __ __ RTS
--------------------------------------------------------------------
22b1 : __ __ __ BYT 31 00                                           : 1.
--------------------------------------------------------------------
22b3 : __ __ __ BYT 32 00                                           : 2.
--------------------------------------------------------------------
22b5 : __ __ __ BYT 33 00                                           : 3.
--------------------------------------------------------------------
22b7 : __ __ __ BYT 34 00                                           : 4.
--------------------------------------------------------------------
22b9 : __ __ __ BYT 36 00                                           : 6.
--------------------------------------------------------------------
22bb : __ __ __ BYT 38 00                                           : 8.
--------------------------------------------------------------------
22bd : __ __ __ BYT 31 32 00                                        : 12.
--------------------------------------------------------------------
22c0 : __ __ __ BYT 31 36 00                                        : 16.
--------------------------------------------------------------------
22c3 : __ __ __ BYT 32 30 00                                        : 20.
--------------------------------------------------------------------
22c6 : __ __ __ BYT 32 34 00                                        : 24.
--------------------------------------------------------------------
22c9 : __ __ __ BYT 32 38 00                                        : 28.
--------------------------------------------------------------------
22cc : __ __ __ BYT 33 32 00                                        : 32.
--------------------------------------------------------------------
22cf : __ __ __ BYT 33 36 00                                        : 36.
--------------------------------------------------------------------
22d2 : __ __ __ BYT 34 30 00                                        : 40.
--------------------------------------------------------------------
22d5 : __ __ __ BYT 34 38 00                                        : 48.
--------------------------------------------------------------------
22d8 : __ __ __ BYT 36 34 00                                        : 64.
--------------------------------------------------------------------
draw_glyph: ; draw_glyph(i16,i16,u8)->void
; 176, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s1:
22db : a2 04 __ LDX #$04
22dd : b5 53 __ LDA T2 + 0,x 
22df : 9d ca bf STA $bfca,x ; (draw_glyph@stack + 0)
22e2 : ca __ __ DEX
22e3 : 10 f8 __ BPL $22dd ; (draw_glyph.s1 + 2)
.s4:
22e5 : ae f2 bf LDX $bff2 ; (sstack + 8)
22e8 : bd a8 78 LDA $78a8,x ; (__multab7L + 0)
22eb : 18 __ __ CLC
22ec : 69 51 __ ADC #$51
22ee : 85 53 __ STA T2 + 0 
22f0 : a9 7a __ LDA #$7a
22f2 : 69 00 __ ADC #$00
22f4 : 85 54 __ STA T2 + 1 
22f6 : a9 80 __ LDA #$80
22f8 : 85 15 __ STA P8 
22fa : a9 da __ LDA #$da
22fc : 85 14 __ STA P7 
22fe : a9 44 __ LDA #$44
2300 : 85 18 __ STA P11 
2302 : a9 00 __ LDA #$00
2304 : 85 13 __ STA P6 
2306 : 85 57 __ STA T6 + 0 
2308 : 18 __ __ CLC
.l5:
2309 : 69 57 __ ADC #$57
230b : 0a __ __ ASL
230c : 85 55 __ STA T4 + 0 
230e : a2 00 __ LDX #$00
2310 : 86 56 __ STX T5 + 0 
.l6:
2312 : bd e8 85 LDA $85e8,x ; (bitshift[0] + 32)
2315 : a4 57 __ LDY T6 + 0 
2317 : 31 53 __ AND (T2 + 0),y 
2319 : f0 30 __ BEQ $234b ; (draw_glyph.s7 + 0)
.s9:
231b : a5 55 __ LDA T4 + 0 
231d : 85 12 __ STA P5 
231f : 8d ea bf STA $bfea ; (sstack + 0)
2322 : a9 00 __ LDA #$00
2324 : 8d eb bf STA $bfeb ; (sstack + 1)
2327 : 8d ed bf STA $bfed ; (sstack + 3)
232a : 8d ef bf STA $bfef ; (sstack + 5)
232d : a9 02 __ LDA #$02
232f : 8d ec bf STA $bfec ; (sstack + 2)
2332 : 8d ee bf STA $bfee ; (sstack + 4)
2335 : 8a __ __ TXA
2336 : 0a __ __ ASL
2337 : 18 __ __ CLC
2338 : 6d f0 bf ADC $bff0 ; (sstack + 6)
233b : 85 10 __ STA P3 
233d : 85 16 __ STA P9 
233f : ad f1 bf LDA $bff1 ; (sstack + 7)
2342 : 69 00 __ ADC #$00
2344 : 85 11 __ STA P4 
2346 : 85 17 __ STA P10 
2348 : 20 66 23 JSR $2366 ; (bmu_bitblit.s1 + 0)
.s7:
234b : e6 56 __ INC T5 + 0 
234d : a6 56 __ LDX T5 + 0 
234f : e0 05 __ CPX #$05
2351 : d0 bf __ BNE $2312 ; (draw_glyph.l6 + 0)
.s8:
2353 : e6 57 __ INC T6 + 0 
2355 : a5 57 __ LDA T6 + 0 
2357 : c9 07 __ CMP #$07
2359 : 90 ae __ BCC $2309 ; (draw_glyph.l5 + 0)
.s3:
235b : a2 04 __ LDX #$04
235d : bd ca bf LDA $bfca,x ; (draw_glyph@stack + 0)
2360 : 95 53 __ STA T2 + 0,x 
2362 : ca __ __ DEX
2363 : 10 f8 __ BPL $235d ; (draw_glyph.s3 + 2)
2365 : 60 __ __ RTS
--------------------------------------------------------------------
bmu_bitblit: ; bmu_bitblit(const struct Bitmap*,i16,i16,const struct Bitmap*,i16,i16,i16,i16,const u8*,enum BlitOp)->void
; 119, "/home/xahmol/oscar64/include/gfx/bitmap.h"
.s1:
2366 : a2 0c __ LDX #$0c
2368 : b5 53 __ LDA T11 + 0,x 
236a : 9d d3 bf STA $bfd3,x ; (bmu_bitblit@stack + 0)
236d : ca __ __ DEX
236e : 10 f8 __ BPL $2368 ; (bmu_bitblit.s1 + 2)
.s4:
2370 : a5 10 __ LDA P3 ; (dx + 0)
2372 : 85 47 __ STA T2 + 0 
2374 : 18 __ __ CLC
2375 : 6d ec bf ADC $bfec ; (sstack + 2)
2378 : 85 45 __ STA T1 + 0 
237a : 29 07 __ AND #$07
237c : aa __ __ TAX
237d : bd b4 7a LDA $7ab4,x ; (rmask[0] + 0)
2380 : 85 56 __ STA T14 + 0 
2382 : ad ed bf LDA $bfed ; (sstack + 3)
2385 : 65 11 __ ADC P4 ; (dx + 1)
2387 : 4a __ __ LSR
2388 : 66 45 __ ROR T1 + 0 
238a : 4a __ __ LSR
238b : 66 45 __ ROR T1 + 0 
238d : 4a __ __ LSR
238e : 66 45 __ ROR T1 + 0 
2390 : a5 11 __ LDA P4 ; (dx + 1)
2392 : 4a __ __ LSR
2393 : 66 47 __ ROR T2 + 0 
2395 : 4a __ __ LSR
2396 : 66 47 __ ROR T2 + 0 
2398 : 4a __ __ LSR
2399 : 66 47 __ ROR T2 + 0 
239b : 38 __ __ SEC
239c : a5 45 __ LDA T1 + 0 
239e : e5 47 __ SBC T2 + 0 
23a0 : 85 4d __ STA T6 + 0 
23a2 : a5 10 __ LDA P3 ; (dx + 0)
23a4 : 29 07 __ AND #$07
23a6 : 85 45 __ STA T1 + 0 
23a8 : aa __ __ TAX
23a9 : bd ac 7a LDA $7aac,x ; (lmask[0] + 0)
23ac : 85 52 __ STA T12 + 0 
23ae : 85 55 __ STA T13 + 0 
23b0 : ad ee bf LDA $bfee ; (sstack + 4)
23b3 : 85 4e __ STA T8 + 0 
23b5 : a5 14 __ LDA P7 ; (sbm + 0)
23b7 : 85 4f __ STA T9 + 0 
23b9 : a6 15 __ LDX P8 ; (sbm + 1)
23bb : 86 50 __ STX T9 + 1 
23bd : c9 da __ CMP #$da
23bf : d0 4d __ BNE $240e ; (bmu_bitblit.s111 + 0)
.s88:
23c1 : e0 80 __ CPX #$80
23c3 : d0 49 __ BNE $240e ; (bmu_bitblit.s111 + 0)
.s72:
23c5 : a9 da __ LDA #$da
23c7 : 85 4f __ STA T9 + 0 
23c9 : a9 80 __ LDA #$80
23cb : 85 50 __ STA T9 + 1 
23cd : ad eb bf LDA $bfeb ; (sstack + 1)
23d0 : c5 13 __ CMP P6 ; (dy + 1)
23d2 : d0 09 __ BNE $23dd ; (bmu_bitblit.s87 + 0)
.s84:
23d4 : ad ea bf LDA $bfea ; (sstack + 0)
23d7 : c5 12 __ CMP P5 ; (dy + 0)
.s85:
23d9 : b0 08 __ BCS $23e3 ; (bmu_bitblit.s73 + 0)
23db : 90 28 __ BCC $2405 ; (bmu_bitblit.s75 + 0)
.s87:
23dd : 45 13 __ EOR P6 ; (dy + 1)
23df : 10 f8 __ BPL $23d9 ; (bmu_bitblit.s85 + 0)
.s86:
23e1 : b0 22 __ BCS $2405 ; (bmu_bitblit.s75 + 0)
.s73:
23e3 : a5 13 __ LDA P6 ; (dy + 1)
23e5 : cd eb bf CMP $bfeb ; (sstack + 1)
23e8 : d0 24 __ BNE $240e ; (bmu_bitblit.s111 + 0)
.s83:
23ea : a5 12 __ LDA P5 ; (dy + 0)
23ec : cd ea bf CMP $bfea ; (sstack + 0)
23ef : d0 1f __ BNE $2410 ; (bmu_bitblit.s5 + 0)
.s74:
23f1 : a5 17 __ LDA P10 ; (sx + 1)
23f3 : c5 11 __ CMP P4 ; (dx + 1)
23f5 : d0 08 __ BNE $23ff ; (bmu_bitblit.s82 + 0)
.s79:
23f7 : a5 16 __ LDA P9 ; (sx + 0)
23f9 : c5 10 __ CMP P3 ; (dx + 0)
.s80:
23fb : 90 08 __ BCC $2405 ; (bmu_bitblit.s75 + 0)
23fd : b0 0f __ BCS $240e ; (bmu_bitblit.s111 + 0)
.s82:
23ff : 45 11 __ EOR P4 ; (dx + 1)
2401 : 10 f8 __ BPL $23fb ; (bmu_bitblit.s80 + 0)
.s81:
2403 : 90 09 __ BCC $240e ; (bmu_bitblit.s111 + 0)
.s75:
2405 : a5 18 __ LDA P11 ; (op + 0)
2407 : 29 08 __ AND #$08
2409 : f0 03 __ BEQ $240e ; (bmu_bitblit.s111 + 0)
240b : 4c f4 28 JMP $28f4 ; (bmu_bitblit.s76 + 0)
.s111:
240e : a5 12 __ LDA P5 ; (dy + 0)
.s5:
2410 : 29 f8 __ AND #$f8
2412 : 85 1b __ STA ACCU + 0 ; (w + 0)
2414 : a5 13 __ LDA P6 ; (dy + 1)
2416 : 85 1c __ STA ACCU + 1 ; (w + 1)
2418 : ad de 80 LDA $80de ; (Screen.cwidth + 0)
241b : 85 51 __ STA T10 + 0 
241d : 20 7e 74 JSR $747e ; (mul16by8 + 0)
2420 : ad da 80 LDA $80da ; (Screen.data + 0)
2423 : 18 __ __ CLC
2424 : 65 1b __ ADC ACCU + 0 ; (w + 0)
2426 : 85 4a __ STA T4 + 0 
2428 : ad db 80 LDA $80db ; (Screen.data + 1)
242b : 65 1c __ ADC ACCU + 1 ; (w + 1)
242d : aa __ __ TAX
242e : a5 10 __ LDA P3 ; (dx + 0)
2430 : 29 f8 __ AND #$f8
2432 : 18 __ __ CLC
2433 : 65 4a __ ADC T4 + 0 
2435 : 85 4a __ STA T4 + 0 
2437 : 8a __ __ TXA
2438 : 65 11 __ ADC P4 ; (dx + 1)
243a : aa __ __ TAX
243b : a5 12 __ LDA P5 ; (dy + 0)
243d : 29 07 __ AND #$07
243f : 18 __ __ CLC
2440 : 65 4a __ ADC T4 + 0 
2442 : 85 53 __ STA T11 + 0 
2444 : 90 01 __ BCC $2447 ; (bmu_bitblit.s94 + 0)
.s93:
2446 : e8 __ __ INX
.s94:
2447 : 86 54 __ STX T11 + 1 
2449 : ad eb bf LDA $bfeb ; (sstack + 1)
244c : 85 1c __ STA ACCU + 1 ; (w + 1)
244e : ad ea bf LDA $bfea ; (sstack + 0)
2451 : 29 f8 __ AND #$f8
2453 : 85 1b __ STA ACCU + 0 ; (w + 0)
2455 : a0 04 __ LDY #$04
2457 : b1 4f __ LDA (T9 + 0),y 
2459 : 20 7e 74 JSR $747e ; (mul16by8 + 0)
245c : a0 00 __ LDY #$00
245e : 84 57 __ STY T16 + 0 
2460 : b1 4f __ LDA (T9 + 0),y 
2462 : 18 __ __ CLC
2463 : 65 1b __ ADC ACCU + 0 ; (w + 0)
2465 : 85 49 __ STA T3 + 0 
2467 : c8 __ __ INY
2468 : b1 4f __ LDA (T9 + 0),y 
246a : 65 1c __ ADC ACCU + 1 ; (w + 1)
246c : aa __ __ TAX
246d : a5 16 __ LDA P9 ; (sx + 0)
246f : 29 f8 __ AND #$f8
2471 : 18 __ __ CLC
2472 : 65 49 __ ADC T3 + 0 
2474 : 85 49 __ STA T3 + 0 
2476 : 8a __ __ TXA
2477 : 65 17 __ ADC P10 ; (sx + 1)
2479 : aa __ __ TAX
247a : ad ea bf LDA $bfea ; (sstack + 0)
247d : 29 07 __ AND #$07
247f : 18 __ __ CLC
2480 : 65 49 __ ADC T3 + 0 
2482 : 85 4a __ STA T4 + 0 
2484 : 90 01 __ BCC $2487 ; (bmu_bitblit.s96 + 0)
.s95:
2486 : e8 __ __ INX
.s96:
2487 : 86 4b __ STX T4 + 1 
2489 : a5 16 __ LDA P9 ; (sx + 0)
248b : 29 07 __ AND #$07
248d : 49 ff __ EOR #$ff
248f : 38 __ __ SEC
2490 : 65 45 __ ADC T1 + 0 
2492 : 85 43 __ STA T0 + 0 
2494 : f0 0d __ BEQ $24a3 ; (bmu_bitblit.s6 + 0)
.s70:
2496 : 30 0b __ BMI $24a3 ; (bmu_bitblit.s6 + 0)
.s71:
2498 : 18 __ __ CLC
2499 : a5 4a __ LDA T4 + 0 
249b : 69 f8 __ ADC #$f8
249d : 85 4a __ STA T4 + 0 
249f : b0 02 __ BCS $24a3 ; (bmu_bitblit.s6 + 0)
.s105:
24a1 : c6 4b __ DEC T4 + 1 
.s6:
24a3 : a9 18 __ LDA #$18
24a5 : 85 58 __ STA T17 + 0 
24a7 : a9 61 __ LDA #$61
24a9 : 85 59 __ STA T18 + 0 
24ab : a9 90 __ LDA #$90
24ad : 85 5a __ STA T19 + 0 
24af : a9 e2 __ LDA #$e2
24b1 : 85 5b __ STA T20 + 0 
24b3 : a9 00 __ LDA #$00
24b5 : 85 5c __ STA T21 + 0 
24b7 : a9 08 __ LDA #$08
.s7:
24b9 : 85 5d __ STA T22 + 0 
24bb : a5 18 __ LDA P11 ; (op + 0)
24bd : 29 08 __ AND #$08
24bf : 85 4c __ STA T5 + 0 
24c1 : a5 18 __ LDA P11 ; (op + 0)
24c3 : 29 10 __ AND #$10
24c5 : 85 52 __ STA T12 + 0 
24c7 : a5 55 __ LDA T13 + 0 
24c9 : 85 45 __ STA T1 + 0 
24cb : a5 43 __ LDA T0 + 0 
24cd : 29 07 __ AND #$07
24cf : 85 5f __ STA T24 + 0 
24d1 : a5 4d __ LDA T6 + 0 
24d3 : 85 5e __ STA T23 + 0 
24d5 : d0 06 __ BNE $24dd ; (bmu_bitblit.s9 + 0)
.s8:
24d7 : a5 56 __ LDA T14 + 0 
24d9 : 25 55 __ AND T13 + 0 
24db : 85 45 __ STA T1 + 0 
.s9:
24dd : a9 a0 __ LDA #$a0
24df : 8d 00 9c STA $9c00 ; (BLIT_CODE[0] + 0)
24e2 : a5 5c __ LDA T21 + 0 
24e4 : 8d 01 9c STA $9c01 ; (BLIT_CODE[0] + 1)
24e7 : a9 02 __ LDA #$02
24e9 : 85 43 __ STA T0 + 0 
24eb : a6 45 __ LDX T1 + 0 
24ed : e8 __ __ INX
24ee : d0 03 __ BNE $24f3 ; (bmu_bitblit.s10 + 0)
24f0 : 4c 8e 28 JMP $288e ; (bmu_bitblit.s66 + 0)
.s10:
24f3 : a5 52 __ LDA T12 + 0 
24f5 : f0 18 __ BEQ $250f ; (bmu_bitblit.s11 + 0)
.s65:
24f7 : a9 b1 __ LDA #$b1
24f9 : 8d 02 9c STA $9c02 ; (BLIT_CODE[0] + 2)
24fc : a9 05 __ LDA #$05
24fe : 8d 03 9c STA $9c03 ; (BLIT_CODE[0] + 3)
2501 : a9 85 __ LDA #$85
2503 : 8d 04 9c STA $9c04 ; (BLIT_CODE[0] + 4)
2506 : a9 0a __ LDA #$0a
2508 : 8d 05 9c STA $9c05 ; (BLIT_CODE[0] + 5)
250b : a9 06 __ LDA #$06
250d : 85 43 __ STA T0 + 0 
.s11:
250f : a5 4c __ LDA T5 + 0 
2511 : d0 05 __ BNE $2518 ; (bmu_bitblit.s62 + 0)
.s12:
2513 : a5 43 __ LDA T0 + 0 
2515 : 4c 73 25 JMP $2573 ; (bmu_bitblit.s92 + 0)
.s62:
2518 : a5 5f __ LDA T24 + 0 
251a : d0 05 __ BNE $2521 ; (bmu_bitblit.s64 + 0)
.s63:
251c : a5 43 __ LDA T0 + 0 
251e : 4c 6e 25 JMP $256e ; (bmu_bitblit.s91 + 0)
.s64:
2521 : a9 b1 __ LDA #$b1
2523 : a6 43 __ LDX T0 + 0 
2525 : 9d 00 9c STA $9c00,x ; (BLIT_CODE[0] + 0)
2528 : a9 03 __ LDA #$03
252a : 9d 01 9c STA $9c01,x ; (BLIT_CODE[0] + 1)
252d : 9d 06 9c STA $9c06,x ; (BLIT_CODE[0] + 6)
2530 : 9d 0a 9c STA $9c0a,x ; (BLIT_CODE[0] + 10)
2533 : a9 85 __ LDA #$85
2535 : 9d 02 9c STA $9c02,x ; (BLIT_CODE[0] + 2)
2538 : 9d 09 9c STA $9c09,x ; (BLIT_CODE[0] + 9)
253b : a9 08 __ LDA #$08
253d : 9d 03 9c STA $9c03,x ; (BLIT_CODE[0] + 3)
2540 : 9d 08 9c STA $9c08,x ; (BLIT_CODE[0] + 8)
2543 : a9 a5 __ LDA #$a5
2545 : 9d 05 9c STA $9c05,x ; (BLIT_CODE[0] + 5)
2548 : a9 02 __ LDA #$02
254a : 9d 0c 9c STA $9c0c,x ; (BLIT_CODE[0] + 12)
254d : a9 04 __ LDA #$04
254f : 9d 0e 9c STA $9c0e,x ; (BLIT_CODE[0] + 14)
2552 : a5 58 __ LDA T17 + 0 
2554 : 9d 04 9c STA $9c04,x ; (BLIT_CODE[0] + 4)
2557 : a5 59 __ LDA T18 + 0 
2559 : 09 08 __ ORA #$08
255b : 9d 07 9c STA $9c07,x ; (BLIT_CODE[0] + 7)
255e : a5 5a __ LDA T19 + 0 
2560 : 9d 0b 9c STA $9c0b,x ; (BLIT_CODE[0] + 11)
2563 : a5 5b __ LDA T20 + 0 
2565 : 09 04 __ ORA #$04
2567 : 9d 0d 9c STA $9c0d,x ; (BLIT_CODE[0] + 13)
256a : 8a __ __ TXA
256b : 18 __ __ CLC
256c : 69 0f __ ADC #$0f
.s91:
256e : 85 0d __ STA P0 
2570 : 20 d8 29 JSR $29d8 ; (builddop_src@proxy + 0)
.s92:
2573 : 85 0d __ STA P0 
2575 : a5 18 __ LDA P11 ; (op + 0)
2577 : 85 0e __ STA P1 
2579 : a5 45 __ LDA T1 + 0 
257b : 49 ff __ EOR #$ff
257d : 85 0f __ STA P2 
257f : 20 1b 2b JSR $2b1b ; (builddop_op.s4 + 0)
2582 : 85 43 __ STA T0 + 0 
2584 : a5 4d __ LDA T6 + 0 
2586 : f0 63 __ BEQ $25eb ; (bmu_bitblit.s13 + 0)
.s34:
2588 : a9 a0 __ LDA #$a0
258a : a6 43 __ LDX T0 + 0 
258c : e8 __ __ INX
258d : e8 __ __ INX
258e : 86 43 __ STX T0 + 0 
2590 : 86 0d __ STX P0 
2592 : 9d fe 9b STA $9bfe,x 
2595 : 18 __ __ CLC
2596 : a5 5d __ LDA T22 + 0 
2598 : 65 5c __ ADC T21 + 0 
259a : 9d ff 9b STA $9bff,x 
259d : 85 5c __ STA T21 + 0 
259f : a5 4d __ LDA T6 + 0 
.s35:
25a1 : c9 02 __ CMP #$02
25a3 : 90 03 __ BCC $25a8 ; (bmu_bitblit.s36 + 0)
25a5 : 4c 71 27 JMP $2771 ; (bmu_bitblit.s42 + 0)
.s36:
25a8 : a5 56 __ LDA T14 + 0 
25aa : f0 3f __ BEQ $25eb ; (bmu_bitblit.s13 + 0)
.s37:
25ac : a5 52 __ LDA T12 + 0 
25ae : f0 1e __ BEQ $25ce ; (bmu_bitblit.s38 + 0)
.s41:
25b0 : a9 b1 __ LDA #$b1
25b2 : a6 43 __ LDX T0 + 0 
25b4 : 9d 00 9c STA $9c00,x ; (BLIT_CODE[0] + 0)
25b7 : a9 05 __ LDA #$05
25b9 : 9d 01 9c STA $9c01,x ; (BLIT_CODE[0] + 1)
25bc : a9 85 __ LDA #$85
25be : 9d 02 9c STA $9c02,x ; (BLIT_CODE[0] + 2)
25c1 : a9 0a __ LDA #$0a
25c3 : 9d 03 9c STA $9c03,x ; (BLIT_CODE[0] + 3)
25c6 : 8a __ __ TXA
25c7 : 18 __ __ CLC
25c8 : 69 04 __ ADC #$04
25ca : 85 43 __ STA T0 + 0 
25cc : 85 0d __ STA P0 
.s38:
25ce : a5 4c __ LDA T5 + 0 
25d0 : d0 05 __ BNE $25d7 ; (bmu_bitblit.s40 + 0)
.s39:
25d2 : a5 43 __ LDA T0 + 0 
25d4 : 4c da 25 JMP $25da ; (bmu_bitblit.s90 + 0)
.s40:
25d7 : 20 d8 29 JSR $29d8 ; (builddop_src@proxy + 0)
.s90:
25da : 85 0d __ STA P0 
25dc : a5 18 __ LDA P11 ; (op + 0)
25de : 85 0e __ STA P1 
25e0 : a5 56 __ LDA T14 + 0 
25e2 : 49 ff __ EOR #$ff
25e4 : 85 0f __ STA P2 
25e6 : 20 1b 2b JSR $2b1b ; (builddop_op.s4 + 0)
25e9 : 85 43 __ STA T0 + 0 
.s13:
25eb : a9 60 __ LDA #$60
25ed : a6 43 __ LDX T0 + 0 
25ef : 9d 00 9c STA $9c00,x ; (BLIT_CODE[0] + 0)
25f2 : 18 __ __ CLC
25f3 : a5 51 __ LDA T10 + 0 
25f5 : 69 ff __ ADC #$ff
25f7 : 2a __ __ ROL
25f8 : 2a __ __ ROL
25f9 : 2a __ __ ROL
25fa : aa __ __ TAX
25fb : 29 f8 __ AND #$f8
25fd : 85 43 __ STA T0 + 0 
25ff : 8a __ __ TXA
2600 : 29 07 __ AND #$07
2602 : 2a __ __ ROL
2603 : 69 f8 __ ADC #$f8
2605 : 85 44 __ STA T0 + 1 
2607 : a5 4c __ LDA T5 + 0 
2609 : d0 78 __ BNE $2683 ; (bmu_bitblit.s22 + 0)
.s14:
260b : a5 18 __ LDA P11 ; (op + 0)
260d : 29 20 __ AND #$20
260f : d0 3d __ BNE $264e ; (bmu_bitblit.l19 + 0)
.s15:
2611 : 85 47 __ STA T2 + 0 
.l16:
2613 : a5 53 __ LDA T11 + 0 
2615 : 85 05 __ STA WORK + 2 
2617 : 85 03 __ STA WORK + 0 
2619 : a5 54 __ LDA T11 + 1 
261b : 85 06 __ STA WORK + 3 
261d : 85 04 __ STA WORK + 1 
261f : a5 47 __ LDA T2 + 0 
2621 : 85 07 __ STA WORK + 4 
2623 : 20 00 9c JSR $9c00 ; (BLIT_CODE[0] + 0)
2626 : e6 53 __ INC T11 + 0 
2628 : d0 02 __ BNE $262c ; (bmu_bitblit.s104 + 0)
.s103:
262a : e6 54 __ INC T11 + 1 
.s104:
262c : a5 53 __ LDA T11 + 0 
262e : 29 07 __ AND #$07
2630 : d0 0d __ BNE $263f ; (bmu_bitblit.s17 + 0)
.s18:
2632 : 18 __ __ CLC
2633 : a5 53 __ LDA T11 + 0 
2635 : 65 43 __ ADC T0 + 0 
2637 : 85 53 __ STA T11 + 0 
2639 : a5 54 __ LDA T11 + 1 
263b : 65 44 __ ADC T0 + 1 
263d : 85 54 __ STA T11 + 1 
.s17:
263f : c6 4e __ DEC T8 + 0 
2641 : d0 d0 __ BNE $2613 ; (bmu_bitblit.l16 + 0)
.s3:
2643 : a2 0c __ LDX #$0c
2645 : bd d3 bf LDA $bfd3,x ; (bmu_bitblit@stack + 0)
2648 : 95 53 __ STA T11 + 0,x 
264a : ca __ __ DEX
264b : 10 f8 __ BPL $2645 ; (bmu_bitblit.s3 + 2)
264d : 60 __ __ RTS
.l19:
264e : a5 53 __ LDA T11 + 0 
2650 : 85 05 __ STA WORK + 2 
2652 : 85 03 __ STA WORK + 0 
2654 : 29 07 __ AND #$07
2656 : aa __ __ TAX
2657 : a5 54 __ LDA T11 + 1 
2659 : 85 06 __ STA WORK + 3 
265b : 85 04 __ STA WORK + 1 
265d : b5 00 __ LDA $00,x 
265f : 85 07 __ STA WORK + 4 
2661 : 20 00 9c JSR $9c00 ; (BLIT_CODE[0] + 0)
2664 : e6 53 __ INC T11 + 0 
2666 : d0 02 __ BNE $266a ; (bmu_bitblit.s102 + 0)
.s101:
2668 : e6 54 __ INC T11 + 1 
.s102:
266a : a5 53 __ LDA T11 + 0 
266c : 29 07 __ AND #$07
266e : d0 0d __ BNE $267d ; (bmu_bitblit.s20 + 0)
.s21:
2670 : 18 __ __ CLC
2671 : a5 53 __ LDA T11 + 0 
2673 : 65 43 __ ADC T0 + 0 
2675 : 85 53 __ STA T11 + 0 
2677 : a5 54 __ LDA T11 + 1 
2679 : 65 44 __ ADC T0 + 1 
267b : 85 54 __ STA T11 + 1 
.s20:
267d : c6 4e __ DEC T8 + 0 
267f : d0 cd __ BNE $264e ; (bmu_bitblit.l19 + 0)
2681 : f0 c0 __ BEQ $2643 ; (bmu_bitblit.s3 + 0)
.s22:
2683 : a5 4a __ LDA T4 + 0 
2685 : 85 45 __ STA T1 + 0 
2687 : a5 4b __ LDA T4 + 1 
2689 : 85 46 __ STA T1 + 1 
268b : a0 04 __ LDY #$04
268d : b1 4f __ LDA (T9 + 0),y 
268f : 18 __ __ CLC
2690 : 69 ff __ ADC #$ff
2692 : 2a __ __ ROL
2693 : 2a __ __ ROL
2694 : 2a __ __ ROL
2695 : aa __ __ TAX
2696 : 29 f8 __ AND #$f8
2698 : 85 47 __ STA T2 + 0 
269a : 8a __ __ TXA
269b : 29 07 __ AND #$07
269d : 2a __ __ ROL
269e : 69 f8 __ ADC #$f8
26a0 : 85 48 __ STA T2 + 1 
26a2 : a5 57 __ LDA T16 + 0 
26a4 : f0 1d __ BEQ $26c3 ; (bmu_bitblit.l23 + 0)
.s28:
26a6 : 38 __ __ SEC
26a7 : a9 00 __ LDA #$00
26a9 : e5 43 __ SBC T0 + 0 
26ab : 85 43 __ STA T0 + 0 
26ad : a9 00 __ LDA #$00
26af : e5 44 __ SBC T0 + 1 
26b1 : 85 44 __ STA T0 + 1 
26b3 : 38 __ __ SEC
26b4 : a9 00 __ LDA #$00
26b6 : e5 47 __ SBC T2 + 0 
26b8 : 85 47 __ STA T2 + 0 
26ba : a9 00 __ LDA #$00
26bc : e5 48 __ SBC T2 + 1 
26be : 85 48 __ STA T2 + 1 
26c0 : 4c 16 27 JMP $2716 ; (bmu_bitblit.l29 + 0)
.l23:
26c3 : a5 4a __ LDA T4 + 0 
26c5 : 85 03 __ STA WORK + 0 
26c7 : a5 4b __ LDA T4 + 1 
26c9 : 85 04 __ STA WORK + 1 
26cb : a5 54 __ LDA T11 + 1 
26cd : 85 06 __ STA WORK + 3 
26cf : a5 53 __ LDA T11 + 0 
26d1 : 85 05 __ STA WORK + 2 
26d3 : 29 07 __ AND #$07
26d5 : a8 __ __ TAY
26d6 : b1 45 __ LDA (T1 + 0),y 
26d8 : 85 07 __ STA WORK + 4 
26da : 20 00 9c JSR $9c00 ; (BLIT_CODE[0] + 0)
26dd : e6 4a __ INC T4 + 0 
26df : d0 02 __ BNE $26e3 ; (bmu_bitblit.s98 + 0)
.s97:
26e1 : e6 4b __ INC T4 + 1 
.s98:
26e3 : a5 4a __ LDA T4 + 0 
26e5 : 29 07 __ AND #$07
26e7 : d0 0d __ BNE $26f6 ; (bmu_bitblit.s24 + 0)
.s27:
26e9 : 18 __ __ CLC
26ea : a5 4a __ LDA T4 + 0 
26ec : 65 47 __ ADC T2 + 0 
26ee : 85 4a __ STA T4 + 0 
26f0 : a5 4b __ LDA T4 + 1 
26f2 : 65 48 __ ADC T2 + 1 
26f4 : 85 4b __ STA T4 + 1 
.s24:
26f6 : e6 53 __ INC T11 + 0 
26f8 : d0 02 __ BNE $26fc ; (bmu_bitblit.s100 + 0)
.s99:
26fa : e6 54 __ INC T11 + 1 
.s100:
26fc : a5 53 __ LDA T11 + 0 
26fe : 29 07 __ AND #$07
2700 : d0 0d __ BNE $270f ; (bmu_bitblit.s25 + 0)
.s26:
2702 : 18 __ __ CLC
2703 : a5 53 __ LDA T11 + 0 
2705 : 65 43 __ ADC T0 + 0 
2707 : 85 53 __ STA T11 + 0 
2709 : a5 54 __ LDA T11 + 1 
270b : 65 44 __ ADC T0 + 1 
270d : 85 54 __ STA T11 + 1 
.s25:
270f : c6 4e __ DEC T8 + 0 
2711 : d0 b0 __ BNE $26c3 ; (bmu_bitblit.l23 + 0)
2713 : 4c 43 26 JMP $2643 ; (bmu_bitblit.s3 + 0)
.l29:
2716 : a5 4a __ LDA T4 + 0 
2718 : 29 07 __ AND #$07
271a : d0 0d __ BNE $2729 ; (bmu_bitblit.s30 + 0)
.s33:
271c : 18 __ __ CLC
271d : a5 4a __ LDA T4 + 0 
271f : 65 47 __ ADC T2 + 0 
2721 : 85 4a __ STA T4 + 0 
2723 : a5 4b __ LDA T4 + 1 
2725 : 65 48 __ ADC T2 + 1 
2727 : 85 4b __ STA T4 + 1 
.s30:
2729 : a5 53 __ LDA T11 + 0 
272b : 29 07 __ AND #$07
272d : d0 0d __ BNE $273c ; (bmu_bitblit.s31 + 0)
.s32:
272f : 18 __ __ CLC
2730 : a5 53 __ LDA T11 + 0 
2732 : 65 43 __ ADC T0 + 0 
2734 : 85 53 __ STA T11 + 0 
2736 : a5 54 __ LDA T11 + 1 
2738 : 65 44 __ ADC T0 + 1 
273a : 85 54 __ STA T11 + 1 
.s31:
273c : 18 __ __ CLC
273d : a5 53 __ LDA T11 + 0 
273f : 69 ff __ ADC #$ff
2741 : 85 05 __ STA WORK + 2 
2743 : 85 53 __ STA T11 + 0 
2745 : a5 54 __ LDA T11 + 1 
2747 : 69 ff __ ADC #$ff
2749 : 85 54 __ STA T11 + 1 
274b : 85 06 __ STA WORK + 3 
274d : 18 __ __ CLC
274e : a5 4a __ LDA T4 + 0 
2750 : 69 ff __ ADC #$ff
2752 : 85 4a __ STA T4 + 0 
2754 : 85 03 __ STA WORK + 0 
2756 : a5 4b __ LDA T4 + 1 
2758 : 69 ff __ ADC #$ff
275a : 85 4b __ STA T4 + 1 
275c : 85 04 __ STA WORK + 1 
275e : a5 05 __ LDA WORK + 2 
2760 : 29 07 __ AND #$07
2762 : a8 __ __ TAY
2763 : b1 45 __ LDA (T1 + 0),y 
2765 : 85 07 __ STA WORK + 4 
2767 : 20 00 9c JSR $9c00 ; (BLIT_CODE[0] + 0)
276a : c6 4e __ DEC T8 + 0 
276c : d0 a8 __ BNE $2716 ; (bmu_bitblit.l29 + 0)
276e : 4c 43 26 JMP $2643 ; (bmu_bitblit.s3 + 0)
.s42:
2771 : a9 02 __ LDA #$02
2773 : c5 5e __ CMP T23 + 0 
2775 : a9 00 __ LDA #$00
2777 : 6a __ __ ROR
2778 : 85 49 __ STA T3 + 0 
277a : d0 19 __ BNE $2795 ; (bmu_bitblit.s43 + 0)
.s61:
277c : a9 a2 __ LDA #$a2
277e : a6 43 __ LDX T0 + 0 
2780 : e8 __ __ INX
2781 : e8 __ __ INX
2782 : 86 43 __ STX T0 + 0 
2784 : 9d fe 9b STA $9bfe,x 
2787 : 38 __ __ SEC
2788 : a5 5e __ LDA T23 + 0 
278a : e9 01 __ SBC #$01
278c : 9d ff 9b STA $9bff,x 
278f : a5 5e __ LDA T23 + 0 
2791 : c9 20 __ CMP #$20
2793 : b0 0d __ BCS $27a2 ; (bmu_bitblit.s45 + 0)
.s43:
2795 : a5 5f __ LDA T24 + 0 
2797 : d0 09 __ BNE $27a2 ; (bmu_bitblit.s45 + 0)
.s44:
2799 : a5 58 __ LDA T17 + 0 
279b : a6 43 __ LDX T0 + 0 
279d : 9d 00 9c STA $9c00,x ; (BLIT_CODE[0] + 0)
27a0 : e6 43 __ INC T0 + 0 
.s45:
27a2 : a5 43 __ LDA T0 + 0 
27a4 : 85 55 __ STA T13 + 0 
27a6 : a5 52 __ LDA T12 + 0 
27a8 : f0 1c __ BEQ $27c6 ; (bmu_bitblit.s46 + 0)
.s60:
27aa : a9 b1 __ LDA #$b1
27ac : a6 43 __ LDX T0 + 0 
27ae : 9d 00 9c STA $9c00,x ; (BLIT_CODE[0] + 0)
27b1 : a9 05 __ LDA #$05
27b3 : 9d 01 9c STA $9c01,x ; (BLIT_CODE[0] + 1)
27b6 : a9 85 __ LDA #$85
27b8 : 9d 02 9c STA $9c02,x ; (BLIT_CODE[0] + 2)
27bb : a9 0a __ LDA #$0a
27bd : 9d 03 9c STA $9c03,x ; (BLIT_CODE[0] + 3)
27c0 : 8a __ __ TXA
27c1 : 18 __ __ CLC
27c2 : 69 04 __ ADC #$04
27c4 : 85 43 __ STA T0 + 0 
.s46:
27c6 : a5 4c __ LDA T5 + 0 
27c8 : d0 05 __ BNE $27cf ; (bmu_bitblit.s59 + 0)
.s47:
27ca : a5 43 __ LDA T0 + 0 
27cc : 4c d6 27 JMP $27d6 ; (bmu_bitblit.s89 + 0)
.s59:
27cf : a5 43 __ LDA T0 + 0 
27d1 : 85 0d __ STA P0 
27d3 : 20 d8 29 JSR $29d8 ; (builddop_src@proxy + 0)
.s89:
27d6 : 85 0d __ STA P0 
27d8 : a5 18 __ LDA P11 ; (op + 0)
27da : 85 0e __ STA P1 
27dc : a9 00 __ LDA #$00
27de : 85 0f __ STA P2 
27e0 : 20 1b 2b JSR $2b1b ; (builddop_op.s4 + 0)
27e3 : 24 49 __ BIT T3 + 0 
27e5 : 10 1b __ BPL $2802 ; (bmu_bitblit.s50 + 0)
.s48:
27e7 : 85 43 __ STA T0 + 0 
27e9 : aa __ __ TAX
27ea : a9 a0 __ LDA #$a0
27ec : 9d 00 9c STA $9c00,x ; (BLIT_CODE[0] + 0)
27ef : 18 __ __ CLC
27f0 : a5 5d __ LDA T22 + 0 
27f2 : 65 5c __ ADC T21 + 0 
27f4 : 9d 01 9c STA $9c01,x ; (BLIT_CODE[0] + 1)
.s49:
27f7 : a6 43 __ LDX T0 + 0 
27f9 : e8 __ __ INX
27fa : e8 __ __ INX
27fb : 86 43 __ STX T0 + 0 
27fd : 86 0d __ STX P0 
27ff : 4c a8 25 JMP $25a8 ; (bmu_bitblit.s36 + 0)
.s50:
2802 : aa __ __ TAX
2803 : a9 1f __ LDA #$1f
2805 : c5 5e __ CMP T23 + 0 
2807 : a9 00 __ LDA #$00
2809 : 6a __ __ ROR
280a : 85 4d __ STA T6 + 0 
280c : f0 04 __ BEQ $2812 ; (bmu_bitblit.s58 + 0)
.s51:
280e : a5 5f __ LDA T24 + 0 
2810 : f0 06 __ BEQ $2818 ; (bmu_bitblit.s52 + 0)
.s58:
2812 : a5 58 __ LDA T17 + 0 
2814 : 9d 00 9c STA $9c00,x ; (BLIT_CODE[0] + 0)
2817 : e8 __ __ INX
.s52:
2818 : a9 98 __ LDA #$98
281a : 9d 00 9c STA $9c00,x ; (BLIT_CODE[0] + 0)
281d : a9 08 __ LDA #$08
281f : 9d 02 9c STA $9c02,x ; (BLIT_CODE[0] + 2)
2822 : a9 a8 __ LDA #$a8
2824 : 9d 03 9c STA $9c03,x ; (BLIT_CODE[0] + 3)
2827 : a5 59 __ LDA T18 + 0 
2829 : 09 08 __ ORA #$08
282b : 9d 01 9c STA $9c01,x ; (BLIT_CODE[0] + 1)
282e : 8a __ __ TXA
282f : 18 __ __ CLC
2830 : 69 04 __ ADC #$04
2832 : 85 43 __ STA T0 + 0 
2834 : 24 4d __ BIT T6 + 0 
2836 : 30 3a __ BMI $2872 ; (bmu_bitblit.s53 + 0)
.s54:
2838 : a5 5a __ LDA T19 + 0 
283a : 9d 04 9c STA $9c04,x ; (BLIT_CODE[0] + 4)
283d : a5 5b __ LDA T20 + 0 
283f : 09 04 __ ORA #$04
2841 : a8 __ __ TAY
2842 : a5 4c __ LDA T5 + 0 
2844 : d0 0d __ BNE $2853 ; (bmu_bitblit.s57 + 0)
.s55:
2846 : a9 02 __ LDA #$02
2848 : 9d 05 9c STA $9c05,x ; (BLIT_CODE[0] + 5)
284b : 18 __ __ CLC
284c : a5 43 __ LDA T0 + 0 
284e : 69 02 __ ADC #$02
2850 : 4c 64 28 JMP $2864 ; (bmu_bitblit.s56 + 0)
.s57:
2853 : a9 04 __ LDA #$04
2855 : 9d 05 9c STA $9c05,x ; (BLIT_CODE[0] + 5)
2858 : 9d 07 9c STA $9c07,x ; (BLIT_CODE[0] + 7)
285b : 98 __ __ TYA
285c : 9d 06 9c STA $9c06,x ; (BLIT_CODE[0] + 6)
285f : 18 __ __ CLC
2860 : a5 43 __ LDA T0 + 0 
2862 : 69 04 __ ADC #$04
.s56:
2864 : aa __ __ TAX
2865 : e8 __ __ INX
2866 : e8 __ __ INX
2867 : 86 43 __ STX T0 + 0 
2869 : 98 __ __ TYA
286a : 9d fe 9b STA $9bfe,x 
286d : a9 06 __ LDA #$06
286f : 9d ff 9b STA $9bff,x 
.s53:
2872 : a9 ca __ LDA #$ca
2874 : a6 43 __ LDX T0 + 0 
2876 : 9d 00 9c STA $9c00,x ; (BLIT_CODE[0] + 0)
2879 : a9 d0 __ LDA #$d0
287b : 9d 01 9c STA $9c01,x ; (BLIT_CODE[0] + 1)
287e : e6 43 __ INC T0 + 0 
2880 : a5 55 __ LDA T13 + 0 
2882 : 38 __ __ SEC
2883 : e5 43 __ SBC T0 + 0 
2885 : 38 __ __ SEC
2886 : e9 02 __ SBC #$02
2888 : 9d 02 9c STA $9c02,x ; (BLIT_CODE[0] + 2)
288b : 4c f7 27 JMP $27f7 ; (bmu_bitblit.s49 + 0)
.s66:
288e : 85 0d __ STA P0 
2890 : a5 4c __ LDA T5 + 0 
2892 : f0 51 __ BEQ $28e5 ; (bmu_bitblit.s67 + 0)
.s68:
2894 : a5 5f __ LDA T24 + 0 
2896 : f0 4d __ BEQ $28e5 ; (bmu_bitblit.s67 + 0)
.s69:
2898 : a9 03 __ LDA #$03
289a : 8d 03 9c STA $9c03 ; (BLIT_CODE[0] + 3)
289d : 8d 08 9c STA $9c08 ; (BLIT_CODE[0] + 8)
28a0 : 8d 0c 9c STA $9c0c ; (BLIT_CODE[0] + 12)
28a3 : a9 b1 __ LDA #$b1
28a5 : 8d 02 9c STA $9c02 ; (BLIT_CODE[0] + 2)
28a8 : a9 85 __ LDA #$85
28aa : 8d 04 9c STA $9c04 ; (BLIT_CODE[0] + 4)
28ad : 8d 0b 9c STA $9c0b ; (BLIT_CODE[0] + 11)
28b0 : a9 08 __ LDA #$08
28b2 : 8d 05 9c STA $9c05 ; (BLIT_CODE[0] + 5)
28b5 : 8d 0a 9c STA $9c0a ; (BLIT_CODE[0] + 10)
28b8 : a9 a5 __ LDA #$a5
28ba : 8d 07 9c STA $9c07 ; (BLIT_CODE[0] + 7)
28bd : a9 02 __ LDA #$02
28bf : 8d 0e 9c STA $9c0e ; (BLIT_CODE[0] + 14)
28c2 : a9 04 __ LDA #$04
28c4 : 8d 10 9c STA $9c10 ; (BLIT_CODE[0] + 16)
28c7 : a5 58 __ LDA T17 + 0 
28c9 : 8d 06 9c STA $9c06 ; (BLIT_CODE[0] + 6)
28cc : a5 59 __ LDA T18 + 0 
28ce : 09 08 __ ORA #$08
28d0 : 8d 09 9c STA $9c09 ; (BLIT_CODE[0] + 9)
28d3 : a5 5a __ LDA T19 + 0 
28d5 : 8d 0d 9c STA $9c0d ; (BLIT_CODE[0] + 13)
28d8 : a5 5b __ LDA T20 + 0 
28da : 09 04 __ ORA #$04
28dc : 8d 0f 9c STA $9c0f ; (BLIT_CODE[0] + 15)
28df : a9 11 __ LDA #$11
28e1 : 85 43 __ STA T0 + 0 
28e3 : 85 0d __ STA P0 
.s67:
28e5 : 18 __ __ CLC
28e6 : a5 4d __ LDA T6 + 0 
28e8 : 69 01 __ ADC #$01
28ea : 85 5e __ STA T23 + 0 
28ec : d0 03 __ BNE $28f1 ; (bmu_bitblit.s67 + 12)
28ee : 4c eb 25 JMP $25eb ; (bmu_bitblit.s13 + 0)
28f1 : 4c a1 25 JMP $25a1 ; (bmu_bitblit.s35 + 0)
.s76:
28f4 : 18 __ __ CLC
28f5 : a5 12 __ LDA P5 ; (dy + 0)
28f7 : 65 4e __ ADC T8 + 0 
28f9 : 85 47 __ STA T2 + 0 
28fb : 29 f8 __ AND #$f8
28fd : 85 1b __ STA ACCU + 0 ; (w + 0)
28ff : a5 13 __ LDA P6 ; (dy + 1)
2901 : 69 00 __ ADC #$00
2903 : 85 1c __ STA ACCU + 1 ; (w + 1)
2905 : ad de 80 LDA $80de ; (Screen.cwidth + 0)
2908 : 85 51 __ STA T10 + 0 
290a : 20 7e 74 JSR $747e ; (mul16by8 + 0)
290d : ad da 80 LDA $80da ; (Screen.data + 0)
2910 : 18 __ __ CLC
2911 : 65 1b __ ADC ACCU + 0 ; (w + 0)
2913 : 85 4c __ STA T5 + 0 
2915 : ad db 80 LDA $80db ; (Screen.data + 1)
2918 : 65 1c __ ADC ACCU + 1 ; (w + 1)
291a : aa __ __ TAX
291b : a5 10 __ LDA P3 ; (dx + 0)
291d : 29 f8 __ AND #$f8
291f : 18 __ __ CLC
2920 : 65 4c __ ADC T5 + 0 
2922 : 85 4c __ STA T5 + 0 
2924 : 8a __ __ TXA
2925 : 65 11 __ ADC P4 ; (dx + 1)
2927 : aa __ __ TAX
2928 : a5 47 __ LDA T2 + 0 
292a : 29 07 __ AND #$07
292c : 18 __ __ CLC
292d : 65 4c __ ADC T5 + 0 
292f : 85 4c __ STA T5 + 0 
2931 : 90 02 __ BCC $2935 ; (bmu_bitblit.s107 + 0)
.s106:
2933 : e8 __ __ INX
2934 : 18 __ __ CLC
.s107:
2935 : a5 4d __ LDA T6 + 0 
2937 : 69 e1 __ ADC #$e1
2939 : 2a __ __ ROL
293a : 2a __ __ ROL
293b : 2a __ __ ROL
293c : a8 __ __ TAY
293d : 29 f8 __ AND #$f8
293f : 85 43 __ STA T0 + 0 
2941 : 98 __ __ TYA
2942 : 29 07 __ AND #$07
2944 : 2a __ __ ROL
2945 : 69 f8 __ ADC #$f8
2947 : 85 44 __ STA T0 + 1 
2949 : 18 __ __ CLC
294a : a5 4c __ LDA T5 + 0 
294c : 65 43 __ ADC T0 + 0 
294e : 85 53 __ STA T11 + 0 
2950 : 8a __ __ TXA
2951 : 65 44 __ ADC T0 + 1 
2953 : 85 54 __ STA T11 + 1 
2955 : a5 56 __ LDA T14 + 0 
2957 : 85 55 __ STA T13 + 0 
2959 : a5 52 __ LDA T12 + 0 
295b : 85 56 __ STA T14 + 0 
295d : ad ea bf LDA $bfea ; (sstack + 0)
2960 : 18 __ __ CLC
2961 : 65 4e __ ADC T8 + 0 
2963 : 85 47 __ STA T2 + 0 
2965 : 29 f8 __ AND #$f8
2967 : 85 1b __ STA ACCU + 0 ; (w + 0)
2969 : ad eb bf LDA $bfeb ; (sstack + 1)
296c : 69 00 __ ADC #$00
296e : 85 1c __ STA ACCU + 1 ; (w + 1)
2970 : ad de 80 LDA $80de ; (Screen.cwidth + 0)
2973 : 20 7e 74 JSR $747e ; (mul16by8 + 0)
2976 : ad da 80 LDA $80da ; (Screen.data + 0)
2979 : 18 __ __ CLC
297a : 65 1b __ ADC ACCU + 0 ; (w + 0)
297c : 85 4a __ STA T4 + 0 
297e : ad db 80 LDA $80db ; (Screen.data + 1)
2981 : 65 1c __ ADC ACCU + 1 ; (w + 1)
2983 : aa __ __ TAX
2984 : a5 16 __ LDA P9 ; (sx + 0)
2986 : 29 f8 __ AND #$f8
2988 : 18 __ __ CLC
2989 : 65 4a __ ADC T4 + 0 
298b : 85 4a __ STA T4 + 0 
298d : 8a __ __ TXA
298e : 65 17 __ ADC P10 ; (sx + 1)
2990 : aa __ __ TAX
2991 : a5 47 __ LDA T2 + 0 
2993 : 29 07 __ AND #$07
2995 : 18 __ __ CLC
2996 : 65 4a __ ADC T4 + 0 
2998 : 90 02 __ BCC $299c ; (bmu_bitblit.s109 + 0)
.s108:
299a : e8 __ __ INX
299b : 18 __ __ CLC
.s109:
299c : 65 43 __ ADC T0 + 0 
299e : 85 4a __ STA T4 + 0 
29a0 : 8a __ __ TXA
29a1 : 65 44 __ ADC T0 + 1 
29a3 : 85 4b __ STA T4 + 1 
29a5 : a9 01 __ LDA #$01
29a7 : 85 57 __ STA T16 + 0 
29a9 : a5 16 __ LDA P9 ; (sx + 0)
29ab : 29 07 __ AND #$07
29ad : 49 ff __ EOR #$ff
29af : 38 __ __ SEC
29b0 : 65 45 __ ADC T1 + 0 
29b2 : 85 43 __ STA T0 + 0 
29b4 : 10 0b __ BPL $29c1 ; (bmu_bitblit.s77 + 0)
.s78:
29b6 : 18 __ __ CLC
29b7 : a5 4a __ LDA T4 + 0 
29b9 : 69 08 __ ADC #$08
29bb : 85 4a __ STA T4 + 0 
29bd : 90 02 __ BCC $29c1 ; (bmu_bitblit.s77 + 0)
.s110:
29bf : e6 4b __ INC T4 + 1 
.s77:
29c1 : a9 38 __ LDA #$38
29c3 : 85 58 __ STA T17 + 0 
29c5 : a9 e1 __ LDA #$e1
29c7 : 85 59 __ STA T18 + 0 
29c9 : a9 b0 __ LDA #$b0
29cb : 85 5a __ STA T19 + 0 
29cd : a9 c2 __ LDA #$c2
29cf : 85 5b __ STA T20 + 0 
29d1 : a9 f8 __ LDA #$f8
29d3 : 85 5c __ STA T21 + 0 
29d5 : 4c b9 24 JMP $24b9 ; (bmu_bitblit.s7 + 0)
--------------------------------------------------------------------
builddop_src@proxy: ; builddop_src@proxy
29d8 : a5 5f __ LDA $5f 
29da : 85 0e __ STA P1 
29dc : a5 57 __ LDA $57 
29de : 85 0f __ STA P2 
--------------------------------------------------------------------
builddop_src: ; builddop_src(u8,u8,bool)->u8
; 888, "/home/xahmol/oscar64/include/gfx/bitmap.c"
.s4:
29e0 : a6 0d __ LDX P0 ; (ip + 0)
29e2 : e8 __ __ INX
29e3 : a4 0d __ LDY P0 ; (ip + 0)
29e5 : e8 __ __ INX
29e6 : a5 0e __ LDA P1 ; (shift + 0)
29e8 : d0 0c __ BNE $29f6 ; (builddop_src.s6 + 0)
.s5:
29ea : a9 b1 __ LDA #$b1
29ec : 99 00 9c STA $9c00,y ; (BLIT_CODE[0] + 0)
29ef : a9 03 __ LDA #$03
29f1 : 99 01 9c STA $9c01,y ; (BLIT_CODE[0] + 1)
.s35:
29f4 : 8a __ __ TXA
.s3:
29f5 : 60 __ __ RTS
.s6:
29f6 : a9 a5 __ LDA #$a5
29f8 : 99 00 9c STA $9c00,y ; (BLIT_CODE[0] + 0)
29fb : a9 08 __ LDA #$08
29fd : 99 01 9c STA $9c01,y ; (BLIT_CODE[0] + 1)
2a00 : a5 0f __ LDA P2 ; (reverse + 0)
2a02 : f0 03 __ BEQ $2a07 ; (builddop_src.s7 + 0)
2a04 : 4c 0d 2b JMP $2b0d ; (builddop_src.s26 + 0)
.s7:
2a07 : a5 0e __ LDA P1 ; (shift + 0)
2a09 : c9 05 __ CMP #$05
2a0b : b0 06 __ BCS $2a13 ; (builddop_src.s8 + 0)
.s24:
2a0d : a9 4a __ LDA #$4a
.s25:
2a0f : 99 02 9c STA $9c02,y ; (BLIT_CODE[0] + 2)
2a12 : e8 __ __ INX
.s8:
2a13 : a9 85 __ LDA #$85
2a15 : 9d 00 9c STA $9c00,x ; (BLIT_CODE[0] + 0)
2a18 : 9d 04 9c STA $9c04,x ; (BLIT_CODE[0] + 4)
2a1b : a9 09 __ LDA #$09
2a1d : 9d 01 9c STA $9c01,x ; (BLIT_CODE[0] + 1)
2a20 : a9 b1 __ LDA #$b1
2a22 : 9d 02 9c STA $9c02,x ; (BLIT_CODE[0] + 2)
2a25 : a9 03 __ LDA #$03
2a27 : 9d 03 9c STA $9c03,x ; (BLIT_CODE[0] + 3)
2a2a : a9 08 __ LDA #$08
2a2c : 9d 05 9c STA $9c05,x ; (BLIT_CODE[0] + 5)
2a2f : 8a __ __ TXA
2a30 : 18 __ __ CLC
2a31 : 69 06 __ ADC #$06
2a33 : 85 1b __ STA ACCU + 0 
2a35 : 85 0d __ STA P0 ; (ip + 0)
2a37 : a5 0f __ LDA P2 ; (reverse + 0)
2a39 : d0 6a __ BNE $2aa5 ; (builddop_src.s17 + 0)
.s9:
2a3b : a5 0e __ LDA P1 ; (shift + 0)
2a3d : c9 05 __ CMP #$05
2a3f : 90 0b __ BCC $2a4c ; (builddop_src.s10 + 0)
.s13:
2a41 : a9 0a __ LDA #$0a
2a43 : 9d 06 9c STA $9c06,x ; (BLIT_CODE[0] + 6)
2a46 : e6 1b __ INC ACCU + 0 
2a48 : a6 0e __ LDX P1 ; (shift + 0)
2a4a : b0 2e __ BCS $2a7a ; (builddop_src.l14 + 0)
.s10:
2a4c : c9 02 __ CMP #$02
2a4e : 90 1f __ BCC $2a6f ; (builddop_src.s11 + 0)
.s12:
2a50 : c6 0e __ DEC P1 ; (shift + 0)
2a52 : a6 0d __ LDX P0 ; (ip + 0)
2a54 : a4 0e __ LDY P1 ; (shift + 0)
.l31:
2a56 : a9 6a __ LDA #$6a
2a58 : 9d 00 9c STA $9c00,x ; (BLIT_CODE[0] + 0)
2a5b : a9 46 __ LDA #$46
2a5d : 9d 01 9c STA $9c01,x ; (BLIT_CODE[0] + 1)
2a60 : a9 09 __ LDA #$09
2a62 : 9d 02 9c STA $9c02,x ; (BLIT_CODE[0] + 2)
2a65 : 8a __ __ TXA
2a66 : 18 __ __ CLC
2a67 : 69 03 __ ADC #$03
2a69 : aa __ __ TAX
2a6a : 88 __ __ DEY
2a6b : d0 e9 __ BNE $2a56 ; (builddop_src.l31 + 0)
.s32:
2a6d : 85 0d __ STA P0 ; (ip + 0)
.s11:
2a6f : a9 6a __ LDA #$6a
.s33:
2a71 : a6 0d __ LDX P0 ; (ip + 0)
2a73 : 9d 00 9c STA $9c00,x ; (BLIT_CODE[0] + 0)
2a76 : e8 __ __ INX
2a77 : 4c f4 29 JMP $29f4 ; (builddop_src.s35 + 0)
.l14:
2a7a : a9 09 __ LDA #$09
2a7c : a4 1b __ LDY ACCU + 0 
2a7e : 99 01 9c STA $9c01,y ; (BLIT_CODE[0] + 1)
2a81 : 98 __ __ TYA
2a82 : 18 __ __ CLC
2a83 : 69 03 __ ADC #$03
2a85 : 85 1b __ STA ACCU + 0 
2a87 : e0 07 __ CPX #$07
2a89 : b0 0d __ BCS $2a98 ; (builddop_src.s15 + 0)
.s16:
2a8b : a9 26 __ LDA #$26
2a8d : 99 00 9c STA $9c00,y ; (BLIT_CODE[0] + 0)
2a90 : a9 0a __ LDA #$0a
2a92 : 99 02 9c STA $9c02,y ; (BLIT_CODE[0] + 2)
2a95 : e8 __ __ INX
2a96 : 90 e2 __ BCC $2a7a ; (builddop_src.l14 + 0)
.s15:
2a98 : a9 a5 __ LDA #$a5
2a9a : 99 00 9c STA $9c00,y ; (BLIT_CODE[0] + 0)
2a9d : a9 2a __ LDA #$2a
2a9f : 99 02 9c STA $9c02,y ; (BLIT_CODE[0] + 2)
2aa2 : a5 1b __ LDA ACCU + 0 
2aa4 : 60 __ __ RTS
.s17:
2aa5 : a4 0e __ LDY P1 ; (shift + 0)
2aa7 : c0 05 __ CPY #$05
2aa9 : b0 3d __ BCS $2ae8 ; (builddop_src.s21 + 0)
.s18:
2aab : a9 4a __ LDA #$4a
2aad : 9d 06 9c STA $9c06,x ; (BLIT_CODE[0] + 6)
2ab0 : e6 1b __ INC ACCU + 0 
2ab2 : c0 02 __ CPY #$02
2ab4 : 90 1c __ BCC $2ad2 ; (builddop_src.s19 + 0)
.s20:
2ab6 : a6 1b __ LDX ACCU + 0 
2ab8 : 88 __ __ DEY
.l29:
2ab9 : a9 66 __ LDA #$66
2abb : 9d 00 9c STA $9c00,x ; (BLIT_CODE[0] + 0)
2abe : a9 09 __ LDA #$09
2ac0 : 9d 01 9c STA $9c01,x ; (BLIT_CODE[0] + 1)
2ac3 : a9 4a __ LDA #$4a
2ac5 : 9d 02 9c STA $9c02,x ; (BLIT_CODE[0] + 2)
2ac8 : 8a __ __ TXA
2ac9 : 18 __ __ CLC
2aca : 69 03 __ ADC #$03
2acc : aa __ __ TAX
2acd : 88 __ __ DEY
2ace : d0 e9 __ BNE $2ab9 ; (builddop_src.l29 + 0)
.s30:
2ad0 : 85 1b __ STA ACCU + 0 
.s19:
2ad2 : a9 a5 __ LDA #$a5
2ad4 : a6 1b __ LDX ACCU + 0 
2ad6 : 9d 00 9c STA $9c00,x ; (BLIT_CODE[0] + 0)
2ad9 : a9 09 __ LDA #$09
2adb : 9d 01 9c STA $9c01,x ; (BLIT_CODE[0] + 1)
2ade : a9 6a __ LDA #$6a
2ae0 : 9d 02 9c STA $9c02,x ; (BLIT_CODE[0] + 2)
2ae3 : 8a __ __ TXA
2ae4 : 18 __ __ CLC
2ae5 : 69 03 __ ADC #$03
2ae7 : 60 __ __ RTS
.s21:
2ae8 : c0 07 __ CPY #$07
2aea : b0 1c __ BCS $2b08 ; (builddop_src.s22 + 0)
.s23:
2aec : a6 0d __ LDX P0 ; (ip + 0)
.l34:
2aee : a9 2a __ LDA #$2a
2af0 : 9d 00 9c STA $9c00,x ; (BLIT_CODE[0] + 0)
2af3 : a9 06 __ LDA #$06
2af5 : 9d 01 9c STA $9c01,x ; (BLIT_CODE[0] + 1)
2af8 : a9 09 __ LDA #$09
2afa : 9d 02 9c STA $9c02,x ; (BLIT_CODE[0] + 2)
2afd : 8a __ __ TXA
2afe : 69 03 __ ADC #$03
2b00 : c8 __ __ INY
2b01 : c0 07 __ CPY #$07
2b03 : aa __ __ TAX
2b04 : 90 e8 __ BCC $2aee ; (builddop_src.l34 + 0)
.s28:
2b06 : 85 0d __ STA P0 ; (ip + 0)
.s22:
2b08 : a9 2a __ LDA #$2a
2b0a : 4c 71 2a JMP $2a71 ; (builddop_src.s33 + 0)
.s26:
2b0d : a5 0e __ LDA P1 ; (shift + 0)
2b0f : c9 05 __ CMP #$05
2b11 : b0 03 __ BCS $2b16 ; (builddop_src.s27 + 0)
2b13 : 4c 13 2a JMP $2a13 ; (builddop_src.s8 + 0)
.s27:
2b16 : a9 0a __ LDA #$0a
2b18 : 4c 0f 2a JMP $2a0f ; (builddop_src.s25 + 0)
--------------------------------------------------------------------
builddop_op: ; builddop_op(u8,enum BlitOp,u8)->u8
; 965, "/home/xahmol/oscar64/include/gfx/bitmap.c"
.s4:
2b1b : a5 0e __ LDA P1 ; (op + 0)
2b1d : 29 20 __ AND #$20
2b1f : f0 04 __ BEQ $2b25 ; (builddop_op.s27 + 0)
.s28:
2b21 : a9 07 __ LDA #$07
2b23 : d0 02 __ BNE $2b27 ; (builddop_op.s29 + 0)
.s27:
2b25 : a9 0a __ LDA #$0a
.s29:
2b27 : 85 1c __ STA ACCU + 1 
2b29 : a5 0e __ LDA P1 ; (op + 0)
2b2b : 29 03 __ AND #$03
2b2d : a8 __ __ TAY
2b2e : a5 0e __ LDA P1 ; (op + 0)
2b30 : 29 04 __ AND #$04
2b32 : f0 03 __ BEQ $2b37 ; (builddop_op.s5 + 0)
2b34 : 4c c9 2b JMP $2bc9 ; (builddop_op.s18 + 0)
.s5:
2b37 : a5 0e __ LDA P1 ; (op + 0)
2b39 : 29 08 __ AND #$08
2b3b : d0 13 __ BNE $2b50 ; (builddop_op.s15 + 0)
.s6:
2b3d : a9 a5 __ LDA #$a5
2b3f : a6 0d __ LDX P0 ; (ip + 0)
2b41 : 9d 00 9c STA $9c00,x ; (BLIT_CODE[0] + 0)
2b44 : a5 1c __ LDA ACCU + 1 
.s7:
2b46 : e8 __ __ INX
2b47 : e8 __ __ INX
2b48 : 86 0d __ STX P0 ; (ip + 0)
2b4a : 9d ff 9b STA $9bff,x 
2b4d : 4c 60 2b JMP $2b60 ; (builddop_op.s16 + 0)
.s15:
2b50 : a5 0e __ LDA P1 ; (op + 0)
2b52 : 0a __ __ ASL
2b53 : 10 0b __ BPL $2b60 ; (builddop_op.s16 + 0)
.s17:
2b55 : a9 49 __ LDA #$49
2b57 : a6 0d __ LDX P0 ; (ip + 0)
2b59 : 9d 00 9c STA $9c00,x ; (BLIT_CODE[0] + 0)
2b5c : a9 ff __ LDA #$ff
2b5e : d0 e6 __ BNE $2b46 ; (builddop_op.s7 + 0)
.s16:
2b60 : 98 __ __ TYA
2b61 : f0 13 __ BEQ $2b76 ; (builddop_op.s8 + 0)
.s14:
2b63 : a5 1c __ LDA ACCU + 1 
2b65 : a6 0d __ LDX P0 ; (ip + 0)
2b67 : e8 __ __ INX
2b68 : e8 __ __ INX
2b69 : 86 0d __ STX P0 ; (ip + 0)
2b6b : 9d ff 9b STA $9bff,x 
2b6e : b9 fc 78 LDA $78fc,y ; (blitops_op[0] + 0)
2b71 : 09 04 __ ORA #$04
2b73 : 9d fe 9b STA $9bfe,x 
.s8:
2b76 : a5 0f __ LDA P2 ; (mask + 0)
2b78 : f0 3f __ BEQ $2bb9 ; (builddop_op.s9 + 0)
.s10:
2b7a : a9 85 __ LDA #$85
2b7c : a4 0d __ LDY P0 ; (ip + 0)
2b7e : 99 00 9c STA $9c00,y ; (BLIT_CODE[0] + 0)
2b81 : a9 09 __ LDA #$09
2b83 : 99 01 9c STA $9c01,y ; (BLIT_CODE[0] + 1)
2b86 : 98 __ __ TYA
2b87 : 18 __ __ CLC
2b88 : 69 08 __ ADC #$08
2b8a : 85 0d __ STA P0 ; (ip + 0)
2b8c : a5 0e __ LDA P1 ; (op + 0)
2b8e : 29 10 __ AND #$10
2b90 : f0 09 __ BEQ $2b9b ; (builddop_op.s11 + 0)
.s13:
2b92 : a9 45 __ LDA #$45
2b94 : 99 02 9c STA $9c02,y ; (BLIT_CODE[0] + 2)
2b97 : a9 0a __ LDA #$0a
2b99 : d0 07 __ BNE $2ba2 ; (builddop_op.s12 + 0)
.s11:
2b9b : a9 51 __ LDA #$51
2b9d : 99 02 9c STA $9c02,y ; (BLIT_CODE[0] + 2)
2ba0 : a9 05 __ LDA #$05
.s12:
2ba2 : 99 03 9c STA $9c03,y ; (BLIT_CODE[0] + 3)
2ba5 : a9 29 __ LDA #$29
2ba7 : 99 04 9c STA $9c04,y ; (BLIT_CODE[0] + 4)
2baa : a5 0f __ LDA P2 ; (mask + 0)
2bac : 99 05 9c STA $9c05,y ; (BLIT_CODE[0] + 5)
2baf : a9 45 __ LDA #$45
2bb1 : 99 06 9c STA $9c06,y ; (BLIT_CODE[0] + 6)
2bb4 : a9 09 __ LDA #$09
2bb6 : 99 07 9c STA $9c07,y ; (BLIT_CODE[0] + 7)
.s9:
2bb9 : a9 91 __ LDA #$91
2bbb : a6 0d __ LDX P0 ; (ip + 0)
2bbd : 9d 00 9c STA $9c00,x ; (BLIT_CODE[0] + 0)
2bc0 : a9 05 __ LDA #$05
2bc2 : 9d 01 9c STA $9c01,x ; (BLIT_CODE[0] + 1)
2bc5 : e8 __ __ INX
2bc6 : e8 __ __ INX
2bc7 : 8a __ __ TXA
.s3:
2bc8 : 60 __ __ RTS
.s18:
2bc9 : 98 __ __ TYA
2bca : d0 04 __ BNE $2bd0 ; (builddop_op.s20 + 0)
.s19:
2bcc : a5 0f __ LDA P2 ; (mask + 0)
2bce : d0 16 __ BNE $2be6 ; (builddop_op.s23 + 0)
.s20:
2bd0 : a5 0e __ LDA P1 ; (op + 0)
2bd2 : 29 40 __ AND #$40
2bd4 : f0 02 __ BEQ $2bd8 ; (builddop_op.s21 + 0)
.s22:
2bd6 : a9 ff __ LDA #$ff
.s21:
2bd8 : 85 1b __ STA ACCU + 0 
2bda : a9 a9 __ LDA #$a9
2bdc : a6 0d __ LDX P0 ; (ip + 0)
2bde : 9d 00 9c STA $9c00,x ; (BLIT_CODE[0] + 0)
2be1 : a5 1b __ LDA ACCU + 0 
2be3 : 4c 46 2b JMP $2b46 ; (builddop_op.s7 + 0)
.s23:
2be6 : a9 b1 __ LDA #$b1
2be8 : a4 0d __ LDY P0 ; (ip + 0)
2bea : 99 00 9c STA $9c00,y ; (BLIT_CODE[0] + 0)
2bed : a9 05 __ LDA #$05
2bef : 99 01 9c STA $9c01,y ; (BLIT_CODE[0] + 1)
2bf2 : 06 0e __ ASL P1 ; (op + 0)
2bf4 : 30 0a __ BMI $2c00 ; (builddop_op.s26 + 0)
.s24:
2bf6 : a9 29 __ LDA #$29
2bf8 : 99 02 9c STA $9c02,y ; (BLIT_CODE[0] + 2)
2bfb : a5 0f __ LDA P2 ; (mask + 0)
2bfd : 4c 09 2c JMP $2c09 ; (builddop_op.s25 + 0)
.s26:
2c00 : a9 09 __ LDA #$09
2c02 : 99 02 9c STA $9c02,y ; (BLIT_CODE[0] + 2)
2c05 : a5 0f __ LDA P2 ; (mask + 0)
2c07 : 49 ff __ EOR #$ff
.s25:
2c09 : 99 03 9c STA $9c03,y ; (BLIT_CODE[0] + 3)
2c0c : a9 91 __ LDA #$91
2c0e : 99 04 9c STA $9c04,y ; (BLIT_CODE[0] + 4)
2c11 : a9 05 __ LDA #$05
2c13 : 99 05 9c STA $9c05,y ; (BLIT_CODE[0] + 5)
2c16 : 98 __ __ TYA
2c17 : 18 __ __ CLC
2c18 : 69 06 __ ADC #$06
2c1a : 60 __ __ RTS
--------------------------------------------------------------------
draw_message: ; draw_message(u8)->void
; 234, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s1:
2c1b : a2 04 __ LDX #$04
2c1d : b5 53 __ LDA T1 + 0,x 
2c1f : 9d cd bf STA $bfcd,x ; (draw_message@stack + 0)
2c22 : ca __ __ DEX
2c23 : 10 f8 __ BPL $2c1d ; (draw_message.s1 + 2)
.s4:
2c25 : ad f0 bf LDA $bff0 ; (sstack + 6)
2c28 : 0a __ __ ASL
2c29 : aa __ __ TAX
2c2a : bd bc 7a LDA $7abc,x ; (step_msg[0] + 0)
2c2d : 85 56 __ STA T3 + 0 
2c2f : 85 0d __ STA P0 
2c31 : bd bd 7a LDA $7abd,x ; (step_msg[0] + 1)
2c34 : 85 57 __ STA T3 + 1 
2c36 : 85 0e __ STA P1 
2c38 : 20 45 10 JSR $1045 ; (strlen.s4 + 0)
2c3b : a9 00 __ LDA #$00
2c3d : 85 53 __ STA T1 + 0 
2c3f : 85 54 __ STA T1 + 1 
2c41 : a5 1b __ LDA ACCU + 0 
2c43 : f0 1b __ BEQ $2c60 ; (draw_message.s5 + 0)
.s6:
2c45 : a0 00 __ LDY #$00
.l7:
2c47 : b1 56 __ LDA (T3 + 0),y 
2c49 : 38 __ __ SEC
2c4a : e9 20 __ SBC #$20
2c4c : aa __ __ TAX
2c4d : bd 3c 7b LDA $7b3c,x ; (TinyFont[0] + 96)
2c50 : 4a __ __ LSR
2c51 : 4a __ __ LSR
2c52 : 38 __ __ SEC
2c53 : 65 53 __ ADC T1 + 0 
2c55 : 85 53 __ STA T1 + 0 
2c57 : 90 02 __ BCC $2c5b ; (draw_message.s9 + 0)
.s8:
2c59 : e6 54 __ INC T1 + 1 
.s9:
2c5b : c8 __ __ INY
2c5c : c4 1b __ CPY ACCU + 0 
2c5e : 90 e7 __ BCC $2c47 ; (draw_message.l7 + 0)
.s5:
2c60 : a5 0d __ LDA P0 
2c62 : 85 0e __ STA P1 
2c64 : a5 57 __ LDA T3 + 1 
2c66 : 85 0f __ STA P2 
2c68 : a5 1b __ LDA ACCU + 0 
2c6a : 85 10 __ STA P3 
2c6c : 38 __ __ SEC
2c6d : a9 40 __ LDA #$40
2c6f : e5 53 __ SBC T1 + 0 
2c71 : a8 __ __ TAY
2c72 : a9 01 __ LDA #$01
2c74 : e5 54 __ SBC T1 + 1 
2c76 : aa __ __ TAX
2c77 : 0a __ __ ASL
2c78 : 98 __ __ TYA
2c79 : 69 00 __ ADC #$00
2c7b : 85 53 __ STA T1 + 0 
2c7d : 8a __ __ TXA
2c7e : 69 00 __ ADC #$00
2c80 : c9 80 __ CMP #$80
2c82 : 6a __ __ ROR
2c83 : 66 53 __ ROR T1 + 0 
2c85 : 85 54 __ STA T1 + 1 
2c87 : a5 53 __ LDA T1 + 0 
2c89 : 29 07 __ AND #$07
2c8b : 85 55 __ STA T2 + 0 
2c8d : 85 0d __ STA P0 
2c8f : 20 7a 2e JSR $2e7a ; (bmu_text.s4 + 0)
2c92 : a5 53 __ LDA T1 + 0 
2c94 : 85 10 __ STA P3 
2c96 : a5 54 __ LDA T1 + 1 
2c98 : 85 11 __ STA P4 
2c9a : a9 00 __ LDA #$00
2c9c : 85 13 __ STA P6 
2c9e : 85 17 __ STA P10 
2ca0 : 8d ea bf STA $bfea ; (sstack + 0)
2ca3 : 8d eb bf STA $bfeb ; (sstack + 1)
2ca6 : 8d ef bf STA $bfef ; (sstack + 5)
2ca9 : a5 55 __ LDA T2 + 0 
2cab : 85 16 __ STA P9 
2cad : a9 a2 __ LDA #$a2
2caf : 85 12 __ STA P5 
2cb1 : a5 1b __ LDA ACCU + 0 
2cb3 : 8d ec bf STA $bfec ; (sstack + 2)
2cb6 : a5 1c __ LDA ACCU + 1 
2cb8 : 8d ed bf STA $bfed ; (sstack + 3)
2cbb : a9 08 __ LDA #$08
2cbd : 85 18 __ STA P11 
2cbf : 8d ee bf STA $bfee ; (sstack + 4)
2cc2 : a9 07 __ LDA #$07
2cc4 : 85 14 __ STA P7 
2cc6 : a9 7d __ LDA #$7d
2cc8 : 85 15 __ STA P8 
2cca : 20 66 23 JSR $2366 ; (bmu_bitblit.s1 + 0)
.s3:
2ccd : a2 04 __ LDX #$04
2ccf : bd cd bf LDA $bfcd,x ; (draw_message@stack + 0)
2cd2 : 95 53 __ STA T1 + 0,x 
2cd4 : ca __ __ DEX
2cd5 : 10 f8 __ BPL $2ccf ; (draw_message.s3 + 2)
2cd7 : 60 __ __ RTS
--------------------------------------------------------------------
2cd8 : __ __ __ BYT 53 74 61 6e 64 61 72 64 20 31 20 4d 48 7a 20 43 : Standard 1 MHz C
2ce8 : __ __ __ BYT 36 34 20 73 70 65 65 64 00                      : 64 speed.
--------------------------------------------------------------------
2cf1 : __ __ __ BYT 54 75 72 62 6f 20 65 6e 67 61 67 65 64 3a 20 32 : Turbo engaged: 2
2d01 : __ __ __ BYT 20 4d 48 7a 00                                  :  MHz.
--------------------------------------------------------------------
2d06 : __ __ __ BYT 33 20 4d 48 7a 20 2d 20 77 61 72 6d 69 6e 67 20 : 3 MHz - warming 
2d16 : __ __ __ BYT 75 70 00                                        : up.
--------------------------------------------------------------------
2d19 : __ __ __ BYT 34 20 4d 48 7a 20 2d 20 73 6d 6f 6f 74 68 20 61 : 4 MHz - smooth a
2d29 : __ __ __ BYT 6c 72 65 61 64 79 21 00                         : lready!.
--------------------------------------------------------------------
2d31 : __ __ __ BYT 36 20 4d 48 7a 20 2d 20 74 68 69 73 20 66 65 65 : 6 MHz - this fee
2d41 : __ __ __ BYT 6c 73 20 64 69 66 66 65 72 65 6e 74 00          : ls different.
--------------------------------------------------------------------
2d4e : __ __ __ BYT 38 20 4d 48 7a 20 2d 20 74 68 69 6e 67 73 20 61 : 8 MHz - things a
2d5e : __ __ __ BYT 72 65 20 6d 6f 76 69 6e 67 00                   : re moving.
--------------------------------------------------------------------
2d68 : __ __ __ BYT 31 32 20 4d 48 7a 20 2d 20 70 69 63 6b 69 6e 67 : 12 MHz - picking
2d78 : __ __ __ BYT 20 75 70 20 73 70 65 65 64 00                   :  up speed.
--------------------------------------------------------------------
2d82 : __ __ __ BYT 31 36 20 4d 48 7a 20 2d 20 6e 6f 74 69 63 65 61 : 16 MHz - noticea
2d92 : __ __ __ BYT 62 6c 79 20 66 61 73 74 00                      : bly fast.
--------------------------------------------------------------------
2d9b : __ __ __ BYT 32 30 20 4d 48 7a 20 2d 20 77 68 61 74 20 69 73 : 20 MHz - what is
2dab : __ __ __ BYT 20 68 61 70 70 65 6e 69 6e 67 3f 00             :  happening?.
--------------------------------------------------------------------
2db7 : __ __ __ BYT 32 34 20 4d 48 7a 20 2d 20 65 79 65 73 20 63 61 : 24 MHz - eyes ca
2dc7 : __ __ __ BYT 6e 20 62 61 72 65 6c 79 20 66 6f 6c 6c 6f 77 00 : n barely follow.
--------------------------------------------------------------------
2dd7 : __ __ __ BYT 32 38 20 4d 48 7a 20 2d 20 74 68 69 73 20 69 73 : 28 MHz - this is
2de7 : __ __ __ BYT 20 69 6e 63 72 65 64 69 62 6c 65 21 00          :  incredible!.
--------------------------------------------------------------------
2df4 : __ __ __ BYT 33 32 20 4d 48 7a 20 2d 20 74 68 65 20 6d 61 63 : 32 MHz - the mac
2e04 : __ __ __ BYT 68 69 6e 65 20 73 63 72 65 61 6d 73 00          : hine screams.
--------------------------------------------------------------------
2e11 : __ __ __ BYT 33 36 20 4d 48 7a 20 2d 20 62 65 79 6f 6e 64 20 : 36 MHz - beyond 
2e21 : __ __ __ BYT 69 6d 61 67 69 6e 61 74 69 6f 6e 00             : imagination.
--------------------------------------------------------------------
2e2d : __ __ __ BYT 34 30 20 4d 48 7a 20 2d 20 68 6f 6c 64 20 6f 6e : 40 MHz - hold on
2e3d : __ __ __ BYT 20 74 69 67 68 74 21 00                         :  tight!.
--------------------------------------------------------------------
2e45 : __ __ __ BYT 34 38 20 4d 48 7a 20 2d 20 6d 61 78 69 6d 75 6d : 48 MHz - maximum
2e55 : __ __ __ BYT 20 6f 76 65 72 64 72 69 76 65 21 00             :  overdrive!.
--------------------------------------------------------------------
2e61 : __ __ __ BYT 36 34 20 4d 48 7a 20 20 55 4c 54 49 4d 41 54 45 : 64 MHz  ULTIMATE
2e71 : __ __ __ BYT 20 53 50 45 45 44 21 21 00                      :  SPEED!!.
--------------------------------------------------------------------
bmu_text: ; bmu_text(const struct Bitmap*,u8,const u8*,u8)->i16
; 151, "/home/xahmol/oscar64/include/gfx/bitmap.h"
.s4:
2e7a : a9 00 __ LDA #$00
2e7c : 8d e2 80 STA $80e2 ; (tworks[0] + 0)
2e7f : 8d e3 80 STA $80e3 ; (tworks[0] + 1)
2e82 : 8d e4 80 STA $80e4 ; (tworks[0] + 2)
2e85 : 8d e5 80 STA $80e5 ; (tworks[0] + 3)
2e88 : 8d e6 80 STA $80e6 ; (tworks[0] + 4)
2e8b : 8d e7 80 STA $80e7 ; (tworks[0] + 5)
2e8e : 8d e8 80 STA $80e8 ; (tworks[0] + 6)
2e91 : 8d e9 80 STA $80e9 ; (tworks[0] + 7)
2e94 : 85 1b __ STA ACCU + 0 
2e96 : 85 1c __ STA ACCU + 1 
2e98 : ad 07 7d LDA $7d07 ; (tbitmap.data + 0)
2e9b : 85 43 __ STA T1 + 0 
2e9d : ad 08 7d LDA $7d08 ; (tbitmap.data + 1)
2ea0 : 85 44 __ STA T1 + 1 
2ea2 : a5 10 __ LDA P3 ; (len + 0)
2ea4 : d0 03 __ BNE $2ea9 ; (bmu_text.s7 + 0)
2ea6 : 4c b6 2f JMP $2fb6 ; (bmu_text.s5 + 0)
.s7:
2ea9 : a0 00 __ LDY #$00
.l8:
2eab : 84 1d __ STY ACCU + 2 
2ead : b1 0e __ LDA (P1),y ; (str + 0)
2eaf : 38 __ __ SEC
2eb0 : e9 20 __ SBC #$20
2eb2 : aa __ __ TAX
2eb3 : 18 __ __ CLC
2eb4 : a9 9c __ LDA #$9c
2eb6 : 7d dc 7a ADC $7adc,x ; (TinyFont[0] + 0)
2eb9 : 85 45 __ STA T6 + 0 
2ebb : bd 3c 7b LDA $7b3c,x ; (TinyFont[0] + 96)
2ebe : 29 03 __ AND #$03
2ec0 : 69 7b __ ADC #$7b
2ec2 : 85 46 __ STA T6 + 1 
2ec4 : bd 3c 7b LDA $7b3c,x ; (TinyFont[0] + 96)
2ec7 : 4a __ __ LSR
2ec8 : 4a __ __ LSR
2ec9 : 85 1e __ STA ACCU + 3 
2ecb : 38 __ __ SEC
2ecc : 65 1b __ ADC ACCU + 0 
2ece : 85 1b __ STA ACCU + 0 
2ed0 : 90 02 __ BCC $2ed4 ; (bmu_text.s19 + 0)
.s18:
2ed2 : e6 1c __ INC ACCU + 1 
.s19:
2ed4 : a9 00 __ LDA #$00
2ed6 : 85 47 __ STA T7 + 0 
2ed8 : a5 1e __ LDA ACCU + 3 
2eda : f0 73 __ BEQ $2f4f ; (bmu_text.s9 + 0)
.s16:
2edc : a6 0d __ LDX P0 ; (lx + 0)
2ede : a0 00 __ LDY #$00
.l12:
2ee0 : b1 45 __ LDA (T6 + 0),y 
2ee2 : 0a __ __ ASL
2ee3 : 2e e2 80 ROL $80e2 ; (tworks[0] + 0)
2ee6 : 0a __ __ ASL
2ee7 : 2e e3 80 ROL $80e3 ; (tworks[0] + 1)
2eea : 0a __ __ ASL
2eeb : 2e e4 80 ROL $80e4 ; (tworks[0] + 2)
2eee : 0a __ __ ASL
2eef : 2e e5 80 ROL $80e5 ; (tworks[0] + 3)
2ef2 : 0a __ __ ASL
2ef3 : 2e e6 80 ROL $80e6 ; (tworks[0] + 4)
2ef6 : 0a __ __ ASL
2ef7 : 2e e7 80 ROL $80e7 ; (tworks[0] + 5)
2efa : 0a __ __ ASL
2efb : 2e e8 80 ROL $80e8 ; (tworks[0] + 6)
2efe : 0a __ __ ASL
2eff : 2e e9 80 ROL $80e9 ; (tworks[0] + 7)
2f02 : e8 __ __ INX
2f03 : e0 08 __ CPX #$08
2f05 : d0 3e __ BNE $2f45 ; (bmu_text.s13 + 0)
.s14:
2f07 : ad e2 80 LDA $80e2 ; (tworks[0] + 0)
2f0a : a0 00 __ LDY #$00
2f0c : 91 43 __ STA (T1 + 0),y 
2f0e : ad e3 80 LDA $80e3 ; (tworks[0] + 1)
2f11 : c8 __ __ INY
2f12 : 91 43 __ STA (T1 + 0),y 
2f14 : ad e4 80 LDA $80e4 ; (tworks[0] + 2)
2f17 : c8 __ __ INY
2f18 : 91 43 __ STA (T1 + 0),y 
2f1a : ad e5 80 LDA $80e5 ; (tworks[0] + 3)
2f1d : c8 __ __ INY
2f1e : 91 43 __ STA (T1 + 0),y 
2f20 : ad e6 80 LDA $80e6 ; (tworks[0] + 4)
2f23 : c8 __ __ INY
2f24 : 91 43 __ STA (T1 + 0),y 
2f26 : ad e7 80 LDA $80e7 ; (tworks[0] + 5)
2f29 : c8 __ __ INY
2f2a : 91 43 __ STA (T1 + 0),y 
2f2c : ad e8 80 LDA $80e8 ; (tworks[0] + 6)
2f2f : c8 __ __ INY
2f30 : 91 43 __ STA (T1 + 0),y 
2f32 : ad e9 80 LDA $80e9 ; (tworks[0] + 7)
2f35 : c8 __ __ INY
2f36 : 91 43 __ STA (T1 + 0),y 
2f38 : 18 __ __ CLC
2f39 : a5 43 __ LDA T1 + 0 
2f3b : 69 08 __ ADC #$08
2f3d : 85 43 __ STA T1 + 0 
2f3f : 90 02 __ BCC $2f43 ; (bmu_text.s21 + 0)
.s20:
2f41 : e6 44 __ INC T1 + 1 
.s21:
2f43 : a2 00 __ LDX #$00
.s13:
2f45 : e6 47 __ INC T7 + 0 
2f47 : a4 47 __ LDY T7 + 0 
2f49 : c4 1e __ CPY ACCU + 3 
2f4b : 90 93 __ BCC $2ee0 ; (bmu_text.l12 + 0)
.s17:
2f4d : 86 0d __ STX P0 ; (lx + 0)
.s9:
2f4f : 0e e2 80 ASL $80e2 ; (tworks[0] + 0)
2f52 : 0e e3 80 ASL $80e3 ; (tworks[0] + 1)
2f55 : 0e e4 80 ASL $80e4 ; (tworks[0] + 2)
2f58 : 0e e5 80 ASL $80e5 ; (tworks[0] + 3)
2f5b : 0e e6 80 ASL $80e6 ; (tworks[0] + 4)
2f5e : 0e e7 80 ASL $80e7 ; (tworks[0] + 5)
2f61 : 0e e8 80 ASL $80e8 ; (tworks[0] + 6)
2f64 : 0e e9 80 ASL $80e9 ; (tworks[0] + 7)
2f67 : e6 0d __ INC P0 ; (lx + 0)
2f69 : a5 0d __ LDA P0 ; (lx + 0)
2f6b : c9 08 __ CMP #$08
2f6d : d0 3d __ BNE $2fac ; (bmu_text.s10 + 0)
.s11:
2f6f : ad e2 80 LDA $80e2 ; (tworks[0] + 0)
2f72 : a0 00 __ LDY #$00
2f74 : 84 0d __ STY P0 ; (lx + 0)
2f76 : 91 43 __ STA (T1 + 0),y 
2f78 : ad e3 80 LDA $80e3 ; (tworks[0] + 1)
2f7b : c8 __ __ INY
2f7c : 91 43 __ STA (T1 + 0),y 
2f7e : ad e4 80 LDA $80e4 ; (tworks[0] + 2)
2f81 : c8 __ __ INY
2f82 : 91 43 __ STA (T1 + 0),y 
2f84 : ad e5 80 LDA $80e5 ; (tworks[0] + 3)
2f87 : c8 __ __ INY
2f88 : 91 43 __ STA (T1 + 0),y 
2f8a : ad e6 80 LDA $80e6 ; (tworks[0] + 4)
2f8d : c8 __ __ INY
2f8e : 91 43 __ STA (T1 + 0),y 
2f90 : ad e7 80 LDA $80e7 ; (tworks[0] + 5)
2f93 : c8 __ __ INY
2f94 : 91 43 __ STA (T1 + 0),y 
2f96 : ad e8 80 LDA $80e8 ; (tworks[0] + 6)
2f99 : c8 __ __ INY
2f9a : 91 43 __ STA (T1 + 0),y 
2f9c : ad e9 80 LDA $80e9 ; (tworks[0] + 7)
2f9f : c8 __ __ INY
2fa0 : 91 43 __ STA (T1 + 0),y 
2fa2 : a5 43 __ LDA T1 + 0 
2fa4 : 69 07 __ ADC #$07
2fa6 : 85 43 __ STA T1 + 0 
2fa8 : 90 02 __ BCC $2fac ; (bmu_text.s10 + 0)
.s22:
2faa : e6 44 __ INC T1 + 1 
.s10:
2fac : a4 1d __ LDY ACCU + 2 
2fae : c8 __ __ INY
2faf : c4 10 __ CPY P3 ; (len + 0)
2fb1 : b0 03 __ BCS $2fb6 ; (bmu_text.s5 + 0)
2fb3 : 4c ab 2e JMP $2eab ; (bmu_text.l8 + 0)
.s5:
2fb6 : a6 0d __ LDX P0 ; (lx + 0)
2fb8 : e0 08 __ CPX #$08
2fba : b0 1d __ BCS $2fd9 ; (bmu_text.s6 + 0)
.l15:
2fbc : 0e e2 80 ASL $80e2 ; (tworks[0] + 0)
2fbf : 0e e3 80 ASL $80e3 ; (tworks[0] + 1)
2fc2 : 0e e4 80 ASL $80e4 ; (tworks[0] + 2)
2fc5 : 0e e5 80 ASL $80e5 ; (tworks[0] + 3)
2fc8 : 0e e6 80 ASL $80e6 ; (tworks[0] + 4)
2fcb : 0e e7 80 ASL $80e7 ; (tworks[0] + 5)
2fce : 0e e8 80 ASL $80e8 ; (tworks[0] + 6)
2fd1 : 0e e9 80 ASL $80e9 ; (tworks[0] + 7)
2fd4 : e8 __ __ INX
2fd5 : e0 08 __ CPX #$08
2fd7 : 90 e3 __ BCC $2fbc ; (bmu_text.l15 + 0)
.s6:
2fd9 : ad e2 80 LDA $80e2 ; (tworks[0] + 0)
2fdc : a0 00 __ LDY #$00
2fde : 91 43 __ STA (T1 + 0),y 
2fe0 : ad e3 80 LDA $80e3 ; (tworks[0] + 1)
2fe3 : c8 __ __ INY
2fe4 : 91 43 __ STA (T1 + 0),y 
2fe6 : ad e4 80 LDA $80e4 ; (tworks[0] + 2)
2fe9 : c8 __ __ INY
2fea : 91 43 __ STA (T1 + 0),y 
2fec : ad e5 80 LDA $80e5 ; (tworks[0] + 3)
2fef : c8 __ __ INY
2ff0 : 91 43 __ STA (T1 + 0),y 
2ff2 : ad e6 80 LDA $80e6 ; (tworks[0] + 4)
2ff5 : c8 __ __ INY
2ff6 : 91 43 __ STA (T1 + 0),y 
2ff8 : ad e7 80 LDA $80e7 ; (tworks[0] + 5)
2ffb : c8 __ __ INY
2ffc : 91 43 __ STA (T1 + 0),y 
2ffe : ad e8 80 LDA $80e8 ; (tworks[0] + 6)
3001 : c8 __ __ INY
3002 : 91 43 __ STA (T1 + 0),y 
3004 : ad e9 80 LDA $80e9 ; (tworks[0] + 7)
3007 : c8 __ __ INY
3008 : 91 43 __ STA (T1 + 0),y 
.s3:
300a : 60 __ __ RTS
--------------------------------------------------------------------
draw_gear: ; draw_gear(i16,i16,u8,u8,u8,u8,u8,u8,u8,u8)->void
;  88, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s1:
300b : a2 20 __ LDX #$20
300d : b5 53 __ LDA T0 + 0,x 
300f : 9d b0 bf STA $bfb0,x ; (draw_gear@stack + 0)
3012 : ca __ __ DEX
3013 : 10 f8 __ BPL $300d ; (draw_gear.s1 + 2)
.s4:
3015 : ad fd bf LDA $bffd ; (sstack + 19)
3018 : 85 5d __ STA T5 + 0 
301a : ad fc bf LDA $bffc ; (sstack + 18)
301d : 85 5e __ STA T6 + 0 
301f : ad f9 bf LDA $bff9 ; (sstack + 15)
3022 : 85 5f __ STA T7 + 0 
3024 : ad fb bf LDA $bffb ; (sstack + 17)
3027 : 85 60 __ STA T8 + 0 
3029 : 4a __ __ LSR
302a : 85 61 __ STA T9 + 0 
302c : a9 00 __ LDA #$00
302e : 85 62 __ STA T10 + 0 
3030 : 85 63 __ STA T11 + 0 
3032 : 85 64 __ STA T11 + 1 
3034 : 85 65 __ STA T12 + 0 
3036 : 85 66 __ STA T12 + 1 
3038 : 85 53 __ STA T0 + 0 
303a : 85 54 __ STA T0 + 1 
303c : 85 55 __ STA T1 + 0 
303e : 85 56 __ STA T1 + 1 
3040 : ae ff bf LDX $bfff ; (sstack + 21)
3043 : 86 71 __ STX T20 + 0 
3045 : ae fe bf LDX $bffe ; (sstack + 20)
3048 : 86 72 __ STX T21 + 0 
304a : ae fa bf LDX $bffa ; (sstack + 16)
304d : 86 73 __ STX T22 + 0 
304f : ae f7 bf LDX $bff7 ; (sstack + 13)
3052 : 86 67 __ STX T13 + 0 
.l5:
3054 : 85 1b __ STA ACCU + 0 
3056 : a9 00 __ LDA #$00
3058 : 85 1c __ STA ACCU + 1 
305a : a5 60 __ LDA T8 + 0 
305c : 20 7e 74 JSR $747e ; (mul16by8 + 0)
305f : 18 __ __ CLC
3060 : a5 1b __ LDA ACCU + 0 
3062 : 65 5f __ ADC T7 + 0 
3064 : 29 3f __ AND #$3f
3066 : 85 68 __ STA T14 + 0 
3068 : 18 __ __ CLC
3069 : 69 10 __ ADC #$10
306b : 29 3f __ AND #$3f
306d : aa __ __ TAX
306e : bd 0f 7d LDA $7d0f,x ; (sin64[0] + 0)
3071 : 85 57 __ STA T2 + 0 
3073 : 0a __ __ ASL
3074 : a9 00 __ LDA #$00
3076 : 85 04 __ STA WORK + 1 
3078 : 69 ff __ ADC #$ff
307a : 49 ff __ EOR #$ff
307c : 85 58 __ STA T2 + 1 
307e : a5 57 __ LDA T2 + 0 
3080 : 0a __ __ ASL
3081 : 85 1b __ STA ACCU + 0 
3083 : a5 58 __ LDA T2 + 1 
3085 : 2a __ __ ROL
3086 : 06 1b __ ASL ACCU + 0 
3088 : 2a __ __ ROL
3089 : 85 1c __ STA ACCU + 1 
308b : 20 2e 75 JSR $752e ; (divs16@proxy + 0)
308e : a5 1b __ LDA ACCU + 0 
3090 : 85 69 __ STA T15 + 0 
3092 : a5 1c __ LDA ACCU + 1 
3094 : 85 6a __ STA T15 + 1 
3096 : a6 68 __ LDX T14 + 0 
3098 : bd 0f 7d LDA $7d0f,x ; (sin64[0] + 0)
309b : 85 59 __ STA T3 + 0 
309d : 85 1b __ STA ACCU + 0 
309f : 29 80 __ AND #$80
30a1 : 10 02 __ BPL $30a5 ; (draw_gear.l5 + 81)
30a3 : a9 ff __ LDA #$ff
30a5 : 85 5a __ STA T3 + 1 
30a7 : 85 1c __ STA ACCU + 1 
30a9 : a5 5d __ LDA T5 + 0 
30ab : 20 7e 74 JSR $747e ; (mul16by8 + 0)
30ae : 20 5a 79 JSR $795a ; (divs16@proxy + 0)
30b1 : 18 __ __ CLC
30b2 : a5 1b __ LDA ACCU + 0 
30b4 : 69 58 __ ADC #$58
30b6 : 85 6b __ STA T16 + 0 
30b8 : a5 1c __ LDA ACCU + 1 
30ba : 69 00 __ ADC #$00
30bc : 85 6c __ STA T16 + 1 
30be : a5 57 __ LDA T2 + 0 
30c0 : 85 1b __ STA ACCU + 0 
30c2 : a5 58 __ LDA T2 + 1 
30c4 : 85 1c __ STA ACCU + 1 
30c6 : a5 5d __ LDA T5 + 0 
30c8 : 20 7e 74 JSR $747e ; (mul16by8 + 0)
30cb : 20 5a 79 JSR $795a ; (divs16@proxy + 0)
30ce : 18 __ __ CLC
30cf : a5 1b __ LDA ACCU + 0 
30d1 : 65 67 __ ADC T13 + 0 
30d3 : 85 6d __ STA T17 + 0 
30d5 : a5 1c __ LDA ACCU + 1 
30d7 : 69 00 __ ADC #$00
30d9 : 85 6e __ STA T17 + 1 
30db : a5 59 __ LDA T3 + 0 
30dd : 85 1b __ STA ACCU + 0 
30df : a5 5a __ LDA T3 + 1 
30e1 : 85 1c __ STA ACCU + 1 
30e3 : a5 5e __ LDA T6 + 0 
30e5 : 20 7e 74 JSR $747e ; (mul16by8 + 0)
30e8 : 20 5a 79 JSR $795a ; (divs16@proxy + 0)
30eb : 18 __ __ CLC
30ec : a5 1b __ LDA ACCU + 0 
30ee : 69 58 __ ADC #$58
30f0 : 85 5b __ STA T4 + 0 
30f2 : a5 1c __ LDA ACCU + 1 
30f4 : 69 00 __ ADC #$00
30f6 : 85 5c __ STA T4 + 1 
30f8 : a5 57 __ LDA T2 + 0 
30fa : 85 1b __ STA ACCU + 0 
30fc : a5 58 __ LDA T2 + 1 
30fe : 85 1c __ STA ACCU + 1 
3100 : a5 5e __ LDA T6 + 0 
3102 : 20 7e 74 JSR $747e ; (mul16by8 + 0)
3105 : 20 5a 79 JSR $795a ; (divs16@proxy + 0)
3108 : 18 __ __ CLC
3109 : a5 1b __ LDA ACCU + 0 
310b : 65 67 __ ADC T13 + 0 
310d : 85 57 __ STA T2 + 0 
310f : a5 1c __ LDA ACCU + 1 
3111 : 69 00 __ ADC #$00
3113 : 85 58 __ STA T2 + 1 
3115 : 38 __ __ SEC
3116 : a9 00 __ LDA #$00
3118 : e5 59 __ SBC T3 + 0 
311a : 85 1b __ STA ACCU + 0 
311c : a9 00 __ LDA #$00
311e : 85 04 __ STA WORK + 1 
3120 : e5 5a __ SBC T3 + 1 
3122 : 06 1b __ ASL ACCU + 0 
3124 : 2a __ __ ROL
3125 : 06 1b __ ASL ACCU + 0 
3127 : 2a __ __ ROL
3128 : 85 1c __ STA ACCU + 1 
312a : 20 2e 75 JSR $752e ; (divs16@proxy + 0)
312d : a5 1b __ LDA ACCU + 0 
312f : 85 59 __ STA T3 + 0 
3131 : a5 1c __ LDA ACCU + 1 
3133 : 85 5a __ STA T3 + 1 
3135 : 05 1b __ ORA ACCU + 0 
3137 : d0 12 __ BNE $314b ; (draw_gear.s6 + 0)
.s12:
3139 : 85 59 __ STA T3 + 0 
313b : 85 5a __ STA T3 + 1 
313d : a5 69 __ LDA T15 + 0 
313f : 05 6a __ ORA T15 + 1 
3141 : d0 08 __ BNE $314b ; (draw_gear.s6 + 0)
.s13:
3143 : a9 01 __ LDA #$01
3145 : 85 69 __ STA T15 + 0 
3147 : a9 00 __ LDA #$00
3149 : 85 6a __ STA T15 + 1 
.s6:
314b : a5 62 __ LDA T10 + 0 
314d : d0 1d __ BNE $316c ; (draw_gear.s11 + 0)
.s7:
314f : 38 __ __ SEC
3150 : a5 5b __ LDA T4 + 0 
3152 : e5 69 __ SBC T15 + 0 
3154 : 85 65 __ STA T12 + 0 
3156 : a5 5c __ LDA T4 + 1 
3158 : e5 6a __ SBC T15 + 1 
315a : 85 66 __ STA T12 + 1 
315c : 38 __ __ SEC
315d : a5 57 __ LDA T2 + 0 
315f : e5 59 __ SBC T3 + 0 
3161 : 85 63 __ STA T11 + 0 
3163 : a5 58 __ LDA T2 + 1 
3165 : e5 5a __ SBC T3 + 1 
3167 : 85 64 __ STA T11 + 1 
3169 : 4c ba 31 JMP $31ba ; (draw_gear.s8 + 0)
.s11:
316c : a5 53 __ LDA T0 + 0 
316e : 8d ee bf STA $bfee ; (sstack + 4)
3171 : a5 54 __ LDA T0 + 1 
3173 : 8d ef bf STA $bfef ; (sstack + 5)
3176 : a5 55 __ LDA T1 + 0 
3178 : 8d f0 bf STA $bff0 ; (sstack + 6)
317b : a5 56 __ LDA T1 + 1 
317d : 8d f1 bf STA $bff1 ; (sstack + 7)
3180 : a9 03 __ LDA #$03
3182 : 8d f6 bf STA $bff6 ; (sstack + 12)
3185 : a9 da __ LDA #$da
3187 : 8d ea bf STA $bfea ; (sstack + 0)
318a : a9 80 __ LDA #$80
318c : 8d eb bf STA $bfeb ; (sstack + 1)
318f : a9 4f __ LDA #$4f
3191 : 8d ec bf STA $bfec ; (sstack + 2)
3194 : a9 7d __ LDA #$7d
3196 : 8d ed bf STA $bfed ; (sstack + 3)
3199 : 38 __ __ SEC
319a : a5 57 __ LDA T2 + 0 
319c : e5 59 __ SBC T3 + 0 
319e : 8d f2 bf STA $bff2 ; (sstack + 8)
31a1 : a5 58 __ LDA T2 + 1 
31a3 : e5 5a __ SBC T3 + 1 
31a5 : 8d f3 bf STA $bff3 ; (sstack + 9)
31a8 : 38 __ __ SEC
31a9 : a5 5b __ LDA T4 + 0 
31ab : e5 69 __ SBC T15 + 0 
31ad : 8d f4 bf STA $bff4 ; (sstack + 10)
31b0 : a5 5c __ LDA T4 + 1 
31b2 : e5 6a __ SBC T15 + 1 
31b4 : 8d f5 bf STA $bff5 ; (sstack + 11)
31b7 : 20 ab 34 JSR $34ab ; (bm_line.s1 + 0)
.s8:
31ba : a9 03 __ LDA #$03
31bc : 8d f6 bf STA $bff6 ; (sstack + 12)
31bf : a9 da __ LDA #$da
31c1 : 8d ea bf STA $bfea ; (sstack + 0)
31c4 : a9 80 __ LDA #$80
31c6 : 8d eb bf STA $bfeb ; (sstack + 1)
31c9 : a9 4f __ LDA #$4f
31cb : 8d ec bf STA $bfec ; (sstack + 2)
31ce : a9 7d __ LDA #$7d
31d0 : 8d ed bf STA $bfed ; (sstack + 3)
31d3 : 38 __ __ SEC
31d4 : a5 57 __ LDA T2 + 0 
31d6 : e5 59 __ SBC T3 + 0 
31d8 : 8d ee bf STA $bfee ; (sstack + 4)
31db : a5 58 __ LDA T2 + 1 
31dd : e5 5a __ SBC T3 + 1 
31df : 8d ef bf STA $bfef ; (sstack + 5)
31e2 : 38 __ __ SEC
31e3 : a5 5b __ LDA T4 + 0 
31e5 : e5 69 __ SBC T15 + 0 
31e7 : 8d f0 bf STA $bff0 ; (sstack + 6)
31ea : a5 5c __ LDA T4 + 1 
31ec : e5 6a __ SBC T15 + 1 
31ee : 8d f1 bf STA $bff1 ; (sstack + 7)
31f1 : 38 __ __ SEC
31f2 : a5 6d __ LDA T17 + 0 
31f4 : e5 59 __ SBC T3 + 0 
31f6 : 85 53 __ STA T0 + 0 
31f8 : 8d f2 bf STA $bff2 ; (sstack + 8)
31fb : a5 6e __ LDA T17 + 1 
31fd : e5 5a __ SBC T3 + 1 
31ff : 85 54 __ STA T0 + 1 
3201 : 8d f3 bf STA $bff3 ; (sstack + 9)
3204 : 38 __ __ SEC
3205 : a5 6b __ LDA T16 + 0 
3207 : e5 69 __ SBC T15 + 0 
3209 : 85 6f __ STA T19 + 0 
320b : 8d f4 bf STA $bff4 ; (sstack + 10)
320e : a5 6c __ LDA T16 + 1 
3210 : e5 6a __ SBC T15 + 1 
3212 : 85 70 __ STA T19 + 1 
3214 : 8d f5 bf STA $bff5 ; (sstack + 11)
3217 : 20 ab 34 JSR $34ab ; (bm_line.s1 + 0)
321a : a9 da __ LDA #$da
321c : 8d ea bf STA $bfea ; (sstack + 0)
321f : a9 80 __ LDA #$80
3221 : 8d eb bf STA $bfeb ; (sstack + 1)
3224 : a9 4f __ LDA #$4f
3226 : 8d ec bf STA $bfec ; (sstack + 2)
3229 : a9 7d __ LDA #$7d
322b : 8d ed bf STA $bfed ; (sstack + 3)
322e : a5 53 __ LDA T0 + 0 
3230 : 8d ee bf STA $bfee ; (sstack + 4)
3233 : a5 54 __ LDA T0 + 1 
3235 : 8d ef bf STA $bfef ; (sstack + 5)
3238 : a5 6f __ LDA T19 + 0 
323a : 8d f0 bf STA $bff0 ; (sstack + 6)
323d : a5 70 __ LDA T19 + 1 
323f : 8d f1 bf STA $bff1 ; (sstack + 7)
3242 : a9 03 __ LDA #$03
3244 : 8d f6 bf STA $bff6 ; (sstack + 12)
3247 : 18 __ __ CLC
3248 : a5 6d __ LDA T17 + 0 
324a : 65 59 __ ADC T3 + 0 
324c : 85 53 __ STA T0 + 0 
324e : 8d f2 bf STA $bff2 ; (sstack + 8)
3251 : a5 6e __ LDA T17 + 1 
3253 : 65 5a __ ADC T3 + 1 
3255 : 85 54 __ STA T0 + 1 
3257 : 8d f3 bf STA $bff3 ; (sstack + 9)
325a : 18 __ __ CLC
325b : a5 6b __ LDA T16 + 0 
325d : 65 69 __ ADC T15 + 0 
325f : 85 6b __ STA T16 + 0 
3261 : 8d f4 bf STA $bff4 ; (sstack + 10)
3264 : a5 6c __ LDA T16 + 1 
3266 : 65 6a __ ADC T15 + 1 
3268 : 85 6c __ STA T16 + 1 
326a : 8d f5 bf STA $bff5 ; (sstack + 11)
326d : 20 ab 34 JSR $34ab ; (bm_line.s1 + 0)
3270 : a9 03 __ LDA #$03
3272 : 8d f6 bf STA $bff6 ; (sstack + 12)
3275 : 18 __ __ CLC
3276 : a5 5b __ LDA T4 + 0 
3278 : 65 69 __ ADC T15 + 0 
327a : 85 5b __ STA T4 + 0 
327c : 8d f4 bf STA $bff4 ; (sstack + 10)
327f : a5 5c __ LDA T4 + 1 
3281 : 65 6a __ ADC T15 + 1 
3283 : 85 5c __ STA T4 + 1 
3285 : 8d f5 bf STA $bff5 ; (sstack + 11)
3288 : 18 __ __ CLC
3289 : a5 57 __ LDA T2 + 0 
328b : 65 59 __ ADC T3 + 0 
328d : 85 57 __ STA T2 + 0 
328f : 8d f2 bf STA $bff2 ; (sstack + 8)
3292 : a5 58 __ LDA T2 + 1 
3294 : 65 5a __ ADC T3 + 1 
3296 : 85 58 __ STA T2 + 1 
3298 : 8d f3 bf STA $bff3 ; (sstack + 9)
329b : a9 da __ LDA #$da
329d : 8d ea bf STA $bfea ; (sstack + 0)
32a0 : a9 80 __ LDA #$80
32a2 : 8d eb bf STA $bfeb ; (sstack + 1)
32a5 : a9 4f __ LDA #$4f
32a7 : 8d ec bf STA $bfec ; (sstack + 2)
32aa : a9 7d __ LDA #$7d
32ac : 8d ed bf STA $bfed ; (sstack + 3)
32af : a5 53 __ LDA T0 + 0 
32b1 : 8d ee bf STA $bfee ; (sstack + 4)
32b4 : a5 54 __ LDA T0 + 1 
32b6 : 8d ef bf STA $bfef ; (sstack + 5)
32b9 : a5 6b __ LDA T16 + 0 
32bb : 8d f0 bf STA $bff0 ; (sstack + 6)
32be : a5 6c __ LDA T16 + 1 
32c0 : 8d f1 bf STA $bff1 ; (sstack + 7)
32c3 : 20 ab 34 JSR $34ab ; (bm_line.s1 + 0)
32c6 : a9 da __ LDA #$da
32c8 : 8d ea bf STA $bfea ; (sstack + 0)
32cb : a9 80 __ LDA #$80
32cd : 8d eb bf STA $bfeb ; (sstack + 1)
32d0 : a9 4f __ LDA #$4f
32d2 : 8d ec bf STA $bfec ; (sstack + 2)
32d5 : a9 7d __ LDA #$7d
32d7 : 8d ed bf STA $bfed ; (sstack + 3)
32da : a5 57 __ LDA T2 + 0 
32dc : 8d ee bf STA $bfee ; (sstack + 4)
32df : a5 58 __ LDA T2 + 1 
32e1 : 8d ef bf STA $bfef ; (sstack + 5)
32e4 : a5 5b __ LDA T4 + 0 
32e6 : 8d f0 bf STA $bff0 ; (sstack + 6)
32e9 : a5 5c __ LDA T4 + 1 
32eb : 8d f1 bf STA $bff1 ; (sstack + 7)
32ee : a9 03 __ LDA #$03
32f0 : 8d f6 bf STA $bff6 ; (sstack + 12)
32f3 : 18 __ __ CLC
32f4 : a5 61 __ LDA T9 + 0 
32f6 : 65 68 __ ADC T14 + 0 
32f8 : 29 3f __ AND #$3f
32fa : 85 53 __ STA T0 + 0 
32fc : 18 __ __ CLC
32fd : 69 10 __ ADC #$10
32ff : 29 3f __ AND #$3f
3301 : aa __ __ TAX
3302 : bd 0f 7d LDA $7d0f,x ; (sin64[0] + 0)
3305 : 85 1b __ STA ACCU + 0 
3307 : 29 80 __ AND #$80
3309 : 10 02 __ BPL $330d ; (draw_gear.s8 + 339)
330b : a9 ff __ LDA #$ff
330d : 85 1c __ STA ACCU + 1 
330f : a5 5e __ LDA T6 + 0 
3311 : 20 7e 74 JSR $747e ; (mul16by8 + 0)
3314 : 20 5a 79 JSR $795a ; (divs16@proxy + 0)
3317 : 18 __ __ CLC
3318 : a5 1b __ LDA ACCU + 0 
331a : 65 67 __ ADC T13 + 0 
331c : 85 57 __ STA T2 + 0 
331e : 8d f2 bf STA $bff2 ; (sstack + 8)
3321 : a5 1c __ LDA ACCU + 1 
3323 : 69 00 __ ADC #$00
3325 : 85 58 __ STA T2 + 1 
3327 : 8d f3 bf STA $bff3 ; (sstack + 9)
332a : a6 53 __ LDX T0 + 0 
332c : bd 0f 7d LDA $7d0f,x ; (sin64[0] + 0)
332f : 85 1b __ STA ACCU + 0 
3331 : 29 80 __ AND #$80
3333 : 10 02 __ BPL $3337 ; (draw_gear.s8 + 381)
3335 : a9 ff __ LDA #$ff
3337 : 85 1c __ STA ACCU + 1 
3339 : a5 5e __ LDA T6 + 0 
333b : 20 7e 74 JSR $747e ; (mul16by8 + 0)
333e : 20 5a 79 JSR $795a ; (divs16@proxy + 0)
3341 : 18 __ __ CLC
3342 : a5 1b __ LDA ACCU + 0 
3344 : 69 58 __ ADC #$58
3346 : 85 59 __ STA T3 + 0 
3348 : 8d f4 bf STA $bff4 ; (sstack + 10)
334b : a5 1c __ LDA ACCU + 1 
334d : 69 00 __ ADC #$00
334f : 85 5a __ STA T3 + 1 
3351 : 8d f5 bf STA $bff5 ; (sstack + 11)
3354 : 20 ab 34 JSR $34ab ; (bm_line.s1 + 0)
3357 : a5 57 __ LDA T2 + 0 
3359 : 85 53 __ STA T0 + 0 
335b : a5 58 __ LDA T2 + 1 
335d : 85 54 __ STA T0 + 1 
335f : a5 59 __ LDA T3 + 0 
3361 : 85 55 __ STA T1 + 0 
3363 : a5 5a __ LDA T3 + 1 
3365 : 85 56 __ STA T1 + 1 
3367 : e6 62 __ INC T10 + 0 
3369 : a5 62 __ LDA T10 + 0 
336b : c5 73 __ CMP T22 + 0 
336d : b0 03 __ BCS $3372 ; (draw_gear.s9 + 0)
336f : 4c 54 30 JMP $3054 ; (draw_gear.l5 + 0)
.s9:
3372 : a5 57 __ LDA T2 + 0 
3374 : 8d ee bf STA $bfee ; (sstack + 4)
3377 : a5 58 __ LDA T2 + 1 
3379 : 8d ef bf STA $bfef ; (sstack + 5)
337c : a5 59 __ LDA T3 + 0 
337e : 8d f0 bf STA $bff0 ; (sstack + 6)
3381 : a5 5a __ LDA T3 + 1 
3383 : 8d f1 bf STA $bff1 ; (sstack + 7)
3386 : a5 63 __ LDA T11 + 0 
3388 : 8d f2 bf STA $bff2 ; (sstack + 8)
338b : a5 64 __ LDA T11 + 1 
338d : 8d f3 bf STA $bff3 ; (sstack + 9)
3390 : a5 65 __ LDA T12 + 0 
3392 : 8d f4 bf STA $bff4 ; (sstack + 10)
3395 : a5 66 __ LDA T12 + 1 
3397 : 8d f5 bf STA $bff5 ; (sstack + 11)
339a : a9 03 __ LDA #$03
339c : 8d f6 bf STA $bff6 ; (sstack + 12)
339f : a9 da __ LDA #$da
33a1 : 8d ea bf STA $bfea ; (sstack + 0)
33a4 : a9 80 __ LDA #$80
33a6 : 8d eb bf STA $bfeb ; (sstack + 1)
33a9 : a9 4f __ LDA #$4f
33ab : 8d ec bf STA $bfec ; (sstack + 2)
33ae : a9 7d __ LDA #$7d
33b0 : 8d ed bf STA $bfed ; (sstack + 3)
33b3 : 20 ab 34 JSR $34ab ; (bm_line.s1 + 0)
33b6 : a5 71 __ LDA T20 + 0 
33b8 : 85 03 __ STA WORK + 0 
33ba : 85 62 __ STA T10 + 0 
33bc : a9 00 __ LDA #$00
33be : 85 5d __ STA T5 + 0 
33c0 : 85 1c __ STA ACCU + 1 
33c2 : 85 04 __ STA WORK + 1 
33c4 : a9 40 __ LDA #$40
33c6 : 85 1b __ STA ACCU + 0 
33c8 : 20 6d 75 JSR $756d ; (divmod + 0)
33cb : a5 1b __ LDA ACCU + 0 
33cd : 85 59 __ STA T3 + 0 
.l10:
33cf : a9 da __ LDA #$da
33d1 : 8d ea bf STA $bfea ; (sstack + 0)
33d4 : a9 80 __ LDA #$80
33d6 : 8d eb bf STA $bfeb ; (sstack + 1)
33d9 : a9 4f __ LDA #$4f
33db : 8d ec bf STA $bfec ; (sstack + 2)
33de : a9 7d __ LDA #$7d
33e0 : 8d ed bf STA $bfed ; (sstack + 3)
33e3 : a9 03 __ LDA #$03
33e5 : 8d f6 bf STA $bff6 ; (sstack + 12)
33e8 : a5 5d __ LDA T5 + 0 
33ea : 85 1b __ STA ACCU + 0 
33ec : a9 00 __ LDA #$00
33ee : 85 1c __ STA ACCU + 1 
33f0 : a5 59 __ LDA T3 + 0 
33f2 : 20 7e 74 JSR $747e ; (mul16by8 + 0)
33f5 : 18 __ __ CLC
33f6 : a5 1b __ LDA ACCU + 0 
33f8 : 65 5f __ ADC T7 + 0 
33fa : 29 3f __ AND #$3f
33fc : 85 53 __ STA T0 + 0 
33fe : 18 __ __ CLC
33ff : 69 10 __ ADC #$10
3401 : 29 3f __ AND #$3f
3403 : aa __ __ TAX
3404 : bd 0f 7d LDA $7d0f,x ; (sin64[0] + 0)
3407 : 85 55 __ STA T1 + 0 
3409 : 85 1b __ STA ACCU + 0 
340b : 29 80 __ AND #$80
340d : 10 02 __ BPL $3411 ; (draw_gear.l10 + 66)
340f : a9 ff __ LDA #$ff
3411 : 85 56 __ STA T1 + 1 
3413 : 85 1c __ STA ACCU + 1 
3415 : a5 72 __ LDA T21 + 0 
3417 : 20 7e 74 JSR $747e ; (mul16by8 + 0)
341a : 20 5a 79 JSR $795a ; (divs16@proxy + 0)
341d : 18 __ __ CLC
341e : a5 1b __ LDA ACCU + 0 
3420 : 65 67 __ ADC T13 + 0 
3422 : 8d ee bf STA $bfee ; (sstack + 4)
3425 : a5 1c __ LDA ACCU + 1 
3427 : 69 00 __ ADC #$00
3429 : 8d ef bf STA $bfef ; (sstack + 5)
342c : a6 53 __ LDX T0 + 0 
342e : bd 0f 7d LDA $7d0f,x ; (sin64[0] + 0)
3431 : 85 53 __ STA T0 + 0 
3433 : 85 1b __ STA ACCU + 0 
3435 : 29 80 __ AND #$80
3437 : 10 02 __ BPL $343b ; (draw_gear.l10 + 108)
3439 : a9 ff __ LDA #$ff
343b : 85 54 __ STA T0 + 1 
343d : 85 1c __ STA ACCU + 1 
343f : a5 72 __ LDA T21 + 0 
3441 : 20 7e 74 JSR $747e ; (mul16by8 + 0)
3444 : 20 5a 79 JSR $795a ; (divs16@proxy + 0)
3447 : 18 __ __ CLC
3448 : a5 1b __ LDA ACCU + 0 
344a : 69 58 __ ADC #$58
344c : 8d f0 bf STA $bff0 ; (sstack + 6)
344f : a5 1c __ LDA ACCU + 1 
3451 : 69 00 __ ADC #$00
3453 : 8d f1 bf STA $bff1 ; (sstack + 7)
3456 : a5 55 __ LDA T1 + 0 
3458 : 85 1b __ STA ACCU + 0 
345a : a5 56 __ LDA T1 + 1 
345c : 85 1c __ STA ACCU + 1 
345e : a5 5e __ LDA T6 + 0 
3460 : 20 7e 74 JSR $747e ; (mul16by8 + 0)
3463 : 20 5a 79 JSR $795a ; (divs16@proxy + 0)
3466 : 18 __ __ CLC
3467 : a5 1b __ LDA ACCU + 0 
3469 : 65 67 __ ADC T13 + 0 
346b : 8d f2 bf STA $bff2 ; (sstack + 8)
346e : a5 1c __ LDA ACCU + 1 
3470 : 69 00 __ ADC #$00
3472 : 8d f3 bf STA $bff3 ; (sstack + 9)
3475 : a5 53 __ LDA T0 + 0 
3477 : 85 1b __ STA ACCU + 0 
3479 : a5 54 __ LDA T0 + 1 
347b : 85 1c __ STA ACCU + 1 
347d : a5 5e __ LDA T6 + 0 
347f : 20 7e 74 JSR $747e ; (mul16by8 + 0)
3482 : 20 5a 79 JSR $795a ; (divs16@proxy + 0)
3485 : 18 __ __ CLC
3486 : a5 1b __ LDA ACCU + 0 
3488 : 69 58 __ ADC #$58
348a : 8d f4 bf STA $bff4 ; (sstack + 10)
348d : a5 1c __ LDA ACCU + 1 
348f : 69 00 __ ADC #$00
3491 : 8d f5 bf STA $bff5 ; (sstack + 11)
3494 : 20 ab 34 JSR $34ab ; (bm_line.s1 + 0)
3497 : e6 5d __ INC T5 + 0 
3499 : c6 62 __ DEC T10 + 0 
349b : f0 03 __ BEQ $34a0 ; (draw_gear.s3 + 0)
349d : 4c cf 33 JMP $33cf ; (draw_gear.l10 + 0)
.s3:
34a0 : a2 20 __ LDX #$20
34a2 : bd b0 bf LDA $bfb0,x ; (draw_gear@stack + 0)
34a5 : 95 53 __ STA T0 + 0,x 
34a7 : ca __ __ DEX
34a8 : 10 f8 __ BPL $34a2 ; (draw_gear.s3 + 2)
34aa : 60 __ __ RTS
--------------------------------------------------------------------
bm_line: ; bm_line(const struct Bitmap*,const struct ClipRect*,i16,i16,i16,i16,u8,enum LineOp)->void
; 116, "/home/xahmol/oscar64/include/gfx/bitmap.h"
.s1:
34ab : a2 0e __ LDX #$0e
34ad : b5 53 __ LDA T2 + 0,x 
34af : 9d db bf STA $bfdb,x ; (bm_line@stack + 0)
34b2 : ca __ __ DEX
34b3 : 10 f8 __ BPL $34ad ; (bm_line.s1 + 2)
.s4:
34b5 : ad f0 bf LDA $bff0 ; (sstack + 6)
34b8 : 85 55 __ STA T3 + 0 
34ba : ad f1 bf LDA $bff1 ; (sstack + 7)
34bd : 85 56 __ STA T3 + 1 
34bf : ad f4 bf LDA $bff4 ; (sstack + 10)
34c2 : 85 53 __ STA T2 + 0 
34c4 : 38 __ __ SEC
34c5 : e5 55 __ SBC T3 + 0 
34c7 : 85 57 __ STA T4 + 0 
34c9 : ad f5 bf LDA $bff5 ; (sstack + 11)
34cc : 85 54 __ STA T2 + 1 
34ce : e5 56 __ SBC T3 + 1 
34d0 : 85 58 __ STA T4 + 1 
34d2 : ad f6 bf LDA $bff6 ; (sstack + 12)
34d5 : 85 61 __ STA T10 + 0 
34d7 : ad ec bf LDA $bfec ; (sstack + 2)
34da : 85 59 __ STA T5 + 0 
34dc : ad ed bf LDA $bfed ; (sstack + 3)
34df : 85 5a __ STA T5 + 1 
34e1 : a0 00 __ LDY #$00
34e3 : b1 59 __ LDA (T5 + 0),y 
34e5 : 85 43 __ STA T0 + 0 
34e7 : c8 __ __ INY
34e8 : b1 59 __ LDA (T5 + 0),y 
34ea : 85 44 __ STA T0 + 1 
34ec : a0 04 __ LDY #$04
34ee : b1 59 __ LDA (T5 + 0),y 
34f0 : 85 45 __ STA T1 + 0 
34f2 : ad ee bf LDA $bfee ; (sstack + 4)
34f5 : 85 5d __ STA T7 + 0 
34f7 : ad ef bf LDA $bfef ; (sstack + 5)
34fa : 85 5e __ STA T7 + 1 
34fc : ad f2 bf LDA $bff2 ; (sstack + 8)
34ff : 85 5b __ STA T6 + 0 
3501 : 38 __ __ SEC
3502 : e5 5d __ SBC T7 + 0 
3504 : 85 5f __ STA T8 + 0 
3506 : ad f3 bf LDA $bff3 ; (sstack + 9)
3509 : 85 5c __ STA T6 + 1 
350b : c8 __ __ INY
350c : e5 5e __ SBC T7 + 1 
350e : 85 60 __ STA T8 + 1 
3510 : 30 07 __ BMI $3519 ; (bm_line.s5 + 0)
.s82:
3512 : 05 5f __ ORA T8 + 0 
3514 : f0 03 __ BEQ $3519 ; (bm_line.s5 + 0)
3516 : 4c 43 38 JMP $3843 ; (bm_line.s64 + 0)
.s5:
3519 : a5 5e __ LDA T7 + 1 
351b : 10 03 __ BPL $3520 ; (bm_line.s63 + 0)
351d : 4c 8f 36 JMP $368f ; (bm_line.s3 + 0)
.s63:
3520 : c5 44 __ CMP T0 + 1 
3522 : d0 04 __ BNE $3528 ; (bm_line.s62 + 0)
.s61:
3524 : a5 5d __ LDA T7 + 0 
3526 : c5 43 __ CMP T0 + 0 
.s62:
3528 : 90 f3 __ BCC $351d ; (bm_line.s5 + 4)
.s6:
352a : a5 5c __ LDA T6 + 1 
352c : 10 03 __ BPL $3531 ; (bm_line.s60 + 0)
352e : 4c ec 37 JMP $37ec ; (bm_line.s52 + 0)
.s60:
3531 : d1 59 __ CMP (T5 + 0),y 
3533 : d0 04 __ BNE $3539 ; (bm_line.s59 + 0)
.s58:
3535 : a5 5b __ LDA T6 + 0 
3537 : c5 45 __ CMP T1 + 0 
.s59:
3539 : b0 e2 __ BCS $351d ; (bm_line.s5 + 4)
.s7:
353b : a5 5c __ LDA T6 + 1 
353d : c5 44 __ CMP T0 + 1 
353f : d0 04 __ BNE $3545 ; (bm_line.s57 + 0)
.s56:
3541 : a5 5b __ LDA T6 + 0 
3543 : c5 43 __ CMP T0 + 0 
.s57:
3545 : 90 e7 __ BCC $352e ; (bm_line.s6 + 4)
.s8:
3547 : a5 5e __ LDA T7 + 1 
3549 : d1 59 __ CMP (T5 + 0),y 
354b : d0 04 __ BNE $3551 ; (bm_line.s54 + 0)
.s51:
354d : a5 5d __ LDA T7 + 0 
354f : c5 45 __ CMP T1 + 0 
.s54:
3551 : 90 4e __ BCC $35a1 ; (bm_line.s9 + 0)
.s50:
3553 : a5 57 __ LDA T4 + 0 
3555 : 85 0f __ STA P2 
3557 : a5 58 __ LDA T4 + 1 
3559 : 85 10 __ STA P3 
355b : a5 5f __ LDA T8 + 0 
355d : 85 11 __ STA P4 
355f : a5 60 __ LDA T8 + 1 
3561 : 85 12 __ STA P5 
3563 : 18 __ __ CLC
3564 : a5 5d __ LDA T7 + 0 
3566 : 69 01 __ ADC #$01
3568 : a8 __ __ TAY
3569 : a5 5e __ LDA T7 + 1 
356b : 69 00 __ ADC #$00
356d : aa __ __ TAX
356e : 98 __ __ TYA
356f : 38 __ __ SEC
3570 : a0 04 __ LDY #$04
3572 : f1 59 __ SBC (T5 + 0),y 
3574 : 85 0d __ STA P0 
3576 : 8a __ __ TXA
3577 : c8 __ __ INY
3578 : f1 59 __ SBC (T5 + 0),y 
357a : 85 0e __ STA P1 
357c : 20 25 39 JSR $3925 ; (lmuldiv16s.s4 + 0)
357f : 38 __ __ SEC
3580 : a5 55 __ LDA T3 + 0 
3582 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
3584 : 8d f0 bf STA $bff0 ; (sstack + 6)
3587 : a5 56 __ LDA T3 + 1 
3589 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
358b : 8d f1 bf STA $bff1 ; (sstack + 7)
358e : a0 04 __ LDY #$04
3590 : b1 59 __ LDA (T5 + 0),y 
3592 : 38 __ __ SEC
3593 : e9 01 __ SBC #$01
3595 : aa __ __ TAX
3596 : c8 __ __ INY
3597 : b1 59 __ LDA (T5 + 0),y 
3599 : 8e ee bf STX $bfee ; (sstack + 4)
359c : e9 00 __ SBC #$00
359e : 8d ef bf STA $bfef ; (sstack + 5)
.s9:
35a1 : a0 02 __ LDY #$02
35a3 : b1 59 __ LDA (T5 + 0),y 
35a5 : 85 43 __ STA T0 + 0 
35a7 : c8 __ __ INY
35a8 : b1 59 __ LDA (T5 + 0),y 
35aa : 85 44 __ STA T0 + 1 
35ac : a0 06 __ LDY #$06
35ae : b1 59 __ LDA (T5 + 0),y 
35b0 : 85 45 __ STA T1 + 0 
35b2 : c8 __ __ INY
35b3 : a5 58 __ LDA T4 + 1 
35b5 : 30 07 __ BMI $35be ; (bm_line.s10 + 0)
.s49:
35b7 : 05 57 __ ORA T4 + 0 
35b9 : f0 03 __ BEQ $35be ; (bm_line.s10 + 0)
35bb : 4c f4 36 JMP $36f4 ; (bm_line.s30 + 0)
.s10:
35be : ad f0 bf LDA $bff0 ; (sstack + 6)
35c1 : 85 55 __ STA T3 + 0 
35c3 : ad f1 bf LDA $bff1 ; (sstack + 7)
35c6 : 10 03 __ BPL $35cb ; (bm_line.s29 + 0)
35c8 : 4c 8f 36 JMP $368f ; (bm_line.s3 + 0)
.s29:
35cb : 85 56 __ STA T3 + 1 
35cd : c5 44 __ CMP T0 + 1 
35cf : d0 04 __ BNE $35d5 ; (bm_line.s28 + 0)
.s27:
35d1 : a5 55 __ LDA T3 + 0 
35d3 : c5 43 __ CMP T0 + 0 
.s28:
35d5 : 90 f1 __ BCC $35c8 ; (bm_line.s10 + 10)
.s11:
35d7 : ad f5 bf LDA $bff5 ; (sstack + 11)
35da : 10 03 __ BPL $35df ; (bm_line.s26 + 0)
35dc : 4c 9a 36 JMP $369a ; (bm_line.s17 + 0)
.s26:
35df : d1 59 __ CMP (T5 + 0),y 
35e1 : d0 05 __ BNE $35e8 ; (bm_line.s25 + 0)
.s24:
35e3 : ad f4 bf LDA $bff4 ; (sstack + 10)
35e6 : c5 45 __ CMP T1 + 0 
.s25:
35e8 : b0 de __ BCS $35c8 ; (bm_line.s10 + 10)
.s12:
35ea : ad f5 bf LDA $bff5 ; (sstack + 11)
35ed : 30 ed __ BMI $35dc ; (bm_line.s11 + 5)
.s23:
35ef : c5 44 __ CMP T0 + 1 
35f1 : d0 05 __ BNE $35f8 ; (bm_line.s22 + 0)
.s21:
35f3 : ad f4 bf LDA $bff4 ; (sstack + 10)
35f6 : c5 43 __ CMP T0 + 0 
.s22:
35f8 : 90 e2 __ BCC $35dc ; (bm_line.s11 + 5)
.s13:
35fa : a5 56 __ LDA T3 + 1 
35fc : d1 59 __ CMP (T5 + 0),y 
35fe : d0 04 __ BNE $3604 ; (bm_line.s19 + 0)
.s16:
3600 : a5 55 __ LDA T3 + 0 
3602 : c5 45 __ CMP T1 + 0 
.s19:
3604 : 90 50 __ BCC $3656 ; (bm_line.s14 + 0)
.s15:
3606 : a5 5f __ LDA T8 + 0 
3608 : 85 0f __ STA P2 
360a : a5 60 __ LDA T8 + 1 
360c : 85 10 __ STA P3 
360e : a5 57 __ LDA T4 + 0 
3610 : 85 11 __ STA P4 
3612 : a5 58 __ LDA T4 + 1 
3614 : 85 12 __ STA P5 
3616 : 18 __ __ CLC
3617 : a5 55 __ LDA T3 + 0 
3619 : 69 01 __ ADC #$01
361b : a8 __ __ TAY
361c : a5 56 __ LDA T3 + 1 
361e : 69 00 __ ADC #$00
3620 : aa __ __ TAX
3621 : 98 __ __ TYA
3622 : 38 __ __ SEC
3623 : a0 06 __ LDY #$06
3625 : f1 59 __ SBC (T5 + 0),y 
3627 : 85 0d __ STA P0 
3629 : 8a __ __ TXA
362a : c8 __ __ INY
362b : f1 59 __ SBC (T5 + 0),y 
362d : 85 0e __ STA P1 
362f : 20 25 39 JSR $3925 ; (lmuldiv16s.s4 + 0)
3632 : ad ee bf LDA $bfee ; (sstack + 4)
3635 : 38 __ __ SEC
3636 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
3638 : 8d ee bf STA $bfee ; (sstack + 4)
363b : ad ef bf LDA $bfef ; (sstack + 5)
363e : e5 1c __ SBC ACCU + 1 ; (clip + 1)
3640 : 8d ef bf STA $bfef ; (sstack + 5)
3643 : a0 06 __ LDY #$06
3645 : b1 59 __ LDA (T5 + 0),y 
3647 : 38 __ __ SEC
3648 : e9 01 __ SBC #$01
364a : aa __ __ TAX
364b : c8 __ __ INY
364c : b1 59 __ LDA (T5 + 0),y 
364e : 8e f0 bf STX $bff0 ; (sstack + 6)
3651 : e9 00 __ SBC #$00
3653 : 8d f1 bf STA $bff1 ; (sstack + 7)
.s14:
3656 : ad ea bf LDA $bfea ; (sstack + 0)
3659 : 85 0d __ STA P0 
365b : ad eb bf LDA $bfeb ; (sstack + 1)
365e : 85 0e __ STA P1 
3660 : ad ee bf LDA $bfee ; (sstack + 4)
3663 : 85 0f __ STA P2 
3665 : ad ef bf LDA $bfef ; (sstack + 5)
3668 : 85 10 __ STA P3 
366a : ad f0 bf LDA $bff0 ; (sstack + 6)
366d : 85 11 __ STA P4 
366f : ad f1 bf LDA $bff1 ; (sstack + 7)
3672 : 85 12 __ STA P5 
3674 : ad f2 bf LDA $bff2 ; (sstack + 8)
3677 : 85 13 __ STA P6 
3679 : ad f3 bf LDA $bff3 ; (sstack + 9)
367c : 85 14 __ STA P7 
367e : ad f4 bf LDA $bff4 ; (sstack + 10)
3681 : 85 15 __ STA P8 
3683 : ad f5 bf LDA $bff5 ; (sstack + 11)
3686 : 85 16 __ STA P9 
3688 : a5 61 __ LDA T10 + 0 
368a : 85 18 __ STA P11 
368c : 20 e4 39 JSR $39e4 ; (bmu_line.s4 + 0)
.s3:
368f : a2 0e __ LDX #$0e
3691 : bd db bf LDA $bfdb,x ; (bm_line@stack + 0)
3694 : 95 53 __ STA T2 + 0,x 
3696 : ca __ __ DEX
3697 : 10 f8 __ BPL $3691 ; (bm_line.s3 + 2)
3699 : 60 __ __ RTS
.s17:
369a : a5 5f __ LDA T8 + 0 
369c : 85 0f __ STA P2 
369e : a5 60 __ LDA T8 + 1 
36a0 : 85 10 __ STA P3 
36a2 : a5 57 __ LDA T4 + 0 
36a4 : 85 11 __ STA P4 
36a6 : a5 58 __ LDA T4 + 1 
36a8 : 85 12 __ STA P5 
36aa : 38 __ __ SEC
36ab : a5 43 __ LDA T0 + 0 
36ad : ed f4 bf SBC $bff4 ; (sstack + 10)
36b0 : 85 0d __ STA P0 
36b2 : a5 44 __ LDA T0 + 1 
36b4 : ed f5 bf SBC $bff5 ; (sstack + 11)
36b7 : 85 0e __ STA P1 
36b9 : 20 25 39 JSR $3925 ; (lmuldiv16s.s4 + 0)
36bc : a0 02 __ LDY #$02
36be : b1 59 __ LDA (T5 + 0),y 
36c0 : 8d f4 bf STA $bff4 ; (sstack + 10)
36c3 : c8 __ __ INY
36c4 : b1 59 __ LDA (T5 + 0),y 
36c6 : 8d f5 bf STA $bff5 ; (sstack + 11)
36c9 : ad f2 bf LDA $bff2 ; (sstack + 8)
36cc : 18 __ __ CLC
36cd : 65 1b __ ADC ACCU + 0 ; (clip + 0)
36cf : 8d f2 bf STA $bff2 ; (sstack + 8)
36d2 : ad f3 bf LDA $bff3 ; (sstack + 9)
36d5 : 65 1c __ ADC ACCU + 1 ; (clip + 1)
36d7 : 8d f3 bf STA $bff3 ; (sstack + 9)
36da : a0 07 __ LDY #$07
36dc : b1 59 __ LDA (T5 + 0),y 
36de : 10 03 __ BPL $36e3 ; (bm_line.s20 + 0)
36e0 : 4c 06 36 JMP $3606 ; (bm_line.s15 + 0)
.s20:
36e3 : a5 56 __ LDA T3 + 1 
36e5 : d1 59 __ CMP (T5 + 0),y 
36e7 : f0 03 __ BEQ $36ec ; (bm_line.s18 + 0)
36e9 : 4c 04 36 JMP $3604 ; (bm_line.s19 + 0)
.s18:
36ec : a5 55 __ LDA T3 + 0 
36ee : 88 __ __ DEY
36ef : d1 59 __ CMP (T5 + 0),y 
36f1 : 4c 04 36 JMP $3604 ; (bm_line.s19 + 0)
.s30:
36f4 : ad f4 bf LDA $bff4 ; (sstack + 10)
36f7 : 85 55 __ STA T3 + 0 
36f9 : ad f5 bf LDA $bff5 ; (sstack + 11)
36fc : 30 91 __ BMI $368f ; (bm_line.s3 + 0)
.s48:
36fe : 85 56 __ STA T3 + 1 
3700 : c5 44 __ CMP T0 + 1 
3702 : d0 04 __ BNE $3708 ; (bm_line.s47 + 0)
.s46:
3704 : a5 55 __ LDA T3 + 0 
3706 : c5 43 __ CMP T0 + 0 
.s47:
3708 : 90 85 __ BCC $368f ; (bm_line.s3 + 0)
.s31:
370a : ad f1 bf LDA $bff1 ; (sstack + 7)
370d : 10 03 __ BPL $3712 ; (bm_line.s45 + 0)
370f : 4c 92 37 JMP $3792 ; (bm_line.s36 + 0)
.s45:
3712 : d1 59 __ CMP (T5 + 0),y 
3714 : d0 05 __ BNE $371b ; (bm_line.s44 + 0)
.s43:
3716 : ad f0 bf LDA $bff0 ; (sstack + 6)
3719 : c5 45 __ CMP T1 + 0 
.s44:
371b : 90 03 __ BCC $3720 ; (bm_line.s32 + 0)
371d : 4c 8f 36 JMP $368f ; (bm_line.s3 + 0)
.s32:
3720 : ad f1 bf LDA $bff1 ; (sstack + 7)
3723 : 30 6d __ BMI $3792 ; (bm_line.s36 + 0)
.s42:
3725 : c5 44 __ CMP T0 + 1 
3727 : d0 05 __ BNE $372e ; (bm_line.s41 + 0)
.s40:
3729 : ad f0 bf LDA $bff0 ; (sstack + 6)
372c : c5 43 __ CMP T0 + 0 
.s41:
372e : 90 62 __ BCC $3792 ; (bm_line.s36 + 0)
.s33:
3730 : a5 56 __ LDA T3 + 1 
3732 : d1 59 __ CMP (T5 + 0),y 
3734 : d0 04 __ BNE $373a ; (bm_line.s38 + 0)
.s35:
3736 : a5 55 __ LDA T3 + 0 
3738 : c5 45 __ CMP T1 + 0 
.s38:
373a : b0 03 __ BCS $373f ; (bm_line.s34 + 0)
373c : 4c 56 36 JMP $3656 ; (bm_line.s14 + 0)
.s34:
373f : a5 5f __ LDA T8 + 0 
3741 : 85 0f __ STA P2 
3743 : a5 60 __ LDA T8 + 1 
3745 : 85 10 __ STA P3 
3747 : a5 57 __ LDA T4 + 0 
3749 : 85 11 __ STA P4 
374b : a5 58 __ LDA T4 + 1 
374d : 85 12 __ STA P5 
374f : 18 __ __ CLC
3750 : a5 55 __ LDA T3 + 0 
3752 : 69 01 __ ADC #$01
3754 : a8 __ __ TAY
3755 : a5 56 __ LDA T3 + 1 
3757 : 69 00 __ ADC #$00
3759 : aa __ __ TAX
375a : 98 __ __ TYA
375b : 38 __ __ SEC
375c : a0 06 __ LDY #$06
375e : f1 59 __ SBC (T5 + 0),y 
3760 : 85 0d __ STA P0 
3762 : 8a __ __ TXA
3763 : c8 __ __ INY
3764 : f1 59 __ SBC (T5 + 0),y 
3766 : 85 0e __ STA P1 
3768 : 20 25 39 JSR $3925 ; (lmuldiv16s.s4 + 0)
376b : ad f2 bf LDA $bff2 ; (sstack + 8)
376e : 38 __ __ SEC
376f : e5 1b __ SBC ACCU + 0 ; (clip + 0)
3771 : 8d f2 bf STA $bff2 ; (sstack + 8)
3774 : ad f3 bf LDA $bff3 ; (sstack + 9)
3777 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
3779 : 8d f3 bf STA $bff3 ; (sstack + 9)
377c : a0 06 __ LDY #$06
377e : b1 59 __ LDA (T5 + 0),y 
3780 : 38 __ __ SEC
3781 : e9 01 __ SBC #$01
3783 : aa __ __ TAX
3784 : c8 __ __ INY
3785 : b1 59 __ LDA (T5 + 0),y 
3787 : 8e f4 bf STX $bff4 ; (sstack + 10)
378a : e9 00 __ SBC #$00
378c : 8d f5 bf STA $bff5 ; (sstack + 11)
378f : 4c 56 36 JMP $3656 ; (bm_line.s14 + 0)
.s36:
3792 : a5 5f __ LDA T8 + 0 
3794 : 85 0f __ STA P2 
3796 : a5 60 __ LDA T8 + 1 
3798 : 85 10 __ STA P3 
379a : a5 57 __ LDA T4 + 0 
379c : 85 11 __ STA P4 
379e : a5 58 __ LDA T4 + 1 
37a0 : 85 12 __ STA P5 
37a2 : 38 __ __ SEC
37a3 : a5 43 __ LDA T0 + 0 
37a5 : ed f0 bf SBC $bff0 ; (sstack + 6)
37a8 : 85 0d __ STA P0 
37aa : a5 44 __ LDA T0 + 1 
37ac : ed f1 bf SBC $bff1 ; (sstack + 7)
37af : 85 0e __ STA P1 
37b1 : 20 25 39 JSR $3925 ; (lmuldiv16s.s4 + 0)
37b4 : a0 02 __ LDY #$02
37b6 : b1 59 __ LDA (T5 + 0),y 
37b8 : 8d f0 bf STA $bff0 ; (sstack + 6)
37bb : c8 __ __ INY
37bc : b1 59 __ LDA (T5 + 0),y 
37be : 8d f1 bf STA $bff1 ; (sstack + 7)
37c1 : ad ee bf LDA $bfee ; (sstack + 4)
37c4 : 18 __ __ CLC
37c5 : 65 1b __ ADC ACCU + 0 ; (clip + 0)
37c7 : 8d ee bf STA $bfee ; (sstack + 4)
37ca : ad ef bf LDA $bfef ; (sstack + 5)
37cd : 65 1c __ ADC ACCU + 1 ; (clip + 1)
37cf : 8d ef bf STA $bfef ; (sstack + 5)
37d2 : a0 07 __ LDY #$07
37d4 : b1 59 __ LDA (T5 + 0),y 
37d6 : 10 03 __ BPL $37db ; (bm_line.s39 + 0)
37d8 : 4c 3f 37 JMP $373f ; (bm_line.s34 + 0)
.s39:
37db : a5 56 __ LDA T3 + 1 
37dd : d1 59 __ CMP (T5 + 0),y 
37df : f0 03 __ BEQ $37e4 ; (bm_line.s37 + 0)
37e1 : 4c 3a 37 JMP $373a ; (bm_line.s38 + 0)
.s37:
37e4 : a5 55 __ LDA T3 + 0 
37e6 : 88 __ __ DEY
37e7 : d1 59 __ CMP (T5 + 0),y 
37e9 : 4c 3a 37 JMP $373a ; (bm_line.s38 + 0)
.s52:
37ec : a5 57 __ LDA T4 + 0 
37ee : 85 0f __ STA P2 
37f0 : a5 58 __ LDA T4 + 1 
37f2 : 85 10 __ STA P3 
37f4 : a5 5f __ LDA T8 + 0 
37f6 : 85 11 __ STA P4 
37f8 : a5 60 __ LDA T8 + 1 
37fa : 85 12 __ STA P5 
37fc : 38 __ __ SEC
37fd : a5 43 __ LDA T0 + 0 
37ff : e5 5b __ SBC T6 + 0 
3801 : 85 0d __ STA P0 
3803 : a5 44 __ LDA T0 + 1 
3805 : e5 5c __ SBC T6 + 1 
3807 : 85 0e __ STA P1 
3809 : 20 25 39 JSR $3925 ; (lmuldiv16s.s4 + 0)
380c : 18 __ __ CLC
380d : a5 1b __ LDA ACCU + 0 ; (clip + 0)
380f : 65 53 __ ADC T2 + 0 
3811 : aa __ __ TAX
3812 : a0 00 __ LDY #$00
3814 : b1 59 __ LDA (T5 + 0),y 
3816 : 8d f2 bf STA $bff2 ; (sstack + 8)
3819 : c8 __ __ INY
381a : b1 59 __ LDA (T5 + 0),y 
381c : 8e f4 bf STX $bff4 ; (sstack + 10)
381f : 8d f3 bf STA $bff3 ; (sstack + 9)
3822 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
3824 : 65 54 __ ADC T2 + 1 
3826 : 8d f5 bf STA $bff5 ; (sstack + 11)
3829 : a0 05 __ LDY #$05
382b : b1 59 __ LDA (T5 + 0),y 
382d : 10 03 __ BPL $3832 ; (bm_line.s55 + 0)
382f : 4c 53 35 JMP $3553 ; (bm_line.s50 + 0)
.s55:
3832 : a5 5e __ LDA T7 + 1 
3834 : d1 59 __ CMP (T5 + 0),y 
3836 : f0 03 __ BEQ $383b ; (bm_line.s53 + 0)
3838 : 4c 51 35 JMP $3551 ; (bm_line.s54 + 0)
.s53:
383b : a5 5d __ LDA T7 + 0 
383d : 88 __ __ DEY
383e : d1 59 __ CMP (T5 + 0),y 
3840 : 4c 51 35 JMP $3551 ; (bm_line.s54 + 0)
.s64:
3843 : a5 5c __ LDA T6 + 1 
3845 : 10 03 __ BPL $384a ; (bm_line.s81 + 0)
3847 : 4c 8f 36 JMP $368f ; (bm_line.s3 + 0)
.s81:
384a : c5 44 __ CMP T0 + 1 
384c : d0 04 __ BNE $3852 ; (bm_line.s80 + 0)
.s79:
384e : a5 5b __ LDA T6 + 0 
3850 : c5 43 __ CMP T0 + 0 
.s80:
3852 : 90 f3 __ BCC $3847 ; (bm_line.s64 + 4)
.s65:
3854 : a5 5e __ LDA T7 + 1 
3856 : 30 76 __ BMI $38ce ; (bm_line.s70 + 0)
.s78:
3858 : d1 59 __ CMP (T5 + 0),y 
385a : d0 04 __ BNE $3860 ; (bm_line.s77 + 0)
.s76:
385c : a5 5d __ LDA T7 + 0 
385e : c5 45 __ CMP T1 + 0 
.s77:
3860 : b0 e5 __ BCS $3847 ; (bm_line.s64 + 4)
.s66:
3862 : a5 5e __ LDA T7 + 1 
3864 : c5 44 __ CMP T0 + 1 
3866 : d0 04 __ BNE $386c ; (bm_line.s75 + 0)
.s74:
3868 : a5 5d __ LDA T7 + 0 
386a : c5 43 __ CMP T0 + 0 
.s75:
386c : 90 60 __ BCC $38ce ; (bm_line.s70 + 0)
.s67:
386e : a5 5c __ LDA T6 + 1 
3870 : d1 59 __ CMP (T5 + 0),y 
3872 : d0 04 __ BNE $3878 ; (bm_line.s72 + 0)
.s69:
3874 : a5 5b __ LDA T6 + 0 
3876 : c5 45 __ CMP T1 + 0 
.s72:
3878 : b0 03 __ BCS $387d ; (bm_line.s68 + 0)
387a : 4c a1 35 JMP $35a1 ; (bm_line.s9 + 0)
.s68:
387d : a5 57 __ LDA T4 + 0 
387f : 85 0f __ STA P2 
3881 : a5 58 __ LDA T4 + 1 
3883 : 85 10 __ STA P3 
3885 : a5 5f __ LDA T8 + 0 
3887 : 85 11 __ STA P4 
3889 : a5 60 __ LDA T8 + 1 
388b : 85 12 __ STA P5 
388d : 18 __ __ CLC
388e : a5 5b __ LDA T6 + 0 
3890 : 69 01 __ ADC #$01
3892 : a8 __ __ TAY
3893 : a5 5c __ LDA T6 + 1 
3895 : 69 00 __ ADC #$00
3897 : aa __ __ TAX
3898 : 98 __ __ TYA
3899 : 38 __ __ SEC
389a : a0 04 __ LDY #$04
389c : f1 59 __ SBC (T5 + 0),y 
389e : 85 0d __ STA P0 
38a0 : 8a __ __ TXA
38a1 : c8 __ __ INY
38a2 : f1 59 __ SBC (T5 + 0),y 
38a4 : 85 0e __ STA P1 
38a6 : 20 25 39 JSR $3925 ; (lmuldiv16s.s4 + 0)
38a9 : 38 __ __ SEC
38aa : a5 53 __ LDA T2 + 0 
38ac : e5 1b __ SBC ACCU + 0 ; (clip + 0)
38ae : 8d f4 bf STA $bff4 ; (sstack + 10)
38b1 : a5 54 __ LDA T2 + 1 
38b3 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
38b5 : 8d f5 bf STA $bff5 ; (sstack + 11)
38b8 : a0 04 __ LDY #$04
38ba : b1 59 __ LDA (T5 + 0),y 
38bc : 38 __ __ SEC
38bd : e9 01 __ SBC #$01
38bf : aa __ __ TAX
38c0 : c8 __ __ INY
38c1 : b1 59 __ LDA (T5 + 0),y 
38c3 : 8e f2 bf STX $bff2 ; (sstack + 8)
38c6 : e9 00 __ SBC #$00
38c8 : 8d f3 bf STA $bff3 ; (sstack + 9)
38cb : 4c a1 35 JMP $35a1 ; (bm_line.s9 + 0)
.s70:
38ce : a5 57 __ LDA T4 + 0 
38d0 : 85 0f __ STA P2 
38d2 : a5 58 __ LDA T4 + 1 
38d4 : 85 10 __ STA P3 
38d6 : a5 5f __ LDA T8 + 0 
38d8 : 85 11 __ STA P4 
38da : a5 60 __ LDA T8 + 1 
38dc : 85 12 __ STA P5 
38de : 38 __ __ SEC
38df : a5 43 __ LDA T0 + 0 
38e1 : e5 5d __ SBC T7 + 0 
38e3 : 85 0d __ STA P0 
38e5 : a5 44 __ LDA T0 + 1 
38e7 : e5 5e __ SBC T7 + 1 
38e9 : 85 0e __ STA P1 
38eb : 20 25 39 JSR $3925 ; (lmuldiv16s.s4 + 0)
38ee : 18 __ __ CLC
38ef : a5 1b __ LDA ACCU + 0 ; (clip + 0)
38f1 : 65 55 __ ADC T3 + 0 
38f3 : aa __ __ TAX
38f4 : a0 00 __ LDY #$00
38f6 : b1 59 __ LDA (T5 + 0),y 
38f8 : 8d ee bf STA $bfee ; (sstack + 4)
38fb : c8 __ __ INY
38fc : b1 59 __ LDA (T5 + 0),y 
38fe : 8e f0 bf STX $bff0 ; (sstack + 6)
3901 : 8d ef bf STA $bfef ; (sstack + 5)
3904 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
3906 : 65 56 __ ADC T3 + 1 
3908 : 8d f1 bf STA $bff1 ; (sstack + 7)
390b : a0 05 __ LDY #$05
390d : b1 59 __ LDA (T5 + 0),y 
390f : 10 03 __ BPL $3914 ; (bm_line.s73 + 0)
3911 : 4c 7d 38 JMP $387d ; (bm_line.s68 + 0)
.s73:
3914 : a5 5c __ LDA T6 + 1 
3916 : d1 59 __ CMP (T5 + 0),y 
3918 : f0 03 __ BEQ $391d ; (bm_line.s71 + 0)
391a : 4c 78 38 JMP $3878 ; (bm_line.s72 + 0)
.s71:
391d : a5 5b __ LDA T6 + 0 
391f : 88 __ __ DEY
3920 : d1 59 __ CMP (T5 + 0),y 
3922 : 4c 78 38 JMP $3878 ; (bm_line.s72 + 0)
--------------------------------------------------------------------
lmuldiv16s: ; lmuldiv16s(i16,i16,i16)->i16
;  42, "/home/xahmol/oscar64/include/fixmath.h"
.s4:
3925 : a9 00 __ LDA #$00
3927 : 24 0e __ BIT P1 ; (a + 1)
3929 : 10 0d __ BPL $3938 ; (lmuldiv16s.s5 + 0)
.s10:
392b : 38 __ __ SEC
392c : e5 0d __ SBC P0 ; (a + 0)
392e : 85 0d __ STA P0 ; (a + 0)
3930 : a9 00 __ LDA #$00
3932 : e5 0e __ SBC P1 ; (a + 1)
3934 : 85 0e __ STA P1 ; (a + 1)
3936 : a9 01 __ LDA #$01
.s5:
3938 : 85 43 __ STA T1 + 0 
393a : 24 10 __ BIT P3 ; (b + 1)
393c : 10 14 __ BPL $3952 ; (lmuldiv16s.s6 + 0)
.s9:
393e : 38 __ __ SEC
393f : a9 00 __ LDA #$00
3941 : e5 0f __ SBC P2 ; (b + 0)
3943 : 85 0f __ STA P2 ; (b + 0)
3945 : a9 00 __ LDA #$00
3947 : e5 10 __ SBC P3 ; (b + 1)
3949 : 85 10 __ STA P3 ; (b + 1)
394b : a9 00 __ LDA #$00
394d : c5 43 __ CMP T1 + 0 
394f : 2a __ __ ROL
3950 : 85 43 __ STA T1 + 0 
.s6:
3952 : 24 12 __ BIT P5 ; (c + 1)
3954 : 10 14 __ BPL $396a ; (lmuldiv16s.s7 + 0)
.s8:
3956 : 38 __ __ SEC
3957 : a9 00 __ LDA #$00
3959 : e5 11 __ SBC P4 ; (c + 0)
395b : 85 11 __ STA P4 ; (c + 0)
395d : a9 00 __ LDA #$00
395f : e5 12 __ SBC P5 ; (c + 1)
3961 : 85 12 __ STA P5 ; (c + 1)
3963 : a9 00 __ LDA #$00
3965 : c5 43 __ CMP T1 + 0 
3967 : 2a __ __ ROL
3968 : 85 43 __ STA T1 + 0 
.s7:
396a : a9 00 __ LDA #$00
396c : 85 05 __ STA WORK + 2 
396e : 85 06 __ STA WORK + 3 
3970 : a5 0d __ LDA P0 ; (a + 0)
3972 : 38 __ __ SEC
3973 : a0 08 __ LDY #$08
3975 : 6a __ __ ROR
3976 : 90 0f __ BCC $3987 ; (lmuldiv16s.s7 + 29)
3978 : aa __ __ TAX
3979 : 18 __ __ CLC
397a : a5 05 __ LDA WORK + 2 
397c : 65 0f __ ADC P2 ; (b + 0)
397e : 85 05 __ STA WORK + 2 
3980 : a5 06 __ LDA WORK + 3 
3982 : 65 10 __ ADC P3 ; (b + 1)
3984 : 85 06 __ STA WORK + 3 
3986 : 8a __ __ TXA
3987 : 66 06 __ ROR WORK + 3 
3989 : 66 05 __ ROR WORK + 2 
398b : 88 __ __ DEY
398c : d0 e7 __ BNE $3975 ; (lmuldiv16s.s7 + 11)
398e : 6a __ __ ROR
398f : 90 07 __ BCC $3998 ; (lmuldiv16s.s7 + 46)
3991 : 85 03 __ STA WORK + 0 
3993 : a5 0e __ LDA P1 ; (a + 1)
3995 : 18 __ __ CLC
3996 : 90 db __ BCC $3973 ; (lmuldiv16s.s7 + 9)
3998 : 38 __ __ SEC
3999 : 85 04 __ STA WORK + 1 
399b : a2 08 __ LDX #$08
399d : 26 04 __ ROL WORK + 1 
399f : 26 05 __ ROL WORK + 2 
39a1 : 26 06 __ ROL WORK + 3 
39a3 : 90 0c __ BCC $39b1 ; (lmuldiv16s.s7 + 71)
39a5 : a5 05 __ LDA WORK + 2 
39a7 : e5 11 __ SBC P4 ; (c + 0)
39a9 : a8 __ __ TAY
39aa : a5 06 __ LDA WORK + 3 
39ac : e5 12 __ SBC P5 ; (c + 1)
39ae : 38 __ __ SEC
39af : b0 0c __ BCS $39bd ; (lmuldiv16s.s7 + 83)
39b1 : 38 __ __ SEC
39b2 : a5 05 __ LDA WORK + 2 
39b4 : e5 11 __ SBC P4 ; (c + 0)
39b6 : a8 __ __ TAY
39b7 : a5 06 __ LDA WORK + 3 
39b9 : e5 12 __ SBC P5 ; (c + 1)
39bb : 90 04 __ BCC $39c1 ; (lmuldiv16s.s7 + 87)
39bd : 85 06 __ STA WORK + 3 
39bf : 84 05 __ STY WORK + 2 
39c1 : ca __ __ DEX
39c2 : d0 d9 __ BNE $399d ; (lmuldiv16s.s7 + 51)
39c4 : a5 04 __ LDA WORK + 1 
39c6 : 2a __ __ ROL
39c7 : 90 07 __ BCC $39d0 ; (lmuldiv16s.s7 + 102)
39c9 : 85 1c __ STA ACCU + 1 
39cb : a5 03 __ LDA WORK + 0 
39cd : 18 __ __ CLC
39ce : 90 c9 __ BCC $3999 ; (lmuldiv16s.s7 + 47)
39d0 : 85 1b __ STA ACCU + 0 
39d2 : a5 43 __ LDA T1 + 0 
39d4 : f0 0d __ BEQ $39e3 ; (lmuldiv16s.s3 + 0)
39d6 : 38 __ __ SEC
39d7 : a9 00 __ LDA #$00
39d9 : e5 1b __ SBC ACCU + 0 
39db : 85 1b __ STA ACCU + 0 
39dd : a9 00 __ LDA #$00
39df : e5 1c __ SBC ACCU + 1 
39e1 : 85 1c __ STA ACCU + 1 
.s3:
39e3 : 60 __ __ RTS
--------------------------------------------------------------------
bmu_line: ; bmu_line(const struct Bitmap*,i16,i16,i16,i16,u8,enum LineOp)->void
; 113, "/home/xahmol/oscar64/include/gfx/bitmap.h"
.s4:
39e4 : a5 18 __ LDA P11 ; (op + 0)
39e6 : d0 02 __ BNE $39ea ; (bmu_line.s6 + 0)
.s5:
39e8 : e6 18 __ INC P11 ; (op + 0)
.s6:
39ea : 38 __ __ SEC
39eb : a5 13 __ LDA P6 ; (x1 + 0)
39ed : e5 0f __ SBC P2 ; (x0 + 0)
39ef : 85 46 __ STA T2 + 0 
39f1 : a5 14 __ LDA P7 ; (x1 + 1)
39f3 : e5 10 __ SBC P3 ; (x0 + 1)
39f5 : 85 47 __ STA T2 + 1 
39f7 : 10 11 __ BPL $3a0a ; (bmu_line.s7 + 0)
.s52:
39f9 : 38 __ __ SEC
39fa : a9 00 __ LDA #$00
39fc : e5 46 __ SBC T2 + 0 
39fe : 85 46 __ STA T2 + 0 
3a00 : a9 00 __ LDA #$00
3a02 : e5 47 __ SBC T2 + 1 
3a04 : 85 47 __ STA T2 + 1 
3a06 : a9 01 __ LDA #$01
3a08 : d0 02 __ BNE $3a0c ; (bmu_line.s8 + 0)
.s7:
3a0a : a9 00 __ LDA #$00
.s8:
3a0c : 85 51 __ STA T11 + 0 
3a0e : 38 __ __ SEC
3a0f : a5 15 __ LDA P8 ; (y1 + 0)
3a11 : e5 11 __ SBC P4 ; (y0 + 0)
3a13 : 85 43 __ STA T0 + 0 
3a15 : a5 16 __ LDA P9 ; (y1 + 1)
3a17 : e5 12 __ SBC P5 ; (y0 + 1)
3a19 : 85 44 __ STA T0 + 1 
3a1b : 10 11 __ BPL $3a2e ; (bmu_line.s9 + 0)
.s51:
3a1d : 38 __ __ SEC
3a1e : a9 00 __ LDA #$00
3a20 : e5 43 __ SBC T0 + 0 
3a22 : 85 43 __ STA T0 + 0 
3a24 : a9 00 __ LDA #$00
3a26 : e5 44 __ SBC T0 + 1 
3a28 : 85 44 __ STA T0 + 1 
3a2a : a9 01 __ LDA #$01
3a2c : d0 02 __ BNE $3a30 ; (bmu_line.s10 + 0)
.s9:
3a2e : a9 00 __ LDA #$00
.s10:
3a30 : 85 52 __ STA T12 + 0 
3a32 : a5 44 __ LDA T0 + 1 
3a34 : c5 47 __ CMP T2 + 1 
3a36 : d0 04 __ BNE $3a3c ; (bmu_line.s50 + 0)
.s49:
3a38 : a5 43 __ LDA T0 + 0 
3a3a : c5 46 __ CMP T2 + 0 
.s50:
3a3c : b0 06 __ BCS $3a44 ; (bmu_line.s11 + 0)
.s48:
3a3e : a5 47 __ LDA T2 + 1 
3a40 : a6 46 __ LDX T2 + 0 
3a42 : 90 04 __ BCC $3a48 ; (bmu_line.s12 + 0)
.s11:
3a44 : a5 44 __ LDA T0 + 1 
3a46 : a6 43 __ LDX T0 + 0 
.s12:
3a48 : 86 48 __ STX T4 + 0 
3a4a : 85 49 __ STA T4 + 1 
3a4c : 38 __ __ SEC
3a4d : a5 43 __ LDA T0 + 0 
3a4f : e5 46 __ SBC T2 + 0 
3a51 : 85 4a __ STA T5 + 0 
3a53 : a5 44 __ LDA T0 + 1 
3a55 : e5 47 __ SBC T2 + 1 
3a57 : 85 4b __ STA T5 + 1 
3a59 : a5 4a __ LDA T5 + 0 
3a5b : 4a __ __ LSR
3a5c : b0 0c __ BCS $3a6a ; (bmu_line.s47 + 0)
.s13:
3a5e : a5 4b __ LDA T5 + 1 
3a60 : c9 80 __ CMP #$80
3a62 : 6a __ __ ROR
3a63 : 85 4b __ STA T5 + 1 
3a65 : 66 4a __ ROR T5 + 0 
3a67 : 4c 72 3a JMP $3a72 ; (bmu_line.s14 + 0)
.s47:
3a6a : 06 43 __ ASL T0 + 0 
3a6c : 26 44 __ ROL T0 + 1 
3a6e : 06 46 __ ASL T2 + 0 
3a70 : 26 47 __ ROL T2 + 1 
.s14:
3a72 : a0 00 __ LDY #$00
3a74 : b1 0d __ LDA (P0),y ; (bm + 0)
3a76 : 85 4d __ STA T7 + 0 
3a78 : c8 __ __ INY
3a79 : b1 0d __ LDA (P0),y ; (bm + 0)
3a7b : 85 4e __ STA T7 + 1 
3a7d : a0 04 __ LDY #$04
3a7f : b1 0d __ LDA (P0),y ; (bm + 0)
3a81 : aa __ __ TAX
3a82 : 0a __ __ ASL
3a83 : 85 4f __ STA T8 + 0 
3a85 : a9 a0 __ LDA #$a0
3a87 : 8d 00 9c STA $9c00 ; (BLIT_CODE[0] + 0)
3a8a : a9 a2 __ LDA #$a2
3a8c : 8d 02 9c STA $9c02 ; (BLIT_CODE[0] + 2)
3a8f : a9 a5 __ LDA #$a5
3a91 : 8d 04 9c STA $9c04 ; (BLIT_CODE[0] + 4)
3a94 : a9 0a __ LDA #$0a
3a96 : 8d 05 9c STA $9c05 ; (BLIT_CODE[0] + 5)
3a99 : a9 00 __ LDA #$00
3a9b : 2a __ __ ROL
3a9c : 06 4f __ ASL T8 + 0 
3a9e : 2a __ __ ROL
3a9f : 06 4f __ ASL T8 + 0 
3aa1 : 2a __ __ ROL
3aa2 : 85 50 __ STA T8 + 1 
3aa4 : a5 52 __ LDA T12 + 0 
3aa6 : f0 0d __ BEQ $3ab5 ; (bmu_line.s15 + 0)
.s46:
3aa8 : 38 __ __ SEC
3aa9 : a9 00 __ LDA #$00
3aab : e5 4f __ SBC T8 + 0 
3aad : 85 4f __ STA T8 + 0 
3aaf : a9 00 __ LDA #$00
3ab1 : e5 50 __ SBC T8 + 1 
3ab3 : 85 50 __ STA T8 + 1 
.s15:
3ab5 : a5 11 __ LDA P4 ; (y0 + 0)
3ab7 : 29 f8 __ AND #$f8
3ab9 : 85 1b __ STA ACCU + 0 
3abb : a5 12 __ LDA P5 ; (y0 + 1)
3abd : 85 1c __ STA ACCU + 1 
3abf : 8a __ __ TXA
3ac0 : 20 7e 74 JSR $747e ; (mul16by8 + 0)
3ac3 : 18 __ __ CLC
3ac4 : a5 4d __ LDA T7 + 0 
3ac6 : 65 1b __ ADC ACCU + 0 
3ac8 : 85 4d __ STA T7 + 0 
3aca : a5 4e __ LDA T7 + 1 
3acc : 65 1c __ ADC ACCU + 1 
3ace : aa __ __ TAX
3acf : a5 0f __ LDA P2 ; (x0 + 0)
3ad1 : 29 f8 __ AND #$f8
3ad3 : 18 __ __ CLC
3ad4 : 65 4d __ ADC T7 + 0 
3ad6 : 85 4d __ STA T7 + 0 
3ad8 : 8a __ __ TXA
3ad9 : 65 10 __ ADC P3 ; (x0 + 1)
3adb : 85 4e __ STA T7 + 1 
3add : a5 46 __ LDA T2 + 0 
3adf : 05 43 __ ORA T0 + 0 
3ae1 : 29 80 __ AND #$80
3ae3 : 85 4c __ STA T6 + 0 
3ae5 : a5 47 __ LDA T2 + 1 
3ae7 : 05 44 __ ORA T0 + 1 
3ae9 : 05 4c __ ORA T6 + 0 
3aeb : f0 02 __ BEQ $3aef ; (bmu_line.s56 + 0)
.s55:
3aed : a9 01 __ LDA #$01
.s56:
3aef : 85 1c __ STA ACCU + 1 
3af1 : a5 11 __ LDA P4 ; (y0 + 0)
3af3 : 29 07 __ AND #$07
3af5 : 8d 01 9c STA $9c01 ; (BLIT_CODE[0] + 1)
3af8 : a6 48 __ LDX T4 + 0 
3afa : e8 __ __ INX
3afb : 8e 03 9c STX $9c03 ; (BLIT_CODE[0] + 3)
3afe : a5 0f __ LDA P2 ; (x0 + 0)
3b00 : 29 07 __ AND #$07
3b02 : aa __ __ TAX
3b03 : a5 18 __ LDA P11 ; (op + 0)
3b05 : c9 02 __ CMP #$02
3b07 : d0 20 __ BNE $3b29 ; (bmu_line.s16 + 0)
.s45:
3b09 : a9 49 __ LDA #$49
3b0b : 8d 06 9c STA $9c06 ; (BLIT_CODE[0] + 6)
3b0e : a9 ff __ LDA #$ff
3b10 : 8d 07 9c STA $9c07 ; (BLIT_CODE[0] + 7)
3b13 : a9 31 __ LDA #$31
3b15 : 8d 08 9c STA $9c08 ; (BLIT_CODE[0] + 8)
3b18 : a9 03 __ LDA #$03
3b1a : 8d 09 9c STA $9c09 ; (BLIT_CODE[0] + 9)
3b1d : 8d 0b 9c STA $9c0b ; (BLIT_CODE[0] + 11)
3b20 : a9 91 __ LDA #$91
3b22 : 8d 0a 9c STA $9c0a ; (BLIT_CODE[0] + 10)
3b25 : a9 0c __ LDA #$0c
3b27 : d0 21 __ BNE $3b4a ; (bmu_line.s19 + 0)
.s16:
3b29 : b0 03 __ BCS $3b2e ; (bmu_line.s17 + 0)
3b2b : 4c 16 3e JMP $3e16 ; (bmu_line.s42 + 0)
.s17:
3b2e : c9 03 __ CMP #$03
3b30 : f0 04 __ BEQ $3b36 ; (bmu_line.s40 + 0)
.s18:
3b32 : a9 06 __ LDA #$06
3b34 : d0 14 __ BNE $3b4a ; (bmu_line.s19 + 0)
.s40:
3b36 : a9 51 __ LDA #$51
.s41:
3b38 : 8d 06 9c STA $9c06 ; (BLIT_CODE[0] + 6)
3b3b : a9 03 __ LDA #$03
3b3d : 8d 07 9c STA $9c07 ; (BLIT_CODE[0] + 7)
3b40 : 8d 09 9c STA $9c09 ; (BLIT_CODE[0] + 9)
3b43 : a9 91 __ LDA #$91
3b45 : 8d 08 9c STA $9c08 ; (BLIT_CODE[0] + 8)
3b48 : a9 0a __ LDA #$0a
.s19:
3b4a : 85 45 __ STA T1 + 0 
3b4c : a5 43 __ LDA T0 + 0 
3b4e : 05 44 __ ORA T0 + 1 
3b50 : f0 03 __ BEQ $3b55 ; (bmu_line.s20 + 0)
3b52 : 4c 24 3c JMP $3c24 ; (bmu_line.s28 + 0)
.s20:
3b55 : a5 46 __ LDA T2 + 0 
3b57 : 05 47 __ ORA T2 + 1 
3b59 : f0 75 __ BEQ $3bd0 ; (bmu_line.s21 + 0)
.s22:
3b5b : a9 0a __ LDA #$0a
3b5d : a4 45 __ LDY T1 + 0 
3b5f : 99 01 9c STA $9c01,y ; (BLIT_CODE[0] + 1)
3b62 : 99 05 9c STA $9c05,y ; (BLIT_CODE[0] + 5)
3b65 : a9 90 __ LDA #$90
3b67 : 99 02 9c STA $9c02,y ; (BLIT_CODE[0] + 2)
3b6a : a9 0c __ LDA #$0c
3b6c : 99 03 9c STA $9c03,y ; (BLIT_CODE[0] + 3)
3b6f : a9 a5 __ LDA #$a5
3b71 : 99 06 9c STA $9c06,y ; (BLIT_CODE[0] + 6)
3b74 : a9 03 __ LDA #$03
3b76 : 99 07 9c STA $9c07,y ; (BLIT_CODE[0] + 7)
3b79 : a9 69 __ LDA #$69
3b7b : 99 08 9c STA $9c08,y ; (BLIT_CODE[0] + 8)
3b7e : a5 51 __ LDA T11 + 0 
3b80 : f0 09 __ BEQ $3b8b ; (bmu_line.s23 + 0)
.s27:
3b82 : a9 06 __ LDA #$06
3b84 : 99 00 9c STA $9c00,y ; (BLIT_CODE[0] + 0)
3b87 : a9 26 __ LDA #$26
3b89 : d0 07 __ BNE $3b92 ; (bmu_line.s53 + 0)
.s23:
3b8b : a9 46 __ LDA #$46
3b8d : 99 00 9c STA $9c00,y ; (BLIT_CODE[0] + 0)
3b90 : a9 66 __ LDA #$66
.s53:
3b92 : 99 04 9c STA $9c04,y ; (BLIT_CODE[0] + 4)
3b95 : a9 02 __ LDA #$02
3b97 : 99 0b 9c STA $9c0b,y ; (BLIT_CODE[0] + 11)
3b9a : a5 51 __ LDA T11 + 0 
3b9c : f0 0e __ BEQ $3bac ; (bmu_line.s24 + 0)
.s26:
3b9e : a9 f8 __ LDA #$f8
3ba0 : 99 09 9c STA $9c09,y ; (BLIT_CODE[0] + 9)
3ba3 : a9 b0 __ LDA #$b0
3ba5 : 99 0a 9c STA $9c0a,y ; (BLIT_CODE[0] + 10)
3ba8 : a9 c6 __ LDA #$c6
3baa : d0 0c __ BNE $3bb8 ; (bmu_line.s25 + 0)
.s24:
3bac : a9 08 __ LDA #$08
3bae : 99 09 9c STA $9c09,y ; (BLIT_CODE[0] + 9)
3bb1 : a9 90 __ LDA #$90
3bb3 : 99 0a 9c STA $9c0a,y ; (BLIT_CODE[0] + 10)
3bb6 : a9 e6 __ LDA #$e6
.s25:
3bb8 : 99 0c 9c STA $9c0c,y ; (BLIT_CODE[0] + 12)
3bbb : a9 04 __ LDA #$04
3bbd : 99 0d 9c STA $9c0d,y ; (BLIT_CODE[0] + 13)
3bc0 : a9 85 __ LDA #$85
3bc2 : 99 0e 9c STA $9c0e,y ; (BLIT_CODE[0] + 14)
3bc5 : a9 03 __ LDA #$03
3bc7 : 99 0f 9c STA $9c0f,y ; (BLIT_CODE[0] + 15)
3bca : 98 __ __ TYA
3bcb : 18 __ __ CLC
3bcc : 69 10 __ ADC #$10
3bce : 85 45 __ STA T1 + 0 
.s21:
3bd0 : a9 ca __ LDA #$ca
3bd2 : a4 45 __ LDY T1 + 0 
3bd4 : 84 43 __ STY T0 + 0 
3bd6 : 99 00 9c STA $9c00,y ; (BLIT_CODE[0] + 0)
3bd9 : a9 d0 __ LDA #$d0
3bdb : 99 01 9c STA $9c01,y ; (BLIT_CODE[0] + 1)
3bde : a9 c6 __ LDA #$c6
3be0 : 99 03 9c STA $9c03,y ; (BLIT_CODE[0] + 3)
3be3 : a9 0b __ LDA #$0b
3be5 : 99 04 9c STA $9c04,y ; (BLIT_CODE[0] + 4)
3be8 : a9 10 __ LDA #$10
3bea : 99 05 9c STA $9c05,y ; (BLIT_CODE[0] + 5)
3bed : a9 60 __ LDA #$60
3bef : 99 07 9c STA $9c07,y ; (BLIT_CODE[0] + 7)
3bf2 : e6 43 __ INC T0 + 0 
3bf4 : 38 __ __ SEC
3bf5 : a9 02 __ LDA #$02
3bf7 : e5 43 __ SBC T0 + 0 
3bf9 : 99 02 9c STA $9c02,y ; (BLIT_CODE[0] + 2)
3bfc : 38 __ __ SEC
3bfd : a9 fe __ LDA #$fe
3bff : e5 43 __ SBC T0 + 0 
3c01 : 99 06 9c STA $9c06,y ; (BLIT_CODE[0] + 6)
3c04 : a5 49 __ LDA T4 + 1 
3c06 : 85 0b __ STA WORK + 8 
3c08 : a5 4d __ LDA T7 + 0 
3c0a : 85 03 __ STA WORK + 0 
3c0c : a5 4e __ LDA T7 + 1 
3c0e : 85 04 __ STA WORK + 1 
3c10 : a5 4a __ LDA T5 + 0 
3c12 : 85 05 __ STA WORK + 2 
3c14 : a5 4b __ LDA T5 + 1 
3c16 : 85 06 __ STA WORK + 3 
3c18 : bd e8 85 LDA $85e8,x ; (bitshift[0] + 32)
3c1b : 85 0a __ STA WORK + 7 
3c1d : a9 ff __ LDA #$ff
3c1f : 85 07 __ STA WORK + 4 
3c21 : 4c 00 9c JMP $9c00 ; (BLIT_CODE[0] + 0)
.s28:
3c24 : a5 46 __ LDA T2 + 0 
3c26 : 05 47 __ ORA T2 + 1 
3c28 : c9 01 __ CMP #$01
3c2a : a9 00 __ LDA #$00
3c2c : 6a __ __ ROR
3c2d : 85 1d __ STA ACCU + 2 
3c2f : f0 03 __ BEQ $3c34 ; (bmu_line.s29 + 0)
3c31 : 4c cf 3d JMP $3dcf ; (bmu_line.s35 + 0)
.s29:
3c34 : a9 00 __ LDA #$00
3c36 : 85 46 __ STA T2 + 0 
3c38 : 85 47 __ STA T2 + 1 
3c3a : 85 1b __ STA ACCU + 0 
3c3c : a5 52 __ LDA T12 + 0 
3c3e : f0 03 __ BEQ $3c43 ; (bmu_line.s30 + 0)
3c40 : 4c 64 3d JMP $3d64 ; (bmu_line.s34 + 0)
.s30:
3c43 : a9 c8 __ LDA #$c8
3c45 : a4 45 __ LDY T1 + 0 
3c47 : 99 00 9c STA $9c00,y ; (BLIT_CODE[0] + 0)
3c4a : a9 c0 __ LDA #$c0
3c4c : 99 01 9c STA $9c01,y ; (BLIT_CODE[0] + 1)
3c4f : a9 08 __ LDA #$08
3c51 : 99 02 9c STA $9c02,y ; (BLIT_CODE[0] + 2)
3c54 : a9 d0 __ LDA #$d0
3c56 : 99 03 9c STA $9c03,y ; (BLIT_CODE[0] + 3)
3c59 : a9 a0 __ LDA #$a0
3c5b : 99 05 9c STA $9c05,y ; (BLIT_CODE[0] + 5)
3c5e : a9 00 __ LDA #$00
3c60 : 99 06 9c STA $9c06,y ; (BLIT_CODE[0] + 6)
3c63 : a9 a5 __ LDA #$a5
3c65 : 99 07 9c STA $9c07,y ; (BLIT_CODE[0] + 7)
3c68 : 99 0d 9c STA $9c0d,y ; (BLIT_CODE[0] + 13)
3c6b : a9 03 __ LDA #$03
3c6d : 99 08 9c STA $9c08,y ; (BLIT_CODE[0] + 8)
3c70 : 99 0c 9c STA $9c0c,y ; (BLIT_CODE[0] + 12)
3c73 : a9 69 __ LDA #$69
3c75 : 99 09 9c STA $9c09,y ; (BLIT_CODE[0] + 9)
3c78 : 99 0f 9c STA $9c0f,y ; (BLIT_CODE[0] + 15)
3c7b : a9 85 __ LDA #$85
3c7d : 99 0b 9c STA $9c0b,y ; (BLIT_CODE[0] + 11)
3c80 : 99 11 9c STA $9c11,y ; (BLIT_CODE[0] + 17)
3c83 : a9 04 __ LDA #$04
3c85 : 99 0e 9c STA $9c0e,y ; (BLIT_CODE[0] + 14)
3c88 : 99 12 9c STA $9c12,y ; (BLIT_CODE[0] + 18)
3c8b : a5 1b __ LDA ACCU + 0 
3c8d : f0 04 __ BEQ $3c93 ; (bmu_line.s60 + 0)
.s61:
3c8f : a9 10 __ LDA #$10
3c91 : 90 02 __ BCC $3c95 ; (bmu_line.s62 + 0)
.s60:
3c93 : a9 0e __ LDA #$0e
.s62:
3c95 : 99 04 9c STA $9c04,y ; (BLIT_CODE[0] + 4)
3c98 : 38 __ __ SEC
3c99 : a5 4f __ LDA T8 + 0 
3c9b : e9 01 __ SBC #$01
3c9d : 99 0a 9c STA $9c0a,y ; (BLIT_CODE[0] + 10)
3ca0 : a5 50 __ LDA T8 + 1 
3ca2 : e9 00 __ SBC #$00
3ca4 : 99 10 9c STA $9c10,y ; (BLIT_CODE[0] + 16)
3ca7 : 98 __ __ TYA
3ca8 : 18 __ __ CLC
3ca9 : 69 13 __ ADC #$13
3cab : 85 45 __ STA T1 + 0 
3cad : a8 __ __ TAY
3cae : 24 1d __ BIT ACCU + 2 
3cb0 : 30 03 __ BMI $3cb5 ; (bmu_line.s31 + 0)
3cb2 : 4c 55 3b JMP $3b55 ; (bmu_line.s20 + 0)
.s31:
3cb5 : a9 a5 __ LDA #$a5
3cb7 : 99 00 9c STA $9c00,y ; (BLIT_CODE[0] + 0)
3cba : a9 05 __ LDA #$05
3cbc : 99 01 9c STA $9c01,y ; (BLIT_CODE[0] + 1)
3cbf : 99 06 9c STA $9c06,y ; (BLIT_CODE[0] + 6)
3cc2 : a9 38 __ LDA #$38
3cc4 : 99 02 9c STA $9c02,y ; (BLIT_CODE[0] + 2)
3cc7 : a9 e9 __ LDA #$e9
3cc9 : 99 03 9c STA $9c03,y ; (BLIT_CODE[0] + 3)
3ccc : a9 85 __ LDA #$85
3cce : 99 05 9c STA $9c05,y ; (BLIT_CODE[0] + 5)
3cd1 : a5 46 __ LDA T2 + 0 
3cd3 : 99 04 9c STA $9c04,y ; (BLIT_CODE[0] + 4)
3cd6 : a5 1c __ LDA ACCU + 1 
3cd8 : d0 2a __ BNE $3d04 ; (bmu_line.s33 + 0)
.s32:
3cda : a9 10 __ LDA #$10
3cdc : 99 07 9c STA $9c07,y ; (BLIT_CODE[0] + 7)
3cdf : a9 15 __ LDA #$15
3ce1 : 99 08 9c STA $9c08,y ; (BLIT_CODE[0] + 8)
3ce4 : a9 18 __ LDA #$18
3ce6 : 99 09 9c STA $9c09,y ; (BLIT_CODE[0] + 9)
3ce9 : a9 69 __ LDA #$69
3ceb : 99 0a 9c STA $9c0a,y ; (BLIT_CODE[0] + 10)
3cee : a5 43 __ LDA T0 + 0 
3cf0 : 99 0b 9c STA $9c0b,y ; (BLIT_CODE[0] + 11)
3cf3 : a9 85 __ LDA #$85
3cf5 : 99 0c 9c STA $9c0c,y ; (BLIT_CODE[0] + 12)
3cf8 : a9 05 __ LDA #$05
3cfa : 99 0d 9c STA $9c0d,y ; (BLIT_CODE[0] + 13)
3cfd : 98 __ __ TYA
3cfe : 18 __ __ CLC
3cff : 69 0e __ ADC #$0e
3d01 : 4c 5f 3d JMP $3d5f ; (bmu_line.s54 + 0)
.s33:
3d04 : a9 a5 __ LDA #$a5
3d06 : 99 07 9c STA $9c07,y ; (BLIT_CODE[0] + 7)
3d09 : 99 10 9c STA $9c10,y ; (BLIT_CODE[0] + 16)
3d0c : 99 16 9c STA $9c16,y ; (BLIT_CODE[0] + 22)
3d0f : a9 06 __ LDA #$06
3d11 : 99 08 9c STA $9c08,y ; (BLIT_CODE[0] + 8)
3d14 : 99 0c 9c STA $9c0c,y ; (BLIT_CODE[0] + 12)
3d17 : 99 17 9c STA $9c17,y ; (BLIT_CODE[0] + 23)
3d1a : 99 1b 9c STA $9c1b,y ; (BLIT_CODE[0] + 27)
3d1d : a9 e9 __ LDA #$e9
3d1f : 99 09 9c STA $9c09,y ; (BLIT_CODE[0] + 9)
3d22 : a9 85 __ LDA #$85
3d24 : 99 0b 9c STA $9c0b,y ; (BLIT_CODE[0] + 11)
3d27 : 99 14 9c STA $9c14,y ; (BLIT_CODE[0] + 20)
3d2a : 99 1a 9c STA $9c1a,y ; (BLIT_CODE[0] + 26)
3d2d : a9 10 __ LDA #$10
3d2f : 99 0d 9c STA $9c0d,y ; (BLIT_CODE[0] + 13)
3d32 : a9 1d __ LDA #$1d
3d34 : 99 0e 9c STA $9c0e,y ; (BLIT_CODE[0] + 14)
3d37 : a9 18 __ LDA #$18
3d39 : 99 0f 9c STA $9c0f,y ; (BLIT_CODE[0] + 15)
3d3c : a9 05 __ LDA #$05
3d3e : 99 11 9c STA $9c11,y ; (BLIT_CODE[0] + 17)
3d41 : 99 15 9c STA $9c15,y ; (BLIT_CODE[0] + 21)
3d44 : a9 69 __ LDA #$69
3d46 : 99 12 9c STA $9c12,y ; (BLIT_CODE[0] + 18)
3d49 : 99 18 9c STA $9c18,y ; (BLIT_CODE[0] + 24)
3d4c : a5 43 __ LDA T0 + 0 
3d4e : 99 13 9c STA $9c13,y ; (BLIT_CODE[0] + 19)
3d51 : a5 47 __ LDA T2 + 1 
3d53 : 99 0a 9c STA $9c0a,y ; (BLIT_CODE[0] + 10)
3d56 : a5 44 __ LDA T0 + 1 
3d58 : 99 19 9c STA $9c19,y ; (BLIT_CODE[0] + 25)
3d5b : 98 __ __ TYA
3d5c : 18 __ __ CLC
3d5d : 69 1c __ ADC #$1c
.s54:
3d5f : 85 45 __ STA T1 + 0 
3d61 : 4c 5b 3b JMP $3b5b ; (bmu_line.s22 + 0)
.s34:
3d64 : a9 88 __ LDA #$88
3d66 : a4 45 __ LDY T1 + 0 
3d68 : 99 00 9c STA $9c00,y ; (BLIT_CODE[0] + 0)
3d6b : a9 10 __ LDA #$10
3d6d : 99 01 9c STA $9c01,y ; (BLIT_CODE[0] + 1)
3d70 : a9 18 __ LDA #$18
3d72 : 99 03 9c STA $9c03,y ; (BLIT_CODE[0] + 3)
3d75 : a9 a0 __ LDA #$a0
3d77 : 99 04 9c STA $9c04,y ; (BLIT_CODE[0] + 4)
3d7a : a9 07 __ LDA #$07
3d7c : 99 05 9c STA $9c05,y ; (BLIT_CODE[0] + 5)
3d7f : a9 a5 __ LDA #$a5
3d81 : 99 06 9c STA $9c06,y ; (BLIT_CODE[0] + 6)
3d84 : 99 0c 9c STA $9c0c,y ; (BLIT_CODE[0] + 12)
3d87 : a9 03 __ LDA #$03
3d89 : 99 07 9c STA $9c07,y ; (BLIT_CODE[0] + 7)
3d8c : 99 0b 9c STA $9c0b,y ; (BLIT_CODE[0] + 11)
3d8f : a9 69 __ LDA #$69
3d91 : 99 08 9c STA $9c08,y ; (BLIT_CODE[0] + 8)
3d94 : 99 0e 9c STA $9c0e,y ; (BLIT_CODE[0] + 14)
3d97 : a9 85 __ LDA #$85
3d99 : 99 0a 9c STA $9c0a,y ; (BLIT_CODE[0] + 10)
3d9c : 99 10 9c STA $9c10,y ; (BLIT_CODE[0] + 16)
3d9f : a9 04 __ LDA #$04
3da1 : 99 0d 9c STA $9c0d,y ; (BLIT_CODE[0] + 13)
3da4 : 99 11 9c STA $9c11,y ; (BLIT_CODE[0] + 17)
3da7 : a5 1b __ LDA ACCU + 0 
3da9 : f0 04 __ BEQ $3daf ; (bmu_line.s57 + 0)
.s58:
3dab : a9 11 __ LDA #$11
3dad : 90 02 __ BCC $3db1 ; (bmu_line.s59 + 0)
.s57:
3daf : a9 0f __ LDA #$0f
.s59:
3db1 : 99 02 9c STA $9c02,y ; (BLIT_CODE[0] + 2)
3db4 : a5 4f __ LDA T8 + 0 
3db6 : 99 09 9c STA $9c09,y ; (BLIT_CODE[0] + 9)
3db9 : a5 50 __ LDA T8 + 1 
3dbb : 99 0f 9c STA $9c0f,y ; (BLIT_CODE[0] + 15)
3dbe : 98 __ __ TYA
3dbf : 18 __ __ CLC
3dc0 : 69 12 __ ADC #$12
3dc2 : 85 45 __ STA T1 + 0 
3dc4 : a8 __ __ TAY
3dc5 : 24 1d __ BIT ACCU + 2 
3dc7 : 10 03 __ BPL $3dcc ; (bmu_line.s59 + 27)
3dc9 : 4c b5 3c JMP $3cb5 ; (bmu_line.s31 + 0)
3dcc : 4c 55 3b JMP $3b55 ; (bmu_line.s20 + 0)
.s35:
3dcf : a9 a5 __ LDA #$a5
3dd1 : a4 45 __ LDY T1 + 0 
3dd3 : 99 00 9c STA $9c00,y ; (BLIT_CODE[0] + 0)
3dd6 : a9 30 __ LDA #$30
3dd8 : 99 02 9c STA $9c02,y ; (BLIT_CODE[0] + 2)
3ddb : a5 1c __ LDA ACCU + 1 
3ddd : 69 05 __ ADC #$05
3ddf : 99 01 9c STA $9c01,y ; (BLIT_CODE[0] + 1)
3de2 : a5 1c __ LDA ACCU + 1 
3de4 : d0 26 __ BNE $3e0c ; (bmu_line.s39 + 0)
.s36:
3de6 : a9 1b __ LDA #$1b
3de8 : 85 1b __ STA ACCU + 0 
3dea : a5 52 __ LDA T12 + 0 
3dec : d0 02 __ BNE $3df0 ; (bmu_line.s38 + 0)
.s37:
3dee : e6 1b __ INC ACCU + 0 
.s38:
3df0 : a5 1b __ LDA ACCU + 0 
3df2 : 99 03 9c STA $9c03,y ; (BLIT_CODE[0] + 3)
3df5 : 98 __ __ TYA
3df6 : 18 __ __ CLC
3df7 : 69 04 __ ADC #$04
3df9 : 85 45 __ STA T1 + 0 
3dfb : a9 00 __ LDA #$00
3dfd : c5 1c __ CMP ACCU + 1 
3dff : 2a __ __ ROL
3e00 : 85 1b __ STA ACCU + 0 
3e02 : a5 52 __ LDA T12 + 0 
3e04 : f0 03 __ BEQ $3e09 ; (bmu_line.s38 + 25)
3e06 : 4c 64 3d JMP $3d64 ; (bmu_line.s34 + 0)
3e09 : 4c 43 3c JMP $3c43 ; (bmu_line.s30 + 0)
.s39:
3e0c : a9 21 __ LDA #$21
3e0e : 85 1b __ STA ACCU + 0 
3e10 : a5 52 __ LDA T12 + 0 
3e12 : d0 dc __ BNE $3df0 ; (bmu_line.s38 + 0)
3e14 : f0 d8 __ BEQ $3dee ; (bmu_line.s37 + 0)
.s42:
3e16 : a8 __ __ TAY
3e17 : f0 05 __ BEQ $3e1e ; (bmu_line.s43 + 0)
.s44:
3e19 : a9 11 __ LDA #$11
3e1b : 4c 38 3b JMP $3b38 ; (bmu_line.s41 + 0)
.s43:
3e1e : a9 06 __ LDA #$06
3e20 : 8d 06 9c STA $9c06 ; (BLIT_CODE[0] + 6)
3e23 : 8d 09 9c STA $9c09 ; (BLIT_CODE[0] + 9)
3e26 : a9 07 __ LDA #$07
3e28 : 8d 07 9c STA $9c07 ; (BLIT_CODE[0] + 7)
3e2b : 8d 0b 9c STA $9c0b ; (BLIT_CODE[0] + 11)
3e2e : a9 90 __ LDA #$90
3e30 : 8d 08 9c STA $9c08 ; (BLIT_CODE[0] + 8)
3e33 : a9 e6 __ LDA #$e6
3e35 : 8d 0a 9c STA $9c0a ; (BLIT_CODE[0] + 10)
3e38 : a9 11 __ LDA #$11
3e3a : 8d 0c 9c STA $9c0c ; (BLIT_CODE[0] + 12)
3e3d : a9 03 __ LDA #$03
3e3f : 8d 0d 9c STA $9c0d ; (BLIT_CODE[0] + 13)
3e42 : 8d 13 9c STA $9c13 ; (BLIT_CODE[0] + 19)
3e45 : 8d 15 9c STA $9c15 ; (BLIT_CODE[0] + 21)
3e48 : a9 d0 __ LDA #$d0
3e4a : 8d 0e 9c STA $9c0e ; (BLIT_CODE[0] + 14)
3e4d : a9 04 __ LDA #$04
3e4f : 8d 0f 9c STA $9c0f ; (BLIT_CODE[0] + 15)
3e52 : a9 49 __ LDA #$49
3e54 : 8d 10 9c STA $9c10 ; (BLIT_CODE[0] + 16)
3e57 : a9 ff __ LDA #$ff
3e59 : 8d 11 9c STA $9c11 ; (BLIT_CODE[0] + 17)
3e5c : a9 31 __ LDA #$31
3e5e : 8d 12 9c STA $9c12 ; (BLIT_CODE[0] + 18)
3e61 : a9 91 __ LDA #$91
3e63 : 8d 14 9c STA $9c14 ; (BLIT_CODE[0] + 20)
3e66 : a9 16 __ LDA #$16
3e68 : 4c 4a 3b JMP $3b4a ; (bmu_line.s19 + 0)
--------------------------------------------------------------------
engine_update: ; engine_update(u8)->void
; 364, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s4:
3e6b : 0a __ __ ASL
3e6c : aa __ __ TAX
3e6d : bd 11 7a LDA $7a11,x ; (sid_freq[0] + 0)
3e70 : 8d 00 d4 STA $d400 
3e73 : bd 12 7a LDA $7a12,x ; (sid_freq[0] + 1)
3e76 : 85 1c __ STA ACCU + 1 
3e78 : 8d 01 d4 STA $d401 
3e7b : bd 11 7a LDA $7a11,x ; (sid_freq[0] + 0)
3e7e : 0a __ __ ASL
3e7f : 26 1c __ ROL ACCU + 1 
3e81 : 8d 07 d4 STA $d407 
3e84 : a5 1c __ LDA ACCU + 1 
3e86 : 8d 08 d4 STA $d408 
.s3:
3e89 : 60 __ __ RTS
--------------------------------------------------------------------
modplay_start: ; modplay_start()->void
; 239, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s4:
3e8a : ad 0c 98 LDA $980c ; (modplay.song_length + 0)
3e8d : d0 01 __ BNE $3e90 ; (modplay_start.s5 + 0)
.s3:
3e8f : 60 __ __ RTS
.s5:
3e90 : a9 00 __ LDA #$00
3e92 : 8d fd 7d STA $7dfd ; (mod_paused + 0)
3e95 : 8d 8f 98 STA $988f ; (modplay.order_pos + 0)
3e98 : 85 43 __ STA T0 + 0 
3e9a : 8d 91 98 STA $9891 ; (modplay.row + 0)
3e9d : 8d 92 98 STA $9892 ; (modplay.tick + 0)
3ea0 : 8d 95 98 STA $9895 ; (modplay.pattern_delay + 0)
3ea3 : 8d 9a 98 STA $989a ; (modplay.skip_row_advance + 0)
3ea6 : ad 0f 98 LDA $980f ; (modplay.order_table[0] + 0)
3ea9 : 8d 90 98 STA $9890 ; (modplay.pattern_num + 0)
3eac : a9 06 __ LDA #$06
3eae : 8d 93 98 STA $9893 ; (modplay.ticks_per_row + 0)
3eb1 : a9 7d __ LDA #$7d
3eb3 : 8d 94 98 STA $9894 ; (modplay.bpm + 0)
3eb6 : a9 01 __ LDA #$01
3eb8 : 8d 98 98 STA $9898 ; (modplay.active + 0)
3ebb : ad 97 98 LDA $9897 ; (modplay.stereo + 0)
3ebe : d0 17 __ BNE $3ed7 ; (modplay_start.l10 + 0)
.s7:
3ec0 : a9 80 __ LDA #$80
3ec2 : a6 43 __ LDX T0 + 0 
3ec4 : bc fc 73 LDY $73fc,x ; (__multab50L + 0)
.l8:
3ec7 : 99 f0 9a STA $9af0,y ; (modplay.channel[0].pan + 0)
3eca : e6 43 __ INC T0 + 0 
3ecc : a5 43 __ LDA T0 + 0 
3ece : c9 04 __ CMP #$04
3ed0 : b0 1d __ BCS $3eef ; (modplay_start.s9 + 0)
.s6:
3ed2 : ad 97 98 LDA $9897 ; (modplay.stereo + 0)
3ed5 : f0 e9 __ BEQ $3ec0 ; (modplay_start.s7 + 0)
.l10:
3ed7 : a5 43 __ LDA T0 + 0 
3ed9 : f0 04 __ BEQ $3edf ; (modplay_start.s11 + 0)
.s13:
3edb : c9 03 __ CMP #$03
3edd : d0 04 __ BNE $3ee3 ; (modplay_start.s14 + 0)
.s11:
3edf : a2 00 __ LDX #$00
3ee1 : f0 02 __ BEQ $3ee5 ; (modplay_start.s12 + 0)
.s14:
3ee3 : a2 ff __ LDX #$ff
.s12:
3ee5 : a4 43 __ LDY T0 + 0 
3ee7 : b9 fc 73 LDA $73fc,y ; (__multab50L + 0)
3eea : a8 __ __ TAY
3eeb : 8a __ __ TXA
3eec : 4c c7 3e JMP $3ec7 ; (modplay_start.l8 + 0)
.s9:
3eef : ad 94 98 LDA $9894 ; (modplay.bpm + 0)
3ef2 : 20 2f 3f JSR $3f2f ; (bpm_to_timer.s4 + 0)
3ef5 : a5 1b __ LDA ACCU + 0 
3ef7 : 85 43 __ STA T0 + 0 
3ef9 : a5 1c __ LDA ACCU + 1 
3efb : 85 44 __ STA T0 + 1 
3efd : 78 __ __ SEI
3efe : ad 14 03 LDA $0314 
3f01 : 8d fe 7d STA $7dfe ; (mod_saved_irq[0] + 0)
3f04 : ad 15 03 LDA $0315 
3f07 : 8d ff 7d STA $7dff ; (mod_saved_irq[0] + 1)
3f0a : a9 7f __ LDA #$7f
3f0c : 8d 0d dc STA $dc0d 
3f0f : a5 43 __ LDA T0 + 0 
3f11 : 8d 04 dc STA $dc04 
3f14 : a5 44 __ LDA T0 + 1 
3f16 : 8d 05 dc STA $dc05 
3f19 : a9 2a __ LDA #$2a
3f1b : 8d 14 03 STA $0314 
3f1e : a9 40 __ LDA #$40
3f20 : 8d 15 03 STA $0315 
3f23 : a9 81 __ LDA #$81
3f25 : 8d 0d dc STA $dc0d 
3f28 : a9 01 __ LDA #$01
3f2a : 8d 0e dc STA $dc0e 
3f2d : 58 __ __ CLI
3f2e : 60 __ __ RTS
--------------------------------------------------------------------
bpm_to_timer: ; bpm_to_timer(u8)->u16
;  76, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
3f2f : 85 03 __ STA WORK + 0 
3f31 : aa __ __ TAX
3f32 : d0 09 __ BNE $3f3d ; (bpm_to_timer.s6 + 0)
.s5:
3f34 : a9 f8 __ LDA #$f8
3f36 : 85 1b __ STA ACCU + 0 
3f38 : a9 4c __ LDA #$4c
3f3a : 85 1c __ STA ACCU + 1 
.s3:
3f3c : 60 __ __ RTS
.s6:
3f3d : a9 00 __ LDA #$00
3f3f : 85 1e __ STA ACCU + 3 
3f41 : 85 04 __ STA WORK + 1 
3f43 : 85 05 __ STA WORK + 2 
3f45 : 85 06 __ STA WORK + 3 
3f47 : a9 90 __ LDA #$90
3f49 : 85 1b __ STA ACCU + 0 
3f4b : a9 95 __ LDA #$95
3f4d : 85 1c __ STA ACCU + 1 
3f4f : a9 25 __ LDA #$25
3f51 : 85 1d __ STA ACCU + 2 
--------------------------------------------------------------------
divmod32: ; divmod32
3f53 : 84 02 __ STY $02 
3f55 : a0 20 __ LDY #$20
3f57 : a9 00 __ LDA #$00
3f59 : 85 07 __ STA WORK + 4 
3f5b : 85 08 __ STA WORK + 5 
3f5d : 85 09 __ STA WORK + 6 
3f5f : 85 0a __ STA WORK + 7 
3f61 : a5 05 __ LDA WORK + 2 
3f63 : 05 06 __ ORA WORK + 3 
3f65 : d0 78 __ BNE $3fdf ; (divmod32 + 140)
3f67 : a5 04 __ LDA WORK + 1 
3f69 : d0 27 __ BNE $3f92 ; (divmod32 + 63)
3f6b : 18 __ __ CLC
3f6c : 26 1b __ ROL ACCU + 0 
3f6e : 26 1c __ ROL ACCU + 1 
3f70 : 26 1d __ ROL ACCU + 2 
3f72 : 26 1e __ ROL ACCU + 3 
3f74 : 2a __ __ ROL
3f75 : 90 05 __ BCC $3f7c ; (divmod32 + 41)
3f77 : e5 03 __ SBC WORK + 0 
3f79 : 38 __ __ SEC
3f7a : b0 06 __ BCS $3f82 ; (divmod32 + 47)
3f7c : c5 03 __ CMP WORK + 0 
3f7e : 90 02 __ BCC $3f82 ; (divmod32 + 47)
3f80 : e5 03 __ SBC WORK + 0 
3f82 : 88 __ __ DEY
3f83 : d0 e7 __ BNE $3f6c ; (divmod32 + 25)
3f85 : 85 07 __ STA WORK + 4 
3f87 : 26 1b __ ROL ACCU + 0 
3f89 : 26 1c __ ROL ACCU + 1 
3f8b : 26 1d __ ROL ACCU + 2 
3f8d : 26 1e __ ROL ACCU + 3 
3f8f : a4 02 __ LDY $02 
3f91 : 60 __ __ RTS
3f92 : a5 1e __ LDA ACCU + 3 
3f94 : d0 10 __ BNE $3fa6 ; (divmod32 + 83)
3f96 : a6 1d __ LDX ACCU + 2 
3f98 : 86 1e __ STX ACCU + 3 
3f9a : a6 1c __ LDX ACCU + 1 
3f9c : 86 1d __ STX ACCU + 2 
3f9e : a6 1b __ LDX ACCU + 0 
3fa0 : 86 1c __ STX ACCU + 1 
3fa2 : 85 1b __ STA ACCU + 0 
3fa4 : a0 18 __ LDY #$18
3fa6 : 18 __ __ CLC
3fa7 : 26 1b __ ROL ACCU + 0 
3fa9 : 26 1c __ ROL ACCU + 1 
3fab : 26 1d __ ROL ACCU + 2 
3fad : 26 1e __ ROL ACCU + 3 
3faf : 26 07 __ ROL WORK + 4 
3fb1 : 26 08 __ ROL WORK + 5 
3fb3 : 90 0c __ BCC $3fc1 ; (divmod32 + 110)
3fb5 : a5 07 __ LDA WORK + 4 
3fb7 : e5 03 __ SBC WORK + 0 
3fb9 : aa __ __ TAX
3fba : a5 08 __ LDA WORK + 5 
3fbc : e5 04 __ SBC WORK + 1 
3fbe : 38 __ __ SEC
3fbf : b0 0c __ BCS $3fcd ; (divmod32 + 122)
3fc1 : 38 __ __ SEC
3fc2 : a5 07 __ LDA WORK + 4 
3fc4 : e5 03 __ SBC WORK + 0 
3fc6 : aa __ __ TAX
3fc7 : a5 08 __ LDA WORK + 5 
3fc9 : e5 04 __ SBC WORK + 1 
3fcb : 90 04 __ BCC $3fd1 ; (divmod32 + 126)
3fcd : 86 07 __ STX WORK + 4 
3fcf : 85 08 __ STA WORK + 5 
3fd1 : 88 __ __ DEY
3fd2 : d0 d3 __ BNE $3fa7 ; (divmod32 + 84)
3fd4 : 26 1b __ ROL ACCU + 0 
3fd6 : 26 1c __ ROL ACCU + 1 
3fd8 : 26 1d __ ROL ACCU + 2 
3fda : 26 1e __ ROL ACCU + 3 
3fdc : a4 02 __ LDY $02 
3fde : 60 __ __ RTS
3fdf : a0 10 __ LDY #$10
3fe1 : a5 1e __ LDA ACCU + 3 
3fe3 : 85 08 __ STA WORK + 5 
3fe5 : a5 1d __ LDA ACCU + 2 
3fe7 : 85 07 __ STA WORK + 4 
3fe9 : a9 00 __ LDA #$00
3feb : 85 1d __ STA ACCU + 2 
3fed : 85 1e __ STA ACCU + 3 
3fef : 18 __ __ CLC
3ff0 : 26 1b __ ROL ACCU + 0 
3ff2 : 26 1c __ ROL ACCU + 1 
3ff4 : 26 07 __ ROL WORK + 4 
3ff6 : 26 08 __ ROL WORK + 5 
3ff8 : 26 09 __ ROL WORK + 6 
3ffa : 26 0a __ ROL WORK + 7 
3ffc : a5 07 __ LDA WORK + 4 
3ffe : c5 03 __ CMP WORK + 0 
4000 : a5 08 __ LDA WORK + 5 
4002 : e5 04 __ SBC WORK + 1 
4004 : a5 09 __ LDA WORK + 6 
4006 : e5 05 __ SBC WORK + 2 
4008 : aa __ __ TAX
4009 : a5 0a __ LDA WORK + 7 
400b : e5 06 __ SBC WORK + 3 
400d : 90 11 __ BCC $4020 ; (divmod32 + 205)
400f : 86 09 __ STX WORK + 6 
4011 : 85 0a __ STA WORK + 7 
4013 : a5 07 __ LDA WORK + 4 
4015 : e5 03 __ SBC WORK + 0 
4017 : 85 07 __ STA WORK + 4 
4019 : a5 08 __ LDA WORK + 5 
401b : e5 04 __ SBC WORK + 1 
401d : 85 08 __ STA WORK + 5 
401f : 38 __ __ SEC
4020 : 88 __ __ DEY
4021 : d0 cd __ BNE $3ff0 ; (divmod32 + 157)
4023 : 26 1b __ ROL ACCU + 0 
4025 : 26 1c __ ROL ACCU + 1 
4027 : a4 02 __ LDY $02 
4029 : 60 __ __ RTS
--------------------------------------------------------------------
modplay_irq: ; modplay_irq
402a : ad 0d dc LDA $dc0d 
402d : 29 01 __ AND #$01
402f : d0 03 __ BNE $4034 ; (modplay_irq + 10)
4031 : 4c 31 ea JMP $ea31 
4034 : a5 07 __ LDA WORK + 4 
4036 : 48 __ __ PHA
4037 : a5 08 __ LDA WORK + 5 
4039 : 48 __ __ PHA
403a : a5 09 __ LDA WORK + 6 
403c : 48 __ __ PHA
403d : a5 0a __ LDA WORK + 7 
403f : 48 __ __ PHA
4040 : a5 0b __ LDA WORK + 8 
4042 : 48 __ __ PHA
4043 : a5 0c __ LDA $0c 
4045 : 48 __ __ PHA
4046 : a5 14 __ LDA P7 
4048 : 48 __ __ PHA
4049 : a5 15 __ LDA P8 
404b : 48 __ __ PHA
404c : a5 16 __ LDA P9 
404e : 48 __ __ PHA
404f : a5 17 __ LDA P10 
4051 : 48 __ __ PHA
4052 : a5 18 __ LDA P11 
4054 : 48 __ __ PHA
4055 : a5 19 __ LDA IP + 0 
4057 : 48 __ __ PHA
4058 : a5 1a __ LDA IP + 1 
405a : 48 __ __ PHA
405b : a5 1f __ LDA ADDR + 0 
405d : 48 __ __ PHA
405e : a5 20 __ LDA ADDR + 1 
4060 : 48 __ __ PHA
4061 : a5 21 __ LDA ADDR + 2 
4063 : 48 __ __ PHA
4064 : a5 22 __ LDA ADDR + 3 
4066 : 48 __ __ PHA
4067 : a5 23 __ LDA SP + 0 
4069 : 48 __ __ PHA
406a : a5 24 __ LDA SP + 1 
406c : 48 __ __ PHA
406d : a5 25 __ LDA FP + 0 
406f : 48 __ __ PHA
4070 : a5 26 __ LDA FP + 1 
4072 : 48 __ __ PHA
4073 : a5 27 __ LDA $27 
4075 : 48 __ __ PHA
4076 : a5 28 __ LDA $28 
4078 : 48 __ __ PHA
4079 : a5 29 __ LDA $29 
407b : 48 __ __ PHA
407c : a5 2a __ LDA $2a 
407e : 48 __ __ PHA
407f : a5 2b __ LDA $2b 
4081 : 48 __ __ PHA
4082 : a5 2c __ LDA $2c 
4084 : 48 __ __ PHA
4085 : a5 2d __ LDA $2d 
4087 : 48 __ __ PHA
4088 : a5 2e __ LDA $2e 
408a : 48 __ __ PHA
408b : a5 2f __ LDA $2f 
408d : 48 __ __ PHA
408e : a5 30 __ LDA $30 
4090 : 48 __ __ PHA
4091 : a5 31 __ LDA $31 
4093 : 48 __ __ PHA
4094 : a5 32 __ LDA $32 
4096 : 48 __ __ PHA
4097 : a5 33 __ LDA $33 
4099 : 48 __ __ PHA
409a : a5 34 __ LDA $34 
409c : 48 __ __ PHA
409d : a5 35 __ LDA $35 
409f : 48 __ __ PHA
40a0 : a5 36 __ LDA $36 
40a2 : 48 __ __ PHA
40a3 : a5 37 __ LDA $37 
40a5 : 48 __ __ PHA
40a6 : a5 38 __ LDA $38 
40a8 : 48 __ __ PHA
40a9 : a5 39 __ LDA $39 
40ab : 48 __ __ PHA
40ac : a5 3a __ LDA $3a 
40ae : 48 __ __ PHA
40af : a5 3b __ LDA $3b 
40b1 : 48 __ __ PHA
40b2 : a5 3c __ LDA $3c 
40b4 : 48 __ __ PHA
40b5 : a5 3d __ LDA $3d 
40b7 : 48 __ __ PHA
40b8 : a5 3e __ LDA $3e 
40ba : 48 __ __ PHA
40bb : a5 3f __ LDA $3f 
40bd : 48 __ __ PHA
40be : a5 40 __ LDA $40 
40c0 : 48 __ __ PHA
40c1 : a5 41 __ LDA $41 
40c3 : 48 __ __ PHA
40c4 : a5 42 __ LDA $42 
40c6 : 48 __ __ PHA
40c7 : 20 60 41 JSR $4160 ; (modplay_tick.s1 + 0)
40ca : 68 __ __ PLA
40cb : 85 42 __ STA $42 
40cd : 68 __ __ PLA
40ce : 85 41 __ STA $41 
40d0 : 68 __ __ PLA
40d1 : 85 40 __ STA $40 
40d3 : 68 __ __ PLA
40d4 : 85 3f __ STA $3f 
40d6 : 68 __ __ PLA
40d7 : 85 3e __ STA $3e 
40d9 : 68 __ __ PLA
40da : 85 3d __ STA $3d 
40dc : 68 __ __ PLA
40dd : 85 3c __ STA $3c 
40df : 68 __ __ PLA
40e0 : 85 3b __ STA $3b 
40e2 : 68 __ __ PLA
40e3 : 85 3a __ STA $3a 
40e5 : 68 __ __ PLA
40e6 : 85 39 __ STA $39 
40e8 : 68 __ __ PLA
40e9 : 85 38 __ STA $38 
40eb : 68 __ __ PLA
40ec : 85 37 __ STA $37 
40ee : 68 __ __ PLA
40ef : 85 36 __ STA $36 
40f1 : 68 __ __ PLA
40f2 : 85 35 __ STA $35 
40f4 : 68 __ __ PLA
40f5 : 85 34 __ STA $34 
40f7 : 68 __ __ PLA
40f8 : 85 33 __ STA $33 
40fa : 68 __ __ PLA
40fb : 85 32 __ STA $32 
40fd : 68 __ __ PLA
40fe : 85 31 __ STA $31 
4100 : 68 __ __ PLA
4101 : 85 30 __ STA $30 
4103 : 68 __ __ PLA
4104 : 85 2f __ STA $2f 
4106 : 68 __ __ PLA
4107 : 85 2e __ STA $2e 
4109 : 68 __ __ PLA
410a : 85 2d __ STA $2d 
410c : 68 __ __ PLA
410d : 85 2c __ STA $2c 
410f : 68 __ __ PLA
4110 : 85 2b __ STA $2b 
4112 : 68 __ __ PLA
4113 : 85 2a __ STA $2a 
4115 : 68 __ __ PLA
4116 : 85 29 __ STA $29 
4118 : 68 __ __ PLA
4119 : 85 28 __ STA $28 
411b : 68 __ __ PLA
411c : 85 27 __ STA $27 
411e : 68 __ __ PLA
411f : 85 26 __ STA FP + 1 
4121 : 68 __ __ PLA
4122 : 85 25 __ STA FP + 0 
4124 : 68 __ __ PLA
4125 : 85 24 __ STA SP + 1 
4127 : 68 __ __ PLA
4128 : 85 23 __ STA SP + 0 
412a : 68 __ __ PLA
412b : 85 22 __ STA ADDR + 3 
412d : 68 __ __ PLA
412e : 85 21 __ STA ADDR + 2 
4130 : 68 __ __ PLA
4131 : 85 20 __ STA ADDR + 1 
4133 : 68 __ __ PLA
4134 : 85 1f __ STA ADDR + 0 
4136 : 68 __ __ PLA
4137 : 85 1a __ STA IP + 1 
4139 : 68 __ __ PLA
413a : 85 19 __ STA IP + 0 
413c : 68 __ __ PLA
413d : 85 18 __ STA P11 
413f : 68 __ __ PLA
4140 : 85 17 __ STA P10 
4142 : 68 __ __ PLA
4143 : 85 16 __ STA P9 
4145 : 68 __ __ PLA
4146 : 85 15 __ STA P8 
4148 : 68 __ __ PLA
4149 : 85 14 __ STA P7 
414b : 68 __ __ PLA
414c : 85 0c __ STA $0c 
414e : 68 __ __ PLA
414f : 85 0b __ STA WORK + 8 
4151 : 68 __ __ PLA
4152 : 85 0a __ STA WORK + 7 
4154 : 68 __ __ PLA
4155 : 85 09 __ STA WORK + 6 
4157 : 68 __ __ PLA
4158 : 85 08 __ STA WORK + 5 
415a : 68 __ __ PLA
415b : 85 07 __ STA WORK + 4 
415d : 4c 31 ea JMP $ea31 
--------------------------------------------------------------------
modplay_tick: ; modplay_tick()->void
; 285, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s1:
4160 : c6 24 __ DEC SP + 1 
4162 : a5 03 __ LDA WORK + 0 
4164 : 48 __ __ PHA
4165 : a5 04 __ LDA WORK + 1 
4167 : 48 __ __ PHA
4168 : a5 05 __ LDA WORK + 2 
416a : 48 __ __ PHA
416b : a5 06 __ LDA WORK + 3 
416d : 48 __ __ PHA
416e : a5 0d __ LDA P0 
4170 : 48 __ __ PHA
4171 : a5 0e __ LDA P1 
4173 : 48 __ __ PHA
4174 : a5 0f __ LDA P2 
4176 : 48 __ __ PHA
4177 : a5 10 __ LDA P3 
4179 : 48 __ __ PHA
417a : a5 11 __ LDA P4 
417c : 48 __ __ PHA
417d : a5 12 __ LDA P5 
417f : 48 __ __ PHA
4180 : a5 13 __ LDA P6 
4182 : 48 __ __ PHA
4183 : a5 1b __ LDA ACCU + 0 
4185 : 48 __ __ PHA
4186 : a5 1c __ LDA ACCU + 1 
4188 : 48 __ __ PHA
4189 : a5 1d __ LDA ACCU + 2 
418b : 48 __ __ PHA
418c : a5 1e __ LDA ACCU + 3 
418e : 48 __ __ PHA
418f : a5 43 __ LDA T0 + 0 
4191 : 48 __ __ PHA
4192 : a5 44 __ LDA T0 + 1 
4194 : 48 __ __ PHA
4195 : a5 45 __ LDA T2 + 0 
4197 : 48 __ __ PHA
4198 : a5 46 __ LDA $46 
419a : 48 __ __ PHA
419b : a5 47 __ LDA $47 
419d : 48 __ __ PHA
419e : a5 48 __ LDA $48 
41a0 : 48 __ __ PHA
41a1 : a5 49 __ LDA $49 
41a3 : 48 __ __ PHA
41a4 : a5 4a __ LDA $4a 
41a6 : 48 __ __ PHA
41a7 : a5 4b __ LDA $4b 
41a9 : 48 __ __ PHA
41aa : a5 4c __ LDA $4c 
41ac : 48 __ __ PHA
41ad : a5 4d __ LDA $4d 
41af : 48 __ __ PHA
41b0 : a5 4e __ LDA $4e 
41b2 : 48 __ __ PHA
41b3 : a5 4f __ LDA $4f 
41b5 : 48 __ __ PHA
41b6 : a5 50 __ LDA $50 
41b8 : 48 __ __ PHA
41b9 : a5 51 __ LDA $51 
41bb : 48 __ __ PHA
.s4:
41bc : ad 98 98 LDA $9898 ; (modplay.active + 0)
41bf : d0 03 __ BNE $41c4 ; (modplay_tick.s5 + 0)
41c1 : 4c 5a 42 JMP $425a ; (modplay_tick.s3 + 0)
.s5:
41c4 : ad fd 7d LDA $7dfd ; (mod_paused + 0)
41c7 : d0 f8 __ BNE $41c1 ; (modplay_tick.s4 + 5)
.s6:
41c9 : ad 92 98 LDA $9892 ; (modplay.tick + 0)
41cc : d0 19 __ BNE $41e7 ; (modplay_tick.s25 + 0)
.s7:
41ce : ad 94 98 LDA $9894 ; (modplay.bpm + 0)
41d1 : 20 2f 3f JSR $3f2f ; (bpm_to_timer.s4 + 0)
41d4 : a5 1b __ LDA ACCU + 0 
41d6 : 8d 04 dc STA $dc04 
41d9 : a5 1c __ LDA ACCU + 1 
41db : 8d 05 dc STA $dc05 
41de : 20 e9 42 JSR $42e9 ; (process_new_row.s1 + 0)
41e1 : ac 93 98 LDY $9893 ; (modplay.ticks_per_row + 0)
41e4 : 4c 00 42 JMP $4200 ; (modplay_tick.s8 + 0)
.s25:
41e7 : a9 00 __ LDA #$00
41e9 : 85 0f __ STA P2 
41eb : 20 7b 49 JSR $497b ; (fx_tick.s4 + 0)
41ee : e6 0f __ INC P2 
41f0 : 20 7b 49 JSR $497b ; (fx_tick.s4 + 0)
41f3 : e6 0f __ INC P2 
41f5 : 20 7b 49 JSR $497b ; (fx_tick.s4 + 0)
41f8 : e6 0f __ INC P2 
41fa : 20 7b 49 JSR $497b ; (fx_tick.s4 + 0)
41fd : ac 92 98 LDY $9892 ; (modplay.tick + 0)
.s8:
4200 : 88 __ __ DEY
4201 : 8c 92 98 STY $9892 ; (modplay.tick + 0)
4204 : a9 00 __ LDA #$00
4206 : 85 13 __ STA P6 
.l26:
4208 : 20 f8 4b JSR $4bf8 ; (ua_update_channel.s1 + 0)
420b : e6 13 __ INC P6 
420d : a5 13 __ LDA P6 
420f : c9 04 __ CMP #$04
4211 : 90 f5 __ BCC $4208 ; (modplay_tick.l26 + 0)
.s9:
4213 : ad 92 98 LDA $9892 ; (modplay.tick + 0)
4216 : d0 42 __ BNE $425a ; (modplay_tick.s3 + 0)
.s10:
4218 : ad 95 98 LDA $9895 ; (modplay.pattern_delay + 0)
421b : f0 05 __ BEQ $4222 ; (modplay_tick.s11 + 0)
.s24:
421d : ce 95 98 DEC $9895 ; (modplay.pattern_delay + 0)
4220 : b0 38 __ BCS $425a ; (modplay_tick.s3 + 0)
.s11:
4222 : ad 9a 98 LDA $989a ; (modplay.skip_row_advance + 0)
4225 : f0 03 __ BEQ $422a ; (modplay_tick.s12 + 0)
4227 : 4c b7 42 JMP $42b7 ; (modplay_tick.s18 + 0)
.s12:
422a : ee 91 98 INC $9891 ; (modplay.row + 0)
422d : ad 91 98 LDA $9891 ; (modplay.row + 0)
4230 : c9 40 __ CMP #$40
4232 : 90 26 __ BCC $425a ; (modplay_tick.s3 + 0)
.s13:
4234 : ee 8f 98 INC $988f ; (modplay.order_pos + 0)
4237 : a9 00 __ LDA #$00
4239 : 8d 91 98 STA $9891 ; (modplay.row + 0)
423c : ad 8f 98 LDA $988f ; (modplay.order_pos + 0)
423f : cd 0c 98 CMP $980c ; (modplay.song_length + 0)
4242 : 90 0f __ BCC $4253 ; (modplay_tick.s14 + 0)
.s15:
4244 : ad 99 98 LDA $9899 ; (modplay.loop_song + 0)
4247 : d0 05 __ BNE $424e ; (modplay_tick.s17 + 0)
.s16:
4249 : 8d 98 98 STA $9898 ; (modplay.active + 0)
424c : b0 0c __ BCS $425a ; (modplay_tick.s3 + 0)
.s17:
424e : a9 00 __ LDA #$00
4250 : 8d 8f 98 STA $988f ; (modplay.order_pos + 0)
.s14:
4253 : aa __ __ TAX
4254 : bd 0f 98 LDA $980f,x ; (modplay.order_table[0] + 0)
4257 : 8d 90 98 STA $9890 ; (modplay.pattern_num + 0)
.s3:
425a : 68 __ __ PLA
425b : 85 51 __ STA $51 
425d : 68 __ __ PLA
425e : 85 50 __ STA $50 
4260 : 68 __ __ PLA
4261 : 85 4f __ STA $4f 
4263 : 68 __ __ PLA
4264 : 85 4e __ STA $4e 
4266 : 68 __ __ PLA
4267 : 85 4d __ STA $4d 
4269 : 68 __ __ PLA
426a : 85 4c __ STA $4c 
426c : 68 __ __ PLA
426d : 85 4b __ STA $4b 
426f : 68 __ __ PLA
4270 : 85 4a __ STA $4a 
4272 : 68 __ __ PLA
4273 : 85 49 __ STA $49 
4275 : 68 __ __ PLA
4276 : 85 48 __ STA $48 
4278 : 68 __ __ PLA
4279 : 85 47 __ STA $47 
427b : 68 __ __ PLA
427c : 85 46 __ STA $46 
427e : 68 __ __ PLA
427f : 85 45 __ STA T2 + 0 
4281 : 68 __ __ PLA
4282 : 85 44 __ STA T0 + 1 
4284 : 68 __ __ PLA
4285 : 85 43 __ STA T0 + 0 
4287 : 68 __ __ PLA
4288 : 85 1e __ STA ACCU + 3 
428a : 68 __ __ PLA
428b : 85 1d __ STA ACCU + 2 
428d : 68 __ __ PLA
428e : 85 1c __ STA ACCU + 1 
4290 : 68 __ __ PLA
4291 : 85 1b __ STA ACCU + 0 
4293 : 68 __ __ PLA
4294 : 85 13 __ STA P6 
4296 : 68 __ __ PLA
4297 : 85 12 __ STA P5 
4299 : 68 __ __ PLA
429a : 85 11 __ STA P4 
429c : 68 __ __ PLA
429d : 85 10 __ STA P3 
429f : 68 __ __ PLA
42a0 : 85 0f __ STA P2 
42a2 : 68 __ __ PLA
42a3 : 85 0e __ STA P1 
42a5 : 68 __ __ PLA
42a6 : 85 0d __ STA P0 
42a8 : 68 __ __ PLA
42a9 : 85 06 __ STA WORK + 3 
42ab : 68 __ __ PLA
42ac : 85 05 __ STA WORK + 2 
42ae : 68 __ __ PLA
42af : 85 04 __ STA WORK + 1 
42b1 : 68 __ __ PLA
42b2 : 85 03 __ STA WORK + 0 
42b4 : e6 24 __ INC SP + 1 
42b6 : 60 __ __ RTS
.s18:
42b7 : ad 9b 98 LDA $989b ; (modplay.next_order + 0)
42ba : c9 ff __ CMP #$ff
42bc : f0 06 __ BEQ $42c4 ; (modplay_tick.s19 + 0)
.s23:
42be : 8d 8f 98 STA $988f ; (modplay.order_pos + 0)
42c1 : 4c c7 42 JMP $42c7 ; (modplay_tick.s27 + 0)
.s19:
42c4 : ad 8f 98 LDA $988f ; (modplay.order_pos + 0)
.s27:
42c7 : cd 0c 98 CMP $980c ; (modplay.song_length + 0)
42ca : 90 0d __ BCC $42d9 ; (modplay_tick.s20 + 0)
.s21:
42cc : ad 99 98 LDA $9899 ; (modplay.loop_song + 0)
42cf : d0 03 __ BNE $42d4 ; (modplay_tick.s22 + 0)
42d1 : 4c 49 42 JMP $4249 ; (modplay_tick.s16 + 0)
.s22:
42d4 : a9 00 __ LDA #$00
42d6 : 8d 8f 98 STA $988f ; (modplay.order_pos + 0)
.s20:
42d9 : aa __ __ TAX
42da : bd 0f 98 LDA $980f,x ; (modplay.order_table[0] + 0)
42dd : 8d 90 98 STA $9890 ; (modplay.pattern_num + 0)
42e0 : ad 9c 98 LDA $989c ; (modplay.next_row + 0)
42e3 : 8d 91 98 STA $9891 ; (modplay.row + 0)
42e6 : 4c 5a 42 JMP $425a ; (modplay_tick.s3 + 0)
--------------------------------------------------------------------
process_new_row: ; process_new_row()->void
; 579, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s1:
42e9 : 38 __ __ SEC
42ea : a5 23 __ LDA SP + 0 
42ec : e9 0b __ SBC #$0b
42ee : 85 23 __ STA SP + 0 
42f0 : b0 02 __ BCS $42f4 ; (process_new_row.s4 + 0)
42f2 : c6 24 __ DEC SP + 1 
.s4:
42f4 : a9 00 __ LDA #$00
42f6 : 8d 9a 98 STA $989a ; (modplay.skip_row_advance + 0)
42f9 : 8d 9c 98 STA $989c ; (modplay.next_row + 0)
42fc : ad 08 98 LDA $9808 ; (modplay.reu_base + 0)
42ff : 18 __ __ CLC
4300 : 69 3c __ ADC #$3c
4302 : 85 43 __ STA T0 + 0 
4304 : a9 ff __ LDA #$ff
4306 : 8d 9b 98 STA $989b ; (modplay.next_order + 0)
4309 : a9 ea __ LDA #$ea
430b : 8d 02 df STA $df02 
430e : a9 80 __ LDA #$80
4310 : 8d 03 df STA $df03 
4313 : ad 09 98 LDA $9809 ; (modplay.reu_base + 1)
4316 : 69 04 __ ADC #$04
4318 : aa __ __ TAX
4319 : ac 0a 98 LDY $980a ; (modplay.reu_base + 2)
431c : 90 01 __ BCC $431f ; (process_new_row.s9 + 0)
.s8:
431e : c8 __ __ INY
.s9:
431f : ad 90 98 LDA $9890 ; (modplay.pattern_num + 0)
4322 : 0a __ __ ASL
4323 : 85 1c __ STA ACCU + 1 
4325 : a9 00 __ LDA #$00
4327 : 2a __ __ ROL
4328 : 06 1c __ ASL ACCU + 1 
432a : 2a __ __ ROL
432b : 85 1d __ STA ACCU + 2 
432d : 8a __ __ TXA
432e : 65 1c __ ADC ACCU + 1 
4330 : 85 44 __ STA T0 + 1 
4332 : 98 __ __ TYA
4333 : 65 1d __ ADC ACCU + 2 
4335 : 85 45 __ STA T0 + 2 
4337 : ad 91 98 LDA $9891 ; (modplay.row + 0)
433a : 85 1b __ STA ACCU + 0 
433c : a9 00 __ LDA #$00
433e : 85 1c __ STA ACCU + 1 
4340 : 85 1d __ STA ACCU + 2 
4342 : a2 04 __ LDX #$04
.l5:
4344 : 06 1b __ ASL ACCU + 0 
4346 : 26 1c __ ROL ACCU + 1 
4348 : 26 1d __ ROL ACCU + 2 
434a : 2a __ __ ROL
434b : ca __ __ DEX
434c : d0 f6 __ BNE $4344 ; (process_new_row.l5 + 0)
.s6:
434e : 18 __ __ CLC
434f : a5 1b __ LDA ACCU + 0 
4351 : 65 43 __ ADC T0 + 0 
4353 : 8d 04 df STA $df04 
4356 : a5 1c __ LDA ACCU + 1 
4358 : 65 44 __ ADC T0 + 1 
435a : 8d 05 df STA $df05 
435d : a5 1d __ LDA ACCU + 2 
435f : 65 45 __ ADC T0 + 2 
4361 : 8d 06 df STA $df06 
4364 : a9 10 __ LDA #$10
4366 : 8d 07 df STA $df07 
4369 : 8e 08 df STX $df08 
436c : 8e 0a df STX $df0a 
436f : 86 4a __ STX T5 + 0 
4371 : 86 4b __ STX T7 + 0 
4373 : 86 10 __ STX P3 
4375 : a9 91 __ LDA #$91
4377 : 8d 01 df STA $df01 
437a : 18 __ __ CLC
437b : a5 23 __ LDA SP + 0 
437d : 69 06 __ ADC #$06
437f : 85 11 __ STA P4 
4381 : a5 24 __ LDA SP + 1 
4383 : 69 00 __ ADC #$00
4385 : 85 12 __ STA P5 
.l7:
4387 : a6 4b __ LDX T7 + 0 
4389 : bd ea 80 LDA $80ea,x ; (mod_row_buf[0] + 0)
438c : 29 f0 __ AND #$f0
438e : 85 48 __ STA T2 + 0 
4390 : bd ec 80 LDA $80ec,x ; (mod_row_buf[0] + 2)
4393 : 4a __ __ LSR
4394 : 4a __ __ LSR
4395 : 4a __ __ LSR
4396 : 4a __ __ LSR
4397 : 05 48 __ ORA T2 + 0 
4399 : a0 06 __ LDY #$06
439b : 91 23 __ STA (SP + 0),y 
439d : bd eb 80 LDA $80eb,x ; (mod_row_buf[0] + 1)
43a0 : c8 __ __ INY
43a1 : 91 23 __ STA (SP + 0),y 
43a3 : bd ea 80 LDA $80ea,x ; (mod_row_buf[0] + 0)
43a6 : 29 0f __ AND #$0f
43a8 : c8 __ __ INY
43a9 : 91 23 __ STA (SP + 0),y 
43ab : bd ec 80 LDA $80ec,x ; (mod_row_buf[0] + 2)
43ae : 29 0f __ AND #$0f
43b0 : 85 49 __ STA T3 + 0 
43b2 : c8 __ __ INY
43b3 : 91 23 __ STA (SP + 0),y 
43b5 : bd ed 80 LDA $80ed,x ; (mod_row_buf[0] + 3)
43b8 : c8 __ __ INY
43b9 : 91 23 __ STA (SP + 0),y 
43bb : a5 49 __ LDA T3 + 0 
43bd : a4 4a __ LDY T5 + 0 
43bf : 99 f1 9a STA $9af1,y ; (modplay.channel[0].effect + 0)
43c2 : bd ed 80 LDA $80ed,x ; (mod_row_buf[0] + 3)
43c5 : 99 f2 9a STA $9af2,y ; (modplay.channel[0].eparam + 0)
43c8 : 20 f4 43 JSR $43f4 ; (apply_note.s4 + 0)
43cb : a5 10 __ LDA P3 
43cd : 85 0f __ STA P2 
43cf : 20 7e 46 JSR $467e ; (fx_row.s4 + 0)
43d2 : 18 __ __ CLC
43d3 : a5 4a __ LDA T5 + 0 
43d5 : 69 32 __ ADC #$32
43d7 : 85 4a __ STA T5 + 0 
43d9 : 18 __ __ CLC
43da : a5 4b __ LDA T7 + 0 
43dc : 69 04 __ ADC #$04
43de : 85 4b __ STA T7 + 0 
43e0 : e6 10 __ INC P3 
43e2 : a5 10 __ LDA P3 
43e4 : c9 04 __ CMP #$04
43e6 : 90 9f __ BCC $4387 ; (process_new_row.l7 + 0)
.s3:
43e8 : 18 __ __ CLC
43e9 : a5 23 __ LDA SP + 0 
43eb : 69 0b __ ADC #$0b
43ed : 85 23 __ STA SP + 0 
43ef : 90 02 __ BCC $43f3 ; (process_new_row.s3 + 11)
43f1 : e6 24 __ INC SP + 1 
43f3 : 60 __ __ RTS
--------------------------------------------------------------------
apply_note: ; apply_note(u8,struct S#23839*)->void
; 194, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
43f4 : a5 10 __ LDA P3 ; (ch_idx + 0)
43f6 : 0a __ __ ASL
43f7 : 18 __ __ CLC
43f8 : 65 10 __ ADC P3 ; (ch_idx + 0)
43fa : 0a __ __ ASL
43fb : 0a __ __ ASL
43fc : 0a __ __ ASL
43fd : 18 __ __ CLC
43fe : 65 10 __ ADC P3 ; (ch_idx + 0)
4400 : 0a __ __ ASL
4401 : 85 47 __ STA T3 + 0 
4403 : a0 00 __ LDY #$00
4405 : b1 11 __ LDA (P4),y ; (n + 0)
4407 : d0 03 __ BNE $440c ; (apply_note.s14 + 0)
4409 : 4c bc 44 JMP $44bc ; (apply_note.s5 + 0)
.s14:
440c : ad 0d 98 LDA $980d ; (modplay.num_samples + 0)
440f : d1 11 __ CMP (P4),y ; (n + 0)
4411 : 90 f6 __ BCC $4409 ; (apply_note.s4 + 21)
.s15:
4413 : 84 1c __ STY ACCU + 1 
4415 : b1 11 __ LDA (P4),y ; (n + 0)
4417 : a6 47 __ LDX T3 + 0 
4419 : 9d ea 9a STA $9aea,x ; (modplay.channel[0].sample_num + 0)
441c : 85 1b __ STA ACCU + 0 
441e : a9 13 __ LDA #$13
4420 : 20 7e 74 JSR $747e ; (mul16by8 + 0)
4423 : 18 __ __ CLC
4424 : a9 8a __ LDA #$8a
4426 : 65 1b __ ADC ACCU + 0 
4428 : 85 1b __ STA ACCU + 0 
442a : a9 98 __ LDA #$98
442c : 65 1c __ ADC ACCU + 1 
442e : 85 1c __ STA ACCU + 1 
4430 : a0 11 __ LDY #$11
4432 : b1 1b __ LDA (ACCU + 0),y 
4434 : a6 47 __ LDX T3 + 0 
4436 : 9d ef 9a STA $9aef,x ; (modplay.channel[0].volume + 0)
4439 : 88 __ __ DEY
443a : b1 1b __ LDA (ACCU + 0),y 
443c : 9d 0b 9b STA $9b0b,x ; (modplay.channel[0].needs_loop + 0)
443f : a0 01 __ LDY #$01
4441 : b1 1b __ LDA (ACCU + 0),y 
4443 : 85 44 __ STA T0 + 1 
4445 : 9d 0d 9b STA $9b0d,x ; (modplay.channel[0].smp_start + 1)
4448 : c8 __ __ INY
4449 : b1 1b __ LDA (ACCU + 0),y 
444b : 85 45 __ STA T0 + 2 
444d : 9d 0e 9b STA $9b0e,x ; (modplay.channel[0].smp_start + 2)
4450 : c8 __ __ INY
4451 : b1 1b __ LDA (ACCU + 0),y 
4453 : 85 46 __ STA T0 + 3 
4455 : 9d 0f 9b STA $9b0f,x ; (modplay.channel[0].smp_start + 3)
4458 : a0 00 __ LDY #$00
445a : b1 1b __ LDA (ACCU + 0),y 
445c : 85 43 __ STA T0 + 0 
445e : 9d 0c 9b STA $9b0c,x ; (modplay.channel[0].smp_start + 0)
4461 : a0 04 __ LDY #$04
4463 : b1 1b __ LDA (ACCU + 0),y 
4465 : 9d 10 9b STA $9b10,x ; (modplay.channel[0].smp_length + 0)
4468 : c8 __ __ INY
4469 : b1 1b __ LDA (ACCU + 0),y 
446b : 9d 11 9b STA $9b11,x ; (modplay.channel[0].smp_length + 1)
446e : c8 __ __ INY
446f : b1 1b __ LDA (ACCU + 0),y 
4471 : 9d 12 9b STA $9b12,x ; (modplay.channel[0].smp_length + 2)
4474 : c8 __ __ INY
4475 : b1 1b __ LDA (ACCU + 0),y 
4477 : 9d 13 9b STA $9b13,x ; (modplay.channel[0].smp_length + 3)
447a : 18 __ __ CLC
447b : c8 __ __ INY
447c : b1 1b __ LDA (ACCU + 0),y 
447e : 65 43 __ ADC T0 + 0 
4480 : 9d 14 9b STA $9b14,x ; (modplay.channel[0].smp_loop_a + 0)
4483 : c8 __ __ INY
4484 : b1 1b __ LDA (ACCU + 0),y 
4486 : 65 44 __ ADC T0 + 1 
4488 : 9d 15 9b STA $9b15,x ; (modplay.channel[0].smp_loop_a + 1)
448b : c8 __ __ INY
448c : b1 1b __ LDA (ACCU + 0),y 
448e : 65 45 __ ADC T0 + 2 
4490 : 9d 16 9b STA $9b16,x ; (modplay.channel[0].smp_loop_a + 2)
4493 : c8 __ __ INY
4494 : b1 1b __ LDA (ACCU + 0),y 
4496 : 65 46 __ ADC T0 + 3 
4498 : 9d 17 9b STA $9b17,x ; (modplay.channel[0].smp_loop_a + 3)
449b : 18 __ __ CLC
449c : c8 __ __ INY
449d : b1 1b __ LDA (ACCU + 0),y 
449f : 65 43 __ ADC T0 + 0 
44a1 : 9d 18 9b STA $9b18,x ; (modplay.channel[0].smp_loop_b + 0)
44a4 : c8 __ __ INY
44a5 : b1 1b __ LDA (ACCU + 0),y 
44a7 : 65 44 __ ADC T0 + 1 
44a9 : 9d 19 9b STA $9b19,x ; (modplay.channel[0].smp_loop_b + 1)
44ac : c8 __ __ INY
44ad : b1 1b __ LDA (ACCU + 0),y 
44af : 65 45 __ ADC T0 + 2 
44b1 : 9d 1a 9b STA $9b1a,x ; (modplay.channel[0].smp_loop_b + 2)
44b4 : c8 __ __ INY
44b5 : b1 1b __ LDA (ACCU + 0),y 
44b7 : 65 46 __ ADC T0 + 3 
44b9 : 9d 1b 9b STA $9b1b,x ; (modplay.channel[0].smp_loop_b + 3)
.s5:
44bc : a0 01 __ LDY #$01
44be : b1 11 __ LDA (P4),y ; (n + 0)
44c0 : 85 0d __ STA P0 
44c2 : c8 __ __ INY
44c3 : b1 11 __ LDA (P4),y ; (n + 0)
44c5 : 85 0e __ STA P1 
44c7 : c8 __ __ INY
44c8 : 05 0d __ ORA P0 
44ca : f0 6f __ BEQ $453b ; (apply_note.s6 + 0)
.s10:
44cc : b1 11 __ LDA (P4),y ; (n + 0)
44ce : c9 03 __ CMP #$03
44d0 : f0 69 __ BEQ $453b ; (apply_note.s6 + 0)
.s11:
44d2 : a6 47 __ LDX T3 + 0 
44d4 : bd ea 9a LDA $9aea,x ; (modplay.channel[0].sample_num + 0)
44d7 : f0 1a __ BEQ $44f3 ; (apply_note.s18 + 0)
.s13:
44d9 : 85 1b __ STA ACCU + 0 
44db : a9 00 __ LDA #$00
44dd : 85 1c __ STA ACCU + 1 
44df : a9 13 __ LDA #$13
44e1 : 20 7e 74 JSR $747e ; (mul16by8 + 0)
44e4 : a9 9c __ LDA #$9c
44e6 : 85 43 __ STA T0 + 0 
44e8 : 18 __ __ CLC
44e9 : a9 98 __ LDA #$98
44eb : 65 1c __ ADC ACCU + 1 
44ed : 85 44 __ STA T0 + 1 
44ef : a4 1b __ LDY ACCU + 0 
44f1 : b1 43 __ LDA (T0 + 0),y 
.s18:
44f3 : 85 0f __ STA P2 
44f5 : 20 86 45 JSR $4586 ; (period_finetune.s4 + 0)
44f8 : a5 1b __ LDA ACCU + 0 
44fa : 85 0d __ STA P0 
44fc : a6 47 __ LDX T3 + 0 
44fe : 9d eb 9a STA $9aeb,x ; (modplay.channel[0].period + 0)
4501 : a5 1c __ LDA ACCU + 1 
4503 : 85 0e __ STA P1 
4505 : 9d ec 9a STA $9aec,x ; (modplay.channel[0].period + 1)
4508 : 20 35 46 JSR $4635 ; (period_to_rate.s4 + 0)
450b : a5 1b __ LDA ACCU + 0 
450d : a6 47 __ LDX T3 + 0 
450f : 9d ed 9a STA $9aed,x ; (modplay.channel[0].rate + 0)
4512 : a5 1c __ LDA ACCU + 1 
4514 : 9d ee 9a STA $9aee,x ; (modplay.channel[0].rate + 1)
4517 : a0 00 __ LDY #$00
4519 : b1 11 __ LDA (P4),y ; (n + 0)
451b : 9d 01 9b STA $9b01,x ; (modplay.channel[0].last_note + 0)
451e : a0 03 __ LDY #$03
4520 : b1 11 __ LDA (P4),y ; (n + 0)
4522 : c9 03 __ CMP #$03
4524 : f0 15 __ BEQ $453b ; (apply_note.s6 + 0)
.s12:
4526 : a8 __ __ TAY
4527 : a9 00 __ LDA #$00
4529 : 9d f7 9a STA $9af7,x ; (modplay.channel[0].vib_pos + 0)
452c : 9d fb 9a STA $9afb,x ; (modplay.channel[0].trm_pos + 0)
452f : 9d 00 9b STA $9b00,x ; (modplay.channel[0].arp_counter + 0)
4532 : a9 01 __ LDA #$01
4534 : 9d 0a 9b STA $9b0a,x ; (modplay.channel[0].needs_start + 0)
4537 : 98 __ __ TYA
4538 : 4c 3d 45 JMP $453d ; (apply_note.s16 + 0)
.s6:
453b : b1 11 __ LDA (P4),y ; (n + 0)
.s16:
453d : c9 03 __ CMP #$03
453f : d0 44 __ BNE $4585 ; (apply_note.s3 + 0)
.s7:
4541 : a0 01 __ LDY #$01
4543 : b1 11 __ LDA (P4),y ; (n + 0)
4545 : 85 0d __ STA P0 
4547 : c8 __ __ INY
4548 : 11 11 __ ORA (P4),y ; (n + 0)
454a : f0 39 __ BEQ $4585 ; (apply_note.s3 + 0)
.s8:
454c : b1 11 __ LDA (P4),y ; (n + 0)
454e : 85 0e __ STA P1 
4550 : a6 47 __ LDX T3 + 0 
4552 : bd ea 9a LDA $9aea,x ; (modplay.channel[0].sample_num + 0)
4555 : f0 1a __ BEQ $4571 ; (apply_note.s17 + 0)
.s9:
4557 : 85 1b __ STA ACCU + 0 
4559 : a9 00 __ LDA #$00
455b : 85 1c __ STA ACCU + 1 
455d : a9 13 __ LDA #$13
455f : 20 7e 74 JSR $747e ; (mul16by8 + 0)
4562 : a9 9c __ LDA #$9c
4564 : 85 43 __ STA T0 + 0 
4566 : 18 __ __ CLC
4567 : a9 98 __ LDA #$98
4569 : 65 1c __ ADC ACCU + 1 
456b : 85 44 __ STA T0 + 1 
456d : a4 1b __ LDY ACCU + 0 
456f : b1 43 __ LDA (T0 + 0),y 
.s17:
4571 : 85 0f __ STA P2 
4573 : 20 86 45 JSR $4586 ; (period_finetune.s4 + 0)
4576 : 20 2d 46 JSR $462d ; (period_to_rate@proxy + 0)
4579 : a5 1b __ LDA ACCU + 0 
457b : a6 47 __ LDX T3 + 0 
457d : 9d f3 9a STA $9af3,x ; (modplay.channel[0].porta_target + 0)
4580 : a5 1c __ LDA ACCU + 1 
4582 : 9d f4 9a STA $9af4,x ; (modplay.channel[0].porta_target + 1)
.s3:
4585 : 60 __ __ RTS
--------------------------------------------------------------------
period_finetune: ; period_finetune(u16,u8)->u16
;  59, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4586 : a5 0f __ LDA P2 ; (finetune_raw + 0)
4588 : c9 08 __ CMP #$08
458a : b0 03 __ BCS $458f ; (period_finetune.s14 + 0)
458c : 4c 24 46 JMP $4624 ; (period_finetune.s5 + 0)
.s14:
458f : e9 10 __ SBC #$10
4591 : 85 0f __ STA P2 ; (finetune_raw + 0)
4593 : f0 06 __ BEQ $459b ; (period_finetune.s6 + 0)
.s7:
4595 : a5 0e __ LDA P1 ; (period + 1)
4597 : 05 0d __ ORA P0 ; (period + 0)
4599 : d0 09 __ BNE $45a4 ; (period_finetune.s8 + 0)
.s6:
459b : a5 0d __ LDA P0 ; (period + 0)
459d : 85 1b __ STA ACCU + 0 
459f : a5 0e __ LDA P1 ; (period + 1)
45a1 : 4c 21 46 JMP $4621 ; (period_finetune.s3 + 0)
.s8:
45a4 : a5 0f __ LDA P2 ; (finetune_raw + 0)
45a6 : 10 05 __ BPL $45ad ; (period_finetune.s9 + 0)
.s13:
45a8 : 38 __ __ SEC
45a9 : a9 00 __ LDA #$00
45ab : e5 0f __ SBC P2 ; (finetune_raw + 0)
.s9:
45ad : a6 0d __ LDX P0 ; (period + 0)
45af : 86 1b __ STX ACCU + 0 
45b1 : a6 0e __ LDX P1 ; (period + 1)
45b3 : 86 1c __ STX ACCU + 1 
45b5 : a2 00 __ LDX #$00
45b7 : 86 1d __ STX ACCU + 2 
45b9 : 86 1e __ STX ACCU + 3 
45bb : 20 b6 74 JSR $74b6 ; (mul32by8 + 0)
45be : a5 07 __ LDA WORK + 4 
45c0 : 85 1b __ STA ACCU + 0 
45c2 : a5 08 __ LDA WORK + 5 
45c4 : 85 1c __ STA ACCU + 1 
45c6 : a5 09 __ LDA WORK + 6 
45c8 : 85 1d __ STA ACCU + 2 
45ca : a5 0a __ LDA WORK + 7 
45cc : 85 1e __ STA ACCU + 3 
45ce : a9 00 __ LDA #$00
45d0 : 85 05 __ STA WORK + 2 
45d2 : 85 06 __ STA WORK + 3 
45d4 : a9 e9 __ LDA #$e9
45d6 : 85 03 __ STA WORK + 0 
45d8 : a9 02 __ LDA #$02
45da : 85 04 __ STA WORK + 1 
45dc : 20 f2 75 JSR $75f2 ; (mul32 + 0)
45df : a5 07 __ LDA WORK + 4 
45e1 : 85 1b __ STA ACCU + 0 
45e3 : a5 08 __ LDA WORK + 5 
45e5 : 85 1c __ STA ACCU + 1 
45e7 : a5 09 __ LDA WORK + 6 
45e9 : 85 1d __ STA ACCU + 2 
45eb : a5 0a __ LDA WORK + 7 
45ed : 85 1e __ STA ACCU + 3 
45ef : a9 a0 __ LDA #$a0
45f1 : 85 03 __ STA WORK + 0 
45f3 : a9 00 __ LDA #$00
45f5 : 85 06 __ STA WORK + 3 
45f7 : a9 86 __ LDA #$86
45f9 : 85 04 __ STA WORK + 1 
45fb : a9 01 __ LDA #$01
45fd : 85 05 __ STA WORK + 2 
45ff : 20 5a 76 JSR $765a ; (divs32 + 0)
4602 : a5 0f __ LDA P2 ; (finetune_raw + 0)
4604 : 30 02 __ BMI $4608 ; (period_finetune.s10 + 0)
.s12:
4606 : d0 0e __ BNE $4616 ; (period_finetune.s11 + 0)
.s10:
4608 : 18 __ __ CLC
4609 : a5 0d __ LDA P0 ; (period + 0)
460b : 65 1b __ ADC ACCU + 0 
460d : 85 1b __ STA ACCU + 0 
460f : a5 0e __ LDA P1 ; (period + 1)
4611 : 65 1c __ ADC ACCU + 1 
4613 : 4c 21 46 JMP $4621 ; (period_finetune.s3 + 0)
.s11:
4616 : 38 __ __ SEC
4617 : a5 0d __ LDA P0 ; (period + 0)
4619 : e5 1b __ SBC ACCU + 0 
461b : 85 1b __ STA ACCU + 0 
461d : a5 0e __ LDA P1 ; (period + 1)
461f : e5 1c __ SBC ACCU + 1 
.s3:
4621 : 85 1c __ STA ACCU + 1 
4623 : 60 __ __ RTS
.s5:
4624 : aa __ __ TAX
4625 : d0 03 __ BNE $462a ; (period_finetune.s5 + 6)
4627 : 4c 9b 45 JMP $459b ; (period_finetune.s6 + 0)
462a : 4c 95 45 JMP $4595 ; (period_finetune.s7 + 0)
--------------------------------------------------------------------
period_to_rate@proxy: ; period_to_rate@proxy
462d : a5 1b __ LDA ACCU + 0 
462f : 85 0d __ STA P0 
4631 : a5 1c __ LDA ACCU + 1 
4633 : 85 0e __ STA P1 
--------------------------------------------------------------------
period_to_rate: ; period_to_rate(u16)->u16
;  41, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4635 : a5 0e __ LDA P1 ; (period + 1)
4637 : 05 0d __ ORA P0 ; (period + 0)
4639 : f0 3e __ BEQ $4679 ; (period_to_rate.s6 + 0)
.s5:
463b : a5 0d __ LDA P0 ; (period + 0)
463d : 85 1b __ STA ACCU + 0 
463f : a5 0e __ LDA P1 ; (period + 1)
4641 : 85 1c __ STA ACCU + 1 
4643 : a9 00 __ LDA #$00
4645 : 85 1d __ STA ACCU + 2 
4647 : 85 1e __ STA ACCU + 3 
4649 : 85 05 __ STA WORK + 2 
464b : 85 06 __ STA WORK + 3 
464d : a9 d4 __ LDA #$d4
464f : 85 03 __ STA WORK + 0 
4651 : a9 30 __ LDA #$30
4653 : 85 04 __ STA WORK + 1 
4655 : 20 f2 75 JSR $75f2 ; (mul32 + 0)
4658 : a5 07 __ LDA WORK + 4 
465a : 85 1b __ STA ACCU + 0 
465c : a5 08 __ LDA WORK + 5 
465e : 85 1c __ STA ACCU + 1 
4660 : a5 09 __ LDA WORK + 6 
4662 : 85 1d __ STA ACCU + 2 
4664 : a5 0a __ LDA WORK + 7 
4666 : 85 1e __ STA ACCU + 3 
4668 : a9 00 __ LDA #$00
466a : 85 05 __ STA WORK + 2 
466c : 85 06 __ STA WORK + 3 
466e : a9 b6 __ LDA #$b6
4670 : 85 03 __ STA WORK + 0 
4672 : a9 1b __ LDA #$1b
4674 : 85 04 __ STA WORK + 1 
4676 : 4c 53 3f JMP $3f53 ; (divmod32 + 0)
.s6:
4679 : 85 1b __ STA ACCU + 0 
467b : 85 1c __ STA ACCU + 1 
.s3:
467d : 60 __ __ RTS
--------------------------------------------------------------------
fx_row: ; fx_row(u8)->void
; 242, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
467e : a4 0f __ LDY P2 ; (ch_idx + 0)
4680 : be fc 73 LDX $73fc,y ; (__multab50L + 0)
4683 : bd f2 9a LDA $9af2,x ; (modplay.channel[0].eparam + 0)
4686 : 85 1c __ STA ACCU + 1 
4688 : 4a __ __ LSR
4689 : 4a __ __ LSR
468a : 4a __ __ LSR
468b : 4a __ __ LSR
468c : 85 1b __ STA ACCU + 0 
468e : bd f1 9a LDA $9af1,x ; (modplay.channel[0].effect + 0)
4691 : c9 08 __ CMP #$08
4693 : d0 09 __ BNE $469e ; (fx_row.s5 + 0)
.s93:
4695 : a4 1b __ LDY ACCU + 0 
4697 : b9 00 79 LDA $7900,y ; (__multab17L + 0)
469a : 9d f0 9a STA $9af0,x ; (modplay.channel[0].pan + 0)
.s3:
469d : 60 __ __ RTS
.s5:
469e : a5 1c __ LDA ACCU + 1 
46a0 : 29 0f __ AND #$0f
46a2 : 85 43 __ STA T0 + 0 
46a4 : bd f1 9a LDA $9af1,x ; (modplay.channel[0].effect + 0)
46a7 : c9 08 __ CMP #$08
46a9 : b0 03 __ BCS $46ae ; (fx_row.s6 + 0)
46ab : 4c e5 48 JMP $48e5 ; (fx_row.s74 + 0)
.s6:
46ae : c9 0c __ CMP #$0c
46b0 : d0 03 __ BNE $46b5 ; (fx_row.s7 + 0)
46b2 : 4c d7 48 JMP $48d7 ; (fx_row.s73 + 0)
.s7:
46b5 : b0 03 __ BCS $46ba ; (fx_row.s8 + 0)
46b7 : 4c 5a 48 JMP $485a ; (fx_row.s57 + 0)
.s8:
46ba : c9 0e __ CMP #$0e
46bc : f0 33 __ BEQ $46f1 ; (fx_row.s16 + 0)
.s9:
46be : 90 14 __ BCC $46d4 ; (fx_row.s15 + 0)
.s10:
46c0 : c9 0f __ CMP #$0f
46c2 : d0 d9 __ BNE $469d ; (fx_row.s3 + 0)
.s11:
46c4 : a5 1c __ LDA ACCU + 1 
46c6 : f0 d5 __ BEQ $469d ; (fx_row.s3 + 0)
.s12:
46c8 : c9 20 __ CMP #$20
46ca : b0 04 __ BCS $46d0 ; (fx_row.s13 + 0)
.s14:
46cc : 8d 93 98 STA $9893 ; (modplay.ticks_per_row + 0)
46cf : 60 __ __ RTS
.s13:
46d0 : 8d 94 98 STA $9894 ; (modplay.bpm + 0)
46d3 : 60 __ __ RTS
.s15:
46d4 : ae 8f 98 LDX $988f ; (modplay.order_pos + 0)
46d7 : e8 __ __ INX
46d8 : 8e 9b 98 STX $989b ; (modplay.next_order + 0)
46db : a9 01 __ LDA #$01
46dd : 8d 9a 98 STA $989a ; (modplay.skip_row_advance + 0)
46e0 : a6 1b __ LDX ACCU + 0 
46e2 : bd eb 78 LDA $78eb,x ; (__multab10L + 0)
46e5 : 65 43 __ ADC T0 + 0 
46e7 : c9 40 __ CMP #$40
46e9 : 90 02 __ BCC $46ed ; (fx_row.s96 + 0)
.s97:
46eb : a9 00 __ LDA #$00
.s96:
46ed : 8d 9c 98 STA $989c ; (modplay.next_row + 0)
46f0 : 60 __ __ RTS
.s16:
46f1 : a5 1b __ LDA ACCU + 0 
46f3 : c9 07 __ CMP #$07
46f5 : d0 08 __ BNE $46ff ; (fx_row.s17 + 0)
.s56:
46f7 : a5 43 __ LDA T0 + 0 
46f9 : 29 07 __ AND #$07
46fb : 9d fa 9a STA $9afa,x ; (modplay.channel[0].trm_wave + 0)
46fe : 60 __ __ RTS
.s17:
46ff : 86 46 __ STX T3 + 0 
4701 : c9 07 __ CMP #$07
4703 : 90 6d __ BCC $4772 ; (fx_row.s34 + 0)
.s18:
4705 : c9 0c __ CMP #$0c
4707 : d0 0b __ BNE $4714 ; (fx_row.s19 + 0)
.s33:
4709 : a5 43 __ LDA T0 + 0 
470b : 9d 04 9b STA $9b04,x ; (modplay.channel[0].tick_stop + 0)
470e : a9 00 __ LDA #$00
4710 : 9d 05 9b STA $9b05,x ; (modplay.channel[0].tick_cur + 0)
4713 : 60 __ __ RTS
.s19:
4714 : 90 25 __ BCC $473b ; (fx_row.s25 + 0)
.s20:
4716 : c9 0d __ CMP #$0d
4718 : f0 0b __ BEQ $4725 ; (fx_row.s23 + 0)
.s21:
471a : c9 0e __ CMP #$0e
471c : f0 01 __ BEQ $471f ; (fx_row.s22 + 0)
471e : 60 __ __ RTS
.s22:
471f : a5 43 __ LDA T0 + 0 
4721 : 8d 95 98 STA $9895 ; (modplay.pattern_delay + 0)
4724 : 60 __ __ RTS
.s23:
4725 : a5 43 __ LDA T0 + 0 
4727 : 9d 04 9b STA $9b04,x ; (modplay.channel[0].tick_stop + 0)
472a : a9 00 __ LDA #$00
472c : 9d 05 9b STA $9b05,x ; (modplay.channel[0].tick_cur + 0)
472f : bd 0a 9b LDA $9b0a,x ; (modplay.channel[0].needs_start + 0)
4732 : 9d 06 9b STA $9b06,x ; (modplay.channel[0].cmd_backup + 0)
.s24:
4735 : a9 00 __ LDA #$00
4737 : 9d 0a 9b STA $9b0a,x ; (modplay.channel[0].needs_start + 0)
473a : 60 __ __ RTS
.s25:
473b : c9 0a __ CMP #$0a
473d : d0 0f __ BNE $474e ; (fx_row.s26 + 0)
.s32:
473f : bd ef 9a LDA $9aef,x ; (modplay.channel[0].volume + 0)
4742 : 18 __ __ CLC
4743 : 65 43 __ ADC T0 + 0 
.s28:
4745 : 20 6a 49 JSR $496a ; (clamp_vol.s4 + 0)
4748 : a6 46 __ LDX T3 + 0 
.s95:
474a : 9d ef 9a STA $9aef,x ; (modplay.channel[0].volume + 0)
474d : 60 __ __ RTS
.s26:
474e : b0 1a __ BCS $476a ; (fx_row.s27 + 0)
.s30:
4750 : c9 09 __ CMP #$09
4752 : f0 01 __ BEQ $4755 ; (fx_row.s31 + 0)
4754 : 60 __ __ RTS
.s31:
4755 : a5 43 __ LDA T0 + 0 
4757 : 9d 04 9b STA $9b04,x ; (modplay.channel[0].tick_stop + 0)
475a : a9 00 __ LDA #$00
475c : 9d 05 9b STA $9b05,x ; (modplay.channel[0].tick_cur + 0)
475f : bd 0a 9b LDA $9b0a,x ; (modplay.channel[0].needs_start + 0)
4762 : 9d 06 9b STA $9b06,x ; (modplay.channel[0].cmd_backup + 0)
4765 : a5 43 __ LDA T0 + 0 
4767 : d0 cc __ BNE $4735 ; (fx_row.s24 + 0)
4769 : 60 __ __ RTS
.s27:
476a : bd ef 9a LDA $9aef,x ; (modplay.channel[0].volume + 0)
476d : e5 43 __ SBC T0 + 0 
476f : 4c 45 47 JMP $4745 ; (fx_row.s28 + 0)
.s34:
4772 : c9 04 __ CMP #$04
4774 : d0 08 __ BNE $477e ; (fx_row.s35 + 0)
.s55:
4776 : a5 43 __ LDA T0 + 0 
4778 : 29 07 __ AND #$07
477a : 9d f6 9a STA $9af6,x ; (modplay.channel[0].vib_wave + 0)
477d : 60 __ __ RTS
.s35:
477e : 90 65 __ BCC $47e5 ; (fx_row.s46 + 0)
.s36:
4780 : c9 05 __ CMP #$05
4782 : d0 2f __ BNE $47b3 ; (fx_row.s37 + 0)
.s43:
4784 : bd ea 9a LDA $9aea,x ; (modplay.channel[0].sample_num + 0)
4787 : d0 01 __ BNE $478a ; (fx_row.s44 + 0)
4789 : 60 __ __ RTS
.s44:
478a : ad 0d 98 LDA $980d ; (modplay.num_samples + 0)
478d : dd ea 9a CMP $9aea,x ; (modplay.channel[0].sample_num + 0)
4790 : b0 01 __ BCS $4793 ; (fx_row.s45 + 0)
4792 : 60 __ __ RTS
.s45:
4793 : bd ea 9a LDA $9aea,x ; (modplay.channel[0].sample_num + 0)
4796 : 85 1b __ STA ACCU + 0 
4798 : a9 00 __ LDA #$00
479a : 85 1c __ STA ACCU + 1 
479c : a9 13 __ LDA #$13
479e : 20 7e 74 JSR $747e ; (mul16by8 + 0)
47a1 : a9 9c __ LDA #$9c
47a3 : 85 44 __ STA T1 + 0 
47a5 : 18 __ __ CLC
47a6 : a9 98 __ LDA #$98
47a8 : 65 1c __ ADC ACCU + 1 
47aa : 85 45 __ STA T1 + 1 
47ac : a5 43 __ LDA T0 + 0 
47ae : a4 1b __ LDY ACCU + 0 
47b0 : 91 44 __ STA (T1 + 0),y 
47b2 : 60 __ __ RTS
.s37:
47b3 : a5 43 __ LDA T0 + 0 
47b5 : d0 07 __ BNE $47be ; (fx_row.s39 + 0)
.s38:
47b7 : ad 91 98 LDA $9891 ; (modplay.row + 0)
47ba : 9d 02 9b STA $9b02,x ; (modplay.channel[0].loop_row + 0)
47bd : 60 __ __ RTS
.s39:
47be : bd 03 9b LDA $9b03,x ; (modplay.channel[0].loop_count + 0)
47c1 : f0 1a __ BEQ $47dd ; (fx_row.s40 + 0)
.s42:
47c3 : 38 __ __ SEC
47c4 : e9 01 __ SBC #$01
47c6 : 9d 03 9b STA $9b03,x ; (modplay.channel[0].loop_count + 0)
47c9 : d0 01 __ BNE $47cc ; (fx_row.s41 + 0)
47cb : 60 __ __ RTS
.s41:
47cc : a9 01 __ LDA #$01
47ce : 8d 9a 98 STA $989a ; (modplay.skip_row_advance + 0)
47d1 : ad 8f 98 LDA $988f ; (modplay.order_pos + 0)
47d4 : 8d 9b 98 STA $989b ; (modplay.next_order + 0)
47d7 : bd 02 9b LDA $9b02,x ; (modplay.channel[0].loop_row + 0)
47da : 4c ed 46 JMP $46ed ; (fx_row.s96 + 0)
.s40:
47dd : a5 43 __ LDA T0 + 0 
47df : 9d 03 9b STA $9b03,x ; (modplay.channel[0].loop_count + 0)
47e2 : 4c cc 47 JMP $47cc ; (fx_row.s41 + 0)
.s46:
47e5 : c9 02 __ CMP #$02
47e7 : f0 4e __ BEQ $4837 ; (fx_row.s54 + 0)
.s47:
47e9 : 90 01 __ BCC $47ec ; (fx_row.s48 + 0)
47eb : 60 __ __ RTS
.s48:
47ec : c9 01 __ CMP #$01
47ee : f0 01 __ BEQ $47f1 ; (fx_row.s49 + 0)
47f0 : 60 __ __ RTS
.s49:
47f1 : bd ec 9a LDA $9aec,x ; (modplay.channel[0].period + 1)
47f4 : d0 09 __ BNE $47ff ; (fx_row.s52 + 0)
.s53:
47f6 : a9 71 __ LDA #$71
47f8 : dd eb 9a CMP $9aeb,x ; (modplay.channel[0].period + 0)
47fb : a4 46 __ LDY T3 + 0 
47fd : b0 1e __ BCS $481d ; (fx_row.s50 + 0)
.s52:
47ff : bd eb 9a LDA $9aeb,x ; (modplay.channel[0].period + 0)
4802 : 38 __ __ SEC
4803 : e5 43 __ SBC T0 + 0 
4805 : 85 0d __ STA P0 
4807 : bd ec 9a LDA $9aec,x ; (modplay.channel[0].period + 1)
480a : e9 00 __ SBC #$00
480c : 85 0e __ STA P1 
480e : 20 3a 49 JSR $493a ; (clamp_period.s4 + 0)
4811 : a5 1b __ LDA ACCU + 0 
4813 : a4 46 __ LDY T3 + 0 
4815 : 99 eb 9a STA $9aeb,y ; (modplay.channel[0].period + 0)
4818 : a5 1c __ LDA ACCU + 1 
481a : 99 ec 9a STA $9aec,y ; (modplay.channel[0].period + 1)
.s50:
481d : b9 eb 9a LDA $9aeb,y ; (modplay.channel[0].period + 0)
4820 : 85 0d __ STA P0 
4822 : b9 ec 9a LDA $9aec,y ; (modplay.channel[0].period + 1)
.s51:
4825 : 85 0e __ STA P1 
4827 : 20 35 46 JSR $4635 ; (period_to_rate.s4 + 0)
482a : a5 1b __ LDA ACCU + 0 
482c : a6 46 __ LDX T3 + 0 
482e : 9d ed 9a STA $9aed,x ; (modplay.channel[0].rate + 0)
4831 : a5 1c __ LDA ACCU + 1 
4833 : 9d ee 9a STA $9aee,x ; (modplay.channel[0].rate + 1)
4836 : 60 __ __ RTS
.s54:
4837 : bd eb 9a LDA $9aeb,x ; (modplay.channel[0].period + 0)
483a : 18 __ __ CLC
483b : 65 43 __ ADC T0 + 0 
483d : 85 0d __ STA P0 
483f : bd ec 9a LDA $9aec,x ; (modplay.channel[0].period + 1)
4842 : 69 00 __ ADC #$00
4844 : 85 0e __ STA P1 
4846 : 20 3a 49 JSR $493a ; (clamp_period.s4 + 0)
4849 : a5 1b __ LDA ACCU + 0 
484b : 85 0d __ STA P0 
484d : a6 46 __ LDX T3 + 0 
484f : 9d eb 9a STA $9aeb,x ; (modplay.channel[0].period + 0)
4852 : a5 1c __ LDA ACCU + 1 
4854 : 9d ec 9a STA $9aec,x ; (modplay.channel[0].period + 1)
4857 : 4c 25 48 JMP $4825 ; (fx_row.s51 + 0)
.s57:
485a : c9 0a __ CMP #$0a
485c : f0 6e __ BEQ $48cc ; (fx_row.s71 + 0)
.s58:
485e : b0 5f __ BCS $48bf ; (fx_row.s59 + 0)
.s60:
4860 : a5 1c __ LDA ACCU + 1 
4862 : d0 01 __ BNE $4865 ; (fx_row.s61 + 0)
4864 : 60 __ __ RTS
.s61:
4865 : bd 13 9b LDA $9b13,x ; (modplay.channel[0].smp_length + 3)
4868 : d0 29 __ BNE $4893 ; (fx_row.s63 + 0)
.s68:
486a : bd 12 9b LDA $9b12,x ; (modplay.channel[0].smp_length + 2)
486d : d0 0b __ BNE $487a ; (fx_row.s62 + 0)
.s69:
486f : bd 11 9b LDA $9b11,x ; (modplay.channel[0].smp_length + 1)
4872 : d0 06 __ BNE $487a ; (fx_row.s62 + 0)
.s70:
4874 : dd 10 9b CMP $9b10,x ; (modplay.channel[0].smp_length + 0)
4877 : 90 01 __ BCC $487a ; (fx_row.s62 + 0)
4879 : 60 __ __ RTS
.s62:
487a : bd 13 9b LDA $9b13,x ; (modplay.channel[0].smp_length + 3)
487d : d0 14 __ BNE $4893 ; (fx_row.s63 + 0)
.s64:
487f : bd 12 9b LDA $9b12,x ; (modplay.channel[0].smp_length + 2)
4882 : d0 0f __ BNE $4893 ; (fx_row.s63 + 0)
.s65:
4884 : a5 1c __ LDA ACCU + 1 
4886 : dd 11 9b CMP $9b11,x ; (modplay.channel[0].smp_length + 1)
4889 : d0 05 __ BNE $4890 ; (fx_row.s67 + 0)
.s66:
488b : a9 00 __ LDA #$00
488d : dd 10 9b CMP $9b10,x ; (modplay.channel[0].smp_length + 0)
.s67:
4890 : 90 01 __ BCC $4893 ; (fx_row.s63 + 0)
4892 : 60 __ __ RTS
.s63:
4893 : bd 11 9b LDA $9b11,x ; (modplay.channel[0].smp_length + 1)
4896 : 38 __ __ SEC
4897 : e5 1c __ SBC ACCU + 1 
4899 : 9d 11 9b STA $9b11,x ; (modplay.channel[0].smp_length + 1)
489c : bd 12 9b LDA $9b12,x ; (modplay.channel[0].smp_length + 2)
489f : e9 00 __ SBC #$00
48a1 : 9d 12 9b STA $9b12,x ; (modplay.channel[0].smp_length + 2)
48a4 : b0 03 __ BCS $48a9 ; (fx_row.s99 + 0)
.s98:
48a6 : de 13 9b DEC $9b13,x ; (modplay.channel[0].smp_length + 3)
.s99:
48a9 : bd 0d 9b LDA $9b0d,x ; (modplay.channel[0].smp_start + 1)
48ac : 18 __ __ CLC
48ad : 65 1c __ ADC ACCU + 1 
48af : 9d 0d 9b STA $9b0d,x ; (modplay.channel[0].smp_start + 1)
48b2 : b0 01 __ BCS $48b5 ; (fx_row.s101 + 0)
48b4 : 60 __ __ RTS
.s101:
48b5 : fe 0e 9b INC $9b0e,x ; (modplay.channel[0].smp_start + 2)
48b8 : f0 01 __ BEQ $48bb ; (fx_row.s100 + 0)
48ba : 60 __ __ RTS
.s100:
48bb : fe 0f 9b INC $9b0f,x ; (modplay.channel[0].smp_start + 3)
48be : 60 __ __ RTS
.s59:
48bf : a9 01 __ LDA #$01
48c1 : 8d 9a 98 STA $989a ; (modplay.skip_row_advance + 0)
48c4 : a5 1c __ LDA ACCU + 1 
48c6 : 8d 9b 98 STA $989b ; (modplay.next_order + 0)
48c9 : 4c eb 46 JMP $46eb ; (fx_row.s97 + 0)
.s71:
48cc : a5 1b __ LDA ACCU + 0 
48ce : d0 03 __ BNE $48d3 ; (fx_row.s94 + 0)
.s72:
48d0 : 38 __ __ SEC
48d1 : e5 43 __ SBC T0 + 0 
.s94:
48d3 : 9d ff 9a STA $9aff,x ; (modplay.channel[0].volslide + 0)
48d6 : 60 __ __ RTS
.s73:
48d7 : a9 40 __ LDA #$40
48d9 : c5 1c __ CMP ACCU + 1 
48db : b0 03 __ BCS $48e0 ; (fx_row.s29 + 0)
48dd : 4c 4a 47 JMP $474a ; (fx_row.s95 + 0)
.s29:
48e0 : a5 1c __ LDA ACCU + 1 
48e2 : 4c 4a 47 JMP $474a ; (fx_row.s95 + 0)
.s74:
48e5 : c9 04 __ CMP #$04
48e7 : f0 41 __ BEQ $492a ; (fx_row.s89 + 0)
.s75:
48e9 : 90 23 __ BCC $490e ; (fx_row.s83 + 0)
.s76:
48eb : c9 06 __ CMP #$06
48ed : f0 dd __ BEQ $48cc ; (fx_row.s71 + 0)
.s77:
48ef : b0 07 __ BCS $48f8 ; (fx_row.s78 + 0)
.s82:
48f1 : a9 00 __ LDA #$00
48f3 : 9d 0a 9b STA $9b0a,x ; (modplay.channel[0].needs_start + 0)
48f6 : 90 d4 __ BCC $48cc ; (fx_row.s71 + 0)
.s78:
48f8 : bd ef 9a LDA $9aef,x ; (modplay.channel[0].volume + 0)
48fb : 9d fe 9a STA $9afe,x ; (modplay.channel[0].trm_basvol + 0)
48fe : a5 43 __ LDA T0 + 0 
4900 : f0 03 __ BEQ $4905 ; (fx_row.s79 + 0)
.s81:
4902 : 9d fc 9a STA $9afc,x ; (modplay.channel[0].trm_depth + 0)
.s79:
4905 : a5 1b __ LDA ACCU + 0 
4907 : d0 01 __ BNE $490a ; (fx_row.s80 + 0)
4909 : 60 __ __ RTS
.s80:
490a : 9d fd 9a STA $9afd,x ; (modplay.channel[0].trm_speed + 0)
490d : 60 __ __ RTS
.s83:
490e : a8 __ __ TAY
490f : d0 04 __ BNE $4915 ; (fx_row.s84 + 0)
.s88:
4911 : 9d 00 9b STA $9b00,x ; (modplay.channel[0].arp_counter + 0)
4914 : 60 __ __ RTS
.s84:
4915 : a9 02 __ LDA #$02
4917 : dd f1 9a CMP $9af1,x ; (modplay.channel[0].effect + 0)
491a : b0 05 __ BCS $4921 ; (fx_row.s87 + 0)
.s85:
491c : a9 00 __ LDA #$00
491e : 9d 0a 9b STA $9b0a,x ; (modplay.channel[0].needs_start + 0)
.s87:
4921 : a5 1c __ LDA ACCU + 1 
4923 : d0 01 __ BNE $4926 ; (fx_row.s86 + 0)
4925 : 60 __ __ RTS
.s86:
4926 : 9d f5 9a STA $9af5,x ; (modplay.channel[0].porta_speed + 0)
4929 : 60 __ __ RTS
.s89:
492a : a5 43 __ LDA T0 + 0 
492c : f0 03 __ BEQ $4931 ; (fx_row.s90 + 0)
.s92:
492e : 9d f8 9a STA $9af8,x ; (modplay.channel[0].vib_depth + 0)
.s90:
4931 : a5 1b __ LDA ACCU + 0 
4933 : d0 01 __ BNE $4936 ; (fx_row.s91 + 0)
4935 : 60 __ __ RTS
.s91:
4936 : 9d f9 9a STA $9af9,x ; (modplay.channel[0].vib_speed + 0)
4939 : 60 __ __ RTS
--------------------------------------------------------------------
clamp_period: ; clamp_period(u16)->u16
; 144, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
493a : a5 0e __ LDA P1 ; (p + 1)
493c : d0 0f __ BNE $494d ; (clamp_period.s5 + 0)
.s11:
493e : a5 0d __ LDA P0 ; (p + 0)
4940 : c9 71 __ CMP #$71
4942 : b0 09 __ BCS $494d ; (clamp_period.s5 + 0)
.s10:
4944 : a9 00 __ LDA #$00
4946 : a0 71 __ LDY #$71
.s3:
4948 : 84 1b __ STY ACCU + 0 
494a : 85 1c __ STA ACCU + 1 
494c : 60 __ __ RTS
.s5:
494d : a9 03 __ LDA #$03
494f : c5 0e __ CMP P1 ; (p + 1)
4951 : f0 04 __ BEQ $4957 ; (clamp_period.s8 + 0)
.s9:
4953 : 90 08 __ BCC $495d ; (clamp_period.s7 + 0)
4955 : b0 0c __ BCS $4963 ; (clamp_period.s6 + 0)
.s8:
4957 : a5 0d __ LDA P0 ; (p + 0)
4959 : c9 59 __ CMP #$59
495b : 90 06 __ BCC $4963 ; (clamp_period.s6 + 0)
.s7:
495d : a9 03 __ LDA #$03
495f : a0 58 __ LDY #$58
4961 : d0 e5 __ BNE $4948 ; (clamp_period.s3 + 0)
.s6:
4963 : a5 0e __ LDA P1 ; (p + 1)
4965 : a4 0d __ LDY P0 ; (p + 0)
4967 : 4c 48 49 JMP $4948 ; (clamp_period.s3 + 0)
--------------------------------------------------------------------
clamp_vol: ; clamp_vol(i8)->u8
; 132, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
496a : 85 1b __ STA ACCU + 0 
496c : aa __ __ TAX
496d : 10 03 __ BPL $4972 ; (clamp_vol.s5 + 0)
.s7:
496f : a9 00 __ LDA #$00
.s3:
4971 : 60 __ __ RTS
.s5:
4972 : a9 40 __ LDA #$40
4974 : c5 1b __ CMP ACCU + 0 
4976 : 90 f9 __ BCC $4971 ; (clamp_vol.s3 + 0)
.s6:
4978 : a5 1b __ LDA ACCU + 0 
497a : 60 __ __ RTS
--------------------------------------------------------------------
fx_tick: ; fx_tick(u8)->void
; 433, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
497b : a4 0f __ LDY P2 ; (ch_idx + 0)
497d : be fc 73 LDX $73fc,y ; (__multab50L + 0)
4980 : 86 45 __ STX T3 + 0 
4982 : bd f1 9a LDA $9af1,x ; (modplay.channel[0].effect + 0)
4985 : c9 05 __ CMP #$05
4987 : d0 05 __ BNE $498e ; (fx_tick.s6 + 0)
.s5:
4989 : a0 01 __ LDY #$01
498b : 4c f0 4a JMP $4af0 ; (fx_tick.s34 + 0)
.s6:
498e : 85 47 __ STA T5 + 0 
4990 : c9 05 __ CMP #$05
4992 : b0 03 __ BCS $4997 ; (fx_tick.s7 + 0)
4994 : 4c cd 4a JMP $4acd ; (fx_tick.s31 + 0)
.s7:
4997 : c9 0a __ CMP #$0a
4999 : d0 03 __ BNE $499e ; (fx_tick.s8 + 0)
499b : 4c be 4a JMP $4abe ; (fx_tick.s29 + 0)
.s8:
499e : 90 4d __ BCC $49ed ; (fx_tick.s20 + 0)
.s9:
49a0 : c9 0e __ CMP #$0e
49a2 : d0 21 __ BNE $49c5 ; (fx_tick.s3 + 0)
.s10:
49a4 : bd f2 9a LDA $9af2,x ; (modplay.channel[0].eparam + 0)
49a7 : 4a __ __ LSR
49a8 : 4a __ __ LSR
49a9 : 4a __ __ LSR
49aa : 4a __ __ LSR
49ab : c9 0c __ CMP #$0c
49ad : f0 2d __ BEQ $49dc ; (fx_tick.s18 + 0)
.s11:
49af : 90 15 __ BCC $49c6 ; (fx_tick.s15 + 0)
.s12:
49b1 : c9 0d __ CMP #$0d
49b3 : d0 10 __ BNE $49c5 ; (fx_tick.s3 + 0)
.s13:
49b5 : fe 05 9b INC $9b05,x ; (modplay.channel[0].tick_cur + 0)
49b8 : bd 05 9b LDA $9b05,x ; (modplay.channel[0].tick_cur + 0)
49bb : dd 04 9b CMP $9b04,x ; (modplay.channel[0].tick_stop + 0)
49be : d0 05 __ BNE $49c5 ; (fx_tick.s3 + 0)
.s14:
49c0 : a9 01 __ LDA #$01
49c2 : 9d 0a 9b STA $9b0a,x ; (modplay.channel[0].needs_start + 0)
.s3:
49c5 : 60 __ __ RTS
.s15:
49c6 : c9 09 __ CMP #$09
49c8 : d0 fb __ BNE $49c5 ; (fx_tick.s3 + 0)
.s16:
49ca : fe 05 9b INC $9b05,x ; (modplay.channel[0].tick_cur + 0)
49cd : bd 05 9b LDA $9b05,x ; (modplay.channel[0].tick_cur + 0)
49d0 : dd 04 9b CMP $9b04,x ; (modplay.channel[0].tick_stop + 0)
49d3 : 90 f0 __ BCC $49c5 ; (fx_tick.s3 + 0)
.s17:
49d5 : a9 00 __ LDA #$00
49d7 : 9d 05 9b STA $9b05,x ; (modplay.channel[0].tick_cur + 0)
49da : b0 e4 __ BCS $49c0 ; (fx_tick.s14 + 0)
.s18:
49dc : fe 05 9b INC $9b05,x ; (modplay.channel[0].tick_cur + 0)
49df : bd 05 9b LDA $9b05,x ; (modplay.channel[0].tick_cur + 0)
49e2 : dd 04 9b CMP $9b04,x ; (modplay.channel[0].tick_stop + 0)
49e5 : 90 de __ BCC $49c5 ; (fx_tick.s3 + 0)
.s19:
49e7 : a9 00 __ LDA #$00
.s60:
49e9 : 9d ef 9a STA $9aef,x ; (modplay.channel[0].volume + 0)
49ec : 60 __ __ RTS
.s20:
49ed : c9 06 __ CMP #$06
49ef : f0 58 __ BEQ $4a49 ; (fx_tick.s26 + 0)
.s21:
49f1 : c9 07 __ CMP #$07
49f3 : d0 d0 __ BNE $49c5 ; (fx_tick.s3 + 0)
.s22:
49f5 : bd fa 9a LDA $9afa,x ; (modplay.channel[0].trm_wave + 0)
49f8 : 85 0d __ STA P0 
49fa : bd fb 9a LDA $9afb,x ; (modplay.channel[0].trm_pos + 0)
49fd : 85 0e __ STA P1 
49ff : 20 d1 4b JSR $4bd1 ; (wave_value.s4 + 0)
4a02 : aa __ __ TAX
4a03 : a4 45 __ LDY T3 + 0 
4a05 : b9 fc 9a LDA $9afc,y ; (modplay.channel[0].trm_depth + 0)
4a08 : 85 1b __ STA ACCU + 0 
4a0a : a9 00 __ LDA #$00
4a0c : 85 1c __ STA ACCU + 1 
4a0e : 8a __ __ TXA
4a0f : 20 7e 74 JSR $747e ; (mul16by8 + 0)
4a12 : a5 1c __ LDA ACCU + 1 
4a14 : 85 43 __ STA T0 + 0 
4a16 : a5 1b __ LDA ACCU + 0 
4a18 : 0a __ __ ASL
4a19 : 26 43 __ ROL T0 + 0 
4a1b : 0a __ __ ASL
4a1c : 26 43 __ ROL T0 + 0 
4a1e : a5 0e __ LDA P1 
4a20 : a4 45 __ LDY T3 + 0 
4a22 : 29 10 __ AND #$10
4a24 : d0 09 __ BNE $4a2f ; (fx_tick.s25 + 0)
.s23:
4a26 : 18 __ __ CLC
4a27 : a5 43 __ LDA T0 + 0 
4a29 : 79 fe 9a ADC $9afe,y ; (modplay.channel[0].trm_basvol + 0)
4a2c : 4c 35 4a JMP $4a35 ; (fx_tick.s24 + 0)
.s25:
4a2f : b9 fe 9a LDA $9afe,y ; (modplay.channel[0].trm_basvol + 0)
4a32 : 38 __ __ SEC
4a33 : e5 43 __ SBC T0 + 0 
.s24:
4a35 : 20 6a 49 JSR $496a ; (clamp_vol.s4 + 0)
4a38 : a6 45 __ LDX T3 + 0 
4a3a : 9d ef 9a STA $9aef,x ; (modplay.channel[0].volume + 0)
4a3d : bd fd 9a LDA $9afd,x ; (modplay.channel[0].trm_speed + 0)
4a40 : 18 __ __ CLC
4a41 : 65 0e __ ADC P1 
4a43 : 29 3f __ AND #$3f
4a45 : 9d fb 9a STA $9afb,x ; (modplay.channel[0].trm_pos + 0)
4a48 : 60 __ __ RTS
.s26:
4a49 : bd f6 9a LDA $9af6,x ; (modplay.channel[0].vib_wave + 0)
4a4c : 85 0d __ STA P0 
4a4e : bd f7 9a LDA $9af7,x ; (modplay.channel[0].vib_pos + 0)
4a51 : 85 0e __ STA P1 
4a53 : 20 d1 4b JSR $4bd1 ; (wave_value.s4 + 0)
4a56 : aa __ __ TAX
4a57 : a4 45 __ LDY T3 + 0 
4a59 : b9 f8 9a LDA $9af8,y ; (modplay.channel[0].vib_depth + 0)
4a5c : 85 1b __ STA ACCU + 0 
4a5e : a9 00 __ LDA #$00
4a60 : 85 1c __ STA ACCU + 1 
4a62 : 8a __ __ TXA
4a63 : 20 7e 74 JSR $747e ; (mul16by8 + 0)
4a66 : a5 1c __ LDA ACCU + 1 
4a68 : 06 1b __ ASL ACCU + 0 
4a6a : 2a __ __ ROL
4a6b : 85 43 __ STA T0 + 0 
4a6d : a9 00 __ LDA #$00
4a6f : 2a __ __ ROL
4a70 : 85 44 __ STA T0 + 1 
4a72 : a5 0e __ LDA P1 
4a74 : 85 46 __ STA T4 + 0 
4a76 : a4 45 __ LDY T3 + 0 
4a78 : 29 10 __ AND #$10
4a7a : d0 0f __ BNE $4a8b ; (fx_tick.s30 + 0)
.s27:
4a7c : b9 eb 9a LDA $9aeb,y ; (modplay.channel[0].period + 0)
4a7f : 65 43 __ ADC T0 + 0 
4a81 : 85 0d __ STA P0 
4a83 : b9 ec 9a LDA $9aec,y ; (modplay.channel[0].period + 1)
4a86 : 65 44 __ ADC T0 + 1 
4a88 : 4c 98 4a JMP $4a98 ; (fx_tick.s28 + 0)
.s30:
4a8b : b9 eb 9a LDA $9aeb,y ; (modplay.channel[0].period + 0)
4a8e : 38 __ __ SEC
4a8f : e5 43 __ SBC T0 + 0 
4a91 : 85 0d __ STA P0 
4a93 : b9 ec 9a LDA $9aec,y ; (modplay.channel[0].period + 1)
4a96 : e5 44 __ SBC T0 + 1 
.s28:
4a98 : 85 0e __ STA P1 
4a9a : 20 3a 49 JSR $493a ; (clamp_period.s4 + 0)
4a9d : 20 2d 46 JSR $462d ; (period_to_rate@proxy + 0)
4aa0 : a5 1b __ LDA ACCU + 0 
4aa2 : a6 45 __ LDX T3 + 0 
4aa4 : 9d ed 9a STA $9aed,x ; (modplay.channel[0].rate + 0)
4aa7 : a5 1c __ LDA ACCU + 1 
4aa9 : 9d ee 9a STA $9aee,x ; (modplay.channel[0].rate + 1)
4aac : bd f9 9a LDA $9af9,x ; (modplay.channel[0].vib_speed + 0)
4aaf : 18 __ __ CLC
4ab0 : 65 46 __ ADC T4 + 0 
4ab2 : 29 3f __ AND #$3f
4ab4 : 9d f7 9a STA $9af7,x ; (modplay.channel[0].vib_pos + 0)
4ab7 : a5 47 __ LDA T5 + 0 
4ab9 : c9 06 __ CMP #$06
4abb : f0 01 __ BEQ $4abe ; (fx_tick.s29 + 0)
4abd : 60 __ __ RTS
.s29:
4abe : bd ef 9a LDA $9aef,x ; (modplay.channel[0].volume + 0)
4ac1 : 18 __ __ CLC
4ac2 : 7d ff 9a ADC $9aff,x ; (modplay.channel[0].volslide + 0)
4ac5 : 20 6a 49 JSR $496a ; (clamp_vol.s4 + 0)
4ac8 : a6 45 __ LDX T3 + 0 
4aca : 4c e9 49 JMP $49e9 ; (fx_tick.s60 + 0)
.s31:
4acd : c9 02 __ CMP #$02
4acf : d0 11 __ BNE $4ae2 ; (fx_tick.s32 + 0)
.s59:
4ad1 : bd f5 9a LDA $9af5,x ; (modplay.channel[0].porta_speed + 0)
4ad4 : 18 __ __ CLC
4ad5 : 7d eb 9a ADC $9aeb,x ; (modplay.channel[0].period + 0)
4ad8 : 85 0d __ STA P0 
4ada : bd ec 9a LDA $9aec,x ; (modplay.channel[0].period + 1)
4add : 69 00 __ ADC #$00
4adf : 4c ac 4b JMP $4bac ; (fx_tick.s57 + 0)
.s32:
4ae2 : b0 03 __ BCS $4ae7 ; (fx_tick.s33 + 0)
4ae4 : 4c 7e 4b JMP $4b7e ; (fx_tick.s51 + 0)
.s33:
4ae7 : a0 00 __ LDY #$00
4ae9 : c9 03 __ CMP #$03
4aeb : f0 03 __ BEQ $4af0 ; (fx_tick.s34 + 0)
4aed : 4c 49 4a JMP $4a49 ; (fx_tick.s26 + 0)
.s34:
4af0 : bd f3 9a LDA $9af3,x ; (modplay.channel[0].porta_target + 0)
4af3 : 85 43 __ STA T0 + 0 
4af5 : bd f4 9a LDA $9af4,x ; (modplay.channel[0].porta_target + 1)
4af8 : 85 44 __ STA T0 + 1 
4afa : 05 43 __ ORA T0 + 0 
4afc : f0 58 __ BEQ $4b56 ; (fx_tick.s35 + 0)
.s36:
4afe : bd ee 9a LDA $9aee,x ; (modplay.channel[0].rate + 1)
4b01 : 85 1c __ STA ACCU + 1 
4b03 : c5 44 __ CMP T0 + 1 
4b05 : d0 09 __ BNE $4b10 ; (fx_tick.s37 + 0)
.s50:
4b07 : a5 43 __ LDA T0 + 0 
4b09 : dd ed 9a CMP $9aed,x ; (modplay.channel[0].rate + 0)
4b0c : f0 48 __ BEQ $4b56 ; (fx_tick.s35 + 0)
.s61:
4b0e : a5 1c __ LDA ACCU + 1 
.s37:
4b10 : c5 44 __ CMP T0 + 1 
4b12 : d0 05 __ BNE $4b19 ; (fx_tick.s49 + 0)
.s48:
4b14 : bd ed 9a LDA $9aed,x ; (modplay.channel[0].rate + 0)
4b17 : c5 43 __ CMP T0 + 0 
.s49:
4b19 : 90 42 __ BCC $4b5d ; (fx_tick.s45 + 0)
.s38:
4b1b : a5 1c __ LDA ACCU + 1 
4b1d : d0 11 __ BNE $4b30 ; (fx_tick.s43 + 0)
.s44:
4b1f : bd f5 9a LDA $9af5,x ; (modplay.channel[0].porta_speed + 0)
4b22 : dd ed 9a CMP $9aed,x ; (modplay.channel[0].rate + 0)
4b25 : 90 09 __ BCC $4b30 ; (fx_tick.s43 + 0)
.s39:
4b27 : a5 43 __ LDA T0 + 0 
4b29 : 9d ed 9a STA $9aed,x ; (modplay.channel[0].rate + 0)
4b2c : a5 44 __ LDA T0 + 1 
4b2e : b0 0e __ BCS $4b3e ; (fx_tick.s40 + 0)
.s43:
4b30 : bd ed 9a LDA $9aed,x ; (modplay.channel[0].rate + 0)
4b33 : 38 __ __ SEC
4b34 : fd f5 9a SBC $9af5,x ; (modplay.channel[0].porta_speed + 0)
4b37 : 9d ed 9a STA $9aed,x ; (modplay.channel[0].rate + 0)
4b3a : a5 1c __ LDA ACCU + 1 
4b3c : e9 00 __ SBC #$00
.s40:
4b3e : 9d ee 9a STA $9aee,x ; (modplay.channel[0].rate + 1)
4b41 : c5 44 __ CMP T0 + 1 
4b43 : d0 05 __ BNE $4b4a ; (fx_tick.s47 + 0)
.s42:
4b45 : bd ed 9a LDA $9aed,x ; (modplay.channel[0].rate + 0)
4b48 : c5 43 __ CMP T0 + 0 
.s47:
4b4a : b0 0a __ BCS $4b56 ; (fx_tick.s35 + 0)
.s41:
4b4c : a5 43 __ LDA T0 + 0 
4b4e : 9d ed 9a STA $9aed,x ; (modplay.channel[0].rate + 0)
4b51 : a5 44 __ LDA T0 + 1 
4b53 : 9d ee 9a STA $9aee,x ; (modplay.channel[0].rate + 1)
.s35:
4b56 : 98 __ __ TYA
4b57 : f0 03 __ BEQ $4b5c ; (fx_tick.s35 + 6)
4b59 : 4c be 4a JMP $4abe ; (fx_tick.s29 + 0)
4b5c : 60 __ __ RTS
.s45:
4b5d : bd f5 9a LDA $9af5,x ; (modplay.channel[0].porta_speed + 0)
4b60 : 7d ed 9a ADC $9aed,x ; (modplay.channel[0].rate + 0)
4b63 : 85 1b __ STA ACCU + 0 
4b65 : 9d ed 9a STA $9aed,x ; (modplay.channel[0].rate + 0)
4b68 : a5 1c __ LDA ACCU + 1 
4b6a : 69 00 __ ADC #$00
4b6c : 85 1c __ STA ACCU + 1 
4b6e : 9d ee 9a STA $9aee,x ; (modplay.channel[0].rate + 1)
4b71 : a5 44 __ LDA T0 + 1 
4b73 : c5 1c __ CMP ACCU + 1 
4b75 : d0 d3 __ BNE $4b4a ; (fx_tick.s47 + 0)
.s46:
4b77 : a5 43 __ LDA T0 + 0 
4b79 : c5 1b __ CMP ACCU + 0 
4b7b : 4c 4a 4b JMP $4b4a ; (fx_tick.s47 + 0)
.s51:
4b7e : a8 __ __ TAY
4b7f : d0 10 __ BNE $4b91 ; (fx_tick.s55 + 0)
.s52:
4b81 : bd f2 9a LDA $9af2,x ; (modplay.channel[0].eparam + 0)
4b84 : d0 01 __ BNE $4b87 ; (fx_tick.s53 + 0)
4b86 : 60 __ __ RTS
.s53:
4b87 : bd ea 9a LDA $9aea,x ; (modplay.channel[0].sample_num + 0)
4b8a : d0 01 __ BNE $4b8d ; (fx_tick.s54 + 0)
4b8c : 60 __ __ RTS
.s54:
4b8d : fe 00 9b INC $9b00,x ; (modplay.channel[0].arp_counter + 0)
4b90 : 60 __ __ RTS
.s55:
4b91 : bd ec 9a LDA $9aec,x ; (modplay.channel[0].period + 1)
4b94 : d0 08 __ BNE $4b9e ; (fx_tick.s56 + 0)
.s58:
4b96 : a9 71 __ LDA #$71
4b98 : dd eb 9a CMP $9aeb,x ; (modplay.channel[0].period + 0)
4b9b : 90 01 __ BCC $4b9e ; (fx_tick.s56 + 0)
4b9d : 60 __ __ RTS
.s56:
4b9e : bd eb 9a LDA $9aeb,x ; (modplay.channel[0].period + 0)
4ba1 : 38 __ __ SEC
4ba2 : fd f5 9a SBC $9af5,x ; (modplay.channel[0].porta_speed + 0)
4ba5 : 85 0d __ STA P0 
4ba7 : bd ec 9a LDA $9aec,x ; (modplay.channel[0].period + 1)
4baa : e9 00 __ SBC #$00
.s57:
4bac : 85 0e __ STA P1 
4bae : 20 3a 49 JSR $493a ; (clamp_period.s4 + 0)
4bb1 : a5 1b __ LDA ACCU + 0 
4bb3 : 85 0d __ STA P0 
4bb5 : a6 45 __ LDX T3 + 0 
4bb7 : 9d eb 9a STA $9aeb,x ; (modplay.channel[0].period + 0)
4bba : a5 1c __ LDA ACCU + 1 
4bbc : 85 0e __ STA P1 
4bbe : 9d ec 9a STA $9aec,x ; (modplay.channel[0].period + 1)
4bc1 : 20 35 46 JSR $4635 ; (period_to_rate.s4 + 0)
4bc4 : a5 1b __ LDA ACCU + 0 
4bc6 : a6 45 __ LDX T3 + 0 
4bc8 : 9d ed 9a STA $9aed,x ; (modplay.channel[0].rate + 0)
4bcb : a5 1c __ LDA ACCU + 1 
4bcd : 9d ee 9a STA $9aee,x ; (modplay.channel[0].rate + 1)
4bd0 : 60 __ __ RTS
--------------------------------------------------------------------
wave_value: ; wave_value(u8,u8)->u8
; 156, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4bd1 : a5 0e __ LDA P1 ; (pos + 0)
4bd3 : 29 1f __ AND #$1f
4bd5 : a8 __ __ TAY
4bd6 : a5 0d __ LDA P0 ; (wave + 0)
4bd8 : 29 03 __ AND #$03
4bda : c9 01 __ CMP #$01
4bdc : d0 07 __ BNE $4be5 ; (wave_value.s5 + 0)
.s10:
4bde : 98 __ __ TYA
4bdf : 0a __ __ ASL
4be0 : 0a __ __ ASL
4be1 : 0a __ __ ASL
4be2 : 49 ff __ EOR #$ff
.s3:
4be4 : 60 __ __ RTS
.s5:
4be5 : aa __ __ TAX
4be6 : d0 04 __ BNE $4bec ; (wave_value.s6 + 0)
.s9:
4be8 : b9 57 7d LDA $7d57,y ; (vib_sine[0] + 0)
4beb : 60 __ __ RTS
.s6:
4bec : c9 02 __ CMP #$02
4bee : d0 03 __ BNE $4bf3 ; (wave_value.s7 + 0)
.s8:
4bf0 : a9 ff __ LDA #$ff
4bf2 : 60 __ __ RTS
.s7:
4bf3 : 98 __ __ TYA
4bf4 : 0a __ __ ASL
4bf5 : 0a __ __ ASL
4bf6 : 0a __ __ ASL
4bf7 : 60 __ __ RTS
--------------------------------------------------------------------
ua_update_channel: ; ua_update_channel(u8)->void
;  86, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s1:
4bf8 : 38 __ __ SEC
4bf9 : a5 23 __ LDA SP + 0 
4bfb : e9 0c __ SBC #$0c
4bfd : 85 23 __ STA SP + 0 
4bff : b0 02 __ BCS $4c03 ; (ua_update_channel.s1 + 11)
4c01 : c6 24 __ DEC SP + 1 
4c03 : a0 03 __ LDY #$03
4c05 : b9 53 00 LDA $0053,y 
4c08 : 91 23 __ STA (SP + 0),y 
4c0a : 88 __ __ DEY
4c0b : 10 f8 __ BPL $4c05 ; (ua_update_channel.s1 + 13)
.s4:
4c0d : ad 96 98 LDA $9896 ; (modplay.master_volume + 0)
4c10 : 85 1b __ STA ACCU + 0 
4c12 : a6 13 __ LDX P6 ; (ch + 0)
4c14 : 86 47 __ STX T1 + 0 
4c16 : bd fc 73 LDA $73fc,x ; (__multab50L + 0)
4c19 : 85 43 __ STA T0 + 0 
4c1b : aa __ __ TAX
4c1c : a9 00 __ LDA #$00
4c1e : 85 1c __ STA ACCU + 1 
4c20 : bd ef 9a LDA $9aef,x ; (modplay.channel[0].volume + 0)
4c23 : 20 7e 74 JSR $747e ; (mul16by8 + 0)
4c26 : a5 1c __ LDA ACCU + 1 
4c28 : 85 50 __ STA T6 + 0 
4c2a : a5 1b __ LDA ACCU + 0 
4c2c : 0a __ __ ASL
4c2d : 26 50 __ ROL T6 + 0 
4c2f : 0a __ __ ASL
4c30 : 26 50 __ ROL T6 + 0 
4c32 : a4 43 __ LDY T0 + 0 
4c34 : b9 0a 9b LDA $9b0a,y ; (modplay.channel[0].needs_start + 0)
4c37 : d0 5f __ BNE $4c98 ; (ua_update_channel.s10 + 0)
.s5:
4c39 : a5 50 __ LDA T6 + 0 
4c3b : d9 07 9b CMP $9b07,y ; (modplay.channel[0].ua_vol + 0)
4c3e : f0 0f __ BEQ $4c4f ; (ua_update_channel.s6 + 0)
.s9:
4c40 : 06 47 __ ASL T1 + 0 
4c42 : a4 47 __ LDY T1 + 0 
4c44 : be ea 79 LDX $79ea,y ; (audio_ch_base[0] + 0)
4c47 : 9d 01 df STA $df01,x 
4c4a : a4 43 __ LDY T0 + 0 
4c4c : 99 07 9b STA $9b07,y ; (modplay.channel[0].ua_vol + 0)
.s6:
4c4f : b9 ee 9a LDA $9aee,y ; (modplay.channel[0].rate + 1)
4c52 : d9 09 9b CMP $9b09,y ; (modplay.channel[0].ua_rate + 1)
4c55 : d0 08 __ BNE $4c5f ; (ua_update_channel.s7 + 0)
.s8:
4c57 : b9 ed 9a LDA $9aed,y ; (modplay.channel[0].rate + 0)
4c5a : d9 08 9b CMP $9b08,y ; (modplay.channel[0].ua_rate + 0)
4c5d : f0 23 __ BEQ $4c82 ; (ua_update_channel.s3 + 0)
.s7:
4c5f : b9 ed 9a LDA $9aed,y ; (modplay.channel[0].rate + 0)
4c62 : 85 0e __ STA P1 
4c64 : a5 13 __ LDA P6 ; (ch + 0)
4c66 : 0a __ __ ASL
4c67 : aa __ __ TAX
4c68 : b9 ee 9a LDA $9aee,y ; (modplay.channel[0].rate + 1)
4c6b : 85 0f __ STA P2 
4c6d : bc ea 79 LDY $79ea,x ; (audio_ch_base[0] + 0)
4c70 : 99 0e df STA $df0e,y 
4c73 : a5 0e __ LDA P1 
4c75 : 99 0f df STA $df0f,y 
4c78 : a6 43 __ LDX T0 + 0 
4c7a : 9d 08 9b STA $9b08,x ; (modplay.channel[0].ua_rate + 0)
4c7d : a5 0f __ LDA P2 
.s14:
4c7f : 9d 09 9b STA $9b09,x ; (modplay.channel[0].ua_rate + 1)
.s3:
4c82 : a0 03 __ LDY #$03
4c84 : b1 23 __ LDA (SP + 0),y 
4c86 : 99 53 00 STA $0053,y 
4c89 : 88 __ __ DEY
4c8a : 10 f8 __ BPL $4c84 ; (ua_update_channel.s3 + 2)
4c8c : 18 __ __ CLC
4c8d : a5 23 __ LDA SP + 0 
4c8f : 69 0c __ ADC #$0c
4c91 : 85 23 __ STA SP + 0 
4c93 : 90 02 __ BCC $4c97 ; (ua_update_channel.s3 + 21)
4c95 : e6 24 __ INC SP + 1 
4c97 : 60 __ __ RTS
.s10:
4c98 : 84 51 __ STY T7 + 0 
4c9a : a5 13 __ LDA P6 ; (ch + 0)
4c9c : 85 0d __ STA P0 
4c9e : a9 00 __ LDA #$00
4ca0 : 99 0a 9b STA $9b0a,y ; (modplay.channel[0].needs_start + 0)
4ca3 : b9 0c 9b LDA $9b0c,y ; (modplay.channel[0].smp_start + 0)
4ca6 : 85 0e __ STA P1 
4ca8 : b9 0d 9b LDA $9b0d,y ; (modplay.channel[0].smp_start + 1)
4cab : 85 0f __ STA P2 
4cad : b9 0e 9b LDA $9b0e,y ; (modplay.channel[0].smp_start + 2)
4cb0 : 85 10 __ STA P3 
4cb2 : b9 0f 9b LDA $9b0f,y ; (modplay.channel[0].smp_start + 3)
4cb5 : 85 11 __ STA P4 
4cb7 : 06 47 __ ASL T1 + 0 
4cb9 : a6 47 __ LDX T1 + 0 
4cbb : bd ea 79 LDA $79ea,x ; (audio_ch_base[0] + 0)
4cbe : 85 4f __ STA T5 + 0 
4cc0 : 85 53 __ STA T8 + 0 
4cc2 : b9 ed 9a LDA $9aed,y ; (modplay.channel[0].rate + 0)
4cc5 : 85 55 __ STA T9 + 0 
4cc7 : a9 df __ LDA #$df
4cc9 : 85 54 __ STA T8 + 1 
4ccb : b9 ee 9a LDA $9aee,y ; (modplay.channel[0].rate + 1)
4cce : 85 56 __ STA T9 + 1 
4cd0 : b9 10 9b LDA $9b10,y ; (modplay.channel[0].smp_length + 0)
4cd3 : 85 43 __ STA T0 + 0 
4cd5 : b9 11 9b LDA $9b11,y ; (modplay.channel[0].smp_length + 1)
4cd8 : 85 44 __ STA T0 + 1 
4cda : b9 12 9b LDA $9b12,y ; (modplay.channel[0].smp_length + 2)
4cdd : 85 45 __ STA T0 + 2 
4cdf : b9 13 9b LDA $9b13,y ; (modplay.channel[0].smp_length + 3)
4ce2 : 85 46 __ STA T0 + 3 
4ce4 : b9 0b 9b LDA $9b0b,y ; (modplay.channel[0].needs_loop + 0)
4ce7 : d0 03 __ BNE $4cec ; (ua_update_channel.s13 + 0)
4ce9 : 4c 71 4d JMP $4d71 ; (ua_update_channel.s11 + 0)
.s13:
4cec : a6 51 __ LDX T7 + 0 
4cee : bd 14 9b LDA $9b14,x ; (modplay.channel[0].smp_loop_a + 0)
4cf1 : 85 47 __ STA T1 + 0 
4cf3 : bd 15 9b LDA $9b15,x ; (modplay.channel[0].smp_loop_a + 1)
4cf6 : 85 48 __ STA T1 + 1 
4cf8 : bd 16 9b LDA $9b16,x ; (modplay.channel[0].smp_loop_a + 2)
4cfb : 85 49 __ STA T1 + 2 
4cfd : bd 17 9b LDA $9b17,x ; (modplay.channel[0].smp_loop_a + 3)
4d00 : 85 4a __ STA T1 + 3 
4d02 : bd 18 9b LDA $9b18,x ; (modplay.channel[0].smp_loop_b + 0)
4d05 : 85 4b __ STA T2 + 0 
4d07 : bd 19 9b LDA $9b19,x ; (modplay.channel[0].smp_loop_b + 1)
4d0a : 85 4c __ STA T2 + 1 
4d0c : bd 1a 9b LDA $9b1a,x ; (modplay.channel[0].smp_loop_b + 2)
4d0f : 85 4d __ STA T2 + 2 
4d11 : bd 1b 9b LDA $9b1b,x ; (modplay.channel[0].smp_loop_b + 3)
4d14 : 85 4e __ STA T2 + 3 
4d16 : a9 00 __ LDA #$00
4d18 : a6 4f __ LDX T5 + 0 
4d1a : 9d 00 df STA $df00,x 
4d1d : a5 50 __ LDA T6 + 0 
4d1f : 9d 01 df STA $df01,x 
4d22 : b9 f0 9a LDA $9af0,y ; (modplay.channel[0].pan + 0)
4d25 : 9d 02 df STA $df02,x 
4d28 : 20 af 4d JSR $4daf ; (ch_wr_sms.s4 + 0)
4d2b : 20 cb 4d JSR $4dcb ; (ch_wr_be24@proxy + 0)
4d2e : a5 0d __ LDA P0 
4d30 : 0a __ __ ASL
4d31 : aa __ __ TAX
4d32 : a5 56 __ LDA T9 + 1 
4d34 : bc ea 79 LDY $79ea,x ; (audio_ch_base[0] + 0)
4d37 : 99 0e df STA $df0e,y 
4d3a : a5 55 __ LDA T9 + 0 
4d3c : 99 0f df STA $df0f,y 
4d3f : a5 47 __ LDA T1 + 0 
4d41 : 85 0f __ STA P2 
4d43 : a9 11 __ LDA #$11
4d45 : 85 0e __ STA P1 
4d47 : a5 48 __ LDA T1 + 1 
4d49 : 85 10 __ STA P3 
4d4b : a5 49 __ LDA T1 + 2 
4d4d : 85 11 __ STA P4 
4d4f : a5 4a __ LDA T1 + 3 
4d51 : 85 12 __ STA P5 
4d53 : 20 df 4d JSR $4ddf ; (ch_wr_be24.s4 + 0)
4d56 : a5 4b __ LDA T2 + 0 
4d58 : 85 0f __ STA P2 
4d5a : a9 15 __ LDA #$15
4d5c : 85 0e __ STA P1 
4d5e : a5 4c __ LDA T2 + 1 
4d60 : 85 10 __ STA P3 
4d62 : a5 4d __ LDA T2 + 2 
4d64 : 85 11 __ STA P4 
4d66 : a5 4e __ LDA T2 + 3 
4d68 : 85 12 __ STA P5 
4d6a : 20 df 4d JSR $4ddf ; (ch_wr_be24.s4 + 0)
4d6d : a9 03 __ LDA #$03
4d6f : d0 29 __ BNE $4d9a ; (ua_update_channel.s12 + 0)
.s11:
4d71 : a6 4f __ LDX T5 + 0 
4d73 : 9d 00 df STA $df00,x 
4d76 : a5 50 __ LDA T6 + 0 
4d78 : 9d 01 df STA $df01,x 
4d7b : b9 f0 9a LDA $9af0,y ; (modplay.channel[0].pan + 0)
4d7e : 9d 02 df STA $df02,x 
4d81 : 20 af 4d JSR $4daf ; (ch_wr_sms.s4 + 0)
4d84 : 20 cb 4d JSR $4dcb ; (ch_wr_be24@proxy + 0)
4d87 : a5 0d __ LDA P0 
4d89 : 0a __ __ ASL
4d8a : aa __ __ TAX
4d8b : a5 56 __ LDA T9 + 1 
4d8d : bc ea 79 LDY $79ea,x ; (audio_ch_base[0] + 0)
4d90 : 99 0e df STA $df0e,y 
4d93 : a5 55 __ LDA T9 + 0 
4d95 : 99 0f df STA $df0f,y 
4d98 : a9 01 __ LDA #$01
.s12:
4d9a : a0 00 __ LDY #$00
4d9c : 91 53 __ STA (T8 + 0),y 
4d9e : a5 50 __ LDA T6 + 0 
4da0 : a6 51 __ LDX T7 + 0 
4da2 : 9d 07 9b STA $9b07,x ; (modplay.channel[0].ua_vol + 0)
4da5 : a5 55 __ LDA T9 + 0 
4da7 : 9d 08 9b STA $9b08,x ; (modplay.channel[0].ua_rate + 0)
4daa : a5 56 __ LDA T9 + 1 
4dac : 4c 7f 4c JMP $4c7f ; (ua_update_channel.s14 + 0)
--------------------------------------------------------------------
ch_wr_sms: ; ch_wr_sms(u8,u32)->void
;  40, "/home/xahmol/git/UltimateDemo2026/include/audio.c"
.s4:
4daf : a5 0d __ LDA P0 ; (ch + 0)
4db1 : 0a __ __ ASL
4db2 : a8 __ __ TAY
4db3 : a9 01 __ LDA #$01
4db5 : be ea 79 LDX $79ea,y ; (audio_ch_base[0] + 0)
4db8 : 9d 04 df STA $df04,x 
4dbb : a5 10 __ LDA P3 ; (addr + 2)
4dbd : 9d 05 df STA $df05,x 
4dc0 : a5 0f __ LDA P2 ; (addr + 1)
4dc2 : 9d 06 df STA $df06,x 
4dc5 : a5 0e __ LDA P1 ; (addr + 0)
4dc7 : 9d 07 df STA $df07,x 
.s3:
4dca : 60 __ __ RTS
--------------------------------------------------------------------
ch_wr_be24@proxy: ; ch_wr_be24@proxy
4dcb : a9 09 __ LDA #$09
4dcd : 85 0e __ STA P1 
4dcf : a5 43 __ LDA $43 
4dd1 : 85 0f __ STA P2 
4dd3 : a5 44 __ LDA $44 
4dd5 : 85 10 __ STA P3 
4dd7 : a5 45 __ LDA $45 
4dd9 : 85 11 __ STA P4 
4ddb : a5 46 __ LDA $46 
4ddd : 85 12 __ STA P5 
--------------------------------------------------------------------
ch_wr_be24: ; ch_wr_be24(u8,u8,u32)->void
;  52, "/home/xahmol/git/UltimateDemo2026/include/audio.c"
.s4:
4ddf : a5 0d __ LDA P0 ; (ch + 0)
4de1 : 0a __ __ ASL
4de2 : aa __ __ TAX
4de3 : bd ea 79 LDA $79ea,x ; (audio_ch_base[0] + 0)
4de6 : 65 0e __ ADC P1 ; (offset + 0)
4de8 : 85 1b __ STA ACCU + 0 
4dea : a9 df __ LDA #$df
4dec : 85 1c __ STA ACCU + 1 
4dee : a5 11 __ LDA P4 ; (val + 2)
4df0 : a0 00 __ LDY #$00
4df2 : 91 1b __ STA (ACCU + 0),y 
4df4 : a5 10 __ LDA P3 ; (val + 1)
4df6 : c8 __ __ INY
4df7 : 91 1b __ STA (ACCU + 0),y 
4df9 : a5 0f __ LDA P2 ; (val + 0)
4dfb : c8 __ __ INY
4dfc : 91 1b __ STA (ACCU + 0),y 
.s3:
4dfe : 60 __ __ RTS
--------------------------------------------------------------------
mandel_run: ; mandel_run()->void
;   4, "/home/xahmol/git/UltimateDemo2026/src/mandel.h"
.s4:
4dff : a9 8f __ LDA #$8f
4e01 : 20 f3 15 JSR $15f3 ; (turbo_set.s4 + 0)
4e04 : a9 35 __ LDA #$35
4e06 : 85 01 __ STA $01 
4e08 : a9 1f __ LDA #$1f
4e0a : 85 12 __ STA P5 
4e0c : a9 40 __ LDA #$40
4e0e : 85 11 __ STA P4 
4e10 : a9 00 __ LDA #$00
4e12 : 85 0f __ STA P2 
4e14 : 85 10 __ STA P3 
4e16 : a2 fa __ LDX #$fa
.l6:
4e18 : ca __ __ DEX
4e19 : 9d 00 c0 STA $c000,x 
4e1c : 9d fa c0 STA $c0fa,x 
4e1f : 9d f4 c1 STA $c1f4,x 
4e22 : 9d ee c2 STA $c2ee,x 
4e25 : d0 f1 __ BNE $4e18 ; (mandel_run.l6 + 0)
.s5:
4e27 : 85 0d __ STA P0 
4e29 : a9 e0 __ LDA #$e0
4e2b : 85 0e __ STA P1 
4e2d : 20 0f 21 JSR $210f ; (memset.s4 + 0)
4e30 : a9 04 __ LDA #$04
4e32 : 85 0d __ STA P0 
4e34 : a9 00 __ LDA #$00
4e36 : 85 10 __ STA P3 
4e38 : a9 e0 __ LDA #$e0
4e3a : 85 11 __ STA P4 
4e3c : a9 01 __ LDA #$01
4e3e : a2 fa __ LDX #$fa
.l8:
4e40 : ca __ __ DEX
4e41 : 9d 00 d8 STA $d800,x 
4e44 : 9d fa d8 STA $d8fa,x 
4e47 : 9d f4 d9 STA $d9f4,x 
4e4a : 9d ee da STA $daee,x 
4e4d : d0 f1 __ BNE $4e40 ; (mandel_run.l8 + 0)
.s7:
4e4f : a9 00 __ LDA #$00
4e51 : 85 0e __ STA P1 
4e53 : a9 c0 __ LDA #$c0
4e55 : 85 0f __ STA P2 
4e57 : 20 14 0f JSR $0f14 ; (vic_setmode.s4 + 0)
4e5a : a9 00 __ LDA #$00
4e5c : 8d 21 d0 STA $d021 
4e5f : 8d 20 d0 STA $d020 
4e62 : a9 81 __ LDA #$81
4e64 : 85 13 __ STA P6 
4e66 : a9 7d __ LDA #$7d
4e68 : 85 14 __ STA P7 
4e6a : 20 9f 4e JSR $4e9f ; (render.s1 + 0)
4e6d : a9 a9 __ LDA #$a9
4e6f : 85 0d __ STA P0 
4e71 : a9 7d __ LDA #$7d
4e73 : 85 0e __ STA P1 
4e75 : 20 32 51 JSR $5132 ; (colorize_standard.s4 + 0)
4e78 : a9 00 __ LDA #$00
4e7a : 8d 09 dc STA $dc09 
4e7d : 8d 08 dc STA $dc08 
.l9:
4e80 : ad 09 dc LDA $dc09 
4e83 : c9 05 __ CMP #$05
4e85 : 90 f9 __ BCC $4e80 ; (mandel_run.l9 + 0)
.s10:
4e87 : a9 00 __ LDA #$00
4e89 : 85 0d __ STA P0 
4e8b : 85 0e __ STA P1 
4e8d : 85 10 __ STA P3 
4e8f : a9 36 __ LDA #$36
4e91 : 85 01 __ STA $01 
4e93 : 20 0c 0f JSR $0f0c ; (vic_setmode@proxy + 0)
4e96 : a9 00 __ LDA #$00
4e98 : 8d 20 d0 STA $d020 
4e9b : 8d 21 d0 STA $d021 
.s3:
4e9e : 60 __ __ RTS
--------------------------------------------------------------------
render: ; render(const struct S#29011*)->void
; 120, "/home/xahmol/git/UltimateDemo2026/src/mandel.c"
.s1:
4e9f : a2 05 __ LDX #$05
4ea1 : b5 53 __ LDA T10 + 0,x 
4ea3 : 9d da bf STA $bfda,x ; (render@stack + 0)
4ea6 : ca __ __ DEX
4ea7 : 10 f8 __ BPL $4ea1 ; (render.s1 + 2)
.s4:
4ea9 : a9 40 __ LDA #$40
4eab : 85 11 __ STA P4 
4ead : a9 1f __ LDA #$1f
4eaf : 85 12 __ STA P5 
4eb1 : a9 00 __ LDA #$00
4eb3 : 85 0d __ STA P0 
4eb5 : a9 e0 __ LDA #$e0
4eb7 : 85 0e __ STA P1 
4eb9 : a0 06 __ LDY #$06
4ebb : b1 13 __ LDA (P6),y ; (f + 0)
4ebd : c8 __ __ INY
4ebe : 11 13 __ ORA (P6),y ; (f + 0)
4ec0 : d0 08 __ BNE $4eca ; (render.s24 + 0)
.s5:
4ec2 : c8 __ __ INY
4ec3 : b1 13 __ LDA (P6),y ; (f + 0)
4ec5 : c8 __ __ INY
4ec6 : 11 13 __ ORA (P6),y ; (f + 0)
4ec8 : f0 02 __ BEQ $4ecc ; (render.s6 + 0)
.s24:
4eca : a9 01 __ LDA #$01
.s6:
4ecc : 85 57 __ STA T12 + 0 
4ece : a9 00 __ LDA #$00
4ed0 : 85 0f __ STA P2 
4ed2 : 85 10 __ STA P3 
4ed4 : 20 0f 21 JSR $210f ; (memset.s4 + 0)
4ed7 : a9 00 __ LDA #$00
4ed9 : 85 4d __ STA T6 + 0 
.l7:
4edb : 29 07 __ AND #$07
4edd : 85 43 __ STA T0 + 0 
4edf : a5 4d __ LDA T6 + 0 
4ee1 : 29 f8 __ AND #$f8
4ee3 : 85 1b __ STA ACCU + 0 
4ee5 : 4a __ __ LSR
4ee6 : 4a __ __ LSR
4ee7 : 65 1b __ ADC ACCU + 0 
4ee9 : 4a __ __ LSR
4eea : 6a __ __ ROR
4eeb : 6a __ __ ROR
4eec : aa __ __ TAX
4eed : 29 c0 __ AND #$c0
4eef : 6a __ __ ROR
4ef0 : 05 43 __ ORA T0 + 0 
4ef2 : 85 4e __ STA T7 + 0 
4ef4 : 8a __ __ TXA
4ef5 : 29 1f __ AND #$1f
4ef7 : 09 e0 __ ORA #$e0
4ef9 : 85 4f __ STA T7 + 1 
4efb : a0 05 __ LDY #$05
4efd : b1 13 __ LDA (P6),y ; (f + 0)
4eff : 85 1b __ STA ACCU + 0 
4f01 : a9 00 __ LDA #$00
4f03 : 85 52 __ STA T9 + 0 
4f05 : 85 1c __ STA ACCU + 1 
4f07 : a5 4d __ LDA T6 + 0 
4f09 : 20 7e 74 JSR $747e ; (mul16by8 + 0)
4f0c : a0 02 __ LDY #$02
4f0e : b1 13 __ LDA (P6),y ; (f + 0)
4f10 : 18 __ __ CLC
4f11 : 65 1b __ ADC ACCU + 0 
4f13 : 85 50 __ STA T8 + 0 
4f15 : c8 __ __ INY
4f16 : b1 13 __ LDA (P6),y ; (f + 0)
4f18 : 65 1c __ ADC ACCU + 1 
4f1a : 85 51 __ STA T8 + 1 
.l8:
4f1c : a0 04 __ LDY #$04
4f1e : b1 13 __ LDA (P6),y ; (f + 0)
4f20 : 85 1b __ STA ACCU + 0 
4f22 : a9 00 __ LDA #$00
4f24 : 85 1c __ STA ACCU + 1 
4f26 : a5 52 __ LDA T9 + 0 
4f28 : 20 7e 74 JSR $747e ; (mul16by8 + 0)
4f2b : a0 00 __ LDY #$00
4f2d : b1 13 __ LDA (P6),y ; (f + 0)
4f2f : 18 __ __ CLC
4f30 : 65 1b __ ADC ACCU + 0 
4f32 : 85 49 __ STA T3 + 0 
4f34 : 85 53 __ STA T10 + 0 
4f36 : c8 __ __ INY
4f37 : b1 13 __ LDA (P6),y ; (f + 0)
4f39 : 65 1c __ ADC ACCU + 1 
4f3b : 85 4a __ STA T3 + 1 
4f3d : 85 54 __ STA T10 + 1 
4f3f : a5 57 __ LDA T12 + 0 
4f41 : d0 11 __ BNE $4f54 ; (render.s23 + 0)
.s9:
4f43 : 85 49 __ STA T3 + 0 
4f45 : 85 4a __ STA T3 + 1 
4f47 : 85 4b __ STA T4 + 0 
4f49 : 85 4c __ STA T4 + 1 
4f4b : a5 50 __ LDA T8 + 0 
4f4d : 85 55 __ STA T11 + 0 
4f4f : a5 51 __ LDA T8 + 1 
4f51 : 4c 6f 4f JMP $4f6f ; (render.s10 + 0)
.s23:
4f54 : a5 50 __ LDA T8 + 0 
4f56 : 85 4b __ STA T4 + 0 
4f58 : a5 51 __ LDA T8 + 1 
4f5a : 85 4c __ STA T4 + 1 
4f5c : a0 06 __ LDY #$06
4f5e : b1 13 __ LDA (P6),y ; (f + 0)
4f60 : 85 53 __ STA T10 + 0 
4f62 : c8 __ __ INY
4f63 : b1 13 __ LDA (P6),y ; (f + 0)
4f65 : 85 54 __ STA T10 + 1 
4f67 : c8 __ __ INY
4f68 : b1 13 __ LDA (P6),y ; (f + 0)
4f6a : 85 55 __ STA T11 + 0 
4f6c : c8 __ __ INY
4f6d : b1 13 __ LDA (P6),y ; (f + 0)
.s10:
4f6f : 85 56 __ STA T11 + 1 
4f71 : a9 00 __ LDA #$00
4f73 : 85 58 __ STA T13 + 0 
.l11:
4f75 : a6 49 __ LDX T3 + 0 
4f77 : a5 4a __ LDA T3 + 1 
4f79 : 10 0a __ BPL $4f85 ; (render.s12 + 0)
.s22:
4f7b : 38 __ __ SEC
4f7c : a9 00 __ LDA #$00
4f7e : e5 49 __ SBC T3 + 0 
4f80 : aa __ __ TAX
4f81 : a9 00 __ LDA #$00
4f83 : e5 4a __ SBC T3 + 1 
.s12:
4f85 : 86 0d __ STX P0 
4f87 : 86 0f __ STX P2 
4f89 : 85 0e __ STA P1 
4f8b : 85 10 __ STA P3 
4f8d : 20 99 50 JSR $5099 ; (lmul16u.s4 + 0)
4f90 : a5 1b __ LDA ACCU + 0 
4f92 : 85 45 __ STA T2 + 0 
4f94 : a5 1c __ LDA ACCU + 1 
4f96 : 85 46 __ STA T2 + 1 
4f98 : a5 1d __ LDA ACCU + 2 
4f9a : 85 47 __ STA T2 + 2 
4f9c : a5 1e __ LDA ACCU + 3 
4f9e : 85 48 __ STA T2 + 3 
4fa0 : a6 4b __ LDX T4 + 0 
4fa2 : a5 4c __ LDA T4 + 1 
4fa4 : 10 0a __ BPL $4fb0 ; (render.s13 + 0)
.s21:
4fa6 : 38 __ __ SEC
4fa7 : a9 00 __ LDA #$00
4fa9 : e5 4b __ SBC T4 + 0 
4fab : aa __ __ TAX
4fac : a9 00 __ LDA #$00
4fae : e5 4c __ SBC T4 + 1 
.s13:
4fb0 : 86 0d __ STX P0 
4fb2 : 86 0f __ STX P2 
4fb4 : 85 0e __ STA P1 
4fb6 : 85 10 __ STA P3 
4fb8 : 20 99 50 JSR $5099 ; (lmul16u.s4 + 0)
4fbb : 18 __ __ CLC
4fbc : a5 1b __ LDA ACCU + 0 
4fbe : 65 45 __ ADC T2 + 0 
4fc0 : a5 1c __ LDA ACCU + 1 
4fc2 : 65 46 __ ADC T2 + 1 
4fc4 : a5 1d __ LDA ACCU + 2 
4fc6 : 65 47 __ ADC T2 + 2 
4fc8 : a5 1e __ LDA ACCU + 3 
4fca : 65 48 __ ADC T2 + 3 
4fcc : c9 04 __ CMP #$04
4fce : 90 1b __ BCC $4feb ; (render.s14 + 0)
.s20:
4fd0 : a5 58 __ LDA T13 + 0 
4fd2 : 4a __ __ LSR
4fd3 : 4a __ __ LSR
4fd4 : 85 1b __ STA ACCU + 0 
4fd6 : a9 00 __ LDA #$00
4fd8 : 85 1c __ STA ACCU + 1 
4fda : 85 04 __ STA WORK + 1 
4fdc : a9 03 __ LDA #$03
4fde : 85 03 __ STA WORK + 0 
4fe0 : 20 6d 75 JSR $756d ; (divmod + 0)
4fe3 : 18 __ __ CLC
4fe4 : a5 05 __ LDA WORK + 2 
4fe6 : 69 01 __ ADC #$01
4fe8 : 4c 4a 50 JMP $504a ; (render.s18 + 0)
.s14:
4feb : a5 49 __ LDA T3 + 0 
4fed : 85 0d __ STA P0 
4fef : a5 4a __ LDA T3 + 1 
4ff1 : 85 0e __ STA P1 
4ff3 : a5 4b __ LDA T4 + 0 
4ff5 : 85 0f __ STA P2 
4ff7 : a5 4c __ LDA T4 + 1 
4ff9 : 85 10 __ STA P3 
4ffb : 38 __ __ SEC
4ffc : a5 45 __ LDA T2 + 0 
4ffe : e5 1b __ SBC ACCU + 0 
5000 : a5 46 __ LDA T2 + 1 
5002 : e5 1c __ SBC ACCU + 1 
5004 : 85 43 __ STA T0 + 0 
5006 : a5 47 __ LDA T2 + 2 
5008 : e5 1d __ SBC ACCU + 2 
500a : 85 44 __ STA T0 + 1 
500c : a5 48 __ LDA T2 + 3 
500e : e5 1e __ SBC ACCU + 3 
5010 : a2 04 __ LDX #$04
.l15:
5012 : 4a __ __ LSR
5013 : 66 44 __ ROR T0 + 1 
5015 : 66 43 __ ROR T0 + 0 
5017 : ca __ __ DEX
5018 : d0 f8 __ BNE $5012 ; (render.l15 + 0)
.s16:
501a : 18 __ __ CLC
501b : a5 43 __ LDA T0 + 0 
501d : 65 53 __ ADC T10 + 0 
501f : 85 49 __ STA T3 + 0 
5021 : a5 44 __ LDA T0 + 1 
5023 : 65 54 __ ADC T10 + 1 
5025 : 85 4a __ STA T3 + 1 
5027 : 20 c0 50 JSR $50c0 ; (lmul4f12s.s4 + 0)
502a : a5 1b __ LDA ACCU + 0 
502c : 0a __ __ ASL
502d : a8 __ __ TAY
502e : a5 1c __ LDA ACCU + 1 
5030 : 2a __ __ ROL
5031 : aa __ __ TAX
5032 : 98 __ __ TYA
5033 : 18 __ __ CLC
5034 : 65 55 __ ADC T11 + 0 
5036 : 85 4b __ STA T4 + 0 
5038 : 8a __ __ TXA
5039 : 65 56 __ ADC T11 + 1 
503b : 85 4c __ STA T4 + 1 
503d : e6 58 __ INC T13 + 0 
503f : a5 58 __ LDA T13 + 0 
5041 : c9 20 __ CMP #$20
5043 : b0 03 __ BCS $5048 ; (render.s17 + 0)
5045 : 4c 75 4f JMP $4f75 ; (render.l11 + 0)
.s17:
5048 : a9 00 __ LDA #$00
.s18:
504a : aa __ __ TAX
504b : a5 52 __ LDA T9 + 0 
504d : 29 03 __ AND #$03
504f : 0a __ __ ASL
5050 : a8 __ __ TAY
5051 : b9 b5 78 LDA $78b5,y ; (__shrtab192L + 0)
5054 : 85 1b __ STA ACCU + 0 
5056 : 49 ff __ EOR #$ff
5058 : 85 45 __ STA T2 + 0 
505a : a5 52 __ LDA T9 + 0 
505c : 29 fc __ AND #$fc
505e : 0a __ __ ASL
505f : 85 49 __ STA T3 + 0 
5061 : a5 4f __ LDA T7 + 1 
5063 : 69 00 __ ADC #$00
5065 : 85 4a __ STA T3 + 1 
5067 : a4 4e __ LDY T7 + 0 
5069 : b1 49 __ LDA (T3 + 0),y 
506b : 25 45 __ AND T2 + 0 
506d : 85 45 __ STA T2 + 0 
506f : bd d9 7d LDA $7dd9,x ; (cbytes[0] + 0)
5072 : 25 1b __ AND ACCU + 0 
5074 : 05 45 __ ORA T2 + 0 
5076 : 91 49 __ STA (T3 + 0),y 
5078 : e6 52 __ INC T9 + 0 
507a : a5 52 __ LDA T9 + 0 
507c : c9 a0 __ CMP #$a0
507e : b0 03 __ BCS $5083 ; (render.s19 + 0)
5080 : 4c 1c 4f JMP $4f1c ; (render.l8 + 0)
.s19:
5083 : e6 4d __ INC T6 + 0 
5085 : a5 4d __ LDA T6 + 0 
5087 : c9 c8 __ CMP #$c8
5089 : b0 03 __ BCS $508e ; (render.s3 + 0)
508b : 4c db 4e JMP $4edb ; (render.l7 + 0)
.s3:
508e : a2 05 __ LDX #$05
5090 : bd da bf LDA $bfda,x ; (render@stack + 0)
5093 : 95 53 __ STA T10 + 0,x 
5095 : ca __ __ DEX
5096 : 10 f8 __ BPL $5090 ; (render.s3 + 2)
5098 : 60 __ __ RTS
--------------------------------------------------------------------
lmul16u: ; lmul16u(u16,u16)->u32
;   5, "/home/xahmol/oscar64/include/fixmath.h"
.s4:
5099 : a9 00 __ LDA #$00
509b : 85 1d __ STA ACCU + 2 
509d : 85 1e __ STA ACCU + 3 
509f : a2 10 __ LDX #$10
50a1 : 46 0e __ LSR P1 
50a3 : 66 0d __ ROR P0 
50a5 : 90 0d __ BCC $50b4 ; (lmul16u.s4 + 27)
50a7 : 18 __ __ CLC
50a8 : a5 1d __ LDA ACCU + 2 
50aa : 65 0f __ ADC P2 
50ac : 85 1d __ STA ACCU + 2 
50ae : a5 1e __ LDA ACCU + 3 
50b0 : 65 10 __ ADC P3 
50b2 : 85 1e __ STA ACCU + 3 
50b4 : 66 1e __ ROR ACCU + 3 
50b6 : 66 1d __ ROR ACCU + 2 
50b8 : 66 1c __ ROR ACCU + 1 
50ba : 66 1b __ ROR ACCU + 0 
50bc : ca __ __ DEX
50bd : d0 e2 __ BNE $50a1 ; (lmul16u.s4 + 8)
.s3:
50bf : 60 __ __ RTS
--------------------------------------------------------------------
lmul4f12s: ; lmul4f12s(i16,i16)->i16
;  18, "/home/xahmol/oscar64/include/fixmath.h"
.s4:
50c0 : 38 __ __ SEC
50c1 : a5 0d __ LDA P0 
50c3 : 6a __ __ ROR
50c4 : 85 1b __ STA ACCU + 0 
50c6 : a9 00 __ LDA #$00
50c8 : 85 1c __ STA ACCU + 1 
50ca : 90 0b __ BCC $50d7 ; (lmul4f12s.s4 + 23)
50cc : a8 __ __ TAY
50cd : 18 __ __ CLC
50ce : a5 1c __ LDA ACCU + 1 
50d0 : 65 0f __ ADC P2 
50d2 : 85 1c __ STA ACCU + 1 
50d4 : 98 __ __ TYA
50d5 : 65 10 __ ADC P3 
50d7 : 6a __ __ ROR
50d8 : 66 1c __ ROR ACCU + 1 
50da : 46 1b __ LSR ACCU + 0 
50dc : 90 f9 __ BCC $50d7 ; (lmul4f12s.s4 + 23)
50de : d0 ec __ BNE $50cc ; (lmul4f12s.s4 + 12)
50e0 : a6 0e __ LDX P1 
50e2 : 86 1b __ STX ACCU + 0 
50e4 : a2 07 __ LDX #$07
50e6 : 46 1b __ LSR ACCU + 0 
50e8 : 90 0b __ BCC $50f5 ; (lmul4f12s.s4 + 53)
50ea : a8 __ __ TAY
50eb : 18 __ __ CLC
50ec : a5 1c __ LDA ACCU + 1 
50ee : 65 0f __ ADC P2 
50f0 : 85 1c __ STA ACCU + 1 
50f2 : 98 __ __ TYA
50f3 : 65 10 __ ADC P3 
50f5 : 6a __ __ ROR
50f6 : 66 1c __ ROR ACCU + 1 
50f8 : 66 1b __ ROR ACCU + 0 
50fa : ca __ __ DEX
50fb : d0 eb __ BNE $50e8 ; (lmul4f12s.s4 + 40)
50fd : 90 0a __ BCC $5109 ; (lmul4f12s.s4 + 73)
50ff : a8 __ __ TAY
5100 : a5 1c __ LDA ACCU + 1 
5102 : e5 0f __ SBC P2 
5104 : 85 1c __ STA ACCU + 1 
5106 : 98 __ __ TYA
5107 : e5 10 __ SBC P3 
5109 : 6a __ __ ROR
510a : 66 1c __ ROR ACCU + 1 
510c : 66 1b __ ROR ACCU + 0 
510e : 24 10 __ BIT P3 
5110 : 10 0b __ BPL $511d ; (lmul4f12s.s4 + 93)
5112 : aa __ __ TAX
5113 : 38 __ __ SEC
5114 : a5 1c __ LDA ACCU + 1 
5116 : e5 0d __ SBC P0 
5118 : 85 1c __ STA ACCU + 1 
511a : 8a __ __ TXA
511b : e5 0e __ SBC P1 
511d : 4a __ __ LSR
511e : 66 1c __ ROR ACCU + 1 
5120 : 66 1b __ ROR ACCU + 0 
5122 : 4a __ __ LSR
5123 : 66 1c __ ROR ACCU + 1 
5125 : 66 1b __ ROR ACCU + 0 
5127 : 4a __ __ LSR
5128 : 66 1c __ ROR ACCU + 1 
512a : 66 1b __ ROR ACCU + 0 
512c : 4a __ __ LSR
512d : 66 1c __ ROR ACCU + 1 
512f : 66 1b __ ROR ACCU + 0 
.s3:
5131 : 60 __ __ RTS
--------------------------------------------------------------------
colorize_standard: ; colorize_standard(const const struct S#29129[]*)->void
; 176, "/home/xahmol/git/UltimateDemo2026/src/mandel.c"
.s4:
5132 : a9 00 __ LDA #$00
5134 : 85 43 __ STA T0 + 0 
5136 : 85 44 __ STA T1 + 0 
5138 : 85 46 __ STA T2 + 0 
513a : 85 48 __ STA T3 + 0 
513c : a9 e0 __ LDA #$e0
513e : 85 45 __ STA T1 + 1 
5140 : a9 c0 __ LDA #$c0
5142 : 85 47 __ STA T2 + 1 
5144 : a9 d8 __ LDA #$d8
5146 : 85 49 __ STA T3 + 1 
.l5:
5148 : a9 00 __ LDA #$00
514a : 85 4a __ STA T4 + 0 
.l6:
514c : 0a __ __ ASL
514d : 0a __ __ ASL
514e : 0a __ __ ASL
514f : a2 00 __ LDX #$00
5151 : 90 02 __ BCC $5155 ; (colorize_standard.s51 + 0)
.s50:
5153 : e8 __ __ INX
5154 : 18 __ __ CLC
.s51:
5155 : 65 44 __ ADC T1 + 0 
5157 : 85 4b __ STA T5 + 0 
5159 : 8a __ __ TXA
515a : 65 45 __ ADC T1 + 1 
515c : 85 4c __ STA T5 + 1 
515e : a9 00 __ LDA #$00
5160 : 85 1c __ STA ACCU + 1 
5162 : 85 4d __ STA T10 + 0 
5164 : 85 4e __ STA T11 + 0 
5166 : aa __ __ TAX
5167 : a8 __ __ TAY
.l49:
5168 : b1 4b __ LDA (T5 + 0),y 
516a : 85 1b __ STA ACCU + 0 
516c : 0a __ __ ASL
516d : 2a __ __ ROL
516e : 29 01 __ AND #$01
5170 : 2a __ __ ROL
5171 : d0 04 __ BNE $5177 ; (colorize_standard.s43 + 0)
.s7:
5173 : e8 __ __ INX
5174 : 4c 8b 51 JMP $518b ; (colorize_standard.s8 + 0)
.s43:
5177 : c9 01 __ CMP #$01
5179 : d0 05 __ BNE $5180 ; (colorize_standard.s44 + 0)
.s47:
517b : e6 1c __ INC ACCU + 1 
517d : 4c 8b 51 JMP $518b ; (colorize_standard.s8 + 0)
.s44:
5180 : c9 02 __ CMP #$02
5182 : f0 05 __ BEQ $5189 ; (colorize_standard.s46 + 0)
.s45:
5184 : e6 4e __ INC T11 + 0 
5186 : 4c 8b 51 JMP $518b ; (colorize_standard.s8 + 0)
.s46:
5189 : e6 4d __ INC T10 + 0 
.s8:
518b : a5 1b __ LDA ACCU + 0 
518d : 29 30 __ AND #$30
518f : 4a __ __ LSR
5190 : 4a __ __ LSR
5191 : 4a __ __ LSR
5192 : 4a __ __ LSR
5193 : d0 04 __ BNE $5199 ; (colorize_standard.s38 + 0)
.s9:
5195 : e8 __ __ INX
5196 : 4c ad 51 JMP $51ad ; (colorize_standard.s10 + 0)
.s38:
5199 : c9 01 __ CMP #$01
519b : d0 05 __ BNE $51a2 ; (colorize_standard.s39 + 0)
.s42:
519d : e6 1c __ INC ACCU + 1 
519f : 4c ad 51 JMP $51ad ; (colorize_standard.s10 + 0)
.s39:
51a2 : c9 02 __ CMP #$02
51a4 : f0 05 __ BEQ $51ab ; (colorize_standard.s41 + 0)
.s40:
51a6 : e6 4e __ INC T11 + 0 
51a8 : 4c ad 51 JMP $51ad ; (colorize_standard.s10 + 0)
.s41:
51ab : e6 4d __ INC T10 + 0 
.s10:
51ad : a5 1b __ LDA ACCU + 0 
51af : 29 0c __ AND #$0c
51b1 : 4a __ __ LSR
51b2 : 4a __ __ LSR
51b3 : d0 04 __ BNE $51b9 ; (colorize_standard.s33 + 0)
.s11:
51b5 : e8 __ __ INX
51b6 : 4c cd 51 JMP $51cd ; (colorize_standard.s12 + 0)
.s33:
51b9 : c9 01 __ CMP #$01
51bb : d0 05 __ BNE $51c2 ; (colorize_standard.s34 + 0)
.s37:
51bd : e6 1c __ INC ACCU + 1 
51bf : 4c cd 51 JMP $51cd ; (colorize_standard.s12 + 0)
.s34:
51c2 : c9 02 __ CMP #$02
51c4 : f0 05 __ BEQ $51cb ; (colorize_standard.s36 + 0)
.s35:
51c6 : e6 4e __ INC T11 + 0 
51c8 : 4c cd 51 JMP $51cd ; (colorize_standard.s12 + 0)
.s36:
51cb : e6 4d __ INC T10 + 0 
.s12:
51cd : a5 1b __ LDA ACCU + 0 
51cf : 29 03 __ AND #$03
51d1 : d0 04 __ BNE $51d7 ; (colorize_standard.s28 + 0)
.s13:
51d3 : e8 __ __ INX
51d4 : 4c eb 51 JMP $51eb ; (colorize_standard.s14 + 0)
.s28:
51d7 : c9 01 __ CMP #$01
51d9 : d0 05 __ BNE $51e0 ; (colorize_standard.s29 + 0)
.s32:
51db : e6 1c __ INC ACCU + 1 
51dd : 4c eb 51 JMP $51eb ; (colorize_standard.s14 + 0)
.s29:
51e0 : c9 02 __ CMP #$02
51e2 : f0 05 __ BEQ $51e9 ; (colorize_standard.s31 + 0)
.s30:
51e4 : e6 4e __ INC T11 + 0 
51e6 : 4c eb 51 JMP $51eb ; (colorize_standard.s14 + 0)
.s31:
51e9 : e6 4d __ INC T10 + 0 
.s14:
51eb : c8 __ __ INY
51ec : c0 08 __ CPY #$08
51ee : b0 03 __ BCS $51f3 ; (colorize_standard.s15 + 0)
51f0 : 4c 68 51 JMP $5168 ; (colorize_standard.l49 + 0)
.s15:
51f3 : 18 __ __ CLC
51f4 : a5 4d __ LDA T10 + 0 
51f6 : 65 1c __ ADC ACCU + 1 
51f8 : 85 4b __ STA T5 + 0 
51fa : a9 00 __ LDA #$00
51fc : 2a __ __ ROL
51fd : a8 __ __ TAY
51fe : a5 4b __ LDA T5 + 0 
5200 : 65 4e __ ADC T11 + 0 
5202 : 85 4b __ STA T5 + 0 
5204 : 98 __ __ TYA
5205 : 69 00 __ ADC #$00
5207 : 05 4b __ ORA T5 + 0 
5209 : f0 02 __ BEQ $520d ; (colorize_standard.s53 + 0)
.s52:
520b : a9 01 __ LDA #$01
.s53:
520d : 85 4b __ STA T5 + 0 
520f : 8a __ __ TXA
5210 : f0 03 __ BEQ $5215 ; (colorize_standard.s16 + 0)
5212 : 4c b4 52 JMP $52b4 ; (colorize_standard.s26 + 0)
.s16:
5215 : a5 4b __ LDA T5 + 0 
5217 : f0 22 __ BEQ $523b ; (colorize_standard.s17 + 0)
.s19:
5219 : a5 1c __ LDA ACCU + 1 
521b : c5 4d __ CMP T10 + 0 
521d : b0 04 __ BCS $5223 ; (colorize_standard.s20 + 0)
.s25:
521f : a9 02 __ LDA #$02
5221 : 90 02 __ BCC $5225 ; (colorize_standard.s21 + 0)
.s20:
5223 : a9 01 __ LDA #$01
.s21:
5225 : 85 4b __ STA T5 + 0 
5227 : a5 4d __ LDA T10 + 0 
5229 : c5 4e __ CMP T11 + 0 
522b : b0 06 __ BCS $5233 ; (colorize_standard.s22 + 0)
.s23:
522d : a5 1c __ LDA ACCU + 1 
522f : c5 4e __ CMP T11 + 0 
5231 : 90 04 __ BCC $5237 ; (colorize_standard.s24 + 0)
.s22:
5233 : c6 4b __ DEC T5 + 0 
5235 : b0 04 __ BCS $523b ; (colorize_standard.s17 + 0)
.s24:
5237 : a9 02 __ LDA #$02
.s48:
5239 : 85 4b __ STA T5 + 0 
.s17:
523b : 18 __ __ CLC
523c : a5 4a __ LDA T4 + 0 
523e : 65 43 __ ADC T0 + 0 
5240 : 0a __ __ ASL
5241 : 0a __ __ ASL
5242 : 85 1b __ STA ACCU + 0 
5244 : a9 00 __ LDA #$00
5246 : 85 1c __ STA ACCU + 1 
5248 : 85 04 __ STA WORK + 1 
524a : a9 41 __ LDA #$41
524c : 85 03 __ STA WORK + 0 
524e : 20 6d 75 JSR $756d ; (divmod + 0)
5251 : a6 1b __ LDX ACCU + 0 
5253 : bd bc 78 LDA $78bc,x ; (__multab12L + 0)
5256 : 18 __ __ CLC
5257 : 65 0d __ ADC P0 ; (pal + 0)
5259 : 85 1b __ STA ACCU + 0 
525b : a5 0e __ LDA P1 ; (pal + 1)
525d : 69 00 __ ADC #$00
525f : aa __ __ TAX
5260 : a4 4b __ LDY T5 + 0 
5262 : b9 c0 78 LDA $78c0,y ; (__multab3L + 0)
5265 : 18 __ __ CLC
5266 : 65 1b __ ADC ACCU + 0 
5268 : 85 1b __ STA ACCU + 0 
526a : 90 01 __ BCC $526d ; (colorize_standard.s55 + 0)
.s54:
526c : e8 __ __ INX
.s55:
526d : 86 1c __ STX ACCU + 1 
526f : a0 00 __ LDY #$00
5271 : b1 1b __ LDA (ACCU + 0),y 
5273 : 0a __ __ ASL
5274 : 0a __ __ ASL
5275 : 0a __ __ ASL
5276 : 0a __ __ ASL
5277 : c8 __ __ INY
5278 : 11 1b __ ORA (ACCU + 0),y 
527a : 88 __ __ DEY
527b : 91 46 __ STA (T2 + 0),y 
527d : a0 02 __ LDY #$02
527f : b1 1b __ LDA (ACCU + 0),y 
5281 : a0 00 __ LDY #$00
5283 : 91 48 __ STA (T3 + 0),y 
5285 : e6 46 __ INC T2 + 0 
5287 : d0 02 __ BNE $528b ; (colorize_standard.s57 + 0)
.s56:
5289 : e6 47 __ INC T2 + 1 
.s57:
528b : e6 48 __ INC T3 + 0 
528d : d0 02 __ BNE $5291 ; (colorize_standard.s59 + 0)
.s58:
528f : e6 49 __ INC T3 + 1 
.s59:
5291 : e6 4a __ INC T4 + 0 
5293 : a5 4a __ LDA T4 + 0 
5295 : c9 28 __ CMP #$28
5297 : f0 03 __ BEQ $529c ; (colorize_standard.s18 + 0)
5299 : 4c 4c 51 JMP $514c ; (colorize_standard.l6 + 0)
.s18:
529c : a5 44 __ LDA T1 + 0 
529e : 69 3f __ ADC #$3f
52a0 : 85 44 __ STA T1 + 0 
52a2 : a5 45 __ LDA T1 + 1 
52a4 : 69 01 __ ADC #$01
52a6 : 85 45 __ STA T1 + 1 
52a8 : e6 43 __ INC T0 + 0 
52aa : a5 43 __ LDA T0 + 0 
52ac : c9 19 __ CMP #$19
52ae : f0 03 __ BEQ $52b3 ; (colorize_standard.s3 + 0)
52b0 : 4c 48 51 JMP $5148 ; (colorize_standard.l5 + 0)
.s3:
52b3 : 60 __ __ RTS
.s26:
52b4 : a5 4b __ LDA T5 + 0 
52b6 : f0 83 __ BEQ $523b ; (colorize_standard.s17 + 0)
.s27:
52b8 : a9 03 __ LDA #$03
52ba : 4c 39 52 JMP $5239 ; (colorize_standard.s48 + 0)
--------------------------------------------------------------------
ball_run: ; ball_run()->void
;   3, "/home/xahmol/git/UltimateDemo2026/src/ball.h"
.s1:
52bd : a2 0d __ LDX #$0d
52bf : b5 53 __ LDA T0 + 0,x 
52c1 : 9d af bf STA $bfaf,x ; (ball_run@stack + 0)
52c4 : ca __ __ DEX
52c5 : 10 f8 __ BPL $52bf ; (ball_run.s1 + 2)
.s4:
52c7 : a9 8f __ LDA #$8f
52c9 : 20 f3 15 JSR $15f3 ; (turbo_set.s4 + 0)
52cc : 20 7a 54 JSR $547a ; (ball_init.s4 + 0)
52cf : a9 00 __ LDA #$00
52d1 : 85 55 __ STA T1 + 0 
52d3 : 85 56 __ STA T2 + 0 
52d5 : 85 57 __ STA T3 + 0 
52d7 : 85 58 __ STA T4 + 0 
52d9 : 85 59 __ STA T5 + 0 
52db : a9 a8 __ LDA #$a8
52dd : 85 5a __ STA T6 + 0 
52df : a9 fd __ LDA #$fd
52e1 : 85 5b __ STA T6 + 1 
.l5:
52e3 : 2c 11 d0 BIT $d011 
52e6 : 30 fb __ BMI $52e3 ; (ball_run.l5 + 0)
.l6:
52e8 : 2c 11 d0 BIT $d011 
52eb : 10 fb __ BPL $52e8 ; (ball_run.l6 + 0)
.s7:
52ed : a9 00 __ LDA #$00
52ef : 85 0f __ STA P2 
52f1 : 85 10 __ STA P3 
52f3 : 85 0d __ STA P0 
52f5 : 20 1b 79 JSR $791b ; (memset@proxy + 0)
52f8 : a5 55 __ LDA T1 + 0 
52fa : 29 3f __ AND #$3f
52fc : aa __ __ TAX
52fd : bd 0f 7d LDA $7d0f,x ; (sin64[0] + 0)
5300 : 85 5c __ STA T7 + 0 
5302 : 29 80 __ AND #$80
5304 : 10 02 __ BPL $5308 ; (ball_run.s7 + 27)
5306 : a9 ff __ LDA #$ff
5308 : 85 5d __ STA T7 + 1 
530a : bd 0f 7d LDA $7d0f,x ; (sin64[0] + 0)
530d : 10 0d __ BPL $531c ; (ball_run.s8 + 0)
.s10:
530f : 38 __ __ SEC
5310 : a9 00 __ LDA #$00
5312 : e5 5c __ SBC T7 + 0 
5314 : 85 5c __ STA T7 + 0 
5316 : a9 00 __ LDA #$00
5318 : e5 5d __ SBC T7 + 1 
531a : 85 5d __ STA T7 + 1 
.s8:
531c : a5 58 __ LDA T4 + 0 
531e : 85 18 __ STA P11 
5320 : a5 57 __ LDA T3 + 0 
5322 : 29 3f __ AND #$3f
5324 : aa __ __ TAX
5325 : bd 0f 7d LDA $7d0f,x ; (sin64[0] + 0)
5328 : 85 60 __ STA T9 + 0 
532a : a5 56 __ LDA T2 + 0 
532c : 29 3f __ AND #$3f
532e : aa __ __ TAX
532f : bd 0f 7d LDA $7d0f,x ; (sin64[0] + 0)
5332 : 85 53 __ STA T0 + 0 
5334 : 29 80 __ AND #$80
5336 : 10 02 __ BPL $533a ; (ball_run.s8 + 30)
5338 : a9 ff __ LDA #$ff
533a : 85 54 __ STA T0 + 1 
533c : 20 d3 54 JSR $54d3 ; (draw_floor.s4 + 0)
533f : a5 53 __ LDA T0 + 0 
5341 : 0a __ __ ASL
5342 : 85 1b __ STA ACCU + 0 
5344 : a5 54 __ LDA T0 + 1 
5346 : 2a __ __ ROL
5347 : 06 1b __ ASL ACCU + 0 
5349 : 2a __ __ ROL
534a : aa __ __ TAX
534b : 18 __ __ CLC
534c : a5 1b __ LDA ACCU + 0 
534e : 65 53 __ ADC T0 + 0 
5350 : 85 1b __ STA ACCU + 0 
5352 : 8a __ __ TXA
5353 : 65 54 __ ADC T0 + 1 
5355 : 06 1b __ ASL ACCU + 0 
5357 : 2a __ __ ROL
5358 : 06 1b __ ASL ACCU + 0 
535a : 2a __ __ ROL
535b : 06 1b __ ASL ACCU + 0 
535d : 2a __ __ ROL
535e : 06 1b __ ASL ACCU + 0 
5360 : 2a __ __ ROL
5361 : 85 1c __ STA ACCU + 1 
5363 : 20 5a 79 JSR $795a ; (divs16@proxy + 0)
5366 : 18 __ __ CLC
5367 : a5 1b __ LDA ACCU + 0 
5369 : 69 f0 __ ADC #$f0
536b : 85 5e __ STA T8 + 0 
536d : a5 1c __ LDA ACCU + 1 
536f : 69 00 __ ADC #$00
5371 : 85 5f __ STA T8 + 1 
5373 : a5 60 __ LDA T9 + 0 
5375 : 85 1b __ STA ACCU + 0 
5377 : 29 80 __ AND #$80
5379 : 10 02 __ BPL $537d ; (ball_run.s8 + 97)
537b : a9 ff __ LDA #$ff
537d : 85 1c __ STA ACCU + 1 
537f : a9 1e __ LDA #$1e
5381 : 20 7e 74 JSR $747e ; (mul16by8 + 0)
5384 : 20 5a 79 JSR $795a ; (divs16@proxy + 0)
5387 : a9 b4 __ LDA #$b4
5389 : 20 7e 74 JSR $747e ; (mul16by8 + 0)
538c : 20 35 79 JSR $7935 ; (divs16@proxy + 0)
538f : 18 __ __ CLC
5390 : a5 1b __ LDA ACCU + 0 
5392 : 69 50 __ ADC #$50
5394 : 85 12 __ STA P5 
5396 : a5 1c __ LDA ACCU + 1 
5398 : 69 00 __ ADC #$00
539a : 85 13 __ STA P6 
539c : a9 50 __ LDA #$50
539e : 85 1b __ STA ACCU + 0 
53a0 : a9 46 __ LDA #$46
53a2 : 85 1c __ STA ACCU + 1 
53a4 : 20 35 79 JSR $7935 ; (divs16@proxy + 0)
53a7 : 18 __ __ CLC
53a8 : a5 1b __ LDA ACCU + 0 
53aa : 69 48 __ ADC #$48
53ac : 85 14 __ STA P7 
53ae : a5 1c __ LDA ACCU + 1 
53b0 : 69 00 __ ADC #$00
53b2 : 85 15 __ STA P8 
53b4 : a9 a0 __ LDA #$a0
53b6 : 85 1b __ STA ACCU + 0 
53b8 : a9 05 __ LDA #$05
53ba : 85 1c __ STA ACCU + 1 
53bc : 20 35 79 JSR $7935 ; (divs16@proxy + 0)
53bf : a5 1b __ LDA ACCU + 0 
53c1 : 85 16 __ STA P9 
53c3 : a5 1c __ LDA ACCU + 1 
53c5 : 85 17 __ STA P10 
53c7 : a9 1c __ LDA #$1c
53c9 : 85 1b __ STA ACCU + 0 
53cb : a9 02 __ LDA #$02
53cd : 85 1c __ STA ACCU + 1 
53cf : 20 35 79 JSR $7935 ; (divs16@proxy + 0)
53d2 : a5 1b __ LDA ACCU + 0 
53d4 : 8d ea bf STA $bfea ; (sstack + 0)
53d7 : a5 1c __ LDA ACCU + 1 
53d9 : 8d eb bf STA $bfeb ; (sstack + 1)
53dc : 20 32 59 JSR $5932 ; (draw_shadow.s4 + 0)
53df : a5 12 __ LDA P5 
53e1 : 8d ea bf STA $bfea ; (sstack + 0)
53e4 : a5 13 __ LDA P6 
53e6 : 8d eb bf STA $bfeb ; (sstack + 1)
53e9 : a5 59 __ LDA T5 + 0 
53eb : 8d ee bf STA $bfee ; (sstack + 4)
53ee : 18 __ __ CLC
53ef : 69 02 __ ADC #$02
53f1 : 85 59 __ STA T5 + 0 
53f3 : a5 5c __ LDA T7 + 0 
53f5 : 85 1b __ STA ACCU + 0 
53f7 : a5 5d __ LDA T7 + 1 
53f9 : 85 1c __ STA ACCU + 1 
53fb : a9 3c __ LDA #$3c
53fd : 20 7e 74 JSR $747e ; (mul16by8 + 0)
5400 : a9 7f __ LDA #$7f
5402 : 85 03 __ STA WORK + 0 
5404 : 20 69 75 JSR $7569 ; (divmod@proxy + 0)
5407 : 38 __ __ SEC
5408 : a9 64 __ LDA #$64
540a : e5 1b __ SBC ACCU + 0 
540c : 85 1b __ STA ACCU + 0 
540e : a9 00 __ LDA #$00
5410 : 85 1c __ STA ACCU + 1 
5412 : a9 b4 __ LDA #$b4
5414 : 20 7e 74 JSR $747e ; (mul16by8 + 0)
5417 : 20 35 79 JSR $7935 ; (divs16@proxy + 0)
541a : 18 __ __ CLC
541b : a5 1b __ LDA ACCU + 0 
541d : 69 48 __ ADC #$48
541f : 8d ec bf STA $bfec ; (sstack + 2)
5422 : a5 1c __ LDA ACCU + 1 
5424 : 69 00 __ ADC #$00
5426 : 8d ed bf STA $bfed ; (sstack + 3)
5429 : a9 40 __ LDA #$40
542b : 85 1b __ STA ACCU + 0 
542d : a9 0b __ LDA #$0b
542f : 85 1c __ STA ACCU + 1 
5431 : 20 35 79 JSR $7935 ; (divs16@proxy + 0)
5434 : a5 1b __ LDA ACCU + 0 
5436 : 8d ef bf STA $bfef ; (sstack + 5)
5439 : a5 1c __ LDA ACCU + 1 
543b : 8d f0 bf STA $bff0 ; (sstack + 6)
543e : 20 cb 5a JSR $5acb ; (draw_ball.s1 + 0)
5441 : e6 58 __ INC T4 + 0 
5443 : e6 57 __ INC T3 + 0 
5445 : e6 57 __ INC T3 + 0 
5447 : e6 56 __ INC T2 + 0 
5449 : e6 55 __ INC T1 + 0 
544b : e6 55 __ INC T1 + 0 
544d : e6 5a __ INC T6 + 0 
544f : f0 03 __ BEQ $5454 ; (ball_run.s11 + 0)
5451 : 4c e3 52 JMP $52e3 ; (ball_run.l5 + 0)
.s11:
5454 : e6 5b __ INC T6 + 1 
5456 : d0 f9 __ BNE $5451 ; (ball_run.s8 + 309)
.s9:
5458 : a9 00 __ LDA #$00
545a : 85 0d __ STA P0 
545c : 85 0e __ STA P1 
545e : 85 10 __ STA P3 
5460 : a9 36 __ LDA #$36
5462 : 85 01 __ STA $01 
5464 : 20 0c 0f JSR $0f0c ; (vic_setmode@proxy + 0)
5467 : a9 00 __ LDA #$00
5469 : 8d 20 d0 STA $d020 
546c : 8d 21 d0 STA $d021 
.s3:
546f : a2 0d __ LDX #$0d
5471 : bd af bf LDA $bfaf,x ; (ball_run@stack + 0)
5474 : 95 53 __ STA T0 + 0,x 
5476 : ca __ __ DEX
5477 : 10 f8 __ BPL $5471 ; (ball_run.s3 + 2)
5479 : 60 __ __ RTS
--------------------------------------------------------------------
ball_init: ; ball_init()->void
; 293, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
547a : 78 __ __ SEI
547b : a9 35 __ LDA #$35
547d : 85 01 __ STA $01 
547f : 20 2b 21 JSR $212b ; (mmap_trampoline.s4 + 0)
5482 : 58 __ __ CLI
5483 : a9 00 __ LDA #$00
5485 : 85 0f __ STA P2 
5487 : 85 10 __ STA P3 
5489 : 85 43 __ STA T0 + 0 
548b : 85 0d __ STA P0 
548d : 20 1b 79 JSR $791b ; (memset@proxy + 0)
5490 : a9 c0 __ LDA #$c0
5492 : 85 44 __ STA T0 + 1 
5494 : a9 00 __ LDA #$00
5496 : 85 1f __ STA ADDR + 0 
5498 : f0 02 __ BEQ $549c ; (ball_init.l7 + 0)
.s8:
549a : e6 44 __ INC T0 + 1 
.l7:
549c : a9 12 __ LDA #$12
549e : a0 00 __ LDY #$00
54a0 : 91 43 __ STA (T0 + 0),y 
54a2 : 18 __ __ CLC
54a3 : a5 44 __ LDA T0 + 1 
54a5 : 69 18 __ ADC #$18
54a7 : 85 20 __ STA ADDR + 1 
54a9 : a9 0c __ LDA #$0c
54ab : a4 43 __ LDY T0 + 0 
54ad : 91 1f __ STA (ADDR + 0),y 
54af : 98 __ __ TYA
54b0 : 18 __ __ CLC
54b1 : 69 01 __ ADC #$01
54b3 : 85 43 __ STA T0 + 0 
54b5 : b0 e3 __ BCS $549a ; (ball_init.s8 + 0)
.s9:
54b7 : c9 e8 __ CMP #$e8
54b9 : d0 e1 __ BNE $549c ; (ball_init.l7 + 0)
.s6:
54bb : a5 44 __ LDA T0 + 1 
54bd : c9 c3 __ CMP #$c3
54bf : d0 db __ BNE $549c ; (ball_init.l7 + 0)
.s5:
54c1 : a9 00 __ LDA #$00
54c3 : 85 0e __ STA P1 
54c5 : 85 10 __ STA P3 
54c7 : 20 7b 79 JSR $797b ; (vic_setmode@proxy + 0)
54ca : a9 00 __ LDA #$00
54cc : 8d 21 d0 STA $d021 
54cf : 8d 20 d0 STA $d020 
.s3:
54d2 : 60 __ __ RTS
--------------------------------------------------------------------
draw_floor: ; draw_floor(u8)->void
; 137, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
54d3 : a9 00 __ LDA #$00
54d5 : 85 51 __ STA T3 + 0 
.l5:
54d7 : a5 18 __ LDA P11 ; (floor_rot + 0)
54d9 : 85 11 __ STA P4 
54db : a9 b0 __ LDA #$b0
54dd : 85 0d __ STA P0 
54df : a9 ff __ LDA #$ff
54e1 : 85 0e __ STA P1 
54e3 : a5 51 __ LDA T3 + 0 
54e5 : 0a __ __ ASL
54e6 : aa __ __ TAX
54e7 : a9 e8 __ LDA #$e8
54e9 : 85 12 __ STA P5 
54eb : a9 bf __ LDA #$bf
54ed : 85 13 __ STA P6 
54ef : a9 e6 __ LDA #$e6
54f1 : 85 14 __ STA P7 
54f3 : a9 bf __ LDA #$bf
54f5 : 85 15 __ STA P8 
54f7 : bd dd 7d LDA $7ddd,x ; (gz[0] + 0)
54fa : 85 0f __ STA P2 
54fc : bd de 7d LDA $7dde,x ; (gz[0] + 1)
54ff : 85 10 __ STA P3 
5501 : 20 cf 56 JSR $56cf ; (rotate_y.s4 + 0)
5504 : e6 0e __ INC P1 
5506 : a9 50 __ LDA #$50
5508 : 85 0d __ STA P0 
550a : a9 e4 __ LDA #$e4
550c : 85 12 __ STA P5 
550e : a9 bf __ LDA #$bf
5510 : 85 15 __ STA P8 
5512 : a9 bf __ LDA #$bf
5514 : 85 13 __ STA P6 
5516 : a9 e2 __ LDA #$e2
5518 : 85 14 __ STA P7 
551a : 20 cf 56 JSR $56cf ; (rotate_y.s4 + 0)
551d : ad e7 bf LDA $bfe7 ; (rz0 + 1)
5520 : 30 1a __ BMI $553c ; (draw_floor.s8 + 0)
.s21:
5522 : d0 07 __ BNE $552b ; (draw_floor.s6 + 0)
.s20:
5524 : ad e6 bf LDA $bfe6 ; (rz0 + 0)
5527 : c9 0f __ CMP #$0f
5529 : 90 11 __ BCC $553c ; (draw_floor.s8 + 0)
.s6:
552b : ad e3 bf LDA $bfe3 ; (rz1 + 1)
552e : 30 0c __ BMI $553c ; (draw_floor.s8 + 0)
.s19:
5530 : f0 03 __ BEQ $5535 ; (draw_floor.s18 + 0)
5532 : 4c 41 56 JMP $5641 ; (draw_floor.s7 + 0)
.s18:
5535 : ad e2 bf LDA $bfe2 ; (rz1 + 0)
5538 : c9 0f __ CMP #$0f
553a : b0 f6 __ BCS $5532 ; (draw_floor.s19 + 2)
.s8:
553c : e6 51 __ INC T3 + 0 
553e : a5 51 __ LDA T3 + 0 
5540 : c9 07 __ CMP #$07
5542 : d0 93 __ BNE $54d7 ; (draw_floor.l5 + 0)
.s9:
5544 : a9 00 __ LDA #$00
5546 : 85 51 __ STA T3 + 0 
.l10:
5548 : a5 18 __ LDA P11 ; (floor_rot + 0)
554a : 85 11 __ STA P4 
554c : a9 a0 __ LDA #$a0
554e : 85 0f __ STA P2 
5550 : a9 00 __ LDA #$00
5552 : 85 10 __ STA P3 
5554 : a5 51 __ LDA T3 + 0 
5556 : 0a __ __ ASL
5557 : aa __ __ TAX
5558 : a9 e0 __ LDA #$e0
555a : 85 12 __ STA P5 
555c : a9 bf __ LDA #$bf
555e : 85 13 __ STA P6 
5560 : a9 de __ LDA #$de
5562 : 85 14 __ STA P7 
5564 : a9 bf __ LDA #$bf
5566 : 85 15 __ STA P8 
5568 : bd eb 7d LDA $7deb,x ; (gx[0] + 0)
556b : 85 0d __ STA P0 
556d : bd ec 7d LDA $7dec,x ; (gx[0] + 1)
5570 : 85 0e __ STA P1 
5572 : 20 cf 56 JSR $56cf ; (rotate_y.s4 + 0)
5575 : e6 10 __ INC P3 
5577 : a9 40 __ LDA #$40
5579 : 85 0f __ STA P2 
557b : a9 dc __ LDA #$dc
557d : 85 12 __ STA P5 
557f : a9 bf __ LDA #$bf
5581 : 85 15 __ STA P8 
5583 : a9 bf __ LDA #$bf
5585 : 85 13 __ STA P6 
5587 : a9 da __ LDA #$da
5589 : 85 14 __ STA P7 
558b : 20 cf 56 JSR $56cf ; (rotate_y.s4 + 0)
558e : ad df bf LDA $bfdf ; (rz0 + 1)
5591 : 30 17 __ BMI $55aa ; (draw_floor.s13 + 0)
.s17:
5593 : d0 07 __ BNE $559c ; (draw_floor.s11 + 0)
.s16:
5595 : ad de bf LDA $bfde ; (rz0 + 0)
5598 : c9 0f __ CMP #$0f
559a : 90 0e __ BCC $55aa ; (draw_floor.s13 + 0)
.s11:
559c : ad db bf LDA $bfdb ; (rz1 + 1)
559f : 30 09 __ BMI $55aa ; (draw_floor.s13 + 0)
.s15:
55a1 : d0 10 __ BNE $55b3 ; (draw_floor.s12 + 0)
.s14:
55a3 : ad da bf LDA $bfda ; (rz1 + 0)
55a6 : c9 0f __ CMP #$0f
55a8 : b0 09 __ BCS $55b3 ; (draw_floor.s12 + 0)
.s13:
55aa : e6 51 __ INC T3 + 0 
55ac : a5 51 __ LDA T3 + 0 
55ae : c9 07 __ CMP #$07
55b0 : d0 96 __ BNE $5548 ; (draw_floor.l10 + 0)
.s3:
55b2 : 60 __ __ RTS
.s12:
55b3 : ad e0 bf LDA $bfe0 ; (rx0 + 0)
55b6 : 85 1b __ STA ACCU + 0 
55b8 : ad e1 bf LDA $bfe1 ; (rx0 + 1)
55bb : 85 1c __ STA ACCU + 1 
55bd : a9 b4 __ LDA #$b4
55bf : 20 7e 74 JSR $747e ; (mul16by8 + 0)
55c2 : ad de bf LDA $bfde ; (rz0 + 0)
55c5 : 85 03 __ STA WORK + 0 
55c7 : ad df bf LDA $bfdf ; (rz0 + 1)
55ca : 85 04 __ STA WORK + 1 
55cc : 20 32 75 JSR $7532 ; (divs16 + 0)
55cf : 18 __ __ CLC
55d0 : a5 1b __ LDA ACCU + 0 
55d2 : 69 50 __ ADC #$50
55d4 : 85 12 __ STA P5 
55d6 : a5 1c __ LDA ACCU + 1 
55d8 : 69 00 __ ADC #$00
55da : 85 13 __ STA P6 
55dc : ad de bf LDA $bfde ; (rz0 + 0)
55df : 85 03 __ STA WORK + 0 
55e1 : ad df bf LDA $bfdf ; (rz0 + 1)
55e4 : 85 04 __ STA WORK + 1 
55e6 : 20 65 79 JSR $7965 ; (divmod@proxy + 0)
55e9 : 18 __ __ CLC
55ea : a5 1b __ LDA ACCU + 0 
55ec : 69 48 __ ADC #$48
55ee : 85 14 __ STA P7 
55f0 : a5 1c __ LDA ACCU + 1 
55f2 : 69 00 __ ADC #$00
55f4 : 85 15 __ STA P8 
55f6 : ad dc bf LDA $bfdc ; (rx1 + 0)
55f9 : 85 1b __ STA ACCU + 0 
55fb : ad dd bf LDA $bfdd ; (rx1 + 1)
55fe : 85 1c __ STA ACCU + 1 
5600 : a9 b4 __ LDA #$b4
5602 : 20 7e 74 JSR $747e ; (mul16by8 + 0)
5605 : ad da bf LDA $bfda ; (rz1 + 0)
5608 : 85 03 __ STA WORK + 0 
560a : ad db bf LDA $bfdb ; (rz1 + 1)
560d : 85 04 __ STA WORK + 1 
560f : 20 32 75 JSR $7532 ; (divs16 + 0)
5612 : 18 __ __ CLC
5613 : a5 1b __ LDA ACCU + 0 
5615 : 69 50 __ ADC #$50
5617 : 85 16 __ STA P9 
5619 : a5 1c __ LDA ACCU + 1 
561b : 69 00 __ ADC #$00
561d : 85 17 __ STA P10 
561f : ad da bf LDA $bfda ; (rz1 + 0)
5622 : 85 03 __ STA WORK + 0 
5624 : ad db bf LDA $bfdb ; (rz1 + 1)
5627 : 85 04 __ STA WORK + 1 
5629 : 20 65 79 JSR $7965 ; (divmod@proxy + 0)
562c : 18 __ __ CLC
562d : a5 1b __ LDA ACCU + 0 
562f : 69 48 __ ADC #$48
5631 : 8d ea bf STA $bfea ; (sstack + 0)
5634 : a5 1c __ LDA ACCU + 1 
5636 : 69 00 __ ADC #$00
5638 : 8d eb bf STA $bfeb ; (sstack + 1)
563b : 20 94 57 JSR $5794 ; (mc_line.s4 + 0)
563e : 4c aa 55 JMP $55aa ; (draw_floor.s13 + 0)
.s7:
5641 : ad e8 bf LDA $bfe8 ; (rx0 + 0)
5644 : 85 1b __ STA ACCU + 0 
5646 : ad e9 bf LDA $bfe9 ; (rx0 + 1)
5649 : 85 1c __ STA ACCU + 1 
564b : a9 b4 __ LDA #$b4
564d : 20 7e 74 JSR $747e ; (mul16by8 + 0)
5650 : ad e6 bf LDA $bfe6 ; (rz0 + 0)
5653 : 85 03 __ STA WORK + 0 
5655 : ad e7 bf LDA $bfe7 ; (rz0 + 1)
5658 : 85 04 __ STA WORK + 1 
565a : 20 32 75 JSR $7532 ; (divs16 + 0)
565d : 18 __ __ CLC
565e : a5 1b __ LDA ACCU + 0 
5660 : 69 50 __ ADC #$50
5662 : 85 12 __ STA P5 
5664 : a5 1c __ LDA ACCU + 1 
5666 : 69 00 __ ADC #$00
5668 : 85 13 __ STA P6 
566a : ad e6 bf LDA $bfe6 ; (rz0 + 0)
566d : 85 03 __ STA WORK + 0 
566f : ad e7 bf LDA $bfe7 ; (rz0 + 1)
5672 : 85 04 __ STA WORK + 1 
5674 : 20 65 79 JSR $7965 ; (divmod@proxy + 0)
5677 : 18 __ __ CLC
5678 : a5 1b __ LDA ACCU + 0 
567a : 69 48 __ ADC #$48
567c : 85 14 __ STA P7 
567e : a5 1c __ LDA ACCU + 1 
5680 : 69 00 __ ADC #$00
5682 : 85 15 __ STA P8 
5684 : ad e4 bf LDA $bfe4 ; (rx1 + 0)
5687 : 85 1b __ STA ACCU + 0 
5689 : ad e5 bf LDA $bfe5 ; (rx1 + 1)
568c : 85 1c __ STA ACCU + 1 
568e : a9 b4 __ LDA #$b4
5690 : 20 7e 74 JSR $747e ; (mul16by8 + 0)
5693 : ad e2 bf LDA $bfe2 ; (rz1 + 0)
5696 : 85 03 __ STA WORK + 0 
5698 : ad e3 bf LDA $bfe3 ; (rz1 + 1)
569b : 85 04 __ STA WORK + 1 
569d : 20 32 75 JSR $7532 ; (divs16 + 0)
56a0 : 18 __ __ CLC
56a1 : a5 1b __ LDA ACCU + 0 
56a3 : 69 50 __ ADC #$50
56a5 : 85 16 __ STA P9 
56a7 : a5 1c __ LDA ACCU + 1 
56a9 : 69 00 __ ADC #$00
56ab : 85 17 __ STA P10 
56ad : ad e2 bf LDA $bfe2 ; (rz1 + 0)
56b0 : 85 03 __ STA WORK + 0 
56b2 : ad e3 bf LDA $bfe3 ; (rz1 + 1)
56b5 : 85 04 __ STA WORK + 1 
56b7 : 20 65 79 JSR $7965 ; (divmod@proxy + 0)
56ba : 18 __ __ CLC
56bb : a5 1b __ LDA ACCU + 0 
56bd : 69 48 __ ADC #$48
56bf : 8d ea bf STA $bfea ; (sstack + 0)
56c2 : a5 1c __ LDA ACCU + 1 
56c4 : 69 00 __ ADC #$00
56c6 : 8d eb bf STA $bfeb ; (sstack + 1)
56c9 : 20 94 57 JSR $5794 ; (mc_line.s4 + 0)
56cc : 4c 3c 55 JMP $553c ; (draw_floor.s8 + 0)
--------------------------------------------------------------------
rotate_y: ; rotate_y(i16,i16,u8,i16*,i16*)->void
; 128, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
56cf : a5 11 __ LDA P4 ; (angle + 0)
56d1 : 29 3f __ AND #$3f
56d3 : aa __ __ TAX
56d4 : bd 0f 7d LDA $7d0f,x ; (sin64[0] + 0)
56d7 : 85 45 __ STA T1 + 0 
56d9 : 85 03 __ STA WORK + 0 
56db : 29 80 __ AND #$80
56dd : 10 02 __ BPL $56e1 ; (rotate_y.s4 + 18)
56df : a9 ff __ LDA #$ff
56e1 : 85 46 __ STA T1 + 1 
56e3 : 85 04 __ STA WORK + 1 
56e5 : a5 0f __ LDA P2 ; (z + 0)
56e7 : 38 __ __ SEC
56e8 : e9 f0 __ SBC #$f0
56ea : 85 47 __ STA T2 + 0 
56ec : 85 1b __ STA ACCU + 0 
56ee : a5 10 __ LDA P3 ; (z + 1)
56f0 : e9 00 __ SBC #$00
56f2 : 85 48 __ STA T2 + 1 
56f4 : 85 1c __ STA ACCU + 1 
56f6 : 20 ec 74 JSR $74ec ; (mul16 + 0)
56f9 : a5 05 __ LDA WORK + 2 
56fb : 85 49 __ STA T3 + 0 
56fd : a5 06 __ LDA WORK + 3 
56ff : 85 4a __ STA T3 + 1 
5701 : 18 __ __ CLC
5702 : a5 11 __ LDA P4 ; (angle + 0)
5704 : 69 10 __ ADC #$10
5706 : 29 3f __ AND #$3f
5708 : aa __ __ TAX
5709 : bd 0f 7d LDA $7d0f,x ; (sin64[0] + 0)
570c : 85 43 __ STA T0 + 0 
570e : 85 03 __ STA WORK + 0 
5710 : 29 80 __ AND #$80
5712 : 10 02 __ BPL $5716 ; (rotate_y.s4 + 71)
5714 : a9 ff __ LDA #$ff
5716 : 85 44 __ STA T0 + 1 
5718 : 85 04 __ STA WORK + 1 
571a : a5 0d __ LDA P0 ; (x + 0)
571c : 85 1b __ STA ACCU + 0 
571e : a5 0e __ LDA P1 ; (x + 1)
5720 : 85 1c __ STA ACCU + 1 
5722 : 20 ec 74 JSR $74ec ; (mul16 + 0)
5725 : 18 __ __ CLC
5726 : a5 05 __ LDA WORK + 2 
5728 : 65 49 __ ADC T3 + 0 
572a : 85 1b __ STA ACCU + 0 
572c : a5 06 __ LDA WORK + 3 
572e : 65 4a __ ADC T3 + 1 
5730 : 85 1c __ STA ACCU + 1 
5732 : 20 5a 79 JSR $795a ; (divs16@proxy + 0)
5735 : a5 1b __ LDA ACCU + 0 
5737 : a0 00 __ LDY #$00
5739 : 91 12 __ STA (P5),y ; (rx + 0)
573b : a5 1c __ LDA ACCU + 1 
573d : c8 __ __ INY
573e : 91 12 __ STA (P5),y ; (rx + 0)
5740 : 38 __ __ SEC
5741 : a9 00 __ LDA #$00
5743 : e5 0d __ SBC P0 ; (x + 0)
5745 : 85 1b __ STA ACCU + 0 
5747 : a9 00 __ LDA #$00
5749 : e5 0e __ SBC P1 ; (x + 1)
574b : 85 1c __ STA ACCU + 1 
574d : a5 45 __ LDA T1 + 0 
574f : 85 03 __ STA WORK + 0 
5751 : a5 46 __ LDA T1 + 1 
5753 : 85 04 __ STA WORK + 1 
5755 : 20 ec 74 JSR $74ec ; (mul16 + 0)
5758 : a5 05 __ LDA WORK + 2 
575a : 85 45 __ STA T1 + 0 
575c : a5 06 __ LDA WORK + 3 
575e : 85 46 __ STA T1 + 1 
5760 : a5 47 __ LDA T2 + 0 
5762 : 85 1b __ STA ACCU + 0 
5764 : a5 48 __ LDA T2 + 1 
5766 : 85 1c __ STA ACCU + 1 
5768 : a5 43 __ LDA T0 + 0 
576a : 85 03 __ STA WORK + 0 
576c : a5 44 __ LDA T0 + 1 
576e : 85 04 __ STA WORK + 1 
5770 : 20 ec 74 JSR $74ec ; (mul16 + 0)
5773 : 18 __ __ CLC
5774 : a5 05 __ LDA WORK + 2 
5776 : 65 45 __ ADC T1 + 0 
5778 : 85 1b __ STA ACCU + 0 
577a : a5 06 __ LDA WORK + 3 
577c : 65 46 __ ADC T1 + 1 
577e : 85 1c __ STA ACCU + 1 
5780 : 20 5a 79 JSR $795a ; (divs16@proxy + 0)
5783 : 18 __ __ CLC
5784 : a5 1b __ LDA ACCU + 0 
5786 : 69 f0 __ ADC #$f0
5788 : a0 00 __ LDY #$00
578a : 91 14 __ STA (P7),y ; (rz + 0)
578c : a5 1c __ LDA ACCU + 1 
578e : 69 00 __ ADC #$00
5790 : c8 __ __ INY
5791 : 91 14 __ STA (P7),y ; (rz + 0)
.s3:
5793 : 60 __ __ RTS
--------------------------------------------------------------------
mc_line: ; mc_line(i16,i16,i16,i16,u8)->void
;  89, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5794 : 38 __ __ SEC
5795 : a5 16 __ LDA P9 ; (x1 + 0)
5797 : e5 12 __ SBC P5 ; (x0 + 0)
5799 : 85 43 __ STA T3 + 0 
579b : a5 17 __ LDA P10 ; (x1 + 1)
579d : e5 13 __ SBC P6 ; (x0 + 1)
579f : 85 44 __ STA T3 + 1 
57a1 : 10 0d __ BPL $57b0 ; (mc_line.s5 + 0)
.s37:
57a3 : 38 __ __ SEC
57a4 : a9 00 __ LDA #$00
57a6 : e5 43 __ SBC T3 + 0 
57a8 : 85 43 __ STA T3 + 0 
57aa : a9 00 __ LDA #$00
57ac : e5 44 __ SBC T3 + 1 
57ae : 85 44 __ STA T3 + 1 
.s5:
57b0 : ad ea bf LDA $bfea ; (sstack + 0)
57b3 : 85 45 __ STA T4 + 0 
57b5 : 38 __ __ SEC
57b6 : e5 14 __ SBC P7 ; (y0 + 0)
57b8 : 85 47 __ STA T5 + 0 
57ba : ad eb bf LDA $bfeb ; (sstack + 1)
57bd : 85 46 __ STA T4 + 1 
57bf : e5 15 __ SBC P8 ; (y0 + 1)
57c1 : 85 48 __ STA T5 + 1 
57c3 : 10 0d __ BPL $57d2 ; (mc_line.s6 + 0)
.s36:
57c5 : 38 __ __ SEC
57c6 : a9 00 __ LDA #$00
57c8 : e5 47 __ SBC T5 + 0 
57ca : 85 47 __ STA T5 + 0 
57cc : a9 00 __ LDA #$00
57ce : e5 48 __ SBC T5 + 1 
57d0 : 85 48 __ STA T5 + 1 
.s6:
57d2 : a5 13 __ LDA P6 ; (x0 + 1)
57d4 : c5 17 __ CMP P10 ; (x1 + 1)
57d6 : d0 08 __ BNE $57e0 ; (mc_line.s35 + 0)
.s32:
57d8 : a5 12 __ LDA P5 ; (x0 + 0)
57da : c5 16 __ CMP P9 ; (x1 + 0)
.s33:
57dc : 90 08 __ BCC $57e6 ; (mc_line.s31 + 0)
57de : b0 0e __ BCS $57ee ; (mc_line.s7 + 0)
.s35:
57e0 : 45 17 __ EOR P10 ; (x1 + 1)
57e2 : 10 f8 __ BPL $57dc ; (mc_line.s33 + 0)
.s34:
57e4 : 90 08 __ BCC $57ee ; (mc_line.s7 + 0)
.s31:
57e6 : a9 01 __ LDA #$01
57e8 : 85 49 __ STA T6 + 0 
57ea : a9 00 __ LDA #$00
57ec : f0 04 __ BEQ $57f2 ; (mc_line.s8 + 0)
.s7:
57ee : a9 ff __ LDA #$ff
57f0 : 85 49 __ STA T6 + 0 
.s8:
57f2 : 85 4a __ STA T6 + 1 
57f4 : a5 15 __ LDA P8 ; (y0 + 1)
57f6 : c5 46 __ CMP T4 + 1 
57f8 : d0 08 __ BNE $5802 ; (mc_line.s30 + 0)
.s27:
57fa : a5 14 __ LDA P7 ; (y0 + 0)
57fc : c5 45 __ CMP T4 + 0 
.s28:
57fe : 90 08 __ BCC $5808 ; (mc_line.s26 + 0)
5800 : b0 0e __ BCS $5810 ; (mc_line.s9 + 0)
.s30:
5802 : 45 46 __ EOR T4 + 1 
5804 : 10 f8 __ BPL $57fe ; (mc_line.s28 + 0)
.s29:
5806 : 90 08 __ BCC $5810 ; (mc_line.s9 + 0)
.s26:
5808 : a9 01 __ LDA #$01
580a : 85 4b __ STA T7 + 0 
580c : a9 00 __ LDA #$00
580e : f0 04 __ BEQ $5814 ; (mc_line.s10 + 0)
.s9:
5810 : a9 ff __ LDA #$ff
5812 : 85 4b __ STA T7 + 0 
.s10:
5814 : 85 4c __ STA T7 + 1 
5816 : 38 __ __ SEC
5817 : a5 43 __ LDA T3 + 0 
5819 : e5 47 __ SBC T5 + 0 
581b : 85 4d __ STA T8 + 0 
581d : a5 44 __ LDA T3 + 1 
581f : e5 48 __ SBC T5 + 1 
5821 : 85 4e __ STA T8 + 1 
5823 : 38 __ __ SEC
5824 : a9 00 __ LDA #$00
5826 : e5 47 __ SBC T5 + 0 
5828 : 85 4f __ STA T9 + 0 
582a : a9 00 __ LDA #$00
582c : e5 48 __ SBC T5 + 1 
582e : 85 50 __ STA T9 + 1 
.l11:
5830 : a5 12 __ LDA P5 ; (x0 + 0)
5832 : 85 0d __ STA P0 
5834 : a9 01 __ LDA #$01
5836 : 85 11 __ STA P4 
5838 : a5 13 __ LDA P6 ; (x0 + 1)
583a : 85 0e __ STA P1 
583c : a5 14 __ LDA P7 ; (y0 + 0)
583e : 85 0f __ STA P2 
5840 : a5 15 __ LDA P8 ; (y0 + 1)
5842 : 85 10 __ STA P3 
5844 : 20 cf 58 JSR $58cf ; (mc_setpix.s4 + 0)
5847 : a5 13 __ LDA P6 ; (x0 + 1)
5849 : c5 17 __ CMP P10 ; (x1 + 1)
584b : d0 12 __ BNE $585f ; (mc_line.s12 + 0)
.s25:
584d : a5 12 __ LDA P5 ; (x0 + 0)
584f : c5 16 __ CMP P9 ; (x1 + 0)
5851 : d0 0c __ BNE $585f ; (mc_line.s12 + 0)
.s23:
5853 : a5 15 __ LDA P8 ; (y0 + 1)
5855 : c5 46 __ CMP T4 + 1 
5857 : d0 06 __ BNE $585f ; (mc_line.s12 + 0)
.s24:
5859 : a5 14 __ LDA P7 ; (y0 + 0)
585b : c5 45 __ CMP T4 + 0 
585d : f0 63 __ BEQ $58c2 ; (mc_line.s3 + 0)
.s12:
585f : a5 4d __ LDA T8 + 0 
5861 : 0a __ __ ASL
5862 : 85 1b __ STA ACCU + 0 
5864 : a5 4e __ LDA T8 + 1 
5866 : 2a __ __ ROL
5867 : 85 1c __ STA ACCU + 1 
5869 : a5 50 __ LDA T9 + 1 
586b : c5 1c __ CMP ACCU + 1 
586d : d0 08 __ BNE $5877 ; (mc_line.s22 + 0)
.s19:
586f : a5 4f __ LDA T9 + 0 
5871 : c5 1b __ CMP ACCU + 0 
.s20:
5873 : 90 08 __ BCC $587d ; (mc_line.s18 + 0)
5875 : b0 20 __ BCS $5897 ; (mc_line.s13 + 0)
.s22:
5877 : 45 1c __ EOR ACCU + 1 
5879 : 10 f8 __ BPL $5873 ; (mc_line.s20 + 0)
.s21:
587b : 90 1a __ BCC $5897 ; (mc_line.s13 + 0)
.s18:
587d : 18 __ __ CLC
587e : a5 12 __ LDA P5 ; (x0 + 0)
5880 : 65 49 __ ADC T6 + 0 
5882 : 85 12 __ STA P5 ; (x0 + 0)
5884 : a5 13 __ LDA P6 ; (x0 + 1)
5886 : 65 4a __ ADC T6 + 1 
5888 : 85 13 __ STA P6 ; (x0 + 1)
588a : 38 __ __ SEC
588b : a5 4d __ LDA T8 + 0 
588d : e5 47 __ SBC T5 + 0 
588f : 85 4d __ STA T8 + 0 
5891 : a5 4e __ LDA T8 + 1 
5893 : e5 48 __ SBC T5 + 1 
5895 : 85 4e __ STA T8 + 1 
.s13:
5897 : a5 1c __ LDA ACCU + 1 
5899 : 30 0a __ BMI $58a5 ; (mc_line.s14 + 0)
.s17:
589b : c5 44 __ CMP T3 + 1 
589d : d0 04 __ BNE $58a3 ; (mc_line.s16 + 0)
.s15:
589f : a5 1b __ LDA ACCU + 0 
58a1 : c5 43 __ CMP T3 + 0 
.s16:
58a3 : b0 8b __ BCS $5830 ; (mc_line.l11 + 0)
.s14:
58a5 : 18 __ __ CLC
58a6 : a5 14 __ LDA P7 ; (y0 + 0)
58a8 : 65 4b __ ADC T7 + 0 
58aa : 85 14 __ STA P7 ; (y0 + 0)
58ac : a5 15 __ LDA P8 ; (y0 + 1)
58ae : 65 4c __ ADC T7 + 1 
58b0 : 85 15 __ STA P8 ; (y0 + 1)
58b2 : 18 __ __ CLC
58b3 : a5 4d __ LDA T8 + 0 
58b5 : 65 43 __ ADC T3 + 0 
58b7 : 85 4d __ STA T8 + 0 
58b9 : a5 4e __ LDA T8 + 1 
58bb : 65 44 __ ADC T3 + 1 
58bd : 85 4e __ STA T8 + 1 
58bf : 4c 30 58 JMP $5830 ; (mc_line.l11 + 0)
.s3:
58c2 : 60 __ __ RTS
--------------------------------------------------------------------
mc_setpix@proxy: ; mc_setpix@proxy
58c3 : a5 46 __ LDA $46 
58c5 : 85 0d __ STA P0 
58c7 : a5 47 __ LDA $47 
58c9 : 85 0e __ STA P1 
58cb : a5 18 __ LDA P11 
58cd : 85 11 __ STA P4 
--------------------------------------------------------------------
mc_setpix: ; mc_setpix(i16,i16,u8)->void
;  54, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
58cf : a5 0e __ LDA P1 ; (mx + 1)
58d1 : d0 5e __ BNE $5931 ; (mc_setpix.s3 + 0)
.s9:
58d3 : a5 0d __ LDA P0 ; (mx + 0)
58d5 : c9 a0 __ CMP #$a0
58d7 : b0 58 __ BCS $5931 ; (mc_setpix.s3 + 0)
.s5:
58d9 : a5 10 __ LDA P3 ; (my + 1)
58db : d0 54 __ BNE $5931 ; (mc_setpix.s3 + 0)
.s8:
58dd : a5 0f __ LDA P2 ; (my + 0)
58df : c9 c8 __ CMP #$c8
58e1 : b0 4e __ BCS $5931 ; (mc_setpix.s3 + 0)
.s6:
58e3 : a5 0d __ LDA P0 ; (mx + 0)
58e5 : 29 03 __ AND #$03
58e7 : 49 03 __ EOR #$03
58e9 : 0a __ __ ASL
58ea : 85 1b __ STA ACCU + 0 
58ec : a5 11 __ LDA P4 ; (col + 0)
58ee : a6 1b __ LDX ACCU + 0 
58f0 : f0 08 __ BEQ $58fa ; (mc_setpix.s7 + 0)
.l10:
58f2 : 0a __ __ ASL
58f3 : ca __ __ DEX
58f4 : d0 fc __ BNE $58f2 ; (mc_setpix.l10 + 0)
.s11:
58f6 : 85 11 __ STA P4 ; (col + 0)
58f8 : a6 1b __ LDX ACCU + 0 
.s7:
58fa : a5 0f __ LDA P2 ; (my + 0)
58fc : 29 07 __ AND #$07
58fe : 85 1c __ STA ACCU + 1 
5900 : a5 0f __ LDA P2 ; (my + 0)
5902 : 4a __ __ LSR
5903 : 4a __ __ LSR
5904 : 4a __ __ LSR
5905 : 85 1b __ STA ACCU + 0 
5907 : 0a __ __ ASL
5908 : 0a __ __ ASL
5909 : 65 1b __ ADC ACCU + 0 
590b : 4a __ __ LSR
590c : 6a __ __ ROR
590d : a8 __ __ TAY
590e : 29 80 __ AND #$80
5910 : 6a __ __ ROR
5911 : 05 1c __ ORA ACCU + 1 
5913 : 85 1b __ STA ACCU + 0 
5915 : 98 __ __ TYA
5916 : 29 3f __ AND #$3f
5918 : 85 1c __ STA ACCU + 1 
591a : a5 0d __ LDA P0 ; (mx + 0)
591c : 29 fc __ AND #$fc
591e : 0a __ __ ASL
591f : a8 __ __ TAY
5920 : a5 1c __ LDA ACCU + 1 
5922 : 69 e0 __ ADC #$e0
5924 : 85 1c __ STA ACCU + 1 
5926 : bd c4 78 LDA $78c4,x ; (__shltab3L + 0)
5929 : 49 ff __ EOR #$ff
592b : 31 1b __ AND (ACCU + 0),y 
592d : 05 11 __ ORA P4 ; (col + 0)
592f : 91 1b __ STA (ACCU + 0),y 
.s3:
5931 : 60 __ __ RTS
--------------------------------------------------------------------
draw_shadow: ; draw_shadow(i16,i16,i16,i16)->void
; 174, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5932 : a5 17 __ LDA P10 ; (rx + 1)
5934 : 30 06 __ BMI $593c ; (draw_shadow.s29 + 0)
.s31:
5936 : d0 0c __ BNE $5944 ; (draw_shadow.s5 + 0)
.s30:
5938 : a5 16 __ LDA P9 ; (rx + 0)
593a : d0 08 __ BNE $5944 ; (draw_shadow.s5 + 0)
.s29:
593c : a9 01 __ LDA #$01
593e : 85 16 __ STA P9 ; (rx + 0)
5940 : a9 00 __ LDA #$00
5942 : 85 17 __ STA P10 ; (rx + 1)
.s5:
5944 : ad eb bf LDA $bfeb ; (sstack + 1)
5947 : 30 07 __ BMI $5950 ; (draw_shadow.s26 + 0)
.s28:
5949 : d0 0f __ BNE $595a ; (draw_shadow.s6 + 0)
.s27:
594b : ad ea bf LDA $bfea ; (sstack + 0)
594e : d0 0a __ BNE $595a ; (draw_shadow.s6 + 0)
.s26:
5950 : a9 01 __ LDA #$01
5952 : 8d ea bf STA $bfea ; (sstack + 0)
5955 : a9 00 __ LDA #$00
5957 : 8d eb bf STA $bfeb ; (sstack + 1)
.s6:
595a : ad ea bf LDA $bfea ; (sstack + 0)
595d : 85 48 __ STA T2 + 0 
595f : 49 ff __ EOR #$ff
5961 : 38 __ __ SEC
5962 : 69 00 __ ADC #$00
5964 : 85 4a __ STA T3 + 0 
5966 : a9 00 __ LDA #$00
5968 : ed eb bf SBC $bfeb ; (sstack + 1)
596b : 85 4b __ STA T3 + 1 
596d : ad eb bf LDA $bfeb ; (sstack + 1)
5970 : 85 49 __ STA T2 + 1 
5972 : c5 4b __ CMP T3 + 1 
5974 : d0 07 __ BNE $597d ; (draw_shadow.s25 + 0)
.s22:
5976 : a5 48 __ LDA T2 + 0 
5978 : c5 4a __ CMP T3 + 0 
.s23:
597a : b0 08 __ BCS $5984 ; (draw_shadow.s7 + 0)
597c : 60 __ __ RTS
.s25:
597d : 45 4b __ EOR T3 + 1 
597f : 10 f9 __ BPL $597a ; (draw_shadow.s23 + 0)
.s24:
5981 : 90 01 __ BCC $5984 ; (draw_shadow.s7 + 0)
5983 : 60 __ __ RTS
.s7:
5984 : 18 __ __ CLC
5985 : a5 14 __ LDA P7 ; (sy + 0)
5987 : 65 4a __ ADC T3 + 0 
5989 : 85 4c __ STA T4 + 0 
598b : a5 15 __ LDA P8 ; (sy + 1)
598d : 65 4b __ ADC T3 + 1 
598f : 85 4d __ STA T4 + 1 
5991 : a5 48 __ LDA T2 + 0 
5993 : 85 03 __ STA WORK + 0 
5995 : 85 1b __ STA ACCU + 0 
5997 : a5 49 __ LDA T2 + 1 
5999 : 85 04 __ STA WORK + 1 
599b : 85 1c __ STA ACCU + 1 
599d : 20 ec 74 JSR $74ec ; (mul16 + 0)
59a0 : a5 05 __ LDA WORK + 2 
59a2 : 85 4e __ STA T5 + 0 
59a4 : a5 06 __ LDA WORK + 3 
59a6 : 85 4f __ STA T5 + 1 
59a8 : a5 4d __ LDA T4 + 1 
59aa : f0 03 __ BEQ $59af ; (draw_shadow.l21 + 0)
59ac : 4c 4a 5a JMP $5a4a ; (draw_shadow.l11 + 0)
.l21:
59af : a5 4c __ LDA T4 + 0 
59b1 : c9 c8 __ CMP #$c8
59b3 : b0 f7 __ BCS $59ac ; (draw_shadow.s7 + 40)
.s9:
59b5 : a5 4a __ LDA T3 + 0 
59b7 : 85 03 __ STA WORK + 0 
59b9 : 85 1b __ STA ACCU + 0 
59bb : a5 4b __ LDA T3 + 1 
59bd : 85 04 __ STA WORK + 1 
59bf : 85 1c __ STA ACCU + 1 
59c1 : 20 ec 74 JSR $74ec ; (mul16 + 0)
59c4 : 38 __ __ SEC
59c5 : a5 4e __ LDA T5 + 0 
59c7 : e5 05 __ SBC WORK + 2 
59c9 : 85 0d __ STA P0 
59cb : a5 4f __ LDA T5 + 1 
59cd : e5 06 __ SBC WORK + 3 
59cf : 30 79 __ BMI $5a4a ; (draw_shadow.l11 + 0)
.s10:
59d1 : 85 0e __ STA P1 
59d3 : 20 71 5a JSR $5a71 ; (mc_isqrt.s4 + 0)
59d6 : a5 1b __ LDA ACCU + 0 
59d8 : 85 03 __ STA WORK + 0 
59da : a5 1c __ LDA ACCU + 1 
59dc : 85 04 __ STA WORK + 1 
59de : a5 16 __ LDA P9 ; (rx + 0)
59e0 : 85 1b __ STA ACCU + 0 
59e2 : a5 17 __ LDA P10 ; (rx + 1)
59e4 : 85 1c __ STA ACCU + 1 
59e6 : 20 ec 74 JSR $74ec ; (mul16 + 0)
59e9 : a5 05 __ LDA WORK + 2 
59eb : 85 1b __ STA ACCU + 0 
59ed : a5 06 __ LDA WORK + 3 
59ef : 85 1c __ STA ACCU + 1 
59f1 : a5 48 __ LDA T2 + 0 
59f3 : 85 03 __ STA WORK + 0 
59f5 : a5 49 __ LDA T2 + 1 
59f7 : 85 04 __ STA WORK + 1 
59f9 : 20 32 75 JSR $7532 ; (divs16 + 0)
59fc : 18 __ __ CLC
59fd : a5 12 __ LDA P5 ; (sx + 0)
59ff : 65 1b __ ADC ACCU + 0 
5a01 : 85 50 __ STA T6 + 0 
5a03 : a5 13 __ LDA P6 ; (sx + 1)
5a05 : 65 1c __ ADC ACCU + 1 
5a07 : 85 51 __ STA T6 + 1 
5a09 : 38 __ __ SEC
5a0a : a5 12 __ LDA P5 ; (sx + 0)
5a0c : e5 1b __ SBC ACCU + 0 
5a0e : 85 47 __ STA T0 + 0 
5a10 : a5 13 __ LDA P6 ; (sx + 1)
5a12 : e5 1c __ SBC ACCU + 1 
5a14 : 85 0e __ STA P1 
5a16 : a9 00 __ LDA #$00
5a18 : 85 10 __ STA P3 
.l36:
5a1a : a5 51 __ LDA T6 + 1 
5a1c : c5 0e __ CMP P1 
5a1e : d0 08 __ BNE $5a28 ; (draw_shadow.s20 + 0)
.s17:
5a20 : a5 50 __ LDA T6 + 0 
5a22 : c5 47 __ CMP T0 + 0 
.s18:
5a24 : b0 08 __ BCS $5a2e ; (draw_shadow.s16 + 0)
5a26 : 90 22 __ BCC $5a4a ; (draw_shadow.l11 + 0)
.s20:
5a28 : 45 0e __ EOR P1 
5a2a : 10 f8 __ BPL $5a24 ; (draw_shadow.s18 + 0)
.s19:
5a2c : b0 1c __ BCS $5a4a ; (draw_shadow.l11 + 0)
.s16:
5a2e : a5 47 __ LDA T0 + 0 
5a30 : 85 0d __ STA P0 
5a32 : a5 4c __ LDA T4 + 0 
5a34 : 85 0f __ STA P2 
5a36 : a9 03 __ LDA #$03
5a38 : 85 11 __ STA P4 
5a3a : 20 cf 58 JSR $58cf ; (mc_setpix.s4 + 0)
5a3d : 18 __ __ CLC
5a3e : a5 0d __ LDA P0 
5a40 : 69 02 __ ADC #$02
5a42 : 85 47 __ STA T0 + 0 
5a44 : 90 d4 __ BCC $5a1a ; (draw_shadow.l36 + 0)
.s37:
5a46 : e6 0e __ INC P1 
5a48 : b0 d0 __ BCS $5a1a ; (draw_shadow.l36 + 0)
.l11:
5a4a : e6 4c __ INC T4 + 0 
5a4c : d0 02 __ BNE $5a50 ; (draw_shadow.s33 + 0)
.s32:
5a4e : e6 4d __ INC T4 + 1 
.s33:
5a50 : e6 4a __ INC T3 + 0 
5a52 : d0 02 __ BNE $5a56 ; (draw_shadow.s35 + 0)
.s34:
5a54 : e6 4b __ INC T3 + 1 
.s35:
5a56 : a5 49 __ LDA T2 + 1 
5a58 : c5 4b __ CMP T3 + 1 
5a5a : d0 07 __ BNE $5a63 ; (draw_shadow.s15 + 0)
.s12:
5a5c : a5 48 __ LDA T2 + 0 
5a5e : c5 4a __ CMP T3 + 0 
.s13:
5a60 : b0 07 __ BCS $5a69 ; (draw_shadow.s8 + 0)
5a62 : 60 __ __ RTS
.s15:
5a63 : 45 4b __ EOR T3 + 1 
5a65 : 10 f9 __ BPL $5a60 ; (draw_shadow.s13 + 0)
.s14:
5a67 : b0 07 __ BCS $5a70 ; (draw_shadow.s3 + 0)
.s8:
5a69 : a5 4d __ LDA T4 + 1 
5a6b : d0 dd __ BNE $5a4a ; (draw_shadow.l11 + 0)
5a6d : 4c af 59 JMP $59af ; (draw_shadow.l21 + 0)
.s3:
5a70 : 60 __ __ RTS
--------------------------------------------------------------------
mc_isqrt: ; mc_isqrt(u16)->i16
;  39, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5a71 : a5 0e __ LDA P1 ; (n + 1)
5a73 : 05 0d __ ORA P0 ; (n + 0)
5a75 : d0 05 __ BNE $5a7c ; (mc_isqrt.s5 + 0)
.s10:
5a77 : 85 1b __ STA ACCU + 0 
.s3:
5a79 : 85 1c __ STA ACCU + 1 
5a7b : 60 __ __ RTS
.s5:
5a7c : a5 0e __ LDA P1 ; (n + 1)
5a7e : 4a __ __ LSR
5a7f : 85 44 __ STA T1 + 1 
5a81 : a5 0d __ LDA P0 ; (n + 0)
5a83 : 6a __ __ ROR
5a84 : 85 43 __ STA T1 + 0 
5a86 : 05 44 __ ORA T1 + 1 
5a88 : d0 06 __ BNE $5a90 ; (mc_isqrt.l6 + 0)
.s9:
5a8a : a2 01 __ LDX #$01
5a8c : 86 1b __ STX ACCU + 0 
5a8e : d0 e9 __ BNE $5a79 ; (mc_isqrt.s3 + 0)
.l6:
5a90 : a5 43 __ LDA T1 + 0 
5a92 : 85 03 __ STA WORK + 0 
5a94 : 85 45 __ STA T2 + 0 
5a96 : a5 44 __ LDA T1 + 1 
5a98 : 85 04 __ STA WORK + 1 
5a9a : 85 46 __ STA T2 + 1 
5a9c : a5 0d __ LDA P0 ; (n + 0)
5a9e : 85 1b __ STA ACCU + 0 
5aa0 : a5 0e __ LDA P1 ; (n + 1)
5aa2 : 85 1c __ STA ACCU + 1 
5aa4 : 20 6d 75 JSR $756d ; (divmod + 0)
5aa7 : 18 __ __ CLC
5aa8 : a5 1b __ LDA ACCU + 0 
5aaa : 65 43 __ ADC T1 + 0 
5aac : 85 43 __ STA T1 + 0 
5aae : a5 1c __ LDA ACCU + 1 
5ab0 : 65 44 __ ADC T1 + 1 
5ab2 : 4a __ __ LSR
5ab3 : 85 44 __ STA T1 + 1 
5ab5 : 66 43 __ ROR T1 + 0 
5ab7 : c5 46 __ CMP T2 + 1 
5ab9 : 90 d5 __ BCC $5a90 ; (mc_isqrt.l6 + 0)
.s11:
5abb : d0 06 __ BNE $5ac3 ; (mc_isqrt.s7 + 0)
.s8:
5abd : a5 43 __ LDA T1 + 0 
5abf : c5 45 __ CMP T2 + 0 
5ac1 : 90 cd __ BCC $5a90 ; (mc_isqrt.l6 + 0)
.s7:
5ac3 : a5 45 __ LDA T2 + 0 
5ac5 : 85 1b __ STA ACCU + 0 
5ac7 : a5 46 __ LDA T2 + 1 
5ac9 : b0 ae __ BCS $5a79 ; (mc_isqrt.s3 + 0)
--------------------------------------------------------------------
draw_ball: ; draw_ball(i16,i16,u8,i16)->void
; 199, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s1:
5acb : a2 1c __ LDX #$1c
5acd : b5 53 __ LDA T3 + 0,x 
5acf : 9d c3 bf STA $bfc3,x ; (draw_ball@stack + 0)
5ad2 : ca __ __ DEX
5ad3 : 10 f8 __ BPL $5acd ; (draw_ball.s1 + 2)
.s4:
5ad5 : ad f0 bf LDA $bff0 ; (sstack + 6)
5ad8 : 30 09 __ BMI $5ae3 ; (draw_ball.s82 + 0)
.s84:
5ada : d0 11 __ BNE $5aed ; (draw_ball.s5 + 0)
.s83:
5adc : ad ef bf LDA $bfef ; (sstack + 5)
5adf : c9 03 __ CMP #$03
5ae1 : b0 0a __ BCS $5aed ; (draw_ball.s5 + 0)
.s82:
5ae3 : a9 03 __ LDA #$03
5ae5 : 8d ef bf STA $bfef ; (sstack + 5)
5ae8 : a9 00 __ LDA #$00
5aea : 8d f0 bf STA $bff0 ; (sstack + 6)
.s5:
5aed : ad ef bf LDA $bfef ; (sstack + 5)
5af0 : 85 5d __ STA T9 + 0 
5af2 : 0a __ __ ASL
5af3 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5af5 : ad f0 bf LDA $bff0 ; (sstack + 6)
5af8 : 85 5e __ STA T9 + 1 
5afa : 2a __ __ ROL
5afb : 06 1b __ ASL ACCU + 0 ; (cy + 0)
5afd : 2a __ __ ROL
5afe : aa __ __ TAX
5aff : 18 __ __ CLC
5b00 : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5b02 : 65 5d __ ADC T9 + 0 
5b04 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5b06 : 8a __ __ TXA
5b07 : 65 5e __ ADC T9 + 1 
5b09 : 85 1c __ STA ACCU + 1 ; (cy + 1)
5b0b : a9 00 __ LDA #$00
5b0d : 85 04 __ STA WORK + 1 
5b0f : 20 53 79 JSR $7953 ; (divs16@proxy + 0)
5b12 : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5b14 : 85 5f __ STA T10 + 0 
5b16 : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5b18 : 85 60 __ STA T10 + 1 
5b1a : 38 __ __ SEC
5b1b : a9 00 __ LDA #$00
5b1d : e5 1b __ SBC ACCU + 0 ; (cy + 0)
5b1f : 85 61 __ STA T11 + 0 
5b21 : a9 00 __ LDA #$00
5b23 : 85 04 __ STA WORK + 1 
5b25 : e5 1c __ SBC ACCU + 1 ; (cy + 1)
5b27 : 85 62 __ STA T11 + 1 
5b29 : a5 5d __ LDA T9 + 0 
5b2b : 0a __ __ ASL
5b2c : 85 1b __ STA ACCU + 0 ; (cy + 0)
5b2e : a5 5e __ LDA T9 + 1 
5b30 : 2a __ __ ROL
5b31 : 06 1b __ ASL ACCU + 0 ; (cy + 0)
5b33 : 2a __ __ ROL
5b34 : 06 1b __ ASL ACCU + 0 ; (cy + 0)
5b36 : 2a __ __ ROL
5b37 : aa __ __ TAX
5b38 : 18 __ __ CLC
5b39 : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5b3b : 65 5d __ ADC T9 + 0 
5b3d : 85 1b __ STA ACCU + 0 ; (cy + 0)
5b3f : 8a __ __ TXA
5b40 : 65 5e __ ADC T9 + 1 
5b42 : 85 1c __ STA ACCU + 1 ; (cy + 1)
5b44 : 20 53 79 JSR $7953 ; (divs16@proxy + 0)
5b47 : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5b49 : 85 63 __ STA T12 + 0 
5b4b : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5b4d : 85 64 __ STA T12 + 1 
5b4f : 38 __ __ SEC
5b50 : a9 00 __ LDA #$00
5b52 : e5 1b __ SBC ACCU + 0 ; (cy + 0)
5b54 : 85 65 __ STA T13 + 0 
5b56 : a9 00 __ LDA #$00
5b58 : e5 1c __ SBC ACCU + 1 ; (cy + 1)
5b5a : 85 66 __ STA T13 + 1 
5b5c : a5 5d __ LDA T9 + 0 
5b5e : 85 03 __ STA WORK + 0 
5b60 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5b62 : a5 5e __ LDA T9 + 1 
5b64 : 85 04 __ STA WORK + 1 
5b66 : 85 1c __ STA ACCU + 1 ; (cy + 1)
5b68 : 20 ec 74 JSR $74ec ; (mul16 + 0)
5b6b : a5 05 __ LDA WORK + 2 
5b6d : 85 67 __ STA T14 + 0 
5b6f : a5 06 __ LDA WORK + 3 
5b71 : 85 68 __ STA T14 + 1 
5b73 : 38 __ __ SEC
5b74 : a9 00 __ LDA #$00
5b76 : e5 5d __ SBC T9 + 0 
5b78 : 85 69 __ STA T15 + 0 
5b7a : a9 00 __ LDA #$00
5b7c : e5 5e __ SBC T9 + 1 
5b7e : 85 6a __ STA T15 + 1 
5b80 : a5 5e __ LDA T9 + 1 
5b82 : c5 6a __ CMP T15 + 1 
5b84 : d0 09 __ BNE $5b8f ; (draw_ball.s10 + 0)
.s7:
5b86 : a5 5d __ LDA T9 + 0 
5b88 : c5 69 __ CMP T15 + 0 
.s8:
5b8a : a9 00 __ LDA #$00
5b8c : 2a __ __ ROL
5b8d : 90 09 __ BCC $5b98 ; (draw_ball.s6 + 0)
.s10:
5b8f : 45 6a __ EOR T15 + 1 
5b91 : 10 f7 __ BPL $5b8a ; (draw_ball.s8 + 0)
.s9:
5b93 : a9 00 __ LDA #$00
5b95 : 2a __ __ ROL
5b96 : 49 01 __ EOR #$01
.s6:
5b98 : 85 6f __ STA T20 + 0 
5b9a : d0 03 __ BNE $5b9f ; (draw_ball.s32 + 0)
5b9c : 4c 9e 5d JMP $5d9e ; (draw_ball.s11 + 0)
.s32:
5b9f : ad ec bf LDA $bfec ; (sstack + 2)
5ba2 : 18 __ __ CLC
5ba3 : 65 69 __ ADC T15 + 0 
5ba5 : 85 6b __ STA T16 + 0 
5ba7 : a5 69 __ LDA T15 + 0 
5ba9 : 85 6d __ STA T17 + 0 
5bab : a5 6a __ LDA T15 + 1 
5bad : 85 6e __ STA T17 + 1 
5baf : 6d ed bf ADC $bfed ; (sstack + 3)
5bb2 : 85 6c __ STA T16 + 1 
5bb4 : f0 03 __ BEQ $5bb9 ; (draw_ball.l81 + 0)
5bb6 : 4c 77 5d JMP $5d77 ; (draw_ball.l50 + 0)
.l81:
5bb9 : a5 6b __ LDA T16 + 0 
5bbb : c9 c8 __ CMP #$c8
5bbd : b0 f7 __ BCS $5bb6 ; (draw_ball.s32 + 23)
.s34:
5bbf : a5 6d __ LDA T17 + 0 
5bc1 : 85 03 __ STA WORK + 0 
5bc3 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5bc5 : a5 6e __ LDA T17 + 1 
5bc7 : 85 04 __ STA WORK + 1 
5bc9 : 85 1c __ STA ACCU + 1 ; (cy + 1)
5bcb : 20 ec 74 JSR $74ec ; (mul16 + 0)
5bce : 38 __ __ SEC
5bcf : a5 67 __ LDA T14 + 0 
5bd1 : e5 05 __ SBC WORK + 2 
5bd3 : 85 0d __ STA P0 
5bd5 : a5 68 __ LDA T14 + 1 
5bd7 : e5 06 __ SBC WORK + 3 
5bd9 : 30 db __ BMI $5bb6 ; (draw_ball.s32 + 23)
.s80:
5bdb : 85 0e __ STA P1 
5bdd : 05 0d __ ORA P0 
5bdf : f0 d5 __ BEQ $5bb6 ; (draw_ball.s32 + 23)
.s35:
5be1 : 20 71 5a JSR $5a71 ; (mc_isqrt.s4 + 0)
5be4 : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5be6 : 85 43 __ STA T0 + 0 
5be8 : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5bea : 85 44 __ STA T0 + 1 
5bec : a5 6e __ LDA T17 + 1 
5bee : c5 66 __ CMP T13 + 1 
5bf0 : d0 08 __ BNE $5bfa ; (draw_ball.s79 + 0)
.s76:
5bf2 : a5 6d __ LDA T17 + 0 
5bf4 : c5 65 __ CMP T13 + 0 
.s77:
5bf6 : 90 08 __ BCC $5c00 ; (draw_ball.s75 + 0)
5bf8 : b0 1e __ BCS $5c18 ; (draw_ball.s36 + 0)
.s79:
5bfa : 45 66 __ EOR T13 + 1 
5bfc : 10 f8 __ BPL $5bf6 ; (draw_ball.s77 + 0)
.s78:
5bfe : 90 18 __ BCC $5c18 ; (draw_ball.s36 + 0)
.s75:
5c00 : a9 00 __ LDA #$00
.s41:
5c02 : 85 47 __ STA T18 + 0 
5c04 : ad ea bf LDA $bfea ; (sstack + 0)
5c07 : 85 53 __ STA T3 + 0 
5c09 : a9 00 __ LDA #$00
5c0b : 85 51 __ STA T2 + 0 
5c0d : ad eb bf LDA $bfeb ; (sstack + 1)
5c10 : 85 54 __ STA T3 + 1 
5c12 : ad ee bf LDA $bfee ; (sstack + 4)
5c15 : 4c 64 5c JMP $5c64 ; (draw_ball.l86 + 0)
.s36:
5c18 : a5 6e __ LDA T17 + 1 
5c1a : c5 62 __ CMP T11 + 1 
5c1c : d0 08 __ BNE $5c26 ; (draw_ball.s74 + 0)
.s71:
5c1e : a5 6d __ LDA T17 + 0 
5c20 : c5 61 __ CMP T11 + 0 
.s72:
5c22 : 90 08 __ BCC $5c2c ; (draw_ball.s70 + 0)
5c24 : b0 0a __ BCS $5c30 ; (draw_ball.s37 + 0)
.s74:
5c26 : 45 62 __ EOR T11 + 1 
5c28 : 10 f8 __ BPL $5c22 ; (draw_ball.s72 + 0)
.s73:
5c2a : 90 04 __ BCC $5c30 ; (draw_ball.s37 + 0)
.s70:
5c2c : a9 01 __ LDA #$01
5c2e : d0 d2 __ BNE $5c02 ; (draw_ball.s41 + 0)
.s37:
5c30 : 24 6e __ BIT T17 + 1 
5c32 : 10 04 __ BPL $5c38 ; (draw_ball.s38 + 0)
.s69:
5c34 : a9 02 __ LDA #$02
5c36 : d0 ca __ BNE $5c02 ; (draw_ball.s41 + 0)
.s38:
5c38 : 24 60 __ BIT T10 + 1 
5c3a : 30 10 __ BMI $5c4c ; (draw_ball.s39 + 0)
.s68:
5c3c : a5 6e __ LDA T17 + 1 
5c3e : c5 60 __ CMP T10 + 1 
5c40 : d0 04 __ BNE $5c46 ; (draw_ball.s67 + 0)
.s66:
5c42 : a5 6d __ LDA T17 + 0 
5c44 : c5 5f __ CMP T10 + 0 
.s67:
5c46 : b0 04 __ BCS $5c4c ; (draw_ball.s39 + 0)
.s65:
5c48 : a9 03 __ LDA #$03
5c4a : 90 b6 __ BCC $5c02 ; (draw_ball.s41 + 0)
.s39:
5c4c : 24 64 __ BIT T12 + 1 
5c4e : 30 10 __ BMI $5c60 ; (draw_ball.s40 + 0)
.s64:
5c50 : a5 6e __ LDA T17 + 1 
5c52 : c5 64 __ CMP T12 + 1 
5c54 : d0 04 __ BNE $5c5a ; (draw_ball.s63 + 0)
.s62:
5c56 : a5 6d __ LDA T17 + 0 
5c58 : c5 63 __ CMP T12 + 0 
.s63:
5c5a : b0 04 __ BCS $5c60 ; (draw_ball.s40 + 0)
.s61:
5c5c : a9 04 __ LDA #$04
5c5e : 90 a2 __ BCC $5c02 ; (draw_ball.s41 + 0)
.s40:
5c60 : a9 05 __ LDA #$05
5c62 : d0 9e __ BNE $5c02 ; (draw_ball.s41 + 0)
.l86:
5c64 : 85 4f __ STA T1 + 0 
5c66 : 18 __ __ CLC
5c67 : 69 10 __ ADC #$10
5c69 : 29 3f __ AND #$3f
5c6b : aa __ __ TAX
5c6c : bd 0f 7d LDA $7d0f,x ; (sin64[0] + 0)
5c6f : 85 1b __ STA ACCU + 0 ; (cy + 0)
5c71 : 29 80 __ AND #$80
5c73 : 10 02 __ BPL $5c77 ; (draw_ball.l86 + 19)
5c75 : a9 ff __ LDA #$ff
5c77 : 85 1c __ STA ACCU + 1 ; (cy + 1)
5c79 : a5 43 __ LDA T0 + 0 
5c7b : 85 03 __ STA WORK + 0 
5c7d : a5 44 __ LDA T0 + 1 
5c7f : 85 04 __ STA WORK + 1 
5c81 : 20 ec 74 JSR $74ec ; (mul16 + 0)
5c84 : 20 40 79 JSR $7940 ; (divs16@proxy + 0)
5c87 : 18 __ __ CLC
5c88 : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5c8a : 65 53 __ ADC T3 + 0 
5c8c : a6 51 __ LDX T2 + 0 
5c8e : e8 __ __ INX
5c8f : e8 __ __ INX
5c90 : 86 51 __ STX T2 + 0 
5c92 : 9d cc 83 STA $83cc,x ; (letter_width[0] + 84)
5c95 : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5c97 : 65 54 __ ADC T3 + 1 
5c99 : 9d cd 83 STA $83cd,x ; (letter_width[0] + 85)
5c9c : 18 __ __ CLC
5c9d : a5 4f __ LDA T1 + 0 
5c9f : 69 10 __ ADC #$10
5ca1 : e0 08 __ CPX #$08
5ca3 : d0 bf __ BNE $5c64 ; (draw_ball.l86 + 0)
.s42:
5ca5 : a9 00 __ LDA #$00
5ca7 : 85 4f __ STA T1 + 0 
.l43:
5ca9 : a4 4f __ LDY T1 + 0 
5cab : c8 __ __ INY
5cac : 84 55 __ STY T4 + 0 
5cae : 0a __ __ ASL
5caf : 85 57 __ STA T5 + 0 
.l85:
5cb1 : a5 55 __ LDA T4 + 0 
5cb3 : 0a __ __ ASL
5cb4 : 85 59 __ STA T6 + 0 
5cb6 : aa __ __ TAX
5cb7 : bd ce 83 LDA $83ce,x ; (mx[0] + 0)
5cba : 85 5b __ STA T7 + 0 
5cbc : bd cf 83 LDA $83cf,x ; (mx[0] + 1)
5cbf : 85 5c __ STA T7 + 1 
5cc1 : a6 57 __ LDX T5 + 0 
5cc3 : bd ce 83 LDA $83ce,x ; (mx[0] + 0)
5cc6 : 85 45 __ STA T8 + 0 
5cc8 : bd cf 83 LDA $83cf,x ; (mx[0] + 1)
5ccb : 85 46 __ STA T8 + 1 
5ccd : a5 5c __ LDA T7 + 1 
5ccf : c5 46 __ CMP T8 + 1 
5cd1 : d0 08 __ BNE $5cdb ; (draw_ball.s60 + 0)
.s57:
5cd3 : a5 5b __ LDA T7 + 0 
5cd5 : c5 45 __ CMP T8 + 0 
.s58:
5cd7 : 90 08 __ BCC $5ce1 ; (draw_ball.s56 + 0)
5cd9 : b0 1c __ BCS $5cf7 ; (draw_ball.s44 + 0)
.s60:
5cdb : 45 46 __ EOR T8 + 1 
5cdd : 10 f8 __ BPL $5cd7 ; (draw_ball.s58 + 0)
.s59:
5cdf : 90 16 __ BCC $5cf7 ; (draw_ball.s44 + 0)
.s56:
5ce1 : a5 5b __ LDA T7 + 0 
5ce3 : 9d ce 83 STA $83ce,x ; (mx[0] + 0)
5ce6 : a5 5c __ LDA T7 + 1 
5ce8 : 9d cf 83 STA $83cf,x ; (mx[0] + 1)
5ceb : a5 45 __ LDA T8 + 0 
5ced : a6 59 __ LDX T6 + 0 
5cef : 9d ce 83 STA $83ce,x ; (mx[0] + 0)
5cf2 : a5 46 __ LDA T8 + 1 
5cf4 : 9d cf 83 STA $83cf,x ; (mx[0] + 1)
.s44:
5cf7 : e6 55 __ INC T4 + 0 
5cf9 : c8 __ __ INY
5cfa : c0 04 __ CPY #$04
5cfc : 90 b3 __ BCC $5cb1 ; (draw_ball.l85 + 0)
.s45:
5cfe : e6 4f __ INC T1 + 0 
5d00 : a5 4f __ LDA T1 + 0 
5d02 : c9 03 __ CMP #$03
5d04 : d0 a3 __ BNE $5ca9 ; (draw_ball.l43 + 0)
.s46:
5d06 : a5 53 __ LDA T3 + 0 
5d08 : e5 43 __ SBC T0 + 0 
5d0a : 85 4f __ STA T1 + 0 
5d0c : a5 54 __ LDA T3 + 1 
5d0e : e5 44 __ SBC T0 + 1 
5d10 : 85 50 __ STA T1 + 1 
5d12 : 18 __ __ CLC
5d13 : a5 53 __ LDA T3 + 0 
5d15 : 65 43 __ ADC T0 + 0 
5d17 : 85 51 __ STA T2 + 0 
5d19 : a5 54 __ LDA T3 + 1 
5d1b : 65 44 __ ADC T0 + 1 
5d1d : 85 52 __ STA T2 + 1 
5d1f : a5 47 __ LDA T18 + 0 
5d21 : 85 53 __ STA T3 + 0 
5d23 : a9 00 __ LDA #$00
5d25 : 85 57 __ STA T5 + 0 
5d27 : 85 55 __ STA T4 + 0 
5d29 : 85 13 __ STA P6 
5d2b : a5 6b __ LDA T16 + 0 
5d2d : 85 12 __ STA P5 
.l47:
5d2f : a5 4f __ LDA T1 + 0 
5d31 : 85 14 __ STA P7 
5d33 : a5 50 __ LDA T1 + 1 
5d35 : 85 15 __ STA P8 
5d37 : a5 57 __ LDA T5 + 0 
5d39 : c9 04 __ CMP #$04
5d3b : b0 0a __ BCS $5d47 ; (draw_ball.s48 + 0)
.s55:
5d3d : a4 55 __ LDY T4 + 0 
5d3f : b9 cf 83 LDA $83cf,y ; (mx[0] + 1)
5d42 : be ce 83 LDX $83ce,y ; (mx[0] + 0)
5d45 : 90 04 __ BCC $5d4b ; (draw_ball.s49 + 0)
.s48:
5d47 : a5 52 __ LDA T2 + 1 
5d49 : a6 51 __ LDX T2 + 0 
.s49:
5d4b : 86 16 __ STX P9 
5d4d : 85 17 __ STA P10 
5d4f : 8a __ __ TXA
5d50 : 18 __ __ CLC
5d51 : 69 01 __ ADC #$01
5d53 : 85 4f __ STA T1 + 0 
5d55 : a5 17 __ LDA P10 
5d57 : 69 00 __ ADC #$00
5d59 : 85 50 __ STA T1 + 1 
5d5b : a5 53 __ LDA T3 + 0 
5d5d : 4a __ __ LSR
5d5e : a9 02 __ LDA #$02
5d60 : b0 02 __ BCS $5d64 ; (draw_ball.s96 + 0)
.s95:
5d62 : a9 01 __ LDA #$01
.s96:
5d64 : 85 18 __ STA P11 
5d66 : 20 26 5f JSR $5f26 ; (mc_hspan.s4 + 0)
5d69 : e6 53 __ INC T3 + 0 
5d6b : e6 55 __ INC T4 + 0 
5d6d : e6 55 __ INC T4 + 0 
5d6f : e6 57 __ INC T5 + 0 
5d71 : a5 57 __ LDA T5 + 0 
5d73 : c9 05 __ CMP #$05
5d75 : 90 b8 __ BCC $5d2f ; (draw_ball.l47 + 0)
.l50:
5d77 : e6 6b __ INC T16 + 0 
5d79 : d0 02 __ BNE $5d7d ; (draw_ball.s88 + 0)
.s87:
5d7b : e6 6c __ INC T16 + 1 
.s88:
5d7d : e6 6d __ INC T17 + 0 
5d7f : d0 02 __ BNE $5d83 ; (draw_ball.s90 + 0)
.s89:
5d81 : e6 6e __ INC T17 + 1 
.s90:
5d83 : a5 5e __ LDA T9 + 1 
5d85 : c5 6e __ CMP T17 + 1 
5d87 : d0 08 __ BNE $5d91 ; (draw_ball.s54 + 0)
.s51:
5d89 : a5 5d __ LDA T9 + 0 
5d8b : c5 6d __ CMP T17 + 0 
.s52:
5d8d : b0 08 __ BCS $5d97 ; (draw_ball.s33 + 0)
5d8f : 90 0d __ BCC $5d9e ; (draw_ball.s11 + 0)
.s54:
5d91 : 45 6e __ EOR T17 + 1 
5d93 : 10 f8 __ BPL $5d8d ; (draw_ball.s52 + 0)
.s53:
5d95 : b0 07 __ BCS $5d9e ; (draw_ball.s11 + 0)
.s33:
5d97 : a5 6c __ LDA T16 + 1 
5d99 : d0 dc __ BNE $5d77 ; (draw_ball.l50 + 0)
5d9b : 4c b9 5b JMP $5bb9 ; (draw_ball.l81 + 0)
.s11:
5d9e : a5 65 __ LDA T13 + 0 
5da0 : 8d e0 bf STA $bfe0 ; (lats[0] + 0)
5da3 : a5 66 __ LDA T13 + 1 
5da5 : 8d e1 bf STA $bfe1 ; (lats[0] + 1)
5da8 : a5 61 __ LDA T11 + 0 
5daa : 8d e2 bf STA $bfe2 ; (lats[0] + 2)
5dad : a5 62 __ LDA T11 + 1 
5daf : 8d e3 bf STA $bfe3 ; (lats[0] + 3)
5db2 : a9 00 __ LDA #$00
5db4 : 8d e4 bf STA $bfe4 ; (lats[0] + 4)
5db7 : 8d e5 bf STA $bfe5 ; (lats[0] + 5)
5dba : 85 53 __ STA T3 + 0 
5dbc : a6 5f __ LDX T10 + 0 
5dbe : 8e e6 bf STX $bfe6 ; (lats[0] + 6)
5dc1 : a6 60 __ LDX T10 + 1 
5dc3 : 8e e7 bf STX $bfe7 ; (lats[0] + 7)
5dc6 : a6 63 __ LDX T12 + 0 
5dc8 : 8e e8 bf STX $bfe8 ; (lats[0] + 8)
5dcb : a6 64 __ LDX T12 + 1 
5dcd : 8e e9 bf STX $bfe9 ; (lats[0] + 9)
5dd0 : ae ec bf LDX $bfec ; (sstack + 2)
5dd3 : 86 55 __ STX T4 + 0 
5dd5 : ae ed bf LDX $bfed ; (sstack + 3)
5dd8 : 86 56 __ STX T4 + 1 
.l12:
5dda : 0a __ __ ASL
5ddb : a8 __ __ TAY
5ddc : b9 e0 bf LDA $bfe0,y ; (lats[0] + 0)
5ddf : 18 __ __ CLC
5de0 : 65 55 __ ADC T4 + 0 
5de2 : 85 4f __ STA T1 + 0 
5de4 : b9 e1 bf LDA $bfe1,y ; (lats[0] + 1)
5de7 : 65 56 __ ADC T4 + 1 
5de9 : d0 58 __ BNE $5e43 ; (draw_ball.s15 + 0)
.s31:
5deb : a5 4f __ LDA T1 + 0 
5ded : c9 c8 __ CMP #$c8
5def : b0 52 __ BCS $5e43 ; (draw_ball.s15 + 0)
.s13:
5df1 : b9 e0 bf LDA $bfe0,y ; (lats[0] + 0)
5df4 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5df6 : 85 03 __ STA WORK + 0 
5df8 : b9 e1 bf LDA $bfe1,y ; (lats[0] + 1)
5dfb : 85 1c __ STA ACCU + 1 ; (cy + 1)
5dfd : 85 04 __ STA WORK + 1 
5dff : 20 ec 74 JSR $74ec ; (mul16 + 0)
5e02 : 38 __ __ SEC
5e03 : a5 67 __ LDA T14 + 0 
5e05 : e5 05 __ SBC WORK + 2 
5e07 : 85 0d __ STA P0 
5e09 : a5 68 __ LDA T14 + 1 
5e0b : e5 06 __ SBC WORK + 3 
5e0d : 30 34 __ BMI $5e43 ; (draw_ball.s15 + 0)
.s30:
5e0f : 85 0e __ STA P1 
5e11 : 05 0d __ ORA P0 
5e13 : f0 2e __ BEQ $5e43 ; (draw_ball.s15 + 0)
.s14:
5e15 : 20 71 5a JSR $5a71 ; (mc_isqrt.s4 + 0)
5e18 : a5 4f __ LDA T1 + 0 
5e1a : 85 12 __ STA P5 
5e1c : a9 00 __ LDA #$00
5e1e : 85 13 __ STA P6 
5e20 : 85 18 __ STA P11 
5e22 : ad ea bf LDA $bfea ; (sstack + 0)
5e25 : 18 __ __ CLC
5e26 : 65 1b __ ADC ACCU + 0 ; (cy + 0)
5e28 : 85 16 __ STA P9 
5e2a : ad eb bf LDA $bfeb ; (sstack + 1)
5e2d : 65 1c __ ADC ACCU + 1 ; (cy + 1)
5e2f : 85 17 __ STA P10 
5e31 : ad ea bf LDA $bfea ; (sstack + 0)
5e34 : 38 __ __ SEC
5e35 : e5 1b __ SBC ACCU + 0 ; (cy + 0)
5e37 : 85 14 __ STA P7 
5e39 : ad eb bf LDA $bfeb ; (sstack + 1)
5e3c : e5 1c __ SBC ACCU + 1 ; (cy + 1)
5e3e : 85 15 __ STA P8 
5e40 : 20 26 5f JSR $5f26 ; (mc_hspan.s4 + 0)
.s15:
5e43 : e6 53 __ INC T3 + 0 
5e45 : a5 53 __ LDA T3 + 0 
5e47 : c9 05 __ CMP #$05
5e49 : d0 8f __ BNE $5dda ; (draw_ball.l12 + 0)
.s16:
5e4b : a5 6f __ LDA T20 + 0 
5e4d : d0 0b __ BNE $5e5a ; (draw_ball.s17 + 0)
.s3:
5e4f : a2 1c __ LDX #$1c
5e51 : bd c3 bf LDA $bfc3,x ; (draw_ball@stack + 0)
5e54 : 95 53 __ STA T3 + 0,x 
5e56 : ca __ __ DEX
5e57 : 10 f8 __ BPL $5e51 ; (draw_ball.s3 + 2)
5e59 : 60 __ __ RTS
.s17:
5e5a : ad ee bf LDA $bfee ; (sstack + 4)
5e5d : 85 51 __ STA T2 + 0 
5e5f : a9 04 __ LDA #$04
5e61 : 85 5b __ STA T7 + 0 
.l18:
5e63 : 18 __ __ CLC
5e64 : a5 55 __ LDA T4 + 0 
5e66 : 65 69 __ ADC T15 + 0 
5e68 : 85 53 __ STA T3 + 0 
5e6a : a5 56 __ LDA T4 + 1 
5e6c : 65 6a __ ADC T15 + 1 
5e6e : 85 54 __ STA T3 + 1 
5e70 : a5 69 __ LDA T15 + 0 
5e72 : 85 57 __ STA T5 + 0 
5e74 : a5 6a __ LDA T15 + 1 
5e76 : 85 58 __ STA T5 + 1 
5e78 : 18 __ __ CLC
5e79 : a5 51 __ LDA T2 + 0 
5e7b : 69 10 __ ADC #$10
5e7d : 29 3f __ AND #$3f
5e7f : aa __ __ TAX
5e80 : bd 0f 7d LDA $7d0f,x ; (sin64[0] + 0)
5e83 : 85 59 __ STA T6 + 0 
5e85 : 29 80 __ AND #$80
5e87 : 10 02 __ BPL $5e8b ; (draw_ball.l18 + 40)
5e89 : a9 ff __ LDA #$ff
5e8b : 85 5a __ STA T6 + 1 
5e8d : a5 54 __ LDA T3 + 1 
5e8f : d0 5d __ BNE $5eee ; (draw_ball.l22 + 0)
.l29:
5e91 : a5 53 __ LDA T3 + 0 
5e93 : c9 c8 __ CMP #$c8
5e95 : b0 57 __ BCS $5eee ; (draw_ball.l22 + 0)
.s20:
5e97 : a5 57 __ LDA T5 + 0 
5e99 : 85 03 __ STA WORK + 0 
5e9b : 85 1b __ STA ACCU + 0 ; (cy + 0)
5e9d : a5 58 __ LDA T5 + 1 
5e9f : 85 04 __ STA WORK + 1 
5ea1 : 85 1c __ STA ACCU + 1 ; (cy + 1)
5ea3 : 20 ec 74 JSR $74ec ; (mul16 + 0)
5ea6 : 38 __ __ SEC
5ea7 : a5 67 __ LDA T14 + 0 
5ea9 : e5 05 __ SBC WORK + 2 
5eab : 85 0d __ STA P0 
5ead : a5 68 __ LDA T14 + 1 
5eaf : e5 06 __ SBC WORK + 3 
5eb1 : 30 3b __ BMI $5eee ; (draw_ball.l22 + 0)
.s28:
5eb3 : 85 0e __ STA P1 
5eb5 : 05 0d __ ORA P0 
5eb7 : f0 35 __ BEQ $5eee ; (draw_ball.l22 + 0)
.s21:
5eb9 : 20 71 5a JSR $5a71 ; (mc_isqrt.s4 + 0)
5ebc : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5ebe : 85 03 __ STA WORK + 0 
5ec0 : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5ec2 : 85 04 __ STA WORK + 1 
5ec4 : a5 53 __ LDA T3 + 0 
5ec6 : 85 0f __ STA P2 
5ec8 : a9 00 __ LDA #$00
5eca : 85 10 __ STA P3 
5ecc : 85 11 __ STA P4 
5ece : a5 59 __ LDA T6 + 0 
5ed0 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5ed2 : a5 5a __ LDA T6 + 1 
5ed4 : 85 1c __ STA ACCU + 1 ; (cy + 1)
5ed6 : 20 ec 74 JSR $74ec ; (mul16 + 0)
5ed9 : 20 40 79 JSR $7940 ; (divs16@proxy + 0)
5edc : ad ea bf LDA $bfea ; (sstack + 0)
5edf : 18 __ __ CLC
5ee0 : 65 1b __ ADC ACCU + 0 ; (cy + 0)
5ee2 : 85 0d __ STA P0 
5ee4 : ad eb bf LDA $bfeb ; (sstack + 1)
5ee7 : 65 1c __ ADC ACCU + 1 ; (cy + 1)
5ee9 : 85 0e __ STA P1 
5eeb : 20 cf 58 JSR $58cf ; (mc_setpix.s4 + 0)
.l22:
5eee : e6 53 __ INC T3 + 0 
5ef0 : d0 02 __ BNE $5ef4 ; (draw_ball.s92 + 0)
.s91:
5ef2 : e6 54 __ INC T3 + 1 
.s92:
5ef4 : e6 57 __ INC T5 + 0 
5ef6 : d0 02 __ BNE $5efa ; (draw_ball.s94 + 0)
.s93:
5ef8 : e6 58 __ INC T5 + 1 
.s94:
5efa : a5 5e __ LDA T9 + 1 
5efc : c5 58 __ CMP T5 + 1 
5efe : d0 08 __ BNE $5f08 ; (draw_ball.s27 + 0)
.s24:
5f00 : a5 5d __ LDA T9 + 0 
5f02 : c5 57 __ CMP T5 + 0 
.s25:
5f04 : 90 08 __ BCC $5f0e ; (draw_ball.s23 + 0)
5f06 : b0 17 __ BCS $5f1f ; (draw_ball.s19 + 0)
.s27:
5f08 : 45 58 __ EOR T5 + 1 
5f0a : 10 f8 __ BPL $5f04 ; (draw_ball.s25 + 0)
.s26:
5f0c : 90 11 __ BCC $5f1f ; (draw_ball.s19 + 0)
.s23:
5f0e : 18 __ __ CLC
5f0f : a5 51 __ LDA T2 + 0 
5f11 : 69 10 __ ADC #$10
5f13 : 85 51 __ STA T2 + 0 
5f15 : c6 5b __ DEC T7 + 0 
5f17 : f0 03 __ BEQ $5f1c ; (draw_ball.s23 + 14)
5f19 : 4c 63 5e JMP $5e63 ; (draw_ball.l18 + 0)
5f1c : 4c 4f 5e JMP $5e4f ; (draw_ball.s3 + 0)
.s19:
5f1f : a5 54 __ LDA T3 + 1 
5f21 : d0 cb __ BNE $5eee ; (draw_ball.l22 + 0)
5f23 : 4c 91 5e JMP $5e91 ; (draw_ball.l29 + 0)
--------------------------------------------------------------------
mc_hspan: ; mc_hspan(i16,i16,i16,u8)->void
;  65, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5f26 : a5 13 __ LDA P6 ; (my + 1)
5f28 : f0 01 __ BEQ $5f2b ; (mc_hspan.s39 + 0)
5f2a : 60 __ __ RTS
.s39:
5f2b : a5 12 __ LDA P5 ; (my + 0)
5f2d : c9 c8 __ CMP #$c8
5f2f : 90 01 __ BCC $5f32 ; (mc_hspan.s5 + 0)
5f31 : 60 __ __ RTS
.s5:
5f32 : 24 15 __ BIT P8 ; (x0 + 1)
5f34 : 10 08 __ BPL $5f3e ; (mc_hspan.s49 + 0)
.s38:
5f36 : a9 00 __ LDA #$00
5f38 : 85 14 __ STA P7 ; (x0 + 0)
5f3a : 85 15 __ STA P8 ; (x0 + 1)
5f3c : 90 02 __ BCC $5f40 ; (mc_hspan.s6 + 0)
.s49:
5f3e : a5 14 __ LDA P7 ; (x0 + 0)
.s6:
5f40 : 85 46 __ STA T4 + 0 
5f42 : a6 15 __ LDX P8 ; (x0 + 1)
5f44 : a5 17 __ LDA P10 ; (x1 + 1)
5f46 : 10 01 __ BPL $5f49 ; (mc_hspan.s37 + 0)
5f48 : 60 __ __ RTS
.s37:
5f49 : 86 47 __ STX T4 + 1 
5f4b : d0 09 __ BNE $5f56 ; (mc_hspan.s34 + 0)
.s36:
5f4d : a5 16 __ LDA P9 ; (x1 + 0)
5f4f : c9 a0 __ CMP #$a0
5f51 : b0 03 __ BCS $5f56 ; (mc_hspan.s34 + 0)
5f53 : 4c be 60 JMP $60be ; (mc_hspan.s7 + 0)
.s34:
5f56 : a9 9f __ LDA #$9f
5f58 : 85 16 __ STA P9 ; (x1 + 0)
5f5a : a9 00 __ LDA #$00
5f5c : 85 17 __ STA P10 ; (x1 + 1)
5f5e : 8a __ __ TXA
5f5f : f0 01 __ BEQ $5f62 ; (mc_hspan.s35 + 0)
5f61 : 60 __ __ RTS
.s35:
5f62 : a5 14 __ LDA P7 ; (x0 + 0)
5f64 : c9 a0 __ CMP #$a0
5f66 : 90 01 __ BCC $5f69 ; (mc_hspan.s8 + 0)
5f68 : 60 __ __ RTS
.s8:
5f69 : a5 16 __ LDA P9 ; (x1 + 0)
5f6b : 85 4a __ STA T6 + 0 
5f6d : 85 48 __ STA T5 + 0 
5f6f : a5 14 __ LDA P7 ; (x0 + 0)
5f71 : 4a __ __ LSR
5f72 : 4a __ __ LSR
5f73 : 85 4c __ STA T7 + 0 
5f75 : a5 17 __ LDA P10 ; (x1 + 1)
5f77 : 85 49 __ STA T5 + 1 
5f79 : 4a __ __ LSR
5f7a : 66 4a __ ROR T6 + 0 
5f7c : 4a __ __ LSR
5f7d : 66 4a __ ROR T6 + 0 
5f7f : 49 20 __ EOR #$20
5f81 : 38 __ __ SEC
5f82 : e9 20 __ SBC #$20
5f84 : 85 4b __ STA T6 + 1 
5f86 : d0 09 __ BNE $5f91 ; (mc_hspan.s9 + 0)
.s31:
5f88 : a5 4c __ LDA T7 + 0 
5f8a : c5 4a __ CMP T6 + 0 
5f8c : d0 03 __ BNE $5f91 ; (mc_hspan.s9 + 0)
5f8e : 4c 8f 60 JMP $608f ; (mc_hspan.s26 + 0)
.s9:
5f91 : a5 12 __ LDA P5 ; (my + 0)
5f93 : 85 0f __ STA P2 
5f95 : 29 07 __ AND #$07
5f97 : 85 1b __ STA ACCU + 0 
5f99 : a5 12 __ LDA P5 ; (my + 0)
5f9b : 4a __ __ LSR
5f9c : 4a __ __ LSR
5f9d : 4a __ __ LSR
5f9e : 85 43 __ STA T1 + 0 
5fa0 : 0a __ __ ASL
5fa1 : 0a __ __ ASL
5fa2 : 65 43 __ ADC T1 + 0 
5fa4 : 4a __ __ LSR
5fa5 : 6a __ __ ROR
5fa6 : aa __ __ TAX
5fa7 : 29 80 __ AND #$80
5fa9 : 6a __ __ ROR
5faa : 05 1b __ ORA ACCU + 0 
5fac : 85 4d __ STA T8 + 0 
5fae : 8a __ __ TXA
5faf : 29 3f __ AND #$3f
5fb1 : 69 e0 __ ADC #$e0
5fb3 : 85 4e __ STA T8 + 1 
5fb5 : a5 18 __ LDA P11 ; (col + 0)
5fb7 : 85 1c __ STA ACCU + 1 
5fb9 : 0a __ __ ASL
5fba : 0a __ __ ASL
5fbb : 05 18 __ ORA P11 ; (col + 0)
5fbd : 85 43 __ STA T1 + 0 
5fbf : a5 18 __ LDA P11 ; (col + 0)
5fc1 : 0a __ __ ASL
5fc2 : 0a __ __ ASL
5fc3 : 0a __ __ ASL
5fc4 : 0a __ __ ASL
5fc5 : 05 43 __ ORA T1 + 0 
5fc7 : 85 43 __ STA T1 + 0 
5fc9 : a9 00 __ LDA #$00
5fcb : 85 10 __ STA P3 
5fcd : 46 1c __ LSR ACCU + 1 
5fcf : 6a __ __ ROR
5fd0 : 66 1c __ ROR ACCU + 1 
5fd2 : 6a __ __ ROR
5fd3 : 05 43 __ ORA T1 + 0 
5fd5 : 85 45 __ STA T2 + 0 
.l10:
5fd7 : 20 c3 58 JSR $58c3 ; (mc_setpix@proxy + 0)
5fda : 18 __ __ CLC
5fdb : a5 0d __ LDA P0 
5fdd : 69 01 __ ADC #$01
5fdf : 85 46 __ STA T4 + 0 
5fe1 : 85 1b __ STA ACCU + 0 
5fe3 : a5 0e __ LDA P1 
5fe5 : 69 00 __ ADC #$00
5fe7 : 85 47 __ STA T4 + 1 
5fe9 : 4a __ __ LSR
5fea : 66 1b __ ROR ACCU + 0 
5fec : 4a __ __ LSR
5fed : 66 1b __ ROR ACCU + 0 
5fef : 49 20 __ EOR #$20
5ff1 : c9 20 __ CMP #$20
5ff3 : d0 06 __ BNE $5ffb ; (mc_hspan.s11 + 0)
.s25:
5ff5 : a5 1b __ LDA ACCU + 0 
5ff7 : c5 4c __ CMP T7 + 0 
5ff9 : f0 dc __ BEQ $5fd7 ; (mc_hspan.l10 + 0)
.s11:
5ffb : a9 00 __ LDA #$00
5ffd : 85 1c __ STA ACCU + 1 
5fff : a6 4c __ LDX T7 + 0 
6001 : e8 __ __ INX
6002 : a5 4b __ LDA T6 + 1 
6004 : 30 43 __ BMI $6049 ; (mc_hspan.s12 + 0)
.s24:
6006 : f0 04 __ BEQ $600c ; (mc_hspan.s23 + 0)
.s40:
6008 : 8a __ __ TXA
6009 : 4c 11 60 JMP $6011 ; (mc_hspan.s19 + 0)
.s23:
600c : 8a __ __ TXA
600d : e4 4a __ CPX T6 + 0 
600f : b0 38 __ BCS $6049 ; (mc_hspan.s12 + 0)
.s19:
6011 : 0a __ __ ASL
6012 : 0a __ __ ASL
6013 : 0a __ __ ASL
6014 : a0 00 __ LDY #$00
6016 : 90 02 __ BCC $601a ; (mc_hspan.s42 + 0)
.s41:
6018 : c8 __ __ INY
6019 : 18 __ __ CLC
.s42:
601a : 65 4d __ ADC T8 + 0 
601c : 85 43 __ STA T1 + 0 
601e : 98 __ __ TYA
601f : 65 4e __ ADC T8 + 1 
6021 : 85 44 __ STA T1 + 1 
.l20:
6023 : a5 45 __ LDA T2 + 0 
6025 : a0 00 __ LDY #$00
6027 : 91 43 __ STA (T1 + 0),y 
6029 : 24 4b __ BIT T6 + 1 
602b : 30 1c __ BMI $6049 ; (mc_hspan.s12 + 0)
.s22:
602d : e8 __ __ INX
602e : d0 02 __ BNE $6032 ; (mc_hspan.s44 + 0)
.s43:
6030 : e6 1c __ INC ACCU + 1 
.s44:
6032 : 18 __ __ CLC
6033 : a5 43 __ LDA T1 + 0 
6035 : 69 08 __ ADC #$08
6037 : 85 43 __ STA T1 + 0 
6039 : 90 02 __ BCC $603d ; (mc_hspan.s46 + 0)
.s45:
603b : e6 44 __ INC T1 + 1 
.s46:
603d : a5 1c __ LDA ACCU + 1 
603f : c5 4b __ CMP T6 + 1 
6041 : 90 e0 __ BCC $6023 ; (mc_hspan.l20 + 0)
.s48:
6043 : d0 04 __ BNE $6049 ; (mc_hspan.s12 + 0)
.s21:
6045 : e4 4a __ CPX T6 + 0 
6047 : 90 da __ BCC $6023 ; (mc_hspan.l20 + 0)
.s12:
6049 : 06 4a __ ASL T6 + 0 
604b : 26 4b __ ROL T6 + 1 
604d : 06 4a __ ASL T6 + 0 
604f : 26 4b __ ROL T6 + 1 
6051 : a9 00 __ LDA #$00
6053 : 85 10 __ STA P3 
6055 : f0 20 __ BEQ $6077 ; (mc_hspan.l13 + 0)
.s14:
6057 : a5 4a __ LDA T6 + 0 
6059 : 85 0d __ STA P0 
605b : a5 4b __ LDA T6 + 1 
605d : 85 0e __ STA P1 
605f : a5 12 __ LDA P5 ; (my + 0)
6061 : 85 0f __ STA P2 
6063 : a5 18 __ LDA P11 ; (col + 0)
6065 : 85 11 __ STA P4 
6067 : 20 cf 58 JSR $58cf ; (mc_setpix.s4 + 0)
606a : 18 __ __ CLC
606b : a5 0d __ LDA P0 
606d : 69 01 __ ADC #$01
606f : 85 4a __ STA T6 + 0 
6071 : a5 0e __ LDA P1 
6073 : 69 00 __ ADC #$00
6075 : 85 4b __ STA T6 + 1 
.l13:
6077 : a5 49 __ LDA T5 + 1 
6079 : c5 4b __ CMP T6 + 1 
607b : d0 07 __ BNE $6084 ; (mc_hspan.s18 + 0)
.s15:
607d : a5 48 __ LDA T5 + 0 
607f : c5 4a __ CMP T6 + 0 
6081 : 4c 88 60 JMP $6088 ; (mc_hspan.s16 + 0)
.s18:
6084 : 45 4b __ EOR T6 + 1 
6086 : 30 03 __ BMI $608b ; (mc_hspan.s17 + 0)
.s16:
6088 : b0 cd __ BCS $6057 ; (mc_hspan.s14 + 0)
.s3:
608a : 60 __ __ RTS
.s17:
608b : b0 fd __ BCS $608a ; (mc_hspan.s3 + 0)
608d : 90 c8 __ BCC $6057 ; (mc_hspan.s14 + 0)
.s26:
608f : a5 17 __ LDA P10 ; (x1 + 1)
6091 : c5 15 __ CMP P8 ; (x0 + 1)
6093 : d0 04 __ BNE $6099 ; (mc_hspan.l47 + 0)
.s28:
6095 : a5 48 __ LDA T5 + 0 
6097 : c5 46 __ CMP T4 + 0 
.l47:
6099 : 90 ef __ BCC $608a ; (mc_hspan.s3 + 0)
.s50:
609b : a9 00 __ LDA #$00
609d : 85 10 __ STA P3 
609f : a5 12 __ LDA P5 ; (my + 0)
60a1 : 85 0f __ STA P2 
.l27:
60a3 : 20 c3 58 JSR $58c3 ; (mc_setpix@proxy + 0)
60a6 : 18 __ __ CLC
60a7 : a5 0d __ LDA P0 
60a9 : 69 01 __ ADC #$01
60ab : 85 46 __ STA T4 + 0 
60ad : a5 0e __ LDA P1 
60af : 69 00 __ ADC #$00
60b1 : 85 47 __ STA T4 + 1 
60b3 : a5 49 __ LDA T5 + 1 
60b5 : 30 d3 __ BMI $608a ; (mc_hspan.s3 + 0)
.s30:
60b7 : c5 47 __ CMP T4 + 1 
60b9 : f0 da __ BEQ $6095 ; (mc_hspan.s28 + 0)
.s29:
60bb : b0 e6 __ BCS $60a3 ; (mc_hspan.l27 + 0)
60bd : 60 __ __ RTS
.s7:
60be : a5 17 __ LDA P10 ; (x1 + 1)
60c0 : c5 15 __ CMP P8 ; (x0 + 1)
60c2 : d0 04 __ BNE $60c8 ; (mc_hspan.s33 + 0)
.s32:
60c4 : a5 16 __ LDA P9 ; (x1 + 0)
60c6 : c5 14 __ CMP P7 ; (x0 + 0)
.s33:
60c8 : 90 c0 __ BCC $608a ; (mc_hspan.s3 + 0)
60ca : 4c 69 5f JMP $5f69 ; (mc_hspan.s8 + 0)
--------------------------------------------------------------------
vectors_run: ; vectors_run()->void
;   3, "/home/xahmol/git/UltimateDemo2026/src/vectors.h"
.s1:
60cd : a2 04 __ LDX #$04
60cf : b5 53 __ LDA T3 + 0,x 
60d1 : 9d c6 bf STA $bfc6,x ; (vectors_run@stack + 0)
60d4 : ca __ __ DEX
60d5 : 10 f8 __ BPL $60cf ; (vectors_run.s1 + 2)
.s4:
60d7 : 20 a0 61 JSR $61a0 ; (vec_init.s4 + 0)
60da : a9 00 __ LDA #$00
60dc : 85 53 __ STA T3 + 0 
60de : 85 54 __ STA T4 + 0 
60e0 : a9 a8 __ LDA #$a8
60e2 : 85 55 __ STA T5 + 0 
60e4 : a9 fd __ LDA #$fd
60e6 : 85 56 __ STA T5 + 1 
.l5:
60e8 : 2c 11 d0 BIT $d011 
60eb : 30 fb __ BMI $60e8 ; (vectors_run.l5 + 0)
.l6:
60ed : 2c 11 d0 BIT $d011 
60f0 : 10 fb __ BPL $60ed ; (vectors_run.l6 + 0)
.s7:
60f2 : a9 00 __ LDA #$00
60f4 : 85 57 __ STA T6 + 0 
60f6 : 85 0f __ STA P2 
60f8 : 85 10 __ STA P3 
60fa : 85 0d __ STA P0 
60fc : 20 1b 79 JSR $791b ; (memset@proxy + 0)
60ff : e6 53 __ INC T3 + 0 
6101 : a5 53 __ LDA T3 + 0 
6103 : 85 0d __ STA P0 
6105 : a6 54 __ LDX T4 + 0 
6107 : e8 __ __ INX
6108 : e8 __ __ INX
6109 : 86 54 __ STX T4 + 0 
610b : 86 0e __ STX P1 
610d : 20 0d 62 JSR $620d ; (project.s1 + 0)
.l8:
6110 : a9 d6 __ LDA #$d6
6112 : 8d ea bf STA $bfea ; (sstack + 0)
6115 : a9 83 __ LDA #$83
6117 : 8d eb bf STA $bfeb ; (sstack + 1)
611a : a9 30 __ LDA #$30
611c : 8d ec bf STA $bfec ; (sstack + 2)
611f : a9 80 __ LDA #$80
6121 : 8d ed bf STA $bfed ; (sstack + 3)
6124 : a9 00 __ LDA #$00
6126 : 8d f6 bf STA $bff6 ; (sstack + 12)
6129 : a4 57 __ LDY T6 + 0 
612b : b9 18 80 LDA $8018,y ; (cube_e[0][0] + 0)
612e : 0a __ __ ASL
612f : aa __ __ TAX
6130 : bd ee 83 LDA $83ee,x ; (px_cur[0] + 0)
6133 : 8d ee bf STA $bfee ; (sstack + 4)
6136 : bd ef 83 LDA $83ef,x ; (px_cur[0] + 1)
6139 : 8d ef bf STA $bfef ; (sstack + 5)
613c : bd de 83 LDA $83de,x ; (py_cur[0] + 0)
613f : 8d f0 bf STA $bff0 ; (sstack + 6)
6142 : bd df 83 LDA $83df,x ; (py_cur[0] + 1)
6145 : 8d f1 bf STA $bff1 ; (sstack + 7)
6148 : b9 19 80 LDA $8019,y ; (cube_e[0][0] + 1)
614b : 0a __ __ ASL
614c : aa __ __ TAX
614d : bd ee 83 LDA $83ee,x ; (px_cur[0] + 0)
6150 : 8d f2 bf STA $bff2 ; (sstack + 8)
6153 : bd ef 83 LDA $83ef,x ; (px_cur[0] + 1)
6156 : 8d f3 bf STA $bff3 ; (sstack + 9)
6159 : bd de 83 LDA $83de,x ; (py_cur[0] + 0)
615c : 8d f4 bf STA $bff4 ; (sstack + 10)
615f : bd df 83 LDA $83df,x ; (py_cur[0] + 1)
6162 : 8d f5 bf STA $bff5 ; (sstack + 11)
6165 : 20 ab 34 JSR $34ab ; (bm_line.s1 + 0)
6168 : 18 __ __ CLC
6169 : a5 57 __ LDA T6 + 0 
616b : 69 02 __ ADC #$02
616d : 85 57 __ STA T6 + 0 
616f : c9 18 __ CMP #$18
6171 : d0 9d __ BNE $6110 ; (vectors_run.l8 + 0)
.s9:
6173 : e6 55 __ INC T5 + 0 
6175 : f0 03 __ BEQ $617a ; (vectors_run.s11 + 0)
6177 : 4c e8 60 JMP $60e8 ; (vectors_run.l5 + 0)
.s11:
617a : e6 56 __ INC T5 + 1 
617c : d0 f9 __ BNE $6177 ; (vectors_run.s9 + 4)
.s10:
617e : a9 00 __ LDA #$00
6180 : 85 0d __ STA P0 
6182 : 85 0e __ STA P1 
6184 : 85 10 __ STA P3 
6186 : a9 36 __ LDA #$36
6188 : 85 01 __ STA $01 
618a : 20 0c 0f JSR $0f0c ; (vic_setmode@proxy + 0)
618d : a9 00 __ LDA #$00
618f : 8d 20 d0 STA $d020 
6192 : 8d 21 d0 STA $d021 
.s3:
6195 : a2 04 __ LDX #$04
6197 : bd c6 bf LDA $bfc6,x ; (vectors_run@stack + 0)
619a : 95 53 __ STA T3 + 0,x 
619c : ca __ __ DEX
619d : 10 f8 __ BPL $6197 ; (vectors_run.s3 + 2)
619f : 60 __ __ RTS
--------------------------------------------------------------------
vec_init: ; vec_init()->void
; 116, "/home/xahmol/git/UltimateDemo2026/src/vectors.c"
.s4:
61a0 : 78 __ __ SEI
61a1 : a9 00 __ LDA #$00
61a3 : 85 0f __ STA P2 
61a5 : 85 10 __ STA P3 
61a7 : a9 30 __ LDA #$30
61a9 : 85 01 __ STA $01 
61ab : a9 40 __ LDA #$40
61ad : 85 11 __ STA P4 
61af : a9 1f __ LDA #$1f
61b1 : 85 12 __ STA P5 
61b3 : a9 10 __ LDA #$10
61b5 : a2 fa __ LDX #$fa
.l6:
61b7 : ca __ __ DEX
61b8 : 9d 00 d0 STA $d000,x 
61bb : 9d fa d0 STA $d0fa,x 
61be : 9d f4 d1 STA $d1f4,x 
61c1 : 9d ee d2 STA $d2ee,x 
61c4 : d0 f1 __ BNE $61b7 ; (vec_init.l6 + 0)
.s5:
61c6 : a9 00 __ LDA #$00
61c8 : 85 43 __ STA T1 + 0 
61ca : 85 0d __ STA P0 
61cc : a9 e0 __ LDA #$e0
61ce : 85 44 __ STA T1 + 1 
61d0 : 85 0e __ STA P1 
61d2 : 20 0f 21 JSR $210f ; (memset.s4 + 0)
61d5 : a9 35 __ LDA #$35
61d7 : 85 01 __ STA $01 
61d9 : 20 2b 21 JSR $212b ; (mmap_trampoline.s4 + 0)
61dc : 58 __ __ CLI
61dd : 20 8a 79 JSR $798a ; (vic_setmode@proxy + 0)
61e0 : a5 10 __ LDA P3 
61e2 : 8d d6 83 STA $83d6 ; (VScreen.data + 0)
61e5 : a5 11 __ LDA P4 
61e7 : 8d d7 83 STA $83d7 ; (VScreen.data + 1)
61ea : a9 28 __ LDA #$28
61ec : 8d da 83 STA $83da ; (VScreen.cwidth + 0)
61ef : a9 19 __ LDA #$19
61f1 : 8d db 83 STA $83db ; (VScreen.cheight + 0)
61f4 : a9 40 __ LDA #$40
61f6 : 8d dc 83 STA $83dc ; (VScreen.width + 0)
61f9 : a9 01 __ LDA #$01
61fb : 8d dd 83 STA $83dd ; (VScreen.width + 1)
61fe : a9 00 __ LDA #$00
6200 : 8d 20 d0 STA $d020 
6203 : 8d 21 d0 STA $d021 
6206 : 8d d8 83 STA $83d8 ; (VScreen.rdata + 0)
6209 : 8d d9 83 STA $83d9 ; (VScreen.rdata + 1)
.s3:
620c : 60 __ __ RTS
--------------------------------------------------------------------
project: ; project(u8,u8,i16*,i16*)->void
;  81, "/home/xahmol/git/UltimateDemo2026/src/vectors.c"
.s1:
620d : a2 0e __ LDX #$0e
620f : b5 53 __ LDA T4 + 0,x 
6211 : 9d d2 bf STA $bfd2,x ; (project@stack + 0)
6214 : ca __ __ DEX
6215 : 10 f8 __ BPL $620f ; (project.s1 + 2)
.s4:
6217 : a5 0d __ LDA P0 ; (ax + 0)
6219 : 0a __ __ ASL
621a : 85 47 __ STA T1 + 0 
621c : a9 7e __ LDA #$7e
621e : 69 00 __ ADC #$00
6220 : 85 5a __ STA T7 + 1 
6222 : 18 __ __ CLC
6223 : a5 0e __ LDA P1 ; (ay + 0)
6225 : 69 40 __ ADC #$40
6227 : 0a __ __ ASL
6228 : 85 4b __ STA T2 + 0 
622a : a9 00 __ LDA #$00
622c : 85 48 __ STA T1 + 1 
622e : 2a __ __ ROL
622f : aa __ __ TAX
6230 : a9 18 __ LDA #$18
6232 : 85 59 __ STA T7 + 0 
6234 : 65 4b __ ADC T2 + 0 
6236 : 85 5b __ STA T8 + 0 
6238 : 8a __ __ TXA
6239 : 69 7e __ ADC #$7e
623b : 85 5c __ STA T8 + 1 
623d : 06 0e __ ASL P1 ; (ay + 0)
623f : 26 48 __ ROL T1 + 1 
6241 : 18 __ __ CLC
6242 : a9 18 __ LDA #$18
6244 : 65 0e __ ADC P1 ; (ay + 0)
6246 : 85 5d __ STA T9 + 0 
6248 : a9 7e __ LDA #$7e
624a : 65 48 __ ADC T1 + 1 
624c : 85 5e __ STA T9 + 1 
624e : 18 __ __ CLC
624f : a5 0d __ LDA P0 ; (ax + 0)
6251 : 69 40 __ ADC #$40
6253 : 0a __ __ ASL
6254 : a2 00 __ LDX #$00
6256 : 90 02 __ BCC $625a ; (project.s11 + 0)
.s10:
6258 : e8 __ __ INX
6259 : 18 __ __ CLC
.s11:
625a : 69 18 __ ADC #$18
625c : 85 5f __ STA T10 + 0 
625e : 8a __ __ TXA
625f : 69 7e __ ADC #$7e
6261 : 85 60 __ STA T10 + 1 
6263 : a9 00 __ LDA #$00
6265 : 85 52 __ STA T11 + 0 
.l5:
6267 : 85 61 __ STA T12 + 0 
6269 : aa __ __ TAX
626a : bd 00 7e LDA $7e00,x ; (cube_v[0][0] + 0)
626d : 29 80 __ AND #$80
626f : 10 02 __ BPL $6273 ; (project.l5 + 12)
6271 : a9 ff __ LDA #$ff
6273 : 85 04 __ STA WORK + 1 
6275 : 85 44 __ STA T0 + 1 
6277 : bd 00 7e LDA $7e00,x ; (cube_v[0][0] + 0)
627a : 0a __ __ ASL
627b : 0a __ __ ASL
627c : 18 __ __ CLC
627d : 7d 00 7e ADC $7e00,x ; (cube_v[0][0] + 0)
6280 : 0a __ __ ASL
6281 : 0a __ __ ASL
6282 : 0a __ __ ASL
6283 : 0a __ __ ASL
6284 : 85 43 __ STA T0 + 0 
6286 : 85 03 __ STA WORK + 0 
6288 : a5 04 __ LDA WORK + 1 
628a : 29 80 __ AND #$80
628c : 10 02 __ BPL $6290 ; (project.l5 + 41)
628e : a9 ff __ LDA #$ff
6290 : 85 45 __ STA T0 + 2 
6292 : 85 06 __ STA WORK + 3 
6294 : 85 05 __ STA WORK + 2 
6296 : a0 00 __ LDY #$00
6298 : b1 5b __ LDA (T8 + 0),y 
629a : 85 0e __ STA P1 ; (ay + 0)
629c : 85 1b __ STA ACCU + 0 
629e : c8 __ __ INY
629f : b1 5b __ LDA (T8 + 0),y 
62a1 : 85 48 __ STA T1 + 1 
62a3 : 85 1c __ STA ACCU + 1 
62a5 : 29 80 __ AND #$80
62a7 : 10 02 __ BPL $62ab ; (project.l5 + 68)
62a9 : a9 ff __ LDA #$ff
62ab : 85 49 __ STA T1 + 2 
62ad : 85 1d __ STA ACCU + 2 
62af : 85 1e __ STA ACCU + 3 
62b1 : 20 f2 75 JSR $75f2 ; (mul32 + 0)
62b4 : a5 07 __ LDA WORK + 4 
62b6 : 85 4b __ STA T2 + 0 
62b8 : a5 08 __ LDA WORK + 5 
62ba : 85 4c __ STA T2 + 1 
62bc : a5 09 __ LDA WORK + 6 
62be : 85 4d __ STA T2 + 2 
62c0 : a5 0a __ LDA WORK + 7 
62c2 : 85 4e __ STA T2 + 3 
62c4 : a0 00 __ LDY #$00
62c6 : b1 5d __ LDA (T9 + 0),y 
62c8 : 85 4f __ STA T3 + 0 
62ca : 85 03 __ STA WORK + 0 
62cc : c8 __ __ INY
62cd : b1 5d __ LDA (T9 + 0),y 
62cf : 85 50 __ STA T3 + 1 
62d1 : 85 04 __ STA WORK + 1 
62d3 : 29 80 __ AND #$80
62d5 : 10 02 __ BPL $62d9 ; (project.l5 + 114)
62d7 : a9 ff __ LDA #$ff
62d9 : 85 51 __ STA T3 + 2 
62db : 85 06 __ STA WORK + 3 
62dd : 85 05 __ STA WORK + 2 
62df : a6 61 __ LDX T12 + 0 
62e1 : bd 02 7e LDA $7e02,x ; (cube_v[0][0] + 2)
62e4 : 29 80 __ AND #$80
62e6 : 10 02 __ BPL $62ea ; (project.l5 + 131)
62e8 : a9 ff __ LDA #$ff
62ea : 85 1c __ STA ACCU + 1 
62ec : 85 54 __ STA T4 + 1 
62ee : bd 02 7e LDA $7e02,x ; (cube_v[0][0] + 2)
62f1 : 0a __ __ ASL
62f2 : 0a __ __ ASL
62f3 : 18 __ __ CLC
62f4 : 7d 02 7e ADC $7e02,x ; (cube_v[0][0] + 2)
62f7 : 0a __ __ ASL
62f8 : 0a __ __ ASL
62f9 : 0a __ __ ASL
62fa : 0a __ __ ASL
62fb : 85 53 __ STA T4 + 0 
62fd : 85 1b __ STA ACCU + 0 
62ff : a5 1c __ LDA ACCU + 1 
6301 : 29 80 __ AND #$80
6303 : 10 02 __ BPL $6307 ; (project.l5 + 160)
6305 : a9 ff __ LDA #$ff
6307 : 85 55 __ STA T4 + 2 
6309 : 85 1d __ STA ACCU + 2 
630b : 85 1e __ STA ACCU + 3 
630d : 20 f2 75 JSR $75f2 ; (mul32 + 0)
6310 : 18 __ __ CLC
6311 : a5 07 __ LDA WORK + 4 
6313 : 65 4b __ ADC T2 + 0 
6315 : a5 08 __ LDA WORK + 5 
6317 : 65 4c __ ADC T2 + 1 
6319 : 85 4b __ STA T2 + 0 
631b : a5 09 __ LDA WORK + 6 
631d : 65 4d __ ADC T2 + 2 
631f : 85 4c __ STA T2 + 1 
6321 : a5 0a __ LDA WORK + 7 
6323 : 65 4e __ ADC T2 + 3 
6325 : 85 4e __ STA T2 + 3 
6327 : a4 47 __ LDY T1 + 0 
6329 : b1 59 __ LDA (T7 + 0),y 
632b : 85 56 __ STA T5 + 0 
632d : c8 __ __ INY
632e : b1 59 __ LDA (T7 + 0),y 
6330 : 85 57 __ STA T5 + 1 
6332 : 29 80 __ AND #$80
6334 : 10 02 __ BPL $6338 ; (project.l5 + 209)
6336 : a9 ff __ LDA #$ff
6338 : 85 58 __ STA T5 + 2 
633a : a5 53 __ LDA T4 + 0 
633c : 85 1b __ STA ACCU + 0 
633e : a5 54 __ LDA T4 + 1 
6340 : 85 1c __ STA ACCU + 1 
6342 : a5 55 __ LDA T4 + 2 
6344 : 85 1d __ STA ACCU + 2 
6346 : 85 1e __ STA ACCU + 3 
6348 : a5 0e __ LDA P1 ; (ay + 0)
634a : 85 03 __ STA WORK + 0 
634c : a5 48 __ LDA T1 + 1 
634e : 85 04 __ STA WORK + 1 
6350 : a5 49 __ LDA T1 + 2 
6352 : 85 05 __ STA WORK + 2 
6354 : 85 06 __ STA WORK + 3 
6356 : 20 f2 75 JSR $75f2 ; (mul32 + 0)
6359 : a5 07 __ LDA WORK + 4 
635b : 85 0e __ STA P1 ; (ay + 0)
635d : a5 08 __ LDA WORK + 5 
635f : 85 48 __ STA T1 + 1 
6361 : a5 09 __ LDA WORK + 6 
6363 : 85 49 __ STA T1 + 2 
6365 : a5 0a __ LDA WORK + 7 
6367 : 85 4a __ STA T1 + 3 
6369 : 38 __ __ SEC
636a : a9 00 __ LDA #$00
636c : e5 4f __ SBC T3 + 0 
636e : 85 1b __ STA ACCU + 0 
6370 : a9 00 __ LDA #$00
6372 : e5 50 __ SBC T3 + 1 
6374 : 85 1c __ STA ACCU + 1 
6376 : a9 00 __ LDA #$00
6378 : e5 51 __ SBC T3 + 2 
637a : 85 1d __ STA ACCU + 2 
637c : a9 00 __ LDA #$00
637e : e5 51 __ SBC T3 + 2 
6380 : 85 1e __ STA ACCU + 3 
6382 : a5 43 __ LDA T0 + 0 
6384 : 85 03 __ STA WORK + 0 
6386 : a5 44 __ LDA T0 + 1 
6388 : 85 04 __ STA WORK + 1 
638a : a5 45 __ LDA T0 + 2 
638c : 85 05 __ STA WORK + 2 
638e : 85 06 __ STA WORK + 3 
6390 : 20 f2 75 JSR $75f2 ; (mul32 + 0)
6393 : 18 __ __ CLC
6394 : a5 07 __ LDA WORK + 4 
6396 : 65 0e __ ADC P1 ; (ay + 0)
6398 : a5 08 __ LDA WORK + 5 
639a : 65 48 __ ADC T1 + 1 
639c : 85 43 __ STA T0 + 0 
639e : a5 09 __ LDA WORK + 6 
63a0 : 65 49 __ ADC T1 + 2 
63a2 : 85 44 __ STA T0 + 1 
63a4 : a5 0a __ LDA WORK + 7 
63a6 : 65 4a __ ADC T1 + 3 
63a8 : 4a __ __ LSR
63a9 : 66 44 __ ROR T0 + 1 
63ab : 66 43 __ ROR T0 + 0 
63ad : 4a __ __ LSR
63ae : 66 44 __ ROR T0 + 1 
63b0 : 66 43 __ ROR T0 + 0 
63b2 : 4a __ __ LSR
63b3 : 66 44 __ ROR T0 + 1 
63b5 : 66 43 __ ROR T0 + 0 
63b7 : 4a __ __ LSR
63b8 : 66 44 __ ROR T0 + 1 
63ba : 66 43 __ ROR T0 + 0 
63bc : a5 44 __ LDA T0 + 1 
63be : 85 1c __ STA ACCU + 1 
63c0 : 29 80 __ AND #$80
63c2 : 10 02 __ BPL $63c6 ; (project.l5 + 351)
63c4 : a9 ff __ LDA #$ff
63c6 : 85 45 __ STA T0 + 2 
63c8 : 85 1e __ STA ACCU + 3 
63ca : 85 1d __ STA ACCU + 2 
63cc : a5 43 __ LDA T0 + 0 
63ce : 85 1b __ STA ACCU + 0 
63d0 : a5 56 __ LDA T5 + 0 
63d2 : 85 03 __ STA WORK + 0 
63d4 : a5 57 __ LDA T5 + 1 
63d6 : 85 04 __ STA WORK + 1 
63d8 : a5 58 __ LDA T5 + 2 
63da : 85 05 __ STA WORK + 2 
63dc : 85 06 __ STA WORK + 3 
63de : 20 f2 75 JSR $75f2 ; (mul32 + 0)
63e1 : a5 07 __ LDA WORK + 4 
63e3 : 85 0e __ STA P1 ; (ay + 0)
63e5 : a5 08 __ LDA WORK + 5 
63e7 : 85 48 __ STA T1 + 1 
63e9 : a5 09 __ LDA WORK + 6 
63eb : 85 49 __ STA T1 + 2 
63ed : a5 0a __ LDA WORK + 7 
63ef : 85 4a __ STA T1 + 3 
63f1 : a6 61 __ LDX T12 + 0 
63f3 : bd 01 7e LDA $7e01,x ; (cube_v[0][0] + 1)
63f6 : 29 80 __ AND #$80
63f8 : 10 02 __ BPL $63fc ; (project.l5 + 405)
63fa : a9 ff __ LDA #$ff
63fc : 85 04 __ STA WORK + 1 
63fe : 85 50 __ STA T3 + 1 
6400 : bd 01 7e LDA $7e01,x ; (cube_v[0][0] + 1)
6403 : 0a __ __ ASL
6404 : 0a __ __ ASL
6405 : 18 __ __ CLC
6406 : 7d 01 7e ADC $7e01,x ; (cube_v[0][0] + 1)
6409 : 0a __ __ ASL
640a : 0a __ __ ASL
640b : 0a __ __ ASL
640c : 0a __ __ ASL
640d : 85 4f __ STA T3 + 0 
640f : 85 03 __ STA WORK + 0 
6411 : a5 04 __ LDA WORK + 1 
6413 : 29 80 __ AND #$80
6415 : 10 02 __ BPL $6419 ; (project.l5 + 434)
6417 : a9 ff __ LDA #$ff
6419 : 85 51 __ STA T3 + 2 
641b : 85 06 __ STA WORK + 3 
641d : 85 05 __ STA WORK + 2 
641f : a0 00 __ LDY #$00
6421 : b1 5f __ LDA (T10 + 0),y 
6423 : 85 53 __ STA T4 + 0 
6425 : 85 1b __ STA ACCU + 0 
6427 : c8 __ __ INY
6428 : b1 5f __ LDA (T10 + 0),y 
642a : 85 54 __ STA T4 + 1 
642c : 85 1c __ STA ACCU + 1 
642e : 29 80 __ AND #$80
6430 : 10 02 __ BPL $6434 ; (project.l5 + 461)
6432 : a9 ff __ LDA #$ff
6434 : 85 55 __ STA T4 + 2 
6436 : 85 1d __ STA ACCU + 2 
6438 : 85 1e __ STA ACCU + 3 
643a : 20 f2 75 JSR $75f2 ; (mul32 + 0)
643d : 38 __ __ SEC
643e : a5 07 __ LDA WORK + 4 
6440 : e5 0e __ SBC P1 ; (ay + 0)
6442 : a5 08 __ LDA WORK + 5 
6444 : e5 48 __ SBC T1 + 1 
6446 : 85 0e __ STA P1 ; (ay + 0)
6448 : a5 09 __ LDA WORK + 6 
644a : e5 49 __ SBC T1 + 2 
644c : 85 48 __ STA T1 + 1 
644e : a5 0a __ LDA WORK + 7 
6450 : e5 4a __ SBC T1 + 3 
6452 : 85 4a __ STA T1 + 3 
6454 : a5 53 __ LDA T4 + 0 
6456 : 85 1b __ STA ACCU + 0 
6458 : a5 54 __ LDA T4 + 1 
645a : 85 1c __ STA ACCU + 1 
645c : a5 55 __ LDA T4 + 2 
645e : 85 1d __ STA ACCU + 2 
6460 : 85 1e __ STA ACCU + 3 
6462 : a5 43 __ LDA T0 + 0 
6464 : 85 03 __ STA WORK + 0 
6466 : a5 44 __ LDA T0 + 1 
6468 : 85 04 __ STA WORK + 1 
646a : a5 45 __ LDA T0 + 2 
646c : 85 05 __ STA WORK + 2 
646e : 85 06 __ STA WORK + 3 
6470 : 20 f2 75 JSR $75f2 ; (mul32 + 0)
6473 : a5 07 __ LDA WORK + 4 
6475 : 85 43 __ STA T0 + 0 
6477 : a5 08 __ LDA WORK + 5 
6479 : 85 44 __ STA T0 + 1 
647b : a5 09 __ LDA WORK + 6 
647d : 85 45 __ STA T0 + 2 
647f : a5 0a __ LDA WORK + 7 
6481 : 85 46 __ STA T0 + 3 
6483 : a5 56 __ LDA T5 + 0 
6485 : 85 1b __ STA ACCU + 0 
6487 : a5 57 __ LDA T5 + 1 
6489 : 85 1c __ STA ACCU + 1 
648b : a5 58 __ LDA T5 + 2 
648d : 85 1d __ STA ACCU + 2 
648f : 85 1e __ STA ACCU + 3 
6491 : a5 4f __ LDA T3 + 0 
6493 : 85 03 __ STA WORK + 0 
6495 : a5 50 __ LDA T3 + 1 
6497 : 85 04 __ STA WORK + 1 
6499 : a5 51 __ LDA T3 + 2 
649b : 85 05 __ STA WORK + 2 
649d : 85 06 __ STA WORK + 3 
649f : 20 f2 75 JSR $75f2 ; (mul32 + 0)
64a2 : 18 __ __ CLC
64a3 : a5 07 __ LDA WORK + 4 
64a5 : 65 43 __ ADC T0 + 0 
64a7 : a5 08 __ LDA WORK + 5 
64a9 : 65 44 __ ADC T0 + 1 
64ab : 85 43 __ STA T0 + 0 
64ad : a5 09 __ LDA WORK + 6 
64af : 65 45 __ ADC T0 + 2 
64b1 : 85 44 __ STA T0 + 1 
64b3 : a5 0a __ LDA WORK + 7 
64b5 : 65 46 __ ADC T0 + 3 
64b7 : 4a __ __ LSR
64b8 : 66 44 __ ROR T0 + 1 
64ba : 66 43 __ ROR T0 + 0 
64bc : 4a __ __ LSR
64bd : 66 44 __ ROR T0 + 1 
64bf : 66 43 __ ROR T0 + 0 
64c1 : 4a __ __ LSR
64c2 : 66 44 __ ROR T0 + 1 
64c4 : 66 43 __ ROR T0 + 0 
64c6 : 4a __ __ LSR
64c7 : 66 44 __ ROR T0 + 1 
64c9 : 66 43 __ ROR T0 + 0 
64cb : 18 __ __ CLC
64cc : a5 43 __ LDA T0 + 0 
64ce : 69 18 __ ADC #$18
64d0 : 85 4f __ STA T3 + 0 
64d2 : a5 44 __ LDA T0 + 1 
64d4 : 69 01 __ ADC #$01
64d6 : 85 50 __ STA T3 + 1 
64d8 : a5 44 __ LDA T0 + 1 
64da : 49 80 __ EOR #$80
64dc : c9 7e __ CMP #$7e
64de : d0 04 __ BNE $64e4 ; (project.s9 + 0)
.s8:
64e0 : a5 43 __ LDA T0 + 0 
64e2 : c9 e9 __ CMP #$e9
.s9:
64e4 : b0 08 __ BCS $64ee ; (project.s6 + 0)
.s7:
64e6 : a9 01 __ LDA #$01
64e8 : 85 4f __ STA T3 + 0 
64ea : a9 00 __ LDA #$00
64ec : 85 50 __ STA T3 + 1 
.s6:
64ee : a5 4e __ LDA T2 + 3 
64f0 : 4a __ __ LSR
64f1 : 66 4c __ ROR T2 + 1 
64f3 : 66 4b __ ROR T2 + 0 
64f5 : 4a __ __ LSR
64f6 : 66 4c __ ROR T2 + 1 
64f8 : 66 4b __ ROR T2 + 0 
64fa : 4a __ __ LSR
64fb : 66 4c __ ROR T2 + 1 
64fd : 66 4b __ ROR T2 + 0 
64ff : 4a __ __ LSR
6500 : 66 4c __ ROR T2 + 1 
6502 : 66 4b __ ROR T2 + 0 
6504 : a5 4b __ LDA T2 + 0 
6506 : 0a __ __ ASL
6507 : a8 __ __ TAY
6508 : a5 4c __ LDA T2 + 1 
650a : 2a __ __ ROL
650b : aa __ __ TAX
650c : 98 __ __ TYA
650d : 18 __ __ CLC
650e : 65 4b __ ADC T2 + 0 
6510 : a8 __ __ TAY
6511 : 8a __ __ TXA
6512 : 65 4c __ ADC T2 + 1 
6514 : 85 1b __ STA ACCU + 0 
6516 : 98 __ __ TYA
6517 : 0a __ __ ASL
6518 : 26 1b __ ROL ACCU + 0 
651a : 0a __ __ ASL
651b : 26 1b __ ROL ACCU + 0 
651d : 0a __ __ ASL
651e : 26 1b __ ROL ACCU + 0 
6520 : 18 __ __ CLC
6521 : 65 4b __ ADC T2 + 0 
6523 : 85 4b __ STA T2 + 0 
6525 : a5 1b __ LDA ACCU + 0 
6527 : 65 4c __ ADC T2 + 1 
6529 : 06 4b __ ASL T2 + 0 
652b : 2a __ __ ROL
652c : 06 4b __ ASL T2 + 0 
652e : 2a __ __ ROL
652f : 06 4b __ ASL T2 + 0 
6531 : 2a __ __ ROL
6532 : 85 1c __ STA ACCU + 1 
6534 : a5 4b __ LDA T2 + 0 
6536 : 85 1b __ STA ACCU + 0 
6538 : 20 2a 79 JSR $792a ; (divs16@proxy + 0)
653b : 18 __ __ CLC
653c : a5 1b __ LDA ACCU + 0 
653e : 69 a0 __ ADC #$a0
6540 : a8 __ __ TAY
6541 : a5 1c __ LDA ACCU + 1 
6543 : 69 00 __ ADC #$00
6545 : 85 44 __ STA T0 + 1 
6547 : a5 52 __ LDA T11 + 0 
6549 : 0a __ __ ASL
654a : 85 4b __ STA T2 + 0 
654c : aa __ __ TAX
654d : 98 __ __ TYA
654e : 9d ee 83 STA $83ee,x ; (px_cur[0] + 0)
6551 : a5 44 __ LDA T0 + 1 
6553 : 9d ef 83 STA $83ef,x ; (px_cur[0] + 1)
6556 : a5 4a __ LDA T1 + 3 
6558 : 4a __ __ LSR
6559 : 66 48 __ ROR T1 + 1 
655b : 66 0e __ ROR P1 ; (ay + 0)
655d : 4a __ __ LSR
655e : 66 48 __ ROR T1 + 1 
6560 : 66 0e __ ROR P1 ; (ay + 0)
6562 : 4a __ __ LSR
6563 : 66 48 __ ROR T1 + 1 
6565 : 66 0e __ ROR P1 ; (ay + 0)
6567 : 4a __ __ LSR
6568 : 66 48 __ ROR T1 + 1 
656a : 66 0e __ ROR P1 ; (ay + 0)
656c : a5 0e __ LDA P1 ; (ay + 0)
656e : 0a __ __ ASL
656f : a8 __ __ TAY
6570 : a5 48 __ LDA T1 + 1 
6572 : 2a __ __ ROL
6573 : aa __ __ TAX
6574 : 98 __ __ TYA
6575 : 18 __ __ CLC
6576 : 65 0e __ ADC P1 ; (ay + 0)
6578 : a8 __ __ TAY
6579 : 8a __ __ TXA
657a : 65 48 __ ADC T1 + 1 
657c : 85 1b __ STA ACCU + 0 
657e : 98 __ __ TYA
657f : 0a __ __ ASL
6580 : 26 1b __ ROL ACCU + 0 
6582 : 0a __ __ ASL
6583 : 26 1b __ ROL ACCU + 0 
6585 : 0a __ __ ASL
6586 : 26 1b __ ROL ACCU + 0 
6588 : 18 __ __ CLC
6589 : 65 0e __ ADC P1 ; (ay + 0)
658b : 85 0e __ STA P1 ; (ay + 0)
658d : a5 1b __ LDA ACCU + 0 
658f : 65 48 __ ADC T1 + 1 
6591 : 06 0e __ ASL P1 ; (ay + 0)
6593 : 2a __ __ ROL
6594 : 06 0e __ ASL P1 ; (ay + 0)
6596 : 2a __ __ ROL
6597 : 06 0e __ ASL P1 ; (ay + 0)
6599 : 2a __ __ ROL
659a : 85 1c __ STA ACCU + 1 
659c : a5 0e __ LDA P1 ; (ay + 0)
659e : 85 1b __ STA ACCU + 0 
65a0 : 20 2a 79 JSR $792a ; (divs16@proxy + 0)
65a3 : 18 __ __ CLC
65a4 : a5 1b __ LDA ACCU + 0 
65a6 : 69 64 __ ADC #$64
65a8 : a6 4b __ LDX T2 + 0 
65aa : 9d de 83 STA $83de,x ; (py_cur[0] + 0)
65ad : a5 1c __ LDA ACCU + 1 
65af : 69 00 __ ADC #$00
65b1 : 9d df 83 STA $83df,x ; (py_cur[0] + 1)
65b4 : e6 52 __ INC T11 + 0 
65b6 : 18 __ __ CLC
65b7 : a5 61 __ LDA T12 + 0 
65b9 : 69 03 __ ADC #$03
65bb : c9 18 __ CMP #$18
65bd : f0 03 __ BEQ $65c2 ; (project.s3 + 0)
65bf : 4c 67 62 JMP $6267 ; (project.l5 + 0)
.s3:
65c2 : a2 0e __ LDX #$0e
65c4 : bd d2 bf LDA $bfd2,x ; (project@stack + 0)
65c7 : 95 53 __ STA T4 + 0,x 
65c9 : ca __ __ DEX
65ca : 10 f8 __ BPL $65c4 ; (project.s3 + 2)
65cc : 60 __ __ RTS
--------------------------------------------------------------------
plasma_run: ; plasma_run()->void
;   3, "/home/xahmol/git/UltimateDemo2026/src/plasma.h"
.s1:
65cd : a2 04 __ LDX #$04
65cf : b5 53 __ LDA T1 + 0,x 
65d1 : 9d e2 bf STA $bfe2,x ; (plasma_run@stack + 0)
65d4 : ca __ __ DEX
65d5 : 10 f8 __ BPL $65cf ; (plasma_run.s1 + 2)
.s4:
65d7 : 20 ac 66 JSR $66ac ; (plasma_init.s4 + 0)
65da : a9 00 __ LDA #$00
65dc : 85 53 __ STA T1 + 0 
65de : 85 54 __ STA T2 + 0 
65e0 : 85 55 __ STA T3 + 0 
65e2 : a9 a2 __ LDA #$a2
65e4 : 85 56 __ STA T4 + 0 
65e6 : a9 fe __ LDA #$fe
65e8 : 85 57 __ STA T4 + 1 
.l5:
65ea : a5 53 __ LDA T1 + 0 
65ec : 85 0d __ STA P0 
65ee : 20 00 67 JSR $6700 ; (plasma_frame@proxy + 0)
.l6:
65f1 : 2c 11 d0 BIT $d011 
65f4 : 30 fb __ BMI $65f1 ; (plasma_run.l6 + 0)
.l7:
65f6 : 2c 11 d0 BIT $d011 
65f9 : 10 fb __ BPL $65f6 ; (plasma_run.l7 + 0)
.s8:
65fb : e6 55 __ INC T3 + 0 
65fd : e6 54 __ INC T2 + 0 
65ff : e6 54 __ INC T2 + 0 
6601 : e6 53 __ INC T1 + 0 
6603 : e6 56 __ INC T4 + 0 
6605 : d0 e3 __ BNE $65ea ; (plasma_run.l5 + 0)
.s19:
6607 : e6 57 __ INC T4 + 1 
6609 : d0 df __ BNE $65ea ; (plasma_run.l5 + 0)
.s9:
660b : a9 00 __ LDA #$00
660d : 85 43 __ STA T0 + 0 
660f : 85 1f __ STA ADDR + 0 
6611 : a9 c0 __ LDA #$c0
6613 : 85 44 __ STA T0 + 1 
6615 : d0 02 __ BNE $6619 ; (plasma_run.l18 + 0)
.s21:
6617 : e6 44 __ INC T0 + 1 
.l18:
6619 : a9 82 __ LDA #$82
661b : a0 00 __ LDY #$00
661d : 91 43 __ STA (T0 + 0),y 
661f : 18 __ __ CLC
6620 : a5 44 __ LDA T0 + 1 
6622 : 69 18 __ ADC #$18
6624 : 85 20 __ STA ADDR + 1 
6626 : a9 07 __ LDA #$07
6628 : a4 43 __ LDY T0 + 0 
662a : 91 1f __ STA (ADDR + 0),y 
662c : 98 __ __ TYA
662d : 18 __ __ CLC
662e : 69 01 __ ADC #$01
6630 : 85 43 __ STA T0 + 0 
6632 : b0 e3 __ BCS $6617 ; (plasma_run.s21 + 0)
.s22:
6634 : c9 e8 __ CMP #$e8
6636 : d0 e1 __ BNE $6619 ; (plasma_run.l18 + 0)
.s17:
6638 : a5 44 __ LDA T0 + 1 
663a : c9 c3 __ CMP #$c3
663c : d0 db __ BNE $6619 ; (plasma_run.l18 + 0)
.s10:
663e : a9 00 __ LDA #$00
6640 : 8d 21 d0 STA $d021 
6643 : a9 a2 __ LDA #$a2
6645 : 85 56 __ STA T4 + 0 
6647 : a9 fe __ LDA #$fe
6649 : 85 57 __ STA T4 + 1 
664b : a5 53 __ LDA T1 + 0 
.l11:
664d : 85 0d __ STA P0 
664f : 20 00 67 JSR $6700 ; (plasma_frame@proxy + 0)
.l12:
6652 : 2c 11 d0 BIT $d011 
6655 : 30 fb __ BMI $6652 ; (plasma_run.l12 + 0)
.l13:
6657 : 2c 11 d0 BIT $d011 
665a : 10 fb __ BPL $6657 ; (plasma_run.l13 + 0)
.s14:
665c : 18 __ __ CLC
665d : a5 0f __ LDA P2 
665f : 69 02 __ ADC #$02
6661 : 85 55 __ STA T3 + 0 
6663 : 18 __ __ CLC
6664 : a5 54 __ LDA T2 + 0 
6666 : 69 03 __ ADC #$03
6668 : 85 54 __ STA T2 + 0 
666a : 18 __ __ CLC
666b : a5 0d __ LDA P0 
666d : 69 02 __ ADC #$02
666f : e6 56 __ INC T4 + 0 
6671 : d0 da __ BNE $664d ; (plasma_run.l11 + 0)
.s20:
6673 : e6 57 __ INC T4 + 1 
6675 : d0 d6 __ BNE $664d ; (plasma_run.l11 + 0)
.s15:
6677 : a9 00 __ LDA #$00
6679 : 85 0d __ STA P0 
667b : 85 0e __ STA P1 
667d : 85 10 __ STA P3 
667f : a9 36 __ LDA #$36
6681 : 85 01 __ STA $01 
6683 : 20 0c 0f JSR $0f0c ; (vic_setmode@proxy + 0)
6686 : a9 00 __ LDA #$00
6688 : 8d 20 d0 STA $d020 
668b : 8d 21 d0 STA $d021 
668e : a9 20 __ LDA #$20
6690 : a2 fa __ LDX #$fa
.l16:
6692 : ca __ __ DEX
6693 : 9d 00 04 STA $0400,x 
6696 : 9d fa 04 STA $04fa,x 
6699 : 9d f4 05 STA $05f4,x 
669c : 9d ee 06 STA $06ee,x 
669f : d0 f1 __ BNE $6692 ; (plasma_run.l16 + 0)
.s3:
66a1 : a2 04 __ LDX #$04
66a3 : bd e2 bf LDA $bfe2,x ; (plasma_run@stack + 0)
66a6 : 95 53 __ STA T1 + 0,x 
66a8 : ca __ __ DEX
66a9 : 10 f8 __ BPL $66a3 ; (plasma_run.s3 + 2)
66ab : 60 __ __ RTS
--------------------------------------------------------------------
plasma_init: ; plasma_init()->void
;  38, "/home/xahmol/git/UltimateDemo2026/src/plasma.c"
.s4:
66ac : a9 00 __ LDA #$00
66ae : 85 0f __ STA P2 
66b0 : 85 10 __ STA P3 
66b2 : 85 43 __ STA T0 + 0 
66b4 : 85 0d __ STA P0 
66b6 : a9 35 __ LDA #$35
66b8 : 85 01 __ STA $01 
66ba : 20 1b 79 JSR $791b ; (memset@proxy + 0)
66bd : a9 c0 __ LDA #$c0
66bf : 85 44 __ STA T0 + 1 
66c1 : a9 00 __ LDA #$00
66c3 : 85 1f __ STA ADDR + 0 
66c5 : f0 02 __ BEQ $66c9 ; (plasma_init.l7 + 0)
.s8:
66c7 : e6 44 __ INC T0 + 1 
.l7:
66c9 : a9 34 __ LDA #$34
66cb : a0 00 __ LDY #$00
66cd : 91 43 __ STA (T0 + 0),y 
66cf : 18 __ __ CLC
66d0 : a5 44 __ LDA T0 + 1 
66d2 : 69 18 __ ADC #$18
66d4 : 85 20 __ STA ADDR + 1 
66d6 : a9 07 __ LDA #$07
66d8 : a4 43 __ LDY T0 + 0 
66da : 91 1f __ STA (ADDR + 0),y 
66dc : 98 __ __ TYA
66dd : 18 __ __ CLC
66de : 69 01 __ ADC #$01
66e0 : 85 43 __ STA T0 + 0 
66e2 : b0 e3 __ BCS $66c7 ; (plasma_init.s8 + 0)
.s9:
66e4 : c9 e8 __ CMP #$e8
66e6 : d0 e1 __ BNE $66c9 ; (plasma_init.l7 + 0)
.s6:
66e8 : a5 44 __ LDA T0 + 1 
66ea : c9 c3 __ CMP #$c3
66ec : d0 db __ BNE $66c9 ; (plasma_init.l7 + 0)
.s5:
66ee : a9 00 __ LDA #$00
66f0 : 85 0e __ STA P1 
66f2 : 85 10 __ STA P3 
66f4 : 20 7b 79 JSR $797b ; (vic_setmode@proxy + 0)
66f7 : a9 00 __ LDA #$00
66f9 : 8d 21 d0 STA $d021 
66fc : 8d 20 d0 STA $d020 
.s3:
66ff : 60 __ __ RTS
--------------------------------------------------------------------
plasma_frame@proxy: ; plasma_frame@proxy
6700 : a5 54 __ LDA $54 
6702 : 85 0e __ STA P1 
6704 : a5 55 __ LDA $55 
6706 : 85 0f __ STA P2 
--------------------------------------------------------------------
plasma_frame: ; plasma_frame(u8,u8,u8)->void
;  69, "/home/xahmol/git/UltimateDemo2026/src/plasma.c"
.s4:
6708 : a2 00 __ LDX #$00
.l8:
670a : a5 0e __ LDA P1 ; (t2 + 0)
670c : 29 3f __ AND #$3f
670e : a8 __ __ TAY
670f : b9 38 80 LDA $8038,y ; (sin_lut[0] + 0)
6712 : 9d 20 9e STA $9e20,x ; (row_sin[0] + 0)
6715 : e6 0e __ INC P1 ; (t2 + 0)
6717 : e8 __ __ INX
6718 : e0 c8 __ CPX #$c8
671a : d0 ee __ BNE $670a ; (plasma_frame.l8 + 0)
.s9:
671c : a5 0d __ LDA P0 ; (t1 + 0)
671e : 85 0e __ STA P1 ; (t2 + 0)
6720 : a9 00 __ LDA #$00
6722 : 85 1b __ STA ACCU + 0 
.l5:
6724 : 85 4b __ STA T10 + 0 
6726 : 29 07 __ AND #$07
6728 : 85 43 __ STA T3 + 0 
672a : a5 1b __ LDA ACCU + 0 
672c : 29 f8 __ AND #$f8
672e : 85 45 __ STA T4 + 0 
6730 : 4a __ __ LSR
6731 : 4a __ __ LSR
6732 : 65 45 __ ADC T4 + 0 
6734 : 4a __ __ LSR
6735 : 6a __ __ ROR
6736 : 6a __ __ ROR
6737 : aa __ __ TAX
6738 : 29 c0 __ AND #$c0
673a : 6a __ __ ROR
673b : 05 43 __ ORA T3 + 0 
673d : 85 45 __ STA T4 + 0 
673f : 8a __ __ TXA
6740 : 29 1f __ AND #$1f
6742 : 09 e0 __ ORA #$e0
6744 : 85 46 __ STA T4 + 1 
6746 : a5 1b __ LDA ACCU + 0 
6748 : 69 03 __ ADC #$03
674a : 85 43 __ STA T3 + 0 
674c : a5 0e __ LDA P1 ; (t2 + 0)
674e : 85 4d __ STA T11 + 0 
6750 : 18 __ __ CLC
6751 : 69 03 __ ADC #$03
6753 : 85 1c __ STA ACCU + 1 
6755 : a5 1b __ LDA ACCU + 0 
6757 : aa __ __ TAX
6758 : e8 __ __ INX
6759 : 86 49 __ STX T8 + 0 
675b : 18 __ __ CLC
675c : 69 02 __ ADC #$02
675e : 85 47 __ STA T6 + 0 
6760 : a9 00 __ LDA #$00
6762 : 85 44 __ STA T3 + 1 
6764 : 85 48 __ STA T6 + 1 
6766 : 18 __ __ CLC
6767 : a5 0e __ LDA P1 ; (t2 + 0)
6769 : 69 02 __ ADC #$02
676b : 85 1d __ STA ACCU + 2 
676d : 18 __ __ CLC
676e : 69 ff __ ADC #$ff
6770 : 85 1e __ STA ACCU + 3 
6772 : a9 00 __ LDA #$00
6774 : 85 4a __ STA T8 + 1 
6776 : 85 4c __ STA T10 + 1 
6778 : bd 1f 9e LDA $9e1f,x ; (tbuffer[0] + 319)
677b : 85 4e __ STA T12 + 0 
677d : a9 28 __ LDA #$28
677f : 85 51 __ STA T16 + 0 
6781 : a0 00 __ LDY #$00
6783 : 18 __ __ CLC
.l7:
6784 : a5 4d __ LDA T11 + 0 
6786 : 29 3f __ AND #$3f
6788 : aa __ __ TAX
6789 : bd 38 80 LDA $8038,x ; (sin_lut[0] + 0)
678c : 65 4e __ ADC T12 + 0 
678e : 85 4f __ STA T13 + 0 
6790 : a5 4c __ LDA T10 + 1 
6792 : 4a __ __ LSR
6793 : a5 4b __ LDA T10 + 0 
6795 : 6a __ __ ROR
6796 : 18 __ __ CLC
6797 : 65 0f __ ADC P2 ; (t3 + 0)
6799 : 29 3f __ AND #$3f
679b : aa __ __ TAX
679c : bd 38 80 LDA $8038,x ; (sin_lut[0] + 0)
679f : 18 __ __ CLC
67a0 : 65 4f __ ADC T13 + 0 
67a2 : aa __ __ TAX
67a3 : bd 78 80 LDA $8078,x ; (sum_to_col[0] + 0)
67a6 : 4a __ __ LSR
67a7 : 6a __ __ ROR
67a8 : 6a __ __ ROR
67a9 : 85 4f __ STA T13 + 0 
67ab : a5 1e __ LDA ACCU + 3 
67ad : 29 3f __ AND #$3f
67af : aa __ __ TAX
67b0 : bd 38 80 LDA $8038,x ; (sin_lut[0] + 0)
67b3 : 65 4e __ ADC T12 + 0 
67b5 : 85 50 __ STA T14 + 0 
67b7 : a5 4a __ LDA T8 + 1 
67b9 : 4a __ __ LSR
67ba : a5 49 __ LDA T8 + 0 
67bc : 6a __ __ ROR
67bd : 18 __ __ CLC
67be : 65 0f __ ADC P2 ; (t3 + 0)
67c0 : 29 3f __ AND #$3f
67c2 : aa __ __ TAX
67c3 : bd 38 80 LDA $8038,x ; (sin_lut[0] + 0)
67c6 : 18 __ __ CLC
67c7 : 65 50 __ ADC T14 + 0 
67c9 : aa __ __ TAX
67ca : bd 78 80 LDA $8078,x ; (sum_to_col[0] + 0)
67cd : 0a __ __ ASL
67ce : 0a __ __ ASL
67cf : 0a __ __ ASL
67d0 : 0a __ __ ASL
67d1 : 05 4f __ ORA T13 + 0 
67d3 : 85 4f __ STA T13 + 0 
67d5 : a5 1d __ LDA ACCU + 2 
67d7 : 29 3f __ AND #$3f
67d9 : aa __ __ TAX
67da : bd 38 80 LDA $8038,x ; (sin_lut[0] + 0)
67dd : 65 4e __ ADC T12 + 0 
67df : 85 50 __ STA T14 + 0 
67e1 : a5 48 __ LDA T6 + 1 
67e3 : 4a __ __ LSR
67e4 : a5 47 __ LDA T6 + 0 
67e6 : 6a __ __ ROR
67e7 : 18 __ __ CLC
67e8 : 65 0f __ ADC P2 ; (t3 + 0)
67ea : 29 3f __ AND #$3f
67ec : aa __ __ TAX
67ed : bd 38 80 LDA $8038,x ; (sin_lut[0] + 0)
67f0 : 18 __ __ CLC
67f1 : 65 50 __ ADC T14 + 0 
67f3 : aa __ __ TAX
67f4 : bd 78 80 LDA $8078,x ; (sum_to_col[0] + 0)
67f7 : 0a __ __ ASL
67f8 : 0a __ __ ASL
67f9 : 05 4f __ ORA T13 + 0 
67fb : 85 4f __ STA T13 + 0 
67fd : a5 1c __ LDA ACCU + 1 
67ff : 29 3f __ AND #$3f
6801 : aa __ __ TAX
6802 : bd 38 80 LDA $8038,x ; (sin_lut[0] + 0)
6805 : 65 4e __ ADC T12 + 0 
6807 : 85 50 __ STA T14 + 0 
6809 : a5 44 __ LDA T3 + 1 
680b : 4a __ __ LSR
680c : a5 43 __ LDA T3 + 0 
680e : 6a __ __ ROR
680f : 18 __ __ CLC
6810 : 65 0f __ ADC P2 ; (t3 + 0)
6812 : 29 3f __ AND #$3f
6814 : aa __ __ TAX
6815 : bd 38 80 LDA $8038,x ; (sin_lut[0] + 0)
6818 : 18 __ __ CLC
6819 : 65 50 __ ADC T14 + 0 
681b : aa __ __ TAX
681c : bd 78 80 LDA $8078,x ; (sum_to_col[0] + 0)
681f : 05 4f __ ORA T13 + 0 
6821 : 91 45 __ STA (T4 + 0),y 
6823 : 18 __ __ CLC
6824 : a5 43 __ LDA T3 + 0 
6826 : 69 04 __ ADC #$04
6828 : 85 43 __ STA T3 + 0 
682a : 90 03 __ BCC $682f ; (plasma_frame.s11 + 0)
.s10:
682c : e6 44 __ INC T3 + 1 
682e : 18 __ __ CLC
.s11:
682f : a5 1c __ LDA ACCU + 1 
6831 : 69 04 __ ADC #$04
6833 : 85 1c __ STA ACCU + 1 
6835 : 18 __ __ CLC
6836 : a5 47 __ LDA T6 + 0 
6838 : 69 04 __ ADC #$04
683a : 85 47 __ STA T6 + 0 
683c : 90 03 __ BCC $6841 ; (plasma_frame.s13 + 0)
.s12:
683e : e6 48 __ INC T6 + 1 
6840 : 18 __ __ CLC
.s13:
6841 : a5 1d __ LDA ACCU + 2 
6843 : 69 04 __ ADC #$04
6845 : 85 1d __ STA ACCU + 2 
6847 : 18 __ __ CLC
6848 : a5 49 __ LDA T8 + 0 
684a : 69 04 __ ADC #$04
684c : 85 49 __ STA T8 + 0 
684e : 90 03 __ BCC $6853 ; (plasma_frame.s15 + 0)
.s14:
6850 : e6 4a __ INC T8 + 1 
6852 : 18 __ __ CLC
.s15:
6853 : a5 1e __ LDA ACCU + 3 
6855 : 69 04 __ ADC #$04
6857 : 85 1e __ STA ACCU + 3 
6859 : 18 __ __ CLC
685a : a5 4b __ LDA T10 + 0 
685c : 69 04 __ ADC #$04
685e : 85 4b __ STA T10 + 0 
6860 : 90 03 __ BCC $6865 ; (plasma_frame.s17 + 0)
.s16:
6862 : e6 4c __ INC T10 + 1 
6864 : 18 __ __ CLC
.s17:
6865 : a5 4d __ LDA T11 + 0 
6867 : 69 04 __ ADC #$04
6869 : 85 4d __ STA T11 + 0 
686b : 98 __ __ TYA
686c : 18 __ __ CLC
686d : 69 08 __ ADC #$08
686f : a8 __ __ TAY
6870 : 90 03 __ BCC $6875 ; (plasma_frame.s19 + 0)
.s18:
6872 : e6 46 __ INC T4 + 1 
6874 : 18 __ __ CLC
.s19:
6875 : c6 51 __ DEC T16 + 0 
6877 : f0 03 __ BEQ $687c ; (plasma_frame.s6 + 0)
6879 : 4c 84 67 JMP $6784 ; (plasma_frame.l7 + 0)
.s6:
687c : e6 1b __ INC ACCU + 0 
687e : a5 1b __ LDA ACCU + 0 
6880 : c9 c8 __ CMP #$c8
6882 : f0 03 __ BEQ $6887 ; (plasma_frame.s3 + 0)
6884 : 4c 24 67 JMP $6724 ; (plasma_frame.l5 + 0)
.s3:
6887 : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_run: ; tunnel_run()->void
;   6, "/home/xahmol/git/UltimateDemo2026/src/tunnel.h"
.s1:
6888 : a2 06 __ LDX #$06
688a : b5 53 __ LDA T1 + 0,x 
688c : 9d df bf STA $bfdf,x ; (tunnel_run@stack + 0)
688f : ca __ __ DEX
6890 : 10 f8 __ BPL $688a ; (tunnel_run.s1 + 2)
.s4:
6892 : a9 8f __ LDA #$8f
6894 : 20 f3 15 JSR $15f3 ; (turbo_set.s4 + 0)
6897 : 20 5c 69 JSR $695c ; (tunnel_build_tables.s4 + 0)
689a : 20 a1 6b JSR $6ba1 ; (tunnel_build_tex.s4 + 0)
689d : 20 21 6c JSR $6c21 ; (tun_init.s4 + 0)
68a0 : a9 00 __ LDA #$00
68a2 : 85 55 __ STA T4 + 0 
68a4 : 85 56 __ STA T5 + 0 
68a6 : 85 43 __ STA T0 + 0 
68a8 : 85 53 __ STA T1 + 0 
68aa : 85 59 __ STA T7 + 0 
68ac : 85 57 __ STA T6 + 0 
68ae : 85 58 __ STA T6 + 1 
.l5:
68b0 : a5 57 __ LDA T6 + 0 
68b2 : 85 1b __ STA ACCU + 0 
68b4 : a5 58 __ LDA T6 + 1 
68b6 : 85 1c __ STA ACCU + 1 
68b8 : a9 c8 __ LDA #$c8
68ba : 85 03 __ STA WORK + 0 
68bc : 20 69 75 JSR $7569 ; (divmod@proxy + 0)
68bf : a4 1b __ LDY ACCU + 0 
68c1 : c4 59 __ CPY T7 + 0 
68c3 : f0 2a __ BEQ $68ef ; (tunnel_run.s6 + 0)
.s12:
68c5 : b9 f9 7d LDA $7df9,y ; (pal_sc[0] + 0)
68c8 : a2 fa __ LDX #$fa
.l14:
68ca : ca __ __ DEX
68cb : 9d 00 c0 STA $c000,x 
68ce : 9d fa c0 STA $c0fa,x 
68d1 : 9d f4 c1 STA $c1f4,x 
68d4 : 9d ee c2 STA $c2ee,x 
68d7 : d0 f1 __ BNE $68ca ; (tunnel_run.l14 + 0)
.s13:
68d9 : b9 82 80 LDA $8082,y ; (pal_cr[0] + 0)
68dc : a2 fa __ LDX #$fa
.l16:
68de : ca __ __ DEX
68df : 9d 00 d8 STA $d800,x 
68e2 : 9d fa d8 STA $d8fa,x 
68e5 : 9d f4 d9 STA $d9f4,x 
68e8 : 9d ee da STA $daee,x 
68eb : d0 f1 __ BNE $68de ; (tunnel_run.l16 + 0)
.s15:
68ed : 84 59 __ STY T7 + 0 
.s6:
68ef : a5 55 __ LDA T4 + 0 
68f1 : 85 12 __ STA P5 
68f3 : a5 56 __ LDA T5 + 0 
68f5 : 85 13 __ STA P6 
68f7 : a5 43 __ LDA T0 + 0 
68f9 : 85 54 __ STA T2 + 0 
68fb : 29 3f __ AND #$3f
68fd : aa __ __ TAX
68fe : bd 86 80 LDA $8086,x ; (lat_wave[0] + 0)
6901 : 85 14 __ STA P7 
6903 : a5 53 __ LDA T1 + 0 
6905 : 29 3f __ AND #$3f
6907 : aa __ __ TAX
6908 : bd 00 81 LDA $8100,x ; (vert_wave[0] + 0)
690b : 85 15 __ STA P8 
690d : 20 75 6c JSR $6c75 ; (tunnel_render.s4 + 0)
.l7:
6910 : 2c 11 d0 BIT $d011 
6913 : 30 fb __ BMI $6910 ; (tunnel_run.l7 + 0)
.l8:
6915 : 2c 11 d0 BIT $d011 
6918 : 10 fb __ BPL $6915 ; (tunnel_run.l8 + 0)
.s9:
691a : e6 53 __ INC T1 + 0 
691c : a6 54 __ LDX T2 + 0 
691e : e8 __ __ INX
691f : 86 43 __ STX T0 + 0 
6921 : e6 56 __ INC T5 + 0 
6923 : e6 55 __ INC T4 + 0 
6925 : e6 57 __ INC T6 + 0 
6927 : d0 02 __ BNE $692b ; (tunnel_run.s18 + 0)
.s17:
6929 : e6 58 __ INC T6 + 1 
.s18:
692b : a5 58 __ LDA T6 + 1 
692d : c9 03 __ CMP #$03
692f : f0 03 __ BEQ $6934 ; (tunnel_run.s11 + 0)
6931 : 4c b0 68 JMP $68b0 ; (tunnel_run.l5 + 0)
.s11:
6934 : a5 57 __ LDA T6 + 0 
6936 : c9 20 __ CMP #$20
6938 : d0 f7 __ BNE $6931 ; (tunnel_run.s18 + 6)
.s10:
693a : a9 00 __ LDA #$00
693c : 85 0d __ STA P0 
693e : 85 0e __ STA P1 
6940 : 85 10 __ STA P3 
6942 : a9 36 __ LDA #$36
6944 : 85 01 __ STA $01 
6946 : 20 0c 0f JSR $0f0c ; (vic_setmode@proxy + 0)
6949 : a9 00 __ LDA #$00
694b : 8d 20 d0 STA $d020 
694e : 8d 21 d0 STA $d021 
.s3:
6951 : a2 06 __ LDX #$06
6953 : bd df bf LDA $bfdf,x ; (tunnel_run@stack + 0)
6956 : 95 53 __ STA T1 + 0,x 
6958 : ca __ __ DEX
6959 : 10 f8 __ BPL $6953 ; (tunnel_run.s3 + 2)
695b : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_build_tables: ; tunnel_build_tables()->void
; 160, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
695c : a9 00 __ LDA #$00
695e : 85 4d __ STA T4 + 0 
6960 : a9 97 __ LDA #$97
6962 : 85 49 __ STA T1 + 0 
6964 : a9 ff __ LDA #$ff
6966 : 85 4a __ STA T1 + 1 
.l5:
6968 : a9 00 __ LDA #$00
696a : 85 4e __ STA T5 + 0 
696c : a9 b1 __ LDA #$b1
696e : 85 4b __ STA T2 + 0 
6970 : a9 ff __ LDA #$ff
.l6:
6972 : 85 4c __ STA T2 + 1 
6974 : 85 10 __ STA P3 
6976 : a5 49 __ LDA T1 + 0 
6978 : 85 0d __ STA P0 
697a : a5 4a __ LDA T1 + 1 
697c : 85 0e __ STA P1 
697e : a5 4b __ LDA T2 + 0 
6980 : 85 0f __ STA P2 
6982 : 20 e8 69 JSR $69e8 ; (iatan2_5.s4 + 0)
6985 : a6 4e __ LDX T5 + 0 
6987 : 9d 00 9f STA $9f00,x ; (row_buf[0] + 0)
698a : a5 4b __ LDA T2 + 0 
698c : 85 0d __ STA P0 
698e : a5 4c __ LDA T2 + 1 
6990 : 85 0e __ STA P1 
6992 : a5 49 __ LDA T1 + 0 
6994 : 85 0f __ STA P2 
6996 : a5 4a __ LDA T1 + 1 
6998 : 85 10 __ STA P3 
699a : 20 cc 6a JSR $6acc ; (idist_5.s4 + 0)
699d : a6 4e __ LDX T5 + 0 
699f : e8 __ __ INX
69a0 : 86 4e __ STX T5 + 0 
69a2 : 9d 4f 9f STA $9f4f,x ; (row_buf[0] + 79)
69a5 : 18 __ __ CLC
69a6 : a5 0d __ LDA P0 
69a8 : 69 02 __ ADC #$02
69aa : 85 4b __ STA T2 + 0 
69ac : a5 0e __ LDA P1 
69ae : 69 00 __ ADC #$00
69b0 : e0 50 __ CPX #$50
69b2 : 90 be __ BCC $6972 ; (tunnel_build_tables.l6 + 0)
.s7:
69b4 : a5 4d __ LDA T4 + 0 
69b6 : 85 1b __ STA ACCU + 0 
69b8 : a9 d0 __ LDA #$d0
69ba : 85 0d __ STA P0 
69bc : a9 00 __ LDA #$00
69be : 85 1c __ STA ACCU + 1 
69c0 : 85 1d __ STA ACCU + 2 
69c2 : 85 1e __ STA ACCU + 3 
69c4 : a9 a0 __ LDA #$a0
69c6 : 20 b6 74 JSR $74b6 ; (mul32by8 + 0)
69c9 : 18 __ __ CLC
69ca : a5 09 __ LDA WORK + 6 
69cc : 69 20 __ ADC #$20
69ce : 85 10 __ STA P3 
69d0 : a5 0a __ LDA WORK + 7 
69d2 : 69 00 __ ADC #$00
69d4 : 85 11 __ STA P4 
69d6 : 20 6e 6b JSR $6b6e ; (reu_dma@proxy + 0)
69d9 : e6 49 __ INC T1 + 0 
69db : d0 02 __ BNE $69df ; (tunnel_build_tables.s9 + 0)
.s8:
69dd : e6 4a __ INC T1 + 1 
.s9:
69df : e6 4d __ INC T4 + 0 
69e1 : a5 4d __ LDA T4 + 0 
69e3 : c9 6e __ CMP #$6e
69e5 : 90 81 __ BCC $6968 ; (tunnel_build_tables.l5 + 0)
.s3:
69e7 : 60 __ __ RTS
--------------------------------------------------------------------
iatan2_5: ; iatan2_5(i16,i16)->u8
; 115, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
69e8 : a5 10 __ LDA P3 ; (x + 1)
69ea : 05 0f __ ORA P2 ; (x + 0)
69ec : d0 0a __ BNE $69f8 ; (iatan2_5.s5 + 0)
.s37:
69ee : 85 0f __ STA P2 ; (x + 0)
69f0 : 85 10 __ STA P3 ; (x + 1)
69f2 : a5 0d __ LDA P0 ; (y + 0)
69f4 : 05 0e __ ORA P1 ; (y + 1)
69f6 : f0 77 __ BEQ $6a6f ; (iatan2_5.s3 + 0)
.s5:
69f8 : 24 10 __ BIT P3 ; (x + 1)
69fa : 30 09 __ BMI $6a05 ; (iatan2_5.s36 + 0)
.s6:
69fc : a5 0f __ LDA P2 ; (x + 0)
69fe : 85 43 __ STA T1 + 0 
6a00 : a5 10 __ LDA P3 ; (x + 1)
6a02 : 4c 10 6a JMP $6a10 ; (iatan2_5.s7 + 0)
.s36:
6a05 : 38 __ __ SEC
6a06 : a9 00 __ LDA #$00
6a08 : e5 0f __ SBC P2 ; (x + 0)
6a0a : 85 43 __ STA T1 + 0 
6a0c : a9 00 __ LDA #$00
6a0e : e5 10 __ SBC P3 ; (x + 1)
.s7:
6a10 : a8 __ __ TAY
6a11 : 24 0e __ BIT P1 ; (y + 1)
6a13 : 30 09 __ BMI $6a1e ; (iatan2_5.s35 + 0)
.s8:
6a15 : a5 0d __ LDA P0 ; (y + 0)
6a17 : 85 45 __ STA T3 + 0 
6a19 : a5 0e __ LDA P1 ; (y + 1)
6a1b : 4c 29 6a JMP $6a29 ; (iatan2_5.s9 + 0)
.s35:
6a1e : 38 __ __ SEC
6a1f : a9 00 __ LDA #$00
6a21 : e5 0d __ SBC P0 ; (y + 0)
6a23 : 85 45 __ STA T3 + 0 
6a25 : a9 00 __ LDA #$00
6a27 : e5 0e __ SBC P1 ; (y + 1)
.s9:
6a29 : 85 46 __ STA T3 + 1 
6a2b : 98 __ __ TYA
6a2c : 30 53 __ BMI $6a81 ; (iatan2_5.s10 + 0)
.s34:
6a2e : c4 46 __ CPY T3 + 1 
6a30 : d0 04 __ BNE $6a36 ; (iatan2_5.s33 + 0)
.s32:
6a32 : a5 43 __ LDA T1 + 0 
6a34 : c5 45 __ CMP T3 + 0 
.s33:
6a36 : 90 49 __ BCC $6a81 ; (iatan2_5.s10 + 0)
.s21:
6a38 : 84 04 __ STY WORK + 1 
6a3a : 24 0e __ BIT P1 ; (y + 1)
6a3c : 30 04 __ BMI $6a42 ; (iatan2_5.s23 + 0)
.s22:
6a3e : a9 ff __ LDA #$ff
6a40 : b0 02 __ BCS $6a44 ; (iatan2_5.s24 + 0)
.s23:
6a42 : a9 00 __ LDA #$00
.s24:
6a44 : 85 44 __ STA T2 + 0 
6a46 : a5 46 __ LDA T3 + 1 
6a48 : 06 45 __ ASL T3 + 0 
6a4a : 2a __ __ ROL
6a4b : 06 45 __ ASL T3 + 0 
6a4d : 2a __ __ ROL
6a4e : 06 45 __ ASL T3 + 0 
6a50 : 2a __ __ ROL
6a51 : 85 1c __ STA ACCU + 1 
6a53 : a5 45 __ LDA T3 + 0 
6a55 : 85 1b __ STA ACCU + 0 
6a57 : a5 43 __ LDA T1 + 0 
6a59 : 85 03 __ STA WORK + 0 
6a5b : 20 32 75 JSR $7532 ; (divs16 + 0)
6a5e : a5 10 __ LDA P3 ; (x + 1)
6a60 : 30 04 __ BMI $6a66 ; (iatan2_5.s25 + 0)
.s31:
6a62 : 05 0f __ ORA P2 ; (x + 0)
6a64 : d0 10 __ BNE $6a76 ; (iatan2_5.s28 + 0)
.s25:
6a66 : 24 44 __ BIT T2 + 0 
6a68 : 30 06 __ BMI $6a70 ; (iatan2_5.s27 + 0)
.s26:
6a6a : 18 __ __ CLC
6a6b : a5 1b __ LDA ACCU + 0 
6a6d : 69 10 __ ADC #$10
.s3:
6a6f : 60 __ __ RTS
.s27:
6a70 : a9 10 __ LDA #$10
.s38:
6a72 : 38 __ __ SEC
6a73 : e5 1b __ SBC ACCU + 0 
6a75 : 60 __ __ RTS
.s28:
6a76 : 24 44 __ BIT T2 + 0 
6a78 : 10 03 __ BPL $6a7d ; (iatan2_5.s29 + 0)
.s30:
6a7a : a5 1b __ LDA ACCU + 0 
6a7c : 60 __ __ RTS
.s29:
6a7d : a9 20 __ LDA #$20
6a7f : d0 f1 __ BNE $6a72 ; (iatan2_5.s38 + 0)
.s10:
6a81 : 24 10 __ BIT P3 ; (x + 1)
6a83 : 30 04 __ BMI $6a89 ; (iatan2_5.s12 + 0)
.s11:
6a85 : a9 ff __ LDA #$ff
6a87 : d0 02 __ BNE $6a8b ; (iatan2_5.s13 + 0)
.s12:
6a89 : a9 00 __ LDA #$00
.s13:
6a8b : 85 47 __ STA T4 + 0 
6a8d : 98 __ __ TYA
6a8e : 06 43 __ ASL T1 + 0 
6a90 : 2a __ __ ROL
6a91 : 06 43 __ ASL T1 + 0 
6a93 : 2a __ __ ROL
6a94 : 06 43 __ ASL T1 + 0 
6a96 : 2a __ __ ROL
6a97 : 85 1c __ STA ACCU + 1 
6a99 : a5 43 __ LDA T1 + 0 
6a9b : 85 1b __ STA ACCU + 0 
6a9d : a5 45 __ LDA T3 + 0 
6a9f : 85 03 __ STA WORK + 0 
6aa1 : a5 46 __ LDA T3 + 1 
6aa3 : 85 04 __ STA WORK + 1 
6aa5 : 20 32 75 JSR $7532 ; (divs16 + 0)
6aa8 : a5 0e __ LDA P1 ; (y + 1)
6aaa : 30 04 __ BMI $6ab0 ; (iatan2_5.s14 + 0)
.s20:
6aac : 05 0d __ ORA P0 ; (y + 0)
6aae : d0 0e __ BNE $6abe ; (iatan2_5.s17 + 0)
.s14:
6ab0 : 24 47 __ BIT T4 + 0 
6ab2 : 10 06 __ BPL $6aba ; (iatan2_5.s15 + 0)
.s16:
6ab4 : 18 __ __ CLC
6ab5 : a5 1b __ LDA ACCU + 0 
6ab7 : 69 18 __ ADC #$18
6ab9 : 60 __ __ RTS
.s15:
6aba : a9 18 __ LDA #$18
6abc : d0 b4 __ BNE $6a72 ; (iatan2_5.s38 + 0)
.s17:
6abe : 24 47 __ BIT T4 + 0 
6ac0 : 10 04 __ BPL $6ac6 ; (iatan2_5.s18 + 0)
.s19:
6ac2 : a9 08 __ LDA #$08
6ac4 : d0 ac __ BNE $6a72 ; (iatan2_5.s38 + 0)
.s18:
6ac6 : 18 __ __ CLC
6ac7 : a5 1b __ LDA ACCU + 0 
6ac9 : 69 08 __ ADC #$08
6acb : 60 __ __ RTS
--------------------------------------------------------------------
idist_5: ; idist_5(i16,i16)->u8
; 137, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6acc : a5 0f __ LDA P2 ; (dy + 0)
6ace : 85 03 __ STA WORK + 0 
6ad0 : 85 1b __ STA ACCU + 0 
6ad2 : a5 10 __ LDA P3 ; (dy + 1)
6ad4 : 85 04 __ STA WORK + 1 
6ad6 : 85 1c __ STA ACCU + 1 
6ad8 : 20 ec 74 JSR $74ec ; (mul16 + 0)
6adb : a5 05 __ LDA WORK + 2 
6add : 85 43 __ STA T0 + 0 
6adf : a5 06 __ LDA WORK + 3 
6ae1 : 85 44 __ STA T0 + 1 
6ae3 : a5 0d __ LDA P0 ; (dx + 0)
6ae5 : 85 03 __ STA WORK + 0 
6ae7 : 85 1b __ STA ACCU + 0 
6ae9 : a5 0e __ LDA P1 ; (dx + 1)
6aeb : 85 04 __ STA WORK + 1 
6aed : 85 1c __ STA ACCU + 1 
6aef : 20 ec 74 JSR $74ec ; (mul16 + 0)
6af2 : 18 __ __ CLC
6af3 : a5 05 __ LDA WORK + 2 
6af5 : 65 43 __ ADC T0 + 0 
6af7 : 85 43 __ STA T0 + 0 
6af9 : a5 06 __ LDA WORK + 3 
6afb : 65 44 __ ADC T0 + 1 
6afd : 85 44 __ STA T0 + 1 
6aff : 05 43 __ ORA T0 + 0 
6b01 : f0 64 __ BEQ $6b67 ; (idist_5.s11 + 0)
.s5:
6b03 : a5 44 __ LDA T0 + 1 
6b05 : 4a __ __ LSR
6b06 : 85 46 __ STA T1 + 1 
6b08 : a5 43 __ LDA T0 + 0 
6b0a : 6a __ __ ROR
6b0b : 85 45 __ STA T1 + 0 
6b0d : 05 46 __ ORA T1 + 1 
6b0f : d0 08 __ BNE $6b19 ; (idist_5.l6 + 0)
.s10:
6b11 : a9 01 __ LDA #$01
6b13 : 85 45 __ STA T1 + 0 
6b15 : a9 00 __ LDA #$00
6b17 : 85 46 __ STA T1 + 1 
.l6:
6b19 : a5 45 __ LDA T1 + 0 
6b1b : 85 03 __ STA WORK + 0 
6b1d : 85 47 __ STA T2 + 0 
6b1f : a5 46 __ LDA T1 + 1 
6b21 : 85 04 __ STA WORK + 1 
6b23 : 85 48 __ STA T2 + 1 
6b25 : a5 43 __ LDA T0 + 0 
6b27 : 85 1b __ STA ACCU + 0 
6b29 : a5 44 __ LDA T0 + 1 
6b2b : 85 1c __ STA ACCU + 1 
6b2d : 20 6d 75 JSR $756d ; (divmod + 0)
6b30 : 18 __ __ CLC
6b31 : a5 1b __ LDA ACCU + 0 
6b33 : 65 45 __ ADC T1 + 0 
6b35 : 85 45 __ STA T1 + 0 
6b37 : a5 1c __ LDA ACCU + 1 
6b39 : 65 46 __ ADC T1 + 1 
6b3b : 4a __ __ LSR
6b3c : 85 46 __ STA T1 + 1 
6b3e : 66 45 __ ROR T1 + 0 
6b40 : c5 48 __ CMP T2 + 1 
6b42 : 90 d5 __ BCC $6b19 ; (idist_5.l6 + 0)
.s12:
6b44 : d0 24 __ BNE $6b6a ; (idist_5.s13 + 0)
.s9:
6b46 : a5 45 __ LDA T1 + 0 
6b48 : c5 47 __ CMP T2 + 0 
6b4a : 90 cd __ BCC $6b19 ; (idist_5.l6 + 0)
.s7:
6b4c : 85 03 __ STA WORK + 0 
6b4e : a9 20 __ LDA #$20
6b50 : 85 1b __ STA ACCU + 0 
6b52 : a9 03 __ LDA #$03
6b54 : 85 1c __ STA ACCU + 1 
6b56 : a5 46 __ LDA T1 + 1 
6b58 : 85 04 __ STA WORK + 1 
6b5a : 20 6d 75 JSR $756d ; (divmod + 0)
6b5d : a5 1c __ LDA ACCU + 1 
6b5f : d0 06 __ BNE $6b67 ; (idist_5.s11 + 0)
.s8:
6b61 : a5 1b __ LDA ACCU + 0 
6b63 : c9 20 __ CMP #$20
6b65 : 90 02 __ BCC $6b69 ; (idist_5.s3 + 0)
.s11:
6b67 : a9 1f __ LDA #$1f
.s3:
6b69 : 60 __ __ RTS
.s13:
6b6a : a5 45 __ LDA T1 + 0 
6b6c : b0 de __ BCS $6b4c ; (idist_5.s7 + 0)
--------------------------------------------------------------------
reu_dma@proxy: ; reu_dma@proxy
6b6e : a5 07 __ LDA WORK + 4 
6b70 : 85 0e __ STA P1 
6b72 : a5 08 __ LDA WORK + 5 
6b74 : 85 0f __ STA P2 
--------------------------------------------------------------------
reu_dma: ; reu_dma(u8,u32,void*,u8)->void
;  94, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6b76 : 78 __ __ SEI
6b77 : a9 00 __ LDA #$00
6b79 : 8d 02 df STA $df02 
6b7c : a9 9f __ LDA #$9f
6b7e : 8d 03 df STA $df03 
6b81 : a5 0e __ LDA P1 ; (reu_addr + 0)
6b83 : 8d 04 df STA $df04 
6b86 : a5 0f __ LDA P2 ; (reu_addr + 1)
6b88 : 8d 05 df STA $df05 
6b8b : a5 10 __ LDA P3 ; (reu_addr + 2)
6b8d : 8d 06 df STA $df06 
6b90 : a9 a0 __ LDA #$a0
6b92 : 8d 07 df STA $df07 
6b95 : a9 00 __ LDA #$00
6b97 : 8d 08 df STA $df08 
6b9a : a5 0d __ LDA P0 ; (cmd + 0)
6b9c : 8d 01 df STA $df01 
6b9f : 58 __ __ CLI
.s3:
6ba0 : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_build_tex: ; tunnel_build_tex()->void
; 182, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6ba1 : a9 00 __ LDA #$00
6ba3 : 85 1b __ STA ACCU + 0 
.l5:
6ba5 : 29 04 __ AND #$04
6ba7 : 4a __ __ LSR
6ba8 : 4a __ __ LSR
6ba9 : f0 02 __ BEQ $6bad ; (tunnel_build_tex.s14 + 0)
.s13:
6bab : a9 04 __ LDA #$04
.s14:
6bad : 85 43 __ STA T1 + 0 
6baf : a5 1b __ LDA ACCU + 0 
6bb1 : 0a __ __ ASL
6bb2 : 0a __ __ ASL
6bb3 : 0a __ __ ASL
6bb4 : 0a __ __ ASL
6bb5 : 85 45 __ STA T2 + 0 
6bb7 : a9 00 __ LDA #$00
6bb9 : 85 1c __ STA ACCU + 1 
6bbb : 2a __ __ ROL
6bbc : 06 45 __ ASL T2 + 0 
6bbe : 2a __ __ ROL
6bbf : 85 46 __ STA T2 + 1 
6bc1 : a5 1b __ LDA ACCU + 0 
6bc3 : 29 03 __ AND #$03
6bc5 : f0 3b __ BEQ $6c02 ; (tunnel_build_tex.s11 + 0)
.l6:
6bc7 : 18 __ __ CLC
6bc8 : a5 43 __ LDA T1 + 0 
6bca : 65 1c __ ADC ACCU + 1 
6bcc : 29 1f __ AND #$1f
6bce : aa __ __ TAX
6bcf : 29 07 __ AND #$07
6bd1 : d0 04 __ BNE $6bd7 ; (tunnel_build_tex.s7 + 0)
.s10:
6bd3 : a9 02 __ LDA #$02
6bd5 : d0 05 __ BNE $6bdc ; (tunnel_build_tex.s8 + 0)
.s7:
6bd7 : 8a __ __ TXA
6bd8 : 29 04 __ AND #$04
6bda : 4a __ __ LSR
6bdb : 4a __ __ LSR
.s8:
6bdc : aa __ __ TAX
6bdd : a5 45 __ LDA T2 + 0 
6bdf : 05 1c __ ORA ACCU + 1 
6be1 : 18 __ __ CLC
6be2 : 69 a0 __ ADC #$a0
6be4 : 85 47 __ STA T5 + 0 
6be6 : a9 9f __ LDA #$9f
6be8 : 65 46 __ ADC T2 + 1 
6bea : 85 48 __ STA T5 + 1 
6bec : 8a __ __ TXA
6bed : a0 00 __ LDY #$00
6bef : 91 47 __ STA (T5 + 0),y 
6bf1 : e6 1c __ INC ACCU + 1 
6bf3 : a5 1c __ LDA ACCU + 1 
6bf5 : c9 20 __ CMP #$20
6bf7 : d0 ce __ BNE $6bc7 ; (tunnel_build_tex.l6 + 0)
.s9:
6bf9 : e6 1b __ INC ACCU + 0 
6bfb : a5 1b __ LDA ACCU + 0 
6bfd : c9 20 __ CMP #$20
6bff : d0 a4 __ BNE $6ba5 ; (tunnel_build_tex.l5 + 0)
.s3:
6c01 : 60 __ __ RTS
.s11:
6c02 : 85 43 __ STA T1 + 0 
6c04 : a6 45 __ LDX T2 + 0 
.l12:
6c06 : 8a __ __ TXA
6c07 : 05 1c __ ORA ACCU + 1 
6c09 : 18 __ __ CLC
6c0a : 69 a0 __ ADC #$a0
6c0c : a8 __ __ TAY
6c0d : a9 9f __ LDA #$9f
6c0f : 65 46 __ ADC T2 + 1 
6c11 : 85 44 __ STA T1 + 1 
6c13 : a9 03 __ LDA #$03
6c15 : 91 43 __ STA (T1 + 0),y 
6c17 : e6 1c __ INC ACCU + 1 
6c19 : a5 1c __ LDA ACCU + 1 
6c1b : c9 20 __ CMP #$20
6c1d : d0 e7 __ BNE $6c06 ; (tunnel_build_tex.l12 + 0)
6c1f : f0 d8 __ BEQ $6bf9 ; (tunnel_build_tex.s9 + 0)
--------------------------------------------------------------------
tun_init: ; tun_init()->void
; 266, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6c21 : a9 00 __ LDA #$00
6c23 : 85 0f __ STA P2 
6c25 : 85 10 __ STA P3 
6c27 : 85 43 __ STA T0 + 0 
6c29 : 85 0d __ STA P0 
6c2b : a9 35 __ LDA #$35
6c2d : 85 01 __ STA $01 
6c2f : 20 1b 79 JSR $791b ; (memset@proxy + 0)
6c32 : a9 c0 __ LDA #$c0
6c34 : 85 44 __ STA T0 + 1 
6c36 : a9 00 __ LDA #$00
6c38 : 85 1f __ STA ADDR + 0 
6c3a : f0 02 __ BEQ $6c3e ; (tun_init.l7 + 0)
.s8:
6c3c : e6 44 __ INC T0 + 1 
.l7:
6c3e : a9 f9 __ LDA #$f9
6c40 : a0 00 __ LDY #$00
6c42 : 91 43 __ STA (T0 + 0),y 
6c44 : 18 __ __ CLC
6c45 : a5 44 __ LDA T0 + 1 
6c47 : 69 18 __ ADC #$18
6c49 : 85 20 __ STA ADDR + 1 
6c4b : a9 01 __ LDA #$01
6c4d : a4 43 __ LDY T0 + 0 
6c4f : 91 1f __ STA (ADDR + 0),y 
6c51 : 98 __ __ TYA
6c52 : 18 __ __ CLC
6c53 : 69 01 __ ADC #$01
6c55 : 85 43 __ STA T0 + 0 
6c57 : b0 e3 __ BCS $6c3c ; (tun_init.s8 + 0)
.s9:
6c59 : c9 e8 __ CMP #$e8
6c5b : d0 e1 __ BNE $6c3e ; (tun_init.l7 + 0)
.s6:
6c5d : a5 44 __ LDA T0 + 1 
6c5f : c9 c3 __ CMP #$c3
6c61 : d0 db __ BNE $6c3e ; (tun_init.l7 + 0)
.s5:
6c63 : a9 00 __ LDA #$00
6c65 : 85 0e __ STA P1 
6c67 : 85 10 __ STA P3 
6c69 : 20 7b 79 JSR $797b ; (vic_setmode@proxy + 0)
6c6c : a9 00 __ LDA #$00
6c6e : 8d 21 d0 STA $d021 
6c71 : 8d 20 d0 STA $d020 
.s3:
6c74 : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_render: ; tunnel_render(u8,u8,i8,i8)->void
; 209, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6c75 : 18 __ __ CLC
6c76 : a5 15 __ LDA P8 ; (vert_j + 0)
6c78 : 69 05 __ ADC #$05
6c7a : 85 51 __ STA T12 + 0 
6c7c : a9 00 __ LDA #$00
6c7e : 85 52 __ STA T13 + 0 
6c80 : a9 d1 __ LDA #$d1
6c82 : 85 0d __ STA P0 
.l5:
6c84 : a5 51 __ LDA T12 + 0 
6c86 : 85 1b __ STA ACCU + 0 
6c88 : a9 00 __ LDA #$00
6c8a : 85 1c __ STA ACCU + 1 
6c8c : 85 1d __ STA ACCU + 2 
6c8e : 85 1e __ STA ACCU + 3 
6c90 : a9 a0 __ LDA #$a0
6c92 : 20 b6 74 JSR $74b6 ; (mul32by8 + 0)
6c95 : 18 __ __ CLC
6c96 : a5 09 __ LDA WORK + 6 
6c98 : 69 20 __ ADC #$20
6c9a : 85 10 __ STA P3 
6c9c : a5 0a __ LDA WORK + 7 
6c9e : 69 00 __ ADC #$00
6ca0 : 85 11 __ STA P4 
6ca2 : 20 6e 6b JSR $6b6e ; (reu_dma@proxy + 0)
6ca5 : a5 52 __ LDA T13 + 0 
6ca7 : 4a __ __ LSR
6ca8 : 4a __ __ LSR
6ca9 : 4a __ __ LSR
6caa : aa __ __ TAX
6cab : a5 52 __ LDA T13 + 0 
6cad : 29 07 __ AND #$07
6caf : 1d cb 78 ORA $78cb,x ; (__multab320L + 0)
6cb2 : 85 43 __ STA T1 + 0 
6cb4 : bd d8 78 LDA $78d8,x ; (__multab320H + 0)
6cb7 : 09 e0 __ ORA #$e0
6cb9 : 85 44 __ STA T1 + 1 
6cbb : 38 __ __ SEC
6cbc : a9 c7 __ LDA #$c7
6cbe : e5 52 __ SBC T13 + 0 
6cc0 : aa __ __ TAX
6cc1 : 29 07 __ AND #$07
6cc3 : 85 1c __ STA ACCU + 1 
6cc5 : 8a __ __ TXA
6cc6 : 4a __ __ LSR
6cc7 : 4a __ __ LSR
6cc8 : 4a __ __ LSR
6cc9 : 85 1b __ STA ACCU + 0 
6ccb : 0a __ __ ASL
6ccc : 0a __ __ ASL
6ccd : 65 1b __ ADC ACCU + 0 
6ccf : 4a __ __ LSR
6cd0 : 6a __ __ ROR
6cd1 : aa __ __ TAX
6cd2 : 29 80 __ AND #$80
6cd4 : 6a __ __ ROR
6cd5 : 05 1c __ ORA ACCU + 1 
6cd7 : 85 1b __ STA ACCU + 0 
6cd9 : 8a __ __ TXA
6cda : 29 3f __ AND #$3f
6cdc : 69 e0 __ ADC #$e0
6cde : 85 1c __ STA ACCU + 1 
6ce0 : a9 00 __ LDA #$00
6ce2 : 85 1d __ STA ACCU + 2 
.l6:
6ce4 : 0a __ __ ASL
6ce5 : 18 __ __ CLC
6ce6 : 65 14 __ ADC P7 ; (lat_j + 0)
6ce8 : 85 45 __ STA T4 + 0 
6cea : aa __ __ TAX
6ceb : a8 __ __ TAY
6cec : c8 __ __ INY
6ced : 24 45 __ BIT T4 + 0 
6cef : 10 03 __ BPL $6cf4 ; (tunnel_render.s7 + 0)
6cf1 : 4c 01 6e JMP $6e01 ; (tunnel_render.s13 + 0)
.s7:
6cf4 : a9 4f __ LDA #$4f
6cf6 : c5 45 __ CMP T4 + 0 
6cf8 : b0 02 __ BCS $6cfc ; (tunnel_render.s8 + 0)
.s12:
6cfa : 85 45 __ STA T4 + 0 
.s8:
6cfc : 8a __ __ TXA
6cfd : 30 06 __ BMI $6d05 ; (tunnel_render.s9 + 0)
.s20:
6cff : c9 4f __ CMP #$4f
6d01 : 90 02 __ BCC $6d05 ; (tunnel_render.s9 + 0)
.s11:
6d03 : a0 4f __ LDY #$4f
.s9:
6d05 : 84 47 __ STY T5 + 0 
6d07 : a5 13 __ LDA P6 ; (t_dist + 0)
6d09 : a6 45 __ LDX T4 + 0 
6d0b : 18 __ __ CLC
6d0c : 7d 50 9f ADC $9f50,x ; (row_buf[0] + 80)
6d0f : 29 1f __ AND #$1f
6d11 : 0a __ __ ASL
6d12 : 0a __ __ ASL
6d13 : 0a __ __ ASL
6d14 : 0a __ __ ASL
6d15 : 85 49 __ STA T6 + 0 
6d17 : a9 00 __ LDA #$00
6d19 : 2a __ __ ROL
6d1a : 06 49 __ ASL T6 + 0 
6d1c : 2a __ __ ROL
6d1d : 85 4a __ STA T6 + 1 
6d1f : bd 00 9f LDA $9f00,x ; (row_buf[0] + 0)
6d22 : 85 45 __ STA T4 + 0 
6d24 : 65 12 __ ADC P5 ; (t_ang + 0)
6d26 : 29 1f __ AND #$1f
6d28 : 05 49 __ ORA T6 + 0 
6d2a : 18 __ __ CLC
6d2b : 69 a0 __ ADC #$a0
6d2d : 85 4d __ STA T9 + 0 
6d2f : a9 9f __ LDA #$9f
6d31 : 65 4a __ ADC T6 + 1 
6d33 : 85 4e __ STA T9 + 1 
6d35 : a0 00 __ LDY #$00
6d37 : b1 4d __ LDA (T9 + 0),y 
6d39 : aa __ __ TAX
6d3a : 4a __ __ LSR
6d3b : 85 50 __ STA T10 + 1 
6d3d : 98 __ __ TYA
6d3e : 6a __ __ ROR
6d3f : 66 50 __ ROR T10 + 1 
6d41 : 6a __ __ ROR
6d42 : 85 4f __ STA T10 + 0 
6d44 : 8a __ __ TXA
6d45 : 0a __ __ ASL
6d46 : 0a __ __ ASL
6d47 : 0a __ __ ASL
6d48 : 0a __ __ ASL
6d49 : 05 4f __ ORA T10 + 0 
6d4b : 85 4d __ STA T9 + 0 
6d4d : a6 47 __ LDX T5 + 0 
6d4f : bd 50 9f LDA $9f50,x ; (row_buf[0] + 80)
6d52 : 18 __ __ CLC
6d53 : 65 13 __ ADC P6 ; (t_dist + 0)
6d55 : 29 1f __ AND #$1f
6d57 : 0a __ __ ASL
6d58 : 0a __ __ ASL
6d59 : 0a __ __ ASL
6d5a : 0a __ __ ASL
6d5b : 85 4b __ STA T7 + 0 
6d5d : 98 __ __ TYA
6d5e : 2a __ __ ROL
6d5f : 06 4b __ ASL T7 + 0 
6d61 : 2a __ __ ROL
6d62 : 85 4c __ STA T7 + 1 
6d64 : bd 00 9f LDA $9f00,x ; (row_buf[0] + 0)
6d67 : 85 47 __ STA T5 + 0 
6d69 : 65 12 __ ADC P5 ; (t_ang + 0)
6d6b : 29 1f __ AND #$1f
6d6d : 05 4b __ ORA T7 + 0 
6d6f : 18 __ __ CLC
6d70 : 69 a0 __ ADC #$a0
6d72 : 85 4f __ STA T10 + 0 
6d74 : a9 9f __ LDA #$9f
6d76 : 65 4c __ ADC T7 + 1 
6d78 : 85 50 __ STA T10 + 1 
6d7a : b1 4f __ LDA (T10 + 0),y 
6d7c : 0a __ __ ASL
6d7d : 0a __ __ ASL
6d7e : 05 4d __ ORA T9 + 0 
6d80 : 11 4f __ ORA (T10 + 0),y 
6d82 : 91 43 __ STA (T1 + 0),y 
6d84 : 38 __ __ SEC
6d85 : a9 20 __ LDA #$20
6d87 : e5 45 __ SBC T4 + 0 
6d89 : 18 __ __ CLC
6d8a : 65 12 __ ADC P5 ; (t_ang + 0)
6d8c : 29 1f __ AND #$1f
6d8e : 05 49 __ ORA T6 + 0 
6d90 : 18 __ __ CLC
6d91 : 69 a0 __ ADC #$a0
6d93 : 85 45 __ STA T4 + 0 
6d95 : a9 9f __ LDA #$9f
6d97 : 65 4a __ ADC T6 + 1 
6d99 : 85 46 __ STA T4 + 1 
6d9b : b1 45 __ LDA (T4 + 0),y 
6d9d : aa __ __ TAX
6d9e : 4a __ __ LSR
6d9f : 85 4a __ STA T6 + 1 
6da1 : 98 __ __ TYA
6da2 : 6a __ __ ROR
6da3 : 66 4a __ ROR T6 + 1 
6da5 : 6a __ __ ROR
6da6 : 85 49 __ STA T6 + 0 
6da8 : 8a __ __ TXA
6da9 : 0a __ __ ASL
6daa : 0a __ __ ASL
6dab : 0a __ __ ASL
6dac : 0a __ __ ASL
6dad : 05 49 __ ORA T6 + 0 
6daf : 85 45 __ STA T4 + 0 
6db1 : 38 __ __ SEC
6db2 : a9 20 __ LDA #$20
6db4 : e5 47 __ SBC T5 + 0 
6db6 : 18 __ __ CLC
6db7 : 65 12 __ ADC P5 ; (t_ang + 0)
6db9 : 29 1f __ AND #$1f
6dbb : 05 4b __ ORA T7 + 0 
6dbd : 18 __ __ CLC
6dbe : 69 a0 __ ADC #$a0
6dc0 : 85 47 __ STA T5 + 0 
6dc2 : a9 9f __ LDA #$9f
6dc4 : 65 4c __ ADC T7 + 1 
6dc6 : 85 48 __ STA T5 + 1 
6dc8 : b1 47 __ LDA (T5 + 0),y 
6dca : 0a __ __ ASL
6dcb : 0a __ __ ASL
6dcc : 05 45 __ ORA T4 + 0 
6dce : 11 47 __ ORA (T5 + 0),y 
6dd0 : 91 1b __ STA (ACCU + 0),y 
6dd2 : 18 __ __ CLC
6dd3 : a5 43 __ LDA T1 + 0 
6dd5 : 69 08 __ ADC #$08
6dd7 : 85 43 __ STA T1 + 0 
6dd9 : 90 03 __ BCC $6dde ; (tunnel_render.s17 + 0)
.s16:
6ddb : e6 44 __ INC T1 + 1 
6ddd : 18 __ __ CLC
.s17:
6dde : a5 1b __ LDA ACCU + 0 
6de0 : 69 08 __ ADC #$08
6de2 : 85 1b __ STA ACCU + 0 
6de4 : 90 02 __ BCC $6de8 ; (tunnel_render.s19 + 0)
.s18:
6de6 : e6 1c __ INC ACCU + 1 
.s19:
6de8 : e6 1d __ INC ACCU + 2 
6dea : a5 1d __ LDA ACCU + 2 
6dec : c9 28 __ CMP #$28
6dee : f0 03 __ BEQ $6df3 ; (tunnel_render.s10 + 0)
6df0 : 4c e4 6c JMP $6ce4 ; (tunnel_render.l6 + 0)
.s10:
6df3 : e6 51 __ INC T12 + 0 
6df5 : e6 52 __ INC T13 + 0 
6df7 : a5 52 __ LDA T13 + 0 
6df9 : c9 64 __ CMP #$64
6dfb : f0 03 __ BEQ $6e00 ; (tunnel_render.s3 + 0)
6dfd : 4c 84 6c JMP $6c84 ; (tunnel_render.l5 + 0)
.s3:
6e00 : 60 __ __ RTS
.s13:
6e01 : a9 00 __ LDA #$00
6e03 : 85 45 __ STA T4 + 0 
6e05 : 8a __ __ TXA
6e06 : 30 03 __ BMI $6e0b ; (tunnel_render.s15 + 0)
6e08 : 4c ff 6c JMP $6cff ; (tunnel_render.s20 + 0)
.s15:
6e0b : e0 ff __ CPX #$ff
6e0d : 90 03 __ BCC $6e12 ; (tunnel_render.s14 + 0)
6e0f : 4c fc 6c JMP $6cfc ; (tunnel_render.s8 + 0)
.s14:
6e12 : a0 00 __ LDY #$00
6e14 : 4c 05 6d JMP $6d05 ; (tunnel_render.s9 + 0)
--------------------------------------------------------------------
scroller_run: ; scroller_run()->void
;   3, "/home/xahmol/git/UltimateDemo2026/src/scroller.h"
.s4:
6e17 : a9 00 __ LDA #$00
6e19 : 8d d6 84 STA $84d6 ; (loops + 0)
6e1c : 8d d7 84 STA $84d7 ; (loops + 1)
6e1f : 8d fe 83 STA $83fe ; (done + 0)
6e22 : 8d ff 80 STA $80ff ; (plasma_phase + 0)
6e25 : 8d fe 80 STA $80fe ; (wave_phase + 0)
6e28 : 8d fc 80 STA $80fc ; (insert_col + 0)
6e2b : 8d fa 80 STA $80fa ; (txt_pos + 0)
6e2e : 8d fb 80 STA $80fb ; (txt_pos + 1)
6e31 : a9 07 __ LDA #$07
6e33 : 8d fd 80 STA $80fd ; (fine_x + 0)
6e36 : 20 3e 6f JSR $6f3e ; (scr_init.s4 + 0)
6e39 : a9 00 __ LDA #$00
6e3b : 8d 20 d0 STA $d020 
.l5:
6e3e : 2c 11 d0 BIT $d011 
6e41 : 30 fb __ BMI $6e3e ; (scroller_run.l5 + 0)
.l6:
6e43 : 2c 11 d0 BIT $d011 
6e46 : 10 fb __ BPL $6e43 ; (scroller_run.l6 + 0)
.s7:
6e48 : a9 00 __ LDA #$00
6e4a : 8d 00 dc STA $dc00 
6e4d : ad 01 dc LDA $dc01 
6e50 : 85 43 __ STA T0 + 0 
6e52 : a9 ff __ LDA #$ff
6e54 : 8d 00 dc STA $dc00 
6e57 : c5 43 __ CMP T0 + 0 
6e59 : f0 05 __ BEQ $6e60 ; (scroller_run.s8 + 0)
.s20:
6e5b : a9 01 __ LDA #$01
6e5d : 8d fe 83 STA $83fe ; (done + 0)
.s8:
6e60 : ad fd 80 LDA $80fd ; (fine_x + 0)
6e63 : f0 06 __ BEQ $6e6b ; (scroller_run.s9 + 0)
.s19:
6e65 : ce fd 80 DEC $80fd ; (fine_x + 0)
6e68 : 4c fb 6e JMP $6efb ; (scroller_run.s11 + 0)
.s9:
6e6b : a9 07 __ LDA #$07
6e6d : 8d fd 80 STA $80fd ; (fine_x + 0)
6e70 : a2 00 __ LDX #$00
.l21:
6e72 : bd d9 84 LDA $84d9,x ; (scr_letter[0] + 1)
6e75 : 9d d8 84 STA $84d8,x ; (scr_letter[0] + 0)
6e78 : bd c9 86 LDA $86c9,x ; (scr_col[0] + 1)
6e7b : 9d c8 86 STA $86c8,x ; (scr_col[0] + 0)
6e7e : e8 __ __ INX
6e7f : e0 27 __ CPX #$27
6e81 : d0 ef __ BNE $6e72 ; (scroller_run.l21 + 0)
.s22:
6e83 : 18 __ __ CLC
6e84 : a9 40 __ LDA #$40
6e86 : 6d fa 80 ADC $80fa ; (txt_pos + 0)
6e89 : 85 43 __ STA T0 + 0 
6e8b : a9 81 __ LDA #$81
6e8d : 6d fb 80 ADC $80fb ; (txt_pos + 1)
6e90 : 85 44 __ STA T0 + 1 
6e92 : a0 00 __ LDY #$00
6e94 : b1 43 __ LDA (T0 + 0),y 
6e96 : 20 a4 6f JSR $6fa4 ; (letter_idx.s4 + 0)
6e99 : aa __ __ TAX
6e9a : ad fc 80 LDA $80fc ; (insert_col + 0)
6e9d : dd 78 83 CMP $8378,x ; (letter_width[0] + 0)
6ea0 : b0 0b __ BCS $6ead ; (scroller_run.s10 + 0)
.s18:
6ea2 : 8e ff 84 STX $84ff ; (scr_letter[0] + 39)
6ea5 : 8d ef 86 STA $86ef ; (scr_col[0] + 39)
6ea8 : ee fc 80 INC $80fc ; (insert_col + 0)
6eab : 90 4e __ BCC $6efb ; (scroller_run.s11 + 0)
.s10:
6ead : a9 00 __ LDA #$00
6eaf : 8d fc 80 STA $80fc ; (insert_col + 0)
6eb2 : 8d ef 86 STA $86ef ; (scr_col[0] + 39)
6eb5 : ad fa 80 LDA $80fa ; (txt_pos + 0)
6eb8 : 69 00 __ ADC #$00
6eba : 8d fa 80 STA $80fa ; (txt_pos + 0)
6ebd : a9 34 __ LDA #$34
6ebf : 8d ff 84 STA $84ff ; (scr_letter[0] + 39)
6ec2 : ad fb 80 LDA $80fb ; (txt_pos + 1)
6ec5 : 69 00 __ ADC #$00
6ec7 : 8d fb 80 STA $80fb ; (txt_pos + 1)
6eca : c9 02 __ CMP #$02
6ecc : d0 05 __ BNE $6ed3 ; (scroller_run.s17 + 0)
.s16:
6ece : ad fa 80 LDA $80fa ; (txt_pos + 0)
6ed1 : c9 37 __ CMP #$37
.s17:
6ed3 : 90 26 __ BCC $6efb ; (scroller_run.s11 + 0)
.s13:
6ed5 : a9 00 __ LDA #$00
6ed7 : 8d fa 80 STA $80fa ; (txt_pos + 0)
6eda : 8d fb 80 STA $80fb ; (txt_pos + 1)
6edd : ad d6 84 LDA $84d6 ; (loops + 0)
6ee0 : 69 00 __ ADC #$00
6ee2 : 8d d6 84 STA $84d6 ; (loops + 0)
6ee5 : ad d7 84 LDA $84d7 ; (loops + 1)
6ee8 : 69 00 __ ADC #$00
6eea : 8d d7 84 STA $84d7 ; (loops + 1)
6eed : d0 07 __ BNE $6ef6 ; (scroller_run.s14 + 0)
.s15:
6eef : ad d6 84 LDA $84d6 ; (loops + 0)
6ef2 : c9 02 __ CMP #$02
6ef4 : 90 05 __ BCC $6efb ; (scroller_run.s11 + 0)
.s14:
6ef6 : a9 01 __ LDA #$01
6ef8 : 8d fe 83 STA $83fe ; (done + 0)
.s11:
6efb : 20 6f 70 JSR $706f ; (draw_frame.s4 + 0)
6efe : ee fe 80 INC $80fe ; (wave_phase + 0)
6f01 : ee ff 80 INC $80ff ; (plasma_phase + 0)
6f04 : ad 16 d0 LDA $d016 
6f07 : 29 f8 __ AND #$f8
6f09 : 0d fd 80 ORA $80fd ; (fine_x + 0)
6f0c : 8d 16 d0 STA $d016 
6f0f : ad fe 83 LDA $83fe ; (done + 0)
6f12 : d0 03 __ BNE $6f17 ; (scr_done.s4 + 0)
6f14 : 4c 3e 6e JMP $6e3e ; (scroller_run.l5 + 0)
--------------------------------------------------------------------
scr_done: ; scr_done()->void
; 366, "/home/xahmol/git/UltimateDemo2026/src/scroller.c"
.s4:
6f17 : ad 16 d0 LDA $d016 
6f1a : 29 f8 __ AND #$f8
6f1c : 8d 16 d0 STA $d016 
6f1f : a9 00 __ LDA #$00
6f21 : 85 0d __ STA P0 
6f23 : 85 0e __ STA P1 
6f25 : 85 10 __ STA P3 
6f27 : 20 0c 0f JSR $0f0c ; (vic_setmode@proxy + 0)
6f2a : a9 20 __ LDA #$20
6f2c : a2 fa __ LDX #$fa
.l5:
6f2e : ca __ __ DEX
6f2f : 9d 00 04 STA $0400,x 
6f32 : 9d fa 04 STA $04fa,x 
6f35 : 9d f4 05 STA $05f4,x 
6f38 : 9d ee 06 STA $06ee,x 
6f3b : d0 f1 __ BNE $6f2e ; (scr_done.l5 + 0)
.s3:
6f3d : 60 __ __ RTS
--------------------------------------------------------------------
scr_init: ; scr_init()->void
; 346, "/home/xahmol/git/UltimateDemo2026/src/scroller.c"
.s4:
6f3e : a9 00 __ LDA #$00
6f40 : 85 0d __ STA P0 
6f42 : 85 43 __ STA T0 + 0 
6f44 : 85 0e __ STA P1 
6f46 : 85 10 __ STA P3 
6f48 : a9 04 __ LDA #$04
6f4a : 85 44 __ STA T0 + 1 
6f4c : 85 0f __ STA P2 
6f4e : a9 10 __ LDA #$10
6f50 : 85 11 __ STA P4 
6f52 : 20 14 0f JSR $0f14 ; (vic_setmode.s4 + 0)
6f55 : a9 00 __ LDA #$00
6f57 : 8d 21 d0 STA $d021 
6f5a : 8d 20 d0 STA $d020 
6f5d : 85 1f __ STA ADDR + 0 
6f5f : f0 02 __ BEQ $6f63 ; (scr_init.l8 + 0)
.s10:
6f61 : e6 44 __ INC T0 + 1 
.l8:
6f63 : a9 20 __ LDA #$20
6f65 : a0 00 __ LDY #$00
6f67 : 91 43 __ STA (T0 + 0),y 
6f69 : 18 __ __ CLC
6f6a : a5 44 __ LDA T0 + 1 
6f6c : 69 d4 __ ADC #$d4
6f6e : 85 20 __ STA ADDR + 1 
6f70 : a9 06 __ LDA #$06
6f72 : a4 43 __ LDY T0 + 0 
6f74 : 91 1f __ STA (ADDR + 0),y 
6f76 : 98 __ __ TYA
6f77 : 18 __ __ CLC
6f78 : 69 01 __ ADC #$01
6f7a : 85 43 __ STA T0 + 0 
6f7c : b0 e3 __ BCS $6f61 ; (scr_init.s10 + 0)
.s11:
6f7e : c9 e8 __ CMP #$e8
6f80 : d0 e1 __ BNE $6f63 ; (scr_init.l8 + 0)
.s7:
6f82 : a5 44 __ LDA T0 + 1 
6f84 : c9 07 __ CMP #$07
6f86 : d0 db __ BNE $6f63 ; (scr_init.l8 + 0)
.s5:
6f88 : a2 00 __ LDX #$00
.l9:
6f8a : a9 34 __ LDA #$34
6f8c : 9d d8 84 STA $84d8,x ; (scr_letter[0] + 0)
6f8f : a9 00 __ LDA #$00
6f91 : 9d c8 86 STA $86c8,x ; (scr_col[0] + 0)
6f94 : e8 __ __ INX
6f95 : e0 28 __ CPX #$28
6f97 : d0 f1 __ BNE $6f8a ; (scr_init.l9 + 0)
.s6:
6f99 : ad 16 d0 LDA $d016 
6f9c : 29 f8 __ AND #$f8
6f9e : 09 07 __ ORA #$07
6fa0 : 8d 16 d0 STA $d016 
.s3:
6fa3 : 60 __ __ RTS
--------------------------------------------------------------------
letter_idx: ; letter_idx(u8)->u8
; 306, "/home/xahmol/git/UltimateDemo2026/src/scroller.c"
.s4:
6fa4 : c9 61 __ CMP #$61
6fa6 : 90 07 __ BCC $6faf ; (letter_idx.s5 + 0)
.s61:
6fa8 : c9 7b __ CMP #$7b
6faa : b0 03 __ BCS $6faf ; (letter_idx.s5 + 0)
.s62:
6fac : e9 60 __ SBC #$60
.s3:
6fae : 60 __ __ RTS
.s5:
6faf : c9 41 __ CMP #$41
6fb1 : 90 07 __ BCC $6fba ; (letter_idx.s6 + 0)
.s59:
6fb3 : c9 5b __ CMP #$5b
6fb5 : b0 03 __ BCS $6fba ; (letter_idx.s6 + 0)
.s60:
6fb7 : 69 d9 __ ADC #$d9
6fb9 : 60 __ __ RTS
.s6:
6fba : c9 30 __ CMP #$30
6fbc : b0 03 __ BCS $6fc1 ; (letter_idx.s57 + 0)
6fbe : 4c 65 70 JMP $7065 ; (letter_idx.s7 + 0)
.s57:
6fc1 : c9 3a __ CMP #$3a
6fc3 : b0 03 __ BCS $6fc8 ; (letter_idx.s8 + 0)
.s58:
6fc5 : 69 05 __ ADC #$05
6fc7 : 60 __ __ RTS
.s8:
6fc8 : c9 2d __ CMP #$2d
6fca : 90 4e __ BCC $701a ; (letter_idx.s33 + 0)
.s9:
6fcc : c9 3d __ CMP #$3d
6fce : d0 03 __ BNE $6fd3 ; (letter_idx.s10 + 0)
.s32:
6fd0 : a9 4d __ LDA #$4d
6fd2 : 60 __ __ RTS
.s10:
6fd3 : 90 24 __ BCC $6ff9 ; (letter_idx.s22 + 0)
.s11:
6fd5 : c9 40 __ CMP #$40
6fd7 : d0 03 __ BNE $6fdc ; (letter_idx.s12 + 0)
.s21:
6fd9 : a9 54 __ LDA #$54
6fdb : 60 __ __ RTS
.s12:
6fdc : 90 11 __ BCC $6fef ; (letter_idx.s18 + 0)
.s13:
6fde : c9 5b __ CMP #$5b
6fe0 : d0 03 __ BNE $6fe5 ; (letter_idx.s14 + 0)
.s17:
6fe2 : a9 53 __ LDA #$53
6fe4 : 60 __ __ RTS
.s14:
6fe5 : c9 5d __ CMP #$5d
6fe7 : d0 03 __ BNE $6fec ; (letter_idx.s15 + 0)
.s16:
6fe9 : a9 55 __ LDA #$55
6feb : 60 __ __ RTS
.s15:
6fec : a9 34 __ LDA #$34
6fee : 60 __ __ RTS
.s18:
6fef : c9 3e __ CMP #$3e
6ff1 : d0 03 __ BNE $6ff6 ; (letter_idx.s19 + 0)
.s20:
6ff3 : a9 52 __ LDA #$52
6ff5 : 60 __ __ RTS
.s19:
6ff6 : a9 4c __ LDA #$4c
6ff8 : 60 __ __ RTS
.s22:
6ff9 : c9 3a __ CMP #$3a
6ffb : d0 03 __ BNE $7000 ; (letter_idx.s23 + 0)
.s31:
6ffd : a9 3f __ LDA #$3f
6fff : 60 __ __ RTS
.s23:
7000 : 90 0a __ BCC $700c ; (letter_idx.s27 + 0)
.s24:
7002 : c9 3b __ CMP #$3b
7004 : d0 03 __ BNE $7009 ; (letter_idx.s25 + 0)
.s26:
7006 : a9 42 __ LDA #$42
7008 : 60 __ __ RTS
.s25:
7009 : a9 50 __ LDA #$50
700b : 60 __ __ RTS
.s27:
700c : c9 2e __ CMP #$2e
700e : d0 03 __ BNE $7013 ; (letter_idx.s28 + 0)
.s30:
7010 : a9 40 __ LDA #$40
7012 : 60 __ __ RTS
.s28:
7013 : c9 2f __ CMP #$2f
7015 : d0 d5 __ BNE $6fec ; (letter_idx.s15 + 0)
.s29:
7017 : a9 44 __ LDA #$44
7019 : 60 __ __ RTS
.s33:
701a : c9 26 __ CMP #$26
701c : d0 03 __ BNE $7021 ; (letter_idx.s34 + 0)
.s55:
701e : a9 48 __ LDA #$48
7020 : 60 __ __ RTS
.s34:
7021 : 90 21 __ BCC $7044 ; (letter_idx.s45 + 0)
.s35:
7023 : c9 29 __ CMP #$29
7025 : d0 03 __ BNE $702a ; (letter_idx.s36 + 0)
.s44:
7027 : a9 51 __ LDA #$51
7029 : 60 __ __ RTS
.s36:
702a : 90 0e __ BCC $703a ; (letter_idx.s41 + 0)
.s37:
702c : c9 2b __ CMP #$2b
702e : d0 03 __ BNE $7033 ; (letter_idx.s38 + 0)
.s40:
7030 : a9 4b __ LDA #$4b
7032 : 60 __ __ RTS
.s38:
7033 : c9 2c __ CMP #$2c
7035 : d0 b5 __ BNE $6fec ; (letter_idx.s15 + 0)
.s39:
7037 : a9 43 __ LDA #$43
7039 : 60 __ __ RTS
.s41:
703a : c9 27 __ CMP #$27
703c : d0 03 __ BNE $7041 ; (letter_idx.s42 + 0)
.s43:
703e : a9 45 __ LDA #$45
7040 : 60 __ __ RTS
.s42:
7041 : a9 4f __ LDA #$4f
7043 : 60 __ __ RTS
.s45:
7044 : c9 23 __ CMP #$23
7046 : d0 03 __ BNE $704b ; (letter_idx.s46 + 0)
.s54:
7048 : a9 4e __ LDA #$4e
704a : 60 __ __ RTS
.s46:
704b : 90 0a __ BCC $7057 ; (letter_idx.s50 + 0)
.s47:
704d : c9 24 __ CMP #$24
704f : d0 03 __ BNE $7054 ; (letter_idx.s48 + 0)
.s49:
7051 : a9 47 __ LDA #$47
7053 : 60 __ __ RTS
.s48:
7054 : a9 49 __ LDA #$49
7056 : 60 __ __ RTS
.s50:
7057 : c9 21 __ CMP #$21
7059 : d0 03 __ BNE $705e ; (letter_idx.s51 + 0)
.s53:
705b : a9 41 __ LDA #$41
705d : 60 __ __ RTS
.s51:
705e : c9 22 __ CMP #$22
7060 : d0 8a __ BNE $6fec ; (letter_idx.s15 + 0)
.s52:
7062 : a9 46 __ LDA #$46
7064 : 60 __ __ RTS
.s7:
7065 : c9 2d __ CMP #$2d
7067 : f0 03 __ BEQ $706c ; (letter_idx.s56 + 0)
7069 : 4c c8 6f JMP $6fc8 ; (letter_idx.s8 + 0)
.s56:
706c : a9 4a __ LDA #$4a
706e : 60 __ __ RTS
--------------------------------------------------------------------
draw_frame: ; draw_frame()->void
; 408, "/home/xahmol/git/UltimateDemo2026/src/scroller.c"
.s4:
706f : ad ff 80 LDA $80ff ; (plasma_phase + 0)
7072 : 85 1d __ STA ACCU + 2 
7074 : 0a __ __ ASL
7075 : 85 1e __ STA ACCU + 3 
7077 : a9 00 __ LDA #$00
7079 : 8d ff 83 STA $83ff ; (dp_y + 0)
707c : 85 1f __ STA ADDR + 0 
707e : 85 45 __ STA T4 + 0 
.l5:
7080 : ad ff 83 LDA $83ff ; (dp_y + 0)
7083 : 85 49 __ STA T7 + 0 
7085 : 0a __ __ ASL
7086 : 85 1b __ STA ACCU + 0 
7088 : a9 00 __ LDA #$00
708a : 2a __ __ ROL
708b : 06 1b __ ASL ACCU + 0 
708d : 2a __ __ ROL
708e : aa __ __ TAX
708f : a5 1b __ LDA ACCU + 0 
7091 : 65 49 __ ADC T7 + 0 
7093 : 85 1b __ STA ACCU + 0 
7095 : 8a __ __ TXA
7096 : 69 00 __ ADC #$00
7098 : 06 1b __ ASL ACCU + 0 
709a : 2a __ __ ROL
709b : 06 1b __ ASL ACCU + 0 
709d : 2a __ __ ROL
709e : 06 1b __ ASL ACCU + 0 
70a0 : 2a __ __ ROL
70a1 : 69 04 __ ADC #$04
70a3 : 85 46 __ STA T4 + 1 
70a5 : a5 49 __ LDA T7 + 0 
70a7 : 0a __ __ ASL
70a8 : 0a __ __ ASL
70a9 : 0a __ __ ASL
70aa : 18 __ __ CLC
70ab : 65 49 __ ADC T7 + 0 
70ad : 18 __ __ CLC
70ae : 65 1e __ ADC ACCU + 3 
70b0 : 29 3f __ AND #$3f
70b2 : aa __ __ TAX
70b3 : bd 00 84 LDA $8400,x ; (psin[0] + 0)
70b6 : 85 43 __ STA T2 + 0 
70b8 : a5 1d __ LDA ACCU + 2 
70ba : 85 47 __ STA T5 + 0 
70bc : a9 28 __ LDA #$28
70be : 85 4a __ STA T8 + 0 
70c0 : a4 1b __ LDY ACCU + 0 
.l35:
70c2 : a9 a0 __ LDA #$a0
70c4 : 91 45 __ STA (T4 + 0),y 
70c6 : a5 47 __ LDA T5 + 0 
70c8 : 29 3f __ AND #$3f
70ca : aa __ __ TAX
70cb : bd 00 84 LDA $8400,x ; (psin[0] + 0)
70ce : 18 __ __ CLC
70cf : 65 43 __ ADC T2 + 0 
70d1 : 4a __ __ LSR
70d2 : aa __ __ TAX
70d3 : 18 __ __ CLC
70d4 : a5 46 __ LDA T4 + 1 
70d6 : 69 d4 __ ADC #$d4
70d8 : 85 20 __ STA ADDR + 1 
70da : bd c6 80 LDA $80c6,x ; (pcolor[0] + 0)
70dd : 91 1f __ STA (ADDR + 0),y 
70df : 18 __ __ CLC
70e0 : a5 47 __ LDA T5 + 0 
70e2 : 69 05 __ ADC #$05
70e4 : 85 47 __ STA T5 + 0 
70e6 : c8 __ __ INY
70e7 : d0 02 __ BNE $70eb ; (draw_frame.s40 + 0)
.s39:
70e9 : e6 46 __ INC T4 + 1 
.s40:
70eb : c6 4a __ DEC T8 + 0 
70ed : d0 d3 __ BNE $70c2 ; (draw_frame.l35 + 0)
.s36:
70ef : a6 49 __ LDX T7 + 0 
70f1 : e8 __ __ INX
70f2 : 8e ff 83 STX $83ff ; (dp_y + 0)
70f5 : e0 19 __ CPX #$19
70f7 : 90 87 __ BCC $7080 ; (draw_frame.l5 + 0)
.s6:
70f9 : a9 00 __ LDA #$00
70fb : 8d f0 86 STA $86f0 ; (df_x + 0)
.l7:
70fe : ae f0 86 LDX $86f0 ; (df_x + 0)
7101 : 86 49 __ STX T7 + 0 
7103 : 86 1d __ STX ACCU + 2 
7105 : bd c8 86 LDA $86c8,x ; (scr_col[0] + 0)
7108 : 85 45 __ STA T4 + 0 
710a : d0 0f __ BNE $711b ; (draw_frame.s9 + 0)
.s8:
710c : ad fe 80 LDA $80fe ; (wave_phase + 0)
710f : 18 __ __ CLC
7110 : 65 1d __ ADC ACCU + 2 
7112 : 29 3f __ AND #$3f
7114 : aa __ __ TAX
7115 : bd 40 84 LDA $8440,x ; (sin_row[0] + 0)
7118 : 8d f1 86 STA $86f1 ; (df_yoff + 0)
.s9:
711b : ad f1 86 LDA $86f1 ; (df_yoff + 0)
711e : 18 __ __ CLC
711f : 69 0a __ ADC #$0a
7121 : 85 1e __ STA ACCU + 3 
7123 : 0a __ __ ASL
7124 : 85 1b __ STA ACCU + 0 
7126 : a9 00 __ LDA #$00
7128 : 2a __ __ ROL
7129 : 06 1b __ ASL ACCU + 0 
712b : 2a __ __ ROL
712c : aa __ __ TAX
712d : a5 1b __ LDA ACCU + 0 
712f : 65 1e __ ADC ACCU + 3 
7131 : 85 43 __ STA T2 + 0 
7133 : 8a __ __ TXA
7134 : 69 00 __ ADC #$00
7136 : 06 43 __ ASL T2 + 0 
7138 : 2a __ __ ROL
7139 : 06 43 __ ASL T2 + 0 
713b : 2a __ __ ROL
713c : 06 43 __ ASL T2 + 0 
713e : 2a __ __ ROL
713f : 85 44 __ STA T2 + 1 
7141 : a5 43 __ LDA T2 + 0 
7143 : 69 b0 __ ADC #$b0
7145 : a8 __ __ TAY
7146 : a5 44 __ LDA T2 + 1 
7148 : 69 03 __ ADC #$03
714a : aa __ __ TAX
714b : 98 __ __ TYA
714c : 18 __ __ CLC
714d : 65 1d __ ADC ACCU + 2 
714f : 85 1b __ STA ACCU + 0 
7151 : 85 1f __ STA ADDR + 0 
7153 : 8a __ __ TXA
7154 : 69 00 __ ADC #$00
7156 : 85 1c __ STA ACCU + 1 
7158 : 18 __ __ CLC
7159 : 69 d4 __ ADC #$d4
715b : 85 20 __ STA ADDR + 1 
715d : a9 63 __ LDA #$63
715f : a0 00 __ LDY #$00
7161 : 91 1b __ STA (ACCU + 0),y 
7163 : a9 0b __ LDA #$0b
7165 : 91 1f __ STA (ADDR + 0),y 
7167 : 38 __ __ SEC
7168 : a5 1e __ LDA ACCU + 3 
716a : e9 01 __ SBC #$01
716c : aa __ __ TAX
716d : b0 01 __ BCS $7170 ; (draw_frame.s48 + 0)
.s47:
716f : 88 __ __ DEY
.s48:
7170 : 0a __ __ ASL
7171 : 85 1b __ STA ACCU + 0 
7173 : 98 __ __ TYA
7174 : 2a __ __ ROL
7175 : 06 1b __ ASL ACCU + 0 
7177 : 2a __ __ ROL
7178 : 85 1c __ STA ACCU + 1 
717a : 8a __ __ TXA
717b : 18 __ __ CLC
717c : 65 1b __ ADC ACCU + 0 
717e : 85 1b __ STA ACCU + 0 
7180 : 98 __ __ TYA
7181 : 65 1c __ ADC ACCU + 1 
7183 : 06 1b __ ASL ACCU + 0 
7185 : 2a __ __ ROL
7186 : 06 1b __ ASL ACCU + 0 
7188 : 2a __ __ ROL
7189 : 06 1b __ ASL ACCU + 0 
718b : 2a __ __ ROL
718c : aa __ __ TAX
718d : 18 __ __ CLC
718e : a5 1b __ LDA ACCU + 0 
7190 : 65 1d __ ADC ACCU + 2 
7192 : a8 __ __ TAY
7193 : 8a __ __ TXA
7194 : 69 04 __ ADC #$04
7196 : 85 1c __ STA ACCU + 1 
7198 : a9 00 __ LDA #$00
719a : 85 1f __ STA ADDR + 0 
719c : 85 1b __ STA ACCU + 0 
719e : a2 07 __ LDX #$07
71a0 : 18 __ __ CLC
.l37:
71a1 : a9 20 __ LDA #$20
71a3 : 91 1b __ STA (ACCU + 0),y 
71a5 : a5 1c __ LDA ACCU + 1 
71a7 : 69 d4 __ ADC #$d4
71a9 : 85 20 __ STA ADDR + 1 
71ab : a9 00 __ LDA #$00
71ad : 91 1f __ STA (ADDR + 0),y 
71af : 98 __ __ TYA
71b0 : 18 __ __ CLC
71b1 : 69 28 __ ADC #$28
71b3 : a8 __ __ TAY
71b4 : 90 03 __ BCC $71b9 ; (draw_frame.s42 + 0)
.s41:
71b6 : e6 1c __ INC ACCU + 1 
71b8 : 18 __ __ CLC
.s42:
71b9 : ca __ __ DEX
71ba : d0 e5 __ BNE $71a1 ; (draw_frame.l37 + 0)
.s38:
71bc : a9 07 __ LDA #$07
71be : 8d f2 86 STA $86f2 ; (df_r + 0)
71c1 : 18 __ __ CLC
71c2 : a5 43 __ LDA T2 + 0 
71c4 : 69 f0 __ ADC #$f0
71c6 : a4 44 __ LDY T2 + 1 
71c8 : 90 02 __ BCC $71cc ; (draw_frame.s44 + 0)
.s43:
71ca : c8 __ __ INY
71cb : 18 __ __ CLC
.s44:
71cc : 65 1d __ ADC ACCU + 2 
71ce : 85 43 __ STA T2 + 0 
71d0 : 98 __ __ TYA
71d1 : 69 04 __ ADC #$04
71d3 : 85 44 __ STA T2 + 1 
71d5 : a9 64 __ LDA #$64
71d7 : a0 00 __ LDY #$00
71d9 : 91 43 __ STA (T2 + 0),y 
71db : 18 __ __ CLC
71dc : a5 44 __ LDA T2 + 1 
71de : 69 d4 __ ADC #$d4
71e0 : 85 44 __ STA T2 + 1 
71e2 : a9 0b __ LDA #$0b
71e4 : 91 43 __ STA (T2 + 0),y 
71e6 : a4 1d __ LDY ACCU + 2 
71e8 : b9 d8 84 LDA $84d8,y ; (scr_letter[0] + 0)
71eb : c9 34 __ CMP #$34
71ed : d0 0e __ BNE $71fd ; (draw_frame.s11 + 0)
.s10:
71ef : a6 49 __ LDX T7 + 0 
71f1 : e8 __ __ INX
71f2 : 8e f0 86 STX $86f0 ; (df_x + 0)
71f5 : e0 28 __ CPX #$28
71f7 : b0 03 __ BCS $71fc ; (draw_frame.s3 + 0)
71f9 : 4c fe 70 JMP $70fe ; (draw_frame.l7 + 0)
.s3:
71fc : 60 __ __ RTS
.s11:
71fd : 8e f2 86 STX $86f2 ; (df_r + 0)
7200 : 85 4a __ STA T8 + 0 
7202 : c9 0d __ CMP #$0d
7204 : 8a __ __ TXA
7205 : 6a __ __ ROR
7206 : 85 4b __ STA T9 + 0 
7208 : a5 45 __ LDA T4 + 0 
720a : 85 43 __ STA T2 + 0 
.l12:
720c : ad f2 86 LDA $86f2 ; (df_r + 0)
720f : 85 4c __ STA T10 + 0 
7211 : a8 __ __ TAY
7212 : 18 __ __ CLC
7213 : 65 1e __ ADC ACCU + 3 
7215 : aa __ __ TAX
7216 : a9 00 __ LDA #$00
7218 : 2a __ __ ROL
7219 : 85 48 __ STA T5 + 1 
721b : 8a __ __ TXA
721c : 0a __ __ ASL
721d : 85 1b __ STA ACCU + 0 
721f : a5 48 __ LDA T5 + 1 
7221 : 2a __ __ ROL
7222 : 06 1b __ ASL ACCU + 0 
7224 : 2a __ __ ROL
7225 : 85 1c __ STA ACCU + 1 
7227 : 8a __ __ TXA
7228 : 18 __ __ CLC
7229 : 65 1b __ ADC ACCU + 0 
722b : 85 47 __ STA T5 + 0 
722d : a5 1c __ LDA ACCU + 1 
722f : 65 48 __ ADC T5 + 1 
7231 : 06 47 __ ASL T5 + 0 
7233 : 2a __ __ ROL
7234 : 06 47 __ ASL T5 + 0 
7236 : 2a __ __ ROL
7237 : 06 47 __ ASL T5 + 0 
7239 : 2a __ __ ROL
723a : aa __ __ TAX
723b : 18 __ __ CLC
723c : a5 47 __ LDA T5 + 0 
723e : 65 1d __ ADC ACCU + 2 
7240 : 85 47 __ STA T5 + 0 
7242 : 90 02 __ BCC $7246 ; (draw_frame.s46 + 0)
.s45:
7244 : e8 __ __ INX
7245 : 18 __ __ CLC
.s46:
7246 : b9 e5 78 LDA $78e5,y ; (__multab40L + 0)
7249 : a4 4a __ LDY T8 + 0 
724b : 79 80 84 ADC $8480,y ; (letter_start[0] + 0)
724e : 18 __ __ CLC
724f : 65 43 __ ADC T2 + 0 
7251 : 85 45 __ STA T4 + 0 
7253 : 24 4b __ BIT T9 + 0 
7255 : 30 0a __ BMI $7261 ; (draw_frame.s13 + 0)
.s34:
7257 : 18 __ __ CLC
7258 : 69 00 __ ADC #$00
725a : 85 1b __ STA ACCU + 0 
725c : a9 85 __ LDA #$85
725e : 4c a7 72 JMP $72a7 ; (draw_frame.s18 + 0)
.s13:
7261 : 98 __ __ TYA
7262 : c0 1a __ CPY #$1a
7264 : b0 0b __ BCS $7271 ; (draw_frame.s14 + 0)
.s33:
7266 : a9 00 __ LDA #$00
7268 : 65 45 __ ADC T4 + 0 
726a : 85 1b __ STA ACCU + 0 
726c : a9 86 __ LDA #$86
726e : 4c a7 72 JMP $72a7 ; (draw_frame.s18 + 0)
.s14:
7271 : c9 28 __ CMP #$28
7273 : b0 0b __ BCS $7280 ; (draw_frame.s15 + 0)
.s32:
7275 : a9 00 __ LDA #$00
7277 : 65 45 __ ADC T4 + 0 
7279 : 85 1b __ STA ACCU + 0 
727b : a9 87 __ LDA #$87
727d : 4c a7 72 JMP $72a7 ; (draw_frame.s18 + 0)
.s15:
7280 : c9 34 __ CMP #$34
7282 : b0 0b __ BCS $728f ; (draw_frame.s16 + 0)
.s31:
7284 : a9 00 __ LDA #$00
7286 : 65 45 __ ADC T4 + 0 
7288 : 85 1b __ STA ACCU + 0 
728a : a9 88 __ LDA #$88
728c : 4c a7 72 JMP $72a7 ; (draw_frame.s18 + 0)
.s16:
728f : c9 47 __ CMP #$47
7291 : 90 0c __ BCC $729f ; (draw_frame.s30 + 0)
.s17:
7293 : 18 __ __ CLC
7294 : a9 00 __ LDA #$00
7296 : 65 45 __ ADC T4 + 0 
7298 : 85 1b __ STA ACCU + 0 
729a : a9 8a __ LDA #$8a
729c : 4c a7 72 JMP $72a7 ; (draw_frame.s18 + 0)
.s30:
729f : a9 00 __ LDA #$00
72a1 : 65 45 __ ADC T4 + 0 
72a3 : 85 1b __ STA ACCU + 0 
72a5 : a9 89 __ LDA #$89
.s18:
72a7 : 69 00 __ ADC #$00
72a9 : 85 1c __ STA ACCU + 1 
72ab : 8a __ __ TXA
72ac : 18 __ __ CLC
72ad : 69 04 __ ADC #$04
72af : 85 48 __ STA T5 + 1 
72b1 : a0 00 __ LDY #$00
72b3 : b1 1b __ LDA (ACCU + 0),y 
72b5 : 91 47 __ STA (T5 + 0),y 
72b7 : 24 4b __ BIT T9 + 0 
72b9 : 30 0c __ BMI $72c7 ; (draw_frame.s19 + 0)
.s29:
72bb : 18 __ __ CLC
72bc : a9 00 __ LDA #$00
72be : 65 45 __ ADC T4 + 0 
72c0 : 85 45 __ STA T4 + 0 
72c2 : a9 8b __ LDA #$8b
72c4 : 4c 0e 73 JMP $730e ; (draw_frame.s24 + 0)
.s19:
72c7 : a5 4a __ LDA T8 + 0 
72c9 : c9 1a __ CMP #$1a
72cb : b0 0b __ BCS $72d8 ; (draw_frame.s20 + 0)
.s28:
72cd : a9 00 __ LDA #$00
72cf : 65 45 __ ADC T4 + 0 
72d1 : 85 45 __ STA T4 + 0 
72d3 : a9 8c __ LDA #$8c
72d5 : 4c 0e 73 JMP $730e ; (draw_frame.s24 + 0)
.s20:
72d8 : c9 28 __ CMP #$28
72da : b0 0b __ BCS $72e7 ; (draw_frame.s21 + 0)
.s27:
72dc : a9 00 __ LDA #$00
72de : 65 45 __ ADC T4 + 0 
72e0 : 85 45 __ STA T4 + 0 
72e2 : a9 8d __ LDA #$8d
72e4 : 4c 0e 73 JMP $730e ; (draw_frame.s24 + 0)
.s21:
72e7 : c9 34 __ CMP #$34
72e9 : b0 0b __ BCS $72f6 ; (draw_frame.s22 + 0)
.s26:
72eb : a9 00 __ LDA #$00
72ed : 65 45 __ ADC T4 + 0 
72ef : 85 45 __ STA T4 + 0 
72f1 : a9 8e __ LDA #$8e
72f3 : 4c 0e 73 JMP $730e ; (draw_frame.s24 + 0)
.s22:
72f6 : c9 47 __ CMP #$47
72f8 : 90 0c __ BCC $7306 ; (draw_frame.s25 + 0)
.s23:
72fa : 18 __ __ CLC
72fb : a9 00 __ LDA #$00
72fd : 65 45 __ ADC T4 + 0 
72ff : 85 45 __ STA T4 + 0 
7301 : a9 90 __ LDA #$90
7303 : 4c 0e 73 JMP $730e ; (draw_frame.s24 + 0)
.s25:
7306 : a9 00 __ LDA #$00
7308 : 65 45 __ ADC T4 + 0 
730a : 85 45 __ STA T4 + 0 
730c : a9 8f __ LDA #$8f
.s24:
730e : 69 00 __ ADC #$00
7310 : 85 46 __ STA T4 + 1 
7312 : 18 __ __ CLC
7313 : a5 48 __ LDA T5 + 1 
7315 : 69 d4 __ ADC #$d4
7317 : 85 48 __ STA T5 + 1 
7319 : b1 45 __ LDA (T4 + 0),y 
731b : 91 47 __ STA (T5 + 0),y 
731d : a6 4c __ LDX T10 + 0 
731f : e8 __ __ INX
7320 : 8e f2 86 STX $86f2 ; (df_r + 0)
7323 : e0 05 __ CPX #$05
7325 : b0 03 __ BCS $732a ; (draw_frame.s24 + 28)
7327 : 4c 0c 72 JMP $720c ; (draw_frame.l12 + 0)
732a : 4c ef 71 JMP $71ef ; (draw_frame.s10 + 0)
--------------------------------------------------------------------
modplay_stop: ; modplay_stop()->void
; 249, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s4:
732d : 78 __ __ SEI
732e : a9 00 __ LDA #$00
7330 : 8d 98 98 STA $9898 ; (modplay.active + 0)
7333 : 8d 20 df STA $df20 
7336 : 8d 40 df STA $df40 
7339 : 8d 60 df STA $df60 
733c : 8d 80 df STA $df80 
733f : ad fe 7d LDA $7dfe ; (mod_saved_irq[0] + 0)
7342 : 8d 14 03 STA $0314 
7345 : ad ff 7d LDA $7dff ; (mod_saved_irq[0] + 1)
7348 : 8d 15 03 STA $0315 
734b : a9 7f __ LDA #$7f
734d : 8d 0d dc STA $dc0d 
7350 : a9 25 __ LDA #$25
7352 : 8d 04 dc STA $dc04 
7355 : a9 4d __ LDA #$4d
7357 : 8d 05 dc STA $dc05 
735a : a9 81 __ LDA #$81
735c : 8d 0d dc STA $dc0d 
735f : a9 01 __ LDA #$01
7361 : 8d 0e dc STA $dc0e 
7364 : 58 __ __ CLI
.s3:
7365 : 60 __ __ RTS
--------------------------------------------------------------------
7366 : __ __ __ BYT 65 4e 44 20 4f 46 20 64 45 4d 4f 20 73 45 51 55 : eND OF dEMO sEQU
7376 : __ __ __ BYT 45 4e 43 45 00                                  : ENCE.
--------------------------------------------------------------------
737b : __ __ __ BYT 64 45 4d 4f 20 53 45 51 55 45 4e 43 45 20 43 4f : dEMO SEQUENCE CO
738b : __ __ __ BYT 4d 50 4c 45 54 45 2e 00                         : MPLETE..
--------------------------------------------------------------------
7393 : __ __ __ BYT 67 45 41 52 20 00                               : gEAR .
--------------------------------------------------------------------
7399 : __ __ __ BYT 31 20 54 4f 20 36 34 20 6d 68 5a 2c 20 31 36 20 : 1 TO 64 mhZ, 16 
73a9 : __ __ __ BYT 53 54 45 50 53 00                               : STEPS.
--------------------------------------------------------------------
73af : __ __ __ BYT 62 41 4c 4c 20 00                               : bALL .
--------------------------------------------------------------------
73b5 : __ __ __ BYT 33 64 20 42 41 4c 4c 20 2b 20 47 52 49 44 00    : 3d BALL + GRID.
--------------------------------------------------------------------
73c4 : __ __ __ BYT 76 45 43 54 20 00                               : vECT .
--------------------------------------------------------------------
73ca : __ __ __ BYT 33 64 20 57 49 52 45 46 52 41 4d 45 20 43 55 42 : 3d WIREFRAME CUB
73da : __ __ __ BYT 45 00                                           : E.
--------------------------------------------------------------------
73dc : __ __ __ BYT 70 4c 41 53 20 00                               : pLAS .
--------------------------------------------------------------------
73e2 : __ __ __ BYT 70 4c 41 53 4d 41 20 49 4e 54 45 52 46 45 52 45 : pLASMA INTERFERE
73f2 : __ __ __ BYT 4e 43 45 00                                     : NCE.
--------------------------------------------------------------------
73f6 : __ __ __ BYT 66 52 41 43 54 00                               : fRACT.
--------------------------------------------------------------------
__multab50L:
73fc : __ __ __ BYT 00 32 64 96                                     : .2d.
--------------------------------------------------------------------
7400 : __ __ __ BYT 6d 41 4e 44 45 4c 42 52 4f 54 20 6d 63 20 46 52 : mANDELBROT mc FR
7410 : __ __ __ BYT 41 43 54 41 4c 00                               : ACTAL.
--------------------------------------------------------------------
7416 : __ __ __ BYT 74 55 4e 4c 20 00                               : tUNL .
--------------------------------------------------------------------
741c : __ __ __ BYT 33 64 20 54 45 58 54 55 52 45 20 54 55 4e 4e 45 : 3d TEXTURE TUNNE
742c : __ __ __ BYT 4c 00                                           : L.
--------------------------------------------------------------------
742e : __ __ __ BYT 34 45 56 2e 4d 4f 44 3a 20 46 4f 52 45 56 45 52 : 4EV.MOD: FOREVER
743e : __ __ __ BYT 20 59 4f 55 4e 47 00                            :  YOUNG.
--------------------------------------------------------------------
7445 : __ __ __ BYT 75 4c 54 49 4d 41 54 45 20 36 34 20 41 54 20 36 : uLTIMATE 64 AT 6
7455 : __ __ __ BYT 34 20 6d 68 5a 20 54 55 52 42 4f 3a 00          : 4 mhZ TURBO:.
--------------------------------------------------------------------
7462 : __ __ __ BYT 54 48 45 20 46 41 53 54 45 53 54 20 63 36 34 20 : THE FASTEST c64 
7472 : __ __ __ BYT 43 4f 4d 50 41 54 49 42 4c 45 2e 00             : COMPATIBLE..
--------------------------------------------------------------------
mul16by8: ; mul16by8
747e : 4a __ __ LSR
747f : f0 2e __ BEQ $74af ; (mul16by8 + 49)
7481 : a2 00 __ LDX #$00
7483 : a0 00 __ LDY #$00
7485 : 90 13 __ BCC $749a ; (mul16by8 + 28)
7487 : a4 1b __ LDY ACCU + 0 
7489 : a6 1c __ LDX ACCU + 1 
748b : b0 0d __ BCS $749a ; (mul16by8 + 28)
748d : 85 02 __ STA $02 
748f : 18 __ __ CLC
7490 : 98 __ __ TYA
7491 : 65 1b __ ADC ACCU + 0 
7493 : a8 __ __ TAY
7494 : 8a __ __ TXA
7495 : 65 1c __ ADC ACCU + 1 
7497 : aa __ __ TAX
7498 : a5 02 __ LDA $02 
749a : 06 1b __ ASL ACCU + 0 
749c : 26 1c __ ROL ACCU + 1 
749e : 4a __ __ LSR
749f : 90 f9 __ BCC $749a ; (mul16by8 + 28)
74a1 : d0 ea __ BNE $748d ; (mul16by8 + 15)
74a3 : 18 __ __ CLC
74a4 : 98 __ __ TYA
74a5 : 65 1b __ ADC ACCU + 0 
74a7 : 85 1b __ STA ACCU + 0 
74a9 : 8a __ __ TXA
74aa : 65 1c __ ADC ACCU + 1 
74ac : 85 1c __ STA ACCU + 1 
74ae : 60 __ __ RTS
74af : b0 04 __ BCS $74b5 ; (mul16by8 + 55)
74b1 : 85 1b __ STA ACCU + 0 
74b3 : 85 1c __ STA ACCU + 1 
74b5 : 60 __ __ RTS
--------------------------------------------------------------------
mul32by8: ; mul32by8
74b6 : a0 00 __ LDY #$00
74b8 : 84 07 __ STY WORK + 4 
74ba : 84 08 __ STY WORK + 5 
74bc : 84 09 __ STY WORK + 6 
74be : 4a __ __ LSR
74bf : b0 0d __ BCS $74ce ; (mul32by8 + 24)
74c1 : f0 26 __ BEQ $74e9 ; (mul32by8 + 51)
74c3 : 06 1b __ ASL ACCU + 0 
74c5 : 26 1c __ ROL ACCU + 1 
74c7 : 26 1d __ ROL ACCU + 2 
74c9 : 26 1e __ ROL ACCU + 3 
74cb : 4a __ __ LSR
74cc : 90 f5 __ BCC $74c3 ; (mul32by8 + 13)
74ce : aa __ __ TAX
74cf : 18 __ __ CLC
74d0 : a5 07 __ LDA WORK + 4 
74d2 : 65 1b __ ADC ACCU + 0 
74d4 : 85 07 __ STA WORK + 4 
74d6 : a5 08 __ LDA WORK + 5 
74d8 : 65 1c __ ADC ACCU + 1 
74da : 85 08 __ STA WORK + 5 
74dc : a5 09 __ LDA WORK + 6 
74de : 65 1d __ ADC ACCU + 2 
74e0 : 85 09 __ STA WORK + 6 
74e2 : 98 __ __ TYA
74e3 : 65 1e __ ADC ACCU + 3 
74e5 : a8 __ __ TAY
74e6 : 8a __ __ TXA
74e7 : d0 da __ BNE $74c3 ; (mul32by8 + 13)
74e9 : 84 0a __ STY WORK + 7 
74eb : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
74ec : a0 00 __ LDY #$00
74ee : 84 06 __ STY WORK + 3 
74f0 : a5 03 __ LDA WORK + 0 
74f2 : a6 04 __ LDX WORK + 1 
74f4 : f0 1c __ BEQ $7512 ; (mul16 + 38)
74f6 : 38 __ __ SEC
74f7 : 6a __ __ ROR
74f8 : 90 0d __ BCC $7507 ; (mul16 + 27)
74fa : aa __ __ TAX
74fb : 18 __ __ CLC
74fc : 98 __ __ TYA
74fd : 65 1b __ ADC ACCU + 0 
74ff : a8 __ __ TAY
7500 : a5 06 __ LDA WORK + 3 
7502 : 65 1c __ ADC ACCU + 1 
7504 : 85 06 __ STA WORK + 3 
7506 : 8a __ __ TXA
7507 : 06 1b __ ASL ACCU + 0 
7509 : 26 1c __ ROL ACCU + 1 
750b : 4a __ __ LSR
750c : 90 f9 __ BCC $7507 ; (mul16 + 27)
750e : d0 ea __ BNE $74fa ; (mul16 + 14)
7510 : a5 04 __ LDA WORK + 1 
7512 : 4a __ __ LSR
7513 : 90 0d __ BCC $7522 ; (mul16 + 54)
7515 : aa __ __ TAX
7516 : 18 __ __ CLC
7517 : 98 __ __ TYA
7518 : 65 1b __ ADC ACCU + 0 
751a : a8 __ __ TAY
751b : a5 06 __ LDA WORK + 3 
751d : 65 1c __ ADC ACCU + 1 
751f : 85 06 __ STA WORK + 3 
7521 : 8a __ __ TXA
7522 : 06 1b __ ASL ACCU + 0 
7524 : 26 1c __ ROL ACCU + 1 
7526 : 4a __ __ LSR
7527 : b0 ec __ BCS $7515 ; (mul16 + 41)
7529 : d0 f7 __ BNE $7522 ; (mul16 + 54)
752b : 84 05 __ STY WORK + 2 
752d : 60 __ __ RTS
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
752e : a9 7f __ LDA #$7f
7530 : 85 03 __ STA WORK + 0 
--------------------------------------------------------------------
divs16: ; divs16
7532 : 24 1c __ BIT ACCU + 1 
7534 : 10 0d __ BPL $7543 ; (divs16 + 17)
7536 : 20 4d 75 JSR $754d ; (negaccu + 0)
7539 : 24 04 __ BIT WORK + 1 
753b : 10 0d __ BPL $754a ; (divs16 + 24)
753d : 20 5b 75 JSR $755b ; (negtmp + 0)
7540 : 4c 6d 75 JMP $756d ; (divmod + 0)
7543 : 24 04 __ BIT WORK + 1 
7545 : 10 f9 __ BPL $7540 ; (divs16 + 14)
7547 : 20 5b 75 JSR $755b ; (negtmp + 0)
754a : 20 6d 75 JSR $756d ; (divmod + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
754d : 38 __ __ SEC
754e : a9 00 __ LDA #$00
7550 : e5 1b __ SBC ACCU + 0 
7552 : 85 1b __ STA ACCU + 0 
7554 : a9 00 __ LDA #$00
7556 : e5 1c __ SBC ACCU + 1 
7558 : 85 1c __ STA ACCU + 1 
755a : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
755b : 38 __ __ SEC
755c : a9 00 __ LDA #$00
755e : e5 03 __ SBC WORK + 0 
7560 : 85 03 __ STA WORK + 0 
7562 : a9 00 __ LDA #$00
7564 : e5 04 __ SBC WORK + 1 
7566 : 85 04 __ STA WORK + 1 
7568 : 60 __ __ RTS
--------------------------------------------------------------------
divmod@proxy: ; divmod@proxy
7569 : a9 00 __ LDA #$00
756b : 85 04 __ STA WORK + 1 
--------------------------------------------------------------------
divmod: ; divmod
756d : a5 1c __ LDA ACCU + 1 
756f : d0 31 __ BNE $75a2 ; (divmod + 53)
7571 : a5 04 __ LDA WORK + 1 
7573 : d0 1e __ BNE $7593 ; (divmod + 38)
7575 : 85 06 __ STA WORK + 3 
7577 : a2 04 __ LDX #$04
7579 : 06 1b __ ASL ACCU + 0 
757b : 2a __ __ ROL
757c : c5 03 __ CMP WORK + 0 
757e : 90 02 __ BCC $7582 ; (divmod + 21)
7580 : e5 03 __ SBC WORK + 0 
7582 : 26 1b __ ROL ACCU + 0 
7584 : 2a __ __ ROL
7585 : c5 03 __ CMP WORK + 0 
7587 : 90 02 __ BCC $758b ; (divmod + 30)
7589 : e5 03 __ SBC WORK + 0 
758b : 26 1b __ ROL ACCU + 0 
758d : ca __ __ DEX
758e : d0 eb __ BNE $757b ; (divmod + 14)
7590 : 85 05 __ STA WORK + 2 
7592 : 60 __ __ RTS
7593 : a5 1b __ LDA ACCU + 0 
7595 : 85 05 __ STA WORK + 2 
7597 : a5 1c __ LDA ACCU + 1 
7599 : 85 06 __ STA WORK + 3 
759b : a9 00 __ LDA #$00
759d : 85 1b __ STA ACCU + 0 
759f : 85 1c __ STA ACCU + 1 
75a1 : 60 __ __ RTS
75a2 : a5 04 __ LDA WORK + 1 
75a4 : d0 1f __ BNE $75c5 ; (divmod + 88)
75a6 : a5 03 __ LDA WORK + 0 
75a8 : 30 1b __ BMI $75c5 ; (divmod + 88)
75aa : a9 00 __ LDA #$00
75ac : 85 06 __ STA WORK + 3 
75ae : a2 10 __ LDX #$10
75b0 : 06 1b __ ASL ACCU + 0 
75b2 : 26 1c __ ROL ACCU + 1 
75b4 : 2a __ __ ROL
75b5 : c5 03 __ CMP WORK + 0 
75b7 : 90 02 __ BCC $75bb ; (divmod + 78)
75b9 : e5 03 __ SBC WORK + 0 
75bb : 26 1b __ ROL ACCU + 0 
75bd : 26 1c __ ROL ACCU + 1 
75bf : ca __ __ DEX
75c0 : d0 f2 __ BNE $75b4 ; (divmod + 71)
75c2 : 85 05 __ STA WORK + 2 
75c4 : 60 __ __ RTS
75c5 : a9 00 __ LDA #$00
75c7 : 85 05 __ STA WORK + 2 
75c9 : 85 06 __ STA WORK + 3 
75cb : 84 02 __ STY $02 
75cd : a0 10 __ LDY #$10
75cf : 18 __ __ CLC
75d0 : 26 1b __ ROL ACCU + 0 
75d2 : 26 1c __ ROL ACCU + 1 
75d4 : 26 05 __ ROL WORK + 2 
75d6 : 26 06 __ ROL WORK + 3 
75d8 : 38 __ __ SEC
75d9 : a5 05 __ LDA WORK + 2 
75db : e5 03 __ SBC WORK + 0 
75dd : aa __ __ TAX
75de : a5 06 __ LDA WORK + 3 
75e0 : e5 04 __ SBC WORK + 1 
75e2 : 90 04 __ BCC $75e8 ; (divmod + 123)
75e4 : 86 05 __ STX WORK + 2 
75e6 : 85 06 __ STA WORK + 3 
75e8 : 88 __ __ DEY
75e9 : d0 e5 __ BNE $75d0 ; (divmod + 99)
75eb : 26 1b __ ROL ACCU + 0 
75ed : 26 1c __ ROL ACCU + 1 
75ef : a4 02 __ LDY $02 
75f1 : 60 __ __ RTS
--------------------------------------------------------------------
mul32: ; mul32
75f2 : a5 04 __ LDA WORK + 1 
75f4 : 05 05 __ ORA WORK + 2 
75f6 : 05 06 __ ORA WORK + 3 
75f8 : d0 05 __ BNE $75ff ; (mul32 + 13)
75fa : a5 03 __ LDA WORK + 0 
75fc : 4c b6 74 JMP $74b6 ; (mul32by8 + 0)
75ff : a0 00 __ LDY #$00
7601 : 84 07 __ STY WORK + 4 
7603 : 84 08 __ STY WORK + 5 
7605 : 98 __ __ TYA
7606 : 38 __ __ SEC
7607 : 66 03 __ ROR WORK + 0 
7609 : 90 15 __ BCC $7620 ; (mul32 + 46)
760b : aa __ __ TAX
760c : 18 __ __ CLC
760d : a5 07 __ LDA WORK + 4 
760f : 65 1b __ ADC ACCU + 0 
7611 : 85 07 __ STA WORK + 4 
7613 : a5 08 __ LDA WORK + 5 
7615 : 65 1c __ ADC ACCU + 1 
7617 : 85 08 __ STA WORK + 5 
7619 : 98 __ __ TYA
761a : 65 1d __ ADC ACCU + 2 
761c : a8 __ __ TAY
761d : 8a __ __ TXA
761e : 65 1e __ ADC ACCU + 3 
7620 : 46 04 __ LSR WORK + 1 
7622 : 90 0f __ BCC $7633 ; (mul32 + 65)
7624 : aa __ __ TAX
7625 : 18 __ __ CLC
7626 : a5 08 __ LDA WORK + 5 
7628 : 65 1b __ ADC ACCU + 0 
762a : 85 08 __ STA WORK + 5 
762c : 98 __ __ TYA
762d : 65 1c __ ADC ACCU + 1 
762f : a8 __ __ TAY
7630 : 8a __ __ TXA
7631 : 65 1d __ ADC ACCU + 2 
7633 : 46 05 __ LSR WORK + 2 
7635 : 90 09 __ BCC $7640 ; (mul32 + 78)
7637 : aa __ __ TAX
7638 : 18 __ __ CLC
7639 : 98 __ __ TYA
763a : 65 1b __ ADC ACCU + 0 
763c : a8 __ __ TAY
763d : 8a __ __ TXA
763e : 65 1c __ ADC ACCU + 1 
7640 : 46 06 __ LSR WORK + 3 
7642 : 90 03 __ BCC $7647 ; (mul32 + 85)
7644 : 18 __ __ CLC
7645 : 65 1b __ ADC ACCU + 0 
7647 : 06 1b __ ASL ACCU + 0 
7649 : 26 1c __ ROL ACCU + 1 
764b : 26 1d __ ROL ACCU + 2 
764d : 26 1e __ ROL ACCU + 3 
764f : 46 03 __ LSR WORK + 0 
7651 : 90 cd __ BCC $7620 ; (mul32 + 46)
7653 : d0 b6 __ BNE $760b ; (mul32 + 25)
7655 : 84 09 __ STY WORK + 6 
7657 : 85 0a __ STA WORK + 7 
7659 : 60 __ __ RTS
--------------------------------------------------------------------
divs32: ; divs32
765a : 24 1e __ BIT ACCU + 3 
765c : 10 0d __ BPL $766b ; (divs32 + 17)
765e : 20 75 76 JSR $7675 ; (negaccu32 + 0)
7661 : 24 06 __ BIT WORK + 3 
7663 : 10 0d __ BPL $7672 ; (divs32 + 24)
7665 : 20 8f 76 JSR $768f ; (negtmp32 + 0)
7668 : 4c 53 3f JMP $3f53 ; (divmod32 + 0)
766b : 24 06 __ BIT WORK + 3 
766d : 10 f9 __ BPL $7668 ; (divs32 + 14)
766f : 20 8f 76 JSR $768f ; (negtmp32 + 0)
7672 : 20 53 3f JSR $3f53 ; (divmod32 + 0)
--------------------------------------------------------------------
negaccu32: ; negaccu32
7675 : 38 __ __ SEC
7676 : a9 00 __ LDA #$00
7678 : e5 1b __ SBC ACCU + 0 
767a : 85 1b __ STA ACCU + 0 
767c : a9 00 __ LDA #$00
767e : e5 1c __ SBC ACCU + 1 
7680 : 85 1c __ STA ACCU + 1 
7682 : a9 00 __ LDA #$00
7684 : e5 1d __ SBC ACCU + 2 
7686 : 85 1d __ STA ACCU + 2 
7688 : a9 00 __ LDA #$00
768a : e5 1e __ SBC ACCU + 3 
768c : 85 1e __ STA ACCU + 3 
768e : 60 __ __ RTS
--------------------------------------------------------------------
negtmp32: ; negtmp32
768f : 38 __ __ SEC
7690 : a9 00 __ LDA #$00
7692 : e5 03 __ SBC WORK + 0 
7694 : 85 03 __ STA WORK + 0 
7696 : a9 00 __ LDA #$00
7698 : e5 04 __ SBC WORK + 1 
769a : 85 04 __ STA WORK + 1 
769c : a9 00 __ LDA #$00
769e : e5 05 __ SBC WORK + 2 
76a0 : 85 05 __ STA WORK + 2 
76a2 : a9 00 __ LDA #$00
76a4 : e5 06 __ SBC WORK + 3 
76a6 : 85 06 __ STA WORK + 3 
76a8 : 60 __ __ RTS
--------------------------------------------------------------------
crt_malloc: ; crt_malloc
76a9 : 18 __ __ CLC
76aa : a5 1b __ LDA ACCU + 0 
76ac : 69 0d __ ADC #$0d
76ae : 29 fc __ AND #$fc
76b0 : 85 03 __ STA WORK + 0 
76b2 : a5 1c __ LDA ACCU + 1 
76b4 : 69 00 __ ADC #$00
76b6 : 85 04 __ STA WORK + 1 
76b8 : ad f5 86 LDA $86f5 ; (HeapNode.end + 0)
76bb : d0 26 __ BNE $76e3 ; (crt_malloc + 58)
76bd : a9 00 __ LDA #$00
76bf : 8d a2 a3 STA $a3a2 
76c2 : 8d a3 a3 STA $a3a3 
76c5 : ee f5 86 INC $86f5 ; (HeapNode.end + 0)
76c8 : a9 a0 __ LDA #$a0
76ca : 09 02 __ ORA #$02
76cc : 8d f3 86 STA $86f3 ; (HeapNode.next + 0)
76cf : a9 a3 __ LDA #$a3
76d1 : 8d f4 86 STA $86f4 ; (HeapNode.next + 1)
76d4 : 38 __ __ SEC
76d5 : a9 00 __ LDA #$00
76d7 : e9 02 __ SBC #$02
76d9 : 8d a4 a3 STA $a3a4 
76dc : a9 b0 __ LDA #$b0
76de : e9 00 __ SBC #$00
76e0 : 8d a5 a3 STA $a3a5 
76e3 : a9 f3 __ LDA #$f3
76e5 : a2 86 __ LDX #$86
76e7 : 85 1d __ STA ACCU + 2 
76e9 : 86 1e __ STX ACCU + 3 
76eb : 18 __ __ CLC
76ec : a0 00 __ LDY #$00
76ee : b1 1d __ LDA (ACCU + 2),y 
76f0 : 85 1b __ STA ACCU + 0 
76f2 : 65 03 __ ADC WORK + 0 
76f4 : 85 05 __ STA WORK + 2 
76f6 : c8 __ __ INY
76f7 : b1 1d __ LDA (ACCU + 2),y 
76f9 : 85 1c __ STA ACCU + 1 
76fb : f0 20 __ BEQ $771d ; (crt_malloc + 116)
76fd : 65 04 __ ADC WORK + 1 
76ff : 85 06 __ STA WORK + 3 
7701 : b0 14 __ BCS $7717 ; (crt_malloc + 110)
7703 : a0 02 __ LDY #$02
7705 : b1 1b __ LDA (ACCU + 0),y 
7707 : c5 05 __ CMP WORK + 2 
7709 : c8 __ __ INY
770a : b1 1b __ LDA (ACCU + 0),y 
770c : e5 06 __ SBC WORK + 3 
770e : b0 0f __ BCS $771f ; (crt_malloc + 118)
7710 : a5 1b __ LDA ACCU + 0 
7712 : a6 1c __ LDX ACCU + 1 
7714 : 4c e7 76 JMP $76e7 ; (crt_malloc + 62)
7717 : a9 00 __ LDA #$00
7719 : 85 1b __ STA ACCU + 0 
771b : 85 1c __ STA ACCU + 1 
771d : 02 __ __ INV
771e : 60 __ __ RTS
771f : a5 05 __ LDA WORK + 2 
7721 : 85 07 __ STA WORK + 4 
7723 : a5 06 __ LDA WORK + 3 
7725 : 85 08 __ STA WORK + 5 
7727 : a0 02 __ LDY #$02
7729 : a5 07 __ LDA WORK + 4 
772b : d1 1b __ CMP (ACCU + 0),y 
772d : d0 15 __ BNE $7744 ; (crt_malloc + 155)
772f : c8 __ __ INY
7730 : a5 08 __ LDA WORK + 5 
7732 : d1 1b __ CMP (ACCU + 0),y 
7734 : d0 0e __ BNE $7744 ; (crt_malloc + 155)
7736 : a0 00 __ LDY #$00
7738 : b1 1b __ LDA (ACCU + 0),y 
773a : 91 1d __ STA (ACCU + 2),y 
773c : c8 __ __ INY
773d : b1 1b __ LDA (ACCU + 0),y 
773f : 91 1d __ STA (ACCU + 2),y 
7741 : 4c 61 77 JMP $7761 ; (crt_malloc + 184)
7744 : a0 00 __ LDY #$00
7746 : b1 1b __ LDA (ACCU + 0),y 
7748 : 91 07 __ STA (WORK + 4),y 
774a : a5 07 __ LDA WORK + 4 
774c : 91 1d __ STA (ACCU + 2),y 
774e : c8 __ __ INY
774f : b1 1b __ LDA (ACCU + 0),y 
7751 : 91 07 __ STA (WORK + 4),y 
7753 : a5 08 __ LDA WORK + 5 
7755 : 91 1d __ STA (ACCU + 2),y 
7757 : c8 __ __ INY
7758 : b1 1b __ LDA (ACCU + 0),y 
775a : 91 07 __ STA (WORK + 4),y 
775c : c8 __ __ INY
775d : b1 1b __ LDA (ACCU + 0),y 
775f : 91 07 __ STA (WORK + 4),y 
7761 : a0 00 __ LDY #$00
7763 : a5 05 __ LDA WORK + 2 
7765 : 91 1b __ STA (ACCU + 0),y 
7767 : c8 __ __ INY
7768 : a5 06 __ LDA WORK + 3 
776a : 91 1b __ STA (ACCU + 0),y 
776c : a0 02 __ LDY #$02
776e : a9 bd __ LDA #$bd
7770 : 91 1b __ STA (ACCU + 0),y 
7772 : c8 __ __ INY
7773 : 91 1b __ STA (ACCU + 0),y 
7775 : c8 __ __ INY
7776 : 91 1b __ STA (ACCU + 0),y 
7778 : c8 __ __ INY
7779 : 91 1b __ STA (ACCU + 0),y 
777b : 38 __ __ SEC
777c : a5 05 __ LDA WORK + 2 
777e : e9 04 __ SBC #$04
7780 : 85 05 __ STA WORK + 2 
7782 : b0 02 __ BCS $7786 ; (crt_malloc + 221)
7784 : c6 06 __ DEC WORK + 3 
7786 : a9 be __ LDA #$be
7788 : a0 00 __ LDY #$00
778a : 91 05 __ STA (WORK + 2),y 
778c : c8 __ __ INY
778d : 91 05 __ STA (WORK + 2),y 
778f : c8 __ __ INY
7790 : 91 05 __ STA (WORK + 2),y 
7792 : c8 __ __ INY
7793 : 91 05 __ STA (WORK + 2),y 
7795 : 18 __ __ CLC
7796 : a5 1b __ LDA ACCU + 0 
7798 : 69 06 __ ADC #$06
779a : 85 1b __ STA ACCU + 0 
779c : 90 02 __ BCC $77a0 ; (crt_malloc + 247)
779e : e6 1c __ INC ACCU + 1 
77a0 : 60 __ __ RTS
--------------------------------------------------------------------
crt_free@proxy: ; crt_free@proxy
77a1 : a5 0d __ LDA P0 
77a3 : 85 1b __ STA ACCU + 0 
77a5 : a5 0e __ LDA P1 
77a7 : 85 1c __ STA ACCU + 1 
--------------------------------------------------------------------
crt_free: ; crt_free
77a9 : a5 1b __ LDA ACCU + 0 
77ab : 05 1c __ ORA ACCU + 1 
77ad : d0 01 __ BNE $77b0 ; (crt_free + 7)
77af : 60 __ __ RTS
77b0 : 38 __ __ SEC
77b1 : a5 1b __ LDA ACCU + 0 
77b3 : 29 03 __ AND #$03
77b5 : d0 56 __ BNE $780d ; (crt_free + 100)
77b7 : a5 1b __ LDA ACCU + 0 
77b9 : e9 06 __ SBC #$06
77bb : 85 1b __ STA ACCU + 0 
77bd : b0 02 __ BCS $77c1 ; (crt_free + 24)
77bf : c6 1c __ DEC ACCU + 1 
77c1 : a0 02 __ LDY #$02
77c3 : a9 bd __ LDA #$bd
77c5 : d1 1b __ CMP (ACCU + 0),y 
77c7 : d0 44 __ BNE $780d ; (crt_free + 100)
77c9 : c8 __ __ INY
77ca : d1 1b __ CMP (ACCU + 0),y 
77cc : d0 3f __ BNE $780d ; (crt_free + 100)
77ce : c8 __ __ INY
77cf : d1 1b __ CMP (ACCU + 0),y 
77d1 : d0 3a __ BNE $780d ; (crt_free + 100)
77d3 : c8 __ __ INY
77d4 : d1 1b __ CMP (ACCU + 0),y 
77d6 : d0 35 __ BNE $780d ; (crt_free + 100)
77d8 : a0 00 __ LDY #$00
77da : 38 __ __ SEC
77db : b1 1b __ LDA (ACCU + 0),y 
77dd : e9 04 __ SBC #$04
77df : 85 03 __ STA WORK + 0 
77e1 : c8 __ __ INY
77e2 : b1 1b __ LDA (ACCU + 0),y 
77e4 : e9 00 __ SBC #$00
77e6 : 85 04 __ STA WORK + 1 
77e8 : a0 00 __ LDY #$00
77ea : a9 be __ LDA #$be
77ec : d1 03 __ CMP (WORK + 0),y 
77ee : d0 1d __ BNE $780d ; (crt_free + 100)
77f0 : c8 __ __ INY
77f1 : d1 03 __ CMP (WORK + 0),y 
77f3 : d0 18 __ BNE $780d ; (crt_free + 100)
77f5 : c8 __ __ INY
77f6 : d1 03 __ CMP (WORK + 0),y 
77f8 : d0 13 __ BNE $780d ; (crt_free + 100)
77fa : c8 __ __ INY
77fb : d1 03 __ CMP (WORK + 0),y 
77fd : d0 0e __ BNE $780d ; (crt_free + 100)
77ff : a5 1c __ LDA ACCU + 1 
7801 : a6 1b __ LDX ACCU + 0 
7803 : c9 a3 __ CMP #$a3
7805 : 90 06 __ BCC $780d ; (crt_free + 100)
7807 : d0 05 __ BNE $780e ; (crt_free + 101)
7809 : e0 a0 __ CPX #$a0
780b : b0 01 __ BCS $780e ; (crt_free + 101)
780d : 02 __ __ INV
780e : c9 b0 __ CMP #$b0
7810 : 90 06 __ BCC $7818 ; (crt_free + 111)
7812 : d0 f9 __ BNE $780d ; (crt_free + 100)
7814 : e0 00 __ CPX #$00
7816 : b0 f5 __ BCS $780d ; (crt_free + 100)
7818 : a0 02 __ LDY #$02
781a : a9 bf __ LDA #$bf
781c : 91 1b __ STA (ACCU + 0),y 
781e : c8 __ __ INY
781f : 91 1b __ STA (ACCU + 0),y 
7821 : a0 00 __ LDY #$00
7823 : b1 1b __ LDA (ACCU + 0),y 
7825 : 85 1d __ STA ACCU + 2 
7827 : c8 __ __ INY
7828 : b1 1b __ LDA (ACCU + 0),y 
782a : 85 1e __ STA ACCU + 3 
782c : a9 f3 __ LDA #$f3
782e : a2 86 __ LDX #$86
7830 : 85 05 __ STA WORK + 2 
7832 : 86 06 __ STX WORK + 3 
7834 : a0 01 __ LDY #$01
7836 : b1 05 __ LDA (WORK + 2),y 
7838 : f0 28 __ BEQ $7862 ; (crt_free + 185)
783a : aa __ __ TAX
783b : 88 __ __ DEY
783c : b1 05 __ LDA (WORK + 2),y 
783e : e4 1e __ CPX ACCU + 3 
7840 : 90 ee __ BCC $7830 ; (crt_free + 135)
7842 : d0 1e __ BNE $7862 ; (crt_free + 185)
7844 : c5 1d __ CMP ACCU + 2 
7846 : 90 e8 __ BCC $7830 ; (crt_free + 135)
7848 : d0 18 __ BNE $7862 ; (crt_free + 185)
784a : a0 00 __ LDY #$00
784c : b1 1d __ LDA (ACCU + 2),y 
784e : 91 1b __ STA (ACCU + 0),y 
7850 : c8 __ __ INY
7851 : b1 1d __ LDA (ACCU + 2),y 
7853 : 91 1b __ STA (ACCU + 0),y 
7855 : c8 __ __ INY
7856 : b1 1d __ LDA (ACCU + 2),y 
7858 : 91 1b __ STA (ACCU + 0),y 
785a : c8 __ __ INY
785b : b1 1d __ LDA (ACCU + 2),y 
785d : 91 1b __ STA (ACCU + 0),y 
785f : 4c 77 78 JMP $7877 ; (crt_free + 206)
7862 : a0 00 __ LDY #$00
7864 : b1 05 __ LDA (WORK + 2),y 
7866 : 91 1b __ STA (ACCU + 0),y 
7868 : c8 __ __ INY
7869 : b1 05 __ LDA (WORK + 2),y 
786b : 91 1b __ STA (ACCU + 0),y 
786d : c8 __ __ INY
786e : a5 1d __ LDA ACCU + 2 
7870 : 91 1b __ STA (ACCU + 0),y 
7872 : c8 __ __ INY
7873 : a5 1e __ LDA ACCU + 3 
7875 : 91 1b __ STA (ACCU + 0),y 
7877 : a0 02 __ LDY #$02
7879 : b1 05 __ LDA (WORK + 2),y 
787b : c5 1b __ CMP ACCU + 0 
787d : d0 1d __ BNE $789c ; (crt_free + 243)
787f : c8 __ __ INY
7880 : b1 05 __ LDA (WORK + 2),y 
7882 : c5 1c __ CMP ACCU + 1 
7884 : d0 16 __ BNE $789c ; (crt_free + 243)
7886 : a0 00 __ LDY #$00
7888 : b1 1b __ LDA (ACCU + 0),y 
788a : 91 05 __ STA (WORK + 2),y 
788c : c8 __ __ INY
788d : b1 1b __ LDA (ACCU + 0),y 
788f : 91 05 __ STA (WORK + 2),y 
7891 : c8 __ __ INY
7892 : b1 1b __ LDA (ACCU + 0),y 
7894 : 91 05 __ STA (WORK + 2),y 
7896 : c8 __ __ INY
7897 : b1 1b __ LDA (ACCU + 0),y 
7899 : 91 05 __ STA (WORK + 2),y 
789b : 60 __ __ RTS
789c : a0 00 __ LDY #$00
789e : a5 1b __ LDA ACCU + 0 
78a0 : 91 05 __ STA (WORK + 2),y 
78a2 : c8 __ __ INY
78a3 : a5 1c __ LDA ACCU + 1 
78a5 : 91 05 __ STA (WORK + 2),y 
78a7 : 60 __ __ RTS
--------------------------------------------------------------------
__multab7L:
78a8 : __ __ __ BYT 00 07 0e 15 1c 23 2a 31 38 3f 46 4d 54          : .....#*18?FMT
--------------------------------------------------------------------
__shrtab192L:
78b5 : __ __ __ BYT c0 60 30 18 0c 06 03                            : .`0....
--------------------------------------------------------------------
__multab12L:
78bc : __ __ __ BYT 00 0c 18 24                                     : ...$
--------------------------------------------------------------------
__multab3L:
78c0 : __ __ __ BYT 00 03 06 09                                     : ....
--------------------------------------------------------------------
__shltab3L:
78c4 : __ __ __ BYT 03 06 0c 18 30 60 c0                            : ....0`.
--------------------------------------------------------------------
__multab320L:
78cb : __ __ __ BYT 00 40 80 c0 00 40 80 c0 00 40 80 c0 00          : .@...@...@...
--------------------------------------------------------------------
__multab320H:
78d8 : __ __ __ BYT 00 01 02 03 05 06 07 08 0a 0b 0c 0d 0f          : .............
--------------------------------------------------------------------
__multab40L:
78e5 : __ __ __ BYT 00 28 50 78 a0 c8                               : .(Px..
--------------------------------------------------------------------
__multab10L:
78eb : __ __ __ BYT 00 0a 14 1e 28 32 3c 46 50 5a 64 6e 78 82 8c 96 : ....(2<FPZdnx...
--------------------------------------------------------------------
uii_target:
78fb : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
blitops_op:
78fc : __ __ __ BYT 00 21 01 41                                     : .!.A
--------------------------------------------------------------------
__multab17L:
7900 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 99 aa bb cc dd ee ff : .."3DUfw........
--------------------------------------------------------------------
screen_result@proxy: ; screen_result@proxy
7910 : a9 46 __ LDA #$46
7912 : 85 10 __ STA P3 
7914 : a9 15 __ LDA #$15
7916 : 85 11 __ STA P4 
7918 : 4c 65 11 JMP $1165 ; (screen_result.s4 + 0)
--------------------------------------------------------------------
memset@proxy: ; memset@proxy
791b : a9 e0 __ LDA #$e0
791d : 85 0e __ STA P1 
791f : a9 40 __ LDA #$40
7921 : 85 11 __ STA P4 
7923 : a9 1f __ LDA #$1f
7925 : 85 12 __ STA P5 
7927 : 4c 0f 21 JMP $210f ; (memset.s4 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
792a : a5 4f __ LDA $4f 
792c : 85 03 __ STA WORK + 0 
792e : a5 50 __ LDA $50 
7930 : 85 04 __ STA WORK + 1 
7932 : 4c 32 75 JMP $7532 ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
7935 : a5 5e __ LDA $5e 
7937 : 85 03 __ STA WORK + 0 
7939 : a5 5f __ LDA $5f 
793b : 85 04 __ STA WORK + 1 
793d : 4c 32 75 JMP $7532 ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
7940 : a9 7f __ LDA #$7f
7942 : 85 03 __ STA WORK + 0 
7944 : a9 00 __ LDA #$00
7946 : 85 04 __ STA WORK + 1 
7948 : a5 05 __ LDA WORK + 2 
794a : 85 1b __ STA ACCU + 0 
794c : a5 06 __ LDA WORK + 3 
794e : 85 1c __ STA ACCU + 1 
7950 : 4c 32 75 JMP $7532 ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
7953 : a9 0d __ LDA #$0d
7955 : 85 03 __ STA WORK + 0 
7957 : 4c 32 75 JMP $7532 ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
795a : a9 7f __ LDA #$7f
795c : 85 03 __ STA WORK + 0 
795e : a9 00 __ LDA #$00
7960 : 85 04 __ STA WORK + 1 
7962 : 4c 32 75 JMP $7532 ; (divs16 + 0)
--------------------------------------------------------------------
divmod@proxy: ; divmod@proxy
7965 : a9 50 __ LDA #$50
7967 : 85 1b __ STA ACCU + 0 
7969 : a9 46 __ LDA #$46
796b : 85 1c __ STA ACCU + 1 
796d : 4c 6d 75 JMP $756d ; (divmod + 0)
--------------------------------------------------------------------
cwin_put_string@proxy: ; cwin_put_string@proxy
7970 : a5 10 __ LDA P3 
7972 : 85 0d __ STA P0 
7974 : a5 11 __ LDA P4 
7976 : 85 0e __ STA P1 
7978 : 4c c3 10 JMP $10c3 ; (cwin_put_string.s4 + 0)
--------------------------------------------------------------------
vic_setmode@proxy: ; vic_setmode@proxy
797b : a9 04 __ LDA #$04
797d : 85 0d __ STA P0 
797f : a9 c0 __ LDA #$c0
7981 : 85 0f __ STA P2 
7983 : a9 e0 __ LDA #$e0
7985 : 85 11 __ STA P4 
7987 : 4c 14 0f JMP $0f14 ; (vic_setmode.s4 + 0)
--------------------------------------------------------------------
vic_setmode@proxy: ; vic_setmode@proxy
798a : a9 03 __ LDA #$03
798c : 85 0d __ STA P0 
798e : a9 00 __ LDA #$00
7990 : 85 0e __ STA P1 
7992 : a9 d0 __ LDA #$d0
7994 : 85 0f __ STA P2 
7996 : a5 43 __ LDA $43 
7998 : 85 10 __ STA P3 
799a : a5 44 __ LDA $44 
799c : 85 11 __ STA P4 
799e : 4c 14 0f JMP $0f14 ; (vic_setmode.s4 + 0)
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
79a1 : a9 7a __ LDA #$7a
79a3 : 85 0e __ STA P1 
79a5 : 4c 45 10 JMP $1045 ; (strlen.s4 + 0)
--------------------------------------------------------------------
mul40:
79a8 : __ __ __ BYT 00 00 28 00 50 00 78 00 a0 00 c8 00 f0 00 18 01 : ..(.P.x.........
79b8 : __ __ __ BYT 40 01 68 01 90 01 b8 01 e0 01 08 02 30 02 58 02 : @.h.........0.X.
79c8 : __ __ __ BYT 80 02 a8 02 d0 02 f8 02 20 03 48 03 70 03 98 03 : ........ .H.p...
79d8 : __ __ __ BYT c0 03                                           : ..
--------------------------------------------------------------------
p2smap:
79da : __ __ __ BYT 40 00 40 20 40 c0 80 80                         : @.@ @...
--------------------------------------------------------------------
p2smap:
79e2 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
audio_ch_base:
79ea : __ __ __ BYT 20 df 40 df 60 df 80 df a0 df c0 df e0 df       :  .@.`.........
--------------------------------------------------------------------
mod_file:
79f8 : __ __ __ BYT 34 65 76 2e 6d 6f 64 00                         : 4ev.mod.
--------------------------------------------------------------------
mod_dir:
7a00 : __ __ __ BYT 2f 75 73 62 30 2f 44 65 76 2f 61 73 73 65 74 73 : /usb0/Dev/assets
7a10 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
sid_freq:
7a11 : __ __ __ BYT a9 02 d2 02 fd 02 2b 03 5b 03 8e 03 c4 03 fd 03 : ......+.[.......
7a21 : __ __ __ BYT 3a 04 7a 04 bf 04 07 05 53 05 a4 05 fa 05 55 06 : :.z.....S.....U.
--------------------------------------------------------------------
speed_nums:
7a31 : __ __ __ BYT b1 22 b3 22 b5 22 b7 22 b9 22 bb 22 bd 22 c0 22 : ."."."."."."."."
7a41 : __ __ __ BYT c3 22 c6 22 c9 22 cc 22 cf 22 d2 22 d5 22 d8 22 : ."."."."."."."."
--------------------------------------------------------------------
glyphs:
7a51 : __ __ __ BYT 70 88 88 88 88 88 70 20 60 20 20 20 20 70 70 88 : p.....p `    pp.
7a61 : __ __ __ BYT 08 30 40 80 f8 70 88 08 30 08 88 70 10 30 50 90 : .0@..p..0..p.0P.
7a71 : __ __ __ BYT f8 10 10 f8 80 f0 08 08 88 70 30 40 80 f0 88 88 : .........p0@....
7a81 : __ __ __ BYT 70 f8 08 10 20 40 40 40 70 88 88 70 88 88 70 70 : p... @@@p..p..pp
7a91 : __ __ __ BYT 88 88 78 08 10 60 88 d8 a8 88 88 88 88 88 88 88 : ..x..`..........
7aa1 : __ __ __ BYT f8 88 88 88 f8 10 20 40 80 80 f8                : ...... @...
--------------------------------------------------------------------
lmask:
7aac : __ __ __ BYT ff 7f 3f 1f 0f 07 03 01                         : ..?.....
--------------------------------------------------------------------
rmask:
7ab4 : __ __ __ BYT 00 80 c0 e0 f0 f8 fc fe                         : ........
--------------------------------------------------------------------
step_msg:
7abc : __ __ __ BYT d8 2c f1 2c 06 2d 19 2d 31 2d 4e 2d 68 2d 82 2d : .,.,.-.-1-N-h-.-
7acc : __ __ __ BYT 9b 2d b7 2d d7 2d f4 2d 11 2e 2d 2e 45 2e 61 2e : .-.-.-.-..-.E.a.
--------------------------------------------------------------------
TinyFont:
7adc : __ __ __ BYT 00 04 05 08 0d 12 17 1c 1d 21 25 2a 2d 2e 31 32 : .........!%*-.12
7aec : __ __ __ BYT 35 39 3d 41 45 49 4d 51 55 59 5d 5e 5f 62 65 68 : 59=AEIMQUY]^_beh
7afc : __ __ __ BYT 6c 71 76 7a 7e 82 86 8a 8e 92 95 99 9d a1 a6 ab : lqvz~...........
7b0c : __ __ __ BYT af b3 b7 bb bf c4 c8 cd d2 d7 dc e1 e5 e8 ec f1 : ................
7b1c : __ __ __ BYT f5 f9 fd 01 05 09 0d 10 14 18 19 1b 1f 21 26 2a : .............!&*
7b2c : __ __ __ BYT 2e 32 36 3a 3e 41 45 49 4e 52 56 5a 5e 5f 63 67 : .26:>AEINRVZ^_cg
7b3c : __ __ __ BYT 10 04 0c 14 14 14 14 04 10 10 14 0c 04 0c 04 0c : ................
7b4c : __ __ __ BYT 10 10 10 10 10 10 10 10 10 10 04 04 0c 0c 0c 10 : ................
7b5c : __ __ __ BYT 14 14 10 10 10 10 10 10 10 0c 10 10 10 14 14 10 : ................
7b6c : __ __ __ BYT 10 10 10 10 14 10 14 14 14 14 14 10 0c 10 14 10 : ................
7b7c : __ __ __ BYT 10 10 10 11 11 11 0d 11 11 05 09 11 09 15 11 11 : ................
7b8c : __ __ __ BYT 11 11 11 11 0d 11 11 15 11 11 11 11 05 11 11 11 : ................
7b9c : __ __ __ BYT 00 00 00 00 fa c0 00 c0 28 7c 28 7c 28 20 54 d6 : ........(|(|( T.
7bac : __ __ __ BYT 54 08 04 48 10 24 40 6c 92 92 6c 0a c0 38 44 82 : T..H.$@l..l..8D.
7bbc : __ __ __ BYT 82 82 82 44 38 10 54 38 54 10 10 38 10 03 10 10 : ...D8.T8T..8....
7bcc : __ __ __ BYT 10 02 06 38 c0 7c 82 82 7c 22 42 fe 02 46 8a 92 : ...8.|..|"B..F..
7bdc : __ __ __ BYT 62 44 82 92 6c f0 10 3e 10 e4 92 92 8c 7c 92 92 : bD..l..>.....|..
7bec : __ __ __ BYT 4c 80 8e 90 e0 6c 92 92 6c 64 92 92 7c 28 0b 10 : L....l..ld..|(..
7bfc : __ __ __ BYT 28 44 28 28 28 44 28 10 40 80 9a 60 00 00 00 00 : (D(((D(.@..`....
7c0c : __ __ __ BYT 00 3e 50 90 50 3e fe 92 92 6c 7c 82 82 44 fe 82 : .>P.P>...l|..D..
7c1c : __ __ __ BYT 82 7c fe 92 92 82 fe 90 90 80 7c 82 92 1c fe 10 : .|........|.....
7c2c : __ __ __ BYT 10 fe 82 fe 82 84 82 82 fc fe 10 28 c6 fe 02 02 : ...........(....
7c3c : __ __ __ BYT 02 fe 40 20 40 fe fe 40 20 10 fe 7c 82 82 7c fe : ..@ @..@ ..|..|.
7c4c : __ __ __ BYT 90 90 60 7c 82 84 7a fe 90 90 6e 64 92 92 4c 80 : ..`|..z...nd..L.
7c5c : __ __ __ BYT 80 fe 80 80 fc 02 02 fc e0 18 06 18 e0 fe 04 08 : ................
7c6c : __ __ __ BYT 04 fe c6 28 10 28 c6 e0 10 1e 10 e0 86 8a 92 a2 : ...(.(..........
7c7c : __ __ __ BYT c2 fe 82 82 82 c0 38 06 82 82 82 fe 20 40 80 40 : ......8..... @.@
7c8c : __ __ __ BYT 20 01 01 01 01 00 00 00 00 04 2a 2a 1e fe 22 22 :  .........**..""
7c9c : __ __ __ BYT 1c 1c 22 22 14 1c 22 22 fe 1c 2a 2a 18 20 7e a0 : ..""..""..**. ~.
7cac : __ __ __ BYT 18 25 25 3e fe 20 20 1e be 01 be fe 10 28 46 fc : .%%>.  ......(F.
7cbc : __ __ __ BYT 02 3e 20 1e 20 1e 3e 20 20 1e 1c 22 22 1c 3f 24 : .> . .>  .."".?$
7ccc : __ __ __ BYT 24 18 18 24 24 3f 3e 10 20 10 12 2a 2a 04 20 7c : $..$$?>. ..**. |
7cdc : __ __ __ BYT 22 3c 02 02 3e 38 04 02 3c 3c 02 1c 02 3c 26 18 : "<..>8..<<...<&.
7cec : __ __ __ BYT 0c 32 38 05 05 3e 26 2a 2a 32 10 6c 82 82 fe 82 : .28..>&**2.l....
7cfc : __ __ __ BYT 82 6c 10 10 20 10 20 00 00 00 00                : .l.. . ....
--------------------------------------------------------------------
tbitmap:
7d07 : __ __ __ BYT e0 9c 00 00 28 01 40 01                         : ....(.@.
--------------------------------------------------------------------
sin64:
7d0f : __ __ __ BYT 00 0c 19 25 31 3c 47 51 5a 62 6a 70 75 7a 7d 7e : ...%1<GQZbjpuz}~
7d1f : __ __ __ BYT 7f 7e 7d 7a 75 70 6a 62 5a 51 47 3c 31 25 19 0c : .~}zupjbZQG<1%..
7d2f : __ __ __ BYT 00 f4 e7 db cf c4 b9 af a6 9e 96 90 8b 86 83 82 : ................
7d3f : __ __ __ BYT 81 82 83 86 8b 90 96 9e a6 af b9 c4 cf db e7 f4 : ................
--------------------------------------------------------------------
cr:
7d4f : __ __ __ BYT 00 00 00 00 40 01 c8 00                         : ....@...
--------------------------------------------------------------------
vib_sine:
7d57 : __ __ __ BYT 00 18 31 4a 61 78 8d a1 b4 c5 d4 e0 eb f4 fa fd : ..1Jax..........
7d67 : __ __ __ BYT ff fd fa f4 eb e0 d4 c5 b4 a1 8d 78 61 4a 31 18 : ...........xaJ1.
--------------------------------------------------------------------
frames:
7d77 : __ __ __ BYT 00 d8 00 e7 60 40 00 00 00 00 00 e4 1f f5 33 20 : ....`@........3 
7d87 : __ __ __ BYT 00 00 00 00 00 ec 00 f8 1a 10 00 00 00 00 00 d8 : ................
7d97 : __ __ __ BYT 00 e7 60 40 cd f4 52 04 00 d8 00 e7 60 40 33 f3 : ..`@..R.....`@3.
7da7 : __ __ __ BYT 7f 02                                           : ..
--------------------------------------------------------------------
f1c:
7da9 : __ __ __ BYT 0f 01 0d 0d 05 01 07 0d 01 01 07 08 0e 03 01 03 : ................
7db9 : __ __ __ BYT 0e 0d 0d 07 01 01 0d 07 06 03 0e 0e 05 03 05 0d : ................
7dc9 : __ __ __ BYT 01 01 05 0d 06 04 03 03 0e 01 0d 03 01 01 0f 0d : ................
--------------------------------------------------------------------
cbytes:
7dd9 : __ __ __ BYT 00 55 aa ff                                     : .U..
--------------------------------------------------------------------
gz:
7ddd : __ __ __ BYT a0 00 bb 00 d5 00 f0 00 0b 01 25 01 40 01       : ..........%.@.
--------------------------------------------------------------------
gx:
7deb : __ __ __ BYT b0 ff cb ff e5 ff 00 00 1b 00 35 00 50 00       : ..........5.P.
--------------------------------------------------------------------
pal_sc:
7df9 : __ __ __ BYT f9 e3 a8 d5                                     : ....
--------------------------------------------------------------------
mod_paused:
7dfd : __ __ __ BSS	1
--------------------------------------------------------------------
mod_saved_irq:
7dfe : __ __ __ BSS	2
--------------------------------------------------------------------
cube_v:
7e00 : __ __ __ BYT ff ff ff 01 ff ff 01 01 ff ff 01 ff ff ff 01 01 : ................
7e10 : __ __ __ BYT ff 01 01 01 01 ff 01 01                         : ........
--------------------------------------------------------------------
sin256:
7e18 : __ __ __ BYT 00 00 65 00 c9 00 2d 01 91 01 f5 01 59 02 bc 02 : ..e...-.....Y...
7e28 : __ __ __ BYT 1f 03 81 03 e3 03 44 04 a5 04 05 05 64 05 c2 05 : ......D.....d...
7e38 : __ __ __ BYT 1f 06 7c 06 d7 06 32 07 8b 07 e3 07 3a 08 8f 08 : ..|...2.....:...
7e48 : __ __ __ BYT e4 08 37 09 88 09 d8 09 26 0a 73 0a bf 0a 08 0b : ..7.....&.s.....
7e58 : __ __ __ BYT 50 0b 97 0b db 0b 1e 0c 5e 0c 9d 0c da 0c 15 0d : P.......^.......
7e68 : __ __ __ BYT 4e 0d 85 0d b9 0d ec 0d 1c 0e 4b 0e 77 0e a1 0e : N.........K.w...
7e78 : __ __ __ BYT c8 0e ee 0e 11 0f 31 0f 50 0f 6c 0f 85 0f 9c 0f : ......1.P.l.....
7e88 : __ __ __ BYT b1 0f c4 0f d4 0f e1 0f ec 0f f5 0f fb 0f ff 0f : ................
7e98 : __ __ __ BYT 00 10 ff 0f fb 0f f5 0f ec 0f e1 0f d4 0f c4 0f : ................
7ea8 : __ __ __ BYT b1 0f 9c 0f 85 0f 6c 0f 50 0f 31 0f 11 0f ee 0e : ......l.P.1.....
7eb8 : __ __ __ BYT c8 0e a1 0e 77 0e 4b 0e 1c 0e ec 0d b9 0d 85 0d : ....w.K.........
7ec8 : __ __ __ BYT 4e 0d 15 0d da 0c 9d 0c 5e 0c 1e 0c db 0b 97 0b : N.......^.......
7ed8 : __ __ __ BYT 50 0b 08 0b bf 0a 73 0a 26 0a d8 09 88 09 37 09 : P.....s.&.....7.
7ee8 : __ __ __ BYT e4 08 8f 08 3a 08 e3 07 8b 07 32 07 d7 06 7c 06 : ....:.....2...|.
7ef8 : __ __ __ BYT 1f 06 c2 05 64 05 05 05 a5 04 44 04 e3 03 81 03 : ....d.....D.....
7f08 : __ __ __ BYT 1f 03 bc 02 59 02 f5 01 91 01 2d 01 c9 00 65 00 : ....Y.....-...e.
7f18 : __ __ __ BYT 00 00 9b ff 37 ff d3 fe 6f fe 0b fe a7 fd 44 fd : ....7...o.....D.
7f28 : __ __ __ BYT e1 fc 7f fc 1d fc bc fb 5b fb fb fa 9c fa 3e fa : ........[.....>.
7f38 : __ __ __ BYT e1 f9 84 f9 29 f9 ce f8 75 f8 1d f8 c6 f7 71 f7 : ....)...u.....q.
7f48 : __ __ __ BYT 1c f7 c9 f6 78 f6 28 f6 da f5 8d f5 41 f5 f8 f4 : ....x.(.....A...
7f58 : __ __ __ BYT b0 f4 69 f4 25 f4 e2 f3 a2 f3 63 f3 26 f3 eb f2 : ..i.%.....c.&...
7f68 : __ __ __ BYT b2 f2 7b f2 47 f2 14 f2 e4 f1 b5 f1 89 f1 5f f1 : ..{.G........._.
7f78 : __ __ __ BYT 38 f1 12 f1 ef f0 cf f0 b0 f0 94 f0 7b f0 64 f0 : 8...........{.d.
7f88 : __ __ __ BYT 4f f0 3c f0 2c f0 1f f0 14 f0 0b f0 05 f0 01 f0 : O.<.,...........
7f98 : __ __ __ BYT 00 f0 01 f0 05 f0 0b f0 14 f0 1f f0 2c f0 3c f0 : ............,.<.
7fa8 : __ __ __ BYT 4f f0 64 f0 7b f0 94 f0 b0 f0 cf f0 ef f0 12 f1 : O.d.{...........
7fb8 : __ __ __ BYT 38 f1 5f f1 89 f1 b5 f1 e4 f1 14 f2 47 f2 7b f2 : 8._.........G.{.
7fc8 : __ __ __ BYT b2 f2 eb f2 26 f3 63 f3 a2 f3 e2 f3 25 f4 69 f4 : ....&.c.....%.i.
7fd8 : __ __ __ BYT b0 f4 f8 f4 41 f5 8d f5 da f5 28 f6 78 f6 c9 f6 : ....A.....(.x...
7fe8 : __ __ __ BYT 1c f7 71 f7 c6 f7 1d f8 75 f8 ce f8 29 f9 84 f9 : ..q.....u...)...
7ff8 : __ __ __ BYT e1 f9 3e fa 9c fa fb fa 5b fb bc fb 1d fc 7f fc : ..>.....[.......
8008 : __ __ __ BYT e1 fc 44 fd a7 fd 0b fe 6f fe d3 fe 37 ff 9b ff : ..D.....o...7...
--------------------------------------------------------------------
cube_e:
8018 : __ __ __ BYT 00 01 01 02 02 03 03 00 04 05 05 06 06 07 07 04 : ................
8028 : __ __ __ BYT 00 04 01 05 02 06 03 07                         : ........
--------------------------------------------------------------------
vcr:
8030 : __ __ __ BYT 00 00 00 00 40 01 c8 00                         : ....@...
--------------------------------------------------------------------
sin_lut:
8038 : __ __ __ BYT 02 02 02 02 02 02 02 02 03 03 03 03 03 03 03 03 : ................
8048 : __ __ __ BYT 03 03 03 03 03 03 03 03 03 02 02 02 02 02 02 02 : ................
8058 : __ __ __ BYT 02 01 01 01 01 01 01 01 00 00 00 00 00 00 00 00 : ................
8068 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 01 01 01 01 01 01 : ................
--------------------------------------------------------------------
sum_to_col:
8078 : __ __ __ BYT 00 00 00 01 01 02 02 03 03 03                   : ..........
--------------------------------------------------------------------
pal_cr:
8082 : __ __ __ BYT 01 01 07 03                                     : ....
--------------------------------------------------------------------
lat_wave:
8086 : __ __ __ BYT 00 ff ff fe fe fd fd fc fc fb fb fb fa fa fa fa : ................
8096 : __ __ __ BYT fa fa fa fb fb fb fc fc fd fd fe fe ff ff 00 00 : ................
80a6 : __ __ __ BYT 01 01 02 02 03 03 04 04 05 05 05 06 06 06 06 06 : ................
80b6 : __ __ __ BYT 06 06 05 05 05 04 04 03 03 02 02 01 01 00 00 ff : ................
--------------------------------------------------------------------
pcolor:
80c6 : __ __ __ BYT 02 08 07 0d 05 03 0e 06                         : ........
--------------------------------------------------------------------
cw:
80ce : __ __ __ BSS	12
--------------------------------------------------------------------
Screen:
80da : __ __ __ BSS	8
--------------------------------------------------------------------
tworks:
80e2 : __ __ __ BSS	8
--------------------------------------------------------------------
mod_row_buf:
80ea : __ __ __ BSS	16
--------------------------------------------------------------------
txt_pos:
80fa : __ __ __ BSS	2
--------------------------------------------------------------------
insert_col:
80fc : __ __ __ BSS	1
--------------------------------------------------------------------
fine_x:
80fd : __ __ __ BSS	1
--------------------------------------------------------------------
wave_phase:
80fe : __ __ __ BSS	1
--------------------------------------------------------------------
plasma_phase:
80ff : __ __ __ BSS	1
--------------------------------------------------------------------
vert_wave:
8100 : __ __ __ BYT 00 01 02 02 03 03 04 04 04 04 04 03 03 02 02 01 : ................
8110 : __ __ __ BYT 00 ff fe fe fd fd fc fc fc fc fc fd fd fe fe ff : ................
8120 : __ __ __ BYT 00 01 02 02 03 03 04 04 04 04 04 03 03 02 02 01 : ................
8130 : __ __ __ BYT 00 ff fe fe fd fd fc fc fc fc fc fd fd fe fe ff : ................
--------------------------------------------------------------------
scroll_text:
8140 : __ __ __ BYT 20 20 75 4c 54 49 4d 41 54 45 20 64 45 4d 4f 20 :   uLTIMATE dEMO 
8150 : __ __ __ BYT 32 30 32 36 20 20 63 4f 44 45 44 20 69 4e 20 63 : 2026  cODED iN c
8160 : __ __ __ BYT 20 62 59 20 78 41 4e 44 45 52 20 6d 4f 4c 20 20 :  bY xANDER mOL  
8170 : __ __ __ BYT 72 55 4e 4e 49 4e 47 20 61 54 20 36 34 20 6d 48 : rUNNING aT 64 mH
8180 : __ __ __ BYT 5a 20 6f 4e 20 74 48 45 20 75 4c 54 49 4d 41 54 : Z oN tHE uLTIMAT
8190 : __ __ __ BYT 45 20 36 34 20 68 41 52 44 57 41 52 45 20 20 67 : E 64 hARDWARE  g
81a0 : __ __ __ BYT 52 45 45 54 49 4e 47 53 20 74 4f 20 61 4c 4c 20 : REETINGS tO aLL 
81b0 : __ __ __ BYT 63 36 34 20 64 45 4d 4f 20 63 4f 44 45 52 53 20 : c64 dEMO cODERS 
81c0 : __ __ __ BYT 20 73 54 49 4c 4c 20 70 55 53 48 49 4e 47 20 74 :  sTILL pUSHING t
81d0 : __ __ __ BYT 48 45 20 6c 49 4d 49 54 53 20 6f 46 20 74 48 45 : HE lIMITS oF tHE
81e0 : __ __ __ BYT 20 63 36 34 20 69 4e 20 32 30 32 36 20 20 20 20 :  c64 iN 2026    
81f0 : __ __ __ BYT 2d 20 63 52 45 44 49 54 53 20 2d 20 20 63 4f 44 : - cREDITS -  cOD
8200 : __ __ __ BYT 45 20 2d 20 6f 53 43 41 52 36 34 20 63 4f 4d 50 : E - oSCAR64 cOMP
8210 : __ __ __ BYT 49 4c 45 52 20 62 59 20 44 52 4d 4f 52 54 41 4c : ILER bY DRMORTAL
8220 : __ __ __ BYT 57 4f 4d 42 41 54 20 20 6d 55 53 49 43 20 2d 20 : WOMBAT  mUSIC - 
8230 : __ __ __ BYT 66 4f 52 45 56 45 52 20 79 4f 55 4e 47 20 2d 20 : fOREVER yOUNG - 
8240 : __ __ __ BYT 34 45 56 2e 4d 4f 44 20 20 66 4f 4e 54 20 2d 20 : 4EV.MOD  fONT - 
8250 : __ __ __ BYT 73 4d 41 4c 4c 20 72 4f 55 4e 44 20 70 65 74 73 : sMALL rOUND pets
8260 : __ __ __ BYT 63 69 69 20 66 4f 4e 54 20 62 59 20 63 55 50 49 : cii fONT bY cUPI
8270 : __ __ __ BYT 44 20 20 75 4c 54 49 4d 41 54 45 20 6c 49 42 52 : D  uLTIMATE lIBR
8280 : __ __ __ BYT 41 52 59 20 62 59 20 73 43 4f 54 54 20 68 55 54 : ARY bY sCOTT hUT
8290 : __ __ __ BYT 54 45 52 20 20 6d 4f 44 20 70 4c 41 59 45 52 20 : TER  mOD pLAYER 
82a0 : __ __ __ BYT 73 4f 55 52 43 45 20 62 59 20 66 52 45 53 48 4e : sOURCE bY fRESHN
82b0 : __ __ __ BYT 45 53 53 20 20 20 20 2d 20 73 50 45 43 49 41 4c : ESS    - sPECIAL
82c0 : __ __ __ BYT 20 74 48 41 4e 4b 53 20 2d 20 20 67 49 44 45 4f :  tHANKS -  gIDEO
82d0 : __ __ __ BYT 4e 20 7a 57 45 49 4a 54 5a 45 52 20 2d 20 63 52 : N zWEIJTZER - cR
82e0 : __ __ __ BYT 45 41 54 4f 52 20 6f 46 20 74 48 45 20 75 4c 54 : EATOR oF tHE uLT
82f0 : __ __ __ BYT 49 4d 41 54 45 20 36 34 20 20 74 48 45 20 66 41 : IMATE 64  tHE fA
8300 : __ __ __ BYT 53 54 45 53 54 20 63 36 34 20 63 4f 4d 50 41 54 : STEST c64 cOMPAT
8310 : __ __ __ BYT 49 42 4c 45 20 6d 41 43 48 49 4e 45 20 20 20 20 : IBLE mACHINE    
8320 : __ __ __ BYT 74 48 41 4e 4b 20 79 4f 55 20 66 4f 52 20 77 41 : tHANK yOU fOR wA
8330 : __ __ __ BYT 54 43 48 49 4e 47 20 20 70 52 45 53 53 20 61 4e : TCHING  pRESS aN
8340 : __ __ __ BYT 59 20 6b 45 59 20 74 4f 20 65 58 49 54 20 20 20 : Y kEY tO eXIT   
8350 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
8360 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
8370 : __ __ __ BYT 20 20 20 20 20 20 20 00                         :        .
--------------------------------------------------------------------
letter_width:
8378 : __ __ __ BYT 03 03 03 03 03 03 03 04 02 03 03 03 03 03 03 03 : ................
8388 : __ __ __ BYT 03 03 03 03 03 02 03 03 03 03 03 03 03 03 03 02 : ................
8398 : __ __ __ BYT 03 03 01 02 03 01 05 03 03 03 03 03 03 03 03 02 : ................
83a8 : __ __ __ BYT 05 03 03 03 03 03 01 03 03 03 03 03 03 03 03 01 : ................
83b8 : __ __ __ BYT 01 01 01 01 03 01 02 03 03 03 04 03 03 04 02 02 : ................
83c8 : __ __ __ BYT 02 02 02 02 03 02                               : ......
--------------------------------------------------------------------
mx:
83ce : __ __ __ BSS	8
--------------------------------------------------------------------
VScreen:
83d6 : __ __ __ BSS	8
--------------------------------------------------------------------
py_cur:
83de : __ __ __ BSS	16
--------------------------------------------------------------------
px_cur:
83ee : __ __ __ BSS	16
--------------------------------------------------------------------
done:
83fe : __ __ __ BSS	1
--------------------------------------------------------------------
dp_y:
83ff : __ __ __ BSS	1
--------------------------------------------------------------------
psin:
8400 : __ __ __ BYT 04 04 04 05 05 05 05 06 06 06 06 07 07 07 07 07 : ................
8410 : __ __ __ BYT 07 07 07 07 07 07 06 06 06 06 05 05 05 05 04 04 : ................
8420 : __ __ __ BYT 04 03 03 02 02 02 02 01 01 01 01 00 00 00 00 00 : ................
8430 : __ __ __ BYT 00 00 00 00 00 00 01 01 01 01 02 02 02 02 03 03 : ................
--------------------------------------------------------------------
sin_row:
8440 : __ __ __ BYT 00 01 01 01 01 02 02 02 02 02 01 01 01 01 00 00 : ................
8450 : __ __ __ BYT ff ff ff fe fe fe fe fe fe fe ff ff ff 00 00 01 : ................
8460 : __ __ __ BYT 00 01 01 01 01 02 02 02 02 02 01 01 01 01 00 00 : ................
8470 : __ __ __ BYT ff ff ff fe fe fe fe fe fe fe ff ff ff 00 00 01 : ................
--------------------------------------------------------------------
letter_start:
8480 : __ __ __ BYT 00 03 06 09 0c 0f 12 15 19 1b 1e 21 24 00 03 06 : ...........!$...
8490 : __ __ __ BYT 09 0c 0f 12 15 18 1a 1d 20 23 00 03 06 09 0c 0f : ........ #......
84a0 : __ __ __ BYT 11 14 17 18 1a 1d 1e 23 00 03 06 09 0c 0f 12 15 : .......#........
84b0 : __ __ __ BYT 17 1c 1f 22 00 00 03 04 07 0a 0d 10 13 16 19 1c : ..."............
84c0 : __ __ __ BYT 1d 1e 1f 20 21 24 25 00 03 06 09 0d 10 13 17 19 : ... !$%.........
84d0 : __ __ __ BYT 1b 1d 1f 21 23 26                               : ...!#&
--------------------------------------------------------------------
loops:
84d6 : __ __ __ BSS	2
--------------------------------------------------------------------
scr_letter:
84d8 : __ __ __ BSS	40
--------------------------------------------------------------------
font_am_ch:
8500 : __ __ __ BYT 55 44 49 70 44 49 55 44 49 70 44 49 55 44 6e 55 : UDIpDIUDIpDIUDnU
8510 : __ __ __ BYT 44 6e 55 44 49 72 20 72 20 72 20 20 20 6e 72 20 : DnUDIr r r   nr 
8520 : __ __ __ BYT 2f 72 20 20 55 72 49 20 6b 46 73 6b 46 73 47 20 : /r  UrI kFskFsG 
8530 : __ __ __ BYT 20 48 20 48 6b 44 20 6b 44 20 47 44 6e 6b 44 73 :  H HkD kD GDnkDs
8540 : __ __ __ BYT 20 5d 20 70 20 48 6b 3c 20 5d 20 20 47 48 48 20 :  ] p Hk< ]  GHH 
8550 : __ __ __ BYT 47 20 48 47 20 48 47 20 20 48 20 48 47 20 20 47 : G HG HG  H HG  G
8560 : __ __ __ BYT 20 20 47 20 48 48 20 47 20 48 20 47 20 48 48 20 :   G HH G H G HH 
8570 : __ __ __ BYT 4d 47 20 20 47 5d 48 20 6d 20 7d 6d 46 4b 4a 46 : MG  G]H m }mFKJF
8580 : __ __ __ BYT 4b 6d 46 4b 4a 46 7d 71 20 20 4a 46 4b 71 20 71 : KmFKJF}q  JFKq q
8590 : __ __ __ BYT 20 71 20 4a 46 4b 71 20 27 6d 46 7d 4a 20 4b 20 :  q JFKq 'mF}J K 
85a0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
85b0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
85c0 : __ __ __ BYT 20 20 20 20 20 20 20 20                         :         
--------------------------------------------------------------------
bitshift:
85c8 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
85d8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
85e8 : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
85f8 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
font_nz_ch:
8600 : __ __ __ BYT 72 20 72 55 44 49 55 44 49 55 44 49 55 44 49 55 : r rUDIUDIUDIUDIU
8610 : __ __ __ BYT 44 49 70 72 6e 55 20 49 74 59 55 20 49 20 20 20 : DIprnU ItYU I   
8620 : __ __ __ BYT 47 20 47 43 44 6e 20 20 47 4d 48 47 20 48 47 20 : G GCDn  GMHG HG 
8630 : __ __ __ BYT 48 47 20 48 47 20 48 4a 44 49 20 5d 20 47 20 48 : HG HG HJDI ] G H
8640 : __ __ __ BYT 54 59 47 48 48 4d 20 2f 4a 46 73 20 4e 20 20 20 : TYGHHM /JFs N   
8650 : __ __ __ BYT 47 20 48 47 20 48 6b 46 4b 47 20 48 6b 46 4b 47 : G HG HkFKG HkFKG
8660 : __ __ __ BYT 20 48 20 5d 20 47 20 48 47 48 47 5d 48 20 56 20 :  H ] G HGHG]H V 
8670 : __ __ __ BYT 47 20 48 4e 20 48 20 20 71 20 71 4a 46 4b 5d 20 : G HN H  q qJFK] 
8680 : __ __ __ BYT 20 4a 46 4d 5d 20 4d 4a 46 4b 20 71 20 4a 46 4b :  JFM] MJFK q JFK
8690 : __ __ __ BYT 4a 4b 4a 71 4b 2f 20 4d 6d 46 4b 6d 46 7d 20 20 : JKJqK/ MmFKmF}  
86a0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
86b0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
86c0 : __ __ __ BYT 20 20 20 20 20 20 20 20                         :         
--------------------------------------------------------------------
scr_col:
86c8 : __ __ __ BSS	40
--------------------------------------------------------------------
df_x:
86f0 : __ __ __ BSS	1
--------------------------------------------------------------------
df_yoff:
86f1 : __ __ __ BSS	1
--------------------------------------------------------------------
df_r:
86f2 : __ __ __ BSS	1
--------------------------------------------------------------------
HeapNode:
86f3 : __ __ __ BSS	4
--------------------------------------------------------------------
font_lc_an_ch:
8700 : __ __ __ BYT 20 20 20 48 20 20 20 20 20 20 20 47 20 20 20 55 :    H       G   U
8710 : __ __ __ BYT 46 20 20 20 48 20 20 57 20 20 54 20 20 47 20 20 : F   H  W  T  G  
8720 : __ __ __ BYT 20 20 20 20 20 20 20 20 55 44 49 6b 44 49 55 44 :         UDIkDIUD
8730 : __ __ __ BYT 49 55 44 73 55 44 49 6b 46 55 44 49 6b 44 49 59 : IUDsUDIkFUDIkDIY
8740 : __ __ __ BYT 20 49 47 20 4e 42 70 44 72 44 49 70 44 49 20 20 :  IG NBpDrDIpDI  
8750 : __ __ __ BYT 55 44 73 5d 20 48 47 20 20 47 20 48 6b 46 4b 47 : UDs] HG  G HkFKG
8760 : __ __ __ BYT 20 47 20 48 47 20 48 48 20 48 6b 3c 20 5d 47 20 :  G HG HH Hk< ]G 
8770 : __ __ __ BYT 47 20 48 47 20 48 20 20 4a 46 7d 6d 46 4b 4a 46 : G HG H  JF}mFKJF
8780 : __ __ __ BYT 4b 4a 46 4b 4a 46 4b 4a 20 4a 46 73 42 20 42 71 : KJFKJFKJ JFsB Bq
8790 : __ __ __ BYT 20 48 42 20 4d 48 6d 20 7d 20 7d 6d 20 7d 20 20 :  HB MHm } }m }  
87a0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
87b0 : __ __ __ BYT 20 20 46 4b 20 20 20 20 46 4b 20 20 20 20 20 20 :   FK    FK      
87c0 : __ __ __ BYT 20 20 20 20 20 20 20 20                         :         
--------------------------------------------------------------------
font_lc_oz_ch:
8800 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 48 :                H
8810 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
8820 : __ __ __ BYT 20 20 20 20 20 20 20 20 55 44 49 55 44 49 55 44 :         UDIUDIUD
8830 : __ __ __ BYT 49 55 44 49 55 44 49 6b 44 20 55 20 49 54 59 55 : IUDIUDIkD U ITYU
8840 : __ __ __ BYT 20 55 20 49 4d 20 2f 55 20 49 70 44 6e 20 20 20 :  U IM /U IpDn   
8850 : __ __ __ BYT 47 20 48 47 20 48 47 20 48 47 20 20 4a 44 49 47 : G HG HG HG  JDIG
8860 : __ __ __ BYT 20 48 47 20 48 47 48 47 20 47 20 48 20 56 20 47 :  HG HGHG G H V G
8870 : __ __ __ BYT 20 48 55 44 4b 20 20 20 4a 46 4b 6b 46 4b 4a 46 :  HUDK   JFKkFKJF
8880 : __ __ __ BYT 73 71 20 20 4a 46 4b 4a 46 4b 4a 46 4b 4a 4b 4a : sq  JFKJFKJFKJKJ
8890 : __ __ __ BYT 46 71 46 4b 2f 20 4d 4a 46 73 6d 46 43 20 20 20 : FqFK/ MJFsmFC   
88a0 : __ __ __ BYT 20 20 20 48 20 20 20 20 47 20 20 20 20 20 20 20 :    H    G       
88b0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
88c0 : __ __ __ BYT 46 4b 20 20 20 20 20 20                         : FK      
--------------------------------------------------------------------
font_dig_ch:
8900 : __ __ __ BYT 55 44 49 49 55 44 49 55 44 49 55 20 49 70 44 6e : UDIIUDIUDIU IpDn
8910 : __ __ __ BYT 55 44 49 70 44 6e 55 44 49 55 44 49 20 20 59 20 : UDIpDnUDIUDI  Y 
8920 : __ __ __ BYT 20 20 20 20 42 42 42 20 47 4e 48 48 55 46 4b 20 :     BBB GNHHUFK 
8930 : __ __ __ BYT 46 73 47 20 48 4a 44 49 6b 44 49 20 55 7d 6b 46 : FsG HJDIkDI U}kF
8940 : __ __ __ BYT 73 47 20 48 51 20 48 51 20 20 20 2f 48 48 47 20 : sG HQ HQ   /HHG 
8950 : __ __ __ BYT 47 20 48 48 47 20 20 20 20 48 4a 46 73 47 20 48 : G HHG    HJFsG H
8960 : __ __ __ BYT 47 20 48 20 47 20 47 20 48 4a 46 73 51 20 5d 42 : G H G G HJFsQ ]B
8970 : __ __ __ BYT 42 20 4e 20 20 20 20 20 4a 46 4b 71 4a 46 7d 6d : B N     JFKqJF}m
8980 : __ __ __ BYT 46 4b 20 20 47 4a 46 4b 4a 46 4b 20 54 20 4a 46 : FK  GJFKJFK T JF
8990 : __ __ __ BYT 4b 4a 46 4b 20 51 51 48 48 2f 20 20 20 20 20 20 : KJFK QQHH/      
89a0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
89b0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 4b :                K
89c0 : __ __ __ BYT 4b 20 20 20 20 20 20 20                         : K       
--------------------------------------------------------------------
font_sym_ch:
8a00 : __ __ __ BYT 55 5b 49 55 44 49 20 20 20 20 20 20 20 20 20 20 : U[IUDI          
8a10 : __ __ __ BYT 70 44 49 20 20 20 20 47 47 55 44 20 2f 44 49 4d : pDI    GGUD /DIM
8a20 : __ __ __ BYT 20 70 40 20 20 20 40 6e 4a 5b 49 6b 46 73 57 20 :  p@   @nJ[IkFsW 
8a30 : __ __ __ BYT 2f 20 20 20 20 20 48 20 20 55 4b 46 43 44 20 5b : /     H  UKFCD [
8a40 : __ __ __ BYT 5b 47 20 3c 20 20 48 20 3e 5d 20 55 44 49 20 42 : [G <  H >] UDI B
8a50 : __ __ __ BYT 20 42 48 47 4d 48 20 4e 20 20 46 43 44 46 5b 44 :  BHGMH N  FCDF[D
8a60 : __ __ __ BYT 20 47 20 46 43 44 20 5b 5b 47 20 20 4d 20 48 2f :  G FCD [[G  M H/
8a70 : __ __ __ BYT 20 5d 20 47 4a 4b 20 42 4a 5b 4b 4a 46 5b 2f 20 :  ] GJK BJ[KJF[/ 
8a80 : __ __ __ BYT 57 20 20 20 20 20 47 20 20 51 20 20 20 20 20 48 : W     G  Q     H
8a90 : __ __ __ BYT 48 4a 46 20 20 46 4b 20 20 6d 40 4a 46 4b 40 7d : HJF  FK  m@JFK@}
8aa0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
8ab0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
8ac0 : __ __ __ BYT 20 20 20 20 20 20 20 20                         :         
--------------------------------------------------------------------
font_am_co:
8b00 : __ __ __ BYT 0f 0d 01 0f 0d 01 0f 0d 01 0f 0d 01 0f 0d 01 0f : ................
8b10 : __ __ __ BYT 0d 01 0f 0d 01 0f 0d 01 0d 01 01 0d 0d 01 0f 0d : ................
8b20 : __ __ __ BYT 01 01 0d 0d 0d 0d 01 0d 0f 0d 0d 0f 0d 0d 0f 0f : ................
8b30 : __ __ __ BYT 0f 0f 0f 0d 0f 0d 0f 05 0f 0f 0f 0f 0f 0f 0d 0d : ................
8b40 : __ __ __ BYT 0d 0d 0d 0d 0d 0d 0f 01 0d 0d 0d 0f 0f 0d 0d 0d : ................
8b50 : __ __ __ BYT 05 0f 0d 05 0f 0d 05 0f 0d 05 0f 0d 05 0f 0d 05 : ................
8b60 : __ __ __ BYT 0f 05 05 0f 0d 05 0f 0d 0d 0f 0d 05 0f 0d 05 0d : ................
8b70 : __ __ __ BYT 0d 0f 0f 0d 05 0f 0f 0d 05 0f 0f 05 05 0f 05 05 : ................
8b80 : __ __ __ BYT 0f 05 05 0f 05 05 0f 05 05 05 05 05 0f 05 0f 0f : ................
8b90 : __ __ __ BYT 0d 05 0d 05 05 0f 05 0d 05 05 05 0f 05 0d 0f 0d : ................
8ba0 : __ __ __ BYT 0e 0f 0f 0e 0e 0e 0f 0f 0d 0d 0d 0d 0d 0d 0d 0e : ................
8bb0 : __ __ __ BYT 0e 0e 0e 0e 0f 0e 0f 0f 0f 0d 0d 0e 0e 0f 0f 0d : ................
8bc0 : __ __ __ BYT 0d 0e 0d 0d 0e 0e 0d 0e                         : ........
--------------------------------------------------------------------
font_nz_co:
8c00 : __ __ __ BYT 0f 0d 01 0f 0d 01 0d 0d 01 0f 0d 01 0d 0d 01 0f : ................
8c10 : __ __ __ BYT 0d 01 0f 0d 01 0f 0d 01 0d 01 0d 0d 01 0f 0d 01 : ................
8c20 : __ __ __ BYT 0f 0d 01 0f 0d 01 0d 0d 0f 0d 0d 0f 0d 0d 0f 0f : ................
8c30 : __ __ __ BYT 0d 0f 0d 0d 0f 0f 0d 0f 0d 01 05 0f 0f 0f 0f 0f : ................
8c40 : __ __ __ BYT 0f 0d 0f 0d 0d 0f 0d 01 0f 0d 0d 0f 0d 01 0d 0d : ................
8c50 : __ __ __ BYT 05 0f 0d 05 0f 0d 05 0f 0f 05 0f 0d 05 0f 0f 05 : ................
8c60 : __ __ __ BYT 0f 0d 05 0f 05 05 0f 0d 05 0f 05 0f 0f 0f 0d 0d : ................
8c70 : __ __ __ BYT 05 0f 0d 05 0f 0d 0d 0d 05 0f 0f 05 05 0f 05 05 : ................
8c80 : __ __ __ BYT 05 05 05 0f 05 05 05 05 05 0f 05 05 05 05 05 0f : ................
8c90 : __ __ __ BYT 05 0d 05 05 0f 05 0f 0d 05 05 0f 05 05 0f 0d 0d : ................
8ca0 : __ __ __ BYT 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e : ................
8cb0 : __ __ __ BYT 0e 0e 0e 0e 0e 0e 0e 0f 0e 0e 0e 0e 0e 05 05 05 : ................
8cc0 : __ __ __ BYT 0e 05 05 05 0e 0e 05 0e                         : ........
--------------------------------------------------------------------
font_lc_an_co:
8d00 : __ __ __ BYT 0e 0e 0e 0d 0d 0e 0e 0e 0e 0e 0f 0d 0e 0e 0e 0d : ................
8d10 : __ __ __ BYT 01 0e 0e 0e 0f 0f 0e 01 0e 0e 01 0f 0e 01 0f 0e : ................
8d20 : __ __ __ BYT 0e 0e 0e 0e 0e 0e 0e 0e 0f 0d 01 0f 0d 01 0f 0d : ................
8d30 : __ __ __ BYT 01 0d 01 01 0f 0d 01 0d 01 0f 0d 01 0d 01 01 01 : ................
8d40 : __ __ __ BYT 0f 0d 0d 0d 01 0d 0f 0d 01 0f 01 0f 0d 01 0e 0e : ................
8d50 : __ __ __ BYT 05 0d 0d 05 0e 0d 0f 0f 0e 0f 0f 0d 0f 0d 01 0f : ................
8d60 : __ __ __ BYT 0f 0f 0f 0d 0f 0f 0d 0d 0f 01 0f 0d 0f 0f 05 0f : ................
8d70 : __ __ __ BYT 0d 0f 0d 05 0f 0d 0f 0e 05 05 0f 05 05 0f 05 0f : ................
8d80 : __ __ __ BYT 0d 05 05 0f 05 05 0f 05 0f 05 05 0f 05 0f 0f 0f : ................
8d90 : __ __ __ BYT 0f 0d 05 05 05 05 05 0f 0f 0f 0f 05 0f 0f 0f 0e : ................
8da0 : __ __ __ BYT 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e 0f 0f 0e 0e 0f : ................
8db0 : __ __ __ BYT 0f 0f 05 0f 0f 0f 0f 0f 05 0f 0f 0f 0f 0f 0f 0f : ................
8dc0 : __ __ __ BYT 0e 0e 0e 0e 0e 0e 0e 0e                         : ........
--------------------------------------------------------------------
font_lc_oz_co:
8e00 : __ __ __ BYT 0e 0e 0e 0f 0f 0e 0e 0e 0e 0e 0e 0e 0e 0f 0e 01 : ................
8e10 : __ __ __ BYT 0e 0e 0f 0f 0f 0e 0f 0f 0f 0f 0e 0e 0f 0f 0f 0f : ................
8e20 : __ __ __ BYT 0f 0f 0f 0e 0e 0e 0e 0e 0f 0d 01 0f 0d 01 0f 0d : ................
8e30 : __ __ __ BYT 01 0d 01 0d 0d 01 0d 0d 01 0f 0d 0f 01 0d 01 0d : ................
8e40 : __ __ __ BYT 0f 01 0f 01 01 0f 01 0d 0f 01 0f 0d 01 0e 0e 0e : ................
8e50 : __ __ __ BYT 05 0f 0d 0f 0f 0d 0f 0f 0d 0f 0f 0f 0d 0f 0f 0f : ................
8e60 : __ __ __ BYT 0f 0d 0f 0f 01 0f 0d 0f 0f 0d 0f 0d 0f 0d 0f 0f : ................
8e70 : __ __ __ BYT 0f 01 0f 0f 0d 0e 0e 0e 05 05 0f 05 0f 0f 05 05 : ................
8e80 : __ __ __ BYT 0f 05 0f 0f 05 05 0f 05 05 0f 05 0f 0d 05 0f 05 : ................
8e90 : __ __ __ BYT 05 0f 05 0f 05 0f 0f 05 0f 0d 05 05 0f 0f 0e 0e : ................
8ea0 : __ __ __ BYT 0e 0f 0f 05 0e 0f 0f 0e 05 0e 0f 0e 0e 0e 0e 0e : ................
8eb0 : __ __ __ BYT 0e 0e 0f 0f 0f 0f 0e 0e 0e 0e 0e 0e 0e 0e 0e 0e : ................
8ec0 : __ __ __ BYT 05 0f 0e 0e 0e 0e 0e 0e                         : ........
--------------------------------------------------------------------
font_dig_co:
8f00 : __ __ __ BYT 0f 0d 01 01 0f 0d 01 0d 01 01 0d 0f 01 0f 0d 01 : ................
8f10 : __ __ __ BYT 0f 0d 01 0f 0d 01 0f 0d 01 0d 01 01 0f 0f 01 01 : ................
8f20 : __ __ __ BYT 0f 0f 0f 0f 01 01 01 0e 0f 0f 01 0d 0f 0d 01 0f : ................
8f30 : __ __ __ BYT 0f 0d 0f 0f 0d 0f 0d 01 0f 0d 01 0f 0f 0d 0f 0d : ................
8f40 : __ __ __ BYT 01 0f 0f 0d 0d 0f 0d 0d 0f 0e 0f 0d 0d 0d 0d 0e : ................
8f50 : __ __ __ BYT 05 0f 0d 0f 05 0f 0f 0f 0f 0f 05 05 0f 05 0f 0d : ................
8f60 : __ __ __ BYT 05 0f 0d 0f 0f 0e 05 0f 0d 05 0f 0f 0f 0f 0f 0f : ................
8f70 : __ __ __ BYT 0d 0f 0f 0f 0f 0e 0e 0e 05 05 0f 05 05 05 0f 05 : ................
8f80 : __ __ __ BYT 05 0f 0f 0f 05 05 05 0f 05 05 0f 0f 05 0e 05 05 : ................
8f90 : __ __ __ BYT 0f 05 05 0f 0f 0f 05 05 0f 05 0e 0e 0e 0e 0e 0e : ................
8fa0 : __ __ __ BYT 0e 0f 0f 0e 0e 0e 0f 0f 0f 0f 0e 0e 0f 0f 0f 0e : ................
8fb0 : __ __ __ BYT 0e 0e 0e 0e 0f 0e 0f 0f 0f 0f 0f 0e 0e 0f 0f 05 : ................
8fc0 : __ __ __ BYT 05 0e 0e 0e 0e 0e 0e 0e                         : ........
--------------------------------------------------------------------
font_sym_co:
9000 : __ __ __ BYT 0f 0d 01 0d 01 01 0e 0f 0f 0e 0e 0e 0e 0f 0e 0f : ................
9010 : __ __ __ BYT 0d 01 01 0e 0e 0e 0e 0d 01 0d 01 0f 01 0d 01 01 : ................
9020 : __ __ __ BYT 0e 0d 01 0e 0e 0e 0d 01 0f 0d 01 0f 0f 0d 0d 0f : ................
9030 : __ __ __ BYT 01 0e 0e 0e 0f 0f 01 0f 0f 0f 0d 0f 0d 01 0f 0f : ................
9040 : __ __ __ BYT 0d 0f 0f 0d 0f 0f 0d 0e 0d 0f 0f 0d 0d 01 0f 0d : ................
9050 : __ __ __ BYT 0f 0f 0d 05 0f 0d 0f 0d 0f 0f 0f 0d 01 0f 0d 0f : ................
9060 : __ __ __ BYT 0f 05 0e 0f 0d 01 0e 0f 0f 05 0f 0e 0f 0f 0f 0f : ................
9070 : __ __ __ BYT 0e 05 0f 0f 0d 0f 0f 0f 05 05 0f 05 0f 0f 0f 0e : ................
9080 : __ __ __ BYT 0f 0f 0e 0f 0e 0f 0f 0f 0e 05 0e 0e 0e 0e 0e 05 : ................
9090 : __ __ __ BYT 05 05 0f 0f 0e 05 05 0e 0e 05 0f 05 05 0f 0f 05 : ................
90a0 : __ __ __ BYT 0e 0e 0e 0e 0f 0f 0e 0e 0f 0f 0f 0e 0e 0e 0f 0e : ................
90b0 : __ __ __ BYT 0e 0f 0d 0e 0e 0e 0e 0f 0e 0d 0d 0d 0d 0d 0e 0e : ................
90c0 : __ __ __ BYT 0e 0e 0e 0e 0e 0d 0f 0e                         : ........
--------------------------------------------------------------------
uii_data:
90c8 : __ __ __ BSS	513
--------------------------------------------------------------------
uii_status:
92c9 : __ __ __ BSS	257
--------------------------------------------------------------------
hdr:
93ca : __ __ __ BSS	1084
--------------------------------------------------------------------
modplay:
9808 : __ __ __ BSS	938
--------------------------------------------------------------------
BLIT_CODE:
9c00 : __ __ __ BSS	224
--------------------------------------------------------------------
tbuffer:
9ce0 : __ __ __ BSS	320
--------------------------------------------------------------------
row_sin:
9e20 : __ __ __ BSS	200
--------------------------------------------------------------------
row_buf:
9f00 : __ __ __ BSS	160
--------------------------------------------------------------------
tex_flat:
9fa0 : __ __ __ BSS	1024
