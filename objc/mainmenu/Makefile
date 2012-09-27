CC=clang
BUILD=$(CC) -fobjc-arc
LINK=$(BUILD) -framework Cocoa
OUT=sample
APP=sample.app
INFO=Info.plist
SOURCES=MainMenu.m AppDelegate.m main.m
OBJS=MainMenu.o AppDelegate.o main.o

.PHONY: all run clean help
all: build
	mkdir -p $(APP)/Contents/MacOS
	cp $(OUT) $(APP)/Contents/MacOS/
	cp $(INFO) $(APP)/Contents

run: all
	open $(APP)

build:
	$(BUILD) -c $(SOURCES)
	$(LINK) -o $(OUT) $(OBJS)

analyze:
	$(BUILD) --analyze $(SOURCES)

clean:
	-rm -f mytest $(OBJS)
	-rm -f *~
	-rm -f $(OUT)
	-rm -rf $(APP)

help:
	-echo "make all|run|build|analyze|clean|help"
