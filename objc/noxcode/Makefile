CC=clang
BUILD=$(CC) -fobjc-arc
LINK=$(BUILD) -framework Cocoa

.PHONY: all run clean
all: build
	mkdir -p mytest.app/Contents/MacOS
	cp mytest mytest.app/Contents/MacOS/

run: all
	open mytest.app

build: myWindow.o myView.o main.o
	$(LINK) -o mytest myWindow.o myView.o main.o

myWindow.o:
	$(BUILD) -c myWindow.m

myView.o:
	$(BUILD) -c myView.m

main.o:
	$(BUILD) -c main.m

clean:
	-rm mytest myWindow.o myView.o main.o
	-rm *~
	-rm -r mytest.app
