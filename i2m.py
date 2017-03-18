import Image
image = Image.open(raw_input("Image Name? ")).convert("1");

wrap = 15

for pixel in list(image.getdata()):
    wrap += 1

    if wrap == 16:
        wrap = 0
        print "\n    HEX ",

    print "FF" if pixel else "00",
