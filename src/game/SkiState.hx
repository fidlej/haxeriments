
package game;

import engine.GameState;
import engine.Blob;

import flash.display.BitmapData;
import flash.geom.Point;
import flash.ui.Keyboard;


class SkiState implements GameState {
    var _dot : Blob;
    var _pos : Point;

    public function new(tiledData : BitmapData) {
        _dot = DataInfo.createBlob(tiledData, "playerDown");
        _pos = new Point(0, 0);
    }

    public function update(input : engine.Input) {
        var speed = 10;
        if (input.pressed(Keyboard.LEFT)) {
            _pos.x -= speed;
        }
        if (input.pressed(Keyboard.RIGHT)) {
            _pos.x += speed;
        }
        if (input.pressed(Keyboard.DOWN)) {
            _pos.y += speed;
        }
        if (input.pressed(Keyboard.UP)) {
            _pos.y -= speed;
        }

        return null;
    }

    public function render(arena : BitmapData) : Void {
        var background = 0xff555500;
        arena.fillRect(arena.rect, background);
        _dot.draw(arena, _pos);
    }
}
