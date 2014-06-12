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

    @Test public function testFindOpt() {
        var ary = [1, 2, 3, 4, 5];
        areEqual(Some(3), ary.findOpt(function(e) { return e > 2; }));
        areEqual(None, ary.findOpt(function(e) { return e < 0; }));
    }

    @Test public function testIndexWhere() {
        var ary = [1, 2, 3, 4, 5];
        areSame(2, ary.indexWhere(function(e) { return e > 2; }));
        areSame(-1, ary.indexWhere(function(e) { return e < 0; }));
    }

    @Test public function testHeadOpt1() {
        var ary = [3, 4 ,5];
        areEqual(Some(3), ary.headOpt());
    }

    @Test public function testHeadOpt2() {
        var ary = [];
        areEqual(None, ary.headOpt());
    }

    @Test public function testHeadOpt3() {
        var ary = [null];
        areEqual(Some(null), ary.headOpt());
    }

    @Test public function testLastOpt1() {
        var ary = [3, 4 ,5];
        areEqual(Some(5), ary.lastOpt());
    }
    
    @Test public function testLastOpt2() {
        var ary = [];
        areEqual(None, ary.lastOpt());
    }

    @Test public function testLastOpt3() {
        var ary = [null];
        areEqual(Some(null), ary.lastOpt());
    }
}
