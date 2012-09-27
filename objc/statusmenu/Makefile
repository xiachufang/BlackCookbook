CC=clang
BUILD=$(CC) -fobjc-arc
BUILDD=$(BUILD) -g
LINK=$(BUILD) -framework Cocoa
OUT=sample
APP=sample.app
INFO=Info.plist
SOURCES=MainMenu.m AppDelegate.m main.m
OBJS=MainMenu.o AppDelegate.o main.o

.PHONY: clean help

release: build
	make package

debug: buildd
	make package

package:
	mkdir -p $(APP)/Contents/MacOS
	cp $(OUT) $(APP)/Contents/MacOS/
	cp $(INFO) $(APP)/Contents

run: 
	open $(APP)

build:
	$(BUILD) -c $(SOURCES)
	make link

buildd:
	$(BUILDD) -c $(SOURCES)
	make link

link:
	$(LINK) -o $(OUT) $(OBJS)

analyze:
	$(BUILD) --analyze $(SOURCES)

clean:
	-rm -f mytest $(OBJS)
	-rm -f *~
	-rm -f $(OUT)
	-rm -rf $(APP)

help:
	-echo "make release|debug|run|analyze|clean|help"
