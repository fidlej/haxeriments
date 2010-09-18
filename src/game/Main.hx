
package game;

import algebra.Matrix;

class Main {
   public static function main() {
       try {
           trace("preparing firebug");
           if (haxe.Firebug.detect()) {
               haxe.Firebug.redirectTraces();
           }
           trace("hello firebug");

           var state = new BoardState();
           engine.Engine.start(400, 300, state);

       } catch (e : Dynamic) {
           trace("exception: " + e);
       }
   }
}
