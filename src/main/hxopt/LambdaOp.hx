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
}
