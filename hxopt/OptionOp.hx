package hxopt;

import haxe.ds.Option;
import haxe.macro.Expr;

using Lambda;

/**
 * Functions used with Option.
 * 
 * Example:
 * using OptionOp;
 * 123.newOption().map(function(v) { return v * 2; });
 */
class OptionOp {
    public static function map<A,B>(opt: Option<A>, f: A -> B): Option<B> {
        return switch (opt) {
            case None: None;
            case Some(v): Some(f(v));
        };
    }

    public static function flatMap<A,B>(opt: Option<A>, f: A -> Option<B>): Option<B> {
        return switch (opt) {
            case None: None;
            case Some(v): f(v);
        };
    }

    public static function foreach<A>(opt: Option<A>, f: A -> Void) {
        switch (opt) {
            case None:
            case Some(v): f(v);
        }
    }

    public static function filter<A>(opt: Option<A>, p: A -> Bool): Option<A> {
        return switch (opt) {
            case None: None;
            case Some(v): if (p(v)) opt else None;
        }
    }

    public static function exists<A>(opt: Option<A>, p: A -> Bool): Bool {
        return isDefined(filter(opt, p));
    }

    public static function isDefined<A>(opt: Option<A>): Bool {
        return switch (opt) {
            case None: false;
            case Some(_): true;
        };
    }

    public static function isEmpty<A>(opt: Option<A>): Bool {
        return switch (opt) {
            case None: true;
            case Some(_): false;
        };
    }

    public static function get<A>(opt: Option<A>): A {
        switch (opt) {
            case Some(v): return v;
            case None: throw "None.get called";
        }
    }

    public static function orNull<A>(opt: Option<A>): Null<A> {
        return switch (opt) {
            case None: null;
            case Some(v): v;
        }
    }

    macro public static function getOrElse(opt: Expr, els: Expr) {
        return macro switch ($opt) {
            case Some(v): v;
            case None: $els;
        }
    }

    macro public static function orElse(opt: Expr, els: Expr) {
        return macro switch ($opt) {
            case Some(_): $opt;
            case None: $els;
        }
    }

    public static function flatten<A>(opt: Option<Option<A>>): Option<A> {
        return flatMap(opt, function (e) { return e; });
    }

    public static inline function eq<A>(opt1: Option<A>, opt2: Option<A>): Bool {
        return Type.enumEq(opt1, opt2);
    }

    public static function newOption<A>(arg: Null<A>): Option<A> {
        return if (arg != null) Some(arg) else None;
    }

}
