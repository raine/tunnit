.PHONY: test

SRC = $(shell find src -name "*.ls" -type f | sort)
LIB = $(SRC:src/%.ls=lib/%.js)

MOCHA = ./node_modules/.bin/mocha
LSC = node_modules/.bin/lsc

default: all

lib:
	mkdir -p lib/

lib/%.js: src/%.ls lib
	$(LSC) --compile --output lib "$<"

all: compile

compile: $(LIB) package.json

install:
	npm install -g .

clean:
	rm -rf lib

test: compile
	@$(MOCHA) \
		--timeout 20000 \
		--require ./test/lib/globals.ls \
		--compilers ls:LiveScript
