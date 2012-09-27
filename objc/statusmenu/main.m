/* -*- mode: objc -*- */
#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSApplication *app = [NSApplication sharedApplication];
        id delegate = [[AppDelegate alloc] init];
        app.delegate = delegate;

        return NSApplicationMain(argc, (const char**)argv);
    }
}
