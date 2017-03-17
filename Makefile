all:
	if [ -f vepseu.bin ]; then rm vepseu.bin; fi

	dasm main.asm -f3 -v5 -ovepseu.bin -llog.txt

	z26 vepseu.bin
