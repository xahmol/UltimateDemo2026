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
0811 : a2 7a __ LDX #$7a
0813 : a0 f8 __ LDY #$f8
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 8e __ CPX #$8e
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
; 101, "/home/xahmol/git/UltimateDemo2026/src/main.c"
.s1:
0a00 : a5 53 __ LDA T2 + 0 
0a02 : 8d 87 bf STA $bf87 ; (main@stack + 0)
0a05 : a5 54 __ LDA T3 + 0 
0a07 : 8d 88 bf STA $bf88 ; (main@stack + 1)
.s4:
0a0a : a9 60 __ LDA #$60
0a0c : 8d 10 03 STA $0310 
0a0f : a9 10 __ LDA #$10
0a11 : 8d 02 a0 STA $a002 
0a14 : a9 03 __ LDA #$03
0a16 : 8d 03 a0 STA $a003 
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
0a36 : a9 5b __ LDA #$5b
0a38 : 8d 18 03 STA $0318 
0a3b : a9 0e __ LDA #$0e
0a3d : 8d 19 03 STA $0319 
0a40 : a9 71 __ LDA #$71
0a42 : 85 16 __ STA P9 
0a44 : a9 10 __ LDA #$10
0a46 : 85 17 __ STA P10 
0a48 : 20 66 0e JSR $0e66 ; (screen_init.s4 + 0)
0a4b : a9 22 __ LDA #$22
0a4d : 85 10 __ STA P3 
0a4f : a9 11 __ LDA #$11
0a51 : 85 11 __ STA P4 
0a53 : 20 9b 10 JSR $109b ; (screen_info.s4 + 0)
0a56 : a9 00 __ LDA #$00
0a58 : 8d 09 dc STA $dc09 
0a5b : 8d 08 dc STA $dc08 
0a5e : 85 54 __ STA T3 + 0 
.l5:
0a60 : 20 43 11 JSR $1143 ; (uii_detect.s4 + 0)
0a63 : aa __ __ TAX
0a64 : d0 07 __ BNE $0a6d ; (main.s7 + 0)
.s6:
0a66 : ad 09 dc LDA $dc09 
0a69 : c9 0a __ CMP #$0a
0a6b : 90 f3 __ BCC $0a60 ; (main.l5 + 0)
.s7:
0a6d : 20 43 11 JSR $1143 ; (uii_detect.s4 + 0)
0a70 : aa __ __ TAX
0a71 : d0 3b __ BNE $0aae ; (main.s9 + 0)
.s8:
0a73 : 85 12 __ STA P5 
0a75 : a9 c7 __ LDA #$c7
0a77 : 85 10 __ STA P3 
0a79 : a9 11 __ LDA #$11
0a7b : 85 14 __ STA P7 
0a7d : a9 11 __ LDA #$11
0a7f : 85 11 __ STA P4 
0a81 : a9 cd __ LDA #$cd
0a83 : 85 13 __ STA P6 
0a85 : 20 64 11 JSR $1164 ; (screen_result.s4 + 0)
0a88 : a9 61 __ LDA #$61
0a8a : 85 12 __ STA P5 
0a8c : a9 12 __ LDA #$12
0a8e : 85 13 __ STA P6 
0a90 : a9 12 __ LDA #$12
0a92 : a2 86 __ LDX #$86
.s71:
0a94 : 86 14 __ STX P7 
0a96 : 85 15 __ STA P8 
0a98 : 20 da 11 JSR $11da ; (screen_error_exit.s4 + 0)
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
0ab0 : 8d 55 73 STA $7355 ; (uii_target + 0)
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
0ac9 : 20 a1 12 JSR $12a1 ; (uii_sendcommand.s4 + 0)
0acc : 20 1c 13 JSR $131c ; (uii_readdata.s4 + 0)
0acf : 20 4c 13 JSR $134c ; (uii_readstatus.s4 + 0)
0ad2 : 20 aa 13 JSR $13aa ; (uii_accept.s4 + 0)
0ad5 : ad f9 7c LDA $7cf9 ; (uii_status[0] + 0)
0ad8 : c9 30 __ CMP #$30
0ada : d0 12 __ BNE $0aee ; (main.s10 + 0)
.s68:
0adc : ad fa 7c LDA $7cfa ; (uii_status[0] + 1)
0adf : c9 30 __ CMP #$30
0ae1 : d0 0b __ BNE $0aee ; (main.s10 + 0)
.s69:
0ae3 : ad f8 7a LDA $7af8 ; (uii_data[0] + 0)
0ae6 : f0 06 __ BEQ $0aee ; (main.s10 + 0)
.s70:
0ae8 : 20 ba 13 JSR $13ba ; (uci_to_upper@proxy + 0)
0aeb : 4c f9 0a JMP $0af9 ; (main.s12 + 0)
.s10:
0aee : a2 ff __ LDX #$ff
.l11:
0af0 : e8 __ __ INX
0af1 : bd f4 13 LDA $13f4,x 
0af4 : 9d 93 bf STA $bf93,x ; (detail[0] + 0)
0af7 : d0 f7 __ BNE $0af0 ; (main.l11 + 0)
.s12:
0af9 : a9 c7 __ LDA #$c7
0afb : 85 10 __ STA P3 
0afd : a9 11 __ LDA #$11
0aff : 85 11 __ STA P4 
0b01 : 20 58 11 JSR $1158 ; (screen_result@proxy + 0)
0b04 : 20 7c 13 JSR $137c ; (uii_get_hwinfo.s4 + 0)
0b07 : ad f9 7c LDA $7cf9 ; (uii_status[0] + 0)
0b0a : c9 30 __ CMP #$30
0b0c : d0 2e __ BNE $0b3c ; (main.s13 + 0)
.s65:
0b0e : ad fa 7c LDA $7cfa ; (uii_status[0] + 1)
0b11 : c9 30 __ CMP #$30
0b13 : d0 27 __ BNE $0b3c ; (main.s13 + 0)
.s66:
0b15 : 20 ba 13 JSR $13ba ; (uci_to_upper@proxy + 0)
0b18 : aa __ __ TAX
0b19 : f0 21 __ BEQ $0b3c ; (main.s13 + 0)
.s67:
0b1b : a9 01 __ LDA #$01
0b1d : 85 0f __ STA P2 
0b1f : a9 14 __ LDA #$14
0b21 : 85 0e __ STA P1 
0b23 : a9 00 __ LDA #$00
0b25 : 85 0d __ STA P0 
0b27 : 20 c2 10 JSR $10c2 ; (cwin_put_string.s4 + 0)
0b2a : a9 93 __ LDA #$93
0b2c : 85 0d __ STA P0 
0b2e : a9 03 __ LDA #$03
0b30 : 85 0f __ STA P2 
0b32 : a9 bf __ LDA #$bf
0b34 : 85 0e __ STA P1 
0b36 : 20 c2 10 JSR $10c2 ; (cwin_put_string.s4 + 0)
0b39 : 20 a2 10 JSR $10a2 ; (cwin_cursor_newline.s4 + 0)
.s13:
0b3c : a9 0b __ LDA #$0b
0b3e : 85 10 __ STA P3 
0b40 : a9 14 __ LDA #$14
0b42 : 85 11 __ STA P4 
0b44 : 20 9b 10 JSR $109b ; (screen_info.s4 + 0)
0b47 : 20 1b 14 JSR $141b ; (detect_reu.s4 + 0)
0b4a : c9 10 __ CMP #$10
0b4c : b0 03 __ BCS $0b51 ; (main.s14 + 0)
0b4e : 4c 34 0e JMP $0e34 ; (main.s61 + 0)
.s14:
0b51 : a9 15 __ LDA #$15
0b53 : 85 14 __ STA P7 
0b55 : a9 9a __ LDA #$9a
0b57 : 85 13 __ STA P6 
0b59 : 20 70 72 JSR $7270 ; (screen_result@proxy + 0)
0b5c : a9 a0 __ LDA #$a0
0b5e : 85 10 __ STA P3 
0b60 : a9 15 __ LDA #$15
0b62 : 85 11 __ STA P4 
0b64 : 20 9b 10 JSR $109b ; (screen_info.s4 + 0)
0b67 : 20 b7 15 JSR $15b7 ; (turbo_detect.s4 + 0)
0b6a : a9 8d __ LDA #$8d
0b6c : 85 10 __ STA P3 
0b6e : a9 16 __ LDA #$16
0b70 : 85 11 __ STA P4 
0b72 : a5 1b __ LDA ACCU + 0 
0b74 : d0 1b __ BNE $0b91 ; (main.s35 + 0)
.s15:
0b76 : c6 12 __ DEC P5 
0b78 : a9 93 __ LDA #$93
0b7a : 85 13 __ STA P6 
0b7c : a9 16 __ LDA #$16
0b7e : 85 14 __ STA P7 
0b80 : 20 64 11 JSR $1164 ; (screen_result.s4 + 0)
0b83 : a9 a8 __ LDA #$a8
0b85 : 85 10 __ STA P3 
0b87 : a9 16 __ LDA #$16
0b89 : 85 11 __ STA P4 
0b8b : 20 29 12 JSR $1229 ; (screen_hint.s4 + 0)
0b8e : 4c 32 0c JMP $0c32 ; (main.s16 + 0)
.s35:
0b91 : c9 02 __ CMP #$02
0b93 : d0 14 __ BNE $0ba9 ; (main.s36 + 0)
.s60:
0b95 : a9 16 __ LDA #$16
0b97 : a2 ca __ LDX #$ca
.s37:
0b99 : 86 1b __ STX ACCU + 0 
0b9b : 85 1c __ STA ACCU + 1 
0b9d : a9 93 __ LDA #$93
0b9f : 85 13 __ STA P6 
0ba1 : a9 bf __ LDA #$bf
0ba3 : 85 14 __ STA P7 
0ba5 : a0 ff __ LDY #$ff
0ba7 : d0 7e __ BNE $0c27 ; (main.l38 + 0)
.s36:
0ba9 : c9 01 __ CMP #$01
0bab : f0 07 __ BEQ $0bb4 ; (main.s40 + 0)
.s72:
0bad : a9 16 __ LDA #$16
0baf : a2 8d __ LDX #$8d
0bb1 : 4c 99 0b JMP $0b99 ; (main.s37 + 0)
.s40:
0bb4 : 20 d1 16 JSR $16d1 ; (turbo_get.s3 + 0)
0bb7 : 29 0f __ AND #$0f
0bb9 : c9 0e __ CMP #$0e
0bbb : d0 07 __ BNE $0bc4 ; (main.s41 + 0)
.s59:
0bbd : a9 16 __ LDA #$16
0bbf : a2 d5 __ LDX #$d5
0bc1 : 4c 99 0b JMP $0b99 ; (main.s37 + 0)
.s41:
0bc4 : c9 0d __ CMP #$0d
0bc6 : d0 07 __ BNE $0bcf ; (main.s42 + 0)
.s58:
0bc8 : a9 16 __ LDA #$16
0bca : a2 dc __ LDX #$dc
0bcc : 4c 99 0b JMP $0b99 ; (main.s37 + 0)
.s42:
0bcf : c9 0c __ CMP #$0c
0bd1 : d0 07 __ BNE $0bda ; (main.s43 + 0)
.s57:
0bd3 : a9 16 __ LDA #$16
0bd5 : a2 e3 __ LDX #$e3
0bd7 : 4c 99 0b JMP $0b99 ; (main.s37 + 0)
.s43:
0bda : c9 0b __ CMP #$0b
0bdc : d0 07 __ BNE $0be5 ; (main.s44 + 0)
.s56:
0bde : a9 16 __ LDA #$16
0be0 : a2 ea __ LDX #$ea
0be2 : 4c 99 0b JMP $0b99 ; (main.s37 + 0)
.s44:
0be5 : c9 0a __ CMP #$0a
0be7 : d0 07 __ BNE $0bf0 ; (main.s45 + 0)
.s55:
0be9 : a9 16 __ LDA #$16
0beb : a2 f1 __ LDX #$f1
0bed : 4c 99 0b JMP $0b99 ; (main.s37 + 0)
.s45:
0bf0 : c9 09 __ CMP #$09
0bf2 : d0 07 __ BNE $0bfb ; (main.s46 + 0)
.s54:
0bf4 : a9 16 __ LDA #$16
0bf6 : a2 f8 __ LDX #$f8
0bf8 : 4c 99 0b JMP $0b99 ; (main.s37 + 0)
.s46:
0bfb : c9 08 __ CMP #$08
0bfd : d0 07 __ BNE $0c06 ; (main.s47 + 0)
.s53:
0bff : a9 17 __ LDA #$17
0c01 : a2 00 __ LDX #$00
0c03 : 4c 99 0b JMP $0b99 ; (main.s37 + 0)
.s47:
0c06 : c9 07 __ CMP #$07
0c08 : d0 07 __ BNE $0c11 ; (main.s48 + 0)
.s52:
0c0a : a9 17 __ LDA #$17
0c0c : a2 07 __ LDX #$07
0c0e : 4c 99 0b JMP $0b99 ; (main.s37 + 0)
.s48:
0c11 : c9 06 __ CMP #$06
0c13 : d0 07 __ BNE $0c1c ; (main.s49 + 0)
.s51:
0c15 : a9 17 __ LDA #$17
0c17 : a2 0e __ LDX #$0e
0c19 : 4c 99 0b JMP $0b99 ; (main.s37 + 0)
.s49:
0c1c : c9 05 __ CMP #$05
0c1e : d0 8d __ BNE $0bad ; (main.s72 + 0)
.s50:
0c20 : a9 17 __ LDA #$17
0c22 : a2 15 __ LDX #$15
0c24 : 4c 99 0b JMP $0b99 ; (main.s37 + 0)
.l38:
0c27 : c8 __ __ INY
0c28 : b1 1b __ LDA (ACCU + 0),y 
0c2a : 99 93 bf STA $bf93,y ; (detail[0] + 0)
0c2d : d0 f8 __ BNE $0c27 ; (main.l38 + 0)
.s39:
0c2f : 20 64 11 JSR $1164 ; (screen_result.s4 + 0)
.s16:
0c32 : a9 1b __ LDA #$1b
0c34 : 85 10 __ STA P3 
0c36 : a9 17 __ LDA #$17
0c38 : 85 11 __ STA P4 
0c3a : 20 9b 10 JSR $109b ; (screen_info.s4 + 0)
0c3d : 20 36 17 JSR $1736 ; (audio_detect.s4 + 0)
0c40 : aa __ __ TAX
0c41 : d0 23 __ BNE $0c66 ; (main.s26 + 0)
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
0c55 : 20 64 11 JSR $1164 ; (screen_result.s4 + 0)
0c58 : a9 c6 __ LDA #$c6
0c5a : 85 10 __ STA P3 
0c5c : a9 17 __ LDA #$17
0c5e : 85 11 __ STA P4 
0c60 : 20 29 12 JSR $1229 ; (screen_hint.s4 + 0)
0c63 : 4c 06 0d JMP $0d06 ; (main.s18 + 0)
.s26:
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
.l27:
0c8a : e8 __ __ INX
0c8b : bd 35 18 LDA $1835,x 
0c8e : 9d 93 bf STA $bf93,x ; (detail[0] + 0)
0c91 : d0 f7 __ BNE $0c8a ; (main.l27 + 0)
.s28:
0c93 : 20 37 18 JSR $1837 ; (strcat.s4 + 0)
0c96 : a9 17 __ LDA #$17
0c98 : 85 11 __ STA P4 
0c9a : a9 af __ LDA #$af
0c9c : 85 10 __ STA P3 
0c9e : 20 58 11 JSR $1158 ; (screen_result@proxy + 0)
0ca1 : a5 53 __ LDA T2 + 0 
0ca3 : f0 61 __ BEQ $0d06 ; (main.s18 + 0)
.s29:
0ca5 : a9 6a __ LDA #$6a
0ca7 : 85 10 __ STA P3 
0ca9 : a9 18 __ LDA #$18
0cab : 85 11 __ STA P4 
0cad : 20 9b 10 JSR $109b ; (screen_info.s4 + 0)
0cb0 : 20 7b 18 JSR $187b ; (uii_change_dir.s4 + 0)
0cb3 : 20 02 19 JSR $1902 ; (modplay_load.s4 + 0)
0cb6 : a5 1b __ LDA ACCU + 0 
0cb8 : d0 1a __ BNE $0cd4 ; (main.s32 + 0)
.s30:
0cba : a9 0d __ LDA #$0d
0cbc : 85 10 __ STA P3 
0cbe : a9 1d __ LDA #$1d
0cc0 : 85 11 __ STA P4 
0cc2 : a9 1d __ LDA #$1d
0cc4 : a2 2a __ LDX #$2a
.s31:
0cc6 : 86 13 __ STX P6 
0cc8 : 85 14 __ STA P7 
0cca : a9 00 __ LDA #$00
0ccc : 85 12 __ STA P5 
.s73:
0cce : 20 64 11 JSR $1164 ; (screen_result.s4 + 0)
0cd1 : 4c 06 0d JMP $0d06 ; (main.s18 + 0)
.s32:
0cd4 : 20 49 1a JSR $1a49 ; (modplay_init.s4 + 0)
0cd7 : a9 0d __ LDA #$0d
0cd9 : 85 10 __ STA P3 
0cdb : a9 1d __ LDA #$1d
0cdd : 85 11 __ STA P4 
0cdf : a5 1b __ LDA ACCU + 0 
0ce1 : f0 1c __ BEQ $0cff ; (main.s33 + 0)
.s34:
0ce3 : a9 01 __ LDA #$01
0ce5 : e6 54 __ INC T3 + 0 
0ce7 : 85 12 __ STA P5 
0ce9 : 8d c7 82 STA $82c7 ; (modplay.stereo + 0)
0cec : 8d c9 82 STA $82c9 ; (modplay.loop_song + 0)
0cef : a9 a0 __ LDA #$a0
0cf1 : 8d c6 82 STA $82c6 ; (modplay.master_volume + 0)
0cf4 : a9 13 __ LDA #$13
0cf6 : 85 13 __ STA P6 
0cf8 : a9 1d __ LDA #$1d
0cfa : 85 14 __ STA P7 
0cfc : 4c ce 0c JMP $0cce ; (main.s73 + 0)
.s33:
0cff : a9 1d __ LDA #$1d
0d01 : a2 1b __ LDX #$1b
0d03 : 4c c6 0c JMP $0cc6 ; (main.s31 + 0)
.s18:
0d06 : 20 a2 10 JSR $10a2 ; (cwin_cursor_newline.s4 + 0)
0d09 : a9 39 __ LDA #$39
0d0b : 85 10 __ STA P3 
0d0d : a9 1d __ LDA #$1d
0d0f : 85 11 __ STA P4 
0d11 : 20 9b 10 JSR $109b ; (screen_info.s4 + 0)
0d14 : 20 a2 10 JSR $10a2 ; (cwin_cursor_newline.s4 + 0)
0d17 : a9 8e __ LDA #$8e
0d19 : 85 10 __ STA P3 
0d1b : a9 1d __ LDA #$1d
0d1d : 85 11 __ STA P4 
0d1f : 20 4d 1d JSR $1d4d ; (screen_wait_key.s4 + 0)
0d22 : 20 af 1d JSR $1daf ; (gears_run.s1 + 0)
0d25 : a5 54 __ LDA T3 + 0 
0d27 : f0 03 __ BEQ $0d2c ; (main.s19 + 0)
.s25:
0d29 : 20 6e 3e JSR $3e6e ; (modplay_start.s4 + 0)
.s19:
0d2c : 20 be 4c JSR $4cbe ; (mandel_run.s4 + 0)
0d2f : 20 7c 51 JSR $517c ; (ball_run.s1 + 0)
0d32 : 20 4c 5f JSR $5f4c ; (vectors_run.s1 + 0)
0d35 : 20 4c 64 JSR $644c ; (plasma_run.s1 + 0)
0d38 : 20 07 67 JSR $6707 ; (tunnel_run.s1 + 0)
0d3b : a9 10 __ LDA #$10
0d3d : 8d 02 a0 STA $a002 
0d40 : a9 03 __ LDA #$03
0d42 : 8d 03 a0 STA $a003 
0d45 : a5 54 __ LDA T3 + 0 
0d47 : f0 03 __ BEQ $0d4c ; (main.l20 + 0)
.s24:
0d49 : 20 94 6c JSR $6c94 ; (modplay_stop.s4 + 0)
.l20:
0d4c : 20 e4 ff JSR $ffe4 
0d4f : aa __ __ TAX
0d50 : d0 fa __ BNE $0d4c ; (main.l20 + 0)
.s21:
0d52 : 20 f1 15 JSR $15f1 ; (turbo_set.s4 + 0)
0d55 : a9 cd __ LDA #$cd
0d57 : 85 16 __ STA P9 
0d59 : a9 6c __ LDA #$6c
0d5b : 85 17 __ STA P10 
0d5d : 20 66 0e JSR $0e66 ; (screen_init.s4 + 0)
0d60 : 20 a2 10 JSR $10a2 ; (cwin_cursor_newline.s4 + 0)
0d63 : a9 e2 __ LDA #$e2
0d65 : 85 10 __ STA P3 
0d67 : a9 6c __ LDA #$6c
0d69 : 85 11 __ STA P4 
0d6b : 20 9b 10 JSR $109b ; (screen_info.s4 + 0)
0d6e : a9 01 __ LDA #$01
0d70 : 85 12 __ STA P5 
0d72 : 20 a2 10 JSR $10a2 ; (cwin_cursor_newline.s4 + 0)
0d75 : a9 fa __ LDA #$fa
0d77 : 85 10 __ STA P3 
0d79 : a9 6d __ LDA #$6d
0d7b : 85 14 __ STA P7 
0d7d : a9 6c __ LDA #$6c
0d7f : 85 11 __ STA P4 
0d81 : a9 00 __ LDA #$00
0d83 : 85 13 __ STA P6 
0d85 : 20 64 11 JSR $1164 ; (screen_result.s4 + 0)
0d88 : a9 16 __ LDA #$16
0d8a : 85 10 __ STA P3 
0d8c : a9 6d __ LDA #$6d
0d8e : 85 14 __ STA P7 
0d90 : a9 6d __ LDA #$6d
0d92 : 85 11 __ STA P4 
0d94 : a9 1c __ LDA #$1c
0d96 : 85 13 __ STA P6 
0d98 : 20 64 11 JSR $1164 ; (screen_result.s4 + 0)
0d9b : a9 2b __ LDA #$2b
0d9d : 85 10 __ STA P3 
0d9f : a9 6d __ LDA #$6d
0da1 : 85 14 __ STA P7 
0da3 : a9 6d __ LDA #$6d
0da5 : 85 11 __ STA P4 
0da7 : a9 31 __ LDA #$31
0da9 : 85 13 __ STA P6 
0dab : 20 64 11 JSR $1164 ; (screen_result.s4 + 0)
0dae : a9 43 __ LDA #$43
0db0 : 85 10 __ STA P3 
0db2 : a9 6d __ LDA #$6d
0db4 : 85 14 __ STA P7 
0db6 : a9 6d __ LDA #$6d
0db8 : 85 11 __ STA P4 
0dba : a9 49 __ LDA #$49
0dbc : 85 13 __ STA P6 
0dbe : 20 64 11 JSR $1164 ; (screen_result.s4 + 0)
0dc1 : a9 5d __ LDA #$5d
0dc3 : 85 10 __ STA P3 
0dc5 : a9 6d __ LDA #$6d
0dc7 : 85 14 __ STA P7 
0dc9 : a9 6d __ LDA #$6d
0dcb : 85 11 __ STA P4 
0dcd : a9 63 __ LDA #$63
0dcf : 85 13 __ STA P6 
0dd1 : 20 64 11 JSR $1164 ; (screen_result.s4 + 0)
0dd4 : a9 79 __ LDA #$79
0dd6 : 85 10 __ STA P3 
0dd8 : a9 6d __ LDA #$6d
0dda : 85 14 __ STA P7 
0ddc : a9 6d __ LDA #$6d
0dde : 85 11 __ STA P4 
0de0 : a9 7f __ LDA #$7f
0de2 : 85 13 __ STA P6 
0de4 : 20 64 11 JSR $1164 ; (screen_result.s4 + 0)
0de7 : a5 54 __ LDA T3 + 0 
0de9 : f0 13 __ BEQ $0dfe ; (main.s22 + 0)
.s23:
0deb : a9 0d __ LDA #$0d
0ded : 85 10 __ STA P3 
0def : a9 6d __ LDA #$6d
0df1 : 85 14 __ STA P7 
0df3 : a9 1d __ LDA #$1d
0df5 : 85 11 __ STA P4 
0df7 : a9 91 __ LDA #$91
0df9 : 85 13 __ STA P6 
0dfb : 20 64 11 JSR $1164 ; (screen_result.s4 + 0)
.s22:
0dfe : 20 a2 10 JSR $10a2 ; (cwin_cursor_newline.s4 + 0)
0e01 : a9 a8 __ LDA #$a8
0e03 : 85 10 __ STA P3 
0e05 : a9 6d __ LDA #$6d
0e07 : 85 11 __ STA P4 
0e09 : 20 9b 10 JSR $109b ; (screen_info.s4 + 0)
0e0c : a9 c5 __ LDA #$c5
0e0e : 85 10 __ STA P3 
0e10 : a9 6d __ LDA #$6d
0e12 : 85 11 __ STA P4 
0e14 : 20 9b 10 JSR $109b ; (screen_info.s4 + 0)
0e17 : 20 a2 10 JSR $10a2 ; (cwin_cursor_newline.s4 + 0)
0e1a : a9 00 __ LDA #$00
0e1c : 85 10 __ STA P3 
0e1e : 85 11 __ STA P4 
0e20 : 20 4d 1d JSR $1d4d ; (screen_wait_key.s4 + 0)
0e23 : a9 0e __ LDA #$0e
0e25 : 8d 20 d0 STA $d020 
0e28 : a9 06 __ LDA #$06
0e2a : 8d 21 d0 STA $d021 
0e2d : a9 00 __ LDA #$00
0e2f : 85 1b __ STA ACCU + 0 
0e31 : 4c a1 0a JMP $0aa1 ; (main.s3 + 0)
.s61:
0e34 : a2 00 __ LDX #$00
0e36 : 86 12 __ STX P5 
0e38 : aa __ __ TAX
0e39 : f0 06 __ BEQ $0e41 ; (main.s62 + 0)
.s64:
0e3b : a9 15 __ LDA #$15
0e3d : a2 4c __ LDX #$4c
0e3f : 90 04 __ BCC $0e45 ; (main.s63 + 0)
.s62:
0e41 : a9 11 __ LDA #$11
0e43 : a2 cd __ LDX #$cd
.s63:
0e45 : 86 13 __ STX P6 
0e47 : 85 14 __ STA P7 
0e49 : 20 70 72 JSR $7270 ; (screen_result@proxy + 0)
0e4c : a9 63 __ LDA #$63
0e4e : 85 12 __ STA P5 
0e50 : a9 15 __ LDA #$15
0e52 : 85 13 __ STA P6 
0e54 : a9 15 __ LDA #$15
0e56 : a2 7a __ LDX #$7a
0e58 : 4c 94 0a JMP $0a94 ; (main.s71 + 0)
--------------------------------------------------------------------
nmi_handler: ; nmi_handler()->void
;  96, "/home/xahmol/git/UltimateDemo2026/src/main.c"
.s1:
0e5b : 48 __ __ PHA
0e5c : 8a __ __ TXA
0e5d : 48 __ __ PHA
0e5e : 98 __ __ TYA
0e5f : 48 __ __ PHA
.s3:
0e60 : 68 __ __ PLA
0e61 : a8 __ __ TAY
0e62 : 68 __ __ PLA
0e63 : aa __ __ TAX
0e64 : 68 __ __ PLA
0e65 : 40 __ __ RTI
--------------------------------------------------------------------
screen_init: ; screen_init(const u8*)->void
;  13, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
0e66 : a9 00 __ LDA #$00
0e68 : 85 0d __ STA P0 
0e6a : 85 43 __ STA T0 + 0 
0e6c : 85 0e __ STA P1 
0e6e : 85 10 __ STA P3 
0e70 : 20 0b 0f JSR $0f0b ; (vic_setmode@proxy + 0)
0e73 : a9 00 __ LDA #$00
0e75 : 8d e8 79 STA $79e8 ; (cw.sx + 0)
0e78 : 8d e9 79 STA $79e9 ; (cw.sy + 0)
0e7b : 8d ec 79 STA $79ec ; (cw.cx + 0)
0e7e : 8d ed 79 STA $79ed ; (cw.cy + 0)
0e81 : a2 19 __ LDX #$19
0e83 : 8e eb 79 STX $79eb ; (cw.wy + 0)
0e86 : 8d 20 d0 STA $d020 
0e89 : 8d 21 d0 STA $d021 
0e8c : 8d f0 79 STA $79f0 ; (cw.sp + 0)
0e8f : 8d f2 79 STA $79f2 ; (cw.cp + 0)
0e92 : a9 04 __ LDA #$04
0e94 : 8d f1 79 STA $79f1 ; (cw.sp + 1)
0e97 : 85 44 __ STA T0 + 1 
0e99 : a9 d8 __ LDA #$d8
0e9b : 8d f3 79 STA $79f3 ; (cw.cp + 1)
0e9e : 85 46 __ STA T1 + 1 
0ea0 : a2 00 __ LDX #$00
0ea2 : 86 45 __ STX T1 + 0 
0ea4 : a9 28 __ LDA #$28
0ea6 : 8d ea 79 STA $79ea ; (cw.wx + 0)
.l8:
0ea9 : 85 1b __ STA ACCU + 0 
0eab : a0 00 __ LDY #$00
.l9:
0ead : a9 20 __ LDA #$20
0eaf : 91 43 __ STA (T0 + 0),y 
0eb1 : a9 01 __ LDA #$01
0eb3 : 91 45 __ STA (T1 + 0),y 
0eb5 : c8 __ __ INY
0eb6 : c4 1b __ CPY ACCU + 0 
0eb8 : 90 f3 __ BCC $0ead ; (screen_init.l9 + 0)
.l6:
0eba : e8 __ __ INX
0ebb : ec eb 79 CPX $79eb ; (cw.wy + 0)
0ebe : 90 2f __ BCC $0eef ; (screen_init.s5 + 0)
.s7:
0ec0 : a9 00 __ LDA #$00
0ec2 : 85 12 __ STA P5 
0ec4 : a9 10 __ LDA #$10
0ec6 : 85 14 __ STA P7 
0ec8 : a9 05 __ LDA #$05
0eca : 85 15 __ STA P8 
0ecc : a9 60 __ LDA #$60
0ece : 85 13 __ STA P6 
0ed0 : 20 65 0f JSR $0f65 ; (header_line.s4 + 0)
0ed3 : e6 12 __ INC P5 
0ed5 : a5 16 __ LDA P9 ; (title + 0)
0ed7 : 85 13 __ STA P6 
0ed9 : a5 17 __ LDA P10 ; (title + 1)
0edb : 85 14 __ STA P7 
0edd : a9 0d __ LDA #$0d
0edf : 85 15 __ STA P8 
0ee1 : 20 65 0f JSR $0f65 ; (header_line.s4 + 0)
0ee4 : a9 00 __ LDA #$00
0ee6 : 8d ec 79 STA $79ec ; (cw.cx + 0)
0ee9 : a9 03 __ LDA #$03
0eeb : 8d ed 79 STA $79ed ; (cw.cy + 0)
.s3:
0eee : 60 __ __ RTS
.s5:
0eef : a5 43 __ LDA T0 + 0 
0ef1 : 69 28 __ ADC #$28
0ef3 : 85 43 __ STA T0 + 0 
0ef5 : 90 03 __ BCC $0efa ; (screen_init.s11 + 0)
.s10:
0ef7 : e6 44 __ INC T0 + 1 
0ef9 : 18 __ __ CLC
.s11:
0efa : a5 45 __ LDA T1 + 0 
0efc : 69 28 __ ADC #$28
0efe : 85 45 __ STA T1 + 0 
0f00 : 90 02 __ BCC $0f04 ; (screen_init.s13 + 0)
.s12:
0f02 : e6 46 __ INC T1 + 1 
.s13:
0f04 : ad ea 79 LDA $79ea ; (cw.wx + 0)
0f07 : f0 b1 __ BEQ $0eba ; (screen_init.l6 + 0)
0f09 : d0 9e __ BNE $0ea9 ; (screen_init.l8 + 0)
--------------------------------------------------------------------
vic_setmode@proxy: ; vic_setmode@proxy
0f0b : a9 04 __ LDA #$04
0f0d : 85 0f __ STA P2 
0f0f : a9 18 __ LDA #$18
0f11 : 85 11 __ STA P4 
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  97, "/home/xahmol/oscar64/include/c64/vic.h"
.s4:
0f13 : a4 0d __ LDY P0 ; (mode + 0)
0f15 : c0 02 __ CPY #$02
0f17 : d0 09 __ BNE $0f22 ; (vic_setmode.s5 + 0)
.s10:
0f19 : a9 5b __ LDA #$5b
0f1b : 8d 11 d0 STA $d011 
.s8:
0f1e : a9 08 __ LDA #$08
0f20 : d0 0c __ BNE $0f2e ; (vic_setmode.s7 + 0)
.s5:
0f22 : b0 36 __ BCS $0f5a ; (vic_setmode.s6 + 0)
.s9:
0f24 : a9 1b __ LDA #$1b
0f26 : 8d 11 d0 STA $d011 
0f29 : 98 __ __ TYA
0f2a : f0 f2 __ BEQ $0f1e ; (vic_setmode.s8 + 0)
.s11:
0f2c : a9 18 __ LDA #$18
.s7:
0f2e : 8d 16 d0 STA $d016 
0f31 : ad 00 dd LDA $dd00 
0f34 : 29 fc __ AND #$fc
0f36 : 85 1b __ STA ACCU + 0 
0f38 : a5 0f __ LDA P2 ; (text + 1)
0f3a : 0a __ __ ASL
0f3b : 2a __ __ ROL
0f3c : 29 01 __ AND #$01
0f3e : 2a __ __ ROL
0f3f : 49 03 __ EOR #$03
0f41 : 05 1b __ ORA ACCU + 0 
0f43 : 8d 00 dd STA $dd00 
0f46 : a5 0f __ LDA P2 ; (text + 1)
0f48 : 29 3c __ AND #$3c
0f4a : 0a __ __ ASL
0f4b : 0a __ __ ASL
0f4c : 85 1b __ STA ACCU + 0 
0f4e : a5 11 __ LDA P4 ; (font + 1)
0f50 : 29 38 __ AND #$38
0f52 : 4a __ __ LSR
0f53 : 4a __ __ LSR
0f54 : 05 1b __ ORA ACCU + 0 
0f56 : 8d 18 d0 STA $d018 
.s3:
0f59 : 60 __ __ RTS
.s6:
0f5a : a9 3b __ LDA #$3b
0f5c : 8d 11 d0 STA $d011 
0f5f : c0 03 __ CPY #$03
0f61 : d0 c9 __ BNE $0f2c ; (vic_setmode.s11 + 0)
0f63 : f0 b9 __ BEQ $0f1e ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
header_line: ; header_line(u8,const u8*,u8)->void
;  41, "/home/xahmol/git/UltimateDemo2026/src/screen.c"
.s4:
0f65 : a5 13 __ LDA P6 ; (text + 0)
0f67 : 85 0d __ STA P0 
0f69 : a5 14 __ LDA P7 ; (text + 1)
0f6b : 85 0e __ STA P1 
0f6d : 20 44 10 JSR $1044 ; (strlen.s4 + 0)
0f70 : a5 12 __ LDA P5 ; (row + 0)
0f72 : 0a __ __ ASL
0f73 : aa __ __ TAX
0f74 : ad f0 79 LDA $79f0 ; (cw.sp + 0)
0f77 : 7d 13 73 ADC $7313,x ; (mul40[0] + 0)
0f7a : 85 46 __ STA T2 + 0 
0f7c : ad f1 79 LDA $79f1 ; (cw.sp + 1)
0f7f : 7d 14 73 ADC $7314,x ; (mul40[0] + 1)
0f82 : 85 47 __ STA T2 + 1 
0f84 : ad f2 79 LDA $79f2 ; (cw.cp + 0)
0f87 : 18 __ __ CLC
0f88 : 7d 13 73 ADC $7313,x ; (mul40[0] + 0)
0f8b : 85 48 __ STA T3 + 0 
0f8d : ad f3 79 LDA $79f3 ; (cw.cp + 1)
0f90 : 7d 14 73 ADC $7314,x ; (mul40[0] + 1)
0f93 : 85 49 __ STA T3 + 1 
0f95 : 38 __ __ SEC
0f96 : a9 28 __ LDA #$28
0f98 : e5 1b __ SBC ACCU + 0 
0f9a : a8 __ __ TAY
0f9b : a9 00 __ LDA #$00
0f9d : e9 00 __ SBC #$00
0f9f : aa __ __ TAX
0fa0 : 0a __ __ ASL
0fa1 : 98 __ __ TYA
0fa2 : 69 00 __ ADC #$00
0fa4 : 85 45 __ STA T1 + 0 
0fa6 : 8a __ __ TXA
0fa7 : 69 00 __ ADC #$00
0fa9 : 4a __ __ LSR
0faa : 66 45 __ ROR T1 + 0 
0fac : a0 00 __ LDY #$00
0fae : a6 15 __ LDX P8 ; (color + 0)
.l8:
0fb0 : a9 a0 __ LDA #$a0
0fb2 : 91 46 __ STA (T2 + 0),y 
0fb4 : 8a __ __ TXA
0fb5 : 91 48 __ STA (T3 + 0),y 
0fb7 : c8 __ __ INY
0fb8 : c0 28 __ CPY #$28
0fba : d0 f4 __ BNE $0fb0 ; (header_line.l8 + 0)
.s9:
0fbc : a9 00 __ LDA #$00
0fbe : 85 4a __ STA T4 + 0 
0fc0 : a5 1b __ LDA ACCU + 0 
0fc2 : f0 1f __ BEQ $0fe3 ; (header_line.s5 + 0)
.s10:
0fc4 : a0 00 __ LDY #$00
.l7:
0fc6 : b1 13 __ LDA (P6),y ; (text + 0)
0fc8 : 4a __ __ LSR
0fc9 : 4a __ __ LSR
0fca : 4a __ __ LSR
0fcb : 4a __ __ LSR
0fcc : 4a __ __ LSR
0fcd : aa __ __ TAX
0fce : bd 45 73 LDA $7345,x ; (p2smap[0] + 0)
0fd1 : 51 13 __ EOR (P6),y ; (text + 0)
0fd3 : 09 80 __ ORA #$80
0fd5 : 99 c1 bf STA $bfc1,y ; (buf[0] + 0)
0fd8 : c8 __ __ INY
0fd9 : c4 1b __ CPY ACCU + 0 
0fdb : b0 04 __ BCS $0fe1 ; (header_line.s11 + 0)
.s6:
0fdd : c0 28 __ CPY #$28
0fdf : 90 e5 __ BCC $0fc6 ; (header_line.l7 + 0)
.s11:
0fe1 : 84 4a __ STY T4 + 0 
.s5:
0fe3 : a5 45 __ LDA T1 + 0 
0fe5 : 85 0d __ STA P0 
0fe7 : a5 12 __ LDA P5 ; (row + 0)
0fe9 : 85 0e __ STA P1 
0feb : a5 15 __ LDA P8 ; (color + 0)
0fed : 85 11 __ STA P4 
0fef : a9 00 __ LDA #$00
0ff1 : a6 4a __ LDX T4 + 0 
0ff3 : 9d c1 bf STA $bfc1,x ; (buf[0] + 0)
0ff6 : a9 c1 __ LDA #$c1
0ff8 : 85 0f __ STA P2 
0ffa : a9 bf __ LDA #$bf
0ffc : 85 10 __ STA P3 
--------------------------------------------------------------------
cwin_putat_string_raw: ; cwin_putat_string_raw(struct CharWin*,u8,u8,const u8*,u8)->void
; 103, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
0ffe : a5 0e __ LDA P1 ; (y + 0)
1000 : 0a __ __ ASL
1001 : aa __ __ TAX
1002 : bd 13 73 LDA $7313,x ; (mul40[0] + 0)
1005 : 65 0d __ ADC P0 ; (x + 0)
1007 : 85 1b __ STA ACCU + 0 
1009 : bd 14 73 LDA $7314,x ; (mul40[0] + 1)
100c : 69 00 __ ADC #$00
100e : 85 1c __ STA ACCU + 1 
1010 : ad f0 79 LDA $79f0 ; (cw.sp + 0)
1013 : 65 1b __ ADC ACCU + 0 
1015 : 85 43 __ STA T1 + 0 
1017 : ad f1 79 LDA $79f1 ; (cw.sp + 1)
101a : 65 1c __ ADC ACCU + 1 
101c : 85 44 __ STA T1 + 1 
101e : ad f2 79 LDA $79f2 ; (cw.cp + 0)
1021 : 18 __ __ CLC
1022 : 65 1b __ ADC ACCU + 0 
1024 : 85 1b __ STA ACCU + 0 
1026 : ad f3 79 LDA $79f3 ; (cw.cp + 1)
1029 : 65 1c __ ADC ACCU + 1 
102b : 85 1c __ STA ACCU + 1 
102d : a6 11 __ LDX P4 ; (color + 0)
102f : a0 00 __ LDY #$00
1031 : b1 0f __ LDA (P2),y ; (str + 0)
1033 : f0 0a __ BEQ $103f ; (cwin_putat_string_raw.s3 + 0)
.l5:
1035 : 91 43 __ STA (T1 + 0),y 
1037 : 8a __ __ TXA
1038 : 91 1b __ STA (ACCU + 0),y 
103a : c8 __ __ INY
103b : b1 0f __ LDA (P2),y ; (str + 0)
103d : d0 f6 __ BNE $1035 ; (cwin_putat_string_raw.l5 + 0)
.s3:
103f : 60 __ __ RTS
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
1040 : a9 73 __ LDA #$73
1042 : 85 0e __ STA P1 
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
;  12, "/home/xahmol/oscar64/include/string.h"
.s4:
1044 : a9 00 __ LDA #$00
1046 : 85 1b __ STA ACCU + 0 
1048 : 85 1c __ STA ACCU + 1 
104a : a8 __ __ TAY
104b : b1 0d __ LDA (P0),y ; (str + 0)
104d : f0 10 __ BEQ $105f ; (strlen.s3 + 0)
.s6:
104f : a2 00 __ LDX #$00
.l7:
1051 : c8 __ __ INY
1052 : d0 03 __ BNE $1057 ; (strlen.s9 + 0)
.s8:
1054 : e6 0e __ INC P1 ; (str + 1)
1056 : e8 __ __ INX
.s9:
1057 : b1 0d __ LDA (P0),y ; (str + 0)
1059 : d0 f6 __ BNE $1051 ; (strlen.l7 + 0)
.s5:
105b : 86 1c __ STX ACCU + 1 
105d : 84 1b __ STY ACCU + 0 
.s3:
105f : 60 __ __ RTS
--------------------------------------------------------------------
1060 : __ __ __ BYT 75 4c 54 49 4d 41 54 45 64 45 4d 4f 32 30 32 36 : uLTIMATEdEMO2026
1070 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1071 : __ __ __ BYT 68 41 52 44 57 41 52 45 20 64 45 54 45 43 54 49 : hARDWARE dETECTI
1081 : __ __ __ BYT 4f 4e 20 20 20 56 30 2e 31 2e 30 2d 32 30 32 36 : ON   V0.1.0-2026
1091 : __ __ __ BYT 30 35 33 30 2d 32 33 34 35 00                   : 0530-2345.
--------------------------------------------------------------------
screen_info: ; screen_info(const u8*)->void
;  23, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
109b : a9 0f __ LDA #$0f
109d : 85 0f __ STA P2 
109f : 20 db 72 JSR $72db ; (cwin_put_string@proxy + 0)
--------------------------------------------------------------------
cwin_cursor_newline: ; cwin_cursor_newline(struct CharWin*)->void
;  44, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
10a2 : ad ed 79 LDA $79ed ; (cw.cy + 0)
10a5 : 18 __ __ CLC
10a6 : 69 01 __ ADC #$01
10a8 : a8 __ __ TAY
10a9 : a9 00 __ LDA #$00
10ab : 8d ec 79 STA $79ec ; (cw.cx + 0)
10ae : 2a __ __ ROL
10af : d0 08 __ BNE $10b9 ; (cwin_cursor_newline.s3 + 0)
.s6:
10b1 : cc eb 79 CPY $79eb ; (cw.wy + 0)
10b4 : b0 03 __ BCS $10b9 ; (cwin_cursor_newline.s3 + 0)
.s5:
10b6 : ee ed 79 INC $79ed ; (cw.cy + 0)
.s3:
10b9 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_put_string@proxy: ; cwin_put_string@proxy
10ba : a9 c0 __ LDA #$c0
10bc : 85 0d __ STA P0 
10be : a9 11 __ LDA #$11
10c0 : 85 0e __ STA P1 
--------------------------------------------------------------------
cwin_put_string: ; cwin_put_string(struct CharWin*,const u8*,u8)->void
;  64, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
10c2 : ad ed 79 LDA $79ed ; (cw.cy + 0)
10c5 : 0a __ __ ASL
10c6 : aa __ __ TAX
10c7 : bd 13 73 LDA $7313,x ; (mul40[0] + 0)
10ca : 6d ec 79 ADC $79ec ; (cw.cx + 0)
10cd : 85 1b __ STA ACCU + 0 
10cf : bd 14 73 LDA $7314,x ; (mul40[0] + 1)
10d2 : 69 00 __ ADC #$00
10d4 : 85 1c __ STA ACCU + 1 
10d6 : ad f0 79 LDA $79f0 ; (cw.sp + 0)
10d9 : 65 1b __ ADC ACCU + 0 
10db : 85 43 __ STA T1 + 0 
10dd : ad f1 79 LDA $79f1 ; (cw.sp + 1)
10e0 : 65 1c __ ADC ACCU + 1 
10e2 : 85 44 __ STA T1 + 1 
10e4 : ad f2 79 LDA $79f2 ; (cw.cp + 0)
10e7 : 18 __ __ CLC
10e8 : 65 1b __ ADC ACCU + 0 
10ea : 85 1b __ STA ACCU + 0 
10ec : ad f3 79 LDA $79f3 ; (cw.cp + 1)
10ef : 65 1c __ ADC ACCU + 1 
10f1 : 85 1c __ STA ACCU + 1 
10f3 : a0 00 __ LDY #$00
10f5 : b1 0d __ LDA (P0),y ; (str + 0)
10f7 : f0 16 __ BEQ $110f ; (cwin_put_string.s5 + 0)
.l7:
10f9 : 4a __ __ LSR
10fa : 4a __ __ LSR
10fb : 4a __ __ LSR
10fc : 4a __ __ LSR
10fd : 4a __ __ LSR
10fe : aa __ __ TAX
10ff : bd 4d 73 LDA $734d,x ; (p2smap[0] + 0)
1102 : 51 0d __ EOR (P0),y ; (str + 0)
1104 : 91 43 __ STA (T1 + 0),y 
1106 : a5 0f __ LDA P2 ; (color + 0)
1108 : 91 1b __ STA (ACCU + 0),y 
110a : c8 __ __ INY
110b : b1 0d __ LDA (P0),y ; (str + 0)
110d : d0 ea __ BNE $10f9 ; (cwin_put_string.l7 + 0)
.s5:
110f : 98 __ __ TYA
1110 : 18 __ __ CLC
1111 : 6d ec 79 ADC $79ec ; (cw.cx + 0)
1114 : cd ea 79 CMP $79ea ; (cw.wx + 0)
1117 : 90 05 __ BCC $111e ; (cwin_put_string.s3 + 0)
.s6:
1119 : a9 00 __ LDA #$00
111b : ee ed 79 INC $79ed ; (cw.cy + 0)
.s3:
111e : 8d ec 79 STA $79ec ; (cw.cx + 0)
1121 : 60 __ __ RTS
--------------------------------------------------------------------
1122 : __ __ __ BYT 77 41 49 54 49 4e 47 20 46 4f 52 20 75 4c 54 49 : wAITING FOR uLTI
1132 : __ __ __ BYT 4d 41 54 45 20 46 49 52 4d 57 41 52 45 2e 2e 2e : MATE FIRMWARE...
1142 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
uii_detect: ; uii_detect()->u8
; 167, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
1143 : ad 1d df LDA $df1d 
1146 : c9 c9 __ CMP #$c9
1148 : d0 0b __ BNE $1155 ; (uii_detect.s5 + 0)
.s6:
114a : ad 1c df LDA $df1c 
114d : 09 04 __ ORA #$04
114f : 8d 1c df STA $df1c 
1152 : a9 01 __ LDA #$01
1154 : 60 __ __ RTS
.s5:
1155 : a9 00 __ LDA #$00
.s3:
1157 : 60 __ __ RTS
--------------------------------------------------------------------
screen_result@proxy: ; screen_result@proxy
1158 : a9 01 __ LDA #$01
115a : 85 12 __ STA P5 
115c : a9 93 __ LDA #$93
115e : 85 13 __ STA P6 
1160 : a9 bf __ LDA #$bf
1162 : 85 14 __ STA P7 
--------------------------------------------------------------------
screen_result: ; screen_result(const u8*,u8,const u8*)->void
;  17, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
1164 : a9 01 __ LDA #$01
1166 : 85 0f __ STA P2 
1168 : 20 ba 10 JSR $10ba ; (cwin_put_string@proxy + 0)
116b : 20 db 72 JSR $72db ; (cwin_put_string@proxy + 0)
116e : a9 c3 __ LDA #$c3
1170 : 85 0d __ STA P0 
1172 : a9 11 __ LDA #$11
1174 : 85 0e __ STA P1 
1176 : 20 c2 10 JSR $10c2 ; (cwin_put_string.s4 + 0)
1179 : a5 12 __ LDA P5 ; (ok + 0)
117b : d0 09 __ BNE $1186 ; (screen_result.s7 + 0)
.s5:
117d : e6 0f __ INC P2 
117f : a9 11 __ LDA #$11
1181 : a0 b9 __ LDY #$b9
1183 : 4c 8e 11 JMP $118e ; (screen_result.s6 + 0)
.s7:
1186 : a9 05 __ LDA #$05
1188 : 85 0f __ STA P2 
118a : a9 11 __ LDA #$11
118c : a0 b2 __ LDY #$b2
.s6:
118e : 84 0d __ STY P0 
1190 : 85 0e __ STA P1 
1192 : 20 c2 10 JSR $10c2 ; (cwin_put_string.s4 + 0)
1195 : a5 12 __ LDA P5 ; (ok + 0)
1197 : f0 04 __ BEQ $119d ; (screen_result.s8 + 0)
.s9:
1199 : a9 03 __ LDA #$03
119b : d0 02 __ BNE $119f ; (screen_result.s10 + 0)
.s8:
119d : a9 07 __ LDA #$07
.s10:
119f : 85 0f __ STA P2 
11a1 : 20 ba 10 JSR $10ba ; (cwin_put_string@proxy + 0)
11a4 : a5 13 __ LDA P6 ; (detail + 0)
11a6 : 85 0d __ STA P0 
11a8 : a5 14 __ LDA P7 ; (detail + 1)
11aa : 85 0e __ STA P1 
11ac : 20 c2 10 JSR $10c2 ; (cwin_put_string.s4 + 0)
11af : 4c a2 10 JMP $10a2 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
11b2 : __ __ __ BYT 5b 20 6f 6b 20 5d 00                            : [ ok ].
--------------------------------------------------------------------
11b9 : __ __ __ BYT 5b 66 41 49 4c 5d 00                            : [fAIL].
--------------------------------------------------------------------
11c0 : __ __ __ BYT 20 20 00                                        :   .
--------------------------------------------------------------------
11c3 : __ __ __ BYT 20 3a 20 00                                     :  : .
--------------------------------------------------------------------
11c7 : __ __ __ BYT 75 63 69 20 20 00                               : uci  .
--------------------------------------------------------------------
11cd : __ __ __ BYT 6e 4f 54 20 44 45 54 45 43 54 45 44 00          : nOT DETECTED.
--------------------------------------------------------------------
screen_error_exit: ; screen_error_exit(const u8*,const u8*)->void
;  32, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
11da : a9 02 __ LDA #$02
11dc : 85 0f __ STA P2 
11de : 20 a2 10 JSR $10a2 ; (cwin_cursor_newline.s4 + 0)
11e1 : a5 12 __ LDA P5 ; (msg + 0)
11e3 : 85 0d __ STA P0 
11e5 : a5 13 __ LDA P6 ; (msg + 1)
11e7 : 85 0e __ STA P1 
11e9 : 20 c2 10 JSR $10c2 ; (cwin_put_string.s4 + 0)
11ec : 20 a2 10 JSR $10a2 ; (cwin_cursor_newline.s4 + 0)
11ef : a5 15 __ LDA P8 ; (hint + 1)
11f1 : 05 14 __ ORA P7 ; (hint + 0)
11f3 : f0 11 __ BEQ $1206 ; (screen_error_exit.s5 + 0)
.s6:
11f5 : a0 00 __ LDY #$00
11f7 : b1 14 __ LDA (P7),y ; (hint + 0)
11f9 : f0 0b __ BEQ $1206 ; (screen_error_exit.s5 + 0)
.s7:
11fb : a5 14 __ LDA P7 ; (hint + 0)
11fd : 85 10 __ STA P3 
11ff : a5 15 __ LDA P8 ; (hint + 1)
1201 : 85 11 __ STA P4 
1203 : 20 29 12 JSR $1229 ; (screen_hint.s4 + 0)
.s5:
1206 : a9 01 __ LDA #$01
1208 : 85 0f __ STA P2 
120a : 20 a2 10 JSR $10a2 ; (cwin_cursor_newline.s4 + 0)
120d : a9 44 __ LDA #$44
120f : 85 0d __ STA P0 
1211 : a9 12 __ LDA #$12
1213 : 85 0e __ STA P1 
1215 : 20 c2 10 JSR $10c2 ; (cwin_put_string.s4 + 0)
1218 : 20 a2 10 JSR $10a2 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
cwin_getch: ; cwin_getch()->void
; 147, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
121b : 20 e4 ff JSR $ffe4 
121e : c9 00 __ CMP #$00
1220 : f0 f9 __ BEQ $121b ; (cwin_getch.s4 + 0)
1222 : 85 1b __ STA ACCU + 0 
1224 : a9 00 __ LDA #$00
1226 : 85 1c __ STA ACCU + 1 
.s3:
1228 : 60 __ __ RTS
--------------------------------------------------------------------
screen_hint: ; screen_hint(const u8*)->void
;  26, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
1229 : a9 07 __ LDA #$07
122b : 85 0f __ STA P2 
122d : a9 12 __ LDA #$12
122f : 85 0e __ STA P1 
1231 : a9 3e __ LDA #$3e
1233 : 85 0d __ STA P0 
1235 : 20 c2 10 JSR $10c2 ; (cwin_put_string.s4 + 0)
1238 : 20 db 72 JSR $72db ; (cwin_put_string@proxy + 0)
123b : 4c a2 10 JMP $10a2 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
123e : __ __ __ BYT 20 20 2d 3e 20 00                               :   -> .
--------------------------------------------------------------------
1244 : __ __ __ BYT 70 52 45 53 53 20 41 20 4b 45 59 20 2d 20 45 58 : pRESS A KEY - EX
1254 : __ __ __ BYT 49 54 20 54 4f 20 62 61 73 69 63 2e 00          : IT TO basic..
--------------------------------------------------------------------
1261 : __ __ __ BYT 6e 4f 20 75 4c 54 49 4d 41 54 45 20 63 4f 4d 4d : nO uLTIMATE cOMM
1271 : __ __ __ BYT 41 4e 44 20 69 4e 54 45 52 46 41 43 45 20 46 4f : AND iNTERFACE FO
1281 : __ __ __ BYT 55 4e 44 2e 00                                  : UND..
--------------------------------------------------------------------
1286 : __ __ __ BYT 66 32 20 3e 20 75 63 69 20 73 45 54 54 49 4e 47 : f2 > uci sETTING
1296 : __ __ __ BYT 53 20 3e 20 65 4e 41 42 4c 45 00                : S > eNABLE.
--------------------------------------------------------------------
uii_sendcommand: ; uii_sendcommand(u8*,u16)->void
; 173, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
12a1 : ad 55 73 LDA $7355 ; (uii_target + 0)
12a4 : a0 00 __ LDY #$00
12a6 : 84 1b __ STY ACCU + 0 
12a8 : 84 1c __ STY ACCU + 1 
12aa : 91 0d __ STA (P0),y ; (bytes + 0)
.l5:
12ac : ad 1c df LDA $df1c 
12af : 29 20 __ AND #$20
12b1 : d0 f9 __ BNE $12ac ; (uii_sendcommand.l5 + 0)
.s6:
12b3 : ad 1c df LDA $df1c 
12b6 : 29 10 __ AND #$10
12b8 : d0 f2 __ BNE $12ac ; (uii_sendcommand.l5 + 0)
.s7:
12ba : a5 1c __ LDA ACCU + 1 
12bc : c5 10 __ CMP P3 ; (count + 1)
12be : d0 04 __ BNE $12c4 ; (uii_sendcommand.s16 + 0)
.s15:
12c0 : a5 1b __ LDA ACCU + 0 
12c2 : c5 0f __ CMP P2 ; (count + 0)
.s16:
12c4 : b0 2e __ BCS $12f4 ; (uii_sendcommand.s8 + 0)
.s12:
12c6 : a5 0d __ LDA P0 ; (bytes + 0)
12c8 : 65 1b __ ADC ACCU + 0 
12ca : 85 43 __ STA T3 + 0 
12cc : a5 0e __ LDA P1 ; (bytes + 1)
12ce : 65 1c __ ADC ACCU + 1 
12d0 : 85 44 __ STA T3 + 1 
12d2 : a6 1b __ LDX ACCU + 0 
.l13:
12d4 : a0 00 __ LDY #$00
12d6 : b1 43 __ LDA (T3 + 0),y 
12d8 : 8d 1d df STA $df1d 
12db : e6 43 __ INC T3 + 0 
12dd : d0 02 __ BNE $12e1 ; (uii_sendcommand.s19 + 0)
.s18:
12df : e6 44 __ INC T3 + 1 
.s19:
12e1 : e8 __ __ INX
12e2 : d0 02 __ BNE $12e6 ; (uii_sendcommand.s21 + 0)
.s20:
12e4 : e6 1c __ INC ACCU + 1 
.s21:
12e6 : a5 1c __ LDA ACCU + 1 
12e8 : c5 10 __ CMP P3 ; (count + 1)
12ea : 90 e8 __ BCC $12d4 ; (uii_sendcommand.l13 + 0)
.s22:
12ec : d0 04 __ BNE $12f2 ; (uii_sendcommand.s17 + 0)
.s14:
12ee : e4 0f __ CPX P2 ; (count + 0)
12f0 : 90 e2 __ BCC $12d4 ; (uii_sendcommand.l13 + 0)
.s17:
12f2 : 86 1b __ STX ACCU + 0 
.s8:
12f4 : ad 1c df LDA $df1c 
12f7 : 09 01 __ ORA #$01
12f9 : 8d 1c df STA $df1c 
12fc : ad 1c df LDA $df1c 
12ff : 29 04 __ AND #$04
1301 : f0 0a __ BEQ $130d ; (uii_sendcommand.l9 + 0)
.s11:
1303 : ad 1c df LDA $df1c 
1306 : 09 08 __ ORA #$08
1308 : 8d 1c df STA $df1c 
130b : b0 9f __ BCS $12ac ; (uii_sendcommand.l5 + 0)
.l9:
130d : ad 1c df LDA $df1c 
1310 : 29 20 __ AND #$20
1312 : d0 07 __ BNE $131b ; (uii_sendcommand.s3 + 0)
.s10:
1314 : ad 1c df LDA $df1c 
1317 : 29 10 __ AND #$10
1319 : d0 f2 __ BNE $130d ; (uii_sendcommand.l9 + 0)
.s3:
131b : 60 __ __ RTS
--------------------------------------------------------------------
uii_readdata: ; uii_readdata()->void
; 179, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
131c : a9 00 __ LDA #$00
131e : 8d f8 7a STA $7af8 ; (uii_data[0] + 0)
1321 : a2 f8 __ LDX #$f8
1323 : 86 1b __ STX ACCU + 0 
1325 : a8 __ __ TAY
1326 : f0 0d __ BEQ $1335 ; (uii_readdata.l5 + 0)
.s8:
1328 : ad 1e df LDA $df1e 
132b : 91 1b __ STA (ACCU + 0),y 
132d : 98 __ __ TYA
132e : 18 __ __ CLC
132f : 69 01 __ ADC #$01
1331 : a8 __ __ TAY
1332 : 8a __ __ TXA
1333 : 69 00 __ ADC #$00
.l5:
1335 : aa __ __ TAX
1336 : 18 __ __ CLC
1337 : 69 7a __ ADC #$7a
1339 : 85 1c __ STA ACCU + 1 
133b : 2c 1c df BIT $df1c 
133e : 10 07 __ BPL $1347 ; (uii_readdata.s6 + 0)
.s7:
1340 : e0 02 __ CPX #$02
1342 : d0 e4 __ BNE $1328 ; (uii_readdata.s8 + 0)
.s9:
1344 : 98 __ __ TYA
1345 : d0 e1 __ BNE $1328 ; (uii_readdata.s8 + 0)
.s6:
1347 : a9 00 __ LDA #$00
1349 : 91 1b __ STA (ACCU + 0),y 
.s3:
134b : 60 __ __ RTS
--------------------------------------------------------------------
uii_readstatus: ; uii_readstatus()->void
; 180, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
134c : a9 00 __ LDA #$00
134e : 8d f9 7c STA $7cf9 ; (uii_status[0] + 0)
1351 : a2 f9 __ LDX #$f9
1353 : 86 1b __ STX ACCU + 0 
1355 : a8 __ __ TAY
1356 : f0 0d __ BEQ $1365 ; (uii_readstatus.l5 + 0)
.s8:
1358 : ad 1f df LDA $df1f 
135b : 91 1b __ STA (ACCU + 0),y 
135d : 98 __ __ TYA
135e : 18 __ __ CLC
135f : 69 01 __ ADC #$01
1361 : a8 __ __ TAY
1362 : 8a __ __ TXA
1363 : 69 00 __ ADC #$00
.l5:
1365 : aa __ __ TAX
1366 : 18 __ __ CLC
1367 : 69 7c __ ADC #$7c
1369 : 85 1c __ STA ACCU + 1 
136b : ad 1c df LDA $df1c 
136e : 29 40 __ AND #$40
1370 : f0 07 __ BEQ $1379 ; (uii_readstatus.s6 + 0)
.s7:
1372 : e0 01 __ CPX #$01
1374 : d0 e2 __ BNE $1358 ; (uii_readstatus.s8 + 0)
.s9:
1376 : 98 __ __ TYA
1377 : d0 df __ BNE $1358 ; (uii_readstatus.s8 + 0)
.s6:
1379 : 91 1b __ STA (ACCU + 0),y 
.s3:
137b : 60 __ __ RTS
--------------------------------------------------------------------
uii_get_hwinfo: ; uii_get_hwinfo(u8)->void
;  53, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
137c : a9 00 __ LDA #$00
137e : 85 10 __ STA P3 
1380 : 8d e7 bf STA $bfe7 ; (cmd[0] + 0)
1383 : 8d e9 bf STA $bfe9 ; (cmd[0] + 2)
1386 : a9 03 __ LDA #$03
1388 : 85 0f __ STA P2 
138a : a9 04 __ LDA #$04
138c : 8d 55 73 STA $7355 ; (uii_target + 0)
138f : a9 28 __ LDA #$28
1391 : 8d e8 bf STA $bfe8 ; (cmd[0] + 1)
1394 : a9 00 __ LDA #$00
1396 : 8d e9 bf STA $bfe9 ; (cmd[0] + 2)
1399 : a9 e7 __ LDA #$e7
139b : 85 0d __ STA P0 
139d : a9 bf __ LDA #$bf
139f : 85 0e __ STA P1 
13a1 : 20 a1 12 JSR $12a1 ; (uii_sendcommand.s4 + 0)
13a4 : 20 1c 13 JSR $131c ; (uii_readdata.s4 + 0)
13a7 : 20 4c 13 JSR $134c ; (uii_readstatus.s4 + 0)
--------------------------------------------------------------------
uii_accept: ; uii_accept()->void
; 174, "/home/xahmol/git/UltimateDemo2026/include/ultimate_common_lib.h"
.s4:
13aa : ad 1c df LDA $df1c 
13ad : 09 02 __ ORA #$02
13af : 8d 1c df STA $df1c 
.l5:
13b2 : ad 1c df LDA $df1c 
13b5 : 29 02 __ AND #$02
13b7 : d0 f9 __ BNE $13b2 ; (uii_accept.l5 + 0)
.s3:
13b9 : 60 __ __ RTS
--------------------------------------------------------------------
uci_to_upper@proxy: ; uci_to_upper@proxy
13ba : a9 93 __ LDA #$93
13bc : 85 0d __ STA P0 
13be : a9 bf __ LDA #$bf
13c0 : 85 0e __ STA P1 
--------------------------------------------------------------------
uci_to_upper: ; uci_to_upper(u8*,u8)->u8
;  72, "/home/xahmol/git/UltimateDemo2026/src/main.c"
.s4:
13c2 : a0 00 __ LDY #$00
13c4 : a2 00 __ LDX #$00
13c6 : ad f8 7a LDA $7af8 ; (uii_data[0] + 0)
13c9 : f0 23 __ BEQ $13ee ; (uci_to_upper.s6 + 0)
.l8:
13cb : c9 20 __ CMP #$20
13cd : 90 11 __ BCC $13e0 ; (uci_to_upper.s9 + 0)
.s10:
13cf : c9 7f __ CMP #$7f
13d1 : b0 0d __ BCS $13e0 ; (uci_to_upper.s9 + 0)
.s11:
13d3 : c9 61 __ CMP #$61
13d5 : 90 06 __ BCC $13dd ; (uci_to_upper.s14 + 0)
.s12:
13d7 : c9 7b __ CMP #$7b
13d9 : b0 02 __ BCS $13dd ; (uci_to_upper.s14 + 0)
.s13:
13db : e9 1f __ SBC #$1f
.s14:
13dd : 91 0d __ STA (P0),y ; (dst + 0)
13df : c8 __ __ INY
.s9:
13e0 : e8 __ __ INX
13e1 : e0 7f __ CPX #$7f
13e3 : b0 09 __ BCS $13ee ; (uci_to_upper.s6 + 0)
.s5:
13e5 : c0 18 __ CPY #$18
13e7 : b0 05 __ BCS $13ee ; (uci_to_upper.s6 + 0)
.s7:
13e9 : bd f8 7a LDA $7af8,x ; (uii_data[0] + 0)
13ec : d0 dd __ BNE $13cb ; (uci_to_upper.l8 + 0)
.s6:
13ee : a9 00 __ LDA #$00
13f0 : 91 0d __ STA (P0),y ; (dst + 0)
.s3:
13f2 : 98 __ __ TYA
13f3 : 60 __ __ RTS
--------------------------------------------------------------------
13f4 : __ __ __ BYT 75 63 69 20 6f 4b 00                            : uci oK.
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
15bf : 20 f1 15 JSR $15f1 ; (turbo_set.s4 + 0)
15c2 : 20 0c 16 JSR $160c ; (benchmark_delay.s4 + 0)
15c5 : 20 0c 16 JSR $160c ; (benchmark_delay.s4 + 0)
15c8 : a5 1b __ LDA ACCU + 0 
15ca : 85 44 __ STA T0 + 0 
15cc : a5 1c __ LDA ACCU + 1 
15ce : 85 45 __ STA T0 + 1 
15d0 : a9 00 __ LDA #$00
15d2 : 20 f1 15 JSR $15f1 ; (turbo_set.s4 + 0)
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
15f1 : a8 __ __ TAY
15f2 : d0 0c __ BNE $1600 ; (turbo_set.s6 + 0)
.s5:
15f4 : 8d 31 d0 STA $d031 
15f7 : ad 30 d0 LDA $d030 
15fa : 29 fe __ AND #$fe
15fc : 8d 30 d0 STA $d030 
15ff : 60 __ __ RTS
.s6:
1600 : ad 30 d0 LDA $d030 
1603 : 09 01 __ ORA #$01
1605 : 8d 30 d0 STA $d030 
1608 : 8c 31 d0 STY $d031 
.s3:
160b : 60 __ __ RTS
--------------------------------------------------------------------
benchmark_delay: ; benchmark_delay(i16)->i16
;  99, "/home/xahmol/git/UltimateDemo2026/include/turbo.h"
.s4:
160c : 78 __ __ SEI
160d : a9 00 __ LDA #$00
160f : 8d 09 dc STA $dc09 
1612 : 8d 08 dc STA $dc08 
1615 : 8d e8 bf STA $bfe8 ; (i + 0)
1618 : f0 0e __ BEQ $1628 ; (benchmark_delay.l5 + 0)
.s9:
161a : ad e8 bf LDA $bfe8 ; (i + 0)
161d : 18 __ __ CLC
161e : 69 01 __ ADC #$01
1620 : 8d e8 bf STA $bfe8 ; (i + 0)
1623 : ad e9 bf LDA $bfe9 ; (i + 1)
1626 : 69 00 __ ADC #$00
.l5:
1628 : 8d e9 bf STA $bfe9 ; (i + 1)
162b : ac e8 bf LDY $bfe8 ; (i + 0)
162e : ad e9 bf LDA $bfe9 ; (i + 1)
1631 : 49 80 __ EOR #$80
1633 : c9 83 __ CMP #$83
1635 : d0 02 __ BNE $1639 ; (benchmark_delay.s14 + 0)
.s13:
1637 : c0 e8 __ CPY #$e8
.s14:
1639 : b0 07 __ BCS $1642 ; (benchmark_delay.s6 + 0)
.s7:
163b : a9 00 __ LDA #$00
163d : 8d e6 bf STA $bfe6 ; (j + 0)
1640 : 90 28 __ BCC $166a ; (benchmark_delay.l8 + 0)
.s6:
1642 : 58 __ __ CLI
1643 : ad 09 dc LDA $dc09 
1646 : aa __ __ TAX
1647 : 0a __ __ ASL
1648 : 85 1b __ STA ACCU + 0 
164a : a9 00 __ LDA #$00
164c : 2a __ __ ROL
164d : 06 1b __ ASL ACCU + 0 
164f : 2a __ __ ROL
1650 : a8 __ __ TAY
1651 : 8a __ __ TXA
1652 : 65 1b __ ADC ACCU + 0 
1654 : 85 43 __ STA T0 + 0 
1656 : 98 __ __ TYA
1657 : 69 00 __ ADC #$00
1659 : 06 43 __ ASL T0 + 0 
165b : 2a __ __ ROL
165c : a8 __ __ TAY
165d : ad 08 dc LDA $dc08 
1660 : 65 43 __ ADC T0 + 0 
1662 : 85 1b __ STA ACCU + 0 
1664 : 90 01 __ BCC $1667 ; (benchmark_delay.s16 + 0)
.s15:
1666 : c8 __ __ INY
.s16:
1667 : 84 1c __ STY ACCU + 1 
.s3:
1669 : 60 __ __ RTS
.l8:
166a : 8d e7 bf STA $bfe7 ; (j + 1)
166d : ac e6 bf LDY $bfe6 ; (j + 0)
1670 : ad e7 bf LDA $bfe7 ; (j + 1)
1673 : 30 06 __ BMI $167b ; (benchmark_delay.s10 + 0)
.s12:
1675 : d0 a3 __ BNE $161a ; (benchmark_delay.s9 + 0)
.s11:
1677 : c0 c8 __ CPY #$c8
1679 : b0 9f __ BCS $161a ; (benchmark_delay.s9 + 0)
.s10:
167b : ea __ __ NOP
167c : ad e6 bf LDA $bfe6 ; (j + 0)
167f : 18 __ __ CLC
1680 : 69 01 __ ADC #$01
1682 : 8d e6 bf STA $bfe6 ; (j + 0)
1685 : ad e7 bf LDA $bfe7 ; (j + 1)
1688 : 69 00 __ ADC #$00
168a : 4c 6a 16 JMP $166a ; (benchmark_delay.l8 + 0)
--------------------------------------------------------------------
168d : __ __ __ BYT 74 55 52 42 4f 00                               : tURBO.
--------------------------------------------------------------------
1693 : __ __ __ BYT 6e 4f 54 20 44 45 54 45 43 54 45 44 20 28 31 20 : nOT DETECTED (1 
16a3 : __ __ __ BYT 6d 68 5a 29 00                                  : mhZ).
--------------------------------------------------------------------
16a8 : __ __ __ BYT 65 4e 41 42 4c 45 20 54 55 52 42 4f 20 49 4e 20 : eNABLE TURBO IN 
16b8 : __ __ __ BYT 75 4c 54 49 4d 41 54 45 20 46 49 52 4d 57 41 52 : uLTIMATE FIRMWAR
16c8 : __ __ __ BYT 45 00                                           : E.
--------------------------------------------------------------------
16ca : __ __ __ BYT 36 34 20 6d 68 5a 00                            : 64 mhZ.
--------------------------------------------------------------------
turbo_get: ; turbo_get()->u8
; 149, "/home/xahmol/git/UltimateDemo2026/include/turbo.h"
.s3:
16d1 : ad 31 d0 LDA $d031 
16d4 : 60 __ __ RTS
--------------------------------------------------------------------
16d5 : __ __ __ BYT 34 38 20 6d 68 5a 00                            : 48 mhZ.
--------------------------------------------------------------------
16dc : __ __ __ BYT 34 30 20 6d 68 5a 00                            : 40 mhZ.
--------------------------------------------------------------------
16e3 : __ __ __ BYT 33 36 20 6d 68 5a 00                            : 36 mhZ.
--------------------------------------------------------------------
16ea : __ __ __ BYT 33 32 20 6d 68 5a 00                            : 32 mhZ.
--------------------------------------------------------------------
16f1 : __ __ __ BYT 32 38 20 6d 68 5a 00                            : 28 mhZ.
--------------------------------------------------------------------
16f8 : __ __ __ BYT 32 34 20 6d 68 5a 00                            : 24 mhZ.
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
173b : bd 57 73 LDA $7357,x ; (audio_ch_base[0] + 1)
173e : 85 44 __ STA T0 + 1 
1740 : a9 00 __ LDA #$00
1742 : bc 56 73 LDY $7356,x ; (audio_ch_base[0] + 0)
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
;  56, "/home/xahmol/git/UltimateDemo2026/src/main.c"
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
17fb : 20 d4 6e JSR $6ed4 ; (divmod + 0)
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
1820 : 20 d4 6e JSR $6ed4 ; (divmod + 0)
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
1835 : __ __ __ BYT 56 00                                           : V.
--------------------------------------------------------------------
strcat: ; strcat(u8*,const u8*)->void
;  14, "/home/xahmol/oscar64/include/string.h"
.s4:
1837 : a5 0d __ LDA P0 ; (dst + 0)
1839 : 85 1b __ STA ACCU + 0 
183b : a5 0e __ LDA P1 ; (dst + 1)
183d : 85 1c __ STA ACCU + 1 
183f : a0 00 __ LDY #$00
1841 : b1 0d __ LDA (P0),y ; (dst + 0)
1843 : f0 0f __ BEQ $1854 ; (strcat.s5 + 0)
.s6:
1845 : 84 1b __ STY ACCU + 0 
1847 : a4 0d __ LDY P0 ; (dst + 0)
.l7:
1849 : c8 __ __ INY
184a : d0 02 __ BNE $184e ; (strcat.s11 + 0)
.s10:
184c : e6 1c __ INC ACCU + 1 
.s11:
184e : b1 1b __ LDA (ACCU + 0),y 
1850 : d0 f7 __ BNE $1849 ; (strcat.l7 + 0)
.s8:
1852 : 84 1b __ STY ACCU + 0 
.s5:
1854 : a8 __ __ TAY
.l9:
1855 : b1 0f __ LDA (P2),y ; (src + 0)
1857 : 91 1b __ STA (ACCU + 0),y 
1859 : aa __ __ TAX
185a : e6 0f __ INC P2 ; (src + 0)
185c : d0 02 __ BNE $1860 ; (strcat.s13 + 0)
.s12:
185e : e6 10 __ INC P3 ; (src + 1)
.s13:
1860 : e6 1b __ INC ACCU + 0 
1862 : d0 02 __ BNE $1866 ; (strcat.s15 + 0)
.s14:
1864 : e6 1c __ INC ACCU + 1 
.s15:
1866 : 8a __ __ TXA
1867 : d0 ec __ BNE $1855 ; (strcat.l9 + 0)
.s3:
1869 : 60 __ __ RTS
--------------------------------------------------------------------
186a : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 4d 55 53 49 43 2e 2e 2e : lOADING MUSIC...
187a : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
uii_change_dir: ; uii_change_dir(u8*)->void
;  25, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
187b : a9 64 __ LDA #$64
187d : 85 0d __ STA P0 
187f : 20 0c 73 JSR $730c ; (strlen@proxy + 0)
1882 : 18 __ __ CLC
1883 : a5 1b __ LDA ACCU + 0 
1885 : 69 02 __ ADC #$02
1887 : 85 1b __ STA ACCU + 0 
1889 : 90 02 __ BCC $188d ; (uii_change_dir.s11 + 0)
.s10:
188b : e6 1c __ INC ACCU + 1 
.s11:
188d : 20 10 70 JSR $7010 ; (crt_malloc + 0)
1890 : a5 1c __ LDA ACCU + 1 
1892 : 05 1b __ ORA ACCU + 0 
1894 : d0 01 __ BNE $1897 ; (uii_change_dir.s5 + 0)
.s3:
1896 : 60 __ __ RTS
.s5:
1897 : a5 1c __ LDA ACCU + 1 
1899 : 85 47 __ STA T2 + 1 
189b : a5 1b __ LDA ACCU + 0 
189d : 85 46 __ STA T2 + 0 
189f : a9 00 __ LDA #$00
18a1 : a8 __ __ TAY
18a2 : 91 1b __ STA (ACCU + 0),y 
18a4 : a9 73 __ LDA #$73
18a6 : 85 0e __ STA P1 
18a8 : a9 11 __ LDA #$11
18aa : c8 __ __ INY
18ab : 91 1b __ STA (ACCU + 0),y 
18ad : 20 44 10 JSR $1044 ; (strlen.s4 + 0)
18b0 : a5 1b __ LDA ACCU + 0 
18b2 : 05 1c __ ORA ACCU + 1 
18b4 : f0 23 __ BEQ $18d9 ; (uii_change_dir.s6 + 0)
.s7:
18b6 : a9 00 __ LDA #$00
18b8 : 85 45 __ STA T1 + 0 
.l9:
18ba : a9 73 __ LDA #$73
18bc : 85 0e __ STA P1 
18be : a6 45 __ LDX T1 + 0 
18c0 : 8a __ __ TXA
18c1 : 18 __ __ CLC
18c2 : 69 02 __ ADC #$02
18c4 : a8 __ __ TAY
18c5 : bd 64 73 LDA $7364,x ; (mod_dir[0] + 0)
18c8 : 91 46 __ STA (T2 + 0),y 
18ca : 20 44 10 JSR $1044 ; (strlen.s4 + 0)
18cd : e6 45 __ INC T1 + 0 
18cf : a5 1c __ LDA ACCU + 1 
18d1 : d0 e7 __ BNE $18ba ; (uii_change_dir.l9 + 0)
.s8:
18d3 : a5 45 __ LDA T1 + 0 
18d5 : c5 1b __ CMP ACCU + 0 
18d7 : 90 e1 __ BCC $18ba ; (uii_change_dir.l9 + 0)
.s6:
18d9 : a9 01 __ LDA #$01
18db : 8d 55 73 STA $7355 ; (uii_target + 0)
18de : 20 0c 73 JSR $730c ; (strlen@proxy + 0)
18e1 : a5 46 __ LDA T2 + 0 
18e3 : 85 0d __ STA P0 
18e5 : a5 47 __ LDA T2 + 1 
18e7 : 85 0e __ STA P1 
18e9 : 18 __ __ CLC
18ea : a5 1b __ LDA ACCU + 0 
18ec : 69 02 __ ADC #$02
18ee : 85 0f __ STA P2 
18f0 : a5 1c __ LDA ACCU + 1 
18f2 : 69 00 __ ADC #$00
18f4 : 85 10 __ STA P3 
18f6 : 20 a1 12 JSR $12a1 ; (uii_sendcommand.s4 + 0)
18f9 : 20 08 71 JSR $7108 ; (crt_free@proxy + 0)
18fc : 20 4c 13 JSR $134c ; (uii_readstatus.s4 + 0)
18ff : 4c aa 13 JMP $13aa ; (uii_accept.s4 + 0)
--------------------------------------------------------------------
modplay_load: ; modplay_load(u8*,u32)->u8
; 209, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s4:
1902 : 20 6e 19 JSR $196e ; (uii_open_file.s4 + 0)
1905 : ad f9 7c LDA $7cf9 ; (uii_status[0] + 0)
1908 : c9 30 __ CMP #$30
190a : d0 07 __ BNE $1913 ; (modplay_load.s15 + 0)
.s5:
190c : ad fa 7c LDA $7cfa ; (uii_status[0] + 1)
190f : c9 30 __ CMP #$30
1911 : f0 05 __ BEQ $1918 ; (modplay_load.s6 + 0)
.s15:
1913 : a9 00 __ LDA #$00
.s3:
1915 : 85 1b __ STA ACCU + 0 
1917 : 60 __ __ RTS
.s6:
1918 : a9 00 __ LDA #$00
191a : 85 48 __ STA T0 + 0 
191c : 85 4b __ STA T0 + 3 
191e : a8 __ __ TAY
191f : aa __ __ TAX
1920 : a9 10 __ LDA #$10
1922 : 85 4c __ STA T2 + 0 
.l7:
1924 : 86 13 __ STX P6 
1926 : 84 12 __ STY P5 
1928 : a5 48 __ LDA T0 + 0 
192a : 85 11 __ STA P4 
192c : a5 4b __ LDA T0 + 3 
192e : 85 14 __ STA P7 
1930 : 20 fc 19 JSR $19fc ; (uii_load_reu.s4 + 0)
1933 : 18 __ __ CLC
1934 : a5 11 __ LDA P4 
1936 : 69 ff __ ADC #$ff
1938 : 85 48 __ STA T0 + 0 
193a : a5 12 __ LDA P5 
193c : 69 7f __ ADC #$7f
193e : a8 __ __ TAY
193f : a5 13 __ LDA P6 
1941 : 69 00 __ ADC #$00
1943 : aa __ __ TAX
1944 : a5 14 __ LDA P7 
1946 : 69 00 __ ADC #$00
1948 : 85 4b __ STA T0 + 3 
194a : ad f9 7c LDA $7cf9 ; (uii_status[0] + 0)
194d : c9 30 __ CMP #$30
194f : d0 0b __ BNE $195c ; (modplay_load.s10 + 0)
.s8:
1951 : ad fa 7c LDA $7cfa ; (uii_status[0] + 1)
1954 : c9 30 __ CMP #$30
1956 : d0 04 __ BNE $195c ; (modplay_load.s10 + 0)
.s9:
1958 : c6 4c __ DEC T2 + 0 
195a : d0 c8 __ BNE $1924 ; (modplay_load.l7 + 0)
.s10:
195c : a5 4b __ LDA T0 + 3 
195e : d0 0a __ BNE $196a ; (modplay_load.s11 + 0)
.s12:
1960 : 8a __ __ TXA
1961 : d0 07 __ BNE $196a ; (modplay_load.s11 + 0)
.s13:
1963 : 98 __ __ TYA
1964 : d0 04 __ BNE $196a ; (modplay_load.s11 + 0)
.s14:
1966 : c5 48 __ CMP T0 + 0 
1968 : b0 ab __ BCS $1915 ; (modplay_load.s3 + 0)
.s11:
196a : a9 01 __ LDA #$01
196c : d0 a7 __ BNE $1915 ; (modplay_load.s3 + 0)
--------------------------------------------------------------------
uii_open_file: ; uii_open_file(u8,u8*)->void
;  31, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
196e : a9 75 __ LDA #$75
1970 : 85 0d __ STA P0 
1972 : 20 40 10 JSR $1040 ; (strlen@proxy + 0)
1975 : 18 __ __ CLC
1976 : a5 1b __ LDA ACCU + 0 
1978 : 69 03 __ ADC #$03
197a : 85 1b __ STA ACCU + 0 
197c : 90 02 __ BCC $1980 ; (uii_open_file.s11 + 0)
.s10:
197e : e6 1c __ INC ACCU + 1 
.s11:
1980 : 20 10 70 JSR $7010 ; (crt_malloc + 0)
1983 : a5 1c __ LDA ACCU + 1 
1985 : 05 1b __ ORA ACCU + 0 
1987 : d0 01 __ BNE $198a ; (uii_open_file.s5 + 0)
.s3:
1989 : 60 __ __ RTS
.s5:
198a : a5 1c __ LDA ACCU + 1 
198c : 85 47 __ STA T2 + 1 
198e : a5 1b __ LDA ACCU + 0 
1990 : 85 46 __ STA T2 + 0 
1992 : a9 00 __ LDA #$00
1994 : a8 __ __ TAY
1995 : 91 1b __ STA (ACCU + 0),y 
1997 : a9 73 __ LDA #$73
1999 : 85 0e __ STA P1 
199b : a9 02 __ LDA #$02
199d : c8 __ __ INY
199e : 91 1b __ STA (ACCU + 0),y 
19a0 : 98 __ __ TYA
19a1 : c8 __ __ INY
19a2 : 91 1b __ STA (ACCU + 0),y 
19a4 : 20 44 10 JSR $1044 ; (strlen.s4 + 0)
19a7 : a5 1b __ LDA ACCU + 0 
19a9 : 05 1c __ ORA ACCU + 1 
19ab : f0 23 __ BEQ $19d0 ; (uii_open_file.s6 + 0)
.s7:
19ad : a9 00 __ LDA #$00
19af : 85 45 __ STA T1 + 0 
.l9:
19b1 : a9 73 __ LDA #$73
19b3 : 85 0e __ STA P1 
19b5 : a6 45 __ LDX T1 + 0 
19b7 : 8a __ __ TXA
19b8 : 18 __ __ CLC
19b9 : 69 03 __ ADC #$03
19bb : a8 __ __ TAY
19bc : bd 75 73 LDA $7375,x ; (mod_file[0] + 0)
19bf : 91 46 __ STA (T2 + 0),y 
19c1 : 20 44 10 JSR $1044 ; (strlen.s4 + 0)
19c4 : e6 45 __ INC T1 + 0 
19c6 : a5 1c __ LDA ACCU + 1 
19c8 : d0 e7 __ BNE $19b1 ; (uii_open_file.l9 + 0)
.s8:
19ca : a5 45 __ LDA T1 + 0 
19cc : c5 1b __ CMP ACCU + 0 
19ce : 90 e1 __ BCC $19b1 ; (uii_open_file.l9 + 0)
.s6:
19d0 : a9 01 __ LDA #$01
19d2 : 8d 55 73 STA $7355 ; (uii_target + 0)
19d5 : 20 40 10 JSR $1040 ; (strlen@proxy + 0)
19d8 : a5 46 __ LDA T2 + 0 
19da : 85 0d __ STA P0 
19dc : a5 47 __ LDA T2 + 1 
19de : 85 0e __ STA P1 
19e0 : 18 __ __ CLC
19e1 : a5 1b __ LDA ACCU + 0 
19e3 : 69 03 __ ADC #$03
19e5 : 85 0f __ STA P2 
19e7 : a5 1c __ LDA ACCU + 1 
19e9 : 69 00 __ ADC #$00
19eb : 85 10 __ STA P3 
19ed : 20 a1 12 JSR $12a1 ; (uii_sendcommand.s4 + 0)
19f0 : 20 08 71 JSR $7108 ; (crt_free@proxy + 0)
19f3 : 20 1c 13 JSR $131c ; (uii_readdata.s4 + 0)
19f6 : 20 4c 13 JSR $134c ; (uii_readstatus.s4 + 0)
19f9 : 4c aa 13 JMP $13aa ; (uii_accept.s4 + 0)
--------------------------------------------------------------------
uii_load_reu: ; uii_load_reu(u32,u32)->void
;  46, "/home/xahmol/git/UltimateDemo2026/include/ultimate_dos_lib.h"
.s4:
19fc : a9 00 __ LDA #$00
19fe : 85 10 __ STA P3 
1a00 : 8d e0 bf STA $bfe0 ; (cmd[0] + 0)
1a03 : 8d e8 bf STA $bfe8 ; (cmd[0] + 8)
1a06 : 8d e9 bf STA $bfe9 ; (cmd[0] + 9)
1a09 : a9 0a __ LDA #$0a
1a0b : 85 0f __ STA P2 
1a0d : a9 01 __ LDA #$01
1a0f : 8d 55 73 STA $7355 ; (uii_target + 0)
1a12 : a9 21 __ LDA #$21
1a14 : 8d e1 bf STA $bfe1 ; (cmd[0] + 1)
1a17 : a9 ff __ LDA #$ff
1a19 : 8d e6 bf STA $bfe6 ; (cmd[0] + 6)
1a1c : a9 7f __ LDA #$7f
1a1e : 8d e7 bf STA $bfe7 ; (cmd[0] + 7)
1a21 : a5 11 __ LDA P4 ; (reu_addr + 0)
1a23 : 8d e2 bf STA $bfe2 ; (cmd[0] + 2)
1a26 : a5 12 __ LDA P5 ; (reu_addr + 1)
1a28 : 8d e3 bf STA $bfe3 ; (cmd[0] + 3)
1a2b : a5 13 __ LDA P6 ; (reu_addr + 2)
1a2d : 8d e4 bf STA $bfe4 ; (cmd[0] + 4)
1a30 : a5 14 __ LDA P7 ; (reu_addr + 3)
1a32 : 8d e5 bf STA $bfe5 ; (cmd[0] + 5)
1a35 : a9 e0 __ LDA #$e0
1a37 : 85 0d __ STA P0 
1a39 : a9 bf __ LDA #$bf
1a3b : 85 0e __ STA P1 
1a3d : 20 a1 12 JSR $12a1 ; (uii_sendcommand.s4 + 0)
1a40 : 20 1c 13 JSR $131c ; (uii_readdata.s4 + 0)
1a43 : 20 4c 13 JSR $134c ; (uii_readstatus.s4 + 0)
1a46 : 4c aa 13 JMP $13aa ; (uii_accept.s4 + 0)
--------------------------------------------------------------------
modplay_init: ; modplay_init(u32)->u8
; 227, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s4:
1a49 : a9 00 __ LDA #$00
1a4b : 8d 38 82 STA $8238 ; (modplay.reu_base + 0)
1a4e : 8d 39 82 STA $8239 ; (modplay.reu_base + 1)
1a51 : 8d 3a 82 STA $823a ; (modplay.reu_base + 2)
1a54 : 8d 3b 82 STA $823b ; (modplay.reu_base + 3)
1a57 : a2 fa __ LDX #$fa
1a59 : 8e 02 df STX $df02 
1a5c : a2 7d __ LDX #$7d
1a5e : 8e 03 df STX $df03 
1a61 : 8d 04 df STA $df04 
1a64 : 8d 05 df STA $df05 
1a67 : 8d 06 df STA $df06 
1a6a : a9 3c __ LDA #$3c
1a6c : 8d 07 df STA $df07 
1a6f : a9 04 __ LDA #$04
1a71 : 8d 08 df STA $df08 
1a74 : a9 00 __ LDA #$00
1a76 : 8d 0a df STA $df0a 
1a79 : a9 91 __ LDA #$91
1a7b : 8d 01 df STA $df01 
1a7e : ad 32 82 LDA $8232 ; (hdr[0] + 1080)
1a81 : c9 4d __ CMP #$4d
1a83 : f0 03 __ BEQ $1a88 ; (modplay_init.s48 + 0)
1a85 : 4c e8 1c JMP $1ce8 ; (modplay_init.s5 + 0)
.s48:
1a88 : ad 33 82 LDA $8233 ; (hdr[0] + 1081)
1a8b : c9 2e __ CMP #$2e
1a8d : d0 03 __ BNE $1a92 ; (modplay_init.s49 + 0)
1a8f : 4c d7 1c JMP $1cd7 ; (modplay_init.s52 + 0)
.s49:
1a92 : c9 21 __ CMP #$21
1a94 : d0 0e __ BNE $1aa4 ; (modplay_init.s6 + 0)
.s50:
1a96 : ad 34 82 LDA $8234 ; (hdr[0] + 1082)
1a99 : c9 4b __ CMP #$4b
1a9b : d0 07 __ BNE $1aa4 ; (modplay_init.s6 + 0)
.s51:
1a9d : ad 35 82 LDA $8235 ; (hdr[0] + 1083)
1aa0 : c9 21 __ CMP #$21
1aa2 : f0 1c __ BEQ $1ac0 ; (modplay_init.s44 + 0)
.s6:
1aa4 : ad 32 82 LDA $8232 ; (hdr[0] + 1080)
1aa7 : c9 46 __ CMP #$46
1aa9 : d0 19 __ BNE $1ac4 ; (modplay_init.s7 + 0)
.s41:
1aab : ad 33 82 LDA $8233 ; (hdr[0] + 1081)
1aae : c9 4c __ CMP #$4c
1ab0 : d0 12 __ BNE $1ac4 ; (modplay_init.s7 + 0)
.s42:
1ab2 : ad 34 82 LDA $8234 ; (hdr[0] + 1082)
1ab5 : c9 54 __ CMP #$54
1ab7 : d0 0b __ BNE $1ac4 ; (modplay_init.s7 + 0)
.s43:
1ab9 : ad 35 82 LDA $8235 ; (hdr[0] + 1083)
1abc : c9 34 __ CMP #$34
1abe : d0 04 __ BNE $1ac4 ; (modplay_init.s7 + 0)
.s44:
1ac0 : a9 1f __ LDA #$1f
1ac2 : d0 17 __ BNE $1adb ; (modplay_init.s12 + 0)
.s7:
1ac4 : a2 00 __ LDX #$00
.l8:
1ac6 : bd 32 82 LDA $8232,x ; (hdr[0] + 1080)
1ac9 : c9 20 __ CMP #$20
1acb : b0 03 __ BCS $1ad0 ; (modplay_init.s9 + 0)
1acd : 4c d2 1c JMP $1cd2 ; (modplay_init.s40 + 0)
.s9:
1ad0 : c9 7f __ CMP #$7f
1ad2 : b0 f9 __ BCS $1acd ; (modplay_init.l8 + 7)
.s10:
1ad4 : e8 __ __ INX
1ad5 : e0 04 __ CPX #$04
1ad7 : 90 ed __ BCC $1ac6 ; (modplay_init.l8 + 0)
.s11:
1ad9 : a9 0f __ LDA #$0f
.s12:
1adb : 8d 3d 82 STA $823d ; (modplay.num_samples + 0)
1ade : ad b0 81 LDA $81b0 ; (hdr[0] + 950)
1ae1 : 8d 3c 82 STA $823c ; (modplay.song_length + 0)
1ae4 : d0 09 __ BNE $1aef ; (modplay_init.s39 + 0)
.s62:
1ae6 : a9 80 __ LDA #$80
.s13:
1ae8 : 8d 3c 82 STA $823c ; (modplay.song_length + 0)
.s14:
1aeb : a2 7f __ LDX #$7f
1aed : d0 09 __ BNE $1af8 ; (modplay_init.l15 + 0)
.s39:
1aef : a9 80 __ LDA #$80
1af1 : cd b0 81 CMP $81b0 ; (hdr[0] + 950)
1af4 : b0 f5 __ BCS $1aeb ; (modplay_init.s14 + 0)
1af6 : 90 f0 __ BCC $1ae8 ; (modplay_init.s13 + 0)
.l15:
1af8 : bd b2 81 LDA $81b2,x ; (hdr[0] + 952)
1afb : 9d 3f 82 STA $823f,x ; (modplay.order_table[0] + 0)
1afe : ca __ __ DEX
1aff : 10 f7 __ BPL $1af8 ; (modplay_init.l15 + 0)
.s16:
1b01 : a2 00 __ LDX #$00
1b03 : a0 00 __ LDY #$00
.l17:
1b05 : 98 __ __ TYA
1b06 : dd 3f 82 CMP $823f,x ; (modplay.order_table[0] + 0)
1b09 : b0 04 __ BCS $1b0f ; (modplay_init.s18 + 0)
.s38:
1b0b : bd 3f 82 LDA $823f,x ; (modplay.order_table[0] + 0)
1b0e : a8 __ __ TAY
.s18:
1b0f : e8 __ __ INX
1b10 : 10 f3 __ BPL $1b05 ; (modplay_init.l17 + 0)
.s19:
1b12 : 18 __ __ CLC
1b13 : 69 01 __ ADC #$01
1b15 : 85 1c __ STA ACCU + 1 
1b17 : 8d 3e 82 STA $823e ; (modplay.num_patterns + 0)
1b1a : a9 00 __ LDA #$00
1b1c : 06 1c __ ASL ACCU + 1 
1b1e : 2a __ __ ROL
1b1f : 06 1c __ ASL ACCU + 1 
1b21 : 2a __ __ ROL
1b22 : 85 1d __ STA ACCU + 2 
1b24 : ad 3d 82 LDA $823d ; (modplay.num_samples + 0)
1b27 : c9 1f __ CMP #$1f
1b29 : d0 03 __ BNE $1b2e ; (modplay_init.s20 + 0)
1b2b : 4c be 1c JMP $1cbe ; (modplay_init.s37 + 0)
.s20:
1b2e : a5 1c __ LDA ACCU + 1 
1b30 : 09 02 __ ORA #$02
1b32 : 85 1c __ STA ACCU + 1 
1b34 : a9 58 __ LDA #$58
1b36 : 85 1b __ STA ACCU + 0 
1b38 : ad 3d 82 LDA $823d ; (modplay.num_samples + 0)
1b3b : d0 66 __ BNE $1ba3 ; (modplay_init.s31 + 0)
.s21:
1b3d : a9 00 __ LDA #$00
1b3f : 8d fd 73 STA $73fd ; (mod_paused + 0)
1b42 : 8d bf 82 STA $82bf ; (modplay.order_pos + 0)
1b45 : 8d c1 82 STA $82c1 ; (modplay.row + 0)
1b48 : 8d c2 82 STA $82c2 ; (modplay.tick + 0)
1b4b : 8d c8 82 STA $82c8 ; (modplay.active + 0)
1b4e : ad 3f 82 LDA $823f ; (modplay.order_table[0] + 0)
1b51 : 8d c0 82 STA $82c0 ; (modplay.pattern_num + 0)
1b54 : a9 01 __ LDA #$01
1b56 : 8d c7 82 STA $82c7 ; (modplay.stereo + 0)
1b59 : 8d c9 82 STA $82c9 ; (modplay.loop_song + 0)
1b5c : a9 06 __ LDA #$06
1b5e : 8d c3 82 STA $82c3 ; (modplay.ticks_per_row + 0)
1b61 : a9 7d __ LDA #$7d
1b63 : 8d c4 82 STA $82c4 ; (modplay.bpm + 0)
1b66 : a9 00 __ LDA #$00
1b68 : a2 c8 __ LDX #$c8
1b6a : 8e c6 82 STX $82c6 ; (modplay.master_volume + 0)
.l22:
1b6d : ca __ __ DEX
1b6e : 9d 1a 85 STA $851a,x ; (modplay.channel[0].sample_num + 0)
1b71 : d0 fa __ BNE $1b6d ; (modplay_init.l22 + 0)
.s23:
1b73 : 85 46 __ STA T2 + 0 
.l24:
1b75 : a5 46 __ LDA T2 + 0 
1b77 : c9 01 __ CMP #$01
1b79 : f0 04 __ BEQ $1b7f ; (modplay_init.s30 + 0)
.s25:
1b7b : c9 02 __ CMP #$02
1b7d : d0 04 __ BNE $1b83 ; (modplay_init.s26 + 0)
.s30:
1b7f : a0 ff __ LDY #$ff
1b81 : d0 02 __ BNE $1b85 ; (modplay_init.l27 + 0)
.s26:
1b83 : a0 00 __ LDY #$00
.l27:
1b85 : a6 46 __ LDX T2 + 0 
1b87 : bd 0f 72 LDA $720f,x ; (__multab50L + 0)
1b8a : aa __ __ TAX
1b8b : 98 __ __ TYA
1b8c : 9d 20 85 STA $8520,x ; (modplay.channel[0].pan + 0)
1b8f : e6 46 __ INC T2 + 0 
1b91 : a5 46 __ LDA T2 + 0 
1b93 : c9 04 __ CMP #$04
1b95 : b0 07 __ BCS $1b9e ; (modplay_init.s28 + 0)
.s29:
1b97 : ad c7 82 LDA $82c7 ; (modplay.stereo + 0)
1b9a : f0 e7 __ BEQ $1b83 ; (modplay_init.s26 + 0)
1b9c : d0 d7 __ BNE $1b75 ; (modplay_init.l24 + 0)
.s28:
1b9e : a9 01 __ LDA #$01
.s3:
1ba0 : 85 1b __ STA ACCU + 0 
1ba2 : 60 __ __ RTS
.s31:
1ba3 : a9 00 __ LDA #$00
1ba5 : 85 43 __ STA T1 + 0 
1ba7 : 85 44 __ STA T1 + 1 
1ba9 : 85 45 __ STA T1 + 2 
1bab : 85 1e __ STA ACCU + 3 
1bad : a9 cd __ LDA #$cd
1baf : 85 4e __ STA T6 + 0 
1bb1 : a9 82 __ LDA #$82
1bb3 : 85 4f __ STA T6 + 1 
1bb5 : a9 0e __ LDA #$0e
1bb7 : 85 50 __ STA T7 + 0 
1bb9 : a9 7e __ LDA #$7e
1bbb : 85 51 __ STA T7 + 1 
1bbd : a2 00 __ LDX #$00
1bbf : 18 __ __ CLC
.l32:
1bc0 : a5 1b __ LDA ACCU + 0 
1bc2 : 65 43 __ ADC T1 + 0 
1bc4 : a0 00 __ LDY #$00
1bc6 : 84 48 __ STY T2 + 2 
1bc8 : 91 4e __ STA (T6 + 0),y 
1bca : a5 1c __ LDA ACCU + 1 
1bcc : 65 44 __ ADC T1 + 1 
1bce : c8 __ __ INY
1bcf : 91 4e __ STA (T6 + 0),y 
1bd1 : a5 1d __ LDA ACCU + 2 
1bd3 : 65 45 __ ADC T1 + 2 
1bd5 : c8 __ __ INY
1bd6 : 91 4e __ STA (T6 + 0),y 
1bd8 : 8a __ __ TXA
1bd9 : 69 00 __ ADC #$00
1bdb : c8 __ __ INY
1bdc : 91 4e __ STA (T6 + 0),y 
1bde : a0 16 __ LDY #$16
1be0 : b1 50 __ LDA (T7 + 0),y 
1be2 : 85 47 __ STA T2 + 1 
1be4 : c8 __ __ INY
1be5 : b1 50 __ LDA (T7 + 0),y 
1be7 : 0a __ __ ASL
1be8 : 85 46 __ STA T2 + 0 
1bea : 26 47 __ ROL T2 + 1 
1bec : 26 48 __ ROL T2 + 2 
1bee : a0 04 __ LDY #$04
1bf0 : 91 4e __ STA (T6 + 0),y 
1bf2 : a5 47 __ LDA T2 + 1 
1bf4 : c8 __ __ INY
1bf5 : 91 4e __ STA (T6 + 0),y 
1bf7 : a5 48 __ LDA T2 + 2 
1bf9 : c8 __ __ INY
1bfa : 91 4e __ STA (T6 + 0),y 
1bfc : a9 00 __ LDA #$00
1bfe : c8 __ __ INY
1bff : 91 4e __ STA (T6 + 0),y 
1c01 : a0 19 __ LDY #$19
1c03 : b1 50 __ LDA (T7 + 0),y 
1c05 : c9 41 __ CMP #$41
1c07 : 90 02 __ BCC $1c0b ; (modplay_init.s54 + 0)
.s33:
1c09 : a9 40 __ LDA #$40
.s54:
1c0b : a0 11 __ LDY #$11
1c0d : 91 4e __ STA (T6 + 0),y 
1c0f : a0 18 __ LDY #$18
1c11 : b1 50 __ LDA (T7 + 0),y 
1c13 : 29 0f __ AND #$0f
1c15 : a0 12 __ LDY #$12
1c17 : 91 4e __ STA (T6 + 0),y 
1c19 : a0 1a __ LDY #$1a
1c1b : b1 50 __ LDA (T7 + 0),y 
1c1d : 85 4a __ STA T3 + 1 
1c1f : c8 __ __ INY
1c20 : b1 50 __ LDA (T7 + 0),y 
1c22 : 85 49 __ STA T3 + 0 
1c24 : 0a __ __ ASL
1c25 : a0 08 __ LDY #$08
1c27 : 91 4e __ STA (T6 + 0),y 
1c29 : a5 4a __ LDA T3 + 1 
1c2b : 2a __ __ ROL
1c2c : c8 __ __ INY
1c2d : 91 4e __ STA (T6 + 0),y 
1c2f : a9 00 __ LDA #$00
1c31 : 2a __ __ ROL
1c32 : c8 __ __ INY
1c33 : 91 4e __ STA (T6 + 0),y 
1c35 : a9 00 __ LDA #$00
1c37 : c8 __ __ INY
1c38 : 91 4e __ STA (T6 + 0),y 
1c3a : a0 1d __ LDY #$1d
1c3c : b1 50 __ LDA (T7 + 0),y 
1c3e : 85 4c __ STA T4 + 0 
1c40 : 65 49 __ ADC T3 + 0 
1c42 : 85 49 __ STA T3 + 0 
1c44 : 88 __ __ DEY
1c45 : b1 50 __ LDA (T7 + 0),y 
1c47 : 85 4d __ STA T4 + 1 
1c49 : 65 4a __ ADC T3 + 1 
1c4b : 85 4a __ STA T3 + 1 
1c4d : a9 00 __ LDA #$00
1c4f : 2a __ __ ROL
1c50 : 85 4b __ STA T3 + 2 
1c52 : a9 00 __ LDA #$00
1c54 : 06 49 __ ASL T3 + 0 
1c56 : 26 4a __ ROL T3 + 1 
1c58 : 26 4b __ ROL T3 + 2 
1c5a : a0 0f __ LDY #$0f
1c5c : 91 4e __ STA (T6 + 0),y 
1c5e : a5 49 __ LDA T3 + 0 
1c60 : a0 0c __ LDY #$0c
1c62 : 91 4e __ STA (T6 + 0),y 
1c64 : a5 4a __ LDA T3 + 1 
1c66 : c8 __ __ INY
1c67 : 91 4e __ STA (T6 + 0),y 
1c69 : a5 4b __ LDA T3 + 2 
1c6b : c8 __ __ INY
1c6c : 91 4e __ STA (T6 + 0),y 
1c6e : a5 4d __ LDA T4 + 1 
1c70 : f0 04 __ BEQ $1c76 ; (modplay_init.s36 + 0)
.s35:
1c72 : a9 01 __ LDA #$01
1c74 : d0 09 __ BNE $1c7f ; (modplay_init.s34 + 0)
.s36:
1c76 : a9 01 __ LDA #$01
1c78 : c5 4c __ CMP T4 + 0 
1c7a : a9 00 __ LDA #$00
1c7c : 2a __ __ ROL
1c7d : 49 01 __ EOR #$01
.s34:
1c7f : a0 10 __ LDY #$10
1c81 : 91 4e __ STA (T6 + 0),y 
1c83 : 18 __ __ CLC
1c84 : a5 46 __ LDA T2 + 0 
1c86 : 65 43 __ ADC T1 + 0 
1c88 : 85 43 __ STA T1 + 0 
1c8a : a5 47 __ LDA T2 + 1 
1c8c : 65 44 __ ADC T1 + 1 
1c8e : 85 44 __ STA T1 + 1 
1c90 : a5 48 __ LDA T2 + 2 
1c92 : 65 45 __ ADC T1 + 2 
1c94 : 85 45 __ STA T1 + 2 
1c96 : 90 02 __ BCC $1c9a ; (modplay_init.s57 + 0)
.s56:
1c98 : e8 __ __ INX
1c99 : 18 __ __ CLC
.s57:
1c9a : a5 50 __ LDA T7 + 0 
1c9c : 69 1e __ ADC #$1e
1c9e : 85 50 __ STA T7 + 0 
1ca0 : 90 03 __ BCC $1ca5 ; (modplay_init.s59 + 0)
.s58:
1ca2 : e6 51 __ INC T7 + 1 
1ca4 : 18 __ __ CLC
.s59:
1ca5 : a5 4e __ LDA T6 + 0 
1ca7 : 69 13 __ ADC #$13
1ca9 : 85 4e __ STA T6 + 0 
1cab : 90 02 __ BCC $1caf ; (modplay_init.s61 + 0)
.s60:
1cad : e6 4f __ INC T6 + 1 
.s61:
1caf : e6 1e __ INC ACCU + 3 
1cb1 : a5 1e __ LDA ACCU + 3 
1cb3 : cd 3d 82 CMP $823d ; (modplay.num_samples + 0)
1cb6 : b0 03 __ BCS $1cbb ; (modplay_init.s61 + 12)
1cb8 : 4c c0 1b JMP $1bc0 ; (modplay_init.l32 + 0)
1cbb : 4c 3d 1b JMP $1b3d ; (modplay_init.s21 + 0)
.s37:
1cbe : a9 3c __ LDA #$3c
1cc0 : 85 1b __ STA ACCU + 0 
1cc2 : a5 1c __ LDA ACCU + 1 
1cc4 : 69 03 __ ADC #$03
1cc6 : 85 1c __ STA ACCU + 1 
1cc8 : b0 03 __ BCS $1ccd ; (modplay_init.s55 + 0)
1cca : 4c a3 1b JMP $1ba3 ; (modplay_init.s31 + 0)
.s55:
1ccd : e6 1d __ INC ACCU + 2 
1ccf : 4c a3 1b JMP $1ba3 ; (modplay_init.s31 + 0)
.s40:
1cd2 : a9 00 __ LDA #$00
1cd4 : 4c a0 1b JMP $1ba0 ; (modplay_init.s3 + 0)
.s52:
1cd7 : ad 34 82 LDA $8234 ; (hdr[0] + 1082)
1cda : c9 4b __ CMP #$4b
1cdc : d0 0a __ BNE $1ce8 ; (modplay_init.s5 + 0)
.s53:
1cde : ad 35 82 LDA $8235 ; (hdr[0] + 1083)
1ce1 : c9 2e __ CMP #$2e
1ce3 : d0 03 __ BNE $1ce8 ; (modplay_init.s5 + 0)
1ce5 : 4c c0 1a JMP $1ac0 ; (modplay_init.s44 + 0)
.s5:
1ce8 : ad 32 82 LDA $8232 ; (hdr[0] + 1080)
1ceb : c9 34 __ CMP #$34
1ced : f0 03 __ BEQ $1cf2 ; (modplay_init.s45 + 0)
1cef : 4c a4 1a JMP $1aa4 ; (modplay_init.s6 + 0)
.s45:
1cf2 : ad 33 82 LDA $8233 ; (hdr[0] + 1081)
1cf5 : c9 43 __ CMP #$43
1cf7 : f0 03 __ BEQ $1cfc ; (modplay_init.s46 + 0)
1cf9 : 4c c4 1a JMP $1ac4 ; (modplay_init.s7 + 0)
.s46:
1cfc : ad 34 82 LDA $8234 ; (hdr[0] + 1082)
1cff : c9 48 __ CMP #$48
1d01 : d0 f6 __ BNE $1cf9 ; (modplay_init.s45 + 7)
.s47:
1d03 : ad 35 82 LDA $8235 ; (hdr[0] + 1083)
1d06 : c9 4e __ CMP #$4e
1d08 : d0 ef __ BNE $1cf9 ; (modplay_init.s45 + 7)
1d0a : 4c c0 1a JMP $1ac0 ; (modplay_init.s44 + 0)
--------------------------------------------------------------------
1d0d : __ __ __ BYT 6d 55 53 49 43 00                               : mUSIC.
--------------------------------------------------------------------
1d13 : __ __ __ BYT 34 45 56 2e 4d 4f 44 00                         : 4EV.MOD.
--------------------------------------------------------------------
1d1b : __ __ __ BYT 62 41 44 20 6d 6f 64 20 46 4f 52 4d 41 54 00    : bAD mod FORMAT.
--------------------------------------------------------------------
1d2a : __ __ __ BYT 66 49 4c 45 20 4e 4f 54 20 46 4f 55 4e 44 00    : fILE NOT FOUND.
--------------------------------------------------------------------
1d39 : __ __ __ BYT 64 45 54 45 43 54 49 4f 4e 20 43 4f 4d 50 4c 45 : dETECTION COMPLE
1d49 : __ __ __ BYT 54 45 2e 00                                     : TE..
--------------------------------------------------------------------
screen_wait_key: ; screen_wait_key(const u8*)->void
;  37, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
1d4d : a9 01 __ LDA #$01
1d4f : 85 0f __ STA P2 
1d51 : a5 10 __ LDA P3 ; (msg + 0)
1d53 : aa __ __ TAX
1d54 : 05 11 __ ORA P4 ; (msg + 1)
1d56 : f0 0a __ BEQ $1d62 ; (screen_wait_key.s5 + 0)
.s7:
1d58 : a5 11 __ LDA P4 ; (msg + 1)
1d5a : 85 0e __ STA P1 
1d5c : a0 00 __ LDY #$00
1d5e : b1 10 __ LDA (P3),y ; (msg + 0)
1d60 : d0 06 __ BNE $1d68 ; (screen_wait_key.s6 + 0)
.s5:
1d62 : a9 1d __ LDA #$1d
1d64 : 85 0e __ STA P1 
1d66 : a2 73 __ LDX #$73
.s6:
1d68 : 86 0d __ STX P0 
1d6a : 20 c2 10 JSR $10c2 ; (cwin_put_string.s4 + 0)
1d6d : 20 a2 10 JSR $10a2 ; (cwin_cursor_newline.s4 + 0)
1d70 : 4c 1b 12 JMP $121b ; (cwin_getch.s4 + 0)
--------------------------------------------------------------------
1d73 : __ __ __ BYT 70 52 45 53 53 20 41 4e 59 20 4b 45 59 20 54 4f : pRESS ANY KEY TO
1d83 : __ __ __ BYT 20 43 4f 4e 54 49 4e 55 45 2e 00                :  CONTINUE..
--------------------------------------------------------------------
1d8e : __ __ __ BYT 70 52 45 53 53 20 41 4e 59 20 4b 45 59 20 54 4f : pRESS ANY KEY TO
1d9e : __ __ __ BYT 20 53 54 41 52 54 20 54 48 45 20 44 45 4d 4f 2e :  START THE DEMO.
1dae : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
gears_run: ; gears_run()->void
;   8, "/home/xahmol/git/UltimateDemo2026/src/gears.h"
.s1:
1daf : a5 53 __ LDA T0 + 0 
1db1 : 8d ad bf STA $bfad ; (gears_run@stack + 0)
.s4:
1db4 : a9 00 __ LDA #$00
1db6 : 85 f9 __ STA $f9 ; (zp_spd + 0)
1db8 : 85 f7 __ STA $f7 ; (zp_angle1 + 0)
1dba : a9 01 __ LDA #$01
1dbc : 85 fa __ STA $fa ; (zp_dirty + 0)
1dbe : a9 1c __ LDA #$1c
1dc0 : 85 f8 __ STA $f8 ; (zp_angle2 + 0)
1dc2 : 20 81 20 JSR $2081 ; (hires_init.s4 + 0)
1dc5 : 20 59 21 JSR $2159 ; (engine_init.s4 + 0)
1dc8 : a9 00 __ LDA #$00
1dca : 20 f1 15 JSR $15f1 ; (turbo_set.s4 + 0)
1dcd : a9 00 __ LDA #$00
1dcf : 85 0f __ STA P2 
1dd1 : 85 10 __ STA P3 
1dd3 : a9 e0 __ LDA #$e0
1dd5 : 85 11 __ STA P4 
1dd7 : a9 06 __ LDA #$06
1dd9 : 85 12 __ STA P5 
1ddb : 20 a0 21 JSR $21a0 ; (tod_reset.s4 + 0)
1dde : 20 eb 20 JSR $20eb ; (memset@proxy + 0)
1de1 : a9 00 __ LDA #$00
1de3 : 8d f3 bf STA $bff3 ; (sstack + 9)
1de6 : 20 ab 21 JSR $21ab ; (draw_speed.s1 + 0)
1de9 : a9 00 __ LDA #$00
1deb : 8d f0 bf STA $bff0 ; (sstack + 6)
1dee : 20 ff 2b JSR $2bff ; (draw_message.s1 + 0)
1df1 : a9 1c __ LDA #$1c
1df3 : 8d f9 bf STA $bff9 ; (sstack + 15)
1df6 : 8d fc bf STA $bffc ; (sstack + 18)
1df9 : a9 d0 __ LDA #$d0
1dfb : 8d f7 bf STA $bff7 ; (sstack + 13)
1dfe : a9 00 __ LDA #$00
1e00 : 8d f8 bf STA $bff8 ; (sstack + 14)
1e03 : a9 08 __ LDA #$08
1e05 : 8d fa bf STA $bffa ; (sstack + 16)
1e08 : 8d fb bf STA $bffb ; (sstack + 17)
1e0b : 8d fe bf STA $bffe ; (sstack + 20)
1e0e : a9 28 __ LDA #$28
1e10 : 8d fd bf STA $bffd ; (sstack + 19)
1e13 : a9 04 __ LDA #$04
1e15 : 8d ff bf STA $bfff ; (sstack + 21)
1e18 : 20 ef 2f JSR $2fef ; (draw_gear.s1 + 0)
1e1b : a9 00 __ LDA #$00
1e1d : 8d f8 bf STA $bff8 ; (sstack + 14)
1e20 : 8d f9 bf STA $bff9 ; (sstack + 15)
1e23 : a9 78 __ LDA #$78
1e25 : 8d f7 bf STA $bff7 ; (sstack + 13)
1e28 : a9 10 __ LDA #$10
1e2a : 8d fa bf STA $bffa ; (sstack + 16)
1e2d : a9 04 __ LDA #$04
1e2f : 8d fb bf STA $bffb ; (sstack + 17)
1e32 : a9 2c __ LDA #$2c
1e34 : 8d fc bf STA $bffc ; (sstack + 18)
1e37 : a9 36 __ LDA #$36
1e39 : 8d fd bf STA $bffd ; (sstack + 19)
1e3c : a9 0a __ LDA #$0a
1e3e : 8d fe bf STA $bffe ; (sstack + 20)
1e41 : a9 06 __ LDA #$06
1e43 : 8d ff bf STA $bfff ; (sstack + 21)
1e46 : 20 ef 2f JSR $2fef ; (draw_gear.s1 + 0)
1e49 : a9 00 __ LDA #$00
.l20:
1e4b : 85 fa __ STA $fa ; (zp_dirty + 0)
.l5:
1e4d : a9 0f __ LDA #$0f
1e4f : c5 f9 __ CMP $f9 ; (zp_spd + 0)
1e51 : b0 0f __ BCS $1e62 ; (gears_run.l12 + 0)
.s6:
1e53 : a9 8f __ LDA #$8f
1e55 : 20 f1 15 JSR $15f1 ; (turbo_set.s4 + 0)
1e58 : a9 0f __ LDA #$0f
1e5a : 85 f9 __ STA $f9 ; (zp_spd + 0)
1e5c : 20 a0 21 JSR $21a0 ; (tod_reset.s4 + 0)
1e5f : 4c 8e 1f JMP $1f8e ; (gears_run.l7 + 0)
.l12:
1e62 : 2c 11 d0 BIT $d011 
1e65 : 30 fb __ BMI $1e62 ; (gears_run.l12 + 0)
.l13:
1e67 : 2c 11 d0 BIT $d011 
1e6a : 10 fb __ BPL $1e67 ; (gears_run.l13 + 0)
.s14:
1e6c : a5 fa __ LDA $fa ; (zp_dirty + 0)
1e6e : f0 25 __ BEQ $1e95 ; (gears_run.s15 + 0)
.s19:
1e70 : a9 00 __ LDA #$00
1e72 : 85 0f __ STA P2 
1e74 : 85 10 __ STA P3 
1e76 : a9 e0 __ LDA #$e0
1e78 : 85 11 __ STA P4 
1e7a : a9 06 __ LDA #$06
1e7c : 85 12 __ STA P5 
1e7e : 20 eb 20 JSR $20eb ; (memset@proxy + 0)
1e81 : a5 f9 __ LDA $f9 ; (zp_spd + 0)
1e83 : 8d f3 bf STA $bff3 ; (sstack + 9)
1e86 : 20 ab 21 JSR $21ab ; (draw_speed.s1 + 0)
1e89 : a5 f9 __ LDA $f9 ; (zp_spd + 0)
1e8b : 8d f0 bf STA $bff0 ; (sstack + 6)
1e8e : 20 ff 2b JSR $2bff ; (draw_message.s1 + 0)
1e91 : a9 00 __ LDA #$00
1e93 : 85 fa __ STA $fa ; (zp_dirty + 0)
.s15:
1e95 : a9 d0 __ LDA #$d0
1e97 : 8d f7 bf STA $bff7 ; (sstack + 13)
1e9a : a9 00 __ LDA #$00
1e9c : 8d f8 bf STA $bff8 ; (sstack + 14)
1e9f : a5 f8 __ LDA $f8 ; (zp_angle2 + 0)
1ea1 : 8d f9 bf STA $bff9 ; (sstack + 15)
1ea4 : a9 08 __ LDA #$08
1ea6 : 8d fa bf STA $bffa ; (sstack + 16)
1ea9 : 8d fb bf STA $bffb ; (sstack + 17)
1eac : 8d fe bf STA $bffe ; (sstack + 20)
1eaf : a9 1c __ LDA #$1c
1eb1 : 8d fc bf STA $bffc ; (sstack + 18)
1eb4 : a9 28 __ LDA #$28
1eb6 : 8d fd bf STA $bffd ; (sstack + 19)
1eb9 : a9 04 __ LDA #$04
1ebb : 8d ff bf STA $bfff ; (sstack + 21)
1ebe : 20 ef 2f JSR $2fef ; (draw_gear.s1 + 0)
1ec1 : a9 78 __ LDA #$78
1ec3 : 8d f7 bf STA $bff7 ; (sstack + 13)
1ec6 : a9 00 __ LDA #$00
1ec8 : 8d f8 bf STA $bff8 ; (sstack + 14)
1ecb : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
1ecd : 8d f9 bf STA $bff9 ; (sstack + 15)
1ed0 : a9 10 __ LDA #$10
1ed2 : 8d fa bf STA $bffa ; (sstack + 16)
1ed5 : a9 04 __ LDA #$04
1ed7 : 8d fb bf STA $bffb ; (sstack + 17)
1eda : a9 2c __ LDA #$2c
1edc : 8d fc bf STA $bffc ; (sstack + 18)
1edf : a9 36 __ LDA #$36
1ee1 : 8d fd bf STA $bffd ; (sstack + 19)
1ee4 : a9 0a __ LDA #$0a
1ee6 : 8d fe bf STA $bffe ; (sstack + 20)
1ee9 : a9 06 __ LDA #$06
1eeb : 8d ff bf STA $bfff ; (sstack + 21)
1eee : 20 ef 2f JSR $2fef ; (draw_gear.s1 + 0)
1ef1 : 78 __ __ SEI
1ef2 : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
1ef4 : 18 __ __ CLC
1ef5 : 69 01 __ ADC #$01
1ef7 : 29 3f __ AND #$3f
1ef9 : 85 f7 __ STA $f7 ; (zp_angle1 + 0)
1efb : a5 f8 __ LDA $f8 ; (zp_angle2 + 0)
1efd : 38 __ __ SEC
1efe : e9 02 __ SBC #$02
1f00 : 29 3f __ AND #$3f
1f02 : 85 53 __ STA T0 + 0 
1f04 : 85 f8 __ STA $f8 ; (zp_angle2 + 0)
1f06 : 58 __ __ CLI
1f07 : a9 d0 __ LDA #$d0
1f09 : 8d f7 bf STA $bff7 ; (sstack + 13)
1f0c : a9 00 __ LDA #$00
1f0e : 8d f8 bf STA $bff8 ; (sstack + 14)
1f11 : a5 53 __ LDA T0 + 0 
1f13 : 8d f9 bf STA $bff9 ; (sstack + 15)
1f16 : a9 08 __ LDA #$08
1f18 : 8d fa bf STA $bffa ; (sstack + 16)
1f1b : 8d fb bf STA $bffb ; (sstack + 17)
1f1e : 8d fe bf STA $bffe ; (sstack + 20)
1f21 : a9 1c __ LDA #$1c
1f23 : 8d fc bf STA $bffc ; (sstack + 18)
1f26 : a9 28 __ LDA #$28
1f28 : 8d fd bf STA $bffd ; (sstack + 19)
1f2b : a9 04 __ LDA #$04
1f2d : 8d ff bf STA $bfff ; (sstack + 21)
1f30 : 20 ef 2f JSR $2fef ; (draw_gear.s1 + 0)
1f33 : a9 78 __ LDA #$78
1f35 : 8d f7 bf STA $bff7 ; (sstack + 13)
1f38 : a9 00 __ LDA #$00
1f3a : 8d f8 bf STA $bff8 ; (sstack + 14)
1f3d : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
1f3f : 8d f9 bf STA $bff9 ; (sstack + 15)
1f42 : a9 10 __ LDA #$10
1f44 : 8d fa bf STA $bffa ; (sstack + 16)
1f47 : a9 04 __ LDA #$04
1f49 : 8d fb bf STA $bffb ; (sstack + 17)
1f4c : a9 2c __ LDA #$2c
1f4e : 8d fc bf STA $bffc ; (sstack + 18)
1f51 : a9 36 __ LDA #$36
1f53 : 8d fd bf STA $bffd ; (sstack + 19)
1f56 : a9 0a __ LDA #$0a
1f58 : 8d fe bf STA $bffe ; (sstack + 20)
1f5b : a9 06 __ LDA #$06
1f5d : 8d ff bf STA $bfff ; (sstack + 21)
1f60 : 20 ef 2f JSR $2fef ; (draw_gear.s1 + 0)
1f63 : ad 09 dc LDA $dc09 
1f66 : d0 03 __ BNE $1f6b ; (gears_run.s16 + 0)
1f68 : 4c 4d 1e JMP $1e4d ; (gears_run.l5 + 0)
.s16:
1f6b : 20 a0 21 JSR $21a0 ; (tod_reset.s4 + 0)
1f6e : a4 f9 __ LDY $f9 ; (zp_spd + 0)
1f70 : c0 0f __ CPY #$0f
1f72 : b0 13 __ BCS $1f87 ; (gears_run.s17 + 0)
.s18:
1f74 : c8 __ __ INY
1f75 : 84 0d __ STY P0 
1f77 : 84 f9 __ STY $f9 ; (zp_spd + 0)
1f79 : 98 __ __ TYA
1f7a : 20 f1 15 JSR $15f1 ; (turbo_set.s4 + 0)
1f7d : a5 0d __ LDA P0 
1f7f : 20 4f 3e JSR $3e4f ; (engine_update.s4 + 0)
1f82 : a9 01 __ LDA #$01
1f84 : 4c 4b 1e JMP $1e4b ; (gears_run.l20 + 0)
.s17:
1f87 : a9 10 __ LDA #$10
1f89 : 85 f9 __ STA $f9 ; (zp_spd + 0)
1f8b : 4c 4d 1e JMP $1e4d ; (gears_run.l5 + 0)
.l7:
1f8e : ad 09 dc LDA $dc09 
1f91 : c9 05 __ CMP #$05
1f93 : 90 11 __ BCC $1fa6 ; (gears_run.l9 + 0)
.s8:
1f95 : a9 00 __ LDA #$00
1f97 : 8d 04 d4 STA $d404 
1f9a : 8d 0b d4 STA $d40b 
1f9d : 8d 18 d4 STA $d418 
.s3:
1fa0 : ad ad bf LDA $bfad ; (gears_run@stack + 0)
1fa3 : 85 53 __ STA T0 + 0 
1fa5 : 60 __ __ RTS
.l9:
1fa6 : 2c 11 d0 BIT $d011 
1fa9 : 30 fb __ BMI $1fa6 ; (gears_run.l9 + 0)
.l10:
1fab : 2c 11 d0 BIT $d011 
1fae : 10 fb __ BPL $1fab ; (gears_run.l10 + 0)
.s11:
1fb0 : a9 d0 __ LDA #$d0
1fb2 : 8d f7 bf STA $bff7 ; (sstack + 13)
1fb5 : a9 00 __ LDA #$00
1fb7 : 8d f8 bf STA $bff8 ; (sstack + 14)
1fba : a5 f8 __ LDA $f8 ; (zp_angle2 + 0)
1fbc : 8d f9 bf STA $bff9 ; (sstack + 15)
1fbf : a9 08 __ LDA #$08
1fc1 : 8d fa bf STA $bffa ; (sstack + 16)
1fc4 : 8d fb bf STA $bffb ; (sstack + 17)
1fc7 : 8d fe bf STA $bffe ; (sstack + 20)
1fca : a9 1c __ LDA #$1c
1fcc : 8d fc bf STA $bffc ; (sstack + 18)
1fcf : a9 28 __ LDA #$28
1fd1 : 8d fd bf STA $bffd ; (sstack + 19)
1fd4 : a9 04 __ LDA #$04
1fd6 : 8d ff bf STA $bfff ; (sstack + 21)
1fd9 : 20 ef 2f JSR $2fef ; (draw_gear.s1 + 0)
1fdc : a9 78 __ LDA #$78
1fde : 8d f7 bf STA $bff7 ; (sstack + 13)
1fe1 : a9 00 __ LDA #$00
1fe3 : 8d f8 bf STA $bff8 ; (sstack + 14)
1fe6 : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
1fe8 : 8d f9 bf STA $bff9 ; (sstack + 15)
1feb : a9 10 __ LDA #$10
1fed : 8d fa bf STA $bffa ; (sstack + 16)
1ff0 : a9 04 __ LDA #$04
1ff2 : 8d fb bf STA $bffb ; (sstack + 17)
1ff5 : a9 2c __ LDA #$2c
1ff7 : 8d fc bf STA $bffc ; (sstack + 18)
1ffa : a9 36 __ LDA #$36
1ffc : 8d fd bf STA $bffd ; (sstack + 19)
1fff : a9 0a __ LDA #$0a
2001 : 8d fe bf STA $bffe ; (sstack + 20)
2004 : a9 06 __ LDA #$06
2006 : 8d ff bf STA $bfff ; (sstack + 21)
2009 : 20 ef 2f JSR $2fef ; (draw_gear.s1 + 0)
200c : 78 __ __ SEI
200d : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
200f : 18 __ __ CLC
2010 : 69 01 __ ADC #$01
2012 : 29 3f __ AND #$3f
2014 : 85 f7 __ STA $f7 ; (zp_angle1 + 0)
2016 : a5 f8 __ LDA $f8 ; (zp_angle2 + 0)
2018 : 38 __ __ SEC
2019 : e9 02 __ SBC #$02
201b : 29 3f __ AND #$3f
201d : 85 53 __ STA T0 + 0 
201f : 85 f8 __ STA $f8 ; (zp_angle2 + 0)
2021 : 58 __ __ CLI
2022 : a9 d0 __ LDA #$d0
2024 : 8d f7 bf STA $bff7 ; (sstack + 13)
2027 : a9 00 __ LDA #$00
2029 : 8d f8 bf STA $bff8 ; (sstack + 14)
202c : a5 53 __ LDA T0 + 0 
202e : 8d f9 bf STA $bff9 ; (sstack + 15)
2031 : a9 08 __ LDA #$08
2033 : 8d fa bf STA $bffa ; (sstack + 16)
2036 : 8d fb bf STA $bffb ; (sstack + 17)
2039 : 8d fe bf STA $bffe ; (sstack + 20)
203c : a9 1c __ LDA #$1c
203e : 8d fc bf STA $bffc ; (sstack + 18)
2041 : a9 28 __ LDA #$28
2043 : 8d fd bf STA $bffd ; (sstack + 19)
2046 : a9 04 __ LDA #$04
2048 : 8d ff bf STA $bfff ; (sstack + 21)
204b : 20 ef 2f JSR $2fef ; (draw_gear.s1 + 0)
204e : a9 78 __ LDA #$78
2050 : 8d f7 bf STA $bff7 ; (sstack + 13)
2053 : a9 00 __ LDA #$00
2055 : 8d f8 bf STA $bff8 ; (sstack + 14)
2058 : a5 f7 __ LDA $f7 ; (zp_angle1 + 0)
205a : 8d f9 bf STA $bff9 ; (sstack + 15)
205d : a9 10 __ LDA #$10
205f : 8d fa bf STA $bffa ; (sstack + 16)
2062 : a9 04 __ LDA #$04
2064 : 8d fb bf STA $bffb ; (sstack + 17)
2067 : a9 2c __ LDA #$2c
2069 : 8d fc bf STA $bffc ; (sstack + 18)
206c : a9 36 __ LDA #$36
206e : 8d fd bf STA $bffd ; (sstack + 19)
2071 : a9 0a __ LDA #$0a
2073 : 8d fe bf STA $bffe ; (sstack + 20)
2076 : a9 06 __ LDA #$06
2078 : 8d ff bf STA $bfff ; (sstack + 21)
207b : 20 ef 2f JSR $2fef ; (draw_gear.s1 + 0)
207e : 4c 8e 1f JMP $1f8e ; (gears_run.l7 + 0)
--------------------------------------------------------------------
hires_init: ; hires_init()->void
; 246, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s4:
2081 : 78 __ __ SEI
2082 : a9 00 __ LDA #$00
2084 : 85 0f __ STA P2 
2086 : 85 10 __ STA P3 
2088 : a9 30 __ LDA #$30
208a : 85 01 __ STA $01 
208c : a9 40 __ LDA #$40
208e : 85 11 __ STA P4 
2090 : a9 1f __ LDA #$1f
2092 : 85 12 __ STA P5 
2094 : a9 10 __ LDA #$10
2096 : a2 fa __ LDX #$fa
.l6:
2098 : ca __ __ DEX
2099 : 9d 00 d0 STA $d000,x 
209c : 9d fa d0 STA $d0fa,x 
209f : 9d f4 d1 STA $d1f4,x 
20a2 : 9d ee d2 STA $d2ee,x 
20a5 : d0 f1 __ BNE $2098 ; (hires_init.l6 + 0)
.s5:
20a7 : a9 00 __ LDA #$00
20a9 : 85 43 __ STA T1 + 0 
20ab : 85 0d __ STA P0 
20ad : a9 e0 __ LDA #$e0
20af : 85 44 __ STA T1 + 1 
20b1 : 85 0e __ STA P1 
20b3 : 20 f3 20 JSR $20f3 ; (memset.s4 + 0)
20b6 : a9 35 __ LDA #$35
20b8 : 85 01 __ STA $01 
20ba : 20 0f 21 JSR $210f ; (mmap_trampoline.s4 + 0)
20bd : 58 __ __ CLI
20be : 20 f5 72 JSR $72f5 ; (vic_setmode@proxy + 0)
20c1 : a5 10 __ LDA P3 
20c3 : 8d f4 79 STA $79f4 ; (Screen.data + 0)
20c6 : a5 11 __ LDA P4 
20c8 : 8d f5 79 STA $79f5 ; (Screen.data + 1)
20cb : a9 28 __ LDA #$28
20cd : 8d f8 79 STA $79f8 ; (Screen.cwidth + 0)
20d0 : a9 19 __ LDA #$19
20d2 : 8d f9 79 STA $79f9 ; (Screen.cheight + 0)
20d5 : a9 40 __ LDA #$40
20d7 : 8d fa 79 STA $79fa ; (Screen.width + 0)
20da : a9 01 __ LDA #$01
20dc : 8d fb 79 STA $79fb ; (Screen.width + 1)
20df : a9 00 __ LDA #$00
20e1 : 8d 20 d0 STA $d020 
20e4 : 8d f6 79 STA $79f6 ; (Screen.rdata + 0)
20e7 : 8d f7 79 STA $79f7 ; (Screen.rdata + 1)
.s3:
20ea : 60 __ __ RTS
--------------------------------------------------------------------
memset@proxy: ; memset@proxy
20eb : a9 60 __ LDA #$60
20ed : 85 0d __ STA P0 
20ef : a9 f8 __ LDA #$f8
20f1 : 85 0e __ STA P1 
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void
;  28, "/home/xahmol/oscar64/include/string.h"
.s4:
20f3 : a5 0f __ LDA P2 
20f5 : a6 12 __ LDX P5 
20f7 : f0 0c __ BEQ $2105 ; (memset.s4 + 18)
20f9 : a0 00 __ LDY #$00
20fb : 91 0d __ STA (P0),y 
20fd : c8 __ __ INY
20fe : d0 fb __ BNE $20fb ; (memset.s4 + 8)
2100 : e6 0e __ INC P1 
2102 : ca __ __ DEX
2103 : d0 f6 __ BNE $20fb ; (memset.s4 + 8)
2105 : a4 11 __ LDY P4 
2107 : f0 05 __ BEQ $210e ; (memset.s3 + 0)
2109 : 88 __ __ DEY
210a : 91 0d __ STA (P0),y 
210c : d0 fb __ BNE $2109 ; (memset.s4 + 22)
.s3:
210e : 60 __ __ RTS
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/xahmol/oscar64/include/c64/memmap.h"
.s4:
210f : a9 24 __ LDA #$24
2111 : 8d fa ff STA $fffa 
2114 : a9 21 __ LDA #$21
2116 : 8d fb ff STA $fffb 
2119 : a9 42 __ LDA #$42
211b : 8d fe ff STA $fffe 
211e : a9 21 __ LDA #$21
2120 : 8d ff ff STA $ffff 
.s3:
2123 : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
2124 : 48 __ __ PHA
2125 : 8a __ __ TXA
2126 : 48 __ __ PHA
2127 : a9 21 __ LDA #$21
2129 : 48 __ __ PHA
212a : a9 3b __ LDA #$3b
212c : 48 __ __ PHA
212d : ba __ __ TSX
212e : bd 05 01 LDA $0105,x 
2131 : 48 __ __ PHA
2132 : a6 01 __ LDX $01 
2134 : a9 36 __ LDA #$36
2136 : 85 01 __ STA $01 
2138 : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
213b : 86 01 __ STX $01 
213d : 68 __ __ PLA
213e : aa __ __ TAX
213f : 68 __ __ PLA
2140 : 40 __ __ RTI
2141 : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
2142 : 48 __ __ PHA
2143 : 8a __ __ TXA
2144 : 48 __ __ PHA
2145 : a9 21 __ LDA #$21
2147 : 48 __ __ PHA
2148 : a9 3b __ LDA #$3b
214a : 48 __ __ PHA
214b : ba __ __ TSX
214c : bd 05 01 LDA $0105,x 
214f : 48 __ __ PHA
2150 : a6 01 __ LDX $01 
2152 : a9 36 __ LDA #$36
2154 : 85 01 __ STA $01 
2156 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
engine_init: ; engine_init()->void
; 337, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s4:
2159 : a9 00 __ LDA #$00
215b : 8d 15 d4 STA $d415 
215e : a9 18 __ LDA #$18
2160 : 8d 16 d4 STA $d416 
2163 : a9 83 __ LDA #$83
2165 : 8d 17 d4 STA $d417 
2168 : a9 1f __ LDA #$1f
216a : 8d 18 d4 STA $d418 
216d : a9 05 __ LDA #$05
216f : 8d 05 d4 STA $d405 
2172 : a9 f3 __ LDA #$f3
2174 : 8d 06 d4 STA $d406 
2177 : a9 a9 __ LDA #$a9
2179 : 8d 00 d4 STA $d400 
217c : a9 02 __ LDA #$02
217e : 8d 01 d4 STA $d401 
2181 : a9 21 __ LDA #$21
2183 : 8d 04 d4 STA $d404 
2186 : a9 05 __ LDA #$05
2188 : 8d 0c d4 STA $d40c 
218b : a9 f3 __ LDA #$f3
218d : 8d 0d d4 STA $d40d 
2190 : a9 52 __ LDA #$52
2192 : 8d 07 d4 STA $d407 
2195 : a9 05 __ LDA #$05
2197 : 8d 08 d4 STA $d408 
219a : a9 81 __ LDA #$81
219c : 8d 0b d4 STA $d40b 
.s3:
219f : 60 __ __ RTS
--------------------------------------------------------------------
tod_reset: ; tod_reset()->void
; 277, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s4:
21a0 : 78 __ __ SEI
21a1 : a9 00 __ LDA #$00
21a3 : 8d 09 dc STA $dc09 
21a6 : 8d 08 dc STA $dc08 
21a9 : 58 __ __ CLI
.s3:
21aa : 60 __ __ RTS
--------------------------------------------------------------------
draw_speed: ; draw_speed(u8)->void
; 194, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s1:
21ab : a2 05 __ LDX #$05
21ad : b5 53 __ LDA T1 + 0,x 
21af : 9d c3 bf STA $bfc3,x ; (draw_speed@stack + 0)
21b2 : ca __ __ DEX
21b3 : 10 f8 __ BPL $21ad ; (draw_speed.s1 + 2)
.s4:
21b5 : ad f3 bf LDA $bff3 ; (sstack + 9)
21b8 : 0a __ __ ASL
21b9 : aa __ __ TAX
21ba : bd 9d 73 LDA $739d,x ; (speed_nums[0] + 0)
21bd : 85 53 __ STA T1 + 0 
21bf : 85 0d __ STA P0 
21c1 : bd 9e 73 LDA $739e,x ; (speed_nums[0] + 1)
21c4 : 85 54 __ STA T1 + 1 
21c6 : 85 0e __ STA P1 
21c8 : 20 44 10 JSR $1044 ; (strlen.s4 + 0)
21cb : a5 1b __ LDA ACCU + 0 
21cd : 0a __ __ ASL
21ce : a2 00 __ LDX #$00
21d0 : 90 02 __ BCC $21d4 ; (draw_speed.s9 + 0)
.s8:
21d2 : e8 __ __ INX
21d3 : 18 __ __ CLC
.s9:
21d4 : 65 1b __ ADC ACCU + 0 
21d6 : 85 43 __ STA T0 + 0 
21d8 : 8a __ __ TXA
21d9 : 69 00 __ ADC #$00
21db : 06 43 __ ASL T0 + 0 
21dd : 2a __ __ ROL
21de : 06 43 __ ASL T0 + 0 
21e0 : 2a __ __ ROL
21e1 : aa __ __ TAX
21e2 : 18 __ __ CLC
21e3 : a5 43 __ LDA T0 + 0 
21e5 : 69 28 __ ADC #$28
21e7 : 85 43 __ STA T0 + 0 
21e9 : 90 01 __ BCC $21ec ; (draw_speed.s11 + 0)
.s10:
21eb : e8 __ __ INX
.s11:
21ec : 86 44 __ STX T0 + 1 
21ee : 38 __ __ SEC
21ef : a9 40 __ LDA #$40
21f1 : e5 43 __ SBC T0 + 0 
21f3 : a8 __ __ TAY
21f4 : a9 01 __ LDA #$01
21f6 : e5 44 __ SBC T0 + 1 
21f8 : aa __ __ TAX
21f9 : 0a __ __ ASL
21fa : 98 __ __ TYA
21fb : 69 00 __ ADC #$00
21fd : 85 56 __ STA T3 + 0 
21ff : 8a __ __ TXA
2200 : 69 00 __ ADC #$00
2202 : c9 80 __ CMP #$80
2204 : 6a __ __ ROR
2205 : 66 56 __ ROR T3 + 0 
2207 : 85 57 __ STA T3 + 1 
2209 : a5 1b __ LDA ACCU + 0 
220b : f0 30 __ BEQ $223d ; (draw_speed.s5 + 0)
.s6:
220d : 85 55 __ STA T2 + 0 
220f : a9 00 __ LDA #$00
2211 : 85 58 __ STA T4 + 0 
.l7:
2213 : a5 56 __ LDA T3 + 0 
2215 : 8d f0 bf STA $bff0 ; (sstack + 6)
2218 : a5 57 __ LDA T3 + 1 
221a : 8d f1 bf STA $bff1 ; (sstack + 7)
221d : a4 58 __ LDY T4 + 0 
221f : b1 53 __ LDA (T1 + 0),y 
2221 : 38 __ __ SEC
2222 : e9 30 __ SBC #$30
2224 : 8d f2 bf STA $bff2 ; (sstack + 8)
2227 : 20 bf 22 JSR $22bf ; (draw_glyph.s1 + 0)
222a : 18 __ __ CLC
222b : a5 56 __ LDA T3 + 0 
222d : 69 0c __ ADC #$0c
222f : 85 56 __ STA T3 + 0 
2231 : 90 02 __ BCC $2235 ; (draw_speed.s13 + 0)
.s12:
2233 : e6 57 __ INC T3 + 1 
.s13:
2235 : e6 58 __ INC T4 + 0 
2237 : a5 58 __ LDA T4 + 0 
2239 : c5 55 __ CMP T2 + 0 
223b : 90 d6 __ BCC $2213 ; (draw_speed.l7 + 0)
.s5:
223d : a9 0a __ LDA #$0a
223f : 8d f2 bf STA $bff2 ; (sstack + 8)
2242 : 18 __ __ CLC
2243 : a5 56 __ LDA T3 + 0 
2245 : 69 06 __ ADC #$06
2247 : 85 56 __ STA T3 + 0 
2249 : 8d f0 bf STA $bff0 ; (sstack + 6)
224c : a5 57 __ LDA T3 + 1 
224e : 69 00 __ ADC #$00
2250 : 85 57 __ STA T3 + 1 
2252 : 8d f1 bf STA $bff1 ; (sstack + 7)
2255 : 20 bf 22 JSR $22bf ; (draw_glyph.s1 + 0)
2258 : a9 0b __ LDA #$0b
225a : 8d f2 bf STA $bff2 ; (sstack + 8)
225d : 18 __ __ CLC
225e : a5 56 __ LDA T3 + 0 
2260 : 69 0c __ ADC #$0c
2262 : 85 56 __ STA T3 + 0 
2264 : 8d f0 bf STA $bff0 ; (sstack + 6)
2267 : a5 57 __ LDA T3 + 1 
2269 : 69 00 __ ADC #$00
226b : 85 57 __ STA T3 + 1 
226d : 8d f1 bf STA $bff1 ; (sstack + 7)
2270 : 20 bf 22 JSR $22bf ; (draw_glyph.s1 + 0)
2273 : a9 0c __ LDA #$0c
2275 : 8d f2 bf STA $bff2 ; (sstack + 8)
2278 : 18 __ __ CLC
2279 : a5 56 __ LDA T3 + 0 
227b : 69 0c __ ADC #$0c
227d : 8d f0 bf STA $bff0 ; (sstack + 6)
2280 : a5 57 __ LDA T3 + 1 
2282 : 69 00 __ ADC #$00
2284 : 8d f1 bf STA $bff1 ; (sstack + 7)
2287 : 20 bf 22 JSR $22bf ; (draw_glyph.s1 + 0)
.s3:
228a : a2 05 __ LDX #$05
228c : bd c3 bf LDA $bfc3,x ; (draw_speed@stack + 0)
228f : 95 53 __ STA T1 + 0,x 
2291 : ca __ __ DEX
2292 : 10 f8 __ BPL $228c ; (draw_speed.s3 + 2)
2294 : 60 __ __ RTS
--------------------------------------------------------------------
2295 : __ __ __ BYT 31 00                                           : 1.
--------------------------------------------------------------------
2297 : __ __ __ BYT 32 00                                           : 2.
--------------------------------------------------------------------
2299 : __ __ __ BYT 33 00                                           : 3.
--------------------------------------------------------------------
229b : __ __ __ BYT 34 00                                           : 4.
--------------------------------------------------------------------
229d : __ __ __ BYT 36 00                                           : 6.
--------------------------------------------------------------------
229f : __ __ __ BYT 38 00                                           : 8.
--------------------------------------------------------------------
22a1 : __ __ __ BYT 31 32 00                                        : 12.
--------------------------------------------------------------------
22a4 : __ __ __ BYT 31 36 00                                        : 16.
--------------------------------------------------------------------
22a7 : __ __ __ BYT 32 30 00                                        : 20.
--------------------------------------------------------------------
22aa : __ __ __ BYT 32 34 00                                        : 24.
--------------------------------------------------------------------
22ad : __ __ __ BYT 32 38 00                                        : 28.
--------------------------------------------------------------------
22b0 : __ __ __ BYT 33 32 00                                        : 32.
--------------------------------------------------------------------
22b3 : __ __ __ BYT 33 36 00                                        : 36.
--------------------------------------------------------------------
22b6 : __ __ __ BYT 34 30 00                                        : 40.
--------------------------------------------------------------------
22b9 : __ __ __ BYT 34 38 00                                        : 48.
--------------------------------------------------------------------
22bc : __ __ __ BYT 36 34 00                                        : 64.
--------------------------------------------------------------------
draw_glyph: ; draw_glyph(i16,i16,u8)->void
; 176, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s1:
22bf : a2 04 __ LDX #$04
22c1 : b5 53 __ LDA T2 + 0,x 
22c3 : 9d ca bf STA $bfca,x ; (draw_glyph@stack + 0)
22c6 : ca __ __ DEX
22c7 : 10 f8 __ BPL $22c1 ; (draw_glyph.s1 + 2)
.s4:
22c9 : ae f2 bf LDX $bff2 ; (sstack + 8)
22cc : bd 13 72 LDA $7213,x ; (__multab7L + 0)
22cf : 18 __ __ CLC
22d0 : 69 00 __ ADC #$00
22d2 : 85 53 __ STA T2 + 0 
22d4 : a9 74 __ LDA #$74
22d6 : 69 00 __ ADC #$00
22d8 : 85 54 __ STA T2 + 1 
22da : a9 79 __ LDA #$79
22dc : 85 15 __ STA P8 
22de : a9 f4 __ LDA #$f4
22e0 : 85 14 __ STA P7 
22e2 : a9 44 __ LDA #$44
22e4 : 85 18 __ STA P11 
22e6 : a9 00 __ LDA #$00
22e8 : 85 13 __ STA P6 
22ea : 85 57 __ STA T6 + 0 
22ec : 18 __ __ CLC
.l5:
22ed : 69 57 __ ADC #$57
22ef : 0a __ __ ASL
22f0 : 85 55 __ STA T4 + 0 
22f2 : a2 00 __ LDX #$00
22f4 : 86 56 __ STX T5 + 0 
.l6:
22f6 : bd e0 7a LDA $7ae0,x ; (bitshift[0] + 32)
22f9 : a4 57 __ LDY T6 + 0 
22fb : 31 53 __ AND (T2 + 0),y 
22fd : f0 30 __ BEQ $232f ; (draw_glyph.s7 + 0)
.s9:
22ff : a5 55 __ LDA T4 + 0 
2301 : 85 12 __ STA P5 
2303 : 8d ea bf STA $bfea ; (sstack + 0)
2306 : a9 00 __ LDA #$00
2308 : 8d eb bf STA $bfeb ; (sstack + 1)
230b : 8d ed bf STA $bfed ; (sstack + 3)
230e : 8d ef bf STA $bfef ; (sstack + 5)
2311 : a9 02 __ LDA #$02
2313 : 8d ec bf STA $bfec ; (sstack + 2)
2316 : 8d ee bf STA $bfee ; (sstack + 4)
2319 : 8a __ __ TXA
231a : 0a __ __ ASL
231b : 18 __ __ CLC
231c : 6d f0 bf ADC $bff0 ; (sstack + 6)
231f : 85 10 __ STA P3 
2321 : 85 16 __ STA P9 
2323 : ad f1 bf LDA $bff1 ; (sstack + 7)
2326 : 69 00 __ ADC #$00
2328 : 85 11 __ STA P4 
232a : 85 17 __ STA P10 
232c : 20 4a 23 JSR $234a ; (bmu_bitblit.s1 + 0)
.s7:
232f : e6 56 __ INC T5 + 0 
2331 : a6 56 __ LDX T5 + 0 
2333 : e0 05 __ CPX #$05
2335 : d0 bf __ BNE $22f6 ; (draw_glyph.l6 + 0)
.s8:
2337 : e6 57 __ INC T6 + 0 
2339 : a5 57 __ LDA T6 + 0 
233b : c9 07 __ CMP #$07
233d : 90 ae __ BCC $22ed ; (draw_glyph.l5 + 0)
.s3:
233f : a2 04 __ LDX #$04
2341 : bd ca bf LDA $bfca,x ; (draw_glyph@stack + 0)
2344 : 95 53 __ STA T2 + 0,x 
2346 : ca __ __ DEX
2347 : 10 f8 __ BPL $2341 ; (draw_glyph.s3 + 2)
2349 : 60 __ __ RTS
--------------------------------------------------------------------
bmu_bitblit: ; bmu_bitblit(const struct Bitmap*,i16,i16,const struct Bitmap*,i16,i16,i16,i16,const u8*,enum BlitOp)->void
; 119, "/home/xahmol/oscar64/include/gfx/bitmap.h"
.s1:
234a : a2 0c __ LDX #$0c
234c : b5 53 __ LDA T11 + 0,x 
234e : 9d d3 bf STA $bfd3,x ; (bmu_bitblit@stack + 0)
2351 : ca __ __ DEX
2352 : 10 f8 __ BPL $234c ; (bmu_bitblit.s1 + 2)
.s4:
2354 : a5 10 __ LDA P3 ; (dx + 0)
2356 : 85 47 __ STA T2 + 0 
2358 : 18 __ __ CLC
2359 : 6d ec bf ADC $bfec ; (sstack + 2)
235c : 85 45 __ STA T1 + 0 
235e : 29 07 __ AND #$07
2360 : aa __ __ TAX
2361 : bd c5 73 LDA $73c5,x ; (rmask[0] + 0)
2364 : 85 56 __ STA T14 + 0 
2366 : ad ed bf LDA $bfed ; (sstack + 3)
2369 : 65 11 __ ADC P4 ; (dx + 1)
236b : 4a __ __ LSR
236c : 66 45 __ ROR T1 + 0 
236e : 4a __ __ LSR
236f : 66 45 __ ROR T1 + 0 
2371 : 4a __ __ LSR
2372 : 66 45 __ ROR T1 + 0 
2374 : a5 11 __ LDA P4 ; (dx + 1)
2376 : 4a __ __ LSR
2377 : 66 47 __ ROR T2 + 0 
2379 : 4a __ __ LSR
237a : 66 47 __ ROR T2 + 0 
237c : 4a __ __ LSR
237d : 66 47 __ ROR T2 + 0 
237f : 38 __ __ SEC
2380 : a5 45 __ LDA T1 + 0 
2382 : e5 47 __ SBC T2 + 0 
2384 : 85 4d __ STA T6 + 0 
2386 : a5 10 __ LDA P3 ; (dx + 0)
2388 : 29 07 __ AND #$07
238a : 85 45 __ STA T1 + 0 
238c : aa __ __ TAX
238d : bd bd 73 LDA $73bd,x ; (lmask[0] + 0)
2390 : 85 52 __ STA T12 + 0 
2392 : 85 55 __ STA T13 + 0 
2394 : ad ee bf LDA $bfee ; (sstack + 4)
2397 : 85 4e __ STA T8 + 0 
2399 : a5 14 __ LDA P7 ; (sbm + 0)
239b : 85 4f __ STA T9 + 0 
239d : a6 15 __ LDX P8 ; (sbm + 1)
239f : 86 50 __ STX T9 + 1 
23a1 : c9 f4 __ CMP #$f4
23a3 : d0 4d __ BNE $23f2 ; (bmu_bitblit.s111 + 0)
.s88:
23a5 : e0 79 __ CPX #$79
23a7 : d0 49 __ BNE $23f2 ; (bmu_bitblit.s111 + 0)
.s72:
23a9 : a9 f4 __ LDA #$f4
23ab : 85 4f __ STA T9 + 0 
23ad : a9 79 __ LDA #$79
23af : 85 50 __ STA T9 + 1 
23b1 : ad eb bf LDA $bfeb ; (sstack + 1)
23b4 : c5 13 __ CMP P6 ; (dy + 1)
23b6 : d0 09 __ BNE $23c1 ; (bmu_bitblit.s87 + 0)
.s84:
23b8 : ad ea bf LDA $bfea ; (sstack + 0)
23bb : c5 12 __ CMP P5 ; (dy + 0)
.s85:
23bd : b0 08 __ BCS $23c7 ; (bmu_bitblit.s73 + 0)
23bf : 90 28 __ BCC $23e9 ; (bmu_bitblit.s75 + 0)
.s87:
23c1 : 45 13 __ EOR P6 ; (dy + 1)
23c3 : 10 f8 __ BPL $23bd ; (bmu_bitblit.s85 + 0)
.s86:
23c5 : b0 22 __ BCS $23e9 ; (bmu_bitblit.s75 + 0)
.s73:
23c7 : a5 13 __ LDA P6 ; (dy + 1)
23c9 : cd eb bf CMP $bfeb ; (sstack + 1)
23cc : d0 24 __ BNE $23f2 ; (bmu_bitblit.s111 + 0)
.s83:
23ce : a5 12 __ LDA P5 ; (dy + 0)
23d0 : cd ea bf CMP $bfea ; (sstack + 0)
23d3 : d0 1f __ BNE $23f4 ; (bmu_bitblit.s5 + 0)
.s74:
23d5 : a5 17 __ LDA P10 ; (sx + 1)
23d7 : c5 11 __ CMP P4 ; (dx + 1)
23d9 : d0 08 __ BNE $23e3 ; (bmu_bitblit.s82 + 0)
.s79:
23db : a5 16 __ LDA P9 ; (sx + 0)
23dd : c5 10 __ CMP P3 ; (dx + 0)
.s80:
23df : 90 08 __ BCC $23e9 ; (bmu_bitblit.s75 + 0)
23e1 : b0 0f __ BCS $23f2 ; (bmu_bitblit.s111 + 0)
.s82:
23e3 : 45 11 __ EOR P4 ; (dx + 1)
23e5 : 10 f8 __ BPL $23df ; (bmu_bitblit.s80 + 0)
.s81:
23e7 : 90 09 __ BCC $23f2 ; (bmu_bitblit.s111 + 0)
.s75:
23e9 : a5 18 __ LDA P11 ; (op + 0)
23eb : 29 08 __ AND #$08
23ed : f0 03 __ BEQ $23f2 ; (bmu_bitblit.s111 + 0)
23ef : 4c d8 28 JMP $28d8 ; (bmu_bitblit.s76 + 0)
.s111:
23f2 : a5 12 __ LDA P5 ; (dy + 0)
.s5:
23f4 : 29 f8 __ AND #$f8
23f6 : 85 1b __ STA ACCU + 0 ; (w + 0)
23f8 : a5 13 __ LDA P6 ; (dy + 1)
23fa : 85 1c __ STA ACCU + 1 ; (w + 1)
23fc : ad f8 79 LDA $79f8 ; (Screen.cwidth + 0)
23ff : 85 51 __ STA T10 + 0 
2401 : 20 e1 6d JSR $6de1 ; (mul16by8 + 0)
2404 : ad f4 79 LDA $79f4 ; (Screen.data + 0)
2407 : 18 __ __ CLC
2408 : 65 1b __ ADC ACCU + 0 ; (w + 0)
240a : 85 4a __ STA T4 + 0 
240c : ad f5 79 LDA $79f5 ; (Screen.data + 1)
240f : 65 1c __ ADC ACCU + 1 ; (w + 1)
2411 : aa __ __ TAX
2412 : a5 10 __ LDA P3 ; (dx + 0)
2414 : 29 f8 __ AND #$f8
2416 : 18 __ __ CLC
2417 : 65 4a __ ADC T4 + 0 
2419 : 85 4a __ STA T4 + 0 
241b : 8a __ __ TXA
241c : 65 11 __ ADC P4 ; (dx + 1)
241e : aa __ __ TAX
241f : a5 12 __ LDA P5 ; (dy + 0)
2421 : 29 07 __ AND #$07
2423 : 18 __ __ CLC
2424 : 65 4a __ ADC T4 + 0 
2426 : 85 53 __ STA T11 + 0 
2428 : 90 01 __ BCC $242b ; (bmu_bitblit.s94 + 0)
.s93:
242a : e8 __ __ INX
.s94:
242b : 86 54 __ STX T11 + 1 
242d : ad eb bf LDA $bfeb ; (sstack + 1)
2430 : 85 1c __ STA ACCU + 1 ; (w + 1)
2432 : ad ea bf LDA $bfea ; (sstack + 0)
2435 : 29 f8 __ AND #$f8
2437 : 85 1b __ STA ACCU + 0 ; (w + 0)
2439 : a0 04 __ LDY #$04
243b : b1 4f __ LDA (T9 + 0),y 
243d : 20 e1 6d JSR $6de1 ; (mul16by8 + 0)
2440 : a0 00 __ LDY #$00
2442 : 84 57 __ STY T16 + 0 
2444 : b1 4f __ LDA (T9 + 0),y 
2446 : 18 __ __ CLC
2447 : 65 1b __ ADC ACCU + 0 ; (w + 0)
2449 : 85 49 __ STA T3 + 0 
244b : c8 __ __ INY
244c : b1 4f __ LDA (T9 + 0),y 
244e : 65 1c __ ADC ACCU + 1 ; (w + 1)
2450 : aa __ __ TAX
2451 : a5 16 __ LDA P9 ; (sx + 0)
2453 : 29 f8 __ AND #$f8
2455 : 18 __ __ CLC
2456 : 65 49 __ ADC T3 + 0 
2458 : 85 49 __ STA T3 + 0 
245a : 8a __ __ TXA
245b : 65 17 __ ADC P10 ; (sx + 1)
245d : aa __ __ TAX
245e : ad ea bf LDA $bfea ; (sstack + 0)
2461 : 29 07 __ AND #$07
2463 : 18 __ __ CLC
2464 : 65 49 __ ADC T3 + 0 
2466 : 85 4a __ STA T4 + 0 
2468 : 90 01 __ BCC $246b ; (bmu_bitblit.s96 + 0)
.s95:
246a : e8 __ __ INX
.s96:
246b : 86 4b __ STX T4 + 1 
246d : a5 16 __ LDA P9 ; (sx + 0)
246f : 29 07 __ AND #$07
2471 : 49 ff __ EOR #$ff
2473 : 38 __ __ SEC
2474 : 65 45 __ ADC T1 + 0 
2476 : 85 43 __ STA T0 + 0 
2478 : f0 0d __ BEQ $2487 ; (bmu_bitblit.s6 + 0)
.s70:
247a : 30 0b __ BMI $2487 ; (bmu_bitblit.s6 + 0)
.s71:
247c : 18 __ __ CLC
247d : a5 4a __ LDA T4 + 0 
247f : 69 f8 __ ADC #$f8
2481 : 85 4a __ STA T4 + 0 
2483 : b0 02 __ BCS $2487 ; (bmu_bitblit.s6 + 0)
.s105:
2485 : c6 4b __ DEC T4 + 1 
.s6:
2487 : a9 18 __ LDA #$18
2489 : 85 58 __ STA T17 + 0 
248b : a9 61 __ LDA #$61
248d : 85 59 __ STA T18 + 0 
248f : a9 90 __ LDA #$90
2491 : 85 5a __ STA T19 + 0 
2493 : a9 e2 __ LDA #$e2
2495 : 85 5b __ STA T20 + 0 
2497 : a9 00 __ LDA #$00
2499 : 85 5c __ STA T21 + 0 
249b : a9 08 __ LDA #$08
.s7:
249d : 85 5d __ STA T22 + 0 
249f : a5 18 __ LDA P11 ; (op + 0)
24a1 : 29 08 __ AND #$08
24a3 : 85 4c __ STA T5 + 0 
24a5 : a5 18 __ LDA P11 ; (op + 0)
24a7 : 29 10 __ AND #$10
24a9 : 85 52 __ STA T12 + 0 
24ab : a5 55 __ LDA T13 + 0 
24ad : 85 45 __ STA T1 + 0 
24af : a5 43 __ LDA T0 + 0 
24b1 : 29 07 __ AND #$07
24b3 : 85 5f __ STA T24 + 0 
24b5 : a5 4d __ LDA T6 + 0 
24b7 : 85 5e __ STA T23 + 0 
24b9 : d0 06 __ BNE $24c1 ; (bmu_bitblit.s9 + 0)
.s8:
24bb : a5 56 __ LDA T14 + 0 
24bd : 25 55 __ AND T13 + 0 
24bf : 85 45 __ STA T1 + 0 
.s9:
24c1 : a9 a0 __ LDA #$a0
24c3 : 8d 00 86 STA $8600 ; (BLIT_CODE[0] + 0)
24c6 : a5 5c __ LDA T21 + 0 
24c8 : 8d 01 86 STA $8601 ; (BLIT_CODE[0] + 1)
24cb : a9 02 __ LDA #$02
24cd : 85 43 __ STA T0 + 0 
24cf : a6 45 __ LDX T1 + 0 
24d1 : e8 __ __ INX
24d2 : d0 03 __ BNE $24d7 ; (bmu_bitblit.s10 + 0)
24d4 : 4c 72 28 JMP $2872 ; (bmu_bitblit.s66 + 0)
.s10:
24d7 : a5 52 __ LDA T12 + 0 
24d9 : f0 18 __ BEQ $24f3 ; (bmu_bitblit.s11 + 0)
.s65:
24db : a9 b1 __ LDA #$b1
24dd : 8d 02 86 STA $8602 ; (BLIT_CODE[0] + 2)
24e0 : a9 05 __ LDA #$05
24e2 : 8d 03 86 STA $8603 ; (BLIT_CODE[0] + 3)
24e5 : a9 85 __ LDA #$85
24e7 : 8d 04 86 STA $8604 ; (BLIT_CODE[0] + 4)
24ea : a9 0a __ LDA #$0a
24ec : 8d 05 86 STA $8605 ; (BLIT_CODE[0] + 5)
24ef : a9 06 __ LDA #$06
24f1 : 85 43 __ STA T0 + 0 
.s11:
24f3 : a5 4c __ LDA T5 + 0 
24f5 : d0 05 __ BNE $24fc ; (bmu_bitblit.s62 + 0)
.s12:
24f7 : a5 43 __ LDA T0 + 0 
24f9 : 4c 57 25 JMP $2557 ; (bmu_bitblit.s92 + 0)
.s62:
24fc : a5 5f __ LDA T24 + 0 
24fe : d0 05 __ BNE $2505 ; (bmu_bitblit.s64 + 0)
.s63:
2500 : a5 43 __ LDA T0 + 0 
2502 : 4c 52 25 JMP $2552 ; (bmu_bitblit.s91 + 0)
.s64:
2505 : a9 b1 __ LDA #$b1
2507 : a6 43 __ LDX T0 + 0 
2509 : 9d 00 86 STA $8600,x ; (BLIT_CODE[0] + 0)
250c : a9 03 __ LDA #$03
250e : 9d 01 86 STA $8601,x ; (BLIT_CODE[0] + 1)
2511 : 9d 06 86 STA $8606,x ; (BLIT_CODE[0] + 6)
2514 : 9d 0a 86 STA $860a,x ; (BLIT_CODE[0] + 10)
2517 : a9 85 __ LDA #$85
2519 : 9d 02 86 STA $8602,x ; (BLIT_CODE[0] + 2)
251c : 9d 09 86 STA $8609,x ; (BLIT_CODE[0] + 9)
251f : a9 08 __ LDA #$08
2521 : 9d 03 86 STA $8603,x ; (BLIT_CODE[0] + 3)
2524 : 9d 08 86 STA $8608,x ; (BLIT_CODE[0] + 8)
2527 : a9 a5 __ LDA #$a5
2529 : 9d 05 86 STA $8605,x ; (BLIT_CODE[0] + 5)
252c : a9 02 __ LDA #$02
252e : 9d 0c 86 STA $860c,x ; (BLIT_CODE[0] + 12)
2531 : a9 04 __ LDA #$04
2533 : 9d 0e 86 STA $860e,x ; (BLIT_CODE[0] + 14)
2536 : a5 58 __ LDA T17 + 0 
2538 : 9d 04 86 STA $8604,x ; (BLIT_CODE[0] + 4)
253b : a5 59 __ LDA T18 + 0 
253d : 09 08 __ ORA #$08
253f : 9d 07 86 STA $8607,x ; (BLIT_CODE[0] + 7)
2542 : a5 5a __ LDA T19 + 0 
2544 : 9d 0b 86 STA $860b,x ; (BLIT_CODE[0] + 11)
2547 : a5 5b __ LDA T20 + 0 
2549 : 09 04 __ ORA #$04
254b : 9d 0d 86 STA $860d,x ; (BLIT_CODE[0] + 13)
254e : 8a __ __ TXA
254f : 18 __ __ CLC
2550 : 69 0f __ ADC #$0f
.s91:
2552 : 85 0d __ STA P0 
2554 : 20 bc 29 JSR $29bc ; (builddop_src@proxy + 0)
.s92:
2557 : 85 0d __ STA P0 
2559 : a5 18 __ LDA P11 ; (op + 0)
255b : 85 0e __ STA P1 
255d : a5 45 __ LDA T1 + 0 
255f : 49 ff __ EOR #$ff
2561 : 85 0f __ STA P2 
2563 : 20 ff 2a JSR $2aff ; (builddop_op.s4 + 0)
2566 : 85 43 __ STA T0 + 0 
2568 : a5 4d __ LDA T6 + 0 
256a : f0 63 __ BEQ $25cf ; (bmu_bitblit.s13 + 0)
.s34:
256c : a9 a0 __ LDA #$a0
256e : a6 43 __ LDX T0 + 0 
2570 : e8 __ __ INX
2571 : e8 __ __ INX
2572 : 86 43 __ STX T0 + 0 
2574 : 86 0d __ STX P0 
2576 : 9d fe 85 STA $85fe,x ; (HeapNode.end + 0)
2579 : 18 __ __ CLC
257a : a5 5d __ LDA T22 + 0 
257c : 65 5c __ ADC T21 + 0 
257e : 9d ff 85 STA $85ff,x ; (HeapNode.end + 1)
2581 : 85 5c __ STA T21 + 0 
2583 : a5 4d __ LDA T6 + 0 
.s35:
2585 : c9 02 __ CMP #$02
2587 : 90 03 __ BCC $258c ; (bmu_bitblit.s36 + 0)
2589 : 4c 55 27 JMP $2755 ; (bmu_bitblit.s42 + 0)
.s36:
258c : a5 56 __ LDA T14 + 0 
258e : f0 3f __ BEQ $25cf ; (bmu_bitblit.s13 + 0)
.s37:
2590 : a5 52 __ LDA T12 + 0 
2592 : f0 1e __ BEQ $25b2 ; (bmu_bitblit.s38 + 0)
.s41:
2594 : a9 b1 __ LDA #$b1
2596 : a6 43 __ LDX T0 + 0 
2598 : 9d 00 86 STA $8600,x ; (BLIT_CODE[0] + 0)
259b : a9 05 __ LDA #$05
259d : 9d 01 86 STA $8601,x ; (BLIT_CODE[0] + 1)
25a0 : a9 85 __ LDA #$85
25a2 : 9d 02 86 STA $8602,x ; (BLIT_CODE[0] + 2)
25a5 : a9 0a __ LDA #$0a
25a7 : 9d 03 86 STA $8603,x ; (BLIT_CODE[0] + 3)
25aa : 8a __ __ TXA
25ab : 18 __ __ CLC
25ac : 69 04 __ ADC #$04
25ae : 85 43 __ STA T0 + 0 
25b0 : 85 0d __ STA P0 
.s38:
25b2 : a5 4c __ LDA T5 + 0 
25b4 : d0 05 __ BNE $25bb ; (bmu_bitblit.s40 + 0)
.s39:
25b6 : a5 43 __ LDA T0 + 0 
25b8 : 4c be 25 JMP $25be ; (bmu_bitblit.s90 + 0)
.s40:
25bb : 20 bc 29 JSR $29bc ; (builddop_src@proxy + 0)
.s90:
25be : 85 0d __ STA P0 
25c0 : a5 18 __ LDA P11 ; (op + 0)
25c2 : 85 0e __ STA P1 
25c4 : a5 56 __ LDA T14 + 0 
25c6 : 49 ff __ EOR #$ff
25c8 : 85 0f __ STA P2 
25ca : 20 ff 2a JSR $2aff ; (builddop_op.s4 + 0)
25cd : 85 43 __ STA T0 + 0 
.s13:
25cf : a9 60 __ LDA #$60
25d1 : a6 43 __ LDX T0 + 0 
25d3 : 9d 00 86 STA $8600,x ; (BLIT_CODE[0] + 0)
25d6 : 18 __ __ CLC
25d7 : a5 51 __ LDA T10 + 0 
25d9 : 69 ff __ ADC #$ff
25db : 2a __ __ ROL
25dc : 2a __ __ ROL
25dd : 2a __ __ ROL
25de : aa __ __ TAX
25df : 29 f8 __ AND #$f8
25e1 : 85 43 __ STA T0 + 0 
25e3 : 8a __ __ TXA
25e4 : 29 07 __ AND #$07
25e6 : 2a __ __ ROL
25e7 : 69 f8 __ ADC #$f8
25e9 : 85 44 __ STA T0 + 1 
25eb : a5 4c __ LDA T5 + 0 
25ed : d0 78 __ BNE $2667 ; (bmu_bitblit.s22 + 0)
.s14:
25ef : a5 18 __ LDA P11 ; (op + 0)
25f1 : 29 20 __ AND #$20
25f3 : d0 3d __ BNE $2632 ; (bmu_bitblit.l19 + 0)
.s15:
25f5 : 85 47 __ STA T2 + 0 
.l16:
25f7 : a5 53 __ LDA T11 + 0 
25f9 : 85 05 __ STA WORK + 2 
25fb : 85 03 __ STA WORK + 0 
25fd : a5 54 __ LDA T11 + 1 
25ff : 85 06 __ STA WORK + 3 
2601 : 85 04 __ STA WORK + 1 
2603 : a5 47 __ LDA T2 + 0 
2605 : 85 07 __ STA WORK + 4 
2607 : 20 00 86 JSR $8600 ; (BLIT_CODE[0] + 0)
260a : e6 53 __ INC T11 + 0 
260c : d0 02 __ BNE $2610 ; (bmu_bitblit.s104 + 0)
.s103:
260e : e6 54 __ INC T11 + 1 
.s104:
2610 : a5 53 __ LDA T11 + 0 
2612 : 29 07 __ AND #$07
2614 : d0 0d __ BNE $2623 ; (bmu_bitblit.s17 + 0)
.s18:
2616 : 18 __ __ CLC
2617 : a5 53 __ LDA T11 + 0 
2619 : 65 43 __ ADC T0 + 0 
261b : 85 53 __ STA T11 + 0 
261d : a5 54 __ LDA T11 + 1 
261f : 65 44 __ ADC T0 + 1 
2621 : 85 54 __ STA T11 + 1 
.s17:
2623 : c6 4e __ DEC T8 + 0 
2625 : d0 d0 __ BNE $25f7 ; (bmu_bitblit.l16 + 0)
.s3:
2627 : a2 0c __ LDX #$0c
2629 : bd d3 bf LDA $bfd3,x ; (bmu_bitblit@stack + 0)
262c : 95 53 __ STA T11 + 0,x 
262e : ca __ __ DEX
262f : 10 f8 __ BPL $2629 ; (bmu_bitblit.s3 + 2)
2631 : 60 __ __ RTS
.l19:
2632 : a5 53 __ LDA T11 + 0 
2634 : 85 05 __ STA WORK + 2 
2636 : 85 03 __ STA WORK + 0 
2638 : 29 07 __ AND #$07
263a : aa __ __ TAX
263b : a5 54 __ LDA T11 + 1 
263d : 85 06 __ STA WORK + 3 
263f : 85 04 __ STA WORK + 1 
2641 : b5 00 __ LDA $00,x 
2643 : 85 07 __ STA WORK + 4 
2645 : 20 00 86 JSR $8600 ; (BLIT_CODE[0] + 0)
2648 : e6 53 __ INC T11 + 0 
264a : d0 02 __ BNE $264e ; (bmu_bitblit.s102 + 0)
.s101:
264c : e6 54 __ INC T11 + 1 
.s102:
264e : a5 53 __ LDA T11 + 0 
2650 : 29 07 __ AND #$07
2652 : d0 0d __ BNE $2661 ; (bmu_bitblit.s20 + 0)
.s21:
2654 : 18 __ __ CLC
2655 : a5 53 __ LDA T11 + 0 
2657 : 65 43 __ ADC T0 + 0 
2659 : 85 53 __ STA T11 + 0 
265b : a5 54 __ LDA T11 + 1 
265d : 65 44 __ ADC T0 + 1 
265f : 85 54 __ STA T11 + 1 
.s20:
2661 : c6 4e __ DEC T8 + 0 
2663 : d0 cd __ BNE $2632 ; (bmu_bitblit.l19 + 0)
2665 : f0 c0 __ BEQ $2627 ; (bmu_bitblit.s3 + 0)
.s22:
2667 : a5 4a __ LDA T4 + 0 
2669 : 85 45 __ STA T1 + 0 
266b : a5 4b __ LDA T4 + 1 
266d : 85 46 __ STA T1 + 1 
266f : a0 04 __ LDY #$04
2671 : b1 4f __ LDA (T9 + 0),y 
2673 : 18 __ __ CLC
2674 : 69 ff __ ADC #$ff
2676 : 2a __ __ ROL
2677 : 2a __ __ ROL
2678 : 2a __ __ ROL
2679 : aa __ __ TAX
267a : 29 f8 __ AND #$f8
267c : 85 47 __ STA T2 + 0 
267e : 8a __ __ TXA
267f : 29 07 __ AND #$07
2681 : 2a __ __ ROL
2682 : 69 f8 __ ADC #$f8
2684 : 85 48 __ STA T2 + 1 
2686 : a5 57 __ LDA T16 + 0 
2688 : f0 1d __ BEQ $26a7 ; (bmu_bitblit.l23 + 0)
.s28:
268a : 38 __ __ SEC
268b : a9 00 __ LDA #$00
268d : e5 43 __ SBC T0 + 0 
268f : 85 43 __ STA T0 + 0 
2691 : a9 00 __ LDA #$00
2693 : e5 44 __ SBC T0 + 1 
2695 : 85 44 __ STA T0 + 1 
2697 : 38 __ __ SEC
2698 : a9 00 __ LDA #$00
269a : e5 47 __ SBC T2 + 0 
269c : 85 47 __ STA T2 + 0 
269e : a9 00 __ LDA #$00
26a0 : e5 48 __ SBC T2 + 1 
26a2 : 85 48 __ STA T2 + 1 
26a4 : 4c fa 26 JMP $26fa ; (bmu_bitblit.l29 + 0)
.l23:
26a7 : a5 4a __ LDA T4 + 0 
26a9 : 85 03 __ STA WORK + 0 
26ab : a5 4b __ LDA T4 + 1 
26ad : 85 04 __ STA WORK + 1 
26af : a5 54 __ LDA T11 + 1 
26b1 : 85 06 __ STA WORK + 3 
26b3 : a5 53 __ LDA T11 + 0 
26b5 : 85 05 __ STA WORK + 2 
26b7 : 29 07 __ AND #$07
26b9 : a8 __ __ TAY
26ba : b1 45 __ LDA (T1 + 0),y 
26bc : 85 07 __ STA WORK + 4 
26be : 20 00 86 JSR $8600 ; (BLIT_CODE[0] + 0)
26c1 : e6 4a __ INC T4 + 0 
26c3 : d0 02 __ BNE $26c7 ; (bmu_bitblit.s98 + 0)
.s97:
26c5 : e6 4b __ INC T4 + 1 
.s98:
26c7 : a5 4a __ LDA T4 + 0 
26c9 : 29 07 __ AND #$07
26cb : d0 0d __ BNE $26da ; (bmu_bitblit.s24 + 0)
.s27:
26cd : 18 __ __ CLC
26ce : a5 4a __ LDA T4 + 0 
26d0 : 65 47 __ ADC T2 + 0 
26d2 : 85 4a __ STA T4 + 0 
26d4 : a5 4b __ LDA T4 + 1 
26d6 : 65 48 __ ADC T2 + 1 
26d8 : 85 4b __ STA T4 + 1 
.s24:
26da : e6 53 __ INC T11 + 0 
26dc : d0 02 __ BNE $26e0 ; (bmu_bitblit.s100 + 0)
.s99:
26de : e6 54 __ INC T11 + 1 
.s100:
26e0 : a5 53 __ LDA T11 + 0 
26e2 : 29 07 __ AND #$07
26e4 : d0 0d __ BNE $26f3 ; (bmu_bitblit.s25 + 0)
.s26:
26e6 : 18 __ __ CLC
26e7 : a5 53 __ LDA T11 + 0 
26e9 : 65 43 __ ADC T0 + 0 
26eb : 85 53 __ STA T11 + 0 
26ed : a5 54 __ LDA T11 + 1 
26ef : 65 44 __ ADC T0 + 1 
26f1 : 85 54 __ STA T11 + 1 
.s25:
26f3 : c6 4e __ DEC T8 + 0 
26f5 : d0 b0 __ BNE $26a7 ; (bmu_bitblit.l23 + 0)
26f7 : 4c 27 26 JMP $2627 ; (bmu_bitblit.s3 + 0)
.l29:
26fa : a5 4a __ LDA T4 + 0 
26fc : 29 07 __ AND #$07
26fe : d0 0d __ BNE $270d ; (bmu_bitblit.s30 + 0)
.s33:
2700 : 18 __ __ CLC
2701 : a5 4a __ LDA T4 + 0 
2703 : 65 47 __ ADC T2 + 0 
2705 : 85 4a __ STA T4 + 0 
2707 : a5 4b __ LDA T4 + 1 
2709 : 65 48 __ ADC T2 + 1 
270b : 85 4b __ STA T4 + 1 
.s30:
270d : a5 53 __ LDA T11 + 0 
270f : 29 07 __ AND #$07
2711 : d0 0d __ BNE $2720 ; (bmu_bitblit.s31 + 0)
.s32:
2713 : 18 __ __ CLC
2714 : a5 53 __ LDA T11 + 0 
2716 : 65 43 __ ADC T0 + 0 
2718 : 85 53 __ STA T11 + 0 
271a : a5 54 __ LDA T11 + 1 
271c : 65 44 __ ADC T0 + 1 
271e : 85 54 __ STA T11 + 1 
.s31:
2720 : 18 __ __ CLC
2721 : a5 53 __ LDA T11 + 0 
2723 : 69 ff __ ADC #$ff
2725 : 85 05 __ STA WORK + 2 
2727 : 85 53 __ STA T11 + 0 
2729 : a5 54 __ LDA T11 + 1 
272b : 69 ff __ ADC #$ff
272d : 85 54 __ STA T11 + 1 
272f : 85 06 __ STA WORK + 3 
2731 : 18 __ __ CLC
2732 : a5 4a __ LDA T4 + 0 
2734 : 69 ff __ ADC #$ff
2736 : 85 4a __ STA T4 + 0 
2738 : 85 03 __ STA WORK + 0 
273a : a5 4b __ LDA T4 + 1 
273c : 69 ff __ ADC #$ff
273e : 85 4b __ STA T4 + 1 
2740 : 85 04 __ STA WORK + 1 
2742 : a5 05 __ LDA WORK + 2 
2744 : 29 07 __ AND #$07
2746 : a8 __ __ TAY
2747 : b1 45 __ LDA (T1 + 0),y 
2749 : 85 07 __ STA WORK + 4 
274b : 20 00 86 JSR $8600 ; (BLIT_CODE[0] + 0)
274e : c6 4e __ DEC T8 + 0 
2750 : d0 a8 __ BNE $26fa ; (bmu_bitblit.l29 + 0)
2752 : 4c 27 26 JMP $2627 ; (bmu_bitblit.s3 + 0)
.s42:
2755 : a9 02 __ LDA #$02
2757 : c5 5e __ CMP T23 + 0 
2759 : a9 00 __ LDA #$00
275b : 6a __ __ ROR
275c : 85 49 __ STA T3 + 0 
275e : d0 19 __ BNE $2779 ; (bmu_bitblit.s43 + 0)
.s61:
2760 : a9 a2 __ LDA #$a2
2762 : a6 43 __ LDX T0 + 0 
2764 : e8 __ __ INX
2765 : e8 __ __ INX
2766 : 86 43 __ STX T0 + 0 
2768 : 9d fe 85 STA $85fe,x ; (HeapNode.end + 0)
276b : 38 __ __ SEC
276c : a5 5e __ LDA T23 + 0 
276e : e9 01 __ SBC #$01
2770 : 9d ff 85 STA $85ff,x ; (HeapNode.end + 1)
2773 : a5 5e __ LDA T23 + 0 
2775 : c9 20 __ CMP #$20
2777 : b0 0d __ BCS $2786 ; (bmu_bitblit.s45 + 0)
.s43:
2779 : a5 5f __ LDA T24 + 0 
277b : d0 09 __ BNE $2786 ; (bmu_bitblit.s45 + 0)
.s44:
277d : a5 58 __ LDA T17 + 0 
277f : a6 43 __ LDX T0 + 0 
2781 : 9d 00 86 STA $8600,x ; (BLIT_CODE[0] + 0)
2784 : e6 43 __ INC T0 + 0 
.s45:
2786 : a5 43 __ LDA T0 + 0 
2788 : 85 55 __ STA T13 + 0 
278a : a5 52 __ LDA T12 + 0 
278c : f0 1c __ BEQ $27aa ; (bmu_bitblit.s46 + 0)
.s60:
278e : a9 b1 __ LDA #$b1
2790 : a6 43 __ LDX T0 + 0 
2792 : 9d 00 86 STA $8600,x ; (BLIT_CODE[0] + 0)
2795 : a9 05 __ LDA #$05
2797 : 9d 01 86 STA $8601,x ; (BLIT_CODE[0] + 1)
279a : a9 85 __ LDA #$85
279c : 9d 02 86 STA $8602,x ; (BLIT_CODE[0] + 2)
279f : a9 0a __ LDA #$0a
27a1 : 9d 03 86 STA $8603,x ; (BLIT_CODE[0] + 3)
27a4 : 8a __ __ TXA
27a5 : 18 __ __ CLC
27a6 : 69 04 __ ADC #$04
27a8 : 85 43 __ STA T0 + 0 
.s46:
27aa : a5 4c __ LDA T5 + 0 
27ac : d0 05 __ BNE $27b3 ; (bmu_bitblit.s59 + 0)
.s47:
27ae : a5 43 __ LDA T0 + 0 
27b0 : 4c ba 27 JMP $27ba ; (bmu_bitblit.s89 + 0)
.s59:
27b3 : a5 43 __ LDA T0 + 0 
27b5 : 85 0d __ STA P0 
27b7 : 20 bc 29 JSR $29bc ; (builddop_src@proxy + 0)
.s89:
27ba : 85 0d __ STA P0 
27bc : a5 18 __ LDA P11 ; (op + 0)
27be : 85 0e __ STA P1 
27c0 : a9 00 __ LDA #$00
27c2 : 85 0f __ STA P2 
27c4 : 20 ff 2a JSR $2aff ; (builddop_op.s4 + 0)
27c7 : 24 49 __ BIT T3 + 0 
27c9 : 10 1b __ BPL $27e6 ; (bmu_bitblit.s50 + 0)
.s48:
27cb : 85 43 __ STA T0 + 0 
27cd : aa __ __ TAX
27ce : a9 a0 __ LDA #$a0
27d0 : 9d 00 86 STA $8600,x ; (BLIT_CODE[0] + 0)
27d3 : 18 __ __ CLC
27d4 : a5 5d __ LDA T22 + 0 
27d6 : 65 5c __ ADC T21 + 0 
27d8 : 9d 01 86 STA $8601,x ; (BLIT_CODE[0] + 1)
.s49:
27db : a6 43 __ LDX T0 + 0 
27dd : e8 __ __ INX
27de : e8 __ __ INX
27df : 86 43 __ STX T0 + 0 
27e1 : 86 0d __ STX P0 
27e3 : 4c 8c 25 JMP $258c ; (bmu_bitblit.s36 + 0)
.s50:
27e6 : aa __ __ TAX
27e7 : a9 1f __ LDA #$1f
27e9 : c5 5e __ CMP T23 + 0 
27eb : a9 00 __ LDA #$00
27ed : 6a __ __ ROR
27ee : 85 4d __ STA T6 + 0 
27f0 : f0 04 __ BEQ $27f6 ; (bmu_bitblit.s58 + 0)
.s51:
27f2 : a5 5f __ LDA T24 + 0 
27f4 : f0 06 __ BEQ $27fc ; (bmu_bitblit.s52 + 0)
.s58:
27f6 : a5 58 __ LDA T17 + 0 
27f8 : 9d 00 86 STA $8600,x ; (BLIT_CODE[0] + 0)
27fb : e8 __ __ INX
.s52:
27fc : a9 98 __ LDA #$98
27fe : 9d 00 86 STA $8600,x ; (BLIT_CODE[0] + 0)
2801 : a9 08 __ LDA #$08
2803 : 9d 02 86 STA $8602,x ; (BLIT_CODE[0] + 2)
2806 : a9 a8 __ LDA #$a8
2808 : 9d 03 86 STA $8603,x ; (BLIT_CODE[0] + 3)
280b : a5 59 __ LDA T18 + 0 
280d : 09 08 __ ORA #$08
280f : 9d 01 86 STA $8601,x ; (BLIT_CODE[0] + 1)
2812 : 8a __ __ TXA
2813 : 18 __ __ CLC
2814 : 69 04 __ ADC #$04
2816 : 85 43 __ STA T0 + 0 
2818 : 24 4d __ BIT T6 + 0 
281a : 30 3a __ BMI $2856 ; (bmu_bitblit.s53 + 0)
.s54:
281c : a5 5a __ LDA T19 + 0 
281e : 9d 04 86 STA $8604,x ; (BLIT_CODE[0] + 4)
2821 : a5 5b __ LDA T20 + 0 
2823 : 09 04 __ ORA #$04
2825 : a8 __ __ TAY
2826 : a5 4c __ LDA T5 + 0 
2828 : d0 0d __ BNE $2837 ; (bmu_bitblit.s57 + 0)
.s55:
282a : a9 02 __ LDA #$02
282c : 9d 05 86 STA $8605,x ; (BLIT_CODE[0] + 5)
282f : 18 __ __ CLC
2830 : a5 43 __ LDA T0 + 0 
2832 : 69 02 __ ADC #$02
2834 : 4c 48 28 JMP $2848 ; (bmu_bitblit.s56 + 0)
.s57:
2837 : a9 04 __ LDA #$04
2839 : 9d 05 86 STA $8605,x ; (BLIT_CODE[0] + 5)
283c : 9d 07 86 STA $8607,x ; (BLIT_CODE[0] + 7)
283f : 98 __ __ TYA
2840 : 9d 06 86 STA $8606,x ; (BLIT_CODE[0] + 6)
2843 : 18 __ __ CLC
2844 : a5 43 __ LDA T0 + 0 
2846 : 69 04 __ ADC #$04
.s56:
2848 : aa __ __ TAX
2849 : e8 __ __ INX
284a : e8 __ __ INX
284b : 86 43 __ STX T0 + 0 
284d : 98 __ __ TYA
284e : 9d fe 85 STA $85fe,x ; (HeapNode.end + 0)
2851 : a9 06 __ LDA #$06
2853 : 9d ff 85 STA $85ff,x ; (HeapNode.end + 1)
.s53:
2856 : a9 ca __ LDA #$ca
2858 : a6 43 __ LDX T0 + 0 
285a : 9d 00 86 STA $8600,x ; (BLIT_CODE[0] + 0)
285d : a9 d0 __ LDA #$d0
285f : 9d 01 86 STA $8601,x ; (BLIT_CODE[0] + 1)
2862 : e6 43 __ INC T0 + 0 
2864 : a5 55 __ LDA T13 + 0 
2866 : 38 __ __ SEC
2867 : e5 43 __ SBC T0 + 0 
2869 : 38 __ __ SEC
286a : e9 02 __ SBC #$02
286c : 9d 02 86 STA $8602,x ; (BLIT_CODE[0] + 2)
286f : 4c db 27 JMP $27db ; (bmu_bitblit.s49 + 0)
.s66:
2872 : 85 0d __ STA P0 
2874 : a5 4c __ LDA T5 + 0 
2876 : f0 51 __ BEQ $28c9 ; (bmu_bitblit.s67 + 0)
.s68:
2878 : a5 5f __ LDA T24 + 0 
287a : f0 4d __ BEQ $28c9 ; (bmu_bitblit.s67 + 0)
.s69:
287c : a9 03 __ LDA #$03
287e : 8d 03 86 STA $8603 ; (BLIT_CODE[0] + 3)
2881 : 8d 08 86 STA $8608 ; (BLIT_CODE[0] + 8)
2884 : 8d 0c 86 STA $860c ; (BLIT_CODE[0] + 12)
2887 : a9 b1 __ LDA #$b1
2889 : 8d 02 86 STA $8602 ; (BLIT_CODE[0] + 2)
288c : a9 85 __ LDA #$85
288e : 8d 04 86 STA $8604 ; (BLIT_CODE[0] + 4)
2891 : 8d 0b 86 STA $860b ; (BLIT_CODE[0] + 11)
2894 : a9 08 __ LDA #$08
2896 : 8d 05 86 STA $8605 ; (BLIT_CODE[0] + 5)
2899 : 8d 0a 86 STA $860a ; (BLIT_CODE[0] + 10)
289c : a9 a5 __ LDA #$a5
289e : 8d 07 86 STA $8607 ; (BLIT_CODE[0] + 7)
28a1 : a9 02 __ LDA #$02
28a3 : 8d 0e 86 STA $860e ; (BLIT_CODE[0] + 14)
28a6 : a9 04 __ LDA #$04
28a8 : 8d 10 86 STA $8610 ; (BLIT_CODE[0] + 16)
28ab : a5 58 __ LDA T17 + 0 
28ad : 8d 06 86 STA $8606 ; (BLIT_CODE[0] + 6)
28b0 : a5 59 __ LDA T18 + 0 
28b2 : 09 08 __ ORA #$08
28b4 : 8d 09 86 STA $8609 ; (BLIT_CODE[0] + 9)
28b7 : a5 5a __ LDA T19 + 0 
28b9 : 8d 0d 86 STA $860d ; (BLIT_CODE[0] + 13)
28bc : a5 5b __ LDA T20 + 0 
28be : 09 04 __ ORA #$04
28c0 : 8d 0f 86 STA $860f ; (BLIT_CODE[0] + 15)
28c3 : a9 11 __ LDA #$11
28c5 : 85 43 __ STA T0 + 0 
28c7 : 85 0d __ STA P0 
.s67:
28c9 : 18 __ __ CLC
28ca : a5 4d __ LDA T6 + 0 
28cc : 69 01 __ ADC #$01
28ce : 85 5e __ STA T23 + 0 
28d0 : d0 03 __ BNE $28d5 ; (bmu_bitblit.s67 + 12)
28d2 : 4c cf 25 JMP $25cf ; (bmu_bitblit.s13 + 0)
28d5 : 4c 85 25 JMP $2585 ; (bmu_bitblit.s35 + 0)
.s76:
28d8 : 18 __ __ CLC
28d9 : a5 12 __ LDA P5 ; (dy + 0)
28db : 65 4e __ ADC T8 + 0 
28dd : 85 47 __ STA T2 + 0 
28df : 29 f8 __ AND #$f8
28e1 : 85 1b __ STA ACCU + 0 ; (w + 0)
28e3 : a5 13 __ LDA P6 ; (dy + 1)
28e5 : 69 00 __ ADC #$00
28e7 : 85 1c __ STA ACCU + 1 ; (w + 1)
28e9 : ad f8 79 LDA $79f8 ; (Screen.cwidth + 0)
28ec : 85 51 __ STA T10 + 0 
28ee : 20 e1 6d JSR $6de1 ; (mul16by8 + 0)
28f1 : ad f4 79 LDA $79f4 ; (Screen.data + 0)
28f4 : 18 __ __ CLC
28f5 : 65 1b __ ADC ACCU + 0 ; (w + 0)
28f7 : 85 4c __ STA T5 + 0 
28f9 : ad f5 79 LDA $79f5 ; (Screen.data + 1)
28fc : 65 1c __ ADC ACCU + 1 ; (w + 1)
28fe : aa __ __ TAX
28ff : a5 10 __ LDA P3 ; (dx + 0)
2901 : 29 f8 __ AND #$f8
2903 : 18 __ __ CLC
2904 : 65 4c __ ADC T5 + 0 
2906 : 85 4c __ STA T5 + 0 
2908 : 8a __ __ TXA
2909 : 65 11 __ ADC P4 ; (dx + 1)
290b : aa __ __ TAX
290c : a5 47 __ LDA T2 + 0 
290e : 29 07 __ AND #$07
2910 : 18 __ __ CLC
2911 : 65 4c __ ADC T5 + 0 
2913 : 85 4c __ STA T5 + 0 
2915 : 90 02 __ BCC $2919 ; (bmu_bitblit.s107 + 0)
.s106:
2917 : e8 __ __ INX
2918 : 18 __ __ CLC
.s107:
2919 : a5 4d __ LDA T6 + 0 
291b : 69 e1 __ ADC #$e1
291d : 2a __ __ ROL
291e : 2a __ __ ROL
291f : 2a __ __ ROL
2920 : a8 __ __ TAY
2921 : 29 f8 __ AND #$f8
2923 : 85 43 __ STA T0 + 0 
2925 : 98 __ __ TYA
2926 : 29 07 __ AND #$07
2928 : 2a __ __ ROL
2929 : 69 f8 __ ADC #$f8
292b : 85 44 __ STA T0 + 1 
292d : 18 __ __ CLC
292e : a5 4c __ LDA T5 + 0 
2930 : 65 43 __ ADC T0 + 0 
2932 : 85 53 __ STA T11 + 0 
2934 : 8a __ __ TXA
2935 : 65 44 __ ADC T0 + 1 
2937 : 85 54 __ STA T11 + 1 
2939 : a5 56 __ LDA T14 + 0 
293b : 85 55 __ STA T13 + 0 
293d : a5 52 __ LDA T12 + 0 
293f : 85 56 __ STA T14 + 0 
2941 : ad ea bf LDA $bfea ; (sstack + 0)
2944 : 18 __ __ CLC
2945 : 65 4e __ ADC T8 + 0 
2947 : 85 47 __ STA T2 + 0 
2949 : 29 f8 __ AND #$f8
294b : 85 1b __ STA ACCU + 0 ; (w + 0)
294d : ad eb bf LDA $bfeb ; (sstack + 1)
2950 : 69 00 __ ADC #$00
2952 : 85 1c __ STA ACCU + 1 ; (w + 1)
2954 : ad f8 79 LDA $79f8 ; (Screen.cwidth + 0)
2957 : 20 e1 6d JSR $6de1 ; (mul16by8 + 0)
295a : ad f4 79 LDA $79f4 ; (Screen.data + 0)
295d : 18 __ __ CLC
295e : 65 1b __ ADC ACCU + 0 ; (w + 0)
2960 : 85 4a __ STA T4 + 0 
2962 : ad f5 79 LDA $79f5 ; (Screen.data + 1)
2965 : 65 1c __ ADC ACCU + 1 ; (w + 1)
2967 : aa __ __ TAX
2968 : a5 16 __ LDA P9 ; (sx + 0)
296a : 29 f8 __ AND #$f8
296c : 18 __ __ CLC
296d : 65 4a __ ADC T4 + 0 
296f : 85 4a __ STA T4 + 0 
2971 : 8a __ __ TXA
2972 : 65 17 __ ADC P10 ; (sx + 1)
2974 : aa __ __ TAX
2975 : a5 47 __ LDA T2 + 0 
2977 : 29 07 __ AND #$07
2979 : 18 __ __ CLC
297a : 65 4a __ ADC T4 + 0 
297c : 90 02 __ BCC $2980 ; (bmu_bitblit.s109 + 0)
.s108:
297e : e8 __ __ INX
297f : 18 __ __ CLC
.s109:
2980 : 65 43 __ ADC T0 + 0 
2982 : 85 4a __ STA T4 + 0 
2984 : 8a __ __ TXA
2985 : 65 44 __ ADC T0 + 1 
2987 : 85 4b __ STA T4 + 1 
2989 : a9 01 __ LDA #$01
298b : 85 57 __ STA T16 + 0 
298d : a5 16 __ LDA P9 ; (sx + 0)
298f : 29 07 __ AND #$07
2991 : 49 ff __ EOR #$ff
2993 : 38 __ __ SEC
2994 : 65 45 __ ADC T1 + 0 
2996 : 85 43 __ STA T0 + 0 
2998 : 10 0b __ BPL $29a5 ; (bmu_bitblit.s77 + 0)
.s78:
299a : 18 __ __ CLC
299b : a5 4a __ LDA T4 + 0 
299d : 69 08 __ ADC #$08
299f : 85 4a __ STA T4 + 0 
29a1 : 90 02 __ BCC $29a5 ; (bmu_bitblit.s77 + 0)
.s110:
29a3 : e6 4b __ INC T4 + 1 
.s77:
29a5 : a9 38 __ LDA #$38
29a7 : 85 58 __ STA T17 + 0 
29a9 : a9 e1 __ LDA #$e1
29ab : 85 59 __ STA T18 + 0 
29ad : a9 b0 __ LDA #$b0
29af : 85 5a __ STA T19 + 0 
29b1 : a9 c2 __ LDA #$c2
29b3 : 85 5b __ STA T20 + 0 
29b5 : a9 f8 __ LDA #$f8
29b7 : 85 5c __ STA T21 + 0 
29b9 : 4c 9d 24 JMP $249d ; (bmu_bitblit.s7 + 0)
--------------------------------------------------------------------
builddop_src@proxy: ; builddop_src@proxy
29bc : a5 5f __ LDA $5f 
29be : 85 0e __ STA P1 
29c0 : a5 57 __ LDA $57 
29c2 : 85 0f __ STA P2 
--------------------------------------------------------------------
builddop_src: ; builddop_src(u8,u8,bool)->u8
; 888, "/home/xahmol/oscar64/include/gfx/bitmap.c"
.s4:
29c4 : a6 0d __ LDX P0 ; (ip + 0)
29c6 : e8 __ __ INX
29c7 : a4 0d __ LDY P0 ; (ip + 0)
29c9 : e8 __ __ INX
29ca : a5 0e __ LDA P1 ; (shift + 0)
29cc : d0 0c __ BNE $29da ; (builddop_src.s6 + 0)
.s5:
29ce : a9 b1 __ LDA #$b1
29d0 : 99 00 86 STA $8600,y ; (BLIT_CODE[0] + 0)
29d3 : a9 03 __ LDA #$03
29d5 : 99 01 86 STA $8601,y ; (BLIT_CODE[0] + 1)
.s35:
29d8 : 8a __ __ TXA
.s3:
29d9 : 60 __ __ RTS
.s6:
29da : a9 a5 __ LDA #$a5
29dc : 99 00 86 STA $8600,y ; (BLIT_CODE[0] + 0)
29df : a9 08 __ LDA #$08
29e1 : 99 01 86 STA $8601,y ; (BLIT_CODE[0] + 1)
29e4 : a5 0f __ LDA P2 ; (reverse + 0)
29e6 : f0 03 __ BEQ $29eb ; (builddop_src.s7 + 0)
29e8 : 4c f1 2a JMP $2af1 ; (builddop_src.s26 + 0)
.s7:
29eb : a5 0e __ LDA P1 ; (shift + 0)
29ed : c9 05 __ CMP #$05
29ef : b0 06 __ BCS $29f7 ; (builddop_src.s8 + 0)
.s24:
29f1 : a9 4a __ LDA #$4a
.s25:
29f3 : 99 02 86 STA $8602,y ; (BLIT_CODE[0] + 2)
29f6 : e8 __ __ INX
.s8:
29f7 : a9 85 __ LDA #$85
29f9 : 9d 00 86 STA $8600,x ; (BLIT_CODE[0] + 0)
29fc : 9d 04 86 STA $8604,x ; (BLIT_CODE[0] + 4)
29ff : a9 09 __ LDA #$09
2a01 : 9d 01 86 STA $8601,x ; (BLIT_CODE[0] + 1)
2a04 : a9 b1 __ LDA #$b1
2a06 : 9d 02 86 STA $8602,x ; (BLIT_CODE[0] + 2)
2a09 : a9 03 __ LDA #$03
2a0b : 9d 03 86 STA $8603,x ; (BLIT_CODE[0] + 3)
2a0e : a9 08 __ LDA #$08
2a10 : 9d 05 86 STA $8605,x ; (BLIT_CODE[0] + 5)
2a13 : 8a __ __ TXA
2a14 : 18 __ __ CLC
2a15 : 69 06 __ ADC #$06
2a17 : 85 1b __ STA ACCU + 0 
2a19 : 85 0d __ STA P0 ; (ip + 0)
2a1b : a5 0f __ LDA P2 ; (reverse + 0)
2a1d : d0 6a __ BNE $2a89 ; (builddop_src.s17 + 0)
.s9:
2a1f : a5 0e __ LDA P1 ; (shift + 0)
2a21 : c9 05 __ CMP #$05
2a23 : 90 0b __ BCC $2a30 ; (builddop_src.s10 + 0)
.s13:
2a25 : a9 0a __ LDA #$0a
2a27 : 9d 06 86 STA $8606,x ; (BLIT_CODE[0] + 6)
2a2a : e6 1b __ INC ACCU + 0 
2a2c : a6 0e __ LDX P1 ; (shift + 0)
2a2e : b0 2e __ BCS $2a5e ; (builddop_src.l14 + 0)
.s10:
2a30 : c9 02 __ CMP #$02
2a32 : 90 1f __ BCC $2a53 ; (builddop_src.s11 + 0)
.s12:
2a34 : c6 0e __ DEC P1 ; (shift + 0)
2a36 : a6 0d __ LDX P0 ; (ip + 0)
2a38 : a4 0e __ LDY P1 ; (shift + 0)
.l31:
2a3a : a9 6a __ LDA #$6a
2a3c : 9d 00 86 STA $8600,x ; (BLIT_CODE[0] + 0)
2a3f : a9 46 __ LDA #$46
2a41 : 9d 01 86 STA $8601,x ; (BLIT_CODE[0] + 1)
2a44 : a9 09 __ LDA #$09
2a46 : 9d 02 86 STA $8602,x ; (BLIT_CODE[0] + 2)
2a49 : 8a __ __ TXA
2a4a : 18 __ __ CLC
2a4b : 69 03 __ ADC #$03
2a4d : aa __ __ TAX
2a4e : 88 __ __ DEY
2a4f : d0 e9 __ BNE $2a3a ; (builddop_src.l31 + 0)
.s32:
2a51 : 85 0d __ STA P0 ; (ip + 0)
.s11:
2a53 : a9 6a __ LDA #$6a
.s33:
2a55 : a6 0d __ LDX P0 ; (ip + 0)
2a57 : 9d 00 86 STA $8600,x ; (BLIT_CODE[0] + 0)
2a5a : e8 __ __ INX
2a5b : 4c d8 29 JMP $29d8 ; (builddop_src.s35 + 0)
.l14:
2a5e : a9 09 __ LDA #$09
2a60 : a4 1b __ LDY ACCU + 0 
2a62 : 99 01 86 STA $8601,y ; (BLIT_CODE[0] + 1)
2a65 : 98 __ __ TYA
2a66 : 18 __ __ CLC
2a67 : 69 03 __ ADC #$03
2a69 : 85 1b __ STA ACCU + 0 
2a6b : e0 07 __ CPX #$07
2a6d : b0 0d __ BCS $2a7c ; (builddop_src.s15 + 0)
.s16:
2a6f : a9 26 __ LDA #$26
2a71 : 99 00 86 STA $8600,y ; (BLIT_CODE[0] + 0)
2a74 : a9 0a __ LDA #$0a
2a76 : 99 02 86 STA $8602,y ; (BLIT_CODE[0] + 2)
2a79 : e8 __ __ INX
2a7a : 90 e2 __ BCC $2a5e ; (builddop_src.l14 + 0)
.s15:
2a7c : a9 a5 __ LDA #$a5
2a7e : 99 00 86 STA $8600,y ; (BLIT_CODE[0] + 0)
2a81 : a9 2a __ LDA #$2a
2a83 : 99 02 86 STA $8602,y ; (BLIT_CODE[0] + 2)
2a86 : a5 1b __ LDA ACCU + 0 
2a88 : 60 __ __ RTS
.s17:
2a89 : a4 0e __ LDY P1 ; (shift + 0)
2a8b : c0 05 __ CPY #$05
2a8d : b0 3d __ BCS $2acc ; (builddop_src.s21 + 0)
.s18:
2a8f : a9 4a __ LDA #$4a
2a91 : 9d 06 86 STA $8606,x ; (BLIT_CODE[0] + 6)
2a94 : e6 1b __ INC ACCU + 0 
2a96 : c0 02 __ CPY #$02
2a98 : 90 1c __ BCC $2ab6 ; (builddop_src.s19 + 0)
.s20:
2a9a : a6 1b __ LDX ACCU + 0 
2a9c : 88 __ __ DEY
.l29:
2a9d : a9 66 __ LDA #$66
2a9f : 9d 00 86 STA $8600,x ; (BLIT_CODE[0] + 0)
2aa2 : a9 09 __ LDA #$09
2aa4 : 9d 01 86 STA $8601,x ; (BLIT_CODE[0] + 1)
2aa7 : a9 4a __ LDA #$4a
2aa9 : 9d 02 86 STA $8602,x ; (BLIT_CODE[0] + 2)
2aac : 8a __ __ TXA
2aad : 18 __ __ CLC
2aae : 69 03 __ ADC #$03
2ab0 : aa __ __ TAX
2ab1 : 88 __ __ DEY
2ab2 : d0 e9 __ BNE $2a9d ; (builddop_src.l29 + 0)
.s30:
2ab4 : 85 1b __ STA ACCU + 0 
.s19:
2ab6 : a9 a5 __ LDA #$a5
2ab8 : a6 1b __ LDX ACCU + 0 
2aba : 9d 00 86 STA $8600,x ; (BLIT_CODE[0] + 0)
2abd : a9 09 __ LDA #$09
2abf : 9d 01 86 STA $8601,x ; (BLIT_CODE[0] + 1)
2ac2 : a9 6a __ LDA #$6a
2ac4 : 9d 02 86 STA $8602,x ; (BLIT_CODE[0] + 2)
2ac7 : 8a __ __ TXA
2ac8 : 18 __ __ CLC
2ac9 : 69 03 __ ADC #$03
2acb : 60 __ __ RTS
.s21:
2acc : c0 07 __ CPY #$07
2ace : b0 1c __ BCS $2aec ; (builddop_src.s22 + 0)
.s23:
2ad0 : a6 0d __ LDX P0 ; (ip + 0)
.l34:
2ad2 : a9 2a __ LDA #$2a
2ad4 : 9d 00 86 STA $8600,x ; (BLIT_CODE[0] + 0)
2ad7 : a9 06 __ LDA #$06
2ad9 : 9d 01 86 STA $8601,x ; (BLIT_CODE[0] + 1)
2adc : a9 09 __ LDA #$09
2ade : 9d 02 86 STA $8602,x ; (BLIT_CODE[0] + 2)
2ae1 : 8a __ __ TXA
2ae2 : 69 03 __ ADC #$03
2ae4 : c8 __ __ INY
2ae5 : c0 07 __ CPY #$07
2ae7 : aa __ __ TAX
2ae8 : 90 e8 __ BCC $2ad2 ; (builddop_src.l34 + 0)
.s28:
2aea : 85 0d __ STA P0 ; (ip + 0)
.s22:
2aec : a9 2a __ LDA #$2a
2aee : 4c 55 2a JMP $2a55 ; (builddop_src.s33 + 0)
.s26:
2af1 : a5 0e __ LDA P1 ; (shift + 0)
2af3 : c9 05 __ CMP #$05
2af5 : b0 03 __ BCS $2afa ; (builddop_src.s27 + 0)
2af7 : 4c f7 29 JMP $29f7 ; (builddop_src.s8 + 0)
.s27:
2afa : a9 0a __ LDA #$0a
2afc : 4c f3 29 JMP $29f3 ; (builddop_src.s25 + 0)
--------------------------------------------------------------------
builddop_op: ; builddop_op(u8,enum BlitOp,u8)->u8
; 965, "/home/xahmol/oscar64/include/gfx/bitmap.c"
.s4:
2aff : a5 0e __ LDA P1 ; (op + 0)
2b01 : 29 20 __ AND #$20
2b03 : f0 04 __ BEQ $2b09 ; (builddop_op.s27 + 0)
.s28:
2b05 : a9 07 __ LDA #$07
2b07 : d0 02 __ BNE $2b0b ; (builddop_op.s29 + 0)
.s27:
2b09 : a9 0a __ LDA #$0a
.s29:
2b0b : 85 1c __ STA ACCU + 1 
2b0d : a5 0e __ LDA P1 ; (op + 0)
2b0f : 29 03 __ AND #$03
2b11 : a8 __ __ TAY
2b12 : a5 0e __ LDA P1 ; (op + 0)
2b14 : 29 04 __ AND #$04
2b16 : f0 03 __ BEQ $2b1b ; (builddop_op.s5 + 0)
2b18 : 4c ad 2b JMP $2bad ; (builddop_op.s18 + 0)
.s5:
2b1b : a5 0e __ LDA P1 ; (op + 0)
2b1d : 29 08 __ AND #$08
2b1f : d0 13 __ BNE $2b34 ; (builddop_op.s15 + 0)
.s6:
2b21 : a9 a5 __ LDA #$a5
2b23 : a6 0d __ LDX P0 ; (ip + 0)
2b25 : 9d 00 86 STA $8600,x ; (BLIT_CODE[0] + 0)
2b28 : a5 1c __ LDA ACCU + 1 
.s7:
2b2a : e8 __ __ INX
2b2b : e8 __ __ INX
2b2c : 86 0d __ STX P0 ; (ip + 0)
2b2e : 9d ff 85 STA $85ff,x ; (HeapNode.end + 1)
2b31 : 4c 44 2b JMP $2b44 ; (builddop_op.s16 + 0)
.s15:
2b34 : a5 0e __ LDA P1 ; (op + 0)
2b36 : 0a __ __ ASL
2b37 : 10 0b __ BPL $2b44 ; (builddop_op.s16 + 0)
.s17:
2b39 : a9 49 __ LDA #$49
2b3b : a6 0d __ LDX P0 ; (ip + 0)
2b3d : 9d 00 86 STA $8600,x ; (BLIT_CODE[0] + 0)
2b40 : a9 ff __ LDA #$ff
2b42 : d0 e6 __ BNE $2b2a ; (builddop_op.s7 + 0)
.s16:
2b44 : 98 __ __ TYA
2b45 : f0 13 __ BEQ $2b5a ; (builddop_op.s8 + 0)
.s14:
2b47 : a5 1c __ LDA ACCU + 1 
2b49 : a6 0d __ LDX P0 ; (ip + 0)
2b4b : e8 __ __ INX
2b4c : e8 __ __ INX
2b4d : 86 0d __ STX P0 ; (ip + 0)
2b4f : 9d ff 85 STA $85ff,x ; (HeapNode.end + 1)
2b52 : b9 cd 73 LDA $73cd,y ; (blitops_op[0] + 0)
2b55 : 09 04 __ ORA #$04
2b57 : 9d fe 85 STA $85fe,x ; (HeapNode.end + 0)
.s8:
2b5a : a5 0f __ LDA P2 ; (mask + 0)
2b5c : f0 3f __ BEQ $2b9d ; (builddop_op.s9 + 0)
.s10:
2b5e : a9 85 __ LDA #$85
2b60 : a4 0d __ LDY P0 ; (ip + 0)
2b62 : 99 00 86 STA $8600,y ; (BLIT_CODE[0] + 0)
2b65 : a9 09 __ LDA #$09
2b67 : 99 01 86 STA $8601,y ; (BLIT_CODE[0] + 1)
2b6a : 98 __ __ TYA
2b6b : 18 __ __ CLC
2b6c : 69 08 __ ADC #$08
2b6e : 85 0d __ STA P0 ; (ip + 0)
2b70 : a5 0e __ LDA P1 ; (op + 0)
2b72 : 29 10 __ AND #$10
2b74 : f0 09 __ BEQ $2b7f ; (builddop_op.s11 + 0)
.s13:
2b76 : a9 45 __ LDA #$45
2b78 : 99 02 86 STA $8602,y ; (BLIT_CODE[0] + 2)
2b7b : a9 0a __ LDA #$0a
2b7d : d0 07 __ BNE $2b86 ; (builddop_op.s12 + 0)
.s11:
2b7f : a9 51 __ LDA #$51
2b81 : 99 02 86 STA $8602,y ; (BLIT_CODE[0] + 2)
2b84 : a9 05 __ LDA #$05
.s12:
2b86 : 99 03 86 STA $8603,y ; (BLIT_CODE[0] + 3)
2b89 : a9 29 __ LDA #$29
2b8b : 99 04 86 STA $8604,y ; (BLIT_CODE[0] + 4)
2b8e : a5 0f __ LDA P2 ; (mask + 0)
2b90 : 99 05 86 STA $8605,y ; (BLIT_CODE[0] + 5)
2b93 : a9 45 __ LDA #$45
2b95 : 99 06 86 STA $8606,y ; (BLIT_CODE[0] + 6)
2b98 : a9 09 __ LDA #$09
2b9a : 99 07 86 STA $8607,y ; (BLIT_CODE[0] + 7)
.s9:
2b9d : a9 91 __ LDA #$91
2b9f : a6 0d __ LDX P0 ; (ip + 0)
2ba1 : 9d 00 86 STA $8600,x ; (BLIT_CODE[0] + 0)
2ba4 : a9 05 __ LDA #$05
2ba6 : 9d 01 86 STA $8601,x ; (BLIT_CODE[0] + 1)
2ba9 : e8 __ __ INX
2baa : e8 __ __ INX
2bab : 8a __ __ TXA
.s3:
2bac : 60 __ __ RTS
.s18:
2bad : 98 __ __ TYA
2bae : d0 04 __ BNE $2bb4 ; (builddop_op.s20 + 0)
.s19:
2bb0 : a5 0f __ LDA P2 ; (mask + 0)
2bb2 : d0 16 __ BNE $2bca ; (builddop_op.s23 + 0)
.s20:
2bb4 : a5 0e __ LDA P1 ; (op + 0)
2bb6 : 29 40 __ AND #$40
2bb8 : f0 02 __ BEQ $2bbc ; (builddop_op.s21 + 0)
.s22:
2bba : a9 ff __ LDA #$ff
.s21:
2bbc : 85 1b __ STA ACCU + 0 
2bbe : a9 a9 __ LDA #$a9
2bc0 : a6 0d __ LDX P0 ; (ip + 0)
2bc2 : 9d 00 86 STA $8600,x ; (BLIT_CODE[0] + 0)
2bc5 : a5 1b __ LDA ACCU + 0 
2bc7 : 4c 2a 2b JMP $2b2a ; (builddop_op.s7 + 0)
.s23:
2bca : a9 b1 __ LDA #$b1
2bcc : a4 0d __ LDY P0 ; (ip + 0)
2bce : 99 00 86 STA $8600,y ; (BLIT_CODE[0] + 0)
2bd1 : a9 05 __ LDA #$05
2bd3 : 99 01 86 STA $8601,y ; (BLIT_CODE[0] + 1)
2bd6 : 06 0e __ ASL P1 ; (op + 0)
2bd8 : 30 0a __ BMI $2be4 ; (builddop_op.s26 + 0)
.s24:
2bda : a9 29 __ LDA #$29
2bdc : 99 02 86 STA $8602,y ; (BLIT_CODE[0] + 2)
2bdf : a5 0f __ LDA P2 ; (mask + 0)
2be1 : 4c ed 2b JMP $2bed ; (builddop_op.s25 + 0)
.s26:
2be4 : a9 09 __ LDA #$09
2be6 : 99 02 86 STA $8602,y ; (BLIT_CODE[0] + 2)
2be9 : a5 0f __ LDA P2 ; (mask + 0)
2beb : 49 ff __ EOR #$ff
.s25:
2bed : 99 03 86 STA $8603,y ; (BLIT_CODE[0] + 3)
2bf0 : a9 91 __ LDA #$91
2bf2 : 99 04 86 STA $8604,y ; (BLIT_CODE[0] + 4)
2bf5 : a9 05 __ LDA #$05
2bf7 : 99 05 86 STA $8605,y ; (BLIT_CODE[0] + 5)
2bfa : 98 __ __ TYA
2bfb : 18 __ __ CLC
2bfc : 69 06 __ ADC #$06
2bfe : 60 __ __ RTS
--------------------------------------------------------------------
draw_message: ; draw_message(u8)->void
; 234, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s1:
2bff : a2 04 __ LDX #$04
2c01 : b5 53 __ LDA T1 + 0,x 
2c03 : 9d cd bf STA $bfcd,x ; (draw_message@stack + 0)
2c06 : ca __ __ DEX
2c07 : 10 f8 __ BPL $2c01 ; (draw_message.s1 + 2)
.s4:
2c09 : ad f0 bf LDA $bff0 ; (sstack + 6)
2c0c : 0a __ __ ASL
2c0d : aa __ __ TAX
2c0e : bd d1 73 LDA $73d1,x ; (step_msg[0] + 0)
2c11 : 85 56 __ STA T3 + 0 
2c13 : 85 0d __ STA P0 
2c15 : bd d2 73 LDA $73d2,x ; (step_msg[0] + 1)
2c18 : 85 57 __ STA T3 + 1 
2c1a : 85 0e __ STA P1 
2c1c : 20 44 10 JSR $1044 ; (strlen.s4 + 0)
2c1f : a9 00 __ LDA #$00
2c21 : 85 53 __ STA T1 + 0 
2c23 : 85 54 __ STA T1 + 1 
2c25 : a5 1b __ LDA ACCU + 0 
2c27 : f0 1b __ BEQ $2c44 ; (draw_message.s5 + 0)
.s6:
2c29 : a0 00 __ LDY #$00
.l7:
2c2b : b1 56 __ LDA (T3 + 0),y 
2c2d : 38 __ __ SEC
2c2e : e9 20 __ SBC #$20
2c30 : aa __ __ TAX
2c31 : bd bb 74 LDA $74bb,x ; (TinyFont[0] + 96)
2c34 : 4a __ __ LSR
2c35 : 4a __ __ LSR
2c36 : 38 __ __ SEC
2c37 : 65 53 __ ADC T1 + 0 
2c39 : 85 53 __ STA T1 + 0 
2c3b : 90 02 __ BCC $2c3f ; (draw_message.s9 + 0)
.s8:
2c3d : e6 54 __ INC T1 + 1 
.s9:
2c3f : c8 __ __ INY
2c40 : c4 1b __ CPY ACCU + 0 
2c42 : 90 e7 __ BCC $2c2b ; (draw_message.l7 + 0)
.s5:
2c44 : a5 0d __ LDA P0 
2c46 : 85 0e __ STA P1 
2c48 : a5 57 __ LDA T3 + 1 
2c4a : 85 0f __ STA P2 
2c4c : a5 1b __ LDA ACCU + 0 
2c4e : 85 10 __ STA P3 
2c50 : 38 __ __ SEC
2c51 : a9 40 __ LDA #$40
2c53 : e5 53 __ SBC T1 + 0 
2c55 : a8 __ __ TAY
2c56 : a9 01 __ LDA #$01
2c58 : e5 54 __ SBC T1 + 1 
2c5a : aa __ __ TAX
2c5b : 0a __ __ ASL
2c5c : 98 __ __ TYA
2c5d : 69 00 __ ADC #$00
2c5f : 85 53 __ STA T1 + 0 
2c61 : 8a __ __ TXA
2c62 : 69 00 __ ADC #$00
2c64 : c9 80 __ CMP #$80
2c66 : 6a __ __ ROR
2c67 : 66 53 __ ROR T1 + 0 
2c69 : 85 54 __ STA T1 + 1 
2c6b : a5 53 __ LDA T1 + 0 
2c6d : 29 07 __ AND #$07
2c6f : 85 55 __ STA T2 + 0 
2c71 : 85 0d __ STA P0 
2c73 : 20 5e 2e JSR $2e5e ; (bmu_text.s4 + 0)
2c76 : a5 53 __ LDA T1 + 0 
2c78 : 85 10 __ STA P3 
2c7a : a5 54 __ LDA T1 + 1 
2c7c : 85 11 __ STA P4 
2c7e : a9 00 __ LDA #$00
2c80 : 85 13 __ STA P6 
2c82 : 85 17 __ STA P10 
2c84 : 8d ea bf STA $bfea ; (sstack + 0)
2c87 : 8d eb bf STA $bfeb ; (sstack + 1)
2c8a : 8d ef bf STA $bfef ; (sstack + 5)
2c8d : a5 55 __ LDA T2 + 0 
2c8f : 85 16 __ STA P9 
2c91 : a9 a2 __ LDA #$a2
2c93 : 85 12 __ STA P5 
2c95 : a5 1b __ LDA ACCU + 0 
2c97 : 8d ec bf STA $bfec ; (sstack + 2)
2c9a : a5 1c __ LDA ACCU + 1 
2c9c : 8d ed bf STA $bfed ; (sstack + 3)
2c9f : a9 08 __ LDA #$08
2ca1 : 85 18 __ STA P11 
2ca3 : 8d ee bf STA $bfee ; (sstack + 4)
2ca6 : a9 f1 __ LDA #$f1
2ca8 : 85 14 __ STA P7 
2caa : a9 73 __ LDA #$73
2cac : 85 15 __ STA P8 
2cae : 20 4a 23 JSR $234a ; (bmu_bitblit.s1 + 0)
.s3:
2cb1 : a2 04 __ LDX #$04
2cb3 : bd cd bf LDA $bfcd,x ; (draw_message@stack + 0)
2cb6 : 95 53 __ STA T1 + 0,x 
2cb8 : ca __ __ DEX
2cb9 : 10 f8 __ BPL $2cb3 ; (draw_message.s3 + 2)
2cbb : 60 __ __ RTS
--------------------------------------------------------------------
2cbc : __ __ __ BYT 53 74 61 6e 64 61 72 64 20 31 20 4d 48 7a 20 43 : Standard 1 MHz C
2ccc : __ __ __ BYT 36 34 20 73 70 65 65 64 00                      : 64 speed.
--------------------------------------------------------------------
2cd5 : __ __ __ BYT 54 75 72 62 6f 20 65 6e 67 61 67 65 64 3a 20 32 : Turbo engaged: 2
2ce5 : __ __ __ BYT 20 4d 48 7a 00                                  :  MHz.
--------------------------------------------------------------------
2cea : __ __ __ BYT 33 20 4d 48 7a 20 2d 20 77 61 72 6d 69 6e 67 20 : 3 MHz - warming 
2cfa : __ __ __ BYT 75 70 00                                        : up.
--------------------------------------------------------------------
2cfd : __ __ __ BYT 34 20 4d 48 7a 20 2d 20 73 6d 6f 6f 74 68 20 61 : 4 MHz - smooth a
2d0d : __ __ __ BYT 6c 72 65 61 64 79 21 00                         : lready!.
--------------------------------------------------------------------
2d15 : __ __ __ BYT 36 20 4d 48 7a 20 2d 20 74 68 69 73 20 66 65 65 : 6 MHz - this fee
2d25 : __ __ __ BYT 6c 73 20 64 69 66 66 65 72 65 6e 74 00          : ls different.
--------------------------------------------------------------------
2d32 : __ __ __ BYT 38 20 4d 48 7a 20 2d 20 74 68 69 6e 67 73 20 61 : 8 MHz - things a
2d42 : __ __ __ BYT 72 65 20 6d 6f 76 69 6e 67 00                   : re moving.
--------------------------------------------------------------------
2d4c : __ __ __ BYT 31 32 20 4d 48 7a 20 2d 20 70 69 63 6b 69 6e 67 : 12 MHz - picking
2d5c : __ __ __ BYT 20 75 70 20 73 70 65 65 64 00                   :  up speed.
--------------------------------------------------------------------
2d66 : __ __ __ BYT 31 36 20 4d 48 7a 20 2d 20 6e 6f 74 69 63 65 61 : 16 MHz - noticea
2d76 : __ __ __ BYT 62 6c 79 20 66 61 73 74 00                      : bly fast.
--------------------------------------------------------------------
2d7f : __ __ __ BYT 32 30 20 4d 48 7a 20 2d 20 77 68 61 74 20 69 73 : 20 MHz - what is
2d8f : __ __ __ BYT 20 68 61 70 70 65 6e 69 6e 67 3f 00             :  happening?.
--------------------------------------------------------------------
2d9b : __ __ __ BYT 32 34 20 4d 48 7a 20 2d 20 65 79 65 73 20 63 61 : 24 MHz - eyes ca
2dab : __ __ __ BYT 6e 20 62 61 72 65 6c 79 20 66 6f 6c 6c 6f 77 00 : n barely follow.
--------------------------------------------------------------------
2dbb : __ __ __ BYT 32 38 20 4d 48 7a 20 2d 20 74 68 69 73 20 69 73 : 28 MHz - this is
2dcb : __ __ __ BYT 20 69 6e 63 72 65 64 69 62 6c 65 21 00          :  incredible!.
--------------------------------------------------------------------
2dd8 : __ __ __ BYT 33 32 20 4d 48 7a 20 2d 20 74 68 65 20 6d 61 63 : 32 MHz - the mac
2de8 : __ __ __ BYT 68 69 6e 65 20 73 63 72 65 61 6d 73 00          : hine screams.
--------------------------------------------------------------------
2df5 : __ __ __ BYT 33 36 20 4d 48 7a 20 2d 20 62 65 79 6f 6e 64 20 : 36 MHz - beyond 
2e05 : __ __ __ BYT 69 6d 61 67 69 6e 61 74 69 6f 6e 00             : imagination.
--------------------------------------------------------------------
2e11 : __ __ __ BYT 34 30 20 4d 48 7a 20 2d 20 68 6f 6c 64 20 6f 6e : 40 MHz - hold on
2e21 : __ __ __ BYT 20 74 69 67 68 74 21 00                         :  tight!.
--------------------------------------------------------------------
2e29 : __ __ __ BYT 34 38 20 4d 48 7a 20 2d 20 6d 61 78 69 6d 75 6d : 48 MHz - maximum
2e39 : __ __ __ BYT 20 6f 76 65 72 64 72 69 76 65 21 00             :  overdrive!.
--------------------------------------------------------------------
2e45 : __ __ __ BYT 36 34 20 4d 48 7a 20 20 55 4c 54 49 4d 41 54 45 : 64 MHz  ULTIMATE
2e55 : __ __ __ BYT 20 53 50 45 45 44 21 21 00                      :  SPEED!!.
--------------------------------------------------------------------
bmu_text: ; bmu_text(const struct Bitmap*,u8,const u8*,u8)->i16
; 151, "/home/xahmol/oscar64/include/gfx/bitmap.h"
.s4:
2e5e : a9 00 __ LDA #$00
2e60 : 8d e2 85 STA $85e2 ; (tworks[0] + 0)
2e63 : 8d e3 85 STA $85e3 ; (tworks[0] + 1)
2e66 : 8d e4 85 STA $85e4 ; (tworks[0] + 2)
2e69 : 8d e5 85 STA $85e5 ; (tworks[0] + 3)
2e6c : 8d e6 85 STA $85e6 ; (tworks[0] + 4)
2e6f : 8d e7 85 STA $85e7 ; (tworks[0] + 5)
2e72 : 8d e8 85 STA $85e8 ; (tworks[0] + 6)
2e75 : 8d e9 85 STA $85e9 ; (tworks[0] + 7)
2e78 : 85 1b __ STA ACCU + 0 
2e7a : 85 1c __ STA ACCU + 1 
2e7c : ad f1 73 LDA $73f1 ; (tbitmap.data + 0)
2e7f : 85 43 __ STA T1 + 0 
2e81 : ad f2 73 LDA $73f2 ; (tbitmap.data + 1)
2e84 : 85 44 __ STA T1 + 1 
2e86 : a5 10 __ LDA P3 ; (len + 0)
2e88 : d0 03 __ BNE $2e8d ; (bmu_text.s7 + 0)
2e8a : 4c 9a 2f JMP $2f9a ; (bmu_text.s5 + 0)
.s7:
2e8d : a0 00 __ LDY #$00
.l8:
2e8f : 84 1d __ STY ACCU + 2 
2e91 : b1 0e __ LDA (P1),y ; (str + 0)
2e93 : 38 __ __ SEC
2e94 : e9 20 __ SBC #$20
2e96 : aa __ __ TAX
2e97 : 18 __ __ CLC
2e98 : a9 1b __ LDA #$1b
2e9a : 7d 5b 74 ADC $745b,x ; (TinyFont[0] + 0)
2e9d : 85 45 __ STA T6 + 0 
2e9f : bd bb 74 LDA $74bb,x ; (TinyFont[0] + 96)
2ea2 : 29 03 __ AND #$03
2ea4 : 69 75 __ ADC #$75
2ea6 : 85 46 __ STA T6 + 1 
2ea8 : bd bb 74 LDA $74bb,x ; (TinyFont[0] + 96)
2eab : 4a __ __ LSR
2eac : 4a __ __ LSR
2ead : 85 1e __ STA ACCU + 3 
2eaf : 38 __ __ SEC
2eb0 : 65 1b __ ADC ACCU + 0 
2eb2 : 85 1b __ STA ACCU + 0 
2eb4 : 90 02 __ BCC $2eb8 ; (bmu_text.s19 + 0)
.s18:
2eb6 : e6 1c __ INC ACCU + 1 
.s19:
2eb8 : a9 00 __ LDA #$00
2eba : 85 47 __ STA T7 + 0 
2ebc : a5 1e __ LDA ACCU + 3 
2ebe : f0 73 __ BEQ $2f33 ; (bmu_text.s9 + 0)
.s16:
2ec0 : a6 0d __ LDX P0 ; (lx + 0)
2ec2 : a0 00 __ LDY #$00
.l12:
2ec4 : b1 45 __ LDA (T6 + 0),y 
2ec6 : 0a __ __ ASL
2ec7 : 2e e2 85 ROL $85e2 ; (tworks[0] + 0)
2eca : 0a __ __ ASL
2ecb : 2e e3 85 ROL $85e3 ; (tworks[0] + 1)
2ece : 0a __ __ ASL
2ecf : 2e e4 85 ROL $85e4 ; (tworks[0] + 2)
2ed2 : 0a __ __ ASL
2ed3 : 2e e5 85 ROL $85e5 ; (tworks[0] + 3)
2ed6 : 0a __ __ ASL
2ed7 : 2e e6 85 ROL $85e6 ; (tworks[0] + 4)
2eda : 0a __ __ ASL
2edb : 2e e7 85 ROL $85e7 ; (tworks[0] + 5)
2ede : 0a __ __ ASL
2edf : 2e e8 85 ROL $85e8 ; (tworks[0] + 6)
2ee2 : 0a __ __ ASL
2ee3 : 2e e9 85 ROL $85e9 ; (tworks[0] + 7)
2ee6 : e8 __ __ INX
2ee7 : e0 08 __ CPX #$08
2ee9 : d0 3e __ BNE $2f29 ; (bmu_text.s13 + 0)
.s14:
2eeb : ad e2 85 LDA $85e2 ; (tworks[0] + 0)
2eee : a0 00 __ LDY #$00
2ef0 : 91 43 __ STA (T1 + 0),y 
2ef2 : ad e3 85 LDA $85e3 ; (tworks[0] + 1)
2ef5 : c8 __ __ INY
2ef6 : 91 43 __ STA (T1 + 0),y 
2ef8 : ad e4 85 LDA $85e4 ; (tworks[0] + 2)
2efb : c8 __ __ INY
2efc : 91 43 __ STA (T1 + 0),y 
2efe : ad e5 85 LDA $85e5 ; (tworks[0] + 3)
2f01 : c8 __ __ INY
2f02 : 91 43 __ STA (T1 + 0),y 
2f04 : ad e6 85 LDA $85e6 ; (tworks[0] + 4)
2f07 : c8 __ __ INY
2f08 : 91 43 __ STA (T1 + 0),y 
2f0a : ad e7 85 LDA $85e7 ; (tworks[0] + 5)
2f0d : c8 __ __ INY
2f0e : 91 43 __ STA (T1 + 0),y 
2f10 : ad e8 85 LDA $85e8 ; (tworks[0] + 6)
2f13 : c8 __ __ INY
2f14 : 91 43 __ STA (T1 + 0),y 
2f16 : ad e9 85 LDA $85e9 ; (tworks[0] + 7)
2f19 : c8 __ __ INY
2f1a : 91 43 __ STA (T1 + 0),y 
2f1c : 18 __ __ CLC
2f1d : a5 43 __ LDA T1 + 0 
2f1f : 69 08 __ ADC #$08
2f21 : 85 43 __ STA T1 + 0 
2f23 : 90 02 __ BCC $2f27 ; (bmu_text.s21 + 0)
.s20:
2f25 : e6 44 __ INC T1 + 1 
.s21:
2f27 : a2 00 __ LDX #$00
.s13:
2f29 : e6 47 __ INC T7 + 0 
2f2b : a4 47 __ LDY T7 + 0 
2f2d : c4 1e __ CPY ACCU + 3 
2f2f : 90 93 __ BCC $2ec4 ; (bmu_text.l12 + 0)
.s17:
2f31 : 86 0d __ STX P0 ; (lx + 0)
.s9:
2f33 : 0e e2 85 ASL $85e2 ; (tworks[0] + 0)
2f36 : 0e e3 85 ASL $85e3 ; (tworks[0] + 1)
2f39 : 0e e4 85 ASL $85e4 ; (tworks[0] + 2)
2f3c : 0e e5 85 ASL $85e5 ; (tworks[0] + 3)
2f3f : 0e e6 85 ASL $85e6 ; (tworks[0] + 4)
2f42 : 0e e7 85 ASL $85e7 ; (tworks[0] + 5)
2f45 : 0e e8 85 ASL $85e8 ; (tworks[0] + 6)
2f48 : 0e e9 85 ASL $85e9 ; (tworks[0] + 7)
2f4b : e6 0d __ INC P0 ; (lx + 0)
2f4d : a5 0d __ LDA P0 ; (lx + 0)
2f4f : c9 08 __ CMP #$08
2f51 : d0 3d __ BNE $2f90 ; (bmu_text.s10 + 0)
.s11:
2f53 : ad e2 85 LDA $85e2 ; (tworks[0] + 0)
2f56 : a0 00 __ LDY #$00
2f58 : 84 0d __ STY P0 ; (lx + 0)
2f5a : 91 43 __ STA (T1 + 0),y 
2f5c : ad e3 85 LDA $85e3 ; (tworks[0] + 1)
2f5f : c8 __ __ INY
2f60 : 91 43 __ STA (T1 + 0),y 
2f62 : ad e4 85 LDA $85e4 ; (tworks[0] + 2)
2f65 : c8 __ __ INY
2f66 : 91 43 __ STA (T1 + 0),y 
2f68 : ad e5 85 LDA $85e5 ; (tworks[0] + 3)
2f6b : c8 __ __ INY
2f6c : 91 43 __ STA (T1 + 0),y 
2f6e : ad e6 85 LDA $85e6 ; (tworks[0] + 4)
2f71 : c8 __ __ INY
2f72 : 91 43 __ STA (T1 + 0),y 
2f74 : ad e7 85 LDA $85e7 ; (tworks[0] + 5)
2f77 : c8 __ __ INY
2f78 : 91 43 __ STA (T1 + 0),y 
2f7a : ad e8 85 LDA $85e8 ; (tworks[0] + 6)
2f7d : c8 __ __ INY
2f7e : 91 43 __ STA (T1 + 0),y 
2f80 : ad e9 85 LDA $85e9 ; (tworks[0] + 7)
2f83 : c8 __ __ INY
2f84 : 91 43 __ STA (T1 + 0),y 
2f86 : a5 43 __ LDA T1 + 0 
2f88 : 69 07 __ ADC #$07
2f8a : 85 43 __ STA T1 + 0 
2f8c : 90 02 __ BCC $2f90 ; (bmu_text.s10 + 0)
.s22:
2f8e : e6 44 __ INC T1 + 1 
.s10:
2f90 : a4 1d __ LDY ACCU + 2 
2f92 : c8 __ __ INY
2f93 : c4 10 __ CPY P3 ; (len + 0)
2f95 : b0 03 __ BCS $2f9a ; (bmu_text.s5 + 0)
2f97 : 4c 8f 2e JMP $2e8f ; (bmu_text.l8 + 0)
.s5:
2f9a : a6 0d __ LDX P0 ; (lx + 0)
2f9c : e0 08 __ CPX #$08
2f9e : b0 1d __ BCS $2fbd ; (bmu_text.s6 + 0)
.l15:
2fa0 : 0e e2 85 ASL $85e2 ; (tworks[0] + 0)
2fa3 : 0e e3 85 ASL $85e3 ; (tworks[0] + 1)
2fa6 : 0e e4 85 ASL $85e4 ; (tworks[0] + 2)
2fa9 : 0e e5 85 ASL $85e5 ; (tworks[0] + 3)
2fac : 0e e6 85 ASL $85e6 ; (tworks[0] + 4)
2faf : 0e e7 85 ASL $85e7 ; (tworks[0] + 5)
2fb2 : 0e e8 85 ASL $85e8 ; (tworks[0] + 6)
2fb5 : 0e e9 85 ASL $85e9 ; (tworks[0] + 7)
2fb8 : e8 __ __ INX
2fb9 : e0 08 __ CPX #$08
2fbb : 90 e3 __ BCC $2fa0 ; (bmu_text.l15 + 0)
.s6:
2fbd : ad e2 85 LDA $85e2 ; (tworks[0] + 0)
2fc0 : a0 00 __ LDY #$00
2fc2 : 91 43 __ STA (T1 + 0),y 
2fc4 : ad e3 85 LDA $85e3 ; (tworks[0] + 1)
2fc7 : c8 __ __ INY
2fc8 : 91 43 __ STA (T1 + 0),y 
2fca : ad e4 85 LDA $85e4 ; (tworks[0] + 2)
2fcd : c8 __ __ INY
2fce : 91 43 __ STA (T1 + 0),y 
2fd0 : ad e5 85 LDA $85e5 ; (tworks[0] + 3)
2fd3 : c8 __ __ INY
2fd4 : 91 43 __ STA (T1 + 0),y 
2fd6 : ad e6 85 LDA $85e6 ; (tworks[0] + 4)
2fd9 : c8 __ __ INY
2fda : 91 43 __ STA (T1 + 0),y 
2fdc : ad e7 85 LDA $85e7 ; (tworks[0] + 5)
2fdf : c8 __ __ INY
2fe0 : 91 43 __ STA (T1 + 0),y 
2fe2 : ad e8 85 LDA $85e8 ; (tworks[0] + 6)
2fe5 : c8 __ __ INY
2fe6 : 91 43 __ STA (T1 + 0),y 
2fe8 : ad e9 85 LDA $85e9 ; (tworks[0] + 7)
2feb : c8 __ __ INY
2fec : 91 43 __ STA (T1 + 0),y 
.s3:
2fee : 60 __ __ RTS
--------------------------------------------------------------------
draw_gear: ; draw_gear(i16,i16,u8,u8,u8,u8,u8,u8,u8,u8)->void
;  88, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s1:
2fef : a2 20 __ LDX #$20
2ff1 : b5 53 __ LDA T0 + 0,x 
2ff3 : 9d b0 bf STA $bfb0,x ; (draw_gear@stack + 0)
2ff6 : ca __ __ DEX
2ff7 : 10 f8 __ BPL $2ff1 ; (draw_gear.s1 + 2)
.s4:
2ff9 : ad fd bf LDA $bffd ; (sstack + 19)
2ffc : 85 5d __ STA T5 + 0 
2ffe : ad fc bf LDA $bffc ; (sstack + 18)
3001 : 85 5e __ STA T6 + 0 
3003 : ad f9 bf LDA $bff9 ; (sstack + 15)
3006 : 85 5f __ STA T7 + 0 
3008 : ad fb bf LDA $bffb ; (sstack + 17)
300b : 85 60 __ STA T8 + 0 
300d : 4a __ __ LSR
300e : 85 61 __ STA T9 + 0 
3010 : a9 00 __ LDA #$00
3012 : 85 62 __ STA T10 + 0 
3014 : 85 63 __ STA T11 + 0 
3016 : 85 64 __ STA T11 + 1 
3018 : 85 65 __ STA T12 + 0 
301a : 85 66 __ STA T12 + 1 
301c : 85 53 __ STA T0 + 0 
301e : 85 54 __ STA T0 + 1 
3020 : 85 55 __ STA T1 + 0 
3022 : 85 56 __ STA T1 + 1 
3024 : ae ff bf LDX $bfff ; (sstack + 21)
3027 : 86 71 __ STX T20 + 0 
3029 : ae fe bf LDX $bffe ; (sstack + 20)
302c : 86 72 __ STX T21 + 0 
302e : ae fa bf LDX $bffa ; (sstack + 16)
3031 : 86 73 __ STX T22 + 0 
3033 : ae f7 bf LDX $bff7 ; (sstack + 13)
3036 : 86 67 __ STX T13 + 0 
.l5:
3038 : 85 1b __ STA ACCU + 0 
303a : a9 00 __ LDA #$00
303c : 85 1c __ STA ACCU + 1 
303e : a5 60 __ LDA T8 + 0 
3040 : 20 e1 6d JSR $6de1 ; (mul16by8 + 0)
3043 : 18 __ __ CLC
3044 : a5 1b __ LDA ACCU + 0 
3046 : 65 5f __ ADC T7 + 0 
3048 : 29 3f __ AND #$3f
304a : 85 68 __ STA T14 + 0 
304c : 18 __ __ CLC
304d : 69 10 __ ADC #$10
304f : 29 3f __ AND #$3f
3051 : aa __ __ TAX
3052 : bd 86 76 LDA $7686,x ; (sin64[0] + 0)
3055 : 85 57 __ STA T2 + 0 
3057 : 0a __ __ ASL
3058 : a9 00 __ LDA #$00
305a : 85 04 __ STA WORK + 1 
305c : 69 ff __ ADC #$ff
305e : 49 ff __ EOR #$ff
3060 : 85 58 __ STA T2 + 1 
3062 : a5 57 __ LDA T2 + 0 
3064 : 0a __ __ ASL
3065 : 85 1b __ STA ACCU + 0 
3067 : a5 58 __ LDA T2 + 1 
3069 : 2a __ __ ROL
306a : 06 1b __ ASL ACCU + 0 
306c : 2a __ __ ROL
306d : 85 1c __ STA ACCU + 1 
306f : 20 99 6e JSR $6e99 ; (divs16@proxy + 0)
3072 : a5 1b __ LDA ACCU + 0 
3074 : 85 69 __ STA T15 + 0 
3076 : a5 1c __ LDA ACCU + 1 
3078 : 85 6a __ STA T15 + 1 
307a : a6 68 __ LDX T14 + 0 
307c : bd 86 76 LDA $7686,x ; (sin64[0] + 0)
307f : 85 59 __ STA T3 + 0 
3081 : 85 1b __ STA ACCU + 0 
3083 : 29 80 __ AND #$80
3085 : 10 02 __ BPL $3089 ; (draw_gear.l5 + 81)
3087 : a9 ff __ LDA #$ff
3089 : 85 5a __ STA T3 + 1 
308b : 85 1c __ STA ACCU + 1 
308d : a5 5d __ LDA T5 + 0 
308f : 20 e1 6d JSR $6de1 ; (mul16by8 + 0)
3092 : 20 d0 72 JSR $72d0 ; (divs16@proxy + 0)
3095 : 18 __ __ CLC
3096 : a5 1b __ LDA ACCU + 0 
3098 : 69 58 __ ADC #$58
309a : 85 6b __ STA T16 + 0 
309c : a5 1c __ LDA ACCU + 1 
309e : 69 00 __ ADC #$00
30a0 : 85 6c __ STA T16 + 1 
30a2 : a5 57 __ LDA T2 + 0 
30a4 : 85 1b __ STA ACCU + 0 
30a6 : a5 58 __ LDA T2 + 1 
30a8 : 85 1c __ STA ACCU + 1 
30aa : a5 5d __ LDA T5 + 0 
30ac : 20 e1 6d JSR $6de1 ; (mul16by8 + 0)
30af : 20 d0 72 JSR $72d0 ; (divs16@proxy + 0)
30b2 : 18 __ __ CLC
30b3 : a5 1b __ LDA ACCU + 0 
30b5 : 65 67 __ ADC T13 + 0 
30b7 : 85 6d __ STA T17 + 0 
30b9 : a5 1c __ LDA ACCU + 1 
30bb : 69 00 __ ADC #$00
30bd : 85 6e __ STA T17 + 1 
30bf : a5 59 __ LDA T3 + 0 
30c1 : 85 1b __ STA ACCU + 0 
30c3 : a5 5a __ LDA T3 + 1 
30c5 : 85 1c __ STA ACCU + 1 
30c7 : a5 5e __ LDA T6 + 0 
30c9 : 20 e1 6d JSR $6de1 ; (mul16by8 + 0)
30cc : 20 d0 72 JSR $72d0 ; (divs16@proxy + 0)
30cf : 18 __ __ CLC
30d0 : a5 1b __ LDA ACCU + 0 
30d2 : 69 58 __ ADC #$58
30d4 : 85 5b __ STA T4 + 0 
30d6 : a5 1c __ LDA ACCU + 1 
30d8 : 69 00 __ ADC #$00
30da : 85 5c __ STA T4 + 1 
30dc : a5 57 __ LDA T2 + 0 
30de : 85 1b __ STA ACCU + 0 
30e0 : a5 58 __ LDA T2 + 1 
30e2 : 85 1c __ STA ACCU + 1 
30e4 : a5 5e __ LDA T6 + 0 
30e6 : 20 e1 6d JSR $6de1 ; (mul16by8 + 0)
30e9 : 20 d0 72 JSR $72d0 ; (divs16@proxy + 0)
30ec : 18 __ __ CLC
30ed : a5 1b __ LDA ACCU + 0 
30ef : 65 67 __ ADC T13 + 0 
30f1 : 85 57 __ STA T2 + 0 
30f3 : a5 1c __ LDA ACCU + 1 
30f5 : 69 00 __ ADC #$00
30f7 : 85 58 __ STA T2 + 1 
30f9 : 38 __ __ SEC
30fa : a9 00 __ LDA #$00
30fc : e5 59 __ SBC T3 + 0 
30fe : 85 1b __ STA ACCU + 0 
3100 : a9 00 __ LDA #$00
3102 : 85 04 __ STA WORK + 1 
3104 : e5 5a __ SBC T3 + 1 
3106 : 06 1b __ ASL ACCU + 0 
3108 : 2a __ __ ROL
3109 : 06 1b __ ASL ACCU + 0 
310b : 2a __ __ ROL
310c : 85 1c __ STA ACCU + 1 
310e : 20 99 6e JSR $6e99 ; (divs16@proxy + 0)
3111 : a5 1b __ LDA ACCU + 0 
3113 : 85 59 __ STA T3 + 0 
3115 : a5 1c __ LDA ACCU + 1 
3117 : 85 5a __ STA T3 + 1 
3119 : 05 1b __ ORA ACCU + 0 
311b : d0 12 __ BNE $312f ; (draw_gear.s6 + 0)
.s12:
311d : 85 59 __ STA T3 + 0 
311f : 85 5a __ STA T3 + 1 
3121 : a5 69 __ LDA T15 + 0 
3123 : 05 6a __ ORA T15 + 1 
3125 : d0 08 __ BNE $312f ; (draw_gear.s6 + 0)
.s13:
3127 : a9 01 __ LDA #$01
3129 : 85 69 __ STA T15 + 0 
312b : a9 00 __ LDA #$00
312d : 85 6a __ STA T15 + 1 
.s6:
312f : a5 62 __ LDA T10 + 0 
3131 : d0 1d __ BNE $3150 ; (draw_gear.s11 + 0)
.s7:
3133 : 38 __ __ SEC
3134 : a5 5b __ LDA T4 + 0 
3136 : e5 69 __ SBC T15 + 0 
3138 : 85 65 __ STA T12 + 0 
313a : a5 5c __ LDA T4 + 1 
313c : e5 6a __ SBC T15 + 1 
313e : 85 66 __ STA T12 + 1 
3140 : 38 __ __ SEC
3141 : a5 57 __ LDA T2 + 0 
3143 : e5 59 __ SBC T3 + 0 
3145 : 85 63 __ STA T11 + 0 
3147 : a5 58 __ LDA T2 + 1 
3149 : e5 5a __ SBC T3 + 1 
314b : 85 64 __ STA T11 + 1 
314d : 4c 9e 31 JMP $319e ; (draw_gear.s8 + 0)
.s11:
3150 : a5 53 __ LDA T0 + 0 
3152 : 8d ee bf STA $bfee ; (sstack + 4)
3155 : a5 54 __ LDA T0 + 1 
3157 : 8d ef bf STA $bfef ; (sstack + 5)
315a : a5 55 __ LDA T1 + 0 
315c : 8d f0 bf STA $bff0 ; (sstack + 6)
315f : a5 56 __ LDA T1 + 1 
3161 : 8d f1 bf STA $bff1 ; (sstack + 7)
3164 : a9 03 __ LDA #$03
3166 : 8d f6 bf STA $bff6 ; (sstack + 12)
3169 : a9 f4 __ LDA #$f4
316b : 8d ea bf STA $bfea ; (sstack + 0)
316e : a9 79 __ LDA #$79
3170 : 8d eb bf STA $bfeb ; (sstack + 1)
3173 : a9 c6 __ LDA #$c6
3175 : 8d ec bf STA $bfec ; (sstack + 2)
3178 : a9 76 __ LDA #$76
317a : 8d ed bf STA $bfed ; (sstack + 3)
317d : 38 __ __ SEC
317e : a5 57 __ LDA T2 + 0 
3180 : e5 59 __ SBC T3 + 0 
3182 : 8d f2 bf STA $bff2 ; (sstack + 8)
3185 : a5 58 __ LDA T2 + 1 
3187 : e5 5a __ SBC T3 + 1 
3189 : 8d f3 bf STA $bff3 ; (sstack + 9)
318c : 38 __ __ SEC
318d : a5 5b __ LDA T4 + 0 
318f : e5 69 __ SBC T15 + 0 
3191 : 8d f4 bf STA $bff4 ; (sstack + 10)
3194 : a5 5c __ LDA T4 + 1 
3196 : e5 6a __ SBC T15 + 1 
3198 : 8d f5 bf STA $bff5 ; (sstack + 11)
319b : 20 8f 34 JSR $348f ; (bm_line.s1 + 0)
.s8:
319e : a9 03 __ LDA #$03
31a0 : 8d f6 bf STA $bff6 ; (sstack + 12)
31a3 : a9 f4 __ LDA #$f4
31a5 : 8d ea bf STA $bfea ; (sstack + 0)
31a8 : a9 79 __ LDA #$79
31aa : 8d eb bf STA $bfeb ; (sstack + 1)
31ad : a9 c6 __ LDA #$c6
31af : 8d ec bf STA $bfec ; (sstack + 2)
31b2 : a9 76 __ LDA #$76
31b4 : 8d ed bf STA $bfed ; (sstack + 3)
31b7 : 38 __ __ SEC
31b8 : a5 57 __ LDA T2 + 0 
31ba : e5 59 __ SBC T3 + 0 
31bc : 8d ee bf STA $bfee ; (sstack + 4)
31bf : a5 58 __ LDA T2 + 1 
31c1 : e5 5a __ SBC T3 + 1 
31c3 : 8d ef bf STA $bfef ; (sstack + 5)
31c6 : 38 __ __ SEC
31c7 : a5 5b __ LDA T4 + 0 
31c9 : e5 69 __ SBC T15 + 0 
31cb : 8d f0 bf STA $bff0 ; (sstack + 6)
31ce : a5 5c __ LDA T4 + 1 
31d0 : e5 6a __ SBC T15 + 1 
31d2 : 8d f1 bf STA $bff1 ; (sstack + 7)
31d5 : 38 __ __ SEC
31d6 : a5 6d __ LDA T17 + 0 
31d8 : e5 59 __ SBC T3 + 0 
31da : 85 53 __ STA T0 + 0 
31dc : 8d f2 bf STA $bff2 ; (sstack + 8)
31df : a5 6e __ LDA T17 + 1 
31e1 : e5 5a __ SBC T3 + 1 
31e3 : 85 54 __ STA T0 + 1 
31e5 : 8d f3 bf STA $bff3 ; (sstack + 9)
31e8 : 38 __ __ SEC
31e9 : a5 6b __ LDA T16 + 0 
31eb : e5 69 __ SBC T15 + 0 
31ed : 85 6f __ STA T19 + 0 
31ef : 8d f4 bf STA $bff4 ; (sstack + 10)
31f2 : a5 6c __ LDA T16 + 1 
31f4 : e5 6a __ SBC T15 + 1 
31f6 : 85 70 __ STA T19 + 1 
31f8 : 8d f5 bf STA $bff5 ; (sstack + 11)
31fb : 20 8f 34 JSR $348f ; (bm_line.s1 + 0)
31fe : a9 f4 __ LDA #$f4
3200 : 8d ea bf STA $bfea ; (sstack + 0)
3203 : a9 79 __ LDA #$79
3205 : 8d eb bf STA $bfeb ; (sstack + 1)
3208 : a9 c6 __ LDA #$c6
320a : 8d ec bf STA $bfec ; (sstack + 2)
320d : a9 76 __ LDA #$76
320f : 8d ed bf STA $bfed ; (sstack + 3)
3212 : a5 53 __ LDA T0 + 0 
3214 : 8d ee bf STA $bfee ; (sstack + 4)
3217 : a5 54 __ LDA T0 + 1 
3219 : 8d ef bf STA $bfef ; (sstack + 5)
321c : a5 6f __ LDA T19 + 0 
321e : 8d f0 bf STA $bff0 ; (sstack + 6)
3221 : a5 70 __ LDA T19 + 1 
3223 : 8d f1 bf STA $bff1 ; (sstack + 7)
3226 : a9 03 __ LDA #$03
3228 : 8d f6 bf STA $bff6 ; (sstack + 12)
322b : 18 __ __ CLC
322c : a5 6d __ LDA T17 + 0 
322e : 65 59 __ ADC T3 + 0 
3230 : 85 53 __ STA T0 + 0 
3232 : 8d f2 bf STA $bff2 ; (sstack + 8)
3235 : a5 6e __ LDA T17 + 1 
3237 : 65 5a __ ADC T3 + 1 
3239 : 85 54 __ STA T0 + 1 
323b : 8d f3 bf STA $bff3 ; (sstack + 9)
323e : 18 __ __ CLC
323f : a5 6b __ LDA T16 + 0 
3241 : 65 69 __ ADC T15 + 0 
3243 : 85 6b __ STA T16 + 0 
3245 : 8d f4 bf STA $bff4 ; (sstack + 10)
3248 : a5 6c __ LDA T16 + 1 
324a : 65 6a __ ADC T15 + 1 
324c : 85 6c __ STA T16 + 1 
324e : 8d f5 bf STA $bff5 ; (sstack + 11)
3251 : 20 8f 34 JSR $348f ; (bm_line.s1 + 0)
3254 : a9 03 __ LDA #$03
3256 : 8d f6 bf STA $bff6 ; (sstack + 12)
3259 : 18 __ __ CLC
325a : a5 5b __ LDA T4 + 0 
325c : 65 69 __ ADC T15 + 0 
325e : 85 5b __ STA T4 + 0 
3260 : 8d f4 bf STA $bff4 ; (sstack + 10)
3263 : a5 5c __ LDA T4 + 1 
3265 : 65 6a __ ADC T15 + 1 
3267 : 85 5c __ STA T4 + 1 
3269 : 8d f5 bf STA $bff5 ; (sstack + 11)
326c : 18 __ __ CLC
326d : a5 57 __ LDA T2 + 0 
326f : 65 59 __ ADC T3 + 0 
3271 : 85 57 __ STA T2 + 0 
3273 : 8d f2 bf STA $bff2 ; (sstack + 8)
3276 : a5 58 __ LDA T2 + 1 
3278 : 65 5a __ ADC T3 + 1 
327a : 85 58 __ STA T2 + 1 
327c : 8d f3 bf STA $bff3 ; (sstack + 9)
327f : a9 f4 __ LDA #$f4
3281 : 8d ea bf STA $bfea ; (sstack + 0)
3284 : a9 79 __ LDA #$79
3286 : 8d eb bf STA $bfeb ; (sstack + 1)
3289 : a9 c6 __ LDA #$c6
328b : 8d ec bf STA $bfec ; (sstack + 2)
328e : a9 76 __ LDA #$76
3290 : 8d ed bf STA $bfed ; (sstack + 3)
3293 : a5 53 __ LDA T0 + 0 
3295 : 8d ee bf STA $bfee ; (sstack + 4)
3298 : a5 54 __ LDA T0 + 1 
329a : 8d ef bf STA $bfef ; (sstack + 5)
329d : a5 6b __ LDA T16 + 0 
329f : 8d f0 bf STA $bff0 ; (sstack + 6)
32a2 : a5 6c __ LDA T16 + 1 
32a4 : 8d f1 bf STA $bff1 ; (sstack + 7)
32a7 : 20 8f 34 JSR $348f ; (bm_line.s1 + 0)
32aa : a9 f4 __ LDA #$f4
32ac : 8d ea bf STA $bfea ; (sstack + 0)
32af : a9 79 __ LDA #$79
32b1 : 8d eb bf STA $bfeb ; (sstack + 1)
32b4 : a9 c6 __ LDA #$c6
32b6 : 8d ec bf STA $bfec ; (sstack + 2)
32b9 : a9 76 __ LDA #$76
32bb : 8d ed bf STA $bfed ; (sstack + 3)
32be : a5 57 __ LDA T2 + 0 
32c0 : 8d ee bf STA $bfee ; (sstack + 4)
32c3 : a5 58 __ LDA T2 + 1 
32c5 : 8d ef bf STA $bfef ; (sstack + 5)
32c8 : a5 5b __ LDA T4 + 0 
32ca : 8d f0 bf STA $bff0 ; (sstack + 6)
32cd : a5 5c __ LDA T4 + 1 
32cf : 8d f1 bf STA $bff1 ; (sstack + 7)
32d2 : a9 03 __ LDA #$03
32d4 : 8d f6 bf STA $bff6 ; (sstack + 12)
32d7 : 18 __ __ CLC
32d8 : a5 61 __ LDA T9 + 0 
32da : 65 68 __ ADC T14 + 0 
32dc : 29 3f __ AND #$3f
32de : 85 53 __ STA T0 + 0 
32e0 : 18 __ __ CLC
32e1 : 69 10 __ ADC #$10
32e3 : 29 3f __ AND #$3f
32e5 : aa __ __ TAX
32e6 : bd 86 76 LDA $7686,x ; (sin64[0] + 0)
32e9 : 85 1b __ STA ACCU + 0 
32eb : 29 80 __ AND #$80
32ed : 10 02 __ BPL $32f1 ; (draw_gear.s8 + 339)
32ef : a9 ff __ LDA #$ff
32f1 : 85 1c __ STA ACCU + 1 
32f3 : a5 5e __ LDA T6 + 0 
32f5 : 20 e1 6d JSR $6de1 ; (mul16by8 + 0)
32f8 : 20 d0 72 JSR $72d0 ; (divs16@proxy + 0)
32fb : 18 __ __ CLC
32fc : a5 1b __ LDA ACCU + 0 
32fe : 65 67 __ ADC T13 + 0 
3300 : 85 57 __ STA T2 + 0 
3302 : 8d f2 bf STA $bff2 ; (sstack + 8)
3305 : a5 1c __ LDA ACCU + 1 
3307 : 69 00 __ ADC #$00
3309 : 85 58 __ STA T2 + 1 
330b : 8d f3 bf STA $bff3 ; (sstack + 9)
330e : a6 53 __ LDX T0 + 0 
3310 : bd 86 76 LDA $7686,x ; (sin64[0] + 0)
3313 : 85 1b __ STA ACCU + 0 
3315 : 29 80 __ AND #$80
3317 : 10 02 __ BPL $331b ; (draw_gear.s8 + 381)
3319 : a9 ff __ LDA #$ff
331b : 85 1c __ STA ACCU + 1 
331d : a5 5e __ LDA T6 + 0 
331f : 20 e1 6d JSR $6de1 ; (mul16by8 + 0)
3322 : 20 d0 72 JSR $72d0 ; (divs16@proxy + 0)
3325 : 18 __ __ CLC
3326 : a5 1b __ LDA ACCU + 0 
3328 : 69 58 __ ADC #$58
332a : 85 59 __ STA T3 + 0 
332c : 8d f4 bf STA $bff4 ; (sstack + 10)
332f : a5 1c __ LDA ACCU + 1 
3331 : 69 00 __ ADC #$00
3333 : 85 5a __ STA T3 + 1 
3335 : 8d f5 bf STA $bff5 ; (sstack + 11)
3338 : 20 8f 34 JSR $348f ; (bm_line.s1 + 0)
333b : a5 57 __ LDA T2 + 0 
333d : 85 53 __ STA T0 + 0 
333f : a5 58 __ LDA T2 + 1 
3341 : 85 54 __ STA T0 + 1 
3343 : a5 59 __ LDA T3 + 0 
3345 : 85 55 __ STA T1 + 0 
3347 : a5 5a __ LDA T3 + 1 
3349 : 85 56 __ STA T1 + 1 
334b : e6 62 __ INC T10 + 0 
334d : a5 62 __ LDA T10 + 0 
334f : c5 73 __ CMP T22 + 0 
3351 : b0 03 __ BCS $3356 ; (draw_gear.s9 + 0)
3353 : 4c 38 30 JMP $3038 ; (draw_gear.l5 + 0)
.s9:
3356 : a5 57 __ LDA T2 + 0 
3358 : 8d ee bf STA $bfee ; (sstack + 4)
335b : a5 58 __ LDA T2 + 1 
335d : 8d ef bf STA $bfef ; (sstack + 5)
3360 : a5 59 __ LDA T3 + 0 
3362 : 8d f0 bf STA $bff0 ; (sstack + 6)
3365 : a5 5a __ LDA T3 + 1 
3367 : 8d f1 bf STA $bff1 ; (sstack + 7)
336a : a5 63 __ LDA T11 + 0 
336c : 8d f2 bf STA $bff2 ; (sstack + 8)
336f : a5 64 __ LDA T11 + 1 
3371 : 8d f3 bf STA $bff3 ; (sstack + 9)
3374 : a5 65 __ LDA T12 + 0 
3376 : 8d f4 bf STA $bff4 ; (sstack + 10)
3379 : a5 66 __ LDA T12 + 1 
337b : 8d f5 bf STA $bff5 ; (sstack + 11)
337e : a9 03 __ LDA #$03
3380 : 8d f6 bf STA $bff6 ; (sstack + 12)
3383 : a9 f4 __ LDA #$f4
3385 : 8d ea bf STA $bfea ; (sstack + 0)
3388 : a9 79 __ LDA #$79
338a : 8d eb bf STA $bfeb ; (sstack + 1)
338d : a9 c6 __ LDA #$c6
338f : 8d ec bf STA $bfec ; (sstack + 2)
3392 : a9 76 __ LDA #$76
3394 : 8d ed bf STA $bfed ; (sstack + 3)
3397 : 20 8f 34 JSR $348f ; (bm_line.s1 + 0)
339a : a5 71 __ LDA T20 + 0 
339c : 85 03 __ STA WORK + 0 
339e : 85 62 __ STA T10 + 0 
33a0 : a9 00 __ LDA #$00
33a2 : 85 5d __ STA T5 + 0 
33a4 : 85 1c __ STA ACCU + 1 
33a6 : 85 04 __ STA WORK + 1 
33a8 : a9 40 __ LDA #$40
33aa : 85 1b __ STA ACCU + 0 
33ac : 20 d4 6e JSR $6ed4 ; (divmod + 0)
33af : a5 1b __ LDA ACCU + 0 
33b1 : 85 59 __ STA T3 + 0 
.l10:
33b3 : a9 f4 __ LDA #$f4
33b5 : 8d ea bf STA $bfea ; (sstack + 0)
33b8 : a9 79 __ LDA #$79
33ba : 8d eb bf STA $bfeb ; (sstack + 1)
33bd : a9 c6 __ LDA #$c6
33bf : 8d ec bf STA $bfec ; (sstack + 2)
33c2 : a9 76 __ LDA #$76
33c4 : 8d ed bf STA $bfed ; (sstack + 3)
33c7 : a9 03 __ LDA #$03
33c9 : 8d f6 bf STA $bff6 ; (sstack + 12)
33cc : a5 5d __ LDA T5 + 0 
33ce : 85 1b __ STA ACCU + 0 
33d0 : a9 00 __ LDA #$00
33d2 : 85 1c __ STA ACCU + 1 
33d4 : a5 59 __ LDA T3 + 0 
33d6 : 20 e1 6d JSR $6de1 ; (mul16by8 + 0)
33d9 : 18 __ __ CLC
33da : a5 1b __ LDA ACCU + 0 
33dc : 65 5f __ ADC T7 + 0 
33de : 29 3f __ AND #$3f
33e0 : 85 53 __ STA T0 + 0 
33e2 : 18 __ __ CLC
33e3 : 69 10 __ ADC #$10
33e5 : 29 3f __ AND #$3f
33e7 : aa __ __ TAX
33e8 : bd 86 76 LDA $7686,x ; (sin64[0] + 0)
33eb : 85 55 __ STA T1 + 0 
33ed : 85 1b __ STA ACCU + 0 
33ef : 29 80 __ AND #$80
33f1 : 10 02 __ BPL $33f5 ; (draw_gear.l10 + 66)
33f3 : a9 ff __ LDA #$ff
33f5 : 85 56 __ STA T1 + 1 
33f7 : 85 1c __ STA ACCU + 1 
33f9 : a5 72 __ LDA T21 + 0 
33fb : 20 e1 6d JSR $6de1 ; (mul16by8 + 0)
33fe : 20 d0 72 JSR $72d0 ; (divs16@proxy + 0)
3401 : 18 __ __ CLC
3402 : a5 1b __ LDA ACCU + 0 
3404 : 65 67 __ ADC T13 + 0 
3406 : 8d ee bf STA $bfee ; (sstack + 4)
3409 : a5 1c __ LDA ACCU + 1 
340b : 69 00 __ ADC #$00
340d : 8d ef bf STA $bfef ; (sstack + 5)
3410 : a6 53 __ LDX T0 + 0 
3412 : bd 86 76 LDA $7686,x ; (sin64[0] + 0)
3415 : 85 53 __ STA T0 + 0 
3417 : 85 1b __ STA ACCU + 0 
3419 : 29 80 __ AND #$80
341b : 10 02 __ BPL $341f ; (draw_gear.l10 + 108)
341d : a9 ff __ LDA #$ff
341f : 85 54 __ STA T0 + 1 
3421 : 85 1c __ STA ACCU + 1 
3423 : a5 72 __ LDA T21 + 0 
3425 : 20 e1 6d JSR $6de1 ; (mul16by8 + 0)
3428 : 20 d0 72 JSR $72d0 ; (divs16@proxy + 0)
342b : 18 __ __ CLC
342c : a5 1b __ LDA ACCU + 0 
342e : 69 58 __ ADC #$58
3430 : 8d f0 bf STA $bff0 ; (sstack + 6)
3433 : a5 1c __ LDA ACCU + 1 
3435 : 69 00 __ ADC #$00
3437 : 8d f1 bf STA $bff1 ; (sstack + 7)
343a : a5 55 __ LDA T1 + 0 
343c : 85 1b __ STA ACCU + 0 
343e : a5 56 __ LDA T1 + 1 
3440 : 85 1c __ STA ACCU + 1 
3442 : a5 5e __ LDA T6 + 0 
3444 : 20 e1 6d JSR $6de1 ; (mul16by8 + 0)
3447 : 20 d0 72 JSR $72d0 ; (divs16@proxy + 0)
344a : 18 __ __ CLC
344b : a5 1b __ LDA ACCU + 0 
344d : 65 67 __ ADC T13 + 0 
344f : 8d f2 bf STA $bff2 ; (sstack + 8)
3452 : a5 1c __ LDA ACCU + 1 
3454 : 69 00 __ ADC #$00
3456 : 8d f3 bf STA $bff3 ; (sstack + 9)
3459 : a5 53 __ LDA T0 + 0 
345b : 85 1b __ STA ACCU + 0 
345d : a5 54 __ LDA T0 + 1 
345f : 85 1c __ STA ACCU + 1 
3461 : a5 5e __ LDA T6 + 0 
3463 : 20 e1 6d JSR $6de1 ; (mul16by8 + 0)
3466 : 20 d0 72 JSR $72d0 ; (divs16@proxy + 0)
3469 : 18 __ __ CLC
346a : a5 1b __ LDA ACCU + 0 
346c : 69 58 __ ADC #$58
346e : 8d f4 bf STA $bff4 ; (sstack + 10)
3471 : a5 1c __ LDA ACCU + 1 
3473 : 69 00 __ ADC #$00
3475 : 8d f5 bf STA $bff5 ; (sstack + 11)
3478 : 20 8f 34 JSR $348f ; (bm_line.s1 + 0)
347b : e6 5d __ INC T5 + 0 
347d : c6 62 __ DEC T10 + 0 
347f : f0 03 __ BEQ $3484 ; (draw_gear.s3 + 0)
3481 : 4c b3 33 JMP $33b3 ; (draw_gear.l10 + 0)
.s3:
3484 : a2 20 __ LDX #$20
3486 : bd b0 bf LDA $bfb0,x ; (draw_gear@stack + 0)
3489 : 95 53 __ STA T0 + 0,x 
348b : ca __ __ DEX
348c : 10 f8 __ BPL $3486 ; (draw_gear.s3 + 2)
348e : 60 __ __ RTS
--------------------------------------------------------------------
bm_line: ; bm_line(const struct Bitmap*,const struct ClipRect*,i16,i16,i16,i16,u8,enum LineOp)->void
; 116, "/home/xahmol/oscar64/include/gfx/bitmap.h"
.s1:
348f : a2 0e __ LDX #$0e
3491 : b5 53 __ LDA T2 + 0,x 
3493 : 9d db bf STA $bfdb,x ; (bm_line@stack + 0)
3496 : ca __ __ DEX
3497 : 10 f8 __ BPL $3491 ; (bm_line.s1 + 2)
.s4:
3499 : ad f0 bf LDA $bff0 ; (sstack + 6)
349c : 85 55 __ STA T3 + 0 
349e : ad f1 bf LDA $bff1 ; (sstack + 7)
34a1 : 85 56 __ STA T3 + 1 
34a3 : ad f4 bf LDA $bff4 ; (sstack + 10)
34a6 : 85 53 __ STA T2 + 0 
34a8 : 38 __ __ SEC
34a9 : e5 55 __ SBC T3 + 0 
34ab : 85 57 __ STA T4 + 0 
34ad : ad f5 bf LDA $bff5 ; (sstack + 11)
34b0 : 85 54 __ STA T2 + 1 
34b2 : e5 56 __ SBC T3 + 1 
34b4 : 85 58 __ STA T4 + 1 
34b6 : ad f6 bf LDA $bff6 ; (sstack + 12)
34b9 : 85 61 __ STA T10 + 0 
34bb : ad ec bf LDA $bfec ; (sstack + 2)
34be : 85 59 __ STA T5 + 0 
34c0 : ad ed bf LDA $bfed ; (sstack + 3)
34c3 : 85 5a __ STA T5 + 1 
34c5 : a0 00 __ LDY #$00
34c7 : b1 59 __ LDA (T5 + 0),y 
34c9 : 85 43 __ STA T0 + 0 
34cb : c8 __ __ INY
34cc : b1 59 __ LDA (T5 + 0),y 
34ce : 85 44 __ STA T0 + 1 
34d0 : a0 04 __ LDY #$04
34d2 : b1 59 __ LDA (T5 + 0),y 
34d4 : 85 45 __ STA T1 + 0 
34d6 : ad ee bf LDA $bfee ; (sstack + 4)
34d9 : 85 5d __ STA T7 + 0 
34db : ad ef bf LDA $bfef ; (sstack + 5)
34de : 85 5e __ STA T7 + 1 
34e0 : ad f2 bf LDA $bff2 ; (sstack + 8)
34e3 : 85 5b __ STA T6 + 0 
34e5 : 38 __ __ SEC
34e6 : e5 5d __ SBC T7 + 0 
34e8 : 85 5f __ STA T8 + 0 
34ea : ad f3 bf LDA $bff3 ; (sstack + 9)
34ed : 85 5c __ STA T6 + 1 
34ef : c8 __ __ INY
34f0 : e5 5e __ SBC T7 + 1 
34f2 : 85 60 __ STA T8 + 1 
34f4 : 30 07 __ BMI $34fd ; (bm_line.s5 + 0)
.s82:
34f6 : 05 5f __ ORA T8 + 0 
34f8 : f0 03 __ BEQ $34fd ; (bm_line.s5 + 0)
34fa : 4c 27 38 JMP $3827 ; (bm_line.s64 + 0)
.s5:
34fd : a5 5e __ LDA T7 + 1 
34ff : 10 03 __ BPL $3504 ; (bm_line.s63 + 0)
3501 : 4c 73 36 JMP $3673 ; (bm_line.s3 + 0)
.s63:
3504 : c5 44 __ CMP T0 + 1 
3506 : d0 04 __ BNE $350c ; (bm_line.s62 + 0)
.s61:
3508 : a5 5d __ LDA T7 + 0 
350a : c5 43 __ CMP T0 + 0 
.s62:
350c : 90 f3 __ BCC $3501 ; (bm_line.s5 + 4)
.s6:
350e : a5 5c __ LDA T6 + 1 
3510 : 10 03 __ BPL $3515 ; (bm_line.s60 + 0)
3512 : 4c d0 37 JMP $37d0 ; (bm_line.s52 + 0)
.s60:
3515 : d1 59 __ CMP (T5 + 0),y 
3517 : d0 04 __ BNE $351d ; (bm_line.s59 + 0)
.s58:
3519 : a5 5b __ LDA T6 + 0 
351b : c5 45 __ CMP T1 + 0 
.s59:
351d : b0 e2 __ BCS $3501 ; (bm_line.s5 + 4)
.s7:
351f : a5 5c __ LDA T6 + 1 
3521 : c5 44 __ CMP T0 + 1 
3523 : d0 04 __ BNE $3529 ; (bm_line.s57 + 0)
.s56:
3525 : a5 5b __ LDA T6 + 0 
3527 : c5 43 __ CMP T0 + 0 
.s57:
3529 : 90 e7 __ BCC $3512 ; (bm_line.s6 + 4)
.s8:
352b : a5 5e __ LDA T7 + 1 
352d : d1 59 __ CMP (T5 + 0),y 
352f : d0 04 __ BNE $3535 ; (bm_line.s54 + 0)
.s51:
3531 : a5 5d __ LDA T7 + 0 
3533 : c5 45 __ CMP T1 + 0 
.s54:
3535 : 90 4e __ BCC $3585 ; (bm_line.s9 + 0)
.s50:
3537 : a5 57 __ LDA T4 + 0 
3539 : 85 0f __ STA P2 
353b : a5 58 __ LDA T4 + 1 
353d : 85 10 __ STA P3 
353f : a5 5f __ LDA T8 + 0 
3541 : 85 11 __ STA P4 
3543 : a5 60 __ LDA T8 + 1 
3545 : 85 12 __ STA P5 
3547 : 18 __ __ CLC
3548 : a5 5d __ LDA T7 + 0 
354a : 69 01 __ ADC #$01
354c : a8 __ __ TAY
354d : a5 5e __ LDA T7 + 1 
354f : 69 00 __ ADC #$00
3551 : aa __ __ TAX
3552 : 98 __ __ TYA
3553 : 38 __ __ SEC
3554 : a0 04 __ LDY #$04
3556 : f1 59 __ SBC (T5 + 0),y 
3558 : 85 0d __ STA P0 
355a : 8a __ __ TXA
355b : c8 __ __ INY
355c : f1 59 __ SBC (T5 + 0),y 
355e : 85 0e __ STA P1 
3560 : 20 09 39 JSR $3909 ; (lmuldiv16s.s4 + 0)
3563 : 38 __ __ SEC
3564 : a5 55 __ LDA T3 + 0 
3566 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
3568 : 8d f0 bf STA $bff0 ; (sstack + 6)
356b : a5 56 __ LDA T3 + 1 
356d : e5 1c __ SBC ACCU + 1 ; (clip + 1)
356f : 8d f1 bf STA $bff1 ; (sstack + 7)
3572 : a0 04 __ LDY #$04
3574 : b1 59 __ LDA (T5 + 0),y 
3576 : 38 __ __ SEC
3577 : e9 01 __ SBC #$01
3579 : aa __ __ TAX
357a : c8 __ __ INY
357b : b1 59 __ LDA (T5 + 0),y 
357d : 8e ee bf STX $bfee ; (sstack + 4)
3580 : e9 00 __ SBC #$00
3582 : 8d ef bf STA $bfef ; (sstack + 5)
.s9:
3585 : a0 02 __ LDY #$02
3587 : b1 59 __ LDA (T5 + 0),y 
3589 : 85 43 __ STA T0 + 0 
358b : c8 __ __ INY
358c : b1 59 __ LDA (T5 + 0),y 
358e : 85 44 __ STA T0 + 1 
3590 : a0 06 __ LDY #$06
3592 : b1 59 __ LDA (T5 + 0),y 
3594 : 85 45 __ STA T1 + 0 
3596 : c8 __ __ INY
3597 : a5 58 __ LDA T4 + 1 
3599 : 30 07 __ BMI $35a2 ; (bm_line.s10 + 0)
.s49:
359b : 05 57 __ ORA T4 + 0 
359d : f0 03 __ BEQ $35a2 ; (bm_line.s10 + 0)
359f : 4c d8 36 JMP $36d8 ; (bm_line.s30 + 0)
.s10:
35a2 : ad f0 bf LDA $bff0 ; (sstack + 6)
35a5 : 85 55 __ STA T3 + 0 
35a7 : ad f1 bf LDA $bff1 ; (sstack + 7)
35aa : 10 03 __ BPL $35af ; (bm_line.s29 + 0)
35ac : 4c 73 36 JMP $3673 ; (bm_line.s3 + 0)
.s29:
35af : 85 56 __ STA T3 + 1 
35b1 : c5 44 __ CMP T0 + 1 
35b3 : d0 04 __ BNE $35b9 ; (bm_line.s28 + 0)
.s27:
35b5 : a5 55 __ LDA T3 + 0 
35b7 : c5 43 __ CMP T0 + 0 
.s28:
35b9 : 90 f1 __ BCC $35ac ; (bm_line.s10 + 10)
.s11:
35bb : ad f5 bf LDA $bff5 ; (sstack + 11)
35be : 10 03 __ BPL $35c3 ; (bm_line.s26 + 0)
35c0 : 4c 7e 36 JMP $367e ; (bm_line.s17 + 0)
.s26:
35c3 : d1 59 __ CMP (T5 + 0),y 
35c5 : d0 05 __ BNE $35cc ; (bm_line.s25 + 0)
.s24:
35c7 : ad f4 bf LDA $bff4 ; (sstack + 10)
35ca : c5 45 __ CMP T1 + 0 
.s25:
35cc : b0 de __ BCS $35ac ; (bm_line.s10 + 10)
.s12:
35ce : ad f5 bf LDA $bff5 ; (sstack + 11)
35d1 : 30 ed __ BMI $35c0 ; (bm_line.s11 + 5)
.s23:
35d3 : c5 44 __ CMP T0 + 1 
35d5 : d0 05 __ BNE $35dc ; (bm_line.s22 + 0)
.s21:
35d7 : ad f4 bf LDA $bff4 ; (sstack + 10)
35da : c5 43 __ CMP T0 + 0 
.s22:
35dc : 90 e2 __ BCC $35c0 ; (bm_line.s11 + 5)
.s13:
35de : a5 56 __ LDA T3 + 1 
35e0 : d1 59 __ CMP (T5 + 0),y 
35e2 : d0 04 __ BNE $35e8 ; (bm_line.s19 + 0)
.s16:
35e4 : a5 55 __ LDA T3 + 0 
35e6 : c5 45 __ CMP T1 + 0 
.s19:
35e8 : 90 50 __ BCC $363a ; (bm_line.s14 + 0)
.s15:
35ea : a5 5f __ LDA T8 + 0 
35ec : 85 0f __ STA P2 
35ee : a5 60 __ LDA T8 + 1 
35f0 : 85 10 __ STA P3 
35f2 : a5 57 __ LDA T4 + 0 
35f4 : 85 11 __ STA P4 
35f6 : a5 58 __ LDA T4 + 1 
35f8 : 85 12 __ STA P5 
35fa : 18 __ __ CLC
35fb : a5 55 __ LDA T3 + 0 
35fd : 69 01 __ ADC #$01
35ff : a8 __ __ TAY
3600 : a5 56 __ LDA T3 + 1 
3602 : 69 00 __ ADC #$00
3604 : aa __ __ TAX
3605 : 98 __ __ TYA
3606 : 38 __ __ SEC
3607 : a0 06 __ LDY #$06
3609 : f1 59 __ SBC (T5 + 0),y 
360b : 85 0d __ STA P0 
360d : 8a __ __ TXA
360e : c8 __ __ INY
360f : f1 59 __ SBC (T5 + 0),y 
3611 : 85 0e __ STA P1 
3613 : 20 09 39 JSR $3909 ; (lmuldiv16s.s4 + 0)
3616 : ad ee bf LDA $bfee ; (sstack + 4)
3619 : 38 __ __ SEC
361a : e5 1b __ SBC ACCU + 0 ; (clip + 0)
361c : 8d ee bf STA $bfee ; (sstack + 4)
361f : ad ef bf LDA $bfef ; (sstack + 5)
3622 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
3624 : 8d ef bf STA $bfef ; (sstack + 5)
3627 : a0 06 __ LDY #$06
3629 : b1 59 __ LDA (T5 + 0),y 
362b : 38 __ __ SEC
362c : e9 01 __ SBC #$01
362e : aa __ __ TAX
362f : c8 __ __ INY
3630 : b1 59 __ LDA (T5 + 0),y 
3632 : 8e f0 bf STX $bff0 ; (sstack + 6)
3635 : e9 00 __ SBC #$00
3637 : 8d f1 bf STA $bff1 ; (sstack + 7)
.s14:
363a : ad ea bf LDA $bfea ; (sstack + 0)
363d : 85 0d __ STA P0 
363f : ad eb bf LDA $bfeb ; (sstack + 1)
3642 : 85 0e __ STA P1 
3644 : ad ee bf LDA $bfee ; (sstack + 4)
3647 : 85 0f __ STA P2 
3649 : ad ef bf LDA $bfef ; (sstack + 5)
364c : 85 10 __ STA P3 
364e : ad f0 bf LDA $bff0 ; (sstack + 6)
3651 : 85 11 __ STA P4 
3653 : ad f1 bf LDA $bff1 ; (sstack + 7)
3656 : 85 12 __ STA P5 
3658 : ad f2 bf LDA $bff2 ; (sstack + 8)
365b : 85 13 __ STA P6 
365d : ad f3 bf LDA $bff3 ; (sstack + 9)
3660 : 85 14 __ STA P7 
3662 : ad f4 bf LDA $bff4 ; (sstack + 10)
3665 : 85 15 __ STA P8 
3667 : ad f5 bf LDA $bff5 ; (sstack + 11)
366a : 85 16 __ STA P9 
366c : a5 61 __ LDA T10 + 0 
366e : 85 18 __ STA P11 
3670 : 20 c8 39 JSR $39c8 ; (bmu_line.s4 + 0)
.s3:
3673 : a2 0e __ LDX #$0e
3675 : bd db bf LDA $bfdb,x ; (bm_line@stack + 0)
3678 : 95 53 __ STA T2 + 0,x 
367a : ca __ __ DEX
367b : 10 f8 __ BPL $3675 ; (bm_line.s3 + 2)
367d : 60 __ __ RTS
.s17:
367e : a5 5f __ LDA T8 + 0 
3680 : 85 0f __ STA P2 
3682 : a5 60 __ LDA T8 + 1 
3684 : 85 10 __ STA P3 
3686 : a5 57 __ LDA T4 + 0 
3688 : 85 11 __ STA P4 
368a : a5 58 __ LDA T4 + 1 
368c : 85 12 __ STA P5 
368e : 38 __ __ SEC
368f : a5 43 __ LDA T0 + 0 
3691 : ed f4 bf SBC $bff4 ; (sstack + 10)
3694 : 85 0d __ STA P0 
3696 : a5 44 __ LDA T0 + 1 
3698 : ed f5 bf SBC $bff5 ; (sstack + 11)
369b : 85 0e __ STA P1 
369d : 20 09 39 JSR $3909 ; (lmuldiv16s.s4 + 0)
36a0 : a0 02 __ LDY #$02
36a2 : b1 59 __ LDA (T5 + 0),y 
36a4 : 8d f4 bf STA $bff4 ; (sstack + 10)
36a7 : c8 __ __ INY
36a8 : b1 59 __ LDA (T5 + 0),y 
36aa : 8d f5 bf STA $bff5 ; (sstack + 11)
36ad : ad f2 bf LDA $bff2 ; (sstack + 8)
36b0 : 18 __ __ CLC
36b1 : 65 1b __ ADC ACCU + 0 ; (clip + 0)
36b3 : 8d f2 bf STA $bff2 ; (sstack + 8)
36b6 : ad f3 bf LDA $bff3 ; (sstack + 9)
36b9 : 65 1c __ ADC ACCU + 1 ; (clip + 1)
36bb : 8d f3 bf STA $bff3 ; (sstack + 9)
36be : a0 07 __ LDY #$07
36c0 : b1 59 __ LDA (T5 + 0),y 
36c2 : 10 03 __ BPL $36c7 ; (bm_line.s20 + 0)
36c4 : 4c ea 35 JMP $35ea ; (bm_line.s15 + 0)
.s20:
36c7 : a5 56 __ LDA T3 + 1 
36c9 : d1 59 __ CMP (T5 + 0),y 
36cb : f0 03 __ BEQ $36d0 ; (bm_line.s18 + 0)
36cd : 4c e8 35 JMP $35e8 ; (bm_line.s19 + 0)
.s18:
36d0 : a5 55 __ LDA T3 + 0 
36d2 : 88 __ __ DEY
36d3 : d1 59 __ CMP (T5 + 0),y 
36d5 : 4c e8 35 JMP $35e8 ; (bm_line.s19 + 0)
.s30:
36d8 : ad f4 bf LDA $bff4 ; (sstack + 10)
36db : 85 55 __ STA T3 + 0 
36dd : ad f5 bf LDA $bff5 ; (sstack + 11)
36e0 : 30 91 __ BMI $3673 ; (bm_line.s3 + 0)
.s48:
36e2 : 85 56 __ STA T3 + 1 
36e4 : c5 44 __ CMP T0 + 1 
36e6 : d0 04 __ BNE $36ec ; (bm_line.s47 + 0)
.s46:
36e8 : a5 55 __ LDA T3 + 0 
36ea : c5 43 __ CMP T0 + 0 
.s47:
36ec : 90 85 __ BCC $3673 ; (bm_line.s3 + 0)
.s31:
36ee : ad f1 bf LDA $bff1 ; (sstack + 7)
36f1 : 10 03 __ BPL $36f6 ; (bm_line.s45 + 0)
36f3 : 4c 76 37 JMP $3776 ; (bm_line.s36 + 0)
.s45:
36f6 : d1 59 __ CMP (T5 + 0),y 
36f8 : d0 05 __ BNE $36ff ; (bm_line.s44 + 0)
.s43:
36fa : ad f0 bf LDA $bff0 ; (sstack + 6)
36fd : c5 45 __ CMP T1 + 0 
.s44:
36ff : 90 03 __ BCC $3704 ; (bm_line.s32 + 0)
3701 : 4c 73 36 JMP $3673 ; (bm_line.s3 + 0)
.s32:
3704 : ad f1 bf LDA $bff1 ; (sstack + 7)
3707 : 30 6d __ BMI $3776 ; (bm_line.s36 + 0)
.s42:
3709 : c5 44 __ CMP T0 + 1 
370b : d0 05 __ BNE $3712 ; (bm_line.s41 + 0)
.s40:
370d : ad f0 bf LDA $bff0 ; (sstack + 6)
3710 : c5 43 __ CMP T0 + 0 
.s41:
3712 : 90 62 __ BCC $3776 ; (bm_line.s36 + 0)
.s33:
3714 : a5 56 __ LDA T3 + 1 
3716 : d1 59 __ CMP (T5 + 0),y 
3718 : d0 04 __ BNE $371e ; (bm_line.s38 + 0)
.s35:
371a : a5 55 __ LDA T3 + 0 
371c : c5 45 __ CMP T1 + 0 
.s38:
371e : b0 03 __ BCS $3723 ; (bm_line.s34 + 0)
3720 : 4c 3a 36 JMP $363a ; (bm_line.s14 + 0)
.s34:
3723 : a5 5f __ LDA T8 + 0 
3725 : 85 0f __ STA P2 
3727 : a5 60 __ LDA T8 + 1 
3729 : 85 10 __ STA P3 
372b : a5 57 __ LDA T4 + 0 
372d : 85 11 __ STA P4 
372f : a5 58 __ LDA T4 + 1 
3731 : 85 12 __ STA P5 
3733 : 18 __ __ CLC
3734 : a5 55 __ LDA T3 + 0 
3736 : 69 01 __ ADC #$01
3738 : a8 __ __ TAY
3739 : a5 56 __ LDA T3 + 1 
373b : 69 00 __ ADC #$00
373d : aa __ __ TAX
373e : 98 __ __ TYA
373f : 38 __ __ SEC
3740 : a0 06 __ LDY #$06
3742 : f1 59 __ SBC (T5 + 0),y 
3744 : 85 0d __ STA P0 
3746 : 8a __ __ TXA
3747 : c8 __ __ INY
3748 : f1 59 __ SBC (T5 + 0),y 
374a : 85 0e __ STA P1 
374c : 20 09 39 JSR $3909 ; (lmuldiv16s.s4 + 0)
374f : ad f2 bf LDA $bff2 ; (sstack + 8)
3752 : 38 __ __ SEC
3753 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
3755 : 8d f2 bf STA $bff2 ; (sstack + 8)
3758 : ad f3 bf LDA $bff3 ; (sstack + 9)
375b : e5 1c __ SBC ACCU + 1 ; (clip + 1)
375d : 8d f3 bf STA $bff3 ; (sstack + 9)
3760 : a0 06 __ LDY #$06
3762 : b1 59 __ LDA (T5 + 0),y 
3764 : 38 __ __ SEC
3765 : e9 01 __ SBC #$01
3767 : aa __ __ TAX
3768 : c8 __ __ INY
3769 : b1 59 __ LDA (T5 + 0),y 
376b : 8e f4 bf STX $bff4 ; (sstack + 10)
376e : e9 00 __ SBC #$00
3770 : 8d f5 bf STA $bff5 ; (sstack + 11)
3773 : 4c 3a 36 JMP $363a ; (bm_line.s14 + 0)
.s36:
3776 : a5 5f __ LDA T8 + 0 
3778 : 85 0f __ STA P2 
377a : a5 60 __ LDA T8 + 1 
377c : 85 10 __ STA P3 
377e : a5 57 __ LDA T4 + 0 
3780 : 85 11 __ STA P4 
3782 : a5 58 __ LDA T4 + 1 
3784 : 85 12 __ STA P5 
3786 : 38 __ __ SEC
3787 : a5 43 __ LDA T0 + 0 
3789 : ed f0 bf SBC $bff0 ; (sstack + 6)
378c : 85 0d __ STA P0 
378e : a5 44 __ LDA T0 + 1 
3790 : ed f1 bf SBC $bff1 ; (sstack + 7)
3793 : 85 0e __ STA P1 
3795 : 20 09 39 JSR $3909 ; (lmuldiv16s.s4 + 0)
3798 : a0 02 __ LDY #$02
379a : b1 59 __ LDA (T5 + 0),y 
379c : 8d f0 bf STA $bff0 ; (sstack + 6)
379f : c8 __ __ INY
37a0 : b1 59 __ LDA (T5 + 0),y 
37a2 : 8d f1 bf STA $bff1 ; (sstack + 7)
37a5 : ad ee bf LDA $bfee ; (sstack + 4)
37a8 : 18 __ __ CLC
37a9 : 65 1b __ ADC ACCU + 0 ; (clip + 0)
37ab : 8d ee bf STA $bfee ; (sstack + 4)
37ae : ad ef bf LDA $bfef ; (sstack + 5)
37b1 : 65 1c __ ADC ACCU + 1 ; (clip + 1)
37b3 : 8d ef bf STA $bfef ; (sstack + 5)
37b6 : a0 07 __ LDY #$07
37b8 : b1 59 __ LDA (T5 + 0),y 
37ba : 10 03 __ BPL $37bf ; (bm_line.s39 + 0)
37bc : 4c 23 37 JMP $3723 ; (bm_line.s34 + 0)
.s39:
37bf : a5 56 __ LDA T3 + 1 
37c1 : d1 59 __ CMP (T5 + 0),y 
37c3 : f0 03 __ BEQ $37c8 ; (bm_line.s37 + 0)
37c5 : 4c 1e 37 JMP $371e ; (bm_line.s38 + 0)
.s37:
37c8 : a5 55 __ LDA T3 + 0 
37ca : 88 __ __ DEY
37cb : d1 59 __ CMP (T5 + 0),y 
37cd : 4c 1e 37 JMP $371e ; (bm_line.s38 + 0)
.s52:
37d0 : a5 57 __ LDA T4 + 0 
37d2 : 85 0f __ STA P2 
37d4 : a5 58 __ LDA T4 + 1 
37d6 : 85 10 __ STA P3 
37d8 : a5 5f __ LDA T8 + 0 
37da : 85 11 __ STA P4 
37dc : a5 60 __ LDA T8 + 1 
37de : 85 12 __ STA P5 
37e0 : 38 __ __ SEC
37e1 : a5 43 __ LDA T0 + 0 
37e3 : e5 5b __ SBC T6 + 0 
37e5 : 85 0d __ STA P0 
37e7 : a5 44 __ LDA T0 + 1 
37e9 : e5 5c __ SBC T6 + 1 
37eb : 85 0e __ STA P1 
37ed : 20 09 39 JSR $3909 ; (lmuldiv16s.s4 + 0)
37f0 : 18 __ __ CLC
37f1 : a5 1b __ LDA ACCU + 0 ; (clip + 0)
37f3 : 65 53 __ ADC T2 + 0 
37f5 : aa __ __ TAX
37f6 : a0 00 __ LDY #$00
37f8 : b1 59 __ LDA (T5 + 0),y 
37fa : 8d f2 bf STA $bff2 ; (sstack + 8)
37fd : c8 __ __ INY
37fe : b1 59 __ LDA (T5 + 0),y 
3800 : 8e f4 bf STX $bff4 ; (sstack + 10)
3803 : 8d f3 bf STA $bff3 ; (sstack + 9)
3806 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
3808 : 65 54 __ ADC T2 + 1 
380a : 8d f5 bf STA $bff5 ; (sstack + 11)
380d : a0 05 __ LDY #$05
380f : b1 59 __ LDA (T5 + 0),y 
3811 : 10 03 __ BPL $3816 ; (bm_line.s55 + 0)
3813 : 4c 37 35 JMP $3537 ; (bm_line.s50 + 0)
.s55:
3816 : a5 5e __ LDA T7 + 1 
3818 : d1 59 __ CMP (T5 + 0),y 
381a : f0 03 __ BEQ $381f ; (bm_line.s53 + 0)
381c : 4c 35 35 JMP $3535 ; (bm_line.s54 + 0)
.s53:
381f : a5 5d __ LDA T7 + 0 
3821 : 88 __ __ DEY
3822 : d1 59 __ CMP (T5 + 0),y 
3824 : 4c 35 35 JMP $3535 ; (bm_line.s54 + 0)
.s64:
3827 : a5 5c __ LDA T6 + 1 
3829 : 10 03 __ BPL $382e ; (bm_line.s81 + 0)
382b : 4c 73 36 JMP $3673 ; (bm_line.s3 + 0)
.s81:
382e : c5 44 __ CMP T0 + 1 
3830 : d0 04 __ BNE $3836 ; (bm_line.s80 + 0)
.s79:
3832 : a5 5b __ LDA T6 + 0 
3834 : c5 43 __ CMP T0 + 0 
.s80:
3836 : 90 f3 __ BCC $382b ; (bm_line.s64 + 4)
.s65:
3838 : a5 5e __ LDA T7 + 1 
383a : 30 76 __ BMI $38b2 ; (bm_line.s70 + 0)
.s78:
383c : d1 59 __ CMP (T5 + 0),y 
383e : d0 04 __ BNE $3844 ; (bm_line.s77 + 0)
.s76:
3840 : a5 5d __ LDA T7 + 0 
3842 : c5 45 __ CMP T1 + 0 
.s77:
3844 : b0 e5 __ BCS $382b ; (bm_line.s64 + 4)
.s66:
3846 : a5 5e __ LDA T7 + 1 
3848 : c5 44 __ CMP T0 + 1 
384a : d0 04 __ BNE $3850 ; (bm_line.s75 + 0)
.s74:
384c : a5 5d __ LDA T7 + 0 
384e : c5 43 __ CMP T0 + 0 
.s75:
3850 : 90 60 __ BCC $38b2 ; (bm_line.s70 + 0)
.s67:
3852 : a5 5c __ LDA T6 + 1 
3854 : d1 59 __ CMP (T5 + 0),y 
3856 : d0 04 __ BNE $385c ; (bm_line.s72 + 0)
.s69:
3858 : a5 5b __ LDA T6 + 0 
385a : c5 45 __ CMP T1 + 0 
.s72:
385c : b0 03 __ BCS $3861 ; (bm_line.s68 + 0)
385e : 4c 85 35 JMP $3585 ; (bm_line.s9 + 0)
.s68:
3861 : a5 57 __ LDA T4 + 0 
3863 : 85 0f __ STA P2 
3865 : a5 58 __ LDA T4 + 1 
3867 : 85 10 __ STA P3 
3869 : a5 5f __ LDA T8 + 0 
386b : 85 11 __ STA P4 
386d : a5 60 __ LDA T8 + 1 
386f : 85 12 __ STA P5 
3871 : 18 __ __ CLC
3872 : a5 5b __ LDA T6 + 0 
3874 : 69 01 __ ADC #$01
3876 : a8 __ __ TAY
3877 : a5 5c __ LDA T6 + 1 
3879 : 69 00 __ ADC #$00
387b : aa __ __ TAX
387c : 98 __ __ TYA
387d : 38 __ __ SEC
387e : a0 04 __ LDY #$04
3880 : f1 59 __ SBC (T5 + 0),y 
3882 : 85 0d __ STA P0 
3884 : 8a __ __ TXA
3885 : c8 __ __ INY
3886 : f1 59 __ SBC (T5 + 0),y 
3888 : 85 0e __ STA P1 
388a : 20 09 39 JSR $3909 ; (lmuldiv16s.s4 + 0)
388d : 38 __ __ SEC
388e : a5 53 __ LDA T2 + 0 
3890 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
3892 : 8d f4 bf STA $bff4 ; (sstack + 10)
3895 : a5 54 __ LDA T2 + 1 
3897 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
3899 : 8d f5 bf STA $bff5 ; (sstack + 11)
389c : a0 04 __ LDY #$04
389e : b1 59 __ LDA (T5 + 0),y 
38a0 : 38 __ __ SEC
38a1 : e9 01 __ SBC #$01
38a3 : aa __ __ TAX
38a4 : c8 __ __ INY
38a5 : b1 59 __ LDA (T5 + 0),y 
38a7 : 8e f2 bf STX $bff2 ; (sstack + 8)
38aa : e9 00 __ SBC #$00
38ac : 8d f3 bf STA $bff3 ; (sstack + 9)
38af : 4c 85 35 JMP $3585 ; (bm_line.s9 + 0)
.s70:
38b2 : a5 57 __ LDA T4 + 0 
38b4 : 85 0f __ STA P2 
38b6 : a5 58 __ LDA T4 + 1 
38b8 : 85 10 __ STA P3 
38ba : a5 5f __ LDA T8 + 0 
38bc : 85 11 __ STA P4 
38be : a5 60 __ LDA T8 + 1 
38c0 : 85 12 __ STA P5 
38c2 : 38 __ __ SEC
38c3 : a5 43 __ LDA T0 + 0 
38c5 : e5 5d __ SBC T7 + 0 
38c7 : 85 0d __ STA P0 
38c9 : a5 44 __ LDA T0 + 1 
38cb : e5 5e __ SBC T7 + 1 
38cd : 85 0e __ STA P1 
38cf : 20 09 39 JSR $3909 ; (lmuldiv16s.s4 + 0)
38d2 : 18 __ __ CLC
38d3 : a5 1b __ LDA ACCU + 0 ; (clip + 0)
38d5 : 65 55 __ ADC T3 + 0 
38d7 : aa __ __ TAX
38d8 : a0 00 __ LDY #$00
38da : b1 59 __ LDA (T5 + 0),y 
38dc : 8d ee bf STA $bfee ; (sstack + 4)
38df : c8 __ __ INY
38e0 : b1 59 __ LDA (T5 + 0),y 
38e2 : 8e f0 bf STX $bff0 ; (sstack + 6)
38e5 : 8d ef bf STA $bfef ; (sstack + 5)
38e8 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
38ea : 65 56 __ ADC T3 + 1 
38ec : 8d f1 bf STA $bff1 ; (sstack + 7)
38ef : a0 05 __ LDY #$05
38f1 : b1 59 __ LDA (T5 + 0),y 
38f3 : 10 03 __ BPL $38f8 ; (bm_line.s73 + 0)
38f5 : 4c 61 38 JMP $3861 ; (bm_line.s68 + 0)
.s73:
38f8 : a5 5c __ LDA T6 + 1 
38fa : d1 59 __ CMP (T5 + 0),y 
38fc : f0 03 __ BEQ $3901 ; (bm_line.s71 + 0)
38fe : 4c 5c 38 JMP $385c ; (bm_line.s72 + 0)
.s71:
3901 : a5 5b __ LDA T6 + 0 
3903 : 88 __ __ DEY
3904 : d1 59 __ CMP (T5 + 0),y 
3906 : 4c 5c 38 JMP $385c ; (bm_line.s72 + 0)
--------------------------------------------------------------------
lmuldiv16s: ; lmuldiv16s(i16,i16,i16)->i16
;  42, "/home/xahmol/oscar64/include/fixmath.h"
.s4:
3909 : a9 00 __ LDA #$00
390b : 24 0e __ BIT P1 ; (a + 1)
390d : 10 0d __ BPL $391c ; (lmuldiv16s.s5 + 0)
.s10:
390f : 38 __ __ SEC
3910 : e5 0d __ SBC P0 ; (a + 0)
3912 : 85 0d __ STA P0 ; (a + 0)
3914 : a9 00 __ LDA #$00
3916 : e5 0e __ SBC P1 ; (a + 1)
3918 : 85 0e __ STA P1 ; (a + 1)
391a : a9 01 __ LDA #$01
.s5:
391c : 85 43 __ STA T1 + 0 
391e : 24 10 __ BIT P3 ; (b + 1)
3920 : 10 14 __ BPL $3936 ; (lmuldiv16s.s6 + 0)
.s9:
3922 : 38 __ __ SEC
3923 : a9 00 __ LDA #$00
3925 : e5 0f __ SBC P2 ; (b + 0)
3927 : 85 0f __ STA P2 ; (b + 0)
3929 : a9 00 __ LDA #$00
392b : e5 10 __ SBC P3 ; (b + 1)
392d : 85 10 __ STA P3 ; (b + 1)
392f : a9 00 __ LDA #$00
3931 : c5 43 __ CMP T1 + 0 
3933 : 2a __ __ ROL
3934 : 85 43 __ STA T1 + 0 
.s6:
3936 : 24 12 __ BIT P5 ; (c + 1)
3938 : 10 14 __ BPL $394e ; (lmuldiv16s.s7 + 0)
.s8:
393a : 38 __ __ SEC
393b : a9 00 __ LDA #$00
393d : e5 11 __ SBC P4 ; (c + 0)
393f : 85 11 __ STA P4 ; (c + 0)
3941 : a9 00 __ LDA #$00
3943 : e5 12 __ SBC P5 ; (c + 1)
3945 : 85 12 __ STA P5 ; (c + 1)
3947 : a9 00 __ LDA #$00
3949 : c5 43 __ CMP T1 + 0 
394b : 2a __ __ ROL
394c : 85 43 __ STA T1 + 0 
.s7:
394e : a9 00 __ LDA #$00
3950 : 85 05 __ STA WORK + 2 
3952 : 85 06 __ STA WORK + 3 
3954 : a5 0d __ LDA P0 ; (a + 0)
3956 : 38 __ __ SEC
3957 : a0 08 __ LDY #$08
3959 : 6a __ __ ROR
395a : 90 0f __ BCC $396b ; (lmuldiv16s.s7 + 29)
395c : aa __ __ TAX
395d : 18 __ __ CLC
395e : a5 05 __ LDA WORK + 2 
3960 : 65 0f __ ADC P2 ; (b + 0)
3962 : 85 05 __ STA WORK + 2 
3964 : a5 06 __ LDA WORK + 3 
3966 : 65 10 __ ADC P3 ; (b + 1)
3968 : 85 06 __ STA WORK + 3 
396a : 8a __ __ TXA
396b : 66 06 __ ROR WORK + 3 
396d : 66 05 __ ROR WORK + 2 
396f : 88 __ __ DEY
3970 : d0 e7 __ BNE $3959 ; (lmuldiv16s.s7 + 11)
3972 : 6a __ __ ROR
3973 : 90 07 __ BCC $397c ; (lmuldiv16s.s7 + 46)
3975 : 85 03 __ STA WORK + 0 
3977 : a5 0e __ LDA P1 ; (a + 1)
3979 : 18 __ __ CLC
397a : 90 db __ BCC $3957 ; (lmuldiv16s.s7 + 9)
397c : 38 __ __ SEC
397d : 85 04 __ STA WORK + 1 
397f : a2 08 __ LDX #$08
3981 : 26 04 __ ROL WORK + 1 
3983 : 26 05 __ ROL WORK + 2 
3985 : 26 06 __ ROL WORK + 3 
3987 : 90 0c __ BCC $3995 ; (lmuldiv16s.s7 + 71)
3989 : a5 05 __ LDA WORK + 2 
398b : e5 11 __ SBC P4 ; (c + 0)
398d : a8 __ __ TAY
398e : a5 06 __ LDA WORK + 3 
3990 : e5 12 __ SBC P5 ; (c + 1)
3992 : 38 __ __ SEC
3993 : b0 0c __ BCS $39a1 ; (lmuldiv16s.s7 + 83)
3995 : 38 __ __ SEC
3996 : a5 05 __ LDA WORK + 2 
3998 : e5 11 __ SBC P4 ; (c + 0)
399a : a8 __ __ TAY
399b : a5 06 __ LDA WORK + 3 
399d : e5 12 __ SBC P5 ; (c + 1)
399f : 90 04 __ BCC $39a5 ; (lmuldiv16s.s7 + 87)
39a1 : 85 06 __ STA WORK + 3 
39a3 : 84 05 __ STY WORK + 2 
39a5 : ca __ __ DEX
39a6 : d0 d9 __ BNE $3981 ; (lmuldiv16s.s7 + 51)
39a8 : a5 04 __ LDA WORK + 1 
39aa : 2a __ __ ROL
39ab : 90 07 __ BCC $39b4 ; (lmuldiv16s.s7 + 102)
39ad : 85 1c __ STA ACCU + 1 
39af : a5 03 __ LDA WORK + 0 
39b1 : 18 __ __ CLC
39b2 : 90 c9 __ BCC $397d ; (lmuldiv16s.s7 + 47)
39b4 : 85 1b __ STA ACCU + 0 
39b6 : a5 43 __ LDA T1 + 0 
39b8 : f0 0d __ BEQ $39c7 ; (lmuldiv16s.s3 + 0)
39ba : 38 __ __ SEC
39bb : a9 00 __ LDA #$00
39bd : e5 1b __ SBC ACCU + 0 
39bf : 85 1b __ STA ACCU + 0 
39c1 : a9 00 __ LDA #$00
39c3 : e5 1c __ SBC ACCU + 1 
39c5 : 85 1c __ STA ACCU + 1 
.s3:
39c7 : 60 __ __ RTS
--------------------------------------------------------------------
bmu_line: ; bmu_line(const struct Bitmap*,i16,i16,i16,i16,u8,enum LineOp)->void
; 113, "/home/xahmol/oscar64/include/gfx/bitmap.h"
.s4:
39c8 : a5 18 __ LDA P11 ; (op + 0)
39ca : d0 02 __ BNE $39ce ; (bmu_line.s6 + 0)
.s5:
39cc : e6 18 __ INC P11 ; (op + 0)
.s6:
39ce : 38 __ __ SEC
39cf : a5 13 __ LDA P6 ; (x1 + 0)
39d1 : e5 0f __ SBC P2 ; (x0 + 0)
39d3 : 85 46 __ STA T2 + 0 
39d5 : a5 14 __ LDA P7 ; (x1 + 1)
39d7 : e5 10 __ SBC P3 ; (x0 + 1)
39d9 : 85 47 __ STA T2 + 1 
39db : 10 11 __ BPL $39ee ; (bmu_line.s7 + 0)
.s52:
39dd : 38 __ __ SEC
39de : a9 00 __ LDA #$00
39e0 : e5 46 __ SBC T2 + 0 
39e2 : 85 46 __ STA T2 + 0 
39e4 : a9 00 __ LDA #$00
39e6 : e5 47 __ SBC T2 + 1 
39e8 : 85 47 __ STA T2 + 1 
39ea : a9 01 __ LDA #$01
39ec : d0 02 __ BNE $39f0 ; (bmu_line.s8 + 0)
.s7:
39ee : a9 00 __ LDA #$00
.s8:
39f0 : 85 51 __ STA T11 + 0 
39f2 : 38 __ __ SEC
39f3 : a5 15 __ LDA P8 ; (y1 + 0)
39f5 : e5 11 __ SBC P4 ; (y0 + 0)
39f7 : 85 43 __ STA T0 + 0 
39f9 : a5 16 __ LDA P9 ; (y1 + 1)
39fb : e5 12 __ SBC P5 ; (y0 + 1)
39fd : 85 44 __ STA T0 + 1 
39ff : 10 11 __ BPL $3a12 ; (bmu_line.s9 + 0)
.s51:
3a01 : 38 __ __ SEC
3a02 : a9 00 __ LDA #$00
3a04 : e5 43 __ SBC T0 + 0 
3a06 : 85 43 __ STA T0 + 0 
3a08 : a9 00 __ LDA #$00
3a0a : e5 44 __ SBC T0 + 1 
3a0c : 85 44 __ STA T0 + 1 
3a0e : a9 01 __ LDA #$01
3a10 : d0 02 __ BNE $3a14 ; (bmu_line.s10 + 0)
.s9:
3a12 : a9 00 __ LDA #$00
.s10:
3a14 : 85 52 __ STA T12 + 0 
3a16 : a5 44 __ LDA T0 + 1 
3a18 : c5 47 __ CMP T2 + 1 
3a1a : d0 04 __ BNE $3a20 ; (bmu_line.s50 + 0)
.s49:
3a1c : a5 43 __ LDA T0 + 0 
3a1e : c5 46 __ CMP T2 + 0 
.s50:
3a20 : b0 06 __ BCS $3a28 ; (bmu_line.s11 + 0)
.s48:
3a22 : a5 47 __ LDA T2 + 1 
3a24 : a6 46 __ LDX T2 + 0 
3a26 : 90 04 __ BCC $3a2c ; (bmu_line.s12 + 0)
.s11:
3a28 : a5 44 __ LDA T0 + 1 
3a2a : a6 43 __ LDX T0 + 0 
.s12:
3a2c : 86 48 __ STX T4 + 0 
3a2e : 85 49 __ STA T4 + 1 
3a30 : 38 __ __ SEC
3a31 : a5 43 __ LDA T0 + 0 
3a33 : e5 46 __ SBC T2 + 0 
3a35 : 85 4a __ STA T5 + 0 
3a37 : a5 44 __ LDA T0 + 1 
3a39 : e5 47 __ SBC T2 + 1 
3a3b : 85 4b __ STA T5 + 1 
3a3d : a5 4a __ LDA T5 + 0 
3a3f : 4a __ __ LSR
3a40 : b0 0c __ BCS $3a4e ; (bmu_line.s47 + 0)
.s13:
3a42 : a5 4b __ LDA T5 + 1 
3a44 : c9 80 __ CMP #$80
3a46 : 6a __ __ ROR
3a47 : 85 4b __ STA T5 + 1 
3a49 : 66 4a __ ROR T5 + 0 
3a4b : 4c 56 3a JMP $3a56 ; (bmu_line.s14 + 0)
.s47:
3a4e : 06 43 __ ASL T0 + 0 
3a50 : 26 44 __ ROL T0 + 1 
3a52 : 06 46 __ ASL T2 + 0 
3a54 : 26 47 __ ROL T2 + 1 
.s14:
3a56 : a0 00 __ LDY #$00
3a58 : b1 0d __ LDA (P0),y ; (bm + 0)
3a5a : 85 4d __ STA T7 + 0 
3a5c : c8 __ __ INY
3a5d : b1 0d __ LDA (P0),y ; (bm + 0)
3a5f : 85 4e __ STA T7 + 1 
3a61 : a0 04 __ LDY #$04
3a63 : b1 0d __ LDA (P0),y ; (bm + 0)
3a65 : aa __ __ TAX
3a66 : 0a __ __ ASL
3a67 : 85 4f __ STA T8 + 0 
3a69 : a9 a0 __ LDA #$a0
3a6b : 8d 00 86 STA $8600 ; (BLIT_CODE[0] + 0)
3a6e : a9 a2 __ LDA #$a2
3a70 : 8d 02 86 STA $8602 ; (BLIT_CODE[0] + 2)
3a73 : a9 a5 __ LDA #$a5
3a75 : 8d 04 86 STA $8604 ; (BLIT_CODE[0] + 4)
3a78 : a9 0a __ LDA #$0a
3a7a : 8d 05 86 STA $8605 ; (BLIT_CODE[0] + 5)
3a7d : a9 00 __ LDA #$00
3a7f : 2a __ __ ROL
3a80 : 06 4f __ ASL T8 + 0 
3a82 : 2a __ __ ROL
3a83 : 06 4f __ ASL T8 + 0 
3a85 : 2a __ __ ROL
3a86 : 85 50 __ STA T8 + 1 
3a88 : a5 52 __ LDA T12 + 0 
3a8a : f0 0d __ BEQ $3a99 ; (bmu_line.s15 + 0)
.s46:
3a8c : 38 __ __ SEC
3a8d : a9 00 __ LDA #$00
3a8f : e5 4f __ SBC T8 + 0 
3a91 : 85 4f __ STA T8 + 0 
3a93 : a9 00 __ LDA #$00
3a95 : e5 50 __ SBC T8 + 1 
3a97 : 85 50 __ STA T8 + 1 
.s15:
3a99 : a5 11 __ LDA P4 ; (y0 + 0)
3a9b : 29 f8 __ AND #$f8
3a9d : 85 1b __ STA ACCU + 0 
3a9f : a5 12 __ LDA P5 ; (y0 + 1)
3aa1 : 85 1c __ STA ACCU + 1 
3aa3 : 8a __ __ TXA
3aa4 : 20 e1 6d JSR $6de1 ; (mul16by8 + 0)
3aa7 : 18 __ __ CLC
3aa8 : a5 4d __ LDA T7 + 0 
3aaa : 65 1b __ ADC ACCU + 0 
3aac : 85 4d __ STA T7 + 0 
3aae : a5 4e __ LDA T7 + 1 
3ab0 : 65 1c __ ADC ACCU + 1 
3ab2 : aa __ __ TAX
3ab3 : a5 0f __ LDA P2 ; (x0 + 0)
3ab5 : 29 f8 __ AND #$f8
3ab7 : 18 __ __ CLC
3ab8 : 65 4d __ ADC T7 + 0 
3aba : 85 4d __ STA T7 + 0 
3abc : 8a __ __ TXA
3abd : 65 10 __ ADC P3 ; (x0 + 1)
3abf : 85 4e __ STA T7 + 1 
3ac1 : a5 46 __ LDA T2 + 0 
3ac3 : 05 43 __ ORA T0 + 0 
3ac5 : 29 80 __ AND #$80
3ac7 : 85 4c __ STA T6 + 0 
3ac9 : a5 47 __ LDA T2 + 1 
3acb : 05 44 __ ORA T0 + 1 
3acd : 05 4c __ ORA T6 + 0 
3acf : f0 02 __ BEQ $3ad3 ; (bmu_line.s56 + 0)
.s55:
3ad1 : a9 01 __ LDA #$01
.s56:
3ad3 : 85 1c __ STA ACCU + 1 
3ad5 : a5 11 __ LDA P4 ; (y0 + 0)
3ad7 : 29 07 __ AND #$07
3ad9 : 8d 01 86 STA $8601 ; (BLIT_CODE[0] + 1)
3adc : a6 48 __ LDX T4 + 0 
3ade : e8 __ __ INX
3adf : 8e 03 86 STX $8603 ; (BLIT_CODE[0] + 3)
3ae2 : a5 0f __ LDA P2 ; (x0 + 0)
3ae4 : 29 07 __ AND #$07
3ae6 : aa __ __ TAX
3ae7 : a5 18 __ LDA P11 ; (op + 0)
3ae9 : c9 02 __ CMP #$02
3aeb : d0 20 __ BNE $3b0d ; (bmu_line.s16 + 0)
.s45:
3aed : a9 49 __ LDA #$49
3aef : 8d 06 86 STA $8606 ; (BLIT_CODE[0] + 6)
3af2 : a9 ff __ LDA #$ff
3af4 : 8d 07 86 STA $8607 ; (BLIT_CODE[0] + 7)
3af7 : a9 31 __ LDA #$31
3af9 : 8d 08 86 STA $8608 ; (BLIT_CODE[0] + 8)
3afc : a9 03 __ LDA #$03
3afe : 8d 09 86 STA $8609 ; (BLIT_CODE[0] + 9)
3b01 : 8d 0b 86 STA $860b ; (BLIT_CODE[0] + 11)
3b04 : a9 91 __ LDA #$91
3b06 : 8d 0a 86 STA $860a ; (BLIT_CODE[0] + 10)
3b09 : a9 0c __ LDA #$0c
3b0b : d0 21 __ BNE $3b2e ; (bmu_line.s19 + 0)
.s16:
3b0d : b0 03 __ BCS $3b12 ; (bmu_line.s17 + 0)
3b0f : 4c fa 3d JMP $3dfa ; (bmu_line.s42 + 0)
.s17:
3b12 : c9 03 __ CMP #$03
3b14 : f0 04 __ BEQ $3b1a ; (bmu_line.s40 + 0)
.s18:
3b16 : a9 06 __ LDA #$06
3b18 : d0 14 __ BNE $3b2e ; (bmu_line.s19 + 0)
.s40:
3b1a : a9 51 __ LDA #$51
.s41:
3b1c : 8d 06 86 STA $8606 ; (BLIT_CODE[0] + 6)
3b1f : a9 03 __ LDA #$03
3b21 : 8d 07 86 STA $8607 ; (BLIT_CODE[0] + 7)
3b24 : 8d 09 86 STA $8609 ; (BLIT_CODE[0] + 9)
3b27 : a9 91 __ LDA #$91
3b29 : 8d 08 86 STA $8608 ; (BLIT_CODE[0] + 8)
3b2c : a9 0a __ LDA #$0a
.s19:
3b2e : 85 45 __ STA T1 + 0 
3b30 : a5 43 __ LDA T0 + 0 
3b32 : 05 44 __ ORA T0 + 1 
3b34 : f0 03 __ BEQ $3b39 ; (bmu_line.s20 + 0)
3b36 : 4c 08 3c JMP $3c08 ; (bmu_line.s28 + 0)
.s20:
3b39 : a5 46 __ LDA T2 + 0 
3b3b : 05 47 __ ORA T2 + 1 
3b3d : f0 75 __ BEQ $3bb4 ; (bmu_line.s21 + 0)
.s22:
3b3f : a9 0a __ LDA #$0a
3b41 : a4 45 __ LDY T1 + 0 
3b43 : 99 01 86 STA $8601,y ; (BLIT_CODE[0] + 1)
3b46 : 99 05 86 STA $8605,y ; (BLIT_CODE[0] + 5)
3b49 : a9 90 __ LDA #$90
3b4b : 99 02 86 STA $8602,y ; (BLIT_CODE[0] + 2)
3b4e : a9 0c __ LDA #$0c
3b50 : 99 03 86 STA $8603,y ; (BLIT_CODE[0] + 3)
3b53 : a9 a5 __ LDA #$a5
3b55 : 99 06 86 STA $8606,y ; (BLIT_CODE[0] + 6)
3b58 : a9 03 __ LDA #$03
3b5a : 99 07 86 STA $8607,y ; (BLIT_CODE[0] + 7)
3b5d : a9 69 __ LDA #$69
3b5f : 99 08 86 STA $8608,y ; (BLIT_CODE[0] + 8)
3b62 : a5 51 __ LDA T11 + 0 
3b64 : f0 09 __ BEQ $3b6f ; (bmu_line.s23 + 0)
.s27:
3b66 : a9 06 __ LDA #$06
3b68 : 99 00 86 STA $8600,y ; (BLIT_CODE[0] + 0)
3b6b : a9 26 __ LDA #$26
3b6d : d0 07 __ BNE $3b76 ; (bmu_line.s53 + 0)
.s23:
3b6f : a9 46 __ LDA #$46
3b71 : 99 00 86 STA $8600,y ; (BLIT_CODE[0] + 0)
3b74 : a9 66 __ LDA #$66
.s53:
3b76 : 99 04 86 STA $8604,y ; (BLIT_CODE[0] + 4)
3b79 : a9 02 __ LDA #$02
3b7b : 99 0b 86 STA $860b,y ; (BLIT_CODE[0] + 11)
3b7e : a5 51 __ LDA T11 + 0 
3b80 : f0 0e __ BEQ $3b90 ; (bmu_line.s24 + 0)
.s26:
3b82 : a9 f8 __ LDA #$f8
3b84 : 99 09 86 STA $8609,y ; (BLIT_CODE[0] + 9)
3b87 : a9 b0 __ LDA #$b0
3b89 : 99 0a 86 STA $860a,y ; (BLIT_CODE[0] + 10)
3b8c : a9 c6 __ LDA #$c6
3b8e : d0 0c __ BNE $3b9c ; (bmu_line.s25 + 0)
.s24:
3b90 : a9 08 __ LDA #$08
3b92 : 99 09 86 STA $8609,y ; (BLIT_CODE[0] + 9)
3b95 : a9 90 __ LDA #$90
3b97 : 99 0a 86 STA $860a,y ; (BLIT_CODE[0] + 10)
3b9a : a9 e6 __ LDA #$e6
.s25:
3b9c : 99 0c 86 STA $860c,y ; (BLIT_CODE[0] + 12)
3b9f : a9 04 __ LDA #$04
3ba1 : 99 0d 86 STA $860d,y ; (BLIT_CODE[0] + 13)
3ba4 : a9 85 __ LDA #$85
3ba6 : 99 0e 86 STA $860e,y ; (BLIT_CODE[0] + 14)
3ba9 : a9 03 __ LDA #$03
3bab : 99 0f 86 STA $860f,y ; (BLIT_CODE[0] + 15)
3bae : 98 __ __ TYA
3baf : 18 __ __ CLC
3bb0 : 69 10 __ ADC #$10
3bb2 : 85 45 __ STA T1 + 0 
.s21:
3bb4 : a9 ca __ LDA #$ca
3bb6 : a4 45 __ LDY T1 + 0 
3bb8 : 84 43 __ STY T0 + 0 
3bba : 99 00 86 STA $8600,y ; (BLIT_CODE[0] + 0)
3bbd : a9 d0 __ LDA #$d0
3bbf : 99 01 86 STA $8601,y ; (BLIT_CODE[0] + 1)
3bc2 : a9 c6 __ LDA #$c6
3bc4 : 99 03 86 STA $8603,y ; (BLIT_CODE[0] + 3)
3bc7 : a9 0b __ LDA #$0b
3bc9 : 99 04 86 STA $8604,y ; (BLIT_CODE[0] + 4)
3bcc : a9 10 __ LDA #$10
3bce : 99 05 86 STA $8605,y ; (BLIT_CODE[0] + 5)
3bd1 : a9 60 __ LDA #$60
3bd3 : 99 07 86 STA $8607,y ; (BLIT_CODE[0] + 7)
3bd6 : e6 43 __ INC T0 + 0 
3bd8 : 38 __ __ SEC
3bd9 : a9 02 __ LDA #$02
3bdb : e5 43 __ SBC T0 + 0 
3bdd : 99 02 86 STA $8602,y ; (BLIT_CODE[0] + 2)
3be0 : 38 __ __ SEC
3be1 : a9 fe __ LDA #$fe
3be3 : e5 43 __ SBC T0 + 0 
3be5 : 99 06 86 STA $8606,y ; (BLIT_CODE[0] + 6)
3be8 : a5 49 __ LDA T4 + 1 
3bea : 85 0b __ STA WORK + 8 
3bec : a5 4d __ LDA T7 + 0 
3bee : 85 03 __ STA WORK + 0 
3bf0 : a5 4e __ LDA T7 + 1 
3bf2 : 85 04 __ STA WORK + 1 
3bf4 : a5 4a __ LDA T5 + 0 
3bf6 : 85 05 __ STA WORK + 2 
3bf8 : a5 4b __ LDA T5 + 1 
3bfa : 85 06 __ STA WORK + 3 
3bfc : bd e0 7a LDA $7ae0,x ; (bitshift[0] + 32)
3bff : 85 0a __ STA WORK + 7 
3c01 : a9 ff __ LDA #$ff
3c03 : 85 07 __ STA WORK + 4 
3c05 : 4c 00 86 JMP $8600 ; (BLIT_CODE[0] + 0)
.s28:
3c08 : a5 46 __ LDA T2 + 0 
3c0a : 05 47 __ ORA T2 + 1 
3c0c : c9 01 __ CMP #$01
3c0e : a9 00 __ LDA #$00
3c10 : 6a __ __ ROR
3c11 : 85 1d __ STA ACCU + 2 
3c13 : f0 03 __ BEQ $3c18 ; (bmu_line.s29 + 0)
3c15 : 4c b3 3d JMP $3db3 ; (bmu_line.s35 + 0)
.s29:
3c18 : a9 00 __ LDA #$00
3c1a : 85 46 __ STA T2 + 0 
3c1c : 85 47 __ STA T2 + 1 
3c1e : 85 1b __ STA ACCU + 0 
3c20 : a5 52 __ LDA T12 + 0 
3c22 : f0 03 __ BEQ $3c27 ; (bmu_line.s30 + 0)
3c24 : 4c 48 3d JMP $3d48 ; (bmu_line.s34 + 0)
.s30:
3c27 : a9 c8 __ LDA #$c8
3c29 : a4 45 __ LDY T1 + 0 
3c2b : 99 00 86 STA $8600,y ; (BLIT_CODE[0] + 0)
3c2e : a9 c0 __ LDA #$c0
3c30 : 99 01 86 STA $8601,y ; (BLIT_CODE[0] + 1)
3c33 : a9 08 __ LDA #$08
3c35 : 99 02 86 STA $8602,y ; (BLIT_CODE[0] + 2)
3c38 : a9 d0 __ LDA #$d0
3c3a : 99 03 86 STA $8603,y ; (BLIT_CODE[0] + 3)
3c3d : a9 a0 __ LDA #$a0
3c3f : 99 05 86 STA $8605,y ; (BLIT_CODE[0] + 5)
3c42 : a9 00 __ LDA #$00
3c44 : 99 06 86 STA $8606,y ; (BLIT_CODE[0] + 6)
3c47 : a9 a5 __ LDA #$a5
3c49 : 99 07 86 STA $8607,y ; (BLIT_CODE[0] + 7)
3c4c : 99 0d 86 STA $860d,y ; (BLIT_CODE[0] + 13)
3c4f : a9 03 __ LDA #$03
3c51 : 99 08 86 STA $8608,y ; (BLIT_CODE[0] + 8)
3c54 : 99 0c 86 STA $860c,y ; (BLIT_CODE[0] + 12)
3c57 : a9 69 __ LDA #$69
3c59 : 99 09 86 STA $8609,y ; (BLIT_CODE[0] + 9)
3c5c : 99 0f 86 STA $860f,y ; (BLIT_CODE[0] + 15)
3c5f : a9 85 __ LDA #$85
3c61 : 99 0b 86 STA $860b,y ; (BLIT_CODE[0] + 11)
3c64 : 99 11 86 STA $8611,y ; (BLIT_CODE[0] + 17)
3c67 : a9 04 __ LDA #$04
3c69 : 99 0e 86 STA $860e,y ; (BLIT_CODE[0] + 14)
3c6c : 99 12 86 STA $8612,y ; (BLIT_CODE[0] + 18)
3c6f : a5 1b __ LDA ACCU + 0 
3c71 : f0 04 __ BEQ $3c77 ; (bmu_line.s60 + 0)
.s61:
3c73 : a9 10 __ LDA #$10
3c75 : 90 02 __ BCC $3c79 ; (bmu_line.s62 + 0)
.s60:
3c77 : a9 0e __ LDA #$0e
.s62:
3c79 : 99 04 86 STA $8604,y ; (BLIT_CODE[0] + 4)
3c7c : 38 __ __ SEC
3c7d : a5 4f __ LDA T8 + 0 
3c7f : e9 01 __ SBC #$01
3c81 : 99 0a 86 STA $860a,y ; (BLIT_CODE[0] + 10)
3c84 : a5 50 __ LDA T8 + 1 
3c86 : e9 00 __ SBC #$00
3c88 : 99 10 86 STA $8610,y ; (BLIT_CODE[0] + 16)
3c8b : 98 __ __ TYA
3c8c : 18 __ __ CLC
3c8d : 69 13 __ ADC #$13
3c8f : 85 45 __ STA T1 + 0 
3c91 : a8 __ __ TAY
3c92 : 24 1d __ BIT ACCU + 2 
3c94 : 30 03 __ BMI $3c99 ; (bmu_line.s31 + 0)
3c96 : 4c 39 3b JMP $3b39 ; (bmu_line.s20 + 0)
.s31:
3c99 : a9 a5 __ LDA #$a5
3c9b : 99 00 86 STA $8600,y ; (BLIT_CODE[0] + 0)
3c9e : a9 05 __ LDA #$05
3ca0 : 99 01 86 STA $8601,y ; (BLIT_CODE[0] + 1)
3ca3 : 99 06 86 STA $8606,y ; (BLIT_CODE[0] + 6)
3ca6 : a9 38 __ LDA #$38
3ca8 : 99 02 86 STA $8602,y ; (BLIT_CODE[0] + 2)
3cab : a9 e9 __ LDA #$e9
3cad : 99 03 86 STA $8603,y ; (BLIT_CODE[0] + 3)
3cb0 : a9 85 __ LDA #$85
3cb2 : 99 05 86 STA $8605,y ; (BLIT_CODE[0] + 5)
3cb5 : a5 46 __ LDA T2 + 0 
3cb7 : 99 04 86 STA $8604,y ; (BLIT_CODE[0] + 4)
3cba : a5 1c __ LDA ACCU + 1 
3cbc : d0 2a __ BNE $3ce8 ; (bmu_line.s33 + 0)
.s32:
3cbe : a9 10 __ LDA #$10
3cc0 : 99 07 86 STA $8607,y ; (BLIT_CODE[0] + 7)
3cc3 : a9 15 __ LDA #$15
3cc5 : 99 08 86 STA $8608,y ; (BLIT_CODE[0] + 8)
3cc8 : a9 18 __ LDA #$18
3cca : 99 09 86 STA $8609,y ; (BLIT_CODE[0] + 9)
3ccd : a9 69 __ LDA #$69
3ccf : 99 0a 86 STA $860a,y ; (BLIT_CODE[0] + 10)
3cd2 : a5 43 __ LDA T0 + 0 
3cd4 : 99 0b 86 STA $860b,y ; (BLIT_CODE[0] + 11)
3cd7 : a9 85 __ LDA #$85
3cd9 : 99 0c 86 STA $860c,y ; (BLIT_CODE[0] + 12)
3cdc : a9 05 __ LDA #$05
3cde : 99 0d 86 STA $860d,y ; (BLIT_CODE[0] + 13)
3ce1 : 98 __ __ TYA
3ce2 : 18 __ __ CLC
3ce3 : 69 0e __ ADC #$0e
3ce5 : 4c 43 3d JMP $3d43 ; (bmu_line.s54 + 0)
.s33:
3ce8 : a9 a5 __ LDA #$a5
3cea : 99 07 86 STA $8607,y ; (BLIT_CODE[0] + 7)
3ced : 99 10 86 STA $8610,y ; (BLIT_CODE[0] + 16)
3cf0 : 99 16 86 STA $8616,y ; (BLIT_CODE[0] + 22)
3cf3 : a9 06 __ LDA #$06
3cf5 : 99 08 86 STA $8608,y ; (BLIT_CODE[0] + 8)
3cf8 : 99 0c 86 STA $860c,y ; (BLIT_CODE[0] + 12)
3cfb : 99 17 86 STA $8617,y ; (BLIT_CODE[0] + 23)
3cfe : 99 1b 86 STA $861b,y ; (BLIT_CODE[0] + 27)
3d01 : a9 e9 __ LDA #$e9
3d03 : 99 09 86 STA $8609,y ; (BLIT_CODE[0] + 9)
3d06 : a9 85 __ LDA #$85
3d08 : 99 0b 86 STA $860b,y ; (BLIT_CODE[0] + 11)
3d0b : 99 14 86 STA $8614,y ; (BLIT_CODE[0] + 20)
3d0e : 99 1a 86 STA $861a,y ; (BLIT_CODE[0] + 26)
3d11 : a9 10 __ LDA #$10
3d13 : 99 0d 86 STA $860d,y ; (BLIT_CODE[0] + 13)
3d16 : a9 1d __ LDA #$1d
3d18 : 99 0e 86 STA $860e,y ; (BLIT_CODE[0] + 14)
3d1b : a9 18 __ LDA #$18
3d1d : 99 0f 86 STA $860f,y ; (BLIT_CODE[0] + 15)
3d20 : a9 05 __ LDA #$05
3d22 : 99 11 86 STA $8611,y ; (BLIT_CODE[0] + 17)
3d25 : 99 15 86 STA $8615,y ; (BLIT_CODE[0] + 21)
3d28 : a9 69 __ LDA #$69
3d2a : 99 12 86 STA $8612,y ; (BLIT_CODE[0] + 18)
3d2d : 99 18 86 STA $8618,y ; (BLIT_CODE[0] + 24)
3d30 : a5 43 __ LDA T0 + 0 
3d32 : 99 13 86 STA $8613,y ; (BLIT_CODE[0] + 19)
3d35 : a5 47 __ LDA T2 + 1 
3d37 : 99 0a 86 STA $860a,y ; (BLIT_CODE[0] + 10)
3d3a : a5 44 __ LDA T0 + 1 
3d3c : 99 19 86 STA $8619,y ; (BLIT_CODE[0] + 25)
3d3f : 98 __ __ TYA
3d40 : 18 __ __ CLC
3d41 : 69 1c __ ADC #$1c
.s54:
3d43 : 85 45 __ STA T1 + 0 
3d45 : 4c 3f 3b JMP $3b3f ; (bmu_line.s22 + 0)
.s34:
3d48 : a9 88 __ LDA #$88
3d4a : a4 45 __ LDY T1 + 0 
3d4c : 99 00 86 STA $8600,y ; (BLIT_CODE[0] + 0)
3d4f : a9 10 __ LDA #$10
3d51 : 99 01 86 STA $8601,y ; (BLIT_CODE[0] + 1)
3d54 : a9 18 __ LDA #$18
3d56 : 99 03 86 STA $8603,y ; (BLIT_CODE[0] + 3)
3d59 : a9 a0 __ LDA #$a0
3d5b : 99 04 86 STA $8604,y ; (BLIT_CODE[0] + 4)
3d5e : a9 07 __ LDA #$07
3d60 : 99 05 86 STA $8605,y ; (BLIT_CODE[0] + 5)
3d63 : a9 a5 __ LDA #$a5
3d65 : 99 06 86 STA $8606,y ; (BLIT_CODE[0] + 6)
3d68 : 99 0c 86 STA $860c,y ; (BLIT_CODE[0] + 12)
3d6b : a9 03 __ LDA #$03
3d6d : 99 07 86 STA $8607,y ; (BLIT_CODE[0] + 7)
3d70 : 99 0b 86 STA $860b,y ; (BLIT_CODE[0] + 11)
3d73 : a9 69 __ LDA #$69
3d75 : 99 08 86 STA $8608,y ; (BLIT_CODE[0] + 8)
3d78 : 99 0e 86 STA $860e,y ; (BLIT_CODE[0] + 14)
3d7b : a9 85 __ LDA #$85
3d7d : 99 0a 86 STA $860a,y ; (BLIT_CODE[0] + 10)
3d80 : 99 10 86 STA $8610,y ; (BLIT_CODE[0] + 16)
3d83 : a9 04 __ LDA #$04
3d85 : 99 0d 86 STA $860d,y ; (BLIT_CODE[0] + 13)
3d88 : 99 11 86 STA $8611,y ; (BLIT_CODE[0] + 17)
3d8b : a5 1b __ LDA ACCU + 0 
3d8d : f0 04 __ BEQ $3d93 ; (bmu_line.s57 + 0)
.s58:
3d8f : a9 11 __ LDA #$11
3d91 : 90 02 __ BCC $3d95 ; (bmu_line.s59 + 0)
.s57:
3d93 : a9 0f __ LDA #$0f
.s59:
3d95 : 99 02 86 STA $8602,y ; (BLIT_CODE[0] + 2)
3d98 : a5 4f __ LDA T8 + 0 
3d9a : 99 09 86 STA $8609,y ; (BLIT_CODE[0] + 9)
3d9d : a5 50 __ LDA T8 + 1 
3d9f : 99 0f 86 STA $860f,y ; (BLIT_CODE[0] + 15)
3da2 : 98 __ __ TYA
3da3 : 18 __ __ CLC
3da4 : 69 12 __ ADC #$12
3da6 : 85 45 __ STA T1 + 0 
3da8 : a8 __ __ TAY
3da9 : 24 1d __ BIT ACCU + 2 
3dab : 10 03 __ BPL $3db0 ; (bmu_line.s59 + 27)
3dad : 4c 99 3c JMP $3c99 ; (bmu_line.s31 + 0)
3db0 : 4c 39 3b JMP $3b39 ; (bmu_line.s20 + 0)
.s35:
3db3 : a9 a5 __ LDA #$a5
3db5 : a4 45 __ LDY T1 + 0 
3db7 : 99 00 86 STA $8600,y ; (BLIT_CODE[0] + 0)
3dba : a9 30 __ LDA #$30
3dbc : 99 02 86 STA $8602,y ; (BLIT_CODE[0] + 2)
3dbf : a5 1c __ LDA ACCU + 1 
3dc1 : 69 05 __ ADC #$05
3dc3 : 99 01 86 STA $8601,y ; (BLIT_CODE[0] + 1)
3dc6 : a5 1c __ LDA ACCU + 1 
3dc8 : d0 26 __ BNE $3df0 ; (bmu_line.s39 + 0)
.s36:
3dca : a9 1b __ LDA #$1b
3dcc : 85 1b __ STA ACCU + 0 
3dce : a5 52 __ LDA T12 + 0 
3dd0 : d0 02 __ BNE $3dd4 ; (bmu_line.s38 + 0)
.s37:
3dd2 : e6 1b __ INC ACCU + 0 
.s38:
3dd4 : a5 1b __ LDA ACCU + 0 
3dd6 : 99 03 86 STA $8603,y ; (BLIT_CODE[0] + 3)
3dd9 : 98 __ __ TYA
3dda : 18 __ __ CLC
3ddb : 69 04 __ ADC #$04
3ddd : 85 45 __ STA T1 + 0 
3ddf : a9 00 __ LDA #$00
3de1 : c5 1c __ CMP ACCU + 1 
3de3 : 2a __ __ ROL
3de4 : 85 1b __ STA ACCU + 0 
3de6 : a5 52 __ LDA T12 + 0 
3de8 : f0 03 __ BEQ $3ded ; (bmu_line.s38 + 25)
3dea : 4c 48 3d JMP $3d48 ; (bmu_line.s34 + 0)
3ded : 4c 27 3c JMP $3c27 ; (bmu_line.s30 + 0)
.s39:
3df0 : a9 21 __ LDA #$21
3df2 : 85 1b __ STA ACCU + 0 
3df4 : a5 52 __ LDA T12 + 0 
3df6 : d0 dc __ BNE $3dd4 ; (bmu_line.s38 + 0)
3df8 : f0 d8 __ BEQ $3dd2 ; (bmu_line.s37 + 0)
.s42:
3dfa : a8 __ __ TAY
3dfb : f0 05 __ BEQ $3e02 ; (bmu_line.s43 + 0)
.s44:
3dfd : a9 11 __ LDA #$11
3dff : 4c 1c 3b JMP $3b1c ; (bmu_line.s41 + 0)
.s43:
3e02 : a9 06 __ LDA #$06
3e04 : 8d 06 86 STA $8606 ; (BLIT_CODE[0] + 6)
3e07 : 8d 09 86 STA $8609 ; (BLIT_CODE[0] + 9)
3e0a : a9 07 __ LDA #$07
3e0c : 8d 07 86 STA $8607 ; (BLIT_CODE[0] + 7)
3e0f : 8d 0b 86 STA $860b ; (BLIT_CODE[0] + 11)
3e12 : a9 90 __ LDA #$90
3e14 : 8d 08 86 STA $8608 ; (BLIT_CODE[0] + 8)
3e17 : a9 e6 __ LDA #$e6
3e19 : 8d 0a 86 STA $860a ; (BLIT_CODE[0] + 10)
3e1c : a9 11 __ LDA #$11
3e1e : 8d 0c 86 STA $860c ; (BLIT_CODE[0] + 12)
3e21 : a9 03 __ LDA #$03
3e23 : 8d 0d 86 STA $860d ; (BLIT_CODE[0] + 13)
3e26 : 8d 13 86 STA $8613 ; (BLIT_CODE[0] + 19)
3e29 : 8d 15 86 STA $8615 ; (BLIT_CODE[0] + 21)
3e2c : a9 d0 __ LDA #$d0
3e2e : 8d 0e 86 STA $860e ; (BLIT_CODE[0] + 14)
3e31 : a9 04 __ LDA #$04
3e33 : 8d 0f 86 STA $860f ; (BLIT_CODE[0] + 15)
3e36 : a9 49 __ LDA #$49
3e38 : 8d 10 86 STA $8610 ; (BLIT_CODE[0] + 16)
3e3b : a9 ff __ LDA #$ff
3e3d : 8d 11 86 STA $8611 ; (BLIT_CODE[0] + 17)
3e40 : a9 31 __ LDA #$31
3e42 : 8d 12 86 STA $8612 ; (BLIT_CODE[0] + 18)
3e45 : a9 91 __ LDA #$91
3e47 : 8d 14 86 STA $8614 ; (BLIT_CODE[0] + 20)
3e4a : a9 16 __ LDA #$16
3e4c : 4c 2e 3b JMP $3b2e ; (bmu_line.s19 + 0)
--------------------------------------------------------------------
engine_update: ; engine_update(u8)->void
; 364, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s4:
3e4f : 0a __ __ ASL
3e50 : aa __ __ TAX
3e51 : bd 7d 73 LDA $737d,x ; (sid_freq[0] + 0)
3e54 : 8d 00 d4 STA $d400 
3e57 : bd 7e 73 LDA $737e,x ; (sid_freq[0] + 1)
3e5a : 85 1c __ STA ACCU + 1 
3e5c : 8d 01 d4 STA $d401 
3e5f : bd 7d 73 LDA $737d,x ; (sid_freq[0] + 0)
3e62 : 0a __ __ ASL
3e63 : 26 1c __ ROL ACCU + 1 
3e65 : 8d 07 d4 STA $d407 
3e68 : a5 1c __ LDA ACCU + 1 
3e6a : 8d 08 d4 STA $d408 
.s3:
3e6d : 60 __ __ RTS
--------------------------------------------------------------------
modplay_start: ; modplay_start()->void
; 239, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s4:
3e6e : ad 3c 82 LDA $823c ; (modplay.song_length + 0)
3e71 : d0 01 __ BNE $3e74 ; (modplay_start.s5 + 0)
.s3:
3e73 : 60 __ __ RTS
.s5:
3e74 : a9 00 __ LDA #$00
3e76 : 8d fd 73 STA $73fd ; (mod_paused + 0)
3e79 : 8d bf 82 STA $82bf ; (modplay.order_pos + 0)
3e7c : 85 43 __ STA T0 + 0 
3e7e : 8d c1 82 STA $82c1 ; (modplay.row + 0)
3e81 : 8d c2 82 STA $82c2 ; (modplay.tick + 0)
3e84 : 8d c5 82 STA $82c5 ; (modplay.pattern_delay + 0)
3e87 : 8d ca 82 STA $82ca ; (modplay.skip_row_advance + 0)
3e8a : ad 3f 82 LDA $823f ; (modplay.order_table[0] + 0)
3e8d : 8d c0 82 STA $82c0 ; (modplay.pattern_num + 0)
3e90 : a9 06 __ LDA #$06
3e92 : 8d c3 82 STA $82c3 ; (modplay.ticks_per_row + 0)
3e95 : a9 7d __ LDA #$7d
3e97 : 8d c4 82 STA $82c4 ; (modplay.bpm + 0)
3e9a : a9 01 __ LDA #$01
3e9c : 8d c8 82 STA $82c8 ; (modplay.active + 0)
3e9f : ad c7 82 LDA $82c7 ; (modplay.stereo + 0)
3ea2 : d0 17 __ BNE $3ebb ; (modplay_start.l10 + 0)
.s7:
3ea4 : a9 80 __ LDA #$80
3ea6 : a6 43 __ LDX T0 + 0 
3ea8 : bc 0f 72 LDY $720f,x ; (__multab50L + 0)
.l8:
3eab : 99 20 85 STA $8520,y ; (modplay.channel[0].pan + 0)
3eae : e6 43 __ INC T0 + 0 
3eb0 : a5 43 __ LDA T0 + 0 
3eb2 : c9 04 __ CMP #$04
3eb4 : b0 1d __ BCS $3ed3 ; (modplay_start.s9 + 0)
.s6:
3eb6 : ad c7 82 LDA $82c7 ; (modplay.stereo + 0)
3eb9 : f0 e9 __ BEQ $3ea4 ; (modplay_start.s7 + 0)
.l10:
3ebb : a5 43 __ LDA T0 + 0 
3ebd : f0 04 __ BEQ $3ec3 ; (modplay_start.s11 + 0)
.s13:
3ebf : c9 03 __ CMP #$03
3ec1 : d0 04 __ BNE $3ec7 ; (modplay_start.s14 + 0)
.s11:
3ec3 : a2 00 __ LDX #$00
3ec5 : f0 02 __ BEQ $3ec9 ; (modplay_start.s12 + 0)
.s14:
3ec7 : a2 ff __ LDX #$ff
.s12:
3ec9 : a4 43 __ LDY T0 + 0 
3ecb : b9 0f 72 LDA $720f,y ; (__multab50L + 0)
3ece : a8 __ __ TAY
3ecf : 8a __ __ TXA
3ed0 : 4c ab 3e JMP $3eab ; (modplay_start.l8 + 0)
.s9:
3ed3 : ad c4 82 LDA $82c4 ; (modplay.bpm + 0)
3ed6 : 20 13 3f JSR $3f13 ; (bpm_to_timer.s4 + 0)
3ed9 : a5 1b __ LDA ACCU + 0 
3edb : 85 43 __ STA T0 + 0 
3edd : a5 1c __ LDA ACCU + 1 
3edf : 85 44 __ STA T0 + 1 
3ee1 : 78 __ __ SEI
3ee2 : ad 14 03 LDA $0314 
3ee5 : 8d fe 73 STA $73fe ; (mod_saved_irq[0] + 0)
3ee8 : ad 15 03 LDA $0315 
3eeb : 8d ff 73 STA $73ff ; (mod_saved_irq[0] + 1)
3eee : a9 7f __ LDA #$7f
3ef0 : 8d 0d dc STA $dc0d 
3ef3 : a5 43 __ LDA T0 + 0 
3ef5 : 8d 04 dc STA $dc04 
3ef8 : a5 44 __ LDA T0 + 1 
3efa : 8d 05 dc STA $dc05 
3efd : a9 0e __ LDA #$0e
3eff : 8d 14 03 STA $0314 
3f02 : a9 40 __ LDA #$40
3f04 : 8d 15 03 STA $0315 
3f07 : a9 81 __ LDA #$81
3f09 : 8d 0d dc STA $dc0d 
3f0c : a9 01 __ LDA #$01
3f0e : 8d 0e dc STA $dc0e 
3f11 : 58 __ __ CLI
3f12 : 60 __ __ RTS
--------------------------------------------------------------------
bpm_to_timer: ; bpm_to_timer(u8)->u16
;  76, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
3f13 : 85 03 __ STA WORK + 0 
3f15 : aa __ __ TAX
3f16 : d0 09 __ BNE $3f21 ; (bpm_to_timer.s6 + 0)
.s5:
3f18 : a9 f8 __ LDA #$f8
3f1a : 85 1b __ STA ACCU + 0 
3f1c : a9 4c __ LDA #$4c
3f1e : 85 1c __ STA ACCU + 1 
.s3:
3f20 : 60 __ __ RTS
.s6:
3f21 : a9 00 __ LDA #$00
3f23 : 85 1e __ STA ACCU + 3 
3f25 : 85 04 __ STA WORK + 1 
3f27 : 85 05 __ STA WORK + 2 
3f29 : 85 06 __ STA WORK + 3 
3f2b : a9 90 __ LDA #$90
3f2d : 85 1b __ STA ACCU + 0 
3f2f : a9 95 __ LDA #$95
3f31 : 85 1c __ STA ACCU + 1 
3f33 : a9 25 __ LDA #$25
3f35 : 85 1d __ STA ACCU + 2 
--------------------------------------------------------------------
divmod32: ; divmod32
3f37 : 84 02 __ STY $02 
3f39 : a0 20 __ LDY #$20
3f3b : a9 00 __ LDA #$00
3f3d : 85 07 __ STA WORK + 4 
3f3f : 85 08 __ STA WORK + 5 
3f41 : 85 09 __ STA WORK + 6 
3f43 : 85 0a __ STA WORK + 7 
3f45 : a5 05 __ LDA WORK + 2 
3f47 : 05 06 __ ORA WORK + 3 
3f49 : d0 78 __ BNE $3fc3 ; (divmod32 + 140)
3f4b : a5 04 __ LDA WORK + 1 
3f4d : d0 27 __ BNE $3f76 ; (divmod32 + 63)
3f4f : 18 __ __ CLC
3f50 : 26 1b __ ROL ACCU + 0 
3f52 : 26 1c __ ROL ACCU + 1 
3f54 : 26 1d __ ROL ACCU + 2 
3f56 : 26 1e __ ROL ACCU + 3 
3f58 : 2a __ __ ROL
3f59 : 90 05 __ BCC $3f60 ; (divmod32 + 41)
3f5b : e5 03 __ SBC WORK + 0 
3f5d : 38 __ __ SEC
3f5e : b0 06 __ BCS $3f66 ; (divmod32 + 47)
3f60 : c5 03 __ CMP WORK + 0 
3f62 : 90 02 __ BCC $3f66 ; (divmod32 + 47)
3f64 : e5 03 __ SBC WORK + 0 
3f66 : 88 __ __ DEY
3f67 : d0 e7 __ BNE $3f50 ; (divmod32 + 25)
3f69 : 85 07 __ STA WORK + 4 
3f6b : 26 1b __ ROL ACCU + 0 
3f6d : 26 1c __ ROL ACCU + 1 
3f6f : 26 1d __ ROL ACCU + 2 
3f71 : 26 1e __ ROL ACCU + 3 
3f73 : a4 02 __ LDY $02 
3f75 : 60 __ __ RTS
3f76 : a5 1e __ LDA ACCU + 3 
3f78 : d0 10 __ BNE $3f8a ; (divmod32 + 83)
3f7a : a6 1d __ LDX ACCU + 2 
3f7c : 86 1e __ STX ACCU + 3 
3f7e : a6 1c __ LDX ACCU + 1 
3f80 : 86 1d __ STX ACCU + 2 
3f82 : a6 1b __ LDX ACCU + 0 
3f84 : 86 1c __ STX ACCU + 1 
3f86 : 85 1b __ STA ACCU + 0 
3f88 : a0 18 __ LDY #$18
3f8a : 18 __ __ CLC
3f8b : 26 1b __ ROL ACCU + 0 
3f8d : 26 1c __ ROL ACCU + 1 
3f8f : 26 1d __ ROL ACCU + 2 
3f91 : 26 1e __ ROL ACCU + 3 
3f93 : 26 07 __ ROL WORK + 4 
3f95 : 26 08 __ ROL WORK + 5 
3f97 : 90 0c __ BCC $3fa5 ; (divmod32 + 110)
3f99 : a5 07 __ LDA WORK + 4 
3f9b : e5 03 __ SBC WORK + 0 
3f9d : aa __ __ TAX
3f9e : a5 08 __ LDA WORK + 5 
3fa0 : e5 04 __ SBC WORK + 1 
3fa2 : 38 __ __ SEC
3fa3 : b0 0c __ BCS $3fb1 ; (divmod32 + 122)
3fa5 : 38 __ __ SEC
3fa6 : a5 07 __ LDA WORK + 4 
3fa8 : e5 03 __ SBC WORK + 0 
3faa : aa __ __ TAX
3fab : a5 08 __ LDA WORK + 5 
3fad : e5 04 __ SBC WORK + 1 
3faf : 90 04 __ BCC $3fb5 ; (divmod32 + 126)
3fb1 : 86 07 __ STX WORK + 4 
3fb3 : 85 08 __ STA WORK + 5 
3fb5 : 88 __ __ DEY
3fb6 : d0 d3 __ BNE $3f8b ; (divmod32 + 84)
3fb8 : 26 1b __ ROL ACCU + 0 
3fba : 26 1c __ ROL ACCU + 1 
3fbc : 26 1d __ ROL ACCU + 2 
3fbe : 26 1e __ ROL ACCU + 3 
3fc0 : a4 02 __ LDY $02 
3fc2 : 60 __ __ RTS
3fc3 : a0 10 __ LDY #$10
3fc5 : a5 1e __ LDA ACCU + 3 
3fc7 : 85 08 __ STA WORK + 5 
3fc9 : a5 1d __ LDA ACCU + 2 
3fcb : 85 07 __ STA WORK + 4 
3fcd : a9 00 __ LDA #$00
3fcf : 85 1d __ STA ACCU + 2 
3fd1 : 85 1e __ STA ACCU + 3 
3fd3 : 18 __ __ CLC
3fd4 : 26 1b __ ROL ACCU + 0 
3fd6 : 26 1c __ ROL ACCU + 1 
3fd8 : 26 07 __ ROL WORK + 4 
3fda : 26 08 __ ROL WORK + 5 
3fdc : 26 09 __ ROL WORK + 6 
3fde : 26 0a __ ROL WORK + 7 
3fe0 : a5 07 __ LDA WORK + 4 
3fe2 : c5 03 __ CMP WORK + 0 
3fe4 : a5 08 __ LDA WORK + 5 
3fe6 : e5 04 __ SBC WORK + 1 
3fe8 : a5 09 __ LDA WORK + 6 
3fea : e5 05 __ SBC WORK + 2 
3fec : aa __ __ TAX
3fed : a5 0a __ LDA WORK + 7 
3fef : e5 06 __ SBC WORK + 3 
3ff1 : 90 11 __ BCC $4004 ; (divmod32 + 205)
3ff3 : 86 09 __ STX WORK + 6 
3ff5 : 85 0a __ STA WORK + 7 
3ff7 : a5 07 __ LDA WORK + 4 
3ff9 : e5 03 __ SBC WORK + 0 
3ffb : 85 07 __ STA WORK + 4 
3ffd : a5 08 __ LDA WORK + 5 
3fff : e5 04 __ SBC WORK + 1 
4001 : 85 08 __ STA WORK + 5 
4003 : 38 __ __ SEC
4004 : 88 __ __ DEY
4005 : d0 cd __ BNE $3fd4 ; (divmod32 + 157)
4007 : 26 1b __ ROL ACCU + 0 
4009 : 26 1c __ ROL ACCU + 1 
400b : a4 02 __ LDY $02 
400d : 60 __ __ RTS
--------------------------------------------------------------------
modplay_irq: ; modplay_irq
400e : ad 0d dc LDA $dc0d 
4011 : 29 01 __ AND #$01
4013 : f0 03 __ BEQ $4018 ; (modplay_irq + 10)
4015 : 20 1f 40 JSR $401f ; (modplay_tick.s1 + 0)
4018 : 68 __ __ PLA
4019 : a8 __ __ TAY
401a : 68 __ __ PLA
401b : aa __ __ TAX
401c : 68 __ __ PLA
401d : 40 __ __ RTI
401e : 60 __ __ RTS
--------------------------------------------------------------------
modplay_tick: ; modplay_tick()->void
; 285, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s1:
401f : c6 24 __ DEC SP + 1 
4021 : a5 03 __ LDA WORK + 0 
4023 : 48 __ __ PHA
4024 : a5 04 __ LDA WORK + 1 
4026 : 48 __ __ PHA
4027 : a5 05 __ LDA WORK + 2 
4029 : 48 __ __ PHA
402a : a5 06 __ LDA WORK + 3 
402c : 48 __ __ PHA
402d : a5 0d __ LDA P0 
402f : 48 __ __ PHA
4030 : a5 0e __ LDA P1 
4032 : 48 __ __ PHA
4033 : a5 0f __ LDA P2 
4035 : 48 __ __ PHA
4036 : a5 10 __ LDA P3 
4038 : 48 __ __ PHA
4039 : a5 11 __ LDA P4 
403b : 48 __ __ PHA
403c : a5 12 __ LDA P5 
403e : 48 __ __ PHA
403f : a5 13 __ LDA P6 
4041 : 48 __ __ PHA
4042 : a5 1b __ LDA ACCU + 0 
4044 : 48 __ __ PHA
4045 : a5 1c __ LDA ACCU + 1 
4047 : 48 __ __ PHA
4048 : a5 1d __ LDA ACCU + 2 
404a : 48 __ __ PHA
404b : a5 1e __ LDA ACCU + 3 
404d : 48 __ __ PHA
404e : a5 43 __ LDA T0 + 0 
4050 : 48 __ __ PHA
4051 : a5 44 __ LDA T0 + 1 
4053 : 48 __ __ PHA
4054 : a5 45 __ LDA T2 + 0 
4056 : 48 __ __ PHA
4057 : a5 46 __ LDA $46 
4059 : 48 __ __ PHA
405a : a5 47 __ LDA $47 
405c : 48 __ __ PHA
405d : a5 48 __ LDA $48 
405f : 48 __ __ PHA
4060 : a5 49 __ LDA $49 
4062 : 48 __ __ PHA
4063 : a5 4a __ LDA $4a 
4065 : 48 __ __ PHA
4066 : a5 4b __ LDA $4b 
4068 : 48 __ __ PHA
4069 : a5 4c __ LDA $4c 
406b : 48 __ __ PHA
406c : a5 4d __ LDA $4d 
406e : 48 __ __ PHA
406f : a5 4e __ LDA $4e 
4071 : 48 __ __ PHA
4072 : a5 4f __ LDA $4f 
4074 : 48 __ __ PHA
4075 : a5 50 __ LDA $50 
4077 : 48 __ __ PHA
4078 : a5 51 __ LDA $51 
407a : 48 __ __ PHA
.s4:
407b : ad c8 82 LDA $82c8 ; (modplay.active + 0)
407e : d0 03 __ BNE $4083 ; (modplay_tick.s5 + 0)
4080 : 4c 19 41 JMP $4119 ; (modplay_tick.s3 + 0)
.s5:
4083 : ad fd 73 LDA $73fd ; (mod_paused + 0)
4086 : d0 f8 __ BNE $4080 ; (modplay_tick.s4 + 5)
.s6:
4088 : ad c2 82 LDA $82c2 ; (modplay.tick + 0)
408b : d0 19 __ BNE $40a6 ; (modplay_tick.s25 + 0)
.s7:
408d : ad c4 82 LDA $82c4 ; (modplay.bpm + 0)
4090 : 20 13 3f JSR $3f13 ; (bpm_to_timer.s4 + 0)
4093 : a5 1b __ LDA ACCU + 0 
4095 : 8d 04 dc STA $dc04 
4098 : a5 1c __ LDA ACCU + 1 
409a : 8d 05 dc STA $dc05 
409d : 20 a8 41 JSR $41a8 ; (process_new_row.s1 + 0)
40a0 : ac c3 82 LDY $82c3 ; (modplay.ticks_per_row + 0)
40a3 : 4c bf 40 JMP $40bf ; (modplay_tick.s8 + 0)
.s25:
40a6 : a9 00 __ LDA #$00
40a8 : 85 0f __ STA P2 
40aa : 20 3a 48 JSR $483a ; (fx_tick.s4 + 0)
40ad : e6 0f __ INC P2 
40af : 20 3a 48 JSR $483a ; (fx_tick.s4 + 0)
40b2 : e6 0f __ INC P2 
40b4 : 20 3a 48 JSR $483a ; (fx_tick.s4 + 0)
40b7 : e6 0f __ INC P2 
40b9 : 20 3a 48 JSR $483a ; (fx_tick.s4 + 0)
40bc : ac c2 82 LDY $82c2 ; (modplay.tick + 0)
.s8:
40bf : 88 __ __ DEY
40c0 : 8c c2 82 STY $82c2 ; (modplay.tick + 0)
40c3 : a9 00 __ LDA #$00
40c5 : 85 13 __ STA P6 
.l26:
40c7 : 20 b7 4a JSR $4ab7 ; (ua_update_channel.s1 + 0)
40ca : e6 13 __ INC P6 
40cc : a5 13 __ LDA P6 
40ce : c9 04 __ CMP #$04
40d0 : 90 f5 __ BCC $40c7 ; (modplay_tick.l26 + 0)
.s9:
40d2 : ad c2 82 LDA $82c2 ; (modplay.tick + 0)
40d5 : d0 42 __ BNE $4119 ; (modplay_tick.s3 + 0)
.s10:
40d7 : ad c5 82 LDA $82c5 ; (modplay.pattern_delay + 0)
40da : f0 05 __ BEQ $40e1 ; (modplay_tick.s11 + 0)
.s24:
40dc : ce c5 82 DEC $82c5 ; (modplay.pattern_delay + 0)
40df : b0 38 __ BCS $4119 ; (modplay_tick.s3 + 0)
.s11:
40e1 : ad ca 82 LDA $82ca ; (modplay.skip_row_advance + 0)
40e4 : f0 03 __ BEQ $40e9 ; (modplay_tick.s12 + 0)
40e6 : 4c 76 41 JMP $4176 ; (modplay_tick.s18 + 0)
.s12:
40e9 : ee c1 82 INC $82c1 ; (modplay.row + 0)
40ec : ad c1 82 LDA $82c1 ; (modplay.row + 0)
40ef : c9 40 __ CMP #$40
40f1 : 90 26 __ BCC $4119 ; (modplay_tick.s3 + 0)
.s13:
40f3 : ee bf 82 INC $82bf ; (modplay.order_pos + 0)
40f6 : a9 00 __ LDA #$00
40f8 : 8d c1 82 STA $82c1 ; (modplay.row + 0)
40fb : ad bf 82 LDA $82bf ; (modplay.order_pos + 0)
40fe : cd 3c 82 CMP $823c ; (modplay.song_length + 0)
4101 : 90 0f __ BCC $4112 ; (modplay_tick.s14 + 0)
.s15:
4103 : ad c9 82 LDA $82c9 ; (modplay.loop_song + 0)
4106 : d0 05 __ BNE $410d ; (modplay_tick.s17 + 0)
.s16:
4108 : 8d c8 82 STA $82c8 ; (modplay.active + 0)
410b : b0 0c __ BCS $4119 ; (modplay_tick.s3 + 0)
.s17:
410d : a9 00 __ LDA #$00
410f : 8d bf 82 STA $82bf ; (modplay.order_pos + 0)
.s14:
4112 : aa __ __ TAX
4113 : bd 3f 82 LDA $823f,x ; (modplay.order_table[0] + 0)
4116 : 8d c0 82 STA $82c0 ; (modplay.pattern_num + 0)
.s3:
4119 : 68 __ __ PLA
411a : 85 51 __ STA $51 
411c : 68 __ __ PLA
411d : 85 50 __ STA $50 
411f : 68 __ __ PLA
4120 : 85 4f __ STA $4f 
4122 : 68 __ __ PLA
4123 : 85 4e __ STA $4e 
4125 : 68 __ __ PLA
4126 : 85 4d __ STA $4d 
4128 : 68 __ __ PLA
4129 : 85 4c __ STA $4c 
412b : 68 __ __ PLA
412c : 85 4b __ STA $4b 
412e : 68 __ __ PLA
412f : 85 4a __ STA $4a 
4131 : 68 __ __ PLA
4132 : 85 49 __ STA $49 
4134 : 68 __ __ PLA
4135 : 85 48 __ STA $48 
4137 : 68 __ __ PLA
4138 : 85 47 __ STA $47 
413a : 68 __ __ PLA
413b : 85 46 __ STA $46 
413d : 68 __ __ PLA
413e : 85 45 __ STA T2 + 0 
4140 : 68 __ __ PLA
4141 : 85 44 __ STA T0 + 1 
4143 : 68 __ __ PLA
4144 : 85 43 __ STA T0 + 0 
4146 : 68 __ __ PLA
4147 : 85 1e __ STA ACCU + 3 
4149 : 68 __ __ PLA
414a : 85 1d __ STA ACCU + 2 
414c : 68 __ __ PLA
414d : 85 1c __ STA ACCU + 1 
414f : 68 __ __ PLA
4150 : 85 1b __ STA ACCU + 0 
4152 : 68 __ __ PLA
4153 : 85 13 __ STA P6 
4155 : 68 __ __ PLA
4156 : 85 12 __ STA P5 
4158 : 68 __ __ PLA
4159 : 85 11 __ STA P4 
415b : 68 __ __ PLA
415c : 85 10 __ STA P3 
415e : 68 __ __ PLA
415f : 85 0f __ STA P2 
4161 : 68 __ __ PLA
4162 : 85 0e __ STA P1 
4164 : 68 __ __ PLA
4165 : 85 0d __ STA P0 
4167 : 68 __ __ PLA
4168 : 85 06 __ STA WORK + 3 
416a : 68 __ __ PLA
416b : 85 05 __ STA WORK + 2 
416d : 68 __ __ PLA
416e : 85 04 __ STA WORK + 1 
4170 : 68 __ __ PLA
4171 : 85 03 __ STA WORK + 0 
4173 : e6 24 __ INC SP + 1 
4175 : 60 __ __ RTS
.s18:
4176 : ad cb 82 LDA $82cb ; (modplay.next_order + 0)
4179 : c9 ff __ CMP #$ff
417b : f0 06 __ BEQ $4183 ; (modplay_tick.s19 + 0)
.s23:
417d : 8d bf 82 STA $82bf ; (modplay.order_pos + 0)
4180 : 4c 86 41 JMP $4186 ; (modplay_tick.s27 + 0)
.s19:
4183 : ad bf 82 LDA $82bf ; (modplay.order_pos + 0)
.s27:
4186 : cd 3c 82 CMP $823c ; (modplay.song_length + 0)
4189 : 90 0d __ BCC $4198 ; (modplay_tick.s20 + 0)
.s21:
418b : ad c9 82 LDA $82c9 ; (modplay.loop_song + 0)
418e : d0 03 __ BNE $4193 ; (modplay_tick.s22 + 0)
4190 : 4c 08 41 JMP $4108 ; (modplay_tick.s16 + 0)
.s22:
4193 : a9 00 __ LDA #$00
4195 : 8d bf 82 STA $82bf ; (modplay.order_pos + 0)
.s20:
4198 : aa __ __ TAX
4199 : bd 3f 82 LDA $823f,x ; (modplay.order_table[0] + 0)
419c : 8d c0 82 STA $82c0 ; (modplay.pattern_num + 0)
419f : ad cc 82 LDA $82cc ; (modplay.next_row + 0)
41a2 : 8d c1 82 STA $82c1 ; (modplay.row + 0)
41a5 : 4c 19 41 JMP $4119 ; (modplay_tick.s3 + 0)
--------------------------------------------------------------------
process_new_row: ; process_new_row()->void
; 579, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s1:
41a8 : 38 __ __ SEC
41a9 : a5 23 __ LDA SP + 0 
41ab : e9 0b __ SBC #$0b
41ad : 85 23 __ STA SP + 0 
41af : b0 02 __ BCS $41b3 ; (process_new_row.s4 + 0)
41b1 : c6 24 __ DEC SP + 1 
.s4:
41b3 : a9 00 __ LDA #$00
41b5 : 8d ca 82 STA $82ca ; (modplay.skip_row_advance + 0)
41b8 : 8d cc 82 STA $82cc ; (modplay.next_row + 0)
41bb : ad 38 82 LDA $8238 ; (modplay.reu_base + 0)
41be : 18 __ __ CLC
41bf : 69 3c __ ADC #$3c
41c1 : 85 43 __ STA T0 + 0 
41c3 : a9 ff __ LDA #$ff
41c5 : 8d cb 82 STA $82cb ; (modplay.next_order + 0)
41c8 : a9 ea __ LDA #$ea
41ca : 8d 02 df STA $df02 
41cd : a9 85 __ LDA #$85
41cf : 8d 03 df STA $df03 
41d2 : ad 39 82 LDA $8239 ; (modplay.reu_base + 1)
41d5 : 69 04 __ ADC #$04
41d7 : aa __ __ TAX
41d8 : ac 3a 82 LDY $823a ; (modplay.reu_base + 2)
41db : 90 01 __ BCC $41de ; (process_new_row.s9 + 0)
.s8:
41dd : c8 __ __ INY
.s9:
41de : ad c0 82 LDA $82c0 ; (modplay.pattern_num + 0)
41e1 : 0a __ __ ASL
41e2 : 85 1c __ STA ACCU + 1 
41e4 : a9 00 __ LDA #$00
41e6 : 2a __ __ ROL
41e7 : 06 1c __ ASL ACCU + 1 
41e9 : 2a __ __ ROL
41ea : 85 1d __ STA ACCU + 2 
41ec : 8a __ __ TXA
41ed : 65 1c __ ADC ACCU + 1 
41ef : 85 44 __ STA T0 + 1 
41f1 : 98 __ __ TYA
41f2 : 65 1d __ ADC ACCU + 2 
41f4 : 85 45 __ STA T0 + 2 
41f6 : ad c1 82 LDA $82c1 ; (modplay.row + 0)
41f9 : 85 1b __ STA ACCU + 0 
41fb : a9 00 __ LDA #$00
41fd : 85 1c __ STA ACCU + 1 
41ff : 85 1d __ STA ACCU + 2 
4201 : a2 04 __ LDX #$04
.l5:
4203 : 06 1b __ ASL ACCU + 0 
4205 : 26 1c __ ROL ACCU + 1 
4207 : 26 1d __ ROL ACCU + 2 
4209 : 2a __ __ ROL
420a : ca __ __ DEX
420b : d0 f6 __ BNE $4203 ; (process_new_row.l5 + 0)
.s6:
420d : 18 __ __ CLC
420e : a5 1b __ LDA ACCU + 0 
4210 : 65 43 __ ADC T0 + 0 
4212 : 8d 04 df STA $df04 
4215 : a5 1c __ LDA ACCU + 1 
4217 : 65 44 __ ADC T0 + 1 
4219 : 8d 05 df STA $df05 
421c : a5 1d __ LDA ACCU + 2 
421e : 65 45 __ ADC T0 + 2 
4220 : 8d 06 df STA $df06 
4223 : a9 10 __ LDA #$10
4225 : 8d 07 df STA $df07 
4228 : 8e 08 df STX $df08 
422b : 8e 0a df STX $df0a 
422e : 86 4a __ STX T5 + 0 
4230 : 86 4b __ STX T7 + 0 
4232 : 86 10 __ STX P3 
4234 : a9 91 __ LDA #$91
4236 : 8d 01 df STA $df01 
4239 : 18 __ __ CLC
423a : a5 23 __ LDA SP + 0 
423c : 69 06 __ ADC #$06
423e : 85 11 __ STA P4 
4240 : a5 24 __ LDA SP + 1 
4242 : 69 00 __ ADC #$00
4244 : 85 12 __ STA P5 
.l7:
4246 : a6 4b __ LDX T7 + 0 
4248 : bd ea 85 LDA $85ea,x ; (mod_row_buf[0] + 0)
424b : 29 f0 __ AND #$f0
424d : 85 48 __ STA T2 + 0 
424f : bd ec 85 LDA $85ec,x ; (mod_row_buf[0] + 2)
4252 : 4a __ __ LSR
4253 : 4a __ __ LSR
4254 : 4a __ __ LSR
4255 : 4a __ __ LSR
4256 : 05 48 __ ORA T2 + 0 
4258 : a0 06 __ LDY #$06
425a : 91 23 __ STA (SP + 0),y 
425c : bd eb 85 LDA $85eb,x ; (mod_row_buf[0] + 1)
425f : c8 __ __ INY
4260 : 91 23 __ STA (SP + 0),y 
4262 : bd ea 85 LDA $85ea,x ; (mod_row_buf[0] + 0)
4265 : 29 0f __ AND #$0f
4267 : c8 __ __ INY
4268 : 91 23 __ STA (SP + 0),y 
426a : bd ec 85 LDA $85ec,x ; (mod_row_buf[0] + 2)
426d : 29 0f __ AND #$0f
426f : 85 49 __ STA T3 + 0 
4271 : c8 __ __ INY
4272 : 91 23 __ STA (SP + 0),y 
4274 : bd ed 85 LDA $85ed,x ; (mod_row_buf[0] + 3)
4277 : c8 __ __ INY
4278 : 91 23 __ STA (SP + 0),y 
427a : a5 49 __ LDA T3 + 0 
427c : a4 4a __ LDY T5 + 0 
427e : 99 21 85 STA $8521,y ; (modplay.channel[0].effect + 0)
4281 : bd ed 85 LDA $85ed,x ; (mod_row_buf[0] + 3)
4284 : 99 22 85 STA $8522,y ; (modplay.channel[0].eparam + 0)
4287 : 20 b3 42 JSR $42b3 ; (apply_note.s4 + 0)
428a : a5 10 __ LDA P3 
428c : 85 0f __ STA P2 
428e : 20 3d 45 JSR $453d ; (fx_row.s4 + 0)
4291 : 18 __ __ CLC
4292 : a5 4a __ LDA T5 + 0 
4294 : 69 32 __ ADC #$32
4296 : 85 4a __ STA T5 + 0 
4298 : 18 __ __ CLC
4299 : a5 4b __ LDA T7 + 0 
429b : 69 04 __ ADC #$04
429d : 85 4b __ STA T7 + 0 
429f : e6 10 __ INC P3 
42a1 : a5 10 __ LDA P3 
42a3 : c9 04 __ CMP #$04
42a5 : 90 9f __ BCC $4246 ; (process_new_row.l7 + 0)
.s3:
42a7 : 18 __ __ CLC
42a8 : a5 23 __ LDA SP + 0 
42aa : 69 0b __ ADC #$0b
42ac : 85 23 __ STA SP + 0 
42ae : 90 02 __ BCC $42b2 ; (process_new_row.s3 + 11)
42b0 : e6 24 __ INC SP + 1 
42b2 : 60 __ __ RTS
--------------------------------------------------------------------
apply_note: ; apply_note(u8,struct S#23770*)->void
; 194, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
42b3 : a5 10 __ LDA P3 ; (ch_idx + 0)
42b5 : 0a __ __ ASL
42b6 : 18 __ __ CLC
42b7 : 65 10 __ ADC P3 ; (ch_idx + 0)
42b9 : 0a __ __ ASL
42ba : 0a __ __ ASL
42bb : 0a __ __ ASL
42bc : 18 __ __ CLC
42bd : 65 10 __ ADC P3 ; (ch_idx + 0)
42bf : 0a __ __ ASL
42c0 : 85 47 __ STA T3 + 0 
42c2 : a0 00 __ LDY #$00
42c4 : b1 11 __ LDA (P4),y ; (n + 0)
42c6 : d0 03 __ BNE $42cb ; (apply_note.s14 + 0)
42c8 : 4c 7b 43 JMP $437b ; (apply_note.s5 + 0)
.s14:
42cb : ad 3d 82 LDA $823d ; (modplay.num_samples + 0)
42ce : d1 11 __ CMP (P4),y ; (n + 0)
42d0 : 90 f6 __ BCC $42c8 ; (apply_note.s4 + 21)
.s15:
42d2 : 84 1c __ STY ACCU + 1 
42d4 : b1 11 __ LDA (P4),y ; (n + 0)
42d6 : a6 47 __ LDX T3 + 0 
42d8 : 9d 1a 85 STA $851a,x ; (modplay.channel[0].sample_num + 0)
42db : 85 1b __ STA ACCU + 0 
42dd : a9 13 __ LDA #$13
42df : 20 e1 6d JSR $6de1 ; (mul16by8 + 0)
42e2 : 18 __ __ CLC
42e3 : a9 ba __ LDA #$ba
42e5 : 65 1b __ ADC ACCU + 0 
42e7 : 85 1b __ STA ACCU + 0 
42e9 : a9 82 __ LDA #$82
42eb : 65 1c __ ADC ACCU + 1 
42ed : 85 1c __ STA ACCU + 1 
42ef : a0 11 __ LDY #$11
42f1 : b1 1b __ LDA (ACCU + 0),y 
42f3 : a6 47 __ LDX T3 + 0 
42f5 : 9d 1f 85 STA $851f,x ; (modplay.channel[0].volume + 0)
42f8 : 88 __ __ DEY
42f9 : b1 1b __ LDA (ACCU + 0),y 
42fb : 9d 3b 85 STA $853b,x ; (modplay.channel[0].needs_loop + 0)
42fe : a0 01 __ LDY #$01
4300 : b1 1b __ LDA (ACCU + 0),y 
4302 : 85 44 __ STA T0 + 1 
4304 : 9d 3d 85 STA $853d,x ; (modplay.channel[0].smp_start + 1)
4307 : c8 __ __ INY
4308 : b1 1b __ LDA (ACCU + 0),y 
430a : 85 45 __ STA T0 + 2 
430c : 9d 3e 85 STA $853e,x ; (modplay.channel[0].smp_start + 2)
430f : c8 __ __ INY
4310 : b1 1b __ LDA (ACCU + 0),y 
4312 : 85 46 __ STA T0 + 3 
4314 : 9d 3f 85 STA $853f,x ; (modplay.channel[0].smp_start + 3)
4317 : a0 00 __ LDY #$00
4319 : b1 1b __ LDA (ACCU + 0),y 
431b : 85 43 __ STA T0 + 0 
431d : 9d 3c 85 STA $853c,x ; (modplay.channel[0].smp_start + 0)
4320 : a0 04 __ LDY #$04
4322 : b1 1b __ LDA (ACCU + 0),y 
4324 : 9d 40 85 STA $8540,x ; (modplay.channel[0].smp_length + 0)
4327 : c8 __ __ INY
4328 : b1 1b __ LDA (ACCU + 0),y 
432a : 9d 41 85 STA $8541,x ; (modplay.channel[0].smp_length + 1)
432d : c8 __ __ INY
432e : b1 1b __ LDA (ACCU + 0),y 
4330 : 9d 42 85 STA $8542,x ; (modplay.channel[0].smp_length + 2)
4333 : c8 __ __ INY
4334 : b1 1b __ LDA (ACCU + 0),y 
4336 : 9d 43 85 STA $8543,x ; (modplay.channel[0].smp_length + 3)
4339 : 18 __ __ CLC
433a : c8 __ __ INY
433b : b1 1b __ LDA (ACCU + 0),y 
433d : 65 43 __ ADC T0 + 0 
433f : 9d 44 85 STA $8544,x ; (modplay.channel[0].smp_loop_a + 0)
4342 : c8 __ __ INY
4343 : b1 1b __ LDA (ACCU + 0),y 
4345 : 65 44 __ ADC T0 + 1 
4347 : 9d 45 85 STA $8545,x ; (modplay.channel[0].smp_loop_a + 1)
434a : c8 __ __ INY
434b : b1 1b __ LDA (ACCU + 0),y 
434d : 65 45 __ ADC T0 + 2 
434f : 9d 46 85 STA $8546,x ; (modplay.channel[0].smp_loop_a + 2)
4352 : c8 __ __ INY
4353 : b1 1b __ LDA (ACCU + 0),y 
4355 : 65 46 __ ADC T0 + 3 
4357 : 9d 47 85 STA $8547,x ; (modplay.channel[0].smp_loop_a + 3)
435a : 18 __ __ CLC
435b : c8 __ __ INY
435c : b1 1b __ LDA (ACCU + 0),y 
435e : 65 43 __ ADC T0 + 0 
4360 : 9d 48 85 STA $8548,x ; (modplay.channel[0].smp_loop_b + 0)
4363 : c8 __ __ INY
4364 : b1 1b __ LDA (ACCU + 0),y 
4366 : 65 44 __ ADC T0 + 1 
4368 : 9d 49 85 STA $8549,x ; (modplay.channel[0].smp_loop_b + 1)
436b : c8 __ __ INY
436c : b1 1b __ LDA (ACCU + 0),y 
436e : 65 45 __ ADC T0 + 2 
4370 : 9d 4a 85 STA $854a,x ; (modplay.channel[0].smp_loop_b + 2)
4373 : c8 __ __ INY
4374 : b1 1b __ LDA (ACCU + 0),y 
4376 : 65 46 __ ADC T0 + 3 
4378 : 9d 4b 85 STA $854b,x ; (modplay.channel[0].smp_loop_b + 3)
.s5:
437b : a0 01 __ LDY #$01
437d : b1 11 __ LDA (P4),y ; (n + 0)
437f : 85 0d __ STA P0 
4381 : c8 __ __ INY
4382 : b1 11 __ LDA (P4),y ; (n + 0)
4384 : 85 0e __ STA P1 
4386 : c8 __ __ INY
4387 : 05 0d __ ORA P0 
4389 : f0 6f __ BEQ $43fa ; (apply_note.s6 + 0)
.s10:
438b : b1 11 __ LDA (P4),y ; (n + 0)
438d : c9 03 __ CMP #$03
438f : f0 69 __ BEQ $43fa ; (apply_note.s6 + 0)
.s11:
4391 : a6 47 __ LDX T3 + 0 
4393 : bd 1a 85 LDA $851a,x ; (modplay.channel[0].sample_num + 0)
4396 : f0 1a __ BEQ $43b2 ; (apply_note.s18 + 0)
.s13:
4398 : 85 1b __ STA ACCU + 0 
439a : a9 00 __ LDA #$00
439c : 85 1c __ STA ACCU + 1 
439e : a9 13 __ LDA #$13
43a0 : 20 e1 6d JSR $6de1 ; (mul16by8 + 0)
43a3 : a9 cc __ LDA #$cc
43a5 : 85 43 __ STA T0 + 0 
43a7 : 18 __ __ CLC
43a8 : a9 82 __ LDA #$82
43aa : 65 1c __ ADC ACCU + 1 
43ac : 85 44 __ STA T0 + 1 
43ae : a4 1b __ LDY ACCU + 0 
43b0 : b1 43 __ LDA (T0 + 0),y 
.s18:
43b2 : 85 0f __ STA P2 
43b4 : 20 45 44 JSR $4445 ; (period_finetune.s4 + 0)
43b7 : a5 1b __ LDA ACCU + 0 
43b9 : 85 0d __ STA P0 
43bb : a6 47 __ LDX T3 + 0 
43bd : 9d 1b 85 STA $851b,x ; (modplay.channel[0].period + 0)
43c0 : a5 1c __ LDA ACCU + 1 
43c2 : 85 0e __ STA P1 
43c4 : 9d 1c 85 STA $851c,x ; (modplay.channel[0].period + 1)
43c7 : 20 f4 44 JSR $44f4 ; (period_to_rate.s4 + 0)
43ca : a5 1b __ LDA ACCU + 0 
43cc : a6 47 __ LDX T3 + 0 
43ce : 9d 1d 85 STA $851d,x ; (modplay.channel[0].rate + 0)
43d1 : a5 1c __ LDA ACCU + 1 
43d3 : 9d 1e 85 STA $851e,x ; (modplay.channel[0].rate + 1)
43d6 : a0 00 __ LDY #$00
43d8 : b1 11 __ LDA (P4),y ; (n + 0)
43da : 9d 31 85 STA $8531,x ; (modplay.channel[0].last_note + 0)
43dd : a0 03 __ LDY #$03
43df : b1 11 __ LDA (P4),y ; (n + 0)
43e1 : c9 03 __ CMP #$03
43e3 : f0 15 __ BEQ $43fa ; (apply_note.s6 + 0)
.s12:
43e5 : a8 __ __ TAY
43e6 : a9 00 __ LDA #$00
43e8 : 9d 27 85 STA $8527,x ; (modplay.channel[0].vib_pos + 0)
43eb : 9d 2b 85 STA $852b,x ; (modplay.channel[0].trm_pos + 0)
43ee : 9d 30 85 STA $8530,x ; (modplay.channel[0].arp_counter + 0)
43f1 : a9 01 __ LDA #$01
43f3 : 9d 3a 85 STA $853a,x ; (modplay.channel[0].needs_start + 0)
43f6 : 98 __ __ TYA
43f7 : 4c fc 43 JMP $43fc ; (apply_note.s16 + 0)
.s6:
43fa : b1 11 __ LDA (P4),y ; (n + 0)
.s16:
43fc : c9 03 __ CMP #$03
43fe : d0 44 __ BNE $4444 ; (apply_note.s3 + 0)
.s7:
4400 : a0 01 __ LDY #$01
4402 : b1 11 __ LDA (P4),y ; (n + 0)
4404 : 85 0d __ STA P0 
4406 : c8 __ __ INY
4407 : 11 11 __ ORA (P4),y ; (n + 0)
4409 : f0 39 __ BEQ $4444 ; (apply_note.s3 + 0)
.s8:
440b : b1 11 __ LDA (P4),y ; (n + 0)
440d : 85 0e __ STA P1 
440f : a6 47 __ LDX T3 + 0 
4411 : bd 1a 85 LDA $851a,x ; (modplay.channel[0].sample_num + 0)
4414 : f0 1a __ BEQ $4430 ; (apply_note.s17 + 0)
.s9:
4416 : 85 1b __ STA ACCU + 0 
4418 : a9 00 __ LDA #$00
441a : 85 1c __ STA ACCU + 1 
441c : a9 13 __ LDA #$13
441e : 20 e1 6d JSR $6de1 ; (mul16by8 + 0)
4421 : a9 cc __ LDA #$cc
4423 : 85 43 __ STA T0 + 0 
4425 : 18 __ __ CLC
4426 : a9 82 __ LDA #$82
4428 : 65 1c __ ADC ACCU + 1 
442a : 85 44 __ STA T0 + 1 
442c : a4 1b __ LDY ACCU + 0 
442e : b1 43 __ LDA (T0 + 0),y 
.s17:
4430 : 85 0f __ STA P2 
4432 : 20 45 44 JSR $4445 ; (period_finetune.s4 + 0)
4435 : 20 ec 44 JSR $44ec ; (period_to_rate@proxy + 0)
4438 : a5 1b __ LDA ACCU + 0 
443a : a6 47 __ LDX T3 + 0 
443c : 9d 23 85 STA $8523,x ; (modplay.channel[0].porta_target + 0)
443f : a5 1c __ LDA ACCU + 1 
4441 : 9d 24 85 STA $8524,x ; (modplay.channel[0].porta_target + 1)
.s3:
4444 : 60 __ __ RTS
--------------------------------------------------------------------
period_finetune: ; period_finetune(u16,u8)->u16
;  59, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4445 : a5 0f __ LDA P2 ; (finetune_raw + 0)
4447 : c9 08 __ CMP #$08
4449 : b0 03 __ BCS $444e ; (period_finetune.s14 + 0)
444b : 4c e3 44 JMP $44e3 ; (period_finetune.s5 + 0)
.s14:
444e : e9 10 __ SBC #$10
4450 : 85 0f __ STA P2 ; (finetune_raw + 0)
4452 : f0 06 __ BEQ $445a ; (period_finetune.s6 + 0)
.s7:
4454 : a5 0e __ LDA P1 ; (period + 1)
4456 : 05 0d __ ORA P0 ; (period + 0)
4458 : d0 09 __ BNE $4463 ; (period_finetune.s8 + 0)
.s6:
445a : a5 0d __ LDA P0 ; (period + 0)
445c : 85 1b __ STA ACCU + 0 
445e : a5 0e __ LDA P1 ; (period + 1)
4460 : 4c e0 44 JMP $44e0 ; (period_finetune.s3 + 0)
.s8:
4463 : a5 0f __ LDA P2 ; (finetune_raw + 0)
4465 : 10 05 __ BPL $446c ; (period_finetune.s9 + 0)
.s13:
4467 : 38 __ __ SEC
4468 : a9 00 __ LDA #$00
446a : e5 0f __ SBC P2 ; (finetune_raw + 0)
.s9:
446c : a6 0d __ LDX P0 ; (period + 0)
446e : 86 1b __ STX ACCU + 0 
4470 : a6 0e __ LDX P1 ; (period + 1)
4472 : 86 1c __ STX ACCU + 1 
4474 : a2 00 __ LDX #$00
4476 : 86 1d __ STX ACCU + 2 
4478 : 86 1e __ STX ACCU + 3 
447a : 20 19 6e JSR $6e19 ; (mul32by8 + 0)
447d : a5 07 __ LDA WORK + 4 
447f : 85 1b __ STA ACCU + 0 
4481 : a5 08 __ LDA WORK + 5 
4483 : 85 1c __ STA ACCU + 1 
4485 : a5 09 __ LDA WORK + 6 
4487 : 85 1d __ STA ACCU + 2 
4489 : a5 0a __ LDA WORK + 7 
448b : 85 1e __ STA ACCU + 3 
448d : a9 00 __ LDA #$00
448f : 85 05 __ STA WORK + 2 
4491 : 85 06 __ STA WORK + 3 
4493 : a9 e9 __ LDA #$e9
4495 : 85 03 __ STA WORK + 0 
4497 : a9 02 __ LDA #$02
4499 : 85 04 __ STA WORK + 1 
449b : 20 59 6f JSR $6f59 ; (mul32 + 0)
449e : a5 07 __ LDA WORK + 4 
44a0 : 85 1b __ STA ACCU + 0 
44a2 : a5 08 __ LDA WORK + 5 
44a4 : 85 1c __ STA ACCU + 1 
44a6 : a5 09 __ LDA WORK + 6 
44a8 : 85 1d __ STA ACCU + 2 
44aa : a5 0a __ LDA WORK + 7 
44ac : 85 1e __ STA ACCU + 3 
44ae : a9 a0 __ LDA #$a0
44b0 : 85 03 __ STA WORK + 0 
44b2 : a9 00 __ LDA #$00
44b4 : 85 06 __ STA WORK + 3 
44b6 : a9 86 __ LDA #$86
44b8 : 85 04 __ STA WORK + 1 
44ba : a9 01 __ LDA #$01
44bc : 85 05 __ STA WORK + 2 
44be : 20 c1 6f JSR $6fc1 ; (divs32 + 0)
44c1 : a5 0f __ LDA P2 ; (finetune_raw + 0)
44c3 : 30 02 __ BMI $44c7 ; (period_finetune.s10 + 0)
.s12:
44c5 : d0 0e __ BNE $44d5 ; (period_finetune.s11 + 0)
.s10:
44c7 : 18 __ __ CLC
44c8 : a5 0d __ LDA P0 ; (period + 0)
44ca : 65 1b __ ADC ACCU + 0 
44cc : 85 1b __ STA ACCU + 0 
44ce : a5 0e __ LDA P1 ; (period + 1)
44d0 : 65 1c __ ADC ACCU + 1 
44d2 : 4c e0 44 JMP $44e0 ; (period_finetune.s3 + 0)
.s11:
44d5 : 38 __ __ SEC
44d6 : a5 0d __ LDA P0 ; (period + 0)
44d8 : e5 1b __ SBC ACCU + 0 
44da : 85 1b __ STA ACCU + 0 
44dc : a5 0e __ LDA P1 ; (period + 1)
44de : e5 1c __ SBC ACCU + 1 
.s3:
44e0 : 85 1c __ STA ACCU + 1 
44e2 : 60 __ __ RTS
.s5:
44e3 : aa __ __ TAX
44e4 : d0 03 __ BNE $44e9 ; (period_finetune.s5 + 6)
44e6 : 4c 5a 44 JMP $445a ; (period_finetune.s6 + 0)
44e9 : 4c 54 44 JMP $4454 ; (period_finetune.s7 + 0)
--------------------------------------------------------------------
period_to_rate@proxy: ; period_to_rate@proxy
44ec : a5 1b __ LDA ACCU + 0 
44ee : 85 0d __ STA P0 
44f0 : a5 1c __ LDA ACCU + 1 
44f2 : 85 0e __ STA P1 
--------------------------------------------------------------------
period_to_rate: ; period_to_rate(u16)->u16
;  41, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
44f4 : a5 0e __ LDA P1 ; (period + 1)
44f6 : 05 0d __ ORA P0 ; (period + 0)
44f8 : f0 3e __ BEQ $4538 ; (period_to_rate.s6 + 0)
.s5:
44fa : a5 0d __ LDA P0 ; (period + 0)
44fc : 85 1b __ STA ACCU + 0 
44fe : a5 0e __ LDA P1 ; (period + 1)
4500 : 85 1c __ STA ACCU + 1 
4502 : a9 00 __ LDA #$00
4504 : 85 1d __ STA ACCU + 2 
4506 : 85 1e __ STA ACCU + 3 
4508 : 85 05 __ STA WORK + 2 
450a : 85 06 __ STA WORK + 3 
450c : a9 d4 __ LDA #$d4
450e : 85 03 __ STA WORK + 0 
4510 : a9 30 __ LDA #$30
4512 : 85 04 __ STA WORK + 1 
4514 : 20 59 6f JSR $6f59 ; (mul32 + 0)
4517 : a5 07 __ LDA WORK + 4 
4519 : 85 1b __ STA ACCU + 0 
451b : a5 08 __ LDA WORK + 5 
451d : 85 1c __ STA ACCU + 1 
451f : a5 09 __ LDA WORK + 6 
4521 : 85 1d __ STA ACCU + 2 
4523 : a5 0a __ LDA WORK + 7 
4525 : 85 1e __ STA ACCU + 3 
4527 : a9 00 __ LDA #$00
4529 : 85 05 __ STA WORK + 2 
452b : 85 06 __ STA WORK + 3 
452d : a9 b6 __ LDA #$b6
452f : 85 03 __ STA WORK + 0 
4531 : a9 1b __ LDA #$1b
4533 : 85 04 __ STA WORK + 1 
4535 : 4c 37 3f JMP $3f37 ; (divmod32 + 0)
.s6:
4538 : 85 1b __ STA ACCU + 0 
453a : 85 1c __ STA ACCU + 1 
.s3:
453c : 60 __ __ RTS
--------------------------------------------------------------------
fx_row: ; fx_row(u8)->void
; 242, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
453d : a4 0f __ LDY P2 ; (ch_idx + 0)
453f : be 0f 72 LDX $720f,y ; (__multab50L + 0)
4542 : bd 22 85 LDA $8522,x ; (modplay.channel[0].eparam + 0)
4545 : 85 1c __ STA ACCU + 1 
4547 : 4a __ __ LSR
4548 : 4a __ __ LSR
4549 : 4a __ __ LSR
454a : 4a __ __ LSR
454b : 85 1b __ STA ACCU + 0 
454d : bd 21 85 LDA $8521,x ; (modplay.channel[0].effect + 0)
4550 : c9 08 __ CMP #$08
4552 : d0 09 __ BNE $455d ; (fx_row.s5 + 0)
.s93:
4554 : a4 1b __ LDY ACCU + 0 
4556 : b9 60 72 LDA $7260,y ; (__multab17L + 0)
4559 : 9d 20 85 STA $8520,x ; (modplay.channel[0].pan + 0)
.s3:
455c : 60 __ __ RTS
.s5:
455d : a5 1c __ LDA ACCU + 1 
455f : 29 0f __ AND #$0f
4561 : 85 43 __ STA T0 + 0 
4563 : bd 21 85 LDA $8521,x ; (modplay.channel[0].effect + 0)
4566 : c9 08 __ CMP #$08
4568 : b0 03 __ BCS $456d ; (fx_row.s6 + 0)
456a : 4c a4 47 JMP $47a4 ; (fx_row.s74 + 0)
.s6:
456d : c9 0c __ CMP #$0c
456f : d0 03 __ BNE $4574 ; (fx_row.s7 + 0)
4571 : 4c 96 47 JMP $4796 ; (fx_row.s73 + 0)
.s7:
4574 : b0 03 __ BCS $4579 ; (fx_row.s8 + 0)
4576 : 4c 19 47 JMP $4719 ; (fx_row.s57 + 0)
.s8:
4579 : c9 0e __ CMP #$0e
457b : f0 33 __ BEQ $45b0 ; (fx_row.s16 + 0)
.s9:
457d : 90 14 __ BCC $4593 ; (fx_row.s15 + 0)
.s10:
457f : c9 0f __ CMP #$0f
4581 : d0 d9 __ BNE $455c ; (fx_row.s3 + 0)
.s11:
4583 : a5 1c __ LDA ACCU + 1 
4585 : f0 d5 __ BEQ $455c ; (fx_row.s3 + 0)
.s12:
4587 : c9 20 __ CMP #$20
4589 : b0 04 __ BCS $458f ; (fx_row.s13 + 0)
.s14:
458b : 8d c3 82 STA $82c3 ; (modplay.ticks_per_row + 0)
458e : 60 __ __ RTS
.s13:
458f : 8d c4 82 STA $82c4 ; (modplay.bpm + 0)
4592 : 60 __ __ RTS
.s15:
4593 : ae bf 82 LDX $82bf ; (modplay.order_pos + 0)
4596 : e8 __ __ INX
4597 : 8e cb 82 STX $82cb ; (modplay.next_order + 0)
459a : a9 01 __ LDA #$01
459c : 8d ca 82 STA $82ca ; (modplay.skip_row_advance + 0)
459f : a6 1b __ LDX ACCU + 0 
45a1 : bd 50 72 LDA $7250,x ; (__multab10L + 0)
45a4 : 65 43 __ ADC T0 + 0 
45a6 : c9 40 __ CMP #$40
45a8 : 90 02 __ BCC $45ac ; (fx_row.s96 + 0)
.s97:
45aa : a9 00 __ LDA #$00
.s96:
45ac : 8d cc 82 STA $82cc ; (modplay.next_row + 0)
45af : 60 __ __ RTS
.s16:
45b0 : a5 1b __ LDA ACCU + 0 
45b2 : c9 07 __ CMP #$07
45b4 : d0 08 __ BNE $45be ; (fx_row.s17 + 0)
.s56:
45b6 : a5 43 __ LDA T0 + 0 
45b8 : 29 07 __ AND #$07
45ba : 9d 2a 85 STA $852a,x ; (modplay.channel[0].trm_wave + 0)
45bd : 60 __ __ RTS
.s17:
45be : 86 46 __ STX T3 + 0 
45c0 : c9 07 __ CMP #$07
45c2 : 90 6d __ BCC $4631 ; (fx_row.s34 + 0)
.s18:
45c4 : c9 0c __ CMP #$0c
45c6 : d0 0b __ BNE $45d3 ; (fx_row.s19 + 0)
.s33:
45c8 : a5 43 __ LDA T0 + 0 
45ca : 9d 34 85 STA $8534,x ; (modplay.channel[0].tick_stop + 0)
45cd : a9 00 __ LDA #$00
45cf : 9d 35 85 STA $8535,x ; (modplay.channel[0].tick_cur + 0)
45d2 : 60 __ __ RTS
.s19:
45d3 : 90 25 __ BCC $45fa ; (fx_row.s25 + 0)
.s20:
45d5 : c9 0d __ CMP #$0d
45d7 : f0 0b __ BEQ $45e4 ; (fx_row.s23 + 0)
.s21:
45d9 : c9 0e __ CMP #$0e
45db : f0 01 __ BEQ $45de ; (fx_row.s22 + 0)
45dd : 60 __ __ RTS
.s22:
45de : a5 43 __ LDA T0 + 0 
45e0 : 8d c5 82 STA $82c5 ; (modplay.pattern_delay + 0)
45e3 : 60 __ __ RTS
.s23:
45e4 : a5 43 __ LDA T0 + 0 
45e6 : 9d 34 85 STA $8534,x ; (modplay.channel[0].tick_stop + 0)
45e9 : a9 00 __ LDA #$00
45eb : 9d 35 85 STA $8535,x ; (modplay.channel[0].tick_cur + 0)
45ee : bd 3a 85 LDA $853a,x ; (modplay.channel[0].needs_start + 0)
45f1 : 9d 36 85 STA $8536,x ; (modplay.channel[0].cmd_backup + 0)
.s24:
45f4 : a9 00 __ LDA #$00
45f6 : 9d 3a 85 STA $853a,x ; (modplay.channel[0].needs_start + 0)
45f9 : 60 __ __ RTS
.s25:
45fa : c9 0a __ CMP #$0a
45fc : d0 0f __ BNE $460d ; (fx_row.s26 + 0)
.s32:
45fe : bd 1f 85 LDA $851f,x ; (modplay.channel[0].volume + 0)
4601 : 18 __ __ CLC
4602 : 65 43 __ ADC T0 + 0 
.s28:
4604 : 20 29 48 JSR $4829 ; (clamp_vol.s4 + 0)
4607 : a6 46 __ LDX T3 + 0 
.s95:
4609 : 9d 1f 85 STA $851f,x ; (modplay.channel[0].volume + 0)
460c : 60 __ __ RTS
.s26:
460d : b0 1a __ BCS $4629 ; (fx_row.s27 + 0)
.s30:
460f : c9 09 __ CMP #$09
4611 : f0 01 __ BEQ $4614 ; (fx_row.s31 + 0)
4613 : 60 __ __ RTS
.s31:
4614 : a5 43 __ LDA T0 + 0 
4616 : 9d 34 85 STA $8534,x ; (modplay.channel[0].tick_stop + 0)
4619 : a9 00 __ LDA #$00
461b : 9d 35 85 STA $8535,x ; (modplay.channel[0].tick_cur + 0)
461e : bd 3a 85 LDA $853a,x ; (modplay.channel[0].needs_start + 0)
4621 : 9d 36 85 STA $8536,x ; (modplay.channel[0].cmd_backup + 0)
4624 : a5 43 __ LDA T0 + 0 
4626 : d0 cc __ BNE $45f4 ; (fx_row.s24 + 0)
4628 : 60 __ __ RTS
.s27:
4629 : bd 1f 85 LDA $851f,x ; (modplay.channel[0].volume + 0)
462c : e5 43 __ SBC T0 + 0 
462e : 4c 04 46 JMP $4604 ; (fx_row.s28 + 0)
.s34:
4631 : c9 04 __ CMP #$04
4633 : d0 08 __ BNE $463d ; (fx_row.s35 + 0)
.s55:
4635 : a5 43 __ LDA T0 + 0 
4637 : 29 07 __ AND #$07
4639 : 9d 26 85 STA $8526,x ; (modplay.channel[0].vib_wave + 0)
463c : 60 __ __ RTS
.s35:
463d : 90 65 __ BCC $46a4 ; (fx_row.s46 + 0)
.s36:
463f : c9 05 __ CMP #$05
4641 : d0 2f __ BNE $4672 ; (fx_row.s37 + 0)
.s43:
4643 : bd 1a 85 LDA $851a,x ; (modplay.channel[0].sample_num + 0)
4646 : d0 01 __ BNE $4649 ; (fx_row.s44 + 0)
4648 : 60 __ __ RTS
.s44:
4649 : ad 3d 82 LDA $823d ; (modplay.num_samples + 0)
464c : dd 1a 85 CMP $851a,x ; (modplay.channel[0].sample_num + 0)
464f : b0 01 __ BCS $4652 ; (fx_row.s45 + 0)
4651 : 60 __ __ RTS
.s45:
4652 : bd 1a 85 LDA $851a,x ; (modplay.channel[0].sample_num + 0)
4655 : 85 1b __ STA ACCU + 0 
4657 : a9 00 __ LDA #$00
4659 : 85 1c __ STA ACCU + 1 
465b : a9 13 __ LDA #$13
465d : 20 e1 6d JSR $6de1 ; (mul16by8 + 0)
4660 : a9 cc __ LDA #$cc
4662 : 85 44 __ STA T1 + 0 
4664 : 18 __ __ CLC
4665 : a9 82 __ LDA #$82
4667 : 65 1c __ ADC ACCU + 1 
4669 : 85 45 __ STA T1 + 1 
466b : a5 43 __ LDA T0 + 0 
466d : a4 1b __ LDY ACCU + 0 
466f : 91 44 __ STA (T1 + 0),y 
4671 : 60 __ __ RTS
.s37:
4672 : a5 43 __ LDA T0 + 0 
4674 : d0 07 __ BNE $467d ; (fx_row.s39 + 0)
.s38:
4676 : ad c1 82 LDA $82c1 ; (modplay.row + 0)
4679 : 9d 32 85 STA $8532,x ; (modplay.channel[0].loop_row + 0)
467c : 60 __ __ RTS
.s39:
467d : bd 33 85 LDA $8533,x ; (modplay.channel[0].loop_count + 0)
4680 : f0 1a __ BEQ $469c ; (fx_row.s40 + 0)
.s42:
4682 : 38 __ __ SEC
4683 : e9 01 __ SBC #$01
4685 : 9d 33 85 STA $8533,x ; (modplay.channel[0].loop_count + 0)
4688 : d0 01 __ BNE $468b ; (fx_row.s41 + 0)
468a : 60 __ __ RTS
.s41:
468b : a9 01 __ LDA #$01
468d : 8d ca 82 STA $82ca ; (modplay.skip_row_advance + 0)
4690 : ad bf 82 LDA $82bf ; (modplay.order_pos + 0)
4693 : 8d cb 82 STA $82cb ; (modplay.next_order + 0)
4696 : bd 32 85 LDA $8532,x ; (modplay.channel[0].loop_row + 0)
4699 : 4c ac 45 JMP $45ac ; (fx_row.s96 + 0)
.s40:
469c : a5 43 __ LDA T0 + 0 
469e : 9d 33 85 STA $8533,x ; (modplay.channel[0].loop_count + 0)
46a1 : 4c 8b 46 JMP $468b ; (fx_row.s41 + 0)
.s46:
46a4 : c9 02 __ CMP #$02
46a6 : f0 4e __ BEQ $46f6 ; (fx_row.s54 + 0)
.s47:
46a8 : 90 01 __ BCC $46ab ; (fx_row.s48 + 0)
46aa : 60 __ __ RTS
.s48:
46ab : c9 01 __ CMP #$01
46ad : f0 01 __ BEQ $46b0 ; (fx_row.s49 + 0)
46af : 60 __ __ RTS
.s49:
46b0 : bd 1c 85 LDA $851c,x ; (modplay.channel[0].period + 1)
46b3 : d0 09 __ BNE $46be ; (fx_row.s52 + 0)
.s53:
46b5 : a9 71 __ LDA #$71
46b7 : dd 1b 85 CMP $851b,x ; (modplay.channel[0].period + 0)
46ba : a4 46 __ LDY T3 + 0 
46bc : b0 1e __ BCS $46dc ; (fx_row.s50 + 0)
.s52:
46be : bd 1b 85 LDA $851b,x ; (modplay.channel[0].period + 0)
46c1 : 38 __ __ SEC
46c2 : e5 43 __ SBC T0 + 0 
46c4 : 85 0d __ STA P0 
46c6 : bd 1c 85 LDA $851c,x ; (modplay.channel[0].period + 1)
46c9 : e9 00 __ SBC #$00
46cb : 85 0e __ STA P1 
46cd : 20 f9 47 JSR $47f9 ; (clamp_period.s4 + 0)
46d0 : a5 1b __ LDA ACCU + 0 
46d2 : a4 46 __ LDY T3 + 0 
46d4 : 99 1b 85 STA $851b,y ; (modplay.channel[0].period + 0)
46d7 : a5 1c __ LDA ACCU + 1 
46d9 : 99 1c 85 STA $851c,y ; (modplay.channel[0].period + 1)
.s50:
46dc : b9 1b 85 LDA $851b,y ; (modplay.channel[0].period + 0)
46df : 85 0d __ STA P0 
46e1 : b9 1c 85 LDA $851c,y ; (modplay.channel[0].period + 1)
.s51:
46e4 : 85 0e __ STA P1 
46e6 : 20 f4 44 JSR $44f4 ; (period_to_rate.s4 + 0)
46e9 : a5 1b __ LDA ACCU + 0 
46eb : a6 46 __ LDX T3 + 0 
46ed : 9d 1d 85 STA $851d,x ; (modplay.channel[0].rate + 0)
46f0 : a5 1c __ LDA ACCU + 1 
46f2 : 9d 1e 85 STA $851e,x ; (modplay.channel[0].rate + 1)
46f5 : 60 __ __ RTS
.s54:
46f6 : bd 1b 85 LDA $851b,x ; (modplay.channel[0].period + 0)
46f9 : 18 __ __ CLC
46fa : 65 43 __ ADC T0 + 0 
46fc : 85 0d __ STA P0 
46fe : bd 1c 85 LDA $851c,x ; (modplay.channel[0].period + 1)
4701 : 69 00 __ ADC #$00
4703 : 85 0e __ STA P1 
4705 : 20 f9 47 JSR $47f9 ; (clamp_period.s4 + 0)
4708 : a5 1b __ LDA ACCU + 0 
470a : 85 0d __ STA P0 
470c : a6 46 __ LDX T3 + 0 
470e : 9d 1b 85 STA $851b,x ; (modplay.channel[0].period + 0)
4711 : a5 1c __ LDA ACCU + 1 
4713 : 9d 1c 85 STA $851c,x ; (modplay.channel[0].period + 1)
4716 : 4c e4 46 JMP $46e4 ; (fx_row.s51 + 0)
.s57:
4719 : c9 0a __ CMP #$0a
471b : f0 6e __ BEQ $478b ; (fx_row.s71 + 0)
.s58:
471d : b0 5f __ BCS $477e ; (fx_row.s59 + 0)
.s60:
471f : a5 1c __ LDA ACCU + 1 
4721 : d0 01 __ BNE $4724 ; (fx_row.s61 + 0)
4723 : 60 __ __ RTS
.s61:
4724 : bd 43 85 LDA $8543,x ; (modplay.channel[0].smp_length + 3)
4727 : d0 29 __ BNE $4752 ; (fx_row.s63 + 0)
.s68:
4729 : bd 42 85 LDA $8542,x ; (modplay.channel[0].smp_length + 2)
472c : d0 0b __ BNE $4739 ; (fx_row.s62 + 0)
.s69:
472e : bd 41 85 LDA $8541,x ; (modplay.channel[0].smp_length + 1)
4731 : d0 06 __ BNE $4739 ; (fx_row.s62 + 0)
.s70:
4733 : dd 40 85 CMP $8540,x ; (modplay.channel[0].smp_length + 0)
4736 : 90 01 __ BCC $4739 ; (fx_row.s62 + 0)
4738 : 60 __ __ RTS
.s62:
4739 : bd 43 85 LDA $8543,x ; (modplay.channel[0].smp_length + 3)
473c : d0 14 __ BNE $4752 ; (fx_row.s63 + 0)
.s64:
473e : bd 42 85 LDA $8542,x ; (modplay.channel[0].smp_length + 2)
4741 : d0 0f __ BNE $4752 ; (fx_row.s63 + 0)
.s65:
4743 : a5 1c __ LDA ACCU + 1 
4745 : dd 41 85 CMP $8541,x ; (modplay.channel[0].smp_length + 1)
4748 : d0 05 __ BNE $474f ; (fx_row.s67 + 0)
.s66:
474a : a9 00 __ LDA #$00
474c : dd 40 85 CMP $8540,x ; (modplay.channel[0].smp_length + 0)
.s67:
474f : 90 01 __ BCC $4752 ; (fx_row.s63 + 0)
4751 : 60 __ __ RTS
.s63:
4752 : bd 41 85 LDA $8541,x ; (modplay.channel[0].smp_length + 1)
4755 : 38 __ __ SEC
4756 : e5 1c __ SBC ACCU + 1 
4758 : 9d 41 85 STA $8541,x ; (modplay.channel[0].smp_length + 1)
475b : bd 42 85 LDA $8542,x ; (modplay.channel[0].smp_length + 2)
475e : e9 00 __ SBC #$00
4760 : 9d 42 85 STA $8542,x ; (modplay.channel[0].smp_length + 2)
4763 : b0 03 __ BCS $4768 ; (fx_row.s99 + 0)
.s98:
4765 : de 43 85 DEC $8543,x ; (modplay.channel[0].smp_length + 3)
.s99:
4768 : bd 3d 85 LDA $853d,x ; (modplay.channel[0].smp_start + 1)
476b : 18 __ __ CLC
476c : 65 1c __ ADC ACCU + 1 
476e : 9d 3d 85 STA $853d,x ; (modplay.channel[0].smp_start + 1)
4771 : b0 01 __ BCS $4774 ; (fx_row.s101 + 0)
4773 : 60 __ __ RTS
.s101:
4774 : fe 3e 85 INC $853e,x ; (modplay.channel[0].smp_start + 2)
4777 : f0 01 __ BEQ $477a ; (fx_row.s100 + 0)
4779 : 60 __ __ RTS
.s100:
477a : fe 3f 85 INC $853f,x ; (modplay.channel[0].smp_start + 3)
477d : 60 __ __ RTS
.s59:
477e : a9 01 __ LDA #$01
4780 : 8d ca 82 STA $82ca ; (modplay.skip_row_advance + 0)
4783 : a5 1c __ LDA ACCU + 1 
4785 : 8d cb 82 STA $82cb ; (modplay.next_order + 0)
4788 : 4c aa 45 JMP $45aa ; (fx_row.s97 + 0)
.s71:
478b : a5 1b __ LDA ACCU + 0 
478d : d0 03 __ BNE $4792 ; (fx_row.s94 + 0)
.s72:
478f : 38 __ __ SEC
4790 : e5 43 __ SBC T0 + 0 
.s94:
4792 : 9d 2f 85 STA $852f,x ; (modplay.channel[0].volslide + 0)
4795 : 60 __ __ RTS
.s73:
4796 : a9 40 __ LDA #$40
4798 : c5 1c __ CMP ACCU + 1 
479a : b0 03 __ BCS $479f ; (fx_row.s29 + 0)
479c : 4c 09 46 JMP $4609 ; (fx_row.s95 + 0)
.s29:
479f : a5 1c __ LDA ACCU + 1 
47a1 : 4c 09 46 JMP $4609 ; (fx_row.s95 + 0)
.s74:
47a4 : c9 04 __ CMP #$04
47a6 : f0 41 __ BEQ $47e9 ; (fx_row.s89 + 0)
.s75:
47a8 : 90 23 __ BCC $47cd ; (fx_row.s83 + 0)
.s76:
47aa : c9 06 __ CMP #$06
47ac : f0 dd __ BEQ $478b ; (fx_row.s71 + 0)
.s77:
47ae : b0 07 __ BCS $47b7 ; (fx_row.s78 + 0)
.s82:
47b0 : a9 00 __ LDA #$00
47b2 : 9d 3a 85 STA $853a,x ; (modplay.channel[0].needs_start + 0)
47b5 : 90 d4 __ BCC $478b ; (fx_row.s71 + 0)
.s78:
47b7 : bd 1f 85 LDA $851f,x ; (modplay.channel[0].volume + 0)
47ba : 9d 2e 85 STA $852e,x ; (modplay.channel[0].trm_basvol + 0)
47bd : a5 43 __ LDA T0 + 0 
47bf : f0 03 __ BEQ $47c4 ; (fx_row.s79 + 0)
.s81:
47c1 : 9d 2c 85 STA $852c,x ; (modplay.channel[0].trm_depth + 0)
.s79:
47c4 : a5 1b __ LDA ACCU + 0 
47c6 : d0 01 __ BNE $47c9 ; (fx_row.s80 + 0)
47c8 : 60 __ __ RTS
.s80:
47c9 : 9d 2d 85 STA $852d,x ; (modplay.channel[0].trm_speed + 0)
47cc : 60 __ __ RTS
.s83:
47cd : a8 __ __ TAY
47ce : d0 04 __ BNE $47d4 ; (fx_row.s84 + 0)
.s88:
47d0 : 9d 30 85 STA $8530,x ; (modplay.channel[0].arp_counter + 0)
47d3 : 60 __ __ RTS
.s84:
47d4 : a9 02 __ LDA #$02
47d6 : dd 21 85 CMP $8521,x ; (modplay.channel[0].effect + 0)
47d9 : b0 05 __ BCS $47e0 ; (fx_row.s87 + 0)
.s85:
47db : a9 00 __ LDA #$00
47dd : 9d 3a 85 STA $853a,x ; (modplay.channel[0].needs_start + 0)
.s87:
47e0 : a5 1c __ LDA ACCU + 1 
47e2 : d0 01 __ BNE $47e5 ; (fx_row.s86 + 0)
47e4 : 60 __ __ RTS
.s86:
47e5 : 9d 25 85 STA $8525,x ; (modplay.channel[0].porta_speed + 0)
47e8 : 60 __ __ RTS
.s89:
47e9 : a5 43 __ LDA T0 + 0 
47eb : f0 03 __ BEQ $47f0 ; (fx_row.s90 + 0)
.s92:
47ed : 9d 28 85 STA $8528,x ; (modplay.channel[0].vib_depth + 0)
.s90:
47f0 : a5 1b __ LDA ACCU + 0 
47f2 : d0 01 __ BNE $47f5 ; (fx_row.s91 + 0)
47f4 : 60 __ __ RTS
.s91:
47f5 : 9d 29 85 STA $8529,x ; (modplay.channel[0].vib_speed + 0)
47f8 : 60 __ __ RTS
--------------------------------------------------------------------
clamp_period: ; clamp_period(u16)->u16
; 144, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
47f9 : a5 0e __ LDA P1 ; (p + 1)
47fb : d0 0f __ BNE $480c ; (clamp_period.s5 + 0)
.s11:
47fd : a5 0d __ LDA P0 ; (p + 0)
47ff : c9 71 __ CMP #$71
4801 : b0 09 __ BCS $480c ; (clamp_period.s5 + 0)
.s10:
4803 : a9 00 __ LDA #$00
4805 : a0 71 __ LDY #$71
.s3:
4807 : 84 1b __ STY ACCU + 0 
4809 : 85 1c __ STA ACCU + 1 
480b : 60 __ __ RTS
.s5:
480c : a9 03 __ LDA #$03
480e : c5 0e __ CMP P1 ; (p + 1)
4810 : f0 04 __ BEQ $4816 ; (clamp_period.s8 + 0)
.s9:
4812 : 90 08 __ BCC $481c ; (clamp_period.s7 + 0)
4814 : b0 0c __ BCS $4822 ; (clamp_period.s6 + 0)
.s8:
4816 : a5 0d __ LDA P0 ; (p + 0)
4818 : c9 59 __ CMP #$59
481a : 90 06 __ BCC $4822 ; (clamp_period.s6 + 0)
.s7:
481c : a9 03 __ LDA #$03
481e : a0 58 __ LDY #$58
4820 : d0 e5 __ BNE $4807 ; (clamp_period.s3 + 0)
.s6:
4822 : a5 0e __ LDA P1 ; (p + 1)
4824 : a4 0d __ LDY P0 ; (p + 0)
4826 : 4c 07 48 JMP $4807 ; (clamp_period.s3 + 0)
--------------------------------------------------------------------
clamp_vol: ; clamp_vol(i8)->u8
; 132, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4829 : 85 1b __ STA ACCU + 0 
482b : aa __ __ TAX
482c : 10 03 __ BPL $4831 ; (clamp_vol.s5 + 0)
.s7:
482e : a9 00 __ LDA #$00
.s3:
4830 : 60 __ __ RTS
.s5:
4831 : a9 40 __ LDA #$40
4833 : c5 1b __ CMP ACCU + 0 
4835 : 90 f9 __ BCC $4830 ; (clamp_vol.s3 + 0)
.s6:
4837 : a5 1b __ LDA ACCU + 0 
4839 : 60 __ __ RTS
--------------------------------------------------------------------
fx_tick: ; fx_tick(u8)->void
; 433, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
483a : a4 0f __ LDY P2 ; (ch_idx + 0)
483c : be 0f 72 LDX $720f,y ; (__multab50L + 0)
483f : 86 45 __ STX T3 + 0 
4841 : bd 21 85 LDA $8521,x ; (modplay.channel[0].effect + 0)
4844 : c9 05 __ CMP #$05
4846 : d0 05 __ BNE $484d ; (fx_tick.s6 + 0)
.s5:
4848 : a0 01 __ LDY #$01
484a : 4c af 49 JMP $49af ; (fx_tick.s34 + 0)
.s6:
484d : 85 47 __ STA T5 + 0 
484f : c9 05 __ CMP #$05
4851 : b0 03 __ BCS $4856 ; (fx_tick.s7 + 0)
4853 : 4c 8c 49 JMP $498c ; (fx_tick.s31 + 0)
.s7:
4856 : c9 0a __ CMP #$0a
4858 : d0 03 __ BNE $485d ; (fx_tick.s8 + 0)
485a : 4c 7d 49 JMP $497d ; (fx_tick.s29 + 0)
.s8:
485d : 90 4d __ BCC $48ac ; (fx_tick.s20 + 0)
.s9:
485f : c9 0e __ CMP #$0e
4861 : d0 21 __ BNE $4884 ; (fx_tick.s3 + 0)
.s10:
4863 : bd 22 85 LDA $8522,x ; (modplay.channel[0].eparam + 0)
4866 : 4a __ __ LSR
4867 : 4a __ __ LSR
4868 : 4a __ __ LSR
4869 : 4a __ __ LSR
486a : c9 0c __ CMP #$0c
486c : f0 2d __ BEQ $489b ; (fx_tick.s18 + 0)
.s11:
486e : 90 15 __ BCC $4885 ; (fx_tick.s15 + 0)
.s12:
4870 : c9 0d __ CMP #$0d
4872 : d0 10 __ BNE $4884 ; (fx_tick.s3 + 0)
.s13:
4874 : fe 35 85 INC $8535,x ; (modplay.channel[0].tick_cur + 0)
4877 : bd 35 85 LDA $8535,x ; (modplay.channel[0].tick_cur + 0)
487a : dd 34 85 CMP $8534,x ; (modplay.channel[0].tick_stop + 0)
487d : d0 05 __ BNE $4884 ; (fx_tick.s3 + 0)
.s14:
487f : a9 01 __ LDA #$01
4881 : 9d 3a 85 STA $853a,x ; (modplay.channel[0].needs_start + 0)
.s3:
4884 : 60 __ __ RTS
.s15:
4885 : c9 09 __ CMP #$09
4887 : d0 fb __ BNE $4884 ; (fx_tick.s3 + 0)
.s16:
4889 : fe 35 85 INC $8535,x ; (modplay.channel[0].tick_cur + 0)
488c : bd 35 85 LDA $8535,x ; (modplay.channel[0].tick_cur + 0)
488f : dd 34 85 CMP $8534,x ; (modplay.channel[0].tick_stop + 0)
4892 : 90 f0 __ BCC $4884 ; (fx_tick.s3 + 0)
.s17:
4894 : a9 00 __ LDA #$00
4896 : 9d 35 85 STA $8535,x ; (modplay.channel[0].tick_cur + 0)
4899 : b0 e4 __ BCS $487f ; (fx_tick.s14 + 0)
.s18:
489b : fe 35 85 INC $8535,x ; (modplay.channel[0].tick_cur + 0)
489e : bd 35 85 LDA $8535,x ; (modplay.channel[0].tick_cur + 0)
48a1 : dd 34 85 CMP $8534,x ; (modplay.channel[0].tick_stop + 0)
48a4 : 90 de __ BCC $4884 ; (fx_tick.s3 + 0)
.s19:
48a6 : a9 00 __ LDA #$00
.s60:
48a8 : 9d 1f 85 STA $851f,x ; (modplay.channel[0].volume + 0)
48ab : 60 __ __ RTS
.s20:
48ac : c9 06 __ CMP #$06
48ae : f0 58 __ BEQ $4908 ; (fx_tick.s26 + 0)
.s21:
48b0 : c9 07 __ CMP #$07
48b2 : d0 d0 __ BNE $4884 ; (fx_tick.s3 + 0)
.s22:
48b4 : bd 2a 85 LDA $852a,x ; (modplay.channel[0].trm_wave + 0)
48b7 : 85 0d __ STA P0 
48b9 : bd 2b 85 LDA $852b,x ; (modplay.channel[0].trm_pos + 0)
48bc : 85 0e __ STA P1 
48be : 20 90 4a JSR $4a90 ; (wave_value.s4 + 0)
48c1 : aa __ __ TAX
48c2 : a4 45 __ LDY T3 + 0 
48c4 : b9 2c 85 LDA $852c,y ; (modplay.channel[0].trm_depth + 0)
48c7 : 85 1b __ STA ACCU + 0 
48c9 : a9 00 __ LDA #$00
48cb : 85 1c __ STA ACCU + 1 
48cd : 8a __ __ TXA
48ce : 20 e1 6d JSR $6de1 ; (mul16by8 + 0)
48d1 : a5 1c __ LDA ACCU + 1 
48d3 : 85 43 __ STA T0 + 0 
48d5 : a5 1b __ LDA ACCU + 0 
48d7 : 0a __ __ ASL
48d8 : 26 43 __ ROL T0 + 0 
48da : 0a __ __ ASL
48db : 26 43 __ ROL T0 + 0 
48dd : a5 0e __ LDA P1 
48df : a4 45 __ LDY T3 + 0 
48e1 : 29 10 __ AND #$10
48e3 : d0 09 __ BNE $48ee ; (fx_tick.s25 + 0)
.s23:
48e5 : 18 __ __ CLC
48e6 : a5 43 __ LDA T0 + 0 
48e8 : 79 2e 85 ADC $852e,y ; (modplay.channel[0].trm_basvol + 0)
48eb : 4c f4 48 JMP $48f4 ; (fx_tick.s24 + 0)
.s25:
48ee : b9 2e 85 LDA $852e,y ; (modplay.channel[0].trm_basvol + 0)
48f1 : 38 __ __ SEC
48f2 : e5 43 __ SBC T0 + 0 
.s24:
48f4 : 20 29 48 JSR $4829 ; (clamp_vol.s4 + 0)
48f7 : a6 45 __ LDX T3 + 0 
48f9 : 9d 1f 85 STA $851f,x ; (modplay.channel[0].volume + 0)
48fc : bd 2d 85 LDA $852d,x ; (modplay.channel[0].trm_speed + 0)
48ff : 18 __ __ CLC
4900 : 65 0e __ ADC P1 
4902 : 29 3f __ AND #$3f
4904 : 9d 2b 85 STA $852b,x ; (modplay.channel[0].trm_pos + 0)
4907 : 60 __ __ RTS
.s26:
4908 : bd 26 85 LDA $8526,x ; (modplay.channel[0].vib_wave + 0)
490b : 85 0d __ STA P0 
490d : bd 27 85 LDA $8527,x ; (modplay.channel[0].vib_pos + 0)
4910 : 85 0e __ STA P1 
4912 : 20 90 4a JSR $4a90 ; (wave_value.s4 + 0)
4915 : aa __ __ TAX
4916 : a4 45 __ LDY T3 + 0 
4918 : b9 28 85 LDA $8528,y ; (modplay.channel[0].vib_depth + 0)
491b : 85 1b __ STA ACCU + 0 
491d : a9 00 __ LDA #$00
491f : 85 1c __ STA ACCU + 1 
4921 : 8a __ __ TXA
4922 : 20 e1 6d JSR $6de1 ; (mul16by8 + 0)
4925 : a5 1c __ LDA ACCU + 1 
4927 : 06 1b __ ASL ACCU + 0 
4929 : 2a __ __ ROL
492a : 85 43 __ STA T0 + 0 
492c : a9 00 __ LDA #$00
492e : 2a __ __ ROL
492f : 85 44 __ STA T0 + 1 
4931 : a5 0e __ LDA P1 
4933 : 85 46 __ STA T4 + 0 
4935 : a4 45 __ LDY T3 + 0 
4937 : 29 10 __ AND #$10
4939 : d0 0f __ BNE $494a ; (fx_tick.s30 + 0)
.s27:
493b : b9 1b 85 LDA $851b,y ; (modplay.channel[0].period + 0)
493e : 65 43 __ ADC T0 + 0 
4940 : 85 0d __ STA P0 
4942 : b9 1c 85 LDA $851c,y ; (modplay.channel[0].period + 1)
4945 : 65 44 __ ADC T0 + 1 
4947 : 4c 57 49 JMP $4957 ; (fx_tick.s28 + 0)
.s30:
494a : b9 1b 85 LDA $851b,y ; (modplay.channel[0].period + 0)
494d : 38 __ __ SEC
494e : e5 43 __ SBC T0 + 0 
4950 : 85 0d __ STA P0 
4952 : b9 1c 85 LDA $851c,y ; (modplay.channel[0].period + 1)
4955 : e5 44 __ SBC T0 + 1 
.s28:
4957 : 85 0e __ STA P1 
4959 : 20 f9 47 JSR $47f9 ; (clamp_period.s4 + 0)
495c : 20 ec 44 JSR $44ec ; (period_to_rate@proxy + 0)
495f : a5 1b __ LDA ACCU + 0 
4961 : a6 45 __ LDX T3 + 0 
4963 : 9d 1d 85 STA $851d,x ; (modplay.channel[0].rate + 0)
4966 : a5 1c __ LDA ACCU + 1 
4968 : 9d 1e 85 STA $851e,x ; (modplay.channel[0].rate + 1)
496b : bd 29 85 LDA $8529,x ; (modplay.channel[0].vib_speed + 0)
496e : 18 __ __ CLC
496f : 65 46 __ ADC T4 + 0 
4971 : 29 3f __ AND #$3f
4973 : 9d 27 85 STA $8527,x ; (modplay.channel[0].vib_pos + 0)
4976 : a5 47 __ LDA T5 + 0 
4978 : c9 06 __ CMP #$06
497a : f0 01 __ BEQ $497d ; (fx_tick.s29 + 0)
497c : 60 __ __ RTS
.s29:
497d : bd 1f 85 LDA $851f,x ; (modplay.channel[0].volume + 0)
4980 : 18 __ __ CLC
4981 : 7d 2f 85 ADC $852f,x ; (modplay.channel[0].volslide + 0)
4984 : 20 29 48 JSR $4829 ; (clamp_vol.s4 + 0)
4987 : a6 45 __ LDX T3 + 0 
4989 : 4c a8 48 JMP $48a8 ; (fx_tick.s60 + 0)
.s31:
498c : c9 02 __ CMP #$02
498e : d0 11 __ BNE $49a1 ; (fx_tick.s32 + 0)
.s59:
4990 : bd 25 85 LDA $8525,x ; (modplay.channel[0].porta_speed + 0)
4993 : 18 __ __ CLC
4994 : 7d 1b 85 ADC $851b,x ; (modplay.channel[0].period + 0)
4997 : 85 0d __ STA P0 
4999 : bd 1c 85 LDA $851c,x ; (modplay.channel[0].period + 1)
499c : 69 00 __ ADC #$00
499e : 4c 6b 4a JMP $4a6b ; (fx_tick.s57 + 0)
.s32:
49a1 : b0 03 __ BCS $49a6 ; (fx_tick.s33 + 0)
49a3 : 4c 3d 4a JMP $4a3d ; (fx_tick.s51 + 0)
.s33:
49a6 : a0 00 __ LDY #$00
49a8 : c9 03 __ CMP #$03
49aa : f0 03 __ BEQ $49af ; (fx_tick.s34 + 0)
49ac : 4c 08 49 JMP $4908 ; (fx_tick.s26 + 0)
.s34:
49af : bd 23 85 LDA $8523,x ; (modplay.channel[0].porta_target + 0)
49b2 : 85 43 __ STA T0 + 0 
49b4 : bd 24 85 LDA $8524,x ; (modplay.channel[0].porta_target + 1)
49b7 : 85 44 __ STA T0 + 1 
49b9 : 05 43 __ ORA T0 + 0 
49bb : f0 58 __ BEQ $4a15 ; (fx_tick.s35 + 0)
.s36:
49bd : bd 1e 85 LDA $851e,x ; (modplay.channel[0].rate + 1)
49c0 : 85 1c __ STA ACCU + 1 
49c2 : c5 44 __ CMP T0 + 1 
49c4 : d0 09 __ BNE $49cf ; (fx_tick.s37 + 0)
.s50:
49c6 : a5 43 __ LDA T0 + 0 
49c8 : dd 1d 85 CMP $851d,x ; (modplay.channel[0].rate + 0)
49cb : f0 48 __ BEQ $4a15 ; (fx_tick.s35 + 0)
.s61:
49cd : a5 1c __ LDA ACCU + 1 
.s37:
49cf : c5 44 __ CMP T0 + 1 
49d1 : d0 05 __ BNE $49d8 ; (fx_tick.s49 + 0)
.s48:
49d3 : bd 1d 85 LDA $851d,x ; (modplay.channel[0].rate + 0)
49d6 : c5 43 __ CMP T0 + 0 
.s49:
49d8 : 90 42 __ BCC $4a1c ; (fx_tick.s45 + 0)
.s38:
49da : a5 1c __ LDA ACCU + 1 
49dc : d0 11 __ BNE $49ef ; (fx_tick.s43 + 0)
.s44:
49de : bd 25 85 LDA $8525,x ; (modplay.channel[0].porta_speed + 0)
49e1 : dd 1d 85 CMP $851d,x ; (modplay.channel[0].rate + 0)
49e4 : 90 09 __ BCC $49ef ; (fx_tick.s43 + 0)
.s39:
49e6 : a5 43 __ LDA T0 + 0 
49e8 : 9d 1d 85 STA $851d,x ; (modplay.channel[0].rate + 0)
49eb : a5 44 __ LDA T0 + 1 
49ed : b0 0e __ BCS $49fd ; (fx_tick.s40 + 0)
.s43:
49ef : bd 1d 85 LDA $851d,x ; (modplay.channel[0].rate + 0)
49f2 : 38 __ __ SEC
49f3 : fd 25 85 SBC $8525,x ; (modplay.channel[0].porta_speed + 0)
49f6 : 9d 1d 85 STA $851d,x ; (modplay.channel[0].rate + 0)
49f9 : a5 1c __ LDA ACCU + 1 
49fb : e9 00 __ SBC #$00
.s40:
49fd : 9d 1e 85 STA $851e,x ; (modplay.channel[0].rate + 1)
4a00 : c5 44 __ CMP T0 + 1 
4a02 : d0 05 __ BNE $4a09 ; (fx_tick.s47 + 0)
.s42:
4a04 : bd 1d 85 LDA $851d,x ; (modplay.channel[0].rate + 0)
4a07 : c5 43 __ CMP T0 + 0 
.s47:
4a09 : b0 0a __ BCS $4a15 ; (fx_tick.s35 + 0)
.s41:
4a0b : a5 43 __ LDA T0 + 0 
4a0d : 9d 1d 85 STA $851d,x ; (modplay.channel[0].rate + 0)
4a10 : a5 44 __ LDA T0 + 1 
4a12 : 9d 1e 85 STA $851e,x ; (modplay.channel[0].rate + 1)
.s35:
4a15 : 98 __ __ TYA
4a16 : f0 03 __ BEQ $4a1b ; (fx_tick.s35 + 6)
4a18 : 4c 7d 49 JMP $497d ; (fx_tick.s29 + 0)
4a1b : 60 __ __ RTS
.s45:
4a1c : bd 25 85 LDA $8525,x ; (modplay.channel[0].porta_speed + 0)
4a1f : 7d 1d 85 ADC $851d,x ; (modplay.channel[0].rate + 0)
4a22 : 85 1b __ STA ACCU + 0 
4a24 : 9d 1d 85 STA $851d,x ; (modplay.channel[0].rate + 0)
4a27 : a5 1c __ LDA ACCU + 1 
4a29 : 69 00 __ ADC #$00
4a2b : 85 1c __ STA ACCU + 1 
4a2d : 9d 1e 85 STA $851e,x ; (modplay.channel[0].rate + 1)
4a30 : a5 44 __ LDA T0 + 1 
4a32 : c5 1c __ CMP ACCU + 1 
4a34 : d0 d3 __ BNE $4a09 ; (fx_tick.s47 + 0)
.s46:
4a36 : a5 43 __ LDA T0 + 0 
4a38 : c5 1b __ CMP ACCU + 0 
4a3a : 4c 09 4a JMP $4a09 ; (fx_tick.s47 + 0)
.s51:
4a3d : a8 __ __ TAY
4a3e : d0 10 __ BNE $4a50 ; (fx_tick.s55 + 0)
.s52:
4a40 : bd 22 85 LDA $8522,x ; (modplay.channel[0].eparam + 0)
4a43 : d0 01 __ BNE $4a46 ; (fx_tick.s53 + 0)
4a45 : 60 __ __ RTS
.s53:
4a46 : bd 1a 85 LDA $851a,x ; (modplay.channel[0].sample_num + 0)
4a49 : d0 01 __ BNE $4a4c ; (fx_tick.s54 + 0)
4a4b : 60 __ __ RTS
.s54:
4a4c : fe 30 85 INC $8530,x ; (modplay.channel[0].arp_counter + 0)
4a4f : 60 __ __ RTS
.s55:
4a50 : bd 1c 85 LDA $851c,x ; (modplay.channel[0].period + 1)
4a53 : d0 08 __ BNE $4a5d ; (fx_tick.s56 + 0)
.s58:
4a55 : a9 71 __ LDA #$71
4a57 : dd 1b 85 CMP $851b,x ; (modplay.channel[0].period + 0)
4a5a : 90 01 __ BCC $4a5d ; (fx_tick.s56 + 0)
4a5c : 60 __ __ RTS
.s56:
4a5d : bd 1b 85 LDA $851b,x ; (modplay.channel[0].period + 0)
4a60 : 38 __ __ SEC
4a61 : fd 25 85 SBC $8525,x ; (modplay.channel[0].porta_speed + 0)
4a64 : 85 0d __ STA P0 
4a66 : bd 1c 85 LDA $851c,x ; (modplay.channel[0].period + 1)
4a69 : e9 00 __ SBC #$00
.s57:
4a6b : 85 0e __ STA P1 
4a6d : 20 f9 47 JSR $47f9 ; (clamp_period.s4 + 0)
4a70 : a5 1b __ LDA ACCU + 0 
4a72 : 85 0d __ STA P0 
4a74 : a6 45 __ LDX T3 + 0 
4a76 : 9d 1b 85 STA $851b,x ; (modplay.channel[0].period + 0)
4a79 : a5 1c __ LDA ACCU + 1 
4a7b : 85 0e __ STA P1 
4a7d : 9d 1c 85 STA $851c,x ; (modplay.channel[0].period + 1)
4a80 : 20 f4 44 JSR $44f4 ; (period_to_rate.s4 + 0)
4a83 : a5 1b __ LDA ACCU + 0 
4a85 : a6 45 __ LDX T3 + 0 
4a87 : 9d 1d 85 STA $851d,x ; (modplay.channel[0].rate + 0)
4a8a : a5 1c __ LDA ACCU + 1 
4a8c : 9d 1e 85 STA $851e,x ; (modplay.channel[0].rate + 1)
4a8f : 60 __ __ RTS
--------------------------------------------------------------------
wave_value: ; wave_value(u8,u8)->u8
; 156, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4a90 : a5 0e __ LDA P1 ; (pos + 0)
4a92 : 29 1f __ AND #$1f
4a94 : a8 __ __ TAY
4a95 : a5 0d __ LDA P0 ; (wave + 0)
4a97 : 29 03 __ AND #$03
4a99 : c9 01 __ CMP #$01
4a9b : d0 07 __ BNE $4aa4 ; (wave_value.s5 + 0)
.s10:
4a9d : 98 __ __ TYA
4a9e : 0a __ __ ASL
4a9f : 0a __ __ ASL
4aa0 : 0a __ __ ASL
4aa1 : 49 ff __ EOR #$ff
.s3:
4aa3 : 60 __ __ RTS
.s5:
4aa4 : aa __ __ TAX
4aa5 : d0 04 __ BNE $4aab ; (wave_value.s6 + 0)
.s9:
4aa7 : b9 ce 76 LDA $76ce,y ; (vib_sine[0] + 0)
4aaa : 60 __ __ RTS
.s6:
4aab : c9 02 __ CMP #$02
4aad : d0 03 __ BNE $4ab2 ; (wave_value.s7 + 0)
.s8:
4aaf : a9 ff __ LDA #$ff
4ab1 : 60 __ __ RTS
.s7:
4ab2 : 98 __ __ TYA
4ab3 : 0a __ __ ASL
4ab4 : 0a __ __ ASL
4ab5 : 0a __ __ ASL
4ab6 : 60 __ __ RTS
--------------------------------------------------------------------
ua_update_channel: ; ua_update_channel(u8)->void
;  86, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s1:
4ab7 : 38 __ __ SEC
4ab8 : a5 23 __ LDA SP + 0 
4aba : e9 0c __ SBC #$0c
4abc : 85 23 __ STA SP + 0 
4abe : b0 02 __ BCS $4ac2 ; (ua_update_channel.s1 + 11)
4ac0 : c6 24 __ DEC SP + 1 
4ac2 : a0 03 __ LDY #$03
4ac4 : b9 53 00 LDA $0053,y 
4ac7 : 91 23 __ STA (SP + 0),y 
4ac9 : 88 __ __ DEY
4aca : 10 f8 __ BPL $4ac4 ; (ua_update_channel.s1 + 13)
.s4:
4acc : ad c6 82 LDA $82c6 ; (modplay.master_volume + 0)
4acf : 85 1b __ STA ACCU + 0 
4ad1 : a6 13 __ LDX P6 ; (ch + 0)
4ad3 : 86 47 __ STX T1 + 0 
4ad5 : bd 0f 72 LDA $720f,x ; (__multab50L + 0)
4ad8 : 85 43 __ STA T0 + 0 
4ada : aa __ __ TAX
4adb : a9 00 __ LDA #$00
4add : 85 1c __ STA ACCU + 1 
4adf : bd 1f 85 LDA $851f,x ; (modplay.channel[0].volume + 0)
4ae2 : 20 e1 6d JSR $6de1 ; (mul16by8 + 0)
4ae5 : a5 1c __ LDA ACCU + 1 
4ae7 : 85 50 __ STA T6 + 0 
4ae9 : a5 1b __ LDA ACCU + 0 
4aeb : 0a __ __ ASL
4aec : 26 50 __ ROL T6 + 0 
4aee : 0a __ __ ASL
4aef : 26 50 __ ROL T6 + 0 
4af1 : a4 43 __ LDY T0 + 0 
4af3 : b9 3a 85 LDA $853a,y ; (modplay.channel[0].needs_start + 0)
4af6 : d0 5f __ BNE $4b57 ; (ua_update_channel.s10 + 0)
.s5:
4af8 : a5 50 __ LDA T6 + 0 
4afa : d9 37 85 CMP $8537,y ; (modplay.channel[0].ua_vol + 0)
4afd : f0 0f __ BEQ $4b0e ; (ua_update_channel.s6 + 0)
.s9:
4aff : 06 47 __ ASL T1 + 0 
4b01 : a4 47 __ LDY T1 + 0 
4b03 : be 56 73 LDX $7356,y ; (audio_ch_base[0] + 0)
4b06 : 9d 01 df STA $df01,x 
4b09 : a4 43 __ LDY T0 + 0 
4b0b : 99 37 85 STA $8537,y ; (modplay.channel[0].ua_vol + 0)
.s6:
4b0e : b9 1e 85 LDA $851e,y ; (modplay.channel[0].rate + 1)
4b11 : d9 39 85 CMP $8539,y ; (modplay.channel[0].ua_rate + 1)
4b14 : d0 08 __ BNE $4b1e ; (ua_update_channel.s7 + 0)
.s8:
4b16 : b9 1d 85 LDA $851d,y ; (modplay.channel[0].rate + 0)
4b19 : d9 38 85 CMP $8538,y ; (modplay.channel[0].ua_rate + 0)
4b1c : f0 23 __ BEQ $4b41 ; (ua_update_channel.s3 + 0)
.s7:
4b1e : b9 1d 85 LDA $851d,y ; (modplay.channel[0].rate + 0)
4b21 : 85 0e __ STA P1 
4b23 : a5 13 __ LDA P6 ; (ch + 0)
4b25 : 0a __ __ ASL
4b26 : aa __ __ TAX
4b27 : b9 1e 85 LDA $851e,y ; (modplay.channel[0].rate + 1)
4b2a : 85 0f __ STA P2 
4b2c : bc 56 73 LDY $7356,x ; (audio_ch_base[0] + 0)
4b2f : 99 0e df STA $df0e,y 
4b32 : a5 0e __ LDA P1 
4b34 : 99 0f df STA $df0f,y 
4b37 : a6 43 __ LDX T0 + 0 
4b39 : 9d 38 85 STA $8538,x ; (modplay.channel[0].ua_rate + 0)
4b3c : a5 0f __ LDA P2 
.s14:
4b3e : 9d 39 85 STA $8539,x ; (modplay.channel[0].ua_rate + 1)
.s3:
4b41 : a0 03 __ LDY #$03
4b43 : b1 23 __ LDA (SP + 0),y 
4b45 : 99 53 00 STA $0053,y 
4b48 : 88 __ __ DEY
4b49 : 10 f8 __ BPL $4b43 ; (ua_update_channel.s3 + 2)
4b4b : 18 __ __ CLC
4b4c : a5 23 __ LDA SP + 0 
4b4e : 69 0c __ ADC #$0c
4b50 : 85 23 __ STA SP + 0 
4b52 : 90 02 __ BCC $4b56 ; (ua_update_channel.s3 + 21)
4b54 : e6 24 __ INC SP + 1 
4b56 : 60 __ __ RTS
.s10:
4b57 : 84 51 __ STY T7 + 0 
4b59 : a5 13 __ LDA P6 ; (ch + 0)
4b5b : 85 0d __ STA P0 
4b5d : a9 00 __ LDA #$00
4b5f : 99 3a 85 STA $853a,y ; (modplay.channel[0].needs_start + 0)
4b62 : b9 3c 85 LDA $853c,y ; (modplay.channel[0].smp_start + 0)
4b65 : 85 0e __ STA P1 
4b67 : b9 3d 85 LDA $853d,y ; (modplay.channel[0].smp_start + 1)
4b6a : 85 0f __ STA P2 
4b6c : b9 3e 85 LDA $853e,y ; (modplay.channel[0].smp_start + 2)
4b6f : 85 10 __ STA P3 
4b71 : b9 3f 85 LDA $853f,y ; (modplay.channel[0].smp_start + 3)
4b74 : 85 11 __ STA P4 
4b76 : 06 47 __ ASL T1 + 0 
4b78 : a6 47 __ LDX T1 + 0 
4b7a : bd 56 73 LDA $7356,x ; (audio_ch_base[0] + 0)
4b7d : 85 4f __ STA T5 + 0 
4b7f : 85 53 __ STA T8 + 0 
4b81 : b9 1d 85 LDA $851d,y ; (modplay.channel[0].rate + 0)
4b84 : 85 55 __ STA T9 + 0 
4b86 : a9 df __ LDA #$df
4b88 : 85 54 __ STA T8 + 1 
4b8a : b9 1e 85 LDA $851e,y ; (modplay.channel[0].rate + 1)
4b8d : 85 56 __ STA T9 + 1 
4b8f : b9 40 85 LDA $8540,y ; (modplay.channel[0].smp_length + 0)
4b92 : 85 43 __ STA T0 + 0 
4b94 : b9 41 85 LDA $8541,y ; (modplay.channel[0].smp_length + 1)
4b97 : 85 44 __ STA T0 + 1 
4b99 : b9 42 85 LDA $8542,y ; (modplay.channel[0].smp_length + 2)
4b9c : 85 45 __ STA T0 + 2 
4b9e : b9 43 85 LDA $8543,y ; (modplay.channel[0].smp_length + 3)
4ba1 : 85 46 __ STA T0 + 3 
4ba3 : b9 3b 85 LDA $853b,y ; (modplay.channel[0].needs_loop + 0)
4ba6 : d0 03 __ BNE $4bab ; (ua_update_channel.s13 + 0)
4ba8 : 4c 30 4c JMP $4c30 ; (ua_update_channel.s11 + 0)
.s13:
4bab : a6 51 __ LDX T7 + 0 
4bad : bd 44 85 LDA $8544,x ; (modplay.channel[0].smp_loop_a + 0)
4bb0 : 85 47 __ STA T1 + 0 
4bb2 : bd 45 85 LDA $8545,x ; (modplay.channel[0].smp_loop_a + 1)
4bb5 : 85 48 __ STA T1 + 1 
4bb7 : bd 46 85 LDA $8546,x ; (modplay.channel[0].smp_loop_a + 2)
4bba : 85 49 __ STA T1 + 2 
4bbc : bd 47 85 LDA $8547,x ; (modplay.channel[0].smp_loop_a + 3)
4bbf : 85 4a __ STA T1 + 3 
4bc1 : bd 48 85 LDA $8548,x ; (modplay.channel[0].smp_loop_b + 0)
4bc4 : 85 4b __ STA T2 + 0 
4bc6 : bd 49 85 LDA $8549,x ; (modplay.channel[0].smp_loop_b + 1)
4bc9 : 85 4c __ STA T2 + 1 
4bcb : bd 4a 85 LDA $854a,x ; (modplay.channel[0].smp_loop_b + 2)
4bce : 85 4d __ STA T2 + 2 
4bd0 : bd 4b 85 LDA $854b,x ; (modplay.channel[0].smp_loop_b + 3)
4bd3 : 85 4e __ STA T2 + 3 
4bd5 : a9 00 __ LDA #$00
4bd7 : a6 4f __ LDX T5 + 0 
4bd9 : 9d 00 df STA $df00,x 
4bdc : a5 50 __ LDA T6 + 0 
4bde : 9d 01 df STA $df01,x 
4be1 : b9 20 85 LDA $8520,y ; (modplay.channel[0].pan + 0)
4be4 : 9d 02 df STA $df02,x 
4be7 : 20 6e 4c JSR $4c6e ; (ch_wr_sms.s4 + 0)
4bea : 20 8a 4c JSR $4c8a ; (ch_wr_be24@proxy + 0)
4bed : a5 0d __ LDA P0 
4bef : 0a __ __ ASL
4bf0 : aa __ __ TAX
4bf1 : a5 56 __ LDA T9 + 1 
4bf3 : bc 56 73 LDY $7356,x ; (audio_ch_base[0] + 0)
4bf6 : 99 0e df STA $df0e,y 
4bf9 : a5 55 __ LDA T9 + 0 
4bfb : 99 0f df STA $df0f,y 
4bfe : a5 47 __ LDA T1 + 0 
4c00 : 85 0f __ STA P2 
4c02 : a9 11 __ LDA #$11
4c04 : 85 0e __ STA P1 
4c06 : a5 48 __ LDA T1 + 1 
4c08 : 85 10 __ STA P3 
4c0a : a5 49 __ LDA T1 + 2 
4c0c : 85 11 __ STA P4 
4c0e : a5 4a __ LDA T1 + 3 
4c10 : 85 12 __ STA P5 
4c12 : 20 9e 4c JSR $4c9e ; (ch_wr_be24.s4 + 0)
4c15 : a5 4b __ LDA T2 + 0 
4c17 : 85 0f __ STA P2 
4c19 : a9 15 __ LDA #$15
4c1b : 85 0e __ STA P1 
4c1d : a5 4c __ LDA T2 + 1 
4c1f : 85 10 __ STA P3 
4c21 : a5 4d __ LDA T2 + 2 
4c23 : 85 11 __ STA P4 
4c25 : a5 4e __ LDA T2 + 3 
4c27 : 85 12 __ STA P5 
4c29 : 20 9e 4c JSR $4c9e ; (ch_wr_be24.s4 + 0)
4c2c : a9 03 __ LDA #$03
4c2e : d0 29 __ BNE $4c59 ; (ua_update_channel.s12 + 0)
.s11:
4c30 : a6 4f __ LDX T5 + 0 
4c32 : 9d 00 df STA $df00,x 
4c35 : a5 50 __ LDA T6 + 0 
4c37 : 9d 01 df STA $df01,x 
4c3a : b9 20 85 LDA $8520,y ; (modplay.channel[0].pan + 0)
4c3d : 9d 02 df STA $df02,x 
4c40 : 20 6e 4c JSR $4c6e ; (ch_wr_sms.s4 + 0)
4c43 : 20 8a 4c JSR $4c8a ; (ch_wr_be24@proxy + 0)
4c46 : a5 0d __ LDA P0 
4c48 : 0a __ __ ASL
4c49 : aa __ __ TAX
4c4a : a5 56 __ LDA T9 + 1 
4c4c : bc 56 73 LDY $7356,x ; (audio_ch_base[0] + 0)
4c4f : 99 0e df STA $df0e,y 
4c52 : a5 55 __ LDA T9 + 0 
4c54 : 99 0f df STA $df0f,y 
4c57 : a9 01 __ LDA #$01
.s12:
4c59 : a0 00 __ LDY #$00
4c5b : 91 53 __ STA (T8 + 0),y 
4c5d : a5 50 __ LDA T6 + 0 
4c5f : a6 51 __ LDX T7 + 0 
4c61 : 9d 37 85 STA $8537,x ; (modplay.channel[0].ua_vol + 0)
4c64 : a5 55 __ LDA T9 + 0 
4c66 : 9d 38 85 STA $8538,x ; (modplay.channel[0].ua_rate + 0)
4c69 : a5 56 __ LDA T9 + 1 
4c6b : 4c 3e 4b JMP $4b3e ; (ua_update_channel.s14 + 0)
--------------------------------------------------------------------
ch_wr_sms: ; ch_wr_sms(u8,u32)->void
;  40, "/home/xahmol/git/UltimateDemo2026/include/audio.c"
.s4:
4c6e : a5 0d __ LDA P0 ; (ch + 0)
4c70 : 0a __ __ ASL
4c71 : a8 __ __ TAY
4c72 : a9 01 __ LDA #$01
4c74 : be 56 73 LDX $7356,y ; (audio_ch_base[0] + 0)
4c77 : 9d 04 df STA $df04,x 
4c7a : a5 10 __ LDA P3 ; (addr + 2)
4c7c : 9d 05 df STA $df05,x 
4c7f : a5 0f __ LDA P2 ; (addr + 1)
4c81 : 9d 06 df STA $df06,x 
4c84 : a5 0e __ LDA P1 ; (addr + 0)
4c86 : 9d 07 df STA $df07,x 
.s3:
4c89 : 60 __ __ RTS
--------------------------------------------------------------------
ch_wr_be24@proxy: ; ch_wr_be24@proxy
4c8a : a9 09 __ LDA #$09
4c8c : 85 0e __ STA P1 
4c8e : a5 43 __ LDA $43 
4c90 : 85 0f __ STA P2 
4c92 : a5 44 __ LDA $44 
4c94 : 85 10 __ STA P3 
4c96 : a5 45 __ LDA $45 
4c98 : 85 11 __ STA P4 
4c9a : a5 46 __ LDA $46 
4c9c : 85 12 __ STA P5 
--------------------------------------------------------------------
ch_wr_be24: ; ch_wr_be24(u8,u8,u32)->void
;  52, "/home/xahmol/git/UltimateDemo2026/include/audio.c"
.s4:
4c9e : a5 0d __ LDA P0 ; (ch + 0)
4ca0 : 0a __ __ ASL
4ca1 : aa __ __ TAX
4ca2 : bd 56 73 LDA $7356,x ; (audio_ch_base[0] + 0)
4ca5 : 65 0e __ ADC P1 ; (offset + 0)
4ca7 : 85 1b __ STA ACCU + 0 
4ca9 : a9 df __ LDA #$df
4cab : 85 1c __ STA ACCU + 1 
4cad : a5 11 __ LDA P4 ; (val + 2)
4caf : a0 00 __ LDY #$00
4cb1 : 91 1b __ STA (ACCU + 0),y 
4cb3 : a5 10 __ LDA P3 ; (val + 1)
4cb5 : c8 __ __ INY
4cb6 : 91 1b __ STA (ACCU + 0),y 
4cb8 : a5 0f __ LDA P2 ; (val + 0)
4cba : c8 __ __ INY
4cbb : 91 1b __ STA (ACCU + 0),y 
.s3:
4cbd : 60 __ __ RTS
--------------------------------------------------------------------
mandel_run: ; mandel_run()->void
;   4, "/home/xahmol/git/UltimateDemo2026/src/mandel.h"
.s4:
4cbe : a9 8f __ LDA #$8f
4cc0 : 20 f1 15 JSR $15f1 ; (turbo_set.s4 + 0)
4cc3 : a9 35 __ LDA #$35
4cc5 : 85 01 __ STA $01 
4cc7 : a9 1f __ LDA #$1f
4cc9 : 85 12 __ STA P5 
4ccb : a9 40 __ LDA #$40
4ccd : 85 11 __ STA P4 
4ccf : a9 00 __ LDA #$00
4cd1 : 85 0f __ STA P2 
4cd3 : 85 10 __ STA P3 
4cd5 : a2 fa __ LDX #$fa
.l6:
4cd7 : ca __ __ DEX
4cd8 : 9d 00 c0 STA $c000,x 
4cdb : 9d fa c0 STA $c0fa,x 
4cde : 9d f4 c1 STA $c1f4,x 
4ce1 : 9d ee c2 STA $c2ee,x 
4ce4 : d0 f1 __ BNE $4cd7 ; (mandel_run.l6 + 0)
.s5:
4ce6 : 85 0d __ STA P0 
4ce8 : a9 e0 __ LDA #$e0
4cea : 85 0e __ STA P1 
4cec : 20 f3 20 JSR $20f3 ; (memset.s4 + 0)
4cef : a9 04 __ LDA #$04
4cf1 : 85 0d __ STA P0 
4cf3 : a9 00 __ LDA #$00
4cf5 : 85 10 __ STA P3 
4cf7 : a9 e0 __ LDA #$e0
4cf9 : 85 11 __ STA P4 
4cfb : a9 01 __ LDA #$01
4cfd : a2 fa __ LDX #$fa
.l8:
4cff : ca __ __ DEX
4d00 : 9d 00 d8 STA $d800,x 
4d03 : 9d fa d8 STA $d8fa,x 
4d06 : 9d f4 d9 STA $d9f4,x 
4d09 : 9d ee da STA $daee,x 
4d0c : d0 f1 __ BNE $4cff ; (mandel_run.l8 + 0)
.s7:
4d0e : a9 00 __ LDA #$00
4d10 : 85 0e __ STA P1 
4d12 : a9 c0 __ LDA #$c0
4d14 : 85 0f __ STA P2 
4d16 : 20 13 0f JSR $0f13 ; (vic_setmode.s4 + 0)
4d19 : a9 00 __ LDA #$00
4d1b : 8d 21 d0 STA $d021 
4d1e : 8d 20 d0 STA $d020 
4d21 : a9 0a __ LDA #$0a
4d23 : 85 13 __ STA P6 
4d25 : a9 77 __ LDA #$77
4d27 : 85 14 __ STA P7 
4d29 : 20 5e 4d JSR $4d5e ; (render.s1 + 0)
4d2c : a9 32 __ LDA #$32
4d2e : 85 0d __ STA P0 
4d30 : a9 77 __ LDA #$77
4d32 : 85 0e __ STA P1 
4d34 : 20 f1 4f JSR $4ff1 ; (colorize_standard.s4 + 0)
4d37 : a9 00 __ LDA #$00
4d39 : 8d 09 dc STA $dc09 
4d3c : 8d 08 dc STA $dc08 
.l9:
4d3f : ad 09 dc LDA $dc09 
4d42 : c9 05 __ CMP #$05
4d44 : 90 f9 __ BCC $4d3f ; (mandel_run.l9 + 0)
.s10:
4d46 : a9 00 __ LDA #$00
4d48 : 85 0d __ STA P0 
4d4a : 85 0e __ STA P1 
4d4c : 85 10 __ STA P3 
4d4e : a9 36 __ LDA #$36
4d50 : 85 01 __ STA $01 
4d52 : 20 0b 0f JSR $0f0b ; (vic_setmode@proxy + 0)
4d55 : a9 00 __ LDA #$00
4d57 : 8d 20 d0 STA $d020 
4d5a : 8d 21 d0 STA $d021 
.s3:
4d5d : 60 __ __ RTS
--------------------------------------------------------------------
render: ; render(const struct S#28842*)->void
; 120, "/home/xahmol/git/UltimateDemo2026/src/mandel.c"
.s1:
4d5e : a2 05 __ LDX #$05
4d60 : b5 53 __ LDA T10 + 0,x 
4d62 : 9d da bf STA $bfda,x ; (render@stack + 0)
4d65 : ca __ __ DEX
4d66 : 10 f8 __ BPL $4d60 ; (render.s1 + 2)
.s4:
4d68 : a9 40 __ LDA #$40
4d6a : 85 11 __ STA P4 
4d6c : a9 1f __ LDA #$1f
4d6e : 85 12 __ STA P5 
4d70 : a9 00 __ LDA #$00
4d72 : 85 0d __ STA P0 
4d74 : a9 e0 __ LDA #$e0
4d76 : 85 0e __ STA P1 
4d78 : a0 06 __ LDY #$06
4d7a : b1 13 __ LDA (P6),y ; (f + 0)
4d7c : c8 __ __ INY
4d7d : 11 13 __ ORA (P6),y ; (f + 0)
4d7f : d0 08 __ BNE $4d89 ; (render.s24 + 0)
.s5:
4d81 : c8 __ __ INY
4d82 : b1 13 __ LDA (P6),y ; (f + 0)
4d84 : c8 __ __ INY
4d85 : 11 13 __ ORA (P6),y ; (f + 0)
4d87 : f0 02 __ BEQ $4d8b ; (render.s6 + 0)
.s24:
4d89 : a9 01 __ LDA #$01
.s6:
4d8b : 85 57 __ STA T12 + 0 
4d8d : a9 00 __ LDA #$00
4d8f : 85 0f __ STA P2 
4d91 : 85 10 __ STA P3 
4d93 : 20 f3 20 JSR $20f3 ; (memset.s4 + 0)
4d96 : a9 00 __ LDA #$00
4d98 : 85 4d __ STA T6 + 0 
.l7:
4d9a : 29 07 __ AND #$07
4d9c : 85 43 __ STA T0 + 0 
4d9e : a5 4d __ LDA T6 + 0 
4da0 : 29 f8 __ AND #$f8
4da2 : 85 1b __ STA ACCU + 0 
4da4 : 4a __ __ LSR
4da5 : 4a __ __ LSR
4da6 : 65 1b __ ADC ACCU + 0 
4da8 : 4a __ __ LSR
4da9 : 6a __ __ ROR
4daa : 6a __ __ ROR
4dab : aa __ __ TAX
4dac : 29 c0 __ AND #$c0
4dae : 6a __ __ ROR
4daf : 05 43 __ ORA T0 + 0 
4db1 : 85 4e __ STA T7 + 0 
4db3 : 8a __ __ TXA
4db4 : 29 1f __ AND #$1f
4db6 : 09 e0 __ ORA #$e0
4db8 : 85 4f __ STA T7 + 1 
4dba : a0 05 __ LDY #$05
4dbc : b1 13 __ LDA (P6),y ; (f + 0)
4dbe : 85 1b __ STA ACCU + 0 
4dc0 : a9 00 __ LDA #$00
4dc2 : 85 52 __ STA T9 + 0 
4dc4 : 85 1c __ STA ACCU + 1 
4dc6 : a5 4d __ LDA T6 + 0 
4dc8 : 20 e1 6d JSR $6de1 ; (mul16by8 + 0)
4dcb : a0 02 __ LDY #$02
4dcd : b1 13 __ LDA (P6),y ; (f + 0)
4dcf : 18 __ __ CLC
4dd0 : 65 1b __ ADC ACCU + 0 
4dd2 : 85 50 __ STA T8 + 0 
4dd4 : c8 __ __ INY
4dd5 : b1 13 __ LDA (P6),y ; (f + 0)
4dd7 : 65 1c __ ADC ACCU + 1 
4dd9 : 85 51 __ STA T8 + 1 
.l8:
4ddb : a0 04 __ LDY #$04
4ddd : b1 13 __ LDA (P6),y ; (f + 0)
4ddf : 85 1b __ STA ACCU + 0 
4de1 : a9 00 __ LDA #$00
4de3 : 85 1c __ STA ACCU + 1 
4de5 : a5 52 __ LDA T9 + 0 
4de7 : 20 e1 6d JSR $6de1 ; (mul16by8 + 0)
4dea : a0 00 __ LDY #$00
4dec : b1 13 __ LDA (P6),y ; (f + 0)
4dee : 18 __ __ CLC
4def : 65 1b __ ADC ACCU + 0 
4df1 : 85 49 __ STA T3 + 0 
4df3 : 85 53 __ STA T10 + 0 
4df5 : c8 __ __ INY
4df6 : b1 13 __ LDA (P6),y ; (f + 0)
4df8 : 65 1c __ ADC ACCU + 1 
4dfa : 85 4a __ STA T3 + 1 
4dfc : 85 54 __ STA T10 + 1 
4dfe : a5 57 __ LDA T12 + 0 
4e00 : d0 11 __ BNE $4e13 ; (render.s23 + 0)
.s9:
4e02 : 85 49 __ STA T3 + 0 
4e04 : 85 4a __ STA T3 + 1 
4e06 : 85 4b __ STA T4 + 0 
4e08 : 85 4c __ STA T4 + 1 
4e0a : a5 50 __ LDA T8 + 0 
4e0c : 85 55 __ STA T11 + 0 
4e0e : a5 51 __ LDA T8 + 1 
4e10 : 4c 2e 4e JMP $4e2e ; (render.s10 + 0)
.s23:
4e13 : a5 50 __ LDA T8 + 0 
4e15 : 85 4b __ STA T4 + 0 
4e17 : a5 51 __ LDA T8 + 1 
4e19 : 85 4c __ STA T4 + 1 
4e1b : a0 06 __ LDY #$06
4e1d : b1 13 __ LDA (P6),y ; (f + 0)
4e1f : 85 53 __ STA T10 + 0 
4e21 : c8 __ __ INY
4e22 : b1 13 __ LDA (P6),y ; (f + 0)
4e24 : 85 54 __ STA T10 + 1 
4e26 : c8 __ __ INY
4e27 : b1 13 __ LDA (P6),y ; (f + 0)
4e29 : 85 55 __ STA T11 + 0 
4e2b : c8 __ __ INY
4e2c : b1 13 __ LDA (P6),y ; (f + 0)
.s10:
4e2e : 85 56 __ STA T11 + 1 
4e30 : a9 00 __ LDA #$00
4e32 : 85 58 __ STA T13 + 0 
.l11:
4e34 : a6 49 __ LDX T3 + 0 
4e36 : a5 4a __ LDA T3 + 1 
4e38 : 10 0a __ BPL $4e44 ; (render.s12 + 0)
.s22:
4e3a : 38 __ __ SEC
4e3b : a9 00 __ LDA #$00
4e3d : e5 49 __ SBC T3 + 0 
4e3f : aa __ __ TAX
4e40 : a9 00 __ LDA #$00
4e42 : e5 4a __ SBC T3 + 1 
.s12:
4e44 : 86 0d __ STX P0 
4e46 : 86 0f __ STX P2 
4e48 : 85 0e __ STA P1 
4e4a : 85 10 __ STA P3 
4e4c : 20 58 4f JSR $4f58 ; (lmul16u.s4 + 0)
4e4f : a5 1b __ LDA ACCU + 0 
4e51 : 85 45 __ STA T2 + 0 
4e53 : a5 1c __ LDA ACCU + 1 
4e55 : 85 46 __ STA T2 + 1 
4e57 : a5 1d __ LDA ACCU + 2 
4e59 : 85 47 __ STA T2 + 2 
4e5b : a5 1e __ LDA ACCU + 3 
4e5d : 85 48 __ STA T2 + 3 
4e5f : a6 4b __ LDX T4 + 0 
4e61 : a5 4c __ LDA T4 + 1 
4e63 : 10 0a __ BPL $4e6f ; (render.s13 + 0)
.s21:
4e65 : 38 __ __ SEC
4e66 : a9 00 __ LDA #$00
4e68 : e5 4b __ SBC T4 + 0 
4e6a : aa __ __ TAX
4e6b : a9 00 __ LDA #$00
4e6d : e5 4c __ SBC T4 + 1 
.s13:
4e6f : 86 0d __ STX P0 
4e71 : 86 0f __ STX P2 
4e73 : 85 0e __ STA P1 
4e75 : 85 10 __ STA P3 
4e77 : 20 58 4f JSR $4f58 ; (lmul16u.s4 + 0)
4e7a : 18 __ __ CLC
4e7b : a5 1b __ LDA ACCU + 0 
4e7d : 65 45 __ ADC T2 + 0 
4e7f : a5 1c __ LDA ACCU + 1 
4e81 : 65 46 __ ADC T2 + 1 
4e83 : a5 1d __ LDA ACCU + 2 
4e85 : 65 47 __ ADC T2 + 2 
4e87 : a5 1e __ LDA ACCU + 3 
4e89 : 65 48 __ ADC T2 + 3 
4e8b : c9 04 __ CMP #$04
4e8d : 90 1b __ BCC $4eaa ; (render.s14 + 0)
.s20:
4e8f : a5 58 __ LDA T13 + 0 
4e91 : 4a __ __ LSR
4e92 : 4a __ __ LSR
4e93 : 85 1b __ STA ACCU + 0 
4e95 : a9 00 __ LDA #$00
4e97 : 85 1c __ STA ACCU + 1 
4e99 : 85 04 __ STA WORK + 1 
4e9b : a9 03 __ LDA #$03
4e9d : 85 03 __ STA WORK + 0 
4e9f : 20 d4 6e JSR $6ed4 ; (divmod + 0)
4ea2 : 18 __ __ CLC
4ea3 : a5 05 __ LDA WORK + 2 
4ea5 : 69 01 __ ADC #$01
4ea7 : 4c 09 4f JMP $4f09 ; (render.s18 + 0)
.s14:
4eaa : a5 49 __ LDA T3 + 0 
4eac : 85 0d __ STA P0 
4eae : a5 4a __ LDA T3 + 1 
4eb0 : 85 0e __ STA P1 
4eb2 : a5 4b __ LDA T4 + 0 
4eb4 : 85 0f __ STA P2 
4eb6 : a5 4c __ LDA T4 + 1 
4eb8 : 85 10 __ STA P3 
4eba : 38 __ __ SEC
4ebb : a5 45 __ LDA T2 + 0 
4ebd : e5 1b __ SBC ACCU + 0 
4ebf : a5 46 __ LDA T2 + 1 
4ec1 : e5 1c __ SBC ACCU + 1 
4ec3 : 85 43 __ STA T0 + 0 
4ec5 : a5 47 __ LDA T2 + 2 
4ec7 : e5 1d __ SBC ACCU + 2 
4ec9 : 85 44 __ STA T0 + 1 
4ecb : a5 48 __ LDA T2 + 3 
4ecd : e5 1e __ SBC ACCU + 3 
4ecf : a2 04 __ LDX #$04
.l15:
4ed1 : 4a __ __ LSR
4ed2 : 66 44 __ ROR T0 + 1 
4ed4 : 66 43 __ ROR T0 + 0 
4ed6 : ca __ __ DEX
4ed7 : d0 f8 __ BNE $4ed1 ; (render.l15 + 0)
.s16:
4ed9 : 18 __ __ CLC
4eda : a5 43 __ LDA T0 + 0 
4edc : 65 53 __ ADC T10 + 0 
4ede : 85 49 __ STA T3 + 0 
4ee0 : a5 44 __ LDA T0 + 1 
4ee2 : 65 54 __ ADC T10 + 1 
4ee4 : 85 4a __ STA T3 + 1 
4ee6 : 20 7f 4f JSR $4f7f ; (lmul4f12s.s4 + 0)
4ee9 : a5 1b __ LDA ACCU + 0 
4eeb : 0a __ __ ASL
4eec : a8 __ __ TAY
4eed : a5 1c __ LDA ACCU + 1 
4eef : 2a __ __ ROL
4ef0 : aa __ __ TAX
4ef1 : 98 __ __ TYA
4ef2 : 18 __ __ CLC
4ef3 : 65 55 __ ADC T11 + 0 
4ef5 : 85 4b __ STA T4 + 0 
4ef7 : 8a __ __ TXA
4ef8 : 65 56 __ ADC T11 + 1 
4efa : 85 4c __ STA T4 + 1 
4efc : e6 58 __ INC T13 + 0 
4efe : a5 58 __ LDA T13 + 0 
4f00 : c9 20 __ CMP #$20
4f02 : b0 03 __ BCS $4f07 ; (render.s17 + 0)
4f04 : 4c 34 4e JMP $4e34 ; (render.l11 + 0)
.s17:
4f07 : a9 00 __ LDA #$00
.s18:
4f09 : aa __ __ TAX
4f0a : a5 52 __ LDA T9 + 0 
4f0c : 29 03 __ AND #$03
4f0e : 0a __ __ ASL
4f0f : a8 __ __ TAY
4f10 : b9 20 72 LDA $7220,y ; (__shrtab192L + 0)
4f13 : 85 1b __ STA ACCU + 0 
4f15 : 49 ff __ EOR #$ff
4f17 : 85 45 __ STA T2 + 0 
4f19 : a5 52 __ LDA T9 + 0 
4f1b : 29 fc __ AND #$fc
4f1d : 0a __ __ ASL
4f1e : 85 49 __ STA T3 + 0 
4f20 : a5 4f __ LDA T7 + 1 
4f22 : 69 00 __ ADC #$00
4f24 : 85 4a __ STA T3 + 1 
4f26 : a4 4e __ LDY T7 + 0 
4f28 : b1 49 __ LDA (T3 + 0),y 
4f2a : 25 45 __ AND T2 + 0 
4f2c : 85 45 __ STA T2 + 0 
4f2e : bd f9 73 LDA $73f9,x ; (cbytes[0] + 0)
4f31 : 25 1b __ AND ACCU + 0 
4f33 : 05 45 __ ORA T2 + 0 
4f35 : 91 49 __ STA (T3 + 0),y 
4f37 : e6 52 __ INC T9 + 0 
4f39 : a5 52 __ LDA T9 + 0 
4f3b : c9 a0 __ CMP #$a0
4f3d : b0 03 __ BCS $4f42 ; (render.s19 + 0)
4f3f : 4c db 4d JMP $4ddb ; (render.l8 + 0)
.s19:
4f42 : e6 4d __ INC T6 + 0 
4f44 : a5 4d __ LDA T6 + 0 
4f46 : c9 c8 __ CMP #$c8
4f48 : b0 03 __ BCS $4f4d ; (render.s3 + 0)
4f4a : 4c 9a 4d JMP $4d9a ; (render.l7 + 0)
.s3:
4f4d : a2 05 __ LDX #$05
4f4f : bd da bf LDA $bfda,x ; (render@stack + 0)
4f52 : 95 53 __ STA T10 + 0,x 
4f54 : ca __ __ DEX
4f55 : 10 f8 __ BPL $4f4f ; (render.s3 + 2)
4f57 : 60 __ __ RTS
--------------------------------------------------------------------
lmul16u: ; lmul16u(u16,u16)->u32
;   5, "/home/xahmol/oscar64/include/fixmath.h"
.s4:
4f58 : a9 00 __ LDA #$00
4f5a : 85 1d __ STA ACCU + 2 
4f5c : 85 1e __ STA ACCU + 3 
4f5e : a2 10 __ LDX #$10
4f60 : 46 0e __ LSR P1 
4f62 : 66 0d __ ROR P0 
4f64 : 90 0d __ BCC $4f73 ; (lmul16u.s4 + 27)
4f66 : 18 __ __ CLC
4f67 : a5 1d __ LDA ACCU + 2 
4f69 : 65 0f __ ADC P2 
4f6b : 85 1d __ STA ACCU + 2 
4f6d : a5 1e __ LDA ACCU + 3 
4f6f : 65 10 __ ADC P3 
4f71 : 85 1e __ STA ACCU + 3 
4f73 : 66 1e __ ROR ACCU + 3 
4f75 : 66 1d __ ROR ACCU + 2 
4f77 : 66 1c __ ROR ACCU + 1 
4f79 : 66 1b __ ROR ACCU + 0 
4f7b : ca __ __ DEX
4f7c : d0 e2 __ BNE $4f60 ; (lmul16u.s4 + 8)
.s3:
4f7e : 60 __ __ RTS
--------------------------------------------------------------------
lmul4f12s: ; lmul4f12s(i16,i16)->i16
;  18, "/home/xahmol/oscar64/include/fixmath.h"
.s4:
4f7f : 38 __ __ SEC
4f80 : a5 0d __ LDA P0 
4f82 : 6a __ __ ROR
4f83 : 85 1b __ STA ACCU + 0 
4f85 : a9 00 __ LDA #$00
4f87 : 85 1c __ STA ACCU + 1 
4f89 : 90 0b __ BCC $4f96 ; (lmul4f12s.s4 + 23)
4f8b : a8 __ __ TAY
4f8c : 18 __ __ CLC
4f8d : a5 1c __ LDA ACCU + 1 
4f8f : 65 0f __ ADC P2 
4f91 : 85 1c __ STA ACCU + 1 
4f93 : 98 __ __ TYA
4f94 : 65 10 __ ADC P3 
4f96 : 6a __ __ ROR
4f97 : 66 1c __ ROR ACCU + 1 
4f99 : 46 1b __ LSR ACCU + 0 
4f9b : 90 f9 __ BCC $4f96 ; (lmul4f12s.s4 + 23)
4f9d : d0 ec __ BNE $4f8b ; (lmul4f12s.s4 + 12)
4f9f : a6 0e __ LDX P1 
4fa1 : 86 1b __ STX ACCU + 0 
4fa3 : a2 07 __ LDX #$07
4fa5 : 46 1b __ LSR ACCU + 0 
4fa7 : 90 0b __ BCC $4fb4 ; (lmul4f12s.s4 + 53)
4fa9 : a8 __ __ TAY
4faa : 18 __ __ CLC
4fab : a5 1c __ LDA ACCU + 1 
4fad : 65 0f __ ADC P2 
4faf : 85 1c __ STA ACCU + 1 
4fb1 : 98 __ __ TYA
4fb2 : 65 10 __ ADC P3 
4fb4 : 6a __ __ ROR
4fb5 : 66 1c __ ROR ACCU + 1 
4fb7 : 66 1b __ ROR ACCU + 0 
4fb9 : ca __ __ DEX
4fba : d0 eb __ BNE $4fa7 ; (lmul4f12s.s4 + 40)
4fbc : 90 0a __ BCC $4fc8 ; (lmul4f12s.s4 + 73)
4fbe : a8 __ __ TAY
4fbf : a5 1c __ LDA ACCU + 1 
4fc1 : e5 0f __ SBC P2 
4fc3 : 85 1c __ STA ACCU + 1 
4fc5 : 98 __ __ TYA
4fc6 : e5 10 __ SBC P3 
4fc8 : 6a __ __ ROR
4fc9 : 66 1c __ ROR ACCU + 1 
4fcb : 66 1b __ ROR ACCU + 0 
4fcd : 24 10 __ BIT P3 
4fcf : 10 0b __ BPL $4fdc ; (lmul4f12s.s4 + 93)
4fd1 : aa __ __ TAX
4fd2 : 38 __ __ SEC
4fd3 : a5 1c __ LDA ACCU + 1 
4fd5 : e5 0d __ SBC P0 
4fd7 : 85 1c __ STA ACCU + 1 
4fd9 : 8a __ __ TXA
4fda : e5 0e __ SBC P1 
4fdc : 4a __ __ LSR
4fdd : 66 1c __ ROR ACCU + 1 
4fdf : 66 1b __ ROR ACCU + 0 
4fe1 : 4a __ __ LSR
4fe2 : 66 1c __ ROR ACCU + 1 
4fe4 : 66 1b __ ROR ACCU + 0 
4fe6 : 4a __ __ LSR
4fe7 : 66 1c __ ROR ACCU + 1 
4fe9 : 66 1b __ ROR ACCU + 0 
4feb : 4a __ __ LSR
4fec : 66 1c __ ROR ACCU + 1 
4fee : 66 1b __ ROR ACCU + 0 
.s3:
4ff0 : 60 __ __ RTS
--------------------------------------------------------------------
colorize_standard: ; colorize_standard(const const struct S#28960[]*)->void
; 176, "/home/xahmol/git/UltimateDemo2026/src/mandel.c"
.s4:
4ff1 : a9 00 __ LDA #$00
4ff3 : 85 43 __ STA T0 + 0 
4ff5 : 85 44 __ STA T1 + 0 
4ff7 : 85 46 __ STA T2 + 0 
4ff9 : 85 48 __ STA T3 + 0 
4ffb : a9 e0 __ LDA #$e0
4ffd : 85 45 __ STA T1 + 1 
4fff : a9 c0 __ LDA #$c0
5001 : 85 47 __ STA T2 + 1 
5003 : a9 d8 __ LDA #$d8
5005 : 85 49 __ STA T3 + 1 
.l5:
5007 : a9 00 __ LDA #$00
5009 : 85 4a __ STA T4 + 0 
.l6:
500b : 0a __ __ ASL
500c : 0a __ __ ASL
500d : 0a __ __ ASL
500e : a2 00 __ LDX #$00
5010 : 90 02 __ BCC $5014 ; (colorize_standard.s51 + 0)
.s50:
5012 : e8 __ __ INX
5013 : 18 __ __ CLC
.s51:
5014 : 65 44 __ ADC T1 + 0 
5016 : 85 4b __ STA T5 + 0 
5018 : 8a __ __ TXA
5019 : 65 45 __ ADC T1 + 1 
501b : 85 4c __ STA T5 + 1 
501d : a9 00 __ LDA #$00
501f : 85 1c __ STA ACCU + 1 
5021 : 85 4d __ STA T10 + 0 
5023 : 85 4e __ STA T11 + 0 
5025 : aa __ __ TAX
5026 : a8 __ __ TAY
.l49:
5027 : b1 4b __ LDA (T5 + 0),y 
5029 : 85 1b __ STA ACCU + 0 
502b : 0a __ __ ASL
502c : 2a __ __ ROL
502d : 29 01 __ AND #$01
502f : 2a __ __ ROL
5030 : d0 04 __ BNE $5036 ; (colorize_standard.s43 + 0)
.s7:
5032 : e8 __ __ INX
5033 : 4c 4a 50 JMP $504a ; (colorize_standard.s8 + 0)
.s43:
5036 : c9 01 __ CMP #$01
5038 : d0 05 __ BNE $503f ; (colorize_standard.s44 + 0)
.s47:
503a : e6 1c __ INC ACCU + 1 
503c : 4c 4a 50 JMP $504a ; (colorize_standard.s8 + 0)
.s44:
503f : c9 02 __ CMP #$02
5041 : f0 05 __ BEQ $5048 ; (colorize_standard.s46 + 0)
.s45:
5043 : e6 4e __ INC T11 + 0 
5045 : 4c 4a 50 JMP $504a ; (colorize_standard.s8 + 0)
.s46:
5048 : e6 4d __ INC T10 + 0 
.s8:
504a : a5 1b __ LDA ACCU + 0 
504c : 29 30 __ AND #$30
504e : 4a __ __ LSR
504f : 4a __ __ LSR
5050 : 4a __ __ LSR
5051 : 4a __ __ LSR
5052 : d0 04 __ BNE $5058 ; (colorize_standard.s38 + 0)
.s9:
5054 : e8 __ __ INX
5055 : 4c 6c 50 JMP $506c ; (colorize_standard.s10 + 0)
.s38:
5058 : c9 01 __ CMP #$01
505a : d0 05 __ BNE $5061 ; (colorize_standard.s39 + 0)
.s42:
505c : e6 1c __ INC ACCU + 1 
505e : 4c 6c 50 JMP $506c ; (colorize_standard.s10 + 0)
.s39:
5061 : c9 02 __ CMP #$02
5063 : f0 05 __ BEQ $506a ; (colorize_standard.s41 + 0)
.s40:
5065 : e6 4e __ INC T11 + 0 
5067 : 4c 6c 50 JMP $506c ; (colorize_standard.s10 + 0)
.s41:
506a : e6 4d __ INC T10 + 0 
.s10:
506c : a5 1b __ LDA ACCU + 0 
506e : 29 0c __ AND #$0c
5070 : 4a __ __ LSR
5071 : 4a __ __ LSR
5072 : d0 04 __ BNE $5078 ; (colorize_standard.s33 + 0)
.s11:
5074 : e8 __ __ INX
5075 : 4c 8c 50 JMP $508c ; (colorize_standard.s12 + 0)
.s33:
5078 : c9 01 __ CMP #$01
507a : d0 05 __ BNE $5081 ; (colorize_standard.s34 + 0)
.s37:
507c : e6 1c __ INC ACCU + 1 
507e : 4c 8c 50 JMP $508c ; (colorize_standard.s12 + 0)
.s34:
5081 : c9 02 __ CMP #$02
5083 : f0 05 __ BEQ $508a ; (colorize_standard.s36 + 0)
.s35:
5085 : e6 4e __ INC T11 + 0 
5087 : 4c 8c 50 JMP $508c ; (colorize_standard.s12 + 0)
.s36:
508a : e6 4d __ INC T10 + 0 
.s12:
508c : a5 1b __ LDA ACCU + 0 
508e : 29 03 __ AND #$03
5090 : d0 04 __ BNE $5096 ; (colorize_standard.s28 + 0)
.s13:
5092 : e8 __ __ INX
5093 : 4c aa 50 JMP $50aa ; (colorize_standard.s14 + 0)
.s28:
5096 : c9 01 __ CMP #$01
5098 : d0 05 __ BNE $509f ; (colorize_standard.s29 + 0)
.s32:
509a : e6 1c __ INC ACCU + 1 
509c : 4c aa 50 JMP $50aa ; (colorize_standard.s14 + 0)
.s29:
509f : c9 02 __ CMP #$02
50a1 : f0 05 __ BEQ $50a8 ; (colorize_standard.s31 + 0)
.s30:
50a3 : e6 4e __ INC T11 + 0 
50a5 : 4c aa 50 JMP $50aa ; (colorize_standard.s14 + 0)
.s31:
50a8 : e6 4d __ INC T10 + 0 
.s14:
50aa : c8 __ __ INY
50ab : c0 08 __ CPY #$08
50ad : b0 03 __ BCS $50b2 ; (colorize_standard.s15 + 0)
50af : 4c 27 50 JMP $5027 ; (colorize_standard.l49 + 0)
.s15:
50b2 : 18 __ __ CLC
50b3 : a5 4d __ LDA T10 + 0 
50b5 : 65 1c __ ADC ACCU + 1 
50b7 : 85 4b __ STA T5 + 0 
50b9 : a9 00 __ LDA #$00
50bb : 2a __ __ ROL
50bc : a8 __ __ TAY
50bd : a5 4b __ LDA T5 + 0 
50bf : 65 4e __ ADC T11 + 0 
50c1 : 85 4b __ STA T5 + 0 
50c3 : 98 __ __ TYA
50c4 : 69 00 __ ADC #$00
50c6 : 05 4b __ ORA T5 + 0 
50c8 : f0 02 __ BEQ $50cc ; (colorize_standard.s53 + 0)
.s52:
50ca : a9 01 __ LDA #$01
.s53:
50cc : 85 4b __ STA T5 + 0 
50ce : 8a __ __ TXA
50cf : f0 03 __ BEQ $50d4 ; (colorize_standard.s16 + 0)
50d1 : 4c 73 51 JMP $5173 ; (colorize_standard.s26 + 0)
.s16:
50d4 : a5 4b __ LDA T5 + 0 
50d6 : f0 22 __ BEQ $50fa ; (colorize_standard.s17 + 0)
.s19:
50d8 : a5 1c __ LDA ACCU + 1 
50da : c5 4d __ CMP T10 + 0 
50dc : b0 04 __ BCS $50e2 ; (colorize_standard.s20 + 0)
.s25:
50de : a9 02 __ LDA #$02
50e0 : 90 02 __ BCC $50e4 ; (colorize_standard.s21 + 0)
.s20:
50e2 : a9 01 __ LDA #$01
.s21:
50e4 : 85 4b __ STA T5 + 0 
50e6 : a5 4d __ LDA T10 + 0 
50e8 : c5 4e __ CMP T11 + 0 
50ea : b0 06 __ BCS $50f2 ; (colorize_standard.s22 + 0)
.s23:
50ec : a5 1c __ LDA ACCU + 1 
50ee : c5 4e __ CMP T11 + 0 
50f0 : 90 04 __ BCC $50f6 ; (colorize_standard.s24 + 0)
.s22:
50f2 : c6 4b __ DEC T5 + 0 
50f4 : b0 04 __ BCS $50fa ; (colorize_standard.s17 + 0)
.s24:
50f6 : a9 02 __ LDA #$02
.s48:
50f8 : 85 4b __ STA T5 + 0 
.s17:
50fa : 18 __ __ CLC
50fb : a5 4a __ LDA T4 + 0 
50fd : 65 43 __ ADC T0 + 0 
50ff : 0a __ __ ASL
5100 : 0a __ __ ASL
5101 : 85 1b __ STA ACCU + 0 
5103 : a9 00 __ LDA #$00
5105 : 85 1c __ STA ACCU + 1 
5107 : 85 04 __ STA WORK + 1 
5109 : a9 41 __ LDA #$41
510b : 85 03 __ STA WORK + 0 
510d : 20 d4 6e JSR $6ed4 ; (divmod + 0)
5110 : a6 1b __ LDX ACCU + 0 
5112 : bd 27 72 LDA $7227,x ; (__multab12L + 0)
5115 : 18 __ __ CLC
5116 : 65 0d __ ADC P0 ; (pal + 0)
5118 : 85 1b __ STA ACCU + 0 
511a : a5 0e __ LDA P1 ; (pal + 1)
511c : 69 00 __ ADC #$00
511e : aa __ __ TAX
511f : a4 4b __ LDY T5 + 0 
5121 : b9 2b 72 LDA $722b,y ; (__multab3L + 0)
5124 : 18 __ __ CLC
5125 : 65 1b __ ADC ACCU + 0 
5127 : 85 1b __ STA ACCU + 0 
5129 : 90 01 __ BCC $512c ; (colorize_standard.s55 + 0)
.s54:
512b : e8 __ __ INX
.s55:
512c : 86 1c __ STX ACCU + 1 
512e : a0 00 __ LDY #$00
5130 : b1 1b __ LDA (ACCU + 0),y 
5132 : 0a __ __ ASL
5133 : 0a __ __ ASL
5134 : 0a __ __ ASL
5135 : 0a __ __ ASL
5136 : c8 __ __ INY
5137 : 11 1b __ ORA (ACCU + 0),y 
5139 : 88 __ __ DEY
513a : 91 46 __ STA (T2 + 0),y 
513c : a0 02 __ LDY #$02
513e : b1 1b __ LDA (ACCU + 0),y 
5140 : a0 00 __ LDY #$00
5142 : 91 48 __ STA (T3 + 0),y 
5144 : e6 46 __ INC T2 + 0 
5146 : d0 02 __ BNE $514a ; (colorize_standard.s57 + 0)
.s56:
5148 : e6 47 __ INC T2 + 1 
.s57:
514a : e6 48 __ INC T3 + 0 
514c : d0 02 __ BNE $5150 ; (colorize_standard.s59 + 0)
.s58:
514e : e6 49 __ INC T3 + 1 
.s59:
5150 : e6 4a __ INC T4 + 0 
5152 : a5 4a __ LDA T4 + 0 
5154 : c9 28 __ CMP #$28
5156 : f0 03 __ BEQ $515b ; (colorize_standard.s18 + 0)
5158 : 4c 0b 50 JMP $500b ; (colorize_standard.l6 + 0)
.s18:
515b : a5 44 __ LDA T1 + 0 
515d : 69 3f __ ADC #$3f
515f : 85 44 __ STA T1 + 0 
5161 : a5 45 __ LDA T1 + 1 
5163 : 69 01 __ ADC #$01
5165 : 85 45 __ STA T1 + 1 
5167 : e6 43 __ INC T0 + 0 
5169 : a5 43 __ LDA T0 + 0 
516b : c9 19 __ CMP #$19
516d : f0 03 __ BEQ $5172 ; (colorize_standard.s3 + 0)
516f : 4c 07 50 JMP $5007 ; (colorize_standard.l5 + 0)
.s3:
5172 : 60 __ __ RTS
.s26:
5173 : a5 4b __ LDA T5 + 0 
5175 : f0 83 __ BEQ $50fa ; (colorize_standard.s17 + 0)
.s27:
5177 : a9 03 __ LDA #$03
5179 : 4c f8 50 JMP $50f8 ; (colorize_standard.s48 + 0)
--------------------------------------------------------------------
ball_run: ; ball_run()->void
;   3, "/home/xahmol/git/UltimateDemo2026/src/ball.h"
.s1:
517c : a2 04 __ LDX #$04
517e : b5 53 __ LDA T1 + 0,x 
5180 : 9d c6 bf STA $bfc6,x ; (ball_run@stack + 0)
5183 : ca __ __ DEX
5184 : 10 f8 __ BPL $517e ; (ball_run.s1 + 2)
.s4:
5186 : a9 00 __ LDA #$00
5188 : 8d 36 82 STA $8236 ; (ball_z + 0)
518b : 8d 37 82 STA $8237 ; (ball_z + 1)
518e : 8d fe 79 STA $79fe ; (ball_y + 0)
5191 : 8d ff 79 STA $79ff ; (ball_y + 1)
5194 : 8d fc 79 STA $79fc ; (ball_x + 0)
5197 : 8d fd 79 STA $79fd ; (ball_x + 1)
519a : a9 05 __ LDA #$05
519c : 8d fb 85 STA $85fb ; (ball_vz + 0)
519f : a9 03 __ LDA #$03
51a1 : 8d fa 85 STA $85fa ; (ball_vy + 0)
51a4 : a9 02 __ LDA #$02
51a6 : 8d ff 76 STA $76ff ; (ball_vx + 0)
51a9 : a9 8f __ LDA #$8f
51ab : 20 f1 15 JSR $15f1 ; (turbo_set.s4 + 0)
51ae : 20 96 52 JSR $5296 ; (ball_init.s4 + 0)
51b1 : a9 00 __ LDA #$00
51b3 : 85 53 __ STA T1 + 0 
51b5 : 85 54 __ STA T2 + 0 
51b7 : 85 55 __ STA T3 + 0 
51b9 : a9 a8 __ LDA #$a8
51bb : 85 56 __ STA T4 + 0 
51bd : a9 fd __ LDA #$fd
51bf : 85 57 __ STA T4 + 1 
.l5:
51c1 : 2c 11 d0 BIT $d011 
51c4 : 30 fb __ BMI $51c1 ; (ball_run.l5 + 0)
.l6:
51c6 : 2c 11 d0 BIT $d011 
51c9 : 10 fb __ BPL $51c6 ; (ball_run.l6 + 0)
.s7:
51cb : a9 00 __ LDA #$00
51cd : 85 0f __ STA P2 
51cf : 85 10 __ STA P3 
51d1 : 85 0d __ STA P0 
51d3 : 20 91 72 JSR $7291 ; (memset@proxy + 0)
51d6 : a5 53 __ LDA T1 + 0 
51d8 : 85 13 __ STA P6 
51da : a5 54 __ LDA T2 + 0 
51dc : 85 14 __ STA P7 
51de : 20 ef 52 JSR $52ef ; (update_ball.s4 + 0)
51e1 : ad fc 79 LDA $79fc ; (ball_x + 0)
51e4 : 85 0d __ STA P0 
51e6 : ad fd 79 LDA $79fd ; (ball_x + 1)
51e9 : 85 0e __ STA P1 
51eb : ad fe 79 LDA $79fe ; (ball_y + 0)
51ee : 85 0f __ STA P2 
51f0 : ad ff 79 LDA $79ff ; (ball_y + 1)
51f3 : 85 10 __ STA P3 
51f5 : ad 36 82 LDA $8236 ; (ball_z + 0)
51f8 : 85 11 __ STA P4 
51fa : ad 37 82 LDA $8237 ; (ball_z + 1)
51fd : 85 12 __ STA P5 
51ff : a9 d4 __ LDA #$d4
5201 : 85 15 __ STA P8 
5203 : a9 bf __ LDA #$bf
5205 : 85 18 __ STA P11 
5207 : a9 bf __ LDA #$bf
5209 : 85 16 __ STA P9 
520b : a9 d2 __ LDA #$d2
520d : 85 17 __ STA P10 
520f : 20 e6 53 JSR $53e6 ; (rot_proj.s4 + 0)
5212 : a5 13 __ LDA P6 
5214 : 8d ea bf STA $bfea ; (sstack + 0)
5217 : a5 14 __ LDA P7 
5219 : 8d eb bf STA $bfeb ; (sstack + 1)
521c : a5 0d __ LDA P0 
521e : 8d ec bf STA $bfec ; (sstack + 2)
5221 : a5 0e __ LDA P1 
5223 : 8d ed bf STA $bfed ; (sstack + 3)
5226 : a5 11 __ LDA P4 
5228 : 8d ee bf STA $bfee ; (sstack + 4)
522b : a5 12 __ LDA P5 
522d : 8d ef bf STA $bfef ; (sstack + 5)
5230 : 20 bd 55 JSR $55bd ; (draw_shadow.s1 + 0)
5233 : ad d4 bf LDA $bfd4 ; (bsx + 0)
5236 : 8d ea bf STA $bfea ; (sstack + 0)
5239 : ad d5 bf LDA $bfd5 ; (bsx + 1)
523c : 8d eb bf STA $bfeb ; (sstack + 1)
523f : ad d2 bf LDA $bfd2 ; (bsy + 0)
5242 : 8d ec bf STA $bfec ; (sstack + 2)
5245 : ad d3 bf LDA $bfd3 ; (bsy + 1)
5248 : 8d ed bf STA $bfed ; (sstack + 3)
524b : a5 55 __ LDA T3 + 0 
524d : 8d ee bf STA $bfee ; (sstack + 4)
5250 : 20 8b 57 JSR $578b ; (draw_ball.s1 + 0)
5253 : a5 53 __ LDA T1 + 0 
5255 : 8d ec bf STA $bfec ; (sstack + 2)
5258 : a5 54 __ LDA T2 + 0 
525a : 8d ed bf STA $bfed ; (sstack + 3)
525d : 18 __ __ CLC
525e : 69 02 __ ADC #$02
5260 : 85 54 __ STA T2 + 0 
5262 : 20 45 5c JSR $5c45 ; (draw_cube.s1 + 0)
5265 : e6 55 __ INC T3 + 0 
5267 : e6 53 __ INC T1 + 0 
5269 : e6 56 __ INC T4 + 0 
526b : f0 03 __ BEQ $5270 ; (ball_run.s9 + 0)
526d : 4c c1 51 JMP $51c1 ; (ball_run.l5 + 0)
.s9:
5270 : e6 57 __ INC T4 + 1 
5272 : d0 f9 __ BNE $526d ; (ball_run.s7 + 162)
.s8:
5274 : a9 00 __ LDA #$00
5276 : 85 0d __ STA P0 
5278 : 85 0e __ STA P1 
527a : 85 10 __ STA P3 
527c : a9 36 __ LDA #$36
527e : 85 01 __ STA $01 
5280 : 20 0b 0f JSR $0f0b ; (vic_setmode@proxy + 0)
5283 : a9 00 __ LDA #$00
5285 : 8d 20 d0 STA $d020 
5288 : 8d 21 d0 STA $d021 
.s3:
528b : a2 04 __ LDX #$04
528d : bd c6 bf LDA $bfc6,x ; (ball_run@stack + 0)
5290 : 95 53 __ STA T1 + 0,x 
5292 : ca __ __ DEX
5293 : 10 f8 __ BPL $528d ; (ball_run.s3 + 2)
5295 : 60 __ __ RTS
--------------------------------------------------------------------
ball_init: ; ball_init()->void
; 307, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5296 : 78 __ __ SEI
5297 : a9 35 __ LDA #$35
5299 : 85 01 __ STA $01 
529b : 20 0f 21 JSR $210f ; (mmap_trampoline.s4 + 0)
529e : 58 __ __ CLI
529f : a9 00 __ LDA #$00
52a1 : 85 0f __ STA P2 
52a3 : 85 10 __ STA P3 
52a5 : 85 43 __ STA T0 + 0 
52a7 : 85 0d __ STA P0 
52a9 : 20 91 72 JSR $7291 ; (memset@proxy + 0)
52ac : a9 c0 __ LDA #$c0
52ae : 85 44 __ STA T0 + 1 
52b0 : a9 00 __ LDA #$00
52b2 : 85 1f __ STA ADDR + 0 
52b4 : f0 02 __ BEQ $52b8 ; (ball_init.l7 + 0)
.s8:
52b6 : e6 44 __ INC T0 + 1 
.l7:
52b8 : a9 12 __ LDA #$12
52ba : a0 00 __ LDY #$00
52bc : 91 43 __ STA (T0 + 0),y 
52be : 18 __ __ CLC
52bf : a5 44 __ LDA T0 + 1 
52c1 : 69 18 __ ADC #$18
52c3 : 85 20 __ STA ADDR + 1 
52c5 : a9 0c __ LDA #$0c
52c7 : a4 43 __ LDY T0 + 0 
52c9 : 91 1f __ STA (ADDR + 0),y 
52cb : 98 __ __ TYA
52cc : 18 __ __ CLC
52cd : 69 01 __ ADC #$01
52cf : 85 43 __ STA T0 + 0 
52d1 : b0 e3 __ BCS $52b6 ; (ball_init.s8 + 0)
.s9:
52d3 : c9 e8 __ CMP #$e8
52d5 : d0 e1 __ BNE $52b8 ; (ball_init.l7 + 0)
.s6:
52d7 : a5 44 __ LDA T0 + 1 
52d9 : c9 c3 __ CMP #$c3
52db : d0 db __ BNE $52b8 ; (ball_init.l7 + 0)
.s5:
52dd : a9 00 __ LDA #$00
52df : 85 0e __ STA P1 
52e1 : 85 10 __ STA P3 
52e3 : 20 e6 72 JSR $72e6 ; (vic_setmode@proxy + 0)
52e6 : a9 00 __ LDA #$00
52e8 : 8d 21 d0 STA $d021 
52eb : 8d 20 d0 STA $d020 
.s3:
52ee : 60 __ __ RTS
--------------------------------------------------------------------
update_ball: ; update_ball()->void
; 215, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
52ef : a0 00 __ LDY #$00
52f1 : 2c ff 76 BIT $76ff ; (ball_vx + 0)
52f4 : 10 01 __ BPL $52f7 ; (update_ball.s32 + 0)
.s31:
52f6 : 88 __ __ DEY
.s32:
52f7 : ad fc 79 LDA $79fc ; (ball_x + 0)
52fa : 18 __ __ CLC
52fb : 6d ff 76 ADC $76ff ; (ball_vx + 0)
52fe : 8d fc 79 STA $79fc ; (ball_x + 0)
5301 : 98 __ __ TYA
5302 : 6d fd 79 ADC $79fd ; (ball_x + 1)
5305 : 8d fd 79 STA $79fd ; (ball_x + 1)
5308 : 30 1f __ BMI $5329 ; (update_ball.s5 + 0)
.s30:
530a : f0 16 __ BEQ $5322 ; (update_ball.s29 + 0)
.s37:
530c : a9 24 __ LDA #$24
.s28:
530e : 8d fc 79 STA $79fc ; (ball_x + 0)
5311 : a9 00 __ LDA #$00
.s25:
5313 : 8d fd 79 STA $79fd ; (ball_x + 1)
5316 : 38 __ __ SEC
5317 : a9 00 __ LDA #$00
5319 : ed ff 76 SBC $76ff ; (ball_vx + 0)
531c : 8d ff 76 STA $76ff ; (ball_vx + 0)
531f : 4c 42 53 JMP $5342 ; (update_ball.s6 + 0)
.s29:
5322 : a9 24 __ LDA #$24
5324 : cd fc 79 CMP $79fc ; (ball_x + 0)
5327 : 90 e5 __ BCC $530e ; (update_ball.s28 + 0)
.s5:
5329 : ad fd 79 LDA $79fd ; (ball_x + 1)
532c : 49 80 __ EOR #$80
532e : c9 7f __ CMP #$7f
5330 : d0 05 __ BNE $5337 ; (update_ball.s27 + 0)
.s26:
5332 : ad fc 79 LDA $79fc ; (ball_x + 0)
5335 : c9 dc __ CMP #$dc
.s27:
5337 : b0 09 __ BCS $5342 ; (update_ball.s6 + 0)
.s24:
5339 : a9 dc __ LDA #$dc
533b : 8d fc 79 STA $79fc ; (ball_x + 0)
533e : a9 ff __ LDA #$ff
5340 : 90 d1 __ BCC $5313 ; (update_ball.s25 + 0)
.s6:
5342 : a0 00 __ LDY #$00
5344 : 2c fa 85 BIT $85fa ; (ball_vy + 0)
5347 : 10 01 __ BPL $534a ; (update_ball.s34 + 0)
.s33:
5349 : 88 __ __ DEY
.s34:
534a : ad fe 79 LDA $79fe ; (ball_y + 0)
534d : 18 __ __ CLC
534e : 6d fa 85 ADC $85fa ; (ball_vy + 0)
5351 : 8d fe 79 STA $79fe ; (ball_y + 0)
5354 : 98 __ __ TYA
5355 : 6d ff 79 ADC $79ff ; (ball_y + 1)
5358 : 8d ff 79 STA $79ff ; (ball_y + 1)
535b : 30 1f __ BMI $537c ; (update_ball.s7 + 0)
.s23:
535d : f0 16 __ BEQ $5375 ; (update_ball.s22 + 0)
.s38:
535f : a9 24 __ LDA #$24
.s21:
5361 : 8d fe 79 STA $79fe ; (ball_y + 0)
5364 : a9 00 __ LDA #$00
.s18:
5366 : 8d ff 79 STA $79ff ; (ball_y + 1)
5369 : 38 __ __ SEC
536a : a9 00 __ LDA #$00
536c : ed fa 85 SBC $85fa ; (ball_vy + 0)
536f : 8d fa 85 STA $85fa ; (ball_vy + 0)
5372 : 4c 95 53 JMP $5395 ; (update_ball.s8 + 0)
.s22:
5375 : a9 24 __ LDA #$24
5377 : cd fe 79 CMP $79fe ; (ball_y + 0)
537a : 90 e5 __ BCC $5361 ; (update_ball.s21 + 0)
.s7:
537c : ad ff 79 LDA $79ff ; (ball_y + 1)
537f : 49 80 __ EOR #$80
5381 : c9 7f __ CMP #$7f
5383 : d0 05 __ BNE $538a ; (update_ball.s20 + 0)
.s19:
5385 : ad fe 79 LDA $79fe ; (ball_y + 0)
5388 : c9 dc __ CMP #$dc
.s20:
538a : b0 09 __ BCS $5395 ; (update_ball.s8 + 0)
.s17:
538c : a9 dc __ LDA #$dc
538e : 8d fe 79 STA $79fe ; (ball_y + 0)
5391 : a9 ff __ LDA #$ff
5393 : 90 d1 __ BCC $5366 ; (update_ball.s18 + 0)
.s8:
5395 : a0 00 __ LDY #$00
5397 : 2c fb 85 BIT $85fb ; (ball_vz + 0)
539a : 10 01 __ BPL $539d ; (update_ball.s36 + 0)
.s35:
539c : 88 __ __ DEY
.s36:
539d : ad 36 82 LDA $8236 ; (ball_z + 0)
53a0 : 18 __ __ CLC
53a1 : 6d fb 85 ADC $85fb ; (ball_vz + 0)
53a4 : 8d 36 82 STA $8236 ; (ball_z + 0)
53a7 : 98 __ __ TYA
53a8 : 6d 37 82 ADC $8237 ; (ball_z + 1)
53ab : 8d 37 82 STA $8237 ; (ball_z + 1)
53ae : 30 1d __ BMI $53cd ; (update_ball.s9 + 0)
.s16:
53b0 : f0 14 __ BEQ $53c6 ; (update_ball.s15 + 0)
.s39:
53b2 : a9 24 __ LDA #$24
.s14:
53b4 : 8d 36 82 STA $8236 ; (ball_z + 0)
53b7 : a9 00 __ LDA #$00
.s11:
53b9 : 8d 37 82 STA $8237 ; (ball_z + 1)
53bc : 38 __ __ SEC
53bd : a9 00 __ LDA #$00
53bf : ed fb 85 SBC $85fb ; (ball_vz + 0)
53c2 : 8d fb 85 STA $85fb ; (ball_vz + 0)
.s3:
53c5 : 60 __ __ RTS
.s15:
53c6 : a9 24 __ LDA #$24
53c8 : cd 36 82 CMP $8236 ; (ball_z + 0)
53cb : 90 e7 __ BCC $53b4 ; (update_ball.s14 + 0)
.s9:
53cd : ad 37 82 LDA $8237 ; (ball_z + 1)
53d0 : 49 80 __ EOR #$80
53d2 : c9 7f __ CMP #$7f
53d4 : d0 05 __ BNE $53db ; (update_ball.s13 + 0)
.s12:
53d6 : ad 36 82 LDA $8236 ; (ball_z + 0)
53d9 : c9 dc __ CMP #$dc
.s13:
53db : b0 e8 __ BCS $53c5 ; (update_ball.s3 + 0)
.s10:
53dd : a9 dc __ LDA #$dc
53df : 8d 36 82 STA $8236 ; (ball_z + 0)
53e2 : a9 ff __ LDA #$ff
53e4 : 90 d3 __ BCC $53b9 ; (update_ball.s11 + 0)
--------------------------------------------------------------------
rot_proj: ; rot_proj(i16,i16,i16,u8,u8,i16*,i16*)->void
; 108, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
53e6 : a5 14 __ LDA P7 ; (ay + 0)
53e8 : 29 3f __ AND #$3f
53ea : aa __ __ TAX
53eb : bd 86 76 LDA $7686,x ; (sin64[0] + 0)
53ee : 85 45 __ STA T1 + 0 
53f0 : 85 03 __ STA WORK + 0 
53f2 : 29 80 __ AND #$80
53f4 : 10 02 __ BPL $53f8 ; (rot_proj.s4 + 18)
53f6 : a9 ff __ LDA #$ff
53f8 : 85 46 __ STA T1 + 1 
53fa : 85 04 __ STA WORK + 1 
53fc : 20 4f 6e JSR $6e4f ; (mul16@proxy + 0)
53ff : a5 05 __ LDA WORK + 2 
5401 : 85 49 __ STA T3 + 0 
5403 : a5 06 __ LDA WORK + 3 
5405 : 85 4a __ STA T3 + 1 
5407 : 18 __ __ CLC
5408 : a5 14 __ LDA P7 ; (ay + 0)
540a : 69 10 __ ADC #$10
540c : 29 3f __ AND #$3f
540e : aa __ __ TAX
540f : bd 86 76 LDA $7686,x ; (sin64[0] + 0)
5412 : 85 43 __ STA T0 + 0 
5414 : 85 1b __ STA ACCU + 0 
5416 : 29 80 __ AND #$80
5418 : 10 02 __ BPL $541c ; (rot_proj.s4 + 54)
541a : a9 ff __ LDA #$ff
541c : 85 44 __ STA T0 + 1 
541e : 85 1c __ STA ACCU + 1 
5420 : 20 86 72 JSR $7286 ; (mul16@proxy + 0)
5423 : 18 __ __ CLC
5424 : a5 05 __ LDA WORK + 2 
5426 : 65 49 __ ADC T3 + 0 
5428 : 85 49 __ STA T3 + 0 
542a : a5 06 __ LDA WORK + 3 
542c : 65 4a __ ADC T3 + 1 
542e : 85 4a __ STA T3 + 1 
5430 : a5 13 __ LDA P6 ; (ax + 0)
5432 : 29 3f __ AND #$3f
5434 : aa __ __ TAX
5435 : bd 86 76 LDA $7686,x ; (sin64[0] + 0)
5438 : 85 4d __ STA T6 + 0 
543a : 29 80 __ AND #$80
543c : 10 02 __ BPL $5440 ; (rot_proj.s4 + 90)
543e : a9 ff __ LDA #$ff
5440 : 85 4e __ STA T6 + 1 
5442 : a5 43 __ LDA T0 + 0 
5444 : 85 03 __ STA WORK + 0 
5446 : a5 44 __ LDA T0 + 1 
5448 : 85 04 __ STA WORK + 1 
544a : 20 4f 6e JSR $6e4f ; (mul16@proxy + 0)
544d : a5 05 __ LDA WORK + 2 
544f : 85 43 __ STA T0 + 0 
5451 : a5 06 __ LDA WORK + 3 
5453 : 85 44 __ STA T0 + 1 
5455 : 38 __ __ SEC
5456 : a9 00 __ LDA #$00
5458 : e5 45 __ SBC T1 + 0 
545a : 85 1b __ STA ACCU + 0 
545c : a9 00 __ LDA #$00
545e : e5 46 __ SBC T1 + 1 
5460 : 85 1c __ STA ACCU + 1 
5462 : 20 86 72 JSR $7286 ; (mul16@proxy + 0)
5465 : 18 __ __ CLC
5466 : a5 05 __ LDA WORK + 2 
5468 : 65 43 __ ADC T0 + 0 
546a : 85 1b __ STA ACCU + 0 
546c : a5 06 __ LDA WORK + 3 
546e : 65 44 __ ADC T0 + 1 
5470 : 85 1c __ STA ACCU + 1 
5472 : 20 d0 72 JSR $72d0 ; (divs16@proxy + 0)
5475 : a5 1b __ LDA ACCU + 0 
5477 : 85 43 __ STA T0 + 0 
5479 : a5 1c __ LDA ACCU + 1 
547b : 85 44 __ STA T0 + 1 
547d : 20 7b 72 JSR $727b ; (mul16@proxy + 0)
5480 : a5 05 __ LDA WORK + 2 
5482 : 85 45 __ STA T1 + 0 
5484 : a5 06 __ LDA WORK + 3 
5486 : 85 46 __ STA T1 + 1 
5488 : 18 __ __ CLC
5489 : a5 13 __ LDA P6 ; (ax + 0)
548b : 69 10 __ ADC #$10
548d : 29 3f __ AND #$3f
548f : aa __ __ TAX
5490 : bd 86 76 LDA $7686,x ; (sin64[0] + 0)
5493 : 85 4b __ STA T4 + 0 
5495 : 85 1b __ STA ACCU + 0 
5497 : 29 80 __ AND #$80
5499 : 10 02 __ BPL $549d ; (rot_proj.s4 + 183)
549b : a9 ff __ LDA #$ff
549d : 85 4c __ STA T4 + 1 
549f : 85 1c __ STA ACCU + 1 
54a1 : a5 0f __ LDA P2 ; (wy + 0)
54a3 : 85 03 __ STA WORK + 0 
54a5 : a5 10 __ LDA P3 ; (wy + 1)
54a7 : 85 04 __ STA WORK + 1 
54a9 : 20 57 6e JSR $6e57 ; (mul16 + 0)
54ac : 38 __ __ SEC
54ad : a5 05 __ LDA WORK + 2 
54af : e5 45 __ SBC T1 + 0 
54b1 : 85 45 __ STA T1 + 0 
54b3 : a5 06 __ LDA WORK + 3 
54b5 : e5 46 __ SBC T1 + 1 
54b7 : 85 46 __ STA T1 + 1 
54b9 : a5 4b __ LDA T4 + 0 
54bb : 85 1b __ STA ACCU + 0 
54bd : a5 4c __ LDA T4 + 1 
54bf : 85 1c __ STA ACCU + 1 
54c1 : a5 43 __ LDA T0 + 0 
54c3 : 85 03 __ STA WORK + 0 
54c5 : a5 44 __ LDA T0 + 1 
54c7 : 85 04 __ STA WORK + 1 
54c9 : 20 57 6e JSR $6e57 ; (mul16 + 0)
54cc : a5 05 __ LDA WORK + 2 
54ce : 85 43 __ STA T0 + 0 
54d0 : a5 06 __ LDA WORK + 3 
54d2 : 85 44 __ STA T0 + 1 
54d4 : a5 0f __ LDA P2 ; (wy + 0)
54d6 : 85 1b __ STA ACCU + 0 
54d8 : a5 10 __ LDA P3 ; (wy + 1)
54da : 85 1c __ STA ACCU + 1 
54dc : 20 7b 72 JSR $727b ; (mul16@proxy + 0)
54df : 18 __ __ CLC
54e0 : a5 05 __ LDA WORK + 2 
54e2 : 65 43 __ ADC T0 + 0 
54e4 : 85 1b __ STA ACCU + 0 
54e6 : a5 06 __ LDA WORK + 3 
54e8 : 65 44 __ ADC T0 + 1 
54ea : 85 1c __ STA ACCU + 1 
54ec : 20 d0 72 JSR $72d0 ; (divs16@proxy + 0)
54ef : 18 __ __ CLC
54f0 : a5 1b __ LDA ACCU + 0 
54f2 : 69 f8 __ ADC #$f8
54f4 : 85 47 __ STA T2 + 0 
54f6 : a5 1c __ LDA ACCU + 1 
54f8 : 69 00 __ ADC #$00
54fa : 85 48 __ STA T2 + 1 
54fc : a5 1c __ LDA ACCU + 1 
54fe : 49 80 __ EOR #$80
5500 : c9 7f __ CMP #$7f
5502 : d0 04 __ BNE $5508 ; (rot_proj.s8 + 0)
.s7:
5504 : a5 1b __ LDA ACCU + 0 
5506 : c9 09 __ CMP #$09
.s8:
5508 : b0 08 __ BCS $5512 ; (rot_proj.s5 + 0)
.s6:
550a : a9 01 __ LDA #$01
550c : 85 47 __ STA T2 + 0 
550e : a9 00 __ LDA #$00
5510 : 85 48 __ STA T2 + 1 
.s5:
5512 : a5 49 __ LDA T3 + 0 
5514 : 85 1b __ STA ACCU + 0 
5516 : a5 4a __ LDA T3 + 1 
5518 : 85 1c __ STA ACCU + 1 
551a : 20 d0 72 JSR $72d0 ; (divs16@proxy + 0)
551d : a5 1b __ LDA ACCU + 0 
551f : 85 49 __ STA T3 + 0 
5521 : 0a __ __ ASL
5522 : a8 __ __ TAY
5523 : a5 1c __ LDA ACCU + 1 
5525 : 2a __ __ ROL
5526 : aa __ __ TAX
5527 : 98 __ __ TYA
5528 : 18 __ __ CLC
5529 : 65 1b __ ADC ACCU + 0 
552b : a8 __ __ TAY
552c : 8a __ __ TXA
552d : 65 1c __ ADC ACCU + 1 
552f : 85 1b __ STA ACCU + 0 
5531 : 98 __ __ TYA
5532 : 0a __ __ ASL
5533 : 26 1b __ ROL ACCU + 0 
5535 : 0a __ __ ASL
5536 : 26 1b __ ROL ACCU + 0 
5538 : 0a __ __ ASL
5539 : 26 1b __ ROL ACCU + 0 
553b : 18 __ __ CLC
553c : 65 49 __ ADC T3 + 0 
553e : 85 49 __ STA T3 + 0 
5540 : a5 1b __ LDA ACCU + 0 
5542 : 65 1c __ ADC ACCU + 1 
5544 : 06 49 __ ASL T3 + 0 
5546 : 2a __ __ ROL
5547 : 06 49 __ ASL T3 + 0 
5549 : 2a __ __ ROL
554a : 06 49 __ ASL T3 + 0 
554c : 2a __ __ ROL
554d : 85 1c __ STA ACCU + 1 
554f : a5 49 __ LDA T3 + 0 
5551 : 85 1b __ STA ACCU + 0 
5553 : 20 c5 72 JSR $72c5 ; (divs16@proxy + 0)
5556 : 18 __ __ CLC
5557 : a5 1b __ LDA ACCU + 0 
5559 : 69 50 __ ADC #$50
555b : a0 00 __ LDY #$00
555d : 84 04 __ STY WORK + 1 
555f : 91 15 __ STA (P8),y ; (out_sx + 0)
5561 : a5 1c __ LDA ACCU + 1 
5563 : 69 00 __ ADC #$00
5565 : c8 __ __ INY
5566 : 91 15 __ STA (P8),y ; (out_sx + 0)
5568 : a5 45 __ LDA T1 + 0 
556a : 85 1b __ STA ACCU + 0 
556c : a5 46 __ LDA T1 + 1 
556e : 85 1c __ STA ACCU + 1 
5570 : 20 99 6e JSR $6e99 ; (divs16@proxy + 0)
5573 : a5 1b __ LDA ACCU + 0 
5575 : 85 45 __ STA T1 + 0 
5577 : 0a __ __ ASL
5578 : a8 __ __ TAY
5579 : a5 1c __ LDA ACCU + 1 
557b : 2a __ __ ROL
557c : aa __ __ TAX
557d : 98 __ __ TYA
557e : 18 __ __ CLC
557f : 65 1b __ ADC ACCU + 0 
5581 : a8 __ __ TAY
5582 : 8a __ __ TXA
5583 : 65 1c __ ADC ACCU + 1 
5585 : 85 1b __ STA ACCU + 0 
5587 : 98 __ __ TYA
5588 : 0a __ __ ASL
5589 : 26 1b __ ROL ACCU + 0 
558b : 0a __ __ ASL
558c : 26 1b __ ROL ACCU + 0 
558e : 0a __ __ ASL
558f : 26 1b __ ROL ACCU + 0 
5591 : 18 __ __ CLC
5592 : 65 45 __ ADC T1 + 0 
5594 : 85 45 __ STA T1 + 0 
5596 : a5 1b __ LDA ACCU + 0 
5598 : 65 1c __ ADC ACCU + 1 
559a : 06 45 __ ASL T1 + 0 
559c : 2a __ __ ROL
559d : 06 45 __ ASL T1 + 0 
559f : 2a __ __ ROL
55a0 : 06 45 __ ASL T1 + 0 
55a2 : 2a __ __ ROL
55a3 : 85 1c __ STA ACCU + 1 
55a5 : a5 45 __ LDA T1 + 0 
55a7 : 85 1b __ STA ACCU + 0 
55a9 : 20 c5 72 JSR $72c5 ; (divs16@proxy + 0)
55ac : 18 __ __ CLC
55ad : a5 1b __ LDA ACCU + 0 
55af : 69 58 __ ADC #$58
55b1 : a0 00 __ LDY #$00
55b3 : 91 17 __ STA (P10),y ; (out_sy + 0)
55b5 : a5 1c __ LDA ACCU + 1 
55b7 : 69 00 __ ADC #$00
55b9 : c8 __ __ INY
55ba : 91 17 __ STA (P10),y ; (out_sy + 0)
.s3:
55bc : 60 __ __ RTS
--------------------------------------------------------------------
draw_shadow: ; draw_shadow(u8,u8,i16,i16)->void
; 186, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s1:
55bd : a5 53 __ LDA T3 + 0 
55bf : 8d e3 bf STA $bfe3 ; (draw_shadow@stack + 0)
55c2 : a5 54 __ LDA T3 + 1 
55c4 : 8d e4 bf STA $bfe4 ; (draw_shadow@stack + 1)
.s4:
55c7 : ad ec bf LDA $bfec ; (sstack + 2)
55ca : 85 0d __ STA P0 
55cc : ad ed bf LDA $bfed ; (sstack + 3)
55cf : 85 0e __ STA P1 
55d1 : ad ee bf LDA $bfee ; (sstack + 4)
55d4 : 85 11 __ STA P4 
55d6 : a9 d0 __ LDA #$d0
55d8 : 85 0f __ STA P2 
55da : a9 ff __ LDA #$ff
55dc : 85 10 __ STA P3 
55de : ad ef bf LDA $bfef ; (sstack + 5)
55e1 : 85 12 __ STA P5 
55e3 : ad ea bf LDA $bfea ; (sstack + 0)
55e6 : 85 13 __ STA P6 
55e8 : ad eb bf LDA $bfeb ; (sstack + 1)
55eb : 85 14 __ STA P7 
55ed : a9 e8 __ LDA #$e8
55ef : 85 15 __ STA P8 
55f1 : a9 bf __ LDA #$bf
55f3 : 85 18 __ STA P11 
55f5 : a9 bf __ LDA #$bf
55f7 : 85 16 __ STA P9 
55f9 : a9 e6 __ LDA #$e6
55fb : 85 17 __ STA P10 
55fd : 20 e6 53 JSR $53e6 ; (rot_proj.s4 + 0)
5600 : a9 fd __ LDA #$fd
5602 : 85 52 __ STA T4 + 0 
.l5:
5604 : 29 80 __ AND #$80
5606 : 10 02 __ BPL $560a ; (draw_shadow.l5 + 6)
5608 : a9 ff __ LDA #$ff
560a : 85 50 __ STA T0 + 1 
560c : ad e6 bf LDA $bfe6 ; (sy + 0)
560f : 18 __ __ CLC
5610 : 65 52 __ ADC T4 + 0 
5612 : 85 51 __ STA T2 + 0 
5614 : ad e7 bf LDA $bfe7 ; (sy + 1)
5617 : 65 50 __ ADC T0 + 1 
5619 : d0 73 __ BNE $568e ; (draw_shadow.s8 + 0)
.s14:
561b : a5 51 __ LDA T2 + 0 
561d : c9 c8 __ CMP #$c8
561f : b0 6d __ BCS $568e ; (draw_shadow.s8 + 0)
.s6:
5621 : a5 52 __ LDA T4 + 0 
5623 : 85 03 __ STA WORK + 0 
5625 : 85 1b __ STA ACCU + 0 ; (bx + 0)
5627 : a5 50 __ LDA T0 + 1 
5629 : 85 04 __ STA WORK + 1 
562b : 85 1c __ STA ACCU + 1 ; (bx + 1)
562d : 20 57 6e JSR $6e57 ; (mul16 + 0)
5630 : 38 __ __ SEC
5631 : a9 09 __ LDA #$09
5633 : e5 05 __ SBC WORK + 2 
5635 : 85 0d __ STA P0 
5637 : a9 00 __ LDA #$00
5639 : e5 06 __ SBC WORK + 3 
563b : 30 51 __ BMI $568e ; (draw_shadow.s8 + 0)
.s7:
563d : 85 0e __ STA P1 
563f : 20 c2 56 JSR $56c2 ; (mc_isqrt.s4 + 0)
5642 : 06 1b __ ASL ACCU + 0 ; (bx + 0)
5644 : a5 1c __ LDA ACCU + 1 ; (bx + 1)
5646 : 2a __ __ ROL
5647 : 06 1b __ ASL ACCU + 0 ; (bx + 0)
5649 : 2a __ __ ROL
564a : 06 1b __ ASL ACCU + 0 ; (bx + 0)
564c : 2a __ __ ROL
564d : 85 1c __ STA ACCU + 1 ; (bx + 1)
564f : a9 00 __ LDA #$00
5651 : 85 10 __ STA P3 
5653 : 85 04 __ STA WORK + 1 
5655 : a9 03 __ LDA #$03
5657 : 85 03 __ STA WORK + 0 
5659 : 20 9d 6e JSR $6e9d ; (divs16 + 0)
565c : ad e8 bf LDA $bfe8 ; (sx + 0)
565f : 18 __ __ CLC
5660 : 65 1b __ ADC ACCU + 0 ; (bx + 0)
5662 : 85 53 __ STA T3 + 0 
5664 : ad e9 bf LDA $bfe9 ; (sx + 1)
5667 : 65 1c __ ADC ACCU + 1 ; (bx + 1)
5669 : 85 54 __ STA T3 + 1 
566b : ad e8 bf LDA $bfe8 ; (sx + 0)
566e : 38 __ __ SEC
566f : e5 1b __ SBC ACCU + 0 ; (bx + 0)
5671 : 85 4f __ STA T0 + 0 
5673 : ad e9 bf LDA $bfe9 ; (sx + 1)
5676 : e5 1c __ SBC ACCU + 1 ; (bx + 1)
5678 : 85 0e __ STA P1 
.l16:
567a : a5 54 __ LDA T3 + 1 
567c : c5 0e __ CMP P1 
567e : d0 08 __ BNE $5688 ; (draw_shadow.s13 + 0)
.s10:
5680 : a5 53 __ LDA T3 + 0 
5682 : c5 4f __ CMP T0 + 0 
.s11:
5684 : 90 08 __ BCC $568e ; (draw_shadow.s8 + 0)
5686 : b0 1e __ BCS $56a6 ; (draw_shadow.s9 + 0)
.s13:
5688 : 45 0e __ EOR P1 
568a : 10 f8 __ BPL $5684 ; (draw_shadow.s11 + 0)
.s12:
568c : 90 18 __ BCC $56a6 ; (draw_shadow.s9 + 0)
.s8:
568e : e6 52 __ INC T4 + 0 
5690 : a5 52 __ LDA T4 + 0 
5692 : 10 03 __ BPL $5697 ; (draw_shadow.s15 + 0)
5694 : 4c 04 56 JMP $5604 ; (draw_shadow.l5 + 0)
.s15:
5697 : c9 04 __ CMP #$04
5699 : 90 f9 __ BCC $5694 ; (draw_shadow.s8 + 6)
.s3:
569b : ad e3 bf LDA $bfe3 ; (draw_shadow@stack + 0)
569e : 85 53 __ STA T3 + 0 
56a0 : ad e4 bf LDA $bfe4 ; (draw_shadow@stack + 1)
56a3 : 85 54 __ STA T3 + 1 
56a5 : 60 __ __ RTS
.s9:
56a6 : a5 4f __ LDA T0 + 0 
56a8 : 85 0d __ STA P0 
56aa : a5 51 __ LDA T2 + 0 
56ac : 85 0f __ STA P2 
56ae : a9 03 __ LDA #$03
56b0 : 85 11 __ STA P4 
56b2 : 20 28 57 JSR $5728 ; (mc_setpix.s4 + 0)
56b5 : 18 __ __ CLC
56b6 : a5 0d __ LDA P0 
56b8 : 69 02 __ ADC #$02
56ba : 85 4f __ STA T0 + 0 
56bc : 90 bc __ BCC $567a ; (draw_shadow.l16 + 0)
.s17:
56be : e6 0e __ INC P1 
56c0 : b0 b8 __ BCS $567a ; (draw_shadow.l16 + 0)
--------------------------------------------------------------------
mc_isqrt: ; mc_isqrt(u16)->i16
;  32, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
56c2 : a5 0e __ LDA P1 ; (n + 1)
56c4 : 05 0d __ ORA P0 ; (n + 0)
56c6 : d0 05 __ BNE $56cd ; (mc_isqrt.s5 + 0)
.s10:
56c8 : 85 1b __ STA ACCU + 0 
.s3:
56ca : 85 1c __ STA ACCU + 1 
56cc : 60 __ __ RTS
.s5:
56cd : a5 0e __ LDA P1 ; (n + 1)
56cf : 4a __ __ LSR
56d0 : 85 44 __ STA T1 + 1 
56d2 : a5 0d __ LDA P0 ; (n + 0)
56d4 : 6a __ __ ROR
56d5 : 85 43 __ STA T1 + 0 
56d7 : 05 44 __ ORA T1 + 1 
56d9 : d0 06 __ BNE $56e1 ; (mc_isqrt.l6 + 0)
.s9:
56db : a2 01 __ LDX #$01
56dd : 86 1b __ STX ACCU + 0 
56df : d0 e9 __ BNE $56ca ; (mc_isqrt.s3 + 0)
.l6:
56e1 : a5 43 __ LDA T1 + 0 
56e3 : 85 03 __ STA WORK + 0 
56e5 : 85 45 __ STA T2 + 0 
56e7 : a5 44 __ LDA T1 + 1 
56e9 : 85 04 __ STA WORK + 1 
56eb : 85 46 __ STA T2 + 1 
56ed : a5 0d __ LDA P0 ; (n + 0)
56ef : 85 1b __ STA ACCU + 0 
56f1 : a5 0e __ LDA P1 ; (n + 1)
56f3 : 85 1c __ STA ACCU + 1 
56f5 : 20 d4 6e JSR $6ed4 ; (divmod + 0)
56f8 : 18 __ __ CLC
56f9 : a5 1b __ LDA ACCU + 0 
56fb : 65 43 __ ADC T1 + 0 
56fd : 85 43 __ STA T1 + 0 
56ff : a5 1c __ LDA ACCU + 1 
5701 : 65 44 __ ADC T1 + 1 
5703 : 4a __ __ LSR
5704 : 85 44 __ STA T1 + 1 
5706 : 66 43 __ ROR T1 + 0 
5708 : c5 46 __ CMP T2 + 1 
570a : 90 d5 __ BCC $56e1 ; (mc_isqrt.l6 + 0)
.s11:
570c : d0 06 __ BNE $5714 ; (mc_isqrt.s7 + 0)
.s8:
570e : a5 43 __ LDA T1 + 0 
5710 : c5 45 __ CMP T2 + 0 
5712 : 90 cd __ BCC $56e1 ; (mc_isqrt.l6 + 0)
.s7:
5714 : a5 45 __ LDA T2 + 0 
5716 : 85 1b __ STA ACCU + 0 
5718 : a5 46 __ LDA T2 + 1 
571a : b0 ae __ BCS $56ca ; (mc_isqrt.s3 + 0)
--------------------------------------------------------------------
mc_setpix@proxy: ; mc_setpix@proxy
571c : a5 46 __ LDA $46 
571e : 85 0d __ STA P0 
5720 : a5 47 __ LDA $47 
5722 : 85 0e __ STA P1 
5724 : a5 18 __ LDA P11 
5726 : 85 11 __ STA P4 
--------------------------------------------------------------------
mc_setpix: ; mc_setpix(i16,i16,u8)->void
;  47, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5728 : a5 0e __ LDA P1 ; (mx + 1)
572a : d0 5e __ BNE $578a ; (mc_setpix.s3 + 0)
.s9:
572c : a5 0d __ LDA P0 ; (mx + 0)
572e : c9 a0 __ CMP #$a0
5730 : b0 58 __ BCS $578a ; (mc_setpix.s3 + 0)
.s5:
5732 : a5 10 __ LDA P3 ; (my + 1)
5734 : d0 54 __ BNE $578a ; (mc_setpix.s3 + 0)
.s8:
5736 : a5 0f __ LDA P2 ; (my + 0)
5738 : c9 c8 __ CMP #$c8
573a : b0 4e __ BCS $578a ; (mc_setpix.s3 + 0)
.s6:
573c : a5 0d __ LDA P0 ; (mx + 0)
573e : 29 03 __ AND #$03
5740 : 49 03 __ EOR #$03
5742 : 0a __ __ ASL
5743 : 85 1b __ STA ACCU + 0 
5745 : a5 11 __ LDA P4 ; (col + 0)
5747 : a6 1b __ LDX ACCU + 0 
5749 : f0 08 __ BEQ $5753 ; (mc_setpix.s7 + 0)
.l10:
574b : 0a __ __ ASL
574c : ca __ __ DEX
574d : d0 fc __ BNE $574b ; (mc_setpix.l10 + 0)
.s11:
574f : 85 11 __ STA P4 ; (col + 0)
5751 : a6 1b __ LDX ACCU + 0 
.s7:
5753 : a5 0f __ LDA P2 ; (my + 0)
5755 : 29 07 __ AND #$07
5757 : 85 1c __ STA ACCU + 1 
5759 : a5 0f __ LDA P2 ; (my + 0)
575b : 4a __ __ LSR
575c : 4a __ __ LSR
575d : 4a __ __ LSR
575e : 85 1b __ STA ACCU + 0 
5760 : 0a __ __ ASL
5761 : 0a __ __ ASL
5762 : 65 1b __ ADC ACCU + 0 
5764 : 4a __ __ LSR
5765 : 6a __ __ ROR
5766 : a8 __ __ TAY
5767 : 29 80 __ AND #$80
5769 : 6a __ __ ROR
576a : 05 1c __ ORA ACCU + 1 
576c : 85 1b __ STA ACCU + 0 
576e : 98 __ __ TYA
576f : 29 3f __ AND #$3f
5771 : 85 1c __ STA ACCU + 1 
5773 : a5 0d __ LDA P0 ; (mx + 0)
5775 : 29 fc __ AND #$fc
5777 : 0a __ __ ASL
5778 : a8 __ __ TAY
5779 : a5 1c __ LDA ACCU + 1 
577b : 69 e0 __ ADC #$e0
577d : 85 1c __ STA ACCU + 1 
577f : bd 2f 72 LDA $722f,x ; (__shltab3L + 0)
5782 : 49 ff __ EOR #$ff
5784 : 31 1b __ AND (ACCU + 0),y 
5786 : 05 11 __ ORA P4 ; (col + 0)
5788 : 91 1b __ STA (ACCU + 0),y 
.s3:
578a : 60 __ __ RTS
--------------------------------------------------------------------
draw_ball: ; draw_ball(i16,i16,u8)->void
; 232, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s1:
578b : a2 0c __ LDX #$0c
578d : b5 53 __ LDA T3 + 0,x 
578f : 9d dc bf STA $bfdc,x ; (draw_ball@stack + 0)
5792 : ca __ __ DEX
5793 : 10 f8 __ BPL $578d ; (draw_ball.s1 + 2)
.s4:
5795 : ad ec bf LDA $bfec ; (sstack + 2)
5798 : 85 5a __ STA T9 + 0 
579a : 18 __ __ CLC
579b : 69 f3 __ ADC #$f3
579d : 85 5c __ STA T10 + 0 
579f : a9 f3 __ LDA #$f3
57a1 : 85 5e __ STA T11 + 0 
57a3 : a9 ff __ LDA #$ff
57a5 : 85 5f __ STA T11 + 1 
57a7 : ad ed bf LDA $bfed ; (sstack + 3)
57aa : 85 5b __ STA T9 + 1 
57ac : 69 ff __ ADC #$ff
57ae : 85 5d __ STA T10 + 1 
57b0 : f0 03 __ BEQ $57b5 ; (draw_ball.l49 + 0)
57b2 : 4c 2a 59 JMP $592a ; (draw_ball.l20 + 0)
.l49:
57b5 : a5 5c __ LDA T10 + 0 
57b7 : c9 c8 __ CMP #$c8
57b9 : b0 f7 __ BCS $57b2 ; (draw_ball.s4 + 29)
.s6:
57bb : a5 5e __ LDA T11 + 0 
57bd : 85 03 __ STA WORK + 0 
57bf : 85 1b __ STA ACCU + 0 ; (cy + 0)
57c1 : a5 5f __ LDA T11 + 1 
57c3 : 85 04 __ STA WORK + 1 
57c5 : 85 1c __ STA ACCU + 1 ; (cy + 1)
57c7 : 20 57 6e JSR $6e57 ; (mul16 + 0)
57ca : 38 __ __ SEC
57cb : a9 a9 __ LDA #$a9
57cd : e5 05 __ SBC WORK + 2 
57cf : 85 0d __ STA P0 
57d1 : a9 00 __ LDA #$00
57d3 : e5 06 __ SBC WORK + 3 
57d5 : 30 db __ BMI $57b2 ; (draw_ball.s4 + 29)
.s48:
57d7 : 85 0e __ STA P1 
57d9 : 05 0d __ ORA P0 
57db : f0 d5 __ BEQ $57b2 ; (draw_ball.s4 + 29)
.s7:
57dd : 20 c2 56 JSR $56c2 ; (mc_isqrt.s4 + 0)
57e0 : a5 1b __ LDA ACCU + 0 ; (cy + 0)
57e2 : 85 43 __ STA T0 + 0 
57e4 : a5 1c __ LDA ACCU + 1 ; (cy + 1)
57e6 : 85 44 __ STA T0 + 1 
57e8 : a5 5e __ LDA T11 + 0 
57ea : 10 03 __ BPL $57ef ; (draw_ball.s8 + 0)
57ec : 4c 87 5a JMP $5a87 ; (draw_ball.s58 + 0)
.s8:
57ef : c9 05 __ CMP #$05
57f1 : b0 18 __ BCS $580b ; (draw_ball.s9 + 0)
.s44:
57f3 : a9 03 __ LDA #$03
.s11:
57f5 : 85 49 __ STA T12 + 0 
57f7 : ad ea bf LDA $bfea ; (sstack + 0)
57fa : 85 53 __ STA T3 + 0 
57fc : a9 00 __ LDA #$00
57fe : 85 51 __ STA T2 + 0 
5800 : ad eb bf LDA $bfeb ; (sstack + 1)
5803 : 85 54 __ STA T3 + 1 
5805 : ad ee bf LDA $bfee ; (sstack + 4)
5808 : 4c 17 58 JMP $5817 ; (draw_ball.l51 + 0)
.s9:
580b : c9 09 __ CMP #$09
580d : b0 04 __ BCS $5813 ; (draw_ball.s10 + 0)
.s43:
580f : a9 04 __ LDA #$04
5811 : 90 e2 __ BCC $57f5 ; (draw_ball.s11 + 0)
.s10:
5813 : a9 05 __ LDA #$05
5815 : b0 de __ BCS $57f5 ; (draw_ball.s11 + 0)
.l51:
5817 : 85 4f __ STA T1 + 0 
5819 : 18 __ __ CLC
581a : 69 10 __ ADC #$10
581c : 29 3f __ AND #$3f
581e : aa __ __ TAX
581f : bd 86 76 LDA $7686,x ; (sin64[0] + 0)
5822 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5824 : 29 80 __ AND #$80
5826 : 10 02 __ BPL $582a ; (draw_ball.l51 + 19)
5828 : a9 ff __ LDA #$ff
582a : 85 1c __ STA ACCU + 1 ; (cy + 1)
582c : a5 43 __ LDA T0 + 0 
582e : 85 03 __ STA WORK + 0 
5830 : a5 44 __ LDA T0 + 1 
5832 : 85 04 __ STA WORK + 1 
5834 : 20 57 6e JSR $6e57 ; (mul16 + 0)
5837 : 20 b2 72 JSR $72b2 ; (divs16@proxy + 0)
583a : 18 __ __ CLC
583b : a5 1b __ LDA ACCU + 0 ; (cy + 0)
583d : 65 53 __ ADC T3 + 0 
583f : a6 51 __ LDX T2 + 0 
5841 : e8 __ __ INX
5842 : e8 __ __ INX
5843 : 86 51 __ STX T2 + 0 
5845 : 9d 1e 88 STA $881e,x ; (tbuffer[0] + 318)
5848 : a5 1c __ LDA ACCU + 1 ; (cy + 1)
584a : 65 54 __ ADC T3 + 1 
584c : 9d 1f 88 STA $881f,x ; (tbuffer[0] + 319)
584f : 18 __ __ CLC
5850 : a5 4f __ LDA T1 + 0 
5852 : 69 10 __ ADC #$10
5854 : e0 08 __ CPX #$08
5856 : d0 bf __ BNE $5817 ; (draw_ball.l51 + 0)
.s12:
5858 : a9 00 __ LDA #$00
585a : 85 4f __ STA T1 + 0 
.l13:
585c : a4 4f __ LDY T1 + 0 
585e : c8 __ __ INY
585f : 84 55 __ STY T4 + 0 
5861 : 0a __ __ ASL
5862 : 85 57 __ STA T5 + 0 
.l50:
5864 : a5 55 __ LDA T4 + 0 
5866 : 0a __ __ ASL
5867 : 85 59 __ STA T6 + 0 
5869 : aa __ __ TAX
586a : bd 20 88 LDA $8820,x ; (mx[0] + 0)
586d : 85 45 __ STA T7 + 0 
586f : bd 21 88 LDA $8821,x ; (mx[0] + 1)
5872 : 85 46 __ STA T7 + 1 
5874 : a6 57 __ LDX T5 + 0 
5876 : bd 20 88 LDA $8820,x ; (mx[0] + 0)
5879 : 85 47 __ STA T8 + 0 
587b : bd 21 88 LDA $8821,x ; (mx[0] + 1)
587e : 85 48 __ STA T8 + 1 
5880 : a5 46 __ LDA T7 + 1 
5882 : c5 48 __ CMP T8 + 1 
5884 : d0 08 __ BNE $588e ; (draw_ball.s42 + 0)
.s39:
5886 : a5 45 __ LDA T7 + 0 
5888 : c5 47 __ CMP T8 + 0 
.s40:
588a : 90 08 __ BCC $5894 ; (draw_ball.s38 + 0)
588c : b0 1c __ BCS $58aa ; (draw_ball.s14 + 0)
.s42:
588e : 45 48 __ EOR T8 + 1 
5890 : 10 f8 __ BPL $588a ; (draw_ball.s40 + 0)
.s41:
5892 : 90 16 __ BCC $58aa ; (draw_ball.s14 + 0)
.s38:
5894 : a5 45 __ LDA T7 + 0 
5896 : 9d 20 88 STA $8820,x ; (mx[0] + 0)
5899 : a5 46 __ LDA T7 + 1 
589b : 9d 21 88 STA $8821,x ; (mx[0] + 1)
589e : a5 47 __ LDA T8 + 0 
58a0 : a6 59 __ LDX T6 + 0 
58a2 : 9d 20 88 STA $8820,x ; (mx[0] + 0)
58a5 : a5 48 __ LDA T8 + 1 
58a7 : 9d 21 88 STA $8821,x ; (mx[0] + 1)
.s14:
58aa : e6 55 __ INC T4 + 0 
58ac : c8 __ __ INY
58ad : c0 04 __ CPY #$04
58af : 90 b3 __ BCC $5864 ; (draw_ball.l50 + 0)
.s15:
58b1 : e6 4f __ INC T1 + 0 
58b3 : a5 4f __ LDA T1 + 0 
58b5 : c9 03 __ CMP #$03
58b7 : d0 a3 __ BNE $585c ; (draw_ball.l13 + 0)
.s16:
58b9 : a5 53 __ LDA T3 + 0 
58bb : e5 43 __ SBC T0 + 0 
58bd : 85 4f __ STA T1 + 0 
58bf : a5 54 __ LDA T3 + 1 
58c1 : e5 44 __ SBC T0 + 1 
58c3 : 85 50 __ STA T1 + 1 
58c5 : 18 __ __ CLC
58c6 : a5 53 __ LDA T3 + 0 
58c8 : 65 43 __ ADC T0 + 0 
58ca : 85 51 __ STA T2 + 0 
58cc : a5 54 __ LDA T3 + 1 
58ce : 65 44 __ ADC T0 + 1 
58d0 : 85 52 __ STA T2 + 1 
58d2 : a5 49 __ LDA T12 + 0 
58d4 : 85 53 __ STA T3 + 0 
58d6 : a9 00 __ LDA #$00
58d8 : 85 57 __ STA T5 + 0 
58da : 85 55 __ STA T4 + 0 
58dc : 85 13 __ STA P6 
58de : a5 5c __ LDA T10 + 0 
58e0 : 85 12 __ STA P5 
.l17:
58e2 : a5 4f __ LDA T1 + 0 
58e4 : 85 14 __ STA P7 
58e6 : a5 50 __ LDA T1 + 1 
58e8 : 85 15 __ STA P8 
58ea : a5 57 __ LDA T5 + 0 
58ec : c9 04 __ CMP #$04
58ee : b0 0a __ BCS $58fa ; (draw_ball.s18 + 0)
.s37:
58f0 : a4 55 __ LDY T4 + 0 
58f2 : b9 21 88 LDA $8821,y ; (mx[0] + 1)
58f5 : be 20 88 LDX $8820,y ; (mx[0] + 0)
58f8 : 90 04 __ BCC $58fe ; (draw_ball.s19 + 0)
.s18:
58fa : a5 52 __ LDA T2 + 1 
58fc : a6 51 __ LDX T2 + 0 
.s19:
58fe : 86 16 __ STX P9 
5900 : 85 17 __ STA P10 
5902 : 8a __ __ TXA
5903 : 18 __ __ CLC
5904 : 69 01 __ ADC #$01
5906 : 85 4f __ STA T1 + 0 
5908 : a5 17 __ LDA P10 
590a : 69 00 __ ADC #$00
590c : 85 50 __ STA T1 + 1 
590e : a5 53 __ LDA T3 + 0 
5910 : 4a __ __ LSR
5911 : a9 02 __ LDA #$02
5913 : b0 02 __ BCS $5917 ; (draw_ball.s60 + 0)
.s59:
5915 : a9 01 __ LDA #$01
.s60:
5917 : 85 18 __ STA P11 
5919 : 20 9e 5a JSR $5a9e ; (mc_hspan.s4 + 0)
591c : e6 53 __ INC T3 + 0 
591e : e6 55 __ INC T4 + 0 
5920 : e6 55 __ INC T4 + 0 
5922 : e6 57 __ INC T5 + 0 
5924 : a5 57 __ LDA T5 + 0 
5926 : c9 05 __ CMP #$05
5928 : 90 b8 __ BCC $58e2 ; (draw_ball.l17 + 0)
.l20:
592a : e6 5e __ INC T11 + 0 
592c : d0 02 __ BNE $5930 ; (draw_ball.s53 + 0)
.s52:
592e : e6 5f __ INC T11 + 1 
.s53:
5930 : a5 5e __ LDA T11 + 0 
5932 : 30 04 __ BMI $5938 ; (draw_ball.s5 + 0)
.s54:
5934 : c9 0e __ CMP #$0e
5936 : b0 12 __ BCS $594a ; (draw_ball.s21 + 0)
.s5:
5938 : 18 __ __ CLC
5939 : a5 5c __ LDA T10 + 0 
593b : 69 01 __ ADC #$01
593d : 85 5c __ STA T10 + 0 
593f : a5 5d __ LDA T10 + 1 
5941 : 69 00 __ ADC #$00
5943 : 85 5d __ STA T10 + 1 
5945 : d0 e3 __ BNE $592a ; (draw_ball.l20 + 0)
5947 : 4c b5 57 JMP $57b5 ; (draw_ball.l49 + 0)
.s21:
594a : a0 00 __ LDY #$00
.l22:
594c : 84 53 __ STY T3 + 0 
594e : a2 00 __ LDX #$00
5950 : b9 ee 76 LDA $76ee,y ; (lats[0] + 0)
5953 : 10 01 __ BPL $5956 ; (draw_ball.s63 + 0)
.s62:
5955 : ca __ __ DEX
.s63:
5956 : 18 __ __ CLC
5957 : 65 5a __ ADC T9 + 0 
5959 : 85 4f __ STA T1 + 0 
595b : 8a __ __ TXA
595c : 65 5b __ ADC T9 + 1 
595e : d0 57 __ BNE $59b7 ; (draw_ball.s25 + 0)
.s36:
5960 : a5 4f __ LDA T1 + 0 
5962 : c9 c8 __ CMP #$c8
5964 : b0 51 __ BCS $59b7 ; (draw_ball.s25 + 0)
.s23:
5966 : 86 04 __ STX WORK + 1 
5968 : 86 1c __ STX ACCU + 1 ; (cy + 1)
596a : b9 ee 76 LDA $76ee,y ; (lats[0] + 0)
596d : 85 03 __ STA WORK + 0 
596f : 85 1b __ STA ACCU + 0 ; (cy + 0)
5971 : 20 57 6e JSR $6e57 ; (mul16 + 0)
5974 : 38 __ __ SEC
5975 : a9 a9 __ LDA #$a9
5977 : e5 05 __ SBC WORK + 2 
5979 : 85 0d __ STA P0 
597b : a9 00 __ LDA #$00
597d : e5 06 __ SBC WORK + 3 
597f : 30 34 __ BMI $59b5 ; (draw_ball.s64 + 0)
.s35:
5981 : 85 0e __ STA P1 
5983 : 05 0d __ ORA P0 
5985 : f0 2e __ BEQ $59b5 ; (draw_ball.s64 + 0)
.s24:
5987 : 20 c2 56 JSR $56c2 ; (mc_isqrt.s4 + 0)
598a : a5 4f __ LDA T1 + 0 
598c : 85 12 __ STA P5 
598e : a9 00 __ LDA #$00
5990 : 85 13 __ STA P6 
5992 : 85 18 __ STA P11 
5994 : ad ea bf LDA $bfea ; (sstack + 0)
5997 : 18 __ __ CLC
5998 : 65 1b __ ADC ACCU + 0 ; (cy + 0)
599a : 85 16 __ STA P9 
599c : ad eb bf LDA $bfeb ; (sstack + 1)
599f : 65 1c __ ADC ACCU + 1 ; (cy + 1)
59a1 : 85 17 __ STA P10 
59a3 : ad ea bf LDA $bfea ; (sstack + 0)
59a6 : 38 __ __ SEC
59a7 : e5 1b __ SBC ACCU + 0 ; (cy + 0)
59a9 : 85 14 __ STA P7 
59ab : ad eb bf LDA $bfeb ; (sstack + 1)
59ae : e5 1c __ SBC ACCU + 1 ; (cy + 1)
59b0 : 85 15 __ STA P8 
59b2 : 20 9e 5a JSR $5a9e ; (mc_hspan.s4 + 0)
.s64:
59b5 : a4 53 __ LDY T3 + 0 
.s25:
59b7 : c8 __ __ INY
59b8 : c0 05 __ CPY #$05
59ba : 90 90 __ BCC $594c ; (draw_ball.l22 + 0)
.s26:
59bc : ad ee bf LDA $bfee ; (sstack + 4)
59bf : 85 51 __ STA T2 + 0 
59c1 : a9 04 __ LDA #$04
59c3 : 85 59 __ STA T6 + 0 
.l27:
59c5 : 18 __ __ CLC
59c6 : a5 5a __ LDA T9 + 0 
59c8 : 69 f3 __ ADC #$f3
59ca : 85 53 __ STA T3 + 0 
59cc : a5 5b __ LDA T9 + 1 
59ce : 69 ff __ ADC #$ff
59d0 : 85 54 __ STA T3 + 1 
59d2 : 18 __ __ CLC
59d3 : a5 51 __ LDA T2 + 0 
59d5 : 69 10 __ ADC #$10
59d7 : 29 3f __ AND #$3f
59d9 : aa __ __ TAX
59da : bd 86 76 LDA $7686,x ; (sin64[0] + 0)
59dd : 85 55 __ STA T4 + 0 
59df : 29 80 __ AND #$80
59e1 : 10 02 __ BPL $59e5 ; (draw_ball.l27 + 32)
59e3 : a9 ff __ LDA #$ff
59e5 : 85 56 __ STA T4 + 1 
59e7 : a9 f3 __ LDA #$f3
59e9 : 85 57 __ STA T5 + 0 
59eb : a9 ff __ LDA #$ff
59ed : 85 58 __ STA T5 + 1 
59ef : a5 54 __ LDA T3 + 1 
59f1 : d0 5d __ BNE $5a50 ; (draw_ball.l31 + 0)
.l34:
59f3 : a5 53 __ LDA T3 + 0 
59f5 : c9 c8 __ CMP #$c8
59f7 : b0 57 __ BCS $5a50 ; (draw_ball.l31 + 0)
.s29:
59f9 : a5 57 __ LDA T5 + 0 
59fb : 85 03 __ STA WORK + 0 
59fd : 85 1b __ STA ACCU + 0 ; (cy + 0)
59ff : a5 58 __ LDA T5 + 1 
5a01 : 85 04 __ STA WORK + 1 
5a03 : 85 1c __ STA ACCU + 1 ; (cy + 1)
5a05 : 20 57 6e JSR $6e57 ; (mul16 + 0)
5a08 : 38 __ __ SEC
5a09 : a9 a9 __ LDA #$a9
5a0b : e5 05 __ SBC WORK + 2 
5a0d : 85 0d __ STA P0 
5a0f : a9 00 __ LDA #$00
5a11 : e5 06 __ SBC WORK + 3 
5a13 : 30 3b __ BMI $5a50 ; (draw_ball.l31 + 0)
.s33:
5a15 : 85 0e __ STA P1 
5a17 : 05 0d __ ORA P0 
5a19 : f0 35 __ BEQ $5a50 ; (draw_ball.l31 + 0)
.s30:
5a1b : 20 c2 56 JSR $56c2 ; (mc_isqrt.s4 + 0)
5a1e : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5a20 : 85 03 __ STA WORK + 0 
5a22 : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5a24 : 85 04 __ STA WORK + 1 
5a26 : a5 53 __ LDA T3 + 0 
5a28 : 85 0f __ STA P2 
5a2a : a9 00 __ LDA #$00
5a2c : 85 10 __ STA P3 
5a2e : 85 11 __ STA P4 
5a30 : a5 55 __ LDA T4 + 0 
5a32 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5a34 : a5 56 __ LDA T4 + 1 
5a36 : 85 1c __ STA ACCU + 1 ; (cy + 1)
5a38 : 20 57 6e JSR $6e57 ; (mul16 + 0)
5a3b : 20 b2 72 JSR $72b2 ; (divs16@proxy + 0)
5a3e : ad ea bf LDA $bfea ; (sstack + 0)
5a41 : 18 __ __ CLC
5a42 : 65 1b __ ADC ACCU + 0 ; (cy + 0)
5a44 : 85 0d __ STA P0 
5a46 : ad eb bf LDA $bfeb ; (sstack + 1)
5a49 : 65 1c __ ADC ACCU + 1 ; (cy + 1)
5a4b : 85 0e __ STA P1 
5a4d : 20 28 57 JSR $5728 ; (mc_setpix.s4 + 0)
.l31:
5a50 : e6 57 __ INC T5 + 0 
5a52 : d0 02 __ BNE $5a56 ; (draw_ball.s56 + 0)
.s55:
5a54 : e6 58 __ INC T5 + 1 
.s56:
5a56 : a5 57 __ LDA T5 + 0 
5a58 : 30 04 __ BMI $5a5e ; (draw_ball.s28 + 0)
.s57:
5a5a : c9 0e __ CMP #$0e
5a5c : b0 11 __ BCS $5a6f ; (draw_ball.s32 + 0)
.s28:
5a5e : 18 __ __ CLC
5a5f : a5 53 __ LDA T3 + 0 
5a61 : 69 01 __ ADC #$01
5a63 : 85 53 __ STA T3 + 0 
5a65 : a5 54 __ LDA T3 + 1 
5a67 : 69 00 __ ADC #$00
5a69 : 85 54 __ STA T3 + 1 
5a6b : d0 e3 __ BNE $5a50 ; (draw_ball.l31 + 0)
5a6d : f0 84 __ BEQ $59f3 ; (draw_ball.l34 + 0)
.s32:
5a6f : a5 51 __ LDA T2 + 0 
5a71 : 69 0f __ ADC #$0f
5a73 : 85 51 __ STA T2 + 0 
5a75 : c6 59 __ DEC T6 + 0 
5a77 : f0 03 __ BEQ $5a7c ; (draw_ball.s3 + 0)
5a79 : 4c c5 59 JMP $59c5 ; (draw_ball.l27 + 0)
.s3:
5a7c : a2 0c __ LDX #$0c
5a7e : bd dc bf LDA $bfdc,x ; (draw_ball@stack + 0)
5a81 : 95 53 __ STA T3 + 0,x 
5a83 : ca __ __ DEX
5a84 : 10 f8 __ BPL $5a7e ; (draw_ball.s3 + 2)
5a86 : 60 __ __ RTS
.s58:
5a87 : c9 f7 __ CMP #$f7
5a89 : b0 05 __ BCS $5a90 ; (draw_ball.s61 + 0)
.s47:
5a8b : a9 00 __ LDA #$00
5a8d : 4c f5 57 JMP $57f5 ; (draw_ball.s11 + 0)
.s61:
5a90 : c9 fb __ CMP #$fb
5a92 : b0 05 __ BCS $5a99 ; (draw_ball.s45 + 0)
.s46:
5a94 : a9 01 __ LDA #$01
5a96 : 4c f5 57 JMP $57f5 ; (draw_ball.s11 + 0)
.s45:
5a99 : a9 02 __ LDA #$02
5a9b : 4c f5 57 JMP $57f5 ; (draw_ball.s11 + 0)
--------------------------------------------------------------------
mc_hspan: ; mc_hspan(i16,i16,i16,u8)->void
;  58, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5a9e : a5 13 __ LDA P6 ; (my + 1)
5aa0 : f0 01 __ BEQ $5aa3 ; (mc_hspan.s39 + 0)
5aa2 : 60 __ __ RTS
.s39:
5aa3 : a5 12 __ LDA P5 ; (my + 0)
5aa5 : c9 c8 __ CMP #$c8
5aa7 : 90 01 __ BCC $5aaa ; (mc_hspan.s5 + 0)
5aa9 : 60 __ __ RTS
.s5:
5aaa : 24 15 __ BIT P8 ; (x0 + 1)
5aac : 10 08 __ BPL $5ab6 ; (mc_hspan.s49 + 0)
.s38:
5aae : a9 00 __ LDA #$00
5ab0 : 85 14 __ STA P7 ; (x0 + 0)
5ab2 : 85 15 __ STA P8 ; (x0 + 1)
5ab4 : 90 02 __ BCC $5ab8 ; (mc_hspan.s6 + 0)
.s49:
5ab6 : a5 14 __ LDA P7 ; (x0 + 0)
.s6:
5ab8 : 85 46 __ STA T4 + 0 
5aba : a6 15 __ LDX P8 ; (x0 + 1)
5abc : a5 17 __ LDA P10 ; (x1 + 1)
5abe : 10 01 __ BPL $5ac1 ; (mc_hspan.s37 + 0)
5ac0 : 60 __ __ RTS
.s37:
5ac1 : 86 47 __ STX T4 + 1 
5ac3 : d0 09 __ BNE $5ace ; (mc_hspan.s34 + 0)
.s36:
5ac5 : a5 16 __ LDA P9 ; (x1 + 0)
5ac7 : c9 a0 __ CMP #$a0
5ac9 : b0 03 __ BCS $5ace ; (mc_hspan.s34 + 0)
5acb : 4c 36 5c JMP $5c36 ; (mc_hspan.s7 + 0)
.s34:
5ace : a9 9f __ LDA #$9f
5ad0 : 85 16 __ STA P9 ; (x1 + 0)
5ad2 : a9 00 __ LDA #$00
5ad4 : 85 17 __ STA P10 ; (x1 + 1)
5ad6 : 8a __ __ TXA
5ad7 : f0 01 __ BEQ $5ada ; (mc_hspan.s35 + 0)
5ad9 : 60 __ __ RTS
.s35:
5ada : a5 14 __ LDA P7 ; (x0 + 0)
5adc : c9 a0 __ CMP #$a0
5ade : 90 01 __ BCC $5ae1 ; (mc_hspan.s8 + 0)
5ae0 : 60 __ __ RTS
.s8:
5ae1 : a5 16 __ LDA P9 ; (x1 + 0)
5ae3 : 85 4a __ STA T6 + 0 
5ae5 : 85 48 __ STA T5 + 0 
5ae7 : a5 14 __ LDA P7 ; (x0 + 0)
5ae9 : 4a __ __ LSR
5aea : 4a __ __ LSR
5aeb : 85 4c __ STA T7 + 0 
5aed : a5 17 __ LDA P10 ; (x1 + 1)
5aef : 85 49 __ STA T5 + 1 
5af1 : 4a __ __ LSR
5af2 : 66 4a __ ROR T6 + 0 
5af4 : 4a __ __ LSR
5af5 : 66 4a __ ROR T6 + 0 
5af7 : 49 20 __ EOR #$20
5af9 : 38 __ __ SEC
5afa : e9 20 __ SBC #$20
5afc : 85 4b __ STA T6 + 1 
5afe : d0 09 __ BNE $5b09 ; (mc_hspan.s9 + 0)
.s31:
5b00 : a5 4c __ LDA T7 + 0 
5b02 : c5 4a __ CMP T6 + 0 
5b04 : d0 03 __ BNE $5b09 ; (mc_hspan.s9 + 0)
5b06 : 4c 07 5c JMP $5c07 ; (mc_hspan.s26 + 0)
.s9:
5b09 : a5 12 __ LDA P5 ; (my + 0)
5b0b : 85 0f __ STA P2 
5b0d : 29 07 __ AND #$07
5b0f : 85 1b __ STA ACCU + 0 
5b11 : a5 12 __ LDA P5 ; (my + 0)
5b13 : 4a __ __ LSR
5b14 : 4a __ __ LSR
5b15 : 4a __ __ LSR
5b16 : 85 43 __ STA T1 + 0 
5b18 : 0a __ __ ASL
5b19 : 0a __ __ ASL
5b1a : 65 43 __ ADC T1 + 0 
5b1c : 4a __ __ LSR
5b1d : 6a __ __ ROR
5b1e : aa __ __ TAX
5b1f : 29 80 __ AND #$80
5b21 : 6a __ __ ROR
5b22 : 05 1b __ ORA ACCU + 0 
5b24 : 85 4d __ STA T8 + 0 
5b26 : 8a __ __ TXA
5b27 : 29 3f __ AND #$3f
5b29 : 69 e0 __ ADC #$e0
5b2b : 85 4e __ STA T8 + 1 
5b2d : a5 18 __ LDA P11 ; (col + 0)
5b2f : 85 1c __ STA ACCU + 1 
5b31 : 0a __ __ ASL
5b32 : 0a __ __ ASL
5b33 : 05 18 __ ORA P11 ; (col + 0)
5b35 : 85 43 __ STA T1 + 0 
5b37 : a5 18 __ LDA P11 ; (col + 0)
5b39 : 0a __ __ ASL
5b3a : 0a __ __ ASL
5b3b : 0a __ __ ASL
5b3c : 0a __ __ ASL
5b3d : 05 43 __ ORA T1 + 0 
5b3f : 85 43 __ STA T1 + 0 
5b41 : a9 00 __ LDA #$00
5b43 : 85 10 __ STA P3 
5b45 : 46 1c __ LSR ACCU + 1 
5b47 : 6a __ __ ROR
5b48 : 66 1c __ ROR ACCU + 1 
5b4a : 6a __ __ ROR
5b4b : 05 43 __ ORA T1 + 0 
5b4d : 85 45 __ STA T2 + 0 
.l10:
5b4f : 20 1c 57 JSR $571c ; (mc_setpix@proxy + 0)
5b52 : 18 __ __ CLC
5b53 : a5 0d __ LDA P0 
5b55 : 69 01 __ ADC #$01
5b57 : 85 46 __ STA T4 + 0 
5b59 : 85 1b __ STA ACCU + 0 
5b5b : a5 0e __ LDA P1 
5b5d : 69 00 __ ADC #$00
5b5f : 85 47 __ STA T4 + 1 
5b61 : 4a __ __ LSR
5b62 : 66 1b __ ROR ACCU + 0 
5b64 : 4a __ __ LSR
5b65 : 66 1b __ ROR ACCU + 0 
5b67 : 49 20 __ EOR #$20
5b69 : c9 20 __ CMP #$20
5b6b : d0 06 __ BNE $5b73 ; (mc_hspan.s11 + 0)
.s25:
5b6d : a5 1b __ LDA ACCU + 0 
5b6f : c5 4c __ CMP T7 + 0 
5b71 : f0 dc __ BEQ $5b4f ; (mc_hspan.l10 + 0)
.s11:
5b73 : a9 00 __ LDA #$00
5b75 : 85 1c __ STA ACCU + 1 
5b77 : a6 4c __ LDX T7 + 0 
5b79 : e8 __ __ INX
5b7a : a5 4b __ LDA T6 + 1 
5b7c : 30 43 __ BMI $5bc1 ; (mc_hspan.s12 + 0)
.s24:
5b7e : f0 04 __ BEQ $5b84 ; (mc_hspan.s23 + 0)
.s40:
5b80 : 8a __ __ TXA
5b81 : 4c 89 5b JMP $5b89 ; (mc_hspan.s19 + 0)
.s23:
5b84 : 8a __ __ TXA
5b85 : e4 4a __ CPX T6 + 0 
5b87 : b0 38 __ BCS $5bc1 ; (mc_hspan.s12 + 0)
.s19:
5b89 : 0a __ __ ASL
5b8a : 0a __ __ ASL
5b8b : 0a __ __ ASL
5b8c : a0 00 __ LDY #$00
5b8e : 90 02 __ BCC $5b92 ; (mc_hspan.s42 + 0)
.s41:
5b90 : c8 __ __ INY
5b91 : 18 __ __ CLC
.s42:
5b92 : 65 4d __ ADC T8 + 0 
5b94 : 85 43 __ STA T1 + 0 
5b96 : 98 __ __ TYA
5b97 : 65 4e __ ADC T8 + 1 
5b99 : 85 44 __ STA T1 + 1 
.l20:
5b9b : a5 45 __ LDA T2 + 0 
5b9d : a0 00 __ LDY #$00
5b9f : 91 43 __ STA (T1 + 0),y 
5ba1 : 24 4b __ BIT T6 + 1 
5ba3 : 30 1c __ BMI $5bc1 ; (mc_hspan.s12 + 0)
.s22:
5ba5 : e8 __ __ INX
5ba6 : d0 02 __ BNE $5baa ; (mc_hspan.s44 + 0)
.s43:
5ba8 : e6 1c __ INC ACCU + 1 
.s44:
5baa : 18 __ __ CLC
5bab : a5 43 __ LDA T1 + 0 
5bad : 69 08 __ ADC #$08
5baf : 85 43 __ STA T1 + 0 
5bb1 : 90 02 __ BCC $5bb5 ; (mc_hspan.s46 + 0)
.s45:
5bb3 : e6 44 __ INC T1 + 1 
.s46:
5bb5 : a5 1c __ LDA ACCU + 1 
5bb7 : c5 4b __ CMP T6 + 1 
5bb9 : 90 e0 __ BCC $5b9b ; (mc_hspan.l20 + 0)
.s48:
5bbb : d0 04 __ BNE $5bc1 ; (mc_hspan.s12 + 0)
.s21:
5bbd : e4 4a __ CPX T6 + 0 
5bbf : 90 da __ BCC $5b9b ; (mc_hspan.l20 + 0)
.s12:
5bc1 : 06 4a __ ASL T6 + 0 
5bc3 : 26 4b __ ROL T6 + 1 
5bc5 : 06 4a __ ASL T6 + 0 
5bc7 : 26 4b __ ROL T6 + 1 
5bc9 : a9 00 __ LDA #$00
5bcb : 85 10 __ STA P3 
5bcd : f0 20 __ BEQ $5bef ; (mc_hspan.l13 + 0)
.s14:
5bcf : a5 4a __ LDA T6 + 0 
5bd1 : 85 0d __ STA P0 
5bd3 : a5 4b __ LDA T6 + 1 
5bd5 : 85 0e __ STA P1 
5bd7 : a5 12 __ LDA P5 ; (my + 0)
5bd9 : 85 0f __ STA P2 
5bdb : a5 18 __ LDA P11 ; (col + 0)
5bdd : 85 11 __ STA P4 
5bdf : 20 28 57 JSR $5728 ; (mc_setpix.s4 + 0)
5be2 : 18 __ __ CLC
5be3 : a5 0d __ LDA P0 
5be5 : 69 01 __ ADC #$01
5be7 : 85 4a __ STA T6 + 0 
5be9 : a5 0e __ LDA P1 
5beb : 69 00 __ ADC #$00
5bed : 85 4b __ STA T6 + 1 
.l13:
5bef : a5 49 __ LDA T5 + 1 
5bf1 : c5 4b __ CMP T6 + 1 
5bf3 : d0 07 __ BNE $5bfc ; (mc_hspan.s18 + 0)
.s15:
5bf5 : a5 48 __ LDA T5 + 0 
5bf7 : c5 4a __ CMP T6 + 0 
5bf9 : 4c 00 5c JMP $5c00 ; (mc_hspan.s16 + 0)
.s18:
5bfc : 45 4b __ EOR T6 + 1 
5bfe : 30 03 __ BMI $5c03 ; (mc_hspan.s17 + 0)
.s16:
5c00 : b0 cd __ BCS $5bcf ; (mc_hspan.s14 + 0)
.s3:
5c02 : 60 __ __ RTS
.s17:
5c03 : b0 fd __ BCS $5c02 ; (mc_hspan.s3 + 0)
5c05 : 90 c8 __ BCC $5bcf ; (mc_hspan.s14 + 0)
.s26:
5c07 : a5 17 __ LDA P10 ; (x1 + 1)
5c09 : c5 15 __ CMP P8 ; (x0 + 1)
5c0b : d0 04 __ BNE $5c11 ; (mc_hspan.l47 + 0)
.s28:
5c0d : a5 48 __ LDA T5 + 0 
5c0f : c5 46 __ CMP T4 + 0 
.l47:
5c11 : 90 ef __ BCC $5c02 ; (mc_hspan.s3 + 0)
.s50:
5c13 : a9 00 __ LDA #$00
5c15 : 85 10 __ STA P3 
5c17 : a5 12 __ LDA P5 ; (my + 0)
5c19 : 85 0f __ STA P2 
.l27:
5c1b : 20 1c 57 JSR $571c ; (mc_setpix@proxy + 0)
5c1e : 18 __ __ CLC
5c1f : a5 0d __ LDA P0 
5c21 : 69 01 __ ADC #$01
5c23 : 85 46 __ STA T4 + 0 
5c25 : a5 0e __ LDA P1 
5c27 : 69 00 __ ADC #$00
5c29 : 85 47 __ STA T4 + 1 
5c2b : a5 49 __ LDA T5 + 1 
5c2d : 30 d3 __ BMI $5c02 ; (mc_hspan.s3 + 0)
.s30:
5c2f : c5 47 __ CMP T4 + 1 
5c31 : f0 da __ BEQ $5c0d ; (mc_hspan.s28 + 0)
.s29:
5c33 : b0 e6 __ BCS $5c1b ; (mc_hspan.l27 + 0)
5c35 : 60 __ __ RTS
.s7:
5c36 : a5 17 __ LDA P10 ; (x1 + 1)
5c38 : c5 15 __ CMP P8 ; (x0 + 1)
5c3a : d0 04 __ BNE $5c40 ; (mc_hspan.s33 + 0)
.s32:
5c3c : a5 16 __ LDA P9 ; (x1 + 0)
5c3e : c5 14 __ CMP P7 ; (x0 + 0)
.s33:
5c40 : 90 c0 __ BCC $5c02 ; (mc_hspan.s3 + 0)
5c42 : 4c e1 5a JMP $5ae1 ; (mc_hspan.s8 + 0)
--------------------------------------------------------------------
draw_cube: ; draw_cube(u8,u8)->void
; 154, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s1:
5c45 : a5 53 __ LDA T3 + 0 
5c47 : 8d d6 bf STA $bfd6 ; (draw_cube@stack + 0)
5c4a : a5 54 __ LDA T7 + 0 
5c4c : 8d d7 bf STA $bfd7 ; (draw_cube@stack + 1)
5c4f : a5 55 __ LDA T8 + 0 
5c51 : 8d d8 bf STA $bfd8 ; (draw_cube@stack + 2)
.s4:
5c54 : a9 00 __ LDA #$00
5c56 : 85 52 __ STA T2 + 0 
5c58 : 85 53 __ STA T3 + 0 
5c5a : ad ec bf LDA $bfec ; (sstack + 2)
5c5d : 85 54 __ STA T7 + 0 
5c5f : 85 13 __ STA P6 
5c61 : ad ed bf LDA $bfed ; (sstack + 3)
5c64 : 85 55 __ STA T8 + 0 
5c66 : 85 14 __ STA P7 
5c68 : a2 00 __ LDX #$00
.l9:
5c6a : 18 __ __ CLC
5c6b : a9 38 __ LDA #$38
5c6d : 65 53 __ ADC T3 + 0 
5c6f : 85 17 __ STA P10 
5c71 : a9 88 __ LDA #$88
5c73 : 69 00 __ ADC #$00
5c75 : 85 18 __ STA P11 
5c77 : 18 __ __ CLC
5c78 : a9 28 __ LDA #$28
5c7a : 65 53 __ ADC T3 + 0 
5c7c : 85 15 __ STA P8 
5c7e : a9 88 __ LDA #$88
5c80 : 69 00 __ ADC #$00
5c82 : 85 16 __ STA P9 
5c84 : bd 62 77 LDA $7762,x ; (cube_v[0][0] + 0)
5c87 : 29 80 __ AND #$80
5c89 : 10 02 __ BPL $5c8d ; (draw_cube.l9 + 35)
5c8b : a9 ff __ LDA #$ff
5c8d : 85 0e __ STA P1 
5c8f : bd 62 77 LDA $7762,x ; (cube_v[0][0] + 0)
5c92 : 0a __ __ ASL
5c93 : 18 __ __ CLC
5c94 : 7d 62 77 ADC $7762,x ; (cube_v[0][0] + 0)
5c97 : 0a __ __ ASL
5c98 : 0a __ __ ASL
5c99 : 0a __ __ ASL
5c9a : 0a __ __ ASL
5c9b : 85 0d __ STA P0 
5c9d : bd 63 77 LDA $7763,x ; (cube_v[0][0] + 1)
5ca0 : 29 80 __ AND #$80
5ca2 : 10 02 __ BPL $5ca6 ; (draw_cube.l9 + 60)
5ca4 : a9 ff __ LDA #$ff
5ca6 : 85 10 __ STA P3 
5ca8 : bd 63 77 LDA $7763,x ; (cube_v[0][0] + 1)
5cab : 0a __ __ ASL
5cac : 18 __ __ CLC
5cad : 7d 63 77 ADC $7763,x ; (cube_v[0][0] + 1)
5cb0 : 0a __ __ ASL
5cb1 : 0a __ __ ASL
5cb2 : 0a __ __ ASL
5cb3 : 0a __ __ ASL
5cb4 : 85 0f __ STA P2 
5cb6 : bd 64 77 LDA $7764,x ; (cube_v[0][0] + 2)
5cb9 : 85 1b __ STA ACCU + 0 ; (ax + 0)
5cbb : 29 80 __ AND #$80
5cbd : 10 02 __ BPL $5cc1 ; (draw_cube.l9 + 87)
5cbf : a9 ff __ LDA #$ff
5cc1 : 85 12 __ STA P5 
5cc3 : a5 1b __ LDA ACCU + 0 ; (ax + 0)
5cc5 : 0a __ __ ASL
5cc6 : 18 __ __ CLC
5cc7 : 65 1b __ ADC ACCU + 0 ; (ax + 0)
5cc9 : 0a __ __ ASL
5cca : 0a __ __ ASL
5ccb : 0a __ __ ASL
5ccc : 0a __ __ ASL
5ccd : 85 11 __ STA P4 
5ccf : 20 e6 53 JSR $53e6 ; (rot_proj.s4 + 0)
5cd2 : e6 53 __ INC T3 + 0 
5cd4 : e6 53 __ INC T3 + 0 
5cd6 : 18 __ __ CLC
5cd7 : a5 52 __ LDA T2 + 0 
5cd9 : 69 03 __ ADC #$03
5cdb : 85 52 __ STA T2 + 0 
5cdd : aa __ __ TAX
5cde : c9 18 __ CMP #$18
5ce0 : d0 88 __ BNE $5c6a ; (draw_cube.l9 + 0)
.s5:
5ce2 : a9 00 __ LDA #$00
.l6:
5ce4 : 85 53 __ STA T3 + 0 
5ce6 : a8 __ __ TAY
5ce7 : b9 7a 77 LDA $777a,y ; (cube_e[0][0] + 0)
5cea : 0a __ __ ASL
5ceb : aa __ __ TAX
5cec : bd 28 88 LDA $8828,x ; (vsx[0] + 0)
5cef : 85 12 __ STA P5 
5cf1 : bd 29 88 LDA $8829,x ; (vsx[0] + 1)
5cf4 : 85 13 __ STA P6 
5cf6 : bd 38 88 LDA $8838,x ; (vsy[0] + 0)
5cf9 : 85 14 __ STA P7 
5cfb : bd 39 88 LDA $8839,x ; (vsy[0] + 1)
5cfe : 85 15 __ STA P8 
5d00 : b9 7b 77 LDA $777b,y ; (cube_e[0][0] + 1)
5d03 : 0a __ __ ASL
5d04 : aa __ __ TAX
5d05 : bd 28 88 LDA $8828,x ; (vsx[0] + 0)
5d08 : 85 16 __ STA P9 
5d0a : bd 29 88 LDA $8829,x ; (vsx[0] + 1)
5d0d : 85 17 __ STA P10 
5d0f : bd 38 88 LDA $8838,x ; (vsy[0] + 0)
5d12 : 8d ea bf STA $bfea ; (sstack + 0)
5d15 : bd 39 88 LDA $8839,x ; (vsy[0] + 1)
5d18 : 8d eb bf STA $bfeb ; (sstack + 1)
5d1b : 20 1d 5e JSR $5e1d ; (mc_line.s4 + 0)
5d1e : 18 __ __ CLC
5d1f : a5 53 __ LDA T3 + 0 
5d21 : 69 02 __ ADC #$02
5d23 : c9 18 __ CMP #$18
5d25 : d0 bd __ BNE $5ce4 ; (draw_cube.l6 + 0)
.s7:
5d27 : a9 00 __ LDA #$00
.l8:
5d29 : 85 51 __ STA T1 + 0 
5d2b : aa __ __ TAX
5d2c : a5 54 __ LDA T7 + 0 
5d2e : 85 13 __ STA P6 
5d30 : a5 55 __ LDA T8 + 0 
5d32 : 85 14 __ STA P7 
5d34 : a9 e8 __ LDA #$e8
5d36 : 85 15 __ STA P8 
5d38 : a9 bf __ LDA #$bf
5d3a : 85 16 __ STA P9 
5d3c : a9 e6 __ LDA #$e6
5d3e : 85 17 __ STA P10 
5d40 : a9 bf __ LDA #$bf
5d42 : 85 18 __ STA P11 
5d44 : bd 92 77 LDA $7792,x ; (grid_lines[0][0] + 0)
5d47 : 29 80 __ AND #$80
5d49 : 10 02 __ BPL $5d4d ; (draw_cube.l8 + 36)
5d4b : a9 ff __ LDA #$ff
5d4d : 85 0e __ STA P1 
5d4f : bd 92 77 LDA $7792,x ; (grid_lines[0][0] + 0)
5d52 : 0a __ __ ASL
5d53 : 0a __ __ ASL
5d54 : 0a __ __ ASL
5d55 : 0a __ __ ASL
5d56 : 85 0d __ STA P0 
5d58 : bd 93 77 LDA $7793,x ; (grid_lines[0][0] + 1)
5d5b : 29 80 __ AND #$80
5d5d : 10 02 __ BPL $5d61 ; (draw_cube.l8 + 56)
5d5f : a9 ff __ LDA #$ff
5d61 : 85 10 __ STA P3 
5d63 : bd 93 77 LDA $7793,x ; (grid_lines[0][0] + 1)
5d66 : 0a __ __ ASL
5d67 : 0a __ __ ASL
5d68 : 0a __ __ ASL
5d69 : 0a __ __ ASL
5d6a : 85 0f __ STA P2 
5d6c : bd 94 77 LDA $7794,x ; (grid_lines[0][0] + 2)
5d6f : 29 80 __ AND #$80
5d71 : 10 02 __ BPL $5d75 ; (draw_cube.l8 + 76)
5d73 : a9 ff __ LDA #$ff
5d75 : 85 12 __ STA P5 
5d77 : bd 94 77 LDA $7794,x ; (grid_lines[0][0] + 2)
5d7a : 0a __ __ ASL
5d7b : 0a __ __ ASL
5d7c : 0a __ __ ASL
5d7d : 0a __ __ ASL
5d7e : 85 11 __ STA P4 
5d80 : 20 e6 53 JSR $53e6 ; (rot_proj.s4 + 0)
5d83 : a9 e4 __ LDA #$e4
5d85 : 85 15 __ STA P8 
5d87 : a9 bf __ LDA #$bf
5d89 : 85 16 __ STA P9 
5d8b : a9 e2 __ LDA #$e2
5d8d : 85 17 __ STA P10 
5d8f : a9 bf __ LDA #$bf
5d91 : 85 18 __ STA P11 
5d93 : a6 51 __ LDX T1 + 0 
5d95 : bd 95 77 LDA $7795,x ; (grid_lines[0][0] + 3)
5d98 : 29 80 __ AND #$80
5d9a : 10 02 __ BPL $5d9e ; (draw_cube.l8 + 117)
5d9c : a9 ff __ LDA #$ff
5d9e : 85 0e __ STA P1 
5da0 : bd 95 77 LDA $7795,x ; (grid_lines[0][0] + 3)
5da3 : 0a __ __ ASL
5da4 : 0a __ __ ASL
5da5 : 0a __ __ ASL
5da6 : 0a __ __ ASL
5da7 : 85 0d __ STA P0 
5da9 : bd 96 77 LDA $7796,x ; (grid_lines[0][0] + 4)
5dac : 29 80 __ AND #$80
5dae : 10 02 __ BPL $5db2 ; (draw_cube.l8 + 137)
5db0 : a9 ff __ LDA #$ff
5db2 : 85 10 __ STA P3 
5db4 : bd 96 77 LDA $7796,x ; (grid_lines[0][0] + 4)
5db7 : 0a __ __ ASL
5db8 : 0a __ __ ASL
5db9 : 0a __ __ ASL
5dba : 0a __ __ ASL
5dbb : 85 0f __ STA P2 
5dbd : bd 97 77 LDA $7797,x ; (grid_lines[0][0] + 5)
5dc0 : 29 80 __ AND #$80
5dc2 : 10 02 __ BPL $5dc6 ; (draw_cube.l8 + 157)
5dc4 : a9 ff __ LDA #$ff
5dc6 : 85 12 __ STA P5 
5dc8 : bd 97 77 LDA $7797,x ; (grid_lines[0][0] + 5)
5dcb : 0a __ __ ASL
5dcc : 0a __ __ ASL
5dcd : 0a __ __ ASL
5dce : 0a __ __ ASL
5dcf : 85 11 __ STA P4 
5dd1 : 20 e6 53 JSR $53e6 ; (rot_proj.s4 + 0)
5dd4 : ad e8 bf LDA $bfe8 ; (sx1 + 0)
5dd7 : 85 12 __ STA P5 
5dd9 : ad e9 bf LDA $bfe9 ; (sx1 + 1)
5ddc : 85 13 __ STA P6 
5dde : ad e6 bf LDA $bfe6 ; (sy1 + 0)
5de1 : 85 14 __ STA P7 
5de3 : ad e7 bf LDA $bfe7 ; (sy1 + 1)
5de6 : 85 15 __ STA P8 
5de8 : ad e4 bf LDA $bfe4 ; (sx2 + 0)
5deb : 85 16 __ STA P9 
5ded : ad e5 bf LDA $bfe5 ; (sx2 + 1)
5df0 : 85 17 __ STA P10 
5df2 : ad e2 bf LDA $bfe2 ; (sy2 + 0)
5df5 : 8d ea bf STA $bfea ; (sstack + 0)
5df8 : ad e3 bf LDA $bfe3 ; (sy2 + 1)
5dfb : 8d eb bf STA $bfeb ; (sstack + 1)
5dfe : 20 1d 5e JSR $5e1d ; (mc_line.s4 + 0)
5e01 : 18 __ __ CLC
5e02 : a5 51 __ LDA T1 + 0 
5e04 : 69 06 __ ADC #$06
5e06 : c9 48 __ CMP #$48
5e08 : f0 03 __ BEQ $5e0d ; (draw_cube.s3 + 0)
5e0a : 4c 29 5d JMP $5d29 ; (draw_cube.l8 + 0)
.s3:
5e0d : ad d6 bf LDA $bfd6 ; (draw_cube@stack + 0)
5e10 : 85 53 __ STA T3 + 0 
5e12 : ad d7 bf LDA $bfd7 ; (draw_cube@stack + 1)
5e15 : 85 54 __ STA T7 + 0 
5e17 : ad d8 bf LDA $bfd8 ; (draw_cube@stack + 2)
5e1a : 85 55 __ STA T8 + 0 
5e1c : 60 __ __ RTS
--------------------------------------------------------------------
mc_line: ; mc_line(i16,i16,i16,i16,u8)->void
;  82, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5e1d : 38 __ __ SEC
5e1e : a5 16 __ LDA P9 ; (x1 + 0)
5e20 : e5 12 __ SBC P5 ; (x0 + 0)
5e22 : 85 43 __ STA T3 + 0 
5e24 : a5 17 __ LDA P10 ; (x1 + 1)
5e26 : e5 13 __ SBC P6 ; (x0 + 1)
5e28 : 85 44 __ STA T3 + 1 
5e2a : 10 0d __ BPL $5e39 ; (mc_line.s5 + 0)
.s37:
5e2c : 38 __ __ SEC
5e2d : a9 00 __ LDA #$00
5e2f : e5 43 __ SBC T3 + 0 
5e31 : 85 43 __ STA T3 + 0 
5e33 : a9 00 __ LDA #$00
5e35 : e5 44 __ SBC T3 + 1 
5e37 : 85 44 __ STA T3 + 1 
.s5:
5e39 : ad ea bf LDA $bfea ; (sstack + 0)
5e3c : 85 45 __ STA T4 + 0 
5e3e : 38 __ __ SEC
5e3f : e5 14 __ SBC P7 ; (y0 + 0)
5e41 : 85 47 __ STA T5 + 0 
5e43 : ad eb bf LDA $bfeb ; (sstack + 1)
5e46 : 85 46 __ STA T4 + 1 
5e48 : e5 15 __ SBC P8 ; (y0 + 1)
5e4a : 85 48 __ STA T5 + 1 
5e4c : 10 0d __ BPL $5e5b ; (mc_line.s6 + 0)
.s36:
5e4e : 38 __ __ SEC
5e4f : a9 00 __ LDA #$00
5e51 : e5 47 __ SBC T5 + 0 
5e53 : 85 47 __ STA T5 + 0 
5e55 : a9 00 __ LDA #$00
5e57 : e5 48 __ SBC T5 + 1 
5e59 : 85 48 __ STA T5 + 1 
.s6:
5e5b : a5 13 __ LDA P6 ; (x0 + 1)
5e5d : c5 17 __ CMP P10 ; (x1 + 1)
5e5f : d0 08 __ BNE $5e69 ; (mc_line.s35 + 0)
.s32:
5e61 : a5 12 __ LDA P5 ; (x0 + 0)
5e63 : c5 16 __ CMP P9 ; (x1 + 0)
.s33:
5e65 : 90 08 __ BCC $5e6f ; (mc_line.s31 + 0)
5e67 : b0 0e __ BCS $5e77 ; (mc_line.s7 + 0)
.s35:
5e69 : 45 17 __ EOR P10 ; (x1 + 1)
5e6b : 10 f8 __ BPL $5e65 ; (mc_line.s33 + 0)
.s34:
5e6d : 90 08 __ BCC $5e77 ; (mc_line.s7 + 0)
.s31:
5e6f : a9 01 __ LDA #$01
5e71 : 85 49 __ STA T6 + 0 
5e73 : a9 00 __ LDA #$00
5e75 : f0 04 __ BEQ $5e7b ; (mc_line.s8 + 0)
.s7:
5e77 : a9 ff __ LDA #$ff
5e79 : 85 49 __ STA T6 + 0 
.s8:
5e7b : 85 4a __ STA T6 + 1 
5e7d : a5 15 __ LDA P8 ; (y0 + 1)
5e7f : c5 46 __ CMP T4 + 1 
5e81 : d0 08 __ BNE $5e8b ; (mc_line.s30 + 0)
.s27:
5e83 : a5 14 __ LDA P7 ; (y0 + 0)
5e85 : c5 45 __ CMP T4 + 0 
.s28:
5e87 : 90 08 __ BCC $5e91 ; (mc_line.s26 + 0)
5e89 : b0 0e __ BCS $5e99 ; (mc_line.s9 + 0)
.s30:
5e8b : 45 46 __ EOR T4 + 1 
5e8d : 10 f8 __ BPL $5e87 ; (mc_line.s28 + 0)
.s29:
5e8f : 90 08 __ BCC $5e99 ; (mc_line.s9 + 0)
.s26:
5e91 : a9 01 __ LDA #$01
5e93 : 85 4b __ STA T7 + 0 
5e95 : a9 00 __ LDA #$00
5e97 : f0 04 __ BEQ $5e9d ; (mc_line.s10 + 0)
.s9:
5e99 : a9 ff __ LDA #$ff
5e9b : 85 4b __ STA T7 + 0 
.s10:
5e9d : 85 4c __ STA T7 + 1 
5e9f : 38 __ __ SEC
5ea0 : a5 43 __ LDA T3 + 0 
5ea2 : e5 47 __ SBC T5 + 0 
5ea4 : 85 4d __ STA T8 + 0 
5ea6 : a5 44 __ LDA T3 + 1 
5ea8 : e5 48 __ SBC T5 + 1 
5eaa : 85 4e __ STA T8 + 1 
5eac : 38 __ __ SEC
5ead : a9 00 __ LDA #$00
5eaf : e5 47 __ SBC T5 + 0 
5eb1 : 85 4f __ STA T9 + 0 
5eb3 : a9 00 __ LDA #$00
5eb5 : e5 48 __ SBC T5 + 1 
5eb7 : 85 50 __ STA T9 + 1 
.l11:
5eb9 : a5 12 __ LDA P5 ; (x0 + 0)
5ebb : 85 0d __ STA P0 
5ebd : a9 01 __ LDA #$01
5ebf : 85 11 __ STA P4 
5ec1 : a5 13 __ LDA P6 ; (x0 + 1)
5ec3 : 85 0e __ STA P1 
5ec5 : a5 14 __ LDA P7 ; (y0 + 0)
5ec7 : 85 0f __ STA P2 
5ec9 : a5 15 __ LDA P8 ; (y0 + 1)
5ecb : 85 10 __ STA P3 
5ecd : 20 28 57 JSR $5728 ; (mc_setpix.s4 + 0)
5ed0 : a5 13 __ LDA P6 ; (x0 + 1)
5ed2 : c5 17 __ CMP P10 ; (x1 + 1)
5ed4 : d0 12 __ BNE $5ee8 ; (mc_line.s12 + 0)
.s25:
5ed6 : a5 12 __ LDA P5 ; (x0 + 0)
5ed8 : c5 16 __ CMP P9 ; (x1 + 0)
5eda : d0 0c __ BNE $5ee8 ; (mc_line.s12 + 0)
.s23:
5edc : a5 15 __ LDA P8 ; (y0 + 1)
5ede : c5 46 __ CMP T4 + 1 
5ee0 : d0 06 __ BNE $5ee8 ; (mc_line.s12 + 0)
.s24:
5ee2 : a5 14 __ LDA P7 ; (y0 + 0)
5ee4 : c5 45 __ CMP T4 + 0 
5ee6 : f0 63 __ BEQ $5f4b ; (mc_line.s3 + 0)
.s12:
5ee8 : a5 4d __ LDA T8 + 0 
5eea : 0a __ __ ASL
5eeb : 85 1b __ STA ACCU + 0 
5eed : a5 4e __ LDA T8 + 1 
5eef : 2a __ __ ROL
5ef0 : 85 1c __ STA ACCU + 1 
5ef2 : a5 50 __ LDA T9 + 1 
5ef4 : c5 1c __ CMP ACCU + 1 
5ef6 : d0 08 __ BNE $5f00 ; (mc_line.s22 + 0)
.s19:
5ef8 : a5 4f __ LDA T9 + 0 
5efa : c5 1b __ CMP ACCU + 0 
.s20:
5efc : 90 08 __ BCC $5f06 ; (mc_line.s18 + 0)
5efe : b0 20 __ BCS $5f20 ; (mc_line.s13 + 0)
.s22:
5f00 : 45 1c __ EOR ACCU + 1 
5f02 : 10 f8 __ BPL $5efc ; (mc_line.s20 + 0)
.s21:
5f04 : 90 1a __ BCC $5f20 ; (mc_line.s13 + 0)
.s18:
5f06 : 18 __ __ CLC
5f07 : a5 12 __ LDA P5 ; (x0 + 0)
5f09 : 65 49 __ ADC T6 + 0 
5f0b : 85 12 __ STA P5 ; (x0 + 0)
5f0d : a5 13 __ LDA P6 ; (x0 + 1)
5f0f : 65 4a __ ADC T6 + 1 
5f11 : 85 13 __ STA P6 ; (x0 + 1)
5f13 : 38 __ __ SEC
5f14 : a5 4d __ LDA T8 + 0 
5f16 : e5 47 __ SBC T5 + 0 
5f18 : 85 4d __ STA T8 + 0 
5f1a : a5 4e __ LDA T8 + 1 
5f1c : e5 48 __ SBC T5 + 1 
5f1e : 85 4e __ STA T8 + 1 
.s13:
5f20 : a5 1c __ LDA ACCU + 1 
5f22 : 30 0a __ BMI $5f2e ; (mc_line.s14 + 0)
.s17:
5f24 : c5 44 __ CMP T3 + 1 
5f26 : d0 04 __ BNE $5f2c ; (mc_line.s16 + 0)
.s15:
5f28 : a5 1b __ LDA ACCU + 0 
5f2a : c5 43 __ CMP T3 + 0 
.s16:
5f2c : b0 8b __ BCS $5eb9 ; (mc_line.l11 + 0)
.s14:
5f2e : 18 __ __ CLC
5f2f : a5 14 __ LDA P7 ; (y0 + 0)
5f31 : 65 4b __ ADC T7 + 0 
5f33 : 85 14 __ STA P7 ; (y0 + 0)
5f35 : a5 15 __ LDA P8 ; (y0 + 1)
5f37 : 65 4c __ ADC T7 + 1 
5f39 : 85 15 __ STA P8 ; (y0 + 1)
5f3b : 18 __ __ CLC
5f3c : a5 4d __ LDA T8 + 0 
5f3e : 65 43 __ ADC T3 + 0 
5f40 : 85 4d __ STA T8 + 0 
5f42 : a5 4e __ LDA T8 + 1 
5f44 : 65 44 __ ADC T3 + 1 
5f46 : 85 4e __ STA T8 + 1 
5f48 : 4c b9 5e JMP $5eb9 ; (mc_line.l11 + 0)
.s3:
5f4b : 60 __ __ RTS
--------------------------------------------------------------------
vectors_run: ; vectors_run()->void
;   3, "/home/xahmol/git/UltimateDemo2026/src/vectors.h"
.s1:
5f4c : a2 04 __ LDX #$04
5f4e : b5 53 __ LDA T3 + 0,x 
5f50 : 9d c6 bf STA $bfc6,x ; (vectors_run@stack + 0)
5f53 : ca __ __ DEX
5f54 : 10 f8 __ BPL $5f4e ; (vectors_run.s1 + 2)
.s4:
5f56 : 20 1f 60 JSR $601f ; (vec_init.s4 + 0)
5f59 : a9 00 __ LDA #$00
5f5b : 85 53 __ STA T3 + 0 
5f5d : 85 54 __ STA T4 + 0 
5f5f : a9 a8 __ LDA #$a8
5f61 : 85 55 __ STA T5 + 0 
5f63 : a9 fd __ LDA #$fd
5f65 : 85 56 __ STA T5 + 1 
.l5:
5f67 : 2c 11 d0 BIT $d011 
5f6a : 30 fb __ BMI $5f67 ; (vectors_run.l5 + 0)
.l6:
5f6c : 2c 11 d0 BIT $d011 
5f6f : 10 fb __ BPL $5f6c ; (vectors_run.l6 + 0)
.s7:
5f71 : a9 00 __ LDA #$00
5f73 : 85 57 __ STA T6 + 0 
5f75 : 85 0f __ STA P2 
5f77 : 85 10 __ STA P3 
5f79 : 85 0d __ STA P0 
5f7b : 20 91 72 JSR $7291 ; (memset@proxy + 0)
5f7e : e6 53 __ INC T3 + 0 
5f80 : a5 53 __ LDA T3 + 0 
5f82 : 85 0d __ STA P0 
5f84 : a6 54 __ LDX T4 + 0 
5f86 : e8 __ __ INX
5f87 : e8 __ __ INX
5f88 : 86 54 __ STX T4 + 0 
5f8a : 86 0e __ STX P1 
5f8c : 20 8c 60 JSR $608c ; (project.s1 + 0)
.l8:
5f8f : a9 48 __ LDA #$48
5f91 : 8d ea bf STA $bfea ; (sstack + 0)
5f94 : a9 88 __ LDA #$88
5f96 : 8d eb bf STA $bfeb ; (sstack + 1)
5f99 : a9 f3 __ LDA #$f3
5f9b : 8d ec bf STA $bfec ; (sstack + 2)
5f9e : a9 76 __ LDA #$76
5fa0 : 8d ed bf STA $bfed ; (sstack + 3)
5fa3 : a9 00 __ LDA #$00
5fa5 : 8d f6 bf STA $bff6 ; (sstack + 12)
5fa8 : a4 57 __ LDY T6 + 0 
5faa : b9 7a 77 LDA $777a,y ; (cube_e[0][0] + 0)
5fad : 0a __ __ ASL
5fae : aa __ __ TAX
5faf : bd 60 88 LDA $8860,x ; (px_cur[0] + 0)
5fb2 : 8d ee bf STA $bfee ; (sstack + 4)
5fb5 : bd 61 88 LDA $8861,x ; (px_cur[0] + 1)
5fb8 : 8d ef bf STA $bfef ; (sstack + 5)
5fbb : bd 50 88 LDA $8850,x ; (py_cur[0] + 0)
5fbe : 8d f0 bf STA $bff0 ; (sstack + 6)
5fc1 : bd 51 88 LDA $8851,x ; (py_cur[0] + 1)
5fc4 : 8d f1 bf STA $bff1 ; (sstack + 7)
5fc7 : b9 7b 77 LDA $777b,y ; (cube_e[0][0] + 1)
5fca : 0a __ __ ASL
5fcb : aa __ __ TAX
5fcc : bd 60 88 LDA $8860,x ; (px_cur[0] + 0)
5fcf : 8d f2 bf STA $bff2 ; (sstack + 8)
5fd2 : bd 61 88 LDA $8861,x ; (px_cur[0] + 1)
5fd5 : 8d f3 bf STA $bff3 ; (sstack + 9)
5fd8 : bd 50 88 LDA $8850,x ; (py_cur[0] + 0)
5fdb : 8d f4 bf STA $bff4 ; (sstack + 10)
5fde : bd 51 88 LDA $8851,x ; (py_cur[0] + 1)
5fe1 : 8d f5 bf STA $bff5 ; (sstack + 11)
5fe4 : 20 8f 34 JSR $348f ; (bm_line.s1 + 0)
5fe7 : 18 __ __ CLC
5fe8 : a5 57 __ LDA T6 + 0 
5fea : 69 02 __ ADC #$02
5fec : 85 57 __ STA T6 + 0 
5fee : c9 18 __ CMP #$18
5ff0 : d0 9d __ BNE $5f8f ; (vectors_run.l8 + 0)
.s9:
5ff2 : e6 55 __ INC T5 + 0 
5ff4 : f0 03 __ BEQ $5ff9 ; (vectors_run.s11 + 0)
5ff6 : 4c 67 5f JMP $5f67 ; (vectors_run.l5 + 0)
.s11:
5ff9 : e6 56 __ INC T5 + 1 
5ffb : d0 f9 __ BNE $5ff6 ; (vectors_run.s9 + 4)
.s10:
5ffd : a9 00 __ LDA #$00
5fff : 85 0d __ STA P0 
6001 : 85 0e __ STA P1 
6003 : 85 10 __ STA P3 
6005 : a9 36 __ LDA #$36
6007 : 85 01 __ STA $01 
6009 : 20 0b 0f JSR $0f0b ; (vic_setmode@proxy + 0)
600c : a9 00 __ LDA #$00
600e : 8d 20 d0 STA $d020 
6011 : 8d 21 d0 STA $d021 
.s3:
6014 : a2 04 __ LDX #$04
6016 : bd c6 bf LDA $bfc6,x ; (vectors_run@stack + 0)
6019 : 95 53 __ STA T3 + 0,x 
601b : ca __ __ DEX
601c : 10 f8 __ BPL $6016 ; (vectors_run.s3 + 2)
601e : 60 __ __ RTS
--------------------------------------------------------------------
vec_init: ; vec_init()->void
; 116, "/home/xahmol/git/UltimateDemo2026/src/vectors.c"
.s4:
601f : 78 __ __ SEI
6020 : a9 00 __ LDA #$00
6022 : 85 0f __ STA P2 
6024 : 85 10 __ STA P3 
6026 : a9 30 __ LDA #$30
6028 : 85 01 __ STA $01 
602a : a9 40 __ LDA #$40
602c : 85 11 __ STA P4 
602e : a9 1f __ LDA #$1f
6030 : 85 12 __ STA P5 
6032 : a9 10 __ LDA #$10
6034 : a2 fa __ LDX #$fa
.l6:
6036 : ca __ __ DEX
6037 : 9d 00 d0 STA $d000,x 
603a : 9d fa d0 STA $d0fa,x 
603d : 9d f4 d1 STA $d1f4,x 
6040 : 9d ee d2 STA $d2ee,x 
6043 : d0 f1 __ BNE $6036 ; (vec_init.l6 + 0)
.s5:
6045 : a9 00 __ LDA #$00
6047 : 85 43 __ STA T1 + 0 
6049 : 85 0d __ STA P0 
604b : a9 e0 __ LDA #$e0
604d : 85 44 __ STA T1 + 1 
604f : 85 0e __ STA P1 
6051 : 20 f3 20 JSR $20f3 ; (memset.s4 + 0)
6054 : a9 35 __ LDA #$35
6056 : 85 01 __ STA $01 
6058 : 20 0f 21 JSR $210f ; (mmap_trampoline.s4 + 0)
605b : 58 __ __ CLI
605c : 20 f5 72 JSR $72f5 ; (vic_setmode@proxy + 0)
605f : a5 10 __ LDA P3 
6061 : 8d 48 88 STA $8848 ; (VScreen.data + 0)
6064 : a5 11 __ LDA P4 
6066 : 8d 49 88 STA $8849 ; (VScreen.data + 1)
6069 : a9 28 __ LDA #$28
606b : 8d 4c 88 STA $884c ; (VScreen.cwidth + 0)
606e : a9 19 __ LDA #$19
6070 : 8d 4d 88 STA $884d ; (VScreen.cheight + 0)
6073 : a9 40 __ LDA #$40
6075 : 8d 4e 88 STA $884e ; (VScreen.width + 0)
6078 : a9 01 __ LDA #$01
607a : 8d 4f 88 STA $884f ; (VScreen.width + 1)
607d : a9 00 __ LDA #$00
607f : 8d 20 d0 STA $d020 
6082 : 8d 21 d0 STA $d021 
6085 : 8d 4a 88 STA $884a ; (VScreen.rdata + 0)
6088 : 8d 4b 88 STA $884b ; (VScreen.rdata + 1)
.s3:
608b : 60 __ __ RTS
--------------------------------------------------------------------
project: ; project(u8,u8,i16*,i16*)->void
;  81, "/home/xahmol/git/UltimateDemo2026/src/vectors.c"
.s1:
608c : a2 0e __ LDX #$0e
608e : b5 53 __ LDA T4 + 0,x 
6090 : 9d d2 bf STA $bfd2,x ; (project@stack + 0)
6093 : ca __ __ DEX
6094 : 10 f8 __ BPL $608e ; (project.s1 + 2)
.s4:
6096 : a5 0d __ LDA P0 ; (ax + 0)
6098 : 0a __ __ ASL
6099 : 85 47 __ STA T1 + 0 
609b : a9 77 __ LDA #$77
609d : 69 00 __ ADC #$00
609f : 85 5a __ STA T7 + 1 
60a1 : 18 __ __ CLC
60a2 : a5 0e __ LDA P1 ; (ay + 0)
60a4 : 69 40 __ ADC #$40
60a6 : 0a __ __ ASL
60a7 : 85 4b __ STA T2 + 0 
60a9 : a9 00 __ LDA #$00
60ab : 85 48 __ STA T1 + 1 
60ad : 2a __ __ ROL
60ae : aa __ __ TAX
60af : a9 da __ LDA #$da
60b1 : 85 59 __ STA T7 + 0 
60b3 : 65 4b __ ADC T2 + 0 
60b5 : 85 5b __ STA T8 + 0 
60b7 : 8a __ __ TXA
60b8 : 69 77 __ ADC #$77
60ba : 85 5c __ STA T8 + 1 
60bc : 06 0e __ ASL P1 ; (ay + 0)
60be : 26 48 __ ROL T1 + 1 
60c0 : 18 __ __ CLC
60c1 : a9 da __ LDA #$da
60c3 : 65 0e __ ADC P1 ; (ay + 0)
60c5 : 85 5d __ STA T9 + 0 
60c7 : a9 77 __ LDA #$77
60c9 : 65 48 __ ADC T1 + 1 
60cb : 85 5e __ STA T9 + 1 
60cd : 18 __ __ CLC
60ce : a5 0d __ LDA P0 ; (ax + 0)
60d0 : 69 40 __ ADC #$40
60d2 : 0a __ __ ASL
60d3 : a2 00 __ LDX #$00
60d5 : 90 02 __ BCC $60d9 ; (project.s11 + 0)
.s10:
60d7 : e8 __ __ INX
60d8 : 18 __ __ CLC
.s11:
60d9 : 69 da __ ADC #$da
60db : 85 5f __ STA T10 + 0 
60dd : 8a __ __ TXA
60de : 69 77 __ ADC #$77
60e0 : 85 60 __ STA T10 + 1 
60e2 : a9 00 __ LDA #$00
60e4 : 85 52 __ STA T11 + 0 
.l5:
60e6 : 85 61 __ STA T12 + 0 
60e8 : aa __ __ TAX
60e9 : bd 62 77 LDA $7762,x ; (cube_v[0][0] + 0)
60ec : 29 80 __ AND #$80
60ee : 10 02 __ BPL $60f2 ; (project.l5 + 12)
60f0 : a9 ff __ LDA #$ff
60f2 : 85 04 __ STA WORK + 1 
60f4 : 85 44 __ STA T0 + 1 
60f6 : bd 62 77 LDA $7762,x ; (cube_v[0][0] + 0)
60f9 : 0a __ __ ASL
60fa : 0a __ __ ASL
60fb : 18 __ __ CLC
60fc : 7d 62 77 ADC $7762,x ; (cube_v[0][0] + 0)
60ff : 0a __ __ ASL
6100 : 0a __ __ ASL
6101 : 0a __ __ ASL
6102 : 0a __ __ ASL
6103 : 85 43 __ STA T0 + 0 
6105 : 85 03 __ STA WORK + 0 
6107 : a5 04 __ LDA WORK + 1 
6109 : 29 80 __ AND #$80
610b : 10 02 __ BPL $610f ; (project.l5 + 41)
610d : a9 ff __ LDA #$ff
610f : 85 45 __ STA T0 + 2 
6111 : 85 06 __ STA WORK + 3 
6113 : 85 05 __ STA WORK + 2 
6115 : a0 00 __ LDY #$00
6117 : b1 5b __ LDA (T8 + 0),y 
6119 : 85 0e __ STA P1 ; (ay + 0)
611b : 85 1b __ STA ACCU + 0 
611d : c8 __ __ INY
611e : b1 5b __ LDA (T8 + 0),y 
6120 : 85 48 __ STA T1 + 1 
6122 : 85 1c __ STA ACCU + 1 
6124 : 29 80 __ AND #$80
6126 : 10 02 __ BPL $612a ; (project.l5 + 68)
6128 : a9 ff __ LDA #$ff
612a : 85 49 __ STA T1 + 2 
612c : 85 1d __ STA ACCU + 2 
612e : 85 1e __ STA ACCU + 3 
6130 : 20 59 6f JSR $6f59 ; (mul32 + 0)
6133 : a5 07 __ LDA WORK + 4 
6135 : 85 4b __ STA T2 + 0 
6137 : a5 08 __ LDA WORK + 5 
6139 : 85 4c __ STA T2 + 1 
613b : a5 09 __ LDA WORK + 6 
613d : 85 4d __ STA T2 + 2 
613f : a5 0a __ LDA WORK + 7 
6141 : 85 4e __ STA T2 + 3 
6143 : a0 00 __ LDY #$00
6145 : b1 5d __ LDA (T9 + 0),y 
6147 : 85 4f __ STA T3 + 0 
6149 : 85 03 __ STA WORK + 0 
614b : c8 __ __ INY
614c : b1 5d __ LDA (T9 + 0),y 
614e : 85 50 __ STA T3 + 1 
6150 : 85 04 __ STA WORK + 1 
6152 : 29 80 __ AND #$80
6154 : 10 02 __ BPL $6158 ; (project.l5 + 114)
6156 : a9 ff __ LDA #$ff
6158 : 85 51 __ STA T3 + 2 
615a : 85 06 __ STA WORK + 3 
615c : 85 05 __ STA WORK + 2 
615e : a6 61 __ LDX T12 + 0 
6160 : bd 64 77 LDA $7764,x ; (cube_v[0][0] + 2)
6163 : 29 80 __ AND #$80
6165 : 10 02 __ BPL $6169 ; (project.l5 + 131)
6167 : a9 ff __ LDA #$ff
6169 : 85 1c __ STA ACCU + 1 
616b : 85 54 __ STA T4 + 1 
616d : bd 64 77 LDA $7764,x ; (cube_v[0][0] + 2)
6170 : 0a __ __ ASL
6171 : 0a __ __ ASL
6172 : 18 __ __ CLC
6173 : 7d 64 77 ADC $7764,x ; (cube_v[0][0] + 2)
6176 : 0a __ __ ASL
6177 : 0a __ __ ASL
6178 : 0a __ __ ASL
6179 : 0a __ __ ASL
617a : 85 53 __ STA T4 + 0 
617c : 85 1b __ STA ACCU + 0 
617e : a5 1c __ LDA ACCU + 1 
6180 : 29 80 __ AND #$80
6182 : 10 02 __ BPL $6186 ; (project.l5 + 160)
6184 : a9 ff __ LDA #$ff
6186 : 85 55 __ STA T4 + 2 
6188 : 85 1d __ STA ACCU + 2 
618a : 85 1e __ STA ACCU + 3 
618c : 20 59 6f JSR $6f59 ; (mul32 + 0)
618f : 18 __ __ CLC
6190 : a5 07 __ LDA WORK + 4 
6192 : 65 4b __ ADC T2 + 0 
6194 : a5 08 __ LDA WORK + 5 
6196 : 65 4c __ ADC T2 + 1 
6198 : 85 4b __ STA T2 + 0 
619a : a5 09 __ LDA WORK + 6 
619c : 65 4d __ ADC T2 + 2 
619e : 85 4c __ STA T2 + 1 
61a0 : a5 0a __ LDA WORK + 7 
61a2 : 65 4e __ ADC T2 + 3 
61a4 : 85 4e __ STA T2 + 3 
61a6 : a4 47 __ LDY T1 + 0 
61a8 : b1 59 __ LDA (T7 + 0),y 
61aa : 85 56 __ STA T5 + 0 
61ac : c8 __ __ INY
61ad : b1 59 __ LDA (T7 + 0),y 
61af : 85 57 __ STA T5 + 1 
61b1 : 29 80 __ AND #$80
61b3 : 10 02 __ BPL $61b7 ; (project.l5 + 209)
61b5 : a9 ff __ LDA #$ff
61b7 : 85 58 __ STA T5 + 2 
61b9 : a5 53 __ LDA T4 + 0 
61bb : 85 1b __ STA ACCU + 0 
61bd : a5 54 __ LDA T4 + 1 
61bf : 85 1c __ STA ACCU + 1 
61c1 : a5 55 __ LDA T4 + 2 
61c3 : 85 1d __ STA ACCU + 2 
61c5 : 85 1e __ STA ACCU + 3 
61c7 : a5 0e __ LDA P1 ; (ay + 0)
61c9 : 85 03 __ STA WORK + 0 
61cb : a5 48 __ LDA T1 + 1 
61cd : 85 04 __ STA WORK + 1 
61cf : a5 49 __ LDA T1 + 2 
61d1 : 85 05 __ STA WORK + 2 
61d3 : 85 06 __ STA WORK + 3 
61d5 : 20 59 6f JSR $6f59 ; (mul32 + 0)
61d8 : a5 07 __ LDA WORK + 4 
61da : 85 0e __ STA P1 ; (ay + 0)
61dc : a5 08 __ LDA WORK + 5 
61de : 85 48 __ STA T1 + 1 
61e0 : a5 09 __ LDA WORK + 6 
61e2 : 85 49 __ STA T1 + 2 
61e4 : a5 0a __ LDA WORK + 7 
61e6 : 85 4a __ STA T1 + 3 
61e8 : 38 __ __ SEC
61e9 : a9 00 __ LDA #$00
61eb : e5 4f __ SBC T3 + 0 
61ed : 85 1b __ STA ACCU + 0 
61ef : a9 00 __ LDA #$00
61f1 : e5 50 __ SBC T3 + 1 
61f3 : 85 1c __ STA ACCU + 1 
61f5 : a9 00 __ LDA #$00
61f7 : e5 51 __ SBC T3 + 2 
61f9 : 85 1d __ STA ACCU + 2 
61fb : a9 00 __ LDA #$00
61fd : e5 51 __ SBC T3 + 2 
61ff : 85 1e __ STA ACCU + 3 
6201 : a5 43 __ LDA T0 + 0 
6203 : 85 03 __ STA WORK + 0 
6205 : a5 44 __ LDA T0 + 1 
6207 : 85 04 __ STA WORK + 1 
6209 : a5 45 __ LDA T0 + 2 
620b : 85 05 __ STA WORK + 2 
620d : 85 06 __ STA WORK + 3 
620f : 20 59 6f JSR $6f59 ; (mul32 + 0)
6212 : 18 __ __ CLC
6213 : a5 07 __ LDA WORK + 4 
6215 : 65 0e __ ADC P1 ; (ay + 0)
6217 : a5 08 __ LDA WORK + 5 
6219 : 65 48 __ ADC T1 + 1 
621b : 85 43 __ STA T0 + 0 
621d : a5 09 __ LDA WORK + 6 
621f : 65 49 __ ADC T1 + 2 
6221 : 85 44 __ STA T0 + 1 
6223 : a5 0a __ LDA WORK + 7 
6225 : 65 4a __ ADC T1 + 3 
6227 : 4a __ __ LSR
6228 : 66 44 __ ROR T0 + 1 
622a : 66 43 __ ROR T0 + 0 
622c : 4a __ __ LSR
622d : 66 44 __ ROR T0 + 1 
622f : 66 43 __ ROR T0 + 0 
6231 : 4a __ __ LSR
6232 : 66 44 __ ROR T0 + 1 
6234 : 66 43 __ ROR T0 + 0 
6236 : 4a __ __ LSR
6237 : 66 44 __ ROR T0 + 1 
6239 : 66 43 __ ROR T0 + 0 
623b : a5 44 __ LDA T0 + 1 
623d : 85 1c __ STA ACCU + 1 
623f : 29 80 __ AND #$80
6241 : 10 02 __ BPL $6245 ; (project.l5 + 351)
6243 : a9 ff __ LDA #$ff
6245 : 85 45 __ STA T0 + 2 
6247 : 85 1e __ STA ACCU + 3 
6249 : 85 1d __ STA ACCU + 2 
624b : a5 43 __ LDA T0 + 0 
624d : 85 1b __ STA ACCU + 0 
624f : a5 56 __ LDA T5 + 0 
6251 : 85 03 __ STA WORK + 0 
6253 : a5 57 __ LDA T5 + 1 
6255 : 85 04 __ STA WORK + 1 
6257 : a5 58 __ LDA T5 + 2 
6259 : 85 05 __ STA WORK + 2 
625b : 85 06 __ STA WORK + 3 
625d : 20 59 6f JSR $6f59 ; (mul32 + 0)
6260 : a5 07 __ LDA WORK + 4 
6262 : 85 0e __ STA P1 ; (ay + 0)
6264 : a5 08 __ LDA WORK + 5 
6266 : 85 48 __ STA T1 + 1 
6268 : a5 09 __ LDA WORK + 6 
626a : 85 49 __ STA T1 + 2 
626c : a5 0a __ LDA WORK + 7 
626e : 85 4a __ STA T1 + 3 
6270 : a6 61 __ LDX T12 + 0 
6272 : bd 63 77 LDA $7763,x ; (cube_v[0][0] + 1)
6275 : 29 80 __ AND #$80
6277 : 10 02 __ BPL $627b ; (project.l5 + 405)
6279 : a9 ff __ LDA #$ff
627b : 85 04 __ STA WORK + 1 
627d : 85 50 __ STA T3 + 1 
627f : bd 63 77 LDA $7763,x ; (cube_v[0][0] + 1)
6282 : 0a __ __ ASL
6283 : 0a __ __ ASL
6284 : 18 __ __ CLC
6285 : 7d 63 77 ADC $7763,x ; (cube_v[0][0] + 1)
6288 : 0a __ __ ASL
6289 : 0a __ __ ASL
628a : 0a __ __ ASL
628b : 0a __ __ ASL
628c : 85 4f __ STA T3 + 0 
628e : 85 03 __ STA WORK + 0 
6290 : a5 04 __ LDA WORK + 1 
6292 : 29 80 __ AND #$80
6294 : 10 02 __ BPL $6298 ; (project.l5 + 434)
6296 : a9 ff __ LDA #$ff
6298 : 85 51 __ STA T3 + 2 
629a : 85 06 __ STA WORK + 3 
629c : 85 05 __ STA WORK + 2 
629e : a0 00 __ LDY #$00
62a0 : b1 5f __ LDA (T10 + 0),y 
62a2 : 85 53 __ STA T4 + 0 
62a4 : 85 1b __ STA ACCU + 0 
62a6 : c8 __ __ INY
62a7 : b1 5f __ LDA (T10 + 0),y 
62a9 : 85 54 __ STA T4 + 1 
62ab : 85 1c __ STA ACCU + 1 
62ad : 29 80 __ AND #$80
62af : 10 02 __ BPL $62b3 ; (project.l5 + 461)
62b1 : a9 ff __ LDA #$ff
62b3 : 85 55 __ STA T4 + 2 
62b5 : 85 1d __ STA ACCU + 2 
62b7 : 85 1e __ STA ACCU + 3 
62b9 : 20 59 6f JSR $6f59 ; (mul32 + 0)
62bc : 38 __ __ SEC
62bd : a5 07 __ LDA WORK + 4 
62bf : e5 0e __ SBC P1 ; (ay + 0)
62c1 : a5 08 __ LDA WORK + 5 
62c3 : e5 48 __ SBC T1 + 1 
62c5 : 85 0e __ STA P1 ; (ay + 0)
62c7 : a5 09 __ LDA WORK + 6 
62c9 : e5 49 __ SBC T1 + 2 
62cb : 85 48 __ STA T1 + 1 
62cd : a5 0a __ LDA WORK + 7 
62cf : e5 4a __ SBC T1 + 3 
62d1 : 85 4a __ STA T1 + 3 
62d3 : a5 53 __ LDA T4 + 0 
62d5 : 85 1b __ STA ACCU + 0 
62d7 : a5 54 __ LDA T4 + 1 
62d9 : 85 1c __ STA ACCU + 1 
62db : a5 55 __ LDA T4 + 2 
62dd : 85 1d __ STA ACCU + 2 
62df : 85 1e __ STA ACCU + 3 
62e1 : a5 43 __ LDA T0 + 0 
62e3 : 85 03 __ STA WORK + 0 
62e5 : a5 44 __ LDA T0 + 1 
62e7 : 85 04 __ STA WORK + 1 
62e9 : a5 45 __ LDA T0 + 2 
62eb : 85 05 __ STA WORK + 2 
62ed : 85 06 __ STA WORK + 3 
62ef : 20 59 6f JSR $6f59 ; (mul32 + 0)
62f2 : a5 07 __ LDA WORK + 4 
62f4 : 85 43 __ STA T0 + 0 
62f6 : a5 08 __ LDA WORK + 5 
62f8 : 85 44 __ STA T0 + 1 
62fa : a5 09 __ LDA WORK + 6 
62fc : 85 45 __ STA T0 + 2 
62fe : a5 0a __ LDA WORK + 7 
6300 : 85 46 __ STA T0 + 3 
6302 : a5 56 __ LDA T5 + 0 
6304 : 85 1b __ STA ACCU + 0 
6306 : a5 57 __ LDA T5 + 1 
6308 : 85 1c __ STA ACCU + 1 
630a : a5 58 __ LDA T5 + 2 
630c : 85 1d __ STA ACCU + 2 
630e : 85 1e __ STA ACCU + 3 
6310 : a5 4f __ LDA T3 + 0 
6312 : 85 03 __ STA WORK + 0 
6314 : a5 50 __ LDA T3 + 1 
6316 : 85 04 __ STA WORK + 1 
6318 : a5 51 __ LDA T3 + 2 
631a : 85 05 __ STA WORK + 2 
631c : 85 06 __ STA WORK + 3 
631e : 20 59 6f JSR $6f59 ; (mul32 + 0)
6321 : 18 __ __ CLC
6322 : a5 07 __ LDA WORK + 4 
6324 : 65 43 __ ADC T0 + 0 
6326 : a5 08 __ LDA WORK + 5 
6328 : 65 44 __ ADC T0 + 1 
632a : 85 43 __ STA T0 + 0 
632c : a5 09 __ LDA WORK + 6 
632e : 65 45 __ ADC T0 + 2 
6330 : 85 44 __ STA T0 + 1 
6332 : a5 0a __ LDA WORK + 7 
6334 : 65 46 __ ADC T0 + 3 
6336 : 4a __ __ LSR
6337 : 66 44 __ ROR T0 + 1 
6339 : 66 43 __ ROR T0 + 0 
633b : 4a __ __ LSR
633c : 66 44 __ ROR T0 + 1 
633e : 66 43 __ ROR T0 + 0 
6340 : 4a __ __ LSR
6341 : 66 44 __ ROR T0 + 1 
6343 : 66 43 __ ROR T0 + 0 
6345 : 4a __ __ LSR
6346 : 66 44 __ ROR T0 + 1 
6348 : 66 43 __ ROR T0 + 0 
634a : 18 __ __ CLC
634b : a5 43 __ LDA T0 + 0 
634d : 69 18 __ ADC #$18
634f : 85 4f __ STA T3 + 0 
6351 : a5 44 __ LDA T0 + 1 
6353 : 69 01 __ ADC #$01
6355 : 85 50 __ STA T3 + 1 
6357 : a5 44 __ LDA T0 + 1 
6359 : 49 80 __ EOR #$80
635b : c9 7e __ CMP #$7e
635d : d0 04 __ BNE $6363 ; (project.s9 + 0)
.s8:
635f : a5 43 __ LDA T0 + 0 
6361 : c9 e9 __ CMP #$e9
.s9:
6363 : b0 08 __ BCS $636d ; (project.s6 + 0)
.s7:
6365 : a9 01 __ LDA #$01
6367 : 85 4f __ STA T3 + 0 
6369 : a9 00 __ LDA #$00
636b : 85 50 __ STA T3 + 1 
.s6:
636d : a5 4e __ LDA T2 + 3 
636f : 4a __ __ LSR
6370 : 66 4c __ ROR T2 + 1 
6372 : 66 4b __ ROR T2 + 0 
6374 : 4a __ __ LSR
6375 : 66 4c __ ROR T2 + 1 
6377 : 66 4b __ ROR T2 + 0 
6379 : 4a __ __ LSR
637a : 66 4c __ ROR T2 + 1 
637c : 66 4b __ ROR T2 + 0 
637e : 4a __ __ LSR
637f : 66 4c __ ROR T2 + 1 
6381 : 66 4b __ ROR T2 + 0 
6383 : a5 4b __ LDA T2 + 0 
6385 : 0a __ __ ASL
6386 : a8 __ __ TAY
6387 : a5 4c __ LDA T2 + 1 
6389 : 2a __ __ ROL
638a : aa __ __ TAX
638b : 98 __ __ TYA
638c : 18 __ __ CLC
638d : 65 4b __ ADC T2 + 0 
638f : a8 __ __ TAY
6390 : 8a __ __ TXA
6391 : 65 4c __ ADC T2 + 1 
6393 : 85 1b __ STA ACCU + 0 
6395 : 98 __ __ TYA
6396 : 0a __ __ ASL
6397 : 26 1b __ ROL ACCU + 0 
6399 : 0a __ __ ASL
639a : 26 1b __ ROL ACCU + 0 
639c : 0a __ __ ASL
639d : 26 1b __ ROL ACCU + 0 
639f : 18 __ __ CLC
63a0 : 65 4b __ ADC T2 + 0 
63a2 : 85 4b __ STA T2 + 0 
63a4 : a5 1b __ LDA ACCU + 0 
63a6 : 65 4c __ ADC T2 + 1 
63a8 : 06 4b __ ASL T2 + 0 
63aa : 2a __ __ ROL
63ab : 06 4b __ ASL T2 + 0 
63ad : 2a __ __ ROL
63ae : 06 4b __ ASL T2 + 0 
63b0 : 2a __ __ ROL
63b1 : 85 1c __ STA ACCU + 1 
63b3 : a5 4b __ LDA T2 + 0 
63b5 : 85 1b __ STA ACCU + 0 
63b7 : 20 a7 72 JSR $72a7 ; (divs16@proxy + 0)
63ba : 18 __ __ CLC
63bb : a5 1b __ LDA ACCU + 0 
63bd : 69 a0 __ ADC #$a0
63bf : a8 __ __ TAY
63c0 : a5 1c __ LDA ACCU + 1 
63c2 : 69 00 __ ADC #$00
63c4 : 85 44 __ STA T0 + 1 
63c6 : a5 52 __ LDA T11 + 0 
63c8 : 0a __ __ ASL
63c9 : 85 4b __ STA T2 + 0 
63cb : aa __ __ TAX
63cc : 98 __ __ TYA
63cd : 9d 60 88 STA $8860,x ; (px_cur[0] + 0)
63d0 : a5 44 __ LDA T0 + 1 
63d2 : 9d 61 88 STA $8861,x ; (px_cur[0] + 1)
63d5 : a5 4a __ LDA T1 + 3 
63d7 : 4a __ __ LSR
63d8 : 66 48 __ ROR T1 + 1 
63da : 66 0e __ ROR P1 ; (ay + 0)
63dc : 4a __ __ LSR
63dd : 66 48 __ ROR T1 + 1 
63df : 66 0e __ ROR P1 ; (ay + 0)
63e1 : 4a __ __ LSR
63e2 : 66 48 __ ROR T1 + 1 
63e4 : 66 0e __ ROR P1 ; (ay + 0)
63e6 : 4a __ __ LSR
63e7 : 66 48 __ ROR T1 + 1 
63e9 : 66 0e __ ROR P1 ; (ay + 0)
63eb : a5 0e __ LDA P1 ; (ay + 0)
63ed : 0a __ __ ASL
63ee : a8 __ __ TAY
63ef : a5 48 __ LDA T1 + 1 
63f1 : 2a __ __ ROL
63f2 : aa __ __ TAX
63f3 : 98 __ __ TYA
63f4 : 18 __ __ CLC
63f5 : 65 0e __ ADC P1 ; (ay + 0)
63f7 : a8 __ __ TAY
63f8 : 8a __ __ TXA
63f9 : 65 48 __ ADC T1 + 1 
63fb : 85 1b __ STA ACCU + 0 
63fd : 98 __ __ TYA
63fe : 0a __ __ ASL
63ff : 26 1b __ ROL ACCU + 0 
6401 : 0a __ __ ASL
6402 : 26 1b __ ROL ACCU + 0 
6404 : 0a __ __ ASL
6405 : 26 1b __ ROL ACCU + 0 
6407 : 18 __ __ CLC
6408 : 65 0e __ ADC P1 ; (ay + 0)
640a : 85 0e __ STA P1 ; (ay + 0)
640c : a5 1b __ LDA ACCU + 0 
640e : 65 48 __ ADC T1 + 1 
6410 : 06 0e __ ASL P1 ; (ay + 0)
6412 : 2a __ __ ROL
6413 : 06 0e __ ASL P1 ; (ay + 0)
6415 : 2a __ __ ROL
6416 : 06 0e __ ASL P1 ; (ay + 0)
6418 : 2a __ __ ROL
6419 : 85 1c __ STA ACCU + 1 
641b : a5 0e __ LDA P1 ; (ay + 0)
641d : 85 1b __ STA ACCU + 0 
641f : 20 a7 72 JSR $72a7 ; (divs16@proxy + 0)
6422 : 18 __ __ CLC
6423 : a5 1b __ LDA ACCU + 0 
6425 : 69 64 __ ADC #$64
6427 : a6 4b __ LDX T2 + 0 
6429 : 9d 50 88 STA $8850,x ; (py_cur[0] + 0)
642c : a5 1c __ LDA ACCU + 1 
642e : 69 00 __ ADC #$00
6430 : 9d 51 88 STA $8851,x ; (py_cur[0] + 1)
6433 : e6 52 __ INC T11 + 0 
6435 : 18 __ __ CLC
6436 : a5 61 __ LDA T12 + 0 
6438 : 69 03 __ ADC #$03
643a : c9 18 __ CMP #$18
643c : f0 03 __ BEQ $6441 ; (project.s3 + 0)
643e : 4c e6 60 JMP $60e6 ; (project.l5 + 0)
.s3:
6441 : a2 0e __ LDX #$0e
6443 : bd d2 bf LDA $bfd2,x ; (project@stack + 0)
6446 : 95 53 __ STA T4 + 0,x 
6448 : ca __ __ DEX
6449 : 10 f8 __ BPL $6443 ; (project.s3 + 2)
644b : 60 __ __ RTS
--------------------------------------------------------------------
plasma_run: ; plasma_run()->void
;   3, "/home/xahmol/git/UltimateDemo2026/src/plasma.h"
.s1:
644c : a2 04 __ LDX #$04
644e : b5 53 __ LDA T1 + 0,x 
6450 : 9d e2 bf STA $bfe2,x ; (plasma_run@stack + 0)
6453 : ca __ __ DEX
6454 : 10 f8 __ BPL $644e ; (plasma_run.s1 + 2)
.s4:
6456 : 20 2b 65 JSR $652b ; (plasma_init.s4 + 0)
6459 : a9 00 __ LDA #$00
645b : 85 53 __ STA T1 + 0 
645d : 85 54 __ STA T2 + 0 
645f : 85 55 __ STA T3 + 0 
6461 : a9 a2 __ LDA #$a2
6463 : 85 56 __ STA T4 + 0 
6465 : a9 fe __ LDA #$fe
6467 : 85 57 __ STA T4 + 1 
.l5:
6469 : a5 53 __ LDA T1 + 0 
646b : 85 0d __ STA P0 
646d : 20 7f 65 JSR $657f ; (plasma_frame@proxy + 0)
.l6:
6470 : 2c 11 d0 BIT $d011 
6473 : 30 fb __ BMI $6470 ; (plasma_run.l6 + 0)
.l7:
6475 : 2c 11 d0 BIT $d011 
6478 : 10 fb __ BPL $6475 ; (plasma_run.l7 + 0)
.s8:
647a : e6 55 __ INC T3 + 0 
647c : e6 54 __ INC T2 + 0 
647e : e6 54 __ INC T2 + 0 
6480 : e6 53 __ INC T1 + 0 
6482 : e6 56 __ INC T4 + 0 
6484 : d0 e3 __ BNE $6469 ; (plasma_run.l5 + 0)
.s19:
6486 : e6 57 __ INC T4 + 1 
6488 : d0 df __ BNE $6469 ; (plasma_run.l5 + 0)
.s9:
648a : a9 00 __ LDA #$00
648c : 85 43 __ STA T0 + 0 
648e : 85 1f __ STA ADDR + 0 
6490 : a9 c0 __ LDA #$c0
6492 : 85 44 __ STA T0 + 1 
6494 : d0 02 __ BNE $6498 ; (plasma_run.l18 + 0)
.s21:
6496 : e6 44 __ INC T0 + 1 
.l18:
6498 : a9 82 __ LDA #$82
649a : a0 00 __ LDY #$00
649c : 91 43 __ STA (T0 + 0),y 
649e : 18 __ __ CLC
649f : a5 44 __ LDA T0 + 1 
64a1 : 69 18 __ ADC #$18
64a3 : 85 20 __ STA ADDR + 1 
64a5 : a9 07 __ LDA #$07
64a7 : a4 43 __ LDY T0 + 0 
64a9 : 91 1f __ STA (ADDR + 0),y 
64ab : 98 __ __ TYA
64ac : 18 __ __ CLC
64ad : 69 01 __ ADC #$01
64af : 85 43 __ STA T0 + 0 
64b1 : b0 e3 __ BCS $6496 ; (plasma_run.s21 + 0)
.s22:
64b3 : c9 e8 __ CMP #$e8
64b5 : d0 e1 __ BNE $6498 ; (plasma_run.l18 + 0)
.s17:
64b7 : a5 44 __ LDA T0 + 1 
64b9 : c9 c3 __ CMP #$c3
64bb : d0 db __ BNE $6498 ; (plasma_run.l18 + 0)
.s10:
64bd : a9 00 __ LDA #$00
64bf : 8d 21 d0 STA $d021 
64c2 : a9 a2 __ LDA #$a2
64c4 : 85 56 __ STA T4 + 0 
64c6 : a9 fe __ LDA #$fe
64c8 : 85 57 __ STA T4 + 1 
64ca : a5 53 __ LDA T1 + 0 
.l11:
64cc : 85 0d __ STA P0 
64ce : 20 7f 65 JSR $657f ; (plasma_frame@proxy + 0)
.l12:
64d1 : 2c 11 d0 BIT $d011 
64d4 : 30 fb __ BMI $64d1 ; (plasma_run.l12 + 0)
.l13:
64d6 : 2c 11 d0 BIT $d011 
64d9 : 10 fb __ BPL $64d6 ; (plasma_run.l13 + 0)
.s14:
64db : 18 __ __ CLC
64dc : a5 0f __ LDA P2 
64de : 69 02 __ ADC #$02
64e0 : 85 55 __ STA T3 + 0 
64e2 : 18 __ __ CLC
64e3 : a5 54 __ LDA T2 + 0 
64e5 : 69 03 __ ADC #$03
64e7 : 85 54 __ STA T2 + 0 
64e9 : 18 __ __ CLC
64ea : a5 0d __ LDA P0 
64ec : 69 02 __ ADC #$02
64ee : e6 56 __ INC T4 + 0 
64f0 : d0 da __ BNE $64cc ; (plasma_run.l11 + 0)
.s20:
64f2 : e6 57 __ INC T4 + 1 
64f4 : d0 d6 __ BNE $64cc ; (plasma_run.l11 + 0)
.s15:
64f6 : a9 00 __ LDA #$00
64f8 : 85 0d __ STA P0 
64fa : 85 0e __ STA P1 
64fc : 85 10 __ STA P3 
64fe : a9 36 __ LDA #$36
6500 : 85 01 __ STA $01 
6502 : 20 0b 0f JSR $0f0b ; (vic_setmode@proxy + 0)
6505 : a9 00 __ LDA #$00
6507 : 8d 20 d0 STA $d020 
650a : 8d 21 d0 STA $d021 
650d : a9 20 __ LDA #$20
650f : a2 fa __ LDX #$fa
.l16:
6511 : ca __ __ DEX
6512 : 9d 00 04 STA $0400,x 
6515 : 9d fa 04 STA $04fa,x 
6518 : 9d f4 05 STA $05f4,x 
651b : 9d ee 06 STA $06ee,x 
651e : d0 f1 __ BNE $6511 ; (plasma_run.l16 + 0)
.s3:
6520 : a2 04 __ LDX #$04
6522 : bd e2 bf LDA $bfe2,x ; (plasma_run@stack + 0)
6525 : 95 53 __ STA T1 + 0,x 
6527 : ca __ __ DEX
6528 : 10 f8 __ BPL $6522 ; (plasma_run.s3 + 2)
652a : 60 __ __ RTS
--------------------------------------------------------------------
plasma_init: ; plasma_init()->void
;  38, "/home/xahmol/git/UltimateDemo2026/src/plasma.c"
.s4:
652b : a9 00 __ LDA #$00
652d : 85 0f __ STA P2 
652f : 85 10 __ STA P3 
6531 : 85 43 __ STA T0 + 0 
6533 : 85 0d __ STA P0 
6535 : a9 35 __ LDA #$35
6537 : 85 01 __ STA $01 
6539 : 20 91 72 JSR $7291 ; (memset@proxy + 0)
653c : a9 c0 __ LDA #$c0
653e : 85 44 __ STA T0 + 1 
6540 : a9 00 __ LDA #$00
6542 : 85 1f __ STA ADDR + 0 
6544 : f0 02 __ BEQ $6548 ; (plasma_init.l7 + 0)
.s8:
6546 : e6 44 __ INC T0 + 1 
.l7:
6548 : a9 34 __ LDA #$34
654a : a0 00 __ LDY #$00
654c : 91 43 __ STA (T0 + 0),y 
654e : 18 __ __ CLC
654f : a5 44 __ LDA T0 + 1 
6551 : 69 18 __ ADC #$18
6553 : 85 20 __ STA ADDR + 1 
6555 : a9 07 __ LDA #$07
6557 : a4 43 __ LDY T0 + 0 
6559 : 91 1f __ STA (ADDR + 0),y 
655b : 98 __ __ TYA
655c : 18 __ __ CLC
655d : 69 01 __ ADC #$01
655f : 85 43 __ STA T0 + 0 
6561 : b0 e3 __ BCS $6546 ; (plasma_init.s8 + 0)
.s9:
6563 : c9 e8 __ CMP #$e8
6565 : d0 e1 __ BNE $6548 ; (plasma_init.l7 + 0)
.s6:
6567 : a5 44 __ LDA T0 + 1 
6569 : c9 c3 __ CMP #$c3
656b : d0 db __ BNE $6548 ; (plasma_init.l7 + 0)
.s5:
656d : a9 00 __ LDA #$00
656f : 85 0e __ STA P1 
6571 : 85 10 __ STA P3 
6573 : 20 e6 72 JSR $72e6 ; (vic_setmode@proxy + 0)
6576 : a9 00 __ LDA #$00
6578 : 8d 21 d0 STA $d021 
657b : 8d 20 d0 STA $d020 
.s3:
657e : 60 __ __ RTS
--------------------------------------------------------------------
plasma_frame@proxy: ; plasma_frame@proxy
657f : a5 54 __ LDA $54 
6581 : 85 0e __ STA P1 
6583 : a5 55 __ LDA $55 
6585 : 85 0f __ STA P2 
--------------------------------------------------------------------
plasma_frame: ; plasma_frame(u8,u8,u8)->void
;  69, "/home/xahmol/git/UltimateDemo2026/src/plasma.c"
.s4:
6587 : a2 00 __ LDX #$00
.l8:
6589 : a5 0e __ LDA P1 ; (t2 + 0)
658b : 29 3f __ AND #$3f
658d : a8 __ __ TAY
658e : b9 00 7a LDA $7a00,y ; (sin_lut[0] + 0)
6591 : 9d 00 89 STA $8900,x ; (row_sin[0] + 0)
6594 : e6 0e __ INC P1 ; (t2 + 0)
6596 : e8 __ __ INX
6597 : e0 c8 __ CPX #$c8
6599 : d0 ee __ BNE $6589 ; (plasma_frame.l8 + 0)
.s9:
659b : a5 0d __ LDA P0 ; (t1 + 0)
659d : 85 0e __ STA P1 ; (t2 + 0)
659f : a9 00 __ LDA #$00
65a1 : 85 1b __ STA ACCU + 0 
.l5:
65a3 : 85 4b __ STA T10 + 0 
65a5 : 29 07 __ AND #$07
65a7 : 85 43 __ STA T3 + 0 
65a9 : a5 1b __ LDA ACCU + 0 
65ab : 29 f8 __ AND #$f8
65ad : 85 45 __ STA T4 + 0 
65af : 4a __ __ LSR
65b0 : 4a __ __ LSR
65b1 : 65 45 __ ADC T4 + 0 
65b3 : 4a __ __ LSR
65b4 : 6a __ __ ROR
65b5 : 6a __ __ ROR
65b6 : aa __ __ TAX
65b7 : 29 c0 __ AND #$c0
65b9 : 6a __ __ ROR
65ba : 05 43 __ ORA T3 + 0 
65bc : 85 45 __ STA T4 + 0 
65be : 8a __ __ TXA
65bf : 29 1f __ AND #$1f
65c1 : 09 e0 __ ORA #$e0
65c3 : 85 46 __ STA T4 + 1 
65c5 : a5 1b __ LDA ACCU + 0 
65c7 : 69 03 __ ADC #$03
65c9 : 85 43 __ STA T3 + 0 
65cb : a5 0e __ LDA P1 ; (t2 + 0)
65cd : 85 4d __ STA T11 + 0 
65cf : 18 __ __ CLC
65d0 : 69 03 __ ADC #$03
65d2 : 85 1c __ STA ACCU + 1 
65d4 : a5 1b __ LDA ACCU + 0 
65d6 : aa __ __ TAX
65d7 : e8 __ __ INX
65d8 : 86 49 __ STX T8 + 0 
65da : 18 __ __ CLC
65db : 69 02 __ ADC #$02
65dd : 85 47 __ STA T6 + 0 
65df : a9 00 __ LDA #$00
65e1 : 85 44 __ STA T3 + 1 
65e3 : 85 48 __ STA T6 + 1 
65e5 : 18 __ __ CLC
65e6 : a5 0e __ LDA P1 ; (t2 + 0)
65e8 : 69 02 __ ADC #$02
65ea : 85 1d __ STA ACCU + 2 
65ec : 18 __ __ CLC
65ed : 69 ff __ ADC #$ff
65ef : 85 1e __ STA ACCU + 3 
65f1 : a9 00 __ LDA #$00
65f3 : 85 4a __ STA T8 + 1 
65f5 : 85 4c __ STA T10 + 1 
65f7 : bd ff 88 LDA $88ff,x 
65fa : 85 4e __ STA T12 + 0 
65fc : a9 28 __ LDA #$28
65fe : 85 51 __ STA T16 + 0 
6600 : a0 00 __ LDY #$00
6602 : 18 __ __ CLC
.l7:
6603 : a5 4d __ LDA T11 + 0 
6605 : 29 3f __ AND #$3f
6607 : aa __ __ TAX
6608 : bd 00 7a LDA $7a00,x ; (sin_lut[0] + 0)
660b : 65 4e __ ADC T12 + 0 
660d : 85 4f __ STA T13 + 0 
660f : a5 4c __ LDA T10 + 1 
6611 : 4a __ __ LSR
6612 : a5 4b __ LDA T10 + 0 
6614 : 6a __ __ ROR
6615 : 18 __ __ CLC
6616 : 65 0f __ ADC P2 ; (t3 + 0)
6618 : 29 3f __ AND #$3f
661a : aa __ __ TAX
661b : bd 00 7a LDA $7a00,x ; (sin_lut[0] + 0)
661e : 18 __ __ CLC
661f : 65 4f __ ADC T13 + 0 
6621 : aa __ __ TAX
6622 : bd da 79 LDA $79da,x ; (sum_to_col[0] + 0)
6625 : 4a __ __ LSR
6626 : 6a __ __ ROR
6627 : 6a __ __ ROR
6628 : 85 4f __ STA T13 + 0 
662a : a5 1e __ LDA ACCU + 3 
662c : 29 3f __ AND #$3f
662e : aa __ __ TAX
662f : bd 00 7a LDA $7a00,x ; (sin_lut[0] + 0)
6632 : 65 4e __ ADC T12 + 0 
6634 : 85 50 __ STA T14 + 0 
6636 : a5 4a __ LDA T8 + 1 
6638 : 4a __ __ LSR
6639 : a5 49 __ LDA T8 + 0 
663b : 6a __ __ ROR
663c : 18 __ __ CLC
663d : 65 0f __ ADC P2 ; (t3 + 0)
663f : 29 3f __ AND #$3f
6641 : aa __ __ TAX
6642 : bd 00 7a LDA $7a00,x ; (sin_lut[0] + 0)
6645 : 18 __ __ CLC
6646 : 65 50 __ ADC T14 + 0 
6648 : aa __ __ TAX
6649 : bd da 79 LDA $79da,x ; (sum_to_col[0] + 0)
664c : 0a __ __ ASL
664d : 0a __ __ ASL
664e : 0a __ __ ASL
664f : 0a __ __ ASL
6650 : 05 4f __ ORA T13 + 0 
6652 : 85 4f __ STA T13 + 0 
6654 : a5 1d __ LDA ACCU + 2 
6656 : 29 3f __ AND #$3f
6658 : aa __ __ TAX
6659 : bd 00 7a LDA $7a00,x ; (sin_lut[0] + 0)
665c : 65 4e __ ADC T12 + 0 
665e : 85 50 __ STA T14 + 0 
6660 : a5 48 __ LDA T6 + 1 
6662 : 4a __ __ LSR
6663 : a5 47 __ LDA T6 + 0 
6665 : 6a __ __ ROR
6666 : 18 __ __ CLC
6667 : 65 0f __ ADC P2 ; (t3 + 0)
6669 : 29 3f __ AND #$3f
666b : aa __ __ TAX
666c : bd 00 7a LDA $7a00,x ; (sin_lut[0] + 0)
666f : 18 __ __ CLC
6670 : 65 50 __ ADC T14 + 0 
6672 : aa __ __ TAX
6673 : bd da 79 LDA $79da,x ; (sum_to_col[0] + 0)
6676 : 0a __ __ ASL
6677 : 0a __ __ ASL
6678 : 05 4f __ ORA T13 + 0 
667a : 85 4f __ STA T13 + 0 
667c : a5 1c __ LDA ACCU + 1 
667e : 29 3f __ AND #$3f
6680 : aa __ __ TAX
6681 : bd 00 7a LDA $7a00,x ; (sin_lut[0] + 0)
6684 : 65 4e __ ADC T12 + 0 
6686 : 85 50 __ STA T14 + 0 
6688 : a5 44 __ LDA T3 + 1 
668a : 4a __ __ LSR
668b : a5 43 __ LDA T3 + 0 
668d : 6a __ __ ROR
668e : 18 __ __ CLC
668f : 65 0f __ ADC P2 ; (t3 + 0)
6691 : 29 3f __ AND #$3f
6693 : aa __ __ TAX
6694 : bd 00 7a LDA $7a00,x ; (sin_lut[0] + 0)
6697 : 18 __ __ CLC
6698 : 65 50 __ ADC T14 + 0 
669a : aa __ __ TAX
669b : bd da 79 LDA $79da,x ; (sum_to_col[0] + 0)
669e : 05 4f __ ORA T13 + 0 
66a0 : 91 45 __ STA (T4 + 0),y 
66a2 : 18 __ __ CLC
66a3 : a5 43 __ LDA T3 + 0 
66a5 : 69 04 __ ADC #$04
66a7 : 85 43 __ STA T3 + 0 
66a9 : 90 03 __ BCC $66ae ; (plasma_frame.s11 + 0)
.s10:
66ab : e6 44 __ INC T3 + 1 
66ad : 18 __ __ CLC
.s11:
66ae : a5 1c __ LDA ACCU + 1 
66b0 : 69 04 __ ADC #$04
66b2 : 85 1c __ STA ACCU + 1 
66b4 : 18 __ __ CLC
66b5 : a5 47 __ LDA T6 + 0 
66b7 : 69 04 __ ADC #$04
66b9 : 85 47 __ STA T6 + 0 
66bb : 90 03 __ BCC $66c0 ; (plasma_frame.s13 + 0)
.s12:
66bd : e6 48 __ INC T6 + 1 
66bf : 18 __ __ CLC
.s13:
66c0 : a5 1d __ LDA ACCU + 2 
66c2 : 69 04 __ ADC #$04
66c4 : 85 1d __ STA ACCU + 2 
66c6 : 18 __ __ CLC
66c7 : a5 49 __ LDA T8 + 0 
66c9 : 69 04 __ ADC #$04
66cb : 85 49 __ STA T8 + 0 
66cd : 90 03 __ BCC $66d2 ; (plasma_frame.s15 + 0)
.s14:
66cf : e6 4a __ INC T8 + 1 
66d1 : 18 __ __ CLC
.s15:
66d2 : a5 1e __ LDA ACCU + 3 
66d4 : 69 04 __ ADC #$04
66d6 : 85 1e __ STA ACCU + 3 
66d8 : 18 __ __ CLC
66d9 : a5 4b __ LDA T10 + 0 
66db : 69 04 __ ADC #$04
66dd : 85 4b __ STA T10 + 0 
66df : 90 03 __ BCC $66e4 ; (plasma_frame.s17 + 0)
.s16:
66e1 : e6 4c __ INC T10 + 1 
66e3 : 18 __ __ CLC
.s17:
66e4 : a5 4d __ LDA T11 + 0 
66e6 : 69 04 __ ADC #$04
66e8 : 85 4d __ STA T11 + 0 
66ea : 98 __ __ TYA
66eb : 18 __ __ CLC
66ec : 69 08 __ ADC #$08
66ee : a8 __ __ TAY
66ef : 90 03 __ BCC $66f4 ; (plasma_frame.s19 + 0)
.s18:
66f1 : e6 46 __ INC T4 + 1 
66f3 : 18 __ __ CLC
.s19:
66f4 : c6 51 __ DEC T16 + 0 
66f6 : f0 03 __ BEQ $66fb ; (plasma_frame.s6 + 0)
66f8 : 4c 03 66 JMP $6603 ; (plasma_frame.l7 + 0)
.s6:
66fb : e6 1b __ INC ACCU + 0 
66fd : a5 1b __ LDA ACCU + 0 
66ff : c9 c8 __ CMP #$c8
6701 : f0 03 __ BEQ $6706 ; (plasma_frame.s3 + 0)
6703 : 4c a3 65 JMP $65a3 ; (plasma_frame.l5 + 0)
.s3:
6706 : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_run: ; tunnel_run()->void
;   6, "/home/xahmol/git/UltimateDemo2026/src/tunnel.h"
.s1:
6707 : a2 06 __ LDX #$06
6709 : b5 53 __ LDA T1 + 0,x 
670b : 9d df bf STA $bfdf,x ; (tunnel_run@stack + 0)
670e : ca __ __ DEX
670f : 10 f8 __ BPL $6709 ; (tunnel_run.s1 + 2)
.s4:
6711 : a9 8f __ LDA #$8f
6713 : 20 f1 15 JSR $15f1 ; (turbo_set.s4 + 0)
6716 : 20 df 67 JSR $67df ; (tunnel_build_tables.s4 + 0)
6719 : 20 1e 6a JSR $6a1e ; (tunnel_build_tex.s4 + 0)
671c : 20 9e 6a JSR $6a9e ; (tun_init.s4 + 0)
671f : a9 00 __ LDA #$00
6721 : 85 55 __ STA T4 + 0 
6723 : 85 56 __ STA T5 + 0 
6725 : 85 43 __ STA T0 + 0 
6727 : 85 53 __ STA T1 + 0 
6729 : 85 59 __ STA T7 + 0 
672b : 85 57 __ STA T6 + 0 
672d : 85 58 __ STA T6 + 1 
.l5:
672f : a5 57 __ LDA T6 + 0 
6731 : 85 1b __ STA ACCU + 0 
6733 : a5 58 __ LDA T6 + 1 
6735 : 85 1c __ STA ACCU + 1 
6737 : a9 c8 __ LDA #$c8
6739 : 85 03 __ STA WORK + 0 
673b : a9 00 __ LDA #$00
673d : 85 04 __ STA WORK + 1 
673f : 20 d4 6e JSR $6ed4 ; (divmod + 0)
6742 : a4 1b __ LDY ACCU + 0 
6744 : c4 59 __ CPY T7 + 0 
6746 : f0 2a __ BEQ $6772 ; (tunnel_run.s6 + 0)
.s12:
6748 : b9 fb 76 LDA $76fb,y ; (pal_sc[0] + 0)
674b : a2 fa __ LDX #$fa
.l14:
674d : ca __ __ DEX
674e : 9d 00 c0 STA $c000,x 
6751 : 9d fa c0 STA $c0fa,x 
6754 : 9d f4 c1 STA $c1f4,x 
6757 : 9d ee c2 STA $c2ee,x 
675a : d0 f1 __ BNE $674d ; (tunnel_run.l14 + 0)
.s13:
675c : b9 e4 79 LDA $79e4,y ; (pal_cr[0] + 0)
675f : a2 fa __ LDX #$fa
.l16:
6761 : ca __ __ DEX
6762 : 9d 00 d8 STA $d800,x 
6765 : 9d fa d8 STA $d8fa,x 
6768 : 9d f4 d9 STA $d9f4,x 
676b : 9d ee da STA $daee,x 
676e : d0 f1 __ BNE $6761 ; (tunnel_run.l16 + 0)
.s15:
6770 : 84 59 __ STY T7 + 0 
.s6:
6772 : a5 55 __ LDA T4 + 0 
6774 : 85 12 __ STA P5 
6776 : a5 56 __ LDA T5 + 0 
6778 : 85 13 __ STA P6 
677a : a5 43 __ LDA T0 + 0 
677c : 85 54 __ STA T2 + 0 
677e : 29 3f __ AND #$3f
6780 : aa __ __ TAX
6781 : bd 40 7a LDA $7a40,x ; (lat_wave[0] + 0)
6784 : 85 14 __ STA P7 
6786 : a5 53 __ LDA T1 + 0 
6788 : 29 3f __ AND #$3f
678a : aa __ __ TAX
678b : bd 80 7a LDA $7a80,x ; (vert_wave[0] + 0)
678e : 85 15 __ STA P8 
6790 : 20 f2 6a JSR $6af2 ; (tunnel_render.s4 + 0)
.l7:
6793 : 2c 11 d0 BIT $d011 
6796 : 30 fb __ BMI $6793 ; (tunnel_run.l7 + 0)
.l8:
6798 : 2c 11 d0 BIT $d011 
679b : 10 fb __ BPL $6798 ; (tunnel_run.l8 + 0)
.s9:
679d : e6 53 __ INC T1 + 0 
679f : a6 54 __ LDX T2 + 0 
67a1 : e8 __ __ INX
67a2 : 86 43 __ STX T0 + 0 
67a4 : e6 56 __ INC T5 + 0 
67a6 : e6 55 __ INC T4 + 0 
67a8 : e6 57 __ INC T6 + 0 
67aa : d0 02 __ BNE $67ae ; (tunnel_run.s18 + 0)
.s17:
67ac : e6 58 __ INC T6 + 1 
.s18:
67ae : a5 58 __ LDA T6 + 1 
67b0 : c9 03 __ CMP #$03
67b2 : f0 03 __ BEQ $67b7 ; (tunnel_run.s11 + 0)
67b4 : 4c 2f 67 JMP $672f ; (tunnel_run.l5 + 0)
.s11:
67b7 : a5 57 __ LDA T6 + 0 
67b9 : c9 20 __ CMP #$20
67bb : d0 f7 __ BNE $67b4 ; (tunnel_run.s18 + 6)
.s10:
67bd : a9 00 __ LDA #$00
67bf : 85 0d __ STA P0 
67c1 : 85 0e __ STA P1 
67c3 : 85 10 __ STA P3 
67c5 : a9 36 __ LDA #$36
67c7 : 85 01 __ STA $01 
67c9 : 20 0b 0f JSR $0f0b ; (vic_setmode@proxy + 0)
67cc : a9 00 __ LDA #$00
67ce : 8d 20 d0 STA $d020 
67d1 : 8d 21 d0 STA $d021 
.s3:
67d4 : a2 06 __ LDX #$06
67d6 : bd df bf LDA $bfdf,x ; (tunnel_run@stack + 0)
67d9 : 95 53 __ STA T1 + 0,x 
67db : ca __ __ DEX
67dc : 10 f8 __ BPL $67d6 ; (tunnel_run.s3 + 2)
67de : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_build_tables: ; tunnel_build_tables()->void
; 157, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
67df : a9 00 __ LDA #$00
67e1 : 85 4d __ STA T4 + 0 
67e3 : a9 97 __ LDA #$97
67e5 : 85 49 __ STA T1 + 0 
67e7 : a9 ff __ LDA #$ff
67e9 : 85 4a __ STA T1 + 1 
.l5:
67eb : a9 00 __ LDA #$00
67ed : 85 4e __ STA T5 + 0 
67ef : a9 b1 __ LDA #$b1
67f1 : 85 4b __ STA T2 + 0 
67f3 : a9 ff __ LDA #$ff
.l6:
67f5 : 85 4c __ STA T2 + 1 
67f7 : 85 10 __ STA P3 
67f9 : a5 49 __ LDA T1 + 0 
67fb : 85 0d __ STA P0 
67fd : a5 4a __ LDA T1 + 1 
67ff : 85 0e __ STA P1 
6801 : a5 4b __ LDA T2 + 0 
6803 : 85 0f __ STA P2 
6805 : 20 6b 68 JSR $686b ; (iatan2_5.s4 + 0)
6808 : a6 4e __ LDX T5 + 0 
680a : 9d 00 8a STA $8a00,x ; (row_buf[0] + 0)
680d : a5 4b __ LDA T2 + 0 
680f : 85 0d __ STA P0 
6811 : a5 4c __ LDA T2 + 1 
6813 : 85 0e __ STA P1 
6815 : a5 49 __ LDA T1 + 0 
6817 : 85 0f __ STA P2 
6819 : a5 4a __ LDA T1 + 1 
681b : 85 10 __ STA P3 
681d : 20 4b 69 JSR $694b ; (idist_5.s4 + 0)
6820 : a6 4e __ LDX T5 + 0 
6822 : e8 __ __ INX
6823 : 86 4e __ STX T5 + 0 
6825 : 9d 4f 8a STA $8a4f,x ; (row_buf[0] + 79)
6828 : 18 __ __ CLC
6829 : a5 0d __ LDA P0 
682b : 69 02 __ ADC #$02
682d : 85 4b __ STA T2 + 0 
682f : a5 0e __ LDA P1 
6831 : 69 00 __ ADC #$00
6833 : e0 50 __ CPX #$50
6835 : 90 be __ BCC $67f5 ; (tunnel_build_tables.l6 + 0)
.s7:
6837 : a5 4d __ LDA T4 + 0 
6839 : 85 1b __ STA ACCU + 0 
683b : a9 d0 __ LDA #$d0
683d : 85 0d __ STA P0 
683f : a9 00 __ LDA #$00
6841 : 85 1c __ STA ACCU + 1 
6843 : 85 1d __ STA ACCU + 2 
6845 : 85 1e __ STA ACCU + 3 
6847 : a9 a0 __ LDA #$a0
6849 : 20 19 6e JSR $6e19 ; (mul32by8 + 0)
684c : 18 __ __ CLC
684d : a5 09 __ LDA WORK + 6 
684f : 69 20 __ ADC #$20
6851 : 85 10 __ STA P3 
6853 : a5 0a __ LDA WORK + 7 
6855 : 69 00 __ ADC #$00
6857 : 85 11 __ STA P4 
6859 : 20 ed 69 JSR $69ed ; (reu_dma@proxy + 0)
685c : e6 49 __ INC T1 + 0 
685e : d0 02 __ BNE $6862 ; (tunnel_build_tables.s9 + 0)
.s8:
6860 : e6 4a __ INC T1 + 1 
.s9:
6862 : e6 4d __ INC T4 + 0 
6864 : a5 4d __ LDA T4 + 0 
6866 : c9 6e __ CMP #$6e
6868 : 90 81 __ BCC $67eb ; (tunnel_build_tables.l5 + 0)
.s3:
686a : 60 __ __ RTS
--------------------------------------------------------------------
iatan2_5: ; iatan2_5(i16,i16)->u8
; 112, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
686b : a5 10 __ LDA P3 ; (x + 1)
686d : 05 0f __ ORA P2 ; (x + 0)
686f : d0 0a __ BNE $687b ; (iatan2_5.s5 + 0)
.s37:
6871 : 85 0f __ STA P2 ; (x + 0)
6873 : 85 10 __ STA P3 ; (x + 1)
6875 : a5 0d __ LDA P0 ; (y + 0)
6877 : 05 0e __ ORA P1 ; (y + 1)
6879 : f0 73 __ BEQ $68ee ; (iatan2_5.s3 + 0)
.s5:
687b : 24 10 __ BIT P3 ; (x + 1)
687d : 30 09 __ BMI $6888 ; (iatan2_5.s36 + 0)
.s6:
687f : a5 0f __ LDA P2 ; (x + 0)
6881 : 85 43 __ STA T1 + 0 
6883 : a5 10 __ LDA P3 ; (x + 1)
6885 : 4c 93 68 JMP $6893 ; (iatan2_5.s7 + 0)
.s36:
6888 : 38 __ __ SEC
6889 : a9 00 __ LDA #$00
688b : e5 0f __ SBC P2 ; (x + 0)
688d : 85 43 __ STA T1 + 0 
688f : a9 00 __ LDA #$00
6891 : e5 10 __ SBC P3 ; (x + 1)
.s7:
6893 : a8 __ __ TAY
6894 : 24 0e __ BIT P1 ; (y + 1)
6896 : 30 09 __ BMI $68a1 ; (iatan2_5.s35 + 0)
.s8:
6898 : a5 0d __ LDA P0 ; (y + 0)
689a : 85 45 __ STA T3 + 0 
689c : a5 0e __ LDA P1 ; (y + 1)
689e : 4c ac 68 JMP $68ac ; (iatan2_5.s9 + 0)
.s35:
68a1 : 38 __ __ SEC
68a2 : a9 00 __ LDA #$00
68a4 : e5 0d __ SBC P0 ; (y + 0)
68a6 : 85 45 __ STA T3 + 0 
68a8 : a9 00 __ LDA #$00
68aa : e5 0e __ SBC P1 ; (y + 1)
.s9:
68ac : 85 46 __ STA T3 + 1 
68ae : 98 __ __ TYA
68af : 30 4f __ BMI $6900 ; (iatan2_5.s10 + 0)
.s34:
68b1 : c4 46 __ CPY T3 + 1 
68b3 : d0 04 __ BNE $68b9 ; (iatan2_5.s33 + 0)
.s32:
68b5 : a5 43 __ LDA T1 + 0 
68b7 : c5 45 __ CMP T3 + 0 
.s33:
68b9 : 90 45 __ BCC $6900 ; (iatan2_5.s10 + 0)
.s21:
68bb : 84 04 __ STY WORK + 1 
68bd : 24 0e __ BIT P1 ; (y + 1)
68bf : 30 04 __ BMI $68c5 ; (iatan2_5.s23 + 0)
.s22:
68c1 : a9 ff __ LDA #$ff
68c3 : b0 02 __ BCS $68c7 ; (iatan2_5.s24 + 0)
.s23:
68c5 : a9 00 __ LDA #$00
.s24:
68c7 : 85 44 __ STA T2 + 0 
68c9 : a5 46 __ LDA T3 + 1 
68cb : 06 45 __ ASL T3 + 0 
68cd : 2a __ __ ROL
68ce : 06 45 __ ASL T3 + 0 
68d0 : 2a __ __ ROL
68d1 : 06 45 __ ASL T3 + 0 
68d3 : 2a __ __ ROL
68d4 : 85 1c __ STA ACCU + 1 
68d6 : a5 43 __ LDA T1 + 0 
68d8 : 85 03 __ STA WORK + 0 
68da : 20 a0 72 JSR $72a0 ; (divs16@proxy + 0)
68dd : a5 10 __ LDA P3 ; (x + 1)
68df : 30 04 __ BMI $68e5 ; (iatan2_5.s25 + 0)
.s31:
68e1 : 05 0f __ ORA P2 ; (x + 0)
68e3 : d0 10 __ BNE $68f5 ; (iatan2_5.s28 + 0)
.s25:
68e5 : 24 44 __ BIT T2 + 0 
68e7 : 30 06 __ BMI $68ef ; (iatan2_5.s27 + 0)
.s26:
68e9 : 18 __ __ CLC
68ea : a5 1b __ LDA ACCU + 0 
68ec : 69 10 __ ADC #$10
.s3:
68ee : 60 __ __ RTS
.s27:
68ef : a9 10 __ LDA #$10
.s38:
68f1 : 38 __ __ SEC
68f2 : e5 1b __ SBC ACCU + 0 
68f4 : 60 __ __ RTS
.s28:
68f5 : 24 44 __ BIT T2 + 0 
68f7 : 10 03 __ BPL $68fc ; (iatan2_5.s29 + 0)
.s30:
68f9 : a5 1b __ LDA ACCU + 0 
68fb : 60 __ __ RTS
.s29:
68fc : a9 20 __ LDA #$20
68fe : d0 f1 __ BNE $68f1 ; (iatan2_5.s38 + 0)
.s10:
6900 : 24 10 __ BIT P3 ; (x + 1)
6902 : 30 04 __ BMI $6908 ; (iatan2_5.s12 + 0)
.s11:
6904 : a9 ff __ LDA #$ff
6906 : d0 02 __ BNE $690a ; (iatan2_5.s13 + 0)
.s12:
6908 : a9 00 __ LDA #$00
.s13:
690a : 85 47 __ STA T4 + 0 
690c : 98 __ __ TYA
690d : 06 43 __ ASL T1 + 0 
690f : 2a __ __ ROL
6910 : 06 43 __ ASL T1 + 0 
6912 : 2a __ __ ROL
6913 : 06 43 __ ASL T1 + 0 
6915 : 2a __ __ ROL
6916 : 85 1c __ STA ACCU + 1 
6918 : a5 43 __ LDA T1 + 0 
691a : 85 1b __ STA ACCU + 0 
691c : a5 45 __ LDA T3 + 0 
691e : 85 03 __ STA WORK + 0 
6920 : a5 46 __ LDA T3 + 1 
6922 : 85 04 __ STA WORK + 1 
6924 : 20 9d 6e JSR $6e9d ; (divs16 + 0)
6927 : a5 0e __ LDA P1 ; (y + 1)
6929 : 30 04 __ BMI $692f ; (iatan2_5.s14 + 0)
.s20:
692b : 05 0d __ ORA P0 ; (y + 0)
692d : d0 0e __ BNE $693d ; (iatan2_5.s17 + 0)
.s14:
692f : 24 47 __ BIT T4 + 0 
6931 : 10 06 __ BPL $6939 ; (iatan2_5.s15 + 0)
.s16:
6933 : 18 __ __ CLC
6934 : a5 1b __ LDA ACCU + 0 
6936 : 69 18 __ ADC #$18
6938 : 60 __ __ RTS
.s15:
6939 : a9 18 __ LDA #$18
693b : d0 b4 __ BNE $68f1 ; (iatan2_5.s38 + 0)
.s17:
693d : 24 47 __ BIT T4 + 0 
693f : 10 04 __ BPL $6945 ; (iatan2_5.s18 + 0)
.s19:
6941 : a9 08 __ LDA #$08
6943 : d0 ac __ BNE $68f1 ; (iatan2_5.s38 + 0)
.s18:
6945 : 18 __ __ CLC
6946 : a5 1b __ LDA ACCU + 0 
6948 : 69 08 __ ADC #$08
694a : 60 __ __ RTS
--------------------------------------------------------------------
idist_5: ; idist_5(i16,i16)->u8
; 134, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
694b : a5 0f __ LDA P2 ; (dy + 0)
694d : 85 03 __ STA WORK + 0 
694f : 85 1b __ STA ACCU + 0 
6951 : a5 10 __ LDA P3 ; (dy + 1)
6953 : 85 04 __ STA WORK + 1 
6955 : 85 1c __ STA ACCU + 1 
6957 : 20 57 6e JSR $6e57 ; (mul16 + 0)
695a : a5 05 __ LDA WORK + 2 
695c : 85 43 __ STA T0 + 0 
695e : a5 06 __ LDA WORK + 3 
6960 : 85 44 __ STA T0 + 1 
6962 : a5 0d __ LDA P0 ; (dx + 0)
6964 : 85 03 __ STA WORK + 0 
6966 : 85 1b __ STA ACCU + 0 
6968 : a5 0e __ LDA P1 ; (dx + 1)
696a : 85 04 __ STA WORK + 1 
696c : 85 1c __ STA ACCU + 1 
696e : 20 57 6e JSR $6e57 ; (mul16 + 0)
6971 : 18 __ __ CLC
6972 : a5 05 __ LDA WORK + 2 
6974 : 65 43 __ ADC T0 + 0 
6976 : 85 43 __ STA T0 + 0 
6978 : a5 06 __ LDA WORK + 3 
697a : 65 44 __ ADC T0 + 1 
697c : 85 44 __ STA T0 + 1 
697e : 05 43 __ ORA T0 + 0 
6980 : f0 64 __ BEQ $69e6 ; (idist_5.s11 + 0)
.s5:
6982 : a5 44 __ LDA T0 + 1 
6984 : 4a __ __ LSR
6985 : 85 46 __ STA T1 + 1 
6987 : a5 43 __ LDA T0 + 0 
6989 : 6a __ __ ROR
698a : 85 45 __ STA T1 + 0 
698c : 05 46 __ ORA T1 + 1 
698e : d0 08 __ BNE $6998 ; (idist_5.l6 + 0)
.s10:
6990 : a9 01 __ LDA #$01
6992 : 85 45 __ STA T1 + 0 
6994 : a9 00 __ LDA #$00
6996 : 85 46 __ STA T1 + 1 
.l6:
6998 : a5 45 __ LDA T1 + 0 
699a : 85 03 __ STA WORK + 0 
699c : 85 47 __ STA T2 + 0 
699e : a5 46 __ LDA T1 + 1 
69a0 : 85 04 __ STA WORK + 1 
69a2 : 85 48 __ STA T2 + 1 
69a4 : a5 43 __ LDA T0 + 0 
69a6 : 85 1b __ STA ACCU + 0 
69a8 : a5 44 __ LDA T0 + 1 
69aa : 85 1c __ STA ACCU + 1 
69ac : 20 d4 6e JSR $6ed4 ; (divmod + 0)
69af : 18 __ __ CLC
69b0 : a5 1b __ LDA ACCU + 0 
69b2 : 65 45 __ ADC T1 + 0 
69b4 : 85 45 __ STA T1 + 0 
69b6 : a5 1c __ LDA ACCU + 1 
69b8 : 65 46 __ ADC T1 + 1 
69ba : 4a __ __ LSR
69bb : 85 46 __ STA T1 + 1 
69bd : 66 45 __ ROR T1 + 0 
69bf : c5 48 __ CMP T2 + 1 
69c1 : 90 d5 __ BCC $6998 ; (idist_5.l6 + 0)
.s12:
69c3 : d0 24 __ BNE $69e9 ; (idist_5.s13 + 0)
.s9:
69c5 : a5 45 __ LDA T1 + 0 
69c7 : c5 47 __ CMP T2 + 0 
69c9 : 90 cd __ BCC $6998 ; (idist_5.l6 + 0)
.s7:
69cb : 85 03 __ STA WORK + 0 
69cd : a9 20 __ LDA #$20
69cf : 85 1b __ STA ACCU + 0 
69d1 : a9 03 __ LDA #$03
69d3 : 85 1c __ STA ACCU + 1 
69d5 : a5 46 __ LDA T1 + 1 
69d7 : 85 04 __ STA WORK + 1 
69d9 : 20 d4 6e JSR $6ed4 ; (divmod + 0)
69dc : a5 1c __ LDA ACCU + 1 
69de : d0 06 __ BNE $69e6 ; (idist_5.s11 + 0)
.s8:
69e0 : a5 1b __ LDA ACCU + 0 
69e2 : c9 20 __ CMP #$20
69e4 : 90 02 __ BCC $69e8 ; (idist_5.s3 + 0)
.s11:
69e6 : a9 1f __ LDA #$1f
.s3:
69e8 : 60 __ __ RTS
.s13:
69e9 : a5 45 __ LDA T1 + 0 
69eb : b0 de __ BCS $69cb ; (idist_5.s7 + 0)
--------------------------------------------------------------------
reu_dma@proxy: ; reu_dma@proxy
69ed : a5 07 __ LDA WORK + 4 
69ef : 85 0e __ STA P1 
69f1 : a5 08 __ LDA WORK + 5 
69f3 : 85 0f __ STA P2 
--------------------------------------------------------------------
reu_dma: ; reu_dma(u8,u32,void*,u8)->void
;  94, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
69f5 : a9 00 __ LDA #$00
69f7 : 8d 02 df STA $df02 
69fa : a9 8a __ LDA #$8a
69fc : 8d 03 df STA $df03 
69ff : a5 0e __ LDA P1 ; (reu_addr + 0)
6a01 : 8d 04 df STA $df04 
6a04 : a5 0f __ LDA P2 ; (reu_addr + 1)
6a06 : 8d 05 df STA $df05 
6a09 : a5 10 __ LDA P3 ; (reu_addr + 2)
6a0b : 8d 06 df STA $df06 
6a0e : a9 a0 __ LDA #$a0
6a10 : 8d 07 df STA $df07 
6a13 : a9 00 __ LDA #$00
6a15 : 8d 08 df STA $df08 
6a18 : a5 0d __ LDA P0 ; (cmd + 0)
6a1a : 8d 01 df STA $df01 
.s3:
6a1d : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_build_tex: ; tunnel_build_tex()->void
; 179, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6a1e : a9 00 __ LDA #$00
6a20 : 85 1b __ STA ACCU + 0 
.l5:
6a22 : 29 04 __ AND #$04
6a24 : 4a __ __ LSR
6a25 : 4a __ __ LSR
6a26 : f0 02 __ BEQ $6a2a ; (tunnel_build_tex.s14 + 0)
.s13:
6a28 : a9 04 __ LDA #$04
.s14:
6a2a : 85 43 __ STA T1 + 0 
6a2c : a5 1b __ LDA ACCU + 0 
6a2e : 0a __ __ ASL
6a2f : 0a __ __ ASL
6a30 : 0a __ __ ASL
6a31 : 0a __ __ ASL
6a32 : 85 45 __ STA T2 + 0 
6a34 : a9 00 __ LDA #$00
6a36 : 85 1c __ STA ACCU + 1 
6a38 : 2a __ __ ROL
6a39 : 06 45 __ ASL T2 + 0 
6a3b : 2a __ __ ROL
6a3c : 85 46 __ STA T2 + 1 
6a3e : a5 1b __ LDA ACCU + 0 
6a40 : 29 03 __ AND #$03
6a42 : f0 3b __ BEQ $6a7f ; (tunnel_build_tex.s11 + 0)
.l6:
6a44 : 18 __ __ CLC
6a45 : a5 43 __ LDA T1 + 0 
6a47 : 65 1c __ ADC ACCU + 1 
6a49 : 29 1f __ AND #$1f
6a4b : aa __ __ TAX
6a4c : 29 07 __ AND #$07
6a4e : d0 04 __ BNE $6a54 ; (tunnel_build_tex.s7 + 0)
.s10:
6a50 : a9 02 __ LDA #$02
6a52 : d0 05 __ BNE $6a59 ; (tunnel_build_tex.s8 + 0)
.s7:
6a54 : 8a __ __ TXA
6a55 : 29 04 __ AND #$04
6a57 : 4a __ __ LSR
6a58 : 4a __ __ LSR
.s8:
6a59 : aa __ __ TAX
6a5a : a5 45 __ LDA T2 + 0 
6a5c : 05 1c __ ORA ACCU + 1 
6a5e : 18 __ __ CLC
6a5f : 69 a0 __ ADC #$a0
6a61 : 85 47 __ STA T5 + 0 
6a63 : a9 8a __ LDA #$8a
6a65 : 65 46 __ ADC T2 + 1 
6a67 : 85 48 __ STA T5 + 1 
6a69 : 8a __ __ TXA
6a6a : a0 00 __ LDY #$00
6a6c : 91 47 __ STA (T5 + 0),y 
6a6e : e6 1c __ INC ACCU + 1 
6a70 : a5 1c __ LDA ACCU + 1 
6a72 : c9 20 __ CMP #$20
6a74 : d0 ce __ BNE $6a44 ; (tunnel_build_tex.l6 + 0)
.s9:
6a76 : e6 1b __ INC ACCU + 0 
6a78 : a5 1b __ LDA ACCU + 0 
6a7a : c9 20 __ CMP #$20
6a7c : d0 a4 __ BNE $6a22 ; (tunnel_build_tex.l5 + 0)
.s3:
6a7e : 60 __ __ RTS
.s11:
6a7f : 85 43 __ STA T1 + 0 
6a81 : a6 45 __ LDX T2 + 0 
.l12:
6a83 : 8a __ __ TXA
6a84 : 05 1c __ ORA ACCU + 1 
6a86 : 18 __ __ CLC
6a87 : 69 a0 __ ADC #$a0
6a89 : a8 __ __ TAY
6a8a : a9 8a __ LDA #$8a
6a8c : 65 46 __ ADC T2 + 1 
6a8e : 85 44 __ STA T1 + 1 
6a90 : a9 03 __ LDA #$03
6a92 : 91 43 __ STA (T1 + 0),y 
6a94 : e6 1c __ INC ACCU + 1 
6a96 : a5 1c __ LDA ACCU + 1 
6a98 : c9 20 __ CMP #$20
6a9a : d0 e7 __ BNE $6a83 ; (tunnel_build_tex.l12 + 0)
6a9c : f0 d8 __ BEQ $6a76 ; (tunnel_build_tex.s9 + 0)
--------------------------------------------------------------------
tun_init: ; tun_init()->void
; 263, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6a9e : a9 00 __ LDA #$00
6aa0 : 85 0f __ STA P2 
6aa2 : 85 10 __ STA P3 
6aa4 : 85 43 __ STA T0 + 0 
6aa6 : 85 0d __ STA P0 
6aa8 : a9 35 __ LDA #$35
6aaa : 85 01 __ STA $01 
6aac : 20 91 72 JSR $7291 ; (memset@proxy + 0)
6aaf : a9 c0 __ LDA #$c0
6ab1 : 85 44 __ STA T0 + 1 
6ab3 : a9 00 __ LDA #$00
6ab5 : 85 1f __ STA ADDR + 0 
6ab7 : f0 02 __ BEQ $6abb ; (tun_init.l7 + 0)
.s8:
6ab9 : e6 44 __ INC T0 + 1 
.l7:
6abb : a9 f9 __ LDA #$f9
6abd : a0 00 __ LDY #$00
6abf : 91 43 __ STA (T0 + 0),y 
6ac1 : 18 __ __ CLC
6ac2 : a5 44 __ LDA T0 + 1 
6ac4 : 69 18 __ ADC #$18
6ac6 : 85 20 __ STA ADDR + 1 
6ac8 : a9 01 __ LDA #$01
6aca : a4 43 __ LDY T0 + 0 
6acc : 91 1f __ STA (ADDR + 0),y 
6ace : 98 __ __ TYA
6acf : 18 __ __ CLC
6ad0 : 69 01 __ ADC #$01
6ad2 : 85 43 __ STA T0 + 0 
6ad4 : b0 e3 __ BCS $6ab9 ; (tun_init.s8 + 0)
.s9:
6ad6 : c9 e8 __ CMP #$e8
6ad8 : d0 e1 __ BNE $6abb ; (tun_init.l7 + 0)
.s6:
6ada : a5 44 __ LDA T0 + 1 
6adc : c9 c3 __ CMP #$c3
6ade : d0 db __ BNE $6abb ; (tun_init.l7 + 0)
.s5:
6ae0 : a9 00 __ LDA #$00
6ae2 : 85 0e __ STA P1 
6ae4 : 85 10 __ STA P3 
6ae6 : 20 e6 72 JSR $72e6 ; (vic_setmode@proxy + 0)
6ae9 : a9 00 __ LDA #$00
6aeb : 8d 21 d0 STA $d021 
6aee : 8d 20 d0 STA $d020 
.s3:
6af1 : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_render: ; tunnel_render(u8,u8,i8,i8)->void
; 206, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6af2 : 18 __ __ CLC
6af3 : a5 15 __ LDA P8 ; (vert_j + 0)
6af5 : 69 05 __ ADC #$05
6af7 : 85 51 __ STA T12 + 0 
6af9 : a9 00 __ LDA #$00
6afb : 85 52 __ STA T13 + 0 
6afd : a9 d1 __ LDA #$d1
6aff : 85 0d __ STA P0 
.l5:
6b01 : a5 51 __ LDA T12 + 0 
6b03 : 85 1b __ STA ACCU + 0 
6b05 : a9 00 __ LDA #$00
6b07 : 85 1c __ STA ACCU + 1 
6b09 : 85 1d __ STA ACCU + 2 
6b0b : 85 1e __ STA ACCU + 3 
6b0d : a9 a0 __ LDA #$a0
6b0f : 20 19 6e JSR $6e19 ; (mul32by8 + 0)
6b12 : 18 __ __ CLC
6b13 : a5 09 __ LDA WORK + 6 
6b15 : 69 20 __ ADC #$20
6b17 : 85 10 __ STA P3 
6b19 : a5 0a __ LDA WORK + 7 
6b1b : 69 00 __ ADC #$00
6b1d : 85 11 __ STA P4 
6b1f : 20 ed 69 JSR $69ed ; (reu_dma@proxy + 0)
6b22 : a5 52 __ LDA T13 + 0 
6b24 : 4a __ __ LSR
6b25 : 4a __ __ LSR
6b26 : 4a __ __ LSR
6b27 : aa __ __ TAX
6b28 : a5 52 __ LDA T13 + 0 
6b2a : 29 07 __ AND #$07
6b2c : 1d 36 72 ORA $7236,x ; (__multab320L + 0)
6b2f : 85 43 __ STA T1 + 0 
6b31 : bd 43 72 LDA $7243,x ; (__multab320H + 0)
6b34 : 09 e0 __ ORA #$e0
6b36 : 85 44 __ STA T1 + 1 
6b38 : 38 __ __ SEC
6b39 : a9 c7 __ LDA #$c7
6b3b : e5 52 __ SBC T13 + 0 
6b3d : aa __ __ TAX
6b3e : 29 07 __ AND #$07
6b40 : 85 1c __ STA ACCU + 1 
6b42 : 8a __ __ TXA
6b43 : 4a __ __ LSR
6b44 : 4a __ __ LSR
6b45 : 4a __ __ LSR
6b46 : 85 1b __ STA ACCU + 0 
6b48 : 0a __ __ ASL
6b49 : 0a __ __ ASL
6b4a : 65 1b __ ADC ACCU + 0 
6b4c : 4a __ __ LSR
6b4d : 6a __ __ ROR
6b4e : aa __ __ TAX
6b4f : 29 80 __ AND #$80
6b51 : 6a __ __ ROR
6b52 : 05 1c __ ORA ACCU + 1 
6b54 : 85 1b __ STA ACCU + 0 
6b56 : 8a __ __ TXA
6b57 : 29 3f __ AND #$3f
6b59 : 69 e0 __ ADC #$e0
6b5b : 85 1c __ STA ACCU + 1 
6b5d : a9 00 __ LDA #$00
6b5f : 85 1d __ STA ACCU + 2 
.l6:
6b61 : 0a __ __ ASL
6b62 : 18 __ __ CLC
6b63 : 65 14 __ ADC P7 ; (lat_j + 0)
6b65 : 85 45 __ STA T4 + 0 
6b67 : aa __ __ TAX
6b68 : a8 __ __ TAY
6b69 : c8 __ __ INY
6b6a : 24 45 __ BIT T4 + 0 
6b6c : 10 03 __ BPL $6b71 ; (tunnel_render.s7 + 0)
6b6e : 4c 7e 6c JMP $6c7e ; (tunnel_render.s13 + 0)
.s7:
6b71 : a9 4f __ LDA #$4f
6b73 : c5 45 __ CMP T4 + 0 
6b75 : b0 02 __ BCS $6b79 ; (tunnel_render.s8 + 0)
.s12:
6b77 : 85 45 __ STA T4 + 0 
.s8:
6b79 : 8a __ __ TXA
6b7a : 30 06 __ BMI $6b82 ; (tunnel_render.s9 + 0)
.s20:
6b7c : c9 4f __ CMP #$4f
6b7e : 90 02 __ BCC $6b82 ; (tunnel_render.s9 + 0)
.s11:
6b80 : a0 4f __ LDY #$4f
.s9:
6b82 : 84 47 __ STY T5 + 0 
6b84 : a5 13 __ LDA P6 ; (t_dist + 0)
6b86 : a6 45 __ LDX T4 + 0 
6b88 : 18 __ __ CLC
6b89 : 7d 50 8a ADC $8a50,x ; (row_buf[0] + 80)
6b8c : 29 1f __ AND #$1f
6b8e : 0a __ __ ASL
6b8f : 0a __ __ ASL
6b90 : 0a __ __ ASL
6b91 : 0a __ __ ASL
6b92 : 85 49 __ STA T6 + 0 
6b94 : a9 00 __ LDA #$00
6b96 : 2a __ __ ROL
6b97 : 06 49 __ ASL T6 + 0 
6b99 : 2a __ __ ROL
6b9a : 85 4a __ STA T6 + 1 
6b9c : bd 00 8a LDA $8a00,x ; (row_buf[0] + 0)
6b9f : 85 45 __ STA T4 + 0 
6ba1 : 65 12 __ ADC P5 ; (t_ang + 0)
6ba3 : 29 1f __ AND #$1f
6ba5 : 05 49 __ ORA T6 + 0 
6ba7 : 18 __ __ CLC
6ba8 : 69 a0 __ ADC #$a0
6baa : 85 4d __ STA T9 + 0 
6bac : a9 8a __ LDA #$8a
6bae : 65 4a __ ADC T6 + 1 
6bb0 : 85 4e __ STA T9 + 1 
6bb2 : a0 00 __ LDY #$00
6bb4 : b1 4d __ LDA (T9 + 0),y 
6bb6 : aa __ __ TAX
6bb7 : 4a __ __ LSR
6bb8 : 85 50 __ STA T10 + 1 
6bba : 98 __ __ TYA
6bbb : 6a __ __ ROR
6bbc : 66 50 __ ROR T10 + 1 
6bbe : 6a __ __ ROR
6bbf : 85 4f __ STA T10 + 0 
6bc1 : 8a __ __ TXA
6bc2 : 0a __ __ ASL
6bc3 : 0a __ __ ASL
6bc4 : 0a __ __ ASL
6bc5 : 0a __ __ ASL
6bc6 : 05 4f __ ORA T10 + 0 
6bc8 : 85 4d __ STA T9 + 0 
6bca : a6 47 __ LDX T5 + 0 
6bcc : bd 50 8a LDA $8a50,x ; (row_buf[0] + 80)
6bcf : 18 __ __ CLC
6bd0 : 65 13 __ ADC P6 ; (t_dist + 0)
6bd2 : 29 1f __ AND #$1f
6bd4 : 0a __ __ ASL
6bd5 : 0a __ __ ASL
6bd6 : 0a __ __ ASL
6bd7 : 0a __ __ ASL
6bd8 : 85 4b __ STA T7 + 0 
6bda : 98 __ __ TYA
6bdb : 2a __ __ ROL
6bdc : 06 4b __ ASL T7 + 0 
6bde : 2a __ __ ROL
6bdf : 85 4c __ STA T7 + 1 
6be1 : bd 00 8a LDA $8a00,x ; (row_buf[0] + 0)
6be4 : 85 47 __ STA T5 + 0 
6be6 : 65 12 __ ADC P5 ; (t_ang + 0)
6be8 : 29 1f __ AND #$1f
6bea : 05 4b __ ORA T7 + 0 
6bec : 18 __ __ CLC
6bed : 69 a0 __ ADC #$a0
6bef : 85 4f __ STA T10 + 0 
6bf1 : a9 8a __ LDA #$8a
6bf3 : 65 4c __ ADC T7 + 1 
6bf5 : 85 50 __ STA T10 + 1 
6bf7 : b1 4f __ LDA (T10 + 0),y 
6bf9 : 0a __ __ ASL
6bfa : 0a __ __ ASL
6bfb : 05 4d __ ORA T9 + 0 
6bfd : 11 4f __ ORA (T10 + 0),y 
6bff : 91 43 __ STA (T1 + 0),y 
6c01 : 38 __ __ SEC
6c02 : a9 20 __ LDA #$20
6c04 : e5 45 __ SBC T4 + 0 
6c06 : 18 __ __ CLC
6c07 : 65 12 __ ADC P5 ; (t_ang + 0)
6c09 : 29 1f __ AND #$1f
6c0b : 05 49 __ ORA T6 + 0 
6c0d : 18 __ __ CLC
6c0e : 69 a0 __ ADC #$a0
6c10 : 85 45 __ STA T4 + 0 
6c12 : a9 8a __ LDA #$8a
6c14 : 65 4a __ ADC T6 + 1 
6c16 : 85 46 __ STA T4 + 1 
6c18 : b1 45 __ LDA (T4 + 0),y 
6c1a : aa __ __ TAX
6c1b : 4a __ __ LSR
6c1c : 85 4a __ STA T6 + 1 
6c1e : 98 __ __ TYA
6c1f : 6a __ __ ROR
6c20 : 66 4a __ ROR T6 + 1 
6c22 : 6a __ __ ROR
6c23 : 85 49 __ STA T6 + 0 
6c25 : 8a __ __ TXA
6c26 : 0a __ __ ASL
6c27 : 0a __ __ ASL
6c28 : 0a __ __ ASL
6c29 : 0a __ __ ASL
6c2a : 05 49 __ ORA T6 + 0 
6c2c : 85 45 __ STA T4 + 0 
6c2e : 38 __ __ SEC
6c2f : a9 20 __ LDA #$20
6c31 : e5 47 __ SBC T5 + 0 
6c33 : 18 __ __ CLC
6c34 : 65 12 __ ADC P5 ; (t_ang + 0)
6c36 : 29 1f __ AND #$1f
6c38 : 05 4b __ ORA T7 + 0 
6c3a : 18 __ __ CLC
6c3b : 69 a0 __ ADC #$a0
6c3d : 85 47 __ STA T5 + 0 
6c3f : a9 8a __ LDA #$8a
6c41 : 65 4c __ ADC T7 + 1 
6c43 : 85 48 __ STA T5 + 1 
6c45 : b1 47 __ LDA (T5 + 0),y 
6c47 : 0a __ __ ASL
6c48 : 0a __ __ ASL
6c49 : 05 45 __ ORA T4 + 0 
6c4b : 11 47 __ ORA (T5 + 0),y 
6c4d : 91 1b __ STA (ACCU + 0),y 
6c4f : 18 __ __ CLC
6c50 : a5 43 __ LDA T1 + 0 
6c52 : 69 08 __ ADC #$08
6c54 : 85 43 __ STA T1 + 0 
6c56 : 90 03 __ BCC $6c5b ; (tunnel_render.s17 + 0)
.s16:
6c58 : e6 44 __ INC T1 + 1 
6c5a : 18 __ __ CLC
.s17:
6c5b : a5 1b __ LDA ACCU + 0 
6c5d : 69 08 __ ADC #$08
6c5f : 85 1b __ STA ACCU + 0 
6c61 : 90 02 __ BCC $6c65 ; (tunnel_render.s19 + 0)
.s18:
6c63 : e6 1c __ INC ACCU + 1 
.s19:
6c65 : e6 1d __ INC ACCU + 2 
6c67 : a5 1d __ LDA ACCU + 2 
6c69 : c9 28 __ CMP #$28
6c6b : f0 03 __ BEQ $6c70 ; (tunnel_render.s10 + 0)
6c6d : 4c 61 6b JMP $6b61 ; (tunnel_render.l6 + 0)
.s10:
6c70 : e6 51 __ INC T12 + 0 
6c72 : e6 52 __ INC T13 + 0 
6c74 : a5 52 __ LDA T13 + 0 
6c76 : c9 64 __ CMP #$64
6c78 : f0 03 __ BEQ $6c7d ; (tunnel_render.s3 + 0)
6c7a : 4c 01 6b JMP $6b01 ; (tunnel_render.l5 + 0)
.s3:
6c7d : 60 __ __ RTS
.s13:
6c7e : a9 00 __ LDA #$00
6c80 : 85 45 __ STA T4 + 0 
6c82 : 8a __ __ TXA
6c83 : 30 03 __ BMI $6c88 ; (tunnel_render.s15 + 0)
6c85 : 4c 7c 6b JMP $6b7c ; (tunnel_render.s20 + 0)
.s15:
6c88 : e0 ff __ CPX #$ff
6c8a : 90 03 __ BCC $6c8f ; (tunnel_render.s14 + 0)
6c8c : 4c 79 6b JMP $6b79 ; (tunnel_render.s8 + 0)
.s14:
6c8f : a0 00 __ LDY #$00
6c91 : 4c 82 6b JMP $6b82 ; (tunnel_render.s9 + 0)
--------------------------------------------------------------------
modplay_stop: ; modplay_stop()->void
; 249, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s4:
6c94 : 78 __ __ SEI
6c95 : a9 00 __ LDA #$00
6c97 : 8d c8 82 STA $82c8 ; (modplay.active + 0)
6c9a : 8d 20 df STA $df20 
6c9d : 8d 40 df STA $df40 
6ca0 : 8d 60 df STA $df60 
6ca3 : 8d 80 df STA $df80 
6ca6 : ad fe 73 LDA $73fe ; (mod_saved_irq[0] + 0)
6ca9 : 8d 14 03 STA $0314 
6cac : ad ff 73 LDA $73ff ; (mod_saved_irq[0] + 1)
6caf : 8d 15 03 STA $0315 
6cb2 : a9 7f __ LDA #$7f
6cb4 : 8d 0d dc STA $dc0d 
6cb7 : a9 25 __ LDA #$25
6cb9 : 8d 04 dc STA $dc04 
6cbc : a9 4d __ LDA #$4d
6cbe : 8d 05 dc STA $dc05 
6cc1 : a9 81 __ LDA #$81
6cc3 : 8d 0d dc STA $dc0d 
6cc6 : a9 01 __ LDA #$01
6cc8 : 8d 0e dc STA $dc0e 
6ccb : 58 __ __ CLI
.s3:
6ccc : 60 __ __ RTS
--------------------------------------------------------------------
6ccd : __ __ __ BYT 65 4e 44 20 4f 46 20 64 45 4d 4f 20 73 45 51 55 : eND OF dEMO sEQU
6cdd : __ __ __ BYT 45 4e 43 45 00                                  : ENCE.
--------------------------------------------------------------------
6ce2 : __ __ __ BYT 64 45 4d 4f 20 53 45 51 55 45 4e 43 45 20 43 4f : dEMO SEQUENCE CO
6cf2 : __ __ __ BYT 4d 50 4c 45 54 45 2e 00                         : MPLETE..
--------------------------------------------------------------------
6cfa : __ __ __ BYT 67 45 41 52 20 00                               : gEAR .
--------------------------------------------------------------------
6d00 : __ __ __ BYT 31 20 54 4f 20 36 34 20 6d 68 5a 2c 20 31 36 20 : 1 TO 64 mhZ, 16 
6d10 : __ __ __ BYT 53 54 45 50 53 00                               : STEPS.
--------------------------------------------------------------------
6d16 : __ __ __ BYT 62 41 4c 4c 20 00                               : bALL .
--------------------------------------------------------------------
6d1c : __ __ __ BYT 33 64 20 42 41 4c 4c 20 2b 20 47 52 49 44 00    : 3d BALL + GRID.
--------------------------------------------------------------------
6d2b : __ __ __ BYT 76 45 43 54 20 00                               : vECT .
--------------------------------------------------------------------
6d31 : __ __ __ BYT 33 64 20 57 49 52 45 46 52 41 4d 45 20 43 55 42 : 3d WIREFRAME CUB
6d41 : __ __ __ BYT 45 00                                           : E.
--------------------------------------------------------------------
6d43 : __ __ __ BYT 70 4c 41 53 20 00                               : pLAS .
--------------------------------------------------------------------
6d49 : __ __ __ BYT 70 4c 41 53 4d 41 20 49 4e 54 45 52 46 45 52 45 : pLASMA INTERFERE
6d59 : __ __ __ BYT 4e 43 45 00                                     : NCE.
--------------------------------------------------------------------
6d5d : __ __ __ BYT 66 52 41 43 54 00                               : fRACT.
--------------------------------------------------------------------
6d63 : __ __ __ BYT 6d 41 4e 44 45 4c 42 52 4f 54 20 6d 63 20 46 52 : mANDELBROT mc FR
6d73 : __ __ __ BYT 41 43 54 41 4c 00                               : ACTAL.
--------------------------------------------------------------------
6d79 : __ __ __ BYT 74 55 4e 4c 20 00                               : tUNL .
--------------------------------------------------------------------
6d7f : __ __ __ BYT 33 64 20 54 45 58 54 55 52 45 20 54 55 4e 4e 45 : 3d TEXTURE TUNNE
6d8f : __ __ __ BYT 4c 00                                           : L.
--------------------------------------------------------------------
6d91 : __ __ __ BYT 34 45 56 2e 4d 4f 44 3a 20 46 4f 52 45 56 45 52 : 4EV.MOD: FOREVER
6da1 : __ __ __ BYT 20 59 4f 55 4e 47 00                            :  YOUNG.
--------------------------------------------------------------------
6da8 : __ __ __ BYT 75 4c 54 49 4d 41 54 45 20 36 34 20 41 54 20 36 : uLTIMATE 64 AT 6
6db8 : __ __ __ BYT 34 20 6d 68 5a 20 54 55 52 42 4f 3a 00          : 4 mhZ TURBO:.
--------------------------------------------------------------------
6dc5 : __ __ __ BYT 54 48 45 20 46 41 53 54 45 53 54 20 63 36 34 20 : THE FASTEST c64 
6dd5 : __ __ __ BYT 43 4f 4d 50 41 54 49 42 4c 45 2e 00             : COMPATIBLE..
--------------------------------------------------------------------
mul16by8: ; mul16by8
6de1 : 4a __ __ LSR
6de2 : f0 2e __ BEQ $6e12 ; (mul16by8 + 49)
6de4 : a2 00 __ LDX #$00
6de6 : a0 00 __ LDY #$00
6de8 : 90 13 __ BCC $6dfd ; (mul16by8 + 28)
6dea : a4 1b __ LDY ACCU + 0 
6dec : a6 1c __ LDX ACCU + 1 
6dee : b0 0d __ BCS $6dfd ; (mul16by8 + 28)
6df0 : 85 02 __ STA $02 
6df2 : 18 __ __ CLC
6df3 : 98 __ __ TYA
6df4 : 65 1b __ ADC ACCU + 0 
6df6 : a8 __ __ TAY
6df7 : 8a __ __ TXA
6df8 : 65 1c __ ADC ACCU + 1 
6dfa : aa __ __ TAX
6dfb : a5 02 __ LDA $02 
6dfd : 06 1b __ ASL ACCU + 0 
6dff : 26 1c __ ROL ACCU + 1 
6e01 : 4a __ __ LSR
6e02 : 90 f9 __ BCC $6dfd ; (mul16by8 + 28)
6e04 : d0 ea __ BNE $6df0 ; (mul16by8 + 15)
6e06 : 18 __ __ CLC
6e07 : 98 __ __ TYA
6e08 : 65 1b __ ADC ACCU + 0 
6e0a : 85 1b __ STA ACCU + 0 
6e0c : 8a __ __ TXA
6e0d : 65 1c __ ADC ACCU + 1 
6e0f : 85 1c __ STA ACCU + 1 
6e11 : 60 __ __ RTS
6e12 : b0 04 __ BCS $6e18 ; (mul16by8 + 55)
6e14 : 85 1b __ STA ACCU + 0 
6e16 : 85 1c __ STA ACCU + 1 
6e18 : 60 __ __ RTS
--------------------------------------------------------------------
mul32by8: ; mul32by8
6e19 : a0 00 __ LDY #$00
6e1b : 84 07 __ STY WORK + 4 
6e1d : 84 08 __ STY WORK + 5 
6e1f : 84 09 __ STY WORK + 6 
6e21 : 4a __ __ LSR
6e22 : b0 0d __ BCS $6e31 ; (mul32by8 + 24)
6e24 : f0 26 __ BEQ $6e4c ; (mul32by8 + 51)
6e26 : 06 1b __ ASL ACCU + 0 
6e28 : 26 1c __ ROL ACCU + 1 
6e2a : 26 1d __ ROL ACCU + 2 
6e2c : 26 1e __ ROL ACCU + 3 
6e2e : 4a __ __ LSR
6e2f : 90 f5 __ BCC $6e26 ; (mul32by8 + 13)
6e31 : aa __ __ TAX
6e32 : 18 __ __ CLC
6e33 : a5 07 __ LDA WORK + 4 
6e35 : 65 1b __ ADC ACCU + 0 
6e37 : 85 07 __ STA WORK + 4 
6e39 : a5 08 __ LDA WORK + 5 
6e3b : 65 1c __ ADC ACCU + 1 
6e3d : 85 08 __ STA WORK + 5 
6e3f : a5 09 __ LDA WORK + 6 
6e41 : 65 1d __ ADC ACCU + 2 
6e43 : 85 09 __ STA WORK + 6 
6e45 : 98 __ __ TYA
6e46 : 65 1e __ ADC ACCU + 3 
6e48 : a8 __ __ TAY
6e49 : 8a __ __ TXA
6e4a : d0 da __ BNE $6e26 ; (mul32by8 + 13)
6e4c : 84 0a __ STY WORK + 7 
6e4e : 60 __ __ RTS
--------------------------------------------------------------------
mul16@proxy: ; mul16@proxy
6e4f : a5 11 __ LDA P4 
6e51 : 85 1b __ STA ACCU + 0 
6e53 : a5 12 __ LDA P5 
6e55 : 85 1c __ STA ACCU + 1 
--------------------------------------------------------------------
mul16: ; mul16
6e57 : a0 00 __ LDY #$00
6e59 : 84 06 __ STY WORK + 3 
6e5b : a5 03 __ LDA WORK + 0 
6e5d : a6 04 __ LDX WORK + 1 
6e5f : f0 1c __ BEQ $6e7d ; (mul16 + 38)
6e61 : 38 __ __ SEC
6e62 : 6a __ __ ROR
6e63 : 90 0d __ BCC $6e72 ; (mul16 + 27)
6e65 : aa __ __ TAX
6e66 : 18 __ __ CLC
6e67 : 98 __ __ TYA
6e68 : 65 1b __ ADC ACCU + 0 
6e6a : a8 __ __ TAY
6e6b : a5 06 __ LDA WORK + 3 
6e6d : 65 1c __ ADC ACCU + 1 
6e6f : 85 06 __ STA WORK + 3 
6e71 : 8a __ __ TXA
6e72 : 06 1b __ ASL ACCU + 0 
6e74 : 26 1c __ ROL ACCU + 1 
6e76 : 4a __ __ LSR
6e77 : 90 f9 __ BCC $6e72 ; (mul16 + 27)
6e79 : d0 ea __ BNE $6e65 ; (mul16 + 14)
6e7b : a5 04 __ LDA WORK + 1 
6e7d : 4a __ __ LSR
6e7e : 90 0d __ BCC $6e8d ; (mul16 + 54)
6e80 : aa __ __ TAX
6e81 : 18 __ __ CLC
6e82 : 98 __ __ TYA
6e83 : 65 1b __ ADC ACCU + 0 
6e85 : a8 __ __ TAY
6e86 : a5 06 __ LDA WORK + 3 
6e88 : 65 1c __ ADC ACCU + 1 
6e8a : 85 06 __ STA WORK + 3 
6e8c : 8a __ __ TXA
6e8d : 06 1b __ ASL ACCU + 0 
6e8f : 26 1c __ ROL ACCU + 1 
6e91 : 4a __ __ LSR
6e92 : b0 ec __ BCS $6e80 ; (mul16 + 41)
6e94 : d0 f7 __ BNE $6e8d ; (mul16 + 54)
6e96 : 84 05 __ STY WORK + 2 
6e98 : 60 __ __ RTS
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
6e99 : a9 7f __ LDA #$7f
6e9b : 85 03 __ STA WORK + 0 
--------------------------------------------------------------------
divs16: ; divs16
6e9d : 24 1c __ BIT ACCU + 1 
6e9f : 10 0d __ BPL $6eae ; (divs16 + 17)
6ea1 : 20 b8 6e JSR $6eb8 ; (negaccu + 0)
6ea4 : 24 04 __ BIT WORK + 1 
6ea6 : 10 0d __ BPL $6eb5 ; (divs16 + 24)
6ea8 : 20 c6 6e JSR $6ec6 ; (negtmp + 0)
6eab : 4c d4 6e JMP $6ed4 ; (divmod + 0)
6eae : 24 04 __ BIT WORK + 1 
6eb0 : 10 f9 __ BPL $6eab ; (divs16 + 14)
6eb2 : 20 c6 6e JSR $6ec6 ; (negtmp + 0)
6eb5 : 20 d4 6e JSR $6ed4 ; (divmod + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
6eb8 : 38 __ __ SEC
6eb9 : a9 00 __ LDA #$00
6ebb : e5 1b __ SBC ACCU + 0 
6ebd : 85 1b __ STA ACCU + 0 
6ebf : a9 00 __ LDA #$00
6ec1 : e5 1c __ SBC ACCU + 1 
6ec3 : 85 1c __ STA ACCU + 1 
6ec5 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
6ec6 : 38 __ __ SEC
6ec7 : a9 00 __ LDA #$00
6ec9 : e5 03 __ SBC WORK + 0 
6ecb : 85 03 __ STA WORK + 0 
6ecd : a9 00 __ LDA #$00
6ecf : e5 04 __ SBC WORK + 1 
6ed1 : 85 04 __ STA WORK + 1 
6ed3 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
6ed4 : a5 1c __ LDA ACCU + 1 
6ed6 : d0 31 __ BNE $6f09 ; (divmod + 53)
6ed8 : a5 04 __ LDA WORK + 1 
6eda : d0 1e __ BNE $6efa ; (divmod + 38)
6edc : 85 06 __ STA WORK + 3 
6ede : a2 04 __ LDX #$04
6ee0 : 06 1b __ ASL ACCU + 0 
6ee2 : 2a __ __ ROL
6ee3 : c5 03 __ CMP WORK + 0 
6ee5 : 90 02 __ BCC $6ee9 ; (divmod + 21)
6ee7 : e5 03 __ SBC WORK + 0 
6ee9 : 26 1b __ ROL ACCU + 0 
6eeb : 2a __ __ ROL
6eec : c5 03 __ CMP WORK + 0 
6eee : 90 02 __ BCC $6ef2 ; (divmod + 30)
6ef0 : e5 03 __ SBC WORK + 0 
6ef2 : 26 1b __ ROL ACCU + 0 
6ef4 : ca __ __ DEX
6ef5 : d0 eb __ BNE $6ee2 ; (divmod + 14)
6ef7 : 85 05 __ STA WORK + 2 
6ef9 : 60 __ __ RTS
6efa : a5 1b __ LDA ACCU + 0 
6efc : 85 05 __ STA WORK + 2 
6efe : a5 1c __ LDA ACCU + 1 
6f00 : 85 06 __ STA WORK + 3 
6f02 : a9 00 __ LDA #$00
6f04 : 85 1b __ STA ACCU + 0 
6f06 : 85 1c __ STA ACCU + 1 
6f08 : 60 __ __ RTS
6f09 : a5 04 __ LDA WORK + 1 
6f0b : d0 1f __ BNE $6f2c ; (divmod + 88)
6f0d : a5 03 __ LDA WORK + 0 
6f0f : 30 1b __ BMI $6f2c ; (divmod + 88)
6f11 : a9 00 __ LDA #$00
6f13 : 85 06 __ STA WORK + 3 
6f15 : a2 10 __ LDX #$10
6f17 : 06 1b __ ASL ACCU + 0 
6f19 : 26 1c __ ROL ACCU + 1 
6f1b : 2a __ __ ROL
6f1c : c5 03 __ CMP WORK + 0 
6f1e : 90 02 __ BCC $6f22 ; (divmod + 78)
6f20 : e5 03 __ SBC WORK + 0 
6f22 : 26 1b __ ROL ACCU + 0 
6f24 : 26 1c __ ROL ACCU + 1 
6f26 : ca __ __ DEX
6f27 : d0 f2 __ BNE $6f1b ; (divmod + 71)
6f29 : 85 05 __ STA WORK + 2 
6f2b : 60 __ __ RTS
6f2c : a9 00 __ LDA #$00
6f2e : 85 05 __ STA WORK + 2 
6f30 : 85 06 __ STA WORK + 3 
6f32 : 84 02 __ STY $02 
6f34 : a0 10 __ LDY #$10
6f36 : 18 __ __ CLC
6f37 : 26 1b __ ROL ACCU + 0 
6f39 : 26 1c __ ROL ACCU + 1 
6f3b : 26 05 __ ROL WORK + 2 
6f3d : 26 06 __ ROL WORK + 3 
6f3f : 38 __ __ SEC
6f40 : a5 05 __ LDA WORK + 2 
6f42 : e5 03 __ SBC WORK + 0 
6f44 : aa __ __ TAX
6f45 : a5 06 __ LDA WORK + 3 
6f47 : e5 04 __ SBC WORK + 1 
6f49 : 90 04 __ BCC $6f4f ; (divmod + 123)
6f4b : 86 05 __ STX WORK + 2 
6f4d : 85 06 __ STA WORK + 3 
6f4f : 88 __ __ DEY
6f50 : d0 e5 __ BNE $6f37 ; (divmod + 99)
6f52 : 26 1b __ ROL ACCU + 0 
6f54 : 26 1c __ ROL ACCU + 1 
6f56 : a4 02 __ LDY $02 
6f58 : 60 __ __ RTS
--------------------------------------------------------------------
mul32: ; mul32
6f59 : a5 04 __ LDA WORK + 1 
6f5b : 05 05 __ ORA WORK + 2 
6f5d : 05 06 __ ORA WORK + 3 
6f5f : d0 05 __ BNE $6f66 ; (mul32 + 13)
6f61 : a5 03 __ LDA WORK + 0 
6f63 : 4c 19 6e JMP $6e19 ; (mul32by8 + 0)
6f66 : a0 00 __ LDY #$00
6f68 : 84 07 __ STY WORK + 4 
6f6a : 84 08 __ STY WORK + 5 
6f6c : 98 __ __ TYA
6f6d : 38 __ __ SEC
6f6e : 66 03 __ ROR WORK + 0 
6f70 : 90 15 __ BCC $6f87 ; (mul32 + 46)
6f72 : aa __ __ TAX
6f73 : 18 __ __ CLC
6f74 : a5 07 __ LDA WORK + 4 
6f76 : 65 1b __ ADC ACCU + 0 
6f78 : 85 07 __ STA WORK + 4 
6f7a : a5 08 __ LDA WORK + 5 
6f7c : 65 1c __ ADC ACCU + 1 
6f7e : 85 08 __ STA WORK + 5 
6f80 : 98 __ __ TYA
6f81 : 65 1d __ ADC ACCU + 2 
6f83 : a8 __ __ TAY
6f84 : 8a __ __ TXA
6f85 : 65 1e __ ADC ACCU + 3 
6f87 : 46 04 __ LSR WORK + 1 
6f89 : 90 0f __ BCC $6f9a ; (mul32 + 65)
6f8b : aa __ __ TAX
6f8c : 18 __ __ CLC
6f8d : a5 08 __ LDA WORK + 5 
6f8f : 65 1b __ ADC ACCU + 0 
6f91 : 85 08 __ STA WORK + 5 
6f93 : 98 __ __ TYA
6f94 : 65 1c __ ADC ACCU + 1 
6f96 : a8 __ __ TAY
6f97 : 8a __ __ TXA
6f98 : 65 1d __ ADC ACCU + 2 
6f9a : 46 05 __ LSR WORK + 2 
6f9c : 90 09 __ BCC $6fa7 ; (mul32 + 78)
6f9e : aa __ __ TAX
6f9f : 18 __ __ CLC
6fa0 : 98 __ __ TYA
6fa1 : 65 1b __ ADC ACCU + 0 
6fa3 : a8 __ __ TAY
6fa4 : 8a __ __ TXA
6fa5 : 65 1c __ ADC ACCU + 1 
6fa7 : 46 06 __ LSR WORK + 3 
6fa9 : 90 03 __ BCC $6fae ; (mul32 + 85)
6fab : 18 __ __ CLC
6fac : 65 1b __ ADC ACCU + 0 
6fae : 06 1b __ ASL ACCU + 0 
6fb0 : 26 1c __ ROL ACCU + 1 
6fb2 : 26 1d __ ROL ACCU + 2 
6fb4 : 26 1e __ ROL ACCU + 3 
6fb6 : 46 03 __ LSR WORK + 0 
6fb8 : 90 cd __ BCC $6f87 ; (mul32 + 46)
6fba : d0 b6 __ BNE $6f72 ; (mul32 + 25)
6fbc : 84 09 __ STY WORK + 6 
6fbe : 85 0a __ STA WORK + 7 
6fc0 : 60 __ __ RTS
--------------------------------------------------------------------
divs32: ; divs32
6fc1 : 24 1e __ BIT ACCU + 3 
6fc3 : 10 0d __ BPL $6fd2 ; (divs32 + 17)
6fc5 : 20 dc 6f JSR $6fdc ; (negaccu32 + 0)
6fc8 : 24 06 __ BIT WORK + 3 
6fca : 10 0d __ BPL $6fd9 ; (divs32 + 24)
6fcc : 20 f6 6f JSR $6ff6 ; (negtmp32 + 0)
6fcf : 4c 37 3f JMP $3f37 ; (divmod32 + 0)
6fd2 : 24 06 __ BIT WORK + 3 
6fd4 : 10 f9 __ BPL $6fcf ; (divs32 + 14)
6fd6 : 20 f6 6f JSR $6ff6 ; (negtmp32 + 0)
6fd9 : 20 37 3f JSR $3f37 ; (divmod32 + 0)
--------------------------------------------------------------------
negaccu32: ; negaccu32
6fdc : 38 __ __ SEC
6fdd : a9 00 __ LDA #$00
6fdf : e5 1b __ SBC ACCU + 0 
6fe1 : 85 1b __ STA ACCU + 0 
6fe3 : a9 00 __ LDA #$00
6fe5 : e5 1c __ SBC ACCU + 1 
6fe7 : 85 1c __ STA ACCU + 1 
6fe9 : a9 00 __ LDA #$00
6feb : e5 1d __ SBC ACCU + 2 
6fed : 85 1d __ STA ACCU + 2 
6fef : a9 00 __ LDA #$00
6ff1 : e5 1e __ SBC ACCU + 3 
6ff3 : 85 1e __ STA ACCU + 3 
6ff5 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp32: ; negtmp32
6ff6 : 38 __ __ SEC
6ff7 : a9 00 __ LDA #$00
6ff9 : e5 03 __ SBC WORK + 0 
6ffb : 85 03 __ STA WORK + 0 
6ffd : a9 00 __ LDA #$00
6fff : e5 04 __ SBC WORK + 1 
7001 : 85 04 __ STA WORK + 1 
7003 : a9 00 __ LDA #$00
7005 : e5 05 __ SBC WORK + 2 
7007 : 85 05 __ STA WORK + 2 
7009 : a9 00 __ LDA #$00
700b : e5 06 __ SBC WORK + 3 
700d : 85 06 __ STA WORK + 3 
700f : 60 __ __ RTS
--------------------------------------------------------------------
crt_malloc: ; crt_malloc
7010 : 18 __ __ CLC
7011 : a5 1b __ LDA ACCU + 0 
7013 : 69 0d __ ADC #$0d
7015 : 29 fc __ AND #$fc
7017 : 85 03 __ STA WORK + 0 
7019 : a5 1c __ LDA ACCU + 1 
701b : 69 00 __ ADC #$00
701d : 85 04 __ STA WORK + 1 
701f : ad fe 85 LDA $85fe ; (HeapNode.end + 0)
7022 : d0 26 __ BNE $704a ; (crt_malloc + 58)
7024 : a9 00 __ LDA #$00
7026 : 8d a2 8e STA $8ea2 
7029 : 8d a3 8e STA $8ea3 
702c : ee fe 85 INC $85fe ; (HeapNode.end + 0)
702f : a9 a0 __ LDA #$a0
7031 : 09 02 __ ORA #$02
7033 : 8d fc 85 STA $85fc ; (HeapNode.next + 0)
7036 : a9 8e __ LDA #$8e
7038 : 8d fd 85 STA $85fd ; (HeapNode.next + 1)
703b : 38 __ __ SEC
703c : a9 00 __ LDA #$00
703e : e9 02 __ SBC #$02
7040 : 8d a4 8e STA $8ea4 
7043 : a9 b0 __ LDA #$b0
7045 : e9 00 __ SBC #$00
7047 : 8d a5 8e STA $8ea5 
704a : a9 fc __ LDA #$fc
704c : a2 85 __ LDX #$85
704e : 85 1d __ STA ACCU + 2 
7050 : 86 1e __ STX ACCU + 3 
7052 : 18 __ __ CLC
7053 : a0 00 __ LDY #$00
7055 : b1 1d __ LDA (ACCU + 2),y 
7057 : 85 1b __ STA ACCU + 0 
7059 : 65 03 __ ADC WORK + 0 
705b : 85 05 __ STA WORK + 2 
705d : c8 __ __ INY
705e : b1 1d __ LDA (ACCU + 2),y 
7060 : 85 1c __ STA ACCU + 1 
7062 : f0 20 __ BEQ $7084 ; (crt_malloc + 116)
7064 : 65 04 __ ADC WORK + 1 
7066 : 85 06 __ STA WORK + 3 
7068 : b0 14 __ BCS $707e ; (crt_malloc + 110)
706a : a0 02 __ LDY #$02
706c : b1 1b __ LDA (ACCU + 0),y 
706e : c5 05 __ CMP WORK + 2 
7070 : c8 __ __ INY
7071 : b1 1b __ LDA (ACCU + 0),y 
7073 : e5 06 __ SBC WORK + 3 
7075 : b0 0f __ BCS $7086 ; (crt_malloc + 118)
7077 : a5 1b __ LDA ACCU + 0 
7079 : a6 1c __ LDX ACCU + 1 
707b : 4c 4e 70 JMP $704e ; (crt_malloc + 62)
707e : a9 00 __ LDA #$00
7080 : 85 1b __ STA ACCU + 0 
7082 : 85 1c __ STA ACCU + 1 
7084 : 02 __ __ INV
7085 : 60 __ __ RTS
7086 : a5 05 __ LDA WORK + 2 
7088 : 85 07 __ STA WORK + 4 
708a : a5 06 __ LDA WORK + 3 
708c : 85 08 __ STA WORK + 5 
708e : a0 02 __ LDY #$02
7090 : a5 07 __ LDA WORK + 4 
7092 : d1 1b __ CMP (ACCU + 0),y 
7094 : d0 15 __ BNE $70ab ; (crt_malloc + 155)
7096 : c8 __ __ INY
7097 : a5 08 __ LDA WORK + 5 
7099 : d1 1b __ CMP (ACCU + 0),y 
709b : d0 0e __ BNE $70ab ; (crt_malloc + 155)
709d : a0 00 __ LDY #$00
709f : b1 1b __ LDA (ACCU + 0),y 
70a1 : 91 1d __ STA (ACCU + 2),y 
70a3 : c8 __ __ INY
70a4 : b1 1b __ LDA (ACCU + 0),y 
70a6 : 91 1d __ STA (ACCU + 2),y 
70a8 : 4c c8 70 JMP $70c8 ; (crt_malloc + 184)
70ab : a0 00 __ LDY #$00
70ad : b1 1b __ LDA (ACCU + 0),y 
70af : 91 07 __ STA (WORK + 4),y 
70b1 : a5 07 __ LDA WORK + 4 
70b3 : 91 1d __ STA (ACCU + 2),y 
70b5 : c8 __ __ INY
70b6 : b1 1b __ LDA (ACCU + 0),y 
70b8 : 91 07 __ STA (WORK + 4),y 
70ba : a5 08 __ LDA WORK + 5 
70bc : 91 1d __ STA (ACCU + 2),y 
70be : c8 __ __ INY
70bf : b1 1b __ LDA (ACCU + 0),y 
70c1 : 91 07 __ STA (WORK + 4),y 
70c3 : c8 __ __ INY
70c4 : b1 1b __ LDA (ACCU + 0),y 
70c6 : 91 07 __ STA (WORK + 4),y 
70c8 : a0 00 __ LDY #$00
70ca : a5 05 __ LDA WORK + 2 
70cc : 91 1b __ STA (ACCU + 0),y 
70ce : c8 __ __ INY
70cf : a5 06 __ LDA WORK + 3 
70d1 : 91 1b __ STA (ACCU + 0),y 
70d3 : a0 02 __ LDY #$02
70d5 : a9 bd __ LDA #$bd
70d7 : 91 1b __ STA (ACCU + 0),y 
70d9 : c8 __ __ INY
70da : 91 1b __ STA (ACCU + 0),y 
70dc : c8 __ __ INY
70dd : 91 1b __ STA (ACCU + 0),y 
70df : c8 __ __ INY
70e0 : 91 1b __ STA (ACCU + 0),y 
70e2 : 38 __ __ SEC
70e3 : a5 05 __ LDA WORK + 2 
70e5 : e9 04 __ SBC #$04
70e7 : 85 05 __ STA WORK + 2 
70e9 : b0 02 __ BCS $70ed ; (crt_malloc + 221)
70eb : c6 06 __ DEC WORK + 3 
70ed : a9 be __ LDA #$be
70ef : a0 00 __ LDY #$00
70f1 : 91 05 __ STA (WORK + 2),y 
70f3 : c8 __ __ INY
70f4 : 91 05 __ STA (WORK + 2),y 
70f6 : c8 __ __ INY
70f7 : 91 05 __ STA (WORK + 2),y 
70f9 : c8 __ __ INY
70fa : 91 05 __ STA (WORK + 2),y 
70fc : 18 __ __ CLC
70fd : a5 1b __ LDA ACCU + 0 
70ff : 69 06 __ ADC #$06
7101 : 85 1b __ STA ACCU + 0 
7103 : 90 02 __ BCC $7107 ; (crt_malloc + 247)
7105 : e6 1c __ INC ACCU + 1 
7107 : 60 __ __ RTS
--------------------------------------------------------------------
crt_free@proxy: ; crt_free@proxy
7108 : a5 0d __ LDA P0 
710a : 85 1b __ STA ACCU + 0 
710c : a5 0e __ LDA P1 
710e : 85 1c __ STA ACCU + 1 
--------------------------------------------------------------------
crt_free: ; crt_free
7110 : a5 1b __ LDA ACCU + 0 
7112 : 05 1c __ ORA ACCU + 1 
7114 : d0 01 __ BNE $7117 ; (crt_free + 7)
7116 : 60 __ __ RTS
7117 : 38 __ __ SEC
7118 : a5 1b __ LDA ACCU + 0 
711a : 29 03 __ AND #$03
711c : d0 56 __ BNE $7174 ; (crt_free + 100)
711e : a5 1b __ LDA ACCU + 0 
7120 : e9 06 __ SBC #$06
7122 : 85 1b __ STA ACCU + 0 
7124 : b0 02 __ BCS $7128 ; (crt_free + 24)
7126 : c6 1c __ DEC ACCU + 1 
7128 : a0 02 __ LDY #$02
712a : a9 bd __ LDA #$bd
712c : d1 1b __ CMP (ACCU + 0),y 
712e : d0 44 __ BNE $7174 ; (crt_free + 100)
7130 : c8 __ __ INY
7131 : d1 1b __ CMP (ACCU + 0),y 
7133 : d0 3f __ BNE $7174 ; (crt_free + 100)
7135 : c8 __ __ INY
7136 : d1 1b __ CMP (ACCU + 0),y 
7138 : d0 3a __ BNE $7174 ; (crt_free + 100)
713a : c8 __ __ INY
713b : d1 1b __ CMP (ACCU + 0),y 
713d : d0 35 __ BNE $7174 ; (crt_free + 100)
713f : a0 00 __ LDY #$00
7141 : 38 __ __ SEC
7142 : b1 1b __ LDA (ACCU + 0),y 
7144 : e9 04 __ SBC #$04
7146 : 85 03 __ STA WORK + 0 
7148 : c8 __ __ INY
7149 : b1 1b __ LDA (ACCU + 0),y 
714b : e9 00 __ SBC #$00
714d : 85 04 __ STA WORK + 1 
714f : a0 00 __ LDY #$00
7151 : a9 be __ LDA #$be
7153 : d1 03 __ CMP (WORK + 0),y 
7155 : d0 1d __ BNE $7174 ; (crt_free + 100)
7157 : c8 __ __ INY
7158 : d1 03 __ CMP (WORK + 0),y 
715a : d0 18 __ BNE $7174 ; (crt_free + 100)
715c : c8 __ __ INY
715d : d1 03 __ CMP (WORK + 0),y 
715f : d0 13 __ BNE $7174 ; (crt_free + 100)
7161 : c8 __ __ INY
7162 : d1 03 __ CMP (WORK + 0),y 
7164 : d0 0e __ BNE $7174 ; (crt_free + 100)
7166 : a5 1c __ LDA ACCU + 1 
7168 : a6 1b __ LDX ACCU + 0 
716a : c9 8e __ CMP #$8e
716c : 90 06 __ BCC $7174 ; (crt_free + 100)
716e : d0 05 __ BNE $7175 ; (crt_free + 101)
7170 : e0 a0 __ CPX #$a0
7172 : b0 01 __ BCS $7175 ; (crt_free + 101)
7174 : 02 __ __ INV
7175 : c9 b0 __ CMP #$b0
7177 : 90 06 __ BCC $717f ; (crt_free + 111)
7179 : d0 f9 __ BNE $7174 ; (crt_free + 100)
717b : e0 00 __ CPX #$00
717d : b0 f5 __ BCS $7174 ; (crt_free + 100)
717f : a0 02 __ LDY #$02
7181 : a9 bf __ LDA #$bf
7183 : 91 1b __ STA (ACCU + 0),y 
7185 : c8 __ __ INY
7186 : 91 1b __ STA (ACCU + 0),y 
7188 : a0 00 __ LDY #$00
718a : b1 1b __ LDA (ACCU + 0),y 
718c : 85 1d __ STA ACCU + 2 
718e : c8 __ __ INY
718f : b1 1b __ LDA (ACCU + 0),y 
7191 : 85 1e __ STA ACCU + 3 
7193 : a9 fc __ LDA #$fc
7195 : a2 85 __ LDX #$85
7197 : 85 05 __ STA WORK + 2 
7199 : 86 06 __ STX WORK + 3 
719b : a0 01 __ LDY #$01
719d : b1 05 __ LDA (WORK + 2),y 
719f : f0 28 __ BEQ $71c9 ; (crt_free + 185)
71a1 : aa __ __ TAX
71a2 : 88 __ __ DEY
71a3 : b1 05 __ LDA (WORK + 2),y 
71a5 : e4 1e __ CPX ACCU + 3 
71a7 : 90 ee __ BCC $7197 ; (crt_free + 135)
71a9 : d0 1e __ BNE $71c9 ; (crt_free + 185)
71ab : c5 1d __ CMP ACCU + 2 
71ad : 90 e8 __ BCC $7197 ; (crt_free + 135)
71af : d0 18 __ BNE $71c9 ; (crt_free + 185)
71b1 : a0 00 __ LDY #$00
71b3 : b1 1d __ LDA (ACCU + 2),y 
71b5 : 91 1b __ STA (ACCU + 0),y 
71b7 : c8 __ __ INY
71b8 : b1 1d __ LDA (ACCU + 2),y 
71ba : 91 1b __ STA (ACCU + 0),y 
71bc : c8 __ __ INY
71bd : b1 1d __ LDA (ACCU + 2),y 
71bf : 91 1b __ STA (ACCU + 0),y 
71c1 : c8 __ __ INY
71c2 : b1 1d __ LDA (ACCU + 2),y 
71c4 : 91 1b __ STA (ACCU + 0),y 
71c6 : 4c de 71 JMP $71de ; (crt_free + 206)
71c9 : a0 00 __ LDY #$00
71cb : b1 05 __ LDA (WORK + 2),y 
71cd : 91 1b __ STA (ACCU + 0),y 
71cf : c8 __ __ INY
71d0 : b1 05 __ LDA (WORK + 2),y 
71d2 : 91 1b __ STA (ACCU + 0),y 
71d4 : c8 __ __ INY
71d5 : a5 1d __ LDA ACCU + 2 
71d7 : 91 1b __ STA (ACCU + 0),y 
71d9 : c8 __ __ INY
71da : a5 1e __ LDA ACCU + 3 
71dc : 91 1b __ STA (ACCU + 0),y 
71de : a0 02 __ LDY #$02
71e0 : b1 05 __ LDA (WORK + 2),y 
71e2 : c5 1b __ CMP ACCU + 0 
71e4 : d0 1d __ BNE $7203 ; (crt_free + 243)
71e6 : c8 __ __ INY
71e7 : b1 05 __ LDA (WORK + 2),y 
71e9 : c5 1c __ CMP ACCU + 1 
71eb : d0 16 __ BNE $7203 ; (crt_free + 243)
71ed : a0 00 __ LDY #$00
71ef : b1 1b __ LDA (ACCU + 0),y 
71f1 : 91 05 __ STA (WORK + 2),y 
71f3 : c8 __ __ INY
71f4 : b1 1b __ LDA (ACCU + 0),y 
71f6 : 91 05 __ STA (WORK + 2),y 
71f8 : c8 __ __ INY
71f9 : b1 1b __ LDA (ACCU + 0),y 
71fb : 91 05 __ STA (WORK + 2),y 
71fd : c8 __ __ INY
71fe : b1 1b __ LDA (ACCU + 0),y 
7200 : 91 05 __ STA (WORK + 2),y 
7202 : 60 __ __ RTS
7203 : a0 00 __ LDY #$00
7205 : a5 1b __ LDA ACCU + 0 
7207 : 91 05 __ STA (WORK + 2),y 
7209 : c8 __ __ INY
720a : a5 1c __ LDA ACCU + 1 
720c : 91 05 __ STA (WORK + 2),y 
720e : 60 __ __ RTS
--------------------------------------------------------------------
__multab50L:
720f : __ __ __ BYT 00 32 64 96                                     : .2d.
--------------------------------------------------------------------
__multab7L:
7213 : __ __ __ BYT 00 07 0e 15 1c 23 2a 31 38 3f 46 4d 54          : .....#*18?FMT
--------------------------------------------------------------------
__shrtab192L:
7220 : __ __ __ BYT c0 60 30 18 0c 06 03                            : .`0....
--------------------------------------------------------------------
__multab12L:
7227 : __ __ __ BYT 00 0c 18 24                                     : ...$
--------------------------------------------------------------------
__multab3L:
722b : __ __ __ BYT 00 03 06 09                                     : ....
--------------------------------------------------------------------
__shltab3L:
722f : __ __ __ BYT 03 06 0c 18 30 60 c0                            : ....0`.
--------------------------------------------------------------------
__multab320L:
7236 : __ __ __ BYT 00 40 80 c0 00 40 80 c0 00 40 80 c0 00          : .@...@...@...
--------------------------------------------------------------------
__multab320H:
7243 : __ __ __ BYT 00 01 02 03 05 06 07 08 0a 0b 0c 0d 0f          : .............
--------------------------------------------------------------------
__multab10L:
7250 : __ __ __ BYT 00 0a 14 1e 28 32 3c 46 50 5a 64 6e 78 82 8c 96 : ....(2<FPZdnx...
--------------------------------------------------------------------
__multab17L:
7260 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 99 aa bb cc dd ee ff : .."3DUfw........
--------------------------------------------------------------------
screen_result@proxy: ; screen_result@proxy
7270 : a9 46 __ LDA #$46
7272 : 85 10 __ STA P3 
7274 : a9 15 __ LDA #$15
7276 : 85 11 __ STA P4 
7278 : 4c 64 11 JMP $1164 ; (screen_result.s4 + 0)
--------------------------------------------------------------------
mul16@proxy: ; mul16@proxy
727b : a5 4d __ LDA $4d 
727d : 85 03 __ STA WORK + 0 
727f : a5 4e __ LDA $4e 
7281 : 85 04 __ STA WORK + 1 
7283 : 4c 57 6e JMP $6e57 ; (mul16 + 0)
--------------------------------------------------------------------
mul16@proxy: ; mul16@proxy
7286 : a5 0d __ LDA P0 
7288 : 85 03 __ STA WORK + 0 
728a : a5 0e __ LDA P1 
728c : 85 04 __ STA WORK + 1 
728e : 4c 57 6e JMP $6e57 ; (mul16 + 0)
--------------------------------------------------------------------
memset@proxy: ; memset@proxy
7291 : a9 e0 __ LDA #$e0
7293 : 85 0e __ STA P1 
7295 : a9 40 __ LDA #$40
7297 : 85 11 __ STA P4 
7299 : a9 1f __ LDA #$1f
729b : 85 12 __ STA P5 
729d : 4c f3 20 JMP $20f3 ; (memset.s4 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
72a0 : a5 45 __ LDA $45 
72a2 : 85 1b __ STA ACCU + 0 
72a4 : 4c 9d 6e JMP $6e9d ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
72a7 : a5 4f __ LDA $4f 
72a9 : 85 03 __ STA WORK + 0 
72ab : a5 50 __ LDA $50 
72ad : 85 04 __ STA WORK + 1 
72af : 4c 9d 6e JMP $6e9d ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
72b2 : a9 7f __ LDA #$7f
72b4 : 85 03 __ STA WORK + 0 
72b6 : a9 00 __ LDA #$00
72b8 : 85 04 __ STA WORK + 1 
72ba : a5 05 __ LDA WORK + 2 
72bc : 85 1b __ STA ACCU + 0 
72be : a5 06 __ LDA WORK + 3 
72c0 : 85 1c __ STA ACCU + 1 
72c2 : 4c 9d 6e JMP $6e9d ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
72c5 : a5 47 __ LDA $47 
72c7 : 85 03 __ STA WORK + 0 
72c9 : a5 48 __ LDA $48 
72cb : 85 04 __ STA WORK + 1 
72cd : 4c 9d 6e JMP $6e9d ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
72d0 : a9 7f __ LDA #$7f
72d2 : 85 03 __ STA WORK + 0 
72d4 : a9 00 __ LDA #$00
72d6 : 85 04 __ STA WORK + 1 
72d8 : 4c 9d 6e JMP $6e9d ; (divs16 + 0)
--------------------------------------------------------------------
cwin_put_string@proxy: ; cwin_put_string@proxy
72db : a5 10 __ LDA P3 
72dd : 85 0d __ STA P0 
72df : a5 11 __ LDA P4 
72e1 : 85 0e __ STA P1 
72e3 : 4c c2 10 JMP $10c2 ; (cwin_put_string.s4 + 0)
--------------------------------------------------------------------
vic_setmode@proxy: ; vic_setmode@proxy
72e6 : a9 04 __ LDA #$04
72e8 : 85 0d __ STA P0 
72ea : a9 c0 __ LDA #$c0
72ec : 85 0f __ STA P2 
72ee : a9 e0 __ LDA #$e0
72f0 : 85 11 __ STA P4 
72f2 : 4c 13 0f JMP $0f13 ; (vic_setmode.s4 + 0)
--------------------------------------------------------------------
vic_setmode@proxy: ; vic_setmode@proxy
72f5 : a9 03 __ LDA #$03
72f7 : 85 0d __ STA P0 
72f9 : a9 00 __ LDA #$00
72fb : 85 0e __ STA P1 
72fd : a9 d0 __ LDA #$d0
72ff : 85 0f __ STA P2 
7301 : a5 43 __ LDA $43 
7303 : 85 10 __ STA P3 
7305 : a5 44 __ LDA $44 
7307 : 85 11 __ STA P4 
7309 : 4c 13 0f JMP $0f13 ; (vic_setmode.s4 + 0)
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
730c : a9 73 __ LDA #$73
730e : 85 0e __ STA P1 
7310 : 4c 44 10 JMP $1044 ; (strlen.s4 + 0)
--------------------------------------------------------------------
mul40:
7313 : __ __ __ BYT 00 00 28 00 50 00 78 00 a0 00 c8 00 f0 00 18 01 : ..(.P.x.........
7323 : __ __ __ BYT 40 01 68 01 90 01 b8 01 e0 01 08 02 30 02 58 02 : @.h.........0.X.
7333 : __ __ __ BYT 80 02 a8 02 d0 02 f8 02 20 03 48 03 70 03 98 03 : ........ .H.p...
7343 : __ __ __ BYT c0 03                                           : ..
--------------------------------------------------------------------
p2smap:
7345 : __ __ __ BYT 40 00 40 20 40 c0 80 80                         : @.@ @...
--------------------------------------------------------------------
p2smap:
734d : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
uii_target:
7355 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
audio_ch_base:
7356 : __ __ __ BYT 20 df 40 df 60 df 80 df a0 df c0 df e0 df       :  .@.`.........
--------------------------------------------------------------------
mod_dir:
7364 : __ __ __ BYT 2f 75 73 62 30 2f 44 65 76 2f 61 73 73 65 74 73 : /usb0/Dev/assets
7374 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
mod_file:
7375 : __ __ __ BYT 34 65 76 2e 6d 6f 64 00                         : 4ev.mod.
--------------------------------------------------------------------
sid_freq:
737d : __ __ __ BYT a9 02 d2 02 fd 02 2b 03 5b 03 8e 03 c4 03 fd 03 : ......+.[.......
738d : __ __ __ BYT 3a 04 7a 04 bf 04 07 05 53 05 a4 05 fa 05 55 06 : :.z.....S.....U.
--------------------------------------------------------------------
speed_nums:
739d : __ __ __ BYT 95 22 97 22 99 22 9b 22 9d 22 9f 22 a1 22 a4 22 : ."."."."."."."."
73ad : __ __ __ BYT a7 22 aa 22 ad 22 b0 22 b3 22 b6 22 b9 22 bc 22 : ."."."."."."."."
--------------------------------------------------------------------
lmask:
73bd : __ __ __ BYT ff 7f 3f 1f 0f 07 03 01                         : ..?.....
--------------------------------------------------------------------
rmask:
73c5 : __ __ __ BYT 00 80 c0 e0 f0 f8 fc fe                         : ........
--------------------------------------------------------------------
blitops_op:
73cd : __ __ __ BYT 00 21 01 41                                     : .!.A
--------------------------------------------------------------------
step_msg:
73d1 : __ __ __ BYT bc 2c d5 2c ea 2c fd 2c 15 2d 32 2d 4c 2d 66 2d : .,.,.,.,.-2-L-f-
73e1 : __ __ __ BYT 7f 2d 9b 2d bb 2d d8 2d f5 2d 11 2e 29 2e 45 2e : .-.-.-.-.-..).E.
--------------------------------------------------------------------
tbitmap:
73f1 : __ __ __ BYT e0 86 00 00 28 01 40 01                         : ....(.@.
--------------------------------------------------------------------
cbytes:
73f9 : __ __ __ BYT 00 55 aa ff                                     : .U..
--------------------------------------------------------------------
mod_paused:
73fd : __ __ __ BSS	1
--------------------------------------------------------------------
mod_saved_irq:
73fe : __ __ __ BSS	2
--------------------------------------------------------------------
glyphs:
7400 : __ __ __ BYT 70 88 88 88 88 88 70 20 60 20 20 20 20 70 70 88 : p.....p `    pp.
7410 : __ __ __ BYT 08 30 40 80 f8 70 88 08 30 08 88 70 10 30 50 90 : .0@..p..0..p.0P.
7420 : __ __ __ BYT f8 10 10 f8 80 f0 08 08 88 70 30 40 80 f0 88 88 : .........p0@....
7430 : __ __ __ BYT 70 f8 08 10 20 40 40 40 70 88 88 70 88 88 70 70 : p... @@@p..p..pp
7440 : __ __ __ BYT 88 88 78 08 10 60 88 d8 a8 88 88 88 88 88 88 88 : ..x..`..........
7450 : __ __ __ BYT f8 88 88 88 f8 10 20 40 80 80 f8                : ...... @...
--------------------------------------------------------------------
TinyFont:
745b : __ __ __ BYT 00 04 05 08 0d 12 17 1c 1d 21 25 2a 2d 2e 31 32 : .........!%*-.12
746b : __ __ __ BYT 35 39 3d 41 45 49 4d 51 55 59 5d 5e 5f 62 65 68 : 59=AEIMQUY]^_beh
747b : __ __ __ BYT 6c 71 76 7a 7e 82 86 8a 8e 92 95 99 9d a1 a6 ab : lqvz~...........
748b : __ __ __ BYT af b3 b7 bb bf c4 c8 cd d2 d7 dc e1 e5 e8 ec f1 : ................
749b : __ __ __ BYT f5 f9 fd 01 05 09 0d 10 14 18 19 1b 1f 21 26 2a : .............!&*
74ab : __ __ __ BYT 2e 32 36 3a 3e 41 45 49 4e 52 56 5a 5e 5f 63 67 : .26:>AEINRVZ^_cg
74bb : __ __ __ BYT 10 04 0c 14 14 14 14 04 10 10 14 0c 04 0c 04 0c : ................
74cb : __ __ __ BYT 10 10 10 10 10 10 10 10 10 10 04 04 0c 0c 0c 10 : ................
74db : __ __ __ BYT 14 14 10 10 10 10 10 10 10 0c 10 10 10 14 14 10 : ................
74eb : __ __ __ BYT 10 10 10 10 14 10 14 14 14 14 14 10 0c 10 14 10 : ................
74fb : __ __ __ BYT 10 10 10 11 11 11 0d 11 11 05 09 11 09 15 11 11 : ................
750b : __ __ __ BYT 11 11 11 11 0d 11 11 15 11 11 11 11 05 11 11 11 : ................
751b : __ __ __ BYT 00 00 00 00 fa c0 00 c0 28 7c 28 7c 28 20 54 d6 : ........(|(|( T.
752b : __ __ __ BYT 54 08 04 48 10 24 40 6c 92 92 6c 0a c0 38 44 82 : T..H.$@l..l..8D.
753b : __ __ __ BYT 82 82 82 44 38 10 54 38 54 10 10 38 10 03 10 10 : ...D8.T8T..8....
754b : __ __ __ BYT 10 02 06 38 c0 7c 82 82 7c 22 42 fe 02 46 8a 92 : ...8.|..|"B..F..
755b : __ __ __ BYT 62 44 82 92 6c f0 10 3e 10 e4 92 92 8c 7c 92 92 : bD..l..>.....|..
756b : __ __ __ BYT 4c 80 8e 90 e0 6c 92 92 6c 64 92 92 7c 28 0b 10 : L....l..ld..|(..
757b : __ __ __ BYT 28 44 28 28 28 44 28 10 40 80 9a 60 00 00 00 00 : (D(((D(.@..`....
758b : __ __ __ BYT 00 3e 50 90 50 3e fe 92 92 6c 7c 82 82 44 fe 82 : .>P.P>...l|..D..
759b : __ __ __ BYT 82 7c fe 92 92 82 fe 90 90 80 7c 82 92 1c fe 10 : .|........|.....
75ab : __ __ __ BYT 10 fe 82 fe 82 84 82 82 fc fe 10 28 c6 fe 02 02 : ...........(....
75bb : __ __ __ BYT 02 fe 40 20 40 fe fe 40 20 10 fe 7c 82 82 7c fe : ..@ @..@ ..|..|.
75cb : __ __ __ BYT 90 90 60 7c 82 84 7a fe 90 90 6e 64 92 92 4c 80 : ..`|..z...nd..L.
75db : __ __ __ BYT 80 fe 80 80 fc 02 02 fc e0 18 06 18 e0 fe 04 08 : ................
75eb : __ __ __ BYT 04 fe c6 28 10 28 c6 e0 10 1e 10 e0 86 8a 92 a2 : ...(.(..........
75fb : __ __ __ BYT c2 fe 82 82 82 c0 38 06 82 82 82 fe 20 40 80 40 : ......8..... @.@
760b : __ __ __ BYT 20 01 01 01 01 00 00 00 00 04 2a 2a 1e fe 22 22 :  .........**..""
761b : __ __ __ BYT 1c 1c 22 22 14 1c 22 22 fe 1c 2a 2a 18 20 7e a0 : ..""..""..**. ~.
762b : __ __ __ BYT 18 25 25 3e fe 20 20 1e be 01 be fe 10 28 46 fc : .%%>.  ......(F.
763b : __ __ __ BYT 02 3e 20 1e 20 1e 3e 20 20 1e 1c 22 22 1c 3f 24 : .> . .>  .."".?$
764b : __ __ __ BYT 24 18 18 24 24 3f 3e 10 20 10 12 2a 2a 04 20 7c : $..$$?>. ..**. |
765b : __ __ __ BYT 22 3c 02 02 3e 38 04 02 3c 3c 02 1c 02 3c 26 18 : "<..>8..<<...<&.
766b : __ __ __ BYT 0c 32 38 05 05 3e 26 2a 2a 32 10 6c 82 82 fe 82 : .28..>&**2.l....
767b : __ __ __ BYT 82 6c 10 10 20 10 20 00 00 00 00                : .l.. . ....
--------------------------------------------------------------------
sin64:
7686 : __ __ __ BYT 00 0c 19 25 31 3c 47 51 5a 62 6a 70 75 7a 7d 7e : ...%1<GQZbjpuz}~
7696 : __ __ __ BYT 7f 7e 7d 7a 75 70 6a 62 5a 51 47 3c 31 25 19 0c : .~}zupjbZQG<1%..
76a6 : __ __ __ BYT 00 f4 e7 db cf c4 b9 af a6 9e 96 90 8b 86 83 82 : ................
76b6 : __ __ __ BYT 81 82 83 86 8b 90 96 9e a6 af b9 c4 cf db e7 f4 : ................
--------------------------------------------------------------------
cr:
76c6 : __ __ __ BYT 00 00 00 00 40 01 c8 00                         : ....@...
--------------------------------------------------------------------
vib_sine:
76ce : __ __ __ BYT 00 18 31 4a 61 78 8d a1 b4 c5 d4 e0 eb f4 fa fd : ..1Jax..........
76de : __ __ __ BYT ff fd fa f4 eb e0 d4 c5 b4 a1 8d 78 61 4a 31 18 : ...........xaJ1.
--------------------------------------------------------------------
lats:
76ee : __ __ __ BYT f7 fb 00 05 09                                  : .....
--------------------------------------------------------------------
vcr:
76f3 : __ __ __ BYT 00 00 00 00 40 01 c8 00                         : ....@...
--------------------------------------------------------------------
pal_sc:
76fb : __ __ __ BYT f9 e3 a8 d5                                     : ....
--------------------------------------------------------------------
ball_vx:
76ff : __ __ __ BSS	1
--------------------------------------------------------------------
frames:
7700 : __ __ __ BYT 00 d8 00 e7 60 40 00 00 00 00 00 e4 1f f5 33 20 : ....`@........3 
7710 : __ __ __ BYT 00 00 00 00 00 ec 00 f8 1a 10 00 00 00 00 00 d8 : ................
7720 : __ __ __ BYT 00 e7 60 40 cd f4 52 04 00 d8 00 e7 60 40 33 f3 : ..`@..R.....`@3.
7730 : __ __ __ BYT 7f 02                                           : ..
--------------------------------------------------------------------
f1c:
7732 : __ __ __ BYT 0f 01 0d 0d 05 01 07 0d 01 01 07 08 0e 03 01 03 : ................
7742 : __ __ __ BYT 0e 0d 0d 07 01 01 0d 07 06 03 0e 0e 05 03 05 0d : ................
7752 : __ __ __ BYT 01 01 05 0d 06 04 03 03 0e 01 0d 03 01 01 0f 0d : ................
--------------------------------------------------------------------
cube_v:
7762 : __ __ __ BYT ff ff ff 01 ff ff 01 01 ff ff 01 ff ff ff 01 01 : ................
7772 : __ __ __ BYT ff 01 01 01 01 ff 01 01                         : ........
--------------------------------------------------------------------
cube_e:
777a : __ __ __ BYT 00 01 01 02 02 03 03 00 04 05 05 06 06 07 07 04 : ................
778a : __ __ __ BYT 00 04 01 05 02 06 03 07                         : ........
--------------------------------------------------------------------
grid_lines:
7792 : __ __ __ BYT fd 03 00 03 03 00 00 03 fd 00 03 03 fd fd 00 03 : ................
77a2 : __ __ __ BYT fd 00 00 fd fd 00 fd 03 fd 00 03 03 00 03 00 fd : ................
77b2 : __ __ __ BYT 03 00 03 03 fd 00 fd 03 00 fd 00 fd fd 00 03 fd : ................
77c2 : __ __ __ BYT 03 fd 00 03 03 00 03 00 fd 03 00 03 fd fd 00 fd : ................
77d2 : __ __ __ BYT 03 00 fd 00 fd fd 00 03                         : ........
--------------------------------------------------------------------
sin256:
77da : __ __ __ BYT 00 00 65 00 c9 00 2d 01 91 01 f5 01 59 02 bc 02 : ..e...-.....Y...
77ea : __ __ __ BYT 1f 03 81 03 e3 03 44 04 a5 04 05 05 64 05 c2 05 : ......D.....d...
77fa : __ __ __ BYT 1f 06 7c 06 d7 06 32 07 8b 07 e3 07 3a 08 8f 08 : ..|...2.....:...
780a : __ __ __ BYT e4 08 37 09 88 09 d8 09 26 0a 73 0a bf 0a 08 0b : ..7.....&.s.....
781a : __ __ __ BYT 50 0b 97 0b db 0b 1e 0c 5e 0c 9d 0c da 0c 15 0d : P.......^.......
782a : __ __ __ BYT 4e 0d 85 0d b9 0d ec 0d 1c 0e 4b 0e 77 0e a1 0e : N.........K.w...
783a : __ __ __ BYT c8 0e ee 0e 11 0f 31 0f 50 0f 6c 0f 85 0f 9c 0f : ......1.P.l.....
784a : __ __ __ BYT b1 0f c4 0f d4 0f e1 0f ec 0f f5 0f fb 0f ff 0f : ................
785a : __ __ __ BYT 00 10 ff 0f fb 0f f5 0f ec 0f e1 0f d4 0f c4 0f : ................
786a : __ __ __ BYT b1 0f 9c 0f 85 0f 6c 0f 50 0f 31 0f 11 0f ee 0e : ......l.P.1.....
787a : __ __ __ BYT c8 0e a1 0e 77 0e 4b 0e 1c 0e ec 0d b9 0d 85 0d : ....w.K.........
788a : __ __ __ BYT 4e 0d 15 0d da 0c 9d 0c 5e 0c 1e 0c db 0b 97 0b : N.......^.......
789a : __ __ __ BYT 50 0b 08 0b bf 0a 73 0a 26 0a d8 09 88 09 37 09 : P.....s.&.....7.
78aa : __ __ __ BYT e4 08 8f 08 3a 08 e3 07 8b 07 32 07 d7 06 7c 06 : ....:.....2...|.
78ba : __ __ __ BYT 1f 06 c2 05 64 05 05 05 a5 04 44 04 e3 03 81 03 : ....d.....D.....
78ca : __ __ __ BYT 1f 03 bc 02 59 02 f5 01 91 01 2d 01 c9 00 65 00 : ....Y.....-...e.
78da : __ __ __ BYT 00 00 9b ff 37 ff d3 fe 6f fe 0b fe a7 fd 44 fd : ....7...o.....D.
78ea : __ __ __ BYT e1 fc 7f fc 1d fc bc fb 5b fb fb fa 9c fa 3e fa : ........[.....>.
78fa : __ __ __ BYT e1 f9 84 f9 29 f9 ce f8 75 f8 1d f8 c6 f7 71 f7 : ....)...u.....q.
790a : __ __ __ BYT 1c f7 c9 f6 78 f6 28 f6 da f5 8d f5 41 f5 f8 f4 : ....x.(.....A...
791a : __ __ __ BYT b0 f4 69 f4 25 f4 e2 f3 a2 f3 63 f3 26 f3 eb f2 : ..i.%.....c.&...
792a : __ __ __ BYT b2 f2 7b f2 47 f2 14 f2 e4 f1 b5 f1 89 f1 5f f1 : ..{.G........._.
793a : __ __ __ BYT 38 f1 12 f1 ef f0 cf f0 b0 f0 94 f0 7b f0 64 f0 : 8...........{.d.
794a : __ __ __ BYT 4f f0 3c f0 2c f0 1f f0 14 f0 0b f0 05 f0 01 f0 : O.<.,...........
795a : __ __ __ BYT 00 f0 01 f0 05 f0 0b f0 14 f0 1f f0 2c f0 3c f0 : ............,.<.
796a : __ __ __ BYT 4f f0 64 f0 7b f0 94 f0 b0 f0 cf f0 ef f0 12 f1 : O.d.{...........
797a : __ __ __ BYT 38 f1 5f f1 89 f1 b5 f1 e4 f1 14 f2 47 f2 7b f2 : 8._.........G.{.
798a : __ __ __ BYT b2 f2 eb f2 26 f3 63 f3 a2 f3 e2 f3 25 f4 69 f4 : ....&.c.....%.i.
799a : __ __ __ BYT b0 f4 f8 f4 41 f5 8d f5 da f5 28 f6 78 f6 c9 f6 : ....A.....(.x...
79aa : __ __ __ BYT 1c f7 71 f7 c6 f7 1d f8 75 f8 ce f8 29 f9 84 f9 : ..q.....u...)...
79ba : __ __ __ BYT e1 f9 3e fa 9c fa fb fa 5b fb bc fb 1d fc 7f fc : ..>.....[.......
79ca : __ __ __ BYT e1 fc 44 fd a7 fd 0b fe 6f fe d3 fe 37 ff 9b ff : ..D.....o...7...
--------------------------------------------------------------------
sum_to_col:
79da : __ __ __ BYT 00 00 00 01 01 02 02 03 03 03                   : ..........
--------------------------------------------------------------------
pal_cr:
79e4 : __ __ __ BYT 01 01 07 03                                     : ....
--------------------------------------------------------------------
cw:
79e8 : __ __ __ BSS	12
--------------------------------------------------------------------
Screen:
79f4 : __ __ __ BSS	8
--------------------------------------------------------------------
ball_x:
79fc : __ __ __ BSS	2
--------------------------------------------------------------------
ball_y:
79fe : __ __ __ BSS	2
--------------------------------------------------------------------
sin_lut:
7a00 : __ __ __ BYT 02 02 02 02 02 02 02 02 03 03 03 03 03 03 03 03 : ................
7a10 : __ __ __ BYT 03 03 03 03 03 03 03 03 03 02 02 02 02 02 02 02 : ................
7a20 : __ __ __ BYT 02 01 01 01 01 01 01 01 00 00 00 00 00 00 00 00 : ................
7a30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 01 01 01 01 01 01 : ................
--------------------------------------------------------------------
lat_wave:
7a40 : __ __ __ BYT 00 ff ff fe fe fd fd fc fc fb fb fb fa fa fa fa : ................
7a50 : __ __ __ BYT fa fa fa fb fb fb fc fc fd fd fe fe ff ff 00 00 : ................
7a60 : __ __ __ BYT 01 01 02 02 03 03 04 04 05 05 05 06 06 06 06 06 : ................
7a70 : __ __ __ BYT 06 06 05 05 05 04 04 03 03 02 02 01 01 00 00 ff : ................
--------------------------------------------------------------------
vert_wave:
7a80 : __ __ __ BYT 00 01 02 02 03 03 04 04 04 04 04 03 03 02 02 01 : ................
7a90 : __ __ __ BYT 00 ff fe fe fd fd fc fc fc fc fc fd fd fe fe ff : ................
7aa0 : __ __ __ BYT 00 01 02 02 03 03 04 04 04 04 04 03 03 02 02 01 : ................
7ab0 : __ __ __ BYT 00 ff fe fe fd fd fc fc fc fc fc fd fd fe fe ff : ................
--------------------------------------------------------------------
bitshift:
7ac0 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
7ad0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
7ae0 : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
7af0 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
uii_data:
7af8 : __ __ __ BSS	513
--------------------------------------------------------------------
uii_status:
7cf9 : __ __ __ BSS	257
--------------------------------------------------------------------
hdr:
7dfa : __ __ __ BSS	1084
--------------------------------------------------------------------
ball_z:
8236 : __ __ __ BSS	2
--------------------------------------------------------------------
modplay:
8238 : __ __ __ BSS	938
--------------------------------------------------------------------
tworks:
85e2 : __ __ __ BSS	8
--------------------------------------------------------------------
mod_row_buf:
85ea : __ __ __ BSS	16
--------------------------------------------------------------------
ball_vy:
85fa : __ __ __ BSS	1
--------------------------------------------------------------------
ball_vz:
85fb : __ __ __ BSS	1
--------------------------------------------------------------------
HeapNode:
85fc : __ __ __ BSS	4
--------------------------------------------------------------------
BLIT_CODE:
8600 : __ __ __ BSS	224
--------------------------------------------------------------------
tbuffer:
86e0 : __ __ __ BSS	320
--------------------------------------------------------------------
mx:
8820 : __ __ __ BSS	8
--------------------------------------------------------------------
vsx:
8828 : __ __ __ BSS	16
--------------------------------------------------------------------
vsy:
8838 : __ __ __ BSS	16
--------------------------------------------------------------------
VScreen:
8848 : __ __ __ BSS	8
--------------------------------------------------------------------
py_cur:
8850 : __ __ __ BSS	16
--------------------------------------------------------------------
px_cur:
8860 : __ __ __ BSS	16
--------------------------------------------------------------------
row_sin:
8900 : __ __ __ BSS	200
--------------------------------------------------------------------
row_buf:
8a00 : __ __ __ BSS	160
--------------------------------------------------------------------
tex_flat:
8aa0 : __ __ __ BSS	1024
