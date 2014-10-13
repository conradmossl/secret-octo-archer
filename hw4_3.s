.text
main:
	lui $t0, 15    # 000f0000
	or  $t0, 15	   # 000f000f
	lui $t0, 15    # 000f0000
	jr $ra         # 00400018
	