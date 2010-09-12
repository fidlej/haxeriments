
package engine;

import flash.display.BitmapData;
import flash.display.Bitmap;

class Engine {
    var _state : GameState;
    var _arena : BitmapData;
    var _input : Input;

    function new(h : Int, w : Int, state : GameState) {
        _state = state;

        var current = flash.Lib.current;
        _arena = new BitmapData(h, w);
        current.addChild(new Bitmap(_arena));

        current.stage.addEventListener(flash.events.Event.ENTER_FRAME, onEnter);
        _input = new Input(current.stage);
    }

    public static function start(h : Int, w : Int, state : GameState) : Void {
        new Engine(h, w, state);
    }

    function onEnter(ignored : flash.events.Event) {
        var nextState = _state.update(_input);
        if (nextState != null) {
            trace("next state: " + nextState);
            _state = nextState;
        }

        _arena.lock();
        _state.render(_arena);
        _arena.unlock();
        _input.clearJustPressed();
    }

}
