
package algebra;

class Matrix {
    var m(default,null) : Int;
    var n(default,null) : Int;
    var A(default,null) : Array<Array<Float>>;

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
    public function dot(b:Matrix) : Matrix {
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

    /**
     * Solves Ax = b.
     * Returns the solution with the least squared error.
     */
    public function solve(b:Matrix) : Matrix {
        //TODO: implement
        //TODO: What to return if multiple solutions
        // have zero error?
        // a) Use L2 regularization on the x values.
        //    Cons:
        //    - It would affect also the computations
        //    with only one solution or non-zero errors.
        return null;
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
