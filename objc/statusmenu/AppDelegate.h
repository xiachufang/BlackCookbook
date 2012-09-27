/* -*- mode:objc -*- */

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (strong, nonatomic) IBOutlet NSStatusItem *statusItem;

-(IBAction) quit:(id)sender;

@end
