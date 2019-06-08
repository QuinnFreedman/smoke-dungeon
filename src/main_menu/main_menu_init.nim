import sdl2

import
    ../types

func getSDLFullscreenMode(ft: WindowMode): uint32 =
    case ft
    of WindowMode.windowed: 0.uint32
    of WindowMode.fullscreenWindowed: SDL_WINDOW_FULLSCREEN_DESKTOP.uint32
    of WindowMode.fullscreen: SDL_WINDOW_FULLSCREEN.uint32

func menuNode(name: string, children: varargs[Menu]): Menu =
    result = Menu(name: name, children: @children)
    for child in result.children:
        child.parent = result

func menuLeaf(name: string, effect: proc(game: Game)): Menu =
    Menu(
        name: name,
        effect: proc(self: var Menu, game: Game) = effect(game)
    )

func menuLeaf(name: string, effect:
              proc(self: var Menu, game: Game)): Menu =
    Menu(name: name, effect: effect)

func cycleFullscreenMode(ft: WindowMode): WindowMode =
    case ft
    of WindowMode.windowed: WindowMode.fullscreenWindowed
    of WindowMode.fullscreenWindowed: WindowMode.fullscreen
    of WindowMode.fullscreen: WindowMode.windowed

func initMenu*(prefs: Preferences): MainMenuScreen =
    func scaleModeText(prefs: Preferences): string =
        if prefs.scaleModePixelPerfect:
            "Scale Mode:  Pixel Perfect"
        else:
            "Scale Mode:  Stretch"

    func fullscreenText(prefs: Preferences): string =
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
