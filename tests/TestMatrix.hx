
import algebra.Matrix;

class TestMatrix extends haxe.unit.TestCase {
    public function testDot() {
       var a = Matrix.fromArray([[5.0, 3.0, 7.0]]);
       var b = Matrix.fromArray([[1.0], [4.0], [2.0]]);
       assertEquals("[[31]]", a.dot(b).toString());

       assertEquals("[[5,3,7],[20,12,28],[10,6,14]]", b.dot(a).toString());

       try {
           a.dot(Matrix.zeros(2, 2));
           assertFalse(true);
       } catch (expected : String) {
       }
    }

    //TODO: make visible
    public function no_testSolve() {
        var examples = Matrix.fromArray([
                [1.0, 0.0, 0.0],
                [0.0, 2.0, 0.0],
                [0.0, 0.0, 3.0]]);
        var targets = Matrix.fromArray([
                [8.0],
                [14.0],
                [9.0]]);

        assertEquals("[[8.0],[7.0],[3.0]]", examples.solve(targets).toString());
    }
}
