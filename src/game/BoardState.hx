
package game;

import engine.GameState;
import engine.Blob;

import flash.display.BitmapData;
import flash.geom.Point;
import flash.ui.Keyboard;


/**
 * A game state with some points on a board.
 */
class BoardState implements GameState {
    var _dot : Blob;
    var _points : List<Point>;

    public function new() {
        _points = new List();
        _points.push(new Point(80, 60));
        _points.push(new Point(120, 80));
        _points.push(new Point(200, 100));
        _dot = new Blob(new game.assets.Dot());
    }

    public function update(input : engine.Input) {
        return null;
    }

    public function render(arena : BitmapData) : Void {
        var background = 0xffaaaaff;
        arena.fillRect(arena.rect, background);
        for (point in _points) {
            _dot.draw(arena, point);
        }
    }
}
