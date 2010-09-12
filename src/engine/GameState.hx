
package engine;

import flash.display.BitmapData;

interface GameState {
    /**
     * Updates the game state.
     * It returns the next state or null.
     */
    public function update(input : Input) : GameState;

    public function render(arena : BitmapData) : Void;
}
