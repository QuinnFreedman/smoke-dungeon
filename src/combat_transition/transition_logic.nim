import SDL2
import
    ../constants,
    ../types

proc initTransition*(self: var CombatTransitionScreen,
                     startWindow, endWindow: Rect,
                     whenDone: ref ScreenChange) {.inline.} =
    self.startWindow = startWindow
    self.endWindow = endWindow
    self.whenDone = whenDone[]

proc loopTransition*(self: var CombatTransitionScreen, dt: float): ScreenChange =
    self.timeElapsed += dt
    if (self.timeElapsed >= TRANSITION_LENGTH_SECONDS):
        return self.whenDone
