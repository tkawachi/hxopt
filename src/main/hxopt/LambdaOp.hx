package hxopt;

import haxe.ds.Option;

using Lambda;
using hxopt.OptionOp;

class LambdaOp {
    public static function flatten<A>(it: Iterable<Option<A>>): Iterable<A> {
        return it.filter(function(elem) {
            return elem.isDefined();
        }).map(function(elem) {
            return elem.get();
        });
    }

    public static function headOpt<A>(it: Iterable<A>): Option<A> {
        for (v in it) {
            return Some(v);
        }
        return None;
    }

    public static function lastOpt<A>(it: Iterable<A>): Option<A> {
        var r: Option<A> = None;
        for (v in it) {
            r = Some(v);
        }
        return r;
    }

    public static function findOpt<A>(it: Iterable<A>, f: A -> Bool): Option<A> {
        return it.find(f).option();
    }

    /**
     * Finds index of the first element satisfying a predicate.
     */
    public static function indexWhere<A>(it: Iterable<A>, f: A -> Bool): Int {
        var idx = 0;
        for (v in it) {
            if (f(v)) return idx;
            idx += 1;
        }
        return -1;
    }

    public static function forall<A>(it: Iterable<A>, f: A -> Bool): Bool {
        return !it.exists(function(e) { return !f(e); });
    }

}

/**
 * Faster implementation for Array.
 */
class ArrayOp {
    public static function lastOpt<A>(ary: Array<A>): Option<A> {
        return
            if (ary.length == 0) None;
            else Some(ary[ary.length - 1]);
    }
}