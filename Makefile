
all: lib
	haxe compile.hxml
	mv public/output.swf public/main.swf

lib: assets/assets.swf

assets/assets.swf: assets/assets.xml assets/generate_class.py assets/images/*.png
	rm -f src/game/assets/*.hx
	swfmill simple assets/assets.xml assets/assets.swf
	python assets/generate_class.py assets/assets.xml src

publish:
	rsync -rlv public fidlej@kvik:~/public_html/public/flash/

.PHONY: all lib publish
