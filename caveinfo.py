#! /usr/bin/env python3

"""Output information about Stone Raider II caves."""

import argparse
import logging
from typing import Final
from PIL import Image


graphics: Final[dict[int, list[int]]] = {
    0 : [0x0004, 0x400E, 0xE00C, 0x7010, 0x0BD0, 0x07E0, 0x0DB0, 0x0FF0, 0x0FF0, 0x0C30, 0x07E0, 0x0BD0, 0x100E, 0x3007, 0x3802, 0x1000],  # skull monster
    1 : [0x381C, 0x4422, 0x4422, 0x4422, 0x4422, 0x4422, 0x743A, 0x75BA, 0x75BA, 0x7FFE, 0xFFFF, 0xFFFF, 0x7FFE, 0x300C, 0x0FF0, 0x0000],  # alien monster
    6 : [0x0150, 0x1554, 0x03A8, 0x0DB4, 0x1BB4, 0x058A, 0x07F0, 0x0168, 0x0368, 0x0568, 0x05F8, 0x05F0, 0x0360, 0x0160, 0x03F0, 0x07F0],  # player
    7 : [0xC003, 0xF00F, 0x7C3E, 0x7FFE, 0x3FFC, 0x3FFC, 0x1FF8, 0x1FF8, 0x1FF8, 0x1FF8, 0x3FFC, 0x3FFC, 0x7FFE, 0x7C3E, 0xF00F, 0xC003],  # slime
    8 : [0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],  # tunnel
    9 : [0xAAAA, 0x5555, 0xAAAA, 0x5555, 0xAAAA, 0x5555, 0xAAAA, 0x5555, 0xAAAA, 0x5555, 0xAAAA, 0x5555, 0xAAAA, 0x5555, 0xAAAA, 0x5555],  # dirt
    11: [0x0000, 0x0000, 0x0000, 0x1FF8, 0x2FFC, 0x5FFE, 0xBFFF, 0xBFFF, 0x5FFE, 0x2FFC, 0x17F8, 0x0BF0, 0x05E0, 0x02C0, 0x0180, 0x0000],  # diamond
    12: [0x0FC0, 0x3B30, 0xCEFC, 0xB23F, 0xA8BF, 0x8A8B, 0xA0AF, 0xAA8B, 0x9ABC, 0xA688, 0x9AAA, 0xA6AA, 0xA9A8, 0x2AA8, 0x0920, 0x0280],  # stone
    13: [0xFEFE, 0xFEFE, 0xFEFE, 0x0000, 0xEFEF, 0xEFEF, 0xEFEF, 0x0000, 0x7F7F, 0x7F7F, 0x7F7F, 0x0000, 0xF7F7, 0xF7F7, 0xF7F7, 0x0000],  # wall
    14: [0xFFFF, 0xFFFF, 0xC003, 0xD81B, 0xD81B, 0xC003, 0xC003, 0xC003, 0xC003, 0xC003, 0xC003, 0xD81B, 0xD81B, 0xC003, 0xFFFF, 0xFFFF],  # border
    15: [0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xF81F, 0xF81F, 0xF99F, 0xF99F, 0xF81F, 0xF81F, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF],  # hidden exit
}


def get_cave_info(file: str) -> None:
    """Get information about a cave."""
    with open(file, "rb") as fp:
        logging.info(f"Processing cave file {file}.")
        data = fp.read()
        if len(data) != 509:
            logging.warn(f"File {file} has wrong length -- skipping")
            return
        bonus = data[0]
        diamond_points = data[1]*100 + data[2]*10 + data[3]
        diamond_count = data[4]
        image = render_cave(data)
        image.save(file + ".png", "PNG")
        print(f"Cave {file}: Bonus timer: {bonus}, diamond points: {diamond_points}, required diamonds: {diamond_count}.")



def render_cave(data: bytes) -> Image.Image:
    """Render an image of a cave based on the given cave data."""
    cave_width = 40
    cave_height = 25
    tile = 0
    image = Image.new("1", (cave_width*16, cave_height*16))
    while tile < cave_width * cave_height // 2:
        render_tile(data[tile+9] >> 4, tile*2, image)
        render_tile(data[tile+9] & 0x0f, tile*2 + 1, image)
        tile += 1
    return image


def render_tile(item: int, pos: int, image: Image.Image) -> None:
    """Render a single tile."""
    x = (pos % 40) * 16
    y = (pos // 40) * 16
    for row in graphics[item]:
        for col in range(16):
            image.putpixel((x+col, y), 1 if row & (0x8000 >> col) != 0 else 0)
        y += 1


def parse_arguments() -> list[str]:
    """Parse command line arguments."""
    parser = argparse.ArgumentParser(
        description = __doc__,
        epilog = None,
        fromfile_prefix_chars = "@",
    )
    parser.add_argument("cave", nargs="+", help="Name of file containing cave data")
    parser.add_argument("--verbose", action="store_true", help="Verbose output")
    parser.add_argument("--debug", action="store_true", help="Debug output")
    args = parser.parse_args()

    if args.debug:
        logging.getLogger().setLevel(logging.DEBUG)
    elif args.verbose:
        logging.getLogger().setLevel(logging.INFO)

    return args.cave


def main():
    caves = parse_arguments()
    for cave in caves:
        get_cave_info(cave)


if __name__ == "__main__":
    main()
    exit(0)
