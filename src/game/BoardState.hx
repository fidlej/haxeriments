
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
    var _dotRadius : Float;
    var _dot : Blob;
    var _points : List<Point>;
    var _dragged : Point;

    public function new() {
        _points = new List();
        _points.push(new Point(80, 60));
        _points.push(new Point(120, 80));
        _points.push(new Point(200, 100));

        var dotImage = new game.assets.Dot();
        _dot = new Blob(dotImage);
        _dotRadius = dotImage.width / 2;

        _dragged = null;
    }

    public function update(input : engine.Input) {
        if (input.mouse.pressed()) {
            if (_dragged == null) {
                var nearest = findNearest(input.mouse.pos);
                if (nearest != null && isInsideDot(input.mouse.pos, nearest)) {
                    _dragged = nearest;
                }
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

    /**
     * Returns the nearest point or
     * null if the list of points is empty.
     */
    function findNearest(pos : Point) : Point {
        var minPoint : Point = null;
        var minDiff : Float = Math.POSITIVE_INFINITY;
        for (point in _points) {
            var diff = sqDiff(pos, point);
            if (diff < minDiff) {
                minDiff = diff;
                minPoint = point;
            }
        }

        return minPoint;
    }

    function sqDiff(a : Point, b : Point) {
        var dx = (a.x - b.x);
        var dy = (a.y - b.y);
        return dx*dx + dy*dy;
    }

    function isInsideDot(pos : Point, point : Point) {
        var d = Math.sqrt(sqDiff(pos, point));
        return d < _dotRadius;
    }
}
