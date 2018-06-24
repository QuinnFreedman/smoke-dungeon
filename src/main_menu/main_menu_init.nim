import sdl2

import
    ../types

proc getSDLFullscreenMode(ft: WindowMode): uint32 =
    case ft
    of WindowMode.windowed: 0.uint32
    of WindowMode.fullscreenWindowed: SDL_WINDOW_FULLSCREEN_DESKTOP.uint32
    of WindowMode.fullscreen: SDL_WINDOW_FULLSCREEN.uint32

proc menuNode(name: string, children: varargs[Menu]): Menu =
    result = Menu(name: name, children: @children)
    for child in result.children:
        child.parent = result

proc menuLeaf(name: string, effect: proc(game: Game)): Menu =
    Menu(
        name: name,
        effect: proc(self: var Menu, game: Game) = effect(game)
    )

proc menuLeaf(name: string, effect:
              proc(self: var Menu, game: Game)): Menu =
    Menu(name: name, effect: effect)

proc cycleFullscreenMode(ft: WindowMode): WindowMode =
    case ft
    of WindowMode.windowed: WindowMode.fullscreenWindowed
    of WindowMode.fullscreenWindowed: WindowMode.fullscreen
    of WindowMode.fullscreen: WindowMode.windowed

proc initMenu*(prefs: Preferences): MainMenuScreen =
    proc scaleModeText(prefs: Preferences): string =
        if prefs.scaleModePixelPerfect:
            "Scale Mode:  Pixel Perfect"
        else:
            "Scale Mode:  Stretch"

    proc fullscreenText(prefs: Preferences): string =
        "Fullscreen: " & $prefs.fullscreen

    result.root = menuNode("Menu",
        menuNode("Graphics",
            menuLeaf(prefs.scaleModeText, proc(self: var Menu, game: Game) =
                game.prefs.scaleModePixelPerfect = not game.prefs.scaleModePixelPerfect
                self.name = game.prefs.scaleModeText
            ),
            menuLeaf(prefs.fullscreenText, proc(self: var Menu, game: Game) =
                game.prefs.fullscreen = cycleFullscreenMode(game.prefs.fullscreen)
                self.name = game.prefs.fullscreenText

                discard game.window.setFullscreen(getSDLFullscreenMode(game.prefs.fullscreen))
            )
        ),
        menuLeaf("Exit", proc(game: Game) = game.shouldQuit = true)
    )
    result.active = result.root
