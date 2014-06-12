.PHONY: clean dist test

SRC_DIR = src/main
PKG_DIR = $(SRC_DIR)/hxopt
HX_SRC = $(PKG_DIR)/*.hx
TEST_SRC= src/test/*.hx
LIB_JSON = $(SRC_DIR)/haxelib.json

all: test

test: target/build Makefile $(HX_SRC) $(LIB_JSON) $(TEST_SRC)
	haxelib run munit test

target:
	@mkdir target

target/build: target
	@mkdir target/build

dist: target/hxopt.zip

target/hxopt.zip: target Makefile $(HX_SRC) $(LIB_JSON)
	cd src/main && zip -r ../../target/hxopt.zip . -x \*~

release:
	haxelib submit target/hxopt.zip

clean:
	@rm -r target
