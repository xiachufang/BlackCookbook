/* -*- mode: objc -*- */
#import "myView.h"

@implementation myView

-(void) drawRect:(NSRect)rect {
    NSBezierPath *path = [NSBezierPath bezierPathWithRect:NSMakeRect(10, 10, 180, 180)];
    [[NSColor greenColor] set];
    [path fill];
	NSLog(@"myView: drawRect:");
}

@end
