# Scala like functions for haxe.ds.Option

## Example

    import haxe.ds.Option;
    using hxopt.OptionOp;
    
    class Example {
            static function main() {
                    var x: Null<Int> = 1;
                    var optX: Option<Int> = x.option();
                    var i: Int = optX.getOrElse(2);
            }
    }

See hxopt/OptionOp.hx for all functions.

