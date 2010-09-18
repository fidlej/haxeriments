
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
    var _dragged : Point;

    public function new() {
        _points = new List();
        _points.push(new Point(80, 60));
        _points.push(new Point(120, 80));
        _points.push(new Point(200, 100));
        _dot = new Blob(new game.assets.Dot());
        _dragged = null;
    }

    public function update(input : engine.Input) {
        if (input.mouse.pressed()) {
            if (_dragged == null) {
                _dragged = findNearest(input.mouse.pos);
            }

            if (_dragged != null) {
                _dragged.x = input.mouse.pos.x;
                _dragged.y = input.mouse.pos.y;
            }
        } else {
            _dragged = null;
        }

        return null;
    }

    public function render(arena : BitmapData) : Void {
        var background = 0xffaaaaff;
        arena.fillRect(arena.rect, background);
        for (point in _points) {
            _dot.draw(arena, point);
        }
    }

    function findNearest(pos : Point) : Point {
        var minPoint : Point = null;
        var minDiff : Float = 0;
        for (point in _points) {
            var dx = (point.x - pos.x);
            var dy = (point.y - pos.y);
            var diff = dx*dx + dy*dy;
            if (minPoint == null || diff < minDiff) {
                minDiff = diff;
                minPoint = point;
            }
        }

        return minPoint;
    }
}
