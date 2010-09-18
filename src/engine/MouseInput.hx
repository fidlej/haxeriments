
package engine;

import flash.events.MouseEvent;
import flash.events.EventDispatcher;

class MouseInput {
    var _pressed : Bool;
    var _justPressed : Bool;

    public function new(observable : EventDispatcher) {
        _pressed = false;
        _justPressed = false;

        observable.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
        observable.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
    }

    /**
     * Returns true if the mouse button continues to be held
     * or was pressed in this frame.
     */
    public function pressed() : Bool {
        return _pressed || _justPressed;
    }

    public function clearJustPressed() {
        _justPressed = false;
    }

    function onMouseDown(event : MouseEvent) {
        if (!_pressed) {
            trace("mousedown: " + event);
        }
        _justPressed = true;
        _pressed = true;
    }

    function onMouseUp(event : MouseEvent) {
        if (_pressed) {
            trace("mouseup: " + event);
        }
        _pressed = false;
    }
}
