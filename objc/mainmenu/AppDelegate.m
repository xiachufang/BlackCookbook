/* -*- mode:objc -*- */

#import "AppDelegate.h"
#import "MainMenu.h"

@implementation AppDelegate

-(void) applicationDidFinishLaunching:(NSNotification *)notification {
    NSApplication *app = [NSApplication sharedApplication];
    MainMenu *mainMenu = [[MainMenu alloc] init];
    
    mainMenu.quitItem.target = self;
    mainMenu.quitItem.action = @selector(quit:);

    app.mainMenu = mainMenu;
}

-(IBAction) quit:(id)sender {
    [NSApp terminate:self];
}

@end
