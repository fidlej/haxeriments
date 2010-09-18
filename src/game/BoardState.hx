
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
    var _points : Array<Point>;

    public function new() {
        _points = [];
        _points.push(new Point(10, 20));
        _points.push(new Point(25, 40));
        _points.push(new Point(84, 64));
        _dot = new Blob(new game.assets.Dot());
    }

    public function update(input : engine.Input) {
        return null;
    }

    public function render(arena : BitmapData) : Void {
        var background = 0xff555500;
        arena.fillRect(arena.rect, background);
        for (point in _points) {
            _dot.draw(arena, point);
        }
    }
}
