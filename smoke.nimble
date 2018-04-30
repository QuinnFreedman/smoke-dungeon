# Package

version       = "0.1.0"
author        = "Quinn"
description   = "A experemental roguelike in nim"
license       = "GPLv3"
srcDir        = "src"
bin           = @["smoke"]
skipExt       = @["nim"]

# Dependencies

requires "nim >= 0.18.0"
requires "sdl2 >= 1.1.0"
requires "binaryheap >= 0.1.0"
requires "patty >= 0.3.1"
