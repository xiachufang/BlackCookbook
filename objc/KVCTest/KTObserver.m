//
//  KTObserver.m
//  KVCTest
//
//  Created by March Liu on 12-2-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "KTObserver.h"

@implementation KTObserver

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSLog(@"the sender's value from %@ change to %@", 
          [change objectForKey:NSKeyValueChangeOldKey],
          [change objectForKey:NSKeyValueChangeNewKey]);
}

@end
