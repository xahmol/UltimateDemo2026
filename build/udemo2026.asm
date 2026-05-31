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
0811 : a2 7c __ LDX #$7c
0813 : a0 38 __ LDY #$38
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
082a : c0 e8 __ CPY #$e8
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
0ab0 : 8d ff 6e STA $6eff ; (uii_target + 0)
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
0ad5 : ad 39 7e LDA $7e39 ; (uii_status[0] + 0)
0ad8 : c9 30 __ CMP #$30
0ada : d0 12 __ BNE $0aee ; (main.s10 + 0)
.s68:
0adc : ad 3a 7e LDA $7e3a ; (uii_status[0] + 1)
0adf : c9 30 __ CMP #$30
0ae1 : d0 0b __ BNE $0aee ; (main.s10 + 0)
.s69:
0ae3 : ad 38 7c LDA $7c38 ; (uii_data[0] + 0)
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
0b07 : ad 39 7e LDA $7e39 ; (uii_status[0] + 0)
0b0a : c9 30 __ CMP #$30
0b0c : d0 2e __ BNE $0b3c ; (main.s13 + 0)
.s65:
0b0e : ad 3a 7e LDA $7e3a ; (uii_status[0] + 1)
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
0b59 : 20 d7 73 JSR $73d7 ; (screen_result@proxy + 0)
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
0ce9 : 8d 07 84 STA $8407 ; (modplay.stereo + 0)
0cec : 8d 09 84 STA $8409 ; (modplay.loop_song + 0)
0cef : a9 a0 __ LDA #$a0
0cf1 : 8d 06 84 STA $8406 ; (modplay.master_volume + 0)
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
0d2c : 20 e3 4d JSR $4de3 ; (mandel_run.s4 + 0)
0d2f : 20 a1 52 JSR $52a1 ; (ball_run.s1 + 0)
0d32 : 20 b1 60 JSR $60b1 ; (vectors_run.s1 + 0)
0d35 : 20 b1 65 JSR $65b1 ; (plasma_run.s1 + 0)
0d38 : 20 6c 68 JSR $686c ; (tunnel_run.s1 + 0)
0d3b : a9 10 __ LDA #$10
0d3d : 8d 02 a0 STA $a002 
0d40 : a9 03 __ LDA #$03
0d42 : 8d 03 a0 STA $a003 
0d45 : a5 54 __ LDA T3 + 0 
0d47 : f0 03 __ BEQ $0d4c ; (main.l20 + 0)
.s24:
0d49 : 20 fb 6d JSR $6dfb ; (modplay_stop.s4 + 0)
.l20:
0d4c : 20 e4 ff JSR $ffe4 
0d4f : aa __ __ TAX
0d50 : d0 fa __ BNE $0d4c ; (main.l20 + 0)
.s21:
0d52 : 20 f1 15 JSR $15f1 ; (turbo_set.s4 + 0)
0d55 : a9 34 __ LDA #$34
0d57 : 85 16 __ STA P9 
0d59 : a9 6e __ LDA #$6e
0d5b : 85 17 __ STA P10 
0d5d : 20 66 0e JSR $0e66 ; (screen_init.s4 + 0)
0d60 : 20 a2 10 JSR $10a2 ; (cwin_cursor_newline.s4 + 0)
0d63 : a9 49 __ LDA #$49
0d65 : 85 10 __ STA P3 
0d67 : a9 6e __ LDA #$6e
0d69 : 85 11 __ STA P4 
0d6b : 20 9b 10 JSR $109b ; (screen_info.s4 + 0)
0d6e : a9 01 __ LDA #$01
0d70 : 85 12 __ STA P5 
0d72 : 20 a2 10 JSR $10a2 ; (cwin_cursor_newline.s4 + 0)
0d75 : a9 61 __ LDA #$61
0d77 : 85 10 __ STA P3 
0d79 : a9 6e __ LDA #$6e
0d7b : 85 14 __ STA P7 
0d7d : a9 6e __ LDA #$6e
0d7f : 85 11 __ STA P4 
0d81 : a9 67 __ LDA #$67
0d83 : 85 13 __ STA P6 
0d85 : 20 64 11 JSR $1164 ; (screen_result.s4 + 0)
0d88 : a9 7d __ LDA #$7d
0d8a : 85 10 __ STA P3 
0d8c : a9 6e __ LDA #$6e
0d8e : 85 14 __ STA P7 
0d90 : a9 6e __ LDA #$6e
0d92 : 85 11 __ STA P4 
0d94 : a9 83 __ LDA #$83
0d96 : 85 13 __ STA P6 
0d98 : 20 64 11 JSR $1164 ; (screen_result.s4 + 0)
0d9b : a9 92 __ LDA #$92
0d9d : 85 10 __ STA P3 
0d9f : a9 6e __ LDA #$6e
0da1 : 85 14 __ STA P7 
0da3 : a9 6e __ LDA #$6e
0da5 : 85 11 __ STA P4 
0da7 : a9 98 __ LDA #$98
0da9 : 85 13 __ STA P6 
0dab : 20 64 11 JSR $1164 ; (screen_result.s4 + 0)
0dae : a9 aa __ LDA #$aa
0db0 : 85 10 __ STA P3 
0db2 : a9 6e __ LDA #$6e
0db4 : 85 14 __ STA P7 
0db6 : a9 6e __ LDA #$6e
0db8 : 85 11 __ STA P4 
0dba : a9 b0 __ LDA #$b0
0dbc : 85 13 __ STA P6 
0dbe : 20 64 11 JSR $1164 ; (screen_result.s4 + 0)
0dc1 : a9 c4 __ LDA #$c4
0dc3 : 85 10 __ STA P3 
0dc5 : a9 6e __ LDA #$6e
0dc7 : 85 14 __ STA P7 
0dc9 : a9 6e __ LDA #$6e
0dcb : 85 11 __ STA P4 
0dcd : a9 ca __ LDA #$ca
0dcf : 85 13 __ STA P6 
0dd1 : 20 64 11 JSR $1164 ; (screen_result.s4 + 0)
0dd4 : a9 e0 __ LDA #$e0
0dd6 : 85 10 __ STA P3 
0dd8 : a9 6e __ LDA #$6e
0dda : 85 14 __ STA P7 
0ddc : a9 6e __ LDA #$6e
0dde : 85 11 __ STA P4 
0de0 : a9 e6 __ LDA #$e6
0de2 : 85 13 __ STA P6 
0de4 : 20 64 11 JSR $1164 ; (screen_result.s4 + 0)
0de7 : a5 54 __ LDA T3 + 0 
0de9 : f0 13 __ BEQ $0dfe ; (main.s22 + 0)
.s23:
0deb : a9 0d __ LDA #$0d
0ded : 85 10 __ STA P3 
0def : a9 6f __ LDA #$6f
0df1 : 85 14 __ STA P7 
0df3 : a9 1d __ LDA #$1d
0df5 : 85 11 __ STA P4 
0df7 : a9 00 __ LDA #$00
0df9 : 85 13 __ STA P6 
0dfb : 20 64 11 JSR $1164 ; (screen_result.s4 + 0)
.s22:
0dfe : 20 a2 10 JSR $10a2 ; (cwin_cursor_newline.s4 + 0)
0e01 : a9 17 __ LDA #$17
0e03 : 85 10 __ STA P3 
0e05 : a9 6f __ LDA #$6f
0e07 : 85 11 __ STA P4 
0e09 : 20 9b 10 JSR $109b ; (screen_info.s4 + 0)
0e0c : a9 34 __ LDA #$34
0e0e : 85 10 __ STA P3 
0e10 : a9 6f __ LDA #$6f
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
0e49 : 20 d7 73 JSR $73d7 ; (screen_result@proxy + 0)
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
0e75 : 8d ce 7b STA $7bce ; (cw.sx + 0)
0e78 : 8d cf 7b STA $7bcf ; (cw.sy + 0)
0e7b : 8d d2 7b STA $7bd2 ; (cw.cx + 0)
0e7e : 8d d3 7b STA $7bd3 ; (cw.cy + 0)
0e81 : a2 19 __ LDX #$19
0e83 : 8e d1 7b STX $7bd1 ; (cw.wy + 0)
0e86 : 8d 20 d0 STA $d020 
0e89 : 8d 21 d0 STA $d021 
0e8c : 8d d6 7b STA $7bd6 ; (cw.sp + 0)
0e8f : 8d d8 7b STA $7bd8 ; (cw.cp + 0)
0e92 : a9 04 __ LDA #$04
0e94 : 8d d7 7b STA $7bd7 ; (cw.sp + 1)
0e97 : 85 44 __ STA T0 + 1 
0e99 : a9 d8 __ LDA #$d8
0e9b : 8d d9 7b STA $7bd9 ; (cw.cp + 1)
0e9e : 85 46 __ STA T1 + 1 
0ea0 : a2 00 __ LDX #$00
0ea2 : 86 45 __ STX T1 + 0 
0ea4 : a9 28 __ LDA #$28
0ea6 : 8d d0 7b STA $7bd0 ; (cw.wx + 0)
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
0ebb : ec d1 7b CPX $7bd1 ; (cw.wy + 0)
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
0ee6 : 8d d2 7b STA $7bd2 ; (cw.cx + 0)
0ee9 : a9 03 __ LDA #$03
0eeb : 8d d3 7b STA $7bd3 ; (cw.cy + 0)
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
0f04 : ad d0 7b LDA $7bd0 ; (cw.wx + 0)
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
0f74 : ad d6 7b LDA $7bd6 ; (cw.sp + 0)
0f77 : 7d 6f 74 ADC $746f,x ; (mul40[0] + 0)
0f7a : 85 46 __ STA T2 + 0 
0f7c : ad d7 7b LDA $7bd7 ; (cw.sp + 1)
0f7f : 7d 70 74 ADC $7470,x ; (mul40[0] + 1)
0f82 : 85 47 __ STA T2 + 1 
0f84 : ad d8 7b LDA $7bd8 ; (cw.cp + 0)
0f87 : 18 __ __ CLC
0f88 : 7d 6f 74 ADC $746f,x ; (mul40[0] + 0)
0f8b : 85 48 __ STA T3 + 0 
0f8d : ad d9 7b LDA $7bd9 ; (cw.cp + 1)
0f90 : 7d 70 74 ADC $7470,x ; (mul40[0] + 1)
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
0fce : bd a1 74 LDA $74a1,x ; (p2smap[0] + 0)
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
1002 : bd 6f 74 LDA $746f,x ; (mul40[0] + 0)
1005 : 65 0d __ ADC P0 ; (x + 0)
1007 : 85 1b __ STA ACCU + 0 
1009 : bd 70 74 LDA $7470,x ; (mul40[0] + 1)
100c : 69 00 __ ADC #$00
100e : 85 1c __ STA ACCU + 1 
1010 : ad d6 7b LDA $7bd6 ; (cw.sp + 0)
1013 : 65 1b __ ADC ACCU + 0 
1015 : 85 43 __ STA T1 + 0 
1017 : ad d7 7b LDA $7bd7 ; (cw.sp + 1)
101a : 65 1c __ ADC ACCU + 1 
101c : 85 44 __ STA T1 + 1 
101e : ad d8 7b LDA $7bd8 ; (cw.cp + 0)
1021 : 18 __ __ CLC
1022 : 65 1b __ ADC ACCU + 0 
1024 : 85 1b __ STA ACCU + 0 
1026 : ad d9 7b LDA $7bd9 ; (cw.cp + 1)
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
1040 : a9 74 __ LDA #$74
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
1091 : __ __ __ BYT 30 35 33 31 2d 30 39 35 30 00                   : 0531-0950.
--------------------------------------------------------------------
screen_info: ; screen_info(const u8*)->void
;  23, "/home/xahmol/git/UltimateDemo2026/src/screen.h"
.s4:
109b : a9 0f __ LDA #$0f
109d : 85 0f __ STA P2 
109f : 20 37 74 JSR $7437 ; (cwin_put_string@proxy + 0)
--------------------------------------------------------------------
cwin_cursor_newline: ; cwin_cursor_newline(struct CharWin*)->void
;  44, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
10a2 : ad d3 7b LDA $7bd3 ; (cw.cy + 0)
10a5 : 18 __ __ CLC
10a6 : 69 01 __ ADC #$01
10a8 : a8 __ __ TAY
10a9 : a9 00 __ LDA #$00
10ab : 8d d2 7b STA $7bd2 ; (cw.cx + 0)
10ae : 2a __ __ ROL
10af : d0 08 __ BNE $10b9 ; (cwin_cursor_newline.s3 + 0)
.s6:
10b1 : cc d1 7b CPY $7bd1 ; (cw.wy + 0)
10b4 : b0 03 __ BCS $10b9 ; (cwin_cursor_newline.s3 + 0)
.s5:
10b6 : ee d3 7b INC $7bd3 ; (cw.cy + 0)
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
10c2 : ad d3 7b LDA $7bd3 ; (cw.cy + 0)
10c5 : 0a __ __ ASL
10c6 : aa __ __ TAX
10c7 : bd 6f 74 LDA $746f,x ; (mul40[0] + 0)
10ca : 6d d2 7b ADC $7bd2 ; (cw.cx + 0)
10cd : 85 1b __ STA ACCU + 0 
10cf : bd 70 74 LDA $7470,x ; (mul40[0] + 1)
10d2 : 69 00 __ ADC #$00
10d4 : 85 1c __ STA ACCU + 1 
10d6 : ad d6 7b LDA $7bd6 ; (cw.sp + 0)
10d9 : 65 1b __ ADC ACCU + 0 
10db : 85 43 __ STA T1 + 0 
10dd : ad d7 7b LDA $7bd7 ; (cw.sp + 1)
10e0 : 65 1c __ ADC ACCU + 1 
10e2 : 85 44 __ STA T1 + 1 
10e4 : ad d8 7b LDA $7bd8 ; (cw.cp + 0)
10e7 : 18 __ __ CLC
10e8 : 65 1b __ ADC ACCU + 0 
10ea : 85 1b __ STA ACCU + 0 
10ec : ad d9 7b LDA $7bd9 ; (cw.cp + 1)
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
10ff : bd a9 74 LDA $74a9,x ; (p2smap[0] + 0)
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
1111 : 6d d2 7b ADC $7bd2 ; (cw.cx + 0)
1114 : cd d0 7b CMP $7bd0 ; (cw.wx + 0)
1117 : 90 05 __ BCC $111e ; (cwin_put_string.s3 + 0)
.s6:
1119 : a9 00 __ LDA #$00
111b : ee d3 7b INC $7bd3 ; (cw.cy + 0)
.s3:
111e : 8d d2 7b STA $7bd2 ; (cw.cx + 0)
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
116b : 20 37 74 JSR $7437 ; (cwin_put_string@proxy + 0)
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
1238 : 20 37 74 JSR $7437 ; (cwin_put_string@proxy + 0)
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
12a1 : ad ff 6e LDA $6eff ; (uii_target + 0)
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
131e : 8d 38 7c STA $7c38 ; (uii_data[0] + 0)
1321 : a2 38 __ LDX #$38
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
1337 : 69 7c __ ADC #$7c
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
134e : 8d 39 7e STA $7e39 ; (uii_status[0] + 0)
1351 : a2 39 __ LDX #$39
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
1367 : 69 7e __ ADC #$7e
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
138c : 8d ff 6e STA $6eff ; (uii_target + 0)
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
13c6 : ad 38 7c LDA $7c38 ; (uii_data[0] + 0)
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
13e9 : bd 38 7c LDA $7c38,x ; (uii_data[0] + 0)
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
173b : bd b2 74 LDA $74b2,x ; (audio_ch_base[0] + 1)
173e : 85 44 __ STA T0 + 1 
1740 : a9 00 __ LDA #$00
1742 : bc b1 74 LDY $74b1,x ; (audio_ch_base[0] + 0)
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
17fb : 20 3b 70 JSR $703b ; (divmod + 0)
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
1820 : 20 3b 70 JSR $703b ; (divmod + 0)
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
187b : a9 bf __ LDA #$bf
187d : 85 0d __ STA P0 
187f : 20 68 74 JSR $7468 ; (strlen@proxy + 0)
1882 : 18 __ __ CLC
1883 : a5 1b __ LDA ACCU + 0 
1885 : 69 02 __ ADC #$02
1887 : 85 1b __ STA ACCU + 0 
1889 : 90 02 __ BCC $188d ; (uii_change_dir.s11 + 0)
.s10:
188b : e6 1c __ INC ACCU + 1 
.s11:
188d : 20 77 71 JSR $7177 ; (crt_malloc + 0)
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
18a4 : a9 74 __ LDA #$74
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
18ba : a9 74 __ LDA #$74
18bc : 85 0e __ STA P1 
18be : a6 45 __ LDX T1 + 0 
18c0 : 8a __ __ TXA
18c1 : 18 __ __ CLC
18c2 : 69 02 __ ADC #$02
18c4 : a8 __ __ TAY
18c5 : bd bf 74 LDA $74bf,x ; (mod_dir[0] + 0)
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
18db : 8d ff 6e STA $6eff ; (uii_target + 0)
18de : 20 68 74 JSR $7468 ; (strlen@proxy + 0)
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
18f9 : 20 6f 72 JSR $726f ; (crt_free@proxy + 0)
18fc : 20 4c 13 JSR $134c ; (uii_readstatus.s4 + 0)
18ff : 4c aa 13 JMP $13aa ; (uii_accept.s4 + 0)
--------------------------------------------------------------------
modplay_load: ; modplay_load(u8*,u32)->u8
; 209, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s4:
1902 : 20 6e 19 JSR $196e ; (uii_open_file.s4 + 0)
1905 : ad 39 7e LDA $7e39 ; (uii_status[0] + 0)
1908 : c9 30 __ CMP #$30
190a : d0 07 __ BNE $1913 ; (modplay_load.s15 + 0)
.s5:
190c : ad 3a 7e LDA $7e3a ; (uii_status[0] + 1)
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
194a : ad 39 7e LDA $7e39 ; (uii_status[0] + 0)
194d : c9 30 __ CMP #$30
194f : d0 0b __ BNE $195c ; (modplay_load.s10 + 0)
.s8:
1951 : ad 3a 7e LDA $7e3a ; (uii_status[0] + 1)
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
196e : a9 d0 __ LDA #$d0
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
1980 : 20 77 71 JSR $7177 ; (crt_malloc + 0)
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
1997 : a9 74 __ LDA #$74
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
19b1 : a9 74 __ LDA #$74
19b3 : 85 0e __ STA P1 
19b5 : a6 45 __ LDX T1 + 0 
19b7 : 8a __ __ TXA
19b8 : 18 __ __ CLC
19b9 : 69 03 __ ADC #$03
19bb : a8 __ __ TAY
19bc : bd d0 74 LDA $74d0,x ; (mod_file[0] + 0)
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
19d2 : 8d ff 6e STA $6eff ; (uii_target + 0)
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
19f0 : 20 6f 72 JSR $726f ; (crt_free@proxy + 0)
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
1a0f : 8d ff 6e STA $6eff ; (uii_target + 0)
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
1a4b : 8d 78 83 STA $8378 ; (modplay.reu_base + 0)
1a4e : 8d 79 83 STA $8379 ; (modplay.reu_base + 1)
1a51 : 8d 7a 83 STA $837a ; (modplay.reu_base + 2)
1a54 : 8d 7b 83 STA $837b ; (modplay.reu_base + 3)
1a57 : a2 3a __ LDX #$3a
1a59 : 8e 02 df STX $df02 
1a5c : a2 7f __ LDX #$7f
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
1a7e : ad 72 83 LDA $8372 ; (hdr[0] + 1080)
1a81 : c9 4d __ CMP #$4d
1a83 : f0 03 __ BEQ $1a88 ; (modplay_init.s48 + 0)
1a85 : 4c e8 1c JMP $1ce8 ; (modplay_init.s5 + 0)
.s48:
1a88 : ad 73 83 LDA $8373 ; (hdr[0] + 1081)
1a8b : c9 2e __ CMP #$2e
1a8d : d0 03 __ BNE $1a92 ; (modplay_init.s49 + 0)
1a8f : 4c d7 1c JMP $1cd7 ; (modplay_init.s52 + 0)
.s49:
1a92 : c9 21 __ CMP #$21
1a94 : d0 0e __ BNE $1aa4 ; (modplay_init.s6 + 0)
.s50:
1a96 : ad 74 83 LDA $8374 ; (hdr[0] + 1082)
1a99 : c9 4b __ CMP #$4b
1a9b : d0 07 __ BNE $1aa4 ; (modplay_init.s6 + 0)
.s51:
1a9d : ad 75 83 LDA $8375 ; (hdr[0] + 1083)
1aa0 : c9 21 __ CMP #$21
1aa2 : f0 1c __ BEQ $1ac0 ; (modplay_init.s44 + 0)
.s6:
1aa4 : ad 72 83 LDA $8372 ; (hdr[0] + 1080)
1aa7 : c9 46 __ CMP #$46
1aa9 : d0 19 __ BNE $1ac4 ; (modplay_init.s7 + 0)
.s41:
1aab : ad 73 83 LDA $8373 ; (hdr[0] + 1081)
1aae : c9 4c __ CMP #$4c
1ab0 : d0 12 __ BNE $1ac4 ; (modplay_init.s7 + 0)
.s42:
1ab2 : ad 74 83 LDA $8374 ; (hdr[0] + 1082)
1ab5 : c9 54 __ CMP #$54
1ab7 : d0 0b __ BNE $1ac4 ; (modplay_init.s7 + 0)
.s43:
1ab9 : ad 75 83 LDA $8375 ; (hdr[0] + 1083)
1abc : c9 34 __ CMP #$34
1abe : d0 04 __ BNE $1ac4 ; (modplay_init.s7 + 0)
.s44:
1ac0 : a9 1f __ LDA #$1f
1ac2 : d0 17 __ BNE $1adb ; (modplay_init.s12 + 0)
.s7:
1ac4 : a2 00 __ LDX #$00
.l8:
1ac6 : bd 72 83 LDA $8372,x ; (hdr[0] + 1080)
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
1adb : 8d 7d 83 STA $837d ; (modplay.num_samples + 0)
1ade : ad f0 82 LDA $82f0 ; (hdr[0] + 950)
1ae1 : 8d 7c 83 STA $837c ; (modplay.song_length + 0)
1ae4 : d0 09 __ BNE $1aef ; (modplay_init.s39 + 0)
.s62:
1ae6 : a9 80 __ LDA #$80
.s13:
1ae8 : 8d 7c 83 STA $837c ; (modplay.song_length + 0)
.s14:
1aeb : a2 7f __ LDX #$7f
1aed : d0 09 __ BNE $1af8 ; (modplay_init.l15 + 0)
.s39:
1aef : a9 80 __ LDA #$80
1af1 : cd f0 82 CMP $82f0 ; (hdr[0] + 950)
1af4 : b0 f5 __ BCS $1aeb ; (modplay_init.s14 + 0)
1af6 : 90 f0 __ BCC $1ae8 ; (modplay_init.s13 + 0)
.l15:
1af8 : bd f2 82 LDA $82f2,x ; (hdr[0] + 952)
1afb : 9d 7f 83 STA $837f,x ; (modplay.order_table[0] + 0)
1afe : ca __ __ DEX
1aff : 10 f7 __ BPL $1af8 ; (modplay_init.l15 + 0)
.s16:
1b01 : a2 00 __ LDX #$00
1b03 : a0 00 __ LDY #$00
.l17:
1b05 : 98 __ __ TYA
1b06 : dd 7f 83 CMP $837f,x ; (modplay.order_table[0] + 0)
1b09 : b0 04 __ BCS $1b0f ; (modplay_init.s18 + 0)
.s38:
1b0b : bd 7f 83 LDA $837f,x ; (modplay.order_table[0] + 0)
1b0e : a8 __ __ TAY
.s18:
1b0f : e8 __ __ INX
1b10 : 10 f3 __ BPL $1b05 ; (modplay_init.l17 + 0)
.s19:
1b12 : 18 __ __ CLC
1b13 : 69 01 __ ADC #$01
1b15 : 85 1c __ STA ACCU + 1 
1b17 : 8d 7e 83 STA $837e ; (modplay.num_patterns + 0)
1b1a : a9 00 __ LDA #$00
1b1c : 06 1c __ ASL ACCU + 1 
1b1e : 2a __ __ ROL
1b1f : 06 1c __ ASL ACCU + 1 
1b21 : 2a __ __ ROL
1b22 : 85 1d __ STA ACCU + 2 
1b24 : ad 7d 83 LDA $837d ; (modplay.num_samples + 0)
1b27 : c9 1f __ CMP #$1f
1b29 : d0 03 __ BNE $1b2e ; (modplay_init.s20 + 0)
1b2b : 4c be 1c JMP $1cbe ; (modplay_init.s37 + 0)
.s20:
1b2e : a5 1c __ LDA ACCU + 1 
1b30 : 09 02 __ ORA #$02
1b32 : 85 1c __ STA ACCU + 1 
1b34 : a9 58 __ LDA #$58
1b36 : 85 1b __ STA ACCU + 0 
1b38 : ad 7d 83 LDA $837d ; (modplay.num_samples + 0)
1b3b : d0 66 __ BNE $1ba3 ; (modplay_init.s31 + 0)
.s21:
1b3d : a9 00 __ LDA #$00
1b3f : 8d da 7b STA $7bda ; (mod_paused + 0)
1b42 : 8d ff 83 STA $83ff ; (modplay.order_pos + 0)
1b45 : 8d 01 84 STA $8401 ; (modplay.row + 0)
1b48 : 8d 02 84 STA $8402 ; (modplay.tick + 0)
1b4b : 8d 08 84 STA $8408 ; (modplay.active + 0)
1b4e : ad 7f 83 LDA $837f ; (modplay.order_table[0] + 0)
1b51 : 8d 00 84 STA $8400 ; (modplay.pattern_num + 0)
1b54 : a9 01 __ LDA #$01
1b56 : 8d 07 84 STA $8407 ; (modplay.stereo + 0)
1b59 : 8d 09 84 STA $8409 ; (modplay.loop_song + 0)
1b5c : a9 06 __ LDA #$06
1b5e : 8d 03 84 STA $8403 ; (modplay.ticks_per_row + 0)
1b61 : a9 7d __ LDA #$7d
1b63 : 8d 04 84 STA $8404 ; (modplay.bpm + 0)
1b66 : a9 00 __ LDA #$00
1b68 : a2 c8 __ LDX #$c8
1b6a : 8e 06 84 STX $8406 ; (modplay.master_volume + 0)
.l22:
1b6d : ca __ __ DEX
1b6e : 9d 5a 86 STA $865a,x ; (modplay.channel[0].sample_num + 0)
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
1b87 : bd 76 73 LDA $7376,x ; (__multab50L + 0)
1b8a : aa __ __ TAX
1b8b : 98 __ __ TYA
1b8c : 9d 60 86 STA $8660,x ; (modplay.channel[0].pan + 0)
1b8f : e6 46 __ INC T2 + 0 
1b91 : a5 46 __ LDA T2 + 0 
1b93 : c9 04 __ CMP #$04
1b95 : b0 07 __ BCS $1b9e ; (modplay_init.s28 + 0)
.s29:
1b97 : ad 07 84 LDA $8407 ; (modplay.stereo + 0)
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
1bad : a9 0d __ LDA #$0d
1baf : 85 4e __ STA T6 + 0 
1bb1 : a9 84 __ LDA #$84
1bb3 : 85 4f __ STA T6 + 1 
1bb5 : a9 4e __ LDA #$4e
1bb7 : 85 50 __ STA T7 + 0 
1bb9 : a9 7f __ LDA #$7f
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
1cb3 : cd 7d 83 CMP $837d ; (modplay.num_samples + 0)
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
1cd7 : ad 74 83 LDA $8374 ; (hdr[0] + 1082)
1cda : c9 4b __ CMP #$4b
1cdc : d0 0a __ BNE $1ce8 ; (modplay_init.s5 + 0)
.s53:
1cde : ad 75 83 LDA $8375 ; (hdr[0] + 1083)
1ce1 : c9 2e __ CMP #$2e
1ce3 : d0 03 __ BNE $1ce8 ; (modplay_init.s5 + 0)
1ce5 : 4c c0 1a JMP $1ac0 ; (modplay_init.s44 + 0)
.s5:
1ce8 : ad 72 83 LDA $8372 ; (hdr[0] + 1080)
1ceb : c9 34 __ CMP #$34
1ced : f0 03 __ BEQ $1cf2 ; (modplay_init.s45 + 0)
1cef : 4c a4 1a JMP $1aa4 ; (modplay_init.s6 + 0)
.s45:
1cf2 : ad 73 83 LDA $8373 ; (hdr[0] + 1081)
1cf5 : c9 43 __ CMP #$43
1cf7 : f0 03 __ BEQ $1cfc ; (modplay_init.s46 + 0)
1cf9 : 4c c4 1a JMP $1ac4 ; (modplay_init.s7 + 0)
.s46:
1cfc : ad 74 83 LDA $8374 ; (hdr[0] + 1082)
1cff : c9 48 __ CMP #$48
1d01 : d0 f6 __ BNE $1cf9 ; (modplay_init.s45 + 7)
.s47:
1d03 : ad 75 83 LDA $8375 ; (hdr[0] + 1083)
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
20be : 20 51 74 JSR $7451 ; (vic_setmode@proxy + 0)
20c1 : a5 10 __ LDA P3 
20c3 : 8d db 7b STA $7bdb ; (Screen.data + 0)
20c6 : a5 11 __ LDA P4 
20c8 : 8d dc 7b STA $7bdc ; (Screen.data + 1)
20cb : a9 28 __ LDA #$28
20cd : 8d df 7b STA $7bdf ; (Screen.cwidth + 0)
20d0 : a9 19 __ LDA #$19
20d2 : 8d e0 7b STA $7be0 ; (Screen.cheight + 0)
20d5 : a9 40 __ LDA #$40
20d7 : 8d e1 7b STA $7be1 ; (Screen.width + 0)
20da : a9 01 __ LDA #$01
20dc : 8d e2 7b STA $7be2 ; (Screen.width + 1)
20df : a9 00 __ LDA #$00
20e1 : 8d 20 d0 STA $d020 
20e4 : 8d dd 7b STA $7bdd ; (Screen.rdata + 0)
20e7 : 8d de 7b STA $7bde ; (Screen.rdata + 1)
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
21ba : bd 00 75 LDA $7500,x ; (speed_nums[0] + 0)
21bd : 85 53 __ STA T1 + 0 
21bf : 85 0d __ STA P0 
21c1 : bd 01 75 LDA $7501,x ; (speed_nums[0] + 1)
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
22cc : bd 7a 73 LDA $737a,x ; (__multab7L + 0)
22cf : 18 __ __ CLC
22d0 : 69 20 __ ADC #$20
22d2 : 85 53 __ STA T2 + 0 
22d4 : a9 75 __ LDA #$75
22d6 : 69 00 __ ADC #$00
22d8 : 85 54 __ STA T2 + 1 
22da : a9 7b __ LDA #$7b
22dc : 85 15 __ STA P8 
22de : a9 db __ LDA #$db
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
22f6 : bd 20 7c LDA $7c20,x ; (bitshift[0] + 32)
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
2361 : bd 7b 75 LDA $757b,x ; (rmask[0] + 0)
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
238d : bd f8 74 LDA $74f8,x ; (lmask[0] + 0)
2390 : 85 52 __ STA T12 + 0 
2392 : 85 55 __ STA T13 + 0 
2394 : ad ee bf LDA $bfee ; (sstack + 4)
2397 : 85 4e __ STA T8 + 0 
2399 : a5 14 __ LDA P7 ; (sbm + 0)
239b : 85 4f __ STA T9 + 0 
239d : a6 15 __ LDX P8 ; (sbm + 1)
239f : 86 50 __ STX T9 + 1 
23a1 : c9 db __ CMP #$db
23a3 : d0 4d __ BNE $23f2 ; (bmu_bitblit.s111 + 0)
.s88:
23a5 : e0 7b __ CPX #$7b
23a7 : d0 49 __ BNE $23f2 ; (bmu_bitblit.s111 + 0)
.s72:
23a9 : a9 db __ LDA #$db
23ab : 85 4f __ STA T9 + 0 
23ad : a9 7b __ LDA #$7b
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
23fc : ad df 7b LDA $7bdf ; (Screen.cwidth + 0)
23ff : 85 51 __ STA T10 + 0 
2401 : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
2404 : ad db 7b LDA $7bdb ; (Screen.data + 0)
2407 : 18 __ __ CLC
2408 : 65 1b __ ADC ACCU + 0 ; (w + 0)
240a : 85 4a __ STA T4 + 0 
240c : ad dc 7b LDA $7bdc ; (Screen.data + 1)
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
243d : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
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
24c3 : 8d 00 88 STA $8800 ; (BLIT_CODE[0] + 0)
24c6 : a5 5c __ LDA T21 + 0 
24c8 : 8d 01 88 STA $8801 ; (BLIT_CODE[0] + 1)
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
24dd : 8d 02 88 STA $8802 ; (BLIT_CODE[0] + 2)
24e0 : a9 05 __ LDA #$05
24e2 : 8d 03 88 STA $8803 ; (BLIT_CODE[0] + 3)
24e5 : a9 85 __ LDA #$85
24e7 : 8d 04 88 STA $8804 ; (BLIT_CODE[0] + 4)
24ea : a9 0a __ LDA #$0a
24ec : 8d 05 88 STA $8805 ; (BLIT_CODE[0] + 5)
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
2509 : 9d 00 88 STA $8800,x ; (BLIT_CODE[0] + 0)
250c : a9 03 __ LDA #$03
250e : 9d 01 88 STA $8801,x ; (BLIT_CODE[0] + 1)
2511 : 9d 06 88 STA $8806,x ; (BLIT_CODE[0] + 6)
2514 : 9d 0a 88 STA $880a,x ; (BLIT_CODE[0] + 10)
2517 : a9 85 __ LDA #$85
2519 : 9d 02 88 STA $8802,x ; (BLIT_CODE[0] + 2)
251c : 9d 09 88 STA $8809,x ; (BLIT_CODE[0] + 9)
251f : a9 08 __ LDA #$08
2521 : 9d 03 88 STA $8803,x ; (BLIT_CODE[0] + 3)
2524 : 9d 08 88 STA $8808,x ; (BLIT_CODE[0] + 8)
2527 : a9 a5 __ LDA #$a5
2529 : 9d 05 88 STA $8805,x ; (BLIT_CODE[0] + 5)
252c : a9 02 __ LDA #$02
252e : 9d 0c 88 STA $880c,x ; (BLIT_CODE[0] + 12)
2531 : a9 04 __ LDA #$04
2533 : 9d 0e 88 STA $880e,x ; (BLIT_CODE[0] + 14)
2536 : a5 58 __ LDA T17 + 0 
2538 : 9d 04 88 STA $8804,x ; (BLIT_CODE[0] + 4)
253b : a5 59 __ LDA T18 + 0 
253d : 09 08 __ ORA #$08
253f : 9d 07 88 STA $8807,x ; (BLIT_CODE[0] + 7)
2542 : a5 5a __ LDA T19 + 0 
2544 : 9d 0b 88 STA $880b,x ; (BLIT_CODE[0] + 11)
2547 : a5 5b __ LDA T20 + 0 
2549 : 09 04 __ ORA #$04
254b : 9d 0d 88 STA $880d,x ; (BLIT_CODE[0] + 13)
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
2576 : 9d fe 87 STA $87fe,x 
2579 : 18 __ __ CLC
257a : a5 5d __ LDA T22 + 0 
257c : 65 5c __ ADC T21 + 0 
257e : 9d ff 87 STA $87ff,x 
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
2598 : 9d 00 88 STA $8800,x ; (BLIT_CODE[0] + 0)
259b : a9 05 __ LDA #$05
259d : 9d 01 88 STA $8801,x ; (BLIT_CODE[0] + 1)
25a0 : a9 85 __ LDA #$85
25a2 : 9d 02 88 STA $8802,x ; (BLIT_CODE[0] + 2)
25a5 : a9 0a __ LDA #$0a
25a7 : 9d 03 88 STA $8803,x ; (BLIT_CODE[0] + 3)
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
25d3 : 9d 00 88 STA $8800,x ; (BLIT_CODE[0] + 0)
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
2607 : 20 00 88 JSR $8800 ; (BLIT_CODE[0] + 0)
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
2645 : 20 00 88 JSR $8800 ; (BLIT_CODE[0] + 0)
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
26be : 20 00 88 JSR $8800 ; (BLIT_CODE[0] + 0)
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
274b : 20 00 88 JSR $8800 ; (BLIT_CODE[0] + 0)
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
2768 : 9d fe 87 STA $87fe,x 
276b : 38 __ __ SEC
276c : a5 5e __ LDA T23 + 0 
276e : e9 01 __ SBC #$01
2770 : 9d ff 87 STA $87ff,x 
2773 : a5 5e __ LDA T23 + 0 
2775 : c9 20 __ CMP #$20
2777 : b0 0d __ BCS $2786 ; (bmu_bitblit.s45 + 0)
.s43:
2779 : a5 5f __ LDA T24 + 0 
277b : d0 09 __ BNE $2786 ; (bmu_bitblit.s45 + 0)
.s44:
277d : a5 58 __ LDA T17 + 0 
277f : a6 43 __ LDX T0 + 0 
2781 : 9d 00 88 STA $8800,x ; (BLIT_CODE[0] + 0)
2784 : e6 43 __ INC T0 + 0 
.s45:
2786 : a5 43 __ LDA T0 + 0 
2788 : 85 55 __ STA T13 + 0 
278a : a5 52 __ LDA T12 + 0 
278c : f0 1c __ BEQ $27aa ; (bmu_bitblit.s46 + 0)
.s60:
278e : a9 b1 __ LDA #$b1
2790 : a6 43 __ LDX T0 + 0 
2792 : 9d 00 88 STA $8800,x ; (BLIT_CODE[0] + 0)
2795 : a9 05 __ LDA #$05
2797 : 9d 01 88 STA $8801,x ; (BLIT_CODE[0] + 1)
279a : a9 85 __ LDA #$85
279c : 9d 02 88 STA $8802,x ; (BLIT_CODE[0] + 2)
279f : a9 0a __ LDA #$0a
27a1 : 9d 03 88 STA $8803,x ; (BLIT_CODE[0] + 3)
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
27d0 : 9d 00 88 STA $8800,x ; (BLIT_CODE[0] + 0)
27d3 : 18 __ __ CLC
27d4 : a5 5d __ LDA T22 + 0 
27d6 : 65 5c __ ADC T21 + 0 
27d8 : 9d 01 88 STA $8801,x ; (BLIT_CODE[0] + 1)
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
27f8 : 9d 00 88 STA $8800,x ; (BLIT_CODE[0] + 0)
27fb : e8 __ __ INX
.s52:
27fc : a9 98 __ LDA #$98
27fe : 9d 00 88 STA $8800,x ; (BLIT_CODE[0] + 0)
2801 : a9 08 __ LDA #$08
2803 : 9d 02 88 STA $8802,x ; (BLIT_CODE[0] + 2)
2806 : a9 a8 __ LDA #$a8
2808 : 9d 03 88 STA $8803,x ; (BLIT_CODE[0] + 3)
280b : a5 59 __ LDA T18 + 0 
280d : 09 08 __ ORA #$08
280f : 9d 01 88 STA $8801,x ; (BLIT_CODE[0] + 1)
2812 : 8a __ __ TXA
2813 : 18 __ __ CLC
2814 : 69 04 __ ADC #$04
2816 : 85 43 __ STA T0 + 0 
2818 : 24 4d __ BIT T6 + 0 
281a : 30 3a __ BMI $2856 ; (bmu_bitblit.s53 + 0)
.s54:
281c : a5 5a __ LDA T19 + 0 
281e : 9d 04 88 STA $8804,x ; (BLIT_CODE[0] + 4)
2821 : a5 5b __ LDA T20 + 0 
2823 : 09 04 __ ORA #$04
2825 : a8 __ __ TAY
2826 : a5 4c __ LDA T5 + 0 
2828 : d0 0d __ BNE $2837 ; (bmu_bitblit.s57 + 0)
.s55:
282a : a9 02 __ LDA #$02
282c : 9d 05 88 STA $8805,x ; (BLIT_CODE[0] + 5)
282f : 18 __ __ CLC
2830 : a5 43 __ LDA T0 + 0 
2832 : 69 02 __ ADC #$02
2834 : 4c 48 28 JMP $2848 ; (bmu_bitblit.s56 + 0)
.s57:
2837 : a9 04 __ LDA #$04
2839 : 9d 05 88 STA $8805,x ; (BLIT_CODE[0] + 5)
283c : 9d 07 88 STA $8807,x ; (BLIT_CODE[0] + 7)
283f : 98 __ __ TYA
2840 : 9d 06 88 STA $8806,x ; (BLIT_CODE[0] + 6)
2843 : 18 __ __ CLC
2844 : a5 43 __ LDA T0 + 0 
2846 : 69 04 __ ADC #$04
.s56:
2848 : aa __ __ TAX
2849 : e8 __ __ INX
284a : e8 __ __ INX
284b : 86 43 __ STX T0 + 0 
284d : 98 __ __ TYA
284e : 9d fe 87 STA $87fe,x 
2851 : a9 06 __ LDA #$06
2853 : 9d ff 87 STA $87ff,x 
.s53:
2856 : a9 ca __ LDA #$ca
2858 : a6 43 __ LDX T0 + 0 
285a : 9d 00 88 STA $8800,x ; (BLIT_CODE[0] + 0)
285d : a9 d0 __ LDA #$d0
285f : 9d 01 88 STA $8801,x ; (BLIT_CODE[0] + 1)
2862 : e6 43 __ INC T0 + 0 
2864 : a5 55 __ LDA T13 + 0 
2866 : 38 __ __ SEC
2867 : e5 43 __ SBC T0 + 0 
2869 : 38 __ __ SEC
286a : e9 02 __ SBC #$02
286c : 9d 02 88 STA $8802,x ; (BLIT_CODE[0] + 2)
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
287e : 8d 03 88 STA $8803 ; (BLIT_CODE[0] + 3)
2881 : 8d 08 88 STA $8808 ; (BLIT_CODE[0] + 8)
2884 : 8d 0c 88 STA $880c ; (BLIT_CODE[0] + 12)
2887 : a9 b1 __ LDA #$b1
2889 : 8d 02 88 STA $8802 ; (BLIT_CODE[0] + 2)
288c : a9 85 __ LDA #$85
288e : 8d 04 88 STA $8804 ; (BLIT_CODE[0] + 4)
2891 : 8d 0b 88 STA $880b ; (BLIT_CODE[0] + 11)
2894 : a9 08 __ LDA #$08
2896 : 8d 05 88 STA $8805 ; (BLIT_CODE[0] + 5)
2899 : 8d 0a 88 STA $880a ; (BLIT_CODE[0] + 10)
289c : a9 a5 __ LDA #$a5
289e : 8d 07 88 STA $8807 ; (BLIT_CODE[0] + 7)
28a1 : a9 02 __ LDA #$02
28a3 : 8d 0e 88 STA $880e ; (BLIT_CODE[0] + 14)
28a6 : a9 04 __ LDA #$04
28a8 : 8d 10 88 STA $8810 ; (BLIT_CODE[0] + 16)
28ab : a5 58 __ LDA T17 + 0 
28ad : 8d 06 88 STA $8806 ; (BLIT_CODE[0] + 6)
28b0 : a5 59 __ LDA T18 + 0 
28b2 : 09 08 __ ORA #$08
28b4 : 8d 09 88 STA $8809 ; (BLIT_CODE[0] + 9)
28b7 : a5 5a __ LDA T19 + 0 
28b9 : 8d 0d 88 STA $880d ; (BLIT_CODE[0] + 13)
28bc : a5 5b __ LDA T20 + 0 
28be : 09 04 __ ORA #$04
28c0 : 8d 0f 88 STA $880f ; (BLIT_CODE[0] + 15)
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
28e9 : ad df 7b LDA $7bdf ; (Screen.cwidth + 0)
28ec : 85 51 __ STA T10 + 0 
28ee : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
28f1 : ad db 7b LDA $7bdb ; (Screen.data + 0)
28f4 : 18 __ __ CLC
28f5 : 65 1b __ ADC ACCU + 0 ; (w + 0)
28f7 : 85 4c __ STA T5 + 0 
28f9 : ad dc 7b LDA $7bdc ; (Screen.data + 1)
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
2954 : ad df 7b LDA $7bdf ; (Screen.cwidth + 0)
2957 : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
295a : ad db 7b LDA $7bdb ; (Screen.data + 0)
295d : 18 __ __ CLC
295e : 65 1b __ ADC ACCU + 0 ; (w + 0)
2960 : 85 4a __ STA T4 + 0 
2962 : ad dc 7b LDA $7bdc ; (Screen.data + 1)
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
29d0 : 99 00 88 STA $8800,y ; (BLIT_CODE[0] + 0)
29d3 : a9 03 __ LDA #$03
29d5 : 99 01 88 STA $8801,y ; (BLIT_CODE[0] + 1)
.s35:
29d8 : 8a __ __ TXA
.s3:
29d9 : 60 __ __ RTS
.s6:
29da : a9 a5 __ LDA #$a5
29dc : 99 00 88 STA $8800,y ; (BLIT_CODE[0] + 0)
29df : a9 08 __ LDA #$08
29e1 : 99 01 88 STA $8801,y ; (BLIT_CODE[0] + 1)
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
29f3 : 99 02 88 STA $8802,y ; (BLIT_CODE[0] + 2)
29f6 : e8 __ __ INX
.s8:
29f7 : a9 85 __ LDA #$85
29f9 : 9d 00 88 STA $8800,x ; (BLIT_CODE[0] + 0)
29fc : 9d 04 88 STA $8804,x ; (BLIT_CODE[0] + 4)
29ff : a9 09 __ LDA #$09
2a01 : 9d 01 88 STA $8801,x ; (BLIT_CODE[0] + 1)
2a04 : a9 b1 __ LDA #$b1
2a06 : 9d 02 88 STA $8802,x ; (BLIT_CODE[0] + 2)
2a09 : a9 03 __ LDA #$03
2a0b : 9d 03 88 STA $8803,x ; (BLIT_CODE[0] + 3)
2a0e : a9 08 __ LDA #$08
2a10 : 9d 05 88 STA $8805,x ; (BLIT_CODE[0] + 5)
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
2a27 : 9d 06 88 STA $8806,x ; (BLIT_CODE[0] + 6)
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
2a3c : 9d 00 88 STA $8800,x ; (BLIT_CODE[0] + 0)
2a3f : a9 46 __ LDA #$46
2a41 : 9d 01 88 STA $8801,x ; (BLIT_CODE[0] + 1)
2a44 : a9 09 __ LDA #$09
2a46 : 9d 02 88 STA $8802,x ; (BLIT_CODE[0] + 2)
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
2a57 : 9d 00 88 STA $8800,x ; (BLIT_CODE[0] + 0)
2a5a : e8 __ __ INX
2a5b : 4c d8 29 JMP $29d8 ; (builddop_src.s35 + 0)
.l14:
2a5e : a9 09 __ LDA #$09
2a60 : a4 1b __ LDY ACCU + 0 
2a62 : 99 01 88 STA $8801,y ; (BLIT_CODE[0] + 1)
2a65 : 98 __ __ TYA
2a66 : 18 __ __ CLC
2a67 : 69 03 __ ADC #$03
2a69 : 85 1b __ STA ACCU + 0 
2a6b : e0 07 __ CPX #$07
2a6d : b0 0d __ BCS $2a7c ; (builddop_src.s15 + 0)
.s16:
2a6f : a9 26 __ LDA #$26
2a71 : 99 00 88 STA $8800,y ; (BLIT_CODE[0] + 0)
2a74 : a9 0a __ LDA #$0a
2a76 : 99 02 88 STA $8802,y ; (BLIT_CODE[0] + 2)
2a79 : e8 __ __ INX
2a7a : 90 e2 __ BCC $2a5e ; (builddop_src.l14 + 0)
.s15:
2a7c : a9 a5 __ LDA #$a5
2a7e : 99 00 88 STA $8800,y ; (BLIT_CODE[0] + 0)
2a81 : a9 2a __ LDA #$2a
2a83 : 99 02 88 STA $8802,y ; (BLIT_CODE[0] + 2)
2a86 : a5 1b __ LDA ACCU + 0 
2a88 : 60 __ __ RTS
.s17:
2a89 : a4 0e __ LDY P1 ; (shift + 0)
2a8b : c0 05 __ CPY #$05
2a8d : b0 3d __ BCS $2acc ; (builddop_src.s21 + 0)
.s18:
2a8f : a9 4a __ LDA #$4a
2a91 : 9d 06 88 STA $8806,x ; (BLIT_CODE[0] + 6)
2a94 : e6 1b __ INC ACCU + 0 
2a96 : c0 02 __ CPY #$02
2a98 : 90 1c __ BCC $2ab6 ; (builddop_src.s19 + 0)
.s20:
2a9a : a6 1b __ LDX ACCU + 0 
2a9c : 88 __ __ DEY
.l29:
2a9d : a9 66 __ LDA #$66
2a9f : 9d 00 88 STA $8800,x ; (BLIT_CODE[0] + 0)
2aa2 : a9 09 __ LDA #$09
2aa4 : 9d 01 88 STA $8801,x ; (BLIT_CODE[0] + 1)
2aa7 : a9 4a __ LDA #$4a
2aa9 : 9d 02 88 STA $8802,x ; (BLIT_CODE[0] + 2)
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
2aba : 9d 00 88 STA $8800,x ; (BLIT_CODE[0] + 0)
2abd : a9 09 __ LDA #$09
2abf : 9d 01 88 STA $8801,x ; (BLIT_CODE[0] + 1)
2ac2 : a9 6a __ LDA #$6a
2ac4 : 9d 02 88 STA $8802,x ; (BLIT_CODE[0] + 2)
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
2ad4 : 9d 00 88 STA $8800,x ; (BLIT_CODE[0] + 0)
2ad7 : a9 06 __ LDA #$06
2ad9 : 9d 01 88 STA $8801,x ; (BLIT_CODE[0] + 1)
2adc : a9 09 __ LDA #$09
2ade : 9d 02 88 STA $8802,x ; (BLIT_CODE[0] + 2)
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
2b25 : 9d 00 88 STA $8800,x ; (BLIT_CODE[0] + 0)
2b28 : a5 1c __ LDA ACCU + 1 
.s7:
2b2a : e8 __ __ INX
2b2b : e8 __ __ INX
2b2c : 86 0d __ STX P0 ; (ip + 0)
2b2e : 9d ff 87 STA $87ff,x 
2b31 : 4c 44 2b JMP $2b44 ; (builddop_op.s16 + 0)
.s15:
2b34 : a5 0e __ LDA P1 ; (op + 0)
2b36 : 0a __ __ ASL
2b37 : 10 0b __ BPL $2b44 ; (builddop_op.s16 + 0)
.s17:
2b39 : a9 49 __ LDA #$49
2b3b : a6 0d __ LDX P0 ; (ip + 0)
2b3d : 9d 00 88 STA $8800,x ; (BLIT_CODE[0] + 0)
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
2b4f : 9d ff 87 STA $87ff,x 
2b52 : b9 83 75 LDA $7583,y ; (blitops_op[0] + 0)
2b55 : 09 04 __ ORA #$04
2b57 : 9d fe 87 STA $87fe,x 
.s8:
2b5a : a5 0f __ LDA P2 ; (mask + 0)
2b5c : f0 3f __ BEQ $2b9d ; (builddop_op.s9 + 0)
.s10:
2b5e : a9 85 __ LDA #$85
2b60 : a4 0d __ LDY P0 ; (ip + 0)
2b62 : 99 00 88 STA $8800,y ; (BLIT_CODE[0] + 0)
2b65 : a9 09 __ LDA #$09
2b67 : 99 01 88 STA $8801,y ; (BLIT_CODE[0] + 1)
2b6a : 98 __ __ TYA
2b6b : 18 __ __ CLC
2b6c : 69 08 __ ADC #$08
2b6e : 85 0d __ STA P0 ; (ip + 0)
2b70 : a5 0e __ LDA P1 ; (op + 0)
2b72 : 29 10 __ AND #$10
2b74 : f0 09 __ BEQ $2b7f ; (builddop_op.s11 + 0)
.s13:
2b76 : a9 45 __ LDA #$45
2b78 : 99 02 88 STA $8802,y ; (BLIT_CODE[0] + 2)
2b7b : a9 0a __ LDA #$0a
2b7d : d0 07 __ BNE $2b86 ; (builddop_op.s12 + 0)
.s11:
2b7f : a9 51 __ LDA #$51
2b81 : 99 02 88 STA $8802,y ; (BLIT_CODE[0] + 2)
2b84 : a9 05 __ LDA #$05
.s12:
2b86 : 99 03 88 STA $8803,y ; (BLIT_CODE[0] + 3)
2b89 : a9 29 __ LDA #$29
2b8b : 99 04 88 STA $8804,y ; (BLIT_CODE[0] + 4)
2b8e : a5 0f __ LDA P2 ; (mask + 0)
2b90 : 99 05 88 STA $8805,y ; (BLIT_CODE[0] + 5)
2b93 : a9 45 __ LDA #$45
2b95 : 99 06 88 STA $8806,y ; (BLIT_CODE[0] + 6)
2b98 : a9 09 __ LDA #$09
2b9a : 99 07 88 STA $8807,y ; (BLIT_CODE[0] + 7)
.s9:
2b9d : a9 91 __ LDA #$91
2b9f : a6 0d __ LDX P0 ; (ip + 0)
2ba1 : 9d 00 88 STA $8800,x ; (BLIT_CODE[0] + 0)
2ba4 : a9 05 __ LDA #$05
2ba6 : 9d 01 88 STA $8801,x ; (BLIT_CODE[0] + 1)
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
2bc2 : 9d 00 88 STA $8800,x ; (BLIT_CODE[0] + 0)
2bc5 : a5 1b __ LDA ACCU + 0 
2bc7 : 4c 2a 2b JMP $2b2a ; (builddop_op.s7 + 0)
.s23:
2bca : a9 b1 __ LDA #$b1
2bcc : a4 0d __ LDY P0 ; (ip + 0)
2bce : 99 00 88 STA $8800,y ; (BLIT_CODE[0] + 0)
2bd1 : a9 05 __ LDA #$05
2bd3 : 99 01 88 STA $8801,y ; (BLIT_CODE[0] + 1)
2bd6 : 06 0e __ ASL P1 ; (op + 0)
2bd8 : 30 0a __ BMI $2be4 ; (builddop_op.s26 + 0)
.s24:
2bda : a9 29 __ LDA #$29
2bdc : 99 02 88 STA $8802,y ; (BLIT_CODE[0] + 2)
2bdf : a5 0f __ LDA P2 ; (mask + 0)
2be1 : 4c ed 2b JMP $2bed ; (builddop_op.s25 + 0)
.s26:
2be4 : a9 09 __ LDA #$09
2be6 : 99 02 88 STA $8802,y ; (BLIT_CODE[0] + 2)
2be9 : a5 0f __ LDA P2 ; (mask + 0)
2beb : 49 ff __ EOR #$ff
.s25:
2bed : 99 03 88 STA $8803,y ; (BLIT_CODE[0] + 3)
2bf0 : a9 91 __ LDA #$91
2bf2 : 99 04 88 STA $8804,y ; (BLIT_CODE[0] + 4)
2bf5 : a9 05 __ LDA #$05
2bf7 : 99 05 88 STA $8805,y ; (BLIT_CODE[0] + 5)
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
2c0e : bd 87 75 LDA $7587,x ; (step_msg[0] + 0)
2c11 : 85 56 __ STA T3 + 0 
2c13 : 85 0d __ STA P0 
2c15 : bd 88 75 LDA $7588,x ; (step_msg[0] + 1)
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
2c31 : bd 07 76 LDA $7607,x ; (TinyFont[0] + 96)
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
2ca6 : a9 d2 __ LDA #$d2
2ca8 : 85 14 __ STA P7 
2caa : a9 77 __ LDA #$77
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
2e60 : 8d e3 7b STA $7be3 ; (tworks[0] + 0)
2e63 : 8d e4 7b STA $7be4 ; (tworks[0] + 1)
2e66 : 8d e5 7b STA $7be5 ; (tworks[0] + 2)
2e69 : 8d e6 7b STA $7be6 ; (tworks[0] + 3)
2e6c : 8d e7 7b STA $7be7 ; (tworks[0] + 4)
2e6f : 8d e8 7b STA $7be8 ; (tworks[0] + 5)
2e72 : 8d e9 7b STA $7be9 ; (tworks[0] + 6)
2e75 : 8d ea 7b STA $7bea ; (tworks[0] + 7)
2e78 : 85 1b __ STA ACCU + 0 
2e7a : 85 1c __ STA ACCU + 1 
2e7c : ad d2 77 LDA $77d2 ; (tbitmap.data + 0)
2e7f : 85 43 __ STA T1 + 0 
2e81 : ad d3 77 LDA $77d3 ; (tbitmap.data + 1)
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
2e98 : a9 67 __ LDA #$67
2e9a : 7d a7 75 ADC $75a7,x ; (TinyFont[0] + 0)
2e9d : 85 45 __ STA T6 + 0 
2e9f : bd 07 76 LDA $7607,x ; (TinyFont[0] + 96)
2ea2 : 29 03 __ AND #$03
2ea4 : 69 76 __ ADC #$76
2ea6 : 85 46 __ STA T6 + 1 
2ea8 : bd 07 76 LDA $7607,x ; (TinyFont[0] + 96)
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
2ec7 : 2e e3 7b ROL $7be3 ; (tworks[0] + 0)
2eca : 0a __ __ ASL
2ecb : 2e e4 7b ROL $7be4 ; (tworks[0] + 1)
2ece : 0a __ __ ASL
2ecf : 2e e5 7b ROL $7be5 ; (tworks[0] + 2)
2ed2 : 0a __ __ ASL
2ed3 : 2e e6 7b ROL $7be6 ; (tworks[0] + 3)
2ed6 : 0a __ __ ASL
2ed7 : 2e e7 7b ROL $7be7 ; (tworks[0] + 4)
2eda : 0a __ __ ASL
2edb : 2e e8 7b ROL $7be8 ; (tworks[0] + 5)
2ede : 0a __ __ ASL
2edf : 2e e9 7b ROL $7be9 ; (tworks[0] + 6)
2ee2 : 0a __ __ ASL
2ee3 : 2e ea 7b ROL $7bea ; (tworks[0] + 7)
2ee6 : e8 __ __ INX
2ee7 : e0 08 __ CPX #$08
2ee9 : d0 3e __ BNE $2f29 ; (bmu_text.s13 + 0)
.s14:
2eeb : ad e3 7b LDA $7be3 ; (tworks[0] + 0)
2eee : a0 00 __ LDY #$00
2ef0 : 91 43 __ STA (T1 + 0),y 
2ef2 : ad e4 7b LDA $7be4 ; (tworks[0] + 1)
2ef5 : c8 __ __ INY
2ef6 : 91 43 __ STA (T1 + 0),y 
2ef8 : ad e5 7b LDA $7be5 ; (tworks[0] + 2)
2efb : c8 __ __ INY
2efc : 91 43 __ STA (T1 + 0),y 
2efe : ad e6 7b LDA $7be6 ; (tworks[0] + 3)
2f01 : c8 __ __ INY
2f02 : 91 43 __ STA (T1 + 0),y 
2f04 : ad e7 7b LDA $7be7 ; (tworks[0] + 4)
2f07 : c8 __ __ INY
2f08 : 91 43 __ STA (T1 + 0),y 
2f0a : ad e8 7b LDA $7be8 ; (tworks[0] + 5)
2f0d : c8 __ __ INY
2f0e : 91 43 __ STA (T1 + 0),y 
2f10 : ad e9 7b LDA $7be9 ; (tworks[0] + 6)
2f13 : c8 __ __ INY
2f14 : 91 43 __ STA (T1 + 0),y 
2f16 : ad ea 7b LDA $7bea ; (tworks[0] + 7)
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
2f33 : 0e e3 7b ASL $7be3 ; (tworks[0] + 0)
2f36 : 0e e4 7b ASL $7be4 ; (tworks[0] + 1)
2f39 : 0e e5 7b ASL $7be5 ; (tworks[0] + 2)
2f3c : 0e e6 7b ASL $7be6 ; (tworks[0] + 3)
2f3f : 0e e7 7b ASL $7be7 ; (tworks[0] + 4)
2f42 : 0e e8 7b ASL $7be8 ; (tworks[0] + 5)
2f45 : 0e e9 7b ASL $7be9 ; (tworks[0] + 6)
2f48 : 0e ea 7b ASL $7bea ; (tworks[0] + 7)
2f4b : e6 0d __ INC P0 ; (lx + 0)
2f4d : a5 0d __ LDA P0 ; (lx + 0)
2f4f : c9 08 __ CMP #$08
2f51 : d0 3d __ BNE $2f90 ; (bmu_text.s10 + 0)
.s11:
2f53 : ad e3 7b LDA $7be3 ; (tworks[0] + 0)
2f56 : a0 00 __ LDY #$00
2f58 : 84 0d __ STY P0 ; (lx + 0)
2f5a : 91 43 __ STA (T1 + 0),y 
2f5c : ad e4 7b LDA $7be4 ; (tworks[0] + 1)
2f5f : c8 __ __ INY
2f60 : 91 43 __ STA (T1 + 0),y 
2f62 : ad e5 7b LDA $7be5 ; (tworks[0] + 2)
2f65 : c8 __ __ INY
2f66 : 91 43 __ STA (T1 + 0),y 
2f68 : ad e6 7b LDA $7be6 ; (tworks[0] + 3)
2f6b : c8 __ __ INY
2f6c : 91 43 __ STA (T1 + 0),y 
2f6e : ad e7 7b LDA $7be7 ; (tworks[0] + 4)
2f71 : c8 __ __ INY
2f72 : 91 43 __ STA (T1 + 0),y 
2f74 : ad e8 7b LDA $7be8 ; (tworks[0] + 5)
2f77 : c8 __ __ INY
2f78 : 91 43 __ STA (T1 + 0),y 
2f7a : ad e9 7b LDA $7be9 ; (tworks[0] + 6)
2f7d : c8 __ __ INY
2f7e : 91 43 __ STA (T1 + 0),y 
2f80 : ad ea 7b LDA $7bea ; (tworks[0] + 7)
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
2fa0 : 0e e3 7b ASL $7be3 ; (tworks[0] + 0)
2fa3 : 0e e4 7b ASL $7be4 ; (tworks[0] + 1)
2fa6 : 0e e5 7b ASL $7be5 ; (tworks[0] + 2)
2fa9 : 0e e6 7b ASL $7be6 ; (tworks[0] + 3)
2fac : 0e e7 7b ASL $7be7 ; (tworks[0] + 4)
2faf : 0e e8 7b ASL $7be8 ; (tworks[0] + 5)
2fb2 : 0e e9 7b ASL $7be9 ; (tworks[0] + 6)
2fb5 : 0e ea 7b ASL $7bea ; (tworks[0] + 7)
2fb8 : e8 __ __ INX
2fb9 : e0 08 __ CPX #$08
2fbb : 90 e3 __ BCC $2fa0 ; (bmu_text.l15 + 0)
.s6:
2fbd : ad e3 7b LDA $7be3 ; (tworks[0] + 0)
2fc0 : a0 00 __ LDY #$00
2fc2 : 91 43 __ STA (T1 + 0),y 
2fc4 : ad e4 7b LDA $7be4 ; (tworks[0] + 1)
2fc7 : c8 __ __ INY
2fc8 : 91 43 __ STA (T1 + 0),y 
2fca : ad e5 7b LDA $7be5 ; (tworks[0] + 2)
2fcd : c8 __ __ INY
2fce : 91 43 __ STA (T1 + 0),y 
2fd0 : ad e6 7b LDA $7be6 ; (tworks[0] + 3)
2fd3 : c8 __ __ INY
2fd4 : 91 43 __ STA (T1 + 0),y 
2fd6 : ad e7 7b LDA $7be7 ; (tworks[0] + 4)
2fd9 : c8 __ __ INY
2fda : 91 43 __ STA (T1 + 0),y 
2fdc : ad e8 7b LDA $7be8 ; (tworks[0] + 5)
2fdf : c8 __ __ INY
2fe0 : 91 43 __ STA (T1 + 0),y 
2fe2 : ad e9 7b LDA $7be9 ; (tworks[0] + 6)
2fe5 : c8 __ __ INY
2fe6 : 91 43 __ STA (T1 + 0),y 
2fe8 : ad ea 7b LDA $7bea ; (tworks[0] + 7)
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
3040 : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
3043 : 18 __ __ CLC
3044 : a5 1b __ LDA ACCU + 0 
3046 : 65 5f __ ADC T7 + 0 
3048 : 29 3f __ AND #$3f
304a : 85 68 __ STA T14 + 0 
304c : 18 __ __ CLC
304d : 69 10 __ ADC #$10
304f : 29 3f __ AND #$3f
3051 : aa __ __ TAX
3052 : bd 00 78 LDA $7800,x ; (sin64[0] + 0)
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
306f : 20 f8 6e JSR $6ef8 ; (divs16@proxy + 0)
3072 : a5 1b __ LDA ACCU + 0 
3074 : 85 69 __ STA T15 + 0 
3076 : a5 1c __ LDA ACCU + 1 
3078 : 85 6a __ STA T15 + 1 
307a : a6 68 __ LDX T14 + 0 
307c : bd 00 78 LDA $7800,x ; (sin64[0] + 0)
307f : 85 59 __ STA T3 + 0 
3081 : 85 1b __ STA ACCU + 0 
3083 : 29 80 __ AND #$80
3085 : 10 02 __ BPL $3089 ; (draw_gear.l5 + 81)
3087 : a9 ff __ LDA #$ff
3089 : 85 5a __ STA T3 + 1 
308b : 85 1c __ STA ACCU + 1 
308d : a5 5d __ LDA T5 + 0 
308f : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
3092 : 20 21 74 JSR $7421 ; (divs16@proxy + 0)
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
30ac : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
30af : 20 21 74 JSR $7421 ; (divs16@proxy + 0)
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
30c9 : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
30cc : 20 21 74 JSR $7421 ; (divs16@proxy + 0)
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
30e6 : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
30e9 : 20 21 74 JSR $7421 ; (divs16@proxy + 0)
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
310e : 20 f8 6e JSR $6ef8 ; (divs16@proxy + 0)
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
3169 : a9 db __ LDA #$db
316b : 8d ea bf STA $bfea ; (sstack + 0)
316e : a9 7b __ LDA #$7b
3170 : 8d eb bf STA $bfeb ; (sstack + 1)
3173 : a9 da __ LDA #$da
3175 : 8d ec bf STA $bfec ; (sstack + 2)
3178 : a9 77 __ LDA #$77
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
31a3 : a9 db __ LDA #$db
31a5 : 8d ea bf STA $bfea ; (sstack + 0)
31a8 : a9 7b __ LDA #$7b
31aa : 8d eb bf STA $bfeb ; (sstack + 1)
31ad : a9 da __ LDA #$da
31af : 8d ec bf STA $bfec ; (sstack + 2)
31b2 : a9 77 __ LDA #$77
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
31fe : a9 db __ LDA #$db
3200 : 8d ea bf STA $bfea ; (sstack + 0)
3203 : a9 7b __ LDA #$7b
3205 : 8d eb bf STA $bfeb ; (sstack + 1)
3208 : a9 da __ LDA #$da
320a : 8d ec bf STA $bfec ; (sstack + 2)
320d : a9 77 __ LDA #$77
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
327f : a9 db __ LDA #$db
3281 : 8d ea bf STA $bfea ; (sstack + 0)
3284 : a9 7b __ LDA #$7b
3286 : 8d eb bf STA $bfeb ; (sstack + 1)
3289 : a9 da __ LDA #$da
328b : 8d ec bf STA $bfec ; (sstack + 2)
328e : a9 77 __ LDA #$77
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
32aa : a9 db __ LDA #$db
32ac : 8d ea bf STA $bfea ; (sstack + 0)
32af : a9 7b __ LDA #$7b
32b1 : 8d eb bf STA $bfeb ; (sstack + 1)
32b4 : a9 da __ LDA #$da
32b6 : 8d ec bf STA $bfec ; (sstack + 2)
32b9 : a9 77 __ LDA #$77
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
32e6 : bd 00 78 LDA $7800,x ; (sin64[0] + 0)
32e9 : 85 1b __ STA ACCU + 0 
32eb : 29 80 __ AND #$80
32ed : 10 02 __ BPL $32f1 ; (draw_gear.s8 + 339)
32ef : a9 ff __ LDA #$ff
32f1 : 85 1c __ STA ACCU + 1 
32f3 : a5 5e __ LDA T6 + 0 
32f5 : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
32f8 : 20 21 74 JSR $7421 ; (divs16@proxy + 0)
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
3310 : bd 00 78 LDA $7800,x ; (sin64[0] + 0)
3313 : 85 1b __ STA ACCU + 0 
3315 : 29 80 __ AND #$80
3317 : 10 02 __ BPL $331b ; (draw_gear.s8 + 381)
3319 : a9 ff __ LDA #$ff
331b : 85 1c __ STA ACCU + 1 
331d : a5 5e __ LDA T6 + 0 
331f : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
3322 : 20 21 74 JSR $7421 ; (divs16@proxy + 0)
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
3383 : a9 db __ LDA #$db
3385 : 8d ea bf STA $bfea ; (sstack + 0)
3388 : a9 7b __ LDA #$7b
338a : 8d eb bf STA $bfeb ; (sstack + 1)
338d : a9 da __ LDA #$da
338f : 8d ec bf STA $bfec ; (sstack + 2)
3392 : a9 77 __ LDA #$77
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
33ac : 20 3b 70 JSR $703b ; (divmod + 0)
33af : a5 1b __ LDA ACCU + 0 
33b1 : 85 59 __ STA T3 + 0 
.l10:
33b3 : a9 db __ LDA #$db
33b5 : 8d ea bf STA $bfea ; (sstack + 0)
33b8 : a9 7b __ LDA #$7b
33ba : 8d eb bf STA $bfeb ; (sstack + 1)
33bd : a9 da __ LDA #$da
33bf : 8d ec bf STA $bfec ; (sstack + 2)
33c2 : a9 77 __ LDA #$77
33c4 : 8d ed bf STA $bfed ; (sstack + 3)
33c7 : a9 03 __ LDA #$03
33c9 : 8d f6 bf STA $bff6 ; (sstack + 12)
33cc : a5 5d __ LDA T5 + 0 
33ce : 85 1b __ STA ACCU + 0 
33d0 : a9 00 __ LDA #$00
33d2 : 85 1c __ STA ACCU + 1 
33d4 : a5 59 __ LDA T3 + 0 
33d6 : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
33d9 : 18 __ __ CLC
33da : a5 1b __ LDA ACCU + 0 
33dc : 65 5f __ ADC T7 + 0 
33de : 29 3f __ AND #$3f
33e0 : 85 53 __ STA T0 + 0 
33e2 : 18 __ __ CLC
33e3 : 69 10 __ ADC #$10
33e5 : 29 3f __ AND #$3f
33e7 : aa __ __ TAX
33e8 : bd 00 78 LDA $7800,x ; (sin64[0] + 0)
33eb : 85 55 __ STA T1 + 0 
33ed : 85 1b __ STA ACCU + 0 
33ef : 29 80 __ AND #$80
33f1 : 10 02 __ BPL $33f5 ; (draw_gear.l10 + 66)
33f3 : a9 ff __ LDA #$ff
33f5 : 85 56 __ STA T1 + 1 
33f7 : 85 1c __ STA ACCU + 1 
33f9 : a5 72 __ LDA T21 + 0 
33fb : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
33fe : 20 21 74 JSR $7421 ; (divs16@proxy + 0)
3401 : 18 __ __ CLC
3402 : a5 1b __ LDA ACCU + 0 
3404 : 65 67 __ ADC T13 + 0 
3406 : 8d ee bf STA $bfee ; (sstack + 4)
3409 : a5 1c __ LDA ACCU + 1 
340b : 69 00 __ ADC #$00
340d : 8d ef bf STA $bfef ; (sstack + 5)
3410 : a6 53 __ LDX T0 + 0 
3412 : bd 00 78 LDA $7800,x ; (sin64[0] + 0)
3415 : 85 53 __ STA T0 + 0 
3417 : 85 1b __ STA ACCU + 0 
3419 : 29 80 __ AND #$80
341b : 10 02 __ BPL $341f ; (draw_gear.l10 + 108)
341d : a9 ff __ LDA #$ff
341f : 85 54 __ STA T0 + 1 
3421 : 85 1c __ STA ACCU + 1 
3423 : a5 72 __ LDA T21 + 0 
3425 : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
3428 : 20 21 74 JSR $7421 ; (divs16@proxy + 0)
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
3444 : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
3447 : 20 21 74 JSR $7421 ; (divs16@proxy + 0)
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
3463 : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
3466 : 20 21 74 JSR $7421 ; (divs16@proxy + 0)
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
3a6b : 8d 00 88 STA $8800 ; (BLIT_CODE[0] + 0)
3a6e : a9 a2 __ LDA #$a2
3a70 : 8d 02 88 STA $8802 ; (BLIT_CODE[0] + 2)
3a73 : a9 a5 __ LDA #$a5
3a75 : 8d 04 88 STA $8804 ; (BLIT_CODE[0] + 4)
3a78 : a9 0a __ LDA #$0a
3a7a : 8d 05 88 STA $8805 ; (BLIT_CODE[0] + 5)
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
3aa4 : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
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
3ad9 : 8d 01 88 STA $8801 ; (BLIT_CODE[0] + 1)
3adc : a6 48 __ LDX T4 + 0 
3ade : e8 __ __ INX
3adf : 8e 03 88 STX $8803 ; (BLIT_CODE[0] + 3)
3ae2 : a5 0f __ LDA P2 ; (x0 + 0)
3ae4 : 29 07 __ AND #$07
3ae6 : aa __ __ TAX
3ae7 : a5 18 __ LDA P11 ; (op + 0)
3ae9 : c9 02 __ CMP #$02
3aeb : d0 20 __ BNE $3b0d ; (bmu_line.s16 + 0)
.s45:
3aed : a9 49 __ LDA #$49
3aef : 8d 06 88 STA $8806 ; (BLIT_CODE[0] + 6)
3af2 : a9 ff __ LDA #$ff
3af4 : 8d 07 88 STA $8807 ; (BLIT_CODE[0] + 7)
3af7 : a9 31 __ LDA #$31
3af9 : 8d 08 88 STA $8808 ; (BLIT_CODE[0] + 8)
3afc : a9 03 __ LDA #$03
3afe : 8d 09 88 STA $8809 ; (BLIT_CODE[0] + 9)
3b01 : 8d 0b 88 STA $880b ; (BLIT_CODE[0] + 11)
3b04 : a9 91 __ LDA #$91
3b06 : 8d 0a 88 STA $880a ; (BLIT_CODE[0] + 10)
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
3b1c : 8d 06 88 STA $8806 ; (BLIT_CODE[0] + 6)
3b1f : a9 03 __ LDA #$03
3b21 : 8d 07 88 STA $8807 ; (BLIT_CODE[0] + 7)
3b24 : 8d 09 88 STA $8809 ; (BLIT_CODE[0] + 9)
3b27 : a9 91 __ LDA #$91
3b29 : 8d 08 88 STA $8808 ; (BLIT_CODE[0] + 8)
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
3b43 : 99 01 88 STA $8801,y ; (BLIT_CODE[0] + 1)
3b46 : 99 05 88 STA $8805,y ; (BLIT_CODE[0] + 5)
3b49 : a9 90 __ LDA #$90
3b4b : 99 02 88 STA $8802,y ; (BLIT_CODE[0] + 2)
3b4e : a9 0c __ LDA #$0c
3b50 : 99 03 88 STA $8803,y ; (BLIT_CODE[0] + 3)
3b53 : a9 a5 __ LDA #$a5
3b55 : 99 06 88 STA $8806,y ; (BLIT_CODE[0] + 6)
3b58 : a9 03 __ LDA #$03
3b5a : 99 07 88 STA $8807,y ; (BLIT_CODE[0] + 7)
3b5d : a9 69 __ LDA #$69
3b5f : 99 08 88 STA $8808,y ; (BLIT_CODE[0] + 8)
3b62 : a5 51 __ LDA T11 + 0 
3b64 : f0 09 __ BEQ $3b6f ; (bmu_line.s23 + 0)
.s27:
3b66 : a9 06 __ LDA #$06
3b68 : 99 00 88 STA $8800,y ; (BLIT_CODE[0] + 0)
3b6b : a9 26 __ LDA #$26
3b6d : d0 07 __ BNE $3b76 ; (bmu_line.s53 + 0)
.s23:
3b6f : a9 46 __ LDA #$46
3b71 : 99 00 88 STA $8800,y ; (BLIT_CODE[0] + 0)
3b74 : a9 66 __ LDA #$66
.s53:
3b76 : 99 04 88 STA $8804,y ; (BLIT_CODE[0] + 4)
3b79 : a9 02 __ LDA #$02
3b7b : 99 0b 88 STA $880b,y ; (BLIT_CODE[0] + 11)
3b7e : a5 51 __ LDA T11 + 0 
3b80 : f0 0e __ BEQ $3b90 ; (bmu_line.s24 + 0)
.s26:
3b82 : a9 f8 __ LDA #$f8
3b84 : 99 09 88 STA $8809,y ; (BLIT_CODE[0] + 9)
3b87 : a9 b0 __ LDA #$b0
3b89 : 99 0a 88 STA $880a,y ; (BLIT_CODE[0] + 10)
3b8c : a9 c6 __ LDA #$c6
3b8e : d0 0c __ BNE $3b9c ; (bmu_line.s25 + 0)
.s24:
3b90 : a9 08 __ LDA #$08
3b92 : 99 09 88 STA $8809,y ; (BLIT_CODE[0] + 9)
3b95 : a9 90 __ LDA #$90
3b97 : 99 0a 88 STA $880a,y ; (BLIT_CODE[0] + 10)
3b9a : a9 e6 __ LDA #$e6
.s25:
3b9c : 99 0c 88 STA $880c,y ; (BLIT_CODE[0] + 12)
3b9f : a9 04 __ LDA #$04
3ba1 : 99 0d 88 STA $880d,y ; (BLIT_CODE[0] + 13)
3ba4 : a9 85 __ LDA #$85
3ba6 : 99 0e 88 STA $880e,y ; (BLIT_CODE[0] + 14)
3ba9 : a9 03 __ LDA #$03
3bab : 99 0f 88 STA $880f,y ; (BLIT_CODE[0] + 15)
3bae : 98 __ __ TYA
3baf : 18 __ __ CLC
3bb0 : 69 10 __ ADC #$10
3bb2 : 85 45 __ STA T1 + 0 
.s21:
3bb4 : a9 ca __ LDA #$ca
3bb6 : a4 45 __ LDY T1 + 0 
3bb8 : 84 43 __ STY T0 + 0 
3bba : 99 00 88 STA $8800,y ; (BLIT_CODE[0] + 0)
3bbd : a9 d0 __ LDA #$d0
3bbf : 99 01 88 STA $8801,y ; (BLIT_CODE[0] + 1)
3bc2 : a9 c6 __ LDA #$c6
3bc4 : 99 03 88 STA $8803,y ; (BLIT_CODE[0] + 3)
3bc7 : a9 0b __ LDA #$0b
3bc9 : 99 04 88 STA $8804,y ; (BLIT_CODE[0] + 4)
3bcc : a9 10 __ LDA #$10
3bce : 99 05 88 STA $8805,y ; (BLIT_CODE[0] + 5)
3bd1 : a9 60 __ LDA #$60
3bd3 : 99 07 88 STA $8807,y ; (BLIT_CODE[0] + 7)
3bd6 : e6 43 __ INC T0 + 0 
3bd8 : 38 __ __ SEC
3bd9 : a9 02 __ LDA #$02
3bdb : e5 43 __ SBC T0 + 0 
3bdd : 99 02 88 STA $8802,y ; (BLIT_CODE[0] + 2)
3be0 : 38 __ __ SEC
3be1 : a9 fe __ LDA #$fe
3be3 : e5 43 __ SBC T0 + 0 
3be5 : 99 06 88 STA $8806,y ; (BLIT_CODE[0] + 6)
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
3bfc : bd 20 7c LDA $7c20,x ; (bitshift[0] + 32)
3bff : 85 0a __ STA WORK + 7 
3c01 : a9 ff __ LDA #$ff
3c03 : 85 07 __ STA WORK + 4 
3c05 : 4c 00 88 JMP $8800 ; (BLIT_CODE[0] + 0)
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
3c2b : 99 00 88 STA $8800,y ; (BLIT_CODE[0] + 0)
3c2e : a9 c0 __ LDA #$c0
3c30 : 99 01 88 STA $8801,y ; (BLIT_CODE[0] + 1)
3c33 : a9 08 __ LDA #$08
3c35 : 99 02 88 STA $8802,y ; (BLIT_CODE[0] + 2)
3c38 : a9 d0 __ LDA #$d0
3c3a : 99 03 88 STA $8803,y ; (BLIT_CODE[0] + 3)
3c3d : a9 a0 __ LDA #$a0
3c3f : 99 05 88 STA $8805,y ; (BLIT_CODE[0] + 5)
3c42 : a9 00 __ LDA #$00
3c44 : 99 06 88 STA $8806,y ; (BLIT_CODE[0] + 6)
3c47 : a9 a5 __ LDA #$a5
3c49 : 99 07 88 STA $8807,y ; (BLIT_CODE[0] + 7)
3c4c : 99 0d 88 STA $880d,y ; (BLIT_CODE[0] + 13)
3c4f : a9 03 __ LDA #$03
3c51 : 99 08 88 STA $8808,y ; (BLIT_CODE[0] + 8)
3c54 : 99 0c 88 STA $880c,y ; (BLIT_CODE[0] + 12)
3c57 : a9 69 __ LDA #$69
3c59 : 99 09 88 STA $8809,y ; (BLIT_CODE[0] + 9)
3c5c : 99 0f 88 STA $880f,y ; (BLIT_CODE[0] + 15)
3c5f : a9 85 __ LDA #$85
3c61 : 99 0b 88 STA $880b,y ; (BLIT_CODE[0] + 11)
3c64 : 99 11 88 STA $8811,y ; (BLIT_CODE[0] + 17)
3c67 : a9 04 __ LDA #$04
3c69 : 99 0e 88 STA $880e,y ; (BLIT_CODE[0] + 14)
3c6c : 99 12 88 STA $8812,y ; (BLIT_CODE[0] + 18)
3c6f : a5 1b __ LDA ACCU + 0 
3c71 : f0 04 __ BEQ $3c77 ; (bmu_line.s60 + 0)
.s61:
3c73 : a9 10 __ LDA #$10
3c75 : 90 02 __ BCC $3c79 ; (bmu_line.s62 + 0)
.s60:
3c77 : a9 0e __ LDA #$0e
.s62:
3c79 : 99 04 88 STA $8804,y ; (BLIT_CODE[0] + 4)
3c7c : 38 __ __ SEC
3c7d : a5 4f __ LDA T8 + 0 
3c7f : e9 01 __ SBC #$01
3c81 : 99 0a 88 STA $880a,y ; (BLIT_CODE[0] + 10)
3c84 : a5 50 __ LDA T8 + 1 
3c86 : e9 00 __ SBC #$00
3c88 : 99 10 88 STA $8810,y ; (BLIT_CODE[0] + 16)
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
3c9b : 99 00 88 STA $8800,y ; (BLIT_CODE[0] + 0)
3c9e : a9 05 __ LDA #$05
3ca0 : 99 01 88 STA $8801,y ; (BLIT_CODE[0] + 1)
3ca3 : 99 06 88 STA $8806,y ; (BLIT_CODE[0] + 6)
3ca6 : a9 38 __ LDA #$38
3ca8 : 99 02 88 STA $8802,y ; (BLIT_CODE[0] + 2)
3cab : a9 e9 __ LDA #$e9
3cad : 99 03 88 STA $8803,y ; (BLIT_CODE[0] + 3)
3cb0 : a9 85 __ LDA #$85
3cb2 : 99 05 88 STA $8805,y ; (BLIT_CODE[0] + 5)
3cb5 : a5 46 __ LDA T2 + 0 
3cb7 : 99 04 88 STA $8804,y ; (BLIT_CODE[0] + 4)
3cba : a5 1c __ LDA ACCU + 1 
3cbc : d0 2a __ BNE $3ce8 ; (bmu_line.s33 + 0)
.s32:
3cbe : a9 10 __ LDA #$10
3cc0 : 99 07 88 STA $8807,y ; (BLIT_CODE[0] + 7)
3cc3 : a9 15 __ LDA #$15
3cc5 : 99 08 88 STA $8808,y ; (BLIT_CODE[0] + 8)
3cc8 : a9 18 __ LDA #$18
3cca : 99 09 88 STA $8809,y ; (BLIT_CODE[0] + 9)
3ccd : a9 69 __ LDA #$69
3ccf : 99 0a 88 STA $880a,y ; (BLIT_CODE[0] + 10)
3cd2 : a5 43 __ LDA T0 + 0 
3cd4 : 99 0b 88 STA $880b,y ; (BLIT_CODE[0] + 11)
3cd7 : a9 85 __ LDA #$85
3cd9 : 99 0c 88 STA $880c,y ; (BLIT_CODE[0] + 12)
3cdc : a9 05 __ LDA #$05
3cde : 99 0d 88 STA $880d,y ; (BLIT_CODE[0] + 13)
3ce1 : 98 __ __ TYA
3ce2 : 18 __ __ CLC
3ce3 : 69 0e __ ADC #$0e
3ce5 : 4c 43 3d JMP $3d43 ; (bmu_line.s54 + 0)
.s33:
3ce8 : a9 a5 __ LDA #$a5
3cea : 99 07 88 STA $8807,y ; (BLIT_CODE[0] + 7)
3ced : 99 10 88 STA $8810,y ; (BLIT_CODE[0] + 16)
3cf0 : 99 16 88 STA $8816,y ; (BLIT_CODE[0] + 22)
3cf3 : a9 06 __ LDA #$06
3cf5 : 99 08 88 STA $8808,y ; (BLIT_CODE[0] + 8)
3cf8 : 99 0c 88 STA $880c,y ; (BLIT_CODE[0] + 12)
3cfb : 99 17 88 STA $8817,y ; (BLIT_CODE[0] + 23)
3cfe : 99 1b 88 STA $881b,y ; (BLIT_CODE[0] + 27)
3d01 : a9 e9 __ LDA #$e9
3d03 : 99 09 88 STA $8809,y ; (BLIT_CODE[0] + 9)
3d06 : a9 85 __ LDA #$85
3d08 : 99 0b 88 STA $880b,y ; (BLIT_CODE[0] + 11)
3d0b : 99 14 88 STA $8814,y ; (BLIT_CODE[0] + 20)
3d0e : 99 1a 88 STA $881a,y ; (BLIT_CODE[0] + 26)
3d11 : a9 10 __ LDA #$10
3d13 : 99 0d 88 STA $880d,y ; (BLIT_CODE[0] + 13)
3d16 : a9 1d __ LDA #$1d
3d18 : 99 0e 88 STA $880e,y ; (BLIT_CODE[0] + 14)
3d1b : a9 18 __ LDA #$18
3d1d : 99 0f 88 STA $880f,y ; (BLIT_CODE[0] + 15)
3d20 : a9 05 __ LDA #$05
3d22 : 99 11 88 STA $8811,y ; (BLIT_CODE[0] + 17)
3d25 : 99 15 88 STA $8815,y ; (BLIT_CODE[0] + 21)
3d28 : a9 69 __ LDA #$69
3d2a : 99 12 88 STA $8812,y ; (BLIT_CODE[0] + 18)
3d2d : 99 18 88 STA $8818,y ; (BLIT_CODE[0] + 24)
3d30 : a5 43 __ LDA T0 + 0 
3d32 : 99 13 88 STA $8813,y ; (BLIT_CODE[0] + 19)
3d35 : a5 47 __ LDA T2 + 1 
3d37 : 99 0a 88 STA $880a,y ; (BLIT_CODE[0] + 10)
3d3a : a5 44 __ LDA T0 + 1 
3d3c : 99 19 88 STA $8819,y ; (BLIT_CODE[0] + 25)
3d3f : 98 __ __ TYA
3d40 : 18 __ __ CLC
3d41 : 69 1c __ ADC #$1c
.s54:
3d43 : 85 45 __ STA T1 + 0 
3d45 : 4c 3f 3b JMP $3b3f ; (bmu_line.s22 + 0)
.s34:
3d48 : a9 88 __ LDA #$88
3d4a : a4 45 __ LDY T1 + 0 
3d4c : 99 00 88 STA $8800,y ; (BLIT_CODE[0] + 0)
3d4f : a9 10 __ LDA #$10
3d51 : 99 01 88 STA $8801,y ; (BLIT_CODE[0] + 1)
3d54 : a9 18 __ LDA #$18
3d56 : 99 03 88 STA $8803,y ; (BLIT_CODE[0] + 3)
3d59 : a9 a0 __ LDA #$a0
3d5b : 99 04 88 STA $8804,y ; (BLIT_CODE[0] + 4)
3d5e : a9 07 __ LDA #$07
3d60 : 99 05 88 STA $8805,y ; (BLIT_CODE[0] + 5)
3d63 : a9 a5 __ LDA #$a5
3d65 : 99 06 88 STA $8806,y ; (BLIT_CODE[0] + 6)
3d68 : 99 0c 88 STA $880c,y ; (BLIT_CODE[0] + 12)
3d6b : a9 03 __ LDA #$03
3d6d : 99 07 88 STA $8807,y ; (BLIT_CODE[0] + 7)
3d70 : 99 0b 88 STA $880b,y ; (BLIT_CODE[0] + 11)
3d73 : a9 69 __ LDA #$69
3d75 : 99 08 88 STA $8808,y ; (BLIT_CODE[0] + 8)
3d78 : 99 0e 88 STA $880e,y ; (BLIT_CODE[0] + 14)
3d7b : a9 85 __ LDA #$85
3d7d : 99 0a 88 STA $880a,y ; (BLIT_CODE[0] + 10)
3d80 : 99 10 88 STA $8810,y ; (BLIT_CODE[0] + 16)
3d83 : a9 04 __ LDA #$04
3d85 : 99 0d 88 STA $880d,y ; (BLIT_CODE[0] + 13)
3d88 : 99 11 88 STA $8811,y ; (BLIT_CODE[0] + 17)
3d8b : a5 1b __ LDA ACCU + 0 
3d8d : f0 04 __ BEQ $3d93 ; (bmu_line.s57 + 0)
.s58:
3d8f : a9 11 __ LDA #$11
3d91 : 90 02 __ BCC $3d95 ; (bmu_line.s59 + 0)
.s57:
3d93 : a9 0f __ LDA #$0f
.s59:
3d95 : 99 02 88 STA $8802,y ; (BLIT_CODE[0] + 2)
3d98 : a5 4f __ LDA T8 + 0 
3d9a : 99 09 88 STA $8809,y ; (BLIT_CODE[0] + 9)
3d9d : a5 50 __ LDA T8 + 1 
3d9f : 99 0f 88 STA $880f,y ; (BLIT_CODE[0] + 15)
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
3db7 : 99 00 88 STA $8800,y ; (BLIT_CODE[0] + 0)
3dba : a9 30 __ LDA #$30
3dbc : 99 02 88 STA $8802,y ; (BLIT_CODE[0] + 2)
3dbf : a5 1c __ LDA ACCU + 1 
3dc1 : 69 05 __ ADC #$05
3dc3 : 99 01 88 STA $8801,y ; (BLIT_CODE[0] + 1)
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
3dd6 : 99 03 88 STA $8803,y ; (BLIT_CODE[0] + 3)
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
3e04 : 8d 06 88 STA $8806 ; (BLIT_CODE[0] + 6)
3e07 : 8d 09 88 STA $8809 ; (BLIT_CODE[0] + 9)
3e0a : a9 07 __ LDA #$07
3e0c : 8d 07 88 STA $8807 ; (BLIT_CODE[0] + 7)
3e0f : 8d 0b 88 STA $880b ; (BLIT_CODE[0] + 11)
3e12 : a9 90 __ LDA #$90
3e14 : 8d 08 88 STA $8808 ; (BLIT_CODE[0] + 8)
3e17 : a9 e6 __ LDA #$e6
3e19 : 8d 0a 88 STA $880a ; (BLIT_CODE[0] + 10)
3e1c : a9 11 __ LDA #$11
3e1e : 8d 0c 88 STA $880c ; (BLIT_CODE[0] + 12)
3e21 : a9 03 __ LDA #$03
3e23 : 8d 0d 88 STA $880d ; (BLIT_CODE[0] + 13)
3e26 : 8d 13 88 STA $8813 ; (BLIT_CODE[0] + 19)
3e29 : 8d 15 88 STA $8815 ; (BLIT_CODE[0] + 21)
3e2c : a9 d0 __ LDA #$d0
3e2e : 8d 0e 88 STA $880e ; (BLIT_CODE[0] + 14)
3e31 : a9 04 __ LDA #$04
3e33 : 8d 0f 88 STA $880f ; (BLIT_CODE[0] + 15)
3e36 : a9 49 __ LDA #$49
3e38 : 8d 10 88 STA $8810 ; (BLIT_CODE[0] + 16)
3e3b : a9 ff __ LDA #$ff
3e3d : 8d 11 88 STA $8811 ; (BLIT_CODE[0] + 17)
3e40 : a9 31 __ LDA #$31
3e42 : 8d 12 88 STA $8812 ; (BLIT_CODE[0] + 18)
3e45 : a9 91 __ LDA #$91
3e47 : 8d 14 88 STA $8814 ; (BLIT_CODE[0] + 20)
3e4a : a9 16 __ LDA #$16
3e4c : 4c 2e 3b JMP $3b2e ; (bmu_line.s19 + 0)
--------------------------------------------------------------------
engine_update: ; engine_update(u8)->void
; 364, "/home/xahmol/git/UltimateDemo2026/src/gears.c"
.s4:
3e4f : 0a __ __ ASL
3e50 : aa __ __ TAX
3e51 : bd d8 74 LDA $74d8,x ; (sid_freq[0] + 0)
3e54 : 8d 00 d4 STA $d400 
3e57 : bd d9 74 LDA $74d9,x ; (sid_freq[0] + 1)
3e5a : 85 1c __ STA ACCU + 1 
3e5c : 8d 01 d4 STA $d401 
3e5f : bd d8 74 LDA $74d8,x ; (sid_freq[0] + 0)
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
3e6e : ad 7c 83 LDA $837c ; (modplay.song_length + 0)
3e71 : d0 01 __ BNE $3e74 ; (modplay_start.s5 + 0)
.s3:
3e73 : 60 __ __ RTS
.s5:
3e74 : a9 00 __ LDA #$00
3e76 : 8d da 7b STA $7bda ; (mod_paused + 0)
3e79 : 8d ff 83 STA $83ff ; (modplay.order_pos + 0)
3e7c : 85 43 __ STA T0 + 0 
3e7e : 8d 01 84 STA $8401 ; (modplay.row + 0)
3e81 : 8d 02 84 STA $8402 ; (modplay.tick + 0)
3e84 : 8d 05 84 STA $8405 ; (modplay.pattern_delay + 0)
3e87 : 8d 0a 84 STA $840a ; (modplay.skip_row_advance + 0)
3e8a : ad 7f 83 LDA $837f ; (modplay.order_table[0] + 0)
3e8d : 8d 00 84 STA $8400 ; (modplay.pattern_num + 0)
3e90 : a9 06 __ LDA #$06
3e92 : 8d 03 84 STA $8403 ; (modplay.ticks_per_row + 0)
3e95 : a9 7d __ LDA #$7d
3e97 : 8d 04 84 STA $8404 ; (modplay.bpm + 0)
3e9a : a9 01 __ LDA #$01
3e9c : 8d 08 84 STA $8408 ; (modplay.active + 0)
3e9f : ad 07 84 LDA $8407 ; (modplay.stereo + 0)
3ea2 : d0 17 __ BNE $3ebb ; (modplay_start.l10 + 0)
.s7:
3ea4 : a9 80 __ LDA #$80
3ea6 : a6 43 __ LDX T0 + 0 
3ea8 : bc 76 73 LDY $7376,x ; (__multab50L + 0)
.l8:
3eab : 99 60 86 STA $8660,y ; (modplay.channel[0].pan + 0)
3eae : e6 43 __ INC T0 + 0 
3eb0 : a5 43 __ LDA T0 + 0 
3eb2 : c9 04 __ CMP #$04
3eb4 : b0 1d __ BCS $3ed3 ; (modplay_start.s9 + 0)
.s6:
3eb6 : ad 07 84 LDA $8407 ; (modplay.stereo + 0)
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
3ecb : b9 76 73 LDA $7376,y ; (__multab50L + 0)
3ece : a8 __ __ TAY
3ecf : 8a __ __ TXA
3ed0 : 4c ab 3e JMP $3eab ; (modplay_start.l8 + 0)
.s9:
3ed3 : ad 04 84 LDA $8404 ; (modplay.bpm + 0)
3ed6 : 20 13 3f JSR $3f13 ; (bpm_to_timer.s4 + 0)
3ed9 : a5 1b __ LDA ACCU + 0 
3edb : 85 43 __ STA T0 + 0 
3edd : a5 1c __ LDA ACCU + 1 
3edf : 85 44 __ STA T0 + 1 
3ee1 : 78 __ __ SEI
3ee2 : ad 14 03 LDA $0314 
3ee5 : 8d eb 7b STA $7beb ; (mod_saved_irq[0] + 0)
3ee8 : ad 15 03 LDA $0315 
3eeb : 8d ec 7b STA $7bec ; (mod_saved_irq[0] + 1)
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
4013 : d0 03 __ BNE $4018 ; (modplay_irq + 10)
4015 : 4c 31 ea JMP $ea31 
4018 : a5 07 __ LDA WORK + 4 
401a : 48 __ __ PHA
401b : a5 08 __ LDA WORK + 5 
401d : 48 __ __ PHA
401e : a5 09 __ LDA WORK + 6 
4020 : 48 __ __ PHA
4021 : a5 0a __ LDA WORK + 7 
4023 : 48 __ __ PHA
4024 : a5 0b __ LDA WORK + 8 
4026 : 48 __ __ PHA
4027 : a5 0c __ LDA $0c 
4029 : 48 __ __ PHA
402a : a5 14 __ LDA P7 
402c : 48 __ __ PHA
402d : a5 15 __ LDA P8 
402f : 48 __ __ PHA
4030 : a5 16 __ LDA P9 
4032 : 48 __ __ PHA
4033 : a5 17 __ LDA P10 
4035 : 48 __ __ PHA
4036 : a5 18 __ LDA P11 
4038 : 48 __ __ PHA
4039 : a5 19 __ LDA IP + 0 
403b : 48 __ __ PHA
403c : a5 1a __ LDA IP + 1 
403e : 48 __ __ PHA
403f : a5 1f __ LDA ADDR + 0 
4041 : 48 __ __ PHA
4042 : a5 20 __ LDA ADDR + 1 
4044 : 48 __ __ PHA
4045 : a5 21 __ LDA ADDR + 2 
4047 : 48 __ __ PHA
4048 : a5 22 __ LDA ADDR + 3 
404a : 48 __ __ PHA
404b : a5 23 __ LDA SP + 0 
404d : 48 __ __ PHA
404e : a5 24 __ LDA SP + 1 
4050 : 48 __ __ PHA
4051 : a5 25 __ LDA FP + 0 
4053 : 48 __ __ PHA
4054 : a5 26 __ LDA FP + 1 
4056 : 48 __ __ PHA
4057 : a5 27 __ LDA $27 
4059 : 48 __ __ PHA
405a : a5 28 __ LDA $28 
405c : 48 __ __ PHA
405d : a5 29 __ LDA $29 
405f : 48 __ __ PHA
4060 : a5 2a __ LDA $2a 
4062 : 48 __ __ PHA
4063 : a5 2b __ LDA $2b 
4065 : 48 __ __ PHA
4066 : a5 2c __ LDA $2c 
4068 : 48 __ __ PHA
4069 : a5 2d __ LDA $2d 
406b : 48 __ __ PHA
406c : a5 2e __ LDA $2e 
406e : 48 __ __ PHA
406f : a5 2f __ LDA $2f 
4071 : 48 __ __ PHA
4072 : a5 30 __ LDA $30 
4074 : 48 __ __ PHA
4075 : a5 31 __ LDA $31 
4077 : 48 __ __ PHA
4078 : a5 32 __ LDA $32 
407a : 48 __ __ PHA
407b : a5 33 __ LDA $33 
407d : 48 __ __ PHA
407e : a5 34 __ LDA $34 
4080 : 48 __ __ PHA
4081 : a5 35 __ LDA $35 
4083 : 48 __ __ PHA
4084 : a5 36 __ LDA $36 
4086 : 48 __ __ PHA
4087 : a5 37 __ LDA $37 
4089 : 48 __ __ PHA
408a : a5 38 __ LDA $38 
408c : 48 __ __ PHA
408d : a5 39 __ LDA $39 
408f : 48 __ __ PHA
4090 : a5 3a __ LDA $3a 
4092 : 48 __ __ PHA
4093 : a5 3b __ LDA $3b 
4095 : 48 __ __ PHA
4096 : a5 3c __ LDA $3c 
4098 : 48 __ __ PHA
4099 : a5 3d __ LDA $3d 
409b : 48 __ __ PHA
409c : a5 3e __ LDA $3e 
409e : 48 __ __ PHA
409f : a5 3f __ LDA $3f 
40a1 : 48 __ __ PHA
40a2 : a5 40 __ LDA $40 
40a4 : 48 __ __ PHA
40a5 : a5 41 __ LDA $41 
40a7 : 48 __ __ PHA
40a8 : a5 42 __ LDA $42 
40aa : 48 __ __ PHA
40ab : 20 44 41 JSR $4144 ; (modplay_tick.s1 + 0)
40ae : 68 __ __ PLA
40af : 85 42 __ STA $42 
40b1 : 68 __ __ PLA
40b2 : 85 41 __ STA $41 
40b4 : 68 __ __ PLA
40b5 : 85 40 __ STA $40 
40b7 : 68 __ __ PLA
40b8 : 85 3f __ STA $3f 
40ba : 68 __ __ PLA
40bb : 85 3e __ STA $3e 
40bd : 68 __ __ PLA
40be : 85 3d __ STA $3d 
40c0 : 68 __ __ PLA
40c1 : 85 3c __ STA $3c 
40c3 : 68 __ __ PLA
40c4 : 85 3b __ STA $3b 
40c6 : 68 __ __ PLA
40c7 : 85 3a __ STA $3a 
40c9 : 68 __ __ PLA
40ca : 85 39 __ STA $39 
40cc : 68 __ __ PLA
40cd : 85 38 __ STA $38 
40cf : 68 __ __ PLA
40d0 : 85 37 __ STA $37 
40d2 : 68 __ __ PLA
40d3 : 85 36 __ STA $36 
40d5 : 68 __ __ PLA
40d6 : 85 35 __ STA $35 
40d8 : 68 __ __ PLA
40d9 : 85 34 __ STA $34 
40db : 68 __ __ PLA
40dc : 85 33 __ STA $33 
40de : 68 __ __ PLA
40df : 85 32 __ STA $32 
40e1 : 68 __ __ PLA
40e2 : 85 31 __ STA $31 
40e4 : 68 __ __ PLA
40e5 : 85 30 __ STA $30 
40e7 : 68 __ __ PLA
40e8 : 85 2f __ STA $2f 
40ea : 68 __ __ PLA
40eb : 85 2e __ STA $2e 
40ed : 68 __ __ PLA
40ee : 85 2d __ STA $2d 
40f0 : 68 __ __ PLA
40f1 : 85 2c __ STA $2c 
40f3 : 68 __ __ PLA
40f4 : 85 2b __ STA $2b 
40f6 : 68 __ __ PLA
40f7 : 85 2a __ STA $2a 
40f9 : 68 __ __ PLA
40fa : 85 29 __ STA $29 
40fc : 68 __ __ PLA
40fd : 85 28 __ STA $28 
40ff : 68 __ __ PLA
4100 : 85 27 __ STA $27 
4102 : 68 __ __ PLA
4103 : 85 26 __ STA FP + 1 
4105 : 68 __ __ PLA
4106 : 85 25 __ STA FP + 0 
4108 : 68 __ __ PLA
4109 : 85 24 __ STA SP + 1 
410b : 68 __ __ PLA
410c : 85 23 __ STA SP + 0 
410e : 68 __ __ PLA
410f : 85 22 __ STA ADDR + 3 
4111 : 68 __ __ PLA
4112 : 85 21 __ STA ADDR + 2 
4114 : 68 __ __ PLA
4115 : 85 20 __ STA ADDR + 1 
4117 : 68 __ __ PLA
4118 : 85 1f __ STA ADDR + 0 
411a : 68 __ __ PLA
411b : 85 1a __ STA IP + 1 
411d : 68 __ __ PLA
411e : 85 19 __ STA IP + 0 
4120 : 68 __ __ PLA
4121 : 85 18 __ STA P11 
4123 : 68 __ __ PLA
4124 : 85 17 __ STA P10 
4126 : 68 __ __ PLA
4127 : 85 16 __ STA P9 
4129 : 68 __ __ PLA
412a : 85 15 __ STA P8 
412c : 68 __ __ PLA
412d : 85 14 __ STA P7 
412f : 68 __ __ PLA
4130 : 85 0c __ STA $0c 
4132 : 68 __ __ PLA
4133 : 85 0b __ STA WORK + 8 
4135 : 68 __ __ PLA
4136 : 85 0a __ STA WORK + 7 
4138 : 68 __ __ PLA
4139 : 85 09 __ STA WORK + 6 
413b : 68 __ __ PLA
413c : 85 08 __ STA WORK + 5 
413e : 68 __ __ PLA
413f : 85 07 __ STA WORK + 4 
4141 : 4c 31 ea JMP $ea31 
--------------------------------------------------------------------
modplay_tick: ; modplay_tick()->void
; 285, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s1:
4144 : c6 24 __ DEC SP + 1 
4146 : a5 03 __ LDA WORK + 0 
4148 : 48 __ __ PHA
4149 : a5 04 __ LDA WORK + 1 
414b : 48 __ __ PHA
414c : a5 05 __ LDA WORK + 2 
414e : 48 __ __ PHA
414f : a5 06 __ LDA WORK + 3 
4151 : 48 __ __ PHA
4152 : a5 0d __ LDA P0 
4154 : 48 __ __ PHA
4155 : a5 0e __ LDA P1 
4157 : 48 __ __ PHA
4158 : a5 0f __ LDA P2 
415a : 48 __ __ PHA
415b : a5 10 __ LDA P3 
415d : 48 __ __ PHA
415e : a5 11 __ LDA P4 
4160 : 48 __ __ PHA
4161 : a5 12 __ LDA P5 
4163 : 48 __ __ PHA
4164 : a5 13 __ LDA P6 
4166 : 48 __ __ PHA
4167 : a5 1b __ LDA ACCU + 0 
4169 : 48 __ __ PHA
416a : a5 1c __ LDA ACCU + 1 
416c : 48 __ __ PHA
416d : a5 1d __ LDA ACCU + 2 
416f : 48 __ __ PHA
4170 : a5 1e __ LDA ACCU + 3 
4172 : 48 __ __ PHA
4173 : a5 43 __ LDA T0 + 0 
4175 : 48 __ __ PHA
4176 : a5 44 __ LDA T0 + 1 
4178 : 48 __ __ PHA
4179 : a5 45 __ LDA T2 + 0 
417b : 48 __ __ PHA
417c : a5 46 __ LDA $46 
417e : 48 __ __ PHA
417f : a5 47 __ LDA $47 
4181 : 48 __ __ PHA
4182 : a5 48 __ LDA $48 
4184 : 48 __ __ PHA
4185 : a5 49 __ LDA $49 
4187 : 48 __ __ PHA
4188 : a5 4a __ LDA $4a 
418a : 48 __ __ PHA
418b : a5 4b __ LDA $4b 
418d : 48 __ __ PHA
418e : a5 4c __ LDA $4c 
4190 : 48 __ __ PHA
4191 : a5 4d __ LDA $4d 
4193 : 48 __ __ PHA
4194 : a5 4e __ LDA $4e 
4196 : 48 __ __ PHA
4197 : a5 4f __ LDA $4f 
4199 : 48 __ __ PHA
419a : a5 50 __ LDA $50 
419c : 48 __ __ PHA
419d : a5 51 __ LDA $51 
419f : 48 __ __ PHA
.s4:
41a0 : ad 08 84 LDA $8408 ; (modplay.active + 0)
41a3 : d0 03 __ BNE $41a8 ; (modplay_tick.s5 + 0)
41a5 : 4c 3e 42 JMP $423e ; (modplay_tick.s3 + 0)
.s5:
41a8 : ad da 7b LDA $7bda ; (mod_paused + 0)
41ab : d0 f8 __ BNE $41a5 ; (modplay_tick.s4 + 5)
.s6:
41ad : ad 02 84 LDA $8402 ; (modplay.tick + 0)
41b0 : d0 19 __ BNE $41cb ; (modplay_tick.s25 + 0)
.s7:
41b2 : ad 04 84 LDA $8404 ; (modplay.bpm + 0)
41b5 : 20 13 3f JSR $3f13 ; (bpm_to_timer.s4 + 0)
41b8 : a5 1b __ LDA ACCU + 0 
41ba : 8d 04 dc STA $dc04 
41bd : a5 1c __ LDA ACCU + 1 
41bf : 8d 05 dc STA $dc05 
41c2 : 20 cd 42 JSR $42cd ; (process_new_row.s1 + 0)
41c5 : ac 03 84 LDY $8403 ; (modplay.ticks_per_row + 0)
41c8 : 4c e4 41 JMP $41e4 ; (modplay_tick.s8 + 0)
.s25:
41cb : a9 00 __ LDA #$00
41cd : 85 0f __ STA P2 
41cf : 20 5f 49 JSR $495f ; (fx_tick.s4 + 0)
41d2 : e6 0f __ INC P2 
41d4 : 20 5f 49 JSR $495f ; (fx_tick.s4 + 0)
41d7 : e6 0f __ INC P2 
41d9 : 20 5f 49 JSR $495f ; (fx_tick.s4 + 0)
41dc : e6 0f __ INC P2 
41de : 20 5f 49 JSR $495f ; (fx_tick.s4 + 0)
41e1 : ac 02 84 LDY $8402 ; (modplay.tick + 0)
.s8:
41e4 : 88 __ __ DEY
41e5 : 8c 02 84 STY $8402 ; (modplay.tick + 0)
41e8 : a9 00 __ LDA #$00
41ea : 85 13 __ STA P6 
.l26:
41ec : 20 dc 4b JSR $4bdc ; (ua_update_channel.s1 + 0)
41ef : e6 13 __ INC P6 
41f1 : a5 13 __ LDA P6 
41f3 : c9 04 __ CMP #$04
41f5 : 90 f5 __ BCC $41ec ; (modplay_tick.l26 + 0)
.s9:
41f7 : ad 02 84 LDA $8402 ; (modplay.tick + 0)
41fa : d0 42 __ BNE $423e ; (modplay_tick.s3 + 0)
.s10:
41fc : ad 05 84 LDA $8405 ; (modplay.pattern_delay + 0)
41ff : f0 05 __ BEQ $4206 ; (modplay_tick.s11 + 0)
.s24:
4201 : ce 05 84 DEC $8405 ; (modplay.pattern_delay + 0)
4204 : b0 38 __ BCS $423e ; (modplay_tick.s3 + 0)
.s11:
4206 : ad 0a 84 LDA $840a ; (modplay.skip_row_advance + 0)
4209 : f0 03 __ BEQ $420e ; (modplay_tick.s12 + 0)
420b : 4c 9b 42 JMP $429b ; (modplay_tick.s18 + 0)
.s12:
420e : ee 01 84 INC $8401 ; (modplay.row + 0)
4211 : ad 01 84 LDA $8401 ; (modplay.row + 0)
4214 : c9 40 __ CMP #$40
4216 : 90 26 __ BCC $423e ; (modplay_tick.s3 + 0)
.s13:
4218 : ee ff 83 INC $83ff ; (modplay.order_pos + 0)
421b : a9 00 __ LDA #$00
421d : 8d 01 84 STA $8401 ; (modplay.row + 0)
4220 : ad ff 83 LDA $83ff ; (modplay.order_pos + 0)
4223 : cd 7c 83 CMP $837c ; (modplay.song_length + 0)
4226 : 90 0f __ BCC $4237 ; (modplay_tick.s14 + 0)
.s15:
4228 : ad 09 84 LDA $8409 ; (modplay.loop_song + 0)
422b : d0 05 __ BNE $4232 ; (modplay_tick.s17 + 0)
.s16:
422d : 8d 08 84 STA $8408 ; (modplay.active + 0)
4230 : b0 0c __ BCS $423e ; (modplay_tick.s3 + 0)
.s17:
4232 : a9 00 __ LDA #$00
4234 : 8d ff 83 STA $83ff ; (modplay.order_pos + 0)
.s14:
4237 : aa __ __ TAX
4238 : bd 7f 83 LDA $837f,x ; (modplay.order_table[0] + 0)
423b : 8d 00 84 STA $8400 ; (modplay.pattern_num + 0)
.s3:
423e : 68 __ __ PLA
423f : 85 51 __ STA $51 
4241 : 68 __ __ PLA
4242 : 85 50 __ STA $50 
4244 : 68 __ __ PLA
4245 : 85 4f __ STA $4f 
4247 : 68 __ __ PLA
4248 : 85 4e __ STA $4e 
424a : 68 __ __ PLA
424b : 85 4d __ STA $4d 
424d : 68 __ __ PLA
424e : 85 4c __ STA $4c 
4250 : 68 __ __ PLA
4251 : 85 4b __ STA $4b 
4253 : 68 __ __ PLA
4254 : 85 4a __ STA $4a 
4256 : 68 __ __ PLA
4257 : 85 49 __ STA $49 
4259 : 68 __ __ PLA
425a : 85 48 __ STA $48 
425c : 68 __ __ PLA
425d : 85 47 __ STA $47 
425f : 68 __ __ PLA
4260 : 85 46 __ STA $46 
4262 : 68 __ __ PLA
4263 : 85 45 __ STA T2 + 0 
4265 : 68 __ __ PLA
4266 : 85 44 __ STA T0 + 1 
4268 : 68 __ __ PLA
4269 : 85 43 __ STA T0 + 0 
426b : 68 __ __ PLA
426c : 85 1e __ STA ACCU + 3 
426e : 68 __ __ PLA
426f : 85 1d __ STA ACCU + 2 
4271 : 68 __ __ PLA
4272 : 85 1c __ STA ACCU + 1 
4274 : 68 __ __ PLA
4275 : 85 1b __ STA ACCU + 0 
4277 : 68 __ __ PLA
4278 : 85 13 __ STA P6 
427a : 68 __ __ PLA
427b : 85 12 __ STA P5 
427d : 68 __ __ PLA
427e : 85 11 __ STA P4 
4280 : 68 __ __ PLA
4281 : 85 10 __ STA P3 
4283 : 68 __ __ PLA
4284 : 85 0f __ STA P2 
4286 : 68 __ __ PLA
4287 : 85 0e __ STA P1 
4289 : 68 __ __ PLA
428a : 85 0d __ STA P0 
428c : 68 __ __ PLA
428d : 85 06 __ STA WORK + 3 
428f : 68 __ __ PLA
4290 : 85 05 __ STA WORK + 2 
4292 : 68 __ __ PLA
4293 : 85 04 __ STA WORK + 1 
4295 : 68 __ __ PLA
4296 : 85 03 __ STA WORK + 0 
4298 : e6 24 __ INC SP + 1 
429a : 60 __ __ RTS
.s18:
429b : ad 0b 84 LDA $840b ; (modplay.next_order + 0)
429e : c9 ff __ CMP #$ff
42a0 : f0 06 __ BEQ $42a8 ; (modplay_tick.s19 + 0)
.s23:
42a2 : 8d ff 83 STA $83ff ; (modplay.order_pos + 0)
42a5 : 4c ab 42 JMP $42ab ; (modplay_tick.s27 + 0)
.s19:
42a8 : ad ff 83 LDA $83ff ; (modplay.order_pos + 0)
.s27:
42ab : cd 7c 83 CMP $837c ; (modplay.song_length + 0)
42ae : 90 0d __ BCC $42bd ; (modplay_tick.s20 + 0)
.s21:
42b0 : ad 09 84 LDA $8409 ; (modplay.loop_song + 0)
42b3 : d0 03 __ BNE $42b8 ; (modplay_tick.s22 + 0)
42b5 : 4c 2d 42 JMP $422d ; (modplay_tick.s16 + 0)
.s22:
42b8 : a9 00 __ LDA #$00
42ba : 8d ff 83 STA $83ff ; (modplay.order_pos + 0)
.s20:
42bd : aa __ __ TAX
42be : bd 7f 83 LDA $837f,x ; (modplay.order_table[0] + 0)
42c1 : 8d 00 84 STA $8400 ; (modplay.pattern_num + 0)
42c4 : ad 0c 84 LDA $840c ; (modplay.next_row + 0)
42c7 : 8d 01 84 STA $8401 ; (modplay.row + 0)
42ca : 4c 3e 42 JMP $423e ; (modplay_tick.s3 + 0)
--------------------------------------------------------------------
process_new_row: ; process_new_row()->void
; 579, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s1:
42cd : 38 __ __ SEC
42ce : a5 23 __ LDA SP + 0 
42d0 : e9 0b __ SBC #$0b
42d2 : 85 23 __ STA SP + 0 
42d4 : b0 02 __ BCS $42d8 ; (process_new_row.s4 + 0)
42d6 : c6 24 __ DEC SP + 1 
.s4:
42d8 : a9 00 __ LDA #$00
42da : 8d 0a 84 STA $840a ; (modplay.skip_row_advance + 0)
42dd : 8d 0c 84 STA $840c ; (modplay.next_row + 0)
42e0 : ad 78 83 LDA $8378 ; (modplay.reu_base + 0)
42e3 : 18 __ __ CLC
42e4 : 69 3c __ ADC #$3c
42e6 : 85 43 __ STA T0 + 0 
42e8 : a9 ff __ LDA #$ff
42ea : 8d 0b 84 STA $840b ; (modplay.next_order + 0)
42ed : a9 ed __ LDA #$ed
42ef : 8d 02 df STA $df02 
42f2 : a9 7b __ LDA #$7b
42f4 : 8d 03 df STA $df03 
42f7 : ad 79 83 LDA $8379 ; (modplay.reu_base + 1)
42fa : 69 04 __ ADC #$04
42fc : aa __ __ TAX
42fd : ac 7a 83 LDY $837a ; (modplay.reu_base + 2)
4300 : 90 01 __ BCC $4303 ; (process_new_row.s9 + 0)
.s8:
4302 : c8 __ __ INY
.s9:
4303 : ad 00 84 LDA $8400 ; (modplay.pattern_num + 0)
4306 : 0a __ __ ASL
4307 : 85 1c __ STA ACCU + 1 
4309 : a9 00 __ LDA #$00
430b : 2a __ __ ROL
430c : 06 1c __ ASL ACCU + 1 
430e : 2a __ __ ROL
430f : 85 1d __ STA ACCU + 2 
4311 : 8a __ __ TXA
4312 : 65 1c __ ADC ACCU + 1 
4314 : 85 44 __ STA T0 + 1 
4316 : 98 __ __ TYA
4317 : 65 1d __ ADC ACCU + 2 
4319 : 85 45 __ STA T0 + 2 
431b : ad 01 84 LDA $8401 ; (modplay.row + 0)
431e : 85 1b __ STA ACCU + 0 
4320 : a9 00 __ LDA #$00
4322 : 85 1c __ STA ACCU + 1 
4324 : 85 1d __ STA ACCU + 2 
4326 : a2 04 __ LDX #$04
.l5:
4328 : 06 1b __ ASL ACCU + 0 
432a : 26 1c __ ROL ACCU + 1 
432c : 26 1d __ ROL ACCU + 2 
432e : 2a __ __ ROL
432f : ca __ __ DEX
4330 : d0 f6 __ BNE $4328 ; (process_new_row.l5 + 0)
.s6:
4332 : 18 __ __ CLC
4333 : a5 1b __ LDA ACCU + 0 
4335 : 65 43 __ ADC T0 + 0 
4337 : 8d 04 df STA $df04 
433a : a5 1c __ LDA ACCU + 1 
433c : 65 44 __ ADC T0 + 1 
433e : 8d 05 df STA $df05 
4341 : a5 1d __ LDA ACCU + 2 
4343 : 65 45 __ ADC T0 + 2 
4345 : 8d 06 df STA $df06 
4348 : a9 10 __ LDA #$10
434a : 8d 07 df STA $df07 
434d : 8e 08 df STX $df08 
4350 : 8e 0a df STX $df0a 
4353 : 86 4a __ STX T5 + 0 
4355 : 86 4b __ STX T7 + 0 
4357 : 86 10 __ STX P3 
4359 : a9 91 __ LDA #$91
435b : 8d 01 df STA $df01 
435e : 18 __ __ CLC
435f : a5 23 __ LDA SP + 0 
4361 : 69 06 __ ADC #$06
4363 : 85 11 __ STA P4 
4365 : a5 24 __ LDA SP + 1 
4367 : 69 00 __ ADC #$00
4369 : 85 12 __ STA P5 
.l7:
436b : a6 4b __ LDX T7 + 0 
436d : bd ed 7b LDA $7bed,x ; (mod_row_buf[0] + 0)
4370 : 29 f0 __ AND #$f0
4372 : 85 48 __ STA T2 + 0 
4374 : bd ef 7b LDA $7bef,x ; (mod_row_buf[0] + 2)
4377 : 4a __ __ LSR
4378 : 4a __ __ LSR
4379 : 4a __ __ LSR
437a : 4a __ __ LSR
437b : 05 48 __ ORA T2 + 0 
437d : a0 06 __ LDY #$06
437f : 91 23 __ STA (SP + 0),y 
4381 : bd ee 7b LDA $7bee,x ; (mod_row_buf[0] + 1)
4384 : c8 __ __ INY
4385 : 91 23 __ STA (SP + 0),y 
4387 : bd ed 7b LDA $7bed,x ; (mod_row_buf[0] + 0)
438a : 29 0f __ AND #$0f
438c : c8 __ __ INY
438d : 91 23 __ STA (SP + 0),y 
438f : bd ef 7b LDA $7bef,x ; (mod_row_buf[0] + 2)
4392 : 29 0f __ AND #$0f
4394 : 85 49 __ STA T3 + 0 
4396 : c8 __ __ INY
4397 : 91 23 __ STA (SP + 0),y 
4399 : bd f0 7b LDA $7bf0,x ; (mod_row_buf[0] + 3)
439c : c8 __ __ INY
439d : 91 23 __ STA (SP + 0),y 
439f : a5 49 __ LDA T3 + 0 
43a1 : a4 4a __ LDY T5 + 0 
43a3 : 99 61 86 STA $8661,y ; (modplay.channel[0].effect + 0)
43a6 : bd f0 7b LDA $7bf0,x ; (mod_row_buf[0] + 3)
43a9 : 99 62 86 STA $8662,y ; (modplay.channel[0].eparam + 0)
43ac : 20 d8 43 JSR $43d8 ; (apply_note.s4 + 0)
43af : a5 10 __ LDA P3 
43b1 : 85 0f __ STA P2 
43b3 : 20 62 46 JSR $4662 ; (fx_row.s4 + 0)
43b6 : 18 __ __ CLC
43b7 : a5 4a __ LDA T5 + 0 
43b9 : 69 32 __ ADC #$32
43bb : 85 4a __ STA T5 + 0 
43bd : 18 __ __ CLC
43be : a5 4b __ LDA T7 + 0 
43c0 : 69 04 __ ADC #$04
43c2 : 85 4b __ STA T7 + 0 
43c4 : e6 10 __ INC P3 
43c6 : a5 10 __ LDA P3 
43c8 : c9 04 __ CMP #$04
43ca : 90 9f __ BCC $436b ; (process_new_row.l7 + 0)
.s3:
43cc : 18 __ __ CLC
43cd : a5 23 __ LDA SP + 0 
43cf : 69 0b __ ADC #$0b
43d1 : 85 23 __ STA SP + 0 
43d3 : 90 02 __ BCC $43d7 ; (process_new_row.s3 + 11)
43d5 : e6 24 __ INC SP + 1 
43d7 : 60 __ __ RTS
--------------------------------------------------------------------
apply_note: ; apply_note(u8,struct S#23770*)->void
; 194, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
43d8 : a5 10 __ LDA P3 ; (ch_idx + 0)
43da : 0a __ __ ASL
43db : 18 __ __ CLC
43dc : 65 10 __ ADC P3 ; (ch_idx + 0)
43de : 0a __ __ ASL
43df : 0a __ __ ASL
43e0 : 0a __ __ ASL
43e1 : 18 __ __ CLC
43e2 : 65 10 __ ADC P3 ; (ch_idx + 0)
43e4 : 0a __ __ ASL
43e5 : 85 47 __ STA T3 + 0 
43e7 : a0 00 __ LDY #$00
43e9 : b1 11 __ LDA (P4),y ; (n + 0)
43eb : d0 03 __ BNE $43f0 ; (apply_note.s14 + 0)
43ed : 4c a0 44 JMP $44a0 ; (apply_note.s5 + 0)
.s14:
43f0 : ad 7d 83 LDA $837d ; (modplay.num_samples + 0)
43f3 : d1 11 __ CMP (P4),y ; (n + 0)
43f5 : 90 f6 __ BCC $43ed ; (apply_note.s4 + 21)
.s15:
43f7 : 84 1c __ STY ACCU + 1 
43f9 : b1 11 __ LDA (P4),y ; (n + 0)
43fb : a6 47 __ LDX T3 + 0 
43fd : 9d 5a 86 STA $865a,x ; (modplay.channel[0].sample_num + 0)
4400 : 85 1b __ STA ACCU + 0 
4402 : a9 13 __ LDA #$13
4404 : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
4407 : 18 __ __ CLC
4408 : a9 fa __ LDA #$fa
440a : 65 1b __ ADC ACCU + 0 
440c : 85 1b __ STA ACCU + 0 
440e : a9 83 __ LDA #$83
4410 : 65 1c __ ADC ACCU + 1 
4412 : 85 1c __ STA ACCU + 1 
4414 : a0 11 __ LDY #$11
4416 : b1 1b __ LDA (ACCU + 0),y 
4418 : a6 47 __ LDX T3 + 0 
441a : 9d 5f 86 STA $865f,x ; (modplay.channel[0].volume + 0)
441d : 88 __ __ DEY
441e : b1 1b __ LDA (ACCU + 0),y 
4420 : 9d 7b 86 STA $867b,x ; (modplay.channel[0].needs_loop + 0)
4423 : a0 01 __ LDY #$01
4425 : b1 1b __ LDA (ACCU + 0),y 
4427 : 85 44 __ STA T0 + 1 
4429 : 9d 7d 86 STA $867d,x ; (modplay.channel[0].smp_start + 1)
442c : c8 __ __ INY
442d : b1 1b __ LDA (ACCU + 0),y 
442f : 85 45 __ STA T0 + 2 
4431 : 9d 7e 86 STA $867e,x ; (modplay.channel[0].smp_start + 2)
4434 : c8 __ __ INY
4435 : b1 1b __ LDA (ACCU + 0),y 
4437 : 85 46 __ STA T0 + 3 
4439 : 9d 7f 86 STA $867f,x ; (modplay.channel[0].smp_start + 3)
443c : a0 00 __ LDY #$00
443e : b1 1b __ LDA (ACCU + 0),y 
4440 : 85 43 __ STA T0 + 0 
4442 : 9d 7c 86 STA $867c,x ; (modplay.channel[0].smp_start + 0)
4445 : a0 04 __ LDY #$04
4447 : b1 1b __ LDA (ACCU + 0),y 
4449 : 9d 80 86 STA $8680,x ; (modplay.channel[0].smp_length + 0)
444c : c8 __ __ INY
444d : b1 1b __ LDA (ACCU + 0),y 
444f : 9d 81 86 STA $8681,x ; (modplay.channel[0].smp_length + 1)
4452 : c8 __ __ INY
4453 : b1 1b __ LDA (ACCU + 0),y 
4455 : 9d 82 86 STA $8682,x ; (modplay.channel[0].smp_length + 2)
4458 : c8 __ __ INY
4459 : b1 1b __ LDA (ACCU + 0),y 
445b : 9d 83 86 STA $8683,x ; (modplay.channel[0].smp_length + 3)
445e : 18 __ __ CLC
445f : c8 __ __ INY
4460 : b1 1b __ LDA (ACCU + 0),y 
4462 : 65 43 __ ADC T0 + 0 
4464 : 9d 84 86 STA $8684,x ; (modplay.channel[0].smp_loop_a + 0)
4467 : c8 __ __ INY
4468 : b1 1b __ LDA (ACCU + 0),y 
446a : 65 44 __ ADC T0 + 1 
446c : 9d 85 86 STA $8685,x ; (modplay.channel[0].smp_loop_a + 1)
446f : c8 __ __ INY
4470 : b1 1b __ LDA (ACCU + 0),y 
4472 : 65 45 __ ADC T0 + 2 
4474 : 9d 86 86 STA $8686,x ; (modplay.channel[0].smp_loop_a + 2)
4477 : c8 __ __ INY
4478 : b1 1b __ LDA (ACCU + 0),y 
447a : 65 46 __ ADC T0 + 3 
447c : 9d 87 86 STA $8687,x ; (modplay.channel[0].smp_loop_a + 3)
447f : 18 __ __ CLC
4480 : c8 __ __ INY
4481 : b1 1b __ LDA (ACCU + 0),y 
4483 : 65 43 __ ADC T0 + 0 
4485 : 9d 88 86 STA $8688,x ; (modplay.channel[0].smp_loop_b + 0)
4488 : c8 __ __ INY
4489 : b1 1b __ LDA (ACCU + 0),y 
448b : 65 44 __ ADC T0 + 1 
448d : 9d 89 86 STA $8689,x ; (modplay.channel[0].smp_loop_b + 1)
4490 : c8 __ __ INY
4491 : b1 1b __ LDA (ACCU + 0),y 
4493 : 65 45 __ ADC T0 + 2 
4495 : 9d 8a 86 STA $868a,x ; (modplay.channel[0].smp_loop_b + 2)
4498 : c8 __ __ INY
4499 : b1 1b __ LDA (ACCU + 0),y 
449b : 65 46 __ ADC T0 + 3 
449d : 9d 8b 86 STA $868b,x ; (modplay.channel[0].smp_loop_b + 3)
.s5:
44a0 : a0 01 __ LDY #$01
44a2 : b1 11 __ LDA (P4),y ; (n + 0)
44a4 : 85 0d __ STA P0 
44a6 : c8 __ __ INY
44a7 : b1 11 __ LDA (P4),y ; (n + 0)
44a9 : 85 0e __ STA P1 
44ab : c8 __ __ INY
44ac : 05 0d __ ORA P0 
44ae : f0 6f __ BEQ $451f ; (apply_note.s6 + 0)
.s10:
44b0 : b1 11 __ LDA (P4),y ; (n + 0)
44b2 : c9 03 __ CMP #$03
44b4 : f0 69 __ BEQ $451f ; (apply_note.s6 + 0)
.s11:
44b6 : a6 47 __ LDX T3 + 0 
44b8 : bd 5a 86 LDA $865a,x ; (modplay.channel[0].sample_num + 0)
44bb : f0 1a __ BEQ $44d7 ; (apply_note.s18 + 0)
.s13:
44bd : 85 1b __ STA ACCU + 0 
44bf : a9 00 __ LDA #$00
44c1 : 85 1c __ STA ACCU + 1 
44c3 : a9 13 __ LDA #$13
44c5 : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
44c8 : a9 0c __ LDA #$0c
44ca : 85 43 __ STA T0 + 0 
44cc : 18 __ __ CLC
44cd : a9 84 __ LDA #$84
44cf : 65 1c __ ADC ACCU + 1 
44d1 : 85 44 __ STA T0 + 1 
44d3 : a4 1b __ LDY ACCU + 0 
44d5 : b1 43 __ LDA (T0 + 0),y 
.s18:
44d7 : 85 0f __ STA P2 
44d9 : 20 6a 45 JSR $456a ; (period_finetune.s4 + 0)
44dc : a5 1b __ LDA ACCU + 0 
44de : 85 0d __ STA P0 
44e0 : a6 47 __ LDX T3 + 0 
44e2 : 9d 5b 86 STA $865b,x ; (modplay.channel[0].period + 0)
44e5 : a5 1c __ LDA ACCU + 1 
44e7 : 85 0e __ STA P1 
44e9 : 9d 5c 86 STA $865c,x ; (modplay.channel[0].period + 1)
44ec : 20 19 46 JSR $4619 ; (period_to_rate.s4 + 0)
44ef : a5 1b __ LDA ACCU + 0 
44f1 : a6 47 __ LDX T3 + 0 
44f3 : 9d 5d 86 STA $865d,x ; (modplay.channel[0].rate + 0)
44f6 : a5 1c __ LDA ACCU + 1 
44f8 : 9d 5e 86 STA $865e,x ; (modplay.channel[0].rate + 1)
44fb : a0 00 __ LDY #$00
44fd : b1 11 __ LDA (P4),y ; (n + 0)
44ff : 9d 71 86 STA $8671,x ; (modplay.channel[0].last_note + 0)
4502 : a0 03 __ LDY #$03
4504 : b1 11 __ LDA (P4),y ; (n + 0)
4506 : c9 03 __ CMP #$03
4508 : f0 15 __ BEQ $451f ; (apply_note.s6 + 0)
.s12:
450a : a8 __ __ TAY
450b : a9 00 __ LDA #$00
450d : 9d 67 86 STA $8667,x ; (modplay.channel[0].vib_pos + 0)
4510 : 9d 6b 86 STA $866b,x ; (modplay.channel[0].trm_pos + 0)
4513 : 9d 70 86 STA $8670,x ; (modplay.channel[0].arp_counter + 0)
4516 : a9 01 __ LDA #$01
4518 : 9d 7a 86 STA $867a,x ; (modplay.channel[0].needs_start + 0)
451b : 98 __ __ TYA
451c : 4c 21 45 JMP $4521 ; (apply_note.s16 + 0)
.s6:
451f : b1 11 __ LDA (P4),y ; (n + 0)
.s16:
4521 : c9 03 __ CMP #$03
4523 : d0 44 __ BNE $4569 ; (apply_note.s3 + 0)
.s7:
4525 : a0 01 __ LDY #$01
4527 : b1 11 __ LDA (P4),y ; (n + 0)
4529 : 85 0d __ STA P0 
452b : c8 __ __ INY
452c : 11 11 __ ORA (P4),y ; (n + 0)
452e : f0 39 __ BEQ $4569 ; (apply_note.s3 + 0)
.s8:
4530 : b1 11 __ LDA (P4),y ; (n + 0)
4532 : 85 0e __ STA P1 
4534 : a6 47 __ LDX T3 + 0 
4536 : bd 5a 86 LDA $865a,x ; (modplay.channel[0].sample_num + 0)
4539 : f0 1a __ BEQ $4555 ; (apply_note.s17 + 0)
.s9:
453b : 85 1b __ STA ACCU + 0 
453d : a9 00 __ LDA #$00
453f : 85 1c __ STA ACCU + 1 
4541 : a9 13 __ LDA #$13
4543 : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
4546 : a9 0c __ LDA #$0c
4548 : 85 43 __ STA T0 + 0 
454a : 18 __ __ CLC
454b : a9 84 __ LDA #$84
454d : 65 1c __ ADC ACCU + 1 
454f : 85 44 __ STA T0 + 1 
4551 : a4 1b __ LDY ACCU + 0 
4553 : b1 43 __ LDA (T0 + 0),y 
.s17:
4555 : 85 0f __ STA P2 
4557 : 20 6a 45 JSR $456a ; (period_finetune.s4 + 0)
455a : 20 11 46 JSR $4611 ; (period_to_rate@proxy + 0)
455d : a5 1b __ LDA ACCU + 0 
455f : a6 47 __ LDX T3 + 0 
4561 : 9d 63 86 STA $8663,x ; (modplay.channel[0].porta_target + 0)
4564 : a5 1c __ LDA ACCU + 1 
4566 : 9d 64 86 STA $8664,x ; (modplay.channel[0].porta_target + 1)
.s3:
4569 : 60 __ __ RTS
--------------------------------------------------------------------
period_finetune: ; period_finetune(u16,u8)->u16
;  59, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
456a : a5 0f __ LDA P2 ; (finetune_raw + 0)
456c : c9 08 __ CMP #$08
456e : b0 03 __ BCS $4573 ; (period_finetune.s14 + 0)
4570 : 4c 08 46 JMP $4608 ; (period_finetune.s5 + 0)
.s14:
4573 : e9 10 __ SBC #$10
4575 : 85 0f __ STA P2 ; (finetune_raw + 0)
4577 : f0 06 __ BEQ $457f ; (period_finetune.s6 + 0)
.s7:
4579 : a5 0e __ LDA P1 ; (period + 1)
457b : 05 0d __ ORA P0 ; (period + 0)
457d : d0 09 __ BNE $4588 ; (period_finetune.s8 + 0)
.s6:
457f : a5 0d __ LDA P0 ; (period + 0)
4581 : 85 1b __ STA ACCU + 0 
4583 : a5 0e __ LDA P1 ; (period + 1)
4585 : 4c 05 46 JMP $4605 ; (period_finetune.s3 + 0)
.s8:
4588 : a5 0f __ LDA P2 ; (finetune_raw + 0)
458a : 10 05 __ BPL $4591 ; (period_finetune.s9 + 0)
.s13:
458c : 38 __ __ SEC
458d : a9 00 __ LDA #$00
458f : e5 0f __ SBC P2 ; (finetune_raw + 0)
.s9:
4591 : a6 0d __ LDX P0 ; (period + 0)
4593 : 86 1b __ STX ACCU + 0 
4595 : a6 0e __ LDX P1 ; (period + 1)
4597 : 86 1c __ STX ACCU + 1 
4599 : a2 00 __ LDX #$00
459b : 86 1d __ STX ACCU + 2 
459d : 86 1e __ STX ACCU + 3 
459f : 20 88 6f JSR $6f88 ; (mul32by8 + 0)
45a2 : a5 07 __ LDA WORK + 4 
45a4 : 85 1b __ STA ACCU + 0 
45a6 : a5 08 __ LDA WORK + 5 
45a8 : 85 1c __ STA ACCU + 1 
45aa : a5 09 __ LDA WORK + 6 
45ac : 85 1d __ STA ACCU + 2 
45ae : a5 0a __ LDA WORK + 7 
45b0 : 85 1e __ STA ACCU + 3 
45b2 : a9 00 __ LDA #$00
45b4 : 85 05 __ STA WORK + 2 
45b6 : 85 06 __ STA WORK + 3 
45b8 : a9 e9 __ LDA #$e9
45ba : 85 03 __ STA WORK + 0 
45bc : a9 02 __ LDA #$02
45be : 85 04 __ STA WORK + 1 
45c0 : 20 c0 70 JSR $70c0 ; (mul32 + 0)
45c3 : a5 07 __ LDA WORK + 4 
45c5 : 85 1b __ STA ACCU + 0 
45c7 : a5 08 __ LDA WORK + 5 
45c9 : 85 1c __ STA ACCU + 1 
45cb : a5 09 __ LDA WORK + 6 
45cd : 85 1d __ STA ACCU + 2 
45cf : a5 0a __ LDA WORK + 7 
45d1 : 85 1e __ STA ACCU + 3 
45d3 : a9 a0 __ LDA #$a0
45d5 : 85 03 __ STA WORK + 0 
45d7 : a9 00 __ LDA #$00
45d9 : 85 06 __ STA WORK + 3 
45db : a9 86 __ LDA #$86
45dd : 85 04 __ STA WORK + 1 
45df : a9 01 __ LDA #$01
45e1 : 85 05 __ STA WORK + 2 
45e3 : 20 28 71 JSR $7128 ; (divs32 + 0)
45e6 : a5 0f __ LDA P2 ; (finetune_raw + 0)
45e8 : 30 02 __ BMI $45ec ; (period_finetune.s10 + 0)
.s12:
45ea : d0 0e __ BNE $45fa ; (period_finetune.s11 + 0)
.s10:
45ec : 18 __ __ CLC
45ed : a5 0d __ LDA P0 ; (period + 0)
45ef : 65 1b __ ADC ACCU + 0 
45f1 : 85 1b __ STA ACCU + 0 
45f3 : a5 0e __ LDA P1 ; (period + 1)
45f5 : 65 1c __ ADC ACCU + 1 
45f7 : 4c 05 46 JMP $4605 ; (period_finetune.s3 + 0)
.s11:
45fa : 38 __ __ SEC
45fb : a5 0d __ LDA P0 ; (period + 0)
45fd : e5 1b __ SBC ACCU + 0 
45ff : 85 1b __ STA ACCU + 0 
4601 : a5 0e __ LDA P1 ; (period + 1)
4603 : e5 1c __ SBC ACCU + 1 
.s3:
4605 : 85 1c __ STA ACCU + 1 
4607 : 60 __ __ RTS
.s5:
4608 : aa __ __ TAX
4609 : d0 03 __ BNE $460e ; (period_finetune.s5 + 6)
460b : 4c 7f 45 JMP $457f ; (period_finetune.s6 + 0)
460e : 4c 79 45 JMP $4579 ; (period_finetune.s7 + 0)
--------------------------------------------------------------------
period_to_rate@proxy: ; period_to_rate@proxy
4611 : a5 1b __ LDA ACCU + 0 
4613 : 85 0d __ STA P0 
4615 : a5 1c __ LDA ACCU + 1 
4617 : 85 0e __ STA P1 
--------------------------------------------------------------------
period_to_rate: ; period_to_rate(u16)->u16
;  41, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4619 : a5 0e __ LDA P1 ; (period + 1)
461b : 05 0d __ ORA P0 ; (period + 0)
461d : f0 3e __ BEQ $465d ; (period_to_rate.s6 + 0)
.s5:
461f : a5 0d __ LDA P0 ; (period + 0)
4621 : 85 1b __ STA ACCU + 0 
4623 : a5 0e __ LDA P1 ; (period + 1)
4625 : 85 1c __ STA ACCU + 1 
4627 : a9 00 __ LDA #$00
4629 : 85 1d __ STA ACCU + 2 
462b : 85 1e __ STA ACCU + 3 
462d : 85 05 __ STA WORK + 2 
462f : 85 06 __ STA WORK + 3 
4631 : a9 d4 __ LDA #$d4
4633 : 85 03 __ STA WORK + 0 
4635 : a9 30 __ LDA #$30
4637 : 85 04 __ STA WORK + 1 
4639 : 20 c0 70 JSR $70c0 ; (mul32 + 0)
463c : a5 07 __ LDA WORK + 4 
463e : 85 1b __ STA ACCU + 0 
4640 : a5 08 __ LDA WORK + 5 
4642 : 85 1c __ STA ACCU + 1 
4644 : a5 09 __ LDA WORK + 6 
4646 : 85 1d __ STA ACCU + 2 
4648 : a5 0a __ LDA WORK + 7 
464a : 85 1e __ STA ACCU + 3 
464c : a9 00 __ LDA #$00
464e : 85 05 __ STA WORK + 2 
4650 : 85 06 __ STA WORK + 3 
4652 : a9 b6 __ LDA #$b6
4654 : 85 03 __ STA WORK + 0 
4656 : a9 1b __ LDA #$1b
4658 : 85 04 __ STA WORK + 1 
465a : 4c 37 3f JMP $3f37 ; (divmod32 + 0)
.s6:
465d : 85 1b __ STA ACCU + 0 
465f : 85 1c __ STA ACCU + 1 
.s3:
4661 : 60 __ __ RTS
--------------------------------------------------------------------
fx_row: ; fx_row(u8)->void
; 242, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4662 : a4 0f __ LDY P2 ; (ch_idx + 0)
4664 : be 76 73 LDX $7376,y ; (__multab50L + 0)
4667 : bd 62 86 LDA $8662,x ; (modplay.channel[0].eparam + 0)
466a : 85 1c __ STA ACCU + 1 
466c : 4a __ __ LSR
466d : 4a __ __ LSR
466e : 4a __ __ LSR
466f : 4a __ __ LSR
4670 : 85 1b __ STA ACCU + 0 
4672 : bd 61 86 LDA $8661,x ; (modplay.channel[0].effect + 0)
4675 : c9 08 __ CMP #$08
4677 : d0 09 __ BNE $4682 ; (fx_row.s5 + 0)
.s93:
4679 : a4 1b __ LDY ACCU + 0 
467b : b9 c7 73 LDA $73c7,y ; (__multab17L + 0)
467e : 9d 60 86 STA $8660,x ; (modplay.channel[0].pan + 0)
.s3:
4681 : 60 __ __ RTS
.s5:
4682 : a5 1c __ LDA ACCU + 1 
4684 : 29 0f __ AND #$0f
4686 : 85 43 __ STA T0 + 0 
4688 : bd 61 86 LDA $8661,x ; (modplay.channel[0].effect + 0)
468b : c9 08 __ CMP #$08
468d : b0 03 __ BCS $4692 ; (fx_row.s6 + 0)
468f : 4c c9 48 JMP $48c9 ; (fx_row.s74 + 0)
.s6:
4692 : c9 0c __ CMP #$0c
4694 : d0 03 __ BNE $4699 ; (fx_row.s7 + 0)
4696 : 4c bb 48 JMP $48bb ; (fx_row.s73 + 0)
.s7:
4699 : b0 03 __ BCS $469e ; (fx_row.s8 + 0)
469b : 4c 3e 48 JMP $483e ; (fx_row.s57 + 0)
.s8:
469e : c9 0e __ CMP #$0e
46a0 : f0 33 __ BEQ $46d5 ; (fx_row.s16 + 0)
.s9:
46a2 : 90 14 __ BCC $46b8 ; (fx_row.s15 + 0)
.s10:
46a4 : c9 0f __ CMP #$0f
46a6 : d0 d9 __ BNE $4681 ; (fx_row.s3 + 0)
.s11:
46a8 : a5 1c __ LDA ACCU + 1 
46aa : f0 d5 __ BEQ $4681 ; (fx_row.s3 + 0)
.s12:
46ac : c9 20 __ CMP #$20
46ae : b0 04 __ BCS $46b4 ; (fx_row.s13 + 0)
.s14:
46b0 : 8d 03 84 STA $8403 ; (modplay.ticks_per_row + 0)
46b3 : 60 __ __ RTS
.s13:
46b4 : 8d 04 84 STA $8404 ; (modplay.bpm + 0)
46b7 : 60 __ __ RTS
.s15:
46b8 : ae ff 83 LDX $83ff ; (modplay.order_pos + 0)
46bb : e8 __ __ INX
46bc : 8e 0b 84 STX $840b ; (modplay.next_order + 0)
46bf : a9 01 __ LDA #$01
46c1 : 8d 0a 84 STA $840a ; (modplay.skip_row_advance + 0)
46c4 : a6 1b __ LDX ACCU + 0 
46c6 : bd b7 73 LDA $73b7,x ; (__multab10L + 0)
46c9 : 65 43 __ ADC T0 + 0 
46cb : c9 40 __ CMP #$40
46cd : 90 02 __ BCC $46d1 ; (fx_row.s96 + 0)
.s97:
46cf : a9 00 __ LDA #$00
.s96:
46d1 : 8d 0c 84 STA $840c ; (modplay.next_row + 0)
46d4 : 60 __ __ RTS
.s16:
46d5 : a5 1b __ LDA ACCU + 0 
46d7 : c9 07 __ CMP #$07
46d9 : d0 08 __ BNE $46e3 ; (fx_row.s17 + 0)
.s56:
46db : a5 43 __ LDA T0 + 0 
46dd : 29 07 __ AND #$07
46df : 9d 6a 86 STA $866a,x ; (modplay.channel[0].trm_wave + 0)
46e2 : 60 __ __ RTS
.s17:
46e3 : 86 46 __ STX T3 + 0 
46e5 : c9 07 __ CMP #$07
46e7 : 90 6d __ BCC $4756 ; (fx_row.s34 + 0)
.s18:
46e9 : c9 0c __ CMP #$0c
46eb : d0 0b __ BNE $46f8 ; (fx_row.s19 + 0)
.s33:
46ed : a5 43 __ LDA T0 + 0 
46ef : 9d 74 86 STA $8674,x ; (modplay.channel[0].tick_stop + 0)
46f2 : a9 00 __ LDA #$00
46f4 : 9d 75 86 STA $8675,x ; (modplay.channel[0].tick_cur + 0)
46f7 : 60 __ __ RTS
.s19:
46f8 : 90 25 __ BCC $471f ; (fx_row.s25 + 0)
.s20:
46fa : c9 0d __ CMP #$0d
46fc : f0 0b __ BEQ $4709 ; (fx_row.s23 + 0)
.s21:
46fe : c9 0e __ CMP #$0e
4700 : f0 01 __ BEQ $4703 ; (fx_row.s22 + 0)
4702 : 60 __ __ RTS
.s22:
4703 : a5 43 __ LDA T0 + 0 
4705 : 8d 05 84 STA $8405 ; (modplay.pattern_delay + 0)
4708 : 60 __ __ RTS
.s23:
4709 : a5 43 __ LDA T0 + 0 
470b : 9d 74 86 STA $8674,x ; (modplay.channel[0].tick_stop + 0)
470e : a9 00 __ LDA #$00
4710 : 9d 75 86 STA $8675,x ; (modplay.channel[0].tick_cur + 0)
4713 : bd 7a 86 LDA $867a,x ; (modplay.channel[0].needs_start + 0)
4716 : 9d 76 86 STA $8676,x ; (modplay.channel[0].cmd_backup + 0)
.s24:
4719 : a9 00 __ LDA #$00
471b : 9d 7a 86 STA $867a,x ; (modplay.channel[0].needs_start + 0)
471e : 60 __ __ RTS
.s25:
471f : c9 0a __ CMP #$0a
4721 : d0 0f __ BNE $4732 ; (fx_row.s26 + 0)
.s32:
4723 : bd 5f 86 LDA $865f,x ; (modplay.channel[0].volume + 0)
4726 : 18 __ __ CLC
4727 : 65 43 __ ADC T0 + 0 
.s28:
4729 : 20 4e 49 JSR $494e ; (clamp_vol.s4 + 0)
472c : a6 46 __ LDX T3 + 0 
.s95:
472e : 9d 5f 86 STA $865f,x ; (modplay.channel[0].volume + 0)
4731 : 60 __ __ RTS
.s26:
4732 : b0 1a __ BCS $474e ; (fx_row.s27 + 0)
.s30:
4734 : c9 09 __ CMP #$09
4736 : f0 01 __ BEQ $4739 ; (fx_row.s31 + 0)
4738 : 60 __ __ RTS
.s31:
4739 : a5 43 __ LDA T0 + 0 
473b : 9d 74 86 STA $8674,x ; (modplay.channel[0].tick_stop + 0)
473e : a9 00 __ LDA #$00
4740 : 9d 75 86 STA $8675,x ; (modplay.channel[0].tick_cur + 0)
4743 : bd 7a 86 LDA $867a,x ; (modplay.channel[0].needs_start + 0)
4746 : 9d 76 86 STA $8676,x ; (modplay.channel[0].cmd_backup + 0)
4749 : a5 43 __ LDA T0 + 0 
474b : d0 cc __ BNE $4719 ; (fx_row.s24 + 0)
474d : 60 __ __ RTS
.s27:
474e : bd 5f 86 LDA $865f,x ; (modplay.channel[0].volume + 0)
4751 : e5 43 __ SBC T0 + 0 
4753 : 4c 29 47 JMP $4729 ; (fx_row.s28 + 0)
.s34:
4756 : c9 04 __ CMP #$04
4758 : d0 08 __ BNE $4762 ; (fx_row.s35 + 0)
.s55:
475a : a5 43 __ LDA T0 + 0 
475c : 29 07 __ AND #$07
475e : 9d 66 86 STA $8666,x ; (modplay.channel[0].vib_wave + 0)
4761 : 60 __ __ RTS
.s35:
4762 : 90 65 __ BCC $47c9 ; (fx_row.s46 + 0)
.s36:
4764 : c9 05 __ CMP #$05
4766 : d0 2f __ BNE $4797 ; (fx_row.s37 + 0)
.s43:
4768 : bd 5a 86 LDA $865a,x ; (modplay.channel[0].sample_num + 0)
476b : d0 01 __ BNE $476e ; (fx_row.s44 + 0)
476d : 60 __ __ RTS
.s44:
476e : ad 7d 83 LDA $837d ; (modplay.num_samples + 0)
4771 : dd 5a 86 CMP $865a,x ; (modplay.channel[0].sample_num + 0)
4774 : b0 01 __ BCS $4777 ; (fx_row.s45 + 0)
4776 : 60 __ __ RTS
.s45:
4777 : bd 5a 86 LDA $865a,x ; (modplay.channel[0].sample_num + 0)
477a : 85 1b __ STA ACCU + 0 
477c : a9 00 __ LDA #$00
477e : 85 1c __ STA ACCU + 1 
4780 : a9 13 __ LDA #$13
4782 : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
4785 : a9 0c __ LDA #$0c
4787 : 85 44 __ STA T1 + 0 
4789 : 18 __ __ CLC
478a : a9 84 __ LDA #$84
478c : 65 1c __ ADC ACCU + 1 
478e : 85 45 __ STA T1 + 1 
4790 : a5 43 __ LDA T0 + 0 
4792 : a4 1b __ LDY ACCU + 0 
4794 : 91 44 __ STA (T1 + 0),y 
4796 : 60 __ __ RTS
.s37:
4797 : a5 43 __ LDA T0 + 0 
4799 : d0 07 __ BNE $47a2 ; (fx_row.s39 + 0)
.s38:
479b : ad 01 84 LDA $8401 ; (modplay.row + 0)
479e : 9d 72 86 STA $8672,x ; (modplay.channel[0].loop_row + 0)
47a1 : 60 __ __ RTS
.s39:
47a2 : bd 73 86 LDA $8673,x ; (modplay.channel[0].loop_count + 0)
47a5 : f0 1a __ BEQ $47c1 ; (fx_row.s40 + 0)
.s42:
47a7 : 38 __ __ SEC
47a8 : e9 01 __ SBC #$01
47aa : 9d 73 86 STA $8673,x ; (modplay.channel[0].loop_count + 0)
47ad : d0 01 __ BNE $47b0 ; (fx_row.s41 + 0)
47af : 60 __ __ RTS
.s41:
47b0 : a9 01 __ LDA #$01
47b2 : 8d 0a 84 STA $840a ; (modplay.skip_row_advance + 0)
47b5 : ad ff 83 LDA $83ff ; (modplay.order_pos + 0)
47b8 : 8d 0b 84 STA $840b ; (modplay.next_order + 0)
47bb : bd 72 86 LDA $8672,x ; (modplay.channel[0].loop_row + 0)
47be : 4c d1 46 JMP $46d1 ; (fx_row.s96 + 0)
.s40:
47c1 : a5 43 __ LDA T0 + 0 
47c3 : 9d 73 86 STA $8673,x ; (modplay.channel[0].loop_count + 0)
47c6 : 4c b0 47 JMP $47b0 ; (fx_row.s41 + 0)
.s46:
47c9 : c9 02 __ CMP #$02
47cb : f0 4e __ BEQ $481b ; (fx_row.s54 + 0)
.s47:
47cd : 90 01 __ BCC $47d0 ; (fx_row.s48 + 0)
47cf : 60 __ __ RTS
.s48:
47d0 : c9 01 __ CMP #$01
47d2 : f0 01 __ BEQ $47d5 ; (fx_row.s49 + 0)
47d4 : 60 __ __ RTS
.s49:
47d5 : bd 5c 86 LDA $865c,x ; (modplay.channel[0].period + 1)
47d8 : d0 09 __ BNE $47e3 ; (fx_row.s52 + 0)
.s53:
47da : a9 71 __ LDA #$71
47dc : dd 5b 86 CMP $865b,x ; (modplay.channel[0].period + 0)
47df : a4 46 __ LDY T3 + 0 
47e1 : b0 1e __ BCS $4801 ; (fx_row.s50 + 0)
.s52:
47e3 : bd 5b 86 LDA $865b,x ; (modplay.channel[0].period + 0)
47e6 : 38 __ __ SEC
47e7 : e5 43 __ SBC T0 + 0 
47e9 : 85 0d __ STA P0 
47eb : bd 5c 86 LDA $865c,x ; (modplay.channel[0].period + 1)
47ee : e9 00 __ SBC #$00
47f0 : 85 0e __ STA P1 
47f2 : 20 1e 49 JSR $491e ; (clamp_period.s4 + 0)
47f5 : a5 1b __ LDA ACCU + 0 
47f7 : a4 46 __ LDY T3 + 0 
47f9 : 99 5b 86 STA $865b,y ; (modplay.channel[0].period + 0)
47fc : a5 1c __ LDA ACCU + 1 
47fe : 99 5c 86 STA $865c,y ; (modplay.channel[0].period + 1)
.s50:
4801 : b9 5b 86 LDA $865b,y ; (modplay.channel[0].period + 0)
4804 : 85 0d __ STA P0 
4806 : b9 5c 86 LDA $865c,y ; (modplay.channel[0].period + 1)
.s51:
4809 : 85 0e __ STA P1 
480b : 20 19 46 JSR $4619 ; (period_to_rate.s4 + 0)
480e : a5 1b __ LDA ACCU + 0 
4810 : a6 46 __ LDX T3 + 0 
4812 : 9d 5d 86 STA $865d,x ; (modplay.channel[0].rate + 0)
4815 : a5 1c __ LDA ACCU + 1 
4817 : 9d 5e 86 STA $865e,x ; (modplay.channel[0].rate + 1)
481a : 60 __ __ RTS
.s54:
481b : bd 5b 86 LDA $865b,x ; (modplay.channel[0].period + 0)
481e : 18 __ __ CLC
481f : 65 43 __ ADC T0 + 0 
4821 : 85 0d __ STA P0 
4823 : bd 5c 86 LDA $865c,x ; (modplay.channel[0].period + 1)
4826 : 69 00 __ ADC #$00
4828 : 85 0e __ STA P1 
482a : 20 1e 49 JSR $491e ; (clamp_period.s4 + 0)
482d : a5 1b __ LDA ACCU + 0 
482f : 85 0d __ STA P0 
4831 : a6 46 __ LDX T3 + 0 
4833 : 9d 5b 86 STA $865b,x ; (modplay.channel[0].period + 0)
4836 : a5 1c __ LDA ACCU + 1 
4838 : 9d 5c 86 STA $865c,x ; (modplay.channel[0].period + 1)
483b : 4c 09 48 JMP $4809 ; (fx_row.s51 + 0)
.s57:
483e : c9 0a __ CMP #$0a
4840 : f0 6e __ BEQ $48b0 ; (fx_row.s71 + 0)
.s58:
4842 : b0 5f __ BCS $48a3 ; (fx_row.s59 + 0)
.s60:
4844 : a5 1c __ LDA ACCU + 1 
4846 : d0 01 __ BNE $4849 ; (fx_row.s61 + 0)
4848 : 60 __ __ RTS
.s61:
4849 : bd 83 86 LDA $8683,x ; (modplay.channel[0].smp_length + 3)
484c : d0 29 __ BNE $4877 ; (fx_row.s63 + 0)
.s68:
484e : bd 82 86 LDA $8682,x ; (modplay.channel[0].smp_length + 2)
4851 : d0 0b __ BNE $485e ; (fx_row.s62 + 0)
.s69:
4853 : bd 81 86 LDA $8681,x ; (modplay.channel[0].smp_length + 1)
4856 : d0 06 __ BNE $485e ; (fx_row.s62 + 0)
.s70:
4858 : dd 80 86 CMP $8680,x ; (modplay.channel[0].smp_length + 0)
485b : 90 01 __ BCC $485e ; (fx_row.s62 + 0)
485d : 60 __ __ RTS
.s62:
485e : bd 83 86 LDA $8683,x ; (modplay.channel[0].smp_length + 3)
4861 : d0 14 __ BNE $4877 ; (fx_row.s63 + 0)
.s64:
4863 : bd 82 86 LDA $8682,x ; (modplay.channel[0].smp_length + 2)
4866 : d0 0f __ BNE $4877 ; (fx_row.s63 + 0)
.s65:
4868 : a5 1c __ LDA ACCU + 1 
486a : dd 81 86 CMP $8681,x ; (modplay.channel[0].smp_length + 1)
486d : d0 05 __ BNE $4874 ; (fx_row.s67 + 0)
.s66:
486f : a9 00 __ LDA #$00
4871 : dd 80 86 CMP $8680,x ; (modplay.channel[0].smp_length + 0)
.s67:
4874 : 90 01 __ BCC $4877 ; (fx_row.s63 + 0)
4876 : 60 __ __ RTS
.s63:
4877 : bd 81 86 LDA $8681,x ; (modplay.channel[0].smp_length + 1)
487a : 38 __ __ SEC
487b : e5 1c __ SBC ACCU + 1 
487d : 9d 81 86 STA $8681,x ; (modplay.channel[0].smp_length + 1)
4880 : bd 82 86 LDA $8682,x ; (modplay.channel[0].smp_length + 2)
4883 : e9 00 __ SBC #$00
4885 : 9d 82 86 STA $8682,x ; (modplay.channel[0].smp_length + 2)
4888 : b0 03 __ BCS $488d ; (fx_row.s99 + 0)
.s98:
488a : de 83 86 DEC $8683,x ; (modplay.channel[0].smp_length + 3)
.s99:
488d : bd 7d 86 LDA $867d,x ; (modplay.channel[0].smp_start + 1)
4890 : 18 __ __ CLC
4891 : 65 1c __ ADC ACCU + 1 
4893 : 9d 7d 86 STA $867d,x ; (modplay.channel[0].smp_start + 1)
4896 : b0 01 __ BCS $4899 ; (fx_row.s101 + 0)
4898 : 60 __ __ RTS
.s101:
4899 : fe 7e 86 INC $867e,x ; (modplay.channel[0].smp_start + 2)
489c : f0 01 __ BEQ $489f ; (fx_row.s100 + 0)
489e : 60 __ __ RTS
.s100:
489f : fe 7f 86 INC $867f,x ; (modplay.channel[0].smp_start + 3)
48a2 : 60 __ __ RTS
.s59:
48a3 : a9 01 __ LDA #$01
48a5 : 8d 0a 84 STA $840a ; (modplay.skip_row_advance + 0)
48a8 : a5 1c __ LDA ACCU + 1 
48aa : 8d 0b 84 STA $840b ; (modplay.next_order + 0)
48ad : 4c cf 46 JMP $46cf ; (fx_row.s97 + 0)
.s71:
48b0 : a5 1b __ LDA ACCU + 0 
48b2 : d0 03 __ BNE $48b7 ; (fx_row.s94 + 0)
.s72:
48b4 : 38 __ __ SEC
48b5 : e5 43 __ SBC T0 + 0 
.s94:
48b7 : 9d 6f 86 STA $866f,x ; (modplay.channel[0].volslide + 0)
48ba : 60 __ __ RTS
.s73:
48bb : a9 40 __ LDA #$40
48bd : c5 1c __ CMP ACCU + 1 
48bf : b0 03 __ BCS $48c4 ; (fx_row.s29 + 0)
48c1 : 4c 2e 47 JMP $472e ; (fx_row.s95 + 0)
.s29:
48c4 : a5 1c __ LDA ACCU + 1 
48c6 : 4c 2e 47 JMP $472e ; (fx_row.s95 + 0)
.s74:
48c9 : c9 04 __ CMP #$04
48cb : f0 41 __ BEQ $490e ; (fx_row.s89 + 0)
.s75:
48cd : 90 23 __ BCC $48f2 ; (fx_row.s83 + 0)
.s76:
48cf : c9 06 __ CMP #$06
48d1 : f0 dd __ BEQ $48b0 ; (fx_row.s71 + 0)
.s77:
48d3 : b0 07 __ BCS $48dc ; (fx_row.s78 + 0)
.s82:
48d5 : a9 00 __ LDA #$00
48d7 : 9d 7a 86 STA $867a,x ; (modplay.channel[0].needs_start + 0)
48da : 90 d4 __ BCC $48b0 ; (fx_row.s71 + 0)
.s78:
48dc : bd 5f 86 LDA $865f,x ; (modplay.channel[0].volume + 0)
48df : 9d 6e 86 STA $866e,x ; (modplay.channel[0].trm_basvol + 0)
48e2 : a5 43 __ LDA T0 + 0 
48e4 : f0 03 __ BEQ $48e9 ; (fx_row.s79 + 0)
.s81:
48e6 : 9d 6c 86 STA $866c,x ; (modplay.channel[0].trm_depth + 0)
.s79:
48e9 : a5 1b __ LDA ACCU + 0 
48eb : d0 01 __ BNE $48ee ; (fx_row.s80 + 0)
48ed : 60 __ __ RTS
.s80:
48ee : 9d 6d 86 STA $866d,x ; (modplay.channel[0].trm_speed + 0)
48f1 : 60 __ __ RTS
.s83:
48f2 : a8 __ __ TAY
48f3 : d0 04 __ BNE $48f9 ; (fx_row.s84 + 0)
.s88:
48f5 : 9d 70 86 STA $8670,x ; (modplay.channel[0].arp_counter + 0)
48f8 : 60 __ __ RTS
.s84:
48f9 : a9 02 __ LDA #$02
48fb : dd 61 86 CMP $8661,x ; (modplay.channel[0].effect + 0)
48fe : b0 05 __ BCS $4905 ; (fx_row.s87 + 0)
.s85:
4900 : a9 00 __ LDA #$00
4902 : 9d 7a 86 STA $867a,x ; (modplay.channel[0].needs_start + 0)
.s87:
4905 : a5 1c __ LDA ACCU + 1 
4907 : d0 01 __ BNE $490a ; (fx_row.s86 + 0)
4909 : 60 __ __ RTS
.s86:
490a : 9d 65 86 STA $8665,x ; (modplay.channel[0].porta_speed + 0)
490d : 60 __ __ RTS
.s89:
490e : a5 43 __ LDA T0 + 0 
4910 : f0 03 __ BEQ $4915 ; (fx_row.s90 + 0)
.s92:
4912 : 9d 68 86 STA $8668,x ; (modplay.channel[0].vib_depth + 0)
.s90:
4915 : a5 1b __ LDA ACCU + 0 
4917 : d0 01 __ BNE $491a ; (fx_row.s91 + 0)
4919 : 60 __ __ RTS
.s91:
491a : 9d 69 86 STA $8669,x ; (modplay.channel[0].vib_speed + 0)
491d : 60 __ __ RTS
--------------------------------------------------------------------
clamp_period: ; clamp_period(u16)->u16
; 144, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
491e : a5 0e __ LDA P1 ; (p + 1)
4920 : d0 0f __ BNE $4931 ; (clamp_period.s5 + 0)
.s11:
4922 : a5 0d __ LDA P0 ; (p + 0)
4924 : c9 71 __ CMP #$71
4926 : b0 09 __ BCS $4931 ; (clamp_period.s5 + 0)
.s10:
4928 : a9 00 __ LDA #$00
492a : a0 71 __ LDY #$71
.s3:
492c : 84 1b __ STY ACCU + 0 
492e : 85 1c __ STA ACCU + 1 
4930 : 60 __ __ RTS
.s5:
4931 : a9 03 __ LDA #$03
4933 : c5 0e __ CMP P1 ; (p + 1)
4935 : f0 04 __ BEQ $493b ; (clamp_period.s8 + 0)
.s9:
4937 : 90 08 __ BCC $4941 ; (clamp_period.s7 + 0)
4939 : b0 0c __ BCS $4947 ; (clamp_period.s6 + 0)
.s8:
493b : a5 0d __ LDA P0 ; (p + 0)
493d : c9 59 __ CMP #$59
493f : 90 06 __ BCC $4947 ; (clamp_period.s6 + 0)
.s7:
4941 : a9 03 __ LDA #$03
4943 : a0 58 __ LDY #$58
4945 : d0 e5 __ BNE $492c ; (clamp_period.s3 + 0)
.s6:
4947 : a5 0e __ LDA P1 ; (p + 1)
4949 : a4 0d __ LDY P0 ; (p + 0)
494b : 4c 2c 49 JMP $492c ; (clamp_period.s3 + 0)
--------------------------------------------------------------------
clamp_vol: ; clamp_vol(i8)->u8
; 132, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
494e : 85 1b __ STA ACCU + 0 
4950 : aa __ __ TAX
4951 : 10 03 __ BPL $4956 ; (clamp_vol.s5 + 0)
.s7:
4953 : a9 00 __ LDA #$00
.s3:
4955 : 60 __ __ RTS
.s5:
4956 : a9 40 __ LDA #$40
4958 : c5 1b __ CMP ACCU + 0 
495a : 90 f9 __ BCC $4955 ; (clamp_vol.s3 + 0)
.s6:
495c : a5 1b __ LDA ACCU + 0 
495e : 60 __ __ RTS
--------------------------------------------------------------------
fx_tick: ; fx_tick(u8)->void
; 433, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
495f : a4 0f __ LDY P2 ; (ch_idx + 0)
4961 : be 76 73 LDX $7376,y ; (__multab50L + 0)
4964 : 86 45 __ STX T3 + 0 
4966 : bd 61 86 LDA $8661,x ; (modplay.channel[0].effect + 0)
4969 : c9 05 __ CMP #$05
496b : d0 05 __ BNE $4972 ; (fx_tick.s6 + 0)
.s5:
496d : a0 01 __ LDY #$01
496f : 4c d4 4a JMP $4ad4 ; (fx_tick.s34 + 0)
.s6:
4972 : 85 47 __ STA T5 + 0 
4974 : c9 05 __ CMP #$05
4976 : b0 03 __ BCS $497b ; (fx_tick.s7 + 0)
4978 : 4c b1 4a JMP $4ab1 ; (fx_tick.s31 + 0)
.s7:
497b : c9 0a __ CMP #$0a
497d : d0 03 __ BNE $4982 ; (fx_tick.s8 + 0)
497f : 4c a2 4a JMP $4aa2 ; (fx_tick.s29 + 0)
.s8:
4982 : 90 4d __ BCC $49d1 ; (fx_tick.s20 + 0)
.s9:
4984 : c9 0e __ CMP #$0e
4986 : d0 21 __ BNE $49a9 ; (fx_tick.s3 + 0)
.s10:
4988 : bd 62 86 LDA $8662,x ; (modplay.channel[0].eparam + 0)
498b : 4a __ __ LSR
498c : 4a __ __ LSR
498d : 4a __ __ LSR
498e : 4a __ __ LSR
498f : c9 0c __ CMP #$0c
4991 : f0 2d __ BEQ $49c0 ; (fx_tick.s18 + 0)
.s11:
4993 : 90 15 __ BCC $49aa ; (fx_tick.s15 + 0)
.s12:
4995 : c9 0d __ CMP #$0d
4997 : d0 10 __ BNE $49a9 ; (fx_tick.s3 + 0)
.s13:
4999 : fe 75 86 INC $8675,x ; (modplay.channel[0].tick_cur + 0)
499c : bd 75 86 LDA $8675,x ; (modplay.channel[0].tick_cur + 0)
499f : dd 74 86 CMP $8674,x ; (modplay.channel[0].tick_stop + 0)
49a2 : d0 05 __ BNE $49a9 ; (fx_tick.s3 + 0)
.s14:
49a4 : a9 01 __ LDA #$01
49a6 : 9d 7a 86 STA $867a,x ; (modplay.channel[0].needs_start + 0)
.s3:
49a9 : 60 __ __ RTS
.s15:
49aa : c9 09 __ CMP #$09
49ac : d0 fb __ BNE $49a9 ; (fx_tick.s3 + 0)
.s16:
49ae : fe 75 86 INC $8675,x ; (modplay.channel[0].tick_cur + 0)
49b1 : bd 75 86 LDA $8675,x ; (modplay.channel[0].tick_cur + 0)
49b4 : dd 74 86 CMP $8674,x ; (modplay.channel[0].tick_stop + 0)
49b7 : 90 f0 __ BCC $49a9 ; (fx_tick.s3 + 0)
.s17:
49b9 : a9 00 __ LDA #$00
49bb : 9d 75 86 STA $8675,x ; (modplay.channel[0].tick_cur + 0)
49be : b0 e4 __ BCS $49a4 ; (fx_tick.s14 + 0)
.s18:
49c0 : fe 75 86 INC $8675,x ; (modplay.channel[0].tick_cur + 0)
49c3 : bd 75 86 LDA $8675,x ; (modplay.channel[0].tick_cur + 0)
49c6 : dd 74 86 CMP $8674,x ; (modplay.channel[0].tick_stop + 0)
49c9 : 90 de __ BCC $49a9 ; (fx_tick.s3 + 0)
.s19:
49cb : a9 00 __ LDA #$00
.s60:
49cd : 9d 5f 86 STA $865f,x ; (modplay.channel[0].volume + 0)
49d0 : 60 __ __ RTS
.s20:
49d1 : c9 06 __ CMP #$06
49d3 : f0 58 __ BEQ $4a2d ; (fx_tick.s26 + 0)
.s21:
49d5 : c9 07 __ CMP #$07
49d7 : d0 d0 __ BNE $49a9 ; (fx_tick.s3 + 0)
.s22:
49d9 : bd 6a 86 LDA $866a,x ; (modplay.channel[0].trm_wave + 0)
49dc : 85 0d __ STA P0 
49de : bd 6b 86 LDA $866b,x ; (modplay.channel[0].trm_pos + 0)
49e1 : 85 0e __ STA P1 
49e3 : 20 b5 4b JSR $4bb5 ; (wave_value.s4 + 0)
49e6 : aa __ __ TAX
49e7 : a4 45 __ LDY T3 + 0 
49e9 : b9 6c 86 LDA $866c,y ; (modplay.channel[0].trm_depth + 0)
49ec : 85 1b __ STA ACCU + 0 
49ee : a9 00 __ LDA #$00
49f0 : 85 1c __ STA ACCU + 1 
49f2 : 8a __ __ TXA
49f3 : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
49f6 : a5 1c __ LDA ACCU + 1 
49f8 : 85 43 __ STA T0 + 0 
49fa : a5 1b __ LDA ACCU + 0 
49fc : 0a __ __ ASL
49fd : 26 43 __ ROL T0 + 0 
49ff : 0a __ __ ASL
4a00 : 26 43 __ ROL T0 + 0 
4a02 : a5 0e __ LDA P1 
4a04 : a4 45 __ LDY T3 + 0 
4a06 : 29 10 __ AND #$10
4a08 : d0 09 __ BNE $4a13 ; (fx_tick.s25 + 0)
.s23:
4a0a : 18 __ __ CLC
4a0b : a5 43 __ LDA T0 + 0 
4a0d : 79 6e 86 ADC $866e,y ; (modplay.channel[0].trm_basvol + 0)
4a10 : 4c 19 4a JMP $4a19 ; (fx_tick.s24 + 0)
.s25:
4a13 : b9 6e 86 LDA $866e,y ; (modplay.channel[0].trm_basvol + 0)
4a16 : 38 __ __ SEC
4a17 : e5 43 __ SBC T0 + 0 
.s24:
4a19 : 20 4e 49 JSR $494e ; (clamp_vol.s4 + 0)
4a1c : a6 45 __ LDX T3 + 0 
4a1e : 9d 5f 86 STA $865f,x ; (modplay.channel[0].volume + 0)
4a21 : bd 6d 86 LDA $866d,x ; (modplay.channel[0].trm_speed + 0)
4a24 : 18 __ __ CLC
4a25 : 65 0e __ ADC P1 
4a27 : 29 3f __ AND #$3f
4a29 : 9d 6b 86 STA $866b,x ; (modplay.channel[0].trm_pos + 0)
4a2c : 60 __ __ RTS
.s26:
4a2d : bd 66 86 LDA $8666,x ; (modplay.channel[0].vib_wave + 0)
4a30 : 85 0d __ STA P0 
4a32 : bd 67 86 LDA $8667,x ; (modplay.channel[0].vib_pos + 0)
4a35 : 85 0e __ STA P1 
4a37 : 20 b5 4b JSR $4bb5 ; (wave_value.s4 + 0)
4a3a : aa __ __ TAX
4a3b : a4 45 __ LDY T3 + 0 
4a3d : b9 68 86 LDA $8668,y ; (modplay.channel[0].vib_depth + 0)
4a40 : 85 1b __ STA ACCU + 0 
4a42 : a9 00 __ LDA #$00
4a44 : 85 1c __ STA ACCU + 1 
4a46 : 8a __ __ TXA
4a47 : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
4a4a : a5 1c __ LDA ACCU + 1 
4a4c : 06 1b __ ASL ACCU + 0 
4a4e : 2a __ __ ROL
4a4f : 85 43 __ STA T0 + 0 
4a51 : a9 00 __ LDA #$00
4a53 : 2a __ __ ROL
4a54 : 85 44 __ STA T0 + 1 
4a56 : a5 0e __ LDA P1 
4a58 : 85 46 __ STA T4 + 0 
4a5a : a4 45 __ LDY T3 + 0 
4a5c : 29 10 __ AND #$10
4a5e : d0 0f __ BNE $4a6f ; (fx_tick.s30 + 0)
.s27:
4a60 : b9 5b 86 LDA $865b,y ; (modplay.channel[0].period + 0)
4a63 : 65 43 __ ADC T0 + 0 
4a65 : 85 0d __ STA P0 
4a67 : b9 5c 86 LDA $865c,y ; (modplay.channel[0].period + 1)
4a6a : 65 44 __ ADC T0 + 1 
4a6c : 4c 7c 4a JMP $4a7c ; (fx_tick.s28 + 0)
.s30:
4a6f : b9 5b 86 LDA $865b,y ; (modplay.channel[0].period + 0)
4a72 : 38 __ __ SEC
4a73 : e5 43 __ SBC T0 + 0 
4a75 : 85 0d __ STA P0 
4a77 : b9 5c 86 LDA $865c,y ; (modplay.channel[0].period + 1)
4a7a : e5 44 __ SBC T0 + 1 
.s28:
4a7c : 85 0e __ STA P1 
4a7e : 20 1e 49 JSR $491e ; (clamp_period.s4 + 0)
4a81 : 20 11 46 JSR $4611 ; (period_to_rate@proxy + 0)
4a84 : a5 1b __ LDA ACCU + 0 
4a86 : a6 45 __ LDX T3 + 0 
4a88 : 9d 5d 86 STA $865d,x ; (modplay.channel[0].rate + 0)
4a8b : a5 1c __ LDA ACCU + 1 
4a8d : 9d 5e 86 STA $865e,x ; (modplay.channel[0].rate + 1)
4a90 : bd 69 86 LDA $8669,x ; (modplay.channel[0].vib_speed + 0)
4a93 : 18 __ __ CLC
4a94 : 65 46 __ ADC T4 + 0 
4a96 : 29 3f __ AND #$3f
4a98 : 9d 67 86 STA $8667,x ; (modplay.channel[0].vib_pos + 0)
4a9b : a5 47 __ LDA T5 + 0 
4a9d : c9 06 __ CMP #$06
4a9f : f0 01 __ BEQ $4aa2 ; (fx_tick.s29 + 0)
4aa1 : 60 __ __ RTS
.s29:
4aa2 : bd 5f 86 LDA $865f,x ; (modplay.channel[0].volume + 0)
4aa5 : 18 __ __ CLC
4aa6 : 7d 6f 86 ADC $866f,x ; (modplay.channel[0].volslide + 0)
4aa9 : 20 4e 49 JSR $494e ; (clamp_vol.s4 + 0)
4aac : a6 45 __ LDX T3 + 0 
4aae : 4c cd 49 JMP $49cd ; (fx_tick.s60 + 0)
.s31:
4ab1 : c9 02 __ CMP #$02
4ab3 : d0 11 __ BNE $4ac6 ; (fx_tick.s32 + 0)
.s59:
4ab5 : bd 65 86 LDA $8665,x ; (modplay.channel[0].porta_speed + 0)
4ab8 : 18 __ __ CLC
4ab9 : 7d 5b 86 ADC $865b,x ; (modplay.channel[0].period + 0)
4abc : 85 0d __ STA P0 
4abe : bd 5c 86 LDA $865c,x ; (modplay.channel[0].period + 1)
4ac1 : 69 00 __ ADC #$00
4ac3 : 4c 90 4b JMP $4b90 ; (fx_tick.s57 + 0)
.s32:
4ac6 : b0 03 __ BCS $4acb ; (fx_tick.s33 + 0)
4ac8 : 4c 62 4b JMP $4b62 ; (fx_tick.s51 + 0)
.s33:
4acb : a0 00 __ LDY #$00
4acd : c9 03 __ CMP #$03
4acf : f0 03 __ BEQ $4ad4 ; (fx_tick.s34 + 0)
4ad1 : 4c 2d 4a JMP $4a2d ; (fx_tick.s26 + 0)
.s34:
4ad4 : bd 63 86 LDA $8663,x ; (modplay.channel[0].porta_target + 0)
4ad7 : 85 43 __ STA T0 + 0 
4ad9 : bd 64 86 LDA $8664,x ; (modplay.channel[0].porta_target + 1)
4adc : 85 44 __ STA T0 + 1 
4ade : 05 43 __ ORA T0 + 0 
4ae0 : f0 58 __ BEQ $4b3a ; (fx_tick.s35 + 0)
.s36:
4ae2 : bd 5e 86 LDA $865e,x ; (modplay.channel[0].rate + 1)
4ae5 : 85 1c __ STA ACCU + 1 
4ae7 : c5 44 __ CMP T0 + 1 
4ae9 : d0 09 __ BNE $4af4 ; (fx_tick.s37 + 0)
.s50:
4aeb : a5 43 __ LDA T0 + 0 
4aed : dd 5d 86 CMP $865d,x ; (modplay.channel[0].rate + 0)
4af0 : f0 48 __ BEQ $4b3a ; (fx_tick.s35 + 0)
.s61:
4af2 : a5 1c __ LDA ACCU + 1 
.s37:
4af4 : c5 44 __ CMP T0 + 1 
4af6 : d0 05 __ BNE $4afd ; (fx_tick.s49 + 0)
.s48:
4af8 : bd 5d 86 LDA $865d,x ; (modplay.channel[0].rate + 0)
4afb : c5 43 __ CMP T0 + 0 
.s49:
4afd : 90 42 __ BCC $4b41 ; (fx_tick.s45 + 0)
.s38:
4aff : a5 1c __ LDA ACCU + 1 
4b01 : d0 11 __ BNE $4b14 ; (fx_tick.s43 + 0)
.s44:
4b03 : bd 65 86 LDA $8665,x ; (modplay.channel[0].porta_speed + 0)
4b06 : dd 5d 86 CMP $865d,x ; (modplay.channel[0].rate + 0)
4b09 : 90 09 __ BCC $4b14 ; (fx_tick.s43 + 0)
.s39:
4b0b : a5 43 __ LDA T0 + 0 
4b0d : 9d 5d 86 STA $865d,x ; (modplay.channel[0].rate + 0)
4b10 : a5 44 __ LDA T0 + 1 
4b12 : b0 0e __ BCS $4b22 ; (fx_tick.s40 + 0)
.s43:
4b14 : bd 5d 86 LDA $865d,x ; (modplay.channel[0].rate + 0)
4b17 : 38 __ __ SEC
4b18 : fd 65 86 SBC $8665,x ; (modplay.channel[0].porta_speed + 0)
4b1b : 9d 5d 86 STA $865d,x ; (modplay.channel[0].rate + 0)
4b1e : a5 1c __ LDA ACCU + 1 
4b20 : e9 00 __ SBC #$00
.s40:
4b22 : 9d 5e 86 STA $865e,x ; (modplay.channel[0].rate + 1)
4b25 : c5 44 __ CMP T0 + 1 
4b27 : d0 05 __ BNE $4b2e ; (fx_tick.s47 + 0)
.s42:
4b29 : bd 5d 86 LDA $865d,x ; (modplay.channel[0].rate + 0)
4b2c : c5 43 __ CMP T0 + 0 
.s47:
4b2e : b0 0a __ BCS $4b3a ; (fx_tick.s35 + 0)
.s41:
4b30 : a5 43 __ LDA T0 + 0 
4b32 : 9d 5d 86 STA $865d,x ; (modplay.channel[0].rate + 0)
4b35 : a5 44 __ LDA T0 + 1 
4b37 : 9d 5e 86 STA $865e,x ; (modplay.channel[0].rate + 1)
.s35:
4b3a : 98 __ __ TYA
4b3b : f0 03 __ BEQ $4b40 ; (fx_tick.s35 + 6)
4b3d : 4c a2 4a JMP $4aa2 ; (fx_tick.s29 + 0)
4b40 : 60 __ __ RTS
.s45:
4b41 : bd 65 86 LDA $8665,x ; (modplay.channel[0].porta_speed + 0)
4b44 : 7d 5d 86 ADC $865d,x ; (modplay.channel[0].rate + 0)
4b47 : 85 1b __ STA ACCU + 0 
4b49 : 9d 5d 86 STA $865d,x ; (modplay.channel[0].rate + 0)
4b4c : a5 1c __ LDA ACCU + 1 
4b4e : 69 00 __ ADC #$00
4b50 : 85 1c __ STA ACCU + 1 
4b52 : 9d 5e 86 STA $865e,x ; (modplay.channel[0].rate + 1)
4b55 : a5 44 __ LDA T0 + 1 
4b57 : c5 1c __ CMP ACCU + 1 
4b59 : d0 d3 __ BNE $4b2e ; (fx_tick.s47 + 0)
.s46:
4b5b : a5 43 __ LDA T0 + 0 
4b5d : c5 1b __ CMP ACCU + 0 
4b5f : 4c 2e 4b JMP $4b2e ; (fx_tick.s47 + 0)
.s51:
4b62 : a8 __ __ TAY
4b63 : d0 10 __ BNE $4b75 ; (fx_tick.s55 + 0)
.s52:
4b65 : bd 62 86 LDA $8662,x ; (modplay.channel[0].eparam + 0)
4b68 : d0 01 __ BNE $4b6b ; (fx_tick.s53 + 0)
4b6a : 60 __ __ RTS
.s53:
4b6b : bd 5a 86 LDA $865a,x ; (modplay.channel[0].sample_num + 0)
4b6e : d0 01 __ BNE $4b71 ; (fx_tick.s54 + 0)
4b70 : 60 __ __ RTS
.s54:
4b71 : fe 70 86 INC $8670,x ; (modplay.channel[0].arp_counter + 0)
4b74 : 60 __ __ RTS
.s55:
4b75 : bd 5c 86 LDA $865c,x ; (modplay.channel[0].period + 1)
4b78 : d0 08 __ BNE $4b82 ; (fx_tick.s56 + 0)
.s58:
4b7a : a9 71 __ LDA #$71
4b7c : dd 5b 86 CMP $865b,x ; (modplay.channel[0].period + 0)
4b7f : 90 01 __ BCC $4b82 ; (fx_tick.s56 + 0)
4b81 : 60 __ __ RTS
.s56:
4b82 : bd 5b 86 LDA $865b,x ; (modplay.channel[0].period + 0)
4b85 : 38 __ __ SEC
4b86 : fd 65 86 SBC $8665,x ; (modplay.channel[0].porta_speed + 0)
4b89 : 85 0d __ STA P0 
4b8b : bd 5c 86 LDA $865c,x ; (modplay.channel[0].period + 1)
4b8e : e9 00 __ SBC #$00
.s57:
4b90 : 85 0e __ STA P1 
4b92 : 20 1e 49 JSR $491e ; (clamp_period.s4 + 0)
4b95 : a5 1b __ LDA ACCU + 0 
4b97 : 85 0d __ STA P0 
4b99 : a6 45 __ LDX T3 + 0 
4b9b : 9d 5b 86 STA $865b,x ; (modplay.channel[0].period + 0)
4b9e : a5 1c __ LDA ACCU + 1 
4ba0 : 85 0e __ STA P1 
4ba2 : 9d 5c 86 STA $865c,x ; (modplay.channel[0].period + 1)
4ba5 : 20 19 46 JSR $4619 ; (period_to_rate.s4 + 0)
4ba8 : a5 1b __ LDA ACCU + 0 
4baa : a6 45 __ LDX T3 + 0 
4bac : 9d 5d 86 STA $865d,x ; (modplay.channel[0].rate + 0)
4baf : a5 1c __ LDA ACCU + 1 
4bb1 : 9d 5e 86 STA $865e,x ; (modplay.channel[0].rate + 1)
4bb4 : 60 __ __ RTS
--------------------------------------------------------------------
wave_value: ; wave_value(u8,u8)->u8
; 156, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s4:
4bb5 : a5 0e __ LDA P1 ; (pos + 0)
4bb7 : 29 1f __ AND #$1f
4bb9 : a8 __ __ TAY
4bba : a5 0d __ LDA P0 ; (wave + 0)
4bbc : 29 03 __ AND #$03
4bbe : c9 01 __ CMP #$01
4bc0 : d0 07 __ BNE $4bc9 ; (wave_value.s5 + 0)
.s10:
4bc2 : 98 __ __ TYA
4bc3 : 0a __ __ ASL
4bc4 : 0a __ __ ASL
4bc5 : 0a __ __ ASL
4bc6 : 49 ff __ EOR #$ff
.s3:
4bc8 : 60 __ __ RTS
.s5:
4bc9 : aa __ __ TAX
4bca : d0 04 __ BNE $4bd0 ; (wave_value.s6 + 0)
.s9:
4bcc : b9 40 78 LDA $7840,y ; (vib_sine[0] + 0)
4bcf : 60 __ __ RTS
.s6:
4bd0 : c9 02 __ CMP #$02
4bd2 : d0 03 __ BNE $4bd7 ; (wave_value.s7 + 0)
.s8:
4bd4 : a9 ff __ LDA #$ff
4bd6 : 60 __ __ RTS
.s7:
4bd7 : 98 __ __ TYA
4bd8 : 0a __ __ ASL
4bd9 : 0a __ __ ASL
4bda : 0a __ __ ASL
4bdb : 60 __ __ RTS
--------------------------------------------------------------------
ua_update_channel: ; ua_update_channel(u8)->void
;  86, "/home/xahmol/git/UltimateDemo2026/include/modplay.c"
.s1:
4bdc : 38 __ __ SEC
4bdd : a5 23 __ LDA SP + 0 
4bdf : e9 0c __ SBC #$0c
4be1 : 85 23 __ STA SP + 0 
4be3 : b0 02 __ BCS $4be7 ; (ua_update_channel.s1 + 11)
4be5 : c6 24 __ DEC SP + 1 
4be7 : a0 03 __ LDY #$03
4be9 : b9 53 00 LDA $0053,y 
4bec : 91 23 __ STA (SP + 0),y 
4bee : 88 __ __ DEY
4bef : 10 f8 __ BPL $4be9 ; (ua_update_channel.s1 + 13)
.s4:
4bf1 : ad 06 84 LDA $8406 ; (modplay.master_volume + 0)
4bf4 : 85 1b __ STA ACCU + 0 
4bf6 : a6 13 __ LDX P6 ; (ch + 0)
4bf8 : 86 47 __ STX T1 + 0 
4bfa : bd 76 73 LDA $7376,x ; (__multab50L + 0)
4bfd : 85 43 __ STA T0 + 0 
4bff : aa __ __ TAX
4c00 : a9 00 __ LDA #$00
4c02 : 85 1c __ STA ACCU + 1 
4c04 : bd 5f 86 LDA $865f,x ; (modplay.channel[0].volume + 0)
4c07 : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
4c0a : a5 1c __ LDA ACCU + 1 
4c0c : 85 50 __ STA T6 + 0 
4c0e : a5 1b __ LDA ACCU + 0 
4c10 : 0a __ __ ASL
4c11 : 26 50 __ ROL T6 + 0 
4c13 : 0a __ __ ASL
4c14 : 26 50 __ ROL T6 + 0 
4c16 : a4 43 __ LDY T0 + 0 
4c18 : b9 7a 86 LDA $867a,y ; (modplay.channel[0].needs_start + 0)
4c1b : d0 5f __ BNE $4c7c ; (ua_update_channel.s10 + 0)
.s5:
4c1d : a5 50 __ LDA T6 + 0 
4c1f : d9 77 86 CMP $8677,y ; (modplay.channel[0].ua_vol + 0)
4c22 : f0 0f __ BEQ $4c33 ; (ua_update_channel.s6 + 0)
.s9:
4c24 : 06 47 __ ASL T1 + 0 
4c26 : a4 47 __ LDY T1 + 0 
4c28 : be b1 74 LDX $74b1,y ; (audio_ch_base[0] + 0)
4c2b : 9d 01 df STA $df01,x 
4c2e : a4 43 __ LDY T0 + 0 
4c30 : 99 77 86 STA $8677,y ; (modplay.channel[0].ua_vol + 0)
.s6:
4c33 : b9 5e 86 LDA $865e,y ; (modplay.channel[0].rate + 1)
4c36 : d9 79 86 CMP $8679,y ; (modplay.channel[0].ua_rate + 1)
4c39 : d0 08 __ BNE $4c43 ; (ua_update_channel.s7 + 0)
.s8:
4c3b : b9 5d 86 LDA $865d,y ; (modplay.channel[0].rate + 0)
4c3e : d9 78 86 CMP $8678,y ; (modplay.channel[0].ua_rate + 0)
4c41 : f0 23 __ BEQ $4c66 ; (ua_update_channel.s3 + 0)
.s7:
4c43 : b9 5d 86 LDA $865d,y ; (modplay.channel[0].rate + 0)
4c46 : 85 0e __ STA P1 
4c48 : a5 13 __ LDA P6 ; (ch + 0)
4c4a : 0a __ __ ASL
4c4b : aa __ __ TAX
4c4c : b9 5e 86 LDA $865e,y ; (modplay.channel[0].rate + 1)
4c4f : 85 0f __ STA P2 
4c51 : bc b1 74 LDY $74b1,x ; (audio_ch_base[0] + 0)
4c54 : 99 0e df STA $df0e,y 
4c57 : a5 0e __ LDA P1 
4c59 : 99 0f df STA $df0f,y 
4c5c : a6 43 __ LDX T0 + 0 
4c5e : 9d 78 86 STA $8678,x ; (modplay.channel[0].ua_rate + 0)
4c61 : a5 0f __ LDA P2 
.s14:
4c63 : 9d 79 86 STA $8679,x ; (modplay.channel[0].ua_rate + 1)
.s3:
4c66 : a0 03 __ LDY #$03
4c68 : b1 23 __ LDA (SP + 0),y 
4c6a : 99 53 00 STA $0053,y 
4c6d : 88 __ __ DEY
4c6e : 10 f8 __ BPL $4c68 ; (ua_update_channel.s3 + 2)
4c70 : 18 __ __ CLC
4c71 : a5 23 __ LDA SP + 0 
4c73 : 69 0c __ ADC #$0c
4c75 : 85 23 __ STA SP + 0 
4c77 : 90 02 __ BCC $4c7b ; (ua_update_channel.s3 + 21)
4c79 : e6 24 __ INC SP + 1 
4c7b : 60 __ __ RTS
.s10:
4c7c : 84 51 __ STY T7 + 0 
4c7e : a5 13 __ LDA P6 ; (ch + 0)
4c80 : 85 0d __ STA P0 
4c82 : a9 00 __ LDA #$00
4c84 : 99 7a 86 STA $867a,y ; (modplay.channel[0].needs_start + 0)
4c87 : b9 7c 86 LDA $867c,y ; (modplay.channel[0].smp_start + 0)
4c8a : 85 0e __ STA P1 
4c8c : b9 7d 86 LDA $867d,y ; (modplay.channel[0].smp_start + 1)
4c8f : 85 0f __ STA P2 
4c91 : b9 7e 86 LDA $867e,y ; (modplay.channel[0].smp_start + 2)
4c94 : 85 10 __ STA P3 
4c96 : b9 7f 86 LDA $867f,y ; (modplay.channel[0].smp_start + 3)
4c99 : 85 11 __ STA P4 
4c9b : 06 47 __ ASL T1 + 0 
4c9d : a6 47 __ LDX T1 + 0 
4c9f : bd b1 74 LDA $74b1,x ; (audio_ch_base[0] + 0)
4ca2 : 85 4f __ STA T5 + 0 
4ca4 : 85 53 __ STA T8 + 0 
4ca6 : b9 5d 86 LDA $865d,y ; (modplay.channel[0].rate + 0)
4ca9 : 85 55 __ STA T9 + 0 
4cab : a9 df __ LDA #$df
4cad : 85 54 __ STA T8 + 1 
4caf : b9 5e 86 LDA $865e,y ; (modplay.channel[0].rate + 1)
4cb2 : 85 56 __ STA T9 + 1 
4cb4 : b9 80 86 LDA $8680,y ; (modplay.channel[0].smp_length + 0)
4cb7 : 85 43 __ STA T0 + 0 
4cb9 : b9 81 86 LDA $8681,y ; (modplay.channel[0].smp_length + 1)
4cbc : 85 44 __ STA T0 + 1 
4cbe : b9 82 86 LDA $8682,y ; (modplay.channel[0].smp_length + 2)
4cc1 : 85 45 __ STA T0 + 2 
4cc3 : b9 83 86 LDA $8683,y ; (modplay.channel[0].smp_length + 3)
4cc6 : 85 46 __ STA T0 + 3 
4cc8 : b9 7b 86 LDA $867b,y ; (modplay.channel[0].needs_loop + 0)
4ccb : d0 03 __ BNE $4cd0 ; (ua_update_channel.s13 + 0)
4ccd : 4c 55 4d JMP $4d55 ; (ua_update_channel.s11 + 0)
.s13:
4cd0 : a6 51 __ LDX T7 + 0 
4cd2 : bd 84 86 LDA $8684,x ; (modplay.channel[0].smp_loop_a + 0)
4cd5 : 85 47 __ STA T1 + 0 
4cd7 : bd 85 86 LDA $8685,x ; (modplay.channel[0].smp_loop_a + 1)
4cda : 85 48 __ STA T1 + 1 
4cdc : bd 86 86 LDA $8686,x ; (modplay.channel[0].smp_loop_a + 2)
4cdf : 85 49 __ STA T1 + 2 
4ce1 : bd 87 86 LDA $8687,x ; (modplay.channel[0].smp_loop_a + 3)
4ce4 : 85 4a __ STA T1 + 3 
4ce6 : bd 88 86 LDA $8688,x ; (modplay.channel[0].smp_loop_b + 0)
4ce9 : 85 4b __ STA T2 + 0 
4ceb : bd 89 86 LDA $8689,x ; (modplay.channel[0].smp_loop_b + 1)
4cee : 85 4c __ STA T2 + 1 
4cf0 : bd 8a 86 LDA $868a,x ; (modplay.channel[0].smp_loop_b + 2)
4cf3 : 85 4d __ STA T2 + 2 
4cf5 : bd 8b 86 LDA $868b,x ; (modplay.channel[0].smp_loop_b + 3)
4cf8 : 85 4e __ STA T2 + 3 
4cfa : a9 00 __ LDA #$00
4cfc : a6 4f __ LDX T5 + 0 
4cfe : 9d 00 df STA $df00,x 
4d01 : a5 50 __ LDA T6 + 0 
4d03 : 9d 01 df STA $df01,x 
4d06 : b9 60 86 LDA $8660,y ; (modplay.channel[0].pan + 0)
4d09 : 9d 02 df STA $df02,x 
4d0c : 20 93 4d JSR $4d93 ; (ch_wr_sms.s4 + 0)
4d0f : 20 af 4d JSR $4daf ; (ch_wr_be24@proxy + 0)
4d12 : a5 0d __ LDA P0 
4d14 : 0a __ __ ASL
4d15 : aa __ __ TAX
4d16 : a5 56 __ LDA T9 + 1 
4d18 : bc b1 74 LDY $74b1,x ; (audio_ch_base[0] + 0)
4d1b : 99 0e df STA $df0e,y 
4d1e : a5 55 __ LDA T9 + 0 
4d20 : 99 0f df STA $df0f,y 
4d23 : a5 47 __ LDA T1 + 0 
4d25 : 85 0f __ STA P2 
4d27 : a9 11 __ LDA #$11
4d29 : 85 0e __ STA P1 
4d2b : a5 48 __ LDA T1 + 1 
4d2d : 85 10 __ STA P3 
4d2f : a5 49 __ LDA T1 + 2 
4d31 : 85 11 __ STA P4 
4d33 : a5 4a __ LDA T1 + 3 
4d35 : 85 12 __ STA P5 
4d37 : 20 c3 4d JSR $4dc3 ; (ch_wr_be24.s4 + 0)
4d3a : a5 4b __ LDA T2 + 0 
4d3c : 85 0f __ STA P2 
4d3e : a9 15 __ LDA #$15
4d40 : 85 0e __ STA P1 
4d42 : a5 4c __ LDA T2 + 1 
4d44 : 85 10 __ STA P3 
4d46 : a5 4d __ LDA T2 + 2 
4d48 : 85 11 __ STA P4 
4d4a : a5 4e __ LDA T2 + 3 
4d4c : 85 12 __ STA P5 
4d4e : 20 c3 4d JSR $4dc3 ; (ch_wr_be24.s4 + 0)
4d51 : a9 03 __ LDA #$03
4d53 : d0 29 __ BNE $4d7e ; (ua_update_channel.s12 + 0)
.s11:
4d55 : a6 4f __ LDX T5 + 0 
4d57 : 9d 00 df STA $df00,x 
4d5a : a5 50 __ LDA T6 + 0 
4d5c : 9d 01 df STA $df01,x 
4d5f : b9 60 86 LDA $8660,y ; (modplay.channel[0].pan + 0)
4d62 : 9d 02 df STA $df02,x 
4d65 : 20 93 4d JSR $4d93 ; (ch_wr_sms.s4 + 0)
4d68 : 20 af 4d JSR $4daf ; (ch_wr_be24@proxy + 0)
4d6b : a5 0d __ LDA P0 
4d6d : 0a __ __ ASL
4d6e : aa __ __ TAX
4d6f : a5 56 __ LDA T9 + 1 
4d71 : bc b1 74 LDY $74b1,x ; (audio_ch_base[0] + 0)
4d74 : 99 0e df STA $df0e,y 
4d77 : a5 55 __ LDA T9 + 0 
4d79 : 99 0f df STA $df0f,y 
4d7c : a9 01 __ LDA #$01
.s12:
4d7e : a0 00 __ LDY #$00
4d80 : 91 53 __ STA (T8 + 0),y 
4d82 : a5 50 __ LDA T6 + 0 
4d84 : a6 51 __ LDX T7 + 0 
4d86 : 9d 77 86 STA $8677,x ; (modplay.channel[0].ua_vol + 0)
4d89 : a5 55 __ LDA T9 + 0 
4d8b : 9d 78 86 STA $8678,x ; (modplay.channel[0].ua_rate + 0)
4d8e : a5 56 __ LDA T9 + 1 
4d90 : 4c 63 4c JMP $4c63 ; (ua_update_channel.s14 + 0)
--------------------------------------------------------------------
ch_wr_sms: ; ch_wr_sms(u8,u32)->void
;  40, "/home/xahmol/git/UltimateDemo2026/include/audio.c"
.s4:
4d93 : a5 0d __ LDA P0 ; (ch + 0)
4d95 : 0a __ __ ASL
4d96 : a8 __ __ TAY
4d97 : a9 01 __ LDA #$01
4d99 : be b1 74 LDX $74b1,y ; (audio_ch_base[0] + 0)
4d9c : 9d 04 df STA $df04,x 
4d9f : a5 10 __ LDA P3 ; (addr + 2)
4da1 : 9d 05 df STA $df05,x 
4da4 : a5 0f __ LDA P2 ; (addr + 1)
4da6 : 9d 06 df STA $df06,x 
4da9 : a5 0e __ LDA P1 ; (addr + 0)
4dab : 9d 07 df STA $df07,x 
.s3:
4dae : 60 __ __ RTS
--------------------------------------------------------------------
ch_wr_be24@proxy: ; ch_wr_be24@proxy
4daf : a9 09 __ LDA #$09
4db1 : 85 0e __ STA P1 
4db3 : a5 43 __ LDA $43 
4db5 : 85 0f __ STA P2 
4db7 : a5 44 __ LDA $44 
4db9 : 85 10 __ STA P3 
4dbb : a5 45 __ LDA $45 
4dbd : 85 11 __ STA P4 
4dbf : a5 46 __ LDA $46 
4dc1 : 85 12 __ STA P5 
--------------------------------------------------------------------
ch_wr_be24: ; ch_wr_be24(u8,u8,u32)->void
;  52, "/home/xahmol/git/UltimateDemo2026/include/audio.c"
.s4:
4dc3 : a5 0d __ LDA P0 ; (ch + 0)
4dc5 : 0a __ __ ASL
4dc6 : aa __ __ TAX
4dc7 : bd b1 74 LDA $74b1,x ; (audio_ch_base[0] + 0)
4dca : 65 0e __ ADC P1 ; (offset + 0)
4dcc : 85 1b __ STA ACCU + 0 
4dce : a9 df __ LDA #$df
4dd0 : 85 1c __ STA ACCU + 1 
4dd2 : a5 11 __ LDA P4 ; (val + 2)
4dd4 : a0 00 __ LDY #$00
4dd6 : 91 1b __ STA (ACCU + 0),y 
4dd8 : a5 10 __ LDA P3 ; (val + 1)
4dda : c8 __ __ INY
4ddb : 91 1b __ STA (ACCU + 0),y 
4ddd : a5 0f __ LDA P2 ; (val + 0)
4ddf : c8 __ __ INY
4de0 : 91 1b __ STA (ACCU + 0),y 
.s3:
4de2 : 60 __ __ RTS
--------------------------------------------------------------------
mandel_run: ; mandel_run()->void
;   4, "/home/xahmol/git/UltimateDemo2026/src/mandel.h"
.s4:
4de3 : a9 8f __ LDA #$8f
4de5 : 20 f1 15 JSR $15f1 ; (turbo_set.s4 + 0)
4de8 : a9 35 __ LDA #$35
4dea : 85 01 __ STA $01 
4dec : a9 1f __ LDA #$1f
4dee : 85 12 __ STA P5 
4df0 : a9 40 __ LDA #$40
4df2 : 85 11 __ STA P4 
4df4 : a9 00 __ LDA #$00
4df6 : 85 0f __ STA P2 
4df8 : 85 10 __ STA P3 
4dfa : a2 fa __ LDX #$fa
.l6:
4dfc : ca __ __ DEX
4dfd : 9d 00 c0 STA $c000,x 
4e00 : 9d fa c0 STA $c0fa,x 
4e03 : 9d f4 c1 STA $c1f4,x 
4e06 : 9d ee c2 STA $c2ee,x 
4e09 : d0 f1 __ BNE $4dfc ; (mandel_run.l6 + 0)
.s5:
4e0b : 85 0d __ STA P0 
4e0d : a9 e0 __ LDA #$e0
4e0f : 85 0e __ STA P1 
4e11 : 20 f3 20 JSR $20f3 ; (memset.s4 + 0)
4e14 : a9 04 __ LDA #$04
4e16 : 85 0d __ STA P0 
4e18 : a9 00 __ LDA #$00
4e1a : 85 10 __ STA P3 
4e1c : a9 e0 __ LDA #$e0
4e1e : 85 11 __ STA P4 
4e20 : a9 01 __ LDA #$01
4e22 : a2 fa __ LDX #$fa
.l8:
4e24 : ca __ __ DEX
4e25 : 9d 00 d8 STA $d800,x 
4e28 : 9d fa d8 STA $d8fa,x 
4e2b : 9d f4 d9 STA $d9f4,x 
4e2e : 9d ee da STA $daee,x 
4e31 : d0 f1 __ BNE $4e24 ; (mandel_run.l8 + 0)
.s7:
4e33 : a9 00 __ LDA #$00
4e35 : 85 0e __ STA P1 
4e37 : a9 c0 __ LDA #$c0
4e39 : 85 0f __ STA P2 
4e3b : 20 13 0f JSR $0f13 ; (vic_setmode.s4 + 0)
4e3e : a9 00 __ LDA #$00
4e40 : 8d 21 d0 STA $d021 
4e43 : 8d 20 d0 STA $d020 
4e46 : a9 6a __ LDA #$6a
4e48 : 85 13 __ STA P6 
4e4a : a9 78 __ LDA #$78
4e4c : 85 14 __ STA P7 
4e4e : 20 83 4e JSR $4e83 ; (render.s1 + 0)
4e51 : a9 92 __ LDA #$92
4e53 : 85 0d __ STA P0 
4e55 : a9 78 __ LDA #$78
4e57 : 85 0e __ STA P1 
4e59 : 20 16 51 JSR $5116 ; (colorize_standard.s4 + 0)
4e5c : a9 00 __ LDA #$00
4e5e : 8d 09 dc STA $dc09 
4e61 : 8d 08 dc STA $dc08 
.l9:
4e64 : ad 09 dc LDA $dc09 
4e67 : c9 05 __ CMP #$05
4e69 : 90 f9 __ BCC $4e64 ; (mandel_run.l9 + 0)
.s10:
4e6b : a9 00 __ LDA #$00
4e6d : 85 0d __ STA P0 
4e6f : 85 0e __ STA P1 
4e71 : 85 10 __ STA P3 
4e73 : a9 36 __ LDA #$36
4e75 : 85 01 __ STA $01 
4e77 : 20 0b 0f JSR $0f0b ; (vic_setmode@proxy + 0)
4e7a : a9 00 __ LDA #$00
4e7c : 8d 20 d0 STA $d020 
4e7f : 8d 21 d0 STA $d021 
.s3:
4e82 : 60 __ __ RTS
--------------------------------------------------------------------
render: ; render(const struct S#28942*)->void
; 120, "/home/xahmol/git/UltimateDemo2026/src/mandel.c"
.s1:
4e83 : a2 05 __ LDX #$05
4e85 : b5 53 __ LDA T10 + 0,x 
4e87 : 9d da bf STA $bfda,x ; (render@stack + 0)
4e8a : ca __ __ DEX
4e8b : 10 f8 __ BPL $4e85 ; (render.s1 + 2)
.s4:
4e8d : a9 40 __ LDA #$40
4e8f : 85 11 __ STA P4 
4e91 : a9 1f __ LDA #$1f
4e93 : 85 12 __ STA P5 
4e95 : a9 00 __ LDA #$00
4e97 : 85 0d __ STA P0 
4e99 : a9 e0 __ LDA #$e0
4e9b : 85 0e __ STA P1 
4e9d : a0 06 __ LDY #$06
4e9f : b1 13 __ LDA (P6),y ; (f + 0)
4ea1 : c8 __ __ INY
4ea2 : 11 13 __ ORA (P6),y ; (f + 0)
4ea4 : d0 08 __ BNE $4eae ; (render.s24 + 0)
.s5:
4ea6 : c8 __ __ INY
4ea7 : b1 13 __ LDA (P6),y ; (f + 0)
4ea9 : c8 __ __ INY
4eaa : 11 13 __ ORA (P6),y ; (f + 0)
4eac : f0 02 __ BEQ $4eb0 ; (render.s6 + 0)
.s24:
4eae : a9 01 __ LDA #$01
.s6:
4eb0 : 85 57 __ STA T12 + 0 
4eb2 : a9 00 __ LDA #$00
4eb4 : 85 0f __ STA P2 
4eb6 : 85 10 __ STA P3 
4eb8 : 20 f3 20 JSR $20f3 ; (memset.s4 + 0)
4ebb : a9 00 __ LDA #$00
4ebd : 85 4d __ STA T6 + 0 
.l7:
4ebf : 29 07 __ AND #$07
4ec1 : 85 43 __ STA T0 + 0 
4ec3 : a5 4d __ LDA T6 + 0 
4ec5 : 29 f8 __ AND #$f8
4ec7 : 85 1b __ STA ACCU + 0 
4ec9 : 4a __ __ LSR
4eca : 4a __ __ LSR
4ecb : 65 1b __ ADC ACCU + 0 
4ecd : 4a __ __ LSR
4ece : 6a __ __ ROR
4ecf : 6a __ __ ROR
4ed0 : aa __ __ TAX
4ed1 : 29 c0 __ AND #$c0
4ed3 : 6a __ __ ROR
4ed4 : 05 43 __ ORA T0 + 0 
4ed6 : 85 4e __ STA T7 + 0 
4ed8 : 8a __ __ TXA
4ed9 : 29 1f __ AND #$1f
4edb : 09 e0 __ ORA #$e0
4edd : 85 4f __ STA T7 + 1 
4edf : a0 05 __ LDY #$05
4ee1 : b1 13 __ LDA (P6),y ; (f + 0)
4ee3 : 85 1b __ STA ACCU + 0 
4ee5 : a9 00 __ LDA #$00
4ee7 : 85 52 __ STA T9 + 0 
4ee9 : 85 1c __ STA ACCU + 1 
4eeb : a5 4d __ LDA T6 + 0 
4eed : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
4ef0 : a0 02 __ LDY #$02
4ef2 : b1 13 __ LDA (P6),y ; (f + 0)
4ef4 : 18 __ __ CLC
4ef5 : 65 1b __ ADC ACCU + 0 
4ef7 : 85 50 __ STA T8 + 0 
4ef9 : c8 __ __ INY
4efa : b1 13 __ LDA (P6),y ; (f + 0)
4efc : 65 1c __ ADC ACCU + 1 
4efe : 85 51 __ STA T8 + 1 
.l8:
4f00 : a0 04 __ LDY #$04
4f02 : b1 13 __ LDA (P6),y ; (f + 0)
4f04 : 85 1b __ STA ACCU + 0 
4f06 : a9 00 __ LDA #$00
4f08 : 85 1c __ STA ACCU + 1 
4f0a : a5 52 __ LDA T9 + 0 
4f0c : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
4f0f : a0 00 __ LDY #$00
4f11 : b1 13 __ LDA (P6),y ; (f + 0)
4f13 : 18 __ __ CLC
4f14 : 65 1b __ ADC ACCU + 0 
4f16 : 85 49 __ STA T3 + 0 
4f18 : 85 53 __ STA T10 + 0 
4f1a : c8 __ __ INY
4f1b : b1 13 __ LDA (P6),y ; (f + 0)
4f1d : 65 1c __ ADC ACCU + 1 
4f1f : 85 4a __ STA T3 + 1 
4f21 : 85 54 __ STA T10 + 1 
4f23 : a5 57 __ LDA T12 + 0 
4f25 : d0 11 __ BNE $4f38 ; (render.s23 + 0)
.s9:
4f27 : 85 49 __ STA T3 + 0 
4f29 : 85 4a __ STA T3 + 1 
4f2b : 85 4b __ STA T4 + 0 
4f2d : 85 4c __ STA T4 + 1 
4f2f : a5 50 __ LDA T8 + 0 
4f31 : 85 55 __ STA T11 + 0 
4f33 : a5 51 __ LDA T8 + 1 
4f35 : 4c 53 4f JMP $4f53 ; (render.s10 + 0)
.s23:
4f38 : a5 50 __ LDA T8 + 0 
4f3a : 85 4b __ STA T4 + 0 
4f3c : a5 51 __ LDA T8 + 1 
4f3e : 85 4c __ STA T4 + 1 
4f40 : a0 06 __ LDY #$06
4f42 : b1 13 __ LDA (P6),y ; (f + 0)
4f44 : 85 53 __ STA T10 + 0 
4f46 : c8 __ __ INY
4f47 : b1 13 __ LDA (P6),y ; (f + 0)
4f49 : 85 54 __ STA T10 + 1 
4f4b : c8 __ __ INY
4f4c : b1 13 __ LDA (P6),y ; (f + 0)
4f4e : 85 55 __ STA T11 + 0 
4f50 : c8 __ __ INY
4f51 : b1 13 __ LDA (P6),y ; (f + 0)
.s10:
4f53 : 85 56 __ STA T11 + 1 
4f55 : a9 00 __ LDA #$00
4f57 : 85 58 __ STA T13 + 0 
.l11:
4f59 : a6 49 __ LDX T3 + 0 
4f5b : a5 4a __ LDA T3 + 1 
4f5d : 10 0a __ BPL $4f69 ; (render.s12 + 0)
.s22:
4f5f : 38 __ __ SEC
4f60 : a9 00 __ LDA #$00
4f62 : e5 49 __ SBC T3 + 0 
4f64 : aa __ __ TAX
4f65 : a9 00 __ LDA #$00
4f67 : e5 4a __ SBC T3 + 1 
.s12:
4f69 : 86 0d __ STX P0 
4f6b : 86 0f __ STX P2 
4f6d : 85 0e __ STA P1 
4f6f : 85 10 __ STA P3 
4f71 : 20 7d 50 JSR $507d ; (lmul16u.s4 + 0)
4f74 : a5 1b __ LDA ACCU + 0 
4f76 : 85 45 __ STA T2 + 0 
4f78 : a5 1c __ LDA ACCU + 1 
4f7a : 85 46 __ STA T2 + 1 
4f7c : a5 1d __ LDA ACCU + 2 
4f7e : 85 47 __ STA T2 + 2 
4f80 : a5 1e __ LDA ACCU + 3 
4f82 : 85 48 __ STA T2 + 3 
4f84 : a6 4b __ LDX T4 + 0 
4f86 : a5 4c __ LDA T4 + 1 
4f88 : 10 0a __ BPL $4f94 ; (render.s13 + 0)
.s21:
4f8a : 38 __ __ SEC
4f8b : a9 00 __ LDA #$00
4f8d : e5 4b __ SBC T4 + 0 
4f8f : aa __ __ TAX
4f90 : a9 00 __ LDA #$00
4f92 : e5 4c __ SBC T4 + 1 
.s13:
4f94 : 86 0d __ STX P0 
4f96 : 86 0f __ STX P2 
4f98 : 85 0e __ STA P1 
4f9a : 85 10 __ STA P3 
4f9c : 20 7d 50 JSR $507d ; (lmul16u.s4 + 0)
4f9f : 18 __ __ CLC
4fa0 : a5 1b __ LDA ACCU + 0 
4fa2 : 65 45 __ ADC T2 + 0 
4fa4 : a5 1c __ LDA ACCU + 1 
4fa6 : 65 46 __ ADC T2 + 1 
4fa8 : a5 1d __ LDA ACCU + 2 
4faa : 65 47 __ ADC T2 + 2 
4fac : a5 1e __ LDA ACCU + 3 
4fae : 65 48 __ ADC T2 + 3 
4fb0 : c9 04 __ CMP #$04
4fb2 : 90 1b __ BCC $4fcf ; (render.s14 + 0)
.s20:
4fb4 : a5 58 __ LDA T13 + 0 
4fb6 : 4a __ __ LSR
4fb7 : 4a __ __ LSR
4fb8 : 85 1b __ STA ACCU + 0 
4fba : a9 00 __ LDA #$00
4fbc : 85 1c __ STA ACCU + 1 
4fbe : 85 04 __ STA WORK + 1 
4fc0 : a9 03 __ LDA #$03
4fc2 : 85 03 __ STA WORK + 0 
4fc4 : 20 3b 70 JSR $703b ; (divmod + 0)
4fc7 : 18 __ __ CLC
4fc8 : a5 05 __ LDA WORK + 2 
4fca : 69 01 __ ADC #$01
4fcc : 4c 2e 50 JMP $502e ; (render.s18 + 0)
.s14:
4fcf : a5 49 __ LDA T3 + 0 
4fd1 : 85 0d __ STA P0 
4fd3 : a5 4a __ LDA T3 + 1 
4fd5 : 85 0e __ STA P1 
4fd7 : a5 4b __ LDA T4 + 0 
4fd9 : 85 0f __ STA P2 
4fdb : a5 4c __ LDA T4 + 1 
4fdd : 85 10 __ STA P3 
4fdf : 38 __ __ SEC
4fe0 : a5 45 __ LDA T2 + 0 
4fe2 : e5 1b __ SBC ACCU + 0 
4fe4 : a5 46 __ LDA T2 + 1 
4fe6 : e5 1c __ SBC ACCU + 1 
4fe8 : 85 43 __ STA T0 + 0 
4fea : a5 47 __ LDA T2 + 2 
4fec : e5 1d __ SBC ACCU + 2 
4fee : 85 44 __ STA T0 + 1 
4ff0 : a5 48 __ LDA T2 + 3 
4ff2 : e5 1e __ SBC ACCU + 3 
4ff4 : a2 04 __ LDX #$04
.l15:
4ff6 : 4a __ __ LSR
4ff7 : 66 44 __ ROR T0 + 1 
4ff9 : 66 43 __ ROR T0 + 0 
4ffb : ca __ __ DEX
4ffc : d0 f8 __ BNE $4ff6 ; (render.l15 + 0)
.s16:
4ffe : 18 __ __ CLC
4fff : a5 43 __ LDA T0 + 0 
5001 : 65 53 __ ADC T10 + 0 
5003 : 85 49 __ STA T3 + 0 
5005 : a5 44 __ LDA T0 + 1 
5007 : 65 54 __ ADC T10 + 1 
5009 : 85 4a __ STA T3 + 1 
500b : 20 a4 50 JSR $50a4 ; (lmul4f12s.s4 + 0)
500e : a5 1b __ LDA ACCU + 0 
5010 : 0a __ __ ASL
5011 : a8 __ __ TAY
5012 : a5 1c __ LDA ACCU + 1 
5014 : 2a __ __ ROL
5015 : aa __ __ TAX
5016 : 98 __ __ TYA
5017 : 18 __ __ CLC
5018 : 65 55 __ ADC T11 + 0 
501a : 85 4b __ STA T4 + 0 
501c : 8a __ __ TXA
501d : 65 56 __ ADC T11 + 1 
501f : 85 4c __ STA T4 + 1 
5021 : e6 58 __ INC T13 + 0 
5023 : a5 58 __ LDA T13 + 0 
5025 : c9 20 __ CMP #$20
5027 : b0 03 __ BCS $502c ; (render.s17 + 0)
5029 : 4c 59 4f JMP $4f59 ; (render.l11 + 0)
.s17:
502c : a9 00 __ LDA #$00
.s18:
502e : aa __ __ TAX
502f : a5 52 __ LDA T9 + 0 
5031 : 29 03 __ AND #$03
5033 : 0a __ __ ASL
5034 : a8 __ __ TAY
5035 : b9 87 73 LDA $7387,y ; (__shrtab192L + 0)
5038 : 85 1b __ STA ACCU + 0 
503a : 49 ff __ EOR #$ff
503c : 85 45 __ STA T2 + 0 
503e : a5 52 __ LDA T9 + 0 
5040 : 29 fc __ AND #$fc
5042 : 0a __ __ ASL
5043 : 85 49 __ STA T3 + 0 
5045 : a5 4f __ LDA T7 + 1 
5047 : 69 00 __ ADC #$00
5049 : 85 4a __ STA T3 + 1 
504b : a4 4e __ LDY T7 + 0 
504d : b1 49 __ LDA (T3 + 0),y 
504f : 25 45 __ AND T2 + 0 
5051 : 85 45 __ STA T2 + 0 
5053 : bd e2 77 LDA $77e2,x ; (cbytes[0] + 0)
5056 : 25 1b __ AND ACCU + 0 
5058 : 05 45 __ ORA T2 + 0 
505a : 91 49 __ STA (T3 + 0),y 
505c : e6 52 __ INC T9 + 0 
505e : a5 52 __ LDA T9 + 0 
5060 : c9 a0 __ CMP #$a0
5062 : b0 03 __ BCS $5067 ; (render.s19 + 0)
5064 : 4c 00 4f JMP $4f00 ; (render.l8 + 0)
.s19:
5067 : e6 4d __ INC T6 + 0 
5069 : a5 4d __ LDA T6 + 0 
506b : c9 c8 __ CMP #$c8
506d : b0 03 __ BCS $5072 ; (render.s3 + 0)
506f : 4c bf 4e JMP $4ebf ; (render.l7 + 0)
.s3:
5072 : a2 05 __ LDX #$05
5074 : bd da bf LDA $bfda,x ; (render@stack + 0)
5077 : 95 53 __ STA T10 + 0,x 
5079 : ca __ __ DEX
507a : 10 f8 __ BPL $5074 ; (render.s3 + 2)
507c : 60 __ __ RTS
--------------------------------------------------------------------
lmul16u: ; lmul16u(u16,u16)->u32
;   5, "/home/xahmol/oscar64/include/fixmath.h"
.s4:
507d : a9 00 __ LDA #$00
507f : 85 1d __ STA ACCU + 2 
5081 : 85 1e __ STA ACCU + 3 
5083 : a2 10 __ LDX #$10
5085 : 46 0e __ LSR P1 
5087 : 66 0d __ ROR P0 
5089 : 90 0d __ BCC $5098 ; (lmul16u.s4 + 27)
508b : 18 __ __ CLC
508c : a5 1d __ LDA ACCU + 2 
508e : 65 0f __ ADC P2 
5090 : 85 1d __ STA ACCU + 2 
5092 : a5 1e __ LDA ACCU + 3 
5094 : 65 10 __ ADC P3 
5096 : 85 1e __ STA ACCU + 3 
5098 : 66 1e __ ROR ACCU + 3 
509a : 66 1d __ ROR ACCU + 2 
509c : 66 1c __ ROR ACCU + 1 
509e : 66 1b __ ROR ACCU + 0 
50a0 : ca __ __ DEX
50a1 : d0 e2 __ BNE $5085 ; (lmul16u.s4 + 8)
.s3:
50a3 : 60 __ __ RTS
--------------------------------------------------------------------
lmul4f12s: ; lmul4f12s(i16,i16)->i16
;  18, "/home/xahmol/oscar64/include/fixmath.h"
.s4:
50a4 : 38 __ __ SEC
50a5 : a5 0d __ LDA P0 
50a7 : 6a __ __ ROR
50a8 : 85 1b __ STA ACCU + 0 
50aa : a9 00 __ LDA #$00
50ac : 85 1c __ STA ACCU + 1 
50ae : 90 0b __ BCC $50bb ; (lmul4f12s.s4 + 23)
50b0 : a8 __ __ TAY
50b1 : 18 __ __ CLC
50b2 : a5 1c __ LDA ACCU + 1 
50b4 : 65 0f __ ADC P2 
50b6 : 85 1c __ STA ACCU + 1 
50b8 : 98 __ __ TYA
50b9 : 65 10 __ ADC P3 
50bb : 6a __ __ ROR
50bc : 66 1c __ ROR ACCU + 1 
50be : 46 1b __ LSR ACCU + 0 
50c0 : 90 f9 __ BCC $50bb ; (lmul4f12s.s4 + 23)
50c2 : d0 ec __ BNE $50b0 ; (lmul4f12s.s4 + 12)
50c4 : a6 0e __ LDX P1 
50c6 : 86 1b __ STX ACCU + 0 
50c8 : a2 07 __ LDX #$07
50ca : 46 1b __ LSR ACCU + 0 
50cc : 90 0b __ BCC $50d9 ; (lmul4f12s.s4 + 53)
50ce : a8 __ __ TAY
50cf : 18 __ __ CLC
50d0 : a5 1c __ LDA ACCU + 1 
50d2 : 65 0f __ ADC P2 
50d4 : 85 1c __ STA ACCU + 1 
50d6 : 98 __ __ TYA
50d7 : 65 10 __ ADC P3 
50d9 : 6a __ __ ROR
50da : 66 1c __ ROR ACCU + 1 
50dc : 66 1b __ ROR ACCU + 0 
50de : ca __ __ DEX
50df : d0 eb __ BNE $50cc ; (lmul4f12s.s4 + 40)
50e1 : 90 0a __ BCC $50ed ; (lmul4f12s.s4 + 73)
50e3 : a8 __ __ TAY
50e4 : a5 1c __ LDA ACCU + 1 
50e6 : e5 0f __ SBC P2 
50e8 : 85 1c __ STA ACCU + 1 
50ea : 98 __ __ TYA
50eb : e5 10 __ SBC P3 
50ed : 6a __ __ ROR
50ee : 66 1c __ ROR ACCU + 1 
50f0 : 66 1b __ ROR ACCU + 0 
50f2 : 24 10 __ BIT P3 
50f4 : 10 0b __ BPL $5101 ; (lmul4f12s.s4 + 93)
50f6 : aa __ __ TAX
50f7 : 38 __ __ SEC
50f8 : a5 1c __ LDA ACCU + 1 
50fa : e5 0d __ SBC P0 
50fc : 85 1c __ STA ACCU + 1 
50fe : 8a __ __ TXA
50ff : e5 0e __ SBC P1 
5101 : 4a __ __ LSR
5102 : 66 1c __ ROR ACCU + 1 
5104 : 66 1b __ ROR ACCU + 0 
5106 : 4a __ __ LSR
5107 : 66 1c __ ROR ACCU + 1 
5109 : 66 1b __ ROR ACCU + 0 
510b : 4a __ __ LSR
510c : 66 1c __ ROR ACCU + 1 
510e : 66 1b __ ROR ACCU + 0 
5110 : 4a __ __ LSR
5111 : 66 1c __ ROR ACCU + 1 
5113 : 66 1b __ ROR ACCU + 0 
.s3:
5115 : 60 __ __ RTS
--------------------------------------------------------------------
colorize_standard: ; colorize_standard(const const struct S#29060[]*)->void
; 176, "/home/xahmol/git/UltimateDemo2026/src/mandel.c"
.s4:
5116 : a9 00 __ LDA #$00
5118 : 85 43 __ STA T0 + 0 
511a : 85 44 __ STA T1 + 0 
511c : 85 46 __ STA T2 + 0 
511e : 85 48 __ STA T3 + 0 
5120 : a9 e0 __ LDA #$e0
5122 : 85 45 __ STA T1 + 1 
5124 : a9 c0 __ LDA #$c0
5126 : 85 47 __ STA T2 + 1 
5128 : a9 d8 __ LDA #$d8
512a : 85 49 __ STA T3 + 1 
.l5:
512c : a9 00 __ LDA #$00
512e : 85 4a __ STA T4 + 0 
.l6:
5130 : 0a __ __ ASL
5131 : 0a __ __ ASL
5132 : 0a __ __ ASL
5133 : a2 00 __ LDX #$00
5135 : 90 02 __ BCC $5139 ; (colorize_standard.s51 + 0)
.s50:
5137 : e8 __ __ INX
5138 : 18 __ __ CLC
.s51:
5139 : 65 44 __ ADC T1 + 0 
513b : 85 4b __ STA T5 + 0 
513d : 8a __ __ TXA
513e : 65 45 __ ADC T1 + 1 
5140 : 85 4c __ STA T5 + 1 
5142 : a9 00 __ LDA #$00
5144 : 85 1c __ STA ACCU + 1 
5146 : 85 4d __ STA T10 + 0 
5148 : 85 4e __ STA T11 + 0 
514a : aa __ __ TAX
514b : a8 __ __ TAY
.l49:
514c : b1 4b __ LDA (T5 + 0),y 
514e : 85 1b __ STA ACCU + 0 
5150 : 0a __ __ ASL
5151 : 2a __ __ ROL
5152 : 29 01 __ AND #$01
5154 : 2a __ __ ROL
5155 : d0 04 __ BNE $515b ; (colorize_standard.s43 + 0)
.s7:
5157 : e8 __ __ INX
5158 : 4c 6f 51 JMP $516f ; (colorize_standard.s8 + 0)
.s43:
515b : c9 01 __ CMP #$01
515d : d0 05 __ BNE $5164 ; (colorize_standard.s44 + 0)
.s47:
515f : e6 1c __ INC ACCU + 1 
5161 : 4c 6f 51 JMP $516f ; (colorize_standard.s8 + 0)
.s44:
5164 : c9 02 __ CMP #$02
5166 : f0 05 __ BEQ $516d ; (colorize_standard.s46 + 0)
.s45:
5168 : e6 4e __ INC T11 + 0 
516a : 4c 6f 51 JMP $516f ; (colorize_standard.s8 + 0)
.s46:
516d : e6 4d __ INC T10 + 0 
.s8:
516f : a5 1b __ LDA ACCU + 0 
5171 : 29 30 __ AND #$30
5173 : 4a __ __ LSR
5174 : 4a __ __ LSR
5175 : 4a __ __ LSR
5176 : 4a __ __ LSR
5177 : d0 04 __ BNE $517d ; (colorize_standard.s38 + 0)
.s9:
5179 : e8 __ __ INX
517a : 4c 91 51 JMP $5191 ; (colorize_standard.s10 + 0)
.s38:
517d : c9 01 __ CMP #$01
517f : d0 05 __ BNE $5186 ; (colorize_standard.s39 + 0)
.s42:
5181 : e6 1c __ INC ACCU + 1 
5183 : 4c 91 51 JMP $5191 ; (colorize_standard.s10 + 0)
.s39:
5186 : c9 02 __ CMP #$02
5188 : f0 05 __ BEQ $518f ; (colorize_standard.s41 + 0)
.s40:
518a : e6 4e __ INC T11 + 0 
518c : 4c 91 51 JMP $5191 ; (colorize_standard.s10 + 0)
.s41:
518f : e6 4d __ INC T10 + 0 
.s10:
5191 : a5 1b __ LDA ACCU + 0 
5193 : 29 0c __ AND #$0c
5195 : 4a __ __ LSR
5196 : 4a __ __ LSR
5197 : d0 04 __ BNE $519d ; (colorize_standard.s33 + 0)
.s11:
5199 : e8 __ __ INX
519a : 4c b1 51 JMP $51b1 ; (colorize_standard.s12 + 0)
.s33:
519d : c9 01 __ CMP #$01
519f : d0 05 __ BNE $51a6 ; (colorize_standard.s34 + 0)
.s37:
51a1 : e6 1c __ INC ACCU + 1 
51a3 : 4c b1 51 JMP $51b1 ; (colorize_standard.s12 + 0)
.s34:
51a6 : c9 02 __ CMP #$02
51a8 : f0 05 __ BEQ $51af ; (colorize_standard.s36 + 0)
.s35:
51aa : e6 4e __ INC T11 + 0 
51ac : 4c b1 51 JMP $51b1 ; (colorize_standard.s12 + 0)
.s36:
51af : e6 4d __ INC T10 + 0 
.s12:
51b1 : a5 1b __ LDA ACCU + 0 
51b3 : 29 03 __ AND #$03
51b5 : d0 04 __ BNE $51bb ; (colorize_standard.s28 + 0)
.s13:
51b7 : e8 __ __ INX
51b8 : 4c cf 51 JMP $51cf ; (colorize_standard.s14 + 0)
.s28:
51bb : c9 01 __ CMP #$01
51bd : d0 05 __ BNE $51c4 ; (colorize_standard.s29 + 0)
.s32:
51bf : e6 1c __ INC ACCU + 1 
51c1 : 4c cf 51 JMP $51cf ; (colorize_standard.s14 + 0)
.s29:
51c4 : c9 02 __ CMP #$02
51c6 : f0 05 __ BEQ $51cd ; (colorize_standard.s31 + 0)
.s30:
51c8 : e6 4e __ INC T11 + 0 
51ca : 4c cf 51 JMP $51cf ; (colorize_standard.s14 + 0)
.s31:
51cd : e6 4d __ INC T10 + 0 
.s14:
51cf : c8 __ __ INY
51d0 : c0 08 __ CPY #$08
51d2 : b0 03 __ BCS $51d7 ; (colorize_standard.s15 + 0)
51d4 : 4c 4c 51 JMP $514c ; (colorize_standard.l49 + 0)
.s15:
51d7 : 18 __ __ CLC
51d8 : a5 4d __ LDA T10 + 0 
51da : 65 1c __ ADC ACCU + 1 
51dc : 85 4b __ STA T5 + 0 
51de : a9 00 __ LDA #$00
51e0 : 2a __ __ ROL
51e1 : a8 __ __ TAY
51e2 : a5 4b __ LDA T5 + 0 
51e4 : 65 4e __ ADC T11 + 0 
51e6 : 85 4b __ STA T5 + 0 
51e8 : 98 __ __ TYA
51e9 : 69 00 __ ADC #$00
51eb : 05 4b __ ORA T5 + 0 
51ed : f0 02 __ BEQ $51f1 ; (colorize_standard.s53 + 0)
.s52:
51ef : a9 01 __ LDA #$01
.s53:
51f1 : 85 4b __ STA T5 + 0 
51f3 : 8a __ __ TXA
51f4 : f0 03 __ BEQ $51f9 ; (colorize_standard.s16 + 0)
51f6 : 4c 98 52 JMP $5298 ; (colorize_standard.s26 + 0)
.s16:
51f9 : a5 4b __ LDA T5 + 0 
51fb : f0 22 __ BEQ $521f ; (colorize_standard.s17 + 0)
.s19:
51fd : a5 1c __ LDA ACCU + 1 
51ff : c5 4d __ CMP T10 + 0 
5201 : b0 04 __ BCS $5207 ; (colorize_standard.s20 + 0)
.s25:
5203 : a9 02 __ LDA #$02
5205 : 90 02 __ BCC $5209 ; (colorize_standard.s21 + 0)
.s20:
5207 : a9 01 __ LDA #$01
.s21:
5209 : 85 4b __ STA T5 + 0 
520b : a5 4d __ LDA T10 + 0 
520d : c5 4e __ CMP T11 + 0 
520f : b0 06 __ BCS $5217 ; (colorize_standard.s22 + 0)
.s23:
5211 : a5 1c __ LDA ACCU + 1 
5213 : c5 4e __ CMP T11 + 0 
5215 : 90 04 __ BCC $521b ; (colorize_standard.s24 + 0)
.s22:
5217 : c6 4b __ DEC T5 + 0 
5219 : b0 04 __ BCS $521f ; (colorize_standard.s17 + 0)
.s24:
521b : a9 02 __ LDA #$02
.s48:
521d : 85 4b __ STA T5 + 0 
.s17:
521f : 18 __ __ CLC
5220 : a5 4a __ LDA T4 + 0 
5222 : 65 43 __ ADC T0 + 0 
5224 : 0a __ __ ASL
5225 : 0a __ __ ASL
5226 : 85 1b __ STA ACCU + 0 
5228 : a9 00 __ LDA #$00
522a : 85 1c __ STA ACCU + 1 
522c : 85 04 __ STA WORK + 1 
522e : a9 41 __ LDA #$41
5230 : 85 03 __ STA WORK + 0 
5232 : 20 3b 70 JSR $703b ; (divmod + 0)
5235 : a6 1b __ LDX ACCU + 0 
5237 : bd 8e 73 LDA $738e,x ; (__multab12L + 0)
523a : 18 __ __ CLC
523b : 65 0d __ ADC P0 ; (pal + 0)
523d : 85 1b __ STA ACCU + 0 
523f : a5 0e __ LDA P1 ; (pal + 1)
5241 : 69 00 __ ADC #$00
5243 : aa __ __ TAX
5244 : a4 4b __ LDY T5 + 0 
5246 : b9 92 73 LDA $7392,y ; (__multab3L + 0)
5249 : 18 __ __ CLC
524a : 65 1b __ ADC ACCU + 0 
524c : 85 1b __ STA ACCU + 0 
524e : 90 01 __ BCC $5251 ; (colorize_standard.s55 + 0)
.s54:
5250 : e8 __ __ INX
.s55:
5251 : 86 1c __ STX ACCU + 1 
5253 : a0 00 __ LDY #$00
5255 : b1 1b __ LDA (ACCU + 0),y 
5257 : 0a __ __ ASL
5258 : 0a __ __ ASL
5259 : 0a __ __ ASL
525a : 0a __ __ ASL
525b : c8 __ __ INY
525c : 11 1b __ ORA (ACCU + 0),y 
525e : 88 __ __ DEY
525f : 91 46 __ STA (T2 + 0),y 
5261 : a0 02 __ LDY #$02
5263 : b1 1b __ LDA (ACCU + 0),y 
5265 : a0 00 __ LDY #$00
5267 : 91 48 __ STA (T3 + 0),y 
5269 : e6 46 __ INC T2 + 0 
526b : d0 02 __ BNE $526f ; (colorize_standard.s57 + 0)
.s56:
526d : e6 47 __ INC T2 + 1 
.s57:
526f : e6 48 __ INC T3 + 0 
5271 : d0 02 __ BNE $5275 ; (colorize_standard.s59 + 0)
.s58:
5273 : e6 49 __ INC T3 + 1 
.s59:
5275 : e6 4a __ INC T4 + 0 
5277 : a5 4a __ LDA T4 + 0 
5279 : c9 28 __ CMP #$28
527b : f0 03 __ BEQ $5280 ; (colorize_standard.s18 + 0)
527d : 4c 30 51 JMP $5130 ; (colorize_standard.l6 + 0)
.s18:
5280 : a5 44 __ LDA T1 + 0 
5282 : 69 3f __ ADC #$3f
5284 : 85 44 __ STA T1 + 0 
5286 : a5 45 __ LDA T1 + 1 
5288 : 69 01 __ ADC #$01
528a : 85 45 __ STA T1 + 1 
528c : e6 43 __ INC T0 + 0 
528e : a5 43 __ LDA T0 + 0 
5290 : c9 19 __ CMP #$19
5292 : f0 03 __ BEQ $5297 ; (colorize_standard.s3 + 0)
5294 : 4c 2c 51 JMP $512c ; (colorize_standard.l5 + 0)
.s3:
5297 : 60 __ __ RTS
.s26:
5298 : a5 4b __ LDA T5 + 0 
529a : f0 83 __ BEQ $521f ; (colorize_standard.s17 + 0)
.s27:
529c : a9 03 __ LDA #$03
529e : 4c 1d 52 JMP $521d ; (colorize_standard.s48 + 0)
--------------------------------------------------------------------
ball_run: ; ball_run()->void
;   3, "/home/xahmol/git/UltimateDemo2026/src/ball.h"
.s1:
52a1 : a2 0d __ LDX #$0d
52a3 : b5 53 __ LDA T0 + 0,x 
52a5 : 9d af bf STA $bfaf,x ; (ball_run@stack + 0)
52a8 : ca __ __ DEX
52a9 : 10 f8 __ BPL $52a3 ; (ball_run.s1 + 2)
.s4:
52ab : a9 8f __ LDA #$8f
52ad : 20 f1 15 JSR $15f1 ; (turbo_set.s4 + 0)
52b0 : 20 5e 54 JSR $545e ; (ball_init.s4 + 0)
52b3 : a9 00 __ LDA #$00
52b5 : 85 55 __ STA T1 + 0 
52b7 : 85 56 __ STA T2 + 0 
52b9 : 85 57 __ STA T3 + 0 
52bb : 85 58 __ STA T4 + 0 
52bd : 85 59 __ STA T5 + 0 
52bf : a9 a8 __ LDA #$a8
52c1 : 85 5a __ STA T6 + 0 
52c3 : a9 fd __ LDA #$fd
52c5 : 85 5b __ STA T6 + 1 
.l5:
52c7 : 2c 11 d0 BIT $d011 
52ca : 30 fb __ BMI $52c7 ; (ball_run.l5 + 0)
.l6:
52cc : 2c 11 d0 BIT $d011 
52cf : 10 fb __ BPL $52cc ; (ball_run.l6 + 0)
.s7:
52d1 : a9 00 __ LDA #$00
52d3 : 85 0f __ STA P2 
52d5 : 85 10 __ STA P3 
52d7 : 85 0d __ STA P0 
52d9 : 20 e2 73 JSR $73e2 ; (memset@proxy + 0)
52dc : a5 55 __ LDA T1 + 0 
52de : 29 3f __ AND #$3f
52e0 : aa __ __ TAX
52e1 : bd 00 78 LDA $7800,x ; (sin64[0] + 0)
52e4 : 85 5c __ STA T7 + 0 
52e6 : 29 80 __ AND #$80
52e8 : 10 02 __ BPL $52ec ; (ball_run.s7 + 27)
52ea : a9 ff __ LDA #$ff
52ec : 85 5d __ STA T7 + 1 
52ee : bd 00 78 LDA $7800,x ; (sin64[0] + 0)
52f1 : 10 0d __ BPL $5300 ; (ball_run.s8 + 0)
.s10:
52f3 : 38 __ __ SEC
52f4 : a9 00 __ LDA #$00
52f6 : e5 5c __ SBC T7 + 0 
52f8 : 85 5c __ STA T7 + 0 
52fa : a9 00 __ LDA #$00
52fc : e5 5d __ SBC T7 + 1 
52fe : 85 5d __ STA T7 + 1 
.s8:
5300 : a5 58 __ LDA T4 + 0 
5302 : 85 18 __ STA P11 
5304 : a5 57 __ LDA T3 + 0 
5306 : 29 3f __ AND #$3f
5308 : aa __ __ TAX
5309 : bd 00 78 LDA $7800,x ; (sin64[0] + 0)
530c : 85 60 __ STA T9 + 0 
530e : a5 56 __ LDA T2 + 0 
5310 : 29 3f __ AND #$3f
5312 : aa __ __ TAX
5313 : bd 00 78 LDA $7800,x ; (sin64[0] + 0)
5316 : 85 53 __ STA T0 + 0 
5318 : 29 80 __ AND #$80
531a : 10 02 __ BPL $531e ; (ball_run.s8 + 30)
531c : a9 ff __ LDA #$ff
531e : 85 54 __ STA T0 + 1 
5320 : 20 b7 54 JSR $54b7 ; (draw_floor.s4 + 0)
5323 : a5 53 __ LDA T0 + 0 
5325 : 0a __ __ ASL
5326 : 85 1b __ STA ACCU + 0 
5328 : a5 54 __ LDA T0 + 1 
532a : 2a __ __ ROL
532b : 06 1b __ ASL ACCU + 0 
532d : 2a __ __ ROL
532e : aa __ __ TAX
532f : 18 __ __ CLC
5330 : a5 1b __ LDA ACCU + 0 
5332 : 65 53 __ ADC T0 + 0 
5334 : 85 1b __ STA ACCU + 0 
5336 : 8a __ __ TXA
5337 : 65 54 __ ADC T0 + 1 
5339 : 06 1b __ ASL ACCU + 0 
533b : 2a __ __ ROL
533c : 06 1b __ ASL ACCU + 0 
533e : 2a __ __ ROL
533f : 06 1b __ ASL ACCU + 0 
5341 : 2a __ __ ROL
5342 : 06 1b __ ASL ACCU + 0 
5344 : 2a __ __ ROL
5345 : 85 1c __ STA ACCU + 1 
5347 : 20 21 74 JSR $7421 ; (divs16@proxy + 0)
534a : 18 __ __ CLC
534b : a5 1b __ LDA ACCU + 0 
534d : 69 f0 __ ADC #$f0
534f : 85 5e __ STA T8 + 0 
5351 : a5 1c __ LDA ACCU + 1 
5353 : 69 00 __ ADC #$00
5355 : 85 5f __ STA T8 + 1 
5357 : a5 60 __ LDA T9 + 0 
5359 : 85 1b __ STA ACCU + 0 
535b : 29 80 __ AND #$80
535d : 10 02 __ BPL $5361 ; (ball_run.s8 + 97)
535f : a9 ff __ LDA #$ff
5361 : 85 1c __ STA ACCU + 1 
5363 : a9 1e __ LDA #$1e
5365 : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
5368 : 20 21 74 JSR $7421 ; (divs16@proxy + 0)
536b : a9 b4 __ LDA #$b4
536d : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
5370 : 20 fc 73 JSR $73fc ; (divs16@proxy + 0)
5373 : 18 __ __ CLC
5374 : a5 1b __ LDA ACCU + 0 
5376 : 69 50 __ ADC #$50
5378 : 85 12 __ STA P5 
537a : a5 1c __ LDA ACCU + 1 
537c : 69 00 __ ADC #$00
537e : 85 13 __ STA P6 
5380 : a9 50 __ LDA #$50
5382 : 85 1b __ STA ACCU + 0 
5384 : a9 46 __ LDA #$46
5386 : 85 1c __ STA ACCU + 1 
5388 : 20 fc 73 JSR $73fc ; (divs16@proxy + 0)
538b : 18 __ __ CLC
538c : a5 1b __ LDA ACCU + 0 
538e : 69 48 __ ADC #$48
5390 : 85 14 __ STA P7 
5392 : a5 1c __ LDA ACCU + 1 
5394 : 69 00 __ ADC #$00
5396 : 85 15 __ STA P8 
5398 : a9 a0 __ LDA #$a0
539a : 85 1b __ STA ACCU + 0 
539c : a9 05 __ LDA #$05
539e : 85 1c __ STA ACCU + 1 
53a0 : 20 fc 73 JSR $73fc ; (divs16@proxy + 0)
53a3 : a5 1b __ LDA ACCU + 0 
53a5 : 85 16 __ STA P9 
53a7 : a5 1c __ LDA ACCU + 1 
53a9 : 85 17 __ STA P10 
53ab : a9 1c __ LDA #$1c
53ad : 85 1b __ STA ACCU + 0 
53af : a9 02 __ LDA #$02
53b1 : 85 1c __ STA ACCU + 1 
53b3 : 20 fc 73 JSR $73fc ; (divs16@proxy + 0)
53b6 : a5 1b __ LDA ACCU + 0 
53b8 : 8d ea bf STA $bfea ; (sstack + 0)
53bb : a5 1c __ LDA ACCU + 1 
53bd : 8d eb bf STA $bfeb ; (sstack + 1)
53c0 : 20 16 59 JSR $5916 ; (draw_shadow.s4 + 0)
53c3 : a5 12 __ LDA P5 
53c5 : 8d ea bf STA $bfea ; (sstack + 0)
53c8 : a5 13 __ LDA P6 
53ca : 8d eb bf STA $bfeb ; (sstack + 1)
53cd : a5 59 __ LDA T5 + 0 
53cf : 8d ee bf STA $bfee ; (sstack + 4)
53d2 : 18 __ __ CLC
53d3 : 69 02 __ ADC #$02
53d5 : 85 59 __ STA T5 + 0 
53d7 : a5 5c __ LDA T7 + 0 
53d9 : 85 1b __ STA ACCU + 0 
53db : a5 5d __ LDA T7 + 1 
53dd : 85 1c __ STA ACCU + 1 
53df : a9 3c __ LDA #$3c
53e1 : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
53e4 : a9 7f __ LDA #$7f
53e6 : 85 03 __ STA WORK + 0 
53e8 : 20 37 70 JSR $7037 ; (divmod@proxy + 0)
53eb : 38 __ __ SEC
53ec : a9 64 __ LDA #$64
53ee : e5 1b __ SBC ACCU + 0 
53f0 : 85 1b __ STA ACCU + 0 
53f2 : a9 00 __ LDA #$00
53f4 : 85 1c __ STA ACCU + 1 
53f6 : a9 b4 __ LDA #$b4
53f8 : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
53fb : 20 fc 73 JSR $73fc ; (divs16@proxy + 0)
53fe : 18 __ __ CLC
53ff : a5 1b __ LDA ACCU + 0 
5401 : 69 48 __ ADC #$48
5403 : 8d ec bf STA $bfec ; (sstack + 2)
5406 : a5 1c __ LDA ACCU + 1 
5408 : 69 00 __ ADC #$00
540a : 8d ed bf STA $bfed ; (sstack + 3)
540d : a9 40 __ LDA #$40
540f : 85 1b __ STA ACCU + 0 
5411 : a9 0b __ LDA #$0b
5413 : 85 1c __ STA ACCU + 1 
5415 : 20 fc 73 JSR $73fc ; (divs16@proxy + 0)
5418 : a5 1b __ LDA ACCU + 0 
541a : 8d ef bf STA $bfef ; (sstack + 5)
541d : a5 1c __ LDA ACCU + 1 
541f : 8d f0 bf STA $bff0 ; (sstack + 6)
5422 : 20 af 5a JSR $5aaf ; (draw_ball.s1 + 0)
5425 : e6 58 __ INC T4 + 0 
5427 : e6 57 __ INC T3 + 0 
5429 : e6 57 __ INC T3 + 0 
542b : e6 56 __ INC T2 + 0 
542d : e6 55 __ INC T1 + 0 
542f : e6 55 __ INC T1 + 0 
5431 : e6 5a __ INC T6 + 0 
5433 : f0 03 __ BEQ $5438 ; (ball_run.s11 + 0)
5435 : 4c c7 52 JMP $52c7 ; (ball_run.l5 + 0)
.s11:
5438 : e6 5b __ INC T6 + 1 
543a : d0 f9 __ BNE $5435 ; (ball_run.s8 + 309)
.s9:
543c : a9 00 __ LDA #$00
543e : 85 0d __ STA P0 
5440 : 85 0e __ STA P1 
5442 : 85 10 __ STA P3 
5444 : a9 36 __ LDA #$36
5446 : 85 01 __ STA $01 
5448 : 20 0b 0f JSR $0f0b ; (vic_setmode@proxy + 0)
544b : a9 00 __ LDA #$00
544d : 8d 20 d0 STA $d020 
5450 : 8d 21 d0 STA $d021 
.s3:
5453 : a2 0d __ LDX #$0d
5455 : bd af bf LDA $bfaf,x ; (ball_run@stack + 0)
5458 : 95 53 __ STA T0 + 0,x 
545a : ca __ __ DEX
545b : 10 f8 __ BPL $5455 ; (ball_run.s3 + 2)
545d : 60 __ __ RTS
--------------------------------------------------------------------
ball_init: ; ball_init()->void
; 293, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
545e : 78 __ __ SEI
545f : a9 35 __ LDA #$35
5461 : 85 01 __ STA $01 
5463 : 20 0f 21 JSR $210f ; (mmap_trampoline.s4 + 0)
5466 : 58 __ __ CLI
5467 : a9 00 __ LDA #$00
5469 : 85 0f __ STA P2 
546b : 85 10 __ STA P3 
546d : 85 43 __ STA T0 + 0 
546f : 85 0d __ STA P0 
5471 : 20 e2 73 JSR $73e2 ; (memset@proxy + 0)
5474 : a9 c0 __ LDA #$c0
5476 : 85 44 __ STA T0 + 1 
5478 : a9 00 __ LDA #$00
547a : 85 1f __ STA ADDR + 0 
547c : f0 02 __ BEQ $5480 ; (ball_init.l7 + 0)
.s8:
547e : e6 44 __ INC T0 + 1 
.l7:
5480 : a9 12 __ LDA #$12
5482 : a0 00 __ LDY #$00
5484 : 91 43 __ STA (T0 + 0),y 
5486 : 18 __ __ CLC
5487 : a5 44 __ LDA T0 + 1 
5489 : 69 18 __ ADC #$18
548b : 85 20 __ STA ADDR + 1 
548d : a9 0c __ LDA #$0c
548f : a4 43 __ LDY T0 + 0 
5491 : 91 1f __ STA (ADDR + 0),y 
5493 : 98 __ __ TYA
5494 : 18 __ __ CLC
5495 : 69 01 __ ADC #$01
5497 : 85 43 __ STA T0 + 0 
5499 : b0 e3 __ BCS $547e ; (ball_init.s8 + 0)
.s9:
549b : c9 e8 __ CMP #$e8
549d : d0 e1 __ BNE $5480 ; (ball_init.l7 + 0)
.s6:
549f : a5 44 __ LDA T0 + 1 
54a1 : c9 c3 __ CMP #$c3
54a3 : d0 db __ BNE $5480 ; (ball_init.l7 + 0)
.s5:
54a5 : a9 00 __ LDA #$00
54a7 : 85 0e __ STA P1 
54a9 : 85 10 __ STA P3 
54ab : 20 42 74 JSR $7442 ; (vic_setmode@proxy + 0)
54ae : a9 00 __ LDA #$00
54b0 : 8d 21 d0 STA $d021 
54b3 : 8d 20 d0 STA $d020 
.s3:
54b6 : 60 __ __ RTS
--------------------------------------------------------------------
draw_floor: ; draw_floor(u8)->void
; 137, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
54b7 : a9 00 __ LDA #$00
54b9 : 85 51 __ STA T3 + 0 
.l5:
54bb : a5 18 __ LDA P11 ; (floor_rot + 0)
54bd : 85 11 __ STA P4 
54bf : a9 b0 __ LDA #$b0
54c1 : 85 0d __ STA P0 
54c3 : a9 ff __ LDA #$ff
54c5 : 85 0e __ STA P1 
54c7 : a5 51 __ LDA T3 + 0 
54c9 : 0a __ __ ASL
54ca : aa __ __ TAX
54cb : a9 e8 __ LDA #$e8
54cd : 85 12 __ STA P5 
54cf : a9 bf __ LDA #$bf
54d1 : 85 13 __ STA P6 
54d3 : a9 e6 __ LDA #$e6
54d5 : 85 14 __ STA P7 
54d7 : a9 bf __ LDA #$bf
54d9 : 85 15 __ STA P8 
54db : bd e6 77 LDA $77e6,x ; (gz[0] + 0)
54de : 85 0f __ STA P2 
54e0 : bd e7 77 LDA $77e7,x ; (gz[0] + 1)
54e3 : 85 10 __ STA P3 
54e5 : 20 b3 56 JSR $56b3 ; (rotate_y.s4 + 0)
54e8 : e6 0e __ INC P1 
54ea : a9 50 __ LDA #$50
54ec : 85 0d __ STA P0 
54ee : a9 e4 __ LDA #$e4
54f0 : 85 12 __ STA P5 
54f2 : a9 bf __ LDA #$bf
54f4 : 85 15 __ STA P8 
54f6 : a9 bf __ LDA #$bf
54f8 : 85 13 __ STA P6 
54fa : a9 e2 __ LDA #$e2
54fc : 85 14 __ STA P7 
54fe : 20 b3 56 JSR $56b3 ; (rotate_y.s4 + 0)
5501 : ad e7 bf LDA $bfe7 ; (rz0 + 1)
5504 : 30 1a __ BMI $5520 ; (draw_floor.s8 + 0)
.s21:
5506 : d0 07 __ BNE $550f ; (draw_floor.s6 + 0)
.s20:
5508 : ad e6 bf LDA $bfe6 ; (rz0 + 0)
550b : c9 0f __ CMP #$0f
550d : 90 11 __ BCC $5520 ; (draw_floor.s8 + 0)
.s6:
550f : ad e3 bf LDA $bfe3 ; (rz1 + 1)
5512 : 30 0c __ BMI $5520 ; (draw_floor.s8 + 0)
.s19:
5514 : f0 03 __ BEQ $5519 ; (draw_floor.s18 + 0)
5516 : 4c 25 56 JMP $5625 ; (draw_floor.s7 + 0)
.s18:
5519 : ad e2 bf LDA $bfe2 ; (rz1 + 0)
551c : c9 0f __ CMP #$0f
551e : b0 f6 __ BCS $5516 ; (draw_floor.s19 + 2)
.s8:
5520 : e6 51 __ INC T3 + 0 
5522 : a5 51 __ LDA T3 + 0 
5524 : c9 07 __ CMP #$07
5526 : d0 93 __ BNE $54bb ; (draw_floor.l5 + 0)
.s9:
5528 : a9 00 __ LDA #$00
552a : 85 51 __ STA T3 + 0 
.l10:
552c : a5 18 __ LDA P11 ; (floor_rot + 0)
552e : 85 11 __ STA P4 
5530 : a9 a0 __ LDA #$a0
5532 : 85 0f __ STA P2 
5534 : a9 00 __ LDA #$00
5536 : 85 10 __ STA P3 
5538 : a5 51 __ LDA T3 + 0 
553a : 0a __ __ ASL
553b : aa __ __ TAX
553c : a9 e0 __ LDA #$e0
553e : 85 12 __ STA P5 
5540 : a9 bf __ LDA #$bf
5542 : 85 13 __ STA P6 
5544 : a9 de __ LDA #$de
5546 : 85 14 __ STA P7 
5548 : a9 bf __ LDA #$bf
554a : 85 15 __ STA P8 
554c : bd c2 78 LDA $78c2,x ; (gx[0] + 0)
554f : 85 0d __ STA P0 
5551 : bd c3 78 LDA $78c3,x ; (gx[0] + 1)
5554 : 85 0e __ STA P1 
5556 : 20 b3 56 JSR $56b3 ; (rotate_y.s4 + 0)
5559 : e6 10 __ INC P3 
555b : a9 40 __ LDA #$40
555d : 85 0f __ STA P2 
555f : a9 dc __ LDA #$dc
5561 : 85 12 __ STA P5 
5563 : a9 bf __ LDA #$bf
5565 : 85 15 __ STA P8 
5567 : a9 bf __ LDA #$bf
5569 : 85 13 __ STA P6 
556b : a9 da __ LDA #$da
556d : 85 14 __ STA P7 
556f : 20 b3 56 JSR $56b3 ; (rotate_y.s4 + 0)
5572 : ad df bf LDA $bfdf ; (rz0 + 1)
5575 : 30 17 __ BMI $558e ; (draw_floor.s13 + 0)
.s17:
5577 : d0 07 __ BNE $5580 ; (draw_floor.s11 + 0)
.s16:
5579 : ad de bf LDA $bfde ; (rz0 + 0)
557c : c9 0f __ CMP #$0f
557e : 90 0e __ BCC $558e ; (draw_floor.s13 + 0)
.s11:
5580 : ad db bf LDA $bfdb ; (rz1 + 1)
5583 : 30 09 __ BMI $558e ; (draw_floor.s13 + 0)
.s15:
5585 : d0 10 __ BNE $5597 ; (draw_floor.s12 + 0)
.s14:
5587 : ad da bf LDA $bfda ; (rz1 + 0)
558a : c9 0f __ CMP #$0f
558c : b0 09 __ BCS $5597 ; (draw_floor.s12 + 0)
.s13:
558e : e6 51 __ INC T3 + 0 
5590 : a5 51 __ LDA T3 + 0 
5592 : c9 07 __ CMP #$07
5594 : d0 96 __ BNE $552c ; (draw_floor.l10 + 0)
.s3:
5596 : 60 __ __ RTS
.s12:
5597 : ad e0 bf LDA $bfe0 ; (rx0 + 0)
559a : 85 1b __ STA ACCU + 0 
559c : ad e1 bf LDA $bfe1 ; (rx0 + 1)
559f : 85 1c __ STA ACCU + 1 
55a1 : a9 b4 __ LDA #$b4
55a3 : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
55a6 : ad de bf LDA $bfde ; (rz0 + 0)
55a9 : 85 03 __ STA WORK + 0 
55ab : ad df bf LDA $bfdf ; (rz0 + 1)
55ae : 85 04 __ STA WORK + 1 
55b0 : 20 00 70 JSR $7000 ; (divs16 + 0)
55b3 : 18 __ __ CLC
55b4 : a5 1b __ LDA ACCU + 0 
55b6 : 69 50 __ ADC #$50
55b8 : 85 12 __ STA P5 
55ba : a5 1c __ LDA ACCU + 1 
55bc : 69 00 __ ADC #$00
55be : 85 13 __ STA P6 
55c0 : ad de bf LDA $bfde ; (rz0 + 0)
55c3 : 85 03 __ STA WORK + 0 
55c5 : ad df bf LDA $bfdf ; (rz0 + 1)
55c8 : 85 04 __ STA WORK + 1 
55ca : 20 2c 74 JSR $742c ; (divmod@proxy + 0)
55cd : 18 __ __ CLC
55ce : a5 1b __ LDA ACCU + 0 
55d0 : 69 48 __ ADC #$48
55d2 : 85 14 __ STA P7 
55d4 : a5 1c __ LDA ACCU + 1 
55d6 : 69 00 __ ADC #$00
55d8 : 85 15 __ STA P8 
55da : ad dc bf LDA $bfdc ; (rx1 + 0)
55dd : 85 1b __ STA ACCU + 0 
55df : ad dd bf LDA $bfdd ; (rx1 + 1)
55e2 : 85 1c __ STA ACCU + 1 
55e4 : a9 b4 __ LDA #$b4
55e6 : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
55e9 : ad da bf LDA $bfda ; (rz1 + 0)
55ec : 85 03 __ STA WORK + 0 
55ee : ad db bf LDA $bfdb ; (rz1 + 1)
55f1 : 85 04 __ STA WORK + 1 
55f3 : 20 00 70 JSR $7000 ; (divs16 + 0)
55f6 : 18 __ __ CLC
55f7 : a5 1b __ LDA ACCU + 0 
55f9 : 69 50 __ ADC #$50
55fb : 85 16 __ STA P9 
55fd : a5 1c __ LDA ACCU + 1 
55ff : 69 00 __ ADC #$00
5601 : 85 17 __ STA P10 
5603 : ad da bf LDA $bfda ; (rz1 + 0)
5606 : 85 03 __ STA WORK + 0 
5608 : ad db bf LDA $bfdb ; (rz1 + 1)
560b : 85 04 __ STA WORK + 1 
560d : 20 2c 74 JSR $742c ; (divmod@proxy + 0)
5610 : 18 __ __ CLC
5611 : a5 1b __ LDA ACCU + 0 
5613 : 69 48 __ ADC #$48
5615 : 8d ea bf STA $bfea ; (sstack + 0)
5618 : a5 1c __ LDA ACCU + 1 
561a : 69 00 __ ADC #$00
561c : 8d eb bf STA $bfeb ; (sstack + 1)
561f : 20 78 57 JSR $5778 ; (mc_line.s4 + 0)
5622 : 4c 8e 55 JMP $558e ; (draw_floor.s13 + 0)
.s7:
5625 : ad e8 bf LDA $bfe8 ; (rx0 + 0)
5628 : 85 1b __ STA ACCU + 0 
562a : ad e9 bf LDA $bfe9 ; (rx0 + 1)
562d : 85 1c __ STA ACCU + 1 
562f : a9 b4 __ LDA #$b4
5631 : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
5634 : ad e6 bf LDA $bfe6 ; (rz0 + 0)
5637 : 85 03 __ STA WORK + 0 
5639 : ad e7 bf LDA $bfe7 ; (rz0 + 1)
563c : 85 04 __ STA WORK + 1 
563e : 20 00 70 JSR $7000 ; (divs16 + 0)
5641 : 18 __ __ CLC
5642 : a5 1b __ LDA ACCU + 0 
5644 : 69 50 __ ADC #$50
5646 : 85 12 __ STA P5 
5648 : a5 1c __ LDA ACCU + 1 
564a : 69 00 __ ADC #$00
564c : 85 13 __ STA P6 
564e : ad e6 bf LDA $bfe6 ; (rz0 + 0)
5651 : 85 03 __ STA WORK + 0 
5653 : ad e7 bf LDA $bfe7 ; (rz0 + 1)
5656 : 85 04 __ STA WORK + 1 
5658 : 20 2c 74 JSR $742c ; (divmod@proxy + 0)
565b : 18 __ __ CLC
565c : a5 1b __ LDA ACCU + 0 
565e : 69 48 __ ADC #$48
5660 : 85 14 __ STA P7 
5662 : a5 1c __ LDA ACCU + 1 
5664 : 69 00 __ ADC #$00
5666 : 85 15 __ STA P8 
5668 : ad e4 bf LDA $bfe4 ; (rx1 + 0)
566b : 85 1b __ STA ACCU + 0 
566d : ad e5 bf LDA $bfe5 ; (rx1 + 1)
5670 : 85 1c __ STA ACCU + 1 
5672 : a9 b4 __ LDA #$b4
5674 : 20 50 6f JSR $6f50 ; (mul16by8 + 0)
5677 : ad e2 bf LDA $bfe2 ; (rz1 + 0)
567a : 85 03 __ STA WORK + 0 
567c : ad e3 bf LDA $bfe3 ; (rz1 + 1)
567f : 85 04 __ STA WORK + 1 
5681 : 20 00 70 JSR $7000 ; (divs16 + 0)
5684 : 18 __ __ CLC
5685 : a5 1b __ LDA ACCU + 0 
5687 : 69 50 __ ADC #$50
5689 : 85 16 __ STA P9 
568b : a5 1c __ LDA ACCU + 1 
568d : 69 00 __ ADC #$00
568f : 85 17 __ STA P10 
5691 : ad e2 bf LDA $bfe2 ; (rz1 + 0)
5694 : 85 03 __ STA WORK + 0 
5696 : ad e3 bf LDA $bfe3 ; (rz1 + 1)
5699 : 85 04 __ STA WORK + 1 
569b : 20 2c 74 JSR $742c ; (divmod@proxy + 0)
569e : 18 __ __ CLC
569f : a5 1b __ LDA ACCU + 0 
56a1 : 69 48 __ ADC #$48
56a3 : 8d ea bf STA $bfea ; (sstack + 0)
56a6 : a5 1c __ LDA ACCU + 1 
56a8 : 69 00 __ ADC #$00
56aa : 8d eb bf STA $bfeb ; (sstack + 1)
56ad : 20 78 57 JSR $5778 ; (mc_line.s4 + 0)
56b0 : 4c 20 55 JMP $5520 ; (draw_floor.s8 + 0)
--------------------------------------------------------------------
rotate_y: ; rotate_y(i16,i16,u8,i16*,i16*)->void
; 128, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
56b3 : a5 11 __ LDA P4 ; (angle + 0)
56b5 : 29 3f __ AND #$3f
56b7 : aa __ __ TAX
56b8 : bd 00 78 LDA $7800,x ; (sin64[0] + 0)
56bb : 85 45 __ STA T1 + 0 
56bd : 85 03 __ STA WORK + 0 
56bf : 29 80 __ AND #$80
56c1 : 10 02 __ BPL $56c5 ; (rotate_y.s4 + 18)
56c3 : a9 ff __ LDA #$ff
56c5 : 85 46 __ STA T1 + 1 
56c7 : 85 04 __ STA WORK + 1 
56c9 : a5 0f __ LDA P2 ; (z + 0)
56cb : 38 __ __ SEC
56cc : e9 f0 __ SBC #$f0
56ce : 85 47 __ STA T2 + 0 
56d0 : 85 1b __ STA ACCU + 0 
56d2 : a5 10 __ LDA P3 ; (z + 1)
56d4 : e9 00 __ SBC #$00
56d6 : 85 48 __ STA T2 + 1 
56d8 : 85 1c __ STA ACCU + 1 
56da : 20 be 6f JSR $6fbe ; (mul16 + 0)
56dd : a5 05 __ LDA WORK + 2 
56df : 85 49 __ STA T3 + 0 
56e1 : a5 06 __ LDA WORK + 3 
56e3 : 85 4a __ STA T3 + 1 
56e5 : 18 __ __ CLC
56e6 : a5 11 __ LDA P4 ; (angle + 0)
56e8 : 69 10 __ ADC #$10
56ea : 29 3f __ AND #$3f
56ec : aa __ __ TAX
56ed : bd 00 78 LDA $7800,x ; (sin64[0] + 0)
56f0 : 85 43 __ STA T0 + 0 
56f2 : 85 03 __ STA WORK + 0 
56f4 : 29 80 __ AND #$80
56f6 : 10 02 __ BPL $56fa ; (rotate_y.s4 + 71)
56f8 : a9 ff __ LDA #$ff
56fa : 85 44 __ STA T0 + 1 
56fc : 85 04 __ STA WORK + 1 
56fe : a5 0d __ LDA P0 ; (x + 0)
5700 : 85 1b __ STA ACCU + 0 
5702 : a5 0e __ LDA P1 ; (x + 1)
5704 : 85 1c __ STA ACCU + 1 
5706 : 20 be 6f JSR $6fbe ; (mul16 + 0)
5709 : 18 __ __ CLC
570a : a5 05 __ LDA WORK + 2 
570c : 65 49 __ ADC T3 + 0 
570e : 85 1b __ STA ACCU + 0 
5710 : a5 06 __ LDA WORK + 3 
5712 : 65 4a __ ADC T3 + 1 
5714 : 85 1c __ STA ACCU + 1 
5716 : 20 21 74 JSR $7421 ; (divs16@proxy + 0)
5719 : a5 1b __ LDA ACCU + 0 
571b : a0 00 __ LDY #$00
571d : 91 12 __ STA (P5),y ; (rx + 0)
571f : a5 1c __ LDA ACCU + 1 
5721 : c8 __ __ INY
5722 : 91 12 __ STA (P5),y ; (rx + 0)
5724 : 38 __ __ SEC
5725 : a9 00 __ LDA #$00
5727 : e5 0d __ SBC P0 ; (x + 0)
5729 : 85 1b __ STA ACCU + 0 
572b : a9 00 __ LDA #$00
572d : e5 0e __ SBC P1 ; (x + 1)
572f : 85 1c __ STA ACCU + 1 
5731 : a5 45 __ LDA T1 + 0 
5733 : 85 03 __ STA WORK + 0 
5735 : a5 46 __ LDA T1 + 1 
5737 : 85 04 __ STA WORK + 1 
5739 : 20 be 6f JSR $6fbe ; (mul16 + 0)
573c : a5 05 __ LDA WORK + 2 
573e : 85 45 __ STA T1 + 0 
5740 : a5 06 __ LDA WORK + 3 
5742 : 85 46 __ STA T1 + 1 
5744 : a5 47 __ LDA T2 + 0 
5746 : 85 1b __ STA ACCU + 0 
5748 : a5 48 __ LDA T2 + 1 
574a : 85 1c __ STA ACCU + 1 
574c : a5 43 __ LDA T0 + 0 
574e : 85 03 __ STA WORK + 0 
5750 : a5 44 __ LDA T0 + 1 
5752 : 85 04 __ STA WORK + 1 
5754 : 20 be 6f JSR $6fbe ; (mul16 + 0)
5757 : 18 __ __ CLC
5758 : a5 05 __ LDA WORK + 2 
575a : 65 45 __ ADC T1 + 0 
575c : 85 1b __ STA ACCU + 0 
575e : a5 06 __ LDA WORK + 3 
5760 : 65 46 __ ADC T1 + 1 
5762 : 85 1c __ STA ACCU + 1 
5764 : 20 21 74 JSR $7421 ; (divs16@proxy + 0)
5767 : 18 __ __ CLC
5768 : a5 1b __ LDA ACCU + 0 
576a : 69 f0 __ ADC #$f0
576c : a0 00 __ LDY #$00
576e : 91 14 __ STA (P7),y ; (rz + 0)
5770 : a5 1c __ LDA ACCU + 1 
5772 : 69 00 __ ADC #$00
5774 : c8 __ __ INY
5775 : 91 14 __ STA (P7),y ; (rz + 0)
.s3:
5777 : 60 __ __ RTS
--------------------------------------------------------------------
mc_line: ; mc_line(i16,i16,i16,i16,u8)->void
;  89, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5778 : 38 __ __ SEC
5779 : a5 16 __ LDA P9 ; (x1 + 0)
577b : e5 12 __ SBC P5 ; (x0 + 0)
577d : 85 43 __ STA T3 + 0 
577f : a5 17 __ LDA P10 ; (x1 + 1)
5781 : e5 13 __ SBC P6 ; (x0 + 1)
5783 : 85 44 __ STA T3 + 1 
5785 : 10 0d __ BPL $5794 ; (mc_line.s5 + 0)
.s37:
5787 : 38 __ __ SEC
5788 : a9 00 __ LDA #$00
578a : e5 43 __ SBC T3 + 0 
578c : 85 43 __ STA T3 + 0 
578e : a9 00 __ LDA #$00
5790 : e5 44 __ SBC T3 + 1 
5792 : 85 44 __ STA T3 + 1 
.s5:
5794 : ad ea bf LDA $bfea ; (sstack + 0)
5797 : 85 45 __ STA T4 + 0 
5799 : 38 __ __ SEC
579a : e5 14 __ SBC P7 ; (y0 + 0)
579c : 85 47 __ STA T5 + 0 
579e : ad eb bf LDA $bfeb ; (sstack + 1)
57a1 : 85 46 __ STA T4 + 1 
57a3 : e5 15 __ SBC P8 ; (y0 + 1)
57a5 : 85 48 __ STA T5 + 1 
57a7 : 10 0d __ BPL $57b6 ; (mc_line.s6 + 0)
.s36:
57a9 : 38 __ __ SEC
57aa : a9 00 __ LDA #$00
57ac : e5 47 __ SBC T5 + 0 
57ae : 85 47 __ STA T5 + 0 
57b0 : a9 00 __ LDA #$00
57b2 : e5 48 __ SBC T5 + 1 
57b4 : 85 48 __ STA T5 + 1 
.s6:
57b6 : a5 13 __ LDA P6 ; (x0 + 1)
57b8 : c5 17 __ CMP P10 ; (x1 + 1)
57ba : d0 08 __ BNE $57c4 ; (mc_line.s35 + 0)
.s32:
57bc : a5 12 __ LDA P5 ; (x0 + 0)
57be : c5 16 __ CMP P9 ; (x1 + 0)
.s33:
57c0 : 90 08 __ BCC $57ca ; (mc_line.s31 + 0)
57c2 : b0 0e __ BCS $57d2 ; (mc_line.s7 + 0)
.s35:
57c4 : 45 17 __ EOR P10 ; (x1 + 1)
57c6 : 10 f8 __ BPL $57c0 ; (mc_line.s33 + 0)
.s34:
57c8 : 90 08 __ BCC $57d2 ; (mc_line.s7 + 0)
.s31:
57ca : a9 01 __ LDA #$01
57cc : 85 49 __ STA T6 + 0 
57ce : a9 00 __ LDA #$00
57d0 : f0 04 __ BEQ $57d6 ; (mc_line.s8 + 0)
.s7:
57d2 : a9 ff __ LDA #$ff
57d4 : 85 49 __ STA T6 + 0 
.s8:
57d6 : 85 4a __ STA T6 + 1 
57d8 : a5 15 __ LDA P8 ; (y0 + 1)
57da : c5 46 __ CMP T4 + 1 
57dc : d0 08 __ BNE $57e6 ; (mc_line.s30 + 0)
.s27:
57de : a5 14 __ LDA P7 ; (y0 + 0)
57e0 : c5 45 __ CMP T4 + 0 
.s28:
57e2 : 90 08 __ BCC $57ec ; (mc_line.s26 + 0)
57e4 : b0 0e __ BCS $57f4 ; (mc_line.s9 + 0)
.s30:
57e6 : 45 46 __ EOR T4 + 1 
57e8 : 10 f8 __ BPL $57e2 ; (mc_line.s28 + 0)
.s29:
57ea : 90 08 __ BCC $57f4 ; (mc_line.s9 + 0)
.s26:
57ec : a9 01 __ LDA #$01
57ee : 85 4b __ STA T7 + 0 
57f0 : a9 00 __ LDA #$00
57f2 : f0 04 __ BEQ $57f8 ; (mc_line.s10 + 0)
.s9:
57f4 : a9 ff __ LDA #$ff
57f6 : 85 4b __ STA T7 + 0 
.s10:
57f8 : 85 4c __ STA T7 + 1 
57fa : 38 __ __ SEC
57fb : a5 43 __ LDA T3 + 0 
57fd : e5 47 __ SBC T5 + 0 
57ff : 85 4d __ STA T8 + 0 
5801 : a5 44 __ LDA T3 + 1 
5803 : e5 48 __ SBC T5 + 1 
5805 : 85 4e __ STA T8 + 1 
5807 : 38 __ __ SEC
5808 : a9 00 __ LDA #$00
580a : e5 47 __ SBC T5 + 0 
580c : 85 4f __ STA T9 + 0 
580e : a9 00 __ LDA #$00
5810 : e5 48 __ SBC T5 + 1 
5812 : 85 50 __ STA T9 + 1 
.l11:
5814 : a5 12 __ LDA P5 ; (x0 + 0)
5816 : 85 0d __ STA P0 
5818 : a9 01 __ LDA #$01
581a : 85 11 __ STA P4 
581c : a5 13 __ LDA P6 ; (x0 + 1)
581e : 85 0e __ STA P1 
5820 : a5 14 __ LDA P7 ; (y0 + 0)
5822 : 85 0f __ STA P2 
5824 : a5 15 __ LDA P8 ; (y0 + 1)
5826 : 85 10 __ STA P3 
5828 : 20 b3 58 JSR $58b3 ; (mc_setpix.s4 + 0)
582b : a5 13 __ LDA P6 ; (x0 + 1)
582d : c5 17 __ CMP P10 ; (x1 + 1)
582f : d0 12 __ BNE $5843 ; (mc_line.s12 + 0)
.s25:
5831 : a5 12 __ LDA P5 ; (x0 + 0)
5833 : c5 16 __ CMP P9 ; (x1 + 0)
5835 : d0 0c __ BNE $5843 ; (mc_line.s12 + 0)
.s23:
5837 : a5 15 __ LDA P8 ; (y0 + 1)
5839 : c5 46 __ CMP T4 + 1 
583b : d0 06 __ BNE $5843 ; (mc_line.s12 + 0)
.s24:
583d : a5 14 __ LDA P7 ; (y0 + 0)
583f : c5 45 __ CMP T4 + 0 
5841 : f0 63 __ BEQ $58a6 ; (mc_line.s3 + 0)
.s12:
5843 : a5 4d __ LDA T8 + 0 
5845 : 0a __ __ ASL
5846 : 85 1b __ STA ACCU + 0 
5848 : a5 4e __ LDA T8 + 1 
584a : 2a __ __ ROL
584b : 85 1c __ STA ACCU + 1 
584d : a5 50 __ LDA T9 + 1 
584f : c5 1c __ CMP ACCU + 1 
5851 : d0 08 __ BNE $585b ; (mc_line.s22 + 0)
.s19:
5853 : a5 4f __ LDA T9 + 0 
5855 : c5 1b __ CMP ACCU + 0 
.s20:
5857 : 90 08 __ BCC $5861 ; (mc_line.s18 + 0)
5859 : b0 20 __ BCS $587b ; (mc_line.s13 + 0)
.s22:
585b : 45 1c __ EOR ACCU + 1 
585d : 10 f8 __ BPL $5857 ; (mc_line.s20 + 0)
.s21:
585f : 90 1a __ BCC $587b ; (mc_line.s13 + 0)
.s18:
5861 : 18 __ __ CLC
5862 : a5 12 __ LDA P5 ; (x0 + 0)
5864 : 65 49 __ ADC T6 + 0 
5866 : 85 12 __ STA P5 ; (x0 + 0)
5868 : a5 13 __ LDA P6 ; (x0 + 1)
586a : 65 4a __ ADC T6 + 1 
586c : 85 13 __ STA P6 ; (x0 + 1)
586e : 38 __ __ SEC
586f : a5 4d __ LDA T8 + 0 
5871 : e5 47 __ SBC T5 + 0 
5873 : 85 4d __ STA T8 + 0 
5875 : a5 4e __ LDA T8 + 1 
5877 : e5 48 __ SBC T5 + 1 
5879 : 85 4e __ STA T8 + 1 
.s13:
587b : a5 1c __ LDA ACCU + 1 
587d : 30 0a __ BMI $5889 ; (mc_line.s14 + 0)
.s17:
587f : c5 44 __ CMP T3 + 1 
5881 : d0 04 __ BNE $5887 ; (mc_line.s16 + 0)
.s15:
5883 : a5 1b __ LDA ACCU + 0 
5885 : c5 43 __ CMP T3 + 0 
.s16:
5887 : b0 8b __ BCS $5814 ; (mc_line.l11 + 0)
.s14:
5889 : 18 __ __ CLC
588a : a5 14 __ LDA P7 ; (y0 + 0)
588c : 65 4b __ ADC T7 + 0 
588e : 85 14 __ STA P7 ; (y0 + 0)
5890 : a5 15 __ LDA P8 ; (y0 + 1)
5892 : 65 4c __ ADC T7 + 1 
5894 : 85 15 __ STA P8 ; (y0 + 1)
5896 : 18 __ __ CLC
5897 : a5 4d __ LDA T8 + 0 
5899 : 65 43 __ ADC T3 + 0 
589b : 85 4d __ STA T8 + 0 
589d : a5 4e __ LDA T8 + 1 
589f : 65 44 __ ADC T3 + 1 
58a1 : 85 4e __ STA T8 + 1 
58a3 : 4c 14 58 JMP $5814 ; (mc_line.l11 + 0)
.s3:
58a6 : 60 __ __ RTS
--------------------------------------------------------------------
mc_setpix@proxy: ; mc_setpix@proxy
58a7 : a5 46 __ LDA $46 
58a9 : 85 0d __ STA P0 
58ab : a5 47 __ LDA $47 
58ad : 85 0e __ STA P1 
58af : a5 18 __ LDA P11 
58b1 : 85 11 __ STA P4 
--------------------------------------------------------------------
mc_setpix: ; mc_setpix(i16,i16,u8)->void
;  54, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
58b3 : a5 0e __ LDA P1 ; (mx + 1)
58b5 : d0 5e __ BNE $5915 ; (mc_setpix.s3 + 0)
.s9:
58b7 : a5 0d __ LDA P0 ; (mx + 0)
58b9 : c9 a0 __ CMP #$a0
58bb : b0 58 __ BCS $5915 ; (mc_setpix.s3 + 0)
.s5:
58bd : a5 10 __ LDA P3 ; (my + 1)
58bf : d0 54 __ BNE $5915 ; (mc_setpix.s3 + 0)
.s8:
58c1 : a5 0f __ LDA P2 ; (my + 0)
58c3 : c9 c8 __ CMP #$c8
58c5 : b0 4e __ BCS $5915 ; (mc_setpix.s3 + 0)
.s6:
58c7 : a5 0d __ LDA P0 ; (mx + 0)
58c9 : 29 03 __ AND #$03
58cb : 49 03 __ EOR #$03
58cd : 0a __ __ ASL
58ce : 85 1b __ STA ACCU + 0 
58d0 : a5 11 __ LDA P4 ; (col + 0)
58d2 : a6 1b __ LDX ACCU + 0 
58d4 : f0 08 __ BEQ $58de ; (mc_setpix.s7 + 0)
.l10:
58d6 : 0a __ __ ASL
58d7 : ca __ __ DEX
58d8 : d0 fc __ BNE $58d6 ; (mc_setpix.l10 + 0)
.s11:
58da : 85 11 __ STA P4 ; (col + 0)
58dc : a6 1b __ LDX ACCU + 0 
.s7:
58de : a5 0f __ LDA P2 ; (my + 0)
58e0 : 29 07 __ AND #$07
58e2 : 85 1c __ STA ACCU + 1 
58e4 : a5 0f __ LDA P2 ; (my + 0)
58e6 : 4a __ __ LSR
58e7 : 4a __ __ LSR
58e8 : 4a __ __ LSR
58e9 : 85 1b __ STA ACCU + 0 
58eb : 0a __ __ ASL
58ec : 0a __ __ ASL
58ed : 65 1b __ ADC ACCU + 0 
58ef : 4a __ __ LSR
58f0 : 6a __ __ ROR
58f1 : a8 __ __ TAY
58f2 : 29 80 __ AND #$80
58f4 : 6a __ __ ROR
58f5 : 05 1c __ ORA ACCU + 1 
58f7 : 85 1b __ STA ACCU + 0 
58f9 : 98 __ __ TYA
58fa : 29 3f __ AND #$3f
58fc : 85 1c __ STA ACCU + 1 
58fe : a5 0d __ LDA P0 ; (mx + 0)
5900 : 29 fc __ AND #$fc
5902 : 0a __ __ ASL
5903 : a8 __ __ TAY
5904 : a5 1c __ LDA ACCU + 1 
5906 : 69 e0 __ ADC #$e0
5908 : 85 1c __ STA ACCU + 1 
590a : bd 96 73 LDA $7396,x ; (__shltab3L + 0)
590d : 49 ff __ EOR #$ff
590f : 31 1b __ AND (ACCU + 0),y 
5911 : 05 11 __ ORA P4 ; (col + 0)
5913 : 91 1b __ STA (ACCU + 0),y 
.s3:
5915 : 60 __ __ RTS
--------------------------------------------------------------------
draw_shadow: ; draw_shadow(i16,i16,i16,i16)->void
; 174, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5916 : a5 17 __ LDA P10 ; (rx + 1)
5918 : 30 06 __ BMI $5920 ; (draw_shadow.s29 + 0)
.s31:
591a : d0 0c __ BNE $5928 ; (draw_shadow.s5 + 0)
.s30:
591c : a5 16 __ LDA P9 ; (rx + 0)
591e : d0 08 __ BNE $5928 ; (draw_shadow.s5 + 0)
.s29:
5920 : a9 01 __ LDA #$01
5922 : 85 16 __ STA P9 ; (rx + 0)
5924 : a9 00 __ LDA #$00
5926 : 85 17 __ STA P10 ; (rx + 1)
.s5:
5928 : ad eb bf LDA $bfeb ; (sstack + 1)
592b : 30 07 __ BMI $5934 ; (draw_shadow.s26 + 0)
.s28:
592d : d0 0f __ BNE $593e ; (draw_shadow.s6 + 0)
.s27:
592f : ad ea bf LDA $bfea ; (sstack + 0)
5932 : d0 0a __ BNE $593e ; (draw_shadow.s6 + 0)
.s26:
5934 : a9 01 __ LDA #$01
5936 : 8d ea bf STA $bfea ; (sstack + 0)
5939 : a9 00 __ LDA #$00
593b : 8d eb bf STA $bfeb ; (sstack + 1)
.s6:
593e : ad ea bf LDA $bfea ; (sstack + 0)
5941 : 85 48 __ STA T2 + 0 
5943 : 49 ff __ EOR #$ff
5945 : 38 __ __ SEC
5946 : 69 00 __ ADC #$00
5948 : 85 4a __ STA T3 + 0 
594a : a9 00 __ LDA #$00
594c : ed eb bf SBC $bfeb ; (sstack + 1)
594f : 85 4b __ STA T3 + 1 
5951 : ad eb bf LDA $bfeb ; (sstack + 1)
5954 : 85 49 __ STA T2 + 1 
5956 : c5 4b __ CMP T3 + 1 
5958 : d0 07 __ BNE $5961 ; (draw_shadow.s25 + 0)
.s22:
595a : a5 48 __ LDA T2 + 0 
595c : c5 4a __ CMP T3 + 0 
.s23:
595e : b0 08 __ BCS $5968 ; (draw_shadow.s7 + 0)
5960 : 60 __ __ RTS
.s25:
5961 : 45 4b __ EOR T3 + 1 
5963 : 10 f9 __ BPL $595e ; (draw_shadow.s23 + 0)
.s24:
5965 : 90 01 __ BCC $5968 ; (draw_shadow.s7 + 0)
5967 : 60 __ __ RTS
.s7:
5968 : 18 __ __ CLC
5969 : a5 14 __ LDA P7 ; (sy + 0)
596b : 65 4a __ ADC T3 + 0 
596d : 85 4c __ STA T4 + 0 
596f : a5 15 __ LDA P8 ; (sy + 1)
5971 : 65 4b __ ADC T3 + 1 
5973 : 85 4d __ STA T4 + 1 
5975 : a5 48 __ LDA T2 + 0 
5977 : 85 03 __ STA WORK + 0 
5979 : 85 1b __ STA ACCU + 0 
597b : a5 49 __ LDA T2 + 1 
597d : 85 04 __ STA WORK + 1 
597f : 85 1c __ STA ACCU + 1 
5981 : 20 be 6f JSR $6fbe ; (mul16 + 0)
5984 : a5 05 __ LDA WORK + 2 
5986 : 85 4e __ STA T5 + 0 
5988 : a5 06 __ LDA WORK + 3 
598a : 85 4f __ STA T5 + 1 
598c : a5 4d __ LDA T4 + 1 
598e : f0 03 __ BEQ $5993 ; (draw_shadow.l21 + 0)
5990 : 4c 2e 5a JMP $5a2e ; (draw_shadow.l11 + 0)
.l21:
5993 : a5 4c __ LDA T4 + 0 
5995 : c9 c8 __ CMP #$c8
5997 : b0 f7 __ BCS $5990 ; (draw_shadow.s7 + 40)
.s9:
5999 : a5 4a __ LDA T3 + 0 
599b : 85 03 __ STA WORK + 0 
599d : 85 1b __ STA ACCU + 0 
599f : a5 4b __ LDA T3 + 1 
59a1 : 85 04 __ STA WORK + 1 
59a3 : 85 1c __ STA ACCU + 1 
59a5 : 20 be 6f JSR $6fbe ; (mul16 + 0)
59a8 : 38 __ __ SEC
59a9 : a5 4e __ LDA T5 + 0 
59ab : e5 05 __ SBC WORK + 2 
59ad : 85 0d __ STA P0 
59af : a5 4f __ LDA T5 + 1 
59b1 : e5 06 __ SBC WORK + 3 
59b3 : 30 79 __ BMI $5a2e ; (draw_shadow.l11 + 0)
.s10:
59b5 : 85 0e __ STA P1 
59b7 : 20 55 5a JSR $5a55 ; (mc_isqrt.s4 + 0)
59ba : a5 1b __ LDA ACCU + 0 
59bc : 85 03 __ STA WORK + 0 
59be : a5 1c __ LDA ACCU + 1 
59c0 : 85 04 __ STA WORK + 1 
59c2 : a5 16 __ LDA P9 ; (rx + 0)
59c4 : 85 1b __ STA ACCU + 0 
59c6 : a5 17 __ LDA P10 ; (rx + 1)
59c8 : 85 1c __ STA ACCU + 1 
59ca : 20 be 6f JSR $6fbe ; (mul16 + 0)
59cd : a5 05 __ LDA WORK + 2 
59cf : 85 1b __ STA ACCU + 0 
59d1 : a5 06 __ LDA WORK + 3 
59d3 : 85 1c __ STA ACCU + 1 
59d5 : a5 48 __ LDA T2 + 0 
59d7 : 85 03 __ STA WORK + 0 
59d9 : a5 49 __ LDA T2 + 1 
59db : 85 04 __ STA WORK + 1 
59dd : 20 00 70 JSR $7000 ; (divs16 + 0)
59e0 : 18 __ __ CLC
59e1 : a5 12 __ LDA P5 ; (sx + 0)
59e3 : 65 1b __ ADC ACCU + 0 
59e5 : 85 50 __ STA T6 + 0 
59e7 : a5 13 __ LDA P6 ; (sx + 1)
59e9 : 65 1c __ ADC ACCU + 1 
59eb : 85 51 __ STA T6 + 1 
59ed : 38 __ __ SEC
59ee : a5 12 __ LDA P5 ; (sx + 0)
59f0 : e5 1b __ SBC ACCU + 0 
59f2 : 85 47 __ STA T0 + 0 
59f4 : a5 13 __ LDA P6 ; (sx + 1)
59f6 : e5 1c __ SBC ACCU + 1 
59f8 : 85 0e __ STA P1 
59fa : a9 00 __ LDA #$00
59fc : 85 10 __ STA P3 
.l36:
59fe : a5 51 __ LDA T6 + 1 
5a00 : c5 0e __ CMP P1 
5a02 : d0 08 __ BNE $5a0c ; (draw_shadow.s20 + 0)
.s17:
5a04 : a5 50 __ LDA T6 + 0 
5a06 : c5 47 __ CMP T0 + 0 
.s18:
5a08 : b0 08 __ BCS $5a12 ; (draw_shadow.s16 + 0)
5a0a : 90 22 __ BCC $5a2e ; (draw_shadow.l11 + 0)
.s20:
5a0c : 45 0e __ EOR P1 
5a0e : 10 f8 __ BPL $5a08 ; (draw_shadow.s18 + 0)
.s19:
5a10 : b0 1c __ BCS $5a2e ; (draw_shadow.l11 + 0)
.s16:
5a12 : a5 47 __ LDA T0 + 0 
5a14 : 85 0d __ STA P0 
5a16 : a5 4c __ LDA T4 + 0 
5a18 : 85 0f __ STA P2 
5a1a : a9 03 __ LDA #$03
5a1c : 85 11 __ STA P4 
5a1e : 20 b3 58 JSR $58b3 ; (mc_setpix.s4 + 0)
5a21 : 18 __ __ CLC
5a22 : a5 0d __ LDA P0 
5a24 : 69 02 __ ADC #$02
5a26 : 85 47 __ STA T0 + 0 
5a28 : 90 d4 __ BCC $59fe ; (draw_shadow.l36 + 0)
.s37:
5a2a : e6 0e __ INC P1 
5a2c : b0 d0 __ BCS $59fe ; (draw_shadow.l36 + 0)
.l11:
5a2e : e6 4c __ INC T4 + 0 
5a30 : d0 02 __ BNE $5a34 ; (draw_shadow.s33 + 0)
.s32:
5a32 : e6 4d __ INC T4 + 1 
.s33:
5a34 : e6 4a __ INC T3 + 0 
5a36 : d0 02 __ BNE $5a3a ; (draw_shadow.s35 + 0)
.s34:
5a38 : e6 4b __ INC T3 + 1 
.s35:
5a3a : a5 49 __ LDA T2 + 1 
5a3c : c5 4b __ CMP T3 + 1 
5a3e : d0 07 __ BNE $5a47 ; (draw_shadow.s15 + 0)
.s12:
5a40 : a5 48 __ LDA T2 + 0 
5a42 : c5 4a __ CMP T3 + 0 
.s13:
5a44 : b0 07 __ BCS $5a4d ; (draw_shadow.s8 + 0)
5a46 : 60 __ __ RTS
.s15:
5a47 : 45 4b __ EOR T3 + 1 
5a49 : 10 f9 __ BPL $5a44 ; (draw_shadow.s13 + 0)
.s14:
5a4b : b0 07 __ BCS $5a54 ; (draw_shadow.s3 + 0)
.s8:
5a4d : a5 4d __ LDA T4 + 1 
5a4f : d0 dd __ BNE $5a2e ; (draw_shadow.l11 + 0)
5a51 : 4c 93 59 JMP $5993 ; (draw_shadow.l21 + 0)
.s3:
5a54 : 60 __ __ RTS
--------------------------------------------------------------------
mc_isqrt: ; mc_isqrt(u16)->i16
;  39, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5a55 : a5 0e __ LDA P1 ; (n + 1)
5a57 : 05 0d __ ORA P0 ; (n + 0)
5a59 : d0 05 __ BNE $5a60 ; (mc_isqrt.s5 + 0)
.s10:
5a5b : 85 1b __ STA ACCU + 0 
.s3:
5a5d : 85 1c __ STA ACCU + 1 
5a5f : 60 __ __ RTS
.s5:
5a60 : a5 0e __ LDA P1 ; (n + 1)
5a62 : 4a __ __ LSR
5a63 : 85 44 __ STA T1 + 1 
5a65 : a5 0d __ LDA P0 ; (n + 0)
5a67 : 6a __ __ ROR
5a68 : 85 43 __ STA T1 + 0 
5a6a : 05 44 __ ORA T1 + 1 
5a6c : d0 06 __ BNE $5a74 ; (mc_isqrt.l6 + 0)
.s9:
5a6e : a2 01 __ LDX #$01
5a70 : 86 1b __ STX ACCU + 0 
5a72 : d0 e9 __ BNE $5a5d ; (mc_isqrt.s3 + 0)
.l6:
5a74 : a5 43 __ LDA T1 + 0 
5a76 : 85 03 __ STA WORK + 0 
5a78 : 85 45 __ STA T2 + 0 
5a7a : a5 44 __ LDA T1 + 1 
5a7c : 85 04 __ STA WORK + 1 
5a7e : 85 46 __ STA T2 + 1 
5a80 : a5 0d __ LDA P0 ; (n + 0)
5a82 : 85 1b __ STA ACCU + 0 
5a84 : a5 0e __ LDA P1 ; (n + 1)
5a86 : 85 1c __ STA ACCU + 1 
5a88 : 20 3b 70 JSR $703b ; (divmod + 0)
5a8b : 18 __ __ CLC
5a8c : a5 1b __ LDA ACCU + 0 
5a8e : 65 43 __ ADC T1 + 0 
5a90 : 85 43 __ STA T1 + 0 
5a92 : a5 1c __ LDA ACCU + 1 
5a94 : 65 44 __ ADC T1 + 1 
5a96 : 4a __ __ LSR
5a97 : 85 44 __ STA T1 + 1 
5a99 : 66 43 __ ROR T1 + 0 
5a9b : c5 46 __ CMP T2 + 1 
5a9d : 90 d5 __ BCC $5a74 ; (mc_isqrt.l6 + 0)
.s11:
5a9f : d0 06 __ BNE $5aa7 ; (mc_isqrt.s7 + 0)
.s8:
5aa1 : a5 43 __ LDA T1 + 0 
5aa3 : c5 45 __ CMP T2 + 0 
5aa5 : 90 cd __ BCC $5a74 ; (mc_isqrt.l6 + 0)
.s7:
5aa7 : a5 45 __ LDA T2 + 0 
5aa9 : 85 1b __ STA ACCU + 0 
5aab : a5 46 __ LDA T2 + 1 
5aad : b0 ae __ BCS $5a5d ; (mc_isqrt.s3 + 0)
--------------------------------------------------------------------
draw_ball: ; draw_ball(i16,i16,u8,i16)->void
; 199, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s1:
5aaf : a2 1c __ LDX #$1c
5ab1 : b5 53 __ LDA T3 + 0,x 
5ab3 : 9d c3 bf STA $bfc3,x ; (draw_ball@stack + 0)
5ab6 : ca __ __ DEX
5ab7 : 10 f8 __ BPL $5ab1 ; (draw_ball.s1 + 2)
.s4:
5ab9 : ad f0 bf LDA $bff0 ; (sstack + 6)
5abc : 30 09 __ BMI $5ac7 ; (draw_ball.s82 + 0)
.s84:
5abe : d0 11 __ BNE $5ad1 ; (draw_ball.s5 + 0)
.s83:
5ac0 : ad ef bf LDA $bfef ; (sstack + 5)
5ac3 : c9 03 __ CMP #$03
5ac5 : b0 0a __ BCS $5ad1 ; (draw_ball.s5 + 0)
.s82:
5ac7 : a9 03 __ LDA #$03
5ac9 : 8d ef bf STA $bfef ; (sstack + 5)
5acc : a9 00 __ LDA #$00
5ace : 8d f0 bf STA $bff0 ; (sstack + 6)
.s5:
5ad1 : ad ef bf LDA $bfef ; (sstack + 5)
5ad4 : 85 5d __ STA T9 + 0 
5ad6 : 0a __ __ ASL
5ad7 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5ad9 : ad f0 bf LDA $bff0 ; (sstack + 6)
5adc : 85 5e __ STA T9 + 1 
5ade : 2a __ __ ROL
5adf : 06 1b __ ASL ACCU + 0 ; (cy + 0)
5ae1 : 2a __ __ ROL
5ae2 : aa __ __ TAX
5ae3 : 18 __ __ CLC
5ae4 : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5ae6 : 65 5d __ ADC T9 + 0 
5ae8 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5aea : 8a __ __ TXA
5aeb : 65 5e __ ADC T9 + 1 
5aed : 85 1c __ STA ACCU + 1 ; (cy + 1)
5aef : a9 00 __ LDA #$00
5af1 : 85 04 __ STA WORK + 1 
5af3 : 20 1a 74 JSR $741a ; (divs16@proxy + 0)
5af6 : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5af8 : 85 5f __ STA T10 + 0 
5afa : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5afc : 85 60 __ STA T10 + 1 
5afe : 38 __ __ SEC
5aff : a9 00 __ LDA #$00
5b01 : e5 1b __ SBC ACCU + 0 ; (cy + 0)
5b03 : 85 61 __ STA T11 + 0 
5b05 : a9 00 __ LDA #$00
5b07 : 85 04 __ STA WORK + 1 
5b09 : e5 1c __ SBC ACCU + 1 ; (cy + 1)
5b0b : 85 62 __ STA T11 + 1 
5b0d : a5 5d __ LDA T9 + 0 
5b0f : 0a __ __ ASL
5b10 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5b12 : a5 5e __ LDA T9 + 1 
5b14 : 2a __ __ ROL
5b15 : 06 1b __ ASL ACCU + 0 ; (cy + 0)
5b17 : 2a __ __ ROL
5b18 : 06 1b __ ASL ACCU + 0 ; (cy + 0)
5b1a : 2a __ __ ROL
5b1b : aa __ __ TAX
5b1c : 18 __ __ CLC
5b1d : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5b1f : 65 5d __ ADC T9 + 0 
5b21 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5b23 : 8a __ __ TXA
5b24 : 65 5e __ ADC T9 + 1 
5b26 : 85 1c __ STA ACCU + 1 ; (cy + 1)
5b28 : 20 1a 74 JSR $741a ; (divs16@proxy + 0)
5b2b : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5b2d : 85 63 __ STA T12 + 0 
5b2f : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5b31 : 85 64 __ STA T12 + 1 
5b33 : 38 __ __ SEC
5b34 : a9 00 __ LDA #$00
5b36 : e5 1b __ SBC ACCU + 0 ; (cy + 0)
5b38 : 85 65 __ STA T13 + 0 
5b3a : a9 00 __ LDA #$00
5b3c : e5 1c __ SBC ACCU + 1 ; (cy + 1)
5b3e : 85 66 __ STA T13 + 1 
5b40 : a5 5d __ LDA T9 + 0 
5b42 : 85 03 __ STA WORK + 0 
5b44 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5b46 : a5 5e __ LDA T9 + 1 
5b48 : 85 04 __ STA WORK + 1 
5b4a : 85 1c __ STA ACCU + 1 ; (cy + 1)
5b4c : 20 be 6f JSR $6fbe ; (mul16 + 0)
5b4f : a5 05 __ LDA WORK + 2 
5b51 : 85 67 __ STA T14 + 0 
5b53 : a5 06 __ LDA WORK + 3 
5b55 : 85 68 __ STA T14 + 1 
5b57 : 38 __ __ SEC
5b58 : a9 00 __ LDA #$00
5b5a : e5 5d __ SBC T9 + 0 
5b5c : 85 69 __ STA T15 + 0 
5b5e : a9 00 __ LDA #$00
5b60 : e5 5e __ SBC T9 + 1 
5b62 : 85 6a __ STA T15 + 1 
5b64 : a5 5e __ LDA T9 + 1 
5b66 : c5 6a __ CMP T15 + 1 
5b68 : d0 09 __ BNE $5b73 ; (draw_ball.s10 + 0)
.s7:
5b6a : a5 5d __ LDA T9 + 0 
5b6c : c5 69 __ CMP T15 + 0 
.s8:
5b6e : a9 00 __ LDA #$00
5b70 : 2a __ __ ROL
5b71 : 90 09 __ BCC $5b7c ; (draw_ball.s6 + 0)
.s10:
5b73 : 45 6a __ EOR T15 + 1 
5b75 : 10 f7 __ BPL $5b6e ; (draw_ball.s8 + 0)
.s9:
5b77 : a9 00 __ LDA #$00
5b79 : 2a __ __ ROL
5b7a : 49 01 __ EOR #$01
.s6:
5b7c : 85 6f __ STA T20 + 0 
5b7e : d0 03 __ BNE $5b83 ; (draw_ball.s32 + 0)
5b80 : 4c 82 5d JMP $5d82 ; (draw_ball.s11 + 0)
.s32:
5b83 : ad ec bf LDA $bfec ; (sstack + 2)
5b86 : 18 __ __ CLC
5b87 : 65 69 __ ADC T15 + 0 
5b89 : 85 6b __ STA T16 + 0 
5b8b : a5 69 __ LDA T15 + 0 
5b8d : 85 6d __ STA T17 + 0 
5b8f : a5 6a __ LDA T15 + 1 
5b91 : 85 6e __ STA T17 + 1 
5b93 : 6d ed bf ADC $bfed ; (sstack + 3)
5b96 : 85 6c __ STA T16 + 1 
5b98 : f0 03 __ BEQ $5b9d ; (draw_ball.l81 + 0)
5b9a : 4c 5b 5d JMP $5d5b ; (draw_ball.l50 + 0)
.l81:
5b9d : a5 6b __ LDA T16 + 0 
5b9f : c9 c8 __ CMP #$c8
5ba1 : b0 f7 __ BCS $5b9a ; (draw_ball.s32 + 23)
.s34:
5ba3 : a5 6d __ LDA T17 + 0 
5ba5 : 85 03 __ STA WORK + 0 
5ba7 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5ba9 : a5 6e __ LDA T17 + 1 
5bab : 85 04 __ STA WORK + 1 
5bad : 85 1c __ STA ACCU + 1 ; (cy + 1)
5baf : 20 be 6f JSR $6fbe ; (mul16 + 0)
5bb2 : 38 __ __ SEC
5bb3 : a5 67 __ LDA T14 + 0 
5bb5 : e5 05 __ SBC WORK + 2 
5bb7 : 85 0d __ STA P0 
5bb9 : a5 68 __ LDA T14 + 1 
5bbb : e5 06 __ SBC WORK + 3 
5bbd : 30 db __ BMI $5b9a ; (draw_ball.s32 + 23)
.s80:
5bbf : 85 0e __ STA P1 
5bc1 : 05 0d __ ORA P0 
5bc3 : f0 d5 __ BEQ $5b9a ; (draw_ball.s32 + 23)
.s35:
5bc5 : 20 55 5a JSR $5a55 ; (mc_isqrt.s4 + 0)
5bc8 : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5bca : 85 43 __ STA T0 + 0 
5bcc : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5bce : 85 44 __ STA T0 + 1 
5bd0 : a5 6e __ LDA T17 + 1 
5bd2 : c5 66 __ CMP T13 + 1 
5bd4 : d0 08 __ BNE $5bde ; (draw_ball.s79 + 0)
.s76:
5bd6 : a5 6d __ LDA T17 + 0 
5bd8 : c5 65 __ CMP T13 + 0 
.s77:
5bda : 90 08 __ BCC $5be4 ; (draw_ball.s75 + 0)
5bdc : b0 1e __ BCS $5bfc ; (draw_ball.s36 + 0)
.s79:
5bde : 45 66 __ EOR T13 + 1 
5be0 : 10 f8 __ BPL $5bda ; (draw_ball.s77 + 0)
.s78:
5be2 : 90 18 __ BCC $5bfc ; (draw_ball.s36 + 0)
.s75:
5be4 : a9 00 __ LDA #$00
.s41:
5be6 : 85 47 __ STA T18 + 0 
5be8 : ad ea bf LDA $bfea ; (sstack + 0)
5beb : 85 53 __ STA T3 + 0 
5bed : a9 00 __ LDA #$00
5bef : 85 51 __ STA T2 + 0 
5bf1 : ad eb bf LDA $bfeb ; (sstack + 1)
5bf4 : 85 54 __ STA T3 + 1 
5bf6 : ad ee bf LDA $bfee ; (sstack + 4)
5bf9 : 4c 48 5c JMP $5c48 ; (draw_ball.l86 + 0)
.s36:
5bfc : a5 6e __ LDA T17 + 1 
5bfe : c5 62 __ CMP T11 + 1 
5c00 : d0 08 __ BNE $5c0a ; (draw_ball.s74 + 0)
.s71:
5c02 : a5 6d __ LDA T17 + 0 
5c04 : c5 61 __ CMP T11 + 0 
.s72:
5c06 : 90 08 __ BCC $5c10 ; (draw_ball.s70 + 0)
5c08 : b0 0a __ BCS $5c14 ; (draw_ball.s37 + 0)
.s74:
5c0a : 45 62 __ EOR T11 + 1 
5c0c : 10 f8 __ BPL $5c06 ; (draw_ball.s72 + 0)
.s73:
5c0e : 90 04 __ BCC $5c14 ; (draw_ball.s37 + 0)
.s70:
5c10 : a9 01 __ LDA #$01
5c12 : d0 d2 __ BNE $5be6 ; (draw_ball.s41 + 0)
.s37:
5c14 : 24 6e __ BIT T17 + 1 
5c16 : 10 04 __ BPL $5c1c ; (draw_ball.s38 + 0)
.s69:
5c18 : a9 02 __ LDA #$02
5c1a : d0 ca __ BNE $5be6 ; (draw_ball.s41 + 0)
.s38:
5c1c : 24 60 __ BIT T10 + 1 
5c1e : 30 10 __ BMI $5c30 ; (draw_ball.s39 + 0)
.s68:
5c20 : a5 6e __ LDA T17 + 1 
5c22 : c5 60 __ CMP T10 + 1 
5c24 : d0 04 __ BNE $5c2a ; (draw_ball.s67 + 0)
.s66:
5c26 : a5 6d __ LDA T17 + 0 
5c28 : c5 5f __ CMP T10 + 0 
.s67:
5c2a : b0 04 __ BCS $5c30 ; (draw_ball.s39 + 0)
.s65:
5c2c : a9 03 __ LDA #$03
5c2e : 90 b6 __ BCC $5be6 ; (draw_ball.s41 + 0)
.s39:
5c30 : 24 64 __ BIT T12 + 1 
5c32 : 30 10 __ BMI $5c44 ; (draw_ball.s40 + 0)
.s64:
5c34 : a5 6e __ LDA T17 + 1 
5c36 : c5 64 __ CMP T12 + 1 
5c38 : d0 04 __ BNE $5c3e ; (draw_ball.s63 + 0)
.s62:
5c3a : a5 6d __ LDA T17 + 0 
5c3c : c5 63 __ CMP T12 + 0 
.s63:
5c3e : b0 04 __ BCS $5c44 ; (draw_ball.s40 + 0)
.s61:
5c40 : a9 04 __ LDA #$04
5c42 : 90 a2 __ BCC $5be6 ; (draw_ball.s41 + 0)
.s40:
5c44 : a9 05 __ LDA #$05
5c46 : d0 9e __ BNE $5be6 ; (draw_ball.s41 + 0)
.l86:
5c48 : 85 4f __ STA T1 + 0 
5c4a : 18 __ __ CLC
5c4b : 69 10 __ ADC #$10
5c4d : 29 3f __ AND #$3f
5c4f : aa __ __ TAX
5c50 : bd 00 78 LDA $7800,x ; (sin64[0] + 0)
5c53 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5c55 : 29 80 __ AND #$80
5c57 : 10 02 __ BPL $5c5b ; (draw_ball.l86 + 19)
5c59 : a9 ff __ LDA #$ff
5c5b : 85 1c __ STA ACCU + 1 ; (cy + 1)
5c5d : a5 43 __ LDA T0 + 0 
5c5f : 85 03 __ STA WORK + 0 
5c61 : a5 44 __ LDA T0 + 1 
5c63 : 85 04 __ STA WORK + 1 
5c65 : 20 be 6f JSR $6fbe ; (mul16 + 0)
5c68 : 20 07 74 JSR $7407 ; (divs16@proxy + 0)
5c6b : 18 __ __ CLC
5c6c : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5c6e : 65 53 __ ADC T3 + 0 
5c70 : a6 51 __ LDX T2 + 0 
5c72 : e8 __ __ INX
5c73 : e8 __ __ INX
5c74 : 86 51 __ STX T2 + 0 
5c76 : 9d 20 87 STA $8720,x ; (modplay.channel[0] + 198)
5c79 : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5c7b : 65 54 __ ADC T3 + 1 
5c7d : 9d 21 87 STA $8721,x ; (modplay.channel[0] + 199)
5c80 : 18 __ __ CLC
5c81 : a5 4f __ LDA T1 + 0 
5c83 : 69 10 __ ADC #$10
5c85 : e0 08 __ CPX #$08
5c87 : d0 bf __ BNE $5c48 ; (draw_ball.l86 + 0)
.s42:
5c89 : a9 00 __ LDA #$00
5c8b : 85 4f __ STA T1 + 0 
.l43:
5c8d : a4 4f __ LDY T1 + 0 
5c8f : c8 __ __ INY
5c90 : 84 55 __ STY T4 + 0 
5c92 : 0a __ __ ASL
5c93 : 85 57 __ STA T5 + 0 
.l85:
5c95 : a5 55 __ LDA T4 + 0 
5c97 : 0a __ __ ASL
5c98 : 85 59 __ STA T6 + 0 
5c9a : aa __ __ TAX
5c9b : bd 22 87 LDA $8722,x ; (mx[0] + 0)
5c9e : 85 5b __ STA T7 + 0 
5ca0 : bd 23 87 LDA $8723,x ; (mx[0] + 1)
5ca3 : 85 5c __ STA T7 + 1 
5ca5 : a6 57 __ LDX T5 + 0 
5ca7 : bd 22 87 LDA $8722,x ; (mx[0] + 0)
5caa : 85 45 __ STA T8 + 0 
5cac : bd 23 87 LDA $8723,x ; (mx[0] + 1)
5caf : 85 46 __ STA T8 + 1 
5cb1 : a5 5c __ LDA T7 + 1 
5cb3 : c5 46 __ CMP T8 + 1 
5cb5 : d0 08 __ BNE $5cbf ; (draw_ball.s60 + 0)
.s57:
5cb7 : a5 5b __ LDA T7 + 0 
5cb9 : c5 45 __ CMP T8 + 0 
.s58:
5cbb : 90 08 __ BCC $5cc5 ; (draw_ball.s56 + 0)
5cbd : b0 1c __ BCS $5cdb ; (draw_ball.s44 + 0)
.s60:
5cbf : 45 46 __ EOR T8 + 1 
5cc1 : 10 f8 __ BPL $5cbb ; (draw_ball.s58 + 0)
.s59:
5cc3 : 90 16 __ BCC $5cdb ; (draw_ball.s44 + 0)
.s56:
5cc5 : a5 5b __ LDA T7 + 0 
5cc7 : 9d 22 87 STA $8722,x ; (mx[0] + 0)
5cca : a5 5c __ LDA T7 + 1 
5ccc : 9d 23 87 STA $8723,x ; (mx[0] + 1)
5ccf : a5 45 __ LDA T8 + 0 
5cd1 : a6 59 __ LDX T6 + 0 
5cd3 : 9d 22 87 STA $8722,x ; (mx[0] + 0)
5cd6 : a5 46 __ LDA T8 + 1 
5cd8 : 9d 23 87 STA $8723,x ; (mx[0] + 1)
.s44:
5cdb : e6 55 __ INC T4 + 0 
5cdd : c8 __ __ INY
5cde : c0 04 __ CPY #$04
5ce0 : 90 b3 __ BCC $5c95 ; (draw_ball.l85 + 0)
.s45:
5ce2 : e6 4f __ INC T1 + 0 
5ce4 : a5 4f __ LDA T1 + 0 
5ce6 : c9 03 __ CMP #$03
5ce8 : d0 a3 __ BNE $5c8d ; (draw_ball.l43 + 0)
.s46:
5cea : a5 53 __ LDA T3 + 0 
5cec : e5 43 __ SBC T0 + 0 
5cee : 85 4f __ STA T1 + 0 
5cf0 : a5 54 __ LDA T3 + 1 
5cf2 : e5 44 __ SBC T0 + 1 
5cf4 : 85 50 __ STA T1 + 1 
5cf6 : 18 __ __ CLC
5cf7 : a5 53 __ LDA T3 + 0 
5cf9 : 65 43 __ ADC T0 + 0 
5cfb : 85 51 __ STA T2 + 0 
5cfd : a5 54 __ LDA T3 + 1 
5cff : 65 44 __ ADC T0 + 1 
5d01 : 85 52 __ STA T2 + 1 
5d03 : a5 47 __ LDA T18 + 0 
5d05 : 85 53 __ STA T3 + 0 
5d07 : a9 00 __ LDA #$00
5d09 : 85 57 __ STA T5 + 0 
5d0b : 85 55 __ STA T4 + 0 
5d0d : 85 13 __ STA P6 
5d0f : a5 6b __ LDA T16 + 0 
5d11 : 85 12 __ STA P5 
.l47:
5d13 : a5 4f __ LDA T1 + 0 
5d15 : 85 14 __ STA P7 
5d17 : a5 50 __ LDA T1 + 1 
5d19 : 85 15 __ STA P8 
5d1b : a5 57 __ LDA T5 + 0 
5d1d : c9 04 __ CMP #$04
5d1f : b0 0a __ BCS $5d2b ; (draw_ball.s48 + 0)
.s55:
5d21 : a4 55 __ LDY T4 + 0 
5d23 : b9 23 87 LDA $8723,y ; (mx[0] + 1)
5d26 : be 22 87 LDX $8722,y ; (mx[0] + 0)
5d29 : 90 04 __ BCC $5d2f ; (draw_ball.s49 + 0)
.s48:
5d2b : a5 52 __ LDA T2 + 1 
5d2d : a6 51 __ LDX T2 + 0 
.s49:
5d2f : 86 16 __ STX P9 
5d31 : 85 17 __ STA P10 
5d33 : 8a __ __ TXA
5d34 : 18 __ __ CLC
5d35 : 69 01 __ ADC #$01
5d37 : 85 4f __ STA T1 + 0 
5d39 : a5 17 __ LDA P10 
5d3b : 69 00 __ ADC #$00
5d3d : 85 50 __ STA T1 + 1 
5d3f : a5 53 __ LDA T3 + 0 
5d41 : 4a __ __ LSR
5d42 : a9 02 __ LDA #$02
5d44 : b0 02 __ BCS $5d48 ; (draw_ball.s96 + 0)
.s95:
5d46 : a9 01 __ LDA #$01
.s96:
5d48 : 85 18 __ STA P11 
5d4a : 20 0a 5f JSR $5f0a ; (mc_hspan.s4 + 0)
5d4d : e6 53 __ INC T3 + 0 
5d4f : e6 55 __ INC T4 + 0 
5d51 : e6 55 __ INC T4 + 0 
5d53 : e6 57 __ INC T5 + 0 
5d55 : a5 57 __ LDA T5 + 0 
5d57 : c9 05 __ CMP #$05
5d59 : 90 b8 __ BCC $5d13 ; (draw_ball.l47 + 0)
.l50:
5d5b : e6 6b __ INC T16 + 0 
5d5d : d0 02 __ BNE $5d61 ; (draw_ball.s88 + 0)
.s87:
5d5f : e6 6c __ INC T16 + 1 
.s88:
5d61 : e6 6d __ INC T17 + 0 
5d63 : d0 02 __ BNE $5d67 ; (draw_ball.s90 + 0)
.s89:
5d65 : e6 6e __ INC T17 + 1 
.s90:
5d67 : a5 5e __ LDA T9 + 1 
5d69 : c5 6e __ CMP T17 + 1 
5d6b : d0 08 __ BNE $5d75 ; (draw_ball.s54 + 0)
.s51:
5d6d : a5 5d __ LDA T9 + 0 
5d6f : c5 6d __ CMP T17 + 0 
.s52:
5d71 : b0 08 __ BCS $5d7b ; (draw_ball.s33 + 0)
5d73 : 90 0d __ BCC $5d82 ; (draw_ball.s11 + 0)
.s54:
5d75 : 45 6e __ EOR T17 + 1 
5d77 : 10 f8 __ BPL $5d71 ; (draw_ball.s52 + 0)
.s53:
5d79 : b0 07 __ BCS $5d82 ; (draw_ball.s11 + 0)
.s33:
5d7b : a5 6c __ LDA T16 + 1 
5d7d : d0 dc __ BNE $5d5b ; (draw_ball.l50 + 0)
5d7f : 4c 9d 5b JMP $5b9d ; (draw_ball.l81 + 0)
.s11:
5d82 : a5 65 __ LDA T13 + 0 
5d84 : 8d e0 bf STA $bfe0 ; (lats[0] + 0)
5d87 : a5 66 __ LDA T13 + 1 
5d89 : 8d e1 bf STA $bfe1 ; (lats[0] + 1)
5d8c : a5 61 __ LDA T11 + 0 
5d8e : 8d e2 bf STA $bfe2 ; (lats[0] + 2)
5d91 : a5 62 __ LDA T11 + 1 
5d93 : 8d e3 bf STA $bfe3 ; (lats[0] + 3)
5d96 : a9 00 __ LDA #$00
5d98 : 8d e4 bf STA $bfe4 ; (lats[0] + 4)
5d9b : 8d e5 bf STA $bfe5 ; (lats[0] + 5)
5d9e : 85 53 __ STA T3 + 0 
5da0 : a6 5f __ LDX T10 + 0 
5da2 : 8e e6 bf STX $bfe6 ; (lats[0] + 6)
5da5 : a6 60 __ LDX T10 + 1 
5da7 : 8e e7 bf STX $bfe7 ; (lats[0] + 7)
5daa : a6 63 __ LDX T12 + 0 
5dac : 8e e8 bf STX $bfe8 ; (lats[0] + 8)
5daf : a6 64 __ LDX T12 + 1 
5db1 : 8e e9 bf STX $bfe9 ; (lats[0] + 9)
5db4 : ae ec bf LDX $bfec ; (sstack + 2)
5db7 : 86 55 __ STX T4 + 0 
5db9 : ae ed bf LDX $bfed ; (sstack + 3)
5dbc : 86 56 __ STX T4 + 1 
.l12:
5dbe : 0a __ __ ASL
5dbf : a8 __ __ TAY
5dc0 : b9 e0 bf LDA $bfe0,y ; (lats[0] + 0)
5dc3 : 18 __ __ CLC
5dc4 : 65 55 __ ADC T4 + 0 
5dc6 : 85 4f __ STA T1 + 0 
5dc8 : b9 e1 bf LDA $bfe1,y ; (lats[0] + 1)
5dcb : 65 56 __ ADC T4 + 1 
5dcd : d0 58 __ BNE $5e27 ; (draw_ball.s15 + 0)
.s31:
5dcf : a5 4f __ LDA T1 + 0 
5dd1 : c9 c8 __ CMP #$c8
5dd3 : b0 52 __ BCS $5e27 ; (draw_ball.s15 + 0)
.s13:
5dd5 : b9 e0 bf LDA $bfe0,y ; (lats[0] + 0)
5dd8 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5dda : 85 03 __ STA WORK + 0 
5ddc : b9 e1 bf LDA $bfe1,y ; (lats[0] + 1)
5ddf : 85 1c __ STA ACCU + 1 ; (cy + 1)
5de1 : 85 04 __ STA WORK + 1 
5de3 : 20 be 6f JSR $6fbe ; (mul16 + 0)
5de6 : 38 __ __ SEC
5de7 : a5 67 __ LDA T14 + 0 
5de9 : e5 05 __ SBC WORK + 2 
5deb : 85 0d __ STA P0 
5ded : a5 68 __ LDA T14 + 1 
5def : e5 06 __ SBC WORK + 3 
5df1 : 30 34 __ BMI $5e27 ; (draw_ball.s15 + 0)
.s30:
5df3 : 85 0e __ STA P1 
5df5 : 05 0d __ ORA P0 
5df7 : f0 2e __ BEQ $5e27 ; (draw_ball.s15 + 0)
.s14:
5df9 : 20 55 5a JSR $5a55 ; (mc_isqrt.s4 + 0)
5dfc : a5 4f __ LDA T1 + 0 
5dfe : 85 12 __ STA P5 
5e00 : a9 00 __ LDA #$00
5e02 : 85 13 __ STA P6 
5e04 : 85 18 __ STA P11 
5e06 : ad ea bf LDA $bfea ; (sstack + 0)
5e09 : 18 __ __ CLC
5e0a : 65 1b __ ADC ACCU + 0 ; (cy + 0)
5e0c : 85 16 __ STA P9 
5e0e : ad eb bf LDA $bfeb ; (sstack + 1)
5e11 : 65 1c __ ADC ACCU + 1 ; (cy + 1)
5e13 : 85 17 __ STA P10 
5e15 : ad ea bf LDA $bfea ; (sstack + 0)
5e18 : 38 __ __ SEC
5e19 : e5 1b __ SBC ACCU + 0 ; (cy + 0)
5e1b : 85 14 __ STA P7 
5e1d : ad eb bf LDA $bfeb ; (sstack + 1)
5e20 : e5 1c __ SBC ACCU + 1 ; (cy + 1)
5e22 : 85 15 __ STA P8 
5e24 : 20 0a 5f JSR $5f0a ; (mc_hspan.s4 + 0)
.s15:
5e27 : e6 53 __ INC T3 + 0 
5e29 : a5 53 __ LDA T3 + 0 
5e2b : c9 05 __ CMP #$05
5e2d : d0 8f __ BNE $5dbe ; (draw_ball.l12 + 0)
.s16:
5e2f : a5 6f __ LDA T20 + 0 
5e31 : d0 0b __ BNE $5e3e ; (draw_ball.s17 + 0)
.s3:
5e33 : a2 1c __ LDX #$1c
5e35 : bd c3 bf LDA $bfc3,x ; (draw_ball@stack + 0)
5e38 : 95 53 __ STA T3 + 0,x 
5e3a : ca __ __ DEX
5e3b : 10 f8 __ BPL $5e35 ; (draw_ball.s3 + 2)
5e3d : 60 __ __ RTS
.s17:
5e3e : ad ee bf LDA $bfee ; (sstack + 4)
5e41 : 85 51 __ STA T2 + 0 
5e43 : a9 04 __ LDA #$04
5e45 : 85 5b __ STA T7 + 0 
.l18:
5e47 : 18 __ __ CLC
5e48 : a5 55 __ LDA T4 + 0 
5e4a : 65 69 __ ADC T15 + 0 
5e4c : 85 53 __ STA T3 + 0 
5e4e : a5 56 __ LDA T4 + 1 
5e50 : 65 6a __ ADC T15 + 1 
5e52 : 85 54 __ STA T3 + 1 
5e54 : a5 69 __ LDA T15 + 0 
5e56 : 85 57 __ STA T5 + 0 
5e58 : a5 6a __ LDA T15 + 1 
5e5a : 85 58 __ STA T5 + 1 
5e5c : 18 __ __ CLC
5e5d : a5 51 __ LDA T2 + 0 
5e5f : 69 10 __ ADC #$10
5e61 : 29 3f __ AND #$3f
5e63 : aa __ __ TAX
5e64 : bd 00 78 LDA $7800,x ; (sin64[0] + 0)
5e67 : 85 59 __ STA T6 + 0 
5e69 : 29 80 __ AND #$80
5e6b : 10 02 __ BPL $5e6f ; (draw_ball.l18 + 40)
5e6d : a9 ff __ LDA #$ff
5e6f : 85 5a __ STA T6 + 1 
5e71 : a5 54 __ LDA T3 + 1 
5e73 : d0 5d __ BNE $5ed2 ; (draw_ball.l22 + 0)
.l29:
5e75 : a5 53 __ LDA T3 + 0 
5e77 : c9 c8 __ CMP #$c8
5e79 : b0 57 __ BCS $5ed2 ; (draw_ball.l22 + 0)
.s20:
5e7b : a5 57 __ LDA T5 + 0 
5e7d : 85 03 __ STA WORK + 0 
5e7f : 85 1b __ STA ACCU + 0 ; (cy + 0)
5e81 : a5 58 __ LDA T5 + 1 
5e83 : 85 04 __ STA WORK + 1 
5e85 : 85 1c __ STA ACCU + 1 ; (cy + 1)
5e87 : 20 be 6f JSR $6fbe ; (mul16 + 0)
5e8a : 38 __ __ SEC
5e8b : a5 67 __ LDA T14 + 0 
5e8d : e5 05 __ SBC WORK + 2 
5e8f : 85 0d __ STA P0 
5e91 : a5 68 __ LDA T14 + 1 
5e93 : e5 06 __ SBC WORK + 3 
5e95 : 30 3b __ BMI $5ed2 ; (draw_ball.l22 + 0)
.s28:
5e97 : 85 0e __ STA P1 
5e99 : 05 0d __ ORA P0 
5e9b : f0 35 __ BEQ $5ed2 ; (draw_ball.l22 + 0)
.s21:
5e9d : 20 55 5a JSR $5a55 ; (mc_isqrt.s4 + 0)
5ea0 : a5 1b __ LDA ACCU + 0 ; (cy + 0)
5ea2 : 85 03 __ STA WORK + 0 
5ea4 : a5 1c __ LDA ACCU + 1 ; (cy + 1)
5ea6 : 85 04 __ STA WORK + 1 
5ea8 : a5 53 __ LDA T3 + 0 
5eaa : 85 0f __ STA P2 
5eac : a9 00 __ LDA #$00
5eae : 85 10 __ STA P3 
5eb0 : 85 11 __ STA P4 
5eb2 : a5 59 __ LDA T6 + 0 
5eb4 : 85 1b __ STA ACCU + 0 ; (cy + 0)
5eb6 : a5 5a __ LDA T6 + 1 
5eb8 : 85 1c __ STA ACCU + 1 ; (cy + 1)
5eba : 20 be 6f JSR $6fbe ; (mul16 + 0)
5ebd : 20 07 74 JSR $7407 ; (divs16@proxy + 0)
5ec0 : ad ea bf LDA $bfea ; (sstack + 0)
5ec3 : 18 __ __ CLC
5ec4 : 65 1b __ ADC ACCU + 0 ; (cy + 0)
5ec6 : 85 0d __ STA P0 
5ec8 : ad eb bf LDA $bfeb ; (sstack + 1)
5ecb : 65 1c __ ADC ACCU + 1 ; (cy + 1)
5ecd : 85 0e __ STA P1 
5ecf : 20 b3 58 JSR $58b3 ; (mc_setpix.s4 + 0)
.l22:
5ed2 : e6 53 __ INC T3 + 0 
5ed4 : d0 02 __ BNE $5ed8 ; (draw_ball.s92 + 0)
.s91:
5ed6 : e6 54 __ INC T3 + 1 
.s92:
5ed8 : e6 57 __ INC T5 + 0 
5eda : d0 02 __ BNE $5ede ; (draw_ball.s94 + 0)
.s93:
5edc : e6 58 __ INC T5 + 1 
.s94:
5ede : a5 5e __ LDA T9 + 1 
5ee0 : c5 58 __ CMP T5 + 1 
5ee2 : d0 08 __ BNE $5eec ; (draw_ball.s27 + 0)
.s24:
5ee4 : a5 5d __ LDA T9 + 0 
5ee6 : c5 57 __ CMP T5 + 0 
.s25:
5ee8 : 90 08 __ BCC $5ef2 ; (draw_ball.s23 + 0)
5eea : b0 17 __ BCS $5f03 ; (draw_ball.s19 + 0)
.s27:
5eec : 45 58 __ EOR T5 + 1 
5eee : 10 f8 __ BPL $5ee8 ; (draw_ball.s25 + 0)
.s26:
5ef0 : 90 11 __ BCC $5f03 ; (draw_ball.s19 + 0)
.s23:
5ef2 : 18 __ __ CLC
5ef3 : a5 51 __ LDA T2 + 0 
5ef5 : 69 10 __ ADC #$10
5ef7 : 85 51 __ STA T2 + 0 
5ef9 : c6 5b __ DEC T7 + 0 
5efb : f0 03 __ BEQ $5f00 ; (draw_ball.s23 + 14)
5efd : 4c 47 5e JMP $5e47 ; (draw_ball.l18 + 0)
5f00 : 4c 33 5e JMP $5e33 ; (draw_ball.s3 + 0)
.s19:
5f03 : a5 54 __ LDA T3 + 1 
5f05 : d0 cb __ BNE $5ed2 ; (draw_ball.l22 + 0)
5f07 : 4c 75 5e JMP $5e75 ; (draw_ball.l29 + 0)
--------------------------------------------------------------------
mc_hspan: ; mc_hspan(i16,i16,i16,u8)->void
;  65, "/home/xahmol/git/UltimateDemo2026/src/ball.c"
.s4:
5f0a : a5 13 __ LDA P6 ; (my + 1)
5f0c : f0 01 __ BEQ $5f0f ; (mc_hspan.s39 + 0)
5f0e : 60 __ __ RTS
.s39:
5f0f : a5 12 __ LDA P5 ; (my + 0)
5f11 : c9 c8 __ CMP #$c8
5f13 : 90 01 __ BCC $5f16 ; (mc_hspan.s5 + 0)
5f15 : 60 __ __ RTS
.s5:
5f16 : 24 15 __ BIT P8 ; (x0 + 1)
5f18 : 10 08 __ BPL $5f22 ; (mc_hspan.s49 + 0)
.s38:
5f1a : a9 00 __ LDA #$00
5f1c : 85 14 __ STA P7 ; (x0 + 0)
5f1e : 85 15 __ STA P8 ; (x0 + 1)
5f20 : 90 02 __ BCC $5f24 ; (mc_hspan.s6 + 0)
.s49:
5f22 : a5 14 __ LDA P7 ; (x0 + 0)
.s6:
5f24 : 85 46 __ STA T4 + 0 
5f26 : a6 15 __ LDX P8 ; (x0 + 1)
5f28 : a5 17 __ LDA P10 ; (x1 + 1)
5f2a : 10 01 __ BPL $5f2d ; (mc_hspan.s37 + 0)
5f2c : 60 __ __ RTS
.s37:
5f2d : 86 47 __ STX T4 + 1 
5f2f : d0 09 __ BNE $5f3a ; (mc_hspan.s34 + 0)
.s36:
5f31 : a5 16 __ LDA P9 ; (x1 + 0)
5f33 : c9 a0 __ CMP #$a0
5f35 : b0 03 __ BCS $5f3a ; (mc_hspan.s34 + 0)
5f37 : 4c a2 60 JMP $60a2 ; (mc_hspan.s7 + 0)
.s34:
5f3a : a9 9f __ LDA #$9f
5f3c : 85 16 __ STA P9 ; (x1 + 0)
5f3e : a9 00 __ LDA #$00
5f40 : 85 17 __ STA P10 ; (x1 + 1)
5f42 : 8a __ __ TXA
5f43 : f0 01 __ BEQ $5f46 ; (mc_hspan.s35 + 0)
5f45 : 60 __ __ RTS
.s35:
5f46 : a5 14 __ LDA P7 ; (x0 + 0)
5f48 : c9 a0 __ CMP #$a0
5f4a : 90 01 __ BCC $5f4d ; (mc_hspan.s8 + 0)
5f4c : 60 __ __ RTS
.s8:
5f4d : a5 16 __ LDA P9 ; (x1 + 0)
5f4f : 85 4a __ STA T6 + 0 
5f51 : 85 48 __ STA T5 + 0 
5f53 : a5 14 __ LDA P7 ; (x0 + 0)
5f55 : 4a __ __ LSR
5f56 : 4a __ __ LSR
5f57 : 85 4c __ STA T7 + 0 
5f59 : a5 17 __ LDA P10 ; (x1 + 1)
5f5b : 85 49 __ STA T5 + 1 
5f5d : 4a __ __ LSR
5f5e : 66 4a __ ROR T6 + 0 
5f60 : 4a __ __ LSR
5f61 : 66 4a __ ROR T6 + 0 
5f63 : 49 20 __ EOR #$20
5f65 : 38 __ __ SEC
5f66 : e9 20 __ SBC #$20
5f68 : 85 4b __ STA T6 + 1 
5f6a : d0 09 __ BNE $5f75 ; (mc_hspan.s9 + 0)
.s31:
5f6c : a5 4c __ LDA T7 + 0 
5f6e : c5 4a __ CMP T6 + 0 
5f70 : d0 03 __ BNE $5f75 ; (mc_hspan.s9 + 0)
5f72 : 4c 73 60 JMP $6073 ; (mc_hspan.s26 + 0)
.s9:
5f75 : a5 12 __ LDA P5 ; (my + 0)
5f77 : 85 0f __ STA P2 
5f79 : 29 07 __ AND #$07
5f7b : 85 1b __ STA ACCU + 0 
5f7d : a5 12 __ LDA P5 ; (my + 0)
5f7f : 4a __ __ LSR
5f80 : 4a __ __ LSR
5f81 : 4a __ __ LSR
5f82 : 85 43 __ STA T1 + 0 
5f84 : 0a __ __ ASL
5f85 : 0a __ __ ASL
5f86 : 65 43 __ ADC T1 + 0 
5f88 : 4a __ __ LSR
5f89 : 6a __ __ ROR
5f8a : aa __ __ TAX
5f8b : 29 80 __ AND #$80
5f8d : 6a __ __ ROR
5f8e : 05 1b __ ORA ACCU + 0 
5f90 : 85 4d __ STA T8 + 0 
5f92 : 8a __ __ TXA
5f93 : 29 3f __ AND #$3f
5f95 : 69 e0 __ ADC #$e0
5f97 : 85 4e __ STA T8 + 1 
5f99 : a5 18 __ LDA P11 ; (col + 0)
5f9b : 85 1c __ STA ACCU + 1 
5f9d : 0a __ __ ASL
5f9e : 0a __ __ ASL
5f9f : 05 18 __ ORA P11 ; (col + 0)
5fa1 : 85 43 __ STA T1 + 0 
5fa3 : a5 18 __ LDA P11 ; (col + 0)
5fa5 : 0a __ __ ASL
5fa6 : 0a __ __ ASL
5fa7 : 0a __ __ ASL
5fa8 : 0a __ __ ASL
5fa9 : 05 43 __ ORA T1 + 0 
5fab : 85 43 __ STA T1 + 0 
5fad : a9 00 __ LDA #$00
5faf : 85 10 __ STA P3 
5fb1 : 46 1c __ LSR ACCU + 1 
5fb3 : 6a __ __ ROR
5fb4 : 66 1c __ ROR ACCU + 1 
5fb6 : 6a __ __ ROR
5fb7 : 05 43 __ ORA T1 + 0 
5fb9 : 85 45 __ STA T2 + 0 
.l10:
5fbb : 20 a7 58 JSR $58a7 ; (mc_setpix@proxy + 0)
5fbe : 18 __ __ CLC
5fbf : a5 0d __ LDA P0 
5fc1 : 69 01 __ ADC #$01
5fc3 : 85 46 __ STA T4 + 0 
5fc5 : 85 1b __ STA ACCU + 0 
5fc7 : a5 0e __ LDA P1 
5fc9 : 69 00 __ ADC #$00
5fcb : 85 47 __ STA T4 + 1 
5fcd : 4a __ __ LSR
5fce : 66 1b __ ROR ACCU + 0 
5fd0 : 4a __ __ LSR
5fd1 : 66 1b __ ROR ACCU + 0 
5fd3 : 49 20 __ EOR #$20
5fd5 : c9 20 __ CMP #$20
5fd7 : d0 06 __ BNE $5fdf ; (mc_hspan.s11 + 0)
.s25:
5fd9 : a5 1b __ LDA ACCU + 0 
5fdb : c5 4c __ CMP T7 + 0 
5fdd : f0 dc __ BEQ $5fbb ; (mc_hspan.l10 + 0)
.s11:
5fdf : a9 00 __ LDA #$00
5fe1 : 85 1c __ STA ACCU + 1 
5fe3 : a6 4c __ LDX T7 + 0 
5fe5 : e8 __ __ INX
5fe6 : a5 4b __ LDA T6 + 1 
5fe8 : 30 43 __ BMI $602d ; (mc_hspan.s12 + 0)
.s24:
5fea : f0 04 __ BEQ $5ff0 ; (mc_hspan.s23 + 0)
.s40:
5fec : 8a __ __ TXA
5fed : 4c f5 5f JMP $5ff5 ; (mc_hspan.s19 + 0)
.s23:
5ff0 : 8a __ __ TXA
5ff1 : e4 4a __ CPX T6 + 0 
5ff3 : b0 38 __ BCS $602d ; (mc_hspan.s12 + 0)
.s19:
5ff5 : 0a __ __ ASL
5ff6 : 0a __ __ ASL
5ff7 : 0a __ __ ASL
5ff8 : a0 00 __ LDY #$00
5ffa : 90 02 __ BCC $5ffe ; (mc_hspan.s42 + 0)
.s41:
5ffc : c8 __ __ INY
5ffd : 18 __ __ CLC
.s42:
5ffe : 65 4d __ ADC T8 + 0 
6000 : 85 43 __ STA T1 + 0 
6002 : 98 __ __ TYA
6003 : 65 4e __ ADC T8 + 1 
6005 : 85 44 __ STA T1 + 1 
.l20:
6007 : a5 45 __ LDA T2 + 0 
6009 : a0 00 __ LDY #$00
600b : 91 43 __ STA (T1 + 0),y 
600d : 24 4b __ BIT T6 + 1 
600f : 30 1c __ BMI $602d ; (mc_hspan.s12 + 0)
.s22:
6011 : e8 __ __ INX
6012 : d0 02 __ BNE $6016 ; (mc_hspan.s44 + 0)
.s43:
6014 : e6 1c __ INC ACCU + 1 
.s44:
6016 : 18 __ __ CLC
6017 : a5 43 __ LDA T1 + 0 
6019 : 69 08 __ ADC #$08
601b : 85 43 __ STA T1 + 0 
601d : 90 02 __ BCC $6021 ; (mc_hspan.s46 + 0)
.s45:
601f : e6 44 __ INC T1 + 1 
.s46:
6021 : a5 1c __ LDA ACCU + 1 
6023 : c5 4b __ CMP T6 + 1 
6025 : 90 e0 __ BCC $6007 ; (mc_hspan.l20 + 0)
.s48:
6027 : d0 04 __ BNE $602d ; (mc_hspan.s12 + 0)
.s21:
6029 : e4 4a __ CPX T6 + 0 
602b : 90 da __ BCC $6007 ; (mc_hspan.l20 + 0)
.s12:
602d : 06 4a __ ASL T6 + 0 
602f : 26 4b __ ROL T6 + 1 
6031 : 06 4a __ ASL T6 + 0 
6033 : 26 4b __ ROL T6 + 1 
6035 : a9 00 __ LDA #$00
6037 : 85 10 __ STA P3 
6039 : f0 20 __ BEQ $605b ; (mc_hspan.l13 + 0)
.s14:
603b : a5 4a __ LDA T6 + 0 
603d : 85 0d __ STA P0 
603f : a5 4b __ LDA T6 + 1 
6041 : 85 0e __ STA P1 
6043 : a5 12 __ LDA P5 ; (my + 0)
6045 : 85 0f __ STA P2 
6047 : a5 18 __ LDA P11 ; (col + 0)
6049 : 85 11 __ STA P4 
604b : 20 b3 58 JSR $58b3 ; (mc_setpix.s4 + 0)
604e : 18 __ __ CLC
604f : a5 0d __ LDA P0 
6051 : 69 01 __ ADC #$01
6053 : 85 4a __ STA T6 + 0 
6055 : a5 0e __ LDA P1 
6057 : 69 00 __ ADC #$00
6059 : 85 4b __ STA T6 + 1 
.l13:
605b : a5 49 __ LDA T5 + 1 
605d : c5 4b __ CMP T6 + 1 
605f : d0 07 __ BNE $6068 ; (mc_hspan.s18 + 0)
.s15:
6061 : a5 48 __ LDA T5 + 0 
6063 : c5 4a __ CMP T6 + 0 
6065 : 4c 6c 60 JMP $606c ; (mc_hspan.s16 + 0)
.s18:
6068 : 45 4b __ EOR T6 + 1 
606a : 30 03 __ BMI $606f ; (mc_hspan.s17 + 0)
.s16:
606c : b0 cd __ BCS $603b ; (mc_hspan.s14 + 0)
.s3:
606e : 60 __ __ RTS
.s17:
606f : b0 fd __ BCS $606e ; (mc_hspan.s3 + 0)
6071 : 90 c8 __ BCC $603b ; (mc_hspan.s14 + 0)
.s26:
6073 : a5 17 __ LDA P10 ; (x1 + 1)
6075 : c5 15 __ CMP P8 ; (x0 + 1)
6077 : d0 04 __ BNE $607d ; (mc_hspan.l47 + 0)
.s28:
6079 : a5 48 __ LDA T5 + 0 
607b : c5 46 __ CMP T4 + 0 
.l47:
607d : 90 ef __ BCC $606e ; (mc_hspan.s3 + 0)
.s50:
607f : a9 00 __ LDA #$00
6081 : 85 10 __ STA P3 
6083 : a5 12 __ LDA P5 ; (my + 0)
6085 : 85 0f __ STA P2 
.l27:
6087 : 20 a7 58 JSR $58a7 ; (mc_setpix@proxy + 0)
608a : 18 __ __ CLC
608b : a5 0d __ LDA P0 
608d : 69 01 __ ADC #$01
608f : 85 46 __ STA T4 + 0 
6091 : a5 0e __ LDA P1 
6093 : 69 00 __ ADC #$00
6095 : 85 47 __ STA T4 + 1 
6097 : a5 49 __ LDA T5 + 1 
6099 : 30 d3 __ BMI $606e ; (mc_hspan.s3 + 0)
.s30:
609b : c5 47 __ CMP T4 + 1 
609d : f0 da __ BEQ $6079 ; (mc_hspan.s28 + 0)
.s29:
609f : b0 e6 __ BCS $6087 ; (mc_hspan.l27 + 0)
60a1 : 60 __ __ RTS
.s7:
60a2 : a5 17 __ LDA P10 ; (x1 + 1)
60a4 : c5 15 __ CMP P8 ; (x0 + 1)
60a6 : d0 04 __ BNE $60ac ; (mc_hspan.s33 + 0)
.s32:
60a8 : a5 16 __ LDA P9 ; (x1 + 0)
60aa : c5 14 __ CMP P7 ; (x0 + 0)
.s33:
60ac : 90 c0 __ BCC $606e ; (mc_hspan.s3 + 0)
60ae : 4c 4d 5f JMP $5f4d ; (mc_hspan.s8 + 0)
--------------------------------------------------------------------
vectors_run: ; vectors_run()->void
;   3, "/home/xahmol/git/UltimateDemo2026/src/vectors.h"
.s1:
60b1 : a2 04 __ LDX #$04
60b3 : b5 53 __ LDA T3 + 0,x 
60b5 : 9d c6 bf STA $bfc6,x ; (vectors_run@stack + 0)
60b8 : ca __ __ DEX
60b9 : 10 f8 __ BPL $60b3 ; (vectors_run.s1 + 2)
.s4:
60bb : 20 84 61 JSR $6184 ; (vec_init.s4 + 0)
60be : a9 00 __ LDA #$00
60c0 : 85 53 __ STA T3 + 0 
60c2 : 85 54 __ STA T4 + 0 
60c4 : a9 a8 __ LDA #$a8
60c6 : 85 55 __ STA T5 + 0 
60c8 : a9 fd __ LDA #$fd
60ca : 85 56 __ STA T5 + 1 
.l5:
60cc : 2c 11 d0 BIT $d011 
60cf : 30 fb __ BMI $60cc ; (vectors_run.l5 + 0)
.l6:
60d1 : 2c 11 d0 BIT $d011 
60d4 : 10 fb __ BPL $60d1 ; (vectors_run.l6 + 0)
.s7:
60d6 : a9 00 __ LDA #$00
60d8 : 85 57 __ STA T6 + 0 
60da : 85 0f __ STA P2 
60dc : 85 10 __ STA P3 
60de : 85 0d __ STA P0 
60e0 : 20 e2 73 JSR $73e2 ; (memset@proxy + 0)
60e3 : e6 53 __ INC T3 + 0 
60e5 : a5 53 __ LDA T3 + 0 
60e7 : 85 0d __ STA P0 
60e9 : a6 54 __ LDX T4 + 0 
60eb : e8 __ __ INX
60ec : e8 __ __ INX
60ed : 86 54 __ STX T4 + 0 
60ef : 86 0e __ STX P1 
60f1 : 20 f1 61 JSR $61f1 ; (project.s1 + 0)
.l8:
60f4 : a9 2a __ LDA #$2a
60f6 : 8d ea bf STA $bfea ; (sstack + 0)
60f9 : a9 87 __ LDA #$87
60fb : 8d eb bf STA $bfeb ; (sstack + 1)
60fe : a9 f4 __ LDA #$f4
6100 : 8d ec bf STA $bfec ; (sstack + 2)
6103 : a9 77 __ LDA #$77
6105 : 8d ed bf STA $bfed ; (sstack + 3)
6108 : a9 00 __ LDA #$00
610a : 8d f6 bf STA $bff6 ; (sstack + 12)
610d : a4 57 __ LDY T6 + 0 
610f : b9 e8 7a LDA $7ae8,y ; (cube_e[0][0] + 0)
6112 : 0a __ __ ASL
6113 : aa __ __ TAX
6114 : bd 42 87 LDA $8742,x ; (px_cur[0] + 0)
6117 : 8d ee bf STA $bfee ; (sstack + 4)
611a : bd 43 87 LDA $8743,x ; (px_cur[0] + 1)
611d : 8d ef bf STA $bfef ; (sstack + 5)
6120 : bd 32 87 LDA $8732,x ; (py_cur[0] + 0)
6123 : 8d f0 bf STA $bff0 ; (sstack + 6)
6126 : bd 33 87 LDA $8733,x ; (py_cur[0] + 1)
6129 : 8d f1 bf STA $bff1 ; (sstack + 7)
612c : b9 e9 7a LDA $7ae9,y ; (cube_e[0][0] + 1)
612f : 0a __ __ ASL
6130 : aa __ __ TAX
6131 : bd 42 87 LDA $8742,x ; (px_cur[0] + 0)
6134 : 8d f2 bf STA $bff2 ; (sstack + 8)
6137 : bd 43 87 LDA $8743,x ; (px_cur[0] + 1)
613a : 8d f3 bf STA $bff3 ; (sstack + 9)
613d : bd 32 87 LDA $8732,x ; (py_cur[0] + 0)
6140 : 8d f4 bf STA $bff4 ; (sstack + 10)
6143 : bd 33 87 LDA $8733,x ; (py_cur[0] + 1)
6146 : 8d f5 bf STA $bff5 ; (sstack + 11)
6149 : 20 8f 34 JSR $348f ; (bm_line.s1 + 0)
614c : 18 __ __ CLC
614d : a5 57 __ LDA T6 + 0 
614f : 69 02 __ ADC #$02
6151 : 85 57 __ STA T6 + 0 
6153 : c9 18 __ CMP #$18
6155 : d0 9d __ BNE $60f4 ; (vectors_run.l8 + 0)
.s9:
6157 : e6 55 __ INC T5 + 0 
6159 : f0 03 __ BEQ $615e ; (vectors_run.s11 + 0)
615b : 4c cc 60 JMP $60cc ; (vectors_run.l5 + 0)
.s11:
615e : e6 56 __ INC T5 + 1 
6160 : d0 f9 __ BNE $615b ; (vectors_run.s9 + 4)
.s10:
6162 : a9 00 __ LDA #$00
6164 : 85 0d __ STA P0 
6166 : 85 0e __ STA P1 
6168 : 85 10 __ STA P3 
616a : a9 36 __ LDA #$36
616c : 85 01 __ STA $01 
616e : 20 0b 0f JSR $0f0b ; (vic_setmode@proxy + 0)
6171 : a9 00 __ LDA #$00
6173 : 8d 20 d0 STA $d020 
6176 : 8d 21 d0 STA $d021 
.s3:
6179 : a2 04 __ LDX #$04
617b : bd c6 bf LDA $bfc6,x ; (vectors_run@stack + 0)
617e : 95 53 __ STA T3 + 0,x 
6180 : ca __ __ DEX
6181 : 10 f8 __ BPL $617b ; (vectors_run.s3 + 2)
6183 : 60 __ __ RTS
--------------------------------------------------------------------
vec_init: ; vec_init()->void
; 116, "/home/xahmol/git/UltimateDemo2026/src/vectors.c"
.s4:
6184 : 78 __ __ SEI
6185 : a9 00 __ LDA #$00
6187 : 85 0f __ STA P2 
6189 : 85 10 __ STA P3 
618b : a9 30 __ LDA #$30
618d : 85 01 __ STA $01 
618f : a9 40 __ LDA #$40
6191 : 85 11 __ STA P4 
6193 : a9 1f __ LDA #$1f
6195 : 85 12 __ STA P5 
6197 : a9 10 __ LDA #$10
6199 : a2 fa __ LDX #$fa
.l6:
619b : ca __ __ DEX
619c : 9d 00 d0 STA $d000,x 
619f : 9d fa d0 STA $d0fa,x 
61a2 : 9d f4 d1 STA $d1f4,x 
61a5 : 9d ee d2 STA $d2ee,x 
61a8 : d0 f1 __ BNE $619b ; (vec_init.l6 + 0)
.s5:
61aa : a9 00 __ LDA #$00
61ac : 85 43 __ STA T1 + 0 
61ae : 85 0d __ STA P0 
61b0 : a9 e0 __ LDA #$e0
61b2 : 85 44 __ STA T1 + 1 
61b4 : 85 0e __ STA P1 
61b6 : 20 f3 20 JSR $20f3 ; (memset.s4 + 0)
61b9 : a9 35 __ LDA #$35
61bb : 85 01 __ STA $01 
61bd : 20 0f 21 JSR $210f ; (mmap_trampoline.s4 + 0)
61c0 : 58 __ __ CLI
61c1 : 20 51 74 JSR $7451 ; (vic_setmode@proxy + 0)
61c4 : a5 10 __ LDA P3 
61c6 : 8d 2a 87 STA $872a ; (VScreen.data + 0)
61c9 : a5 11 __ LDA P4 
61cb : 8d 2b 87 STA $872b ; (VScreen.data + 1)
61ce : a9 28 __ LDA #$28
61d0 : 8d 2e 87 STA $872e ; (VScreen.cwidth + 0)
61d3 : a9 19 __ LDA #$19
61d5 : 8d 2f 87 STA $872f ; (VScreen.cheight + 0)
61d8 : a9 40 __ LDA #$40
61da : 8d 30 87 STA $8730 ; (VScreen.width + 0)
61dd : a9 01 __ LDA #$01
61df : 8d 31 87 STA $8731 ; (VScreen.width + 1)
61e2 : a9 00 __ LDA #$00
61e4 : 8d 20 d0 STA $d020 
61e7 : 8d 21 d0 STA $d021 
61ea : 8d 2c 87 STA $872c ; (VScreen.rdata + 0)
61ed : 8d 2d 87 STA $872d ; (VScreen.rdata + 1)
.s3:
61f0 : 60 __ __ RTS
--------------------------------------------------------------------
project: ; project(u8,u8,i16*,i16*)->void
;  81, "/home/xahmol/git/UltimateDemo2026/src/vectors.c"
.s1:
61f1 : a2 0e __ LDX #$0e
61f3 : b5 53 __ LDA T4 + 0,x 
61f5 : 9d d2 bf STA $bfd2,x ; (project@stack + 0)
61f8 : ca __ __ DEX
61f9 : 10 f8 __ BPL $61f3 ; (project.s1 + 2)
.s4:
61fb : a5 0d __ LDA P0 ; (ax + 0)
61fd : 0a __ __ ASL
61fe : 85 47 __ STA T1 + 0 
6200 : a9 78 __ LDA #$78
6202 : 69 00 __ ADC #$00
6204 : 85 5a __ STA T7 + 1 
6206 : 18 __ __ CLC
6207 : a5 0e __ LDA P1 ; (ay + 0)
6209 : 69 40 __ ADC #$40
620b : 0a __ __ ASL
620c : 85 4b __ STA T2 + 0 
620e : a9 00 __ LDA #$00
6210 : 85 48 __ STA T1 + 1 
6212 : 2a __ __ ROL
6213 : aa __ __ TAX
6214 : a9 e8 __ LDA #$e8
6216 : 85 59 __ STA T7 + 0 
6218 : 65 4b __ ADC T2 + 0 
621a : 85 5b __ STA T8 + 0 
621c : 8a __ __ TXA
621d : 69 78 __ ADC #$78
621f : 85 5c __ STA T8 + 1 
6221 : 06 0e __ ASL P1 ; (ay + 0)
6223 : 26 48 __ ROL T1 + 1 
6225 : 18 __ __ CLC
6226 : a9 e8 __ LDA #$e8
6228 : 65 0e __ ADC P1 ; (ay + 0)
622a : 85 5d __ STA T9 + 0 
622c : a9 78 __ LDA #$78
622e : 65 48 __ ADC T1 + 1 
6230 : 85 5e __ STA T9 + 1 
6232 : 18 __ __ CLC
6233 : a5 0d __ LDA P0 ; (ax + 0)
6235 : 69 40 __ ADC #$40
6237 : 0a __ __ ASL
6238 : a2 00 __ LDX #$00
623a : 90 02 __ BCC $623e ; (project.s11 + 0)
.s10:
623c : e8 __ __ INX
623d : 18 __ __ CLC
.s11:
623e : 69 e8 __ ADC #$e8
6240 : 85 5f __ STA T10 + 0 
6242 : 8a __ __ TXA
6243 : 69 78 __ ADC #$78
6245 : 85 60 __ STA T10 + 1 
6247 : a9 00 __ LDA #$00
6249 : 85 52 __ STA T11 + 0 
.l5:
624b : 85 61 __ STA T12 + 0 
624d : aa __ __ TAX
624e : bd d0 78 LDA $78d0,x ; (cube_v[0][0] + 0)
6251 : 29 80 __ AND #$80
6253 : 10 02 __ BPL $6257 ; (project.l5 + 12)
6255 : a9 ff __ LDA #$ff
6257 : 85 04 __ STA WORK + 1 
6259 : 85 44 __ STA T0 + 1 
625b : bd d0 78 LDA $78d0,x ; (cube_v[0][0] + 0)
625e : 0a __ __ ASL
625f : 0a __ __ ASL
6260 : 18 __ __ CLC
6261 : 7d d0 78 ADC $78d0,x ; (cube_v[0][0] + 0)
6264 : 0a __ __ ASL
6265 : 0a __ __ ASL
6266 : 0a __ __ ASL
6267 : 0a __ __ ASL
6268 : 85 43 __ STA T0 + 0 
626a : 85 03 __ STA WORK + 0 
626c : a5 04 __ LDA WORK + 1 
626e : 29 80 __ AND #$80
6270 : 10 02 __ BPL $6274 ; (project.l5 + 41)
6272 : a9 ff __ LDA #$ff
6274 : 85 45 __ STA T0 + 2 
6276 : 85 06 __ STA WORK + 3 
6278 : 85 05 __ STA WORK + 2 
627a : a0 00 __ LDY #$00
627c : b1 5b __ LDA (T8 + 0),y 
627e : 85 0e __ STA P1 ; (ay + 0)
6280 : 85 1b __ STA ACCU + 0 
6282 : c8 __ __ INY
6283 : b1 5b __ LDA (T8 + 0),y 
6285 : 85 48 __ STA T1 + 1 
6287 : 85 1c __ STA ACCU + 1 
6289 : 29 80 __ AND #$80
628b : 10 02 __ BPL $628f ; (project.l5 + 68)
628d : a9 ff __ LDA #$ff
628f : 85 49 __ STA T1 + 2 
6291 : 85 1d __ STA ACCU + 2 
6293 : 85 1e __ STA ACCU + 3 
6295 : 20 c0 70 JSR $70c0 ; (mul32 + 0)
6298 : a5 07 __ LDA WORK + 4 
629a : 85 4b __ STA T2 + 0 
629c : a5 08 __ LDA WORK + 5 
629e : 85 4c __ STA T2 + 1 
62a0 : a5 09 __ LDA WORK + 6 
62a2 : 85 4d __ STA T2 + 2 
62a4 : a5 0a __ LDA WORK + 7 
62a6 : 85 4e __ STA T2 + 3 
62a8 : a0 00 __ LDY #$00
62aa : b1 5d __ LDA (T9 + 0),y 
62ac : 85 4f __ STA T3 + 0 
62ae : 85 03 __ STA WORK + 0 
62b0 : c8 __ __ INY
62b1 : b1 5d __ LDA (T9 + 0),y 
62b3 : 85 50 __ STA T3 + 1 
62b5 : 85 04 __ STA WORK + 1 
62b7 : 29 80 __ AND #$80
62b9 : 10 02 __ BPL $62bd ; (project.l5 + 114)
62bb : a9 ff __ LDA #$ff
62bd : 85 51 __ STA T3 + 2 
62bf : 85 06 __ STA WORK + 3 
62c1 : 85 05 __ STA WORK + 2 
62c3 : a6 61 __ LDX T12 + 0 
62c5 : bd d2 78 LDA $78d2,x ; (cube_v[0][0] + 2)
62c8 : 29 80 __ AND #$80
62ca : 10 02 __ BPL $62ce ; (project.l5 + 131)
62cc : a9 ff __ LDA #$ff
62ce : 85 1c __ STA ACCU + 1 
62d0 : 85 54 __ STA T4 + 1 
62d2 : bd d2 78 LDA $78d2,x ; (cube_v[0][0] + 2)
62d5 : 0a __ __ ASL
62d6 : 0a __ __ ASL
62d7 : 18 __ __ CLC
62d8 : 7d d2 78 ADC $78d2,x ; (cube_v[0][0] + 2)
62db : 0a __ __ ASL
62dc : 0a __ __ ASL
62dd : 0a __ __ ASL
62de : 0a __ __ ASL
62df : 85 53 __ STA T4 + 0 
62e1 : 85 1b __ STA ACCU + 0 
62e3 : a5 1c __ LDA ACCU + 1 
62e5 : 29 80 __ AND #$80
62e7 : 10 02 __ BPL $62eb ; (project.l5 + 160)
62e9 : a9 ff __ LDA #$ff
62eb : 85 55 __ STA T4 + 2 
62ed : 85 1d __ STA ACCU + 2 
62ef : 85 1e __ STA ACCU + 3 
62f1 : 20 c0 70 JSR $70c0 ; (mul32 + 0)
62f4 : 18 __ __ CLC
62f5 : a5 07 __ LDA WORK + 4 
62f7 : 65 4b __ ADC T2 + 0 
62f9 : a5 08 __ LDA WORK + 5 
62fb : 65 4c __ ADC T2 + 1 
62fd : 85 4b __ STA T2 + 0 
62ff : a5 09 __ LDA WORK + 6 
6301 : 65 4d __ ADC T2 + 2 
6303 : 85 4c __ STA T2 + 1 
6305 : a5 0a __ LDA WORK + 7 
6307 : 65 4e __ ADC T2 + 3 
6309 : 85 4e __ STA T2 + 3 
630b : a4 47 __ LDY T1 + 0 
630d : b1 59 __ LDA (T7 + 0),y 
630f : 85 56 __ STA T5 + 0 
6311 : c8 __ __ INY
6312 : b1 59 __ LDA (T7 + 0),y 
6314 : 85 57 __ STA T5 + 1 
6316 : 29 80 __ AND #$80
6318 : 10 02 __ BPL $631c ; (project.l5 + 209)
631a : a9 ff __ LDA #$ff
631c : 85 58 __ STA T5 + 2 
631e : a5 53 __ LDA T4 + 0 
6320 : 85 1b __ STA ACCU + 0 
6322 : a5 54 __ LDA T4 + 1 
6324 : 85 1c __ STA ACCU + 1 
6326 : a5 55 __ LDA T4 + 2 
6328 : 85 1d __ STA ACCU + 2 
632a : 85 1e __ STA ACCU + 3 
632c : a5 0e __ LDA P1 ; (ay + 0)
632e : 85 03 __ STA WORK + 0 
6330 : a5 48 __ LDA T1 + 1 
6332 : 85 04 __ STA WORK + 1 
6334 : a5 49 __ LDA T1 + 2 
6336 : 85 05 __ STA WORK + 2 
6338 : 85 06 __ STA WORK + 3 
633a : 20 c0 70 JSR $70c0 ; (mul32 + 0)
633d : a5 07 __ LDA WORK + 4 
633f : 85 0e __ STA P1 ; (ay + 0)
6341 : a5 08 __ LDA WORK + 5 
6343 : 85 48 __ STA T1 + 1 
6345 : a5 09 __ LDA WORK + 6 
6347 : 85 49 __ STA T1 + 2 
6349 : a5 0a __ LDA WORK + 7 
634b : 85 4a __ STA T1 + 3 
634d : 38 __ __ SEC
634e : a9 00 __ LDA #$00
6350 : e5 4f __ SBC T3 + 0 
6352 : 85 1b __ STA ACCU + 0 
6354 : a9 00 __ LDA #$00
6356 : e5 50 __ SBC T3 + 1 
6358 : 85 1c __ STA ACCU + 1 
635a : a9 00 __ LDA #$00
635c : e5 51 __ SBC T3 + 2 
635e : 85 1d __ STA ACCU + 2 
6360 : a9 00 __ LDA #$00
6362 : e5 51 __ SBC T3 + 2 
6364 : 85 1e __ STA ACCU + 3 
6366 : a5 43 __ LDA T0 + 0 
6368 : 85 03 __ STA WORK + 0 
636a : a5 44 __ LDA T0 + 1 
636c : 85 04 __ STA WORK + 1 
636e : a5 45 __ LDA T0 + 2 
6370 : 85 05 __ STA WORK + 2 
6372 : 85 06 __ STA WORK + 3 
6374 : 20 c0 70 JSR $70c0 ; (mul32 + 0)
6377 : 18 __ __ CLC
6378 : a5 07 __ LDA WORK + 4 
637a : 65 0e __ ADC P1 ; (ay + 0)
637c : a5 08 __ LDA WORK + 5 
637e : 65 48 __ ADC T1 + 1 
6380 : 85 43 __ STA T0 + 0 
6382 : a5 09 __ LDA WORK + 6 
6384 : 65 49 __ ADC T1 + 2 
6386 : 85 44 __ STA T0 + 1 
6388 : a5 0a __ LDA WORK + 7 
638a : 65 4a __ ADC T1 + 3 
638c : 4a __ __ LSR
638d : 66 44 __ ROR T0 + 1 
638f : 66 43 __ ROR T0 + 0 
6391 : 4a __ __ LSR
6392 : 66 44 __ ROR T0 + 1 
6394 : 66 43 __ ROR T0 + 0 
6396 : 4a __ __ LSR
6397 : 66 44 __ ROR T0 + 1 
6399 : 66 43 __ ROR T0 + 0 
639b : 4a __ __ LSR
639c : 66 44 __ ROR T0 + 1 
639e : 66 43 __ ROR T0 + 0 
63a0 : a5 44 __ LDA T0 + 1 
63a2 : 85 1c __ STA ACCU + 1 
63a4 : 29 80 __ AND #$80
63a6 : 10 02 __ BPL $63aa ; (project.l5 + 351)
63a8 : a9 ff __ LDA #$ff
63aa : 85 45 __ STA T0 + 2 
63ac : 85 1e __ STA ACCU + 3 
63ae : 85 1d __ STA ACCU + 2 
63b0 : a5 43 __ LDA T0 + 0 
63b2 : 85 1b __ STA ACCU + 0 
63b4 : a5 56 __ LDA T5 + 0 
63b6 : 85 03 __ STA WORK + 0 
63b8 : a5 57 __ LDA T5 + 1 
63ba : 85 04 __ STA WORK + 1 
63bc : a5 58 __ LDA T5 + 2 
63be : 85 05 __ STA WORK + 2 
63c0 : 85 06 __ STA WORK + 3 
63c2 : 20 c0 70 JSR $70c0 ; (mul32 + 0)
63c5 : a5 07 __ LDA WORK + 4 
63c7 : 85 0e __ STA P1 ; (ay + 0)
63c9 : a5 08 __ LDA WORK + 5 
63cb : 85 48 __ STA T1 + 1 
63cd : a5 09 __ LDA WORK + 6 
63cf : 85 49 __ STA T1 + 2 
63d1 : a5 0a __ LDA WORK + 7 
63d3 : 85 4a __ STA T1 + 3 
63d5 : a6 61 __ LDX T12 + 0 
63d7 : bd d1 78 LDA $78d1,x ; (cube_v[0][0] + 1)
63da : 29 80 __ AND #$80
63dc : 10 02 __ BPL $63e0 ; (project.l5 + 405)
63de : a9 ff __ LDA #$ff
63e0 : 85 04 __ STA WORK + 1 
63e2 : 85 50 __ STA T3 + 1 
63e4 : bd d1 78 LDA $78d1,x ; (cube_v[0][0] + 1)
63e7 : 0a __ __ ASL
63e8 : 0a __ __ ASL
63e9 : 18 __ __ CLC
63ea : 7d d1 78 ADC $78d1,x ; (cube_v[0][0] + 1)
63ed : 0a __ __ ASL
63ee : 0a __ __ ASL
63ef : 0a __ __ ASL
63f0 : 0a __ __ ASL
63f1 : 85 4f __ STA T3 + 0 
63f3 : 85 03 __ STA WORK + 0 
63f5 : a5 04 __ LDA WORK + 1 
63f7 : 29 80 __ AND #$80
63f9 : 10 02 __ BPL $63fd ; (project.l5 + 434)
63fb : a9 ff __ LDA #$ff
63fd : 85 51 __ STA T3 + 2 
63ff : 85 06 __ STA WORK + 3 
6401 : 85 05 __ STA WORK + 2 
6403 : a0 00 __ LDY #$00
6405 : b1 5f __ LDA (T10 + 0),y 
6407 : 85 53 __ STA T4 + 0 
6409 : 85 1b __ STA ACCU + 0 
640b : c8 __ __ INY
640c : b1 5f __ LDA (T10 + 0),y 
640e : 85 54 __ STA T4 + 1 
6410 : 85 1c __ STA ACCU + 1 
6412 : 29 80 __ AND #$80
6414 : 10 02 __ BPL $6418 ; (project.l5 + 461)
6416 : a9 ff __ LDA #$ff
6418 : 85 55 __ STA T4 + 2 
641a : 85 1d __ STA ACCU + 2 
641c : 85 1e __ STA ACCU + 3 
641e : 20 c0 70 JSR $70c0 ; (mul32 + 0)
6421 : 38 __ __ SEC
6422 : a5 07 __ LDA WORK + 4 
6424 : e5 0e __ SBC P1 ; (ay + 0)
6426 : a5 08 __ LDA WORK + 5 
6428 : e5 48 __ SBC T1 + 1 
642a : 85 0e __ STA P1 ; (ay + 0)
642c : a5 09 __ LDA WORK + 6 
642e : e5 49 __ SBC T1 + 2 
6430 : 85 48 __ STA T1 + 1 
6432 : a5 0a __ LDA WORK + 7 
6434 : e5 4a __ SBC T1 + 3 
6436 : 85 4a __ STA T1 + 3 
6438 : a5 53 __ LDA T4 + 0 
643a : 85 1b __ STA ACCU + 0 
643c : a5 54 __ LDA T4 + 1 
643e : 85 1c __ STA ACCU + 1 
6440 : a5 55 __ LDA T4 + 2 
6442 : 85 1d __ STA ACCU + 2 
6444 : 85 1e __ STA ACCU + 3 
6446 : a5 43 __ LDA T0 + 0 
6448 : 85 03 __ STA WORK + 0 
644a : a5 44 __ LDA T0 + 1 
644c : 85 04 __ STA WORK + 1 
644e : a5 45 __ LDA T0 + 2 
6450 : 85 05 __ STA WORK + 2 
6452 : 85 06 __ STA WORK + 3 
6454 : 20 c0 70 JSR $70c0 ; (mul32 + 0)
6457 : a5 07 __ LDA WORK + 4 
6459 : 85 43 __ STA T0 + 0 
645b : a5 08 __ LDA WORK + 5 
645d : 85 44 __ STA T0 + 1 
645f : a5 09 __ LDA WORK + 6 
6461 : 85 45 __ STA T0 + 2 
6463 : a5 0a __ LDA WORK + 7 
6465 : 85 46 __ STA T0 + 3 
6467 : a5 56 __ LDA T5 + 0 
6469 : 85 1b __ STA ACCU + 0 
646b : a5 57 __ LDA T5 + 1 
646d : 85 1c __ STA ACCU + 1 
646f : a5 58 __ LDA T5 + 2 
6471 : 85 1d __ STA ACCU + 2 
6473 : 85 1e __ STA ACCU + 3 
6475 : a5 4f __ LDA T3 + 0 
6477 : 85 03 __ STA WORK + 0 
6479 : a5 50 __ LDA T3 + 1 
647b : 85 04 __ STA WORK + 1 
647d : a5 51 __ LDA T3 + 2 
647f : 85 05 __ STA WORK + 2 
6481 : 85 06 __ STA WORK + 3 
6483 : 20 c0 70 JSR $70c0 ; (mul32 + 0)
6486 : 18 __ __ CLC
6487 : a5 07 __ LDA WORK + 4 
6489 : 65 43 __ ADC T0 + 0 
648b : a5 08 __ LDA WORK + 5 
648d : 65 44 __ ADC T0 + 1 
648f : 85 43 __ STA T0 + 0 
6491 : a5 09 __ LDA WORK + 6 
6493 : 65 45 __ ADC T0 + 2 
6495 : 85 44 __ STA T0 + 1 
6497 : a5 0a __ LDA WORK + 7 
6499 : 65 46 __ ADC T0 + 3 
649b : 4a __ __ LSR
649c : 66 44 __ ROR T0 + 1 
649e : 66 43 __ ROR T0 + 0 
64a0 : 4a __ __ LSR
64a1 : 66 44 __ ROR T0 + 1 
64a3 : 66 43 __ ROR T0 + 0 
64a5 : 4a __ __ LSR
64a6 : 66 44 __ ROR T0 + 1 
64a8 : 66 43 __ ROR T0 + 0 
64aa : 4a __ __ LSR
64ab : 66 44 __ ROR T0 + 1 
64ad : 66 43 __ ROR T0 + 0 
64af : 18 __ __ CLC
64b0 : a5 43 __ LDA T0 + 0 
64b2 : 69 18 __ ADC #$18
64b4 : 85 4f __ STA T3 + 0 
64b6 : a5 44 __ LDA T0 + 1 
64b8 : 69 01 __ ADC #$01
64ba : 85 50 __ STA T3 + 1 
64bc : a5 44 __ LDA T0 + 1 
64be : 49 80 __ EOR #$80
64c0 : c9 7e __ CMP #$7e
64c2 : d0 04 __ BNE $64c8 ; (project.s9 + 0)
.s8:
64c4 : a5 43 __ LDA T0 + 0 
64c6 : c9 e9 __ CMP #$e9
.s9:
64c8 : b0 08 __ BCS $64d2 ; (project.s6 + 0)
.s7:
64ca : a9 01 __ LDA #$01
64cc : 85 4f __ STA T3 + 0 
64ce : a9 00 __ LDA #$00
64d0 : 85 50 __ STA T3 + 1 
.s6:
64d2 : a5 4e __ LDA T2 + 3 
64d4 : 4a __ __ LSR
64d5 : 66 4c __ ROR T2 + 1 
64d7 : 66 4b __ ROR T2 + 0 
64d9 : 4a __ __ LSR
64da : 66 4c __ ROR T2 + 1 
64dc : 66 4b __ ROR T2 + 0 
64de : 4a __ __ LSR
64df : 66 4c __ ROR T2 + 1 
64e1 : 66 4b __ ROR T2 + 0 
64e3 : 4a __ __ LSR
64e4 : 66 4c __ ROR T2 + 1 
64e6 : 66 4b __ ROR T2 + 0 
64e8 : a5 4b __ LDA T2 + 0 
64ea : 0a __ __ ASL
64eb : a8 __ __ TAY
64ec : a5 4c __ LDA T2 + 1 
64ee : 2a __ __ ROL
64ef : aa __ __ TAX
64f0 : 98 __ __ TYA
64f1 : 18 __ __ CLC
64f2 : 65 4b __ ADC T2 + 0 
64f4 : a8 __ __ TAY
64f5 : 8a __ __ TXA
64f6 : 65 4c __ ADC T2 + 1 
64f8 : 85 1b __ STA ACCU + 0 
64fa : 98 __ __ TYA
64fb : 0a __ __ ASL
64fc : 26 1b __ ROL ACCU + 0 
64fe : 0a __ __ ASL
64ff : 26 1b __ ROL ACCU + 0 
6501 : 0a __ __ ASL
6502 : 26 1b __ ROL ACCU + 0 
6504 : 18 __ __ CLC
6505 : 65 4b __ ADC T2 + 0 
6507 : 85 4b __ STA T2 + 0 
6509 : a5 1b __ LDA ACCU + 0 
650b : 65 4c __ ADC T2 + 1 
650d : 06 4b __ ASL T2 + 0 
650f : 2a __ __ ROL
6510 : 06 4b __ ASL T2 + 0 
6512 : 2a __ __ ROL
6513 : 06 4b __ ASL T2 + 0 
6515 : 2a __ __ ROL
6516 : 85 1c __ STA ACCU + 1 
6518 : a5 4b __ LDA T2 + 0 
651a : 85 1b __ STA ACCU + 0 
651c : 20 f1 73 JSR $73f1 ; (divs16@proxy + 0)
651f : 18 __ __ CLC
6520 : a5 1b __ LDA ACCU + 0 
6522 : 69 a0 __ ADC #$a0
6524 : a8 __ __ TAY
6525 : a5 1c __ LDA ACCU + 1 
6527 : 69 00 __ ADC #$00
6529 : 85 44 __ STA T0 + 1 
652b : a5 52 __ LDA T11 + 0 
652d : 0a __ __ ASL
652e : 85 4b __ STA T2 + 0 
6530 : aa __ __ TAX
6531 : 98 __ __ TYA
6532 : 9d 42 87 STA $8742,x ; (px_cur[0] + 0)
6535 : a5 44 __ LDA T0 + 1 
6537 : 9d 43 87 STA $8743,x ; (px_cur[0] + 1)
653a : a5 4a __ LDA T1 + 3 
653c : 4a __ __ LSR
653d : 66 48 __ ROR T1 + 1 
653f : 66 0e __ ROR P1 ; (ay + 0)
6541 : 4a __ __ LSR
6542 : 66 48 __ ROR T1 + 1 
6544 : 66 0e __ ROR P1 ; (ay + 0)
6546 : 4a __ __ LSR
6547 : 66 48 __ ROR T1 + 1 
6549 : 66 0e __ ROR P1 ; (ay + 0)
654b : 4a __ __ LSR
654c : 66 48 __ ROR T1 + 1 
654e : 66 0e __ ROR P1 ; (ay + 0)
6550 : a5 0e __ LDA P1 ; (ay + 0)
6552 : 0a __ __ ASL
6553 : a8 __ __ TAY
6554 : a5 48 __ LDA T1 + 1 
6556 : 2a __ __ ROL
6557 : aa __ __ TAX
6558 : 98 __ __ TYA
6559 : 18 __ __ CLC
655a : 65 0e __ ADC P1 ; (ay + 0)
655c : a8 __ __ TAY
655d : 8a __ __ TXA
655e : 65 48 __ ADC T1 + 1 
6560 : 85 1b __ STA ACCU + 0 
6562 : 98 __ __ TYA
6563 : 0a __ __ ASL
6564 : 26 1b __ ROL ACCU + 0 
6566 : 0a __ __ ASL
6567 : 26 1b __ ROL ACCU + 0 
6569 : 0a __ __ ASL
656a : 26 1b __ ROL ACCU + 0 
656c : 18 __ __ CLC
656d : 65 0e __ ADC P1 ; (ay + 0)
656f : 85 0e __ STA P1 ; (ay + 0)
6571 : a5 1b __ LDA ACCU + 0 
6573 : 65 48 __ ADC T1 + 1 
6575 : 06 0e __ ASL P1 ; (ay + 0)
6577 : 2a __ __ ROL
6578 : 06 0e __ ASL P1 ; (ay + 0)
657a : 2a __ __ ROL
657b : 06 0e __ ASL P1 ; (ay + 0)
657d : 2a __ __ ROL
657e : 85 1c __ STA ACCU + 1 
6580 : a5 0e __ LDA P1 ; (ay + 0)
6582 : 85 1b __ STA ACCU + 0 
6584 : 20 f1 73 JSR $73f1 ; (divs16@proxy + 0)
6587 : 18 __ __ CLC
6588 : a5 1b __ LDA ACCU + 0 
658a : 69 64 __ ADC #$64
658c : a6 4b __ LDX T2 + 0 
658e : 9d 32 87 STA $8732,x ; (py_cur[0] + 0)
6591 : a5 1c __ LDA ACCU + 1 
6593 : 69 00 __ ADC #$00
6595 : 9d 33 87 STA $8733,x ; (py_cur[0] + 1)
6598 : e6 52 __ INC T11 + 0 
659a : 18 __ __ CLC
659b : a5 61 __ LDA T12 + 0 
659d : 69 03 __ ADC #$03
659f : c9 18 __ CMP #$18
65a1 : f0 03 __ BEQ $65a6 ; (project.s3 + 0)
65a3 : 4c 4b 62 JMP $624b ; (project.l5 + 0)
.s3:
65a6 : a2 0e __ LDX #$0e
65a8 : bd d2 bf LDA $bfd2,x ; (project@stack + 0)
65ab : 95 53 __ STA T4 + 0,x 
65ad : ca __ __ DEX
65ae : 10 f8 __ BPL $65a8 ; (project.s3 + 2)
65b0 : 60 __ __ RTS
--------------------------------------------------------------------
plasma_run: ; plasma_run()->void
;   3, "/home/xahmol/git/UltimateDemo2026/src/plasma.h"
.s1:
65b1 : a2 04 __ LDX #$04
65b3 : b5 53 __ LDA T1 + 0,x 
65b5 : 9d e2 bf STA $bfe2,x ; (plasma_run@stack + 0)
65b8 : ca __ __ DEX
65b9 : 10 f8 __ BPL $65b3 ; (plasma_run.s1 + 2)
.s4:
65bb : 20 90 66 JSR $6690 ; (plasma_init.s4 + 0)
65be : a9 00 __ LDA #$00
65c0 : 85 53 __ STA T1 + 0 
65c2 : 85 54 __ STA T2 + 0 
65c4 : 85 55 __ STA T3 + 0 
65c6 : a9 a2 __ LDA #$a2
65c8 : 85 56 __ STA T4 + 0 
65ca : a9 fe __ LDA #$fe
65cc : 85 57 __ STA T4 + 1 
.l5:
65ce : a5 53 __ LDA T1 + 0 
65d0 : 85 0d __ STA P0 
65d2 : 20 e4 66 JSR $66e4 ; (plasma_frame@proxy + 0)
.l6:
65d5 : 2c 11 d0 BIT $d011 
65d8 : 30 fb __ BMI $65d5 ; (plasma_run.l6 + 0)
.l7:
65da : 2c 11 d0 BIT $d011 
65dd : 10 fb __ BPL $65da ; (plasma_run.l7 + 0)
.s8:
65df : e6 55 __ INC T3 + 0 
65e1 : e6 54 __ INC T2 + 0 
65e3 : e6 54 __ INC T2 + 0 
65e5 : e6 53 __ INC T1 + 0 
65e7 : e6 56 __ INC T4 + 0 
65e9 : d0 e3 __ BNE $65ce ; (plasma_run.l5 + 0)
.s19:
65eb : e6 57 __ INC T4 + 1 
65ed : d0 df __ BNE $65ce ; (plasma_run.l5 + 0)
.s9:
65ef : a9 00 __ LDA #$00
65f1 : 85 43 __ STA T0 + 0 
65f3 : 85 1f __ STA ADDR + 0 
65f5 : a9 c0 __ LDA #$c0
65f7 : 85 44 __ STA T0 + 1 
65f9 : d0 02 __ BNE $65fd ; (plasma_run.l18 + 0)
.s21:
65fb : e6 44 __ INC T0 + 1 
.l18:
65fd : a9 82 __ LDA #$82
65ff : a0 00 __ LDY #$00
6601 : 91 43 __ STA (T0 + 0),y 
6603 : 18 __ __ CLC
6604 : a5 44 __ LDA T0 + 1 
6606 : 69 18 __ ADC #$18
6608 : 85 20 __ STA ADDR + 1 
660a : a9 07 __ LDA #$07
660c : a4 43 __ LDY T0 + 0 
660e : 91 1f __ STA (ADDR + 0),y 
6610 : 98 __ __ TYA
6611 : 18 __ __ CLC
6612 : 69 01 __ ADC #$01
6614 : 85 43 __ STA T0 + 0 
6616 : b0 e3 __ BCS $65fb ; (plasma_run.s21 + 0)
.s22:
6618 : c9 e8 __ CMP #$e8
661a : d0 e1 __ BNE $65fd ; (plasma_run.l18 + 0)
.s17:
661c : a5 44 __ LDA T0 + 1 
661e : c9 c3 __ CMP #$c3
6620 : d0 db __ BNE $65fd ; (plasma_run.l18 + 0)
.s10:
6622 : a9 00 __ LDA #$00
6624 : 8d 21 d0 STA $d021 
6627 : a9 a2 __ LDA #$a2
6629 : 85 56 __ STA T4 + 0 
662b : a9 fe __ LDA #$fe
662d : 85 57 __ STA T4 + 1 
662f : a5 53 __ LDA T1 + 0 
.l11:
6631 : 85 0d __ STA P0 
6633 : 20 e4 66 JSR $66e4 ; (plasma_frame@proxy + 0)
.l12:
6636 : 2c 11 d0 BIT $d011 
6639 : 30 fb __ BMI $6636 ; (plasma_run.l12 + 0)
.l13:
663b : 2c 11 d0 BIT $d011 
663e : 10 fb __ BPL $663b ; (plasma_run.l13 + 0)
.s14:
6640 : 18 __ __ CLC
6641 : a5 0f __ LDA P2 
6643 : 69 02 __ ADC #$02
6645 : 85 55 __ STA T3 + 0 
6647 : 18 __ __ CLC
6648 : a5 54 __ LDA T2 + 0 
664a : 69 03 __ ADC #$03
664c : 85 54 __ STA T2 + 0 
664e : 18 __ __ CLC
664f : a5 0d __ LDA P0 
6651 : 69 02 __ ADC #$02
6653 : e6 56 __ INC T4 + 0 
6655 : d0 da __ BNE $6631 ; (plasma_run.l11 + 0)
.s20:
6657 : e6 57 __ INC T4 + 1 
6659 : d0 d6 __ BNE $6631 ; (plasma_run.l11 + 0)
.s15:
665b : a9 00 __ LDA #$00
665d : 85 0d __ STA P0 
665f : 85 0e __ STA P1 
6661 : 85 10 __ STA P3 
6663 : a9 36 __ LDA #$36
6665 : 85 01 __ STA $01 
6667 : 20 0b 0f JSR $0f0b ; (vic_setmode@proxy + 0)
666a : a9 00 __ LDA #$00
666c : 8d 20 d0 STA $d020 
666f : 8d 21 d0 STA $d021 
6672 : a9 20 __ LDA #$20
6674 : a2 fa __ LDX #$fa
.l16:
6676 : ca __ __ DEX
6677 : 9d 00 04 STA $0400,x 
667a : 9d fa 04 STA $04fa,x 
667d : 9d f4 05 STA $05f4,x 
6680 : 9d ee 06 STA $06ee,x 
6683 : d0 f1 __ BNE $6676 ; (plasma_run.l16 + 0)
.s3:
6685 : a2 04 __ LDX #$04
6687 : bd e2 bf LDA $bfe2,x ; (plasma_run@stack + 0)
668a : 95 53 __ STA T1 + 0,x 
668c : ca __ __ DEX
668d : 10 f8 __ BPL $6687 ; (plasma_run.s3 + 2)
668f : 60 __ __ RTS
--------------------------------------------------------------------
plasma_init: ; plasma_init()->void
;  38, "/home/xahmol/git/UltimateDemo2026/src/plasma.c"
.s4:
6690 : a9 00 __ LDA #$00
6692 : 85 0f __ STA P2 
6694 : 85 10 __ STA P3 
6696 : 85 43 __ STA T0 + 0 
6698 : 85 0d __ STA P0 
669a : a9 35 __ LDA #$35
669c : 85 01 __ STA $01 
669e : 20 e2 73 JSR $73e2 ; (memset@proxy + 0)
66a1 : a9 c0 __ LDA #$c0
66a3 : 85 44 __ STA T0 + 1 
66a5 : a9 00 __ LDA #$00
66a7 : 85 1f __ STA ADDR + 0 
66a9 : f0 02 __ BEQ $66ad ; (plasma_init.l7 + 0)
.s8:
66ab : e6 44 __ INC T0 + 1 
.l7:
66ad : a9 34 __ LDA #$34
66af : a0 00 __ LDY #$00
66b1 : 91 43 __ STA (T0 + 0),y 
66b3 : 18 __ __ CLC
66b4 : a5 44 __ LDA T0 + 1 
66b6 : 69 18 __ ADC #$18
66b8 : 85 20 __ STA ADDR + 1 
66ba : a9 07 __ LDA #$07
66bc : a4 43 __ LDY T0 + 0 
66be : 91 1f __ STA (ADDR + 0),y 
66c0 : 98 __ __ TYA
66c1 : 18 __ __ CLC
66c2 : 69 01 __ ADC #$01
66c4 : 85 43 __ STA T0 + 0 
66c6 : b0 e3 __ BCS $66ab ; (plasma_init.s8 + 0)
.s9:
66c8 : c9 e8 __ CMP #$e8
66ca : d0 e1 __ BNE $66ad ; (plasma_init.l7 + 0)
.s6:
66cc : a5 44 __ LDA T0 + 1 
66ce : c9 c3 __ CMP #$c3
66d0 : d0 db __ BNE $66ad ; (plasma_init.l7 + 0)
.s5:
66d2 : a9 00 __ LDA #$00
66d4 : 85 0e __ STA P1 
66d6 : 85 10 __ STA P3 
66d8 : 20 42 74 JSR $7442 ; (vic_setmode@proxy + 0)
66db : a9 00 __ LDA #$00
66dd : 8d 21 d0 STA $d021 
66e0 : 8d 20 d0 STA $d020 
.s3:
66e3 : 60 __ __ RTS
--------------------------------------------------------------------
plasma_frame@proxy: ; plasma_frame@proxy
66e4 : a5 54 __ LDA $54 
66e6 : 85 0e __ STA P1 
66e8 : a5 55 __ LDA $55 
66ea : 85 0f __ STA P2 
--------------------------------------------------------------------
plasma_frame: ; plasma_frame(u8,u8,u8)->void
;  69, "/home/xahmol/git/UltimateDemo2026/src/plasma.c"
.s4:
66ec : a2 00 __ LDX #$00
.l8:
66ee : a5 0e __ LDA P1 ; (t2 + 0)
66f0 : 29 3f __ AND #$3f
66f2 : a8 __ __ TAY
66f3 : b9 00 7b LDA $7b00,y ; (sin_lut[0] + 0)
66f6 : 9d 20 8a STA $8a20,x ; (row_sin[0] + 0)
66f9 : e6 0e __ INC P1 ; (t2 + 0)
66fb : e8 __ __ INX
66fc : e0 c8 __ CPX #$c8
66fe : d0 ee __ BNE $66ee ; (plasma_frame.l8 + 0)
.s9:
6700 : a5 0d __ LDA P0 ; (t1 + 0)
6702 : 85 0e __ STA P1 ; (t2 + 0)
6704 : a9 00 __ LDA #$00
6706 : 85 1b __ STA ACCU + 0 
.l5:
6708 : 85 4b __ STA T10 + 0 
670a : 29 07 __ AND #$07
670c : 85 43 __ STA T3 + 0 
670e : a5 1b __ LDA ACCU + 0 
6710 : 29 f8 __ AND #$f8
6712 : 85 45 __ STA T4 + 0 
6714 : 4a __ __ LSR
6715 : 4a __ __ LSR
6716 : 65 45 __ ADC T4 + 0 
6718 : 4a __ __ LSR
6719 : 6a __ __ ROR
671a : 6a __ __ ROR
671b : aa __ __ TAX
671c : 29 c0 __ AND #$c0
671e : 6a __ __ ROR
671f : 05 43 __ ORA T3 + 0 
6721 : 85 45 __ STA T4 + 0 
6723 : 8a __ __ TXA
6724 : 29 1f __ AND #$1f
6726 : 09 e0 __ ORA #$e0
6728 : 85 46 __ STA T4 + 1 
672a : a5 1b __ LDA ACCU + 0 
672c : 69 03 __ ADC #$03
672e : 85 43 __ STA T3 + 0 
6730 : a5 0e __ LDA P1 ; (t2 + 0)
6732 : 85 4d __ STA T11 + 0 
6734 : 18 __ __ CLC
6735 : 69 03 __ ADC #$03
6737 : 85 1c __ STA ACCU + 1 
6739 : a5 1b __ LDA ACCU + 0 
673b : aa __ __ TAX
673c : e8 __ __ INX
673d : 86 49 __ STX T8 + 0 
673f : 18 __ __ CLC
6740 : 69 02 __ ADC #$02
6742 : 85 47 __ STA T6 + 0 
6744 : a9 00 __ LDA #$00
6746 : 85 44 __ STA T3 + 1 
6748 : 85 48 __ STA T6 + 1 
674a : 18 __ __ CLC
674b : a5 0e __ LDA P1 ; (t2 + 0)
674d : 69 02 __ ADC #$02
674f : 85 1d __ STA ACCU + 2 
6751 : 18 __ __ CLC
6752 : 69 ff __ ADC #$ff
6754 : 85 1e __ STA ACCU + 3 
6756 : a9 00 __ LDA #$00
6758 : 85 4a __ STA T8 + 1 
675a : 85 4c __ STA T10 + 1 
675c : bd 1f 8a LDA $8a1f,x ; (tbuffer[0] + 319)
675f : 85 4e __ STA T12 + 0 
6761 : a9 28 __ LDA #$28
6763 : 85 51 __ STA T16 + 0 
6765 : a0 00 __ LDY #$00
6767 : 18 __ __ CLC
.l7:
6768 : a5 4d __ LDA T11 + 0 
676a : 29 3f __ AND #$3f
676c : aa __ __ TAX
676d : bd 00 7b LDA $7b00,x ; (sin_lut[0] + 0)
6770 : 65 4e __ ADC T12 + 0 
6772 : 85 4f __ STA T13 + 0 
6774 : a5 4c __ LDA T10 + 1 
6776 : 4a __ __ LSR
6777 : a5 4b __ LDA T10 + 0 
6779 : 6a __ __ ROR
677a : 18 __ __ CLC
677b : 65 0f __ ADC P2 ; (t3 + 0)
677d : 29 3f __ AND #$3f
677f : aa __ __ TAX
6780 : bd 00 7b LDA $7b00,x ; (sin_lut[0] + 0)
6783 : 18 __ __ CLC
6784 : 65 4f __ ADC T13 + 0 
6786 : aa __ __ TAX
6787 : bd 40 7b LDA $7b40,x ; (sum_to_col[0] + 0)
678a : 4a __ __ LSR
678b : 6a __ __ ROR
678c : 6a __ __ ROR
678d : 85 4f __ STA T13 + 0 
678f : a5 1e __ LDA ACCU + 3 
6791 : 29 3f __ AND #$3f
6793 : aa __ __ TAX
6794 : bd 00 7b LDA $7b00,x ; (sin_lut[0] + 0)
6797 : 65 4e __ ADC T12 + 0 
6799 : 85 50 __ STA T14 + 0 
679b : a5 4a __ LDA T8 + 1 
679d : 4a __ __ LSR
679e : a5 49 __ LDA T8 + 0 
67a0 : 6a __ __ ROR
67a1 : 18 __ __ CLC
67a2 : 65 0f __ ADC P2 ; (t3 + 0)
67a4 : 29 3f __ AND #$3f
67a6 : aa __ __ TAX
67a7 : bd 00 7b LDA $7b00,x ; (sin_lut[0] + 0)
67aa : 18 __ __ CLC
67ab : 65 50 __ ADC T14 + 0 
67ad : aa __ __ TAX
67ae : bd 40 7b LDA $7b40,x ; (sum_to_col[0] + 0)
67b1 : 0a __ __ ASL
67b2 : 0a __ __ ASL
67b3 : 0a __ __ ASL
67b4 : 0a __ __ ASL
67b5 : 05 4f __ ORA T13 + 0 
67b7 : 85 4f __ STA T13 + 0 
67b9 : a5 1d __ LDA ACCU + 2 
67bb : 29 3f __ AND #$3f
67bd : aa __ __ TAX
67be : bd 00 7b LDA $7b00,x ; (sin_lut[0] + 0)
67c1 : 65 4e __ ADC T12 + 0 
67c3 : 85 50 __ STA T14 + 0 
67c5 : a5 48 __ LDA T6 + 1 
67c7 : 4a __ __ LSR
67c8 : a5 47 __ LDA T6 + 0 
67ca : 6a __ __ ROR
67cb : 18 __ __ CLC
67cc : 65 0f __ ADC P2 ; (t3 + 0)
67ce : 29 3f __ AND #$3f
67d0 : aa __ __ TAX
67d1 : bd 00 7b LDA $7b00,x ; (sin_lut[0] + 0)
67d4 : 18 __ __ CLC
67d5 : 65 50 __ ADC T14 + 0 
67d7 : aa __ __ TAX
67d8 : bd 40 7b LDA $7b40,x ; (sum_to_col[0] + 0)
67db : 0a __ __ ASL
67dc : 0a __ __ ASL
67dd : 05 4f __ ORA T13 + 0 
67df : 85 4f __ STA T13 + 0 
67e1 : a5 1c __ LDA ACCU + 1 
67e3 : 29 3f __ AND #$3f
67e5 : aa __ __ TAX
67e6 : bd 00 7b LDA $7b00,x ; (sin_lut[0] + 0)
67e9 : 65 4e __ ADC T12 + 0 
67eb : 85 50 __ STA T14 + 0 
67ed : a5 44 __ LDA T3 + 1 
67ef : 4a __ __ LSR
67f0 : a5 43 __ LDA T3 + 0 
67f2 : 6a __ __ ROR
67f3 : 18 __ __ CLC
67f4 : 65 0f __ ADC P2 ; (t3 + 0)
67f6 : 29 3f __ AND #$3f
67f8 : aa __ __ TAX
67f9 : bd 00 7b LDA $7b00,x ; (sin_lut[0] + 0)
67fc : 18 __ __ CLC
67fd : 65 50 __ ADC T14 + 0 
67ff : aa __ __ TAX
6800 : bd 40 7b LDA $7b40,x ; (sum_to_col[0] + 0)
6803 : 05 4f __ ORA T13 + 0 
6805 : 91 45 __ STA (T4 + 0),y 
6807 : 18 __ __ CLC
6808 : a5 43 __ LDA T3 + 0 
680a : 69 04 __ ADC #$04
680c : 85 43 __ STA T3 + 0 
680e : 90 03 __ BCC $6813 ; (plasma_frame.s11 + 0)
.s10:
6810 : e6 44 __ INC T3 + 1 
6812 : 18 __ __ CLC
.s11:
6813 : a5 1c __ LDA ACCU + 1 
6815 : 69 04 __ ADC #$04
6817 : 85 1c __ STA ACCU + 1 
6819 : 18 __ __ CLC
681a : a5 47 __ LDA T6 + 0 
681c : 69 04 __ ADC #$04
681e : 85 47 __ STA T6 + 0 
6820 : 90 03 __ BCC $6825 ; (plasma_frame.s13 + 0)
.s12:
6822 : e6 48 __ INC T6 + 1 
6824 : 18 __ __ CLC
.s13:
6825 : a5 1d __ LDA ACCU + 2 
6827 : 69 04 __ ADC #$04
6829 : 85 1d __ STA ACCU + 2 
682b : 18 __ __ CLC
682c : a5 49 __ LDA T8 + 0 
682e : 69 04 __ ADC #$04
6830 : 85 49 __ STA T8 + 0 
6832 : 90 03 __ BCC $6837 ; (plasma_frame.s15 + 0)
.s14:
6834 : e6 4a __ INC T8 + 1 
6836 : 18 __ __ CLC
.s15:
6837 : a5 1e __ LDA ACCU + 3 
6839 : 69 04 __ ADC #$04
683b : 85 1e __ STA ACCU + 3 
683d : 18 __ __ CLC
683e : a5 4b __ LDA T10 + 0 
6840 : 69 04 __ ADC #$04
6842 : 85 4b __ STA T10 + 0 
6844 : 90 03 __ BCC $6849 ; (plasma_frame.s17 + 0)
.s16:
6846 : e6 4c __ INC T10 + 1 
6848 : 18 __ __ CLC
.s17:
6849 : a5 4d __ LDA T11 + 0 
684b : 69 04 __ ADC #$04
684d : 85 4d __ STA T11 + 0 
684f : 98 __ __ TYA
6850 : 18 __ __ CLC
6851 : 69 08 __ ADC #$08
6853 : a8 __ __ TAY
6854 : 90 03 __ BCC $6859 ; (plasma_frame.s19 + 0)
.s18:
6856 : e6 46 __ INC T4 + 1 
6858 : 18 __ __ CLC
.s19:
6859 : c6 51 __ DEC T16 + 0 
685b : f0 03 __ BEQ $6860 ; (plasma_frame.s6 + 0)
685d : 4c 68 67 JMP $6768 ; (plasma_frame.l7 + 0)
.s6:
6860 : e6 1b __ INC ACCU + 0 
6862 : a5 1b __ LDA ACCU + 0 
6864 : c9 c8 __ CMP #$c8
6866 : f0 03 __ BEQ $686b ; (plasma_frame.s3 + 0)
6868 : 4c 08 67 JMP $6708 ; (plasma_frame.l5 + 0)
.s3:
686b : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_run: ; tunnel_run()->void
;   6, "/home/xahmol/git/UltimateDemo2026/src/tunnel.h"
.s1:
686c : a2 06 __ LDX #$06
686e : b5 53 __ LDA T1 + 0,x 
6870 : 9d df bf STA $bfdf,x ; (tunnel_run@stack + 0)
6873 : ca __ __ DEX
6874 : 10 f8 __ BPL $686e ; (tunnel_run.s1 + 2)
.s4:
6876 : a9 8f __ LDA #$8f
6878 : 20 f1 15 JSR $15f1 ; (turbo_set.s4 + 0)
687b : 20 40 69 JSR $6940 ; (tunnel_build_tables.s4 + 0)
687e : 20 85 6b JSR $6b85 ; (tunnel_build_tex.s4 + 0)
6881 : 20 05 6c JSR $6c05 ; (tun_init.s4 + 0)
6884 : a9 00 __ LDA #$00
6886 : 85 55 __ STA T4 + 0 
6888 : 85 56 __ STA T5 + 0 
688a : 85 43 __ STA T0 + 0 
688c : 85 53 __ STA T1 + 0 
688e : 85 59 __ STA T7 + 0 
6890 : 85 57 __ STA T6 + 0 
6892 : 85 58 __ STA T6 + 1 
.l5:
6894 : a5 57 __ LDA T6 + 0 
6896 : 85 1b __ STA ACCU + 0 
6898 : a5 58 __ LDA T6 + 1 
689a : 85 1c __ STA ACCU + 1 
689c : a9 c8 __ LDA #$c8
689e : 85 03 __ STA WORK + 0 
68a0 : 20 37 70 JSR $7037 ; (divmod@proxy + 0)
68a3 : a4 1b __ LDY ACCU + 0 
68a5 : c4 59 __ CPY T7 + 0 
68a7 : f0 2a __ BEQ $68d3 ; (tunnel_run.s6 + 0)
.s12:
68a9 : b9 fc 77 LDA $77fc,y ; (pal_sc[0] + 0)
68ac : a2 fa __ LDX #$fa
.l14:
68ae : ca __ __ DEX
68af : 9d 00 c0 STA $c000,x 
68b2 : 9d fa c0 STA $c0fa,x 
68b5 : 9d f4 c1 STA $c1f4,x 
68b8 : 9d ee c2 STA $c2ee,x 
68bb : d0 f1 __ BNE $68ae ; (tunnel_run.l14 + 0)
.s13:
68bd : b9 4a 7b LDA $7b4a,y ; (pal_cr[0] + 0)
68c0 : a2 fa __ LDX #$fa
.l16:
68c2 : ca __ __ DEX
68c3 : 9d 00 d8 STA $d800,x 
68c6 : 9d fa d8 STA $d8fa,x 
68c9 : 9d f4 d9 STA $d9f4,x 
68cc : 9d ee da STA $daee,x 
68cf : d0 f1 __ BNE $68c2 ; (tunnel_run.l16 + 0)
.s15:
68d1 : 84 59 __ STY T7 + 0 
.s6:
68d3 : a5 55 __ LDA T4 + 0 
68d5 : 85 12 __ STA P5 
68d7 : a5 56 __ LDA T5 + 0 
68d9 : 85 13 __ STA P6 
68db : a5 43 __ LDA T0 + 0 
68dd : 85 54 __ STA T2 + 0 
68df : 29 3f __ AND #$3f
68e1 : aa __ __ TAX
68e2 : bd 4e 7b LDA $7b4e,x ; (lat_wave[0] + 0)
68e5 : 85 14 __ STA P7 
68e7 : a5 53 __ LDA T1 + 0 
68e9 : 29 3f __ AND #$3f
68eb : aa __ __ TAX
68ec : bd 8e 7b LDA $7b8e,x ; (vert_wave[0] + 0)
68ef : 85 15 __ STA P8 
68f1 : 20 59 6c JSR $6c59 ; (tunnel_render.s4 + 0)
.l7:
68f4 : 2c 11 d0 BIT $d011 
68f7 : 30 fb __ BMI $68f4 ; (tunnel_run.l7 + 0)
.l8:
68f9 : 2c 11 d0 BIT $d011 
68fc : 10 fb __ BPL $68f9 ; (tunnel_run.l8 + 0)
.s9:
68fe : e6 53 __ INC T1 + 0 
6900 : a6 54 __ LDX T2 + 0 
6902 : e8 __ __ INX
6903 : 86 43 __ STX T0 + 0 
6905 : e6 56 __ INC T5 + 0 
6907 : e6 55 __ INC T4 + 0 
6909 : e6 57 __ INC T6 + 0 
690b : d0 02 __ BNE $690f ; (tunnel_run.s18 + 0)
.s17:
690d : e6 58 __ INC T6 + 1 
.s18:
690f : a5 58 __ LDA T6 + 1 
6911 : c9 03 __ CMP #$03
6913 : f0 03 __ BEQ $6918 ; (tunnel_run.s11 + 0)
6915 : 4c 94 68 JMP $6894 ; (tunnel_run.l5 + 0)
.s11:
6918 : a5 57 __ LDA T6 + 0 
691a : c9 20 __ CMP #$20
691c : d0 f7 __ BNE $6915 ; (tunnel_run.s18 + 6)
.s10:
691e : a9 00 __ LDA #$00
6920 : 85 0d __ STA P0 
6922 : 85 0e __ STA P1 
6924 : 85 10 __ STA P3 
6926 : a9 36 __ LDA #$36
6928 : 85 01 __ STA $01 
692a : 20 0b 0f JSR $0f0b ; (vic_setmode@proxy + 0)
692d : a9 00 __ LDA #$00
692f : 8d 20 d0 STA $d020 
6932 : 8d 21 d0 STA $d021 
.s3:
6935 : a2 06 __ LDX #$06
6937 : bd df bf LDA $bfdf,x ; (tunnel_run@stack + 0)
693a : 95 53 __ STA T1 + 0,x 
693c : ca __ __ DEX
693d : 10 f8 __ BPL $6937 ; (tunnel_run.s3 + 2)
693f : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_build_tables: ; tunnel_build_tables()->void
; 160, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6940 : a9 00 __ LDA #$00
6942 : 85 4d __ STA T4 + 0 
6944 : a9 97 __ LDA #$97
6946 : 85 49 __ STA T1 + 0 
6948 : a9 ff __ LDA #$ff
694a : 85 4a __ STA T1 + 1 
.l5:
694c : a9 00 __ LDA #$00
694e : 85 4e __ STA T5 + 0 
6950 : a9 b1 __ LDA #$b1
6952 : 85 4b __ STA T2 + 0 
6954 : a9 ff __ LDA #$ff
.l6:
6956 : 85 4c __ STA T2 + 1 
6958 : 85 10 __ STA P3 
695a : a5 49 __ LDA T1 + 0 
695c : 85 0d __ STA P0 
695e : a5 4a __ LDA T1 + 1 
6960 : 85 0e __ STA P1 
6962 : a5 4b __ LDA T2 + 0 
6964 : 85 0f __ STA P2 
6966 : 20 cc 69 JSR $69cc ; (iatan2_5.s4 + 0)
6969 : a6 4e __ LDX T5 + 0 
696b : 9d 52 87 STA $8752,x ; (row_buf[0] + 0)
696e : a5 4b __ LDA T2 + 0 
6970 : 85 0d __ STA P0 
6972 : a5 4c __ LDA T2 + 1 
6974 : 85 0e __ STA P1 
6976 : a5 49 __ LDA T1 + 0 
6978 : 85 0f __ STA P2 
697a : a5 4a __ LDA T1 + 1 
697c : 85 10 __ STA P3 
697e : 20 b0 6a JSR $6ab0 ; (idist_5.s4 + 0)
6981 : a6 4e __ LDX T5 + 0 
6983 : e8 __ __ INX
6984 : 86 4e __ STX T5 + 0 
6986 : 9d a1 87 STA $87a1,x ; (row_buf[0] + 79)
6989 : 18 __ __ CLC
698a : a5 0d __ LDA P0 
698c : 69 02 __ ADC #$02
698e : 85 4b __ STA T2 + 0 
6990 : a5 0e __ LDA P1 
6992 : 69 00 __ ADC #$00
6994 : e0 50 __ CPX #$50
6996 : 90 be __ BCC $6956 ; (tunnel_build_tables.l6 + 0)
.s7:
6998 : a5 4d __ LDA T4 + 0 
699a : 85 1b __ STA ACCU + 0 
699c : a9 d0 __ LDA #$d0
699e : 85 0d __ STA P0 
69a0 : a9 00 __ LDA #$00
69a2 : 85 1c __ STA ACCU + 1 
69a4 : 85 1d __ STA ACCU + 2 
69a6 : 85 1e __ STA ACCU + 3 
69a8 : a9 a0 __ LDA #$a0
69aa : 20 88 6f JSR $6f88 ; (mul32by8 + 0)
69ad : 18 __ __ CLC
69ae : a5 09 __ LDA WORK + 6 
69b0 : 69 20 __ ADC #$20
69b2 : 85 10 __ STA P3 
69b4 : a5 0a __ LDA WORK + 7 
69b6 : 69 00 __ ADC #$00
69b8 : 85 11 __ STA P4 
69ba : 20 52 6b JSR $6b52 ; (reu_dma@proxy + 0)
69bd : e6 49 __ INC T1 + 0 
69bf : d0 02 __ BNE $69c3 ; (tunnel_build_tables.s9 + 0)
.s8:
69c1 : e6 4a __ INC T1 + 1 
.s9:
69c3 : e6 4d __ INC T4 + 0 
69c5 : a5 4d __ LDA T4 + 0 
69c7 : c9 6e __ CMP #$6e
69c9 : 90 81 __ BCC $694c ; (tunnel_build_tables.l5 + 0)
.s3:
69cb : 60 __ __ RTS
--------------------------------------------------------------------
iatan2_5: ; iatan2_5(i16,i16)->u8
; 115, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
69cc : a5 10 __ LDA P3 ; (x + 1)
69ce : 05 0f __ ORA P2 ; (x + 0)
69d0 : d0 0a __ BNE $69dc ; (iatan2_5.s5 + 0)
.s37:
69d2 : 85 0f __ STA P2 ; (x + 0)
69d4 : 85 10 __ STA P3 ; (x + 1)
69d6 : a5 0d __ LDA P0 ; (y + 0)
69d8 : 05 0e __ ORA P1 ; (y + 1)
69da : f0 77 __ BEQ $6a53 ; (iatan2_5.s3 + 0)
.s5:
69dc : 24 10 __ BIT P3 ; (x + 1)
69de : 30 09 __ BMI $69e9 ; (iatan2_5.s36 + 0)
.s6:
69e0 : a5 0f __ LDA P2 ; (x + 0)
69e2 : 85 43 __ STA T1 + 0 
69e4 : a5 10 __ LDA P3 ; (x + 1)
69e6 : 4c f4 69 JMP $69f4 ; (iatan2_5.s7 + 0)
.s36:
69e9 : 38 __ __ SEC
69ea : a9 00 __ LDA #$00
69ec : e5 0f __ SBC P2 ; (x + 0)
69ee : 85 43 __ STA T1 + 0 
69f0 : a9 00 __ LDA #$00
69f2 : e5 10 __ SBC P3 ; (x + 1)
.s7:
69f4 : a8 __ __ TAY
69f5 : 24 0e __ BIT P1 ; (y + 1)
69f7 : 30 09 __ BMI $6a02 ; (iatan2_5.s35 + 0)
.s8:
69f9 : a5 0d __ LDA P0 ; (y + 0)
69fb : 85 45 __ STA T3 + 0 
69fd : a5 0e __ LDA P1 ; (y + 1)
69ff : 4c 0d 6a JMP $6a0d ; (iatan2_5.s9 + 0)
.s35:
6a02 : 38 __ __ SEC
6a03 : a9 00 __ LDA #$00
6a05 : e5 0d __ SBC P0 ; (y + 0)
6a07 : 85 45 __ STA T3 + 0 
6a09 : a9 00 __ LDA #$00
6a0b : e5 0e __ SBC P1 ; (y + 1)
.s9:
6a0d : 85 46 __ STA T3 + 1 
6a0f : 98 __ __ TYA
6a10 : 30 53 __ BMI $6a65 ; (iatan2_5.s10 + 0)
.s34:
6a12 : c4 46 __ CPY T3 + 1 
6a14 : d0 04 __ BNE $6a1a ; (iatan2_5.s33 + 0)
.s32:
6a16 : a5 43 __ LDA T1 + 0 
6a18 : c5 45 __ CMP T3 + 0 
.s33:
6a1a : 90 49 __ BCC $6a65 ; (iatan2_5.s10 + 0)
.s21:
6a1c : 84 04 __ STY WORK + 1 
6a1e : 24 0e __ BIT P1 ; (y + 1)
6a20 : 30 04 __ BMI $6a26 ; (iatan2_5.s23 + 0)
.s22:
6a22 : a9 ff __ LDA #$ff
6a24 : b0 02 __ BCS $6a28 ; (iatan2_5.s24 + 0)
.s23:
6a26 : a9 00 __ LDA #$00
.s24:
6a28 : 85 44 __ STA T2 + 0 
6a2a : a5 46 __ LDA T3 + 1 
6a2c : 06 45 __ ASL T3 + 0 
6a2e : 2a __ __ ROL
6a2f : 06 45 __ ASL T3 + 0 
6a31 : 2a __ __ ROL
6a32 : 06 45 __ ASL T3 + 0 
6a34 : 2a __ __ ROL
6a35 : 85 1c __ STA ACCU + 1 
6a37 : a5 45 __ LDA T3 + 0 
6a39 : 85 1b __ STA ACCU + 0 
6a3b : a5 43 __ LDA T1 + 0 
6a3d : 85 03 __ STA WORK + 0 
6a3f : 20 00 70 JSR $7000 ; (divs16 + 0)
6a42 : a5 10 __ LDA P3 ; (x + 1)
6a44 : 30 04 __ BMI $6a4a ; (iatan2_5.s25 + 0)
.s31:
6a46 : 05 0f __ ORA P2 ; (x + 0)
6a48 : d0 10 __ BNE $6a5a ; (iatan2_5.s28 + 0)
.s25:
6a4a : 24 44 __ BIT T2 + 0 
6a4c : 30 06 __ BMI $6a54 ; (iatan2_5.s27 + 0)
.s26:
6a4e : 18 __ __ CLC
6a4f : a5 1b __ LDA ACCU + 0 
6a51 : 69 10 __ ADC #$10
.s3:
6a53 : 60 __ __ RTS
.s27:
6a54 : a9 10 __ LDA #$10
.s38:
6a56 : 38 __ __ SEC
6a57 : e5 1b __ SBC ACCU + 0 
6a59 : 60 __ __ RTS
.s28:
6a5a : 24 44 __ BIT T2 + 0 
6a5c : 10 03 __ BPL $6a61 ; (iatan2_5.s29 + 0)
.s30:
6a5e : a5 1b __ LDA ACCU + 0 
6a60 : 60 __ __ RTS
.s29:
6a61 : a9 20 __ LDA #$20
6a63 : d0 f1 __ BNE $6a56 ; (iatan2_5.s38 + 0)
.s10:
6a65 : 24 10 __ BIT P3 ; (x + 1)
6a67 : 30 04 __ BMI $6a6d ; (iatan2_5.s12 + 0)
.s11:
6a69 : a9 ff __ LDA #$ff
6a6b : d0 02 __ BNE $6a6f ; (iatan2_5.s13 + 0)
.s12:
6a6d : a9 00 __ LDA #$00
.s13:
6a6f : 85 47 __ STA T4 + 0 
6a71 : 98 __ __ TYA
6a72 : 06 43 __ ASL T1 + 0 
6a74 : 2a __ __ ROL
6a75 : 06 43 __ ASL T1 + 0 
6a77 : 2a __ __ ROL
6a78 : 06 43 __ ASL T1 + 0 
6a7a : 2a __ __ ROL
6a7b : 85 1c __ STA ACCU + 1 
6a7d : a5 43 __ LDA T1 + 0 
6a7f : 85 1b __ STA ACCU + 0 
6a81 : a5 45 __ LDA T3 + 0 
6a83 : 85 03 __ STA WORK + 0 
6a85 : a5 46 __ LDA T3 + 1 
6a87 : 85 04 __ STA WORK + 1 
6a89 : 20 00 70 JSR $7000 ; (divs16 + 0)
6a8c : a5 0e __ LDA P1 ; (y + 1)
6a8e : 30 04 __ BMI $6a94 ; (iatan2_5.s14 + 0)
.s20:
6a90 : 05 0d __ ORA P0 ; (y + 0)
6a92 : d0 0e __ BNE $6aa2 ; (iatan2_5.s17 + 0)
.s14:
6a94 : 24 47 __ BIT T4 + 0 
6a96 : 10 06 __ BPL $6a9e ; (iatan2_5.s15 + 0)
.s16:
6a98 : 18 __ __ CLC
6a99 : a5 1b __ LDA ACCU + 0 
6a9b : 69 18 __ ADC #$18
6a9d : 60 __ __ RTS
.s15:
6a9e : a9 18 __ LDA #$18
6aa0 : d0 b4 __ BNE $6a56 ; (iatan2_5.s38 + 0)
.s17:
6aa2 : 24 47 __ BIT T4 + 0 
6aa4 : 10 04 __ BPL $6aaa ; (iatan2_5.s18 + 0)
.s19:
6aa6 : a9 08 __ LDA #$08
6aa8 : d0 ac __ BNE $6a56 ; (iatan2_5.s38 + 0)
.s18:
6aaa : 18 __ __ CLC
6aab : a5 1b __ LDA ACCU + 0 
6aad : 69 08 __ ADC #$08
6aaf : 60 __ __ RTS
--------------------------------------------------------------------
idist_5: ; idist_5(i16,i16)->u8
; 137, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6ab0 : a5 0f __ LDA P2 ; (dy + 0)
6ab2 : 85 03 __ STA WORK + 0 
6ab4 : 85 1b __ STA ACCU + 0 
6ab6 : a5 10 __ LDA P3 ; (dy + 1)
6ab8 : 85 04 __ STA WORK + 1 
6aba : 85 1c __ STA ACCU + 1 
6abc : 20 be 6f JSR $6fbe ; (mul16 + 0)
6abf : a5 05 __ LDA WORK + 2 
6ac1 : 85 43 __ STA T0 + 0 
6ac3 : a5 06 __ LDA WORK + 3 
6ac5 : 85 44 __ STA T0 + 1 
6ac7 : a5 0d __ LDA P0 ; (dx + 0)
6ac9 : 85 03 __ STA WORK + 0 
6acb : 85 1b __ STA ACCU + 0 
6acd : a5 0e __ LDA P1 ; (dx + 1)
6acf : 85 04 __ STA WORK + 1 
6ad1 : 85 1c __ STA ACCU + 1 
6ad3 : 20 be 6f JSR $6fbe ; (mul16 + 0)
6ad6 : 18 __ __ CLC
6ad7 : a5 05 __ LDA WORK + 2 
6ad9 : 65 43 __ ADC T0 + 0 
6adb : 85 43 __ STA T0 + 0 
6add : a5 06 __ LDA WORK + 3 
6adf : 65 44 __ ADC T0 + 1 
6ae1 : 85 44 __ STA T0 + 1 
6ae3 : 05 43 __ ORA T0 + 0 
6ae5 : f0 64 __ BEQ $6b4b ; (idist_5.s11 + 0)
.s5:
6ae7 : a5 44 __ LDA T0 + 1 
6ae9 : 4a __ __ LSR
6aea : 85 46 __ STA T1 + 1 
6aec : a5 43 __ LDA T0 + 0 
6aee : 6a __ __ ROR
6aef : 85 45 __ STA T1 + 0 
6af1 : 05 46 __ ORA T1 + 1 
6af3 : d0 08 __ BNE $6afd ; (idist_5.l6 + 0)
.s10:
6af5 : a9 01 __ LDA #$01
6af7 : 85 45 __ STA T1 + 0 
6af9 : a9 00 __ LDA #$00
6afb : 85 46 __ STA T1 + 1 
.l6:
6afd : a5 45 __ LDA T1 + 0 
6aff : 85 03 __ STA WORK + 0 
6b01 : 85 47 __ STA T2 + 0 
6b03 : a5 46 __ LDA T1 + 1 
6b05 : 85 04 __ STA WORK + 1 
6b07 : 85 48 __ STA T2 + 1 
6b09 : a5 43 __ LDA T0 + 0 
6b0b : 85 1b __ STA ACCU + 0 
6b0d : a5 44 __ LDA T0 + 1 
6b0f : 85 1c __ STA ACCU + 1 
6b11 : 20 3b 70 JSR $703b ; (divmod + 0)
6b14 : 18 __ __ CLC
6b15 : a5 1b __ LDA ACCU + 0 
6b17 : 65 45 __ ADC T1 + 0 
6b19 : 85 45 __ STA T1 + 0 
6b1b : a5 1c __ LDA ACCU + 1 
6b1d : 65 46 __ ADC T1 + 1 
6b1f : 4a __ __ LSR
6b20 : 85 46 __ STA T1 + 1 
6b22 : 66 45 __ ROR T1 + 0 
6b24 : c5 48 __ CMP T2 + 1 
6b26 : 90 d5 __ BCC $6afd ; (idist_5.l6 + 0)
.s12:
6b28 : d0 24 __ BNE $6b4e ; (idist_5.s13 + 0)
.s9:
6b2a : a5 45 __ LDA T1 + 0 
6b2c : c5 47 __ CMP T2 + 0 
6b2e : 90 cd __ BCC $6afd ; (idist_5.l6 + 0)
.s7:
6b30 : 85 03 __ STA WORK + 0 
6b32 : a9 20 __ LDA #$20
6b34 : 85 1b __ STA ACCU + 0 
6b36 : a9 03 __ LDA #$03
6b38 : 85 1c __ STA ACCU + 1 
6b3a : a5 46 __ LDA T1 + 1 
6b3c : 85 04 __ STA WORK + 1 
6b3e : 20 3b 70 JSR $703b ; (divmod + 0)
6b41 : a5 1c __ LDA ACCU + 1 
6b43 : d0 06 __ BNE $6b4b ; (idist_5.s11 + 0)
.s8:
6b45 : a5 1b __ LDA ACCU + 0 
6b47 : c9 20 __ CMP #$20
6b49 : 90 02 __ BCC $6b4d ; (idist_5.s3 + 0)
.s11:
6b4b : a9 1f __ LDA #$1f
.s3:
6b4d : 60 __ __ RTS
.s13:
6b4e : a5 45 __ LDA T1 + 0 
6b50 : b0 de __ BCS $6b30 ; (idist_5.s7 + 0)
--------------------------------------------------------------------
reu_dma@proxy: ; reu_dma@proxy
6b52 : a5 07 __ LDA WORK + 4 
6b54 : 85 0e __ STA P1 
6b56 : a5 08 __ LDA WORK + 5 
6b58 : 85 0f __ STA P2 
--------------------------------------------------------------------
reu_dma: ; reu_dma(u8,u32,void*,u8)->void
;  94, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6b5a : 78 __ __ SEI
6b5b : a9 52 __ LDA #$52
6b5d : 8d 02 df STA $df02 
6b60 : a9 87 __ LDA #$87
6b62 : 8d 03 df STA $df03 
6b65 : a5 0e __ LDA P1 ; (reu_addr + 0)
6b67 : 8d 04 df STA $df04 
6b6a : a5 0f __ LDA P2 ; (reu_addr + 1)
6b6c : 8d 05 df STA $df05 
6b6f : a5 10 __ LDA P3 ; (reu_addr + 2)
6b71 : 8d 06 df STA $df06 
6b74 : a9 a0 __ LDA #$a0
6b76 : 8d 07 df STA $df07 
6b79 : a9 00 __ LDA #$00
6b7b : 8d 08 df STA $df08 
6b7e : a5 0d __ LDA P0 ; (cmd + 0)
6b80 : 8d 01 df STA $df01 
6b83 : 58 __ __ CLI
.s3:
6b84 : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_build_tex: ; tunnel_build_tex()->void
; 182, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6b85 : a9 00 __ LDA #$00
6b87 : 85 1b __ STA ACCU + 0 
.l5:
6b89 : 29 04 __ AND #$04
6b8b : 4a __ __ LSR
6b8c : 4a __ __ LSR
6b8d : f0 02 __ BEQ $6b91 ; (tunnel_build_tex.s14 + 0)
.s13:
6b8f : a9 04 __ LDA #$04
.s14:
6b91 : 85 43 __ STA T1 + 0 
6b93 : a5 1b __ LDA ACCU + 0 
6b95 : 0a __ __ ASL
6b96 : 0a __ __ ASL
6b97 : 0a __ __ ASL
6b98 : 0a __ __ ASL
6b99 : 85 45 __ STA T2 + 0 
6b9b : a9 00 __ LDA #$00
6b9d : 85 1c __ STA ACCU + 1 
6b9f : 2a __ __ ROL
6ba0 : 06 45 __ ASL T2 + 0 
6ba2 : 2a __ __ ROL
6ba3 : 85 46 __ STA T2 + 1 
6ba5 : a5 1b __ LDA ACCU + 0 
6ba7 : 29 03 __ AND #$03
6ba9 : f0 3b __ BEQ $6be6 ; (tunnel_build_tex.s11 + 0)
.l6:
6bab : 18 __ __ CLC
6bac : a5 43 __ LDA T1 + 0 
6bae : 65 1c __ ADC ACCU + 1 
6bb0 : 29 1f __ AND #$1f
6bb2 : aa __ __ TAX
6bb3 : 29 07 __ AND #$07
6bb5 : d0 04 __ BNE $6bbb ; (tunnel_build_tex.s7 + 0)
.s10:
6bb7 : a9 02 __ LDA #$02
6bb9 : d0 05 __ BNE $6bc0 ; (tunnel_build_tex.s8 + 0)
.s7:
6bbb : 8a __ __ TXA
6bbc : 29 04 __ AND #$04
6bbe : 4a __ __ LSR
6bbf : 4a __ __ LSR
.s8:
6bc0 : aa __ __ TAX
6bc1 : a5 45 __ LDA T2 + 0 
6bc3 : 05 1c __ ORA ACCU + 1 
6bc5 : 18 __ __ CLC
6bc6 : 69 e8 __ ADC #$e8
6bc8 : 85 47 __ STA T5 + 0 
6bca : a9 8a __ LDA #$8a
6bcc : 65 46 __ ADC T2 + 1 
6bce : 85 48 __ STA T5 + 1 
6bd0 : 8a __ __ TXA
6bd1 : a0 00 __ LDY #$00
6bd3 : 91 47 __ STA (T5 + 0),y 
6bd5 : e6 1c __ INC ACCU + 1 
6bd7 : a5 1c __ LDA ACCU + 1 
6bd9 : c9 20 __ CMP #$20
6bdb : d0 ce __ BNE $6bab ; (tunnel_build_tex.l6 + 0)
.s9:
6bdd : e6 1b __ INC ACCU + 0 
6bdf : a5 1b __ LDA ACCU + 0 
6be1 : c9 20 __ CMP #$20
6be3 : d0 a4 __ BNE $6b89 ; (tunnel_build_tex.l5 + 0)
.s3:
6be5 : 60 __ __ RTS
.s11:
6be6 : 85 43 __ STA T1 + 0 
6be8 : a6 45 __ LDX T2 + 0 
.l12:
6bea : 8a __ __ TXA
6beb : 05 1c __ ORA ACCU + 1 
6bed : 18 __ __ CLC
6bee : 69 e8 __ ADC #$e8
6bf0 : a8 __ __ TAY
6bf1 : a9 8a __ LDA #$8a
6bf3 : 65 46 __ ADC T2 + 1 
6bf5 : 85 44 __ STA T1 + 1 
6bf7 : a9 03 __ LDA #$03
6bf9 : 91 43 __ STA (T1 + 0),y 
6bfb : e6 1c __ INC ACCU + 1 
6bfd : a5 1c __ LDA ACCU + 1 
6bff : c9 20 __ CMP #$20
6c01 : d0 e7 __ BNE $6bea ; (tunnel_build_tex.l12 + 0)
6c03 : f0 d8 __ BEQ $6bdd ; (tunnel_build_tex.s9 + 0)
--------------------------------------------------------------------
tun_init: ; tun_init()->void
; 266, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6c05 : a9 00 __ LDA #$00
6c07 : 85 0f __ STA P2 
6c09 : 85 10 __ STA P3 
6c0b : 85 43 __ STA T0 + 0 
6c0d : 85 0d __ STA P0 
6c0f : a9 35 __ LDA #$35
6c11 : 85 01 __ STA $01 
6c13 : 20 e2 73 JSR $73e2 ; (memset@proxy + 0)
6c16 : a9 c0 __ LDA #$c0
6c18 : 85 44 __ STA T0 + 1 
6c1a : a9 00 __ LDA #$00
6c1c : 85 1f __ STA ADDR + 0 
6c1e : f0 02 __ BEQ $6c22 ; (tun_init.l7 + 0)
.s8:
6c20 : e6 44 __ INC T0 + 1 
.l7:
6c22 : a9 f9 __ LDA #$f9
6c24 : a0 00 __ LDY #$00
6c26 : 91 43 __ STA (T0 + 0),y 
6c28 : 18 __ __ CLC
6c29 : a5 44 __ LDA T0 + 1 
6c2b : 69 18 __ ADC #$18
6c2d : 85 20 __ STA ADDR + 1 
6c2f : a9 01 __ LDA #$01
6c31 : a4 43 __ LDY T0 + 0 
6c33 : 91 1f __ STA (ADDR + 0),y 
6c35 : 98 __ __ TYA
6c36 : 18 __ __ CLC
6c37 : 69 01 __ ADC #$01
6c39 : 85 43 __ STA T0 + 0 
6c3b : b0 e3 __ BCS $6c20 ; (tun_init.s8 + 0)
.s9:
6c3d : c9 e8 __ CMP #$e8
6c3f : d0 e1 __ BNE $6c22 ; (tun_init.l7 + 0)
.s6:
6c41 : a5 44 __ LDA T0 + 1 
6c43 : c9 c3 __ CMP #$c3
6c45 : d0 db __ BNE $6c22 ; (tun_init.l7 + 0)
.s5:
6c47 : a9 00 __ LDA #$00
6c49 : 85 0e __ STA P1 
6c4b : 85 10 __ STA P3 
6c4d : 20 42 74 JSR $7442 ; (vic_setmode@proxy + 0)
6c50 : a9 00 __ LDA #$00
6c52 : 8d 21 d0 STA $d021 
6c55 : 8d 20 d0 STA $d020 
.s3:
6c58 : 60 __ __ RTS
--------------------------------------------------------------------
tunnel_render: ; tunnel_render(u8,u8,i8,i8)->void
; 209, "/home/xahmol/git/UltimateDemo2026/src/tunnel.c"
.s4:
6c59 : 18 __ __ CLC
6c5a : a5 15 __ LDA P8 ; (vert_j + 0)
6c5c : 69 05 __ ADC #$05
6c5e : 85 51 __ STA T12 + 0 
6c60 : a9 00 __ LDA #$00
6c62 : 85 52 __ STA T13 + 0 
6c64 : a9 d1 __ LDA #$d1
6c66 : 85 0d __ STA P0 
.l5:
6c68 : a5 51 __ LDA T12 + 0 
6c6a : 85 1b __ STA ACCU + 0 
6c6c : a9 00 __ LDA #$00
6c6e : 85 1c __ STA ACCU + 1 
6c70 : 85 1d __ STA ACCU + 2 
6c72 : 85 1e __ STA ACCU + 3 
6c74 : a9 a0 __ LDA #$a0
6c76 : 20 88 6f JSR $6f88 ; (mul32by8 + 0)
6c79 : 18 __ __ CLC
6c7a : a5 09 __ LDA WORK + 6 
6c7c : 69 20 __ ADC #$20
6c7e : 85 10 __ STA P3 
6c80 : a5 0a __ LDA WORK + 7 
6c82 : 69 00 __ ADC #$00
6c84 : 85 11 __ STA P4 
6c86 : 20 52 6b JSR $6b52 ; (reu_dma@proxy + 0)
6c89 : a5 52 __ LDA T13 + 0 
6c8b : 4a __ __ LSR
6c8c : 4a __ __ LSR
6c8d : 4a __ __ LSR
6c8e : aa __ __ TAX
6c8f : a5 52 __ LDA T13 + 0 
6c91 : 29 07 __ AND #$07
6c93 : 1d 9d 73 ORA $739d,x ; (__multab320L + 0)
6c96 : 85 43 __ STA T1 + 0 
6c98 : bd aa 73 LDA $73aa,x ; (__multab320H + 0)
6c9b : 09 e0 __ ORA #$e0
6c9d : 85 44 __ STA T1 + 1 
6c9f : 38 __ __ SEC
6ca0 : a9 c7 __ LDA #$c7
6ca2 : e5 52 __ SBC T13 + 0 
6ca4 : aa __ __ TAX
6ca5 : 29 07 __ AND #$07
6ca7 : 85 1c __ STA ACCU + 1 
6ca9 : 8a __ __ TXA
6caa : 4a __ __ LSR
6cab : 4a __ __ LSR
6cac : 4a __ __ LSR
6cad : 85 1b __ STA ACCU + 0 
6caf : 0a __ __ ASL
6cb0 : 0a __ __ ASL
6cb1 : 65 1b __ ADC ACCU + 0 
6cb3 : 4a __ __ LSR
6cb4 : 6a __ __ ROR
6cb5 : aa __ __ TAX
6cb6 : 29 80 __ AND #$80
6cb8 : 6a __ __ ROR
6cb9 : 05 1c __ ORA ACCU + 1 
6cbb : 85 1b __ STA ACCU + 0 
6cbd : 8a __ __ TXA
6cbe : 29 3f __ AND #$3f
6cc0 : 69 e0 __ ADC #$e0
6cc2 : 85 1c __ STA ACCU + 1 
6cc4 : a9 00 __ LDA #$00
6cc6 : 85 1d __ STA ACCU + 2 
.l6:
6cc8 : 0a __ __ ASL
6cc9 : 18 __ __ CLC
6cca : 65 14 __ ADC P7 ; (lat_j + 0)
6ccc : 85 45 __ STA T4 + 0 
6cce : aa __ __ TAX
6ccf : a8 __ __ TAY
6cd0 : c8 __ __ INY
6cd1 : 24 45 __ BIT T4 + 0 
6cd3 : 10 03 __ BPL $6cd8 ; (tunnel_render.s7 + 0)
6cd5 : 4c e5 6d JMP $6de5 ; (tunnel_render.s13 + 0)
.s7:
6cd8 : a9 4f __ LDA #$4f
6cda : c5 45 __ CMP T4 + 0 
6cdc : b0 02 __ BCS $6ce0 ; (tunnel_render.s8 + 0)
.s12:
6cde : 85 45 __ STA T4 + 0 
.s8:
6ce0 : 8a __ __ TXA
6ce1 : 30 06 __ BMI $6ce9 ; (tunnel_render.s9 + 0)
.s20:
6ce3 : c9 4f __ CMP #$4f
6ce5 : 90 02 __ BCC $6ce9 ; (tunnel_render.s9 + 0)
.s11:
6ce7 : a0 4f __ LDY #$4f
.s9:
6ce9 : 84 47 __ STY T5 + 0 
6ceb : a5 13 __ LDA P6 ; (t_dist + 0)
6ced : a6 45 __ LDX T4 + 0 
6cef : 18 __ __ CLC
6cf0 : 7d a2 87 ADC $87a2,x ; (row_buf[0] + 80)
6cf3 : 29 1f __ AND #$1f
6cf5 : 0a __ __ ASL
6cf6 : 0a __ __ ASL
6cf7 : 0a __ __ ASL
6cf8 : 0a __ __ ASL
6cf9 : 85 49 __ STA T6 + 0 
6cfb : a9 00 __ LDA #$00
6cfd : 2a __ __ ROL
6cfe : 06 49 __ ASL T6 + 0 
6d00 : 2a __ __ ROL
6d01 : 85 4a __ STA T6 + 1 
6d03 : bd 52 87 LDA $8752,x ; (row_buf[0] + 0)
6d06 : 85 45 __ STA T4 + 0 
6d08 : 65 12 __ ADC P5 ; (t_ang + 0)
6d0a : 29 1f __ AND #$1f
6d0c : 05 49 __ ORA T6 + 0 
6d0e : 18 __ __ CLC
6d0f : 69 e8 __ ADC #$e8
6d11 : 85 4d __ STA T9 + 0 
6d13 : a9 8a __ LDA #$8a
6d15 : 65 4a __ ADC T6 + 1 
6d17 : 85 4e __ STA T9 + 1 
6d19 : a0 00 __ LDY #$00
6d1b : b1 4d __ LDA (T9 + 0),y 
6d1d : aa __ __ TAX
6d1e : 4a __ __ LSR
6d1f : 85 50 __ STA T10 + 1 
6d21 : 98 __ __ TYA
6d22 : 6a __ __ ROR
6d23 : 66 50 __ ROR T10 + 1 
6d25 : 6a __ __ ROR
6d26 : 85 4f __ STA T10 + 0 
6d28 : 8a __ __ TXA
6d29 : 0a __ __ ASL
6d2a : 0a __ __ ASL
6d2b : 0a __ __ ASL
6d2c : 0a __ __ ASL
6d2d : 05 4f __ ORA T10 + 0 
6d2f : 85 4d __ STA T9 + 0 
6d31 : a6 47 __ LDX T5 + 0 
6d33 : bd a2 87 LDA $87a2,x ; (row_buf[0] + 80)
6d36 : 18 __ __ CLC
6d37 : 65 13 __ ADC P6 ; (t_dist + 0)
6d39 : 29 1f __ AND #$1f
6d3b : 0a __ __ ASL
6d3c : 0a __ __ ASL
6d3d : 0a __ __ ASL
6d3e : 0a __ __ ASL
6d3f : 85 4b __ STA T7 + 0 
6d41 : 98 __ __ TYA
6d42 : 2a __ __ ROL
6d43 : 06 4b __ ASL T7 + 0 
6d45 : 2a __ __ ROL
6d46 : 85 4c __ STA T7 + 1 
6d48 : bd 52 87 LDA $8752,x ; (row_buf[0] + 0)
6d4b : 85 47 __ STA T5 + 0 
6d4d : 65 12 __ ADC P5 ; (t_ang + 0)
6d4f : 29 1f __ AND #$1f
6d51 : 05 4b __ ORA T7 + 0 
6d53 : 18 __ __ CLC
6d54 : 69 e8 __ ADC #$e8
6d56 : 85 4f __ STA T10 + 0 
6d58 : a9 8a __ LDA #$8a
6d5a : 65 4c __ ADC T7 + 1 
6d5c : 85 50 __ STA T10 + 1 
6d5e : b1 4f __ LDA (T10 + 0),y 
6d60 : 0a __ __ ASL
6d61 : 0a __ __ ASL
6d62 : 05 4d __ ORA T9 + 0 
6d64 : 11 4f __ ORA (T10 + 0),y 
6d66 : 91 43 __ STA (T1 + 0),y 
6d68 : 38 __ __ SEC
6d69 : a9 20 __ LDA #$20
6d6b : e5 45 __ SBC T4 + 0 
6d6d : 18 __ __ CLC
6d6e : 65 12 __ ADC P5 ; (t_ang + 0)
6d70 : 29 1f __ AND #$1f
6d72 : 05 49 __ ORA T6 + 0 
6d74 : 18 __ __ CLC
6d75 : 69 e8 __ ADC #$e8
6d77 : 85 45 __ STA T4 + 0 
6d79 : a9 8a __ LDA #$8a
6d7b : 65 4a __ ADC T6 + 1 
6d7d : 85 46 __ STA T4 + 1 
6d7f : b1 45 __ LDA (T4 + 0),y 
6d81 : aa __ __ TAX
6d82 : 4a __ __ LSR
6d83 : 85 4a __ STA T6 + 1 
6d85 : 98 __ __ TYA
6d86 : 6a __ __ ROR
6d87 : 66 4a __ ROR T6 + 1 
6d89 : 6a __ __ ROR
6d8a : 85 49 __ STA T6 + 0 
6d8c : 8a __ __ TXA
6d8d : 0a __ __ ASL
6d8e : 0a __ __ ASL
6d8f : 0a __ __ ASL
6d90 : 0a __ __ ASL
6d91 : 05 49 __ ORA T6 + 0 
6d93 : 85 45 __ STA T4 + 0 
6d95 : 38 __ __ SEC
6d96 : a9 20 __ LDA #$20
6d98 : e5 47 __ SBC T5 + 0 
6d9a : 18 __ __ CLC
6d9b : 65 12 __ ADC P5 ; (t_ang + 0)
6d9d : 29 1f __ AND #$1f
6d9f : 05 4b __ ORA T7 + 0 
6da1 : 18 __ __ CLC
6da2 : 69 e8 __ ADC #$e8
6da4 : 85 47 __ STA T5 + 0 
6da6 : a9 8a __ LDA #$8a
6da8 : 65 4c __ ADC T7 + 1 
6daa : 85 48 __ STA T5 + 1 
6dac : b1 47 __ LDA (T5 + 0),y 
6dae : 0a __ __ ASL
6daf : 0a __ __ ASL
6db0 : 05 45 __ ORA T4 + 0 
6db2 : 11 47 __ ORA (T5 + 0),y 
6db4 : 91 1b __ STA (ACCU + 0),y 
6db6 : 18 __ __ CLC
6db7 : a5 43 __ LDA T1 + 0 
6db9 : 69 08 __ ADC #$08
6dbb : 85 43 __ STA T1 + 0 
6dbd : 90 03 __ BCC $6dc2 ; (tunnel_render.s17 + 0)
.s16:
6dbf : e6 44 __ INC T1 + 1 
6dc1 : 18 __ __ CLC
.s17:
6dc2 : a5 1b __ LDA ACCU + 0 
6dc4 : 69 08 __ ADC #$08
6dc6 : 85 1b __ STA ACCU + 0 
6dc8 : 90 02 __ BCC $6dcc ; (tunnel_render.s19 + 0)
.s18:
6dca : e6 1c __ INC ACCU + 1 
.s19:
6dcc : e6 1d __ INC ACCU + 2 
6dce : a5 1d __ LDA ACCU + 2 
6dd0 : c9 28 __ CMP #$28
6dd2 : f0 03 __ BEQ $6dd7 ; (tunnel_render.s10 + 0)
6dd4 : 4c c8 6c JMP $6cc8 ; (tunnel_render.l6 + 0)
.s10:
6dd7 : e6 51 __ INC T12 + 0 
6dd9 : e6 52 __ INC T13 + 0 
6ddb : a5 52 __ LDA T13 + 0 
6ddd : c9 64 __ CMP #$64
6ddf : f0 03 __ BEQ $6de4 ; (tunnel_render.s3 + 0)
6de1 : 4c 68 6c JMP $6c68 ; (tunnel_render.l5 + 0)
.s3:
6de4 : 60 __ __ RTS
.s13:
6de5 : a9 00 __ LDA #$00
6de7 : 85 45 __ STA T4 + 0 
6de9 : 8a __ __ TXA
6dea : 30 03 __ BMI $6def ; (tunnel_render.s15 + 0)
6dec : 4c e3 6c JMP $6ce3 ; (tunnel_render.s20 + 0)
.s15:
6def : e0 ff __ CPX #$ff
6df1 : 90 03 __ BCC $6df6 ; (tunnel_render.s14 + 0)
6df3 : 4c e0 6c JMP $6ce0 ; (tunnel_render.s8 + 0)
.s14:
6df6 : a0 00 __ LDY #$00
6df8 : 4c e9 6c JMP $6ce9 ; (tunnel_render.s9 + 0)
--------------------------------------------------------------------
modplay_stop: ; modplay_stop()->void
; 249, "/home/xahmol/git/UltimateDemo2026/include/modplay.h"
.s4:
6dfb : 78 __ __ SEI
6dfc : a9 00 __ LDA #$00
6dfe : 8d 08 84 STA $8408 ; (modplay.active + 0)
6e01 : 8d 20 df STA $df20 
6e04 : 8d 40 df STA $df40 
6e07 : 8d 60 df STA $df60 
6e0a : 8d 80 df STA $df80 
6e0d : ad eb 7b LDA $7beb ; (mod_saved_irq[0] + 0)
6e10 : 8d 14 03 STA $0314 
6e13 : ad ec 7b LDA $7bec ; (mod_saved_irq[0] + 1)
6e16 : 8d 15 03 STA $0315 
6e19 : a9 7f __ LDA #$7f
6e1b : 8d 0d dc STA $dc0d 
6e1e : a9 25 __ LDA #$25
6e20 : 8d 04 dc STA $dc04 
6e23 : a9 4d __ LDA #$4d
6e25 : 8d 05 dc STA $dc05 
6e28 : a9 81 __ LDA #$81
6e2a : 8d 0d dc STA $dc0d 
6e2d : a9 01 __ LDA #$01
6e2f : 8d 0e dc STA $dc0e 
6e32 : 58 __ __ CLI
.s3:
6e33 : 60 __ __ RTS
--------------------------------------------------------------------
6e34 : __ __ __ BYT 65 4e 44 20 4f 46 20 64 45 4d 4f 20 73 45 51 55 : eND OF dEMO sEQU
6e44 : __ __ __ BYT 45 4e 43 45 00                                  : ENCE.
--------------------------------------------------------------------
6e49 : __ __ __ BYT 64 45 4d 4f 20 53 45 51 55 45 4e 43 45 20 43 4f : dEMO SEQUENCE CO
6e59 : __ __ __ BYT 4d 50 4c 45 54 45 2e 00                         : MPLETE..
--------------------------------------------------------------------
6e61 : __ __ __ BYT 67 45 41 52 20 00                               : gEAR .
--------------------------------------------------------------------
6e67 : __ __ __ BYT 31 20 54 4f 20 36 34 20 6d 68 5a 2c 20 31 36 20 : 1 TO 64 mhZ, 16 
6e77 : __ __ __ BYT 53 54 45 50 53 00                               : STEPS.
--------------------------------------------------------------------
6e7d : __ __ __ BYT 62 41 4c 4c 20 00                               : bALL .
--------------------------------------------------------------------
6e83 : __ __ __ BYT 33 64 20 42 41 4c 4c 20 2b 20 47 52 49 44 00    : 3d BALL + GRID.
--------------------------------------------------------------------
6e92 : __ __ __ BYT 76 45 43 54 20 00                               : vECT .
--------------------------------------------------------------------
6e98 : __ __ __ BYT 33 64 20 57 49 52 45 46 52 41 4d 45 20 43 55 42 : 3d WIREFRAME CUB
6ea8 : __ __ __ BYT 45 00                                           : E.
--------------------------------------------------------------------
6eaa : __ __ __ BYT 70 4c 41 53 20 00                               : pLAS .
--------------------------------------------------------------------
6eb0 : __ __ __ BYT 70 4c 41 53 4d 41 20 49 4e 54 45 52 46 45 52 45 : pLASMA INTERFERE
6ec0 : __ __ __ BYT 4e 43 45 00                                     : NCE.
--------------------------------------------------------------------
6ec4 : __ __ __ BYT 66 52 41 43 54 00                               : fRACT.
--------------------------------------------------------------------
6eca : __ __ __ BYT 6d 41 4e 44 45 4c 42 52 4f 54 20 6d 63 20 46 52 : mANDELBROT mc FR
6eda : __ __ __ BYT 41 43 54 41 4c 00                               : ACTAL.
--------------------------------------------------------------------
6ee0 : __ __ __ BYT 74 55 4e 4c 20 00                               : tUNL .
--------------------------------------------------------------------
6ee6 : __ __ __ BYT 33 64 20 54 45 58 54 55 52 45 20 54 55 4e 4e 45 : 3d TEXTURE TUNNE
6ef6 : __ __ __ BYT 4c 00                                           : L.
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
6ef8 : a9 7f __ LDA #$7f
6efa : 85 03 __ STA WORK + 0 
6efc : 4c 00 70 JMP $7000 ; (divs16 + 0)
--------------------------------------------------------------------
uii_target:
6eff : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
6f00 : __ __ __ BYT 34 45 56 2e 4d 4f 44 3a 20 46 4f 52 45 56 45 52 : 4EV.MOD: FOREVER
6f10 : __ __ __ BYT 20 59 4f 55 4e 47 00                            :  YOUNG.
--------------------------------------------------------------------
6f17 : __ __ __ BYT 75 4c 54 49 4d 41 54 45 20 36 34 20 41 54 20 36 : uLTIMATE 64 AT 6
6f27 : __ __ __ BYT 34 20 6d 68 5a 20 54 55 52 42 4f 3a 00          : 4 mhZ TURBO:.
--------------------------------------------------------------------
6f34 : __ __ __ BYT 54 48 45 20 46 41 53 54 45 53 54 20 63 36 34 20 : THE FASTEST c64 
6f44 : __ __ __ BYT 43 4f 4d 50 41 54 49 42 4c 45 2e 00             : COMPATIBLE..
--------------------------------------------------------------------
mul16by8: ; mul16by8
6f50 : 4a __ __ LSR
6f51 : f0 2e __ BEQ $6f81 ; (mul16by8 + 49)
6f53 : a2 00 __ LDX #$00
6f55 : a0 00 __ LDY #$00
6f57 : 90 13 __ BCC $6f6c ; (mul16by8 + 28)
6f59 : a4 1b __ LDY ACCU + 0 
6f5b : a6 1c __ LDX ACCU + 1 
6f5d : b0 0d __ BCS $6f6c ; (mul16by8 + 28)
6f5f : 85 02 __ STA $02 
6f61 : 18 __ __ CLC
6f62 : 98 __ __ TYA
6f63 : 65 1b __ ADC ACCU + 0 
6f65 : a8 __ __ TAY
6f66 : 8a __ __ TXA
6f67 : 65 1c __ ADC ACCU + 1 
6f69 : aa __ __ TAX
6f6a : a5 02 __ LDA $02 
6f6c : 06 1b __ ASL ACCU + 0 
6f6e : 26 1c __ ROL ACCU + 1 
6f70 : 4a __ __ LSR
6f71 : 90 f9 __ BCC $6f6c ; (mul16by8 + 28)
6f73 : d0 ea __ BNE $6f5f ; (mul16by8 + 15)
6f75 : 18 __ __ CLC
6f76 : 98 __ __ TYA
6f77 : 65 1b __ ADC ACCU + 0 
6f79 : 85 1b __ STA ACCU + 0 
6f7b : 8a __ __ TXA
6f7c : 65 1c __ ADC ACCU + 1 
6f7e : 85 1c __ STA ACCU + 1 
6f80 : 60 __ __ RTS
6f81 : b0 04 __ BCS $6f87 ; (mul16by8 + 55)
6f83 : 85 1b __ STA ACCU + 0 
6f85 : 85 1c __ STA ACCU + 1 
6f87 : 60 __ __ RTS
--------------------------------------------------------------------
mul32by8: ; mul32by8
6f88 : a0 00 __ LDY #$00
6f8a : 84 07 __ STY WORK + 4 
6f8c : 84 08 __ STY WORK + 5 
6f8e : 84 09 __ STY WORK + 6 
6f90 : 4a __ __ LSR
6f91 : b0 0d __ BCS $6fa0 ; (mul32by8 + 24)
6f93 : f0 26 __ BEQ $6fbb ; (mul32by8 + 51)
6f95 : 06 1b __ ASL ACCU + 0 
6f97 : 26 1c __ ROL ACCU + 1 
6f99 : 26 1d __ ROL ACCU + 2 
6f9b : 26 1e __ ROL ACCU + 3 
6f9d : 4a __ __ LSR
6f9e : 90 f5 __ BCC $6f95 ; (mul32by8 + 13)
6fa0 : aa __ __ TAX
6fa1 : 18 __ __ CLC
6fa2 : a5 07 __ LDA WORK + 4 
6fa4 : 65 1b __ ADC ACCU + 0 
6fa6 : 85 07 __ STA WORK + 4 
6fa8 : a5 08 __ LDA WORK + 5 
6faa : 65 1c __ ADC ACCU + 1 
6fac : 85 08 __ STA WORK + 5 
6fae : a5 09 __ LDA WORK + 6 
6fb0 : 65 1d __ ADC ACCU + 2 
6fb2 : 85 09 __ STA WORK + 6 
6fb4 : 98 __ __ TYA
6fb5 : 65 1e __ ADC ACCU + 3 
6fb7 : a8 __ __ TAY
6fb8 : 8a __ __ TXA
6fb9 : d0 da __ BNE $6f95 ; (mul32by8 + 13)
6fbb : 84 0a __ STY WORK + 7 
6fbd : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
6fbe : a0 00 __ LDY #$00
6fc0 : 84 06 __ STY WORK + 3 
6fc2 : a5 03 __ LDA WORK + 0 
6fc4 : a6 04 __ LDX WORK + 1 
6fc6 : f0 1c __ BEQ $6fe4 ; (mul16 + 38)
6fc8 : 38 __ __ SEC
6fc9 : 6a __ __ ROR
6fca : 90 0d __ BCC $6fd9 ; (mul16 + 27)
6fcc : aa __ __ TAX
6fcd : 18 __ __ CLC
6fce : 98 __ __ TYA
6fcf : 65 1b __ ADC ACCU + 0 
6fd1 : a8 __ __ TAY
6fd2 : a5 06 __ LDA WORK + 3 
6fd4 : 65 1c __ ADC ACCU + 1 
6fd6 : 85 06 __ STA WORK + 3 
6fd8 : 8a __ __ TXA
6fd9 : 06 1b __ ASL ACCU + 0 
6fdb : 26 1c __ ROL ACCU + 1 
6fdd : 4a __ __ LSR
6fde : 90 f9 __ BCC $6fd9 ; (mul16 + 27)
6fe0 : d0 ea __ BNE $6fcc ; (mul16 + 14)
6fe2 : a5 04 __ LDA WORK + 1 
6fe4 : 4a __ __ LSR
6fe5 : 90 0d __ BCC $6ff4 ; (mul16 + 54)
6fe7 : aa __ __ TAX
6fe8 : 18 __ __ CLC
6fe9 : 98 __ __ TYA
6fea : 65 1b __ ADC ACCU + 0 
6fec : a8 __ __ TAY
6fed : a5 06 __ LDA WORK + 3 
6fef : 65 1c __ ADC ACCU + 1 
6ff1 : 85 06 __ STA WORK + 3 
6ff3 : 8a __ __ TXA
6ff4 : 06 1b __ ASL ACCU + 0 
6ff6 : 26 1c __ ROL ACCU + 1 
6ff8 : 4a __ __ LSR
6ff9 : b0 ec __ BCS $6fe7 ; (mul16 + 41)
6ffb : d0 f7 __ BNE $6ff4 ; (mul16 + 54)
6ffd : 84 05 __ STY WORK + 2 
6fff : 60 __ __ RTS
--------------------------------------------------------------------
divs16: ; divs16
7000 : 24 1c __ BIT ACCU + 1 
7002 : 10 0d __ BPL $7011 ; (divs16 + 17)
7004 : 20 1b 70 JSR $701b ; (negaccu + 0)
7007 : 24 04 __ BIT WORK + 1 
7009 : 10 0d __ BPL $7018 ; (divs16 + 24)
700b : 20 29 70 JSR $7029 ; (negtmp + 0)
700e : 4c 3b 70 JMP $703b ; (divmod + 0)
7011 : 24 04 __ BIT WORK + 1 
7013 : 10 f9 __ BPL $700e ; (divs16 + 14)
7015 : 20 29 70 JSR $7029 ; (negtmp + 0)
7018 : 20 3b 70 JSR $703b ; (divmod + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
701b : 38 __ __ SEC
701c : a9 00 __ LDA #$00
701e : e5 1b __ SBC ACCU + 0 
7020 : 85 1b __ STA ACCU + 0 
7022 : a9 00 __ LDA #$00
7024 : e5 1c __ SBC ACCU + 1 
7026 : 85 1c __ STA ACCU + 1 
7028 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
7029 : 38 __ __ SEC
702a : a9 00 __ LDA #$00
702c : e5 03 __ SBC WORK + 0 
702e : 85 03 __ STA WORK + 0 
7030 : a9 00 __ LDA #$00
7032 : e5 04 __ SBC WORK + 1 
7034 : 85 04 __ STA WORK + 1 
7036 : 60 __ __ RTS
--------------------------------------------------------------------
divmod@proxy: ; divmod@proxy
7037 : a9 00 __ LDA #$00
7039 : 85 04 __ STA WORK + 1 
--------------------------------------------------------------------
divmod: ; divmod
703b : a5 1c __ LDA ACCU + 1 
703d : d0 31 __ BNE $7070 ; (divmod + 53)
703f : a5 04 __ LDA WORK + 1 
7041 : d0 1e __ BNE $7061 ; (divmod + 38)
7043 : 85 06 __ STA WORK + 3 
7045 : a2 04 __ LDX #$04
7047 : 06 1b __ ASL ACCU + 0 
7049 : 2a __ __ ROL
704a : c5 03 __ CMP WORK + 0 
704c : 90 02 __ BCC $7050 ; (divmod + 21)
704e : e5 03 __ SBC WORK + 0 
7050 : 26 1b __ ROL ACCU + 0 
7052 : 2a __ __ ROL
7053 : c5 03 __ CMP WORK + 0 
7055 : 90 02 __ BCC $7059 ; (divmod + 30)
7057 : e5 03 __ SBC WORK + 0 
7059 : 26 1b __ ROL ACCU + 0 
705b : ca __ __ DEX
705c : d0 eb __ BNE $7049 ; (divmod + 14)
705e : 85 05 __ STA WORK + 2 
7060 : 60 __ __ RTS
7061 : a5 1b __ LDA ACCU + 0 
7063 : 85 05 __ STA WORK + 2 
7065 : a5 1c __ LDA ACCU + 1 
7067 : 85 06 __ STA WORK + 3 
7069 : a9 00 __ LDA #$00
706b : 85 1b __ STA ACCU + 0 
706d : 85 1c __ STA ACCU + 1 
706f : 60 __ __ RTS
7070 : a5 04 __ LDA WORK + 1 
7072 : d0 1f __ BNE $7093 ; (divmod + 88)
7074 : a5 03 __ LDA WORK + 0 
7076 : 30 1b __ BMI $7093 ; (divmod + 88)
7078 : a9 00 __ LDA #$00
707a : 85 06 __ STA WORK + 3 
707c : a2 10 __ LDX #$10
707e : 06 1b __ ASL ACCU + 0 
7080 : 26 1c __ ROL ACCU + 1 
7082 : 2a __ __ ROL
7083 : c5 03 __ CMP WORK + 0 
7085 : 90 02 __ BCC $7089 ; (divmod + 78)
7087 : e5 03 __ SBC WORK + 0 
7089 : 26 1b __ ROL ACCU + 0 
708b : 26 1c __ ROL ACCU + 1 
708d : ca __ __ DEX
708e : d0 f2 __ BNE $7082 ; (divmod + 71)
7090 : 85 05 __ STA WORK + 2 
7092 : 60 __ __ RTS
7093 : a9 00 __ LDA #$00
7095 : 85 05 __ STA WORK + 2 
7097 : 85 06 __ STA WORK + 3 
7099 : 84 02 __ STY $02 
709b : a0 10 __ LDY #$10
709d : 18 __ __ CLC
709e : 26 1b __ ROL ACCU + 0 
70a0 : 26 1c __ ROL ACCU + 1 
70a2 : 26 05 __ ROL WORK + 2 
70a4 : 26 06 __ ROL WORK + 3 
70a6 : 38 __ __ SEC
70a7 : a5 05 __ LDA WORK + 2 
70a9 : e5 03 __ SBC WORK + 0 
70ab : aa __ __ TAX
70ac : a5 06 __ LDA WORK + 3 
70ae : e5 04 __ SBC WORK + 1 
70b0 : 90 04 __ BCC $70b6 ; (divmod + 123)
70b2 : 86 05 __ STX WORK + 2 
70b4 : 85 06 __ STA WORK + 3 
70b6 : 88 __ __ DEY
70b7 : d0 e5 __ BNE $709e ; (divmod + 99)
70b9 : 26 1b __ ROL ACCU + 0 
70bb : 26 1c __ ROL ACCU + 1 
70bd : a4 02 __ LDY $02 
70bf : 60 __ __ RTS
--------------------------------------------------------------------
mul32: ; mul32
70c0 : a5 04 __ LDA WORK + 1 
70c2 : 05 05 __ ORA WORK + 2 
70c4 : 05 06 __ ORA WORK + 3 
70c6 : d0 05 __ BNE $70cd ; (mul32 + 13)
70c8 : a5 03 __ LDA WORK + 0 
70ca : 4c 88 6f JMP $6f88 ; (mul32by8 + 0)
70cd : a0 00 __ LDY #$00
70cf : 84 07 __ STY WORK + 4 
70d1 : 84 08 __ STY WORK + 5 
70d3 : 98 __ __ TYA
70d4 : 38 __ __ SEC
70d5 : 66 03 __ ROR WORK + 0 
70d7 : 90 15 __ BCC $70ee ; (mul32 + 46)
70d9 : aa __ __ TAX
70da : 18 __ __ CLC
70db : a5 07 __ LDA WORK + 4 
70dd : 65 1b __ ADC ACCU + 0 
70df : 85 07 __ STA WORK + 4 
70e1 : a5 08 __ LDA WORK + 5 
70e3 : 65 1c __ ADC ACCU + 1 
70e5 : 85 08 __ STA WORK + 5 
70e7 : 98 __ __ TYA
70e8 : 65 1d __ ADC ACCU + 2 
70ea : a8 __ __ TAY
70eb : 8a __ __ TXA
70ec : 65 1e __ ADC ACCU + 3 
70ee : 46 04 __ LSR WORK + 1 
70f0 : 90 0f __ BCC $7101 ; (mul32 + 65)
70f2 : aa __ __ TAX
70f3 : 18 __ __ CLC
70f4 : a5 08 __ LDA WORK + 5 
70f6 : 65 1b __ ADC ACCU + 0 
70f8 : 85 08 __ STA WORK + 5 
70fa : 98 __ __ TYA
70fb : 65 1c __ ADC ACCU + 1 
70fd : a8 __ __ TAY
70fe : 8a __ __ TXA
70ff : 65 1d __ ADC ACCU + 2 
7101 : 46 05 __ LSR WORK + 2 
7103 : 90 09 __ BCC $710e ; (mul32 + 78)
7105 : aa __ __ TAX
7106 : 18 __ __ CLC
7107 : 98 __ __ TYA
7108 : 65 1b __ ADC ACCU + 0 
710a : a8 __ __ TAY
710b : 8a __ __ TXA
710c : 65 1c __ ADC ACCU + 1 
710e : 46 06 __ LSR WORK + 3 
7110 : 90 03 __ BCC $7115 ; (mul32 + 85)
7112 : 18 __ __ CLC
7113 : 65 1b __ ADC ACCU + 0 
7115 : 06 1b __ ASL ACCU + 0 
7117 : 26 1c __ ROL ACCU + 1 
7119 : 26 1d __ ROL ACCU + 2 
711b : 26 1e __ ROL ACCU + 3 
711d : 46 03 __ LSR WORK + 0 
711f : 90 cd __ BCC $70ee ; (mul32 + 46)
7121 : d0 b6 __ BNE $70d9 ; (mul32 + 25)
7123 : 84 09 __ STY WORK + 6 
7125 : 85 0a __ STA WORK + 7 
7127 : 60 __ __ RTS
--------------------------------------------------------------------
divs32: ; divs32
7128 : 24 1e __ BIT ACCU + 3 
712a : 10 0d __ BPL $7139 ; (divs32 + 17)
712c : 20 43 71 JSR $7143 ; (negaccu32 + 0)
712f : 24 06 __ BIT WORK + 3 
7131 : 10 0d __ BPL $7140 ; (divs32 + 24)
7133 : 20 5d 71 JSR $715d ; (negtmp32 + 0)
7136 : 4c 37 3f JMP $3f37 ; (divmod32 + 0)
7139 : 24 06 __ BIT WORK + 3 
713b : 10 f9 __ BPL $7136 ; (divs32 + 14)
713d : 20 5d 71 JSR $715d ; (negtmp32 + 0)
7140 : 20 37 3f JSR $3f37 ; (divmod32 + 0)
--------------------------------------------------------------------
negaccu32: ; negaccu32
7143 : 38 __ __ SEC
7144 : a9 00 __ LDA #$00
7146 : e5 1b __ SBC ACCU + 0 
7148 : 85 1b __ STA ACCU + 0 
714a : a9 00 __ LDA #$00
714c : e5 1c __ SBC ACCU + 1 
714e : 85 1c __ STA ACCU + 1 
7150 : a9 00 __ LDA #$00
7152 : e5 1d __ SBC ACCU + 2 
7154 : 85 1d __ STA ACCU + 2 
7156 : a9 00 __ LDA #$00
7158 : e5 1e __ SBC ACCU + 3 
715a : 85 1e __ STA ACCU + 3 
715c : 60 __ __ RTS
--------------------------------------------------------------------
negtmp32: ; negtmp32
715d : 38 __ __ SEC
715e : a9 00 __ LDA #$00
7160 : e5 03 __ SBC WORK + 0 
7162 : 85 03 __ STA WORK + 0 
7164 : a9 00 __ LDA #$00
7166 : e5 04 __ SBC WORK + 1 
7168 : 85 04 __ STA WORK + 1 
716a : a9 00 __ LDA #$00
716c : e5 05 __ SBC WORK + 2 
716e : 85 05 __ STA WORK + 2 
7170 : a9 00 __ LDA #$00
7172 : e5 06 __ SBC WORK + 3 
7174 : 85 06 __ STA WORK + 3 
7176 : 60 __ __ RTS
--------------------------------------------------------------------
crt_malloc: ; crt_malloc
7177 : 18 __ __ CLC
7178 : a5 1b __ LDA ACCU + 0 
717a : 69 0d __ ADC #$0d
717c : 29 fc __ AND #$fc
717e : 85 03 __ STA WORK + 0 
7180 : a5 1c __ LDA ACCU + 1 
7182 : 69 00 __ ADC #$00
7184 : 85 04 __ STA WORK + 1 
7186 : ad f4 87 LDA $87f4 ; (HeapNode.end + 0)
7189 : d0 26 __ BNE $71b1 ; (crt_malloc + 58)
718b : a9 00 __ LDA #$00
718d : 8d ea 8e STA $8eea 
7190 : 8d eb 8e STA $8eeb 
7193 : ee f4 87 INC $87f4 ; (HeapNode.end + 0)
7196 : a9 e8 __ LDA #$e8
7198 : 09 02 __ ORA #$02
719a : 8d f2 87 STA $87f2 ; (HeapNode.next + 0)
719d : a9 8e __ LDA #$8e
719f : 8d f3 87 STA $87f3 ; (HeapNode.next + 1)
71a2 : 38 __ __ SEC
71a3 : a9 00 __ LDA #$00
71a5 : e9 02 __ SBC #$02
71a7 : 8d ec 8e STA $8eec 
71aa : a9 b0 __ LDA #$b0
71ac : e9 00 __ SBC #$00
71ae : 8d ed 8e STA $8eed 
71b1 : a9 f2 __ LDA #$f2
71b3 : a2 87 __ LDX #$87
71b5 : 85 1d __ STA ACCU + 2 
71b7 : 86 1e __ STX ACCU + 3 
71b9 : 18 __ __ CLC
71ba : a0 00 __ LDY #$00
71bc : b1 1d __ LDA (ACCU + 2),y 
71be : 85 1b __ STA ACCU + 0 
71c0 : 65 03 __ ADC WORK + 0 
71c2 : 85 05 __ STA WORK + 2 
71c4 : c8 __ __ INY
71c5 : b1 1d __ LDA (ACCU + 2),y 
71c7 : 85 1c __ STA ACCU + 1 
71c9 : f0 20 __ BEQ $71eb ; (crt_malloc + 116)
71cb : 65 04 __ ADC WORK + 1 
71cd : 85 06 __ STA WORK + 3 
71cf : b0 14 __ BCS $71e5 ; (crt_malloc + 110)
71d1 : a0 02 __ LDY #$02
71d3 : b1 1b __ LDA (ACCU + 0),y 
71d5 : c5 05 __ CMP WORK + 2 
71d7 : c8 __ __ INY
71d8 : b1 1b __ LDA (ACCU + 0),y 
71da : e5 06 __ SBC WORK + 3 
71dc : b0 0f __ BCS $71ed ; (crt_malloc + 118)
71de : a5 1b __ LDA ACCU + 0 
71e0 : a6 1c __ LDX ACCU + 1 
71e2 : 4c b5 71 JMP $71b5 ; (crt_malloc + 62)
71e5 : a9 00 __ LDA #$00
71e7 : 85 1b __ STA ACCU + 0 
71e9 : 85 1c __ STA ACCU + 1 
71eb : 02 __ __ INV
71ec : 60 __ __ RTS
71ed : a5 05 __ LDA WORK + 2 
71ef : 85 07 __ STA WORK + 4 
71f1 : a5 06 __ LDA WORK + 3 
71f3 : 85 08 __ STA WORK + 5 
71f5 : a0 02 __ LDY #$02
71f7 : a5 07 __ LDA WORK + 4 
71f9 : d1 1b __ CMP (ACCU + 0),y 
71fb : d0 15 __ BNE $7212 ; (crt_malloc + 155)
71fd : c8 __ __ INY
71fe : a5 08 __ LDA WORK + 5 
7200 : d1 1b __ CMP (ACCU + 0),y 
7202 : d0 0e __ BNE $7212 ; (crt_malloc + 155)
7204 : a0 00 __ LDY #$00
7206 : b1 1b __ LDA (ACCU + 0),y 
7208 : 91 1d __ STA (ACCU + 2),y 
720a : c8 __ __ INY
720b : b1 1b __ LDA (ACCU + 0),y 
720d : 91 1d __ STA (ACCU + 2),y 
720f : 4c 2f 72 JMP $722f ; (crt_malloc + 184)
7212 : a0 00 __ LDY #$00
7214 : b1 1b __ LDA (ACCU + 0),y 
7216 : 91 07 __ STA (WORK + 4),y 
7218 : a5 07 __ LDA WORK + 4 
721a : 91 1d __ STA (ACCU + 2),y 
721c : c8 __ __ INY
721d : b1 1b __ LDA (ACCU + 0),y 
721f : 91 07 __ STA (WORK + 4),y 
7221 : a5 08 __ LDA WORK + 5 
7223 : 91 1d __ STA (ACCU + 2),y 
7225 : c8 __ __ INY
7226 : b1 1b __ LDA (ACCU + 0),y 
7228 : 91 07 __ STA (WORK + 4),y 
722a : c8 __ __ INY
722b : b1 1b __ LDA (ACCU + 0),y 
722d : 91 07 __ STA (WORK + 4),y 
722f : a0 00 __ LDY #$00
7231 : a5 05 __ LDA WORK + 2 
7233 : 91 1b __ STA (ACCU + 0),y 
7235 : c8 __ __ INY
7236 : a5 06 __ LDA WORK + 3 
7238 : 91 1b __ STA (ACCU + 0),y 
723a : a0 02 __ LDY #$02
723c : a9 bd __ LDA #$bd
723e : 91 1b __ STA (ACCU + 0),y 
7240 : c8 __ __ INY
7241 : 91 1b __ STA (ACCU + 0),y 
7243 : c8 __ __ INY
7244 : 91 1b __ STA (ACCU + 0),y 
7246 : c8 __ __ INY
7247 : 91 1b __ STA (ACCU + 0),y 
7249 : 38 __ __ SEC
724a : a5 05 __ LDA WORK + 2 
724c : e9 04 __ SBC #$04
724e : 85 05 __ STA WORK + 2 
7250 : b0 02 __ BCS $7254 ; (crt_malloc + 221)
7252 : c6 06 __ DEC WORK + 3 
7254 : a9 be __ LDA #$be
7256 : a0 00 __ LDY #$00
7258 : 91 05 __ STA (WORK + 2),y 
725a : c8 __ __ INY
725b : 91 05 __ STA (WORK + 2),y 
725d : c8 __ __ INY
725e : 91 05 __ STA (WORK + 2),y 
7260 : c8 __ __ INY
7261 : 91 05 __ STA (WORK + 2),y 
7263 : 18 __ __ CLC
7264 : a5 1b __ LDA ACCU + 0 
7266 : 69 06 __ ADC #$06
7268 : 85 1b __ STA ACCU + 0 
726a : 90 02 __ BCC $726e ; (crt_malloc + 247)
726c : e6 1c __ INC ACCU + 1 
726e : 60 __ __ RTS
--------------------------------------------------------------------
crt_free@proxy: ; crt_free@proxy
726f : a5 0d __ LDA P0 
7271 : 85 1b __ STA ACCU + 0 
7273 : a5 0e __ LDA P1 
7275 : 85 1c __ STA ACCU + 1 
--------------------------------------------------------------------
crt_free: ; crt_free
7277 : a5 1b __ LDA ACCU + 0 
7279 : 05 1c __ ORA ACCU + 1 
727b : d0 01 __ BNE $727e ; (crt_free + 7)
727d : 60 __ __ RTS
727e : 38 __ __ SEC
727f : a5 1b __ LDA ACCU + 0 
7281 : 29 03 __ AND #$03
7283 : d0 56 __ BNE $72db ; (crt_free + 100)
7285 : a5 1b __ LDA ACCU + 0 
7287 : e9 06 __ SBC #$06
7289 : 85 1b __ STA ACCU + 0 
728b : b0 02 __ BCS $728f ; (crt_free + 24)
728d : c6 1c __ DEC ACCU + 1 
728f : a0 02 __ LDY #$02
7291 : a9 bd __ LDA #$bd
7293 : d1 1b __ CMP (ACCU + 0),y 
7295 : d0 44 __ BNE $72db ; (crt_free + 100)
7297 : c8 __ __ INY
7298 : d1 1b __ CMP (ACCU + 0),y 
729a : d0 3f __ BNE $72db ; (crt_free + 100)
729c : c8 __ __ INY
729d : d1 1b __ CMP (ACCU + 0),y 
729f : d0 3a __ BNE $72db ; (crt_free + 100)
72a1 : c8 __ __ INY
72a2 : d1 1b __ CMP (ACCU + 0),y 
72a4 : d0 35 __ BNE $72db ; (crt_free + 100)
72a6 : a0 00 __ LDY #$00
72a8 : 38 __ __ SEC
72a9 : b1 1b __ LDA (ACCU + 0),y 
72ab : e9 04 __ SBC #$04
72ad : 85 03 __ STA WORK + 0 
72af : c8 __ __ INY
72b0 : b1 1b __ LDA (ACCU + 0),y 
72b2 : e9 00 __ SBC #$00
72b4 : 85 04 __ STA WORK + 1 
72b6 : a0 00 __ LDY #$00
72b8 : a9 be __ LDA #$be
72ba : d1 03 __ CMP (WORK + 0),y 
72bc : d0 1d __ BNE $72db ; (crt_free + 100)
72be : c8 __ __ INY
72bf : d1 03 __ CMP (WORK + 0),y 
72c1 : d0 18 __ BNE $72db ; (crt_free + 100)
72c3 : c8 __ __ INY
72c4 : d1 03 __ CMP (WORK + 0),y 
72c6 : d0 13 __ BNE $72db ; (crt_free + 100)
72c8 : c8 __ __ INY
72c9 : d1 03 __ CMP (WORK + 0),y 
72cb : d0 0e __ BNE $72db ; (crt_free + 100)
72cd : a5 1c __ LDA ACCU + 1 
72cf : a6 1b __ LDX ACCU + 0 
72d1 : c9 8e __ CMP #$8e
72d3 : 90 06 __ BCC $72db ; (crt_free + 100)
72d5 : d0 05 __ BNE $72dc ; (crt_free + 101)
72d7 : e0 e8 __ CPX #$e8
72d9 : b0 01 __ BCS $72dc ; (crt_free + 101)
72db : 02 __ __ INV
72dc : c9 b0 __ CMP #$b0
72de : 90 06 __ BCC $72e6 ; (crt_free + 111)
72e0 : d0 f9 __ BNE $72db ; (crt_free + 100)
72e2 : e0 00 __ CPX #$00
72e4 : b0 f5 __ BCS $72db ; (crt_free + 100)
72e6 : a0 02 __ LDY #$02
72e8 : a9 bf __ LDA #$bf
72ea : 91 1b __ STA (ACCU + 0),y 
72ec : c8 __ __ INY
72ed : 91 1b __ STA (ACCU + 0),y 
72ef : a0 00 __ LDY #$00
72f1 : b1 1b __ LDA (ACCU + 0),y 
72f3 : 85 1d __ STA ACCU + 2 
72f5 : c8 __ __ INY
72f6 : b1 1b __ LDA (ACCU + 0),y 
72f8 : 85 1e __ STA ACCU + 3 
72fa : a9 f2 __ LDA #$f2
72fc : a2 87 __ LDX #$87
72fe : 85 05 __ STA WORK + 2 
7300 : 86 06 __ STX WORK + 3 
7302 : a0 01 __ LDY #$01
7304 : b1 05 __ LDA (WORK + 2),y 
7306 : f0 28 __ BEQ $7330 ; (crt_free + 185)
7308 : aa __ __ TAX
7309 : 88 __ __ DEY
730a : b1 05 __ LDA (WORK + 2),y 
730c : e4 1e __ CPX ACCU + 3 
730e : 90 ee __ BCC $72fe ; (crt_free + 135)
7310 : d0 1e __ BNE $7330 ; (crt_free + 185)
7312 : c5 1d __ CMP ACCU + 2 
7314 : 90 e8 __ BCC $72fe ; (crt_free + 135)
7316 : d0 18 __ BNE $7330 ; (crt_free + 185)
7318 : a0 00 __ LDY #$00
731a : b1 1d __ LDA (ACCU + 2),y 
731c : 91 1b __ STA (ACCU + 0),y 
731e : c8 __ __ INY
731f : b1 1d __ LDA (ACCU + 2),y 
7321 : 91 1b __ STA (ACCU + 0),y 
7323 : c8 __ __ INY
7324 : b1 1d __ LDA (ACCU + 2),y 
7326 : 91 1b __ STA (ACCU + 0),y 
7328 : c8 __ __ INY
7329 : b1 1d __ LDA (ACCU + 2),y 
732b : 91 1b __ STA (ACCU + 0),y 
732d : 4c 45 73 JMP $7345 ; (crt_free + 206)
7330 : a0 00 __ LDY #$00
7332 : b1 05 __ LDA (WORK + 2),y 
7334 : 91 1b __ STA (ACCU + 0),y 
7336 : c8 __ __ INY
7337 : b1 05 __ LDA (WORK + 2),y 
7339 : 91 1b __ STA (ACCU + 0),y 
733b : c8 __ __ INY
733c : a5 1d __ LDA ACCU + 2 
733e : 91 1b __ STA (ACCU + 0),y 
7340 : c8 __ __ INY
7341 : a5 1e __ LDA ACCU + 3 
7343 : 91 1b __ STA (ACCU + 0),y 
7345 : a0 02 __ LDY #$02
7347 : b1 05 __ LDA (WORK + 2),y 
7349 : c5 1b __ CMP ACCU + 0 
734b : d0 1d __ BNE $736a ; (crt_free + 243)
734d : c8 __ __ INY
734e : b1 05 __ LDA (WORK + 2),y 
7350 : c5 1c __ CMP ACCU + 1 
7352 : d0 16 __ BNE $736a ; (crt_free + 243)
7354 : a0 00 __ LDY #$00
7356 : b1 1b __ LDA (ACCU + 0),y 
7358 : 91 05 __ STA (WORK + 2),y 
735a : c8 __ __ INY
735b : b1 1b __ LDA (ACCU + 0),y 
735d : 91 05 __ STA (WORK + 2),y 
735f : c8 __ __ INY
7360 : b1 1b __ LDA (ACCU + 0),y 
7362 : 91 05 __ STA (WORK + 2),y 
7364 : c8 __ __ INY
7365 : b1 1b __ LDA (ACCU + 0),y 
7367 : 91 05 __ STA (WORK + 2),y 
7369 : 60 __ __ RTS
736a : a0 00 __ LDY #$00
736c : a5 1b __ LDA ACCU + 0 
736e : 91 05 __ STA (WORK + 2),y 
7370 : c8 __ __ INY
7371 : a5 1c __ LDA ACCU + 1 
7373 : 91 05 __ STA (WORK + 2),y 
7375 : 60 __ __ RTS
--------------------------------------------------------------------
__multab50L:
7376 : __ __ __ BYT 00 32 64 96                                     : .2d.
--------------------------------------------------------------------
__multab7L:
737a : __ __ __ BYT 00 07 0e 15 1c 23 2a 31 38 3f 46 4d 54          : .....#*18?FMT
--------------------------------------------------------------------
__shrtab192L:
7387 : __ __ __ BYT c0 60 30 18 0c 06 03                            : .`0....
--------------------------------------------------------------------
__multab12L:
738e : __ __ __ BYT 00 0c 18 24                                     : ...$
--------------------------------------------------------------------
__multab3L:
7392 : __ __ __ BYT 00 03 06 09                                     : ....
--------------------------------------------------------------------
__shltab3L:
7396 : __ __ __ BYT 03 06 0c 18 30 60 c0                            : ....0`.
--------------------------------------------------------------------
__multab320L:
739d : __ __ __ BYT 00 40 80 c0 00 40 80 c0 00 40 80 c0 00          : .@...@...@...
--------------------------------------------------------------------
__multab320H:
73aa : __ __ __ BYT 00 01 02 03 05 06 07 08 0a 0b 0c 0d 0f          : .............
--------------------------------------------------------------------
__multab10L:
73b7 : __ __ __ BYT 00 0a 14 1e 28 32 3c 46 50 5a 64 6e 78 82 8c 96 : ....(2<FPZdnx...
--------------------------------------------------------------------
__multab17L:
73c7 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 99 aa bb cc dd ee ff : .."3DUfw........
--------------------------------------------------------------------
screen_result@proxy: ; screen_result@proxy
73d7 : a9 46 __ LDA #$46
73d9 : 85 10 __ STA P3 
73db : a9 15 __ LDA #$15
73dd : 85 11 __ STA P4 
73df : 4c 64 11 JMP $1164 ; (screen_result.s4 + 0)
--------------------------------------------------------------------
memset@proxy: ; memset@proxy
73e2 : a9 e0 __ LDA #$e0
73e4 : 85 0e __ STA P1 
73e6 : a9 40 __ LDA #$40
73e8 : 85 11 __ STA P4 
73ea : a9 1f __ LDA #$1f
73ec : 85 12 __ STA P5 
73ee : 4c f3 20 JMP $20f3 ; (memset.s4 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
73f1 : a5 4f __ LDA $4f 
73f3 : 85 03 __ STA WORK + 0 
73f5 : a5 50 __ LDA $50 
73f7 : 85 04 __ STA WORK + 1 
73f9 : 4c 00 70 JMP $7000 ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
73fc : a5 5e __ LDA $5e 
73fe : 85 03 __ STA WORK + 0 
7400 : a5 5f __ LDA $5f 
7402 : 85 04 __ STA WORK + 1 
7404 : 4c 00 70 JMP $7000 ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
7407 : a9 7f __ LDA #$7f
7409 : 85 03 __ STA WORK + 0 
740b : a9 00 __ LDA #$00
740d : 85 04 __ STA WORK + 1 
740f : a5 05 __ LDA WORK + 2 
7411 : 85 1b __ STA ACCU + 0 
7413 : a5 06 __ LDA WORK + 3 
7415 : 85 1c __ STA ACCU + 1 
7417 : 4c 00 70 JMP $7000 ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
741a : a9 0d __ LDA #$0d
741c : 85 03 __ STA WORK + 0 
741e : 4c 00 70 JMP $7000 ; (divs16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
7421 : a9 7f __ LDA #$7f
7423 : 85 03 __ STA WORK + 0 
7425 : a9 00 __ LDA #$00
7427 : 85 04 __ STA WORK + 1 
7429 : 4c 00 70 JMP $7000 ; (divs16 + 0)
--------------------------------------------------------------------
divmod@proxy: ; divmod@proxy
742c : a9 50 __ LDA #$50
742e : 85 1b __ STA ACCU + 0 
7430 : a9 46 __ LDA #$46
7432 : 85 1c __ STA ACCU + 1 
7434 : 4c 3b 70 JMP $703b ; (divmod + 0)
--------------------------------------------------------------------
cwin_put_string@proxy: ; cwin_put_string@proxy
7437 : a5 10 __ LDA P3 
7439 : 85 0d __ STA P0 
743b : a5 11 __ LDA P4 
743d : 85 0e __ STA P1 
743f : 4c c2 10 JMP $10c2 ; (cwin_put_string.s4 + 0)
--------------------------------------------------------------------
vic_setmode@proxy: ; vic_setmode@proxy
7442 : a9 04 __ LDA #$04
7444 : 85 0d __ STA P0 
7446 : a9 c0 __ LDA #$c0
7448 : 85 0f __ STA P2 
744a : a9 e0 __ LDA #$e0
744c : 85 11 __ STA P4 
744e : 4c 13 0f JMP $0f13 ; (vic_setmode.s4 + 0)
--------------------------------------------------------------------
vic_setmode@proxy: ; vic_setmode@proxy
7451 : a9 03 __ LDA #$03
7453 : 85 0d __ STA P0 
7455 : a9 00 __ LDA #$00
7457 : 85 0e __ STA P1 
7459 : a9 d0 __ LDA #$d0
745b : 85 0f __ STA P2 
745d : a5 43 __ LDA $43 
745f : 85 10 __ STA P3 
7461 : a5 44 __ LDA $44 
7463 : 85 11 __ STA P4 
7465 : 4c 13 0f JMP $0f13 ; (vic_setmode.s4 + 0)
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
7468 : a9 74 __ LDA #$74
746a : 85 0e __ STA P1 
746c : 4c 44 10 JMP $1044 ; (strlen.s4 + 0)
--------------------------------------------------------------------
mul40:
746f : __ __ __ BYT 00 00 28 00 50 00 78 00 a0 00 c8 00 f0 00 18 01 : ..(.P.x.........
747f : __ __ __ BYT 40 01 68 01 90 01 b8 01 e0 01 08 02 30 02 58 02 : @.h.........0.X.
748f : __ __ __ BYT 80 02 a8 02 d0 02 f8 02 20 03 48 03 70 03 98 03 : ........ .H.p...
749f : __ __ __ BYT c0 03                                           : ..
--------------------------------------------------------------------
p2smap:
74a1 : __ __ __ BYT 40 00 40 20 40 c0 80 80                         : @.@ @...
--------------------------------------------------------------------
p2smap:
74a9 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
audio_ch_base:
74b1 : __ __ __ BYT 20 df 40 df 60 df 80 df a0 df c0 df e0 df       :  .@.`.........
--------------------------------------------------------------------
mod_dir:
74bf : __ __ __ BYT 2f 75 73 62 30 2f 44 65 76 2f 61 73 73 65 74 73 : /usb0/Dev/assets
74cf : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
mod_file:
74d0 : __ __ __ BYT 34 65 76 2e 6d 6f 64 00                         : 4ev.mod.
--------------------------------------------------------------------
sid_freq:
74d8 : __ __ __ BYT a9 02 d2 02 fd 02 2b 03 5b 03 8e 03 c4 03 fd 03 : ......+.[.......
74e8 : __ __ __ BYT 3a 04 7a 04 bf 04 07 05 53 05 a4 05 fa 05 55 06 : :.z.....S.....U.
--------------------------------------------------------------------
lmask:
74f8 : __ __ __ BYT ff 7f 3f 1f 0f 07 03 01                         : ..?.....
--------------------------------------------------------------------
speed_nums:
7500 : __ __ __ BYT 95 22 97 22 99 22 9b 22 9d 22 9f 22 a1 22 a4 22 : ."."."."."."."."
7510 : __ __ __ BYT a7 22 aa 22 ad 22 b0 22 b3 22 b6 22 b9 22 bc 22 : ."."."."."."."."
--------------------------------------------------------------------
glyphs:
7520 : __ __ __ BYT 70 88 88 88 88 88 70 20 60 20 20 20 20 70 70 88 : p.....p `    pp.
7530 : __ __ __ BYT 08 30 40 80 f8 70 88 08 30 08 88 70 10 30 50 90 : .0@..p..0..p.0P.
7540 : __ __ __ BYT f8 10 10 f8 80 f0 08 08 88 70 30 40 80 f0 88 88 : .........p0@....
7550 : __ __ __ BYT 70 f8 08 10 20 40 40 40 70 88 88 70 88 88 70 70 : p... @@@p..p..pp
7560 : __ __ __ BYT 88 88 78 08 10 60 88 d8 a8 88 88 88 88 88 88 88 : ..x..`..........
7570 : __ __ __ BYT f8 88 88 88 f8 10 20 40 80 80 f8                : ...... @...
--------------------------------------------------------------------
rmask:
757b : __ __ __ BYT 00 80 c0 e0 f0 f8 fc fe                         : ........
--------------------------------------------------------------------
blitops_op:
7583 : __ __ __ BYT 00 21 01 41                                     : .!.A
--------------------------------------------------------------------
step_msg:
7587 : __ __ __ BYT bc 2c d5 2c ea 2c fd 2c 15 2d 32 2d 4c 2d 66 2d : .,.,.,.,.-2-L-f-
7597 : __ __ __ BYT 7f 2d 9b 2d bb 2d d8 2d f5 2d 11 2e 29 2e 45 2e : .-.-.-.-.-..).E.
--------------------------------------------------------------------
TinyFont:
75a7 : __ __ __ BYT 00 04 05 08 0d 12 17 1c 1d 21 25 2a 2d 2e 31 32 : .........!%*-.12
75b7 : __ __ __ BYT 35 39 3d 41 45 49 4d 51 55 59 5d 5e 5f 62 65 68 : 59=AEIMQUY]^_beh
75c7 : __ __ __ BYT 6c 71 76 7a 7e 82 86 8a 8e 92 95 99 9d a1 a6 ab : lqvz~...........
75d7 : __ __ __ BYT af b3 b7 bb bf c4 c8 cd d2 d7 dc e1 e5 e8 ec f1 : ................
75e7 : __ __ __ BYT f5 f9 fd 01 05 09 0d 10 14 18 19 1b 1f 21 26 2a : .............!&*
75f7 : __ __ __ BYT 2e 32 36 3a 3e 41 45 49 4e 52 56 5a 5e 5f 63 67 : .26:>AEINRVZ^_cg
7607 : __ __ __ BYT 10 04 0c 14 14 14 14 04 10 10 14 0c 04 0c 04 0c : ................
7617 : __ __ __ BYT 10 10 10 10 10 10 10 10 10 10 04 04 0c 0c 0c 10 : ................
7627 : __ __ __ BYT 14 14 10 10 10 10 10 10 10 0c 10 10 10 14 14 10 : ................
7637 : __ __ __ BYT 10 10 10 10 14 10 14 14 14 14 14 10 0c 10 14 10 : ................
7647 : __ __ __ BYT 10 10 10 11 11 11 0d 11 11 05 09 11 09 15 11 11 : ................
7657 : __ __ __ BYT 11 11 11 11 0d 11 11 15 11 11 11 11 05 11 11 11 : ................
7667 : __ __ __ BYT 00 00 00 00 fa c0 00 c0 28 7c 28 7c 28 20 54 d6 : ........(|(|( T.
7677 : __ __ __ BYT 54 08 04 48 10 24 40 6c 92 92 6c 0a c0 38 44 82 : T..H.$@l..l..8D.
7687 : __ __ __ BYT 82 82 82 44 38 10 54 38 54 10 10 38 10 03 10 10 : ...D8.T8T..8....
7697 : __ __ __ BYT 10 02 06 38 c0 7c 82 82 7c 22 42 fe 02 46 8a 92 : ...8.|..|"B..F..
76a7 : __ __ __ BYT 62 44 82 92 6c f0 10 3e 10 e4 92 92 8c 7c 92 92 : bD..l..>.....|..
76b7 : __ __ __ BYT 4c 80 8e 90 e0 6c 92 92 6c 64 92 92 7c 28 0b 10 : L....l..ld..|(..
76c7 : __ __ __ BYT 28 44 28 28 28 44 28 10 40 80 9a 60 00 00 00 00 : (D(((D(.@..`....
76d7 : __ __ __ BYT 00 3e 50 90 50 3e fe 92 92 6c 7c 82 82 44 fe 82 : .>P.P>...l|..D..
76e7 : __ __ __ BYT 82 7c fe 92 92 82 fe 90 90 80 7c 82 92 1c fe 10 : .|........|.....
76f7 : __ __ __ BYT 10 fe 82 fe 82 84 82 82 fc fe 10 28 c6 fe 02 02 : ...........(....
7707 : __ __ __ BYT 02 fe 40 20 40 fe fe 40 20 10 fe 7c 82 82 7c fe : ..@ @..@ ..|..|.
7717 : __ __ __ BYT 90 90 60 7c 82 84 7a fe 90 90 6e 64 92 92 4c 80 : ..`|..z...nd..L.
7727 : __ __ __ BYT 80 fe 80 80 fc 02 02 fc e0 18 06 18 e0 fe 04 08 : ................
7737 : __ __ __ BYT 04 fe c6 28 10 28 c6 e0 10 1e 10 e0 86 8a 92 a2 : ...(.(..........
7747 : __ __ __ BYT c2 fe 82 82 82 c0 38 06 82 82 82 fe 20 40 80 40 : ......8..... @.@
7757 : __ __ __ BYT 20 01 01 01 01 00 00 00 00 04 2a 2a 1e fe 22 22 :  .........**..""
7767 : __ __ __ BYT 1c 1c 22 22 14 1c 22 22 fe 1c 2a 2a 18 20 7e a0 : ..""..""..**. ~.
7777 : __ __ __ BYT 18 25 25 3e fe 20 20 1e be 01 be fe 10 28 46 fc : .%%>.  ......(F.
7787 : __ __ __ BYT 02 3e 20 1e 20 1e 3e 20 20 1e 1c 22 22 1c 3f 24 : .> . .>  .."".?$
7797 : __ __ __ BYT 24 18 18 24 24 3f 3e 10 20 10 12 2a 2a 04 20 7c : $..$$?>. ..**. |
77a7 : __ __ __ BYT 22 3c 02 02 3e 38 04 02 3c 3c 02 1c 02 3c 26 18 : "<..>8..<<...<&.
77b7 : __ __ __ BYT 0c 32 38 05 05 3e 26 2a 2a 32 10 6c 82 82 fe 82 : .28..>&**2.l....
77c7 : __ __ __ BYT 82 6c 10 10 20 10 20 00 00 00 00                : .l.. . ....
--------------------------------------------------------------------
tbitmap:
77d2 : __ __ __ BYT e0 88 00 00 28 01 40 01                         : ....(.@.
--------------------------------------------------------------------
cr:
77da : __ __ __ BYT 00 00 00 00 40 01 c8 00                         : ....@...
--------------------------------------------------------------------
cbytes:
77e2 : __ __ __ BYT 00 55 aa ff                                     : .U..
--------------------------------------------------------------------
gz:
77e6 : __ __ __ BYT a0 00 bb 00 d5 00 f0 00 0b 01 25 01 40 01       : ..........%.@.
--------------------------------------------------------------------
vcr:
77f4 : __ __ __ BYT 00 00 00 00 40 01 c8 00                         : ....@...
--------------------------------------------------------------------
pal_sc:
77fc : __ __ __ BYT f9 e3 a8 d5                                     : ....
--------------------------------------------------------------------
sin64:
7800 : __ __ __ BYT 00 0c 19 25 31 3c 47 51 5a 62 6a 70 75 7a 7d 7e : ...%1<GQZbjpuz}~
7810 : __ __ __ BYT 7f 7e 7d 7a 75 70 6a 62 5a 51 47 3c 31 25 19 0c : .~}zupjbZQG<1%..
7820 : __ __ __ BYT 00 f4 e7 db cf c4 b9 af a6 9e 96 90 8b 86 83 82 : ................
7830 : __ __ __ BYT 81 82 83 86 8b 90 96 9e a6 af b9 c4 cf db e7 f4 : ................
--------------------------------------------------------------------
vib_sine:
7840 : __ __ __ BYT 00 18 31 4a 61 78 8d a1 b4 c5 d4 e0 eb f4 fa fd : ..1Jax..........
7850 : __ __ __ BYT ff fd fa f4 eb e0 d4 c5 b4 a1 8d 78 61 4a 31 18 : ...........xaJ1.
--------------------------------------------------------------------
frames:
7860 : __ __ __ BYT 00 d8 00 e7 60 40 00 00 00 00 00 e4 1f f5 33 20 : ....`@........3 
7870 : __ __ __ BYT 00 00 00 00 00 ec 00 f8 1a 10 00 00 00 00 00 d8 : ................
7880 : __ __ __ BYT 00 e7 60 40 cd f4 52 04 00 d8 00 e7 60 40 33 f3 : ..`@..R.....`@3.
7890 : __ __ __ BYT 7f 02                                           : ..
--------------------------------------------------------------------
f1c:
7892 : __ __ __ BYT 0f 01 0d 0d 05 01 07 0d 01 01 07 08 0e 03 01 03 : ................
78a2 : __ __ __ BYT 0e 0d 0d 07 01 01 0d 07 06 03 0e 0e 05 03 05 0d : ................
78b2 : __ __ __ BYT 01 01 05 0d 06 04 03 03 0e 01 0d 03 01 01 0f 0d : ................
--------------------------------------------------------------------
gx:
78c2 : __ __ __ BYT b0 ff cb ff e5 ff 00 00 1b 00 35 00 50 00       : ..........5.P.
--------------------------------------------------------------------
cube_v:
78d0 : __ __ __ BYT ff ff ff 01 ff ff 01 01 ff ff 01 ff ff ff 01 01 : ................
78e0 : __ __ __ BYT ff 01 01 01 01 ff 01 01                         : ........
--------------------------------------------------------------------
sin256:
78e8 : __ __ __ BYT 00 00 65 00 c9 00 2d 01 91 01 f5 01 59 02 bc 02 : ..e...-.....Y...
78f8 : __ __ __ BYT 1f 03 81 03 e3 03 44 04 a5 04 05 05 64 05 c2 05 : ......D.....d...
7908 : __ __ __ BYT 1f 06 7c 06 d7 06 32 07 8b 07 e3 07 3a 08 8f 08 : ..|...2.....:...
7918 : __ __ __ BYT e4 08 37 09 88 09 d8 09 26 0a 73 0a bf 0a 08 0b : ..7.....&.s.....
7928 : __ __ __ BYT 50 0b 97 0b db 0b 1e 0c 5e 0c 9d 0c da 0c 15 0d : P.......^.......
7938 : __ __ __ BYT 4e 0d 85 0d b9 0d ec 0d 1c 0e 4b 0e 77 0e a1 0e : N.........K.w...
7948 : __ __ __ BYT c8 0e ee 0e 11 0f 31 0f 50 0f 6c 0f 85 0f 9c 0f : ......1.P.l.....
7958 : __ __ __ BYT b1 0f c4 0f d4 0f e1 0f ec 0f f5 0f fb 0f ff 0f : ................
7968 : __ __ __ BYT 00 10 ff 0f fb 0f f5 0f ec 0f e1 0f d4 0f c4 0f : ................
7978 : __ __ __ BYT b1 0f 9c 0f 85 0f 6c 0f 50 0f 31 0f 11 0f ee 0e : ......l.P.1.....
7988 : __ __ __ BYT c8 0e a1 0e 77 0e 4b 0e 1c 0e ec 0d b9 0d 85 0d : ....w.K.........
7998 : __ __ __ BYT 4e 0d 15 0d da 0c 9d 0c 5e 0c 1e 0c db 0b 97 0b : N.......^.......
79a8 : __ __ __ BYT 50 0b 08 0b bf 0a 73 0a 26 0a d8 09 88 09 37 09 : P.....s.&.....7.
79b8 : __ __ __ BYT e4 08 8f 08 3a 08 e3 07 8b 07 32 07 d7 06 7c 06 : ....:.....2...|.
79c8 : __ __ __ BYT 1f 06 c2 05 64 05 05 05 a5 04 44 04 e3 03 81 03 : ....d.....D.....
79d8 : __ __ __ BYT 1f 03 bc 02 59 02 f5 01 91 01 2d 01 c9 00 65 00 : ....Y.....-...e.
79e8 : __ __ __ BYT 00 00 9b ff 37 ff d3 fe 6f fe 0b fe a7 fd 44 fd : ....7...o.....D.
79f8 : __ __ __ BYT e1 fc 7f fc 1d fc bc fb 5b fb fb fa 9c fa 3e fa : ........[.....>.
7a08 : __ __ __ BYT e1 f9 84 f9 29 f9 ce f8 75 f8 1d f8 c6 f7 71 f7 : ....)...u.....q.
7a18 : __ __ __ BYT 1c f7 c9 f6 78 f6 28 f6 da f5 8d f5 41 f5 f8 f4 : ....x.(.....A...
7a28 : __ __ __ BYT b0 f4 69 f4 25 f4 e2 f3 a2 f3 63 f3 26 f3 eb f2 : ..i.%.....c.&...
7a38 : __ __ __ BYT b2 f2 7b f2 47 f2 14 f2 e4 f1 b5 f1 89 f1 5f f1 : ..{.G........._.
7a48 : __ __ __ BYT 38 f1 12 f1 ef f0 cf f0 b0 f0 94 f0 7b f0 64 f0 : 8...........{.d.
7a58 : __ __ __ BYT 4f f0 3c f0 2c f0 1f f0 14 f0 0b f0 05 f0 01 f0 : O.<.,...........
7a68 : __ __ __ BYT 00 f0 01 f0 05 f0 0b f0 14 f0 1f f0 2c f0 3c f0 : ............,.<.
7a78 : __ __ __ BYT 4f f0 64 f0 7b f0 94 f0 b0 f0 cf f0 ef f0 12 f1 : O.d.{...........
7a88 : __ __ __ BYT 38 f1 5f f1 89 f1 b5 f1 e4 f1 14 f2 47 f2 7b f2 : 8._.........G.{.
7a98 : __ __ __ BYT b2 f2 eb f2 26 f3 63 f3 a2 f3 e2 f3 25 f4 69 f4 : ....&.c.....%.i.
7aa8 : __ __ __ BYT b0 f4 f8 f4 41 f5 8d f5 da f5 28 f6 78 f6 c9 f6 : ....A.....(.x...
7ab8 : __ __ __ BYT 1c f7 71 f7 c6 f7 1d f8 75 f8 ce f8 29 f9 84 f9 : ..q.....u...)...
7ac8 : __ __ __ BYT e1 f9 3e fa 9c fa fb fa 5b fb bc fb 1d fc 7f fc : ..>.....[.......
7ad8 : __ __ __ BYT e1 fc 44 fd a7 fd 0b fe 6f fe d3 fe 37 ff 9b ff : ..D.....o...7...
--------------------------------------------------------------------
cube_e:
7ae8 : __ __ __ BYT 00 01 01 02 02 03 03 00 04 05 05 06 06 07 07 04 : ................
7af8 : __ __ __ BYT 00 04 01 05 02 06 03 07                         : ........
--------------------------------------------------------------------
sin_lut:
7b00 : __ __ __ BYT 02 02 02 02 02 02 02 02 03 03 03 03 03 03 03 03 : ................
7b10 : __ __ __ BYT 03 03 03 03 03 03 03 03 03 02 02 02 02 02 02 02 : ................
7b20 : __ __ __ BYT 02 01 01 01 01 01 01 01 00 00 00 00 00 00 00 00 : ................
7b30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 01 01 01 01 01 01 : ................
--------------------------------------------------------------------
sum_to_col:
7b40 : __ __ __ BYT 00 00 00 01 01 02 02 03 03 03                   : ..........
--------------------------------------------------------------------
pal_cr:
7b4a : __ __ __ BYT 01 01 07 03                                     : ....
--------------------------------------------------------------------
lat_wave:
7b4e : __ __ __ BYT 00 ff ff fe fe fd fd fc fc fb fb fb fa fa fa fa : ................
7b5e : __ __ __ BYT fa fa fa fb fb fb fc fc fd fd fe fe ff ff 00 00 : ................
7b6e : __ __ __ BYT 01 01 02 02 03 03 04 04 05 05 05 06 06 06 06 06 : ................
7b7e : __ __ __ BYT 06 06 05 05 05 04 04 03 03 02 02 01 01 00 00 ff : ................
--------------------------------------------------------------------
vert_wave:
7b8e : __ __ __ BYT 00 01 02 02 03 03 04 04 04 04 04 03 03 02 02 01 : ................
7b9e : __ __ __ BYT 00 ff fe fe fd fd fc fc fc fc fc fd fd fe fe ff : ................
7bae : __ __ __ BYT 00 01 02 02 03 03 04 04 04 04 04 03 03 02 02 01 : ................
7bbe : __ __ __ BYT 00 ff fe fe fd fd fc fc fc fc fc fd fd fe fe ff : ................
--------------------------------------------------------------------
cw:
7bce : __ __ __ BSS	12
--------------------------------------------------------------------
mod_paused:
7bda : __ __ __ BSS	1
--------------------------------------------------------------------
Screen:
7bdb : __ __ __ BSS	8
--------------------------------------------------------------------
tworks:
7be3 : __ __ __ BSS	8
--------------------------------------------------------------------
mod_saved_irq:
7beb : __ __ __ BSS	2
--------------------------------------------------------------------
mod_row_buf:
7bed : __ __ __ BSS	16
--------------------------------------------------------------------
bitshift:
7c00 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
7c10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
7c20 : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
7c30 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
uii_data:
7c38 : __ __ __ BSS	513
--------------------------------------------------------------------
uii_status:
7e39 : __ __ __ BSS	257
--------------------------------------------------------------------
hdr:
7f3a : __ __ __ BSS	1084
--------------------------------------------------------------------
modplay:
8378 : __ __ __ BSS	938
--------------------------------------------------------------------
mx:
8722 : __ __ __ BSS	8
--------------------------------------------------------------------
VScreen:
872a : __ __ __ BSS	8
--------------------------------------------------------------------
py_cur:
8732 : __ __ __ BSS	16
--------------------------------------------------------------------
px_cur:
8742 : __ __ __ BSS	16
--------------------------------------------------------------------
row_buf:
8752 : __ __ __ BSS	160
--------------------------------------------------------------------
HeapNode:
87f2 : __ __ __ BSS	4
--------------------------------------------------------------------
BLIT_CODE:
8800 : __ __ __ BSS	224
--------------------------------------------------------------------
tbuffer:
88e0 : __ __ __ BSS	320
--------------------------------------------------------------------
row_sin:
8a20 : __ __ __ BSS	200
--------------------------------------------------------------------
tex_flat:
8ae8 : __ __ __ BSS	1024
