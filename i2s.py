import Image
import sys

image = Image.open(raw_input("Image Name? ")).convert("1");

wrap = -1
wrap2 = -1

outstr = ""
outstr2 = ""

for pixel in list(image.getdata()):
    wrap += 1

    if wrap == 8:
        outstr2 = "    DC %" + outstr + "\n" + outstr2;
        outstr = "";
        wrap = 0;

    outstr += ("1" if pixel else "0");

print("    DC %" + outstr + "\n" + outstr2);
