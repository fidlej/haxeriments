
package engine;

import flash.display.BitmapData;
import flash.geom.Point;
import flash.geom.Rectangle;

/**
 * A image blitter.
 */
class Blob {
    static var _sharedPoint = new Point(0,0);
    var _image : BitmapData;
    var _centerX : Float;
    var _centerY : Float;

    public function new(image:BitmapData) {
        _image = image;
        _centerX = (_image.width - 1) / 2;
        _centerY = (_image.height - 1) / 2;
    }

    public function draw(arena:BitmapData, pos:Point) {
        _sharedPoint.x = pos.x - _centerX;
        _sharedPoint.y = pos.y - _centerY;
        arena.copyPixels(_image, _image.rect, _sharedPoint, null, null, true);
    }
}
