
all: lib
	haxe compile.hxml
	mv public/output.swf public/main.swf

lib:
	swfmill simple assets/assets.xml assets/assets.swf

.PHONY: all lib
