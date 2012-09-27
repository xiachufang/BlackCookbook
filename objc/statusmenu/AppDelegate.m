/* -*- mode:objc -*- */

#import "AppDelegate.h"
#import "MainMenu.h"

@implementation AppDelegate
@synthesize statusItem;

-(void) applicationDidFinishLaunching:(NSNotification *)notification {
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    self.statusItem.title = @"dwarf clip";
    MainMenu *menu = [[MainMenu alloc] init];
    menu.quitItem.target = self;
    menu.quitItem.action = @selector(quit:);
    self.statusItem.menu = menu;
}

-(IBAction) quit:(id)sender {
    [NSApp terminate:self];
}

@end
