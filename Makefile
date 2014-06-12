.PHONY: clean dist

SRC_DIR = src/main
PKG_DIR = $(SRC_DIR)/hxopt
HX_SRC = $(PKG_DIR)/*.hx
LIB_JSON = $(SRC_DIR)/haxelib.json

all: dist

target:
	@mkdir target

dist: target/hxopt.zip

target/hxopt.zip: target Makefile $(HX_SRC) $(LIB_JSON)
	cd src/main && zip -r ../../target/hxopt.zip . -x \*~

release:
	haxelib submit target/hxopt.zip

clean:
	@rm -r target
