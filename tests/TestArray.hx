
class TestArray extends haxe.unit.TestCase {
    var _start : Float;

    override public function setup() {
        _start = haxe.Timer.stamp();
    }

    override public function tearDown() {
        var duration = haxe.Timer.stamp() - _start;
        trace(currentTest.method + " took " + duration + "s");
    }

    public function testSplice() {
        var pressed : Array<Bool> = [];
        for (i in 0...10000) {
            pressed[37] = true;
            pressed.splice(0, pressed.length);
        }
        assertTrue(true);
    }

    public function testNew() {
        var pressed : Array<Bool> = [];
        for (i in 0...10000) {
            pressed[37] = true;
            pressed = [];
        }
        assertTrue(true);
    }
}
