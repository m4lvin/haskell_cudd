default:
	stack build

install:
	stack install

dist:
	mkdir dist

cudd3: cudd3get cudd3build cudd3install

cudd3get: dist
	cd dist && wget "ftp://vlsi.colorado.edu/pub/cudd-3.0.0.tar.gz"
	cd dist && tar xf cudd-3.0.0.tar.gz

cudd3build:
	patch dist/cudd-3.0.0/Makefile.am cudd-Makefile.am.patch
	cd dist/cudd-3.0.0 && ./configure --enable-shared --enable-dddmp --enable-obj
	cd dist/cudd-3.0.0 && make

cudd3install:
	cd dist/cudd-3.0.0 && sudo make install
