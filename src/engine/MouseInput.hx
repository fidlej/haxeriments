
package engine;

import flash.geom.Point;
import flash.events.MouseEvent;
import flash.events.EventDispatcher;

class MouseInput {
    public var pos(default,null) : Point;
    var _pressed : Bool;
    var _justPressed : Bool;

    public function new(observable : EventDispatcher) {
        pos = new Point(0, 0);
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

    public function updatePos(x, y) {
        pos.x = x;
        pos.y = y;
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
