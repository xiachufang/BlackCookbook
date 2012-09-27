/* -*- mode:objc -*- */
#import "MainMenu.h"

@implementation MainMenu
@synthesize quitItem, aboutItem;

-(id) init {
    // the title will be ignore
    self = [super initWithTitle:@"Main Menu"];
    if(self){
        // NSMenu.menuBarVisible = YES;

        // this title will be ignore too
        NSMenuItem * appItem = [[NSMenuItem alloc] initWithTitle:@"App Item" action:Nil keyEquivalent:@""];
        [self addItem:appItem];
        // this title will be ignore too
        NSMenu *appMenu = [[NSMenu alloc] initWithTitle:@"application"];
        self.aboutItem  = [[NSMenuItem alloc] initWithTitle:@"about" action:Nil keyEquivalent:@""];
        [appMenu addItem:self.aboutItem];
        [appMenu addItem:[NSMenuItem separatorItem]];
        self.quitItem = [[NSMenuItem alloc] initWithTitle:@"quit" action:Nil keyEquivalent:@""];
        [appMenu addItem:self.quitItem];
        [self setSubmenu:appMenu forItem:appItem];

        // this title will be ignore too
        NSMenuItem * windowItem = [[NSMenuItem alloc] initWithTitle:@"Window Item" action:Nil keyEquivalent:@""];
        [self addItem:windowItem];
        NSMenu *windowMenu = [[NSMenu alloc] initWithTitle:@"window"];
        [windowMenu addItemWithTitle:@"hide me" action:Nil keyEquivalent:@""];
        [windowMenu addItemWithTitle:@"hide others" action:Nil keyEquivalent:@""];
        [self setSubmenu:windowMenu forItem:windowItem];
    }
    return self;
}

@end
