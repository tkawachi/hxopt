# Scala like functions for haxe.ds.Option

## Example

    import haxe.ds.Option;
    using hxopt.OptionOp;
    
    class Example {
            static function main() {
                    var x: Null<Int> = 1;
                    var optX: Option<Int> = x.newOption();
                    var i: Int = optX.getOrElse(2);
            }
    }

See https://github.com/tkawachi/hxopt/blob/master/hxopt/OptionOp.hx for all functions.

