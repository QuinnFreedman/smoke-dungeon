import sdl2

type
    ClothingStats* = object
        name: string

    ClothingHead* = object
        stats: ClothingStats

    ClothingBody* = object
        stats: ClothingStats

    ClothingFeet* = object
        stats: ClothingStats

