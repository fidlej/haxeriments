
package engine;

import flash.display.BitmapData;
import flash.geom.Point;
import flash.geom.Rectangle;

class Blob {
    static var _sharedPoint = new Point(0,0);
    var _image : BitmapData;
    var _rect : Rectangle;
    var _centerX : Float;
    var _centerY : Float;

    public function new(image:BitmapData, x:Int, y:Int, w:Int, h:Int) {
        _image = image;
        _rect = new Rectangle(x, y, w, h);
        _centerX = w / 2;
        _centerY = h / 2;
    }

    public function draw(arena:BitmapData, pos:Point) {
        _sharedPoint.x = pos.x - _centerX;
        _sharedPoint.y = pos.y - _centerY;
        arena.copyPixels(_image, _rect, _sharedPoint, null, null, true);
    }
}
