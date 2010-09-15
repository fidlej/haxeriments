
package game;

import engine.GameState;


class IntroState implements GameState {
    public function new() {
    }

    public function update(input) : GameState {
        var tiles = new assets.images.Tiles();
        return new SkiState(tiles);
    }

    public function render(arena) {
    }
}
