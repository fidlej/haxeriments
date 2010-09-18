
package engine;

import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.EventDispatcher;

class Input {
    public var mouse(default,null) : MouseInput;
    var _justPressed : Array<Bool>;
    var _pressed : Array<Bool>;

    public function new(observable : EventDispatcher) {
        _pressed = [];

        observable.addEventListener(KeyboardEvent.KEY_UP, onKeyUp,
                false, 0, true);
        observable.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown,
                false, 0, true);
        observable.addEventListener(Event.ACTIVATE, restart,
                false, 0, true);
        observable.addEventListener(Event.DEACTIVATE, restart,
                false, 0, true);

        mouse = new MouseInput(observable);
    }

    /**
     * Returns true if the key continues to be held
     * or was pressed in this frame.
     */
    public function pressed(keyCode : Int) : Bool {
        return _pressed[keyCode] || _justPressed[keyCode];
    }

    public function clearJustPressed() {
        _justPressed = [];
        mouse.clearJustPressed();
    }

    function onKeyDown(event : KeyboardEvent) {
        if (!_pressed[event.keyCode]) {
            trace("keydown: " + event);
        }
        _justPressed[event.keyCode] = true;
        _pressed[event.keyCode] = true;
    }

    function onKeyUp(event : KeyboardEvent) {
        if (_pressed[event.keyCode]) {
            trace("keyup: " + event);
        }
        _pressed[event.keyCode] = false;
    }

    function restart(event : Event) {
        _pressed = [];
        _justPressed = [];
    }
}
