
package game;

import flash.display.BitmapData;

class DataInfo {
    static var _subrects = {
        tree: [4,0,54,64],
        playerLeft: [110,16,26,40],
        playerDown: [70,12,26,46],
        playerRight: [148,16,26,40],
    };

    public static function createBlob(tiledData:BitmapData, name:String) {
        var coords = Reflect.field(_subrects, name);
        return new engine.Blob(tiledData, coords[0], coords[1],
                coords[2], coords[3]);
    }
}

