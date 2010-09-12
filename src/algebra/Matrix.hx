
package algebra;

class Matrix {
    var m : Int;
    var n : Int;
    var A : Array<Array<Float>>;

    function new(values:Array<Array<Float>>) {
        m = values.length;
        if (m == 0) {
            throw "The number of columns must be non-zero.";
        }

        n = values[0].length;
        if (n == 0) {
            throw "The number of rows must be non-zero.";
        }
        for (i in 0...m) {
            if (n != values[i].length) {
                throw "All rows must have the same length.";
            }
        }

        A = values;
    }

    public static function fromArray(values:Array<Array<Float>>) {
        return new Matrix(values);
    }

    public static function zeros(m:Int, n:Int) : Matrix {
        var values = new Array<Array<Float>>();
        for (i in 0...m) {
            var row = [];
            for (j in 0...n) {
                row[j] = 0.0;
            }
            values[i] = row;
        }
        return new Matrix(values);
    }

    /**
     * Multiplies two matrices.
     */
    public function dot(b:Matrix) {
        if (n != b.m) {
            throw "Matrix inner dimensions must agree.";
        }

        var result = zeros(m, b.n);
        for (aRowIndex in 0...m) {
            for (bColIndex in 0...b.n) {
                var combination = 0.0;
                for (innerIndex in 0...n) {
                    combination += (A[aRowIndex][innerIndex] *
                            b.A[innerIndex][bColIndex]);

                }
                result.A[aRowIndex][bColIndex] = combination;
            }
        }

        return result;
    }

    public function toString() : String {
        var output = "[";
        for (i in 0...m) {
            if (i > 0) {
                output += ",";
            }
            output += "[" + A[i] + "]";
        }
        output += "]";
        return output;
    }
}
