package;

import massive.munit.util.Timer;
import massive.munit.Assert.*;
import massive.munit.async.AsyncFactory;
import haxe.ds.Option;

using hxopt.LambdaOp;

class LambdaOpTest  {
    public function new() {}

    @Test public function testForall() {
        var ary = [1, 2, 3, 4, 5];
        isTrue(ary.forall(function(e) { return e > 0; }));
        isFalse(ary.forall(function(e) { return e % 2 == 0; }));
    }

    @Test public function testFindOption() {
        var ary = [1, 2, 3, 4, 5];
        areEqual(Some(3), ary.findOption(function(e) { return e > 2; }));
        areEqual(None, ary.findOption(function(e) { return e < 0; }));
    }

    @Test public function testIndexWhere() {
        var ary = [1, 2, 3, 4, 5];
        areSame(2, ary.indexWhere(function(e) { return e > 2; }));
        areSame(-1, ary.indexWhere(function(e) { return e < 0; }));
    }

    @Test public function testHeadOption1() {
        var ary = [3, 4 ,5];
        areEqual(Some(3), ary.headOption());
    }

    @Test public function testHeadOption2() {
        var ary = [];
        areEqual(None, ary.headOption());
    }

    @Test public function testHeadOption3() {
        var ary = [null];
        areEqual(Some(null), ary.headOption());
    }

    @Test public function testLastOption1() {
        var ary = [3, 4 ,5];
        areEqual(Some(5), ary.lastOption());
    }
    
    @Test public function testLastOption2() {
        var ary = [];
        areEqual(None, ary.lastOption());
    }

    @Test public function testLastOption3() {
        var ary = [null];
        areEqual(Some(null), ary.lastOption());
    }
}
