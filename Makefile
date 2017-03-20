emu=stella

all:
	if [ -f vepseu.bin ]; then rm vepseu.bin; fi

	cd src; dasm main.asm -f3 -v5 -o../vepseu.bin -llog.txt

	$(emu) vepseu.bin
