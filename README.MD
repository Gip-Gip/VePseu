# VePseu

The **Ve**ry **Pseu**do 3d engine (for the Atari 2600), **now at `II.III.MMXVII
Rev. 0`!**

## What is VePseu?

VePseu is one of the few attempts at a real-time "3d" engine for the vanilla
Atari cartridge (that is, without any extra chips). It is programmed in DASM
assembler and takes up a small amount of computation time. The engine allows up
to 6 16x16 maps to be stored in a vanilla 4k rom, with plenty of wiggle room for
whatever code you wish to add to it. The veiwport is also acceptable, as a
minimap is drawn along with a relatively clear 4-directional first-person
perspective.

## Why use VePseu?

 * Relatively low render time
 * "Fits" on a 4k cart
 * "Acceptable" graphics
 * Not-as-cryptic source code
 * Open source (under the ISC)

## Why not use VePseu?

 * Gip-Gip sucks at commenting
 * With the current state of the code you'll need a second bank to do anything
   semi-advanced
 * You rarely need a 3d engine on an Atari

## How to contribute?

**As of the current moment, VePseu is in dier need of size optimization. Any
size reduction is greatly appreciated!**

Here are some things I need help on:

 * Cleaning the source
 * Optimizing the source
 * Improving the experience
 * Documentation

Contributing will get you a permanent place in the AUTHORS.TXT

## Misc. Facts
 * The project was started in mid March of 2017
 * So far there are 1,635 total lines of code(sloccount)
 * The Versioning scheme is [Inf. Version].[Annual Version].[Year] in roman
   numerals
     * The Infinitive Version is incremented every large change
     * The Annual Version is incremented with the Infinitive Version and every
       large update which isn't drastic enough to increment the Infinitive
       Version. It is reset to one annually
