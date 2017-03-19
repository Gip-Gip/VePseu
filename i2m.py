import Image
import sys

image = Image.open(raw_input("Image Name? ")).convert("1");

wrap = 15

for pixel in list(image.getdata()):
    wrap += 1

    if wrap == 16:
        wrap = 0
        sys.stdout.write("\n    HEX ");

    sys.stdout.write("FF " if pixel else "00 ");

print("");

wrap = -1
wrap2 = -1

outstr = ""
outstr2 = ""

for pixel in list(image.getdata()):
    wrap += 1
    wrap2 += 1

    if wrap2 == 8:
        outstr2 = outstr + outstr2
        outstr = ""
        wrap2 = 0;

    if wrap == 16:
        wrap = 0;
        sys.stdout.write("\n    DC.W %" + outstr2);
        outstr2 = "";

    outstr += ("1" if pixel else "0");

print("\n    DC.W %" + outstr + outstr2);
