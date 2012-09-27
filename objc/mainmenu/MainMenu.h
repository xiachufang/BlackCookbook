/* -*- mode:objc -*- */
#import <Cocoa/Cocoa.h>

@interface MainMenu:NSMenu {

}

@property (strong, nonatomic) IBOutlet NSMenuItem* quitItem;
@property (strong, nonatomic) IBOutlet NSMenuItem* aboutItem;

@end
