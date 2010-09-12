
package game;

import engine.GameState;


class IntroState implements GameState {
    var _started : Bool;
    var _nextState : GameState;

    public function new() {
    }

    public function update(input) {
        if (_started) {
            return _nextState;
        }

        var me = this;
        _started = true;
        trace("Loading tiles");
        var loader = new flash.display.Loader();
        loader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE,
            function(ignored) {
                trace("Loaded");
                me._nextState = new SkiState(untyped loader.content.bitmapData);
        });
        loader.load(new flash.net.URLRequest("data/tiles.png"));
        return null;
    }

    public function render(arena) {
    }
}
